<?php 
ob_start();
session_start();
include '../_init.php';

// Redirect, If user is not logged in
if (!is_loggedin()) {
  redirect(root_url() . '/index.php?redirect_to=' . url());
}

// Redirect, If User has not Read Permission
if (user_group_id() != 1 && !has_permission('access', 'read_sms_setting')) {
	redirect(root_url() . '/'.ADMINDIRNAME.'/dashboard.php');
}

// Set Document Title
$document->setTitle(trans('title_sms_setting'));

// Add Script
$document->addScript('../assets/harvestsnop/angular/controllers/SMSSettingController.js');

// Include Header and Footer
include ("header.php");
include ("left_sidebar.php");
?>

<!-- Content Wrapper Start -->
<div class="content-wrapper" ng-controller="SMSSettingController">

	<!-- Content Header Start-->
	<section class="content-header">
		<h1>
			<?php echo trans('text_sms_setting_title'); ?>
			<small>
				<?php echo store('name'); ?>
			</small>
		</h1>
		<ol class="breadcrumb">
			<li>
				<a href="dashboard.php">
					<i class="fa fa-dashboard"></i> 
					<?php echo trans('text_dashboard'); ?>
				</a>
			</li>
			<li class="active">
				<?php echo trans('text_sms_setting'); ?>
			</li>
		</ol>
	</section>
	<!-- Content Header End-->

	<!-- Content Start-->
	<section class="content">

		<?php if(DEMO) : ?>
	    <div class="box">
	      <div class="box-body">
	        <div class="alert alert-info mb-0">
	          <p><span class="fa fa-fw fa-info-circle"></span> <?php echo $demo_text; ?></p>
	        </div>
	      </div>
	    </div>
	    <?php endif; ?>
	    
		<form id="sms-setting-form" class="form-horizontal" action="sms_setting.php" method="post">
			<input type="hidden" name="action_type" value="UPDATE">
			<div class="nav-tabs-custom">
		        <ul class="nav nav-tabs store-m15">
		        	<li class="<?php echo get_preference('sms_gateway') == 'Clickatell' ? 'active' : null;?>">
		          		<a href="#clickatell" data-toggle="tab" aria-expanded="false">
		          		<?php echo trans('text_clickatell'); ?>
		       			</a>
		       		</li>
		       		<li class="<?php echo get_preference('sms_gateway') == 'Twilio' ? 'active' : null;?>">
		          		<a href="#twilio" data-toggle="tab" aria-expanded="false">
		          		<?php echo trans('text_twilio'); ?>
		       			</a>
		       		</li>
		       		<li class="<?php echo get_preference('sms_gateway') == 'Msg91' ? 'active' : null;?>">
		          		<a href="#msg91" data-toggle="tab" aria-expanded="false">
		          		<?php echo trans('text_msg91'); ?>
		       			</a>
		       		</li>
		       		<li class="<?php echo get_preference('sms_gateway') == 'Mimsms' ? 'active' : null;?>">
		          		<a href="#mimsms" data-toggle="tab" aria-expanded="false">
		          		<?php echo trans('text_mimsms'); ?>
		       			</a>
		       		</li>
		       		<li class="<?php echo get_preference('sms_gateway') == 'Onnorokomsms' ? 'active' : null;?>">
		          		<a href="#onnorokomsms" data-toggle="tab" aria-expanded="false">
		          		<?php echo trans('text_onnorokomsms'); ?>
		       			</a>
		       		</li>
		        </ul>
		        <div class="tab-content">
			        <!-- clickatell Setting Start -->
			        <div class="tab-pane <?php echo get_preference('sms_gateway') == 'Clickatell' ? 'active' : null;?>" id="clickatell">
			          	<div class="form-group">
							<label for="clickatell_username" class="col-sm-3 control-label">
								<?php echo trans('label_username'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="clickatell_username" value="<?php echo sms_setting('clickatell', 'username'); ?>" name="setting[clickatell][username]">
							</div>
						</div>
						<div class="form-group">
							<label for="clickatell_password" class="col-sm-3 control-label">
								<?php echo trans('label_password'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="clickatell_password" value="<?php echo sms_setting('clickatell', 'password'); ?>" name="setting[clickatell][password]">
							</div>
						</div>
						<div class="form-group">
							<label for="clickatell_api_id" class="col-sm-3 control-label">
								<?php echo trans('label_api_key'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="clickatell_api_id" value="<?php echo sms_setting('clickatell', 'api_id'); ?>" name="setting[clickatell][api_id]">
							</div>
						</div>
					</div> 
					<!-- clickatell Setting End -->

					<!-- twilio Setting Start -->
			        <div class="tab-pane <?php echo get_preference('sms_gateway') == 'Twilio' ? 'active' : null;?>" id="twilio">
			          	<div class="form-group">
							<label for="twilio_sender_id" class="col-sm-3 control-label">
								<?php echo trans('label_sender_id'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="sender_id" value="<?php echo sms_setting('twilio', 'sender_id'); ?>" name="setting[twilio][sender_id]">
							</div>
						</div>
						<div class="form-group">
							<label for="twilio_auth_key" class="col-sm-3 control-label">
								<?php echo trans('label_auth_key'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="twilio_auth_key" value="<?php echo sms_setting('twilio', 'auth_key'); ?>" name="setting[twilio][auth_key]">
							</div>
						</div>
						<div class="form-group">
							<label for="twilio_contact" class="col-sm-3 control-label">
								<?php echo trans('label_contact'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="twilio_contact" value="<?php echo sms_setting('twilio', 'contact'); ?>" name="setting[twilio][contact]">
							</div>
						</div>
					</div> 
					<!-- twilio Setting End -->

					<!-- msg91 Setting Start -->
			        <div class="tab-pane <?php echo get_preference('sms_gateway') == 'Msg91' ? 'active' : null;?>" id="msg91">
			          	<div class="form-group">
							<label for="msg91_auth_key" class="col-sm-3 control-label">
								<?php echo trans('label_auth_key'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="msg91_auth_key" value="<?php echo sms_setting('msg91', 'auth_key'); ?>" name="setting[msg91][auth_key]">
							</div>
						</div>
						<div class="form-group">
							<label for="msg91_sender_id" class="col-sm-3 control-label">
								<?php echo trans('label_sender_id'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="msg91_sender_id" value="<?php echo sms_setting('msg91', 'sender_id'); ?>" name="setting[msg91][sender_id]">
							</div>
						</div>
						<div class="form-group">
							<label for="msg91_country_code" class="col-sm-3 control-label">
								<?php echo trans('label_country_code'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="msg91_country_code" value="<?php echo sms_setting('msg91', 'country_code'); ?>" name="setting[msg91][country_code]">
							</div>
						</div>
					</div> 
					<!-- msg91 Setting End -->

					<!-- mimsms Setting Start -->
			        <div class="tab-pane <?php echo get_preference('sms_gateway') == 'Mimsms' ? 'active' : null;?>" id="mimsms">
			          	<div class="form-group">
							<label for="api_id" class="col-sm-3 control-label">
								<?php echo trans('label_api_key'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="api_id" value="<?php echo sms_setting('mimsms', 'api_id'); ?>" name="setting[mimsms][api_id]">
							</div>
						</div>
						<div class="form-group">
							<label for="auth_key" class="col-sm-3 control-label">
								<?php echo trans('label_api_token'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="auth_key" value="<?php echo sms_setting('mimsms', 'auth_key'); ?>" name="setting[mimsms][auth_key]">
							</div>
						</div>
						<div class="form-group">
							<label for="sender_id" class="col-sm-3 control-label">
								<?php echo trans('label_sender_id'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="sender_id" value="<?php echo sms_setting('mimsms', 'sender_id'); ?>" name="setting[mimsms][sender_id]">
							</div>
						</div>
					</div> 
					<!-- mimsms Setting End -->

					<!-- onnorokomsms Setting Start -->
			        <div class="tab-pane <?php echo get_preference('sms_gateway') == 'Onnorokomsms' ? 'active' : null;?>" id="onnorokomsms">
			          	<div class="form-group">
							<label for="onnorokomsms_username" class="col-sm-3 control-label">
								<?php echo trans('label_username'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="onnorokomsms_username" value="<?php echo sms_setting('onnorokomsms', 'username'); ?>" name="setting[onnorokomsms][username]">
							</div>
						</div>
						<div class="form-group">
							<label for="onnorokomsms_password" class="col-sm-3 control-label">
								<?php echo trans('label_password'); ?>
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="onnorokomsms_password" value="<?php echo sms_setting('onnorokomsms', 'password'); ?>" name="setting[onnorokomsms][password]">
							</div>
						</div>
						<div class="form-group">
							<label for="onnorokomsms_maskname" class="col-sm-3 control-label">
								<?php echo trans('label_maskname'); ?> (<?php echo trans('label_optional'); ?>)
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="onnorokomsms_maskname" value="<?php echo sms_setting('onnorokomsms', 'maskname'); ?>" name="setting[onnorokomsms][maskname]">
							</div>
						</div>
						<div class="form-group">
							<label for="onnorokomsms_campaignname" class="col-sm-3 control-label">
								<?php echo trans('label_campaignname'); ?> (<?php echo trans('label_optional'); ?>)
							</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="onnorokomsms_campaignname" value="<?php echo sms_setting('onnorokomsms', 'campaignname'); ?>" name="setting[onnorokomsms][campaignname]">
							</div>
						</div>
					</div> 
					<!-- onnorokomsms Setting End -->
				</div>

				<?php if (user_group_id() == 1 || has_permission('access', 'update_sms_setting')) : ?>
				<div class="form-group">
					<label class="col-sm-3 control-label">&nbsp;</label>
					<div class="col-sm-3">
						<button id="sms-setting-btn" class="btn btn-info btn-block" type="button" data-form="#sms-setting-form" data-loading-text="Updating...">
							<span class="fa fa-fw fa-pencil"></span> 
							<?php echo trans('button_update'); ?>
						</button>
					</div>
				</div>
				<?php endif; ?>
				<br>
			</div> 

		</form>
	</section>
	<!-- Content End-->

</div>
<!-- Content Wrapper End -->

<?php include ("footer.php"); ?>