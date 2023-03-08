const router = require('express').Router();
const multer = require('multer')
const path = require('path')
const { v4: uuidv4 } = require('uuid');
const { uploadImage } = require('../../models/users.model');

const storage = multer.diskStorage({
    destination: path.join(__dirname, '../../public/uploads'),
    filename: (req, file, cb) => {
        cb(null, uuidv4() + path.extname(file.originalname));
    }
});

const middlewareMulter = (multer({
    storage,
    limits: { fileSize: 1000000 },
    fileFilter: (req, file, cb) => {
        const filetypes = /jpeg|jpg|png|gif/;
        const mimetype = filetypes.test(file.mimetype);
        const extname = filetypes.test(path.extname(file.originalname));
        if (mimetype && extname) {
            return cb(null, true);
        }
        cb("Error: Unsupported fyle type");
    }
}).single('avatar'));

// router.post('/uploads', middlewareMulter, async (req, res) => {
// const { userId } = req.user;
// const imagePath = req.file.filename;
// try {
//     const [result] = await uploadImage({ userId, imagePath });
//     res.json(result)
// } catch (error) {
//     res.json({ fatal: error.message })
// }

// console.log(req.file.filename)
// res.send('uploaded')

// });


module.exports = router;