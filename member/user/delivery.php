<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 0, true );

$order_id = $_GET['order_id'] ?? NULL;
if ( !$order_id ) return;





# Retrieve data from table 'delivery'
	$delivery = $db->delivery(compact( 'order_id' ));

# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact('user','page', 'flash', 'order_id', 'delivery' ));
	$tpl->display( 'Pages/Member/User/delivery.tpl' );