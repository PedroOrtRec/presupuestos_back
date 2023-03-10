const { checkGroups } = require('../../helpers/middlewares');
const { getGroupsByUserId, createGroup, getGroupById, deleteGroup } = require('../../models/groups.model');
const { addOneUserToGroup, getRolByUserId, getAllAmountsByGroupsId, getDebtAmountByUserId, deleteUserFromGroup } = require('../../models/groups_has_users.model');
const { sendInvitation } = require('../../models/invitations.model');
const { getUsersByGroupId, getUserByEmail, getUserByPhone, getUserById, downloadImage } = require('../../models/users.model');

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
    console.log('Estas en users/groups')
    const { userId } = req.user;
    console.log(userId)
    try {
        const [groups] = await getGroupsByUserId(userId);
        if (groups.length === 0) {
            res.json([]);
        } else {
            for (let group of groups) {
                const [players] = await getUsersByGroupId(group.groupId);
                group.players = players;
            }

            res.json(groups);
        }
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
            const [group] = await getGroupById(groupId);
            const [users] = await getUsersByGroupId(groupId);
            group[0].users = users;
            res.json(group);
        }
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.delete('/:groupId/deleteUser/:userId', async (req, res) => {
    const { groupId, userId } = req.params;
    try {
        // const [amount] = await getDebtAmountByUserId({ userId, groupId });
        const [userOut] = await deleteUserFromGroup({ userId, groupId });
        // const [usersInto] = await getUsersByGroupId(groupId);
        // await Promise.all(usersInto.map(async user => { console.log(user) }))
        res.json(userOut)
    } catch (error) {
        res.json({ fatal: error.message })
    }
})

router.get('/:groupId', async (req, res) => {
    const { groupId } = req.params
    try {
        const [result] = await getGroupById(groupId)
        const group = result[0];
        res.json(result);
    } catch (error) {
        res.json({ fatal: error.message });
    }
});

router.delete('/:groupId/delete', async (req, res) => {
    const { groupId } = req.params;
    try {
        const [result] = await deleteGroup(groupId)
        res.json(result);
    } catch (error) {
        res.json({ fatal: error.message });
    }
});

router.get('/:groupId/users', async (req, res) => {
    const { groupId } = req.params
    try {
        const [result] = await getUsersByGroupId(groupId);
        res.json(result)
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.get('/:groupId/amounts', async (req, res) => {
    const { groupId } = req.params;
    try {
        const [result] = await getAllAmountsByGroupsId(groupId)
        res.json(result)
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.post('/:groupId/invitation', async (req, res) => {
    const { groupId } = req.params;
    const { userId } = req.user;
    const { userEmail, userPhone } = req.body;
    const status = 'pending';
    let invitedUser = [];
    try {
        const [admin] = await getRolByUserId({ userId, groupId })
        if (admin.length === 0) {
            res.json({ fatal: 'No eres usuario de este grupo' })
            return userId
        }
        const { userRol } = admin[0];
        if (userRol !== 'admin') {
            res.json({ fatal: 'No eres administrador de este grupo' });
            return userRol;
        }
        if (userEmail) {
            [invitedUser] = await getUserByEmail(userEmail);
        } else if (userPhone) {
            [invitedUser] = await getUserByPhone(userPhone);
        }
        const toId = invitedUser[0].userId;
        const [invitation] = await sendInvitation({ userId, toId, groupId, status });
        res.json(invitation);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.get('/avatar/:userId', async (req, res) => {
    const { userId } = req.params
    console.log('en el /avatar')
    try {
        const [result] = await downloadImage(userId);
        console.log(result)
        const imagePath = result[0];
        console.log(imagePath)
        res.json(imagePath)
    } catch (error) {
        res.json({ fatal: error.message })
    }
})

router.use('/:groupId/slices', checkGroups, require('./groups/slices'));

module.exports = router;