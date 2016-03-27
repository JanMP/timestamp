'use strict'

express = require "express"
app = express()
require("dotenv").load()

app.get "/:str", (req, res) ->
  {str} = req.params
  unless isNaN str
    str = Number str
  date = new Date str
  if isNaN Number date
    result =
      unix : null
      natural : null
  else
    result =
      unix : Number date
      natural : date.toLocaleDateString()
  resultStr = JSON.stringify result
  console.log "#{str} => #{resultStr}"
  res.send resultStr

port = process.env.PORT or 8080
app.listen port, ->
  console.log "Server listening on port #{port}..."