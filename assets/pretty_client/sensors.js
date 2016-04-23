//Sensor functionality

var sensorLayer = mapBase.append('g');

function buildSensorData(sensorData) {
    var radius = sensorData.radius;
    xp = 50;
    yp = 50;
    var sensors = [];

    sensorData.sensors.forEach(function(element,index){
        console.log(element);
        console.log(index);
        var sen = {
            "x": element.x_cord * xp + 10,
            "y": element.y_cord  * yp + 10,
            "fill": "#D25252",
            "stroke": "black",
            "r": 7,
            "stroke_width": 1,
            "luxValue": "0",
        };
        sensors.push(sen);
    });
    return sensors;
}
//todo - either delete or make use of this
function showSensors(b){
    circle.style("visibility", function() {return b == true ? "visible" : "hidden";});
}

d3.json("assets/pretty_client/data/sensordata.json", function(json) {
    points = json;
    // initiate and draw map grid
    var sensorData = buildSensorData(points);
    var sensors = sensorLayer.selectAll("circle").data(sensorData).enter().append("circle");
    var circleAttributes = sensors.attr("cx", function(d) {
        return d.x;
    }).attr("cy", function(d) {
        return d.y;
    }).attr("r", function(d) {
        return d.r;
    }).style("fill", function(d) {
        return d.fill;
    }).style("stroke", function(d) {
        return d.stroke;
    }).on('mouseover', function(d, i) {
        sensorOver(d, i);
    }).on('mouseout', function(d, i) {
        sensorOut(d, i);
    }).on('click', function(d, i) {
        sensorClick(d, i);
    });
});


function sensorClick(d, i) {
    // d.transition().style("fill","blue");
    ind = i + 1;
    var elmnt =sensorLayer.select("circle:nth-child(" + ind + ")");
    var fillColor = (elmnt.attr("clicked") == 1 ? "white" : "rgb(0, 0, 255)");
    elmnt.attr("clicked","1")
        .transition().style(
        "fill", fillColor).duration(300);
}
function sensorOver (d, i) {
    ind = i + 1;
    var elmnt =sensorLayer.select("circle:nth-child(" + ind + ")");
    if (elmnt.attr("clicked") != 1) {
        elmnt.transition().style(
            "fill", "white").duration(300);
    }
    tip.html(createTipHtml(d.x, i)).attr('class', 'd3-tip animate').show(d);
}
function sensorOut(d, i) {
    tip.attr('class', 'd3-tip').show(d).hide();
    ind = i + 1;
    var elmnt =sensorLayer.select("circle:nth-child(" + ind + ")");
    if (elmnt.attr("clicked") != 1){
        elmnt.transition().style(
            "fill", "#D25252").duration(300);
    }
    //gridLayer.select("path:nth-child(" + ind + ")").transition().style(
    //"fill", "white").duration(300);
}

var tip = d3.tip().attr('class', 'd3-tip').offset([ -10, 0 ]).html("temp");

mapBase.call(tip);

function createTipHtml(type, id) {
    var html = '<div class="tip-info-h">Sensor type - ' + type + '</div>';
    html += '<div class="nodeId">Values</div>';
    return html;
}