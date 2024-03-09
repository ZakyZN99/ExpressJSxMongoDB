const router = require('express').Router();
const multer = require('multer');
const upload = multer({dest: 'uploads'});
const productController = require('./controller')


router.get('/product', upload.single('image_url'), productController.index);
router.get('/product/:id', productController.view);
router.delete('/productdel/:id',  upload.single('image_url'), productController.destroy);
router.post('/product',  upload.single('image_url'), productController.store);
router.put('/productup/:id',  upload.single('image_url'), productController.update);


module.exports = router;
