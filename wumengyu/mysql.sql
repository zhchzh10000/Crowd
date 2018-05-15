/*
Navicat MySQL Data Transfer

Source Server         : 192.168.20.48_3306
Source Server Version : 50722
Source Host           : 192.168.20.48:3306
Source Database       : devious

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-15 13:06:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`group_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `group_id` (`group_id`, `permission_id`) USING BTREE ,
INDEX `auth_group_p_permission_id_f77d5c31f54d2ec_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NOT NULL ,
`codename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `content_type_id` (`content_type_id`, `codename`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=55

;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add permission', '2', 'add_permission'), ('5', 'Can change permission', '2', 'change_permission'), ('6', 'Can delete permission', '2', 'delete_permission'), ('7', 'Can add group', '3', 'add_group'), ('8', 'Can change group', '3', 'change_group'), ('9', 'Can delete group', '3', 'delete_group'), ('10', 'Can add content type', '4', 'add_contenttype'), ('11', 'Can change content type', '4', 'change_contenttype'), ('12', 'Can delete content type', '4', 'delete_contenttype'), ('13', 'Can add session', '5', 'add_session'), ('14', 'Can change session', '5', 'change_session'), ('15', 'Can delete session', '5', 'delete_session'), ('16', 'Can add 用户信息表', '6', 'add_userprofile'), ('17', 'Can change 用户信息表', '6', 'change_userprofile'), ('18', 'Can delete 用户信息表', '6', 'delete_userprofile'), ('19', 'Can add 邮箱验证码', '7', 'add_emailcode'), ('20', 'Can change 邮箱验证码', '7', 'change_emailcode'), ('21', 'Can delete 邮箱验证码', '7', 'delete_emailcode'), ('22', 'Can add 项目类别', '8', 'add_tag'), ('23', 'Can change 项目类别', '8', 'change_tag'), ('24', 'Can delete 项目类别', '8', 'delete_tag'), ('25', 'Can add 众筹项目', '9', 'add_project'), ('26', 'Can change 众筹项目', '9', 'change_project'), ('27', 'Can delete 众筹项目', '9', 'delete_project'), ('28', 'Can add 公司名称', '10', 'add_company'), ('29', 'Can change 公司名称', '10', 'change_company'), ('30', 'Can delete 公司名称', '10', 'delete_company'), ('31', 'Can add 轮播图', '11', 'add_banner'), ('32', 'Can change 轮播图', '11', 'change_banner'), ('33', 'Can delete 轮播图', '11', 'delete_banner'), ('34', 'Can add 用户支持', '12', 'add_usersupprot'), ('35', 'Can change 用户支持', '12', 'change_usersupprot'), ('36', 'Can delete 用户支持', '12', 'delete_usersupprot'), ('37', 'Can add 用户关注', '13', 'add_userflower'), ('38', 'Can change 用户关注', '13', 'change_userflower'), ('39', 'Can delete 用户关注', '13', 'delete_userflower'), ('40', 'Can add 收货地址', '14', 'add_address'), ('41', 'Can change 收货地址', '14', 'change_address'), ('42', 'Can delete 收货地址', '14', 'delete_address'), ('43', 'Can add invoice', '15', 'add_invoice'), ('44', 'Can change invoice', '15', 'change_invoice'), ('45', 'Can delete invoice', '15', 'delete_invoice'), ('46', 'Can add return goods', '16', 'add_returngoods'), ('47', 'Can change return goods', '16', 'change_returngoods'), ('48', 'Can delete return goods', '16', 'delete_returngoods'), ('49', 'Can add label', '17', 'add_label'), ('50', 'Can change label', '17', 'change_label'), ('51', 'Can delete label', '17', 'delete_label'), ('52', 'Can add 创建项目表', '18', 'add_usercreate'), ('53', 'Can change 创建项目表', '18', 'change_usercreate'), ('54', 'Can delete 创建项目表', '18', 'delete_usercreate');
COMMIT;

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`action_time`  datetime(6) NOT NULL ,
`object_id`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`object_repr`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`action_flag`  smallint(5) UNSIGNED NOT NULL ,
`change_message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NULL DEFAULT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `djang_content_type_id_33f3a6a2734e47b7_fk_django_content_type_id` (`content_type_id`) USING BTREE ,
INDEX `django_admin_lo_user_id_3df5a66d8b1bf620_fk_users_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=35

;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES ('1', '2018-05-10 07:37:08.703555', '1', '科技', '1', '', '8', '1'), ('2', '2018-05-10 07:37:10.757625', '1', 'Project object', '1', '', '9', '1'), ('3', '2018-05-10 08:15:52.306569', '2', '设计', '1', '', '8', '1'), ('4', '2018-05-10 08:15:57.046845', '3', '公益', '1', '', '8', '1'), ('5', '2018-05-10 08:16:07.240146', '4', '农业', '1', '', '8', '1'), ('6', '2018-05-10 08:16:10.740829', '5', '文化', '1', '', '8', '1'), ('7', '2018-05-10 08:27:49.310021', '2', 'Project object', '1', '', '9', '1'), ('8', '2018-05-11 02:20:39.980514', '1', '福建省南安厨卫', '1', '', '10', '1'), ('9', '2018-05-11 02:20:43.415278', '1', '插座', '2', '已修改 company 。', '9', '1'), ('10', '2018-05-11 02:20:52.930359', '2', 'bb', '2', '已修改 company 。', '9', '1'), ('11', '2018-05-11 02:23:44.051211', '1', '福建省南安厨卫', '2', '已修改 image 。', '10', '1'), ('12', '2018-05-11 02:26:57.580632', '1', '插座', '2', '已修改 desc 和 image 。', '9', '1'), ('13', '2018-05-11 02:30:37.034340', '1', '插座', '2', '已修改 image1 和 image2 。', '9', '1'), ('14', '2018-05-11 03:18:59.542926', '1', 'aa', '1', '', '11', '1'), ('15', '2018-05-11 03:19:08.296893', '2', 'bb', '1', '', '11', '1'), ('16', '2018-05-11 03:19:15.693131', '3', 'cc', '1', '', '11', '1'), ('17', '2018-05-11 05:50:37.260876', '2', 'bb', '2', '已修改 image1 和 image2 。', '9', '1'), ('18', '2018-05-11 06:10:07.736569', '1', 'UserSupprot object', '1', '', '12', '1'), ('19', '2018-05-11 06:57:48.727874', '1', '插座', '2', '已修改 status 。', '9', '1'), ('20', '2018-05-11 08:54:16.590308', '1', '插座', '2', '已修改 returns 。', '9', '1'), ('21', '2018-05-11 12:33:50.703021', '1', '河北省定州市杨家庄乡东马家寨村', '1', '', '14', '1'), ('22', '2018-05-12 07:55:38.171519', '1', '手机', '1', '', '17', '1'), ('23', '2018-05-12 08:19:48.723310', '1', 'Invoice object', '1', '', '15', '1'), ('24', '2018-05-12 08:22:07.090926', '3', 'Invoice', '1', '', '15', '1'), ('25', '2018-05-12 08:22:49.722395', '4', 'Invoice', '1', '', '15', '1'), ('26', '2018-05-12 08:22:51.910387', '3', 'aaa', '1', '', '16', '1'), ('27', '2018-05-12 10:30:09.993423', '1', 'aa', '2', '已修改 project 。', '11', '1'), ('28', '2018-05-12 10:30:15.733497', '2', 'bb', '2', '已修改 project 。', '11', '1'), ('29', '2018-05-12 10:39:26.763533', '3', 'aaa', '2', '没有字段被修改。', '16', '1'), ('30', '2018-05-12 10:39:48.000877', '4', 'aaa', '1', '', '16', '1'), ('31', '2018-05-12 10:46:47.649191', '4', 'aaa', '2', '已修改 desc 。', '16', '1'), ('32', '2018-05-12 10:46:54.888649', '3', 'aaa', '2', '已修改 desc 。', '16', '1'), ('33', '2018-05-15 01:36:18.890295', '2', '数码', '1', '', '17', '1'), ('34', '2018-05-15 01:36:35.991191', '3', '电脑', '1', '', '17', '1');
COMMIT;

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app_label`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`model`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `django_content_type_app_label_26b1c265137a9393_uniq` (`app_label`, `model`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=19

;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('3', 'auth', 'group'), ('2', 'auth', 'permission'), ('4', 'contenttypes', 'contenttype'), ('10', 'project', 'company'), ('15', 'project', 'invoice'), ('17', 'project', 'label'), ('9', 'project', 'project'), ('16', 'project', 'returngoods'), ('8', 'project', 'tag'), ('5', 'sessions', 'session'), ('14', 'users', 'address'), ('11', 'users', 'banner'), ('7', 'users', 'emailcode'), ('18', 'users', 'usercreate'), ('13', 'users', 'userflower'), ('6', 'users', 'userprofile'), ('12', 'users', 'usersupprot');
COMMIT;

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`applied`  datetime(6) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=47

;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-10 07:34:29.370188'), ('2', 'contenttypes', '0002_remove_content_type_name', '2018-05-10 07:34:29.433842'), ('3', 'auth', '0001_initial', '2018-05-10 07:34:29.565036'), ('4', 'auth', '0002_alter_permission_name_max_length', '2018-05-10 07:34:29.591400'), ('5', 'auth', '0003_alter_user_email_max_length', '2018-05-10 07:34:29.603309'), ('6', 'auth', '0004_alter_user_username_opts', '2018-05-10 07:34:29.640832'), ('7', 'auth', '0005_alter_user_last_login_null', '2018-05-10 07:34:29.651962'), ('8', 'auth', '0006_require_contenttypes_0002', '2018-05-10 07:34:29.656341'), ('9', 'users', '0001_initial', '2018-05-10 07:34:29.821775'), ('10', 'project', '0001_initial', '2018-05-10 07:34:50.621645'), ('11', 'admin', '0001_initial', '2018-05-10 07:35:03.256764'), ('12', 'sessions', '0001_initial', '2018-05-10 07:35:03.283084'), ('13', 'project', '0002_auto_20180511_0218', '2018-05-11 02:18:30.401628'), ('14', 'project', '0003_company_image', '2018-05-11 02:23:09.001659'), ('15', 'project', '0004_auto_20180511_0229', '2018-05-11 02:29:44.197132'), ('16', 'users', '0002_banner', '2018-05-11 03:17:14.548022'), ('17', 'project', '0005_remove_project_members', '2018-05-11 06:06:31.302715'), ('18', 'users', '0003_usersupprot', '2018-05-11 06:06:31.505698'), ('19', 'project', '0006_project_createdate', '2018-05-11 06:08:42.721661'), ('20', 'users', '0004_userflower', '2018-05-11 06:13:19.872603'), ('21', 'project', '0007_project_returns', '2018-05-11 08:53:08.495647'), ('22', 'users', '0005_address', '2018-05-11 12:28:57.140602'), ('23', 'users', '0006_auto_20180511_1233', '2018-05-11 12:33:40.026323'), ('24', 'project', '0008_auto_20180512_0313', '2018-05-12 03:13:48.175593'), ('25', 'project', '0009_auto_20180512_0534', '2018-05-12 05:34:57.307943'), ('26', 'project', '0010_auto_20180512_0755', '2018-05-12 07:55:17.860743'), ('27', 'project', '0011_auto_20180512_0758', '2018-05-12 07:58:32.492816'), ('28', 'project', '0012_auto_20180512_1025', '2018-05-12 10:25:58.279127'), ('29', 'users', '0007_banner_project', '2018-05-12 10:29:54.350376'), ('30', 'project', '0013_returngoods_desc', '2018-05-12 10:45:42.133085'), ('31', 'users', '0008_auto_20180512_1302', '2018-05-12 13:02:27.627049'), ('32', 'project', '0014_company_aut', '2018-05-13 07:48:11.441079'), ('33', 'project', '0015_company_c_phone', '2018-05-13 12:23:20.960824'), ('34', 'project', '0016_auto_20180513_1342', '2018-05-13 13:42:15.644196'), ('35', 'project', '0017_auto_20180514_0110', '2018-05-14 01:10:49.880234'), ('36', 'project', '0018_auto_20180514_0112', '2018-05-14 01:12:56.050901'), ('37', 'project', '0019_auto_20180514_0113', '2018-05-14 01:13:59.977685'), ('38', 'project', '0020_returngoods_number', '2018-05-14 07:20:41.380126'), ('39', 'project', '0021_returngoods_type', '2018-05-14 07:25:47.942083'), ('40', 'project', '0022_returngoods_image', '2018-05-14 07:27:29.019986'), ('41', 'project', '0023_auto_20180514_0909', '2018-05-14 09:10:00.136935'), ('42', 'project', '0024_auto_20180514_1101', '2018-05-14 11:01:38.016081'), ('43', 'users', '0009_usercreate', '2018-05-14 11:51:26.133697'), ('44', 'users', '0010_auto_20180514_1244', '2018-05-14 12:44:37.769511'), ('45', 'project', '0025_auto_20180514_1246', '2018-05-14 12:46:45.402051'), ('46', 'project', '0026_auto_20180515_0124', '2018-05-15 01:25:01.957125');
COMMIT;

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
`session_key`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`session_data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`expire_date`  datetime(6) NOT NULL ,
PRIMARY KEY (`session_key`),
INDEX `django_session_de54fa62` (`expire_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('0vpbjehpncy821h157ncydm3okfsvobk', 'OGNkMWMxZDQ5Y2JhYmIzNzQ1YTA2MDI4YTA3ZDhjOTNlZDkwYjdlNjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y5ZDRlYTUyOTFlOWY0Y2NjZDU3NWE4YzBiMjA5ZDkwMDhiYjQ1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-05-28 02:54:03.211345'), ('8tbga7ukp4aexusd9n9oqtkk29ldvsvt', 'NmQ1MzUzZWNjN2Q0NDViZGZjZjVhNmIxMmNiYmM3NDk4ZTQ2ZjFmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNWZkNzZiNzljN2NjOWY5ZjBhMzdjNDZjMDdlOGI0NDQ3MWQ3YTY1In0=', '2018-05-27 08:03:47.280652'), ('cnnvyhncp7bg26px5gtx9ede40v009kd', 'NzM2ZWYyOTE4NmY1NGY4YTg1ZmQxMWJiMGFhMDY3MWIxZGJkOTQyNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjVmZDc2Yjc5YzdjYzlmOWYwYTM3YzQ2YzA3ZThiNDQ0NzFkN2E2NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-29 01:35:42.120431'), ('l9iesh51ftw0trgvmaxtn3yt4royb4ls', 'NDE2YmY0OTNjMjgyYjg5ODY3YjI5ZWM0Nzk5YjFmNjUwYjQ1Y2MwOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI1ZmQ3NmI3OWM3Y2M5ZjlmMGEzN2M0NmMwN2U4YjQ0NDcxZDdhNjUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-05-27 13:17:45.117688'), ('n3iney14eubeopmrxyr9moj87nsk4clt', 'NzM3NTI0YzVkZmIwMGVmZjlhZTI1NzVhYWMyZThlZmMxN2MxM2JiYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI1Yzk3ZWRlNGYzOWRkOTNiZWU0NWU5M2M0MmY4ZjBjYmI5NWEyY2UxIn0=', '2018-05-28 07:01:37.587423'), ('qc0684etseazr0xlrtpa7evm4mpwly4z', 'NzM2ZWYyOTE4NmY1NGY4YTg1ZmQxMWJiMGFhMDY3MWIxZGJkOTQyNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjVmZDc2Yjc5YzdjYzlmOWYwYTM3YzQ2YzA3ZThiNDQ0NzFkN2E2NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-28 03:29:46.454134'), ('uf7g7t0dqm102ob9x7v0imn8tiw1zqss', 'NzM2ZWYyOTE4NmY1NGY4YTg1ZmQxMWJiMGFhMDY3MWIxZGJkOTQyNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjVmZDc2Yjc5YzdjYzlmOWYwYTM3YzQ2YzA3ZThiNDQ0NzFkN2E2NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-28 07:17:21.855147'), ('urtz8u34bxu2qq27exubudetubta1mcs', 'M2FjZDczMWI4ZjNiOTViNzUzNWI0ZTRkNzU1MzFiZDA5ZDBmYzkzNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1Yzk3ZWRlNGYzOWRkOTNiZWU0NWU5M2M0MmY4ZjBjYmI5NWEyY2UxIn0=', '2018-05-26 10:52:54.951949');
COMMIT;

-- ----------------------------
-- Table structure for `project_company`
-- ----------------------------
DROP TABLE IF EXISTS `project_company`;
CREATE TABLE `project_company` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  int(11) NOT NULL ,
`image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`aut`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`c_phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of project_company
-- ----------------------------
BEGIN;
INSERT INTO `project_company` VALUES ('1', '福建省南安厨卫', '酷驰是一家年轻的厨卫科技公司，我们有一支朝气蓬勃，有激情、有想法、敢实践的团队。', '86218855', 'company/2018/05/services-box2.jpg', '0', null), ('2', 'cdsf', 'sdf', '1212121', '', '未认证', '1212'), ('3', '福州', '福州', '9837636', '', '未认证', '188727264567'), ('4', '张三', '张三', '1937293', '', '未认证', '18372934729'), ('5', '北京尚硅谷', '一家专门做众筹的网站', '896373', '', '未认证', '19827276547'), ('6', '尚硅谷', '尚硅谷', '2323232', '', '未认证', '129237373'), ('7', 'sdfs ', 'sdfs', '8644898', '', '未认证', '23423423'), ('8', 'sdfs ', 'sdfs', '8644898', '', '未认证', '23423423'), ('9', 'sdfs ', 'sdfs', '8644898', '', '未认证', '23423423'), ('10', 'sdfs ', 'sdfs', '8644898', '', '未认证', '23423423'), ('11', 'sdfs ', 'sdfs', '8644898', '', '未认证', '23423423'), ('12', '北京尚硅谷', '尚硅谷', '2323232', '', '未认证', '2222222'), ('13', '32ewr', 'rew', '8644898', '', '未认证', '234234'), ('14', '湖南方正科技有限公司', '我是方正公司的总众筹总监，策划众筹项目\r\n', '43323234', '', '未认证', '12222112'), ('15', '得分', '得分', '23432423', '', '未认证', '23233242'), ('16', 'dsfs', 'dsf', '43323234', '', '未认证', '23423423'), ('17', '张三', 'dfs', '896373', '', '未认证', '234234'), ('18', '张三', 'dsfsdf', '8644898', '', '未认证', '23423423'), ('19', '张三', 'dsfsdf', '8644898', '', '未认证', '23423423'), ('20', '张三', 'dsfsdf', '8644898', '', '未认证', '23423423');
COMMIT;

-- ----------------------------
-- Table structure for `project_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `project_invoice`;
CREATE TABLE `project_invoice` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`types`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of project_invoice
-- ----------------------------
BEGIN;
INSERT INTO `project_invoice` VALUES ('1', '1'), ('3', '1'), ('4', '1');
COMMIT;

-- ----------------------------
-- Table structure for `project_label`
-- ----------------------------
DROP TABLE IF EXISTS `project_label`;
CREATE TABLE `project_label` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`project_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `project_label_b098ad43` (`project_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of project_label
-- ----------------------------
BEGIN;
INSERT INTO `project_label` VALUES ('1', '手机', '1'), ('2', '数码', '1'), ('3', '电脑', '1');
COMMIT;

-- ----------------------------
-- Table structure for `project_project`
-- ----------------------------
DROP TABLE IF EXISTS `project_project`;
CREATE TABLE `project_project` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`follower`  int(11) NOT NULL ,
`money`  bigint(20) NOT NULL ,
`supportmoney`  bigint(20) NULL DEFAULT NULL ,
`date`  date NOT NULL ,
`status`  smallint(6) NOT NULL ,
`supporter`  int(11) NULL DEFAULT NULL ,
`tag_id`  int(11) NOT NULL ,
`company_id`  int(11) NULL DEFAULT NULL ,
`image1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`image2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createdate`  date NOT NULL ,
`returns`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`time`  int(11) NULL DEFAULT NULL ,
`tags`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`company_id`) REFERENCES `project_company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`tag_id`) REFERENCES `project_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `project_project_76f094bc` (`tag_id`) USING BTREE ,
INDEX `project_project_447d3092` (`company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=26

;

-- ----------------------------
-- Records of project_project
-- ----------------------------
BEGIN;
INSERT INTO `project_project` VALUES ('1', '插座', '安全绝缘', '200', '1000', '200', '2018-05-24', '1', '12', '1', '1', 'image/2018/05/product_detail_head.jpg', 'image/2018/05/product_detail_body.jpg', '2018-05-11', '每满1750人抽取一个插座，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取', null, null), ('2', 'bb', 'Python', '1111', '1200', '300', '2018-05-10', '1', '12', '2', '1', 'image/2018/05/product_detail_head_OEMShFf.jpg', 'image/2018/05/product_detail_body_mahJYlL.jpg', '2018-05-11', null, null, null), ('8', '插座2', 'dsf', '0', '2000', null, '2018-06-13', '0', null, '1', null, '', '', '2018-05-14', null, '20', null), ('9', '插座3', '插座3', '0', '2000', null, '2018-06-13', '0', null, '1', null, 'image/2018/05/p2.jpg', 'image/2018/05/product-3.png', '2018-05-14', null, '33', null), ('10', '水龙头', '让你弑神', '0', '2000', null, '2018-06-13', '0', null, '2', null, 'image/2018/05/product-2.gif', 'image/2018/05/product-3_W38xYZo.png', '2018-05-14', null, '30', null), ('16', '水龙头13333', 'sdf', '0', '1100', null, '2018-06-13', '0', null, '1', null, 'image/2018/05/product-3_T1v6ug1.png', 'image/2018/05/product-7_zozimwz.jpg', '2018-05-14', null, '30', null), ('17', '方便吗', '方便面', '0', '2000', null, '2018-06-13', '0', null, '1', null, 'image/2018/05/product-1.jpg', 'image/2018/05/product-9.jpg', '2018-05-14', null, '20', null), ('18', 'df', 'fd', '0', '2332', null, '2018-06-13', '0', null, '1', null, 'image/2018/05/product-3_656QdeL.png', 'image/2018/05/product-5.jpg', '2018-05-14', null, '23', null), ('19', '方正科技', '方正科技让人无话可讲', '0', '10000', '0', '2018-06-13', '0', '1', '1', null, 'image/2018/05/p1.jpg', 'image/2018/05/p2_I7fwa4Y.jpg', '2018-05-14', null, '30', null), ('20', '111', '1111', '0', '1111', '0', '2018-06-14', '0', '0', '1', null, 'image/2018/05/product-1_eCdaoRj.jpg', 'image/2018/05/product-6.jpg', '2018-05-15', null, '12', null), ('21', 'dsddsf ', 'dsfsdf', '0', '342', '0', '2018-06-14', '0', '0', '1', null, 'image/2018/05/product-3_HW8cwKj.png', 'image/2018/05/product-7_8RATIOs.jpg', '2018-05-15', null, '32', null), ('22', 'dsf', 'sdf', '0', '1111', '0', '2018-06-14', '0', '0', '1', null, 'image/2018/05/product-2_za35q4Q.gif', 'image/2018/05/product-1_Wt4bIuN.jpg', '2018-05-15', null, '20', null), ('23', '插座dss', 'dsf', '0', '234', '0', '2018-06-14', '0', '0', '1', null, 'image/2018/05/product-1_HVGTWCI.jpg', 'image/2018/05/product-3_SC6gBXn.png', '2018-05-15', null, '23', null), ('24', '插座dss', 'dsf', '0', '234', '0', '2018-06-14', '0', '0', '1', null, 'image/2018/05/product-1_5EQePVs.jpg', 'image/2018/05/product-3_Xm5Uz73.png', '2018-05-15', null, '23', '手机,数码'), ('25', '插座dsswwww', 'dsf', '0', '234', '0', '2018-06-14', '0', '0', '1', null, 'image/2018/05/product-1_weePGq5.jpg', 'image/2018/05/product-3_Mf8g5ah.png', '2018-05-15', null, '23', '手机,数码');
COMMIT;

-- ----------------------------
-- Table structure for `project_returngoods`
-- ----------------------------
DROP TABLE IF EXISTS `project_returngoods`;
CREATE TABLE `project_returngoods` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`pay_money`  bigint(20) NOT NULL ,
`palces`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`limit_purch`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`return_goods_time`  int(11) NOT NULL ,
`freight`  int(11) NOT NULL ,
`invoice`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`project_id`  int(11) NOT NULL ,
`desc`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`number`  int(11) NULL DEFAULT NULL ,
`type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `project_returngoods_b098ad43` (`project_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of project_returngoods
-- ----------------------------
BEGIN;
INSERT INTO `project_returngoods` VALUES ('3', '122', '无限制', '1', '12', '0', '4', '1', '每满1750人抽取一台活性富氢净水直饮机，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取。', null, '0', null), ('4', '1', '无限制', '1', '10', '0', '1', '1', '每满1750人抽取一台活性富氢净水直饮机，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取。', null, '0', null), ('5', '43', '无限制', '', '67', '0', '自定义发票', '18', 'fdgd', '0', '实物回报', 'return/2018/05/product-5.jpg'), ('6', '12', '无限制', '', '12', '0', '自定义发票', '19', '方正电脑一台', '0', '实物回报', 'return/2018/05/p3.png'), ('7', '1000', '无限制', '', '66', '0', '自定义发票', '25', 'qqq', '0', '实物回报', 'return/2018/05/pic.jpg'), ('8', '12', '无限制', '2', '7', '0', '自定义发票', '25', '21212', '0', '实物回报', 'return/2018/05/product-3.png');
COMMIT;

-- ----------------------------
-- Table structure for `project_tag`
-- ----------------------------
DROP TABLE IF EXISTS `project_tag`;
CREATE TABLE `project_tag` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of project_tag
-- ----------------------------
BEGIN;
INSERT INTO `project_tag` VALUES ('1', '科技'), ('2', '设计'), ('3', '公益'), ('4', '农业'), ('5', '文化');
COMMIT;

-- ----------------------------
-- Table structure for `users_address`
-- ----------------------------
DROP TABLE IF EXISTS `users_address`;
CREATE TABLE `users_address` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  bigint(20) NOT NULL ,
`user_id`  int(11) NOT NULL ,
`name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `users_address_user_id_5940053c30389e34_fk_users_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of users_address
-- ----------------------------
BEGIN;
INSERT INTO `users_address` VALUES ('1', '河北省定州市杨家庄乡东马家寨村', '18732429547', '1', '李四'), ('7', '北京市', '19832423555', '2', '吴梦宇'), ('8', 'sdf', '23324232', '1', 'dsf ');
COMMIT;

-- ----------------------------
-- Table structure for `users_banner`
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`project_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `users_banner_b098ad43` (`project_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
BEGIN;
INSERT INTO `users_banner` VALUES ('1', 'aa', 'banner/2018/05/carousel-1.jpg', 'http://www.baidu.com', '1'), ('2', 'bb', 'banner/2018/05/carousel-2.jpg', 'http://www.baidu.com', '2'), ('3', 'cc', 'banner/2018/05/carousel-3.jpg', 'http://www.baidu.com', null);
COMMIT;

-- ----------------------------
-- Table structure for `users_emailcode`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailcode`;
CREATE TABLE `users_emailcode` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`send_type`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`send_time`  date NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of users_emailcode
-- ----------------------------
BEGIN;
INSERT INTO `users_emailcode` VALUES ('1', 'oQuaUsATGG9Bzc71', '18732429547@163.com', 'register', '2018-05-12'), ('2', '9g6NkQhZBbqwOSOw', '530979104@qq.com', 'register', '2018-05-14');
COMMIT;

-- ----------------------------
-- Table structure for `users_usercreate`
-- ----------------------------
DROP TABLE IF EXISTS `users_usercreate`;
CREATE TABLE `users_usercreate` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`add_time`  date NOT NULL ,
`project_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `users_usercrea_project_id_7d3c2b2876d8080d_fk_project_project_id` (`project_id`) USING BTREE ,
INDEX `users_usercreate_user_id_57228fdf2b62a67_fk_users_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of users_usercreate
-- ----------------------------
BEGIN;
INSERT INTO `users_usercreate` VALUES ('1', '2018-05-14', '19', '2'), ('2', '2018-05-15', '20', '2'), ('3', '2018-05-15', '21', '1'), ('4', '2018-05-15', '22', '1'), ('5', '2018-05-15', '23', '1'), ('6', '2018-05-15', '25', '1');
COMMIT;

-- ----------------------------
-- Table structure for `users_userflower`
-- ----------------------------
DROP TABLE IF EXISTS `users_userflower`;
CREATE TABLE `users_userflower` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`add_time`  date NOT NULL ,
`company_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`company_id`) REFERENCES `project_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `users_userflowe_user_id_47ffebb8e523cc5c_fk_users_userprofile_id` (`user_id`) USING BTREE ,
INDEX `users_userflow_company_id_66ec7abc0442c784_fk_project_project_id` (`company_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=15

;

-- ----------------------------
-- Records of users_userflower
-- ----------------------------
BEGIN;
INSERT INTO `users_userflower` VALUES ('12', '2018-05-12', '19', '2'), ('14', '2018-05-14', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`password`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_login`  datetime(6) NULL DEFAULT NULL ,
`is_superuser`  tinyint(1) NOT NULL ,
`username`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`first_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_staff`  tinyint(1) NOT NULL ,
`is_active`  tinyint(1) NOT NULL ,
`date_joined`  datetime(6) NOT NULL ,
`authstatus`  smallint(6) NOT NULL ,
`usertype`  tinyint(1) NOT NULL ,
`realname`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
BEGIN;
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$20000$nK2h4hnenQSz$30O2Ns/mg2rP/nbmo/i4Nc0dDHWDN20yyd40KlTZk6o=', '2018-05-15 01:35:42.092886', '1', 'admin', '', '', '', '1', '1', '2018-05-10 07:35:58.183891', '0', '0', ''), ('2', 'pbkdf2_sha256$20000$Ssd3vlBV1Om6$XxIpl6KuhqUelZ/9+kIq7ClY1u6w/zT6ZFOrNo4AWB8=', '2018-05-14 07:01:37.569169', '0', 'wumengyu', '', '', '18732429547@163.com', '0', '1', '2018-05-12 10:31:05.820385', '0', '1', ''), ('3', 'pbkdf2_sha256$20000$khooTxdFHRl8$fqzRRj+YAVOGeOv8JRXM9wvfEgRnIcJkVcYI7amrz5I=', '2018-05-14 02:54:03.180243', '0', 'zhangsan', '', '', '530979104@qq.com', '0', '1', '2018-05-14 02:51:32.409833', '0', '1', '');
COMMIT;

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`userprofile_id`  int(11) NOT NULL ,
`group_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `userprofile_id` (`userprofile_id`, `group_id`) USING BTREE ,
INDEX `users_userprofile_grou_group_id_c56690fd9caf3c7_fk_auth_group_id` (`group_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`userprofile_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `userprofile_id` (`userprofile_id`, `permission_id`) USING BTREE ,
INDEX `users_userpr_permission_id_61dc4664665e0f2_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `users_usersupprot`
-- ----------------------------
DROP TABLE IF EXISTS `users_usersupprot`;
CREATE TABLE `users_usersupprot` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`add_time`  date NOT NULL ,
`project_id`  int(11) NOT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `users_usersupp_project_id_6ff39d686de9c235_fk_project_project_id` (`project_id`) USING BTREE ,
INDEX `users_usersuppr_user_id_39d4a6d7d0f8963a_fk_users_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of users_usersupprot
-- ----------------------------
BEGIN;
INSERT INTO `users_usersupprot` VALUES ('1', '2018-05-01', '1', '1'), ('2', '2018-05-14', '1', '2'), ('3', '2018-05-14', '19', '2');
COMMIT;

-- ----------------------------
-- Auto increment value for `auth_group`
-- ----------------------------
ALTER TABLE `auth_group` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_group_permissions`
-- ----------------------------
ALTER TABLE `auth_group_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_permission`
-- ----------------------------
ALTER TABLE `auth_permission` AUTO_INCREMENT=55;

-- ----------------------------
-- Auto increment value for `django_admin_log`
-- ----------------------------
ALTER TABLE `django_admin_log` AUTO_INCREMENT=35;

-- ----------------------------
-- Auto increment value for `django_content_type`
-- ----------------------------
ALTER TABLE `django_content_type` AUTO_INCREMENT=19;

-- ----------------------------
-- Auto increment value for `django_migrations`
-- ----------------------------
ALTER TABLE `django_migrations` AUTO_INCREMENT=47;

-- ----------------------------
-- Auto increment value for `project_company`
-- ----------------------------
ALTER TABLE `project_company` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for `project_invoice`
-- ----------------------------
ALTER TABLE `project_invoice` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `project_label`
-- ----------------------------
ALTER TABLE `project_label` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `project_project`
-- ----------------------------
ALTER TABLE `project_project` AUTO_INCREMENT=26;

-- ----------------------------
-- Auto increment value for `project_returngoods`
-- ----------------------------
ALTER TABLE `project_returngoods` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `project_tag`
-- ----------------------------
ALTER TABLE `project_tag` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `users_address`
-- ----------------------------
ALTER TABLE `users_address` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `users_banner`
-- ----------------------------
ALTER TABLE `users_banner` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `users_emailcode`
-- ----------------------------
ALTER TABLE `users_emailcode` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `users_usercreate`
-- ----------------------------
ALTER TABLE `users_usercreate` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `users_userflower`
-- ----------------------------
ALTER TABLE `users_userflower` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for `users_userprofile`
-- ----------------------------
ALTER TABLE `users_userprofile` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `users_userprofile_groups`
-- ----------------------------
ALTER TABLE `users_userprofile_groups` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `users_userprofile_user_permissions`
-- ----------------------------
ALTER TABLE `users_userprofile_user_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `users_usersupprot`
-- ----------------------------
ALTER TABLE `users_usersupprot` AUTO_INCREMENT=4;
