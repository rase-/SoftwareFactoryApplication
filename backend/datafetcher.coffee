(->
    http = require "http"
    unzip = require "unzip"
    fs = require "fs"
    statistics = require "./statistics.js"
    
    unpackData = (callback) ->
        fs.mkdirSync("data") unless fs.existsSync("data")
        reader = fs.createReadStream("data.zip")
        reader.pipe(unzip.Extract({path: "./data/"}))
        reader.on "end", callback

    extract = (callback) ->
        fs.readdir "data/", (err, files) ->
            console.log "Extracted files: #{JSON.stringify(files)}"
            if err
                console.log err
                callback null 
            else
                data = []
                files.forEach (el) ->
                    console.log "Reading in #{el}"
                    content = fs.readFileSync("data/#{el}")
                    data.push content
                callback statistics.computeStatistics(data) 
    
    module.exports.fetchData = (callback) ->
        file = fs.createWriteStream("data.zip")
        http.get "http://pilvilinna.cert.fi/opendata/autoreporter/csv.zip", (response) ->
            response.pipe(file)
            file.on "finish",  ->
                file.close()
                console.log "Downloaded"
                unpackData ->
                    extract callback
)()
