/**
 * Created by asterixslashstar on 4/23/2016.
 */

if (!window.jQuery) {
    var $ = document.createElement('script'); $.type = 'text/javascript';
    // Path to jquery.js file, eg. Google hosted version
    $.src = '/SmartRoofNIOTH/assets/jquery/jquery-2.2.3.min.js';
    document.getElementsByTagName('head')[0].appendChild($);
}

var endpoint = "http://localhost/SmartRoofNIOTH/index.php/api/";

function get_data(datatype, start_date, end_date, callback) {
    var url = endpoint;
    if (datatype == "panels"
        || datatype == "sensors"
        || datatype == "settings") {
       url += datatype;
        if(start_date) {
            url += "/" + start_date;
            if(end_date) {
                url += "/" + end_date;
            }
        }
    }
    console.log ("fetch url: " + url);
    $.ajax({
        url: url,
        type: "GET",
        success: function(result){
            callback(result) ;
        }
    })
}

/* sample usage

function test_printer(data) {
    console.log(data);
}
console.log("test fetch");
console.log (get_data("panels", "20061124092345", "20261124092345", test_printer));

    */