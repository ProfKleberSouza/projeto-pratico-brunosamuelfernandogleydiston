const express = require("express");
const cors = require("cors");


const cookieParser = require("cookie-parser");
const csrf = require("csurf");


const admin = require("firebase-admin");
const { getServiceAccount } = require("./getCredentials.js");
const serviceAccount = getServiceAccount();
admin.initializeApp(serviceAccount);

// # Setup Express
const PORT = process.env.PORT || 3000;
const app = express();
app.use(cors())
app.use(express.json());
app.use('/', require('./src/routes') )


app.listen(PORT, () => console.log('Server Iniciado na Porta:', PORT))