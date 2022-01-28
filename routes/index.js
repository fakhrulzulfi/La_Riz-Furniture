const express = require('express');
const router = express.Router();
const indexController = require('../controllers/index');

const multer = require('multer');

const upload = multer({
    dest: "./public/images"
    // you might also want to set some limits: https://github.com/expressjs/multer#limits
  });  

/* GET home page. */
router.get('/', indexController.rootPage);

router.get('/login', indexController.loginPage);

router.post('/check_login', indexController.checkLogin);

router.get('/product', indexController.productPage);

router.post('/add_product', upload.single("image"), indexController.addProduct);

router.post('/update_product/:idProduct', upload.single("image-update"), indexController.updateProduct);

router.get('/delete_product/:idProduct', indexController.removeProduct);

router.get('/transaction', indexController.transactionPage);

router.post('/add_transaction', indexController.addTransaction);

router.post('/update_transaction/:id_tr', indexController.updateTransaction);

router.get('/delete_transaction/:id_tr', indexController.removeTransaction);

module.exports = router;
