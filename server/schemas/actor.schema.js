const mongoose = require("mongoose")
const actorSchema = new mongoose.Schema({
    img: { type: String, required: true },
    name: { type: String, required: true },
    movies: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Movie' }],
}, { timestamps: true });
module.exports = actorSchema