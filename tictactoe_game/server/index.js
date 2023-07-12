// mongo db password: lvczDhVlKywXyXWO

const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

// initialize and store express in app 
const app = express();

const port = process.env.PORT || 3000;  // once server deployed to web it runs with the port that has using process.env.PORT, if not deployed it runs with port 3000

var server = http.createServer(app);  // creates a server, here createServer() takes and argument requestListner, here app is that listener

var socketio = require("socket.io");
var io = socketio(server);  
// short hand code for above two lines is: var io = require("socket.io")(server);

//connect db
const DB = "mongodb+srv://developmentthiru:lvczDhVlKywXyXWO@cluster0.vuh5yyg.mongodb.net/?retryWrites=true&w=majority";

mongoose.connect(DB).then(()=>{
    console.log("Connection successful");
}).catch((e)=>{
    console.log(e);
});


//middle ware, where the data from client goes to the middle ware and converts to json or do some functions and reaches to server.
// here we are converting data to json using middle ware 
app.use(express.json());

server.listen(port, "0.0.0.0", function(){
console.log(`Server started and running in port ${port}`);  // in javascript the string interpolation can be done using backtciks(``), rather than normal single or double quotes.
})