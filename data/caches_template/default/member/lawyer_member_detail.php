<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&c=lawyer&siteid=1">个人中心</a> &gt; 会员详情</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'lawyer_left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'lawyer_right_top'); ?>
			<div class="hy_rcon">
				<div class="rcon_top">
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=4e49f8303921adfd6d4d15b9255c2fc4&sql=select+%2A+from+wy_member_detail+where+userid+%3D+%27%24member_detail%5Buserid%5D%27&num=1&return=m_detail\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_member_detail where userid = '$member_detail[userid]' LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$m_detail = $a;unset($a);?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
					<p>姓名：<?php echo $member_detail['nickname'];?></p>
					<p> 手机号码：<?php echo $member_detail['mobile'];?></p>
					<p> 积分：<?php echo $member_detail['point'];?>分</p>
					<p> 地址：<?php echo $m_detail['0']['address'];?></p>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include template('member', 'footer'); ?>