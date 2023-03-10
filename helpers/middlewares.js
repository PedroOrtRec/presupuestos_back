const jwt = require('jsonwebtoken');

const { getUserById } = require('../models/users.model');

const checkToken = async (req, res, next) => {
    if (!req.headers['authorization']) {
        return res.json({ fatal: 'No se encontrĂ³ el token' })
    }

    const token = req.headers['authorization'];

    let obj;
    try {
        obj = jwt.verify(token, 'La vida es como una caja de pizza');
    } catch (error) {
        return res.json({ fatal: 'El token es incorrecto' });
    }

    const [result] = await getUserById(obj.user_id);
    req.user = result[0];

    next();
}

const checkGroups = async (req, res, next) => {
    const groupId = req.params;
    req.groupId = groupId;
    next();
}

module.exports = { checkToken, checkGroups }