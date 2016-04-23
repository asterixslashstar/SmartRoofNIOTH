var panelData;
var panelLayer = mapBase.append('g');

function buildPanelData(_panelData) {
    var hexes = [];
    _panelData.panels.forEach(function(element,index){
        var hex = {
            "fill": "gray",
            "stroke": "black",
            "stroke_width": 1,
            "panelData": element.points
        };
        hexes.push(hex);
    });
    return hexes;
}

drawPanel =  d3.svg.line()
    .x(function (d) {
        return d.x; })
    .y(function (d) { return d.y; })
    //.interpolate("cardinal-closed")
    .interpolate("linear-closed");


//load points file
d3.json("assets/pretty_client/data/paneldata.json", function(json) {
    points = json;
    // initiate and draw map grid
    panelData = buildPanelData(points);

    var panels = panelLayer.selectAll("path").data(panelData).enter().append("path");

    var panelAttributes = panels.attr("d",function(d){
        return drawPanel(d.panelData)
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
        panelOver(d, i);
    }).on('mouseout', function(d, i) {
        panelOut(d, i);
    }).on('click', function(d, i) {
        panelClick(d, i);
    });
});
function panelClick(d, i) {
    // d.transition().style("fill","blue");
    /*
    ind = i + 1;
    var elmnt =panelLayer.select("path:nth-child(" + ind + ")");
    var fillColor = (elmnt.attr("clicked") == 1 ? "white" : "rgb(0, 0, 255)");
    elmnt.attr("clicked","1")
        .transition().style(
        "fill", fillColor).duration(300);
        */
}
function panelOver(d, i) {
    //tip.html(createTipHtml(d.luxValue, i)).attr('class', 'd3-tip animate').show(d);
    ind = i + 1;
    var elmnt =panelLayer.select("path:nth-child(" + ind + ")");
    if (elmnt.attr("clicked") != 1) {
        elmnt.transition().style(
            "fill", "rgb(167, 79, 79)").duration(300);
    }
}
function panelOut(d, i) {
    //tip.attr('class', 'd3-tip').show(d).hide();
    ind = i + 1;
    var elmnt =panelLayer.select("path:nth-child(" + ind + ")");
    if (elmnt.attr("clicked") != 1){
        elmnt.transition().style(
            "fill", "gray").duration(300);
    }
}
