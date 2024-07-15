<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 0, true );


# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact('user','page' ));
	$tpl->display( 'Pages/Member/User/dashboard.tpl' );