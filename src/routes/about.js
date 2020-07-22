const express = require('express')
const { connection } = require('../helper/conf.js')
const router = express.Router()

router.get('/', (req, res) => {
    const sql = 'SELECT * FROM about_me'
    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Erreur dans la récupération des catégories')
        } else {
            res
                .set('X-Total-Count', req.count)
                .send(result)
        }
    })
})

module.exports = router
