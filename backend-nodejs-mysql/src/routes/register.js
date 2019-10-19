const express = require('express');
const router = express.Router();
const passport = require('passport')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken');
const config = require('../config');
const pool = require('../database')


// router.post('/register', async(req, res) => {
//     const { username, useremail, userpassword } = req.body;
//     const newUser = { username, useremail, userpassword };
//     await pool.query('INSERT INTO users set ?', [newUser])
//     console.log(newUser)
//     res.send('nuevo user')
// })

// router.post('/register', passport.authenticate('local.register'))

router.post('/register', async function(req, res) {
    // const { username, useremail, userpassword } = req.body;
    const newUser = {
        username: req.body.username,
        useremail: req.body.useremail,
        userpassword: await bcrypt.hashSync(req.body.userpassword, 8)
    };
    await pool.query('INSERT INTO users set ?', [newUser])
    let user = await pool.query('SELECT * FROM users WHERE username = ?', [req.body.username])

    console.log(user[0].id_user, 'sdsd')
    let token = await jwt.sign({ id: user[0].id_user }, config.secret, {
        expiresIn: 86400 // expires in 24 hours
    });
    res.status(200).send({ auth: true, token: token, user: user });




});

module.exports = router;