const { checkGroups } = require('../../helpers/middlewares');
const { getGroupsByUserId, createGroup, getGroupById } = require('../../models/groups.model');
const { addOneUserToGroup, getRolByUserId } = require('../../models/groups_has_users.model');
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

router.post('/new', async (req, res) => {
    //Primero declaro dos variables que voy a necesitar para incluir al usuario creador del grupo como administrador del grupo creado, el userRol como 'admin' y el userId del usuario creador 
    const userRol = 'admin';
    const { userId } = req.user;
    try {
        //Ahora creo el grupo
        const [result] = await createGroup(req.body);
        //Y extraigo la id del grupo recién creado
        const groupId = result.insertId;
        //Y ahora añado el usuario con una debtAmount inicial de 0.00
        const debtAmount = 0.00;
        const [added] = await addOneUserToGroup({ userRol, groupId, userId, debtAmount });
        //Y ahora construyo la respuesta con el grupo y su usuario
        const [group] = await getGroupById(groupId);
        const [admin] = await getUsersByGroupId(groupId);
        group[0].admin = admin;
        res.json(group);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.post('/:groupId/addUser', async (req, res) => {
    const { groupId } = req.params;
    const { userId } = req.user;
    try {
        const [admin] = await getRolByUserId({ userId, groupId })
        const { userRol } = admin[0];
        if (userRol !== 'admin') {
            res.json({ fatal: 'No eres administrador de este grupo' })
        } else {
            const userRol = 'viewer';
            const { userId } = req.body;
            const debtAmount = 0.00;
            const [added] = await addOneUserToGroup({ userRol, groupId, userId, debtAmount });
            //Lo siguiente es lo mismo que arriba, lo tengo que meter en una función
            const [group] = await getGroupById(groupId);
            const [users] = await getUsersByGroupId(groupId);
            group[0].users = users;
            res.json(group);
            //ESTO NO IMPIDE QUE SE AGREGUE UNA Y OTRA VEZ EL MISMO USUARIO
        }
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.use('/:groupId/slices', checkGroups, require('./groups/slices'));

module.exports = router;