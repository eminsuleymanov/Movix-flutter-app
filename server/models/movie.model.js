const mongoose = require("mongoose")
const movieSchema = require("../schemas/movie.schema")
const MovieModel = mongoose.model('Movie', movieSchema);
module.exports = MovieModel;
