<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 0, true );

$customerSupportID = $_GET['customer_support_id'] ?? NULL;
if ( !$customerSupportID ) return;

function new_message()
{
	global $db, $flash, $user;
		
		$_POST[ 'user_id' ] = $user['id'];
		unset( $_POST['action'] );

	# Insert new message into 'message' table
		$newMessage = $db->message()->insert( $_POST );
		if ( !$newMessage ) {
			$flash->danger( 'Failed to save new message. Please try again later!' );
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
		// if ( $action == 'add' ) $result = add_new_medicine();
		// if ( $action == 'edit' ) $result = edit_medicine();
		// if ( $action == 'delete' ) $result = delete_medicine();

		if ( $action == 'new-message' ) $result = new_message();

	echo json_encode(compact( 'result' ));
	exit;
}
process_form_if_it_has_been_sent();







# Retrieve data from table 'customer_support'
	$messages = $db->customer_support[ $customerSupportID ]->message();

# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact('user','page', 'flash', 'customerSupportID', 'messages' ));
	$tpl->display( 'Pages/Member/User/messages.tpl' );