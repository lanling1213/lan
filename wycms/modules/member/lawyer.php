<?php
/**
 * 会员前台管理中心、账号管理、收藏操作类
 */

defined('IN_WYCMS') or exit('No permission resources.');
wy_base::load_app_class('foreground');
wy_base::load_sys_class('format', '', 0);
wy_base::load_sys_class('form', '', 0);

class lawyer extends foreground
{

    private $times_db;

    function __construct()
    {
        parent::__construct();
        $this->http_user_agent = $_SERVER['HTTP_USER_AGENT'];
    }

    public function init()
    {
        $memberinfo = $this->memberinfo;

        //初始化wysso
        $wysso_api_url = $this->_init_wysso();
        //获取头像数组
        $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);

        $grouplist = getcache('grouplist');
        $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
        include template('member', 'lawyer_index');
    }

    /*
     * 测试邮件配置
     */
    public function send_newmail()
    {
        $_username = param::get_cookie('_regusername');
        $_userid = param::get_cookie('_reguserid');
        $_ssouid = param::get_cookie('_reguseruid');
        $newemail = $_GET['newemail'];

        if ($newemail == '' || !is_email($newemail)) {//邮箱为空，直接返回错误
            return '2';
        }
        //验证userid和username是否匹配
        $r = $this->db->get_one(array('userid' => intval($_userid)));
        if ($r[username] != $_username) {
            return '2';
        }

        $this->_init_wysso();
        $status = $this->client->ps_checkemail($newemail);
        if ($status == '-5') {//邮箱被占用
            exit('-1');
        }
        if ($status == -1) {
            $status = $this->client->ps_get_member_info($newemail, 3);
            if ($status) {
                $status = unserialize($status);    //接口返回序列化，进行判断
                if (!isset($status['uid']) || $status['uid'] != intval($_ssouid)) {
                    exit('-1');
                }
            } else {
                exit('-1');
            }
        }
        //验证邮箱格式
        wy_base::load_sys_func('mail');
        $code = sys_auth($_userid.'|'.microtime(true), 'ENCODE', get_auth_key('email'));
        $url = APP_PATH."index.php?m=member&c=index&a=register&code=$code&verify=1";

        //读取配置获取验证信息
        $member_setting = getcache('member_setting');
        $message = $member_setting['registerverifymessage'];
        $message = str_replace(array('{click}', '{url}', '{username}', '{email}', '{password}'), array('<a href="'.$url.'">'.L('please_click').'</a>', $url, $_username, $newemail, $password), $message);

        if (sendmail($newemail, L('reg_verify_email'), $message)) {
            //更新新的邮箱，用来验证
            $this->db->update(array('email' => $newemail), array('userid' => $_userid));
            $this->client->ps_member_edit($_username, $newemail, '', '', $_ssouid);
            $return = '1';
        } else {
            $return = '2';
        }
        echo $return;
    }

    public function lawyer_manage_avatar()
    {
        $memberinfo = $this->memberinfo;

        //初始化wysso
        $wysso_api_url = $this->_init_wysso();
        $ps_auth_key = wy_base::load_config('system', 'wysso_auth_key');
        $auth_data = $this->client->auth_data(array('uid' => $this->memberinfo['wyssouid'], 'sys_auth_time' => microtime(true)), '', $ps_auth_key);
        $upurl = base64_encode($wysso_api_url.'/index.php?m=wysso&c=index&a=uploadavatar&auth_data='.$auth_data);
        //获取头像数组
        $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);
        $grouplist = getcache('grouplist');
        $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
        include template('member', 'lawyer_manage_avatar');
    }

    public function lawyer_manage_info()
    {
        if (isset($_POST['dosubmit'])) {
            //更新用户昵称
            $nickname = isset($_POST['nickname']) && is_username(trim($_POST['nickname'])) ? trim($_POST['nickname']) : '';
            $email = isset($_POST['email']) && trim($_POST['email']) ? trim($_POST['email']) : '';
            $mobile = isset($_POST['mobile']) && trim($_POST['mobile']) ? trim($_POST['mobile']) : '';

            $nickname = safe_replace($nickname);
            if ($nickname) {
                $this->db->update(array('nickname' => $nickname, 'email' => $email, 'mobile' => $mobile), array('userid' => $this->memberinfo['userid']));
                if (!isset($cookietime)) {
                    $get_cookietime = param::get_cookie('cookietime');
                }
                $_cookietime = $cookietime ? intval($cookietime) : ($get_cookietime ? $get_cookietime : 0);
                $cookietime = $_cookietime ? TIME + $_cookietime : 0;
                param::set_cookie('_nickname', $nickname, $cookietime);
            }
            require_once CACHE_MODEL_PATH.'member_input.class.php';
            require_once CACHE_MODEL_PATH.'member_update.class.php';
            $member_input = new member_input($this->memberinfo['modelid']);
            $modelinfo = $member_input->get($_POST['info']);

            $this->db->set_model($this->memberinfo['modelid']);
            $membermodelinfo = $this->db->get_one(array('userid' => $this->memberinfo['userid']));
            if (!empty($membermodelinfo)) {
                $this->db->update($modelinfo, array('userid' => $this->memberinfo['userid']));
            } else {
                $modelinfo['userid'] = $this->memberinfo['userid'];
                $this->db->insert($modelinfo);
            }

            showmessage(L('operation_success'), HTTP_REFERER);
        } else {
            $memberinfo = $this->memberinfo;
            //获取会员模型表单
            require CACHE_MODEL_PATH.'member_form.class.php';
            $member_form = new member_form($this->memberinfo['modelid']);
            $this->db->set_model($this->memberinfo['modelid']);

            $membermodelinfo = $this->db->get_one(array('userid' => $this->memberinfo['userid']));
            $forminfos = $forminfos_arr = $member_form->get($membermodelinfo);
            $grouplist = getcache('grouplist');
            $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
            //初始化wysso
            $wysso_api_url = $this->_init_wysso();
            //获取头像数组
            $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);
            //万能字段过滤
            foreach ($forminfos as $field => $info) {
                if ($info['isomnipotent']) {
                    unset($forminfos[$field]);
                } else {
                    if ($info['formtype'] == 'omnipotent') {
                        foreach ($forminfos_arr as $_fm => $_fm_value) {
                            if ($_fm_value['isomnipotent']) {
                                $info['form'] = str_replace('{'.$_fm.'}', $_fm_value['form'], $info['form']);
                            }
                        }
                        $forminfos[$field]['form'] = $info['form'];
                    }
                }
            }

            $formValidator = $member_form->formValidator;

            include template('member', 'lawyer_manage_info');
        }
    }

    public function lawyer_manage_password()
    {
        if (isset($_POST['dosubmit'])) {
            $updateinfo = array();
            if (!is_password($_POST['info']['password'])) {
                showmessage(L('password_format_incorrect'), HTTP_REFERER);
            }
            if ($this->memberinfo['password'] != password($_POST['info']['password'], $this->memberinfo['encrypt'])) {
                showmessage(L('old_password_incorrect'), HTTP_REFERER);
            }

            //修改会员邮箱
            if ($this->memberinfo['email'] != $_POST['info']['email'] && is_email($_POST['info']['email'])) {
                $email = $_POST['info']['email'];
                $updateinfo['email'] = $_POST['info']['email'];
            } else {
                $email = '';
            }
            if (!is_password($_POST['info']['newpassword']) || is_badword($_POST['info']['newpassword'])) {
                showmessage(L('password_format_incorrect'), HTTP_REFERER);
            }
            $newpassword = password($_POST['info']['newpassword'], $this->memberinfo['encrypt']);
            $updateinfo['password'] = $newpassword;

            $this->db->update($updateinfo, array('userid' => $this->memberinfo['userid']));
            if (wy_base::load_config('system', 'wysso')) {
                //初始化wysso
                $this->_init_wysso();
                $res = $this->client->ps_member_edit('', $email, $_POST['info']['password'], $_POST['info']['newpassword'], $this->memberinfo['wyssouid'], $this->memberinfo['encrypt']);
                $message_error = array('-1' => L('user_not_exist'), '-2' => L('old_password_incorrect'), '-3' => L('email_already_exist'), '-4' => L('email_error'), '-5' => L('param_error'));
                if ($res < 0) showmessage($message_error[$res]);
            }

            showmessage(L('operation_success'), HTTP_REFERER);
        } else {
            $show_validator = true;
            $memberinfo = $this->memberinfo;
            $grouplist = getcache('grouplist');
            $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
            //初始化wysso
            $wysso_api_url = $this->_init_wysso();
            //获取头像数组
            $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);

            include template('member', 'lawyer_manage_password');
        }
    }

    /**
     * 初始化wysso
     * about wysso, include client and client configure
     *
     * @return string wysso_api_url wysso地址
     */
    private function _init_wysso()
    {
        wy_base::load_app_class('client', '', 0);
        define('APPID', wy_base::load_config('system', 'wysso_appid'));
        $wysso_api_url = wy_base::load_config('system', 'wysso_api_url');
        $wysso_auth_key = wy_base::load_config('system', 'wysso_auth_key');
        $this->client = new client($wysso_api_url, $wysso_auth_key);

        return $wysso_api_url;
    }

    protected function _checkname($username)
    {
        $username = trim($username);
        if ($this->db->get_one(array('username' => $username))) {
            return false;
        }

        return true;
    }

    private function _session_start()
    {
        $session_storage = 'session_'.wy_base::load_config('system', 'session_storage');
        wy_base::load_sys_class($session_storage);
    }

    /**
     * 成为高级会员的条件
     */
    public function account_manage_vip()
    {
        $memberinfo = $this->memberinfo;

        //初始化wysso
        $wysso_api_url = $this->_init_wysso();
        //获取头像数组
        $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);
        $grouplist = getcache('grouplist');
        $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
        include template('member', 'account_manage_vip');
    }

    /**
     * 网站会员信息
     */
    public function lawyer_member_list()
    {
        $memberinfo = $this->memberinfo;

        //初始化wysso
        $wysso_api_url = $this->_init_wysso();
        //获取头像数组
        $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);
        $grouplist = getcache('grouplist');
        $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
        include template('member', 'lawyer_member_list');
    }

    /**
     * 咨询详情
     */
    public function lawyer_ask_detail()
    {
        $questionid = intval($_GET['qid']);
        if (empty($questionid)) {
            showmessage("数据错误");
        }
        $ask_question = wy_base::load_model('ask_question_model');
        $where = "`questionid`='$questionid'";
        $ask = $ask_question->get_one($where, '*');
        if ($ask) {
            $ask_reply = wy_base::load_model('ask_reply_model');
            $reply = $ask_reply->select(array('questionid' => $questionid));
            $lawyer = wy_base::load_model('member_model');
            foreach ($reply as $k => $r) {
                $where = "`userid` = '$r[memberid]'";
                $member = $lawyer->get_one($where, 'nickname');
                $reply[$k]['lawyer_name'] = $member['nickname'];
            }
        }
        $memberinfo = $this->memberinfo;
        //初始化wysso
        $wysso_api_url = $this->_init_wysso();
        //获取头像数组
        $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);
        $grouplist = getcache('grouplist');
        $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
        include template('member', 'lawyer_ask_detail');
    }

    /**
     * 律师会员详情
     */
    public function lawyer_member_detail()
    {
        $uid = intval($_GET['uid']);
        if (empty($uid)) {
            showmessage("数据错误");
        }

        $member_model = wy_base::load_model('member_model');
        $where = "`userid`='$uid' and modelid !=12";
        $member_detail = $member_model->get_one($where, '*');

        $memberinfo = $this->memberinfo;
        //初始化wysso
        $wysso_api_url = $this->_init_wysso();
        //获取头像数组
        $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);
        $grouplist = getcache('grouplist');
        $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
        include template('member', 'lawyer_member_detail');
    }

    /**
     * 律师专属会员
     */
    public function lawyer_exclusive_member()
    {
        $memberinfo = $this->memberinfo;
        //初始化wysso
        $wysso_api_url = $this->_init_wysso();
        //获取头像数组
        $avatar = $this->client->ps_getavatar($this->memberinfo['wyssouid']);
        $grouplist = getcache('grouplist');
        $memberinfo['groupname'] = $grouplist[$memberinfo[groupid]]['name'];
        include template('member', 'lawyer_exclusive_member');
    }
}

?>
