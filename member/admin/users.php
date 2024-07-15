<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 1, true );




function add_new_user()
{
	global $user, $db, $flash;

		$_POST[ 'branch_id' ] = $user[ 'branch_id' ];
		$_POST[ 'password' ] = password_hash( $_POST[ 'password' ], PASSWORD_DEFAULT);
		$_POST[ 'verified' ] = 1;
		unset( $_POST[ 'action' ] );

	$failed = !$db->user()->insert( $_POST );
	if ( $failed ) {
		$flash->danger( 'Failed to add new user. Please try again later!' );
		return false;
	}
	$flash->success( 'The user has been added successfully!' );
	return true;
}



function process_form_if_it_has_been_sent()
{
	# Make sure form has been sent
		if ( $_SERVER[ 'REQUEST_METHOD' ] != 'POST' ) return;
		$action = $_POST[ 'action' ];

	# Process form
		$result = false;
		if ( $action == 'add' ) $result = add_new_user();

	echo json_encode(compact( 'result' ));
	exit;
}
process_form_if_it_has_been_sent();





# Retrieve data from table users
	$users = $db->user( 'branch_id', $user['branch_id'] )->select( 'id, username, email, phone, matric_number, role, created' );

# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact('user','page', 'flash', 'users' ));
	$tpl->display( 'Pages/Member/Admin/users.tpl' );