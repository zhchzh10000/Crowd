/*
Navicat MySQL Data Transfer

Source Server         : lunx
Source Server Version : 50722
Source Host           : 192.168.20.33:3306
Source Database       : crowd

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-15 13:17:40
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 项目广告', '7', 'add_advertisement');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 项目广告', '7', 'change_advertisement');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 项目广告', '7', 'delete_advertisement');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 项目类型', '8', 'add_projecttype');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 项目类型', '8', 'change_projecttype');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 项目类型', '8', 'delete_projecttype');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 项目信息', '9', 'add_project');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 项目信息', '9', 'change_project');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 项目信息', '9', 'delete_project');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 轮播图', '10', 'add_banner');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 轮播图', '10', 'change_banner');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 轮播图', '10', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 项目标签', '11', 'add_porjecttag');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 项目标签', '11', 'change_porjecttag');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 项目标签', '11', 'delete_porjecttag');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 项目状态', '12', 'add_state');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 项目状态', '12', 'change_state');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 项目状态', '12', 'delete_state');
INSERT INTO `auth_permission` VALUES ('37', 'Can add return', '13', 'add_return');
INSERT INTO `auth_permission` VALUES ('38', 'Can change return', '13', 'change_return');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete return', '13', 'delete_return');

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
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-05-14 13:44:33.758037', '1', '农业', '1', '已添加。', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-05-14 14:04:31.239564', '1', '手机', '1', '已添加。', '11', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-05-14 14:05:06.896763', '2', '电脑', '1', '已添加。', '11', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-05-14 14:05:14.145743', '3', '数码', '1', '已添加。', '11', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('10', 'project', 'banner');
INSERT INTO `django_content_type` VALUES ('11', 'project', 'porjecttag');
INSERT INTO `django_content_type` VALUES ('9', 'project', 'project');
INSERT INTO `django_content_type` VALUES ('8', 'project', 'projecttype');
INSERT INTO `django_content_type` VALUES ('13', 'project', 'return');
INSERT INTO `django_content_type` VALUES ('12', 'project', 'state');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'advertisement');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'project', '0001_initial', '2018-05-14 13:36:52.164253');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0001_initial', '2018-05-14 13:36:52.182397');
INSERT INTO `django_migrations` VALUES ('3', 'contenttypes', '0002_remove_content_type_name', '2018-05-14 13:36:52.211533');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0001_initial', '2018-05-14 13:36:52.347737');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2018-05-14 13:36:52.367238');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2018-05-14 13:36:52.376320');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2018-05-14 13:36:52.382945');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2018-05-14 13:36:52.402760');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2018-05-14 13:36:52.405501');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0007_alter_validators_add_error_messages', '2018-05-14 13:36:52.411065');
INSERT INTO `django_migrations` VALUES ('11', 'users', '0001_initial', '2018-05-14 13:36:52.670302');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2018-05-14 13:36:52.715742');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2018-05-14 13:36:52.736088');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-05-14 13:36:52.750926');
INSERT INTO `django_migrations` VALUES ('15', 'project', '0002_return', '2018-05-15 02:26:25.783807');

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
INSERT INTO `django_session` VALUES ('orin67btdqrb6ystq948qai87bfwmujz', 'MjM3OWEzZWE0OThjMjIwMDZlMDdhNzRkNWI0YWJkMGZhODc1NmFjMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzY2IyNmFjMjc1MTAzM2MxYWVmMjljOTI3NGMyZTA1M2JjY2RlMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-28 13:42:56.343069');
INSERT INTO `django_session` VALUES ('t21sn6by4v18ilqzdgowrem867cjtzx8', 'OGFiYzYzOWZiM2ZmYTQwZThjMGFhNDZlZWEyMmEwODkwYjRmZDNiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzNjYjI2YWMyNzUxMDMzYzFhZWYyOWM5Mjc0YzJlMDUzYmNjZGUzNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-05-29 02:50:18.663120');

-- ----------------------------
-- Table structure for `project_banner`
-- ----------------------------
DROP TABLE IF EXISTS `project_banner`;
CREATE TABLE `project_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_banner
-- ----------------------------

-- ----------------------------
-- Table structure for `project_porjecttag`
-- ----------------------------
DROP TABLE IF EXISTS `project_porjecttag`;
CREATE TABLE `project_porjecttag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_porjecttag
-- ----------------------------
INSERT INTO `project_porjecttag` VALUES ('1', '手机');
INSERT INTO `project_porjecttag` VALUES ('2', '电脑');
INSERT INTO `project_porjecttag` VALUES ('3', '数码');

-- ----------------------------
-- Table structure for `project_porjecttag_pid`
-- ----------------------------
DROP TABLE IF EXISTS `project_porjecttag_pid`;
CREATE TABLE `project_porjecttag_pid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `porjecttag_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_porjecttag_pid_porjecttag_id_076f2aad_uniq` (`porjecttag_id`,`project_id`),
  KEY `project_porjecttag_pid_project_id_5407ea44_fk_project_project_id` (`project_id`),
  CONSTRAINT `project_porjectt_porjecttag_id_8ed144b1_fk_project_porjecttag_id` FOREIGN KEY (`porjecttag_id`) REFERENCES `project_porjecttag` (`id`),
  CONSTRAINT `project_porjecttag_pid_project_id_5407ea44_fk_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_porjecttag_pid
-- ----------------------------
INSERT INTO `project_porjecttag_pid` VALUES ('1', '1', '1');
INSERT INTO `project_porjecttag_pid` VALUES ('2', '2', '1');
INSERT INTO `project_porjecttag_pid` VALUES ('3', '3', '1');

-- ----------------------------
-- Table structure for `project_project`
-- ----------------------------
DROP TABLE IF EXISTS `project_project`;
CREATE TABLE `project_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `money` bigint(20) NOT NULL,
  `day` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `deploydate` varchar(10) NOT NULL,
  `supportmoney` int(11) NOT NULL,
  `supporter` int(11) NOT NULL,
  `completion` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `createdate` datetime(6) DEFAULT NULL,
  `stopdate` datetime(6) DEFAULT NULL,
  `follower` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `Target_amount` int(11) NOT NULL,
  `reach` int(11) NOT NULL,
  `send` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `info` varchar(400) NOT NULL,
  `infos` varchar(2000) NOT NULL,
  `infoimage` varchar(100) NOT NULL,
  `my_info` varchar(2000) NOT NULL,
  `my_infos` varchar(2000) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `project_type_id` int(11),
  PRIMARY KEY (`id`),
  KEY `project_project_9894c25e` (`project_type_id`),
  CONSTRAINT `project_proje_project_type_id_bb6eec6c_fk_project_projecttype_id` FOREIGN KEY (`project_type_id`) REFERENCES `project_projecttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_project
-- ----------------------------
INSERT INTO `project_project` VALUES ('1', 'qqq', 'qqq', '0', '11', '0', '0', '0', '0', '0', '0', '2018-05-14 14:01:06.976250', '2018-05-14 14:01:06.976262', '0', '0', '111', '0', '0', 'image/2018/05/u4093173861414132688fm214gp0.jpg', '', '', 'image/2018/05/services-box3.jpg', '11', '11', '111111', '111', '1');
INSERT INTO `project_project` VALUES ('2', '１１', '１１', '0', '11', '0', '0', '0', '0', '0', '0', '2018-05-14 14:09:44.367202', '2018-05-14 14:09:44.367220', '0', '0', '11', '0', '0', 'image/2018/05/u9305857402145262382fm27gp0_cHDgeAC.jpg', '', '', 'image/2018/05/u9305857402145262382fm27gp0_Mt7fbWe.jpg', '１１', '１１', '11', '11', '1');
INSERT INTO `project_project` VALUES ('3', '项目名称', '一句话简介', '0', '1', '0', '0', '0', '0', '0', '0', '2018-05-15 02:59:02.049867', '2018-05-15 02:59:02.049882', '0', '0', '11', '0', '0', 'image/2018/05/W020160819353335849316_1bWajeG.jpg', '', '', 'image/2018/05/product_detail_head_VhrTSL0.jpg', '自我介绍', '详细自我介', '12334', '8888', '1');
INSERT INTO `project_project` VALUES ('4', '项目名称', '一句话简介', '0', '1', '0', '0', '0', '0', '0', '0', '2018-05-15 03:00:21.228211', '2018-05-15 03:00:21.228225', '0', '0', '11', '0', '0', 'image/2018/05/W020160819353335849316_y0T4oeg.jpg', '', '', 'image/2018/05/product_detail_head_BuWq3xZ.jpg', '自我介绍', '详细自我介', '12334', '8888', '1');
INSERT INTO `project_project` VALUES ('5', '项目名称', '一句话简介', '0', '1', '0', '0', '0', '0', '0', '0', '2018-05-15 03:31:37.488800', '2018-05-15 03:31:37.488816', '0', '0', '11', '0', '0', 'image/2018/05/W020160819353335849316_BvJocZ7.jpg', '', '', 'image/2018/05/product_detail_head_SDQInKC.jpg', '自我介绍', '详细自我介', '12334', '8888', '1');

-- ----------------------------
-- Table structure for `project_projecttype`
-- ----------------------------
DROP TABLE IF EXISTS `project_projecttype`;
CREATE TABLE `project_projecttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_projecttype
-- ----------------------------
INSERT INTO `project_projecttype` VALUES ('1', '农业', '智能时代，酷驰触控厨房龙头，让煮妇解放双手，触发更多烹饪灵感，让美味信手拈来。');

-- ----------------------------
-- Table structure for `project_return`
-- ----------------------------
DROP TABLE IF EXISTS `project_return`;
CREATE TABLE `project_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_type` varchar(1) NOT NULL,
  `supportmoney` int(11) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `retimage` varchar(100) NOT NULL,
  `retnum` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `freight` int(11) NOT NULL,
  `invoice` varchar(1) NOT NULL,
  `rtndate` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_return_name_id_510fd485_fk_project_project_id` (`name_id`),
  CONSTRAINT `project_return_name_id_510fd485_fk_project_project_id` FOREIGN KEY (`name_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_return
-- ----------------------------

-- ----------------------------
-- Table structure for `project_state`
-- ----------------------------
DROP TABLE IF EXISTS `project_state`;
CREATE TABLE `project_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `pid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_state_pid_id_d76ac290_fk_project_project_id` (`pid_id`),
  CONSTRAINT `project_state_pid_id_d76ac290_fk_project_project_id` FOREIGN KEY (`pid_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_state
-- ----------------------------

-- ----------------------------
-- Table structure for `users_advertisement`
-- ----------------------------
DROP TABLE IF EXISTS `users_advertisement`;
CREATE TABLE `users_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2000) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `created` datetime(6) NOT NULL,
  `pid_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_advertisement_pid_id_d7dda24d_fk_project_project_id` (`pid_id`),
  KEY `users_advertisement_user_id_20cf9079_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `users_advertisement_pid_id_d7dda24d_fk_project_project_id` FOREIGN KEY (`pid_id`) REFERENCES `project_project` (`id`),
  CONSTRAINT `users_advertisement_user_id_20cf9079_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
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
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `loginacct` varchar(255) DEFAULT NULL,
  `authstatu` varchar(1) NOT NULL,
  `accttypes` varchar(1) NOT NULL,
  `base_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `users_userprofile_project_id_a6b27bbb_fk_project_project_id` (`project_id`),
  CONSTRAINT `users_userprofile_project_id_a6b27bbb_fk_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$8rpzSbtj6NQ3$d2/NCLaLGLjbB3yboQdjx1eqnfQLne4G9f0CBPlMcCA=', '2018-05-15 02:50:18.631230', '1', 'admin', '', '', '', '1', '1', '2018-05-14 13:42:41.646142', null, '', '', null, '', '', '0', '0', null);

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------
