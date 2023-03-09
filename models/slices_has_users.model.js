const addUserToSlice = ({ sliceId, userId, action }) => {
    return db.query('INSERT INTO slices_has_users (sliceId, userId, action) VALUES (?, ?, ?)', [sliceId, userId, action])
}

const getPayerBySliceId = (sliceId) => {
    return db.query('SELECT u.userId, CONCAT (u.userName, " ", u.userSurname) AS "payer" FROM users AS u INNER JOIN slices_has_users AS tbi ON u.userId = tbi.userId WHERE tbi.action = "pay" AND tbi.sliceId = ?', [sliceId])
}


module.exports = {
    addUserToSlice, getPayerBySliceId

}