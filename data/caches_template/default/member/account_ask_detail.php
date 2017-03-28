<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<script type="text/javascript" src="<?php echo JS_PATH;?>Validform_v5.3.2.js"></script>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&siteid=1">个人中心</a> &gt; 咨询详情</span>
		</div>
	</div>
	<div class="ly_conbg1 ">
		<div class="w1200">
			<div class="login ">
				<ul>
					<li><span>咨询详情 </span> </li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'right_top'); ?>
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
				<?php if($t == 2) { ?>
				<form action="/index.php?m=ask&c=index&a=ask" method="post" enctype="application/x-www-form-urlencoded" id="myform" >
				<input type="hidden" name="typeid" value="2" />
				<input type="hidden" name="url" value="<?php echo APP_PATH;?>index.php?m=member&c=index&a=account_exclusive_lawyer&t=1" />
				<?php wy_base::load_sys_class('form', '', 0);?>
				<div class="ques_con">
					<textarea placeholder="请输入要咨询的案件详情..." id="introduce" name="content" ></textarea>
					<input type="hidden" name="name" id="name"  value="<?php echo $memberinfo['nickname'];?>"/>
					<input type="hidden" name="comment[tel]" id="tel" value="<?php echo $memberinfo['mobile'];?>"/>
					<input type="hidden" name="uid" id="uid" value="<?php echo $uid;?>"/>
					<p style="margin-left: 58px;"><font id="msgdemo" color="red" style="font-size: 16px;"></font></p>
					<input type="text" class="code" name="code" id="code" value="" placeholder="验证码">&nbsp;&nbsp;<?php echo form::checkcode('code_img','4','20',120,80);?>&nbsp;
					<button class="button"   name="dosubmit" id="submitform" type="submit"><?php if($ask) { ?>继续提问<?php } else { ?>提交咨询<?php } ?></button>
				</div>
				</form>
				<?php } ?>
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
<?php include template('member', 'footer'); ?>