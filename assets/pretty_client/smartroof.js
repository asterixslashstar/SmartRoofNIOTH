var points;
var dt;

var hexagons;
function buildGridData(gridData) {
    var radius = gridData.size;
    xp = 50;
    yp = 50;
    var hexes = [];
    var xCells = 5,
        yCells = 5;

    gridData.points.forEach(function(element,index){
        console.log(element);
        console.log(index);
        var xAddition = xp + (radius*element.x_cord);

        var yAddition = yp + (radius*element.y_cord);
        var hex = {
            "x_axis": element.x_cord,
            "y_axis": element.y_cord ,
            "fill": "white",
            "stroke": "gray",
            "stroke_width": 1,
            "luxValue": "0",
            "class":"hex",
            "hexagonData" :[
                {"x": xAddition, "y": yAddition},
                {"x": xAddition + radius, "y": yAddition},
                {"x": xAddition + radius, "y": yAddition - radius},
                {"x": xAddition, "y": yAddition - radius},
            ]
        };
        hexes.push(hex);
    });
    return hexes;
}

drawHexagon =  d3.svg.line()
    .x(function (d) {
        return d.x; })
    .y(function (d) { return d.y; })
    //.interpolate("cardinal-closed")
    .interpolate("linear-closed")
    .tension("0.2");


//Make an SVG Container
var mapBase = d3.select(".planViewContainer").append("svg").attr("width", 800)
    .attr("height", 600);
var gridLayer = mapBase.append('g');

//load points file
d3.json("assets/pretty_client/data/griddata.json", function(json) {
    points = json;
    // initiate and draw map grid
    dt = buildGridData(points);

    hexagons = gridLayer.selectAll("path").data(dt).enter().append("path");

    var hexAttributes = hexagons.attr("d",function(d){
        return drawHexagon(d.hexagonData)
    }).attr("x", function(d) {
        return d.x_axis;
    }).attr("y", function(d) {
        return d.y_axis;
    }).attr("class", function(d) {
        return d.class;
    }).style("fill", function(d) {
        return d.fill;
    }).style("stroke", function(d) {
        return d.stroke;
    }).style("stroke-width", function(d) {
        return d.stroke_width;
    }).on('mouseover', function(d, i) {
        over(d, i);
    }).on('mouseout', function(d, i) {
        out(d, i);
    }).on('click', function(d, i) {
        clickCell(d, i);
    });
});
function clickCell(d, i) {
    // d.transition().style("fill","blue");
    ind = i + 1;
    var elmnt =gridLayer.select("path:nth-child(" + ind + ")");
    var fillColor = (elmnt.attr("clicked") == 1 ? "white" : "rgb(0, 0, 255)");
    elmnt.attr("clicked","1")
        .transition().style(
        "fill", fillColor).duration(300);
}
function over(d, i) {
    //tip.html(createTipHtml(d.luxValue, i)).attr('class', 'd3-tip animate').show(d);
    ind = i + 1;
    var elmnt =gridLayer.select("path:nth-child(" + ind + ")");
    if (elmnt.attr("clicked") != 1) {
        elmnt.transition().style(
            "fill", "rgb(167, 79, 79)").duration(300);
    }
}
function out(d, i) {
    //tip.attr('class', 'd3-tip').show(d).hide();
    ind = i + 1;
    var elmnt =gridLayer.select("path:nth-child(" + ind + ")");
    if (elmnt.attr("clicked") != 1){
        elmnt.transition().style(
            "fill", "white").duration(300);
    }
    //gridLayer.select("path:nth-child(" + ind + ")").transition().style(
    //"fill", "white").duration(300);
}

var tip = d3.tip().attr('class', 'd3-tip').offset([ -10, 0 ]).html("");