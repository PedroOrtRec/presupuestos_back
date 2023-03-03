const dayjs = require('dayjs');
const jwt = require('jsonwebtoken');
const { createSlice } = require('../models/slices.models');

const createToken = (user) => {
    const obj = {
        user_id: user.userId,
        expt: dayjs().add(10, 'days').unix()
    }
    return jwt.sign(obj, 'La vida es como una caja de pizza')
}

const manageSlide = async ({ description, amount, userPay, usersDebt }) => {
    try {
        const [slice] = await createSlice(description, amount);
        const sliceId = slice.insertId;
        const [pay] = await addPayer(sliceId, userPay);
        usersDebt.map(async (debt) => await addDebt(sliceId, debt));

        const players = usersDebt.length - 1;
        const slicing = amount / players;

    } catch (error) {
        res.json({ fatal: error.message })
    }
}

module.exports = {
    createToken
}
