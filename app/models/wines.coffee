mongoose = require('mongoose')
Schema = mongoose.Schema

# ///////////////////////////////////////////
# Schema
# ///////////////////////////////////////////

WinesSchema = new Schema(
  name: String
  year: Number
  description: String
  rating: Number

  createdAt:
    type: Date
    default: Date.now()
  updatedAt: 
    type: Date
    default: Date.now()
)

# ///////////////////////////////////////////
# Model Filters
# ///////////////////////////////////////////

#
# Before save
#
WinesSchema.pre "save", (next) ->
  # update timestamp
  this.updatedAt = Date.now()
  next()



# ///////////////////////////////////////////
# Model Methods
# ///////////////////////////////////////////

#
# Fetches all wines from the database
#
WinesSchema.statics.findAll = (callback) ->
  @model("Wine").find({}).sort({"rating": -1}).execFind callback


# //////////////////////////////////////

#
# Fetches a wine by its id
#
WinesSchema.statics.findById = (id, callback) ->
  @model("Wine").findOne {"_id": id}, callback

# //////////////////////////////////////

#
# Creates a new wine
#
WinesSchema.statics.updateWine = (id, data, callback) ->
  @model("Wine").update {"_id": id}, { $set: data }, callback

# //////////////////////////////////////

#
# Register model
#
mongoose.model("Wine", WinesSchema)