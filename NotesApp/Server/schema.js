const mongoose = require('mongoose')

var mySchema = mongoose.Schema({
    title: String,
    note: String,
    datee: String
})

var Note = mongoose.model("Note", mySchema)

module.exports = Note