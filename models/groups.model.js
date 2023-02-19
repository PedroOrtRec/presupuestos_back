const getGroupsByUserId = (userId) => {
    return db.query('SELECT g.groupId, g.groupTitle, g.groupDescription, g.creationTime FROM dbgroups AS g INNER JOIN  groups_has_users AS tbi ON g.groupId = tbi.groupId INNER JOIN users AS u ON tbi.userId = u.userId WHERE u.userId = ?', [userId])
}

module.exports = {
    getGroupsByUserId
}