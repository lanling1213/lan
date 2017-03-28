<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&c=lawyer&siteid=1">个人中心</a> &gt; 会员信息</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'lawyer_left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'lawyer_right_top'); ?>
			<div class="hy_rcon">
				<ul>
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=f9d24061facfcef20313fb042ad898d3&sql=select+userid%2Cregdate%2Cnickname%2Cgroupid+from+wy_member++where+modelid+%3D+10+order+by+userid+desc&num=10&page=%24_GET%5Bpage%5D&return=member\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 10;$page = intval($_GET[page]) ? intval($_GET[page]) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (select userid,regdate,nickname,groupid from wy_member  where modelid = 10 order by userid desc) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("select userid,regdate,nickname,groupid from wy_member  where modelid = 10 order by userid desc LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$member = $a;unset($a);?>
						<?php $n=1;if(is_array($member)) foreach($member AS $m) { ?>
							<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=e8a2c8ec08aae5a644932e0745a3c9ec&sql=select+name+from+wy_member_group+where+groupid+%3D+%24m%5Bgroupid%5D&num=1&return=group\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select name from wy_member_group where groupid = $m[groupid] LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$group = $a;unset($a);?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
							<li><span><?php echo date('Y-m-d',$m[regdate]);?></span><a href="<?php echo APP_PATH;?>index.php?m=member&c=lawyer&a=lawyer_member_detail&uid=<?php echo $m['userid'];?>&t=1"><?php echo $group['0']['name'];?>-<?php echo $m['nickname'];?></a></li>
						<?php $n++;}unset($n); ?>
					<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
				</ul>
				<div class="page">
					<?php echo $pages;?>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include template('member', 'footer'); ?>