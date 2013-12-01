(->
    module.exports.computeStatistics = (rawData) ->
        console.log "Computing statistics"
        stringData = rawData.join("\n")
        lines = stringData.split("\n")
        categoryFrequencies = {}
        locationFrequencies = {}
        lines.forEach (line) ->
            split = line.split("|")
            categoryFequencies[split[5]] = 0 unless categoryFrequencies[split[5]] 
            categoryFrequencies[split[5]]++

            cc = split[7]
            city = split[8]
            locationIdentifier = cc.concat city
            locationFrequencies[locationIdentifier] = 0 unless locationFrequencies[locationIdentifier]
            locationFrequencies[locationIdentifier]++
        { "category": categoryFrequencies, "location": locationFrequencies }
)()
