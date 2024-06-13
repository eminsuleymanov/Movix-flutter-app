const mongoose = require("mongoose")
const ratingSchema = new mongoose.Schema({
    source: { type: String, required: true },
    value: { type: String, required: true }
});

module.exports =ratingSchema