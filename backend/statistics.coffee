(->
    module.exports.computeStatistics = (rawData) ->
        console.log "Computing statistics"
        stringData = rawData.join("\n")
        lines = stringData.split("\n")
        data = {}
        lines.forEach (line) ->
            split = line.split("|")
            data[split[5]] = 0 unless data[split[5]] 
            data[split[5]]++
        data
)()
