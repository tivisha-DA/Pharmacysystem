<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 1, true );




function send_message()
{
	global $db, $flash, $user;
		unset( $_POST[ 'action' ] );
		$_POST[ 'user_id' ] = $user['id'];

	$failed = !$db->customer_support()->insert( $_POST );
	if ( $failed ) {
		$flash->danger( 'Failed to send message. Please try again later!' );
		return false;
	}
	$flash->success( 'Your message has been sent successfully!' );
	return true;
}

function edit_medicine()
{
	global $db, $flash;
	$id = $_POST[ 'id' ];
	unset( $_POST[ 'action' ], $_POST[ 'id' ] );

	$failed = !$db->medicine[ $id ]->update( $_POST );
	if ( $failed ) {
		$flash->danger( 'Failed to update medicine details. Please try again later!' );
		return false;
	}

	$flash->success( 'The medicine data has been updated successfully!' );
	return true;
}

function delete_medicine()
{
	global $db, $flash;
	$id = $_POST[ 'id' ];
	unset( $_POST[ 'action' ], $_POST[ 'id' ] );

	$affected = !$db->medicine[ $id ]->delete();
	if ( $affected < 0 ) {
		$flash->danger( 'Failed to delete medicine details. Please try again later!' );
		return false;
	}

	$flash->success( 'The medicine data has been deleted successfully!' );
	return true;
}


function process_form_if_it_has_been_sent()
{
	# Make sure form has been sent
		if ( $_SERVER[ 'REQUEST_METHOD' ] != 'POST' ) return;
		$action = $_POST[ 'action' ];

	# Process form
		$result = false;
		if ( $action == 'add' ) $result = add_new_medicine();
		if ( $action == 'edit' ) $result = edit_medicine();
		if ( $action == 'delete' ) $result = delete_medicine();

		if ( $action == 'send-message' ) $result = send_message();

	echo json_encode(compact( 'result' ));
	exit;
}
process_form_if_it_has_been_sent();





# Retrieve data from table 'meal'
	$customer_supports = $db->customer_support();

# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact('user','page', 'flash', 'customer_supports' ));
	$tpl->display( 'Pages/Member/Admin/customer_support.tpl' );