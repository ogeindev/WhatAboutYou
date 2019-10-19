const express = require('express');
const router = express.Router();
const passport = require('passport')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken');
const config = require('../config');
const pool = require('../database')


// router.post('/login', (req, res, next) => {
//     passport.authenticate('local.login')(req, res, next);

// })

// router.get('/login', (req, res, next) => {
//     passport.session.name(user)
// })

router.post('/login', async(req, res) => {
    const user = await pool.query('SELECT * FROM users WHERE username = ?', [req.body.username])
    let passwordValid = await bcrypt.compareSync(req.body.userpassword, user[0].userpassword)
    console.log(passwordValid)

    let token = jwt.sign({ id: user[0].id_user }, config.secret, {
        expiresIn: 86400 // expires in 24 hours
    });
    res.status(200).send({ auth: true, token: token, user: user });
})


module.exports = router;