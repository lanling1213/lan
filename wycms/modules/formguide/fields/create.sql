CREATE TABLE IF NOT EXISTS `wy_form_table` (
  `dataid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `datetime` int(10) unsigned NOT NULL,
  `ip` char(15) NOT NULL,
  PRIMARY KEY (`dataid`)
) TYPE=MyISAM;