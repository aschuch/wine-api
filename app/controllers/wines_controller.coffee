mongoose = require('mongoose')

### 
Models
###
Wine = mongoose.model("Wine")

# ///////////////////////////////////////////
# Public methods
# ///////////////////////////////////////////

#
# Index action
# GET /wines
#
# Returns all wines in the database
#
exports.index = (req, res) ->
  # find all wines
  Wine.findAll (err, wines) ->
    if !err && wines
      json = JSON.stringify({"wines": wines})
      statusCode = 200
    else
      console.log "[GET /wines] Error"
      json = JSON.stringify({"wines": []})
      statusCode = 404

    res.writeHead(statusCode, { 'Content-Type': 'application/json' })
    res.end json

# //////////////////////////////////

#
# Show action
# GET /wines/:id
#
# Returns info about a single wine based on its id
# 
exports.show = (req, res) ->
  # get id from url
  id = req.params.id

  # find wine with id
  Wine.findById id, (err, wine) ->
    if !err && wine
      json = JSON.stringify({"wine": wine})
      statusCode = 200
    else
      console.error "[GET /wines/" + id + "] Error"
      json = JSON.stringify({"wine": null})
      statusCode = 404

    res.writeHead(statusCode, { 'Content-Type': 'application/json' })
    res.end json

# //////////////////////////////////

#
# Create action
# POST /wines
#
# Creates a new wine and adds it to the database
# 
exports.create = (req, res) ->  
  # get data from request body
  data = req.body
  console.log data

  # create new wine and save
  wine = new Wine data
  wine.save (err) ->
    if err
      console.error "[POST /wines] Error"
      json = JSON.stringify({"error": err})
    else
      json = JSON.stringify({"error": null})

    res.writeHead(200, { 'Content-Type': 'application/json' })
    res.end json

# //////////////////////////////////

#
# Update action
# PUT /wines/:id
#
# Updates a wine based on its id
# 
exports.update = (req, res) ->
  # get data from request body
  data = req.body

  # get id from url
  id = req.params.id

  # update record with id
  Wine.updateWine id, data, (err, numAffected) ->
    if err
      console.error "[PUT /wines/" + id + "] Error"
      json = JSON.stringify({"error": err})
    else
      json = JSON.stringify({"error": null})

    res.writeHead(200, { 'Content-Type': 'application/json' })
    res.end()

# //////////////////////////////////

#
# Delete action
# DELETE /wines/:id
#
# Deletes a wine based on its id
# 
exports.delete = (req, res) ->
  # get id from url
  id = req.params.id

  # find wine with id
  Wine.findById id, (err, wine) ->
    if !err && wine
      # remove wine from database
      wine.remove()

      json = JSON.stringify({"error": null})
      statusCode = 200
    else
      console.error "[GET /wines/" + id + "] Error"
      json = JSON.stringify({"error": err})
      statusCode = 404

    res.writeHead(statusCode, { 'Content-Type': 'application/json' })
    res.end json

# //////////////////////////////////

#
# Reset Database
#
# GET /reset
# Deletes a wine based on its id
# 
exports.reset = (req, res) ->
  # remove all wines from the database
  Wine.find({}).remove()

  # insert dummy wines to the database
  wines = []

  wines[0] = new Wine(
    name: "Merlot"
    year: 1990
    description: "Merlot is a darkly blue-coloured wine grape, that is used as both a blending grape and for varietal wines. The name Merlot is thought to derive from the Old French word for young blackbird, merlot, a diminutive of merle, the blackbird (Turdus merula), probably from the color of the grape. Merlot-based wines usually have medium body with hints of berry, plum, and currant. Its softness and fleshiness, combined with its earlier ripening, makes Merlot a popular grape for blending with the sterner, later-ripening Cabernet Sauvignon, which tends to be higher in tannin."
    rating: 4
  )

  wines[1] = new Wine(
    name: "Sauvignon Blanc"
    year: 1958
    description: "Sauvignon Blanc is a green-skinned grape variety which originates from the Bordeaux region of France. The grape most likely gets its name from the French word sauvage (wild) and blanc (white) due to its early origins as an indigenous grape in South West France.,[1] a possible descendant of savagnin. Sauvignon blanc is planted in many of the world's wine regions, producing a crisp, dry, and refreshing white varietal wine. The grape is also a component of the famous dessert wines from Sauternes and Barsac. Sauvignon Blanc is widely cultivated in France, Chile, Canada, Australia, New Zealand, South Africa, Brazil, Moldova and California. Some California Sauvignon Blancs are also called Fume Blanc, though this is often perceived to be a different type of wine."
    rating: 3
  )

  wines[2] = new Wine(
    name: "Bordeaux"
    year: 1983
    description: "Bordeaux (French pronunciation: [bɔʁ.do]; Gascon: Bordèu; Basque: Bordele) is a port city on the Garonne River in the Gironde department in southwestern France. The city of Bordeaux, with a population of 239,157 inhabitants, is the 9th largest city in France. The Greater Bordeaux, called Communauté Urbaine de Bordeaux is the 5th largest urban area in France after Paris, Lyon, Lille and Marseille, with a population of 719 489 inhabitants. Its metropolitan area aire urbaine has a population of 1,114,000. It is the capital of the Aquitaine region, as well as the prefecture of the Gironde department. Its inhabitants are called Bordelais (for men) or Bordelaise (for women)."
    rating: 5
  )

  result = []
  wines.forEach (w) ->
    w.save (err) ->
      result.push err
      if result.length == wines.length
        # Done saving
        res.writeHead(200, { 'Content-Type': 'text/html' })
        res.end('Added wines to the database. <a href="/wines">Show all wines</a>')
