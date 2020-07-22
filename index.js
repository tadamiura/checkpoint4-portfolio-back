require('dotenv').config()
const express = require('express')
const app = express()
const cors = require('cors')
const routes = require('./src/routes/index')
const { port } = require('./src/helper/service')

app.use(cors())

app.use('/api/about', routes.About)
app.use('/api/project', routes.Project)


app.listen(port, (err) => {
    if (err) {
      throw new Error('Something bad just happened...')
    }
    console.log(`Server is listening on ${port}`)
  })