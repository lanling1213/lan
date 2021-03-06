<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php $siteinfo = siteinfo(1);$info = string2array($siteinfo['infos']);?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title><?php echo $siteinfo['name'];?> - <?php echo L('member','','member').L('manage_center');?></title>
<link href="<?php echo CSS_PATH;?>reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>table_form.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo JS_PATH;?>jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>cookie.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>member_common.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>dialog.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidatorregex.js" charset="UTF-8"></script>
<link href="<?php echo CSS_PATH;?>fl880/style.css" rel="stylesheet">
<script language="JavaScript">
<!--
$(function(){
	$.formValidator.initConfig({autotip:true,formid:"myform",onerror:function(msg){}});
	$("#username").formValidator({onshow:"<?php echo L('input').L('username');?>",onfocus:"<?php echo L('between_2_to_20');?>"}).inputValidator({min:2,max:20,onerror:"<?php echo L('between_2_to_20');?>"}).regexValidator({regexp:"ps_username",datatype:"enum",onerror:"<?php echo L('username').L('format_incorrect');?>"});
	$("#password").formValidator({onshow:"<?php echo L('input').L('password');?>",onfocus:"<?php echo L('password').L('between_6_to_20');?>"}).inputValidator({min:6,max:20,onerror:"<?php echo L('password').L('between_6_to_20');?>"});

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
		<h3>会员中心</h3>
	</div>
</div>
<div class="body_bg">
	<div class="position1">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="#">会员中心</a> &gt; 会员登录</span>
		</div>
	</div>

	<div class="ly_conbg2 ">
		<div class="w1200">
			<div class="slideTxtBox1 fl">
				<div class="hd">
					<ul><li class="on"><?php echo L('member').L('login');?></li></ul>
				</div>
				<form method="post" action="" onsubmit="save_username();" id="myform" name="myform">
				<div class="bd">
					<ul>
						<li class="login cl">
							<div class="login_con">
								<p class="input"><input type="text" class="text" placeholder="<?php echo L('username');?>：" id="username" name="username" ></p>
								<p class="input"><input type="password" class="text" placeholder="<?php echo L('password');?>：" id="password" name="password"></p>
								<p class="submit" ><button type="submit" class="button" name="dosubmit" id="dosubmit"  value="">立即登录</button></p>
							</div>
							<a class="login_link" href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=register&siteid=<?php echo $siteid;?>&modelid=10"><em><img src="<?php echo IMG_PATH;?>fl880/login_icon.png"> </em>用户注册</a>
							<a class="login_link" href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=register&siteid=<?php echo $siteid;?>&modelid=12"><em><img src="<?php echo IMG_PATH;?>fl880/login_icon1.png"> </em>律师注册</a>
							<a class="login_link" href="index.php?m=member&c=index&a=public_forget_password&siteid=<?php echo $siteid;?>"><em><img src="<?php echo IMG_PATH;?>fl880/login_icon2.png"> </em>忘记密码</a>
						</li>
					</ul>
				</div>
				</form>
			</div>
			<div class="login_img fr">
				<img src="<?php echo IMG_PATH;?>fl880/login_bg.png">
			</div>
		</div>
	</div>
	<div class="space">
	</div>
</div>
<?php include template('member', 'footer'); ?>
