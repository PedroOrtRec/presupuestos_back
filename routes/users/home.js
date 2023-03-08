const { getGroupIdByInvitationId, getGroupById } = require('../../models/groups.model');
const { addOneUserToGroup } = require('../../models/groups_has_users.model');
const { getAllInvitationsByUserId, checkInvitation, acceptInvitation, declineInvitation } = require('../../models/invitations.model');
const { getUserById, getUsersByGroupId } = require('../../models/users.model');

const router = require('express').Router();

// router.get('/:userId', async (req, res) => {
//     const { userId } = req.params;

//     try {
//         const [user] = await getUserById(userId);
//         if (user.length === 0) {
//             res.json({ fatal: 'Este usuario no existe' });
//         }
//         res.json(user[0]);
//     } catch (error) {
//         res.json({ fatal: error.message })
//     }
// });

router.get('/', async (req, res) => {
    const { userId } = req.user;
    try {
        const [user] = await getUserById(userId);
        if (user.length === 0) {
            res.json({ fatal: 'Este usuario no existe' });
        }
        res.json(user[0]);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.get('/invitations', async (req, res) => {
    const { userId } = req.user;
    try {
        const [invitations] = await getAllInvitationsByUserId(userId);
        if (invitations.length === 0) {
            res.json({ fatal: 'No hay invitaciones' })
        }
        res.json(invitations)
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.patch('/invitations/:invitationId', async (req, res) => {
    const { invitationId } = req.params;
    try {
        const [checked] = await checkInvitation(invitationId);
        res.json(checked)
    } catch (error) {
        res.json({ fatal: error.message })
    }
});

router.patch('/invitations/:invitationId/decline', async (req, res) => {
    const { invitationId } = req.params;
    try {
        const [declined] = await declineInvitation(invitationId);
        res.json(declined)
    } catch (error) {
        res.json({ fatal: error.message })
    }
})

router.post('/invitations/:invitationId/accept', async (req, res) => {
    const { userId } = req.user;
    const { invitationId } = req.params;
    try {
        const [accepted] = await acceptInvitation(invitationId);
        const userRol = 'viewer';
        const debtAmount = 0.00;
        const [groupData] = await getGroupIdByInvitationId(invitationId);

        const { groupId } = groupData[0];


        const [added] = await addOneUserToGroup({ userRol, groupId, userId, debtAmount });
        const [group] = await getGroupById(groupId);
        const [users] = await getUsersByGroupId(groupId);
        group[0].users = users;
        res.json(group);
    } catch (error) {
        res.json({ fatal: error.message })
    }
});





module.exports = router;