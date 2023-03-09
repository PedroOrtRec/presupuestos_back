const { getDebtAmountByUserId, updateDebtAmount, getAllAmountsByGroupsId } = require('../../../models/groups_has_users.model');
const { getSlicesByGroupId, createSlice, deleteSlice } = require('../../../models/slices.models');
const { addUserToSlice, getPayerBySliceId } = require('../../../models/slices_has_users.model');
const { getUsersBySliceId } = require('../../../models/users.model');

const router = require('express').Router();

router.get('/', async (req, res) => {
    const { groupId } = req.groupId;
    try {
        const [slices] = await getSlicesByGroupId(groupId);
        //AQUI AHORA TENGO QUE ENCONTRAR LA INFO DE LOS USUARIOS DE CADA SLICE

        const array = await Promise.all(slices.map(async slice => {
            const [users] = await getUsersBySliceId(slice.sliceId)

            slice.users = users;

            console.log(slice.sliceId)

            const [payer] = await getPayerBySliceId(slice.sliceId);

            slice.payer = payer[0];

            return slice
        }))
        console.log(array)
        res.json(array)

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
        const players = usersDebtors.length;
        const slicing = amount / players;

        //AÑADO UN SALDO POSITIVO AL PAGADOR
        const [amountObject] = await getDebtAmountByUserId({ userId, groupId });
        const { debtAmount } = amountObject[0];
        const restSlicing = amount;
        const newAmount = +debtAmount + +restSlicing;
        await updateDebtAmount({ newAmount, userId, groupId });

        //AÑADO UN SALDO NEGATIVO A LOS DEUDORES
        await Promise.all(usersDebtors.map(async (userId) => {
            const [amountObject] = await getDebtAmountByUserId({ userId, groupId });
            const { debtAmount } = amountObject[0];
            const newAmount = Number(debtAmount) - Number(slicing);
            await updateDebtAmount({ newAmount, userId, groupId });
        }));

        //FABRICO LA RESPUESTA
        const [allDebts] = await getAllAmountsByGroupsId(groupId);

        res.json(allDebts);

    } catch (error) {
        res.json({ fatal: error.message })
    }
}
)


router.delete('/:sliceId/delete', async (req, res) => {
    const { sliceId } = req.params;
    try {
        const [result] = await deleteSlice(sliceId)
        res.json(result);
    } catch (error) {
        res.json({ fatal: error.message });
    }
});


module.exports = router;