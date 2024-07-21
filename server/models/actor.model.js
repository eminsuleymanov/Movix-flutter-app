const mongoose = require("mongoose")
const actorSchema = require("../schemas/actor.schema");
const ActorModel = mongoose.model('Actor',actorSchema);
module.exports = ActorModel