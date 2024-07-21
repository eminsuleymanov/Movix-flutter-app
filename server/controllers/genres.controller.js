const GenreModel = require("../models/genre.model")
const mongoose = require('mongoose');
const genres_controller = {
    getAll: async (req, res) => {
        try {
            const genres = await GenreModel.find().populate('movies');
            res.status(200).send({
                message: "success",
                data: genres,
            });
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
    getOne: async (req, res) => {
        const { id } = req.params;
        try {
            if (!mongoose.Types.ObjectId.isValid(id)) {
                return res.status(400).send({
                    message: "Invalid genre ID",
                    data: null,
                });
            }
            const genre = await GenreModel.findById(id).populate('movies');
            
            if (genre) {
                res.status(200).send({
                    message: "Genre retrieved successfully",
                    data: genre,
                });
            } else {
                res.status(404).send({
                    message: "Genre not found",
                    data: null,
                });
            }
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
    delete: async (req, res) => {
        const { id } = req.params;
        try {
            const genre = await GenreModel.findByIdAndDelete(id);
            if (genre) {
                res.status(200).send({
                    message: "Genre successfully deleted",
                    data: genre,
                });
            } else {
                res.status(404).send({
                    message: "no content",
                    data: null,
                });
            }
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
    post: async (req, res) => {
        try {
            const genre = new GenreModel(req.body);
            await genre.save();
            res.status(201).send({
                message: "new genre added",
                data: genre,
            });
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
}
module.exports = genres_controller;