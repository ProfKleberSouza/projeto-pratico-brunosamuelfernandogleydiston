const { promiseImpl } = require('ejs')
const low = require('lowdb')
const FileAsync = require('lowdb/adapters/FileAsync')

const adapter = new FileAsync('../db/db.json')


exports.Doacoes = async () => Promise.resolve((await low(adapter)).get('doacoes'))
