<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><script type="text/javascript">document.write('<iframe src="<?php echo APP_PATH;?>index.php?m=member&c=index&a=mini&forward='+encodeURIComponent(location.href)+'&siteid=<?php echo get_siteid();?>" allowTransparency="true"  width="100%" height="40" frameborder="0" scrolling="no"></iframe>')</script>
<div class="header cl">
    <div class="logo fl">
        <a href="/"><img src="<?php echo IMG_PATH;?>fl880/LOGO.jpg" alt="<?php echo $siteinfo['name'];?>"></a>
    </div>
    <div class="nav_list fr">
        <ul id="nav" class="nav clearfix">
            <li class="nLi" >
                <h3><a <?php if(empty($catid)) { ?>class="on"<?php } ?> href="<?php echo siteurl($siteid);?>" href="index.html">首页 </a></h3></li>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=bc798af71e3e2c625f417ddf52add8db&action=category&catid=0&num=10&siteid=%24siteid&order=listorder+ASC&return=nav\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">修改</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$nav = $content_tag->category(array('catid'=>'0','siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'10',));}?>
            <?php $n=1;if(is_array($nav)) foreach($nav AS $r) { ?>
                <li class="nLi"> <h3><a <?php if($catid == $r[catid]) { ?>class="on"<?php } ?> href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a></h3>
                    <?php if($r[child]) { ?>
                    <ul class="sub">
                        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=ce9ea3b50edcbdc238468604a784e173&action=category&catid=%24r%5Bcatid%5D&num=10&siteid=%24siteid&order=listorder+ASC&return=nav2\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">修改</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'category')) {$nav2 = $content_tag->category(array('catid'=>$r[catid],'siteid'=>$siteid,'order'=>'listorder ASC','limit'=>'10',));}?>
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