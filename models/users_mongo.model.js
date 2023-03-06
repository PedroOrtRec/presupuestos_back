const { model, Schema } = require('mongoose');

const userSchema = new Schema({
    username: String,
    socket_id: {
        required: true,
        type: String
    }
}, {
    timestamps: true
});

module.exports = model('user', userSchema);