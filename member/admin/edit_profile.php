<?php
require_once '../../inc/libraries.php';


$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 1, true );


function process_fileupload()
{
	global $flash;
	extract( $_FILES[ 'picture' ] ); // $name, $type, $tmp_name, $error, $size

	# Make sure the picture has been uploaded
		if ( $error > 0 ) return;
		

	# Save file to specified folder
		$uploadDir = __DIR__."/../../assets/pictures/$name";
		if( !move_uploaded_file( $tmp_name, $uploadDir ) ) {
			$flash->danger( 'Failed to upload profile picture. Please try again later!' );
			return false;
		}

	# Set uploaded filename for next process (to save it to database)
		$_POST[ 'picture' ] = $name;
		return true;
}

function edit_user()
{
	global $db, $flash, $user;
	$id = $user[ 'id' ];

	# Process fileupload first
		process_fileupload();

	# Hash new password
		$password = $_POST[ 'password' ];
		if ( empty( $password ) ) {
			unset( $_POST[ 'password' ] );
		} else {
			$_POST[ 'password' ] = password_hash( $password, PASSWORD_DEFAULT);
		}

	$failed = !$db->user[ $id ]->update( $_POST );
	if ( $failed ) {
		$flash->danger( 'Failed to update your profile data. Please try again later!' );
		return false;
	}

	$user = $db->user[ $id ];
	$flash->success( 'Your profile data has been updated successfully!' );
	return true;
}



function process_form_if_it_has_been_sent()
{
	# Make sure form has been sent
		if ( $_SERVER[ 'REQUEST_METHOD' ] != 'POST' ) return;

	# Process form
		edit_user();
}
process_form_if_it_has_been_sent();


# Display page
	$page = pathinfo( __FILE__, PATHINFO_FILENAME );
	$tpl->assign(compact( 'flash','user','page' ));
	$tpl->display( 'Pages/Member/Admin/edit_profile.tpl' );