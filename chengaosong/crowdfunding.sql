/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : crowdfunding

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2018-05-15 13:50:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 会员表', '6', 'add_member');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 会员表', '6', 'change_member');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 会员表', '6', 'delete_member');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 标签', '7', 'add_tag');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 标签', '7', 'change_tag');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 标签', '7', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 二级标签', '8', 'add_twolable');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 二级标签', '8', 'change_twolable');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 二级标签', '8', 'delete_twolable');
INSERT INTO `auth_permission` VALUES ('30', 'Can add 类别表', '9', 'add_type');
INSERT INTO `auth_permission` VALUES ('31', 'Can change 类别表', '9', 'change_type');
INSERT INTO `auth_permission` VALUES ('32', 'Can delete 类别表', '9', 'delete_type');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 众筹项目', '10', 'add_project');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 众筹项目', '10', 'change_project');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 众筹项目', '10', 'delete_project');
INSERT INTO `auth_permission` VALUES ('36', 'Can add 回报表', '11', 'add_return');
INSERT INTO `auth_permission` VALUES ('37', 'Can change 回报表', '11', 'change_return');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete 回报表', '11', 'delete_return');
INSERT INTO `auth_permission` VALUES ('39', 'Can add 关注表', '12', 'add_follower');
INSERT INTO `auth_permission` VALUES ('40', 'Can change 关注表', '12', 'change_follower');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete 关注表', '12', 'delete_follower');
INSERT INTO `auth_permission` VALUES ('42', 'Can add support', '13', 'add_support');
INSERT INTO `auth_permission` VALUES ('43', 'Can change support', '13', 'change_support');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete support', '13', 'delete_support');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 订单', '14', 'add_order');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 订单', '14', 'change_order');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 订单', '14', 'delete_order');
INSERT INTO `auth_permission` VALUES ('48', 'Can add 会员地址表', '15', 'add_memberaddress');
INSERT INTO `auth_permission` VALUES ('49', 'Can change 会员地址表', '15', 'change_memberaddress');
INSERT INTO `auth_permission` VALUES ('50', 'Can delete 会员地址表', '15', 'delete_memberaddress');
INSERT INTO `auth_permission` VALUES ('51', 'Can add 邮箱验证码', '16', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('52', 'Can change 邮箱验证码', '16', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('53', 'Can delete 邮箱验证码', '16', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('54', 'Can view 邮箱验证码', '16', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('55', 'Can view 关注表', '12', 'view_follower');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 会员表', '6', 'view_member');
INSERT INTO `auth_permission` VALUES ('57', 'Can view 会员地址表', '15', 'view_memberaddress');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 订单', '14', 'view_order');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 众筹项目', '10', 'view_project');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 回报表', '11', 'view_return');
INSERT INTO `auth_permission` VALUES ('61', 'Can view support', '13', 'view_support');
INSERT INTO `auth_permission` VALUES ('62', 'Can view 标签', '7', 'view_tag');
INSERT INTO `auth_permission` VALUES ('63', 'Can view 二级标签', '8', 'view_twolable');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 类别表', '9', 'view_type');
INSERT INTO `auth_permission` VALUES ('65', 'Can add Bookmark', '17', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('66', 'Can change Bookmark', '17', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete Bookmark', '17', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('68', 'Can add User Setting', '18', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('69', 'Can change User Setting', '18', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('70', 'Can delete User Setting', '18', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('71', 'Can add User Widget', '19', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('72', 'Can change User Widget', '19', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('73', 'Can delete User Widget', '19', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('74', 'Can add log entry', '20', 'add_log');
INSERT INTO `auth_permission` VALUES ('75', 'Can change log entry', '20', 'change_log');
INSERT INTO `auth_permission` VALUES ('76', 'Can delete log entry', '20', 'delete_log');
INSERT INTO `auth_permission` VALUES ('77', 'Can view Bookmark', '17', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('78', 'Can view log entry', '20', 'view_log');
INSERT INTO `auth_permission` VALUES ('79', 'Can view User Setting', '18', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('80', 'Can view User Widget', '19', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('81', 'Can add 轮播图', '21', 'add_banner');
INSERT INTO `auth_permission` VALUES ('82', 'Can change 轮播图', '21', 'change_banner');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete 轮播图', '21', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('84', 'Can view 轮播图', '21', 'view_banner');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_PublicDisplay_member_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_PublicDisplay_member_id` FOREIGN KEY (`user_id`) REFERENCES `publicdisplay_member` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('21', 'PublicDisplay', 'banner');
INSERT INTO `django_content_type` VALUES ('16', 'PublicDisplay', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('12', 'PublicDisplay', 'follower');
INSERT INTO `django_content_type` VALUES ('6', 'PublicDisplay', 'member');
INSERT INTO `django_content_type` VALUES ('15', 'PublicDisplay', 'memberaddress');
INSERT INTO `django_content_type` VALUES ('14', 'PublicDisplay', 'order');
INSERT INTO `django_content_type` VALUES ('10', 'PublicDisplay', 'project');
INSERT INTO `django_content_type` VALUES ('11', 'PublicDisplay', 'return');
INSERT INTO `django_content_type` VALUES ('13', 'PublicDisplay', 'support');
INSERT INTO `django_content_type` VALUES ('7', 'PublicDisplay', 'tag');
INSERT INTO `django_content_type` VALUES ('8', 'PublicDisplay', 'twolable');
INSERT INTO `django_content_type` VALUES ('9', 'PublicDisplay', 'type');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('17', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('20', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('18', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('19', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-14 10:01:11');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-05-14 10:01:11');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-05-14 10:01:12');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-05-14 10:01:13');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-05-14 10:01:13');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-05-14 10:01:13');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-05-14 10:01:13');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-05-14 10:01:13');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-05-14 10:01:13');
INSERT INTO `django_migrations` VALUES ('10', 'PublicDisplay', '0001_initial', '2018-05-14 10:01:20');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2018-05-14 10:01:21');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2018-05-14 10:01:21');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2018-05-14 10:01:21');
INSERT INTO `django_migrations` VALUES ('14', 'xadmin', '0001_initial', '2018-05-14 10:01:22');
INSERT INTO `django_migrations` VALUES ('15', 'xadmin', '0002_log', '2018-05-14 10:01:22');
INSERT INTO `django_migrations` VALUES ('16', 'xadmin', '0003_auto_20160715_0100', '2018-05-14 10:01:23');
INSERT INTO `django_migrations` VALUES ('17', 'PublicDisplay', '0002_auto_20180514_2043', '2018-05-14 20:44:30');
INSERT INTO `django_migrations` VALUES ('18', 'PublicDisplay', '0003_banner', '2018-05-15 11:38:12');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6mo427oertryyoydnrxq5lgy37l93pc9', 'ZGVkZGFjMmM1MTljYjJmNjBhNzI2ZDcxM2FmZGYzM2M4NjU2NjhhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxY2FiNTZhMDAwZWQ0ODQ4NTg4OGRhYzJjNzU0MmQwNDI1NGY1MjRmIn0=', '2018-05-28 14:09:36');
INSERT INTO `django_session` VALUES ('c97jiwd77thjsqlxigcpwzw42dzp0kvo', 'MmE1N2ZmZjZlNmExZjM4YjUyMTJmODkzZGY3YjZmM2Q1YTZjMWY5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTI0MDU0MDA0Yjc0NjAyZDVlZTEzOTkzNWEwYjhjNTI3MmJmOWU2In0=', '2018-05-29 13:38:24');
INSERT INTO `django_session` VALUES ('mzvgegdv5qlm0yyafewjoog10eeqp2n8', 'MmE1N2ZmZjZlNmExZjM4YjUyMTJmODkzZGY3YjZmM2Q1YTZjMWY5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTI0MDU0MDA0Yjc0NjAyZDVlZTEzOTkzNWEwYjhjNTI3MmJmOWU2In0=', '2018-05-28 11:56:00');
INSERT INTO `django_session` VALUES ('qpdfcb203tbmodbohgp7l08enm7mr9di', 'MmE1N2ZmZjZlNmExZjM4YjUyMTJmODkzZGY3YjZmM2Q1YTZjMWY5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTI0MDU0MDA0Yjc0NjAyZDVlZTEzOTkzNWEwYjhjNTI3MmJmOWU2In0=', '2018-05-28 11:15:55');
INSERT INTO `django_session` VALUES ('y568kjpnel0hkstj11bsnuq0hymorq3b', 'YjFhMWQ2MWExMjM3NmMxN2Y2MTNiMWUxOGNhZGU5NzQyMGMzYjc4Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTI0MDU0MDA0Yjc0NjAyZDVlZTEzOTkzNWEwYjhjNTI3MmJmOWU2IiwiTElTVF9RVUVSWSI6W1siUHVibGljRGlzcGxheSIsIm1lbWJlciJdLCIiXX0=', '2018-05-28 10:10:47');

-- ----------------------------
-- Table structure for `publicdisplay_banner`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_banner`;
CREATE TABLE `publicdisplay_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_banner
-- ----------------------------
INSERT INTO `publicdisplay_banner` VALUES ('1', '123', 'banner/2018/05/12_39.jpg', 'http://127.0.0.1:8000/project/1', '1', '2018-05-15 11:39:00');

-- ----------------------------
-- Table structure for `publicdisplay_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_emailverifyrecord`;
CREATE TABLE `publicdisplay_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(15) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_emailverifyrecord
-- ----------------------------
INSERT INTO `publicdisplay_emailverifyrecord` VALUES ('1', 'fC05c4g25g34DbgD', '15032086039@163.com', 'register', '2018-05-14 10:02:03');

-- ----------------------------
-- Table structure for `publicdisplay_follower`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_follower`;
CREATE TABLE `publicdisplay_follower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid_id` int(11) NOT NULL,
  `projectid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PublicDisplay_follower_3548ec1a` (`memberid_id`),
  KEY `PublicDisplay_follower_a01feefd` (`projectid_id`),
  CONSTRAINT `PublicDisplay__projectid_id_65c0a516_fk_PublicDisplay_project_id` FOREIGN KEY (`projectid_id`) REFERENCES `publicdisplay_project` (`id`),
  CONSTRAINT `PublicDisplay_fo_memberid_id_d50d4ebc_fk_PublicDisplay_member_id` FOREIGN KEY (`memberid_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_follower
-- ----------------------------
INSERT INTO `publicdisplay_follower` VALUES ('3', '2', '1');

-- ----------------------------
-- Table structure for `publicdisplay_member`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_member`;
CREATE TABLE `publicdisplay_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `user_type` varchar(12) NOT NULL,
  `authstatus` varchar(1) NOT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `cardnum` varchar(255) DEFAULT NULL,
  `accttye` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_member
-- ----------------------------
INSERT INTO `publicdisplay_member` VALUES ('1', 'pbkdf2_sha256$24000$xHCbuMVfh7RX$Bgy1dZGDVoS/WJWhlGRw57zKUoLGrRF577uIIwzTd6s=', '2018-05-14 14:09:36', '0', 'cgs111', '', '', '15032086039@163.com', '0', '0', '2018-05-14 10:02:00', '', '0', '2', '张三', '12345678', '2');
INSERT INTO `publicdisplay_member` VALUES ('2', 'pbkdf2_sha256$24000$vGAjHljYygA1$4rWkj01CdjNKsBM2A0/fMDgZudLMV4BxhOrSGw/NV3s=', '2018-05-15 13:38:24', '1', 'admin', '', '', '15032086039@163.com', '1', '1', '2018-05-14 10:03:00', '', '0', '2', '张三', '12345678', '2');

-- ----------------------------
-- Table structure for `publicdisplay_memberaddress`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_memberaddress`;
CREATE TABLE `publicdisplay_memberaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `memberid_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PublicDisplay_memberaddress_3548ec1a` (`memberid_id`),
  CONSTRAINT `PublicDisplay_me_memberid_id_c14f9457_fk_PublicDisplay_member_id` FOREIGN KEY (`memberid_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_memberaddress
-- ----------------------------
INSERT INTO `publicdisplay_memberaddress` VALUES ('1', '北京市', '2', '李四', '12345678912');

-- ----------------------------
-- Table structure for `publicdisplay_member_groups`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_member_groups`;
CREATE TABLE `publicdisplay_member_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PublicDisplay_member_groups_member_id_68496359_uniq` (`member_id`,`group_id`),
  KEY `PublicDisplay_member_groups_group_id_33c76868_fk_auth_group_id` (`group_id`),
  CONSTRAINT `PublicDisplay_member_groups_group_id_33c76868_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `PublicDisplay_memb_member_id_6d3b844f_fk_PublicDisplay_member_id` FOREIGN KEY (`member_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_member_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `publicdisplay_member_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_member_user_permissions`;
CREATE TABLE `publicdisplay_member_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PublicDisplay_member_user_permissions_member_id_423a3e8b_uniq` (`member_id`,`permission_id`),
  KEY `PublicDisplay_membe_permission_id_93fb5a57_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `PublicDisplay_membe_permission_id_93fb5a57_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `PublicDisplay_memb_member_id_319b97a1_fk_PublicDisplay_member_id` FOREIGN KEY (`member_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_member_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `publicdisplay_order`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_order`;
CREATE TABLE `publicdisplay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `order_num` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `money` int(11) NOT NULL,
  `rtncount` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `invoice` varchar(1) NOT NULL,
  `invoictitle` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `memberid_id` int(11) NOT NULL,
  `projectid_id` int(11) NOT NULL,
  `returnid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PublicDisplay_order_3548ec1a` (`memberid_id`),
  KEY `PublicDisplay_order_a01feefd` (`projectid_id`),
  KEY `PublicDisplay_order_300a3551` (`returnid_id`),
  CONSTRAINT `PublicDisplay_or_returnid_id_d374e5c0_fk_PublicDisplay_return_id` FOREIGN KEY (`returnid_id`) REFERENCES `publicdisplay_return` (`id`),
  CONSTRAINT `PublicDisplay_or_memberid_id_e8527a95_fk_PublicDisplay_member_id` FOREIGN KEY (`memberid_id`) REFERENCES `publicdisplay_member` (`id`),
  CONSTRAINT `PublicDisplay__projectid_id_20ada79a_fk_PublicDisplay_project_id` FOREIGN KEY (`projectid_id`) REFERENCES `publicdisplay_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_order
-- ----------------------------
INSERT INTO `publicdisplay_order` VALUES ('1', '20180514195446245', '', '2018-05-14 19:54:46', '123', '1', '0', '', '0', '', '', '2', '1', '1');
INSERT INTO `publicdisplay_order` VALUES ('2', '20180514200319229', '', '2018-05-14 20:03:19', '246', '2', '0', '', '0', '', '', '2', '1', '1');
INSERT INTO `publicdisplay_order` VALUES ('3', '20180514200327237', '', '2018-05-14 20:03:27', '246', '2', '0', '', '0', '', '', '2', '1', '1');
INSERT INTO `publicdisplay_order` VALUES ('4', '20180514200835297', '', '2018-05-14 20:08:35', '123', '1', '0', '', '0', '', '', '2', '1', '1');
INSERT INTO `publicdisplay_order` VALUES ('5', '20180514200915247', '', '2018-05-14 20:09:15', '2706', '22', '0', '', '0', '', '', '2', '1', '1');

-- ----------------------------
-- Table structure for `publicdisplay_project`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_project`;
CREATE TABLE `publicdisplay_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `money` bigint(20) NOT NULL,
  `day` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `deploydate` datetime NOT NULL,
  `supportmoney` bigint(20) NOT NULL,
  `completion` varchar(1) NOT NULL,
  `createdate` datetime NOT NULL,
  `project_head_img` varchar(100) NOT NULL,
  `project_detail` varchar(100) NOT NULL,
  `Follower_nums` int(11) NOT NULL,
  `support_nums` int(11) NOT NULL,
  `show` varchar(255) DEFAULT NULL,
  `detail_show` longtext,
  `phone` varchar(11) DEFAULT NULL,
  `service_phone` varchar(11) DEFAULT NULL,
  `memberid_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PublicDisplay_project_3548ec1a` (`memberid_id`),
  KEY `PublicDisplay_project_94757cae` (`type_id`),
  CONSTRAINT `PublicDisplay_project_type_id_f7013172_fk_PublicDisplay_type_id` FOREIGN KEY (`type_id`) REFERENCES `publicdisplay_type` (`id`),
  CONSTRAINT `PublicDisplay_pr_memberid_id_327b5263_fk_PublicDisplay_member_id` FOREIGN KEY (`memberid_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_project
-- ----------------------------
INSERT INTO `publicdisplay_project` VALUES ('1', '项目1', '项目1项目1项目1项目1', '2331', '12', '0', '2018-05-14 10:05:24', '0', '0', '2018-05-14 10:05:24', 'head_img/2018/05/12_3.gif', 'detail/2018/05/12_8_lrcWlkB.gif', '0', '0', '我是admin', '啊啊啊啊啊啊啊', '15032086039', '12345678123', '2', '1');
INSERT INTO `publicdisplay_project` VALUES ('2', '1234567', '23466', '2222', '33333', '0', '2018-05-14 11:19:07', '0', '0', '2018-05-14 11:19:07', 'head_img/2018/05/1_pvbm8iQ.png', 'detail/2018/05/1_RupH6HU.png', '0', '0', '11111', '', '', '', '2', '1');
INSERT INTO `publicdisplay_project` VALUES ('3', '项目1', '111111', '1111', '23', '0', '2018-05-14 14:10:08', '0', '0', '2018-05-14 14:10:08', 'head_img/2018/05/12_7_yZUHDUI.png', 'detail/2018/05/12_8_Hvqv5Ff.jpg', '0', '0', '我是admin', '1111', '15032086039', '12345678123', '1', '1');
INSERT INTO `publicdisplay_project` VALUES ('4', '项目1', '111', '1111', '23', '0', '2018-05-14 14:28:17', '0', '0', '2018-05-14 14:28:17', 'head_img/2018/05/12_7_KhCZVx2.png', 'detail/2018/05/12_8_6yaeoTp.gif', '0', '0', '我是admin', '111111', '15032086039', '12345678123', '1', '1');
INSERT INTO `publicdisplay_project` VALUES ('5', '项目1', 'assddasd', '11', '11', '0', '2018-05-15 11:48:39', '0', '0', '2018-05-15 11:48:39', 'head_img/2018/05/12_38.jpg', 'detail/2018/05/12_7_YjWS7eK.jpg', '0', '0', '2131', 'wdd', '15032086039', '12345678123', '2', '1');

-- ----------------------------
-- Table structure for `publicdisplay_project_tag`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_project_tag`;
CREATE TABLE `publicdisplay_project_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `twolable_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PublicDisplay_project_tag_project_id_a5b3df9f_uniq` (`project_id`,`twolable_id`),
  KEY `PublicDisplay__twolable_id_4bb2eb2f_fk_PublicDisplay_twolable_id` (`twolable_id`),
  CONSTRAINT `PublicDisplay__twolable_id_4bb2eb2f_fk_PublicDisplay_twolable_id` FOREIGN KEY (`twolable_id`) REFERENCES `publicdisplay_twolable` (`id`),
  CONSTRAINT `PublicDisplay_pr_project_id_a5a5ab80_fk_PublicDisplay_project_id` FOREIGN KEY (`project_id`) REFERENCES `publicdisplay_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_project_tag
-- ----------------------------
INSERT INTO `publicdisplay_project_tag` VALUES ('1', '1', '1');
INSERT INTO `publicdisplay_project_tag` VALUES ('2', '2', '1');
INSERT INTO `publicdisplay_project_tag` VALUES ('3', '3', '1');
INSERT INTO `publicdisplay_project_tag` VALUES ('4', '4', '1');
INSERT INTO `publicdisplay_project_tag` VALUES ('5', '5', '1');

-- ----------------------------
-- Table structure for `publicdisplay_return`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_return`;
CREATE TABLE `publicdisplay_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL,
  `supportmoney` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `explain` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `purchase` int(11) NOT NULL,
  `freight` int(11) NOT NULL,
  `invoice` varchar(1) NOT NULL,
  `rtndate` varchar(11) NOT NULL,
  `projectid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PublicDisplay__projectid_id_70997ec4_fk_PublicDisplay_project_id` (`projectid_id`),
  CONSTRAINT `PublicDisplay__projectid_id_70997ec4_fk_PublicDisplay_project_id` FOREIGN KEY (`projectid_id`) REFERENCES `publicdisplay_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_return
-- ----------------------------
INSERT INTO `publicdisplay_return` VALUES ('1', '0', '123', '231', 'explain/2018/05/12_4.gif', '0', '0', '0', '', '2', '1');
INSERT INTO `publicdisplay_return` VALUES ('2', '1', '3123', '请问', 'explain/2018/05/12_7_Y40R7Jw.png', '0', '0', '0', '', '3', '1');
INSERT INTO `publicdisplay_return` VALUES ('3', '0', '3123', 'qqqqqqq', 'explain/2018/05/12_7_2ndsgo8.png', '0', '0', '0', '', '12', '3');
INSERT INTO `publicdisplay_return` VALUES ('4', '0', '3123', '1111', 'explain/2018/05/12_7_yEl40IS.png', '11', '0', '0', '', '2', '4');
INSERT INTO `publicdisplay_return` VALUES ('5', '0', '3123', '手机一台', 'explain/2018/05/12_7.gif', '0', '0', '0', '', '12', '5');

-- ----------------------------
-- Table structure for `publicdisplay_support`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_support`;
CREATE TABLE `publicdisplay_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `returns_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PublicDisplay_support_b5c3e75b` (`member_id`),
  KEY `PublicDisplay_support_b098ad43` (`project_id`),
  KEY `PublicDisplay_support_3458a875` (`returns_id`),
  CONSTRAINT `PublicDisplay_sup_returns_id_58d14a6e_fk_PublicDisplay_return_id` FOREIGN KEY (`returns_id`) REFERENCES `publicdisplay_return` (`id`),
  CONSTRAINT `PublicDisplay_supp_member_id_b9b36fd9_fk_PublicDisplay_member_id` FOREIGN KEY (`member_id`) REFERENCES `publicdisplay_member` (`id`),
  CONSTRAINT `PublicDisplay_su_project_id_840e5038_fk_PublicDisplay_project_id` FOREIGN KEY (`project_id`) REFERENCES `publicdisplay_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_support
-- ----------------------------

-- ----------------------------
-- Table structure for `publicdisplay_tag`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_tag`;
CREATE TABLE `publicdisplay_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_tag
-- ----------------------------
INSERT INTO `publicdisplay_tag` VALUES ('1', '电子');

-- ----------------------------
-- Table structure for `publicdisplay_twolable`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_twolable`;
CREATE TABLE `publicdisplay_twolable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PublicDisplay_twolable_tag_id_f93226f1_fk_PublicDisplay_tag_id` (`tag_id`),
  CONSTRAINT `PublicDisplay_twolable_tag_id_f93226f1_fk_PublicDisplay_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `publicdisplay_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_twolable
-- ----------------------------
INSERT INTO `publicdisplay_twolable` VALUES ('1', '电子11', '1');

-- ----------------------------
-- Table structure for `publicdisplay_type`
-- ----------------------------
DROP TABLE IF EXISTS `publicdisplay_type`;
CREATE TABLE `publicdisplay_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicdisplay_type
-- ----------------------------
INSERT INTO `publicdisplay_type` VALUES ('1', '生活', '生活美好');

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_PublicDisplay_member_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_PublicDisplay_member_id` FOREIGN KEY (`user_id`) REFERENCES `publicdisplay_member` (`id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_PublicDisplay_member_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_PublicDisplay_member_id` FOREIGN KEY (`user_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-05-14 10:04:03', '127.0.0.1', '1', '生活', 'create', '已添加。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('2', '2018-05-14 10:04:18', '127.0.0.1', '1', '电子', 'create', '已添加。', '7', '2');
INSERT INTO `xadmin_log` VALUES ('3', '2018-05-14 10:04:34', '127.0.0.1', '1', '电子11', 'create', '已添加。', '8', '2');
INSERT INTO `xadmin_log` VALUES ('4', '2018-05-14 10:07:48', '127.0.0.1', '2', 'admin', 'change', '已修改 last_login，user_type，authstatus，real_name 和 cardnum 。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('5', '2018-05-14 10:07:58', '127.0.0.1', '1', 'cgs111', 'change', '已修改 last_login，authstatus，real_name 和 cardnum 。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('6', '2018-05-14 10:08:36', '127.0.0.1', '1', 'cgs111', 'change', '没有字段被修改。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('7', '2018-05-14 10:10:47', '127.0.0.1', '2', 'admin', 'change', '已修改 email 。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('8', '2018-05-15 11:40:27', '127.0.0.1', '1', 'Banner object', 'create', '已添加。', '21', '2');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_PublicDisplay_member_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_PublicDisplay_member_id` FOREIGN KEY (`user_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '2');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_PublicDisplay_member_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_PublicDisplay_member_id` FOREIGN KEY (`user_id`) REFERENCES `publicdisplay_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
