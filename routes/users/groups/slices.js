const { getDebtAmountByUserId, updateDebtAmount } = require('../../../models/groups_has_users.model');
const { getSlicesByGroupId, createSlice } = require('../../../models/slices.models');
const { addUserToSlice } = require('../../../models/slices_has_users.model');

const router = require('express').Router();

router.get('/', async (req, res) => {
    const { groupId } = req.groupId;
    try {
        const [slices] = await getSlicesByGroupId(groupId);
        //AQUI AHORA TENGO QUE ENCONTRAR LA INFO DE LOS USUARIOS DE CADA SLICE
        res.json(slices);
    } catch {
        res.json({ fatal: error.message })
    }
});

router.get('/add', async (req, res) => {
    try {
        //GESTIONO EL REQ.BODY Y EL REQ.PARAMS PARA OBTENER LOS DATOS NECESARIOS
        const { groupId } = req.groupId;
        const { description } = req.body.description;
        const { amount } = req.body.description;
        const { userId } = req.body.userId;
        const { usersDebtors } = req.body.userDebtors;
        //CREO EL SLICE
        const [slice] = await createSlice(groupId, description, amount);

        //EXTRAIGO LA ID DEL SLICE
        const sliceId = slice.insertId;
        //AÑADO UN PAGADOR
        const userAction = 'pay';
        await addUserToSlice(sliceId, userId, userAction);
        //AÑADO TANTOS DEUDORES COMO DEUDORES HAYA EN EL ARRAY
        usersDebtors.map(async (userId) => {
            const userAction = 'debt';
            await addUserToSlice(sliceId, userId, userAction)
        });

        //GENERO VARIABLES PARA HACER LOS CÁLCULOS. 
        const players = usersDebtors.length + 1;
        const slicing = amount / players;
        //AÑADO UN SALDO POSITIVO AL PAGADOR
        const [previousAmount] = await getDebtAmountByUserId(groupId, userId);
        const newAmount = previousAmount + slicing;
        const [result] = await updateDebtAmount(groupId, userId, newAmount);
        //AÑADO UN SALDO NEGATIVO A LOS DEUDORES
        usersDebtors.map(async (userId) => {
            const [previousAmount] = await getDebtAmountByUserId(groupId, userId);
            const newAmount = previousAmount - slicing;
            const [result] = await updateDebtAmount(groupId, userId, newAmount);
        })

    } catch (error) {
        res.json({ fatal: error.message })
    }
}
)



module.exports = router;