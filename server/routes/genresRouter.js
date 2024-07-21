const express = require('express');
const genresController = require('../controllers/genres.controller');
const genreRouter = express.Router();

// Create a new genre
genreRouter.post('/api/genres', genresController.post);

// Get all genres
genreRouter.get('/api/genres', genresController.getAll);

// Get a single genre by ID
genreRouter.get('/api/genres/:id', genresController.getOne);

// Delete a genre by ID
genreRouter.delete('/api/genres/:id', genresController.delete);

module.exports = genreRouter;
