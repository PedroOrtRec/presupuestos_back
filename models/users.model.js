const getUserById = (userId) => {
    return db.query('SELECT * FROM users WHERE userId = ?', [userId])
}

const getUserByEmail = (userEmail) => {
    return db.query('SELECT * FROM users WHERE userEmail = ?', [userEmail])
}

const createUser = ({ userName, userEmail, password }) => {
    return db.query('INSERT INTO users (userName, userEmail, password) VALUES (?, ?, ?)', [userName, userEmail, password])
}

const updateUser = (userId, { userName, userEmail, password }) => {
    return db.query(
        'UPDATE users SET userName = ?, userEmail = ?, password = ? WHERE userId = ?',
        [userName, userEmail, password, userId]
    )
}

const deleteUser = (userId) => {
    return db.query(
        'DELETE FROM users WHERE userId = ?', [userId]
    )
}


module.exports = {
    getUserById, createUser, getUserByEmail, updateUser
}