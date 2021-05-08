const { Doacoes } = require('../models/DoacoesModels')

module.exports = {
    async index(req, res) {
        const { page = 1 } = req.query
        const doacoes = await Doacoes.find(10, page - 1);
        return res.json(doacoes)
    },
    async show(req, res) {
        const doacoes = await Doacoes.findById(req.params.id)
        return res.json(doacoes)
    },
    async store(req, res) {
        const doacoes = await Doacoes
            .push(req.body)
            .last()
            .assign({ id: Date.now().toString() })
            .write()
        return res.json(doacoes)
    },
    async update(req, res) {
        const doacoes = await Doacoes.save({ id: req.params.id, ...req.body })
        return res.json(doacoes)
    },
    async destroy(req, res) {
        await Doacoes.deleteById(req.params.id)
        return res.send()
    }
}