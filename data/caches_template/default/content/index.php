<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<?php include template("content","top"); ?>
<!--banner开始-->
<div class="banner">
    <div class="fullSlide">
        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=f8a200c8f9a519f6c9a327bfa69514f6&sql=SELECT+setting+FROM+wy_poster+WHERE+spaceid+%3D+1+AND+type%3D%27images%27+AND+disabled%3D0+ORDER+BY+listorder+ASC&num=5\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("SELECT setting FROM wy_poster WHERE spaceid = 1 AND type='images' AND disabled=0 ORDER BY listorder ASC LIMIT 5");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$data = $a;unset($a);?>
        <div class="bd">
            <ul>
                <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
                <?php $narry = json_decode($r[setting],true);?>
                <li style="background:url(<?php echo $narry['1']['imageurl'];?>)  center 0 no-repeat;" alt="<?php echo $narry['1']['alt'];?>">
                <?php $n++;}unset($n); ?>
            </ul>
        </div>
        <div class="hd">
            <ul>
                <?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
                <li></li>
                <?php $n++;}unset($n); ?>
            </ul>
        </div>
        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        <script type="text/javascript">
            jQuery(".fullSlide").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"topLoop",  autoPlay:true, autoPage:true, trigger:"click"   });
        </script>
    </div>
</div>

