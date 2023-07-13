const mongoose = require('mongoose');

const playerSchema = new mongoose.Schema({
    name: {
        type: String,
        trim: true
    },
    socketId: {
        type: String,
    },  // will get unique id when room is created
    points: {
        type: Number,
        default: 0
    },
    playerType: {
        required: true,
        type: String
    } // whether the player is playing as X or O.
});

module.exports = playerSchema; // to use it as export to other JS files.