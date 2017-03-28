/*
Navicat MySQL Data Transfer

Source Server         : bdm137359220.my3w.com_3306
Source Server Version : 50148
Source Host           : bdm137359220.my3w.com:3306
Source Database       : bdm137359220_db

Target Server Type    : MYSQL
Target Server Version : 50148
File Encoding         : 65001

Date: 2017-03-28 09:52:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wy_admin
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin`;
CREATE TABLE `wy_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_admin
-- ----------------------------
INSERT INTO `wy_admin` VALUES ('1', 'admin', '39bb214695358b9f2149f2522ae50ba1', '1', 'ac5i28', '120.197.17.140', '1490664351', 'wycms@wanglv.com', '', '', '');

-- ----------------------------
-- Table structure for wy_admin_panel
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin_panel`;
CREATE TABLE `wy_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_admin_panel
-- ----------------------------

-- ----------------------------
-- Table structure for wy_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin_role`;
CREATE TABLE `wy_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_admin_role
-- ----------------------------
INSERT INTO `wy_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `wy_admin_role` VALUES ('2', '站点管理员', '站点管理员', '0', '0');
INSERT INTO `wy_admin_role` VALUES ('3', '运营总监', '运营总监', '1', '0');
INSERT INTO `wy_admin_role` VALUES ('4', '总编', '总编', '5', '0');
INSERT INTO `wy_admin_role` VALUES ('5', '编辑', '编辑', '1', '0');
INSERT INTO `wy_admin_role` VALUES ('7', '发布人员', '发布人员', '0', '0');

-- ----------------------------
-- Table structure for wy_admin_role_priv
-- ----------------------------
DROP TABLE IF EXISTS `wy_admin_role_priv`;
CREATE TABLE `wy_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for wy_announce
-- ----------------------------
DROP TABLE IF EXISTS `wy_announce`;
CREATE TABLE `wy_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_announce
-- ----------------------------

-- ----------------------------
-- Table structure for wy_ask_position
-- ----------------------------
DROP TABLE IF EXISTS `wy_ask_position`;
CREATE TABLE `wy_ask_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增posid',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '对应于wy_ask_type的typeid',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '推荐为名称',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '站点id',
  `thumb` varchar(150) NOT NULL DEFAULT '' COMMENT '推荐位缩略图',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ask_position
-- ----------------------------

-- ----------------------------
-- Table structure for wy_ask_position_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_ask_position_data`;
CREATE TABLE `wy_ask_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '索引id',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '对应于wy_ask_type的typeid',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '对应于wy_ask_position的posid',
  `data` mediumtext COMMENT '推荐内容',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '站点id',
  `postime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推荐时间',
  `listorder` mediumint(8) DEFAULT '0',
  KEY `posid` (`id`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ask_position_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_ask_question
-- ----------------------------
DROP TABLE IF EXISTS `wy_ask_question`;
CREATE TABLE `wy_ask_question` (
  `questionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增questionid',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '对应于wy_ask_type的typeid',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '站点id',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '提问标题',
  `content` mediumtext NOT NULL COMMENT '提问内容',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '各种状态:0待审核 1已审核 99已解决',
  `posids` varchar(20) NOT NULL DEFAULT '' COMMENT '推荐位',
  `memberid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '会员id 默认为0游客',
  `userid` smallint(6) NOT NULL DEFAULT '0' COMMENT '回复此问题的律师id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '称呼',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提问时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `replytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最新回复时间',
  `comment` mediumtext NOT NULL COMMENT '备注一些信息（联系方式等等）',
  PRIMARY KEY (`questionid`),
  KEY `status` (`status`,`listorder`,`questionid`),
  KEY `listorder` (`typeid`,`status`,`listorder`,`questionid`),
  KEY `typeid` (`typeid`,`status`,`questionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ask_question
-- ----------------------------

-- ----------------------------
-- Table structure for wy_ask_question_hits
-- ----------------------------
DROP TABLE IF EXISTS `wy_ask_question_hits`;
CREATE TABLE `wy_ask_question_hits` (
  `hitsid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增hitsid',
  `questionid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '对应于wy_ask_questionid的questionid',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题点击次数',
  `replys` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '问题回复次数',
  PRIMARY KEY (`hitsid`),
  KEY `questionid` (`questionid`,`hits`,`replys`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ask_question_hits
-- ----------------------------

-- ----------------------------
-- Table structure for wy_ask_reply
-- ----------------------------
DROP TABLE IF EXISTS `wy_ask_reply`;
CREATE TABLE `wy_ask_reply` (
  `replyid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增replyid',
  `questionid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '对应于wy_ask_question的questionid',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '提问标题',
  `content` mediumtext NOT NULL COMMENT '提问内容',
  `memberid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '会员id 默认为0游客',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '称呼',
  `userid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id 默认为0游客',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '各种状态:0待审核 1已审核 99已解决',
  `comment` mediumtext NOT NULL COMMENT '备注一些信息（联系方式等等）',
  PRIMARY KEY (`replyid`),
  KEY `questionid` (`questionid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ask_reply
-- ----------------------------

-- ----------------------------
-- Table structure for wy_ask_setting
-- ----------------------------
DROP TABLE IF EXISTS `wy_ask_setting`;
CREATE TABLE `wy_ask_setting` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '站点id',
  `setting` mediumtext NOT NULL COMMENT '当前站点全局设置'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ask_setting
-- ----------------------------
INSERT INTO `wy_ask_setting` VALUES ('1', '{\"validate\":\"1\",\"interval\":\"0\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\",\"comment\":\"\",\"close\":\"0\",\"audit_ask\":\"0\",\"audit_reply\":\"0\",\"allow_visitors_ask\":\"0\",\"allow_visitors_reply\":\"0\"}');

-- ----------------------------
-- Table structure for wy_ask_type
-- ----------------------------
DROP TABLE IF EXISTS `wy_ask_type`;
CREATE TABLE `wy_ask_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增typeid',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '站点id',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `arrparentid` varchar(255) NOT NULL COMMENT '所有父级id',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '判断是否有子级，0代表没有，1代表有',
  `arrchildid` mediumtext NOT NULL COMMENT '所有子级id',
  `typename` varchar(30) NOT NULL COMMENT '分类名称',
  `items` mediumint(8) NOT NULL DEFAULT '0' COMMENT '问题数量',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `setting` mediumtext NOT NULL COMMENT '当前分类设置',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ask_type
-- ----------------------------
INSERT INTO `wy_ask_type` VALUES ('1', '1', '0', '0', '1', '1,6,3,4,5', '在线咨询', '0', '1', '{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"0\",\"isvisitor_reply\":\"0\",\"interval_time\":\"0\"}');
INSERT INTO `wy_ask_type` VALUES ('2', '1', '0', '0', '0', '2', '一对一咨询', '0', '2', '{\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"0\",\"interval_time\":\"0\"}');
INSERT INTO `wy_ask_type` VALUES ('3', '1', '1', '0,1', '0', '3', '刑事', '0', '3', '{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}');
INSERT INTO `wy_ask_type` VALUES ('4', '1', '1', '0,1', '0', '4', '婚姻', '0', '4', '{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}');
INSERT INTO `wy_ask_type` VALUES ('5', '1', '1', '0,1', '0', '5', '行政', '0', '5', '{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}');
INSERT INTO `wy_ask_type` VALUES ('6', '1', '1', '0,1', '0', '6', '其他', '0', '6', '{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}');

-- ----------------------------
-- Table structure for wy_attachment
-- ----------------------------
DROP TABLE IF EXISTS `wy_attachment`;
CREATE TABLE `wy_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_attachment
-- ----------------------------
INSERT INTO `wy_attachment` VALUES ('1', 'poster', '0', 'banner.jpg', '2017/0313/20170313052550943.jpg', '1094030', 'jpg', '1', '0', '0', '1', '1489397150', '127.0.0.1', '1', 'ee4ea89da19c98e5ed0c71482c4f973c', '1');
INSERT INTO `wy_attachment` VALUES ('6', 'content', '0', 'about.jpg', '2017/0314/20170314094936697.jpg', '77433', 'jpg', '1', '0', '0', '1', '1489456176', '127.0.0.1', '1', 'a33a0c275118fa5ca0d74ccc7c84b282', '1');
INSERT INTO `wy_attachment` VALUES ('21', 'content', '0', 't.jpg', '2017/0324/20170324020012785.jpg', '36364', 'jpg', '1', '0', '0', '1', '1490335212', '120.197.17.140', '1', '2243a9174cc8a7620e05da3f2f76083b', '1');
INSERT INTO `wy_attachment` VALUES ('8', 'content', '0', 'news.jpg', '2017/0314/20170314103423206.jpg', '44913', 'jpg', '1', '0', '0', '1', '1489458863', '127.0.0.1', '1', '0dd659ec248ab1c11933e8838826075c', '1');
INSERT INTO `wy_attachment` VALUES ('22', 'weixin_img', '0', '未标题-1.jpg', '2017/0328/20170328092611692.jpg', '14448', 'jpg', '1', '0', '0', '1', '1490664371', '120.197.17.140', '0', '03a1f4abea4a73e7d45d7072030a82d5', '1');
INSERT INTO `wy_attachment` VALUES ('11', 'member', '0', 'phongicon.png', '2017/0315/20170315022755418.png', '1760', 'png', '1', '0', '0', '1', '1489559275', '127.0.0.1', '0', 'af35e89cf8019a2a1f16b96881d172cd', '1');
INSERT INTO `wy_attachment` VALUES ('14', 'content', '14', 'gift_1.jpg', '2017/0322/20170322094156700.jpg', '24702', 'jpg', '1', '0', '0', '1', '1490146916', '127.0.0.1', '1', '39d408c7de42760dd97e28ced24de86d', '1');
INSERT INTO `wy_attachment` VALUES ('15', 'content', '15', 'gift_1.jpg', '2017/0322/20170322095553572.jpg', '24702', 'jpg', '1', '0', '0', '1', '1490147753', '127.0.0.1', '1', '7f66505fb854d25e2a41dc4807a275bd', '1');
INSERT INTO `wy_attachment` VALUES ('16', 'content', '15', 'gift_2.jpg', '2017/0322/20170322095641711.jpg', '25783', 'jpg', '1', '0', '0', '1', '1490147801', '127.0.0.1', '1', 'e4272eeaac1cd04a3ffbabb87c624ef8', '1');
INSERT INTO `wy_attachment` VALUES ('20', 'content', '0', 't.gif', '2017/0324/20170324105033587.gif', '41519', 'gif', '1', '0', '0', '1', '1490323833', '120.197.17.140', '1', '8ad710dc375f31294e47771a7efe9bd9', '1');
INSERT INTO `wy_attachment` VALUES ('19', 'member', '0', 'img1_huiyuan.jpg', '2017/0323/20170323042524989.jpg', '23795', 'jpg', '1', '0', '0', '1', '1490257523', '192.168.5.59', '0', '7880d3aa482eba496eeee02827ea1069', '1');

-- ----------------------------
-- Table structure for wy_attachment_index
-- ----------------------------
DROP TABLE IF EXISTS `wy_attachment_index`;
CREATE TABLE `wy_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_attachment_index
-- ----------------------------
INSERT INTO `wy_attachment_index` VALUES ('poster-1', '1');
INSERT INTO `wy_attachment_index` VALUES ('poster-2', '1');
INSERT INTO `wy_attachment_index` VALUES ('poster-3', '1');
INSERT INTO `wy_attachment_index` VALUES ('catid-2', '6');
INSERT INTO `wy_attachment_index` VALUES ('c-8-12', '9');
INSERT INTO `wy_attachment_index` VALUES ('catid-5', '8');
INSERT INTO `wy_attachment_index` VALUES ('catid-4', '8');
INSERT INTO `wy_attachment_index` VALUES ('catid-12', '21');
INSERT INTO `wy_attachment_index` VALUES ('c-15-1', '14');
INSERT INTO `wy_attachment_index` VALUES ('c-15-1', '15');
INSERT INTO `wy_attachment_index` VALUES ('c-15-2', '16');
INSERT INTO `wy_attachment_index` VALUES ('c-8-12', '10');
INSERT INTO `wy_attachment_index` VALUES ('c-15-5', '16');
INSERT INTO `wy_attachment_index` VALUES ('c-15-4', '14');

-- ----------------------------
-- Table structure for wy_badword
-- ----------------------------
DROP TABLE IF EXISTS `wy_badword`;
CREATE TABLE `wy_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_badword
-- ----------------------------

-- ----------------------------
-- Table structure for wy_block
-- ----------------------------
DROP TABLE IF EXISTS `wy_block`;
CREATE TABLE `wy_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_block
-- ----------------------------

-- ----------------------------
-- Table structure for wy_block_history
-- ----------------------------
DROP TABLE IF EXISTS `wy_block_history`;
CREATE TABLE `wy_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_block_history
-- ----------------------------

-- ----------------------------
-- Table structure for wy_block_priv
-- ----------------------------
DROP TABLE IF EXISTS `wy_block_priv`;
CREATE TABLE `wy_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_block_priv
-- ----------------------------

-- ----------------------------
-- Table structure for wy_cache
-- ----------------------------
DROP TABLE IF EXISTS `wy_cache`;
CREATE TABLE `wy_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_cache
-- ----------------------------
INSERT INTO `wy_cache` VALUES ('sitelist.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'志公恒律师服务网\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://www.fl880.com/\',\n    \'site_title\' => \'合肥民商事案件代理律师|合肥刑事风险防范律师|合肥行政复议和诉讼律师|合肥中小企业法律顾问律师-志公恒信律师服务网\',\n    \'keywords\' => \'合肥民商事案件代理律师,合肥刑事风险防范律师,合肥行政复议和诉讼律师，合肥中小企业法律顾问律师,志公恒信律师服务网\',\n    \'description\' => \'志公恒信律师服务宗旨：传播法律知识，提高法律意识，预防法律风险解决法律纠纷，提供民事类，刑事类，行政类等多类法律服务，咨询热线：0551-62370148\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'infos\' => \'{\"picture\":\"\",\"name\":\"\\\\u5218\\\\u5723\\\\u6d77\\\\u5f8b\\\\u5e08\",\"area\":\"\\\\u5408\\\\u80a5\\\\u5e02\\\\u7476\\\\u6d77\\\\u533a\\\\u51e4\\\\u9633\\\\u897f\\\\u8def\\\\u6052\\\\u4e30\\\\u56fd\\\\u9645\\\\u5927\\\\u53a61106\\\\u5ba4\",\"license\":\"\",\"company\":\"\",\"duty\":\"\",\"copyright\":\"Copyright \\\\u00a9 2017 www.fl880.comAll Rights Reserved \\\\u7696ICP\\\\u590716025197\\\\u53f7-1\",\"email\":\"lshyn@163.com\",\"mobile\":\"13955183488\",\"qq\":\"1026615417\",\"tel\":\"0551-62370148\",\"fax\":\"\",\"address\":\"\",\"postcode\":\"\",\"weixin_img\":\"http:\\\\/\\\\/www.fl880.com\\\\/uploadfile\\\\/2017\\\\/0328\\\\/20170328092611692.jpg\",\"qq_weibo\":\"\",\"sina_weibo\":\"\"}\',\n    \'setting\' => \'{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"1\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"skins\\\\/images\\\\/water\\\\/\\\\/statics\\\\/images\\\\/water\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}\',\n    \'uuid\' => \'51e3092e-e66b-11e5-b74c-04848a28274f\',\n    \'url\' => \'http://www.fl880.com/\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('modules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'{\"admin_email\":\"wycms@wanglv.com\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.163.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"howecc@163.com\",\"mail_auth\":\"1\",\"mail_from\":\"howecc@163.com\",\"mail_password\":\"wy2305811\",\"errorlog_size\":\"20\"}\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'{\"allowregister\":\"1\",\"choosemodel\":\"1\",\"enablemailcheck\":\"0\",\"enablcodecheck\":\"1\",\"mobile_checktype\":\"0\",\"user_sendsms_title\":\"\",\"registerverify\":\"1\",\"showapppoint\":\"1\",\"rmb_point_rate\":\"10\",\"defualtpoint\":\"30\",\"defualtamount\":\"0\",\"showregprotocol\":\"0\",\"regprotocol\":\"\\\\t\\\\t \\\\u6b22\\\\u8fce\\\\u60a8\\\\u6ce8\\\\u518c\\\\u6210\\\\u4e3awycms\\\\u7528\\\\u6237\\\\r\\\\n\\\\u8bf7\\\\u4ed4\\\\u7ec6\\\\u9605\\\\u8bfb\\\\u4e0b\\\\u9762\\\\u7684\\\\u534f\\\\u8bae\\\\uff0c\\\\u53ea\\\\u6709\\\\u63a5\\\\u53d7\\\\u534f\\\\u8bae\\\\u624d\\\\u80fd\\\\u7ee7\\\\u7eed\\\\u8fdb\\\\u884c\\\\u6ce8\\\\u518c\\\\u3002 \\\\r\\\\n1\\\\uff0e\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u7684\\\\u786e\\\\u8ba4\\\\u548c\\\\u63a5\\\\u7eb3\\\\r\\\\n\\\\u3000\\\\u3000wycms\\\\u7528\\\\u6237\\\\u670d\\\\u52a1\\\\u7684\\\\u6240\\\\u6709\\\\u6743\\\\u548c\\\\u8fd0\\\\u4f5c\\\\u6743\\\\u5f52wycms\\\\u62e5\\\\u6709\\\\u3002wycms\\\\u6240\\\\u63d0\\\\u4f9b\\\\u7684\\\\u670d\\\\u52a1\\\\u5c06\\\\u6309\\\\u7167\\\\u6709\\\\u5173\\\\u7ae0\\\\u7a0b\\\\u3001\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u548c\\\\u64cd\\\\u4f5c\\\\u89c4\\\\u5219\\\\u4e25\\\\u683c\\\\u6267\\\\u884c\\\\u3002\\\\u7528\\\\u6237\\\\u901a\\\\u8fc7\\\\u6ce8\\\\u518c\\\\u7a0b\\\\u5e8f\\\\u70b9\\\\u51fb\\\\u201c\\\\u6211\\\\u540c\\\\u610f\\\\u201d \\\\u6309\\\\u94ae\\\\uff0c\\\\u5373\\\\u8868\\\\u793a\\\\u7528\\\\u6237\\\\u4e0ewycms\\\\u8fbe\\\\u6210\\\\u534f\\\\u8bae\\\\u5e76\\\\u63a5\\\\u53d7\\\\u6240\\\\u6709\\\\u7684\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u3002\\\\r\\\\n2\\\\uff0e wycms\\\\u670d\\\\u52a1\\\\u7b80\\\\u4ecb\\\\r\\\\n\\\\u3000\\\\u3000wycms\\\\u901a\\\\u8fc7\\\\u56fd\\\\u9645\\\\u4e92\\\\u8054\\\\u7f51\\\\u4e3a\\\\u7528\\\\u6237\\\\u63d0\\\\u4f9b\\\\u65b0\\\\u95fb\\\\u53ca\\\\u6587\\\\u7ae0\\\\u6d4f\\\\u89c8\\\\u3001\\\\u56fe\\\\u7247\\\\u6d4f\\\\u89c8\\\\u3001\\\\u8f6f\\\\u4ef6\\\\u4e0b\\\\u8f7d\\\\u3001\\\\u7f51\\\\u4e0a\\\\u7559\\\\u8a00\\\\u548cBBS\\\\u8bba\\\\u575b\\\\u7b49\\\\u670d\\\\u52a1\\\\u3002\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u5fc5\\\\u987b\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u8d2d\\\\u7f6e\\\\u8bbe\\\\u5907\\\\uff0c\\\\u5305\\\\u62ec\\\\u4e2a\\\\u4eba\\\\u7535\\\\u8111\\\\u4e00\\\\u53f0\\\\u3001\\\\u8c03\\\\u5236\\\\u89e3\\\\u8c03\\\\u5668\\\\u4e00\\\\u4e2a\\\\u53ca\\\\u914d\\\\u5907\\\\u4e0a\\\\u7f51\\\\u88c5\\\\u7f6e\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4e2a\\\\u4eba\\\\u4e0a\\\\u7f51\\\\u548c\\\\u652f\\\\u4ed8\\\\u4e0e\\\\u6b64\\\\u670d\\\\u52a1\\\\u6709\\\\u5173\\\\u7684\\\\u7535\\\\u8bdd\\\\u8d39\\\\u7528\\\\u3001\\\\u7f51\\\\u7edc\\\\u8d39\\\\u7528\\\\u3002\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u540c\\\\u610f\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u63d0\\\\u4f9b\\\\u53ca\\\\u65f6\\\\u3001\\\\u8be6\\\\u5c3d\\\\u53ca\\\\u51c6\\\\u786e\\\\u7684\\\\u4e2a\\\\u4eba\\\\u8d44\\\\u6599\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4e0d\\\\u65ad\\\\u66f4\\\\u65b0\\\\u6ce8\\\\u518c\\\\u8d44\\\\u6599\\\\uff0c\\\\u7b26\\\\u5408\\\\u53ca\\\\u65f6\\\\u3001\\\\u8be6\\\\u5c3d\\\\u3001\\\\u51c6\\\\u786e\\\\u7684\\\\u8981\\\\u6c42\\\\u3002\\\\u6240\\\\u6709\\\\u539f\\\\u59cb\\\\u952e\\\\u5165\\\\u7684\\\\u8d44\\\\u6599\\\\u5c06\\\\u5f15\\\\u7528\\\\u4e3a\\\\u6ce8\\\\u518c\\\\u8d44\\\\u6599\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30003)\\\\u7528\\\\u6237\\\\u540c\\\\u610f\\\\u9075\\\\u5b88\\\\u300a\\\\u4e2d\\\\u534e\\\\u4eba\\\\u6c11\\\\u5171\\\\u548c\\\\u56fd\\\\u4fdd\\\\u5b88\\\\u56fd\\\\u5bb6\\\\u79d8\\\\u5bc6\\\\u6cd5\\\\u300b\\\\u3001\\\\u300a\\\\u4e2d\\\\u534e\\\\u4eba\\\\u6c11\\\\u5171\\\\u548c\\\\u56fd\\\\u8ba1\\\\u7b97\\\\u673a\\\\u4fe1\\\\u606f\\\\u7cfb\\\\u7edf\\\\u5b89\\\\u5168\\\\u4fdd\\\\u62a4\\\\u6761\\\\u4f8b\\\\u300b\\\\u3001\\\\u300a\\\\u8ba1\\\\u7b97\\\\u673a\\\\u8f6f\\\\u4ef6\\\\u4fdd\\\\u62a4\\\\u6761\\\\u4f8b\\\\u300b\\\\u7b49\\\\u6709\\\\u5173\\\\u8ba1\\\\u7b97\\\\u673a\\\\u53ca\\\\u4e92\\\\u8054\\\\u7f51\\\\u89c4\\\\u5b9a\\\\u7684\\\\u6cd5\\\\u5f8b\\\\u548c\\\\u6cd5\\\\u89c4\\\\u3001\\\\u5b9e\\\\u65bd\\\\u529e\\\\u6cd5\\\\u3002\\\\u5728\\\\u4efb\\\\u4f55\\\\u60c5\\\\u51b5\\\\u4e0b\\\\uff0cwycms\\\\u5408\\\\u7406\\\\u5730\\\\u8ba4\\\\u4e3a\\\\u7528\\\\u6237\\\\u7684\\\\u884c\\\\u4e3a\\\\u53ef\\\\u80fd\\\\u8fdd\\\\u53cd\\\\u4e0a\\\\u8ff0\\\\u6cd5\\\\u5f8b\\\\u3001\\\\u6cd5\\\\u89c4\\\\uff0cwycms\\\\u53ef\\\\u4ee5\\\\u5728\\\\u4efb\\\\u4f55\\\\u65f6\\\\u5019\\\\uff0c\\\\u4e0d\\\\u7ecf\\\\u4e8b\\\\u5148\\\\u901a\\\\u77e5\\\\u7ec8\\\\u6b62\\\\u5411\\\\u8be5\\\\u7528\\\\u6237\\\\u63d0\\\\u4f9b\\\\u670d\\\\u52a1\\\\u3002\\\\u7528\\\\u6237\\\\u5e94\\\\u4e86\\\\u89e3\\\\u56fd\\\\u9645\\\\u4e92\\\\u8054\\\\u7f51\\\\u7684\\\\u65e0\\\\u56fd\\\\u754c\\\\u6027\\\\uff0c\\\\u5e94\\\\u7279\\\\u522b\\\\u6ce8\\\\u610f\\\\u9075\\\\u5b88\\\\u5f53\\\\u5730\\\\u6240\\\\u6709\\\\u6709\\\\u5173\\\\u7684\\\\u6cd5\\\\u5f8b\\\\u548c\\\\u6cd5\\\\u89c4\\\\u3002\\\\r\\\\n3\\\\uff0e \\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u7684\\\\u4fee\\\\u6539\\\\r\\\\n\\\\u3000\\\\u3000wycms\\\\u4f1a\\\\u4e0d\\\\u5b9a\\\\u65f6\\\\u5730\\\\u4fee\\\\u6539\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\uff0c\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\\u4e00\\\\u65e6\\\\u53d1\\\\u751f\\\\u53d8\\\\u52a8\\\\uff0c\\\\u5c06\\\\u4f1a\\\\u5728\\\\u76f8\\\\u5173\\\\u9875\\\\u9762\\\\u4e0a\\\\u63d0\\\\u793a\\\\u4fee\\\\u6539\\\\u5185\\\\u5bb9\\\\u3002\\\\u5982\\\\u679c\\\\u60a8\\\\u540c\\\\u610f\\\\u6539\\\\u52a8\\\\uff0c\\\\u5219\\\\u518d\\\\u4e00\\\\u6b21\\\\u70b9\\\\u51fb\\\\u201c\\\\u6211\\\\u540c\\\\u610f\\\\u201d\\\\u6309\\\\u94ae\\\\u3002 \\\\u5982\\\\u679c\\\\u60a8\\\\u4e0d\\\\u63a5\\\\u53d7\\\\uff0c\\\\u5219\\\\u53ca\\\\u65f6\\\\u53d6\\\\u6d88\\\\u60a8\\\\u7684\\\\u7528\\\\u6237\\\\u4f7f\\\\u7528\\\\u670d\\\\u52a1\\\\u8d44\\\\u683c\\\\u3002\\\\r\\\\n4\\\\uff0e \\\\u670d\\\\u52a1\\\\u4fee\\\\u8ba2\\\\r\\\\n\\\\u3000\\\\u3000wycms\\\\u4fdd\\\\u7559\\\\u968f\\\\u65f6\\\\u4fee\\\\u6539\\\\u6216\\\\u4e2d\\\\u65ad\\\\u670d\\\\u52a1\\\\u800c\\\\u4e0d\\\\u9700\\\\u77e5\\\\u7167\\\\u7528\\\\u6237\\\\u7684\\\\u6743\\\\u5229\\\\u3002wycms\\\\u884c\\\\u4f7f\\\\u4fee\\\\u6539\\\\u6216\\\\u4e2d\\\\u65ad\\\\u670d\\\\u52a1\\\\u7684\\\\u6743\\\\u5229\\\\uff0c\\\\u4e0d\\\\u9700\\\\u5bf9\\\\u7528\\\\u6237\\\\u6216\\\\u7b2c\\\\u4e09\\\\u65b9\\\\u8d1f\\\\u8d23\\\\u3002\\\\r\\\\n5\\\\uff0e \\\\u7528\\\\u6237\\\\u9690\\\\u79c1\\\\u5236\\\\u5ea6\\\\r\\\\n\\\\u3000\\\\u3000\\\\u5c0a\\\\u91cd\\\\u7528\\\\u6237\\\\u4e2a\\\\u4eba\\\\u9690\\\\u79c1\\\\u662fwycms\\\\u7684 \\\\u57fa\\\\u672c\\\\u653f\\\\u7b56\\\\u3002wycms\\\\u4e0d\\\\u4f1a\\\\u516c\\\\u5f00\\\\u3001\\\\u7f16\\\\u8f91\\\\u6216\\\\u900f\\\\u9732\\\\u7528\\\\u6237\\\\u7684\\\\u6ce8\\\\u518c\\\\u4fe1\\\\u606f\\\\uff0c\\\\u9664\\\\u975e\\\\u6709\\\\u6cd5\\\\u5f8b\\\\u8bb8\\\\u53ef\\\\u8981\\\\u6c42\\\\uff0c\\\\u6216wycms\\\\u5728\\\\u8bda\\\\u4fe1\\\\u7684\\\\u57fa\\\\u7840\\\\u4e0a\\\\u8ba4\\\\u4e3a\\\\u900f\\\\u9732\\\\u8fd9\\\\u4e9b\\\\u4fe1\\\\u606f\\\\u5728\\\\u4ee5\\\\u4e0b\\\\u4e09\\\\u79cd\\\\u60c5\\\\u51b5\\\\u662f\\\\u5fc5\\\\u8981\\\\u7684\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u9075\\\\u5b88\\\\u6709\\\\u5173\\\\u6cd5\\\\u5f8b\\\\u89c4\\\\u5b9a\\\\uff0c\\\\u9075\\\\u4ece\\\\u5408\\\\u6cd5\\\\u670d\\\\u52a1\\\\u7a0b\\\\u5e8f\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4fdd\\\\u6301\\\\u7ef4\\\\u62a4wycms\\\\u7684\\\\u5546\\\\u6807\\\\u6240\\\\u6709\\\\u6743\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30003)\\\\u5728\\\\u7d27\\\\u6025\\\\u60c5\\\\u51b5\\\\u4e0b\\\\u7aed\\\\u529b\\\\u7ef4\\\\u62a4\\\\u7528\\\\u6237\\\\u4e2a\\\\u4eba\\\\u548c\\\\u793e\\\\u4f1a\\\\u5927\\\\u4f17\\\\u7684\\\\u9690\\\\u79c1\\\\u5b89\\\\u5168\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30004)\\\\u7b26\\\\u5408\\\\u5176\\\\u4ed6\\\\u76f8\\\\u5173\\\\u7684\\\\u8981\\\\u6c42\\\\u3002 \\\\r\\\\n6\\\\uff0e\\\\u7528\\\\u6237\\\\u7684\\\\u5e10\\\\u53f7\\\\uff0c\\\\u5bc6\\\\u7801\\\\u548c\\\\u5b89\\\\u5168\\\\u6027\\\\r\\\\n\\\\u3000\\\\u3000\\\\u4e00\\\\u65e6\\\\u6ce8\\\\u518c\\\\u6210\\\\u529f\\\\u6210\\\\u4e3awycms\\\\u7528\\\\u6237\\\\uff0c\\\\u60a8\\\\u5c06\\\\u5f97\\\\u5230\\\\u4e00\\\\u4e2a\\\\u5bc6\\\\u7801\\\\u548c\\\\u5e10\\\\u53f7\\\\u3002\\\\u5982\\\\u679c\\\\u60a8\\\\u4e0d\\\\u4fdd\\\\u7ba1\\\\u597d\\\\u81ea\\\\u5df1\\\\u7684\\\\u5e10\\\\u53f7\\\\u548c\\\\u5bc6\\\\u7801\\\\u5b89\\\\u5168\\\\uff0c\\\\u5c06\\\\u5bf9\\\\u56e0\\\\u6b64\\\\u4ea7\\\\u751f\\\\u7684\\\\u540e\\\\u679c\\\\u8d1f\\\\u5168\\\\u90e8\\\\u8d23\\\\u4efb\\\\u3002\\\\u53e6\\\\u5916\\\\uff0c\\\\u6bcf\\\\u4e2a\\\\u7528\\\\u6237\\\\u90fd\\\\u8981\\\\u5bf9\\\\u5176\\\\u5e10\\\\u6237\\\\u4e2d\\\\u7684\\\\u6240\\\\u6709\\\\u6d3b\\\\u52a8\\\\u548c\\\\u4e8b\\\\u4ef6\\\\u8d1f\\\\u5168\\\\u8d23\\\\u3002\\\\u60a8\\\\u53ef\\\\u968f\\\\u65f6\\\\u6839\\\\u636e\\\\u6307\\\\u793a\\\\u6539\\\\u53d8\\\\u60a8\\\\u7684\\\\u5bc6\\\\u7801\\\\uff0c\\\\u4e5f\\\\u53ef\\\\u4ee5\\\\u7ed3\\\\u675f\\\\u65e7\\\\u7684\\\\u5e10\\\\u6237\\\\u91cd\\\\u5f00\\\\u4e00\\\\u4e2a\\\\u65b0\\\\u5e10\\\\u6237\\\\u3002\\\\u7528\\\\u6237\\\\u540c\\\\u610f\\\\u82e5\\\\u53d1\\\\u73b0\\\\u4efb\\\\u4f55\\\\u975e\\\\u6cd5\\\\u4f7f\\\\u7528\\\\u7528\\\\u6237\\\\u5e10\\\\u53f7\\\\u6216\\\\u5b89\\\\u5168\\\\u6f0f\\\\u6d1e\\\\u7684\\\\u60c5\\\\u51b5\\\\uff0c\\\\u7acb\\\\u5373\\\\u901a\\\\u77e5wycms\\\\u3002\\\\r\\\\n7\\\\uff0e \\\\u514d\\\\u8d23\\\\u6761\\\\u6b3e\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u660e\\\\u786e\\\\u540c\\\\u610f\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u7684\\\\u4f7f\\\\u7528\\\\u7531\\\\u7528\\\\u6237\\\\u4e2a\\\\u4eba\\\\u627f\\\\u62c5\\\\u98ce\\\\u9669\\\\u3002 \\\\u3000\\\\u3000 \\\\r\\\\n\\\\u3000\\\\u3000wycms\\\\u4e0d\\\\u4f5c\\\\u4efb\\\\u4f55\\\\u7c7b\\\\u578b\\\\u7684\\\\u62c5\\\\u4fdd\\\\uff0c\\\\u4e0d\\\\u62c5\\\\u4fdd\\\\u670d\\\\u52a1\\\\u4e00\\\\u5b9a\\\\u80fd\\\\u6ee1\\\\u8db3\\\\u7528\\\\u6237\\\\u7684\\\\u8981\\\\u6c42\\\\uff0c\\\\u4e5f\\\\u4e0d\\\\u62c5\\\\u4fdd\\\\u670d\\\\u52a1\\\\u4e0d\\\\u4f1a\\\\u53d7\\\\u4e2d\\\\u65ad\\\\uff0c\\\\u5bf9\\\\u670d\\\\u52a1\\\\u7684\\\\u53ca\\\\u65f6\\\\u6027\\\\uff0c\\\\u5b89\\\\u5168\\\\u6027\\\\uff0c\\\\u51fa\\\\u9519\\\\u53d1\\\\u751f\\\\u90fd\\\\u4e0d\\\\u4f5c\\\\u62c5\\\\u4fdd\\\\u3002\\\\u7528\\\\u6237\\\\u7406\\\\u89e3\\\\u5e76\\\\u63a5\\\\u53d7\\\\uff1a\\\\u4efb\\\\u4f55\\\\u901a\\\\u8fc7wycms\\\\u670d\\\\u52a1\\\\u53d6\\\\u5f97\\\\u7684\\\\u4fe1\\\\u606f\\\\u8d44\\\\u6599\\\\u7684\\\\u53ef\\\\u9760\\\\u6027\\\\u53d6\\\\u51b3\\\\u4e8e\\\\u7528\\\\u6237\\\\u81ea\\\\u5df1\\\\uff0c\\\\u7528\\\\u6237\\\\u81ea\\\\u5df1\\\\u627f\\\\u62c5\\\\u6240\\\\u6709\\\\u98ce\\\\u9669\\\\u548c\\\\u8d23\\\\u4efb\\\\u3002 \\\\r\\\\n8\\\\uff0e\\\\u6709\\\\u9650\\\\u8d23\\\\u4efb\\\\r\\\\n\\\\u3000\\\\u3000wycms\\\\u5bf9\\\\u4efb\\\\u4f55\\\\u76f4\\\\u63a5\\\\u3001\\\\u95f4\\\\u63a5\\\\u3001\\\\u5076\\\\u7136\\\\u3001\\\\u7279\\\\u6b8a\\\\u53ca\\\\u7ee7\\\\u8d77\\\\u7684\\\\u635f\\\\u5bb3\\\\u4e0d\\\\u8d1f\\\\u8d23\\\\u4efb\\\\u3002\\\\r\\\\n9\\\\uff0e \\\\u4e0d\\\\u63d0\\\\u4f9b\\\\u96f6\\\\u552e\\\\u548c\\\\u5546\\\\u4e1a\\\\u6027\\\\u670d\\\\u52a1 \\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u4f7f\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u7684\\\\u6743\\\\u5229\\\\u662f\\\\u4e2a\\\\u4eba\\\\u7684\\\\u3002\\\\u7528\\\\u6237\\\\u53ea\\\\u80fd\\\\u662f\\\\u4e00\\\\u4e2a\\\\u5355\\\\u72ec\\\\u7684\\\\u4e2a\\\\u4f53\\\\u800c\\\\u4e0d\\\\u80fd\\\\u662f\\\\u4e00\\\\u4e2a\\\\u516c\\\\u53f8\\\\u6216\\\\u5b9e\\\\u4f53\\\\u5546\\\\u4e1a\\\\u6027\\\\u7ec4\\\\u7ec7\\\\u3002\\\\u7528\\\\u6237\\\\u627f\\\\u8bfa\\\\u4e0d\\\\u7ecfwycms\\\\u540c\\\\u610f\\\\uff0c\\\\u4e0d\\\\u80fd\\\\u5229\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u8fdb\\\\u884c\\\\u9500\\\\u552e\\\\u6216\\\\u5176\\\\u4ed6\\\\u5546\\\\u4e1a\\\\u7528\\\\u9014\\\\u3002\\\\r\\\\n10\\\\uff0e\\\\u7528\\\\u6237\\\\u8d23\\\\u4efb \\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u5355\\\\u72ec\\\\u627f\\\\u62c5\\\\u4f20\\\\u8f93\\\\u5185\\\\u5bb9\\\\u7684\\\\u8d23\\\\u4efb\\\\u3002\\\\u7528\\\\u6237\\\\u5fc5\\\\u987b\\\\u9075\\\\u5faa\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u30001)\\\\u4ece\\\\u4e2d\\\\u56fd\\\\u5883\\\\u5185\\\\u5411\\\\u5916\\\\u4f20\\\\u8f93\\\\u6280\\\\u672f\\\\u6027\\\\u8d44\\\\u6599\\\\u65f6\\\\u5fc5\\\\u987b\\\\u7b26\\\\u5408\\\\u4e2d\\\\u56fd\\\\u6709\\\\u5173\\\\u6cd5\\\\u89c4\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30002)\\\\u4f7f\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u4e0d\\\\u4f5c\\\\u975e\\\\u6cd5\\\\u7528\\\\u9014\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30003)\\\\u4e0d\\\\u5e72\\\\u6270\\\\u6216\\\\u6df7\\\\u4e71\\\\u7f51\\\\u7edc\\\\u670d\\\\u52a1\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30004)\\\\u4e0d\\\\u5728\\\\u8bba\\\\u575bBBS\\\\u6216\\\\u7559\\\\u8a00\\\\u7c3f\\\\u53d1\\\\u8868\\\\u4efb\\\\u4f55\\\\u4e0e\\\\u653f\\\\u6cbb\\\\u76f8\\\\u5173\\\\u7684\\\\u4fe1\\\\u606f\\\\u3002 \\\\r\\\\n\\\\u3000\\\\u30005)\\\\u9075\\\\u5b88\\\\u6240\\\\u6709\\\\u4f7f\\\\u7528\\\\u7f51\\\\u7ad9\\\\u670d\\\\u52a1\\\\u7684\\\\u7f51\\\\u7edc\\\\u534f\\\\u8bae\\\\u3001\\\\u89c4\\\\u5b9a\\\\u3001\\\\u7a0b\\\\u5e8f\\\\u548c\\\\u60ef\\\\u4f8b\\\\u3002\\\\r\\\\n\\\\u3000\\\\u30006)\\\\u4e0d\\\\u5f97\\\\u5229\\\\u7528\\\\u672c\\\\u7ad9\\\\u5371\\\\u5bb3\\\\u56fd\\\\u5bb6\\\\u5b89\\\\u5168\\\\u3001\\\\u6cc4\\\\u9732\\\\u56fd\\\\u5bb6\\\\u79d8\\\\u5bc6\\\\uff0c\\\\u4e0d\\\\u5f97\\\\u4fb5\\\\u72af\\\\u56fd\\\\u5bb6\\\\u793e\\\\u4f1a\\\\u96c6\\\\u4f53\\\\u7684\\\\u548c\\\\u516c\\\\u6c11\\\\u7684\\\\u5408\\\\u6cd5\\\\u6743\\\\u76ca\\\\u3002\\\\r\\\\n\\\\u3000\\\\u30007)\\\\u4e0d\\\\u5f97\\\\u5229\\\\u7528\\\\u672c\\\\u7ad9\\\\u5236\\\\u4f5c\\\\u3001\\\\u590d\\\\u5236\\\\u548c\\\\u4f20\\\\u64ad\\\\u4e0b\\\\u5217\\\\u4fe1\\\\u606f\\\\uff1a \\\\r\\\\n\\\\u3000\\\\u3000\\\\u30001\\\\u3001\\\\u717d\\\\u52a8\\\\u6297\\\\u62d2\\\\u3001\\\\u7834\\\\u574f\\\\u5baa\\\\u6cd5\\\\u548c\\\\u6cd5\\\\u5f8b\\\\u3001\\\\u884c\\\\u653f\\\\u6cd5\\\\u89c4\\\\u5b9e\\\\u65bd\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30002\\\\u3001\\\\u717d\\\\u52a8\\\\u98a0\\\\u8986\\\\u56fd\\\\u5bb6\\\\u653f\\\\u6743\\\\uff0c\\\\u63a8\\\\u7ffb\\\\u793e\\\\u4f1a\\\\u4e3b\\\\u4e49\\\\u5236\\\\u5ea6\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30003\\\\u3001\\\\u717d\\\\u52a8\\\\u5206\\\\u88c2\\\\u56fd\\\\u5bb6\\\\u3001\\\\u7834\\\\u574f\\\\u56fd\\\\u5bb6\\\\u7edf\\\\u4e00\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30004\\\\u3001\\\\u717d\\\\u52a8\\\\u6c11\\\\u65cf\\\\u4ec7\\\\u6068\\\\u3001\\\\u6c11\\\\u65cf\\\\u6b67\\\\u89c6\\\\uff0c\\\\u7834\\\\u574f\\\\u6c11\\\\u65cf\\\\u56e2\\\\u7ed3\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30005\\\\u3001\\\\u634f\\\\u9020\\\\u6216\\\\u8005\\\\u6b6a\\\\u66f2\\\\u4e8b\\\\u5b9e\\\\uff0c\\\\u6563\\\\u5e03\\\\u8c23\\\\u8a00\\\\uff0c\\\\u6270\\\\u4e71\\\\u793e\\\\u4f1a\\\\u79e9\\\\u5e8f\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30006\\\\u3001\\\\u5ba3\\\\u626c\\\\u5c01\\\\u5efa\\\\u8ff7\\\\u4fe1\\\\u3001\\\\u6deb\\\\u79fd\\\\u3001\\\\u8272\\\\u60c5\\\\u3001\\\\u8d4c\\\\u535a\\\\u3001\\\\u66b4\\\\u529b\\\\u3001\\\\u51f6\\\\u6740\\\\u3001\\\\u6050\\\\u6016\\\\u3001\\\\u6559\\\\u5506\\\\u72af\\\\u7f6a\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30007\\\\u3001\\\\u516c\\\\u7136\\\\u4fae\\\\u8fb1\\\\u4ed6\\\\u4eba\\\\u6216\\\\u8005\\\\u634f\\\\u9020\\\\u4e8b\\\\u5b9e\\\\u8bfd\\\\u8c24\\\\u4ed6\\\\u4eba\\\\u7684\\\\uff0c\\\\u6216\\\\u8005\\\\u8fdb\\\\u884c\\\\u5176\\\\u4ed6\\\\u6076\\\\u610f\\\\u653b\\\\u51fb\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30008\\\\u3001\\\\u635f\\\\u5bb3\\\\u56fd\\\\u5bb6\\\\u673a\\\\u5173\\\\u4fe1\\\\u8a89\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u30009\\\\u3001\\\\u5176\\\\u4ed6\\\\u8fdd\\\\u53cd\\\\u5baa\\\\u6cd5\\\\u548c\\\\u6cd5\\\\u5f8b\\\\u884c\\\\u653f\\\\u6cd5\\\\u89c4\\\\u7684\\\\uff1b\\\\r\\\\n\\\\u3000\\\\u3000\\\\u300010\\\\u3001\\\\u8fdb\\\\u884c\\\\u5546\\\\u4e1a\\\\u5e7f\\\\u544a\\\\u884c\\\\u4e3a\\\\u7684\\\\u3002\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u4e0d\\\\u80fd\\\\u4f20\\\\u8f93\\\\u4efb\\\\u4f55\\\\u6559\\\\u5506\\\\u4ed6\\\\u4eba\\\\u6784\\\\u6210\\\\u72af\\\\u7f6a\\\\u884c\\\\u4e3a\\\\u7684\\\\u8d44\\\\u6599\\\\uff1b\\\\u4e0d\\\\u80fd\\\\u4f20\\\\u8f93\\\\u957f\\\\u56fd\\\\u5185\\\\u4e0d\\\\u5229\\\\u6761\\\\u4ef6\\\\u548c\\\\u6d89\\\\u53ca\\\\u56fd\\\\u5bb6\\\\u5b89\\\\u5168\\\\u7684\\\\u8d44\\\\u6599\\\\uff1b\\\\u4e0d\\\\u80fd\\\\u4f20\\\\u8f93\\\\u4efb\\\\u4f55\\\\u4e0d\\\\u7b26\\\\u5408\\\\u5f53\\\\u5730\\\\u6cd5\\\\u89c4\\\\u3001\\\\u56fd\\\\u5bb6\\\\u6cd5\\\\u5f8b\\\\u548c\\\\u56fd\\\\u9645\\\\u6cd5 \\\\u5f8b\\\\u7684\\\\u8d44\\\\u6599\\\\u3002\\\\u672a\\\\u7ecf\\\\u8bb8\\\\u53ef\\\\u800c\\\\u975e\\\\u6cd5\\\\u8fdb\\\\u5165\\\\u5176\\\\u5b83\\\\u7535\\\\u8111\\\\u7cfb\\\\u7edf\\\\u662f\\\\u7981\\\\u6b62\\\\u7684\\\\u3002\\\\u82e5\\\\u7528\\\\u6237\\\\u7684\\\\u884c\\\\u4e3a\\\\u4e0d\\\\u7b26\\\\u5408\\\\u4ee5\\\\u4e0a\\\\u7684\\\\u6761\\\\u6b3e\\\\uff0cwycms\\\\u5c06\\\\u53d6\\\\u6d88\\\\u7528\\\\u6237\\\\u670d\\\\u52a1\\\\u5e10\\\\u53f7\\\\u3002\\\\r\\\\n11\\\\uff0e\\\\u7f51\\\\u7ad9\\\\u5185\\\\u5bb9\\\\u7684\\\\u6240\\\\u6709\\\\u6743\\\\r\\\\n\\\\u3000\\\\u3000wycms\\\\u5b9a\\\\u4e49\\\\u7684\\\\u5185\\\\u5bb9\\\\u5305\\\\u62ec\\\\uff1a\\\\u6587\\\\u5b57\\\\u3001\\\\u8f6f\\\\u4ef6\\\\u3001\\\\u58f0\\\\u97f3\\\\u3001\\\\u76f8\\\\u7247\\\\u3001\\\\u5f55\\\\u8c61\\\\u3001\\\\u56fe\\\\u8868\\\\uff1b\\\\u5728\\\\u5e7f\\\\u544a\\\\u4e2d\\\\u5168\\\\u90e8\\\\u5185\\\\u5bb9\\\\uff1b\\\\u7535\\\\u5b50\\\\u90ae\\\\u4ef6\\\\u7684\\\\u5168\\\\u90e8\\\\u5185\\\\u5bb9\\\\uff1bwycms\\\\u4e3a\\\\u7528\\\\u6237\\\\u63d0\\\\u4f9b\\\\u7684\\\\u5546\\\\u4e1a\\\\u4fe1\\\\u606f\\\\u3002\\\\u6240\\\\u6709\\\\u8fd9\\\\u4e9b\\\\u5185\\\\u5bb9\\\\u53d7\\\\u7248\\\\u6743\\\\u3001\\\\u5546\\\\u6807\\\\u3001\\\\u6807\\\\u7b7e\\\\u548c\\\\u5176\\\\u5b83\\\\u8d22\\\\u4ea7\\\\u6240\\\\u6709\\\\u6743\\\\u6cd5\\\\u5f8b\\\\u7684\\\\u4fdd\\\\u62a4\\\\u3002\\\\u6240\\\\u4ee5\\\\uff0c\\\\u7528\\\\u6237\\\\u53ea\\\\u80fd\\\\u5728wycms\\\\u548c\\\\u5e7f\\\\u544a\\\\u5546\\\\u6388\\\\u6743\\\\u4e0b\\\\u624d\\\\u80fd\\\\u4f7f\\\\u7528\\\\u8fd9\\\\u4e9b\\\\u5185\\\\u5bb9\\\\uff0c\\\\u800c\\\\u4e0d\\\\u80fd\\\\u64c5\\\\u81ea\\\\u590d\\\\u5236\\\\u3001\\\\u7be1\\\\u6539\\\\u8fd9\\\\u4e9b\\\\u5185\\\\u5bb9\\\\u3001\\\\u6216\\\\u521b\\\\u9020\\\\u4e0e\\\\u5185\\\\u5bb9\\\\u6709\\\\u5173\\\\u7684\\\\u6d3e\\\\u751f\\\\u4ea7\\\\u54c1\\\\u3002\\\\r\\\\n12\\\\uff0e\\\\u9644\\\\u52a0\\\\u4fe1\\\\u606f\\\\u670d\\\\u52a1\\\\r\\\\n\\\\u3000\\\\u3000\\\\u7528\\\\u6237\\\\u5728\\\\u4eab\\\\u7528wycms\\\\u63d0\\\\u4f9b\\\\u7684\\\\u514d\\\\u8d39\\\\u670d\\\\u52a1\\\\u7684\\\\u540c\\\\u65f6\\\\uff0c\\\\u540c\\\\u610f\\\\u63a5\\\\u53d7wycms\\\\u63d0\\\\u4f9b\\\\u7684\\\\u5404\\\\u7c7b\\\\u9644\\\\u52a0\\\\u4fe1\\\\u606f\\\\u670d\\\\u52a1\\\\u3002\\\\r\\\\n13\\\\uff0e\\\\u89e3\\\\u91ca\\\\u6743\\\\r\\\\n\\\\u3000\\\\u3000\\\\u672c\\\\u6ce8\\\\u518c\\\\u534f\\\\u8bae\\\\u7684\\\\u89e3\\\\u91ca\\\\u6743\\\\u5f52wycms\\\\u6240\\\\u6709\\\\u3002\\\\u5982\\\\u679c\\\\u5176\\\\u4e2d\\\\u6709\\\\u4efb\\\\u4f55\\\\u6761\\\\u6b3e\\\\u4e0e\\\\u56fd\\\\u5bb6\\\\u7684\\\\u6709\\\\u5173\\\\u6cd5\\\\u5f8b\\\\u76f8\\\\u62b5\\\\u89e6\\\\uff0c\\\\u5219\\\\u4ee5\\\\u56fd\\\\u5bb6\\\\u6cd5\\\\u5f8b\\\\u7684\\\\u660e\\\\u6587\\\\u89c4\\\\u5b9a\\\\u4e3a\\\\u51c6\\\\u3002 \",\"registerverifymessage\":\" \\\\u6b22\\\\u8fce\\\\u60a8\\\\u6ce8\\\\u518c\\\\u6210\\\\u4e3a\\\\u5fd7\\\\u516c\\\\u6052\\\\u5f8b\\\\u5e08\\\\u670d\\\\u52a1\\\\u7f51\\\\u7528\\\\u6237\\\\uff0c\\\\u60a8\\\\u7684\\\\u8d26\\\\u53f7\\\\u9700\\\\u8981\\\\u90ae\\\\u7bb1\\\\u8ba4\\\\u8bc1\\\\uff0c\\\\u70b9\\\\u51fb\\\\u4e0b\\\\u9762\\\\u94fe\\\\u63a5\\\\u8fdb\\\\u884c\\\\u8ba4\\\\u8bc1\\\\uff1a{click}\\\\r\\\\n\\\\u6216\\\\u8005\\\\u5c06\\\\u7f51\\\\u5740\\\\u590d\\\\u5236\\\\u5230\\\\u6d4f\\\\u89c8\\\\u5668\\\\uff1a{url}\",\"forgetpassword\":\"\\\\u5fd7\\\\u516c\\\\u6052\\\\u5f8b\\\\u5e08\\\\u670d\\\\u52a1\\\\u7f51\\\\u5bc6\\\\u7801\\\\u627e\\\\u56de\\\\uff0c\\\\u8bf7\\\\u5728\\\\u4e00\\\\u5c0f\\\\u65f6\\\\u5185\\\\u70b9\\\\u51fb\\\\u4e0b\\\\u9762\\\\u94fe\\\\u63a5\\\\u8fdb\\\\u884c\\\\u64cd\\\\u4f5c\\\\uff1a{click}\\\\r\\\\n\\\\u6216\\\\u8005\\\\u5c06\\\\u7f51\\\\u5740\\\\u590d\\\\u5236\\\\u5230\\\\u6d4f\\\\u89c8\\\\u5668\\\\uff1a{url}\"}\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-03-10\',\n    \'updatedate\' => \'2016-03-10\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-03-10\',\n    \'updatedate\' => \'2016-03-10\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'{\"1\":{\"is_post\":\"0\",\"enablecheckcode\":\"0\"}}\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-03-10\',\n    \'updatedate\' => \'2016-03-10\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-03-10\',\n    \'updatedate\' => \'2016-03-10\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'短信平台\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'短信平台\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n  \'ask\' => \n  array (\n    \'module\' => \'ask\',\n    \'name\' => \'咨询\',\n    \'url\' => \'ask/\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'咨询\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2014-05-21\',\n    \'updatedate\' => \'2014-05-21\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  2 => \'1\',\n  3 => \'1\',\n  4 => \'1\',\n  5 => \'1\',\n  7 => \'1\',\n  11 => \'1\',\n  10 => \'1\',\n  9 => \'1\',\n  8 => \'1\',\n  12 => \'1\',\n  13 => \'1\',\n  15 => \'1\',\n  6 => \'1\',\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  2 => \n  array (\n    \'catid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'2\',\n    \'catname\' => \'志公恒信\',\n    \'style\' => \'\',\n    \'image\' => \'http://www.fl880.com/uploadfile/2017/0314/20170314094936697.jpg\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'zghx\',\n    \'url\' => \'http://www.fl880.com/zghx/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"1\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'2\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'zhigonghengxin\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  3 => \n  array (\n    \'catid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'3\',\n    \'catname\' => \'律师团队\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'team\',\n    \'url\' => \'http://www.fl880.com/team/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'lvshituandui\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  4 => \n  array (\n    \'catid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'4\',\n    \'catname\' => \'成功案例\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'case\',\n    \'url\' => \'http://www.fl880.com/case/\',\n    \'items\' => \'5\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'4\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'chenggonganli\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  5 => \n  array (\n    \'catid\' => \'5\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'5\',\n    \'catname\' => \'律师文集\',\n    \'style\' => \'\',\n    \'image\' => \'http://www.fl880.com/uploadfile/2017/0314/20170314103423206.jpg\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'corpus\',\n    \'url\' => \'http://www.fl880.com/corpus/\',\n    \'items\' => \'5\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'5\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'lvshiwenji\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  7 => \n  array (\n    \'catid\' => \'7\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'7,11,10,9,8\',\n    \'catname\' => \'业务专长\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'service\',\n    \'url\' => \'http://www.fl880.com/service/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'7\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'yewuzhuanchang\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  11 => \n  array (\n    \'catid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'7\',\n    \'arrparentid\' => \'0,7\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'11\',\n    \'catname\' => \'行政复议和诉讼\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'service/\',\n    \'catdir\' => \'litigation\',\n    \'url\' => \'http://www.fl880.com/service/litigation/\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'8\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'xingzhengfuyihesusong\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  10 => \n  array (\n    \'catid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'7\',\n    \'arrparentid\' => \'0,7\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'10\',\n    \'catname\' => \'刑事风险防范\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'service/\',\n    \'catdir\' => \'risk\',\n    \'url\' => \'http://www.fl880.com/service/risk/\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'9\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'xingshifengxianfangfan\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  9 => \n  array (\n    \'catid\' => \'9\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'7\',\n    \'arrparentid\' => \'0,7\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'9\',\n    \'catname\' => \'民商事案件代理\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'service/\',\n    \'catdir\' => \'caseAgent\',\n    \'url\' => \'http://www.fl880.com/service/caseAgent/\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'10\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'minshangshianjiandaili\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  8 => \n  array (\n    \'catid\' => \'8\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'7\',\n    \'arrparentid\' => \'0,7\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'8\',\n    \'catname\' => \'中小企业法律顾问\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'service/\',\n    \'catdir\' => \'counsel\',\n    \'url\' => \'http://www.fl880.com/service/counsel/\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'11\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'zhongxiaoqiyefalvguwen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  12 => \n  array (\n    \'catid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'12\',\n    \'catname\' => \'法律资讯\',\n    \'style\' => \'\',\n    \'image\' => \'http://www.fl880.com/uploadfile/2017/0324/20170324020012785.jpg\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'message\',\n    \'url\' => \'http://www.fl880.com/message/\',\n    \'items\' => \'5\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'12\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'falvzixun\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  13 => \n  array (\n    \'catid\' => \'13\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'13\',\n    \'catname\' => \'法律助手\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'helper\',\n    \'url\' => \'http://www.fl880.com/helper/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"1\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'13\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'falvzhushou\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  15 => \n  array (\n    \'catid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'15\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'15\',\n    \'catname\' => \'积分商城\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'point\',\n    \'url\' => \'http://www.fl880.com/point/\',\n    \'items\' => \'4\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}\',\n    \'listorder\' => \'15\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'jifenshangcheng\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => \'1\',\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'11\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  6 => \n  array (\n    \'catid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'6\',\n    \'catname\' => \'联系我们\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'contact\',\n    \'url\' => \'http://www.fl880.com/contact/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"1\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}\',\n    \'listorder\' => \'16\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'1\',\n    \'letter\' => \'lianxiwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'1\',\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('downservers.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `wy_cache` VALUES ('badword.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('ipbanned.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('keylink.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('position.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `wy_cache` VALUES ('role_siteid.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('role.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `wy_cache` VALUES ('urlrules_detail.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('urlrules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `wy_cache` VALUES ('model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  15 => \n  array (\n    \'modelid\' => \'15\',\n    \'siteid\' => \'1\',\n    \'name\' => \'商品模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'product\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('type_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('workflow_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('member_model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n  12 => \n  array (\n    \'modelid\' => \'12\',\n    \'siteid\' => \'1\',\n    \'name\' => \'律师会员\',\n    \'description\' => \'注册律师\',\n    \'tablename\' => \'member_lawyer\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('vote.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('link.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'0\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('special.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('common.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin_email\' => \'wycms@wanglv.com\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.163.com\',\n  \'mail_port\' => \'25\',\n  \'category_ajax\' => \'0\',\n  \'mail_user\' => \'howecc@163.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'howecc@163.com\',\n  \'mail_password\' => \'wy2305811\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_items_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  3 => \'0\',\n  4 => \'5\',\n  5 => \'5\',\n  7 => \'0\',\n  8 => \'1\',\n  9 => \'2\',\n  10 => \'1\',\n  11 => \'2\',\n  12 => \'5\',\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_items_2.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_items_3.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_items_11.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('type_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('ask_type_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'typeid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'1,6,3,4,5\',\n    \'typename\' => \'在线咨询\',\n    \'items\' => \'0\',\n    \'listorder\' => \'1\',\n    \'setting\' => \'{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"0\",\"isvisitor_reply\":\"0\",\"interval_time\":\"0\"}\',\n    \'isclose\' => \'0\',\n    \'isreply\' => \'1\',\n    \'isvisitor_ask\' => \'0\',\n    \'isvisitor_reply\' => \'0\',\n    \'interval_time\' => \'0\',\n  ),\n  2 => \n  array (\n    \'typeid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'2\',\n    \'typename\' => \'一对一咨询\',\n    \'items\' => \'0\',\n    \'listorder\' => \'2\',\n    \'setting\' => \'{\"template_list\":\"default\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"0\",\"interval_time\":\"0\"}\',\n    \'isclose\' => \'0\',\n    \'isreply\' => \'1\',\n    \'isvisitor_ask\' => \'1\',\n    \'isvisitor_reply\' => \'0\',\n    \'interval_time\' => \'0\',\n  ),\n  3 => \n  array (\n    \'typeid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'3\',\n    \'typename\' => \'刑事\',\n    \'items\' => \'0\',\n    \'listorder\' => \'3\',\n    \'setting\' => \'{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}\',\n    \'isclose\' => \'0\',\n    \'isreply\' => \'1\',\n    \'isvisitor_ask\' => \'1\',\n    \'isvisitor_reply\' => \'1\',\n    \'interval_time\' => \'0\',\n  ),\n  4 => \n  array (\n    \'typeid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'4\',\n    \'typename\' => \'婚姻\',\n    \'items\' => \'0\',\n    \'listorder\' => \'4\',\n    \'setting\' => \'{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}\',\n    \'isclose\' => \'0\',\n    \'isreply\' => \'1\',\n    \'isvisitor_ask\' => \'1\',\n    \'isvisitor_reply\' => \'1\',\n    \'interval_time\' => \'0\',\n  ),\n  5 => \n  array (\n    \'typeid\' => \'5\',\n    \'siteid\' => \'1\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'5\',\n    \'typename\' => \'行政\',\n    \'items\' => \'0\',\n    \'listorder\' => \'5\',\n    \'setting\' => \'{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}\',\n    \'isclose\' => \'0\',\n    \'isreply\' => \'1\',\n    \'isvisitor_ask\' => \'1\',\n    \'isvisitor_reply\' => \'1\',\n    \'interval_time\' => \'0\',\n  ),\n  6 => \n  array (\n    \'typeid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'6\',\n    \'typename\' => \'其他\',\n    \'items\' => \'0\',\n    \'listorder\' => \'6\',\n    \'setting\' => \'{\"template_list\":\"0\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"isclose\":\"0\",\"isreply\":\"1\",\"isvisitor_ask\":\"1\",\"isvisitor_reply\":\"1\",\"interval_time\":\"0\"}\',\n    \'isclose\' => \'0\',\n    \'isreply\' => \'1\',\n    \'isvisitor_ask\' => \'1\',\n    \'isvisitor_reply\' => \'1\',\n    \'interval_time\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `wy_cache` VALUES ('ask_config_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'validate\' => 1,\n  \'interval\' => 0,\n  \'title\' => \'\',\n  \'keywords\' => \'\',\n  \'description\' => \'\',\n  \'comment\' => \'\',\n  \'close\' => \'0\',\n  \'audit_ask\' => \'0\',\n  \'audit_reply\' => \'0\',\n  \'allow_visitors_ask\' => \'0\',\n  \'allow_visitors_reply\' => \'0\',\n);\n?>');
INSERT INTO `wy_cache` VALUES ('type_.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_items_14.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `wy_cache` VALUES ('category_items_15.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  15 => \'4\',\n);\n?>');

-- ----------------------------
-- Table structure for wy_category
-- ----------------------------
DROP TABLE IF EXISTS `wy_category`;
CREATE TABLE `wy_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_category
-- ----------------------------
INSERT INTO `wy_category` VALUES ('3', '1', 'content', '0', '1', '0', '0', '0', '3', '律师团队', '', '', '', '', 'team', '/team/', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '3', '1', '1', 'lvshituandui', '');
INSERT INTO `wy_category` VALUES ('2', '1', 'content', '1', '0', '0', '0', '0', '2', '志公恒信', '', 'http://www.fl880.com/uploadfile/2017/0314/20170314094936697.jpg', '', '', 'zghx', '/zghx/', '0', '0', '{\"ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"1\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '2', '1', '1', 'zhigonghengxin', '');
INSERT INTO `wy_category` VALUES ('4', '1', 'content', '0', '1', '0', '0', '0', '4', '成功案例', '', '', '', '', 'case', '/case/', '5', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '4', '1', '1', 'chenggonganli', '');
INSERT INTO `wy_category` VALUES ('5', '1', 'content', '0', '1', '0', '0', '0', '5', '律师文集', '', 'http://www.fl880.com/uploadfile/2017/0314/20170314103423206.jpg', '', '', 'corpus', '/corpus/', '5', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '5', '0', '1', 'lvshiwenji', '');
INSERT INTO `wy_category` VALUES ('6', '1', 'content', '1', '0', '0', '0', '0', '6', '联系我们', '', '', '', '', 'contact', '/contact/', '0', '0', '{\"ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"1\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '16', '1', '1', 'lianxiwomen', '');
INSERT INTO `wy_category` VALUES ('7', '1', 'content', '0', '1', '0', '0', '1', '7,11,10,9,8', '业务专长', '', '', '', '', 'service', '/service/', '0', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '7', '1', '1', 'yewuzhuanchang', '');
INSERT INTO `wy_category` VALUES ('8', '1', 'content', '0', '1', '7', '0,7', '0', '8', '中小企业法律顾问', '', '', '', 'service/', 'counsel', '/service/counsel/', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '11', '0', '1', 'zhongxiaoqiyefalvguwen', '');
INSERT INTO `wy_category` VALUES ('9', '1', 'content', '0', '1', '7', '0,7', '0', '9', '民商事案件代理', '', '', '', 'service/', 'caseAgent', '/service/caseAgent/', '2', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '10', '0', '1', 'minshangshianjiandaili', '');
INSERT INTO `wy_category` VALUES ('10', '1', 'content', '0', '1', '7', '0,7', '0', '10', '刑事风险防范', '', '', '', 'service/', 'risk', '/service/risk/', '1', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '9', '0', '1', 'xingshifengxianfangfan', '');
INSERT INTO `wy_category` VALUES ('11', '1', 'content', '0', '1', '7', '0,7', '0', '11', '行政复议和诉讼', '', '', '', 'service/', 'litigation', '/service/litigation/', '2', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"0\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '8', '0', '1', 'xingzhengfuyihesusong', '');
INSERT INTO `wy_category` VALUES ('12', '1', 'content', '0', '1', '0', '0', '0', '12', '法律资讯', '', 'http://www.fl880.com/uploadfile/2017/0324/20170324020012785.jpg', '', '', 'message', '/message/', '5', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '12', '0', '1', 'falvzixun', '');
INSERT INTO `wy_category` VALUES ('13', '1', 'content', '1', '0', '0', '0', '0', '13', '法律助手', '', '', '', '', 'helper', '/helper/', '0', '0', '{\"ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"page_template\":\"page\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"category_ruleid\":\"1\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', '13', '1', '1', 'falvzhushou', '');
INSERT INTO `wy_category` VALUES ('15', '1', 'content', '0', '15', '0', '0', '0', '15', '积分商城', '', '', '', '', 'point', '/point/', '4', '0', '{\"workflowid\":\"\",\"ishtml\":\"1\",\"content_ishtml\":\"1\",\"create_to_html_root\":\"1\",\"template_list\":\"default\",\"category_template\":\"category\",\"list_template\":\"list\",\"show_template\":\"show\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"1\",\"show_ruleid\":\"11\"}', '15', '1', '1', 'jifenshangcheng', '');

-- ----------------------------
-- Table structure for wy_category_priv
-- ----------------------------
DROP TABLE IF EXISTS `wy_category_priv`;
CREATE TABLE `wy_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_category_priv
-- ----------------------------
INSERT INTO `wy_category_priv` VALUES ('15', '1', '5', '0', 'visit');
INSERT INTO `wy_category_priv` VALUES ('15', '1', '8', '0', 'visit');
INSERT INTO `wy_category_priv` VALUES ('15', '1', '2', '0', 'visit');

-- ----------------------------
-- Table structure for wy_collection_content
-- ----------------------------
DROP TABLE IF EXISTS `wy_collection_content`;
CREATE TABLE `wy_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_collection_content
-- ----------------------------

-- ----------------------------
-- Table structure for wy_collection_history
-- ----------------------------
DROP TABLE IF EXISTS `wy_collection_history`;
CREATE TABLE `wy_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_collection_history
-- ----------------------------

-- ----------------------------
-- Table structure for wy_collection_node
-- ----------------------------
DROP TABLE IF EXISTS `wy_collection_node`;
CREATE TABLE `wy_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_collection_node
-- ----------------------------

-- ----------------------------
-- Table structure for wy_collection_program
-- ----------------------------
DROP TABLE IF EXISTS `wy_collection_program`;
CREATE TABLE `wy_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_collection_program
-- ----------------------------

-- ----------------------------
-- Table structure for wy_comment
-- ----------------------------
DROP TABLE IF EXISTS `wy_comment`;
CREATE TABLE `wy_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_comment
-- ----------------------------

-- ----------------------------
-- Table structure for wy_comment_check
-- ----------------------------
DROP TABLE IF EXISTS `wy_comment_check`;
CREATE TABLE `wy_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_comment_check
-- ----------------------------

-- ----------------------------
-- Table structure for wy_comment_data_1
-- ----------------------------
DROP TABLE IF EXISTS `wy_comment_data_1`;
CREATE TABLE `wy_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_comment_data_1
-- ----------------------------

-- ----------------------------
-- Table structure for wy_comment_setting
-- ----------------------------
DROP TABLE IF EXISTS `wy_comment_setting`;
CREATE TABLE `wy_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_comment_setting
-- ----------------------------
INSERT INTO `wy_comment_setting` VALUES ('1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for wy_comment_table
-- ----------------------------
DROP TABLE IF EXISTS `wy_comment_table`;
CREATE TABLE `wy_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_comment_table
-- ----------------------------

-- ----------------------------
-- Table structure for wy_content_check
-- ----------------------------
DROP TABLE IF EXISTS `wy_content_check`;
CREATE TABLE `wy_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_content_check
-- ----------------------------

-- ----------------------------
-- Table structure for wy_copyfrom
-- ----------------------------
DROP TABLE IF EXISTS `wy_copyfrom`;
CREATE TABLE `wy_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_copyfrom
-- ----------------------------

-- ----------------------------
-- Table structure for wy_datacall
-- ----------------------------
DROP TABLE IF EXISTS `wy_datacall`;
CREATE TABLE `wy_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_datacall
-- ----------------------------

-- ----------------------------
-- Table structure for wy_dbsource
-- ----------------------------
DROP TABLE IF EXISTS `wy_dbsource`;
CREATE TABLE `wy_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_dbsource
-- ----------------------------

-- ----------------------------
-- Table structure for wy_download
-- ----------------------------
DROP TABLE IF EXISTS `wy_download`;
CREATE TABLE `wy_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_download
-- ----------------------------

-- ----------------------------
-- Table structure for wy_download_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_download_data`;
CREATE TABLE `wy_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_download_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_downservers
-- ----------------------------
DROP TABLE IF EXISTS `wy_downservers`;
CREATE TABLE `wy_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_downservers
-- ----------------------------

-- ----------------------------
-- Table structure for wy_extend_setting
-- ----------------------------
DROP TABLE IF EXISTS `wy_extend_setting`;
CREATE TABLE `wy_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_extend_setting
-- ----------------------------

-- ----------------------------
-- Table structure for wy_favorite
-- ----------------------------
DROP TABLE IF EXISTS `wy_favorite`;
CREATE TABLE `wy_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for wy_hits
-- ----------------------------
DROP TABLE IF EXISTS `wy_hits`;
CREATE TABLE `wy_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_hits
-- ----------------------------
INSERT INTO `wy_hits` VALUES ('c-1-18', '5', '0', '0', '0', '0', '0', '1490320738');
INSERT INTO `wy_hits` VALUES ('c-1-19', '5', '0', '0', '0', '0', '0', '1490320772');
INSERT INTO `wy_hits` VALUES ('c-1-20', '5', '0', '0', '0', '0', '0', '1490320806');
INSERT INTO `wy_hits` VALUES ('c-1-21', '4', '0', '0', '0', '0', '0', '1490322839');
INSERT INTO `wy_hits` VALUES ('c-1-14', '9', '0', '0', '0', '0', '0', '1490320488');
INSERT INTO `wy_hits` VALUES ('c-1-16', '11', '0', '0', '0', '0', '0', '1490320628');
INSERT INTO `wy_hits` VALUES ('c-1-15', '10', '0', '0', '0', '0', '0', '1490320564');
INSERT INTO `wy_hits` VALUES ('c-1-12', '8', '0', '0', '0', '0', '0', '1490320352');
INSERT INTO `wy_hits` VALUES ('c-1-13', '9', '0', '0', '0', '0', '0', '1490320434');
INSERT INTO `wy_hits` VALUES ('c-15-1', '15', '0', '0', '0', '0', '0', '1490147759');
INSERT INTO `wy_hits` VALUES ('c-15-2', '15', '0', '0', '0', '0', '0', '1490147823');
INSERT INTO `wy_hits` VALUES ('c-15-4', '15', '0', '0', '0', '0', '0', '1490152826');
INSERT INTO `wy_hits` VALUES ('c-15-5', '15', '0', '0', '0', '0', '0', '1490161504');
INSERT INTO `wy_hits` VALUES ('c-1-17', '11', '0', '0', '0', '0', '0', '1490320673');
INSERT INTO `wy_hits` VALUES ('c-1-22', '4', '0', '0', '0', '0', '0', '1490324229');
INSERT INTO `wy_hits` VALUES ('c-1-23', '4', '0', '0', '0', '0', '0', '1490324364');
INSERT INTO `wy_hits` VALUES ('c-1-24', '4', '0', '0', '0', '0', '0', '1490324610');
INSERT INTO `wy_hits` VALUES ('c-1-25', '4', '0', '0', '0', '0', '0', '1490325148');
INSERT INTO `wy_hits` VALUES ('c-1-26', '12', '0', '0', '0', '0', '0', '1490325975');
INSERT INTO `wy_hits` VALUES ('c-1-27', '5', '0', '0', '0', '0', '0', '1490326023');
INSERT INTO `wy_hits` VALUES ('c-1-28', '5', '0', '0', '0', '0', '0', '1490326455');
INSERT INTO `wy_hits` VALUES ('c-1-30', '12', '0', '0', '0', '0', '0', '1490326627');
INSERT INTO `wy_hits` VALUES ('c-1-31', '12', '0', '0', '0', '0', '0', '1490326698');
INSERT INTO `wy_hits` VALUES ('c-1-32', '12', '0', '0', '0', '0', '0', '1490327209');
INSERT INTO `wy_hits` VALUES ('c-1-33', '12', '0', '0', '0', '0', '0', '1490327251');

-- ----------------------------
-- Table structure for wy_ipbanned
-- ----------------------------
DROP TABLE IF EXISTS `wy_ipbanned`;
CREATE TABLE `wy_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_ipbanned
-- ----------------------------

-- ----------------------------
-- Table structure for wy_keylink
-- ----------------------------
DROP TABLE IF EXISTS `wy_keylink`;
CREATE TABLE `wy_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_keylink
-- ----------------------------

-- ----------------------------
-- Table structure for wy_keyword
-- ----------------------------
DROP TABLE IF EXISTS `wy_keyword`;
CREATE TABLE `wy_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_keyword
-- ----------------------------
INSERT INTO `wy_keyword` VALUES ('1', '1', '志公恒信律师', 'zhigonghengxinlvshi', '6', '0');
INSERT INTO `wy_keyword` VALUES ('2', '1', '志公恒信律师服务的宗旨', 'zhigonghengxinlvshifuwudezongzhi', '2', '0');
INSERT INTO `wy_keyword` VALUES ('3', '1', '', '', '38', '0');
INSERT INTO `wy_keyword` VALUES ('4', '1', '协助抓捕', 'xiezhuzhuabo', '1', '0');
INSERT INTO `wy_keyword` VALUES ('5', '1', '两死两伤重大交', 'liangsiliangshangzhongdajiao', '1', '0');
INSERT INTO `wy_keyword` VALUES ('6', '1', '1111', '1111', '2', '0');
INSERT INTO `wy_keyword` VALUES ('7', '1', '测试测试测试测试', 'ceshiceshiceshiceshi', '2', '0');
INSERT INTO `wy_keyword` VALUES ('8', '1', '对对对', 'duiduidui', '3', '0');

-- ----------------------------
-- Table structure for wy_keyword_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_keyword_data`;
CREATE TABLE `wy_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_keyword_data
-- ----------------------------
INSERT INTO `wy_keyword_data` VALUES ('1', '1', '1', '1-1');
INSERT INTO `wy_keyword_data` VALUES ('2', '1', '1', '2-1');
INSERT INTO `wy_keyword_data` VALUES ('3', '2', '1', '3-1');
INSERT INTO `wy_keyword_data` VALUES ('4', '1', '1', '4-1');
INSERT INTO `wy_keyword_data` VALUES ('5', '3', '1', '5-1');
INSERT INTO `wy_keyword_data` VALUES ('6', '4', '1', '6-1');
INSERT INTO `wy_keyword_data` VALUES ('7', '3', '1', '7-1');
INSERT INTO `wy_keyword_data` VALUES ('8', '3', '1', '8-1');
INSERT INTO `wy_keyword_data` VALUES ('9', '3', '1', '9-1');
INSERT INTO `wy_keyword_data` VALUES ('10', '5', '1', '5-1');
INSERT INTO `wy_keyword_data` VALUES ('11', '3', '1', '1-15');
INSERT INTO `wy_keyword_data` VALUES ('12', '3', '1', '2-15');
INSERT INTO `wy_keyword_data` VALUES ('13', '6', '1', '3-15');
INSERT INTO `wy_keyword_data` VALUES ('14', '7', '1', '4-15');
INSERT INTO `wy_keyword_data` VALUES ('15', '8', '1', '5-15');
INSERT INTO `wy_keyword_data` VALUES ('16', '3', '1', '10-1');
INSERT INTO `wy_keyword_data` VALUES ('17', '3', '1', '11-1');
INSERT INTO `wy_keyword_data` VALUES ('18', '3', '1', '12-1');
INSERT INTO `wy_keyword_data` VALUES ('19', '3', '1', '13-1');
INSERT INTO `wy_keyword_data` VALUES ('20', '3', '1', '14-1');
INSERT INTO `wy_keyword_data` VALUES ('21', '3', '1', '15-1');
INSERT INTO `wy_keyword_data` VALUES ('22', '3', '1', '16-1');
INSERT INTO `wy_keyword_data` VALUES ('23', '3', '1', '17-1');
INSERT INTO `wy_keyword_data` VALUES ('24', '3', '1', '18-1');
INSERT INTO `wy_keyword_data` VALUES ('25', '3', '1', '19-1');
INSERT INTO `wy_keyword_data` VALUES ('26', '3', '1', '20-1');
INSERT INTO `wy_keyword_data` VALUES ('27', '3', '1', '21-1');
INSERT INTO `wy_keyword_data` VALUES ('28', '3', '1', '22-1');
INSERT INTO `wy_keyword_data` VALUES ('29', '3', '1', '23-1');
INSERT INTO `wy_keyword_data` VALUES ('30', '3', '1', '24-1');
INSERT INTO `wy_keyword_data` VALUES ('31', '3', '1', '25-1');
INSERT INTO `wy_keyword_data` VALUES ('32', '3', '1', '26-1');
INSERT INTO `wy_keyword_data` VALUES ('33', '3', '1', '27-1');
INSERT INTO `wy_keyword_data` VALUES ('34', '3', '1', '28-1');
INSERT INTO `wy_keyword_data` VALUES ('35', '3', '1', '29-1');
INSERT INTO `wy_keyword_data` VALUES ('36', '3', '1', '30-1');
INSERT INTO `wy_keyword_data` VALUES ('37', '3', '1', '31-1');
INSERT INTO `wy_keyword_data` VALUES ('38', '3', '1', '32-1');
INSERT INTO `wy_keyword_data` VALUES ('39', '3', '1', '33-1');

-- ----------------------------
-- Table structure for wy_link
-- ----------------------------
DROP TABLE IF EXISTS `wy_link`;
CREATE TABLE `wy_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_link
-- ----------------------------
INSERT INTO `wy_link` VALUES ('1', '1', '0', '0', '找法网', 'http://www.findlaw.cn', '', '', '', '0', '0', '1', '1489459878');

-- ----------------------------
-- Table structure for wy_linkage
-- ----------------------------
DROP TABLE IF EXISTS `wy_linkage`;
CREATE TABLE `wy_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_linkage
-- ----------------------------

-- ----------------------------
-- Table structure for wy_log
-- ----------------------------
DROP TABLE IF EXISTS `wy_log`;
CREATE TABLE `wy_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=2345 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_log
-- ----------------------------
INSERT INTO `wy_log` VALUES ('1', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-13 16:37:58');
INSERT INTO `wy_log` VALUES ('2', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-13 16:38:54');
INSERT INTO `wy_log` VALUES ('3', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-13 16:39:48');
INSERT INTO `wy_log` VALUES ('4', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:40:31');
INSERT INTO `wy_log` VALUES ('5', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:40:35');
INSERT INTO `wy_log` VALUES ('6', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:40:36');
INSERT INTO `wy_log` VALUES ('7', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:40:41');
INSERT INTO `wy_log` VALUES ('8', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:41:01');
INSERT INTO `wy_log` VALUES ('9', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:41:35');
INSERT INTO `wy_log` VALUES ('10', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:41:48');
INSERT INTO `wy_log` VALUES ('11', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:42:35');
INSERT INTO `wy_log` VALUES ('12', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:43:21');
INSERT INTO `wy_log` VALUES ('13', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:43:29');
INSERT INTO `wy_log` VALUES ('14', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:43:30');
INSERT INTO `wy_log` VALUES ('15', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2017-03-13 16:43:30');
INSERT INTO `wy_log` VALUES ('16', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:14:40');
INSERT INTO `wy_log` VALUES ('17', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=poster_template', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:14:47');
INSERT INTO `wy_log` VALUES ('18', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:15:02');
INSERT INTO `wy_log` VALUES ('19', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:19:27');
INSERT INTO `wy_log` VALUES ('20', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=poster_template', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:19:31');
INSERT INTO `wy_log` VALUES ('21', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=create_js', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:19:36');
INSERT INTO `wy_log` VALUES ('22', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:19:39');
INSERT INTO `wy_log` VALUES ('23', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:20:19');
INSERT INTO `wy_log` VALUES ('24', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:20:52');
INSERT INTO `wy_log` VALUES ('25', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:21:32');
INSERT INTO `wy_log` VALUES ('26', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:21:34');
INSERT INTO `wy_log` VALUES ('27', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:23:05');
INSERT INTO `wy_log` VALUES ('28', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:23:09');
INSERT INTO `wy_log` VALUES ('29', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:24:15');
INSERT INTO `wy_log` VALUES ('30', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:25:53');
INSERT INTO `wy_log` VALUES ('31', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:26:09');
INSERT INTO `wy_log` VALUES ('32', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:26:27');
INSERT INTO `wy_log` VALUES ('33', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:26:33');
INSERT INTO `wy_log` VALUES ('34', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:26:46');
INSERT INTO `wy_log` VALUES ('35', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:50:06');
INSERT INTO `wy_log` VALUES ('36', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:50:28');
INSERT INTO `wy_log` VALUES ('37', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:51:00');
INSERT INTO `wy_log` VALUES ('38', '', '0', 'content', '', 'content', '?m=content&c=content&a=clear_data', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:51:49');
INSERT INTO `wy_log` VALUES ('39', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:51:50');
INSERT INTO `wy_log` VALUES ('40', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:53:34');
INSERT INTO `wy_log` VALUES ('41', '', '0', 'admin', '', 'release_point', '?m=admin&c=release_point&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-13 17:53:46');
INSERT INTO `wy_log` VALUES ('42', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:00:15');
INSERT INTO `wy_log` VALUES ('43', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:00:25');
INSERT INTO `wy_log` VALUES ('44', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:00:28');
INSERT INTO `wy_log` VALUES ('45', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:00:45');
INSERT INTO `wy_log` VALUES ('46', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:01:42');
INSERT INTO `wy_log` VALUES ('47', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:02:53');
INSERT INTO `wy_log` VALUES ('48', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:03:20');
INSERT INTO `wy_log` VALUES ('49', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:04:14');
INSERT INTO `wy_log` VALUES ('50', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:04:33');
INSERT INTO `wy_log` VALUES ('51', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:04:54');
INSERT INTO `wy_log` VALUES ('52', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:07:21');
INSERT INTO `wy_log` VALUES ('53', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:07:29');
INSERT INTO `wy_log` VALUES ('54', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:07:33');
INSERT INTO `wy_log` VALUES ('55', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:11:21');
INSERT INTO `wy_log` VALUES ('56', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:11:28');
INSERT INTO `wy_log` VALUES ('57', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:11:42');
INSERT INTO `wy_log` VALUES ('58', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:11:56');
INSERT INTO `wy_log` VALUES ('59', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:11:59');
INSERT INTO `wy_log` VALUES ('60', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:33:38');
INSERT INTO `wy_log` VALUES ('61', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:34:03');
INSERT INTO `wy_log` VALUES ('62', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:34:05');
INSERT INTO `wy_log` VALUES ('63', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:39:08');
INSERT INTO `wy_log` VALUES ('64', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:39:10');
INSERT INTO `wy_log` VALUES ('65', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:39:41');
INSERT INTO `wy_log` VALUES ('66', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:39:43');
INSERT INTO `wy_log` VALUES ('67', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:40:01');
INSERT INTO `wy_log` VALUES ('68', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:41:22');
INSERT INTO `wy_log` VALUES ('69', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:41:24');
INSERT INTO `wy_log` VALUES ('70', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:41:42');
INSERT INTO `wy_log` VALUES ('71', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:41:44');
INSERT INTO `wy_log` VALUES ('72', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:41:56');
INSERT INTO `wy_log` VALUES ('73', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:41:58');
INSERT INTO `wy_log` VALUES ('74', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:42:12');
INSERT INTO `wy_log` VALUES ('75', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:42:14');
INSERT INTO `wy_log` VALUES ('76', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:42:19');
INSERT INTO `wy_log` VALUES ('77', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:42:38');
INSERT INTO `wy_log` VALUES ('78', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:42:47');
INSERT INTO `wy_log` VALUES ('79', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:47:05');
INSERT INTO `wy_log` VALUES ('80', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:47:25');
INSERT INTO `wy_log` VALUES ('81', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:47:28');
INSERT INTO `wy_log` VALUES ('82', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:49:16');
INSERT INTO `wy_log` VALUES ('83', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:49:39');
INSERT INTO `wy_log` VALUES ('84', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:53:17');
INSERT INTO `wy_log` VALUES ('85', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:53:36');
INSERT INTO `wy_log` VALUES ('86', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:53:42');
INSERT INTO `wy_log` VALUES ('87', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:57:55');
INSERT INTO `wy_log` VALUES ('88', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 09:59:21');
INSERT INTO `wy_log` VALUES ('89', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:14:36');
INSERT INTO `wy_log` VALUES ('90', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:15:00');
INSERT INTO `wy_log` VALUES ('91', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:15:12');
INSERT INTO `wy_log` VALUES ('92', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:26:54');
INSERT INTO `wy_log` VALUES ('93', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:27:12');
INSERT INTO `wy_log` VALUES ('94', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:34:09');
INSERT INTO `wy_log` VALUES ('95', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:34:26');
INSERT INTO `wy_log` VALUES ('96', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:35:34');
INSERT INTO `wy_log` VALUES ('97', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:35:41');
INSERT INTO `wy_log` VALUES ('98', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:40:19');
INSERT INTO `wy_log` VALUES ('99', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:40:42');
INSERT INTO `wy_log` VALUES ('100', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:40:50');
INSERT INTO `wy_log` VALUES ('101', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:50:23');
INSERT INTO `wy_log` VALUES ('102', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:51:18');
INSERT INTO `wy_log` VALUES ('103', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 10:52:28');
INSERT INTO `wy_log` VALUES ('104', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:00:11');
INSERT INTO `wy_log` VALUES ('105', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:00:13');
INSERT INTO `wy_log` VALUES ('106', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:02:13');
INSERT INTO `wy_log` VALUES ('107', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:02:55');
INSERT INTO `wy_log` VALUES ('108', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=preview', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:06:49');
INSERT INTO `wy_log` VALUES ('109', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:07:03');
INSERT INTO `wy_log` VALUES ('110', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:07:14');
INSERT INTO `wy_log` VALUES ('111', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:07:34');
INSERT INTO `wy_log` VALUES ('112', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:08:43');
INSERT INTO `wy_log` VALUES ('113', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:09:09');
INSERT INTO `wy_log` VALUES ('114', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:09:12');
INSERT INTO `wy_log` VALUES ('115', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:09:27');
INSERT INTO `wy_log` VALUES ('116', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:09:31');
INSERT INTO `wy_log` VALUES ('117', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:09:40');
INSERT INTO `wy_log` VALUES ('118', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=preview', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:09:44');
INSERT INTO `wy_log` VALUES ('119', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:11:07');
INSERT INTO `wy_log` VALUES ('120', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:11:11');
INSERT INTO `wy_log` VALUES ('121', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:11:15');
INSERT INTO `wy_log` VALUES ('122', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:11:24');
INSERT INTO `wy_log` VALUES ('123', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:11:43');
INSERT INTO `wy_log` VALUES ('124', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=preview', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:12:49');
INSERT INTO `wy_log` VALUES ('125', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:12:55');
INSERT INTO `wy_log` VALUES ('126', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:13:29');
INSERT INTO `wy_log` VALUES ('127', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:13:30');
INSERT INTO `wy_log` VALUES ('128', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:14:30');
INSERT INTO `wy_log` VALUES ('129', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:18:02');
INSERT INTO `wy_log` VALUES ('130', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:18:18');
INSERT INTO `wy_log` VALUES ('131', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:18:27');
INSERT INTO `wy_log` VALUES ('132', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:19:05');
INSERT INTO `wy_log` VALUES ('133', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:23:14');
INSERT INTO `wy_log` VALUES ('134', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:23:20');
INSERT INTO `wy_log` VALUES ('135', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:23:21');
INSERT INTO `wy_log` VALUES ('136', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:24:18');
INSERT INTO `wy_log` VALUES ('137', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:24:20');
INSERT INTO `wy_log` VALUES ('138', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:24:31');
INSERT INTO `wy_log` VALUES ('139', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:33:50');
INSERT INTO `wy_log` VALUES ('140', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 11:33:59');
INSERT INTO `wy_log` VALUES ('141', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 13:59:49');
INSERT INTO `wy_log` VALUES ('142', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:15:48');
INSERT INTO `wy_log` VALUES ('143', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:15:53');
INSERT INTO `wy_log` VALUES ('144', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:24:37');
INSERT INTO `wy_log` VALUES ('145', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:24:41');
INSERT INTO `wy_log` VALUES ('146', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:30:12');
INSERT INTO `wy_log` VALUES ('147', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:30:19');
INSERT INTO `wy_log` VALUES ('148', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:39:00');
INSERT INTO `wy_log` VALUES ('149', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:39:10');
INSERT INTO `wy_log` VALUES ('150', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:42:58');
INSERT INTO `wy_log` VALUES ('151', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 14:43:03');
INSERT INTO `wy_log` VALUES ('152', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:00:28');
INSERT INTO `wy_log` VALUES ('153', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:00:36');
INSERT INTO `wy_log` VALUES ('154', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:00:51');
INSERT INTO `wy_log` VALUES ('155', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:01:07');
INSERT INTO `wy_log` VALUES ('156', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:01:08');
INSERT INTO `wy_log` VALUES ('157', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:33:31');
INSERT INTO `wy_log` VALUES ('158', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:33:41');
INSERT INTO `wy_log` VALUES ('159', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:33:45');
INSERT INTO `wy_log` VALUES ('160', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:33:51');
INSERT INTO `wy_log` VALUES ('161', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:34:02');
INSERT INTO `wy_log` VALUES ('162', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:34:49');
INSERT INTO `wy_log` VALUES ('163', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 15:34:56');
INSERT INTO `wy_log` VALUES ('164', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 16:04:49');
INSERT INTO `wy_log` VALUES ('165', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 16:05:39');
INSERT INTO `wy_log` VALUES ('166', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-14 16:54:04');
INSERT INTO `wy_log` VALUES ('167', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:02:18');
INSERT INTO `wy_log` VALUES ('168', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:02:21');
INSERT INTO `wy_log` VALUES ('169', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:02:22');
INSERT INTO `wy_log` VALUES ('170', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:02:22');
INSERT INTO `wy_log` VALUES ('171', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:03:12');
INSERT INTO `wy_log` VALUES ('172', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:36:48');
INSERT INTO `wy_log` VALUES ('173', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:36:56');
INSERT INTO `wy_log` VALUES ('174', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:37:01');
INSERT INTO `wy_log` VALUES ('175', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:37:11');
INSERT INTO `wy_log` VALUES ('176', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:37:24');
INSERT INTO `wy_log` VALUES ('177', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:37:28');
INSERT INTO `wy_log` VALUES ('178', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:43:18');
INSERT INTO `wy_log` VALUES ('179', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-14 17:43:23');
INSERT INTO `wy_log` VALUES ('180', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:32:23');
INSERT INTO `wy_log` VALUES ('181', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:32:33');
INSERT INTO `wy_log` VALUES ('182', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:07');
INSERT INTO `wy_log` VALUES ('183', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:08');
INSERT INTO `wy_log` VALUES ('184', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:09');
INSERT INTO `wy_log` VALUES ('185', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:14');
INSERT INTO `wy_log` VALUES ('186', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:16');
INSERT INTO `wy_log` VALUES ('187', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:16');
INSERT INTO `wy_log` VALUES ('188', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:24');
INSERT INTO `wy_log` VALUES ('189', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:25');
INSERT INTO `wy_log` VALUES ('190', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:27');
INSERT INTO `wy_log` VALUES ('191', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 08:53:28');
INSERT INTO `wy_log` VALUES ('192', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:19:42');
INSERT INTO `wy_log` VALUES ('193', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:21:04');
INSERT INTO `wy_log` VALUES ('194', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:21:08');
INSERT INTO `wy_log` VALUES ('195', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:22:11');
INSERT INTO `wy_log` VALUES ('196', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:22:44');
INSERT INTO `wy_log` VALUES ('197', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:22:46');
INSERT INTO `wy_log` VALUES ('198', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:22:56');
INSERT INTO `wy_log` VALUES ('199', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:23:34');
INSERT INTO `wy_log` VALUES ('200', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:25:43');
INSERT INTO `wy_log` VALUES ('201', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:09');
INSERT INTO `wy_log` VALUES ('202', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:13');
INSERT INTO `wy_log` VALUES ('203', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:16');
INSERT INTO `wy_log` VALUES ('204', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:27');
INSERT INTO `wy_log` VALUES ('205', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:33');
INSERT INTO `wy_log` VALUES ('206', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:35');
INSERT INTO `wy_log` VALUES ('207', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:37');
INSERT INTO `wy_log` VALUES ('208', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:47');
INSERT INTO `wy_log` VALUES ('209', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:50');
INSERT INTO `wy_log` VALUES ('210', '', '0', 'member', '', 'member', '?m=member&c=member&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:26:52');
INSERT INTO `wy_log` VALUES ('211', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:27:18');
INSERT INTO `wy_log` VALUES ('212', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:27:24');
INSERT INTO `wy_log` VALUES ('213', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:27:26');
INSERT INTO `wy_log` VALUES ('214', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:27:32');
INSERT INTO `wy_log` VALUES ('215', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:27:34');
INSERT INTO `wy_log` VALUES ('216', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:27:35');
INSERT INTO `wy_log` VALUES ('217', '', '0', 'member', '', 'member', '?m=member&c=member&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:27:37');
INSERT INTO `wy_log` VALUES ('218', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:28:19');
INSERT INTO `wy_log` VALUES ('219', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:28:20');
INSERT INTO `wy_log` VALUES ('220', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:28:45');
INSERT INTO `wy_log` VALUES ('221', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:28:47');
INSERT INTO `wy_log` VALUES ('222', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:28:54');
INSERT INTO `wy_log` VALUES ('223', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:28:56');
INSERT INTO `wy_log` VALUES ('224', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:29:07');
INSERT INTO `wy_log` VALUES ('225', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:29:08');
INSERT INTO `wy_log` VALUES ('226', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:31:46');
INSERT INTO `wy_log` VALUES ('227', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:31:47');
INSERT INTO `wy_log` VALUES ('228', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:32:02');
INSERT INTO `wy_log` VALUES ('229', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:32:03');
INSERT INTO `wy_log` VALUES ('230', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:32:04');
INSERT INTO `wy_log` VALUES ('231', '', '0', 'member', '', 'member', '?m=member&c=member&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:32:06');
INSERT INTO `wy_log` VALUES ('232', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:32:13');
INSERT INTO `wy_log` VALUES ('233', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:32:18');
INSERT INTO `wy_log` VALUES ('234', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:37:47');
INSERT INTO `wy_log` VALUES ('235', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:37:51');
INSERT INTO `wy_log` VALUES ('236', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:38:00');
INSERT INTO `wy_log` VALUES ('237', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:07');
INSERT INTO `wy_log` VALUES ('238', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:08');
INSERT INTO `wy_log` VALUES ('239', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:10');
INSERT INTO `wy_log` VALUES ('240', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:12');
INSERT INTO `wy_log` VALUES ('241', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:16');
INSERT INTO `wy_log` VALUES ('242', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:21');
INSERT INTO `wy_log` VALUES ('243', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:49');
INSERT INTO `wy_log` VALUES ('244', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:39:51');
INSERT INTO `wy_log` VALUES ('245', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:01');
INSERT INTO `wy_log` VALUES ('246', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:02');
INSERT INTO `wy_log` VALUES ('247', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:08');
INSERT INTO `wy_log` VALUES ('248', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:14');
INSERT INTO `wy_log` VALUES ('249', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:20');
INSERT INTO `wy_log` VALUES ('250', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:21');
INSERT INTO `wy_log` VALUES ('251', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:22');
INSERT INTO `wy_log` VALUES ('252', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:23');
INSERT INTO `wy_log` VALUES ('253', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:25');
INSERT INTO `wy_log` VALUES ('254', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:25');
INSERT INTO `wy_log` VALUES ('255', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:28');
INSERT INTO `wy_log` VALUES ('256', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:31');
INSERT INTO `wy_log` VALUES ('257', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:32');
INSERT INTO `wy_log` VALUES ('258', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:58');
INSERT INTO `wy_log` VALUES ('259', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:58');
INSERT INTO `wy_log` VALUES ('260', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:59');
INSERT INTO `wy_log` VALUES ('261', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:40:59');
INSERT INTO `wy_log` VALUES ('262', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:41:47');
INSERT INTO `wy_log` VALUES ('263', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:41:48');
INSERT INTO `wy_log` VALUES ('264', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:44:51');
INSERT INTO `wy_log` VALUES ('265', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:49:35');
INSERT INTO `wy_log` VALUES ('266', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:50:24');
INSERT INTO `wy_log` VALUES ('267', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:50:32');
INSERT INTO `wy_log` VALUES ('268', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:50:33');
INSERT INTO `wy_log` VALUES ('269', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:52:19');
INSERT INTO `wy_log` VALUES ('270', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:52:20');
INSERT INTO `wy_log` VALUES ('271', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:52:23');
INSERT INTO `wy_log` VALUES ('272', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:53:15');
INSERT INTO `wy_log` VALUES ('273', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:53:16');
INSERT INTO `wy_log` VALUES ('274', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:53:59');
INSERT INTO `wy_log` VALUES ('275', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:00');
INSERT INTO `wy_log` VALUES ('276', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:01');
INSERT INTO `wy_log` VALUES ('277', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:02');
INSERT INTO `wy_log` VALUES ('278', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:03');
INSERT INTO `wy_log` VALUES ('279', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:09');
INSERT INTO `wy_log` VALUES ('280', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:10');
INSERT INTO `wy_log` VALUES ('281', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:11');
INSERT INTO `wy_log` VALUES ('282', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:12');
INSERT INTO `wy_log` VALUES ('283', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:15');
INSERT INTO `wy_log` VALUES ('284', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:16');
INSERT INTO `wy_log` VALUES ('285', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:19');
INSERT INTO `wy_log` VALUES ('286', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:22');
INSERT INTO `wy_log` VALUES ('287', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:23');
INSERT INTO `wy_log` VALUES ('288', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:23');
INSERT INTO `wy_log` VALUES ('289', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:24');
INSERT INTO `wy_log` VALUES ('290', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:25');
INSERT INTO `wy_log` VALUES ('291', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:26');
INSERT INTO `wy_log` VALUES ('292', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:27');
INSERT INTO `wy_log` VALUES ('293', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:28');
INSERT INTO `wy_log` VALUES ('294', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:29');
INSERT INTO `wy_log` VALUES ('295', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:54:30');
INSERT INTO `wy_log` VALUES ('296', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:56:05');
INSERT INTO `wy_log` VALUES ('297', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:56:07');
INSERT INTO `wy_log` VALUES ('298', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:56:19');
INSERT INTO `wy_log` VALUES ('299', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:56:20');
INSERT INTO `wy_log` VALUES ('300', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:56:20');
INSERT INTO `wy_log` VALUES ('301', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:58:40');
INSERT INTO `wy_log` VALUES ('302', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:58:41');
INSERT INTO `wy_log` VALUES ('303', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:58:41');
INSERT INTO `wy_log` VALUES ('304', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 09:58:48');
INSERT INTO `wy_log` VALUES ('305', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:03:03');
INSERT INTO `wy_log` VALUES ('306', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:03:04');
INSERT INTO `wy_log` VALUES ('307', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:03:04');
INSERT INTO `wy_log` VALUES ('308', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:09:59');
INSERT INTO `wy_log` VALUES ('309', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:10:01');
INSERT INTO `wy_log` VALUES ('310', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:10:02');
INSERT INTO `wy_log` VALUES ('311', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:10:04');
INSERT INTO `wy_log` VALUES ('312', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:10:06');
INSERT INTO `wy_log` VALUES ('313', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:10:07');
INSERT INTO `wy_log` VALUES ('314', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:10:13');
INSERT INTO `wy_log` VALUES ('315', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:21:04');
INSERT INTO `wy_log` VALUES ('316', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:21:07');
INSERT INTO `wy_log` VALUES ('317', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:21:08');
INSERT INTO `wy_log` VALUES ('318', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:22:35');
INSERT INTO `wy_log` VALUES ('319', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:22:36');
INSERT INTO `wy_log` VALUES ('320', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:17');
INSERT INTO `wy_log` VALUES ('321', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:26');
INSERT INTO `wy_log` VALUES ('322', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:26');
INSERT INTO `wy_log` VALUES ('323', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=sort', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:37');
INSERT INTO `wy_log` VALUES ('324', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:43');
INSERT INTO `wy_log` VALUES ('325', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:44');
INSERT INTO `wy_log` VALUES ('326', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:45');
INSERT INTO `wy_log` VALUES ('327', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:46');
INSERT INTO `wy_log` VALUES ('328', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:47');
INSERT INTO `wy_log` VALUES ('329', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:50');
INSERT INTO `wy_log` VALUES ('330', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:51');
INSERT INTO `wy_log` VALUES ('331', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:52');
INSERT INTO `wy_log` VALUES ('332', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:54');
INSERT INTO `wy_log` VALUES ('333', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:55');
INSERT INTO `wy_log` VALUES ('334', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:57');
INSERT INTO `wy_log` VALUES ('335', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:23:59');
INSERT INTO `wy_log` VALUES ('336', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:00');
INSERT INTO `wy_log` VALUES ('337', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:01');
INSERT INTO `wy_log` VALUES ('338', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:03');
INSERT INTO `wy_log` VALUES ('339', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=sort', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:09');
INSERT INTO `wy_log` VALUES ('340', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:15');
INSERT INTO `wy_log` VALUES ('341', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:22');
INSERT INTO `wy_log` VALUES ('342', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:26');
INSERT INTO `wy_log` VALUES ('343', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:26');
INSERT INTO `wy_log` VALUES ('344', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:33');
INSERT INTO `wy_log` VALUES ('345', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:24:53');
INSERT INTO `wy_log` VALUES ('346', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:25:02');
INSERT INTO `wy_log` VALUES ('347', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:26:39');
INSERT INTO `wy_log` VALUES ('348', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:28:32');
INSERT INTO `wy_log` VALUES ('349', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:28:32');
INSERT INTO `wy_log` VALUES ('350', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:29:06');
INSERT INTO `wy_log` VALUES ('351', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:29:12');
INSERT INTO `wy_log` VALUES ('352', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:29:19');
INSERT INTO `wy_log` VALUES ('353', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:29:20');
INSERT INTO `wy_log` VALUES ('354', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:29:22');
INSERT INTO `wy_log` VALUES ('355', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:29:28');
INSERT INTO `wy_log` VALUES ('356', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:29:28');
INSERT INTO `wy_log` VALUES ('357', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:30:10');
INSERT INTO `wy_log` VALUES ('358', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:30:47');
INSERT INTO `wy_log` VALUES ('359', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:30:48');
INSERT INTO `wy_log` VALUES ('360', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:34:10');
INSERT INTO `wy_log` VALUES ('361', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:34:14');
INSERT INTO `wy_log` VALUES ('362', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:34:15');
INSERT INTO `wy_log` VALUES ('363', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:35:03');
INSERT INTO `wy_log` VALUES ('364', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:35:15');
INSERT INTO `wy_log` VALUES ('365', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:35:17');
INSERT INTO `wy_log` VALUES ('366', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:35:32');
INSERT INTO `wy_log` VALUES ('367', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:35:34');
INSERT INTO `wy_log` VALUES ('368', '', '0', 'sms', '', 'sms', '?m=sms&c=sms&a=sms_setting', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:35:42');
INSERT INTO `wy_log` VALUES ('369', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:35:49');
INSERT INTO `wy_log` VALUES ('370', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:36:01');
INSERT INTO `wy_log` VALUES ('371', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:36:03');
INSERT INTO `wy_log` VALUES ('372', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:36:19');
INSERT INTO `wy_log` VALUES ('373', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:36:22');
INSERT INTO `wy_log` VALUES ('374', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:36:23');
INSERT INTO `wy_log` VALUES ('375', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:36:24');
INSERT INTO `wy_log` VALUES ('376', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:42:27');
INSERT INTO `wy_log` VALUES ('377', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:42:29');
INSERT INTO `wy_log` VALUES ('378', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:42:31');
INSERT INTO `wy_log` VALUES ('379', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:44:01');
INSERT INTO `wy_log` VALUES ('380', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:44:01');
INSERT INTO `wy_log` VALUES ('381', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:44:14');
INSERT INTO `wy_log` VALUES ('382', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:44:17');
INSERT INTO `wy_log` VALUES ('383', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:44:17');
INSERT INTO `wy_log` VALUES ('384', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:44:46');
INSERT INTO `wy_log` VALUES ('385', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:45:12');
INSERT INTO `wy_log` VALUES ('386', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:46:19');
INSERT INTO `wy_log` VALUES ('387', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:46:20');
INSERT INTO `wy_log` VALUES ('388', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:47:24');
INSERT INTO `wy_log` VALUES ('389', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:48:00');
INSERT INTO `wy_log` VALUES ('390', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:48:00');
INSERT INTO `wy_log` VALUES ('391', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:48:21');
INSERT INTO `wy_log` VALUES ('392', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:48:40');
INSERT INTO `wy_log` VALUES ('393', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:48:41');
INSERT INTO `wy_log` VALUES ('394', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:57:31');
INSERT INTO `wy_log` VALUES ('395', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:57:43');
INSERT INTO `wy_log` VALUES ('396', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 10:57:45');
INSERT INTO `wy_log` VALUES ('397', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:21');
INSERT INTO `wy_log` VALUES ('398', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:23');
INSERT INTO `wy_log` VALUES ('399', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:25');
INSERT INTO `wy_log` VALUES ('400', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:27');
INSERT INTO `wy_log` VALUES ('401', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:30');
INSERT INTO `wy_log` VALUES ('402', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:33');
INSERT INTO `wy_log` VALUES ('403', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:33');
INSERT INTO `wy_log` VALUES ('404', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:34');
INSERT INTO `wy_log` VALUES ('405', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:43');
INSERT INTO `wy_log` VALUES ('406', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:44');
INSERT INTO `wy_log` VALUES ('407', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:45');
INSERT INTO `wy_log` VALUES ('408', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:48');
INSERT INTO `wy_log` VALUES ('409', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:48');
INSERT INTO `wy_log` VALUES ('410', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:52');
INSERT INTO `wy_log` VALUES ('411', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:54');
INSERT INTO `wy_log` VALUES ('412', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:56');
INSERT INTO `wy_log` VALUES ('413', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:58:58');
INSERT INTO `wy_log` VALUES ('414', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:08');
INSERT INTO `wy_log` VALUES ('415', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:12');
INSERT INTO `wy_log` VALUES ('416', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:12');
INSERT INTO `wy_log` VALUES ('417', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:13');
INSERT INTO `wy_log` VALUES ('418', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:15');
INSERT INTO `wy_log` VALUES ('419', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:26');
INSERT INTO `wy_log` VALUES ('420', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:26');
INSERT INTO `wy_log` VALUES ('421', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:27');
INSERT INTO `wy_log` VALUES ('422', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:31');
INSERT INTO `wy_log` VALUES ('423', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:31');
INSERT INTO `wy_log` VALUES ('424', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 13:59:34');
INSERT INTO `wy_log` VALUES ('425', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:07:55');
INSERT INTO `wy_log` VALUES ('426', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:07:57');
INSERT INTO `wy_log` VALUES ('427', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:08:00');
INSERT INTO `wy_log` VALUES ('428', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:08:19');
INSERT INTO `wy_log` VALUES ('429', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:08:19');
INSERT INTO `wy_log` VALUES ('430', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:08:33');
INSERT INTO `wy_log` VALUES ('431', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:08:36');
INSERT INTO `wy_log` VALUES ('432', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:08:38');
INSERT INTO `wy_log` VALUES ('433', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:09:02');
INSERT INTO `wy_log` VALUES ('434', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 14:09:03');
INSERT INTO `wy_log` VALUES ('435', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:13:53');
INSERT INTO `wy_log` VALUES ('436', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:13:55');
INSERT INTO `wy_log` VALUES ('437', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:13:57');
INSERT INTO `wy_log` VALUES ('438', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:14:00');
INSERT INTO `wy_log` VALUES ('439', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:14:01');
INSERT INTO `wy_log` VALUES ('440', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:14:56');
INSERT INTO `wy_log` VALUES ('441', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:15:08');
INSERT INTO `wy_log` VALUES ('442', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:15:08');
INSERT INTO `wy_log` VALUES ('443', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:20:06');
INSERT INTO `wy_log` VALUES ('444', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:20:18');
INSERT INTO `wy_log` VALUES ('445', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:20:20');
INSERT INTO `wy_log` VALUES ('446', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:20:22');
INSERT INTO `wy_log` VALUES ('447', '', '0', 'member', '', 'member', '?m=member&c=member&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:20:28');
INSERT INTO `wy_log` VALUES ('448', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 15:37:15');
INSERT INTO `wy_log` VALUES ('449', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:26:44');
INSERT INTO `wy_log` VALUES ('450', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:26:45');
INSERT INTO `wy_log` VALUES ('451', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:26:46');
INSERT INTO `wy_log` VALUES ('452', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:26:46');
INSERT INTO `wy_log` VALUES ('453', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:26:47');
INSERT INTO `wy_log` VALUES ('454', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:26:53');
INSERT INTO `wy_log` VALUES ('455', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:13');
INSERT INTO `wy_log` VALUES ('456', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:14');
INSERT INTO `wy_log` VALUES ('457', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:16');
INSERT INTO `wy_log` VALUES ('458', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=reject', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:23');
INSERT INTO `wy_log` VALUES ('459', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:24');
INSERT INTO `wy_log` VALUES ('460', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:26');
INSERT INTO `wy_log` VALUES ('461', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:26');
INSERT INTO `wy_log` VALUES ('462', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:27');
INSERT INTO `wy_log` VALUES ('463', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:28');
INSERT INTO `wy_log` VALUES ('464', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:35');
INSERT INTO `wy_log` VALUES ('465', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:27:52');
INSERT INTO `wy_log` VALUES ('466', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:28:05');
INSERT INTO `wy_log` VALUES ('467', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:28:41');
INSERT INTO `wy_log` VALUES ('468', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:28:54');
INSERT INTO `wy_log` VALUES ('469', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:28:59');
INSERT INTO `wy_log` VALUES ('470', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:29:01');
INSERT INTO `wy_log` VALUES ('471', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:29:03');
INSERT INTO `wy_log` VALUES ('472', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:29:03');
INSERT INTO `wy_log` VALUES ('473', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:29:03');
INSERT INTO `wy_log` VALUES ('474', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-15 17:29:10');
INSERT INTO `wy_log` VALUES ('475', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:38:25');
INSERT INTO `wy_log` VALUES ('476', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:38:26');
INSERT INTO `wy_log` VALUES ('477', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:38:29');
INSERT INTO `wy_log` VALUES ('478', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:38:58');
INSERT INTO `wy_log` VALUES ('479', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:39:00');
INSERT INTO `wy_log` VALUES ('480', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:39:03');
INSERT INTO `wy_log` VALUES ('481', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:39:10');
INSERT INTO `wy_log` VALUES ('482', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:39:12');
INSERT INTO `wy_log` VALUES ('483', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:39:12');
INSERT INTO `wy_log` VALUES ('484', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:39:17');
INSERT INTO `wy_log` VALUES ('485', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:54:21');
INSERT INTO `wy_log` VALUES ('486', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:57:47');
INSERT INTO `wy_log` VALUES ('487', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:57:52');
INSERT INTO `wy_log` VALUES ('488', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:57:55');
INSERT INTO `wy_log` VALUES ('489', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:57:59');
INSERT INTO `wy_log` VALUES ('490', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:58:00');
INSERT INTO `wy_log` VALUES ('491', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 08:58:01');
INSERT INTO `wy_log` VALUES ('492', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 09:50:18');
INSERT INTO `wy_log` VALUES ('493', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 09:53:05');
INSERT INTO `wy_log` VALUES ('494', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 09:53:40');
INSERT INTO `wy_log` VALUES ('495', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 09:54:40');
INSERT INTO `wy_log` VALUES ('496', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 09:57:42');
INSERT INTO `wy_log` VALUES ('497', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:02:46');
INSERT INTO `wy_log` VALUES ('498', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:05:23');
INSERT INTO `wy_log` VALUES ('499', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:08:43');
INSERT INTO `wy_log` VALUES ('500', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:11:22');
INSERT INTO `wy_log` VALUES ('501', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:12:18');
INSERT INTO `wy_log` VALUES ('502', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:20:21');
INSERT INTO `wy_log` VALUES ('503', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:29:19');
INSERT INTO `wy_log` VALUES ('504', '', '0', 'admin', '', 'googlesitemap', '?m=admin&c=googlesitemap&a=set', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:30:02');
INSERT INTO `wy_log` VALUES ('505', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:30:07');
INSERT INTO `wy_log` VALUES ('506', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:30:13');
INSERT INTO `wy_log` VALUES ('507', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:31:16');
INSERT INTO `wy_log` VALUES ('508', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:31:25');
INSERT INTO `wy_log` VALUES ('509', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:31:28');
INSERT INTO `wy_log` VALUES ('510', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:32:20');
INSERT INTO `wy_log` VALUES ('511', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 10:32:21');
INSERT INTO `wy_log` VALUES ('512', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:19:27');
INSERT INTO `wy_log` VALUES ('513', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:19:28');
INSERT INTO `wy_log` VALUES ('514', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:19:34');
INSERT INTO `wy_log` VALUES ('515', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:19:39');
INSERT INTO `wy_log` VALUES ('516', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:28:03');
INSERT INTO `wy_log` VALUES ('517', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:28:04');
INSERT INTO `wy_log` VALUES ('518', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:30:01');
INSERT INTO `wy_log` VALUES ('519', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:31:22');
INSERT INTO `wy_log` VALUES ('520', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:35:16');
INSERT INTO `wy_log` VALUES ('521', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:35:17');
INSERT INTO `wy_log` VALUES ('522', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:35:18');
INSERT INTO `wy_log` VALUES ('523', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:35:21');
INSERT INTO `wy_log` VALUES ('524', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:35:24');
INSERT INTO `wy_log` VALUES ('525', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:36:00');
INSERT INTO `wy_log` VALUES ('526', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:36:39');
INSERT INTO `wy_log` VALUES ('527', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:36:40');
INSERT INTO `wy_log` VALUES ('528', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:44:06');
INSERT INTO `wy_log` VALUES ('529', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:44:17');
INSERT INTO `wy_log` VALUES ('530', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:44:33');
INSERT INTO `wy_log` VALUES ('531', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:44:33');
INSERT INTO `wy_log` VALUES ('532', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:44:55');
INSERT INTO `wy_log` VALUES ('533', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:45:10');
INSERT INTO `wy_log` VALUES ('534', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:45:29');
INSERT INTO `wy_log` VALUES ('535', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:45:29');
INSERT INTO `wy_log` VALUES ('536', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:45:37');
INSERT INTO `wy_log` VALUES ('537', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:51:24');
INSERT INTO `wy_log` VALUES ('538', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:51:25');
INSERT INTO `wy_log` VALUES ('539', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 11:51:38');
INSERT INTO `wy_log` VALUES ('540', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '192.168.5.59', '2017-03-16 13:40:05');
INSERT INTO `wy_log` VALUES ('541', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '192.168.5.59', '2017-03-16 13:40:17');
INSERT INTO `wy_log` VALUES ('542', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 13:40:24');
INSERT INTO `wy_log` VALUES ('543', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 13:40:27');
INSERT INTO `wy_log` VALUES ('544', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 13:40:29');
INSERT INTO `wy_log` VALUES ('545', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-16 13:40:34');
INSERT INTO `wy_log` VALUES ('546', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 13:40:36');
INSERT INTO `wy_log` VALUES ('547', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 13:54:13');
INSERT INTO `wy_log` VALUES ('548', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 13:54:15');
INSERT INTO `wy_log` VALUES ('549', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 13:54:17');
INSERT INTO `wy_log` VALUES ('550', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 13:54:20');
INSERT INTO `wy_log` VALUES ('551', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 13:54:21');
INSERT INTO `wy_log` VALUES ('552', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 13:54:28');
INSERT INTO `wy_log` VALUES ('553', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 14:23:58');
INSERT INTO `wy_log` VALUES ('554', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 14:23:59');
INSERT INTO `wy_log` VALUES ('555', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 14:24:05');
INSERT INTO `wy_log` VALUES ('556', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 14:24:15');
INSERT INTO `wy_log` VALUES ('557', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-16 14:25:09');
INSERT INTO `wy_log` VALUES ('558', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-16 14:27:07');
INSERT INTO `wy_log` VALUES ('559', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:16');
INSERT INTO `wy_log` VALUES ('560', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:17');
INSERT INTO `wy_log` VALUES ('561', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:18');
INSERT INTO `wy_log` VALUES ('562', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:20');
INSERT INTO `wy_log` VALUES ('563', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:22');
INSERT INTO `wy_log` VALUES ('564', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:25');
INSERT INTO `wy_log` VALUES ('565', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:28');
INSERT INTO `wy_log` VALUES ('566', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:29:43');
INSERT INTO `wy_log` VALUES ('567', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:34:02');
INSERT INTO `wy_log` VALUES ('568', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:34:06');
INSERT INTO `wy_log` VALUES ('569', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:34:09');
INSERT INTO `wy_log` VALUES ('570', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:34:09');
INSERT INTO `wy_log` VALUES ('571', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 14:34:42');
INSERT INTO `wy_log` VALUES ('572', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 15:49:08');
INSERT INTO `wy_log` VALUES ('573', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 15:49:11');
INSERT INTO `wy_log` VALUES ('574', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 15:49:28');
INSERT INTO `wy_log` VALUES ('575', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 15:49:28');
INSERT INTO `wy_log` VALUES ('576', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:40:44');
INSERT INTO `wy_log` VALUES ('577', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:40:50');
INSERT INTO `wy_log` VALUES ('578', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:40:58');
INSERT INTO `wy_log` VALUES ('579', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:45:34');
INSERT INTO `wy_log` VALUES ('580', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:48:26');
INSERT INTO `wy_log` VALUES ('581', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:48:27');
INSERT INTO `wy_log` VALUES ('582', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:48:28');
INSERT INTO `wy_log` VALUES ('583', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:48:29');
INSERT INTO `wy_log` VALUES ('584', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 16:49:55');
INSERT INTO `wy_log` VALUES ('585', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:04:18');
INSERT INTO `wy_log` VALUES ('586', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:04:21');
INSERT INTO `wy_log` VALUES ('587', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:04:49');
INSERT INTO `wy_log` VALUES ('588', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:05:00');
INSERT INTO `wy_log` VALUES ('589', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:05:08');
INSERT INTO `wy_log` VALUES ('590', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:05:08');
INSERT INTO `wy_log` VALUES ('591', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:05:17');
INSERT INTO `wy_log` VALUES ('592', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:06:05');
INSERT INTO `wy_log` VALUES ('593', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:06:06');
INSERT INTO `wy_log` VALUES ('594', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:06:09');
INSERT INTO `wy_log` VALUES ('595', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=reply_content', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:06:16');
INSERT INTO `wy_log` VALUES ('596', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:23');
INSERT INTO `wy_log` VALUES ('597', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:27');
INSERT INTO `wy_log` VALUES ('598', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:31');
INSERT INTO `wy_log` VALUES ('599', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:33');
INSERT INTO `wy_log` VALUES ('600', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:35');
INSERT INTO `wy_log` VALUES ('601', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:40');
INSERT INTO `wy_log` VALUES ('602', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:41');
INSERT INTO `wy_log` VALUES ('603', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:47');
INSERT INTO `wy_log` VALUES ('604', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:30:49');
INSERT INTO `wy_log` VALUES ('605', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:31:03');
INSERT INTO `wy_log` VALUES ('606', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:31:04');
INSERT INTO `wy_log` VALUES ('607', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:31:09');
INSERT INTO `wy_log` VALUES ('608', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:31:10');
INSERT INTO `wy_log` VALUES ('609', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:31:14');
INSERT INTO `wy_log` VALUES ('610', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:31:15');
INSERT INTO `wy_log` VALUES ('611', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:37:12');
INSERT INTO `wy_log` VALUES ('612', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:37:13');
INSERT INTO `wy_log` VALUES ('613', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:37:15');
INSERT INTO `wy_log` VALUES ('614', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:40:44');
INSERT INTO `wy_log` VALUES ('615', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:40:48');
INSERT INTO `wy_log` VALUES ('616', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:40:51');
INSERT INTO `wy_log` VALUES ('617', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-16 17:40:53');
INSERT INTO `wy_log` VALUES ('618', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-20 09:08:35');
INSERT INTO `wy_log` VALUES ('619', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-20 09:08:38');
INSERT INTO `wy_log` VALUES ('620', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-20 09:08:40');
INSERT INTO `wy_log` VALUES ('621', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-20 09:08:45');
INSERT INTO `wy_log` VALUES ('622', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:08:53');
INSERT INTO `wy_log` VALUES ('623', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:08:58');
INSERT INTO `wy_log` VALUES ('624', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:19:34');
INSERT INTO `wy_log` VALUES ('625', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:19:35');
INSERT INTO `wy_log` VALUES ('626', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:19:41');
INSERT INTO `wy_log` VALUES ('627', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:19:44');
INSERT INTO `wy_log` VALUES ('628', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-20 09:21:39');
INSERT INTO `wy_log` VALUES ('629', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:21:43');
INSERT INTO `wy_log` VALUES ('630', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:21:43');
INSERT INTO `wy_log` VALUES ('631', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-20 09:21:49');
INSERT INTO `wy_log` VALUES ('632', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:21:50');
INSERT INTO `wy_log` VALUES ('633', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:21:53');
INSERT INTO `wy_log` VALUES ('634', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:22:11');
INSERT INTO `wy_log` VALUES ('635', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:22:16');
INSERT INTO `wy_log` VALUES ('636', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:22:30');
INSERT INTO `wy_log` VALUES ('637', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:22:51');
INSERT INTO `wy_log` VALUES ('638', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:22:54');
INSERT INTO `wy_log` VALUES ('639', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:22:54');
INSERT INTO `wy_log` VALUES ('640', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:22:55');
INSERT INTO `wy_log` VALUES ('641', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:23:07');
INSERT INTO `wy_log` VALUES ('642', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:23:13');
INSERT INTO `wy_log` VALUES ('643', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:23:17');
INSERT INTO `wy_log` VALUES ('644', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:23:19');
INSERT INTO `wy_log` VALUES ('645', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:24:04');
INSERT INTO `wy_log` VALUES ('646', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:25:26');
INSERT INTO `wy_log` VALUES ('647', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:26:43');
INSERT INTO `wy_log` VALUES ('648', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:27:29');
INSERT INTO `wy_log` VALUES ('649', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:27:32');
INSERT INTO `wy_log` VALUES ('650', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:27:34');
INSERT INTO `wy_log` VALUES ('651', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:27:36');
INSERT INTO `wy_log` VALUES ('652', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:27:39');
INSERT INTO `wy_log` VALUES ('653', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:28:09');
INSERT INTO `wy_log` VALUES ('654', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:28:11');
INSERT INTO `wy_log` VALUES ('655', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:29:37');
INSERT INTO `wy_log` VALUES ('656', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:29:38');
INSERT INTO `wy_log` VALUES ('657', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:29:44');
INSERT INTO `wy_log` VALUES ('658', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:29:46');
INSERT INTO `wy_log` VALUES ('659', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=reply_content', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:29:48');
INSERT INTO `wy_log` VALUES ('660', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=reply_content', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:29:57');
INSERT INTO `wy_log` VALUES ('661', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=reply_content', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:29:59');
INSERT INTO `wy_log` VALUES ('662', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=reply_content', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:30:04');
INSERT INTO `wy_log` VALUES ('663', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=reply_content', '', '1', 'admin', '127.0.0.1', '2017-03-20 09:30:05');
INSERT INTO `wy_log` VALUES ('664', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:30:33');
INSERT INTO `wy_log` VALUES ('665', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:30:35');
INSERT INTO `wy_log` VALUES ('666', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:30:37');
INSERT INTO `wy_log` VALUES ('667', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-20 09:30:38');
INSERT INTO `wy_log` VALUES ('668', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 11:42:23');
INSERT INTO `wy_log` VALUES ('669', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 11:42:27');
INSERT INTO `wy_log` VALUES ('670', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 11:42:31');
INSERT INTO `wy_log` VALUES ('671', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 11:42:45');
INSERT INTO `wy_log` VALUES ('672', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 11:46:10');
INSERT INTO `wy_log` VALUES ('673', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 11:46:12');
INSERT INTO `wy_log` VALUES ('674', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 11:46:13');
INSERT INTO `wy_log` VALUES ('675', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:37:26');
INSERT INTO `wy_log` VALUES ('676', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:37:33');
INSERT INTO `wy_log` VALUES ('677', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:37:36');
INSERT INTO `wy_log` VALUES ('678', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:37:37');
INSERT INTO `wy_log` VALUES ('679', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:47:02');
INSERT INTO `wy_log` VALUES ('680', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:47:04');
INSERT INTO `wy_log` VALUES ('681', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:47:16');
INSERT INTO `wy_log` VALUES ('682', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:47:25');
INSERT INTO `wy_log` VALUES ('683', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:47:26');
INSERT INTO `wy_log` VALUES ('684', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:47:27');
INSERT INTO `wy_log` VALUES ('685', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:47:59');
INSERT INTO `wy_log` VALUES ('686', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:48:02');
INSERT INTO `wy_log` VALUES ('687', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:48:03');
INSERT INTO `wy_log` VALUES ('688', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:48:41');
INSERT INTO `wy_log` VALUES ('689', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:48:41');
INSERT INTO `wy_log` VALUES ('690', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:48:43');
INSERT INTO `wy_log` VALUES ('691', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:49:00');
INSERT INTO `wy_log` VALUES ('692', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:50:12');
INSERT INTO `wy_log` VALUES ('693', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:50:15');
INSERT INTO `wy_log` VALUES ('694', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:50:39');
INSERT INTO `wy_log` VALUES ('695', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:50:53');
INSERT INTO `wy_log` VALUES ('696', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:50:59');
INSERT INTO `wy_log` VALUES ('697', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:50:59');
INSERT INTO `wy_log` VALUES ('698', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:51:02');
INSERT INTO `wy_log` VALUES ('699', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:51:07');
INSERT INTO `wy_log` VALUES ('700', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:51:07');
INSERT INTO `wy_log` VALUES ('701', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:51:18');
INSERT INTO `wy_log` VALUES ('702', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:51:23');
INSERT INTO `wy_log` VALUES ('703', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:51:48');
INSERT INTO `wy_log` VALUES ('704', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:51:51');
INSERT INTO `wy_log` VALUES ('705', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:52:00');
INSERT INTO `wy_log` VALUES ('706', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:52:06');
INSERT INTO `wy_log` VALUES ('707', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:52:09');
INSERT INTO `wy_log` VALUES ('708', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:52:48');
INSERT INTO `wy_log` VALUES ('709', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:52:48');
INSERT INTO `wy_log` VALUES ('710', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:52:57');
INSERT INTO `wy_log` VALUES ('711', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:53:04');
INSERT INTO `wy_log` VALUES ('712', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:53:04');
INSERT INTO `wy_log` VALUES ('713', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:53:43');
INSERT INTO `wy_log` VALUES ('714', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:53:50');
INSERT INTO `wy_log` VALUES ('715', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:53:50');
INSERT INTO `wy_log` VALUES ('716', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:53:53');
INSERT INTO `wy_log` VALUES ('717', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:54:17');
INSERT INTO `wy_log` VALUES ('718', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:54:20');
INSERT INTO `wy_log` VALUES ('719', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:54:37');
INSERT INTO `wy_log` VALUES ('720', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:54:39');
INSERT INTO `wy_log` VALUES ('721', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:54:41');
INSERT INTO `wy_log` VALUES ('722', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:56:11');
INSERT INTO `wy_log` VALUES ('723', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:56:13');
INSERT INTO `wy_log` VALUES ('724', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:56:27');
INSERT INTO `wy_log` VALUES ('725', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:56:27');
INSERT INTO `wy_log` VALUES ('726', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 13:58:55');
INSERT INTO `wy_log` VALUES ('727', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:00:49');
INSERT INTO `wy_log` VALUES ('728', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:00:55');
INSERT INTO `wy_log` VALUES ('729', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:00:55');
INSERT INTO `wy_log` VALUES ('730', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:01:01');
INSERT INTO `wy_log` VALUES ('731', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:02:46');
INSERT INTO `wy_log` VALUES ('732', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:04:38');
INSERT INTO `wy_log` VALUES ('733', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:04:38');
INSERT INTO `wy_log` VALUES ('734', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:04:39');
INSERT INTO `wy_log` VALUES ('735', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:04:41');
INSERT INTO `wy_log` VALUES ('736', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:04:45');
INSERT INTO `wy_log` VALUES ('737', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:04:49');
INSERT INTO `wy_log` VALUES ('738', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:04:50');
INSERT INTO `wy_log` VALUES ('739', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:06:20');
INSERT INTO `wy_log` VALUES ('740', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:06:25');
INSERT INTO `wy_log` VALUES ('741', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:11:23');
INSERT INTO `wy_log` VALUES ('742', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:11:29');
INSERT INTO `wy_log` VALUES ('743', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:11:33');
INSERT INTO `wy_log` VALUES ('744', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:11:40');
INSERT INTO `wy_log` VALUES ('745', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:11:42');
INSERT INTO `wy_log` VALUES ('746', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:12:28');
INSERT INTO `wy_log` VALUES ('747', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:13:28');
INSERT INTO `wy_log` VALUES ('748', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:13:30');
INSERT INTO `wy_log` VALUES ('749', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:13:31');
INSERT INTO `wy_log` VALUES ('750', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:13:33');
INSERT INTO `wy_log` VALUES ('751', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:13:35');
INSERT INTO `wy_log` VALUES ('752', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:13:36');
INSERT INTO `wy_log` VALUES ('753', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 14:20:13');
INSERT INTO `wy_log` VALUES ('754', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:09:52');
INSERT INTO `wy_log` VALUES ('755', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:08');
INSERT INTO `wy_log` VALUES ('756', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:08');
INSERT INTO `wy_log` VALUES ('757', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:14');
INSERT INTO `wy_log` VALUES ('758', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:26');
INSERT INTO `wy_log` VALUES ('759', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:27');
INSERT INTO `wy_log` VALUES ('760', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:28');
INSERT INTO `wy_log` VALUES ('761', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:31');
INSERT INTO `wy_log` VALUES ('762', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:37');
INSERT INTO `wy_log` VALUES ('763', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:10:37');
INSERT INTO `wy_log` VALUES ('764', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:27:20');
INSERT INTO `wy_log` VALUES ('765', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:42:16');
INSERT INTO `wy_log` VALUES ('766', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:42:17');
INSERT INTO `wy_log` VALUES ('767', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:42:20');
INSERT INTO `wy_log` VALUES ('768', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:42:22');
INSERT INTO `wy_log` VALUES ('769', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:43:17');
INSERT INTO `wy_log` VALUES ('770', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 15:43:18');
INSERT INTO `wy_log` VALUES ('771', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:23:25');
INSERT INTO `wy_log` VALUES ('772', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:23:42');
INSERT INTO `wy_log` VALUES ('773', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:23:50');
INSERT INTO `wy_log` VALUES ('774', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:23:50');
INSERT INTO `wy_log` VALUES ('775', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:24:00');
INSERT INTO `wy_log` VALUES ('776', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:24:25');
INSERT INTO `wy_log` VALUES ('777', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:45:13');
INSERT INTO `wy_log` VALUES ('778', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-20 16:45:14');
INSERT INTO `wy_log` VALUES ('779', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 17:25:35');
INSERT INTO `wy_log` VALUES ('780', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 17:25:48');
INSERT INTO `wy_log` VALUES ('781', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 17:25:54');
INSERT INTO `wy_log` VALUES ('782', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-03-20 17:26:00');
INSERT INTO `wy_log` VALUES ('783', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:15');
INSERT INTO `wy_log` VALUES ('784', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:21');
INSERT INTO `wy_log` VALUES ('785', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:32');
INSERT INTO `wy_log` VALUES ('786', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:35');
INSERT INTO `wy_log` VALUES ('787', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:39');
INSERT INTO `wy_log` VALUES ('788', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:41');
INSERT INTO `wy_log` VALUES ('789', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:44');
INSERT INTO `wy_log` VALUES ('790', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:47');
INSERT INTO `wy_log` VALUES ('791', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:58');
INSERT INTO `wy_log` VALUES ('792', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:09:59');
INSERT INTO `wy_log` VALUES ('793', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:22:13');
INSERT INTO `wy_log` VALUES ('794', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:22:14');
INSERT INTO `wy_log` VALUES ('795', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:22:15');
INSERT INTO `wy_log` VALUES ('796', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:22:16');
INSERT INTO `wy_log` VALUES ('797', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:41:45');
INSERT INTO `wy_log` VALUES ('798', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 09:41:46');
INSERT INTO `wy_log` VALUES ('799', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:24:13');
INSERT INTO `wy_log` VALUES ('800', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:24:17');
INSERT INTO `wy_log` VALUES ('801', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:24:47');
INSERT INTO `wy_log` VALUES ('802', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:25:47');
INSERT INTO `wy_log` VALUES ('803', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:25:52');
INSERT INTO `wy_log` VALUES ('804', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:26:29');
INSERT INTO `wy_log` VALUES ('805', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:27:05');
INSERT INTO `wy_log` VALUES ('806', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:27:08');
INSERT INTO `wy_log` VALUES ('807', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:27:12');
INSERT INTO `wy_log` VALUES ('808', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:27:26');
INSERT INTO `wy_log` VALUES ('809', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:27:44');
INSERT INTO `wy_log` VALUES ('810', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:37:05');
INSERT INTO `wy_log` VALUES ('811', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:37:19');
INSERT INTO `wy_log` VALUES ('812', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 11:37:20');
INSERT INTO `wy_log` VALUES ('813', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-21 14:22:39');
INSERT INTO `wy_log` VALUES ('814', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-21 14:23:07');
INSERT INTO `wy_log` VALUES ('815', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:34');
INSERT INTO `wy_log` VALUES ('816', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:35');
INSERT INTO `wy_log` VALUES ('817', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:36');
INSERT INTO `wy_log` VALUES ('818', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:37');
INSERT INTO `wy_log` VALUES ('819', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:38');
INSERT INTO `wy_log` VALUES ('820', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:40');
INSERT INTO `wy_log` VALUES ('821', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:41');
INSERT INTO `wy_log` VALUES ('822', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:42');
INSERT INTO `wy_log` VALUES ('823', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:43');
INSERT INTO `wy_log` VALUES ('824', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:49');
INSERT INTO `wy_log` VALUES ('825', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:52');
INSERT INTO `wy_log` VALUES ('826', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:52');
INSERT INTO `wy_log` VALUES ('827', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:54');
INSERT INTO `wy_log` VALUES ('828', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:55');
INSERT INTO `wy_log` VALUES ('829', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:48:59');
INSERT INTO `wy_log` VALUES ('830', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:00');
INSERT INTO `wy_log` VALUES ('831', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:01');
INSERT INTO `wy_log` VALUES ('832', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:07');
INSERT INTO `wy_log` VALUES ('833', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:09');
INSERT INTO `wy_log` VALUES ('834', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:10');
INSERT INTO `wy_log` VALUES ('835', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:11');
INSERT INTO `wy_log` VALUES ('836', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:13');
INSERT INTO `wy_log` VALUES ('837', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:14');
INSERT INTO `wy_log` VALUES ('838', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:14');
INSERT INTO `wy_log` VALUES ('839', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:15');
INSERT INTO `wy_log` VALUES ('840', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:19');
INSERT INTO `wy_log` VALUES ('841', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:21');
INSERT INTO `wy_log` VALUES ('842', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:22');
INSERT INTO `wy_log` VALUES ('843', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:22');
INSERT INTO `wy_log` VALUES ('844', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:23');
INSERT INTO `wy_log` VALUES ('845', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:33');
INSERT INTO `wy_log` VALUES ('846', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:41');
INSERT INTO `wy_log` VALUES ('847', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:49:42');
INSERT INTO `wy_log` VALUES ('848', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:50:20');
INSERT INTO `wy_log` VALUES ('849', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:50:21');
INSERT INTO `wy_log` VALUES ('850', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:50:22');
INSERT INTO `wy_log` VALUES ('851', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 14:50:23');
INSERT INTO `wy_log` VALUES ('852', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:06:48');
INSERT INTO `wy_log` VALUES ('853', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:25:38');
INSERT INTO `wy_log` VALUES ('854', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:25:40');
INSERT INTO `wy_log` VALUES ('855', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=change_question_status', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:25:47');
INSERT INTO `wy_log` VALUES ('856', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:25:48');
INSERT INTO `wy_log` VALUES ('857', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:27:18');
INSERT INTO `wy_log` VALUES ('858', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:28:54');
INSERT INTO `wy_log` VALUES ('859', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:35:27');
INSERT INTO `wy_log` VALUES ('860', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:36:13');
INSERT INTO `wy_log` VALUES ('861', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:36:45');
INSERT INTO `wy_log` VALUES ('862', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:38:09');
INSERT INTO `wy_log` VALUES ('863', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:38:25');
INSERT INTO `wy_log` VALUES ('864', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:38:34');
INSERT INTO `wy_log` VALUES ('865', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:38:37');
INSERT INTO `wy_log` VALUES ('866', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:48:49');
INSERT INTO `wy_log` VALUES ('867', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:46');
INSERT INTO `wy_log` VALUES ('868', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:48');
INSERT INTO `wy_log` VALUES ('869', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:51');
INSERT INTO `wy_log` VALUES ('870', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:51');
INSERT INTO `wy_log` VALUES ('871', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:52');
INSERT INTO `wy_log` VALUES ('872', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:53');
INSERT INTO `wy_log` VALUES ('873', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:53');
INSERT INTO `wy_log` VALUES ('874', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:51:55');
INSERT INTO `wy_log` VALUES ('875', '', '0', 'special', '', 'special', '?m=special&c=special&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:52:11');
INSERT INTO `wy_log` VALUES ('876', '', '0', 'special', '', 'special', '?m=special&c=special&a=html', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:52:14');
INSERT INTO `wy_log` VALUES ('877', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:52:42');
INSERT INTO `wy_log` VALUES ('878', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:52:48');
INSERT INTO `wy_log` VALUES ('879', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:53:17');
INSERT INTO `wy_log` VALUES ('880', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:53:58');
INSERT INTO `wy_log` VALUES ('881', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:53:58');
INSERT INTO `wy_log` VALUES ('882', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:53:59');
INSERT INTO `wy_log` VALUES ('883', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:00');
INSERT INTO `wy_log` VALUES ('884', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:01');
INSERT INTO `wy_log` VALUES ('885', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=priv_setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:28');
INSERT INTO `wy_log` VALUES ('886', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:29');
INSERT INTO `wy_log` VALUES ('887', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:30');
INSERT INTO `wy_log` VALUES ('888', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=priv_setting', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:51');
INSERT INTO `wy_log` VALUES ('889', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:52');
INSERT INTO `wy_log` VALUES ('890', '', '0', 'admin', '', 'role', '?m=admin&c=role&a=role_priv', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:54:53');
INSERT INTO `wy_log` VALUES ('891', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:55:50');
INSERT INTO `wy_log` VALUES ('892', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:56:18');
INSERT INTO `wy_log` VALUES ('893', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:56:37');
INSERT INTO `wy_log` VALUES ('894', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-21 16:57:28');
INSERT INTO `wy_log` VALUES ('895', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:29:13');
INSERT INTO `wy_log` VALUES ('896', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:29:16');
INSERT INTO `wy_log` VALUES ('897', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-21 17:41:41');
INSERT INTO `wy_log` VALUES ('898', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-21 17:41:41');
INSERT INTO `wy_log` VALUES ('899', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-21 17:41:49');
INSERT INTO `wy_log` VALUES ('900', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:41:55');
INSERT INTO `wy_log` VALUES ('901', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:02');
INSERT INTO `wy_log` VALUES ('902', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:10');
INSERT INTO `wy_log` VALUES ('903', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:11');
INSERT INTO `wy_log` VALUES ('904', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:35');
INSERT INTO `wy_log` VALUES ('905', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:37');
INSERT INTO `wy_log` VALUES ('906', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:38');
INSERT INTO `wy_log` VALUES ('907', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:41');
INSERT INTO `wy_log` VALUES ('908', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:43');
INSERT INTO `wy_log` VALUES ('909', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-21 17:42:43');
INSERT INTO `wy_log` VALUES ('910', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 08:55:02');
INSERT INTO `wy_log` VALUES ('911', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 08:55:04');
INSERT INTO `wy_log` VALUES ('912', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:11:36');
INSERT INTO `wy_log` VALUES ('913', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:11:39');
INSERT INTO `wy_log` VALUES ('914', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:17');
INSERT INTO `wy_log` VALUES ('915', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:19');
INSERT INTO `wy_log` VALUES ('916', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:21');
INSERT INTO `wy_log` VALUES ('917', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:22');
INSERT INTO `wy_log` VALUES ('918', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:23');
INSERT INTO `wy_log` VALUES ('919', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:24');
INSERT INTO `wy_log` VALUES ('920', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:27');
INSERT INTO `wy_log` VALUES ('921', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:29');
INSERT INTO `wy_log` VALUES ('922', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:30');
INSERT INTO `wy_log` VALUES ('923', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:12:36');
INSERT INTO `wy_log` VALUES ('924', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:08');
INSERT INTO `wy_log` VALUES ('925', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:11');
INSERT INTO `wy_log` VALUES ('926', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:33');
INSERT INTO `wy_log` VALUES ('927', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:34');
INSERT INTO `wy_log` VALUES ('928', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:35');
INSERT INTO `wy_log` VALUES ('929', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:36');
INSERT INTO `wy_log` VALUES ('930', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:37');
INSERT INTO `wy_log` VALUES ('931', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:48');
INSERT INTO `wy_log` VALUES ('932', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:49');
INSERT INTO `wy_log` VALUES ('933', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:50');
INSERT INTO `wy_log` VALUES ('934', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:13:52');
INSERT INTO `wy_log` VALUES ('935', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:14:06');
INSERT INTO `wy_log` VALUES ('936', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:14:19');
INSERT INTO `wy_log` VALUES ('937', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:14:25');
INSERT INTO `wy_log` VALUES ('938', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:15:12');
INSERT INTO `wy_log` VALUES ('939', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:15:22');
INSERT INTO `wy_log` VALUES ('940', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:16:23');
INSERT INTO `wy_log` VALUES ('941', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:17:42');
INSERT INTO `wy_log` VALUES ('942', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:18:12');
INSERT INTO `wy_log` VALUES ('943', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:18:33');
INSERT INTO `wy_log` VALUES ('944', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:18:40');
INSERT INTO `wy_log` VALUES ('945', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:18:51');
INSERT INTO `wy_log` VALUES ('946', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:20:10');
INSERT INTO `wy_log` VALUES ('947', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:20:18');
INSERT INTO `wy_log` VALUES ('948', '', '0', 'content', '', 'type_manage', '?m=content&c=type_manage&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:20:32');
INSERT INTO `wy_log` VALUES ('949', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:21:01');
INSERT INTO `wy_log` VALUES ('950', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:21:15');
INSERT INTO `wy_log` VALUES ('951', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:21:17');
INSERT INTO `wy_log` VALUES ('952', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:21:34');
INSERT INTO `wy_log` VALUES ('953', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:21:58');
INSERT INTO `wy_log` VALUES ('954', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:22:08');
INSERT INTO `wy_log` VALUES ('955', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:22:16');
INSERT INTO `wy_log` VALUES ('956', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:22:23');
INSERT INTO `wy_log` VALUES ('957', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:22:35');
INSERT INTO `wy_log` VALUES ('958', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:22:56');
INSERT INTO `wy_log` VALUES ('959', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:23:06');
INSERT INTO `wy_log` VALUES ('960', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:23:21');
INSERT INTO `wy_log` VALUES ('961', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:23:34');
INSERT INTO `wy_log` VALUES ('962', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:23:49');
INSERT INTO `wy_log` VALUES ('963', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:23:53');
INSERT INTO `wy_log` VALUES ('964', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:24:33');
INSERT INTO `wy_log` VALUES ('965', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:24:58');
INSERT INTO `wy_log` VALUES ('966', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:25:44');
INSERT INTO `wy_log` VALUES ('967', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:27:23');
INSERT INTO `wy_log` VALUES ('968', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:27:36');
INSERT INTO `wy_log` VALUES ('969', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:28:41');
INSERT INTO `wy_log` VALUES ('970', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:28:53');
INSERT INTO `wy_log` VALUES ('971', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:28:57');
INSERT INTO `wy_log` VALUES ('972', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:29:52');
INSERT INTO `wy_log` VALUES ('973', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:30:05');
INSERT INTO `wy_log` VALUES ('974', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:30:20');
INSERT INTO `wy_log` VALUES ('975', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:30:26');
INSERT INTO `wy_log` VALUES ('976', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:30:51');
INSERT INTO `wy_log` VALUES ('977', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:31:09');
INSERT INTO `wy_log` VALUES ('978', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:31:42');
INSERT INTO `wy_log` VALUES ('979', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:31:49');
INSERT INTO `wy_log` VALUES ('980', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:31:51');
INSERT INTO `wy_log` VALUES ('981', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:31:56');
INSERT INTO `wy_log` VALUES ('982', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:39:33');
INSERT INTO `wy_log` VALUES ('983', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:40:45');
INSERT INTO `wy_log` VALUES ('984', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:40:54');
INSERT INTO `wy_log` VALUES ('985', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:41:17');
INSERT INTO `wy_log` VALUES ('986', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:41:25');
INSERT INTO `wy_log` VALUES ('987', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:41:37');
INSERT INTO `wy_log` VALUES ('988', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:42:40');
INSERT INTO `wy_log` VALUES ('989', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:45:31');
INSERT INTO `wy_log` VALUES ('990', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:45:41');
INSERT INTO `wy_log` VALUES ('991', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:46:56');
INSERT INTO `wy_log` VALUES ('992', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:47:00');
INSERT INTO `wy_log` VALUES ('993', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:47:04');
INSERT INTO `wy_log` VALUES ('994', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:47:22');
INSERT INTO `wy_log` VALUES ('995', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:48:03');
INSERT INTO `wy_log` VALUES ('996', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=export', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:48:27');
INSERT INTO `wy_log` VALUES ('997', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:49:21');
INSERT INTO `wy_log` VALUES ('998', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:49:35');
INSERT INTO `wy_log` VALUES ('999', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:49:42');
INSERT INTO `wy_log` VALUES ('1000', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:49:55');
INSERT INTO `wy_log` VALUES ('1001', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:50:51');
INSERT INTO `wy_log` VALUES ('1002', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:51:18');
INSERT INTO `wy_log` VALUES ('1003', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:51:46');
INSERT INTO `wy_log` VALUES ('1004', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:51:51');
INSERT INTO `wy_log` VALUES ('1005', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:00');
INSERT INTO `wy_log` VALUES ('1006', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:03');
INSERT INTO `wy_log` VALUES ('1007', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:12');
INSERT INTO `wy_log` VALUES ('1008', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:18');
INSERT INTO `wy_log` VALUES ('1009', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:21');
INSERT INTO `wy_log` VALUES ('1010', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:25');
INSERT INTO `wy_log` VALUES ('1011', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:36');
INSERT INTO `wy_log` VALUES ('1012', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:41');
INSERT INTO `wy_log` VALUES ('1013', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:51');
INSERT INTO `wy_log` VALUES ('1014', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:52:57');
INSERT INTO `wy_log` VALUES ('1015', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:04');
INSERT INTO `wy_log` VALUES ('1016', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:08');
INSERT INTO `wy_log` VALUES ('1017', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:12');
INSERT INTO `wy_log` VALUES ('1018', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:24');
INSERT INTO `wy_log` VALUES ('1019', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:29');
INSERT INTO `wy_log` VALUES ('1020', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:40');
INSERT INTO `wy_log` VALUES ('1021', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:50');
INSERT INTO `wy_log` VALUES ('1022', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:53:59');
INSERT INTO `wy_log` VALUES ('1023', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:54:38');
INSERT INTO `wy_log` VALUES ('1024', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:55:14');
INSERT INTO `wy_log` VALUES ('1025', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:55:59');
INSERT INTO `wy_log` VALUES ('1026', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:56:30');
INSERT INTO `wy_log` VALUES ('1027', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:57:03');
INSERT INTO `wy_log` VALUES ('1028', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:57:18');
INSERT INTO `wy_log` VALUES ('1029', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 09:57:25');
INSERT INTO `wy_log` VALUES ('1030', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:01:02');
INSERT INTO `wy_log` VALUES ('1031', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:01:46');
INSERT INTO `wy_log` VALUES ('1032', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:04:31');
INSERT INTO `wy_log` VALUES ('1033', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:05:36');
INSERT INTO `wy_log` VALUES ('1034', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:22:22');
INSERT INTO `wy_log` VALUES ('1035', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:24:20');
INSERT INTO `wy_log` VALUES ('1036', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:24:46');
INSERT INTO `wy_log` VALUES ('1037', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:24:49');
INSERT INTO `wy_log` VALUES ('1038', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:24:53');
INSERT INTO `wy_log` VALUES ('1039', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:24:57');
INSERT INTO `wy_log` VALUES ('1040', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:25:11');
INSERT INTO `wy_log` VALUES ('1041', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:25:15');
INSERT INTO `wy_log` VALUES ('1042', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:26:12');
INSERT INTO `wy_log` VALUES ('1043', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:27:02');
INSERT INTO `wy_log` VALUES ('1044', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:27:20');
INSERT INTO `wy_log` VALUES ('1045', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:27:23');
INSERT INTO `wy_log` VALUES ('1046', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:27:25');
INSERT INTO `wy_log` VALUES ('1047', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:27:33');
INSERT INTO `wy_log` VALUES ('1048', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:27:38');
INSERT INTO `wy_log` VALUES ('1049', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:28:01');
INSERT INTO `wy_log` VALUES ('1050', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:28:04');
INSERT INTO `wy_log` VALUES ('1051', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:28:08');
INSERT INTO `wy_log` VALUES ('1052', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:28:12');
INSERT INTO `wy_log` VALUES ('1053', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:28:15');
INSERT INTO `wy_log` VALUES ('1054', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:28:18');
INSERT INTO `wy_log` VALUES ('1055', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:28:26');
INSERT INTO `wy_log` VALUES ('1056', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:37:24');
INSERT INTO `wy_log` VALUES ('1057', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:37:31');
INSERT INTO `wy_log` VALUES ('1058', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:37:36');
INSERT INTO `wy_log` VALUES ('1059', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:37:42');
INSERT INTO `wy_log` VALUES ('1060', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:37:53');
INSERT INTO `wy_log` VALUES ('1061', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:37:57');
INSERT INTO `wy_log` VALUES ('1062', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 10:38:02');
INSERT INTO `wy_log` VALUES ('1063', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:14:20');
INSERT INTO `wy_log` VALUES ('1064', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:15:21');
INSERT INTO `wy_log` VALUES ('1065', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:15:50');
INSERT INTO `wy_log` VALUES ('1066', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:20:17');
INSERT INTO `wy_log` VALUES ('1067', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:20:26');
INSERT INTO `wy_log` VALUES ('1068', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:25:50');
INSERT INTO `wy_log` VALUES ('1069', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:25:59');
INSERT INTO `wy_log` VALUES ('1070', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:26:15');
INSERT INTO `wy_log` VALUES ('1071', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:26:16');
INSERT INTO `wy_log` VALUES ('1072', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:26:18');
INSERT INTO `wy_log` VALUES ('1073', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:31:36');
INSERT INTO `wy_log` VALUES ('1074', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:31:39');
INSERT INTO `wy_log` VALUES ('1075', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:31:39');
INSERT INTO `wy_log` VALUES ('1076', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:31:53');
INSERT INTO `wy_log` VALUES ('1077', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:32:03');
INSERT INTO `wy_log` VALUES ('1078', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:32:04');
INSERT INTO `wy_log` VALUES ('1079', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:32:06');
INSERT INTO `wy_log` VALUES ('1080', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:32:07');
INSERT INTO `wy_log` VALUES ('1081', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:34:11');
INSERT INTO `wy_log` VALUES ('1082', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:34:12');
INSERT INTO `wy_log` VALUES ('1083', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:34:40');
INSERT INTO `wy_log` VALUES ('1084', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:34:42');
INSERT INTO `wy_log` VALUES ('1085', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:35:09');
INSERT INTO `wy_log` VALUES ('1086', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:35:11');
INSERT INTO `wy_log` VALUES ('1087', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:35:31');
INSERT INTO `wy_log` VALUES ('1088', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:35:48');
INSERT INTO `wy_log` VALUES ('1089', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:35:50');
INSERT INTO `wy_log` VALUES ('1090', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:13');
INSERT INTO `wy_log` VALUES ('1091', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:23');
INSERT INTO `wy_log` VALUES ('1092', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:33');
INSERT INTO `wy_log` VALUES ('1093', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:35');
INSERT INTO `wy_log` VALUES ('1094', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:36');
INSERT INTO `wy_log` VALUES ('1095', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:37');
INSERT INTO `wy_log` VALUES ('1096', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:38');
INSERT INTO `wy_log` VALUES ('1097', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:39');
INSERT INTO `wy_log` VALUES ('1098', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:44');
INSERT INTO `wy_log` VALUES ('1099', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:54');
INSERT INTO `wy_log` VALUES ('1100', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:57');
INSERT INTO `wy_log` VALUES ('1101', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:36:59');
INSERT INTO `wy_log` VALUES ('1102', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:39:24');
INSERT INTO `wy_log` VALUES ('1103', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:39:57');
INSERT INTO `wy_log` VALUES ('1104', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:40:22');
INSERT INTO `wy_log` VALUES ('1105', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:40:54');
INSERT INTO `wy_log` VALUES ('1106', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:42:35');
INSERT INTO `wy_log` VALUES ('1107', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:45:46');
INSERT INTO `wy_log` VALUES ('1108', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:46:59');
INSERT INTO `wy_log` VALUES ('1109', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:47:12');
INSERT INTO `wy_log` VALUES ('1110', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:47:20');
INSERT INTO `wy_log` VALUES ('1111', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:47:43');
INSERT INTO `wy_log` VALUES ('1112', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:47:44');
INSERT INTO `wy_log` VALUES ('1113', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:47:48');
INSERT INTO `wy_log` VALUES ('1114', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:47:50');
INSERT INTO `wy_log` VALUES ('1115', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:48:01');
INSERT INTO `wy_log` VALUES ('1116', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:48:12');
INSERT INTO `wy_log` VALUES ('1117', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:48:16');
INSERT INTO `wy_log` VALUES ('1118', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:48:18');
INSERT INTO `wy_log` VALUES ('1119', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:48:21');
INSERT INTO `wy_log` VALUES ('1120', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:48:26');
INSERT INTO `wy_log` VALUES ('1121', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:48:33');
INSERT INTO `wy_log` VALUES ('1122', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:49:23');
INSERT INTO `wy_log` VALUES ('1123', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:49:45');
INSERT INTO `wy_log` VALUES ('1124', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:49:53');
INSERT INTO `wy_log` VALUES ('1125', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:17');
INSERT INTO `wy_log` VALUES ('1126', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:26');
INSERT INTO `wy_log` VALUES ('1127', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:29');
INSERT INTO `wy_log` VALUES ('1128', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:35');
INSERT INTO `wy_log` VALUES ('1129', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:36');
INSERT INTO `wy_log` VALUES ('1130', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:41');
INSERT INTO `wy_log` VALUES ('1131', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:42');
INSERT INTO `wy_log` VALUES ('1132', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:42');
INSERT INTO `wy_log` VALUES ('1133', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:44');
INSERT INTO `wy_log` VALUES ('1134', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:50:44');
INSERT INTO `wy_log` VALUES ('1135', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:51:03');
INSERT INTO `wy_log` VALUES ('1136', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:51:06');
INSERT INTO `wy_log` VALUES ('1137', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:51:14');
INSERT INTO `wy_log` VALUES ('1138', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:51:14');
INSERT INTO `wy_log` VALUES ('1139', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:51:16');
INSERT INTO `wy_log` VALUES ('1140', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:51:17');
INSERT INTO `wy_log` VALUES ('1141', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:51:18');
INSERT INTO `wy_log` VALUES ('1142', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:21');
INSERT INTO `wy_log` VALUES ('1143', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:22');
INSERT INTO `wy_log` VALUES ('1144', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:22');
INSERT INTO `wy_log` VALUES ('1145', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:23');
INSERT INTO `wy_log` VALUES ('1146', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:23');
INSERT INTO `wy_log` VALUES ('1147', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:27');
INSERT INTO `wy_log` VALUES ('1148', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:27');
INSERT INTO `wy_log` VALUES ('1149', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:28');
INSERT INTO `wy_log` VALUES ('1150', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 11:56:28');
INSERT INTO `wy_log` VALUES ('1151', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:38:36');
INSERT INTO `wy_log` VALUES ('1152', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:38:38');
INSERT INTO `wy_log` VALUES ('1153', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:38:39');
INSERT INTO `wy_log` VALUES ('1154', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:38:41');
INSERT INTO `wy_log` VALUES ('1155', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:38:41');
INSERT INTO `wy_log` VALUES ('1156', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:38:43');
INSERT INTO `wy_log` VALUES ('1157', '', '0', 'formguide', '', 'formguide', '?m=formguide&c=formguide&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:39:53');
INSERT INTO `wy_log` VALUES ('1158', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:40:12');
INSERT INTO `wy_log` VALUES ('1159', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:04');
INSERT INTO `wy_log` VALUES ('1160', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:05');
INSERT INTO `wy_log` VALUES ('1161', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:23');
INSERT INTO `wy_log` VALUES ('1162', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:25');
INSERT INTO `wy_log` VALUES ('1163', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:26');
INSERT INTO `wy_log` VALUES ('1164', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:31');
INSERT INTO `wy_log` VALUES ('1165', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:33');
INSERT INTO `wy_log` VALUES ('1166', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:41');
INSERT INTO `wy_log` VALUES ('1167', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:41:44');
INSERT INTO `wy_log` VALUES ('1168', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:42:51');
INSERT INTO `wy_log` VALUES ('1169', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:43:04');
INSERT INTO `wy_log` VALUES ('1170', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:43:04');
INSERT INTO `wy_log` VALUES ('1171', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:43:14');
INSERT INTO `wy_log` VALUES ('1172', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:44:38');
INSERT INTO `wy_log` VALUES ('1173', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 13:45:04');
INSERT INTO `wy_log` VALUES ('1174', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 13:49:11');
INSERT INTO `wy_log` VALUES ('1175', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 13:49:20');
INSERT INTO `wy_log` VALUES ('1176', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 13:49:22');
INSERT INTO `wy_log` VALUES ('1177', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 13:49:35');
INSERT INTO `wy_log` VALUES ('1178', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 13:49:36');
INSERT INTO `wy_log` VALUES ('1179', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 13:49:45');
INSERT INTO `wy_log` VALUES ('1180', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 13:49:49');
INSERT INTO `wy_log` VALUES ('1181', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-22 13:49:56');
INSERT INTO `wy_log` VALUES ('1182', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-22 13:50:00');
INSERT INTO `wy_log` VALUES ('1183', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-22 13:57:12');
INSERT INTO `wy_log` VALUES ('1184', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-22 13:57:17');
INSERT INTO `wy_log` VALUES ('1185', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:00:50');
INSERT INTO `wy_log` VALUES ('1186', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:00:58');
INSERT INTO `wy_log` VALUES ('1187', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:01:11');
INSERT INTO `wy_log` VALUES ('1188', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:01:17');
INSERT INTO `wy_log` VALUES ('1189', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:02:17');
INSERT INTO `wy_log` VALUES ('1190', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=lists', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:02:36');
INSERT INTO `wy_log` VALUES ('1191', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:02:43');
INSERT INTO `wy_log` VALUES ('1192', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:02:56');
INSERT INTO `wy_log` VALUES ('1193', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:03:37');
INSERT INTO `wy_log` VALUES ('1194', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:03:38');
INSERT INTO `wy_log` VALUES ('1195', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:03:39');
INSERT INTO `wy_log` VALUES ('1196', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:03:43');
INSERT INTO `wy_log` VALUES ('1197', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:03:49');
INSERT INTO `wy_log` VALUES ('1198', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:08:33');
INSERT INTO `wy_log` VALUES ('1199', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 14:08:40');
INSERT INTO `wy_log` VALUES ('1200', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 16:00:02');
INSERT INTO `wy_log` VALUES ('1201', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-22 16:00:17');
INSERT INTO `wy_log` VALUES ('1202', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:00:25');
INSERT INTO `wy_log` VALUES ('1203', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:00:54');
INSERT INTO `wy_log` VALUES ('1204', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:01:00');
INSERT INTO `wy_log` VALUES ('1205', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:01:00');
INSERT INTO `wy_log` VALUES ('1206', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:01:02');
INSERT INTO `wy_log` VALUES ('1207', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:01:03');
INSERT INTO `wy_log` VALUES ('1208', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:01:04');
INSERT INTO `wy_log` VALUES ('1209', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:04:09');
INSERT INTO `wy_log` VALUES ('1210', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:04:16');
INSERT INTO `wy_log` VALUES ('1211', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:04:19');
INSERT INTO `wy_log` VALUES ('1212', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:06:05');
INSERT INTO `wy_log` VALUES ('1213', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=delete', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:18:03');
INSERT INTO `wy_log` VALUES ('1214', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:18:05');
INSERT INTO `wy_log` VALUES ('1215', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:20:00');
INSERT INTO `wy_log` VALUES ('1216', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:20:05');
INSERT INTO `wy_log` VALUES ('1217', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:20:09');
INSERT INTO `wy_log` VALUES ('1218', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:20:22');
INSERT INTO `wy_log` VALUES ('1219', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:20:26');
INSERT INTO `wy_log` VALUES ('1220', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:20:29');
INSERT INTO `wy_log` VALUES ('1221', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:21:00');
INSERT INTO `wy_log` VALUES ('1222', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:21:18');
INSERT INTO `wy_log` VALUES ('1223', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:21:21');
INSERT INTO `wy_log` VALUES ('1224', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:21:23');
INSERT INTO `wy_log` VALUES ('1225', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:21:28');
INSERT INTO `wy_log` VALUES ('1226', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:30:08');
INSERT INTO `wy_log` VALUES ('1227', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:30:08');
INSERT INTO `wy_log` VALUES ('1228', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:30:34');
INSERT INTO `wy_log` VALUES ('1229', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:30:47');
INSERT INTO `wy_log` VALUES ('1230', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:30:56');
INSERT INTO `wy_log` VALUES ('1231', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:30:59');
INSERT INTO `wy_log` VALUES ('1232', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:31:40');
INSERT INTO `wy_log` VALUES ('1233', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:31:42');
INSERT INTO `wy_log` VALUES ('1234', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:31:46');
INSERT INTO `wy_log` VALUES ('1235', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:31:53');
INSERT INTO `wy_log` VALUES ('1236', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:31:56');
INSERT INTO `wy_log` VALUES ('1237', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:01');
INSERT INTO `wy_log` VALUES ('1238', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:06');
INSERT INTO `wy_log` VALUES ('1239', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:10');
INSERT INTO `wy_log` VALUES ('1240', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:11');
INSERT INTO `wy_log` VALUES ('1241', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:15');
INSERT INTO `wy_log` VALUES ('1242', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:24');
INSERT INTO `wy_log` VALUES ('1243', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:31');
INSERT INTO `wy_log` VALUES ('1244', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:32:46');
INSERT INTO `wy_log` VALUES ('1245', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:33:13');
INSERT INTO `wy_log` VALUES ('1246', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:33:28');
INSERT INTO `wy_log` VALUES ('1247', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:34:02');
INSERT INTO `wy_log` VALUES ('1248', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:34:24');
INSERT INTO `wy_log` VALUES ('1249', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:35:14');
INSERT INTO `wy_log` VALUES ('1250', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:35:57');
INSERT INTO `wy_log` VALUES ('1251', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:06');
INSERT INTO `wy_log` VALUES ('1252', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:08');
INSERT INTO `wy_log` VALUES ('1253', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:09');
INSERT INTO `wy_log` VALUES ('1254', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:11');
INSERT INTO `wy_log` VALUES ('1255', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:38');
INSERT INTO `wy_log` VALUES ('1256', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:43');
INSERT INTO `wy_log` VALUES ('1257', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:43');
INSERT INTO `wy_log` VALUES ('1258', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:36:57');
INSERT INTO `wy_log` VALUES ('1259', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:07');
INSERT INTO `wy_log` VALUES ('1260', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:09');
INSERT INTO `wy_log` VALUES ('1261', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:10');
INSERT INTO `wy_log` VALUES ('1262', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:31');
INSERT INTO `wy_log` VALUES ('1263', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:34');
INSERT INTO `wy_log` VALUES ('1264', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:45');
INSERT INTO `wy_log` VALUES ('1265', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:57');
INSERT INTO `wy_log` VALUES ('1266', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:39:59');
INSERT INTO `wy_log` VALUES ('1267', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:00');
INSERT INTO `wy_log` VALUES ('1268', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:01');
INSERT INTO `wy_log` VALUES ('1269', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:01');
INSERT INTO `wy_log` VALUES ('1270', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:02');
INSERT INTO `wy_log` VALUES ('1271', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:03');
INSERT INTO `wy_log` VALUES ('1272', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:03');
INSERT INTO `wy_log` VALUES ('1273', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:04');
INSERT INTO `wy_log` VALUES ('1274', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:04');
INSERT INTO `wy_log` VALUES ('1275', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:05');
INSERT INTO `wy_log` VALUES ('1276', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:05');
INSERT INTO `wy_log` VALUES ('1277', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:06');
INSERT INTO `wy_log` VALUES ('1278', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:18');
INSERT INTO `wy_log` VALUES ('1279', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:40:25');
INSERT INTO `wy_log` VALUES ('1280', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:40:29');
INSERT INTO `wy_log` VALUES ('1281', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:40:33');
INSERT INTO `wy_log` VALUES ('1282', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:40:39');
INSERT INTO `wy_log` VALUES ('1283', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:40:40');
INSERT INTO `wy_log` VALUES ('1284', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:40:41');
INSERT INTO `wy_log` VALUES ('1285', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:40:45');
INSERT INTO `wy_log` VALUES ('1286', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:40:46');
INSERT INTO `wy_log` VALUES ('1287', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:03');
INSERT INTO `wy_log` VALUES ('1288', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:04');
INSERT INTO `wy_log` VALUES ('1289', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:11');
INSERT INTO `wy_log` VALUES ('1290', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:15');
INSERT INTO `wy_log` VALUES ('1291', '', '0', 'member', '', 'member', '?m=member&c=member&a=search', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:18');
INSERT INTO `wy_log` VALUES ('1292', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:45');
INSERT INTO `wy_log` VALUES ('1293', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:49');
INSERT INTO `wy_log` VALUES ('1294', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-22 16:41:51');
INSERT INTO `wy_log` VALUES ('1295', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:42:10');
INSERT INTO `wy_log` VALUES ('1296', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:42:52');
INSERT INTO `wy_log` VALUES ('1297', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:42:53');
INSERT INTO `wy_log` VALUES ('1298', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:42:54');
INSERT INTO `wy_log` VALUES ('1299', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:42:55');
INSERT INTO `wy_log` VALUES ('1300', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:00');
INSERT INTO `wy_log` VALUES ('1301', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:02');
INSERT INTO `wy_log` VALUES ('1302', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:09');
INSERT INTO `wy_log` VALUES ('1303', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:10');
INSERT INTO `wy_log` VALUES ('1304', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:23');
INSERT INTO `wy_log` VALUES ('1305', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:24');
INSERT INTO `wy_log` VALUES ('1306', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:46');
INSERT INTO `wy_log` VALUES ('1307', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:48:49');
INSERT INTO `wy_log` VALUES ('1308', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:49:27');
INSERT INTO `wy_log` VALUES ('1309', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:51:00');
INSERT INTO `wy_log` VALUES ('1310', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:51:03');
INSERT INTO `wy_log` VALUES ('1311', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:51:25');
INSERT INTO `wy_log` VALUES ('1312', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:51:36');
INSERT INTO `wy_log` VALUES ('1313', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:51:37');
INSERT INTO `wy_log` VALUES ('1314', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:51:38');
INSERT INTO `wy_log` VALUES ('1315', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:52:11');
INSERT INTO `wy_log` VALUES ('1316', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:52:27');
INSERT INTO `wy_log` VALUES ('1317', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:52:34');
INSERT INTO `wy_log` VALUES ('1318', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:52:52');
INSERT INTO `wy_log` VALUES ('1319', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:52:58');
INSERT INTO `wy_log` VALUES ('1320', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:53:01');
INSERT INTO `wy_log` VALUES ('1321', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:53:24');
INSERT INTO `wy_log` VALUES ('1322', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:53:35');
INSERT INTO `wy_log` VALUES ('1323', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:53:38');
INSERT INTO `wy_log` VALUES ('1324', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:53:40');
INSERT INTO `wy_log` VALUES ('1325', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:53:55');
INSERT INTO `wy_log` VALUES ('1326', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:53:56');
INSERT INTO `wy_log` VALUES ('1327', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:54:38');
INSERT INTO `wy_log` VALUES ('1328', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:17');
INSERT INTO `wy_log` VALUES ('1329', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:19');
INSERT INTO `wy_log` VALUES ('1330', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:23');
INSERT INTO `wy_log` VALUES ('1331', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:27');
INSERT INTO `wy_log` VALUES ('1332', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:29');
INSERT INTO `wy_log` VALUES ('1333', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:34');
INSERT INTO `wy_log` VALUES ('1334', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:35');
INSERT INTO `wy_log` VALUES ('1335', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:45');
INSERT INTO `wy_log` VALUES ('1336', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:58:47');
INSERT INTO `wy_log` VALUES ('1337', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:59:47');
INSERT INTO `wy_log` VALUES ('1338', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:59:49');
INSERT INTO `wy_log` VALUES ('1339', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:59:51');
INSERT INTO `wy_log` VALUES ('1340', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 16:59:52');
INSERT INTO `wy_log` VALUES ('1341', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:00:09');
INSERT INTO `wy_log` VALUES ('1342', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:00:13');
INSERT INTO `wy_log` VALUES ('1343', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:02:07');
INSERT INTO `wy_log` VALUES ('1344', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:02:29');
INSERT INTO `wy_log` VALUES ('1345', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:03:28');
INSERT INTO `wy_log` VALUES ('1346', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:03:30');
INSERT INTO `wy_log` VALUES ('1347', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:03:50');
INSERT INTO `wy_log` VALUES ('1348', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:04:17');
INSERT INTO `wy_log` VALUES ('1349', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:04:21');
INSERT INTO `wy_log` VALUES ('1350', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:04:41');
INSERT INTO `wy_log` VALUES ('1351', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:04:42');
INSERT INTO `wy_log` VALUES ('1352', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:04:52');
INSERT INTO `wy_log` VALUES ('1353', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:05:06');
INSERT INTO `wy_log` VALUES ('1354', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:05:18');
INSERT INTO `wy_log` VALUES ('1355', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:06:07');
INSERT INTO `wy_log` VALUES ('1356', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:07:00');
INSERT INTO `wy_log` VALUES ('1357', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:07:13');
INSERT INTO `wy_log` VALUES ('1358', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:07:16');
INSERT INTO `wy_log` VALUES ('1359', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:07:26');
INSERT INTO `wy_log` VALUES ('1360', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:07:48');
INSERT INTO `wy_log` VALUES ('1361', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:07:52');
INSERT INTO `wy_log` VALUES ('1362', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:07');
INSERT INTO `wy_log` VALUES ('1363', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:16');
INSERT INTO `wy_log` VALUES ('1364', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:25');
INSERT INTO `wy_log` VALUES ('1365', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:25');
INSERT INTO `wy_log` VALUES ('1366', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:27');
INSERT INTO `wy_log` VALUES ('1367', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:35');
INSERT INTO `wy_log` VALUES ('1368', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:35');
INSERT INTO `wy_log` VALUES ('1369', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:54');
INSERT INTO `wy_log` VALUES ('1370', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:08:55');
INSERT INTO `wy_log` VALUES ('1371', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:09:36');
INSERT INTO `wy_log` VALUES ('1372', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:18:11');
INSERT INTO `wy_log` VALUES ('1373', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:18:13');
INSERT INTO `wy_log` VALUES ('1374', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:18:14');
INSERT INTO `wy_log` VALUES ('1375', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:18:24');
INSERT INTO `wy_log` VALUES ('1376', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:18:25');
INSERT INTO `wy_log` VALUES ('1377', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:25:38');
INSERT INTO `wy_log` VALUES ('1378', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:25:39');
INSERT INTO `wy_log` VALUES ('1379', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:25:44');
INSERT INTO `wy_log` VALUES ('1380', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:25:45');
INSERT INTO `wy_log` VALUES ('1381', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:26:01');
INSERT INTO `wy_log` VALUES ('1382', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:26:12');
INSERT INTO `wy_log` VALUES ('1383', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:26:13');
INSERT INTO `wy_log` VALUES ('1384', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:26:16');
INSERT INTO `wy_log` VALUES ('1385', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:26:19');
INSERT INTO `wy_log` VALUES ('1386', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:30:27');
INSERT INTO `wy_log` VALUES ('1387', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:31:03');
INSERT INTO `wy_log` VALUES ('1388', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:31:04');
INSERT INTO `wy_log` VALUES ('1389', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:31:09');
INSERT INTO `wy_log` VALUES ('1390', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:31:10');
INSERT INTO `wy_log` VALUES ('1391', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:02');
INSERT INTO `wy_log` VALUES ('1392', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:10');
INSERT INTO `wy_log` VALUES ('1393', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:11');
INSERT INTO `wy_log` VALUES ('1394', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:11');
INSERT INTO `wy_log` VALUES ('1395', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:15');
INSERT INTO `wy_log` VALUES ('1396', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:19');
INSERT INTO `wy_log` VALUES ('1397', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:20');
INSERT INTO `wy_log` VALUES ('1398', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:36:55');
INSERT INTO `wy_log` VALUES ('1399', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:37:06');
INSERT INTO `wy_log` VALUES ('1400', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:24');
INSERT INTO `wy_log` VALUES ('1401', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:25');
INSERT INTO `wy_log` VALUES ('1402', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:30');
INSERT INTO `wy_log` VALUES ('1403', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:35');
INSERT INTO `wy_log` VALUES ('1404', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:40');
INSERT INTO `wy_log` VALUES ('1405', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:42');
INSERT INTO `wy_log` VALUES ('1406', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:43');
INSERT INTO `wy_log` VALUES ('1407', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:43');
INSERT INTO `wy_log` VALUES ('1408', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:46');
INSERT INTO `wy_log` VALUES ('1409', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:39:51');
INSERT INTO `wy_log` VALUES ('1410', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:42:22');
INSERT INTO `wy_log` VALUES ('1411', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:42:23');
INSERT INTO `wy_log` VALUES ('1412', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:42:35');
INSERT INTO `wy_log` VALUES ('1413', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:42:36');
INSERT INTO `wy_log` VALUES ('1414', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:42:37');
INSERT INTO `wy_log` VALUES ('1415', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:42:38');
INSERT INTO `wy_log` VALUES ('1416', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:42:53');
INSERT INTO `wy_log` VALUES ('1417', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:43:06');
INSERT INTO `wy_log` VALUES ('1418', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:15');
INSERT INTO `wy_log` VALUES ('1419', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:20');
INSERT INTO `wy_log` VALUES ('1420', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:22');
INSERT INTO `wy_log` VALUES ('1421', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:24');
INSERT INTO `wy_log` VALUES ('1422', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:24');
INSERT INTO `wy_log` VALUES ('1423', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:26');
INSERT INTO `wy_log` VALUES ('1424', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:29');
INSERT INTO `wy_log` VALUES ('1425', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:36');
INSERT INTO `wy_log` VALUES ('1426', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:43');
INSERT INTO `wy_log` VALUES ('1427', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:44:46');
INSERT INTO `wy_log` VALUES ('1428', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:45:20');
INSERT INTO `wy_log` VALUES ('1429', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:45:22');
INSERT INTO `wy_log` VALUES ('1430', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:45:22');
INSERT INTO `wy_log` VALUES ('1431', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:46:37');
INSERT INTO `wy_log` VALUES ('1432', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:46:38');
INSERT INTO `wy_log` VALUES ('1433', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:48:38');
INSERT INTO `wy_log` VALUES ('1434', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:48:40');
INSERT INTO `wy_log` VALUES ('1435', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:49:24');
INSERT INTO `wy_log` VALUES ('1436', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:49:26');
INSERT INTO `wy_log` VALUES ('1437', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:49:29');
INSERT INTO `wy_log` VALUES ('1438', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:52:06');
INSERT INTO `wy_log` VALUES ('1439', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:52:08');
INSERT INTO `wy_log` VALUES ('1440', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:52:10');
INSERT INTO `wy_log` VALUES ('1441', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:52:28');
INSERT INTO `wy_log` VALUES ('1442', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:52:29');
INSERT INTO `wy_log` VALUES ('1443', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:10');
INSERT INTO `wy_log` VALUES ('1444', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:22');
INSERT INTO `wy_log` VALUES ('1445', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:23');
INSERT INTO `wy_log` VALUES ('1446', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:23');
INSERT INTO `wy_log` VALUES ('1447', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:25');
INSERT INTO `wy_log` VALUES ('1448', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:26');
INSERT INTO `wy_log` VALUES ('1449', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:27');
INSERT INTO `wy_log` VALUES ('1450', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:49');
INSERT INTO `wy_log` VALUES ('1451', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:50');
INSERT INTO `wy_log` VALUES ('1452', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:52');
INSERT INTO `wy_log` VALUES ('1453', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:57');
INSERT INTO `wy_log` VALUES ('1454', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:57');
INSERT INTO `wy_log` VALUES ('1455', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:58');
INSERT INTO `wy_log` VALUES ('1456', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:54:59');
INSERT INTO `wy_log` VALUES ('1457', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:57:40');
INSERT INTO `wy_log` VALUES ('1458', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:57:41');
INSERT INTO `wy_log` VALUES ('1459', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:57:44');
INSERT INTO `wy_log` VALUES ('1460', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:57:45');
INSERT INTO `wy_log` VALUES ('1461', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:57:49');
INSERT INTO `wy_log` VALUES ('1462', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-22 17:57:52');
INSERT INTO `wy_log` VALUES ('1463', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:36:52');
INSERT INTO `wy_log` VALUES ('1464', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:36:59');
INSERT INTO `wy_log` VALUES ('1465', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:37:12');
INSERT INTO `wy_log` VALUES ('1466', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:47:52');
INSERT INTO `wy_log` VALUES ('1467', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:47:53');
INSERT INTO `wy_log` VALUES ('1468', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:47:54');
INSERT INTO `wy_log` VALUES ('1469', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:47:54');
INSERT INTO `wy_log` VALUES ('1470', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:47:55');
INSERT INTO `wy_log` VALUES ('1471', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:47:55');
INSERT INTO `wy_log` VALUES ('1472', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:48:03');
INSERT INTO `wy_log` VALUES ('1473', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:48:17');
INSERT INTO `wy_log` VALUES ('1474', '', '0', 'member', '', 'member_menu', '?m=member&c=member_menu&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 08:48:19');
INSERT INTO `wy_log` VALUES ('1475', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-23 08:57:50');
INSERT INTO `wy_log` VALUES ('1476', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-23 08:58:00');
INSERT INTO `wy_log` VALUES ('1477', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 08:59:23');
INSERT INTO `wy_log` VALUES ('1478', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 08:59:24');
INSERT INTO `wy_log` VALUES ('1479', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 08:59:26');
INSERT INTO `wy_log` VALUES ('1480', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 08:59:27');
INSERT INTO `wy_log` VALUES ('1481', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 08:59:28');
INSERT INTO `wy_log` VALUES ('1482', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 08:59:29');
INSERT INTO `wy_log` VALUES ('1483', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 08:59:30');
INSERT INTO `wy_log` VALUES ('1484', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:06:33');
INSERT INTO `wy_log` VALUES ('1485', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:06:35');
INSERT INTO `wy_log` VALUES ('1486', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:06:36');
INSERT INTO `wy_log` VALUES ('1487', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:06:45');
INSERT INTO `wy_log` VALUES ('1488', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:06:45');
INSERT INTO `wy_log` VALUES ('1489', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:07:49');
INSERT INTO `wy_log` VALUES ('1490', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:07:50');
INSERT INTO `wy_log` VALUES ('1491', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:07:53');
INSERT INTO `wy_log` VALUES ('1492', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:07:56');
INSERT INTO `wy_log` VALUES ('1493', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:09:40');
INSERT INTO `wy_log` VALUES ('1494', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:10:01');
INSERT INTO `wy_log` VALUES ('1495', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:10:03');
INSERT INTO `wy_log` VALUES ('1496', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:10:07');
INSERT INTO `wy_log` VALUES ('1497', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:10:09');
INSERT INTO `wy_log` VALUES ('1498', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:10:12');
INSERT INTO `wy_log` VALUES ('1499', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:10:51');
INSERT INTO `wy_log` VALUES ('1500', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:10:52');
INSERT INTO `wy_log` VALUES ('1501', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:10:59');
INSERT INTO `wy_log` VALUES ('1502', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:11:01');
INSERT INTO `wy_log` VALUES ('1503', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:11:02');
INSERT INTO `wy_log` VALUES ('1504', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:11:03');
INSERT INTO `wy_log` VALUES ('1505', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:11:03');
INSERT INTO `wy_log` VALUES ('1506', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:11:04');
INSERT INTO `wy_log` VALUES ('1507', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:24:02');
INSERT INTO `wy_log` VALUES ('1508', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:24:06');
INSERT INTO `wy_log` VALUES ('1509', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:24:17');
INSERT INTO `wy_log` VALUES ('1510', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:24:51');
INSERT INTO `wy_log` VALUES ('1511', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:24:56');
INSERT INTO `wy_log` VALUES ('1512', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=add_type', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:04');
INSERT INTO `wy_log` VALUES ('1513', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:22');
INSERT INTO `wy_log` VALUES ('1514', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:25');
INSERT INTO `wy_log` VALUES ('1515', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:26');
INSERT INTO `wy_log` VALUES ('1516', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:26');
INSERT INTO `wy_log` VALUES ('1517', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:26');
INSERT INTO `wy_log` VALUES ('1518', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:27');
INSERT INTO `wy_log` VALUES ('1519', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:28');
INSERT INTO `wy_log` VALUES ('1520', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:28');
INSERT INTO `wy_log` VALUES ('1521', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:25:29');
INSERT INTO `wy_log` VALUES ('1522', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:26:48');
INSERT INTO `wy_log` VALUES ('1523', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:26:51');
INSERT INTO `wy_log` VALUES ('1524', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:26:59');
INSERT INTO `wy_log` VALUES ('1525', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:01');
INSERT INTO `wy_log` VALUES ('1526', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:03');
INSERT INTO `wy_log` VALUES ('1527', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:04');
INSERT INTO `wy_log` VALUES ('1528', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:05');
INSERT INTO `wy_log` VALUES ('1529', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:06');
INSERT INTO `wy_log` VALUES ('1530', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:07');
INSERT INTO `wy_log` VALUES ('1531', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:08');
INSERT INTO `wy_log` VALUES ('1532', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:27:43');
INSERT INTO `wy_log` VALUES ('1533', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:28:19');
INSERT INTO `wy_log` VALUES ('1534', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:28:28');
INSERT INTO `wy_log` VALUES ('1535', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=setting', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:28:29');
INSERT INTO `wy_log` VALUES ('1536', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:28:39');
INSERT INTO `wy_log` VALUES ('1537', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:29:00');
INSERT INTO `wy_log` VALUES ('1538', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:29:01');
INSERT INTO `wy_log` VALUES ('1539', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:29:40');
INSERT INTO `wy_log` VALUES ('1540', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:29:42');
INSERT INTO `wy_log` VALUES ('1541', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:29:49');
INSERT INTO `wy_log` VALUES ('1542', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 09:29:49');
INSERT INTO `wy_log` VALUES ('1543', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:46:24');
INSERT INTO `wy_log` VALUES ('1544', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:12');
INSERT INTO `wy_log` VALUES ('1545', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:13');
INSERT INTO `wy_log` VALUES ('1546', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:19');
INSERT INTO `wy_log` VALUES ('1547', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:20');
INSERT INTO `wy_log` VALUES ('1548', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:22');
INSERT INTO `wy_log` VALUES ('1549', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:22');
INSERT INTO `wy_log` VALUES ('1550', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:22');
INSERT INTO `wy_log` VALUES ('1551', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:23');
INSERT INTO `wy_log` VALUES ('1552', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:24');
INSERT INTO `wy_log` VALUES ('1553', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:25');
INSERT INTO `wy_log` VALUES ('1554', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:39');
INSERT INTO `wy_log` VALUES ('1555', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:46');
INSERT INTO `wy_log` VALUES ('1556', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:49:48');
INSERT INTO `wy_log` VALUES ('1557', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:50:02');
INSERT INTO `wy_log` VALUES ('1558', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 09:50:04');
INSERT INTO `wy_log` VALUES ('1559', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:03:36');
INSERT INTO `wy_log` VALUES ('1560', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:03:38');
INSERT INTO `wy_log` VALUES ('1561', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:06:17');
INSERT INTO `wy_log` VALUES ('1562', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:06:25');
INSERT INTO `wy_log` VALUES ('1563', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:06:27');
INSERT INTO `wy_log` VALUES ('1564', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:06:36');
INSERT INTO `wy_log` VALUES ('1565', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:06:50');
INSERT INTO `wy_log` VALUES ('1566', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:06:50');
INSERT INTO `wy_log` VALUES ('1567', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:08:57');
INSERT INTO `wy_log` VALUES ('1568', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:09:45');
INSERT INTO `wy_log` VALUES ('1569', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-23 10:11:00');
INSERT INTO `wy_log` VALUES ('1570', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2017-03-23 10:11:03');
INSERT INTO `wy_log` VALUES ('1571', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2017-03-23 10:11:04');
INSERT INTO `wy_log` VALUES ('1572', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2017-03-23 10:11:04');
INSERT INTO `wy_log` VALUES ('1573', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2017-03-23 10:11:04');
INSERT INTO `wy_log` VALUES ('1574', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2017-03-23 10:11:05');
INSERT INTO `wy_log` VALUES ('1575', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2017-03-23 10:11:07');
INSERT INTO `wy_log` VALUES ('1576', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '127.0.0.1', '2017-03-23 10:11:11');
INSERT INTO `wy_log` VALUES ('1577', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:11:15');
INSERT INTO `wy_log` VALUES ('1578', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:13:12');
INSERT INTO `wy_log` VALUES ('1579', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:13:14');
INSERT INTO `wy_log` VALUES ('1580', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:13:16');
INSERT INTO `wy_log` VALUES ('1581', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:13:53');
INSERT INTO `wy_log` VALUES ('1582', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:13:58');
INSERT INTO `wy_log` VALUES ('1583', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:13:58');
INSERT INTO `wy_log` VALUES ('1584', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:14:01');
INSERT INTO `wy_log` VALUES ('1585', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:14:04');
INSERT INTO `wy_log` VALUES ('1586', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:15:10');
INSERT INTO `wy_log` VALUES ('1587', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:20:01');
INSERT INTO `wy_log` VALUES ('1588', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:21:39');
INSERT INTO `wy_log` VALUES ('1589', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:26:10');
INSERT INTO `wy_log` VALUES ('1590', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:26:15');
INSERT INTO `wy_log` VALUES ('1591', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:27:50');
INSERT INTO `wy_log` VALUES ('1592', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:29:40');
INSERT INTO `wy_log` VALUES ('1593', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:29:47');
INSERT INTO `wy_log` VALUES ('1594', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:29:48');
INSERT INTO `wy_log` VALUES ('1595', '', '0', 'collection', '', 'node', '?m=collection&c=node&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:29:59');
INSERT INTO `wy_log` VALUES ('1596', '', '0', 'ask', '', 'ask', '?m=ask&c=ask&a=question_list', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:30:55');
INSERT INTO `wy_log` VALUES ('1597', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:31:23');
INSERT INTO `wy_log` VALUES ('1598', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:31:23');
INSERT INTO `wy_log` VALUES ('1599', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:31:24');
INSERT INTO `wy_log` VALUES ('1600', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:31:25');
INSERT INTO `wy_log` VALUES ('1601', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:31:28');
INSERT INTO `wy_log` VALUES ('1602', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:32:32');
INSERT INTO `wy_log` VALUES ('1603', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:32:35');
INSERT INTO `wy_log` VALUES ('1604', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:32:39');
INSERT INTO `wy_log` VALUES ('1605', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:35:09');
INSERT INTO `wy_log` VALUES ('1606', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:35:45');
INSERT INTO `wy_log` VALUES ('1607', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:35:47');
INSERT INTO `wy_log` VALUES ('1608', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:37:33');
INSERT INTO `wy_log` VALUES ('1609', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:37:44');
INSERT INTO `wy_log` VALUES ('1610', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:38:11');
INSERT INTO `wy_log` VALUES ('1611', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_stat', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:38:11');
INSERT INTO `wy_log` VALUES ('1612', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:38:12');
INSERT INTO `wy_log` VALUES ('1613', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:38:12');
INSERT INTO `wy_log` VALUES ('1614', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:38:14');
INSERT INTO `wy_log` VALUES ('1615', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:42:42');
INSERT INTO `wy_log` VALUES ('1616', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:42:46');
INSERT INTO `wy_log` VALUES ('1617', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:42:56');
INSERT INTO `wy_log` VALUES ('1618', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:43:09');
INSERT INTO `wy_log` VALUES ('1619', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:43:12');
INSERT INTO `wy_log` VALUES ('1620', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:44:23');
INSERT INTO `wy_log` VALUES ('1621', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:44:37');
INSERT INTO `wy_log` VALUES ('1622', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:44:48');
INSERT INTO `wy_log` VALUES ('1623', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:44:58');
INSERT INTO `wy_log` VALUES ('1624', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:45:09');
INSERT INTO `wy_log` VALUES ('1625', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:45:14');
INSERT INTO `wy_log` VALUES ('1626', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:45:23');
INSERT INTO `wy_log` VALUES ('1627', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '192.168.5.55', '2017-03-23 10:45:29');
INSERT INTO `wy_log` VALUES ('1628', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '192.168.5.55', '2017-03-23 10:45:49');
INSERT INTO `wy_log` VALUES ('1629', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.55', '2017-03-23 10:45:54');
INSERT INTO `wy_log` VALUES ('1630', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:46:02');
INSERT INTO `wy_log` VALUES ('1631', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:46:15');
INSERT INTO `wy_log` VALUES ('1632', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:46:17');
INSERT INTO `wy_log` VALUES ('1633', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:47:34');
INSERT INTO `wy_log` VALUES ('1634', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:47:37');
INSERT INTO `wy_log` VALUES ('1635', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:48:23');
INSERT INTO `wy_log` VALUES ('1636', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:48:25');
INSERT INTO `wy_log` VALUES ('1637', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:49:15');
INSERT INTO `wy_log` VALUES ('1638', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 10:49:17');
INSERT INTO `wy_log` VALUES ('1639', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 10:57:51');
INSERT INTO `wy_log` VALUES ('1640', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:02:13');
INSERT INTO `wy_log` VALUES ('1641', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 11:07:31');
INSERT INTO `wy_log` VALUES ('1642', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 11:07:33');
INSERT INTO `wy_log` VALUES ('1643', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 11:07:36');
INSERT INTO `wy_log` VALUES ('1644', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:21:28');
INSERT INTO `wy_log` VALUES ('1645', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:21:33');
INSERT INTO `wy_log` VALUES ('1646', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:21:55');
INSERT INTO `wy_log` VALUES ('1647', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:08');
INSERT INTO `wy_log` VALUES ('1648', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:16');
INSERT INTO `wy_log` VALUES ('1649', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:27');
INSERT INTO `wy_log` VALUES ('1650', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:36');
INSERT INTO `wy_log` VALUES ('1651', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:36');
INSERT INTO `wy_log` VALUES ('1652', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:43');
INSERT INTO `wy_log` VALUES ('1653', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:47');
INSERT INTO `wy_log` VALUES ('1654', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:50');
INSERT INTO `wy_log` VALUES ('1655', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:22:50');
INSERT INTO `wy_log` VALUES ('1656', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:23:03');
INSERT INTO `wy_log` VALUES ('1657', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:23:07');
INSERT INTO `wy_log` VALUES ('1658', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:23:07');
INSERT INTO `wy_log` VALUES ('1659', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:29:21');
INSERT INTO `wy_log` VALUES ('1660', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:29:32');
INSERT INTO `wy_log` VALUES ('1661', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:29:46');
INSERT INTO `wy_log` VALUES ('1662', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:29:51');
INSERT INTO `wy_log` VALUES ('1663', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:30:13');
INSERT INTO `wy_log` VALUES ('1664', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:30:48');
INSERT INTO `wy_log` VALUES ('1665', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:31:03');
INSERT INTO `wy_log` VALUES ('1666', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:31:54');
INSERT INTO `wy_log` VALUES ('1667', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:31:55');
INSERT INTO `wy_log` VALUES ('1668', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:31:58');
INSERT INTO `wy_log` VALUES ('1669', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:31:59');
INSERT INTO `wy_log` VALUES ('1670', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:32:00');
INSERT INTO `wy_log` VALUES ('1671', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:32:01');
INSERT INTO `wy_log` VALUES ('1672', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:32:02');
INSERT INTO `wy_log` VALUES ('1673', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:32:10');
INSERT INTO `wy_log` VALUES ('1674', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:32:13');
INSERT INTO `wy_log` VALUES ('1675', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:34:03');
INSERT INTO `wy_log` VALUES ('1676', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:37:04');
INSERT INTO `wy_log` VALUES ('1677', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:37:10');
INSERT INTO `wy_log` VALUES ('1678', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:37:13');
INSERT INTO `wy_log` VALUES ('1679', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:37:15');
INSERT INTO `wy_log` VALUES ('1680', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:38:29');
INSERT INTO `wy_log` VALUES ('1681', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '192.168.5.59', '2017-03-23 11:39:07');
INSERT INTO `wy_log` VALUES ('1682', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:40:51');
INSERT INTO `wy_log` VALUES ('1683', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '192.168.5.59', '2017-03-23 11:42:15');
INSERT INTO `wy_log` VALUES ('1684', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '192.168.5.59', '2017-03-23 11:42:21');
INSERT INTO `wy_log` VALUES ('1685', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '192.168.5.59', '2017-03-23 11:42:22');
INSERT INTO `wy_log` VALUES ('1686', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:42:28');
INSERT INTO `wy_log` VALUES ('1687', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:42:34');
INSERT INTO `wy_log` VALUES ('1688', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:42:49');
INSERT INTO `wy_log` VALUES ('1689', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 11:44:37');
INSERT INTO `wy_log` VALUES ('1690', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.55', '2017-03-23 11:48:49');
INSERT INTO `wy_log` VALUES ('1691', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-23 13:53:40');
INSERT INTO `wy_log` VALUES ('1692', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-23 13:53:40');
INSERT INTO `wy_log` VALUES ('1693', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '192.168.5.59', '2017-03-23 13:53:52');
INSERT INTO `wy_log` VALUES ('1694', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '192.168.5.59', '2017-03-23 13:53:55');
INSERT INTO `wy_log` VALUES ('1695', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:15');
INSERT INTO `wy_log` VALUES ('1696', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:30');
INSERT INTO `wy_log` VALUES ('1697', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:32');
INSERT INTO `wy_log` VALUES ('1698', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:37');
INSERT INTO `wy_log` VALUES ('1699', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:39');
INSERT INTO `wy_log` VALUES ('1700', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:40');
INSERT INTO `wy_log` VALUES ('1701', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:42');
INSERT INTO `wy_log` VALUES ('1702', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:42');
INSERT INTO `wy_log` VALUES ('1703', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:00:42');
INSERT INTO `wy_log` VALUES ('1704', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:06:26');
INSERT INTO `wy_log` VALUES ('1705', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:06:58');
INSERT INTO `wy_log` VALUES ('1706', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:07:04');
INSERT INTO `wy_log` VALUES ('1707', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:07:08');
INSERT INTO `wy_log` VALUES ('1708', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:07:37');
INSERT INTO `wy_log` VALUES ('1709', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:09:02');
INSERT INTO `wy_log` VALUES ('1710', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:10:07');
INSERT INTO `wy_log` VALUES ('1711', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:10:19');
INSERT INTO `wy_log` VALUES ('1712', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:10:27');
INSERT INTO `wy_log` VALUES ('1713', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:10:31');
INSERT INTO `wy_log` VALUES ('1714', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:11:08');
INSERT INTO `wy_log` VALUES ('1715', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:11:12');
INSERT INTO `wy_log` VALUES ('1716', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:11:15');
INSERT INTO `wy_log` VALUES ('1717', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:15:16');
INSERT INTO `wy_log` VALUES ('1718', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:19:51');
INSERT INTO `wy_log` VALUES ('1719', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:19:54');
INSERT INTO `wy_log` VALUES ('1720', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=listorder', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:20:46');
INSERT INTO `wy_log` VALUES ('1721', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:24:41');
INSERT INTO `wy_log` VALUES ('1722', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:24:43');
INSERT INTO `wy_log` VALUES ('1723', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:24:53');
INSERT INTO `wy_log` VALUES ('1724', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:24:55');
INSERT INTO `wy_log` VALUES ('1725', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:24:58');
INSERT INTO `wy_log` VALUES ('1726', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:25:03');
INSERT INTO `wy_log` VALUES ('1727', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:25:11');
INSERT INTO `wy_log` VALUES ('1728', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:25:14');
INSERT INTO `wy_log` VALUES ('1729', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:25:21');
INSERT INTO `wy_log` VALUES ('1730', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 14:25:22');
INSERT INTO `wy_log` VALUES ('1731', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:25:46');
INSERT INTO `wy_log` VALUES ('1732', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:25:48');
INSERT INTO `wy_log` VALUES ('1733', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:26:30');
INSERT INTO `wy_log` VALUES ('1734', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:26:31');
INSERT INTO `wy_log` VALUES ('1735', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:26:31');
INSERT INTO `wy_log` VALUES ('1736', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:26:45');
INSERT INTO `wy_log` VALUES ('1737', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:27:02');
INSERT INTO `wy_log` VALUES ('1738', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:27:03');
INSERT INTO `wy_log` VALUES ('1739', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:27:08');
INSERT INTO `wy_log` VALUES ('1740', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:27:08');
INSERT INTO `wy_log` VALUES ('1741', '', '0', 'member', '', 'member', '?m=member&c=member&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:27:20');
INSERT INTO `wy_log` VALUES ('1742', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:28:37');
INSERT INTO `wy_log` VALUES ('1743', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=add', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:28:45');
INSERT INTO `wy_log` VALUES ('1744', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:29:02');
INSERT INTO `wy_log` VALUES ('1745', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:29:14');
INSERT INTO `wy_log` VALUES ('1746', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:14');
INSERT INTO `wy_log` VALUES ('1747', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:18');
INSERT INTO `wy_log` VALUES ('1748', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:18');
INSERT INTO `wy_log` VALUES ('1749', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:19');
INSERT INTO `wy_log` VALUES ('1750', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:22');
INSERT INTO `wy_log` VALUES ('1751', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:23');
INSERT INTO `wy_log` VALUES ('1752', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:24');
INSERT INTO `wy_log` VALUES ('1753', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:26');
INSERT INTO `wy_log` VALUES ('1754', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 14:43:26');
INSERT INTO `wy_log` VALUES ('1755', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 15:16:26');
INSERT INTO `wy_log` VALUES ('1756', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 15:16:34');
INSERT INTO `wy_log` VALUES ('1757', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 15:16:37');
INSERT INTO `wy_log` VALUES ('1758', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 15:16:37');
INSERT INTO `wy_log` VALUES ('1759', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 15:17:45');
INSERT INTO `wy_log` VALUES ('1760', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 15:19:23');
INSERT INTO `wy_log` VALUES ('1761', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '192.168.5.59', '2017-03-23 15:19:48');
INSERT INTO `wy_log` VALUES ('1762', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 15:25:45');
INSERT INTO `wy_log` VALUES ('1763', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:05:55');
INSERT INTO `wy_log` VALUES ('1764', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:05:55');
INSERT INTO `wy_log` VALUES ('1765', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:05:59');
INSERT INTO `wy_log` VALUES ('1766', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:02');
INSERT INTO `wy_log` VALUES ('1767', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:02');
INSERT INTO `wy_log` VALUES ('1768', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:04');
INSERT INTO `wy_log` VALUES ('1769', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:10');
INSERT INTO `wy_log` VALUES ('1770', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:11');
INSERT INTO `wy_log` VALUES ('1771', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:12');
INSERT INTO `wy_log` VALUES ('1772', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:13');
INSERT INTO `wy_log` VALUES ('1773', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:15');
INSERT INTO `wy_log` VALUES ('1774', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:15');
INSERT INTO `wy_log` VALUES ('1775', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:17');
INSERT INTO `wy_log` VALUES ('1776', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:20');
INSERT INTO `wy_log` VALUES ('1777', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:20');
INSERT INTO `wy_log` VALUES ('1778', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-23 16:06:21');
INSERT INTO `wy_log` VALUES ('1779', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:22:21');
INSERT INTO `wy_log` VALUES ('1780', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:26:01');
INSERT INTO `wy_log` VALUES ('1781', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:26:05');
INSERT INTO `wy_log` VALUES ('1782', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:26:08');
INSERT INTO `wy_log` VALUES ('1783', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:28:13');
INSERT INTO `wy_log` VALUES ('1784', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:28:15');
INSERT INTO `wy_log` VALUES ('1785', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:06');
INSERT INTO `wy_log` VALUES ('1786', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:08');
INSERT INTO `wy_log` VALUES ('1787', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:15');
INSERT INTO `wy_log` VALUES ('1788', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:21');
INSERT INTO `wy_log` VALUES ('1789', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:33');
INSERT INTO `wy_log` VALUES ('1790', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:33');
INSERT INTO `wy_log` VALUES ('1791', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:46');
INSERT INTO `wy_log` VALUES ('1792', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:52');
INSERT INTO `wy_log` VALUES ('1793', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:57');
INSERT INTO `wy_log` VALUES ('1794', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:29:57');
INSERT INTO `wy_log` VALUES ('1795', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:56:20');
INSERT INTO `wy_log` VALUES ('1796', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:56:22');
INSERT INTO `wy_log` VALUES ('1797', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:56:25');
INSERT INTO `wy_log` VALUES ('1798', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 16:57:31');
INSERT INTO `wy_log` VALUES ('1799', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:00:27');
INSERT INTO `wy_log` VALUES ('1800', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:00:30');
INSERT INTO `wy_log` VALUES ('1801', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:00:32');
INSERT INTO `wy_log` VALUES ('1802', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:01:43');
INSERT INTO `wy_log` VALUES ('1803', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:01:47');
INSERT INTO `wy_log` VALUES ('1804', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:01:51');
INSERT INTO `wy_log` VALUES ('1805', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:02:37');
INSERT INTO `wy_log` VALUES ('1806', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:02:37');
INSERT INTO `wy_log` VALUES ('1807', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:10:08');
INSERT INTO `wy_log` VALUES ('1808', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:10:10');
INSERT INTO `wy_log` VALUES ('1809', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:12:01');
INSERT INTO `wy_log` VALUES ('1810', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:12:03');
INSERT INTO `wy_log` VALUES ('1811', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:13:12');
INSERT INTO `wy_log` VALUES ('1812', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:13:32');
INSERT INTO `wy_log` VALUES ('1813', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:13:35');
INSERT INTO `wy_log` VALUES ('1814', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:18:39');
INSERT INTO `wy_log` VALUES ('1815', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:18:52');
INSERT INTO `wy_log` VALUES ('1816', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:18:56');
INSERT INTO `wy_log` VALUES ('1817', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:25:13');
INSERT INTO `wy_log` VALUES ('1818', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:25:14');
INSERT INTO `wy_log` VALUES ('1819', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:25:32');
INSERT INTO `wy_log` VALUES ('1820', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:25:33');
INSERT INTO `wy_log` VALUES ('1821', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:25:34');
INSERT INTO `wy_log` VALUES ('1822', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:27:50');
INSERT INTO `wy_log` VALUES ('1823', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:27:51');
INSERT INTO `wy_log` VALUES ('1824', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:27:52');
INSERT INTO `wy_log` VALUES ('1825', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:27:53');
INSERT INTO `wy_log` VALUES ('1826', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:27:57');
INSERT INTO `wy_log` VALUES ('1827', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:28:00');
INSERT INTO `wy_log` VALUES ('1828', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:28:54');
INSERT INTO `wy_log` VALUES ('1829', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:36:14');
INSERT INTO `wy_log` VALUES ('1830', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:36:20');
INSERT INTO `wy_log` VALUES ('1831', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:36:45');
INSERT INTO `wy_log` VALUES ('1832', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:36:45');
INSERT INTO `wy_log` VALUES ('1833', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:36:49');
INSERT INTO `wy_log` VALUES ('1834', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:37:02');
INSERT INTO `wy_log` VALUES ('1835', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:37:03');
INSERT INTO `wy_log` VALUES ('1836', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:37:03');
INSERT INTO `wy_log` VALUES ('1837', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:37:41');
INSERT INTO `wy_log` VALUES ('1838', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:37:47');
INSERT INTO `wy_log` VALUES ('1839', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:37:48');
INSERT INTO `wy_log` VALUES ('1840', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:37:50');
INSERT INTO `wy_log` VALUES ('1841', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=modelinfo', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:38:04');
INSERT INTO `wy_log` VALUES ('1842', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=reject', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:38:17');
INSERT INTO `wy_log` VALUES ('1843', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '192.168.5.59', '2017-03-23 17:38:20');
INSERT INTO `wy_log` VALUES ('1844', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:38:34');
INSERT INTO `wy_log` VALUES ('1845', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:38:35');
INSERT INTO `wy_log` VALUES ('1846', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:39:06');
INSERT INTO `wy_log` VALUES ('1847', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:39:07');
INSERT INTO `wy_log` VALUES ('1848', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:40:46');
INSERT INTO `wy_log` VALUES ('1849', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:40:52');
INSERT INTO `wy_log` VALUES ('1850', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:40:54');
INSERT INTO `wy_log` VALUES ('1851', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:41:17');
INSERT INTO `wy_log` VALUES ('1852', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:41:18');
INSERT INTO `wy_log` VALUES ('1853', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:42:15');
INSERT INTO `wy_log` VALUES ('1854', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:43:24');
INSERT INTO `wy_log` VALUES ('1855', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=ignore', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:45:21');
INSERT INTO `wy_log` VALUES ('1856', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:45:23');
INSERT INTO `wy_log` VALUES ('1857', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:45:38');
INSERT INTO `wy_log` VALUES ('1858', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:45:39');
INSERT INTO `wy_log` VALUES ('1859', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=reject', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:45:41');
INSERT INTO `wy_log` VALUES ('1860', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:45:43');
INSERT INTO `wy_log` VALUES ('1861', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:45:59');
INSERT INTO `wy_log` VALUES ('1862', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=reject', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:46:08');
INSERT INTO `wy_log` VALUES ('1863', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:46:10');
INSERT INTO `wy_log` VALUES ('1864', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:48:24');
INSERT INTO `wy_log` VALUES ('1865', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:49:13');
INSERT INTO `wy_log` VALUES ('1866', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:49:18');
INSERT INTO `wy_log` VALUES ('1867', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2017-03-23 17:50:49');
INSERT INTO `wy_log` VALUES ('1868', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '113.108.131.163', '2017-03-23 18:24:16');
INSERT INTO `wy_log` VALUES ('1869', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '113.108.131.163', '2017-03-23 18:24:29');
INSERT INTO `wy_log` VALUES ('1870', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:26:25');
INSERT INTO `wy_log` VALUES ('1871', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:26:27');
INSERT INTO `wy_log` VALUES ('1872', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=reject', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:26:34');
INSERT INTO `wy_log` VALUES ('1873', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:26:36');
INSERT INTO `wy_log` VALUES ('1874', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:26:47');
INSERT INTO `wy_log` VALUES ('1875', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:27:01');
INSERT INTO `wy_log` VALUES ('1876', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:27:05');
INSERT INTO `wy_log` VALUES ('1877', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:27:06');
INSERT INTO `wy_log` VALUES ('1878', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:21');
INSERT INTO `wy_log` VALUES ('1879', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:21');
INSERT INTO `wy_log` VALUES ('1880', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:25');
INSERT INTO `wy_log` VALUES ('1881', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:26');
INSERT INTO `wy_log` VALUES ('1882', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:27');
INSERT INTO `wy_log` VALUES ('1883', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:33');
INSERT INTO `wy_log` VALUES ('1884', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:36');
INSERT INTO `wy_log` VALUES ('1885', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-23 18:30:38');
INSERT INTO `wy_log` VALUES ('1886', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 08:54:34');
INSERT INTO `wy_log` VALUES ('1887', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 08:54:43');
INSERT INTO `wy_log` VALUES ('1888', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 08:54:47');
INSERT INTO `wy_log` VALUES ('1889', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 08:54:49');
INSERT INTO `wy_log` VALUES ('1890', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 08:55:40');
INSERT INTO `wy_log` VALUES ('1891', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-24 08:57:53');
INSERT INTO `wy_log` VALUES ('1892', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-24 08:58:04');
INSERT INTO `wy_log` VALUES ('1893', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 08:58:09');
INSERT INTO `wy_log` VALUES ('1894', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 08:58:12');
INSERT INTO `wy_log` VALUES ('1895', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 08:58:19');
INSERT INTO `wy_log` VALUES ('1896', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 08:58:20');
INSERT INTO `wy_log` VALUES ('1897', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 08:58:40');
INSERT INTO `wy_log` VALUES ('1898', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 08:58:42');
INSERT INTO `wy_log` VALUES ('1899', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:00:50');
INSERT INTO `wy_log` VALUES ('1900', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:00:55');
INSERT INTO `wy_log` VALUES ('1901', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:08');
INSERT INTO `wy_log` VALUES ('1902', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:16');
INSERT INTO `wy_log` VALUES ('1903', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:22');
INSERT INTO `wy_log` VALUES ('1904', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:23');
INSERT INTO `wy_log` VALUES ('1905', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:25');
INSERT INTO `wy_log` VALUES ('1906', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:34');
INSERT INTO `wy_log` VALUES ('1907', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:35');
INSERT INTO `wy_log` VALUES ('1908', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:36');
INSERT INTO `wy_log` VALUES ('1909', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:37');
INSERT INTO `wy_log` VALUES ('1910', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:39');
INSERT INTO `wy_log` VALUES ('1911', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:40');
INSERT INTO `wy_log` VALUES ('1912', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:49');
INSERT INTO `wy_log` VALUES ('1913', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:50');
INSERT INTO `wy_log` VALUES ('1914', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:52');
INSERT INTO `wy_log` VALUES ('1915', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:52');
INSERT INTO `wy_log` VALUES ('1916', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:53');
INSERT INTO `wy_log` VALUES ('1917', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:54');
INSERT INTO `wy_log` VALUES ('1918', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:54');
INSERT INTO `wy_log` VALUES ('1919', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:01:54');
INSERT INTO `wy_log` VALUES ('1920', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:02:46');
INSERT INTO `wy_log` VALUES ('1921', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:03:05');
INSERT INTO `wy_log` VALUES ('1922', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:03:10');
INSERT INTO `wy_log` VALUES ('1923', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:03:11');
INSERT INTO `wy_log` VALUES ('1924', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:03:27');
INSERT INTO `wy_log` VALUES ('1925', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:07:44');
INSERT INTO `wy_log` VALUES ('1926', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:07:45');
INSERT INTO `wy_log` VALUES ('1927', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:10:51');
INSERT INTO `wy_log` VALUES ('1928', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:10:52');
INSERT INTO `wy_log` VALUES ('1929', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:10:53');
INSERT INTO `wy_log` VALUES ('1930', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:11:04');
INSERT INTO `wy_log` VALUES ('1931', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:11:05');
INSERT INTO `wy_log` VALUES ('1932', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:11:13');
INSERT INTO `wy_log` VALUES ('1933', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:12:08');
INSERT INTO `wy_log` VALUES ('1934', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:12:10');
INSERT INTO `wy_log` VALUES ('1935', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:15:34');
INSERT INTO `wy_log` VALUES ('1936', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:15:36');
INSERT INTO `wy_log` VALUES ('1937', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:15:59');
INSERT INTO `wy_log` VALUES ('1938', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:08');
INSERT INTO `wy_log` VALUES ('1939', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:09');
INSERT INTO `wy_log` VALUES ('1940', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:12');
INSERT INTO `wy_log` VALUES ('1941', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:13');
INSERT INTO `wy_log` VALUES ('1942', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:15');
INSERT INTO `wy_log` VALUES ('1943', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:15');
INSERT INTO `wy_log` VALUES ('1944', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:16');
INSERT INTO `wy_log` VALUES ('1945', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:19');
INSERT INTO `wy_log` VALUES ('1946', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:19');
INSERT INTO `wy_log` VALUES ('1947', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:16:20');
INSERT INTO `wy_log` VALUES ('1948', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:17:16');
INSERT INTO `wy_log` VALUES ('1949', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:18:19');
INSERT INTO `wy_log` VALUES ('1950', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:18:25');
INSERT INTO `wy_log` VALUES ('1951', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:18:26');
INSERT INTO `wy_log` VALUES ('1952', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:19:25');
INSERT INTO `wy_log` VALUES ('1953', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:19:38');
INSERT INTO `wy_log` VALUES ('1954', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:19:44');
INSERT INTO `wy_log` VALUES ('1955', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:21:01');
INSERT INTO `wy_log` VALUES ('1956', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:23:27');
INSERT INTO `wy_log` VALUES ('1957', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:23:28');
INSERT INTO `wy_log` VALUES ('1958', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:23:30');
INSERT INTO `wy_log` VALUES ('1959', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:23:31');
INSERT INTO `wy_log` VALUES ('1960', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:23:31');
INSERT INTO `wy_log` VALUES ('1961', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:23:31');
INSERT INTO `wy_log` VALUES ('1962', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:17');
INSERT INTO `wy_log` VALUES ('1963', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:25');
INSERT INTO `wy_log` VALUES ('1964', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:26');
INSERT INTO `wy_log` VALUES ('1965', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:34');
INSERT INTO `wy_log` VALUES ('1966', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:35');
INSERT INTO `wy_log` VALUES ('1967', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:37');
INSERT INTO `wy_log` VALUES ('1968', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:37');
INSERT INTO `wy_log` VALUES ('1969', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:38');
INSERT INTO `wy_log` VALUES ('1970', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:40');
INSERT INTO `wy_log` VALUES ('1971', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:40');
INSERT INTO `wy_log` VALUES ('1972', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:28:41');
INSERT INTO `wy_log` VALUES ('1973', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:29:10');
INSERT INTO `wy_log` VALUES ('1974', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_file', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:30:51');
INSERT INTO `wy_log` VALUES ('1975', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:52:10');
INSERT INTO `wy_log` VALUES ('1976', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:52:32');
INSERT INTO `wy_log` VALUES ('1977', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:53:34');
INSERT INTO `wy_log` VALUES ('1978', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:53:54');
INSERT INTO `wy_log` VALUES ('1979', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:54:30');
INSERT INTO `wy_log` VALUES ('1980', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:54:48');
INSERT INTO `wy_log` VALUES ('1981', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:55:42');
INSERT INTO `wy_log` VALUES ('1982', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:55:57');
INSERT INTO `wy_log` VALUES ('1983', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:56:04');
INSERT INTO `wy_log` VALUES ('1984', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:56:48');
INSERT INTO `wy_log` VALUES ('1985', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:57:08');
INSERT INTO `wy_log` VALUES ('1986', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:57:09');
INSERT INTO `wy_log` VALUES ('1987', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:57:53');
INSERT INTO `wy_log` VALUES ('1988', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:58:45');
INSERT INTO `wy_log` VALUES ('1989', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:58:58');
INSERT INTO `wy_log` VALUES ('1990', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:58:59');
INSERT INTO `wy_log` VALUES ('1991', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:59:32');
INSERT INTO `wy_log` VALUES ('1992', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:59:34');
INSERT INTO `wy_log` VALUES ('1993', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 09:59:48');
INSERT INTO `wy_log` VALUES ('1994', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:00:06');
INSERT INTO `wy_log` VALUES ('1995', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:00:07');
INSERT INTO `wy_log` VALUES ('1996', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 10:18:44');
INSERT INTO `wy_log` VALUES ('1997', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 10:18:47');
INSERT INTO `wy_log` VALUES ('1998', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:20:28');
INSERT INTO `wy_log` VALUES ('1999', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:20:36');
INSERT INTO `wy_log` VALUES ('2000', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:20:39');
INSERT INTO `wy_log` VALUES ('2001', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:21:01');
INSERT INTO `wy_log` VALUES ('2002', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:21:04');
INSERT INTO `wy_log` VALUES ('2003', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:22:28');
INSERT INTO `wy_log` VALUES ('2004', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:23:04');
INSERT INTO `wy_log` VALUES ('2005', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:23:29');
INSERT INTO `wy_log` VALUES ('2006', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:23:35');
INSERT INTO `wy_log` VALUES ('2007', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:24:11');
INSERT INTO `wy_log` VALUES ('2008', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:24:18');
INSERT INTO `wy_log` VALUES ('2009', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:24:43');
INSERT INTO `wy_log` VALUES ('2010', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:25:13');
INSERT INTO `wy_log` VALUES ('2011', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:25:16');
INSERT INTO `wy_log` VALUES ('2012', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:25:21');
INSERT INTO `wy_log` VALUES ('2013', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:25:24');
INSERT INTO `wy_log` VALUES ('2014', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:29:42');
INSERT INTO `wy_log` VALUES ('2015', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:33:40');
INSERT INTO `wy_log` VALUES ('2016', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:33:59');
INSERT INTO `wy_log` VALUES ('2017', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:34:52');
INSERT INTO `wy_log` VALUES ('2018', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:39:53');
INSERT INTO `wy_log` VALUES ('2019', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:39:54');
INSERT INTO `wy_log` VALUES ('2020', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 10:39:55');
INSERT INTO `wy_log` VALUES ('2021', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:50:46');
INSERT INTO `wy_log` VALUES ('2022', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:50:50');
INSERT INTO `wy_log` VALUES ('2023', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:52:28');
INSERT INTO `wy_log` VALUES ('2024', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:52:52');
INSERT INTO `wy_log` VALUES ('2025', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:56:45');
INSERT INTO `wy_log` VALUES ('2026', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:57:09');
INSERT INTO `wy_log` VALUES ('2027', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:57:11');
INSERT INTO `wy_log` VALUES ('2028', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:59:24');
INSERT INTO `wy_log` VALUES ('2029', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 10:59:25');
INSERT INTO `wy_log` VALUES ('2030', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:03:30');
INSERT INTO `wy_log` VALUES ('2031', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:03:32');
INSERT INTO `wy_log` VALUES ('2032', '', '0', 'admin', '', 'setting', '?m=admin&c=setting&a=save', '', '1', 'admin', '113.108.131.163', '2017-03-24 11:04:33');
INSERT INTO `wy_log` VALUES ('2033', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:12:28');
INSERT INTO `wy_log` VALUES ('2034', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:25:37');
INSERT INTO `wy_log` VALUES ('2035', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:25:53');
INSERT INTO `wy_log` VALUES ('2036', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:26:15');
INSERT INTO `wy_log` VALUES ('2037', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:26:48');
INSERT INTO `wy_log` VALUES ('2038', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:27:03');
INSERT INTO `wy_log` VALUES ('2039', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:27:05');
INSERT INTO `wy_log` VALUES ('2040', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 11:33:55');
INSERT INTO `wy_log` VALUES ('2041', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 11:33:56');
INSERT INTO `wy_log` VALUES ('2042', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 11:33:57');
INSERT INTO `wy_log` VALUES ('2043', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 11:33:57');
INSERT INTO `wy_log` VALUES ('2044', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 11:33:57');
INSERT INTO `wy_log` VALUES ('2045', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 11:33:58');
INSERT INTO `wy_log` VALUES ('2046', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:34:15');
INSERT INTO `wy_log` VALUES ('2047', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:34:27');
INSERT INTO `wy_log` VALUES ('2048', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:34:30');
INSERT INTO `wy_log` VALUES ('2049', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:34:43');
INSERT INTO `wy_log` VALUES ('2050', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:36:36');
INSERT INTO `wy_log` VALUES ('2051', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:37:07');
INSERT INTO `wy_log` VALUES ('2052', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:37:57');
INSERT INTO `wy_log` VALUES ('2053', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:38:18');
INSERT INTO `wy_log` VALUES ('2054', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:46:31');
INSERT INTO `wy_log` VALUES ('2055', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:46:49');
INSERT INTO `wy_log` VALUES ('2056', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:47:16');
INSERT INTO `wy_log` VALUES ('2057', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '120.197.17.140', '2017-03-24 11:47:31');
INSERT INTO `wy_log` VALUES ('2058', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 13:41:33');
INSERT INTO `wy_log` VALUES ('2059', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 13:42:00');
INSERT INTO `wy_log` VALUES ('2060', '', '0', 'admin', '', 'urlrule', '?m=admin&c=urlrule&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:42:55');
INSERT INTO `wy_log` VALUES ('2061', '', '0', 'admin', '', 'urlrule', '?m=admin&c=urlrule&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:43:47');
INSERT INTO `wy_log` VALUES ('2062', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:44:14');
INSERT INTO `wy_log` VALUES ('2063', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:44:40');
INSERT INTO `wy_log` VALUES ('2064', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:44:53');
INSERT INTO `wy_log` VALUES ('2065', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:44:56');
INSERT INTO `wy_log` VALUES ('2066', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:44:56');
INSERT INTO `wy_log` VALUES ('2067', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:44:56');
INSERT INTO `wy_log` VALUES ('2068', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:44:57');
INSERT INTO `wy_log` VALUES ('2069', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:01');
INSERT INTO `wy_log` VALUES ('2070', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:04');
INSERT INTO `wy_log` VALUES ('2071', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:06');
INSERT INTO `wy_log` VALUES ('2072', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:06');
INSERT INTO `wy_log` VALUES ('2073', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:07');
INSERT INTO `wy_log` VALUES ('2074', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:10');
INSERT INTO `wy_log` VALUES ('2075', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:12');
INSERT INTO `wy_log` VALUES ('2076', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:12');
INSERT INTO `wy_log` VALUES ('2077', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:13');
INSERT INTO `wy_log` VALUES ('2078', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:45:13');
INSERT INTO `wy_log` VALUES ('2079', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:46:46');
INSERT INTO `wy_log` VALUES ('2080', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:46:54');
INSERT INTO `wy_log` VALUES ('2081', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:08');
INSERT INTO `wy_log` VALUES ('2082', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:14');
INSERT INTO `wy_log` VALUES ('2083', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:15');
INSERT INTO `wy_log` VALUES ('2084', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:15');
INSERT INTO `wy_log` VALUES ('2085', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:16');
INSERT INTO `wy_log` VALUES ('2086', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:20');
INSERT INTO `wy_log` VALUES ('2087', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:22');
INSERT INTO `wy_log` VALUES ('2088', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:23');
INSERT INTO `wy_log` VALUES ('2089', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:24');
INSERT INTO `wy_log` VALUES ('2090', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:24');
INSERT INTO `wy_log` VALUES ('2091', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:26');
INSERT INTO `wy_log` VALUES ('2092', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:28');
INSERT INTO `wy_log` VALUES ('2093', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:29');
INSERT INTO `wy_log` VALUES ('2094', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:32');
INSERT INTO `wy_log` VALUES ('2095', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:32');
INSERT INTO `wy_log` VALUES ('2096', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:33');
INSERT INTO `wy_log` VALUES ('2097', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:33');
INSERT INTO `wy_log` VALUES ('2098', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:46');
INSERT INTO `wy_log` VALUES ('2099', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:47:54');
INSERT INTO `wy_log` VALUES ('2100', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:01');
INSERT INTO `wy_log` VALUES ('2101', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:04');
INSERT INTO `wy_log` VALUES ('2102', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:06');
INSERT INTO `wy_log` VALUES ('2103', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:06');
INSERT INTO `wy_log` VALUES ('2104', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:06');
INSERT INTO `wy_log` VALUES ('2105', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:21');
INSERT INTO `wy_log` VALUES ('2106', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:25');
INSERT INTO `wy_log` VALUES ('2107', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:48');
INSERT INTO `wy_log` VALUES ('2108', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:48:57');
INSERT INTO `wy_log` VALUES ('2109', '', '0', 'admin', '', 'urlrule', '?m=admin&c=urlrule&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:50:30');
INSERT INTO `wy_log` VALUES ('2110', '', '0', 'admin', '', 'urlrule', '?m=admin&c=urlrule&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:50:50');
INSERT INTO `wy_log` VALUES ('2111', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:00');
INSERT INTO `wy_log` VALUES ('2112', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:04');
INSERT INTO `wy_log` VALUES ('2113', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:09');
INSERT INTO `wy_log` VALUES ('2114', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:12');
INSERT INTO `wy_log` VALUES ('2115', '', '0', 'admin', '', 'urlrule', '?m=admin&c=urlrule&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:26');
INSERT INTO `wy_log` VALUES ('2116', '', '0', 'admin', '', 'urlrule', '?m=admin&c=urlrule&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:35');
INSERT INTO `wy_log` VALUES ('2117', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:46');
INSERT INTO `wy_log` VALUES ('2118', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:53');
INSERT INTO `wy_log` VALUES ('2119', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:51:59');
INSERT INTO `wy_log` VALUES ('2120', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:52:07');
INSERT INTO `wy_log` VALUES ('2121', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:52:20');
INSERT INTO `wy_log` VALUES ('2122', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:53:44');
INSERT INTO `wy_log` VALUES ('2123', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:15');
INSERT INTO `wy_log` VALUES ('2124', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:26');
INSERT INTO `wy_log` VALUES ('2125', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:28');
INSERT INTO `wy_log` VALUES ('2126', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:30');
INSERT INTO `wy_log` VALUES ('2127', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:30');
INSERT INTO `wy_log` VALUES ('2128', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:30');
INSERT INTO `wy_log` VALUES ('2129', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:31');
INSERT INTO `wy_log` VALUES ('2130', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:32');
INSERT INTO `wy_log` VALUES ('2131', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:37');
INSERT INTO `wy_log` VALUES ('2132', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:38');
INSERT INTO `wy_log` VALUES ('2133', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:38');
INSERT INTO `wy_log` VALUES ('2134', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:39');
INSERT INTO `wy_log` VALUES ('2135', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:39');
INSERT INTO `wy_log` VALUES ('2136', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:41');
INSERT INTO `wy_log` VALUES ('2137', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:41');
INSERT INTO `wy_log` VALUES ('2138', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:42');
INSERT INTO `wy_log` VALUES ('2139', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:54:42');
INSERT INTO `wy_log` VALUES ('2140', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:55:37');
INSERT INTO `wy_log` VALUES ('2141', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:55:41');
INSERT INTO `wy_log` VALUES ('2142', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:55:48');
INSERT INTO `wy_log` VALUES ('2143', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:55:53');
INSERT INTO `wy_log` VALUES ('2144', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:01');
INSERT INTO `wy_log` VALUES ('2145', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:09');
INSERT INTO `wy_log` VALUES ('2146', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:14');
INSERT INTO `wy_log` VALUES ('2147', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:20');
INSERT INTO `wy_log` VALUES ('2148', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:30');
INSERT INTO `wy_log` VALUES ('2149', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:37');
INSERT INTO `wy_log` VALUES ('2150', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:46');
INSERT INTO `wy_log` VALUES ('2151', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:50');
INSERT INTO `wy_log` VALUES ('2152', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:56:55');
INSERT INTO `wy_log` VALUES ('2153', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:00');
INSERT INTO `wy_log` VALUES ('2154', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:05');
INSERT INTO `wy_log` VALUES ('2155', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:11');
INSERT INTO `wy_log` VALUES ('2156', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:16');
INSERT INTO `wy_log` VALUES ('2157', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:22');
INSERT INTO `wy_log` VALUES ('2158', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:26');
INSERT INTO `wy_log` VALUES ('2159', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:33');
INSERT INTO `wy_log` VALUES ('2160', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:37');
INSERT INTO `wy_log` VALUES ('2161', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:43');
INSERT INTO `wy_log` VALUES ('2162', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:50');
INSERT INTO `wy_log` VALUES ('2163', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:57:56');
INSERT INTO `wy_log` VALUES ('2164', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:00');
INSERT INTO `wy_log` VALUES ('2165', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:04');
INSERT INTO `wy_log` VALUES ('2166', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:06');
INSERT INTO `wy_log` VALUES ('2167', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:07');
INSERT INTO `wy_log` VALUES ('2168', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:07');
INSERT INTO `wy_log` VALUES ('2169', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:07');
INSERT INTO `wy_log` VALUES ('2170', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:08');
INSERT INTO `wy_log` VALUES ('2171', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:08');
INSERT INTO `wy_log` VALUES ('2172', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:09');
INSERT INTO `wy_log` VALUES ('2173', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:09');
INSERT INTO `wy_log` VALUES ('2174', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:09');
INSERT INTO `wy_log` VALUES ('2175', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:10');
INSERT INTO `wy_log` VALUES ('2176', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:10');
INSERT INTO `wy_log` VALUES ('2177', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:11');
INSERT INTO `wy_log` VALUES ('2178', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:11');
INSERT INTO `wy_log` VALUES ('2179', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:13');
INSERT INTO `wy_log` VALUES ('2180', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:14');
INSERT INTO `wy_log` VALUES ('2181', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:15');
INSERT INTO `wy_log` VALUES ('2182', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:15');
INSERT INTO `wy_log` VALUES ('2183', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:16');
INSERT INTO `wy_log` VALUES ('2184', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:16');
INSERT INTO `wy_log` VALUES ('2185', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:16');
INSERT INTO `wy_log` VALUES ('2186', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:17');
INSERT INTO `wy_log` VALUES ('2187', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:17');
INSERT INTO `wy_log` VALUES ('2188', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:18');
INSERT INTO `wy_log` VALUES ('2189', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:18');
INSERT INTO `wy_log` VALUES ('2190', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:18');
INSERT INTO `wy_log` VALUES ('2191', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:19');
INSERT INTO `wy_log` VALUES ('2192', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:19');
INSERT INTO `wy_log` VALUES ('2193', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:19');
INSERT INTO `wy_log` VALUES ('2194', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:20');
INSERT INTO `wy_log` VALUES ('2195', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:22');
INSERT INTO `wy_log` VALUES ('2196', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:24');
INSERT INTO `wy_log` VALUES ('2197', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:24');
INSERT INTO `wy_log` VALUES ('2198', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:24');
INSERT INTO `wy_log` VALUES ('2199', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:25');
INSERT INTO `wy_log` VALUES ('2200', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:25');
INSERT INTO `wy_log` VALUES ('2201', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:26');
INSERT INTO `wy_log` VALUES ('2202', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:26');
INSERT INTO `wy_log` VALUES ('2203', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:26');
INSERT INTO `wy_log` VALUES ('2204', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:27');
INSERT INTO `wy_log` VALUES ('2205', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:27');
INSERT INTO `wy_log` VALUES ('2206', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:28');
INSERT INTO `wy_log` VALUES ('2207', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 13:58:28');
INSERT INTO `wy_log` VALUES ('2208', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:00:00');
INSERT INTO `wy_log` VALUES ('2209', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:00:18');
INSERT INTO `wy_log` VALUES ('2210', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:01');
INSERT INTO `wy_log` VALUES ('2211', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:05');
INSERT INTO `wy_log` VALUES ('2212', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:09');
INSERT INTO `wy_log` VALUES ('2213', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:12');
INSERT INTO `wy_log` VALUES ('2214', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:14');
INSERT INTO `wy_log` VALUES ('2215', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:14');
INSERT INTO `wy_log` VALUES ('2216', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:15');
INSERT INTO `wy_log` VALUES ('2217', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:17');
INSERT INTO `wy_log` VALUES ('2218', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:20');
INSERT INTO `wy_log` VALUES ('2219', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:21');
INSERT INTO `wy_log` VALUES ('2220', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:21');
INSERT INTO `wy_log` VALUES ('2221', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:22');
INSERT INTO `wy_log` VALUES ('2222', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:23');
INSERT INTO `wy_log` VALUES ('2223', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:29');
INSERT INTO `wy_log` VALUES ('2224', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:30');
INSERT INTO `wy_log` VALUES ('2225', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:30');
INSERT INTO `wy_log` VALUES ('2226', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:31');
INSERT INTO `wy_log` VALUES ('2227', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:31');
INSERT INTO `wy_log` VALUES ('2228', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:33');
INSERT INTO `wy_log` VALUES ('2229', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:36');
INSERT INTO `wy_log` VALUES ('2230', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:37');
INSERT INTO `wy_log` VALUES ('2231', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:39');
INSERT INTO `wy_log` VALUES ('2232', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:39');
INSERT INTO `wy_log` VALUES ('2233', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:40');
INSERT INTO `wy_log` VALUES ('2234', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:41');
INSERT INTO `wy_log` VALUES ('2235', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:43');
INSERT INTO `wy_log` VALUES ('2236', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:43');
INSERT INTO `wy_log` VALUES ('2237', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:44');
INSERT INTO `wy_log` VALUES ('2238', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:01:44');
INSERT INTO `wy_log` VALUES ('2239', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:05:13');
INSERT INTO `wy_log` VALUES ('2240', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:05:14');
INSERT INTO `wy_log` VALUES ('2241', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:06:33');
INSERT INTO `wy_log` VALUES ('2242', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:07:59');
INSERT INTO `wy_log` VALUES ('2243', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:08:05');
INSERT INTO `wy_log` VALUES ('2244', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=pass', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:08:07');
INSERT INTO `wy_log` VALUES ('2245', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:08:10');
INSERT INTO `wy_log` VALUES ('2246', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:09:47');
INSERT INTO `wy_log` VALUES ('2247', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:09:51');
INSERT INTO `wy_log` VALUES ('2248', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '113.108.131.163', '2017-03-24 14:09:56');
INSERT INTO `wy_log` VALUES ('2249', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:10:16');
INSERT INTO `wy_log` VALUES ('2250', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:14:20');
INSERT INTO `wy_log` VALUES ('2251', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=pay_list', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:14:23');
INSERT INTO `wy_log` VALUES ('2252', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:14:26');
INSERT INTO `wy_log` VALUES ('2253', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:14:47');
INSERT INTO `wy_log` VALUES ('2254', '', '0', 'pay', '', 'payment', '?m=pay&c=payment&a=modify_deposit', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:14:48');
INSERT INTO `wy_log` VALUES ('2255', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:14:59');
INSERT INTO `wy_log` VALUES ('2256', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:30:27');
INSERT INTO `wy_log` VALUES ('2257', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:30:31');
INSERT INTO `wy_log` VALUES ('2258', '', '0', 'member', '', 'member', '?m=member&c=member&a=memberinfo', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:30:35');
INSERT INTO `wy_log` VALUES ('2259', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:33:50');
INSERT INTO `wy_log` VALUES ('2260', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:38:18');
INSERT INTO `wy_log` VALUES ('2261', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:38:26');
INSERT INTO `wy_log` VALUES ('2262', '', '0', 'member', '', 'member', '?m=member&c=member&a=edit', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:38:31');
INSERT INTO `wy_log` VALUES ('2263', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:38:31');
INSERT INTO `wy_log` VALUES ('2264', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:50:03');
INSERT INTO `wy_log` VALUES ('2265', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:52:16');
INSERT INTO `wy_log` VALUES ('2266', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-24 14:53:27');
INSERT INTO `wy_log` VALUES ('2267', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 16:56:17');
INSERT INTO `wy_log` VALUES ('2268', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.108.131.163', '2017-03-24 16:56:24');
INSERT INTO `wy_log` VALUES ('2269', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:33');
INSERT INTO `wy_log` VALUES ('2270', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:35');
INSERT INTO `wy_log` VALUES ('2271', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:37');
INSERT INTO `wy_log` VALUES ('2272', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:37');
INSERT INTO `wy_log` VALUES ('2273', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:38');
INSERT INTO `wy_log` VALUES ('2274', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:38');
INSERT INTO `wy_log` VALUES ('2275', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:38');
INSERT INTO `wy_log` VALUES ('2276', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:39');
INSERT INTO `wy_log` VALUES ('2277', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:39');
INSERT INTO `wy_log` VALUES ('2278', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:40');
INSERT INTO `wy_log` VALUES ('2279', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:40');
INSERT INTO `wy_log` VALUES ('2280', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:40');
INSERT INTO `wy_log` VALUES ('2281', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:41');
INSERT INTO `wy_log` VALUES ('2282', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:41');
INSERT INTO `wy_log` VALUES ('2283', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:41');
INSERT INTO `wy_log` VALUES ('2284', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:42');
INSERT INTO `wy_log` VALUES ('2285', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:42');
INSERT INTO `wy_log` VALUES ('2286', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:43');
INSERT INTO `wy_log` VALUES ('2287', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:44');
INSERT INTO `wy_log` VALUES ('2288', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:44');
INSERT INTO `wy_log` VALUES ('2289', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:45');
INSERT INTO `wy_log` VALUES ('2290', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:45');
INSERT INTO `wy_log` VALUES ('2291', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:46');
INSERT INTO `wy_log` VALUES ('2292', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:46');
INSERT INTO `wy_log` VALUES ('2293', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:47');
INSERT INTO `wy_log` VALUES ('2294', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:47');
INSERT INTO `wy_log` VALUES ('2295', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:47');
INSERT INTO `wy_log` VALUES ('2296', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:48');
INSERT INTO `wy_log` VALUES ('2297', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:48');
INSERT INTO `wy_log` VALUES ('2298', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '113.108.131.163', '2017-03-24 16:56:49');
INSERT INTO `wy_log` VALUES ('2299', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-27 11:45:28');
INSERT INTO `wy_log` VALUES ('2300', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-27 11:45:35');
INSERT INTO `wy_log` VALUES ('2301', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-27 11:45:45');
INSERT INTO `wy_log` VALUES ('2302', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-27 11:45:54');
INSERT INTO `wy_log` VALUES ('2303', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-27 11:45:56');
INSERT INTO `wy_log` VALUES ('2304', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-27 11:45:58');
INSERT INTO `wy_log` VALUES ('2305', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-27 11:48:42');
INSERT INTO `wy_log` VALUES ('2306', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-27 11:48:45');
INSERT INTO `wy_log` VALUES ('2307', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '120.197.17.140', '2017-03-27 11:48:51');
INSERT INTO `wy_log` VALUES ('2308', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-28 09:25:27');
INSERT INTO `wy_log` VALUES ('2309', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-28 09:25:41');
INSERT INTO `wy_log` VALUES ('2310', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-28 09:25:42');
INSERT INTO `wy_log` VALUES ('2311', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '120.197.17.140', '2017-03-28 09:25:51');
INSERT INTO `wy_log` VALUES ('2312', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:25:55');
INSERT INTO `wy_log` VALUES ('2313', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:13');
INSERT INTO `wy_log` VALUES ('2314', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit_infos', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:15');
INSERT INTO `wy_log` VALUES ('2315', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:19');
INSERT INTO `wy_log` VALUES ('2316', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:20');
INSERT INTO `wy_log` VALUES ('2317', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:22');
INSERT INTO `wy_log` VALUES ('2318', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:22');
INSERT INTO `wy_log` VALUES ('2319', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:22');
INSERT INTO `wy_log` VALUES ('2320', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:23');
INSERT INTO `wy_log` VALUES ('2321', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:23');
INSERT INTO `wy_log` VALUES ('2322', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:24');
INSERT INTO `wy_log` VALUES ('2323', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:24');
INSERT INTO `wy_log` VALUES ('2324', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:24');
INSERT INTO `wy_log` VALUES ('2325', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:25');
INSERT INTO `wy_log` VALUES ('2326', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:25');
INSERT INTO `wy_log` VALUES ('2327', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:26');
INSERT INTO `wy_log` VALUES ('2328', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:26');
INSERT INTO `wy_log` VALUES ('2329', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:26');
INSERT INTO `wy_log` VALUES ('2330', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:27');
INSERT INTO `wy_log` VALUES ('2331', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:27');
INSERT INTO `wy_log` VALUES ('2332', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:30');
INSERT INTO `wy_log` VALUES ('2333', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:31');
INSERT INTO `wy_log` VALUES ('2334', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:31');
INSERT INTO `wy_log` VALUES ('2335', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:32');
INSERT INTO `wy_log` VALUES ('2336', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:32');
INSERT INTO `wy_log` VALUES ('2337', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:33');
INSERT INTO `wy_log` VALUES ('2338', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:33');
INSERT INTO `wy_log` VALUES ('2339', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:33');
INSERT INTO `wy_log` VALUES ('2340', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:34');
INSERT INTO `wy_log` VALUES ('2341', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:35');
INSERT INTO `wy_log` VALUES ('2342', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:35');
INSERT INTO `wy_log` VALUES ('2343', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:36');
INSERT INTO `wy_log` VALUES ('2344', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '120.197.17.140', '2017-03-28 09:26:36');

-- ----------------------------
-- Table structure for wy_member
-- ----------------------------
DROP TABLE IF EXISTS `wy_member`;
CREATE TABLE `wy_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `wyssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `wyssouid` (`wyssouid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_member
-- ----------------------------
INSERT INTO `wy_member` VALUES ('1', '1', '用户01', '8023b147239785ebdf485ae3967ebe89', '7N8Aa1', '官先森', '1490335603', '1490663335', '120.197.17.140', '120.197.17.140', '0', '749908550@qq.com', '2', '0', '0.00', '680', '10', '0', '0', '0', '0', '1', '', '', '');
INSERT INTO `wy_member` VALUES ('2', '2', '律师01', '48e25857ef26c6b4a52536364d0bff6e', 'qEbGwk', '官先', '1490335674', '1490663147', '120.197.17.140', '120.197.17.140', '0', 'guanxiaosa@wanglv.com', '9', '0', '0.00', '0', '12', '0', '0', '0', '0', '1', '', '', '13265101602');
INSERT INTO `wy_member` VALUES ('3', '3', '用户02', 'f9e2bba026bcb361c3c1a08588a4f5a1', 'RdQBf6', '陈先森', '1490335814', '1490335814', '120.197.17.140', '', '0', 'chenjunfang@wanglv.com', '2', '0', '0.00', '30', '10', '0', '0', '0', '0', '1', '', '', '');
INSERT INTO `wy_member` VALUES ('4', '4', '用户03', 'f67b76142664d9799ff252c451544497', 'K9yiBw', '官大', '1490337277', '1490337277', '120.197.17.140', '', '0', '13413546691@163.com', '2', '0', '0.00', '0', '10', '0', '0', '0', '0', '1', '', '', '13413546691');
INSERT INTO `wy_member` VALUES ('5', '5', '用户04', 'f67adbdacd79ae1db341a0b105db260c', 'Mp3My9', '李先森', '1490338396', '1490338396', '120.197.17.140', '', '0', 'liweihao@wanglv.com', '2', '0', '0.00', '30', '10', '0', '0', '0', '0', '1', '', '', '13265101602');

-- ----------------------------
-- Table structure for wy_member_detail
-- ----------------------------
DROP TABLE IF EXISTS `wy_member_detail`;
CREATE TABLE `wy_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `referrer` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_member_detail
-- ----------------------------
INSERT INTO `wy_member_detail` VALUES ('1', '天慧路3号', '');
INSERT INTO `wy_member_detail` VALUES ('3', '天慧路3号', '用户01');
INSERT INTO `wy_member_detail` VALUES ('4', '天慧路3号', '用户01');
INSERT INTO `wy_member_detail` VALUES ('5', '天慧路3号', '用户01');

-- ----------------------------
-- Table structure for wy_member_group
-- ----------------------------
DROP TABLE IF EXISTS `wy_member_group`;
CREATE TABLE `wy_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_member_group
-- ----------------------------
INSERT INTO `wy_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `wy_member_group` VALUES ('2', '普通会员', '1', '1', '300', '100', '0', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `wy_member_group` VALUES ('9', '律师会员', '0', '5', '0', '0', '0', '1', '0', '1', '0', '1', '0', '1', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '0', '0');
INSERT INTO `wy_member_group` VALUES ('5', '律师盾会员', '1', '5', '65535', '999', '0', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `wy_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `wy_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

-- ----------------------------
-- Table structure for wy_member_lawyer
-- ----------------------------
DROP TABLE IF EXISTS `wy_member_lawyer`;
CREATE TABLE `wy_member_lawyer` (
  `userid` mediumint(8) unsigned NOT NULL,
  `headshot` varchar(255) NOT NULL DEFAULT '',
  `lawyer_code` varchar(255) NOT NULL DEFAULT '',
  `lawyer_room` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `major` mediumtext NOT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_member_lawyer
-- ----------------------------
INSERT INTO `wy_member_lawyer` VALUES ('2', 'http://www.fl880.com/uploadfile/2017/0323/20170323042524989.jpg', '414141251516464144', '网律', '天慧路3号', '刑事辩护');

-- ----------------------------
-- Table structure for wy_member_menu
-- ----------------------------
DROP TABLE IF EXISTS `wy_member_menu`;
CREATE TABLE `wy_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_member_menu
-- ----------------------------
INSERT INTO `wy_member_menu` VALUES ('1', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `wy_member_menu` VALUES ('2', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `wy_member_menu` VALUES ('3', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');

-- ----------------------------
-- Table structure for wy_member_verify
-- ----------------------------
DROP TABLE IF EXISTS `wy_member_verify`;
CREATE TABLE `wy_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_member_verify
-- ----------------------------
INSERT INTO `wy_member_verify` VALUES ('1', '律师01', '102030', 'qEbGwk', '官先', '1490335674', '120.197.17.140', 'guanxiaosa@wanglv.com', '12', '30', '0.00', '{\"headshot\":\"http:\\/\\/www.fl880.com\\/uploadfile\\/2017\\/0323\\/20170323042524989.jpg\",\"lawyer_code\":\"414141251516464144\",\"lawyer_room\":\"\\u7f51\\u5f8b\",\"address\":\"\\u5929\\u6167\\u8def3\\u53f7\"}', '1', '1', '', '');

-- ----------------------------
-- Table structure for wy_member_vip
-- ----------------------------
DROP TABLE IF EXISTS `wy_member_vip`;
CREATE TABLE `wy_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_member_vip
-- ----------------------------

-- ----------------------------
-- Table structure for wy_menu
-- ----------------------------
DROP TABLE IF EXISTS `wy_menu`;
CREATE TABLE `wy_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1605 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_menu
-- ----------------------------
INSERT INTO `wy_menu` VALUES ('1', 'sys_setting', '0', 'admin', 'setting', 'init', '', '1', '1', '0', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('2', 'module', '0', 'admin', 'module', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('872', 'sync_release_point', '873', 'release', 'index', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('4', 'content', '0', 'content', 'content', 'init', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('5', 'members', '0', 'member', 'member', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('6', 'userinterface', '0', 'template', 'style', 'init', '', '6', '1', '0', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('30', 'correlative_setting', '1', 'admin', 'admin', 'admin', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('31', 'menu_manage', '977', 'admin', 'menu', 'init', '', '8', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('32', 'posid_manage', '975', 'admin', 'position', 'init', '', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('29', 'module_list', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('82', 'module_manage', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('10', 'panel', '0', 'admin', 'index', 'public_main', '', '0', '1', '0', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('35', 'menu_add', '31', 'admin', 'menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('826', 'template_manager', '6', '', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('54', 'admin_manage', '49', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('43', 'category_manage', '975', 'admin', 'category', 'init', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('42', 'add_category', '43', 'admin', 'category', 'add', 's=0', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('44', 'edit_category', '43', 'admin', 'category', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('45', 'badword_manage', '977', 'admin', 'badword', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('46', 'posid_add', '32', 'admin', 'position', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('49', 'admin_setting', '1', 'admin', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('50', 'role_manage', '49', 'admin', 'role', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('51', 'role_add', '50', 'admin', 'role', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('52', 'category_cache', '43', 'admin', 'category', 'public_cache', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('55', 'manage_member', '5', 'member', 'member', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('58', 'admin_add', '54', 'admin', 'admin_manage', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('59', 'model_manage', '975', 'content', 'sitemodel', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('64', 'site_management', '30', 'admin', 'site', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('81', 'member_add', '72', 'member', 'member', 'add', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('62', 'add_model', '59', 'content', 'sitemodel', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('65', 'release_point_management', '30', 'admin', 'release_point', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('66', 'badword_export', '45', 'admin', 'badword', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('67', 'add_site', '64', 'admin', 'site', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('68', 'badword_import', '45', 'admin', 'badword', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('812', 'member_group_manage', '76', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('74', 'member_verify', '55', 'member', 'member_verify', 'manage', 's=0', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('76', 'manage_member_group', '5', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('77', 'manage_member_model', '5', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('78', 'member_group_add', '812', 'member', 'member_group', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('79', 'member_model_add', '813', 'member', 'member_model', 'add', '', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('80', 'member_model_import', '77', 'member', 'member_model', 'import', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('72', 'member_manage', '55', 'member', 'member', 'manage', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('813', 'member_model_manage', '77', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('814', 'site_edit', '64', 'admin', 'site', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('815', 'site_del', '64', 'admin', 'site', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('816', 'release_point_add', '65', 'admin', 'release_point', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('817', 'release_point_del', '65', 'admin', 'release_point', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('818', 'release_point_edit', '65', 'admin', 'release_point', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('821', 'content_publish', '4', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('822', 'content_manage', '821', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('867', 'linkage', '977', 'admin', 'linkage', 'init', '', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('827', 'template_style', '826', 'template', 'style', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('828', 'import_style', '827', 'template', 'style', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('831', 'template_export', '827', 'template', 'style', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('830', 'template_file', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('832', 'template_onoff', '827', 'template', 'style', 'disable', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('833', 'template_updatename', '827', 'template', 'style', 'updatename', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('834', 'member_lock', '72', 'member', 'member', 'lock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('835', 'member_unlock', '72', 'member', 'member', 'unlock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('836', 'member_move', '72', 'member', 'member', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('837', 'member_delete', '72', 'member', 'member', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('842', 'verify_ignore', '74', 'member', 'member_verify', 'manage', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('839', 'member_setting', '55', 'member', 'member_setting', 'manage', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('841', 'verify_pass', '74', 'member', 'member_verify', 'manage', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('843', 'verify_delete', '74', 'member', 'member_verify', 'manage', 's=3', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('844', 'verify_deny', '74', 'member', 'member_verify', 'manage', 's=4', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('845', 'never_pass', '74', 'member', 'member_verify', 'manage', 's=5', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('846', 'template_file_list', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('847', 'template_file_edit', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('848', 'file_add_file', '827', 'template', 'file', 'add_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('850', 'listorder', '76', 'member', 'member_group', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('852', 'priv_setting', '50', 'admin', 'role', 'priv_setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('853', 'role_priv', '50', 'admin', 'role', 'role_priv', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('857', 'attachment_manage', '821', 'attachment', 'manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('868', 'special', '821', 'special', 'special', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('869', 'template_editor', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('870', 'template_visualization', '827', 'template', 'file', 'visualization', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('871', 'pc_tag_edit', '827', 'template', 'file', 'edit_pc_tag', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('873', 'release_manage', '4', 'release', 'html', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('874', 'type_manage', '975', 'content', 'type_manage', 'init', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('875', 'add_type', '874', 'content', 'type_manage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('876', 'linkageadd', '867', 'admin', 'linkage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('877', 'failure_list', '872', 'release', 'index', 'failed', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('879', 'member_search', '72', 'member', 'member', 'search', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('880', 'queue_del', '872', 'release', 'index', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('881', 'member_model_delete', '813', 'member', 'member_model', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('882', 'member_model_edit', '813', 'member', 'member_model', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('885', 'workflow', '977', 'content', 'workflow', 'init', '', '15', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('888', 'add_workflow', '885', 'content', 'workflow', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('889', 'member_modelfield_add', '813', 'member', 'member_modelfield', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('890', 'member_modelfield_edit', '813', 'member', 'member_modelfield', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('891', 'member_modelfield_delete', '813', 'member', 'member_modelfield', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('892', 'member_modelfield_manage', '813', 'member', 'member_modelfield', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('895', 'sitemodel_import', '59', 'content', 'sitemodel', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('896', 'spend_record', '29', 'pay', 'spend', 'init', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('897', 'payments', '896', 'pay', 'payment', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('898', 'paylist', '896', 'pay', 'payment', 'pay_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('899', 'add_content', '822', 'content', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('900', 'modify_deposit', '896', 'pay', 'payment', 'modify_deposit', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('901', 'check_content', '822', 'content', 'content', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('902', 'dbsource', '29', 'dbsource', 'data', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('905', 'create_content_html', '873', 'content', 'create_html', 'show', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('904', 'external_data_sources', '902', 'dbsource', 'dbsource_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('906', 'update_urls', '873', 'content', 'create_html', 'update_urls', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('960', 'node_add', '957', 'collection', 'node', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('909', 'fulltext_search', '29', 'search', 'search_type', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('910', 'manage_type', '909', 'search', 'search_type', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('911', 'search_setting', '909', 'search', 'search_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('912', 'createindex', '909', 'search', 'search_admin', 'createindex', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('913', 'add_search_type', '909', 'search', 'search_type', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('914', 'database_toos', '977', 'admin', 'database', 'export', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('915', 'database_export', '914', 'admin', 'database', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('916', 'database_import', '914', 'admin', 'database', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('917', 'dbsource_add', '902', 'dbsource', 'dbsource_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('918', 'dbsource_edit', '902', 'dbsource', 'dbsource_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('919', 'dbsource_del', '902', 'dbsource', 'dbsource_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('920', 'dbsource_data_add', '902', 'dbsource', 'data', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('921', 'dbsource_data_edit', '902', 'dbsource', 'data', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('922', 'dbsource_data_del', '902', 'dbsource', 'data', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('926', 'add_special', '868', 'special', 'special', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('927', 'edit_special', '868', 'special', 'special', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('928', 'special_list', '868', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('929', 'special_elite', '868', 'special', 'special', 'elite', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('930', 'delete_special', '868', 'special', 'special', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('931', 'badword_add', '45', 'admin', 'badword', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('932', 'badword_edit', '45', 'admin', 'badword', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('933', 'badword_delete', '45', 'admin', 'badword', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('934', 'special_listorder', '868', 'special', 'special', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('935', 'special_content_list', '868', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('936', 'special_content_add', '935', 'special', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('937', 'special_content_list', '935', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('938', 'special_content_edit', '935', 'special', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('939', 'special_content_delete', '935', 'special', 'content', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('940', 'special_content_listorder', '935', 'special', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('941', 'special_content_import', '935', 'special', 'special', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('942', 'history_version', '827', 'template', 'template_bak', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('943', 'restore_version', '827', 'template', 'template_bak', 'restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('944', 'del_history_version', '827', 'template', 'template_bak', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('945', 'block', '821', 'block', 'block_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('946', 'block_add', '945', 'block', 'block_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('950', 'block_edit', '945', 'block', 'block_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('951', 'block_del', '945', 'block', 'block_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('952', 'block_update', '945', 'block', 'block_admin', 'block_update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('953', 'block_restore', '945', 'block', 'block_admin', 'history_restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('954', 'history_del', '945', 'block', 'block_admin', 'history_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('978', 'urlrule_manage', '977', 'admin', 'urlrule', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('957', 'collection_node', '821', 'collection', 'node', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('979', 'safe_config', '30', 'admin', 'setting', 'init', '&tab=2', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('959', 'basic_config', '30', 'admin', 'setting', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('961', 'position_edit', '32', 'admin', 'position', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('962', 'collection_node_edit', '957', 'collection', 'node', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('963', 'collection_node_delete', '957', 'collection', 'node', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('990', 'col_url_list', '957', 'collection', 'node', 'col_url_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('965', 'collection_node_publish', '957', 'collection', 'node', 'publist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('966', 'collection_node_import', '957', 'collection', 'node', 'node_import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('967', 'collection_node_export', '957', 'collection', 'node', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('968', 'collection_node_collection_content', '957', 'collection', 'node', 'col_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('969', 'googlesitemap', '977', 'admin', 'googlesitemap', 'set', '', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('970', 'admininfo', '10', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('971', 'editpwd', '970', 'admin', 'admin_manage', 'public_edit_pwd', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('972', 'editinfo', '970', 'admin', 'admin_manage', 'public_edit_info', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('973', 'keylink', '977', 'admin', 'keylink', 'init', '', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('974', 'add_keylink', '973', 'admin', 'keylink', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('975', 'content_settings', '4', 'content', 'content_settings', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('7', 'extend', '0', 'admin', 'extend', 'init_extend', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('977', 'extend_all', '7', 'admin', 'extend_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('980', 'sso_config', '30', 'admin', 'setting', 'init', '&tab=3', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('981', 'email_config', '30', 'admin', 'setting', 'init', '&tab=4', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('982', 'module_manage', '82', 'admin', 'module', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('983', 'ipbanned', '977', 'admin', 'ipbanned', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('984', 'add_ipbanned', '983', 'admin', 'ipbanned', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('993', 'collection_content_import', '957', 'collection', 'node', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('991', 'copy_node', '957', 'collection', 'node', 'copy', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('992', 'content_del', '957', 'collection', 'node', 'content_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('989', 'downsites', '977', 'admin', 'downservers', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('994', 'import_program_add', '957', 'collection', 'node', 'import_program_add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('995', 'import_program_del', '957', 'collection', 'node', 'import_program_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('996', 'import_content', '957', 'collection', 'node', 'import_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('997', 'log', '977', 'admin', 'log', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('998', 'add_page', '43', 'admin', 'category', 'add', 's=1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('999', 'add_cat_link', '43', 'admin', 'category', 'add', 's=2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1000', 'count_items', '43', 'admin', 'category', 'count_items', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1001', 'cache_all', '977', 'admin', 'cache_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1002', 'create_list_html', '873', 'content', 'create_html', 'category', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1003', 'create_html_quick', '10', 'content', 'create_html_opt', 'index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1004', 'create_index', '1003', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1005', 'scan', '977', 'scan', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1006', 'scan_report', '1005', 'scan', 'index', 'scan_report', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1007', 'md5_creat', '1005', 'scan', 'index', 'md5_creat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1008', 'album_import', '868', 'special', 'album', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('8', 'wysso', '0', 'admin', 'wysso', 'menu', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1011', 'edit_content', '822', 'content', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1012', 'push_to_special', '822', 'content', 'push', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1023', 'delete_log', '997', 'admin', 'log', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1024', 'delete_ip', '983', 'admin', 'ipbanned', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1026', 'delete_keylink', '973', 'admin', 'keylink', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1027', 'edit_keylink', '973', 'admin', 'keylink', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1034', 'operation_pass', '74', 'member', 'member_verify', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1035', 'operation_delete', '74', 'member', 'member_verify', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1039', 'operation_ignore', '74', 'member', 'member_verify', 'ignore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1038', 'settingsave', '30', 'admin', 'setting', 'save', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1040', 'admin_edit', '54', 'admin', 'admin_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1041', 'operation_reject', '74', 'member', 'member_verify', 'reject', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1042', 'admin_delete', '54', 'admin', 'admin_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1043', 'card', '54', 'admin', 'admin_manage', 'card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1044', 'creat_card', '54', 'admin', 'admin_manage', 'creat_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1045', 'remove_card', '54', 'admin', 'admin_manage', 'remove_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1049', 'member_group_edit', '812', 'member', 'member_group', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1048', 'member_edit', '72', 'member', 'member', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1050', 'role_edit', '50', 'admin', 'role', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1051', 'member_group_delete', '812', 'member', 'member_group', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1052', 'member_manage', '50', 'admin', 'role', 'member_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1053', 'role_delete', '50', 'admin', 'role', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1054', 'member_model_export', '77', 'member', 'member_model', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1055', 'member_model_sort', '77', 'member', 'member_model', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1056', 'member_model_move', '77', 'member', 'member_model', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1057', 'payment_add', '897', 'pay', 'payment', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1058', 'payment_delete', '897', 'pay', 'payment', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1059', 'payment_edit', '897', 'pay', 'payment', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1060', 'spend_record', '896', 'pay', 'spend', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1061', 'pay_stat', '896', 'pay', 'payment', 'pay_stat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1062', 'fields_manage', '59', 'content', 'sitemodel_field', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1063', 'edit_model_content', '59', 'content', 'sitemodel', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1064', 'disabled_model', '59', 'content', 'sitemodel', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1065', 'delete_model', '59', 'content', 'sitemodel', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1066', 'export_model', '59', 'content', 'sitemodel', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1067', 'delete', '874', 'content', 'type_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1068', 'edit', '874', 'content', 'type_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1069', 'add_urlrule', '978', 'admin', 'urlrule', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1070', 'edit_urlrule', '978', 'admin', 'urlrule', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1071', 'delete_urlrule', '978', 'admin', 'urlrule', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1072', 'edit_menu', '31', 'admin', 'menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1073', 'delete_menu', '31', 'admin', 'menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1074', 'edit_workflow', '885', 'content', 'workflow', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1075', 'delete_workflow', '885', 'content', 'workflow', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1076', 'creat_html', '868', 'special', 'special', 'html', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1093', 'connect_config', '30', 'admin', 'setting', 'init', '&tab=5', '14', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1102', 'view_modelinfo', '74', 'member', 'member_verify', 'modelinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1202', 'create_special_list', '868', 'special', 'special', 'create_special_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1240', 'view_memberlinfo', '72', 'member', 'member', 'memberinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1239', 'copyfrom_manage', '977', 'admin', 'copyfrom', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1241', 'move_content', '822', 'content', 'content', 'remove', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1242', 'poster_template', '56', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1243', 'create_index', '873', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1244', 'add_othors', '822', 'content', 'content', 'add_othors', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1295', 'attachment_manager_dir', '857', 'attachment', 'manage', 'dir', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1296', 'attachment_manager_db', '857', 'attachment', 'manage', 'init', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1346', 'attachment_address_replace', '857', 'attachment', 'address', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1347', 'attachment_address_update', '857', 'attachment', 'address', 'update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1348', 'delete_content', '822', 'content', 'content', 'delete', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1349', 'member_menu_manage', '977', 'member', 'member_menu', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1350', 'member_menu_add', '1349', 'member', 'member_menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1351', 'member_menu_edit', '1349', 'member', 'member_menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1352', 'member_menu_delete', '1349', 'member', 'member_menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1353', 'batch_show', '822', 'content', 'create_html', 'batch_show', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1354', 'pay_delete', '898', 'pay', 'payment', 'pay_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1355', 'pay_cancel', '898', 'pay', 'payment', 'pay_cancel', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1356', 'discount', '898', 'pay', 'payment', 'discount', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1360', 'category_batch_edit', '43', 'admin', 'category', 'batch_edit', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1500', 'listorder', '822', 'content', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1501', 'a_clean_data', '873', 'content', 'content', 'clear_data', '', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `wy_menu` VALUES ('1502', 'announce', '29', 'announce', 'admin_announce', 'init', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1503', 'announce_add', '1502', 'announce', 'admin_announce', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1504', 'edit_announce', '1502', 'announce', 'admin_announce', 'edit', 's=1', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1505', 'check_announce', '1502', 'announce', 'admin_announce', 'init', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1506', 'overdue', '1502', 'announce', 'admin_announce', 'init', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1507', 'del_announce', '1502', 'announce', 'admin_announce', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1508', 'comment', '29', 'comment', 'comment_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1509', 'comment_manage', '821', 'comment', 'comment_admin', 'listinfo', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1510', 'comment_check', '1509', 'comment', 'check', 'checks', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1511', 'comment_list', '1508', 'comment', 'comment_admin', 'lists', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1512', 'link', '29', 'link', 'link', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1513', 'add_link', '1512', 'link', 'link', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1514', 'edit_link', '1512', 'link', 'link', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1515', 'delete_link', '1512', 'link', 'link', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1516', 'link_setting', '1512', 'link', 'link', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1517', 'add_type', '1512', 'link', 'link', 'add_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1518', 'list_type', '1512', 'link', 'link', 'list_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1519', 'check_register', '1512', 'link', 'link', 'check_register', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1528', 'message', '29', 'message', 'message', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1529', 'send_one', '1528', 'message', 'message', 'send_one', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1530', 'delete_message', '1528', 'message', 'message', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1531', 'message_send', '1528', 'message', 'message', 'message_send', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1532', 'message_group_manage', '1528', 'message', 'message', 'message_group_manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1535', 'poster', '29', 'poster', 'space', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1536', 'add_space', '1535', 'poster', 'space', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1537', 'edit_space', '1535', 'poster', 'space', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1538', 'del_space', '1535', 'poster', 'space', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1539', 'poster_list', '1535', 'poster', 'poster', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1540', 'add_poster', '1535', 'poster', 'poster', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1541', 'edit_poster', '1535', 'poster', 'poster', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1542', 'del_poster', '1535', 'poster', 'poster', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1543', 'poster_stat', '1535', 'poster', 'poster', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1544', 'poster_setting', '1535', 'poster', 'space', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1545', 'create_poster_js', '1535', 'poster', 'space', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1546', 'poster_template', '1535', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1547', 'formguide', '29', 'formguide', 'formguide', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1548', 'formguide_add', '1547', 'formguide', 'formguide', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1549', 'formguide_edit', '1547', 'formguide', 'formguide', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1550', 'form_info_list', '1547', 'formguide', 'formguide_info', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1551', 'formguide_disabled', '1547', 'formguide', 'formguide', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1552', 'formguide_delete', '1547', 'formguide', 'formguide', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1553', 'formguide_stat', '1547', 'formguide', 'formguide', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1554', 'add_public_field', '1547', 'formguide', 'formguide_field', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1555', 'list_public_field', '1547', 'formguide', 'formguide_field', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1556', 'module_setting', '1547', 'formguide', 'formguide', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1564', 'upgrade', '977', 'upgrade', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1565', 'checkfile', '1564', 'upgrade', 'index', 'checkfile', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1566', 'tag', '826', 'tag', 'tag', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1567', 'add_tag', '1566', 'tag', 'tag', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1568', 'edit_tag', '1566', 'tag', 'tag', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1569', 'delete_tag', '1566', 'tag', 'tag', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1570', 'tag_lists', '1566', 'tag', 'tag', 'lists', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1571', 'sms', '29', 'sms', 'sms', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1572', 'sms_setting', '1571', 'sms', 'sms', 'sms_setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1573', 'sms_pay_history', '1571', 'sms', 'sms', 'sms_pay_history', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1574', 'sms_buy_history', '1571', 'sms', 'sms', 'sms_buy_history', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1575', 'sms_api', '1571', 'sms', 'sms', 'sms_api', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1576', 'sms_sent', '1571', 'sms', 'sms', 'sms_sent', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1580', 'ask_setting', '29', 'ask', 'ask', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1578', 'site_infos', '10', 'admin', 'site', 'index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1579', 'edit_site_infos', '1578', 'admin', 'site', 'edit_infos', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1581', 'ask', '0', 'ask', 'ask', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1582', 'ask_manage', '1581', 'ask', 'ask', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1583', 'ask_relevant_manage', '1581', 'ask', 'ask', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1584', 'ask_question_manage', '1582', 'ask', 'ask', 'question_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1585', 'ask_type_manage', '1583', 'ask', 'ask', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1586', 'ask_position_manage', '1583', 'ask', 'position', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1587', 'question_list', '1584', 'ask', 'ask', 'question_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1588', 'listorder', '1587', 'ask', 'ask', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1589', 'question_edit', '1587', 'ask', 'ask', 'question_edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1590', 'change_question_status', '1587', 'ask', 'ask', 'change_question_stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1591', 'delete_question', '1587', 'ask', 'ask', 'delete_question', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1592', 'reply_list', '1587', 'ask', 'ask', 'reply_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1593', 'change_reply_status', '1592', 'ask', 'ask', 'change_reply_status', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1594', 'delete_reply', '1592', 'ask', 'ask', 'delete_reply', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1595', 'reply_content', '1592', 'ask', 'ask', 'reply_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1596', 'ask_add_type', '1585', 'ask', 'ask', 'add_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1597', 'ask_count_items', '1585', 'ask', 'ask', 'count_items', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1598', 'ask_type_listorder', '1585', 'ask', 'ask', 'type_listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1599', 'ask_type_edit', '1585', 'ask', 'ask', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1600', 'ask_type_delete', '1585', 'ask', 'ask', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1601', 'ask_position_add', '1586', 'ask', 'position', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1602', 'ask_position_listorder', '1586', 'ask', 'position', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1603', 'ask_position_edit', '1586', 'ask', 'position', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `wy_menu` VALUES ('1604', 'ask_position_delete', '1586', 'ask', 'position', 'delete', '', '0', '0', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for wy_message
-- ----------------------------
DROP TABLE IF EXISTS `wy_message`;
CREATE TABLE `wy_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_message
-- ----------------------------

-- ----------------------------
-- Table structure for wy_message_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_message_data`;
CREATE TABLE `wy_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_message_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_message_group
-- ----------------------------
DROP TABLE IF EXISTS `wy_message_group`;
CREATE TABLE `wy_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_message_group
-- ----------------------------

-- ----------------------------
-- Table structure for wy_model
-- ----------------------------
DROP TABLE IF EXISTS `wy_model`;
CREATE TABLE `wy_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_model
-- ----------------------------
INSERT INTO `wy_model` VALUES ('1', '1', '文章模型', '', 'news', '', '0', '0', '1', '0', 'default', 'category', 'list', 'show', '', '', '', '', '0', '0');
INSERT INTO `wy_model` VALUES ('2', '1', '下载模型', '', 'download', '', '0', '0', '1', '0', 'default', 'category_download', 'list_download', 'show_download', '', '', '', '', '0', '0');
INSERT INTO `wy_model` VALUES ('3', '1', '图片模型', '', 'picture', '', '0', '0', '1', '0', 'default', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', '0', '0');
INSERT INTO `wy_model` VALUES ('10', '1', '普通会员', '普通会员', 'member_detail', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '2');
INSERT INTO `wy_model` VALUES ('11', '1', '视频模型', '', 'video', '', '0', '0', '1', '0', 'default', 'category_video', 'list_video', 'show_video', '', '', '', '', '0', '0');
INSERT INTO `wy_model` VALUES ('12', '1', '律师会员', '注册律师', 'member_lawyer', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '2');
INSERT INTO `wy_model` VALUES ('15', '1', '商品模型', '', 'product', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for wy_model_field
-- ----------------------------
DROP TABLE IF EXISTS `wy_model_field`;
CREATE TABLE `wy_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_model_field
-- ----------------------------
INSERT INTO `wy_model_field` VALUES ('1', '1', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `wy_model_field` VALUES ('2', '1', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `wy_model_field` VALUES ('3', '1', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `wy_model_field` VALUES ('4', '1', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `wy_model_field` VALUES ('5', '1', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `wy_model_field` VALUES ('6', '1', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `wy_model_field` VALUES ('7', '1', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `wy_model_field` VALUES ('8', '1', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `wy_model_field` VALUES ('9', '1', '1', 'voteid', '添加投票', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '1', '0', '21', '0', '0');
INSERT INTO `wy_model_field` VALUES ('10', '1', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `wy_model_field` VALUES ('11', '1', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `wy_model_field` VALUES ('12', '1', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `wy_model_field` VALUES ('13', '1', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `wy_model_field` VALUES ('14', '1', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `wy_model_field` VALUES ('15', '1', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('16', '1', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `wy_model_field` VALUES ('17', '1', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `wy_model_field` VALUES ('18', '1', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('19', '1', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `wy_model_field` VALUES ('20', '1', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `wy_model_field` VALUES ('21', '1', '1', 'copyfrom', '来源', '', '', '0', '100', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `wy_model_field` VALUES ('80', '1', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `wy_model_field` VALUES ('22', '2', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `wy_model_field` VALUES ('23', '2', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `wy_model_field` VALUES ('24', '2', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `wy_model_field` VALUES ('25', '2', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `wy_model_field` VALUES ('26', '2', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `wy_model_field` VALUES ('27', '2', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `wy_model_field` VALUES ('28', '2', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `wy_model_field` VALUES ('29', '2', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `wy_model_field` VALUES ('30', '2', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `wy_model_field` VALUES ('31', '2', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `wy_model_field` VALUES ('32', '2', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `wy_model_field` VALUES ('33', '2', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `wy_model_field` VALUES ('34', '2', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `wy_model_field` VALUES ('35', '2', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `wy_model_field` VALUES ('36', '2', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `wy_model_field` VALUES ('37', '2', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `wy_model_field` VALUES ('38', '2', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `wy_model_field` VALUES ('39', '2', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('40', '2', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('41', '2', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `wy_model_field` VALUES ('42', '2', '1', 'downfiles', '本地下载', '', '', '0', '0', '', '', 'downfiles', 'array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `wy_model_field` VALUES ('43', '2', '1', 'downfile', '镜像下载', '', '', '0', '0', '', '', 'downfile', 'array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `wy_model_field` VALUES ('44', '2', '1', 'systems', '软件平台', '<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>', '', '0', '100', '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `wy_model_field` VALUES ('45', '2', '1', 'copytype', '软件授权形式', '', '', '0', '15', '', '', 'box', 'array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '12', '0', '0');
INSERT INTO `wy_model_field` VALUES ('46', '2', '1', 'language', '软件语言', '', '', '0', '16', '', '', 'box', 'array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '13', '0', '0');
INSERT INTO `wy_model_field` VALUES ('47', '2', '1', 'classtype', '软件类型', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `wy_model_field` VALUES ('48', '2', '1', 'version', '版本号', '', '', '0', '20', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `wy_model_field` VALUES ('49', '2', '1', 'filesize', '文件大小', '', '', '0', '10', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `wy_model_field` VALUES ('50', '2', '1', 'stars', '评分等级', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `wy_model_field` VALUES ('51', '3', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `wy_model_field` VALUES ('52', '3', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `wy_model_field` VALUES ('53', '3', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `wy_model_field` VALUES ('54', '3', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `wy_model_field` VALUES ('55', '3', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `wy_model_field` VALUES ('56', '3', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `wy_model_field` VALUES ('57', '3', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `wy_model_field` VALUES ('58', '3', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `wy_model_field` VALUES ('59', '3', '1', 'relation', '相关组图', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `wy_model_field` VALUES ('60', '3', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `wy_model_field` VALUES ('61', '3', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `wy_model_field` VALUES ('62', '3', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `wy_model_field` VALUES ('63', '3', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `wy_model_field` VALUES ('64', '3', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `wy_model_field` VALUES ('65', '3', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `wy_model_field` VALUES ('66', '3', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `wy_model_field` VALUES ('67', '3', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `wy_model_field` VALUES ('68', '3', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('69', '3', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('70', '3', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `wy_model_field` VALUES ('71', '3', '1', 'pictureurls', '组图', '', '', '0', '0', '', '', 'images', 'array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '15', '0', '0');
INSERT INTO `wy_model_field` VALUES ('72', '3', '1', 'copyfrom', '来源', '', '', '0', '0', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `wy_model_field` VALUES ('73', '1', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `wy_model_field` VALUES ('74', '2', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `wy_model_field` VALUES ('75', '3', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `wy_model_field` VALUES ('84', '11', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `wy_model_field` VALUES ('85', '11', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `wy_model_field` VALUES ('86', '11', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', 'array (\n)', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `wy_model_field` VALUES ('87', '11', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `wy_model_field` VALUES ('88', '11', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `wy_model_field` VALUES ('89', '11', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `wy_model_field` VALUES ('90', '11', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `wy_model_field` VALUES ('91', '11', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `wy_model_field` VALUES ('92', '11', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `wy_model_field` VALUES ('93', '11', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', 'array (\n)', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `wy_model_field` VALUES ('94', '11', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `wy_model_field` VALUES ('95', '11', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `wy_model_field` VALUES ('96', '11', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `wy_model_field` VALUES ('97', '11', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `wy_model_field` VALUES ('98', '11', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `wy_model_field` VALUES ('99', '11', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `wy_model_field` VALUES ('100', '11', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `wy_model_field` VALUES ('101', '11', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('102', '11', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('103', '11', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `wy_model_field` VALUES ('104', '11', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', 'array (\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `wy_model_field` VALUES ('105', '11', '1', 'video', '视频上传', '', '', '0', '0', '', '', 'video', 'array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `wy_model_field` VALUES ('106', '11', '1', 'vision', '画质', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `wy_model_field` VALUES ('107', '11', '1', 'video_category', '视频分类', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `wy_model_field` VALUES ('108', '10', '0', 'address', '联系地址', '', 'text', '1', '0', '', '', 'text', '{\"size\":\"36\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0');
INSERT INTO `wy_model_field` VALUES ('111', '12', '0', 'headshot', '律师头像', '', '', '0', '0', '', '', 'image', '{\"size\":\"\",\"defaultvalue\":\"\",\"show_type\":\"1\",\"upload_maxsize\":\"\",\"upload_allowext\":\"gif|jpg|jpeg|png|bmp\",\"isselectimage\":\"1\",\"images_width\":\"100\",\"images_height\":\"100\"}', '', '', '', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `wy_model_field` VALUES ('110', '10', '0', 'referrer', '推荐人（用户名）注：可不填', '', 'text', '0', '0', '', '', 'text', '{\"size\":\"36\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `wy_model_field` VALUES ('112', '12', '0', 'lawyer_code', '执业证号', '', 'text', '1', '0', '', '', 'text', '{\"size\":\"36\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `wy_model_field` VALUES ('113', '12', '0', 'lawyer_room', '执业律所', '', 'text', '1', '0', '', '', 'text', '{\"size\":\"36\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `wy_model_field` VALUES ('114', '12', '0', 'address', '联系地址', '', 'text', '1', '0', '', '', 'text', '{\"size\":\"36\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `wy_model_field` VALUES ('116', '12', '0', 'major', '专业', '', '', '0', '0', '', '', 'textarea', '{\"width\":\"100%\",\"height\":\"46\",\"defaultvalue\":\"\",\"enablehtml\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `wy_model_field` VALUES ('180', '15', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '1', '0');
INSERT INTO `wy_model_field` VALUES ('182', '1', '1', 'author', '作者', '', '', '0', '0', '', '', 'author', '{\"defaultvalue\":\"\"}', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '5', '0', '0');
INSERT INTO `wy_model_field` VALUES ('177', '15', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('178', '15', '1', 'readpoint', '商品价格', '', '', '1', '5', '', '', 'readpoint', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `wy_model_field` VALUES ('179', '15', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `wy_model_field` VALUES ('173', '15', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `wy_model_field` VALUES ('174', '15', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `wy_model_field` VALUES ('175', '15', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `wy_model_field` VALUES ('163', '15', '1', 'keywords', '商品关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `wy_model_field` VALUES ('164', '15', '1', 'description', '商品摘要', '', '', '0', '255', '', '', 'textarea', '{\"width\":\"98\",\"height\":\"46\",\"defaultvalue\":\"\",\"enablehtml\":\"0\"}', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `wy_model_field` VALUES ('165', '15', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `wy_model_field` VALUES ('166', '15', '1', 'content', '商品详情', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', '{\"toolbar\":\"full\",\"defaultvalue\":\"\",\"enablekeylink\":\"1\",\"replacenum\":\"2\",\"link_mode\":\"0\",\"enablesaveimage\":\"1\",\"height\":\"\",\"disabled_page\":\"0\"}', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `wy_model_field` VALUES ('167', '15', '1', 'thumb', '商品缩略图', '', '', '0', '100', '', '', 'image', '{\"size\":\"50\",\"defaultvalue\":\"\",\"show_type\":\"1\",\"upload_maxsize\":\"1024\",\"upload_allowext\":\"jpg|jpeg|gif|png|bmp\",\"watermark\":\"0\",\"isselectimage\":\"1\",\"images_width\":\"\",\"images_height\":\"\"}', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `wy_model_field` VALUES ('168', '15', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '1', '0');
INSERT INTO `wy_model_field` VALUES ('169', '15', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `wy_model_field` VALUES ('170', '15', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `wy_model_field` VALUES ('171', '15', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '1', '0');
INSERT INTO `wy_model_field` VALUES ('172', '15', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '1', '0');
INSERT INTO `wy_model_field` VALUES ('160', '15', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `wy_model_field` VALUES ('161', '15', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `wy_model_field` VALUES ('162', '15', '1', 'title', '商品名称', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `wy_model_field` VALUES ('176', '15', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '1', '0');

-- ----------------------------
-- Table structure for wy_module
-- ----------------------------
DROP TABLE IF EXISTS `wy_module`;
CREATE TABLE `wy_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_module
-- ----------------------------
INSERT INTO `wy_module` VALUES ('admin', 'admin', '', '1', '1.0', '', '{\"admin_email\":\"wycms@wanglv.com\",\"maxloginfailedtimes\":\"8\",\"minrefreshtime\":\"2\",\"mail_type\":\"1\",\"mail_server\":\"smtp.163.com\",\"mail_port\":\"25\",\"category_ajax\":\"0\",\"mail_user\":\"howecc@163.com\",\"mail_auth\":\"1\",\"mail_from\":\"howecc@163.com\",\"mail_password\":\"wy2305811\",\"errorlog_size\":\"20\"}', '0', '0', '2010-10-18', '2010-10-18');
INSERT INTO `wy_module` VALUES ('member', '会员', '', '1', '1.0', '', '{\"allowregister\":\"1\",\"choosemodel\":\"1\",\"enablemailcheck\":\"0\",\"enablcodecheck\":\"1\",\"mobile_checktype\":\"0\",\"user_sendsms_title\":\"\",\"registerverify\":\"1\",\"showapppoint\":\"1\",\"rmb_point_rate\":\"10\",\"defualtpoint\":\"30\",\"defualtamount\":\"0\",\"showregprotocol\":\"0\",\"regprotocol\":\"\\t\\t \\u6b22\\u8fce\\u60a8\\u6ce8\\u518c\\u6210\\u4e3awycms\\u7528\\u6237\\r\\n\\u8bf7\\u4ed4\\u7ec6\\u9605\\u8bfb\\u4e0b\\u9762\\u7684\\u534f\\u8bae\\uff0c\\u53ea\\u6709\\u63a5\\u53d7\\u534f\\u8bae\\u624d\\u80fd\\u7ee7\\u7eed\\u8fdb\\u884c\\u6ce8\\u518c\\u3002 \\r\\n1\\uff0e\\u670d\\u52a1\\u6761\\u6b3e\\u7684\\u786e\\u8ba4\\u548c\\u63a5\\u7eb3\\r\\n\\u3000\\u3000wycms\\u7528\\u6237\\u670d\\u52a1\\u7684\\u6240\\u6709\\u6743\\u548c\\u8fd0\\u4f5c\\u6743\\u5f52wycms\\u62e5\\u6709\\u3002wycms\\u6240\\u63d0\\u4f9b\\u7684\\u670d\\u52a1\\u5c06\\u6309\\u7167\\u6709\\u5173\\u7ae0\\u7a0b\\u3001\\u670d\\u52a1\\u6761\\u6b3e\\u548c\\u64cd\\u4f5c\\u89c4\\u5219\\u4e25\\u683c\\u6267\\u884c\\u3002\\u7528\\u6237\\u901a\\u8fc7\\u6ce8\\u518c\\u7a0b\\u5e8f\\u70b9\\u51fb\\u201c\\u6211\\u540c\\u610f\\u201d \\u6309\\u94ae\\uff0c\\u5373\\u8868\\u793a\\u7528\\u6237\\u4e0ewycms\\u8fbe\\u6210\\u534f\\u8bae\\u5e76\\u63a5\\u53d7\\u6240\\u6709\\u7684\\u670d\\u52a1\\u6761\\u6b3e\\u3002\\r\\n2\\uff0e wycms\\u670d\\u52a1\\u7b80\\u4ecb\\r\\n\\u3000\\u3000wycms\\u901a\\u8fc7\\u56fd\\u9645\\u4e92\\u8054\\u7f51\\u4e3a\\u7528\\u6237\\u63d0\\u4f9b\\u65b0\\u95fb\\u53ca\\u6587\\u7ae0\\u6d4f\\u89c8\\u3001\\u56fe\\u7247\\u6d4f\\u89c8\\u3001\\u8f6f\\u4ef6\\u4e0b\\u8f7d\\u3001\\u7f51\\u4e0a\\u7559\\u8a00\\u548cBBS\\u8bba\\u575b\\u7b49\\u670d\\u52a1\\u3002\\r\\n\\u3000\\u3000\\u7528\\u6237\\u5fc5\\u987b\\uff1a \\r\\n\\u3000\\u30001)\\u8d2d\\u7f6e\\u8bbe\\u5907\\uff0c\\u5305\\u62ec\\u4e2a\\u4eba\\u7535\\u8111\\u4e00\\u53f0\\u3001\\u8c03\\u5236\\u89e3\\u8c03\\u5668\\u4e00\\u4e2a\\u53ca\\u914d\\u5907\\u4e0a\\u7f51\\u88c5\\u7f6e\\u3002 \\r\\n\\u3000\\u30002)\\u4e2a\\u4eba\\u4e0a\\u7f51\\u548c\\u652f\\u4ed8\\u4e0e\\u6b64\\u670d\\u52a1\\u6709\\u5173\\u7684\\u7535\\u8bdd\\u8d39\\u7528\\u3001\\u7f51\\u7edc\\u8d39\\u7528\\u3002\\r\\n\\u3000\\u3000\\u7528\\u6237\\u540c\\u610f\\uff1a \\r\\n\\u3000\\u30001)\\u63d0\\u4f9b\\u53ca\\u65f6\\u3001\\u8be6\\u5c3d\\u53ca\\u51c6\\u786e\\u7684\\u4e2a\\u4eba\\u8d44\\u6599\\u3002 \\r\\n\\u3000\\u30002)\\u4e0d\\u65ad\\u66f4\\u65b0\\u6ce8\\u518c\\u8d44\\u6599\\uff0c\\u7b26\\u5408\\u53ca\\u65f6\\u3001\\u8be6\\u5c3d\\u3001\\u51c6\\u786e\\u7684\\u8981\\u6c42\\u3002\\u6240\\u6709\\u539f\\u59cb\\u952e\\u5165\\u7684\\u8d44\\u6599\\u5c06\\u5f15\\u7528\\u4e3a\\u6ce8\\u518c\\u8d44\\u6599\\u3002 \\r\\n\\u3000\\u30003)\\u7528\\u6237\\u540c\\u610f\\u9075\\u5b88\\u300a\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u4fdd\\u5b88\\u56fd\\u5bb6\\u79d8\\u5bc6\\u6cd5\\u300b\\u3001\\u300a\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u8ba1\\u7b97\\u673a\\u4fe1\\u606f\\u7cfb\\u7edf\\u5b89\\u5168\\u4fdd\\u62a4\\u6761\\u4f8b\\u300b\\u3001\\u300a\\u8ba1\\u7b97\\u673a\\u8f6f\\u4ef6\\u4fdd\\u62a4\\u6761\\u4f8b\\u300b\\u7b49\\u6709\\u5173\\u8ba1\\u7b97\\u673a\\u53ca\\u4e92\\u8054\\u7f51\\u89c4\\u5b9a\\u7684\\u6cd5\\u5f8b\\u548c\\u6cd5\\u89c4\\u3001\\u5b9e\\u65bd\\u529e\\u6cd5\\u3002\\u5728\\u4efb\\u4f55\\u60c5\\u51b5\\u4e0b\\uff0cwycms\\u5408\\u7406\\u5730\\u8ba4\\u4e3a\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u53ef\\u80fd\\u8fdd\\u53cd\\u4e0a\\u8ff0\\u6cd5\\u5f8b\\u3001\\u6cd5\\u89c4\\uff0cwycms\\u53ef\\u4ee5\\u5728\\u4efb\\u4f55\\u65f6\\u5019\\uff0c\\u4e0d\\u7ecf\\u4e8b\\u5148\\u901a\\u77e5\\u7ec8\\u6b62\\u5411\\u8be5\\u7528\\u6237\\u63d0\\u4f9b\\u670d\\u52a1\\u3002\\u7528\\u6237\\u5e94\\u4e86\\u89e3\\u56fd\\u9645\\u4e92\\u8054\\u7f51\\u7684\\u65e0\\u56fd\\u754c\\u6027\\uff0c\\u5e94\\u7279\\u522b\\u6ce8\\u610f\\u9075\\u5b88\\u5f53\\u5730\\u6240\\u6709\\u6709\\u5173\\u7684\\u6cd5\\u5f8b\\u548c\\u6cd5\\u89c4\\u3002\\r\\n3\\uff0e \\u670d\\u52a1\\u6761\\u6b3e\\u7684\\u4fee\\u6539\\r\\n\\u3000\\u3000wycms\\u4f1a\\u4e0d\\u5b9a\\u65f6\\u5730\\u4fee\\u6539\\u670d\\u52a1\\u6761\\u6b3e\\uff0c\\u670d\\u52a1\\u6761\\u6b3e\\u4e00\\u65e6\\u53d1\\u751f\\u53d8\\u52a8\\uff0c\\u5c06\\u4f1a\\u5728\\u76f8\\u5173\\u9875\\u9762\\u4e0a\\u63d0\\u793a\\u4fee\\u6539\\u5185\\u5bb9\\u3002\\u5982\\u679c\\u60a8\\u540c\\u610f\\u6539\\u52a8\\uff0c\\u5219\\u518d\\u4e00\\u6b21\\u70b9\\u51fb\\u201c\\u6211\\u540c\\u610f\\u201d\\u6309\\u94ae\\u3002 \\u5982\\u679c\\u60a8\\u4e0d\\u63a5\\u53d7\\uff0c\\u5219\\u53ca\\u65f6\\u53d6\\u6d88\\u60a8\\u7684\\u7528\\u6237\\u4f7f\\u7528\\u670d\\u52a1\\u8d44\\u683c\\u3002\\r\\n4\\uff0e \\u670d\\u52a1\\u4fee\\u8ba2\\r\\n\\u3000\\u3000wycms\\u4fdd\\u7559\\u968f\\u65f6\\u4fee\\u6539\\u6216\\u4e2d\\u65ad\\u670d\\u52a1\\u800c\\u4e0d\\u9700\\u77e5\\u7167\\u7528\\u6237\\u7684\\u6743\\u5229\\u3002wycms\\u884c\\u4f7f\\u4fee\\u6539\\u6216\\u4e2d\\u65ad\\u670d\\u52a1\\u7684\\u6743\\u5229\\uff0c\\u4e0d\\u9700\\u5bf9\\u7528\\u6237\\u6216\\u7b2c\\u4e09\\u65b9\\u8d1f\\u8d23\\u3002\\r\\n5\\uff0e \\u7528\\u6237\\u9690\\u79c1\\u5236\\u5ea6\\r\\n\\u3000\\u3000\\u5c0a\\u91cd\\u7528\\u6237\\u4e2a\\u4eba\\u9690\\u79c1\\u662fwycms\\u7684 \\u57fa\\u672c\\u653f\\u7b56\\u3002wycms\\u4e0d\\u4f1a\\u516c\\u5f00\\u3001\\u7f16\\u8f91\\u6216\\u900f\\u9732\\u7528\\u6237\\u7684\\u6ce8\\u518c\\u4fe1\\u606f\\uff0c\\u9664\\u975e\\u6709\\u6cd5\\u5f8b\\u8bb8\\u53ef\\u8981\\u6c42\\uff0c\\u6216wycms\\u5728\\u8bda\\u4fe1\\u7684\\u57fa\\u7840\\u4e0a\\u8ba4\\u4e3a\\u900f\\u9732\\u8fd9\\u4e9b\\u4fe1\\u606f\\u5728\\u4ee5\\u4e0b\\u4e09\\u79cd\\u60c5\\u51b5\\u662f\\u5fc5\\u8981\\u7684\\uff1a \\r\\n\\u3000\\u30001)\\u9075\\u5b88\\u6709\\u5173\\u6cd5\\u5f8b\\u89c4\\u5b9a\\uff0c\\u9075\\u4ece\\u5408\\u6cd5\\u670d\\u52a1\\u7a0b\\u5e8f\\u3002 \\r\\n\\u3000\\u30002)\\u4fdd\\u6301\\u7ef4\\u62a4wycms\\u7684\\u5546\\u6807\\u6240\\u6709\\u6743\\u3002 \\r\\n\\u3000\\u30003)\\u5728\\u7d27\\u6025\\u60c5\\u51b5\\u4e0b\\u7aed\\u529b\\u7ef4\\u62a4\\u7528\\u6237\\u4e2a\\u4eba\\u548c\\u793e\\u4f1a\\u5927\\u4f17\\u7684\\u9690\\u79c1\\u5b89\\u5168\\u3002 \\r\\n\\u3000\\u30004)\\u7b26\\u5408\\u5176\\u4ed6\\u76f8\\u5173\\u7684\\u8981\\u6c42\\u3002 \\r\\n6\\uff0e\\u7528\\u6237\\u7684\\u5e10\\u53f7\\uff0c\\u5bc6\\u7801\\u548c\\u5b89\\u5168\\u6027\\r\\n\\u3000\\u3000\\u4e00\\u65e6\\u6ce8\\u518c\\u6210\\u529f\\u6210\\u4e3awycms\\u7528\\u6237\\uff0c\\u60a8\\u5c06\\u5f97\\u5230\\u4e00\\u4e2a\\u5bc6\\u7801\\u548c\\u5e10\\u53f7\\u3002\\u5982\\u679c\\u60a8\\u4e0d\\u4fdd\\u7ba1\\u597d\\u81ea\\u5df1\\u7684\\u5e10\\u53f7\\u548c\\u5bc6\\u7801\\u5b89\\u5168\\uff0c\\u5c06\\u5bf9\\u56e0\\u6b64\\u4ea7\\u751f\\u7684\\u540e\\u679c\\u8d1f\\u5168\\u90e8\\u8d23\\u4efb\\u3002\\u53e6\\u5916\\uff0c\\u6bcf\\u4e2a\\u7528\\u6237\\u90fd\\u8981\\u5bf9\\u5176\\u5e10\\u6237\\u4e2d\\u7684\\u6240\\u6709\\u6d3b\\u52a8\\u548c\\u4e8b\\u4ef6\\u8d1f\\u5168\\u8d23\\u3002\\u60a8\\u53ef\\u968f\\u65f6\\u6839\\u636e\\u6307\\u793a\\u6539\\u53d8\\u60a8\\u7684\\u5bc6\\u7801\\uff0c\\u4e5f\\u53ef\\u4ee5\\u7ed3\\u675f\\u65e7\\u7684\\u5e10\\u6237\\u91cd\\u5f00\\u4e00\\u4e2a\\u65b0\\u5e10\\u6237\\u3002\\u7528\\u6237\\u540c\\u610f\\u82e5\\u53d1\\u73b0\\u4efb\\u4f55\\u975e\\u6cd5\\u4f7f\\u7528\\u7528\\u6237\\u5e10\\u53f7\\u6216\\u5b89\\u5168\\u6f0f\\u6d1e\\u7684\\u60c5\\u51b5\\uff0c\\u7acb\\u5373\\u901a\\u77e5wycms\\u3002\\r\\n7\\uff0e \\u514d\\u8d23\\u6761\\u6b3e\\r\\n\\u3000\\u3000\\u7528\\u6237\\u660e\\u786e\\u540c\\u610f\\u7f51\\u7ad9\\u670d\\u52a1\\u7684\\u4f7f\\u7528\\u7531\\u7528\\u6237\\u4e2a\\u4eba\\u627f\\u62c5\\u98ce\\u9669\\u3002 \\u3000\\u3000 \\r\\n\\u3000\\u3000wycms\\u4e0d\\u4f5c\\u4efb\\u4f55\\u7c7b\\u578b\\u7684\\u62c5\\u4fdd\\uff0c\\u4e0d\\u62c5\\u4fdd\\u670d\\u52a1\\u4e00\\u5b9a\\u80fd\\u6ee1\\u8db3\\u7528\\u6237\\u7684\\u8981\\u6c42\\uff0c\\u4e5f\\u4e0d\\u62c5\\u4fdd\\u670d\\u52a1\\u4e0d\\u4f1a\\u53d7\\u4e2d\\u65ad\\uff0c\\u5bf9\\u670d\\u52a1\\u7684\\u53ca\\u65f6\\u6027\\uff0c\\u5b89\\u5168\\u6027\\uff0c\\u51fa\\u9519\\u53d1\\u751f\\u90fd\\u4e0d\\u4f5c\\u62c5\\u4fdd\\u3002\\u7528\\u6237\\u7406\\u89e3\\u5e76\\u63a5\\u53d7\\uff1a\\u4efb\\u4f55\\u901a\\u8fc7wycms\\u670d\\u52a1\\u53d6\\u5f97\\u7684\\u4fe1\\u606f\\u8d44\\u6599\\u7684\\u53ef\\u9760\\u6027\\u53d6\\u51b3\\u4e8e\\u7528\\u6237\\u81ea\\u5df1\\uff0c\\u7528\\u6237\\u81ea\\u5df1\\u627f\\u62c5\\u6240\\u6709\\u98ce\\u9669\\u548c\\u8d23\\u4efb\\u3002 \\r\\n8\\uff0e\\u6709\\u9650\\u8d23\\u4efb\\r\\n\\u3000\\u3000wycms\\u5bf9\\u4efb\\u4f55\\u76f4\\u63a5\\u3001\\u95f4\\u63a5\\u3001\\u5076\\u7136\\u3001\\u7279\\u6b8a\\u53ca\\u7ee7\\u8d77\\u7684\\u635f\\u5bb3\\u4e0d\\u8d1f\\u8d23\\u4efb\\u3002\\r\\n9\\uff0e \\u4e0d\\u63d0\\u4f9b\\u96f6\\u552e\\u548c\\u5546\\u4e1a\\u6027\\u670d\\u52a1 \\r\\n\\u3000\\u3000\\u7528\\u6237\\u4f7f\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u7684\\u6743\\u5229\\u662f\\u4e2a\\u4eba\\u7684\\u3002\\u7528\\u6237\\u53ea\\u80fd\\u662f\\u4e00\\u4e2a\\u5355\\u72ec\\u7684\\u4e2a\\u4f53\\u800c\\u4e0d\\u80fd\\u662f\\u4e00\\u4e2a\\u516c\\u53f8\\u6216\\u5b9e\\u4f53\\u5546\\u4e1a\\u6027\\u7ec4\\u7ec7\\u3002\\u7528\\u6237\\u627f\\u8bfa\\u4e0d\\u7ecfwycms\\u540c\\u610f\\uff0c\\u4e0d\\u80fd\\u5229\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u8fdb\\u884c\\u9500\\u552e\\u6216\\u5176\\u4ed6\\u5546\\u4e1a\\u7528\\u9014\\u3002\\r\\n10\\uff0e\\u7528\\u6237\\u8d23\\u4efb \\r\\n\\u3000\\u3000\\u7528\\u6237\\u5355\\u72ec\\u627f\\u62c5\\u4f20\\u8f93\\u5185\\u5bb9\\u7684\\u8d23\\u4efb\\u3002\\u7528\\u6237\\u5fc5\\u987b\\u9075\\u5faa\\uff1a \\r\\n\\u3000\\u30001)\\u4ece\\u4e2d\\u56fd\\u5883\\u5185\\u5411\\u5916\\u4f20\\u8f93\\u6280\\u672f\\u6027\\u8d44\\u6599\\u65f6\\u5fc5\\u987b\\u7b26\\u5408\\u4e2d\\u56fd\\u6709\\u5173\\u6cd5\\u89c4\\u3002 \\r\\n\\u3000\\u30002)\\u4f7f\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u4e0d\\u4f5c\\u975e\\u6cd5\\u7528\\u9014\\u3002 \\r\\n\\u3000\\u30003)\\u4e0d\\u5e72\\u6270\\u6216\\u6df7\\u4e71\\u7f51\\u7edc\\u670d\\u52a1\\u3002 \\r\\n\\u3000\\u30004)\\u4e0d\\u5728\\u8bba\\u575bBBS\\u6216\\u7559\\u8a00\\u7c3f\\u53d1\\u8868\\u4efb\\u4f55\\u4e0e\\u653f\\u6cbb\\u76f8\\u5173\\u7684\\u4fe1\\u606f\\u3002 \\r\\n\\u3000\\u30005)\\u9075\\u5b88\\u6240\\u6709\\u4f7f\\u7528\\u7f51\\u7ad9\\u670d\\u52a1\\u7684\\u7f51\\u7edc\\u534f\\u8bae\\u3001\\u89c4\\u5b9a\\u3001\\u7a0b\\u5e8f\\u548c\\u60ef\\u4f8b\\u3002\\r\\n\\u3000\\u30006)\\u4e0d\\u5f97\\u5229\\u7528\\u672c\\u7ad9\\u5371\\u5bb3\\u56fd\\u5bb6\\u5b89\\u5168\\u3001\\u6cc4\\u9732\\u56fd\\u5bb6\\u79d8\\u5bc6\\uff0c\\u4e0d\\u5f97\\u4fb5\\u72af\\u56fd\\u5bb6\\u793e\\u4f1a\\u96c6\\u4f53\\u7684\\u548c\\u516c\\u6c11\\u7684\\u5408\\u6cd5\\u6743\\u76ca\\u3002\\r\\n\\u3000\\u30007)\\u4e0d\\u5f97\\u5229\\u7528\\u672c\\u7ad9\\u5236\\u4f5c\\u3001\\u590d\\u5236\\u548c\\u4f20\\u64ad\\u4e0b\\u5217\\u4fe1\\u606f\\uff1a \\r\\n\\u3000\\u3000\\u30001\\u3001\\u717d\\u52a8\\u6297\\u62d2\\u3001\\u7834\\u574f\\u5baa\\u6cd5\\u548c\\u6cd5\\u5f8b\\u3001\\u884c\\u653f\\u6cd5\\u89c4\\u5b9e\\u65bd\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30002\\u3001\\u717d\\u52a8\\u98a0\\u8986\\u56fd\\u5bb6\\u653f\\u6743\\uff0c\\u63a8\\u7ffb\\u793e\\u4f1a\\u4e3b\\u4e49\\u5236\\u5ea6\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30003\\u3001\\u717d\\u52a8\\u5206\\u88c2\\u56fd\\u5bb6\\u3001\\u7834\\u574f\\u56fd\\u5bb6\\u7edf\\u4e00\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30004\\u3001\\u717d\\u52a8\\u6c11\\u65cf\\u4ec7\\u6068\\u3001\\u6c11\\u65cf\\u6b67\\u89c6\\uff0c\\u7834\\u574f\\u6c11\\u65cf\\u56e2\\u7ed3\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30005\\u3001\\u634f\\u9020\\u6216\\u8005\\u6b6a\\u66f2\\u4e8b\\u5b9e\\uff0c\\u6563\\u5e03\\u8c23\\u8a00\\uff0c\\u6270\\u4e71\\u793e\\u4f1a\\u79e9\\u5e8f\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30006\\u3001\\u5ba3\\u626c\\u5c01\\u5efa\\u8ff7\\u4fe1\\u3001\\u6deb\\u79fd\\u3001\\u8272\\u60c5\\u3001\\u8d4c\\u535a\\u3001\\u66b4\\u529b\\u3001\\u51f6\\u6740\\u3001\\u6050\\u6016\\u3001\\u6559\\u5506\\u72af\\u7f6a\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30007\\u3001\\u516c\\u7136\\u4fae\\u8fb1\\u4ed6\\u4eba\\u6216\\u8005\\u634f\\u9020\\u4e8b\\u5b9e\\u8bfd\\u8c24\\u4ed6\\u4eba\\u7684\\uff0c\\u6216\\u8005\\u8fdb\\u884c\\u5176\\u4ed6\\u6076\\u610f\\u653b\\u51fb\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30008\\u3001\\u635f\\u5bb3\\u56fd\\u5bb6\\u673a\\u5173\\u4fe1\\u8a89\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u30009\\u3001\\u5176\\u4ed6\\u8fdd\\u53cd\\u5baa\\u6cd5\\u548c\\u6cd5\\u5f8b\\u884c\\u653f\\u6cd5\\u89c4\\u7684\\uff1b\\r\\n\\u3000\\u3000\\u300010\\u3001\\u8fdb\\u884c\\u5546\\u4e1a\\u5e7f\\u544a\\u884c\\u4e3a\\u7684\\u3002\\r\\n\\u3000\\u3000\\u7528\\u6237\\u4e0d\\u80fd\\u4f20\\u8f93\\u4efb\\u4f55\\u6559\\u5506\\u4ed6\\u4eba\\u6784\\u6210\\u72af\\u7f6a\\u884c\\u4e3a\\u7684\\u8d44\\u6599\\uff1b\\u4e0d\\u80fd\\u4f20\\u8f93\\u957f\\u56fd\\u5185\\u4e0d\\u5229\\u6761\\u4ef6\\u548c\\u6d89\\u53ca\\u56fd\\u5bb6\\u5b89\\u5168\\u7684\\u8d44\\u6599\\uff1b\\u4e0d\\u80fd\\u4f20\\u8f93\\u4efb\\u4f55\\u4e0d\\u7b26\\u5408\\u5f53\\u5730\\u6cd5\\u89c4\\u3001\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u548c\\u56fd\\u9645\\u6cd5 \\u5f8b\\u7684\\u8d44\\u6599\\u3002\\u672a\\u7ecf\\u8bb8\\u53ef\\u800c\\u975e\\u6cd5\\u8fdb\\u5165\\u5176\\u5b83\\u7535\\u8111\\u7cfb\\u7edf\\u662f\\u7981\\u6b62\\u7684\\u3002\\u82e5\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u4e0d\\u7b26\\u5408\\u4ee5\\u4e0a\\u7684\\u6761\\u6b3e\\uff0cwycms\\u5c06\\u53d6\\u6d88\\u7528\\u6237\\u670d\\u52a1\\u5e10\\u53f7\\u3002\\r\\n11\\uff0e\\u7f51\\u7ad9\\u5185\\u5bb9\\u7684\\u6240\\u6709\\u6743\\r\\n\\u3000\\u3000wycms\\u5b9a\\u4e49\\u7684\\u5185\\u5bb9\\u5305\\u62ec\\uff1a\\u6587\\u5b57\\u3001\\u8f6f\\u4ef6\\u3001\\u58f0\\u97f3\\u3001\\u76f8\\u7247\\u3001\\u5f55\\u8c61\\u3001\\u56fe\\u8868\\uff1b\\u5728\\u5e7f\\u544a\\u4e2d\\u5168\\u90e8\\u5185\\u5bb9\\uff1b\\u7535\\u5b50\\u90ae\\u4ef6\\u7684\\u5168\\u90e8\\u5185\\u5bb9\\uff1bwycms\\u4e3a\\u7528\\u6237\\u63d0\\u4f9b\\u7684\\u5546\\u4e1a\\u4fe1\\u606f\\u3002\\u6240\\u6709\\u8fd9\\u4e9b\\u5185\\u5bb9\\u53d7\\u7248\\u6743\\u3001\\u5546\\u6807\\u3001\\u6807\\u7b7e\\u548c\\u5176\\u5b83\\u8d22\\u4ea7\\u6240\\u6709\\u6743\\u6cd5\\u5f8b\\u7684\\u4fdd\\u62a4\\u3002\\u6240\\u4ee5\\uff0c\\u7528\\u6237\\u53ea\\u80fd\\u5728wycms\\u548c\\u5e7f\\u544a\\u5546\\u6388\\u6743\\u4e0b\\u624d\\u80fd\\u4f7f\\u7528\\u8fd9\\u4e9b\\u5185\\u5bb9\\uff0c\\u800c\\u4e0d\\u80fd\\u64c5\\u81ea\\u590d\\u5236\\u3001\\u7be1\\u6539\\u8fd9\\u4e9b\\u5185\\u5bb9\\u3001\\u6216\\u521b\\u9020\\u4e0e\\u5185\\u5bb9\\u6709\\u5173\\u7684\\u6d3e\\u751f\\u4ea7\\u54c1\\u3002\\r\\n12\\uff0e\\u9644\\u52a0\\u4fe1\\u606f\\u670d\\u52a1\\r\\n\\u3000\\u3000\\u7528\\u6237\\u5728\\u4eab\\u7528wycms\\u63d0\\u4f9b\\u7684\\u514d\\u8d39\\u670d\\u52a1\\u7684\\u540c\\u65f6\\uff0c\\u540c\\u610f\\u63a5\\u53d7wycms\\u63d0\\u4f9b\\u7684\\u5404\\u7c7b\\u9644\\u52a0\\u4fe1\\u606f\\u670d\\u52a1\\u3002\\r\\n13\\uff0e\\u89e3\\u91ca\\u6743\\r\\n\\u3000\\u3000\\u672c\\u6ce8\\u518c\\u534f\\u8bae\\u7684\\u89e3\\u91ca\\u6743\\u5f52wycms\\u6240\\u6709\\u3002\\u5982\\u679c\\u5176\\u4e2d\\u6709\\u4efb\\u4f55\\u6761\\u6b3e\\u4e0e\\u56fd\\u5bb6\\u7684\\u6709\\u5173\\u6cd5\\u5f8b\\u76f8\\u62b5\\u89e6\\uff0c\\u5219\\u4ee5\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u7684\\u660e\\u6587\\u89c4\\u5b9a\\u4e3a\\u51c6\\u3002 \",\"registerverifymessage\":\" \\u6b22\\u8fce\\u60a8\\u6ce8\\u518c\\u6210\\u4e3a\\u5fd7\\u516c\\u6052\\u5f8b\\u5e08\\u670d\\u52a1\\u7f51\\u7528\\u6237\\uff0c\\u60a8\\u7684\\u8d26\\u53f7\\u9700\\u8981\\u90ae\\u7bb1\\u8ba4\\u8bc1\\uff0c\\u70b9\\u51fb\\u4e0b\\u9762\\u94fe\\u63a5\\u8fdb\\u884c\\u8ba4\\u8bc1\\uff1a{click}\\r\\n\\u6216\\u8005\\u5c06\\u7f51\\u5740\\u590d\\u5236\\u5230\\u6d4f\\u89c8\\u5668\\uff1a{url}\",\"forgetpassword\":\"\\u5fd7\\u516c\\u6052\\u5f8b\\u5e08\\u670d\\u52a1\\u7f51\\u5bc6\\u7801\\u627e\\u56de\\uff0c\\u8bf7\\u5728\\u4e00\\u5c0f\\u65f6\\u5185\\u70b9\\u51fb\\u4e0b\\u9762\\u94fe\\u63a5\\u8fdb\\u884c\\u64cd\\u4f5c\\uff1a{click}\\r\\n\\u6216\\u8005\\u5c06\\u7f51\\u5740\\u590d\\u5236\\u5230\\u6d4f\\u89c8\\u5668\\uff1a{url}\"}', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('digg', '顶一下', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('special', '专题', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('content', '内容模块', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('search', '全站搜索', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('scan', '木马扫描', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `wy_module` VALUES ('attachment', '附件', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `wy_module` VALUES ('block', '碎片', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `wy_module` VALUES ('collection', '采集模块', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `wy_module` VALUES ('dbsource', '数据源', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `wy_module` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `wy_module` VALUES ('release', '发布点', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `wy_module` VALUES ('announce', '公告', 'announce/', '0', '1.0', '公告', '', '0', '0', '2016-03-10', '2016-03-10');
INSERT INTO `wy_module` VALUES ('comment', '评论', 'comment/', '0', '1.0', '评论', '', '0', '0', '2016-03-10', '2016-03-10');
INSERT INTO `wy_module` VALUES ('link', '友情链接', '', '0', '1.0', '', '{\"1\":{\"is_post\":\"0\",\"enablecheckcode\":\"0\"}}', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('message', '短消息', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `wy_module` VALUES ('poster', '广告模块', 'poster/', '0', '1.0', '广告模块', '', '0', '0', '2016-03-10', '2016-03-10');
INSERT INTO `wy_module` VALUES ('formguide', '表单向导', 'formguide/', '0', '1.0', 'formguide', 'array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)', '0', '0', '2010-10-20', '2010-10-20');
INSERT INTO `wy_module` VALUES ('upgrade', '在线升级', '', '0', '1.0', '', '', '0', '0', '2011-05-18', '2011-05-18');
INSERT INTO `wy_module` VALUES ('tag', '标签向导', 'tag/', '0', '1.0', '标签向导', '', '0', '0', '2016-03-10', '2016-03-10');
INSERT INTO `wy_module` VALUES ('sms', '短信平台', 'sms/', '0', '1.0', '短信平台', '', '0', '0', '2011-09-02', '2011-09-02');
INSERT INTO `wy_module` VALUES ('ask', '咨询', 'ask/', '1', '1.0', '咨询', '', '0', '0', '2014-05-21', '2014-05-21');

-- ----------------------------
-- Table structure for wy_news
-- ----------------------------
DROP TABLE IF EXISTS `wy_news`;
CREATE TABLE `wy_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_news
-- ----------------------------
INSERT INTO `wy_news` VALUES ('20', '5', '0', '刑事案件如何撤销？', '', '', '', '摘要：撤销案件是指侦查机关对立案侦查的案件，发现具有某种法定情形，或者经过侦查否定了原来的立案根据，所采取的诉讼行为。公安机关或者   ', '0', 'http://www.fl880.com/2017/corpus_0324/20.html', '0', '99', '1', '0', 'admin', '1490320788', '1490320806', '');
INSERT INTO `wy_news` VALUES ('21', '4', '0', '什么是刑事诉讼一事不再理、禁止双重危险原则？', '', '', '', '摘要：什么是刑事诉讼一事不再理、禁止双重危险原则?一事不再理原则，指对同一行为，法院作出的判决生效后，除法律另有规定外，不得对行为   ', '0', 'http://www.fl880.com/2017/case_0324/21.html', '0', '99', '1', '0', 'admin', '1490322820', '1490322839', '');
INSERT INTO `wy_news` VALUES ('16', '11', '0', '行政复议决定书的撰写要求有哪些', '', '', '', '行政复议决定书作为复议机关对复议案件进行权威性判定的法律文书，应当具备一定的格式和内容。因此在撰写行政复议决定书时应当包括以下几方   ', '0', 'http://www.fl880.com/2017/litigation_0324/16.html', '0', '99', '1', '0', 'admin', '1490320608', '1490320628', '');
INSERT INTO `wy_news` VALUES ('17', '11', '0', '高人民法院关于审理民事、行政诉讼中司法赔偿案件适用法', '', '', '', '根据《中华人民共和国国家赔偿法》及有关法律规定，结合人民法院国家赔偿工作实际，现就人民法院赔偿委员会审理民事、行政诉讼中司法赔偿案   ', '0', 'http://www.fl880.com/2017/litigation_0324/17.html', '0', '99', '1', '0', 'admin', '1490320629', '1490320673', '');
INSERT INTO `wy_news` VALUES ('18', '5', '0', '行政诉讼法的基本原则', '', '', '', '摘要:行政诉讼法规定了哪些基本原则?行政诉讼法规定了八项基本原则，分别为人民法院依法独立审判原则、以事实为根据，以法律为准绳、对具体   ', '0', 'http://www.fl880.com/2017/corpus_0324/18.html', '0', '99', '1', '0', 'admin', '1490320725', '1490320738', '');
INSERT INTO `wy_news` VALUES ('19', '5', '0', '行政诉讼受案范围具体有哪些', '', '', '', '我国《行政诉讼法》在2014年11月1日决定修订，同时自2015年5月1日开始施行的新《行政诉讼法》，其中第十二条规定了人民法院受理行政诉讼案   ', '0', 'http://www.fl880.com/2017/corpus_0324/19.html', '0', '99', '1', '0', 'admin', '1490320739', '1490320772', '');
INSERT INTO `wy_news` VALUES ('12', '8', '0', '中小企业法律顾问有什么价值体现', '', '', '', '企业选择了一名优秀的律师作为其法律顾问以后，并不意味着这名律师马上就能绽放出自己的潜在价值。企业与法律顾问之间有一个磨合的过程，互   ', '0', 'http://www.fl880.com/2017/counsel_0324/12.html', '0', '99', '1', '0', 'admin', '1490320330', '1490320352', '');
INSERT INTO `wy_news` VALUES ('13', '9', '0', '关于涉外民商事案件诉讼管辖若干问题的规定', '', '', '', '关于涉外民商事案件诉讼管辖若干问题的规定法释〔2002〕5号(2001年12月25日最高人民法院审判委员会第1203次会议通过)中华人民共和国最高人   ', '0', 'http://www.fl880.com/2017/caseAgent_0324/13.html', '0', '99', '1', '0', 'admin', '1490320414', '1490320434', '');
INSERT INTO `wy_news` VALUES ('14', '9', '0', '【权威发布】最新民商事审判指导意见公布 附《第八次民商', '', '', '', '关于侵权纠纷案件的审理审理好侵权损害赔偿案件对于保护民事主体的合法权益，明确侵权责任，预防并制裁侵权行为，促进社会公平正义具有重要   ', '0', 'http://www.fl880.com/2017/caseAgent_0324/14.html', '0', '99', '1', '0', 'admin', '1490320470', '1490320488', '');
INSERT INTO `wy_news` VALUES ('15', '10', '0', '企业家如何做好刑事风险防范？', '', '', '', '刑事风险和其他风险一样，贯穿于企业经营的全过程，因此企业家首先应该优先具有防范刑事风险的底线意识，这种意识的强弱决定着企业家和企业   ', '0', 'http://www.fl880.com/2017/risk_0324/15.html', '0', '99', '1', '0', 'admin', '1490320542', '1490320564', '');
INSERT INTO `wy_news` VALUES ('22', '4', '0', '企业法律顾问的种类和服务内容有哪些', '', '', '', '一家企业，通常会设置这么一个岗位，法律顾问。法律顾问，是指依照国家关于企业法律顾问制度的规范概念，企业法律顾问(企业律师)，是指经全   ', '0', 'http://www.fl880.com/2017/case_0324/22.html', '0', '99', '1', '0', 'admin', '1490324205', '1490324229', '');
INSERT INTO `wy_news` VALUES ('23', '4', '0', '金融犯罪暗藏着刑事风险', '', '', '', '摘要：什么是金融犯罪?金融犯罪是指在金融活动中，侵害金融管理制度、金融市场秩序以及其他社会经济关系，依照我国刑法的规定，应当受到刑   ', '0', 'http://www.fl880.com/2017/case_0324/23.html', '0', '99', '1', '0', 'admin', '1490324231', '1490324364', '');
INSERT INTO `wy_news` VALUES ('24', '4', '0', '有哪些行政复议决定终局裁决不能提起行政诉讼', '', '', '', '行政复议法规定，对法律规定为最终裁决的复议决定，申请人则不能再向人民法院提出行政诉讼。那么，哪些行政复议决定终局裁决不能提起行政诉   ', '0', 'http://www.fl880.com/2017/case_0324/24.html', '0', '99', '1', '0', 'admin', '1490324365', '1490324610', '');
INSERT INTO `wy_news` VALUES ('25', '4', '0', '行政诉讼法的基本原则', '', '', '', '摘要:行政诉讼法规定了哪些基本原则?行政诉讼法规定了八项基本原则，分别为人民法院依法独立审判原则、以事实为根据，以法律为准绳、对具体   ', '0', 'http://www.fl880.com/2017/case_0324/25.html', '0', '99', '1', '0', 'admin', '1490324612', '1490325148', '');
INSERT INTO `wy_news` VALUES ('26', '12', '0', '为什么企业一定要聘请法律顾问', '', '', '', '具有法律专业知识，接受公民、法人或其他组织的聘请为其提供法律服务的人员，以及法人或其他组织内部设置的法律事务机构中的人员，均为法律   ', '0', 'http://www.fl880.com/2017/message_0324/26.html', '0', '99', '1', '0', 'admin', '1490325953', '1490325975', '');
INSERT INTO `wy_news` VALUES ('27', '5', '0', '企业法律顾问：可撤销合同几大情形', '', '', '', '我国《合同法》第54条规定：下列合同，当事人一方有权请求人民法院或者仲裁机构变更或者撤销：(1)因重大误解订立的;(2)在订立合同时显失公   ', '0', 'http://www.fl880.com/2017/corpus_0324/27.html', '0', '99', '1', '0', 'admin', '1490326008', '1490326023', '');
INSERT INTO `wy_news` VALUES ('28', '5', '0', '设立公司为什么要请法律顾问？', '', '', '', '《律师法》第26条规定：律师担任法律顾问的，应当为聘请人就有关法律问题提供意见，草拟、审查法律文书，代理参加诉讼，调解或者仲裁活动，   ', '0', 'http://www.fl880.com/2017/corpus_0324/28.html', '0', '99', '1', '0', 'admin', '1490326025', '1490326455', '');
INSERT INTO `wy_news` VALUES ('30', '12', '0', '民商事案件申请再审的注意事项', '', '', '', '再审是为纠正已经发生法律效力的错误判决、裁定，依照审判监督程序，对案件重新进行的审理。 民商事案件申请再审注意事项如下：1、当事人   ', '0', 'http://www.fl880.com/2017/message_0324/30.html', '0', '99', '1', '0', 'admin', '1490326596', '1490326627', '');
INSERT INTO `wy_news` VALUES ('31', '12', '0', '如何办理涉外民商事诉讼中的文件公证认证', '', '', '', '我国《民事诉讼法》第264条规定，境外当事人给诉讼代理人的授权委托书要办理公证认证，我国《最高人民法院关于民事诉讼证据的若干规定》第1   ', '0', 'http://www.fl880.com/2017/message_0324/31.html', '0', '99', '1', '0', 'admin', '1490326677', '1490326698', '');
INSERT INTO `wy_news` VALUES ('32', '12', '0', '国内民商事仲裁协议效力司法确认', '', '', '', '【内容提要】国内民商事仲裁协议效力确认案件，属人民法院主管的案件。但法律对此的规定之间存在冲突，且规定内容不全面，或者没有规定。本   ', '0', 'http://www.fl880.com/2017/message_0324/32.html', '0', '99', '1', '0', 'admin', '1490327191', '1490327209', '');
INSERT INTO `wy_news` VALUES ('33', '12', '0', '最高法院调整高院中院一审民商事案件标准', '', '', '', '最高人民法院发出通知调整高院中院一审民商事案件标准为准确适用修改后的民事诉讼法关于级别管辖的相关规定，合理定位四级法院民商事审判职   ', '0', 'http://www.fl880.com/2017/message_0324/33.html', '0', '99', '1', '0', 'admin', '1490327236', '1490327251', '');

-- ----------------------------
-- Table structure for wy_news_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_news_data`;
CREATE TABLE `wy_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_news_data
-- ----------------------------
INSERT INTO `wy_news_data` VALUES ('12', '<p>企业选择了一名优秀的律师作为其法律顾问以后，并不意味着这名律师马上就能绽放出自己的潜在价值。企业与法律顾问之间有一个磨合的过程，互相适应的过程，互相了解的过程。如何才能在最短时间内体现出法律顾问的价值存在呢?</p>\r\n<p>首先，应当实现企业文化与法律顾问的对接，法律顾问只有及时地融入企业文化一一&ldquo;只缘身在此山中&rdquo;，其每一个法律观点才能接上地气，融景与法，融法于景。其次，企业老总应当及时与法律顾问之间展开一次面对面的深层次的促膝长谈，企业老总要把企业的一个全貌介绍给法律顾问，把企业存在的一些问题坦诚地拿出来，放到桌面上，然后让法律顾问逐个剖析;同时让法律顾问就企业的现状拿出一个初步的法律&ldquo;理疗&rdquo;方案及具体的实施步骤。</p>\r\n<p>一﹑中小企业目前聘请法律顾问的现状</p>\r\n<p>目前中小企业聘请法律顾问，还是以律师的主动营销为主，虽然不乏一些企业慕名而来，但在企业老总潜意识里，像聘请企业会计一样，认为聘用法律顾问不可或缺的想法的人少之又少。</p>\r\n<p>目前很多资质尚浅的律师，法律业务方面已经逐步专业，但过多的精力放在了研究法律之上，而忽视了研究人的学问，对人与人之间的交往不是很习惯，以致于虽然第一年成为了企业法律顾问，但因为无法窥知企业老总的内心想法，无法和企业内部其他管理人员无缝沟通，或者因为某些老总的接触面较广，对司法实践的某些认知度所达到的高度已经在年轻律师之上，往往会让律师感到吃力，顾问做了一年，有种被&ldquo;反顾问&rdquo;的感觉，到了第二年很难再续上法律顾问合同。</p>\r\n<p>一些执业年限相对较长的律师，在成为企业法律顾问之后，开始几个月会经常去顾问单位走走看看，也会主动问问企业老总有么有什么事情要自己做的。但企业确实也没有什么事情，慢慢的律师也就少去&ldquo;顾问&rdquo;了，到了一年快满的时候，想想自己也难为情，于是再去几次，目的是想续上第二年的法律顾问合同。但他们没有想过此时的老总在想什么?企业老总在一年终了的时候，也会做个价值判断，今年这个法律顾问聘请的值不值?明年有么有必要继续聘用?特别是目前的经济大背景下，企业生意如此难做，能省的费用企业都会想着省下来，可想而知，第二年的续约，真的很难。</p>\r\n<p>当然知名度已经很高的一些&ldquo;大牌&rdquo;律师，他们抢占法律顾问市场的份额，相对容易很多。不但体现在数量上，而且体现在质量上。但&ldquo;大牌&rdquo;律师也有他们的苦恼，时间不够用，分身乏术。不少中小企业都会感叹，虽然聘请着一些有名望的大律师作为法律顾问，但他们实在太忙，根本见不到人;一般公司里出现一些诉讼案件，也都是叫他们的助手过来应付一下，代理的效果也不是很理想。</p>\r\n<p>总的来说，目前虽然很多中小企业都聘用着法律顾问，但能把法律顾问的价值发挥的淋漓尽致的确实不多;很多企业都把法律顾问当作了一种摆设，有的企业还错误地认为顾问费的支出，是企业的一种负担。很多企业即使支付了顾问费，对于顾问还是束之高阁，&ldquo;顾&rdquo;而不&ldquo;问&rdquo;。</p>\r\n<p>二﹑什么是法律顾问的价值存在</p>\r\n<p>要弄明白什么是企业法律顾问的价值存在，首先需要了解价值的含义，价值是指一事物所具有的能够满足主体需要的属性和功能，在意识层面表现为价值和存在。任何一种事物的价值，都包含着两个相互联系的方面，其一是，该事物的存在对人的作用或意义;其二是，人们对于这种价值的认识和评价。从上述概念可以辨析出，企业法律顾问的价值存在应该包含了两方面的涵义：一是企业法律顾问的作用;二是企业对法律顾问的评介。</p>\r\n<p>法律顾问的产品是一定期间内连续不间断地提供给企业的法律服务，服务的核心价值要靠律师来实现，服务不仅是形式和内容、技巧和技术，法律顾问服务含金量的根本在于态度。有了专注的态度，才有可能树立品牌形象，树立美誉度，才有可能生产出一流的法律产品。法律顾问的价值存在往往都是通过法律产品来实现和升华。</p>\r\n<p>三﹑中小企业需要怎样的法律顾问?</p>\r\n<p>目前的经济背景下，法律关系错综复杂，单兵作战已经不合时宜，一个律师担任一个企业的法律顾问，他所能提供给企业的法律支撑往往不如一个律师团队提供给一个企业的法律支撑来的更为全面、更为完善、更具力度。所以，企业在选择法律顾问的时候，首先应当考虑这个律师背后的律所，是否具有一定的品牌度以及专业方向、团队的凝聚力与执行力等因素;其次才是考虑律师本身的品牌形象、专业能力、沟通协调能力、危机处置能力等因素;最后才是价格问题。</p>\r\n<p>案例一：一小贷公司急欲招聘一法律顾问，通过非公开方式放出了消息，应聘人员络绎不绝，最后有两名律师进入最后决逐。一个律师的简介非常豪华：某省律协某某专业委员会委员、某市律协某某专业委员会副主任等等;另一名律师的简介相对平淡，它是这样营销自己：擅长于团队构建，诉讼或是非诉业务一直以团队名义接洽，所有团队成员实力较均匀，专业方向各有术攻又具有互补性，另具有较强的默契性与团队作战能力，业务开展着眼于精细化流水线操作。考核那天，公司老总问了两名律师同一个问题：&ldquo;一个诉讼案件进入执行阶段以后，发觉这个被执行人的名下只有一处没有权属登记的厂房且已出租，房产又无法拍卖，此情形下如何处理该案。&rdquo;那名资质老道的律师，沉稳的回答：&ldquo;既然没有财产可以执行，贵公司可以申请执行终结并予以当年核销，该部分损失可以冲抵贵公司的当年利润。&rdquo;而另一名律师是这样回答的：&ldquo;虽然被执行人的厂房没有权属登记，但其具有合法的用益物权，尽管涉案房产已经出租，但我们应该调查清楚出租人与承租人之间租赁合同的实际履行情况，包括租赁年限、租金交付方式等事实，之后请求执行法院对未交付的租金要求承租人予以协助执行&rdquo;。最后，小贷公司选择了那位简介相对平淡的律师，理由是：小贷公司的很多案子，胜诉均不成问题，但执行以后都成了老大难问题，如果都像第一位律师那样操作，那公司马上关门;只有具有第二位律师那样不屈不饶的精神状态，公司的执行案件才有希望。</p>\r\n<p>案例二：一市场公司股权转让事宜急聘专项事务法律顾问，公司的几位股东均推荐律师人选，考核过程中三位律师均向公司提交了律所及律师简介、法律意见书，有两位律师提交的法律意见书只有三、四页纸，而还有一位律师提交的法律意见书有厚厚的一叠，至少有三百余页。现场陈述过程中，前面两位律师拿着预先准备的法律意见书，大概讲了30分钟;而最后那位律师，展现在所有公司股东、高管面前的是一段精心准备的PPT演示，从市场公司的成立开始，讲到了公司的每一年变更情况，每一年公司经营方向、经营业绩，最后讲到了目前的公司现状，股权结构现状，以及拟出让股权的股东情况、受让股权的人员情况，股权转让过程中应该注意的法律事项、税务筹划事项等等，足足讲了2个半小时。当该律师陈述结束的时候，现场响起了肃然起敬的掌声。最后，毫无悬念的该律师拿到了市场公司颁发的法律顾问聘书。</p>\r\n<p>通过上述案例，可以告诉企业如何睁开&ldquo;火眼金睛&rdquo;，明智地选择法律顾问，一个注重形象、注重细节、注重品质，专业能力强，沟通能力强，执行力强，且具有团队背景的律师，才是企业需要的近乎完美的法律顾问。</p>\r\n<p>四﹑如何体现出法律顾问的价值存在</p>\r\n<p>企业选择了一名优秀的律师作为其法律顾问以后，并不意味着这名律师马上就能绽放出自己的潜在价值。企业与法律顾问之间有一个磨合的过程，互相适应的过程，互相了解的过程。如何才能在最短时间内体现出法律顾问的价值存在呢?</p>\r\n<p>首先，应当实现企业文化与法律顾问的对接，法律顾问只有及时地融入企业文化一一&ldquo;只缘身在此山中&rdquo;，其每一个法律观点才能接上地气，融景与法，融法于景。</p>\r\n<p>其次，企业老总应当及时与法律顾问之间展开一次面对面的深层次的促膝长谈，企业老总要把企业的一个全貌介绍给法律顾问，包括企业的经营方式、业务范围、核算形式、企业简史等;同时，把企业存在的一些问题坦诚地拿出来，放到桌面上，然后让法律顾问逐个剖析;让法律顾问就企业的现状拿出一个初步的法律&ldquo;理疗&rdquo;方案及具体的实施步骤。</p>\r\n<p>在调查研究的基础上，及时处理相关问题，譬如：对于企业正在违约的合同，要在对方接受的前提下，明确责任，签订弥补协议，以消除违约后果，尽可能减少财产损失;对于将要超过诉讼时效的债权，要尽快起诉;对于不能起诉的，要用书面形式催告使其诉讼时效中断。</p>\r\n<p>再次，作为法律顾问的律师代表必须大气，在企业遇到的若干个法律问题中，遇到自己短板的法律问题，应当立即把相关问题放到律所团队中去消化，并由擅长这方面业务的团队律师介入到法律顾问服务中来，以一个团队形象扎根于企业的法律管理文化。</p>\r\n<p>优秀的法律顾问好像是一匹千里马，遇到了优秀的企业主，像是遇见了伯乐。价值存在往往在相惺相惜中，如涓涓溪水绵绵流长。</p>\r\n<p>五﹑法律顾问的价值火花亮点一二</p>\r\n<p>亮点一：一个中小型纺织品生产企业，原先没有法律顾问，公司员工聘用均没有签订劳动合同，与原料市场建立购销关系，也没有签订买卖合同，织成成品以后与布匹贸易商也没有签订书面合同，货款的结算都是催催付付，付付停停，现金流较为短缺。</p>\r\n<p>聘请法律顾问以后，该公司面貌焕然一新，首先是员工入职全部签订书面劳动合同，公司规章制度公示并作为劳动合同附件，员工离职建立法律风险防范，从源头上控制了企业的用工风险;其次，不论是原料采购还是成品买卖均订立书面合同，不论是送货还是自行提货均须明示授权，从经营管理上控制了应收账款的坏帐损失的产生;再次，货款的结算上，与贸易商达成货款月结制度，上月供货次月结账，应收账款逐月减少，现金流逐月增加。</p>\r\n<p>亮点二：一基础公司，原先没有法律顾问，公司管理比较混乱，承接业务有时以公司出面有时以法定代表人个人出面，到后来连老总自己也不清楚究竟是个人出面还是公司出面;设计变更以后，工程量随之发生了变更，但公司没有及时拿到联系单签证;应收工程款比比皆是，但证据不足，想起诉都难。</p>\r\n<p>聘请法律顾问之后，该公司有了起色，首先做好了员工的管理与规章制度的建立，从制度上约束公司的每一名员工，做到人尽其职;其次，该补签的工程合同坚决补签，无法补签的及时取得实际施工人的相关证据;联系监理联系设计院取得工程量签证;再次，对于工程欠款，该协调的协调，该发函的发函，该起诉的起诉;公司逐步运转正常。</p>\r\n<p>六﹑中小企业聘请法律顾问的终极目标</p>\r\n<p>律师法第26条规定：&ldquo;律师担任法律顾问的，应当为聘请人就有关法律问题提供意见，草拟、审查法律文书，代理参加诉讼，调解或者仲裁活动，办理聘请人委托的其他法律事物，维护聘请方的合法权益&rdquo;。</p>\r\n<p>法律规定了法律顾问的服务范围，律师提供法律服务的过程，既是法律顾问绽放自身价值的过程，也是企业表露初衷的过程，更是企业将聘请法律顾问的初衷升华为终极目标的过程。</p>\r\n<p>中小企业聘请法律顾问的初衷，可以概括为十二个字，&ldquo;控制交易风险，经营出谋划策&rdquo;;升华为终极目标的时候，浓缩为四个字，即&ldquo;预防，挽救&rdquo;。</p>\r\n<p>&ldquo;预防&rdquo;?预防什么?如何预防?目前很多律所都在推广企业法律体检业务，认为一个企业犹如一个人，人需要体检，企业也需要体检，经过体检之后，可以窥出企业的&ldquo;病症&rdquo;所在，然后&ldquo;对症下药&rdquo;，做到有&ldquo;病&rdquo;治&ldquo;病&rdquo;，无&ldquo;病&rdquo;预防。</p>\r\n<p>&ldquo;挽救&rdquo;?挽救什么?如何挽救?企业遇到困境以后，法律顾问应当及时介入，千方百计为企业出谋划策，寻求破局良策，挽狂澜之既倒。&ldquo;挽救&rdquo;，既表现在法律顾问的职责所在，更表现在于法律顾问的价值所在。</p>\r\n<p>譬如：甲印染企业因政府号召，须与乙印染企业并入丙印染企业，然后甲、乙企业须注销，新厂房由甲乙丙三家企业共同出资建造。三家独立自主盈亏的企业并成一家企业，难度可想而知，何况三家企业的排污指标各不相同，厂房建造面积各不相同，最头痛的是贷款数额各不相同且相差悬殊。</p>\r\n<p>甲企业的初衷是希望自己投资建造的部分厂房有一个权属证明。之后，甲企业的初衷有了升华，希望甲企业的负责人丁能成为新公司的一名股东，享有股东权利，参与公司经营管理，并希望能控制经营风险。</p>\r\n<p>如何才能实现甲企业的终极目标呢?如果笔者系甲企业的法律顾问，首先建议甲乙丙三企业先进行审计，&ldquo;摸&rdquo;一下&ldquo;家底&rdquo;，&ldquo;摸&rdquo;清楚各自的家底之后，进入股权收购阶段，由丁与乙企业负责人收购丙企业的部分股权，股权比例以各自出资比例确定且丙企业原股东剩余股权比例不得超过股本总额的65%;并修改公司章程及制定公司各项规章制度。其次，最头疼的是丙企业对银行负有贷款债务，数额近亿元，而甲企业却只有近千万贷款。如何保障企业转贷过程中，丁能及时无障碍的在股东会决议中签字，是丙企业原股东最为担心的事情。建议丁以及丙企业原股东，与丙企业的贷款银行及时沟通，允许股东丁做一个委托公证，委托丙企业的高管在转贷必须的股东会决议上代表丁签字。这样，最头痛的问题也迎刃而解了。</p>\r\n<p>甲企业聘请法律顾问的终极目标，首先是希望能控制丁的风险，其次是希望能对丙企业的运转能有话语权，最后是希望自己投资建造部分的不动产，通过丁继续享有收益、处分的权利。这一步一步的目标，看似简单，但不知道要通过法律顾问多少个白天黑夜的谈判以及尽心尽职地深入调研，才能最终实现。</p>\r\n<p>律师应当怎样迎合企业的需求，绽放自己的价值，让企业感到物有所值，物超所值，这才是中小企业聘请法律顾问的终极目标。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('13', '<p>关于涉外民商事案件诉讼管辖若干问题的规定</p>\r\n<p>法释〔2002〕5号</p>\r\n<p>(2001年12月25日最高人民法院审判委员会第1203次会议通过)</p>\r\n<p>中华人民共和国最高人民法院公告</p>\r\n<p>《最高人民法院关于涉外民商事案件诉讼管辖若干问题的规定》已于2001年12月25日由最高人民法院审判委员会第1203次会议通过。现予公布，自2002年3月1日起施行。</p>\r\n<p>二○○二年二月二十五日</p>\r\n<p>为正确审理涉外民商事案件，依法保护中外当事人的合法权益，根据《中华人民共和国民事诉讼法》第十九条的规定，现将有关涉外民商事案件诉讼管辖的问题规定如下：</p>\r\n<p>第一条 第一审涉外民商事案件由下列人民法院管辖：</p>\r\n<p>(一)国务院批准设立的经济技术开发区人民法院;</p>\r\n<p>(二)省会、自治区首府、直辖市所在地的中级人民法院;</p>\r\n<p>(三)经济特区、计划单列市中级人民法院;</p>\r\n<p>(四)最高人民法院指定的其他中级人民法院;</p>\r\n<p>(五)高级人民法院。</p>\r\n<p>上述中级人民法院的区域管辖范围由所在地的高级人民法院确定。</p>\r\n<p>第二条 对国务院批准设立的经济技术开发区人民法院所作的第一审判决、裁定不服的，其第二审由所在地中级人民法院管辖。</p>\r\n<p>第三条 本规定适用于下列案件：</p>\r\n<p>(一)涉外合同和侵权纠纷案件;</p>\r\n<p>(二)信用证纠纷案件;</p>\r\n<p>(三)申请撤销、承认与强制执行国际仲裁裁决的案件;</p>\r\n<p>(四)审查有关涉外民商事仲裁条款效力的案件;</p>\r\n<p>(五)申请承认和强制执行外国法院民商事判决、裁定的案件。</p>\r\n<p>第四条 发生在与外国接壤的边境省份的边境贸易纠纷案件，涉外房地产案件和涉外知识产权案件，不适用本规定。</p>\r\n<p>第五条 涉及香港、澳门特别行政区和台湾地区当事人的民商事纠纷案件的管辖，参照本规定处理。</p>\r\n<p>第六条 高级人民法院应当对涉外民商事案件的管辖实施监督，凡越权受理涉外民商事案件的，应当通知或者裁定将案件移送有管辖权的人民法院审理。</p>\r\n<p>第七条 本规定于2002年3月1日起施行。本规定施行前已经受理的案件由原受理人民法院继续审理。</p>\r\n<p>本规定发布前的有关司法解释、规定与本规定不一致的，以本规定为准。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('14', '<p>关于侵权纠纷案件的审理</p>\r\n<p>审理好侵权损害赔偿案件对于保护民事主体的合法权益，明确侵权责任，预防并制裁侵权行为，促进社会公平正义具有重要意义。要总结和运用以往审理侵权案件所积累下来的成功经验，进一步探索新形势下侵权案件的审理规律，更加强调裁判标准和裁判尺度的统一。当前，要注意以下几方面问题：</p>\r\n<p>(一)关于侵权责任法实施中的相关问题</p>\r\n<p>6.鉴于侵权责任法第十八条明确规定被侵权人死亡，其近亲属有权请求侵权人承担侵权责任，并没有赋予有关机关或者单位提起请求的权利，当侵权行为造成身份不明人死亡时，如果没有赔偿权利人或者赔偿权利人不明，有关机关或者单位无权提起民事诉讼主张死亡赔偿金，但其为死者垫付的医疗费、丧葬费等实际发生的费用除外。</p>\r\n<p>7.依据侵权责任法第二十一条的规定，被侵权人请求义务人承担停止侵害、排除妨害、消除危险等责任，义务人以自己无过错为由提出抗辩的，不予支持。</p>\r\n<p>8.残疾赔偿金或死亡赔偿金的计算标准，应根据案件的实际情况，结合受害人住所地、经常居住地、主要收入来源等因素确定。在计算被扶养人生活费时，如果受害人是农村居民但按照城镇标准计算残疾赔偿金或者死亡赔偿金的，其被扶养人生活费也应按照受诉法院所在地上一年度城镇居民人均消费性支出标准计算。被扶养人生活费一并计入残疾赔偿金或者死亡赔偿金。</p>\r\n<p>(二)关于社会保险与侵权责任的关系问题</p>\r\n<p>9.被侵权人有权获得工伤保险待遇或者其他社会保险待遇的，侵权人的侵权责任不因受害人获得社会保险而减轻或者免除。根据社会保险法第三十条和四十二条的规定，被侵权人有权请求工伤保险基金或者其他社会保险支付工伤保险待遇或者其他保险待遇。</p>\r\n<p>10.用人单位未依法缴纳工伤保险费，劳动者因第三人侵权造成人身损害并构成工伤，侵权人已经赔偿的，劳动者有权请求用人单位支付除医疗费之外的工伤保险待遇。用人单位先行支付工伤保险待遇的，可以就医疗费用在第三人应承担的赔偿责任范围内向其追偿。</p>\r\n<p>(三)关于医疗损害赔偿责任问题</p>\r\n<p>11.患者一方请求医疗机构承担侵权责任，应证明与医疗机构之间存在医疗关系及受损害的事实。对于是否存在医疗关系，应综合挂号单、交费单、病历、出院证明以及其他能够证明存在医疗行为的证据加以认定。</p>\r\n<p>12.对当事人所举证据材料，应根据法律、法规及司法解释的相关规定进行综合审查。因当事人采取伪造、篡改、涂改等方式改变病历资料内容，或者遗失、销毁、抢夺病历，致使医疗行为与损害后果之间的因果关系或医疗机构及其医务人员的过错无法认定的，改变或者遗失、销毁、抢夺病历资料一方当事人应承担相应的不利后果;制作方对病历资料内容存在的明显矛盾或错误不能作出合理解释的，应承担相应的不利后果;病历仅存在错别字、未按病历规范格式书写等形式瑕疵的，不影响对病历资料真实性的认定。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('15', '<p>刑事风险和其他风险一样，贯穿于企业经营的全过程，因此企业家首先应该优先具有防范刑事风险的底线意识，这种意识的强弱决定着企业家和企业究竟能够走多远。</p>\r\n<p>在2012年中国企业家犯罪报告中，收集的300多起案例，涉及77个罪名。国企老总涉及到罪名最多的是受贿、贪污，但是民企老总除了主体资格有特殊限制之外，几乎都有涉及，所以民企老总风险点太多，职务侵占罪、集资诈骗、非法吸收公众存款、偷逃出资、信用卡诈骗、合同诈骗、贷款诈骗等等。</p>\r\n<p>那么，企业家如何做好刑事风险防范?</p>\r\n<p>1、增加事前预防刑事法律风险的投入</p>\r\n<p>现今，我国企业家法律意识有所增强，大多都能在事后通过法律途径来维护自己的合法权益，但是，多数却又还停留在民事风险防范或者事后救济阶段。而一旦&ldquo;出事&rdquo;，特别是一旦涉入刑事案件，事后救济的力量相对而言是微弱的。因此，事前预防刑事法律风险显得尤为重要。</p>\r\n<p>2、企业家可聘请专业律师作为法律顾问</p>\r\n<p>企业家可以聘请专业律师为自己的行为是否触法把关。随着律师行业的发展和逐渐健全，能够符合企业家要求的律师会越来越多。而企业家在做重大决策，特别是对是否触碰法律底线心里非常不确定时，都可以听取、参考律师的意见。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('16', '<p>行政复议决定书作为复议机关对复议案件进行权威性判定的法律文书，应当具备一定的格式和内容。因此在撰写行政复议决定书时应当包括以下几方面内容：标题，编号，复议参加人的基本情况，复议原因，复议的事实、理由和法律适用，复议机关查明事实，复议决定及告知诉权，落款时间和盖章。这样比较符合逻辑规定，也符合法律文书的一般格式要求。</p>\r\n<p>首先，复议参加人的基本情况必须清楚、具体。参加行政复议的当事人主要是指申请人和被申请人，他们是行政争议的双方，复议机关为了解决行政争议而作的复议决定，应当就争议双方当事人的称谓及其基本情况表述清楚。包括姓名、性别、年龄、住所地，法人或其组织的要写上具体名称，住所地、法定代表人或主要负责人。有委托代理人或第三人的也要表述清楚。</p>\r\n<p>其次，复议原因部分。要简单说明一下申请人申请行政复议的原因和时间，以及复议机关收到行政复议申请书的时间。比如，申请人某某不服被申请人某单位某具体行政行为，于某年某月某日提起行政复议申请，复议机关在某年某月某日收到行政复议申请书。复议机关收到行政复议申请书的时间必须载明，有的申请人将行政复议申请书早已写好，但没有及时送到复议机关，若不载明收到复议申请书的时间，人们认为是已超过5日的法定受理时间。根据《行政复议法》第17条之规定。&ldquo;行政复议机关收到行政复议申请后，应当在五日内进行审查，对不符合本法规定的行政复议申请，决定不予受理，并书面告知申请人;&hellip;&hellip;&rdquo;因此，有必要对收到行政复议申请书的时间加以载明。</p>\r\n<p>第三、复议的事实、理由和法律适用部分。这部分视为申请人和被申请人说理的地方，我们应允许，在复议决定书中应予以体现。通常以&ldquo;申请人称和被申请人称&rdquo;两部分组成，也就是说，先由申请人提出问题，被申请人提出解决问题的方法和依据，再由复议机关作出对错评判的一般程序。同时，因申请人对法律的熟悉程度和写作水平的不同，对行政复议申请书的写法也不一样，在实际中我们也有碰到，有的将行政复议申请书写得洋洋洒洒，抓不住重点，这时候，我们必须要全面分析、掌握其反映的实质问题，抓住重点，然后加以必要的概括、归纳，但又要尽量接近申请人所反映的问题，保持内容的真实性。当然，也不能断章取义，或完全抄摘申请书的内容，这样，行政复议决定书就显庸俗、不精炼，因此撰写行政复议决定书我们应掌握简明、准确的原则，篇幅不宜过长，只要把问题讲清楚就可以了。</p>\r\n<p>第四、本机关查明部分。这部分是复议机关作出决定的事实根据和法律依据，它是复议机关如何解决复议参加人之间的行政争议的基础，但要简明扼要，突出针对性。主要查明与案件有直接关系的事实，如果已有足够的事实能够说明行政机关的具体行政行为合法或不合法的，其他联系不紧密的事实或申请人提供不相关的证据材料就不必去审查，在复议决定书中更不必去阐述，否则，查明事实部分就过于复杂，更不必查明事实部分作出论述或发表意见。</p>\r\n<p>第五、本机关认为部分。这部分是复议决定书主文，必须做到简明、准确、合法，但不宜作过多的论证。同时，不得附加任何条件和给予任何选择余地，以避免引起不必要的争论和执行上的困难。比如在一起殴打他人造成轻微伤害的治安复议案件中，只要指出申请人的行为违反了法律规定，被申请人作出治安挽留的决定，从事实，证据，处罚内容和适用法律依据等方面综合来论证说明其正确性就可以了。</p>\r\n<p>附：行政复议决定书的书写格式</p>\r\n<p>一、首部</p>\r\n<p>大体包括标题申请人和被申请人身份情况等四个方面事项：</p>\r\n<p>1、标题。即文书的名称。应写明&ldquo;&times;&times;&times;&times;(机关名称)行政复议决定书&rdquo;。</p>\r\n<p>2、案号。即公文中的发文字号&ldquo;&times;&times;年&times;&times;复字第&times;&times;号&rdquo;。</p>\r\n<p>3、申请人的身份情况。姓名、性别、年龄、职业、住址等情况。</p>\r\n<p>4、被申请人的情况。名称、地址、法宝代表人的姓名职务。</p>\r\n<p>二、正文</p>\r\n<p>1、申请复议的主要请求和理由</p>\r\n<p>2、复议机关认定的事实和理由</p>\r\n<p>3、复议结论</p>\r\n<p>三、结尾部分有两项内容</p>\r\n<p>1、要写明如不服复议决定可以向人民法院起诉，及其期限。如果是最终的复议决定，要写明当事人履行的期限。</p>\r\n<p>2、落款。由复议机关的法定代表人签名，加盖复议机关的印章，并写出复议决定的年、月、日。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('17', '<p>根据《中华人民共和国国家赔偿法》及有关法律规定，结合人民法院国家赔偿工作实际，现就人民法院赔偿委员会审理民事、行政诉讼中司法赔偿案件的若干法律适用问题解释如下：</p>\r\n<p>第一条人民法院在民事、行政诉讼过程中，违法采取对妨害诉讼的强制措施、保全措施、先予执行措施，或者对判决、裁定及其他生效法律文书执行错误，侵犯公民、法人和其他组织合法权益并造成损害的，赔偿请求人可以依法向人民法院申请赔偿。</p>\r\n<p>第二条违法采取对妨害诉讼的强制措施，包括以下情形：</p>\r\n<p>(一)对没有实施妨害诉讼行为的人采取罚款或者拘留措施的;</p>\r\n<p>(二)超过法律规定金额采取罚款措施的;</p>\r\n<p>(三)超过法律规定期限采取拘留措施的;</p>\r\n<p>(四)对同一妨害诉讼的行为重复采取罚款、拘留措施的;</p>\r\n<p>(五)其他违法情形。</p>\r\n<p>第三条违法采取保全措施，包括以下情形：</p>\r\n<p>(一)依法不应当采取保全措施而采取的;</p>\r\n<p>(二)依法不应当解除保全措施而解除，或者依法应当解除保全措施而不解除的;</p>\r\n<p>(三)明显超出诉讼请求的范围采取保全措施的，但保全财产为不可分割物且被保全人无其他财产或者其他财产不足以担保债权实现的除外;</p>\r\n<p>(四)在给付特定物之诉中，对与案件无关的财物采取保全措施的;</p>\r\n<p>(五)违法保全案外人财产的;</p>\r\n<p>(六)对查封、扣押、冻结的财产不履行监管职责，造成被保全财产毁损、灭失的;</p>\r\n<p>(七)对季节性商品或者鲜活、易腐烂变质以及其他不宜长期保存的物品采取保全措施，未及时处理或者违法处理，造成物品毁损或者严重贬值的;</p>\r\n<p>(八)对不动产或者船舶、航空器和机动车等特定动产采取保全措施，未依法通知有关登记机构不予办理该保全财产的变更登记，造成该保全财产所有权被转移的;</p>\r\n<p>(九)违法采取行为保全措施的;</p>\r\n<p>(十)其他违法情形。</p>\r\n<p>第四条违法采取先予执行措施，包括以下情形：</p>\r\n<p>(一)违反法律规定的条件和范围先予执行的;</p>\r\n<p>(二)超出诉讼请求的范围先予执行的;</p>\r\n<p>(三)其他违法情形。</p>\r\n<p>第五条对判决、裁定及其他生效法律文书执行错误，包括以下情形：</p>\r\n<p>(一)执行未生效法律文书的;</p>\r\n<p>(二)超出生效法律文书确定的数额和范围执行的;</p>\r\n<p>(三)对已经发现的被执行人的财产，故意拖延执行或者不执行，导致被执行财产流失的;</p>\r\n<p>(四)应当恢复执行而不恢复，导致被执行财产流失的;</p>\r\n<p>(五)违法执行案外人财产的;</p>\r\n<p>(六)违法将案件执行款物执行给其他当事人或者案外人的;</p>\r\n<p>(七)违法对抵押物、质物或者留置物采取执行措施，致使抵押权人、质权人或者留置权人的优先受偿权无法实现的;</p>\r\n<p>(八)对执行中查封、扣押、冻结的财产不履行监管职责，造成财产毁损、灭失的;</p>\r\n<p>(九)对季节性商品或者鲜活、易腐烂变质以及其他不宜长期保存的物品采取执行措施，未及时处理或者违法处理，造成物品毁损或者严重贬值的;</p>\r\n<p>(十)对执行财产应当拍卖而未依法拍卖的，或者应当由资产评估机构评估而未依法评估，违法变卖或者以物抵债的;</p>\r\n<p>(十一)其他错误情形。</p>\r\n<p>第六条人民法院工作人员在民事、行政诉讼过程中，有殴打、虐待或者唆使、放纵他人殴打、虐待等行为，以及违法使用武器、警械，造成公民身体伤害或者死亡的，适用国家赔偿法第十七条第四项、第五项的规定予以赔偿。</p>\r\n<p>第七条具有下列情形之一的，国家不承担赔偿责任：</p>\r\n<p>(一)属于民事诉讼法第一百零五条、第一百零七条第二款和第二百三十三条规定情形的;</p>\r\n<p>(二)申请执行人提供执行标的物错误的，但人民法院明知该标的物错误仍予以执行的除外;</p>\r\n<p>(三)人民法院依法指定的保管人对查封、扣押、冻结的财产违法动用、隐匿、毁损、转移或者变卖的;</p>\r\n<p>(四)人民法院工作人员与行使职权无关的个人行为;</p>\r\n<p>(五)因不可抗力、正当防卫和紧急避险造成损害后果的;</p>\r\n<p>(六)依法不应由国家承担赔偿责任的其他情形。</p>\r\n<p>第八条因多种原因造成公民、法人和其他组织合法权益损害的，应当根据人民法院及其工作人员行使职权的行为对损害结果的发生或者扩大所起的作用等因素，合理确定赔偿金额。</p>\r\n<p>第九条受害人对损害结果的发生或者扩大也有过错的，应当根据其过错对损害结果的发生或者扩大所起的作用等因素，依法减轻国家赔偿责任。</p>\r\n<p>第十条公民、法人和其他组织的损失，已经在民事、行政诉讼过程中获得赔偿、补偿的，对该部分损失，国家不承担赔偿责任。</p>\r\n<p>第十一条人民法院及其工作人员在民事、行政诉讼过程中，具有本解释第二条、第六条规定情形，侵犯公民人身权的，应当依照国家赔偿法第三十三条、第三十四条的规定计算赔偿金。致人精神损害的，应当依照国家赔偿法第三十五条的规定，在侵权行为影响的范围内，为受害人消除影响、恢复名誉、赔礼道歉;造成严重后果的，还应当支付相应的精神损害抚慰金。</p>\r\n<p>第十二条人民法院及其工作人员在民事、行政诉讼过程中，具有本解释第二条至第五条规定情形，侵犯公民、法人和其他组织的财产权并造成损害的，应当依照国家赔偿法第三十六条的规定承担赔偿责任。</p>\r\n<p>财产不能恢复原状或者灭失的，应当按照侵权行为发生时的市场价格计算损失;市场价格无法确定或者该价格不足以弥补受害人所受损失的，可以采用其他合理方式计算损失。</p>\r\n<p>第十三条人民法院及其工作人员对判决、裁定及其他生效法律文书执行错误，且对公民、法人或者其他组织的财产已经依照法定程序拍卖或者变卖的，应当给付拍卖或者变卖所得的价款。</p>\r\n<p>人民法院违法拍卖，或者变卖价款明显低于财产价值的，应当依照本解释第十二条的规定支付相应的赔偿金。</p>\r\n<p>第十四条国家赔偿法第三十六条第六项规定的停产停业期间必要的经常性费用开支，是指法人、其他组织和个体工商户为维系停产停业期间运营所需的基本开支，包括留守职工工资、必须缴纳的税费、水电费、房屋场地租金、设备租金、设备折旧费等必要的经常性费用。</p>\r\n<p>第十五条国家赔偿法第三十六条第七项规定的银行同期存款利息，以作出生效赔偿决定时中国人民银行公布的一年期人民币整存整取定期存款基准利率计算，不计算复利。</p>\r\n<p>应当返还的财产属于金融机构合法存款的，对存款合同存续期间的利息按照合同约定利率计算。</p>\r\n<p>应当返还的财产系现金的，比照本条第一款规定支付利息。</p>\r\n<p>第十六条依照国家赔偿法第三十六条规定返还的财产系国家批准的金融机构贷款的，除贷款本金外，还应当支付该贷款借贷状态下的贷款利息。</p>\r\n<p>第十七条用益物权人、担保物权人、承租人或者其他合法占有使用财产的人，依据国家赔偿法第三十八条规定申请赔偿的，人民法院应当依照《最高人民法院关于国家赔偿案件立案工作的规定》予以审查立案。</p>\r\n<p>第十八条人民法院在民事、行政诉讼过程中，违法采取对妨害诉讼的强制措施、保全措施、先予执行措施，或者对判决、裁定及其他生效法律文书执行错误，系因上一级人民法院复议改变原裁决所致的，由该上一级人民法院作为赔偿义务机关。</p>\r\n<p>第十九条公民、法人或者其他组织依据国家赔偿法第三十八条规定申请赔偿的，应当在民事、行政诉讼程序或者执行程序终结后提出，但下列情形除外：</p>\r\n<p>(一)人民法院已依法撤销对妨害诉讼的强制措施的;</p>\r\n<p>(二)人民法院采取对妨害诉讼的强制措施，造成公民身体伤害或者死亡的;</p>\r\n<p>(三)经诉讼程序依法确认不属于被保全人或者被执行人的财产，且无法在相关诉讼程序或者执行程序中予以补救的;</p>\r\n<p>(四)人民法院生效法律文书已确认相关行为违法，且无法在相关诉讼程序或者执行程序中予以补救的;</p>\r\n<p>(五)赔偿请求人有证据证明其请求与民事、行政诉讼程序或者执行程序无关的;</p>\r\n<p>(六)其他情形。</p>\r\n<p>赔偿请求人依据前款规定，在民事、行政诉讼程序或者执行程序终结后申请赔偿的，该诉讼程序或者执行程序期间不计入赔偿请求时效。</p>\r\n<p>第二十条人民法院赔偿委员会审理民事、行政诉讼中的司法赔偿案件，有下列情形之一的，相应期间不计入审理期限：</p>\r\n<p>(一)需要向赔偿义务机关、有关人民法院或者其他国家机关调取案卷或者其他材料的;</p>\r\n<p>(二)人民法院赔偿委员会委托鉴定、评估的。</p>\r\n<p>第二十一条人民法院赔偿委员会审理民事、行政诉讼中的司法赔偿案件，应当对人民法院及其工作人员行使职权的行为是否符合法律规定，赔偿请求人主张的损害事实是否存在，以及该职权行为与损害事实之间是否存在因果关系等事项一并予以审查。</p>\r\n<p>第二十二条本解释自2016年10月1日起施行。本解释施行前最高人民法院发布的司法解释与本解释不一致的，以本解释为准。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('18', '<p>摘要:行政诉讼法规定了哪些基本原则?行政诉讼法规定了八项基本原则，分别为人民法院依法独立审判原则、以事实为根据，以法律为准绳、对具体行政行为合法性审查原则、当事人法律地位平等原则、使用民族语文文字进行诉讼的原则、辩论原则等。下面小编为您详细介绍!</p>\r\n<p>1、人民法院依法独立审判原则</p>\r\n<p>《行政诉讼法》第3条第1款的规定：&ldquo;人民法院依法对行政案件独立行使审判权，不受行政机关、社会团体和个人的干涉。&rdquo;</p>\r\n<p>2、以事实为根据，以法律为准绳</p>\r\n<p>《行政诉讼法》第4条规定：&ldquo;人民法院审理行政案件，以事实为根据，以法律为准绳&rdquo;。</p>\r\n<p>3、对具体行政行为合法性审查原则</p>\r\n<p>《行政诉讼法》第5条规定：&ldquo;人民法院审理行政案件，对具体行政行为是否合法进行审查。&rdquo;</p>\r\n<p>4、当事人法律地位平等原则</p>\r\n<p>《行政诉讼法》第7条规定：&ldquo;当事人在行政诉讼中的法律地位平等&rdquo;。</p>\r\n<p>5、使用民族语文文字进行诉讼的原则</p>\r\n<p>《行政诉讼法》第8条规定：&ldquo;各民族公民都有用本民族语言、文字进行诉讼的权利。</p>\r\n<p>6、辩论原则</p>\r\n<p>《行政诉讼法》第9条规定：&ldquo;当事人在行政诉讼中有权进行辩论。&rdquo;</p>\r\n<p>7、合议、回避、公开审判和两审终审原则</p>\r\n<p>《行政诉讼法》第6条规定：&ldquo;人民法院审理行政案件，依法实行合议、回避、公开审判和两审终审制度。&rdquo;</p>\r\n<p>8、人民检察院实行法律监督原则</p>\r\n<p>《行政诉讼法》第10条规定：&ldquo;人民检察院有权对行政诉讼实行法律监督。&rdquo;</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('19', '<p>我国《行政诉讼法》在2014年11月1日决定修订，同时自2015年5月1日开始施行的新《行政诉讼法》，其中第十二条规定了人民法院受理行政诉讼案件的范围。</p>\r\n<p>2017行政诉讼受案范围具体有哪些</p>\r\n<p>人民法院受理公民、法人或者其他组织提起的下列诉讼：</p>\r\n<p>(一)对行政拘留、暂扣或者吊销许可证和执照、责令停产停业、没收违法所得、没收非法财物、罚款、警告等行政处罚不服的;</p>\r\n<p>(二)对限制人身自由或者对财产的查封、扣押、冻结等行政强制措施和行政强制执行不服的;</p>\r\n<p>(三)申请行政许可，行政机关拒绝或者在法定期限内不予答复，或者对行政机关作出的有关行政许可的其他决定不服的;</p>\r\n<p>(四)对行政机关作出的关于确认土地、矿藏、水流、森林、山岭、草原、荒地、滩涂、海域等自然资源的所有权或者使用权的决定不服的;</p>\r\n<p>(五)对征收、征用决定及其补偿决定不服的;</p>\r\n<p>(六)申请行政机关履行保护人身权、财产权等合法权益的法定职责，行政机关拒绝履行或者不予答复的;</p>\r\n<p>(七)认为行政机关侵犯其经营自主权或者农村土地承包经营权、农村土地经营权的;</p>\r\n<p>(八)认为行政机关滥用行政权力排除或者限制竞争的;</p>\r\n<p>(九)认为行政机关违法集资、摊派费用或者违法要求履行其他义务的;</p>\r\n<p>(十)认为行政机关没有依法支付抚恤金、最低生活保障待遇或者社会保险待遇的;</p>\r\n<p>(十一)认为行政机关不依法履行、未按照约定履行或者违法变更、解决政府特许经营协议、土地房屋征收补偿协议等协议的;</p>\r\n<p>(十二)认为行政机关侵犯其人身权、财产权等合法权益的。</p>\r\n<p>除前款规定外，人民法院受理法律、法规规定可以提起诉讼的其他行政案件。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('20', '<p>摘要：撤销案件是指侦查机关对立案侦查的案件，发现具有某种法定情形，或者经过侦查否定了原来的立案根据，所采取的诉讼行为。</p>\r\n<p>公安机关或者人民检察院对已经侦查的案件，因为存在法定的情形依法予以撤销，终止诉讼。</p>\r\n<p>根据中国《刑事诉讼法》第15条规定，撤销案件的情形包括：</p>\r\n<p>(1)情节显著轻微，危害不大，不认为是犯罪的;</p>\r\n<p>(2)犯罪已过追诉时效期限的;</p>\r\n<p>(3)经特赦令免除刑罚的;</p>\r\n<p>(4)依照刑法告诉才处理的犯罪，没有告诉或者撤回告诉的;</p>\r\n<p>(5)犯罪嫌疑人、被告人死亡的;</p>\r\n<p>(6)其他法律规定免予追究刑事责任的，公安机关或者人民检察院在侦查过程中，遇有上述情形之一的，即应撤销案件。</p>\r\n<p>在审判过程中，因公诉人撤回起诉，自诉人撤回自诉，或者人民法院对自诉案件裁定驳回，诉讼程序即告终止，人民法院应将案件注销。但这与《刑事诉讼法》第15条规定的撤销案件并不相同，应加以区别。</p>\r\n<p>例如，根据有关规定，在法院审判阶段，如果被告人死亡，但已有证据证明被告人无罪，如果被告人家属要求，人民法院应作出无罪判决。这与案件在侦查和起诉阶段应撤销案件的规定的情况并不相同。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('21', '<p>摘要：什么是刑事诉讼一事不再理、禁止双重危险原则?一事不再理原则，指对同一行为，法院作出的判决生效后，除法律另有规定外，不得对行为人再行追诉和审判。禁止双重危险原则指一个人不能因同一行为或同一罪名受到两次或多次审判或处罚。下面小编为您详细介绍!</p>\r\n<p>一、一事不再理原则(大陆法系)</p>\r\n<p>1、一事不再理原则，指对同一行为，法院作出的判决生效后，除法律另有规定外，不得对行为人再行追诉和审判。</p>\r\n<p>2、一事不再理原则适用的前提是法院作出生效裁判。</p>\r\n<p>3、一事不再理原则的主要功能是通过防止法院对同一事实作出前后矛盾的裁判，以维护司法的威信，保证法秩序的安定性。</p>\r\n<p>二、禁止双重危险原则(英美法系)</p>\r\n<p>1、禁止双重危险原则指一个人不能因同一行为或同一罪名受到两次或多次审判或处罚。</p>\r\n<p>2、禁止双重危险原则的适用不以法院作出生效裁判为前提，只要司法程序已经对被告人产生了危险，则被告人就不应受第二次危险。</p>\r\n<p>3、禁止双重危险原则的主要功能是防止国家滥用追诉权，避免被告人因同一罪行受到双重危险。</p>\r\n<p>三、我国刑事诉讼法</p>\r\n<p>1、我国刑事诉讼法未确立</p>\r\n<p>一事不再理原则和禁止双重危险原则。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('22', '<p>一家企业，通常会设置这么一个岗位，法律顾问。法律顾问，是指依照国家关于企业法律顾问制度的规范概念，企业法律顾问(企业律师)，是指经全国统一考试合格，取得两部一委联合颁发的《企业法律顾问资格证书》，和经本省注册，取得《企业法律顾问执业资格证书》，并受企业聘用成为有关企业的内部成员，专职从事企业法律事务工作的人员.，也称企业律师。具体内容，下文为大家详细介绍：</p>\r\n<p>【种类】</p>\r\n<p>企业法律顾问分为企业专职法律顾问、企业兼职法律顾问、助理企业法律顾问、和外聘律师顾问。前者是劳动合同关系，后者是劳务合同关系。(律师与律师事务所是劳动合同关系，律师顾问从律师事务所派遣到企业来从事法律服务是劳务合同关系)</p>\r\n<p>一、专职企业法律顾问</p>\r\n<p>专职法律顾问又分为通过国家人事部的企业法律顾问执业资格考试在企业中专职从事企业法律顾问工作的企业法律顾问(具有律师资格被聘为助理企业法律顾问)和通过司法考试的执业律师接受企业聘用成为劳务性的律师顾问。律师事务所和企业都是经济组织，一个自然人不能对一份法律工作签订两个劳动合同。所以专职企业法律顾问不得从事除受聘公司以外的其他法律服务业务。</p>\r\n<p>2、聘请的律师法律顾问</p>\r\n<p>聘请的律师法律顾问是指企业与律师事务所签订法律顾问劳务合同，律师事务所指派或者派遣企业指定的律师从事企业法律顾问工作。这类律师法律顾问可以从事律师事务所的其他法律服务业务。</p>\r\n<p>【服务内容】</p>\r\n<p>企业法律服务产品是无形法律服务有形化的产物。针对企业经营、管理过程中的某些法律问题，通过分析企业需求、结合有关法律规定及实务处理经验，将法律解决方案系统化、规范化，增加法律服务的效率和效果。</p>\r\n<p>服务内容的特点</p>\r\n<p>⒈系统化法律解决方案;</p>\r\n<p>⒉标准化法律服务成果;</p>\r\n<p>⒊规范化法律操作流程。</p>\r\n<p>服务内容的结构</p>\r\n<p>⒈产品说明;</p>\r\n<p>⒉法律操作指引;</p>\r\n<p>⒊相关法律法规依据;</p>\r\n<p>⒋相关案例索引。</p>\r\n<p>服务内容目录</p>\r\n<p>⒈企业法律风险管理项目;</p>\r\n<p>⒉合同签订、履行法律操作实务;</p>\r\n<p>⒊企业应收账款管理法律操作实务;</p>\r\n<p>⒋企业采购管理法律操作实务;</p>\r\n<p>⒌企业员工入职管理法律操作实务;</p>\r\n<p>⒍企业员工离职管理法律操作实务;</p>\r\n<p>⒎企业销售人员管理法律操作实务;</p>\r\n<p>⒏企业商业秘密保护法律操作实务。</p>\r\n<p>其他服务内容</p>\r\n<p>⒈制定并审核公司的法律文件包括各类合同、协议;</p>\r\n<p>⒉为公司人员提供法律咨询指导，协助公司人员解决法律问题;</p>\r\n<p>⒊参与公司经营决策，依法提出法律意见;</p>\r\n<p>⒋组织做好公司知识产权管理、工商事务、仲裁诉讼等方面的法律事务工作;</p>\r\n<p>⒌对公司业务进行法律监督，保证公司商业行为的合理合法性;</p>\r\n<p>⒍协助公司相关人员和有关部门就业务相关法律问题进行协商。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('23', '<p>摘要：什么是金融犯罪?金融犯罪是指在金融活动中，侵害金融管理制度、金融市场秩序以及其他社会经济关系，依照我国刑法的规定，应当受到刑法处罚的行为。那么，金融犯罪有哪些刑事风险呢?</p>\r\n<p>随着互联网金融平台的发展，互联网金融融资逐渐发展的同时，也暗藏着刑事风险，其中最容易涉嫌的就是非法吸收公众存款和集资诈骗。接下来由法律快车编辑在本文详细介绍互联网金融潜在的刑事风险。</p>\r\n<p>互联网金融犯罪容易引发涉企犯罪</p>\r\n<p>随着网贷行业的迅速升温，借款逾期、投资人提现困难、平台老板跑路等隐患逐渐浮出水面，人们也将关注重心更多地转移到平台法律风险防范、投资人冷静分散投资及如何理性维权等角度，但对于网络借贷法律关系中的一方，企业通过P2P平台融资的法律风险却鲜有提及。在此，笔者有必要为企业敲响警钟。</p>\r\n<p>从实践经验来看，企业通过互联网融资，往往会借助P2P平台发布借款标以吸引更多的投资者，而一旦企业选择在互联网上发布融资信息，该信息的传播范围和宣传效果便远远超出了企业可掌控的范围。</p>\r\n<p>互联网融资不利于企业及时采取补救措施</p>\r\n<p>在刑事司法领域，被告企业是否及时采取补救措施，积极认错、弥补损失、取得谅解，不仅是影响司法机关作出判断的重要因素，有时甚至可能影响法院的定罪量刑。</p>\r\n<p>因此，被告企业能否在案发后采取及时有效的补救措施，对企业来说至关重要。如果企业选择通过互联网融资，其面对的投资者是来自五湖四海且未曾谋面的陌生人，企业时常会陷入这样的困境：当融资企业想及时还款或采取其他补救措施时，通常可能无法联系到具体的每一位投资者，从而导致企业无法快速止损，以降低社会危害程度。而这一点，却是司法机关相当看重的情节。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('24', '<p>行政复议法规定，对法律规定为最终裁决的复议决定，申请人则不能再向人民法院提出行政诉讼。那么，哪些行政复议决定终局裁决不能提起行政诉讼?详细解答请看下文。</p>\r\n<p>行政复议法规定，除法律规定最终裁决的复议决定外，申请人对复议决定不服的，可以在法定的期限内向人民法院起诉。根据这一规定，只要法律没有规定复议机关作出的行政复议决定是最终裁决的，申请人对复议决定不服，都可以向人民法院提出行政诉讼。但是对法律规定为最终裁决的复议决定，申请人则不能再向人民法院提出行政诉讼。</p>\r\n<p>终局行政行为是指依照法律规定行政机关拥有最终行政裁决权的行政行为，它具有两个特点：</p>\r\n<p>一是这种行为体现着行政机关拥有最终行政裁决权。即终局行政行为一经作出，便具有最终的法律效力。如果行政相对人对这种行政行为不服，不能提起行政诉讼。</p>\r\n<p>二是这种行为的最终行政裁决权须由法律明文授权。这里所说的法律，指的是全国人大及其常委会制定的法律，不包括行政法规和地方性法规，更不包括行政规章。</p>\r\n<p>行政复议法中对最终裁决的行政复议决定作出规定的有两条：</p>\r\n<p>一是第十四条规定，依法向国务院申请裁决的，国务院依法作出的决定是最终裁决定;</p>\r\n<p>二是第三十条规定，根据国务院或者省、自治区、直辖市人民政府对行政区划的勘定、调整或者征用土地的决定，省级人民政府确认土地、矿藏。水流、森林、山岭、草原、荒地、滩涂、海域等自然资源的所有权或者使用权的行政复议决定是最终裁决。</p>\r\n<p>法律设置最终裁决的行政复议决定，主要是基于以下几点考虑：</p>\r\n<p>首先是考虑到我国的实际情况，对国务院作出的行政复议决定，及根据国务院和省级人民政府作出行政区划调整和征用土地决定，省级人民政府作出的自然资源确权的行政复议决定，实行最终裁决制度，有利于提高行政效率，有利于社会矛盾的解决。国务院和省级人民政府作为行政复议机关，并没有剥夺当事人的法律救济渠道，同时，对法律限定范围内的事项，由国务院和省级人民政府作出行政复议决定后，人民法院不适宜再另行作出决定。</p>\r\n<p>第二，有的行政机关决定的事项即使上法院，无论如何判决，最后还需要行政机关处理。如行政复议法第三十条规定最终裁决的事项，到人民法院诉讼，只能看是否符合行政区划的勘定、调整和征用土地的决定，符合的就维持，不符合的只能撤销，还得由政府重作决定，在诉讼阶段对行政相对人的权益产生不了什么影响。实践中有的案子历经裁决、判决、再审、重作、判决、再审&hellip;&hellip;长达十几年不能解决，当事人花费大量的时间、精力和费用，没有解决问题，反而激化了矛盾，不利于社会稳定。</p>\r\n<p>另外，我国法律规定行政复议决定为终局裁决的，还有三部法律：</p>\r\n<p>一是《中华人民共和国外国人入境出境管理法》第二十九条规定：&ldquo;受公安机关罚款或者拘留处罚的外国人，对处罚不服的，在接到通知之日起十五日内，可以向上一级公安机关提出申诉，由上一级公安机关作出最后的裁决，也可以直接向当地人民法院提起诉讼。&rdquo;从这一规定看，对公安机关作出的罚款和拘留的行政处罚，是行政复议还是行政诉讼，由当事人选择，或者行政复议，或者向人民法院起诉。规定中的&ldquo;向上一级公安机关提出申诉&rdquo;，就是申请复议，&ldquo;由上一级公安机关作出最后的裁决&rdquo;，就是公安机关作出的行政复议决定为最终裁决，对其行政复议决定不能向人民法院提起行政诉讼。</p>\r\n<p>二是《中华人民共和国公民出境入境管理法》第十五条的规定，这一规定与前面所讲的外国人入境出境管理法的规定一样，中国公民对公安机关依据该法作出的行政拘留处罚不服而申请行政复议的，上一级公安机关所作出的行政复议决定为最终裁决。</p>\r\n<p>三是《中华人民共和国集会游行示威法》规定对公安机关不许可集会、游行、示威的决定不服申请行政复议，同级人民政府的行政复议决定是最终裁决。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('25', '<p>摘要:行政诉讼法规定了哪些基本原则?行政诉讼法规定了八项基本原则，分别为人民法院依法独立审判原则、以事实为根据，以法律为准绳、对具体行政行为合法性审查原则、当事人法律地位平等原则、使用民族语文文字进行诉讼的原则、辩论原则等。下面小编为您详细介绍!</p>\r\n<p>1、人民法院依法独立审判原则</p>\r\n<p>《行政诉讼法》第3条第1款的规定：&ldquo;人民法院依法对行政案件独立行使审判权，不受行政机关、社会团体和个人的干涉。&rdquo;</p>\r\n<p>2、以事实为根据，以法律为准绳</p>\r\n<p>《行政诉讼法》第4条规定：&ldquo;人民法院审理行政案件，以事实为根据，以法律为准绳&rdquo;。</p>\r\n<p>3、对具体行政行为合法性审查原则</p>\r\n<p>《行政诉讼法》第5条规定：&ldquo;人民法院审理行政案件，对具体行政行为是否合法进行审查。&rdquo;</p>\r\n<p>4、当事人法律地位平等原则</p>\r\n<p>《行政诉讼法》第7条规定：&ldquo;当事人在行政诉讼中的法律地位平等&rdquo;。</p>\r\n<p>5、使用民族语文文字进行诉讼的原则</p>\r\n<p>《行政诉讼法》第8条规定：&ldquo;各民族公民都有用本民族语言、文字进行诉讼的权利。</p>\r\n<p>6、辩论原则</p>\r\n<p>《行政诉讼法》第9条规定：&ldquo;当事人在行政诉讼中有权进行辩论。&rdquo;</p>\r\n<p>7、合议、回避、公开审判和两审终审原则</p>\r\n<p>《行政诉讼法》第6条规定：&ldquo;人民法院审理行政案件，依法实行合议、回避、公开审判和两审终审制度。&rdquo;</p>\r\n<p>8、人民检察院实行法律监督原则</p>\r\n<p>《行政诉讼法》第10条规定：&ldquo;人民检察院有权对行政诉讼实行法律监督。&rdquo;</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('26', '<p>具有法律专业知识，接受公民、法人或其他组织的聘请为其提供法律服务的人员，以及法人或其他组织内部设置的法律事务机构中的人员，均为法律顾问。下文为大家详细介绍：</p>\r\n<p>一、法律顾问的业务范围</p>\r\n<p>法律顾问的业务范围一般包括：</p>\r\n<p>1、为聘方涉及法律方面的事务提供法律咨询;</p>\r\n<p>2、为聘方草拟、审查、修改法律事务文书;</p>\r\n<p>3、为聘方经营管理决策或重大事项的决策提供法律意见，或依法进行论证;</p>\r\n<p>4、协助聘方开展宣传教育，运用法律手段加强企业管理;</p>\r\n<p>5、应邀为聘方的有关法律事务出具法律意见书或进行见证;</p>\r\n<p>6、向聘方提供有关法律信息;</p>\r\n<p>7、代聘方发布有关的声明、公告、致函等文书;</p>\r\n<p>8、接受聘方委托，对有关企业或项目进行资信或可行性调查，并出具调查报告;</p>\r\n<p>9、代办企业工商登记等法律事务;</p>\r\n<p>10、参与聘方的经济合同谈判和其他重大商务谈判，提供法律意见，准备或审核所需的资料及有关的法律法规，协助制定谈判方案等;</p>\r\n<p>11、参与处理聘方尚未形成诉讼或仲裁的民事、经济、行政争议或其他重大纠纷;</p>\r\n<p>12、优先接受聘方委托，代理参加民事、经济、行政等各类纠纷案件的调解、仲裁或诉讼活动，依法维护聘方的合法权益。</p>\r\n<p>二、法律顾问的作用</p>\r\n<p>法律顾问在参与重大经营决策、规范企业改组改制、健全企业规章制度、处理诉讼、非诉讼事务、防范企业经营风险等方面发挥着重要作用，是企业领导人在市场经济条件下依法经营管理的得力参谋和助手。</p>\r\n<p>1、充当代理人有着明显的优势。由法律顾问充当企业诉讼或仲裁案件的代理人，与直接聘请其它律师作为代理人的不同之处，就在于顾问律师能够更好的根据企业的实际情况，融会贯通地灵活应用，将诉讼或仲裁的代理方案予以策划，设计好庭审策略，在事前为保证胜诉夯实基础。</p>\r\n<p>2、能增强企业的法律防范意识，减少、降低法律风险。法律顾问是企业规划远景的好参谋，可帮助规划企业的整体战略和局部策略，又可以就某些专项事务提供法律意见，企业可随时就所遇到的问题向顾问律师咨询，使企业的运行有着良好的法律保障。</p>\r\n<p>3、能起到一定的威慑作用。企业有了法律顾问，在与对方出现纠纷时，顾问律师可以律师的名义出具律师函等，一则可以固定证据，二则会给对方造成一定的压力，便于解决很多原本要通过诉讼法才能解决的问题。</p>\r\n<p>4、能为企业提供税务、财务等方面的策划与咨询，为企业提供合法的法律规避意见。</p>\r\n<p>三、法律顾问的分类</p>\r\n<p>法律顾问一般可以分为：常年法律顾问、专项法律顾问。</p>\r\n<p>常年法律顾问是双方签订的聘请合同以1年或更长时间为期限。在约定的期限内，律师以法律顾问的身份为聘请方提供法律服务，聘请方有权依照合同要求律师办理有关法律事务。担任法律顾问的律师应当就合同约定的工作范围和职责进行工作。约定的期限届满，律师事务所同聘请方的法律顾问关系即告终止。如果继续法律顾问关系，须续签聘请合同。</p>\r\n<p>专项法律顾问则是指律师事务所与聘请方签订以办理某一特定事项或某一约定法律事务为内容的聘请合同。指派律师根据合同约定的提供法律服务的事项进行工作，该特定事项办理结束，法律顾问关系即告终止。</p>\r\n<p>◆企业该如何选择法律顾问?</p>\r\n<p>据统计，目前全国已有执业律师十余万人，律师事务所一万余家，而北京地区又远远走在全国的前列，律师事务所近千家，律执业人员有一万人左右。在市场经济的大环境里，适应法律服务市场的需求，律师服务在逐步走出单枪匹马、单打独斗的阶段，律师服务的专业化、团队型悄然兴起，这就为企业对律师服务的选择提供了更广阔的空间。那么企业该选择什么样的律师服务，答案是：找个专业的律师团。专业的律师团在服务上有什么优势呢?</p>\r\n<p>一、业务专业性</p>\r\n<p>生活中处处有法律，有法律就会有法律服务的市场，就会有律师的存在，可以说律师服务的触角可以涉及到社会生活中的每一个角落。据有人统计，现在我国法律、法规的总字数，已超过6亿字。法律的完善，法律法规的细化，多行业、多专业、多领域复杂法律事务市场的出现，在为法律服务市场提供广阔空间的同时，也对服务的专业化提出更高的要求。正像前文所讲，市场里没有样样精通&ldquo;包冶百病&rdquo;的律师。而专业律师团的专业化特点，也正是针对这方面不足，这并不是哪位高人的高瞻远瞩，而是法律服务市场细分的必然结果。</p>\r\n<p>作为企业在选择法律顾问时，如何才能考察律师是否专业呢?这首先要看你自身在哪个行业里，是什么专业。如果你对自身行业有起码的了解，在与律师的沟通中，目然会发现对方是否专业，因为律师服务的专业就是从你那里分出来的，而不是从天上掉下来的。同时，还应了解对方在行业内服务的业绩和历史，一个服务数量上的量加上一个服务时间上的量，是衡量其是否专业的直接标志，再加上其在业内对问题研究的程度和影响，就足以证明其是否基本&ldquo;专业&rdquo;了。</p>\r\n<p>二、服务立体化</p>\r\n<p>法律是分行业、分专业的，而企业出现的问题、麻烦却常常是不分专业的。人常说：麻雀虽小，五脏俱全。企业虽有大小，问题却有相同之处。因此，为了能够使专业的服务，收到最佳的效果，还需服务立体化的辅助，就像是一个专科医院，也需要设立必要的辅助科室一样，如果没有辅助科室的支持，再好的医生，也未必能治好病人的病。</p>\r\n<p>应该认识到的是，专业化分工越细，对合作的要求越高。因此专业化服务必须是团队型的，而且也只能是团队型的。换言之，如果没有团队，就很难完成真正意义上的律师专业化服务。只有具备&ldquo;会诊&rdquo;能力的专业律师团，才能通过立体服务的支持，完成所谓的专业化服务。这就是企业为什么要选择专业律师团的根据。</p>\r\n<p>三、团队紧密型</p>\r\n<p>同德则同心，同心则同志，同志则同道，志同道合才会有团队共同愿景，才会众志成城，才能结合成紧密型的合作团队。这不仅是缔造律师团文化的核心，也是企业选择律师团时考察其凝聚力的主要标志。</p>\r\n<p>以共同愿景为基础而形成的团队凝聚力，是团队整体内驱的源动力，是立体化服务能够得以持久贯彻的基础。</p>\r\n<p>文化统一的是思想，机制统一的是行为。为此，企业在考察选用律师团时，除了要了解其无形的文化背景，还应了解其有形的机制构成。紧密型团队是需要一个良好的内部规章制度和行为规范约束的;而紧密的程度，某种意义上说是建立在规则统一程度的基础上的。最基本的统一包括统一的、共享的团队资源，统一的、共同的业务操作程序和统一的收费与支出等。企业考察律师团队，不妨参考上述条件。</p>\r\n<p>◆企业如何用好法律顾问?</p>\r\n<p>选好律师是前提，用好律师是目的。要知道律师一旦受托于某家企业，便与该企业达成了同一个目标，成为同一个利益整体。一方面，作为受托方应主动与委托方进行积极的沟通，以期在一些主要问题上达成一致和共识;另一方面，作为委托方的企业也应与委托律帅保持经常性的联系，沟通情况与信息。在必要的情况下，一些没有内部法律职能部门的企业，还应该把聘用律师的服务纳入企业管理的一部分，不仅可以弥补企业管理缺项之不足，还可以最大限度地发挥外聘律师的作用，使自身投资获得高效回报。在处理与律师的关系上着重需要把握的有如下几点：</p>\r\n<p>一、建立信任</p>\r\n<p>律师对目标事件法律上的判断，是以对目标事件本身的相关情况知情的程度为基础的。人们常说的&ldquo;没有调查就没有发言权&rdquo;的说法，其实，是以把调查等同于知情为前提的，知情与判断就是这样一个关系：知情是判断的前提。</p>\r\n<p>律师的知情，某种意义上说，取决于委托方信任的程度。委托方信任程度越高，意思表达越真实，披露的情况越多，律师了解的真实情况就越多，对自身判断的信心就越高，判断也就越准确。很难想像一个对目标事件不知情或不完全知情的律师对目标事件能够做出准确的判断，更难想像在明知&ldquo;不知情&rdquo;的情况下，对所做出的判断还会有充分的信心。</p>\r\n<p>二、保守秘密</p>\r\n<p>保守秘密是律师的职业操守，是律师的基本权利和义务，同时也是委托方对受托律师的基本要求。基于信任和律师对目标事件判断的需要，委托人所提供的背景情况，常常超过事件相关情况本身的。即使是事件本身或与事件本身无关，也有许多是鲜为人知，并继续不愿为人知的，其范围包括但不限于企业的商业秘密。</p>\r\n<p>律师在执业过程中，不得泄漏在处理委托事务中有知悉的国家机密和有关委托人以及其它利害关系人的商业秘密、个人隐私和其他信息，这就是律师的保密义务。为保障这一义务的履行，所赋予律师的不作证的权利，在英美法系中称之为&ldquo;律师特权&rdquo;，即律师对负有保密义务的内容，不负作证义务。这是委托人对受托律师得以信任的制度上的保证。基于此，强调并监督受托律师履行保密义务，也是委托人防范和减少风险的一个重要环节。</p>\r\n<p>三、冷静面对律师承诺</p>\r\n<p>律师承诺是指律师对委托事项服务结果的事先保证，包括口头上的承诺和书面上的承诺。绝大多数客户正是基于这样一种承诺与受托律师建立委托关系的。鉴于我国目前立法的实际、司法环境和律师执业水平，律师承诺，多数会提出支持自己做出承诺的保障和依据，常见的三种情况：一是基于技术上的承诺，即&ldquo;我们做此类业务很专业，且有若干成功案例&rdquo;;二是基于关系上的承诺，即&ldquo;我们有什么样的关系，所以&hellip;&hellip;&rdquo;;三是技术加关系的承诺，不言而喻&ldquo;我们不仅专业，而且有关系&rdquo;。</p>\r\n<p>很明显，企业在选择受托律师时，如能&ldquo;货比三家&rdquo;，应该首选第三种。但不管做出什么样的选择，技术背景的支持都是第一位的。因为只有这些才是可以拿得到&ldquo;桌面上的&rdquo;。还应该注意的是，对于承诺的内容，能具体、量化的，尽量具体、量化，需要书面形式表达的，尽量以书面形式&ldquo;锁定&rdquo;。</p>\r\n<p>四、合理支付律师佣金</p>\r\n<p>律师费的实质就是律师服务佣金，它既是律师为客户提供服务所取得的报酬，也是律师事务所为其员工谋取福利和继续为社会提供良好服务的保证。</p>\r\n<p>提供律师服务应该支付佣金，这是个很容易达成共识的问题。问题在支付多少才是合理，由于行业管理的有关规定并不具体，而容易产生分歧。就&ldquo;收费是不是越低越好&rdquo;的话题，前文已有表述。那么怎样才算&ldquo;合理&rdquo;呢?如果以&ldquo;任何不能量化的科学，都不是精确的科学&rdquo;的观点为基础，是不会找到任何答案的。但有一点认识是可以参考的，就是在多数情况下，佣金支付的多少与服务提出方提出要求的多少是成正比的，因为&ldquo;合理&rdquo;是建立在&ldquo;双方均认可&rdquo;的基础上的。而在实践中，我们又可以列举太多的影响着&ldquo;双方均认可&rdquo;的因素，为此律师良心的付出服务，客户要良心的对待服务。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('27', '<p>我国《合同法》第54条规定：&ldquo;下列合同，当事人一方有权请求人民法院或者仲裁机构变更或者撤销：(1)因重大误解订立的;(2)在订立合同时显失公平的。一方以欺诈、胁迫的手段或者乘人之危，使对方在违背真实意思的情况下订立的合同，受损害方有权请求人民法院或者仲裁机构变更或者撤销。当事人请求变更的，人民法院或者仲裁机构不得撤销&rdquo;该条明确规定了可撤销合同之情形</p>\r\n<p>(一)重大误解的合同</p>\r\n<p>所谓重大误解的合同，是指行为人因对合同的重要内容产生错误认识而使意思与表示不一致的合同《民法通则若干问题的意见》第71条规定：&ldquo;行为人因对行为的性质、对方当事人、标的物的品种、质量、规格和数量等的错误认识，使行为的结果与自己的意思相悖，并造成较大损失的，可以认定为重大误解&rdquo;。该规定解释了重大误解的合同的基本内容。</p>\r\n<p>1.重大误解的特征。在民法理论上，重大误解又称为错误，其情形有二：(1)意思与事实不一致，(2)意思与表示不一致。按照德国法学家萨维尼的见解，前者为真正之错误，即动机错误;后者为非真正之错误，即法律行为之错误或直接称为错误。重大误解通常具有如下特征：</p>\r\n<p>(1)误解是当事人认识上的错误。该错误的产生是当事人的内心意思缺陷，不是其他原因。当事人的意思真实与其内心意思是一致的，就是由于缺乏必要的知识、技能或信息等内心意思的缺陷，使其对合同的内容等发生误解。</p>\r\n<p>(2)误解是当事人对合同内容的认识错误。误解的对象是合同的内容，是对合同内容的认识错误，因此而使当事人订立了合同。合同的内容，主要是合同的主要条款，当事人对合同的主要条款的认识发生误解，才能够成为重大误解。在订约的动机上，在合同用语的使用上，都可能发生误解，不能构成重大误解。</p>\r\n<p>(3)误解直接影响到当事人的权利和义务。基于当事人对合同内容的错误认识，因而，就必须影响到当事人的权利义务关系，给误解的一方当事人造成损失。正是由于这样，法律才将重大误解作为合同相对无效的理由，授予发生误解的当事人以变更权或撤销权。</p>\r\n<p>2.重大误解的构成要件。重大误解一般以双方误解为原则，以单方误解为例外。重大误解的构成要件如下：</p>\r\n<p>(1)须有意思表示的成立。重大误解系就意思表示而发生。如果不成立意思表示，则不发生重大误解。因而构成重大误解，必须具备成立的意思表示，欠缺意思表示时，根本不成立意思表示，就不构成重大误解。确认意思表示成立，须依照意思表示成立的一般要件衡量，具备表示内心意愿的效果意思和借之使内心意愿外化的表示行为。</p>\r\n<p>(2)意思表示的内容与内心的效果意思须不一致。重大误解的表意人首先应有内心的效果意思之存在，无意识的表示，没有内心的效果意思不成立误解。其次，表意人应将其意思外化为意思表示，没有表示意思而为的行为，偶然客观的有表示的价值者，均为无表示。无表示行为，亦不构成误解。再次，表意人内心的效果意思与其表示不相一致，即其意思表示的内容与内心的效果意思相悖。</p>\r\n<p>(3)须表意人不知内心的效果意思与表示的不一致，而且欠缺认识的原因。重大误解构成的主观要件，即为此。学者认为，重大误解一般是行为人的过失行为造成的，即由行为人不注意、不谨慎造成的。但是，应当注意两点：一是过失并非为重大误解的构成要件，重大误解的主观要件是认识的欠缺，形成认识欠缺的原因，可能是过失，也可能是不知。二是过失的程度应当有所限制，即重大过失，超出了重大误解的主观要件范围，不构成重大误解，不产生撤销权，如《日本民法典》第95条后段所规定的那样，表意人有重大损失时，不得自己主张其无效。</p>\r\n<p>(4)误解须为重大所谓误解重大，是指行为人表达出来的意思与其真实意愿存在着重大差别，并且极大的影响了当事人所应享受的权利和应承担的义务。具体确定重大误解，要分别当事人所误解的不同情况，考虑当事人的状况、活动性质、交易习惯等各方面的因素来确定。确定误解重大的简洁标准，是表意人因此而受到或者可能受到较大利益损失。</p>\r\n<p>3.重大误解与欺诈、显失公平的区别。重大误解与欺诈的区别。重大误解与欺诈都包含了表意人的认识错误问题，二者之间的根本区别在于，在重大误解的情况下，误解一方陷入错误认识是由于其自己的过失(非故意)造成的，而非受欺诈的结果;在欺诈的情况下，受欺诈人陷人错误认识是由于他人实施欺诈行为而诱使自己作出非真实的意思表示，而非自己的过失造成的。</p>\r\n<p>重大误解与显失公平的区别。一方利用其优势或利用对方无经验而与对方订立合同，发生显失公平的后果通常也与对方的重大误解联系在一起。重大误解与显失公平的区别在于：一方面，重大误解的合同并不要求后果显失公平;另一方面，表意人一般不能以自己的失误主张变更或撤销合同，但若这种单方误解导致显失公平的后果时，法律可给予救济。</p>\r\n<p>4.重大误解之情形。从司法实践来看，重大误解包括如下几种情形：(1)对合同的性质发生误解，如误将买卖作为赠与或将赠与作为买卖;(2)对当事人特定身份的认识错误。如在以感情为基础的赠与合同、以信用为基础的委托合同以及对要求特定履约能力的合同(某些承揽合同、技术合同)，如果对当事人的身份发生了误解，可以认定为重大误解;(3)对标的物性质的误解，如把镀金的物品当作是纯金的，把原作当成赝品;(4)对标的物质量的认识错误。在标的物质量直接关涉到当事人订约目的或重大的利益时，对质量发生误解则可构成重大误解;(5)对标的物价值的误解，如误将仅值1000元的标的物当作10000元。此外，当事人对标的物的数量、包装、履行方式、履行地点、履行期限等内容的误解，如果并未影响当事人的权利义务或影响合同目的之实现，则一般不应认定为重大误解。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('28', '<p>《律师法》第26条规定：&ldquo;律师担任法律顾问的，应当为聘请人就有关法律问题提供意见，草拟、审查法律文书，代理参加诉讼，调解或者仲裁活动，办理聘请人委托的其他法律事务，维护聘请方的合法权益&rdquo;。</p>\r\n<p>一、什么是法律顾问?</p>\r\n<p>法律顾问是指律师依法接受自然人、法人或者其他组织的聘请，以自己的法律专业知识的专业技能为聘请方提供多方面的法律服务的专业性活动。</p>\r\n<p>二、法律顾问在公司经营的过程中起到什么作用?</p>\r\n<p>律师作为法律顾问，在公司经营的过程中，能够起到以下作用：</p>\r\n<p>1、规范公司的管理行为，使公司的管理行为时刻都在法律允许的框架之内;</p>\r\n<p>2、规范公司的经营行为，使公司的经营不因超越法律的上限而产生巨大的损失;</p>\r\n<p>3、完善公司治理结构，很多公司在起步的时候治理结构并不规范，包括持股比例、股权结构、经营层分工、股东权益保护、管理模式、增资扩股或者减少注册资金等等亟等完善，律师从这些方面加以完善，使得公司的治理结构符合现代企业制度和股东的现实要求;</p>\r\n<p>4、参与签约谈判、起草、审查和修改合同，争取合同利益，避免合同陷阱，化解合同风险等;</p>\r\n<p>5、在公司改制、资产处理、项目并购、公司并购、债权管理、债务管理、解决合同纠纷、合同善后、员工培训等专项事务中为公司争取利益;</p>\r\n<p>6、处理诉讼事务;</p>\r\n<p>7、完成公司交办的其他事务。</p>\r\n<p>律师可以在上述业务提供专业的法律服务，使得公司利益实现最大化。</p>\r\n<p>三、决定企业聘请法律顾问的因素是什么?</p>\r\n<p>企业聘请律师担任法律顾问，是基于一种具有广泛性的经营和商务活动的需要。一般来说，企业作为社会经济活动的主体，都离不开法律工作，但就其企业对律师法律服务需求的迫切程度来看，决定企业是否需要聘请法律顾问的重要因素有：</p>\r\n<p>1、法律业务的类型。法律业务的类型决定其法律事务的复杂性。法律事务越复杂，其决策行为越需要得到法律顾问的帮助。</p>\r\n<p>2、法律业务的数量。一般而言，法律事务的数量越多，越需要精于法律的律师来处理。</p>\r\n<p>3、企业的规模和效益。毫无疑问，企业的规模与效益是决定是否聘请律师，聘请多少律师担任法律的重要因素。</p>\r\n<p>4、经营者对企业发展的设计。一个需要扩大规模或者调整结构或者寻求变化的企业较之一个按部就班、保持现状的企业更需要律师提供法律服务。</p>\r\n<p>5、管理者对法律服务的评价。如果管理者认为，聘请法律顾问对企业的业务质量将有所提高，他将会聘请法律顾问。反之，则不会聘请法律顾问。</p>\r\n<p>6、获得法律服务的费用和质量。律师法律服务质量的优劣，收取费用的多少是决定企业聘请律师的一个重要因素。</p>\r\n<p>总而言之，企业是否聘请律师担任法律顾问，应当依据自身经营和商务活动的实际需要，综合各种因素，根据本企业的实际情况来决定。</p>\r\n<p>四、如何选择法律顾问</p>\r\n<p>法律顾问作为一种职业角色，有其独特的技巧性和艺术性。企业聘请的法律顾问的道德修养和业务水平的高低，决定着企业法律事务的后果。因而，选择优秀的法律顾问，是企业在决定聘请律师时的首要工作。在如今法律服务市场较为混乱无序的情况下，如何才能判断应聘律师的综合能力是否适应企业的法律服务需求呢?以下几个方面可供企业在选择法律顾问时参考：</p>\r\n<p>(一)律师个人素质方面</p>\r\n<p>1、律师应当具有诚实、正直的基本人格。</p>\r\n<p>2、律师必须具备从事法律顾问工作所需要的扎实的法律知识;</p>\r\n<p>3、了解和熟悉聘请单位的业务内容;</p>\r\n<p>4、丰富的社会阅历和法律实务经验;</p>\r\n<p>5、具有积极、主动的工作态度和创新精神;</p>\r\n<p>6、能提供快捷的服务;</p>\r\n<p>7、法律意见、建议清晰、明确;</p>\r\n<p>8、不凌驾于聘请方之上，不试图控制聘请方;</p>\r\n<p>9、能作一个忠实的倾听者，具有深刻的同情心;</p>\r\n<p>10、语言直白、易懂，不卖弄难以理解的专业术语。</p>\r\n<p>(二)律师事务所方面</p>\r\n<p>1、具备一定规模，有充足的律师人才;</p>\r\n<p>2、有严格的组织结构和管理制度;</p>\r\n<p>3、有规范的工作程序和方法;</p>\r\n<p>4、收费合理，透明度高;</p>\r\n<p>5、对律师的业务活动能够进行有效监督;</p>\r\n<p>6、能够及时对顾问律师提供指导和协作;</p>\r\n<p>7、能够根据聘请方要求，调整顾问律师结构;</p>\r\n<p>8、有承担赔偿责任的能力。</p>\r\n<p>五、签订法律顾问合同的注意事项有哪些?</p>\r\n<p>根据我国《律师法》规定，凡是聘请律师担任法律顾问的单位和个人，都必须同律师事务所签订委托聘请合同。聘请法律顾问合同的内容主要有：</p>\r\n<p>1、合同的名称;</p>\r\n<p>2、聘请双方的名称、地址;</p>\r\n<p>3、应聘方指派的律师的姓名、职务等个人情况;</p>\r\n<p>4、顾问律师的职责范围;</p>\r\n<p>5、顾问律师的工作时间和工作方式;</p>\r\n<p>6、聘任期限;</p>\r\n<p>7、聘请方为顾问律师提供的必要的工作条件和物质保证;</p>\r\n<p>8、聘方的付酬办法，即聘方聘请顾问律师的费用标准、结算方式、结算时间等;</p>\r\n<p>9、律师参与诉讼、仲裁等活动是否另行收费，另行收费的优惠规定;</p>\r\n<p>10、合同的生效和有效期限;</p>\r\n<p>11、合同变更或解除的条件;</p>\r\n<p>12、违约责任和处理办法;</p>\r\n<p>13、双方签署合同的法定代表人，以及合同签订的时间。</p>\r\n<p>企业在与律师事务所签订聘请法律顾问合同时应当注意的几个问题：</p>\r\n<p>(一)企业应当与律师事务所签订合同，而不是与律师个人签订合同。聘请时应当查验律师事务所的执业许可证和律师个人的执业证书;</p>\r\n<p>(二)企业在签订聘请合同时应当充分了解律师事务所和律师在充当企业法律顾问工作方面的能力;</p>\r\n<p>(三)正确确定聘任期限。</p>\r\n<p>(四)明确工作方式：包括：1)定期走访、坐班制;2)临时业务的联络;3)费用的承担和安排;4)诉讼事务较多的可以选择包干制。</p>\r\n<p>(五)正确的聘任方式。目前，许多律师一人身兼几个，甚至几十个单位的法律顾问，结果造成法律事务过多，律师应接不暇，顾此失彼，难以认真负责的搞好顾问工作，造成&ldquo;多顾少问，顾而不问&rdquo;的现象。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('30', '<p>再审是为纠正已经发生法律效力的错误判决、裁定，依照审判监督程序，对案件重新进行的审理。 民商事案件申请再审注意事项如下：</p>\r\n<p>1、当事人不服已经发生法律效力的民事判决、裁定、调解书，可以依法向作出该法律文书人民法院的上一级人民法院申请再审，但不停止判决、裁定、调解书的执行。</p>\r\n<p>2、申请再审的当事人为再审申请人，其对方当事人为再审被申请人。</p>\r\n<p>3、申请再审的民事判决、裁定、调解书应当属于法律和司法解释允许申请再审的生效法律文书。</p>\r\n<p>4、申请再审应当依据《民事诉讼法》第一百七十九条列举的事由提出。</p>\r\n<p>5、再审申请人应当提交再审申请书等材料，并按照再审被申请人人数提交再审申请书副本。</p>\r\n<p>6、再审申请书应当写明下列事项：</p>\r\n<p>(1)再审申请人、再审被申请人基本情况。自然人应写明姓名、性别、年龄、民族、职业、工作单位、住所地及联系方式;法人或者其他组织应写明名称、住所地和法定代表人或者主要负责人的姓名、职务及联系方式;</p>\r\n<p>(2)作出生效法律文书的法院名称、申请再审的生效法律文书名称及案号;</p>\r\n<p>(3)申请再审所依据的事由;有多项事由的，应逐项列明;</p>\r\n<p>(4)撤销或者变更生效法律文书的具体诉讼请求;</p>\r\n<p>(5)申请再审事由以及再审诉讼请求所依据的事实、理由及证据;</p>\r\n<p>(6)受理再审申请书的法院名称;</p>\r\n<p>(7)再审申请人签名或者盖章;</p>\r\n<p>(8)递交再审申请书的日期。</p>\r\n<p>7、除再审申请书外，再审申请人还应当提交以下材料：</p>\r\n<p>(1)再审申请人是自然人的，应提交身份证明复印件;再审申请人是法人或其他组织的，应提交营业执照复印件和法定代表人或主要负责人身份证明书。委托他人代为申请的，应提交授权委托书和代理人身份证明;</p>\r\n<p>(2)申请再审的生效法律文书原件，或者经核对无误的复印件;生效法律文书系二审、再审裁判的，应同时提交一审、二审裁判文书原件，或者经核对无误的复印件;</p>\r\n<p>(3)在原审诉讼过程中提交的主要证据复印件;</p>\r\n<p>(4)支持申请再审事由和再审诉讼请求的证据材料。</p>\r\n<p>8、再审申请人提交再审申请书等材料应使用A4型纸，并提交材料清单一式两份，同时可附申请再审材料的电子文本。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('31', '<p>我国《民事诉讼法》第264条规定，境外当事人给诉讼代理人的授权委托书要办理公证认证，我国《最高人民法院关于民事诉讼证据的若干规定》第11条规定，在中国领域外形成的证据要办理公证认证，在香港、澳门、台湾地区形成的证据应当履行相关的证明手续。那么实践中应当怎么做?会遇到哪些问题?笔者结合办案经验作一介绍。</p>\r\n<p>一、公证认证哪些文件</p>\r\n<p>依前述规定，需要公证的是两类文书，委托书和域外证据，似乎很明了，但实践中有一些需要注意的具体问题。</p>\r\n<p>(一)委托书</p>\r\n<p>除了委托书，还有委托人的主体登记文件需要一并公证认证，于公司而言是公司的注册登记信息、商业登记证、法人身份证复印件、董事会决议等，于个人而言是身份证件复印件。尽管民诉法中没有规定这一点，但实践中这部分内容是不可或缺的。</p>\r\n<p>对代理人来说，还需要注意的是委托书的授权内容和文件的份数。做一次公证认证很麻烦，有的时间还挺长，所以尽可能把法律程序中所需的文件一次办妥，宁多勿少。</p>\r\n<p>授权内容方面，代理人开始代理的是一审原告，要考虑到后续的二审、执行甚至再审，所以委托书中的授权要尽可能都覆盖到，把一审、上诉、执行、再审阶段的诉讼权利全写上。份数方面，公证认证文件建议不少于五份，这样一旦进入后续程序可以随时提交授权文件。试想如果没有上诉的授权，一审判决了境外当事人不服想上诉，而上诉期只有30天，临时去办公证认证，能不能来得及，万一来不及那就丧失了上诉机会。</p>\r\n<p>(二)域外证据</p>\r\n<p>民事证据规则规定&ldquo;域外形成的证据&rdquo;需要公证认证。哪些属于域外证据，很多文件是容易确定的，比如域外的合同、发票、收据、银行凭证、提单、行政机关通知等，但也有一些难以区分，比如未注明合同签署地的涉外合同，这属于域外还是国内证据?笔者认为，保险起见还是做公证认证。因为境外当事人若依据合同起诉，合同是关键证据，万一中国的被告基于签约过程提出合同签订地在境外，认为合同是域外证据，要求公证认证，会造成额外的麻烦。</p>\r\n<p>再比如境外当事人收到的电子邮件是否为域外证据?如大家所知，在互联网上国家的界限是模糊的，电子数据存储在虚拟空间里，存在某个互联网服务商的服务器里，用户可以在任何地点登陆网络存取电子邮件，则电子邮件位于哪个国家，很难说清楚。再者，就文件格式而言，不同国家的一般文书格式差异很大，如果拿给国内法官确实存在难以识别的问题，但对于电子邮件则不存在，邮件服务系统的界面近似，文书格式近似，随着电子邮件使用的普及，法官辨识这一证据并不存在障碍。既然这样，还要不要做公证?法律实践中很多当事人会做。在这一点上，笔者以为不应区分域外域内，电子邮件作为证据时应一视同仁，适用相同的认定规则。在公证的问题上，笔者赞同上海高级人民法院2007年发布的《关于数据电文证据若干问题的解答》，即电子邮件如果能够当庭出示，则不需要做公证。但因为这毕竟不是最高法院的意见，如果案件的受理法院与上海市高级法院的意见不同，还是对邮件做公证更好。</p>\r\n<p>(三)诉状等法律文书</p>\r\n<p>起诉状、申请书、上诉状等文书上的当事人签字或印章是否要公证认证。有人说，这些文件的签署在境外，真实性难以确认需要公证。实践中有些律师也会要求当事人办理公证认证。笔者以为不必要。首先法律并未规定该文书要公证认证，其次既然授权委托书已经公证认证，则由代理人提交委托人签署的法律文书这一行为本身已经可以保证签署的真实性，没有必要再施加额外的要求。而笔者所办理的案件中，法院对境外当事人签署的法律文书也未提出公证认证要求。</p>\r\n<p>二、公证词的内容</p>\r\n<p>公证员对文件的什么进行公证，这一问题因各国公证法的不同而有所差异。看下公证员在所签署文件上写下的公证词就能发现这一点。笔者没有看到过对此的统计，仅以个人见到过的公证认证文件来说。</p>\r\n<p>对于委托书，公证员会写明，某某在我面前签字。对于证件的复印件，则写复印件和原件一致。这两类文件的公证情况各国大致相同。</p>\r\n<p>对于作为证据的文件，比如合同、发票等，这就复杂了，各国公证员的做法不一致。就国内法院要求公证认证证据的目的而言，显然是希望确认证据的真实性，但公证员在短时间内如何确认自己面前的各种文件的真实性，有的如银行转账凭证可以核验，有的如发票、传真件、收据等则难以核验或核验成本很高。</p>\r\n<p>笔者所见到的情形，英国的公证员会写一段文字，说某某宣誓所附的文件是真实的，让声明人签字，公证员也签字，在所附的每一份文件上，声明人和公证员都签字，所有的文件会装订在一起。香港的公证做法与英国的类似，系因香港的公证法律源于英国法。美国加利福尼亚州的示范公证书上的公证词，内容大意是有充分证据证明某人是文件的当事人，且签字为本人或单位授权代表所为。德国某公证员对某文件出具的公证词是文件的复印件和原件一致。</p>\r\n<p>三、公证认证的程序</p>\r\n<p>公证认证的程序有三步。第一步，公证员公证，内容在前面已经介绍;第二步，公证后的文件交所在国外交部门认证，通常是外交部门在文件上盖章，官员签字，并写明某某公证员的签字是真实的，需要说明的是，在有的国家这一步可能包含两步，比如美国，先是市或郡的书记官认证签字公证员的身份，再由州长认证签字郡书记官的身份;再比如德国，先是州法院认证签字公证员的身份，再由联邦外交部授权的行政管理局认证州法院签字书记官的身份;第三步，上述文件被转交到中国驻所在国的使馆或者领馆办理认证，办理认证时会在文件上粘贴一段格式文字(附图)，兹证明前面文书上*国外交部(或其他部门)的印章和*官员的签字属实，该文书内容由出文机构负责。这样才算完成。</p>\r\n<p>港澳台地区当事人出具的委托书等文件也需要履行公证手续，相比外国的当事人程序要简单一些。</p>\r\n<p>就香港的公证程序而言，文件由具有中国委托公证人资格的香港律师办理公证，公证后交中国法律服务(香港)有限公司加盖&ldquo;转递专用章&rdquo;，就算完成了公证手续。澳门的公证与此类似。</p>\r\n<p>就台湾的公证程序而言，委托书必须经当地公证机关公证，并经台湾海峡交流基金会，通过中国大陆各省的公证员协会加盖转递章，方为有效。</p>\r\n<p>就办理期限而言，各国或地区因政府效率的不同差异极大，就笔者所知的案例以及中介机构公开给出的时限，香港、新加坡的速度极快，如手续齐备从开始办理公证到完成一周就好了，英国3周，美国10个工作日，日本15个工作日，法国20个工作日，意大利20个工作日，泰国3周，土耳其2个月，伊拉克超过2个月。</p>\r\n<p>四、公证认证费用的负担</p>\r\n<p>公证认证因诉讼而做，所支出的费用可以在诉讼中一并要求对方承担。这方面涉及的问题是，公证认证的收费凭证作为证据提交，该证据来源于境外，是否要做公证认证?按规定需要，但笔者以为如果那样做，等于让公证认证部门对自己的收费再做公证认证，有的费用如政府收取的认证费用还需要返回给公证员做公证，事情变得非常复杂。还有，有的当事人不熟悉这项工作，请代理代为办理公证认证，且代理费往往远高于公证认证本身的费用，则代理费是否可以由另一方承担?笔者以为，不应由另一方承担，因为该费用并非必须要发生的。</p>\r\n<p>五、紧急情况下的公证认证</p>\r\n<p>笔者曾经办理过一个向海事法院申请海事强制令的案件，申请人是美国公司，与国内一公司发生货物代理合同纠纷，货物已在美国的港口，港口费用与日俱增，美国公司急需拿到正本提单。我代表申请人向海事法院提交了申请海事强制令的申请，法院给我的答复是委托手续要先公证认证。我说情况紧急，司法程序能否先行启动，我让客户尽快办理公证认证手续后补交，否则几个星期下来，要增加很多损失。后来法院也接受了我的意见。</p>\r\n<p>我想，针对这一类情况，法院应接受当事人这种变通的做法，如果坚持公证认证手续先办好，则损失扩大，事情更难以补救。</p>\r\n<p>六、公证认证手续的变通</p>\r\n<p>分析《民事诉讼法》第264条规定，需要办理公证、认证手续的授权委托书针对的是在我国领域内没有住所的外国当事人从领域外寄交或者托交的。对于在我国领域内有住所的外国当事人递交的授权委托书，以及外国当事人在我国领域内虽无住所，但在我国领域内作短期停留，如旅行、探亲、讲学、经商时，在我国领域内递交的授权委托书，一般则无须履行本条规定的公证、认证手续。但外国当事人或其法定代表人本人应亲往法院，由法官核实其身份并见证其签署委托书，或者本人前往中国的公证机关由公证员公证委托书的签字。笔者以为这一情况适合当事人为自然人的情形，如果当事人为公司，由于法院或者公证处难以判断公司登记资料的真实性和签字人的身份，故公证认证的手续还是要办理的。</p>\r\n<p>总体来说，公证认证手续烦、时间长，笔者以为应当简化，应当与国际接轨，取消认证，只做公证。早在1961多个国家在荷兰海牙签署《关于取消要求外国公文书认证的公约》，依照公约，来自于其他缔约国的司法文书、行政文书、公证书以及以私人身份签署的放在文件上的正式证书，诸如登记批准书、日期签证及签字证明书免除外交或领事认证手续。照此规定，本文所提及的文件只需要经过公证就可以拿到中国的法院使用了，将极为便利高效。该公约目前已有约100个国家加入，包括香港澳门也适用，但遗憾的是我国大陆尚未加入。</p>\r\n<p>当然，这一问题涉及到民事诉讼法的修改，这儿不展开。但目前仍应按照现行规定做好公证认证手续，以符合法定的要求。</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('32', '<p>【内容提要】国内民商事仲裁协议效力确认案件，属人民法院主管的案件。但法律对此的规定之间存在冲突，且规定内容不全面，或者没有规定。本文认为，基层人民法院对仲裁协议效力案件有确认权。当事人一方先向人民法院提起诉讼,另一方后向仲裁委员会申请仲裁,仲裁委员会对仲裁协议效力案件没有确认权。同时，对确认仲裁协议效力的案件应当制定独立的审理程序制度。</p>\r\n<p>【关键词】仲裁协议、仲裁协议效力、确认之诉、基层人民法院、仲裁委员会、程序</p>\r\n<p>仲裁协议包括合同中订立的仲裁条款和以其他书面方式在纠纷发生前或者纠纷发生后达成的请求仲裁的协议。①包括存在于合同中，作为合同内容的仲裁条款，以及在争议发生之前或者之后，自愿达成的，将争议提交仲裁的书面协议书二种形式。人民法院确认仲裁协议有效或无效，是法律赋予人民法院的权利，是法院对仲裁监督的体现。所谓仲裁协议效力，是指一项有效的仲裁协议在仲裁中对有关当事人和机构的作用或约束力。所谓确认仲裁协议效力之诉，是指当事人请求人民法院确认仲裁协议有效或者无效的诉讼。但人民法院审理仲裁协议效力的确认之诉案件的现行法律规定存在矛盾和冲突，另一方面，对有些内容规定不全面，或者没有规定。因此，亟需对上述问题作出规定，以满足司法实践的需要，为此，笔者提出如下三个疑难问题进行讨论，以求教于同仁，并作引玉之砖。</p>\r\n<p>一.对仲裁协议的效力,基层人民法院是否有确认权?</p>\r\n<p>二.当事人一方先向人民法院提起诉讼,另一方后向仲裁委员会申请仲裁,仲裁委员会是否享有对仲裁协议效力的确认权?</p>\r\n<p>三.人民法院确认仲裁协议效力案件的程序应如何规定?</p>\r\n<p>一、对仲裁协议的效力,基层人民法院是否有确认权?</p>\r\n<p>1、《中华人民共和国仲裁法》(以下简称仲裁法)第20条规定：&ldquo;当事人对仲裁协议的效力有异议的,可以请求仲裁委员会作出决定或者请求人民法院作出裁定。一方请求仲裁委员会作出决定,另一方请求人民法院作出裁定的,由人民法院裁定。&rdquo;由此可见,对仲裁协议效力有确认权的机关，只能是仲裁委员会和人民法院。同时，对有确认权的人民法院的级别没有规定。但从字面上解释，此处所指的人民法院应当包括基层人民法院。</p>\r\n<p>2、最高人民法院《关于适用&lt;中华人民共和国民事诉讼法&gt;若干问题的意见》(以下简称民诉法若干意见)第145条规定：&ldquo;依照民事诉讼法第一百一十一条第(二)项的规定，当事人在书面合同中订有仲裁条款，或者在发生纠纷后达成书面仲裁协议，一方当事人向人民法院起诉，人民法院裁定不予受理，告知原告向仲裁机构申请仲裁。但仲裁条款、仲裁协议无效、②失效③或者内容不明确无法执行④的除外。&rdquo;第146条规定：&ldquo;当事人在仲裁条款或协议中选择的仲裁机构不存在，或者选择裁决的事项超越仲裁机构权限的，人民法院有权依法受理当事人一方的起诉。&rdquo;根据上述规定，可以看出，人民法院在仲裁条款、仲裁协议无效、失效、内容不明确无法执行、选择的仲裁机构不存在、选择裁决的事项超越仲裁机构权限等5种情形下，可以受理当事人一方的起诉。但上述规定中的人民法院，应当包括基层人民法院，即基层人民法院有权依照上述5种情形确认仲裁协议的效力。</p>\r\n<p>3、最高人民法院《关于当事人对仲裁协议的效力提出异议由哪一 级人民法院管辖问题的批复》(以下简称管辖批复)规定:&ldquo;当事人协议选择国内仲裁机构仲裁后，一方对仲裁协议的效力有异议请求人民法院作出裁定的，由该仲裁委员会所在地的中级人民法院管辖。当事人对仲裁委员会没有约定或者约定不明的，由被告所在地的中级人民法院管辖。&rdquo;该司法解释明确规定对仲裁协议效力享有确认权的只能是仲裁委员会所在地的中级人民法院或者被告所在的中级人民法院,即只能是中级人民法院,不包括基层人民法院。</p>\r\n<p>上述1、2与3之间内容上存在矛盾：1和2没有否认基层人民法院对仲裁协议效力的确认权;而3则明确否定了基层人民法院对仲裁协议效力的确认权。</p>\r\n<p>笔者认为，基层人民法院对仲裁协议效力有确认权。理由是：(1)仲裁法第20条规定的人民法院应当包括基层人民法院。(2)民诉法若干意见第145条、第146条规定的人民法院受理当事人起诉的前提，应当是人民法院对当事人的仲裁协议效力有确认权。而该二条中的人民法院也应当包括基层人民法院。(3)如果将受理的法院与确认仲裁协议效力的人民法院分开，将导致民事诉讼立案制度的不完整，并造成当事人的诉累。如，一个案件在基层人民法院受理，但对仲裁协议是否有效，该基层人民法院没有确认权，而由中级人民法院确认。这实际上是在当事人的立案程序中存在一个前置程序，即中级人民法院的确认程序。这不符合民事诉讼的便于当事人诉讼和便于人民法院审判的&ldquo;二便&rdquo;原则。(4)从比较法上看，《日本新民事诉讼法》第805条[关于仲裁程序的诉讼管辖法院]第1款规定，关于仲裁协议消灭事项，由仲裁协议所指定的简易法院或地方法院管辖。在没有该项指定而主张裁判上的请求时，由应管辖的简易法院或地方法院管辖。从该国司法组织体系的审级和管辖上区分，法院分为四级：最高法院、高等法院、地方法院(包括与之平行的专门处理家庭婚姻案件的家庭法院)和简易法院。⑤作为最低审级的简易法院对仲裁协议的效力有确认权。</p>\r\n<p>二、当事人一方先向人民法院提起诉讼,另一方后向仲裁委员会申请仲裁,仲裁委员会是否享有对仲裁协议效力的确认权?</p>\r\n<p>根据最高人民法院《关于确认仲裁协议效力几个问题的批复》第3条规定：&ldquo;当事人对仲裁协议的效力有异议，一方当事人申请仲裁机构确认仲裁协议效力，另一方当事人请求人民法院确认仲裁协议无效，如果仲裁机构先于人民法院接受申请并已作出决定，人民法院不予受理;如果仲裁机构接受申请后尚未作出决定，人民法院应予受理，同时通知仲裁机构终止仲裁。&rdquo;</p>\r\n<p>第4条规定：&ldquo;一方当事人就合同纠纷或其他财产权益纠纷申请仲裁，另一方当事人对仲裁协议的效力有异议，请求人民法院确认仲裁协议无效并就合同纠纷或其他财产权益纠纷起诉的，人民法院受理后应当通知仲裁机构中止仲裁。人民法院依法作出仲裁协议有效或无效的裁定后，应当将裁定书副本送达仲裁机构，由仲裁机构根据人民法院的裁定恢复仲裁或者撤销仲裁案件。人民法院依法对仲裁协议作出无效的裁定后，另一方当事人拒不应诉的，人民法院可以缺席判决;原受理仲裁申请的仲裁机构在人民法院确认仲裁协议无效后仍不撤销其仲裁案件的，不影响人民法院对案件的审理。&rdquo;</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');
INSERT INTO `wy_news_data` VALUES ('33', '<p>最高人民法院发出通知调整高院中院一审民商事案件标准</p>\r\n<p>为准确适用修改后的民事诉讼法关于级别管辖的相关规定，合理定位四级法院民商事审判职能，近日，最高人民法院发出通知，调整了高级人民法院和中级人民法院管辖第一审民商事案件的标准，自2015年5月1日起实施。</p>\r\n<p>通知明确，当事人住所地均在受理法院所处省级行政辖区的第一审民商事案件，北京、上海、江苏、浙江、广东高级人民法院管辖诉讼标的额5亿元以上的案件，所辖中级人民法院管辖标的额1亿元以上的案件;天津、河北、山西、内蒙古、辽宁、安徽、福建、山东、河南、湖北、湖南、广西、海南、四川、重庆高级人民法院管辖标的额3亿元以上的案件，所辖中级人民法院管辖标的额3000万元以上的案件;吉林、黑龙江、江西、云南、陕西、新疆高级人民法院和新疆生产建设兵团分院管辖标的额2亿元以上的案件，所辖中级人民法院管辖标的额1000万元以上的案件;贵州、西藏、甘肃、青海、宁夏高级人民法院管辖标的额1亿元以上的案件，所辖中级人民法院管辖标的额500万元以上的案件。</p>\r\n<p>通知指出，如当事人一方住所地不在受理法院所处省级行政辖区的第一审民商事案件，北京、上海、江苏、浙江、广东高级人民法院管辖诉讼标的额3亿元以上的案件，所辖中级人民法院管辖标的额5000万元以上的案件;天津、河北、山西、内蒙古、辽宁、安徽、福建、山东、河南、湖北、湖南、广西、海南、四川、重庆高级人民法院管辖标的额1亿元以上的案件，所辖中级人民法院管辖标的额2000万元以上的案件;吉林、黑龙江、江西、云南、陕西、新疆高级人民法院和新疆生产建设兵团分院管辖标的额5000万元以上的案件，所辖中级人民法院管辖标的额1000万元以上的案件;贵州、西藏、甘肃、青海、宁夏高级人民法院管辖标的额2000万元以上的案件，所辖中级人民法院管辖标的额500万元以上的案件。</p>\r\n<p>通知还指出，解放军军事法院管辖诉讼标的额1亿元以上一审民商事案件，大单位军事法院管辖标的额2000万元以上一审民商事案件。</p>\r\n<p>通知还明确，婚姻、继承、家庭、物业服务、人身损害赔偿、名誉权、交通事故、劳动争议等案件，以及群体性纠纷案件，一般由基层人民法院管辖。对重大疑难、新类型和在适用法律上有普遍意义的案件，可以依照民事诉讼法第三十八条的规定，由上级人民法院自行决定由其审理，或者根据下级人民法院报请决定由其审理。</p>\r\n<p>通知强调，此次调整的级别管辖标准不涉及知识产权案件、海事海商案件和涉外涉港澳台民商事案件</p>\r\n', '0', '', '0', '10000', '', '0', '', '0', '1', '|0');

-- ----------------------------
-- Table structure for wy_page
-- ----------------------------
DROP TABLE IF EXISTS `wy_page`;
CREATE TABLE `wy_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_page
-- ----------------------------
INSERT INTO `wy_page` VALUES ('2', '志公恒信', ';', '志公恒信律师服务的宗旨', '<h3 microsoft=\"\" style=\"margin: 0px 0px 10px; padding: 0px; font-size: 22px; color: rgb(51, 51, 51); line-height: 30px; font-family: \">&nbsp;</h3>\r\n<h3 microsoft=\"\" style=\"margin: 0px 0px 10px; padding: 0px; font-size: 22px; color: rgb(51, 51, 51); line-height: 30px; font-family: \"><span style=\"margin: 0px; padding: 0px; color: rgb(17, 93, 169);\">传播法律知识，提高法律意识，预防法律风险，解决法律纠纷</span></h3>\r\n<p>志公恒信律师提供服务的内容：</p>\r\n<p>一、民事类包括十大部分：</p>\r\n<p>1、人格权纠纷，2、婚姻家庭继承纠纷，3、侵权责任纠纷，4、物权纠纷，4、合同纠纷，5、知识产权与竞争纠纷，6、劳动争议与人事争议纠纷，7、与公司、企业有关的民事纠纷，8、9、海事海商、与铁路运输有关的民事纠纷，9、与公司、证券、票据等有关的民事纠纷，10，适用特殊程序案件。(备注：按照民事案由进行的分类)</p>\r\n<p>二、刑事类：</p>\r\n<p>1、侵犯公民人身权利的犯罪;2、侵犯公民财产权利的犯罪;3、危害公共安全的犯罪;4、破坏市场经济秩序的犯罪;5、妨害社会管理秩序的犯罪;6、贪污贿赂犯罪;7、渎职犯罪;8、 危害国防利益犯罪;9、危害国家安全的犯罪。 　　志公恒信律师提供以上犯罪刑事辩护服务，侦查阶段介入，申请取保候审，代为申诉控告，会见疑犯，提出犯罪嫌疑人无罪、罪轻、从轻、减轻、免于刑事处罚的律师意见，切实维护犯罪嫌疑人的权益。 　　三、行政类：为下列行政行为提供行政复议、行政诉讼服务。</p>\r\n<p>1、对拘留、罚款、吊销许可证和执照、责令停产停业、没收财物等行政处罚不服的;</p>\r\n<p>2、对限制人身自由或者对财产查封、扣押、冻结等行政强制措施不服的;</p>\r\n<p>3、认为行政机关侵犯法律规定的经营自主权的;</p>\r\n<p>4、认为符合法律规定条件申请行政机关颁发许可证和执照，行政机关拒绝颁发或者不予答复的</p>\r\n<p>5、申请行政机关履行保护人身权、财产权的法定职责，行政机关拒绝履行或者不予答复;</p>\r\n<p>6、认为行政机关违法要求履行义务的;</p>\r\n<p>7、认为行政机关侵犯其人身权、财产权的其他行政行为。</p>\r\n<p>获得志公恒信法律服务的途径：</p>\r\n<p>1、申请成为律师盾成员;</p>\r\n<p>2、通过咨询电话直接获得法律帮助;</p>\r\n<p>3、关注公众账户，获取法律资讯;</p>\r\n<p>4、在线留言获得专业律师回复;</p>\r\n<p>5、预约律师获得当面法律咨询。</p>\r\n<p>6、进入志公恒信网站获得资讯和咨询服务。</p>\r\n<p>随着社会深化改革，依法治国理念的推进，法律与每个人的生活愈加密切。志公恒信律师以&ldquo;法治梦想，专业、专注&rdquo;的理念竭诚为您服务，为您的生活和事业发展提供法律保障。</p>\r\n<p>本所始终坚持&ldquo;客户至上、法律至上、服务第一&rdquo;的原则，立足于专业化，有效地整合律师的资源和优势，实现专业分工和优势互补，坚持&ldquo;搭建一流平台、打造一流品牌&rdquo;的经营理念，秉承&ldquo;服务至上、 勤勉尽职、追求公正&rdquo;的服务宗旨，开拓创新，积极进取，在各个领域取得了突出的业绩，在行业内享有较高的信誉，工作受到社会有关人士、单位及客户的广泛好评，取得了良好的经济效益和社会效益。</p>\r\n', '', '0');
INSERT INTO `wy_page` VALUES ('6', '联系我们', ';', '', '', '', '0');

-- ----------------------------
-- Table structure for wy_pay_account
-- ----------------------------
DROP TABLE IF EXISTS `wy_pay_account`;
CREATE TABLE `wy_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_pay_account
-- ----------------------------
INSERT INTO `wy_pay_account` VALUES ('1', '2017032414144790403', '1', '用户01', '', '', '', '0.00', '500', '1', '1490336087', '0', '测试充值', '0', 'offline', '后台充值', '2', '120.197.17.140', 'succ', 'admin');

-- ----------------------------
-- Table structure for wy_pay_payment
-- ----------------------------
DROP TABLE IF EXISTS `wy_pay_payment`;
CREATE TABLE `wy_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for wy_pay_spend
-- ----------------------------
DROP TABLE IF EXISTS `wy_pay_spend`;
CREATE TABLE `wy_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_pay_spend
-- ----------------------------

-- ----------------------------
-- Table structure for wy_picture
-- ----------------------------
DROP TABLE IF EXISTS `wy_picture`;
CREATE TABLE `wy_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_picture
-- ----------------------------

-- ----------------------------
-- Table structure for wy_picture_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_picture_data`;
CREATE TABLE `wy_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_picture_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_position
-- ----------------------------
DROP TABLE IF EXISTS `wy_position`;
CREATE TABLE `wy_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_position
-- ----------------------------

-- ----------------------------
-- Table structure for wy_position_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_position_data`;
CREATE TABLE `wy_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_position_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_poster
-- ----------------------------
DROP TABLE IF EXISTS `wy_poster`;
CREATE TABLE `wy_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_poster
-- ----------------------------
INSERT INTO `wy_poster` VALUES ('1', '1', 'banner1', '1', 'images', '{\"1\":{\"linkurl\":\"\",\"imageurl\":\"http:\\/\\/www.fl880.com\\/uploadfile\\/2017\\/0313\\/20170313052550943.jpg\",\"alt\":\"\"}}', '1489397055', '1492075455', '1489397153', '1', '0', '0', '0');
INSERT INTO `wy_poster` VALUES ('2', '1', 'banner2', '1', 'images', '{\"1\":{\"linkurl\":\"\",\"imageurl\":\"http:\\/\\/www.fl880.com\\/uploadfile\\/2017\\/0313\\/20170313052550943.jpg\",\"alt\":\"\"}}', '1489397169', '1492075569', '1489397187', '0', '0', '0', '0');
INSERT INTO `wy_poster` VALUES ('3', '1', 'banner3', '1', 'images', '{\"1\":{\"linkurl\":\"\",\"imageurl\":\"http:\\/\\/www.fl880.com\\/uploadfile\\/2017\\/0313\\/20170313052550943.jpg\",\"alt\":\"banner3\"}}', '1489397193', '1492075593', '1489397206', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for wy_poster_201603
-- ----------------------------
DROP TABLE IF EXISTS `wy_poster_201603`;
CREATE TABLE `wy_poster_201603` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_poster_201603
-- ----------------------------

-- ----------------------------
-- Table structure for wy_poster_201703
-- ----------------------------
DROP TABLE IF EXISTS `wy_poster_201703`;
CREATE TABLE `wy_poster_201703` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_poster_201703
-- ----------------------------
INSERT INTO `wy_poster_201703` VALUES ('1', '3', '1', '3', '', 'LAN', '127.0.0.1', 'http://www.fl880.com/index.php', '1489398919', '0');
INSERT INTO `wy_poster_201703` VALUES ('2', '1', '1', '1', '', 'LAN', '127.0.0.1', 'http://www.fl880.com/index.php', '1489398919', '0');

-- ----------------------------
-- Table structure for wy_poster_space
-- ----------------------------
DROP TABLE IF EXISTS `wy_poster_space`;
CREATE TABLE `wy_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_poster_space
-- ----------------------------
INSERT INTO `wy_poster_space` VALUES ('1', '1', 'banner', 'imagechange', 'poster_js/1.js', '1950', '580', '{\"paddleft\":\"\",\"paddtop\":\"\"}', 'banner轮播', '3', '0');

-- ----------------------------
-- Table structure for wy_product
-- ----------------------------
DROP TABLE IF EXISTS `wy_product`;
CREATE TABLE `wy_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` varchar(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_product
-- ----------------------------

-- ----------------------------
-- Table structure for wy_product_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_product_data`;
CREATE TABLE `wy_product_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_product_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_queue
-- ----------------------------
DROP TABLE IF EXISTS `wy_queue`;
CREATE TABLE `wy_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_queue
-- ----------------------------

-- ----------------------------
-- Table structure for wy_release_point
-- ----------------------------
DROP TABLE IF EXISTS `wy_release_point`;
CREATE TABLE `wy_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_release_point
-- ----------------------------

-- ----------------------------
-- Table structure for wy_search
-- ----------------------------
DROP TABLE IF EXISTS `wy_search`;
CREATE TABLE `wy_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_search
-- ----------------------------
INSERT INTO `wy_search` VALUES ('17', '1', '12', '1490320330', '中小企业法律顾问有什么价值体现  企业 法律顾问 律师 公司 价值 一个 法律 过程 聘请 存在 自己 没有 团队 及时 老总 应当 如何 股东 以后 中小企业 首先 问题 目前 合同 最后 专业 希望 顾问 执行 一些 其次 可以 目标 之间 具有 对于 之后 需要 能力 只有 股权 作为 选择 业务 实现 才能 终极 时候 现状 控制 员工 厂房 还是 优秀 预防 虽然 他们 起诉 已经 提供 签订 市场 通过 管理 服务 部分 形象 无法 简介 诉讼 情况 以及 往往 体检 事物 第二 现在 联系 建造 相对 沟通 聘用 互相 然后 企业文化 书面 马上 遇到 法律意见书 体现 背景 协调 方向 法律问题 工程 放到 个人 经营 变更 事情 进入 比例 方式 贷款 案例 品牌 了解 应该 产品 相关 意味着 委托 潜在 所在 时间 家企业 这样 相同 案件 注重 形式 再次 这个 损失 提交 建立 认为 规章制度 亮点 出租 方面 人员 劳动合同 清楚 可能 原料 运转 在于 基础 拿到 怎样 关系 取得 生产 树立 超过 减少 法律服务 上述 成品 贸易商 那位 买卖 违约 包含 如果 譬如 结算 包括 作战 实际 规定 一定 租金 现金流 交付 租赁 表现 介入 等等 高管 有时 委员会 那样 登记 两位 考核 准备 陈述 现场 操作 经营管理 擅长 制度 应收账款 原先 房产 做到 考虑 证据 必须 更为 代表 当年 阶段 支撑 事项 予以 财产 签证 风险 不论 处理 执行力 因素 回答 担任 作用 主动 步骤 实施 权利 建议 经济 各自 继续 营销 负责人 数额 拿出 同时 初步 投资 具体 方案 收购 想法 感到 年限 成为 决议 某些 或者 其他 开始 总的 之上 逐步 资质 确实 不是 因为 银行 第一 剖析 享有 面对 一次 深层次 代理 介绍 融入 一一 根本 观点 展开 面的 出资 适应 华为 桌面 出来 知道 消除 公证 较为 协议 法律风险 收益 处分 防范 不动产 简单 对方 看似 有所 前提 全部 明确 的风险 附件 公示 接受 多少 离职 弥补 短缺 面貌 责任 话语权 将要 大气 像是 企业主 遇见 头上 涓涓 若干 这方面 消化 立即 好像 文化 中断 火花 深入 谈判 尽可能 白天 调研 最终 需求 尽快 不能 中小型 债权 纺织品 后果 亿元 共同 监理 职责 政府 正常 号召 工人 相差 约束 做好 坚决 面积 难度 指标 寻求 有关 维护 办理 活动 既是 自身 概括 十二 交易 推广 仲裁 意见 审查 困境 调解 参加 经过 公司有 不足 负有 授权 产生 达成 增加 供货 债务 自行 最为 用工 担心 的贷款 保障 千万 送货 订立 更是 采购 比较 各项 随之 进行 审计 设计 究竟 发生 笔者 证明 参与 经营风险 应收 后来 确定 承接 修改 混乱 章程 制定 总额 剩余 不得 股本 允许 发挥 理想 效果 过来 应付 当作 负担 即使 支出 错误 有的 助手 出现 质量 苦恼 而且 数量 容易 不但 不够 不到 一般 实在 有名 不少 支付 明白 涵义 概念 认识 评价 期间 连续 技巧 技术 内容 不仅 核心 这种 人们 属性 功能 主体 满足 含义 能够 意识 层面 意义 其二 其一 相互 任何 两个 份额 内部 内心 为了 以致 年成 接触 司法 年轻 高度 达到 实践 认知 习惯 交往 会计 一样 不乏 为主 不可或缺 过多 研究人 学问 忽视 研究 精力 放在 感觉 特别 生意 必要 明年 今年 不值 如此 费用 当然 知名度 真的 下来 判断 年终 看看 单位 经常 执业 个月 慢慢 目的是 此时 于是 想想 态度 至少 还有 人选 事务 推荐 三百 前面 面前 精心 所有公司 分钟 预先 大概 专项 事宜 协助 理由 要求 法院 事实 请求 精神 状态 不成 老大 演示 明智 告诉 颁发 毫无 细节 品质 调查研究 核算 业务范围 完美 出让 的公司 业绩 成立 公司经营 注意 小时 结束 税务 履行 调查 招聘 公开 一小 价格 危机 处置 消息 应聘 副主任 构建 委员 非常 豪华 本身 凝聚力 一流 专注 的态度 不如 全面 背后 是否 所以 力度 完善 更具 是非 一直 申请 终结 既然 拍卖 情形 我们 尽管 物权 利润 合法 实力 成员 名义 所有 开展 那天 同一个 着眼于 正在', '1');
INSERT INTO `wy_search` VALUES ('10', '55', '1', '1490147714', 'SIM卡  内涵 话费', '1');
INSERT INTO `wy_search` VALUES ('11', '55', '2', '1490147790', '这是一本书  本书 这是', '1');
INSERT INTO `wy_search` VALUES ('13', '55', '4', '1490152817', '测试测试 测试测试测试测试 ', '1');
INSERT INTO `wy_search` VALUES ('14', '55', '5', '1490161478', '打发斯蒂芬 对对对 ', '1');
INSERT INTO `wy_search` VALUES ('18', '1', '13', '1490320414', '关于涉外民商事案件诉讼管辖若干问题的规定  案件 人民法院 规定 涉外 管辖 最高 中级 诉讼 问题 关于 纠纷 若干 受理 审理 有关 所在地 裁定 高级 第一 通过 人民 次会议 委员会 审判 共和 中华 开发区 经济技术 批准 国务院 应当 第二 判决 下列 设立 外国 申请 当事人 执行 仲裁 承认 强制 发布 法院 适用 知识产权 效力 贸易 第五 省份 发生 房地产 行政区 施行 监督 条款 为准 或者 通知 实施 处理 特别 已经 涉及 管辖权 地区 一致 司法解释 参照 继续 区域 民事诉讼法 根据 十九 如下 自治 中外 保护 公布 公告 二月 依法 正确 直辖市 侵权 合同 适用于 撤销 裁决 国际 第三 不服 指定 计划 其他 上述 确定 范围 审查', '1');
INSERT INTO `wy_search` VALUES ('19', '1', '14', '1490320470', '【权威发布】最新民商事审判指导意见公布 附《第八次民商  侵权 责任 或者 案件 请求 待遇 承担 医疗 死亡 社会保险 存在 单位 关于 标准 计算 审理 问题 资料 赔偿 规定 有权 根据 受害人 残疾 认定 生活 后果 当事人 证明 用人 关系 支付 明确 损害赔偿 损害 其他 侵权行为 对于 保护 不明 获得 机关 提起 造成 实际 如果 证据 人生 有关 一方 城镇 居民 按照 之间 过错 行为 劳动者 及其 综合 费用 相应 重要 具有 裁判 内容 正义 公平 主体 民事 预防 制裁 社会 促进 改变 不利 纠纷 没有 相关 采取 审查 人身 合理 法律 作出 之外 先行 已经 工伤 解释 构成 缴纳 基金 影响 真实性 十二 第三十 依法 可以 进行 保险 法规 范围 以及 格式 因果关系 致使 材料 规范 加以 能够 是否 患者 错误 不能 方式 内向 矛盾 明显 书写 事实 无法 司法解释 形式 当前 注意 以下 方面 统一 尺度 规律 更加 强调 实施 身份 无权 民事诉讼 主张 权利 赋予 鉴于 十八 亲属 形势 探索 公布 第八 民商 指导意见 审判 发布 最新 意义 成功 经验 进一步 下来 积累 总结 运用 以往 发生 确定 农村 法院 因素 来源 主要 收入 所在 地上 计入 减轻 支出 年度 人均 经常 权威 侵害 排除 消除 停止 第二 除外 依据 危险 自己 情况 结合 支持 不予 为由 提出 抗辩', '1');
INSERT INTO `wy_search` VALUES ('20', '1', '15', '1490320542', '企业家如何做好刑事风险防范？  企业家 风险 刑事 意识 防范 律师 诈骗 企业 事后 老总 底线 法律 涉及 因此 罪名 但是 是否 可以 预防 一旦 救济 自己 特别 法律风险 聘请 事前 专业 民企 应该 首先 优先 这种 全过程 经营 做好 如何 其他 一样 贯穿 决定 具有 能够 听取 符合 多数 要求 越来越 民事 留在 或者 非常 阶段 确定 力量 法律顾问 作为 行业 意见 行为 参考 的发展 逐渐 健全 显得 尤为 心里 重要 随着 等等 特殊 资格 主体 除了 限制 之外 职务 所以 几乎 贪污 受贿 年中国 究竟 犯罪 报告 国企 案例 收集 集资 有所 我国 现今 投入 增强 大多 维护 途径 通过 增加 那么 公众 吸收 非法 存款 出资 贷款 合同 信用卡', '1');
INSERT INTO `wy_search` VALUES ('21', '1', '16', '1490320608', '行政复议决定书的撰写要求有哪些  决定 机关 事实 申请 申请人 部分 时间 内容 收到 应当 行政 法律 问题 参加 规定 名称 理由 包括 作出 清楚 案件 具体 撰写 主要 情况 我们 必须 争议 格式 因此 人和 不必 合法 可以 依据 这部分 姓名 说明 必要 解决 行为 符合 标题 方面 适用 进行 当事人 原因 根据 掌握 审查 身份 证据 有的 认为 反映 受理 加以 判定 提出 权威性 任何 同时 论证 一定 以下 治安 具备 书写 重点 作为 年龄 不宜 这样 准确 性别 期限 要求 一般 双方 只要 表述 及其 简明 如果 不服 比如 告知 直接关系 过多 不得 材料 选择 紧密 突出 给予 条件 针对性 做到 相关 附加 联系 能够 行政机关 已有 复杂 否则 过于 提供 论述 第五 其他 阐述 足够 伤害 职业 最终 地址 履行 文中 发文 法宝 代表人 起诉 人民法院 结论 认定 职务 正文 请求 签名 文书 一起 他人 造成 困难 执行 避免 引起 争论 指出 大体 事项 综合 处罚 违反 余地 评判 送到 人们 超过 法定 及时 没有 单位 提起 早已 日内 地方 允许 予以 视为 不予 书面 第三 以及 比较 逻辑 首先 他们 哪些 编号 为了 其次 简单 代理人 委托 法人 组织 负责人 体现 通常 归纳 尽量 接近 保持 概括 然后 分析 实质 抓住 真实性 当然 如何 之间 篇幅 原则 不能 完全 全面 这时候 法律的 熟悉 程度 程序 组成 也就是说 方法 写作 水平 不住 碰到 实际 不同 一样 基础', '1');
INSERT INTO `wy_search` VALUES ('22', '1', '17', '1490320629', '高人民法院关于审理民事、行政诉讼中司法赔偿案件适用法  或者 执行 人民法院 赔偿 措施 财产 规定 应当 违法 其他 采取 保全 情形 程序 行政诉讼 民事 诉讼 依法 造成 损害 行为 公民 生效 请求 第二 解释 错误 及其 案件 组织 工作人员 依照 法律 第三十 计算 予以 过程 审理 期间 司法 包括 申请 委员会 强制 拍卖 责任 范围 职权 利息 解除 以及 处理 第三 存款 支付 发生 无法 物品 国家 恢复 损失 承担 第一 有关 以下 人和 根据 及其他 判决 裁定 贷款 三条 十八 行使 属于 返还 相关 结果 工作 严重 确定 扩大 受害人 相应 已经 是否 依据 第五 十二 适用 具有 法人 下列 侵犯 罚款 评估 超出 无关 除外 使用 死亡 伤害 一级 物权 十七 后果 立案 之一 最高 审查 合法 中华 关于 市场价格 人民 按照 设备 租金 开支 费用 必要 影响 侵权行为 期限 合同 过错 合理 作用 因素 金融机构 精神 共和 十四 结合 实际 身体 登记 履行 事实 存在 特定 不足以 季节 转移 实现 监管 职责 不宜 商品 长期 保存 贬值 及时 可以 担保 金额 确认 导致 终结 机关 十一 义务 流失 明显 计入 超过 的银行 同期 为准 房屋 施行 税费 水电 基准利率 定期 场地 年期 公布 中国人民银行 决定 发布 人民币 作出 司法解释 一致 之间 占有 证明 时效 的贷款 需要 状态 证据 改变 裁决 所致 缴纳 十九 撤销 提出 借贷 主张 符合 鉴定 约定 作为 因果关系 委托 材料 批准 国家机关 利率 现金 事项 的损失 致使 当事人 数额 发现 故意 优先 资产 如下 问题 若干 民事诉讼法 武器 他人 条件 违反 债权 财物 没有 不动产 实施 同一 重复 采取的 船舶 航空 办理 变更 所有权 不予 机构 机动车 通知 三十 该价格 弥补 采用 方式 不能 财产权 名誉 道歉 法定 所得 基本 职工工资 运营 维系 低于 价值 个体工商户 消除 个人 保管 提供 指定 紧急 获得 补偿 部分 减轻 原因 避险 第八 多种 必须', '1');
INSERT INTO `wy_search` VALUES ('23', '1', '18', '1490320725', '行政诉讼法的基本原则  原则 规定 法律 行政 人民法院 依法 基本原则 审判 进行 当事人 案件 民族 根据 具体 事实 独立 为准 实行 行政诉讼 审理 文字 诉讼 辩论 行为 地位 平等 审查 回避 语文 哪些 分别 公开 有权 摘要 监督 使用 人民检察院 合法性 有用 语言 权利 制度 行使 介绍 详细 下面 行政机关 合法 是否 干涉 个人 公民', '1');
INSERT INTO `wy_search` VALUES ('24', '1', '19', '1490320739', '行政诉讼受案范围具体有哪些  或者 行政机关 行政 认为 决定 履行 不服 人民法院 违法 其他 规定 受理 行政诉讼 协议 十二 土地 限制 强制 法定 拒绝 申请 许可 征收 侵犯 农村 依法 待遇 财产权 作出 补偿 答复 不予 开始 施行 案件 提起 同时 修订 具体 哪些 我国 诉讼 其中 费用 集资 要求 义务 支付 非法 没有 竞争 排除 承包 财物 自主权 经营权 土地经营权 权力 滥用 最低 房屋 法律 可以 法规 政府 解决 社会保险 所得 生活保障 十一 按照 变更 约定 经营 罚款 组织 期限 法人 公民 确认 关于 有关 下列 财产 许可证 措施 执行 范围 处罚 警告 职责 及其 草原 森林 自然资源 所有权 使用权', '1');
INSERT INTO `wy_search` VALUES ('25', '1', '20', '1490320788', '刑事案件如何撤销？  案件 侦查 撤销 或者 情形 规定 机关 诉讼 被告人 根据 犯罪 公安 人民法院 告诉 法定 审判 刑事诉讼法 终止 起诉 相同 阶段 死亡 如果 过程 无罪 某种 具有 发现 立案 经过 原来 否定 采取的 行为 摘要 人民检察院 对立 上述 裁定 之一 情况 驳回 加以 判决 证据 作出 证明 要求 已有 法院 家属 区别 例如 有关 程序 期限 情节 包括 显著 不大 危害 予以 依法 如何 已经 因为 存在 认为 犯罪嫌疑人 没有 其他 法律 刑事 追究 处理 刑法 时效 刑罚 依照 责任', '1');
INSERT INTO `wy_search` VALUES ('26', '1', '21', '1490322820', '什么是刑事诉讼一事不再理、禁止双重危险原则？  原则 危险 双重 不再 一事 同一 禁止 法院 作出 行为 生效 审判 裁判 不得 刑事诉讼 受到 法律 规定 另有 判决 前提 刑事诉讼法 主要 功能 被告人 司法 防止 我国 适用 一个 罪名 不能 处罚 摘要 行为人 滥用 国家 产生了 已经 第二 确立 程序 避免 被告 定性 事实 前后 通过 下面 详细 大陆法系 矛盾 维护 英美 介绍 秩序 保证 只要', '1');
INSERT INTO `wy_search` VALUES ('27', '1', '22', '1490324205', '企业法律顾问的种类和服务内容有哪些  企业 法律顾问 律师 法律 操作 实务 法律服务 公司 从事 专职 管理 事务所 工作 人员 合同 业务 相关 劳务 关系 事务 国家 劳动合同 顾问 一个 法律问题 有关 通过 签订 其他 聘请 制度 通常 这么 设置 助理 关于 员工 协助 执业 规范 依照 组织 产品 分为 规范化 聘用 成为 进行 证书 取得 种类 资格 解决方案 家企业 概念 说明 目录 离职 法律法规 依据 销售 案例 成果 流程 项目 索引 指引 风险管理 履行 协商 应收账款 结构 法律咨询 知识产权 部门 合法性 做好 意见 依法 提出 合理 行为 监督 保证 方面 诉讼 工商 仲裁 决策 公司经营 包括 各类 审核 保护 制定 协议 为公司 标准化 参与 解决 指导 提供 商业 商业秘密 介绍 兼职 详细 大家 内容 下文 前者 后者 聘为 司法考试 具有 资格考试 人事部 具体 成员 统一 考试 全国 哪些 合格 联合 执业资格 内部 注册 颁发 接受 经济 分析 需求 某些 过程 经营 结合 规定 的效率 效果 增加 经验 处理 针对 产物 所以 不得 两个 不能 自然人 以外 无形 有形 可以 指定 或者 特点', '1');
INSERT INTO `wy_search` VALUES ('28', '1', '23', '1490324231', '金融犯罪暗藏着刑事风险  金融 企业 犯罪 融资 互联网 刑事 平台 及时 措施 采取 风险 刑法 通过 投资者 关系 我国 被告 法律 侵害 管理制度 容易 发布 金融市场 活动 投资人 司法机关 更多 影响 借款 摘要 秩序 无法 范围 法律风险 随着 受到 应当 依照 规定 社会经济 信息 选择 及其 逐渐 以及 判断 作出 因素 不利于 法院 甚至可能 有时 重要 不仅 损失 弥补 积极 领域 超出 是否 取得 远远 司法 面的 从而 导致 快速 具体 联系 其他 通常 可能 降低 社会 相当 看重 情节 却是 一点 危害 程度 的困境 来说 至关重要 如果 有效 因此 能否 面对 来自 时常 陷入 这样 效果 详细 介绍 潜在 本文 编辑 接下来 快车 引发 行业 老板 隐患 困难 迅速 升温 诈骗 集资 哪些 的发展 发展 那么 行为 处罚 同时 其中 公众 存款 吸收 非法 涉嫌 就是 水面 实践 经验 必要 提及 笔者 来看 往往 网上 传播 互联 一旦 借助 吸引 一方 借贷 防范 冷静 转移 重心 人们 关注 分散 投资 对于 网络 角度 维权 如何 理性 宣传', '1');
INSERT INTO `wy_search` VALUES ('29', '1', '24', '1490324365', '有哪些行政复议决定终局裁决不能提起行政诉讼  决定 裁决 规定 最终 法律 作出 行政 机关 人民法院 公安 行政诉讼 国务院 人民政府 不服 提起 行为 或者 不能 提出 一级 申请人 省级 土地 可以 申请 处罚 行政机关 事项 诉讼 符合 判决 中华 哪些 解决 人民 共和 当事人 出境 调整 没有 这种 根据 决不 有的 公民 游行 就是 矛盾 自然资源 有利于 我国 考虑 拥有 起诉 申诉 第二 那么 具有 最后的 只能 相对人 向上 包括 外国人 第三十 罚款 依法 权益 依据 该法 十几 阶段 产生 花费 许可 影响 不了 撤销 实践 维持 政府 历经 另外 选择 还是 十九 外国 当地 直接 日内 日起 通知 接到 国外 前面 费用 一样 精力 时间 问题 反而 还有 社会稳定 不利于 大量 制度 全国 人大 及其 所说 这里 授权 制定 自治 直辖市 十四 规章 行政法规 如果 效力 下文 法定 期限 请看 解答 详细 内向 只要 体现 一经 特点 两个 但是 依照 确认 同时 限定 范围 渠道 救济 作为 剥夺 不适 需要 处理 最后 无论如何 即使 法院 社会 效率 使用权 设置 所有权 森林 草原 主要 基于 实行 提高 情况 实际 以下 首先 是否', '1');
INSERT INTO `wy_search` VALUES ('30', '1', '25', '1490324612', '行政诉讼法的基本原则  原则 规定 法律 行政 人民法院 依法 基本原则 审判 进行 当事人 案件 民族 根据 具体 事实 独立 为准 实行 行政诉讼 审理 文字 诉讼 辩论 行为 地位 平等 审查 回避 语文 哪些 分别 公开 有权 摘要 监督 使用 人民检察院 合法性 有用 语言 权利 制度 行使 介绍 详细 下面 行政机关 合法 是否 干涉 个人 公民', '1');
INSERT INTO `wy_search` VALUES ('31', '1', '26', '1490325953', '为什么企业一定要聘请法律顾问  律师 企业 法律顾问 法律 服务 专业 提供 事务 团队 聘请 情况 承诺 委托 可以 关系 问题 事件 法律服务 有关 判断 一个 选择 专业化 统一 合同 其他 没有 诉讼 义务 目标 市场 进行 程度 需要 要求 约定 如果 应该 信任 基于 了解 就是 才能 保证 仲裁 基础 作为 能够 对方 作用 自身 做出 本身 我们 合理 佣金 支付 建立 紧密 提出 执业 事项 是否 处理 支持 立体 事务所 考察 意见 接受 人员 组织 法人 包括 内部 多少 一定 书面 客户 根据 办理 继续 信息 工作 期限 双方 保障 良好 专项 调查 出现 内容 量化 技术 整体 具体 什么样 方面 辅助 基本 因为 意义 前提 背景 为基础 文化 不仅 沟通 决策 业务 顾问 保密 出具 行业 以及 不是 依法 同时 如何 企业管理 经济 参与 重大 代理人 防范 纠纷 想像 准确 保守 案件 不知 信心 代理 结果 为什么 经营管理 不足 表达 秘密 正是 真实 认可 我国 目前 全国 已有 万人 统计 任何 特定 规章制度 这是 环境 商业秘密 谈判 答案 科学 履行 广阔 那么 超过 设置 良心 参考 同志 完成 只有 一般 方案 收费 机制 为此 某种 业务范围 得以 凝聚力 主要 法律法规 达成 同一个 加上 标志 民事 业内 机构 相关 行政 是以 常常 因此 认识 合作 而且 形成 涉及 一些 必要 文书 协助 形式 减少 规划 常年 尽量 专业知识 具有 策略 市场经济 条件 时间 其它 直接 充当 咨询 有着 明显 优势 多数 通过 解决 策划 签订 公民 容易 实际 范围 发挥 终止 重要 介绍 规则 保持 说是 职能部门 联系 另一方面 规定 一致 第一 把握 约束 共识 注意 聘用 桌面 投资 限度 获得 对待 高效 这些 回报 最大 纳入 着重 的影响 部分 弥补 得到 由于 共享 社会 目的 既是 知道 一旦 实质 详细 取得 报酬 不妨 谋取 支出 员工 福利 上述 因素 家企业 一方面 利益 资源 主动 积极的 对于 付出 产生 共同 如下 达成共识 程序 锁定 大家 成为 操作 以期 头上 不得 话题 国家 利害 大多数 过程 无关 即使 许多 精确 限于 为人 个人 隐私 环节 冷静 不负 面对 风险 怎样 强调 制度 表述 负有 特权 行为规范 事先 不能 赋予 权利 称之为 英美 观点 不会 其实 的说法 若干 成功案例 等同于 就是这样 此类 意思 取决于 实践 第三 不管 首选 列举 所以 人们 监督 分歧 常见 鉴于 找到 充分 这样 职业 是不是 一点 自己 依据 披露 水平 立法 完全 司法 下文 收到 项目 税务 原本 便于 财务 合法 公告 分为 分类 规避 压力 造成 起到 运行 可行性 名义 证据 固定 身份 有权 远远 前列 地区 北京 万余 左右 逐步 加强 需求 适应 结束 应当 担任 声明 依照 职责 法律意见书 见证 发布 遇到 随时 改制 规范 经营 健全 经营风险 不同 助手 领导人 维护 活动 尚未 准备 制定 资料 争议 调解 各类 参加 优先 在于 登记 意识 降低 增强 调查报告 法律风险 远景 某些 局部 战略 帮助 贯通 工商 更好 灵活 应用 事前 设计 予以 走出 最佳 效果 审核 为了 相同 像是 未必 医生 一样 设立 大小 研究 衡量 数量 历史 审查 影响 麻烦 法律咨询 证明 足以 病人 分工 持久 贯彻 动力 核心 思想 行为 有形 无形 除了 选用 结合 真正 换言之 只能 必须 具备 所谓 能力 业绩 在行 有人 现在 社会生活 法规 领域 完善 法律的 存在 处处 悄然 运用 手段 阶段 兴起 的空间 生活 专业性 开展 复杂 空间 哪个 起码 首先 必然 细分 发现 修改 下来 天上 出来 那里 而是 精通 论证 重大事项 特点 这方面 针对 构成', '1');
INSERT INTO `wy_search` VALUES ('32', '1', '27', '1490326008', '企业法律顾问：可撤销合同几大情形  误解 重大 合同 意思 表示 当事人 错误 认识 内心 内容 发生 行为 或者 欺诈 成立 公平 效果 过失 撤销 一致 构成 订立 变更 造成 规定 自己 一方 情形 一般 区别 对方 可能 欠缺 要件 人民法院 情况 请求 影响 由于 质量 义务 真实 损失 权利 如下 法律 行为人 认定 主观 直接 确定 作为 后果 如果 意愿 主要 原因 与其 有权 产生 履行 不能 价值 因而 受到 所谓 不知 合同法 我国 目的 条款 下列 必须 要求 利用 在于 具备 根本 同时 存在 不得 较大 注意 无效 没有 利益 因此 为基础 动机 结果 数量 通常 称为 主张 可以 当作 特征 性质 真正 特定 的性质 问题 身份 缺陷 应当 买卖 的影响 二者 交易 之间 面的 并未 故意 各方 包含 陷入 极大 具体 简洁 因素 状况 活动 标准 习惯 实现 承担 分别 不同 考虑 享受 一起 并且 当成 感情 包括 司法 实践 来看 信用 委托 技术 物品 某些 以及 能力 作出 优势 方式 经验 地点 实施 等内容 期限 联系 一方面 导致 给予 救济 这种 此外 另一方面 失误 包装 他人 例外 具有 不是 其他 就是 后者 前者 见解 缺乏 必要 成为 用语 使用 基于 能够 对象 知识 技能 信息 按照 事实 损害 明确 重要 违背 手段 法律顾问 若干 民法 理论 基本 解释 意见 品种 规格 关系 正是 谨慎 但是 两点 并非 认为 学者 再次 而且 为此 形成 程度 那样 表达 出来 民法典 范围 有所 限制 超出 客观 偶然 双方 原则 企业 授予 这样 相对 理由 确认 依照 意识 其次 化为 应有 首先 衡量 差别', '1');
INSERT INTO `wy_search` VALUES ('33', '1', '28', '1490326025', '设立公司为什么要请法律顾问？  律师 法律顾问 聘请 企业 合同 法律 公司 工作 事务 业务 法律服务 需要 决定 应当 提供 顾问 签订 或者 事务所 担任 经营 方面 诉讼 个人 活动 是否 行为 管理 能够 规范 费用 因素 方式 具有 一个 选择 处理 规定 完善 治理结构 期限 规模 法律的 重要 意见 利益 其他 时间 审查 仲裁 质量 收费 根据 情况 专业 作为 单位 责任 能力 可以 了解 参加 承担 委托 名称 管理者 争取 应聘 必须 具备 双方 并购 代理 数量 调整 结构 有关 效益 多少 实际 如何 类型 明确 社会 需求 有效 难以 内容 法律问题 调解 过程 作用 公司经营 使得 同时 以下 正确 造成 执业 包括 结算 起到 要求 参与 条件 办法 之上 试图 控制 建议 清晰 结果 忠实 素质 许多 深刻 临时 现象 定期 服务 过多 语言 倾听 诚实 联络 目前 丰富 实务 甚至 扎实 安排 熟悉 经验 积极 创新 几十 精神 快捷 态度 主动 人格 基本 理解 从事 人才 认真 赔偿 搞好 注意事项 哪些 优惠 解除 协作 变更 人身 生效 我国 凡是 职务 姓名 物质 负责 参考 主要 标准 保证 地址 违约 签署 组织结构 严格 证书 管理制度 充分 充当 确定 一定 充足 必要 方法 许可证 及时 注意 以及 指导 监督 几个问题 合理 透明度 不是 进行 术语 如果 现实 股东 企业制度 签约 谈判 修改 起草 现代 符合 减少 等等 加以 这些 避免 陷阱 员工培训 专项 为公司 上述 完成 解决 债务 风险 化解 改制 资产 债权 项目 管理模式 保护 自己 组织 法人 专业知识 技能 面的 多方 自然人 接受 为什么 办理 维护 依法 专业性 时刻 时候 起步 持股比例 分工 的损失 巨大 的框架 允许 之内 超越 产生 上限 实现 最大化 职业 各种 综合 角色 独特 技巧 自身 依据 不会 反之 获得 优劣 收取 道德 修养 混乱 较为 才能 综合能力 判断 市场 如今 高低 水平 后果 因而 首要 优秀 提高 有所 复杂性 复杂 决策 帮助 得到 来看 程度 基于 一般来说 经济活动 迫切 主体 保持 现状 评价 认为 设立 变化 寻求 经营者 毫无疑问 设计 大规 扩大 适应', '1');
INSERT INTO `wy_search` VALUES ('35', '1', '30', '1490326596', '民商事案件申请再审的注意事项  申请 提交 申请人 或者 材料 生效 裁定 案件 应当 判决 名称 诉讼 法律 证明 发生 已经 注意事项 请求 身份 依据 证据 主要 效力 联系方式 组织 负责人 法院 其他 法人 自然人 姓名 委托 裁判 监督 当事 程序 重新 进行 作出 人民法院 审判 如下 纠正 同时 民事 错误 依照 当事人 人为 审理 理由 受理 签名 文本 以下 授权 他人 文书 一审 事实 代理人 过程 支持 日期 单一 使用 电子 事项 允许 司法解释 属于 民事诉讼法 第一 列举 十九 对方 执行 不服 可以 依法 停止 一级 提出 按照 单位 工作 职务 撤销 具体 变更 职业 民族 人数 下列 年龄 性别 以及', '1');
INSERT INTO `wy_search` VALUES ('36', '1', '31', '1490326677', '如何办理涉外民商事诉讼中的文件公证认证  公证 认证 文件 证据 当事人 委托 办理 法院 手续 规定 笔者 需要 授权 我国 文书 签署 境外 合同 要求 问题 身份 电子邮件 程序 可以 如果 内容 领域 费用 而言 有的 上诉 以为 公司 比如 难以 外国 对于 真实性 代理 没有 实践 情况 外交 部门 工作日 各国 或者 国内 关于 民事诉讼法 诉讼 存在 是否 还是 应当 格式 证明 提交 法律 最高 中国的 书记 一审 本人 人民法院 已经 案件 意见 不同 这样 公约 法官 做法 一致 作为 时间 一些 若干 发票 履行 个国家 承担 形成 登记 地区 差异 一点 哪些 确认 以及 因为 完成 代理人 来说 凭证 起诉 自己 收费 复杂 认为 区分 申请 申请人 货物 既然 强制 个月 司法 邮件 港口 如何 一般 拿到 本身 使用 损失 所知 其他 额外 面前 国家 数据 接受 针对 提出 高级 必须 前面 证件 个人 官员 出具 一次 机关 提单 尽可能 所以 麻烦 事情 介绍 机构 民事诉讼 涉外 加入 还有 目前 注意 开始 方面 文字 情形 真实 政府 声明 规则 必要 银行 紧急 属于 代表 类似 涉及 一方 执行 后续 证书 发生 律师 适用 取消 相同 大陆 来源于 等于 收取 那样 效率 当地 就算 专用 海峡 交流 通过 基金会 有限公司 法律服务 港澳台 负责 相比 简单 资格 具有 各省 协会 伊拉 超过 负担 对方 支出 速度 极大 期限 有效 案例 中介 给出 公开 这方面 坚持 行政 缔约国 来自 依照 私人 放在 日期 批准 诸如 正式 接轨 国际 自然人 人为 当事 适合 为公司 由于 简化 总体 资料 判断 签证 这儿 修改 当然 尚未 展开 按照 法定 符合 做好 现行 遗憾 港澳 经过 提及 本文 极为 便利 包括 已有 高效 前往 见证 急需 美国的 的申请 启动 先行 能否 答复 一个 曾经 这项 熟悉 非常 变得 工作 并非 远高于 往往 客户 尽快 旅行 停留 短期 无须 分析 增加 下来 星期 否则 后来 一类 扩大 这种 返回 其次 注明 通知 行政机关 确定 保险 被告 关键 依据 容易 民事 办公 临时 只有 不服 不能 来得 机会 丧失 基于 签约 服务商 互联网 某个 服务器 用户 登陆 地点 任何 存储 电子 收到 造成 签订 过程 大家 互联 模糊 界限 网上 判决 具体 明了 似乎 前述 除了 主体 商业 信息 经验 办案 在香港 在中国 相关 那么 结合 遇到 怎么 法人 权利 阶段 覆盖 甚至 建议 不少 随时 进入 一旦 考虑 尽管 董事会决议 身份证 这部分 原告 法律程序 不可或缺 网络 源于 一起 所有 示范 人和 目的 大致 统计 对此 显然 希望 成本 传真 各种 充分 第三 行政管理 外交部 联邦 上述 使馆 包含 第一 单位 第二 通常 可能 说明 看到 发现 还要 障碍 普及 不要 发布 赞同 认定 随着 界面 清楚 位于 不同国家 很大 识别 确实 解答 能够 行为 并未 首先 有些 保证 施加 有所 进行 这些 有人 毕竟 不是 受理 更好 上海市 国外', '1');
INSERT INTO `wy_search` VALUES ('37', '1', '32', '1490327191', '国内民商事仲裁协议效力司法确认  仲裁 人民法院 协议 确认 效力 规定 当事人 一方 基层 案件 法院 或者 请求 作出 受理 申请 没有 无效 裁定 管辖 应当 存在 包括 中级 程序 内容 诉讼 条款 有效 上述 纠纷 是否 关于 异议 起诉 选择 国内 问题 明确 决定 法律 发生 合同 简易 书面 最高 依法 地方 根据 可以 事项 审理 如果 享有 以下简称 之间 同时 民事诉讼法 司法 提起 冲突 其他 若干 全面 所在地 只能 意见 达成 不予 指定 民事诉讼 人民 主管 便于 认为 被告 中华 共和 一个 依照 约定 制度 通知 接受 所谓 权限 有权 情形 作为 撤销 争议 权益 财产 提出 超越 对此 家庭 失效 笔者 执行 无法 裁决 立案 矛盾 否认 否定 分开 前提 理由 导致 上看 几个问题 尚未 最低 婚姻 平行 专门 处理 终止 缺席 判决 影响 恢复 送达 高等 四级 审判 原则 符合 这不 造成 实际上 所在 消灭 区分 分为 该国 裁判 该项 主张 完整 当事 人和 有关 体现 权利 监督 机构 作用 因此 有些 另一方面 现行 赋予 形式 关键词 订立 本文 制定 独立的 方式 以及 提交 自愿 之后 之前 满足 实践 第一 适用 所指 解释 此处 十一 告知 不明 可以看出 除外 原告 级别 疑难 进行 三个 如下 需要 为此 讨论 以求 由此可见 机关 如何 同仁 司法解释', '1');
INSERT INTO `wy_search` VALUES ('38', '1', '33', '1490327236', '最高法院调整高院中院一审民商事案件标准  案件 人民法院 管辖 标的 以上 万元 高级 中级 通知 亿元 法院 调整 一审 标准 最高 发出 适用 第一 诉讼 民事诉讼法 级别 规定 云南 福建 四川 内蒙 安徽 辽宁 甘肃 指出 军事 决定 审理 宁夏 贵州 生产 建设 陕西 黑龙江 定位 四级 审判 合理 关于 广东 修改 准确 明确 相关 北京 受理 行政 江苏 省级 当事人 法律 上级 自行 类型 普遍 十八 意义 可以 依照 第三 下级 知识产权 涉外 疑难 涉及 根据 港澳台 强调 此次 或者 不在 解放军 单位 婚姻 一方 实施 日起 近日 职能 继承 家庭 群体性 纠纷 一般 基层 以及 劳动争议 人身 损害赔偿 交通事故 重大', '1');

-- ----------------------------
-- Table structure for wy_search_keyword
-- ----------------------------
DROP TABLE IF EXISTS `wy_search_keyword`;
CREATE TABLE `wy_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_search_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for wy_session
-- ----------------------------
DROP TABLE IF EXISTS `wy_session`;
CREATE TABLE `wy_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_session
-- ----------------------------
INSERT INTO `wy_session` VALUES ('kea3uugs66s35kkt7pse91fut7', '1', '120.197.17.140', '1490664833', '1', '0', 'admin', 'index', 'public_session_life', 'userid|s:1:\"1\";roleid|s:1:\"1\";wy_ssud|s:6:\"tE4gRM\";lock_screen|i:0;code|s:4:\"gngd\";');

-- ----------------------------
-- Table structure for wy_site
-- ----------------------------
DROP TABLE IF EXISTS `wy_site`;
CREATE TABLE `wy_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `infos` mediumtext,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_site
-- ----------------------------
INSERT INTO `wy_site` VALUES ('1', '志公恒律师服务网', '', 'http://www.fl880.com/', '合肥民商事案件代理律师|合肥刑事风险防范律师|合肥行政复议和诉讼律师|合肥中小企业法律顾问律师-志公恒信律师服务网', '合肥民商事案件代理律师,合肥刑事风险防范律师,合肥行政复议和诉讼律师，合肥中小企业法律顾问律师,志公恒信律师服务网', '志公恒信律师服务宗旨：传播法律知识，提高法律意识，预防法律风险解决法律纠纷，提供民事类，刑事类，行政类等多类法律服务，咨询热线：0551-62370148', '', 'default', 'default', '{\"picture\":\"\",\"name\":\"\\u5218\\u5723\\u6d77\\u5f8b\\u5e08\",\"area\":\"\\u5408\\u80a5\\u5e02\\u7476\\u6d77\\u533a\\u51e4\\u9633\\u897f\\u8def\\u6052\\u4e30\\u56fd\\u9645\\u5927\\u53a61106\\u5ba4\",\"license\":\"\",\"company\":\"\",\"duty\":\"\",\"copyright\":\"Copyright \\u00a9 2017 www.fl880.comAll Rights Reserved \\u7696ICP\\u590716025197\\u53f7-1\",\"email\":\"lshyn@163.com\",\"mobile\":\"13955183488\",\"qq\":\"1026615417\",\"tel\":\"0551-62370148\",\"fax\":\"\",\"address\":\"\",\"postcode\":\"\",\"weixin_img\":\"http:\\/\\/www.fl880.com\\/uploadfile\\/2017\\/0328\\/20170328092611692.jpg\",\"qq_weibo\":\"\",\"sina_weibo\":\"\"}', '{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"1\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"skins\\/images\\/water\\/\\/statics\\/images\\/water\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}', '51e3092e-e66b-11e5-b74c-04848a28274f');

-- ----------------------------
-- Table structure for wy_sms_report
-- ----------------------------
DROP TABLE IF EXISTS `wy_sms_report`;
CREATE TABLE `wy_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sms_report
-- ----------------------------

-- ----------------------------
-- Table structure for wy_special
-- ----------------------------
DROP TABLE IF EXISTS `wy_special`;
CREATE TABLE `wy_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_special
-- ----------------------------

-- ----------------------------
-- Table structure for wy_special_c_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_special_c_data`;
CREATE TABLE `wy_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_special_c_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_special_content
-- ----------------------------
DROP TABLE IF EXISTS `wy_special_content`;
CREATE TABLE `wy_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_special_content
-- ----------------------------

-- ----------------------------
-- Table structure for wy_sphinx_counter
-- ----------------------------
DROP TABLE IF EXISTS `wy_sphinx_counter`;
CREATE TABLE `wy_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sphinx_counter
-- ----------------------------

-- ----------------------------
-- Table structure for wy_sso_admin
-- ----------------------------
DROP TABLE IF EXISTS `wy_sso_admin`;
CREATE TABLE `wy_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sso_admin
-- ----------------------------
INSERT INTO `wy_sso_admin` VALUES ('1', 'admin', '742c249671fb64f1e73dbfc8d6ad5c0e', 'sfNcSq', '1', '1490261219', '127.0.0.1');

-- ----------------------------
-- Table structure for wy_sso_applications
-- ----------------------------
DROP TABLE IF EXISTS `wy_sso_applications`;
CREATE TABLE `wy_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'wysso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sso_applications
-- ----------------------------
INSERT INTO `wy_sso_applications` VALUES ('1', 'wycms', 'wycms', 'http://www.wycms.cn/', 'adT5dBZS2tpcHpypNeTHFCAF4QKiwvoC', '', 'api.php?op=wysso', 'utf-8', '1');

-- ----------------------------
-- Table structure for wy_sso_members
-- ----------------------------
DROP TABLE IF EXISTS `wy_sso_members`;
CREATE TABLE `wy_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sso_members
-- ----------------------------
INSERT INTO `wy_sso_members` VALUES ('1', '用户01', '8023b147239785ebdf485ae3967ebe89', '7N8Aa1', '749908550@qq.com', '120.197.17.140', '1490335603', '60.205.28.210', '1490663335', 'wycms', 'app', '0', '0');
INSERT INTO `wy_sso_members` VALUES ('2', '律师01', '48e25857ef26c6b4a52536364d0bff6e', 'qEbGwk', 'guanxiaosa@wanglv.com', '120.197.17.140', '1490335688', '60.205.28.210', '1490663147', 'wycms', 'app', '0', '0');
INSERT INTO `wy_sso_members` VALUES ('3', '用户02', 'f9e2bba026bcb361c3c1a08588a4f5a1', 'RdQBf6', 'chenjunfang@wanglv.com', '120.197.17.140', '1490335814', '0', '1490335814', 'wycms', 'app', '0', '0');
INSERT INTO `wy_sso_members` VALUES ('4', '用户03', 'f67b76142664d9799ff252c451544497', 'K9yiBw', '13413546691@163.com', '120.197.17.140', '1490337277', '0', '1490337277', 'wycms', 'app', '0', '0');
INSERT INTO `wy_sso_members` VALUES ('5', '用户04', 'f67adbdacd79ae1db341a0b105db260c', 'Mp3My9', 'liweihao@wanglv.com', '120.197.17.140', '1490338396', '0', '1490338396', 'wycms', 'app', '0', '0');

-- ----------------------------
-- Table structure for wy_sso_messagequeue
-- ----------------------------
DROP TABLE IF EXISTS `wy_sso_messagequeue`;
CREATE TABLE `wy_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sso_messagequeue
-- ----------------------------
INSERT INTO `wy_sso_messagequeue` VALUES ('5', 'member_add', '0', '1', '{\"username\":\"howe\",\"password\":\"6550211ff11e255608cb91840519a980\",\"email\":\"1026615417@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489543804\",\"lastdate\":\"1489543804\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"xjVhz7\",\"ucuserid\":\"0\",\"uid\":\"1\",\"action\":\"member_add\"}', '1489543804', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('6', 'member_add', '0', '1', '{\"username\":\"hh\",\"password\":\"29e17b6b53c304a1701bd280dca36cfc\",\"email\":\"10266154111@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489570014\",\"lastdate\":\"1489570014\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"SXi5ht\",\"ucuserid\":\"0\",\"uid\":\"2\",\"action\":\"member_add\"}', '1489570014', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('7', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"2\"},\"action\":\"member_delete\"}', '1489570072', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('8', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"1\"},\"action\":\"member_delete\"}', '1489570121', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('9', 'member_add', '0', '1', '{\"username\":\"howe\",\"password\":\"7ffaa9a6b72e43dce25a90a9891d7d3f\",\"email\":\"1026615417@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489624709\",\"lastdate\":\"1489624709\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"6QL8w4\",\"ucuserid\":\"0\",\"uid\":\"3\",\"action\":\"member_add\"}', '1489624709', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('10', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"5cb152a81c2d63933c1c16daba626927\",\"random\":\"6QL8w4\",\"uid\":\"3\",\"action\":\"member_edit\"}', '1489632464', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('11', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"7ffaa9a6b72e43dce25a90a9891d7d3f\",\"random\":\"6QL8w4\",\"uid\":\"3\",\"action\":\"member_edit\"}', '1489632502', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('12', 'member_add', '0', '1', '{\"username\":\"howe\",\"password\":\"3c5bac8fd85a801f1f5dc851311de288\",\"email\":\"1026615417@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489635321\",\"lastdate\":\"1489635321\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"X45D6h\",\"ucuserid\":\"0\",\"uid\":\"4\",\"action\":\"member_add\"}', '1489635321', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('13', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"93d01874df415f68be1f11e9aeffacf1\",\"random\":\"X45D6h\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489636534', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('14', 'member_add', '0', '1', '{\"username\":\"guanxiaosa\",\"password\":\"1e3f2aa910778b110b15805480edb1fb\",\"email\":\"749908550@qq.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1489642834\",\"lastdate\":\"1489642834\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"7jL8ma\",\"ucuserid\":\"0\",\"uid\":\"5\",\"action\":\"member_add\"}', '1489642834', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('15', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"36169f6899e60d79466cc5c977210e05\",\"random\":\"X45D6h\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489642944', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('16', 'member_add', '0', '1', '{\"username\":\"howe11\",\"password\":\"170a3fac26fef53f0980234e44880400\",\"email\":\"10266456@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489646046\",\"lastdate\":\"1489646046\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"wb5pLF\",\"ucuserid\":\"0\",\"uid\":\"6\",\"action\":\"member_add\"}', '1489646046', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('17', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"4d057c39a1cb31116648c8f9954c2bf1\",\"random\":\"X45D6h\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489646444', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('18', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"3c5bac8fd85a801f1f5dc851311de288\",\"random\":\"X45D6h\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489646464', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('19', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489650568', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('20', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"9c194482d139d7b38db2e2f1f465f714\",\"random\":\"X45D6h\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489651605', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('21', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"3c5bac8fd85a801f1f5dc851311de288\",\"random\":\"X45D6h\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489651627', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('22', 'member_add', '0', '1', '{\"username\":\"howe123\",\"password\":\"e97db56110930ba42ca7c9580c0551da\",\"email\":\"65456456456@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489657248\",\"lastdate\":\"1489657248\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"A24PYf\",\"ucuserid\":\"0\",\"uid\":\"7\",\"action\":\"member_add\"}', '1489657248', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('23', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489972974', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('24', 'member_add', '0', '1', '{\"username\":\"liweihao\",\"password\":\"8c231eb8ace7ec82d37f18df3320a981\",\"email\":\"102661547@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489988253\",\"lastdate\":\"1489988253\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"qxgkVb\",\"ucuserid\":\"0\",\"uid\":\"8\",\"action\":\"member_add\"}', '1489988253', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('25', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"8\",\"action\":\"member_edit\"}', '1489989387', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('26', 'member_add', '0', '1', '{\"username\":\"howe1111\",\"password\":\"2f16540f5047df2bb70548be23acb4e9\",\"email\":\"56487457@q.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489989885\",\"lastdate\":\"1489989885\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"Iue3u6\",\"ucuserid\":\"0\",\"uid\":\"9\",\"action\":\"member_add\"}', '1489989885', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('27', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"9\",\"action\":\"member_edit\"}', '1489990289', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('28', 'member_add', '0', '1', '{\"username\":\"howe1112\",\"password\":\"bf6a8eb67ba0771507e1bc9aaec88eeb\",\"email\":\"165464878@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1489990411\",\"lastdate\":\"1489990411\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"HkwGRT\",\"ucuserid\":\"0\",\"uid\":\"10\",\"action\":\"member_add\"}', '1489990411', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('29', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489993808', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('30', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1489993837', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('31', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"email\":\"1026615471@qq.com\",\"uid\":\"8\",\"action\":\"member_edit\"}', '1489998230', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('32', 'member_add', '0', '1', '{\"username\":\"\\u666e\\u901a\\u4f1a\\u5458\\u6d4b\\u8bd51\",\"password\":\"c608a763d14b1cf989f08530b5b01a5b\",\"email\":\"guanxiaosa@wanglv.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490169856\",\"lastdate\":\"1490169856\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"q1h3gg\",\"ucuserid\":\"0\",\"uid\":\"11\",\"action\":\"member_add\"}', '1490169856', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('33', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"5\"},\"action\":\"member_delete\"}', '1490170809', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('34', 'member_add', '0', '1', '{\"username\":\"\\u666e\\u901a\\u4f1a\\u5458\\u6d4b\\u8bd52\",\"password\":\"9d28474cdf3dd2baa8dbafa8e8c05b25\",\"email\":\"chenjunfang@wanglv.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490170878\",\"lastdate\":\"1490170878\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"zH38BT\",\"ucuserid\":\"0\",\"uid\":\"12\",\"action\":\"member_add\"}', '1490170878', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('35', 'member_add', '0', '1', '{\"username\":\"\\u666e\\u901a\\u4f1a\\u5458\\u6d4b\\u8bd53\",\"password\":\"b1083fb16be2c52bb4362cfa22b2d2e4\",\"email\":\"2853915111@qq.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490171526\",\"lastdate\":\"1490171526\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"Vaf4e5\",\"ucuserid\":\"0\",\"uid\":\"13\",\"action\":\"member_add\"}', '1490171526', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('36', 'member_add', '0', '1', '{\"username\":\"howe121\",\"password\":\"66b1ba114167cdaa4648c78247e4e18c\",\"email\":\"102661554@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490171947\",\"lastdate\":\"1490171947\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"HYMI8l\",\"ucuserid\":\"0\",\"uid\":\"14\",\"action\":\"member_add\"}', '1490171947', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('37', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"12\",\"1\":\"11\",\"2\":\"13\"},\"action\":\"member_delete\"}', '1490171971', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('38', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"14\"},\"action\":\"member_delete\"}', '1490171985', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('39', 'member_add', '0', '1', '{\"username\":\"howe111\",\"password\":\"2112922f3ffe528b3461e12e54d60b74\",\"email\":\"10545645@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490172526\",\"lastdate\":\"1490172526\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"npJs6D\",\"ucuserid\":\"0\",\"uid\":\"15\",\"action\":\"member_add\"}', '1490172526', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('40', 'member_add', '0', '1', '{\"username\":\"howe1112\",\"password\":\"4f984d2b838443294d8f28929906936c\",\"email\":\"549875878@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490173109\",\"lastdate\":\"1490173109\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"iFXvXm\",\"ucuserid\":\"0\",\"uid\":\"16\",\"action\":\"member_add\"}', '1490173109', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('41', 'member_add', '0', '1', '{\"username\":\"liwei\",\"password\":\"e71c7201be07af514e8c8fa97e8f9db9\",\"email\":\"102661541@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490173189\",\"lastdate\":\"1490173189\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"i68YDM\",\"ucuserid\":\"0\",\"uid\":\"17\",\"action\":\"member_add\"}', '1490173189', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('42', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"16\",\"1\":\"17\"},\"action\":\"member_delete\"}', '1490173506', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('43', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1490173634', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('44', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"8\",\"action\":\"member_edit\"}', '1490173668', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('45', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1490173705', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('46', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"8\",\"action\":\"member_edit\"}', '1490173715', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('47', 'member_add', '0', '1', '{\"username\":\"howe1111\",\"password\":\"47d36c84bd216551735863f327712fe2\",\"email\":\"102661541@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490175019\",\"lastdate\":\"1490175019\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"319g9m\",\"ucuserid\":\"0\",\"uid\":\"18\",\"action\":\"member_add\"}', '1490175019', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('48', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"18\"},\"action\":\"member_delete\"}', '1490175375', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('49', 'member_add', '0', '1', '{\"username\":\"howe1111\",\"password\":\"ed8b25688b6f6fd843a5d35e91363378\",\"email\":\"102661541@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490175401\",\"lastdate\":\"1490175401\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"tqpfy3\",\"ucuserid\":\"0\",\"uid\":\"19\",\"action\":\"member_add\"}', '1490175401', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('50', 'member_add', '0', '1', '{\"username\":\"howe123123\",\"password\":\"c5589fc600a915efcb1ce0e88e4ad598\",\"email\":\"1026615@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490175755\",\"lastdate\":\"1490175755\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"iFWXNk\",\"ucuserid\":\"0\",\"uid\":\"20\",\"action\":\"member_add\"}', '1490175755', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('51', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"19\",\"1\":\"20\"},\"action\":\"member_delete\"}', '1490175773', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('52', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"8\",\"action\":\"member_edit\"}', '1490175864', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('53', 'member_add', '0', '1', '{\"username\":\"json\",\"password\":\"c5c8f67fe02f7344c11f344be87b091f\",\"email\":\"1025454@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490176166\",\"lastdate\":\"1490176166\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"5M56BM\",\"ucuserid\":\"0\",\"uid\":\"21\",\"action\":\"member_add\"}', '1490176166', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('54', 'member_add', '0', '1', '{\"username\":\"lawyer\",\"password\":\"7738778f5965381a301caecf00fe6ec2\",\"email\":\"569875454@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490176328\",\"lastdate\":\"1490176328\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"U6ruav\",\"ucuserid\":\"0\",\"uid\":\"22\",\"action\":\"member_add\"}', '1490176328', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('55', 'member_add', '0', '1', '{\"username\":\"lawyer\",\"password\":\"1958a957c06bb28c6c2ec47b3d54f5b9\",\"email\":\"548457845@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490176661\",\"lastdate\":\"1490176661\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"xiZdQ7\",\"ucuserid\":\"0\",\"uid\":\"23\",\"action\":\"member_add\"}', '1490176661', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('56', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"23\"},\"action\":\"member_delete\"}', '1490229419', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('57', 'member_add', '0', '1', '{\"username\":\"\\u666e\\u901a\\u4f1a\\u5458\\u6d4b\\u8bd51\",\"password\":\"c935e44b4691cd9732d6a5f102dc57d6\",\"email\":\"749908550@qq.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490231524\",\"lastdate\":\"1490231524\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"2brLY5\",\"ucuserid\":\"0\",\"uid\":\"24\",\"action\":\"member_add\"}', '1490231524', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('58', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"4\",\"1\":\"8\"},\"action\":\"member_delete\"}', '1490232540', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('59', 'member_add', '0', '1', '{\"username\":\"howe\",\"password\":\"5e4066f61bb086c6babb92eb29af264b\",\"email\":\"1026615417@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490232582\",\"lastdate\":\"1490232582\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"P6xbrN\",\"ucuserid\":\"0\",\"uid\":\"25\",\"action\":\"member_add\"}', '1490232582', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('60', 'member_add', '0', '1', '{\"username\":\"\\u5f8b\\u5e08\\u4f1a\\u5458\\u6d4b\\u8bd51\",\"password\":\"df7bf60bb132b1312fcd9adf3f256db8\",\"email\":\"2851026656@qq.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490235241\",\"lastdate\":\"1490235241\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"bbx1uG\",\"ucuserid\":\"0\",\"uid\":\"26\",\"action\":\"member_add\"}', '1490235241', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('61', 'member_add', '0', '1', '{\"username\":\"\\u666e\\u901a\\u4f1a\\u5458\\u6d4b\\u8bd52\",\"password\":\"5da8c30b9710babd6c967e286629fdd8\",\"email\":\"guanxiaosa@wanglv.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490235591\",\"lastdate\":\"1490235591\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"UVaevy\",\"ucuserid\":\"0\",\"uid\":\"27\",\"action\":\"member_add\"}', '1490235591', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('62', 'member_add', '0', '1', '{\"username\":\"\\u666e\\u901a\\u4f1a\\u5458\\u6d4b\\u8bd53\",\"password\":\"87a1b3657b13b06a115f709edf91218d\",\"email\":\"chenjunfang@wanglv.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490235693\",\"lastdate\":\"1490235693\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"hSdDy7\",\"ucuserid\":\"0\",\"uid\":\"28\",\"action\":\"member_add\"}', '1490235693', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('63', 'member_add', '0', '1', '{\"username\":\"\\u666e\\u901a\\u4f1a\\u5458\\u6d4b\\u8bd54\",\"password\":\"dddbbd2e5d98ed0281e7f99bafc9e043\",\"email\":\"1041805683@qq.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490236064\",\"lastdate\":\"1490236064\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"A4V2B8\",\"ucuserid\":\"0\",\"uid\":\"29\",\"action\":\"member_add\"}', '1490236064', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('64', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"29\",\"action\":\"member_edit\"}', '1490239370', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('65', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"24\",\"action\":\"member_edit\"}', '1490239387', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('66', 'member_add', '0', '1', '{\"username\":\"liweihao\",\"password\":\"b3f12d1e8cc6281edbb2d3864fc8234c\",\"email\":\"102661541@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490250337\",\"lastdate\":\"1490250337\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"pqTHuh\",\"ucuserid\":\"0\",\"uid\":\"30\",\"action\":\"member_add\"}', '1490250337', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('67', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490253397', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('68', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"f350d21cc855215b7a18ad172c06fb7e\",\"random\":\"2brLY5\",\"uid\":\"24\",\"action\":\"member_edit\"}', '1490254745', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('69', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"8783213b3d7927e159df7d33477f78ee\",\"random\":\"UVaevy\",\"uid\":\"27\",\"action\":\"member_edit\"}', '1490255016', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('70', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"47f2fbfa2861d19cdd3451cf15d8076d\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490255229', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('71', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"5e4066f61bb086c6babb92eb29af264b\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490255259', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('72', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"d3155ea6e5c5ab0dc0b0614ad9250c56\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490255602', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('73', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"3a18cda2007a9fbf8943adfaf2c2bc2a\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490255623', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('74', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"5e4066f61bb086c6babb92eb29af264b\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490255640', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('75', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"405e6c73a75cee17c520e64903d47c1e\",\"random\":\"UVaevy\",\"uid\":\"27\",\"action\":\"member_edit\"}', '1490255814', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('76', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"196dd17b27e2b9f83f396867537e90b1\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490255931', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('77', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"031df90a8997da59541054ed19583005\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490256244', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('78', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"password\":\"5e4066f61bb086c6babb92eb29af264b\",\"random\":\"P6xbrN\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490256318', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('79', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"25\",\"action\":\"member_edit\"}', '1490256362', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('80', 'member_add', '0', '1', '{\"username\":\"\\u5f8b\\u5e08\",\"password\":\"710f47872abf536537d2ca16a660f2a0\",\"email\":\"2851026515@qq.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490257565\",\"lastdate\":\"1490257565\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"KqQLGj\",\"ucuserid\":\"0\",\"uid\":\"31\",\"action\":\"member_add\"}', '1490257565', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('81', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"29\",\"action\":\"member_edit\"}', '1490257773', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('82', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"29\",\"action\":\"member_edit\"}', '1490257797', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('83', 'member_add', '0', '1', '{\"username\":\"\\u5f8b\\u5e0801\",\"password\":\"2982e2734428736fdc5decb019006b12\",\"email\":\"2851026650@qq.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490259382\",\"lastdate\":\"1490259382\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"XyrFMt\",\"ucuserid\":\"0\",\"uid\":\"32\",\"action\":\"member_add\"}', '1490259382', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('84', 'member_add', '0', '1', '{\"username\":\"\\u5f8b\\u5e0802\",\"password\":\"37469d9e76ab3c18a5660fc51fc66e09\",\"email\":\"zhongwenchao@wanglv.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490259511\",\"lastdate\":\"1490259511\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"ahE7vJ\",\"ucuserid\":\"0\",\"uid\":\"33\",\"action\":\"member_add\"}', '1490259511', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('85', 'member_add', '0', '1', '{\"username\":\"\\u5f8b\\u5e0803\",\"password\":\"83d8d91556e85a2e981bd486d050e654\",\"email\":\"moyanping@wanglv.com\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490259630\",\"lastdate\":\"1490259630\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"N6NiM8\",\"ucuserid\":\"0\",\"uid\":\"34\",\"action\":\"member_add\"}', '1490259630', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('86', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"34\",\"action\":\"member_edit\"}', '1490259757', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('87', 'member_add', '0', '1', '{\"username\":\"\\u5f8b\\u5e0804\",\"password\":\"4a8d2bf33ca1c22aa83bb2801e6d5978\",\"email\":\"zzx@findlaw.cn\",\"regip\":\"192.168.5.59\",\"regdate\":\"1490260412\",\"lastdate\":\"1490260412\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"UQBleS\",\"ucuserid\":\"0\",\"uid\":\"35\",\"action\":\"member_add\"}', '1490260412', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('88', 'member_delete', '0', '3', '{\"uids\":{\"0\":\"25\"},\"action\":\"member_delete\"}', '1490261237', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('89', 'member_add', '0', '1', '{\"username\":\"howe\",\"password\":\"5e4066f61bb086c6babb92eb29af264b\",\"email\":\"1026615417@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490261277\",\"lastdate\":\"1490261277\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"P6xbrN\",\"ucuserid\":\"0\",\"uid\":\"36\",\"action\":\"member_add\"}', '1490261277', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('90', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"36\"},\"action\":\"member_delete\"}', '1490261809', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('91', 'member_add', '0', '1', '{\"username\":\"howe\",\"password\":\"5e4066f61bb086c6babb92eb29af264b\",\"email\":\"1026615417@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490264825\",\"lastdate\":\"1490264825\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"P6xbrN\",\"ucuserid\":\"0\",\"uid\":\"37\",\"action\":\"member_add\"}', '1490264825', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('92', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"37\"},\"action\":\"member_delete\"}', '1490265025', '{\"1\":0}');
INSERT INTO `wy_sso_messagequeue` VALUES ('93', 'member_add', '0', '1', '{\"username\":\"howe\",\"password\":\"5e4066f61bb086c6babb92eb29af264b\",\"email\":\"1026615417@qq.com\",\"regip\":\"127.0.0.1\",\"regdate\":\"1490265036\",\"lastdate\":\"1490265036\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"P6xbrN\",\"ucuserid\":\"0\",\"uid\":\"38\",\"action\":\"member_add\"}', '1490265036', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('94', 'member_add', '0', '1', '{\"username\":\"\\u7528\\u623701\",\"password\":\"8023b147239785ebdf485ae3967ebe89\",\"email\":\"749908550@qq.com\",\"regip\":\"120.197.17.140\",\"regdate\":\"1490335603\",\"lastdate\":\"1490335603\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"7N8Aa1\",\"ucuserid\":\"0\",\"uid\":\"1\",\"action\":\"member_add\"}', '1490335603', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('95', 'member_add', '0', '1', '{\"username\":\"\\u5f8b\\u5e0801\",\"password\":\"48e25857ef26c6b4a52536364d0bff6e\",\"email\":\"guanxiaosa@wanglv.com\",\"regip\":\"120.197.17.140\",\"regdate\":\"1490335688\",\"lastdate\":\"1490335688\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"qEbGwk\",\"ucuserid\":\"0\",\"uid\":\"2\",\"action\":\"member_add\"}', '1490335688', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('96', 'member_add', '0', '1', '{\"username\":\"\\u7528\\u623702\",\"password\":\"f9e2bba026bcb361c3c1a08588a4f5a1\",\"email\":\"chenjunfang@wanglv.com\",\"regip\":\"120.197.17.140\",\"regdate\":\"1490335814\",\"lastdate\":\"1490335814\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"RdQBf6\",\"ucuserid\":\"0\",\"uid\":\"3\",\"action\":\"member_add\"}', '1490335814', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('97', 'member_add', '0', '1', '{\"username\":\"\\u7528\\u623703\",\"password\":\"f67b76142664d9799ff252c451544497\",\"email\":\"13413546691@163.com\",\"regip\":\"120.197.17.140\",\"regdate\":\"1490337277\",\"lastdate\":\"1490337277\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"K9yiBw\",\"ucuserid\":\"0\",\"uid\":\"4\",\"action\":\"member_add\"}', '1490337277', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('98', 'member_edit', '0', '1', '{\"appname\":\"wycms\",\"uid\":\"4\",\"action\":\"member_edit\"}', '1490337511', '{\"1\":1}');
INSERT INTO `wy_sso_messagequeue` VALUES ('99', 'member_add', '0', '1', '{\"username\":\"\\u7528\\u623704\",\"password\":\"f67adbdacd79ae1db341a0b105db260c\",\"email\":\"liweihao@wanglv.com\",\"regip\":\"120.197.17.140\",\"regdate\":\"1490338396\",\"lastdate\":\"1490338396\",\"appname\":\"wycms\",\"type\":\"app\",\"random\":\"Mp3My9\",\"ucuserid\":\"0\",\"uid\":\"5\",\"action\":\"member_add\"}', '1490338396', '{\"1\":1}');

-- ----------------------------
-- Table structure for wy_sso_session
-- ----------------------------
DROP TABLE IF EXISTS `wy_sso_session`;
CREATE TABLE `wy_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sso_session
-- ----------------------------
INSERT INTO `wy_sso_session` VALUES ('a6ap5s2iv5bnm9gavvl2scuek6', '0', 'ip', '1490261220', '0', '0', 'admin', 'login', 'a', 'code|s:4:\"ed5w\";');

-- ----------------------------
-- Table structure for wy_sso_settings
-- ----------------------------
DROP TABLE IF EXISTS `wy_sso_settings`;
CREATE TABLE `wy_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_sso_settings
-- ----------------------------
INSERT INTO `wy_sso_settings` VALUES ('denyemail', '');
INSERT INTO `wy_sso_settings` VALUES ('denyusername', '');
INSERT INTO `wy_sso_settings` VALUES ('creditrate', '');
INSERT INTO `wy_sso_settings` VALUES ('sp4', '');
INSERT INTO `wy_sso_settings` VALUES ('ucenter', '');

-- ----------------------------
-- Table structure for wy_tag
-- ----------------------------
DROP TABLE IF EXISTS `wy_tag`;
CREATE TABLE `wy_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_tag
-- ----------------------------

-- ----------------------------
-- Table structure for wy_template_bak
-- ----------------------------
DROP TABLE IF EXISTS `wy_template_bak`;
CREATE TABLE `wy_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_template_bak
-- ----------------------------
INSERT INTO `wy_template_bak` VALUES ('1', '1490317664', 'default_content_footer.html', '1', 'admin', '<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <div class=\"contact cl\">\r\n            <div class=\"contact_l fl\">\r\n                <img class=\"fl\" src=\"{IMG_PATH}fl880/foot_logo.png\" alt=\"{$siteinfo[name]}\">\r\n                <div class=\"foot_content fl\">\r\n                    <p>{$info[copyright]}</p>\r\n                    <p>地址：{$info[area]}</p>\r\n                    <p>电话：{$info[mobile]}   座机：{$info[tel]}    Email：{$info[email]}</p>\r\n                    <p>技术支持：网律互联</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"contact_r fr\">\r\n                <img class=\"fl\" src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"kfbox fw\">\r\n    <div class=\"kfpup\">\r\n        <div class=\"kfin\">\r\n            <ul>\r\n                <li><a href=\"http://wpa.qq.com/msgrd?v=3&uin={$info[\'qq\']}&site=qq&menu=yes\"><img src=\"{IMG_PATH}fl880/qqicon.png\"><p>QQ在线</p></a></li>\r\n                <li><a href=\"javascript:void(0)\"><img src=\"{IMG_PATH}fl880/phongicon.png\"><p>联系电话<br>\r\n                    <em class=\"phone_font\">{$info[mobile]}</em></p></a></li>\r\n\r\n                <li><a href=\"#\"><img src=\"{IMG_PATH}fl880/topicon.png\"><p>置顶</p></a></li>\r\n            </ul>\r\n            <a href=\"javascript:void(0);\"><img src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\"></a>\r\n        </div>\r\n\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n    //共用\r\n    $(\".kfbox\").hover(function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:0});\r\n    },function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:-160});\r\n    });\r\n\r\n</script>\r\n</body>\r\n</html>\r\n');
INSERT INTO `wy_template_bak` VALUES ('2', '1490317851', 'default_content_footer.html', '1', 'admin', '<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <div class=\"contact cl\">\r\n            <div class=\"contact_l fl\">\r\n                <img class=\"fl\" src=\"{IMG_PATH}fl880/foot_logo.png\" alt=\"{$siteinfo[name]}\">\r\n                <div class=\"foot_content fl\">\r\n                    <p>{$info[copyright]}</p>\r\n                    <p>地址：{$info[area]}</p>\r\n                    <p>电话：{$info[mobile]}   座机：{$info[tel]}    Email：{$info[email]}</p>\r\n                    <p><a href=\"http://www.lawyermarketing.cn\" target=\"_blank\">技术支持：网律互联</a></p>\r\n                </div>\r\n            </div>\r\n            <div class=\"contact_r fr\">\r\n                <img class=\"fl\" src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"kfbox fw\">\r\n    <div class=\"kfpup\">\r\n        <div class=\"kfin\">\r\n            <ul>\r\n                <li><a href=\"http://wpa.qq.com/msgrd?v=3&uin={$info[\'qq\']}&site=qq&menu=yes\"><img src=\"{IMG_PATH}fl880/qqicon.png\"><p>QQ在线</p></a></li>\r\n                <li><a href=\"javascript:void(0)\"><img src=\"{IMG_PATH}fl880/phongicon.png\"><p>联系电话<br>\r\n                    <em class=\"phone_font\">{$info[mobile]}</em></p></a></li>\r\n\r\n                <li><a href=\"#\"><img src=\"{IMG_PATH}fl880/topicon.png\"><p>置顶</p></a></li>\r\n            </ul>\r\n            <a href=\"javascript:void(0);\"><img src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\"></a>\r\n        </div>\r\n\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n    //共用\r\n    $(\".kfbox\").hover(function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:0});\r\n    },function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:-160});\r\n    });\r\n\r\n</script>\r\n</body>\r\n</html>\r\n');
INSERT INTO `wy_template_bak` VALUES ('3', '1490317928', 'default_content_footer.html', '1', 'admin', '<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <div class=\"contact cl\">\r\n            <div class=\"contact_l fl\">\r\n                <img class=\"fl\" src=\"{IMG_PATH}fl880/foot_logo.png\" alt=\"{$siteinfo[name]}\">\r\n                <div class=\"foot_content fl\">\r\n                    <p>{$info[copyright]}</p>\r\n                    <p>地址：{$info[area]}</p>\r\n                    <p>电话：{$info[mobile]}   座机：{$info[tel]}    Email：{$info[email]}</p>\r\n                    <p><a href=\"http://www.lawyermarketing.cn\" target=\"_blank\">技术支持：网律互联</a></p>\r\n                </div>\r\n            </div>\r\n            <div class=\"contact_r fr\">\r\n                <img class=\"fl\" src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"kfbox fw\">\r\n    <div class=\"kfpup\">\r\n        <div class=\"kfin\">\r\n            <ul>\r\n                <li><a href=\"http://wpa.qq.com/msgrd?v=3&uin={$info[\'qq\']}&site=qq&menu=yes\"><img src=\"{IMG_PATH}fl880/qqicon.png\"><p>QQ在线</p></a></li>\r\n                <li><a href=\"javascript:void(0)\"><img src=\"{IMG_PATH}fl880/phongicon.png\"><p>联系电话<br>\r\n                    <em class=\"phone_font\">{$info[mobile]}</em></p></a></li>\r\n\r\n                <li><a href=\"#\"><img src=\"{IMG_PATH}fl880/topicon.png\"><p>置顶</p></a></li>\r\n            </ul>\r\n            <a href=\"javascript:void(0);\"><img src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\"></a>\r\n        </div>\r\n\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n    //共用\r\n    $(\".kfbox\").hover(function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:0});\r\n    },function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:-160});\r\n    });\r\n\r\n</script>\r\n</body>\r\n</html>\r\n');
INSERT INTO `wy_template_bak` VALUES ('4', '1490318134', 'default_content_footer.html', '1', 'admin', '<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <div class=\"contact cl\">\r\n            <div class=\"contact_l fl\">\r\n                <img class=\"fl\" src=\"{IMG_PATH}fl880/foot_logo.png\" alt=\"{$siteinfo[name]}\">\r\n                <div class=\"foot_content fl\">\r\n                    <p><a href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\">{$info[copyright]}</a></p>\r\n                    <p>地址：{$info[area]}</p>\r\n                    <p>电话：{$info[mobile]}   座机：{$info[tel]}    Email：{$info[email]}</p>\r\n                    <p><a href=\"http://www.lawyermarketing.cn\" target=\"_blank\">技术支持：网律互联</a></p>\r\n                </div>\r\n            </div>\r\n            <div class=\"contact_r fr\">\r\n                <img class=\"fl\" src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"kfbox fw\">\r\n    <div class=\"kfpup\">\r\n        <div class=\"kfin\">\r\n            <ul>\r\n                <li><a href=\"http://wpa.qq.com/msgrd?v=3&uin={$info[\'qq\']}&site=qq&menu=yes\"><img src=\"{IMG_PATH}fl880/qqicon.png\"><p>QQ在线</p></a></li>\r\n                <li><a href=\"javascript:void(0)\"><img src=\"{IMG_PATH}fl880/phongicon.png\"><p>联系电话<br>\r\n                    <em class=\"phone_font\">{$info[mobile]}</em></p></a></li>\r\n\r\n                <li><a href=\"#\"><img src=\"{IMG_PATH}fl880/topicon.png\"><p>置顶</p></a></li>\r\n            </ul>\r\n            <a href=\"javascript:void(0);\"><img src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\"></a>\r\n        </div>\r\n\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n    //共用\r\n    $(\".kfbox\").hover(function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:0});\r\n    },function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:-160});\r\n    });\r\n\r\n</script>\r\n</body>\r\n</html>\r\n');
INSERT INTO `wy_template_bak` VALUES ('5', '1490318168', 'default_content_footer.html', '1', 'admin', '<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <div class=\"contact cl\">\r\n            <div class=\"contact_l fl\">\r\n                <img class=\"fl\" src=\"{IMG_PATH}fl880/foot_logo.png\" alt=\"{$siteinfo[name]}\">\r\n                <div class=\"foot_content fl\">\r\n                    <p><a href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\" style=\"color:#fff;\">{$info[copyright]}</a></p>\r\n                    <p>地址：{$info[area]}</p>\r\n                    <p>电话：{$info[mobile]}   座机：{$info[tel]}    Email：{$info[email]}</p>\r\n                    <p><a href=\"http://www.lawyermarketing.cn\" target=\"_blank\" style=\"color:#fff;\">技术支持：网律互联</a></p>\r\n                </div>\r\n            </div>\r\n            <div class=\"contact_r fr\">\r\n                <img class=\"fl\" src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"kfbox fw\">\r\n    <div class=\"kfpup\">\r\n        <div class=\"kfin\">\r\n            <ul>\r\n                <li><a href=\"http://wpa.qq.com/msgrd?v=3&uin={$info[\'qq\']}&site=qq&menu=yes\"><img src=\"{IMG_PATH}fl880/qqicon.png\"><p>QQ在线</p></a></li>\r\n                <li><a href=\"javascript:void(0)\"><img src=\"{IMG_PATH}fl880/phongicon.png\"><p>联系电话<br>\r\n                    <em class=\"phone_font\">{$info[mobile]}</em></p></a></li>\r\n\r\n                <li><a href=\"#\"><img src=\"{IMG_PATH}fl880/topicon.png\"><p>置顶</p></a></li>\r\n            </ul>\r\n            <a href=\"javascript:void(0);\"><img src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\"></a>\r\n        </div>\r\n\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n    //共用\r\n    $(\".kfbox\").hover(function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:0});\r\n    },function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:-160});\r\n    });\r\n\r\n</script>\r\n</body>\r\n</html>\r\n');
INSERT INTO `wy_template_bak` VALUES ('6', '1490318305', 'default_content_footer.html', '1', 'admin', '<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <div class=\"contact cl\">\r\n            <div class=\"contact_l fl\">\r\n                <img class=\"fl\" src=\"{IMG_PATH}fl880/foot_logo.png\" alt=\"{$siteinfo[name]}\">\r\n                <div class=\"foot_content fl\">\r\n                    <p><a href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\" style=\"color:#73aae3;\">{$info[copyright]}</a></p>\r\n                    <p>地址：{$info[area]}</p>\r\n                    <p>电话：{$info[mobile]}   座机：{$info[tel]}    Email：{$info[email]}</p>\r\n                    <p><a href=\"http://www.lawyermarketing.cn\" target=\"_blank\" style=\"color:#73aae3;\">技术支持：网律互联</a></p>\r\n                </div>\r\n            </div>\r\n            <div class=\"contact_r fr\">\r\n                <img class=\"fl\" src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"kfbox fw\">\r\n    <div class=\"kfpup\">\r\n        <div class=\"kfin\">\r\n            <ul>\r\n                <li><a href=\"http://wpa.qq.com/msgrd?v=3&uin={$info[\'qq\']}&site=qq&menu=yes\"><img src=\"{IMG_PATH}fl880/qqicon.png\"><p>QQ在线</p></a></li>\r\n                <li><a href=\"javascript:void(0)\"><img src=\"{IMG_PATH}fl880/phongicon.png\"><p>联系电话<br>\r\n                    <em class=\"phone_font\">{$info[mobile]}</em></p></a></li>\r\n\r\n                <li><a href=\"#\"><img src=\"{IMG_PATH}fl880/topicon.png\"><p>置顶</p></a></li>\r\n            </ul>\r\n            <a href=\"javascript:void(0);\"><img src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\"></a>\r\n        </div>\r\n\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n    //共用\r\n    $(\".kfbox\").hover(function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:0});\r\n    },function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:-160});\r\n    });\r\n\r\n</script>\r\n</body>\r\n</html>\r\n');
INSERT INTO `wy_template_bak` VALUES ('7', '1490318905', 'default_content_footer.html', '1', 'admin', '<div class=\"footer\">\r\n    <div class=\"w1200\">\r\n        <div class=\"contact cl\">\r\n            <div class=\"contact_l fl\">\r\n                <img class=\"fl\" src=\"{IMG_PATH}fl880/foot_logo.png\" alt=\"{$siteinfo[name]}\">\r\n                <div class=\"foot_content fl\">\r\n                    <p><a href=\"http://www.miitbeian.gov.cn/\" target=\"_blank\" style=\"color:#73aae3;\">{$info[copyright]}</a></p>\r\n                    <p>地址：{$info[area]}</p>\r\n                    <p>电话：{$info[mobile]}   座机：{$info[tel]}    Email：{$info[email]}</p>\r\n                    <p><a href=\"http://www.lawyermarketing.cn\" target=\"_blank\" style=\"color:#73aae3;\">技术支持：网律互联</a></p>\r\n                </div>\r\n            </div>\r\n            <div class=\"contact_r fr\">\r\n                <img class=\"fl\" src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"kfbox fw\">\r\n    <div class=\"kfpup\">\r\n        <div class=\"kfin\">\r\n            <ul>\r\n                <li><a href=\"http://wpa.qq.com/msgrd?v=3&uin={$info[\'qq\']}&site=qq&menu=yes\"><img src=\"{IMG_PATH}fl880/qqicon.png\"><p>QQ在线</p></a></li>\r\n                <li><a href=\"javascript:void(0)\"><img src=\"{IMG_PATH}fl880/phongicon.png\"><p>联系电话<br>\r\n                    <em class=\"phone_font\">{$info[mobile]}</em></p></a></li>\r\n\r\n                <li><a href=\"#\"><img src=\"{IMG_PATH}fl880/topicon.png\"><p>置顶</p></a></li>\r\n            </ul>\r\n            <a href=\"javascript:void(0);\"><img src=\"{thumb($info[weixin_img],120,120)}\" alt=\"{$siteinfo[name]}\"></a>\r\n        </div>\r\n\r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\">\r\n\r\n    //共用\r\n    $(\".kfbox\").hover(function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:0});\r\n    },function(){\r\n        $(this).children(\'.kfpup\').stop(true,true).animate({marginRight:-160});\r\n    });\r\n\r\n</script>\r\n<script>window._bd_share_config={\"common\":{\"bdSnsKey\":{},\"bdText\":\"\",\"bdMini\":\"2\",\"bdMiniList\":false,\"bdPic\":\"\",\"bdStyle\":\"0\",\"bdSize\":\"32\"},\"slide\":{\"type\":\"slide\",\"bdImg\":\"0\",\"bdPos\":\"left\",\"bdTop\":\"130.5\"},\"image\":{\"viewList\":[\"qzone\",\"tsina\",\"tqq\",\"renren\",\"weixin\"],\"viewText\":\"分享到：\",\"viewSize\":\"16\"},\"selectShare\":{\"bdContainerClass\":null,\"bdSelectMiniList\":[\"qzone\",\"tsina\",\"tqq\",\"renren\",\"weixin\"]}};with(document)0[(getElementsByTagName(\'head\')[0]||body).appendChild(createElement(\'script\')).src=\'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=\'+~(-new Date()/36e5)];</script>\r\n</body>\r\n</html>\r\n');

-- ----------------------------
-- Table structure for wy_times
-- ----------------------------
DROP TABLE IF EXISTS `wy_times`;
CREATE TABLE `wy_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_times
-- ----------------------------

-- ----------------------------
-- Table structure for wy_type
-- ----------------------------
DROP TABLE IF EXISTS `wy_type`;
CREATE TABLE `wy_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_type
-- ----------------------------
INSERT INTO `wy_type` VALUES ('52', '1', 'search', '0', '专题', '0', 'special', '', '', '4', '专题');
INSERT INTO `wy_type` VALUES ('1', '1', 'search', '1', '新闻', '0', '', '', '', '1', '新闻模型搜索');
INSERT INTO `wy_type` VALUES ('2', '1', 'search', '2', '下载', '0', '', '', '', '3', '下载模型搜索');
INSERT INTO `wy_type` VALUES ('3', '1', 'search', '3', '图片', '0', '', '', '', '2', '图片模型搜索');
INSERT INTO `wy_type` VALUES ('55', '1', 'search', '15', '商品模型', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for wy_urlrule
-- ----------------------------
DROP TABLE IF EXISTS `wy_urlrule`;
CREATE TABLE `wy_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_urlrule
-- ----------------------------
INSERT INTO `wy_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `wy_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `wy_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `wy_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `wy_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `wy_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `wy_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `wy_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');

-- ----------------------------
-- Table structure for wy_video
-- ----------------------------
DROP TABLE IF EXISTS `wy_video`;
CREATE TABLE `wy_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_video
-- ----------------------------

-- ----------------------------
-- Table structure for wy_video_data
-- ----------------------------
DROP TABLE IF EXISTS `wy_video_data`;
CREATE TABLE `wy_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_video_data
-- ----------------------------

-- ----------------------------
-- Table structure for wy_wap_type
-- ----------------------------
DROP TABLE IF EXISTS `wy_wap_type`;
CREATE TABLE `wy_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_wap_type
-- ----------------------------

-- ----------------------------
-- Table structure for wy_workflow
-- ----------------------------
DROP TABLE IF EXISTS `wy_workflow`;
CREATE TABLE `wy_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wy_workflow
-- ----------------------------
INSERT INTO `wy_workflow` VALUES ('1', '1', '1', '一级审核', '审核一次', '', '0');
INSERT INTO `wy_workflow` VALUES ('2', '1', '2', '二级审核', '审核两次', '', '0');
INSERT INTO `wy_workflow` VALUES ('3', '1', '3', '三级审核', '审核三次', '', '0');
INSERT INTO `wy_workflow` VALUES ('4', '1', '4', '四级审核', '四级审核', '', '0');
