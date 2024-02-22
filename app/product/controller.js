const connection = require("../../config/mysql");
const fs = require('fs');
const path = require('path');

const index = (req, res) => {
  connection.query(
    {
      sql: "SELECT * FROM product",
    },
    _response(res)
  );
};

const view = (req, res) => {
  connection.query(
    {
      sql: "SELECT * FROM product WHERE id = ?",
      values: [req.params.id],
    },
    _response(res)
  );
};

const store = (req, res) => {
  const {user_id, name, price, stock, status} = req.body;
  const image = req.file;
  if (image) {
    const target = path.join(__dirname, '../../upload', image.originalname);
    fs.renameSync(image.path, target);
    connection.query({
          sql: "INSERT INTO product (user_id,name,price,stock,status, image_url) VALUES (?, ?, ?, ?, ?, ?)",
          values: [parseInt(user_id), name, price, stock, status, `http://localhost:3000/upload/${image.originalname}`]
        },_response(res));
    }   
};

const _response = (res) => {
  return (error, result) => {
    if (error) {
      res.send({
        status: "failed",
        response: error,
      });
    } else {
      res.send({
        status: "success",
        response: result,
      });
    }
  };
};
module.exports = {
  index,
  view,
  store,

};
