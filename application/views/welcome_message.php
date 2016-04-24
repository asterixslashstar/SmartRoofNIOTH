<?php $this->load->view('header'); ?>

    <div class="inner cover" style="margin-top: 70px;">
      <h1 class="cover-heading">See how your smart patio performs!</h1>
      <p class="lead">Take a closer look at the micro climate conditions in the structure </p>
      <p class="lead">UTCI: <span id="utci"></span> &deg;C</p>
        <div class="planViewContainer"></div>
    </div>

    <link href="assets/pretty_client/smartroof.css" rel="stylesheet">
    <!--link href="assets/pretty_client/cover.css" rel="stylesheet"-->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/d3/d3.js" charset="utf-8"></script>
    <script src="assets/d3/d3tip.js" charset="utf-8"></script>

    <script src="assets/js/client_services.js"></script>

    <script src="assets/pretty_client/smartroof.js"></script>
    <script src="assets/pretty_client/sensors.js"></script>
    <script src="assets/pretty_client/panels.js"></script>
<?php $this->load->view('footer'); ?>
