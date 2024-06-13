const admin = require('firebase-admin');
const serviceAccount = require("../movix-6b04e-firebase-adminsdk-bfg9h-1aebd1d56f.json"); 

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: 'gs://movix-6b04e.appspot.com' // Firebase Storage bucket URL
});

const storage = admin.storage();
const bucket = storage.bucket();

module.exports = bucket;
