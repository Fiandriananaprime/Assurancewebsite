# Assurance MAMA API Documentation

## Base URL
```
http://localhost:5000/api
```

## Authentication
All protected endpoints require a Bearer token in the Authorization header:
```
Authorization: Bearer <your_jwt_token>
```

## API Endpoints

### Authentication

#### Register User
```
POST /auth/register
```
**Body:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "first_name": "John",
  "last_name": "Doe",
  "phone": "+261 34 00 000 00",
  "address": "Antananarivo",
  "birth_date": "1990-01-01"
}
```

#### Login
```
POST /auth/login
```
**Body:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

#### Get Current User
```
GET /auth/me
```

#### Change Password
```
PUT /auth/password
```
**Body:**
```json
{
  "currentPassword": "old_password",
  "newPassword": "new_password"
}
```

---

### Users & Profiles

#### Get All Users (Admin Only)
```
GET /users?page=1&limit=10&role=client&search=john
```

#### Get User Profile
```
GET /users/profile
```

#### Update Profile
```
PUT /users/profile
Content-Type: multipart/form-data
```
**Fields:**
- `first_name`, `last_name`, `phone`, `address`, `birth_date`
- `profile_image` (file)

#### Get User Stats
```
GET /users/stats
```

#### Get User by ID (Admin Only)
```
GET /users/:id
```

#### Update User (Admin Only)
```
PUT /users/:id
```

#### Delete User (Admin Only)
```
DELETE /users/:id
```

---

### Quotes

#### Create Quote
```
POST /quotes
```
**Body:**
```json
{
  "type": "auto",
  "amount": 500000,
  "deductible": 50000,
  "coverage_details": "Tous risques",
  "validity_days": 30,
  "vehicle_details": {
    "marque": "Toyota",
    "modele": "Yaris",
    "annee": 2020
  }
}
```

#### Get All Quotes
```
GET /quotes?page=1&limit=10&status=en_attente&type=auto&search=DEV
```

#### Get My Quotes
```
GET /quotes/my-quotes
```

#### Get Quote by ID
```
GET /quotes/:id
```

#### Update Quote
```
PUT /quotes/:id
```

#### Update Quote Status (Employee/Admin)
```
PATCH /quotes/:id/status
```
**Body:**
```json
{
  "status": "accepte"
}
```

#### Delete Quote
```
DELETE /quotes/:id
```

---

### Contracts

#### Create Contract (Employee/Admin)
```
POST /contracts
```
**Body:**
```json
{
  "type": "auto",
  "client_id": "uuid",
  "start_date": "2024-01-01",
  "end_date": "2025-01-01",
  "annual_amount": 500000,
  "deductible": 50000,
  "coverage": "Tous risques",
  "payment_method": "mensuel",
  "vehicle_info": {
    "marque": "Toyota",
    "modele": "Yaris",
    "annee": 2020
  }
}
```

#### Get All Contracts
```
GET /contracts?page=1&limit=10&status=actif&type=auto&search=POL
```

#### Get My Contracts
```
GET /contracts/my-contracts
```

#### Get Active Contracts
```
GET /contracts/active
```

#### Get Contract Stats (Employee/Admin)
```
GET /contracts/stats/overview
```

#### Get Contract by ID
```
GET /contracts/:id
```

#### Get Contract by Policy Number
```
GET /contracts/policy/:policyNumber
```

#### Update Contract (Employee/Admin)
```
PUT /contracts/:id
```

#### Update Contract Status (Employee/Admin)
```
PATCH /contracts/:id/status
```
**Body:**
```json
{
  "status": "expire"
}
```

#### Renew Contract (Employee/Admin)
```
POST /contracts/:id/renew
```
**Body:**
```json
{
  "new_end_date": "2026-01-01"
}
```

#### Delete Contract (Employee/Admin)
```
DELETE /contracts/:id
```

---

### Incidents

#### Create Incident
```
POST /incidents
```
**Body:**
```json
{
  "contract_id": "uuid",
  "title": "Accident de voiture",
  "description": "Description détaillée de l'incident",
  "date": "2024-01-15",
  "time": "14:30",
  "location": "Antananarivo",
  "type": "auto",
  "severity": "moyen",
  "estimated_cost": 1000000
}
```

#### Get All Incidents
```
GET /incidents?page=1&limit=10&status=en_cours&severity=moyen&type=auto&search=INC
```

#### Get My Incidents
```
GET /incidents/my-incidents
```

#### Get Incident Stats (Employee/Admin)
```
GET /incidents/stats/overview
```

#### Get Incident by ID
```
GET /incidents/:id
```

#### Update Incident
```
PUT /incidents/:id
```

#### Update Incident Status (Employee/Admin)
```
PATCH /incidents/:id/status
```
**Body:**
```json
{
  "status": "traite",
  "severity": "leger"
}
```

#### Assign Incident to Employee (Admin)
```
POST /incidents/:id/assign
```
**Body:**
```json
{
  "employee_id": "uuid"
}
```

#### Delete Incident (Employee/Admin)
```
DELETE /incidents/:id
```

---

### Documents

#### Upload Document
```
POST /documents
Content-Type: multipart/form-data
```
**Fields:**
- `file` (required): The file to upload
- `name` (required): Document name
- `entity_type` (required): 'contract', 'incident', or 'user'
- `entity_id` (required): UUID of the entity

#### Get Documents by Entity
```
GET /documents/entity/:entityType/:entityId
```

#### Get My Documents
```
GET /documents/my-documents
```

#### Get Document by ID
```
GET /documents/:id
```

#### Delete Document
```
DELETE /documents/:id
```

---

### Feedbacks

#### Create Feedback
```
POST /feedbacks
```
**Body:**
```json
{
  "subject": "Excellent service",
  "message": "Je suis très satisfait du service client.",
  "rating": 5,
  "category": "service_client",
  "public_quote": true
}
```

#### Get All Feedbacks
```
GET /feedbacks?page=1&limit=10&status=nouveau&category=service_client&search=satisfait
```

#### Get My Feedbacks
```
GET /feedbacks/my-feedbacks
```

#### Get Public Feedbacks (Public)
```
GET /feedbacks/public/landing?limit=10
```

#### Get Feedback Stats (Employee/Admin)
```
GET /feedbacks/stats/overview
```

#### Get Feedback by ID
```
GET /feedbacks/:id
```

#### Update Feedback
```
PUT /feedbacks/:id
```

#### Update Feedback Status (Employee/Admin)
```
PATCH /feedbacks/:id/status
```
**Body:**
```json
{
  "status": "traite"
}
```

#### Delete Feedback (Employee/Admin)
```
DELETE /feedbacks/:id
```

---

### Content (Blog & Events)

#### Create Content (Employee/Admin)
```
POST /content
Content-Type: multipart/form-data
```
**Fields:**
- `type` (required): 'blog' or 'event'
- `title` (required): Content title
- `content` (required): Content body
- `excerpt`: Short description
- `category`: Category name
- `image` (file): Featured image
- `event_date`: For events only
- `location`: For events only
- `read_time`: For blog posts only

#### Get Blog Posts
```
GET /content/blog?page=1&limit=10&category=assurance&search=conseil
```

#### Get Events
```
GET /content/events?page=1&limit=10&upcomingOnly=true
```

#### Get Content Stats (Employee/Admin)
```
GET /content/stats/overview
```

#### Get Content by ID
```
GET /content/:id
```

#### Update Content (Employee/Admin)
```
PUT /content/:id
```

#### Delete Content (Employee/Admin)
```
DELETE /content/:id
```

---

### Messages & Conversations

#### Get User Conversations
```
GET /messages/conversations
```

#### Get Unread Conversations
```
GET /messages/conversations/unread
```

#### Get All Conversations (Employee/Admin)
```
GET /messages/conversations/all?page=1&limit=10&search=john
```

#### Create/Get Conversation
```
POST /messages/conversations
```
**Body:**
```json
{
  "participant_id": "uuid"
}
```

#### Get Conversation with Messages
```
GET /messages/conversations/:id?page=1&limit=50
```

#### Delete Conversation
```
DELETE /messages/conversations/:id
```

#### Send Message (REST API)
```
POST /messages/send
```
**Body:**
```json
{
  "conversation_id": "uuid",
  "content": "Hello, I need help with my contract."
}
```

#### Mark Message as Read
```
PATCH /messages/:id/read
```

---

## Socket.IO Events (Real-time Messaging)

### Connection
```javascript
const socket = io('http://localhost:5000', {
  auth: {
    token: 'your_jwt_token'
  }
});
```

### Events

#### Send Message
```javascript
socket.emit('send_message', {
  conversationId: 'uuid',
  recipientId: 'uuid',
  content: 'Message content'
});
```

#### Receive Message
```javascript
socket.on('receive_message', (message) => {
  console.log('New message:', message);
});
```

#### Message Sent Confirmation
```javascript
socket.on('message_sent', (message) => {
  console.log('Message sent:', message);
});
```

#### Typing Indicator
```javascript
socket.emit('typing', {
  conversationId: 'uuid',
  isTyping: true
});
```

#### User Typing
```javascript
socket.on('user_typing', ({ userId, isTyping, userName }) => {
  console.log(`${userName} is typing: ${isTyping}`);
});
```

#### Mark Messages as Read
```javascript
socket.emit('mark_read', {
  conversationId: 'uuid'
});
```

---

## Response Format

### Success Response
```json
{
  "success": true,
  "message": "Operation successful",
  "data": { /* response data */ },
  "pagination": { /* if applicable */ }
}
```

### Error Response
```json
{
  "success": false,
  "message": "Error message",
  "errors": [ /* validation errors */ ]
}
```

---

## Status Codes

- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `429` - Too Many Requests
- `500` - Internal Server Error

---

## Default Admin Credentials

- **Email:** admin@assurance-mama.com
- **Password:** password123

**⚠️ Change the password immediately after first login!**