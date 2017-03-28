<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php $siteinfo = siteinfo(1);$info = string2array($siteinfo['infos']);?>
<?php $member_interface = wy_base::load_app_class('member_interface', 'member');$userdata = $member_interface->get_member_info($_username, 2);?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="location" content="province=合肥;city=合肥">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><?php if($id) { ?><?php echo $title;?> - <?php echo $siteinfo['name'];?><?php } elseif (isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php echo $siteinfo['name'];?><?php } else { ?><?php echo $SEO['site_title'];?><?php } ?><?php if($page>1) { ?> - 第 <?php echo $page;?> 页<?php } ?></title>
    <meta name="keywords" content="<?php if($catid && empty($id)) { ?><?php echo $catname;?><?php } else { ?><?php echo $SEO['keyword'];?><?php } ?>">
    <meta name="description" content="<?php if($catid && empty($id)) { ?><?php echo $siteinfo['name'];?><?php echo $catname;?>栏目为您提供<?php echo $catname;?>相关法律知识和内容，如果还需要更专业的<?php echo $catname;?>知识，可咨询志公恒律师，咨询热线：0551-62370148<?php } else { ?><?php echo $SEO['description'];?><?php } ?>">
    <link href="<?php echo CSS_PATH;?>fl880/style.css" rel="stylesheet">
    <script type="text/javascript" src="<?php echo JS_PATH;?>fl880/jquery1.42.min.js"></script>
    <script type="text/javascript" src="<?php echo JS_PATH;?>fl880/jquery.SuperSlide.2.1.js"></script>
    <script type="text/javascript" src="<?php echo JS_PATH;?>fl880/jquery.SuperSlide.2.1.js"></script>
</head>
<body>