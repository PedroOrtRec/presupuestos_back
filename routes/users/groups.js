const { getGroupsByUserId } = require('../../models/groups.model');

const router = require('express').Router();

router.get('/:userId', async (req, res) => {
    const { userId } = req.params;

    try {
        const [groups] = await getGroupsByUserId(userId);
        if (groups.length === 0) {
            res.json({ fatal: 'No hay grupos' });
        }
        res.json(groups[0]);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

module.exports = router;