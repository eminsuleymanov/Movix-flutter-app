const RatingModel = require("../models/rating.model")
const MovieModel= require("../models/movie.model")
const ratings_controller = {
    getAll: async (req, res) => {
        try {
            const ratings = await RatingModel.find();
            res.status(200).send({
                message: "success",
                data: ratings,
            });
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
    getOne: async (req, res) => {
        const { id } = req.params;
        try {
            const rating = await RatingModel.findById(id);
            if (rating) {
                res.status(200).send({
                    message: "rating retrieved successfully",
                    data: rating,
                });
            } else {
                res.status(404).send({
                    message: "rating not found",
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
            const rating = await RatingModel.findByIdAndDelete(id);
            if (rating) {
                res.status(200).send({
                    message: "rating successfully deleted",
                    data: rating,
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
        const { movie, source, value } = req.body;

        try {
            // Create a new rating
            const rating = new RatingModel({ movie: movie, source, value });
            await rating.save();
    
            // Update the movie to include this rating
            await MovieModel.findByIdAndUpdate(
                movie,
                { $push: { ratings: rating._id } },
                { new: true }
            );
    
            res.status(201).send({
                message: "new rating added",
                data: rating,
            });
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
}
module.exports = ratings_controller;