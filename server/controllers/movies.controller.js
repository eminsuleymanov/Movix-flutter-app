const MovieModel = require('../models/movie');

const movies_controller = {
  getAll: async (req, res) => {
    try {
      const movies = await MovieModel.find();
      res.status(200).send({
        message: "success",
        data: movies,
      });
    } catch (error) {
      res.status(500).send({ error: error.message });
    }
  },
  getOne: async (req, res) => {
    const { id } = req.params;
    try {
      const movie = await MovieModel.findById(id);
      if (movie) {
        res.status(200).send({
          message: "success",
          data: movie,
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
      const movie = await MovieModel.findByIdAndDelete(id);
      if (movie) {
        res.status(200).send({
          message: "successfully deleted",
          data: movie,
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
  update: async (req, res) => {
    const { id } = req.params;
    try {
      const updatedMovie = await MovieModel.findByIdAndUpdate(id, req.body);
      if (updatedMovie) {
        res.status(200).send({
          message: "updated",
          data: updatedMovie,
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
      const movie = new MovieModel(req.body);
      await movie.save();
      res.status(201).send({
        message: "new movie added",
        data: movie,
      });
    } catch (error) {
      res.status(500).send({ error: error.message });
    }
  },
};

module.exports = movies_controller;
