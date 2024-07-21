const Joi = require('joi').extend(require('@joi/date'));

const ratingSchemaValidation = require("./rating.validation.js")

const actorSchemaValidation = require("./actor.validation.js")

const MovieSchemaValidation = Joi.object({
    title: Joi.string().min(3).required(),
    year: Joi.number().min(1900).required(),
    rated: Joi.string().required(),
    released: Joi.date().format('DD MMM YYYY').utc().required(),
    runtime: Joi.number().min(0).required(),
    genres: Joi.array().items(Joi.string().min(3)).required(),
    director: Joi.string().min(3).required(),
    actors: Joi.array().required(),
    plot: Joi.string().min(10).required(),
    language: Joi.array().items(Joi.string().min(2)).required(),
    country: Joi.string().required(),
    poster: Joi.string().uri().required(),
    videoUrl: Joi.string().uri().required(),
    ratings: Joi.array().items(ratingSchemaValidation),
    type: Joi.string().required(),
    boxOffice: Joi.string().required()
});

module.exports = MovieSchemaValidation;
