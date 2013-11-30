# Loading dependencies
express = require "express"

# Loading local modules
datafetcher = require "./datafetcher.js"

app = express()

# Routes
app.get "/", (req, res) ->
    datafetcher.fetchData (data) ->
        res.send data

# Start app
app.listen 3000
console.log "Listening on port 3000"
