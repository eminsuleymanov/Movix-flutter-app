const mongoose = require("mongoose")
const ratingSchema = new mongoose.Schema({
    source: { type: String, required: true },
    value: { type: String, required: true },
    movie: { type: mongoose.Schema.Types.ObjectId, ref: 'Movie' }
}, { timestamps: true });

module.exports = ratingSchema