<?php $this->load->view('header'); ?>
<?php 
foreach($css_files as $file): ?>
	<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
	<script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>
	<div class="inner cover">
		<h1 class="cover-heading">Admin</h1>

		<div>
			<a href='<?php echo site_url('config/sensor_management')?>'>Sensors</a> |
			<a href='<?php echo site_url('config/panel_management')?>'>Panels</a> |
			<a href='<?php echo site_url('config/tile_management')?>'>Tiles</a> |
			<a href='<?php echo site_url('config/settings_management')?>'>Settings</a>

		</div>
		<div style='height:20px;'></div>
		<div>
			<?php echo $output; ?>
		</div>
	</div>
<?php $this->load->view('footer'); ?>
