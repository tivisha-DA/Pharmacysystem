<?php
require_once '../inc/libraries.php';

$auth->resetPassword(function( $row )
{
	if ( !$this->hasError && $this->post ) {
		return 'login.php';
	}
});

$email = $_GET['email'] ?? NULL;

# Display current page to the user
	$tpl->assign(compact( 'flash', 'email' ));
	$tpl->display( 'Pages/Auth/reset_password.tpl' );