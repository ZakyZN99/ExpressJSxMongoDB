const router = require("express").Router();
//library untuk upload file
const multer  = require('multer')
const upload = multer({dest:"upload"})
const fs = require('fs');
const path = require('path');

router.get("/", (req, res) => {
  res.send({
    status: "Berhasil",
    message: "Selamat datang di Basic ExpressJS",
  });
});
router.get("/namasiswa/:id", (req, res) => {
  res.json({
    status: "Berhasil",
    message: "Selamat datang di Basic ExpressJS",
    id: req.params.id
  });
});

//pakai postman atau insomnia
router.post('/namasiswa/', (req, res) => {
    res.json(req.body);
});
router.post('/reg/', upload.single('image'), (req, res) => {
  const {name} = req.body;
  const image = req.file;
  if (image){
    const target = path.join(__dirname, 'upload', image.originalname);
    fs.renameSync(image.path, target)
    res.json({
      name,
      image
    });
  }
 });

module.exports = router;
