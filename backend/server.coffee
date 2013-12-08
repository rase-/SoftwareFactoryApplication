# Loading dependencies
express = require "express"

# Loading local modules
datafetcher = require "./datafetcher.js"

app = express()

# Enabling CORS
app.all "/", (req, res, next) ->
    res.header "Access-Control-Allow-Origin", "*"
    res.header "Access-Control-Allow-Headers", "X-Requested-With"
    next()

# Routes
app.get "/data.json", (req, res) ->
    datafetcher.fetchData (data) ->
        res.send data
app.get "/category.txt", (req, res) ->
    datafetcher.fetchData (data) ->
        text = ""
        for category, freq of data.category
            text += "#{category} #{freq}\n"
        res.send text
app.get "/location.txt", (req, res) ->
    datafetcher.fetchData (data) ->
        text = ""
        for location, freq of data.location
            text += "#{location} #{freq}\n"
        res.send text

# Start app
app.listen 3000
console.log "Listening on port 3000"
