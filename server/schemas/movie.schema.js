const mongoose = require('mongoose');

const ratingSchema = require("./rating.schema")
const actorSchema = require("./actor.schema.js")
// Movie schema
const movieSchema = new mongoose.Schema({
    title: { type: String, required: true },
    year: { type: Number, required: true },
    rated: { type: String, required: true },
    released: { type: Date, required: true },
    runtime: { type: Number, required: true },
    type: { type: String, required: true },
    genre: { type: [String], required: true },
    director: { type: String, required: true },
    actors: {  type: [actorSchema], required: true },
    plot: { type: String, required: true },
    language: { type: [String], required: true },
    country: { type: String, required: true },
    poster: { type: String, required: true },
    videoUrl: { type: String, required: true },
    ratings: [ratingSchema],
    boxOffice: { type: Number, required: true }
}, { timestamps: true });


module.exports = movieSchema;
