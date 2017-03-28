<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php $siteinfo = siteinfo(1);$info = string2array($siteinfo['infos']);?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title><?php echo $siteinfo['name'];?> - <?php echo L('member','','member').L('manage_center');?></title>
<script type="text/javascript" src="<?php echo JS_PATH;?>jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>member_common.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidatorregex.js" charset="UTF-8"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>dialog.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>fl880/jquery.SuperSlide.2.1.js"></script>
<link href="<?php echo CSS_PATH;?>table_form.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>dialog_simp.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>fl880/style.css" rel="stylesheet">
<script language="JavaScript">
<!--
$(function(){
    $.formValidator.initConfig({autotip:true,formid:"myform",onerror:function(msg){}});
	$("#username").formValidator({onshow:"<?php echo L('input').L('username');?>",onfocus:"<?php echo L('username').L('between_2_to_20');?>"}).inputValidator({min:2,max:20,onerror:"<?php echo L('username').L('between_2_to_20');?>"}).regexValidator({regexp:"ps_username",datatype:"enum",onerror:"<?php echo L('username').L('format_incorrect');?>"}).ajaxValidator({
	    type : "get",
		url : "",
		data :"m=member&c=index&a=public_checkname_ajax",
		datatype : "html",
		async:'false',
		success : function(data){
            if( data == "1" ) {
                return true;
			} else {
                return false;
			}
		},
		buttons: $("#dosubmit"),
		onerror : "<?php echo L('deny_register').L('or').L('user_already_exist');?>",
		onwait : "<?php echo L('connecting_please_wait');?>"
	});
	$("#password").formValidator({onshow:"<?php echo L('input').L('password');?>",onfocus:"<?php echo L('password').L('between_6_to_20');?>"}).inputValidator({min:6,max:20,onerror:"<?php echo L('password').L('between_6_to_20');?>"}).regexValidator({regexp:"password",datatype:"enum",onerror:"密码只能是数字,字母 和 -_()等字符"});
	$("#pwdconfirm").formValidator({onshow:"<?php echo L('input').L('cofirmpwd');?>",onfocus:"<?php echo L('passwords_not_match');?>",oncorrect:"<?php echo L('passwords_match');?>"}).compareValidator({desid:"password",operateor:"=",onerror:"<?php echo L('passwords_not_match');?>"});
	$("#email").formValidator({onshow:"<?php echo L('input').L('email');?>",onfocus:"<?php echo L('email').L('format_incorrect');?>",oncorrect:"<?php echo L('email').L('format_right');?>"}).inputValidator({min:7,max:32,onerror:"<?php echo L('email').L('between_7_to_32');?>"}).regexValidator({regexp:"email",datatype:"enum",onerror:"<?php echo L('email').L('format_incorrect');?>"}).ajaxValidator({
	    type : "get",
		url : "",
		data :"m=member&c=index&a=public_checkemail_ajax",
		datatype : "html",
		async:'false',
		success : function(data){	
            if( data == "1" ) {
                return true;
			} else {
                return false;
			}
		},
		buttons: $("#dosubmit"),
		onerror : "<?php echo L('deny_register').L('or').L('email_already_exist');?>",
		onwait : "<?php echo L('connecting_please_wait');?>"
	});

	$(":checkbox[name='protocol']").formValidator({tipid:"protocoltip",onshow:"<?php echo L('read_protocol');?>",onfocus:"<?php echo L('read_protocol');?>"}).inputValidator({min:1,onerror:"<?php echo L('read_protocol');?>"});
    $("#mobile").formValidator({onshow:"请输入手机号码",onfocus:"请输入手机号码"}).inputValidator({min:1,max:11,onerror:"请输入正确的手机号码"}).regexValidator({regexp:"mobile",datatype:"enum",onerror:"手机号码格式错误"});
    $("#lawyer_code").formValidator({onshow:"请填写执业证号",onfocus:"请填写执业证号"});
    $("#lawyer_room").formValidator({onshow:"请填写执业律所",onfocus:"请填写执业律所"});
    $("#address").formValidator({onshow:"请填写联系地址",onfocus:"请填写联系地址"});    $("#nickname").formValidator({onshow:"请填写真实姓名",onfocus:"请填写真实姓名"});
    $("#referrer").formValidator({ // 验证：发送时间
        onshow: "可不填",
        onfocus: "可不填"
    }).functionValidator({
        fun: function (val, elem) {
            if ($("#username").val() == val) {
                return "不能与用户名相同";
            }
            return true;
        }
    });
	<?php if(!isset($_GET['modelid']) && !isset($_GET['t']) && !empty($member_setting['showregprotocol'])) { ?>
		show_protocol();
	<?php } ?>
});

function show_protocol() {

	art.dialog({lock:false,title:'<?php echo L('register_protocol');?>',id:'protocoliframe', iframe:'?m=member&c=index&a=register&protocol=1',width:'500',height:'310',yesText:'<?php echo L('agree');?>'}, function(){
		$("#protocol").attr("checked",true);
	});
}
$(document).ready(function(){
    $("#agree").click(function(){
        $(".ag_con").fadeToggle(1000);
    });
});
//-->
</script>
</head>
<body>
<div id="inner" class="head" style="position: static; top: 0px;">
	<?php include template("content","top"); ?>
