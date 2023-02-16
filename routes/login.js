const { createUser, getUserById } = require('../models/users.model');

const router = require('express').Router();

router.post('/', async (req, res) => {
    try {
        const [result] = await createUser(req.body)
        const [user] = await getUserById(result.insertId);
        res.json(user[0]);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

module.exports = router;