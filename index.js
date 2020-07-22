const express = require('express')
const app = express()
require('dotenv').config()
const { port } = require('./src/helper/service')


app.listen(port, (err) => {
    if (err) {
      throw new Error('Something bad just happened...')
    }
    console.log(`Server is listening on ${port}`)
  })