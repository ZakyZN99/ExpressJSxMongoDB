const router = require("express").Router();
const multer  = require('multer')
const upload = multer({dest: "uploads"})
const productController = require('./controller');

router.get("/product", productController.index);
router.get("/product/:id", productController.view);
router.post('/addproduct/', upload.single('image_url'), productController.store);


module.exports = router;
