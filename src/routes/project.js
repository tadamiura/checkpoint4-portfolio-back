const express = require('express')
const { connection } = require('../helper/conf.js')
const router = express.Router()


// Get les informormations de tous le projets
router.get('/', (req, res) => {
    const sql = 'SELECT project_title, project_description, github_link, app_link, date_creation, duration FROM project'
    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Erreur dans la récupération des projects')
        } else {
            res.send(result)
        }
    })
})


//Get informations about project to display in to My work 
router.get('/mywork', (req, res) => {
    const sql = `SELECT project_title, duration, language FROM stack, project, stack_project 
    WHERE stack.id = id_stack
    AND project.id = id_project`


    connection.query(sql, (err, result) => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur dans la récupération des projects pour la page mywork')
        } else {
            res.send(result)
        }
    })
})

// GET informations for each project to display Project page
router.get('/presentation', (req, res) => {
    const sql = `SELECT DISTINCT project_title, project_description, date_creation, url_image, github_link, app_link  
    FROM project, gallery, gallery_project
    WHERE gallery.id = id_gallery
    AND project.id = gallery_project.id_project`

    connection.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Erreur dans la récupération des projects pour la page presentation de project')
        } else {
            res.send(result)
        }
    })
})

module.exports = router
