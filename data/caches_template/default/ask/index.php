<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
<?php include template("content","top"); ?>
<script type="text/javascript" src="<?php echo JS_PATH;?>Validform_v5.3.2.js"></script>
<div class="abbanner">
    <div class="w1200 cl">
        <div class=" about_tit fr">
            <h3>本所动态</h3>
            <p>专业、专人律师服务</p>
        </div>
    </div>
</div>
<div class="position">
    <div class="w1200">
        <em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg" /></em><span>您现在的位置是：<a href="/"><?php echo $siteinfo['name'];?></a> &gt;&nbsp;在线咨询</span>
    </div>
</div>
<div class="ly_cont">
    <div class="ly_bom">
        <h3>在线咨询</h3>
        <form action="/index.php?m=ask&c=index&a=ask" method="post" enctype="application/x-www-form-urlencoded" id="myform">
            <input type="hidden" name="url" value="<?php echo APP_PATH;?>index.php?m=member&siteid=1" />
            <?php wy_base::load_sys_class('form', '', 0);?>
            <p class="text2">
                <textarea placeholder="请输入要咨询的案件详情..." id="introduce" name="content" class="text"><?php echo $_REQUEST['content'];?></textarea>
                <input type="hidden" name="name" id="name"  value="<?php echo $userdata['nickname'];?>"/>
                <input type="hidden" name="comment[tel]" id="tel" value="<?php echo $userdata['mobile'];?>"/>
            </p>
            <p class="text3">
            <select name="typeid">
                <?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"get\" data=\"op=get&tag_md5=5068fecb91e6faf02c7e86de68ca68e7&sql=select+%2A+from+wy_ask_type+where+parentid+%3D+1+and+siteid+%3D+1+order+by+listorder+desc&num=100&return=type\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}wy_base::load_sys_class("get_model", "model", 0);$get_db = new get_model();$r = $get_db->sql_query("select * from wy_ask_type where parentid = 1 and siteid = 1 order by listorder desc LIMIT 100");while(($s = $get_db->fetch_next()) != false) {$a[] = $s;}$type = $a;unset($a);?>
                    <?php $n=1;if(is_array($type)) foreach($type AS $t) { ?>
                    <option value="<?php echo $t['typeid'];?>" <?php if($_REQUEST[type] == $t[typeid]) { ?>selected<?php } ?>><?php echo $t['typename'];?></option>
                    <?php $n++;}unset($n); ?>
                <?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
            </select>
            </p>
            <p class="text4">
                <input type="text" class="code"  name="code" id="code" value="" placeholder="验证码"><label><?php echo form::checkcode('code_img','4','20',120,80);?></label>
            </p>
            <p class="text4"><font id="msgdemo" color="red" style="font-size: 16px;"></font></p>
            <p class="text5"><button class="button"   name="dosubmit" id="submitform" type="submit">提交咨询</button> </p>

        </form>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        var demo = $("#myform").Validform({
            tiptype: function(msg, o, cssctl) {
                var objtip = $("#msgdemo");
                cssctl(objtip, o.type);
                objtip.text(msg);
            },
            btnSubmit: "#submitform",
            btnReset: "#btn_reset",
        });
        demo.addRule([{
            ele: "#tel",
            tip: "",
            datatype: "/^0{0,1}(13[0-9]|15[5-9]|15[0-3]|147|180|182|18[5-9])[0-9]{8}$/",
            nullmsg: "请在个人中心的个人资料中保存好您的手机号码",
            errormsg: "手机号码不正确"

        }, {
            ele: "#introduce",
            datatype: "*6-1000",
            tip: "",
            nullmsg: "咨询内容不能为空",
            errormsg: "咨询内容在6-1000个字之间"

        }, {
            ele: "#code",
            tip: "",
            datatype: "/^[0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z]$/",
            nullmsg: "请输入验证码",
            errormsg: "请正确输入验证码"

        }]);

    });

</script>
<?php include template("content","footer"); ?>