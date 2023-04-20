var mongoose = require('mongoose');
require('dotenv').config();
//console.log(mongooseurl)
const crypto = require('crypto');
const db = require('./model/text.js');
const mongooseurl = 'mongodb://' + process.env.MONGO_USER + ':' + process.env.MONGO_KEY + '@' + process.env.MONGO_URL + '?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000'

mongoose
  .connect(mongooseurl, {
    useNewUrlParser: true,
    useUnifiedTopology: true
  })
  .then(() => console.log("Database connected! \n "))
  .catch(err => console.log(err));

module.exports = {
  insert_mongodb: async function (text, translateText, targetLanguage) {

    const hash = crypto.createHash('sha256').update(text).digest('hex');

    const newDoc = {
      hash: hash,
      targetLanguage: targetLanguage,
      text: text,
      translateText: translateText,
    };

    try {
      const createdDoc = await db.create(newDoc);
      console.log(`\n New document created: ${createdDoc} \n------------------------------------------------------------------------------`);
    } catch (error) {
      console.log(error);
    }
  },

  checkHashExistence: async function (text, targetLanguage) {
    const hash = crypto.createHash('sha256').update(text).digest('hex');

    try {
      const entry = await db.findOne({ hash: hash, targetLanguage: targetLanguage });
      if (entry) {
        console.log(`Document with hash value ${entry.hash.substring(0, 10)} and target language ${targetLanguage} already exists in the collection with text:\n${entry.text}`);
        console.log(`Using Translation from Database\n------------------------------------------------------------------------------`);
        return entry.translateText; // Return the text value of the entry
      } else {
        console.log(`Document with hash value ${hash.substring(0, 10)} does not(!) exist in the collection with target language ${targetLanguage}`);
        console.log(`Text will be translated`);
        return 0; // Return 0 if entry is not found
      }
    } catch (error) {
      console.log(error);
      return null; // Return null if there is an error
    }
  }
}