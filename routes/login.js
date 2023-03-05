const router = require('express').Router();
const bcrypt = require('bcryptjs');

const { createToken } = require('../helpers/utils')
const { createUser, getUserById, getUserByEmail } = require('../models/users.model');


router.post('/register', async (req, res) => {
    try {
        req.body.password = bcrypt.hashSync(req.body.password, 8);
        const [result] = await createUser(req.body)
        const [user] = await getUserById(result.insertId);
        res.json({
            succes: user[0],
            token: createToken(user[0])
        });
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.post('/', async (req, res) => {
    console.log('Principio del post')
    const [users] = await getUserByEmail(req.body.userEmail);
    if (users.length === 0) {
        return res.json({ fatal: 'Usuario y/o contraseña incorrectos' })
    }

    const user = users[0];

    console.log('Antes de la comparación de ls encriptación')
    console.log(req.body.password);
    console.log(user.password)

    const sames = bcrypt.compareSync(req.body.password, user.password);

    console.log('Después de la comparación de la encriptación')

    if (!sames) {
        return res.json({ fatal: 'Usuario y/o contraseña incorrectos' });
    }

    res.json({
        succes: 'Login correcto',
        token: createToken(user)
    })

});

module.exports = router;