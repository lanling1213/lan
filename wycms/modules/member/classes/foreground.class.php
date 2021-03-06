<?php

class foreground {
	public $db, $memberinfo;
	private $_member_modelinfo;
	
	public function __construct() {
		self::check_ip();
		$this->db = wy_base::load_model('member_model');
		//ajax验证信息不需要登录
		if(substr(ROUTE_A, 0, 7) != 'public_') {
			self::check_member();
		}
	}
	
	/**
	 * 判断用户是否已经登陆
	 */
	final public function check_member() {
		$wycms_auth = param::get_cookie('auth');
		if(ROUTE_M =='member' && ROUTE_C =='index' && in_array(ROUTE_A, array('login', 'register', 'mini','send_newmail'))) {
		    if ($wycms_auth && ROUTE_A != 'mini') {
				showmessage(L('login_success', '', 'member'), 'index.php?m=member&c=index');
			} else {
				return true;
			}
		} else {
			//判断是否存在auth cookie
			if ($wycms_auth) {
				$auth_key = $auth_key = get_auth_key('login');
				list($userid, $password) = explode("\t", sys_auth($wycms_auth, 'DECODE', $auth_key));
				//验证用户，获取用户信息
				$this->memberinfo = $this->db->get_one(array('userid'=>$userid));
				//验证用户登录的是锁定 用户是否登录对应会员控制器
				if($this->memberinfo['islock'] || (ROUTE_C == 'lawyer' && $this->memberinfo['modelid'] != 12 && ROUTE_A !='logout') || (ROUTE_C == 'index' && $this->memberinfo['modelid'] != 10  && ROUTE_A !='logout')) exit('<h1>Bad Request!</h1>');
				//获取用户模型信息
				$this->db->set_model($this->memberinfo['modelid']);

				$this->_member_modelinfo = $this->db->get_one(array('userid'=>$userid));
				$this->_member_modelinfo = $this->_member_modelinfo ? $this->_member_modelinfo : array();
				$this->db->set_model();
				if(is_array($this->memberinfo)) {
					$this->memberinfo = array_merge($this->memberinfo, $this->_member_modelinfo);
				}
				
				if($this->memberinfo && $this->memberinfo['password'] === $password) {
					
					if (!defined('SITEID')) {
					   define('SITEID', $this->memberinfo['siteid']);
					}
					
					if($this->memberinfo['groupid'] == 1) {
						param::set_cookie('auth', '');
						param::set_cookie('_userid', '');
						param::set_cookie('_username', '');
						param::set_cookie('_groupid', '');
						showmessage(L('userid_banned_by_administrator', '', 'member'), 'index.php?m=member&c=index&a=login');
					} elseif($this->memberinfo['groupid'] == 7) {
						param::set_cookie('auth', '');
						param::set_cookie('_userid', '');
						param::set_cookie('_groupid', '');
						
						//设置当前登录待验证账号COOKIE，为重发邮件所用
						param::set_cookie('_regusername', $this->memberinfo['username']);
						param::set_cookie('_reguserid', $this->memberinfo['userid']);
						param::set_cookie('_reguseruid', $this->memberinfo['wyssouid']);
						
						param::set_cookie('email', $this->memberinfo['email']);
						showmessage(L('need_emial_authentication', '', 'member'), 'index.php?m=member&c=index&a=register&t=2');
					}
				} else {
					param::set_cookie('auth', '');
					param::set_cookie('_userid', '');
					param::set_cookie('_username', '');
					param::set_cookie('_groupid', '');
				}
				unset($userid, $password, $wycms_auth, $auth_key);
			} else {
				$forward= isset($_GET['forward']) ?  urlencode($_GET['forward']) : urlencode(get_url());
				showmessage(L('please_login', '', 'member'), 'index.php?m=member&c=index&a=login&forward='.$forward);
			}
		}
	}
	/**
	 * 
	 * IP禁止判断 ...
	 */
	final private function check_ip(){
		$this->ipbanned = wy_base::load_model('ipbanned_model');
		$this->ipbanned->check_ip();
 	}
	
}
