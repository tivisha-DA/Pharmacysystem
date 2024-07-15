<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 1, true );

$facilities = $db->facility();
$clients = $db->user( 'role < ?', 2 );
$bookings = $db->booking();
$pendingBookings = $db->booking( 'status', 0 );


# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact('user','page', 'facilities','clients', 'bookings', 'pendingBookings' ));
	$tpl->display( 'Pages/Member/Admin/dashboard.tpl' );