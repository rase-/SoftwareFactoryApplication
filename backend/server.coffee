# Loading dependencies
express = require "express"

# Loading local modules
datafetcher = require "./datafetcher.js"
datacacher = require "./datacacher.js"

app = express()

# Enabling CORS
app.all "*", (req, res, next) ->
    res.header "Access-Control-Allow-Origin", "*"
    res.header "Access-Control-Allow-Headers", "X-Requested-With"
    next()

# Routes
app.get "/data.json", (req, res) ->
    console.log(req.query.hasOwnProperty "useCached")
    console.log(req.query.useCached == "false")
    datacacher.clearCache() if req.query.useCached == "false"
    if datacacher.isCached()
        res.send datacacher.getCached()
        return
    datafetcher.fetchData (data) ->
        res.json data
        datacacher.cache data

respondWithField = (field, req, res) ->
    datacacher.clearCache() if req.query.useCached == "false"
    respond = (data) ->
        text = ""
        for key, val of data[field]
            text += "#{key} #{val}\n"
        res.send text
        datacacher.cache data
    if datacacher.isCached() then datacacher.useCached respond else datafetcher.fetchData respond

app.get "/category.txt", (req, res) ->
    respondWithField "category", req, res

app.get "/location.txt", (req, res) ->
    respondWithField "location", req, res 
    
# Start app
app.listen 3000
console.log "Listening on port 3000"
