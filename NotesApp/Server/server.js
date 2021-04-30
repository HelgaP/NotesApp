const mongoose = require('mongoose')
const express = require('express')
var Note = require('./schema')
const serverIP = "192.168.0.12"

var app = express()

mongoose.connect("mongodb://localhost/copyApp", {useNewUrlParser: true, useUnifiedTopology: true})

mongoose.connection.once("open", () => {
    console.log("Connected to db!")
}).on("failed", (err) => {
    console.log("Failed to connect to db " + err)
})

app.listen(8081, serverIP, () => {
    console.log("Listening on port 8081")
})

app.get('/fetch', (req, res) => {
    var foundItems = Note.find({}).then((foundItems) => {   
        
        res.send(foundItems)
    }, (err) => {
        console.log("Failed to fetch items due to " + err)
    })
})

app.post('/create', (req, res) => {
    const note = new Note ({
        title: req.get("title"),
        note: req.get("note"),
        datee: req.get("datee")
    }).save(() => {
        console.log("Saved data!")
    }, (err) => {
        console.log("Failed to save data!")
    })

    res.send(note)
})

app.post('/update', (req, res) => {
    Note.findOneAndUpdate({
        _id: req.get("id"),
        
    }, {
        title: req.get("title"),
        note: req.get("note"),
        datee: req.get("datee")
    })

    res.send("Updated!")
})

app.post('/delete', (req, res) => {
    Note.findOneAndRemove({
        _id: req.get("id")
    })
    res.send("Deleted!")
})