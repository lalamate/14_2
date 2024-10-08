const express = require('express')
var cors = require('cors')
const app = express()
const port = 3000
app.use(cors())
const mysql = require('mysql')
app.use(express.json())

function kapcsolat(){
     connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'szulnap'
      })
}

app.get('/', (req, res) => {
  res.send('Hello World!')
})


app.get('/szuletesnapoklista', (req, res) => {
    kapcsolat()
    connection.connect()

connection.query('SELECT vnev,knev,szul FROM szuletesnapok', (err, rows, fields) => {
  if (err) throw err
console.log(rows)
res.send(rows)
})

connection.end()
  })



app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})