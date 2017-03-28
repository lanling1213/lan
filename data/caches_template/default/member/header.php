<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php $siteinfo = siteinfo(1);$info = string2array($siteinfo['infos']);?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>志公恒信律师服务网 - <?php echo L('member','','member').L('manage_center');?></title>
<link href="<?php echo CSS_PATH;?>reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>table_form.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH;?>fl880/style.css" rel="stylesheet">
<script type="text/javascript" src="<?php echo JS_PATH;?>jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>member_common.js"></script>
<?php if(isset($show_validator)) { ?>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="<?php echo JS_PATH;?>formvalidatorregex.js" charset="UTF-8"></script>
<?php } ?>
</head>
<body>
	<div class="top">
		<div class="w1200">
			<ul class="fr">
				<?php if($memberinfo) { ?>
				<ul class="fr">
					<li class="fl line  "><a href="#"><?php echo trim(trim(get_nickname(),')'),'(');?>，您好 </a></li>
					<li class="fl line"><a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=logout&forward=<?php echo urlencode($_GET['forward']);?>&siteid=<?php echo $siteid;?>">退出</a></li>
				</ul>
				<?php } else { ?>
				<li class="fl login"><a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=login">登录</a></li>
				<li class="fl login1"><a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=register&modelid=10">注册</a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="header cl">
		<div class="logo fl">
			<a href="/"><img src="<?php echo IMG_PATH;?>fl880/LOGO.jpg" alt="<?php echo $siteinfo['name'];?>"></a>
		</div>
		<div class="nav_list fr">
			<ul id="nav" class="nav clearfix">
				<li class="nLi" >
					<h3><a <?php if(empty($catid)) { ?>class="on"<?php } ?> href="<?php echo siteurl($siteid);?>" href="index.html">首页 </a></h3></li>
				<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=bc798af71e3e2c625f417ddf52add8db&action=category&catid=0&num=10&siteid=%24siteid&order=listorder+ASC&return=nav\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$nav = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'10',));}?>
				<?php $n=1;if(is_array($nav)) foreach($nav AS $r) { ?>
				<li class="nLi"> <h3><a <?php if($catid == $r[catid]) { ?>class="on"<?php } ?> href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a></h3>
					<?php if($r[child]) { ?>
					<ul class="sub">
						<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=ce9ea3b50edcbdc238468604a784e173&action=category&catid=%24r%5Bcatid%5D&num=10&siteid=%24siteid&order=listorder+ASC&return=nav2\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$nav2 = $content_tag->category(array('catid'=>$r[catid],'siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'10',));}?>
						<?php $n=1;if(is_array($nav2)) foreach($nav2 AS $v) { ?>
						<li><a href="<?php echo $v['url'];?>"><?php echo $v['catname'];?></a></li>
						<?php $n++;}unset($n); ?>
						<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
					</ul>
					<?php } ?>
				</li>
				<?php $n++;}unset($n); ?>
				<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
				<li  class="nLi" ><h3><a href="<?php echo APP_PATH;?>ask/">在线咨询</a></h3></li>
			</ul>
			<script id="jsID" type="text/javascript">

                jQuery("#nav").slide({
                    type:"menu",// 效果类型，针对菜单/导航而引入的参数（默认slide）
                    titCell:".nLi", //鼠标触发对象
                    targetCell:".sub", //titCell里面包含的要显示/消失的对象
                    effect:"slideDown", //targetCell下拉效果
                    delayTime:300 , //效果时间
                    triggerTime:0, //鼠标延迟触发时间（默认150）
                    returnDefault:true //鼠标移走后返回默认状态，例如默认频道是“预告片”，鼠标移走后会返回“预告片”（默认false）
                });
			</script>
		</div>
	</div>
<div class="huiyuan">
	<div class="w1200 cl">
		<h3>会员中心</h3>
	</div>
</div>
