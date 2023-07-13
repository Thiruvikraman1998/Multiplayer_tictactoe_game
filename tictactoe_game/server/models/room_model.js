//creating a room model using mongoose

const mongoose = require('mongoose');
const playerSchema = require('./player');

// skeleton of the room
const roomSchema = new mongoose.Schema({
    occupancy:{
        type: Number,
        default: 2
    },
    maxRounds:{
        type: Number,
        default: 5
    },
    currentRound: {
        required: true,
        type: Number,
        default: 1
    },
    player: [playerSchema],
    isJoin: {
        type: Boolean,
        default: true
    },
    turn: playerSchema,
    // turnIndex keep tracks of the user's turn
    turnIndex: {
        type: Number,
        default: 0
    }
})

//convert roomSchema to a room Model so that we can store the data to the mongodb database

const roomModel = mongoose.model('Room', roomSchema);

module.exports = roomModel;  //to use it as export to other JS files.