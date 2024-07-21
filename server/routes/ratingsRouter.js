const express = require('express');
const ratingsController = require('../controllers/ratings.controller');
const ratingRouter = express.Router();

// Create a new rating
ratingRouter.post('/api/ratings', ratingsController.post);

// Get all ratings
ratingRouter.get('/api/ratings', ratingsController.getAll);

// Get a single rating by ID
ratingRouter.get('/api/ratings/:id', ratingsController.getOne);

// Delete a rating by ID
ratingRouter.delete('/api/ratings/:id', ratingsController.delete);

module.exports = ratingRouter;
