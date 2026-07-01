# Contributing Guide

## Project Structure

This project follows a strict ownership policy to minimize merge conflicts.


```
PROJECT_ROOT
│
├── server/      ← Dev A (Backend)
└── client/      ← Dev B (Frontend)
```

### Dev A

Owns:

- Root configuration
- `server/`
- Express
- MongoDB
- API

### Dev B

Owns:

- `client/`
- React components
- CSS
- Frontend state
- API integration

Avoid modifying files owned by the other developer unless previously discussed.

---

# First-time Setup

Clone the repository:

```bash
git clone <repository-url>
cd <repository-name>
```

Install root dependencies:

```bash
npm install
```

Install backend dependencies:

```bash
cd server
npm install
cd ..
```

Install frontend dependencies:

```bash
cd client
npm install
cd ..
```

Create your environment file.

Copy:

```
.env.example
```

to

```
.env
```

Then replace:

```
MONGO_URI=your_mongodb_connection_string
```

with your MongoDB Atlas connection string.

---

# Running the project

From the project root:

```bash
npm start
```

This launches both:

- Backend: http://localhost:5000
- Frontend: http://localhost:3000

---

# Git Workflow

Before starting work:

```bash
git pull origin main
```

Create a feature branch:

```bash
git checkout -b feature/your-feature
```

Commit regularly:

```bash
git add .
git commit -m "Describe your changes"
```

Push:

```bash
git push origin feature/your-feature
```

Open a Pull Request when the feature is complete.

---

# Environment Variables

Never commit:

```
.env
```

Only commit:

```
.env.example
```

---

# Notes

- Keep `package-lock.json` committed.
- Never commit `node_modules/`.
- If dependencies change, run `npm install` again.
- React communicates with Express through the proxy configured in `client/package.json`.
