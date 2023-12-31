const { Console } = require('console');
const { Socket } = require('dgram');
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 4000;
var server = http.createServer(app);
const Room = require('./model/room');

var io = require("socket.io")(server);


app.use(express.json());

const DB = "mongodb+srv://subhajitk735:subhajitk735@cluster0.kz6yt05.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log("Socket Connected");
    socket.on("createRoom", async ({ nickname }) => {
        console.log(nickname);
        try {
            //create room
            let room = new Room();
            //create player 
            let player = {
                socketID: socket.id,
                nickname,
                playerType: 'X',
            }
            //add this player to room
            room.players.push(player);
            room.turn = player;
            room = await room.save();
            console.log(room);
            //we get a room id from room

            const roomID = room._id.toString;
            socket.join(roomID);
            //room is created now go to next page
            //io->send data to evryone
            //socket->sending data to yourself
            io.to(roomID).emit('CreateRoomSuccess', room);
        } catch (e) {
            console.log(e);
        }
    });

});

mongoose.connect(DB).then(() => {
    console.log("DB Connection Success");
})
    .catch((e) => {
        console.log(e);
    });

server.listen(port, () => {
    console.log(`Server Started and running on ${port}`);
});