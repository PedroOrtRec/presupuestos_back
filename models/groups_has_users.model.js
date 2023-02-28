const addOneUserToGroup = ({ userRol, groupId, userId, debtAmount }) => {
    return db.query('INSERT INTO groups_has_users (groupId, userId, userRol, debtAmount) VALUES (?, ?, ?, ?)', [groupId, userId, userRol, debtAmount])
}

const getRolByUserId = ({ userId, groupId }) => {
    return db.query('SELECT tbi.userRol FROM groups_has_users AS tbi WHERE userId = ? AND groupId = ?', [userId, groupId])
}

module.exports = {
    addOneUserToGroup, getRolByUserId
}