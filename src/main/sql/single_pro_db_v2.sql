/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : single_pro_db_v2

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-03-07 15:07:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sp_job
-- ----------------------------
DROP TABLE IF EXISTS `sp_job`;
CREATE TABLE `sp_job` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `job_id` varchar(20) NOT NULL COMMENT '任务ID',
  `job_name` varchar(50) NOT NULL COMMENT '任务（作业）名称',
  `group_id` char(32) NOT NULL COMMENT '所在组',
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
  `id` char(32) NOT NULL COMMENT '主键ID',
  `group_code` varchar(20) NOT NULL COMMENT '任务（作业）组编码',
  `group_name` varchar(50) NOT NULL COMMENT '任务（作业）组名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务组';

-- ----------------------------
-- Records of sp_job_group
-- ----------------------------
INSERT INTO `sp_job_group` VALUES ('1', 'G-01', '默认分组');

-- ----------------------------
-- Table structure for sp_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `code` varchar(80) NOT NULL COMMENT '角色编码',
  `is_system` char(1) NOT NULL COMMENT '状态（Y:系统角色，N:自定义角色）',
  `status` char(1) NOT NULL COMMENT '状态（Y:启用，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sp_role
-- ----------------------------
INSERT INTO `sp_role` VALUES ('B3207D8F6D134F80B3976584A06816C0', '管理员', 'admin', 'Y', 'Y', '2017-12-27 11:28:51', '2017-12-27 11:28:53');
INSERT INTO `sp_role` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '业务员', 'yewuyuan', 'N', 'N', '2018-03-07 10:22:49', '2018-03-07 14:54:31');

-- ----------------------------
-- Table structure for sp_role_app
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_app`;
CREATE TABLE `sp_role_app` (
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `app_id` char(32) NOT NULL COMMENT '系统应用关联',
  `create_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色系统应用授权';

-- ----------------------------
-- Records of sp_role_app
-- ----------------------------
INSERT INTO `sp_role_app` VALUES ('B3207D8F6D134F80B3976584A06816C0', '0069E3F00F684E6284756D0D7BB0C743', '2018-03-07 14:27:58');
INSERT INTO `sp_role_app` VALUES ('B3207D8F6D134F80B3976584A06816C0', '53BA97935D824733856E4F3655883039', '2018-03-07 14:27:58');
INSERT INTO `sp_role_app` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'F5683D5AFB22403BAC8B7CB83CE04689', '2018-03-07 14:27:58');
INSERT INTO `sp_role_app` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '0069E3F00F684E6284756D0D7BB0C743', '2018-03-07 14:37:56');
INSERT INTO `sp_role_app` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '53BA97935D824733856E4F3655883039', '2018-03-07 14:53:14');

-- ----------------------------
-- Table structure for sp_role_authword
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_authword`;
CREATE TABLE `sp_role_authword` (
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `authword` varchar(80) NOT NULL COMMENT '权限关联',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`,`authword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限字授权';

-- ----------------------------
-- Records of sp_role_authword
-- ----------------------------
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'cc', '2018-03-07 14:27:58');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'create', '2018-03-07 14:27:58');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'test1', '2018-03-07 14:27:58');
INSERT INTO `sp_role_authword` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', 'test1', '2018-03-07 14:53:14');

-- ----------------------------
-- Table structure for sp_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_menu`;
CREATE TABLE `sp_role_menu` (
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `menu_id` char(32) NOT NULL COMMENT '菜单关联',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色系统菜单授权';

-- ----------------------------
-- Records of sp_role_menu
-- ----------------------------
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '1591CACECD964ED7B39FBD9836EB6773', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '1AF2BD180C514CF3B0217DC6958C14D4', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '332711F151F848559A2421ECEDDBE4A8', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '3EAD7806D81448509A6103D0B485D51D', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '42D0C74564274CA081096FFB895B3CAA', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '57E5CB7728614328A07D96C407F1CA96', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '699ADEA60A5F43A6A46099572B9B86DC', '2018-03-01 15:46:09');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '6E749C60FF1B4A8F80496AE367AF3FC8', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '80BF1CAB24F74B67A2C04141FC9D7E3D', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'A68D10B6CBF54600B079A34BA173B90E', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'B3CFAFACB12F4A298983651794ECA98D', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'DE47A7717B774DCD9C8AEBDF4124651B', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '1AF2BD180C514CF3B0217DC6958C14D4', '2018-03-07 14:37:56');
INSERT INTO `sp_role_menu` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '3EAD7806D81448509A6103D0B485D51D', '2018-03-07 14:53:14');
INSERT INTO `sp_role_menu` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '42D0C74564274CA081096FFB895B3CAA', '2018-03-07 14:37:56');
INSERT INTO `sp_role_menu` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '6E749C60FF1B4A8F80496AE367AF3FC8', '2018-03-07 14:53:14');

