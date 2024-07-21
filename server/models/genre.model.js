const mongoose = require("mongoose")
const genreSchema = require("../schemas/genre.schema");
const GenreModel = mongoose.model('Genre',genreSchema);
module.exports = GenreModel;