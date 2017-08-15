const express = require('express');
const db = require('./db');
const bodyParser = require('body-parser')
const mustacheExpress= require('mustache-express');
let app = express();

app.set('view engine', 'mustache');
app.set('views', __dirname + '/views');
app.use(express.static('public'));
app.engine('mustache', mustacheExpress());

app.get('/', (req, res, next) => {
  db.query('SELECT * FROM runner', [], (err, results) => {
    if (err) {
      return next(err)
    }
    res.render('index', { results:results.rows})
  })
})

app.get('/a_runner/:results', (req, res, next) => {
  db.query('SELECT * FROM runner', [0], (err, results) => {
    if (err) {
      return next(err)
    }
    res.render('a_runner',{results:results.rows})
  })
})


// app.get('/:bibid', (req, res, next) => {
//   db.query('SELECT * FROM bib_id', [], (err, results) => {
//     if (err) {
//       return next(err)
//     }
//     res.send(results.rows[0])
//   })
// })
//
// app.get('/:bibid', (req, res, next) => {
//   db.query('INSERT * FROM bib_id', [], (err, results) => {
//     if (err) {
//       return next(err)
//     }
//     res.send(results.rows[0])
//   })
// })

app.listen(3000,  () => {
  console.log('Server listening on port 3000...');
});
