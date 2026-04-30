import { useState, useEffect, useRef } from "react";
import { MessageCircle, X, Send, Paperclip, Smile, Reply, Trash2, UserX } from "lucide-react";
import { motion, AnimatePresence } from "motion/react";
import { io } from "socket.io-client";
import { useAuthUser } from "../hooks/use-auth-user";
import { format } from "date-fns";

const API_URL = 'http://localhost:5000';

export function ClientMessenger() {
    const [isOpen, setIsOpen] = useState(false);
    const [messages, setMessages] = useState([]);
    const [counselor, setCounselor] = useState(null);
    const [counselorId, setCounselorId] = useState(null);
    const [activeConversationId, setActiveConversationId] = useState("support-general");
    const [replyingTo, setReplyingTo] = useState(null);
    const [newMessage, setNewMessage] = useState("");
    const [isConnected, setIsConnected] = useState(false);
    const [showEmojiPicker, setShowEmojiPicker] = useState(false);
    const socketRef = useRef(null);
    const scrollRef = useRef(null);
    const fileInputRef = useRef(null);
    const user = useAuthUser();

    const commonEmojis = ["😊", "😂", "👍", "🙌", "❤️", "🔥", "🤔", "😮", "👋", "✅"];
    const reactionOptions = ['👍', '❤️', '✊', '😠', '😢'];
    const [menuOpenFor, setMenuOpenFor] = useState(null);
    const longPressTimerRef = useRef(null);

    // Safe JSON parse helper for fields that may be stored as JSON strings or arrays
    const safeParse = (input, fallback = []) => {
        try {
            if (!input && input !== 0) return fallback;
            if (Array.isArray(input)) return input;
            if (typeof input === 'string') {
                const trimmed = input.trim();
                if (!trimmed) return fallback;
                return JSON.parse(trimmed);
            }
            return input;
        } catch (e) {
            // swallow parse errors and return fallback
            return fallback;
        }
    };

    // Écouter l'événement personnalisé pour ouvrir le chat depuis n'importe où (ex: page contact)
    useEffect(() => {
        const handleOpenChat = () => setIsOpen(true);
        window.addEventListener("open-customer-chat", handleOpenChat);
        return () => window.removeEventListener("open-customer-chat", handleOpenChat);
    }, []);

    useEffect(() => {
        // Create a single persistent socket connection for the logged-in client user.
        // Avoid creating/destroying the socket repeatedly to prevent rapid connect/disconnect loops.
        if (user) {
            // If a socket already exists and is connected or in the process of connecting, skip
            if (socketRef.current && (socketRef.current.connected || socketRef.current.io?.isAlreadyConnected || socketRef.current.connecting)) {
                return;
            }
            // Récupération du jeton JWT.
            // Ce jeton doit être stocké dans localStorage par la page de connexion
            // après une authentification réussie avec le backend.
            // Exemple: localStorage.setItem("assurance-auth-token", response.accessToken);
            const token = window.localStorage.getItem("assurance-auth-token");

            if (!token) {
                console.error("Chat : Aucun jeton d'authentification trouvé.");
                return;
            }

            // Create socket but don't auto connect until handlers are set up to avoid race conditions
            // Reuse a global socket if available (helps during HMR / dev reloads)
            let socket = window.__MAMA_SOCKET;
            if (!socket) {
                socket = io(API_URL, {
                autoConnect: false,
                auth: { token: token },
                transports: ['websocket'],
                reconnectionAttempts: 5,
                reconnectionDelay: 1000,
                reconnectionDelayMax: 5000
                });
                // store globally for HMR/dev reuse
                try { window.__MAMA_SOCKET = socket; } catch (e) { /* ignore */ }
            }

            // Throttle connect logs to avoid flooding the console during HMR/dev reloads
            let connectedLogged = false;
            socket.on("connect", () => {
                if (!connectedLogged) {
                    console.log("Connecté au serveur de chat");
                    connectedLogged = true;
                }
                setIsConnected(true);
            });
            
            socket.on("connect_error", (err) => {
                console.error("Erreur de connexion socket:", err);
                setIsConnected(false);

                // If the server rejected the connection due to authentication, stop reconnecting
                try {
                    const msg = err && (err.message || String(err));
                    if (msg && String(msg).toLowerCase().includes('authentication error')) {
                        console.warn('Authentication error from socket, clearing local token and stopping reconnection attempts.');
                        try { window.localStorage.removeItem('assurance-auth-token'); } catch (e) {}
                        try { window.localStorage.removeItem('assurance-refresh-token'); } catch (e) {}
                        try { socket.disconnect(); } catch (e) {}
                        try { delete window.__MAMA_SOCKET; } catch (e) {}
                        try { window.location.assign('/login'); } catch (e) {}
                    }
                } catch (e) {
                    console.error('Error handling connect_error:', e);
                }
            });

            socket.on("disconnect", () => setIsConnected(false));
            
            socket.on("receive_message", (message) => {
                setMessages((prev) => [...prev, { ...message, isMe: false }]);
            });

            socket.on("message_sent", (message) => {
                setMessages((prev) => [...prev, { ...message, isMe: true }]);
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

            socket.on("remove_client_from_pool", (data) => {
                if (String(data.clientId) === String(user.id)) {
                    setCounselor(data.assignedToName);
                    setCounselorId(data.assignedTo);
                    if (data.conversationId) {
                        setActiveConversationId(data.conversationId);
                    }
                }
            });

            socketRef.current = socket;

            // Now that handlers are attached, initiate connection
            try {
                socket.connect();
            } catch (err) {
                console.error('Socket connect failed:', err);
            }
        }

        // Keep the socket alive until the component unmounts or the user changes (logout)
        return () => {
            if (socketRef.current) {
                try { socketRef.current.disconnect(); } catch (e) {}
                socketRef.current = null;
            }
        };
    }, [user?.email]); // Utilisation de l'email (stable) au lieu de l'objet user complet

    useEffect(() => {
        if (isOpen && user) {
            const fetchHistory = async () => {
                const token = window.localStorage.getItem("assurance-auth-token");
                const res = await fetch(`${API_URL}/api/messages/my-history`, {
                    headers: { 'Authorization': `Bearer ${token}` }
                });
                if (res.ok) {
                    const body = await res.json();
                    setMessages(body.data.map(m => ({
                        ...m, isMe: m.sender_id === user.id
                    })));
                }
            };
            fetchHistory();
        }
    }, [isOpen, user?.id]);

    // Filter out messages removed for this user when rendering by maintaining local state mapping
    // (we already remove them on receiving message_removed_for_you event)

    useEffect(() => {
        if (scrollRef.current) {
            scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
        }
    }, [messages]);

    // Close contextual menu when switching conversations
    useEffect(() => {
        setMenuOpenFor(null);
    }, [activeConversationId]);

    const handleSendMessage = (e, fileData = null, replyId = null) => {
        if (e) e.preventDefault();
        if (!newMessage.trim() && !fileData || !socketRef.current) return;

        const finalReplyId = replyId || (replyingTo ? replyingTo.id : null);

        const payload = {
            content: newMessage,
            conversationId: activeConversationId || "support-general", 
            recipientId: counselorId,
            replyTo: finalReplyId
        };

        if (fileData) {
            payload.fileUrl = fileData.fileUrl;
            payload.fileType = fileData.fileType;
        }

        socketRef.current.emit("send_message", payload);

        setNewMessage("");
        setReplyingTo(null);
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

    // If user not authenticated, show a chat button that redirects to login
    if (!user || user.role !== "client") {
        return (
            <motion.button
                className="fixed bottom-6 right-6 z-50 flex h-14 w-14 items-center justify-center rounded-full bg-primary text-white shadow-lg transition-transform hover:scale-110"
                onClick={() => window.location.assign('/login')}
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.95 }}
            >
                <MessageCircle className="h-6 w-6" />
            </motion.button>
        );
    }

    return (
        <>
            <motion.button
                className="fixed bottom-6 right-6 z-50 flex h-14 w-14 items-center justify-center rounded-full bg-primary text-white shadow-lg transition-transform hover:scale-110"
                onClick={() => setIsOpen(!isOpen)}
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.95 }}
            >
                <MessageCircle className="h-6 w-6" />
            </motion.button>

            <AnimatePresence>
                {isOpen && (
                    <motion.div
                        initial={{ opacity: 0, y: 20, scale: 0.95 }}
                        animate={{ opacity: 1, y: 0, scale: 1 }}
                        exit={{ opacity: 0, y: 20, scale: 0.95 }}
                        className="fixed bottom-24 right-3 z-50 flex w-[calc(100vw-1.5rem)] max-w-[24rem] flex-col overflow-hidden rounded-2xl border border-border bg-white shadow-2xl sm:right-6"
                        style={{ height: "min(35rem, calc(100vh - 10rem))" }}
                    >
                        {/* Header */}
                        <div className="bg-primary p-4 text-white flex items-center justify-between">
                            <div className="flex items-center gap-3">
                                <div className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center font-bold">M</div>
                                <div>
                                    <h3 className="font-semibold text-sm">Support MAMA</h3>
                                    <p className="text-[10px] opacity-80">
                                        {counselor 
                                          ? `En ligne avec ${counselor}` 
                                          : (isConnected ? "Conseiller disponible" : "Connexion...")}
                                    </p>
                                </div>
                            </div>
                            <button onClick={() => setIsOpen(false)} className="hover:bg-white/10 p-1 rounded-full transition-colors">
                                <X className="h-5 w-5" />
                            </button>
                        </div>

                        {/* Messages Area */}
                        <div ref={scrollRef} className="flex-1 overflow-y-auto p-4 space-y-4 bg-gray-50">
                            {messages.length === 0 && (
                                <div className="text-center py-8 px-4">
                                    <div className="w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-3">
                                        <MessageCircle className="w-6 h-6 text-primary" />
                                    </div>
                                    <p className="text-sm font-medium text-gray-900">Une question ?</p>
                                    <p className="text-xs text-gray-500 mt-1">Nos conseillers sont là pour vous aider.</p>
                                </div>
                            )}
                            {messages.map((msg, index) => (
                                <div key={index} className={`group relative flex ${msg.isMe ? "justify-end" : "justify-start"} mb-1`}>
                                    {/* Action Buttons on Hover (Messenger Style) */}
                                    <div className={`absolute top-0 opacity-0 group-hover:opacity-100 transition-opacity flex gap-1 z-10 ${msg.isMe ? "right-full mr-2" : "left-full ml-2"}`}>
                                        <button onClick={() => setReplyingTo(msg)} className="p-1.5 bg-white border border-gray-200 rounded-full shadow-sm hover:bg-gray-50 text-gray-500" title="Répondre">
                                            <Reply className="h-3.5 w-3.5" />
                                        </button>
                                        <button onClick={() => { if(confirm("Supprimer pour tout le monde ?")) socketRef.current.emit('delete_message', { messageId: msg.id }); }} className="p-1.5 bg-white border border-gray-200 rounded-full shadow-sm hover:bg-gray-50 text-gray-500" title="Supprimer">
                                            <Trash2 className="h-3.5 w-3.5" />
                                        </button>
                                    </div>

                                    <div
                                        className={`max-w-[80%] rounded-2xl px-4 py-2 text-sm shadow-sm transition-all ${msg.isMe ? "bg-primary text-white" : "bg-white border border-border text-gray-800"}`}
                                    >
                                        {/* Original quoted message if reply */}
                                        {msg.reply_to && (
                                            <div className={`mb-1 p-2 rounded text-[11px] border-l-2 ${msg.isMe ? "bg-white/10 border-white/40" : "bg-gray-100 border-gray-400"} italic line-clamp-1`}>
                                                {msg.reply_to_content || "Message d'origine"}
                                            </div>
                                        )}

                                        {msg.deleted ? <p className="italic text-sm text-gray-500">Message supprimé</p> : (msg.content && <p className="text-sm">{msg.content}</p>)}
                                        {msg.file_url && (
                                            <div className="mt-1 overflow-hidden rounded-lg">
                                                {msg.file_type?.startsWith("image/") ? (
                                                    <img src={`${API_URL}${msg.file_url}`} alt="PJ" className="max-w-full h-auto cursor-pointer hover:opacity-90" onClick={() => window.open(`${API_URL}${msg.file_url}`)} />
                                                ) : (
                                                    <a href={`${API_URL}${msg.file_url}`} target="_blank" rel="noopener noreferrer" className="flex items-center gap-2 p-2 bg-black/10 rounded text-xs">
                                                        <Paperclip className="h-3 w-3" /> Fichier joint
                                                    </a>
                                                )}
                                            </div>
                                        )}

                                        {/* Reactions display */}
                                        {(() => {
                                            const reactions = safeParse(msg.reactions || msg.reactions_json || msg.reactionsString, []);
                                            if (!reactions || !Array.isArray(reactions) || reactions.length === 0) return null;
                                            return (
                                                <div className={`absolute -bottom-2 ${msg.isMe ? "right-2" : "left-2"} flex -space-x-1`}>
                                                    {reactions.map((r, i) => (
                                                        <span key={i} className="bg-white rounded-full shadow-sm px-1 border border-gray-100 text-[10px]" title={r.userName}>{r.emoji}</span>
                                                    ))}
                                                </div>
                                            );
                                        })()}
                                    </div>
                                </div>
                            ))}
                        </div>

                        {/* Input Area */}
                        <div className="border-t border-border bg-white">
                            {replyingTo && (
                                <div className="px-4 py-2 bg-gray-50 flex items-center justify-between border-b border-gray-100">
                                    <div className="text-[10px] text-gray-500 truncate">
                                        En réponse à : <span className="font-bold italic">"{replyingTo.content}"</span>
                                    </div>
                                    <button onClick={() => setReplyingTo(null)} className="text-gray-400 hover:text-gray-600">
                                        <X className="h-3 w-3" />
                                    </button>
                                </div>
                            )}
                            <form onSubmit={handleSendMessage} className="p-3 flex items-center gap-2">
                            <input type="file" ref={fileInputRef} onChange={handleFileChange} className="hidden" />
                            <button type="button" onClick={() => fileInputRef.current?.click()} className="text-gray-400 hover:text-primary transition-colors">
                                <Paperclip className="h-5 w-5" />
                            </button>
                            <div className="relative">
                                <button type="button" onClick={() => setShowEmojiPicker(!showEmojiPicker)} className="text-gray-400 hover:text-primary transition-colors">
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
                                type="text"
                                value={newMessage}
                                onChange={(e) => setNewMessage(e.target.value)}
                                placeholder="Votre message..."
                                className="flex-1 bg-gray-100 rounded-full px-4 py-2 text-sm focus:outline-none focus:ring-1 focus:ring-primary"
                            />
                            <button
                                type="submit"
                                disabled={!newMessage.trim() && !fileInputRef.current?.value}
                                className="bg-primary text-white p-2 rounded-full disabled:opacity-50 hover:bg-primary/90 transition-colors"
                            >
                                <Send className="h-4 w-4" />
                            </button>
                        </form>
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>
        </>
    );
}
