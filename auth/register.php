<?php
require_once '../inc/libraries.php';

	
function check_recaptcha()
{
	global $flash;

	# Make sure form has been sent first
		if ( $_SERVER['REQUEST_METHOD'] !== 'POST' ) return;

	# Make sure the user is human
		$isHuman = validate_recaptcha();
		if( !$isHuman ) {
			$flash->danger( 'Recaptcha failed!' );
			return false;
		}
	return true;
}
check_recaptcha();

$auth->register( 'login.php' );

# Display current page to the user
	$tpl->assign(compact( 'flash', 'google_recaptcha_site_key' ));
	$tpl->display( 'Pages/Auth/register.tpl' );