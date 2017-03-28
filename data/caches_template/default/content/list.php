<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<?php include template("content","top"); ?>
<?php include template("content","inner_banner"); ?>
<?php if($catid == 15) { ?>
<div class="sc_cont">
    <h3 class="title">积分商城</h3>
    <div class="service_bd w1200">
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=c3eeb290be3bba39ffcf691ddd1144ad&action=lists&catid=%24catid&page=%24page&num=50&order=listorder+desc%2Cupdatetime+desc&return=point\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 50;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>$catid,'order'=>'listorder desc,updatetime desc','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$point = $content_tag->lists(array('catid'=>$catid,'order'=>'listorder desc,updatetime desc','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>
        <?php $n=1;if(is_array($point)) foreach($point AS $p) { ?>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=c5244660831b0db1ac235420452908d5&sql=select+%2A+from+wy_product_data+where+id+%3D+%24p%5Bid%5D&num=1&return=pdata\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_product_data where id = $p[id] LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$pdata = $a;unset($a);?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        <?php
                $http_referer = urlencode(get_url());
                $allow_visitor = sys_auth($catid.'_'.$p[id].'|'.$pdata[0][readpoint].'|'.$pdata[0][paytype]).'&http_referer='.$http_referer;
        ?>
        <div class="side2 fl">
            <img src="<?php echo thumb($p[thumb],263,206);?>">
            <div class="num_bg">
                <h3><?php echo $p['title'];?></h3>
                <div class="num">
                    <p class="fl">积分：<em><?php echo $pdata['0']['readpoint'];?></em></p>
                    <a class="fr convert" href="<?php echo APP_PATH;?>index.php?m=content&c=readpoint&allow_visitor=<?php echo $allow_visitor;?>">兑换</a>
                </div>
            </div>
        </div>
        <?php $n++;}unset($n); ?>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
    </div>
    <div class="page"><?php echo $pages;?></div>
</div>
<script type="text/javascript">
</script>
<?php } else { ?>
    <div class="case_cont cl">
        <?php include template("content","inner_left"); ?>
        <div class="case_r">
            <div class="about_tit">
                <h3><?php echo $CATEGORYS[$top_parentid]['catname'];?></h3>
            </div>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=df90b1fa3d6cfa3a8ce190d2b9807745&sql=select+%2A+from+wy_category+where+parentid+%3D+%24top_parentid+and+siteid+%3D+%24siteid+order+by+listorder+desc%2Ccatid+desc&num=10\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_category where parentid = $top_parentid and siteid = $siteid order by listorder desc,catid desc LIMIT 10");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
                <div class="team_list">
                    <?php $num = 0;?>
                    <?php $n=1;if(is_array($data)) foreach($data AS $cate) { ?>
                        <a href="<?php echo $cate['url'];?>" class="<?php if($num%6 == 0) { ?>left-none <?php } ?> <?php if($catid == $cate[catid]) { ?>link2<?php } ?>"><?php echo $cate['catname'];?></a>
                    <?php $num++;?>
                    <?php $n++;}unset($n); ?>
                </div>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=69ca29a0158df8f9c6701673958cd23a&action=lists&catid=%24catid&page=%24page&num=10&order=listorder+desc%2Cupdatetime+desc&return=artList\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 10;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>$catid,'order'=>'listorder desc,updatetime desc','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$artList = $content_tag->lists(array('catid'=>$catid,'order'=>'listorder desc,updatetime desc','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>
            <?php $n=1;if(is_array($artList)) foreach($artList AS $al) { ?>
                <?php if($catid == 3) { ?>
                    <div class="case_r_mid cl">
                        <img class="case_rml fl" src="<?php echo thumb($al[thumb],152,172);?>" />
                        <div class="case_rmr1 fr">
                            <h3><a href="<?php echo $al['url'];?>"><?php echo $al['title'];?></a></h3>
                            <p class="line_min"><A href="<?php echo $al['url'];?>"><?php echo str_cut($al['description'],250);?></A></p>
                            <span class="more1"> <a href="<?php echo $al['url'];?>">了解更多 >></a></span>
                        </div>
                    </div>
                <?php } else { ?>
                    <div class="case_r_mid cl">
                        <div class="case_rmr fl">
                            <h3><a href="<?php echo $al['url'];?>"><?php echo $al['title'];?></a></h3>
                            <p><a href="<?php echo $al['url'];?>"><?php echo str_cut($al['description'],250);?></a></p>
                        </div>
                        <div class="case_right fr">
                            <em><?php echo date('Y-m-d',$al['inputtime']);?></em><br>
                            <a href="<?php echo $al['url'];?>">了解更多 >></a>
                        </div>
                    </div>
                <?php } ?>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            <div class="page"><?php echo $pages;?></div>
        </div>
    </div>
<?php } ?>
<?php include template("content","footer"); ?>