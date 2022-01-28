const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'toor',
    password: 'toor',
    database: 'mebel'
});

connection.connect(error => {
    if( !!error ) {
        console.log(error)
    }
});

module.exports = connection;
