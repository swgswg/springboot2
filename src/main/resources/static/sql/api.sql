/*
 Navicat Premium Data Transfer

 Source Server         : Window_MySQL
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : api

 Target Server Type    : MySQL
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 27/02/2021 21:19:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '后台管理员',
  `admin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `last_login_ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` timestamp(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(1开启/2关闭)',
  `create_admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建该后台人员的管理员id',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '127.0.0.1', '2021-02-26 12:31:16', '123456@abc.com', '12345678910', 1, 0, '2021-02-07 15:44:15', '2021-02-26 12:31:16');
INSERT INTO `admin` VALUES (2, '123456', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 00:01:32', '2021-02-26 00:01:32');
INSERT INTO `admin` VALUES (4, '1234567', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 14:01:47', '2021-02-26 14:01:47');
INSERT INTO `admin` VALUES (5, '12345678', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 14:01:51', '2021-02-26 14:01:51');
INSERT INTO `admin` VALUES (6, '123456789', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 14:01:55', '2021-02-26 14:01:55');
INSERT INTO `admin` VALUES (7, '1234567890', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 14:01:59', '2021-02-26 14:01:59');
INSERT INTO `admin` VALUES (8, '1234567891', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 14:02:03', '2021-02-26 14:02:03');
INSERT INTO `admin` VALUES (9, '1234567892', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 14:02:07', '2021-02-26 14:02:07');
INSERT INTO `admin` VALUES (10, '1234567893', 'E10ADC3949BA59ABBE56E057F20F883E', '', NULL, '123456@abc.com', '13912345678', 1, 1, '2021-02-26 14:07:57', '2021-02-26 14:07:57');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员权限表',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色id',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 1, 1, '2021-02-07 20:46:04');

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'api接口表',
  `api_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口名称',
  `url` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口地址',
  `url_crc32` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口地址crc32值',
  `num` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口编号',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口logo',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1开启/2关闭',
  `fee_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '收费模式 1查得/2查询',
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口对外价格(单位厘)',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口描述',
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口文档地址',
  `return_example` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '返回示例',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_url_crc32`(`url_crc32`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO `api` VALUES (1, 'IP地址查询', '/api/v1/ip', 3144589357, 'API00001', '', 1, 1, 0, 'IP地址查询', '', '', '', '2021-02-08 10:16:42', '2021-02-08 10:16:42');

-- ----------------------------
-- Table structure for api_param
-- ----------------------------
DROP TABLE IF EXISTS `api_param`;
CREATE TABLE `api_param`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '接口参数表',
  `api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联接口id',
  `param_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `param_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '参数类型 1请求/2返回',
  `is_must` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否必填 1是/2否',
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数描述',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_api_id`(`api_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of api_param
-- ----------------------------
INSERT INTO `api_param` VALUES (1, 1, 'ip', 1, 1, 'ip地址', '2021-02-08 12:48:03', '2021-02-08 12:48:06');

-- ----------------------------
-- Table structure for api_request_log_202102
-- ----------------------------
DROP TABLE IF EXISTS `api_request_log_202102`;
CREATE TABLE `api_request_log_202102`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '接口请求日志',
  `unique_number` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求唯一编号',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求者的ip',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口id',
  `token` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求秘钥',
  `number` int(11) NOT NULL DEFAULT -1 COMMENT '请求接口之前的可调用次数(-1不限制次数)',
  `money` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求接口之前的用户金额(单位厘)',
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户订阅接口价格(单位厘)',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求微妙时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_unique_number`(`unique_number`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_api_id`(`api_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of api_request_log_202102
-- ----------------------------
INSERT INTO `api_request_log_202102` VALUES (3, 217251038523039744, '117.67.219.232', 1, 1, '613801a4b030ede7450c736a59afb738f6edd03c33ec3ca07953a3c3d3b50f6c', 7, 0, 0, 1612756683911);
INSERT INTO `api_request_log_202102` VALUES (4, 217289176561758209, '117.67.219.232', 1, 1, '613801a4b030ede7450c736a59afb738f6edd03c33ec3ca07953a3c3d3b50f6c', 6, 0, 0, 1612765776727);
INSERT INTO `api_request_log_202102` VALUES (5, 217294519215861760, '117.67.219.232', 1, 1, '613801a4b030ede7450c736a59afb738f6edd03c33ec3ca07953a3c3d3b50f6c', 5, 0, 0, 1612767050516);
INSERT INTO `api_request_log_202102` VALUES (6, 217295555322195968, '117.67.219.232', 1, 1, '613801a4b030ede7450c736a59afb738f6edd03c33ec3ca07953a3c3d3b50f6c', 4, 0, 0, 1612767297543);

-- ----------------------------
-- Table structure for api_response_log_202102
-- ----------------------------
DROP TABLE IF EXISTS `api_response_log_202102`;
CREATE TABLE `api_response_log_202102`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '接口返回日志',
  `unique_number` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求唯一编号',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口id',
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户订阅接口价格(单位厘)',
  `create_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '响应毫秒时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_unique_number`(`unique_number`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_api_id`(`api_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of api_response_log_202102
-- ----------------------------
INSERT INTO `api_response_log_202102` VALUES (2, 217251038523039744, 1, 1, 0, 1612756683994);
INSERT INTO `api_response_log_202102` VALUES (3, 217289176561758209, 1, 1, 0, 1612765776808);
INSERT INTO `api_response_log_202102` VALUES (4, 217294519215861760, 1, 1, 0, 1612767050602);
INSERT INTO `api_response_log_202102` VALUES (5, 217295555322195968, 1, 1, 0, 1612767297585);

-- ----------------------------
-- Table structure for basic_users_online
-- ----------------------------
DROP TABLE IF EXISTS `basic_users_online`;
CREATE TABLE `basic_users_online`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '登录用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `user_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户IP',
  `user_session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户sessionID',
  `user_login_time` timestamp(0) NULL DEFAULT NULL COMMENT '用户登录时间',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态',
  `return_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录返回信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of basic_users_online
-- ----------------------------

-- ----------------------------
-- Table structure for call_supplier_api_log_202102
-- ----------------------------
DROP TABLE IF EXISTS `call_supplier_api_log_202102`;
CREATE TABLE `call_supplier_api_log_202102`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '调用供应商接口日志',
  `unique_number` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求唯一编号',
  `api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口id',
  `supplier_api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商接口id',
  `status_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '响应结果状态码',
  `start_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '调用开始毫秒时间戳	',
  `end_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '调用结束毫秒时间戳	',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_unique_number`(`unique_number`) USING BTREE,
  INDEX `idx_api_id`(`api_id`) USING BTREE,
  INDEX `idx_supplier_api_id`(`supplier_api_id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of call_supplier_api_log_202102
-- ----------------------------
INSERT INTO `call_supplier_api_log_202102` VALUES (4, 217251038523039744, 1, 2, '0', 1612756683916, 1612756683989);
INSERT INTO `call_supplier_api_log_202102` VALUES (5, 217289176561758209, 1, 2, '0', 1612765776735, 1612765776802);
INSERT INTO `call_supplier_api_log_202102` VALUES (6, 217294519215861760, 1, 2, '0', 1612767050521, 1612767050596);
INSERT INTO `call_supplier_api_log_202102` VALUES (7, 217295555322195968, 1, 1, '10000', 1612767297546, 1612767297578);

-- ----------------------------
-- Table structure for call_supplier_api_param_202102
-- ----------------------------
DROP TABLE IF EXISTS `call_supplier_api_param_202102`;
CREATE TABLE `call_supplier_api_param_202102`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '调用供应商接口参数',
  `unique_number` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '请求唯一编号',
  `supplier_api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '供应商接口id',
  `request_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `response_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '响应结果',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unique_number`(`unique_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of call_supplier_api_param_202102
-- ----------------------------

-- ----------------------------
-- Table structure for ip_white
-- ----------------------------
DROP TABLE IF EXISTS `ip_white`;
CREATE TABLE `ip_white`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ip白名单表',
  `ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ip',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ip_white
-- ----------------------------
INSERT INTO `ip_white` VALUES (1, '60.168.69.22', '', '2021-02-08 11:27:40');
INSERT INTO `ip_white` VALUES (2, '117.67.219.232', '', '2021-02-08 11:39:31');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单地址',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '菜单类型(1目录/2菜单/2按钮)',
  `auth` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权权限',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单icon',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '系统管理', '', 1, '', 'system', 0, '2021-02-07 21:10:57', '2021-02-07 21:11:00');
INSERT INTO `menu` VALUES (2, 1, '管理员', 'sys/user', 2, '', 'admin', 0, '2021-02-07 21:15:14', '2021-02-07 21:15:17');
INSERT INTO `menu` VALUES (3, 2, '管理员添加', '', 3, 'user-add', '', 0, '2021-02-07 21:24:47', '2021-02-07 21:24:49');
INSERT INTO `menu` VALUES (4, 2, '管理员列表', 'sys/user', 3, 'user-list', '', 0, '2021-02-07 21:37:12', '2021-02-07 21:37:14');
INSERT INTO `menu` VALUES (5, 2, '管理员修改', '', 3, 'user-edit', '', 0, '2021-02-07 21:45:20', '2021-02-07 21:45:23');
INSERT INTO `menu` VALUES (6, 2, '管理员删除', '', 3, 'user-del', '', 0, '2021-02-07 21:42:27', '2021-02-07 21:42:29');
INSERT INTO `menu` VALUES (7, 1, '角色', 'sys/role', 2, '', 'role', 0, '2021-02-07 21:49:09', '2021-02-07 21:49:11');
INSERT INTO `menu` VALUES (9, 7, '角色列表', '', 3, 'role-list', '', 0, '2021-02-07 21:52:52', '2021-02-07 21:52:54');
INSERT INTO `menu` VALUES (10, 7, '角色添加', '', 3, 'role-add', '', 0, '2021-02-07 21:53:59', '2021-02-07 21:54:02');
INSERT INTO `menu` VALUES (11, 7, '角色修改', '', 3, 'role-edit', '', 0, '2021-02-07 21:54:28', '2021-02-07 21:54:31');
INSERT INTO `menu` VALUES (12, 7, '角色删除', '', 3, 'role-del', '', 0, '2021-02-07 21:55:27', '2021-02-07 21:55:29');
INSERT INTO `menu` VALUES (13, 1, '菜单', 'sys/menu', 2, '', 'menu', 0, '2021-02-07 21:58:10', '2021-02-07 21:58:13');
INSERT INTO `menu` VALUES (14, 13, '菜单列表', '', 3, 'menu-list', '', 0, '2021-02-07 21:59:20', '2021-02-07 21:59:24');
INSERT INTO `menu` VALUES (15, 13, '菜单添加', '', 3, 'menu-add', '', 0, '2021-02-07 21:59:44', '2021-02-07 21:59:48');
INSERT INTO `menu` VALUES (16, 13, '菜单修改', '', 3, 'menu-edit', '', 0, '2021-02-07 22:00:09', '2021-02-07 22:00:11');
INSERT INTO `menu` VALUES (17, 13, '菜单删除', '', 3, 'menu-del', '', 0, '2021-02-07 22:01:06', '2021-02-07 22:01:08');
INSERT INTO `menu` VALUES (18, 1, '系统配置', 'sys/config', 2, '', 'config', 0, '2021-02-07 22:05:56', '2021-02-07 22:05:56');
INSERT INTO `menu` VALUES (19, 18, '配置列表', '', 3, 'config-list', '', 0, '2021-02-07 22:06:44', '2021-02-07 22:06:44');
INSERT INTO `menu` VALUES (20, 18, '配置添加', '', 3, 'config-add', '', 0, '2021-02-07 22:07:18', '2021-02-07 22:07:18');
INSERT INTO `menu` VALUES (21, 18, '配置修改', '', 3, 'config-edit', '', 0, '2021-02-07 22:07:40', '2021-02-07 22:07:40');
INSERT INTO `menu` VALUES (22, 18, '配置删除', '', 3, 'config-del', '', 0, '2021-02-07 22:07:58', '2021-02-07 22:07:58');
INSERT INTO `menu` VALUES (23, 1, '操作日志', 'sys/log', 2, '', 'log', 0, '2021-02-07 22:10:28', '2021-02-07 22:10:28');
INSERT INTO `menu` VALUES (24, 23, '日志列表', '', 3, 'log-list', '', 0, '2021-02-07 22:11:00', '2021-02-07 22:11:00');
INSERT INTO `menu` VALUES (25, 0, '用户管理', '', 1, '', 'usermanage', 1, '2021-02-08 09:23:47', '2021-02-08 10:58:47');
INSERT INTO `menu` VALUES (26, 25, '用户', 'user/user', 2, '', 'user', 0, '2021-02-08 09:24:49', '2021-02-08 09:24:49');
INSERT INTO `menu` VALUES (27, 26, '用户列表', '', 3, 'users-list', '', 0, '2021-02-08 09:25:26', '2021-02-08 09:25:26');
INSERT INTO `menu` VALUES (28, 26, '用户添加', '', 3, 'users-add', '', 0, '2021-02-08 09:25:53', '2021-02-08 09:25:53');
INSERT INTO `menu` VALUES (29, 26, '用户修改', '', 3, 'user-edit', '', 0, '2021-02-08 09:26:19', '2021-02-08 09:26:19');
INSERT INTO `menu` VALUES (30, 25, 'IP管理', 'user/ip', 2, '', 'dangdifill', 1, '2021-02-08 09:29:47', '2021-02-08 11:21:36');
INSERT INTO `menu` VALUES (31, 30, 'IP列表', '', 3, 'ip-list', '', 0, '2021-02-08 09:30:17', '2021-02-08 09:30:17');
INSERT INTO `menu` VALUES (32, 30, 'IP添加', '', 3, 'ip-add', '', 0, '2021-02-08 09:30:42', '2021-02-08 09:30:42');
INSERT INTO `menu` VALUES (33, 30, 'IP限流解除', '', 3, 'ip-limit', '', 0, '2021-02-08 09:31:04', '2021-02-08 09:31:04');
INSERT INTO `menu` VALUES (34, 30, 'IP删除', '', 3, 'ip-del', '', 0, '2021-02-08 09:31:37', '2021-02-08 09:31:37');
INSERT INTO `menu` VALUES (35, 25, '用户接口', 'user/user-api', 2, '', 'userapi', 1, '2021-02-08 09:32:30', '2021-02-08 11:21:18');
INSERT INTO `menu` VALUES (36, 35, '用户接口列表', '', 3, 'userapi-list', '', 0, '2021-02-08 09:32:56', '2021-02-08 09:32:56');
INSERT INTO `menu` VALUES (37, 35, '用户接口添加', '', 3, 'userapi-add', '', 0, '2021-02-08 09:33:46', '2021-02-08 09:33:46');
INSERT INTO `menu` VALUES (38, 35, '用户接口修改', '', 3, 'userapi-edit', '', 0, '2021-02-08 09:34:15', '2021-02-08 09:34:15');
INSERT INTO `menu` VALUES (39, 35, '用户接口删除', '', 3, 'userapi-del', '', 0, '2021-02-08 09:34:37', '2021-02-08 09:34:37');
INSERT INTO `menu` VALUES (40, 0, '接口管理', '', 1, '', 'mudedi', 2, '2021-02-08 09:38:35', '2021-02-08 10:59:07');
INSERT INTO `menu` VALUES (41, 40, '接口', 'api/api', 2, '', 'zhedie', 0, '2021-02-08 09:41:28', '2021-02-08 09:41:28');
INSERT INTO `menu` VALUES (42, 41, '接口列表', '', 3, 'api-list', '', 0, '2021-02-08 09:42:07', '2021-02-08 09:42:07');
INSERT INTO `menu` VALUES (43, 41, '接口增加', '', 3, 'api-add', '', 0, '2021-02-08 09:42:28', '2021-02-08 09:42:28');
INSERT INTO `menu` VALUES (44, 41, '接口修改', '', 3, 'api-edit', '', 0, '2021-02-08 09:42:59', '2021-02-08 09:42:59');
INSERT INTO `menu` VALUES (45, 41, '接口开启', '', 3, 'api-open', '', 0, '2021-02-08 09:43:54', '2021-02-08 09:43:54');
INSERT INTO `menu` VALUES (46, 41, '接口关闭', '', 3, 'api-close', '', 0, '2021-02-08 09:44:12', '2021-02-08 09:44:12');
INSERT INTO `menu` VALUES (47, 40, '接口供应商', 'api/supplier', 2, '', 'geren', 1, '2021-02-08 09:48:08', '2021-02-08 11:19:47');
INSERT INTO `menu` VALUES (48, 47, '接口供应商列表', '', 3, 'supplier-list', '', 0, '2021-02-08 09:48:34', '2021-02-08 09:48:34');
INSERT INTO `menu` VALUES (49, 47, '接口供应商增加', '', 3, 'supplier-add', '', 0, '2021-02-08 09:49:02', '2021-02-08 09:49:02');
INSERT INTO `menu` VALUES (50, 47, '接口供应商修改', '', 3, 'supplier-edit', '', 0, '2021-02-08 09:49:34', '2021-02-08 09:49:34');
INSERT INTO `menu` VALUES (51, 47, '接口供应商删除', '', 3, 'supplier-del', '', 0, '2021-02-08 09:50:41', '2021-02-08 09:50:41');
INSERT INTO `menu` VALUES (52, 40, '接口状态码', 'api/code', 2, '', 'pinglun', 2, '2021-02-08 09:52:10', '2021-02-08 11:20:27');
INSERT INTO `menu` VALUES (53, 52, '接口状态码列表', '', 3, 'code-list', '', 0, '2021-02-08 10:06:49', '2021-02-08 10:06:49');
INSERT INTO `menu` VALUES (54, 52, '接口状态码添加', '', 3, 'code-add', '', 0, '2021-02-08 10:07:31', '2021-02-08 10:07:31');
INSERT INTO `menu` VALUES (55, 52, '接口状态码修改', '', 3, 'code-edit', '', 0, '2021-02-08 10:07:49', '2021-02-08 10:07:49');
INSERT INTO `menu` VALUES (56, 52, '接口状态码删除', '', 3, 'code-del', '', 0, '2021-02-08 10:08:09', '2021-02-08 10:08:09');
INSERT INTO `menu` VALUES (57, 40, '供应商接口', 'api/supplier_api', 2, '', 'userapi', 3, '2021-02-08 10:12:17', '2021-02-08 11:20:39');
INSERT INTO `menu` VALUES (58, 57, '供应商接口列表', '0', 3, 'supplierapi-list', '', 0, '2021-02-08 10:12:50', '2021-02-08 10:12:50');
INSERT INTO `menu` VALUES (59, 57, '供应商接口增加', '0', 3, 'supplierapi-add', '', 0, '2021-02-08 10:13:25', '2021-02-08 10:13:25');
INSERT INTO `menu` VALUES (60, 57, '供应商接口开启', '0', 3, 'supplierapi-open', '', 0, '2021-02-08 10:13:49', '2021-02-08 10:13:49');
INSERT INTO `menu` VALUES (61, 57, '供应商接口关闭', '0', 3, 'supplierapi-close', '', 0, '2021-02-08 10:14:17', '2021-02-08 10:14:17');
INSERT INTO `menu` VALUES (62, 57, '供应商接口修改', '0', 3, 'supplierapi-edit', '', 0, '2021-02-08 10:14:44', '2021-02-08 10:14:44');
INSERT INTO `menu` VALUES (63, 0, '调用记录', '', 1, '', 'tubiao', 3, '2021-02-08 10:50:13', '2021-02-08 10:59:15');
INSERT INTO `menu` VALUES (64, 63, '每日统计', 'record/day_count', 2, '', 'day', 4, '2021-02-08 10:51:32', '2021-02-08 12:38:22');
INSERT INTO `menu` VALUES (65, 64, '每日统计列表', '', 3, 'day-list', '', 0, '2021-02-08 10:52:05', '2021-02-08 10:52:05');
INSERT INTO `menu` VALUES (66, 63, '请求记录', 'record/request', 2, '0', 'request', 0, '2021-02-08 10:54:09', '2021-02-08 10:54:09');
INSERT INTO `menu` VALUES (67, 66, '请求记录列表', '', 3, 'request-list', '', 0, '2021-02-08 10:54:44', '2021-02-08 10:54:44');
INSERT INTO `menu` VALUES (68, 63, '调用三方记录', 'record/third', 2, '0', 'third', 1, '2021-02-08 10:56:05', '2021-02-08 11:55:41');
INSERT INTO `menu` VALUES (69, 68, '调用三方记录列表', '', 3, 'third-list', '', 0, '2021-02-08 10:56:38', '2021-02-08 10:56:38');
INSERT INTO `menu` VALUES (70, 63, '响应记录', 'record/response', 2, '0', 'response', 1, '2021-02-08 10:57:07', '2021-02-08 11:56:26');
INSERT INTO `menu` VALUES (71, 70, '响应记录列表', '', 3, 'response-list', '0', 0, '2021-02-08 10:57:30', '2021-02-08 10:57:30');
INSERT INTO `menu` VALUES (72, 40, '接口参数', 'api/param', 2, '', 'tixing', 1, '2021-02-08 12:40:39', '2021-02-08 12:42:54');
INSERT INTO `menu` VALUES (73, 72, '接口参数列表', '', 3, 'param-list', '', 0, '2021-02-08 12:41:11', '2021-02-08 12:41:11');
INSERT INTO `menu` VALUES (74, 72, '接口参数添加', '', 3, 'param-add', '', 0, '2021-02-08 12:41:31', '2021-02-08 12:41:31');
INSERT INTO `menu` VALUES (75, 72, '接口参数修改', '', 3, 'param-edit', '', 0, '2021-02-08 12:41:54', '2021-02-08 12:41:54');
INSERT INTO `menu` VALUES (76, 72, '接口参数删除', '', 3, 'param-del', '', 0, '2021-02-08 12:42:17', '2021-02-08 12:42:17');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (18, '2019_12_20_112555_create_user_table', 1);
INSERT INTO `migrations` VALUES (19, '2019_12_20_112642_create_user_api_table', 1);
INSERT INTO `migrations` VALUES (20, '2019_12_20_112656_create_api_table', 1);
INSERT INTO `migrations` VALUES (21, '2019_12_20_112714_create_api_param_table', 1);
INSERT INTO `migrations` VALUES (22, '2019_12_20_112738_create_supplier_table', 1);
INSERT INTO `migrations` VALUES (23, '2019_12_20_112801_create_status_code_table', 1);
INSERT INTO `migrations` VALUES (24, '2019_12_20_112835_create_api_request_log_table', 1);
INSERT INTO `migrations` VALUES (25, '2019_12_20_112934_create_call_supplier_api_log_table', 1);
INSERT INTO `migrations` VALUES (26, '2019_12_20_113006_create_api_response_log_table', 1);
INSERT INTO `migrations` VALUES (27, '2019_12_23_105757_create_ip_white_table', 1);
INSERT INTO `migrations` VALUES (28, '2019_12_23_145338_create_user_api_count_with_day_table', 1);
INSERT INTO `migrations` VALUES (29, '2020_01_09_143542_create_system_config_table', 1);
INSERT INTO `migrations` VALUES (30, '2020_01_09_144429_create_admin_table', 1);
INSERT INTO `migrations` VALUES (31, '2020_01_09_144458_create_operation_log_table', 1);
INSERT INTO `migrations` VALUES (32, '2020_01_09_144514_create_role_table', 1);
INSERT INTO `migrations` VALUES (33, '2020_01_09_144524_create_menu_table', 1);
INSERT INTO `migrations` VALUES (34, '2020_01_09_144551_create_admin_role_table', 1);
INSERT INTO `migrations` VALUES (35, '2020_01_09_144613_create_role_menu_table', 1);
INSERT INTO `migrations` VALUES (36, '2020_04_17_103959_create_call_supplier_api_param_table', 1);
INSERT INTO `migrations` VALUES (37, '2020_04_28_091301_create_supplier_api_table', 1);

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '后台操作日志',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `admin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
  `operation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作方法',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作参数',
  `time` decimal(8, 2) UNSIGNED NOT NULL COMMENT '执行时长(毫秒)',
  `ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作员IP',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 871 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
INSERT INTO `operation_log` VALUES (1, 1, 'admin', '/admin/v1/menu/nav', '[]', 4.59, '36.57.187.119', '2021-02-07 15:45:58');
INSERT INTO `operation_log` VALUES (2, 1, 'admin', '/admin/v1/info', '{\"t\":1612683959091}', 0.71, '36.57.187.119', '2021-02-07 15:45:58');
INSERT INTO `operation_log` VALUES (3, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.85, '60.173.242.244', '2021-02-07 15:47:03');
INSERT INTO `operation_log` VALUES (4, 1, 'admin', '/admin/v1/info', '{\"t\":1612684023550}', 0.56, '60.173.242.244', '2021-02-07 15:47:03');
INSERT INTO `operation_log` VALUES (5, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.11, '117.136.100.243', '2021-02-07 15:54:03');
INSERT INTO `operation_log` VALUES (6, 1, 'admin', '/admin/v1/info', '{\"t\":1612684443913}', 0.80, '117.136.100.243', '2021-02-07 15:54:04');
INSERT INTO `operation_log` VALUES (7, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.32, '60.173.242.244', '2021-02-07 15:58:27');
INSERT INTO `operation_log` VALUES (8, 1, 'admin', '/admin/v1/info', '{\"t\":1612684710150}', 0.54, '60.173.242.244', '2021-02-07 15:58:27');
INSERT INTO `operation_log` VALUES (9, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.75, '60.173.242.244', '2021-02-07 15:59:30');
INSERT INTO `operation_log` VALUES (10, 1, 'admin', '/admin/v1/info', '{\"t\":1612684773203}', 0.55, '60.173.242.244', '2021-02-07 15:59:30');
INSERT INTO `operation_log` VALUES (11, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.15, '36.57.187.119', '2021-02-07 21:03:06');
INSERT INTO `operation_log` VALUES (12, 1, 'admin', '/admin/v1/info', '{\"t\":1612702986916}', 0.72, '36.57.187.119', '2021-02-07 21:03:06');
INSERT INTO `operation_log` VALUES (13, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.01, '36.57.187.119', '2021-02-07 21:11:25');
INSERT INTO `operation_log` VALUES (14, 1, 'admin', '/admin/v1/info', '{\"t\":1612703486126}', 0.58, '36.57.187.119', '2021-02-07 21:11:25');
INSERT INTO `operation_log` VALUES (15, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.79, '36.57.187.119', '2021-02-07 21:11:57');
INSERT INTO `operation_log` VALUES (16, 1, 'admin', '/admin/v1/info', '{\"t\":1612703518420}', 0.59, '36.57.187.119', '2021-02-07 21:11:57');
INSERT INTO `operation_log` VALUES (17, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.90, '36.57.187.119', '2021-02-07 21:13:38');
INSERT INTO `operation_log` VALUES (18, 1, 'admin', '/admin/v1/info', '{\"t\":1612703619264}', 0.59, '36.57.187.119', '2021-02-07 21:13:38');
INSERT INTO `operation_log` VALUES (19, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.50, '36.57.187.119', '2021-02-07 21:15:22');
INSERT INTO `operation_log` VALUES (20, 1, 'admin', '/admin/v1/info', '{\"t\":1612703723219}', 0.55, '36.57.187.119', '2021-02-07 21:15:22');
INSERT INTO `operation_log` VALUES (21, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.84, '36.57.187.119', '2021-02-07 21:15:42');
INSERT INTO `operation_log` VALUES (22, 1, 'admin', '/admin/v1/info', '{\"t\":1612703743060}', 0.68, '36.57.187.119', '2021-02-07 21:15:42');
INSERT INTO `operation_log` VALUES (23, 1, 'admin', '/admin/v1/index', '{\"t\":1612703744740,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 75.39, '36.57.187.119', '2021-02-07 21:15:44');
INSERT INTO `operation_log` VALUES (24, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.23, '36.57.187.119', '2021-02-07 21:25:00');
INSERT INTO `operation_log` VALUES (25, 1, 'admin', '/admin/v1/info', '{\"t\":1612704300786}', 0.52, '36.57.187.119', '2021-02-07 21:25:00');
INSERT INTO `operation_log` VALUES (26, 1, 'admin', '/admin/v1/index', '{\"t\":1612704300905,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 57.65, '36.57.187.119', '2021-02-07 21:25:00');
INSERT INTO `operation_log` VALUES (27, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.30, '36.57.187.119', '2021-02-07 21:27:46');
INSERT INTO `operation_log` VALUES (28, 1, 'admin', '/admin/v1/info', '{\"t\":1612704467306}', 0.49, '36.57.187.119', '2021-02-07 21:27:46');
INSERT INTO `operation_log` VALUES (29, 1, 'admin', '/admin/v1/index', '{\"t\":1612704467462,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.76, '36.57.187.119', '2021-02-07 21:27:47');
INSERT INTO `operation_log` VALUES (30, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.87, '36.57.187.119', '2021-02-07 21:36:17');
INSERT INTO `operation_log` VALUES (31, 1, 'admin', '/admin/v1/info', '{\"t\":1612704978216}', 0.54, '36.57.187.119', '2021-02-07 21:36:17');
INSERT INTO `operation_log` VALUES (32, 1, 'admin', '/admin/v1/index', '{\"t\":1612704978335,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 57.32, '36.57.187.119', '2021-02-07 21:36:17');
INSERT INTO `operation_log` VALUES (33, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.41, '36.57.187.119', '2021-02-07 21:37:22');
INSERT INTO `operation_log` VALUES (34, 1, 'admin', '/admin/v1/info', '{\"t\":1612705042886}', 0.60, '36.57.187.119', '2021-02-07 21:37:22');
INSERT INTO `operation_log` VALUES (35, 1, 'admin', '/admin/v1/index', '{\"t\":1612705042994,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.91, '36.57.187.119', '2021-02-07 21:37:22');
INSERT INTO `operation_log` VALUES (36, 1, 'admin', '/admin/v1/menu/nav', '[]', 19.28, '60.168.69.22', '2021-02-07 21:39:08');
INSERT INTO `operation_log` VALUES (37, 1, 'admin', '/admin/v1/info', '{\"t\":1612705149139}', 0.66, '60.168.69.22', '2021-02-07 21:39:08');
INSERT INTO `operation_log` VALUES (38, 1, 'admin', '/admin/v1/index', '{\"t\":1612705149254,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 79.64, '60.168.69.22', '2021-02-07 21:39:08');
INSERT INTO `operation_log` VALUES (39, 1, 'admin', '/admin/v1/role/list', '{\"t\":1612705152179}', 0.65, '60.168.69.22', '2021-02-07 21:39:11');
INSERT INTO `operation_log` VALUES (40, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.77, '60.168.69.22', '2021-02-07 21:44:00');
INSERT INTO `operation_log` VALUES (41, 1, 'admin', '/admin/v1/info', '{\"t\":1612705441124}', 0.59, '60.168.69.22', '2021-02-07 21:44:00');
INSERT INTO `operation_log` VALUES (42, 1, 'admin', '/admin/v1/index', '{\"t\":1612705441244,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.87, '60.168.69.22', '2021-02-07 21:44:00');
INSERT INTO `operation_log` VALUES (43, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.83, '60.168.69.22', '2021-02-07 21:46:56');
INSERT INTO `operation_log` VALUES (44, 1, 'admin', '/admin/v1/info', '{\"t\":1612705620069}', 0.53, '60.168.69.22', '2021-02-07 21:46:59');
INSERT INTO `operation_log` VALUES (45, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.97, '60.168.69.22', '2021-02-07 21:47:19');
INSERT INTO `operation_log` VALUES (46, 1, 'admin', '/admin/v1/info', '{\"t\":1612705641448}', 0.53, '60.168.69.22', '2021-02-07 21:47:20');
INSERT INTO `operation_log` VALUES (47, 1, 'admin', '/admin/v1/index', '{\"t\":1612705643332,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.66, '60.168.69.22', '2021-02-07 21:47:22');
INSERT INTO `operation_log` VALUES (48, 1, 'admin', '/admin/v1/close', '{\"t\":1612705646587,\"id\":1}', 3.04, '60.168.69.22', '2021-02-07 21:47:26');
INSERT INTO `operation_log` VALUES (49, 1, 'admin', '/admin/v1/index', '{\"t\":1612705646630,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.70, '60.168.69.22', '2021-02-07 21:47:26');
INSERT INTO `operation_log` VALUES (50, 1, 'admin', '/admin/v1/show', '{\"t\":1612705648967,\"id\":1}', 1.05, '60.168.69.22', '2021-02-07 21:47:28');
INSERT INTO `operation_log` VALUES (51, 1, 'admin', '/admin/v1/role/list', '{\"t\":1612705648967}', 0.56, '60.168.69.22', '2021-02-07 21:47:28');
INSERT INTO `operation_log` VALUES (52, 1, 'admin', '/admin/v1/open', '{\"t\":1612705656706,\"id\":1}', 3.35, '60.168.69.22', '2021-02-07 21:47:36');
INSERT INTO `operation_log` VALUES (53, 1, 'admin', '/admin/v1/index', '{\"t\":1612705656746,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 47.83, '60.168.69.22', '2021-02-07 21:47:36');
INSERT INTO `operation_log` VALUES (54, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.96, '60.168.69.22', '2021-02-07 21:48:31');
INSERT INTO `operation_log` VALUES (55, 1, 'admin', '/admin/v1/info', '{\"t\":1612705712377}', 0.54, '60.168.69.22', '2021-02-07 21:48:31');
INSERT INTO `operation_log` VALUES (56, 1, 'admin', '/admin/v1/index', '{\"t\":1612705712524,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.83, '60.168.69.22', '2021-02-07 21:48:32');
INSERT INTO `operation_log` VALUES (57, 1, 'admin', '/admin/v1/role/list', '{\"t\":1612705715703}', 0.66, '60.168.69.22', '2021-02-07 21:48:35');
INSERT INTO `operation_log` VALUES (58, 1, 'admin', '/admin/v1/menu/nav', '[]', 1.86, '60.168.69.22', '2021-02-07 21:51:42');
INSERT INTO `operation_log` VALUES (59, 1, 'admin', '/admin/v1/info', '{\"t\":1612705902716}', 0.59, '60.168.69.22', '2021-02-07 21:51:42');
INSERT INTO `operation_log` VALUES (60, 1, 'admin', '/admin/v1/index', '{\"t\":1612705902879,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.94, '60.168.69.22', '2021-02-07 21:51:42');
INSERT INTO `operation_log` VALUES (61, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612705904058,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.65, '60.168.69.22', '2021-02-07 21:51:43');
INSERT INTO `operation_log` VALUES (62, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.14, '60.168.69.22', '2021-02-07 21:56:24');
INSERT INTO `operation_log` VALUES (63, 1, 'admin', '/admin/v1/info', '{\"t\":1612706185262}', 0.57, '60.168.69.22', '2021-02-07 21:56:24');
INSERT INTO `operation_log` VALUES (64, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706185414,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 57.12, '60.168.69.22', '2021-02-07 21:56:24');
INSERT INTO `operation_log` VALUES (65, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706187665}', 0.69, '60.168.69.22', '2021-02-07 21:56:27');
INSERT INTO `operation_log` VALUES (66, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706190742}', 0.65, '60.168.69.22', '2021-02-07 21:56:30');
INSERT INTO `operation_log` VALUES (67, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612706200531,\"id\":1}', 17.79, '60.168.69.22', '2021-02-07 21:56:40');
INSERT INTO `operation_log` VALUES (68, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706200530}', 1.26, '60.168.69.22', '2021-02-07 21:56:40');
INSERT INTO `operation_log` VALUES (69, 1, 'admin', '/admin/v1/index', '{\"t\":1612706208248,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 48.37, '60.168.69.22', '2021-02-07 21:56:47');
INSERT INTO `operation_log` VALUES (70, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.10, '60.168.69.22', '2021-02-07 21:56:49');
INSERT INTO `operation_log` VALUES (71, 1, 'admin', '/admin/v1/info', '{\"t\":1612706210491}', 0.60, '60.168.69.22', '2021-02-07 21:56:49');
INSERT INTO `operation_log` VALUES (72, 1, 'admin', '/admin/v1/index', '{\"t\":1612706210643,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.26, '60.168.69.22', '2021-02-07 21:56:50');
INSERT INTO `operation_log` VALUES (73, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706211684,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.14, '60.168.69.22', '2021-02-07 21:56:51');
INSERT INTO `operation_log` VALUES (74, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.28, '60.168.69.22', '2021-02-07 21:56:53');
INSERT INTO `operation_log` VALUES (75, 1, 'admin', '/admin/v1/info', '{\"t\":1612706213820}', 0.61, '60.168.69.22', '2021-02-07 21:56:53');
INSERT INTO `operation_log` VALUES (76, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706213936,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.69, '60.168.69.22', '2021-02-07 21:56:53');
INSERT INTO `operation_log` VALUES (77, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706215302}', 0.78, '60.168.69.22', '2021-02-07 21:56:54');
INSERT INTO `operation_log` VALUES (78, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612706215302,\"id\":1}', 2.54, '60.168.69.22', '2021-02-07 21:56:54');
INSERT INTO `operation_log` VALUES (79, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706229003}', 0.69, '60.168.69.22', '2021-02-07 21:57:08');
INSERT INTO `operation_log` VALUES (80, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612706231407,\"id\":1}', 2.95, '60.168.69.22', '2021-02-07 21:57:10');
INSERT INTO `operation_log` VALUES (81, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706231406}', 1.03, '60.168.69.22', '2021-02-07 21:57:10');
INSERT INTO `operation_log` VALUES (82, 1, 'admin', '/admin/v1/index', '{\"t\":1612706235951,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.44, '60.168.69.22', '2021-02-07 21:57:15');
INSERT INTO `operation_log` VALUES (83, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706237589,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.86, '60.168.69.22', '2021-02-07 21:57:17');
INSERT INTO `operation_log` VALUES (84, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612706238764,\"id\":1}', 3.09, '60.168.69.22', '2021-02-07 21:57:18');
INSERT INTO `operation_log` VALUES (85, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706238763}', 1.00, '60.168.69.22', '2021-02-07 21:57:18');
INSERT INTO `operation_log` VALUES (86, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.11, '60.168.69.22', '2021-02-07 21:58:25');
INSERT INTO `operation_log` VALUES (87, 1, 'admin', '/admin/v1/info', '{\"t\":1612706305822}', 0.57, '60.168.69.22', '2021-02-07 21:58:25');
INSERT INTO `operation_log` VALUES (88, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706305977,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.50, '60.168.69.22', '2021-02-07 21:58:25');
INSERT INTO `operation_log` VALUES (89, 1, 'admin', '/admin/v1/index', '{\"t\":1612706307206,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.98, '60.168.69.22', '2021-02-07 21:58:26');
INSERT INTO `operation_log` VALUES (90, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706309880,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.72, '60.168.69.22', '2021-02-07 21:58:29');
INSERT INTO `operation_log` VALUES (91, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706311020}', 0.73, '60.168.69.22', '2021-02-07 21:58:30');
INSERT INTO `operation_log` VALUES (92, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612706311020,\"id\":1}', 2.50, '60.168.69.22', '2021-02-07 21:58:30');
INSERT INTO `operation_log` VALUES (93, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612706314893,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[1,2,3,4,5,6,7,9,10,11,12,13]}', 12.61, '60.168.69.22', '2021-02-07 21:58:34');
INSERT INTO `operation_log` VALUES (94, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706316448,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.74, '60.168.69.22', '2021-02-07 21:58:35');
INSERT INTO `operation_log` VALUES (95, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.18, '60.168.69.22', '2021-02-07 22:01:13');
INSERT INTO `operation_log` VALUES (96, 1, 'admin', '/admin/v1/info', '{\"t\":1612706474376}', 0.66, '60.168.69.22', '2021-02-07 22:01:13');
INSERT INTO `operation_log` VALUES (97, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706474541,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.79, '60.168.69.22', '2021-02-07 22:01:14');
INSERT INTO `operation_log` VALUES (98, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706475740}', 0.93, '60.168.69.22', '2021-02-07 22:01:15');
INSERT INTO `operation_log` VALUES (99, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612706475740,\"id\":1}', 2.35, '60.168.69.22', '2021-02-07 22:01:15');
INSERT INTO `operation_log` VALUES (100, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612706478997,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17]}', 5.60, '60.168.69.22', '2021-02-07 22:01:18');
INSERT INTO `operation_log` VALUES (101, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706480546,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.14, '60.168.69.22', '2021-02-07 22:01:20');
INSERT INTO `operation_log` VALUES (102, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706481862}', 0.88, '60.168.69.22', '2021-02-07 22:01:21');
INSERT INTO `operation_log` VALUES (103, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.00, '60.168.69.22', '2021-02-07 22:01:24');
INSERT INTO `operation_log` VALUES (104, 1, 'admin', '/admin/v1/info', '{\"t\":1612706484997}', 0.51, '60.168.69.22', '2021-02-07 22:01:24');
INSERT INTO `operation_log` VALUES (105, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706485104}', 0.88, '60.168.69.22', '2021-02-07 22:01:24');
INSERT INTO `operation_log` VALUES (106, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706533942}', 0.78, '60.168.69.22', '2021-02-07 22:02:13');
INSERT INTO `operation_log` VALUES (107, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612706757063,\"id\":0,\"type\":2,\"menu_name\":\"\\u7cfb\\u7edf\\u914d\\u7f6e\",\"parent_id\":1,\"url\":\"sys\\/config\",\"auth\":\"\",\"sort\":0,\"icon\":\"config\"}', 3.32, '60.168.69.22', '2021-02-07 22:05:56');
INSERT INTO `operation_log` VALUES (108, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706758640}', 1.01, '60.168.69.22', '2021-02-07 22:05:58');
INSERT INTO `operation_log` VALUES (109, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706773668}', 0.82, '60.168.69.22', '2021-02-07 22:06:13');
INSERT INTO `operation_log` VALUES (110, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612706804964,\"id\":0,\"type\":3,\"menu_name\":\"\\u914d\\u7f6e\\u5217\\u8868\",\"parent_id\":18,\"url\":\"\",\"auth\":\"config-list\",\"sort\":0,\"icon\":\"\"}', 3.16, '60.168.69.22', '2021-02-07 22:06:44');
INSERT INTO `operation_log` VALUES (111, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706806505}', 1.32, '60.168.69.22', '2021-02-07 22:06:45');
INSERT INTO `operation_log` VALUES (112, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706812971}', 0.85, '60.168.69.22', '2021-02-07 22:06:52');
INSERT INTO `operation_log` VALUES (113, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612706838794,\"id\":0,\"type\":3,\"menu_name\":\"\\u914d\\u7f6e\\u6dfb\\u52a0\",\"parent_id\":18,\"url\":\"\",\"auth\":\"config-add\",\"sort\":0,\"icon\":\"\"}', 28.16, '60.168.69.22', '2021-02-07 22:07:18');
INSERT INTO `operation_log` VALUES (114, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706840368}', 0.90, '60.168.69.22', '2021-02-07 22:07:19');
INSERT INTO `operation_log` VALUES (115, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706841716}', 0.78, '60.168.69.22', '2021-02-07 22:07:21');
INSERT INTO `operation_log` VALUES (116, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612706860619,\"id\":0,\"type\":3,\"menu_name\":\"\\u914d\\u7f6e\\u4fee\\u6539\",\"parent_id\":18,\"url\":\"\",\"auth\":\"config-edit\",\"sort\":0,\"icon\":\"\"}', 3.55, '60.168.69.22', '2021-02-07 22:07:40');
INSERT INTO `operation_log` VALUES (117, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706862171}', 0.93, '60.168.69.22', '2021-02-07 22:07:41');
INSERT INTO `operation_log` VALUES (118, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706863564}', 1.08, '60.168.69.22', '2021-02-07 22:07:43');
INSERT INTO `operation_log` VALUES (119, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612706879483,\"id\":0,\"type\":3,\"menu_name\":\"\\u914d\\u7f6e\\u5220\\u9664\",\"parent_id\":18,\"url\":\"\",\"auth\":\"config-del\",\"sort\":0,\"icon\":\"\"}', 2.59, '60.168.69.22', '2021-02-07 22:07:58');
INSERT INTO `operation_log` VALUES (120, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706881026}', 0.96, '60.168.69.22', '2021-02-07 22:08:00');
INSERT INTO `operation_log` VALUES (121, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706882033,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 57.37, '60.168.69.22', '2021-02-07 22:08:01');
INSERT INTO `operation_log` VALUES (122, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706882938}', 1.35, '60.168.69.22', '2021-02-07 22:08:02');
INSERT INTO `operation_log` VALUES (123, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612706882938,\"id\":1}', 2.12, '60.168.69.22', '2021-02-07 22:08:02');
INSERT INTO `operation_log` VALUES (124, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612706886203,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[1,18,22,21,20,19,13,17,16,15,14,7,12,11,10,9,2,6,5,4,3]}', 6.18, '60.168.69.22', '2021-02-07 22:08:05');
INSERT INTO `operation_log` VALUES (125, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706887749,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.81, '60.168.69.22', '2021-02-07 22:08:07');
INSERT INTO `operation_log` VALUES (126, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.06, '60.168.69.22', '2021-02-07 22:08:09');
INSERT INTO `operation_log` VALUES (127, 1, 'admin', '/admin/v1/info', '{\"t\":1612706890039}', 0.57, '60.168.69.22', '2021-02-07 22:08:09');
INSERT INTO `operation_log` VALUES (128, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612706890198,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.00, '60.168.69.22', '2021-02-07 22:08:09');
INSERT INTO `operation_log` VALUES (129, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612706895749,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 50.03, '60.168.69.22', '2021-02-07 22:08:15');
INSERT INTO `operation_log` VALUES (130, 1, 'admin', '/admin/v1/index', '{\"t\":1612706949946,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.08, '60.168.69.22', '2021-02-07 22:09:09');
INSERT INTO `operation_log` VALUES (131, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612706986732,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.67, '60.168.69.22', '2021-02-07 22:09:46');
INSERT INTO `operation_log` VALUES (132, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612706987733}', 1.15, '60.168.69.22', '2021-02-07 22:09:47');
INSERT INTO `operation_log` VALUES (133, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612706988501}', 0.82, '60.168.69.22', '2021-02-07 22:09:47');
INSERT INTO `operation_log` VALUES (134, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612707029117,\"id\":0,\"type\":2,\"menu_name\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"parent_id\":1,\"url\":\"sys\\/log\",\"auth\":\"\",\"sort\":0,\"icon\":\"log\"}', 3.72, '60.168.69.22', '2021-02-07 22:10:28');
INSERT INTO `operation_log` VALUES (135, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612707030664}', 1.06, '60.168.69.22', '2021-02-07 22:10:30');
INSERT INTO `operation_log` VALUES (136, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612707036140}', 0.99, '60.168.69.22', '2021-02-07 22:10:35');
INSERT INTO `operation_log` VALUES (137, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612707060811,\"id\":0,\"type\":3,\"menu_name\":\"\\u65e5\\u5fd7\\u5217\\u8868\",\"parent_id\":23,\"url\":\"\",\"auth\":\"log-list\",\"sort\":0,\"icon\":\"\"}', 2.68, '60.168.69.22', '2021-02-07 22:11:00');
INSERT INTO `operation_log` VALUES (138, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612707062352}', 1.06, '60.168.69.22', '2021-02-07 22:11:01');
INSERT INTO `operation_log` VALUES (139, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612707069563,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.85, '60.168.69.22', '2021-02-07 22:11:09');
INSERT INTO `operation_log` VALUES (140, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612707070866}', 1.45, '60.168.69.22', '2021-02-07 22:11:10');
INSERT INTO `operation_log` VALUES (141, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612707070866,\"id\":1}', 2.37, '60.168.69.22', '2021-02-07 22:11:10');
INSERT INTO `operation_log` VALUES (142, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612707074148,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[1,13,17,16,15,14,23,24,18,22,21,20,19,7,12,11,10,9,2,6,5,4,3]}', 5.70, '60.168.69.22', '2021-02-07 22:11:13');
INSERT INTO `operation_log` VALUES (143, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612707075701,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 57.08, '60.168.69.22', '2021-02-07 22:11:15');
INSERT INTO `operation_log` VALUES (144, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.23, '60.168.69.22', '2021-02-07 22:11:16');
INSERT INTO `operation_log` VALUES (145, 1, 'admin', '/admin/v1/info', '{\"t\":1612707076798}', 0.54, '60.168.69.22', '2021-02-07 22:11:16');
INSERT INTO `operation_log` VALUES (146, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612707076935,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 90.48, '60.168.69.22', '2021-02-07 22:11:16');
INSERT INTO `operation_log` VALUES (147, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.06, '117.68.154.201', '2021-02-07 22:23:35');
INSERT INTO `operation_log` VALUES (148, 1, 'admin', '/admin/v1/info', '{\"t\":1612707815952}', 0.57, '117.68.154.201', '2021-02-07 22:23:35');
INSERT INTO `operation_log` VALUES (149, 1, 'admin', '/admin/v1/index', '{\"t\":1612707818966,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.33, '117.68.154.201', '2021-02-07 22:23:38');
INSERT INTO `operation_log` VALUES (150, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.04, '117.68.154.201', '2021-02-07 22:26:55');
INSERT INTO `operation_log` VALUES (151, 1, 'admin', '/admin/v1/info', '{\"t\":1612708016315}', 0.52, '117.68.154.201', '2021-02-07 22:26:55');
INSERT INTO `operation_log` VALUES (152, 1, 'admin', '/admin/v1/index', '{\"t\":1612708016502,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 57.58, '117.68.154.201', '2021-02-07 22:26:56');
INSERT INTO `operation_log` VALUES (153, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.70, '117.68.154.201', '2021-02-07 22:27:33');
INSERT INTO `operation_log` VALUES (154, 1, 'admin', '/admin/v1/info', '{\"t\":1612708053959}', 0.55, '117.68.154.201', '2021-02-07 22:27:33');
INSERT INTO `operation_log` VALUES (155, 1, 'admin', '/admin/v1/index', '{\"t\":1612708055698,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.03, '117.68.154.201', '2021-02-07 22:27:35');
INSERT INTO `operation_log` VALUES (156, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.03, '117.68.154.201', '2021-02-07 22:29:05');
INSERT INTO `operation_log` VALUES (157, 1, 'admin', '/admin/v1/info', '{\"t\":1612708145917}', 0.58, '117.68.154.201', '2021-02-07 22:29:05');
INSERT INTO `operation_log` VALUES (158, 1, 'admin', '/admin/v1/index', '{\"t\":1612708146075,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.78, '117.68.154.201', '2021-02-07 22:29:05');
INSERT INTO `operation_log` VALUES (159, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.13, '117.68.154.201', '2021-02-07 22:32:48');
INSERT INTO `operation_log` VALUES (160, 1, 'admin', '/admin/v1/info', '{\"t\":1612708369283}', 0.73, '117.68.154.201', '2021-02-07 22:32:48');
INSERT INTO `operation_log` VALUES (161, 1, 'admin', '/admin/v1/index', '{\"t\":1612708369456,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.77, '117.68.154.201', '2021-02-07 22:32:49');
INSERT INTO `operation_log` VALUES (162, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.01, '60.173.242.244', '2021-02-08 08:47:02');
INSERT INTO `operation_log` VALUES (163, 1, 'admin', '/admin/v1/info', '{\"t\":1612745224242}', 0.56, '60.173.242.244', '2021-02-08 08:47:02');
INSERT INTO `operation_log` VALUES (164, 1, 'admin', '/admin/v1/index', '{\"t\":1612745239667,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.82, '60.173.242.244', '2021-02-08 08:47:18');
INSERT INTO `operation_log` VALUES (165, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745240933,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 57.07, '60.173.242.244', '2021-02-08 08:47:19');
INSERT INTO `operation_log` VALUES (166, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612745242471}', 1.02, '60.173.242.244', '2021-02-08 08:47:20');
INSERT INTO `operation_log` VALUES (167, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745243373,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.75, '60.173.242.244', '2021-02-08 08:47:21');
INSERT INTO `operation_log` VALUES (168, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745249805,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.30, '60.173.242.244', '2021-02-08 08:47:28');
INSERT INTO `operation_log` VALUES (169, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745250999,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.85, '60.173.242.244', '2021-02-08 08:47:29');
INSERT INTO `operation_log` VALUES (170, 1, 'admin', '/admin/v1/index', '{\"t\":1612745253160,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.66, '60.173.242.244', '2021-02-08 08:47:31');
INSERT INTO `operation_log` VALUES (171, 1, 'admin', '/admin/v1/index', '{\"t\":1612745260027,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.12, '60.173.242.244', '2021-02-08 08:47:38');
INSERT INTO `operation_log` VALUES (172, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745260525,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 45.10, '60.173.242.244', '2021-02-08 08:47:38');
INSERT INTO `operation_log` VALUES (173, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612745261256}', 0.94, '60.173.242.244', '2021-02-08 08:47:39');
INSERT INTO `operation_log` VALUES (174, 1, 'admin', '/admin/v1/index', '{\"t\":1612745433725,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.55, '60.173.242.244', '2021-02-08 08:50:32');
INSERT INTO `operation_log` VALUES (175, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745434223,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 45.67, '60.173.242.244', '2021-02-08 08:50:32');
INSERT INTO `operation_log` VALUES (176, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612745434781}', 1.11, '60.173.242.244', '2021-02-08 08:50:33');
INSERT INTO `operation_log` VALUES (177, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745435444,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.81, '60.173.242.244', '2021-02-08 08:50:33');
INSERT INTO `operation_log` VALUES (178, 1, 'admin', '/admin/v1/index', '{\"t\":1612745444359,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.57, '60.173.242.244', '2021-02-08 08:50:42');
INSERT INTO `operation_log` VALUES (179, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745444846,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.88, '60.173.242.244', '2021-02-08 08:50:43');
INSERT INTO `operation_log` VALUES (180, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745445311,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.67, '60.173.242.244', '2021-02-08 08:50:43');
INSERT INTO `operation_log` VALUES (181, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745447543,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.23, '60.173.242.244', '2021-02-08 08:50:45');
INSERT INTO `operation_log` VALUES (182, 1, 'admin', '/admin/v1/index', '{\"t\":1612745448437,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 45.34, '60.173.242.244', '2021-02-08 08:50:46');
INSERT INTO `operation_log` VALUES (183, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745449182,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 45.74, '60.173.242.244', '2021-02-08 08:50:47');
INSERT INTO `operation_log` VALUES (184, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745450846,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.72, '60.173.242.244', '2021-02-08 08:50:49');
INSERT INTO `operation_log` VALUES (185, 1, 'admin', '/admin/v1/index', '{\"t\":1612745454970,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.41, '60.173.242.244', '2021-02-08 08:50:53');
INSERT INTO `operation_log` VALUES (186, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745457413,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.70, '60.173.242.244', '2021-02-08 08:50:55');
INSERT INTO `operation_log` VALUES (187, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612745457824}', 1.13, '60.173.242.244', '2021-02-08 08:50:56');
INSERT INTO `operation_log` VALUES (188, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745458311,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.38, '60.173.242.244', '2021-02-08 08:50:56');
INSERT INTO `operation_log` VALUES (189, 1, 'admin', '/admin/v1/index', '{\"t\":1612745458774,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 45.49, '60.173.242.244', '2021-02-08 08:50:57');
INSERT INTO `operation_log` VALUES (190, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745465582,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.68, '60.173.242.244', '2021-02-08 08:51:03');
INSERT INTO `operation_log` VALUES (191, 1, 'admin', '/admin/v1/index', '{\"t\":1612745468941,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.31, '60.173.242.244', '2021-02-08 08:51:07');
INSERT INTO `operation_log` VALUES (192, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745500685,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.80, '60.173.242.244', '2021-02-08 08:51:39');
INSERT INTO `operation_log` VALUES (193, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612745501856}', 1.00, '60.173.242.244', '2021-02-08 08:51:40');
INSERT INTO `operation_log` VALUES (194, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745502427,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.15, '60.173.242.244', '2021-02-08 08:51:40');
INSERT INTO `operation_log` VALUES (195, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745503146,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.65, '60.173.242.244', '2021-02-08 08:51:41');
INSERT INTO `operation_log` VALUES (196, 1, 'admin', '/admin/v1/index', '{\"t\":1612745506192,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 56.53, '60.173.242.244', '2021-02-08 08:51:44');
INSERT INTO `operation_log` VALUES (197, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745767119,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.97, '60.173.242.244', '2021-02-08 08:56:05');
INSERT INTO `operation_log` VALUES (198, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612745767851}', 1.07, '60.173.242.244', '2021-02-08 08:56:06');
INSERT INTO `operation_log` VALUES (199, 1, 'admin', '/admin/v1/conf/index', '{\"t\":1612745768383,\"page\":1,\"limit\":10,\"param_key\":\"\"}', 0.77, '60.173.242.244', '2021-02-08 08:56:06');
INSERT INTO `operation_log` VALUES (200, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612745769320,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 55.98, '60.173.242.244', '2021-02-08 08:56:07');
INSERT INTO `operation_log` VALUES (201, 1, 'admin', '/admin/v1/index', '{\"t\":1612745770013,\"page\":1,\"limit\":10,\"admin_name\":\"\",\"status\":\"\"}', 45.78, '60.173.242.244', '2021-02-08 08:56:08');
INSERT INTO `operation_log` VALUES (202, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.34, '117.67.219.232', '2021-02-08 09:22:26');
INSERT INTO `operation_log` VALUES (203, 1, 'admin', '/admin/v1/info', '{\"t\":1612747347972}', 0.50, '117.67.219.232', '2021-02-08 09:22:26');
INSERT INTO `operation_log` VALUES (204, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747400020}', 1.01, '117.67.219.232', '2021-02-08 09:23:18');
INSERT INTO `operation_log` VALUES (205, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747401186}', 0.85, '117.67.219.232', '2021-02-08 09:23:19');
INSERT INTO `operation_log` VALUES (206, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747428914,\"id\":0,\"type\":1,\"menu_name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"parent_id\":0,\"url\":\"\",\"auth\":\"\",\"sort\":0,\"icon\":\"usermanage\"}', 3.51, '117.67.219.232', '2021-02-08 09:23:47');
INSERT INTO `operation_log` VALUES (207, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747430461}', 0.99, '117.67.219.232', '2021-02-08 09:23:48');
INSERT INTO `operation_log` VALUES (208, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747432881}', 0.87, '117.67.219.232', '2021-02-08 09:23:51');
INSERT INTO `operation_log` VALUES (209, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747491164,\"id\":0,\"type\":2,\"menu_name\":\"\\u7528\\u6237\",\"parent_id\":25,\"url\":\"user\\/user\",\"auth\":\"\",\"sort\":0,\"icon\":\"user\"}', 2.73, '117.67.219.232', '2021-02-08 09:24:49');
INSERT INTO `operation_log` VALUES (210, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747492704}', 0.99, '117.67.219.232', '2021-02-08 09:24:51');
INSERT INTO `operation_log` VALUES (211, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747493777}', 0.94, '117.67.219.232', '2021-02-08 09:24:52');
INSERT INTO `operation_log` VALUES (212, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747527769,\"id\":0,\"type\":3,\"menu_name\":\"\\u7528\\u6237\\u5217\\u8868\",\"parent_id\":26,\"url\":\"\",\"auth\":\"users-list\",\"sort\":0,\"icon\":\"\"}', 3.24, '117.67.219.232', '2021-02-08 09:25:26');
INSERT INTO `operation_log` VALUES (213, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747529313}', 1.06, '117.67.219.232', '2021-02-08 09:25:27');
INSERT INTO `operation_log` VALUES (214, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747531044}', 1.01, '117.67.219.232', '2021-02-08 09:25:29');
INSERT INTO `operation_log` VALUES (215, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747554921,\"id\":0,\"type\":3,\"menu_name\":\"\\u7528\\u6237\\u6dfb\\u52a0\",\"parent_id\":26,\"url\":\"\",\"auth\":\"users-add\",\"sort\":0,\"icon\":\"\"}', 29.40, '117.67.219.232', '2021-02-08 09:25:53');
INSERT INTO `operation_log` VALUES (216, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747556498}', 1.01, '117.67.219.232', '2021-02-08 09:25:54');
INSERT INTO `operation_log` VALUES (217, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747558466}', 1.05, '117.67.219.232', '2021-02-08 09:25:56');
INSERT INTO `operation_log` VALUES (218, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747580929,\"id\":0,\"type\":3,\"menu_name\":\"\\u7528\\u6237\\u4fee\\u6539\",\"parent_id\":26,\"url\":\"\",\"auth\":\"user-edit\",\"sort\":0,\"icon\":\"\"}', 4.23, '117.67.219.232', '2021-02-08 09:26:19');
INSERT INTO `operation_log` VALUES (219, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747582472}', 1.08, '117.67.219.232', '2021-02-08 09:26:20');
INSERT INTO `operation_log` VALUES (220, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747605369}', 0.96, '117.67.219.232', '2021-02-08 09:26:43');
INSERT INTO `operation_log` VALUES (221, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612747642106,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 57.01, '117.67.219.232', '2021-02-08 09:27:20');
INSERT INTO `operation_log` VALUES (222, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747643528}', 1.11, '117.67.219.232', '2021-02-08 09:27:21');
INSERT INTO `operation_log` VALUES (223, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612747643528,\"id\":1}', 2.50, '117.67.219.232', '2021-02-08 09:27:22');
INSERT INTO `operation_log` VALUES (224, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612747646097,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[25,26,29,28,27,1,23,24,18,22,21,20,19,13,16,17,15,14,7,12,11,10,9,2,6,5,4,3]}', 8.27, '117.67.219.232', '2021-02-08 09:27:24');
INSERT INTO `operation_log` VALUES (225, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612747647647,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.94, '117.67.219.232', '2021-02-08 09:27:26');
INSERT INTO `operation_log` VALUES (226, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.50, '117.67.219.232', '2021-02-08 09:27:29');
INSERT INTO `operation_log` VALUES (227, 1, 'admin', '/admin/v1/info', '{\"t\":1612747650704}', 0.63, '117.67.219.232', '2021-02-08 09:27:29');
INSERT INTO `operation_log` VALUES (228, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612747650837,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 57.19, '117.67.219.232', '2021-02-08 09:27:29');
INSERT INTO `operation_log` VALUES (229, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612747653514,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 0.98, '117.67.219.232', '2021-02-08 09:27:31');
INSERT INTO `operation_log` VALUES (230, 1, 'admin', '/admin/v1/user/add', '{\"t\":1612747700493,\"id\":0,\"user_name\":\"abcabc\",\"nickname\":\"abcabc\",\"password\":\"123456\",\"repassword\":\"123456\",\"email\":\"123456@abc.com\",\"mobile\":\"13912345678\",\"full_name\":\"\",\"liaison\":\"\",\"status\":1}', 103.20, '117.67.219.232', '2021-02-08 09:28:19');
INSERT INTO `operation_log` VALUES (231, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612747702134,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 56.70, '117.67.219.232', '2021-02-08 09:28:20');
INSERT INTO `operation_log` VALUES (232, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747726614}', 1.04, '117.67.219.232', '2021-02-08 09:28:45');
INSERT INTO `operation_log` VALUES (233, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747728337}', 0.96, '117.67.219.232', '2021-02-08 09:28:46');
INSERT INTO `operation_log` VALUES (234, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747788645,\"id\":0,\"type\":2,\"menu_name\":\"IP\\u7ba1\\u7406\",\"parent_id\":25,\"url\":\"user\\/ip\",\"auth\":\"\",\"sort\":0,\"icon\":\"mudedi\"}', 4.08, '117.67.219.232', '2021-02-08 09:29:47');
INSERT INTO `operation_log` VALUES (235, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747790191}', 1.16, '117.67.219.232', '2021-02-08 09:29:48');
INSERT INTO `operation_log` VALUES (236, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747792530}', 0.93, '117.67.219.232', '2021-02-08 09:29:50');
INSERT INTO `operation_log` VALUES (237, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747818900,\"id\":0,\"type\":3,\"menu_name\":\"IP\\u5217\\u8868\",\"parent_id\":30,\"url\":\"\",\"auth\":\"ip-list\",\"sort\":0,\"icon\":\"\"}', 2.96, '117.67.219.232', '2021-02-08 09:30:17');
INSERT INTO `operation_log` VALUES (238, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747820440}', 1.12, '117.67.219.232', '2021-02-08 09:30:18');
INSERT INTO `operation_log` VALUES (239, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747821793}', 0.94, '117.67.219.232', '2021-02-08 09:30:20');
INSERT INTO `operation_log` VALUES (240, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747843857,\"id\":0,\"type\":3,\"menu_name\":\"IP\\u6dfb\\u52a0\",\"parent_id\":30,\"url\":\"\",\"auth\":\"ip-add\",\"sort\":0,\"icon\":\"\"}', 3.58, '117.67.219.232', '2021-02-08 09:30:42');
INSERT INTO `operation_log` VALUES (241, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747845405}', 1.24, '117.67.219.232', '2021-02-08 09:30:43');
INSERT INTO `operation_log` VALUES (242, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747846322}', 1.06, '117.67.219.232', '2021-02-08 09:30:44');
INSERT INTO `operation_log` VALUES (243, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747865713,\"id\":0,\"type\":3,\"menu_name\":\"IP\\u9650\\u6d41\\u89e3\\u9664\",\"parent_id\":30,\"url\":\"\",\"auth\":\"ip-limit\",\"sort\":0,\"icon\":\"\"}', 3.52, '117.67.219.232', '2021-02-08 09:31:04');
INSERT INTO `operation_log` VALUES (244, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747867255}', 1.22, '117.67.219.232', '2021-02-08 09:31:05');
INSERT INTO `operation_log` VALUES (245, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747876699}', 1.05, '117.67.219.232', '2021-02-08 09:31:15');
INSERT INTO `operation_log` VALUES (246, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747899497,\"id\":0,\"type\":3,\"menu_name\":\"IP\\u5220\\u9664\",\"parent_id\":30,\"url\":\"\",\"auth\":\"ip-del\",\"sort\":0,\"icon\":\"\"}', 3.10, '117.67.219.232', '2021-02-08 09:31:37');
INSERT INTO `operation_log` VALUES (247, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747901046}', 1.14, '117.67.219.232', '2021-02-08 09:31:39');
INSERT INTO `operation_log` VALUES (248, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747925204}', 1.12, '117.67.219.232', '2021-02-08 09:32:03');
INSERT INTO `operation_log` VALUES (249, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747951978,\"id\":0,\"type\":2,\"menu_name\":\"\\u7528\\u6237\\u63a5\\u53e3\",\"parent_id\":25,\"url\":\"user\\/user-api\",\"auth\":\"\",\"sort\":0,\"icon\":\"jiekou\"}', 3.79, '117.67.219.232', '2021-02-08 09:32:30');
INSERT INTO `operation_log` VALUES (250, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747953517}', 1.18, '117.67.219.232', '2021-02-08 09:32:31');
INSERT INTO `operation_log` VALUES (251, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612747956017}', 1.08, '117.67.219.232', '2021-02-08 09:32:34');
INSERT INTO `operation_log` VALUES (252, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612747977945,\"id\":0,\"type\":3,\"menu_name\":\"\\u7528\\u6237\\u63a5\\u53e3\\u5217\\u8868\",\"parent_id\":35,\"url\":\"\",\"auth\":\"userapi-list\",\"sort\":0,\"icon\":\"\"}', 2.81, '117.67.219.232', '2021-02-08 09:32:56');
INSERT INTO `operation_log` VALUES (253, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612747979483}', 1.21, '117.67.219.232', '2021-02-08 09:32:57');
INSERT INTO `operation_log` VALUES (254, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748009018}', 1.18, '117.67.219.232', '2021-02-08 09:33:27');
INSERT INTO `operation_log` VALUES (255, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748028297,\"id\":0,\"type\":3,\"menu_name\":\"\\u7528\\u6237\\u63a5\\u53e3\\u6dfb\\u52a0\",\"parent_id\":35,\"url\":\"\",\"auth\":\"userapi-add\",\"sort\":0,\"icon\":\"\"}', 4.23, '117.67.219.232', '2021-02-08 09:33:46');
INSERT INTO `operation_log` VALUES (256, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748029838}', 1.22, '117.67.219.232', '2021-02-08 09:33:48');
INSERT INTO `operation_log` VALUES (257, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748031785}', 1.11, '117.67.219.232', '2021-02-08 09:33:50');
INSERT INTO `operation_log` VALUES (258, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748057243,\"id\":0,\"type\":3,\"menu_name\":\"\\u7528\\u6237\\u63a5\\u53e3\\u4fee\\u6539\",\"parent_id\":35,\"url\":\"\",\"auth\":\"userapi-edit\",\"sort\":0,\"icon\":\"\"}', 2.87, '117.67.219.232', '2021-02-08 09:34:15');
INSERT INTO `operation_log` VALUES (259, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748058788}', 1.41, '117.67.219.232', '2021-02-08 09:34:17');
INSERT INTO `operation_log` VALUES (260, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748059699}', 1.15, '117.67.219.232', '2021-02-08 09:34:18');
INSERT INTO `operation_log` VALUES (261, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748079025,\"id\":0,\"type\":3,\"menu_name\":\"\\u7528\\u6237\\u63a5\\u53e3\\u5220\\u9664\",\"parent_id\":35,\"url\":\"\",\"auth\":\"userapi-del\",\"sort\":0,\"icon\":\"\"}', 3.97, '117.67.219.232', '2021-02-08 09:34:37');
INSERT INTO `operation_log` VALUES (262, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748080564}', 1.34, '117.67.219.232', '2021-02-08 09:34:39');
INSERT INTO `operation_log` VALUES (263, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612748140893,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 53.35, '117.67.219.232', '2021-02-08 09:35:39');
INSERT INTO `operation_log` VALUES (264, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748142519}', 1.31, '117.67.219.232', '2021-02-08 09:35:40');
INSERT INTO `operation_log` VALUES (265, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612748142519,\"id\":1}', 2.56, '117.67.219.232', '2021-02-08 09:35:40');
INSERT INTO `operation_log` VALUES (266, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612748146794,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,1,23,24,2,3,4,5,6,7,12,9,10,11,13,14,15,16,17,18,22,21,19,20]}', 10.77, '117.67.219.232', '2021-02-08 09:35:45');
INSERT INTO `operation_log` VALUES (267, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612748148347,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.19, '117.67.219.232', '2021-02-08 09:35:46');
INSERT INTO `operation_log` VALUES (268, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.23, '117.67.219.232', '2021-02-08 09:36:11');
INSERT INTO `operation_log` VALUES (269, 1, 'admin', '/admin/v1/info', '{\"t\":1612748173407}', 0.56, '117.67.219.232', '2021-02-08 09:36:11');
INSERT INTO `operation_log` VALUES (270, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612748173533,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.12, '117.67.219.232', '2021-02-08 09:36:12');
INSERT INTO `operation_log` VALUES (271, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612748177048,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 56.50, '117.67.219.232', '2021-02-08 09:36:15');
INSERT INTO `operation_log` VALUES (272, 1, 'admin', '/admin/v1/user/show', '{\"t\":1612748179885,\"id\":1}', 0.85, '117.67.219.232', '2021-02-08 09:36:18');
INSERT INTO `operation_log` VALUES (273, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612748254809,\"page\":1,\"limit\":10,\"ip\":\"\"}', 2.35, '117.67.219.232', '2021-02-08 09:37:33');
INSERT INTO `operation_log` VALUES (274, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612748264001,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 0.91, '117.67.219.232', '2021-02-08 09:37:42');
INSERT INTO `operation_log` VALUES (275, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612748267641,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 67.68, '117.67.219.232', '2021-02-08 09:37:46');
INSERT INTO `operation_log` VALUES (276, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612748268140,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 0.68, '117.67.219.232', '2021-02-08 09:37:46');
INSERT INTO `operation_log` VALUES (277, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612748269539,\"page\":1,\"limit\":10,\"ip\":\"\"}', 0.73, '117.67.219.232', '2021-02-08 09:37:48');
INSERT INTO `operation_log` VALUES (278, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612748270068,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 0.73, '117.67.219.232', '2021-02-08 09:37:48');
INSERT INTO `operation_log` VALUES (279, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748286218}', 2.08, '117.67.219.232', '2021-02-08 09:38:04');
INSERT INTO `operation_log` VALUES (280, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748286960}', 1.34, '117.67.219.232', '2021-02-08 09:38:05');
INSERT INTO `operation_log` VALUES (281, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748316773,\"id\":0,\"type\":1,\"menu_name\":\"\\u63a5\\u53e3\\u7ba1\\u7406\",\"parent_id\":0,\"url\":\"\",\"auth\":\"\",\"sort\":0,\"icon\":\"mudedi\"}', 2.87, '117.67.219.232', '2021-02-08 09:38:35');
INSERT INTO `operation_log` VALUES (282, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748318318}', 1.40, '117.67.219.232', '2021-02-08 09:38:36');
INSERT INTO `operation_log` VALUES (283, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748335681}', 1.13, '117.67.219.232', '2021-02-08 09:38:54');
INSERT INTO `operation_log` VALUES (284, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612748335682,\"id\":35}', 0.83, '117.67.219.232', '2021-02-08 09:38:54');
INSERT INTO `operation_log` VALUES (285, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612748346548,\"id\":35,\"type\":2,\"menu_name\":\"\\u7528\\u6237\\u63a5\\u53e3\",\"parent_id\":25,\"url\":\"user\\/user-api\",\"auth\":\"\",\"sort\":0,\"icon\":\"userapi\"}', 3.65, '117.67.219.232', '2021-02-08 09:39:04');
INSERT INTO `operation_log` VALUES (286, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748348093}', 1.46, '117.67.219.232', '2021-02-08 09:39:06');
INSERT INTO `operation_log` VALUES (287, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748357866}', 1.19, '117.67.219.232', '2021-02-08 09:39:16');
INSERT INTO `operation_log` VALUES (288, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612748357866,\"id\":30}', 0.87, '117.67.219.232', '2021-02-08 09:39:16');
INSERT INTO `operation_log` VALUES (289, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612748362954,\"id\":30}', 0.82, '117.67.219.232', '2021-02-08 09:39:21');
INSERT INTO `operation_log` VALUES (290, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748362954}', 1.14, '117.67.219.232', '2021-02-08 09:39:21');
INSERT INTO `operation_log` VALUES (291, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.30, '117.67.219.232', '2021-02-08 09:39:30');
INSERT INTO `operation_log` VALUES (292, 1, 'admin', '/admin/v1/info', '{\"t\":1612748372015}', 0.51, '117.67.219.232', '2021-02-08 09:39:30');
INSERT INTO `operation_log` VALUES (293, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748372135}', 1.31, '117.67.219.232', '2021-02-08 09:39:30');
INSERT INTO `operation_log` VALUES (294, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612748378943,\"id\":30}', 0.85, '117.67.219.232', '2021-02-08 09:39:37');
INSERT INTO `operation_log` VALUES (295, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748378943}', 1.17, '117.67.219.232', '2021-02-08 09:39:37');
INSERT INTO `operation_log` VALUES (296, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612748419219,\"id\":30,\"type\":2,\"menu_name\":\"IP\\u7ba1\\u7406\",\"parent_id\":25,\"url\":\"user\\/ip\",\"auth\":\"\",\"sort\":0,\"icon\":\"dangdifill\"}', 3.60, '117.67.219.232', '2021-02-08 09:40:17');
INSERT INTO `operation_log` VALUES (297, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748420770}', 1.26, '117.67.219.232', '2021-02-08 09:40:19');
INSERT INTO `operation_log` VALUES (298, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.60, '117.67.219.232', '2021-02-08 09:40:21');
INSERT INTO `operation_log` VALUES (299, 1, 'admin', '/admin/v1/info', '{\"t\":1612748422777}', 0.59, '117.67.219.232', '2021-02-08 09:40:21');
INSERT INTO `operation_log` VALUES (300, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748422889}', 1.41, '117.67.219.232', '2021-02-08 09:40:21');
INSERT INTO `operation_log` VALUES (301, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748434892}', 1.64, '117.67.219.232', '2021-02-08 09:40:33');
INSERT INTO `operation_log` VALUES (302, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748490038,\"id\":0,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\",\"parent_id\":40,\"url\":\"api\\/api\",\"auth\":\"\",\"sort\":0,\"icon\":\"zhedie\"}', 2.93, '117.67.219.232', '2021-02-08 09:41:28');
INSERT INTO `operation_log` VALUES (303, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748491577}', 1.30, '117.67.219.232', '2021-02-08 09:41:30');
INSERT INTO `operation_log` VALUES (304, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748518338}', 1.17, '117.67.219.232', '2021-02-08 09:41:56');
INSERT INTO `operation_log` VALUES (305, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748529107,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u5217\\u8868\",\"parent_id\":41,\"url\":\"\",\"auth\":\"api-list\",\"sort\":0,\"icon\":\"\"}', 2.97, '117.67.219.232', '2021-02-08 09:42:07');
INSERT INTO `operation_log` VALUES (306, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748530651}', 1.38, '117.67.219.232', '2021-02-08 09:42:09');
INSERT INTO `operation_log` VALUES (307, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748531362}', 1.20, '117.67.219.232', '2021-02-08 09:42:09');
INSERT INTO `operation_log` VALUES (308, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748550433,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u589e\\u52a0\",\"parent_id\":41,\"url\":\"\",\"auth\":\"api-add\",\"sort\":0,\"icon\":\"\"}', 4.04, '117.67.219.232', '2021-02-08 09:42:28');
INSERT INTO `operation_log` VALUES (309, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748551980}', 1.47, '117.67.219.232', '2021-02-08 09:42:30');
INSERT INTO `operation_log` VALUES (310, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748553178}', 1.45, '117.67.219.232', '2021-02-08 09:42:31');
INSERT INTO `operation_log` VALUES (311, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748581146,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u4fee\\u6539\",\"parent_id\":41,\"url\":\"\",\"auth\":\"api-edit\",\"sort\":0,\"icon\":\"\"}', 3.35, '117.67.219.232', '2021-02-08 09:42:59');
INSERT INTO `operation_log` VALUES (312, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748582692}', 1.42, '117.67.219.232', '2021-02-08 09:43:01');
INSERT INTO `operation_log` VALUES (313, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748584450}', 1.35, '117.67.219.232', '2021-02-08 09:43:02');
INSERT INTO `operation_log` VALUES (314, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748635729,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u5f00\\u542f\",\"parent_id\":41,\"url\":\"\",\"auth\":\"api-open\",\"sort\":0,\"icon\":\"\"}', 2.73, '117.67.219.232', '2021-02-08 09:43:54');
INSERT INTO `operation_log` VALUES (315, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748637269}', 1.47, '117.67.219.232', '2021-02-08 09:43:55');
INSERT INTO `operation_log` VALUES (316, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748638346}', 1.24, '117.67.219.232', '2021-02-08 09:43:56');
INSERT INTO `operation_log` VALUES (317, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748654521,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u5173\\u95ed\",\"parent_id\":41,\"url\":\"\",\"auth\":\"api-close\",\"sort\":0,\"icon\":\"\"}', 3.98, '117.67.219.232', '2021-02-08 09:44:12');
INSERT INTO `operation_log` VALUES (318, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748656067}', 1.41, '117.67.219.232', '2021-02-08 09:44:14');
INSERT INTO `operation_log` VALUES (319, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612748679770,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 55.98, '117.67.219.232', '2021-02-08 09:44:38');
INSERT INTO `operation_log` VALUES (320, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748681224}', 1.30, '117.67.219.232', '2021-02-08 09:44:39');
INSERT INTO `operation_log` VALUES (321, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612748681224,\"id\":1}', 3.12, '117.67.219.232', '2021-02-08 09:44:39');
INSERT INTO `operation_log` VALUES (322, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612748683297,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,1,13,14,15,16,17,2,3,4,5,6,7,9,10,11,12,18,19,20,21,22,23,24]}', 5.78, '117.67.219.232', '2021-02-08 09:44:41');
INSERT INTO `operation_log` VALUES (323, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612748684843,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.10, '117.67.219.232', '2021-02-08 09:44:43');
INSERT INTO `operation_log` VALUES (324, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.28, '117.67.219.232', '2021-02-08 09:44:45');
INSERT INTO `operation_log` VALUES (325, 1, 'admin', '/admin/v1/info', '{\"t\":1612748687536}', 0.56, '117.67.219.232', '2021-02-08 09:44:45');
INSERT INTO `operation_log` VALUES (326, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612748687678,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.92, '117.67.219.232', '2021-02-08 09:44:46');
INSERT INTO `operation_log` VALUES (327, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612748691431,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 1.09, '117.67.219.232', '2021-02-08 09:44:49');
INSERT INTO `operation_log` VALUES (328, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748811206}', 1.67, '117.67.219.232', '2021-02-08 09:46:49');
INSERT INTO `operation_log` VALUES (329, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748817569}', 1.20, '117.67.219.232', '2021-02-08 09:46:56');
INSERT INTO `operation_log` VALUES (330, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748890123,\"id\":0,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\\u4f9b\\u5e94\\u5546\",\"parent_id\":40,\"url\":\"api\\/supplier\",\"auth\":\"\",\"sort\":0,\"icon\":\"geren\"}', 3.20, '117.67.219.232', '2021-02-08 09:48:08');
INSERT INTO `operation_log` VALUES (331, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748891666}', 1.53, '117.67.219.232', '2021-02-08 09:48:10');
INSERT INTO `operation_log` VALUES (332, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748903927}', 1.29, '117.67.219.232', '2021-02-08 09:48:22');
INSERT INTO `operation_log` VALUES (333, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748916473,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u4f9b\\u5e94\\u5546\\u5217\\u8868\",\"parent_id\":47,\"url\":\"\",\"auth\":\"supplier-list\",\"sort\":0,\"icon\":\"\"}', 2.55, '117.67.219.232', '2021-02-08 09:48:34');
INSERT INTO `operation_log` VALUES (334, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748918015}', 1.61, '117.67.219.232', '2021-02-08 09:48:36');
INSERT INTO `operation_log` VALUES (335, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748918753}', 1.31, '117.67.219.232', '2021-02-08 09:48:37');
INSERT INTO `operation_log` VALUES (336, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748944346,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u4f9b\\u5e94\\u5546\\u589e\\u52a0\",\"parent_id\":47,\"url\":\"\",\"auth\":\"supplier-add\",\"sort\":0,\"icon\":\"\"}', 3.63, '117.67.219.232', '2021-02-08 09:49:02');
INSERT INTO `operation_log` VALUES (337, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748945888}', 1.67, '117.67.219.232', '2021-02-08 09:49:04');
INSERT INTO `operation_log` VALUES (338, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748947355}', 1.28, '117.67.219.232', '2021-02-08 09:49:05');
INSERT INTO `operation_log` VALUES (339, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612748976178,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u4f9b\\u5e94\\u5546\\u4fee\\u6539\",\"parent_id\":47,\"url\":\"\",\"auth\":\"supplier-edit\",\"sort\":0,\"icon\":\"\"}', 2.58, '117.67.219.232', '2021-02-08 09:49:34');
INSERT INTO `operation_log` VALUES (340, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612748977722}', 1.55, '117.67.219.232', '2021-02-08 09:49:36');
INSERT INTO `operation_log` VALUES (341, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612748978530}', 1.40, '117.67.219.232', '2021-02-08 09:49:36');
INSERT INTO `operation_log` VALUES (342, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612749042937,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u4f9b\\u5e94\\u5546\\u5220\\u9664\",\"parent_id\":47,\"url\":\"\",\"auth\":\"supplier-del\",\"sort\":0,\"icon\":\"\"}', 2.54, '117.67.219.232', '2021-02-08 09:50:41');
INSERT INTO `operation_log` VALUES (343, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612749044479}', 1.72, '117.67.219.232', '2021-02-08 09:50:42');
INSERT INTO `operation_log` VALUES (344, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612749081330}', 1.25, '117.67.219.232', '2021-02-08 09:51:19');
INSERT INTO `operation_log` VALUES (345, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612749132010,\"id\":0,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\\u72b6\\u6001\\u5417\",\"parent_id\":40,\"url\":\"api\\/code\",\"auth\":\"\",\"sort\":0,\"icon\":\"pinglun\"}', 5.21, '117.67.219.232', '2021-02-08 09:52:10');
INSERT INTO `operation_log` VALUES (346, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612749133555}', 1.59, '117.67.219.232', '2021-02-08 09:52:12');
INSERT INTO `operation_log` VALUES (347, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612749452810,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.84, '117.67.219.232', '2021-02-08 09:57:31');
INSERT INTO `operation_log` VALUES (348, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612749454252}', 1.38, '117.67.219.232', '2021-02-08 09:57:32');
INSERT INTO `operation_log` VALUES (349, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612749454252,\"id\":1}', 3.13, '117.67.219.232', '2021-02-08 09:57:32');
INSERT INTO `operation_log` VALUES (350, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612749460640,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[40,41,42,43,44,45,46,47,48,49,50,51,52,1,2,3,4,5,6,7,9,10,11,12,13,15,14,16,17,18,19,20,21,22,23,24,25,30,31,32,33,34,35,36,37,38,39,26,28,29,27]}', 6.29, '117.67.219.232', '2021-02-08 09:57:39');
INSERT INTO `operation_log` VALUES (351, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612749462188,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 65.84, '117.67.219.232', '2021-02-08 09:57:40');
INSERT INTO `operation_log` VALUES (352, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.50, '117.67.219.232', '2021-02-08 09:57:41');
INSERT INTO `operation_log` VALUES (353, 1, 'admin', '/admin/v1/info', '{\"t\":1612749462680}', 0.52, '117.67.219.232', '2021-02-08 09:57:41');
INSERT INTO `operation_log` VALUES (354, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612749462835,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.25, '117.67.219.232', '2021-02-08 09:57:41');
INSERT INTO `operation_log` VALUES (355, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612749556332,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 0.80, '117.67.219.232', '2021-02-08 09:59:14');
INSERT INTO `operation_log` VALUES (356, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612749557600,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 0.85, '117.67.219.232', '2021-02-08 09:59:16');
INSERT INTO `operation_log` VALUES (357, 1, 'admin', '/admin/v1/supplier/add', '{\"t\":1612749578572,\"id\":0,\"supplier_name\":\"\\u9ad8\\u5fb7\\u5730\\u56fe\",\"mobile\":\"\"}', 3.32, '117.67.219.232', '2021-02-08 09:59:37');
INSERT INTO `operation_log` VALUES (358, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612749580125,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 64.92, '117.67.219.232', '2021-02-08 09:59:38');
INSERT INTO `operation_log` VALUES (359, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612749582877,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 0.68, '117.67.219.232', '2021-02-08 09:59:41');
INSERT INTO `operation_log` VALUES (360, 1, 'admin', '/admin/v1/menu/nav', '[]', 5.22, '117.67.219.232', '2021-02-08 10:06:02');
INSERT INTO `operation_log` VALUES (361, 1, 'admin', '/admin/v1/info', '{\"t\":1612749964229}', 0.62, '117.67.219.232', '2021-02-08 10:06:02');
INSERT INTO `operation_log` VALUES (362, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612749964406,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 13.64, '117.67.219.232', '2021-02-08 10:06:02');
INSERT INTO `operation_log` VALUES (363, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612749966853,\"page\":1,\"limit\":10,\"code\":\"\"}', 5.08, '117.67.219.232', '2021-02-08 10:06:05');
INSERT INTO `operation_log` VALUES (364, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612749966853}', 1.02, '117.67.219.232', '2021-02-08 10:06:05');
INSERT INTO `operation_log` VALUES (365, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612749972237}', 1.99, '117.67.219.232', '2021-02-08 10:06:10');
INSERT INTO `operation_log` VALUES (366, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612749973124}', 1.41, '117.67.219.232', '2021-02-08 10:06:11');
INSERT INTO `operation_log` VALUES (367, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750011478,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u72b6\\u6001\\u7801\\u5217\\u8868\",\"parent_id\":52,\"url\":\"\",\"auth\":\"code-list\",\"sort\":0,\"icon\":\"\"}', 2.80, '117.67.219.232', '2021-02-08 10:06:49');
INSERT INTO `operation_log` VALUES (368, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750013024}', 1.75, '117.67.219.232', '2021-02-08 10:06:51');
INSERT INTO `operation_log` VALUES (369, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750017412}', 1.39, '117.67.219.232', '2021-02-08 10:06:55');
INSERT INTO `operation_log` VALUES (370, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750052634,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u72b6\\u6001\\u7801\\u6dfb\\u52a0\",\"parent_id\":52,\"url\":\"\",\"auth\":\"code-add\",\"sort\":0,\"icon\":\"\"}', 3.00, '117.67.219.232', '2021-02-08 10:07:31');
INSERT INTO `operation_log` VALUES (371, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750054181}', 1.85, '117.67.219.232', '2021-02-08 10:07:32');
INSERT INTO `operation_log` VALUES (372, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750055330}', 1.47, '117.67.219.232', '2021-02-08 10:07:33');
INSERT INTO `operation_log` VALUES (373, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750071457,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u72b6\\u6001\\u7801\\u4fee\\u6539\",\"parent_id\":52,\"url\":\"\",\"auth\":\"code-edit\",\"sort\":0,\"icon\":\"\"}', 2.88, '117.67.219.232', '2021-02-08 10:07:49');
INSERT INTO `operation_log` VALUES (374, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750073002}', 1.98, '117.67.219.232', '2021-02-08 10:07:51');
INSERT INTO `operation_log` VALUES (375, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750073698}', 1.59, '117.67.219.232', '2021-02-08 10:07:52');
INSERT INTO `operation_log` VALUES (376, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750091497,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u72b6\\u6001\\u7801\\u5220\\u9664\",\"parent_id\":52,\"url\":\"\",\"auth\":\"code-del\",\"sort\":0,\"icon\":\"\"}', 3.69, '117.67.219.232', '2021-02-08 10:08:09');
INSERT INTO `operation_log` VALUES (377, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750093042}', 1.72, '117.67.219.232', '2021-02-08 10:08:11');
INSERT INTO `operation_log` VALUES (378, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750292171}', 1.50, '117.67.219.232', '2021-02-08 10:11:30');
INSERT INTO `operation_log` VALUES (379, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750338814,\"id\":0,\"type\":2,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\",\"parent_id\":40,\"url\":\"api\\/supplier-api\",\"auth\":\"\",\"sort\":0,\"icon\":\"userapi\"}', 2.72, '117.67.219.232', '2021-02-08 10:12:17');
INSERT INTO `operation_log` VALUES (380, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750340356}', 1.71, '117.67.219.232', '2021-02-08 10:12:18');
INSERT INTO `operation_log` VALUES (381, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750354922}', 1.70, '117.67.219.232', '2021-02-08 10:12:33');
INSERT INTO `operation_log` VALUES (382, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750371753,\"id\":0,\"type\":3,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\\u5217\\u8868\",\"parent_id\":57,\"url\":0,\"auth\":\"supplierapi-list\",\"sort\":0,\"icon\":\"\"}', 3.33, '117.67.219.232', '2021-02-08 10:12:50');
INSERT INTO `operation_log` VALUES (383, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750373296}', 2.04, '117.67.219.232', '2021-02-08 10:12:51');
INSERT INTO `operation_log` VALUES (384, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750383291}', 2.38, '117.67.219.232', '2021-02-08 10:13:01');
INSERT INTO `operation_log` VALUES (385, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750407082,\"id\":0,\"type\":3,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\\u589e\\u52a0\",\"parent_id\":57,\"url\":0,\"auth\":\"supplierapi-add\",\"sort\":0,\"icon\":\"\"}', 3.00, '117.67.219.232', '2021-02-08 10:13:25');
INSERT INTO `operation_log` VALUES (386, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750408625}', 1.71, '117.67.219.232', '2021-02-08 10:13:27');
INSERT INTO `operation_log` VALUES (387, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750409636}', 1.72, '117.67.219.232', '2021-02-08 10:13:28');
INSERT INTO `operation_log` VALUES (388, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750431337,\"id\":0,\"type\":3,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\\u5f00\\u542f\",\"parent_id\":57,\"url\":0,\"auth\":\"supplierapi-open\",\"sort\":0,\"icon\":\"\"}', 3.07, '117.67.219.232', '2021-02-08 10:13:49');
INSERT INTO `operation_log` VALUES (389, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750432878}', 1.95, '117.67.219.232', '2021-02-08 10:13:51');
INSERT INTO `operation_log` VALUES (390, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750433634}', 1.50, '117.67.219.232', '2021-02-08 10:13:52');
INSERT INTO `operation_log` VALUES (391, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750459065,\"id\":0,\"type\":3,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\\u5173\\u95ed\",\"parent_id\":57,\"url\":0,\"auth\":\"supplierapi-close\",\"sort\":0,\"icon\":\"\"}', 3.29, '117.67.219.232', '2021-02-08 10:14:17');
INSERT INTO `operation_log` VALUES (392, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750460611}', 1.70, '117.67.219.232', '2021-02-08 10:14:19');
INSERT INTO `operation_log` VALUES (393, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750462258}', 1.47, '117.67.219.232', '2021-02-08 10:14:20');
INSERT INTO `operation_log` VALUES (394, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612750485961,\"id\":0,\"type\":3,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\\u4fee\\u6539\",\"parent_id\":57,\"url\":0,\"auth\":\"supplierapi-edit\",\"sort\":0,\"icon\":\"\"}', 2.64, '117.67.219.232', '2021-02-08 10:14:44');
INSERT INTO `operation_log` VALUES (395, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750487505}', 1.72, '117.67.219.232', '2021-02-08 10:14:45');
INSERT INTO `operation_log` VALUES (396, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612750496265,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.81, '117.67.219.232', '2021-02-08 10:14:54');
INSERT INTO `operation_log` VALUES (397, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750497729}', 1.72, '117.67.219.232', '2021-02-08 10:14:56');
INSERT INTO `operation_log` VALUES (398, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612750497729,\"id\":1}', 9.69, '117.67.219.232', '2021-02-08 10:14:56');
INSERT INTO `operation_log` VALUES (399, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612750503425,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.22, '117.67.219.232', '2021-02-08 10:15:01');
INSERT INTO `operation_log` VALUES (400, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750504259}', 1.72, '117.67.219.232', '2021-02-08 10:15:02');
INSERT INTO `operation_log` VALUES (401, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750508546}', 1.78, '117.67.219.232', '2021-02-08 10:15:07');
INSERT INTO `operation_log` VALUES (402, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612750508547,\"id\":52}', 1.01, '117.67.219.232', '2021-02-08 10:15:07');
INSERT INTO `operation_log` VALUES (403, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612750512514,\"id\":52,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\\u72b6\\u6001\\u7801\",\"parent_id\":40,\"url\":\"api\\/code\",\"auth\":\"\",\"sort\":0,\"icon\":\"pinglun\"}', 3.47, '117.67.219.232', '2021-02-08 10:15:10');
INSERT INTO `operation_log` VALUES (404, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750514057}', 1.72, '117.67.219.232', '2021-02-08 10:15:12');
INSERT INTO `operation_log` VALUES (405, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.66, '117.67.219.232', '2021-02-08 10:15:14');
INSERT INTO `operation_log` VALUES (406, 1, 'admin', '/admin/v1/info', '{\"t\":1612750516517}', 0.65, '117.67.219.232', '2021-02-08 10:15:14');
INSERT INTO `operation_log` VALUES (407, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750516646}', 1.85, '117.67.219.232', '2021-02-08 10:15:15');
INSERT INTO `operation_log` VALUES (408, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750520593,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.38, '117.67.219.232', '2021-02-08 10:15:19');
INSERT INTO `operation_log` VALUES (409, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750522265,\"page\":1,\"limit\":10,\"code\":\"\"}', 1.00, '117.67.219.232', '2021-02-08 10:15:20');
INSERT INTO `operation_log` VALUES (410, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750522265}', 0.63, '117.67.219.232', '2021-02-08 10:15:20');
INSERT INTO `operation_log` VALUES (411, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750525214,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 73.41, '117.67.219.232', '2021-02-08 10:15:23');
INSERT INTO `operation_log` VALUES (412, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750528311}', 0.65, '117.67.219.232', '2021-02-08 10:15:26');
INSERT INTO `operation_log` VALUES (413, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750528311,\"page\":1,\"limit\":10,\"code\":\"\"}', 0.94, '117.67.219.232', '2021-02-08 10:15:26');
INSERT INTO `operation_log` VALUES (414, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750531099}', 0.53, '117.67.219.232', '2021-02-08 10:15:29');
INSERT INTO `operation_log` VALUES (415, 1, 'admin', '/admin/v1/code/add', '{\"t\":1612750570141,\"id\":0,\"code\":\"100\",\"desc\":\"\\u8bf7\\u6c42\\u6210\\u529f\",\"supplier_id\":0,\"supplier_code\":\"\",\"supplier_code_desc\":\"\"}', 3.24, '117.67.219.232', '2021-02-08 10:16:08');
INSERT INTO `operation_log` VALUES (416, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750571691,\"page\":1,\"limit\":10,\"code\":\"\"}', 62.68, '117.67.219.232', '2021-02-08 10:16:10');
INSERT INTO `operation_log` VALUES (417, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750579173,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.15, '117.67.219.232', '2021-02-08 10:16:17');
INSERT INTO `operation_log` VALUES (418, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750581732}', 0.61, '117.67.219.232', '2021-02-08 10:16:20');
INSERT INTO `operation_log` VALUES (419, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750581732,\"page\":1,\"limit\":10,\"code\":\"\"}', 48.92, '117.67.219.232', '2021-02-08 10:16:20');
INSERT INTO `operation_log` VALUES (420, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612750583153,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 0.92, '117.67.219.232', '2021-02-08 10:16:21');
INSERT INTO `operation_log` VALUES (421, 1, 'admin', '/admin/v1/api/add', '{\"t\":1612750603819,\"id\":0,\"api_name\":\"IP\\u5730\\u5740\\u67e5\\u8be2\",\"url\":\"\\/api\\/v1\\/ip\",\"logo\":\"\",\"status\":1,\"fee_type\":1,\"price\":0,\"desc\":\"IP\\u5730\\u5740\\u67e5\\u8be2\",\"document\":\"\",\"return_example\":\"\",\"remark\":\"\"}', 9.84, '117.67.219.232', '2021-02-08 10:16:42');
INSERT INTO `operation_log` VALUES (422, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612750605369,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 56.55, '117.67.219.232', '2021-02-08 10:16:43');
INSERT INTO `operation_log` VALUES (423, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750608084,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.79, '117.67.219.232', '2021-02-08 10:16:46');
INSERT INTO `operation_log` VALUES (424, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750609909}', 0.65, '117.67.219.232', '2021-02-08 10:16:48');
INSERT INTO `operation_log` VALUES (425, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750609909,\"page\":1,\"limit\":10,\"code\":\"\"}', 59.44, '117.67.219.232', '2021-02-08 10:16:48');
INSERT INTO `operation_log` VALUES (426, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750621431,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.50, '117.67.219.232', '2021-02-08 10:16:59');
INSERT INTO `operation_log` VALUES (427, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750624744}', 0.57, '117.67.219.232', '2021-02-08 10:17:03');
INSERT INTO `operation_log` VALUES (428, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750624744,\"page\":1,\"limit\":10,\"code\":\"\"}', 56.92, '117.67.219.232', '2021-02-08 10:17:03');
INSERT INTO `operation_log` VALUES (429, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750625744,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.24, '117.67.219.232', '2021-02-08 10:17:04');
INSERT INTO `operation_log` VALUES (430, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750644790}', 1.75, '117.67.219.232', '2021-02-08 10:17:23');
INSERT INTO `operation_log` VALUES (431, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612750648793,\"id\":57}', 0.93, '117.67.219.232', '2021-02-08 10:17:27');
INSERT INTO `operation_log` VALUES (432, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612750648793}', 1.66, '117.67.219.232', '2021-02-08 10:17:27');
INSERT INTO `operation_log` VALUES (433, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612750661954,\"id\":57,\"type\":2,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\",\"parent_id\":40,\"url\":\"api\\/supplier_api\",\"auth\":\"\",\"sort\":0,\"icon\":\"userapi\"}', 6.26, '117.67.219.232', '2021-02-08 10:17:40');
INSERT INTO `operation_log` VALUES (434, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750663510}', 2.05, '117.67.219.232', '2021-02-08 10:17:41');
INSERT INTO `operation_log` VALUES (435, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.68, '117.67.219.232', '2021-02-08 10:17:43');
INSERT INTO `operation_log` VALUES (436, 1, 'admin', '/admin/v1/info', '{\"t\":1612750665134}', 0.62, '117.67.219.232', '2021-02-08 10:17:43');
INSERT INTO `operation_log` VALUES (437, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612750665253}', 1.89, '117.67.219.232', '2021-02-08 10:17:43');
INSERT INTO `operation_log` VALUES (438, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750668682,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 57.03, '117.67.219.232', '2021-02-08 10:17:47');
INSERT INTO `operation_log` VALUES (439, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612750670533,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 1.10, '117.67.219.232', '2021-02-08 10:17:49');
INSERT INTO `operation_log` VALUES (440, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750672671}', 0.43, '117.67.219.232', '2021-02-08 10:17:51');
INSERT INTO `operation_log` VALUES (441, 1, 'admin', '/admin/v1/supplierapi/add', '{\"t\":1612750782783,\"id\":0,\"supplier_api_name\":\"IP\\u5b9a\\u4f4d\",\"url\":\"\\/v3\\/ip\",\"status\":1,\"fee_type\":1,\"supplier_id\":1,\"supplier_api_price\":0}', 4.64, '117.67.219.232', '2021-02-08 10:19:41');
INSERT INTO `operation_log` VALUES (442, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612750784327,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.30, '117.67.219.232', '2021-02-08 10:19:42');
INSERT INTO `operation_log` VALUES (443, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750788723}', 0.38, '117.67.219.232', '2021-02-08 10:19:47');
INSERT INTO `operation_log` VALUES (444, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750788723,\"page\":1,\"limit\":10,\"code\":\"\"}', 61.26, '117.67.219.232', '2021-02-08 10:19:47');
INSERT INTO `operation_log` VALUES (445, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612750790894,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.42, '117.67.219.232', '2021-02-08 10:19:49');
INSERT INTO `operation_log` VALUES (446, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750791249}', 0.41, '117.67.219.232', '2021-02-08 10:19:49');
INSERT INTO `operation_log` VALUES (447, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750791249,\"page\":1,\"limit\":10,\"code\":\"\"}', 72.73, '117.67.219.232', '2021-02-08 10:19:49');
INSERT INTO `operation_log` VALUES (448, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750791573,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.77, '117.67.219.232', '2021-02-08 10:19:50');
INSERT INTO `operation_log` VALUES (449, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750792067}', 0.41, '117.67.219.232', '2021-02-08 10:19:50');
INSERT INTO `operation_log` VALUES (450, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750792067,\"page\":1,\"limit\":10,\"code\":\"\"}', 50.80, '117.67.219.232', '2021-02-08 10:19:50');
INSERT INTO `operation_log` VALUES (451, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612750792430,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 56.85, '117.67.219.232', '2021-02-08 10:19:50');
INSERT INTO `operation_log` VALUES (452, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750793674}', 0.50, '117.67.219.232', '2021-02-08 10:19:52');
INSERT INTO `operation_log` VALUES (453, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750793674,\"page\":1,\"limit\":10,\"code\":\"\"}', 64.52, '117.67.219.232', '2021-02-08 10:19:52');
INSERT INTO `operation_log` VALUES (454, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612750794028,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 45.95, '117.67.219.232', '2021-02-08 10:19:52');
INSERT INTO `operation_log` VALUES (455, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612750795287}', 0.42, '117.67.219.232', '2021-02-08 10:19:53');
INSERT INTO `operation_log` VALUES (456, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612750795287,\"page\":1,\"limit\":10,\"code\":\"\"}', 59.89, '117.67.219.232', '2021-02-08 10:19:53');
INSERT INTO `operation_log` VALUES (457, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612750795671,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 46.65, '117.67.219.232', '2021-02-08 10:19:54');
INSERT INTO `operation_log` VALUES (458, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612751136075}', 0.71, '117.67.219.232', '2021-02-08 10:25:34');
INSERT INTO `operation_log` VALUES (459, 1, 'admin', '/admin/v1/supplierapi/show', '{\"t\":1612751136075,\"id\":1}', 1.07, '117.67.219.232', '2021-02-08 10:25:34');
INSERT INTO `operation_log` VALUES (460, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.78, '117.67.219.232', '2021-02-08 10:26:01');
INSERT INTO `operation_log` VALUES (461, 1, 'admin', '/admin/v1/info', '{\"t\":1612751162695}', 0.66, '117.67.219.232', '2021-02-08 10:26:01');
INSERT INTO `operation_log` VALUES (462, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612751162868,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.46, '117.67.219.232', '2021-02-08 10:26:01');
INSERT INTO `operation_log` VALUES (463, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612751164244}', 0.64, '117.67.219.232', '2021-02-08 10:26:02');
INSERT INTO `operation_log` VALUES (464, 1, 'admin', '/admin/v1/supplierapi/show', '{\"t\":1612751164244,\"id\":1}', 1.17, '117.67.219.232', '2021-02-08 10:26:02');
INSERT INTO `operation_log` VALUES (465, 1, 'admin', '/admin/v1/supplierapi/show', '{\"t\":1612751218838,\"id\":1}', 1.04, '117.67.219.232', '2021-02-08 10:26:57');
INSERT INTO `operation_log` VALUES (466, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612751218837}', 0.53, '117.67.219.232', '2021-02-08 10:26:57');
INSERT INTO `operation_log` VALUES (467, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.63, '117.67.219.232', '2021-02-08 10:45:58');
INSERT INTO `operation_log` VALUES (468, 1, 'admin', '/admin/v1/info', '{\"t\":1612752359877}', 0.60, '117.67.219.232', '2021-02-08 10:45:58');
INSERT INTO `operation_log` VALUES (469, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612752360059,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 58.39, '117.67.219.232', '2021-02-08 10:45:58');
INSERT INTO `operation_log` VALUES (470, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612752439134}', 1.10, '117.67.219.232', '2021-02-08 10:47:17');
INSERT INTO `operation_log` VALUES (471, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612752439134,\"page\":1,\"limit\":10,\"code\":\"\"}', 58.65, '117.67.219.232', '2021-02-08 10:47:17');
INSERT INTO `operation_log` VALUES (472, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612752440537,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.34, '117.67.219.232', '2021-02-08 10:47:19');
INSERT INTO `operation_log` VALUES (473, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612752441685,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 56.37, '117.67.219.232', '2021-02-08 10:47:20');
INSERT INTO `operation_log` VALUES (474, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612752580893}', 1.79, '117.67.219.232', '2021-02-08 10:49:39');
INSERT INTO `operation_log` VALUES (475, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612752581633}', 1.72, '117.67.219.232', '2021-02-08 10:49:40');
INSERT INTO `operation_log` VALUES (476, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612752614647,\"id\":0,\"type\":1,\"menu_name\":\"\\u8c03\\u7528\\u8bb0\\u5f55\",\"parent_id\":0,\"url\":\"\",\"auth\":\"\",\"sort\":0,\"icon\":\"tubiao\"}', 2.78, '117.67.219.232', '2021-02-08 10:50:13');
INSERT INTO `operation_log` VALUES (477, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612752616192}', 2.80, '117.67.219.232', '2021-02-08 10:50:14');
INSERT INTO `operation_log` VALUES (478, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612752619692}', 1.70, '117.67.219.232', '2021-02-08 10:50:18');
INSERT INTO `operation_log` VALUES (479, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612752693964,\"id\":0,\"type\":2,\"menu_name\":\"\\u6bcf\\u65e5\\u7edf\\u8ba1\",\"parent_id\":63,\"url\":\"record\\/day_count\",\"auth\":\"\",\"sort\":0,\"icon\":\"shoucang\"}', 3.36, '117.67.219.232', '2021-02-08 10:51:32');
INSERT INTO `operation_log` VALUES (480, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612752695514}', 1.85, '117.67.219.232', '2021-02-08 10:51:34');
INSERT INTO `operation_log` VALUES (481, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612752707765}', 2.35, '117.67.219.232', '2021-02-08 10:51:46');
INSERT INTO `operation_log` VALUES (482, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612752727067,\"id\":0,\"type\":3,\"menu_name\":\"\\u6bcf\\u65e5\\u7edf\\u8ba1\\u5217\\u8868\",\"parent_id\":64,\"url\":\"\",\"auth\":\"day-list\",\"sort\":0,\"icon\":\"\"}', 2.86, '117.67.219.232', '2021-02-08 10:52:05');
INSERT INTO `operation_log` VALUES (483, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612752728610}', 1.95, '117.67.219.232', '2021-02-08 10:52:07');
INSERT INTO `operation_log` VALUES (484, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612752765964}', 1.75, '117.67.219.232', '2021-02-08 10:52:44');
INSERT INTO `operation_log` VALUES (485, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612752851448,\"id\":0,\"type\":2,\"menu_name\":\"\\u8bf7\\u6c42\\u8bb0\\u5f55\",\"parent_id\":63,\"url\":\"record\\/request\",\"auth\":0,\"sort\":0,\"icon\":\"request\"}', 3.05, '117.67.219.232', '2021-02-08 10:54:09');
INSERT INTO `operation_log` VALUES (486, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612752852998}', 1.89, '117.67.219.232', '2021-02-08 10:54:11');
INSERT INTO `operation_log` VALUES (487, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612752864374}', 1.74, '117.67.219.232', '2021-02-08 10:54:22');
INSERT INTO `operation_log` VALUES (488, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612752886444,\"id\":0,\"type\":3,\"menu_name\":\"\\u8bf7\\u6c42\\u8bb0\\u5f55\\u5217\\u8868\",\"parent_id\":66,\"url\":\"\",\"auth\":\"request-list\",\"sort\":0,\"icon\":\"\"}', 2.83, '117.67.219.232', '2021-02-08 10:54:44');
INSERT INTO `operation_log` VALUES (489, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612752887988}', 1.98, '117.67.219.232', '2021-02-08 10:54:46');
INSERT INTO `operation_log` VALUES (490, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612752905371}', 1.96, '117.67.219.232', '2021-02-08 10:55:03');
INSERT INTO `operation_log` VALUES (491, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612752966691,\"id\":0,\"type\":2,\"menu_name\":\"\\u8c03\\u7528\\u4e09\\u65b9\\u8bb0\\u5f55\",\"parent_id\":63,\"url\":\"record\\/third\",\"auth\":0,\"sort\":0,\"icon\":\"third\"}', 2.89, '117.67.219.232', '2021-02-08 10:56:05');
INSERT INTO `operation_log` VALUES (492, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612752968237}', 1.98, '117.67.219.232', '2021-02-08 10:56:06');
INSERT INTO `operation_log` VALUES (493, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612752969155}', 1.73, '117.67.219.232', '2021-02-08 10:56:07');
INSERT INTO `operation_log` VALUES (494, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612753000131,\"id\":0,\"type\":3,\"menu_name\":\"\\u8c03\\u7528\\u4e09\\u65b9\\u8bb0\\u5f55\\u5217\\u8868\",\"parent_id\":68,\"url\":\"\",\"auth\":\"third-list\",\"sort\":0,\"icon\":\"\"}', 3.49, '117.67.219.232', '2021-02-08 10:56:38');
INSERT INTO `operation_log` VALUES (495, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753001673}', 2.16, '117.67.219.232', '2021-02-08 10:56:40');
INSERT INTO `operation_log` VALUES (496, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753002787}', 1.63, '117.67.219.232', '2021-02-08 10:56:41');
INSERT INTO `operation_log` VALUES (497, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612753029283,\"id\":0,\"type\":2,\"menu_name\":\"\\u54cd\\u5e94\\u8bb0\\u5f55\",\"parent_id\":63,\"url\":\"record\\/response\",\"auth\":0,\"sort\":0,\"icon\":\"response\"}', 2.77, '117.67.219.232', '2021-02-08 10:57:07');
INSERT INTO `operation_log` VALUES (498, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753030825}', 2.05, '117.67.219.232', '2021-02-08 10:57:09');
INSERT INTO `operation_log` VALUES (499, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753037904}', 1.95, '117.67.219.232', '2021-02-08 10:57:16');
INSERT INTO `operation_log` VALUES (500, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612753051916,\"id\":0,\"type\":3,\"menu_name\":\"\\u54cd\\u5e94\\u8bb0\\u5f55\\u5217\\u8868\",\"parent_id\":70,\"url\":\"\",\"auth\":\"response-list\",\"sort\":0,\"icon\":0}', 4.43, '117.67.219.232', '2021-02-08 10:57:30');
INSERT INTO `operation_log` VALUES (501, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753053462}', 1.97, '117.67.219.232', '2021-02-08 10:57:31');
INSERT INTO `operation_log` VALUES (502, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612753056297,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.41, '117.67.219.232', '2021-02-08 10:57:34');
INSERT INTO `operation_log` VALUES (503, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753057433}', 1.85, '117.67.219.232', '2021-02-08 10:57:35');
INSERT INTO `operation_log` VALUES (504, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612753057433,\"id\":1}', 3.81, '117.67.219.232', '2021-02-08 10:57:35');
INSERT INTO `operation_log` VALUES (505, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612753059634,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[40,52,54,53,55,56,47,51,50,49,48,41,46,45,44,43,42,57,62,61,60,59,58,63,70,71,68,69,66,67,64,65,1,18,19,20,22,21,13,17,16,15,14,7,11,12,10,9,2,6,5,4,3,23,24,25,35,39,38,37,36,30,34,33,32,31,26,28,29,27]}', 6.50, '117.67.219.232', '2021-02-08 10:57:38');
INSERT INTO `operation_log` VALUES (506, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612753061183,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 46.08, '117.67.219.232', '2021-02-08 10:57:39');
INSERT INTO `operation_log` VALUES (507, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.07, '117.67.219.232', '2021-02-08 10:57:41');
INSERT INTO `operation_log` VALUES (508, 1, 'admin', '/admin/v1/info', '{\"t\":1612753062766}', 0.53, '117.67.219.232', '2021-02-08 10:57:41');
INSERT INTO `operation_log` VALUES (509, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612753062925,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.52, '117.67.219.232', '2021-02-08 10:57:41');
INSERT INTO `operation_log` VALUES (510, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612753068671,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 1.04, '117.67.219.232', '2021-02-08 10:57:47');
INSERT INTO `operation_log` VALUES (511, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612753069473,\"page\":1,\"limit\":10,\"ip\":\"\"}', 1.04, '117.67.219.232', '2021-02-08 10:57:47');
INSERT INTO `operation_log` VALUES (512, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612753070475,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 57.21, '117.67.219.232', '2021-02-08 10:57:49');
INSERT INTO `operation_log` VALUES (513, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612753070981,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 0.67, '117.67.219.232', '2021-02-08 10:57:49');
INSERT INTO `operation_log` VALUES (514, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753095576}', 1.98, '117.67.219.232', '2021-02-08 10:58:14');
INSERT INTO `operation_log` VALUES (515, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753105898}', 1.87, '117.67.219.232', '2021-02-08 10:58:24');
INSERT INTO `operation_log` VALUES (516, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612753105898,\"id\":25}', 0.85, '117.67.219.232', '2021-02-08 10:58:24');
INSERT INTO `operation_log` VALUES (517, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612753109262,\"id\":1}', 1.01, '117.67.219.232', '2021-02-08 10:58:27');
INSERT INTO `operation_log` VALUES (518, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753109262}', 1.82, '117.67.219.232', '2021-02-08 10:58:27');
INSERT INTO `operation_log` VALUES (519, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612753115828,\"id\":25}', 0.94, '117.67.219.232', '2021-02-08 10:58:34');
INSERT INTO `operation_log` VALUES (520, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753115827}', 1.82, '117.67.219.232', '2021-02-08 10:58:34');
INSERT INTO `operation_log` VALUES (521, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.76, '117.67.219.232', '2021-02-08 10:58:42');
INSERT INTO `operation_log` VALUES (522, 1, 'admin', '/admin/v1/info', '{\"t\":1612753123844}', 0.58, '117.67.219.232', '2021-02-08 10:58:42');
INSERT INTO `operation_log` VALUES (523, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753123993}', 2.21, '117.67.219.232', '2021-02-08 10:58:42');
INSERT INTO `operation_log` VALUES (524, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753125938}', 1.78, '117.67.219.232', '2021-02-08 10:58:44');
INSERT INTO `operation_log` VALUES (525, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612753125938,\"id\":25}', 0.79, '117.67.219.232', '2021-02-08 10:58:44');
INSERT INTO `operation_log` VALUES (526, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612753128948,\"id\":25,\"type\":1,\"menu_name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"parent_id\":0,\"url\":\"\",\"auth\":\"\",\"sort\":1,\"icon\":\"usermanage\"}', 3.34, '117.67.219.232', '2021-02-08 10:58:47');
INSERT INTO `operation_log` VALUES (527, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753130492}', 2.76, '117.67.219.232', '2021-02-08 10:58:49');
INSERT INTO `operation_log` VALUES (528, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612753137051,\"id\":40}', 0.95, '117.67.219.232', '2021-02-08 10:58:55');
INSERT INTO `operation_log` VALUES (529, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753137051}', 1.89, '117.67.219.232', '2021-02-08 10:58:55');
INSERT INTO `operation_log` VALUES (530, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.89, '117.67.219.232', '2021-02-08 10:58:59');
INSERT INTO `operation_log` VALUES (531, 1, 'admin', '/admin/v1/info', '{\"t\":1612753140877}', 0.60, '117.67.219.232', '2021-02-08 10:58:59');
INSERT INTO `operation_log` VALUES (532, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753141000}', 1.93, '117.67.219.232', '2021-02-08 10:58:59');
INSERT INTO `operation_log` VALUES (533, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753146525}', 1.83, '117.67.219.232', '2021-02-08 10:59:04');
INSERT INTO `operation_log` VALUES (534, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612753146525,\"id\":40}', 1.05, '117.67.219.232', '2021-02-08 10:59:05');
INSERT INTO `operation_log` VALUES (535, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612753148819,\"id\":40,\"type\":1,\"menu_name\":\"\\u63a5\\u53e3\\u7ba1\\u7406\",\"parent_id\":0,\"url\":\"\",\"auth\":\"\",\"sort\":2,\"icon\":\"mudedi\"}', 10.25, '117.67.219.232', '2021-02-08 10:59:07');
INSERT INTO `operation_log` VALUES (536, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753150369}', 1.97, '117.67.219.232', '2021-02-08 10:59:08');
INSERT INTO `operation_log` VALUES (537, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.73, '117.67.219.232', '2021-02-08 10:59:10');
INSERT INTO `operation_log` VALUES (538, 1, 'admin', '/admin/v1/info', '{\"t\":1612753151665}', 0.89, '117.67.219.232', '2021-02-08 10:59:10');
INSERT INTO `operation_log` VALUES (539, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753151797}', 2.22, '117.67.219.232', '2021-02-08 10:59:10');
INSERT INTO `operation_log` VALUES (540, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612753154692}', 3.75, '117.67.219.232', '2021-02-08 10:59:13');
INSERT INTO `operation_log` VALUES (541, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612753154692,\"id\":63}', 1.41, '117.67.219.232', '2021-02-08 10:59:13');
INSERT INTO `operation_log` VALUES (542, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612753157203,\"id\":63,\"type\":1,\"menu_name\":\"\\u8c03\\u7528\\u8bb0\\u5f55\",\"parent_id\":0,\"url\":\"\",\"auth\":\"\",\"sort\":3,\"icon\":\"tubiao\"}', 3.16, '117.67.219.232', '2021-02-08 10:59:15');
INSERT INTO `operation_log` VALUES (543, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753158753}', 2.42, '117.67.219.232', '2021-02-08 10:59:17');
INSERT INTO `operation_log` VALUES (544, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.25, '117.67.219.232', '2021-02-08 10:59:17');
INSERT INTO `operation_log` VALUES (545, 1, 'admin', '/admin/v1/info', '{\"t\":1612753159482}', 0.63, '117.67.219.232', '2021-02-08 10:59:17');
INSERT INTO `operation_log` VALUES (546, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753159613}', 2.04, '117.67.219.232', '2021-02-08 10:59:18');
INSERT INTO `operation_log` VALUES (547, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.87, '117.67.219.232', '2021-02-08 10:59:24');
INSERT INTO `operation_log` VALUES (548, 1, 'admin', '/admin/v1/info', '{\"t\":1612753165627}', 0.56, '117.67.219.232', '2021-02-08 10:59:24');
INSERT INTO `operation_log` VALUES (549, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612753165740}', 2.10, '117.67.219.232', '2021-02-08 10:59:24');
INSERT INTO `operation_log` VALUES (550, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612753180721,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.66, '117.67.219.232', '2021-02-08 10:59:39');
INSERT INTO `operation_log` VALUES (551, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612753182444}', 0.48, '117.67.219.232', '2021-02-08 10:59:40');
INSERT INTO `operation_log` VALUES (552, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612753209295,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 55.90, '117.67.219.232', '2021-02-08 11:00:07');
INSERT INTO `operation_log` VALUES (553, 1, 'admin', '/admin/v1/supplier/add', '{\"t\":1612753219267,\"id\":0,\"supplier_name\":\"\\u767e\\u5ea6\\u5730\\u56fe\",\"mobile\":\"\"}', 3.08, '117.67.219.232', '2021-02-08 11:00:17');
INSERT INTO `operation_log` VALUES (554, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612753220829,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 57.00, '117.67.219.232', '2021-02-08 11:00:19');
INSERT INTO `operation_log` VALUES (555, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612753223125,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.48, '117.67.219.232', '2021-02-08 11:00:21');
INSERT INTO `operation_log` VALUES (556, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612753238375,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.80, '117.67.219.232', '2021-02-08 11:00:36');
INSERT INTO `operation_log` VALUES (557, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612753241469,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.42, '117.67.219.232', '2021-02-08 11:00:40');
INSERT INTO `operation_log` VALUES (558, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.71, '117.67.219.232', '2021-02-08 11:07:12');
INSERT INTO `operation_log` VALUES (559, 1, 'admin', '/admin/v1/info', '{\"t\":1612753633741}', 0.67, '117.67.219.232', '2021-02-08 11:07:12');
INSERT INTO `operation_log` VALUES (560, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612753633928,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.34, '117.67.219.232', '2021-02-08 11:07:12');
INSERT INTO `operation_log` VALUES (561, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.87, '117.67.219.232', '2021-02-08 11:16:52');
INSERT INTO `operation_log` VALUES (562, 1, 'admin', '/admin/v1/info', '{\"t\":1612754213607}', 0.64, '117.67.219.232', '2021-02-08 11:16:52');
INSERT INTO `operation_log` VALUES (563, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612754213790,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.21, '117.67.219.232', '2021-02-08 11:16:52');
INSERT INTO `operation_log` VALUES (564, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612754216216,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 59.38, '117.67.219.232', '2021-02-08 11:16:54');
INSERT INTO `operation_log` VALUES (565, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754238971}', 2.36, '117.67.219.232', '2021-02-08 11:17:17');
INSERT INTO `operation_log` VALUES (566, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612754386208}', 1.90, '117.67.219.232', '2021-02-08 11:19:44');
INSERT INTO `operation_log` VALUES (567, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612754386208,\"id\":47}', 0.90, '117.67.219.232', '2021-02-08 11:19:44');
INSERT INTO `operation_log` VALUES (568, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612754388920,\"id\":47,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\\u4f9b\\u5e94\\u5546\",\"parent_id\":40,\"url\":\"api\\/supplier\",\"auth\":\"\",\"sort\":1,\"icon\":\"geren\"}', 3.70, '117.67.219.232', '2021-02-08 11:19:47');
INSERT INTO `operation_log` VALUES (569, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754390468}', 2.25, '117.67.219.232', '2021-02-08 11:19:48');
INSERT INTO `operation_log` VALUES (570, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612754418484,\"id\":52}', 1.76, '117.67.219.232', '2021-02-08 11:20:16');
INSERT INTO `operation_log` VALUES (571, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612754418484}', 2.16, '117.67.219.232', '2021-02-08 11:20:16');
INSERT INTO `operation_log` VALUES (572, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.25, '117.67.219.232', '2021-02-08 11:20:20');
INSERT INTO `operation_log` VALUES (573, 1, 'admin', '/admin/v1/info', '{\"t\":1612754421997}', 0.64, '117.67.219.232', '2021-02-08 11:20:20');
INSERT INTO `operation_log` VALUES (574, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754422129}', 2.03, '117.67.219.232', '2021-02-08 11:20:20');
INSERT INTO `operation_log` VALUES (575, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612754426373}', 2.04, '117.67.219.232', '2021-02-08 11:20:24');
INSERT INTO `operation_log` VALUES (576, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612754426373,\"id\":52}', 0.84, '117.67.219.232', '2021-02-08 11:20:24');
INSERT INTO `operation_log` VALUES (577, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612754428708,\"id\":52,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\\u72b6\\u6001\\u7801\",\"parent_id\":40,\"url\":\"api\\/code\",\"auth\":\"\",\"sort\":2,\"icon\":\"pinglun\"}', 3.43, '117.67.219.232', '2021-02-08 11:20:27');
INSERT INTO `operation_log` VALUES (578, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754430259}', 1.92, '117.67.219.232', '2021-02-08 11:20:28');
INSERT INTO `operation_log` VALUES (579, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.95, '117.67.219.232', '2021-02-08 11:20:29');
INSERT INTO `operation_log` VALUES (580, 1, 'admin', '/admin/v1/info', '{\"t\":1612754431105}', 0.58, '117.67.219.232', '2021-02-08 11:20:29');
INSERT INTO `operation_log` VALUES (581, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754431234}', 2.11, '117.67.219.232', '2021-02-08 11:20:29');
INSERT INTO `operation_log` VALUES (582, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612754438183}', 2.02, '117.67.219.232', '2021-02-08 11:20:36');
INSERT INTO `operation_log` VALUES (583, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612754438183,\"id\":57}', 0.85, '117.67.219.232', '2021-02-08 11:20:36');
INSERT INTO `operation_log` VALUES (584, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612754440716,\"id\":57,\"type\":2,\"menu_name\":\"\\u4f9b\\u5e94\\u5546\\u63a5\\u53e3\",\"parent_id\":40,\"url\":\"api\\/supplier_api\",\"auth\":\"\",\"sort\":3,\"icon\":\"userapi\"}', 3.56, '117.67.219.232', '2021-02-08 11:20:39');
INSERT INTO `operation_log` VALUES (585, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754442261}', 2.08, '117.67.219.232', '2021-02-08 11:20:40');
INSERT INTO `operation_log` VALUES (586, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.74, '117.67.219.232', '2021-02-08 11:20:42');
INSERT INTO `operation_log` VALUES (587, 1, 'admin', '/admin/v1/info', '{\"t\":1612754443785}', 0.59, '117.67.219.232', '2021-02-08 11:20:42');
INSERT INTO `operation_log` VALUES (588, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754443907}', 2.25, '117.67.219.232', '2021-02-08 11:20:42');
INSERT INTO `operation_log` VALUES (589, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612754449849,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 56.98, '117.67.219.232', '2021-02-08 11:20:48');
INSERT INTO `operation_log` VALUES (590, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612754451324}', 1.38, '117.67.219.232', '2021-02-08 11:20:49');
INSERT INTO `operation_log` VALUES (591, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612754451324,\"page\":1,\"limit\":10,\"code\":\"\"}', 57.74, '117.67.219.232', '2021-02-08 11:20:49');
INSERT INTO `operation_log` VALUES (592, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612754452576,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 47.97, '117.67.219.232', '2021-02-08 11:20:51');
INSERT INTO `operation_log` VALUES (593, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612754457598,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 51.44, '117.67.219.232', '2021-02-08 11:20:56');
INSERT INTO `operation_log` VALUES (594, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612754463736,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 1.00, '117.67.219.232', '2021-02-08 11:21:02');
INSERT INTO `operation_log` VALUES (595, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612754466600,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 57.13, '117.67.219.232', '2021-02-08 11:21:05');
INSERT INTO `operation_log` VALUES (596, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754469873}', 2.06, '117.67.219.232', '2021-02-08 11:21:08');
INSERT INTO `operation_log` VALUES (597, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612754478622}', 1.99, '117.67.219.232', '2021-02-08 11:21:17');
INSERT INTO `operation_log` VALUES (598, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612754478622,\"id\":35}', 0.76, '117.67.219.232', '2021-02-08 11:21:17');
INSERT INTO `operation_log` VALUES (599, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612754480443,\"id\":35,\"type\":2,\"menu_name\":\"\\u7528\\u6237\\u63a5\\u53e3\",\"parent_id\":25,\"url\":\"user\\/user-api\",\"auth\":\"\",\"sort\":1,\"icon\":\"userapi\"}', 3.10, '117.67.219.232', '2021-02-08 11:21:18');
INSERT INTO `operation_log` VALUES (600, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.07, '117.67.219.232', '2021-02-08 11:21:20');
INSERT INTO `operation_log` VALUES (601, 1, 'admin', '/admin/v1/info', '{\"t\":1612754482282}', 0.73, '117.67.219.232', '2021-02-08 11:21:20');
INSERT INTO `operation_log` VALUES (602, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754482407}', 1.95, '117.67.219.232', '2021-02-08 11:21:20');
INSERT INTO `operation_log` VALUES (603, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612754495469}', 2.02, '117.67.219.232', '2021-02-08 11:21:33');
INSERT INTO `operation_log` VALUES (604, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612754495470,\"id\":30}', 0.75, '117.67.219.232', '2021-02-08 11:21:33');
INSERT INTO `operation_log` VALUES (605, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612754497747,\"id\":30,\"type\":2,\"menu_name\":\"IP\\u7ba1\\u7406\",\"parent_id\":25,\"url\":\"user\\/ip\",\"auth\":\"\",\"sort\":1,\"icon\":\"dangdifill\"}', 3.79, '117.67.219.232', '2021-02-08 11:21:36');
INSERT INTO `operation_log` VALUES (606, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754499292}', 2.19, '117.67.219.232', '2021-02-08 11:21:37');
INSERT INTO `operation_log` VALUES (607, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.83, '117.67.219.232', '2021-02-08 11:21:39');
INSERT INTO `operation_log` VALUES (608, 1, 'admin', '/admin/v1/info', '{\"t\":1612754501498}', 0.67, '117.67.219.232', '2021-02-08 11:21:39');
INSERT INTO `operation_log` VALUES (609, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612754501621}', 1.91, '117.67.219.232', '2021-02-08 11:21:40');
INSERT INTO `operation_log` VALUES (610, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612754505522,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 57.76, '117.67.219.232', '2021-02-08 11:21:44');
INSERT INTO `operation_log` VALUES (611, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612754506995,\"page\":1,\"limit\":10,\"ip\":\"\"}', 33.77, '117.67.219.232', '2021-02-08 11:21:45');
INSERT INTO `operation_log` VALUES (612, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.91, '117.67.219.232', '2021-02-08 11:27:30');
INSERT INTO `operation_log` VALUES (613, 1, 'admin', '/admin/v1/info', '{\"t\":1612754852116}', 0.66, '117.67.219.232', '2021-02-08 11:27:30');
INSERT INTO `operation_log` VALUES (614, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612754858540,\"page\":1,\"limit\":10,\"ip\":\"\"}', 0.87, '117.67.219.232', '2021-02-08 11:27:37');
INSERT INTO `operation_log` VALUES (615, 1, 'admin', '/admin/v1/ip/add', '{\"t\":1612754862123,\"ip\":\"60.168.69.22\",\"remark\":\"\"}', 3.52, '117.67.219.232', '2021-02-08 11:27:40');
INSERT INTO `operation_log` VALUES (616, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612754863669,\"page\":1,\"limit\":10,\"ip\":\"\"}', 56.22, '117.67.219.232', '2021-02-08 11:27:42');
INSERT INTO `operation_log` VALUES (617, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612754870141,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 57.06, '117.67.219.232', '2021-02-08 11:27:48');
INSERT INTO `operation_log` VALUES (618, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612755283707,\"page\":1,\"limit\":10,\"ip\":\"\"}', 56.50, '117.67.219.232', '2021-02-08 11:34:42');
INSERT INTO `operation_log` VALUES (619, 1, 'admin', '/admin/v1/ip/refresh', '{\"t\":1612755307723,\"id\":1}', 1.38, '117.67.219.232', '2021-02-08 11:35:06');
INSERT INTO `operation_log` VALUES (620, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612755388107,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 56.78, '117.67.219.232', '2021-02-08 11:36:26');
INSERT INTO `operation_log` VALUES (621, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612755570158,\"page\":1,\"limit\":10,\"ip\":\"\"}', 92.40, '117.67.219.232', '2021-02-08 11:39:28');
INSERT INTO `operation_log` VALUES (622, 1, 'admin', '/admin/v1/ip/add', '{\"t\":1612755573134,\"ip\":\"117.67.219.232\",\"remark\":\"\"}', 5.22, '117.67.219.232', '2021-02-08 11:39:31');
INSERT INTO `operation_log` VALUES (623, 1, 'admin', '/admin/v1/ip/index', '{\"t\":1612755574679,\"page\":1,\"limit\":10,\"ip\":\"\"}', 57.09, '117.67.219.232', '2021-02-08 11:39:33');
INSERT INTO `operation_log` VALUES (624, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612755586676,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 0.64, '117.67.219.232', '2021-02-08 11:39:45');
INSERT INTO `operation_log` VALUES (625, 1, 'admin', '/admin/v1/user/all', '{\"t\":1612755588050}', 0.70, '117.67.219.232', '2021-02-08 11:39:46');
INSERT INTO `operation_log` VALUES (626, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612755596831,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.00, '117.67.219.232', '2021-02-08 11:39:55');
INSERT INTO `operation_log` VALUES (627, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612755601915,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 56.48, '117.67.219.232', '2021-02-08 11:40:00');
INSERT INTO `operation_log` VALUES (628, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612755603540,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 0.92, '117.67.219.232', '2021-02-08 11:40:02');
INSERT INTO `operation_log` VALUES (629, 1, 'admin', '/admin/v1/user/all', '{\"t\":1612755604660}', 0.67, '117.67.219.232', '2021-02-08 11:40:03');
INSERT INTO `operation_log` VALUES (630, 1, 'admin', '/admin/v1/userapi/add', '{\"t\":1612755617171,\"user_id\":1,\"num\":\"API00001\",\"number\":\"10\",\"price\":\"0\",\"expire_at\":\"\"}', 4.65, '117.67.219.232', '2021-02-08 11:40:15');
INSERT INTO `operation_log` VALUES (631, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612755618722,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 57.93, '117.67.219.232', '2021-02-08 11:40:17');
INSERT INTO `operation_log` VALUES (632, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.87, '117.67.219.232', '2021-02-08 11:40:20');
INSERT INTO `operation_log` VALUES (633, 1, 'admin', '/admin/v1/info', '{\"t\":1612755621839}', 0.71, '117.67.219.232', '2021-02-08 11:40:20');
INSERT INTO `operation_log` VALUES (634, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612755621996,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 57.26, '117.67.219.232', '2021-02-08 11:40:20');
INSERT INTO `operation_log` VALUES (635, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612755633656,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.15, '117.67.219.232', '2021-02-08 11:40:32');
INSERT INTO `operation_log` VALUES (636, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755633656}', 0.36, '117.67.219.232', '2021-02-08 11:40:32');
INSERT INTO `operation_log` VALUES (637, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755635209}', 0.27, '117.67.219.232', '2021-02-08 11:40:33');
INSERT INTO `operation_log` VALUES (638, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612755635209,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.61, '117.67.219.232', '2021-02-08 11:40:33');
INSERT INTO `operation_log` VALUES (639, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755639035}', 0.46, '117.67.219.232', '2021-02-08 11:40:37');
INSERT INTO `operation_log` VALUES (640, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612755639036,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.85, '117.67.219.232', '2021-02-08 11:40:37');
INSERT INTO `operation_log` VALUES (641, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612755639933,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.01, '117.67.219.232', '2021-02-08 11:40:38');
INSERT INTO `operation_log` VALUES (642, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755639933}', 0.27, '117.67.219.232', '2021-02-08 11:40:38');
INSERT INTO `operation_log` VALUES (643, 1, 'admin', '/admin/v1/userApiDay/index', '{\"t\":1612755641382,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.02, '117.67.219.232', '2021-02-08 11:40:39');
INSERT INTO `operation_log` VALUES (644, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612755642325,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.06, '117.67.219.232', '2021-02-08 11:40:40');
INSERT INTO `operation_log` VALUES (645, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755642324}', 0.25, '117.67.219.232', '2021-02-08 11:40:40');
INSERT INTO `operation_log` VALUES (646, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755642869}', 0.32, '117.67.219.232', '2021-02-08 11:40:41');
INSERT INTO `operation_log` VALUES (647, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612755642869,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 55.74, '117.67.219.232', '2021-02-08 11:40:41');
INSERT INTO `operation_log` VALUES (648, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755643853}', 0.41, '117.67.219.232', '2021-02-08 11:40:42');
INSERT INTO `operation_log` VALUES (649, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612755643853,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.48, '117.67.219.232', '2021-02-08 11:40:42');
INSERT INTO `operation_log` VALUES (650, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755644750}', 0.34, '117.67.219.232', '2021-02-08 11:40:43');
INSERT INTO `operation_log` VALUES (651, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612755644750,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.93, '117.67.219.232', '2021-02-08 11:40:43');
INSERT INTO `operation_log` VALUES (652, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.78, '117.67.219.232', '2021-02-08 11:40:46');
INSERT INTO `operation_log` VALUES (653, 1, 'admin', '/admin/v1/info', '{\"t\":1612755648086}', 0.64, '117.67.219.232', '2021-02-08 11:40:46');
INSERT INTO `operation_log` VALUES (654, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755648250}', 0.35, '117.67.219.232', '2021-02-08 11:40:46');
INSERT INTO `operation_log` VALUES (655, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612755648250,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 52.31, '117.67.219.232', '2021-02-08 11:40:46');
INSERT INTO `operation_log` VALUES (656, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755649447}', 0.43, '117.67.219.232', '2021-02-08 11:40:47');
INSERT INTO `operation_log` VALUES (657, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612755649447,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.34, '117.67.219.232', '2021-02-08 11:40:47');
INSERT INTO `operation_log` VALUES (658, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755650552}', 0.37, '117.67.219.232', '2021-02-08 11:40:49');
INSERT INTO `operation_log` VALUES (659, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612755650552,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 0.89, '117.67.219.232', '2021-02-08 11:40:49');
INSERT INTO `operation_log` VALUES (660, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612755651430}', 0.47, '117.67.219.232', '2021-02-08 11:40:49');
INSERT INTO `operation_log` VALUES (661, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612755651430,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 57.98, '117.67.219.232', '2021-02-08 11:40:50');
INSERT INTO `operation_log` VALUES (662, 1, 'admin', '/admin/v1/userapi/index', '{\"t\":1612755717569,\"page\":1,\"limit\":10,\"nickname\":\"\",\"api_name\":\"\"}', 57.52, '117.67.219.232', '2021-02-08 11:41:56');
INSERT INTO `operation_log` VALUES (663, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612756131242,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 56.39, '117.67.219.232', '2021-02-08 11:48:49');
INSERT INTO `operation_log` VALUES (664, 1, 'admin', '/admin/v1/user/refresh', '{\"t\":1612756133381,\"id\":1}', 1.29, '117.67.219.232', '2021-02-08 11:48:51');
INSERT INTO `operation_log` VALUES (665, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.74, '117.67.219.232', '2021-02-08 11:54:57');
INSERT INTO `operation_log` VALUES (666, 1, 'admin', '/admin/v1/info', '{\"t\":1612756498644}', 0.54, '117.67.219.232', '2021-02-08 11:54:57');
INSERT INTO `operation_log` VALUES (667, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612756498829,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 56.66, '117.67.219.232', '2021-02-08 11:54:57');
INSERT INTO `operation_log` VALUES (668, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756502528}', 0.36, '117.67.219.232', '2021-02-08 11:55:01');
INSERT INTO `operation_log` VALUES (669, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612756502528,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 70.34, '117.67.219.232', '2021-02-08 11:55:01');
INSERT INTO `operation_log` VALUES (670, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756503868}', 0.24, '117.67.219.232', '2021-02-08 11:55:02');
INSERT INTO `operation_log` VALUES (671, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612756503868,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.54, '117.67.219.232', '2021-02-08 11:55:02');
INSERT INTO `operation_log` VALUES (672, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756504627}', 11.23, '117.67.219.232', '2021-02-08 11:55:03');
INSERT INTO `operation_log` VALUES (673, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612756504627,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 50.27, '117.67.219.232', '2021-02-08 11:55:03');
INSERT INTO `operation_log` VALUES (674, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756507529}', 0.29, '117.67.219.232', '2021-02-08 11:55:06');
INSERT INTO `operation_log` VALUES (675, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612756507529,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.37, '117.67.219.232', '2021-02-08 11:55:06');
INSERT INTO `operation_log` VALUES (676, 1, 'admin', '/admin/v1/user/index', '{\"t\":1612756508465,\"page\":1,\"limit\":10,\"nickname\":\"\",\"status\":\"\"}', 56.83, '117.67.219.232', '2021-02-08 11:55:07');
INSERT INTO `operation_log` VALUES (677, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756512912}', 1.99, '117.67.219.232', '2021-02-08 11:55:11');
INSERT INTO `operation_log` VALUES (678, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612756528585,\"id\":68}', 0.91, '117.67.219.232', '2021-02-08 11:55:27');
INSERT INTO `operation_log` VALUES (679, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612756528585}', 2.05, '117.67.219.232', '2021-02-08 11:55:27');
INSERT INTO `operation_log` VALUES (680, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.03, '117.67.219.232', '2021-02-08 11:55:32');
INSERT INTO `operation_log` VALUES (681, 1, 'admin', '/admin/v1/info', '{\"t\":1612756534560}', 0.57, '117.67.219.232', '2021-02-08 11:55:33');
INSERT INTO `operation_log` VALUES (682, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756534705}', 2.36, '117.67.219.232', '2021-02-08 11:55:33');
INSERT INTO `operation_log` VALUES (683, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612756540943}', 1.70, '117.67.219.232', '2021-02-08 11:55:39');
INSERT INTO `operation_log` VALUES (684, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612756540943,\"id\":68}', 0.76, '117.67.219.232', '2021-02-08 11:55:39');
INSERT INTO `operation_log` VALUES (685, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612756543292,\"id\":68,\"type\":2,\"menu_name\":\"\\u8c03\\u7528\\u4e09\\u65b9\\u8bb0\\u5f55\",\"parent_id\":63,\"url\":\"record\\/third\",\"auth\":\"0\",\"sort\":1,\"icon\":\"third\"}', 3.68, '117.67.219.232', '2021-02-08 11:55:41');
INSERT INTO `operation_log` VALUES (686, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756544840}', 2.41, '117.67.219.232', '2021-02-08 11:55:43');
INSERT INTO `operation_log` VALUES (687, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.67, '117.67.219.232', '2021-02-08 11:55:43');
INSERT INTO `operation_log` VALUES (688, 1, 'admin', '/admin/v1/info', '{\"t\":1612756545566}', 0.58, '117.67.219.232', '2021-02-08 11:55:44');
INSERT INTO `operation_log` VALUES (689, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756545700}', 2.10, '117.67.219.232', '2021-02-08 11:55:44');
INSERT INTO `operation_log` VALUES (690, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612756551271,\"id\":70}', 1.81, '117.67.219.232', '2021-02-08 11:55:49');
INSERT INTO `operation_log` VALUES (691, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612756551271}', 2.10, '117.67.219.232', '2021-02-08 11:55:49');
INSERT INTO `operation_log` VALUES (692, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.95, '117.67.219.232', '2021-02-08 11:55:55');
INSERT INTO `operation_log` VALUES (693, 1, 'admin', '/admin/v1/info', '{\"t\":1612756557240}', 0.52, '117.67.219.232', '2021-02-08 11:55:55');
INSERT INTO `operation_log` VALUES (694, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756557374}', 1.97, '117.67.219.232', '2021-02-08 11:55:55');
INSERT INTO `operation_log` VALUES (695, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612756562786,\"id\":70}', 1.79, '117.67.219.232', '2021-02-08 11:56:01');
INSERT INTO `operation_log` VALUES (696, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612756562785}', 2.02, '117.67.219.232', '2021-02-08 11:56:01');
INSERT INTO `operation_log` VALUES (697, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.69, '117.67.219.232', '2021-02-08 11:56:06');
INSERT INTO `operation_log` VALUES (698, 1, 'admin', '/admin/v1/info', '{\"t\":1612756568426}', 0.60, '117.67.219.232', '2021-02-08 11:56:06');
INSERT INTO `operation_log` VALUES (699, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756568563}', 2.01, '117.67.219.232', '2021-02-08 11:56:07');
INSERT INTO `operation_log` VALUES (700, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612756575613,\"id\":70}', 1.98, '117.67.219.232', '2021-02-08 11:56:14');
INSERT INTO `operation_log` VALUES (701, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612756575613}', 2.24, '117.67.219.232', '2021-02-08 11:56:14');
INSERT INTO `operation_log` VALUES (702, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612756588207,\"id\":70,\"type\":2,\"menu_name\":\"\\u54cd\\u5e94\\u8bb0\\u5f55\",\"parent_id\":63,\"url\":\"record\\/response\",\"auth\":\"0\",\"sort\":1,\"icon\":\"response\"}', 4.24, '117.67.219.232', '2021-02-08 11:56:26');
INSERT INTO `operation_log` VALUES (703, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756589755}', 2.12, '117.67.219.232', '2021-02-08 11:56:28');
INSERT INTO `operation_log` VALUES (704, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612756594141,\"id\":64}', 1.88, '117.67.219.232', '2021-02-08 11:56:32');
INSERT INTO `operation_log` VALUES (705, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612756594141}', 2.28, '117.67.219.232', '2021-02-08 11:56:32');
INSERT INTO `operation_log` VALUES (706, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612756602764,\"id\":64,\"type\":2,\"menu_name\":\"\\u54cd\\u5e94\\u8bb0\\u5f55\",\"parent_id\":63,\"url\":\"record\\/response\",\"auth\":\"\",\"sort\":4,\"icon\":\"response\"}', 3.64, '117.67.219.232', '2021-02-08 11:56:41');
INSERT INTO `operation_log` VALUES (707, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756604434}', 2.42, '117.67.219.232', '2021-02-08 11:56:42');
INSERT INTO `operation_log` VALUES (708, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.78, '117.67.219.232', '2021-02-08 11:56:45');
INSERT INTO `operation_log` VALUES (709, 1, 'admin', '/admin/v1/info', '{\"t\":1612756607192}', 0.52, '117.67.219.232', '2021-02-08 11:56:45');
INSERT INTO `operation_log` VALUES (710, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612756607319}', 2.20, '117.67.219.232', '2021-02-08 11:56:45');
INSERT INTO `operation_log` VALUES (711, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756610304}', 0.65, '117.67.219.232', '2021-02-08 11:56:48');
INSERT INTO `operation_log` VALUES (712, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612756610304,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 57.97, '117.67.219.232', '2021-02-08 11:56:48');
INSERT INTO `operation_log` VALUES (713, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756612313}', 0.30, '117.67.219.232', '2021-02-08 11:56:50');
INSERT INTO `operation_log` VALUES (714, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612756612313,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.15, '117.67.219.232', '2021-02-08 11:56:50');
INSERT INTO `operation_log` VALUES (715, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756614826}', 0.31, '117.67.219.232', '2021-02-08 11:56:53');
INSERT INTO `operation_log` VALUES (716, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612756614827,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 62.25, '117.67.219.232', '2021-02-08 11:56:53');
INSERT INTO `operation_log` VALUES (717, 1, 'admin', '/admin/v1/request/detail', '{\"t\":1612756621061,\"unique_number\":\"217246595853328385\"}', 3.53, '117.67.219.232', '2021-02-08 11:56:59');
INSERT INTO `operation_log` VALUES (718, 1, 'admin', '/admin/v1/request/detail', '{\"t\":1612756622515,\"unique_number\":\"217246595853328385\"}', 3.37, '117.67.219.232', '2021-02-08 11:57:01');
INSERT INTO `operation_log` VALUES (719, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.60, '117.67.219.232', '2021-02-08 11:57:59');
INSERT INTO `operation_log` VALUES (720, 1, 'admin', '/admin/v1/info', '{\"t\":1612756681093}', 0.52, '117.67.219.232', '2021-02-08 11:57:59');
INSERT INTO `operation_log` VALUES (721, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756681281}', 0.85, '117.67.219.232', '2021-02-08 11:57:59');
INSERT INTO `operation_log` VALUES (722, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612756681281,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 0.80, '117.67.219.232', '2021-02-08 11:57:59');
INSERT INTO `operation_log` VALUES (723, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612756683079,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 1.92, '117.67.219.232', '2021-02-08 11:58:01');
INSERT INTO `operation_log` VALUES (724, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756683079}', 0.66, '117.67.219.232', '2021-02-08 11:58:01');
INSERT INTO `operation_log` VALUES (725, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756688707}', 0.47, '117.67.219.232', '2021-02-08 11:58:07');
INSERT INTO `operation_log` VALUES (726, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612756688708,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 56.83, '117.67.219.232', '2021-02-08 11:58:07');
INSERT INTO `operation_log` VALUES (727, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756688981}', 0.26, '117.67.219.232', '2021-02-08 11:58:07');
INSERT INTO `operation_log` VALUES (728, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612756688981,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 65.44, '117.67.219.232', '2021-02-08 11:58:07');
INSERT INTO `operation_log` VALUES (729, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756690756}', 0.30, '117.67.219.232', '2021-02-08 11:58:09');
INSERT INTO `operation_log` VALUES (730, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612756690756,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 62.06, '117.67.219.232', '2021-02-08 11:58:09');
INSERT INTO `operation_log` VALUES (731, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756691182}', 0.27, '117.67.219.232', '2021-02-08 11:58:09');
INSERT INTO `operation_log` VALUES (732, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612756691182,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 47.70, '117.67.219.232', '2021-02-08 11:58:09');
INSERT INTO `operation_log` VALUES (733, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612756692418}', 0.35, '117.67.219.232', '2021-02-08 11:58:10');
INSERT INTO `operation_log` VALUES (734, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612756692419,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 62.89, '117.67.219.232', '2021-02-08 11:58:11');
INSERT INTO `operation_log` VALUES (735, 1, 'admin', '/admin/v1/request/detail', '{\"t\":1612756693523,\"unique_number\":\"217251038523039744\"}', 5.90, '117.67.219.232', '2021-02-08 11:58:12');
INSERT INTO `operation_log` VALUES (736, 1, 'admin', '/admin/v1/request/detail', '{\"t\":1612758989265,\"unique_number\":\"217251038523039744\"}', 5.81, '117.67.219.232', '2021-02-08 12:36:27');
INSERT INTO `operation_log` VALUES (737, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759012542}', 0.64, '117.67.219.232', '2021-02-08 12:36:51');
INSERT INTO `operation_log` VALUES (738, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759012542,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 57.11, '117.67.219.232', '2021-02-08 12:36:51');
INSERT INTO `operation_log` VALUES (739, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759013058}', 0.26, '117.67.219.232', '2021-02-08 12:36:51');
INSERT INTO `operation_log` VALUES (740, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612759013058,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.88, '117.67.219.232', '2021-02-08 12:36:51');
INSERT INTO `operation_log` VALUES (741, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759013555}', 0.41, '117.67.219.232', '2021-02-08 12:36:52');
INSERT INTO `operation_log` VALUES (742, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759013555,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 57.04, '117.67.219.232', '2021-02-08 12:36:52');
INSERT INTO `operation_log` VALUES (743, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759015065}', 0.29, '117.67.219.232', '2021-02-08 12:36:53');
INSERT INTO `operation_log` VALUES (744, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612759015065,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.93, '117.67.219.232', '2021-02-08 12:36:53');
INSERT INTO `operation_log` VALUES (745, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759015535}', 0.36, '117.67.219.232', '2021-02-08 12:36:54');
INSERT INTO `operation_log` VALUES (746, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759015536,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 51.33, '117.67.219.232', '2021-02-08 12:36:54');
INSERT INTO `operation_log` VALUES (747, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759016824}', 0.26, '117.67.219.232', '2021-02-08 12:36:55');
INSERT INTO `operation_log` VALUES (748, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612759016825,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 59.23, '117.67.219.232', '2021-02-08 12:36:55');
INSERT INTO `operation_log` VALUES (749, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759017398}', 10.69, '117.67.219.232', '2021-02-08 12:36:56');
INSERT INTO `operation_log` VALUES (750, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759017398,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 59.93, '117.67.219.232', '2021-02-08 12:36:56');
INSERT INTO `operation_log` VALUES (751, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759018806}', 0.27, '117.67.219.232', '2021-02-08 12:36:57');
INSERT INTO `operation_log` VALUES (752, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612759018806,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.26, '117.67.219.232', '2021-02-08 12:36:57');
INSERT INTO `operation_log` VALUES (753, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759019150}', 0.41, '117.67.219.232', '2021-02-08 12:36:57');
INSERT INTO `operation_log` VALUES (754, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759019150,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 54.77, '117.67.219.232', '2021-02-08 12:36:57');
INSERT INTO `operation_log` VALUES (755, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759019680}', 0.26, '117.67.219.232', '2021-02-08 12:36:58');
INSERT INTO `operation_log` VALUES (756, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612759019681,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 59.21, '117.67.219.232', '2021-02-08 12:36:58');
INSERT INTO `operation_log` VALUES (757, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759020129}', 0.27, '117.67.219.232', '2021-02-08 12:36:58');
INSERT INTO `operation_log` VALUES (758, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759020129,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 50.29, '117.67.219.232', '2021-02-08 12:36:58');
INSERT INTO `operation_log` VALUES (759, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759020908}', 0.30, '117.67.219.232', '2021-02-08 12:36:59');
INSERT INTO `operation_log` VALUES (760, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612759020908,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.00, '117.67.219.232', '2021-02-08 12:36:59');
INSERT INTO `operation_log` VALUES (761, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759021301}', 11.37, '117.67.219.232', '2021-02-08 12:36:59');
INSERT INTO `operation_log` VALUES (762, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759021301,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 60.36, '117.67.219.232', '2021-02-08 12:36:59');
INSERT INTO `operation_log` VALUES (763, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759022456}', 0.27, '117.67.219.232', '2021-02-08 12:37:00');
INSERT INTO `operation_log` VALUES (764, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612759022456,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 57.50, '117.67.219.232', '2021-02-08 12:37:01');
INSERT INTO `operation_log` VALUES (765, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759023118}', 0.27, '117.67.219.232', '2021-02-08 12:37:01');
INSERT INTO `operation_log` VALUES (766, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759023118,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 61.71, '117.67.219.232', '2021-02-08 12:37:01');
INSERT INTO `operation_log` VALUES (767, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759025467}', 0.33, '117.67.219.232', '2021-02-08 12:37:04');
INSERT INTO `operation_log` VALUES (768, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612759025467,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 61.66, '117.67.219.232', '2021-02-08 12:37:04');
INSERT INTO `operation_log` VALUES (769, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612759028642}', 0.31, '117.67.219.232', '2021-02-08 12:37:07');
INSERT INTO `operation_log` VALUES (770, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612759028642,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 60.84, '117.67.219.232', '2021-02-08 12:37:07');
INSERT INTO `operation_log` VALUES (771, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759043279}', 2.26, '117.67.219.232', '2021-02-08 12:37:21');
INSERT INTO `operation_log` VALUES (772, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759067205}', 1.82, '117.67.219.232', '2021-02-08 12:37:45');
INSERT INTO `operation_log` VALUES (773, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612759067206,\"id\":64}', 0.76, '117.67.219.232', '2021-02-08 12:37:45');
INSERT INTO `operation_log` VALUES (774, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612759103965,\"id\":64,\"type\":2,\"menu_name\":\"\\u6bcf\\u65e5\\u7edf\\u8ba1\",\"parent_id\":63,\"url\":\"record\\/day_count\",\"auth\":\"\",\"sort\":4,\"icon\":\"day\"}', 31.53, '117.67.219.232', '2021-02-08 12:38:22');
INSERT INTO `operation_log` VALUES (775, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759105541}', 2.16, '117.67.219.232', '2021-02-08 12:38:24');
INSERT INTO `operation_log` VALUES (776, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.96, '117.67.219.232', '2021-02-08 12:38:26');
INSERT INTO `operation_log` VALUES (777, 1, 'admin', '/admin/v1/info', '{\"t\":1612759108120}', 0.60, '117.67.219.232', '2021-02-08 12:38:26');
INSERT INTO `operation_log` VALUES (778, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759108245}', 1.97, '117.67.219.232', '2021-02-08 12:38:26');
INSERT INTO `operation_log` VALUES (779, 1, 'admin', '/admin/v1/userApiDay/index', '{\"t\":1612759111041,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 0.76, '117.67.219.232', '2021-02-08 12:38:29');
INSERT INTO `operation_log` VALUES (780, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612759173940,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.00, '117.67.219.232', '2021-02-08 12:39:32');
INSERT INTO `operation_log` VALUES (781, 1, 'admin', '/admin/v1/supplier/index', '{\"t\":1612759180053,\"page\":1,\"limit\":10,\"supplier_name\":\"\"}', 69.03, '117.67.219.232', '2021-02-08 12:39:38');
INSERT INTO `operation_log` VALUES (782, 1, 'admin', '/admin/v1/supplier/list', '{\"t\":1612759180779}', 0.45, '117.67.219.232', '2021-02-08 12:39:39');
INSERT INTO `operation_log` VALUES (783, 1, 'admin', '/admin/v1/code/index', '{\"t\":1612759180779,\"page\":1,\"limit\":10,\"code\":\"\"}', 41.84, '117.67.219.232', '2021-02-08 12:39:39');
INSERT INTO `operation_log` VALUES (784, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612759181707,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 48.95, '117.67.219.232', '2021-02-08 12:39:40');
INSERT INTO `operation_log` VALUES (785, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612759184954,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 56.63, '117.67.219.232', '2021-02-08 12:39:43');
INSERT INTO `operation_log` VALUES (786, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759191689}', 2.03, '117.67.219.232', '2021-02-08 12:39:50');
INSERT INTO `operation_log` VALUES (787, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759192724}', 1.80, '117.67.219.232', '2021-02-08 12:39:51');
INSERT INTO `operation_log` VALUES (788, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612759240838,\"id\":0,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\\u53c2\\u6570\",\"parent_id\":40,\"url\":\"api\\/param\",\"auth\":\"\",\"sort\":0,\"icon\":\"tixing\"}', 2.62, '117.67.219.232', '2021-02-08 12:40:39');
INSERT INTO `operation_log` VALUES (789, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759242383}', 2.21, '117.67.219.232', '2021-02-08 12:40:40');
INSERT INTO `operation_log` VALUES (790, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759257565}', 2.63, '117.67.219.232', '2021-02-08 12:40:56');
INSERT INTO `operation_log` VALUES (791, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612759272899,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u53c2\\u6570\\u5217\\u8868\",\"parent_id\":72,\"url\":\"\",\"auth\":\"param-list\",\"sort\":0,\"icon\":\"\"}', 3.18, '117.67.219.232', '2021-02-08 12:41:11');
INSERT INTO `operation_log` VALUES (792, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759274440}', 1.96, '117.67.219.232', '2021-02-08 12:41:12');
INSERT INTO `operation_log` VALUES (793, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759275420}', 2.06, '117.67.219.232', '2021-02-08 12:41:13');
INSERT INTO `operation_log` VALUES (794, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612759293199,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u53c2\\u6570\\u6dfb\\u52a0\",\"parent_id\":72,\"url\":\"\",\"auth\":\"param-add\",\"sort\":0,\"icon\":\"\"}', 3.22, '117.67.219.232', '2021-02-08 12:41:31');
INSERT INTO `operation_log` VALUES (795, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759294746}', 2.01, '117.67.219.232', '2021-02-08 12:41:33');
INSERT INTO `operation_log` VALUES (796, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759296484}', 1.73, '117.67.219.232', '2021-02-08 12:41:34');
INSERT INTO `operation_log` VALUES (797, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612759315510,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u53c2\\u6570\\u4fee\\u6539\",\"parent_id\":72,\"url\":\"\",\"auth\":\"param-edit\",\"sort\":0,\"icon\":\"\"}', 2.77, '117.67.219.232', '2021-02-08 12:41:54');
INSERT INTO `operation_log` VALUES (798, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759317051}', 2.26, '117.67.219.232', '2021-02-08 12:41:55');
INSERT INTO `operation_log` VALUES (799, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759323421}', 2.71, '117.67.219.232', '2021-02-08 12:42:01');
INSERT INTO `operation_log` VALUES (800, 1, 'admin', '/admin/v1/menu/add', '{\"t\":1612759338924,\"id\":0,\"type\":3,\"menu_name\":\"\\u63a5\\u53e3\\u53c2\\u6570\\u5220\\u9664\",\"parent_id\":72,\"url\":\"\",\"auth\":\"param-del\",\"sort\":0,\"icon\":\"\"}', 2.60, '117.67.219.232', '2021-02-08 12:42:17');
INSERT INTO `operation_log` VALUES (801, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759340467}', 2.24, '117.67.219.232', '2021-02-08 12:42:18');
INSERT INTO `operation_log` VALUES (802, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612759341584,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.54, '117.67.219.232', '2021-02-08 12:42:20');
INSERT INTO `operation_log` VALUES (803, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759342667}', 1.75, '117.67.219.232', '2021-02-08 12:42:21');
INSERT INTO `operation_log` VALUES (804, 1, 'admin', '/admin/v1/role/show', '{\"t\":1612759342667,\"id\":1}', 9.86, '117.67.219.232', '2021-02-08 12:42:21');
INSERT INTO `operation_log` VALUES (805, 1, 'admin', '/admin/v1/role/edit', '{\"t\":1612759346637,\"id\":1,\"role_name\":\"\\u8d85\\u7ba1\",\"remark\":\"\\u8d85\\u7ba1\",\"menu_id\":[1,13,17,16,15,14,18,20,19,21,22,7,11,12,10,9,2,6,5,4,3,23,24,25,26,29,28,27,30,34,33,32,31,35,38,37,36,39,40,41,44,46,45,43,42,72,76,75,74,73,47,51,50,49,48,52,54,53,55,56,57,62,61,60,59,58,63,66,67,68,69,70,71,64,65]}', 7.77, '117.67.219.232', '2021-02-08 12:42:25');
INSERT INTO `operation_log` VALUES (806, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612759348188,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 56.60, '117.67.219.232', '2021-02-08 12:42:26');
INSERT INTO `operation_log` VALUES (807, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.18, '117.67.219.232', '2021-02-08 12:42:28');
INSERT INTO `operation_log` VALUES (808, 1, 'admin', '/admin/v1/info', '{\"t\":1612759349770}', 0.60, '117.67.219.232', '2021-02-08 12:42:28');
INSERT INTO `operation_log` VALUES (809, 1, 'admin', '/admin/v1/role/index', '{\"t\":1612759349921,\"page\":1,\"limit\":10,\"role_name\":\"\"}', 55.88, '117.67.219.232', '2021-02-08 12:42:28');
INSERT INTO `operation_log` VALUES (810, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612759357791,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 56.70, '117.67.219.232', '2021-02-08 12:42:36');
INSERT INTO `operation_log` VALUES (811, 1, 'admin', '/admin/v1/param/index', '{\"t\":1612759359060,\"page\":1,\"limit\":10,\"api_name\":\"\"}', 0.88, '117.67.219.232', '2021-02-08 12:42:37');
INSERT INTO `operation_log` VALUES (812, 1, 'admin', '/admin/v1/api/index', '{\"t\":1612759360254,\"page\":1,\"limit\":10,\"api_name\":\"\",\"url\":\"\",\"num\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 56.37, '117.67.219.232', '2021-02-08 12:42:38');
INSERT INTO `operation_log` VALUES (813, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759364472}', 2.19, '117.67.219.232', '2021-02-08 12:42:42');
INSERT INTO `operation_log` VALUES (814, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1612759373585}', 2.12, '117.67.219.232', '2021-02-08 12:42:52');
INSERT INTO `operation_log` VALUES (815, 1, 'admin', '/admin/v1/menu/show', '{\"t\":1612759373585,\"id\":72}', 0.86, '117.67.219.232', '2021-02-08 12:42:52');
INSERT INTO `operation_log` VALUES (816, 1, 'admin', '/admin/v1/menu/edit', '{\"t\":1612759376416,\"id\":72,\"type\":2,\"menu_name\":\"\\u63a5\\u53e3\\u53c2\\u6570\",\"parent_id\":40,\"url\":\"api\\/param\",\"auth\":\"\",\"sort\":1,\"icon\":\"tixing\"}', 3.55, '117.67.219.232', '2021-02-08 12:42:54');
INSERT INTO `operation_log` VALUES (817, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759377963}', 2.10, '117.67.219.232', '2021-02-08 12:42:56');
INSERT INTO `operation_log` VALUES (818, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.72, '117.67.219.232', '2021-02-08 12:42:57');
INSERT INTO `operation_log` VALUES (819, 1, 'admin', '/admin/v1/info', '{\"t\":1612759379489}', 0.50, '117.67.219.232', '2021-02-08 12:42:58');
INSERT INTO `operation_log` VALUES (820, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1612759379623}', 2.84, '117.67.219.232', '2021-02-08 12:42:58');
INSERT INTO `operation_log` VALUES (821, 1, 'admin', '/admin/v1/param/index', '{\"t\":1612759384806,\"page\":1,\"limit\":10,\"api_name\":\"\"}', 0.66, '117.67.219.232', '2021-02-08 12:43:03');
INSERT INTO `operation_log` VALUES (822, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.77, '117.67.219.232', '2021-02-08 12:43:27');
INSERT INTO `operation_log` VALUES (823, 1, 'admin', '/admin/v1/info', '{\"t\":1612759409360}', 0.54, '117.67.219.232', '2021-02-08 12:43:27');
INSERT INTO `operation_log` VALUES (824, 1, 'admin', '/admin/v1/param/index', '{\"t\":1612759409523,\"page\":1,\"limit\":10,\"api_name\":\"\"}', 0.74, '117.67.219.232', '2021-02-08 12:43:28');
INSERT INTO `operation_log` VALUES (825, 1, 'admin', '/admin/v1/menu/nav', '[]', 2.77, '117.67.219.232', '2021-02-08 12:48:15');
INSERT INTO `operation_log` VALUES (826, 1, 'admin', '/admin/v1/info', '{\"t\":1612759696698}', 0.58, '117.67.219.232', '2021-02-08 12:48:15');
INSERT INTO `operation_log` VALUES (827, 1, 'admin', '/admin/v1/param/index', '{\"t\":1612759696868,\"page\":1,\"limit\":10,\"api_name\":\"\"}', 57.20, '117.67.219.232', '2021-02-08 12:48:15');
INSERT INTO `operation_log` VALUES (828, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.57, '117.67.219.232', '2021-02-08 14:03:06');
INSERT INTO `operation_log` VALUES (829, 1, 'admin', '/admin/v1/info', '{\"t\":1612764187581}', 0.76, '117.67.219.232', '2021-02-08 14:03:06');
INSERT INTO `operation_log` VALUES (830, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612765816579}', 0.50, '117.67.219.232', '2021-02-08 14:30:15');
INSERT INTO `operation_log` VALUES (831, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612765816580,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 60.14, '117.67.219.232', '2021-02-08 14:30:15');
INSERT INTO `operation_log` VALUES (832, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612765821438,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"217289176561758209\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 2.46, '117.67.219.232', '2021-02-08 14:30:19');
INSERT INTO `operation_log` VALUES (833, 1, 'admin', '/admin/v1/request/detail', '{\"t\":1612765824401,\"unique_number\":\"217289176561758209\"}', 5.15, '117.67.219.232', '2021-02-08 14:30:22');
INSERT INTO `operation_log` VALUES (834, 1, 'admin', '/admin/v1/supplierapi/index', '{\"t\":1612767270834,\"page\":1,\"limit\":10,\"supplier_api_name\":\"\",\"url\":\"\",\"supplier_name\":\"\",\"status\":\"\",\"fee_type\":\"\"}', 57.31, '117.67.219.232', '2021-02-08 14:54:29');
INSERT INTO `operation_log` VALUES (835, 1, 'admin', '/admin/v1/supplierapi/refreshCache', '{\"t\":1612767275218,\"id\":1}', 1.38, '117.67.219.232', '2021-02-08 14:54:33');
INSERT INTO `operation_log` VALUES (836, 1, 'admin', '/admin/v1/supplierapi/refreshCache', '{\"t\":1612767277767,\"id\":2}', 1.02, '117.67.219.232', '2021-02-08 14:54:36');
INSERT INTO `operation_log` VALUES (837, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769456509}', 1.12, '117.67.219.232', '2021-02-08 15:30:56');
INSERT INTO `operation_log` VALUES (838, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612769456509,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"217289176561758209\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 4.21, '117.67.219.232', '2021-02-08 15:30:56');
INSERT INTO `operation_log` VALUES (839, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769457434}', 0.27, '117.67.219.232', '2021-02-08 15:30:57');
INSERT INTO `operation_log` VALUES (840, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612769457434,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 57.72, '117.67.219.232', '2021-02-08 15:30:57');
INSERT INTO `operation_log` VALUES (841, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769458092}', 0.40, '117.67.219.232', '2021-02-08 15:30:58');
INSERT INTO `operation_log` VALUES (842, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612769458093,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 59.92, '117.67.219.232', '2021-02-08 15:30:58');
INSERT INTO `operation_log` VALUES (843, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769458995}', 0.37, '117.67.219.232', '2021-02-08 15:30:59');
INSERT INTO `operation_log` VALUES (844, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612769458995,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"217289176561758209\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 3.72, '117.67.219.232', '2021-02-08 15:30:59');
INSERT INTO `operation_log` VALUES (845, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612769464743,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 57.63, '117.67.219.232', '2021-02-08 15:31:04');
INSERT INTO `operation_log` VALUES (846, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769470095}', 0.34, '117.67.219.232', '2021-02-08 15:31:10');
INSERT INTO `operation_log` VALUES (847, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612769470095,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 59.97, '117.67.219.232', '2021-02-08 15:31:10');
INSERT INTO `operation_log` VALUES (848, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769471908}', 0.39, '117.67.219.232', '2021-02-08 15:31:12');
INSERT INTO `operation_log` VALUES (849, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612769471908,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 61.22, '117.67.219.232', '2021-02-08 15:31:12');
INSERT INTO `operation_log` VALUES (850, 1, 'admin', '/admin/v1/userApiDay/index', '{\"t\":1612769476477,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 0.89, '117.67.219.232', '2021-02-08 15:31:16');
INSERT INTO `operation_log` VALUES (851, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769477638}', 0.35, '117.67.219.232', '2021-02-08 15:31:17');
INSERT INTO `operation_log` VALUES (852, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612769477638,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 63.77, '117.67.219.232', '2021-02-08 15:31:17');
INSERT INTO `operation_log` VALUES (853, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769477940}', 0.43, '117.67.219.232', '2021-02-08 15:31:18');
INSERT INTO `operation_log` VALUES (854, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612769477940,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 60.40, '117.67.219.232', '2021-02-08 15:31:18');
INSERT INTO `operation_log` VALUES (855, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769478263}', 0.39, '117.67.219.232', '2021-02-08 15:31:18');
INSERT INTO `operation_log` VALUES (856, 1, 'admin', '/admin/v1/request/index', '{\"t\":1612769478263,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"ym\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 58.51, '117.67.219.232', '2021-02-08 15:31:18');
INSERT INTO `operation_log` VALUES (857, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769478716}', 11.57, '117.67.219.232', '2021-02-08 15:31:18');
INSERT INTO `operation_log` VALUES (858, 1, 'admin', '/admin/v1/response/index', '{\"t\":1612769478718,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 61.09, '117.67.219.232', '2021-02-08 15:31:18');
INSERT INTO `operation_log` VALUES (859, 1, 'admin', '/admin/v1/request/getYm', '{\"t\":1612769479109}', 0.41, '117.67.219.232', '2021-02-08 15:31:19');
INSERT INTO `operation_log` VALUES (860, 1, 'admin', '/admin/v1/callSupplierApi/index', '{\"t\":1612769479109,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"supplier_api_id\":\"\",\"unique_number\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 59.14, '117.67.219.232', '2021-02-08 15:31:19');
INSERT INTO `operation_log` VALUES (861, 1, 'admin', '/admin/v1/userApiDay/index', '{\"t\":1612769479480,\"page\":1,\"limit\":10,\"user_id\":\"\",\"api_id\":\"\",\"start_time\":\"\",\"end_time\":\"\"}', 0.84, '117.67.219.232', '2021-02-08 15:31:19');
INSERT INTO `operation_log` VALUES (862, 1, 'admin', '/admin/v1/menu/nav', '[]', 50.89, '36.5.183.76', '2021-02-19 14:15:55');
INSERT INTO `operation_log` VALUES (863, 1, 'admin', '/admin/v1/info', '{\"t\":1613715356038}', 0.80, '36.5.183.76', '2021-02-19 14:15:55');
INSERT INTO `operation_log` VALUES (864, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.39, '36.5.183.76', '2021-02-19 14:16:03');
INSERT INTO `operation_log` VALUES (865, 1, 'admin', '/admin/v1/info', '{\"t\":1613715364197}', 0.57, '36.5.183.76', '2021-02-19 14:16:03');
INSERT INTO `operation_log` VALUES (866, 1, 'admin', '/admin/v1/menu/nav', '[]', 3.80, '36.33.15.74', '2021-02-19 19:04:10');
INSERT INTO `operation_log` VALUES (867, 1, 'admin', '/admin/v1/info', '{\"t\":1613732650726}', 0.59, '36.33.15.74', '2021-02-19 19:04:10');
INSERT INTO `operation_log` VALUES (868, 1, 'admin', '/admin/v1/menu/index', '{\"t\":1613732654337}', 1.92, '36.33.15.74', '2021-02-19 19:04:13');
INSERT INTO `operation_log` VALUES (869, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1613732656880}', 2.11, '36.33.15.74', '2021-02-19 19:04:16');
INSERT INTO `operation_log` VALUES (870, 1, 'admin', '/admin/v1/menu/menu', '{\"t\":1613732672936}', 2.02, '36.33.15.74', '2021-02-19 19:04:32');

-- ----------------------------
-- Table structure for pass_code
-- ----------------------------
DROP TABLE IF EXISTS `pass_code`;
CREATE TABLE `pass_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass_code_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通行码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pass_code
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超管', '超管', '2021-02-07 20:45:51', '2021-02-08 12:42:25');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色菜单表',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色id',
  `menu_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单id',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 453 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (378, 1, 1, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (379, 1, 13, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (380, 1, 17, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (381, 1, 16, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (382, 1, 15, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (383, 1, 14, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (384, 1, 18, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (385, 1, 20, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (386, 1, 19, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (387, 1, 21, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (388, 1, 22, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (389, 1, 7, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (390, 1, 11, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (391, 1, 12, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (392, 1, 10, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (393, 1, 9, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (394, 1, 2, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (395, 1, 6, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (396, 1, 5, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (397, 1, 4, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (398, 1, 3, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (399, 1, 23, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (400, 1, 24, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (401, 1, 25, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (402, 1, 26, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (403, 1, 29, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (404, 1, 28, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (405, 1, 27, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (406, 1, 30, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (407, 1, 34, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (408, 1, 33, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (409, 1, 32, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (410, 1, 31, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (411, 1, 35, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (412, 1, 38, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (413, 1, 37, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (414, 1, 36, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (415, 1, 39, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (416, 1, 40, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (417, 1, 41, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (418, 1, 44, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (419, 1, 46, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (420, 1, 45, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (421, 1, 43, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (422, 1, 42, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (423, 1, 72, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (424, 1, 76, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (425, 1, 75, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (426, 1, 74, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (427, 1, 73, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (428, 1, 47, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (429, 1, 51, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (430, 1, 50, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (431, 1, 49, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (432, 1, 48, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (433, 1, 52, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (434, 1, 54, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (435, 1, 53, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (436, 1, 55, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (437, 1, 56, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (438, 1, 57, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (439, 1, 62, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (440, 1, 61, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (441, 1, 60, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (442, 1, 59, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (443, 1, 58, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (444, 1, 63, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (445, 1, 66, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (446, 1, 67, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (447, 1, 68, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (448, 1, 69, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (449, 1, 70, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (450, 1, 71, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (451, 1, 64, '2021-02-08 12:42:25');
INSERT INTO `role_menu` VALUES (452, 1, 65, '2021-02-08 12:42:25');

-- ----------------------------
-- Table structure for status_code
-- ----------------------------
DROP TABLE IF EXISTS `status_code`;
CREATE TABLE `status_code`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '状态码表',
  `code` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态码',
  `desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `supplier_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联供应商表id',
  `supplier_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '供应商状态码',
  `supplier_code_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '供应商状态码的描述',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of status_code
-- ----------------------------
INSERT INTO `status_code` VALUES (1, 100, '请求成功', 0, '', '', '2021-02-08 10:16:08', '2021-02-08 10:16:08');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '供应商名称',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '高德地图', '', '2021-02-08 09:59:37', '2021-02-08 09:59:37');
INSERT INTO `supplier` VALUES (2, '百度地图', '', '2021-02-08 11:00:17', '2021-02-08 11:00:17');

-- ----------------------------
-- Table structure for supplier_api
-- ----------------------------
DROP TABLE IF EXISTS `supplier_api`;
CREATE TABLE `supplier_api`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '供应商接口',
  `supplier_api_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '接口地址',
  `url_crc32` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口地址crc32值',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1开启/2关闭',
  `fee_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '收费模式 1查得/2查询',
  `supplier_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联供应商表id (普通索引)',
  `supplier_api_price` int(10) UNSIGNED NOT NULL DEFAULT 2 COMMENT '供应商接口的价格(单位厘 整数存储)',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_url_crc32`(`url_crc32`) USING BTREE,
  INDEX `idx_supplier_id`(`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_api
-- ----------------------------
INSERT INTO `supplier_api` VALUES (1, 'IP定位', 'https://restapi.amap.com/v3/ip', 69203055, 1, 1, 1, 0, '2021-02-08 10:19:41', '2021-02-08 10:27:08');
INSERT INTO `supplier_api` VALUES (2, 'IP定位', 'https://api.map.baidu.com/location/ip', 538541925, 1, 1, 2, 0, '2021-02-08 11:13:34', '2021-02-08 11:13:36');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '系统配置',
  `param_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统配置字段',
  `param_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统配置字段的值',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '类型(1文字/2图片/3富文本)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_config
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'user用户表',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名称, 登录使用',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `money` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户金额',
  `token` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户秘钥',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1开启/2关闭',
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '全名称',
  `liaison` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_token`(`token`) USING BTREE,
  UNIQUE INDEX `uk_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'abcabc', 'abcabc', '$2y$10$DcfelN6dMQpF6v6KI0DcyuTZQCpXfGlvX8lg2S4sT6Dk7rYgzbv1S', 0, '613801a4b030ede7450c736a59afb738f6edd03c33ec3ca07953a3c3d3b50f6c', 1, '', '', '13912345678', '123456@abc.com', '2021-02-08 09:28:18', '2021-02-08 09:28:18');

-- ----------------------------
-- Table structure for user_api
-- ----------------------------
DROP TABLE IF EXISTS `user_api`;
CREATE TABLE `user_api`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户接口表',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户表id',
  `api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口表id',
  `total` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总次数',
  `number` int(11) NOT NULL DEFAULT -1 COMMENT '剩余次数, -1代表不记次数',
  `is_infinity` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是无限次的调用 0是/1否',
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '价格, 0代表不记价格(单位厘)',
  `expire_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '到期时间 0表示永久有效',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id_api_id`(`user_id`, `api_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_api
-- ----------------------------
INSERT INTO `user_api` VALUES (1, 1, 1, 0, 3, 1, 0, 0, '2021-02-08 11:40:15', '2021-02-08 14:54:57');

-- ----------------------------
-- Table structure for user_api_count_with_day
-- ----------------------------
DROP TABLE IF EXISTS `user_api_count_with_day`;
CREATE TABLE `user_api_count_with_day`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户每天使用接口统计',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `api_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接口id',
  `cnt` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '次数统计',
  `day` date NOT NULL COMMENT '日期, 精确到天',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_api_id`(`api_id`) USING BTREE,
  INDEX `idx_day`(`day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_api_count_with_day
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `pass_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通行码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
