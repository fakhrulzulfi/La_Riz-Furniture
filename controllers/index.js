const { query } = require('../config/database');
const db = require('../config/database');

const fs = require('fs');
const path = require('path');

exports.rootPage = (req, res) => {
    const getAllProduct = db.query(
        'SELECT product.id,product.name AS product_name,product.price,product.description,product.stock,product.image,product_type.name AS type_name,product_type.id AS type_id FROM product JOIN product_type ON product.type = product_type.id',
        (err, rows) => {
            return res.render('eshop/index.ejs', { data: rows });
        }
    );
};

exports.loginPage = (req, res) => {
    res.render('sb-admin/login.ejs', { message: '' });
};

exports.checkLogin = (req, res) => {
    const { username, password } = req.body;
    if( username === 'admin' && password === 'admin' ) {
        return res.redirect('/product');
    }
    const message = "Wrong Username or Password!";

    return res.render('sb-admin/login.ejs', { message });
}

exports.productPage = (req, res) => {
    let object = {};
    const getAllProduct = db.query(
        'SELECT product.id,product.name AS product_name,product.price,product.description,product.stock,product.image,product_type.name AS type_name,product_type.id AS type_id FROM product JOIN product_type ON product.type = product_type.id',
        (err, rows) => {
            object.product = rows;
        }
    );

    const getAllType = db.query(
        'SELECT * FROM product_type',
        (err, rows) => {
            object.product_type = rows;
            return res.render('sb-admin/product.ejs', { data: object });    
        }
    );    
};

exports.addProduct = (req, res) => {
    const {
        name,
        description,
        price,
        stock,
        type
    } = req.body;
    
    const getFormat = req.file.originalname.split('.')[1];
    const nameOfImage = `${req.file.filename}.${getFormat}`;
    const tempPath = req.file.path;
    const targetPath = path.join(__dirname, `../public/images/product/${nameOfImage}`);

    fs.rename(tempPath, targetPath, err => {
        if (err) console.log(err);
    });
  
    db.query(
        `INSERT INTO product(name,
                             description, 
                             price, 
                             stock, 
                             type, 
                             image) 
                             VALUES("${name}","${description}",${price},${stock},${type},"${nameOfImage}")`,
        (err, rows) => {

            res.redirect('/product');
        }
    );  
};

const getNameImageFromDB = (idProduct) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT image FROM product WHERE id=${idProduct}`, (err, rows) => {
            if(err) {
                reject(err);
            }
            resolve(rows[0].image);
        });
    })
};

exports.updateProduct = (req, res) => {
    const { idProduct } = req.params;

    const {
        name,
        description,
        price,
        stock,
        type,
        imageNow
    } = req.body;

    getNameImageFromDB(idProduct)
    .then(result => {
        let getNameImage = result;
        let nameImage = imageNow;

        db.query(
            `UPDATE product SET name="${name}", price=${price}, description="${description}", stock=${stock}, type=${type}, image="${nameImage}" WHERE id=${idProduct}`,
            (err, rows) => {
                res.redirect('/product');
            }
        );
    });
};

exports.removeProduct = (req, res) => {
    const { idProduct } = req.params;

    db.query(
        `DELETE FROM product where id=${idProduct}`,
        (err, rows) => {
            res.redirect('/product');
        }
    );
};


exports.transactionPage = (req, res) => {
    let object = {};

    const getAllTransaction = db.query(
        'SELECT transaction.id, transaction.qty, transaction.date, transaction.customer, product.name, (transaction.qty * product.price) AS price FROM transaction JOIN product ON product.id = transaction.product_id',
        (err, rows) => {
            if( err ) {
                console.log(error);
            }
            object.transaction = rows;
        }
    );

    const getAllProductName = db.query(
        'SELECT * FROM product',
        (err, rows) => {
            if( err ) { 
                console.log(err);
            }
            object.product = rows;
            return res.render('sb-admin/transaction.ejs', { data: object } );
        }
    )
};

exports.addTransaction = (req, res) => {
    const {
        product_id,
        qty,
        date,
        customer
    } = req.body;

    const insertData = db.query(
        `INSERT INTO transaction(product_id,qty,date,customer) VALUES(${product_id},${qty},'${date}','${customer}')`,
        (err, rows) => {
            if( err ) {
                console.log(err);
            }

            return res.redirect('/transaction');
        }
    )
}

exports.updateTransaction = (req, res) => {
    const { id_tr } = req.params;
    const {
        product_id,
        qty,
        date,
        customer
    } = req.body;

    const changeData = db.query(
        `UPDATE transaction SET product_id=${product_id},qty=${qty},date='${date}',customer='${customer}' WHERE id=${id_tr}`,
        (err, rows) => {
            if( err ) {
                console.log(err)
            }

            return res.redirect('/transaction');
        }
    );
};

exports.removeTransaction = (req, res) => {
    const { id_tr } = req.params;

    const deleteData = db.query(
        `DELETE FROM transaction WHERE id=${id_tr}`,
        (err, rows) => {
            if( err ) {
                console.log(err)
            }

            return res.redirect('/transaction');
        }
    );
};