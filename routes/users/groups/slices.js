const { getDebtAmountByUserId, updateDebtAmount, getAllAmountsByGroupsId } = require('../../../models/groups_has_users.model');
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

router.post('/add', async (req, res) => {
    try {
        //GESTIONO EL REQ.BODY Y EL REQ.PARAMS PARA OBTENER LOS DATOS NECESARIOS
        const { groupId } = req.groupId;
        const { description, amount, userId, usersDebtors } = req.body;

        //CREO EL SLICE
        const [slice] = await createSlice({ groupId, description, amount });

        //EXTRAIGO LA ID DEL SLICE
        const sliceId = slice.insertId;

        //AÑADO UN PAGADOR
        const action = 'pay';
        const [payer] = await addUserToSlice({ sliceId, userId, action });

        //AÑADO TANTOS DEUDORES COMO DEUDORES HAYA EN EL ARRAY
        usersDebtors.map(async (userId) => {
            const action = 'debt';
            await addUserToSlice({ sliceId, userId, action });
        });

        //GENERO VARIABLES PARA HACER LOS CÁLCULOS. 
        const players = usersDebtors.length + 1;
        const slicing = amount / players;

        //AÑADO UN SALDO POSITIVO AL PAGADOR
        const [amountObject] = await getDebtAmountByUserId({ userId, groupId });
        const { debtAmount } = amountObject[0];
        const restSlicing = slicing * (players - 1);
        const newAmount = +debtAmount + +restSlicing;
        await updateDebtAmount({ newAmount, userId, groupId });

        //AÑADO UN SALDO NEGATIVO A LOS DEUDORES
        usersDebtors.map(async (userId) => {
            const [amountObject] = await getDebtAmountByUserId({ userId, groupId });
            const { debtAmount } = amountObject[0];
            const newAmount = +debtAmount - +slicing;
            await updateDebtAmount({ newAmount, userId, groupId });
        });

        //FABRICO LA RESPUESTA
        const [allDebts] = await getAllAmountsByGroupsId(groupId);
        res.json(allDebts);

    } catch (error) {
        res.json({ fatal: error.message })
    }
}
)



module.exports = router;