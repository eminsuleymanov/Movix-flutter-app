const mongoose = require('mongoose');
const Genre = require("../models/genre.model");
// Movie schema
const movieSchema = new mongoose.Schema({
    title: { type: String, required: true },
    year: { type: Number, required: true },
    rated: { type: String, required: true },
    released: { type: Date, required: true },
    runtime: { type: Number, required: true },
    type: { type: String, required: true },
    genres: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Genre' }],
    actors: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Actor' }],
    director: { type: String, required: true },
    plot: { type: String, required: true },
    language: { type: [String], required: true },
    country: { type: String, required: true },
    poster: { type: String, required: true },
    videoUrl: { type: String, required: true },
    ratings: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Rating' }],
    boxOffice: { type: String, required: true }
}, { timestamps: true });


module.exports = movieSchema;
