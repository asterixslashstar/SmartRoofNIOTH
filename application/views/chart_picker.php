<?php $this->load->view('header'); ?>
    <div class="inner cover">
        <h1 class="cover-heading">Advanced</h1>
            <form>
                <label for="date" class="label">Start Date</label>
                <input type="datetime" id="start-date">

                <label for="date" class="label">End Date</label>
                <input type="datetime" id="end-date">

                <label for="set1" class="label">Panels</label>
                <input type="radio" id="panels" name="dataset" value="panels" onclick="draw_chart()">

                <label for="set2" class="label">Sensors</label>
                <input type="radio" id="dataset" name="dataset" value="sensors" onclick="draw_chart()">
            </form>
</div>
            <svg id="chart" class="chart"></svg>
<?php $this->load->view('footer'); ?>