const express = require('express');
const router = express.Router();
const pool = require('../database')

// edit user info
router.put('/editUser', async(req, res) => {
        let { username, userage, useremail, id_user } = req.body;
        let newInfUser = { username, userage, useremail, id_user };
        await pool.query('UPDATE users set ? Where id_user = ?', [newInfUser, id_user])
        console.log('one user edited', newInfUser)
    })
    // get articles by id
router.get('/getUserArticles', async(req, res) => {
        let userArticles = await pool.query('SELECT * FROM articles ORDER BY data_created DESC')
        res.send(userArticles)
        console.log('userArticles onloaded')
    })
    // get forumposts by id
router.get('/getUserForumposts', async(req, res) => {
        let userForumposts = await pool.query('SELECT * FROM forumposts ORDER BY data_created DESC')
        res.send(userForumposts)
        console.log('Forumposts onloaded')
    })
    //delete article
router.delete('/deleteArticle/:id', async(req, res) => {
        const { id } = req.params;
        let articleDeleted = await pool.query('DELETE FROM articles WHERE id_article = ?', [id])
        res.send(articleDeleted)
        console.log('Article Deleted', articleDeleted)
    })
    //delete forumpost
router.delete('/deleteForumpost/:id', async(req, res) => {
        const { id } = req.params;
        let forumpost = await pool.query('DELETE FROM forumposts WHERE id_forumpost = ?', [id])
        res.send(forumpost)
        console.log('Forumpost Deleted', articleDeleted)
    })
    //get one article
router.get('/article/:id', async(req, res) => {
        const { id } = req.params;
        let article = await pool.query('SELECT * FROM articles WHERE id_article = ?', [id])
        res.send(article)
        console.log('Article Selected', article)
    })
    //post article edited
router.put('/saveArticle', async(req, res) => {
    // let { id } = req.params;
    let { titlearticle, textarticle, autorarticle, categoryarticle, tagsarticle, id_user, id_article } = req.body;
    let articleSaved = { titlearticle, textarticle, autorarticle, categoryarticle, tagsarticle, id_user, id_article };
    await pool.query('UPDATE articles set ? Where id_article = ?', [articleSaved, id_article])
    console.log('one user edited', articleSaved)
})



module.exports = router;