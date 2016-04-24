<?php $this->load->view('header'); ?>
    <div class="inner cover" style="margin-top: 60px">
        <h1 class="cover-heading">Chart</h1>
        <form>
            <label for="date">Start Date</label>
            <input type="date" id="start-date" onchange="clear(); draw_chart();">

            <label for="date">End Date</label>
            <input type="date" id="end-date" onchange="clear(); draw_chart();">

        </form>
</div>
            <svg id="chart" class="chart"></svg>
    <link rel="stylesheet" href="/SmartRoofNIOTH/assets/css/chart.css">
<?php $this->load->view('footer'); ?>