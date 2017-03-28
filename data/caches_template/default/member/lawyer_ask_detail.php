<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<script type="text/javascript" src="<?php echo JS_PATH;?>Validform_v5.3.2.js"></script>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&c=lawyer&siteid=1">个人中心</a> &gt; 咨询详情</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'lawyer_left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'lawyer_right_top'); ?>
			<div class="hy_rcon">
				<?php if($ask) { ?>
				<div class="ques_tit cl">
					<span class="fr"><?php echo date('Y-m-d',$ask[inputtime]);?></span><img class="fl" src="<?php echo IMG_PATH;?>fl880/question_img.jpg"> <h3><em><?php echo $ask['name'];?> : </em> <?php echo $ask['content'];?></h3>
				</div>
				<?php } ?>
				<?php $n=1;if(is_array($reply)) foreach($reply AS $r) { ?>
					<div class="ques_con">
						<img class="fl" src="<?php echo IMG_PATH;?>fl880/da_img.jpg"> <p class="fr"><em><?php echo $r['lawyer_name'];?>律师 ： </em><?php echo $r['content'];?><br>
					</p>
					</div>
				<?php $n++;}unset($n); ?>
				<div class="ques_con">
				<form action="/index.php?m=ask&c=index&a=reply" method="post" enctype="application/x-www-form-urlencoded" id="myform">
					<input type="hidden" name="is_ajax" value="1" />
					<input type="hidden" name="qid" value="<?php echo $questionid;?>" />
					<?php wy_base::load_sys_class('form', '', 0);?>
					<textarea placeholder="请输入要回复的内容..." id="introduce" name="content" ></textarea>
					<p  style="margin-left: 58px;"><font id="msgdemo" color="red" style="font-size: 16px;"></font></p>
					<input type="text" class="code" name="code" id="code" value="" placeholder="验证码">&nbsp;&nbsp;<?php echo form::checkcode('code_img','4','20',120,80);?>&nbsp;
					<button class="button"   name="dosubmit" id="submitform" type="submit">回复问题</button>
				</form>
				</div>
			</div>
		</div>
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
            ajaxPost: true, //AJAX请求
            btnSubmit: "#submitform",
            btnReset: "#btn_reset",
            callback: function(data) { //AJAX请求的回调函数
                if (data.status == "SUCCESS") {
                    $('#msgdemo').html(data.message);
                    window.location.href = document.referrer;//返回上一页并刷新
                } else {
                    $('#msgdemo').html( data.message);
                    return false;
                }
            }
        });
        demo.addRule([{
            ele: "#introduce",
            datatype: "*6-1000",
            tip: "",
            nullmsg: "回复内容不能为空",
            errormsg: "回复内容在6-1000个字之间"

        },{
            ele: "#code",
            tip: "",
            datatype: "/^[0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z]$/",
            nullmsg: "请输入验证码",
            errormsg: "请正确输入验证码"

        }]);

    });

</script>
<?php include template('member', 'footer'); ?>