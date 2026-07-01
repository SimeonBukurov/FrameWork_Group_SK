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
