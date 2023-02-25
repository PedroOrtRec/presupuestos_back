const jwt = require('jsonwebtoken');

const checkToken = async (req, res, next) => {
    if (!req.headers['authorization']) {
        return res.json
    }
}