const router = require('express').Router();
const Products = require('./model');
const multer  = require('multer');   
const path = require('path');       
const fs = require('fs');
const { where } = require('sequelize');
const upload = multer({dest: "uploads"});

router.post('/product', upload.single('image_url'), async(req, res) => {
    const {user_id, name, price, stock, status} = req.body;
    const image = req.file;
    if(image){
        const target = path.join(__dirname, '../../upload', image.originalname);
        fs.renameSync(image.path, target);
        try{
            await Products.sync();
            const result = await Products.create({user_id, name, price, stock, status, image_url: `http://localhost:3000/upload/${image.originalname}`});
            res.send(result);
        }catch(e){
            res.send(e);
        }
    }
});

router.get('/product/:id', async(req, res) => {
        try{
            await Products.sync();
            const result = await Products.findAll({
                where:{
                    id : [req.params.id]
                }
            });
            res.send(result);
        }catch(e){
            res.send(e);
        }
});
router.get('/product/', async(req, res) => {
    try{
        await Products.sync();
        const result = await Products.findAll({ 
        });
        res.send(result);
    }catch(e){
        res.send(e);
    }
});

router.delete('/productdelete/:id', upload.single('image_url'), async(req, res) => {
    try{
        await Products.sync();
        const result = await Products.destroy({ 
            where:{
                id : [req.params.id]
            }
        });
        res.send(result);
    }catch(e){
        res.send(e);
    }
});

router.put('/product/:id', upload.single('image_url'), async(req, res) => {
    const {user_id, name, price, stock, status} = req.body;
    const image = req.file;
    if(image){
        const target = path.join(__dirname, '../../upload', image.originalname);
        fs.renameSync(image.path, target);
            await Products.sync();
            const result = await Products.update({user_id, name, price, stock, status, image_url: `http://localhost:3000/upload/${image.originalname}`},
            {where:{
                id : [req.params.id]
            }});
            res.send(result);
        }else{
            await Products.sync();
            const result = await Products.update({user_id, name, price, stock, status},
            {where:{
                id : [req.params.id]
            }});
            res.send(result);
        }
});

module.exports = router;