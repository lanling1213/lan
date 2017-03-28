<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 专属律师</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'right_top'); ?>
			<div class="zx_hy">
				<ul>
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=3e39e0c01df5e7bb9112ce23672347f5&sql=select+%2A+from+wy_member+where+modelid+%3D+12+and+siteid+%3D+1&num=10&page=%24_GET%5Bpage%5D&return=lawyer\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 10;$page = intval($_GET[page]) ? intval($_GET[page]) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (select * from wy_member where modelid = 12 and siteid = 1) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("select * from wy_member where modelid = 12 and siteid = 1 LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$lawyer = $a;unset($a);?>
						<?php $n=1;if(is_array($lawyer)) foreach($lawyer AS $l) { ?>
						<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=fce41272b21cee993a2290d9933cc00e&sql=select+major+from+wy_member_lawyer+where+userid+%3D+%24l%5Buserid%5D&num=1&return=lawyer_detail\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select major from wy_member_lawyer where userid = $l[userid] LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$lawyer_detail = $a;unset($a);?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
						<li class="cl">
							<div class="hy_left fl">
								<img src="<?php echo get_memberavatar($l[userid],1,45);?>" onerror="this.src='<?php echo IMG_PATH;?>fl880/hy_img1.jpg'">
								<p><?php echo $l['nickname'];?>律师</p>
							</div>
							<div class="hy_mid fl">
								<p>专业：<?php echo $lawyer_detail['0']['major'];?><br>
									手机号码：<?php echo $l['mobile'];?></p>
								<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=0ed6f731997ae345fec0eb4c5d982058&sql=select+content%2Cquestionid%2Cinputtime%2Creplytime+from+wy_ask_question+where+userid+%3D+%24l%5Buserid%5D+and+typeid+%3D+2+and+status+%3D+1+order+by+inputtime+desc&num=50&return=ask\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select content,questionid,inputtime,replytime from wy_ask_question where userid = $l[userid] and typeid = 2 and status = 1 order by inputtime desc LIMIT 50");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$ask = $a;unset($a);?>
								<?php $n=1;if(is_array($ask)) foreach($ask AS $a) { ?>
								<ul>
									<li>
									<span>
									 <em class="fr"> <?php echo date('Y-m-d',$a[inputtime]);?></em>     <a href="index.php?m=member&c=index&a=account_ask_detail&qid=<?php echo $a['questionid'];?>&uid=<?php echo $l['userid'];?>&t=2"> <?php if($a[replytime]) { ?>[已回复]<?php } else { ?>[未回复]<?php } ?><?php echo str_cut($a[content],90);?></a>
									</span>
									</li>
								</ul>
								<?php $n++;}unset($n); ?>
								<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
							</div>
							<div class="hy_right1 fr">
								<button class="zixun" onclick="window.location.href='index.php?m=member&c=index&a=account_ask_detail&uid=<?php echo $l['userid'];?>&t=2'">咨询提问</button>
							</div>
						</li>
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