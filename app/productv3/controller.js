const { ObjectId } = require('mongodb');
const db =require('../../config/mongodb');
const fs = require('fs');
const path = require('path')


const view = (req, res) => {
    const {id} = req.params;
    db.collection('products').findOne({_id: new ObjectId(id)})
    .then(result => res.send(result))
    .catch(error => res.send(error))
}
const index = (req, res) =>{
    const { search } = req.query;
    if(search){
        const regex = new RegExp(search, 'i');
        db.collection('products').find({name: { $regex: regex } })
        .toArray()
        .then(result => res.send(result))
        .catch(error => res.send(error))
      }else{
        db.collection('products').find()
        .toArray()
        .then(result => res.send(result))
        .catch(error => res.send(error))
      }
}

const store = (req, res) => {
    const { name, price, stock, status} = req.body;
    const image = req.file;
    const {id} = req.params;
    if (image) {
        const target = path.join(__dirname, '../../upload', image.originalname);
        fs.renameSync(image.path, target);
        db.collection('products').insertOne({name, price, stock, status, image_url: `http://localhost:3000/upload/${image.originalname}`})
        .then(result => res.send(result))
        .catch(error => res.send(error))
      } 
}
const update = (req, res) => {
    const {name, price, stock, status} = req.body;
    const image = req.file;
    const {id} = req.params;
    if (image) {
        const target = path.join(__dirname, '../../upload', image.originalname);
        fs.renameSync(image.path, target);
        db.collection('products').updateOne({_id: new ObjectId(id)},{$set: {name, price, stock, status, image_url: `http://localhost:3000/upload/${image.originalname}`}})
        .then(result => res.send(result))
        .catch(error => res.send(error))
      }else{
        db.collection('products').updateOne({_id: new ObjectId(id)},{$set: {name, price, stock, status}})
        .then(result => res.send(result))
        .catch(error => res.send(error))
      }
}

const destroy = (req, res) =>{
    const {id} = req.params;
    db.collection('products').deleteOne({_id: ObjectId(id)})
    .then(result => res.send(result))
    .catch(error => res.send(error))
}

module.exports = {
    index,
    view,
    store,
    update,
    destroy,
}