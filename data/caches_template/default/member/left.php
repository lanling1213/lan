<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><div class="huiyuan_left fl">
    <p>欢迎您！<br><?php echo trim(trim(get_nickname(),')'),'(');?>(<?php echo $memberinfo['groupname'];?>)</p>
    <img src="<?php echo $avatar['180'];?>"  onerror="this.src='<?php echo IMG_PATH;?>fl880/img1_huiyuan.jpg'">
    <em class="jifen"><img src="<?php echo IMG_PATH;?>fl880/jifen.jpg"> 积分：<?php echo $memberinfo['point'];?></em>
    <div class="hy_list">
        <p><a href="index.php?m=member&c=index&a=account_manage_avatar&t=1">修改头像</a></p>
        <p><a href="index.php?m=member&c=index&a=account_manage_info&t=1">个人资料</a></p>
        <p><a href="index.php?m=member&c=index&a=account_manage_password&t=1">修改密码</a></p>
        <p><a href="index.php?m=member&c=index&a=account_product_list&t=1">我的商品</a></p>
        <p><a href="index.php?m=member&c=index&a=account_manage_vip&t=1"><em>成为律师盾会员</em></a></p>
    </div>
</div>