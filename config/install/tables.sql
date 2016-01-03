CREATE TABLE IF NOT EXISTS `ranks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rank_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `port` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `news_id` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `configurations` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lang` varchar(5) NOT NULL,
  `theme` varchar(50) NOT NULL DEFAULT 'default',
  `layout` varchar(255) NOT NULL,
  `maintenance` text NOT NULL,
  `money_name_singular` varchar(255) NOT NULL,
  `money_name_plural` varchar(255) NOT NULL,
  `server_state` int(1) NOT NULL,
  `server_secretkey` varchar(50) NOT NULL,
  `server_timeout` float NOT NULL,
  `version` varchar(50) NOT NULL,
  `skype` text NOT NULL,
  `youtube` text NOT NULL,
  `twitter` text NOT NULL,
  `facebook` text NOT NULL,
  `mineguard` varchar(5) NOT NULL,
  `banner_server` text DEFAULT NULL,
  `email_send_type` int(1) DEFAULT '1' COMMENT '1 = default, 2 = smtp',
  `smtpHost` varchar(30) DEFAULT NULL,
  `smtpUsername` varchar(50) DEFAULT NULL,
  `smtpPort` int(5) DEFAULT NULL,
  `smtpPassword` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `histories` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `other` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `news_id` int(20) NOT NULL,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `navbars` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `order` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '1',
  `url` varchar(250) NOT NULL,
  `submenu` text,
  `open_new_tab` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `comments` int(20) NOT NULL DEFAULT '0',
  `like` int(20) NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(150) NOT NULL,
  `author` varchar(250) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `rank` int(1) NOT NULL,
  `permissions` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(20) NOT NULL,
  `created` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `version` varchar(20) NOT NULL,
  `tables` text NOT NULL,
  `state` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `subtitle` text NOT NULL,
  `url_img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `rank` int(1) NOT NULL,
  `money` int(20) NOT NULL DEFAULT '0',
  `vote` int(3) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL,
  `allowed_ip` text DEFAULT NULL,
  `skin` int(1) NOT NULL DEFAULT '0',
  `cape` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `visits` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `lang` varchar(4) DEFAULT NULL,
  `navigator` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `lostpasswords` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `key` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `api_configurations` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `skins` int(1) NOT NULL DEFAULT '0',
  `skin_filename` varchar(150) NOT NULL,
  `skin_free` int(1) NOT NULL DEFAULT '0',
  `skin_width` int(11) DEFAULT '64',
  `skin_height` int(11) DEFAULT '32',
  `capes` int(1) NOT NULL DEFAULT '0',
  `cape_filename` varchar(150) NOT NULL,
  `cape_free` int(1) NOT NULL DEFAULT '0',
  `cape_width` int(11) DEFAULT '64',
  `cape_height` int(11) DEFAULT '32',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `social_buttons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `img` varchar(120) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `permissions` (`id`, `rank`, `permissions`) VALUES
(1, 0, 'a:3:{i:0;s:12:"COMMENT_NEWS";i:1;s:9:"LIKE_NEWS";i:2;s:18:"DELETE_HIS_COMMENT";}'),
(2, 2, 'a:3:{i:0;s:12:"COMMENT_NEWS";i:1;s:9:"LIKE_NEWS";i:2;s:18:"DELETE_HIS_COMMENT";}');

INSERT INTO `api_configurations` (`id`, `skins`, `skin_filename`, `skin_free`, `capes`, `cape_filename`, `cape_free`) VALUES
(0, 0, 'skins/{PLAYER}_skin', '64', '32', 0, 0, 'skins/capes/{PLAYER}_cape', '64', '32', 0);

INSERT INTO `configurations` (`id`, `name`, `email`, `lang`, `theme`, `layout`, `maintenance`, `money_name_singular`, `money_name_plural`, `server_state`, `server_secretkey`, `server_timeout`, `version`, `skype`, `youtube`, `twitter`, `facebook`, `mineguard`) VALUES
(1, 'MineWeb', 'dev@mineweb.org', 'fr', 'Mineweb', 'default', '0', 'point', 'points', 0, '', '', '0.5', 'http://mineweb.org', 'http://mineweb.org', 'http://mineweb.org', 'http://mineweb.org', 'false');
