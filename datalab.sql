/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.85_root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.0.0.85:3306
 Source Schema         : datalab

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 26/03/2019 11:00:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for es_dic_chg
-- ----------------------------
DROP TABLE IF EXISTS `es_dic_chg`;
CREATE TABLE `es_dic_chg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更版本',
  `status` int(1) NULL DEFAULT NULL COMMENT '0-草稿(保存),1-提交变更(待刷新),2-定稿(已刷新)',
  `comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更注释说明',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '词典变更清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for es_dic_chg_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_dic_chg_detail`;
CREATE TABLE `es_dic_chg_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chg_id` int(11) NULL DEFAULT NULL COMMENT '变更id',
  `operation_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型:add,update,delete',
  `dic_id` int(11) NULL DEFAULT NULL COMMENT '变更前词典id.update 和 delete 有效',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更前关键字.delete 和 update 有效',
  `nature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更前词性. delete 和 update 有效',
  `freq` int(11) NULL DEFAULT NULL COMMENT '变更前词频.delete 和 update 有效',
  `new_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更后关键字.add 和 update 有效',
  `new_nature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更后词性.add 和 update 有效',
  `new_freq` int(11) NULL DEFAULT NULL COMMENT '变更后词频.add 和 update 有效',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '词典变更详细清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for es_dic_default
-- ----------------------------
DROP TABLE IF EXISTS `es_dic_default`;
CREATE TABLE `es_dic_default`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '词语',
  `nature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '词性，具体参考ansj',
  `freq` int(11) NULL DEFAULT NULL COMMENT '词频',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录修改人',
  `modify_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '默认词典（无租户）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for es_search_list
-- ----------------------------
DROP TABLE IF EXISTS `es_search_list`;
CREATE TABLE `es_search_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引',
  `endpoint` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问端点',
  `dsl` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询dsl语句',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询状态-success,fault',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1049 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ES搜索清单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of es_search_list
