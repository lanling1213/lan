<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 会员中心</span>
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
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=e36806bfb7674c6c8e5ce175a5c30bf4&sql=SELECT+%2A+FROM+wy_ask_question+where+memberid+%3D+%24memberinfo%5Buserid%5D+and+siteid+%3D+1+and+typeid+%21%3D+2+and+status+%3D+1+order+by+inputtime+desc&page=%24_GET%5Bpage%5D&num=10&return=datas\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 10;$page = intval($_GET[page]) ? intval($_GET[page]) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (SELECT * FROM wy_ask_question where memberid = $memberinfo[userid] and siteid = 1 and typeid != 2 and status = 1 order by inputtime desc) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("SELECT * FROM wy_ask_question where memberid = $memberinfo[userid] and siteid = 1 and typeid != 2 and status = 1 order by inputtime desc LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$datas = $a;unset($a);?>
						<?php $n=1;if(is_array($datas)) foreach($datas AS $a) { ?>
							<li><span><?php echo date('Y-m-d',$a['inputtime']);?></span><a href="index.php?m=member&c=index&a=account_ask_detail&t=1&qid=<?php echo $a['questionid'];?>"><?php if($a[replytime]) { ?>[已回复]<?php } else { ?>[未回复]<?php } ?><?php echo str_cut($a[content],90);?></a></li>
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
