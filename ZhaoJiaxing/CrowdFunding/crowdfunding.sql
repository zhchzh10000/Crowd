/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : crowdfunding

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 15/05/2018 12:00:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (9, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (10, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (11, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (24, 'Can add 用户地址', 7, 'add_useraddress');
INSERT INTO `auth_permission` VALUES (25, 'Can change 用户地址', 7, 'change_useraddress');
INSERT INTO `auth_permission` VALUES (26, 'Can delete 用户地址', 7, 'delete_useraddress');
INSERT INTO `auth_permission` VALUES (27, 'Can view 用户地址', 7, 'view_useraddress');
INSERT INTO `auth_permission` VALUES (28, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (29, 'Can add 企业名称', 8, 'add_company');
INSERT INTO `auth_permission` VALUES (30, 'Can change 企业名称', 8, 'change_company');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 企业名称', 8, 'delete_company');
INSERT INTO `auth_permission` VALUES (32, 'Can add 众筹项目', 9, 'add_project');
INSERT INTO `auth_permission` VALUES (33, 'Can change 众筹项目', 9, 'change_project');
INSERT INTO `auth_permission` VALUES (34, 'Can delete 众筹项目', 9, 'delete_project');
INSERT INTO `auth_permission` VALUES (35, 'Can add 分类信息', 10, 'add_projectcategory');
INSERT INTO `auth_permission` VALUES (36, 'Can change 分类信息', 10, 'change_projectcategory');
INSERT INTO `auth_permission` VALUES (37, 'Can delete 分类信息', 10, 'delete_projectcategory');
INSERT INTO `auth_permission` VALUES (38, 'Can add 回报名称', 11, 'add_projectitem');
INSERT INTO `auth_permission` VALUES (39, 'Can change 回报名称', 11, 'change_projectitem');
INSERT INTO `auth_permission` VALUES (40, 'Can delete 回报名称', 11, 'delete_projectitem');
INSERT INTO `auth_permission` VALUES (41, 'Can add 项目标签', 12, 'add_projecttags');
INSERT INTO `auth_permission` VALUES (42, 'Can change 项目标签', 12, 'change_projecttags');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 项目标签', 12, 'delete_projecttags');
INSERT INTO `auth_permission` VALUES (44, 'Can view 企业名称', 8, 'view_company');
INSERT INTO `auth_permission` VALUES (45, 'Can view 众筹项目', 9, 'view_project');
INSERT INTO `auth_permission` VALUES (46, 'Can view 分类信息', 10, 'view_projectcategory');
INSERT INTO `auth_permission` VALUES (47, 'Can view 回报名称', 11, 'view_projectitem');
INSERT INTO `auth_permission` VALUES (48, 'Can view 项目标签', 12, 'view_projecttags');
INSERT INTO `auth_permission` VALUES (49, 'Can add 订单信息', 13, 'add_userpayorder');
INSERT INTO `auth_permission` VALUES (50, 'Can change 订单信息', 13, 'change_userpayorder');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 订单信息', 13, 'delete_userpayorder');
INSERT INTO `auth_permission` VALUES (52, 'Can view 订单信息', 13, 'view_userpayorder');
INSERT INTO `auth_permission` VALUES (53, 'Can add 广告信息', 14, 'add_advertise');
INSERT INTO `auth_permission` VALUES (54, 'Can change 广告信息', 14, 'change_advertise');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 广告信息', 14, 'delete_advertise');
INSERT INTO `auth_permission` VALUES (56, 'Can add 轮播图', 15, 'add_banner');
INSERT INTO `auth_permission` VALUES (57, 'Can change 轮播图', 15, 'change_banner');
INSERT INTO `auth_permission` VALUES (58, 'Can delete 轮播图', 15, 'delete_banner');
INSERT INTO `auth_permission` VALUES (59, 'Can add 用户关注', 16, 'add_userinterest');
INSERT INTO `auth_permission` VALUES (60, 'Can change 用户关注', 16, 'change_userinterest');
INSERT INTO `auth_permission` VALUES (61, 'Can delete 用户关注', 16, 'delete_userinterest');
INSERT INTO `auth_permission` VALUES (62, 'Can add 用户支持', 17, 'add_usersupport');
INSERT INTO `auth_permission` VALUES (63, 'Can change 用户支持', 17, 'change_usersupport');
INSERT INTO `auth_permission` VALUES (64, 'Can delete 用户支持', 17, 'delete_usersupport');
INSERT INTO `auth_permission` VALUES (65, 'Can view 广告信息', 14, 'view_advertise');
INSERT INTO `auth_permission` VALUES (66, 'Can view 轮播图', 15, 'view_banner');
INSERT INTO `auth_permission` VALUES (67, 'Can view 用户关注', 16, 'view_userinterest');
INSERT INTO `auth_permission` VALUES (68, 'Can view 用户支持', 17, 'view_usersupport');
INSERT INTO `auth_permission` VALUES (69, 'Can add Bookmark', 18, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (70, 'Can change Bookmark', 18, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (71, 'Can delete Bookmark', 18, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (72, 'Can add User Setting', 19, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (73, 'Can change User Setting', 19, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (74, 'Can delete User Setting', 19, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (75, 'Can add User Widget', 20, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (76, 'Can change User Widget', 20, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (77, 'Can delete User Widget', 20, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (78, 'Can add log entry', 21, 'add_log');
INSERT INTO `auth_permission` VALUES (79, 'Can change log entry', 21, 'change_log');
INSERT INTO `auth_permission` VALUES (80, 'Can delete log entry', 21, 'delete_log');
INSERT INTO `auth_permission` VALUES (81, 'Can view Bookmark', 18, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can view log entry', 21, 'view_log');
INSERT INTO `auth_permission` VALUES (83, 'Can view User Setting', 19, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (84, 'Can view User Widget', 20, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (85, 'Can add 邮箱验证码', 22, 'add_emailverifyview');
INSERT INTO `auth_permission` VALUES (86, 'Can change 邮箱验证码', 22, 'change_emailverifyview');
INSERT INTO `auth_permission` VALUES (87, 'Can delete 邮箱验证码', 22, 'delete_emailverifyview');
INSERT INTO `auth_permission` VALUES (88, 'Can view 邮箱验证码', 22, 'view_emailverifyview');
INSERT INTO `auth_permission` VALUES (89, 'Can add 邮箱验证码', 23, 'add_emailverifycode');
INSERT INTO `auth_permission` VALUES (90, 'Can change 邮箱验证码', 23, 'change_emailverifycode');
INSERT INTO `auth_permission` VALUES (91, 'Can delete 邮箱验证码', 23, 'delete_emailverifycode');
INSERT INTO `auth_permission` VALUES (92, 'Can view 邮箱验证码', 23, 'view_emailverifycode');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (14, 'operations', 'advertise');
INSERT INTO `django_content_type` VALUES (15, 'operations', 'banner');
INSERT INTO `django_content_type` VALUES (23, 'operations', 'emailverifycode');
INSERT INTO `django_content_type` VALUES (22, 'operations', 'emailverifyview');
INSERT INTO `django_content_type` VALUES (16, 'operations', 'userinterest');
INSERT INTO `django_content_type` VALUES (17, 'operations', 'usersupport');
INSERT INTO `django_content_type` VALUES (13, 'orders', 'userpayorder');
INSERT INTO `django_content_type` VALUES (8, 'projects', 'company');
INSERT INTO `django_content_type` VALUES (9, 'projects', 'project');
INSERT INTO `django_content_type` VALUES (10, 'projects', 'projectcategory');
INSERT INTO `django_content_type` VALUES (11, 'projects', 'projectitem');
INSERT INTO `django_content_type` VALUES (12, 'projects', 'projecttags');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'users', 'useraddress');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (18, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (19, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (20, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-05-09 16:19:39.840443');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-05-09 16:19:39.981549');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-05-09 16:19:40.443497');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-05-09 16:19:40.534065');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-05-09 16:19:40.550077');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-05-09 16:19:40.565593');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-05-09 16:19:40.579109');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-05-09 16:19:40.584112');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-05-09 16:19:40.609129');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-05-09 16:19:40.623139');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-05-09 16:19:40.635146');
INSERT INTO `django_migrations` VALUES (12, 'users', '0001_initial', '2018-05-09 16:19:41.803332');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2018-05-09 16:19:42.031056');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2018-05-09 16:19:42.077597');
INSERT INTO `django_migrations` VALUES (15, 'projects', '0001_initial', '2018-05-09 16:19:43.470868');
INSERT INTO `django_migrations` VALUES (16, 'operations', '0001_initial', '2018-05-09 16:19:44.412451');
INSERT INTO `django_migrations` VALUES (17, 'orders', '0001_initial', '2018-05-09 16:19:44.969891');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2018-05-09 16:19:45.065466');
INSERT INTO `django_migrations` VALUES (19, 'xadmin', '0001_initial', '2018-05-09 16:19:45.956067');
INSERT INTO `django_migrations` VALUES (20, 'xadmin', '0002_log', '2018-05-09 16:19:46.243780');
INSERT INTO `django_migrations` VALUES (21, 'xadmin', '0003_auto_20160715_0100', '2018-05-09 16:19:46.365867');
INSERT INTO `django_migrations` VALUES (22, 'orders', '0002_auto_20180510_1910', '2018-05-10 11:11:02.039616');
INSERT INTO `django_migrations` VALUES (23, 'operations', '0002_auto_20180510_1917', '2018-05-10 11:17:39.332130');
INSERT INTO `django_migrations` VALUES (24, 'projects', '0002_auto_20180510_1917', '2018-05-10 11:17:40.059853');
INSERT INTO `django_migrations` VALUES (25, 'operations', '0003_auto_20180510_1939', '2018-05-10 11:39:18.999034');
INSERT INTO `django_migrations` VALUES (26, 'users', '0002_auto_20180511_0104', '2018-05-10 17:04:12.858959');
INSERT INTO `django_migrations` VALUES (27, 'operations', '0004_emailverifyview', '2018-05-11 02:40:07.795215');
INSERT INTO `django_migrations` VALUES (28, 'operations', '0005_auto_20180511_1119', '2018-05-11 03:19:24.861405');
INSERT INTO `django_migrations` VALUES (29, 'operations', '0006_auto_20180511_1121', '2018-05-11 03:21:21.615668');
INSERT INTO `django_migrations` VALUES (30, 'operations', '0007_emailverifycode_email', '2018-05-11 03:27:32.101673');
INSERT INTO `django_migrations` VALUES (31, 'projects', '0003_remove_projectitem_item_desc', '2018-05-11 07:38:25.348897');
INSERT INTO `django_migrations` VALUES (32, 'projects', '0004_project_left_days', '2018-05-11 13:16:13.747432');
INSERT INTO `django_migrations` VALUES (33, 'projects', '0005_auto_20180512_0118', '2018-05-11 17:18:18.470050');
INSERT INTO `django_migrations` VALUES (34, 'projects', '0006_projectcategory_weight', '2018-05-12 01:24:15.963546');
INSERT INTO `django_migrations` VALUES (35, 'projects', '0007_project_due_date', '2018-05-12 02:07:04.753192');
INSERT INTO `django_migrations` VALUES (36, 'orders', '0003_userpayorder_order_no', '2018-05-12 03:56:39.390547');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('21fvg1kqf0p4hk8ogbi3kjykkzwtfxyz', 'ZDdmNGM0NWJjMDA3ZTY0MDVlMTI4YmI4OWY5ZGYzNThkMjEwOWFiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MmQ0ZTQzNzBkMDg2MDExYzg0OTllZTNjMWVlYWM2ODkwOGU5MDExIn0=', '2018-05-28 10:53:21.308668');
INSERT INTO `django_session` VALUES ('7f620amuxfqml67wxhzrgvufks2ojk22', 'ZDdmNGM0NWJjMDA3ZTY0MDVlMTI4YmI4OWY5ZGYzNThkMjEwOWFiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MmQ0ZTQzNzBkMDg2MDExYzg0OTllZTNjMWVlYWM2ODkwOGU5MDExIn0=', '2018-05-25 06:32:22.615851');
INSERT INTO `django_session` VALUES ('b46m7b5gx5qvexqhsrb6epr8ygxy30yv', 'YmRkYmFkZTc0NDBiNDAyYjgyMTU4N2MyMDVhZDVlMjdlZTc4ZmY2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MmQ0ZTQzNzBkMDg2MDExYzg0OTllZTNjMWVlYWM2ODkwOGU5MDExIiwiTElTVF9RVUVSWSI6W1siYXV0aCIsInBlcm1pc3Npb24iXSwiIl0sInRlbXBfcHJvamVjdF9pZCI6N30=', '2018-05-29 09:09:29.571225');

-- ----------------------------
-- Table structure for operations_advertise
-- ----------------------------
DROP TABLE IF EXISTS `operations_advertise`;
CREATE TABLE `operations_advertise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_advertise_project_id_445bf833_fk_projects_project_id`(`project_id`) USING BTREE,
  CONSTRAINT `operations_advertise_project_id_445bf833_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations_advertise
-- ----------------------------
INSERT INTO `operations_advertise` VALUES (1, '轮播图1', 1, 'advertise/2018/05/333333.jpg', 3, 0, '2018-05-10 11:39:18.540615', 0, '2018-05-11 13:47:38.413772');
INSERT INTO `operations_advertise` VALUES (2, '轮播图2', 2, 'advertise/2018/05/111111.jpg', 2, 0, '2018-05-10 11:39:18.540615', 0, '2018-05-11 13:44:25.179851');
INSERT INTO `operations_advertise` VALUES (3, '轮播图3', 1, 'advertise/2018/05/33.jpg', 1, 0, '2018-05-10 11:39:18.540615', 0, '2018-05-10 11:39:18.866941');

-- ----------------------------
-- Table structure for operations_banner
-- ----------------------------
DROP TABLE IF EXISTS `operations_banner`;
CREATE TABLE `operations_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `banner_project_id` int(11) NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_banner_banner_project_id_dd720ae3_fk_projects_`(`banner_project_id`) USING BTREE,
  CONSTRAINT `operations_banner_banner_project_id_dd720ae3_fk_projects_` FOREIGN KEY (`banner_project_id`) REFERENCES `projects_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations_banner
-- ----------------------------
INSERT INTO `operations_banner` VALUES (1, 0, '2018-05-09 16:25:36.426773', '2018-05-11 13:47:28.278505', 'test1', 'banner/2018/05/333333.jpg', 'http://127.0.0.1:8000', 100, 3, 0);
INSERT INTO `operations_banner` VALUES (2, 0, '2018-05-09 16:25:45.874432', '2018-05-11 13:44:11.004551', 'test2', 'banner/2018/05/222222.jpg', 'http://127.0.0.1:8000', 100, 2, 0);
INSERT INTO `operations_banner` VALUES (3, 0, '2018-05-09 16:25:55.276900', '2018-05-09 16:25:55.276900', 'test3', 'banner/2018/05/33_9a1nsjw.jpg', 'http://127.0.0.1:8000', 100, 1, 0);

-- ----------------------------
-- Table structure for operations_emailverifycode
-- ----------------------------
DROP TABLE IF EXISTS `operations_emailverifycode`;
CREATE TABLE `operations_emailverifycode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_time` datetime(6) NOT NULL,
  `verify_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations_emailverifycode
-- ----------------------------
INSERT INTO `operations_emailverifycode` VALUES (8, '2018-05-11 05:54:01.251817', 'LOClU3', 'verify_id', '178728352@qq.com');
INSERT INTO `operations_emailverifycode` VALUES (9, '2018-05-11 06:08:12.643143', '59C5PM', 'verify_id', '');
INSERT INTO `operations_emailverifycode` VALUES (13, '2018-05-11 06:31:22.163726', 'oGZv9gyGO36BE1lY', 'register', '178728352@qq.com');

-- ----------------------------
-- Table structure for operations_userinterest
-- ----------------------------
DROP TABLE IF EXISTS `operations_userinterest`;
CREATE TABLE `operations_userinterest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_userinter_project_id_837cbf61_fk_projects_`(`project_id`) USING BTREE,
  INDEX `operations_userinterest_user_id_a19184ee_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operations_userinter_project_id_837cbf61_fk_projects_` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operations_userinterest_user_id_a19184ee_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations_userinterest
-- ----------------------------
INSERT INTO `operations_userinterest` VALUES (34, 0, '2018-05-11 16:22:54.153513', '2018-05-11 16:22:54.153513', 1, 1);
INSERT INTO `operations_userinterest` VALUES (36, 0, '2018-05-11 16:22:58.774372', '2018-05-11 16:22:58.774372', 2, 1);
INSERT INTO `operations_userinterest` VALUES (37, 0, '2018-05-11 17:28:23.040751', '2018-05-11 17:28:23.040751', 7, 1);

-- ----------------------------
-- Table structure for operations_usersupport
-- ----------------------------
DROP TABLE IF EXISTS `operations_usersupport`;
CREATE TABLE `operations_usersupport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `order_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `support_nums` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_usersuppo_item_id_0694f70e_fk_projects_`(`item_id`) USING BTREE,
  INDEX `operations_usersuppo_project_id_8cecf776_fk_projects_`(`project_id`) USING BTREE,
  INDEX `operations_usersupport_user_id_ba549008_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operations_usersuppo_item_id_0694f70e_fk_projects_` FOREIGN KEY (`item_id`) REFERENCES `projects_projectitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operations_usersuppo_project_id_8cecf776_fk_projects_` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operations_usersupport_user_id_ba549008_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations_usersupport
-- ----------------------------
INSERT INTO `operations_usersupport` VALUES (1, 0, '2018-05-09 17:13:21.677900', '2018-05-09 17:13:21.677900', '123123123123', 1, 1, 1, 1);
INSERT INTO `operations_usersupport` VALUES (2, 0, '2018-05-09 17:13:28.650180', '2018-05-09 17:13:28.650180', '123123123123', 1, 2, 1, 1);

-- ----------------------------
-- Table structure for orders_userpayorder
-- ----------------------------
DROP TABLE IF EXISTS `orders_userpayorder`;
CREATE TABLE `orders_userpayorder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_nums` int(11) NOT NULL,
  `freight` int(11) NOT NULL,
  `coupon` decimal(10, 2) NOT NULL,
  `total_pay` decimal(10, 2) NOT NULL,
  `need_invoice` tinyint(1) NOT NULL,
  `info_invoice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_time` datetime(6) NOT NULL,
  `pay_time` datetime(6) NOT NULL,
  `pay_order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_userpayorder_address_id_f936168b_fk_users_useraddress_id`(`address_id`) USING BTREE,
  INDEX `orders_userpayorder_item_id_78b5e4d8_fk_projects_projectitem_id`(`item_id`) USING BTREE,
  INDEX `orders_userpayorder_user_id_f6bea975_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_userpayorder_address_id_f936168b_fk_users_useraddress_id` FOREIGN KEY (`address_id`) REFERENCES `users_useraddress` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_userpayorder_item_id_78b5e4d8_fk_projects_projectitem_id` FOREIGN KEY (`item_id`) REFERENCES `projects_projectitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_userpayorder_user_id_f6bea975_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_userpayorder
-- ----------------------------
INSERT INTO `orders_userpayorder` VALUES (17, 1, 0, 0.00, 1.00, 0, '', '', '2018-05-12 03:59:57.874659', '2018-05-12 03:59:57.874659', '', 1, 1, 1, 'waiting', '201815260975971LyZc17');
INSERT INTO `orders_userpayorder` VALUES (18, 1, 0, 0.00, 1.00, 0, '', '', '2018-05-12 04:03:32.191762', '2018-05-12 13:29:50.022149', '2018051221001004950200286692', 1, 1, 1, 'paid', '201815260978121LyZc18');

-- ----------------------------
-- Table structure for projects_company
-- ----------------------------
DROP TABLE IF EXISTS `projects_company`;
CREATE TABLE `projects_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `projects_company_admin_id_37ac82ec_fk_users_userprofile_id`(`admin_id`) USING BTREE,
  CONSTRAINT `projects_company_admin_id_37ac82ec_fk_users_userprofile_id` FOREIGN KEY (`admin_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects_company
-- ----------------------------
INSERT INTO `projects_company` VALUES (1, 0, '2018-05-09 16:22:59.059047', '2018-05-09 16:28:32.924095', '超级众筹公司', '超级众筹公司超级众筹公司超级众筹公司', '010-88888888', 'company/2018/05/123.jpg', 1, 0);

-- ----------------------------
-- Table structure for projects_project
-- ----------------------------
DROP TABLE IF EXISTS `projects_project`;
CREATE TABLE `projects_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `interest_nums` int(11) NOT NULL,
  `support_nums` int(11) NOT NULL,
  `target_fund` int(11) NOT NULL,
  `support_fund` int(11) NOT NULL,
  `deadline` int(11) NOT NULL,
  `user_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_detail` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_first` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  `left_days` int(11) NOT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `projects_project_admin_id_978c4bac_fk_users_userprofile_id`(`admin_id`) USING BTREE,
  INDEX `projects_project_category_id_708edb98_fk_projects_`(`category_id`) USING BTREE,
  INDEX `projects_project_company_id_66b5c58b_fk_projects_company_id`(`company_id`) USING BTREE,
  INDEX `projects_project_tags_id_5e7e6b8c_fk_projects_projecttags_id`(`tags_id`) USING BTREE,
  CONSTRAINT `projects_project_admin_id_978c4bac_fk_users_userprofile_id` FOREIGN KEY (`admin_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `projects_project_category_id_708edb98_fk_projects_` FOREIGN KEY (`category_id`) REFERENCES `projects_projectcategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `projects_project_company_id_66b5c58b_fk_projects_company_id` FOREIGN KEY (`company_id`) REFERENCES `projects_company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `projects_project_tags_id_5e7e6b8c_fk_projects_projecttags_id` FOREIGN KEY (`tags_id`) REFERENCES `projects_projecttags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects_project
-- ----------------------------
INSERT INTO `projects_project` VALUES (1, 0, '2018-05-09 16:24:39.417525', '2018-05-12 13:29:50.050170', 'funding', '超级众筹计算机', '超级众筹计算机超级众筹计算机', 111, 224, 200000, 100002, 33, '超级众筹计算机', '超级众筹计算机', '010-88888888', '010-88888888', 'project/2018/05/123_1ZZe242.jpg', 'project/2018/05/climber-workout_muTkZOB.jpg', 1, 1, 1, 1, 0, 31, '2018-06-11');
INSERT INTO `projects_project` VALUES (2, 0, '2018-05-11 13:42:59.095671', '2018-05-12 03:30:15.769198', 'success', '红牛饮料10000瓶', '红牛饮料10000瓶', 222, 113, 100000, 120002, 30, '红牛饮料10000瓶', '红牛饮料10000瓶', '010-88888888', '010-88888888', 'project/2018/05/111111_3ZIwcHT.jpg', 'project/2018/05/222222_kNeaMOv.jpg', 1, 4, 1, 1, 0, 30, '2018-06-10');
INSERT INTO `projects_project` VALUES (3, 0, '2018-05-11 13:46:31.275190', '2018-05-12 02:08:47.154764', 'failed', '百事可乐10000瓶', '百事可乐10000瓶', 333, 222, 100000, 90000, -1, '百事可乐10000瓶', '百事可乐10000瓶', '010-88888888', '010-88888888', 'project/2018/05/222222_HI1GkfC.jpg', 'project/2018/05/111111_we5sFP1.jpg', 1, 4, 1, 1, 0, 0, '2018-05-10');
INSERT INTO `projects_project` VALUES (7, 0, '2018-05-11 17:10:49.415821', '2018-05-12 02:08:47.158402', 'funding', '测试项目', '测试项目测试项目', 1, 1, 1111, 123, 11, '测试项目', '测试项目', '测试项目', '测试项目', 'uploadimage/1526058649111111.jpg', 'uploadimage/1526058649222222.jpg', 1, 1, 1, 1, 0, 11, '2018-05-22');
INSERT INTO `projects_project` VALUES (8, 0, '2018-05-12 01:37:58.801325', '2018-05-12 02:08:47.162761', 'funding', '人见人爱的猫系电脑椅', '人见人爱的猫系电脑椅', 22, 33, 90000, 40000, 30, '人见人爱的猫系电脑椅', '人见人爱的猫系电脑椅', '010-88888888', '010-88888888', 'project/2018/05/a01.jpg', 'project/2018/05/a02.jpg', 1, 2, 1, 1, 0, 30, '2018-06-11');
INSERT INTO `projects_project` VALUES (9, 0, '2018-05-12 01:38:45.520225', '2018-05-12 02:08:47.166766', 'funding', '千万年琥珀邂逅S925银', '千万年琥珀邂逅S925银', 55, 66, 77777, 11111, 33, '千万年琥珀邂逅S925银', '千万年琥珀邂逅S925银', '010-88888888', '010-88888888', 'project/2018/05/b01.jpg', 'project/2018/05/b02.jpg', 1, 2, 1, 1, 0, 33, '2018-06-14');
INSERT INTO `projects_project` VALUES (10, 0, '2018-05-12 01:39:46.493268', '2018-05-12 02:08:47.170768', 'funding', '仿生灭蚊盒 比你更诱蚊', '仿生灭蚊盒 比你更诱蚊', 11, 1, 900, 100, 30, '仿生灭蚊盒 比你更诱蚊', '仿生灭蚊盒 比你更诱蚊', '010-88888888', '010-88888888', 'project/2018/05/c01_CJelOsI.jpg', 'project/2018/05/c02_DakW5zy.gif', 1, 3, 1, 1, 0, 30, '2018-06-11');

-- ----------------------------
-- Table structure for projects_projectcategory
-- ----------------------------
DROP TABLE IF EXISTS `projects_projectcategory`;
CREATE TABLE `projects_projectcategory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects_projectcategory
-- ----------------------------
INSERT INTO `projects_projectcategory` VALUES (1, '科技', '科技改变生活', 0, 1);
INSERT INTO `projects_projectcategory` VALUES (2, '京东', '京东众筹', 0, 2);
INSERT INTO `projects_projectcategory` VALUES (3, '生活', '绳命如此井猜', 0, 1);
INSERT INTO `projects_projectcategory` VALUES (4, '饮料', '叔叔我要喝阔落', 0, 1);

-- ----------------------------
-- Table structure for projects_projectitem
-- ----------------------------
DROP TABLE IF EXISTS `projects_projectitem`;
CREATE TABLE `projects_projectitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `item_category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_value` decimal(10, 2) NOT NULL,
  `item_freight` int(11) NOT NULL,
  `item_send_day` int(11) NOT NULL,
  `how_to_get` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_nums` int(11) NOT NULL,
  `item_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `support_nums` int(11) NOT NULL,
  `up_to_buy` int(11) NOT NULL,
  `invoice` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `projects_projectitem_project_id_ce185d00_fk_projects_project_id`(`project_id`) USING BTREE,
  CONSTRAINT `projects_projectitem_project_id_ce185d00_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects_projectitem
-- ----------------------------
INSERT INTO `projects_projectitem` VALUES (1, 0, '2018-05-09 16:25:06.352974', '2018-05-09 16:25:06.352974', 'real', '测试回报1', 1.00, 0, 10, '测试回报1测试回报1', 0, 'project/2018/05/123_IlI2zqz.jpg', 0, 1, 'Y', 1, 0);
INSERT INTO `projects_projectitem` VALUES (2, 0, '2018-05-09 16:25:22.251510', '2018-05-09 16:25:22.251510', 'real', '测试回报2', 2.00, 0, 10, '测试回报2测试回报2', 111, 'project/2018/05/123_fXinqJX.jpg', 0, 55, 'Y', 1, 0);
INSERT INTO `projects_projectitem` VALUES (3, 0, '2018-05-11 13:43:35.976410', '2018-05-11 13:43:35.976410', 'real', '红牛饮料1瓶', 1.00, 0, 10, '红牛饮料1瓶', 0, 'project/2018/05/111111_gAeozmh.jpg', 5, 10000, 'Y', 2, 0);
INSERT INTO `projects_projectitem` VALUES (4, 0, '2018-05-11 13:43:54.823077', '2018-05-11 13:43:54.823077', 'real', '红牛饮料10瓶', 10.00, 0, 10, '红牛饮料10瓶', 0, 'project/2018/05/111111_uyspIzM.jpg', 0, 444, 'Y', 2, 0);
INSERT INTO `projects_projectitem` VALUES (5, 0, '2018-05-11 13:46:56.664490', '2018-05-11 13:46:56.664490', 'real', '百事可乐10瓶', 100.00, 0, 10, '百事可乐10瓶', 0, 'project/2018/05/333333_FgAKFs4.jpg', 0, 444, 'Y', 3, 0);
INSERT INTO `projects_projectitem` VALUES (6, 0, '2018-05-11 13:47:16.063531', '2018-05-11 13:47:16.063531', 'real', '百事可乐1000瓶', 1000000.00, 0, 10, '百事可乐1000瓶', 0, 'project/2018/05/333333_vOCWAo5.jpg', 0, 444, 'Y', 3, 0);
INSERT INTO `projects_projectitem` VALUES (12, 0, '2018-05-11 17:17:32.182428', '2018-05-11 17:17:32.183426', 'real', '', 123.00, 0, 12, '123', 12, 'uploadimage/1526059052111111.jpg', 0, 0, 'False', 7, 0);
INSERT INTO `projects_projectitem` VALUES (13, 0, '2018-05-11 17:18:27.558023', '2018-05-11 17:18:27.558023', 'real', '', 123.00, 0, 12, '123', 12, 'uploadimage/1526059107111111.jpg', 0, 0, 'False', 7, 0);
INSERT INTO `projects_projectitem` VALUES (14, 0, '2018-05-11 17:19:21.796949', '2018-05-11 17:19:21.796949', 'real', '', 123.00, 0, 12, '123', 12, 'uploadimage/1526059161111111.jpg', 0, 0, 'False', 7, 0);
INSERT INTO `projects_projectitem` VALUES (24, 0, '2018-05-12 02:09:39.149341', '2018-05-12 02:09:39.149341', 'real', '一把椅子', 999.00, 0, 10, '一把椅子', 0, 'project/2018/05/a02_pp3qAC3.jpg', 0, 99, 'Y', 8, 0);
INSERT INTO `projects_projectitem` VALUES (25, 0, '2018-05-12 02:10:04.475798', '2018-05-12 02:10:04.475798', 'real', '两把椅子', 1000.00, 0, 10, '两把椅子', 0, 'project/2018/05/a02_7BvTTdb.jpg', 0, 44, 'Y', 8, 0);
INSERT INTO `projects_projectitem` VALUES (26, 0, '2018-05-12 02:10:30.026775', '2018-05-12 02:10:30.026775', 'real', '三把椅子', 2000.00, 0, 10, '三把椅子', 0, 'project/2018/05/a02_wR2KczA.jpg', 0, 44, 'Y', 8, 0);

-- ----------------------------
-- Table structure for projects_projecttags
-- ----------------------------
DROP TABLE IF EXISTS `projects_projecttags`;
CREATE TABLE `projects_projecttags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_approval` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects_projecttags
-- ----------------------------
INSERT INTO `projects_projecttags` VALUES (1, '电脑', 0);

-- ----------------------------
-- Table structure for users_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `users_useraddress`;
CREATE TABLE `users_useraddress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_useraddress_user_id_d3f6a672_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `users_useraddress_user_id_d3f6a672_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_useraddress
-- ----------------------------
INSERT INTO `users_useraddress` VALUES (1, '我是谁', '13333333333', '北京市', 1, 1);
INSERT INTO `users_useraddress` VALUES (10, '123123', '123', '123', 0, 1);
INSERT INTO `users_useraddress` VALUES (11, '3123123', '123123', '12312', 0, 1);
INSERT INTO `users_useraddress` VALUES (12, '123', '123', '13', 0, 1);
INSERT INTO `users_useraddress` VALUES (13, '123123', '123', '123', 0, 1);

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `account_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_card_num` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$100000$kZC1JYlIlN8r$5X2xw14kR6ypLQqsc0aSMgEur1hFqmKMm+FjUylrQN8=', '2018-05-14 11:06:26.404237', 1, 'admin', '', '', '178728352@qq.com', 1, 1, '2018-05-09 16:20:00.000000', 'company', 'male', '123456', 'image/2018/05/123.jpg', 'admin', 'company', '', '123456', '管理员');
INSERT INTO `users_userprofile` VALUES (3, 'pbkdf2_sha256$100000$hvXYHn2Nd5pp$ir/q5ZXZqx8oUZgfiR+s3sFjc6MdMQivG9WNBfcZk+E=', NULL, 0, '333333', '', '', '178728352@qq.com', 0, 1, '2018-05-11 06:27:56.507858', 'non_choice', 'male', '', 'img/services-box1.jpg', 'member', 'person', '', '', '');
INSERT INTO `users_userprofile` VALUES (4, 'pbkdf2_sha256$100000$M1RcJHxwe0Wv$CKh2t216fSpJQ99Y+mmU+kiP4l5P4mxzXoBHEmjqRKo=', NULL, 0, '222222', '', '', '178728352@qq.com', 0, 1, '2018-05-11 06:30:25.739993', 'non_choice', 'male', '', 'img/services-box1.jpg', 'member', 'person', '', '', '');
INSERT INTO `users_userprofile` VALUES (5, 'pbkdf2_sha256$100000$2ZKtvpYadQYz$EgIbfVHOZ2VFDUmjSUCyDHIiEDMMGhfsEfrLSHSgM7o=', NULL, 0, '444444', '', '', '178728352@qq.com', 0, 1, '2018-05-11 06:31:22.140180', 'non_choice', 'male', '', 'img/services-box1.jpg', 'member', 'person', '', '', '');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-05-09 16:22:59.060547', '127.0.0.1', '1', '超级众筹公司', 'create', '已添加。', 8, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-05-09 16:23:09.716750', '127.0.0.1', '1', '科技 | 科技改变生活', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-05-09 16:23:15.236795', '127.0.0.1', '1', '电脑', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-05-09 16:24:39.435035', '127.0.0.1', '1', '超级众筹计算机', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-05-09 16:25:06.358982', '127.0.0.1', '1', '测试回报1', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-05-09 16:25:22.257514', '127.0.0.1', '2', '测试回报2', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-05-09 16:25:36.436778', '127.0.0.1', '1', 'test1，当前次序100', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-05-09 16:25:45.886440', '127.0.0.1', '2', 'test2，当前次序100', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-05-09 16:25:55.281904', '127.0.0.1', '3', 'test3，当前次序100', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-05-09 16:28:32.933101', '127.0.0.1', '1', '超级众筹公司', 'change', '修改 image', 8, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-05-09 17:00:29.566635', '127.0.0.1', '1', 'admin', 'change', '修改 last_login，mobile，image 和 account_group', 6, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-05-09 17:13:21.686908', '127.0.0.1', '1', '用户：admin， 项目：超级众筹计算机， 订单编号：123123123123', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-05-09 17:13:28.652180', '127.0.0.1', '2', '用户：admin， 项目：超级众筹计算机， 订单编号：123123123123', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-05-10 03:43:58.254910', '127.0.0.1', '1', '轮播图1 | 超级众筹计算机 | 1', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-05-10 03:44:41.808657', '127.0.0.1', '2', '轮播图2 | 超级众筹计算机 | 1', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-05-10 03:44:49.049096', '127.0.0.1', '3', '轮播图3 | 超级众筹计算机 | 1', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-05-11 13:42:59.100672', '127.0.0.1', '2', '红牛饮料10000瓶', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-05-11 13:43:35.984415', '127.0.0.1', '3', '红牛饮料1瓶', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-05-11 13:43:54.828081', '127.0.0.1', '4', '红牛饮料10瓶', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-05-11 13:44:11.009557', '127.0.0.1', '2', 'test2，当前次序100', 'change', '修改 banner_project 和 image', 15, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-05-11 13:44:25.185856', '127.0.0.1', '2', '轮播图2 | 红牛饮料10000瓶 | 2', 'change', '修改 project，weight 和 image', 14, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-05-11 13:46:31.284245', '127.0.0.1', '3', '百事可乐10000瓶', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-05-11 13:46:56.668493', '127.0.0.1', '5', '百事可乐10瓶', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-05-11 13:47:16.069535', '127.0.0.1', '6', '百事可乐1000瓶', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-05-11 13:47:28.283008', '127.0.0.1', '1', 'test1，当前次序100', 'change', '修改 banner_project 和 image', 15, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-05-11 13:47:38.421778', '127.0.0.1', '1', '轮播图1 | 百事可乐10000瓶 | 1', 'change', '修改 project 和 image', 14, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-05-11 13:50:00.780662', '127.0.0.1', '3', '百事可乐10000瓶', 'change', '修改 support_fund，image_first 和 image_detail', 9, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-05-11 16:26:43.245308', '127.0.0.1', '1', '超级众筹计算机', 'change', '修改 interest_nums，image_first 和 image_detail', 9, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-05-11 16:27:21.168256', '127.0.0.1', '2', '红牛饮料10000瓶', 'change', '修改 interest_nums，support_nums，image_first 和 image_detail', 9, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-05-12 01:37:19.316528', '127.0.0.1', '2', '名称：京东 | 简介：京东众筹 | 权重：2', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-05-12 01:37:58.810331', '127.0.0.1', '8', '人见人爱的猫系电脑椅', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (32, '2018-05-12 01:38:45.599039', '127.0.0.1', '9', '千万年琥珀邂逅S925银', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (33, '2018-05-12 01:39:17.406978', '127.0.0.1', '3', '名称：生活 | 简介：绳命如此井猜 | 权重：1', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (34, '2018-05-12 01:39:46.514281', '127.0.0.1', '10', '仿生灭蚊盒 比你更诱蚊', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (35, '2018-05-12 01:46:20.619332', '127.0.0.1', '4', '名称：饮料 | 简介：叔叔我要喝阔落 | 权重：1', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (36, '2018-05-12 01:46:32.112747', '127.0.0.1', '2', '红牛饮料10000瓶', 'change', '修改 category，image_first 和 image_detail', 9, 1);
INSERT INTO `xadmin_log` VALUES (37, '2018-05-12 01:50:09.338097', '127.0.0.1', '3', '百事可乐10000瓶', 'change', '修改 category，image_first 和 image_detail', 9, 1);
INSERT INTO `xadmin_log` VALUES (38, '2018-05-12 02:08:36.137545', '127.0.0.1', '10', '仿生灭蚊盒 比你更诱蚊', 'change', '修改 deadline，image_first 和 image_detail', 9, 1);
INSERT INTO `xadmin_log` VALUES (39, '2018-05-12 02:09:39.159339', '127.0.0.1', '24', '一把椅子', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (40, '2018-05-12 02:10:04.480801', '127.0.0.1', '25', '两把椅子', 'create', '已添加。', 11, 1);
INSERT INTO `xadmin_log` VALUES (41, '2018-05-12 02:10:30.032778', '127.0.0.1', '26', '三把椅子', 'create', '已添加。', 11, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

