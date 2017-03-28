<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><link href="<?php echo CSS_PATH;?>fl880/style.css" rel="stylesheet">
<div class="top">
    <div class="w1200">
            <?php if($_username) { ?>
            <ul class="fr">
                <li class="fl line  "><a href="#"><?php echo trim(trim(get_nickname(),')'),'(');?>，您好 </a></li>
                <li class="fl line"><a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=logout&forward=<?php echo urlencode($_GET['forward']);?>&siteid=<?php echo $siteid;?>" target="_top">退出</a></li>
                <a class="color_a" href="<?php if($userdata[modelid] == 12) { ?><?php echo APP_PATH;?>index.php?m=member&c=lawyer&siteid=<?php echo $siteid;?><?php } else { ?><?php echo APP_PATH;?>index.php?m=member&siteid=<?php echo $siteid;?><?php } ?>" target="_top">个人中心</a>
            </ul>
            <?php } else { ?>
            <ul class="fr">
                <li class="fl login"><a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=login" target="_top">登录</a></li>
                <li class="fl login1"><a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=register&modelid=10" target="_top">注册</a></li>
            </ul>
            <?php } ?>
    </div>
</div>
