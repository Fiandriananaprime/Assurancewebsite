# Assurance MAMA Backend API

Complete REST API with real-time messaging for Assurance MAMA insurance platform.

## Features

- 🔐 **Authentication & Authorization** - JWT-based with role-based access control
- 👥 **User Management** - Profiles, roles (client, employee, admin)
- 📋 **Quote Management** - Create, track, and manage insurance quotes
- 📄 **Contract Management** - Policy management with renewal capabilities
- 🚨 **Incident Management** - Claims tracking and assignment system
- 📁 **Document Management** - File uploads for contracts and incidents
- 💬 **Real-time Messaging** - Socket.IO powered chat system
- 📝 **Content Management** - Blog posts and events
- ⭐ **Feedback System** - Customer reviews and ratings
- 🛡️ **Security** - Helmet, rate limiting, input validation

## Tech Stack

- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **PostgreSQL** - Database
- **Socket.IO** - Real-time communication
- **JWT** - Authentication
- **Bcrypt** - Password hashing
- **Multer** - File uploads
- **Winston** - Logging

## Prerequisites

- Node.js (v14 or higher)
- PostgreSQL (v12 or higher)
- npm or yarn

## Installation

1. **Clone the repository**
   ```bash
   cd backend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` file with your configuration:
   ```env
   PORT=5000
   NODE_ENV=development
   
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=assurance_mama
   DB_USER=postgres
   DB_PASSWORD=your_password
   
   JWT_SECRET=your_super_secret_jwt_key
   JWT_REFRESH_SECRET=your_super_secret_refresh_key
   
   FRONTEND_URL=http://localhost:5173
   SOCKET_CORS_ORIGIN=http://localhost:5173
   ```

4. **Create the database**
   ```bash
   createdb assurance_mama
   ```

5. **Initialize the database schema**
   ```bash
   psql -U postgres -d assurance_mama -f database/init.sql
   ```

6. **Create uploads directory**
   ```bash
   mkdir uploads
   ```

7. **Start the server**
   ```bash
   # Development mode
   npm run dev
   
   # Production mode
   npm start
   ```

The API will be available at `http://localhost:5000/api`

## Default Admin Account

- **Email:** admin@assurance-mama.com
- **Password:** password123

**⚠️ Change the password immediately after first login!**

## API Documentation

See [API_DOCUMENTATION.md](./API_DOCUMENTATION.md) for complete API documentation.

### Quick Start Examples

#### Register a new user
```bash
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "client@example.com",
    "password": "password123",
    "first_name": "Jean",
    "last_name": "Rakoto"
  }'
```

#### Login
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@assurance-mama.com",
    "password": "password123"
  }'
```

#### Create a quote (with token)
```bash
curl -X POST http://localhost:5000/api/quotes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "type": "auto",
    "amount": 500000,
    "deductible": 50000,
    "coverage_details": "Tous risques"
  }'
```

## Socket.IO Integration

The backend uses Socket.IO for real-time messaging. Here's how to connect from the frontend:

```javascript
import io from 'socket.io-client';

const socket = io('http://localhost:5000', {
  auth: {
    token: localStorage.getItem('accessToken')
  }
});

// Send a message
socket.emit('send_message', {
  conversationId: 'conversation-uuid',
  recipientId: 'user-uuid',
  content: 'Hello!'
});

// Listen for messages
socket.on('receive_message', (message) => {
  console.log('New message:', message);
});
```

## Project Structure

```
backend/
├── src/
│   ├── config/
│   │   ├── database.js      # PostgreSQL connection
│   │   └── socket.js        # Socket.IO configuration
│   ├── middleware/
│   │   ├── auth.js          # Authentication middleware
│   │   ├── upload.js        # File upload middleware
│   │   └── errorHandler.js  # Error handling
│   ├── models/
│   │   ├── User.js          # User model
│   │   ├── Profile.js       # Profile model
│   │   ├── Quote.js         # Quote model
│   │   ├── Contract.js      # Contract model
│   │   ├── Incident.js      # Incident model
│   │   ├── Document.js      # Document model
│   │   ├── Feedback.js      # Feedback model
│   │   ├── Content.js       # Content model
│   │   └── Conversation.js  # Conversation model
│   ├── routes/
│   │   ├── auth.routes.js   # Auth endpoints
│   │   ├── user.routes.js   # User endpoints
│   │   ├── quote.routes.js  # Quote endpoints
│   │   ├── contract.routes.js # Contract endpoints
│   │   ├── incident.routes.js # Incident endpoints
│   │   ├── document.routes.js # Document endpoints
│   │   ├── feedback.routes.js # Feedback endpoints
│   │   ├── content.routes.js  # Content endpoints
│   │   └── message.routes.js  # Message endpoints
│   ├── utils/
│   │   ├── logger.js        # Winston logger
│   │   └── helpers.js       # Helper functions
│   └── server.js            # Main server file
├── database/
│   └── init.sql             # Database schema
├── uploads/                 # Uploaded files directory
├── logs/                    # Application logs
├── .env                     # Environment variables
├── .env.example             # Environment variables template
├── package.json
├── API_DOCUMENTATION.md
└── README.md
```

## Development

### Running in Development Mode
```bash
npm run dev
```

The server will automatically restart when you make changes.

### Running Tests
```bash
npm test
```

## Production Deployment

1. Set `NODE_ENV=production` in your environment
2. Use a process manager like PM2:
   ```bash
   npm install -g pm2
   pm2 start src/server.js --name assurance-api
   pm2 save
   pm2 startup
   ```

3. Configure Nginx as a reverse proxy (optional but recommended)

## Security Considerations

- All passwords are hashed using bcrypt
- JWT tokens expire after 7 days (configurable)
- Rate limiting prevents abuse
- CORS is configured for specific origins
- Input validation on all endpoints
- Helmet.js for security headers

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Support

For support, contact: support@assurance-mama.com

---

Built with ❤️ for Assurance MAMA