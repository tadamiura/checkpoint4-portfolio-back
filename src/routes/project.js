const express = require('express')
// const fs = require('fs')
// const Promise = require('bluebird')
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
    const sql = `SELECT project.id, project_title, duration, stack.language, project_description, DATE_FORMAT(date_creation,'%d/%m/%y') AS date, url_image, github_link, app_link  
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

// POST a new project

// Promise.promisifyAll(fs)
// Promise.promisifyAll(connection)

// fs.readFileAsync('product.json', 'utf8')
//   .then(content => {
//     console.log('success', content)
//     const product = JSON.parse(content)
//     return product;
//   })
//   .then(product => {
//     return connection.queryAsync('INSERT INTO product SET ?', [product])
//   })
//   .then(stats => {
//     return connection.queryAsync('SELECT * FROM product WHERE id = ?', [stats.insertId])
//   })
//   .then(products => {
//     console.log(products[0])
//   })
//   .catch(err => {
//     console.error(err)
//     if (err.code === 'ENOENT') {
//       console.error('File not found')
//     }
//   })

router.post('/new-project', (req, res) => {
    console.log("params",req.params,"body", req.body)
    const formData = req.body
    const valuesProject = {
        project_title: req.body.project_title,
        project_description: req.body.project_description,
        github_link: req.body.github_link,
        app_link: req.body.app_link,
        date_creation: req.body.date_creation,
        duration: req.body.duration,
        url_name: req.body.url_name
    }
    const valuesStack = {
        language: req.body.language
    }
    const valueGallery = {
        name: req.body.name,
        url_image: req.body.url_image
    }
    const valuesGalleryProject = {
        id_gallery: req.body.id_gallery,
        id_project: req.body.id_project
    }
    const sql = 'INSERT INTO project SET ?'
    connection.query(sql, valuesProject, (err) => {
      if (err) {
        res.status(500).send("Erreur dans l'ajout d'un projet")
      } else {
          const sql2 = 'INSERT INTO gallery SET ?'
          connection.query(sql2, valueGallery, (err) => {
              if (err) {
                  res.status(500).send("Erreur dans l'ajout de l'image")
              } else {
                  const sql3 = 'INSERT INTO gallery_project SET ?'
                  connection.query(sql3, valuesGalleryProject, (err, result) => {
                      if (err) {
                        res.status(500).send("Erreur dans l'ajout dans l'ajout de relation image et projet")
                      } else {
                          res.sendStatus(200)
                      }
                  })
              }
          } )
      }
    })
  })


module.exports = router
