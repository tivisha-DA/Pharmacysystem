<?php
require_once '../inc/libraries.php';

$auth->forgotPassword( '', 'http://localhost/pharmacy/auth/reset_password.php' );


# Display current page to the user
	$tpl->assign(compact( 'flash' ));
	$tpl->display( 'Pages/Auth/forgot_password.tpl' );