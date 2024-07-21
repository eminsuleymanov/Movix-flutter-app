const express = require('express');
const actorsController = require('../controllers/actors.controller');
const actorRouter = express.Router();

// Create a new actor
actorRouter.post('/api/actors', actorsController.post);

// Get all actors
actorRouter.get('/api/actors', actorsController.getAll);

// Get a single actor by ID
actorRouter.get('/api/actors/:id', actorsController.getOne);

// Delete a actor by ID
actorRouter.delete('/api/actors/:id', actorsController.delete);

module.exports = actorRouter;
