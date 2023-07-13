// mongo db password: lvczDhVlKywXyXWO

const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

// initialize and store express in app 
const app = express();

const port = process.env.PORT || 3000;  // once server deployed to web it runs with the port that has using process.env.PORT, if not deployed it runs with port 3000

var server = http.createServer(app);  // creates a server, here createServer() takes and argument requestListner, here app is that listener

const Room = require('./models/room_model');
// var socketio = require("socket.io");
// var io = socketio(server);  
// short hand code for above two lines is: 
var io = require("socket.io")(server);

//middle ware, where the data from client goes to the middle ware and converts to json or do some functions and reaches to server.
// here we are converting data to json using middle ware 
app.use(express.json());

//connect db
const DB = "mongodb+srv://developmentthiru:lvczDhVlKywXyXWO@cluster0.vuh5yyg.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) =>{
    console.log("connected sockets");

    // create room
    socket.on("createRoom", async ({name})=>{
        console.log(name);
        console.log(socket.id);
        try{
            let room = new Room();
        
        let player = {
            socketId: socket.id,
            name: name,
            playerType: 'X'
        };
        room.players.push(player);  // push() is nothing but add() in dart. adding the player object to the players list that is located in room model.
        room.turn = player;   // who ever creates a room has the first turn.
        room = await room.save();  // saves the room data to mongo db.
        // now after saving the room the mongo db automatically genereates an _id and gives to us, we'll now store it to a variable
        const roomId = room._id.toString();

        socket.join(roomId);  // passes to the specific game.

        io.to(roomId).emit("CreateRoomSuccess!", room);
        }catch(e){
            console.log(e.toString());
        }
    });

    // join room
    socket.on("joinRoom", async ({name, roomId}) =>{
        try{
            if(!roomId.match(/^[0-9a-fA-F]{24}$/)){  // match(/^[0-9a-fA-F]{24}$/) to check whether the roomId from the user is a valid mongoDb generated id using this regEx values.
                socket.emit("error", "Please enter a valid ID");
                return;
            }

            let room = await Room.findById(roomId);

            if(room.isJoin){
                let player = {
                    name: name,
                    socketId: socket.id,
                    playerType: 'O'
                }
                socket.join(roomId);
                room.players.push(player);
                room.save();
                io.to(roomId).emit("joinRoomSuccess!", room);
            }else{
                socket.emit("error", "Game Started, could not join, try again later");
            }
        }catch(e){
            console.log(e)
        }
    });
});

mongoose.connect(DB).then(()=>{
    console.log("Connection successful");
}).catch((e)=>{
    console.log(e);
});

server.listen(port, "0.0.0.0", function(){
console.log(`Server started and running in port ${port}`);  // in javascript the string interpolation can be done using backtciks(``), rather than normal single or double quotes.
})