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

module.exports = router
