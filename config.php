<?php





$host = 'localhost';
$username = 'root';
$password = '';
$database = 'pharmacy';



$ToyyibPaySecretKey = 'fcppbevu-oamy-wgdg-6dql-f9t0wtraisuo';
$categoryCode = '6x1r34yo';



// $google_recaptcha_site_key = '6LfW6DYpAAAAAEjB_81PFf23-8Tqe2umzGDWPZ0n';
// $google_recaptcha_secret_key = '6LfW6DYpAAAAAOb-37PsIX-2Fc880JFzKYrLR3BV';




$google_recaptcha_site_key = '6LcXoJkmAAAAAHqvPsN5WoMd1sc1UYYVe_HNsrF8';
$google_recaptcha_secret_key = '6LcXoJkmAAAAALJZBA0ub0yilsTtd6PDXjWOWvTj';




function validate_recaptcha() // this will return true if success
{
	# Make sure form has been sent first
		if ( $_SERVER[ 'REQUEST_METHOD' ] !== 'POST' ) return;
		$recaptchaResponse = $_POST['g-recaptcha-response']; // Get the reCAPTCHA response from the POST request
		unset( $_POST['g-recaptcha-response'] );

	# Send a POST request to the reCAPTCHA API for verification
		global $google_recaptcha_secret_key;
		$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$google_recaptcha_secret_key&response=$recaptchaResponse");
		$response = json_decode( $response );

	# Check the response from the reCAPTCHA API
		return $response->success;
}