/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50721
Source Host           : 47.104.98.86:3306
Source Database       : zhongchou

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-15 13:07:14
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户信息表', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户信息表', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户信息表', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 轮播图', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 轮播图', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 轮播图', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('27', 'Can view 轮播图', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 用户信息表', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('29', 'Can add Bookmark', '8', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('30', 'Can change Bookmark', '8', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete Bookmark', '8', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('32', 'Can add User Setting', '9', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('33', 'Can change User Setting', '9', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('34', 'Can delete User Setting', '9', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('35', 'Can add User Widget', '10', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('36', 'Can change User Widget', '10', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('37', 'Can delete User Widget', '10', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('38', 'Can add log entry', '11', 'add_log');
INSERT INTO `auth_permission` VALUES ('39', 'Can change log entry', '11', 'change_log');
INSERT INTO `auth_permission` VALUES ('40', 'Can delete log entry', '11', 'delete_log');
INSERT INTO `auth_permission` VALUES ('41', 'Can view Bookmark', '8', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('42', 'Can view log entry', '11', 'view_log');
INSERT INTO `auth_permission` VALUES ('43', 'Can view User Setting', '9', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('44', 'Can view User Widget', '10', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('45', 'Can add revision', '12', 'add_revision');
INSERT INTO `auth_permission` VALUES ('46', 'Can change revision', '12', 'change_revision');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete revision', '12', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('48', 'Can add version', '13', 'add_version');
INSERT INTO `auth_permission` VALUES ('49', 'Can change version', '13', 'change_version');
INSERT INTO `auth_permission` VALUES ('50', 'Can delete version', '13', 'delete_version');
INSERT INTO `auth_permission` VALUES ('51', 'Can view revision', '12', 'view_revision');
INSERT INTO `auth_permission` VALUES ('52', 'Can view version', '13', 'view_version');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 众筹项目表', '14', 'add_tproject');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 众筹项目表', '14', 'change_tproject');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 众筹项目表', '14', 'delete_tproject');
INSERT INTO `auth_permission` VALUES ('56', 'Can add 公司信息', '15', 'add_company');
INSERT INTO `auth_permission` VALUES ('57', 'Can change 公司信息', '15', 'change_company');
INSERT INTO `auth_permission` VALUES ('58', 'Can delete 公司信息', '15', 'delete_company');
INSERT INTO `auth_permission` VALUES ('59', 'Can add 产品标签', '16', 'add_tprojecttag');
INSERT INTO `auth_permission` VALUES ('60', 'Can change 产品标签', '16', 'change_tprojecttag');
INSERT INTO `auth_permission` VALUES ('61', 'Can delete 产品标签', '16', 'delete_tprojecttag');
INSERT INTO `auth_permission` VALUES ('62', 'Can add 产品类型', '17', 'add_tprojecttype');
INSERT INTO `auth_permission` VALUES ('63', 'Can change 产品类型', '17', 'change_tprojecttype');
INSERT INTO `auth_permission` VALUES ('64', 'Can delete 产品类型', '17', 'delete_tprojecttype');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 标签', '18', 'add_ttag');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 标签', '18', 'change_ttag');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 标签', '18', 'delete_ttag');
INSERT INTO `auth_permission` VALUES ('68', 'Can add 类型', '19', 'add_ttype');
INSERT INTO `auth_permission` VALUES ('69', 'Can change 类型', '19', 'change_ttype');
INSERT INTO `auth_permission` VALUES ('70', 'Can delete 类型', '19', 'delete_ttype');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 公司信息', '15', 'view_company');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 众筹项目表', '14', 'view_tproject');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 产品标签', '16', 'view_tprojecttag');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 产品类型', '17', 'view_tprojecttype');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 标签', '18', 'view_ttag');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 类型', '19', 'view_ttype');
INSERT INTO `auth_permission` VALUES ('77', 'Can add 邮箱验证码', '20', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('78', 'Can change 邮箱验证码', '20', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete 邮箱验证码', '20', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 邮箱验证码', '20', 'view_emailverifyrecord');

-- ----------------------------
-- Table structure for `crowfund_project`
-- ----------------------------
DROP TABLE IF EXISTS `crowfund_project`;
CREATE TABLE `crowfund_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `describe` varchar(300) DEFAULT NULL,
  `money` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `daploydate` date NOT NULL,
  `is_collection` tinyint(1) NOT NULL,
  `is_category` varchar(2) NOT NULL,
  `is_follow` tinyint(1) NOT NULL,
  `enddate` date NOT NULL,
  `supportmoney` bigint(20) NOT NULL,
  `supporter` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `day` int(11),
  PRIMARY KEY (`id`),
  KEY `crowfund_project_member_id_0c78807b_fk_user_userprofile_id` (`member_id`),
  CONSTRAINT `crowfund_project_member_id_0c78807b_fk_user_userprofile_id` FOREIGN KEY (`member_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crowfund_project
-- ----------------------------
INSERT INTO `crowfund_project` VALUES ('1', '0', '2018-05-14 13:28:10.049874', '2018-05-14 13:28:10.049923', '电扇', 'image/2018/05/p3.jpg', '1111', '100', '1', '2018-05-14', '1', 'kj', '1', '2018-05-21', '0', '0', '2', '7');

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
  KEY `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('15', 'projects', 'company');
INSERT INTO `django_content_type` VALUES ('14', 'projects', 'tproject');
INSERT INTO `django_content_type` VALUES ('16', 'projects', 'tprojecttag');
INSERT INTO `django_content_type` VALUES ('17', 'projects', 'tprojecttype');
INSERT INTO `django_content_type` VALUES ('18', 'projects', 'ttag');
INSERT INTO `django_content_type` VALUES ('19', 'projects', 'ttype');
INSERT INTO `django_content_type` VALUES ('12', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('13', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'user', 'banner');
INSERT INTO `django_content_type` VALUES ('20', 'user', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'user', 'userprofile');
INSERT INTO `django_content_type` VALUES ('8', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('11', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('10', 'xadmin', 'userwidget');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-14 12:59:59.148587');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-05-14 12:59:59.385202');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-05-14 12:59:59.981342');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-05-14 13:00:00.147897');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-05-14 13:00:00.236029');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-05-14 13:00:00.327404');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-05-14 13:00:00.420793');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-05-14 13:00:00.510562');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-05-14 13:00:00.603243');
INSERT INTO `django_migrations` VALUES ('10', 'user', '0001_initial', '2018-05-14 13:00:01.282973');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2018-05-14 13:00:01.600768');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2018-05-14 13:00:01.733817');
INSERT INTO `django_migrations` VALUES ('13', 'projects', '0001_initial', '2018-05-14 13:00:03.074308');
INSERT INTO `django_migrations` VALUES ('14', 'reversion', '0001_initial', '2018-05-14 13:00:03.857255');
INSERT INTO `django_migrations` VALUES ('15', 'reversion', '0002_auto_20141216_1509', '2018-05-14 13:00:03.943380');
INSERT INTO `django_migrations` VALUES ('16', 'reversion', '0003_auto_20160601_1600', '2018-05-14 13:00:04.028264');
INSERT INTO `django_migrations` VALUES ('17', 'reversion', '0004_auto_20160611_1202', '2018-05-14 13:00:04.118492');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2018-05-14 13:00:04.391262');
INSERT INTO `django_migrations` VALUES ('19', 'user', '0002_remove_banner_url', '2018-05-14 13:00:04.565433');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0001_initial', '2018-05-14 13:00:05.154369');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0002_log', '2018-05-14 13:00:05.437039');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0003_auto_20160715_0100', '2018-05-14 13:00:05.640543');
INSERT INTO `django_migrations` VALUES ('23', 'reversion', '0001_squashed_0004_auto_20160611_1202', '2018-05-14 13:00:05.762097');
INSERT INTO `django_migrations` VALUES ('24', 'projects', '0002_auto_20180514_2124', '2018-05-14 13:24:58.514222');
INSERT INTO `django_migrations` VALUES ('25', 'user', '0003_emailverifyrecord', '2018-05-15 02:37:43.088412');

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
INSERT INTO `django_session` VALUES ('0iacw6pd9tpeuwyjhmcex727u0nj1mby', 'NjRkY2EzZTMwMGI1Nzc2NjA0ZDExMGYxMWY4NzZjNjdjMmI1ZGM1Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ1MjI2OWVmOWMzOGZmY2M3YTNmZGVlY2U1M2EyZjVmZWFiZTUxYjYiLCJfYXV0aF91c2VyX2lkIjoiNiIsInBhc3Nwb3J0X2lkIjo2LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2018-05-29 03:33:47.336608');
INSERT INTO `django_session` VALUES ('0p0owq9km1fhmjnqjey65pxeyksg5x6n', 'MzVlYmM4ZTY0MTllNDUxYjIwNjFhMzNmNDk2ZjMyODkwZjAxYjZhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDhmOTc3MjlhZDU3NGY2OGRjMmU1NmUxZWYyNWY3MzEwMmExNjAzMCIsIkxJU1RfUVVFUlkiOltbInByb2plY3RzIiwidHByb2plY3QiXSwiIl0sInBhc3Nwb3J0X2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2018-05-29 03:34:15.480878');

-- ----------------------------
-- Table structure for `projects_company`
-- ----------------------------
DROP TABLE IF EXISTS `projects_company`;
CREATE TABLE `projects_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `describe` varchar(300) DEFAULT NULL,
  `mobile` varchar(13) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_company_f4491b3f` (`commodity_id`),
  CONSTRAINT `projects_company_commodity_id_e456d38e_fk_crowfund_project_id` FOREIGN KEY (`commodity_id`) REFERENCES `crowfund_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projects_company
-- ----------------------------

-- ----------------------------
-- Table structure for `reversion_revision`
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_user_userprofile_id` (`user_id`),
  KEY `reversion_revision_c69e55a4` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------

-- ----------------------------
-- Table structure for `reversion_version`
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_ver_content_type_id_7d0ff25c_fk_django_content_type_id` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_ver_content_type_id_7d0ff25c_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_version
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_tag`;
CREATE TABLE `t_project_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) DEFAULT NULL,
  `tagid` int(11),
  PRIMARY KEY (`id`),
  KEY `t_project_tag_projectid_15d57f29_fk_crowfund_project_id` (`projectid`),
  KEY `t_project_tag_4db8e882` (`tagid`),
  CONSTRAINT `t_project_tag_projectid_15d57f29_fk_crowfund_project_id` FOREIGN KEY (`projectid`) REFERENCES `crowfund_project` (`id`),
  CONSTRAINT `t_project_tag_tagid_e2b8183e_fk_t_tag_id` FOREIGN KEY (`tagid`) REFERENCES `t_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `t_project_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_project_type`;
CREATE TABLE `t_project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) DEFAULT NULL,
  `typeid` int(11),
  PRIMARY KEY (`id`),
  KEY `t_project_type_projectid_3909928e_fk_crowfund_project_id` (`projectid`),
  KEY `t_project_type_dd4b6e33` (`typeid`),
  CONSTRAINT `t_project_type_projectid_3909928e_fk_crowfund_project_id` FOREIGN KEY (`projectid`) REFERENCES `crowfund_project` (`id`),
  CONSTRAINT `t_project_type_typeid_cd808c75_fk_t_type_id` FOREIGN KEY (`typeid`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project_type
-- ----------------------------

-- ----------------------------
-- Table structure for `t_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------

-- ----------------------------
-- Table structure for `user_banner`
-- ----------------------------
DROP TABLE IF EXISTS `user_banner`;
CREATE TABLE `user_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_banner
-- ----------------------------

-- ----------------------------
-- Table structure for `user_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `user_emailverifyrecord`;
CREATE TABLE `user_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_emailverifyrecord
-- ----------------------------
INSERT INTO `user_emailverifyrecord` VALUES ('3', 'IGa5cXxa0kNN2sym', '18732429547@163.com', 'register', '2018-05-15 03:08:26.365230');

-- ----------------------------
-- Table structure for `user_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile`;
CREATE TABLE `user_userprofile` (
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
  `authstatus` smallint(6) NOT NULL,
  `usertype` tinyint(1) NOT NULL,
  `realname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_userprofile
-- ----------------------------
INSERT INTO `user_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$C3U3ONXLnWh0$i9B/W7f47MCpMvvILXfpn4BJ1RzzjWZ6nO5Z0KF48j0=', '2018-05-15 03:11:46.057175', '1', 'ltx', '', '', '', '1', '1', '2018-05-14 13:00:31.427703', '0', '0', '');
INSERT INTO `user_userprofile` VALUES ('2', 'pbkdf2_sha256$24000$dC052AjnrDuo$zBbW9xk82O6Tfry7uneLCRFLBhhlsttbf3/eIL/KSwE=', null, '0', 'zhangsan', '', '', '', '0', '1', '2018-05-14 13:28:06.266956', '0', '0', '');
INSERT INTO `user_userprofile` VALUES ('6', 'pbkdf2_sha256$24000$T1BtcsACMhgZ$EuQJ3jg1tckjpalnKNqRK1kKyv8QbQVO5o4JwqTbeCo=', '2018-05-15 03:33:47.267327', '0', '吴梦宇', '', '', '18732429547@163.com', '0', '1', '2018-05-15 03:08:26.243821', '0', '1', '');

-- ----------------------------
-- Table structure for `user_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_groups`;
CREATE TABLE `user_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userprofile_groups_userprofile_id_52847a61_uniq` (`userprofile_id`,`group_id`),
  KEY `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_userprofile__userprofile_id_49724c40_fk_user_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `user_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_user_permissions`;
CREATE TABLE `user_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userprofile_user_permissions_userprofile_id_2e86ceca_uniq` (`userprofile_id`,`permission_id`),
  KEY `user_userprofile_us_permission_id_7f559b23_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `user_userprofile__userprofile_id_68dc814c_fk_user_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`),
  CONSTRAINT `user_userprofile_us_permission_id_7f559b23_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_userprofile_user_permissions
-- ----------------------------

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
  KEY `xadmin_bookmark_user_id_42d307fc_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
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
  KEY `xadmin_log_user_id_bb16a176_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-05-14 13:28:06.446070', '127.0.0.1', '2', 'zhangsan', 'create', '已添加', '6', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-05-14 13:28:10.131073', '127.0.0.1', '1', 'TProject object', 'create', '已添加', '14', '1');

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
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

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
  KEY `xadmin_userwidget_user_id_c159233a_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
