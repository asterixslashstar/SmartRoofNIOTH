<?php $this->load->view('header'); ?>
    <div class="inner cover" style="margin-top: 60px">
        <h1 class="cover-heading">Chart</h1>
        <form>
            <label for="date">Start Date</label>
            <input type="datetime" id="start-date">

            <label for="date">End Date</label>
            <input type="datetime" id="end-date">

            <label for="set1">Panels</label>
            <input type="radio" id="panels" name="dataset" value="panels" onclick="draw_chart()">

            <label for="set2">Sensors</label>
            <input type="radio" id="dataset" name="dataset" value="sensors" onclick="draw_chart()">
        </form>
</div>
            <svg id="chart" class="chart"></svg>
    <link rel="stylesheet" href="/SmartRoofNIOTH/assets/css/chart.css">
<?php $this->load->view('footer'); ?>