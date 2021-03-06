<?php 
defined('IN_WYCMS') or exit('No permission resources.');

/**
 * 
 * ------------------------------------------
 * check_vid 
 * ------------------------------------------
 * @package 	WYCMS V9.1.16
 * @author		陈学旺
 * @copyright	CopyRight (c) 2006-2012 上海盛大网络发展有限公司
 * 
 */

 class vid {
	
	public function __construct() {
		wy_base::load_app_class('ku6api', 'video', 0);

		$this->setting = getcache('video', 'video');
		$this->ku6api = new ku6api($this->setting['sn'], $this->setting['skey']);
	}

	/**
	 * 
	 * 添加vid
	 */
	public function check () {
		$vid = $_GET['vid'];
		
		$this->ku6api->check($vid);
	}
 }
