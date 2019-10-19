const express = require('express');
const router = express.Router();
const pool = require('../database')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken');
const config = require('../config');

router.get('/users', async(req, res) => {
    let allUsers = await pool.query('SELECT * FROM users ORDER BY username ASC')
    res.send(allUsers)
    console.log('allUsers were onloaded')
})

router.get('/user', async(req, res) => {
    let reqbody = req.body.user
    var token = req.headers.token
    console.log(token, 'Este es el token')
    if (!token) {
        res.status(401).send({
            error: "Es necesario el token de autenticación"
        })
        return
    }
    // token = token.replace('Bearer ', '')
    let a = await jwt.verify(token, config.secret, async function(err, user) {
        if (err) {
            console.log('ERROR:', err)
            res.status(401).send({
                error: 'Token inválido'
            })
        } else {
            console.log('Token valido')
            let userData = await pool.query('SELECT * FROM users WHERE id_user = ?', [user.id])
            console.log(userData)
            res.send(userData)
        }
    })


    // let token = req.headers.[a]
    // await jwt.verify(token, 'secret', async(err, decoded) => {
    //     // if (err) return res.status(401).json({
    //     //     title: 'unathorized',
    //     // })

    //     let s = await pool.query('SELECT * FROM users WHERE id_user = ?',)
    //     console.log(s)
    //     if (err) return console.log(err)
    //     return res.status(200).json({
    //         title: 'user grabbed',
    //         user: {
    //             username: user.username
    //         }
    //     })
    // })

    // let user = await pool.query('SELECT * FROM users WHERE username = ?', ['vs'])
    // res.send(user)
    // console.log(user)

})


module.exports = router;