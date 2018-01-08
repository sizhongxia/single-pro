/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : single_pro_db

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-01-08 11:26:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sp_authorization
-- ----------------------------
DROP TABLE IF EXISTS `sp_authorization`;
CREATE TABLE `sp_authorization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '权限字名称',
  `code` varchar(80) NOT NULL COMMENT '权限字编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_authorization
-- ----------------------------

-- ----------------------------
-- Table structure for sp_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `code` varchar(80) NOT NULL COMMENT '角色编码',
  `status` varchar(5) NOT NULL COMMENT '状态（Y:启用，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_role
-- ----------------------------
INSERT INTO `sp_role` VALUES ('1', '管理员', 'administrator', 'Y', '2017-12-27 11:28:51', '2017-12-27 11:28:53');

-- ----------------------------
-- Table structure for sp_role_authorization
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_authorization`;
CREATE TABLE `sp_role_authorization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  `authword_id` int(10) unsigned NOT NULL COMMENT '权限关联',
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '用户名称',
  `role_id` int(10) unsigned NOT NULL COMMENT '关联角色',
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
INSERT INTO `sp_user` VALUES ('1', '司仲夏', '1', 'sizhongxia', '18518436862', 'd09a9fe317379727746ec06d60875ef7', '管理员', 'Y', '2017-12-27 11:29:22', '2017-12-27 11:29:24', '2018-01-04 14:10:07');
