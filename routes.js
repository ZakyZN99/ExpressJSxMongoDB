const router = require("express").Router();

router.get("/", (req, res) => {
  res.send({
    status: "Berhasil",
    message: "Selamat datang di Basic ExpressJS",
  });
});
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

// router.post('/namasiswa', (req, res) => {
//     res.json(res.body);
// });

module.exports = router;