<div class="content">
    <!--关于我们-->
    <div class="about w1200">
        <div class="slideTxtBox">
            <div class="hd">
                <ul><li><?php echo $CATEGORYS['2']['catname'];?></li><li><?php echo $CATEGORYS['3']['catname'];?></li></ul>
            </div>
            <div class="bd">
                <ul>
                    <li class=" cl">
                            <span class="date"><img src="<?php echo $CATEGORYS['2']['image'];?>" alt="<?php echo $CATEGORYS['2']['catname'];?>"></span>
                        <div class="bd_content">
                            <h3>
                                志公恒信律师服务的宗旨是：<br>
                                <em>传播法律知识，提高法律意识，预防法律风险，解决法律纠纷</em>
                            </h3>
                            <p>志公恒信律师提供服务的内容：<br>
                                <b>一、民事类包括十大部分：<br></b>
                                1、人格权纠纷，2、婚姻家庭继承纠纷，3、侵权责任纠纷，4、物权纠纷，4、合同纠纷，5、知识产权与竞争纠纷，6、劳动争议与人事争议纠纷，
                                7、与公司、企业有关的民事纠纷，8、9、海事海商、与铁路运输有关的民事纠纷，9、与公司、证券、票据等有关的民事纠纷，
                                10，适用特殊程序案件。(备注：按照民事案由进行的分类)
                                <b>二、刑事类：</b><br>
                                1、侵犯公民人身权利的犯罪;2、侵犯公民财产权利的犯罪;3、危害公共安全的犯罪;4、破坏市场经济秩序的犯罪...</p>
                            <a href="<?php echo $CATEGORYS['2']['url'];?>">查看更多 </a>
                        </div>
                    </li>

                </ul>
                <ul>
                    <li>
                        <div class="scrollBox" style="margin:0 auto">
                            <div class="ohbox">
                                <ul class="piclist">
                                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=995b330b08862f09df38df0bc333b0d4&action=lists&catid=3&num=20&order=listorder+desc%2Cupdatetime+desc&return=team\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$team = $content_tag->lists(array('catid'=>'3','order'=>'listorder desc,updatetime desc','limit'=>'20',));}?>
                                    <?php $n=1;if(is_array($team)) foreach($team AS $v) { ?>
                                        <li><a href="<?php echo $v['url'];?>" target="_blank"><img src="<?php echo thumb($v[thumb],215,214);?>" alt="<?php echo $v['title'];?>"/><span><?php echo $v['title'];?></span></a></li>
                                    <?php $n++;}unset($n); ?>
                                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                                </ul>
                            </div>
                            <div class="pageBtn">

                                <ul class="list"><li></li><li></li><li></li></ul>
                            </div>
                        </div>
                        <script type="text/javascript">jQuery(".scrollBox").slide({ titCell:".list li", mainCell:".piclist", effect:"left",vis:5,scroll:5,delayTime:800,trigger:"click",easing:"easeOutCirc", autoPlay:true, });
                        </script>
                        <div class="more4"><a href="<?php echo $CATEGORYS['3']['url'];?>" >查看更多</a></div>
                    </li>

                </ul>

            </div>
        </div>
        <script type="text/javascript">jQuery(".slideTxtBox").slide();</script>


    </div>

    <!--服务-->

    <div class="service">
        <div class="w1200">
            <div class="service_tit">
                <h3><?php echo $CATEGORYS['7']['catname'];?></h3>
                <em>Business Expertise</em>
            </div>

            <div class="service_bd">
                <ul class="cl">
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=ecbc22c277247ff921a6f74dcbfb2052&sql=select+%2A+from+wy_category+where+parentid+%3D+7+order+by+listorder+desc%2Ccatid+desc&num=4&return=service\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_category where parentid = 7 order by listorder desc,catid desc LIMIT 4");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$service = $a;unset($a);?>
                    <?php $num = 1;?>
                    <?php $n=1;if(is_array($service)) foreach($service AS $r) { ?>
                    <li><a class="icon<?php echo $num;?>" href="<?php echo $r['url'];?>"></a><p><?php echo $r['catname'];?></p></li>
                    <?php $num++;?>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                </ul>
            </div>
        </div>
    </div>
    <!--案件-->
    <div class="case">
        <div class="case_tit">
            <h3>我们办理的<span>案件</span></h3>
            <em>Business Expertise</em>
        </div>
        <div class="picScroll-left">
            <div class="bd">
                <ul class="picList">
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=0ec7d26d505a19d3711f10ecd8be4c1e&action=lists&catid=4&order=listorder+desc%2Cupdatetime+desc&num=12&return=artList\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$artList = $content_tag->lists(array('catid'=>'4','order'=>'listorder desc,updatetime desc','limit'=>'12',));}?>
                    <?php $num =1;?>
                    <?php $n=1;if(is_array($artList)) foreach($artList AS $al) { ?>
                    <li>
                        <div class="pic"><a href="<?php echo $al['url'];?>"><img src="<?php if($al[thumb]) { ?><?php echo thumb($al[thumb],130,90);?><?php } else { ?><?php echo IMG_PATH;?>fl880/pic<?php echo $num;?>.jpg<?php } ?>" alt="<?php echo $al['title'];?>"/></a></div>
                        <div class="title">
                            <h3><?php echo $al['title'];?></h3>
                            <p><?php echo str_cut($al[description],90);?><a href="<?php echo $al['url'];?>">[更多]</a></p>
                        </div>
                    </li>
                    <?php $num++;?>
                    <?php if($num ==4) { ?>
                        <?php $num =1;?>
                    <?php } ?>
                    <?php $n++;}unset($n); ?>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                </ul>
            </div>
            <div class="hd">

                <ul></ul>


            </div>
        </div>

        <script type="text/javascript">
            jQuery(".picScroll-left").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:true,vis:3,trigger:"click"});
        </script>


    </div>

    <!--成功案例-->
    <div class="cases">
        <div class="w1200">

            <div class="cases_con cl">
                <div class="con1">
                    <div class="title cl">
                        <h3 class="fl"><?php echo mb_substr($CATEGORYS[5]['catname'],0,2,'utf-8');?><em><?php echo mb_substr($CATEGORYS[5]['catname'],2,2,'utf-8');?></em></h3><span class="fl">Legal Information</span>
                    </div>
                    <img src="<?php echo thumb($CATEGORYS[5]['image'],380,160);?>"  alt="<?php echo $CATEGORYS['5']['catname'];?>"/>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=9bcde14e5dd131dccb1e80061c03c21b&action=lists&catid=5&order=listorder+desc%2Cupdatetime+desc&num=7&return=artList\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$artList = $content_tag->lists(array('catid'=>'5','order'=>'listorder desc,updatetime desc','limit'=>'7',));}?>
                        <div class="content">
                            <?php $num = 0;?>
                            <?php $n=1; if(is_array($artList)) foreach($artList AS $ka => $al) { ?>
                                <?php if($num == 0) { ?>
                                     <h3><a href="<?php echo $al['url'];?>"><?php echo $al['title'];?></a></h3>
                                    <p><?php echo str_cut($al[description],90);?><a href="<?php echo $al['url'];?>">[更多]</a></p>
                                <?php } ?>
                            <?php $num++;?>
                            <?php $n++;}unset($n); ?>
                        </div>
                        <ul>
                            <?php $num = 0;?>
                            <?php $n=1;if(is_array($artList)) foreach($artList AS $al) { ?>
                                <?php if($num > 0) { ?>
                                    <li><a href="<?php echo $al['url'];?>"><?php echo $al['title'];?></a></li>
                                <?php } ?>
                            <?php $num++;?>
                            <?php $n++;}unset($n); ?>
                        </ul>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                    <a class="more" href="<?php echo $CATEGORYS['5']['url'];?>">查看更多</a>
                </div>

                <div class="con1">
                    <div class="title cl">
                        <h3 class="fl"><?php echo mb_substr($CATEGORYS[12]['catname'],0,2,'utf-8');?><em><?php echo mb_substr($CATEGORYS[12]['catname'],2,2,'utf-8');?></em></h3><span class="fl">Legal Information</span>
                    </div>
                    <img src="<?php echo thumb($CATEGORYS[12]['image'],380,160);?>" alt="<?php echo $CATEGORYS['12']['catname'];?>"/>
                    <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=23ef96558ad7644fe96edcff0b3e82e0&action=lists&catid=12&order=listorder+desc%2Cupdatetime+desc&num=7&return=artList\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$artList = $content_tag->lists(array('catid'=>'12','order'=>'listorder desc,updatetime desc','limit'=>'7',));}?>
                    <div class="content">
                        <?php $num = 0;?>
                        <?php $n=1; if(is_array($artList)) foreach($artList AS $ka => $al) { ?>
                            <?php if($num == 0) { ?>
                                <h3><a href="<?php echo $al['url'];?>"><?php echo $al['title'];?></a></h3>
                                <p><?php echo str_cut($al[description],90);?><a href="<?php echo $al['url'];?>">[更多]</a></p>
                            <?php } ?>
                        <?php $num++;?>
                        <?php $n++;}unset($n); ?>
                    </div>
                    <ul>
                        <?php $num = 0;?>
                        <?php $n=1;if(is_array($artList)) foreach($artList AS $al) { ?>
                            <?php if($num > 0) { ?>
                                <li><a href="<?php echo $al['url'];?>"><?php echo $al['title'];?></a></li>
                            <?php } ?>
                        <?php $num++;?>
                        <?php $n++;}unset($n); ?>
                    </ul>
                    <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                    <a class="more" href="<?php echo $CATEGORYS['4']['url'];?>">查看更多</a>
                </div>

                <div class="con2">
                    <div class="title cl">
                        <h3 class="fl">在线<em>咨询</em></h3><span class="fl">Consultation</span>
                    </div>
                    <span class="word">亲，您需要注册登录后才能咨询律师。 </span>
                    <form action="<?php echo APP_PATH;?>index.php?m=ask&c=index" method="post">
                        <p> <textarea name="content" class="text1" placeholder="请输入您要咨询的内容"></textarea></p>
                        <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=5068fecb91e6faf02c7e86de68ca68e7&sql=select+%2A+from+wy_ask_type+where+parentid+%3D+1+and+siteid+%3D+1+order+by+listorder+desc&num=100&return=type\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_ask_type where parentid = 1 and siteid = 1 order by listorder desc LIMIT 100");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$type = $a;unset($a);?>
                        <?php $num = 0;?>
                        <?php $n=1;if(is_array($type)) foreach($type AS $t) { ?>
                            <p><input <?php if($num == 0) { ?>checked<?php } ?> type="radio" value="<?php echo $t['typeid'];?>" name="type"> <?php echo $t['typename'];?></p>
                        <?php $num++;?>
                        <?php $n++;}unset($n); ?>
                        <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                        <p><button type="submit" class="button" >咨询</button></p>
                    </form>

                </div>
            </div>
        </div>


    </div>
