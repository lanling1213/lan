<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><div class="huiyuan_left fl">
    <p>欢迎您！<?php echo trim(trim(get_nickname(),')'),'(');?> (<?php echo $memberinfo['groupname'];?>)</p>
    <img src="<?php echo $avatar['180'];?>" onerror="this.src='<?php echo IMG_PATH;?>fl880/img1_huiyuan.jpg'">
    <div class="hy_list">
        <p><a href="index.php?m=member&c=lawyer&a=lawyer_manage_avatar&t=1">修改头像</a></p>
        <p><a href="index.php?m=member&c=lawyer&a=lawyer_manage_info&t=1">个人资料</a></p>
        <p><a href="index.php?m=member&c=lawyer&a=lawyer_manage_password&t=1">修改密码</a></p>
    </div>
</div>