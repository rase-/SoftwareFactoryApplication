drawChart = -> 
    $.getJSON("http://localhost:3000/data.json", -> console.log "data loaded")
        .done (data) ->
            visualizationData = new google.visualization.DataTable()
            visualizationData.addColumn "string", "Category"
            visualizationData.addColumn "number", "Incidents"

            for key, val of data.category
                visualizationData.addRow([key, val]);

            options = {
                title: 'Lengths of dinosaurs, in meters',
                legend: { position: 'none' }
            } 

            chart = new google.visualization.BarChart(document.getElementById('chart_div'))
            chart.draw(visualizationData, options)


    
google.load("visualization", "1", {packages:["corechart"]})
google.setOnLoadCallback(drawChart)

