<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 修改密码</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'right_top'); ?>
			<form method="post" action="" id="myform" name="myform">
			<div class="hy_rcon1">
				<p class="hy_xg"><em class="xg_left fl">旧密码 ： </em><input name="info[password]" type="password" id="password" size="30"class="text"></p>
				<p class="hy_xg"><em class="xg_left fl">新密码 ： </em><input  name="info[newpassword]" type="password" id="newpassword"  class="text"></p>
				<p class="hy_xg"><em class="xg_left fl">确认密码 ： </em><input name="info[renewpassword]" type="password" id="renewpassword" class="text"></p>
				<p class="hy_xg"><em class="xg_left fl"></em><input name="dosubmit" type="submit" id="dosubmit"  value="确认修改" class="button"></p>
			</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
<!--
$(function(){
	$.formValidator.initConfig({autotip:true,formid:"myform",onerror:function(msg){}});
	$("#password").formValidator({onshow:"<?php echo L('input').L('password');?>",onfocus:"<?php echo L('password').L('between_6_to_20');?>"}).inputValidator({min:6,max:20,onerror:"<?php echo L('password').L('between_6_to_20');?>"});
	$("#newpassword").formValidator({onshow:"<?php echo L('input').L('password');?>",onfocus:"<?php echo L('password').L('between_6_to_20');?>"}).inputValidator({min:6,max:20,onerror:"<?php echo L('password').L('between_6_to_20');?>"}).regexValidator({regexp:"password",datatype:"enum",onerror:"密码只能是数字,字母 和 -_()等字符"});
	$("#renewpassword").formValidator({onshow:"<?php echo L('input').L('cofirmpwd');?>",onfocus:"<?php echo L('input').L('passwords_not_match');?>",oncorrect:"<?php echo L('passwords_match');?>"}).compareValidator({desid:"newpassword",operateor:"=",onerror:"<?php echo L('input').L('passwords_not_match');?>"});
})
//-->
</script>
<?php include template('member', 'footer'); ?>