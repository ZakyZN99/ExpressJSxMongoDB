const {MongoClient} = require('mongodb')

const url ='mongodb://ZakyZN:123456@localhost:27017?authSource=admin';
const client = new MongoClient(url);

( async () => {
    try{
        await client.connect()
        console.log('koneksi sukses')
    }catch(e){
        console.log(e);
    }
})();

const db = client.db('products')

module.exports = db;