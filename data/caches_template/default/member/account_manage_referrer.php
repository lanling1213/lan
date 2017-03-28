<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 我推荐的人</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'right_top'); ?>
			<div class="hy_rcon">
				<ul>
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=83796cd7a57fa9fe36ac214f12fe68b0&sql=select+%2A+from+wy_member_detail+md+left+join+wy_member+m+on+md.userid+%3D+m.userid+where+md.referrer+%3D+%27%24memberinfo%5Busername%5D%27&num=20\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_member_detail md left join wy_member m on md.userid = m.userid where md.referrer = '$memberinfo[username]' LIMIT 20");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
						<?php $n=1;if(is_array($data)) foreach($data AS $a) { ?>
							<li><span><?php echo date('Y-m-d',$a['inputtime']);?></span><a href="index.php?m=member&c=index&a=account_referrer_detail&t=1&rid=<?php echo $a['userid'];?>"><?php echo $a['username'];?></a></li>
						<?php $n++;}unset($n); ?>
					<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
				</ul>
			</div>

		</div>
	</div>
</div>
<?php include template('member', 'footer'); ?>