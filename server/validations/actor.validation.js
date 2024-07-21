const Joi = require('joi')

const actorSchemaValidation = Joi.object({
    img: Joi.string().uri().required(),
    name: Joi.string().min(3).required()
});
module.exports = actorSchemaValidation;