</div>

<!--服务-->

<div class="service">
    <div class="w1200">
        <div class="service_tit">
            <h3><?php echo $CATEGORYS['15']['catname'];?></h3>
            <em>Business Expertise</em>
        </div>
        <div class="service_bd">
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=7944261e27d22b9fe53be37b432475c6&action=lists&catid=15&num=2&order=listorder+desc%2Cupdatetime+desc&return=point\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = wy_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$point = $content_tag->lists(array('catid'=>'15','order'=>'listorder desc,updatetime desc','limit'=>'2',));}?>
            <?php $n=1;if(is_array($point)) foreach($point AS $p) { ?>
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=c5244660831b0db1ac235420452908d5&sql=select+%2A+from+wy_product_data+where+id+%3D+%24p%5Bid%5D&num=1&return=pdata\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_product_data where id = $p[id] LIMIT 1");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$pdata = $a;unset($a);?><?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            <?php
                $http_referer = urlencode(get_url());
                $allow_visitor = sys_auth($p[catid].'_'.$p[id].'|'.$pdata[0][readpoint].'|'.$pdata[0][paytype]).'&http_referer='.$http_referer;
        ?>
            <div class="side fl">
                <img src="<?php echo thumb($p[thumb],263,206);?>">
                <div class="num_bg">
                    <h3><?php echo $p['title'];?></h3>
                    <div class="num">
                        <p class="fl">积分：<em><?php echo $pdata['0']['readpoint'];?></em></p>
                        <a class="fr" href="<?php echo APP_PATH;?>index.php?m=content&c=readpoint&allow_visitor=<?php echo $allow_visitor;?>">兑换</a>
                    </div>
                </div>
            </div>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            <div class="side1">
                <h3>礼品采用积分兑换方式</h3>
                <p>1、注册积分（注册成为网站会员即可获得）</p>
                <p>2、推荐积分（推荐用户注册也可获得）</p>
                <p>3、案件积分（在本网站办理过案件并交纳费用也可获得）</p>
                <?php if($_username) { ?>
                    <a href="<?php echo $CATEGORYS['15']['url'];?>">查看更多</a>
                <?php } else { ?>
                    <a href="<?php echo APP_PATH;?>index.php?m=member&c=index&a=register&modelid=10">立即注册</a>
                <?php } ?>
            </div>
        </div>
    </div>
</div>



<!--合作伙伴-->
<div class="parner">
    <div class="case_tit">
        <h3>友情<span>链接</span></h3>
        <em>Friendship Link</em>
    </div>

    <div class="parner_con">
        <ul class="cl link">
            <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"link\" data=\"op=link&tag_md5=87fb3a3464d7a2b7715bbcd8f83fc621&action=type_list&siteid=%24siteid&order=listorder+DESC&num=30&return=link\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$link_tag = wy_base::load_app_class("link_tag", "link");if (method_exists($link_tag, 'type_list')) {$link = $link_tag->type_list(array('siteid'=>$siteid,'order'=>'listorder DESC','limit'=>'30',));}?>
            <?php $n=1;if(is_array($link)) foreach($link AS $v) { ?>
                <li><a href="<?php echo $v['url'];?>" target="_blank"><p><?php echo $v['name'];?></p></a></li>
            <?php $n++;}unset($n); ?>
            <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
        </ul>
    </div>
</div>
</div>
<?php include template("content","footer"); ?>
