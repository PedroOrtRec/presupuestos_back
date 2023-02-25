const { getGroupsByUserId } = require('../../models/groups.model');

const router = require('express').Router();

// router.get('/:userId', async (req, res) => {
//     const { userId } = req.params;

//     try {
//         const [groups] = await getGroupsByUserId(userId);
//         if (groups.length === 0) {
//             res.json({ fatal: 'No hay grupos y/o el usuario no existe' });
//         }
//         res.json(groups[0]);
//     } catch (error) {
//         res.json({ fatal: error.message })
//     }
// });

router.get('/', async (req, res) => {
    const { userId } = req.user;

    try {
        const [groups] = await getGroupsByUserId(userId);
        if (groups.length === 0) {
            res.json({ fatal: 'No hay grupos' });
        }
        res.json(groups);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

//TODO CREAR UN GRUPO NUEVO

//TIENE QUE INSERTAR TANTOS GROUPS_HAS_USERS COMO USUARIOS META EN EL BODY. POR LO QUE TIENE QUE RECOGER LOS DATOS DEL BODY Y EXTRAER LA ID DE ESOS USUARIOS. TIENE QUE DARLE A TODOS ESOS USUARIOS EL ROL DE VIEWER Y POR ÚLTIMO, TIENE QUE METERSE A SÍ MISMO CON EL ROL DE ADMIN

// router.post('/new', async (req, res) => {

// });



module.exports = router;