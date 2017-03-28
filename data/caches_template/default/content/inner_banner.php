<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><!--banner开始-->
<!--banner开始-->
<div class="abbanner">
    <div class="w1200 cl">
        <div class=" about_tit fr">
            <h3><?php echo strip_tags(catpos($catid));?></h3>
            <p>专业、专人律师服务</p>
        </div>
    </div>
</div>

<div class="position">
    <div class="w1200">
        <em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg" /></em><span>您现在的位置是：<a href="/"><?php echo $siteinfo['name'];?></a> &gt;&nbsp;<?php echo catpos($catid);?></span>
    </div>
</div>