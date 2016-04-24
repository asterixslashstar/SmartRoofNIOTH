<?php $this->load->view('header'); ?>
    <div class="inner cover" style="margin-top: 60px">
        <h1 class="cover-heading">Historical UTCI</h1>
        <form>
<!--            <label for="date">Start Date</label>-->
<!--            <input type="date" id="start-date" onchange="clear(); draw_chart();" value="2014-08-01">-->
<!---->
<!--            <label for="date">End Date</label>-->
<!--            <input type="date" id="end-date" onchange="clear(); draw_chart();" value="2016-12-31">-->
            <label for="SmartRoof">SmartRoof</label>
            <input type="radio" id="SmartRoof" name="dataset" onclick="clear(); draw_chart('smartroof')" checked>
            <label for="Outside">Outside</label>
            <input type="radio" id="Outside" name="dataset" onclick="clear(); draw_chart('sun')">

        </form>
</div>
            <svg id="chart" class="chart"></svg>
    <link rel="stylesheet" href="/SmartRoofNIOTH/assets/css/chart.css">
<?php $this->load->view('footer'); ?>