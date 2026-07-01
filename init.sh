#!/bin/bash

echo "Initializing project..."

########################################
# Folder structure
########################################

mkdir -p server/models
mkdir -p server/routes

mkdir -p client/public
mkdir -p client/src/components

########################################
# Root package.json
########################################

cat > package.json <<'EOF'
{
  "name": "two-sentence-horror",
  "private": true,
  "scripts": {
    "server": "npm start --prefix server",
    "client": "npm start --prefix client",
    "start": "concurrently \"npm run server\" \"npm run client\""
  },
  "devDependencies": {
    "concurrently": "^9.0.0"
  }
}
EOF

########################################
# Gitignore
########################################

cat > .gitignore <<'EOF'
node_modules
.env
client/node_modules
server/node_modules
EOF

########################################
# ENV
########################################

cat > .env.example <<'EOF'
MONGO_URI=your_mongodb_connection_string
PORT=5000
EOF

touch .env

########################################
# SERVER PACKAGE
########################################

cat > server/package.json <<'EOF'
{
  "name": "server",
  "scripts": {
    "start": "nodemon server.js"
  },
  "dependencies": {
    "cors": "^2.8.5",
    "dotenv": "^16.0.0",
    "express": "^4.19.0",
    "mongoose": "^8.0.0"
  },
  "devDependencies": {
    "nodemon": "^3.0.0"
  }
}
EOF

########################################
# server.js
########################################

cat > server/server.js <<'EOF'
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const storyRoutes = require("./routes/stories");

const app = express();

app.use(cors());
app.use(express.json());

mongoose
.connect(process.env.MONGO_URI)
.then(() => console.log("MongoDB connected"))
.catch(err => console.error(err));

app.use("/api/stories", storyRoutes);

// TODO: Add middleware

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
EOF

########################################
# Story Model
########################################

cat > server/models/Story.js <<'EOF'
const mongoose = require("mongoose");

const StorySchema = new mongoose.Schema({

    title: String,

    setup: String,

    punchline: String,

    author: {
        type: String,
        default: "Anonymous"
    },

    upvotes: {
        type: Number,
        default: 0
    },

    downvotes: {
        type: Number,
        default: 0
    }

}, { timestamps: true });

// TODO: Complete validation

module.exports = mongoose.model("Story", StorySchema);
EOF

########################################
# Routes
########################################

cat > server/routes/stories.js <<'EOF'
const express = require("express");
const router = express.Router();

const Story = require("../models/Story");

// GET

router.get("/", async (req,res)=>{

    // TODO

});

// POST

router.post("/", async (req,res)=>{

    // TODO

});

// PATCH Vote

router.patch("/:id/vote", async (req,res)=>{

    // TODO

});

module.exports = router;
EOF

########################################
# CLIENT PACKAGE
########################################

cat > client/package.json <<'EOF'
{
  "name": "client",
  "private": true,
  "proxy": "http://localhost:5000"
}
EOF

########################################
# React index
########################################

cat > client/src/index.js <<'EOF'
import React from "react";
import ReactDOM from "react-dom/client";

import "./index.css";
import App from "./App";

const root = ReactDOM.createRoot(document.getElementById("root"));

root.render(<App />);
EOF

########################################
# App.js
########################################

cat > client/src/App.js <<'EOF'
import { useState } from "react";

import Navbar from "./components/Navbar";
import Feed from "./components/Feed";
import FocusModal from "./components/FocusModal";

import "./index.css";

function App() {

    const [stories, setStories] = useState([]);

    const [activeStory, setActiveStory] = useState(null);

    // TODO

    return (
        <>
            <Navbar />

            <Feed
                stories={stories}
                setActiveStory={setActiveStory}
            />

            <FocusModal
                activeStory={activeStory}
                setActiveStory={setActiveStory}
            />
        </>
    );

}

export default App;
EOF

########################################
# CSS
########################################

cat > client/src/index.css <<'EOF'
body{
    margin:0;
    background:#121212;
    color:white;
    font-family:sans-serif;
}

/* TODO */
EOF

########################################
# Mock Data
########################################

cat > client/src/mockData.json <<'EOF'
[]
EOF

########################################
# Components
########################################

for file in Navbar Feed StoryCard CreateForm FocusModal
do

cat > client/src/components/$file.js <<EOF
function $file(){

    // TODO

    return(
        <div>
            $file
        </div>
    );

}

export default $file;
EOF

done

echo ""
echo "Project initialized successfully."
echo ""
echo "Next:"
echo "npm install"
echo "cd server && npm install"
echo "cd client && npx create-react-app ."