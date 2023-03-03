const getSlicesByGroupId = (groupId) => {
    return db.query('SELECT * FROM slices WHERE groupId = ?', [groupId])
}

const getSliceById = (sliceId) => {
    return db.query('SELECT * FROM slices WHERE sliceId = ?', [sliceId])
}

const updateSlice = (sliceId, { groupId, userId, description, amount }) => {
    return db.query('UPDATE slice SET groupId = ?, description = ?, amount = ? WHERE sliceId = ?', [groupId, description, amount, sliceId])
}

const createSlice = ({ groupId, description, amount }) => {
    return db.query('INSERT INTO slices (groupId, description, amount) VALUES (?, ?, ?)', [groupId, description, amount])
}

const deleteSlice = (sliceId) => {
    return db.query('DELETE FROM slices WHERE sliceId =?', [sliceId])
}

module.exports = {
    getSlicesByGroupId, createSlice
}