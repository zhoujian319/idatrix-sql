/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.85_root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.0.0.85:3306
 Source Schema         : scheduler

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 26/03/2019 11:01:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mysql413db1_auto_sub_1
-- ----------------------------
DROP TABLE IF EXISTS `mysql413db1_auto_sub_1`;
CREATE TABLE `mysql413db1_auto_sub_1`  (
  `id` int(11) NULL DEFAULT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
  `ds_batch` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ds_batch',
  `ds_sync_time` datetime(0) NULL DEFAULT NULL COMMENT 'ds_sync_time',
  `ds_sync_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ds_sync_flag'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'mysql413db1中文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysql413db1_auto_sub_1
-- ----------------------------
INSERT INTO `mysql413db1_auto_sub_1` VALUES (12, '张三', '2019-01-16', '2019-01-07 16:32:07', 'I');
INSERT INTO `mysql413db1_auto_sub_1` VALUES (23, '李四', '2019-01-16', '2019-01-07 16:32:07', 'I');
INSERT INTO `mysql413db1_auto_sub_1` VALUES (24, '王五', '2019-01-16', '2019-01-07 16:32:07', 'I');

-- ----------------------------
-- Table structure for sched_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sched_attachment`;
CREATE TABLE `sched_attachment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `original_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原始文件名',
  `store_schema` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储协议：file,hdfs',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储文件名',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_jar_job_content
-- ----------------------------
DROP TABLE IF EXISTS `sched_jar_job_content`;
CREATE TABLE `sched_jar_job_content`  (
  `id` bigint(20) NOT NULL COMMENT '节点id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'main函数所在类',
  `parameter` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'main函数参数',
  `jar_attachement_id` bigint(20) NULL DEFAULT NULL COMMENT 'jar文件附件ID',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'JAVA节点内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sched_jar_job_content
-- ----------------------------
INSERT INTO `sched_jar_job_content` VALUES (129, NULL, 'null', NULL, 'test2018', '2018-11-09 09:42:47', 'test2018', '2018-11-09 09:42:46');
INSERT INTO `sched_jar_job_content` VALUES (130, NULL, 'null', NULL, 'test2018', '2018-11-09 09:42:47', 'test2018', '2018-11-09 09:42:46');
INSERT INTO `sched_jar_job_content` VALUES (133, '', '{\"args\":\"\"}', NULL, 'etl5', '2018-11-09 17:33:31', 'etl5', '2018-11-09 17:33:31');
INSERT INTO `sched_jar_job_content` VALUES (136, NULL, 'null', NULL, 'etl3', '2018-11-12 11:47:30', 'etl3', '2018-11-12 11:47:30');
INSERT INTO `sched_jar_job_content` VALUES (138, NULL, 'null', NULL, 'etl3', '2018-11-12 15:04:29', 'etl3', '2018-11-12 15:04:28');
INSERT INTO `sched_jar_job_content` VALUES (140, NULL, 'null', NULL, 'oyr', '2018-11-13 14:37:56', 'oyr', '2018-11-13 14:37:56');
INSERT INTO `sched_jar_job_content` VALUES (151, NULL, 'null', NULL, 'etl3', '2018-12-24 16:24:36', 'etl3', '2018-12-24 16:24:36');
INSERT INTO `sched_jar_job_content` VALUES (152, NULL, 'null', NULL, 'etl3', '2018-12-24 16:24:36', 'etl3', '2018-12-24 16:24:36');
INSERT INTO `sched_jar_job_content` VALUES (147, NULL, 'null', NULL, 'etl63', '2018-12-03 14:08:57', 'etl63', '2018-12-03 14:31:10');
INSERT INTO `sched_jar_job_content` VALUES (154, NULL, 'null', NULL, 'etl3', '2018-12-24 16:24:36', 'etl3', '2018-12-24 16:24:36');

-- ----------------------------
-- Table structure for sched_job
-- ----------------------------
DROP TABLE IF EXISTS `sched_job`;
CREATE TABLE `sched_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'job名称',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点类型:command,hive,hadoopJava,spark',
  `task_id` bigint(20) NULL DEFAULT NULL COMMENT '所属任务ID',
  `dependency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '依赖节点ID,多个用逗号隔开',
  `gui_xloc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图形化x坐标',
  `gui_yloc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图形化y坐标',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sched_job
-- ----------------------------
INSERT INTO `sched_job` VALUES (136, 'HadoopJava', 'hadoopJava', 107, '', '213', '191', 'etl3', '2018-11-12 11:47:30', 'etl3', '2018-11-12 11:47:30');
INSERT INTO `sched_job` VALUES (129, 'SparkSubmit', 'spark', 105, '', '373', '136', 'test2018', '2018-11-09 09:42:47', 'test2018', '2018-11-09 09:42:47');
INSERT INTO `sched_job` VALUES (130, 'HadoopJava', 'hadoopJava', 105, 'SparkSubmit', '474', '139', 'test2018', '2018-11-09 09:42:47', 'test2018', '2018-11-09 09:42:47');
INSERT INTO `sched_job` VALUES (131, 'Command', 'command', 105, 'HadoopJava', '604', '185', 'test2018', '2018-11-09 09:42:47', 'test2018', '2018-11-09 09:42:47');
INSERT INTO `sched_job` VALUES (132, 'HiveJob', 'hive', 105, 'Command', '714', '162', 'test2018', '2018-11-09 09:42:47', 'test2018', '2018-11-09 09:42:47');
INSERT INTO `sched_job` VALUES (133, 'SparkSubmit', 'spark', 106, '', '255', '256', 'etl5', '2018-11-09 17:33:31', 'etl5', '2018-11-09 17:33:31');
INSERT INTO `sched_job` VALUES (134, 'Command', 'command', 106, 'SparkSubmit', '402', '365', 'etl5', '2018-11-09 17:33:31', 'etl5', '2018-11-09 17:33:31');
INSERT INTO `sched_job` VALUES (135, 'HiveJob', 'hive', 106, 'Command', '639', '458', 'etl5', '2018-11-09 17:33:31', 'etl5', '2018-11-09 17:33:31');
INSERT INTO `sched_job` VALUES (137, 'HiveJob', 'hive', 107, 'HadoopJava', '440', '175', 'etl3', '2018-11-12 11:47:30', 'etl3', '2018-11-12 11:47:30');
INSERT INTO `sched_job` VALUES (138, 'SparkSubmit', 'spark', 109, '', '124', '152', 'etl3', '2018-11-12 15:04:29', 'etl3', '2018-11-12 15:04:29');
INSERT INTO `sched_job` VALUES (139, 'Command', 'command', 109, 'SparkSubmit', '398', '240', 'etl3', '2018-11-12 15:04:29', 'etl3', '2018-11-12 15:04:29');
INSERT INTO `sched_job` VALUES (140, 'SparkSubmit', 'spark', 110, '', '260', '258', 'oyr', '2018-11-13 14:37:56', 'oyr', '2018-11-13 14:37:56');
INSERT INTO `sched_job` VALUES (141, 'HiveJob', 'hive', 110, 'SparkSubmit', '685', '217', 'oyr', '2018-11-13 14:37:56', 'oyr', '2018-11-13 14:37:56');
INSERT INTO `sched_job` VALUES (142, 'Command', 'command', 111, '', '139', '207', 'etl5', '2018-11-13 15:15:37', 'etl5', '2018-11-13 15:15:37');
INSERT INTO `sched_job` VALUES (147, 'SparkSubmit', 'spark', 123, '', '281', '226', 'etl63', '2018-12-03 14:08:57', 'etl63', '2018-12-03 14:08:57');
INSERT INTO `sched_job` VALUES (150, 'Command', 'command', 124, '', '325', '163', 'etl63', '2018-12-20 15:31:43', 'etl63', '2018-12-20 15:31:43');
INSERT INTO `sched_job` VALUES (151, 'SparkSubmit', 'spark', 125, '', '202', '250', 'etl3', '2018-12-24 16:24:36', 'etl3', '2018-12-24 16:24:36');
INSERT INTO `sched_job` VALUES (152, 'HadoopJava', 'hadoopJava', 125, 'SparkSubmit', '565', '283', 'etl3', '2018-12-24 16:24:36', 'etl3', '2018-12-24 16:24:36');
INSERT INTO `sched_job` VALUES (153, 'Command', 'command', 125, 'SparkSubmit', '390', '187', 'etl3', '2018-12-24 16:24:36', 'etl3', '2018-12-24 16:24:36');
INSERT INTO `sched_job` VALUES (154, 'SparkSubmit2', 'spark', 125, 'Command,HadoopJava', '821', '253', 'etl3', '2018-12-24 16:24:36', 'etl3', '2018-12-24 16:24:36');
INSERT INTO `sched_job` VALUES (175, 'Command', 'command', 127, '', '329', '227', 'etl63', '2019-01-03 13:05:31', 'etl63', '2019-01-03 13:05:31');
INSERT INTO `sched_job` VALUES (164, 'Command', 'command', 126, '', '439', '207', 'etl63', '2019-01-03 13:02:32', 'etl63', '2019-01-03 13:02:32');
INSERT INTO `sched_job` VALUES (176, 'Command', 'command', 128, '', '484', '247', 'etl63', '2019-01-08 10:09:30', 'etl63', '2019-01-08 10:09:30');
INSERT INTO `sched_job` VALUES (177, 'Command', 'command', 129, '', '465', '148', 'new88', '2019-03-19 10:13:24', 'new88', '2019-03-19 15:06:27');

-- ----------------------------
-- Table structure for sched_script_job_content
-- ----------------------------
DROP TABLE IF EXISTS `sched_script_job_content`;
CREATE TABLE `sched_script_job_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` bigint(20) NULL DEFAULT NULL COMMENT '节点id',
  `script` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行脚本',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 242 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'command,hive节点内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sched_script_job_content
-- ----------------------------
INSERT INTO `sched_script_job_content` VALUES (221, 142, 'ls', 'etl5', '2018-11-13 15:15:37', 'etl5', '2018-11-13 15:15:37');
INSERT INTO `sched_script_job_content` VALUES (239, 176, 'ls', 'etl63', '2019-01-08 10:09:30', 'etl63', '2019-01-08 10:09:30');
INSERT INTO `sched_script_job_content` VALUES (224, 150, 'ls', 'etl63', '2018-12-20 15:31:43', 'etl63', '2018-12-20 15:31:43');
INSERT INTO `sched_script_job_content` VALUES (234, 164, 'ls', 'etl63', '2019-01-03 13:02:32', 'etl63', '2019-01-03 13:02:32');
INSERT INTO `sched_script_job_content` VALUES (238, 175, 'ls', 'etl63', '2019-01-03 13:05:31', 'etl63', '2019-01-03 13:05:31');
INSERT INTO `sched_script_job_content` VALUES (241, 177, 'ls', 'new88', '2019-03-19 15:06:27', NULL, '2019-03-19 15:06:26');

-- ----------------------------
-- Table structure for sched_task
-- ----------------------------
DROP TABLE IF EXISTS `sched_task`;
CREATE TABLE `sched_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `has_submit` tinyint(1) NULL DEFAULT NULL COMMENT '是否已经提交',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sched_task
-- ----------------------------
INSERT INTO `sched_task` VALUES (107, 'aaa', 'aa', 0, 'etl3', '2018-11-12 11:47:19', 'etl3', '2018-11-12 11:47:30');
INSERT INTO `sched_task` VALUES (103, 'test', 'asdf', 0, 'oyr', '2018-09-27 16:16:36', NULL, '2018-09-27 16:16:35');
INSERT INTO `sched_task` VALUES (105, 'Steven', '描述', 0, 'test2018', '2018-11-09 09:42:16', 'test2018', '2018-11-09 09:42:47');
INSERT INTO `sched_task` VALUES (106, 'sdf', 'adsf', 0, 'etl5', '2018-11-09 17:32:57', 'etl5', '2018-11-09 17:33:31');
INSERT INTO `sched_task` VALUES (108, 'peng', 'sddd', 0, 'etl3', '2018-11-12 15:00:24', NULL, '2018-11-12 15:00:23');
INSERT INTO `sched_task` VALUES (109, 'peng1', 'aaaa', 0, 'etl3', '2018-11-12 15:02:41', 'etl3', '2018-11-12 15:04:29');
INSERT INTO `sched_task` VALUES (110, 'peng2', 'aaa', 0, 'oyr', '2018-11-13 14:37:44', 'oyr', '2018-11-13 14:37:56');
INSERT INTO `sched_task` VALUES (111, 'testwwww', 'tewwss', 0, 'etl5', '2018-11-13 15:14:29', 'etl5', '2018-11-13 15:15:37');
INSERT INTO `sched_task` VALUES (123, 'scheduler-test01', 'scheduler-test01', 0, 'etl63', '2018-12-03 14:08:50', 'etl63', '2018-12-03 14:08:57');
INSERT INTO `sched_task` VALUES (112, 'ss', 'a', 0, 'etl64', '2018-12-03 11:26:48', NULL, '2018-12-03 11:48:59');
INSERT INTO `sched_task` VALUES (113, 'a', 'a', 0, 'etl5', '2018-12-03 11:51:19', NULL, '2018-12-03 11:51:19');
INSERT INTO `sched_task` VALUES (114, 'aa', 'a', 0, 'etl5', '2018-12-03 11:52:51', NULL, '2018-12-03 11:52:51');
INSERT INTO `sched_task` VALUES (115, 'a1', 'a', 0, 'etl64', '2018-12-03 11:32:19', NULL, '2018-12-03 11:54:31');
INSERT INTO `sched_task` VALUES (116, 'a12', 'a', 0, 'etl64', '2018-12-03 11:32:23', NULL, '2018-12-03 11:54:35');
INSERT INTO `sched_task` VALUES (117, 'aas', 'sa', 0, 'etl64', '2018-12-03 11:34:23', NULL, '2018-12-03 11:56:35');
INSERT INTO `sched_task` VALUES (118, 'aasw', 'saa', 0, 'etl64', '2018-12-03 11:37:03', NULL, '2018-12-03 11:59:15');
INSERT INTO `sched_task` VALUES (120, 'q', 'q', 0, 'etl64', '2018-12-03 11:49:17', NULL, '2018-12-03 12:11:29');
INSERT INTO `sched_task` VALUES (121, 'MYSQ', '11111', 0, 'etl64', '2018-12-03 11:51:23', NULL, '2018-12-03 12:13:35');
INSERT INTO `sched_task` VALUES (124, 'localssss', 'ssssss', 0, 'etl63', '2018-12-20 15:31:20', 'etl63', '2018-12-20 15:31:43');
INSERT INTO `sched_task` VALUES (125, 'st_task1', '数据资源访问量统计', 0, 'etl3', '2018-12-24 16:23:10', 'etl3', '2018-12-24 16:24:36');
INSERT INTO `sched_task` VALUES (126, 'sss', 'sss', 0, 'etl63', '2019-01-03 13:00:16', 'etl63', '2019-01-03 13:02:32');
INSERT INTO `sched_task` VALUES (127, 'a123424', 'asdfsef', 0, 'etl63', '2019-01-03 13:04:11', 'etl63', '2019-01-03 13:05:31');
INSERT INTO `sched_task` VALUES (128, 'sssqqqq', 'ss', 0, 'etl63', '2019-01-08 10:09:22', 'etl63', '2019-01-08 10:09:30');
INSERT INTO `sched_task` VALUES (129, 'news121231', 'news121231', 1, 'new88', '2019-03-19 10:13:15', 'new88', '2019-03-19 15:06:27');

-- ----------------------------
-- Table structure for sched_trigger
-- ----------------------------
DROP TABLE IF EXISTS `sched_trigger`;
CREATE TABLE `sched_trigger`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `recurring_flag` tinyint(1) NULL DEFAULT NULL COMMENT '是否问循环任务',
  `start_time` timestamp(0) NOT NULL COMMENT '任务开始时间',
  `interval_value` bigint(20) NULL DEFAULT NULL COMMENT '时间间隔',
  `interval_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间间隔单位：min,h,d',
  `cron_expression` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式，优先级高于时间间隔',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度策略表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
