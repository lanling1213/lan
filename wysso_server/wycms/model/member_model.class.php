<?php
defined('IN_WYCMS') or exit('No permission resources.');
wy_base::load_sys_class('model', '', 0);
class member_model extends model {
	public function __construct() {
		$this->db_config = wy_base::load_config('database');
		$this->db_setting = 'default';
		$this->table_name = 'members';
		parent::__construct();
	}
	
	public function get_version() {
		return $this->db->version();
	}
	
	public function get_table_status() {
		$this->db->query("SHOW TABLE STATUS LIKE '$this->db_tablepre%'");
		$datalist = array();
		while(($rs = $this->db->fetch_next()) != false) {
			$datalist[] = $rs;
		}
		$this->db->free_result();
		return $datalist;
	}
}
?>
