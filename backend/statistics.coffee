(->
    module.exports.computeStatistics = (rawData) ->
        console.log "Computing statistics"
        stringData = rawData.join("")
        console.log "String data length: #{stringData.length}"
        lines = stringData.split("\n")
        categoryFrequencies = {}
        locationFrequencies = {}
        console.log "Lines to be inspected: #{lines.length}"
        lines.forEach (line) ->
            return if line.indexOf("#") == 0 # Ignore comment lines
            split = line.split("|")
            return if split.length != 9 # Invalid line in file
            categoryFrequencies[split[5]] = 0 unless categoryFrequencies.hasOwnProperty split[5] 
            categoryFrequencies[split[5]]++

            countryCode = split[7]
            city = split[8]
            locationIdentifier = countryCode + city
            locationFrequencies[locationIdentifier] = 0 unless locationFrequencies.hasOwnProperty locationIdentifier
            locationFrequencies[locationIdentifier]++
        { "category": categoryFrequencies, "location": locationFrequencies }
)()
