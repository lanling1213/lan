<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<?php include template("content","top"); ?>
<?php include template("content","inner_banner"); ?>
<div class="case_cont cl">
    <?php include template("content","inner_left"); ?>
    <div class="case_r">
        <div class="about_tit">
            <h3><?php echo $catname;?></h3>
        </div>
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=d678726ef7953b1abb0b3eec350a49f7&sql=select+%2A+from+wy_category+where+parentid+%3D+%24catid+and+siteid+%3D+%24siteid+order+by+listorder+desc%2Ccatid+desc&num=10\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_category where parentid = $catid and siteid = $siteid order by listorder desc,catid desc LIMIT 10");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
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
<?php include template("content","footer"); ?>