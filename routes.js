const router = require("express").Router();

router.get("/", (req, res) => {
  res.send({
    status: "Berhasil",
    message: "Selamat datang di Basic ExpressJS",
  });
});

// router.post('/namasiswa/', (req, res) => {
//     res.json(res.body);
// });

module.exports = router;
