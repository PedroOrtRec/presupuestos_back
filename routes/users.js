const router = require('express').Router();

const { checkToken } = require('../helpers/middlewares')

router.use('/home', checkToken, require('./users/home'));

router.use('/groups', checkToken, require('./users/groups'));

module.exports = router;
