const getUserById = (userId) => {
    return db.query('SELECT * FROM users WHERE userId = ?', [userId])
}

const getUserByEmail = (userEmail) => {
    return db.query('SELECT * FROM users WHERE userEmail = ?', [userEmail])
}

const getUserByPhone = (userPhone) => {
    return db.query('SELECT * FROM users WHERE userPhone = ?,'[userPhone])
}

const getUsersByGroupId = (groupId) => {
    return db.query('SELECT u.userId, CONCAT (u.userName, " ", u.userSurname) AS "player", tbi.userRol FROM users AS u INNER JOIN groups_has_users AS tbi ON u.userId = tbi.userId INNER JOIN dbgroups AS g ON tbi.groupId = g.groupId WHERE g.groupId = ? GROUP BY tbi.userId', [groupId])
}

const getAllUsers = () => {
    return db.query('SELECT u.userEmail, u.userPhone FROM users AS u')
}

const createUser = ({ userName, userSurname, userEmail, userPhone, password }) => {
    return db.query('INSERT INTO users (userName, userSurname, userEmail, userPhone, password) VALUES (?, ?, ?, ?, ?)', [userName, userSurname, userEmail, userPhone, password])
}

const updateUser = (userId, { userName, userSurname, userEmail, userPhone, password }) => {
    return db.query(
        'UPDATE users SET userName = ?, userSurname = ?, userEmail = ?, userPhone = ?, password = ? WHERE userId = ?',
        [userName, userSurname, userEmail, userPhone, password, userId]
    )
}

const deleteUser = (userId) => {
    return db.query(
        'DELETE FROM users WHERE userId = ?', [userId]
    )
}

const getUsersBySliceId = (sliceId) => {
    return db.query('SELECT u.userId, CONCAT (u.userName, " ", u.userSurname) AS "name" FROM users AS u INNER JOIN slices_has_users AS tbi ON tbi.userId = u.userId WHERE tbi.sliceId = ? GROUP BY u.userId', [sliceId])
}


module.exports = {
    getUserById, createUser, getUserByEmail, getUsersByGroupId, getUserByPhone, getUsersBySliceId, getAllUsers
}