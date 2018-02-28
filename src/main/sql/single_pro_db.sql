/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : single_pro_db

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2018-02-28 23:26:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sp_application
-- ----------------------------
DROP TABLE IF EXISTS `sp_application`;
CREATE TABLE `sp_application` (
  `id` bigint(19) unsigned NOT NULL COMMENT '主键',
  `title` varchar(32) NOT NULL COMMENT '网站标题',
  `subtitle` varchar(80) NOT NULL COMMENT '副标题',
  `logo_url` varchar(200) NOT NULL COMMENT '网站Logo地址',
  `copyright` varchar(120) NOT NULL COMMENT '版权信息',
  `status` varchar(5) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_application
-- ----------------------------
INSERT INTO `sp_application` VALUES ('1', '后台管理系统', '后台管理系统', 'http://ad.haijupai.com/resources/images/logo.png', '&copy; Copyright 夏风飞舞 2017-2018', 'Y', '2018-01-08 14:35:35', '2018-01-08 14:35:36');

-- ----------------------------
-- Table structure for sp_authorization
-- ----------------------------
DROP TABLE IF EXISTS `sp_authorization`;
CREATE TABLE `sp_authorization` (
  `id` bigint(19) unsigned NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '权限字名称',
  `code` varchar(80) NOT NULL COMMENT '权限字编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_authorization
-- ----------------------------

-- ----------------------------
-- Table structure for sp_job
-- ----------------------------
DROP TABLE IF EXISTS `sp_job`;
CREATE TABLE `sp_job` (
  `id` bigint(19) unsigned NOT NULL COMMENT '主键ID',
  `job_id` varchar(20) NOT NULL COMMENT '任务ID',
  `job_name` varchar(50) NOT NULL COMMENT '任务（作业）名称',
  `group_id` bigint(19) unsigned NOT NULL COMMENT '所在组',
  `status` enum('NORMAL','NONE') NOT NULL COMMENT '任务状态',
  `cron` varchar(50) NOT NULL COMMENT '定时任务时间表达式',
  `clazz_name` varchar(100) NOT NULL COMMENT '作业类',
  `is_concurrent` tinyint(1) NOT NULL COMMENT '是否允许并发执行同一个任务',
  `is_startup_execution` tinyint(1) NOT NULL COMMENT '是否项目启动时自执行',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of sp_job
-- ----------------------------
INSERT INTO `sp_job` VALUES ('1', 'J-01', '默认', '1', 'NORMAL', '0/1 * * * * ?', 'com.single.pro.quartz.job.BaseJob', '0', '0', '默认任务', '1511420746686', '1511420746686');

-- ----------------------------
-- Table structure for sp_job_group
-- ----------------------------
DROP TABLE IF EXISTS `sp_job_group`;
CREATE TABLE `sp_job_group` (
  `id` bigint(19) unsigned NOT NULL COMMENT '主键ID',
  `group_code` varchar(20) NOT NULL COMMENT '任务（作业）组编码',
  `group_name` varchar(50) NOT NULL COMMENT '任务（作业）组名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务组';

-- ----------------------------
-- Records of sp_job_group
-- ----------------------------
INSERT INTO `sp_job_group` VALUES ('1', 'G-01', '默认分组');

-- ----------------------------
-- Table structure for sp_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_menu`;
CREATE TABLE `sp_menu` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(19) unsigned DEFAULT NULL COMMENT '父级ID',
  `app_id` bigint(19) unsigned NOT NULL COMMENT '应用ID',
  `sort_number` int(10) unsigned NOT NULL COMMENT '排序编号',
  `title` varchar(32) NOT NULL COMMENT '标题名称',
  `icon` varchar(48) NOT NULL COMMENT '图标',
  `url` varchar(80) DEFAULT NULL COMMENT '站内链接',
  `status` varchar(5) NOT NULL COMMENT '状态（Y:启用，N:未启用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_menu
-- ----------------------------
INSERT INTO `sp_menu` VALUES ('1', null, '2', '0', '主页', 'fa fa-gg-circle', 'welcome', 'Y', '2018-01-08 13:42:30', '2018-01-08 13:42:31');
INSERT INTO `sp_menu` VALUES ('2', null, '2', '1', '用户管理', 'fa fa-gg-circle', '', 'Y', '2018-01-08 13:43:08', '2018-01-08 13:43:09');
INSERT INTO `sp_menu` VALUES ('3', '2', '2', '1', '用户信息', 'fa fa-gg-circle', 'user/index', 'Y', '2018-01-08 13:46:34', '2018-01-08 13:46:36');
INSERT INTO `sp_menu` VALUES ('4', '2', '2', '2', '角色授权', 'fa fa-gg-circle', 'role/index', 'Y', '2018-01-08 13:47:04', '2018-01-08 13:47:05');
INSERT INTO `sp_menu` VALUES ('5', '2', '2', '3', '菜单管理', 'fa fa-gg-circle', 'menu/index', 'Y', '2018-01-08 13:47:25', '2018-01-08 13:47:27');
INSERT INTO `sp_menu` VALUES ('6', null, '2', '2', '系统管理', 'fa fa-gg-circle', null, 'Y', '2018-02-25 17:49:13', '2018-02-25 17:49:15');
INSERT INTO `sp_menu` VALUES ('7', '6', '2', '0', '基础配置', 'fa fa-gg-circle', 'system/base/index', 'Y', '2018-02-25 17:55:50', '2018-02-25 17:55:53');
INSERT INTO `sp_menu` VALUES ('8', '6', '2', '1', '数据字典', 'fa fa-gg-circle', 'system/dist/index', 'Y', '2018-02-25 17:52:41', '2018-02-25 17:52:43');
INSERT INTO `sp_menu` VALUES ('9', '2', '2', '0', '组织机构', 'fa fa-gg-circle', 'organization/index', 'Y', '2018-02-25 17:58:22', '2018-02-25 17:58:26');

-- ----------------------------
-- Table structure for sp_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` bigint(19) unsigned NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `code` varchar(80) NOT NULL COMMENT '角色编码',
  `status` varchar(5) NOT NULL COMMENT '状态（Y:启用，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_role
-- ----------------------------
INSERT INTO `sp_role` VALUES ('1', '管理员', 'administrator', 'Y', '2017-12-27 11:28:51', '2017-12-27 11:28:53');

-- ----------------------------
-- Table structure for sp_role_authorization
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_authorization`;
CREATE TABLE `sp_role_authorization` (
  `id` bigint(19) unsigned NOT NULL COMMENT '主键',
  `role_id` bigint(19) unsigned NOT NULL COMMENT '角色ID',
  `authword_id` bigint(19) unsigned NOT NULL COMMENT '权限关联',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_role_authorization
-- ----------------------------

-- ----------------------------
-- Table structure for sp_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_user`;
CREATE TABLE `sp_user` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '用户名称',
  `role_id` bigint(19) unsigned NOT NULL COMMENT '关联角色',
  `login_name` varchar(32) NOT NULL COMMENT '登录名称（唯一）',
  `phone_no` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(128) NOT NULL COMMENT '登录密码',
  `info` varchar(255) NOT NULL COMMENT '备注',
  `status` varchar(5) NOT NULL COMMENT '状态（Y:正常，L:锁定，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user
-- ----------------------------
INSERT INTO `sp_user` VALUES ('1', '司仲夏', '1', 'sizhongxia', '18518436862', 'd09a9fe317379727746ec06d60875ef7', '管理员', 'Y', '2017-12-27 11:29:22', '2017-12-27 11:29:24', '2018-02-28 23:16:57');
