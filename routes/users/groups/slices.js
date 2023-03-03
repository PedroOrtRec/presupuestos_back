const { getSlicesByGroupId } = require('../../../models/slices.models');

const router = require('express').Router();

router.get('/', async (req, res) => {
    const { groupId } = req.groupId;
    try {
        const [slices] = await getSlicesByGroupId(groupId);
        res.json(slices);
    } catch {
        res.json({ fatal: error.message })
    }
});

router.get('/add', async (req, res) => {
    // REQUERIR DEL BODY LOS DATOS DEL SLICE


    //HACER LAS CUENTAS

    //MANDAR LOS RESULTADOS AL GROUPS_HAS_USERS
})



module.exports = router;