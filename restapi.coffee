express = require('express')
http = require('http')
mongoose = require('mongoose')

###
Config
###
config = require("./app/config/config").config;

###
Configure express
###
app = express()
app.configure ->
  app.set "port", config.server.port
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.methodOverride()
  #app.use express.bodyParser()
  app.use("/public", express.static(__dirname + '/public'));
  app.use app.router

app.configure "development", ->
  app.use express.errorHandler()

###
Connect to mongoDB
###
mongoose.connect(config.db.host)
db = mongoose.connection
db.on "error", console.error.bind(console, "connection error:")
db.once "open", callback = ->
  console.log "connected to mongoDB at " + config.db.host

###
Require models
###
modelsPath = __dirname + '/app/models'
require modelsPath + "/wines"

###
Require controllers
###
website = require('./app/controllers/website_controller')
wine = require('./app/controllers/wines_controller')

###
Routes
###
app.get('/', website.index)
app.get('/wines', wine.index)
app.get('/wines/:id', wine.show)
app.post('/wines', express.bodyParser(), wine.create)
app.put('/wines/:id', express.bodyParser(), wine.update)
app.delete('/wines/:id', wine.delete)

app.get('/reset', wine.reset)

###
Start server
###
app.listen app.get("port"), ->
  console.log "RestAPI server listening on :" + app.get("port")