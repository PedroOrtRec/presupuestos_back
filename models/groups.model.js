const getGroupsByUserId = (userId) => {
    return db.query('SELECT g.groupId, g.groupTitle, g.groupDescription, g.creationTime FROM dbgroups AS g INNER JOIN groups_has_users AS tbi ON g.groupId = tbi.groupId INNER JOIN users AS u ON tbi.userId = u.userId WHERE u.userId = ?', [userId])
}

const getGroupById = (groupId) => {
    return db.query('SELECT * FROM dbgroups WHERE groupId = ?', [groupId])
}

const getGroupIdByInvitationId = (invitationId) => {
    return db.query('SELECT g.groupId FROM dbgroups AS g INNER JOIN invitations AS i ON i.groupId = g.groupId WHERE i.invitationId = ?', [invitationId])
}

const updateGroup = (groupId, { groupTitle, groupDescription }) => {
    return db.query('UPDATE dbgroups SET groupTitle = ?, groupDescription =? WHERE groupId = ?', [groupTitle, groupDescription, groupId])

}

const createGroup = ({ groupTitle, groupDescription }) => {
    return db.query('INSERT INTO dbgroups (groupTitle, groupDescription) VALUES (?, ?)', [groupTitle, groupDescription])
}

const deleteGroup = (groupId) => {
    return db.query('DELETE FROM dbgroups WHERE groupId = ?', [groupId])
}

module.exports = {
    getGroupsByUserId, createGroup, getGroupById, getGroupIdByInvitationId, deleteGroup
}