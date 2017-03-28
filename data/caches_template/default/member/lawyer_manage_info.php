<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidatorregex.js" charset="UTF-8"></script>
<link href="<?php echo CSS_PATH;?>dialog.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH;?>dialog.js"></script>
<script language="JavaScript">
<!--
$(function(){
	$.formValidator.initConfig({autotip:true,formid:"myform",onerror:function(msg){}});
	$("#nickname").formValidator({onshow:"<?php echo L('input').L('nickname');?>",onfocus:"<?php echo L('nickname').L('between_2_to_20');?>"}).inputValidator({min:2,max:20,onerror:"<?php echo L('nickname').L('between_2_to_20');?>"}).regexValidator({regexp:"ps_username",datatype:"enum",onerror:"<?php echo L('nickname').L('format_incorrect');?>"});
    $("#mobile").formValidator({onshow:"请输入手机号码",onfocus:"请输入手机号码"}).inputValidator({min:1,max:11,onerror:"请输入正确的手机号码"}).regexValidator({regexp:"mobile",datatype:"enum",onerror:"手机号码格式错误"});
    $("#email").formValidator({oncorrect:"<?php echo L('email').L('format_right');?>"}).inputValidator({min:7,max:32,onerror:"<?php echo L('email').L('between_7_to_32');?>"}).regexValidator({regexp:"email",datatype:"enum",onerror:"<?php echo L('email').L('format_incorrect');?>"});

   });
//-->
</script>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 修改个人资料</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'lawyer_left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'lawyer_right_top'); ?>
			<form method="post" action="" id="myform" name="myform">
			<div class="hy_rcon1">
				<p class="hy_xg"><em class="xg_left fl">用户名 ： </em><input  type="text" value="<?php echo $memberinfo['username'];?>" class=" text" disabled></p>
				<p class="hy_xg"><em class="xg_left fl">真实姓名 ： </em><input  name="nickname" type="text" id="nickname" value="<?php echo $memberinfo['nickname'];?>" class=" text"></p>
				<p class="hy_xg"><em class="xg_left fl">邮箱 ： </em><input type="text" id="email" name="email" value="<?php echo $memberinfo['email'];?>" class=" text"></p>
				<p class="hy_xg"><em class="xg_left fl">手机号 ： </em><input type="text" id="mobile" name="mobile" value="<?php echo $memberinfo['mobile'];?>" class=" text"></p>
				<p class="hy_xg"><em class="xg_left fl">执业律所 ： </em><input type="text" id="lawyer_room" name="info[lawyer_room]" value="<?php echo $memberinfo['lawyer_room'];?>" class=" text"></p>
				<p class="hy_xg"><em class="xg_left fl">专业 ： </em><input type="text" id="major" name="info[major]" value="<?php echo $memberinfo['major'];?>" class=" text"></p>
				<p class="hy_xg"><em class="xg_left fl">所在地区 ： </em><input type="text" id="address" name="info[address]"   value="<?php echo $memberinfo['address'];?>" class=" text"></p>
				<p class="hy_xg"><em class="xg_left fl"></em><input name="dosubmit" type="submit" id="dosubmit" value="确认修改" class=" button"></p>
			</div>
			</form>
		</div>
	</div>
</div>
<?php include template('member', 'footer'); ?>