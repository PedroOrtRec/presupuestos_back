const addUserToSlice = ({ sliceId, userId, action }) => {
    return db.query('INSERT INTO slices_has_users (sliceId, userId, action) VALUES (?, ?, ?)', [sliceId, userId, action])
}


module.exports = {
    addUserToSlice

}