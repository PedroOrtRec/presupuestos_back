const dayjs = require('dayjs');
const jwt = require('jsonwebtoken');

const createToken = (user) => {
    const obj = {
        user_id: user.userId,
        expt: dayjs().add(10, 'days').unix()
    }
    return jwt.sign(obj, 'La vida es como una caja de pizza')
}

module.exports = {
    createToken
}