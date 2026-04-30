const { v4: uuidv4 } = require('uuid');

// Generate unique reference
const generateReference = (prefix) => {
    const year = new Date().getFullYear();
    const random = Math.floor(Math.random() * 1000).toString().padStart(3, '0');
    return `${prefix}-${year}-${random}`;
};

// Generate policy number
const generatePolicyNumber = (type) => {
    const typePrefix = type.toUpperCase().substring(0, 3);
    const timestamp = Date.now().toString(36).toUpperCase();
    const random = Math.floor(Math.random() * 1000).toString().padStart(3, '0');
    return `POL-${typePrefix}-${timestamp}-${random}`;
};

// Format date for database
const formatDate = (date) => {
    if (!date) return null;
    return new Date(date).toISOString().split('T')[0];
};

// Pagination helper
const getPagination = (page, limit) => {
    const pageNum = Math.max(1, parseInt(page) || 1);
    const limitNum = Math.max(1, Math.min(100, parseInt(limit) || 10));
    const offset = (pageNum - 1) * limitNum;

    return {
        limit: limitNum,
        offset,
        page: pageNum
    };
};

// Response formatter
const successResponse = (data, message = 'Success', meta = {}) => ({
    success: true,
    message,
    data,
    ...meta
});

const errorResponse = (message = 'Error', status = 500, errors = null) => ({
    success: false,
    message,
    errors,
    status
});

module.exports = {
    generateReference,
    generatePolicyNumber,
    formatDate,
    getPagination,
    successResponse,
    errorResponse
};