-- ----------------------------
-- Table structure for sp_system
-- ----------------------------
DROP TABLE IF EXISTS `sp_system`;
CREATE TABLE `sp_system` (
  `id` char(32) NOT NULL COMMENT '主键',
  `title` varchar(32) NOT NULL COMMENT '网站标题',
  `subtitle` varchar(80) NOT NULL COMMENT '副标题',
  `logo_url` varchar(200) NOT NULL COMMENT '网站Logo地址',
  `copyright` varchar(120) NOT NULL COMMENT '版权信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统基本信息';

-- ----------------------------
-- Records of sp_system
-- ----------------------------
INSERT INTO `sp_system` VALUES ('CC5172B4918546328542CEAB45163E44', '后台管理系统', '后台管理系统', 'http://127.0.0.1:8901/statics/upload/2018/03/05/2A0999E8B5EB4CDC8EBE7815723C90B0.jpg', '版权所有 © 2017-2018 夏风飞舞  豫ICP备15021339号-1');

-- ----------------------------
-- Table structure for sp_system_app
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_app`;
CREATE TABLE `sp_system_app` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `icon` varchar(50) NOT NULL COMMENT '图标',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统应用';

-- ----------------------------
-- Records of sp_system_app
-- ----------------------------
INSERT INTO `sp_system_app` VALUES ('0069E3F00F684E6284756D0D7BB0C743', '业务菜单', 'fa fa-gg-circle', '1');
INSERT INTO `sp_system_app` VALUES ('53BA97935D824733856E4F3655883039', '用户权限', 'fa fa-gg-circle', '2');
INSERT INTO `sp_system_app` VALUES ('F5683D5AFB22403BAC8B7CB83CE04689', '系统管理', 'fa fa-gg-circle', '3');

-- ----------------------------
-- Table structure for sp_system_authword
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_authword`;
CREATE TABLE `sp_system_authword` (
  `id` char(32) NOT NULL COMMENT '主键',
  `menu_id` char(32) NOT NULL COMMENT '对应菜单',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(80) NOT NULL COMMENT '编码',
  `desc` varchar(100) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限字';

-- ----------------------------
-- Records of sp_system_authword
-- ----------------------------
INSERT INTO `sp_system_authword` VALUES ('AE9BA8E3C63A403FA9B79EFC10E00982', '6E749C60FF1B4A8F80496AE367AF3FC8', 'cc', 'cc', 'cc');
INSERT INTO `sp_system_authword` VALUES ('EF9B24AC04844030B7C7531F642B9B84', '3EAD7806D81448509A6103D0B485D51D', '测试', 'test1', 'cs');
INSERT INTO `sp_system_authword` VALUES ('F9381296B816473EA75EEC82DE1B6445', '80BF1CAB24F74B67A2C04141FC9D7E3D', '创建', 'create', '111');

-- ----------------------------
-- Table structure for sp_system_file
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_file`;
CREATE TABLE `sp_system_file` (
  `id` char(32) NOT NULL COMMENT '主键',
  `original_name` varchar(100) NOT NULL COMMENT '文件原始名称',
  `path` varchar(100) NOT NULL COMMENT '文件访问路径',
  `type` varchar(30) NOT NULL COMMENT '文件类型',
  `size` bigint(20) NOT NULL COMMENT '文件大小',
  `desc` varchar(255) NOT NULL COMMENT '文件描述',
  `upload_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_system_file
-- ----------------------------
INSERT INTO `sp_system_file` VALUES ('2A0999E8B5EB4CDC8EBE7815723C90B0', 'hacker-1872304_1920.jpg', '2018/03/05/2A0999E8B5EB4CDC8EBE7815723C90B0.jpg', 'image/jpeg (.jpg)', '1141834', '', '2018-03-05 16:41:03');

-- ----------------------------
-- Table structure for sp_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_menu`;
CREATE TABLE `sp_system_menu` (
  `id` char(32) NOT NULL COMMENT '主键',
  `pid` char(32) NOT NULL COMMENT '父级ID',
  `app_id` char(32) NOT NULL COMMENT '应用ID',
  `sort_no` int(11) NOT NULL COMMENT '排序编号',
  `text` varchar(32) NOT NULL COMMENT '标题名称',
  `icon` varchar(48) NOT NULL COMMENT '图标',
  `url` varchar(80) NOT NULL COMMENT '站内链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of sp_system_menu
-- ----------------------------
INSERT INTO `sp_system_menu` VALUES ('1591CACECD964ED7B39FBD9836EB6773', 'B3CFAFACB12F4A298983651794ECA98D', 'F5683D5AFB22403BAC8B7CB83CE04689', '2', '系统权限字', 'fa fa-gg-circle', 'system/authword');
INSERT INTO `sp_system_menu` VALUES ('1AF2BD180C514CF3B0217DC6958C14D4', '0', '0069E3F00F684E6284756D0D7BB0C743', '1', '房源管理', 'fa fa-gg-circle', '');
INSERT INTO `sp_system_menu` VALUES ('332711F151F848559A2421ECEDDBE4A8', 'DE47A7717B774DCD9C8AEBDF4124651B', 'F5683D5AFB22403BAC8B7CB83CE04689', '1', '图片资源', 'fa fa-gg-circle', 'systemFile/index');
INSERT INTO `sp_system_menu` VALUES ('3EAD7806D81448509A6103D0B485D51D', '6E749C60FF1B4A8F80496AE367AF3FC8', '53BA97935D824733856E4F3655883039', '2', '角色授权', 'fa fa-gg-circle', 'role/auth');
INSERT INTO `sp_system_menu` VALUES ('42D0C74564274CA081096FFB895B3CAA', '1AF2BD180C514CF3B0217DC6958C14D4', '0069E3F00F684E6284756D0D7BB0C743', '1', '项目管理', 'fa fa-gg-circle', 'house/project');
INSERT INTO `sp_system_menu` VALUES ('57E5CB7728614328A07D96C407F1CA96', '6E749C60FF1B4A8F80496AE367AF3FC8', '53BA97935D824733856E4F3655883039', '1', '角色管理', 'fa fa-gg-circle', 'role/index');
INSERT INTO `sp_system_menu` VALUES ('6E749C60FF1B4A8F80496AE367AF3FC8', '0', '53BA97935D824733856E4F3655883039', '1', '用户权限', 'fa fa-gg-circle', '');
INSERT INTO `sp_system_menu` VALUES ('80BF1CAB24F74B67A2C04141FC9D7E3D', 'B3CFAFACB12F4A298983651794ECA98D', 'F5683D5AFB22403BAC8B7CB83CE04689', '1', '基本配置', 'fa fa-gg-circle', 'system/config');
INSERT INTO `sp_system_menu` VALUES ('A68D10B6CBF54600B079A34BA173B90E', 'B3CFAFACB12F4A298983651794ECA98D', 'F5683D5AFB22403BAC8B7CB83CE04689', '3', '系统应用菜单', 'fa fa-gg-circle', 'system/menu');
INSERT INTO `sp_system_menu` VALUES ('B3CFAFACB12F4A298983651794ECA98D', '0', 'F5683D5AFB22403BAC8B7CB83CE04689', '1', '系统管理', 'fa fa-gg-circle', '');
INSERT INTO `sp_system_menu` VALUES ('DE47A7717B774DCD9C8AEBDF4124651B', '0', 'F5683D5AFB22403BAC8B7CB83CE04689', '2', '系统资源', 'fa fa-gg-circle', '');

-- ----------------------------
-- Table structure for sp_system_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_user`;
CREATE TABLE `sp_system_user` (
  `id` char(32) NOT NULL COMMENT '主键',
  `nick_name` varchar(32) NOT NULL COMMENT '用户名称',
  `login_name` varchar(32) NOT NULL COMMENT '登录名称（唯一）',
  `phone_no` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(128) NOT NULL COMMENT '登录密码',
  `role_id` char(32) NOT NULL COMMENT '关联角色',
  `info` varchar(200) NOT NULL COMMENT '备注',
  `status` varchar(5) NOT NULL COMMENT '状态（Y:正常，L:锁定，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sp_system_user
-- ----------------------------
INSERT INTO `sp_system_user` VALUES ('3E8657B0E9B84023A3C16AF91E13E620', '司仲夏', 'sizhongxia', '18518436862', '2410042aea633697cff3e2e19a7dd726', 'B3207D8F6D134F80B3976584A06816C0', '管理员', 'Y', '2017-12-27 11:29:22', '2017-12-27 11:29:24', '2018-03-07 13:51:55');
