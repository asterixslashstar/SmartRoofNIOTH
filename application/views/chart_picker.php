<script src="/SmartRoofNIOTH/assets/jquery/jquery-2.2.3.min.js" charset="utf-8"></script>
<script src="/SmartRoofNIOTH/assets/d3/d3.min.js" charset="utf-8"></script>
<script src="/SmartRoofNIOTH/assets/js/api_wrapper.js" charset="utf-8"></script>
<script src="/SmartRoofNIOTH/assets/js/line_chart.js" charset="utf-8"></script>

<form>
    <label for="start-date" class="label">Start Date</label>
    <input type="date" id="start-date">

    <label for="end-date" class="label">End Date</label>
    <input type="date" id="end-date">

    <label for="set1">Panels</label>
    <input type="radio" id="panels" name="dataset" value="panels" onclick="draw_chart()">

    <label for="set2">Sensors</label>
    <input type="radio" id="dataset" name="dataset" value="sensors" onclick="draw_chart()">

</form>

<svg id="chart" class="chart"></svg>
<?php
/**
 * Created by PhpStorm.
 * User: asterixslashstar
 * Date: 4/23/2016
 * Time: 7:38 AM
 */