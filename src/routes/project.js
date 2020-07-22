const express = require('express')
const { connection } = require('../helper/conf.js')
const router = express.Router()

router.get('/', (req, res) => {
    const sql = 'SELECT project_title, project_description, github_link, app_link, date_creation FROM project'
    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Erreur dans la récupération des projects')
        } else {
            res.send(result)
        }
    })
})

module.exports = router
