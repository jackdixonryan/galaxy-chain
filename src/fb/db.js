const firebase = require('firebase');

// Initialize Firebase
let config = {
  apiKey: process.env.FIREBASE_KEY,
  authDomain: "galaxy-chain.firebaseapp.com",
  databaseURL: "https://galaxy-chain.firebaseio.com",
  projectId: "galaxy-chain",
  storageBucket: "galaxy-chain.appspot.com",
  messagingSenderId: "418523721533"
};

firebase.initializeApp(config);

const db = firebase.firestore();
const settings = {
  timestampsInSnapshots: true
};
db.settings(settings);

module.exports = db;
