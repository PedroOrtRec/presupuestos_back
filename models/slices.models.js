const getSliceByGroupId = (groupId) => {
    return db.query('SELECT * FROM slices WHERE groupId = ?', [groupId])
}

const getSliceById = (sliceId) => {
    return db.query('SELECT * FROM slices WHERE sliceId = ?', [sliceId])
}

const updateSlice = (sliceId, { groupId, userId, description, amount }) => {
    return db.query('UPDATE slice SET groupId = ?, userId = ?, description = ?, amount = ? WHERE sliceId = ?', [userId, groupId, description, amount, sliceId])
}

const createSlice = ({ groupId, userId, description, amount }) => {
    return db.query('INSERT INTO slices (groupId, userId, description, amount) VALUES (?, ?, ?, ?)', [groupId, userId, description, amount])
}

const deleteSlice = (sliceId) => {
    return db.query('DELETE FROM slices WHERE sliceId =?', [sliceId])
}