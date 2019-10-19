const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy

const pool = require('../database')
const helpers = require('./helpers')

// login
passport.use('local.login', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'userpassword',
    passReqToCallback: true
}, async(req, username, userpassword, done) => {
    console.log(req.body)
    let rows = await pool.query('SELECT * FROM users WHERE username = ?', [username])
    console.log(rows)
    if (rows.length > 0) {
        let user = rows[0];
        let validPassword = await helpers.matchPassword(userpassword, user.userpassword)
        console.log(userpassword, user.userpassword)
        if (validPassword) {
            done(null, user)
                // user was accept
            console.log('user is valid')
        } else {
            done(null, false)
                // incorrect password
            console.log('incorrect password')
        }
    } else {
        done(null, false)
            // username does not exist
        console.log('username does not exist')
    }

}))

//register
passport.use('local.register', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'userpassword',
    passReqToCallback: true
}, async(req, username, userpassword, done) => {
    const { useremail } = req.body
    const newUser = {
        username,
        userpassword,
        useremail
    }
    newUser.userpassword = await helpers.encryptPassword(userpassword)
    const result = await pool.query('INSERT INTO users SET ?', [newUser])
    newUser.id_user = result.insertId;
    console.log(newUser)
    return done(null, newUser);
}))

passport.serializeUser(function(user, done) {
    done(null, user.id_user)
})


passport.deserializeUser(async function(id_user, done) {
    const rows = await pool.query('SELECT * FROM users Where id = ?', [id_user])
    done(null, rows[0])
})