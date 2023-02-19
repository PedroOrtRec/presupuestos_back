const router = require('express').Router();

router.use('/home', require('./users/home'));

router.use('/groups', require('./users/groups'));

module.exports = router;
