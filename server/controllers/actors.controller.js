const ActorModel = require("../models/actor.model")
const MovieModel = require("../models/movie.model");
const actors_controller = {
    getAll: async (req, res) => {
        try {
            const actors = await ActorModel.find().populate('movies');
            res.status(200).send({
                message: "success",
                data: actors,
            });
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
    getOne: async (req, res) => {
        const { id } = req.params;
        try {
            const actor = await ActorModel.findById(id).populate('movies');
            if (actor) {
                res.status(200).send({
                    message: "success",
                    data: actor,
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
    delete: async (req, res) => {
        const { id } = req.params;
        try {
            const actor = await ActorModel.findByIdAndDelete(id);
            if (actor) {
                res.status(200).send({
                    message: "Actor successfully deleted",
                    data: actor,
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
            const actor = new ActorModel(req.body);
            await actor.save();
            res.status(201).send({
                message: "new actor added",
                data: actor,
            });
        } catch (error) {
            res.status(500).send({ error: error.message });
        }
    },
}
module.exports = actors_controller