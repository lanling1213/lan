<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php $siteinfo = siteinfo(1);$info = string2array($siteinfo['infos']);?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title><?php echo $siteinfo['name'];?> - <?php echo L('member','','member').L('manage_center');?></title>
<script type="text/javascript" src="<?php echo JS_PATH;?>jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>member_common.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidatorregex.js" charset="UTF-8"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>dialog.js"></script>
<link href="<?php echo CSS_PATH;?>table_form.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>fl880/style.css" rel="stylesheet">
<script language="JavaScript">
<!--
$(function(){
	$.formValidator.initConfig({autotip:true,formid:"myform",onerror:function(msg){}});
	$("#email").formValidator({onshow:"<?php echo L('input').L('email');?>",onfocus:"<?php echo L('email').L('format_incorrect');?>",oncorrect:"<?php echo L('email').L('format_right');?>"}).inputValidator({min:2,max:32,onerror:"<?php echo L('email').L('between_2_to_32');?>"}).regexValidator({regexp:"email",datatype:"enum",onerror:"<?php echo L('email').L('format_incorrect');?>"});
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
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="#">个人中心</a> &gt; 找回密码</span>
		</div>
		<form method="post" action="" id="myform">
		<div class="ly_conbg ">
			<div class="w1200">
				<h3>找回密码</h3>
			</div>
			<?php if($_GET[type] == 3) { ?>
			<div class="lawyer_conbg w1200">
				<h4>密码找回信息已发送到您的邮箱，请登录邮箱查收</h4>
			</div>
			<?php } else { ?>
			<div class="lawyer_conbg w1200">
				<h4>找回密码</h4>
				<p><input type="text " id="email" name="email"  class="text"  placeholder="<?php echo L('input').L('email');?>："></p>
				<p><input type="text" id="code" name="code"  class="text code fl" placeholder="<?php echo L('checkcode');?>：">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo form::checkcode('code_img', '4', '20', 120, 90);?></p>
				<p class="submit"><input type="submit" name="dosubmit" value="找回密码" class="button"></p>
			</div>
			<?php } ?>
		</div>

		</form>
	</div>
</div>
<?php include template('member', 'footer'); ?>
