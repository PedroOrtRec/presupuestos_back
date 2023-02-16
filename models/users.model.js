const getUserById = (userId) => {
    return db.query('SELECT * FROM users WHERE userId = ?', [userId])
}

const createUser = ({ userName, userEmail, password }) => {
    return db.query('INSERT INTO users (userName, userEmail, password) VALUES (?, ?, ?)', [userName, userEmail, password])
}


module.exports = {
    getUserById, createUser
}