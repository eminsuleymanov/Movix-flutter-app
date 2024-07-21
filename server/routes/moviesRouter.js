const express = require("express")
const movie_middleware = require("../middlewares/movie.middleware")
const movies_controller = require("../controllers/movies.controller")
const moviesRouter = express.Router()

moviesRouter.get("/api/movies",movies_controller.getAll)
moviesRouter.post("/api/movies",movie_middleware,movies_controller.post) // middleware included
moviesRouter.get("/api/movies/:id",movies_controller.getOne)
moviesRouter.get('/api/movies/genre/:genreId', movies_controller.filterByGenre);
moviesRouter.delete("/api/movies/:id",movies_controller.delete)
moviesRouter.patch("/api/movies/:id",movies_controller.update)

module.exports =  moviesRouter