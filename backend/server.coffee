# Loading dependencies
express = require "express"
http = require "http"
fs = require "fs"

app = express()

app.get "/hello.txt", (req, res) -> res.send "hello world!"

app.listen 3000
console.log "Listening on port 3000"
