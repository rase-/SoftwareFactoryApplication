(->
    module.exports.computeStatistics = (rawData) ->
        console.log "Computing statistics"
        stringData = rawData.join("\n")
        lines = stringData.split("\n")
        categoryFrequencies = {}
        locationFrequencies = {}
        lines.forEach (line) ->
            return if line.indexOf("#") == 0 # Ignore comment lines
            split = line.split("|")
            categoryFrequencies[split[5]] = 0 unless categoryFrequencies[split[5]] 
            categoryFrequencies[split[5]]++

            countryCode = split[7]
            city = split[8]
            locationIdentifier = countryCode + city
            locationFrequencies[locationIdentifier] = 0 unless locationFrequencies[locationIdentifier]
            locationFrequencies[locationIdentifier]++
        { "category": categoryFrequencies, "location": locationFrequencies }
)()