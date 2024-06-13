const mongoose = require("mongoose")
const actorSchema = new mongoose.Schema({
    img: { type: String, required: true },
    title: { type: String, required: true }
});
module.exports = actorSchema