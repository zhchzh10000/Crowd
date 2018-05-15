/*
Navicat MySQL Data Transfer

Source Server         : win
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2018-05-11 19:28:15
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('11', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('15', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add Bookmark', '7', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('26', 'Can change Bookmark', '7', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete Bookmark', '7', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('28', 'Can add User Setting', '8', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('29', 'Can change User Setting', '8', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete User Setting', '8', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('31', 'Can add User Widget', '9', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('32', 'Can change User Widget', '9', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete User Widget', '9', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('34', 'Can add log entry', '10', 'add_log');
INSERT INTO `auth_permission` VALUES ('35', 'Can change log entry', '10', 'change_log');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete log entry', '10', 'delete_log');
INSERT INTO `auth_permission` VALUES ('37', 'Can view Bookmark', '7', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('38', 'Can view log entry', '10', 'view_log');
INSERT INTO `auth_permission` VALUES ('39', 'Can view User Setting', '8', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('40', 'Can view User Widget', '9', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('41', 'Can add user msg', '11', 'add_usermsg');
INSERT INTO `auth_permission` VALUES ('42', 'Can change user msg', '11', 'change_usermsg');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete user msg', '11', 'delete_usermsg');
INSERT INTO `auth_permission` VALUES ('44', 'Can view user msg', '11', 'view_usermsg');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 商品信息', '12', 'add_productmsg');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 商品信息', '12', 'change_productmsg');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 商品信息', '12', 'delete_productmsg');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 商品信息', '12', 'view_productmsg');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 验证码', '13', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 验证码', '13', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 验证码', '13', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 验证码', '13', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 公司信息', '14', 'add_companymsg');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 公司信息', '14', 'change_companymsg');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 公司信息', '14', 'delete_companymsg');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 公司信息', '14', 'view_companymsg');
INSERT INTO `auth_permission` VALUES ('57', 'Can add pro follow', '15', 'add_profollow');
INSERT INTO `auth_permission` VALUES ('58', 'Can change pro follow', '15', 'change_profollow');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete pro follow', '15', 'delete_profollow');
INSERT INTO `auth_permission` VALUES ('60', 'Can view pro follow', '15', 'view_profollow');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 回报信息', '16', 'add_reproduct');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 回报信息', '16', 'change_reproduct');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 回报信息', '16', 'delete_reproduct');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 回报信息', '16', 'view_reproduct');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$M20XaEnOdcuU$H7EToCP1b+qvHZwBBvAKpShDAJZIVsx05RgCgOveGw0=', '2018-05-10 03:06:45.529548', '1', 'admin', '', '', '', '1', '1', '2018-05-09 04:00:27.126769');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('14', 'product', 'companymsg');
INSERT INTO `django_content_type` VALUES ('12', 'product', 'productmsg');
INSERT INTO `django_content_type` VALUES ('15', 'product', 'profollow');
INSERT INTO `django_content_type` VALUES ('16', 'product', 'reproduct');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('13', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('11', 'users', 'usermsg');
INSERT INTO `django_content_type` VALUES ('7', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('10', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('8', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-09 03:59:48.908390');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-05-09 03:59:50.017500');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-05-09 03:59:50.251895');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-05-09 03:59:50.286233');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-05-09 03:59:50.431679');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-05-09 03:59:50.530751');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-05-09 03:59:50.624562');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-05-09 03:59:50.640138');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-05-09 03:59:50.718306');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-05-09 03:59:50.718306');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-05-09 03:59:50.733975');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-05-09 03:59:50.905806');
INSERT INTO `django_migrations` VALUES ('16', 'xadmin', '0001_initial', '2018-05-09 03:59:51.487512');
INSERT INTO `django_migrations` VALUES ('17', 'xadmin', '0002_log', '2018-05-09 03:59:51.771291');
INSERT INTO `django_migrations` VALUES ('18', 'xadmin', '0003_auto_20160715_0100', '2018-05-09 03:59:51.896283');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('145fs1guo9efhov99h5emcehzt9uiinu', 'M2QwNWJlNDk1MmM0MzZiZTk2ZDI4ZTFmMTFiNDg4NmEyNzQ3MmQ4Zjp7ImlzbG9naW4iOnRydWUsIm5hbWUiOiJ4aW9uZyIsInVzZXJfaWQiOjIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWIzZGI2OWI2MjQ4ZTI0ZGZmZGZkZjQzMTMzYmI0ODQzMTQ2ZTkxIiwiTElTVF9RVUVSWSI6W1sicHJvZHVjdCIsInByb2R1Y3Rtc2ciXSwiIl19', '2018-05-24 01:12:51.043542');
INSERT INTO `django_session` VALUES ('240yzsqplxcd5t7u8zh9m5l3va0ce7mk', 'YmNjYWNjZGYzZGNjNDk4NzQzZGQyMTdiNWQyMzg2N2VmNjQzOTExYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWIzZGI2OWI2MjQ4ZTI0ZGZmZGZkZjQzMTMzYmI0ODQzMTQ2ZTkxIiwiTElTVF9RVUVSWSI6W1sicHJvZHVjdCIsInByb2R1Y3Rtc2ciXSwiIl19', '2018-05-25 01:50:56.640488');
INSERT INTO `django_session` VALUES ('4lg3oltd9qxzzjhx1ib5lukbzkdoe2h7', 'MmNiMTQ2OTY0OTY2MzhiMDk0NzAyNjA5YTNmYTBmN2U2ZDUxN2QyZTp7ImlzbG9naW4iOnRydWUsIm5hbWUiOiJ4aW9uZyIsInVzZXJfaWQiOjN9', '2018-05-24 06:55:59.513046');
INSERT INTO `django_session` VALUES ('t0nv466m3qlhkmhw7iyjigjmf7a5sv2n', 'YmNjYWNjZGYzZGNjNDk4NzQzZGQyMTdiNWQyMzg2N2VmNjQzOTExYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWIzZGI2OWI2MjQ4ZTI0ZGZmZGZkZjQzMTMzYmI0ODQzMTQ2ZTkxIiwiTElTVF9RVUVSWSI6W1sicHJvZHVjdCIsInByb2R1Y3Rtc2ciXSwiIl19', '2018-05-24 03:03:30.617020');
INSERT INTO `django_session` VALUES ('zpmnmfim1hibq9rvaozplwk9wi4qln0w', 'MmNiMTQ2OTY0OTY2MzhiMDk0NzAyNjA5YTNmYTBmN2U2ZDUxN2QyZTp7ImlzbG9naW4iOnRydWUsIm5hbWUiOiJ4aW9uZyIsInVzZXJfaWQiOjN9', '2018-05-24 09:26:12.045228');

-- ----------------------------
-- Table structure for `product_companymsg`
-- ----------------------------
DROP TABLE IF EXISTS `product_companymsg`;
CREATE TABLE `product_companymsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_companymsg
-- ----------------------------
INSERT INTO `product_companymsg` VALUES ('1', '2018-05-11 01:36:21.459062', '2018-05-11 01:36:21.459062', '小米公司', '不仅仅是一家卖米的公司', '6541531565');
INSERT INTO `product_companymsg` VALUES ('2', '2018-05-11 01:39:03.949551', '2018-05-11 01:39:03.949551', '步步高点读机', '哪里不会点哪里', '153156153');
INSERT INTO `product_companymsg` VALUES ('3', '2018-05-11 01:41:49.206961', '2018-05-11 01:41:49.206961', '诺基亚', '哪个公司有我们头铁', '131332131');
INSERT INTO `product_companymsg` VALUES ('4', '2018-05-11 01:43:20.286752', '2018-05-11 01:43:20.286752', '惠普基本本', '不了解', '12312312');
INSERT INTO `product_companymsg` VALUES ('5', '2018-05-11 01:44:49.233096', '2018-05-11 01:44:49.233096', '苹果公司', '被手机耽误的水果公司', '1231231231');
INSERT INTO `product_companymsg` VALUES ('6', '2018-05-11 01:46:44.742426', '2018-05-11 01:46:44.742426', '360安全卫士', '自动安装的让你爽死你', '1212121');

-- ----------------------------
-- Table structure for `product_productmsg`
-- ----------------------------
DROP TABLE IF EXISTS `product_productmsg`;
CREATE TABLE `product_productmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `pro_sales` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `mode` smallint(6) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `prcie_back` decimal(10,2),
  `target_price` decimal(10,2) NOT NULL,
  `reach_price` decimal(10,2) NOT NULL,
  `one_num` int(11) DEFAULT NULL,
  `support_num` int(11) NOT NULL,
  `target_num` int(11) NOT NULL,
  `fin_day` int(11) NOT NULL,
  `follow` int(11) NOT NULL,
  `tag` varchar(60) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image_dec` varchar(100) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_productmsg_company_id_a45a53f0_fk_product_companymsg_id` (`company_id`),
  CONSTRAINT `product_productmsg_company_id_a45a53f0_fk_product_companymsg_id` FOREIGN KEY (`company_id`) REFERENCES `product_companymsg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_productmsg
-- ----------------------------
INSERT INTO `product_productmsg` VALUES ('1', '2018-05-11 01:36:56.749562', '2018-05-11 02:17:59.624819', '小米手机', '卖一台亏一台的手机，雷军都要亏成首富了', '0', '0', '1', '3000.00', '3500.00', '300000.00', '30000.00', '576', '10', '100', '10', '20', '数码，手机', 'books/pro1_GVIkTYx.jpg', 'books/pro1_bilNhjd.jpg', '1');
INSERT INTO `product_productmsg` VALUES ('2', '2018-05-11 01:40:35.123524', '2018-05-11 01:45:10.890539', 'vivo', 'vivo大法好', '100000', '0', '1', '2000.00', '4000.00', '400000.00', '100000.00', '23', '50', '200', '10', '20', '数码，科技', 'books/ca-2_NlH1nD1.jpg', 'books/ca-2_wkecjps.jpg', '2');
INSERT INTO `product_productmsg` VALUES ('3', '2018-05-11 01:42:12.786089', '2018-05-11 01:42:12.786089', '诺基亚', '手机中的战斗机', '100000', '0', '1', '3000.00', '0.00', '300000.00', '0.00', '0', '0', '200', '10', '0', '手机，数码', 'books/ca-3_A9KUUVo.jpg', 'books/ca-3_kRrbT9c.jpg', '3');
INSERT INTO `product_productmsg` VALUES ('4', '2018-05-11 01:43:22.639099', '2018-05-11 01:45:04.079233', '惠普笔记本', '笔记本电脑', '4511151', '0', '0', '0.00', '0.00', '21231232.00', '0.00', '0', '0', '200', '10', '0', '数码，电脑', 'books/ca-1_L58Oqq2.jpg', 'books/ca-1_MU8Qize.jpg', '4');
INSERT INTO `product_productmsg` VALUES ('5', '2018-05-11 01:35:55.000000', '2018-05-11 01:44:55.693443', '苹果手机8', '用苹果做成的手机', '21', '0', '1', '0.00', '0.00', '122121.00', '0.00', '0', '0', '200', '10', '0', '数码，手机', 'books/pro3_s5iXLPz.jpg', 'books/pro3_aTGco5K.jpg', '5');
INSERT INTO `product_productmsg` VALUES ('6', '2018-05-11 01:35:56.000000', '2018-05-11 01:46:55.347944', '360手机', '一家专门做手机的网站', '121', '0', '1', '-0.02', '0.00', '9999.98', '0.00', '0', '0', '200', '10', '0', '数码，手机', 'books/pro4_trPLmSu.jpg', 'books/pro4_aUMJTW3.jpg', '6');
INSERT INTO `product_productmsg` VALUES ('7', '2018-05-11 01:35:58.000000', '2018-05-11 01:47:58.629895', 'oppo', '红蓝大法打天下', '10', '0', '1', '0.00', '0.00', '50000.00', '0.00', '0', '0', '200', '10', '20', '数码，手机', 'books/pro2_NRhrciW.jpg', 'books/pro2_96B8n2g.jpg', '2');
INSERT INTO `product_productmsg` VALUES ('8', '2018-05-11 01:49:23.982521', '2018-05-11 01:49:23.982521', '智能高清监控机器人', '可爱的造型，摄像安防远程互联的全能设计让你随时随地守护您的家人，陪伴你的生活', '0', '0', '0', '0.00', '0.00', '11111.00', '0.00', '0', '0', '200', '10', '0', '数码，科技', 'books/p1_tqZht9u.jpg', 'books/p1_AkRojIu.jpg', '4');
INSERT INTO `product_productmsg` VALUES ('9', '2018-05-11 01:50:04.872688', '2018-05-11 01:50:04.872688', 'NEOKA智能手环', '要运动更要安全，这款、名为“蝶舞”的NEOKA-V9100智能运动手环为“安全运动而生”。', '12', '0', '0', '0.00', '0.00', '1111111.00', '0.00', '0', '0', '200', '10', '0', '数码，运动', 'books/p2_TMqYdyA.jpg', 'books/p2_4fPcuHT.jpg', '3');
INSERT INTO `product_productmsg` VALUES ('10', '2018-05-11 01:50:56.494041', '2018-05-11 01:50:56.494041', '驱蚊扣', '随处使用的驱蚊纽扣， 解决夏季蚊虫问题。', '0', '1', '0', '0.00', '0.00', '11111.00', '0.00', '0', '0', '200', '10', '0', '。不知道', 'books/p3.jpg', 'books/p3_3fpLXO8.jpg', '2');

-- ----------------------------
-- Table structure for `product_profollow`
-- ----------------------------
DROP TABLE IF EXISTS `product_profollow`;
CREATE TABLE `product_profollow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `fav_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_profollow_user_id_d6b15ea3_fk_users_usermsg_id` (`user_id`),
  CONSTRAINT `product_profollow_user_id_d6b15ea3_fk_users_usermsg_id` FOREIGN KEY (`user_id`) REFERENCES `users_usermsg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_profollow
-- ----------------------------

-- ----------------------------
-- Table structure for `product_reproduct`
-- ----------------------------
DROP TABLE IF EXISTS `product_reproduct`;
CREATE TABLE `product_reproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `retype` smallint(6) NOT NULL,
  `recon` varchar(300) NOT NULL,
  `explainImage` varchar(100) NOT NULL,
  `re_num` int(11) NOT NULL,
  `num_type` int(11) NOT NULL,
  `buy_num` int(11) NOT NULL,
  `fare_price` decimal(10,2) NOT NULL,
  `is_bill` smallint(6) NOT NULL,
  `re_day` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supper_price` decimal(11,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reproduct_9bea82de` (`product_id`),
  CONSTRAINT `product_reproduct_product_id_a0f162ec_fk_product_productmsg_id` FOREIGN KEY (`product_id`) REFERENCES `product_productmsg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_reproduct
-- ----------------------------

-- ----------------------------
-- Table structure for `users_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('2', '2018-05-09 08:54:34.467246', '2018-05-09 08:54:34.468249', 'KD3o5kEgEeUlWYdw', '492991601@qq.com', 'register');
INSERT INTO `users_emailverifyrecord` VALUES ('3', '2018-05-09 08:56:13.861960', '2018-05-09 08:56:13.862957', 'SVFixqfpaKeyBGxn', '492991601@qq.com', 'register');
INSERT INTO `users_emailverifyrecord` VALUES ('4', '2018-05-09 09:00:38.968883', '2018-05-09 09:00:38.969913', 'ggAruTrGb1E2KN9t', '492991601@qq.com', 'register');
INSERT INTO `users_emailverifyrecord` VALUES ('5', '2018-05-09 09:07:19.823474', '2018-05-09 09:07:19.824449', 'cRvKVSk9wADsHalY', '492991601@qq.com', 'register');
INSERT INTO `users_emailverifyrecord` VALUES ('6', '2018-05-09 09:07:47.794551', '2018-05-09 09:07:47.795554', 'LYrJmzTTo9tJtYKv', '4925864@qq.com', 'register');
INSERT INTO `users_emailverifyrecord` VALUES ('7', '2018-05-10 06:55:37.328189', '2018-05-10 06:55:37.328689', 'YlRPkpMlNwLtvkCn', '156156516@qq.com', 'register');

-- ----------------------------
-- Table structure for `users_usermsg`
-- ----------------------------
DROP TABLE IF EXISTS `users_usermsg`;
CREATE TABLE `users_usermsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  `option` smallint(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_usermsg
-- ----------------------------
INSERT INTO `users_usermsg` VALUES ('3', '2018-05-10 06:55:42.353531', '2018-05-10 06:55:42.353531', 'xiong', '81f0c4ab9b5679964eab3692a28c6daa905d6fc9', '156156516@qq.com', '1', '0');

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
  KEY `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-05-09 05:48:48.891884', '127.0.0.1', '1', 'vivo x30', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-05-09 05:49:32.694881', '127.0.0.1', '2', '诺基亚', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-05-09 05:49:56.591691', '127.0.0.1', '3', '惠普', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-05-09 05:53:33.241728', '127.0.0.1', '3', '惠普', 'change', '已修改 pro_sales 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-05-09 05:53:38.896768', '127.0.0.1', '2', '诺基亚', 'change', '已修改 pro_sales 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-05-09 05:53:44.679832', '127.0.0.1', '1', 'vivo x30', 'change', '已修改 pro_sales 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-05-09 10:41:32.022027', '127.0.0.1', '4', '智能高清监控机器人', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-05-09 10:42:05.126252', '127.0.0.1', '5', 'NEOKA智能手环', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-05-09 10:42:44.921120', '127.0.0.1', '6', '驱蚊扣', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-05-09 10:58:08.442893', '127.0.0.1', '7', 'oppo大法好', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-05-09 10:59:30.620489', '127.0.0.1', '8', '小米个笑话', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-05-09 11:02:19.187300', '127.0.0.1', '9', '360战斗机', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-05-09 11:03:17.145614', '127.0.0.1', '10', '苹果手机', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-05-09 13:49:25.560435', '127.0.0.1', '1', 'CompanyMsg object', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-05-09 13:49:29.262301', '127.0.0.1', '10', '苹果手机', 'change', '已修改 company 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-05-09 16:02:00.182317', '127.0.0.1', '10', '苹果手机', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-05-09 16:02:08.759039', '127.0.0.1', '9', '360战斗机', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-05-09 16:02:20.792255', '127.0.0.1', '6', '驱蚊扣', 'change', '已修改 type 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-05-09 16:02:25.822766', '127.0.0.1', '5', 'NEOKA智能手环', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-05-09 16:02:32.342323', '127.0.0.1', '3', '惠普', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-05-09 16:04:09.793228', '127.0.0.1', '2', 'CompanyMsg object', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-05-09 16:05:01.297292', '127.0.0.1', '1', 'vivo x30', 'change', '已修改 company 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-05-09 16:05:08.772365', '127.0.0.1', '7', 'oppo大法好', 'change', '已修改 company 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-05-10 01:11:57.012217', '127.0.0.1', '10', '苹果手机', 'change', '已修改 mode 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-05-10 01:12:02.459740', '127.0.0.1', '9', '360战斗机', 'change', '已修改 mode 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-05-10 01:12:09.227385', '127.0.0.1', '8', '小米个笑话', 'change', '已修改 mode 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-05-10 01:12:14.971908', '127.0.0.1', '7', 'oppo大法好', 'change', '已修改 mode 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-05-10 03:05:19.284668', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户信息', null, '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-05-10 03:10:25.681796', '127.0.0.1', '10', '苹果手机', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-05-10 03:18:45.154389', '127.0.0.1', '11', '苹果手机', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-05-10 03:25:12.821964', '127.0.0.1', '3', 'apple', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-05-10 03:25:20.791988', '127.0.0.1', '11', '苹果手机', 'change', '已修改 one_num 和 company 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-05-10 03:42:14.444588', '127.0.0.1', '3', 'apple', 'delete', '', '14', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-05-10 03:43:55.651010', '127.0.0.1', '12', '苹果手机8', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-05-10 03:44:22.508700', '127.0.0.1', '1', 'apple', 'change', '已修改 desc 。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-05-10 03:45:15.807872', '127.0.0.1', '12', '苹果手机8', 'change', '已修改 target_price 和 reach_price 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-05-10 07:00:41.547385', '127.0.0.1', '7', 'oppo大法好', 'change', '已修改 desc，price，prcie_back，reach_price，one_num，support_num 和 follow 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-05-11 01:36:21.460062', '127.0.0.1', '1', '小米公司', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-05-11 01:36:56.757557', '127.0.0.1', '1', '小米手机', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-05-11 01:39:03.950553', '127.0.0.1', '2', '步步高点读机', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-05-11 01:40:35.132551', '127.0.0.1', '2', 'vivo', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-05-11 01:41:49.207975', '127.0.0.1', '3', '诺基亚', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-05-11 01:42:12.794110', '127.0.0.1', '3', '诺基亚', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-05-11 01:43:20.287762', '127.0.0.1', '4', '惠普基本本', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-05-11 01:43:22.645088', '127.0.0.1', '4', '惠普笔记本', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-05-11 01:44:49.236094', '127.0.0.1', '5', '苹果公司', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-05-11 01:44:55.701476', '127.0.0.1', '5', '苹果手机8', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-05-11 01:45:04.081241', '127.0.0.1', '4', '惠普笔记本', 'change', '已修改 pro_sales 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-05-11 01:45:10.891581', '127.0.0.1', '2', 'vivo', 'change', '没有字段被修改。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-05-11 01:46:44.742426', '127.0.0.1', '6', '360安全卫士', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-05-11 01:46:55.354966', '127.0.0.1', '6', '360手机', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-05-11 01:47:58.639892', '127.0.0.1', '7', 'oppo', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-05-11 01:49:23.990516', '127.0.0.1', '8', '智能高清监控机器人', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-05-11 01:50:04.879708', '127.0.0.1', '9', 'NEOKA智能手环', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-05-11 01:50:56.501059', '127.0.0.1', '10', '驱蚊扣', 'create', '已添加。', '12', '1');

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
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', 'https://bootswatch.com/3/lumen/bootstrap.min.css', '1');

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
  KEY `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
