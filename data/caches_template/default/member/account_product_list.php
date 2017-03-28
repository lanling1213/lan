<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 我的商品</span>
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
					<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=98c0a1d74594574d4881fb3d878deab2&sql=select+%2A+from+wy_pay_spend+where+userid+%3D+%24memberinfo%5Buserid%5D&num=10&page=%24_GET%5Bpage%5D&return=spend\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$pagesize = 10;$page = intval($_GET[page]) ? intval($_GET[page]) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$r = $get_db->sql_query("SELECT COUNT(*) as count FROM (select * from wy_pay_spend where userid = $memberinfo[userid]) T");$s = $get_db->fetch_next();$pages=pages($s['count'], $page, $pagesize, $urlrule);$r = $get_db->sql_query("select * from wy_pay_spend where userid = $memberinfo[userid] LIMIT $offset,$pagesize");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$spend = $a;unset($a);?>
						<?php $n=1;if(is_array($spend)) foreach($spend AS $s) { ?>
							<li><span><?php echo date('Y-m-d',$s[creat_at]);?></span><a href="javascript:void(0);"><?php echo $s['msg'];?><em class="jifen_style">已消耗积分：<?php echo $s['value'];?>积分</em>             </a>        </li></li>
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