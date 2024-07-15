<?php
require_once '../../inc/libraries.php';

$message['1'] = 'Payment Success!';
$message['2'] = 'Payment Pending';
$message['3'] = 'Payment Failed!';
function update_payment_status()
{
	global $db, $message;

	# Make sure $status, $billCode and $orderID have been set
		$payment_status = $_GET[ 'status_id' ] ?? null;
		$bill_code = $_GET[ 'billcode' ] ?? null;
		$orderID = $_GET[ 'order_id' ] ?? null;
		if ( !$payment_status || !$bill_code || !$orderID ) return;

	# Update payment_status column in '_order' table
		$order = $db->_order[compact('bill_code')];
		$result = $order->update(compact('payment_status'));
		if ( !$result ) return;

		echo $message[ $payment_status ];
}
update_payment_status();
//-----------------------------------------------------------------------------------------------------?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
	<br><br>
	<a href="index.php">Back To Homepage</a>
</body>
</html>