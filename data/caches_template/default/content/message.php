<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
</head>
<link href="<?php echo CSS_PATH;?>fl880/style.css" rel="stylesheet">
<script type="text/javaScript" src="<?php echo JS_PATH;?>jquery.min.js"></script>
<script language="JavaScript" src="<?php echo JS_PATH;?>admin_common.js"></script>
<style>
</style>
<body>

<!--透明背景-->
<div class="pup-box">
	<p class="tc"><?php echo $msg;?></p>

	<?php if($url_forward=='goback' || $url_forward=='') { ?>
	<div class="tc pup-box-btn">
		<a href="javascript:history.back();">返回</a>
	</div>
	<?php } elseif ($url_forward=="close") { ?>
	<div class="tc pup-box-btn">
		<a href="#"  onClick="window.close();">返回</a>
	</div>
	<?php } elseif ($url_forward=="blank") { ?>
	<?php } elseif ($url_forward) { ?>
	<div class="tc pup-box-btn">
		<a href="<?php echo strip_tags($url_forward);?>">返回</a>
	</div>
	<div class="tc s-return"><em><span class="fines">2</span>秒后自动返回</em></div>
	<script language="javascript">setTimeout("redirect('<?php echo strip_tags($url_forward);?>');",<?php echo $ms;?>);</script>
	<?php } ?>
	<?php if($dialog) { ?><script style="text/javascript">window.top.location.reload();window.top.art.dialog({id:"<?php echo $dialog;?>"}).close();</script><?php } ?>
</div>
<script style="text/javascript">
    function close_dialog() {
        window.top.location.reload();window.top.art.dialog({id:"<?php echo $dialog?>"}).close();
    }
</script>
</body>
</html>
