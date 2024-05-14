const express = require('express')
const router = express.Router()
const db = require('../db')

router.get('/', (req, res) => {
  console.log(req.session.userId)

  res.render('home')
})

router.get('/check-db', (req, res) => {
  console.log(req.session.userId)

  db.query(`SELECT * FROM students ORDER BY id;`, (err, result) => {
    if (err) {
      console.log(err);
    }

    const students = result.rows
    res.render('check_db', { students: students })
  })
})

module.exports = router
