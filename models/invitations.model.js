const sendInvitation = ({ userId, toId, groupId, status }) => {
    return db.query('INSERT INTO invitations (fromId, toId, groupId, status) VALUES (?, ?, ?, ?)', [userId, toId, groupId, status])
}

const getAllInvitationsByUserId = (userId) => {
    return db.query('SELECT * FROM invitations WHERE toId = ?', [userId])
}

const checkInvitation = (invitationId) => {
    return db.query('UPDATE invitations SET status = "checked" WHERE invitationId = ?', [invitationId])
}

module.exports = {
    sendInvitation, getAllInvitationsByUserId, checkInvitation
}