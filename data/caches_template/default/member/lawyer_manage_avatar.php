<?php defined('IN_WYCMS') or exit('No permission resources.'); ?><?php include template('member', 'header'); ?>
<div class="body_bg">
	<div class="position">
		<div class="w1200">
			<em><img src="<?php echo IMG_PATH;?>fl880/posi_img.jpg"></em><span>您现在的位置是：<a href="<?php echo APP_PATH;?>index.php?m=member&c=lawyer&c=lawyer&siteid=1">个人中心</a> &gt; 修改头像</span>
		</div>
	</div>
</div>
<div class="hy_conbg">
	<div class="w1200 cl">
		<?php include template('member', 'lawyer_left'); ?>
		<div class="huiyuan_right fr">
			<?php include template('member', 'lawyer_right_top'); ?>
			<div class="hy_rcon1">
				<script language="javascript" type="text/javascript" src="<?php echo $wysso_api_url;?>/skins/js/swfobject.js"></script>
				<script type="text/javascript">
                    var flashvars = {
                        'upurl':"<?php echo $upurl;?>&callback=return_avatar&"
                    };
                    var params = {
                        'align':'middle',
                        'play':'true',
                        'loop':'false',
                        'scale':'showall',
                        'wmode':'window',
                        'devicefont':'true',
                        'id':'Main',
                        'bgcolor':'#ffffff',
                        'name':'Main',
                        'allowscriptaccess':'always'
                    };
                    var attributes = {

                    };
                    swfobject.embedSWF("<?php echo $wysso_api_url;?>/skins/images/main.swf", "myContent", "490", "434", "9.0.0","<?php echo $wysso_api_url;?>/skins/images/expressInstall.swf", flashvars, params, attributes);

                    function return_avatar(data) {
                        if(data == 1) {
                            window.location.reload();
                        } else {
                            alert('failure');
                        }
                    }
				</script>
				<ul class="col-right col-avatar" id="avatarlist">
					<?php $n=1; if(is_array($avatar)) foreach($avatar AS $k => $v) { ?>
					<li>
						<img src="<?php echo $v;?>" height="<?php echo $k;?>" width="<?php echo $k;?>" onerror="this.src='<?php echo $wysso_api_url;?>/skins/images/member/nophoto.gif'"><br />
						<?php echo L('avatar');?><?php echo $k;?> x <?php echo $k;?>
					</li>
					<?php $n++;}unset($n); ?>
				</ul>
				<div class="col-auto" style="width:500px;">
					<div id="myContent">
						<p>Alternative content</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include template('member', 'footer'); ?>
