const MovieModel = require('../models/movie.model');
const movies_controller = {
  getAll: async (req, res) => {
    const { title } = req.query;
    try {
      let movies;
      if (title) {
        const regex = new RegExp(title, 'i');
        movies = await MovieModel.find({ title: { $regex: regex } })
          .populate('genres')
          .populate('actors')
          .populate('ratings');

      }
      else {
        movies = await MovieModel.find()
          .populate('genres')
          .populate('actors')
          .populate('ratings');
      }
      if (movies.length > 0) {
        res.status(200).send({
          message: "success",
          data: movies,
        });
      }
      else {
        res.status(204).send({
          message: "not found",
          data: null,
        });
      }
    } catch (error) {
      res.status(500).send({ error: error.message });
    }
  },
  getOne: async (req, res) => {
    const { id } = req.params;
    try {
      const movie = await MovieModel.findById(id)
        .populate('genres')
        .populate('actors')
        .populate('ratings');
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
  filterByGenre: async (req, res) => {
    const { genreId } = req.params;
    try {
      const movies = await MovieModel.find({ genres: genreId })
        .populate('actors') // Populate actors
        .populate('genres') // Populate genres
        .populate('ratings') // Populate ratings
        .exec();

      if (movies.length > 0) {
        res.status(200).send({
          message: "success",
          data: movies,
        });
      } else {
        res.status(404).send({
          message: "no movies found for this genre",
          data: null,
        });
      }
    } catch (error) {
      res.status(500).send({ error: error.message });
    }
  },
  getTrendingMovies: async (req, res) => {
    try {
      const trendingMovies = await MovieModel.find()
        .populate('genres')
        .populate('actors')
        .populate('ratings')
        .sort({
          year: -1,     // Sort by recent release date in descending order
          'ratings.average': -1, // Optionally sort by average rating (descending)
        })
        .limit(10); 

      if (trendingMovies.length > 0) {
        res.status(200).send({
          message: "success",
          data: trendingMovies,
        });
      } else {
        res.status(204).send({
          message: "No trending movies found",
          data: null,
        });
      }
    } catch (error) {
      res.status(500).send({ error: error.message });
    }
  },

};

module.exports = movies_controller;
