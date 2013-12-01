(->
    http = require "http"
    unzip = require "unzip"
    sys = require "sys"
    exec = require("child_process").exec
    fs = require "fs-extra"
    statistics = require "./statistics.js"
    
    #unpackData = (callback) ->
    #    fs.mkdirSync("data") unless fs.existsSync("data")
    #    reader = fs.createReadStream("data.zip")
    #    reader.pipe(unzip.Extract({path: "./data/"}))
    #    reader.on "end", callback

    puts = (error, stdout, stderr) ->
        sys.print "stdout: " + stdout if stdout
        sys.print "stderr: " + stderr if stderr
        console.log "exec error: " + error if error


    unpackData = (callback) ->
        fs.mkdirSync("data") unless fs.existsSync("data")
        child = exec "cd data; unzip ../data.zip", (error, stdout, stderr) ->
            puts(error, stdout, stderr)
            callback()

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
                exec("rm -r data; rm data.zip", puts)
    
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
