<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 1, true );



function edit_order()
{
	global $db, $flash;
	$id = $_POST[ 'id' ];
	unset( $_POST[ 'action' ], $_POST[ 'id' ] );

	$affected = !$db->_order[ $id ]->update( $_POST );
	if ( $affected <0 ) {
		$flash->danger( 'Failed to update order details. Please try again later!' );
		return false;
	}

	$flash->success( 'The order data has been updated successfully!' );
	return true;
}


function process_form_if_it_has_been_sent()
{
	# Make sure form has been sent
		if ( $_SERVER[ 'REQUEST_METHOD' ] != 'POST' ) return;
		$action = $_POST[ 'action' ];

	# Process form
		$result = false;
		if ( $action == 'edit' ) $result = edit_order();

	echo json_encode(compact( 'result' ));
	exit;
}
process_form_if_it_has_been_sent();





# Retrieve data from table '_order'
	$orders = $db->_order();

# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact('user','page', 'flash', 'orders' ));
	$tpl->display( 'Pages/Member/Admin/orders.tpl' );