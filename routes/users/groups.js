const { getGroupsByUserId } = require('../../models/groups.model');
const { getUsersByGroupId } = require('../../models/users.model');

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

        for (let group of groups) {
            const [players] = await getUsersByGroupId(group.groupId);
            group.players = players;
        }

        res.json(groups);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

//TODO DATOS DEL GRUPO
//ahora tiene que recuperar cada usuario que está en ese grupo, por lo que hay que hacer un busqueda por id del grupo en GROUPS_HAS_USERS y guardar en un array los datos de los participantes)

//TODO CREAR UN GRUPO NUEVO

//TIENE QUE INSERTAR lOS DATOS DEL GRUPO Y TANTOS GROUPS_HAS_USERS COMO USUARIOS META EN EL BODY. POR LO QUE TIENE QUE RECOGER LOS DATOS DEL BODY Y EXTRAER LA ID DE ESOS USUARIOS. TIENE QUE DARLE A TODOS ESOS USUARIOS EL ROL DE VIEWER Y POR ÚLTIMO, TIENE QUE METERSE A SÍ MISMO CON EL ROL DE ADMIN

// router.post('/new', async (req, res) => {

// });



module.exports = router;