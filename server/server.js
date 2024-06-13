const mongoose = require("mongoose");
const dotenv = require("dotenv");
dotenv.config();
const PORT = process.env.PORT || 5050;
const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
const moviesRouter = require('./routes/moviesRouter');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());
app.use(moviesRouter)

mongoose.connect(process.env.CONNECTION_STRING)
    .then(() => console.log("Connected to MONGODB!"))
    .catch((err) => {
        console.log(err);
    });
app.listen(PORT, () => {
    console.log(`App is listening on port ${PORT}`);
});