</div>
<div class="huiyuan">
	<div class="w1200 cl">
		<h3>会员注册</h3>
	</div>
</div>
<div class="body_bg">
	<div class="position1">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg" /></em><span>您现在的位置是：<a href="#">个人中心</a> > 会员注册</span>
		</div>
	</div>
	<div class="ly_conbg2 ">
	<?php if(!isset($_GET['t'])) { ?>
	<form method="post" action="" id="myform">
		<input type="hidden" name="siteid" value="<?php echo $siteid;?>" />
		<div>
			<div class="slideTxtBox1 fl">
				<div class="hd">
					<?php if($member_setting['choosemodel'] && count($modellist)>1) { ?>
					<!--是否开启选择会员模型选项-->
					<ul>
						<?php $n=1; if(is_array($modellist)) foreach($modellist AS $k => $v) { ?>
						<li data-modelid ="<?php echo $k;?>" onclick="changemodel($(this).data('modelid'))" <?php if($k==$modelid) { ?>class="on"<?php } ?>><?php echo $v['name'];?></li>
						<?php if($k==$modelid) { ?>
							<input name="modelid" type="hidden" value="<?php echo $k;?>"/>
						<?php } ?>
						<?php $n++;}unset($n); ?>
					</ul>
					<?php } else { ?>
					<?php $n=1; if(is_array($modellist)) foreach($modellist AS $k => $v) { ?>
						<input name="modelid" type="hidden" value="<?php echo $k;?>"/>
					<?php $n++;}unset($n); ?>
					<?php } ?>

				</div>
				<div class="bd">
					<ul>
						<li class="login cl">
							<div class="login_con1">
								<p class="input"><input type="text" class="text" id="username" name="username" placeholder="<?php echo L('username');?>：" value=""></p>
								<p class="input"><input type="password" class="text"  id="password"  name="password" placeholder="<?php echo L('password');?>：" value=""></p>
								<p class="input"><input type="password" class="text"  id="pwdconfirm" placeholder="<?php echo L('cofirmpwd');?>：" value=""></p>
								<p class="input"><input type="text" class="text" id="email"  name="email"  placeholder="<?php echo L('email');?>：" value=""></p>
								<p class="input"><input type="text" class=text id="mobile" name="mobile"  placeholder="手机号码：" value="" ></p>
								<p class="input"><input type="text" id="nickname" name="nickname" placeholder="真实姓名：" class="text"></p>

								<?php if($member_setting['choosemodel']) { ?>
								<!--是否开启选择会员模型选项-->
								<script language="JavaScript">
                                    <!--
                                    function changemodel(modelid) {
                                        redirect('<?php echo APP_PATH;?>index.php?m=member&c=index&a=register&modelid='+modelid+'&siteid=<?php echo $siteid;?>');
                                    }
                                    //-->
								</script>
								<?php $n=1; if(is_array($forminfos)) foreach($forminfos AS $k => $v) { ?>
								<p><?php if($v['isbase']) { ?><font color=red>*</font><?php } ?><?php echo $v['form'];?></p>
								<?php $n++;}unset($n); ?>
								<?php } ?>
								<?php if($member_setting['enablcodecheck']=='1' && $sms_setting['sms_enable']!='1') { ?>
								<p class="input"><input type="text" id="code" name="code" size="10" class="code fl" placeholder="<?php echo L('checkcode');?>："><?php echo form::checkcode('code_img', '4', '27', 120, 90);?></p>
								<?php } ?>
								<p><input type="checkbox" name="protocol" id="protocol" class="check">
									<a id="agree" href="javascript:void(0);" >我同意注册须知</a>
								<div class="ag_con" style="display: none;">
									<h3>注册须知内容为：</h3>
									1、申请人需年满16周岁；<br>
									2、申请人具有完全民事行为 能力；<br>
									3、申请人有法律服务需求；<br>
									4、申请人为人诚信。
								</div>
								</p>
								<p class="reg">
									<div class="submit"><input type="submit" name="dosubmit" value="<?php echo L('agree_protocol_post');?>" class="button"></div><br />
								</p>
							</div>

						</li>

					</ul>
				</div>
			</div>
			<div class="login_img1 fr">
				<img src="<?php echo IMG_PATH;?>fl880/login_bg.png">
			</div>
		</div>
	</form>
	<?php } elseif (isset($_GET['t']) && $_GET['t']==3) { ?>
		<div class="lawyer_conbg w1200">
			<h4><?php echo param::get_cookie('_username');?> <?php echo 您好！非常感谢您注册成为本网的律师会员，注册结果请等待管理员审核。（审核结果将会发送到您注册是填写的邮箱）;?></h4>
		</div>

	<?php } else { ?>
		<script language="JavaScript">
            <!--
            redirect("<?php echo APP_PATH;?>index.php?m=member&c=index&a=login");
            //-->
		</script>
	<?php } ?>
	</div>
<?php include template('member', 'footer'); ?>
