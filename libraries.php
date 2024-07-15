<?php

require_once 'config.php';
require_once 'ToyyibPay.php';

require_once 'mail/src/PHPMailer.php';
require_once 'mail/src/SMTP.php';
require_once 'mail/src/Exception.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
$mail = new PHPMailer(true);



require_once 'db/NotORM.php';
$dsn = "mysql:dbname=$database;host=$host";
$pdo = new PDO( $dsn, $username, $password );
$db = new NotORM( $pdo );


require_once 'tpl/TPL.class.php';
$tpl = new TPL;
// $tpl->debugging = true;
$tpl->caching = false;
$tpl->force_compile = true;


require_once 'EzFlash.php';
require_once 'EzAuth.php';
use elmyrockers\EzFlash;
use elmyrockers\EzAuth;

$flash = new EzFlash;
$auth = new EzAuth([ $db, $tpl, $mail, $flash ]);






$isLoggedIn = $auth->isLoggedIn();
$tpl->assign(compact( 'isLoggedIn' ));



#------------------------------------------------------------------------ DEBUGGING PURPOSE



	function p( $value )
	{
		echo "<pre>";
		print_r( $value );
		echo "</pre>";
	}
	function v( $value )
	{
		echo "<pre>";
		var_dump( $value );
		echo "</pre>";
	}


	function pe( $value )
	{
		p( $value ); exit;
	}

	function ve( $value )
	{
		v( $value ); exit;
	}