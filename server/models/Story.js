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
