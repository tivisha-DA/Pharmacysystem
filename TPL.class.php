<?php
require_once 'libs/Smarty.class.php';


class TPL extends Smarty {

	public function __construct()
	{
		parent::__construct();


		$this->setTemplateDir( __DIR__.'/../../views/' );
		$this->setCompileDir( __DIR__.'/compile/' );
		$this->setCacheDir( __DIR__.'/cache/' );
		$this->setConfigDir( __DIR__.'/config/' );
		
		// $this->setConfigDir('/web/www.example.com/guestbook/configs/');
		// $this->setCacheDir('/web/www.example.com/guestbook/cache/');

		// $this->caching = Smarty::CACHING_LIFETIME_CURRENT;
		// $this->assign('app_name', 'Guest Book');
	}
}