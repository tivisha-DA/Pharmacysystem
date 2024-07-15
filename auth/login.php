<?php
require_once '../inc/libraries.php';

$auth->login(function( $row )
{
	if ( !$this->hasError ) {
		if ( $row[ 'role' ] == '0' ) return '../member/user/index.php'; //User
		if ( $row[ 'role' ] == '1' ) return '../member/admin/index.php'; //Admin
		return '../member/index.php';
	}
});


# Display current page to the user
	$tpl->assign(compact( 'flash', 'google_recaptcha_site_key' ));
	$tpl->display( 'Pages/Auth/login.tpl' );