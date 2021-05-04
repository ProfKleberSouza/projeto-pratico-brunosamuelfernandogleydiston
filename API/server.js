const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const express = require("express");
const cors = require("cors");
const admin = require("firebase-admin");
const { getServiceAccount } = require("./getCredentials.js");

const serviceAccount = getServiceAccount();

admin.initializeApp(serviceAccount);

const PORT = process.env.PORT || 3000;
const app = express();

app.use(cors())
app.use(express.json())

app.get("/", (req, res) => res.json({ 'Mensagem': 'Bem Vindo' }))


app.listen(PORT, () => console.log('Server Iniciado na Porta:', PORT))