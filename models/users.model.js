const getUserById = (userId) => {
    return db.query('SELECT * FROM users WHERE userId = ?', [userId])
}

const getUserByEmail = (userEmail) => {
    return db.query('SELECT * FROM users WHERE userEmail = ?', [userEmail])
}

const createUser = ({ userName, userEmail, password }) => {
    return db.query('INSERT INTO users (userName, userEmail, password) VALUES (?, ?, ?)', [userName, userEmail, password])
}


module.exports = {
    getUserById, createUser, getUserByEmail
}