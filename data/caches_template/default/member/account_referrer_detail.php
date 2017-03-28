<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 推荐人详情</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'right_top'); ?>
			<div class="hy_rcon">
				<div class="rcon_top">
					<p>姓名：<?php echo $referrer_detail['nickname'];?></p>
					<p> 手机号码：<?php echo $referrer_detail['mobile'];?></p>
					<p> 积分：<?php echo $referrer_detail['point'];?>分</p>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include template('member', 'footer'); ?>