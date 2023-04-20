const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let Text_Schema = new Schema(
    {
        hash: {type: String},
        targetLanguage: {type: String},
        text: { type: String },
        translateText: { type: String },
    }
);

module.exports = mongoose.model("text", Text_Schema);