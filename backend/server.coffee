# Loading dependencies
express = require "express"
http = require "http"
unzip = require "unzip"
fs = require "fs"

app = express()

# Routes
app.get "/", (req, res) ->
    file = fs.createWriteStream("data.zip")
    http.get "http://pilvilinna.cert.fi/opendata/autoreporter/json.zip", (response) ->
        response.pipe(file)
        file.on "finish",  ->
            file.close()
            console.log "Downloaded"
            fs.createReadStream("data.zip").pipe(unzip.Extract({path: "data/"}))
            console.log "Extracted"
            fs.readdir "data/", (err, files) ->
                if err
                    console.log err
                else
                    data = []
                    files.forEach (el) ->
                        obj = JSON.parse(fs.readFileSync("data/#{el}"))
                        data.concat obj.autoreporter.opendata
    res.send "ok"

# Start app
app.listen 3000
console.log "Listening on port 3000"
