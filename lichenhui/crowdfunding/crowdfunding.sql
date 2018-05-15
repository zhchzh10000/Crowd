/*
Navicat MySQL Data Transfer

Source Server         : ubuntu
Source Server Version : 50722
Source Host           : 192.168.20.27:3306
Source Database       : crowdfunding

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-15 13:50:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_type`
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`),
  CONSTRAINT `account_type_member_id_0fdd965a_fk_members_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_type
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 项目信息', '7', 'add_project');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 项目信息', '7', 'change_project');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 项目信息', '7', 'delete_project');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 一级标签', '8', 'add_tag');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 一级标签', '8', 'change_tag');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 一级标签', '8', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 二级标签', '9', 'add_subtag');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 二级标签', '9', 'change_subtag');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 二级标签', '9', 'delete_subtag');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 会员信息', '10', 'add_memberprofile');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 会员信息', '10', 'change_memberprofile');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 会员信息', '10', 'delete_memberprofile');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 实名账户类型', '11', 'add_accounttype');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 实名账户类型', '11', 'change_accounttype');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 实名账户类型', '11', 'delete_accounttype');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 实名身份信息', '12', 'add_realnameinfo');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 实名身份信息', '12', 'change_realnameinfo');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 实名身份信息', '12', 'delete_realnameinfo');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 手持身份证照片', '13', 'add_idpicture');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 手持身份证照片', '13', 'change_idpicture');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 手持身份证照片', '13', 'delete_idpicture');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 邮箱验证码', '14', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 邮箱验证码', '14', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 邮箱验证码', '14', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 会员地址', '15', 'add_memberaddress');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 会员地址', '15', 'change_memberaddress');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 会员地址', '15', 'delete_memberaddress');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 支持者与项目关联信息', '16', 'add_memberfollowproject');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 支持者与项目关联信息', '16', 'change_memberfollowproject');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 支持者与项目关联信息', '16', 'delete_memberfollowproject');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 回报信息', '17', 'add_return');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 回报信息', '17', 'change_return');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 回报信息', '17', 'delete_return');
INSERT INTO `auth_permission` VALUES ('52', 'Can add name certification', '18', 'add_namecertification');
INSERT INTO `auth_permission` VALUES ('53', 'Can change name certification', '18', 'change_namecertification');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete name certification', '18', 'delete_namecertification');

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
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$VgTaSVCztSy0$xXVXPFO5hycT+fuUeCmBaOQqjkjQPzY5doHtpoNR7FM=', '2018-05-14 09:33:02.383791', '1', 'lichenhui', '', '', '', '1', '1', '2018-05-14 09:32:58.822323');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-05-14 09:34:16.916921', '1', 'aaa', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-05-14 09:35:21.299069', '2', 'bbb', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-05-14 09:35:37.004818', '1', 'aaa', '2', 'Changed support_money and deploy_date.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-05-14 09:36:44.466150', '3', 'ccc', '1', 'Added.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-05-15 01:22:00.326856', '1', '手机', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-05-15 01:42:52.406462', '1', '手机', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-05-15 01:55:54.246698', '2', '数码', '1', 'Added.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-05-15 01:56:09.108170', '1', '手机', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-05-15 01:56:19.005481', '2', '相机', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-05-15 01:56:25.737376', '3', '电脑', '1', 'Added.', '9', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'project', 'project');
INSERT INTO `django_content_type` VALUES ('17', 'project', 'return');
INSERT INTO `django_content_type` VALUES ('9', 'project', 'subtag');
INSERT INTO `django_content_type` VALUES ('8', 'project', 'tag');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('11', 'user', 'accounttype');
INSERT INTO `django_content_type` VALUES ('14', 'user', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('13', 'user', 'idpicture');
INSERT INTO `django_content_type` VALUES ('15', 'user', 'memberaddress');
INSERT INTO `django_content_type` VALUES ('16', 'user', 'memberfollowproject');
INSERT INTO `django_content_type` VALUES ('10', 'user', 'memberprofile');
INSERT INTO `django_content_type` VALUES ('18', 'user', 'namecertification');
INSERT INTO `django_content_type` VALUES ('12', 'user', 'realnameinfo');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-14 09:06:23.146677');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-05-14 09:06:24.988608');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-05-14 09:06:25.327470');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-05-14 09:06:25.415707');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-05-14 09:06:25.519995');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-05-14 09:06:25.577134');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-05-14 09:06:25.763630');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-05-14 09:06:25.783718');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-05-14 09:06:25.853869');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-05-14 09:06:25.857880');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-05-14 09:06:25.864935');
INSERT INTO `django_migrations` VALUES ('12', 'project', '0001_initial', '2018-05-14 09:06:26.240898');
INSERT INTO `django_migrations` VALUES ('13', 'user', '0001_initial', '2018-05-14 09:06:27.563414');
INSERT INTO `django_migrations` VALUES ('14', 'project', '0002_project_member', '2018-05-14 09:06:27.715819');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2018-05-14 09:06:27.841153');
INSERT INTO `django_migrations` VALUES ('16', 'project', '0003_auto_20180514_1904', '2018-05-14 11:04:55.590873');
INSERT INTO `django_migrations` VALUES ('17', 'project', '0004_auto_20180514_1940', '2018-05-14 11:41:00.415476');
INSERT INTO `django_migrations` VALUES ('18', 'project', '0005_auto_20180514_1942', '2018-05-14 11:42:27.481161');
INSERT INTO `django_migrations` VALUES ('19', 'project', '0006_auto_20180514_1943', '2018-05-14 11:43:40.142367');
INSERT INTO `django_migrations` VALUES ('20', 'project', '0007_return', '2018-05-14 13:47:21.120661');
INSERT INTO `django_migrations` VALUES ('21', 'project', '0008_auto_20180515_0950', '2018-05-15 01:52:18.636592');
INSERT INTO `django_migrations` VALUES ('22', 'user', '0002_namecertification', '2018-05-15 01:52:18.773923');
INSERT INTO `django_migrations` VALUES ('23', 'project', '0009_auto_20180515_1100', '2018-05-15 03:00:49.100728');

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
INSERT INTO `django_session` VALUES ('mnh6kxxl7q6qyizty91yfzxzg0z19diy', 'YmU5MGRhMWFjODk0NTQyOGRhNDg0ZTk3YzI2MGQ3NmNmYzljYTNhODp7ImlzbG9naW4iOnRydWUsInVzZXJfaWQiOjEsInVzZXJuYW1lIjoibGljaGVuaHVpIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImI4YWRkMzE4MzBlMWYwYTY3Mzg1YWVjMTc2ZmM5MGY5ZTIxOTE0MTYiLCJwcm9qZWN0X2lkIjo3fQ==', '2018-05-29 03:35:39.314087');

-- ----------------------------
-- Table structure for `email_vc`
-- ----------------------------
DROP TABLE IF EXISTS `email_vc`;
CREATE TABLE `email_vc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `verify_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_vc
-- ----------------------------

-- ----------------------------
-- Table structure for `id_picture`
-- ----------------------------
DROP TABLE IF EXISTS `id_picture`;
CREATE TABLE `id_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(100) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`),
  CONSTRAINT `id_picture_member_id_9a4abfd9_fk_members_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of id_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `member_address`
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_address_b5c3e75b` (`member_id`),
  CONSTRAINT `member_address_member_id_2a722a46_fk_members_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_address
-- ----------------------------

-- ----------------------------
-- Table structure for `member_follow_project`
-- ----------------------------
DROP TABLE IF EXISTS `member_follow_project`;
CREATE TABLE `member_follow_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_follow_project_b5c3e75b` (`member_id`),
  KEY `member_follow_project_b098ad43` (`project_id`),
  CONSTRAINT `member_follow_project_member_id_7e0978b7_fk_members_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  CONSTRAINT `member_follow_project_project_id_cbf637fd_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_follow_project
-- ----------------------------

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_type` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('1', 'lichenhui', 'f1645dc6fab2d49df0be4e7b417bc9df779a2459', '294276229@qq.com', '1', '2018-05-14 09:31:44.778524');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `target_money` int(11) NOT NULL,
  `support_money` int(11) NOT NULL,
  `project_cover` varchar(100) NOT NULL,
  `project_info` varchar(100) NOT NULL,
  `completion` int(11) NOT NULL,
  `supporters` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `deploy_date` datetime(6) NOT NULL,
  `type` int(11) NOT NULL,
  `a_word_intro` varchar(40) NOT NULL,
  `self_intro` longtext NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `service_number` varchar(13) NOT NULL,
  `member_id` int(11) NOT NULL,
  `tag` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_b5c3e75b` (`member_id`),
  CONSTRAINT `project_member_id_12cb974b_fk_members_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'aaa', 'aaa', '1000', '0', 'project/cover/carousel-2.jpg', 'project/info/product_detail_body_CSMKPfV.jpg', '0', '0', '0', '30', '2018-05-14 09:34:16.889849', '2018-04-20 09:33:09.000000', '0', '一句话介绍', '详细介绍', '1234567', '1234567', '1', 'tag');
INSERT INTO `project` VALUES ('2', 'bbb', 'bbb', '2000', '1500', 'project/cover/carousel-1.jpg', 'project/info/carousel-1.jpg', '0', '0', '1', '40', '2018-05-14 09:35:21.297061', '2018-05-16 09:34:19.000000', '1', '一句话介绍', '详细介绍', '1234567', '1234567', '1', 'tag');
INSERT INTO `project` VALUES ('3', 'ccc', 'ccc', '3000', '2000', 'project/cover/product-8_AUFHyV3.jpg', 'project/info/product-8_70xnoc8.jpg', '0', '0', '1', '50', '2018-05-14 09:36:44.465147', '2018-04-27 09:35:40.000000', '3', '一句话介绍', '详细介绍', '1234567', '1234567', '1', 'tag');
INSERT INTO `project` VALUES ('4', '哈哈哈哈啊哈', '哈哈哈哈哈哈哈哈哈啊哈哈', '12', '0', 'project/cover/product-6.jpg', 'project/info/product-6.jpg', '0', '0', '0', '50', '2018-05-14 11:34:39.764531', '2018-05-14 11:34:39.759551', '2', '合肥丰富黄沙河设法丰富', '不好玩', '13655510234', '0551-68954675', '1', 'tag');
INSERT INTO `project` VALUES ('6', 'Javascript高级程序设计', 'Javascript高级程序设计', '1000', '0', 'project/cover/product-1_5y5l2Sv.jpg', 'project/info/product-1_7ZDp2p3.jpg', '0', '0', '0', '30', '2018-05-15 03:25:08.144564', '2018-05-15 03:25:08.139551', '0', '合肥丰富黄沙河设法丰富', 'Javascript高级程序设计', '13655510234', '0551-68954675', '1', '手机,相机');
INSERT INTO `project` VALUES ('7', 'Javascript高级程序设计', 'Javascript高级程序设计', '1000', '0', 'project/cover/product-1_tVhGQYK.jpg', 'project/info/product-1_H7SmFRV.jpg', '0', '0', '0', '30', '2018-05-15 03:35:39.298042', '2018-05-15 03:35:39.271976', '0', '合肥丰富黄沙河设法丰富', 'Javascript高级程序设计', '13655510234', '0551-68954675', '1', '手机,相机');

-- ----------------------------
-- Table structure for `real_name_info`
-- ----------------------------
DROP TABLE IF EXISTS `real_name_info`;
CREATE TABLE `real_name_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(20) NOT NULL,
  `id_card` varchar(18) NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`),
  CONSTRAINT `real_name_info_member_id_5696c25f_fk_members_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of real_name_info
-- ----------------------------

-- ----------------------------
-- Table structure for `return`
-- ----------------------------
DROP TABLE IF EXISTS `return`;
CREATE TABLE `return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `support_money` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL,
  `return_num` int(11) NOT NULL,
  `limit_or_not` int(11) NOT NULL,
  `one_order_limit` int(11) NOT NULL,
  `trans_expenses` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `return_days` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `return_project_id_e982cac4_fk_project_id` (`project_id`),
  CONSTRAINT `return_project_id_e982cac4_fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return
-- ----------------------------
INSERT INTO `return` VALUES ('4', '1', '45', '啊啊啊啊啊啊啊啊', 'project/return/product-2.gif', '0', '1', '0', '0', '0', '40', '7');
INSERT INTO `return` VALUES ('5', '0', '50', '哦哦哦哦哦哦哦哦哦', 'project/return/product-8.jpg', '0', '1', '15', '0', '0', '30', '7');
INSERT INTO `return` VALUES ('6', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_9qOrou2.jpg', '0', '0', '1', '0', '1', '20', '7');
INSERT INTO `return` VALUES ('7', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_XZfNTel.jpg', '0', '0', '1', '0', '1', '20', '7');
INSERT INTO `return` VALUES ('8', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_1vKRpTg.jpg', '0', '0', '1', '0', '1', '20', '7');
INSERT INTO `return` VALUES ('9', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_UjHHxhQ.jpg', '0', '0', '1', '0', '1', '20', '7');
INSERT INTO `return` VALUES ('10', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_6wXZzwU.jpg', '0', '1', '10', '0', '1', '20', '7');
INSERT INTO `return` VALUES ('11', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_CfKUona.jpg', '0', '0', '10', '0', '1', '20', '7');
INSERT INTO `return` VALUES ('12', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_dZ7zuat.jpg', '0', '0', '10', '0', '1', '20', '7');
INSERT INTO `return` VALUES ('13', '0', '100', '呃呃呃呃呃呃呃呃呃', 'project/return/services-box1_1CVDKmo.jpg', '0', '0', '0', '0', '1', '20', '7');

-- ----------------------------
-- Table structure for `sub_tag`
-- ----------------------------
DROP TABLE IF EXISTS `sub_tag`;
CREATE TABLE `sub_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_tag_name` varchar(10) NOT NULL,
  `parent_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_tag_b54d2f94` (`parent_tag_id`),
  CONSTRAINT `sub_tag_parent_tag_id_ce2bc223_fk_tag_id` FOREIGN KEY (`parent_tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_tag
-- ----------------------------
INSERT INTO `sub_tag` VALUES ('1', '手机', '2');
INSERT INTO `sub_tag` VALUES ('2', '相机', '2');
INSERT INTO `sub_tag` VALUES ('3', '电脑', '2');

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('2', '数码');

-- ----------------------------
-- Table structure for `user_namecertification`
-- ----------------------------
DROP TABLE IF EXISTS `user_namecertification`;
CREATE TABLE `user_namecertification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`),
  CONSTRAINT `user_namecertification_member_id_8f4a91df_fk_members_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_namecertification
-- ----------------------------
