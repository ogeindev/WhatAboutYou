const express = require('express');
const router = express.Router();
const pool = require('../database')

router.post('/addArticles', async(req, res) => {
    const { titlearticle, textarticle, autorarticle, categoryarticle, tagsarticle, id_user } = req.body;
    const newArticle = { titlearticle, textarticle, autorarticle, categoryarticle, tagsarticle, id_user };
    await pool.query('INSERT INTO articles set ?', [newArticle])
    console.log('ONE ARTICLE CREATED', newArticle)
})

router.get('/getArticles', async(req, res) => {
    let allArticles = await pool.query('SELECT * FROM articles ORDER BY data_created DESC')
    res.send(allArticles)
    console.log('ALL ARTICLES ONLOADED')
})


module.exports = router;