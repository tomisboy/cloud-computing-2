const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const axios = require('axios');
const db = require('./db.js')

require('dotenv').config();

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use('/css', express.static(__dirname + 'public/css'))
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


const translatorKey = process.env.TRANSLATOR_KEY;

// Routen-Handler
app.get('/', (req, res) => {
    res.render('index', { 
    text: 'Willkommen! Hier beliebigen Text zur Übersetzung eingeben'
    , translatedText: ''
    , targetLanguage: '' });
});


app.post('/', async (req, res) => {
    const text = req.body.text;
    const targetLanguage = req.body['target-language'] || 'en';
    const endpoint = `https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=${targetLanguage}`;

    // check if Text is alreagy present in DB
    let translatedText = await db.checkHashExistence(text, targetLanguage);

    if (translatedText == 0) { // Text has not been translated before
        translatedText = await translateText(text, endpoint);
        console.log("Translated text from API --> " + translatedText)
        await db.insert_mongodb(text, translatedText, targetLanguage);
    }

    res.render('index', { text, translatedText,targetLanguage });

});


// Translate Function
async function translateText(text, endpoint) {

    const response = await axios.post(endpoint, [{ 'Text': text }], {
        headers: {
            'Content-Type': 'application/json',
            'Ocp-Apim-Subscription-Key': translatorKey,
            'Ocp-Apim-Subscription-Region': 'westeurope'
        }
    });
    return response.data[0].translations[0].text;
}


const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server läuft auf Port ${PORT}`);
});
