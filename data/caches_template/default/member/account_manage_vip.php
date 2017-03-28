<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 成为律师盾会员</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'right_top'); ?>
			<div class="hy_rcon1">
				<p class="hy_style">高级会员享受专属律师<b>一对一法律咨询</b> <br>
					成为高级会员条件：积分达到<a href="#"> 300积分 </a>可以自动升级为高级会员<br>
					（若没升级，请通过右边“律师在线”里面的QQ联系管理员升级）<br>
					<em class="tj_font"> 1、推荐用户注册也可获得<br>
						2、在本网站办理过案件并交纳费用也可获得 （需要通过“律师在线”里面的QQ联系管理员获得）
					</em>
				</p>
			</div>
		</div>
	</div>
</div>
<?php include template('member', 'footer'); ?>