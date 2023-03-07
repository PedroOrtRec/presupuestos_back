const router = require('express').Router();

const { checkToken } = require('../helpers/middlewares');
const { getAllUsers } = require('../models/users.model');

router.get('/all', checkToken, async (req, res) => {
    try {
        const [all] = await getAllUsers()
        res.json(all)
    } catch (error) {
        res.json({ fatal: error.message })
    }
})

router.use('/home', checkToken, require('./users/home'));

router.use('/groups', checkToken, require('./users/groups'));

router.use('/social', checkToken, require('./users/social'));

router.use('/uploads', require('./users/uploads'))

module.exports = router;
