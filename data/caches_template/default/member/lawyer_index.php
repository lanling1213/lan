<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&c=lawyer&siteid=1">个人中心</a> &gt; 会员中心</span>
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
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=d328b783c7a82cf1e7f6121af556b137&sql=select+%2A+from+wy_ask_question+where+typeid+%21%3D2+and+siteid+%3D+1+and+status+%3D+1&num=10&page=%24_GET%5Bpage%5D&return=law\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 10;$page = intval($_GET[page]) ? intval($_GET[page]) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (select * from wy_ask_question where typeid !=2 and siteid = 1 and status = 1) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("select * from wy_ask_question where typeid !=2 and siteid = 1 and status = 1 LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$law = $a;unset($a);?>
						<?php $n=1;if(is_array($law)) foreach($law AS $l) { ?>
						<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=e017123449f5440c6307d45bb68a870c&sql=select+typename+from+wy_ask_type+where+typeid+%3D+%24l%5Btypeid%5D&num=1&return=type\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select typename from wy_ask_type where typeid = $l[typeid] LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$type = $a;unset($a);?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
							<li><span><?php echo date('Y-m-d',$l['inputtime']);?></span><a href="<?php echo APP_PATH;?>index.php?m=member&c=lawyer&a=lawyer_ask_detail&qid=<?php echo $l['questionid'];?>&t=1">[<?php echo $type['0']['typename'];?>]<?php echo str_cut($l[content],90);?></a></li>
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
<script type="text/javascript" src="<?php echo JS_PATH;?>cookie.js"></script>
<script language="JavaScript">
<!--
$(document).ready(function() {
	var announcement = getcookie('announcement_<?php echo $memberinfo['userid'];?>_<?php echo $announceid;?>');
	if(announcement==null || announcement=='') {
		$("#announcement").fadeIn("slow");
	}
});
//-->
</script>
<?php include template('member', 'footer'); ?>
