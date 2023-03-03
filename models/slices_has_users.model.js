const addPayer = () => {

}

const addOneDebtor = () => {

}

const addUserToSlice = (groupId, userId, userAction) => {
    return db.query('INSERT INTO slices_has_users (groupId, userId, userAction) VALUES (?, ?, ?)', [groupId, userId, userAction])
}


module.exports = {
    addUserToSlice

}