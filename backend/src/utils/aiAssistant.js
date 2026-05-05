const pool = require('../config/database');

const getGeminiApiKey = () => process.env.GEMINI_API_KEY || process.env.GOOGLE_AI_API_KEY;

const getGeminiModel = () => {
    const model = process.env.GEMINI_MODEL || 'gemini-2.5-flash';
    return model.replace(/^models\//, '');
};

const buildPrompt = ({ clientName = 'le client', conversationHistory = [], latestMessage = '' }) => {
    // Vérifier si l'assistance (IA ou employé) a déjà envoyé un message aujourd'hui
    const today = new Date().toISOString().split('T')[0];
    const hasAlreadyGreetedToday = conversationHistory.some(msg => {
        if (!msg.created_at || msg.sender_role === 'client') return false;
        const msgDate = new Date(msg.created_at).toISOString().split('T')[0];
        return msgDate === today;
    });

    const historyText = conversationHistory
        .slice(-12)
        .map((message) => {
            const author = message.sender_role === 'client' ? 'Client' : 'Assurance MAMA';
            return `${author}: ${message.content || ''}`.trim();
        })
        .join('\n');

    return [
        "Tu es l'assistant IA du support Assurance MAMA.",
        "Reponds en francais, avec un ton professionnel, clair et rassurant.",
        "NAVIGATION : Tu as la capacite de rediriger le client vers des pages specifiques.",
        "Si tu suggeres une action (ex: 'Vous pouvez simuler un tarif'), ajoute 'NAVIGATE:path' a la toute fin de ton message.",
        "Paths autorises uniquement :",
        " - / (Accueil)",
        " - /devis (Devis/Simulation)",
        " - /blog (Actualites/Conseils)",
        " - /contact (Nous contacter)",
        " - /dashboard (Espace client/Contrats)",
        " - /settings/profile (Modifier le profil)",
        " - /settings/billing (Factures et paiements)",
        " - /settings/help (Centre d'aide)",
        hasAlreadyGreetedToday ? "Ne commence pas par une salutation (Bonjour/Bonsoir) car tu as deja echange avec le client aujourd'hui. Entre directement dans le vif du sujet." : `Commence par une salutation courtoise incluant le nom du client (Bonjour ${clientName}).`,
        "Ne promets jamais une indemnisation, une validation de contrat ou une action juridique certaine.",
        "Si la demande necessite une verification humaine, dis que l'equipe va verifier le dossier.",
        "Pose une question courte si une information manque.",
        "Reponds en 2 a 5 phrases maximum. Pas de markdown sauf le tag NAVIGATE.",
        "Ta reponse doit etre complete. Le tag NAVIGATE doit imperativement etre place apres le point final.",
        "",
        `Client: ${clientName}`,
        historyText ? `Historique recent:\n${historyText}` : '',
        latestMessage ? `Dernier message client:\n${latestMessage}` : '',
        "",
        "Reponse complete a envoyer:"
    ].filter(Boolean).join('\n');
};

const extractGeminiText = (body) => {
    const parts = body?.candidates?.[0]?.content?.parts || [];
    return parts.map((part) => part.text || '').join('').trim();
};

const isLikelyIncomplete = (text) => {
    if (!text) return true;
    const cleanText = text.replace(/NAVIGATE:[\/\w-]+\s*$/i, '').trim();
    if (/[.!?]$/.test(cleanText)) return false;
    return text.length < 900;
};

const generateAiReply = async ({ clientName, conversationHistory, latestMessage, retrying = false }) => {
    const apiKey = getGeminiApiKey();
    if (!apiKey) {
        const error = new Error('Cle Gemini manquante. Ajoutez GEMINI_API_KEY dans le fichier .env du backend.');
        error.statusCode = 503;
        throw error;
    }

    const prompt = buildPrompt({ clientName, conversationHistory, latestMessage });
    const model = getGeminiModel();
    const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${encodeURIComponent(apiKey)}`;
    const generationConfig = {
        temperature: 0.25,
        maxOutputTokens: parseInt(process.env.GEMINI_MAX_OUTPUT_TOKENS, 10) || 1024
    };

    if (model.startsWith('gemini-2.5')) {
        generationConfig.thinkingConfig = { thinkingBudget: 0 };
    }

    const response = await fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            contents: [{ role: 'user', parts: [{ text: prompt }] }],
            generationConfig
        })
    });

    const body = await response.json().catch(() => ({}));
    if (!response.ok) {
        const message = body?.error?.message || `Erreur Gemini ${response.status}`;
        const error = new Error(message);
        error.statusCode = response.status;
        throw error;
    }

    const finishReason = body?.candidates?.[0]?.finishReason;
    const text = extractGeminiText(body);
    if (!text) {
        throw new Error("Gemini n'a pas renvoye de texte.");
    }

    if (!retrying && (finishReason === 'MAX_TOKENS' || isLikelyIncomplete(text))) {
        return generateAiReply({
            clientName,
            conversationHistory,
            latestMessage: `${latestMessage}\n\nReecris une reponse courte, complete, en 2 phrases maximum.`,
            retrying: true
        });
    }

    return text;
};

const getConversationHistory = async ({ conversationId, clientId }) => {
    const result = await pool.query(
        `SELECT m.*, u.role as sender_role
         FROM messages m
         LEFT JOIN users u ON u.id = m.sender_id
         WHERE m.conversation_id = $1
            OR (m.conversation_id IS NULL AND m.sender_id = $2)
         ORDER BY m.created_at ASC
         LIMIT 30`,
        [conversationId || null, clientId || null]
    );

    return result.rows;
};

const getClientName = async (clientId) => {
    const result = await pool.query(
        `SELECT first_name || ' ' || last_name as name FROM profiles WHERE user_id = $1`,
        [clientId]
    );

    return result.rows[0]?.name || 'le client';
};

const insertAiMessage = async ({ conversationId, senderId, content }) => {
    const result = await pool.query(
        `INSERT INTO messages (conversation_id, sender_id, content, is_read)
         VALUES ($1, $2, $3, false)
         RETURNING *,
         (SELECT profile_image_url FROM profiles WHERE user_id = $2) as sender_image,
         (SELECT first_name || ' ' || last_name FROM profiles WHERE user_id = $2) as sender_name,
         (SELECT role FROM users WHERE id = $2) as sender_role`,
        [conversationId, senderId, content]
    );

    const message = result.rows[0];
    message.conversationId = String(conversationId);
    message.ai_generated = true;
    return message;
};

module.exports = {
    generateAiReply,
    getClientName,
    getConversationHistory,
    insertAiMessage
};
