/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : single_pro_db_v2

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-03-27 13:53:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sp_basic_city
-- ----------------------------
DROP TABLE IF EXISTS `sp_basic_city`;
CREATE TABLE `sp_basic_city` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL,
  `parent_code` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市基础数据';

-- ----------------------------
-- Records of sp_basic_city
-- ----------------------------

-- ----------------------------
-- Table structure for sp_basic_cost
-- ----------------------------
DROP TABLE IF EXISTS `sp_basic_cost`;
CREATE TABLE `sp_basic_cost` (
  `id` char(32) NOT NULL COMMENT '主键',
  `city_code` varchar(50) NOT NULL COMMENT '城市编码',
  `city_name` varchar(50) NOT NULL COMMENT '城市名称',
  `basic_cost` decimal(10,2) NOT NULL COMMENT '基础劳务费',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础劳务费';

-- ----------------------------
-- Records of sp_basic_cost
-- ----------------------------

-- ----------------------------
-- Table structure for sp_company
-- ----------------------------
DROP TABLE IF EXISTS `sp_company`;
CREATE TABLE `sp_company` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(80) NOT NULL COMMENT '公司名称',
  `short_name` varchar(10) NOT NULL COMMENT '名称简称',
  `company_id` char(32) NOT NULL COMMENT '所属组织',
  `mechanism_type` varchar(50) NOT NULL COMMENT '机构类型',
  `business_regist_no` varchar(50) NOT NULL COMMENT '工商注册号',
  `organization_code` varchar(50) NOT NULL COMMENT '组织机构代码',
  `tax_no` varchar(50) NOT NULL COMMENT '纳税人识别号',
  `provincial` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `country` varchar(20) NOT NULL COMMENT '区县',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `contacts` varchar(50) NOT NULL COMMENT '联系人',
  `contact_number` varchar(30) NOT NULL COMMENT '联系电话',
  `remarks` varchar(200) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司、企业基础信息表';

-- ----------------------------
-- Records of sp_company
-- ----------------------------

-- ----------------------------
-- Table structure for sp_dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `sp_dictionary_item`;
CREATE TABLE `sp_dictionary_item` (
  `id` char(32) NOT NULL COMMENT '字典ID',
  `type_id` char(32) NOT NULL COMMENT '字典类型ID',
  `name` varchar(30) NOT NULL COMMENT '字典名称',
  `code` varchar(50) NOT NULL COMMENT '字典编码',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型项';

-- ----------------------------
-- Records of sp_dictionary_item
-- ----------------------------

-- ----------------------------
-- Table structure for sp_dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `sp_dictionary_type`;
CREATE TABLE `sp_dictionary_type` (
  `id` char(32) NOT NULL COMMENT '字典ID',
  `name` varchar(30) NOT NULL COMMENT '字典名称',
  `code` varchar(50) NOT NULL COMMENT '字典编码',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of sp_dictionary_type
-- ----------------------------

-- ----------------------------
-- Table structure for sp_job
-- ----------------------------
DROP TABLE IF EXISTS `sp_job`;
CREATE TABLE `sp_job` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `name` varchar(50) NOT NULL COMMENT '任务（作业）名称',
  `group` char(32) NOT NULL COMMENT '所在组',
  `cron` varchar(50) NOT NULL COMMENT '定时任务时间表达式',
  `clazz_name` varchar(100) NOT NULL COMMENT '作业类',
  `is_concurrent` tinyint(1) NOT NULL COMMENT '是否允许并发执行同一个任务',
  `is_startup_execution` tinyint(1) NOT NULL COMMENT '是否项目启动时自执行',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of sp_job
-- ----------------------------
INSERT INTO `sp_job` VALUES ('1F0AA9AE4E064DFCA71D5788E2538621', 'DEMO', 'Z_GROUP_1', '*/10 * * * * ?', 'com.single.pro.quartz.job.BaseJob', '0', '0', '每10秒执行一次。', '2018-03-07 15:57:46', '2018-03-14 17:09:26');

-- ----------------------------
-- Table structure for sp_mp_banner
-- ----------------------------
DROP TABLE IF EXISTS `sp_mp_banner`;
CREATE TABLE `sp_mp_banner` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称描述',
  `pic_url` varchar(200) NOT NULL COMMENT '图标地址',
  `sort_weight` int(11) NOT NULL COMMENT '排序权重',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小程序banner模块';

-- ----------------------------
-- Records of sp_mp_banner
-- ----------------------------
INSERT INTO `sp_mp_banner` VALUES ('ACD1C576C8DE4901A4EF85403A5C3EFA', '2', '2018/03/14/80C34C1FB6064E4CB54F869FD426DFB6.png', '2', '1', '2018-03-24 20:40:38', '2018-03-24 20:44:46');

-- ----------------------------
-- Table structure for sp_mp_channel
-- ----------------------------
DROP TABLE IF EXISTS `sp_mp_channel`;
CREATE TABLE `sp_mp_channel` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `icon_url` varchar(200) NOT NULL COMMENT '图标地址',
  `sort_weight` int(11) NOT NULL COMMENT '排序权重',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小程序channel模块';

-- ----------------------------
-- Records of sp_mp_channel
-- ----------------------------
INSERT INTO `sp_mp_channel` VALUES ('02362EEB786949D6BA1EECA3B6A3A58E', '2', '2', '2', '1', '2018-03-24 20:52:23', '2018-03-24 20:52:31');

-- ----------------------------
-- Table structure for sp_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_order`;
CREATE TABLE `sp_order` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `worker_id` char(32) NOT NULL COMMENT '劳务工人ID',
  `project_id` char(32) NOT NULL COMMENT '项目关联ID',
  `project_name` varchar(50) NOT NULL COMMENT '项目名称',
  `product_id` char(32) NOT NULL COMMENT '产品关联ID',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `product_kind` varchar(50) NOT NULL COMMENT '产品种类',
  `product_type` varchar(50) NOT NULL COMMENT '产品类别',
  `product_model` varchar(50) NOT NULL COMMENT '产品型号',
  `order_cost` decimal(10,2) NOT NULL COMMENT '订单金额',
  `deposit_cost` decimal(10,2) NOT NULL COMMENT '托管金额',
  `paid_cost` decimal(10,2) NOT NULL COMMENT '已支付金额',
  `order_status` char(1) NOT NULL COMMENT '订单状态（Y:已完成，R:进行中，N:已取消，D:待施工）',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of sp_order
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_invoice`;
CREATE TABLE `sp_order_invoice` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `company_name` varchar(80) NOT NULL COMMENT '公司名称',
  `company_tax_no` varchar(50) NOT NULL COMMENT '纳税人识别号',
  `invoice_cost` decimal(10,2) NOT NULL COMMENT '发票金额',
  `email` varchar(100) NOT NULL COMMENT '电子邮箱',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `status` char(1) NOT NULL COMMENT '发票状态（Y:已完成）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单发票';

-- ----------------------------
-- Records of sp_order_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order_schedule
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_schedule`;
CREATE TABLE `sp_order_schedule` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目管理ID',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `worker_id` char(32) NOT NULL COMMENT '劳务工人ID',
  `stage` varchar(50) NOT NULL COMMENT '施工阶段',
  `worker_status` char(1) NOT NULL COMMENT '工作状态（Y:已完成，D:进行中）',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `ack_status` char(1) NOT NULL COMMENT '确认状态（Y:已确认，N:已驳回，D:待确认）',
  `ack_time` datetime NOT NULL COMMENT '确认时间',
  `ack_customer_id` char(32) NOT NULL COMMENT '确认客户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单进度表';

-- ----------------------------
-- Records of sp_order_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order_schedule_pic
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_schedule_pic`;
CREATE TABLE `sp_order_schedule_pic` (
  `id` char(32) NOT NULL COMMENT '主键',
  `schedule_id` char(32) NOT NULL COMMENT '订单进度ID',
  `image_url` varchar(200) NOT NULL COMMENT '图片访问路径',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单进度表图片资源';

-- ----------------------------
-- Records of sp_order_schedule_pic
-- ----------------------------

-- ----------------------------
-- Table structure for sp_partner_worker
-- ----------------------------
DROP TABLE IF EXISTS `sp_partner_worker`;
CREATE TABLE `sp_partner_worker` (
  `id` char(32) NOT NULL COMMENT '主键',
  `partner_id` char(32) NOT NULL COMMENT '城市合伙人',
  `worker_id` char(32) NOT NULL COMMENT '劳务工人',
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `worker_id` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市合伙人和工人关联信息表';

-- ----------------------------
-- Records of sp_partner_worker
-- ----------------------------

-- ----------------------------
-- Table structure for sp_platform_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_platform_order`;
CREATE TABLE `sp_platform_order` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目关联ID',
  `product_id` char(32) NOT NULL COMMENT '产品关联ID',
  `order_source` char(1) NOT NULL COMMENT '订单来源类型（C:客户转平台，W:劳务工人转平台）',
  `source_id` char(32) NOT NULL COMMENT '来源关联ID',
  `order_status` char(1) NOT NULL COMMENT '订单状态（Y:已转接至工人，N:已取消，D:待处理）',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人资质申请';

-- ----------------------------
-- Records of sp_platform_order
-- ----------------------------

-- ----------------------------
-- Table structure for sp_product
-- ----------------------------
DROP TABLE IF EXISTS `sp_product`;
CREATE TABLE `sp_product` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL,
  `kind_id` char(32) NOT NULL COMMENT '所属设备种类',
  `type_id` char(32) NOT NULL COMMENT '产品类别',
  `company_id` char(32) NOT NULL COMMENT '所属公司',
  `model` varchar(50) NOT NULL COMMENT '产品型号',
  `describe` text NOT NULL COMMENT '产品描述',
  `constituent` text NOT NULL COMMENT '产品组成',
  `survey_items` text NOT NULL COMMENT '勘测事项',
  `install_debug` text NOT NULL COMMENT '安装调试',
  `plant_maintenance` text NOT NULL COMMENT '设备维护',
  `common_problem` text NOT NULL COMMENT '常见问题',
  `doc_url` varchar(200) NOT NULL COMMENT '文档访问链接',
  `manual_url` varchar(200) NOT NULL COMMENT '操作手册访问链接',
  `apply_user_id` char(32) NOT NULL COMMENT '申请人ID',
  `show_status` char(1) NOT NULL COMMENT '上下架（展示）状态（Y:上架，N:下架，D:待发布）',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of sp_product
-- ----------------------------

-- ----------------------------
-- Table structure for sp_product_clue
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_clue`;
CREATE TABLE `sp_product_clue` (
  `id` char(32) NOT NULL COMMENT '主键',
  `product_name` varchar(80) NOT NULL COMMENT '产品名称',
  `company` varchar(100) NOT NULL COMMENT '所属公司',
  `contacts` varchar(50) NOT NULL COMMENT '联系人',
  `contact_number` varchar(30) NOT NULL COMMENT '联系电话',
  `summary` varchar(500) NOT NULL COMMENT '概述',
  `file_name` varchar(100) NOT NULL COMMENT '产品类别',
  `file_path` varchar(200) NOT NULL,
  `user_id` char(32) NOT NULL COMMENT '申请人、关联用户',
  `apply_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品（申请）线索记录表';

-- ----------------------------
-- Records of sp_product_clue
-- ----------------------------

-- ----------------------------
-- Table structure for sp_product_kind
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_kind`;
CREATE TABLE `sp_product_kind` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `pic_url` varchar(200) NOT NULL COMMENT '图标',
  `kind_id` char(32) NOT NULL,
  `summary` text NOT NULL COMMENT '概述',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类别';

-- ----------------------------
-- Records of sp_product_kind
-- ----------------------------

-- ----------------------------
-- Table structure for sp_product_qualification
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_qualification`;
CREATE TABLE `sp_product_qualification` (
  `id` char(32) NOT NULL COMMENT '主键',
  `type_id` char(32) NOT NULL COMMENT '产品类别关联ID',
  `qualification` varchar(50) NOT NULL COMMENT '关联资质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品资质关联';

-- ----------------------------
-- Records of sp_product_qualification
-- ----------------------------

-- ----------------------------
-- Table structure for sp_product_type
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_type`;
CREATE TABLE `sp_product_type` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `pic_url` varchar(200) NOT NULL COMMENT '产品图片',
  `summary` text NOT NULL COMMENT '概述',
  `sgsq_condition` text NOT NULL COMMENT '施工申请条件',
  `ser_survey` varchar(255) NOT NULL COMMENT '勘测',
  `ser_check` varchar(255) NOT NULL COMMENT '验货',
  `ser_construct` varchar(255) NOT NULL COMMENT '施工',
  `ser_train` varchar(255) NOT NULL COMMENT '培训',
  `ser_accept` varchar(255) NOT NULL COMMENT '验收',
  `difficulty` decimal(2,1) NOT NULL COMMENT '施工难度',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品种类';

-- ----------------------------
-- Records of sp_product_type
-- ----------------------------

-- ----------------------------
-- Table structure for sp_project
-- ----------------------------
DROP TABLE IF EXISTS `sp_project`;
CREATE TABLE `sp_project` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '项目名称',
  `pinyin` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '项目类别',
  `covered_area` varchar(20) NOT NULL COMMENT '建筑面积',
  `worker_number` int(11) NOT NULL COMMENT '劳务人数',
  `provincial` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `country` varchar(20) NOT NULL COMMENT '区县',
  `address` varchar(200) NOT NULL COMMENT '详细地址',
  `longitude` varchar(26) NOT NULL COMMENT '经度',
  `latitude` varchar(26) NOT NULL COMMENT '纬度',
  `company_id` char(32) NOT NULL COMMENT '所属组织公司',
  `branch_company_id` char(32) NOT NULL COMMENT '分公司',
  `remarks` varchar(200) NOT NULL COMMENT '备注',
  `create_user_id` char(32) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='施工项目表';

-- ----------------------------
-- Records of sp_project
-- ----------------------------

-- ----------------------------
-- Table structure for sp_project_draw
-- ----------------------------
DROP TABLE IF EXISTS `sp_project_draw`;
CREATE TABLE `sp_project_draw` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目关联ID',
  `drawing_url` varchar(255) NOT NULL COMMENT '图纸地址',
  `upload_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目图纸';

-- ----------------------------
-- Records of sp_project_draw
-- ----------------------------

-- ----------------------------
-- Table structure for sp_project_product
-- ----------------------------
DROP TABLE IF EXISTS `sp_project_product`;
CREATE TABLE `sp_project_product` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目关联ID',
  `product_id` char(32) NOT NULL COMMENT '关联产品',
  `model` varchar(50) NOT NULL COMMENT '产品型号',
  `detail_list_url` varchar(200) NOT NULL COMMENT '清单文件链接',
  `number` int(11) NOT NULL COMMENT '产品数量',
  `number_desc` varchar(80) NOT NULL COMMENT '产品数量描述',
  `ser_survey_choice` char(1) NOT NULL COMMENT '勘测服务选择（Y:选择，N:未选择）',
  `ser_check_choice` char(1) NOT NULL COMMENT '验货服务选择（Y:选择，N:未选择）',
  `ser_construct_choice` char(1) NOT NULL COMMENT '施工服务选择（Y:选择，N:未选择）',
  `ser_train_choice` char(1) NOT NULL COMMENT '培训服务选择（Y:选择，N:未选择）',
  `ser_accept_choice` char(1) NOT NULL COMMENT '验收服务选择（Y:选择，N:未选择）',
  `remarks` varchar(200) NOT NULL COMMENT '施工备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目图纸';

-- ----------------------------
-- Records of sp_project_product
-- ----------------------------

-- ----------------------------
-- Table structure for sp_project_worker
-- ----------------------------
DROP TABLE IF EXISTS `sp_project_worker`;
CREATE TABLE `sp_project_worker` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目关联ID',
  `worker_id` char(32) NOT NULL COMMENT '关联产品',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `re_cost` decimal(10,2) NOT NULL COMMENT '参考日劳务费',
  `remarks` varchar(200) NOT NULL COMMENT '施工备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目工人预约';

-- ----------------------------
-- Records of sp_project_worker
-- ----------------------------

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
INSERT INTO `sp_role` VALUES ('B4E3A62B31EF4699A0D13774ACB39E72', '业务员', 'yewuyuan', 'N', 'Y', '2018-03-07 10:22:49', '2018-03-14 16:33:49');

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
INSERT INTO `sp_role_app` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'F5683D5AFB22403BAC8B7CB83CE04689', '2018-03-07 15:10:17');

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
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'authword:edit', '2018-03-14 16:55:04');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'authword:run', '2018-03-14 16:55:04');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'authword:start', '2018-03-14 16:55:04');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'authword:stop', '2018-03-14 16:55:04');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'cc', '2018-03-07 14:27:58');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'create', '2018-03-07 14:27:58');
INSERT INTO `sp_role_authword` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'test1', '2018-03-07 14:27:58');

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
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '11ED187B6A254FF485FA8A97A13D8C67', '2018-03-14 15:53:08');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '1591CACECD964ED7B39FBD9836EB6773', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '1AF2BD180C514CF3B0217DC6958C14D4', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '332711F151F848559A2421ECEDDBE4A8', '2018-03-14 15:31:21');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '3EAD7806D81448509A6103D0B485D51D', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '42D0C74564274CA081096FFB895B3CAA', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '57E5CB7728614328A07D96C407F1CA96', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '699ADEA60A5F43A6A46099572B9B86DC', '2018-03-01 15:46:09');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '6E749C60FF1B4A8F80496AE367AF3FC8', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', '80BF1CAB24F74B67A2C04141FC9D7E3D', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'A68D10B6CBF54600B079A34BA173B90E', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'B3CFAFACB12F4A298983651794ECA98D', '2018-03-07 15:10:17');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'C05923B4168E446984956A7056FACAF7', '2018-03-23 16:41:43');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'DE47A7717B774DCD9C8AEBDF4124651B', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'E26663B00591407F8F441A18ACA3E96A', '2018-03-07 15:09:51');
INSERT INTO `sp_role_menu` VALUES ('B3207D8F6D134F80B3976584A06816C0', 'F8AEDD4107BE4820BED3BA9CABCD5F84', '2018-03-14 15:53:08');

-- ----------------------------
-- Table structure for sp_system
-- ----------------------------
DROP TABLE IF EXISTS `sp_system`;
CREATE TABLE `sp_system` (
  `id` char(32) NOT NULL COMMENT '主键',
  `title` varchar(32) NOT NULL COMMENT '网站标题',
  `subtitle` varchar(80) NOT NULL COMMENT '副标题',
  `website` varchar(200) NOT NULL COMMENT '网站主页',
  `logo_url` varchar(200) NOT NULL COMMENT '网站Logo地址',
  `copyright` varchar(120) NOT NULL COMMENT '版权信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统基本信息';

-- ----------------------------
-- Records of sp_system
-- ----------------------------
INSERT INTO `sp_system` VALUES ('CC5172B4918546328542CEAB45163E44', '后台管理系统', '后台管理系统', 'http://www.team-union.com/index', '2018/03/14/80C34C1FB6064E4CB54F869FD426DFB6.png', '版权所有 © 2017-2018 豫ICP备15021339号-1');

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
INSERT INTO `sp_system_app` VALUES ('0069E3F00F684E6284756D0D7BB0C743', '业务菜单', 'fa fa-sitemap', '1');
INSERT INTO `sp_system_app` VALUES ('53BA97935D824733856E4F3655883039', '用户权限', 'fa fa-users', '2');
INSERT INTO `sp_system_app` VALUES ('F5683D5AFB22403BAC8B7CB83CE04689', '系统管理', 'fa fa-server', '3');

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
INSERT INTO `sp_system_authword` VALUES ('326A684E128A48ADA902260D2D8946D2', 'E26663B00591407F8F441A18ACA3E96A', '立即执行', 'authword:run', '&#40;单次&#41;立即执行任务');
INSERT INTO `sp_system_authword` VALUES ('3D8A097CE274432D9343CFF371729160', 'E26663B00591407F8F441A18ACA3E96A', '启动任务', 'authword:start', '启动任务');
INSERT INTO `sp_system_authword` VALUES ('40CDFADD18FC4542A7F283F5348DB46A', 'E26663B00591407F8F441A18ACA3E96A', '暂停任务', 'authword:stop', '暂停任务');
INSERT INTO `sp_system_authword` VALUES ('AE9BA8E3C63A403FA9B79EFC10E00982', '6E749C60FF1B4A8F80496AE367AF3FC8', 'cc', 'cc', 'cc');
INSERT INTO `sp_system_authword` VALUES ('B7F0E586086B4A7E9C85E5742CDD6513', 'E26663B00591407F8F441A18ACA3E96A', '修改权限字', 'authword:edit', '修改权限字');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统文件（内部上传）';

-- ----------------------------
-- Records of sp_system_file
-- ----------------------------
INSERT INTO `sp_system_file` VALUES ('80C34C1FB6064E4CB54F869FD426DFB6', 'Logo.png', '2018/03/14/80C34C1FB6064E4CB54F869FD426DFB6.png', 'image/png (.png)', '1300', '', '2018-03-14 17:17:25');

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
INSERT INTO `sp_system_menu` VALUES ('11ED187B6A254FF485FA8A97A13D8C67', 'F8AEDD4107BE4820BED3BA9CABCD5F84', '53BA97935D824733856E4F3655883039', '1', '用户管理', 'fa fa-gg-circle', 'user/index');
INSERT INTO `sp_system_menu` VALUES ('1591CACECD964ED7B39FBD9836EB6773', 'B3CFAFACB12F4A298983651794ECA98D', 'F5683D5AFB22403BAC8B7CB83CE04689', '2', '系统权限字', 'fa fa-caret-right', 'system/authword');
INSERT INTO `sp_system_menu` VALUES ('1AF2BD180C514CF3B0217DC6958C14D4', '0', '0069E3F00F684E6284756D0D7BB0C743', '1', '小程序', 'fa fa-gg-circle', '');
INSERT INTO `sp_system_menu` VALUES ('332711F151F848559A2421ECEDDBE4A8', 'DE47A7717B774DCD9C8AEBDF4124651B', 'F5683D5AFB22403BAC8B7CB83CE04689', '1', '图片资源', 'fa fa-caret-right', 'systemFile/index');
INSERT INTO `sp_system_menu` VALUES ('3EAD7806D81448509A6103D0B485D51D', '6E749C60FF1B4A8F80496AE367AF3FC8', '53BA97935D824733856E4F3655883039', '2', '角色授权', 'fa fa-caret-right', 'role/auth');
INSERT INTO `sp_system_menu` VALUES ('42D0C74564274CA081096FFB895B3CAA', '1AF2BD180C514CF3B0217DC6958C14D4', '0069E3F00F684E6284756D0D7BB0C743', '1', '横幅轮播', 'fa fa-gg-circle', 'mp/banner/index');
INSERT INTO `sp_system_menu` VALUES ('57E5CB7728614328A07D96C407F1CA96', '6E749C60FF1B4A8F80496AE367AF3FC8', '53BA97935D824733856E4F3655883039', '1', '角色管理', 'fa fa-caret-right', 'role/index');
INSERT INTO `sp_system_menu` VALUES ('6E749C60FF1B4A8F80496AE367AF3FC8', '0', '53BA97935D824733856E4F3655883039', '2', '用户权限', 'fa fa-lock', '');
INSERT INTO `sp_system_menu` VALUES ('80BF1CAB24F74B67A2C04141FC9D7E3D', 'B3CFAFACB12F4A298983651794ECA98D', 'F5683D5AFB22403BAC8B7CB83CE04689', '1', '基本配置', 'fa fa-caret-right', 'system/config');
INSERT INTO `sp_system_menu` VALUES ('A68D10B6CBF54600B079A34BA173B90E', 'B3CFAFACB12F4A298983651794ECA98D', 'F5683D5AFB22403BAC8B7CB83CE04689', '3', '系统应用菜单', 'fa fa-caret-right', 'system/menu');
INSERT INTO `sp_system_menu` VALUES ('B3CFAFACB12F4A298983651794ECA98D', '0', 'F5683D5AFB22403BAC8B7CB83CE04689', '1', '系统管理', 'fa fa-server', '');
INSERT INTO `sp_system_menu` VALUES ('C05923B4168E446984956A7056FACAF7', '1AF2BD180C514CF3B0217DC6958C14D4', '0069E3F00F684E6284756D0D7BB0C743', '2', 'Channel', 'fa fa-gg-circle', 'mp/channel/index');
INSERT INTO `sp_system_menu` VALUES ('DE47A7717B774DCD9C8AEBDF4124651B', '0', 'F5683D5AFB22403BAC8B7CB83CE04689', '2', '系统资源', 'fa fa-upload', '');
INSERT INTO `sp_system_menu` VALUES ('E26663B00591407F8F441A18ACA3E96A', 'B3CFAFACB12F4A298983651794ECA98D', 'F5683D5AFB22403BAC8B7CB83CE04689', '4', '定时任务', 'fa fa-caret-right', 'timedTask/index');
INSERT INTO `sp_system_menu` VALUES ('F8AEDD4107BE4820BED3BA9CABCD5F84', '0', '53BA97935D824733856E4F3655883039', '1', '用户管理', 'fa fa-user', '');

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
INSERT INTO `sp_system_user` VALUES ('3E8657B0E9B84023A3C16AF91E13E620', '司仲夏', 'sizhongxia', '18518436862', '2410042aea633697cff3e2e19a7dd726', 'B3207D8F6D134F80B3976584A06816C0', '管理员', 'Y', '2017-12-27 11:29:22', '2018-03-14 16:30:39', '2018-03-24 21:59:28');
INSERT INTO `sp_system_user` VALUES ('DD97288F1C5347629D15B84221892D9F', '1', '1', '1', '2410042aea633697cff3e2e19a7dd726', 'B4E3A62B31EF4699A0D13774ACB39E72', '1', 'N', '2018-03-14 16:31:22', '2018-03-14 16:43:35', '2018-03-14 16:43:41');

-- ----------------------------
-- Table structure for sp_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_user`;
CREATE TABLE `sp_user` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_name` varchar(20) NOT NULL,
  `head_pic_url` varchar(200) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `gender` int(11) NOT NULL COMMENT '性别（1:男，0:女）',
  `age` int(11) NOT NULL COMMENT '年龄',
  `province` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `county` varchar(20) NOT NULL COMMENT '区县',
  `account_status` char(1) NOT NULL COMMENT '账号状态（Y:正常，N:禁用，D:申请中）',
  `user_type` char(1) NOT NULL COMMENT '用户类别（P:城市合伙人，W:劳务工人，C:客户）',
  `regist_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `delete_flag` char(1) NOT NULL COMMENT '账号状态（Y:已移除，N:未移除）',
  `delete_time` datetime NOT NULL COMMENT '移除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基础信息表';

-- ----------------------------
-- Records of sp_user
-- ----------------------------

-- ----------------------------
-- Table structure for sp_user_customer
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_customer`;
CREATE TABLE `sp_user_customer` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `company_id` char(32) NOT NULL COMMENT '关联平台公司基础库',
  `industry` varchar(50) NOT NULL COMMENT '行业',
  `status` char(1) NOT NULL COMMENT '账号状态（Y:正常，N:禁用，D:申请中）',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Records of sp_user_customer
-- ----------------------------

-- ----------------------------
-- Table structure for sp_user_identity_card
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_identity_card`;
CREATE TABLE `sp_user_identity_card` (
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `identity_card` varchar(30) NOT NULL COMMENT '身份证号',
  `identity_card_front_pic` varchar(200) NOT NULL COMMENT '身份证正面图片',
  `identity_card_back_pic` varchar(200) NOT NULL COMMENT '身份证背面图片',
  `audit_state` char(1) NOT NULL COMMENT '审核状态（Y:审核通过，N:审核未通过，D:审核中）',
  `audit_time` datetime NOT NULL COMMENT '审核时间',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户身份证信息表';

-- ----------------------------
-- Records of sp_user_identity_card
-- ----------------------------

-- ----------------------------
-- Table structure for sp_user_partner
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_partner`;
CREATE TABLE `sp_user_partner` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `apply_reason` varchar(200) NOT NULL COMMENT '申请理由',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `apply_status` char(1) NOT NULL COMMENT '账号状态（Y:已通过，N:未通过，D:申请中）',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市合伙人';

-- ----------------------------
-- Records of sp_user_partner
-- ----------------------------

-- ----------------------------
-- Table structure for sp_user_worker
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_worker`;
CREATE TABLE `sp_user_worker` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `worker_no` int(11) NOT NULL COMMENT '工号ID',
  `grade_level` decimal(2,1) NOT NULL DEFAULT '3.5' COMMENT '用户评分',
  `address_detail` varchar(200) NOT NULL COMMENT '详细地址',
  `account_status` char(1) NOT NULL COMMENT '账号状态（Y:正常，N:禁用，D:申请中）',
  `margin_state` char(1) NOT NULL COMMENT '施工保证金缴纳状态（Y:已缴纳，N:未缴纳）',
  `balance` decimal(10,2) NOT NULL COMMENT '余额',
  `remarks` varchar(500) NOT NULL COMMENT '描述',
  `last_order_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后接单时间',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人';

-- ----------------------------
-- Records of sp_user_worker
-- ----------------------------

-- ----------------------------
-- Table structure for sp_user_wxoauth
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_wxoauth`;
CREATE TABLE `sp_user_wxoauth` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `open_id` varchar(50) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `avatar_url` varchar(200) NOT NULL,
  `gender` int(11) NOT NULL COMMENT '性别',
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:取消绑定）',
  `create_time` datetime NOT NULL COMMENT '关联时间',
  `unbind_time` datetime NOT NULL COMMENT '取消绑定时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户oAuth验证登录';

-- ----------------------------
-- Records of sp_user_wxoauth
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_aptitude
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_aptitude`;
CREATE TABLE `sp_worker_aptitude` (
  `id` char(32) NOT NULL,
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `product_id` char(32) NOT NULL COMMENT '学习产品关联ID',
  `model` varchar(50) NOT NULL COMMENT '产品型号',
  `apply_info` varchar(200) NOT NULL COMMENT '申请说明',
  `apply_status` char(1) NOT NULL COMMENT '申请状态（Y:申请通过，N:申请驳回，D:待处理）',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `worker_id` (`worker_id`),
  CONSTRAINT `sp_worker_aptitude_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `sp_user_worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人资质申请';

-- ----------------------------
-- Records of sp_worker_aptitude
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_balance_log`;
CREATE TABLE `sp_worker_balance_log` (
  `id` char(32) NOT NULL COMMENT '主键',
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `bef_balance` decimal(10,2) NOT NULL COMMENT '之前余额',
  `change_money` decimal(10,2) NOT NULL COMMENT '变更金额',
  `aft_balance` decimal(10,2) NOT NULL COMMENT '之后余额',
  `status` char(1) NOT NULL COMMENT '变更状态（Y:已入账，N:已取消，D:未入账）',
  `remarks` varchar(200) NOT NULL COMMENT '提现备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `handle_time` datetime NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `worker_id` (`worker_id`),
  CONSTRAINT `sp_worker_balance_log_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `sp_user_worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人余额变更表';

-- ----------------------------
-- Records of sp_worker_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_cash_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_cash_log`;
CREATE TABLE `sp_worker_cash_log` (
  `id` char(32) NOT NULL COMMENT '主键',
  `cash_cost` decimal(10,2) NOT NULL COMMENT '提现金额',
  `serial_number` varchar(80) NOT NULL COMMENT '提现流水号',
  `cash_status` char(1) NOT NULL COMMENT '提现状态（Y:已到账，D:进行中，N:已撤销）',
  `cash_remarks` varchar(200) NOT NULL COMMENT '提现备注',
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `handle_time` datetime NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人提现记录表';

-- ----------------------------
-- Records of sp_worker_cash_log
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_order`;
CREATE TABLE `sp_worker_order` (
  `id` char(32) NOT NULL COMMENT '主键',
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `project_id` char(32) NOT NULL COMMENT '项目ID',
  `product_id` char(32) NOT NULL COMMENT '产品关联ID',
  `order_source` char(1) NOT NULL COMMENT '订单来源类型（C:客户直接选择，W:劳务工人转接，P:平台转接，U:个人接单）',
  `source_id` char(32) NOT NULL COMMENT '来源关联ID',
  `order_status` char(1) NOT NULL COMMENT '订单状态（Y:已接收，P:已取消（转平台），W:已取消（转工人），D:待处理）',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `worker_id` (`worker_id`),
  CONSTRAINT `sp_worker_order_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `sp_user_worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人资质申请';

-- ----------------------------
-- Records of sp_worker_order
-- ----------------------------
