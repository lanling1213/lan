<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><div class="case_l">
    <div class="case_list">
        <div class="case_lt">
            <em><img src="<?php echo IMG_PATH;?>fl880/qusetion.jpg" >您要咨询的问题？</em>
        </div>
        <div class="list_case">
            <ul>
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=5068fecb91e6faf02c7e86de68ca68e7&sql=select+%2A+from+wy_ask_type+where+parentid+%3D+1+and+siteid+%3D+1+order+by+listorder+desc&num=100&return=type\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_ask_type where parentid = 1 and siteid = 1 order by listorder desc LIMIT 100");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$type = $a;unset($a);?>
                <?php $n=1;if(is_array($type)) foreach($type AS $t) { ?>
                <li><a href="<?php echo APP_PATH;?>index.php?m=ask&c=index"><p><?php echo $t['typename'];?></p></a></li>
                <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </ul>
        </div>

    </div>

    <div class="case_list">
        <div class="case_lt">
            <img src="<?php echo IMG_PATH;?>fl880/list.jpg"><em><?php echo $CATEGORYS['12']['catname'];?></em>
        </div>

        <div class="case_lb1">
            <ul>
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=23ef96558ad7644fe96edcff0b3e82e0&action=lists&catid=12&order=listorder+desc%2Cupdatetime+desc&num=7&return=artList\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$artList = $content_tag->lists(array('catid'=>'12','order'=>'listorder desc,updatetime desc','limit'=>'7',));}?>
                    <?php $n=1;if(is_array($artList)) foreach($artList AS $art) { ?>
                        <li><a href="<?php echo $art['url'];?>"><?php echo str_cut($art[title],50);?></a></li>
                    <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </ul>
        </div>

    </div>

    <div class="case_list">
        <div class="case_lt">
            <img src="<?php echo IMG_PATH;?>fl880/list.jpg"><em><?php echo $CATEGORYS['4']['catname'];?></em>
        </div>

        <div class="case_lb1">
            <ul>
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=ba2f1e0ed0ae898c949711b7bab1b443&action=lists&catid=4&order=listorder+desc%2Cupdatetime+desc&num=7&return=artList\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$artList = $content_tag->lists(array('catid'=>'4','order'=>'listorder desc,updatetime desc','limit'=>'7',));}?>
                <?php $n=1;if(is_array($artList)) foreach($artList AS $art) { ?>
                <li><a href="<?php echo $art['url'];?>"><?php echo str_cut($art[title],50);?></a></li>
                <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </ul>
        </div>

    </div>

</div>