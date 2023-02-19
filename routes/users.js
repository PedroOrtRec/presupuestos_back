const { getUserById } = require('../models/users.model');

const router = require('express').Router();

router.get('/:userId', async (req, res) => {
  const { userId } = req.params;

  try {
    const [user] = await getUserById(userId);
    if (user.length === 0) {
      res.json({ fatal: 'Este usuario no existe' });
    }
    res.json(user[0]);
  } catch (error) {
    res.json({ fatal: error.message })
  }
});

router.use('/groups', require('./users/groups'));

module.exports = router;
