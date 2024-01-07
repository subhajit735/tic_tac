const { Console } = require('console');
const { Socket } = require('dgram');
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 4000;
var server = http.createServer(app);


var io = require("socket.io")(server);


app.use(express.json());

const DB = "mongodb+srv://subhajitk735:subhajitk735@cluster0.kz6yt05.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log("Socket Connected");
    socket.on("createRoom", ({ nickname }) => {
        console.log(nickname);
    });
});

// mongoose.connect(DB).then(() => {
//     console.log("DB Connection Success");
// })
//     .catch((e) => {
//         console.log(e);
//     });

server.listen(port, () => {
    console.log(`Server Started and running on ${port}`);
});