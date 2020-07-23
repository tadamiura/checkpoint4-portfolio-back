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
    const sql = `SELECT project_title, duration, language, url_name FROM stack_project
    JOIN stack ON stack.id = stack_project.id_stack
    JOIN project ON project.id = stack_project.id_project`


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
    const sql = `SELECT DISTINCT project.id, project_title, duration, stack.language, project_description, date_creation, url_image, github_link, app_link  
    FROM project
    JOIN gallery_project
    ON project.id = id_project
    JOIN gallery
    ON gallery.id = id_gallery
    JOIN stack_project
    ON project.id = stack_project.id_project
    JOIN stack
    ON stack.id = stack_project.id_stack`

    connection.query(sql, (err, result) => {
        if (err) {
            console.log(err)
            res.status(500).send('Erreur dans la récupération des projects pour la page presentation de project')
        } else {
            res.send(result)
        }
    })
})

module.exports = router
