//CONFIG .ENV Y DB

require('dotenv').config();
require('../config/mongodb');

//IMPORTACIÓN DEL MODELO

const User = require('../models/users_mongo.model');

/**
 * Config socket.io
 
*/
const io = require('socket.io')(server, {
    cors: { origin: '*' }
});

//CONEXIÓN

io.on('connection', (socket) => {
    console.log('se ha conectado un cliente');
    socket.on('connectedUser', async data => {
        await User.create(data);
    })
});


