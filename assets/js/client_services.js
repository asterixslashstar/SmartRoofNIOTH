/**
 * Created by asterixslashstar on 4/23/2016.
 */


function update_utci(data) {
    var utci = document.getElementById("utci");
    utci.innerHTML = parseFloat(data['shade']).toFixed(1);
}


function poll() {
    var endpoint = "http://localhost/SmartRoofNIOTH/index.php/environment/current";
    var update = "http://localhost/SmartRoofNIOTH/index.php/environment/update";
    $.ajax({
        url: endpoint,
        type: "GET",
        success: function(result){
            update_utci(jQuery.parseJSON(result)) ;
            console.log('update');
            console.log(result['shade']);
        }
    });

    $.ajax({
        url: update,
        type: "GET"
    });

    $.ajax({
        url: "http://localhost/SmartRoofNIOTH/index.php/sensors/fetch",
        type: "GET"
    });

    get_data("panels", null, null, function () {

        //call panel transition function here

    });
}


setTimeout(poll(),2000);
