<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><div class="footer">
    <div class="w1200">
        <div class="contact cl">
            <div class="contact_l fl">
                <img class="fl" src="<?php echo IMG_PATH;?>fl880/foot_logo.png" alt="<?php echo $siteinfo['name'];?>">
                <div class="foot_content fl">
                    <p><?php echo $info['copyright'];?></p>
                    <p>地址：<?php echo $info['area'];?></p>
                    <p>电话：<?php echo $info['mobile'];?>   座机：<?php echo $info['tel'];?>    Email：<?php echo $info['email'];?></p>
                    <p>技术支持：网律互联</p>
                </div>
            </div>
            <div class="contact_r fr">
                <img class="fl" src="<?php echo thumb($info[weixin_img],120,120);?>" alt="<?php echo $siteinfo['name'];?>">
            </div>
        </div>
    </div>
</div>
<div class="kfbox fw">
    <div class="kfpup">
        <div class="kfin">
            <ul>
                <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo $info['qq'];?>&site=qq&menu=yes"><img src="<?php echo IMG_PATH;?>fl880/qqicon.png"><p>QQ在线</p></a></li>
                <li><a href="javascript:void(0)"><img src="<?php echo IMG_PATH;?>fl880/phongicon.png"><p>联系电话<br>
                    <em class="phone_font"><?php echo $info['mobile'];?></em></p></a></li>

                <li><a href="#"><img src="<?php echo IMG_PATH;?>fl880/topicon.png"><p>置顶</p></a></li>
            </ul>
            <a href="javascript:void(0);"><img src="<?php echo thumb($info[weixin_img],120,120);?>" alt="<?php echo $siteinfo['name'];?>"></a>
        </div>

    </div>
</div>
<script type="text/javascript">

    //共用
    $(".kfbox").hover(function(){
        $(this).children('.kfpup').stop(true,true).animate({marginRight:0});
    },function(){
        $(this).children('.kfpup').stop(true,true).animate({marginRight:-160});
    });

</script>
</body>
</html>
