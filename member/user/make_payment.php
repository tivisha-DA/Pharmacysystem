<?php
require_once '../../inc/libraries.php';

$user = $auth->memberArea(function( $row )
					{
						if ( $this->hasError ) {
							return '../../auth/login.php';
						}
					}, 0, true );

function process_checkout_form_if_it_has_been_sent()
{	
	global $ToyyibPaySecretKey, $categoryCode, $db, $user;

	# Make sure form has been sent first
		if ( $_SERVER[ 'REQUEST_METHOD' ] != 'POST' ) return;

	# Get details about cart_items
		$payment_total = $_POST[ 'payment_total' ];
		$description = 'this is a description for order';


	# Create database: order, item
		// order
			$_POST[ 'user_id' ] = $user[ 'id' ];
			$_POST[ 'medicine_id' ] = $_POST['id'];
			unset( $_POST['id'] );
			$order = $db->_order()->insert( $_POST ); // user_id, medicine_id, quantity, payment_total

	# Create new bill in ToyyibPay
		$paymentGateway = new ToyyibPay( $ToyyibPaySecretKey );
		$bill = $paymentGateway->createBill( $categoryCode, "Pharmacy: Order #{$order[ 'id' ]}", $description, $order[ 'id' ] )
								->payer( $user['username'], $user['email'], $user['phone'] )
								->amount( $payment_total )
								->paymentChannel( 2 )
								->chargeToCustomer( 2 )
								->callbackUrl( 'http://localhost/pharmacy/member/user/payment_result.php' )
								->emailContent( 'Thank you for purchasing our product(s)!' );
		$bill_code = $bill->getCode();

	# Save bill_code to '_order' table
		$db->_order[ $order['id'] ]->update(compact( 'bill_code' ));

	# Redirect user to Payment URL
		$bill->redirectToPaymentUrl();
}
process_checkout_form_if_it_has_been_sent();