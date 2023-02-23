const getUserById = (userId) => {
    return db.query('SELECT * FROM users WHERE userId = ?', [userId])
}

const getUserByEmail = (userEmail) => {
    return db.query('SELECT * FROM users WHERE userEmail = ?', [userEmail])
}

const createUser = ({ userName, userSurname, userEmail, userPhone, password }) => {
    return db.query('INSERT INTO users (userName, userSurname, userEmail, userPhone, password) VALUES (?, ?, ?)', [userName, userSurname, userEmail, userPhone, password])
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


module.exports = {
    getUserById, createUser, getUserByEmail, updateUser
}