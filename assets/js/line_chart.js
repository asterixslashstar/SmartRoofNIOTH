
function clear() {
    var elem = document.getElementById("chart");
    elem.innerHTML = "";
}

function render(data) {
    var elem = document.getElementById("chart");
    elem.innerHTML = "";
    var vis = d3.select("#chart"),
        WIDTH = elem.offsetWidth,
        HEIGHT = elem.offsetHeight,
        MARGINS = {
            top: 20,
            right: 20,
            bottom: 20,
            left: 50
        },
        xRange = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]).domain([d3.min(data, function(d) {
            return d.x;
        }), d3.max(data, function(d) {
            return d.x;
        })]),
        yRange = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([6, 40]),
        // xRange = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]).domain([d3.min(data, function(d) {
        //     return d.x;
        // }), d3.max(data, function(d) {
        //     return d.x;
        // })]),
        // yRange = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([d3.min(data, function(d) {
        //     return d.y;
        // }), d3.max(data, function(d) {
        //     return d.y;
        // })]),
        // xAxis = d3.svg.axis()
        //     .scale(xRange)
        //     .tickSize(5)
        //     .tickSubdivide(true),
        yAxis = d3.svg.axis()
            .scale(yRange)
            .tickSize(5)
            .orient('left')
            .tickSubdivide(true);
    // vis.append('svg:g')
    //     .attr('class', 'x axis')
    //     .attr('transform', 'translate(0,' + (HEIGHT - MARGINS.bottom) + ')')
    //     .call(xAxis);

    vis.append('svg:g')
        .attr('class', 'y axis')
        .attr('transform', 'translate(' + (MARGINS.left) + ',0)')
        .call(yAxis);

    var lineFunc = d3.svg.line()
        .x(function(d) {
            return xRange(d.x);
        })
        .y(function(d) {
            return yRange(d.y);
        })
        .interpolate('linear');

    vis.append('svg:path')
        .attr('d', lineFunc(data))
        .attr('stroke', 'blue')
        .attr('stroke-width', 2)
        .attr('fill', 'none');
}

function draw_chart(type){
    // clear();
    // var start_date = document.getElementById('start-date');
    // var end_date = document.getElementById('end-date');
    // var dataset = $('input[name="dataset"]:checked').val();
    //
    // start_date = start_date.value.replace("-", "");
    // end_date.replace("-", "");
    //
    // if(start_date) {
    //     start_date += "000000";
    // }
    // if(end_date) {
    //     end_date += "000000";
    // }


    //replace with dataset later
    //get_data("sample", start_date, end_date, render);
    //
    if(type == "smartroof") {
        get_utci_data("smartroof", null, null, render);
    }
    if(type == "sun") {
        get_utci_data("sun", null, null, render);
    }
    // get_utci_data("ambient", start_date, end_date, render);
}
$(document).ready(draw_chart("smartroof"));
