const mysql = require('mysql');
const { promisify } = require('util');
const { database } = require('./keys')

// creating the db connection
const pool = mysql.createPool(database);

// connecting db
pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('DATABASE CONNECTION WAS CLOSED')
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('DATABASE HAS TOO MANY CONNECTIONS')
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('DATABASE CONNECTION WAS REFUSED')
        }
    }

    if (connection) connection.release();
    console.log('DB is Connected')
    return
})

// to use promises
pool.query = promisify(pool.query);

module.exports = pool;