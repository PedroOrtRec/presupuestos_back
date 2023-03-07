const router = require('express').Router();
const multer = require('multer')
const path = require('path')

const storage = multer.diskStorage({
    destination: path.join(__dirname, '../../public/images'),
    filename: (req, file, cb) => {
        cb(null, file.originalname);

        //ESTAMOS AHORA EN GENERAR UN NOMBRE ALEATORIO Y ÚNICO CON UUID
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

router.post('/images', middlewareMulter, (req, res) => {
    console.log(req.file)
    res.send('uploaded')

});


module.exports = router;