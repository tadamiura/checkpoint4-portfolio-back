const express = require('express')
const { connection } = require('../helper/conf.js')
const router = express.Router()


// Get all information about me
router.get('/', (req, res) => {
    const sql = 'SELECT firstname, lastname, description, about, email, github_profil, linkedin_profil FROM about_me'
    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Erreur dans la récupération des information about me')
        } else {
            res.send(result)
        }
    })
})

//Get informations for home page
router.get('/home', (req, res) => {
    const sql = 'SELECT id, firstname, lastname, description FROM about_me'
    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Erreur dans la récupération des information about me pour la home page')
        } else {
            res.send(result)
        }
    })
})

//Get informations for about page
router.get('/presentation', (req, res) => {
    const sql = 'SELECT id, about, email, github_profil, linkedin_profil FROM about_me'
    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Erreur dans la récupération des information about me pour la présentation')
        } else {
            res.send(result)
        }
    })
})


// Update information about me

router.put('/:id', (req, res) => {
    const idAboutMe = req.params.id
    const formData = req.body
    const sql = 'UPDATE about_me SET ? WHERE id= ?'
    connection.query(sql, [formData, idAboutMe], (err) => {
        if (err) {
            console.log(req.body, err)
            res.status(500).send("Erreur lors de la modification de about me")
        } else {
            res.sendStatus(200)
        }
    })
})

module.exports = router
