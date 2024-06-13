const Joi = require('joi')

const ratingSchemaValidation = Joi.object({
    source: Joi.string().required(),
    value: Joi.string().required()
});
module.exports = ratingSchemaValidation