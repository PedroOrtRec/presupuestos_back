const addOneUserToGroup = (userRol, { groupId, userId, debtAmount }) => {
    return db.query('INSERT INTO groups_has_users (groupId, userId, userRol, debtAmount) VALUES (?, ?, ?, ?)', [groupId, userId, userRol, debtAmount])
}

module.exports = {
    addOneUserToGroup
}