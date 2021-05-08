
const express = require('express')
const routes = express.Router()

const DoacoesController = require('./controllers/DoacoesController');



routes.get("/", (_, res) =>
    res.json({ 'Mensagem': 'Bem Vindo' }))
routes.get('/doacoes', DoacoesController.index)
routes.post('/doacoes', DoacoesController.store)
routes.get('/doacoes/:id', DoacoesController.show)
routes.put('/doacoes/:id', DoacoesController.update)
routes.delete('/doacoes/:id', DoacoesController.destroy)

module.exports = routes 