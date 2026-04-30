import { useMemo, useState, useEffect, useRef } from "react";
import { MessageCircle, X, Send, User, Users, Facebook, Instagram, Search, Paperclip, Smile, UserCheck, ArrowLeft, Lock } from "lucide-react";
import { motion, AnimatePresence } from "motion/react";
import { io } from "socket.io-client";
import { Button } from "./ui/button";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export function EmployeeMessenger() {
    const [isOpen, setIsOpen] = useState(false);
    const [activeTab, setActiveTab] = useState("messages");
    const [newMessage, setNewMessage] = useState("");
    const [searchTerm, setSearchTerm] = useState("");
    const socketRef = useRef(null);
    const scrollRef = useRef(null);
    const fileInputRef = useRef(null);
    const [messages, setMessages] = useState([]);
    const [conversations, setConversations] = useState([]);
    const [selectedConversationId, setSelectedConversationId] = useState(null);
    const [showEmojiPicker, setShowEmojiPicker] = useState(false);

    const commonEmojis = [
        '😀','😂','😍','👍','🙏','🎉','😅','😎','🤔','😢'
    ];
    const [menuOpenFor, setMenuOpenFor] = useState(null);
    const longPressTimerRef = useRef(null);
    const reactionOptions = ['👍', '❤️', '✊', '😠', '😢'];

    // --- DONNÉES DÉRIVÉES (Déplacées ici pour éviter l'erreur d'initialisation) ---

    const getAudience = (type) => {
        return type === "interne" ? "employee" : "client";
    };

    const currentUser = useMemo(() => JSON.parse(localStorage.getItem("assurance-auth-user")), [isOpen]);

    // Filtrage des conversations selon tes règles
    const pooledConversations = useMemo(() => {
        // Conversations non assignées (Pool)
        return conversations.filter(c => !c.assignedTo && (c.type === 'client' || String(c.id) === String(c.clientId)));
    }, [conversations]);

    const myConversations = useMemo(() => {
        // Conversations assignées à l'employé actuel
        return conversations.filter(c => String(c.assignedTo) === String(currentUser?.id));
    }, [conversations, currentUser]);

    const othersConversations = useMemo(() => {
        // Conversations assignées à d'autres employés
        return conversations.filter(c => 
            c.assignedTo && 
            String(c.assignedTo) !== String(currentUser?.id) &&
            c.type !== "interne"
        );
    }, [conversations, currentUser]);

    const internalConversations = useMemo(() => {
        return conversations.filter(c => c.type === "interne");
    }, [conversations]);

    const filteredPooled = useMemo(() => {
        return pooledConversations.filter(c => 
            c.name.toLowerCase().includes(searchTerm.toLowerCase())
        );
    }, [pooledConversations, searchTerm]);

    const filteredMy = useMemo(() => {
        return myConversations.filter(c => 
            c.name.toLowerCase().includes(searchTerm.toLowerCase())
        );
    }, [myConversations, searchTerm]);

    const filteredOthers = useMemo(() => {
        return othersConversations.filter(c => 
            c.name.toLowerCase().includes(searchTerm.toLowerCase())
        );
    }, [othersConversations, searchTerm]);

    const filteredInternal = useMemo(() => {
        return internalConversations.filter(c => 
            c.name.toLowerCase().includes(searchTerm.toLowerCase())
        );
    }, [internalConversations, searchTerm]);

    // Calcul des notifications par onglet
    const pooledUnread = useMemo(() => pooledConversations.reduce((s, c) => s + (c.unread || 0), 0), [pooledConversations]);
    const myUnread = useMemo(() => myConversations.reduce((s, c) => s + (c.unread || 0), 0), [myConversations]);
    const internalUnread = useMemo(() => internalConversations.reduce((s, c) => s + (c.unread || 0), 0), [internalConversations]);

    const selectedConversation = useMemo(() => {
        if (!selectedConversationId) return null;
        // On cherche par ID ou par ClientID pour le pool
        return conversations.find((conv) => String(conv.id) === String(selectedConversationId) || String(conv.clientId) === String(selectedConversationId)) || null;
    }, [conversations, selectedConversationId]);

    const selectedMessages = useMemo(() => {
        if (!selectedConversation) {
            return [];
        }
        const user = JSON.parse(localStorage.getItem('assurance-auth-user') || 'null');
        return messages.filter((message) => String(message.conversationId) === String(selectedConversation.id) && !(Array.isArray(message.removed_for) && message.removed_for.includes(user?.id)));
    }, [messages, selectedConversation]);

    const isUnassigned = useMemo(() => {
        if (!selectedConversation) return false;
        // Si l'ID est identique au ClientID et qu'il n'y a pas d'assignation
        return String(selectedConversation.id) === String(selectedConversation.clientId) && !selectedConversation.assignedTo;
    }, [selectedConversation]);

    useEffect(() => {
        if (isOpen && !socketRef.current) {
            const token = localStorage.getItem("assurance-auth-token");
            if (!token) return;

            const socket = io(API_URL, { 
                auth: { token },
                transports: ['websocket']
            });
            socketRef.current = socket; // Assign socket to ref immediately
            const currentUser = JSON.parse(localStorage.getItem("assurance-auth-user"));

            // Fetch initial conversation list from the API so the employee sees the authoritative list
            (async () => {
                try {
                    const res = await fetch(`${API_URL}/api/messages/conversations/all`, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': `Bearer ${token}`
                        }
                    });
                    if (res.ok) {
                        const body = await res.json();
                        const payload = body.data || body;
                        const list = (Array.isArray(payload) ? payload : (payload.conversations || [])).map((c) => {
                            // Determine the 'other' participant id and name
                            const otherId = String(c.participant_one) === String(currentUser?.id) ? c.participant_two : c.participant_one;
                            return {
                                id: String(c.id),
                                name: c.other_participant_name || c.participant_one_name || c.participant_two_name || 'Contact',
                                avatar: c.other_participant_image || c.participant_one_image || c.participant_two_image || null,
                                lastMessage: c.last_message || '',
                                time: c.last_message_at || '',
                                unread: parseInt(c.unread_count || 0),
                                type: c.type || 'client',
                                online: true,
                                image: c.other_participant_image || null,
                                clientId: c.clientId || otherId,
                                assignedTo: c.assignedTo,
                                assignedToName: c.assignedToName,
                                participant_one: c.participant_one,
                                participant_two: c.participant_two
                            };
                        });
                        setConversations(list);
                    } else {
                        console.warn('Failed to load conversations for employee', await res.text());
                    }
                } catch (e) {
                    console.error('Error fetching conversations:', e);
                }
            })();

            socket.on("conversation_claimed_success", (data) => {
                const newConvId = String(data.id);
                const oldClientId = String(data.clientId);

                // 1. Mise à jour de la liste des conversations
                setConversations(prev => prev.map(c => 
                    String(c.clientId) === oldClientId || String(c.id) === oldClientId
                    ? { ...c, id: newConvId, assignedTo: data.assignedTo || currentUser?.id } 
                    : c
                ));

                // 2. Migration des messages locaux vers le nouvel UUID pour qu'ils ne disparaissent pas de l'écran
                setMessages(prev => prev.map(m => 
                    String(m.conversationId) === oldClientId 
                    ? { ...m, conversationId: newConvId } 
                    : m
                ));

                // 3. Changement de la sélection active vers le nouvel UUID
                setSelectedConversationId(newConvId);
            });

            socket.on("connect_error", (err) => {
                console.error("Erreur de connexion socket (employee messenger):", err);
                try {
                    const msg = err && (err.message || String(err));
                    if (msg && String(msg).toLowerCase().includes('authentication error')) {
                        console.warn("Authentication error with employee messenger socket. Clearing token and redirecting to login.");
                        try { localStorage.removeItem("assurance-auth-token"); } catch (e) {}
                        try { localStorage.removeItem("assurance-refresh-token"); } catch (e) {}
                        try { socket.disconnect(); } catch (e) {}
                        try { delete window.__MAMA_SOCKET; } catch (e) {}
                        window.location.href = '/login';
                    }
                } catch (e) {
                    console.error('Error handling employee messenger connect_error:', e);
                }
            });

            socket.on("conversation_claimed", (data) => {
                setConversations(prev => {
                    const exists = prev.find(c => String(c.clientId) === String(data.clientId));
                    if (exists) {
                        // Si c'est la conversation que j'ai actuellement ouverte, je mets à jour mon ID sélectionné
                        if (String(selectedConversationId) === String(data.clientId) || String(selectedConversationId) === "support-general") {
                            setSelectedConversationId(String(data.newId));
                        }
                        return prev.map(c => 
                            String(c.clientId) === String(data.clientId) 
                            ? { ...c, id: String(data.newId), assignedTo: data.assignedTo, assignedToName: data.assignedToName } 
                            : c
                        );
                    }
                    return prev;
                });
            });

            socket.on("remove_client_from_pool", (data) => {
                setConversations(prev => prev.map(c => 
                    String(c.clientId) === String(data.clientId) 
                    ? { ...c, assignedTo: data.assignedTo, assignedToName: data.assignedToName } 
                    : c
                ));
            });

            socket.on("receive_message", (msg) => {
                
                if (msg.sender_id === currentUser?.id) return;

                // Correction de la détection du Pool (certains sockets renvoient conversationId ou conversation_id)
                const cId = msg.conversation_id || msg.conversationId;
                const isPoolMessage = !cId || cId === "support-general";
                const convId = isPoolMessage ? String(msg.sender_id) : String(cId);

                const uiMsg = { 
                    ...msg, 
                    conversationId: convId,
                    isMe: false 
                };
                setMessages(prev => [...prev, uiMsg]);
                
                // Mettre à jour ou créer la conversation dans la liste
                setConversations(prev => {
                    const exists = prev.find(c => String(c.id) === convId || String(c.clientId) === String(msg.sender_id));
                    if (exists) {
                        return prev.map(c => (c.id === exists.id ? { ...c, lastMessage: msg.content, time: "Maintenant", unread: (c.unread || 0) + 1 } : c));
                    }
                    return [{
                        id: isPoolMessage ? String(msg.sender_id) : String(msg.conversation_id),
                        name: msg.sender_name || "Client",
                        avatar: msg.sender_name ? msg.sender_name.charAt(0) : "C",
                        lastMessage: msg.content,
                        time: "Maintenant",
                        unread: 1,
                        type: "client",
                        online: true,
                        image: msg.sender_image,
                        clientId: msg.sender_id,
                        assignedTo: msg.assigned_to // Information venant du back
                    }, ...prev];
                });
            });
            socket.on("message_sent", (msg) => {
                const cId = msg.conversationId || msg.conversation_id || msg.ui_conversation_id;
                const uiMsg = { ...msg, conversationId: String(cId), isMe: true };
                setMessages(prev => [...prev, uiMsg]);
            });

            socket.on('message_reacted', (updated) => {
                setMessages(prev => prev.map(m => m.id === updated.id ? { ...m, reactions: updated.reactions } : m));
            });

            socket.on('message_deleted', (updated) => {
                setMessages(prev => prev.map(m => m.id === updated.id ? { ...m, deleted: true } : m));
            });

            socket.on('message_removed_for_you', ({ messageId }) => {
                setMessages(prev => prev.filter(m => m.id !== messageId));
            });
        }

        return () => {
            if (socketRef.current) {
                socketRef.current.disconnect();
                socketRef.current = null;
            }
        };
    }, [isOpen]);

    // Auto-scroll au plus bas quand les messages changent ou qu'on change de conv
    useEffect(() => {
        if (scrollRef.current) {
            scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
        }
    }, [selectedMessages]);

    // Close contextual menu when switching conversation
    useEffect(() => {
        setMenuOpenFor(null);
    }, [selectedConversationId]);

    useEffect(() => {
        if (selectedConversationId && String(selectedConversationId) !== "null" && String(selectedConversationId) !== "undefined") {
            const fetchHistory = async () => {
                const token = localStorage.getItem("assurance-auth-token");
                const res = await fetch(`${API_URL}/api/messages/history/${selectedConversationId}`, {
                    headers: { 'Authorization': `Bearer ${token}` }
                });
                if (res.ok) {
                    const body = await res.json();
                    const user = JSON.parse(localStorage.getItem("assurance-auth-user"));
                    
                    const history = body.data.map(m => ({
                        ...m,
                        isMe: m.sender_id === user?.id,
                        // Mapper l'ID pour que le filtre local fonctionne (pool ou conv)
                        conversationId: m.conversation_id || String(m.sender_id)
                    }));

                    setMessages(prev => {
                        const otherMsgs = prev.filter(m => String(m.conversationId) !== String(selectedConversationId));
                        return [...otherMsgs, ...history];
                    });
                }
            };
            fetchHistory();
        }
    }, [selectedConversationId]);

    // Close contextual menu when changing conversation
    useEffect(() => {
        setMenuOpenFor(null);
    }, [selectedConversationId]);

    const handleSelectConversation = (conv) => {
        setSelectedConversationId(conv.id);

        // 1. Remettre le compteur de messages non lus à 0 localement
        setConversations(prev => prev.map(c => 
            String(c.id) === String(conv.id) ? { ...c, unread: 0 } : c
        ));

        // 2. Notifier le serveur pour mettre à jour la base de données
        if (socketRef.current) {
            socketRef.current.emit("mark_read", { 
                conversationId: conv.id,
                clientId: conv.clientId 
            });
        }
    };

    const isLocked = useMemo(() => {
        if (!selectedConversation) return false;
        const userStr = localStorage.getItem("assurance-auth-user");
        if (!userStr) return false;
        const currentUser = JSON.parse(userStr);
        
        // Verrouillage : Si la conversation a un assignedTo et que ce n'est pas MOI
        if (selectedConversation.assignedTo && String(selectedConversation.assignedTo) !== String(currentUser.id)) {
            return true;
        }
        return false;
    }, [selectedConversation]);

    // Fonction pour gérer le clic sur une conversation/client
    const handleClaim = () => {
        if (selectedConversation && socketRef.current) {
            socketRef.current.emit("claim_conversation", { clientId: selectedConversation.clientId });
            setSelectedConversationId(selectedConversation.id);
        }
    };

    // Ajout d'une fonction pour fermer la conversation (bouton retour)
    const handleCloseConversation = (e) => {
        e?.stopPropagation();
        setSelectedConversationId(null);
        setNewMessage("");
    };

    const handleSendMessage = (e, fileData = null) => {
        if (e) e.preventDefault();
        if (!newMessage.trim() && !fileData || !socketRef.current || isLocked) return;

        const payload = {
            content: newMessage,
            conversationId: selectedConversation.id,
            recipientId: selectedConversation.clientId,
            clientId: selectedConversation.clientId // Requis pour le "claim" côté back
        };

        if (fileData) {
            payload.fileUrl = fileData.fileUrl;
            payload.fileType = fileData.fileType;
        }

        socketRef.current.emit("send_message", payload);
        setNewMessage("");
        setShowEmojiPicker(false);
    };

    const handleFileChange = async (e) => {
        const file = e.target.files[0];
        if (!file) return;

        const formData = new FormData();
        formData.append("file", file);

        try {
            const token = window.localStorage.getItem("assurance-auth-token");
            const res = await fetch(`${API_URL}/api/messages/upload`, {
                method: "POST",
                headers: { 'Authorization': `Bearer ${token}` },
                body: formData
            });

            if (res.ok) {
                const body = await res.json();
                handleSendMessage(null, body.data);
            }
        } catch (err) {
            console.error("Upload failed", err);
        }
    };

    const getTotalUnread = () => {
        return conversations.reduce((sum, conv) => sum + conv.unread, 0);
    };

    const getTypeIcon = (type) => {
        switch (type) {
            case "facebook":
                return Facebook;
            case "instagram":
                return Instagram;
            case "interne":
                return Users;
            default:
                return User;
        }
    };

    const getTypeColor = (type) => {
        switch (type) {
            case "facebook":
                return "bg-blue-600";
            case "instagram":
                return "bg-gradient-to-br from-pink-500 to-orange-400";
            case "interne":
                return "bg-emerald-600";
            default:
                return "bg-sky-600";
        }
    };

    const getTypeLabel = (type) => {
        switch (type) {
            case "facebook":
                return "Client social";
            case "instagram":
                return "Client social";
            case "interne":
                return "Employe";
            default:
                return "Client";
        }
    };

    return (
        <>
            <motion.button
                className="fixed bottom-6 right-6 z-50 flex h-14 w-14 items-center justify-center rounded-full bg-gradient-to-r from-blue-600 to-cyan-500 text-white shadow-lg transition-transform hover:scale-110"
                onClick={() => setIsOpen(!isOpen)}
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.95 }}
            >
                <MessageCircle className="h-6 w-6" />
                {getTotalUnread() > 0 && (
                    <span className="absolute -right-1 -top-1 flex h-6 w-6 items-center justify-center rounded-full bg-red-500 text-xs font-bold text-white">
                        {getTotalUnread()}
                    </span>
                )}
            </motion.button>

            <AnimatePresence>
                {isOpen && (
                    <motion.div
                        initial={{ opacity: 0, y: 20, scale: 0.95 }}
                        animate={{ opacity: 1, y: 0, scale: 1 }}
                        exit={{ opacity: 0, y: 20, scale: 0.95 }}
                        className="fixed bottom-24 right-3 z-50 flex w-[calc(100vw-1.5rem)] max-w-[26rem] flex-col overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-2xl sm:right-6"
                        style={{ height: "min(42rem, calc(100vh - 8rem))" }}
                    >
                        <div className="bg-gradient-to-r from-blue-600 to-cyan-500 p-4 text-white">
                            <div className="mb-3 flex items-center justify-between">
                                <h3 className="text-lg font-semibold">Messagerie</h3>
                                <button
                                    onClick={() => setIsOpen(false)}
                                    className="rounded-full p-1 transition-colors hover:bg-white/20"
                                >
                                    <X className="h-5 w-5" />
                                </button>
                            </div>

                            <div className="flex gap-1">
                                <button
                                    onClick={() => setActiveTab("messages")}
                                    className={`relative flex-1 rounded-lg px-2 py-2 text-[10px] uppercase tracking-wider font-bold transition-colors ${activeTab === "messages" ? "bg-white/20" : "hover:bg-white/10"}`}
                                >
                                    Nouveaux
                                    {pooledUnread > 0 && (
                                        <span className="absolute -top-1 -right-1 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-[8px] text-white animate-pulse">
                                            {pooledUnread}
                                        </span>
                                    )}
                                </button>
                                <button
                                    onClick={() => setActiveTab("assigned")}
                                    className={`relative flex-1 rounded-lg px-2 py-2 text-[10px] uppercase tracking-wider font-bold transition-colors ${activeTab === "assigned" ? "bg-white/20" : "hover:bg-white/10"}`}
                                >
                                    Pris en charge
                                    {myUnread > 0 && (
                                        <span className="absolute -top-1 -right-1 flex h-4 w-4 items-center justify-center rounded-full bg-blue-400 text-[8px] text-white">
                                            {myUnread}
                                        </span>
                                    )}
                                </button>
                                <button
                                    onClick={() => setActiveTab("others")}
                                    className={`flex-1 rounded-lg px-2 py-2 text-[10px] uppercase tracking-wider font-bold transition-colors ${activeTab === "others" ? "bg-white/20" : "hover:bg-white/10"}`}
                                >
                                    Autres
                                </button>
                                <button
                                    onClick={() => setActiveTab("contacts")}
                                    className={`relative flex-1 rounded-lg px-2 py-2 text-[10px] uppercase tracking-wider font-bold transition-colors ${activeTab === "contacts" ? "bg-white/20" : "hover:bg-white/10"}`}
                                >
                                    Interne
                                    {internalUnread > 0 && (
                                        <span className="absolute -top-1 -right-1 flex h-4 w-4 items-center justify-center rounded-full bg-emerald-400 text-[8px] text-white">
                                            {internalUnread}
                                        </span>
                                    )}
                                </button>
                            </div>
                        </div>

                        <div className="border-b border-gray-200 p-3">
                            <div className="relative">
                                <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-gray-400" />
                                <input
                                    type="text"
                                    placeholder="Rechercher..."
                                    value={searchTerm}
                                    onChange={(e) => setSearchTerm(e.target.value)}
                                    className="w-full rounded-lg bg-gray-100 py-2 pl-10 pr-4 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                                />
                            </div>
                        </div>

                        <div className="flex-1 min-h-0 overflow-hidden">
                            <AnimatePresence mode="wait">
                                {selectedConversationId ? (
                                    <motion.div 
                                        key="chat-window"
                                        initial={{ x: 20, opacity: 0 }}
                                        animate={{ x: 0, opacity: 1 }}
                                        exit={{ x: -20, opacity: 0 }}
                                        className="flex h-full flex-col"
                                    >
                                        <div className="flex items-center gap-2 border-b border-gray-100 bg-gray-50 p-2">
                                            <button onClick={handleCloseConversation} className="p-1 hover:bg-gray-200 rounded-full">
                                                <ArrowLeft className="h-4 w-4 text-gray-600" />
                                            </button>
                                            <div className="flex-1 min-w-0">
                                                <p className="truncate text-sm font-bold">{selectedConversation.name}</p>
                                                <p className="text-[10px] text-gray-500">{getTypeLabel(selectedConversation.type)}</p>
                                            </div>
                                            {isLocked && <Lock className="h-4 w-4 text-amber-500" title="Pris par un collègue" />}
                                        </div>

                                        <div ref={scrollRef} className="flex-1 overflow-y-auto p-4 space-y-3">
                                            {isUnassigned && (
                                                <div className="bg-blue-50 border border-blue-100 p-3 rounded-lg text-center">
                                                    <p className="text-xs text-blue-700 mb-2">Ce client attend une réponse.</p>
                                                    <Button size="sm" onClick={handleClaim} className="w-full bg-blue-600">Prendre en charge</Button>
                                                </div>
                                            )}
                                            {selectedMessages.map((msg, idx) => (
                                                <div key={idx} className={`flex items-start ${msg.isMe ? "justify-end" : "justify-start"}`}>
                                                    {/* Menu button on left for incoming messages */}
                                                    {!msg.isMe && (
                                                        <div className="flex items-start mr-2">
                                                            <div className="relative">
                                                                <button type="button" onClick={(e) => { e.stopPropagation(); setMenuOpenFor(menuOpenFor === msg.id ? null : msg.id); }} className="text-gray-500 hover:bg-gray-200 rounded p-1 text-xs">
                                                                    ⋮
                                                                </button>
                                                                {menuOpenFor === msg.id && (
                                                                    <div className="mt-1 bg-white border border-gray-200 rounded shadow-md p-2 w-40 text-xs z-50">
                                                                        <div className="flex gap-1 mb-2">
                                                                            {reactionOptions.map(r => (
                                                                                <button key={r} onClick={() => { try { socketRef.current.emit('react_message', { messageId: msg.id, emoji: r }); } catch (e){} setMenuOpenFor(null); }} className="p-1 text-lg">{r}</button>
                                                                            ))}
                                                                        </div>
                                                                        <div className="flex flex-col gap-1">
                                                                            <button onClick={() => { setNewMessage(p => `RE: ${msg.content || ''}\n${p}`); setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Répondre</button>
                                                                            {msg.isMe && <button onClick={() => { try { socketRef.current.emit('delete_message', { messageId: msg.id }); } catch (e){} setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Suppr. tous</button>}
                                                                            <button onClick={() => { try { socketRef.current.emit('remove_message_for_user', { messageId: msg.id }); } catch (e){} setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Retirer</button>
                                                                            {!msg.isMe && <button onClick={() => { /* non-persistent edit fallback */ setNewMessage(msg.content || ''); setEditingMessageId(msg.id); setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Modifier</button>}
                                                                        </div>
                                                                    </div>
                                                                )}
                                                            </div>
                                                        </div>
                                                    )}

                                                    <div
                                                        className={`max-w-[85%] rounded-2xl px-3 py-1.5 text-sm ${msg.isMe ? "bg-blue-600 text-white" : "bg-gray-100 text-gray-800"}`}
                                                        onMouseDown={() => { longPressTimerRef.current = setTimeout(() => setMenuOpenFor(msg.id), 600); }}
                                                        onMouseUp={() => { clearTimeout(longPressTimerRef.current); }}
                                                        onMouseLeave={() => { clearTimeout(longPressTimerRef.current); }}
                                                        onTouchStart={() => { longPressTimerRef.current = setTimeout(() => setMenuOpenFor(msg.id), 600); }}
                                                        onTouchEnd={() => { clearTimeout(longPressTimerRef.current); }}
                                                    >
                                                        {msg.deleted ? <div className="italic text-sm text-gray-500">Message supprimé</div> : (msg.content && <div>{msg.content}</div>)}
                                                        {msg.file_url && (
                                                            <div className="mt-1 overflow-hidden rounded-lg">
                                                                {msg.file_type?.startsWith("image/") ? (
                                                                    <img src={`${API_URL}${msg.file_url}`} alt="PJ" className="max-w-full h-auto cursor-pointer hover:opacity-90" onClick={() => window.open(`${API_URL}${msg.file_url}`)} />
                                                                ) : (
                                                                    <a href={`${API_URL}${msg.file_url}`} target="_blank" rel="noopener noreferrer" className="flex items-center gap-2 p-1 bg-black/10 rounded text-xs">
                                                                        <Paperclip className="h-3 w-3" /> Fichier joint
                                                                    </a>
                                                                )}
                                                            </div>
                                                        )}

                                                        <div className="mt-1 text-xs text-gray-500">{msg.time}</div>
                                                    </div>

                                                    {/* Menu button on right for outgoing messages */}
                                                    {msg.isMe && (
                                                        <div className="flex items-start ml-2">
                                                            <div className="relative">
                                                                <button type="button" onClick={(e) => { e.stopPropagation(); setMenuOpenFor(menuOpenFor === msg.id ? null : msg.id); }} className="text-gray-100 hover:bg-white/20 rounded p-1 text-xs">
                                                                    ⋮
                                                                </button>
                                                                {menuOpenFor === msg.id && (
                                                                    <div className="mt-1 bg-white border border-gray-200 rounded shadow-md p-2 w-40 text-xs z-50">
                                                                        <div className="flex gap-1 mb-2">
                                                                            {reactionOptions.map(r => (
                                                                                <button key={r} onClick={() => { try { socketRef.current.emit('react_message', { messageId: msg.id, emoji: r }); } catch (e){} setMenuOpenFor(null); }} className="p-1 text-lg">{r}</button>
                                                                            ))}
                                                                        </div>
                                                                        <div className="flex flex-col gap-1">
                                                                            <button onClick={() => { setNewMessage(p => `RE: ${msg.content || ''}\n${p}`); setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Répondre</button>
                                                                            {msg.isMe && <button onClick={() => { try { socketRef.current.emit('delete_message', { messageId: msg.id }); } catch (e){} setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Suppr. tous</button>}
                                                                            <button onClick={() => { try { socketRef.current.emit('remove_message_for_user', { messageId: msg.id }); } catch (e){} setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Retirer</button>
                                                                            {msg.isMe && <button onClick={() => { setNewMessage(msg.content || ''); setEditingMessageId(msg.id); setMenuOpenFor(null); }} className="text-left w-full p-1 hover:bg-gray-100 rounded text-xs">Modifier</button>}
                                                                        </div>
                                                                    </div>
                                                                )}
                                                            </div>
                                                        </div>
                                                    )}
                                                </div>
                                            ))}
                                        </div>

                                        <form onSubmit={handleSendMessage} className="p-3 border-t border-gray-100 flex gap-2 items-center">
                                            <input type="file" ref={fileInputRef} onChange={handleFileChange} className="hidden" />
                                            <button type="button" onClick={() => fileInputRef.current?.click()} className="text-gray-400 hover:text-blue-600 transition-colors">
                                                <Paperclip className="h-5 w-5" />
                                            </button>
                                            <div className="relative">
                                                <button type="button" onClick={() => setShowEmojiPicker(!showEmojiPicker)} className="text-gray-400 hover:text-blue-600 transition-colors">
                                                    <Smile className="h-5 w-5" />
                                                </button>
                                                {showEmojiPicker && (
                                                    <div className="absolute bottom-12 left-0 bg-white border border-gray-200 rounded-lg shadow-xl p-2 z-50" style={{ width: 220 }}>
                                                        <div className="grid grid-cols-5 gap-2 max-h-40 overflow-y-auto p-1">
                                                            {commonEmojis.map(emoji => (
                                                                <button
                                                                    key={emoji}
                                                                    type="button"
                                                                    onClick={() => setNewMessage(p => p + emoji)}
                                                                    title={`Insert ${emoji}`}
                                                                    aria-label={`Insert ${emoji}`}
                                                                    className="hover:bg-gray-100 p-2 rounded text-2xl flex items-center justify-center"
                                                                >
                                                                    {emoji}
                                                                </button>
                                                            ))}
                                                        </div>
                                                    </div>
                                                )}
                                            </div>
                                            <input 
                                                disabled={isLocked || isUnassigned}
                                                value={newMessage}
                                                onChange={e => setNewMessage(e.target.value)}
                                                placeholder={isLocked ? "Discussion verrouillée" : isUnassigned ? "Prenez en charge pour répondre" : "Votre message..."}
                                                className="flex-1 bg-gray-50 rounded-full px-4 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-blue-400 disabled:opacity-50"
                                            />
                                            <button disabled={(!newMessage.trim() && !fileInputRef.current?.value) || isLocked || isUnassigned} className="bg-blue-600 text-white p-2 rounded-full disabled:opacity-30">
                                                <Send className="h-4 w-4" />
                                            </button>
                                        </form>
                                    </motion.div>
                                ) : (
                                    <div className="flex h-full flex-col overflow-y-auto">
                                        <motion.div key="list" initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="divide-y divide-gray-100">
                                            {activeTab === "messages" && (
                                                <div>
                                                    <p className="px-4 py-2 text-[10px] font-bold text-amber-600 uppercase tracking-wider bg-amber-50/50">Nouveaux messages (Pool)</p>
                                                    {filteredPooled.length === 0 && <p className="p-8 text-center text-xs text-gray-400">Aucun nouveau message.</p>}
                                                    {filteredPooled.map((conv) => (
                                                        <button key={conv.id} onClick={() => handleSelectConversation(conv)} className="flex w-full items-center gap-3 p-3 text-left hover:bg-amber-50 transition-colors">
                                                            <div className="h-10 w-10 rounded-full bg-amber-500 flex items-center justify-center text-white text-xs font-bold">{conv.avatar || "C"}</div>
                                                            <div className="flex-1 min-w-0">
                                                                <div className="flex justify-between items-center">
                                                                    <p className="text-sm font-bold truncate">{conv.name}</p>
                                                                    <span className="text-[10px] text-amber-600 font-bold">À PRENDRE</span>
                                                                </div>
                                                                <p className="text-xs text-gray-500 truncate">{conv.lastMessage}</p>
                                                            </div>
                                                        </button>
                                                    ))}
                                                </div>
                                            )}
                                            {activeTab === "assigned" && (
                                                <div>
                                                    <p className="px-4 py-2 text-[10px] font-bold text-blue-600 uppercase tracking-wider bg-blue-50/50">Mes dossiers en cours</p>
                                                    {filteredMy.length === 0 && <p className="p-8 text-center text-xs text-gray-400">Aucune conversation prise en charge.</p>}
                                                    {filteredMy.map((conv) => (
                                                        <button key={conv.id} onClick={() => handleSelectConversation(conv)} className="flex w-full items-center gap-3 p-3 text-left transition-colors hover:bg-gray-50">
                                                            <div className="relative">
                                                                <div className={`flex h-12 w-12 items-center justify-center rounded-full text-white font-medium ${getTypeColor(conv.type)}`}>{conv.avatar}</div>
                                                                {conv.online && <div className="absolute bottom-0 right-0 h-3 w-3 rounded-full border-2 border-white bg-green-500"></div>}
                                                            </div>
                                                            <div className="min-w-0 flex-1">
                                                                <div className="flex items-center justify-between gap-2">
                                                                    <p className="truncate text-sm font-medium text-gray-900">{conv.name}</p>
                                                                    <span className="text-xs text-gray-500">{conv.time}</span>
                                                                </div>
                                                                <div className="mt-1 flex items-center justify-between gap-2">
                                                                    <p className="truncate text-sm text-gray-500">{conv.lastMessage}</p>
                                                                    {conv.unread > 0 && <span className="flex h-5 w-5 items-center justify-center rounded-full bg-blue-600 text-xs font-bold text-white">{conv.unread}</span>}
                                                                </div>
                                                            </div>
                                                        </button>
                                                    ))}
                                                </div>
                                            )}
                                            {activeTab === "others" && (
                                                <div>
                                                    <p className="px-4 py-2 text-[10px] font-bold text-gray-500 uppercase tracking-wider bg-gray-50">Assignés aux collègues</p>
                                                    {filteredOthers.length === 0 && <p className="p-8 text-center text-xs text-gray-400">Aucune autre prise en charge.</p>}
                                                    {filteredOthers.map((conv) => (
                                                        <div key={conv.id} className="flex w-full items-center gap-3 p-3 text-left opacity-60 grayscale-[0.3] cursor-not-allowed">
                                                            <div className="relative">
                                                                <div className={`flex h-12 w-12 items-center justify-center rounded-full text-white font-medium ${getTypeColor(conv.type)}`}>{conv.avatar}</div>
                                                            </div>
                                                            <div className="min-w-0 flex-1">
                                                                <div className="flex items-center justify-between gap-2">
                                                                    <p className="truncate text-sm font-medium text-gray-900">{conv.name}</p>
                                                                </div>
                                                                <p className="text-[10px] text-amber-600 font-bold uppercase mt-1">Géré par : {conv.assignedToName || "Un collègue"}</p>
                                                            </div>
                                                        </div>
                                                    ))}
                                                </div>
                                            )}
                                            {activeTab === "contacts" && (
                                                <div>
                                                    <p className="px-4 py-2 text-[10px] font-bold text-emerald-600 uppercase tracking-wider bg-emerald-50/50">Collaborateurs</p>
                                                    {filteredInternal.length === 0 && <p className="p-8 text-center text-xs text-gray-400">Aucun contact trouvé.</p>}
                                                    {filteredInternal.map((conv) => (
                                                        <button key={conv.id} onClick={() => handleSelectConversation(conv)} className="flex w-full items-center gap-3 p-3 text-left hover:bg-gray-50 transition-colors">
                                                            <div className="h-10 w-10 rounded-full bg-emerald-600 flex items-center justify-center text-white text-xs font-bold">{conv.avatar || "E"}</div>
                                                            <div className="flex-1 min-w-0">
                                                                <p className="text-sm font-medium text-gray-900">{conv.name}</p>
                                                                <p className="text-xs text-gray-500">Employé</p>
                                                            </div>
                                                        </button>
                                                    ))}
                                                </div>
                                            )}
                                        </motion.div>
                                    </div>
                                )}
                            </AnimatePresence>
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>
        </>
    );
}
