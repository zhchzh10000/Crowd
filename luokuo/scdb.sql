/*
Navicat MySQL Data Transfer

Source Server         : 尚筹
Source Server Version : 50722
Source Host           : 192.168.20.38:3306
Source Database       : scdb

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-15 13:08:52
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
UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`, `permission_id`) USING BTREE ,
INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`) USING BTREE 
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
UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`, `codename`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=68

;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can view log entry', '1', 'view_logentry'), ('5', 'Can add permission', '2', 'add_permission'), ('6', 'Can change permission', '2', 'change_permission'), ('7', 'Can delete permission', '2', 'delete_permission'), ('8', 'Can add group', '3', 'add_group'), ('9', 'Can change group', '3', 'change_group'), ('10', 'Can delete group', '3', 'delete_group'), ('11', 'Can view group', '3', 'view_group'), ('12', 'Can view permission', '2', 'view_permission'), ('13', 'Can add content type', '4', 'add_contenttype'), ('14', 'Can change content type', '4', 'change_contenttype'), ('15', 'Can delete content type', '4', 'delete_contenttype'), ('16', 'Can view content type', '4', 'view_contenttype'), ('17', 'Can add session', '5', 'add_session'), ('18', 'Can change session', '5', 'change_session'), ('19', 'Can delete session', '5', 'delete_session'), ('20', 'Can view session', '5', 'view_session'), ('21', 'Can add 用户信息', '6', 'add_userprofile'), ('22', 'Can change 用户信息', '6', 'change_userprofile'), ('23', 'Can delete 用户信息', '6', 'delete_userprofile'), ('24', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord'), ('25', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord'), ('26', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord'), ('27', 'Can add 轮播图', '8', 'add_banner'), ('28', 'Can change 轮播图', '8', 'change_banner'), ('29', 'Can delete 轮播图', '8', 'delete_banner'), ('30', 'Can add cert', '9', 'add_cert'), ('31', 'Can change cert', '9', 'change_cert'), ('32', 'Can delete cert', '9', 'delete_cert'), ('33', 'Can view 轮播图', '8', 'view_banner'), ('34', 'Can view cert', '9', 'view_cert'), ('35', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord'), ('36', 'Can view 用户信息', '6', 'view_userprofile'), ('37', 'Can add Bookmark', '10', 'add_bookmark'), ('38', 'Can change Bookmark', '10', 'change_bookmark'), ('39', 'Can delete Bookmark', '10', 'delete_bookmark'), ('40', 'Can add User Setting', '11', 'add_usersettings'), ('41', 'Can change User Setting', '11', 'change_usersettings'), ('42', 'Can delete User Setting', '11', 'delete_usersettings'), ('43', 'Can add User Widget', '12', 'add_userwidget'), ('44', 'Can change User Widget', '12', 'change_userwidget'), ('45', 'Can delete User Widget', '12', 'delete_userwidget'), ('46', 'Can add log entry', '13', 'add_log'), ('47', 'Can change log entry', '13', 'change_log'), ('48', 'Can delete log entry', '13', 'delete_log'), ('49', 'Can view Bookmark', '10', 'view_bookmark'), ('50', 'Can view log entry', '13', 'view_log'), ('51', 'Can view User Setting', '11', 'view_usersettings'), ('52', 'Can view User Widget', '12', 'view_userwidget'), ('53', 'Can add captcha store', '14', 'add_captchastore'), ('54', 'Can change captcha store', '14', 'change_captchastore'), ('55', 'Can delete captcha store', '14', 'delete_captchastore'), ('56', 'Can view captcha store', '14', 'view_captchastore'), ('57', 'Can add 项目信息', '15', 'add_project'), ('58', 'Can change 项目信息', '15', 'change_project'), ('59', 'Can delete 项目信息', '15', 'delete_project'), ('60', 'Can view 项目信息', '15', 'view_project'), ('61', 'Can add 订单', '16', 'add_order'), ('62', 'Can change 订单', '16', 'change_order'), ('63', 'Can delete 订单', '16', 'delete_order'), ('64', 'Can view 订单', '16', 'view_order'), ('65', 'Can add 回报设置', '17', 'add_returnsetting'), ('66', 'Can change 回报设置', '17', 'change_returnsetting'), ('67', 'Can delete 回报设置', '17', 'delete_returnsetting');
COMMIT;

-- ----------------------------
-- Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`challenge`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`response`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`hashkey`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`expiration`  datetime(6) NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `hashkey` (`hashkey`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
BEGIN;
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
FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`) USING BTREE ,
INDEX `django_admin_log_user_id_c564eba6_fk_user_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
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
UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq` (`app_label`, `model`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=18

;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('3', 'auth', 'group'), ('2', 'auth', 'permission'), ('14', 'captcha', 'captchastore'), ('4', 'contenttypes', 'contenttype'), ('17', 'operation', 'returnsetting'), ('16', 'order', 'order'), ('15', 'project', 'project'), ('5', 'sessions', 'session'), ('8', 'user', 'banner'), ('9', 'user', 'cert'), ('7', 'user', 'emailverifyrecord'), ('6', 'user', 'userprofile'), ('10', 'xadmin', 'bookmark'), ('13', 'xadmin', 'log'), ('11', 'xadmin', 'usersettings'), ('12', 'xadmin', 'userwidget');
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
AUTO_INCREMENT=22

;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-14 14:50:26.773417'), ('2', 'contenttypes', '0002_remove_content_type_name', '2018-05-14 14:50:26.825970'), ('3', 'auth', '0001_initial', '2018-05-14 14:50:26.993525'), ('4', 'auth', '0002_alter_permission_name_max_length', '2018-05-14 14:50:27.027318'), ('5', 'auth', '0003_alter_user_email_max_length', '2018-05-14 14:50:27.037631'), ('6', 'auth', '0004_alter_user_username_opts', '2018-05-14 14:50:27.049612'), ('7', 'auth', '0005_alter_user_last_login_null', '2018-05-14 14:50:27.060348'), ('8', 'auth', '0006_require_contenttypes_0002', '2018-05-14 14:50:27.066895'), ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-05-14 14:50:27.078331'), ('10', 'user', '0001_initial', '2018-05-14 14:50:27.269517'), ('11', 'admin', '0001_initial', '2018-05-14 14:50:27.320738'), ('12', 'admin', '0002_logentry_remove_auto_add', '2018-05-14 14:50:27.340249'), ('13', 'captcha', '0001_initial', '2018-05-14 14:50:27.360393'), ('14', 'operation', '0001_initial', '2018-05-14 14:50:27.377948'), ('15', 'operation', '0002_returnsetting_r_user', '2018-05-14 14:50:27.430458'), ('16', 'order', '0001_initial', '2018-05-14 14:50:27.442783'), ('17', 'project', '0001_initial', '2018-05-14 14:50:27.459860'), ('18', 'sessions', '0001_initial', '2018-05-14 14:50:27.485594'), ('19', 'xadmin', '0001_initial', '2018-05-14 14:50:27.627405'), ('20', 'xadmin', '0002_log', '2018-05-14 14:50:27.683920'), ('21', 'xadmin', '0003_auto_20160715_0100', '2018-05-14 14:50:27.728961');
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
INSERT INTO `django_session` VALUES ('i5gaqj9775rkipfui8bur1wbdgx8nxm7', 'NDhkMmZmMzBlN2NiOTg3ZTBkODhjZDgyMWFjNWY2ZWI3Y2YzNjgxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU0MzBjY2Q1MmYxMjU0YTM2NDg1ZjQxNmEwOWU2NjMzZDBiY2M0YSIsIkxJU1RfUVVFUlkiOltbImF1dGgiLCJncm91cCJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlci52aWV3cy5DdXN0b21CYWNrZW5kIn0=', '2018-05-28 15:08:41.651699');
COMMIT;

-- ----------------------------
-- Table structure for `operation_returnsetting`
-- ----------------------------
DROP TABLE IF EXISTS `operation_returnsetting`;
CREATE TABLE `operation_returnsetting` (
`r_num`  int(11) NOT NULL AUTO_INCREMENT ,
`r_type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`support_money`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_content`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_total`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_limit`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_freight`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_invoice`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_date`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`r_user_id`  int(11) NOT NULL ,
PRIMARY KEY (`r_num`),
FOREIGN KEY (`r_user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `operation_returnsetting_0c0ecb01` (`r_user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of operation_returnsetting
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `order_order`
-- ----------------------------
DROP TABLE IF EXISTS `order_order`;
CREATE TABLE `order_order` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`createdate`  datetime(6) NOT NULL ,
`status`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`invoice`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`invoictitle`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of order_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `project_project`
-- ----------------------------
DROP TABLE IF EXISTS `project_project`;
CREATE TABLE `project_project` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`category`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`image_detail`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`money`  bigint(20) NOT NULL ,
`day`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`status`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`deploydate`  date NOT NULL ,
`supporter`  int(11) NOT NULL ,
`supportmoney`  bigint(20) NOT NULL ,
`completion`  int(11) NOT NULL ,
`memberid`  int(11) NOT NULL ,
`createdate`  date NOT NULL ,
`follower`  int(11) NOT NULL ,
`info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of project_project
-- ----------------------------
BEGIN;
INSERT INTO `project_project` VALUES ('1', 'st', 'image/project/2018/05/product-1.jpg', 'image/project/2018/05/product_detail_body.jpg', '科技产品001', '科技', '20000', '30', 'ready', '2018-05-14', '0', '0', '0', '0', '2018-05-14', '1000', '高科技产品1,谁用谁知道'), ('2', 'st', 'image/project/2018/05/product-2.gif', 'image/project/2018/05/product_detail_body_LT1s9Km.jpg', '科技产品002', '科技', '50000', '60', 'begin', '2018-05-14', '100', '2000', '21', '100', '2018-05-14', '2000', '科技产品2222'), ('3', 'design', 'image/project/2018/05/product-3.png', 'image/project/2018/05/product_detail_body_v3PkPCI.jpg', '设计产品1', '设计', '10000', '20', 'ready', '2018-05-14', '50', '5000', '12', '50', '2018-05-14', '100', '设计产品1111'), ('4', 'pw', 'image/project/2018/05/product-4.jpg', 'image/project/2018/05/product_detail_body_wi8Zccc.jpg', '公益产品111', '公益', '10000', '30', 'ready', '2018-05-14', '120', '6000', '12', '120', '2018-05-14', '200', '公益产品111'), ('5', 'ag', 'image/project/2018/05/product-5.jpg', 'image/project/2018/05/product_detail_body_spblROa.jpg', '农业产品1', '农业', '100000', '30', 'begin', '2018-05-14', '231', '30000', '12', '123', '2018-05-14', '300', '农业产品11111'), ('6', 'cu', 'image/project/2018/05/product-6.jpg', 'image/project/2018/05/product_detail_body_lZtHGsj.jpg', '文化产品111', '文化', '12000', '60', 'begin', '2018-05-14', '200', '30000', '12', '200', '2018-05-14', '500', '文化产品1231');
COMMIT;

-- ----------------------------
-- Table structure for `user_banner`
-- ----------------------------
DROP TABLE IF EXISTS `user_banner`;
CREATE TABLE `user_banner` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`index`  int(11) NOT NULL ,
`add_time`  datetime(6) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of user_banner
-- ----------------------------
BEGIN;
INSERT INTO `user_banner` VALUES ('1', '儿童机器人', 'banner/2018/05/carousel-1_cHMJWq2.jpg', 'http://www.baidu.com', '100', '2018-05-14 14:53:00.000000'), ('2', '电源插座', 'banner/2018/05/carousel-2_LWByAv2.jpg', 'http://www.baidu.com', '100', '2018-05-14 14:53:00.000000'), ('3', '空气过滤器', 'banner/2018/05/carousel-3_lpMvvOf.jpg', 'http://www.baidu.com', '100', '2018-05-14 14:54:00.000000');
COMMIT;

-- ----------------------------
-- Table structure for `user_cert`
-- ----------------------------
DROP TABLE IF EXISTS `user_cert`;
CREATE TABLE `user_cert` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`cert_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cert_company`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cert_pay`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cert_number`  varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cert_phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cert_info`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of user_cert
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `user_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `user_emailverifyrecord`;
CREATE TABLE `user_emailverifyrecord` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`code`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`send_type`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`send_time`  datetime(6) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of user_emailverifyrecord
-- ----------------------------
BEGIN;
INSERT INTO `user_emailverifyrecord` VALUES ('1', 'pWHmvSGSR8uZNbAV', '186231@qq.com', 'register', '2018-05-14 15:10:10.808503'), ('2', 'mJe6WCQ90XIdc95O', '123456789qwe@qq.com', 'register', '2018-05-14 17:04:27.616272');
COMMIT;

-- ----------------------------
-- Table structure for `user_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile`;
CREATE TABLE `user_userprofile` (
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
`role`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`customer_type`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`mobile`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`rel_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`rel_number`  varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`rel_image`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of user_userprofile
-- ----------------------------
BEGIN;
INSERT INTO `user_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$Nu3J5SbCQeqJ$8nIJywqnTeii8+4ZDrEXyV0OXFZQ1/gRtUrdJHNw+2I=', '2018-05-14 14:52:42.838905', '1', 'admin', '', '', '', '1', '1', '2018-05-14 14:51:01.728601', 'member', 'personal', '', null, 'image/default.png', '', '', ''), ('2', 'pbkdf2_sha256$24000$y1zRwI0yvaBB$S1mmFLD00VedHHEkIJgz3ApqjNDFIlPFwqFfpcRs6+o=', null, '0', '朱元璋', '', '', '186231@qq.com', '0', '1', '2018-05-14 15:10:10.752584', 'member', '', '', null, 'image/default.png', '', '', ''), ('3', 'pbkdf2_sha256$24000$z2mTkXTl3G9f$QVfltiFXW/nWFvA1qSp6aqBFFYE0qUL9FDp9i7cnDVk=', null, '0', 'guojing', '', '', '123456789qwe@qq.com', '0', '1', '2018-05-14 17:04:27.557676', 'member', '', '', null, 'image/default.png', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for `user_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_groups`;
CREATE TABLE `user_userprofile_groups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`userprofile_id`  int(11) NOT NULL ,
`group_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `user_userprofile_groups_userprofile_id_52847a61_uniq` (`userprofile_id`, `group_id`) USING BTREE ,
INDEX `user_userprofile_groups_group_id_98cc4038_fk_auth_group_id` (`group_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of user_userprofile_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `user_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `user_userprofile_user_permissions`;
CREATE TABLE `user_userprofile_user_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`userprofile_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`userprofile_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `user_userprofile_user_permissions_userprofile_id_2e86ceca_uniq` (`userprofile_id`, `permission_id`) USING BTREE ,
INDEX `user_userprofile_us_permission_id_7f559b23_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of user_userprofile_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`query`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_share`  tinyint(1) NOT NULL ,
`content_type_id`  int(11) NOT NULL ,
`user_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`) USING BTREE ,
INDEX `xadmin_bookmark_user_id_42d307fc_fk_user_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`action_time`  datetime(6) NOT NULL ,
`ip_addr`  char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`object_id`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`object_repr`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`action_flag`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NULL DEFAULT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`) USING BTREE ,
INDEX `xadmin_log_user_id_bb16a176_fk_user_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=10

;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_log` VALUES ('1', '2018-05-14 14:53:47.451036', '127.0.0.1', '1', 'Banner object', 'create', '已添加', '8', '1'), ('2', '2018-05-14 14:54:30.687372', '127.0.0.1', '2', 'Banner object', 'create', '已添加', '8', '1'), ('3', '2018-05-14 14:55:07.320224', '127.0.0.1', '3', 'Banner object', 'create', '已添加', '8', '1'), ('4', '2018-05-14 14:59:58.049592', '127.0.0.1', '1', '科技产品001', 'create', '已添加', '15', '1'), ('5', '2018-05-14 15:01:38.510127', '127.0.0.1', '2', '科技产品002', 'create', '已添加', '15', '1'), ('6', '2018-05-14 15:02:51.630922', '127.0.0.1', '3', '设计产品1', 'create', '已添加', '15', '1'), ('7', '2018-05-14 15:04:12.556293', '127.0.0.1', '4', '公益产品111', 'create', '已添加', '15', '1'), ('8', '2018-05-14 15:05:28.372920', '127.0.0.1', '5', '农业产品1', 'create', '已添加', '15', '1'), ('9', '2018-05-14 15:07:00.785657', '127.0.0.1', '6', '文化产品111', 'create', '已添加', '15', '1');
COMMIT;

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`key`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`value`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `xadmin_usersettings_user_id_edeabe4a_fk_user_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
COMMIT;

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`page_id`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`widget_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`value`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `xadmin_userwidget_user_id_c159233a_fk_user_userprofile_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
BEGIN;
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
ALTER TABLE `auth_permission` AUTO_INCREMENT=68;

-- ----------------------------
-- Auto increment value for `captcha_captchastore`
-- ----------------------------
ALTER TABLE `captcha_captchastore` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `django_admin_log`
-- ----------------------------
ALTER TABLE `django_admin_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `django_content_type`
-- ----------------------------
ALTER TABLE `django_content_type` AUTO_INCREMENT=18;

-- ----------------------------
-- Auto increment value for `django_migrations`
-- ----------------------------
ALTER TABLE `django_migrations` AUTO_INCREMENT=22;

-- ----------------------------
-- Auto increment value for `operation_returnsetting`
-- ----------------------------
ALTER TABLE `operation_returnsetting` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `order_order`
-- ----------------------------
ALTER TABLE `order_order` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `project_project`
-- ----------------------------
ALTER TABLE `project_project` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `user_banner`
-- ----------------------------
ALTER TABLE `user_banner` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `user_cert`
-- ----------------------------
ALTER TABLE `user_cert` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `user_emailverifyrecord`
-- ----------------------------
ALTER TABLE `user_emailverifyrecord` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `user_userprofile`
-- ----------------------------
ALTER TABLE `user_userprofile` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `user_userprofile_groups`
-- ----------------------------
ALTER TABLE `user_userprofile_groups` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `user_userprofile_user_permissions`
-- ----------------------------
ALTER TABLE `user_userprofile_user_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `xadmin_bookmark`
-- ----------------------------
ALTER TABLE `xadmin_bookmark` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `xadmin_log`
-- ----------------------------
ALTER TABLE `xadmin_log` AUTO_INCREMENT=10;

-- ----------------------------
-- Auto increment value for `xadmin_usersettings`
-- ----------------------------
ALTER TABLE `xadmin_usersettings` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `xadmin_userwidget`
-- ----------------------------
ALTER TABLE `xadmin_userwidget` AUTO_INCREMENT=1;
