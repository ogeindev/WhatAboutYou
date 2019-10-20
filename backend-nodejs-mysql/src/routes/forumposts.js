const express = require('express');
const router = express.Router();
const pool = require('../database')

router.post('/addForumpost', async(req, res) => {
    const { titleforumpost, textforumpost, autorforumpost, categoryforumpost, id_user } = req.body;
    const newForumpost = { titleforumpost, textforumpost, autorforumpost, categoryforumpost, id_user };
    await pool.query('INSERT INTO forumposts set ?', [newForumpost])
    res.send(newForumpost)
    console.log('Nuevo forumpost', newForumpost)


})

router.get('/getForumposts', async(req, res) => {
    let allForumposts = await pool.query('SELECT * FROM forumposts ORDER BY data_created DESC')
    res.send(allForumposts)
    console.log('ALL FORUMPOSTS ONLOADED')

})


module.exports = router;