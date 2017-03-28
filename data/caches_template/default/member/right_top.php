<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><div class="hy_top fr">
    <a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">我的咨询</a>
    <a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=account_manage_referrer&t=1">推荐过的人</a>
    <?php if($memberinfo[groupid] == 5) { ?>
        <a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=account_exclusive_lawyer&t=1">专属律师</a>
    <?php } ?>
</div>