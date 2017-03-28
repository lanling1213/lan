<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<?php include template("content","top"); ?>
<?php include template("content","inner_banner"); ?>
<div class="case_cont cl">
    <?php include template("content","inner_left"); ?>
    <div class="case_r">
        <div class="about_tit1">
            <h3><?php echo $CAT['catname'];?></h3>
        </div>
        <div class="news_con1">
            <div class="news_cont">
                <h3><?php echo $title;?></h3>
                <em>来源：<?php if($copyfrom) { ?><?php echo $copyfrom;?><?php } else { ?>未知<?php } ?>&nbsp;&nbsp;&nbsp;&nbsp;作者：<?php if($author) { ?><?php echo $author;?><?php } else { ?>未知<?php } ?>&nbsp;&nbsp;&nbsp;&nbsp;时间：<?php echo date('Y-m-d',strtotime($inputtime));?></em>
            </div>
            <?php echo htmlspecialchars_decode($content);?>
            <div class="fenxiang">
                <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare" style=" width:250px; height:27px; overflow:hidden;">
                    <span class="bds_more">分享到：</span>
                    <a class="bds_qzone"></a>
                    <a class="bds_tsina"></a>
                    <a class="bds_tqq"></a>
                    <a class="bds_renren"></a>
                    <a class="bds_t163"></a>
                    <a class="shareCount"></a>
                </div>
                <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=697092" ></script>
                <script type="text/javascript" id="bdshell_js"></script>
                <script type="text/javascript">
                    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
                </script>
            </div>



        </div>
        <div class="bus_conb">
            <p>免责声明：本网部分文章和信息来源于国际互联网，本网转载出于传递更多信息和学习之目的。如转载稿涉及版权等问题，请立即联系网站所有人，我们会予以更改或删除相关文章，保证您的权利。</p>
            <a href="<?php echo $previous_page['url'];?>">上一篇：<?php echo $previous_page['title'];?></a><br />
            <a href="<?php echo $next_page['url'];?>">下一篇：<?php echo $next_page['title'];?></a>
        </div>



    </div>

</div>
<?php include template("content","footer"); ?>