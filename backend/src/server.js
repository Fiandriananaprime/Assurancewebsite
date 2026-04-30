const express = require('express');
const http = require('http');
const path = require('path');
const cors = require('cors');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const slowDown = require('express-slow-down');
require('dotenv').config();

const app = express();
const server = http.createServer(app);

// Initialize Socket.IO
const { initializeSocket } = require('./config/socket');
initializeSocket(server);

// Security middleware
app.use(helmet());

// CORS configuration
app.use(cors({
    origin: process.env.FRONTEND_URL || 'http://localhost:5173',
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

// Rate limiting
const limiter = rateLimit({
    windowMs: parseInt(process.env.RATE_LIMIT_WINDOW_MS) || 15 * 60 * 1000, // 15 minutes
    max: parseInt(process.env.RATE_LIMIT_MAX_REQUESTS) || 100,
    message: {
        success: false,
        message: 'Too many requests, please try again later.'
    }
});

// Speed limit for repeated requests
// Note: the express-slow-down package changed the behavior of the `delayMs` option in v2.
// To avoid the WRN_ESD_DELAYMS warning, set options.validate.delayMs = false when using the
// previous style value declaration.
const speedLimiter = slowDown({
    windowMs: 15 * 60 * 1000,
    delayAfter: 100,
    delayMs: 500,
    maxDelayMs: 20 * 1000,
    // disable package validation warning
    validate: { delayMs: false }
});

app.use('/api/', limiter);
app.use('/api/', speedLimiter);

// Body parsing middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Static files for uploads
app.use('/uploads', express.static(path.resolve(__dirname, '../uploads')));

// Health check endpoint
app.get('/api/health', (req, res) => {
    res.json({
        success: true,
        message: 'Assurance MAMA API is running',
        timestamp: new Date().toISOString()
    });
});

// API Routes
app.use('/api/auth', require('./routes/auth.routes'));
app.use('/api/users', require('./routes/user.routes'));
app.use('/api/quotes', require('./routes/quote.routes'));
app.use('/api/contracts', require('./routes/contract.routes'));
app.use('/api/incidents', require('./routes/incident.routes'));
app.use('/api/documents', require('./routes/document.routes'));
app.use('/api/feedbacks', require('./routes/feedback.routes'));
app.use('/api/content', require('./routes/content.routes'));
app.use('/api/messages', require('./routes/message.routes'));
// Meta endpoints (tariffs, clients reference data)
app.use('/api/meta', require('./routes/meta.routes'));

// 404 handler
app.use((req, res) => {
    res.status(404).json({
        success: false,
        message: `Route ${req.originalUrl} not found`
    });
});

// Error handling middleware
app.use(require('./middleware/errorHandler'));

// Database connection test
const pool = require('./config/database');
pool.query('SELECT NOW()')
    .then(() => {
        console.log('✅ Database connected successfully');
    })
    .catch(err => {
        console.error('❌ Database connection failed:', err);
    });

// Start server
const PORT = process.env.PORT || 5000;
server.listen(PORT, () => {
    console.log(`🚀 Server running on port ${PORT}`);
    console.log(`📡 API available at http://localhost:${PORT}/api`);
    console.log(`🔌 Socket.IO ready for real-time messaging`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
    console.log('SIGTERM received. Shutting down gracefully...');
    server.close(() => {
        console.log('Process terminated');
        process.exit(0);
    });
});

module.exports = { app, server };
