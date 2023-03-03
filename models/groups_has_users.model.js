const addOneUserToGroup = ({ userRol, groupId, userId, debtAmount }) => {
    return db.query('INSERT INTO groups_has_users (groupId, userId, userRol, debtAmount) VALUES (?, ?, ?, ?)', [groupId, userId, userRol, debtAmount])
}

const getRolByUserId = ({ userId, groupId }) => {
    return db.query('SELECT tbi.userRol FROM groups_has_users AS tbi WHERE userId = ? AND groupId = ?', [userId, groupId])
}

const getDebtAmountByUserId = ({ userId, groupId }) => {
    return db.query('SELECT tbi.debtAmount FROM groups_has_users AS tbi WHERE userId = ? AND groupId = ?', [userId, groupId])
}

const updateDebtAmount = ({ userId, groupId, newAmount }) => {
    return db.query('UPDATE groups_has_users SET debtAmount = ? WHERE userId = ? AND groupId = ?', [newAmount, userId, groupId])
}

const getAllAmountsByGroupsId = (groupId) => {
    return db.query('SELECT tbi.userId, CONCAT (u.userName, " ", u.userSurname) AS "player", tbi.debtAmount FROM groups_has_users AS tbi INNER JOIN users AS u ON tbi.userId = u.userId WHERE tbi.groupId = ? GROUP BY tbi.userId', [groupId])
}

module.exports = {
    addOneUserToGroup, getRolByUserId, getDebtAmountByUserId, updateDebtAmount, getAllAmountsByGroupsId
}