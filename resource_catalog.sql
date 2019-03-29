/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.85_root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.0.0.85:3306
 Source Schema         : resource_catalog

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 26/03/2019 11:01:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fileupload
-- ----------------------------
DROP TABLE IF EXISTS `fileupload`;
CREATE TABLE `fileupload`  (
  `id` int(22) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `col0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序号',
  `col1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门类信息资源分类',
  `col2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项分类',
  `col3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目分类',
  `col4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '细目分类1',
  `col5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '细目分类1.1',
  `col6` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联业务事项',
  `col7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源名称',
  `col8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源代码',
  `col9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下设机构',
  `col10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源摘要',
  `col11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源格式分类',
  `col12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源格式类型',
  `col13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他类型资源格式描述',
  `col14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息项名称',
  `col15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `col16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据长度',
  `col17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共享类型',
  `col18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共享条件/不予共享依据',
  `col19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共享方式分类',
  `col20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共享方式类型',
  `col21` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否向社会开放',
  `col22` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开放条件',
  `col23` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新周期',
  `col24` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布日期',
  `col25` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开放主题分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_catalog
-- ----------------------------
DROP TABLE IF EXISTS `rc_catalog`;
CREATE TABLE `rc_catalog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '使用32位UUID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '目录分类父节点ID',
  `parent_full_code` varchar(52) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录分类编码全称（包含所有父节点分类编码）',
  `resource_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录分类名称',
  `resource_encode` varchar(52) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录分类编码',
  `dept` int(3) NULL DEFAULT NULL COMMENT '层级深度',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID，实现组合隔离功能',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `父节点编码索引`(`parent_full_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1672109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源管理目录配置表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_catalog
-- ----------------------------
INSERT INTO `rc_catalog` VALUES (1672101, 0, '0', '基础类', '1', 1, 528, 'new88', '2019-03-22 11:03:53', 'new88', '2019-03-22 11:03:53');
INSERT INTO `rc_catalog` VALUES (1672102, 0, '0', '主题类', '2', 1, 528, 'new88', '2019-03-22 11:03:53', 'new88', '2019-03-22 11:03:53');
INSERT INTO `rc_catalog` VALUES (1672103, 0, '0', '部门类', '3', 1, 528, 'new88', '2019-03-22 11:03:53', 'new88', '2019-03-22 11:03:53');
INSERT INTO `rc_catalog` VALUES (1672104, 1672101, '1', '一层', '12', 2, 528, 'new88', '2019-03-22 11:07:39', 'new88', '2019-03-22 11:07:39');
INSERT INTO `rc_catalog` VALUES (1672105, 1672101, '1', '林', '33', 2, 528, 'new88', '2019-03-22 11:08:15', 'new88', '2019-03-22 11:08:15');
INSERT INTO `rc_catalog` VALUES (1672106, 1672101, '1', 'w231', '56', 2, 528, 'new88', '2019-03-22 11:08:34', 'new88', '2019-03-22 11:08:34');
INSERT INTO `rc_catalog` VALUES (1672107, 1672104, '112', '二层', '461', 3, 528, 'new88', '2019-03-22 11:09:04', 'new88', '2019-03-22 11:09:04');
INSERT INTO `rc_catalog` VALUES (1672108, 1672107, '112461', '三层', '465423', 4, 528, 'new88', '2019-03-22 11:09:30', 'new88', '2019-03-22 11:09:30');

-- ----------------------------
-- Table structure for rc_catalog_resource
-- ----------------------------
DROP TABLE IF EXISTS `rc_catalog_resource`;
CREATE TABLE `rc_catalog_resource`  (
  `depth` int(11) NULL DEFAULT NULL COMMENT '资源所在层级深度，第一层是三大库',
  `catalog_id` bigint(20) NULL DEFAULT NULL COMMENT '资源目录ID',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源信息ID',
  INDEX `idx_catalog_id_resource_id`(`catalog_id`, `resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息资源分类ID和 信息资源详情ID 映射表\r\n主要解决：资源分类修改 资源分类名称和ID时，信息资源详情里面 资源分类信息同步问题\r\n添加原则是 ： 如 身份证信息， 分类为：基础库/人口信息库/个人信息/身份证， 对应分类ID为： 11,24,52,69\r\n则在该map表中插入4条数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_catalog_resource
-- ----------------------------
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3274);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3274);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3274);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3274);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3282);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3282);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3282);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3282);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3283);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3283);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3283);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3283);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3284);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3284);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3284);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3284);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3285);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3285);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3285);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3285);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3286);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3286);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3286);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3286);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3287);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3287);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3287);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3287);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3288);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3288);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3288);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3288);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3289);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3289);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3289);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3289);
INSERT INTO `rc_catalog_resource` VALUES (1, 1672101, 3290);
INSERT INTO `rc_catalog_resource` VALUES (2, 1672104, 3290);
INSERT INTO `rc_catalog_resource` VALUES (3, 1672107, 3290);
INSERT INTO `rc_catalog_resource` VALUES (4, 1672108, 3290);

-- ----------------------------
-- Table structure for rc_data_upload
-- ----------------------------
DROP TABLE IF EXISTS `rc_data_upload`;
CREATE TABLE `rc_data_upload`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_id` bigint(20) NOT NULL COMMENT '资源ID',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态:wait_import等待入库,importing入库中,import_complete已入库,import_error入库失败',
  `data_batch` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据批次，格式为yyyy-MM-dd',
  `data_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'DB数据库/FILE文件',
  `import_time` datetime(0) NULL DEFAULT NULL COMMENT '入库时间',
  `import_count` bigint(100) NULL DEFAULT NULL COMMENT '入库数据量',
  `insert_count` bigint(100) NULL DEFAULT NULL COMMENT '入库新增数据量(DB)',
  `update_count` bigint(100) NULL DEFAULT NULL COMMENT '入库更新数据量(DB)',
  `fail_count` bigint(100) NULL DEFAULT NULL COMMENT '入库错误数据量(DB)',
  `import_task_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ETL的任务号:UP+部门编码+’-’+5位顺序号',
  `task_seq` bigint(20) NULL DEFAULT NULL COMMENT '顺序号,全局累加',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  `subscribe_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ETL反馈的任务ID',
  `exec_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ETL单次执行ID',
  `import_errmsg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ETL任务执行失败原因',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID用于租户管理',
  PRIMARY KEY (`id`, `resource_id`) USING BTREE,
  INDEX `idx_resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_data_upload
-- ----------------------------
INSERT INTO `rc_data_upload` VALUES (54, 3285, 'IMPORT_COMPLETE', '2019-03-15', 'DB', '2019-03-22 22:22:31', 2, 2, 0, 0, 'UP00000388', 388, 'new88', '2019-03-22 22:08:15', 'new88', '2019-03-22 22:10:07', 'SUB_UP00000388', '8f7539c25d1c4fbd94c83dbc04b8818b', 'Finished', 528);

-- ----------------------------
-- Table structure for rc_data_upload_detail
-- ----------------------------
DROP TABLE IF EXISTS `rc_data_upload_detail`;
CREATE TABLE `rc_data_upload_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT 'data_upload表主键',
  `origin_file_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始库中的文件名(UUID)',
  `pub_file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布出来的文件名',
  `file_size` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_data_upload_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_data_upload_detail
-- ----------------------------
INSERT INTO `rc_data_upload_detail` VALUES (54, 54, '5cbcf158c536433795eedae3397aee7d.xlsx', '112461465423-654564.xlsx', '3597', '.xlsx', NULL, 'new88', '2019-03-22 22:08:15', 'new88', '2019-03-22 22:08:15');

-- ----------------------------
-- Table structure for rc_dept_limited
-- ----------------------------
DROP TABLE IF EXISTS `rc_dept_limited`;
CREATE TABLE `rc_dept_limited`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID(自动增加)',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '引用资源标识符id ',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '引用部门id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间 ',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人 ',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间 ',
  `updater` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人 ',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(软删除用n) ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource_id_dept_id`(`resource_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_dept_limited
-- ----------------------------
INSERT INTO `rc_dept_limited` VALUES (29, 3274, 4775, '2019-03-22 11:10:49', 'new88', '2019-03-22 11:10:49', 'new88', 'Y');
INSERT INTO `rc_dept_limited` VALUES (38, 3282, 4775, '2019-03-22 17:28:47', 'new88', '2019-03-22 17:28:47', 'new88', 'Y');
INSERT INTO `rc_dept_limited` VALUES (39, 3282, 4784, '2019-03-22 17:28:47', 'new88', '2019-03-22 17:28:47', 'new88', 'Y');
INSERT INTO `rc_dept_limited` VALUES (40, 3283, 4775, '2019-03-22 18:02:31', 'new88', '2019-03-22 18:02:31', 'new88', 'Y');
INSERT INTO `rc_dept_limited` VALUES (41, 3284, NULL, '2019-03-22 18:05:52', 'new88', '2019-03-22 18:05:52', 'new88', 'Y');
INSERT INTO `rc_dept_limited` VALUES (42, 3287, 4773, '2019-03-22 18:13:47', 'new88', '2019-03-22 18:13:47', 'new88', 'Y');
INSERT INTO `rc_dept_limited` VALUES (43, 3289, 4773, '2019-03-22 20:19:32', 'new88', '2019-03-22 20:19:32', 'new88', 'Y');

-- ----------------------------
-- Table structure for rc_dict
-- ----------------------------
DROP TABLE IF EXISTS `rc_dict`;
CREATE TABLE `rc_dict`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键序号',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `use_count` bigint(20) NULL DEFAULT NULL COMMENT '使用次数，大于0表示有资源使用\r\n',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID，用于租户隔离',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `type_parent_id` bigint(11) NULL DEFAULT NULL COMMENT '所属类型ID:父字典ID，没有则为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 632 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源共享字典\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_dict
-- ----------------------------
INSERT INTO `rc_dict` VALUES (570, '1', '电子文件', 'classify', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 17:27:34', 0);
INSERT INTO `rc_dict` VALUES (571, 'OFD', 'OFD', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (572, 'wps', 'wps', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (573, 'xml', 'xml', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (574, 'txt', 'txt', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (575, 'doc', 'doc', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 17:27:34', 570);
INSERT INTO `rc_dict` VALUES (576, 'docx', 'docx', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (577, 'html', 'html', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (578, 'pdf', 'pdf', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (579, 'ppt', 'ppt', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (580, 'pptx', 'pptx', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 570);
INSERT INTO `rc_dict` VALUES (581, '2', '电子表格', 'classify', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 0);
INSERT INTO `rc_dict` VALUES (582, 'et', 'et', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 581);
INSERT INTO `rc_dict` VALUES (583, 'xls', 'xls', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 581);
INSERT INTO `rc_dict` VALUES (584, 'xlsx', 'xlsx', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 581);
INSERT INTO `rc_dict` VALUES (585, '3', '数据库', 'classify', 22, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 21:23:08', 0);
INSERT INTO `rc_dict` VALUES (586, 'MySQL', 'MySQL', 'type', 12, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 20:18:47', 585);
INSERT INTO `rc_dict` VALUES (587, 'Oracle', 'Oracle', 'type', 10, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 21:23:08', 585);
INSERT INTO `rc_dict` VALUES (588, '4', '图形图像', 'classify', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 0);
INSERT INTO `rc_dict` VALUES (589, 'jpg', 'jpg', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 588);
INSERT INTO `rc_dict` VALUES (590, 'gif', 'gif', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 588);
INSERT INTO `rc_dict` VALUES (591, 'bmp', 'bmp', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 588);
INSERT INTO `rc_dict` VALUES (592, '5', '流媒体', 'classify', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 0);
INSERT INTO `rc_dict` VALUES (593, 'swf', 'swf', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 592);
INSERT INTO `rc_dict` VALUES (594, 'rm', 'rm', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 592);
INSERT INTO `rc_dict` VALUES (595, 'mpg', 'mpg', 'type', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 592);
INSERT INTO `rc_dict` VALUES (596, '6', '自描述格式', 'classify', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 0);
INSERT INTO `rc_dict` VALUES (597, '7', '服务接口', 'classify', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 0);
INSERT INTO `rc_dict` VALUES (598, '1', '数据库', 'share', 22, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 21:23:08', 0);
INSERT INTO `rc_dict` VALUES (599, '2', '文件下载', 'share', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 17:27:34', 0);
INSERT INTO `rc_dict` VALUES (600, '3', '服务方式', 'share', 0, 528, 'new88', '2019-03-22 16:58:57', 'new88', '2019-03-22 16:58:57', 0);
INSERT INTO `rc_dict` VALUES (601, '1', '电子文件', 'classify', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (602, 'OFD', 'OFD', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (603, 'wps', 'wps', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (604, 'xml', 'xml', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (605, 'txt', 'txt', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (606, 'doc', 'doc', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (607, 'docx', 'docx', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (608, 'html', 'html', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (609, 'pdf', 'pdf', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (610, 'ppt', 'ppt', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (611, 'pptx', 'pptx', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 601);
INSERT INTO `rc_dict` VALUES (612, '2', '电子表格', 'classify', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (613, 'et', 'et', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 612);
INSERT INTO `rc_dict` VALUES (614, 'xls', 'xls', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 612);
INSERT INTO `rc_dict` VALUES (615, 'xlsx', 'xlsx', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 612);
INSERT INTO `rc_dict` VALUES (616, '3', '数据库', 'classify', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (617, 'MySQL', 'MySQL', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 616);
INSERT INTO `rc_dict` VALUES (618, 'Oracle', 'Oracle', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 616);
INSERT INTO `rc_dict` VALUES (619, '4', '图形图像', 'classify', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (620, 'jpg', 'jpg', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 619);
INSERT INTO `rc_dict` VALUES (621, 'gif', 'gif', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 619);
INSERT INTO `rc_dict` VALUES (622, 'bmp', 'bmp', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 619);
INSERT INTO `rc_dict` VALUES (623, '5', '流媒体', 'classify', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (624, 'swf', 'swf', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 623);
INSERT INTO `rc_dict` VALUES (625, 'rm', 'rm', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 623);
INSERT INTO `rc_dict` VALUES (626, 'mpg', 'mpg', 'type', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 623);
INSERT INTO `rc_dict` VALUES (627, '6', '自描述格式', 'classify', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (628, '7', '服务接口', 'classify', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (629, '1', '数据库', 'share', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (630, '2', '文件下载', 'share', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);
INSERT INTO `rc_dict` VALUES (631, '3', '服务方式', 'share', 0, 443, 'xionghan1', '2019-03-22 18:40:34', 'xionghan1', '2019-03-22 18:40:34', 0);

-- ----------------------------
-- Table structure for rc_exchange_info
-- ----------------------------
DROP TABLE IF EXISTS `rc_exchange_info`;
CREATE TABLE `rc_exchange_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键\r\n',
  `subscribe_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订阅编码',
  `resource_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息资源编码',
  `resource_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息资源类型file/db',
  `subscribe_dept_info` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门统一社会信用编码',
  `subscribe_dept_info_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '截止日期',
  `db_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库IP',
  `db_port` bigint(20) NULL DEFAULT NULL COMMENT '数据库端口',
  `db_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型DM7/ORACLE/MYSQL/POSTGRESQL',
  `db_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库用户名',
  `db_password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
  `db_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `db_schema_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库模式名称',
  `db_table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库表名',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行结果:fail/success/wait/running',
  `exec_info` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行异常信息',
  `creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主要存储和第三方订阅交换交互信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_exchange_task
-- ----------------------------
DROP TABLE IF EXISTS `rc_exchange_task`;
CREATE TABLE `rc_exchange_task`  (
  `id` bigint(11) NOT NULL COMMENT '关联rc_exchange_info主键',
  `seq` bigint(20) NOT NULL COMMENT '编号\r\n',
  `sub_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅编号:SUB+seq',
  `subscribe_id` bigint(20) NULL DEFAULT NULL COMMENT 'rc_subscribe表中ID，能够到rc_subscribe表方便用户可查询，因为和第三方系统资源目录信息没有同步，\r\n一旦信息同步可查询，将记录插入到rc_subscribe.',
  `resource_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息资源编码\r\n',
  `src_meta_id` bigint(20) NULL DEFAULT NULL COMMENT '源数据的元数据ID\r\n',
  `dest_meta_id` bigint(20) NULL DEFAULT NULL COMMENT '目标数据的元数据ID\r\n',
  `subscribe_dept_id` bigint(20) NULL DEFAULT NULL COMMENT '订阅部门ID ',
  `subscribe_dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅部门名称',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主要是存储交换信息生成的任务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_file
-- ----------------------------
DROP TABLE IF EXISTS `rc_file`;
CREATE TABLE `rc_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source` int(255) NULL DEFAULT 1 COMMENT '附件来源 暂定 1服务说明 2数据上报',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT 'source=1时，为服务id',
  `storage_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际存储的文件名',
  `origin_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `file_size` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `file_extension` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `file_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除字段 1 表示删除， 0 表示未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_month_statistics
-- ----------------------------
DROP TABLE IF EXISTS `rc_month_statistics`;
CREATE TABLE `rc_month_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月度名称yyyymm',
  `sub_count` int(11) NULL DEFAULT NULL COMMENT '订阅总次数',
  `pub_count` int(11) NULL DEFAULT NULL COMMENT '发布资源总量',
  `reg_count` int(11) NULL DEFAULT NULL COMMENT '注册资源总量',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID，用户租户隔离',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月度统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_month_statistics
-- ----------------------------
INSERT INTO `rc_month_statistics` VALUES (7, '201903', 2, 6, 6, 528, 'admin', '2019-03-22 11:20:00', 'admin', '2019-03-23 16:40:00');

-- ----------------------------
-- Table structure for rc_resource
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource`;
CREATE TABLE `rc_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源ID(自动增加）',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID,用于租户隔离',
  `catalog_full_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源分类名如：基础库/人口信息库/个人信息/身份证',
  `catalog_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源分类(来自信息资源分类表）',
  `seq_num` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源顺序号',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源编码，由catalog_code +”/”+ seq_num，自动生成',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `remark` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源摘要',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源提供方名称',
  `dept_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息资源提供方代码',
  `dept_name_ids` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提供方部门 IDs',
  `resource_abstract` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源摘要',
  `keyword` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字,将来扩展功能',
  `format_type` tinyint(1) NULL DEFAULT NULL COMMENT '资源格式大类:1电子文件，2电子表格，3数据库，4图形图像，5流媒体，6自描述格式，7服务接口',
  `format_info` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源格式信息（mysql,oracle,db2,sqlserver，文件，pdf,xls等）',
  `format_info_extend` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '格式补充说明',
  `share_type` tinyint(11) NULL DEFAULT 3 COMMENT '共享类型（无条件共享、有条件共享、不予共享三类。值域范围对应共享类型排序分别为1、2、3。）',
  `share_condition` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共享条件，当有条件共享时填写',
  `share_method` tinyint(11) NULL DEFAULT NULL COMMENT '共享方式：1数据库，2文件下载，3webservice服务',
  `open_type` tinyint(11) NULL DEFAULT 0 COMMENT '是否向社会开放，1是，0否',
  `open_condition` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对向社会开放资源的条件描述。当“是否向社会开放”取值为 1 时，描述开放条件',
  `refresh_cycle` tinyint(11) NULL DEFAULT NULL COMMENT '更新周期（信息资源更新的频度。分为实时1、每日2、每周3、每月4、每季度5、每年6等。）',
  `pub_date` datetime(0) NULL DEFAULT NULL COMMENT '政务信息资源提供方发布共享、开放政务信息资源的日期CCYY-MM-DD',
  `relation_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联资源代码',
  `bind_table_id` bigint(20) NULL DEFAULT NULL COMMENT '绑定table的唯一标识id，仅当资源类型为数据库时填写',
  `lib_table_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型时候，数据和表id',
  `bind_service_id` bigint(20) NULL DEFAULT NULL COMMENT '绑定服务id，rc_service表主键，仅当资源类型为服务时填写',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(0.草稿 1.退回修改2.注册审核拒绝10.待注册审核19.已注册20.待发布审核22.发布审核拒绝23.取消发布29.发布)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（引用idatrix_unisecurity_user的username）',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间 ',
  `updater` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人 ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dept_code`(`dept_code`) USING BTREE,
  INDEX `idx_catalog_code`(`catalog_code`) USING BTREE,
  INDEX `idx_code`(`code`) USING BTREE,
  FULLTEXT INDEX `ft_name_dept_name`(`name`, `dept_name`) WITH PARSER `ngram` COMMENT '资源名称和提供方名称建立全文检索字段'
) ENGINE = InnoDB AUTO_INCREMENT = 3291 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_resource
-- ----------------------------
INSERT INTO `rc_resource` VALUES (3274, 528, '基础类/一层/二层/三层', '112461465423', '798456', '112461465423/798456', '四层12', '资源摘要13123EXCEL', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 2, 'xlsx', NULL, 1, NULL, 2, 0, NULL, 1, '2019-03-22 11:12:26', NULL, NULL, NULL, NULL, 'pub_success', '2019-03-22 11:10:49', 'new88', '2019-03-22 11:12:26', 'new88');
INSERT INTO `rc_resource` VALUES (3282, 528, '基础类/一层/二层/三层', '112461465423', '324523', '112461465423/324523', '数据库上报', '数据库上报', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'MySQL', NULL, 1, NULL, 1, 0, NULL, 3, NULL, NULL, 309, '测试库,309,', NULL, 'draft', '2019-03-22 17:28:47', 'new88', '2019-03-22 20:16:49', 'new88');
INSERT INTO `rc_resource` VALUES (3283, 528, '基础类/一层/二层/三层', '112461465423', '234235', '112461465423/234235', '数据库上报01', '数据库上报01', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'MySQL', NULL, 1, NULL, 1, 0, NULL, 1, '2019-03-22 18:32:49', NULL, 309, '测试库,309', NULL, 'pub_success', '2019-03-22 18:02:31', 'new88', '2019-03-22 18:32:49', 'new88');
INSERT INTO `rc_resource` VALUES (3284, 528, '基础类/一层/二层/三层', '112461465423', '167124', '112461465423/167124', 'etl5asdf234', 'sadf234', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'MySQL', NULL, 1, NULL, 1, 0, NULL, 3, NULL, NULL, 249, 'bi_repository,249,', NULL, 'draft', '2019-03-22 18:05:52', 'new88', '2019-03-22 20:18:47', 'new88');
INSERT INTO `rc_resource` VALUES (3285, 528, '基础类/一层/二层/三层', '112461465423', '654564', '112461465423/654564', 'MYSQL_last13', 'MYSQL_last13', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'MySQL', NULL, 1, NULL, 1, 0, NULL, 1, '2019-03-22 18:32:54', NULL, 309, '测试库,309', NULL, 'pub_success', '2019-03-22 18:06:16', 'new88', '2019-03-22 18:32:54', 'new88');
INSERT INTO `rc_resource` VALUES (3286, 528, '基础类/一层/二层/三层', '112461465423', '465413', '112461465423/465413', 'MSYQL46546464644646', 'MSYQL46546464644646', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'MySQL', NULL, 1, NULL, 1, 0, NULL, 1, NULL, NULL, 309, '测试库,309', NULL, 'draft', '2019-03-22 18:07:08', 'new88', '2019-03-22 18:07:08', 'new88');
INSERT INTO `rc_resource` VALUES (3287, 528, '基础类/一层/二层/三层', '112461465423', '12355', '112461465423/12355', 'etl5334', 'xcv234', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'Oracle', NULL, 1, NULL, 1, 0, NULL, 3, '2019-03-22 19:59:04', NULL, 312, 'c##zhoujian中文名,312', NULL, 'pub_success', '2019-03-22 18:13:47', 'new88', '2019-03-22 19:59:05', 'new88');
INSERT INTO `rc_resource` VALUES (3288, 528, '基础类/一层/二层/三层', '112461465423', '462313', '112461465423/462313', 'ORACLE465132', 'ORACLE465132', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'Oracle', NULL, 1, NULL, 1, 0, NULL, 3, '2019-03-22 19:59:04', NULL, 312, 'c##zhoujian中文名,312', NULL, 'pub_success', '2019-03-22 19:58:01', 'new88', '2019-03-22 19:59:04', 'new88');
INSERT INTO `rc_resource` VALUES (3289, 528, '基础类/一层/二层/三层', '112461465423', '123234', '112461465423/123234', 'etl5ddd', 'asdf234', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'Oracle', NULL, 1, NULL, 1, 0, NULL, 3, NULL, NULL, 312, 'c##zhoujian中文名,312,', NULL, 'draft', '2019-03-22 20:19:32', 'new88', '2019-03-22 20:20:18', 'new88');
INSERT INTO `rc_resource` VALUES (3290, 528, '基础类/一层/二层/三层', '112461465423', '1231', '112461465423/1231', 'oracle', 'oracle', '测试组织1', '132465456456', '4773,4775', NULL, NULL, 3, 'Oracle', NULL, 1, NULL, 1, 0, NULL, 1, '2019-03-22 21:53:48', NULL, 312, 'c##zhoujian中文名,312', NULL, 'pub_success', '2019-03-22 21:23:08', 'new88', '2019-03-22 21:53:48', 'new88');

-- ----------------------------
-- Table structure for rc_resource_approve
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_approve`;
CREATE TABLE `rc_resource_approve`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源id',
  `approver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人帐号',
  `approver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `current_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态',
  `next_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下一状态状态',
  `approve_action` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批动作:agree,reject',
  `suggestion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approve_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `active_flag` tinyint(11) NULL DEFAULT NULL COMMENT '是否当前审批：0否，1是',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_resource_approve
-- ----------------------------
INSERT INTO `rc_resource_approve` VALUES (69, 3274, 'new99', 'new99', 'wait_reg_approve', 'reg_success', 'agree', '同意。', '2019-03-22 11:11:51', 0, 'new88', '2019-03-22 11:11:21', 'new99', '2019-03-22 11:11:51');
INSERT INTO `rc_resource_approve` VALUES (70, 3274, 'new88', 'new88', 'wait_pub_approve', 'pub_success', 'agree', '同意。', '2019-03-22 11:12:26', 0, 'new99', '2019-03-22 11:11:51', 'new88', '2019-03-22 11:12:26');
INSERT INTO `rc_resource_approve` VALUES (71, 3283, 'new99', 'new99', 'wait_reg_approve', 'reg_success', 'agree', '同意。', '2019-03-22 18:08:40', 0, 'new88', '2019-03-22 18:04:55', 'new99', '2019-03-22 18:08:40');
INSERT INTO `rc_resource_approve` VALUES (72, 3285, 'new99', 'new99', 'wait_reg_approve', 'reg_success', 'agree', '同意。', '2019-03-22 18:08:40', 0, 'new88', '2019-03-22 18:06:21', 'new99', '2019-03-22 18:08:40');
INSERT INTO `rc_resource_approve` VALUES (73, 3285, 'new88', 'new88', 'wait_pub_approve', 'pub_success', 'agree', '同意。', '2019-03-22 18:32:54', 0, 'new99', '2019-03-22 18:08:40', 'new88', '2019-03-22 18:32:54');
INSERT INTO `rc_resource_approve` VALUES (74, 3283, 'new88', 'new88', 'wait_pub_approve', 'pub_success', 'agree', '同意。', '2019-03-22 18:32:49', 0, 'new99', '2019-03-22 18:08:40', 'new88', '2019-03-22 18:32:49');
INSERT INTO `rc_resource_approve` VALUES (75, 3288, 'new99', 'new99', 'wait_reg_approve', 'reg_success', 'agree', '同意。', '2019-03-22 19:58:43', 0, 'new88', '2019-03-22 19:58:17', 'new99', '2019-03-22 19:58:43');
INSERT INTO `rc_resource_approve` VALUES (76, 3287, 'new99', 'new99', 'wait_reg_approve', 'reg_success', 'agree', '同意。', '2019-03-22 19:58:39', 0, 'new88', '2019-03-22 19:58:17', 'new99', '2019-03-22 19:58:39');
INSERT INTO `rc_resource_approve` VALUES (77, 3287, 'new88', 'new88', 'wait_pub_approve', 'pub_success', 'agree', '同意。', '2019-03-22 19:59:05', 0, 'new99', '2019-03-22 19:58:39', 'new88', '2019-03-22 19:59:05');
INSERT INTO `rc_resource_approve` VALUES (78, 3288, 'new88', 'new88', 'wait_pub_approve', 'pub_success', 'agree', '同意。', '2019-03-22 19:59:04', 0, 'new99', '2019-03-22 19:58:43', 'new88', '2019-03-22 19:59:04');
INSERT INTO `rc_resource_approve` VALUES (79, 3290, 'new99', 'new99', 'wait_reg_approve', 'reg_success', 'agree', 'nn', '2019-03-22 21:53:12', 0, 'new88', '2019-03-22 21:24:00', 'new99', '2019-03-22 21:53:12');
INSERT INTO `rc_resource_approve` VALUES (80, 3290, 'new88', 'new88', 'wait_pub_approve', 'pub_success', 'agree', '同意。', '2019-03-22 21:53:48', 0, 'new99', '2019-03-22 21:53:12', 'new88', '2019-03-22 21:53:48');

-- ----------------------------
-- Table structure for rc_resource_column
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_column`;
CREATE TABLE `rc_resource_column`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '引用资源标识符id',
  `col_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `col_seq_num` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '000-999',
  `col_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型：字符型 C、数值型 N、货币型 Y、日期型 D、日期时间型 T、逻辑型 L、备注型 M、通用型 G、双精度型 B、整型 I、浮点型 F',
  `table_col_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定数据库表的列名',
  `table_col_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定数据库表的列字段',
  `required_flag` tinyint(11) NULL DEFAULT NULL COMMENT '交换时是否必选：0否，1是',
  `unique_flag` tinyint(11) NULL DEFAULT NULL COMMENT '是否主键: 0否，1是',
  `date_format` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期类型格式',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9774 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源细项信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_resource_column
-- ----------------------------
INSERT INTO `rc_resource_column` VALUES (9740, 3274, 'a', NULL, 'C', NULL, NULL, NULL, NULL, NULL, 'new88', '2019-03-22 11:10:49', 'new88', '2019-03-22 11:10:49');
INSERT INTO `rc_resource_column` VALUES (9754, 3283, 'sd', NULL, 'C', 'id', 'varchar(20)', 1, 1, '', 'new88', '2019-03-22 18:02:31', 'new88', '2019-03-22 18:02:31');
INSERT INTO `rc_resource_column` VALUES (9755, 3283, 'ge', NULL, 'C', 'group', 'varchar(100)', 0, 0, '', 'new88', '2019-03-22 18:02:31', 'new88', '2019-03-22 18:02:31');
INSERT INTO `rc_resource_column` VALUES (9757, 3285, 'id', NULL, 'C', 'id', 'varchar(20)', 1, 1, '', 'new88', '2019-03-22 18:06:16', 'new88', '2019-03-22 18:06:16');
INSERT INTO `rc_resource_column` VALUES (9758, 3285, 'group', NULL, 'C', 'group', 'varchar(100)', 0, 0, '', 'new88', '2019-03-22 18:06:16', 'new88', '2019-03-22 18:06:16');
INSERT INTO `rc_resource_column` VALUES (9759, 3286, 'id', NULL, 'C', 'id', 'varchar(20)', 1, 1, '', 'new88', '2019-03-22 18:07:08', 'new88', '2019-03-22 18:07:08');
INSERT INTO `rc_resource_column` VALUES (9762, 3287, 'ID', NULL, 'C', 'ID', 'NUMBER(22)', 1, 1, '', 'new88', '2019-03-22 19:56:19', 'new88', '2019-03-22 19:56:19');
INSERT INTO `rc_resource_column` VALUES (9763, 3287, 'NAME', NULL, 'C', 'NAME', 'VARCHAR2', 0, 0, '', 'new88', '2019-03-22 19:56:19', 'new88', '2019-03-22 19:56:19');
INSERT INTO `rc_resource_column` VALUES (9764, 3288, 'ID', NULL, 'C', 'ID', 'NUMBER(22)', 1, 1, '', 'new88', '2019-03-22 19:58:01', 'new88', '2019-03-22 19:58:01');
INSERT INTO `rc_resource_column` VALUES (9765, 3288, 'NAME', NULL, 'C', 'NAME', 'VARCHAR2', 0, 0, '', 'new88', '2019-03-22 19:58:01', 'new88', '2019-03-22 19:58:01');
INSERT INTO `rc_resource_column` VALUES (9768, 3282, '主键ID', NULL, 'C', 'id', 'varchar(20)', 1, 1, '', 'new88', '2019-03-22 20:16:49', 'new88', '2019-03-22 20:16:49');
INSERT INTO `rc_resource_column` VALUES (9769, 3282, '级别', NULL, 'C', 'level', 'int(2)', 0, 0, '', 'new88', '2019-03-22 20:16:49', 'new88', '2019-03-22 20:16:49');
INSERT INTO `rc_resource_column` VALUES (9771, 3284, 'asdf234', NULL, 'C', 'FSENTRY_LASTMOD', 'bigint(20)', 0, 0, 'yyyy-MM-dd', 'new88', '2019-03-22 20:18:47', 'new88', '2019-03-22 20:18:47');
INSERT INTO `rc_resource_column` VALUES (9772, 3290, 'id', NULL, 'C', 'ID', 'NUMBER(22)', 1, 1, '', 'new88', '2019-03-22 21:23:08', 'new88', '2019-03-22 21:23:08');
INSERT INTO `rc_resource_column` VALUES (9773, 3290, 'name', NULL, 'C', 'NAME', 'VARCHAR2', 0, 0, '', 'new88', '2019-03-22 21:23:08', 'new88', '2019-03-22 21:23:08');

-- ----------------------------
-- Table structure for rc_resource_file
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_file`;
CREATE TABLE `rc_resource_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `origin_file_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始库中的文件名',
  `pub_file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布出来的文件名',
  `file_version` int(11) NULL DEFAULT 0 COMMENT '文件版本号，每次覆盖+1',
  `data_batch` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据批次，格式为yyyy-MM-dd',
  `file_size` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间,文件更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_resource_file
-- ----------------------------
INSERT INTO `rc_resource_file` VALUES (11, 3274, '4f53691f3b6e49f68d3aa3bf6a65994d.xlsx', '入职checklist.xlsx', 1, '2019-03-22', '11981', 'xlsx', '入职', 'new88', '2019-03-22 16:09:42', 'new88', '2019-03-22 16:22:06');
INSERT INTO `rc_resource_file` VALUES (12, 3274, '6719d6a202524ae2a576c583eb1ffdd7.xlsx', '数据字典导出文档 (8).xlsx', 1, '2019-03-22', '10190', 'xlsx', 'ss', 'new88', '2019-03-22 16:26:05', 'new88', '2019-03-22 16:26:05');

-- ----------------------------
-- Table structure for rc_resource_history
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_history`;
CREATE TABLE `rc_resource_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源id',
  `action` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更动作-add,update,delete,reg_submit申请注册,reg_agree注册审批同意,reg_reject,pub_submit申请发布,pub_agree发布审批通过,pub_reject发布审批拒绝,recall下架，forupdate退回更新',
  `action_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更动作展示名称',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3352 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '政务信息资源变更历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_resource_history
-- ----------------------------
INSERT INTO `rc_resource_history` VALUES (3313, 3274, 'create', '增加', 'new88', '2019-03-22 11:10:49');
INSERT INTO `rc_resource_history` VALUES (3314, 3275, 'create', '增加', 'new88', '2019-03-22 11:58:59');
INSERT INTO `rc_resource_history` VALUES (3315, 3275, 'update', '修改', 'new88', '2019-03-22 12:14:35');
INSERT INTO `rc_resource_history` VALUES (3316, 3275, 'update', '修改', 'new88', '2019-03-22 12:14:52');
INSERT INTO `rc_resource_history` VALUES (3317, 3276, 'create', '增加', 'new88', '2019-03-22 16:40:19');
INSERT INTO `rc_resource_history` VALUES (3318, 3277, 'create', '增加', 'new88', '2019-03-22 16:53:24');
INSERT INTO `rc_resource_history` VALUES (3319, 3278, 'create', '增加', 'new88', '2019-03-22 17:02:36');
INSERT INTO `rc_resource_history` VALUES (3320, 3279, 'create', '增加', 'new88', '2019-03-22 17:13:56');
INSERT INTO `rc_resource_history` VALUES (3321, 3280, 'create', '增加', 'new88', '2019-03-22 17:17:43');
INSERT INTO `rc_resource_history` VALUES (3322, 3281, 'create', '增加', 'new88', '2019-03-22 17:21:33');
INSERT INTO `rc_resource_history` VALUES (3323, 3281, 'delete', '删除', 'new88', '2019-03-22 17:27:34');
INSERT INTO `rc_resource_history` VALUES (3324, 3280, 'delete', '删除', 'new88', '2019-03-22 17:27:34');
INSERT INTO `rc_resource_history` VALUES (3325, 3279, 'delete', '删除', 'new88', '2019-03-22 17:27:34');
INSERT INTO `rc_resource_history` VALUES (3326, 3278, 'delete', '删除', 'new88', '2019-03-22 17:27:34');
INSERT INTO `rc_resource_history` VALUES (3327, 3277, 'delete', '删除', 'new88', '2019-03-22 17:27:34');
INSERT INTO `rc_resource_history` VALUES (3328, 3276, 'delete', '删除', 'new88', '2019-03-22 17:27:34');
INSERT INTO `rc_resource_history` VALUES (3329, 3275, 'delete', '删除', 'new88', '2019-03-22 17:27:34');
INSERT INTO `rc_resource_history` VALUES (3330, 3282, 'create', '增加', 'new88', '2019-03-22 17:28:47');
INSERT INTO `rc_resource_history` VALUES (3331, 3283, 'create', '增加', 'new88', '2019-03-22 18:02:31');
INSERT INTO `rc_resource_history` VALUES (3332, 3284, 'create', '增加', 'new88', '2019-03-22 18:05:52');
INSERT INTO `rc_resource_history` VALUES (3333, 3285, 'create', '增加', 'new88', '2019-03-22 18:06:16');
INSERT INTO `rc_resource_history` VALUES (3334, 3286, 'create', '增加', 'new88', '2019-03-22 18:07:08');
INSERT INTO `rc_resource_history` VALUES (3335, 3287, 'create', '增加', 'new88', '2019-03-22 18:13:47');
INSERT INTO `rc_resource_history` VALUES (3336, 3287, 'update', '修改', 'new88', '2019-03-22 18:14:01');
INSERT INTO `rc_resource_history` VALUES (3337, 3287, 'update', '修改', 'new88', '2019-03-22 18:14:14');
INSERT INTO `rc_resource_history` VALUES (3338, 3287, 'update', '修改', 'new88', '2019-03-22 18:33:16');
INSERT INTO `rc_resource_history` VALUES (3339, 3287, 'update', '修改', 'new88', '2019-03-22 19:37:55');
INSERT INTO `rc_resource_history` VALUES (3340, 3287, 'update', '修改', 'new88', '2019-03-22 19:56:19');
INSERT INTO `rc_resource_history` VALUES (3341, 3288, 'create', '增加', 'new88', '2019-03-22 19:58:01');
INSERT INTO `rc_resource_history` VALUES (3342, 3284, 'update', '修改', 'new88', '2019-03-22 20:06:17');
INSERT INTO `rc_resource_history` VALUES (3343, 3284, 'update', '修改', 'new88', '2019-03-22 20:06:45');
INSERT INTO `rc_resource_history` VALUES (3344, 3282, 'update', '修改', 'new88', '2019-03-22 20:16:49');
INSERT INTO `rc_resource_history` VALUES (3345, 3284, 'update', '修改', 'new88', '2019-03-22 20:16:58');
INSERT INTO `rc_resource_history` VALUES (3346, 3284, 'update', '修改', 'new88', '2019-03-22 20:18:47');
INSERT INTO `rc_resource_history` VALUES (3347, 3289, 'create', '增加', 'new88', '2019-03-22 20:19:32');
INSERT INTO `rc_resource_history` VALUES (3348, 3289, 'update', '修改', 'new88', '2019-03-22 20:19:40');
INSERT INTO `rc_resource_history` VALUES (3349, 3289, 'update', '修改', 'new88', '2019-03-22 20:20:09');
INSERT INTO `rc_resource_history` VALUES (3350, 3289, 'update', '修改', 'new88', '2019-03-22 20:20:18');
INSERT INTO `rc_resource_history` VALUES (3351, 3290, 'create', '增加', 'new88', '2019-03-22 21:23:08');

-- ----------------------------
-- Table structure for rc_resource_import
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_import`;
CREATE TABLE `rc_resource_import`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源ID',
  `meta_id` bigint(20) NULL DEFAULT NULL COMMENT '资源绑定元数据里面对应ID',
  `last_count_time` datetime(0) NULL DEFAULT NULL COMMENT '上一次统计结束时间点',
  `total_record` bigint(20) NULL DEFAULT NULL COMMENT '数据库总条数',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主要记录通过ETL方式直接向资源绑定的数据库导入数据条数。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_resource_items_uppost
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_items_uppost`;
CREATE TABLE `rc_resource_items_uppost`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据主键',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '原资源id',
  `catalog_id` bigint(20) NULL DEFAULT NULL COMMENT '目录分类ID',
  `data_item_id` bigint(20) NULL DEFAULT NULL COMMENT '信息资源id',
  `info_item_Id` bigint(20) NULL DEFAULT NULL COMMENT '数据项id',
  `memo1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段1',
  `memo2` bigint(20) NULL DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_info_id`(`data_item_id`, `info_item_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源目录上报数据项目记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_resource_statistics
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_statistics`;
CREATE TABLE `rc_resource_statistics`  (
  `id` bigint(20) NOT NULL COMMENT '与rc_resouce表相同',
  `sub_count` int(11) NULL DEFAULT NULL COMMENT '订阅次数',
  `visit_count` int(11) NULL DEFAULT NULL COMMENT '浏览次数',
  `data_count` bigint(20) NULL DEFAULT NULL COMMENT '数据总量，文件类型计算计算而文件个数',
  `share_data_count` bigint(20) NULL DEFAULT NULL COMMENT '交换数据是总量',
  `data_update_time` datetime(0) NULL DEFAULT NULL COMMENT '数据更新时间',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '增加租户ID方便每天根据不同租户进行统计',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '政务信息资源统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_resource_statistics
-- ----------------------------
INSERT INTO `rc_resource_statistics` VALUES (3274, 0, 8, 2, 0, '2019-03-22 16:26:05', 'new88', '2019-03-22 11:12:26', 'admin', '2019-03-23 15:43:13', NULL);
INSERT INTO `rc_resource_statistics` VALUES (3283, 0, 0, 0, 0, '2019-03-22 19:18:06', 'new88', '2019-03-22 18:32:49', 'admin', '2019-03-22 19:18:06', NULL);
INSERT INTO `rc_resource_statistics` VALUES (3285, 3, 2, 2, 20, '2019-03-22 22:10:07', 'new88', '2019-03-22 18:32:54', 'admin', '2019-03-23 16:45:07', NULL);
INSERT INTO `rc_resource_statistics` VALUES (3287, 0, 2, 0, 0, NULL, 'new88', '2019-03-22 19:59:04', 'admin', '2019-03-23 15:43:00', NULL);
INSERT INTO `rc_resource_statistics` VALUES (3288, 1, 0, 1, 13, NULL, 'new88', '2019-03-22 19:59:04', 'admin', '2019-03-23 05:48:18', NULL);
INSERT INTO `rc_resource_statistics` VALUES (3290, 0, 1, 0, 0, NULL, 'new88', '2019-03-22 21:53:48', 'admin', '2019-03-23 15:43:08', NULL);

-- ----------------------------
-- Table structure for rc_resource_uppost
-- ----------------------------
DROP TABLE IF EXISTS `rc_resource_uppost`;
CREATE TABLE `rc_resource_uppost`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据主键',
  `catalog_id` bigint(20) NULL DEFAULT NULL COMMENT '原目录分类ID',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '原资源id',
  `post_id` bigint(20) NULL DEFAULT NULL COMMENT '上报资源id',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上报时间',
  `creater` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上报人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `poststu` int(2) NULL DEFAULT NULL COMMENT '上报状态0 未上报/ 1 已上报',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resource_post_id`(`resource_id`, `post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源目录上报数据记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_service
-- ----------------------------
DROP TABLE IF EXISTS `rc_service`;
CREATE TABLE `rc_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `service_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型：SOAP,RESTful',
  `service_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务代码',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务描述',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务url',
  `wsdl` blob NULL COMMENT 'webservice服务，wsdl内容',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `provider_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务提供者ID',
  `provider_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务提供者名称',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `technical_support_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术支持单位',
  `technical_support_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术支持联系人',
  `technical_support_contact_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术支持联系电话',
  `request_example` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求示例',
  `successful_return_example` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '成功返回示例',
  `failure_return_example` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '失败返回示例',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除字段 1 表示删除， 0 表示未删除',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务信息表(共享交换平台对外提供的服务)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_service_log
-- ----------------------------
DROP TABLE IF EXISTS `rc_service_log`;
CREATE TABLE `rc_service_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `service_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型：http,webservice',
  `service_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务代码',
  `caller_dept_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用方部门编码',
  `caller_dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用方部门名称',
  `exec_time` int(20) NULL DEFAULT NULL COMMENT '执行时长',
  `is_success` int(20) NULL DEFAULT NULL COMMENT '是否成功：0失败，1成功',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `caller_dept_id` bigint(20) NULL DEFAULT NULL COMMENT '调用部门ID',
  `num` int(11) NULL DEFAULT NULL COMMENT '服务接口返回数据量',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_service_log_detail
-- ----------------------------
DROP TABLE IF EXISTS `rc_service_log_detail`;
CREATE TABLE `rc_service_log_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '服务日志关联ID',
  `input` blob NULL COMMENT '输入参数json',
  `output` blob NULL COMMENT '输出结果json',
  `error_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息:输入参数校验失败，无调用权限，调用失败',
  `error_stack` blob NULL COMMENT '错误堆栈',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_service_log_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_source_service
-- ----------------------------
DROP TABLE IF EXISTS `rc_source_service`;
CREATE TABLE `rc_source_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `service_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型：SOAP,RESTful',
  `service_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务代码',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务描述',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务url',
  `wsdl` blob NULL COMMENT 'webservice服务，wsdl内容',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(软删除用n)',
  `provider_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务提供者ID',
  `provider_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务提供方名称',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id，用于租户隔离',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '源服务信息表\r\n共享交换平台调用的服务\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_source_service
-- ----------------------------
INSERT INTO `rc_source_service` VALUES (54, 'sw1231', 'RESTful', '465431231', '木', 'http://www.baidu.com', NULL, 'new88', '2019-03-22 14:51:47', 'new88', '2019-03-22 14:51:47', 'Y', '4773,4775', '测试组织1', 528);

-- ----------------------------
-- Table structure for rc_statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `rc_statistics_daily`;
CREATE TABLE `rc_statistics_daily`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `day_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间日期,以日为单位',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源ID\r\n',
  `resource_lib_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源所属类型  部门类 dept/主题类 topic/基础类 base\r\n',
  `resource_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源种类 db/file/interface\r\n',
  `db_count` bigint(20) NULL DEFAULT 0 COMMENT '数据库上报数据量',
  `file_count` bigint(20) NULL DEFAULT 0 COMMENT '文件类型资源上报量',
  `interface_count` bigint(20) NULL DEFAULT 0 COMMENT '接口调用次数',
  `provide_dept_id` bigint(20) NULL DEFAULT NULL COMMENT '资源所属部门ID',
  `provide_dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源所属部门名称',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '根据日期资源发布或者上报 产生一条记录，主要记录不同时间发布或者上报资源统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_statistics_daily
-- ----------------------------
INSERT INTO `rc_statistics_daily` VALUES (91, '2019-03-22', 3274, 'base', 'file', 0, 2, 0, 4775, '测试组织1', 528, 'new88', '2019-03-22 11:12:26', 'new88', '2019-03-22 16:26:05');
INSERT INTO `rc_statistics_daily` VALUES (95, '2019-03-22', 3283, 'base', 'db', 0, 0, 0, 4775, '测试组织1', 528, 'new88', '2019-03-22 18:32:49', 'new88', '2019-03-22 19:18:06');
INSERT INTO `rc_statistics_daily` VALUES (96, '2019-03-22', 3285, 'base', 'db', 2, 0, 0, 4775, '测试组织1', 528, 'new88', '2019-03-22 18:32:54', 'new88', '2019-03-22 22:10:07');
INSERT INTO `rc_statistics_daily` VALUES (97, '2019-03-22', 3288, 'base', 'db', 0, 0, 0, 4775, '测试组织1', 528, 'new88', '2019-03-22 19:59:04', 'new88', '2019-03-22 19:59:04');
INSERT INTO `rc_statistics_daily` VALUES (98, '2019-03-22', 3287, 'base', 'db', 0, 0, 0, 4775, '测试组织1', 528, 'new88', '2019-03-22 19:59:05', 'new88', '2019-03-22 19:59:05');
INSERT INTO `rc_statistics_daily` VALUES (99, '2019-03-22', 3290, 'base', 'db', 0, 0, 0, 4775, '测试组织1', 528, 'new88', '2019-03-22 21:53:48', 'new88', '2019-03-22 21:53:48');

-- ----------------------------
-- Table structure for rc_statistics_dept
-- ----------------------------
DROP TABLE IF EXISTS `rc_statistics_dept`;
CREATE TABLE `rc_statistics_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '订阅资源部门ID',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅资源部门名称',
  `resource_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源类型db/file/interface',
  `db_count` bigint(20) NULL DEFAULT NULL COMMENT '数据库交换数量',
  `file_count` bigint(20) NULL DEFAULT NULL COMMENT '文件下载次数',
  `interface_count` bigint(20) NULL DEFAULT NULL COMMENT '接口调用次数',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人\r\n',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间\r\n',
  `updater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每次发生订阅交换产生一条记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_statistics_dept
-- ----------------------------
INSERT INTO `rc_statistics_dept` VALUES (59, 3274, 4784, '测试组织222', 'file', 0, 2, 0, 528, 'new88', '2019-03-22 16:19:37', 'new88', '2019-03-22 16:19:39');
INSERT INTO `rc_statistics_dept` VALUES (60, 3274, 4775, '测试组织1', 'file', 0, 1, 0, 528, 'new88', '2019-03-22 18:56:44', 'new88', '2019-03-22 18:56:44');
INSERT INTO `rc_statistics_dept` VALUES (61, 3285, 4784, '测试组织222', 'db', 20, 0, 0, 528, 'new88', '2019-03-22 22:49:08', 'new88', '2019-03-23 16:45:07');
INSERT INTO `rc_statistics_dept` VALUES (62, 3288, 4784, '测试组织222', 'db', 13, 0, 0, 528, 'new88', '2019-03-23 05:48:18', 'new88', '2019-03-23 05:48:18');

-- ----------------------------
-- Table structure for rc_statistics_resource_visit
-- ----------------------------
DROP TABLE IF EXISTS `rc_statistics_resource_visit`;
CREATE TABLE `rc_statistics_resource_visit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `day_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'yyyy-MM-DD',
  `last_visit_total` bigint(20) NULL DEFAULT NULL COMMENT '上一天浏览统计\r\n',
  `visit_count` bigint(20) NULL DEFAULT NULL COMMENT '今天浏览次数',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_statistics_resource_visit
-- ----------------------------
INSERT INTO `rc_statistics_resource_visit` VALUES (183, '2019-03-23', 0, 8, 528, '2019-03-24 00:00:00', '2019-03-24 00:00:00', 'dailyStatics', 'dailyStatics', 3274);
INSERT INTO `rc_statistics_resource_visit` VALUES (184, '2019-03-23', 0, 0, 528, '2019-03-24 00:00:00', '2019-03-24 00:00:00', 'dailyStatics', 'dailyStatics', 3283);
INSERT INTO `rc_statistics_resource_visit` VALUES (185, '2019-03-23', 0, 2, 528, '2019-03-24 00:00:00', '2019-03-24 00:00:00', 'dailyStatics', 'dailyStatics', 3285);
INSERT INTO `rc_statistics_resource_visit` VALUES (186, '2019-03-23', 0, 2, 528, '2019-03-24 00:00:00', '2019-03-24 00:00:00', 'dailyStatics', 'dailyStatics', 3287);
INSERT INTO `rc_statistics_resource_visit` VALUES (187, '2019-03-23', 0, 0, 528, '2019-03-24 00:00:00', '2019-03-24 00:00:00', 'dailyStatics', 'dailyStatics', 3288);
INSERT INTO `rc_statistics_resource_visit` VALUES (188, '2019-03-23', 0, 1, 528, '2019-03-24 00:00:00', '2019-03-24 00:00:00', 'dailyStatics', 'dailyStatics', 3290);

-- ----------------------------
-- Table structure for rc_statistics_visit
-- ----------------------------
DROP TABLE IF EXISTS `rc_statistics_visit`;
CREATE TABLE `rc_statistics_visit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `day_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'yyyy-MM-DD',
  `last_visit_total` bigint(20) NULL DEFAULT NULL COMMENT '上一天浏览统计\r\n',
  `visit_count` bigint(20) NULL DEFAULT NULL COMMENT '今天浏览次数',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_statistics_visit
-- ----------------------------
INSERT INTO `rc_statistics_visit` VALUES (182, '2019-03-22', 0, 7, 528, '2019-03-23 00:00:00', '2019-03-23 00:00:00', 'dailyStatics', 'dailyStatics');
INSERT INTO `rc_statistics_visit` VALUES (183, '2019-03-23', 7, 6, 528, '2019-03-24 00:00:00', '2019-03-24 00:00:00', 'dailyStatics', 'dailyStatics');

-- ----------------------------
-- Table structure for rc_sub_task
-- ----------------------------
DROP TABLE IF EXISTS `rc_sub_task`;
CREATE TABLE `rc_sub_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '和rc_subscribe主键一致',
  `sub_task_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '和rc_subscribe的订阅编号一致',
  `src_meta_id` bigint(20) NULL DEFAULT NULL COMMENT '源数据库对应的元数据结构',
  `dest_meta_id` bigint(20) NULL DEFAULT NULL COMMENT '目标数据库对应的元数据结构',
  `etl_subscribe_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'etl创建任务时候产生的ID',
  `task_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业类型：db数据库，file文件',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态:waiting等待执行;running执行中;error执行故障;warn告警状态',
  `last_run_time` datetime(0) NULL DEFAULT NULL COMMENT '最近一次exec时间',
  `import_count` bigint(20) NULL DEFAULT 0 COMMENT '入库数据总量',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '资源任务订阅截止日期，到期资源交换任务不在执行',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '组合ID，用于租户管理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交换任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_sub_task
-- ----------------------------
INSERT INTO `rc_sub_task` VALUES (7, 'SUB00000185', 309, 328, 'SUB_SUB00000185', 'DB', 'STOP_IMPORT', '2019-03-23 15:53:06', 10, 'new10', '2019-03-22 22:43:02', 'new10', '2019-03-23 15:40:37', '2099-12-31 00:00:00', 528);
INSERT INTO `rc_sub_task` VALUES (8, 'SUB00000184', 312, 331, 'SUB_SUB00000184', 'DB', 'STOP_IMPORT', '2019-03-23 06:00:44', 13, 'new10', '2019-03-22 22:46:21', 'new10', '2019-03-23 15:37:17', '2099-12-31 00:00:00', 528);
INSERT INTO `rc_sub_task` VALUES (9, 'SUB00000186', 309, 335, 'SUB_SUB00000186', 'DB', 'IMPORT_ERROR', NULL, NULL, 'new10', '2019-03-23 16:21:33', 'new10', '2019-03-23 16:27:06', '2099-12-31 00:00:00', 528);
INSERT INTO `rc_sub_task` VALUES (10, 'SUB00000187', 309, 336, 'SUB_SUB00000187', 'DB', 'IMPORTING', '2019-03-23 19:02:45', 10, 'new10', '2019-03-23 16:38:34', 'new10', '2019-03-23 18:50:47', '2099-12-31 00:00:00', 528);

-- ----------------------------
-- Table structure for rc_sub_task_exec
-- ----------------------------
DROP TABLE IF EXISTS `rc_sub_task_exec`;
CREATE TABLE `rc_sub_task_exec`  (
  `id` bigint(20) NOT NULL COMMENT '和rc_subscribe主键一致',
  `etl_subscribe_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'etl create返回的ID',
  `etl_exec_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'etl start/stop任务产生的ID',
  `etl_running_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'etl定时任务产生的ID',
  `sub_task_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '和rc_subscribe的订阅编号一致',
  `task_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业类型：db数据库，file文件',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态:waiting等待执行;running执行中;error执行故障;warn告警状态',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '执行结束时间',
  `import_count` bigint(20) NULL DEFAULT NULL COMMENT '入库数据总量',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交换任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_sub_task_exec
-- ----------------------------
INSERT INTO `rc_sub_task_exec` VALUES (7, 'SUB_SUB00000185', 'f8843a2d89d9401b8ec8c890d61bb787', 'c6ec1c212a63471da3c78d565b59bfe7', 'SUB00000185', 'DB', 'IMPORT_COMPLETE', '2019-03-22 22:56:31', '2019-03-22 23:01:32', 10, 'new10', '2019-03-22 22:44:07', 'new10', '2019-03-22 22:49:08');
INSERT INTO `rc_sub_task_exec` VALUES (8, 'SUB_SUB00000184', 'c02361e054e44592835cf564d9445d53', 'b72d58655eb2444a93198bf3a28c0cd8', 'SUB00000184', 'DB', 'IMPORT_COMPLETE', '2019-03-22 23:00:30', '2019-03-23 06:00:44', 13, 'new10', '2019-03-22 22:48:06', 'new10', '2019-03-23 05:48:18');
INSERT INTO `rc_sub_task_exec` VALUES (10, 'SUB_SUB00000187', '004cf9a672dd46afb54cc57562173303', '357590e49ca24f0889d86b6a57732b00', 'SUB00000187', 'DB', 'IMPORT_COMPLETE', '2019-03-23 16:52:34', '2019-03-23 16:57:35', 10, 'new10', '2019-03-23 16:40:06', 'new10', '2019-03-23 16:45:07');
INSERT INTO `rc_sub_task_exec` VALUES (10, 'SUB_SUB00000187', '004cf9a672dd46afb54cc57562173303', '71b48b1b6649487a8e2ff207e9a3a2eb', 'SUB00000187', 'DB', 'IMPORTING', '2019-03-23 19:02:45', NULL, NULL, 'new10', '2019-03-23 18:50:47', 'new10', '2019-03-23 18:50:47');

-- ----------------------------
-- Table structure for rc_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `rc_subscribe`;
CREATE TABLE `rc_subscribe`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `seq` bigint(20) NULL DEFAULT NULL COMMENT '编号',
  `sub_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅编号:SUB+seq',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '订阅方部门ID',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅方名称',
  `subscribe_user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `subscribe_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅事由',
  `end_date` date NULL DEFAULT NULL COMMENT '订阅截至日期,yyyy-mm-dd',
  `share_method` tinyint(4) NULL DEFAULT NULL COMMENT '共享方式：1数据库，2文件下载，3webservice服务',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态：wait_approve待审核',
  `approver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人帐号',
  `approver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `suggestion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approve_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `service_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用的服务url',
  `sub_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'UUID，服务参数之一',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '组合ID，用于租户隔离',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_subscribe
-- ----------------------------
INSERT INTO `rc_subscribe` VALUES (23, 183, 'SUB00000183', 3274, 4784, '测试组织222', 'new10', 'aaaaa', '2099-12-31', 2, 'stop', 'new88', 'new88', 'sss', '2019-03-22 16:19:00', NULL, NULL, 'new10', '2019-03-22 16:18:19', 'new10', '2019-03-22 16:19:00', 528);
INSERT INTO `rc_subscribe` VALUES (24, 184, 'SUB00000184', 3288, 4784, '测试组织222', 'new10', 'dsss', '2099-12-31', 1, 'stop', 'new88', 'new88', 'dddd', '2019-03-22 22:46:21', NULL, NULL, 'new10', '2019-03-22 20:20:46', 'new10', '2019-03-22 22:46:21', 528);
INSERT INTO `rc_subscribe` VALUES (25, 185, 'SUB00000185', 3285, 4784, '测试组织222', 'new10', 'testttt', '2099-12-31', 1, 'stop', 'new88', 'new88', 'zzz', '2019-03-22 22:43:02', NULL, NULL, 'new10', '2019-03-22 22:18:54', 'new10', '2019-03-22 22:43:02', 528);
INSERT INTO `rc_subscribe` VALUES (26, 186, 'SUB00000186', 3285, 4784, '测试组织222', 'new10', '测试订阅', '2099-12-31', 1, 'success', 'new88', 'new88', '同意。', '2019-03-23 16:21:33', NULL, NULL, 'new10', '2019-03-23 16:20:27', 'new10', '2019-03-23 16:21:33', 528);
INSERT INTO `rc_subscribe` VALUES (27, 187, 'SUB00000187', 3285, 4784, '测试组织222', 'new10', '订阅测试02', '2099-12-31', 1, 'success', 'new88', 'new88', '同意。', '2019-03-23 16:38:34', NULL, NULL, 'new10', '2019-03-23 16:38:02', 'new10', '2019-03-23 16:38:34', 528);

-- ----------------------------
-- Table structure for rc_subscribe_copy1
-- ----------------------------
DROP TABLE IF EXISTS `rc_subscribe_copy1`;
CREATE TABLE `rc_subscribe_copy1`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `seq` bigint(20) NULL DEFAULT NULL COMMENT '编号',
  `sub_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅编号:SUB+seq',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源id',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '订阅方部门ID',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅方名称',
  `subscribe_user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `subscribe_reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订阅事由',
  `end_date` date NULL DEFAULT NULL COMMENT '订阅截至日期,yyyy-mm-dd',
  `share_method` tinyint(4) NULL DEFAULT NULL COMMENT '共享方式：1数据库，2文件下载，3webservice服务',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态：wait_approve待审核',
  `approver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人帐号',
  `approver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `suggestion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `approve_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `service_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用的服务url',
  `sub_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'UUID，服务参数之一',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '组合ID，用于租户隔离',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rc_subscribe_dbio
-- ----------------------------
DROP TABLE IF EXISTS `rc_subscribe_dbio`;
CREATE TABLE `rc_subscribe_dbio`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subscribe_id` bigint(20) NULL DEFAULT NULL COMMENT '订阅id',
  `param_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型 input,output, input 表示订阅资源，output表示搜索条件',
  `column_id` bigint(20) NULL DEFAULT NULL COMMENT '信息项id',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `data_masking_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据脱敏方式:(mask/cut)掩码/截取(唯一标识符不能够脱敏、只有字符串数据才能脱敏只有param_type是input类型才有效)',
  `data_start_index` int(11) NULL DEFAULT NULL COMMENT '数据脱敏开始位置、默认为0',
  `data_length` int(11) NULL DEFAULT NULL COMMENT '数据脱敏处理长度、默认为1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_subscribe_id`(`subscribe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订阅数据库类输入输出定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_subscribe_dbio
-- ----------------------------
INSERT INTO `rc_subscribe_dbio` VALUES (49, 24, 'input', 9764, 'new10', '2019-03-22 20:20:46', 'new10', '2019-03-22 20:20:46', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (50, 24, 'input', 9765, 'new10', '2019-03-22 20:20:46', 'new10', '2019-03-22 20:20:46', 'truncate', 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (51, 24, 'output', 9764, 'new10', '2019-03-22 20:20:46', 'new10', '2019-03-22 20:20:46', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (52, 24, 'output', 9765, 'new10', '2019-03-22 20:20:46', 'new10', '2019-03-22 20:20:46', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (53, 25, 'input', 9757, 'new10', '2019-03-22 22:18:54', 'new10', '2019-03-22 22:18:54', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (54, 25, 'input', 9758, 'new10', '2019-03-22 22:18:54', 'new10', '2019-03-22 22:18:54', 'mask', 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (55, 25, 'output', 9757, 'new10', '2019-03-22 22:18:54', 'new10', '2019-03-22 22:18:54', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (56, 25, 'output', 9758, 'new10', '2019-03-22 22:18:54', 'new10', '2019-03-22 22:18:54', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (57, 26, 'input', 9764, 'new10', '2019-03-23 16:20:27', 'new10', '2019-03-23 16:20:27', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (58, 26, 'input', 9765, 'new10', '2019-03-23 16:20:27', 'new10', '2019-03-23 16:20:27', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (59, 26, 'output', 9764, 'new10', '2019-03-23 16:20:27', 'new10', '2019-03-23 16:20:27', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (60, 26, 'output', 9765, 'new10', '2019-03-23 16:20:27', 'new10', '2019-03-23 16:20:27', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (61, 27, 'input', 9757, 'new10', '2019-03-23 16:38:02', 'new10', '2019-03-23 16:38:02', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (62, 27, 'input', 9758, 'new10', '2019-03-23 16:38:02', 'new10', '2019-03-23 16:38:02', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (63, 27, 'output', 9757, 'new10', '2019-03-23 16:38:02', 'new10', '2019-03-23 16:38:02', NULL, 0, 1);
INSERT INTO `rc_subscribe_dbio` VALUES (64, 27, 'output', 9758, 'new10', '2019-03-23 16:38:02', 'new10', '2019-03-23 16:38:02', NULL, 0, 1);

-- ----------------------------
-- Table structure for rc_sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `rc_sysconfig`;
CREATE TABLE `rc_sysconfig`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_root` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型资源的根目录，具体资源的路径是root+resource_code',
  `file_root_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `origin_file_root` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手工上报原始文件库根目录-数据库类型上传cvs，文件类型上传电子文档，审核前存放在该目录，具体资源的路径是root+resource_code',
  `origin_file_root_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `db_upload_size` int(11) NULL DEFAULT NULL COMMENT '数据库类型上报文件（cvs）限制大小，单位是Mb-默认限制50M',
  `file_upload_size` int(11) NULL DEFAULT NULL COMMENT '文件类型上报限制大小，单位Mb-默认限制50M',
  `import_interval` int(11) NULL DEFAULT NULL COMMENT '扫描上传文件时间，单位：分钟',
  `dept_staff_role` bigint(20) NULL DEFAULT NULL,
  `dept_admin_role` bigint(20) NULL DEFAULT NULL COMMENT '部门管理员角色',
  `center_admin_role` bigint(20) NULL DEFAULT NULL COMMENT '数据中心管理员角色',
  `sub_approver_role` bigint(20) NULL DEFAULT NULL COMMENT '订阅审批角色',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID，用于租户隔离',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表\r\n注：对应系统配置功能，后台存储数据可以不用表，但需要在界面进行读写操作' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_sysconfig
-- ----------------------------
INSERT INTO `rc_sysconfig` VALUES (4, '/new88/data2/data2_folder/', '270', '/new88/folder1/datamaxS1/', '215', 12, 20, 5, 838, 838, 841, 841, 'new88', '2019-03-22 11:07:23', 'new88', '2019-03-22 11:07:23', 528);

-- ----------------------------
-- Table structure for rc_tm
-- ----------------------------
DROP TABLE IF EXISTS `rc_tm`;
CREATE TABLE `rc_tm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门id',
  `dept_final_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体部门ID',
  `dept_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编码',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `tm_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前置机名称',
  `tm_schema_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存元数据里面存储的schemaID',
  `tm_schema_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存元数据里面存储的schema名称',
  `tm_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前置机IP',
  `tm_db_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库存储ID',
  `tm_db_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `tm_db_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `tm_db_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库端口',
  `sftp_switch_root` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交换文件存放根目录',
  `hdfs_switch_root` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sftp对应的hdfs根目录,防止元数据改变目录后，重新定位导致文件丢失',
  `sftp_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sftp端口',
  `sftp_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sftp用户名',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间(文件更新时间)',
  `rent_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID，用于租户隔离',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 257 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_tm
-- ----------------------------
INSERT INTO `rc_tm` VALUES (255, '4773,4775', '4775', '1321664', '测试组织1', '10.0.0.56', '147', '', '10.0.0.56', '147', 'bank1', 'mysql', '3306', '/switch', '/switch', NULL, '', 'new88', '2019-03-22 20:25:43', 'new88', '2019-03-22 20:25:43', 528);
INSERT INTO `rc_tm` VALUES (256, '4773,4784', '4784', '13465456', '测试组织222', '10.0.0.57', '157', '', '10.0.0.57', '157', 'mysq57_new', 'mysql', '3306', '/switch', '/switch', NULL, '', 'new88', '2019-03-22 20:28:54', 'new88', '2019-03-22 20:28:54', 528);

SET FOREIGN_KEY_CHECKS = 1;