-- ----------------------------
INSERT INTO `es_search_list` VALUES (991, 'zj_idx_one', '/zj_idx_one/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'etl3', '2018-07-26 15:42:52', 'etl3', '2018-07-26 15:42:52');
INSERT INTO `es_search_list` VALUES (992, 'zj_idx_one', '/zj_idx_one/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"person\" \n        } \n    } \n}', 'fault', 'etl3', '2018-07-26 16:39:53', 'etl3', '2018-07-26 16:39:53');
INSERT INTO `es_search_list` VALUES (993, 'zj_idx_one', '/zj_idx_one/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'etl3', '2018-07-26 16:40:22', 'etl3', '2018-07-26 16:40:22');
INSERT INTO `es_search_list` VALUES (994, 'zj_idx_one', '/zj_idx_one/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'success', 'etl3', '2018-07-31 15:15:58', 'etl3', '2018-07-31 15:15:59');
INSERT INTO `es_search_list` VALUES (995, 'zj_idx_one', '/zj_idx_one/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'etl3', '2018-08-02 10:20:35', 'etl3', '2018-08-02 10:20:35');
INSERT INTO `es_search_list` VALUES (996, 'zj_idx_one', '/zj_idx_one/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"id\" \n        } \n    } \n}', 'success', 'etl3', '2018-08-09 14:57:30', 'etl3', '2018-08-09 14:57:30');
INSERT INTO `es_search_list` VALUES (997, 'ssksk', '/ssksk/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"id\" \n        } \n    } \n}', NULL, 'etl64', '2018-09-10 09:54:40', NULL, '2018-09-10 09:54:40');
INSERT INTO `es_search_list` VALUES (998, 'ssksk', '/ssksk/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"s\" \n        } \n    } \n}', 'fault', 'etl63', '2018-09-10 15:05:38', 'etl63', '2018-09-10 15:05:38');
INSERT INTO `es_search_list` VALUES (999, 'ssksk', '/ssksk/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"6546\" \n        } \n    } \n}', NULL, 'etl5', '2018-09-12 14:48:09', NULL, '2018-09-12 14:48:09');
INSERT INTO `es_search_list` VALUES (1000, 'ssksk', '/ssksk/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"6546\" \n        } \n    } \n}', NULL, 'etl5', '2018-09-12 14:48:13', NULL, '2018-09-12 14:48:13');
INSERT INTO `es_search_list` VALUES (1001, 'zj_idx_one', '/zj_idx_one/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"沟通和\" \n        } \n    } \n}', NULL, 'etl3', '2018-09-12 15:28:08', NULL, '2018-09-12 15:28:08');
INSERT INTO `es_search_list` VALUES (1002, 'zhj_index', '/zhj_index/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-09-27 12:01:42', 'yidali', '2018-09-27 12:01:42');
INSERT INTO `es_search_list` VALUES (1003, 'sss', '/sss/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"d\" \n        } \n    } \n}', 'fault', 'etl53', '2018-09-29 15:06:22', 'etl53', '2018-09-29 15:06:22');
INSERT INTO `es_search_list` VALUES (1004, 'zhj_index', '/zhj_index/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'yidali', '2018-10-16 16:42:17', 'yidali', '2018-10-16 16:42:29');
INSERT INTO `es_search_list` VALUES (1005, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-10-16 16:45:04', 'yidali', '2018-10-16 16:45:04');
INSERT INTO `es_search_list` VALUES (1006, 'sss', '/sss/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'etl53', '2018-11-01 11:23:04', 'etl53', '2018-11-01 11:23:04');
INSERT INTO `es_search_list` VALUES (1007, 'sss', '/sss/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"123\" \n        } \n    } \n}', 'fault', 'etl53', '2018-11-01 11:23:22', 'etl53', '2018-11-01 11:23:22');
INSERT INTO `es_search_list` VALUES (1008, 'sss', '/sss/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"123\" \n        } \n    } \n}', 'fault', 'etl53', '2018-11-01 11:23:23', 'etl53', '2018-11-01 11:23:23');
INSERT INTO `es_search_list` VALUES (1009, 'sss', '/sss/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"id\" \n        } \n    } \n}', 'fault', 'etl5', '2018-11-13 15:07:45', 'etl5', '2018-11-13 15:07:46');
INSERT INTO `es_search_list` VALUES (1010, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:08:50', 'yidali', '2018-11-13 15:08:51');
INSERT INTO `es_search_list` VALUES (1011, 'sss', '/sss/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"id\" \n        } \n    } \n}', 'fault', 'etl5', '2018-11-13 15:09:21', 'etl5', '2018-11-13 15:09:21');
INSERT INTO `es_search_list` VALUES (1012, 'sss', '/sss/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"ab\" \n        } \n    } \n}', 'fault', 'etl5', '2018-11-13 15:09:33', 'etl5', '2018-11-13 15:09:33');
INSERT INTO `es_search_list` VALUES (1013, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:55', 'yidali', '2018-11-13 15:09:56');
INSERT INTO `es_search_list` VALUES (1014, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:56', 'yidali', '2018-11-13 15:09:57');
INSERT INTO `es_search_list` VALUES (1015, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:57', 'yidali', '2018-11-13 15:09:57');
INSERT INTO `es_search_list` VALUES (1016, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:57', 'yidali', '2018-11-13 15:09:57');
INSERT INTO `es_search_list` VALUES (1017, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:57', 'yidali', '2018-11-13 15:09:57');
INSERT INTO `es_search_list` VALUES (1018, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:57', 'yidali', '2018-11-13 15:09:57');
INSERT INTO `es_search_list` VALUES (1019, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:57', 'yidali', '2018-11-13 15:09:57');
INSERT INTO `es_search_list` VALUES (1020, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-13 15:09:58', 'yidali', '2018-11-13 15:09:58');
INSERT INTO `es_search_list` VALUES (1021, 'zhj_index_2', '/zhj_index_2/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"阿\" \n        } \n    } \n}', 'success', 'yidali', '2018-11-13 15:10:10', 'yidali', '2018-11-13 15:10:10');
INSERT INTO `es_search_list` VALUES (1022, 'sss', '/sss/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'etl5', '2018-11-13 15:10:56', 'etl5', '2018-11-13 15:10:56');
INSERT INTO `es_search_list` VALUES (1023, 'zhj_test_2', '/zhj_test_2/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'etl5', '2018-11-13 15:12:18', 'etl5', '2018-11-13 15:12:18');
INSERT INTO `es_search_list` VALUES (1024, 'dic_index_zhj', '/dic_index_zhj/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-15 15:59:51', 'yidali', '2018-11-15 15:59:53');
INSERT INTO `es_search_list` VALUES (1025, 'zhj_index_2', '/zhj_index_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'yidali', '2018-11-22 14:22:53', 'yidali', '2018-11-22 14:22:53');
INSERT INTO `es_search_list` VALUES (1026, 'ssksk', '/ssksk/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'etl63', '2018-11-28 16:52:11', 'etl63', '2018-11-28 16:52:12');
INSERT INTO `es_search_list` VALUES (1027, 'ssksk', '/ssksk/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'etl63', '2018-11-28 16:52:30', 'etl63', '2018-11-28 16:52:30');
INSERT INTO `es_search_list` VALUES (1028, 'ssksk', '/ssksk/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'etl63', '2018-11-28 16:53:03', 'etl63', '2018-11-28 16:53:03');
INSERT INTO `es_search_list` VALUES (1029, 'zhj_test_2', '/zhj_test_2/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'etl63', '2018-11-28 16:56:13', 'etl63', '2018-11-28 16:56:13');
INSERT INTO `es_search_list` VALUES (1030, 'aaa', '/aaa/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'etl63', '2018-11-28 17:02:13', 'etl63', '2018-11-28 17:02:13');
INSERT INTO `es_search_list` VALUES (1031, 'aaa', '/aaa/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'success', 'etl63', '2018-11-28 17:02:22', 'etl63', '2018-11-28 17:02:22');
INSERT INTO `es_search_list` VALUES (1032, 'aaa', '/aaa/_searchsasa', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'etl63', '2018-11-28 17:04:57', 'etl63', '2018-11-28 17:04:57');
INSERT INTO `es_search_list` VALUES (1033, 'sss', '/sss/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'etl63', '2018-11-29 10:19:32', 'etl63', '2018-11-29 10:19:32');
INSERT INTO `es_search_list` VALUES (1034, 'ssksk', '/ssksk/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'etl63', '2018-12-13 16:47:15', 'etl63', '2018-12-13 16:47:15');
INSERT INTO `es_search_list` VALUES (1035, 'ssksk', '/ssksk/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'etl63', '2018-12-20 15:30:56', 'etl63', '2018-12-20 15:30:56');
INSERT INTO `es_search_list` VALUES (1036, 'aaa', '/aaa/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'success', 'etl63', '2018-12-20 15:31:05', 'etl63', '2018-12-20 15:31:05');
INSERT INTO `es_search_list` VALUES (1037, 'zj_idx_1', '/zj_idx_1/_search', '{ \n    \"query\": { \n        \"query_string\": { \n            \"query\": \"a\" \n        } \n    } \n}', NULL, 'yidali', '2019-02-19 12:04:13', NULL, '2019-02-19 12:04:13');
INSERT INTO `es_search_list` VALUES (1038, 'test_es_create', '/test_es_create/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'new88', '2019-03-20 16:50:29', 'new88', '2019-03-20 16:50:29');
INSERT INTO `es_search_list` VALUES (1039, 'test_es_create', '/test_es_create/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'wzl1', '2019-03-20 19:41:38', 'wzl1', '2019-03-20 19:41:39');
INSERT INTO `es_search_list` VALUES (1040, 'zhj_idx', '/zhj_idx/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'wzl1', '2019-03-20 19:41:58', 'wzl1', '2019-03-20 19:41:58');
INSERT INTO `es_search_list` VALUES (1041, 'test_es_create', '/test_es_create/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'fault', 'wzl1', '2019-03-20 19:47:12', 'wzl1', '2019-03-20 19:47:12');
INSERT INTO `es_search_list` VALUES (1042, 'zhj_idx', '/zhj_idx/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'wzl1', '2019-03-20 19:47:20', 'wzl1', '2019-03-20 19:47:20');
INSERT INTO `es_search_list` VALUES (1043, 'zhj_idx', '/zhj_idx/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'fault', 'wzl1', '2019-03-20 19:56:19', 'wzl1', '2019-03-20 19:56:19');
INSERT INTO `es_search_list` VALUES (1044, 'test_es_create', '/test_es_create/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'wzl1', '2019-03-21 09:41:17', 'wzl1', '2019-03-21 09:41:18');
INSERT INTO `es_search_list` VALUES (1045, 'test_es_create', '/test_es_create/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"a\"\n    }\n  }\n}', 'success', 'wzl1', '2019-03-21 09:41:49', 'wzl1', '2019-03-21 09:41:49');
INSERT INTO `es_search_list` VALUES (1046, 'etl61', '/etl61/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'new88', '2019-03-21 11:02:51', 'new88', '2019-03-21 11:02:51');
INSERT INTO `es_search_list` VALUES (1047, 'etl61', '/etl61/_search', '{\n  \"query\": {\n    \"query_string\": {\n      \"query\": \"\"\n    }\n  }\n}', 'success', 'new88', '2019-03-21 11:02:58', 'new88', '2019-03-21 11:02:58');
INSERT INTO `es_search_list` VALUES (1048, 'etl61', '/etl61/_search', '{\n    \"query\": {\n        \"match_all\": {}\n    }\n}', 'success', 'new88', '2019-03-22 21:45:08', 'new88', '2019-03-22 21:45:08');

SET FOREIGN_KEY_CHECKS = 1;
