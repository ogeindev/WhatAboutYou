const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan')
    // const cors = require('cors')
const passport = require('passport')
    // const session = require('express-session');
    // const MySQLStore = require('express-mysql-session')
const jwt = require('jsonwebtoken');

const config = require('./config');
const { database } = require('./keys') //

// Initializations
const app = express();
require('./lib/passport') //


//settings
app.set('port', process.env.PORT || 3000)

// middlewares

const enableCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', '*');
    res.header('Access-Control-Allow-Headers', '*');
    next();
}

app.use(enableCrossDomain)

// app.use(session({
//     secret: 'session-ogein',
//     resave: false,
//     saveUninitialized: false,
//     store: new MySQLStore(database)
// }))
// app.use(cors())
app.use(morgan('dev'));
// app.use(express.urlencoded({ extended: false }));
// app.use(express.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(passport.initialize()); //
app.use(passport.session()); //

//Global Variables
app.use((req, res, next) => {
    app.locals.user = req.user;
    next();
})

// Routes
app.use('/', require('./routes/articles'))
app.use('/', require('./routes/forumposts'))
app.use('/', require('./routes/register'))
app.use('/', require('./routes/login'))
app.use('/', require('./routes/users'))

app.listen(app.get('port'), () => {
    console.log('Server on port:', app.get('port'))
})