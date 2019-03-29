/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.85_root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.0.0.85:3306
 Source Schema         : metadata2

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 26/03/2019 11:02:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bi_category
-- ----------------------------
DROP TABLE IF EXISTS `bi_category`;
CREATE TABLE `bi_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `renter_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003262 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bi_category
-- ----------------------------
INSERT INTO `bi_category` VALUES (1003255, 'cs1', '2019-02-28 13:54:44', '2019-02-28 13:54:44', '456');
INSERT INTO `bi_category` VALUES (1003256, 'cs2', '2019-02-28 14:03:00', '2019-02-28 14:03:00', '456');
INSERT INTO `bi_category` VALUES (1003257, 'test', '2019-03-13 10:33:20', '2019-03-13 10:33:20', '527');
INSERT INTO `bi_category` VALUES (1003258, 'test2', '2019-03-19 14:43:32', '2019-03-19 14:43:32', '527');
INSERT INTO `bi_category` VALUES (1003260, 'lhc', '2019-03-21 18:18:19', '2019-03-21 18:18:19', '528');
INSERT INTO `bi_category` VALUES (1003261, 'robin', '2019-03-26 10:26:56', '2019-03-26 10:26:56', '528');

-- ----------------------------
-- Table structure for bi_resource_click
-- ----------------------------
DROP TABLE IF EXISTS `bi_resource_click`;
CREATE TABLE `bi_resource_click`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名',
  `type` int(10) NULL DEFAULT NULL COMMENT '资源类型 1:报表分析 2:仪表盘',
  `root_directory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级目录',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源节点路径',
  `click_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '点击时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bi_resource_click
-- ----------------------------
INSERT INTO `bi_resource_click` VALUES (26, 'cs.saiku', 1, '根目录', '/homes/home:527/cs.saiku', '2019-03-21 13:53:18', 1330, 527);
INSERT INTO `bi_resource_click` VALUES (27, 'cs.sdb', 2, 'oyrcs', '/homes/home:527/oyrcs/cs.sdb', '2019-03-21 13:54:07', 1330, 527);
INSERT INTO `bi_resource_click` VALUES (28, 'zzzzzzz.saiku', 1, 'cs', '/homes/home:527/cs/zzzzzzz.saiku', '2019-03-21 17:36:34', 1330, 527);
INSERT INTO `bi_resource_click` VALUES (29, 'cs1.saiku', 1, '根目录', '/homes/home:527/cs1.saiku', '2019-03-21 17:36:52', 1330, 527);
INSERT INTO `bi_resource_click` VALUES (30, 'ddd.sdb', 2, '777', '/homes/home:527/777/ddd.sdb', '2019-03-21 17:39:30', 1330, 527);
INSERT INTO `bi_resource_click` VALUES (31, 'ooooo.sdb', 2, 'uuuuu', '/homes/home:527/uuuuu/ooooo.sdb', '2019-03-21 17:40:47', 1330, 527);
INSERT INTO `bi_resource_click` VALUES (32, 'ooooo.sdb', 2, 'uuuuu', '/homes/home:527/uuuuu/ooooo.sdb', '2019-03-21 17:40:57', 1330, 527);
INSERT INTO `bi_resource_click` VALUES (33, 'ooooo.sdb', 2, 'uuuuu', '/homes/home:527/uuuuu/ooooo.sdb', '2019-03-21 17:41:23', 1330, 527);

-- ----------------------------
-- Table structure for bi_schema
-- ----------------------------
DROP TABLE IF EXISTS `bi_schema`;
CREATE TABLE `bi_schema`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '设计表id',
  `ds_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'schema名称',
  `datasource` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源链接数据',
  `table_relation` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表关系',
  `db_schema` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `updater` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `ds_id` int(10) NULL DEFAULT NULL COMMENT '数据源id',
  `renter_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `category_id` int(10) NULL DEFAULT NULL COMMENT '目录ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_renterid_dsname`(`ds_name`, `renter_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bi_schema
-- ----------------------------
INSERT INTO `bi_schema` VALUES (133, 'oyr_test64', '{\"id\":\"832e1e41-5b54-4ab7-b943-2eb10045c66a\",\"enabled\":null,\"connectionname\":\"oyr_test64\",\"connectiontype\":\"MONDRIAN\",\"jdbcurl\":\"jdbc:mysql://10.0.0.108:3306/security\",\"schema\":\"/schema/456/oyr_test64.xml\",\"driver\":\"com.mysql.jdbc.Driver\",\"username\":\"oyr\",\"password\":\"a123456\",\"path\":null,\"advanced\":null,\"security_type\":null,\"propertyKey\":null,\"csv\":null,\"renterId\":\"456\",\"isExt\":\"false\",\"invalid\":null}', '{\"table\":[]}', '{\"name\":\"oyr_test64\",\"cube\":{\"name\":\"user\",\"table\":{\"id\":\"6868\",\"name\":\"user\"},\"dimension\":[{\"id\":\"6868\",\"name\":\"user\",\"hierarchy\":{\"table\":{\"name\":\"user\"},\"level\":[{\"id\":\"25473\",\"name\":\"name\",\"visible\":true,\"column\":\"name\",\"fieldType\":\"VARCHAR\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"id\"},\"visible\":true,\"foreignKey\":\"id\"}],\"measure\":[{\"id\":\"25472\",\"name\":\"id\",\"column\":\"id\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"BIGINT\"}]}}', '2019-02-28 16:03:23', '456', NULL, NULL, 1003413, '456', 1003255);
INSERT INTO `bi_schema` VALUES (142, 'wi1', '{\"id\":\"0aef7f2f-592a-4139-974a-24bd09791157\",\"enabled\":null,\"connectionname\":\"wi1\",\"connectiontype\":\"MONDRIAN\",\"jdbcurl\":\"jdbc:mysql://10.0.0.85:3306/test_mysql_create1\",\"schema\":\"/schema/527/wi1.xml\",\"driver\":\"com.mysql.jdbc.Driver\",\"username\":\"oyr\",\"password\":\"a123456\",\"path\":null,\"advanced\":null,\"security_type\":null,\"propertyKey\":null,\"csv\":null,\"renterId\":\"527\"}', '{\"table\":[]}', '{\"cube\":{\"name\":\"user\",\"table\":{\"id\":\"148\",\"name\":\"user\"},\"dimension\":[{\"id\":\"148\",\"name\":\"user\",\"hierarchy\":{\"table\":{\"name\":\"user\"},\"level\":[{\"id\":\"348\",\"name\":\"name\",\"visible\":true,\"column\":\"name\",\"fieldType\":\"VARCHAR\"},{\"id\":\"349\",\"name\":\"class_name\",\"visible\":true,\"column\":\"class_name\",\"fieldType\":\"VARCHAR\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"id\"},\"visible\":true,\"foreignKey\":\"id\"}],\"measure\":[{\"id\":\"347\",\"visible\":true,\"name\":\"id\",\"column\":\"id\",\"formatString\":\"#,###.00\",\"aggregator\":\"sum\",\"fieldType\":\"BIGINT\"}]},\"name\":\"wi1\"}', '2019-03-21 11:16:49', 'wzl1', NULL, NULL, 6, '527', 1003257);
INSERT INTO `bi_schema` VALUES (143, 'cs23', '{\"id\":\"2e2720e5-1e6a-448d-b8b9-fa642475edcc\",\"enabled\":null,\"connectionname\":\"cs23\",\"connectiontype\":\"MONDRIAN\",\"jdbcurl\":\"jdbc:mysql://10.0.0.85:3306/test_mysql_create1\",\"schema\":\"/schema/527/cs23.xml\",\"driver\":\"com.mysql.jdbc.Driver\",\"username\":\"oyr\",\"password\":\"a123456\",\"path\":null,\"advanced\":null,\"security_type\":null,\"propertyKey\":null,\"csv\":null,\"renterId\":\"527\",\"isExt\":null,\"invalid\":null}', '{\"table\":[]}', '{\"name\":\"cs23\",\"cube\":{\"name\":\"user\",\"table\":{\"id\":\"148\",\"name\":\"user\"},\"dimension\":[{\"id\":\"148\",\"name\":\"user\",\"hierarchy\":{\"table\":{\"name\":\"user\"},\"level\":[{\"id\":\"348\",\"name\":\"name\",\"visible\":true,\"column\":\"name\",\"fieldType\":\"VARCHAR\"},{\"id\":\"349\",\"name\":\"class_name\",\"visible\":true,\"column\":\"class_name\",\"fieldType\":\"VARCHAR\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"id\"},\"visible\":true,\"foreignKey\":\"id\"}],\"measure\":[{\"id\":\"347\",\"name\":\"id\",\"column\":\"id\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"BIGINT\"}]}}', '2019-03-21 13:52:10', 'wzl1', NULL, NULL, 6, '527', 1003257);
INSERT INTO `bi_schema` VALUES (144, 'lhc', '{\"id\":\"4609825a-3b6a-4ff6-a00f-c0aafdeb8c3e\",\"enabled\":null,\"connectionname\":\"lhc\",\"connectiontype\":\"MONDRIAN\",\"jdbcurl\":\"jdbc:mysql://10.0.0.56:3306/bank1\",\"schema\":\"/schema/528/lhc.xml\",\"driver\":\"com.mysql.jdbc.Driver\",\"username\":\"root\",\"password\":\"Root_12345678\",\"path\":null,\"advanced\":null,\"security_type\":null,\"propertyKey\":null,\"csv\":null,\"renterId\":\"528\",\"isExt\":null,\"invalid\":null}', '{\"table\":[]}', '{\"name\":\"lhc\",\"cube\":{\"name\":\"new222\",\"table\":{\"id\":\"227\",\"name\":\"new222\"},\"dimension\":[{\"id\":\"227\",\"name\":\"new222\",\"hierarchy\":{\"table\":{\"name\":\"new222\"},\"level\":[{\"id\":\"612\",\"name\":\"b\",\"visible\":true,\"column\":\"b\",\"fieldType\":\"LONGTEXT\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"a\"},\"visible\":true,\"foreignKey\":\"a\"}],\"measure\":[{\"id\":\"611\",\"name\":\"a\",\"column\":\"a\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"INTEGER\"}]}}', '2019-03-21 18:19:23', 'new88', NULL, NULL, 147, '528', 1003260);
INSERT INTO `bi_schema` VALUES (145, 'foodmart', '{\"id\":\"53bc2b83-67cf-4b1c-ac88-4e09baf86e3b\",\"enabled\":null,\"connectionname\":\"foodmart\",\"connectiontype\":\"MONDRIAN\",\"jdbcurl\":\"jdbc:mysql://10.0.0.85:3306/foodmart\",\"schema\":\"/schema/528/foodmart.xml\",\"driver\":\"com.mysql.jdbc.Driver\",\"username\":\"root\",\"password\":\"admin\",\"path\":null,\"advanced\":null,\"security_type\":null,\"propertyKey\":null,\"csv\":null,\"renterId\":\"528\",\"isExt\":null,\"invalid\":null}', '{\"table\":[{\"name\":\"warehouse\",\"keyColumn\":\"warehouse_id\",\"foreignKey\":\"department_id\",\"sourceId\":\"363\",\"targetId\":\"371\",\"count\":1,\"sourcePos\":{\"x\":\"40px\",\"y\":\"40px\"},\"targetPos\":{\"x\":\"360px\",\"y\":\"40px\"}},{\"name\":\"warehouse_class\",\"keyColumn\":\"warehouse_class_id\",\"foreignKey\":\"department_id\",\"sourceId\":\"363\",\"targetId\":\"372\",\"count\":1,\"sourcePos\":{\"x\":\"40px\",\"y\":\"40px\"},\"targetPos\":{\"x\":\"360px\",\"y\":\"103px\"}},{\"name\":\"sadf123\",\"keyColumn\":\"id\",\"foreignKey\":\"employee_id\",\"sourceId\":\"363\",\"targetId\":\"362\",\"count\":1,\"sourcePos\":{\"x\":\"40px\",\"y\":\"40px\"},\"targetPos\":{\"x\":\"360px\",\"y\":\"166px\"}},{\"name\":\"store_ragged\",\"keyColumn\":\"store_id\",\"foreignKey\":\"currency_id\",\"sourceId\":\"363\",\"targetId\":\"369\",\"count\":1,\"sourcePos\":{\"x\":\"40px\",\"y\":\"40px\"},\"targetPos\":{\"x\":\"360px\",\"y\":\"229px\"}}]}', '{\"name\":\"foodmart\",\"cube\":{\"name\":\"salary\",\"table\":{\"id\":\"363\",\"name\":\"salary\"},\"dimension\":[{\"id\":\"363\",\"name\":\"salary\",\"hierarchy\":{\"table\":{\"name\":\"salary\"},\"level\":[{\"id\":\"1335\",\"name\":\"pay_date\",\"visible\":true,\"column\":\"pay_date\",\"fieldType\":\"timestamp\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"employee_id\"},\"visible\":true,\"foreignKey\":\"employee_id\"},{\"id\":\"371\",\"name\":\"warehouse\",\"hierarchy\":{\"table\":{\"name\":\"warehouse\"},\"level\":[{\"id\":\"1426\",\"name\":\"warehouse_id\",\"visible\":true,\"column\":\"warehouse_id\",\"fieldType\":\"int\"},{\"id\":\"1427\",\"name\":\"warehouse_class_id\",\"visible\":true,\"column\":\"warehouse_class_id\",\"fieldType\":\"int\"},{\"id\":\"1428\",\"name\":\"stores_id\",\"visible\":true,\"column\":\"stores_id\",\"fieldType\":\"int\"},{\"id\":\"1429\",\"name\":\"warehouse_name\",\"visible\":true,\"column\":\"warehouse_name\",\"fieldType\":\"varchar\"},{\"id\":\"1430\",\"name\":\"wa_address1\",\"visible\":true,\"column\":\"wa_address1\",\"fieldType\":\"varchar\"},{\"id\":\"1431\",\"name\":\"wa_address2\",\"visible\":true,\"column\":\"wa_address2\",\"fieldType\":\"varchar\"},{\"id\":\"1432\",\"name\":\"wa_address3\",\"visible\":true,\"column\":\"wa_address3\",\"fieldType\":\"varchar\"},{\"id\":\"1433\",\"name\":\"wa_address4\",\"visible\":true,\"column\":\"wa_address4\",\"fieldType\":\"varchar\"},{\"id\":\"1434\",\"name\":\"warehouse_city\",\"visible\":true,\"column\":\"warehouse_city\",\"fieldType\":\"varchar\"},{\"id\":\"1435\",\"name\":\"warehouse_state_province\",\"visible\":true,\"column\":\"warehouse_state_province\",\"fieldType\":\"varchar\"},{\"id\":\"1436\",\"name\":\"warehouse_postal_code\",\"visible\":true,\"column\":\"warehouse_postal_code\",\"fieldType\":\"varchar\"},{\"id\":\"1437\",\"name\":\"warehouse_country\",\"visible\":true,\"column\":\"warehouse_country\",\"fieldType\":\"varchar\"},{\"id\":\"1438\",\"name\":\"warehouse_owner_name\",\"visible\":true,\"column\":\"warehouse_owner_name\",\"fieldType\":\"varchar\"},{\"id\":\"1439\",\"name\":\"warehouse_phone\",\"visible\":true,\"column\":\"warehouse_phone\",\"fieldType\":\"varchar\"},{\"id\":\"1440\",\"name\":\"warehouse_fax\",\"visible\":true,\"column\":\"warehouse_fax\",\"fieldType\":\"varchar\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"warehouse_id\"},\"visible\":true,\"foreignKey\":\"department_id\"},{\"id\":\"372\",\"name\":\"warehouse_class\",\"hierarchy\":{\"table\":{\"name\":\"warehouse_class\"},\"level\":[{\"id\":\"1441\",\"name\":\"warehouse_class_id\",\"visible\":true,\"column\":\"warehouse_class_id\",\"fieldType\":\"int\"},{\"id\":\"1442\",\"name\":\"description\",\"visible\":true,\"column\":\"description\",\"fieldType\":\"varchar\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"warehouse_class_id\"},\"visible\":true,\"foreignKey\":\"department_id\"},{\"id\":\"362\",\"name\":\"sadf123\",\"hierarchy\":{\"table\":{\"name\":\"sadf123\"},\"level\":[{\"id\":\"1332\",\"name\":\"id\",\"visible\":true,\"column\":\"id\",\"fieldType\":\"int\"},{\"id\":\"1333\",\"name\":\"name\",\"visible\":true,\"column\":\"name\",\"fieldType\":\"bigint\"},{\"id\":\"1334\",\"name\":\"lalal\",\"visible\":true,\"column\":\"lalal\",\"fieldType\":\"date\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"id\"},\"visible\":true,\"foreignKey\":\"employee_id\"},{\"id\":\"369\",\"name\":\"store_ragged\",\"hierarchy\":{\"table\":{\"name\":\"store_ragged\"},\"level\":[{\"id\":\"1392\",\"name\":\"store_id\",\"visible\":true,\"column\":\"store_id\",\"fieldType\":\"int\"},{\"id\":\"1393\",\"name\":\"store_type\",\"visible\":true,\"column\":\"store_type\",\"fieldType\":\"varchar\"},{\"id\":\"1394\",\"name\":\"region_id\",\"visible\":true,\"column\":\"region_id\",\"fieldType\":\"int\"},{\"id\":\"1395\",\"name\":\"store_name\",\"visible\":true,\"column\":\"store_name\",\"fieldType\":\"varchar\"},{\"id\":\"1396\",\"name\":\"store_number\",\"visible\":true,\"column\":\"store_number\",\"fieldType\":\"int\"},{\"id\":\"1397\",\"name\":\"store_street_address\",\"visible\":true,\"column\":\"store_street_address\",\"fieldType\":\"varchar\"},{\"id\":\"1398\",\"name\":\"store_city\",\"visible\":true,\"column\":\"store_city\",\"fieldType\":\"varchar\"},{\"id\":\"1399\",\"name\":\"store_state\",\"visible\":true,\"column\":\"store_state\",\"fieldType\":\"varchar\"},{\"id\":\"1400\",\"name\":\"store_postal_code\",\"visible\":true,\"column\":\"store_postal_code\",\"fieldType\":\"varchar\"},{\"id\":\"1401\",\"name\":\"store_country\",\"visible\":true,\"column\":\"store_country\",\"fieldType\":\"varchar\"},{\"id\":\"1402\",\"name\":\"store_manager\",\"visible\":true,\"column\":\"store_manager\",\"fieldType\":\"varchar\"},{\"id\":\"1403\",\"name\":\"store_phone\",\"visible\":true,\"column\":\"store_phone\",\"fieldType\":\"varchar\"},{\"id\":\"1404\",\"name\":\"store_fax\",\"visible\":true,\"column\":\"store_fax\",\"fieldType\":\"varchar\"},{\"id\":\"1405\",\"name\":\"first_opened_date\",\"visible\":true,\"column\":\"first_opened_date\",\"fieldType\":\"datetime\"},{\"id\":\"1406\",\"name\":\"last_remodel_date\",\"visible\":true,\"column\":\"last_remodel_date\",\"fieldType\":\"datetime\"},{\"id\":\"1407\",\"name\":\"store_sqft\",\"visible\":true,\"column\":\"store_sqft\",\"fieldType\":\"int\"},{\"id\":\"1408\",\"name\":\"grocery_sqft\",\"visible\":true,\"column\":\"grocery_sqft\",\"fieldType\":\"int\"},{\"id\":\"1409\",\"name\":\"frozen_sqft\",\"visible\":true,\"column\":\"frozen_sqft\",\"fieldType\":\"int\"},{\"id\":\"1410\",\"name\":\"meat_sqft\",\"visible\":true,\"column\":\"meat_sqft\",\"fieldType\":\"int\"},{\"id\":\"1411\",\"name\":\"coffee_bar\",\"visible\":true,\"column\":\"coffee_bar\",\"fieldType\":\"tinyint\"},{\"id\":\"1412\",\"name\":\"video_store\",\"visible\":true,\"column\":\"video_store\",\"fieldType\":\"tinyint\"},{\"id\":\"1413\",\"name\":\"salad_bar\",\"visible\":true,\"column\":\"salad_bar\",\"fieldType\":\"tinyint\"},{\"id\":\"1414\",\"name\":\"prepared_food\",\"visible\":true,\"column\":\"prepared_food\",\"fieldType\":\"tinyint\"},{\"id\":\"1415\",\"name\":\"florist\",\"visible\":true,\"column\":\"florist\",\"fieldType\":\"tinyint\"}],\"visible\":true,\"hasAll\":true,\"primaryKey\":\"store_id\"},\"visible\":true,\"foreignKey\":\"currency_id\"}],\"measure\":[{\"id\":\"1336\",\"name\":\"employee_id\",\"column\":\"employee_id\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"int\"},{\"id\":\"1337\",\"name\":\"department_id\",\"column\":\"department_id\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"int\"},{\"id\":\"1338\",\"name\":\"currency_id\",\"column\":\"currency_id\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"int\"},{\"id\":\"1339\",\"name\":\"salary_paid\",\"column\":\"salary_paid\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"decimal\"},{\"id\":\"1340\",\"name\":\"overtime_paid\",\"column\":\"overtime_paid\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"decimal\"},{\"id\":\"1341\",\"name\":\"vacation_accrued\",\"column\":\"vacation_accrued\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"double\"},{\"id\":\"1342\",\"name\":\"vacation_used\",\"column\":\"vacation_used\",\"aggregator\":\"sum\",\"formatString\":\"#,###.00\",\"visible\":true,\"fieldType\":\"double\"}]}}', '2019-03-26 10:52:40', 'new88', NULL, NULL, 158, '528', 1003261);

-- ----------------------------
-- Table structure for bi_schema_click
-- ----------------------------
DROP TABLE IF EXISTS `bi_schema_click`;
CREATE TABLE `bi_schema_click`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `click_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '点击时间',
  `schema_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模式名称',
  `schema_id` bigint(20) NULL DEFAULT NULL COMMENT '模式ID',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '目录ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bi_schema_click
-- ----------------------------
INSERT INTO `bi_schema_click` VALUES (1, '2019-03-04 14:56:13', 'cs1', 1, 1003256, 1, 1);
INSERT INTO `bi_schema_click` VALUES (2, '2019-03-04 15:12:13', 'cs2', 2, 1003256, 1, 1);
INSERT INTO `bi_schema_click` VALUES (3, '2019-03-04 15:12:51', 'cs1', 1, 1003256, 1, 1);
INSERT INTO `bi_schema_click` VALUES (4, '2019-03-05 09:42:54', 'oyr_test64', 133, 1003255, 1010, 456);
INSERT INTO `bi_schema_click` VALUES (5, '2019-03-05 09:44:14', 'oyr_test64', 133, 1003255, 1010, 456);
INSERT INTO `bi_schema_click` VALUES (6, '2019-03-05 09:44:25', 'oyr_test64', 133, 1003255, 1010, 456);
INSERT INTO `bi_schema_click` VALUES (7, '2019-03-05 10:29:24', 'oyr_test64', 133, 1003255, 1010, 456);
INSERT INTO `bi_schema_click` VALUES (8, '2019-03-05 11:51:29', 'oyr_test64', 133, 1003255, 1010, 456);
INSERT INTO `bi_schema_click` VALUES (9, '2019-03-05 12:00:33', 'oyr_test64', 133, 1003255, 1010, 456);
INSERT INTO `bi_schema_click` VALUES (40, '2019-03-21 17:34:01', 'wi1', 142, 1003257, 1330, 527);
INSERT INTO `bi_schema_click` VALUES (41, '2019-03-21 17:41:35', 'cs23', 143, 1003257, 1330, 527);
INSERT INTO `bi_schema_click` VALUES (42, '2019-03-21 17:41:36', 'wi1', 142, 1003257, 1330, 527);
INSERT INTO `bi_schema_click` VALUES (43, '2019-03-21 17:41:36', 'cs23', 143, 1003257, 1330, 527);
INSERT INTO `bi_schema_click` VALUES (44, '2019-03-21 17:41:37', 'wi1', 142, 1003257, 1330, 527);
INSERT INTO `bi_schema_click` VALUES (45, '2019-03-21 17:41:37', 'cs23', 143, 1003257, 1330, 527);
INSERT INTO `bi_schema_click` VALUES (46, '2019-03-21 18:16:59', 'oyr_test64', 133, 1003255, 1010, 456);
INSERT INTO `bi_schema_click` VALUES (47, '2019-03-25 15:13:36', 'lhc', 144, 1003260, 1336, 528);
INSERT INTO `bi_schema_click` VALUES (48, '2019-03-25 15:13:42', 'lhc', 144, 1003260, 1336, 528);
INSERT INTO `bi_schema_click` VALUES (49, '2019-03-26 10:25:21', 'lhc', 144, 1003260, 1336, 528);
INSERT INTO `bi_schema_click` VALUES (50, '2019-03-26 10:35:56', 'lhc', 144, 1003260, 1336, 528);
INSERT INTO `bi_schema_click` VALUES (51, '2019-03-26 10:52:42', 'foodmart', 145, 1003261, 1336, 528);

-- ----------------------------
-- Table structure for mc_approval_process
-- ----------------------------
DROP TABLE IF EXISTS `mc_approval_process`;
CREATE TABLE `mc_approval_process`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '申请人租户ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `dept_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请组织code',
  `cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请原因',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '申请的资源id',
  `resource_type` int(10) NULL DEFAULT NULL COMMENT '资源类型 1:MYSQL 2:ORACLE 3:DM 4:POSTGRESQL 5:HIVE 6:HBASE 7:HDFS 8:ELASTICSEARCH',
  `auth_value` int(10) NULL DEFAULT NULL COMMENT '当前申请的权限值,二进制数据',
  `status` int(10) NULL DEFAULT 1 COMMENT '状态 1-申请中 2-通过 3-不通过 4-已回收 5-已撤回 6-删除',
  `approver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_approval_process
-- ----------------------------
INSERT INTO `mc_approval_process` VALUES (1, 'wzl5', 527, '2019-03-19 11:15:46', '961916519849', 'sadf sadfsadf ', 78, 2, 2, 1, NULL, NULL, NULL);
INSERT INTO `mc_approval_process` VALUES (2, 'wzl5', 527, '2019-03-19 11:22:22', '961916519849', '啥地方', 44, 1, 4, 1, NULL, NULL, NULL);
INSERT INTO `mc_approval_process` VALUES (3, 'new10', 528, '2019-03-22 14:26:12', '13465456', '大哥大 ', 246, 1, 10, 4, 'new99', NULL, '2019-03-22 20:59:38');
INSERT INTO `mc_approval_process` VALUES (4, 'new10', 528, '2019-03-22 14:59:14', '13465456', 'sss', 233, 1, 1, 4, 'new99', NULL, '2019-03-22 15:11:42');
INSERT INTO `mc_approval_process` VALUES (5, 'new10', 528, '2019-03-22 20:49:24', '13465456', 's', 263, 1, 15, 4, 'new99', NULL, '2019-03-22 20:55:16');
INSERT INTO `mc_approval_process` VALUES (6, 'new10', 528, '2019-03-22 20:49:52', '13465456', 's', 21, 8, 15, 2, 'new99', NULL, '2019-03-22 20:52:47');
INSERT INTO `mc_approval_process` VALUES (7, 'new10', 528, '2019-03-22 20:50:17', '13465456', 's', 222, 6, 7, 2, 'new99', NULL, '2019-03-22 20:52:47');
INSERT INTO `mc_approval_process` VALUES (8, 'new10', 528, '2019-03-22 20:53:53', '13465456', 'xss', 221, 6, 15, 3, 'new99', 'sdd', '2019-03-22 20:54:26');
INSERT INTO `mc_approval_process` VALUES (9, 'new10', 528, '2019-03-22 20:58:55', '13465456', 'mkk', 245, 1, 15, 2, 'new99', NULL, '2019-03-22 20:59:26');
INSERT INTO `mc_approval_process` VALUES (10, 'new10', NULL, '2019-03-22 22:43:02', '13465456', ' 共享交换订阅表格授权', 309, 1, 15, 2, 'new10', NULL, '2019-03-22 22:43:02');
INSERT INTO `mc_approval_process` VALUES (11, 'new10', NULL, '2019-03-22 22:46:21', '13465456', ' 共享交换订阅表格授权', 312, 2, 15, 2, 'new10', NULL, '2019-03-22 22:46:21');

-- ----------------------------
-- Table structure for mc_database
-- ----------------------------
DROP TABLE IF EXISTS `mc_database`;
CREATE TABLE `mc_database`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `server_id` bigint(20) NOT NULL COMMENT '服务器id',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '数据库类型 1 MySQL 2 Oracle 3 DM 4 PostgreSQL 5 Hive 6 HBase 7 HDFS 8 Elasticsearch',
  `belong` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '数据库归属 1 ODS-操作数据存储 2 DW-数据仓库3 DM-数据集市',
  `port` int(11) NULL DEFAULT NULL COMMENT '端口',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库管理员密码',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除字段 0未删除 1已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `renter_id` bigint(20) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据库平台实体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_database
-- ----------------------------
INSERT INTO `mc_database` VALUES (1, 1, 7, 1, 8020, NULL, NULL, 0, 'new8', '2019-03-07 20:01:29', 'new88', '2019-03-20 15:41:59', 528);
INSERT INTO `mc_database` VALUES (2, 2, 6, 2, 1, NULL, NULL, 0, 'new8', '2019-03-07 20:01:29', 'new88', '2019-03-18 13:49:49', 528);
INSERT INTO `mc_database` VALUES (3, 3, 5, 2, 10000, NULL, NULL, 0, 'new8', '2019-03-07 20:01:29', 'new88', '2019-03-14 02:09:57', 528);
INSERT INTO `mc_database` VALUES (4, 2, 8, 3, 9305, NULL, NULL, 0, 'new8', '2019-03-07 20:01:29', 'new88', '2019-03-15 19:23:54', 528);
INSERT INTO `mc_database` VALUES (5, 4, 7, 2, 8020, NULL, NULL, 0, 'new7', '2019-03-08 00:10:55', 'wzl1', '2019-03-14 02:54:38', 527);
INSERT INTO `mc_database` VALUES (6, 6, 6, 2, 2181, NULL, NULL, 0, 'new7', '2019-03-08 00:10:55', 'new7', '2019-03-08 00:10:55', 527);
INSERT INTO `mc_database` VALUES (7, 7, 5, 2, 10000, NULL, NULL, 0, 'new7', '2019-03-08 00:10:55', 'new7', '2019-03-08 00:10:55', 527);
INSERT INTO `mc_database` VALUES (8, 6, 8, 2, 9305, NULL, NULL, 0, 'new7', '2019-03-08 00:10:55', 'new7', '2019-03-08 00:10:55', 527);
INSERT INTO `mc_database` VALUES (9, 10, 7, 2, 8020, NULL, NULL, 0, 'pwj1', '2019-03-10 21:22:03', 'pwj1', '2019-03-10 21:22:03', 529);
INSERT INTO `mc_database` VALUES (10, 11, 6, 2, 2181, NULL, NULL, 0, 'pwj1', '2019-03-10 21:22:03', 'pwj1', '2019-03-10 21:22:03', 529);
INSERT INTO `mc_database` VALUES (11, 11, 5, 2, 10000, NULL, NULL, 0, 'pwj1', '2019-03-10 21:22:03', 'pwj1', '2019-03-10 21:22:03', 529);
INSERT INTO `mc_database` VALUES (12, 12, 8, 2, 9305, NULL, NULL, 0, 'pwj1', '2019-03-10 21:22:03', 'pwj1', '2019-03-10 21:22:03', 529);
INSERT INTO `mc_database` VALUES (13, 8, 1, 2, 3306, NULL, NULL, 0, 'wzl1', NULL, 'wzl1', NULL, 527);
INSERT INTO `mc_database` VALUES (14, 6, 1, 2, 3306, NULL, NULL, 0, 'wzl', NULL, 'wzl1', NULL, 527);
INSERT INTO `mc_database` VALUES (15, 13, 1, 2, 3306, 'wuguozhou', 'wgz8562/', 0, 'xionghan1', '2019-03-11 14:06:41', 'xionghan1', '2019-03-11 14:22:04', 443);
INSERT INTO `mc_database` VALUES (16, 13, 2, 2, 1521, 'C##TEST', 'test', 0, 'xionghan1', '2019-03-11 14:08:33', 'xionghan1', '2019-03-12 20:45:20', 443);
INSERT INTO `mc_database` VALUES (17, 4, 2, 1, 8080, NULL, NULL, 0, 'wzl1', '2019-03-11 21:13:10', 'wzl1', '2019-03-15 19:23:55', 527);
INSERT INTO `mc_database` VALUES (18, 1, 1, 2, 3306, 'root', 'ysdsj123', 0, 'new88', '2019-03-12 03:32:33', 'new88', '2019-03-15 14:15:52', 528);
INSERT INTO `mc_database` VALUES (19, 15, 2, 2, 1521, NULL, NULL, 0, 'wzl1', NULL, 'wzl1', '2019-03-13 17:17:34', 527);
INSERT INTO `mc_database` VALUES (20, 16, 7, 2, 8020, NULL, NULL, 0, 'xiufeng', '2019-03-13 02:19:23', 'xiufeng', '2019-03-13 02:19:23', 530);
INSERT INTO `mc_database` VALUES (21, 17, 6, 2, 2181, NULL, NULL, 0, 'xiufeng', '2019-03-13 02:19:23', 'xiufeng', '2019-03-13 02:19:23', 530);
INSERT INTO `mc_database` VALUES (22, 18, 5, 2, 10000, NULL, NULL, 0, 'xiufeng', '2019-03-13 02:19:24', 'xiufeng', '2019-03-13 02:19:24', 530);
INSERT INTO `mc_database` VALUES (23, 17, 8, 2, 9305, NULL, NULL, 0, 'xiufeng', '2019-03-13 02:19:24', 'xiufeng', '2019-03-13 02:19:24', 530);
INSERT INTO `mc_database` VALUES (24, 19, 7, 2, 8020, NULL, NULL, 0, 'xionghan', '2019-03-13 02:24:08', 'xionghan', '2019-03-13 15:28:07', 443);
INSERT INTO `mc_database` VALUES (25, 19, 6, 2, 2181, NULL, NULL, 0, 'xionghan', '2019-03-13 02:24:08', 'xionghan', '2019-03-13 02:24:08', 443);
INSERT INTO `mc_database` VALUES (26, 20, 5, 2, 10000, NULL, NULL, 0, 'xionghan', '2019-03-13 02:24:08', 'xionghan', '2019-03-13 02:24:08', 443);
INSERT INTO `mc_database` VALUES (27, 21, 8, 2, 9305, NULL, NULL, 0, 'xionghan', '2019-03-13 02:24:09', 'xionghan', '2019-03-13 02:24:09', 443);
INSERT INTO `mc_database` VALUES (28, 26, 1, 2, 3306, 'root', 'qsde523@@#', 0, 'new88', '2019-03-14 21:09:47', 'new88', '2019-03-14 21:09:47', 528);
INSERT INTO `mc_database` VALUES (29, 27, 1, 2, 3306, 'root', 'Root_12345678', 0, 'new88', '2019-03-14 21:35:10', 'new88', '2019-03-14 21:35:10', 528);
INSERT INTO `mc_database` VALUES (30, 28, 2, 3, 1521, NULL, NULL, 1, 'new88', '2019-03-14 21:36:54', 'new88', '2019-03-18 14:15:10', 528);
INSERT INTO `mc_database` VALUES (31, 27, 2, 3, 1521, NULL, NULL, 1, 'new88', '2019-03-15 10:37:20', 'new88', '2019-03-18 14:15:28', 528);
INSERT INTO `mc_database` VALUES (32, 3, 2, 2, 1521, NULL, NULL, 1, 'new88', '2019-03-14 21:39:33', 'new88', '2019-03-18 14:34:37', 528);
INSERT INTO `mc_database` VALUES (33, 2, 1, 3, 3306, 'root', 'admin', 0, 'new88', '2019-03-15 12:11:48', 'new88', '2019-03-15 12:11:48', 528);
INSERT INTO `mc_database` VALUES (34, 29, 7, 2, 8020, NULL, NULL, 0, 'wzldemo1', '2019-03-15 14:08:46', 'wzldemo1', '2019-03-15 14:08:46', 532);
INSERT INTO `mc_database` VALUES (35, 30, 6, 2, 2181, NULL, NULL, 0, 'wzldemo1', '2019-03-15 14:08:46', 'wzldemo1', '2019-03-15 14:08:46', 532);
INSERT INTO `mc_database` VALUES (36, 30, 5, 2, 10000, NULL, NULL, 0, 'wzldemo1', '2019-03-15 14:08:46', 'wzldemo1', '2019-03-15 14:08:46', 532);
INSERT INTO `mc_database` VALUES (37, 31, 8, 2, 9305, NULL, NULL, 0, 'wzldemo1', '2019-03-15 14:08:46', 'wzldemo1', '2019-03-15 14:08:46', 532);
INSERT INTO `mc_database` VALUES (38, 4, 1, 1, 808034, 'admin', '122qweQWE/', 0, 'wzl1', '2019-03-15 14:44:51', 'wzl1', '2019-03-18 14:52:38', 527);
INSERT INTO `mc_database` VALUES (39, 1, 2, 1, 1521, NULL, NULL, 1, 'new88', '2019-03-18 15:45:48', 'new88', '2019-03-19 10:15:19', 528);
INSERT INTO `mc_database` VALUES (40, 43, 1, 1, 9302, 'etl3', '122qweQWE/', 0, 'wzl1', '2019-03-18 16:31:36', 'wzl1', '2019-03-18 16:31:36', 527);
INSERT INTO `mc_database` VALUES (41, 43, 2, 2, 9302, NULL, NULL, 0, 'wzl1', '2019-03-18 16:32:20', 'wzl1', '2019-03-18 16:32:20', 527);
INSERT INTO `mc_database` VALUES (42, 35, 2, 1, 1521, NULL, NULL, 0, 'new88', '2019-03-19 10:15:48', 'new88', '2019-03-19 10:15:48', 528);
INSERT INTO `mc_database` VALUES (43, 48, 1, 1, 3306, 'root', 'qwe123!@#', 0, 'new88', '2019-03-19 15:33:34', 'new88', '2019-03-19 15:33:34', 528);
INSERT INTO `mc_database` VALUES (44, 49, 7, 2, 8020, NULL, NULL, 0, 'new1', '2019-03-20 15:15:27', 'new1', '2019-03-20 15:15:27', 533);
INSERT INTO `mc_database` VALUES (45, 49, 6, 2, 2181, NULL, NULL, 0, 'new1', '2019-03-20 15:15:27', 'new1', '2019-03-20 15:15:27', 533);
INSERT INTO `mc_database` VALUES (46, 50, 5, 2, 10000, NULL, NULL, 0, 'new1', '2019-03-20 15:15:28', 'new1', '2019-03-20 15:15:28', 533);
INSERT INTO `mc_database` VALUES (47, 51, 8, 2, 9305, NULL, NULL, 0, 'new1', '2019-03-20 15:15:28', 'new1', '2019-03-20 15:15:28', 533);
INSERT INTO `mc_database` VALUES (48, 3, 1, 2, 3306, 'root', 'admin', 1, 'new88', '2019-03-20 15:42:50', 'new88', '2019-03-20 15:42:57', 528);
INSERT INTO `mc_database` VALUES (49, 52, 1, 2, 3306, 'root', 'qsde523@@#', 0, 'new11', '2019-03-20 15:51:31', 'new11', '2019-03-20 15:51:31', 533);
INSERT INTO `mc_database` VALUES (50, 54, 1, 2, 3306, 'root', 'Root_12345678', 0, 'new88', '2019-03-21 14:31:33', 'new88', '2019-03-21 14:31:33', 528);
INSERT INTO `mc_database` VALUES (51, 55, 1, 3, 3306, 'root', 'Root_12345678', 0, 'new88', '2019-03-22 20:26:59', 'new88', '2019-03-22 20:26:59', 528);

-- ----------------------------
-- Table structure for mc_es_field
-- ----------------------------
DROP TABLE IF EXISTS `mc_es_field`;
CREATE TABLE `mc_es_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint(20) NULL DEFAULT NULL COMMENT '索引id 关联mc_metadata中database_type=8的主键',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `analyzer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分析器',
  `is_index` bit(1) NULL DEFAULT NULL COMMENT '是否索引 0:否 1:是',
  `is_store` bit(1) NULL DEFAULT NULL COMMENT '是否存储 0:否 1:是',
  `is_all` bit(1) NULL DEFAULT NULL COMMENT '是否包含在_all中 0:否 1:是',
  `is_source` bit(1) NULL DEFAULT NULL COMMENT '是否包含在_source中 0:否 1:是',
  `location` int(10) NULL DEFAULT NULL COMMENT '字段位置（当前字段的一个位置标识，每张表的字段位置都是自增，唯一的）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ES索引字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_es_field
-- ----------------------------
INSERT INTO `mc_es_field` VALUES (7, 7, 'ssdf', 'keyword', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 17:39:11', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (8, 8, 'sdf', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 17:50:19', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (9, 9, 'dd', 'date', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 17:52:57', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (10, 10, 'sdf234', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 18:02:47', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (86, 11, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 13:11:22', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (87, 11, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-14 13:11:22', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (95, 12, 'aau', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 13:29:32', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (96, 12, 'bb', 'keyword', NULL, b'0', b'0', b'0', b'0', 2, 'wzl1', '2019-03-14 13:29:32', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (103, 13, 'aa', 'keyword', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 14:08:27', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (104, 13, 'bb', 'text', 'index_ansj', b'0', b'0', b'0', b'0', 2, 'wzl1', '2019-03-14 14:08:27', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (105, 13, 'ccu', 'keyword', NULL, b'0', b'0', b'0', b'0', 3, 'wzl1', '2019-03-14 14:08:27', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (106, 13, 'dd', 'text', 'standard', b'1', b'0', b'1', b'1', 4, 'wzl1', '2019-03-14 14:08:27', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (107, 6, 'dd', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 17:10:53', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (108, 6, 'ee', 'keyword', NULL, b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-14 17:10:53', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (114, 14, 'aa', 'text', NULL, b'0', b'1', b'0', b'1', 1, 'wzl1', '2019-03-21 10:09:00', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (115, 14, 'bb', 'text', 'index_ansj', b'1', b'0', b'1', b'1', 2, 'wzl1', '2019-03-21 10:09:00', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (116, 14, 'cc', 'keyword', NULL, b'0', b'0', b'0', b'0', 3, 'wzl1', '2019-03-21 10:09:00', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (120, 20, 's', 'text', 'standard', b'1', b'1', b'1', b'1', 1, 'new88', '2019-03-21 10:16:31', NULL, NULL);
INSERT INTO `mc_es_field` VALUES (121, 21, 'ww', 'text', 'standard', b'1', b'1', b'1', b'1', 1, 'new88', '2019-03-21 10:17:54', NULL, NULL);

-- ----------------------------
-- Table structure for mc_md_hive_field
-- ----------------------------
DROP TABLE IF EXISTS `mc_md_hive_field`;
CREATE TABLE `mc_md_hive_field`  (
  `id` bigint(20) NOT NULL COMMENT '主键，同mc_metadata主键',
  `is_external_table` tinyint(1) NULL DEFAULT NULL COMMENT '是否外表',
  `location` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdfs路径',
  `fields_terminated` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每列之间的分隔符',
  `lines_terminated` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每行之间的分隔符',
  `null_defined` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空值处理',
  `store_format` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储格式，TEXTFILE,SEQUENCEFILE,PARQUET,AVRO',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_md_hive_field
-- ----------------------------
INSERT INTO `mc_md_hive_field` VALUES (18, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-08 23:28:43', 'wzl1', '2019-03-08 23:28:45');
INSERT INTO `mc_md_hive_field` VALUES (19, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-08 23:39:42', 'wzl1', '2019-03-08 23:39:42');
INSERT INTO `mc_md_hive_field` VALUES (20, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-08 23:51:45', 'wzl1', '2019-03-09 01:53:08');
INSERT INTO `mc_md_hive_field` VALUES (21, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 00:06:05', 'wzl1', '2019-03-09 00:06:05');
INSERT INTO `mc_md_hive_field` VALUES (22, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 00:32:59', 'wzl1', '2019-03-09 00:52:52');
INSERT INTO `mc_md_hive_field` VALUES (23, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 00:49:04', 'wzl1', '2019-03-09 00:50:56');
INSERT INTO `mc_md_hive_field` VALUES (24, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 01:00:56', 'wzl1', '2019-03-09 01:00:56');
INSERT INTO `mc_md_hive_field` VALUES (25, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 01:01:51', 'wzl1', '2019-03-09 01:01:51');
INSERT INTO `mc_md_hive_field` VALUES (90, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-14 03:39:42', 'new88', '2019-03-14 03:39:42');
INSERT INTO `mc_md_hive_field` VALUES (91, 0, NULL, '', '', '', 'TEXTFILE', 'new88', '2019-03-14 03:53:19', 'new88', '2019-03-14 03:53:19');
INSERT INTO `mc_md_hive_field` VALUES (177, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-20 11:22:16', 'wzl1', '2019-03-20 11:22:16');
INSERT INTO `mc_md_hive_field` VALUES (178, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-20 11:22:30', 'wzl1', '2019-03-20 11:22:30');
INSERT INTO `mc_md_hive_field` VALUES (220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:14:43');

-- ----------------------------
-- Table structure for mc_metadata
-- ----------------------------
DROP TABLE IF EXISTS `mc_metadata`;
CREATE TABLE `mc_metadata`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdf目录 or es索引名称 or db实体表名',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdf子目录 or es描述 or db中文表名',
  `public_status` int(10) NULL DEFAULT NULL COMMENT '公开状态：0:不公开 1:授权访问',
  `theme_id` bigint(255) NULL DEFAULT NULL COMMENT '主题id，外键关联',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签，多个以，隔开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前版本号，递增',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `is_gather` tinyint(1) NULL DEFAULT NULL COMMENT '是否直采，0:否 1:是',
  `status` int(20) NULL DEFAULT NULL COMMENT '当前状态：0草稿 1生效 2删除',
  `database_type` int(10) NULL DEFAULT NULL COMMENT '数据库类型,1.mysql,2.oracle,3.dm,4.postgreSQL,5.hive,6.base,7.hdfs,8.ElasticSearch',
  `resource_type` int(10) NULL DEFAULT NULL COMMENT '不同数据库下分辨不同资源 如：db 1:表 2:视图',
  `schema_id` bigint(20) NULL DEFAULT NULL COMMENT '模式id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 373 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_metadata
-- ----------------------------
INSERT INTO `mc_metadata` VALUES (18, 'robin_hive_3004', '测试个HIVE', 1, 1, 'tag1,tag2', '测试个HIVE', 1, 527, NULL, 2, 5, NULL, 1, 'wzl1', '2019-03-08 23:28:42', 'wzl1', '2019-03-09 01:01:30');
INSERT INTO `mc_metadata` VALUES (19, 'robin_hive3090', 'hive测试下王斌', 1, 1, 'tag1', 'hive测试下王斌', 1, 527, NULL, 2, 5, NULL, 1, 'wzl1', '2019-03-08 23:39:41', 'wzl1', '2019-03-09 00:59:56');
INSERT INTO `mc_metadata` VALUES (20, 'test_eng', '中文测试111', 0, 2, 'tag1', 'df', 1, 527, NULL, 0, 5, NULL, 1, 'wzl1', '2019-03-08 23:51:45', 'wzl1', '2019-03-09 01:53:08');
INSERT INTO `mc_metadata` VALUES (21, 'combine', '测试合并', 0, 2, 'tag1', '等等34', 1, 527, NULL, 2, 5, NULL, 1, 'wzl1', '2019-03-09 00:06:05', 'wzl1', '2019-03-09 00:59:17');
INSERT INTO `mc_metadata` VALUES (22, 'xcgdfg', '中文', 0, 2, 'dd', NULL, 1, 527, NULL, 2, 5, NULL, 1, 'wzl1', '2019-03-09 00:32:47', 'wzl1', '2019-03-09 01:02:43');
INSERT INTO `mc_metadata` VALUES (23, 'ceshi9238498', 'zhognwen中文', 0, 2, 'tag1', 'dd234', 1, 527, NULL, 2, 5, NULL, 1, 'wzl1', '2019-03-09 00:49:04', 'wzl1', '2019-03-09 01:02:11');
INSERT INTO `mc_metadata` VALUES (24, 'zhognwenming', '中文ddfweoifj', 0, 3, 'tag1', 'd', 1, 527, NULL, 2, 5, NULL, 1, 'wzl1', '2019-03-09 01:00:56', 'wzl1', '2019-03-09 01:01:06');
INSERT INTO `mc_metadata` VALUES (25, 'xinjain2999', 'aiejf2oi3j中文', 1, 2, 'tag1', 'wef', 1, 527, NULL, 1, 5, NULL, 1, 'wzl1', '2019-03-09 01:01:51', 'wzl1', '2019-03-15 10:04:20');
INSERT INTO `mc_metadata` VALUES (26, 'hbase_01', 'Hbase测试测试', 1, 1, 'tag2', 'Hbase测试测试', 1, 527, NULL, 2, 6, NULL, 3, 'wzl1', '2019-03-09 02:08:19', 'wzl1', '2019-03-20 14:07:06');
INSERT INTO `mc_metadata` VALUES (27, 'userInfo', '用户信息', 0, 2, 'tag1', '调度34', 1, 527, NULL, 0, 6, NULL, 3, 'wzl1', '2019-03-10 21:13:00', 'wzl1', '2019-03-10 21:13:00');
INSERT INTO `mc_metadata` VALUES (42, 'cs1', '啊是大', 1, 1, 'cs1', 'cs1', 2, 527, 0, 1, 1, 1, 6, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-20 18:43:50');
INSERT INTO `mc_metadata` VALUES (43, 'cs2', 'cs2', 0, 1, 'cs2', 'cs2', 1, 527, 0, 0, 1, 1, 6, 'wzl1', '2019-03-10 22:52:35', 'wzl1', '2019-03-10 22:52:35');
INSERT INTO `mc_metadata` VALUES (44, 'cs1A', 'cs1A', 1, 1, 'cs1A', 'cs1A', 2, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-11 05:55:45', 'wzl1', '2019-03-20 15:38:53');
INSERT INTO `mc_metadata` VALUES (45, 'cs3', 'cs3', 0, 1, 'cs2', 'cs2', 1, 527, 0, 0, 1, 1, 6, 'wzl1', '2019-03-11 06:03:09', 'wzl1', '2019-03-11 06:03:09');
INSERT INTO `mc_metadata` VALUES (47, 'new_metacube_test', '新元数据测试表1', 0, 2, 'mysql表', '无备注', 1, 443, 0, 2, 1, 1, 7, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-19 21:16:17');
INSERT INTO `mc_metadata` VALUES (48, 'TableB', 'tableB中文名', 0, NULL, '', '', 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-12 05:19:41', 'xionghan1', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (49, 'TableC', 'tableC中文名', 0, NULL, '', '', 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-12 05:19:58', 'xionghan1', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (50, 'TableD', 'tableD中文名', 0, NULL, '', '', 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-12 05:20:25', 'xionghan1', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (51, 'T2', 'T2中文名', 0, NULL, '', 'T2表-个人信息', 1, 443, 1, 2, 2, 1, 8, 'xionghan1', '2019-03-12 05:24:24', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_metadata` VALUES (52, 'TABLEA', 'TableA中文名', 0, NULL, '', '', 1, 443, 1, 2, 2, 1, 8, 'xionghan1', '2019-03-12 05:24:32', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_metadata` VALUES (53, 'etl_view_test', 'Mysql视图1', 0, NULL, '', 'VIEW', 1, 443, 1, 2, 1, 2, 7, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-15 18:09:59');
INSERT INTO `mc_metadata` VALUES (54, 'V_TRANSF_LOG_DETAILED', 'Oracle视图1', 0, NULL, '', '', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-20 16:24:45');
INSERT INTO `mc_metadata` VALUES (55, 'V_TJ_SUPPLY_DEMAND_TRENDS', 'Oracle视图2', 0, NULL, '', '', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-12 05:38:31', 'xionghan1', '2019-03-20 16:24:55');
INSERT INTO `mc_metadata` VALUES (56, 'V_TJ_SUPPLY_DEMAND', 'Oracle视图3', 0, NULL, '', '', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-12 05:38:31', 'xionghan1', '2019-03-20 16:24:55');
INSERT INTO `mc_metadata` VALUES (57, 'V_TJ_LAST_RUN_STAT', 'Oracle视图4', 0, NULL, '', '', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-20 16:24:55');
INSERT INTO `mc_metadata` VALUES (58, 'V_TJ_GOV_RATIO', 'Oracle视图5', 0, NULL, '', '', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-12 05:38:33', 'xionghan1', '2019-03-20 16:24:55');
INSERT INTO `mc_metadata` VALUES (59, 'V_TJ_EXCHANGE_DETAILED', 'Oracle视图6', 0, NULL, '', '', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-20 16:24:55');
INSERT INTO `mc_metadata` VALUES (60, 'V_TJ_COMPARISON_MONTH', 'Oracle视图7', 0, NULL, '', '', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-12 05:38:35', 'xionghan1', '2019-03-20 16:24:55');
INSERT INTO `mc_metadata` VALUES (72, '/fsdfdsfsdf', 'test', 0, 1, 'sdfsdf,tag2', 'dfdf', 2, 528, NULL, 1, 7, NULL, 38, 'new88', '2019-03-13 03:52:27', 'new88', '2019-03-14 15:40:49');
INSERT INTO `mc_metadata` VALUES (73, '/zxvzdffsdfsdf', 'zsdfsdfsdfsssf录名————录名录名', 1, 2, 'tag1', 'dfgdfg', 4, 528, NULL, 1, 7, NULL, 38, 'new88', '2019-03-13 03:52:42', 'new88', '2019-03-14 15:40:50');
INSERT INTO `mc_metadata` VALUES (80, '/ssss', '哥13213', 1, 2, 'sss', NULL, 3, 528, NULL, 1, 7, NULL, 38, 'new88', '2019-03-13 04:22:15', 'new88', '2019-03-14 15:40:53');
INSERT INTO `mc_metadata` VALUES (81, '/asdf', '划或', 0, 3, '在', NULL, 2, 528, NULL, 1, 7, NULL, 38, 'new88', '2019-03-13 04:29:07', 'new88', '2019-03-14 15:41:00');
INSERT INTO `mc_metadata` VALUES (82, 'cs1A_AUTO_SUB_2', 'cs1A', 0, 1, 'cs1A', '订阅建表自动生成', 2, 527, 0, 2, 2, 1, 40, 'robin', '2019-03-13 04:27:58', 'robin', '2019-03-19 17:21:54');
INSERT INTO `mc_metadata` VALUES (83, '林', '木木木要', 1, 2, '要', 'ss', 2, 528, NULL, 1, 7, NULL, 44, 'new88', '2019-03-14 03:07:59', 'new88', '2019-03-14 03:10:46');
INSERT INTO `mc_metadata` VALUES (84, '林1', '大工', 0, 1, 'tag1,tag2', NULL, 4, 528, NULL, 1, 7, NULL, 44, 'new88', '2019-03-14 03:11:29', 'new88', '2019-03-14 03:15:50');
INSERT INTO `mc_metadata` VALUES (85, '木人/ssss/ss', '木人', 0, 3, 'www,tag1', NULL, 1, 528, NULL, 1, 7, NULL, 44, 'new88', '2019-03-14 03:13:17', 'new88', '2019-03-14 03:13:17');
INSERT INTO `mc_metadata` VALUES (86, '132123s/ss', 'sss/1s22/32ss', 0, 1, 'tag1', '', 1, 528, NULL, 1, 7, NULL, 44, 'new88', '2019-03-14 03:14:00', 'new88', '2019-03-14 03:14:00');
INSERT INTO `mc_metadata` VALUES (87, 'JD', 'HD为中', 1, 1, 'tag2', 'D', 1, 528, NULL, 2, 6, NULL, 45, 'new88', '2019-03-14 03:19:05', 'new88', '2019-03-14 03:23:40');
INSERT INTO `mc_metadata` VALUES (88, 'HBASE222', 'HBASE222中文名', 1, 2, 'tag1', 'SSSSSS', 1, 528, NULL, 0, 6, NULL, 45, 'new88', '2019-03-14 03:32:51', 'new88', '2019-03-14 03:32:51');
INSERT INTO `mc_metadata` VALUES (89, 'HBASE222aaaaas', 'HBASE222中文名aaaaxxs', 1, 2, 'tag1', 'SSSSSS', 1, 528, NULL, 1, 6, NULL, 45, 'new88', '2019-03-14 03:34:30', 'new88', '2019-03-14 03:34:30');
INSERT INTO `mc_metadata` VALUES (90, 'HIVE123', 'HIVE1231为中', 1, 1, 'S', NULL, 1, 528, NULL, 2, 5, NULL, 59, 'new88', '2019-03-14 03:39:42', 'new88', '2019-03-21 11:03:33');
INSERT INTO `mc_metadata` VALUES (91, 'HIVE22', 'HIVE22中文名', 1, 3, 'tag2', 'D', 1, 528, NULL, 2, 5, NULL, 59, 'new88', '2019-03-14 03:53:19', 'new88', '2019-03-21 11:03:32');
INSERT INTO `mc_metadata` VALUES (95, 'ETL_EXEC_RECORD_PART', 'dd234', 0, 6, 'tag1', 'ddd234', 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (96, 'single_table', 'dd234', 0, 6, 'dd234', 'sdfsdf', 1, 443, 1, 2, 1, 2, 7, 'xionghan1', '2019-03-15 12:02:24', 'xionghan1', '2019-03-20 15:55:35');
INSERT INTO `mc_metadata` VALUES (97, 'COL_INFO', 'dsfwer', 0, 6, 'dd234', 'sdf', 1, 443, 1, 2, 2, 1, 8, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_metadata` VALUES (98, 'V_QUALITY_CONTROL', 'sdf234', 0, 6, 'tag1', 'sdf', 1, 443, 1, 2, 2, 2, 8, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-20 16:24:55');
INSERT INTO `mc_metadata` VALUES (99, 'abs', 'a131文名', 1, 5, 'sss', 's', 1, 528, NULL, 1, 6, NULL, 49, 'new88', '2019-03-15 16:19:02', 'new88', '2019-03-15 16:19:02');
INSERT INTO `mc_metadata` VALUES (100, 'ETL_FILE_REPOSITORY', '测试表1', 0, 1, '', '', 1, 456, 1, 2, 1, 1, 7, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (101, 'INPUT_TABLE_phoenix', '测试表2', 0, 2, '', '', 1, 456, 1, 2, 1, 1, 7, 'oyr', '2019-03-15 16:39:12', 'oyr', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (102, 'tes9789797', 'tes9789797中文', 0, 5, 'tag1,新标签1', NULL, 2, 528, 0, 2, 1, 1, 73, 'new88', '2019-03-15 17:03:21', 'new88', '2019-03-21 11:06:11');
INSERT INTO `mc_metadata` VALUES (103, 'waijianlll', 'waijianlll', 0, 1, 'waijianlll', NULL, 1, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-20 15:38:55');
INSERT INTO `mc_metadata` VALUES (104, 'sdxcxcxcxcxc', 'sdxcxcxcxcxc', 0, 2, 'tag1', 'sdxcxcxcxcxc', 1, 527, 0, 1, 1, 1, 6, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48');
INSERT INTO `mc_metadata` VALUES (106, 'a', 'a中文', 0, 5, 'tag1', 's', 1, 528, 0, 2, 1, 1, 78, 'new88', '2019-03-18 10:37:37', 'new88', '2019-03-19 11:07:49');
INSERT INTO `mc_metadata` VALUES (107, 'a视图', 'a视图中文名', 0, 2, 'tag2', 'ssssaaa', 4, 528, 0, 2, 1, 2, 78, 'new88', '2019-03-18 10:38:17', 'new88', '2019-03-19 11:04:42');
INSERT INTO `mc_metadata` VALUES (108, 'bb', 'bb中文', 0, 5, 'tag2', 'ssss', 2, 528, 0, 2, 1, 1, 78, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_metadata` VALUES (109, '菲林要', '   恭恭敬敬', 0, 2, 'tag1', '磊', 1, 528, 0, 2, 1, 2, 78, 'new88', '2019-03-18 10:50:50', 'new88', '2019-03-19 11:07:55');
INSERT INTO `mc_metadata` VALUES (110, 'a图名', 'sss', 0, 2, 'tag1', 'ssss', 1, 528, 0, 2, 1, 2, 78, 'new88', '2019-03-18 10:51:08', 'new88', '2019-03-21 11:07:23');
INSERT INTO `mc_metadata` VALUES (111, 'sssssss', 'sssssss', 0, 2, 'ss,tag2', 'ss', 1, 528, 0, 2, 1, 2, 78, 'new88', '2019-03-18 10:52:05', 'new88', '2019-03-21 11:07:23');
INSERT INTO `mc_metadata` VALUES (114, 'test888图名', 'test888图名', 1, 1, 'tag2', 'test888图名', 1, 528, 0, 2, 1, 2, 73, 'new88', '2019-03-18 14:42:02', 'new88', '2019-03-21 11:06:19');
INSERT INTO `mc_metadata` VALUES (115, 'new88hdfs1', 'new88hdfs1', 1, 4, 'tag1', 'ssss', 1, 528, NULL, 2, 7, NULL, 80, 'new88', '2019-03-18 15:17:33', 'new88', '2019-03-20 18:10:13');
INSERT INTO `mc_metadata` VALUES (116, '草稿1', '草稿1', 0, 5, 'tag1', '森', 1, 528, NULL, 2, 7, NULL, 80, 'new88', '2019-03-18 15:25:25', 'new88', '2019-03-20 18:12:01');
INSERT INTO `mc_metadata` VALUES (117, '/aa', 'aa', 1, 6, 'tag2', 'dddd', 3, 443, NULL, 2, 7, NULL, 85, 'xionghan1', '2019-03-18 17:18:41', 'xionghan1', '2019-03-18 18:04:09');
INSERT INTO `mc_metadata` VALUES (118, '/cc', 'cc', 1, 6, 'tag1', 'vvvv', 3, 443, NULL, 2, 7, NULL, 85, 'xionghan1', '2019-03-18 17:20:21', 'xionghan1', '2019-03-18 18:04:10');
INSERT INTO `mc_metadata` VALUES (119, 'bb', '/bb', 1, 6, 'tag1', NULL, 5, 443, NULL, 2, 7, NULL, 85, 'xionghan1', '2019-03-18 17:23:44', 'xionghan1', '2019-03-18 18:04:07');
INSERT INTO `mc_metadata` VALUES (120, '/a', 'a', 1, 6, 'tag1,tag2', NULL, 2, 443, NULL, 2, 7, NULL, 86, 'xionghan1', '2019-03-18 17:24:26', 'xionghan1', '2019-03-19 09:20:27');
INSERT INTO `mc_metadata` VALUES (121, '/b', 'b', 1, 6, 'tag1', NULL, 1, 443, NULL, 2, 7, NULL, 86, 'xionghan1', '2019-03-18 17:24:45', 'xionghan1', '2019-03-19 09:20:28');
INSERT INTO `mc_metadata` VALUES (122, '/aaa', 'aaa', 1, 6, 'tag2', NULL, 2, 443, NULL, 2, 7, NULL, 87, 'xionghan1', '2019-03-18 17:25:11', 'xionghan1', '2019-03-19 09:20:33');
INSERT INTO `mc_metadata` VALUES (123, '/bb1', '/bb1', 1, 6, 'tag1', NULL, 1, 443, NULL, 2, 7, NULL, 85, 'xionghan1', '2019-03-18 18:04:37', 'xionghan1', '2019-03-19 09:20:21');
INSERT INTO `mc_metadata` VALUES (124, '/t1', '/t1', 1, 6, 'tag1', NULL, 1, 443, NULL, 1, 7, NULL, 89, 'xionghan1', '2019-03-19 09:29:25', 'xionghan1', '2019-03-19 09:29:25');
INSERT INTO `mc_metadata` VALUES (125, '/tt1', '/tt1', 1, 6, 'tag2', '', 1, 443, NULL, 1, 7, NULL, 89, 'xionghan1', '2019-03-19 09:29:55', 'xionghan1', '2019-03-19 09:29:55');
INSERT INTO `mc_metadata` VALUES (126, '/t2', '/t2', 1, 6, 'tag1', NULL, 1, 443, NULL, 1, 7, NULL, 90, 'xionghan1', '2019-03-19 09:31:43', 'xionghan1', '2019-03-19 09:31:43');
INSERT INTO `mc_metadata` VALUES (127, '/t3', '/t3', 1, 6, 'tag1', NULL, 1, 443, NULL, 1, 7, NULL, 91, 'xionghan1', '2019-03-19 09:32:03', 'xionghan1', '2019-03-19 09:32:03');
INSERT INTO `mc_metadata` VALUES (128, '/tt3', '/tt3', 1, 6, 'tag2', '', 1, 443, NULL, 1, 7, NULL, 91, 'xionghan1', '2019-03-19 09:32:15', 'xionghan1', '2019-03-19 09:32:15');
INSERT INTO `mc_metadata` VALUES (129, '/ttt3', '/ttt3', 1, 6, 'tag1,tag2', '', 1, 443, NULL, 1, 7, NULL, 91, 'xionghan1', '2019-03-19 09:32:29', 'xionghan1', '2019-03-19 09:32:29');
INSERT INTO `mc_metadata` VALUES (130, '/robin_test_service', 'HDFS存储创建测试', 0, NULL, '', NULL, 1, 463, NULL, 1, 7, NULL, 34, 'robin', '2019-03-19 10:26:00', 'robin', '2019-03-19 10:26:00');
INSERT INTO `mc_metadata` VALUES (131, '/asdfa', 'sdfad', 0, 4, 'asdfas,tag1', 'asdfasdf', 1, 528, NULL, 2, 7, NULL, 80, 'new88', '2019-03-19 10:29:40', 'new88', '2019-03-20 15:42:42');
INSERT INTO `mc_metadata` VALUES (132, 'GRAPH666', 'graph66中文名', 1, 4, 'tag1', '木', 1, 456, 1, 2, 2, 1, 93, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43');
INSERT INTO `mc_metadata` VALUES (133, 'MYSQL_88_MANAUL_TB_1', '选中一个1123', 0, 5, 'tag1', '备注', 1, 456, 1, 2, 2, 1, 93, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42');
INSERT INTO `mc_metadata` VALUES (134, 'NOTHREE123', 'adf234', 0, 4, 'tag1', 'sdf', 1, 456, 1, 2, 2, 1, 93, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42');
INSERT INTO `mc_metadata` VALUES (139, 'TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_T', '砂浆覅', 0, 5, 'tag1', '的地方斯蒂芬', 1, 456, 1, 2, 2, 1, 93, 'oyr', '2019-03-19 13:58:37', 'oyr', '2019-03-22 17:39:42');
INSERT INTO `mc_metadata` VALUES (142, 'user', '用户表', 0, 1, 'cs1', 'cs1', 1, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-19 14:21:49', 'wzl1', '2019-03-19 15:57:34');
INSERT INTO `mc_metadata` VALUES (143, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 1, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 15:29:23');
INSERT INTO `mc_metadata` VALUES (144, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 1, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:35:27');
INSERT INTO `mc_metadata` VALUES (145, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 1, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:47:30');
INSERT INTO `mc_metadata` VALUES (146, 'user_dept', 'user_dept', 0, 1, 'user_dept', 'user_dept', 1, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:52:45');
INSERT INTO `mc_metadata` VALUES (147, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 2, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:57:32');
INSERT INTO `mc_metadata` VALUES (148, 'user', '杂SS_user', 0, 1, 'user', 'user', 2, 527, 0, 1, 1, 1, 6, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:53:25');
INSERT INTO `mc_metadata` VALUES (149, 'grade', 'grade', 0, 1, 'grade', 'grade', 1, 527, 0, 1, 1, 1, 6, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31');
INSERT INTO `mc_metadata` VALUES (150, 'insertdd', 'insertdd', 0, 1, 'tag1', 'bebet', 2, 527, NULL, 1, 7, NULL, 67, 'wzl1', '2019-03-19 16:01:08', 'wzl1', '2019-03-19 16:01:22');
INSERT INTO `mc_metadata` VALUES (151, '/caogaoceshi', 'caogaoceshi', 0, 2, 'tag1', 'v', 1, 527, NULL, 2, 7, NULL, 67, 'wzl1', '2019-03-19 16:02:28', 'wzl1', '2019-03-22 10:37:48');
INSERT INTO `mc_metadata` VALUES (152, 'suoyin1', 'suoyin1文名', 0, 4, 'tag1', 's', 1, 528, 0, 2, 1, 1, 78, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_metadata` VALUES (154, 'waijian1', 'waijian1中文名', 0, 4, 'tag1', 's', 1, 528, 0, 2, 1, 1, 78, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_metadata` VALUES (161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', 'ce', 9, 528, 0, 2, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_metadata` VALUES (162, 'asdf234234', 'asrestjiji', 0, 6, 'tag1', 'sdfsf234', 1, 443, NULL, 1, 7, NULL, 90, 'xionghan1', '2019-03-19 20:29:02', 'xionghan1', '2019-03-19 20:29:02');
INSERT INTO `mc_metadata` VALUES (163, 'MUSER', 'sxcv', 0, 6, 'tag1', 'sdfsdf', 1, 456, 1, 2, 1, 1, 7, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (164, 'MUSER_TEST', 'asdf234', 0, 6, 'tag1', 'sdfsdf', 1, 456, 1, 2, 1, 1, 7, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (165, 'etl_rating', 'xcv234', 0, 6, 'tag1', 'sdf', 1, 456, 1, 2, 1, 1, 7, 'oyr', '2019-03-19 21:00:19', 'oyr', '2019-03-20 15:42:19');
INSERT INTO `mc_metadata` VALUES (166, 'etltest2', 'zxcv', 0, 6, 'xcv', 'zxcv3234', 1, 456, 1, 2, 1, 1, 7, 'oyr', '2019-03-19 21:00:41', 'oyr', '2019-03-20 15:42:12');
INSERT INTO `mc_metadata` VALUES (168, 'DC_COLUMNMATCH', 'zxcv234', 0, 6, 'xcv', 'sdf', 1, 443, 1, 2, 2, 1, 8, 'xionghan1', '2019-03-19 21:01:26', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_metadata` VALUES (169, 'etl_view_test', 'sdf234', 0, 6, 'tag1', 'sdf', 1, 456, 1, 1, 1, 2, 7, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20');
INSERT INTO `mc_metadata` VALUES (170, 'account', 'accc', 1, 4, 'tag1', NULL, 1, 456, 1, 2, 1, 1, 71, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10');
INSERT INTO `mc_metadata` VALUES (171, 'xinjian_123124', 'xinjian_123124', 1, 2, 'tag1', 'dd234', 3, 527, 0, 1, 2, 1, 40, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 10:05:37');
INSERT INTO `mc_metadata` VALUES (172, 'rest_oracle', '中文名阿拉拉了', 1, 2, '调度34', '等等34', 1, 527, 0, 2, 2, 1, 40, 'wzl1', '2019-03-20 09:51:03', 'wzl1', '2019-03-20 10:22:02');
INSERT INTO `mc_metadata` VALUES (173, 'sjeifjoi_12i34joij', 'asdf234234', 1, 2, 'tag1', 'sdf234', 1, 527, 0, 1, 2, 1, 40, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07');
INSERT INTO `mc_metadata` VALUES (174, 'asD1234', 'asD1234', 1, 2, 'tag1', 'asD1234', 1, 527, 0, 1, 2, 1, 40, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39');
INSERT INTO `mc_metadata` VALUES (175, 'asD1234_sadfsdf', 'asD1234_sadfsdf', 1, 2, 'tag1', '修改正式', 3, 527, 0, 2, 2, 1, 40, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 15:38:39');
INSERT INTO `mc_metadata` VALUES (176, 'asdf234_asfjiewjf', 'asdf234_asfjiewjf', 1, 2, 'asdf234_asfjiewjf', 'asdf234_ac', 1, 527, 0, 0, 2, 1, 40, 'wzl1', '2019-03-20 10:05:21', 'wzl1', '2019-03-20 11:27:25');
INSERT INTO `mc_metadata` VALUES (177, 'english_123', 'english_123中文', 0, 1, 'tag1', 'sdf ', 1, 527, NULL, 1, 5, NULL, 1, 'wzl1', '2019-03-20 11:22:16', 'wzl1', '2019-03-20 11:22:16');
INSERT INTO `mc_metadata` VALUES (178, 'english_123_1', 'english_123中文23', 0, 1, 'tag1', 'sdf ', 1, 527, NULL, 0, 5, NULL, 1, 'wzl1', '2019-03-20 11:22:30', 'wzl1', '2019-03-20 11:22:30');
INSERT INTO `mc_metadata` VALUES (179, 'xhtest_10', 'xh_10中文', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 95, 'new88', '2019-03-20 13:48:17', 'new88', '2019-03-21 14:11:17');
INSERT INTO `mc_metadata` VALUES (180, 'xhtest_100', 'xh_100中文', 0, 4, 'tag1,tag2', NULL, 1, 528, 1, 2, 1, 1, 95, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17');
INSERT INTO `mc_metadata` VALUES (181, 'xhtest_1000', 'xh_1000中文', 0, 4, 'tag1,tag2', NULL, 1, 528, 1, 2, 1, 1, 95, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17');
INSERT INTO `mc_metadata` VALUES (182, 'xhtest_big', 'xh_big中文', 0, 4, 'tag1,tag2', NULL, 1, 528, 1, 2, 1, 1, 95, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17');
INSERT INTO `mc_metadata` VALUES (183, 'xhtest_temp', 'xh_t中文', 0, 4, 'tag1,tag2', NULL, 1, 528, 1, 2, 1, 1, 95, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17');
INSERT INTO `mc_metadata` VALUES (187, 'xhtest_100', 'temp_100', 0, 6, 'tag1', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40');
INSERT INTO `mc_metadata` VALUES (188, 'xhtest_temp', 'temp_t', 0, 6, 'tag1', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40');
INSERT INTO `mc_metadata` VALUES (189, 'xhtest_100', '正则', 0, 6, 'tag1,tag2', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38');
INSERT INTO `mc_metadata` VALUES (190, 'xhtest_temp', '单独的', 0, 6, 'tag1,tag2', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38');
INSERT INTO `mc_metadata` VALUES (191, 'asdfa', '测试目录asdfa', 0, 4, 'tag1', NULL, 1, 528, NULL, 2, 7, NULL, 80, 'new88', '2019-03-20 15:43:07', 'new88', '2019-03-20 16:38:28');
INSERT INTO `mc_metadata` VALUES (192, 'test_sjeifjseijf', 'test_sjeifjseijf', 0, 5, 'tag1', 'test_sjeifjseijf', 1, 528, NULL, 2, 7, NULL, 80, 'new88', '2019-03-20 15:46:14', 'new88', '2019-03-20 18:10:04');
INSERT INTO `mc_metadata` VALUES (193, 'xhtest_10', 'x传', 0, 6, 'tag1', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 16:14:39');
INSERT INTO `mc_metadata` VALUES (194, 'xhtest_temp', 'X想', 0, 6, 'tag1', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39');
INSERT INTO `mc_metadata` VALUES (195, 'TableB', '方法', 0, 6, 'tag1', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 16:14:39');
INSERT INTO `mc_metadata` VALUES (196, 'xhtest_10', '信息', 0, 6, 'tag1', NULL, 2, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 16:17:30');
INSERT INTO `mc_metadata` VALUES (197, 'xhtest_100', '非', 0, 6, 'tag2', NULL, 1, 443, 1, 1, 1, 1, 7, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17');
INSERT INTO `mc_metadata` VALUES (198, 'xhtest_temp', '传', 0, 6, 'tag2', NULL, 1, 443, 1, 1, 1, 1, 7, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18');
INSERT INTO `mc_metadata` VALUES (199, 'TableB', 'B吧', 0, 6, 'tag1', NULL, 2, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:40:37');
INSERT INTO `mc_metadata` VALUES (200, 'TableB', '找你', 0, 6, 'asas ', 'asdasd', 2, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:43:02');
INSERT INTO `mc_metadata` VALUES (201, 'TableB', 'sad', 0, 6, 'das', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:45:56');
INSERT INTO `mc_metadata` VALUES (202, 'TableB', 'asdasd', 0, 6, 'asd', 'asd', 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:47:13');
INSERT INTO `mc_metadata` VALUES (203, 'TableB', 'f法国和', 0, 6, '从法国 ', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:48:35');
INSERT INTO `mc_metadata` VALUES (204, 'TableB', '发表', 0, 6, 'tag1', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:53:39');
INSERT INTO `mc_metadata` VALUES (205, 'TableB', '啊实打实', 0, 6, '阿瑟东', '测试保存', 5, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:59:58');
INSERT INTO `mc_metadata` VALUES (207, 'user_test1', '用户表', 0, 6, 'cssa', 'cssa', 6, 443, 0, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 17:14:35');
INSERT INTO `mc_metadata` VALUES (208, 'TableB', '啊是大', 0, 6, '此次', '测测', 3, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-21 15:36:53');
INSERT INTO `mc_metadata` VALUES (209, 'cs1', 'cs1中文', 0, 6, 'cs1', 'cs1', 2, 443, 0, 2, 1, 1, 7, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:29:03');
INSERT INTO `mc_metadata` VALUES (210, 'single_table', '的', 0, 6, 'sssdfds', NULL, 1, 443, 1, 1, 1, 2, 7, 'xionghan1', '2019-03-20 17:19:06', 'xionghan1', '2019-03-20 17:19:06');
INSERT INTO `mc_metadata` VALUES (212, 'cs_22', '测试数据1', 0, 1, 'cs_22', 'cs_22', 2, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 19:02:55');
INSERT INTO `mc_metadata` VALUES (213, 'cs652', '擦拭', 0, 1, 'cs3', 'cs3', 4, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 19:10:25');
INSERT INTO `mc_metadata` VALUES (214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 20, 527, 0, 2, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:41:25');
INSERT INTO `mc_metadata` VALUES (215, 'S1', 'S1目录', 0, 4, 'tag1', NULL, 2, 528, NULL, 2, 7, NULL, 112, 'new88', '2019-03-20 19:01:32', 'new88', '2019-03-23 11:46:22');
INSERT INTO `mc_metadata` VALUES (216, 'asddasdw', '测试阿萨德我去', 0, 1, 'asddasdw', 'asddasdw', 1, 527, 0, 0, 1, 1, 6, 'wzl1', '2019-03-21 09:50:51', 'wzl1', '2019-03-21 09:50:51');
INSERT INTO `mc_metadata` VALUES (217, 'caogao111', '中文草稿', 0, 4, 'tag1', '更改为执行', 1, 528, 0, 2, 1, 1, 78, 'new88', '2019-03-21 10:01:45', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_metadata` VALUES (218, 'caogao123', '草稿11', 0, 1, 'tag1', '史蒂夫调度', 1, 528, 0, 2, 1, 2, 78, 'new88', '2019-03-21 10:35:44', 'new88', '2019-03-21 11:07:31');
INSERT INTO `mc_metadata` VALUES (219, 'test1', '质量数据例库', 0, 6, '质量', NULL, 1, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 15:36:51');
INSERT INTO `mc_metadata` VALUES (220, 'HIVE111', 'HIVE111中文', 1, 4, 'tag1', 'ssss', 1, 528, NULL, 2, 5, NULL, 117, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-22 17:55:35');
INSERT INTO `mc_metadata` VALUES (221, 'HBASE1123', 'HBASE1123中文名', 1, 4, 'tag1', 'SS', 1, 528, NULL, 1, 6, NULL, 94, 'new88', '2019-03-21 11:52:37', 'new88', '2019-03-21 11:52:37');
INSERT INTO `mc_metadata` VALUES (222, 'hbase455wwww', 'hbase455中文名www', 1, 4, 'tag1', 'sssss', 1, 528, NULL, 1, 6, NULL, 94, 'new88', '2019-03-21 12:18:09', 'new88', '2019-03-21 12:18:09');
INSERT INTO `mc_metadata` VALUES (225, 'new123', 'new123中文名', 0, 4, 'tag1', 'ddd', 1, 528, 0, 1, 1, 1, 147, 'new88', '2019-03-21 14:54:05', 'new88', '2019-03-21 14:54:05');
INSERT INTO `mc_metadata` VALUES (226, 'table1', 's', 0, 4, 'tag1', 's', 1, 528, 1, 1, 1, 1, 147, 'new88', '2019-03-21 14:54:37', 'new88', '2019-03-21 14:54:37');
INSERT INTO `mc_metadata` VALUES (227, 'new222', 'new222中文', 0, 4, 'tag2', 'sss', 1, 528, 0, 1, 1, 1, 147, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50');
INSERT INTO `mc_metadata` VALUES (228, 'ETL_EXEC_RECORD_PART', '直采表', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20');
INSERT INTO `mc_metadata` VALUES (229, 'ETL_FILE_REPOSITORY', '直采表1', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33');
INSERT INTO `mc_metadata` VALUES (230, 'INPUT_TABLE_phoenix', '直采表2', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:33:27');
INSERT INTO `mc_metadata` VALUES (231, 'MUSER', '直采表3', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:30:32');
INSERT INTO `mc_metadata` VALUES (232, 'MUSER_TEST', '直采表4', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-22 15:34:12');
INSERT INTO `mc_metadata` VALUES (233, 'SEQ_TABLE', '直采表5', 1, 4, 'tag1', NULL, 2, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-22 17:21:33');
INSERT INTO `mc_metadata` VALUES (234, 'TableB', '直采表6', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-22 15:34:15');
INSERT INTO `mc_metadata` VALUES (235, 'TableC', '直采表7', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:24');
INSERT INTO `mc_metadata` VALUES (236, 'TableD', '直采表8', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:21');
INSERT INTO `mc_metadata` VALUES (237, 'cs1', '直采表9', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:18');
INSERT INTO `mc_metadata` VALUES (238, 'etl_rating', '直采表10', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (239, 'etl_salary', '直采表直采表1', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (240, 'etl_salary_copy', '直采表直采表2', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (241, 'etltest', '直采表直采表3', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (242, 'etltest1', '直采表直采表4', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (243, 'etltest2', '直采表直采表5', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (244, 'etltest3', '直采表直采表6', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (245, 'etltest_spark', '直采表直采表7', 1, 4, 'tag1', NULL, 2, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:28:22');
INSERT INTO `mc_metadata` VALUES (246, 'filename', '直采表直采表8', 1, 4, 'tag1', NULL, 2, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:29:52');
INSERT INTO `mc_metadata` VALUES (247, 'filename_copy', '直采表直采表9', 1, 4, 'tag1', NULL, 6, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:32:38');
INSERT INTO `mc_metadata` VALUES (248, 'hbase_test', '直采表直采表10', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (249, 'j_fs_default_fsentry', 'ssw', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_metadata` VALUES (250, 'j_fs_security_fsentry', 's', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_metadata` VALUES (251, 'j_pm_default_binval', 'sw', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_metadata` VALUES (252, 'j_pm_default_node', 'wrw', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_metadata` VALUES (253, 'j_pm_default_prop', 'wqw', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_metadata` VALUES (254, 'j_pm_default_refs', 'werqw', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_metadata` VALUES (255, 'j_pm_security_binval', 'www', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_metadata` VALUES (256, 'j_pm_security_node', 'wrww', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_metadata` VALUES (257, 'j_pm_security_refs', 'rwrw', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 150, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_metadata` VALUES (258, 'asdfsdfsdf', '中文asdf', 0, 5, 'tag1', 'sdfsdfsdf', 1, 528, 0, 1, 1, 1, 147, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54');
INSERT INTO `mc_metadata` VALUES (259, 'log_info', '安定2', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (260, 'log_run', '安定1', 1, 4, 'tag1', NULL, 1, 528, 1, 2, 1, 1, 149, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_metadata` VALUES (261, 'TableB', 'asd萨顶顶', 0, 6, 'tag1', '打的', 2, 443, 1, 2, 1, 1, 7, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:40:41');
INSERT INTO `mc_metadata` VALUES (262, 'TableB', '是的', 0, 6, 'tag1', 'asd', 2, 443, 1, 1, 1, 1, 7, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:26:28');
INSERT INTO `mc_metadata` VALUES (263, 'filename', '复制表', 1, 4, 'tag1,tag2', NULL, 1, 528, 1, 1, 1, 1, 148, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26');
INSERT INTO `mc_metadata` VALUES (265, 'log_step', 'ASASd', 0, 5, 'tag1', 'asdf234', 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_metadata` VALUES (266, 'log_test', 'asdf', 0, 5, 'tag1', 'asdf234', 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_metadata` VALUES (267, 'sched_job', 'asdf234', 0, 5, 'tag1', 'asdf234', 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23');
INSERT INTO `mc_metadata` VALUES (269, 'mysql_sjfiejfi', '中文啦啦啦123123', 0, 4, 'tag1', 'sdf', 1, 528, 0, 1, 1, 1, 149, 'new88', '2019-03-21 19:36:58', 'new88', '2019-03-21 19:36:58');
INSERT INTO `mc_metadata` VALUES (270, '/data2_folder', 'data2_folder', 0, 4, '新标签1', NULL, 1, 528, NULL, 1, 7, NULL, 151, 'new88', '2019-03-22 11:06:43', 'new88', '2019-03-22 11:06:43');
INSERT INTO `mc_metadata` VALUES (271, 'oracle_table_2', 'yueshu', 0, 1, 'tag1', 'sdf234', 1, 527, 1, 1, 2, 1, 40, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_metadata` VALUES (272, 'newTableTest2', 'newTableTest2', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44');
INSERT INTO `mc_metadata` VALUES (273, 'newTableTest4', 'newTableTest4', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44');
INSERT INTO `mc_metadata` VALUES (274, 'newTableTest5', 'newTableTest5', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_metadata` VALUES (275, 'newTableTest6', 'newTableTest6', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_metadata` VALUES (276, 'person', 'person', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_metadata` VALUES (277, 'product', 'product', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_metadata` VALUES (278, 'sched_attachment', 'sched_attachment', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (279, 'sched_jar_job_content', 'sched_jar_job_content', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (280, 'sched_script_job_content', 'sched_script_job_content', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (281, 'sched_task', 'sched_task', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (282, 'sched_trigger', 'sched_trigger', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (283, 'sd', 'sd', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (284, 'stduent_neo4j', 'stduent_neo4j', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (285, 'student_hive', 'student_hive', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_metadata` VALUES (286, 'student_test', 'student_test', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (287, 't1', '这个是T1的表注释', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (288, 'tab1', 'tab1', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (289, 'test1', 'test1', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (290, 'test_access', 'test_access', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (291, 'test_pt', 'test_pt', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (292, 'test_pt1', 'test_pt1', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (293, 'testtableout', 'testtableout', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_metadata` VALUES (295, 'TB_TEST', 'TB_TEST', 0, 5, 'tag1', NULL, 1, 528, 1, 2, 2, 1, 93, 'new88', '2019-03-22 16:49:08', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_metadata` VALUES (296, 'TB_TEST_A', 'TB_TEST_A', 0, 5, 'tag1', NULL, 1, 528, 1, 2, 2, 1, 93, 'new88', '2019-03-22 16:49:10', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_metadata` VALUES (297, 'TEST_TB', 'TEST_TB', 0, 5, 'tag1', NULL, 1, 528, 1, 2, 2, 1, 93, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_metadata` VALUES (298, 'TTTT', 'TTTT', 0, 5, 'tag1', NULL, 1, 528, 1, 2, 2, 1, 93, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_metadata` VALUES (299, 'ETL_EXEC_RECORD_PART', 'ETL_EXEC_RECORD_PART', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_metadata` VALUES (300, 'ETL_FILE_REPOSITORY', 'ETL_FILE_REPOSITORY', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_metadata` VALUES (301, 'INPUT_TABLE_phoenix', 'INPUT_TABLE_phoenix', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_metadata` VALUES (302, 'MUSER', 'MUSER', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_metadata` VALUES (303, 'MUSER_TEST', 'MUSER_TEST', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_metadata` VALUES (304, 'TableB', 'TableB', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_metadata` VALUES (305, 'TableC', 'TableC', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_metadata` VALUES (306, 'TableD', 'TableD', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_metadata` VALUES (307, 'cs1', 'cs1', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_metadata` VALUES (308, 'etl_rating', 'etl_rating', 0, 5, 'tag1', NULL, 1, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_metadata` VALUES (309, 'etl_salary', '员工工资表', 1, 4, 'tag1', NULL, 2, 528, 1, 1, 1, 1, 149, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-25 14:57:10');
INSERT INTO `mc_metadata` VALUES (310, 'TDDDS', 'DD大幅度', 0, 4, 'tag1,tag2', NULL, 1, 528, 0, 2, 1, 1, 149, 'new88', '2019-03-22 17:29:58', 'new88', '2019-03-22 17:42:32');
INSERT INTO `mc_metadata` VALUES (311, 'caogao_20349', '中文啦啦啦12334', 0, 5, 'tag1', '阿斯顿发34', 1, 528, 0, 0, 1, 1, 149, 'new88', '2019-03-22 17:40:10', 'new88', '2019-03-22 17:40:10');
INSERT INTO `mc_metadata` VALUES (312, 'GRAPH666', 'graph666中文名称', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23');
INSERT INTO `mc_metadata` VALUES (313, 'MYSQL_88_MANAUL_TB_1', 'mysql_88_manaul_tb_1的中文名', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');
INSERT INTO `mc_metadata` VALUES (314, 'NOTHREE123', 'nothree123中文名', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27');
INSERT INTO `mc_metadata` VALUES (316, 'TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_T', 'TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_T', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29');
INSERT INTO `mc_metadata` VALUES (317, 'TB_TEST', 'TB_TEST', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30');
INSERT INTO `mc_metadata` VALUES (318, 'TB_TEST_A', 'TB_TEST_A', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_metadata` VALUES (319, 'TEST_TB', 'TEST_TB', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_metadata` VALUES (320, 'TTTT', 'TTTT', 0, 4, 'tag1', NULL, 1, 528, 1, 1, 2, 1, 155, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32');
INSERT INTO `mc_metadata` VALUES (321, 'steste', 'steste文名', 1, 4, 'tag1', NULL, 1, 528, 0, 1, 1, 1, 144, 'new88', '2019-03-22 20:57:34', 'new88', '2019-03-22 20:57:34');
INSERT INTO `mc_metadata` VALUES (328, 'etl_salary_AUTO_SUB_1', '员工工资表', 0, 4, 'tag1', '订阅建表自动生成', 1, 528, 1, 1, 1, 1, 157, 'new10', '2019-03-22 22:43:01', 'new10', '2019-03-22 22:43:01');
INSERT INTO `mc_metadata` VALUES (331, 'GRAPH666_AUTO_SUB_1', 'graph666中文名称', 0, 4, 'tag1', '订阅建表自动生成', 1, 528, 1, 1, 1, 1, 157, 'new10', '2019-03-22 22:46:11', 'new10', '2019-03-22 22:46:11');
INSERT INTO `mc_metadata` VALUES (332, 'RC_ORACLE_GRAPH666', '数据接收Oracle', 0, 5, 'tag1', NULL, 1, 528, 0, 1, 1, 1, 148, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18');
INSERT INTO `mc_metadata` VALUES (333, '/AD', 'ad文件夹', 0, 4, 'tag1', NULL, 1, 528, NULL, 1, 7, NULL, 112, 'new88', '2019-03-23 11:46:10', 'new88', '2019-03-23 11:46:10');
INSERT INTO `mc_metadata` VALUES (334, 'oyr_cs1223', 'oyr_cs1223是', 0, 1, 'oyr_cs1223', 'oyr_cs1223', 1, 527, 0, 1, 1, 1, 6, 'wzl1', '2019-03-23 15:03:25', 'wzl1', '2019-03-23 15:03:25');
INSERT INTO `mc_metadata` VALUES (335, 'etl_salary_AUTO_SUB_2', '员工工资表', 0, 4, 'tag1', '订阅建表自动生成', 1, 528, 1, 1, 1, 1, 157, 'new10', '2019-03-23 16:21:32', 'new10', '2019-03-23 16:21:32');
INSERT INTO `mc_metadata` VALUES (336, 'etl_salary_AUTO_SUB_3', '员工工资表', 0, 4, 'tag1', '订阅建表自动生成', 1, 528, 1, 1, 1, 1, 157, 'new10', '2019-03-23 16:38:33', 'new10', '2019-03-23 16:38:33');
INSERT INTO `mc_metadata` VALUES (337, 'account', 'account', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_metadata` VALUES (338, 'agg_c_10_sales_fact_1997', 'agg_c_10_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_metadata` VALUES (339, 'agg_c_14_sales_fact_1997', 'agg_c_14_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_metadata` VALUES (340, 'agg_c_special_sales_fact_1997', 'agg_c_special_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_metadata` VALUES (341, 'agg_g_ms_pcat_sales_fact_1997', 'agg_g_ms_pcat_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_metadata` VALUES (342, 'agg_l_03_sales_fact_1997', 'agg_l_03_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_metadata` VALUES (343, 'agg_l_04_sales_fact_1997', 'agg_l_04_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_metadata` VALUES (344, 'agg_l_05_sales_fact_1997', 'agg_l_05_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_metadata` VALUES (345, 'agg_lc_06_sales_fact_1997', 'agg_lc_06_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_metadata` VALUES (346, 'agg_lc_100_sales_fact_1997', 'agg_lc_100_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_metadata` VALUES (347, 'agg_ll_01_sales_fact_1997', 'agg_ll_01_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (348, 'agg_pl_01_sales_fact_1997', 'agg_pl_01_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (349, 'category', 'category', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (350, 'currency', 'currency', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (351, 'customer', 'customer', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (352, 'days', 'days', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (353, 'department', 'department', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (354, 'employee_closure', 'employee_closure', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_metadata` VALUES (355, 'expense_fact', 'expense_fact', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_metadata` VALUES (356, 'inventory_fact_1997', 'inventory_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_metadata` VALUES (357, 'inventory_fact_1998', 'inventory_fact_1998', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_metadata` VALUES (358, 'position', 'position', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_metadata` VALUES (359, 'product', 'product', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_metadata` VALUES (360, 'product_class', 'product_class', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_metadata` VALUES (361, 'region', 'region', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_metadata` VALUES (362, 'sadf123', '测试一下', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_metadata` VALUES (363, 'salary', 'salary', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_metadata` VALUES (364, 'sales_fact_1997', 'sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_metadata` VALUES (365, 'sales_fact_1998', 'sales_fact_1998', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_metadata` VALUES (366, 'sales_fact_dec_1998', 'sales_fact_dec_1998', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_metadata` VALUES (367, 'sdfe', '中文12349看', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_metadata` VALUES (368, 'store', 'store', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_metadata` VALUES (369, 'store_ragged', 'store_ragged', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_metadata` VALUES (370, 'time_by_day', 'time_by_day', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_metadata` VALUES (371, 'warehouse', 'warehouse', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_metadata` VALUES (372, 'warehouse_class', 'warehouse_class', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 528, 1, 1, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');

-- ----------------------------
-- Table structure for mc_metadata_es
-- ----------------------------
DROP TABLE IF EXISTS `mc_metadata_es`;
CREATE TABLE `mc_metadata_es`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default_type' COMMENT '类型名称',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `schema_id` bigint(20) NULL DEFAULT NULL COMMENT '模型id',
  `public_status` int(10) NULL DEFAULT NULL COMMENT '公开状态：0:不公开 1:授权访问',
  `theme_id` bigint(255) NULL DEFAULT NULL COMMENT '主题id，外键关联',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签，多个以，隔开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前版本号',
  `status` int(20) NULL DEFAULT NULL COMMENT '当前状态：0草稿 1生效 2删除',
  `is_open` bit(1) NULL DEFAULT NULL COMMENT '是否开启：0停用 1开启',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `max_version` int(10) NULL DEFAULT NULL COMMENT '冗余-最大版本号，递增',
  `max_location` int(10) NULL DEFAULT NULL COMMENT '冗余-最大字段位置值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ES索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_metadata_es
-- ----------------------------
INSERT INTO `mc_metadata_es` VALUES (6, 'default_type', 'es中文', 4, 1, 2, 'tag1', '试一下-up', 3, 1, b'1', 527, 'wzl1', '2019-03-12 02:09:25', 'wzl1', '2019-03-14 03:55:54', 3, 2);
INSERT INTO `mc_metadata_es` VALUES (7, 'default_type', 'ceshi中文', 39, 0, 2, 'tag1', NULL, 1, 2, b'1', 527, 'wzl1', '2019-03-12 04:24:23', 'wzl1', '2019-03-12 17:42:13', 1, 1);
INSERT INTO `mc_metadata_es` VALUES (8, 'default_type', '厕纸', 39, 0, 2, 'tag1', '的', 1, 2, b'1', 527, 'wzl1', '2019-03-12 04:35:31', 'wzl1', '2019-03-12 17:51:11', 1, 1);
INSERT INTO `mc_metadata_es` VALUES (9, 'default_type', '测试内容草稿箱', 39, 0, 1, 'tag1', '调度dfdddd', 3, 2, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-14 11:24:15', 5, 2);
INSERT INTO `mc_metadata_es` VALUES (10, 'default_type', '测试内容草稿箱dd234', 39, 0, 1, 'tag1', '调度dfdddd', 4, 2, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-14 11:20:46', 5, 2);
INSERT INTO `mc_metadata_es` VALUES (11, 'default_type', '测试内容草稿箱dd234', 39, 1, 2, 'tag1,tag2', '新功能', 10, 2, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-14 14:28:39', 10, 3);
INSERT INTO `mc_metadata_es` VALUES (12, 'default_type', '测试中文111-2', 41, 1, 3, 'tag1,tag2', 'upup-1-todraf-2-tocreate', 2, 2, b'1', 527, 'wzl1', '2019-03-13 22:36:32', 'wzl1', '2019-03-14 13:34:31', 2, 2);
INSERT INTO `mc_metadata_es` VALUES (13, 'default_type', '索引测试1', 41, 1, 2, 'tag2', '索引测试1-草稿\n修改内容-保存草稿\n修改-新增字段-保存生效\n修改-字段新增和修改', 2, 2, b'1', 527, 'wzl1', '2019-03-14 00:49:52', 'wzl1', '2019-03-14 14:18:14', 2, 4);
INSERT INTO `mc_metadata_es` VALUES (14, 'default_type', '测试建索引-1-2', 41, 1, 1, 'tag1', '新建1-修改新增字段', 3, 1, b'0', 527, 'wzl1', '2019-03-14 05:44:10', 'wzl1', '2019-03-22 10:50:34', 3, 3);
INSERT INTO `mc_metadata_es` VALUES (20, 'default_type', '采械', 103, 1, 4, 'tag1,tag2', '木', 1, 1, b'1', 528, 'new88', '2019-03-21 10:00:54', 'new88', '2019-03-21 10:00:54', 1, 1);
INSERT INTO `mc_metadata_es` VALUES (21, 'default_type', 'sssw中文或字母', 116, 1, 4, 'tag1', 'sss', 1, 1, b'1', 528, 'new88', '2019-03-21 10:02:16', 'new88', '2019-03-21 10:02:16', 1, 1);

-- ----------------------------
-- Table structure for mc_resource_auth
-- ----------------------------
DROP TABLE IF EXISTS `mc_resource_auth`;
CREATE TABLE `mc_resource_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键·',
  `auth_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `auth_type` int(10) NULL DEFAULT NULL COMMENT '权限类型，1:读 2:写',
  `auth_value` int(20) NULL DEFAULT NULL COMMENT '权限值，二进制标识',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modify_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_resource_auth
-- ----------------------------
INSERT INTO `mc_resource_auth` VALUES (1, 'analyze', 1, 1, '2019-03-07 17:50:24', '2019-03-07 17:50:24');
INSERT INTO `mc_resource_auth` VALUES (2, 'analyze', 2, 2, '2019-03-07 17:50:24', '2019-03-07 17:50:24');
INSERT INTO `mc_resource_auth` VALUES (3, 'etl', 1, 4, '2019-03-07 17:50:24', '2019-03-07 17:50:24');
INSERT INTO `mc_resource_auth` VALUES (4, 'etl', 2, 8, '2019-03-07 17:50:24', '2019-03-07 17:50:24');

-- ----------------------------
-- Table structure for mc_schema
-- ----------------------------
DROP TABLE IF EXISTS `mc_schema`;
CREATE TABLE `mc_schema`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键·',
  `db_id` bigint(20) NOT NULL COMMENT '数据库平台id',
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称 oracle实例名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模式名称、es索引名称、hdfs目录',
  `name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模式中文名称、hdfs目录中文名',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
  `org_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属组织编码 多个以英文逗号分隔',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` int(11) NULL DEFAULT 1 COMMENT '类型 1新建 2注册',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0正常 1禁用',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除字段 0未删除 1已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orgcode`(`org_code`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模式实体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_schema
-- ----------------------------
INSERT INTO `mc_schema` VALUES (1, 7, NULL, 'test_hive_create', '测试hive模式新建', NULL, NULL, '123456789123456', '备注', 1, 0, 0, 'wzl1', '2019-03-08 01:01:08', 'wzl1', '2019-03-08 01:01:08', 527);
INSERT INTO `mc_schema` VALUES (3, 6, NULL, 'test_hbase_create', '测试hbase模式新建', NULL, NULL, '123456789123456', '备注', 1, 0, 0, 'wzl1', '2019-03-08 02:19:37', 'wzl1', '2019-03-08 02:19:37', 527);
INSERT INTO `mc_schema` VALUES (4, 8, NULL, 'test_es_create', '测试ES新建', NULL, NULL, '123456789123456,112348791156', '备注', 1, 0, 0, 'wzl1', '2019-03-08 02:20:59', 'wzl1', '2019-03-21 19:17:32', 527);
INSERT INTO `mc_schema` VALUES (6, 14, NULL, 'test_mysql_create1', 'mysql测试数据', 'oyr', 'a123456', '123456789123456', NULL, 1, 0, 0, 'wzl1', NULL, 'wzl1', '2019-03-22 17:54:09', 527);
INSERT INTO `mc_schema` VALUES (7, 15, NULL, 'test', '88_Mysql_Test', 'wuguozhou', 'wgz8562/', '001', NULL, 2, 0, 0, 'xionghan1', '2019-03-11 14:13:24', 'xionghan1', '2019-03-14 17:00:28', 443);
INSERT INTO `mc_schema` VALUES (8, 16, 'idatrix', 'C##TEST', '88_Oracle_test', 'C##TEST', 'test', '001', NULL, 2, 0, 0, 'xionghan1', '2019-03-11 14:13:24', 'xionghan1', '2019-03-14 17:00:24', 443);
INSERT INTO `mc_schema` VALUES (11, 6, NULL, 'sdsdsds', 'dsfs', NULL, NULL, '123456789123456,961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-11 03:04:03', 'wzl1', '2019-03-18 13:54:54', 527);
INSERT INTO `mc_schema` VALUES (12, 6, NULL, 'alisa1', 'assaa', NULL, NULL, '961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-11 03:04:33', 'wzl1', '2019-03-11 18:10:27', 527);
INSERT INTO `mc_schema` VALUES (13, 6, NULL, 'alisa1w', 'dfdg', NULL, NULL, '112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 03:07:36', 'wzl1', '2019-03-18 13:53:32', 527);
INSERT INTO `mc_schema` VALUES (14, 6, NULL, 'aa', 'ddd', NULL, NULL, '112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 03:08:41', 'wzl1', '2019-03-18 13:53:32', 527);
INSERT INTO `mc_schema` VALUES (15, 6, NULL, 'dsf', 'dsf', NULL, NULL, '961916519849,112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 03:10:40', 'wzl1', '2019-03-18 13:54:49', 527);
INSERT INTO `mc_schema` VALUES (16, 6, NULL, 'sdfd', 'dsf', NULL, NULL, '961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-11 03:52:59', 'wzl1', '2019-03-11 03:52:59', 527);
INSERT INTO `mc_schema` VALUES (17, 6, NULL, 'qw', 'ww11111', NULL, NULL, '123456789123456,961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-11 03:54:52', 'wzl1', '2019-03-15 14:57:34', 527);
INSERT INTO `mc_schema` VALUES (18, 14, NULL, 'test_mysql', 'mysql测试数据', 'oyr', 'a123456', '123456789123456', NULL, 1, 0, 0, 'wzl1', NULL, 'wzl1', '2019-03-11 17:02:48', 527);
INSERT INTO `mc_schema` VALUES (19, 6, NULL, 'sd', 'sd', NULL, NULL, '123456789123456,112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:10:01', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (20, 6, NULL, 'sss', 'asdfssf', NULL, NULL, '123456789123456,112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:10:52', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (21, 6, NULL, 'sss1', 'www', NULL, NULL, '123456789123456', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:12:43', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (22, 6, NULL, 'alisa1aa', 'aaaa', NULL, NULL, '112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:16:51', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (23, 6, NULL, 'qq1', 'qq1', NULL, NULL, '123456789123456', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:19:13', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (24, 6, NULL, 'sssd', 'sssd', NULL, NULL, '123456789123456', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:20:52', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (25, 6, NULL, 'q1', 'q1', NULL, NULL, '112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:39:37', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (26, 6, NULL, 'aq2', 'aq2', NULL, NULL, '123456789123456', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:43:15', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (28, 6, NULL, 'ssa', 'aas', NULL, NULL, '112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:53:30', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (29, 6, NULL, 'alisa1a', 'ass', NULL, NULL, '123456789123456', NULL, 1, 0, 0, 'wzl1', '2019-03-11 04:54:49', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (30, 6, NULL, 'sssa', 'as', NULL, NULL, '112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 05:13:38', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (31, 6, NULL, 'metadata/sever', 'sdsd', NULL, NULL, '112348791156', NULL, 1, 0, 0, 'wzl1', '2019-03-11 05:23:32', 'wzl1', '2019-03-12 14:30:06', 527);
INSERT INTO `mc_schema` VALUES (32, 6, NULL, '资源', 'XXXX', NULL, NULL, '123456789123456,961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-11 05:25:00', 'wzl1', '2019-03-18 13:54:25', 527);
INSERT INTO `mc_schema` VALUES (34, 14, NULL, 'etl61', 'sdsd', 'etl3', '122qweQWE/', '112348791156', NULL, 2, 0, 0, 'wzl1', '2019-03-11 05:25:41', 'wzl1', '2019-03-14 18:31:34', 527);
INSERT INTO `mc_schema` VALUES (35, 7, NULL, 'alisa1', 'sadasd', NULL, NULL, '112348791156,961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-11 06:19:15', 'wzl1', '2019-03-18 13:54:28', 527);
INSERT INTO `mc_schema` VALUES (36, 7, NULL, 'alisa1', 'sadasd', NULL, NULL, '112348791156,961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-11 06:19:28', 'wzl1', '2019-03-18 13:54:34', 527);
INSERT INTO `mc_schema` VALUES (37, 17, '测试服务1066', 'dsfdsf', 'sdsd', 'dsfdsf', 'fhfgh', '123456789123456,961916519849', NULL, 1, 1, 0, 'wzl1', '2019-03-11 21:17:52', 'wzl1', '2019-03-22 17:15:48', 527);
INSERT INTO `mc_schema` VALUES (39, 8, NULL, 'ceshisss', 'XXX', NULL, NULL, '961916519849', NULL, 1, 0, 0, 'wzl1', '2019-03-12 04:20:02', 'wzl1', '2019-03-12 18:17:29', 527);
INSERT INTO `mc_schema` VALUES (40, 19, 'ORCL', 'oyr', '测试oracle数据', 'oyr', 'a123456', '123456789123456', NULL, 1, 0, 0, 'wzl1', NULL, 'wzl1', '2019-03-13 17:20:54', 527);
INSERT INTO `mc_schema` VALUES (41, 8, NULL, 'zhj_idx', NULL, NULL, NULL, '112348791156,123456789123456', NULL, 1, 0, 0, 'wzl1', '2019-03-12 23:31:32', 'wzl1', '2019-03-13 12:32:18', 527);
INSERT INTO `mc_schema` VALUES (45, 2, NULL, 'HASE1', 'HASE中文名', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-13 22:26:07', 'new88', '2019-03-13 22:26:07', 528);
INSERT INTO `mc_schema` VALUES (49, 2, NULL, 'HBASE22', 'BASE22中文', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-14 01:53:21', 'new88', '2019-03-14 01:53:21', 528);
INSERT INTO `mc_schema` VALUES (59, 3, NULL, 'HIVE1', 'HIVE1', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-14 03:36:52', 'new88', '2019-03-14 03:36:52', 528);
INSERT INTO `mc_schema` VALUES (60, 3, NULL, 'HIVE2', 'HIVE2', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-14 03:37:18', 'new88', '2019-03-14 03:37:18', 528);
INSERT INTO `mc_schema` VALUES (63, 14, NULL, '资源', '等等', 'alisa11', '122qweQWE/', '112348791156', NULL, 2, 0, 0, 'wzl1', '2019-03-14 05:39:07', 'wzl1', '2019-03-14 05:39:07', 527);
INSERT INTO `mc_schema` VALUES (64, 14, NULL, '双方都是', '地方官梵蒂冈', 'admin', '122qweQWE/', '112348791156', NULL, 2, 0, 0, 'wzl1', '2019-03-14 05:39:38', 'wzl1', '2019-03-14 05:39:38', 527);
INSERT INTO `mc_schema` VALUES (65, 18, NULL, 'etl53', 'xcxc', 'cvcxv', 'cvcxv', '1321664', NULL, 2, 1, 1, 'new88', '2019-03-14 05:43:57', 'new88', '2019-03-15 16:00:19', 528);
INSERT INTO `mc_schema` VALUES (66, 18, NULL, '1', '1', '1', '1', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-14 21:58:18', 'new88', '2019-03-15 14:57:34', 528);
INSERT INTO `mc_schema` VALUES (67, 5, NULL, '/data/etl61', 'dsfdsd', NULL, NULL, '123456789123456,961916519849', NULL, 1, 1, 0, 'wzl1', '2019-03-15 15:05:25', 'wzl1', '2019-03-16 14:23:53', 527);
INSERT INTO `mc_schema` VALUES (68, 5, NULL, '/data/资源', 'dsf', NULL, NULL, '123456789123456', NULL, 1, 0, 0, 'wzl1', '2019-03-15 15:06:25', 'wzl1', '2019-03-15 15:06:25', 527);
INSERT INTO `mc_schema` VALUES (69, 32, 's', 's中亠', 's', 'adbas', 'asss;j;', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-15 16:24:01', 'new88', '2019-03-15 16:24:01', 528);
INSERT INTO `mc_schema` VALUES (70, 32, '4151', 's', '4654', 'rp', 'sww', '1321664', NULL, 2, 1, 0, 'new88', '2019-03-15 16:25:53', 'new88', '2019-03-15 16:41:05', 528);
INSERT INTO `mc_schema` VALUES (71, 28, NULL, 'foodmart', 'foodmart', 'root', 'qsde523@@#', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-15 16:57:59', 'new88', '2019-03-15 16:57:59', 528);
INSERT INTO `mc_schema` VALUES (72, 18, NULL, 'wzltest', '测试', 'wzl', 'wzl~PQ120237', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-15 16:58:28', 'new88', '2019-03-15 16:58:28', 528);
INSERT INTO `mc_schema` VALUES (73, 28, NULL, 'test888', 'test888', 'test888', 'test888@S1', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-15 16:59:47', 'new88', '2019-03-15 16:59:47', 528);
INSERT INTO `mc_schema` VALUES (74, 18, NULL, 'test01', '测试01', 'wzl01', 'wzl~PQ120237', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-15 19:00:47', 'new88', '2019-03-15 19:00:47', 528);
INSERT INTO `mc_schema` VALUES (75, 28, NULL, 'lb_testdb', '李斌中文', 'lb', 'Aa@123456', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-15 19:07:11', 'new88', '2019-03-15 19:07:11', 528);
INSERT INTO `mc_schema` VALUES (76, 18, NULL, 'test_graph', '测试地图dubbo服务', 'wzl222', 'wzl~PQ1202375', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-15 19:09:53', 'new88', '2019-03-15 19:09:53', 528);
INSERT INTO `mc_schema` VALUES (77, 18, NULL, 'test999', '999', '9999', 'wzl~PQ12023759', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-15 19:10:38', 'new88', '2019-03-15 19:10:38', 528);
INSERT INTO `mc_schema` VALUES (78, 18, NULL, 'test', '测试', 'wzl', 'wzl~PQ120237', '1321664,123456789123456,112348791156', NULL, 1, 0, 1, 'new88', '2019-03-15 19:16:20', 'new88', '2019-03-20 15:38:08', 528);
INSERT INTO `mc_schema` VALUES (79, 17, 'sss', 'ssssss', 'ssssss', 'alisa1', '122qweQWE/', '961916519849,112348791156', 'ddd', 2, 0, 0, 'wzl1', '2019-03-18 13:53:56', 'wzl1', '2019-03-18 14:39:55', 527);
INSERT INTO `mc_schema` VALUES (80, 1, NULL, '/new88/hdfs1111', 'hdfs1111', NULL, NULL, '1321664', NULL, 1, 1, 1, 'new88', '2019-03-18 14:36:53', 'new88', '2019-03-20 15:38:20', 528);
INSERT INTO `mc_schema` VALUES (81, 1, NULL, '/new88/ss4653213', 'ss4653213', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-18 14:38:39', 'new88', '2019-03-18 14:38:39', 528);
INSERT INTO `mc_schema` VALUES (82, 1, NULL, '/new88/hdfs1111a', 'hdfs1111a', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-18 14:39:01', 'new88', '2019-03-18 14:39:01', 528);
INSERT INTO `mc_schema` VALUES (83, 19, 'sd', 'qwr', 'ddd', 'admin', '123456', '123456789123456', 'dddd', 2, 0, 1, 'wzl1', '2019-03-18 15:15:02', 'wzl1', '2019-03-18 15:15:02', 527);
INSERT INTO `mc_schema` VALUES (85, 24, NULL, '/xh/xionghan_test1', 'xionghan1', NULL, NULL, '001', NULL, 1, 0, 1, 'xionghan1', '2019-03-18 17:12:01', 'xionghan1', '2019-03-18 17:12:01', 443);
INSERT INTO `mc_schema` VALUES (86, 24, NULL, '/xh/xionghan_test2', 'xionghan2', NULL, NULL, '001', NULL, 1, 0, 1, 'xionghan1', '2019-03-18 17:12:27', 'xionghan1', '2019-03-18 17:12:27', 443);
INSERT INTO `mc_schema` VALUES (87, 24, NULL, '/xh/xionghan_test3', 'xionghan3', NULL, NULL, '001', NULL, 1, 0, 1, 'xionghan1', '2019-03-18 17:12:42', 'xionghan1', '2019-03-18 17:12:42', 443);
INSERT INTO `mc_schema` VALUES (89, 24, NULL, '/xionghan/test1', 'test1', NULL, NULL, '001', NULL, 1, 0, 0, 'xionghan1', '2019-03-19 09:27:33', 'xionghan1', '2019-03-19 09:44:00', 443);
INSERT INTO `mc_schema` VALUES (90, 24, NULL, '/xionghan/test2', 'test2', NULL, NULL, '001', NULL, 1, 0, 0, 'xionghan1', '2019-03-19 09:27:56', 'xionghan1', '2019-03-19 09:44:03', 443);
INSERT INTO `mc_schema` VALUES (91, 24, NULL, '/xionghan/test3', 'test3', NULL, NULL, '001', NULL, 1, 0, 0, 'xionghan1', '2019-03-19 09:28:06', 'xionghan1', '2019-03-19 09:44:08', 443);
INSERT INTO `mc_schema` VALUES (92, 42, 'TEST1123', 'TEST1123中文', 'TEST1123', 'c##zhoujian', 'Woshizhoujian1', '1321664', '木   森', 2, 0, 1, 'new88', '2019-03-19 10:16:53', 'new88', '2019-03-19 10:36:31', 528);
INSERT INTO `mc_schema` VALUES (93, 42, 'globalcdb', 'globalcdb', 'globalcdb中文', 'c##zhoujian', 'Woshizhoujian1', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-19 10:45:03', 'new88', '2019-03-22 17:00:57', 528);
INSERT INTO `mc_schema` VALUES (94, 2, NULL, 'sss', 'sss', NULL, NULL, '1321664', NULL, 1, 0, 0, 'new88', '2019-03-19 16:40:04', 'new88', '2019-03-19 16:40:04', 528);
INSERT INTO `mc_schema` VALUES (95, 28, NULL, 'test', '88test库', 'wuguozhou', 'wgz8562/', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-19 17:09:58', 'new88', '2019-03-19 17:09:58', 528);
INSERT INTO `mc_schema` VALUES (96, 3, NULL, 'HIVE', 'HIVE中文', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-20 10:11:05', 'new88', '2019-03-20 10:11:05', 528);
INSERT INTO `mc_schema` VALUES (101, 28, NULL, 'linbin1', '测试', 'linbin1', 'wzl~PQ120237', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-20 15:08:55', 'new88', '2019-03-20 15:08:55', 528);
INSERT INTO `mc_schema` VALUES (103, 4, NULL, 'etl61', NULL, NULL, NULL, '1321664', 'ddd', 2, 0, 0, 'new88', '2019-03-20 15:31:34', 'new88', '2019-03-21 16:56:08', 528);
INSERT INTO `mc_schema` VALUES (104, 1, NULL, '/new88/newfolder1', '新目录', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-20 18:14:50', 'new88', '2019-03-20 18:14:50', 528);
INSERT INTO `mc_schema` VALUES (109, 28, NULL, 'test2_88', 'test2_88dd点对点', 'test2_88', 'aA#123456', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-20 18:31:40', 'new88', '2019-03-20 18:31:40', 528);
INSERT INTO `mc_schema` VALUES (110, 18, NULL, 'test_delete', '测试', 'wzl4', 'wzl~PQ120237', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-20 18:36:02', 'new88', '2019-03-20 18:36:02', 528);
INSERT INTO `mc_schema` VALUES (111, 28, NULL, 'test1_88', '88数据库测试1', 'test1_88', 'aA#123456', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-20 18:48:38', 'new88', '2019-03-20 18:48:38', 528);
INSERT INTO `mc_schema` VALUES (112, 1, NULL, '/new88/folder1/datamax', '目录1数据区', NULL, NULL, '1321664', NULL, 1, 1, 0, 'new88', '2019-03-20 18:59:30', 'new88', '2019-03-22 16:25:30', 528);
INSERT INTO `mc_schema` VALUES (114, 1, NULL, '/new88/folder1/data', '目录1', NULL, NULL, '1321664', NULL, 1, 0, 1, 'new88', '2019-03-20 19:00:00', 'new88', '2019-03-20 19:00:00', 528);
INSERT INTO `mc_schema` VALUES (115, 4, NULL, 'ES2', NULL, NULL, NULL, '1321664', 'ES2', 2, 0, 0, 'new88', '2019-03-21 09:46:28', 'new88', '2019-03-21 10:03:39', 528);
INSERT INTO `mc_schema` VALUES (116, 4, NULL, '索引名称', NULL, NULL, NULL, '1321664', '索引名称', 2, 0, 0, 'new88', '2019-03-21 10:01:24', 'new88', '2019-03-21 10:01:24', 528);
INSERT INTO `mc_schema` VALUES (117, 3, NULL, 'hive_inst1', 'hive实例1', NULL, NULL, '1321664', NULL, 1, 1, 0, 'new88', '2019-03-21 11:04:17', 'new88', '2019-03-21 15:06:29', 528);
INSERT INTO `mc_schema` VALUES (118, 3, NULL, 'hive_inst2', 'hive实例2', NULL, NULL, '1321664', NULL, 1, 0, 0, 'new88', '2019-03-21 11:04:37', 'new88', '2019-03-21 15:07:38', 528);
INSERT INTO `mc_schema` VALUES (119, 42, 'TEST1123', 'TEST1123', 'TEST1123中文', 'c##zhoujian', 'Woshizhoujian1', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-21 11:28:04', 'new88', '2019-03-21 11:28:04', 528);
INSERT INTO `mc_schema` VALUES (120, 42, 'wzl_test_oracle伍中立', 'wzl_test_oracle伍中立', 'wzl_test_oracle伍中立', 'wzl', 'wzl~PQ120237', '1321664', '1', 2, 0, 1, 'new88', '2019-03-21 11:30:20', 'new88', '2019-03-21 11:30:20', 528);
INSERT INTO `mc_schema` VALUES (121, 28, NULL, 'libintest001', 'libintest001中文', 'libin001', 'Aa#123456', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-21 11:33:29', 'new88', '2019-03-21 11:33:29', 528);
INSERT INTO `mc_schema` VALUES (122, 4, NULL, 'ES3333', NULL, NULL, NULL, '1321664', NULL, 2, 0, 1, 'new99', '2019-03-21 11:26:10', 'new99', '2019-03-21 11:26:10', 528);
INSERT INTO `mc_schema` VALUES (123, 28, NULL, 'libin_internal', '李斌测试库注册类', 'root', 'qsde523@@#', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-21 11:27:13', 'new88', '2019-03-21 11:27:13', 528);
INSERT INTO `mc_schema` VALUES (124, 4, NULL, 'test_UpperCase', NULL, NULL, NULL, '1321664', '1qaz', 2, 0, 1, 'new88', '2019-03-21 11:28:41', 'new88', '2019-03-21 11:28:41', 528);
INSERT INTO `mc_schema` VALUES (125, 4, NULL, 'UPPERCASE', NULL, NULL, NULL, '1321664', '1qaz', 2, 0, 1, 'new88', '2019-03-21 11:30:33', 'new88', '2019-03-21 11:30:33', 528);
INSERT INTO `mc_schema` VALUES (126, 4, NULL, 'AASD', NULL, NULL, NULL, '1321664', 'A', 2, 0, 1, 'new88', '2019-03-21 11:33:43', 'new88', '2019-03-21 11:33:43', 528);
INSERT INTO `mc_schema` VALUES (127, 42, 'test_create_node', '测试节点创建', 'test_create_node', 'wzl', 'wzl~PQ120237', '1321664', NULL, 2, 0, 0, 'new88', '2019-03-21 11:47:01', 'new88', '2019-03-21 11:47:01', 528);
INSERT INTO `mc_schema` VALUES (128, 28, NULL, 'libin_internal', '李斌测试库注册', 'root', 'qsde523@@#', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-21 11:50:13', 'new88', '2019-03-21 11:50:13', 528);
INSERT INTO `mc_schema` VALUES (129, 28, NULL, 'test_mysql_create_and_drop', '测试创建和删除', 'wzl_test1', 'wzl~PQ120237', '1321664', '1', 1, 0, 1, 'new88', '2019-03-21 12:11:28', 'new88', '2019-03-21 12:11:28', 528);
INSERT INTO `mc_schema` VALUES (137, 28, NULL, 'test999', '测试', 'wzl999', 'wzl~PQ120237', '1321664', NULL, 1, 0, 1, 'new88', '2019-03-21 14:26:50', 'new88', '2019-03-21 14:26:50', 528);
INSERT INTO `mc_schema` VALUES (138, 28, NULL, 'test999', '测试', 'wzl999111', 'wzl~PQ120237', '1321664', '11', 1, 0, 1, 'new88', '2019-03-21 14:27:27', 'new88', '2019-03-21 14:27:27', 528);
INSERT INTO `mc_schema` VALUES (141, 28, NULL, 'test999', '测试', 'wzl012', 'wzl~PQ120237', '1321664', '11', 1, 0, 0, 'new88', '2019-03-21 14:35:43', 'new88', '2019-03-21 15:08:00', 528);
INSERT INTO `mc_schema` VALUES (143, 28, NULL, 'test777555', '测试', 'wzl567', 'wzl~PQ120237', '1321664', 'w', 1, 0, 0, 'new88', '2019-03-21 14:36:22', 'new88', '2019-03-21 18:21:07', 528);
INSERT INTO `mc_schema` VALUES (144, 50, NULL, 'mysql56_new1', 'mysql56_new1中文', 'abcnew1', 'abcnew1S@', '1321664', 'ssss', 1, 0, 0, 'new88', '2019-03-21 14:39:08', 'new88', '2019-03-21 14:39:08', 528);
INSERT INTO `mc_schema` VALUES (145, 50, NULL, 'mysql56_caij112', 'mysql56_caij112中文中', 'root', 'Root_12345678', '1321664', 'sssswwmysql56_caij112', 2, 0, 1, 'new88', '2019-03-21 14:48:13', 'new88', '2019-03-21 14:48:13', 528);
INSERT INTO `mc_schema` VALUES (146, 28, NULL, 'libin_internal', '李斌测试注册库', 'root', 'qsde523@@#', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-21 14:53:05', 'new88', '2019-03-21 14:53:05', 528);
INSERT INTO `mc_schema` VALUES (147, 50, NULL, 'bank1', 'bank1中文', 'root', 'Root_12345678', '1321664', 'sss', 2, 0, 0, 'new88', '2019-03-21 14:53:07', 'new88', '2019-03-21 14:53:07', 528);
INSERT INTO `mc_schema` VALUES (148, 28, NULL, 'libin_internal', '李斌测试库注册', 'root', 'qsde523@@#', '1321664', NULL, 2, 0, 0, 'new88', '2019-03-21 14:53:57', 'new88', '2019-03-21 14:53:57', 528);
INSERT INTO `mc_schema` VALUES (149, 28, NULL, 'test', '测试库', 'root', 'qsde523@@#', '1321664', NULL, 2, 0, 0, 'new88', '2019-03-21 14:54:21', 'new88', '2019-03-22 17:44:08', 528);
INSERT INTO `mc_schema` VALUES (150, 50, NULL, 'bi_repository', 'bi_repository', 'root', 'Root_12345678', '1321664', 'bi_repository', 2, 0, 0, 'new88', '2019-03-21 15:07:46', 'new88', '2019-03-21 15:07:46', 528);
INSERT INTO `mc_schema` VALUES (151, 1, NULL, '/new88/data2', 'data2', NULL, NULL, '1321664', NULL, 1, 0, 0, 'new88', '2019-03-22 11:05:03', 'new88', '2019-03-22 11:05:03', 528);
INSERT INTO `mc_schema` VALUES (152, 42, 'new111', 'new1111', 'new1111中文', 'c##zhoujian', 'Woshizhoujian1', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-22 16:40:50', 'new88', '2019-03-22 16:40:50', 528);
INSERT INTO `mc_schema` VALUES (153, 16, 'aa测试服务1066', 'moshimingcheng', 'moshimingchengCn', 'admin', '122qweQWE/', '001', 'ddd', 2, 0, 0, 'xionghan1', '2019-03-22 16:41:49', 'xionghan1', '2019-03-22 16:41:49', 443);
INSERT INTO `mc_schema` VALUES (154, 42, 'NOTHREE123', 'NOTHREE123', 'NOTHREE123', 'c##zhoujian', 'Woshizhoujian1', '1321664', NULL, 2, 0, 1, 'new88', '2019-03-22 16:42:43', 'new88', '2019-03-22 16:57:32', 528);
INSERT INTO `mc_schema` VALUES (155, 42, 'globalcdb', 'c##zhoujian', 'c##zhoujian中文名', 'c##zhoujian', 'Woshizhoujian1', '1321664', NULL, 2, 0, 0, 'new88', '2019-03-22 17:53:41', 'new88', '2019-03-22 17:53:41', 528);
INSERT INTO `mc_schema` VALUES (157, 51, NULL, 'mysq57_new', 'mysq57_new中文', 'mysq57_new', 'mysq57_newS@', '13465456', NULL, 1, 0, 0, 'new88', '2019-03-22 20:28:20', 'new88', '2019-03-22 20:28:20', 528);
INSERT INTO `mc_schema` VALUES (158, 33, NULL, 'foodmart', 'BI测试库foodmart', 'root', 'admin', '1321664,13465456', 'BI测试使用', 2, 0, 0, 'new88', '2019-03-26 10:27:53', 'new88', '2019-03-26 10:27:53', 528);

-- ----------------------------
-- Table structure for mc_server
-- ----------------------------
DROP TABLE IF EXISTS `mc_server`;
CREATE TABLE `mc_server`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `use` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '服务器用途：1前置库 2平台库 3平台库-Hadoop',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器ip地址',
  `hostname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器主机名',
  `org_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置信息',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '逻辑删除字段 0未删除 1已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `renter_id` bigint(20) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ip_renter_id`(`ip`, `renter_id`) USING BTREE,
  FULLTEXT INDEX `ft_name`(`name`) COMMENT '服务器名称和ip全文索引'
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务器实体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_server
-- ----------------------------
INSERT INTO `mc_server` VALUES (1, 'ysbdh03.gdbd.com', 3, '10.0.0.83', 'ysbdh03.gdbd.com', '1321664', 'sss', 'd', NULL, NULL, 0, 'new8', '2019-03-07 20:01:27', 'new88', '2019-03-15 15:57:17', 528);
INSERT INTO `mc_server` VALUES (2, 'ysbdh05.gdbd.com', 3, '10.0.0.85', 'ysbdh05.gdbd.com', '1321664', NULL, NULL, NULL, NULL, 0, 'new8', '2019-03-07 20:01:29', 'new88', '2019-03-15 15:57:17', 528);
INSERT INTO `mc_server` VALUES (3, '10.0.0.84', 1, '10.0.0.84', '10.0.0.84', '1321664', 'ssww', NULL, NULL, NULL, 0, 'new8', '2019-03-07 20:01:29', 'new88', '2019-03-20 15:42:39', 528);
INSERT INTO `mc_server` VALUES (4, 'ysbdh03.gdbd.com', 3, '10.0.0.99', 'ysbdh03.gdbd.com', '123456789123456', '美国白宫', 'SD', '12345678910', 'DSFSDF', 0, 'new7', '2019-03-08 00:00:20', 'wzl1', '2019-03-15 17:28:16', 527);
INSERT INTO `mc_server` VALUES (6, 'ysbdh05.gdbd.com', 3, '10.0.0.85', 'ysbdh05.gdbd.com', '123456789123456', NULL, NULL, NULL, NULL, 0, 'new7', '2019-03-08 00:10:55', 'new7', '2019-03-08 14:56:15', 527);
INSERT INTO `mc_server` VALUES (7, 'ysbdh04.gdbd.com', 3, '10.0.0.84', 'ysbdh04.gdbd.com', '123456789123456', NULL, NULL, NULL, NULL, 0, 'new7', '2019-03-08 00:10:55', 'new7', '2019-03-08 14:56:15', 527);
INSERT INTO `mc_server` VALUES (8, 'oyr-mysql测试服务器', 1, '10.0.0.108', 'itoyr.com', '123456789123456', '公司', '欧阳荣', '1516170956', NULL, 0, 'wzl1', '2019-03-08 01:42:12', 'wzl1', '2019-03-11 11:16:23', 527);
INSERT INTO `mc_server` VALUES (10, 'ysbdh03.gdbd.com', 3, '10.0.0.83', 'ysbdh03.gdbd.com', '520341', NULL, NULL, NULL, NULL, 0, 'pwj1', '2019-03-10 21:22:03', 'pwj1', '2019-03-10 21:22:03', 529);
INSERT INTO `mc_server` VALUES (11, 'ysbdh04.gdbd.com', 3, '10.0.0.84', 'ysbdh04.gdbd.com', '520341', NULL, NULL, NULL, NULL, 0, 'pwj1', '2019-03-10 21:22:03', 'pwj1', '2019-03-10 21:22:03', 529);
INSERT INTO `mc_server` VALUES (12, 'ysbdh05.gdbd.com', 2, '10.0.0.85', 'ysbdh05.gdbd.com', '520341', NULL, NULL, NULL, NULL, 0, 'pwj1', '2019-03-10 21:22:03', 'pwj1', '2019-03-10 21:22:03', 529);
INSERT INTO `mc_server` VALUES (13, '10.0.0.88', 1, '10.0.0.88', '10.0.0.88', '001', '南部大区-深圳机房', NULL, NULL, NULL, 0, 'xionghan1', '2019-03-11 14:04:53', 'xionghan1', '2019-03-18 16:32:26', 443);
INSERT INTO `mc_server` VALUES (15, 'oyr-oracle测试数据', 1, '10.0.0.116', '10.0.0.116', '112348791156', '南部大区-深圳机房', NULL, NULL, NULL, 0, 'wzl1', '2019-03-12 21:56:33', 'wzl1', '2019-03-18 14:27:47', 527);
INSERT INTO `mc_server` VALUES (16, 'ysbdh03.gdbd.com', 3, '10.0.0.83', 'ysbdh03.gdbd.com', '241053', NULL, NULL, NULL, NULL, 0, 'xiufeng', '2019-03-13 02:19:22', 'xiufeng', '2019-03-13 02:19:22', 530);
INSERT INTO `mc_server` VALUES (17, 'ysbdh05.gdbd.com', 3, '10.0.0.85', 'ysbdh05.gdbd.com', '241053', NULL, NULL, NULL, NULL, 0, 'xiufeng', '2019-03-13 02:19:23', 'xiufeng', '2019-03-13 02:19:23', 530);
INSERT INTO `mc_server` VALUES (18, 'ysbdh04.gdbd.com', 3, '10.0.0.84', 'ysbdh04.gdbd.com', '241053', NULL, NULL, NULL, NULL, 0, 'xiufeng', '2019-03-13 02:19:23', 'xiufeng', '2019-03-13 02:19:23', 530);
INSERT INTO `mc_server` VALUES (19, 'ysbdh03.gdbd.com', 3, '10.0.0.83', 'ysbdh03.gdbd.com', '412035', NULL, NULL, NULL, NULL, 0, 'xionghan', '2019-03-13 02:24:08', 'xionghan', '2019-03-13 02:24:08', 443);
INSERT INTO `mc_server` VALUES (20, 'ysbdh04.gdbd.com', 3, '10.0.0.84', 'ysbdh04.gdbd.com', '412035', NULL, NULL, NULL, NULL, 0, 'xionghan', '2019-03-13 02:24:08', 'xionghan', '2019-03-13 02:24:08', 443);
INSERT INTO `mc_server` VALUES (21, 'ysbdh05.gdbd.com', 2, '10.0.0.85', 'ysbdh05.gdbd.com', '412035', NULL, NULL, NULL, NULL, 0, 'xionghan', '2019-03-13 02:24:09', 'xionghan', '2019-03-13 02:24:09', 443);
INSERT INTO `mc_server` VALUES (23, '资源', 1, '9.9.9.9', '10.0.0.85', '112348791156', '美国白宫', '特朗普', '12345678910', 'kkk', 1, 'wzl1', '2019-03-13 22:11:08', 'wzl1', '2019-03-18 15:18:56', 527);
INSERT INTO `mc_server` VALUES (25, 'alisa1', 1, '10.0.0.81', 'qqq', '112348791156', '美国白宫', NULL, NULL, NULL, 1, 'wzl1', '2019-03-13 22:11:55', 'wzl1', '2019-03-18 14:28:55', 527);
INSERT INTO `mc_server` VALUES (26, '10.0.0.88', 1, '10.0.0.88', '10.0.0.88', '1321664', '森', NULL, NULL, NULL, 0, 'new88', '2019-03-14 21:08:45', 'new88', '2019-03-14 21:08:45', 528);
INSERT INTO `mc_server` VALUES (27, '10.0.0.56(uat)', 2, '10.0.0.56', '10.0.0.56UAT', '1321664', 'stttess', 'ss', '136', 'ss', 1, 'new88', '2019-03-15 10:31:46', 'new88', '2019-03-18 14:16:29', 528);
INSERT INTO `mc_server` VALUES (28, '10.0.0.108(zhoujian)', 1, '10.0.0.108', '10.0.0.108(zhoujian)', '1321664', 'ssss', NULL, NULL, NULL, 1, 'new88', '2019-03-14 21:36:29', 'new88', '2019-03-18 14:16:06', 528);
INSERT INTO `mc_server` VALUES (29, 'ysbdh03.gdbd.com', 3, '10.0.0.83', 'ysbdh03.gdbd.com', '310245', NULL, NULL, NULL, NULL, 0, 'wzldemo1', '2019-03-15 14:08:46', 'wzldemo1', '2019-03-15 14:08:46', 532);
INSERT INTO `mc_server` VALUES (30, 'ysbdh04.gdbd.com', 3, '10.0.0.84', 'ysbdh04.gdbd.com', '310245', NULL, NULL, NULL, NULL, 0, 'wzldemo1', '2019-03-15 14:08:46', 'wzldemo1', '2019-03-15 14:08:46', 532);
INSERT INTO `mc_server` VALUES (31, 'ysbdh05.gdbd.com', 2, '10.0.0.85', 'ysbdh05.gdbd.com', '310245', NULL, NULL, NULL, NULL, 0, 'wzldemo1', '2019-03-15 14:08:46', 'wzldemo1', '2019-03-15 14:08:46', 532);
INSERT INTO `mc_server` VALUES (32, 'alisa1', 2, '9.9.9.0', '10.0.0.21', '123456789123456', '美国白宫', '特朗普', '12345678910', 'ssss', 1, 'wzl1', '2019-03-15 14:44:39', 'wzl1', '2019-03-18 15:15:38', 527);
INSERT INTO `mc_server` VALUES (35, '10.0.0.108(wzl)', 1, '10.0.0.108', 'host.com', '1321664', '1', '森', '131', 'sssss', 0, 'new88', '2019-03-18 15:10:44', 'new88', '2019-03-19 10:15:43', 528);
INSERT INTO `mc_server` VALUES (36, 'etl61', 3, '19.9.9.9', '10.0.0.85w', '112348791156', '美国白宫', '特朗普', '12345678910', 'ddd', 1, 'wzl1', '2019-03-18 15:20:05', 'wzl1', '2019-03-18 15:20:10', 527);
INSERT INTO `mc_server` VALUES (37, 'etl61', 2, '10.0.0.12', 'qqq', '112348791156', 'eer', 'asdsad', '12345678910', 'dffdgfdg', 1, 'wzl1', '2019-03-18 15:22:00', 'wzl1', '2019-03-18 15:24:55', 527);
INSERT INTO `mc_server` VALUES (38, 'alisa1', 3, '10.0.0.91', '23fg', '123456789123456', '美国白宫', 'ss', '136545854967', 'ddfdfdf', 1, 'wzl1', '2019-03-18 15:22:34', 'wzl1', '2019-03-18 15:22:50', 527);
INSERT INTO `mc_server` VALUES (39, 'etl61', 3, '9.9.9.91', 'qqq', '123456789123456', '美国白宫', '特朗普', '12345678910', '11111', 1, 'wzl1', '2019-03-18 15:26:24', 'wzl1', '2019-03-18 15:29:29', 527);
INSERT INTO `mc_server` VALUES (40, 'etl611', 1, '9.9.9.92', 'qqq1', '112348791156', '美国白宫', 'asdsad', '12345678910', '2222', 1, 'wzl1', '2019-03-18 15:26:50', 'wzl1', '2019-03-18 15:27:45', 527);
INSERT INTO `mc_server` VALUES (41, 'alisa1', 3, '9.9.9.9', '10.0.0.85', '123456789123456', '美国白宫', '特朗普', '12345678910', 'ddddd', 0, 'wzl1', '2019-03-18 16:08:43', 'wzl1', '2019-03-18 17:13:26', 527);
INSERT INTO `mc_server` VALUES (42, 'etl61', 1, '10.0.0.91', '10.0.0.81', '112348791156', '美国白宫', '特朗普', '12345678910', 'fdfdf', 0, 'wzl1', '2019-03-18 16:11:07', 'wzl1', '2019-03-18 17:16:15', 527);
INSERT INTO `mc_server` VALUES (43, 'etl61', 1, '10.0.0.81', '10.0.0.85', '123456789123456', '美国白宫', 'asdsad', '12345678910', 'ddd', 0, 'wzl1', '2019-03-18 16:31:30', 'wzl1', '2019-03-18 16:32:14', 527);
INSERT INTO `mc_server` VALUES (44, 'etl61', 1, '10.0.0.82', '10.0.0.85', '123456789123456', '美国白宫', 'dd', '12345678910', 'gghghgh', 0, 'wzl1', '2019-03-18 17:18:13', 'wzl1', '2019-03-18 17:50:23', 527);
INSERT INTO `mc_server` VALUES (45, 'etl61', 1, '10.0.0.83', '10.0.0.83', '123456789123456', '美国白宫', 'SD', '12345678910', 'wwww', 0, 'wzl1', '2019-03-18 17:52:31', 'wzl1', '2019-03-18 18:09:38', 527);
INSERT INTO `mc_server` VALUES (46, 'MYSQL到MYSQL管理局资源', 3, '10.0.0.35', '10.0.0.21', '123456789123456', '美国白宫', 'SD', '12345678910', 'ddd', 0, 'wzl1', '2019-03-18 18:13:56', 'wzl1', '2019-03-18 18:13:56', 527);
INSERT INTO `mc_server` VALUES (47, '10.0.0.103', 1, '10.0.0.103', '10.0.0.103', '123456789123456', '深圳市南山区', 'oyr', '15216170956', NULL, 0, 'wzl1', '2019-03-19 14:13:23', 'wzl1', '2019-03-19 14:17:50', 527);
INSERT INTO `mc_server` VALUES (48, '10.0.0.57', 1, '10.0.0.57', '10.0.0.57', '1321664', 'S', NULL, NULL, NULL, 1, 'new88', '2019-03-19 15:32:37', 'new88', '2019-03-20 14:18:28', 528);
INSERT INTO `mc_server` VALUES (49, 'ysbdh03.gdbd.com', 3, '10.0.0.83', 'ysbdh03.gdbd.com', '104352', NULL, NULL, NULL, NULL, 0, 'new1', '2019-03-20 15:15:27', 'new1', '2019-03-20 15:15:27', 533);
INSERT INTO `mc_server` VALUES (50, 'ysbdh04.gdbd.com', 3, '10.0.0.84', 'ysbdh04.gdbd.com', '104352', NULL, NULL, NULL, NULL, 0, 'new1', '2019-03-20 15:15:27', 'new1', '2019-03-20 15:15:27', 533);
INSERT INTO `mc_server` VALUES (51, 'ysbdh05.gdbd.com', 2, '10.0.0.85', 'ysbdh05.gdbd.com', '104352', NULL, NULL, NULL, NULL, 0, 'new1', '2019-03-20 15:15:28', 'new1', '2019-03-20 15:15:28', 533);
INSERT INTO `mc_server` VALUES (52, '10.0.0.88', 2, '10.0.0.88', '10.0.0.88', '1231231', 'ssww', NULL, NULL, NULL, 0, 'new11', '2019-03-20 15:22:14', 'new11', '2019-03-20 15:51:07', 533);
INSERT INTO `mc_server` VALUES (53, '10.0.0.56', 1, '10.0.0.56', '10.0.0.56', '1231231', 'dddd', NULL, NULL, NULL, 0, 'new11', '2019-03-20 15:24:28', 'new11', '2019-03-20 15:24:28', 533);
INSERT INTO `mc_server` VALUES (54, '10.0.0.56', 1, '10.0.0.56', '10.0.0.56', '1321664', 'ssds', NULL, NULL, NULL, 0, 'new88', '2019-03-20 15:27:46', 'new88', '2019-03-21 14:30:48', 528);
INSERT INTO `mc_server` VALUES (55, '10.0.0.57', 1, '10.0.0.57', '10.0.0.57', '13465456', 'sss', NULL, NULL, NULL, 0, 'new88', '2019-03-20 15:28:31', 'new88', '2019-03-22 20:26:43', 528);
INSERT INTO `mc_server` VALUES (56, 'test', 1, '192.168.1.128', 'a1.ling.com', '1231231', '1', NULL, NULL, NULL, 0, 'new11', '2019-03-20 15:48:32', 'new11', '2019-03-20 15:48:32', 533);
INSERT INTO `mc_server` VALUES (57, '10.0.0.58', 1, '10.0.0.58', '10.0.0.58', '1321664', 'sss', NULL, NULL, NULL, 0, 'new88', '2019-03-20 15:49:35', 'new88', '2019-03-20 15:49:35', 528);
INSERT INTO `mc_server` VALUES (58, '192.168.1.234', 2, '192.168.1.234', '192.168.1.234', '1231231', 'wwww', NULL, NULL, NULL, 0, 'new11', '2019-03-20 15:50:39', 'new11', '2019-03-20 15:50:39', 533);

-- ----------------------------
-- Table structure for mc_server_database_change
-- ----------------------------
DROP TABLE IF EXISTS `mc_server_database_change`;
CREATE TABLE `mc_server_database_change`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '变更类型 1 服务器 2 数据库 ...',
  `fk_id` bigint(20) NULL DEFAULT NULL COMMENT '逻辑外键 服务器id、数据库id...',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '变更时间',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_change_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_server_database_change
-- ----------------------------
INSERT INTO `mc_server_database_change` VALUES (1, 1, 1, '2019-03-07 20:01:27', 'new8', '注册');
INSERT INTO `mc_server_database_change` VALUES (2, 1, 2, '2019-03-07 20:01:29', 'new8', '注册');
INSERT INTO `mc_server_database_change` VALUES (3, 1, 3, '2019-03-07 20:01:29', 'new8', '注册');
INSERT INTO `mc_server_database_change` VALUES (4, 1, 4, '2019-03-08 00:00:20', 'new7', '注册');
INSERT INTO `mc_server_database_change` VALUES (6, 1, 6, '2019-03-08 00:10:55', 'new7', '注册');
INSERT INTO `mc_server_database_change` VALUES (7, 1, 7, '2019-03-08 00:10:55', 'new7', '注册');
INSERT INTO `mc_server_database_change` VALUES (8, 1, 8, '2019-03-08 01:42:12', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (9, 1, 10, '2019-03-10 21:22:03', 'pwj1', '注册');
INSERT INTO `mc_server_database_change` VALUES (10, 1, 11, '2019-03-10 21:22:03', 'pwj1', '注册');
INSERT INTO `mc_server_database_change` VALUES (11, 1, 12, '2019-03-10 21:22:03', 'pwj1', '注册');
INSERT INTO `mc_server_database_change` VALUES (12, 1, 4, '2019-03-13 16:41:18', 'wzl1', '变更IP（10.0.0.83->10.0.0.99）');
INSERT INTO `mc_server_database_change` VALUES (13, 1, 1, '2019-03-13 16:40:56', 'new88', '变更IP（10.0.0.83->10.0.0.88）');
INSERT INTO `mc_server_database_change` VALUES (14, 1, 15, '2019-03-12 21:56:33', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (15, 1, 1, '2019-03-13 16:41:00', 'new88', '变更IP（10.0.0.88->10.0.0.83）');
INSERT INTO `mc_server_database_change` VALUES (16, 1, 16, '2019-03-13 02:19:22', 'xiufeng', '注册');
INSERT INTO `mc_server_database_change` VALUES (17, 1, 17, '2019-03-13 02:19:23', 'xiufeng', '注册');
INSERT INTO `mc_server_database_change` VALUES (18, 1, 18, '2019-03-13 02:19:23', 'xiufeng', '注册');
INSERT INTO `mc_server_database_change` VALUES (19, 1, 19, '2019-03-13 02:24:08', 'xionghan', '注册');
INSERT INTO `mc_server_database_change` VALUES (20, 1, 20, '2019-03-13 02:24:08', 'xionghan', '注册');
INSERT INTO `mc_server_database_change` VALUES (21, 1, 21, '2019-03-13 02:24:09', 'xionghan', '注册');
INSERT INTO `mc_server_database_change` VALUES (22, 1, 23, '2019-03-13 22:11:08', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (23, 1, 25, '2019-03-13 22:11:55', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (24, 1, 3, '2019-03-14 02:10:44', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (25, 1, 26, '2019-03-14 21:08:45', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (26, 1, 1, '2019-03-14 21:30:09', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (27, 1, 27, '2019-03-15 10:31:46', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (28, 1, 28, '2019-03-14 21:36:29', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (31, 1, 27, '2019-03-15 12:46:23', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (32, 1, 1, '2019-03-15 13:06:57', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (33, 1, 29, '2019-03-15 14:08:46', 'wzldemo1', '注册');
INSERT INTO `mc_server_database_change` VALUES (34, 1, 30, '2019-03-15 14:08:46', 'wzldemo1', '注册');
INSERT INTO `mc_server_database_change` VALUES (35, 1, 31, '2019-03-15 14:08:46', 'wzldemo1', '注册');
INSERT INTO `mc_server_database_change` VALUES (36, 1, 32, '2019-03-15 14:44:39', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (37, 1, 1, '2019-03-15 15:31:08', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (38, 1, 2, '2019-03-15 15:31:15', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (39, 1, 28, '2019-03-18 14:16:06', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (40, 1, 27, '2019-03-18 14:16:29', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (41, 1, 25, '2019-03-18 14:28:55', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (42, 1, 35, '2019-03-18 15:10:44', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (43, 1, 32, '2019-03-18 15:15:38', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (44, 1, 23, '2019-03-18 15:18:56', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (45, 1, 36, '2019-03-18 15:20:05', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (46, 1, 36, '2019-03-18 15:20:10', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (47, 1, 37, '2019-03-18 15:22:00', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (48, 1, 38, '2019-03-18 15:22:34', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (49, 1, 38, '2019-03-18 15:22:50', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (50, 1, 37, '2019-03-18 15:24:55', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (51, 1, 39, '2019-03-18 15:26:24', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (52, 1, 40, '2019-03-18 15:26:50', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (53, 1, 40, '2019-03-18 15:27:45', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (54, 1, 39, '2019-03-18 15:29:29', 'wzl1', '注销');
INSERT INTO `mc_server_database_change` VALUES (55, 1, 41, '2019-03-18 16:08:43', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (56, 1, 42, '2019-03-18 16:11:07', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (57, 1, 43, '2019-03-18 16:31:30', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (58, 1, 44, '2019-03-18 17:18:13', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (59, 1, 45, '2019-03-18 17:52:31', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (60, 1, 46, '2019-03-18 18:13:57', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (61, 1, 47, '2019-03-19 14:13:23', 'wzl1', '注册');
INSERT INTO `mc_server_database_change` VALUES (62, 1, 47, '2019-03-19 14:14:52', 'wzl1', '变更IP（10.0.0.102->10.0.0.103）');
INSERT INTO `mc_server_database_change` VALUES (63, 1, 48, '2019-03-19 15:32:37', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (64, 1, 48, '2019-03-20 14:18:28', 'new88', '注销');
INSERT INTO `mc_server_database_change` VALUES (65, 1, 49, '2019-03-20 15:15:27', 'new1', '注册');
INSERT INTO `mc_server_database_change` VALUES (66, 1, 50, '2019-03-20 15:15:27', 'new1', '注册');
INSERT INTO `mc_server_database_change` VALUES (67, 1, 51, '2019-03-20 15:15:28', 'new1', '注册');
INSERT INTO `mc_server_database_change` VALUES (68, 1, 52, '2019-03-20 15:22:14', 'new11', '注册');
INSERT INTO `mc_server_database_change` VALUES (69, 1, 53, '2019-03-20 15:24:28', 'new11', '注册');
INSERT INTO `mc_server_database_change` VALUES (70, 1, 54, '2019-03-20 15:27:46', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (71, 1, 55, '2019-03-20 15:28:31', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (72, 1, 56, '2019-03-20 15:48:32', 'new11', '注册');
INSERT INTO `mc_server_database_change` VALUES (73, 1, 57, '2019-03-20 15:49:35', 'new88', '注册');
INSERT INTO `mc_server_database_change` VALUES (74, 1, 58, '2019-03-20 15:50:39', 'new11', '注册');

-- ----------------------------
-- Table structure for mc_snapshot_es_field
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_es_field`;
CREATE TABLE `mc_snapshot_es_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_id` bigint(20) NULL DEFAULT NULL COMMENT '索引id 关联mc_metadata中database_type=8的主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本号',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `analyzer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分析器',
  `is_index` bit(1) NULL DEFAULT NULL COMMENT '是否索引 0:否 1:是',
  `is_store` bit(1) NULL DEFAULT NULL COMMENT '是否存储 0:否 1:是',
  `is_all` bit(1) NULL DEFAULT NULL COMMENT '是否包含在_all中 0:否 1:是',
  `is_source` bit(1) NULL DEFAULT NULL COMMENT '是否包含在_source中 0:否 1:是',
  `location` int(10) NULL DEFAULT NULL COMMENT '字段位置（当前字段的一个位置标识，每张表的字段位置都是自增，唯一的）',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ES索引字段快照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_es_field
-- ----------------------------
INSERT INTO `mc_snapshot_es_field` VALUES (1, 6, 1, 'dd', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 15:24:12', 'wzl1', '2019-03-12 15:24:12');
INSERT INTO `mc_snapshot_es_field` VALUES (2, 7, 1, 'ssdf', 'keyword', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 17:39:11', 'wzl1', '2019-03-12 17:39:11');
INSERT INTO `mc_snapshot_es_field` VALUES (3, 8, 1, 'sdf', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 17:50:19', 'wzl1', '2019-03-12 17:50:19');
INSERT INTO `mc_snapshot_es_field` VALUES (4, 9, 1, 'dd', 'date', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 17:52:57', 'wzl1', '2019-03-12 17:52:57');
INSERT INTO `mc_snapshot_es_field` VALUES (5, 10, 1, 'sdf234', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-12 18:02:47', 'wzl1', '2019-03-12 18:02:47');
INSERT INTO `mc_snapshot_es_field` VALUES (6, 6, 2, 'dd', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-13 15:54:04', 'wzl1', '2019-03-13 15:54:04');
INSERT INTO `mc_snapshot_es_field` VALUES (11, 11, 3, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-13 17:40:43', 'wzl1', '2019-03-13 17:40:43');
INSERT INTO `mc_snapshot_es_field` VALUES (12, 11, 3, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-13 17:40:43', 'wzl1', '2019-03-13 17:40:43');
INSERT INTO `mc_snapshot_es_field` VALUES (13, 11, 4, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-13 17:51:06', 'wzl1', '2019-03-13 17:51:06');
INSERT INTO `mc_snapshot_es_field` VALUES (14, 11, 4, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-13 17:51:06', 'wzl1', '2019-03-13 17:51:06');
INSERT INTO `mc_snapshot_es_field` VALUES (15, 11, 5, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-13 17:51:19', 'wzl1', '2019-03-14 13:02:19');
INSERT INTO `mc_snapshot_es_field` VALUES (16, 11, 5, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-13 17:51:19', 'wzl1', '2019-03-14 13:02:23');
INSERT INTO `mc_snapshot_es_field` VALUES (17, 11, 6, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 11:49:17', 'wzl1', '2019-03-14 11:49:17');
INSERT INTO `mc_snapshot_es_field` VALUES (18, 11, 6, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-14 11:49:17', 'wzl1', '2019-03-14 11:49:17');
INSERT INTO `mc_snapshot_es_field` VALUES (19, 11, 7, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 12:00:44', 'wzl1', '2019-03-14 12:00:44');
INSERT INTO `mc_snapshot_es_field` VALUES (20, 11, 7, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-14 12:00:44', 'wzl1', '2019-03-14 12:00:44');
INSERT INTO `mc_snapshot_es_field` VALUES (21, 11, 8, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 12:00:55', 'wzl1', '2019-03-14 13:02:11');
INSERT INTO `mc_snapshot_es_field` VALUES (22, 11, 8, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-14 12:00:55', 'wzl1', '2019-03-14 13:02:16');
INSERT INTO `mc_snapshot_es_field` VALUES (23, 11, 9, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 12:02:42', 'wzl1', '2019-03-14 12:02:42');
INSERT INTO `mc_snapshot_es_field` VALUES (24, 11, 9, 'name', 'text', 'index_ansj', b'0', b'0', b'0', b'0', 2, 'wzl1', '2019-03-14 12:02:42', 'wzl1', '2019-03-14 12:02:42');
INSERT INTO `mc_snapshot_es_field` VALUES (25, 11, 9, 'ddd', 'keyword', NULL, b'1', b'0', b'0', b'0', 3, 'wzl1', '2019-03-14 12:02:42', 'wzl1', '2019-03-14 12:02:42');
INSERT INTO `mc_snapshot_es_field` VALUES (43, 11, 10, 'asdf234', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 13:11:22', 'wzl1', '2019-03-14 13:11:22');
INSERT INTO `mc_snapshot_es_field` VALUES (44, 11, 10, 'name', 'text', 'index_ansj', b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-14 13:11:22', 'wzl1', '2019-03-14 13:11:22');
INSERT INTO `mc_snapshot_es_field` VALUES (47, 12, 1, 'aau', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 13:28:09', 'wzl1', '2019-03-14 13:28:09');
INSERT INTO `mc_snapshot_es_field` VALUES (48, 12, 1, 'bb', 'keyword', NULL, b'0', b'0', b'0', b'0', 2, 'wzl1', '2019-03-14 13:28:09', 'wzl1', '2019-03-14 13:28:09');
INSERT INTO `mc_snapshot_es_field` VALUES (49, 12, 2, 'aau', 'text', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 13:29:43', 'wzl1', '2019-03-14 13:29:43');
INSERT INTO `mc_snapshot_es_field` VALUES (50, 12, 2, 'bb', 'keyword', NULL, b'0', b'0', b'0', b'0', 2, 'wzl1', '2019-03-14 13:29:43', 'wzl1', '2019-03-14 13:29:43');
INSERT INTO `mc_snapshot_es_field` VALUES (51, 13, 1, 'aa', 'keyword', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 14:06:42', 'wzl1', '2019-03-14 14:06:42');
INSERT INTO `mc_snapshot_es_field` VALUES (52, 13, 1, 'bb', 'text', 'index_ansj', b'0', b'0', b'0', b'0', 2, 'wzl1', '2019-03-14 14:06:42', 'wzl1', '2019-03-14 14:06:42');
INSERT INTO `mc_snapshot_es_field` VALUES (53, 13, 1, 'cc', 'keyword', NULL, b'1', b'1', b'1', b'1', 3, 'wzl1', '2019-03-14 14:06:42', 'wzl1', '2019-03-14 14:06:42');
INSERT INTO `mc_snapshot_es_field` VALUES (54, 13, 2, 'aa', 'keyword', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 14:08:27', 'wzl1', '2019-03-14 14:08:27');
INSERT INTO `mc_snapshot_es_field` VALUES (55, 13, 2, 'bb', 'text', 'index_ansj', b'0', b'0', b'0', b'0', 2, 'wzl1', '2019-03-14 14:08:27', 'wzl1', '2019-03-14 14:08:27');
INSERT INTO `mc_snapshot_es_field` VALUES (56, 13, 2, 'ccu', 'keyword', NULL, b'0', b'0', b'0', b'0', 3, 'wzl1', '2019-03-14 14:08:27', 'wzl1', '2019-03-14 14:08:27');
INSERT INTO `mc_snapshot_es_field` VALUES (57, 13, 2, 'dd', 'text', 'standard', b'1', b'0', b'1', b'1', 4, 'wzl1', '2019-03-14 14:08:27', 'wzl1', '2019-03-14 14:08:27');
INSERT INTO `mc_snapshot_es_field` VALUES (58, 6, 3, 'dd', 'float', NULL, b'0', b'0', b'0', b'0', 1, 'wzl1', '2019-03-14 17:10:53', 'wzl1', '2019-03-14 17:10:53');
INSERT INTO `mc_snapshot_es_field` VALUES (59, 6, 3, 'ee', 'keyword', NULL, b'0', b'1', b'1', b'1', 2, 'wzl1', '2019-03-14 17:10:53', 'wzl1', '2019-03-14 17:10:53');
INSERT INTO `mc_snapshot_es_field` VALUES (60, 14, 1, 'aa', 'text', NULL, b'0', b'1', b'0', b'1', 1, 'wzl1', '2019-03-14 18:59:09', 'wzl1', '2019-03-14 18:59:09');
INSERT INTO `mc_snapshot_es_field` VALUES (61, 14, 2, 'aa', 'text', NULL, b'0', b'1', b'0', b'1', 1, 'wzl1', '2019-03-15 14:02:56', 'wzl1', '2019-03-15 14:02:56');
INSERT INTO `mc_snapshot_es_field` VALUES (62, 14, 2, 'bb', 'text', 'index_ansj', b'1', b'0', b'1', b'1', 2, 'wzl1', '2019-03-15 14:02:56', 'wzl1', '2019-03-15 14:02:56');
INSERT INTO `mc_snapshot_es_field` VALUES (65, 14, 3, 'aa', 'text', NULL, b'0', b'1', b'0', b'1', 1, 'wzl1', '2019-03-21 10:09:00', 'wzl1', '2019-03-21 10:09:00');
INSERT INTO `mc_snapshot_es_field` VALUES (66, 14, 3, 'bb', 'text', 'index_ansj', b'1', b'0', b'1', b'1', 2, 'wzl1', '2019-03-21 10:09:00', 'wzl1', '2019-03-21 10:09:00');
INSERT INTO `mc_snapshot_es_field` VALUES (67, 14, 3, 'cc', 'keyword', NULL, b'0', b'0', b'0', b'0', 3, 'wzl1', '2019-03-21 10:09:00', 'wzl1', '2019-03-21 10:09:00');
INSERT INTO `mc_snapshot_es_field` VALUES (71, 20, 1, 's', 'text', 'standard', b'1', b'1', b'1', b'1', 1, 'new88', '2019-03-21 10:16:31', 'new88', '2019-03-21 10:16:31');
INSERT INTO `mc_snapshot_es_field` VALUES (72, 21, 1, 'ww', 'text', 'standard', b'1', b'1', b'1', b'1', 1, 'new88', '2019-03-21 10:17:54', 'new88', '2019-03-21 10:17:54');

-- ----------------------------
-- Table structure for mc_snapshot_md_hive_field
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_md_hive_field`;
CREATE TABLE `mc_snapshot_md_hive_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本变更详情',
  `origin_id` bigint(20) NULL DEFAULT NULL COMMENT '快照表主键',
  `is_external_table` tinyint(1) NULL DEFAULT NULL COMMENT '是否外表',
  `location` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdfs路径',
  `fields_terminated` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每列之间的分隔符',
  `lines_terminated` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每行之间的分隔符',
  `null_defined` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空值处理',
  `store_format` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储格式，TEXTFILE,SEQUENCEFILE,PARQUET,AVRO',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_md_hive_field
-- ----------------------------
INSERT INTO `mc_snapshot_md_hive_field` VALUES (1, 1, '数据变更', 18, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-08 23:28:43', 'wzl1', '2019-03-08 23:28:45');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (2, 1, '数据变更', 19, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-08 23:39:42', 'wzl1', '2019-03-08 23:39:42');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (3, 1, '数据变更', 21, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 00:06:05', 'wzl1', '2019-03-09 00:06:05');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (4, 1, '数据变更', 24, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 01:00:56', 'wzl1', '2019-03-09 01:00:56');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (5, 1, '数据变更', 25, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-09 01:01:51', 'wzl1', '2019-03-09 01:01:51');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (6, 1, '数据变更', 90, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-14 03:39:42', 'new88', '2019-03-14 03:39:42');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (7, 1, '数据变更', 91, 0, NULL, '', '', '', 'TEXTFILE', 'new88', '2019-03-14 03:53:19', 'new88', '2019-03-14 03:53:19');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (8, 1, '数据变更', 177, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'wzl1', '2019-03-20 11:22:16', 'wzl1', '2019-03-20 11:22:16');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (9, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (10, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:11:30');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (11, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:12:59');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (12, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:13:00');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (13, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:13:01');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (14, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:14:02');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (15, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:14:03');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (16, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:14:06');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (17, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:14:42');
INSERT INTO `mc_snapshot_md_hive_field` VALUES (18, 1, '数据变更', 220, 0, NULL, NULL, NULL, NULL, 'TEXTFILE', 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 14:14:43');

-- ----------------------------
-- Table structure for mc_snapshot_metadata
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_metadata`;
CREATE TABLE `mc_snapshot_metadata`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本变更详情',
  `meta_id` bigint(20) NULL DEFAULT NULL COMMENT '元数据id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdf目录 or es索引名称 or db实体表名',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdf子目录 or es描述 or db中文表名',
  `public_status` int(10) NULL DEFAULT NULL COMMENT '公开状态：0:不公开 1:公开',
  `theme_id` bigint(20) NULL DEFAULT NULL COMMENT '主题',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签，多个以，隔开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_gather` tinyint(1) NULL DEFAULT NULL COMMENT '是否直采，0:否 1:是',
  `status` int(10) NULL DEFAULT NULL COMMENT '当前状态：0草稿 1生效 2删除',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `database_type` int(10) NULL DEFAULT NULL COMMENT '数据库类型',
  `resource_type` int(10) NULL DEFAULT NULL COMMENT '不同数据库下分辨不同资源 如：db 1:表 2:视图',
  `schema_id` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 313 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_metadata
-- ----------------------------
INSERT INTO `mc_snapshot_metadata` VALUES (1, 1, '初始化表', 34, 'role', '角色', 0, 1, 'tag1', 'role', 0, 1, 527, 1, 1, 5, 'wzl1', '2019-03-10 22:38:36', 'wzl1', '2019-03-10 22:38:36');
INSERT INTO `mc_snapshot_metadata` VALUES (2, 1, '初始化表', 42, 'cs1', 'cs1', 0, 1, 'cs1', 'cs1', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57');
INSERT INTO `mc_snapshot_metadata` VALUES (3, 1, '初始化表', 44, 'cs1A', 'cs1A', 0, 1, 'cs1A', 'cs1A', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-11 05:55:45', 'wzl1', '2019-03-11 05:55:45');
INSERT INTO `mc_snapshot_metadata` VALUES (4, 1, '初始化表', 47, 'new_metacube_test', '新元数据测试表1', 0, 2, 'mysql表', '无备注', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-12 02:29:53');
INSERT INTO `mc_snapshot_metadata` VALUES (5, 2, '新增字段数3', 44, 'cs1A', 'cs1A', 0, 1, 'cs1A', 'cs1A', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-11 05:55:45', 'wzl1', '2019-03-12 21:40:26');
INSERT INTO `mc_snapshot_metadata` VALUES (6, 1, '初始化表', 65, 'dept', 'dept', 0, 1, 'dept', 'dept', 0, 1, 527, 1, 1, 5, 'wzl1', '2019-03-12 22:57:44', 'wzl1', '2019-03-12 22:57:44');
INSERT INTO `mc_snapshot_metadata` VALUES (7, 1, '新增数据', 73, 'zxvzdffsdf', 'zsdfsdfsdf', 0, 2, 'tag1', 'dfgdfg', NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 03:52:42', 'new88', '2019-03-13 03:52:42');
INSERT INTO `mc_snapshot_metadata` VALUES (8, 2, ',修改目录名称,修改子目录', 73, 'zxvzdffsdfsdf', 'zsdfsdfsdfsssf', 0, 2, 'tag1', 'dfgdfg', NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 03:52:42', 'new88', '2019-03-13 03:52:51');
INSERT INTO `mc_snapshot_metadata` VALUES (9, 3, ',修改子目录,公开登记发生变更', 73, 'zxvzdffsdfsdf', 'zsdfsdfsdfsssf录名————录名录名', 1, 2, 'tag1', 'dfgdfg', NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 03:52:42', 'new88', '2019-03-13 04:18:29');
INSERT INTO `mc_snapshot_metadata` VALUES (10, 4, '', 73, 'zxvzdffsdfsdf', 'zsdfsdfsdfsssf录名————录名录名', 1, 2, 'tag1', 'dfgdfg', NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 03:52:42', 'new88', '2019-03-13 04:18:55');
INSERT INTO `mc_snapshot_metadata` VALUES (11, 2, '新增数据', 72, 'fsdfdsfsdf', 'test', 0, 1, 'sdfsdf,tag2', 'dfdf', NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 03:52:27', 'new88', '2019-03-13 04:21:27');
INSERT INTO `mc_snapshot_metadata` VALUES (12, 1, '新增数据', 80, 'ssss', '哥13213', 0, 2, 'sss', NULL, NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 04:22:15', 'new88', '2019-03-13 04:22:15');
INSERT INTO `mc_snapshot_metadata` VALUES (13, 2, ',公开登记发生变更', 80, 'ssss', '哥13213', 1, 2, 'sss', NULL, NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 04:22:15', 'new88', '2019-03-13 04:26:17');
INSERT INTO `mc_snapshot_metadata` VALUES (14, 2, '新增数据', 81, '众', '划或', 0, 3, '在', NULL, NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 04:29:07', 'new88', '2019-03-13 04:29:18');
INSERT INTO `mc_snapshot_metadata` VALUES (15, 3, '', 80, 'ssss', '哥13213', 1, 2, 'sss', NULL, NULL, 1, 528, 7, NULL, 38, 'new88', '2019-03-13 04:22:15', 'new88', '2019-03-13 04:35:22');
INSERT INTO `mc_snapshot_metadata` VALUES (16, 1, '新增数据', 83, '林', '木木木要', 0, 2, '要', 'ss', NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:07:59', 'new88', '2019-03-14 03:07:59');
INSERT INTO `mc_snapshot_metadata` VALUES (17, 2, ',公开登记发生变更', 83, '林', '木木木要', 1, 2, '要', 'ss', NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:07:59', 'new88', '2019-03-14 03:10:46');
INSERT INTO `mc_snapshot_metadata` VALUES (18, 1, '新增数据', 84, '林1', '大', 0, 1, 'tag1,tag2', NULL, NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:11:29', 'new88', '2019-03-14 03:11:29');
INSERT INTO `mc_snapshot_metadata` VALUES (19, 1, '新增数据', 85, '木人/ssss/ss', '木人', 0, 3, 'www,tag1', NULL, NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:13:17', 'new88', '2019-03-14 03:13:17');
INSERT INTO `mc_snapshot_metadata` VALUES (20, 1, '新增数据', 86, '132123s/ss', 'sss/1s22/32ss', 0, 1, 'tag1', '', NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:14:00', 'new88', '2019-03-14 03:14:00');
INSERT INTO `mc_snapshot_metadata` VALUES (21, 2, '', 84, '林1', '大', 0, 1, 'tag1,tag2', NULL, NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:11:29', 'new88', '2019-03-14 03:15:44');
INSERT INTO `mc_snapshot_metadata` VALUES (22, 3, '', 84, '林1', '大', 0, 1, 'tag1,tag2', NULL, NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:11:29', 'new88', '2019-03-14 03:15:46');
INSERT INTO `mc_snapshot_metadata` VALUES (23, 4, ',修改子目录', 84, '林1', '大工', 0, 1, 'tag1,tag2', NULL, NULL, 1, 528, 7, NULL, 44, 'new88', '2019-03-14 03:11:29', 'new88', '2019-03-14 03:15:50');
INSERT INTO `mc_snapshot_metadata` VALUES (26, 1, '初始化视图', 94, 'view_test2', 'view_test2', 0, 1, 'view_test1', 'view_test1', 0, 1, 527, 1, 2, 5, 'wzl1', '2019-03-15 11:09:24', 'wzl1', '2019-03-15 11:09:24');
INSERT INTO `mc_snapshot_metadata` VALUES (27, 1, '初始化表', 102, 'tes9789797', 'tes9789797中文', 0, 5, 'tag1', NULL, 0, 1, 528, 1, 1, 73, 'new88', '2019-03-15 17:03:21', 'new88', '2019-03-15 17:03:21');
INSERT INTO `mc_snapshot_metadata` VALUES (28, 2, '新增字段数1', 102, 'tes9789797', 'tes9789797中文', 0, 5, 'tag1,新标签1', NULL, 0, 1, 528, 1, 1, 73, 'new88', '2019-03-15 17:03:21', 'new88', '2019-03-15 17:34:08');
INSERT INTO `mc_snapshot_metadata` VALUES (29, 1, '初始化表', 103, 'waijianlll', 'waijianlll', 0, 1, 'waijianlll', NULL, 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-15 18:12:27');
INSERT INTO `mc_snapshot_metadata` VALUES (30, 1, '初始化表', 104, 'sdxcxcxcxcxc', 'sdxcxcxcxcxc', 0, 2, 'tag1', 'sdxcxcxcxcxc', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48');
INSERT INTO `mc_snapshot_metadata` VALUES (31, 1, '初始化表', 106, 'a', 'a中文', 0, 5, 'tag1', 's', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-18 10:37:37', 'new88', '2019-03-18 10:37:37');
INSERT INTO `mc_snapshot_metadata` VALUES (32, 1, '初始化视图', 107, 'a视图', 'a视图中文名', 1, 2, 'tag2', 'ssss', 0, 1, 528, 1, 2, 78, 'new88', '2019-03-18 10:38:17', 'new88', '2019-03-18 10:38:17');
INSERT INTO `mc_snapshot_metadata` VALUES (33, 2, '视图详情修改,', 107, 'a视图', 'a视图中文名', 1, 2, 'tag2', 'ssss', 0, 1, 528, 1, 2, 78, 'new88', '2019-03-18 10:38:17', 'new88', '2019-03-18 10:38:50');
INSERT INTO `mc_snapshot_metadata` VALUES (34, 3, '基本信息修改,视图详情修改,', 107, 'a视图', 'a视图中文名', 0, 2, 'tag2', 'ssss', 0, 1, 528, 1, 2, 78, 'new88', '2019-03-18 10:38:17', 'new88', '2019-03-18 10:38:53');
INSERT INTO `mc_snapshot_metadata` VALUES (35, 1, '初始化表', 108, 'bb', 'bb中文', 0, 5, 'tag2', 'ssss', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-18 10:39:53');
INSERT INTO `mc_snapshot_metadata` VALUES (36, 2, '新增索引数1', 108, 'bb', 'bb中文', 0, 5, 'tag2', 'ssss', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-18 10:40:29');
INSERT INTO `mc_snapshot_metadata` VALUES (37, 4, '基本信息修改,视图详情修改,', 107, 'a视图', 'a视图中文名', 0, 2, 'tag2', 'ssssaaa', 0, 1, 528, 1, 2, 78, 'new88', '2019-03-18 10:38:17', 'new88', '2019-03-18 10:47:58');
INSERT INTO `mc_snapshot_metadata` VALUES (38, 1, '初始化视图', 109, '菲林要', '   恭恭敬敬', 0, 2, 'tag1', '磊', 0, 1, 528, 1, 2, 78, 'new88', '2019-03-18 10:50:50', 'new88', '2019-03-18 10:50:50');
INSERT INTO `mc_snapshot_metadata` VALUES (39, 1, '初始化视图', 110, 'a图名', 'sss', 0, 2, 'tag1', 'ssss', 0, 1, 528, 1, 2, 78, 'new88', '2019-03-18 10:51:08', 'new88', '2019-03-18 10:51:25');
INSERT INTO `mc_snapshot_metadata` VALUES (40, 1, '初始化视图', 111, 'sssssss', 'sssssss', 0, 2, 'ss,tag2', 'ss', 0, 1, 528, 1, 2, 78, 'new88', '2019-03-18 10:52:05', 'new88', '2019-03-18 10:52:22');
INSERT INTO `mc_snapshot_metadata` VALUES (41, 1, '初始化视图', 114, 'test888图名', 'test888图名', 1, 1, 'tag2', 'test888图名', 0, 1, 528, 1, 2, 73, 'new88', '2019-03-18 14:42:02', 'new88', '2019-03-18 14:42:02');
INSERT INTO `mc_snapshot_metadata` VALUES (42, 1, '新增数据', 115, 'new88hdfs1', 'new88hdfs1', 1, 4, 'tag1', 'ssss', NULL, 1, 528, 7, NULL, 80, 'new88', '2019-03-18 15:17:33', 'new88', '2019-03-18 15:17:33');
INSERT INTO `mc_snapshot_metadata` VALUES (43, 1, '新增数据', 117, '/bbb', 'aaa', 0, 6, 'tag2', 'dddd', NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:18:41', 'xionghan1', '2019-03-18 17:18:41');
INSERT INTO `mc_snapshot_metadata` VALUES (44, 2, ',公开登记发生变更', 117, '/bbb', 'aaa', 1, 6, 'tag2', 'dddd', NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:18:41', 'xionghan1', '2019-03-18 17:19:27');
INSERT INTO `mc_snapshot_metadata` VALUES (45, 1, '新增数据', 118, 'ccc', 'b', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:20:21', 'xionghan1', '2019-03-18 17:20:21');
INSERT INTO `mc_snapshot_metadata` VALUES (46, 2, ',修改目录名称,备注发生变更', 118, '/ccc', 'b', 1, 6, 'tag1', 'vvvv', NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:20:21', 'xionghan1', '2019-03-18 17:20:35');
INSERT INTO `mc_snapshot_metadata` VALUES (47, 1, '新增数据', 119, '/bb', 'bb', 0, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:23:44', 'xionghan1', '2019-03-18 17:23:44');
INSERT INTO `mc_snapshot_metadata` VALUES (48, 3, ',修改目录名称,修改子目录', 118, '/cc', 'cc', 1, 6, 'tag1', 'vvvv', NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:20:21', 'xionghan1', '2019-03-18 17:23:54');
INSERT INTO `mc_snapshot_metadata` VALUES (49, 3, ',修改目录名称,修改子目录', 117, '/aa', 'aa', 1, 6, 'tag2', 'dddd', NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:18:41', 'xionghan1', '2019-03-18 17:24:07');
INSERT INTO `mc_snapshot_metadata` VALUES (50, 1, '新增数据', 120, '/a', 'a', 0, 6, 'tag1,tag2', NULL, NULL, 1, 443, 7, NULL, 86, 'xionghan1', '2019-03-18 17:24:26', 'xionghan1', '2019-03-18 17:24:26');
INSERT INTO `mc_snapshot_metadata` VALUES (51, 1, '新增数据', 121, '/b', 'b', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 86, 'xionghan1', '2019-03-18 17:24:45', 'xionghan1', '2019-03-18 17:24:45');
INSERT INTO `mc_snapshot_metadata` VALUES (52, 2, ',公开登记发生变更', 120, '/a', 'a', 1, 6, 'tag1,tag2', NULL, NULL, 1, 443, 7, NULL, 86, 'xionghan1', '2019-03-18 17:24:26', 'xionghan1', '2019-03-18 17:24:50');
INSERT INTO `mc_snapshot_metadata` VALUES (53, 1, '新增数据', 122, 'aa', 'aa', 1, 6, 'tag2', NULL, NULL, 1, 443, 7, NULL, 87, 'xionghan1', '2019-03-18 17:25:11', 'xionghan1', '2019-03-18 17:25:11');
INSERT INTO `mc_snapshot_metadata` VALUES (54, 2, ',修改目录名称,修改子目录', 122, '/aaa', 'aaa', 1, 6, 'tag2', NULL, NULL, 1, 443, 7, NULL, 87, 'xionghan1', '2019-03-18 17:25:11', 'xionghan1', '2019-03-18 17:25:30');
INSERT INTO `mc_snapshot_metadata` VALUES (55, 2, ',公开登记发生变更', 119, '/bb', 'bb', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:23:44', 'xionghan1', '2019-03-18 17:26:09');
INSERT INTO `mc_snapshot_metadata` VALUES (56, 3, ',公开登记发生变更', 119, '/bb', 'bb', 0, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:23:44', 'xionghan1', '2019-03-18 18:02:39');
INSERT INTO `mc_snapshot_metadata` VALUES (57, 4, ',修改目录名称,修改子目录', 119, 'bb', '/bb', 0, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:23:44', 'xionghan1', '2019-03-18 18:03:35');
INSERT INTO `mc_snapshot_metadata` VALUES (58, 5, ',公开登记发生变更', 119, 'bb', '/bb', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 17:23:44', 'xionghan1', '2019-03-18 18:03:41');
INSERT INTO `mc_snapshot_metadata` VALUES (59, 1, '新增数据', 123, '/bb1', '/bb1', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 85, 'xionghan1', '2019-03-18 18:04:37', 'xionghan1', '2019-03-18 18:04:37');
INSERT INTO `mc_snapshot_metadata` VALUES (60, 1, '新增数据', 124, '/t1', '/t1', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 89, 'xionghan1', '2019-03-19 09:29:25', 'xionghan1', '2019-03-19 09:29:25');
INSERT INTO `mc_snapshot_metadata` VALUES (61, 1, '新增数据', 125, '/tt1', '/tt1', 1, 6, 'tag2', '', NULL, 1, 443, 7, NULL, 89, 'xionghan1', '2019-03-19 09:29:55', 'xionghan1', '2019-03-19 09:29:55');
INSERT INTO `mc_snapshot_metadata` VALUES (62, 1, '新增数据', 126, '/t2', '/t2', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 90, 'xionghan1', '2019-03-19 09:31:43', 'xionghan1', '2019-03-19 09:31:43');
INSERT INTO `mc_snapshot_metadata` VALUES (63, 1, '新增数据', 127, '/t3', '/t3', 1, 6, 'tag1', NULL, NULL, 1, 443, 7, NULL, 91, 'xionghan1', '2019-03-19 09:32:03', 'xionghan1', '2019-03-19 09:32:03');
INSERT INTO `mc_snapshot_metadata` VALUES (64, 1, '新增数据', 128, '/tt3', '/tt3', 1, 6, 'tag2', '', NULL, 1, 443, 7, NULL, 91, 'xionghan1', '2019-03-19 09:32:15', 'xionghan1', '2019-03-19 09:32:15');
INSERT INTO `mc_snapshot_metadata` VALUES (65, 1, '新增数据', 129, '/ttt3', '/ttt3', 1, 6, 'tag1,tag2', '', NULL, 1, 443, 7, NULL, 91, 'xionghan1', '2019-03-19 09:32:29', 'xionghan1', '2019-03-19 09:32:29');
INSERT INTO `mc_snapshot_metadata` VALUES (66, 1, '新增数据', 130, '/robin_test_service', 'HDFS存储创建测试', 0, NULL, '', NULL, NULL, 1, 463, 7, NULL, 34, 'robin', '2019-03-19 10:26:00', 'robin', '2019-03-19 10:26:00');
INSERT INTO `mc_snapshot_metadata` VALUES (67, 1, '新增数据', 131, '/asdfa', 'sdfad', 0, 4, 'asdfas,tag1', 'asdfasdf', NULL, 1, 528, 7, NULL, 80, 'new88', '2019-03-19 10:29:40', 'new88', '2019-03-19 10:29:40');
INSERT INTO `mc_snapshot_metadata` VALUES (68, 1, '初始化表', 142, 'user', '用户表', 0, 1, 'cs1', 'cs1', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 14:21:49', 'wzl1', '2019-03-19 14:21:49');
INSERT INTO `mc_snapshot_metadata` VALUES (69, 1, '初始化表', 143, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 14:24:33');
INSERT INTO `mc_snapshot_metadata` VALUES (71, 1, '初始化表', 144, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:15:42');
INSERT INTO `mc_snapshot_metadata` VALUES (73, 1, '初始化表', 145, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:21:39');
INSERT INTO `mc_snapshot_metadata` VALUES (75, 1, '初始化表', 146, 'user_dept', 'user_dept', 0, 1, 'user_dept', 'user_dept', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:33:37');
INSERT INTO `mc_snapshot_metadata` VALUES (77, 1, '初始化表', 147, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:38:33');
INSERT INTO `mc_snapshot_metadata` VALUES (78, 2, '', 147, 'user_role', 'user_role', 0, 1, 'user_role', 'user_role', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:38:48');
INSERT INTO `mc_snapshot_metadata` VALUES (79, 1, '初始化表', 148, 'user', '杂SS_user', 0, 1, 'user', 'user', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13');
INSERT INTO `mc_snapshot_metadata` VALUES (80, 2, '新增索引数1', 148, 'user', '杂SS_user', 0, 1, 'user', 'user', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:53:25');
INSERT INTO `mc_snapshot_metadata` VALUES (81, 1, '初始化表', 149, 'grade', 'grade', 0, 1, 'grade', 'grade', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31');
INSERT INTO `mc_snapshot_metadata` VALUES (82, 1, '新增数据', 150, 'insertdd', 'insertdd', 0, 1, 'tag1', 'insertdd', NULL, 1, 527, 7, NULL, 67, 'wzl1', '2019-03-19 16:01:08', 'wzl1', '2019-03-19 16:01:08');
INSERT INTO `mc_snapshot_metadata` VALUES (83, 2, ',备注发生变更', 150, 'insertdd', 'insertdd', 0, 1, 'tag1', 'bebet', NULL, 1, 527, 7, NULL, 67, 'wzl1', '2019-03-19 16:01:08', 'wzl1', '2019-03-19 16:01:22');
INSERT INTO `mc_snapshot_metadata` VALUES (84, 1, '初始化表', 152, 'suoyin1', 'suoyin1文名', 0, 4, 'tag1', 's', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-19 16:14:12');
INSERT INTO `mc_snapshot_metadata` VALUES (85, 1, '初始化表', 154, 'waijian1', 'waijian1中文名', 0, 4, 'tag1', 's', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-19 16:18:22');
INSERT INTO `mc_snapshot_metadata` VALUES (86, 1, '初始化表', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44');
INSERT INTO `mc_snapshot_metadata` VALUES (87, 2, '', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫sxdfw234', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:54');
INSERT INTO `mc_snapshot_metadata` VALUES (88, 1, '新增数据', 162, 'asdf234234', 'asrestjiji', 0, 6, 'tag1', 'sdfsf234', NULL, 1, 443, 7, NULL, 90, 'xionghan1', '2019-03-19 20:29:02', 'xionghan1', '2019-03-19 20:29:02');
INSERT INTO `mc_snapshot_metadata` VALUES (89, 1, '初始化表', 171, 'xinjian_123124', 'xinjian_123124', 1, 2, 'tag1', 'dd234', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:35:15');
INSERT INTO `mc_snapshot_metadata` VALUES (90, 2, '', 171, 'xinjian_123124', 'xinjian_123124', 1, 2, 'tag1', 'dd234', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:43:51');
INSERT INTO `mc_snapshot_metadata` VALUES (91, 3, '', 171, 'xinjian_123124', 'xinjian_123124', 1, 2, 'tag1', 'dd234', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:44:37');
INSERT INTO `mc_snapshot_metadata` VALUES (92, 1, '初始化表', 172, 'rest_oracle', '中文名阿拉拉了', 1, 2, '调度34', '等等34', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 09:51:03', 'wzl1', '2019-03-20 09:51:03');
INSERT INTO `mc_snapshot_metadata` VALUES (93, 1, '初始化表', 173, 'sjeifjoi_12i34joij', 'asdf234234', 1, 2, 'tag1', 'sdf234', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07');
INSERT INTO `mc_snapshot_metadata` VALUES (94, 1, '初始化表', 174, 'asD1234', 'asD1234', 1, 2, 'tag1', 'asD1234', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39');
INSERT INTO `mc_snapshot_metadata` VALUES (95, 1, '初始化表', 175, 'asD1234_sadfsdf', 'asD1234_sadfsdf', 1, 2, 'tag1', 'asD1234', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:02:03');
INSERT INTO `mc_snapshot_metadata` VALUES (96, 2, '', 175, 'asD1234_sadfsdf', 'asD1234_sadfsdf', 1, 2, 'tag1', '修改备注', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:12:26');
INSERT INTO `mc_snapshot_metadata` VALUES (97, 3, '', 175, 'asD1234_sadfsdf', 'asD1234_sadfsdf', 1, 2, 'tag1', '修改正式', 0, 1, 527, 2, 1, 40, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:17:36');
INSERT INTO `mc_snapshot_metadata` VALUES (98, 1, '新增数据', 191, 'asdfa', '测试目录asdfa', 0, 4, 'tag1', NULL, NULL, 1, 528, 7, NULL, 80, 'new88', '2019-03-20 15:43:07', 'new88', '2019-03-20 15:43:07');
INSERT INTO `mc_snapshot_metadata` VALUES (99, 1, '新增数据', 192, 'test_sjeifjseijf', 'test_sjeifjseijf', 0, 5, 'tag1', 'test_sjeifjseijf', NULL, 1, 528, 7, NULL, 80, 'new88', '2019-03-20 15:46:14', 'new88', '2019-03-20 15:46:14');
INSERT INTO `mc_snapshot_metadata` VALUES (100, 1, '直采', 193, 'xhtest_10', 'x传', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 15:49:01');
INSERT INTO `mc_snapshot_metadata` VALUES (101, 1, '直采', 194, 'xhtest_temp', 'X想', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02');
INSERT INTO `mc_snapshot_metadata` VALUES (102, 1, '直采', 195, 'TableB', '方法', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 15:52:09');
INSERT INTO `mc_snapshot_metadata` VALUES (103, 1, '直采', 196, 'xhtest_10', '信息', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21');
INSERT INTO `mc_snapshot_metadata` VALUES (104, 2, '修改字段数1', 196, 'xhtest_10', '信息', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:49');
INSERT INTO `mc_snapshot_metadata` VALUES (105, 1, '直采', 197, 'xhtest_100', '非', 0, 6, 'tag2', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17');
INSERT INTO `mc_snapshot_metadata` VALUES (106, 1, '直采', 198, 'xhtest_temp', '传', 0, 6, 'tag2', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18');
INSERT INTO `mc_snapshot_metadata` VALUES (107, 1, '直采', 199, 'TableB', 'B吧', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29');
INSERT INTO `mc_snapshot_metadata` VALUES (108, 2, '修改字段数4', 199, 'TableB', 'B吧', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:14:07');
INSERT INTO `mc_snapshot_metadata` VALUES (109, 1, '直采', 200, 'TableB', '找你', 0, 6, 'asas ', 'asdasd', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26');
INSERT INTO `mc_snapshot_metadata` VALUES (110, 2, '', 200, 'TableB', '找你', 0, 6, 'asas ', 'asdasd', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:26:21');
INSERT INTO `mc_snapshot_metadata` VALUES (111, 1, '直采', 201, 'TableB', 'sad', 0, 6, 'das', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:28:41');
INSERT INTO `mc_snapshot_metadata` VALUES (112, 1, '直采', 202, 'TableB', 'asdasd', 0, 6, 'asd', 'asd', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:30:49');
INSERT INTO `mc_snapshot_metadata` VALUES (113, 1, '直采', 203, 'TableB', 'f法国和', 0, 6, '从法国 ', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:31:54');
INSERT INTO `mc_snapshot_metadata` VALUES (114, 1, '直采', 204, 'TableB', '发表', 0, 6, 'tag1', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:35:55');
INSERT INTO `mc_snapshot_metadata` VALUES (115, 1, '直采', 205, 'TableB', '啊实打实', 0, 6, '阿瑟东', '啊是大', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28');
INSERT INTO `mc_snapshot_metadata` VALUES (116, 2, '', 205, 'TableB', '啊实打实', 0, 6, '阿瑟东', '啊是大啊实打实的', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:39:22');
INSERT INTO `mc_snapshot_metadata` VALUES (117, 3, '', 205, 'TableB', '啊实打实', 0, 6, '阿瑟东', '测试保存', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:39:30');
INSERT INTO `mc_snapshot_metadata` VALUES (118, 4, '', 205, 'TableB', '啊实打实', 0, 6, '阿瑟东', '测试保存', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:40:11');
INSERT INTO `mc_snapshot_metadata` VALUES (119, 5, '修改字段数1', 205, 'TableB', '啊实打实', 0, 6, '阿瑟东', '测试保存', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:43:35');
INSERT INTO `mc_snapshot_metadata` VALUES (120, 1, '初始化表', 207, 'user_test1', '用户表', 0, 6, 'cssa', 'cssa', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:44:57');
INSERT INTO `mc_snapshot_metadata` VALUES (121, 2, '修改字段数1', 207, 'user_test1', '用户表', 0, 6, 'cssa', 'cssa', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:45:08');
INSERT INTO `mc_snapshot_metadata` VALUES (122, 3, '修改字段数1', 207, 'user_test1', '用户表', 0, 6, 'cssa', 'cssa', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:45:46');
INSERT INTO `mc_snapshot_metadata` VALUES (123, 4, '修改字段数1', 207, 'user_test1', '用户表', 0, 6, 'cssa', 'cssa', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:46:05');
INSERT INTO `mc_snapshot_metadata` VALUES (124, 5, '修改字段数1', 207, 'user_test1', '用户表', 0, 6, 'cssa', 'cssa', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:46:37');
INSERT INTO `mc_snapshot_metadata` VALUES (125, 3, '新增字段数1', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫sxdfw234', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-20 16:50:53');
INSERT INTO `mc_snapshot_metadata` VALUES (126, 6, '修改字段数1,新增字段数1', 207, 'user_test1', '用户表', 0, 6, 'cssa', 'cssa', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:53:13');
INSERT INTO `mc_snapshot_metadata` VALUES (127, 4, '修改字段数1', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫sxdfw234', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-20 16:54:22');
INSERT INTO `mc_snapshot_metadata` VALUES (128, 5, '修改字段数1', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫sxdfw234', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-20 16:55:32');
INSERT INTO `mc_snapshot_metadata` VALUES (129, 6, '修改字段数1', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫sxdfw234', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-20 16:57:15');
INSERT INTO `mc_snapshot_metadata` VALUES (130, 7, '新增字段数1', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫sxdfw234', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-20 16:58:38');
INSERT INTO `mc_snapshot_metadata` VALUES (131, 8, '删除字段数1', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', '第三方士大夫sxdfw234', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-20 16:58:59');
INSERT INTO `mc_snapshot_metadata` VALUES (132, 1, '直采', 208, 'TableB', '啊是大', 0, 6, '此次', '测测', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:19');
INSERT INTO `mc_snapshot_metadata` VALUES (133, 2, '修改字段数3', 208, 'TableB', '啊是大', 0, 6, '此次', '测测', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:49');
INSERT INTO `mc_snapshot_metadata` VALUES (134, 3, '删除字段数2', 208, 'TableB', '啊是大', 0, 6, '此次', '测测', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 17:00:22');
INSERT INTO `mc_snapshot_metadata` VALUES (135, 1, '初始化表', 209, 'cs1', 'cs1中文', 0, 6, 'cs1', 'cs1', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:03:36');
INSERT INTO `mc_snapshot_metadata` VALUES (136, 2, '修改字段数1,修改主键', 209, 'cs1', 'cs1中文', 0, 6, 'cs1', 'cs1', 0, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:03:49');
INSERT INTO `mc_snapshot_metadata` VALUES (137, 1, '直采', 210, 'single_table', '的', 0, 6, 'sssdfds', NULL, 1, 1, 443, 1, 2, 7, 'xionghan1', '2019-03-20 17:19:06', 'xionghan1', '2019-03-20 17:19:06');
INSERT INTO `mc_snapshot_metadata` VALUES (138, 2, '修改表注释,新增字段数1', 42, 'cs1', '啊是大', 1, 1, 'cs1', 'cs1', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-20 18:43:50');
INSERT INTO `mc_snapshot_metadata` VALUES (139, 1, '初始化表', 212, 'cs_22', '测试数据1', 0, 1, 'cs_22', 'cs_22', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 18:45:22');
INSERT INTO `mc_snapshot_metadata` VALUES (140, 2, '', 212, 'cs_22', '测试数据1', 0, 1, 'cs_22', 'cs_22', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 18:45:33');
INSERT INTO `mc_snapshot_metadata` VALUES (141, 1, '初始化表', 213, 'cs652', '擦拭', 0, 1, 'cs3', 'cs3', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:48:08');
INSERT INTO `mc_snapshot_metadata` VALUES (142, 2, '修改主键', 213, 'cs652', '擦拭', 0, 1, 'cs3', 'cs3', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:53:28');
INSERT INTO `mc_snapshot_metadata` VALUES (143, 3, '', 213, 'cs652', '擦拭', 0, 1, 'cs3', 'cs3', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:53:39');
INSERT INTO `mc_snapshot_metadata` VALUES (144, 4, '', 213, 'cs652', '擦拭', 0, 1, 'cs3', 'cs3', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:53:49');
INSERT INTO `mc_snapshot_metadata` VALUES (145, 1, '初始化表', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:56:36');
INSERT INTO `mc_snapshot_metadata` VALUES (146, 2, '修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:56:53');
INSERT INTO `mc_snapshot_metadata` VALUES (147, 3, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:57:06');
INSERT INTO `mc_snapshot_metadata` VALUES (148, 4, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:58:03');
INSERT INTO `mc_snapshot_metadata` VALUES (149, 1, '新增数据', 215, 'S1', 'S1目录', 0, 4, 'tag1', NULL, NULL, 1, 528, 7, NULL, 112, 'new88', '2019-03-20 19:01:32', 'new88', '2019-03-20 19:01:32');
INSERT INTO `mc_snapshot_metadata` VALUES (150, 5, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:01:41');
INSERT INTO `mc_snapshot_metadata` VALUES (151, 6, '修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:02:38');
INSERT INTO `mc_snapshot_metadata` VALUES (152, 7, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:02:55');
INSERT INTO `mc_snapshot_metadata` VALUES (153, 2, '', 215, 'S1', 'S1目录', 0, 4, 'tag1', NULL, NULL, 1, 528, 7, NULL, 112, 'new88', '2019-03-20 19:01:32', 'new88', '2019-03-20 19:03:16');
INSERT INTO `mc_snapshot_metadata` VALUES (154, 8, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:03:20');
INSERT INTO `mc_snapshot_metadata` VALUES (155, 9, '修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:04:42');
INSERT INTO `mc_snapshot_metadata` VALUES (156, 10, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:05:11');
INSERT INTO `mc_snapshot_metadata` VALUES (157, 11, '修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:08:54');
INSERT INTO `mc_snapshot_metadata` VALUES (158, 12, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:10:22');
INSERT INTO `mc_snapshot_metadata` VALUES (159, 13, '修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:21:38');
INSERT INTO `mc_snapshot_metadata` VALUES (160, 14, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:21:53');
INSERT INTO `mc_snapshot_metadata` VALUES (161, 15, '修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:18');
INSERT INTO `mc_snapshot_metadata` VALUES (162, 16, '修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:27');
INSERT INTO `mc_snapshot_metadata` VALUES (163, 17, '修改字段数1,修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:37');
INSERT INTO `mc_snapshot_metadata` VALUES (164, 18, '', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:45');
INSERT INTO `mc_snapshot_metadata` VALUES (165, 19, '修改字段数1,修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:24:18');
INSERT INTO `mc_snapshot_metadata` VALUES (166, 20, '修改字段数1,修改主键', 214, 'oyrdemo1qewdqwd', '在', 0, 1, 'cs741', 'cs741', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:24:57');
INSERT INTO `mc_snapshot_metadata` VALUES (167, 9, '', 161, 'test_nisneif', 'test_nisneif中文', 0, 5, 'tag1', 'ce', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-21 09:56:41');
INSERT INTO `mc_snapshot_metadata` VALUES (168, 1, '初始化表', 217, 'caogao111', '中文草稿', 0, 4, 'tag1', '更改为执行', 0, 1, 528, 1, 1, 78, 'new88', '2019-03-21 10:01:45', 'new88', '2019-03-21 10:34:40');
INSERT INTO `mc_snapshot_metadata` VALUES (169, 1, '直采', 219, 'test1', '质量数据例库', 0, 6, '质量', NULL, 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 10:35:45');
INSERT INTO `mc_snapshot_metadata` VALUES (170, 1, '初始化表', 225, 'new123', 'new123中文名', 0, 4, 'tag1', 'ddd', 0, 1, 528, 1, 1, 147, 'new88', '2019-03-21 14:54:05', 'new88', '2019-03-21 14:54:05');
INSERT INTO `mc_snapshot_metadata` VALUES (171, 1, '直采', 226, 'table1', 's', 0, 4, 'tag1', 's', 1, 1, 528, 1, 1, 147, 'new88', '2019-03-21 14:54:37', 'new88', '2019-03-21 14:54:37');
INSERT INTO `mc_snapshot_metadata` VALUES (172, 1, '初始化表', 227, 'new222', 'new222中文', 0, 4, 'tag2', 'sss', 0, 1, 528, 1, 1, 147, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50');
INSERT INTO `mc_snapshot_metadata` VALUES (173, 1, '直采', 228, 'ETL_EXEC_RECORD_PART', '直采表', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48');
INSERT INTO `mc_snapshot_metadata` VALUES (174, 1, '直采', 229, 'ETL_FILE_REPOSITORY', '直采表1', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22');
INSERT INTO `mc_snapshot_metadata` VALUES (175, 1, '直采', 230, 'INPUT_TABLE_phoenix', '直采表2', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24');
INSERT INTO `mc_snapshot_metadata` VALUES (176, 1, '直采', 231, 'MUSER', '直采表3', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24');
INSERT INTO `mc_snapshot_metadata` VALUES (177, 1, '直采', 232, 'MUSER_TEST', '直采表4', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-21 15:05:25');
INSERT INTO `mc_snapshot_metadata` VALUES (178, 1, '直采', 233, 'SEQ_TABLE', '直采表5', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 15:05:26');
INSERT INTO `mc_snapshot_metadata` VALUES (179, 1, '直采', 234, 'TableB', '直采表6', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 15:05:26');
INSERT INTO `mc_snapshot_metadata` VALUES (180, 1, '直采', 235, 'TableC', '直采表7', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27');
INSERT INTO `mc_snapshot_metadata` VALUES (181, 1, '直采', 236, 'TableD', '直采表8', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27');
INSERT INTO `mc_snapshot_metadata` VALUES (182, 1, '直采', 237, 'cs1', '直采表9', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27');
INSERT INTO `mc_snapshot_metadata` VALUES (183, 1, '直采', 238, 'etl_rating', '直采表10', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-21 15:05:28');
INSERT INTO `mc_snapshot_metadata` VALUES (184, 1, '直采', 239, 'etl_salary', '直采表直采表1', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_metadata` VALUES (185, 1, '直采', 240, 'etl_salary_copy', '直采表直采表2', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_metadata` VALUES (186, 1, '直采', 241, 'etltest', '直采表直采表3', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_metadata` VALUES (187, 1, '直采', 242, 'etltest1', '直采表直采表4', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_metadata` VALUES (188, 1, '直采', 243, 'etltest2', '直采表直采表5', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_metadata` VALUES (189, 1, '直采', 244, 'etltest3', '直采表直采表6', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_metadata` VALUES (190, 1, '直采', 245, 'etltest_spark', '直采表直采表7', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_metadata` VALUES (191, 1, '直采', 246, 'filename', '直采表直采表8', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_metadata` VALUES (192, 1, '直采', 247, 'filename_copy', '直采表直采表9', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_metadata` VALUES (193, 1, '直采', 248, 'hbase_test', '直采表直采表10', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_metadata` VALUES (194, 1, '直采', 249, 'j_fs_default_fsentry', 'ssw', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_snapshot_metadata` VALUES (195, 1, '直采', 250, 'j_fs_security_fsentry', 's', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_snapshot_metadata` VALUES (196, 1, '直采', 251, 'j_pm_default_binval', 'sw', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (197, 1, '直采', 252, 'j_pm_default_node', 'wrw', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (198, 1, '直采', 253, 'j_pm_default_prop', 'wqw', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (199, 1, '直采', 254, 'j_pm_default_refs', 'werqw', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (200, 1, '直采', 255, 'j_pm_security_binval', 'www', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (201, 1, '直采', 256, 'j_pm_security_node', 'wrww', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (202, 1, '直采', 257, 'j_pm_security_refs', 'rwrw', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 150, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (203, 1, '初始化表', 258, 'asdfsdfsdf', '中文asdf', 0, 5, 'tag1', 'sdfsdfsdf', 0, 1, 528, 1, 1, 147, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54');
INSERT INTO `mc_snapshot_metadata` VALUES (204, 1, '直采', 259, 'log_info', '安定2', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26');
INSERT INTO `mc_snapshot_metadata` VALUES (205, 1, '直采', 260, 'log_run', '安定1', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26');
INSERT INTO `mc_snapshot_metadata` VALUES (206, 1, '直采', 261, 'TableB', 'asd萨顶顶', 0, 6, 'tag1', '打的', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:21:58');
INSERT INTO `mc_snapshot_metadata` VALUES (207, 2, '修改字段数2', 261, 'TableB', 'asd萨顶顶', 0, 6, 'tag1', '打的', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:22:31');
INSERT INTO `mc_snapshot_metadata` VALUES (208, 1, '直采', 262, 'TableB', '是的', 0, 6, 'tag1', 'asd', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:25:54');
INSERT INTO `mc_snapshot_metadata` VALUES (209, 2, '修改字段数2', 262, 'TableB', '是的', 0, 6, 'tag1', 'asd', 1, 1, 443, 1, 1, 7, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:26:28');
INSERT INTO `mc_snapshot_metadata` VALUES (210, 1, '直采', 263, 'filename', '复制表', 1, 4, 'tag1,tag2', NULL, 1, 1, 528, 1, 1, 148, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26');
INSERT INTO `mc_snapshot_metadata` VALUES (212, 2, '修改字段数2,新增字段数13,修改主键', 233, 'SEQ_TABLE', '直采表5', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 17:41:37');
INSERT INTO `mc_snapshot_metadata` VALUES (213, 1, '直采', 265, 'log_step', 'ASASd', 0, 5, 'tag1', 'asdf234', 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_snapshot_metadata` VALUES (214, 1, '直采', 266, 'log_test', 'asdf', 0, 5, 'tag1', 'asdf234', 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_snapshot_metadata` VALUES (215, 1, '直采', 267, 'sched_job', 'asdf234', 0, 5, 'tag1', 'asdf234', 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23');
INSERT INTO `mc_snapshot_metadata` VALUES (216, 2, '修改字段数15', 247, 'filename_copy', '直采表直采表9', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14');
INSERT INTO `mc_snapshot_metadata` VALUES (217, 3, '新增索引数1', 247, 'filename_copy', '直采表直采表9', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:18:43');
INSERT INTO `mc_snapshot_metadata` VALUES (218, 4, '', 247, 'filename_copy', '直采表直采表9', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:36:06');
INSERT INTO `mc_snapshot_metadata` VALUES (219, 1, '初始化表', 269, 'mysql_sjfiejfi', '中文啦啦啦123123', 0, 4, 'tag1', 'sdf', 0, 1, 528, 1, 1, 149, 'new88', '2019-03-21 19:36:58', 'new88', '2019-03-21 19:36:58');
INSERT INTO `mc_snapshot_metadata` VALUES (220, 2, '修改字段数1', 245, 'etltest_spark', '直采表直采表7', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:28:22');
INSERT INTO `mc_snapshot_metadata` VALUES (221, 2, '修改字段数1', 246, 'filename', '直采表直采表8', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:29:52');
INSERT INTO `mc_snapshot_metadata` VALUES (222, 5, '', 247, 'filename_copy', '直采表直采表9', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:32:16');
INSERT INTO `mc_snapshot_metadata` VALUES (223, 6, '', 247, 'filename_copy', '直采表直采表9', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:32:38');
INSERT INTO `mc_snapshot_metadata` VALUES (224, 1, '新增数据', 270, '/data2_folder', 'data2_folder', 0, 4, '新标签1', NULL, NULL, 1, 528, 7, NULL, 151, 'new88', '2019-03-22 11:06:43', 'new88', '2019-03-22 11:06:43');
INSERT INTO `mc_snapshot_metadata` VALUES (225, 1, '直采', 271, 'oracle_table_2', 'yueshu', 0, 1, 'tag1', 'sdf234', 1, 1, 527, 2, 1, 40, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_snapshot_metadata` VALUES (226, 1, '直采', 272, 'newTableTest2', 'newTableTest2', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44');
INSERT INTO `mc_snapshot_metadata` VALUES (227, 1, '直采', 273, 'newTableTest4', 'newTableTest4', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44');
INSERT INTO `mc_snapshot_metadata` VALUES (228, 1, '直采', 274, 'newTableTest5', 'newTableTest5', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_snapshot_metadata` VALUES (229, 1, '直采', 275, 'newTableTest6', 'newTableTest6', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_snapshot_metadata` VALUES (230, 1, '直采', 276, 'person', 'person', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_snapshot_metadata` VALUES (231, 1, '直采', 277, 'product', 'product', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46');
INSERT INTO `mc_snapshot_metadata` VALUES (232, 1, '直采', 278, 'sched_attachment', 'sched_attachment', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (233, 1, '直采', 279, 'sched_jar_job_content', 'sched_jar_job_content', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (234, 1, '直采', 280, 'sched_script_job_content', 'sched_script_job_content', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (235, 1, '直采', 281, 'sched_task', 'sched_task', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (236, 1, '直采', 282, 'sched_trigger', 'sched_trigger', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (237, 1, '直采', 283, 'sd', 'sd', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (238, 1, '直采', 284, 'stduent_neo4j', 'stduent_neo4j', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (239, 1, '直采', 285, 'student_hive', 'student_hive', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47');
INSERT INTO `mc_snapshot_metadata` VALUES (240, 1, '直采', 286, 'student_test', 'student_test', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (241, 1, '直采', 287, 't1', '这个是T1的表注释', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (242, 1, '直采', 288, 'tab1', 'tab1', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (243, 1, '直采', 289, 'test1', 'test1', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (244, 1, '直采', 290, 'test_access', 'test_access', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (245, 1, '直采', 291, 'test_pt', 'test_pt', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (246, 1, '直采', 292, 'test_pt1', 'test_pt1', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (247, 1, '直采', 293, 'testtableout', 'testtableout', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48');
INSERT INTO `mc_snapshot_metadata` VALUES (248, 1, '直采', 295, 'TB_TEST', 'TB_TEST', 0, 5, 'tag1', NULL, 1, 1, 528, 2, 1, 93, 'new88', '2019-03-22 16:49:08', 'new88', '2019-03-22 16:49:08');
INSERT INTO `mc_snapshot_metadata` VALUES (249, 1, '直采', 296, 'TB_TEST_A', 'TB_TEST_A', 0, 5, 'tag1', NULL, 1, 1, 528, 2, 1, 93, 'new88', '2019-03-22 16:49:10', 'new88', '2019-03-22 16:49:10');
INSERT INTO `mc_snapshot_metadata` VALUES (250, 1, '直采', 297, 'TEST_TB', 'TEST_TB', 0, 5, 'tag1', NULL, 1, 1, 528, 2, 1, 93, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 16:49:12');
INSERT INTO `mc_snapshot_metadata` VALUES (251, 1, '直采', 298, 'TTTT', 'TTTT', 0, 5, 'tag1', NULL, 1, 1, 528, 2, 1, 93, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 16:49:13');
INSERT INTO `mc_snapshot_metadata` VALUES (252, 1, '直采', 299, 'ETL_EXEC_RECORD_PART', 'ETL_EXEC_RECORD_PART', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (253, 1, '直采', 300, 'ETL_FILE_REPOSITORY', 'ETL_FILE_REPOSITORY', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (254, 1, '直采', 301, 'INPUT_TABLE_phoenix', 'INPUT_TABLE_phoenix', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (255, 1, '直采', 302, 'MUSER', 'MUSER', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59');
INSERT INTO `mc_snapshot_metadata` VALUES (256, 1, '直采', 303, 'MUSER_TEST', 'MUSER_TEST', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (257, 1, '直采', 304, 'TableB', 'TableB', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (258, 1, '直采', 305, 'TableC', 'TableC', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (259, 1, '直采', 306, 'TableD', 'TableD', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (260, 1, '直采', 307, 'cs1', 'cs1', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (261, 1, '直采', 308, 'etl_rating', 'etl_rating', 0, 5, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00');
INSERT INTO `mc_snapshot_metadata` VALUES (262, 1, '直采', 309, 'etl_salary', '员工工资表', 0, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33');
INSERT INTO `mc_snapshot_metadata` VALUES (263, 1, '初始化表', 310, 'TDDDS', 'DD大幅度', 0, 4, 'tag1,tag2', NULL, 0, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:29:58', 'new88', '2019-03-22 17:29:58');
INSERT INTO `mc_snapshot_metadata` VALUES (264, 1, '直采', 312, 'GRAPH666', 'graph666中文名称', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23');
INSERT INTO `mc_snapshot_metadata` VALUES (265, 1, '直采', 313, 'MYSQL_88_MANAUL_TB_1', 'mysql_88_manaul_tb_1的中文名', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');
INSERT INTO `mc_snapshot_metadata` VALUES (266, 1, '直采', 314, 'NOTHREE123', 'nothree123中文名', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27');
INSERT INTO `mc_snapshot_metadata` VALUES (267, 1, '直采', 316, 'TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_T', 'TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_TABLENAME_T', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29');
INSERT INTO `mc_snapshot_metadata` VALUES (268, 1, '直采', 317, 'TB_TEST', 'TB_TEST', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30');
INSERT INTO `mc_snapshot_metadata` VALUES (269, 1, '直采', 318, 'TB_TEST_A', 'TB_TEST_A', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_snapshot_metadata` VALUES (270, 1, '直采', 319, 'TEST_TB', 'TEST_TB', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_snapshot_metadata` VALUES (271, 1, '直采', 320, 'TTTT', 'TTTT', 0, 4, 'tag1', NULL, 1, 1, 528, 2, 1, 155, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32');
INSERT INTO `mc_snapshot_metadata` VALUES (272, 1, '初始化表', 321, 'steste', 'steste文名', 1, 4, 'tag1', NULL, 0, 1, 528, 1, 1, 144, 'new88', '2019-03-22 20:57:34', 'new88', '2019-03-22 20:57:34');
INSERT INTO `mc_snapshot_metadata` VALUES (273, 1, '初始化表', 332, 'RC_ORACLE_GRAPH666', '数据接收Oracle', 0, 5, 'tag1', NULL, 0, 1, 528, 1, 1, 148, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18');
INSERT INTO `mc_snapshot_metadata` VALUES (274, 1, '新增数据', 333, '/AD', 'ad文件夹', 0, 4, 'tag1', NULL, NULL, 1, 528, 7, NULL, 112, 'new88', '2019-03-23 11:46:10', 'new88', '2019-03-23 11:46:10');
INSERT INTO `mc_snapshot_metadata` VALUES (275, 1, '初始化表', 334, 'oyr_cs1223', 'oyr_cs1223是', 0, 1, 'oyr_cs1223', 'oyr_cs1223', 0, 1, 527, 1, 1, 6, 'wzl1', '2019-03-23 15:03:25', 'wzl1', '2019-03-23 15:03:25');
INSERT INTO `mc_snapshot_metadata` VALUES (276, 2, '修改字段数1', 309, 'etl_salary', '员工工资表', 1, 4, 'tag1', NULL, 1, 1, 528, 1, 1, 149, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-25 14:57:10');
INSERT INTO `mc_snapshot_metadata` VALUES (277, 1, '直采', 337, 'account', 'account', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_metadata` VALUES (278, 1, '直采', 338, 'agg_c_10_sales_fact_1997', 'agg_c_10_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_metadata` VALUES (279, 1, '直采', 339, 'agg_c_14_sales_fact_1997', 'agg_c_14_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_metadata` VALUES (280, 1, '直采', 340, 'agg_c_special_sales_fact_1997', 'agg_c_special_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_metadata` VALUES (281, 1, '直采', 341, 'agg_g_ms_pcat_sales_fact_1997', 'agg_g_ms_pcat_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_metadata` VALUES (282, 1, '直采', 342, 'agg_l_03_sales_fact_1997', 'agg_l_03_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_metadata` VALUES (283, 1, '直采', 343, 'agg_l_04_sales_fact_1997', 'agg_l_04_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_metadata` VALUES (284, 1, '直采', 344, 'agg_l_05_sales_fact_1997', 'agg_l_05_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_metadata` VALUES (285, 1, '直采', 345, 'agg_lc_06_sales_fact_1997', 'agg_lc_06_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_metadata` VALUES (286, 1, '直采', 346, 'agg_lc_100_sales_fact_1997', 'agg_lc_100_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_metadata` VALUES (287, 1, '直采', 347, 'agg_ll_01_sales_fact_1997', 'agg_ll_01_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (288, 1, '直采', 348, 'agg_pl_01_sales_fact_1997', 'agg_pl_01_sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (289, 1, '直采', 349, 'category', 'category', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (290, 1, '直采', 350, 'currency', 'currency', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (291, 1, '直采', 351, 'customer', 'customer', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (292, 1, '直采', 352, 'days', 'days', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (293, 1, '直采', 353, 'department', 'department', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (294, 1, '直采', 354, 'employee_closure', 'employee_closure', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_metadata` VALUES (295, 1, '直采', 355, 'expense_fact', 'expense_fact', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_metadata` VALUES (296, 1, '直采', 356, 'inventory_fact_1997', 'inventory_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_metadata` VALUES (297, 1, '直采', 357, 'inventory_fact_1998', 'inventory_fact_1998', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_metadata` VALUES (298, 1, '直采', 358, 'position', 'position', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_metadata` VALUES (299, 1, '直采', 359, 'product', 'product', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_metadata` VALUES (300, 1, '直采', 360, 'product_class', 'product_class', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_metadata` VALUES (301, 1, '直采', 361, 'region', 'region', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_metadata` VALUES (302, 1, '直采', 362, 'sadf123', '测试一下', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_metadata` VALUES (303, 1, '直采', 363, 'salary', 'salary', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_metadata` VALUES (304, 1, '直采', 364, 'sales_fact_1997', 'sales_fact_1997', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_metadata` VALUES (305, 1, '直采', 365, 'sales_fact_1998', 'sales_fact_1998', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_metadata` VALUES (306, 1, '直采', 366, 'sales_fact_dec_1998', 'sales_fact_dec_1998', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_metadata` VALUES (307, 1, '直采', 367, 'sdfe', '中文12349看', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_metadata` VALUES (308, 1, '直采', 368, 'store', 'store', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_metadata` VALUES (309, 1, '直采', 369, 'store_ragged', 'store_ragged', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_metadata` VALUES (310, 1, '直采', 370, 'time_by_day', 'time_by_day', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_metadata` VALUES (311, 1, '直采', 371, 'warehouse', 'warehouse', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_metadata` VALUES (312, 1, '直采', 372, 'warehouse_class', 'warehouse_class', 1, 4, 'tag1,新标签1,tag2', 'BI food', 1, 1, 528, 1, 1, 158, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');

-- ----------------------------
-- Table structure for mc_snapshot_metadata_es
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_metadata_es`;
CREATE TABLE `mc_snapshot_metadata_es`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本变更详情',
  `meta_id` bigint(20) NULL DEFAULT NULL COMMENT '元数据id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `identification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdf子目录 or es描述 or db中文表名',
  `schema_id` bigint(20) NULL DEFAULT NULL COMMENT '模型id',
  `public_status` int(10) NULL DEFAULT NULL COMMENT '公开状态：0:不公开 1:公开',
  `theme_id` bigint(20) NULL DEFAULT NULL COMMENT '主题',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签，多个以，隔开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(10) NULL DEFAULT NULL COMMENT '当前状态：0草稿 1生效 2删除',
  `is_open` bit(1) NULL DEFAULT NULL COMMENT '是否启停：0停用 1开启',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `max_version` int(10) NULL DEFAULT NULL COMMENT '冗余-最大版本号，递增',
  `max_location` int(10) NULL DEFAULT NULL COMMENT '冗余-最大字段位置值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ES索引快照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_metadata_es
-- ----------------------------
INSERT INTO `mc_snapshot_metadata_es` VALUES (1, 1, '创建索引', 6, 'default_type', 'es中文', 4, 0, 2, 'tag1', '的', 1, b'1', 527, 'wzl1', '2019-03-12 02:09:25', 'wzl1', '2019-03-12 02:09:25', 1, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (2, 1, '创建索引', 7, 'default_type', 'ceshi中文', 39, 0, 2, 'tag1', NULL, 1, b'1', 527, 'wzl1', '2019-03-12 04:24:23', 'wzl1', '2019-03-12 04:24:23', 1, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (3, 1, '创建索引', 8, 'default_type', '厕纸', 39, 0, 2, 'tag1', '的', 1, b'1', 527, 'wzl1', '2019-03-12 04:35:31', 'wzl1', '2019-03-12 04:35:31', 1, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (4, 1, '创建索引', 9, 'default_type', '中文', 39, 0, 2, '的', '的', 1, b'1', 527, 'wzl1', '2019-03-12 04:38:10', 'wzl1', '2019-03-12 04:38:10', 1, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (5, 1, '创建索引', 10, 'default_type', 'windows测试', 39, 0, 2, 'tag2', NULL, 1, b'1', 527, 'wzl1', '2019-03-12 04:47:59', 'wzl1', '2019-03-12 04:47:59', 1, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (6, 2, '变更基本信息', 6, 'default_type', 'es中文', 4, 0, 2, 'tag1', '试一下', 1, b'1', 527, 'wzl1', '2019-03-12 02:09:25', 'wzl1', '2019-03-13 02:39:11', 2, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (9, 3, '变更基本信息新增字段数:1', 11, 'default_type', '测试内容草稿箱', 39, 0, 1, 'tag1', '调度dfdddd', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 04:25:50', 3, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (10, 4, '', 11, 'default_type', '测试内容草稿箱dd234', 39, 0, 1, 'tag1', '调度dfdddd', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 04:36:12', 4, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (11, 5, '变更基本信息', 11, 'default_type', '测试内容草稿箱dd234', 39, 0, 1, 'tag1', '新功能', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 04:36:26', 5, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (12, 6, '变更基本信息', 11, 'default_type', '测试内容草稿箱', 39, 0, 1, 'tag1', '测试一下', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 22:34:19', 6, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (13, 7, '变更基本信息', 11, 'default_type', '测试内容草稿箱', 39, 0, 1, 'tag1', '测试一下sdfsdf', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 22:45:46', 7, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (14, 8, '变更基本信息', 11, 'default_type', '测试内容草稿箱', 39, 0, 1, 'tag1', '测试一下sdfsdfasdfsdf', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 22:45:57', 8, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (15, 9, '变更基本信息新增字段数:1', 11, 'default_type', '测试内容草稿箱', 39, 0, 1, 'tag1', '测试一下 ->up', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 22:47:44', 9, 3);
INSERT INTO `mc_snapshot_metadata_es` VALUES (26, 10, '变更基本信息', 11, 'default_type', '测试内容草稿箱dd234', 39, 1, 2, 'tag1,tag2', '新功能', 1, b'1', 527, 'wzl1', '2019-03-12 20:44:44', 'wzl1', '2019-03-13 23:56:24', 10, 3);
INSERT INTO `mc_snapshot_metadata_es` VALUES (28, 1, '创建索引', 12, 'default_type', '测试中文111-1', 41, 1, 2, 'tag1', 'upup-1-todraf', 1, b'1', 527, 'wzl1', '2019-03-13 22:36:32', 'wzl1', '2019-03-14 00:12:32', 1, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (29, 2, '变更基本信息', 12, 'default_type', '测试中文111-2', 41, 1, 3, 'tag1,tag2', 'upup-1-todraf-2-tocreate', 1, b'1', 527, 'wzl1', '2019-03-13 22:36:32', 'wzl1', '2019-03-14 00:14:34', 2, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (30, 1, '创建索引', 13, 'default_type', '索引测试1', 41, 1, 3, 'tag2', '索引测试1-草稿\n修改内容-保存草稿\n修改-新增字段-保存生效', 1, b'1', 527, 'wzl1', '2019-03-14 00:49:52', 'wzl1', '2019-03-14 00:51:37', 1, 3);
INSERT INTO `mc_snapshot_metadata_es` VALUES (31, 2, '变更基本信息新增字段数:1', 13, 'default_type', '索引测试1', 41, 1, 2, 'tag2', '索引测试1-草稿\n修改内容-保存草稿\n修改-新增字段-保存生效\n修改-字段新增和修改', 1, b'1', 527, 'wzl1', '2019-03-14 00:49:52', 'wzl1', '2019-03-14 00:53:29', 2, 4);
INSERT INTO `mc_snapshot_metadata_es` VALUES (32, 3, '变更基本信息新增字段数:1', 6, 'default_type', 'es中文', 4, 1, 2, 'tag1', '试一下-up', 1, b'1', 527, 'wzl1', '2019-03-12 02:09:25', 'wzl1', '2019-03-14 03:55:54', 3, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (33, 1, '创建索引', 14, 'default_type', '测试建索引-1', 41, 1, 2, 'tag1', '新建1', 1, b'1', 527, 'wzl1', '2019-03-14 05:44:10', 'wzl1', '2019-03-14 05:44:10', 1, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (34, 2, '变更基本信息新增字段数:1', 14, 'default_type', '测试建索引-1-2', 41, 1, 1, 'tag1', '新建1-修改新增字段', 1, b'1', 527, 'wzl1', '2019-03-14 05:44:10', 'wzl1', '2019-03-15 13:47:52', 2, 2);
INSERT INTO `mc_snapshot_metadata_es` VALUES (37, 3, '新增字段数:1', 14, 'default_type', '测试建索引-1-2', 41, 1, 1, 'tag1', '新建1-修改新增字段', 1, b'1', 527, 'wzl1', '2019-03-14 05:44:10', 'wzl1', '2019-03-21 09:53:22', 3, 3);
INSERT INTO `mc_snapshot_metadata_es` VALUES (41, 1, '创建索引', 20, 'default_type', '采械', 103, 1, 4, 'tag1,tag2', '木', 1, b'1', 528, 'new88', '2019-03-21 10:00:54', 'new88', '2019-03-21 10:00:54', 1, 1);
INSERT INTO `mc_snapshot_metadata_es` VALUES (42, 1, '创建索引', 21, 'default_type', 'sssw中文或字母', 116, 1, 4, 'tag1', 'sss', 1, b'1', 528, 'new88', '2019-03-21 10:02:16', 'new88', '2019-03-21 10:02:16', 1, 1);

-- ----------------------------
-- Table structure for mc_snapshot_table_ck_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_ck_oracle`;
CREATE TABLE `mc_snapshot_table_ck_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `versions` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `ch_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查约束名',
  `check_sql` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查语法',
  `is_enabled` tinyint(1) NULL DEFAULT NULL COMMENT 'oracle 概念，是否启用，0:未启动 1:启用',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_table_ck_oracle
-- ----------------------------
INSERT INTO `mc_snapshot_table_ck_oracle` VALUES (1, 1, 10, 'SYS_C0013303', '\"id\" IS NOT NULL', 1, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_snapshot_table_ck_oracle` VALUES (2, 1, 11, 'SYS_C0013304', '\"name\" IS NOT NULL', 1, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_snapshot_table_ck_oracle` VALUES (3, 1, 12, 'SYS_C0013305', '\"cs_1\" IS NOT NULL', 1, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_snapshot_table_ck_oracle` VALUES (4, 1, 13, 'SYS_C0011399', '\"ID\" IS NOT NULL', 1, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');

-- ----------------------------
-- Table structure for mc_snapshot_table_column
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_column`;
CREATE TABLE `mc_snapshot_table_column`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本号',
  `column_id` bigint(20) NULL DEFAULT NULL,
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `column_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `type_length` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型长度',
  `type_precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型精度',
  `is_pk` tinyint(1) NULL DEFAULT NULL COMMENT '是否为主键 0:否,1:是',
  `is_auto_increment` tinyint(1) NULL DEFAULT NULL COMMENT '是否自增，0:否  1:是',
  `is_null` tinyint(1) NULL DEFAULT NULL COMMENT '是否允许为空 0:否 1:是',
  `default_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段描述',
  `location` int(10) NULL DEFAULT NULL COMMENT '字段位置（当前字段的一个位置标识，每张表的字段位置都是自增，唯一的）',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_partition` tinyint(1) NULL DEFAULT NULL COMMENT '是否是分区列(HIVE)',
  `index_partition` int(10) NULL DEFAULT NULL COMMENT '分区定义位置(HIVE)',
  `is_bucket` tinyint(1) NULL DEFAULT NULL COMMENT '是否作为分桶(HIVE)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_table_column
-- ----------------------------
INSERT INTO `mc_snapshot_table_column` VALUES (1, 1, 12, 'FF', 'TINYINT', '12', NULL, 0, 0, 1, NULL, 'FF', 1, 19, 'wzl1', '2019-03-08 23:39:43', 'wzl1', '2019-03-08 23:39:43', 1, 0, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (2, 1, 14, 'dd234', 'BIGINT', '4', NULL, 0, 0, 1, NULL, 'sdfsdf', 1, 21, 'wzl1', '2019-03-09 00:06:05', 'wzl1', '2019-03-09 00:06:05', 1, 0, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (3, 1, 23, 'dfdf', 'FLOAT', '2', '2', 0, 0, 1, NULL, 'dfdf', 1, 24, 'wzl1', '2019-03-09 01:00:56', 'wzl1', '2019-03-09 01:00:56', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (4, 1, 24, 'dd234', 'BOOLEAN', NULL, NULL, 0, 0, 1, NULL, 'xdf', 1, 25, 'wzl1', '2019-03-09 01:01:51', 'wzl1', '2019-03-09 01:01:51', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (5, 1, 25, 'robin_12', 'date', NULL, NULL, 0, 0, 1, NULL, 'KK ', 1, 26, 'wzl1', '2019-03-09 02:08:19', 'wzl1', '2019-03-09 02:08:19', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (6, 1, 26, 'robin13', 'varchar', NULL, NULL, 0, 0, 1, NULL, 'KK', 2, 26, 'wzl1', '2019-03-09 02:08:19', 'wzl1', '2019-03-09 02:08:19', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (7, 1, 40, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 34, 'wzl1', '2019-03-10 22:38:36', 'wzl1', '2019-03-10 22:38:36', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (8, 1, 41, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', '名字', 2, 34, 'wzl1', '2019-03-10 22:38:36', 'wzl1', '2019-03-10 22:38:36', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (9, 1, 56, 'scasd', 'INTEGER', '20', NULL, 1, 1, 0, '', 'asdasd', 1, 42, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (10, 1, 57, 'asdas', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'wwsad', 2, 42, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (11, 1, 59, 'asdasd', 'FLOAT', '5', '2', 0, 0, 0, '', 'wqdasda', 1, 44, 'wzl1', '2019-03-11 05:55:45', 'wzl1', '2019-03-11 05:55:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (12, 1, 62, 'ID', 'INTEGER', '11', NULL, 1, 1, 0, '', '序列', 1, 47, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-12 02:29:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (13, 1, 63, 'NAME', 'VARCHAR', '255', NULL, 0, 0, 0, '', '名称', 2, 47, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-12 02:29:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (14, 1, 64, 'AGE', 'DATETIME', NULL, NULL, 0, 0, 0, '', '年龄', 3, 47, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-12 02:29:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (15, 1, 65, 'REMARK', 'VARCHAR', '255', NULL, 0, 0, 1, '', '备注', 4, 47, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-12 02:29:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (16, 1, 66, 'cloumn_number', 'NUMERIC', '10', '2', 0, 0, 1, '', '列1', 5, 47, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-12 02:29:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (17, 1, 67, 'cloumn_double', 'DOUBLE', '10', '4', 0, 0, 1, '', '列2', 6, 47, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-12 02:29:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (18, 2, 59, 'asdasd', 'FLOAT', '5', '2', 0, 0, 0, '', 'wqdasda', 1, 44, 'wzl1', '2019-03-11 05:55:45', 'wzl1', '2019-03-11 05:55:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (19, 2, 168, 'ds_batch', 'VARCHAR', '255', NULL, 0, 0, 0, '', '数据批次', 2, 44, 'wzl1', '2019-03-12 21:40:26', 'wzl1', '2019-03-12 21:40:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (20, 2, 169, 'ds_sync_time', 'DATETIME', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 44, 'wzl1', '2019-03-12 21:40:26', 'wzl1', '2019-03-12 21:40:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (21, 2, 170, 'ds_sync_flag', 'VARCHAR', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 44, 'wzl1', '2019-03-12 21:40:26', 'wzl1', '2019-03-12 21:40:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (22, 1, 180, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 65, 'wzl1', '2019-03-12 22:57:44', 'wzl1', '2019-03-12 22:57:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (23, 1, 181, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', '部门名', 2, 65, 'wzl1', '2019-03-12 22:57:44', 'wzl1', '2019-03-12 22:57:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (24, 1, 223, 'D', 'integer', NULL, NULL, 0, 0, 1, NULL, 'D', 1, 87, 'new88', '2019-03-14 03:19:05', 'new88', '2019-03-14 03:19:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (25, 1, 224, 'A', 'double', NULL, NULL, 1, 0, 1, NULL, '', 2, 87, 'new88', '2019-03-14 03:19:05', 'new88', '2019-03-14 03:19:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (26, 1, 227, 's', 'date', NULL, NULL, 0, 0, 1, NULL, 's', 1, 89, 'new88', '2019-03-14 03:34:30', 'new88', '2019-03-14 03:34:30', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (27, 1, 228, 'w', 'integer', NULL, NULL, 1, 0, 1, NULL, '', 2, 89, 'new88', '2019-03-14 03:34:30', 'new88', '2019-03-14 03:34:30', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (28, 1, 229, 'S', 'DOUBLE', '3', '2', 0, 0, 1, NULL, 'W', 1, 90, 'new88', '2019-03-14 03:39:42', 'new88', '2019-03-14 03:39:42', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (29, 1, 230, 'S', 'BOOLEAN', NULL, NULL, 0, 0, 1, NULL, 'S', 1, 91, 'new88', '2019-03-14 03:53:19', 'new88', '2019-03-14 03:53:19', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (30, 1, 278, 's', 'varchar', NULL, NULL, 0, 0, 1, NULL, 's', 1, 99, 'new88', '2019-03-15 16:19:02', 'new88', '2019-03-15 16:19:02', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (31, 1, 279, 'sss', 'double', NULL, NULL, 1, 0, 1, NULL, '', 2, 99, 'new88', '2019-03-15 16:19:02', 'new88', '2019-03-15 16:19:02', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (32, 1, 296, 's', 'INTEGER', '11', NULL, 1, 0, 0, '', 's', 1, 102, 'new88', '2019-03-15 17:03:21', 'new88', '2019-03-15 17:03:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (33, 2, 296, 's', 'INTEGER', '11', NULL, 1, 0, 0, '', 's', 1, 102, 'new88', '2019-03-15 17:03:21', 'new88', '2019-03-15 17:03:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (34, 2, 297, 'i', 'DOUBLE', '12', '2', 0, 0, 0, '0', '数字', 2, 102, 'new88', '2019-03-15 17:34:08', 'new88', '2019-03-15 17:34:08', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (35, 1, 298, 'sdf234', 'INTEGER', '5', NULL, 0, 0, 0, '', 'sdf', 1, 103, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-15 18:12:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (36, 1, 299, 'dd234', 'INTEGER', '6', NULL, 0, 0, 0, '', 'id', 1, 104, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (37, 1, 300, 'a', 'VARCHAR', '11', NULL, 0, 0, 0, '', 'a', 1, 106, 'new88', '2019-03-18 10:37:37', 'new88', '2019-03-18 10:37:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (38, 1, 304, 'bb', 'INTEGER', '11', NULL, 0, 0, 0, '', 'bb', 1, 108, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-18 10:39:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (39, 1, 305, 'cc', 'VARCHAR', '122', NULL, 0, 0, 0, '', 'cc', 2, 108, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-18 10:39:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (40, 2, 304, 'bb', 'INTEGER', '11', NULL, 0, 0, 0, '', 'bb', 1, 108, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-18 10:39:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (41, 2, 305, 'cc', 'VARCHAR', '122', NULL, 0, 0, 0, '', 'cc', 2, 108, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-18 10:39:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (42, 1, 338, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 142, 'wzl1', '2019-03-19 14:21:49', 'wzl1', '2019-03-19 14:21:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (43, 1, 339, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', '用户名', 2, 142, 'wzl1', '2019-03-19 14:21:49', 'wzl1', '2019-03-19 14:21:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (44, 1, 340, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 143, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 14:24:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (45, 1, 341, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', '外键', 2, 143, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 14:24:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (48, 1, 342, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'zz', 1, 144, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:15:42', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (49, 1, 343, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'ddsad', 2, 144, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:15:42', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (52, 1, 344, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'u_id', 1, 145, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:21:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (54, 1, 345, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'ddd', 1, 146, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:33:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (56, 1, 346, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'u_id', 1, 147, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:38:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (57, 2, 346, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'u_id', 1, 147, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:38:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (58, 1, 347, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'ttt', 1, 148, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (59, 1, 348, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'asdad', 2, 148, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (60, 1, 349, 'class_name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'vasdiojoasd', 3, 148, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (61, 2, 347, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'ttt', 1, 148, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (62, 2, 348, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'asdad', 2, 148, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (63, 2, 349, 'class_name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'vasdiojoasd', 3, 148, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (64, 1, 350, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'jaiosd', 1, 149, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (65, 1, 351, 'grade', 'INT', '20', NULL, 0, 0, 0, '', 'assdqw', 2, 149, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (66, 1, 352, 'username', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'asdasd', 3, 149, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (67, 1, 353, 'class_name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'asdqwdas', 4, 149, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (68, 1, 354, 'a', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'a', 1, 152, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-19 16:14:12', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (69, 1, 355, 's', 'INTEGER', '11', NULL, 0, 0, 0, '', 's', 2, 152, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-19 16:14:12', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (70, 1, 358, 'a', 'INTEGER', '11', NULL, 0, 0, 0, '', 'a', 1, 154, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-19 16:18:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (71, 1, 359, 'b', 'VARCHAR', '255', NULL, 0, 0, 0, '', 'b', 2, 154, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-19 16:18:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (72, 1, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (73, 2, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (74, 1, 443, 'xcv234', 'NUMERIC', '5', '2', 0, 0, 0, '', '234', 1, 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:35:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (75, 2, 443, 'xcv234', 'NUMERIC', '5', '2', 0, 0, 0, '', '234', 1, 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:35:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (76, 3, 443, 'xcv234', 'NUMERIC', '5', '2', 0, 0, 0, '', '234', 1, 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:35:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (77, 1, 444, 'zsadf', 'NUMERIC', '5', '5', 0, 0, 0, '', 'sdf', 1, 172, 'wzl1', '2019-03-20 09:51:03', 'wzl1', '2019-03-20 09:51:03', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (78, 1, 445, 'aasdf234', 'CHAR', '6', NULL, 0, 0, 0, '', 'sdf', 1, 173, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (79, 1, 446, 'asdf234', 'NUMBER', '5', '5', 0, 0, 0, '', 'sadf234', 1, 174, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (80, 1, 447, 'asdf234', 'NUMBER', '5', '5', 0, 0, 0, '', 'sadf234', 1, 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:02:03', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (81, 2, 447, 'asdf234', 'NUMBER', '5', '5', 0, 0, 0, '', 'sadf234', 1, 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:02:03', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (82, 3, 447, 'asdf234', 'NUMBER', '5', '5', 0, 0, 0, '', 'sadf234', 1, 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:02:03', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (83, 1, 449, 'xcv234', 'BIGINT', '6', NULL, 0, 0, 1, NULL, 'sadf234', 1, 177, 'wzl1', '2019-03-20 11:22:16', 'wzl1', '2019-03-20 11:22:16', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (84, 1, 508, 'id', 'int', '11', NULL, 1, 1, 0, '', '\'主键\'', 1, 193, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 15:49:01', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (85, 1, 509, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名1\'', 2, 193, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 15:49:01', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (86, 1, 510, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名2\'', 3, 193, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 15:49:01', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (87, 1, 511, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名3\'', 4, 193, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 15:49:01', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (88, 1, 512, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名4\'', 5, 193, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 15:49:01', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (89, 1, 513, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 193, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 15:49:01', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (90, 1, 514, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 194, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (91, 1, 515, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 194, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (92, 1, 516, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 194, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (93, 1, 517, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 194, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (94, 1, 518, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 194, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (95, 1, 519, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 194, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (96, 1, 520, 'date_time', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 194, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 15:49:02', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (97, 1, 521, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 1, 195, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 15:52:09', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (98, 1, 522, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 195, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 15:52:09', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (99, 1, 523, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 3, 195, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 15:52:09', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (100, 1, 524, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 4, 195, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 15:52:09', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (101, 1, 525, 'id', 'int', '11', NULL, 1, 1, 0, '', '\'主键\'', 1, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (102, 1, 526, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名1\'', 2, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (103, 1, 527, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名2\'', 3, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (104, 1, 528, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名3\'', 4, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (105, 1, 529, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名4\'', 5, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (106, 1, 530, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (107, 2, 525, 'id', 'int', '11', NULL, 1, 1, 0, '', '\'主键\'', 1, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (108, 2, 526, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名1\'', 2, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (109, 2, 527, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名2\'', 3, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (110, 2, 528, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名3\'', 4, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (111, 2, 529, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名4\'', 5, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (112, 2, 530, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '的 ', 6, 196, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 15:59:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (113, 1, 531, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 197, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (114, 1, 532, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 197, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (115, 1, 533, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 197, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (116, 1, 534, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 197, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (117, 1, 535, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 197, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (118, 1, 536, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 198, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (119, 1, 537, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 198, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (120, 1, 538, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 198, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (121, 1, 539, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 198, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (122, 1, 540, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 198, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (123, 1, 541, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 198, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (124, 1, 542, 'date_time', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 198, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (125, 1, 543, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 1, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (126, 1, 544, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (127, 1, 545, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 3, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (128, 1, 546, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 4, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (129, 2, 543, 'ID', 'bigint', '20', NULL, 0, 0, 1, '', '传', 1, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (130, 2, 544, 'NAME', 'varchar', '255', NULL, 0, 0, 1, '', '人', 2, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (131, 2, 545, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, '', '他', 3, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (132, 2, 546, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, '', '我', 4, 199, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:12:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (133, 1, 547, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (134, 1, 548, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (135, 1, 549, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (136, 1, 550, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (137, 2, 547, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:26:21', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (138, 2, 548, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (139, 2, 549, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (140, 2, 550, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 200, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:25:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (141, 1, 551, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 201, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:28:41', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (142, 1, 552, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 201, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:28:41', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (143, 1, 553, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 201, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:28:41', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (144, 1, 554, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 201, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:28:41', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (145, 1, 555, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 202, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:30:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (146, 1, 556, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 202, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:30:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (147, 1, 557, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 202, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:30:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (148, 1, 558, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 202, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:30:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (149, 1, 559, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 203, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:31:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (150, 1, 560, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 203, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:31:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (151, 1, 561, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 203, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:31:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (152, 1, 562, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 203, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:31:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (153, 1, 563, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 204, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:35:55', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (154, 1, 564, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 204, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:35:55', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (155, 1, 565, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 204, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:35:55', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (156, 1, 566, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 204, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:35:55', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (157, 1, 567, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'传\'', 1, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (158, 1, 568, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'人\'', 2, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (159, 1, 569, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'他\'', 3, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (160, 1, 570, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'我\'', 4, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (161, 2, 567, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'传\'', 1, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (162, 2, 568, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'人\'', 2, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (163, 2, 569, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'他\'', 3, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (164, 2, 570, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'我\'', 4, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (165, 3, 567, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'传\'', 1, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (166, 3, 568, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'人\'', 2, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (167, 3, 569, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'他\'', 3, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (168, 3, 570, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'我\'', 4, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (169, 4, 567, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'传\'', 1, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:40:11', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (170, 4, 568, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'人\'', 2, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (171, 4, 569, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'他\'', 3, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (172, 4, 570, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'我\'', 4, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (173, 5, 567, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'传\'', 1, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:40:11', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (174, 5, 568, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'人\'', 2, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (175, 5, 569, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, '', '伟大时代', 3, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (176, 5, 570, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'我\'', 4, 205, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:38:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (177, 1, 572, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'dasidasd', 1, 207, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:44:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (178, 2, 572, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'www', 1, 207, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:44:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (179, 3, 572, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'zzzzz', 1, 207, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:44:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (180, 4, 572, 'id', 'INTEGER', '50', NULL, 0, 0, 0, '', 'dasidasd', 1, 207, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:44:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (181, 5, 572, 'id', 'BIGINT', '50', NULL, 0, 0, 0, '', 'dasidasd', 1, 207, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:44:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (182, 3, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (183, 3, 573, 'asdf234', 'FLOAT', '6', '2', 0, 0, 0, '', 'asdf234', 2, 161, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-20 16:50:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (184, 6, 572, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'dasidasd', 1, 207, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 16:44:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (185, 6, 574, 'oasdi', 'INT', '10', NULL, 0, 0, 0, '', 'wadas', 2, 207, 'xionghan1', '2019-03-20 16:53:13', 'xionghan1', '2019-03-20 16:53:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (186, 4, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (187, 4, 573, 'asdf234', 'BIGINT', '5', NULL, 0, 0, 0, '', 'asdf234', 2, 161, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-20 16:50:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (188, 5, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (189, 5, 573, 'asdf234', 'NUMERIC', '4', '4', 0, 0, 0, '', 'asdf234', 2, 161, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-20 16:50:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (190, 6, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (191, 6, 573, 'asdf234', 'DECIMAL', '5', '3', 0, 0, 0, '', 'asdf234', 2, 161, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-20 16:57:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (192, 7, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (193, 7, 573, 'asdf234', 'DECIMAL', '5', '3', 0, 0, 0, '', 'asdf234', 2, 161, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-20 16:57:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (194, 7, 575, 'dd234234', 'TINYINT', '4', NULL, 0, 0, 0, '', 'sdfsdf', 3, 161, 'new88', '2019-03-20 16:58:38', 'new88', '2019-03-20 16:58:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (195, 8, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (196, 8, 573, 'asdf234', 'DECIMAL', '5', '3', 0, 0, 0, '', 'asdf234', 2, 161, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-20 16:57:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (197, 1, 576, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'传\'', 1, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:19', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (198, 1, 577, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'人\'', 2, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:19', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (199, 1, 578, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'伟大时代\'', 3, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:19', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (200, 1, 579, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'我\'', 4, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:19', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (201, 2, 576, 'ID', 'bigint', '20', NULL, 0, 0, 1, '', '啊实打实的', 1, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (202, 2, 577, 'NAME', 'varchar', '255', NULL, 0, 0, 1, '', '啊实打实的', 2, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (203, 2, 578, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'伟大时代\'', 3, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:19', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (204, 2, 579, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, '', '阿斯顿娃娃信息新', 4, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (205, 3, 576, 'ID', 'bigint', '20', NULL, 0, 0, 1, '', '啊实打实的', 1, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (206, 3, 577, 'NAME', 'varchar', '255', NULL, 0, 0, 1, '', '啊实打实的', 2, 208, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 16:59:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (207, 1, 580, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', '主键', 1, 209, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:03:36', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (208, 1, 581, 'name', 'BIGINT', '25', NULL, 0, 0, 0, '', 'sadasd', 2, 209, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:03:36', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (209, 2, 580, 'id', 'BIGINT', '50', NULL, 1, 0, 0, '', '主键', 1, 209, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:03:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (210, 2, 581, 'name', 'BIGINT', '25', NULL, 0, 0, 0, '', 'sadasd', 2, 209, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:03:36', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (211, 2, 56, 'scasd', 'INTEGER', '20', NULL, 1, 1, 0, '', 'asdasd', 1, 42, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (212, 2, 57, 'asdas', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'wwsad', 2, 42, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (213, 2, 585, 'cxza', 'INTEGER', '20', NULL, 0, 0, 0, '', 'cxza', 3, 42, 'wzl1', '2019-03-20 18:43:50', 'wzl1', '2019-03-20 18:43:50', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (214, 1, 586, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', '啊是大', 1, 212, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 18:45:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (215, 1, 587, 'name', 'VARCHAR', '20', NULL, 0, 0, 0, '', '啊是大', 2, 212, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 18:45:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (216, 2, 586, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', '啊是大', 1, 212, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 18:45:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (217, 2, 587, 'name', 'VARCHAR', '20', NULL, 0, 0, 0, '', '啊是大', 2, 212, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 18:45:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (218, 1, 588, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'asdasd', 1, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:48:08', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (219, 1, 589, 'asc', 'BIGINT', '25', NULL, 0, 0, 0, '', 'asd', 2, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:48:08', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (220, 2, 588, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'asdasd', 1, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:53:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (221, 2, 589, 'asc', 'BIGINT', '25', NULL, 0, 0, 0, '', 'asd', 2, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:48:08', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (222, 3, 588, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'asdasd', 1, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:53:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (223, 3, 589, 'asc', 'BIGINT', '25', NULL, 0, 0, 0, '', 'asd', 2, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:48:08', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (224, 4, 588, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'asdasd', 1, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:53:49', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (225, 4, 589, 'asc', 'BIGINT', '25', NULL, 0, 0, 0, '', 'asd', 2, 213, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 18:48:08', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (226, 1, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:56:36', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (227, 2, 590, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:56:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (228, 3, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:57:06', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (229, 4, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 18:58:03', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (230, 5, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:01:41', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (231, 6, 590, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:02:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (232, 7, 590, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:02:55', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (233, 8, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:03:20', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (234, 9, 590, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:04:42', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (235, 10, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:05:11', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (236, 11, 590, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:08:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (237, 12, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:10:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (238, 13, 590, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:21:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (239, 14, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:21:53', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (240, 15, 590, 'id', 'INTEGER', '20', NULL, 1, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (241, 16, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (242, 17, 590, 'id', 'INTEGER', '20', NULL, 1, 1, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (243, 18, 590, 'id', 'INTEGER', '20', NULL, 1, 1, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:23:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (244, 19, 590, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:24:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (245, 20, 590, 'id', 'INTEGER', '20', NULL, 1, 1, 0, '', 'iansd', 1, 214, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:24:57', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (246, 9, 390, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 161, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-19 17:43:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (247, 9, 573, 'asdf234', 'DECIMAL', '5', '3', 0, 0, 0, '', 'asdf234', 2, 161, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-20 16:57:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (248, 1, 592, 'asdv234', 'FLOAT', '5', '5', 0, 0, 0, '', 'asdf234', 1, 217, 'new88', '2019-03-21 10:01:45', 'new88', '2019-03-21 10:01:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (249, 1, 593, 'cardID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 219, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 10:35:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (250, 1, 594, 'phone', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 219, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 10:35:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (251, 1, 595, 'date', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 219, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 10:35:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (252, 1, 596, 'character', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 219, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 10:35:45', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (253, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (254, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (255, 1, 599, 's', 'integer', NULL, NULL, 1, 0, 1, NULL, '', 1, 221, 'new88', '2019-03-21 11:52:38', 'new88', '2019-03-21 11:52:38', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (256, 1, 600, 'b', 'varchar', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 221, 'new88', '2019-03-21 11:52:38', 'new88', '2019-03-21 11:52:38', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (257, 1, 601, 'c', 'date', NULL, NULL, 0, 0, 1, NULL, 'c', 3, 221, 'new88', '2019-03-21 11:52:38', 'new88', '2019-03-21 11:52:38', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (258, 1, 602, 'swwwww2222', 'integer', NULL, NULL, 0, 0, 1, NULL, 's', 1, 222, 'new88', '2019-03-21 12:18:09', 'new88', '2019-03-21 12:18:09', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (259, 1, 603, 'wwwww', 'varchar', NULL, NULL, 1, 0, 1, NULL, '', 2, 222, 'new88', '2019-03-21 12:18:09', 'new88', '2019-03-21 12:18:09', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (260, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (261, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (262, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (263, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (264, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (265, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (266, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (267, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (268, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (269, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (270, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (271, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (272, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (273, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (274, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (275, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (276, 1, 597, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (277, 1, 598, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 220, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (278, 1, 608, 'aa', 'INTEGER', '11', NULL, 0, 0, 0, '', 'aa', 1, 225, 'new88', '2019-03-21 14:54:05', 'new88', '2019-03-21 14:54:05', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (279, 1, 609, 'dd', 'VARCHAR', '200', NULL, 0, 0, 0, '', 'dd', 2, 225, 'new88', '2019-03-21 14:54:05', 'new88', '2019-03-21 14:54:05', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (280, 1, 610, 'field1', 'int', '4', NULL, 0, 0, 1, NULL, '', 1, 226, 'new88', '2019-03-21 14:54:37', 'new88', '2019-03-21 14:54:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (281, 1, 611, 'a', 'INTEGER', '11', NULL, 0, 0, 0, '', 'a', 1, 227, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (282, 1, 612, 'b', 'LONGTEXT', NULL, NULL, 0, 0, 0, '', 'b', 2, 227, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (283, 1, 613, 'EXECID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (284, 1, 614, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (285, 1, 615, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (286, 1, 616, 'OPERATOR', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (287, 1, 617, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (288, 1, 618, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (289, 1, 619, 'BEGIN', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (290, 1, 620, 'END', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (291, 1, 621, 'STATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (292, 1, 622, 'READLINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (293, 1, 623, 'WRITELINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (294, 1, 624, 'OTHERLINES', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (295, 1, 625, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 228, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-21 15:02:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (296, 1, 626, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (297, 1, 627, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (298, 1, 628, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (299, 1, 629, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (300, 1, 630, 'GROUP', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (301, 1, 631, 'LASTSTATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (302, 1, 632, 'LASTEXECTIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (303, 1, 633, 'UPDATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (304, 1, 634, 'DIRECTORY', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (305, 1, 635, 'OBJECTID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (306, 1, 636, 'DESCRIPTION', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (307, 1, 637, 'CREATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 12, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (308, 1, 638, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 229, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-21 15:05:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (309, 1, 639, 'ID', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 230, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (310, 1, 640, 'COL1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 230, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (311, 1, 641, 'COL2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 230, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (312, 1, 642, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 231, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (313, 1, 643, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 231, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (314, 1, 644, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 231, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (315, 1, 645, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 231, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-21 15:05:24', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (316, 1, 646, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 232, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-21 15:05:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (317, 1, 647, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 232, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-21 15:05:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (318, 1, 648, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 232, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-21 15:05:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (319, 1, 649, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 232, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-21 15:05:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (320, 1, 650, 'SEQ_NAME', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 233, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 15:05:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (321, 1, 651, 'SEQ_VALUE', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 233, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 15:05:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (322, 1, 652, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 1, 234, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 15:05:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (323, 1, 653, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 2, 234, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 15:05:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (324, 1, 654, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 235, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (325, 1, 655, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 235, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (326, 1, 656, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 235, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (327, 1, 657, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 235, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (328, 1, 658, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 236, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (329, 1, 659, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 236, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (330, 1, 660, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 236, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (331, 1, 661, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 236, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (332, 1, 662, 'id', 'int', '10', NULL, 1, 0, 0, NULL, '', 1, 237, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-21 15:05:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (333, 1, 663, 'dept', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 1, 238, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-21 15:05:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (334, 1, 664, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '', 2, 238, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-21 15:05:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (335, 1, 665, 'year', 'varchar', '8', NULL, 0, 0, 1, NULL, '', 3, 238, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-21 15:05:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (336, 1, 666, 'rating', 'double', '4', '2', 0, 0, 1, NULL, '', 4, 238, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-21 15:05:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (337, 1, 667, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 239, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (338, 1, 668, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '\'级别\'', 2, 239, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (339, 1, 669, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 239, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (340, 1, 670, 'salary', 'double', '10', '2', 0, 0, 1, NULL, '\'工资\'', 4, 239, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (341, 1, 671, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 240, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (342, 1, 672, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '\'级别\'', 2, 240, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (343, 1, 673, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 240, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (344, 1, 674, 'salary', 'double', '10', '2', 0, 0, 1, NULL, '\'工资\'', 4, 240, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (345, 1, 675, 'id', 'varchar', '30', NULL, 0, 0, 1, NULL, '\'ETL测试表\'', 1, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (346, 1, 676, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (347, 1, 677, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (348, 1, 678, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (349, 1, 679, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (350, 1, 680, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (351, 1, 681, 'id', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 1, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (352, 1, 682, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (353, 1, 683, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (354, 1, 684, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (355, 1, 685, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (356, 1, 686, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (357, 1, 687, 'id', 'int', '10', NULL, 1, 0, 0, '\'0\'', '\'ID\'', 1, 243, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (358, 1, 688, 'i5', 'int', '10', NULL, 0, 0, 1, NULL, '\'i5\'', 2, 243, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (359, 1, 689, 'model', 'int', '10', NULL, 0, 0, 1, NULL, '\'模型\'', 3, 243, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (360, 1, 690, 'i3', 'int', '10', NULL, 0, 0, 1, NULL, '\'i3\'', 4, 243, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (361, 1, 691, 'id', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 1, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (362, 1, 692, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (363, 1, 693, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (364, 1, 694, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (365, 1, 695, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (366, 1, 696, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (367, 1, 697, 'field3', 'double', '20', '4', 0, 0, 1, NULL, '', 7, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (368, 1, 698, 'etltime', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 8, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (369, 1, 699, 'id', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 1, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (370, 1, 700, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (371, 1, 701, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (372, 1, 702, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (373, 1, 703, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (374, 1, 704, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (375, 1, 705, 'filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (376, 1, 706, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (377, 1, 707, 'path', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (378, 1, 708, 'type', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (379, 1, 709, 'exists', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (380, 1, 710, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (381, 1, 711, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (382, 1, 712, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (383, 1, 713, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (384, 1, 714, 'size', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (385, 1, 715, 'extension', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (386, 1, 716, 'uri', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (387, 1, 717, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 13, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (388, 1, 718, 'filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (389, 1, 719, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (390, 1, 720, 'path', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (391, 1, 721, 'type', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (392, 1, 722, 'exists', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (393, 1, 723, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (394, 1, 724, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (395, 1, 725, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (396, 1, 726, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (397, 1, 727, 'size', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (398, 1, 728, 'extension', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (399, 1, 729, 'uri', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (400, 1, 730, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 13, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (401, 1, 731, 'filename22', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 14, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (402, 1, 732, 'others', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 15, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (403, 1, 733, 'id', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 1, 248, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (404, 1, 734, 'date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 2, 248, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (405, 1, 735, 'core', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 248, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (406, 1, 736, 'db_utilization', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 248, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (407, 1, 737, 'FSENTRY_PATH', 'text', '0', NULL, 0, 0, 0, NULL, '', 1, 249, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (408, 1, 738, 'FSENTRY_NAME', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 2, 249, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (409, 1, 739, 'FSENTRY_DATA', 'longblob', '0', NULL, 0, 0, 1, NULL, '', 3, 249, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (410, 1, 740, 'FSENTRY_LASTMOD', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 4, 249, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (411, 1, 741, 'FSENTRY_LENGTH', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 5, 249, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (412, 1, 742, 'FSENTRY_PATH', 'text', '0', NULL, 0, 0, 0, NULL, '', 1, 250, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (413, 1, 743, 'FSENTRY_NAME', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 2, 250, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (414, 1, 744, 'FSENTRY_DATA', 'longblob', '0', NULL, 0, 0, 1, NULL, '', 3, 250, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (415, 1, 745, 'FSENTRY_LASTMOD', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 4, 250, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (416, 1, 746, 'FSENTRY_LENGTH', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 5, 250, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (417, 1, 747, 'BINVAL_ID', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 1, 251, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (418, 1, 748, 'BINVAL_DATA', 'longblob', '0', NULL, 0, 0, 0, NULL, '', 2, 251, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (419, 1, 749, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 252, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (420, 1, 750, 'NODE_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 252, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (421, 1, 751, 'PROP_ID', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 1, 253, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (422, 1, 752, 'PROP_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 253, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (423, 1, 753, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 254, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (424, 1, 754, 'REFS_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 254, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (425, 1, 755, 'BINVAL_ID', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 1, 255, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (426, 1, 756, 'BINVAL_DATA', 'longblob', '0', NULL, 0, 0, 0, NULL, '', 2, 255, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (427, 1, 757, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 256, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (428, 1, 758, 'NODE_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 256, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (429, 1, 759, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 257, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (430, 1, 760, 'REFS_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 257, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (431, 1, 761, 'xcv234', 'INTEGER', '6', NULL, 0, 0, 0, '', 'sdf', 1, 258, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (432, 1, 762, 'id', 'varchar', '500', NULL, 0, 0, 1, NULL, '\'主健\'', 1, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (433, 1, 763, 'kettle_id', 'varchar', '200', NULL, 0, 0, 1, NULL, '\'ktr主健\'', 2, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (434, 1, 764, 'log_step_name', 'varchar', '200', NULL, 0, 0, 1, NULL, '\'step步骤名称\'', 3, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (435, 1, 765, 'log_name', 'varchar', '200', NULL, 0, 0, 1, NULL, '\'ktr名称\'', 4, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (436, 1, 766, 'log_type', 'char', '2', NULL, 0, 0, 1, '\'1\'', '\'1:未查出日志;2:已查出日志\'', 5, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (437, 1, 767, 'log_step_state', 'varchar', '50', NULL, 0, 0, 1, '\'1\'', '\'1-Failed;2-Completed;3-Completed with errors;4-Stopped;6-Running;7-Initializing\'', 6, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (438, 1, 768, 'log_date', 'datetime', '3', NULL, 0, 0, 1, NULL, '\'日志产生时间\'', 7, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (439, 1, 769, 'log_msg', 'varchar', '1000', NULL, 0, 0, 1, NULL, '\'日志内容\'', 8, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (440, 1, 770, 'log_run_state', 'varchar', '50', NULL, 0, 0, 1, '\'1\'', '\'1-Failed;2-Completed;3-Completed with errors;4-Stopped;6-Running;7-Initializing\'', 9, 259, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (441, 1, 771, 'ID_BATCH', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (442, 1, 772, 'SEQ_NR', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (443, 1, 773, 'LOGDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (444, 1, 774, 'TRANSNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (445, 1, 775, 'STEPNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (446, 1, 776, 'STEP_COPY', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (447, 1, 777, 'LINES_READ', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 7, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (448, 1, 778, 'LINES_WRITTEN', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 8, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (449, 1, 779, 'LINES_UPDATED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 9, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (450, 1, 780, 'LINES_INPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (451, 1, 781, 'LINES_OUTPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (452, 1, 782, 'LINES_REJECTED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 12, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (453, 1, 783, 'ERRORS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 13, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (454, 1, 784, 'INPUT_BUFFER_ROWS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 14, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (455, 1, 785, 'OUTPUT_BUFFER_ROWS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 15, 260, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-21 15:12:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (456, 1, 786, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 1, 261, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:21:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (457, 1, 787, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 2, 261, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:21:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (458, 2, 786, 'id_update', 'bigint', '20', NULL, 0, 0, 1, '', '啊实打实的', 1, 261, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:21:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (459, 2, 787, 'NAME', 'varchar', '255', NULL, 0, 0, 1, '', '啊实打实的', 2, 261, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:21:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (460, 1, 788, 'ID_update', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 1, 262, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:25:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (461, 1, 789, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 2, 262, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:25:54', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (462, 2, 788, 'id_update', 'bigint', '20', NULL, 0, 0, 1, '', 'dasdas', 1, 262, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:26:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (463, 2, 789, 'name', 'varchar', '255', NULL, 0, 0, 1, '', 'asdwwwww', 2, 262, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:26:28', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (464, 1, 790, 'filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (465, 1, 791, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (466, 1, 792, 'path', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (467, 1, 793, 'type', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (468, 1, 794, 'exists', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (469, 1, 795, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (470, 1, 796, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (471, 1, 797, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (472, 1, 798, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (473, 1, 799, 'size', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (474, 1, 800, 'extension', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (475, 1, 801, 'uri', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (476, 1, 802, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 13, 263, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (491, 2, 650, 'SEQ_NAME', 'varchar', '50', NULL, 1, 0, 0, '', 'gfv234', 1, 233, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (492, 2, 651, 'SEQ_VALUE', 'int', '11', NULL, 0, 0, 0, '', 'xfvb34w', 2, 233, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (493, 2, 817, 'asd34', 'TINYINT', '3', NULL, 0, 0, 0, '', 'sdf234', 3, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (494, 2, 818, 'asdf234', 'NUMERIC', '4', '2', 0, 0, 0, '', 'sdfsdf', 4, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (495, 2, 819, 'sdf234', 'SMALLINT', '3', NULL, 0, 0, 0, '', '324', 5, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (496, 2, 820, 'wer4werwserf4', 'NUMERIC', '4', '2', 0, 0, 0, '', 'xcv', 6, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (497, 2, 821, 'fgvbxcfvb3r4', 'SMALLINT', '2', NULL, 0, 0, 0, '', 'fvdcwe3r54', 7, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (498, 2, 822, 'vbw3r54', 'SMALLINT', '2', NULL, 0, 0, 0, '', 'xcfvb354', 8, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (499, 2, 823, 'rwe3r54', 'DOUBLE', '3', '2', 0, 0, 0, '', 'cgvbwe3r54', 9, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (500, 2, 824, 'cvbw3r4', 'DECIMAL', '3', '3', 0, 0, 0, '', 'cvbwe3r4', 10, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (501, 2, 825, 'asdf234cxvb', 'NUMERIC', '3', '2', 0, 0, 0, '', 'sadf', 11, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (502, 2, 826, 'asdf234xx234', 'NUMERIC', '3', '2', 0, 0, 0, '', 'sv234', 12, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (503, 2, 827, 'xcv234', 'SMALLINT', '3', NULL, 0, 0, 0, '', 'dxcv32434', 13, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (504, 2, 828, 'xcvb324', 'FLOAT', '4', '2', 0, 0, 0, '', 'zxdv234', 14, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (505, 2, 829, 'vf33', 'BIGINT', '1', NULL, 0, 0, 0, '', 'sdfv234', 15, 233, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-21 17:41:37', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (506, 1, 830, 'ID_BATCH', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (507, 1, 831, 'CHANNEL_ID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (508, 1, 832, 'LOG_DATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (509, 1, 833, 'TRANSNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (510, 1, 834, 'STEPNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (511, 1, 835, 'STEP_COPY', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (512, 1, 836, 'LINES_READ', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 7, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (513, 1, 837, 'LINES_WRITTEN', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 8, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (514, 1, 838, 'LINES_UPDATED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 9, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (515, 1, 839, 'LINES_INPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (516, 1, 840, 'LINES_OUTPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (517, 1, 841, 'LINES_REJECTED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 12, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (518, 1, 842, 'ERRORS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 13, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (519, 1, 843, 'LOG_FIELD', 'text', '0', NULL, 0, 0, 1, NULL, '', 14, 265, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (520, 1, 844, 'ID_BATCH', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (521, 1, 845, 'CHANNEL_ID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (522, 1, 846, 'TRANSNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (523, 1, 847, 'STATUS', 'varchar', '15', NULL, 0, 0, 1, NULL, '', 4, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (524, 1, 848, 'LINES_READ', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 5, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (525, 1, 849, 'LINES_WRITTEN', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 6, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (526, 1, 850, 'LINES_UPDATED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 7, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (527, 1, 851, 'LINES_INPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 8, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (528, 1, 852, 'LINES_OUTPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 9, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (529, 1, 853, 'LINES_REJECTED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (530, 1, 854, 'ERRORS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (531, 1, 855, 'STARTDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 12, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (532, 1, 856, 'ENDDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 13, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (533, 1, 857, 'LOGDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 14, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (534, 1, 858, 'DEPDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 15, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (535, 1, 859, 'REPLAYDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 16, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (536, 1, 860, 'LOG_FIELD', 'mediumtext', '0', NULL, 0, 0, 1, NULL, '', 17, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (537, 1, 861, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (538, 1, 862, 'name', 'varchar', '20', NULL, 0, 0, 0, NULL, '\'job名称\'', 2, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (539, 1, 863, 'type', 'varchar', '20', NULL, 0, 0, 1, NULL, '\'节点类型:command,hive,hadoopJava,spark\'', 3, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (540, 1, 864, 'task_id', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'所属任务ID\'', 4, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (541, 1, 865, 'dependency', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'依赖节点ID,多个用逗号隔开\'', 5, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (542, 1, 866, 'gui_xloc', 'varchar', '10', NULL, 0, 0, 1, NULL, '\'图形化x坐标\'', 6, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (543, 1, 867, 'gui_yloc', 'varchar', '10', NULL, 0, 0, 1, NULL, '\'图形化y坐标\'', 7, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (544, 1, 868, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (545, 1, 869, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 9, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (546, 1, 870, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (547, 1, 871, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 11, 267, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (548, 2, 718, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', 'filename', 1, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (549, 2, 719, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, '', 'short_filename', 2, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (550, 2, 720, 'path', 'varchar', '255', NULL, 0, 0, 1, '', 'path', 3, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (551, 2, 721, 'type', 'varchar', '255', NULL, 0, 0, 1, '', 'type', 4, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (552, 2, 722, 'exists', 'varchar', '255', NULL, 0, 0, 1, '', 'exists', 5, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (553, 2, 723, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, '', 'ishidden', 6, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (554, 2, 724, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, '', 'isreadable', 7, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (555, 2, 725, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, '', 'iswriteable', 8, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (556, 2, 726, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, '', 'lastmodifiedtime', 9, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (557, 2, 727, 'size', 'varchar', '255', NULL, 0, 0, 1, '', 'size', 10, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (558, 2, 728, 'extension', 'varchar', '255', NULL, 0, 0, 1, '', 'extension', 11, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (559, 2, 729, 'uri', 'varchar', '255', NULL, 0, 0, 1, '', 'uri', 12, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (560, 2, 730, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, '', 'rooturi', 13, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (561, 2, 731, 'filename22', 'varchar', '255', NULL, 0, 0, 1, '', 'filename22', 14, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (562, 2, 732, 'others', 'varchar', '255', NULL, 0, 0, 1, '', 'others', 15, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (563, 3, 718, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', 'filename', 1, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (564, 3, 719, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, '', 'short_filename', 2, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (565, 3, 720, 'path', 'varchar', '255', NULL, 0, 0, 1, '', 'path', 3, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (566, 3, 721, 'type', 'varchar', '255', NULL, 0, 0, 1, '', 'type', 4, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (567, 3, 722, 'exists', 'varchar', '255', NULL, 0, 0, 1, '', 'exists', 5, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (568, 3, 723, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, '', 'ishidden', 6, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (569, 3, 724, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, '', 'isreadable', 7, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (570, 3, 725, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, '', 'iswriteable', 8, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (571, 3, 726, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, '', 'lastmodifiedtime', 9, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (572, 3, 727, 'size', 'varchar', '255', NULL, 0, 0, 1, '', 'size', 10, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (573, 3, 728, 'extension', 'varchar', '255', NULL, 0, 0, 1, '', 'extension', 11, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (574, 3, 729, 'uri', 'varchar', '255', NULL, 0, 0, 1, '', 'uri', 12, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (575, 3, 730, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, '', 'rooturi', 13, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (576, 3, 731, 'filename22', 'varchar', '255', NULL, 0, 0, 1, '', 'filename22', 14, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (577, 3, 732, 'others', 'varchar', '255', NULL, 0, 0, 1, '', 'others', 15, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (578, 4, 718, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', 'filename', 1, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (579, 4, 719, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, '', 'short_filename', 2, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (580, 4, 720, 'path', 'varchar', '255', NULL, 0, 0, 1, '', 'path', 3, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (581, 4, 721, 'type', 'varchar', '255', NULL, 0, 0, 1, '', 'type', 4, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (582, 4, 722, 'exists', 'varchar', '255', NULL, 0, 0, 1, '', 'exists', 5, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (583, 4, 723, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, '', 'ishidden', 6, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (584, 4, 724, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, '', 'isreadable', 7, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (585, 4, 725, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, '', 'iswriteable', 8, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (586, 4, 726, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, '', 'lastmodifiedtime', 9, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (587, 4, 727, 'size', 'varchar', '255', NULL, 0, 0, 1, '', 'size', 10, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (588, 4, 728, 'extension', 'varchar', '255', NULL, 0, 0, 1, '', 'extension', 11, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (589, 4, 729, 'uri', 'varchar', '255', NULL, 0, 0, 1, '', 'uri', 12, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (590, 4, 730, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, '', 'rooturi', 13, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (591, 4, 731, 'filename22', 'varchar', '255', NULL, 0, 0, 1, '', 'filename22', 14, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (592, 4, 732, 'others', 'varchar', '255', NULL, 0, 0, 1, '', 'others', 15, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (593, 1, 873, 'sdf', 'BIGINT', '20', NULL, 0, 0, 0, '', 'sdf', 1, 269, 'new88', '2019-03-21 19:36:58', 'new88', '2019-03-21 19:36:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (594, 2, 699, 'id', 'varchar', '30', NULL, 0, 0, 1, '', 'id', 1, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:28:22', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (595, 2, 700, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (596, 2, 701, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (597, 2, 702, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (598, 2, 703, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (599, 2, 704, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (600, 2, 705, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', '111', 1, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:29:52', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (601, 2, 706, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (602, 2, 707, 'path', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (603, 2, 708, 'type', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (604, 2, 709, 'exists', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (605, 2, 710, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (606, 2, 711, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (607, 2, 712, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (608, 2, 713, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (609, 2, 714, 'size', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (610, 2, 715, 'extension', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (611, 2, 716, 'uri', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (612, 2, 717, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 13, 246, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (613, 5, 718, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', 'filename', 1, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (614, 5, 719, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, '', 'short_filename', 2, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (615, 5, 720, 'path', 'varchar', '255', NULL, 0, 0, 1, '', 'path', 3, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (616, 5, 721, 'type', 'varchar', '255', NULL, 0, 0, 1, '', 'type', 4, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (617, 5, 722, 'exists', 'varchar', '255', NULL, 0, 0, 1, '', 'exists', 5, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (618, 5, 723, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, '', 'ishidden', 6, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (619, 5, 724, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, '', 'isreadable', 7, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (620, 5, 725, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, '', 'iswriteable', 8, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (621, 5, 726, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, '', 'lastmodifiedtime', 9, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (622, 5, 727, 'size', 'varchar', '255', NULL, 0, 0, 1, '', 'size', 10, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (623, 5, 728, 'extension', 'varchar', '255', NULL, 0, 0, 1, '', 'extension', 11, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (624, 5, 729, 'uri', 'varchar', '255', NULL, 0, 0, 1, '', 'uri', 12, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (625, 5, 730, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, '', 'rooturi', 13, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (626, 5, 731, 'filename22', 'varchar', '255', NULL, 0, 0, 1, '', 'filename22', 14, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (627, 5, 732, 'others', 'varchar', '255', NULL, 0, 0, 1, '', 'others', 15, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (628, 6, 718, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', 'filename', 1, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (629, 6, 719, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, '', 'short_filename', 2, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (630, 6, 720, 'path', 'varchar', '255', NULL, 0, 0, 1, '', 'path', 3, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (631, 6, 721, 'type', 'varchar', '255', NULL, 0, 0, 1, '', 'type', 4, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (632, 6, 722, 'exists', 'varchar', '255', NULL, 0, 0, 1, '', 'exists', 5, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (633, 6, 723, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, '', 'ishidden', 6, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (634, 6, 724, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, '', 'isreadable', 7, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (635, 6, 725, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, '', 'iswriteable', 8, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (636, 6, 726, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, '', 'lastmodifiedtime', 9, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (637, 6, 727, 'size', 'varchar', '255', NULL, 0, 0, 1, '', 'size', 10, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (638, 6, 728, 'extension', 'varchar', '255', NULL, 0, 0, 1, '', 'extension', 11, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (639, 6, 729, 'uri', 'varchar', '255', NULL, 0, 0, 1, '', 'uri', 12, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (640, 6, 730, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, '', 'rooturi', 13, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (641, 6, 731, 'filename22', 'varchar', '255', NULL, 0, 0, 1, '', 'filename22', 14, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (642, 6, 732, 'others', 'varchar', '255', NULL, 0, 0, 1, '', 'others', 15, 247, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (643, 1, 874, 'id', 'NUMBER', '22', '2', 1, 0, 0, '', 'zzzxasd', 1, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (644, 1, 875, 'name', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', 'asdasdwq', 2, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (645, 1, 876, 'cs_1', 'NUMBER', '22', '2', 0, 0, 0, '', 'asdqwasxdxas', 3, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (646, 1, 877, 'yuyu', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 272, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (647, 1, 878, 'aaa', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 273, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (648, 1, 879, 'asdf', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 274, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (649, 1, 880, 'fff', 'int', '11', NULL, 0, 0, 1, NULL, '\'fff\'', 1, 275, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (650, 1, 881, 'id', 'int', '11', NULL, 1, 1, 0, NULL, '', 1, 276, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (651, 1, 882, 'name', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 276, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (652, 1, 883, 'year', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 276, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (653, 1, 884, 'area', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 276, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (654, 1, 885, 'month', 'char', '255', NULL, 0, 0, 1, NULL, '', 1, 277, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (655, 1, 886, 'prodA', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 277, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (656, 1, 887, 'prodB', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 277, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (657, 1, 888, 'prodC', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 277, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (658, 1, 889, 'prodD', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 277, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (659, 1, 890, 'prodE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 277, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (660, 1, 891, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (661, 1, 892, 'original_name', 'varchar', '50', NULL, 0, 0, 0, NULL, '\'原始文件名\'', 2, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (662, 1, 893, 'store_schema', 'varchar', '50', NULL, 0, 0, 1, NULL, '\'存储协议：file,hdfs\'', 3, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (663, 1, 894, 'file_path', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'存储文件名\'', 4, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (664, 1, 895, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (665, 1, 896, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 6, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (666, 1, 897, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (667, 1, 898, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 8, 278, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (668, 1, 899, 'id', 'bigint', '20', NULL, 1, 0, 0, NULL, '\'节点id\'', 1, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (669, 1, 900, 'class_name', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'main函数所在类\'', 2, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (670, 1, 901, 'parameter', 'varchar', '500', NULL, 0, 0, 1, NULL, '\'main函数参数\'', 3, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (671, 1, 902, 'jar_attachement_id', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'jar文件附件ID\'', 4, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (672, 1, 903, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (673, 1, 904, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 6, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (674, 1, 905, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (675, 1, 906, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 8, 279, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (676, 1, 907, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 280, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (677, 1, 908, 'job_id', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'节点id\'', 2, 280, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (678, 1, 909, 'script', 'varchar', '1000', NULL, 0, 0, 1, NULL, '\'执行脚本\'', 3, 280, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (679, 1, 910, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 280, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (680, 1, 911, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 5, 280, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (681, 1, 912, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 280, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (682, 1, 913, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 7, 280, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (683, 1, 914, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (684, 1, 915, 'name', 'varchar', '50', NULL, 0, 0, 0, NULL, '\'任务名称\'', 2, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (685, 1, 916, 'description', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'任务描述\'', 3, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (686, 1, 917, 'has_submit', 'tinyint', '1', NULL, 0, 0, 1, NULL, '\'是否已经提交\'', 4, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (687, 1, 918, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (688, 1, 919, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 6, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (689, 1, 920, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (690, 1, 921, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 8, 281, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (691, 1, 922, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (692, 1, 923, 'task_id', 'bigint', '20', NULL, 0, 0, 0, NULL, '\'任务id\'', 2, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (693, 1, 924, 'recurring_flag', 'tinyint', '1', NULL, 0, 0, 1, NULL, '\'是否问循环任务\'', 3, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (694, 1, 925, 'start_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '\'任务开始时间\'', 4, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (695, 1, 926, 'interval_value', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'时间间隔\'', 5, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (696, 1, 927, 'interval_unit', 'varchar', '10', NULL, 0, 0, 1, NULL, '\'时间间隔单位：min,h,d\'', 6, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (697, 1, 928, 'cron_expression', 'varchar', '50', NULL, 0, 0, 1, NULL, '\'cron表达式，优先级高于时间间隔\'', 7, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (698, 1, 929, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (699, 1, 930, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 9, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (700, 1, 931, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (701, 1, 932, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 11, 282, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (702, 1, 933, 'aa', 'int', '10', NULL, 0, 0, 1, NULL, '\'12\'', 1, 283, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (703, 1, 934, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '', 1, 284, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (704, 1, 935, 'name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 284, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (705, 1, 936, 'sex', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 284, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (706, 1, 937, 'id', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 285, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (707, 1, 938, 'name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 285, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (708, 1, 939, 'id', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 286, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (709, 1, 940, 'name', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 2, 286, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (710, 1, 941, 't1', 'int', '11', NULL, 0, 0, 1, NULL, '\'t1字段\'', 1, 287, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (711, 1, 942, 't2', 'decimal', '16', '5', 0, 0, 1, NULL, '\'t2字段\'', 2, 287, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (712, 1, 943, 't3', 'timestamp', '0', NULL, 0, 0, 1, NULL, '\'t3字段\'', 3, 287, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (713, 1, 944, 'tab1_id', 'varchar', '11', NULL, 0, 0, 1, NULL, '', 1, 288, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (714, 1, 945, 'create', 'timestamp', '3', NULL, 0, 0, 1, NULL, '', 2, 288, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (715, 1, 946, 'create2', 'datetime', '3', NULL, 0, 0, 1, NULL, '', 3, 288, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (716, 1, 947, 'cardID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 289, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (717, 1, 948, 'phone', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 289, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (718, 1, 949, 'date', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 289, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (719, 1, 950, 'character', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 289, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (720, 1, 951, 'id', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 1, 290, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (721, 1, 952, 'c1', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 2, 290, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (722, 1, 953, 'c2', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 3, 290, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (723, 1, 954, 'c3', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 4, 290, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (724, 1, 955, 'id', 'int', '8', NULL, 1, 1, 0, NULL, '', 1, 291, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (725, 1, 956, 'name', 'text', '0', NULL, 0, 0, 1, NULL, '', 2, 291, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (726, 1, 957, 'age', 'text', '0', NULL, 0, 0, 1, NULL, '', 3, 291, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (727, 1, 958, 'data', 'date', '0', NULL, 0, 0, 1, NULL, '', 4, 291, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (728, 1, 959, 'id', 'int', '8', NULL, 1, 1, 0, NULL, '', 1, 292, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (729, 1, 960, 'name', 'text', '0', NULL, 0, 0, 1, NULL, '', 2, 292, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (730, 1, 961, 'age', 'text', '0', NULL, 0, 0, 1, NULL, '', 3, 292, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (731, 1, 962, 'data', 'date', '0', NULL, 0, 0, 1, NULL, '', 4, 292, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (732, 1, 963, 'id', 'text', '0', NULL, 0, 0, 1, NULL, '', 1, 293, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (733, 1, 964, 'deptno', 'text', '0', NULL, 0, 0, 1, NULL, '', 2, 293, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (734, 1, 965, 'dname', 'text', '0', NULL, 0, 0, 1, NULL, '', 3, 293, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (735, 1, 966, 'dd', 'text', '0', NULL, 0, 0, 1, NULL, '', 4, 293, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (736, 1, 967, 'id', 'NUMBER', NULL, NULL, 1, 0, 0, '', '', 1, 295, 'new88', '2019-03-22 16:49:08', 'new88', '2019-03-22 16:49:08', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (737, 1, 968, 'ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 296, 'new88', '2019-03-22 16:49:10', 'new88', '2019-03-22 16:49:10', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (738, 1, 969, 'ID', 'NUMBER', NULL, '0', 0, 0, 1, '', '', 1, 297, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 16:49:12', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (739, 1, 970, 'CODE', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 297, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 16:49:12', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (740, 1, 971, 'NAME', 'BINARY_DOUBLE', NULL, NULL, 0, 0, 1, '', '', 3, 297, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 16:49:12', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (741, 1, 972, 'ADDRESS', 'BINARY_FLOAT', NULL, NULL, 0, 0, 1, '', '', 4, 297, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 16:49:12', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (742, 1, 973, 'T1', 'LONG', NULL, NULL, 0, 0, 1, '', '', 1, 298, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 16:49:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (743, 1, 974, 'T2', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 298, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 16:49:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (744, 1, 975, 'EXECID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (745, 1, 976, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (746, 1, 977, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (747, 1, 978, 'OPERATOR', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (748, 1, 979, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (749, 1, 980, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (750, 1, 981, 'BEGIN', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (751, 1, 982, 'END', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (752, 1, 983, 'STATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (753, 1, 984, 'READLINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (754, 1, 985, 'WRITELINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (755, 1, 986, 'OTHERLINES', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (756, 1, 987, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 299, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (757, 1, 988, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (758, 1, 989, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (759, 1, 990, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (760, 1, 991, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (761, 1, 992, 'GROUP', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (762, 1, 993, 'LASTSTATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (763, 1, 994, 'LASTEXECTIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (764, 1, 995, 'UPDATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (765, 1, 996, 'DIRECTORY', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (766, 1, 997, 'OBJECTID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (767, 1, 998, 'DESCRIPTION', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (768, 1, 999, 'CREATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 12, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (769, 1, 1000, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 300, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (770, 1, 1001, 'ID', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 301, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (771, 1, 1002, 'COL1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 301, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (772, 1, 1003, 'COL2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 301, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (773, 1, 1004, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 302, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (774, 1, 1005, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 302, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (775, 1, 1006, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 302, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (776, 1, 1007, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 302, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (777, 1, 1008, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 303, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (778, 1, 1009, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 303, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (779, 1, 1010, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 303, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (780, 1, 1011, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 303, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (781, 1, 1012, 'id_update', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'dasdas\'', 1, 304, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (782, 1, 1013, 'name', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'asdwwwww\'', 2, 304, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (783, 1, 1014, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 305, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (784, 1, 1015, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 305, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (785, 1, 1016, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 305, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (786, 1, 1017, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 305, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (787, 1, 1018, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 306, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (788, 1, 1019, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 306, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (789, 1, 1020, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 306, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (790, 1, 1021, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 306, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (791, 1, 1022, 'id', 'int', '10', NULL, 1, 0, 0, NULL, '', 1, 307, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (792, 1, 1023, 'dept', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 1, 308, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (793, 1, 1024, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '', 2, 308, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (794, 1, 1025, 'year', 'varchar', '8', NULL, 0, 0, 1, NULL, '', 3, 308, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (795, 1, 1026, 'rating', 'double', '4', '2', 0, 0, 1, NULL, '', 4, 308, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (796, 1, 1027, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (797, 1, 1028, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '\'级别\'', 2, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (798, 1, 1029, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (799, 1, 1030, 'salary', 'double', '10', '2', 0, 0, 1, NULL, '\'工资\'', 4, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (800, 1, 1031, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (801, 1, 1032, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (802, 1, 1033, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (803, 1, 1034, 'id', 'BIGINT', '10', NULL, 1, 1, 0, '', 'id', 1, 310, 'new88', '2019-03-22 17:29:58', 'new88', '2019-03-22 17:29:58', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (804, 1, 1036, 'ID', 'NUMBER', '22', '0', 0, 0, 1, '', 'id', 1, 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (805, 1, 1037, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'name', 2, 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (806, 1, 1038, 'FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'flag', 3, 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (807, 1, 1039, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_batch', 4, 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (808, 1, 1040, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (809, 1, 1041, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (810, 1, 1042, 'ID', 'NUMBER', '22', '0', 1, 0, 0, '', '', 1, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (811, 1, 1043, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (812, 1, 1044, 'ADDRESS', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (813, 1, 1045, 'CREATE_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', '', 4, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (814, 1, 1046, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 5, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (815, 1, 1047, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', '', 6, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (816, 1, 1048, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 7, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (817, 1, 1049, 'ID', 'NUMBER', '22', '0', 0, 0, 1, '', 'id', 1, 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (818, 1, 1050, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'name', 2, 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (819, 1, 1051, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_batch', 3, 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (820, 1, 1052, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 4, 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (821, 1, 1053, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 5, 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (822, 1, 1054, 'A', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'a', 6, 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (823, 1, 1055, 'NAME', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 316, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (824, 1, 1056, 'id', 'NUMBER', NULL, NULL, 1, 0, 0, '', '', 1, 317, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (825, 1, 1057, 'ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 318, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (826, 1, 1058, 'ID', 'NUMBER', NULL, '0', 0, 0, 1, '', '', 1, 319, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (827, 1, 1059, 'CODE', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 319, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (828, 1, 1060, 'NAME', 'BINARY_DOUBLE', NULL, NULL, 0, 0, 1, '', '', 3, 319, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (829, 1, 1061, 'ADDRESS', 'BINARY_FLOAT', NULL, NULL, 0, 0, 1, '', '', 4, 319, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (830, 1, 1062, 'T1', 'LONG', NULL, NULL, 0, 0, 1, '', '', 1, 320, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (831, 1, 1063, 'T2', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 320, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (832, 1, 1064, 'a', 'INTEGER', '11', NULL, 0, 0, 0, '', 'a', 1, 321, 'new88', '2019-03-22 20:57:34', 'new88', '2019-03-22 20:57:34', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (833, 1, 1065, 'b', 'VARCHAR', '20', NULL, 0, 0, 0, '', 'b', 2, 321, 'new88', '2019-03-22 20:57:34', 'new88', '2019-03-22 20:57:34', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (834, 1, 1116, 'ID', 'BIGINT', '10', NULL, 0, 0, 0, '', 'ID', 1, 332, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (835, 1, 1117, 'NAME', 'VARCHAR', '255', NULL, 0, 0, 1, '', 'NAME', 2, 332, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (836, 1, 1118, 'FLAG', 'VARCHAR', '255', NULL, 0, 0, 1, '', 'FLAG', 3, 332, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (837, 1, 1119, 'dsa', 'BIGINT', '20', NULL, 1, 0, 0, '', 'wdwsad', 1, 334, 'wzl1', '2019-03-23 15:03:25', 'wzl1', '2019-03-23 15:03:25', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (838, 2, 1027, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (839, 2, 1028, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '\'级别\'', 2, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (840, 2, 1029, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (841, 2, 1030, 'salary', 'double', '10', '2', 0, 0, 1, NULL, '\'工资\'', 4, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (842, 2, 1031, 'ds_batch', 'DATETIME', '0', NULL, 0, 0, 1, '', 'asd', 5, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-25 14:57:10', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (843, 2, 1032, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (844, 2, 1033, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (845, 1, 1129, 'account_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (846, 1, 1130, 'account_parent', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (847, 1, 1131, 'account_description', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (848, 1, 1132, 'account_type', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 4, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (849, 1, 1133, 'account_rollup', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 5, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (850, 1, 1134, 'Custom_Members', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (851, 1, 1135, 'month_of_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 1, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (852, 1, 1136, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (853, 1, 1137, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 3, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (854, 1, 1138, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (855, 1, 1139, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (856, 1, 1140, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (857, 1, 1141, 'customer_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 7, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (858, 1, 1142, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 338, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (859, 1, 1143, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (860, 1, 1144, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (861, 1, 1145, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (862, 1, 1146, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (863, 1, 1147, 'month_of_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 5, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (864, 1, 1148, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 6, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (865, 1, 1149, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 7, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (866, 1, 1150, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (867, 1, 1151, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 9, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (868, 1, 1152, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 10, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (869, 1, 1153, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 11, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (870, 1, 1154, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (871, 1, 1155, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (872, 1, 1156, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (873, 1, 1157, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (874, 1, 1158, 'time_month', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 5, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (875, 1, 1159, 'time_quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 6, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (876, 1, 1160, 'time_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 7, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (877, 1, 1161, 'store_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (878, 1, 1162, 'store_cost_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 9, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (879, 1, 1163, 'unit_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 10, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (880, 1, 1164, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 11, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (881, 1, 1165, 'gender', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 1, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (882, 1, 1166, 'marital_status', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (883, 1, 1167, 'product_family', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (884, 1, 1168, 'product_department', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (885, 1, 1169, 'product_category', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (886, 1, 1170, 'month_of_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 6, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (887, 1, 1171, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 7, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (888, 1, 1172, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 8, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (889, 1, 1173, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 9, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (890, 1, 1174, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 10, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (891, 1, 1175, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 11, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (892, 1, 1176, 'customer_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 12, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (893, 1, 1177, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 13, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (894, 1, 1178, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 342, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (895, 1, 1179, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 342, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (896, 1, 1180, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 3, 342, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (897, 1, 1181, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 342, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (898, 1, 1182, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 342, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (899, 1, 1183, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 6, 342, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (900, 1, 1184, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 343, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (901, 1, 1185, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 2, 343, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (902, 1, 1186, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 3, 343, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (903, 1, 1187, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 343, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (904, 1, 1188, 'customer_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 343, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (905, 1, 1189, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 6, 343, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (906, 1, 1190, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (907, 1, 1191, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (908, 1, 1192, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (909, 1, 1193, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (910, 1, 1194, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (911, 1, 1195, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (912, 1, 1196, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (913, 1, 1197, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (914, 1, 1198, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (915, 1, 1199, 'city', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (916, 1, 1200, 'state_province', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (917, 1, 1201, 'country', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 4, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (918, 1, 1202, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (919, 1, 1203, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (920, 1, 1204, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (921, 1, 1205, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 345, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (922, 1, 1206, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (923, 1, 1207, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (924, 1, 1208, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (925, 1, 1209, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 4, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (926, 1, 1210, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (927, 1, 1211, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (928, 1, 1212, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (929, 1, 1213, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (930, 1, 1214, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (931, 1, 1215, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (932, 1, 1216, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (933, 1, 1217, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (934, 1, 1218, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (935, 1, 1219, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (936, 1, 1220, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 7, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (937, 1, 1221, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (938, 1, 1222, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (939, 1, 1223, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (940, 1, 1224, 'store_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (941, 1, 1225, 'store_cost_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (942, 1, 1226, 'unit_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (943, 1, 1227, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 7, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (944, 1, 1228, 'category_id', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 1, 349, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (945, 1, 1229, 'category_parent', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 349, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (946, 1, 1230, 'category_description', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 349, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (947, 1, 1231, 'category_rollup', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 349, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (948, 1, 1232, 'currency_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 350, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (949, 1, 1233, 'date', 'date', '0', NULL, 0, 0, 0, NULL, '', 2, 350, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (950, 1, 1234, 'currency', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 350, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (951, 1, 1235, 'conversion_ratio', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 350, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (952, 1, 1236, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (953, 1, 1237, 'account_num', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 2, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (954, 1, 1238, 'lname', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (955, 1, 1239, 'fname', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 4, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (956, 1, 1240, 'mi', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (957, 1, 1241, 'address1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (958, 1, 1242, 'address2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (959, 1, 1243, 'address3', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (960, 1, 1244, 'address4', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (961, 1, 1245, 'city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (962, 1, 1246, 'state_province', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (963, 1, 1247, 'postal_code', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 12, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (964, 1, 1248, 'country', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 13, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (965, 1, 1249, 'customer_region_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 14, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (966, 1, 1250, 'phone1', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 15, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (967, 1, 1251, 'phone2', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 16, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (968, 1, 1252, 'birthdate', 'date', '0', NULL, 0, 0, 0, NULL, '', 17, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (969, 1, 1253, 'marital_status', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 18, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (970, 1, 1254, 'yearly_income', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 19, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (971, 1, 1255, 'gender', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 20, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (972, 1, 1256, 'total_children', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 21, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (973, 1, 1257, 'num_children_at_home', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 22, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (974, 1, 1258, 'education', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 23, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (975, 1, 1259, 'date_accnt_opened', 'date', '0', NULL, 0, 0, 0, NULL, '', 24, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (976, 1, 1260, 'member_card', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 25, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (977, 1, 1261, 'occupation', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 26, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (978, 1, 1262, 'houseowner', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 27, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (979, 1, 1263, 'num_cars_owned', 'int', '11', NULL, 0, 0, 1, NULL, '', 28, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (980, 1, 1264, 'fullname', 'varchar', '60', NULL, 0, 0, 0, NULL, '', 29, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (981, 1, 1265, 'day', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 352, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (982, 1, 1266, 'week_day', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 352, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (983, 1, 1267, 'department_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 353, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (984, 1, 1268, 'department_description', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 353, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (985, 1, 1269, 'employee_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 354, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (986, 1, 1270, 'supervisor_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 354, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (987, 1, 1271, 'distance', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 354, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (988, 1, 1272, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (989, 1, 1273, 'account_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (990, 1, 1274, 'exp_date', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 3, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (991, 1, 1275, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (992, 1, 1276, 'category_id', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 5, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (993, 1, 1277, 'currency_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 6, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (994, 1, 1278, 'amount', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (995, 1, 1279, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (996, 1, 1280, 'time_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (997, 1, 1281, 'warehouse_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (998, 1, 1282, 'store_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 4, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (999, 1, 1283, 'units_ordered', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1000, 1, 1284, 'units_shipped', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1001, 1, 1285, 'warehouse_sales', 'decimal', '10', '4', 0, 0, 1, NULL, '', 7, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1002, 1, 1286, 'warehouse_cost', 'decimal', '10', '4', 0, 0, 1, NULL, '', 8, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1003, 1, 1287, 'supply_time', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 9, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1004, 1, 1288, 'store_invoice', 'decimal', '10', '4', 0, 0, 1, NULL, '', 10, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1005, 1, 1289, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1006, 1, 1290, 'time_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1007, 1, 1291, 'warehouse_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1008, 1, 1292, 'store_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 4, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1009, 1, 1293, 'units_ordered', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1010, 1, 1294, 'units_shipped', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1011, 1, 1295, 'warehouse_sales', 'decimal', '10', '4', 0, 0, 1, NULL, '', 7, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1012, 1, 1296, 'warehouse_cost', 'decimal', '10', '4', 0, 0, 1, NULL, '', 8, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1013, 1, 1297, 'supply_time', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 9, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1014, 1, 1298, 'store_invoice', 'decimal', '10', '4', 0, 0, 1, NULL, '', 10, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1015, 1, 1299, 'position_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 358, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1016, 1, 1300, 'position_title', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 358, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1017, 1, 1301, 'pay_type', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 358, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1018, 1, 1302, 'min_scale', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 358, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1019, 1, 1303, 'max_scale', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 358, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1020, 1, 1304, 'management_role', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 6, 358, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1021, 1, 1305, 'product_class_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1022, 1, 1306, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1023, 1, 1307, 'brand_name', 'varchar', '60', NULL, 0, 0, 1, NULL, '', 3, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1024, 1, 1308, 'product_name', 'varchar', '60', NULL, 0, 0, 0, NULL, '', 4, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1025, 1, 1309, 'SKU', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 5, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1026, 1, 1310, 'SRP', 'decimal', '10', '4', 0, 0, 1, NULL, '', 6, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1027, 1, 1311, 'gross_weight', 'double', '0', '0', 0, 0, 1, NULL, '', 7, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1028, 1, 1312, 'net_weight', 'double', '0', '0', 0, 0, 1, NULL, '', 8, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1029, 1, 1313, 'recyclable_package', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 9, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1030, 1, 1314, 'low_fat', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 10, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1031, 1, 1315, 'units_per_case', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 11, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1032, 1, 1316, 'cases_per_pallet', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 12, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1033, 1, 1317, 'shelf_width', 'double', '0', '0', 0, 0, 1, NULL, '', 13, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1034, 1, 1318, 'shelf_height', 'double', '0', '0', 0, 0, 1, NULL, '', 14, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1035, 1, 1319, 'shelf_depth', 'double', '0', '0', 0, 0, 1, NULL, '', 15, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1036, 1, 1320, 'product_class_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 360, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1037, 1, 1321, 'product_subcategory', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 360, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1038, 1, 1322, 'product_category', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 360, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1039, 1, 1323, 'product_department', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 360, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1040, 1, 1324, 'product_family', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 360, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1041, 1, 1325, 'region_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 361, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1042, 1, 1326, 'sales_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 361, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1043, 1, 1327, 'sales_state_province', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 361, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1044, 1, 1328, 'sales_district', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 361, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1045, 1, 1329, 'sales_region', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 361, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1046, 1, 1330, 'sales_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 361, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1047, 1, 1331, 'sales_district_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 7, 361, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1048, 1, 1332, 'id', 'int', '100', NULL, 1, 0, 0, NULL, '\'唯一标识\'', 1, 362, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1049, 1, 1333, 'name', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 2, 362, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1050, 1, 1334, 'lalal', 'date', '0', NULL, 0, 0, 1, NULL, '', 3, 362, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1051, 1, 1335, 'pay_date', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 1, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1052, 1, 1336, 'employee_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1053, 1, 1337, 'department_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1054, 1, 1338, 'currency_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1055, 1, 1339, 'salary_paid', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1056, 1, 1340, 'overtime_paid', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1057, 1, 1341, 'vacation_accrued', 'double', '0', '0', 0, 0, 0, NULL, '', 7, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1058, 1, 1342, 'vacation_used', 'double', '0', '0', 0, 0, 0, NULL, '', 8, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1059, 1, 1343, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1060, 1, 1344, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1061, 1, 1345, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1062, 1, 1346, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1063, 1, 1347, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1064, 1, 1348, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1065, 1, 1349, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1066, 1, 1350, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1067, 1, 1351, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1068, 1, 1352, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1069, 1, 1353, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1070, 1, 1354, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1071, 1, 1355, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1072, 1, 1356, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1073, 1, 1357, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1074, 1, 1358, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1075, 1, 1359, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1076, 1, 1360, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1077, 1, 1361, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1078, 1, 1362, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1079, 1, 1363, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1080, 1, 1364, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1081, 1, 1365, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1082, 1, 1366, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1083, 1, 1367, 'name', 'int', '11', NULL, 0, 0, 1, NULL, '\'sjifeji\'', 1, 367, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1084, 1, 1368, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1085, 1, 1369, 'store_type', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1086, 1, 1370, 'region_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1087, 1, 1371, 'store_name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1088, 1, 1372, 'store_number', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1089, 1, 1373, 'store_street_address', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1090, 1, 1374, 'store_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1091, 1, 1375, 'store_state', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1092, 1, 1376, 'store_postal_code', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1093, 1, 1377, 'store_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1094, 1, 1378, 'store_manager', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1095, 1, 1379, 'store_phone', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 12, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1096, 1, 1380, 'store_fax', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 13, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1097, 1, 1381, 'first_opened_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 14, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1098, 1, 1382, 'last_remodel_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 15, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1099, 1, 1383, 'store_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 16, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1100, 1, 1384, 'grocery_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 17, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1101, 1, 1385, 'frozen_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 18, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1102, 1, 1386, 'meat_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 19, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1103, 1, 1387, 'coffee_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 20, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1104, 1, 1388, 'video_store', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 21, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1105, 1, 1389, 'salad_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 22, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1106, 1, 1390, 'prepared_food', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 23, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1107, 1, 1391, 'florist', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 24, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1108, 1, 1392, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1109, 1, 1393, 'store_type', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1110, 1, 1394, 'region_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1111, 1, 1395, 'store_name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1112, 1, 1396, 'store_number', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1113, 1, 1397, 'store_street_address', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1114, 1, 1398, 'store_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1115, 1, 1399, 'store_state', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1116, 1, 1400, 'store_postal_code', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1117, 1, 1401, 'store_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1118, 1, 1402, 'store_manager', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1119, 1, 1403, 'store_phone', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 12, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1120, 1, 1404, 'store_fax', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 13, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1121, 1, 1405, 'first_opened_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 14, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1122, 1, 1406, 'last_remodel_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 15, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1123, 1, 1407, 'store_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 16, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1124, 1, 1408, 'grocery_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 17, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1125, 1, 1409, 'frozen_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 18, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1126, 1, 1410, 'meat_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 19, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1127, 1, 1411, 'coffee_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 20, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1128, 1, 1412, 'video_store', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 21, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1129, 1, 1413, 'salad_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 22, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1130, 1, 1414, 'prepared_food', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 23, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1131, 1, 1415, 'florist', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 24, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1132, 1, 1416, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1133, 1, 1417, 'the_date', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 2, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1134, 1, 1418, 'the_day', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1135, 1, 1419, 'the_month', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1136, 1, 1420, 'the_year', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 5, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1137, 1, 1421, 'day_of_month', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 6, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1138, 1, 1422, 'week_of_year', 'int', '11', NULL, 0, 0, 1, NULL, '', 7, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1139, 1, 1423, 'month_of_year', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 8, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1140, 1, 1424, 'quarter', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1141, 1, 1425, 'fiscal_period', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1142, 1, 1426, 'warehouse_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1143, 1, 1427, 'warehouse_class_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1144, 1, 1428, 'stores_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1145, 1, 1429, 'warehouse_name', 'varchar', '60', NULL, 0, 0, 1, NULL, '', 4, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1146, 1, 1430, 'wa_address1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1147, 1, 1431, 'wa_address2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1148, 1, 1432, 'wa_address3', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1149, 1, 1433, 'wa_address4', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1150, 1, 1434, 'warehouse_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1151, 1, 1435, 'warehouse_state_province', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1152, 1, 1436, 'warehouse_postal_code', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1153, 1, 1437, 'warehouse_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 12, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1154, 1, 1438, 'warehouse_owner_name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 13, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1155, 1, 1439, 'warehouse_phone', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 14, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1156, 1, 1440, 'warehouse_fax', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 15, 371, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1157, 1, 1441, 'warehouse_class_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 372, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_snapshot_table_column` VALUES (1158, 1, 1442, 'description', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 372, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mc_snapshot_table_fk_mysql
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_fk_mysql`;
CREATE TABLE `mc_snapshot_table_fk_mysql`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `fk_id` bigint(20) NULL DEFAULT NULL COMMENT '外键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前表字段，可能有多个,以,隔开',
  `reference_schema_id` bigint(20) NULL DEFAULT NULL COMMENT '参考的模型id，在mysql中这里表示是数据库',
  `reference_table_id` bigint(20) NULL DEFAULT NULL COMMENT '参考表id',
  `reference_column` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考列id，可能有多个，和当前表字段对应',
  `delete_trigger` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时触发的事件',
  `update_trigger` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时触发的事件',
  `location` int(10) NULL DEFAULT NULL COMMENT '位置（当一个位置标识，在每张表的索引位置都是自增，唯一的）',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_table_fk_mysql
-- ----------------------------
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (1, 1, 1, 'dddfs', '298', 6, 42, '56', 'RESTRICT', 'RESTRICT', 1, 103, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-15 18:12:27');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (2, 1, 2, 'sdf', '299', 6, 42, '56', 'RESTRICT', 'RESTRICT', 1, 104, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (3, 1, 4, 'fk_user_role_test1', '341', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 143, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 14:24:33');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (4, 1, 5, 'fk_user_role_test1', '343', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 144, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:15:42');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (5, 1, 6, 'fk_user_role_test1', '344', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 145, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:21:39');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (6, 1, 7, 'fk_user_role_cs1', '345', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 146, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:33:37');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (7, 1, 8, 'fk_user_role_test1', '346', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 147, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:38:33');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (8, 1, 9, 'fk_cs1', '352,353', 6, 148, '348,349', 'RESTRICT', 'RESTRICT', 1, 149, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (9, 1, 10, 'a', '358', 78, 108, '304', 'RESTRICT', 'RESTRICT', 1, 154, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-19 16:18:22');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (10, 1, 11, 'sdf', '761', 147, 227, '611', 'RESTRICT', 'RESTRICT', 1, 258, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (11, 3, 17, 'FK_1', '732', 149, 259, '763', 'RESTRICT', 'RESTRICT', 1, 247, 'new88', '2019-03-21 19:18:43', 'new88', '2019-03-21 19:18:43');
INSERT INTO `mc_snapshot_table_fk_mysql` VALUES (12, 5, 20, 'FK_1', '732', 149, 259, '763', 'RESTRICT', 'RESTRICT', 2, 247, 'new88', '2019-03-21 19:32:16', 'new88', '2019-03-21 19:32:16');

-- ----------------------------
-- Table structure for mc_snapshot_table_fk_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_fk_oracle`;
CREATE TABLE `mc_snapshot_table_fk_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `versions` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `fk_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前表字段，可能有多个,以,隔开',
  `reference_schema_id` bigint(20) NULL DEFAULT NULL COMMENT '参考模式id',
  `reference_table_id` bigint(20) NULL DEFAULT NULL COMMENT '参考表id',
  `reference_restrain` bigint(20) NULL DEFAULT NULL COMMENT '参考约束',
  `reference_column` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考字段，字段是当选择约束时，自动录进去',
  `delete_trigger` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时触发的事件',
  `is_enabled` tinyint(1) NULL DEFAULT NULL COMMENT 'oracle 概念，是否启用，0:未启动 1:启用',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mc_snapshot_table_idx_mysql
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_idx_mysql`;
CREATE TABLE `mc_snapshot_table_idx_mysql`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `index_id` bigint(20) NULL DEFAULT NULL COMMENT '索引id',
  `index_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前索引关联的字段，可能多个，以，隔开',
  `subdivision` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子部分，对应字段，可以有多个',
  `index_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引类型',
  `index_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引方法',
  `location` int(10) NULL DEFAULT NULL COMMENT '索引位置（当前字段的一个位置标识，每张表的索引位置都是自增，唯一的）',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_table_idx_mysql
-- ----------------------------
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (1, 1, 7, 'index_cs1', '41', NULL, 'UNIQUE', 'BTREE', 1, 34, 'wzl1', '2019-03-10 22:38:36', 'wzl1', '2019-03-10 22:38:36');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (2, 1, 15, 'asdswww', '57', NULL, 'NORMAL', 'BTREE', 1, 42, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (3, 1, 16, 'sdf234', '298', NULL, 'NORMAL', 'BTREE', 1, 103, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-15 18:12:27');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (4, 1, 17, 'dd234', '299', NULL, 'NORMAL', 'BTREE', 1, 104, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (5, 2, 18, 'bb', '304', NULL, 'Normal', 'BTREE', 1, 108, 'new88', '2019-03-18 10:40:29', 'new88', '2019-03-18 10:40:29');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (6, 1, 20, 'u_id', '341', NULL, 'NORMAL', 'BTREE', 1, 143, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 14:24:33');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (8, 1, 21, 'u_id', '343', NULL, 'NORMAL', 'BTREE', 1, 144, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:15:42');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (10, 1, 22, 'u_id', '344', NULL, 'NORMAL', 'BTREE', 1, 145, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:21:39');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (12, 1, 23, 'u_id', '345', NULL, 'NORMAL', 'BTREE', 1, 146, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:33:37');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (14, 1, 24, 'u_id', '346', NULL, 'NORMAL', 'BTREE', 1, 147, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:38:33');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (15, 2, 24, 'u_id', '346', NULL, 'NORMAL', 'BTREE', 1, 147, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:38:33');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (16, 2, 25, 'name_class_name', '348,349', NULL, 'UNIQUE', 'BTREE', 1, 148, 'wzl1', '2019-03-19 15:53:25', 'wzl1', '2019-03-19 15:53:25');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (17, 1, 26, 'username_class_name', '352,353', NULL, 'NORMAL', 'BTREE', 1, 149, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (18, 1, 27, 'a', '354', NULL, 'Normal', 'BTREE', 1, 152, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-19 16:14:12');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (19, 1, 29, 'a', '358', NULL, 'NORMAL', 'BTREE', 1, 154, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-19 16:18:22');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (20, 2, 15, 'asdswww', '57', NULL, 'NORMAL', 'BTREE', 1, 42, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (21, 1, 32, 'a', '611', NULL, 'Normal', 'BTREE', 1, 227, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (22, 1, 33, 'id_k', '667', NULL, 'UNIQUE', 'BTREE', 1, 239, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (23, 1, 34, 'id_k', '671', NULL, 'UNIQUE', 'BTREE', 1, 240, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (24, 1, 35, 'id', '675', NULL, 'UNIQUE', 'BTREE', 1, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (25, 1, 36, 'newstr', '677', NULL, 'UNIQUE', 'BTREE', 2, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (26, 1, 37, 'phone', '678', NULL, 'UNIQUE', 'BTREE', 3, 241, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (27, 1, 38, 'id', '681', NULL, 'UNIQUE', 'BTREE', 1, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (28, 1, 39, 'newstr', '683', NULL, 'UNIQUE', 'BTREE', 2, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (29, 1, 40, 'phone', '684', NULL, 'UNIQUE', 'BTREE', 3, 242, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (30, 1, 41, 'id', '691', NULL, 'UNIQUE', 'BTREE', 1, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (31, 1, 42, 'newstr', '693', NULL, 'UNIQUE', 'BTREE', 2, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (32, 1, 43, 'phone', '694', NULL, 'UNIQUE', 'BTREE', 3, 244, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-21 15:07:38');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (33, 1, 44, 'id', '699', NULL, 'UNIQUE', 'BTREE', 1, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (34, 1, 45, 'newstr', '701', NULL, 'UNIQUE', 'BTREE', 2, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (35, 1, 46, 'phone', '702', NULL, 'UNIQUE', 'BTREE', 3, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (36, 1, 47, 'J_FS_DEFAULT_FSENTRY_IDX', '738', NULL, 'UNIQUE', 'BTREE', 1, 249, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (37, 1, 48, 'J_FS_SECURITY_FSENTRY_IDX', '743', NULL, 'UNIQUE', 'BTREE', 1, 250, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (38, 1, 49, 'J_PM_DEFAULT_BINVAL_IDX', '747', NULL, 'UNIQUE', 'BTREE', 1, 251, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (39, 1, 50, 'J_PM_DEFAULT_NODE_IDX', '749', NULL, 'UNIQUE', 'BTREE', 1, 252, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (40, 1, 51, 'J_PM_DEFAULT_PROP_IDX', '751', NULL, 'UNIQUE', 'BTREE', 1, 253, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (41, 1, 52, 'J_PM_DEFAULT_REFS_IDX', '753', NULL, 'UNIQUE', 'BTREE', 1, 254, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (42, 1, 53, 'J_PM_SECURITY_BINVAL_IDX', '755', NULL, 'UNIQUE', 'BTREE', 1, 255, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (43, 1, 54, 'J_PM_SECURITY_NODE_IDX', '757', NULL, 'UNIQUE', 'BTREE', 1, 256, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (44, 1, 55, 'J_PM_SECURITY_REFS_IDX', '759', NULL, 'UNIQUE', 'BTREE', 1, 257, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (45, 1, 56, 'xcv234', '761', NULL, 'NORMAL', 'BTREE', 1, 258, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (46, 1, 57, 'IDX_log_test_1', '844', NULL, 'UNIQUE', 'BTREE', 1, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (47, 1, 58, 'IDX_log_test_2', '854,847,846', NULL, 'UNIQUE', 'BTREE', 2, 266, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (48, 3, 64, 'others', '732', NULL, 'NORMAL', 'BTREE', 1, 247, 'new88', '2019-03-21 19:18:43', 'new88', '2019-03-21 19:18:43');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (49, 4, 64, 'others', '732', NULL, 'NORMAL', 'BTREE', 1, 247, 'new88', '2019-03-21 19:18:43', 'new88', '2019-03-21 19:18:43');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (50, 2, 44, 'id', '699', NULL, 'UNIQUE', 'BTREE', 1, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (51, 2, 45, 'newstr', '701', NULL, 'UNIQUE', 'BTREE', 2, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (52, 2, 46, 'phone', '702', NULL, 'UNIQUE', 'BTREE', 3, 245, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (53, 5, 64, 'others', '732', NULL, 'NORMAL', 'BTREE', 1, 247, 'new88', '2019-03-21 19:18:43', 'new88', '2019-03-21 19:18:43');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (54, 6, 64, 'others', '732', NULL, 'NORMAL', 'BTREE', 1, 247, 'new88', '2019-03-21 19:18:43', 'new88', '2019-03-21 19:18:43');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (55, 1, 68, 'id_k', '1027', NULL, 'UNIQUE', 'BTREE', 1, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (56, 1, 69, 'level', '1028', NULL, 'UNIQUE', 'BTREE', 2, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (57, 2, 68, 'id_k', '1027', NULL, 'UNIQUE', 'BTREE', 1, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (58, 2, 69, 'level', '1028', NULL, 'UNIQUE', 'BTREE', 2, 309, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (59, 1, 70, 'i_account_id', '1129', NULL, 'UNIQUE', 'BTREE', 1, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (60, 1, 71, 'i_account_parent', '1130', NULL, 'UNIQUE', 'BTREE', 2, 337, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (61, 1, 72, 'i_sls97c14cust', '1144', NULL, 'UNIQUE', 'BTREE', 1, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (62, 1, 73, 'i_sls97c14prod', '1143', NULL, 'UNIQUE', 'BTREE', 2, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (63, 1, 74, 'i_sls97c14promo', '1146', NULL, 'UNIQUE', 'BTREE', 3, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (64, 1, 75, 'i_sls97c14store', '1145', NULL, 'UNIQUE', 'BTREE', 4, 339, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (65, 1, 76, 'i_sls97speccust', '1156', NULL, 'UNIQUE', 'BTREE', 1, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (66, 1, 77, 'i_sls97specprod', '1154', NULL, 'UNIQUE', 'BTREE', 2, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (67, 1, 78, 'i_sls97specpromo', '1155', NULL, 'UNIQUE', 'BTREE', 3, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (68, 1, 79, 'i_sls97specstore', '1157', NULL, 'UNIQUE', 'BTREE', 4, 340, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (69, 1, 80, 'i_sls97gmp_gender', '1165', NULL, 'UNIQUE', 'BTREE', 1, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (70, 1, 81, 'i_sls97gmp_ms', '1166', NULL, 'UNIQUE', 'BTREE', 2, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (71, 1, 82, 'i_sls97gmp_pfam', '1167', NULL, 'UNIQUE', 'BTREE', 3, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (72, 1, 83, 'i_sls97gmp_pdept', '1168', NULL, 'UNIQUE', 'BTREE', 4, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (73, 1, 84, 'i_sls97gmp_pcat', '1169', NULL, 'UNIQUE', 'BTREE', 5, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (74, 1, 85, 'i_sls97gmp_tmonth', '1170', NULL, 'UNIQUE', 'BTREE', 6, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (75, 1, 86, 'i_sls97gmp_tquarter', '1171', NULL, 'UNIQUE', 'BTREE', 7, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (76, 1, 87, 'i_sls97gmp_tyear', '1172', NULL, 'UNIQUE', 'BTREE', 8, 341, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (77, 1, 88, 'i_sls97l05cust', '1191', NULL, 'UNIQUE', 'BTREE', 1, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (78, 1, 89, 'i_sls97l05prod', '1190', NULL, 'UNIQUE', 'BTREE', 2, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (79, 1, 90, 'i_sls97l05promo', '1192', NULL, 'UNIQUE', 'BTREE', 3, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (80, 1, 91, 'i_sls97l05store', '1193', NULL, 'UNIQUE', 'BTREE', 4, 344, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (81, 1, 92, 'i_sls97lc100cust', '1207', NULL, 'UNIQUE', 'BTREE', 1, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (82, 1, 93, 'i_sls97lc100prod', '1206', NULL, 'UNIQUE', 'BTREE', 2, 346, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (83, 1, 94, 'i_sls97ll01cust', '1216', NULL, 'UNIQUE', 'BTREE', 1, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (84, 1, 95, 'i_sls97ll01prod', '1214', NULL, 'UNIQUE', 'BTREE', 2, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (85, 1, 96, 'i_sls97ll01time', '1215', NULL, 'UNIQUE', 'BTREE', 3, 347, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (86, 1, 97, 'i_sls97pl01cust', '1223', NULL, 'UNIQUE', 'BTREE', 1, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (87, 1, 98, 'i_sls97pl01prod', '1221', NULL, 'UNIQUE', 'BTREE', 2, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (88, 1, 99, 'i_sls97pl01time', '1222', NULL, 'UNIQUE', 'BTREE', 3, 348, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (89, 1, 100, 'i_category_id', '1228', NULL, 'UNIQUE', 'BTREE', 1, 349, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (90, 1, 101, 'i_category_parent', '1229', NULL, 'UNIQUE', 'BTREE', 2, 349, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (91, 1, 102, 'i_currency', '1232,1233', NULL, 'UNIQUE', 'BTREE', 1, 350, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (92, 1, 103, 'i_customer_id', '1236', NULL, 'UNIQUE', 'BTREE', 1, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (93, 1, 104, 'i_cust_acct_num', '1237', NULL, 'UNIQUE', 'BTREE', 2, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (94, 1, 105, 'i_customer_fname', '1239', NULL, 'UNIQUE', 'BTREE', 3, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (95, 1, 106, 'i_customer_lname', '1238', NULL, 'UNIQUE', 'BTREE', 4, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (96, 1, 107, 'i_cust_child_home', '1257', NULL, 'UNIQUE', 'BTREE', 5, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (97, 1, 108, 'i_cust_postal_code', '1247', NULL, 'UNIQUE', 'BTREE', 6, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (98, 1, 109, 'i_cust_region_id', '1249', NULL, 'UNIQUE', 'BTREE', 7, 351, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (99, 1, 110, 'i_department_id', '1267', NULL, 'UNIQUE', 'BTREE', 1, 353, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (100, 1, 111, 'i_empl_closure', '1270,1269', NULL, 'UNIQUE', 'BTREE', 1, 354, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (101, 1, 112, 'i_empl_closure_emp', '1269', NULL, 'UNIQUE', 'BTREE', 2, 354, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (102, 1, 113, 'i_expense_store_id', '1272', NULL, 'UNIQUE', 'BTREE', 1, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (103, 1, 114, 'i_expense_acct_id', '1273', NULL, 'UNIQUE', 'BTREE', 2, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (104, 1, 115, 'i_expense_time_id', '1275', NULL, 'UNIQUE', 'BTREE', 3, 355, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (105, 1, 116, 'i_inv_97_prod_id', '1279', NULL, 'UNIQUE', 'BTREE', 1, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (106, 1, 117, 'i_inv_97_store_id', '1282', NULL, 'UNIQUE', 'BTREE', 2, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (107, 1, 118, 'i_inv_97_time_id', '1280', NULL, 'UNIQUE', 'BTREE', 3, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (108, 1, 119, 'i_inv_97_wrhse_id', '1281', NULL, 'UNIQUE', 'BTREE', 4, 356, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (109, 1, 120, 'i_inv_98_prod_id', '1289', NULL, 'UNIQUE', 'BTREE', 1, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (110, 1, 121, 'i_inv_98_store_id', '1292', NULL, 'UNIQUE', 'BTREE', 2, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (111, 1, 122, 'i_inv_98_time_id', '1290', NULL, 'UNIQUE', 'BTREE', 3, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (112, 1, 123, 'i_inv_98_wrhse_id', '1291', NULL, 'UNIQUE', 'BTREE', 4, 357, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (113, 1, 124, 'i_position_id', '1299', NULL, 'UNIQUE', 'BTREE', 1, 358, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (114, 1, 125, 'i_product_id', '1306', NULL, 'UNIQUE', 'BTREE', 1, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (115, 1, 126, 'i_prod_brand_name', '1307', NULL, 'UNIQUE', 'BTREE', 2, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (116, 1, 127, 'i_prod_class_id', '1305', NULL, 'UNIQUE', 'BTREE', 3, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (117, 1, 128, 'i_product_name', '1308', NULL, 'UNIQUE', 'BTREE', 4, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (118, 1, 129, 'i_product_sku', '1309', NULL, 'UNIQUE', 'BTREE', 5, 359, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (119, 1, 130, 'i_salary_pay_date', '1335', NULL, 'UNIQUE', 'BTREE', 1, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (120, 1, 131, 'i_salary_employee', '1336', NULL, 'UNIQUE', 'BTREE', 2, 363, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (121, 1, 132, 'i_sls_97_cust_id', '1345', NULL, 'UNIQUE', 'BTREE', 1, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (122, 1, 133, 'i_sls_97_prod_id', '1343', NULL, 'UNIQUE', 'BTREE', 2, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (123, 1, 134, 'i_sls_97_promo_id', '1346', NULL, 'UNIQUE', 'BTREE', 3, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (124, 1, 135, 'i_sls_97_store_id', '1347', NULL, 'UNIQUE', 'BTREE', 4, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (125, 1, 136, 'i_sls_97_time_id', '1344', NULL, 'UNIQUE', 'BTREE', 5, 364, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (126, 1, 137, 'i_sls_98_cust_id', '1353', NULL, 'UNIQUE', 'BTREE', 1, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (127, 1, 138, 'i_sls_1998_prod_id', '1351', NULL, 'UNIQUE', 'BTREE', 2, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (128, 1, 139, 'i_sls_1998_promo', '1354', NULL, 'UNIQUE', 'BTREE', 3, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (129, 1, 140, 'i_sls_1998_store', '1355', NULL, 'UNIQUE', 'BTREE', 4, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (130, 1, 141, 'i_sls_1998_time_id', '1352', NULL, 'UNIQUE', 'BTREE', 5, 365, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (131, 1, 142, 'i_sls_dec98_cust', '1361', NULL, 'UNIQUE', 'BTREE', 1, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (132, 1, 143, 'i_sls_dec98_prod', '1359', NULL, 'UNIQUE', 'BTREE', 2, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (133, 1, 144, 'i_sls_dec98_promo', '1362', NULL, 'UNIQUE', 'BTREE', 3, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (134, 1, 145, 'i_sls_dec98_store', '1363', NULL, 'UNIQUE', 'BTREE', 4, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (135, 1, 146, 'i_sls_dec98_time', '1360', NULL, 'UNIQUE', 'BTREE', 5, 366, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (136, 1, 147, 'i_store_id', '1368', NULL, 'UNIQUE', 'BTREE', 1, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (137, 1, 148, 'i_store_region_id', '1370', NULL, 'UNIQUE', 'BTREE', 2, 368, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (138, 1, 149, 'i_store_raggd_id', '1392', NULL, 'UNIQUE', 'BTREE', 1, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (139, 1, 150, 'i_store_rggd_reg', '1394', NULL, 'UNIQUE', 'BTREE', 2, 369, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (140, 1, 151, 'i_time_id', '1416', NULL, 'UNIQUE', 'BTREE', 1, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (141, 1, 152, 'i_time_day', '1417', NULL, 'UNIQUE', 'BTREE', 2, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (142, 1, 153, 'i_time_year', '1420', NULL, 'UNIQUE', 'BTREE', 3, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (143, 1, 154, 'i_time_quarter', '1424', NULL, 'UNIQUE', 'BTREE', 4, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_snapshot_table_idx_mysql` VALUES (144, 1, 155, 'i_time_month', '1423', NULL, 'UNIQUE', 'BTREE', 5, 370, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');

-- ----------------------------
-- Table structure for mc_snapshot_table_idx_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_idx_oracle`;
CREATE TABLE `mc_snapshot_table_idx_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `versions` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `index_id` bigint(20) NULL DEFAULT NULL,
  `index_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前索引关联的字段，可能多个，以，隔开，oracle的每个字段都还对应一个排序方式：asc，desc',
  `column_sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段对应的排序规则（对应字段）',
  `index_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引类型',
  `location` int(10) NULL DEFAULT NULL COMMENT '索引位置（当前字段的一个位置标识，每张表的索引位置都是自增，唯一的）',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mc_snapshot_table_pk_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_pk_oracle`;
CREATE TABLE `mc_snapshot_table_pk_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `versions` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `pk_id` bigint(20) NULL DEFAULT NULL COMMENT '表主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键约束名',
  `sequence_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列名（oracle自增长，全局可以唯一，或者自己创建序列）',
  `sequence_status` int(10) NULL DEFAULT NULL COMMENT '序列状态，主要是让前端更好展示',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_table_pk_oracle
-- ----------------------------
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (1, 1, 10, 'xinjian_123124_PK', NULL, 1, 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:35:15');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (2, 2, 10, 'xinjian_123124_PK', NULL, 1, 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:43:51');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (3, 3, 10, 'xinjian_123124_PK', NULL, 1, 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:44:37');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (4, 1, 11, 'rest_oracle_PK', NULL, 1, 172, 'wzl1', '2019-03-20 09:51:03', 'wzl1', '2019-03-20 09:51:03');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (5, 1, 12, 'sjeifjoi_12i34joij_PK', NULL, 1, 173, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (6, 1, 13, 'asD1234_PK', NULL, 1, 174, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (7, 1, 14, 'asD1234_sadfsdf_PK', NULL, 1, 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:02:03');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (8, 2, 14, 'asD1234_sadfsdf_PK', NULL, 1, 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:12:26');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (9, 3, 14, 'asD1234_sadfsdf_PK', NULL, 1, 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:17:36');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (10, 1, 19, 'ORACLE_TABLE_2_PK', NULL, 2, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (11, 1, 20, 'SYS_C009347', NULL, 2, 295, 'new88', '2019-03-22 16:49:08', 'new88', '2019-03-22 16:49:08');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (12, 1, 21, NULL, NULL, 1, 296, 'new88', '2019-03-22 16:49:10', 'new88', '2019-03-22 16:49:10');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (13, 1, 22, NULL, NULL, 1, 297, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 16:49:12');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (14, 1, 23, NULL, NULL, 1, 298, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 16:49:13');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (15, 1, 24, NULL, NULL, 1, 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (16, 1, 25, 'ID_PK', NULL, 2, 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (17, 1, 26, NULL, NULL, 1, 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (18, 1, 27, NULL, NULL, 1, 316, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (19, 1, 28, 'SYS_C009347', NULL, 2, 317, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (20, 1, 29, NULL, NULL, 1, 318, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (21, 1, 30, NULL, NULL, 1, 319, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_snapshot_table_pk_oracle` VALUES (22, 1, 31, NULL, NULL, 1, 320, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32');

-- ----------------------------
-- Table structure for mc_snapshot_table_set_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_set_oracle`;
CREATE TABLE `mc_snapshot_table_set_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `versions` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `set_id` bigint(20) NULL DEFAULT NULL,
  `tablespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表空间',
  `table_id` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_table_set_oracle
-- ----------------------------
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (1, 1, 10, 'USERS', 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:35:15');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (2, 2, 10, 'USERS', 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:43:51');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (3, 3, 10, 'USERS', 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:44:37');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (4, 1, 11, 'USERS', 172, 'wzl1', '2019-03-20 09:51:03', 'wzl1', '2019-03-20 09:51:03');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (5, 1, 12, 'USERS', 173, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (6, 1, 13, 'USERS', 174, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (7, 1, 14, 'USERS', 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:02:03');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (8, 2, 14, 'USERS', 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:12:26');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (9, 3, 14, 'USERS', 175, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 10:17:36');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (10, 1, 19, 'USERS', 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (11, 1, 20, 'zj_ns_1', 295, 'new88', '2019-03-22 16:49:08', 'new88', '2019-03-22 16:49:08');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (12, 1, 21, 'zj_ns_1', 296, 'new88', '2019-03-22 16:49:10', 'new88', '2019-03-22 16:49:10');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (13, 1, 22, 'USERS', 297, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 16:49:12');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (14, 1, 23, 'USERS', 298, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 16:49:13');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (15, 1, 24, 'USERS', 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (16, 1, 25, 'USERS', 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (17, 1, 26, 'USERS', 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (18, 1, 27, 'SYSTEM', 316, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (19, 1, 28, 'zj_ns_1', 317, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (20, 1, 29, 'zj_ns_1', 318, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (21, 1, 30, 'USERS', 319, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_snapshot_table_set_oracle` VALUES (22, 1, 31, 'USERS', 320, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32');

-- ----------------------------
-- Table structure for mc_snapshot_table_un_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_table_un_oracle`;
CREATE TABLE `mc_snapshot_table_un_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `versions` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `un_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一约束名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前表字段，可能有多个,以,隔开',
  `is_enabled` tinyint(1) NULL DEFAULT NULL COMMENT 'oracle 概念，是否启用，0:未启动 1:启用',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_table_un_oracle
-- ----------------------------
INSERT INTO `mc_snapshot_table_un_oracle` VALUES (1, 1, 2, 'un_cs30', '875', 1, 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');

-- ----------------------------
-- Table structure for mc_snapshot_view_detail
-- ----------------------------
DROP TABLE IF EXISTS `mc_snapshot_view_detail`;
CREATE TABLE `mc_snapshot_view_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(10) NULL DEFAULT NULL COMMENT '当前快照版本',
  `view_detail_id` bigint(20) NULL DEFAULT NULL COMMENT '视图详情id',
  `view_sql` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视图sql',
  `arithmetic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算法',
  `definiens` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义者',
  `security` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全性',
  `check_option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查选项',
  `view_id` bigint(20) NULL DEFAULT NULL COMMENT '视图基本信息id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_snapshot_view_detail
-- ----------------------------
INSERT INTO `mc_snapshot_view_detail` VALUES (3, 1, 11, 'select * from dept', 'UNDEFINED', '`oyr`@`%`', 'definer', NULL, 94);
INSERT INTO `mc_snapshot_view_detail` VALUES (4, 1, 15, 'select * from a', 'UNDEFINED', '`wzl`@`%`', 'definer', NULL, 107);
INSERT INTO `mc_snapshot_view_detail` VALUES (5, 2, 15, 'select * from a', 'MERGE', '`wzl`@`%`', 'definer', NULL, 107);
INSERT INTO `mc_snapshot_view_detail` VALUES (6, 3, 15, 'select * from a', 'MERGE', '`wzl`@`%`', 'definer', NULL, 107);
INSERT INTO `mc_snapshot_view_detail` VALUES (7, 4, 15, 'select * from a', 'MERGE', '`wzl`@`%`', 'definer', NULL, 107);
INSERT INTO `mc_snapshot_view_detail` VALUES (8, 1, 16, 'select * from a', 'UNDEFINED', '`wzl`@`%`', 'definer', NULL, 109);
INSERT INTO `mc_snapshot_view_detail` VALUES (9, 1, 17, 'select * from a', 'UNDEFINED', '`wzl`@`%`', 'definer', '', 110);
INSERT INTO `mc_snapshot_view_detail` VALUES (10, 1, 18, 'select * from a', 'UNDEFINED', '`wzl`@`%`', 'definer', NULL, 111);
INSERT INTO `mc_snapshot_view_detail` VALUES (11, 1, 21, 'select * from tes9789797', 'UNDEFINED', '`test888`@`%`', 'definer', NULL, 114);
INSERT INTO `mc_snapshot_view_detail` VALUES (12, 1, 23, 'CREATE ALGORITHM=UNDEFINED DEFINER=`wuguozhou`@`%` SQL SECURITY DEFINER VIEW `single_table` AS select `SEQ_TABLE`.`SEQ_NAME` AS `SEQ_NAME`,`SEQ_TABLE`.`SEQ_VALUE` AS `SEQ_VALUE` from `SEQ_TABLE`', 'UNDEFINED', '`wuguozhou`@`%`', 'DEFINER', NULL, 210);

-- ----------------------------
-- Table structure for mc_system_settings
-- ----------------------------
DROP TABLE IF EXISTS `mc_system_settings`;
CREATE TABLE `mc_system_settings`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_centre_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据中心管理员，（可以修改系统参数）',
  `database_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库管理员，可以修改元数据',
  `root_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'hdfs根目录',
  `is_gather` tinyint(1) NULL DEFAULT NULL COMMENT '是否自动采集',
  `gather_time` datetime(0) NULL DEFAULT NULL COMMENT '上次采集时间',
  `time_type` int(10) NULL DEFAULT NULL COMMENT '时间类型，1:每月 2:每周',
  `day` int(10) NULL DEFAULT NULL COMMENT '日',
  `hour` int(10) NULL DEFAULT NULL COMMENT '时',
  `column_show_count` int(10) NULL DEFAULT NULL COMMENT '血缘分析字段显示数量',
  `renter_id` bigint(25) NULL DEFAULT NULL COMMENT '租户id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_system_settings
-- ----------------------------
INSERT INTO `mc_system_settings` VALUES (1, '042531', '015432', 'data', 0, NULL, 1, 11, 2, 10, 527, 'new7', '2019-03-07 03:49:48', 'new7', '2019-03-07 03:49:48');
INSERT INTO `mc_system_settings` VALUES (2, '051342', '025341', 'xionghan', 0, NULL, 1, 11, 2, 10, 443, 'xionghan', '2019-03-11 01:11:28', 'xionghan1', '2019-03-19 09:21:52');
INSERT INTO `mc_system_settings` VALUES (3, '024153', '130245', 'lingjidashuju', 1, NULL, 1, 11, 2, 500, 480, 'suotianbao', '2019-03-11 02:00:05', 'suotianbao', '2019-03-11 02:00:05');
INSERT INTO `mc_system_settings` VALUES (4, '254031', '123450', 'new88', 0, NULL, 2, 10, 3, 100, 528, 'new8', '2019-03-12 01:05:24', 'new88', '2019-03-13 20:48:08');
INSERT INTO `mc_system_settings` VALUES (5, '503412', '025134', 'data', 0, NULL, 1, 11, 2, 20, 532, 'wzldemo1', '2019-03-15 14:19:58', 'wuzhongli2', '2019-03-15 14:30:34');
INSERT INTO `mc_system_settings` VALUES (6, '415320', '024531', 'new1', 1, NULL, 1, 11, 2, 450, 533, 'new1', '2019-03-20 15:20:22', 'new1', '2019-03-20 15:20:22');

-- ----------------------------
-- Table structure for mc_table_ck_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_ck_oracle`;
CREATE TABLE `mc_table_ck_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查约束名',
  `check_sql` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查语法sql',
  `is_enabled` tinyint(1) NULL DEFAULT NULL COMMENT 'oracle 概念，是否启用，0:未启动 1:启用',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `location` int(10) NULL DEFAULT NULL COMMENT '位置（当前检查约束的一个位置标识，每张表的检查约束位置都是自增，唯一的）',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:未删除 1:已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_table_ck_oracle
-- ----------------------------
INSERT INTO `mc_table_ck_oracle` VALUES (1, 'SYS_C0011438', '\"NAME\" IS NOT NULL', 1, 51, 1, 1, 'xionghan1', '2019-03-12 05:24:24', 'xionghan1', '2019-03-20 16:03:58');
INSERT INTO `mc_table_ck_oracle` VALUES (2, 'SYS_C0012513', '\"ID\" IS NOT NULL', 1, 52, 1, 1, 'xionghan1', '2019-03-12 05:24:32', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_ck_oracle` VALUES (3, 'SYS_C0010874', '\"COL_ID\" IS NOT NULL', 1, 97, 1, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_ck_oracle` VALUES (4, 'SYS_C0010873', '\"COL_SEQ\" IS NOT NULL', 1, 97, 2, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_ck_oracle` VALUES (5, 'SYS_C0010872', '\"TABLE_ID\" IS NOT NULL', 1, 97, 3, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_ck_oracle` VALUES (6, 'SYS_C0011399', '\"ID\" IS NOT NULL', 1, 133, 1, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:43');
INSERT INTO `mc_table_ck_oracle` VALUES (7, 'SYS_C0010890', '\"COLUMN_TAG\" IS NOT NULL', 1, 168, 1, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57');
INSERT INTO `mc_table_ck_oracle` VALUES (8, 'SYS_C0010889', '\"TABLE_NAME\" IS NOT NULL', 1, 168, 2, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57');
INSERT INTO `mc_table_ck_oracle` VALUES (9, 'SYS_C0010888', '\"RESOURCE_ID\" IS NOT NULL', 1, 168, 3, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57');
INSERT INTO `mc_table_ck_oracle` VALUES (10, 'SYS_C0013303', '\"id\" IS NOT NULL', 1, 271, 1, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_table_ck_oracle` VALUES (11, 'SYS_C0013304', '\"name\" IS NOT NULL', 1, 271, 2, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_table_ck_oracle` VALUES (12, 'SYS_C0013305', '\"cs_1\" IS NOT NULL', 1, 271, 3, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_table_ck_oracle` VALUES (13, 'SYS_C0011399', '\"ID\" IS NOT NULL', 1, 313, 1, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');

-- ----------------------------
-- Table structure for mc_table_column
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_column`;
CREATE TABLE `mc_table_column`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `column_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `type_length` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型长度',
  `type_precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型精度',
  `is_pk` tinyint(1) NULL DEFAULT NULL COMMENT '是否为主键 0:否,1:是',
  `is_auto_increment` tinyint(1) NULL DEFAULT NULL COMMENT '是否自增，0:否  1:是',
  `is_null` tinyint(1) NULL DEFAULT NULL COMMENT '是否允许为空 0:否 1:是',
  `default_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段描述',
  `location` int(10) NULL DEFAULT NULL COMMENT '字段位置（当前字段的一个位置标识，每张表的字段位置都是自增，唯一的）',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:否 1:是',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_partition` tinyint(1) NULL DEFAULT NULL COMMENT '是否是分区列(HIVE)',
  `index_partition` int(10) NULL DEFAULT NULL COMMENT '分区定义位置(HIVE)',
  `is_bucket` tinyint(1) NULL DEFAULT NULL COMMENT '是否作为分桶(HIVE)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `table_id`(`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1443 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_table_column
-- ----------------------------
INSERT INTO `mc_table_column` VALUES (11, 18, 'hvie', 'TINYINT', '17', NULL, 0, 0, 1, NULL, 'KK ', 1, 0, 'wzl1', '2019-03-08 23:28:49', 'wzl1', '2019-03-09 14:50:26', 0, 0, NULL);
INSERT INTO `mc_table_column` VALUES (12, 19, 'FF', 'TINYINT', '12', NULL, 0, 0, 1, NULL, 'FF', 1, 0, 'wzl1', '2019-03-08 23:39:43', 'wzl1', '2019-03-09 14:50:27', 0, 0, NULL);
INSERT INTO `mc_table_column` VALUES (13, 20, 'ceshi', 'INT', '4', '1', 0, 0, 1, NULL, 'test111', 1, 0, 'wzl1', '2019-03-08 23:51:45', 'wzl1', '2019-03-09 14:50:28', 0, 0, NULL);
INSERT INTO `mc_table_column` VALUES (14, 21, 'dd234', 'BIGINT', '4', NULL, 0, 0, 1, NULL, 'sdfsdf', 1, 0, 'wzl1', '2019-03-09 00:06:05', 'wzl1', '2019-03-09 14:50:28', 0, 0, NULL);
INSERT INTO `mc_table_column` VALUES (15, 20, 'ziduan01', 'TINYINT', '12', NULL, 0, 0, 1, NULL, 'ziduan01', 2, 0, 'wzl1', '2019-03-09 00:27:39', 'wzl1', '2019-03-09 14:50:31', 0, 0, NULL);
INSERT INTO `mc_table_column` VALUES (16, 22, 'c234', 'INT', '4', '2', 0, 0, 1, NULL, 'xdf', 1, 0, 'wzl1', '2019-03-09 00:32:59', 'wzl1', '2019-03-09 00:32:59', 1, 0, NULL);
INSERT INTO `mc_table_column` VALUES (17, 20, 'QQ', 'TINYINT', '12', NULL, 0, 0, 1, NULL, 'QQ', 3, 1, 'wzl1', '2019-03-09 00:41:01', 'wzl1', '2019-03-09 01:53:08', 1, 1, NULL);
INSERT INTO `mc_table_column` VALUES (18, 20, 'QQ', 'TINYINT', '12', NULL, 0, 0, 1, NULL, 'QQ', 3, 0, 'wzl1', '2019-03-09 00:42:25', 'wzl1', '2019-03-09 00:42:25', 1, 1, NULL);
INSERT INTO `mc_table_column` VALUES (19, 23, 'c234', 'BIGINT', '4', NULL, 0, 0, 1, NULL, 'sdf', 1, 0, 'wzl1', '2019-03-09 00:49:04', 'wzl1', '2019-03-09 00:49:04', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (20, 23, 'c234', 'BIGINT', '4', NULL, 0, 0, 1, NULL, 'sdf', 1, 0, 'wzl1', '2019-03-09 00:49:31', 'wzl1', '2019-03-09 00:49:31', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (21, 23, 'c234', 'BIGINT', '4', NULL, 0, 0, 1, NULL, 'sdf', 1, 0, 'wzl1', '2019-03-09 00:50:56', 'wzl1', '2019-03-09 00:50:56', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (22, 22, 'dd234', 'BIGINT', '4', NULL, 0, 0, 1, NULL, 'sf234', 2, 0, 'wzl1', '2019-03-09 00:52:52', 'wzl1', '2019-03-09 00:52:52', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (23, 24, 'dfdf', 'FLOAT', '2', '2', 0, 0, 1, NULL, 'dfdf', 1, 0, 'wzl1', '2019-03-09 01:00:56', 'wzl1', '2019-03-09 01:00:56', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (24, 25, 'dd234', 'BOOLEAN', NULL, NULL, 0, 0, 1, NULL, 'xdf', 1, 0, 'wzl1', '2019-03-09 01:01:51', 'wzl1', '2019-03-09 01:01:51', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (25, 26, 'robin_12', 'date', NULL, NULL, 0, 0, 1, NULL, 'KK ', 1, 0, 'wzl1', '2019-03-09 02:08:19', 'wzl1', '2019-03-09 02:08:19', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (26, 26, 'robin13', 'varchar', NULL, NULL, 0, 0, 1, NULL, 'KK', 2, 0, 'wzl1', '2019-03-09 02:08:19', 'wzl1', '2019-03-09 02:08:19', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (27, 27, 'sdf234', 'integer', NULL, NULL, 0, 0, 1, NULL, 'sdf234', 1, 0, 'wzl1', '2019-03-10 21:13:00', 'wzl1', '2019-03-10 21:13:00', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (40, 34, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 0, 'wzl1', '2019-03-10 22:38:36', 'wzl1', '2019-03-10 22:38:36', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (41, 34, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', '名字', 2, 0, 'wzl1', '2019-03-10 22:38:36', 'wzl1', '2019-03-10 22:38:36', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (56, 42, 'scasd', 'INTEGER', '20', NULL, 1, 1, 0, '', 'asdasd', 1, 0, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (57, 42, 'asdas', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'wwsad', 2, 0, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (58, 43, 'cs', 'TINYINT', '25', NULL, 0, 0, 0, '', 'sc', 1, 0, 'wzl1', '2019-03-10 22:52:35', 'wzl1', '2019-03-10 22:52:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (59, 44, 'asdasd', 'FLOAT', '5', '2', 0, 0, 0, '', 'wqdasda', 1, 1, 'wzl1', '2019-03-11 05:55:45', 'wzl1', '2019-03-20 15:38:53', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (60, 45, 'ddsw', 'INTEGER', '20', NULL, 1, 0, 0, '', 'sss', 1, 0, 'wzl1', '2019-03-11 06:03:09', 'wzl1', '2019-03-11 06:03:09', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (62, 47, 'ID', 'INTEGER', '11', NULL, 1, 1, 0, '', '序列', 1, 1, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-19 21:16:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (63, 47, 'NAME', 'VARCHAR', '255', NULL, 0, 0, 0, '', '名称', 2, 1, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-19 21:16:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (64, 47, 'AGE', 'DATETIME', NULL, NULL, 0, 0, 0, '', '年龄', 3, 1, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-19 21:16:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (65, 47, 'REMARK', 'VARCHAR', '255', NULL, 0, 0, 1, '', '备注', 4, 1, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-19 21:16:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (66, 47, 'cloumn_number', 'NUMERIC', '10', '2', 0, 0, 1, '', '列1', 5, 1, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-19 21:16:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (67, 47, 'cloumn_double', 'DOUBLE', '10', '4', 0, 0, 1, '', '列2', 6, 1, 'xionghan1', '2019-03-12 02:29:53', 'xionghan1', '2019-03-19 21:16:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (68, 48, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'xionghan1', '2019-03-12 05:19:41', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (69, 48, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-12 05:19:41', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (70, 48, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-12 05:19:41', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (71, 48, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-12 05:19:41', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (72, 49, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'xionghan1', '2019-03-12 05:19:58', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (73, 49, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-12 05:19:58', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (74, 49, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-12 05:19:58', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (75, 49, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-12 05:19:58', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (76, 50, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'xionghan1', '2019-03-12 05:20:25', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (77, 50, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-12 05:20:25', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (78, 50, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-12 05:20:25', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (79, 50, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-12 05:20:25', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (80, 51, 'AGE', 'DATE', NULL, NULL, 0, 0, 1, '', '年龄字段', 1, 1, 'xionghan1', '2019-03-12 05:24:24', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (81, 51, 'NAME', 'NUMBER', '22', '5', 0, 0, 0, '', '姓名字段', 2, 1, 'xionghan1', '2019-03-12 05:24:24', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (82, 51, 'ID', 'VARCHAR2', NULL, NULL, 1, 0, 0, '', 'id字段', 3, 1, 'xionghan1', '2019-03-12 05:24:24', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (83, 52, 'incrementA_D', 'NUMBER', NULL, '0', 0, 0, 1, '', '', 1, 1, 'xionghan1', '2019-03-12 05:24:32', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (84, 52, 'incrementA_BC', 'DATE', NULL, NULL, 0, 0, 1, '', '', 2, 1, 'xionghan1', '2019-03-12 05:24:32', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (85, 52, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 1, 'xionghan1', '2019-03-12 05:24:32', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (86, 52, 'ID', 'NUMBER', NULL, '0', 1, 0, 0, '', '', 4, 1, 'xionghan1', '2019-03-12 05:24:32', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (87, 53, 'RENTERID', 'varchar', '255', '0', 0, 0, 1, '', NULL, 1, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (88, 53, 'OWNER', 'varchar', '255', '0', 0, 0, 1, '', NULL, 2, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (89, 53, 'TYPE', 'varchar', '255', '0', 0, 0, 1, '', NULL, 3, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (90, 53, 'NAME', 'varchar', '255', '0', 0, 0, 1, '', NULL, 4, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (91, 53, 'GROUP', 'varchar', '255', '0', 0, 0, 1, '', NULL, 5, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (92, 53, 'LASTSTATUS', 'varchar', '255', '0', 0, 0, 1, '', NULL, 6, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (93, 53, 'LASTEXECTIME', 'datetime', '0', '0', 0, 0, 1, '', NULL, 7, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (94, 53, 'UPDATETIME', 'datetime', '0', '0', 0, 0, 1, '', NULL, 8, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (95, 53, 'DIRECTORY', 'varchar', '255', '0', 0, 0, 1, '', NULL, 9, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (96, 53, 'OBJECTID', 'varchar', '255', '0', 0, 0, 1, '', NULL, 10, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (97, 53, 'DESCRIPTION', 'varchar', '255', '0', 0, 0, 1, '', NULL, 11, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (98, 53, 'CREATETIME', 'datetime', '0', '0', 0, 0, 1, '', NULL, 12, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (99, 53, 'ID', 'varchar', '255', '0', 0, 0, 0, '', NULL, 13, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (100, 53, 'EXECID', 'varchar', '255', '0', 0, 0, 1, '', NULL, 14, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (101, 53, 'OPERATOR', 'varchar', '255', '0', 0, 0, 1, '', NULL, 15, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (102, 53, 'BEGIN', 'datetime', '0', '0', 0, 0, 1, '', NULL, 16, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (103, 53, 'END', 'datetime', '0', '0', 0, 0, 1, '', NULL, 17, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (104, 53, 'STATUS', 'varchar', '255', '0', 0, 0, 1, '', NULL, 18, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (105, 53, 'READLINES', 'bigint', '20', '0', 0, 0, 1, '', NULL, 19, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (106, 53, 'WRITELINES', 'bigint', '20', '0', 0, 0, 1, '', NULL, 20, 0, 'xionghan1', '2019-03-12 05:32:40', 'xionghan1', '2019-03-12 05:32:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (107, 54, 'TARGET_SERVER_ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (108, 54, 'SOURCE_SERVER_ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (109, 54, 'RESOURCE_ADDR', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (110, 54, 'ENDDATE', 'DATE', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (111, 54, 'STARTDATE', 'DATE', NULL, NULL, 0, 0, 1, '', '', 5, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (112, 54, 'ERRORS', 'NUMBER', '22', '0', 0, 0, 1, '', '', 6, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (113, 54, 'LINES_WRITTEN', 'NUMBER', '22', '0', 0, 0, 1, '', '', 7, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (114, 54, 'LINES_READ', 'NUMBER', '22', '0', 0, 0, 1, '', '', 8, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (115, 54, 'TRANSNAME', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', '', 9, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (116, 54, 'ID_BATCH', 'NUMBER', '22', '0', 0, 0, 1, '', '', 10, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (117, 54, 'TARGET_GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 11, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (118, 54, 'TARGET_GOV_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 12, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (119, 54, 'TARGETRESOURCENAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 13, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (120, 54, 'SOURCE_GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 14, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (121, 54, 'SOURCE_GOV_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 15, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (122, 54, 'SOURCERESOURCENAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 16, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (123, 54, 'TARGETTABLEID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 17, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (124, 54, 'TARGETRESOURCEID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 18, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (125, 54, 'MAINTABLE_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 19, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (126, 54, 'SOURCERESOURCEID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 20, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (127, 54, 'TRANSFORMATION_ID', 'NUMBER', '22', '0', 0, 0, 1, '', '', 21, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (128, 54, 'ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 22, 0, 'xionghan1', '2019-03-12 05:34:19', 'xionghan1', '2019-03-12 05:34:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (129, 55, 'GET_VOLUME', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-12 05:38:31', 'xionghan1', '2019-03-12 05:38:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (130, 55, 'SUPPLY_AMOUNT', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-12 05:38:31', 'xionghan1', '2019-03-12 05:38:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (131, 55, 'GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-12 05:38:31', 'xionghan1', '2019-03-12 05:38:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (132, 55, 'GON_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'xionghan1', '2019-03-12 05:38:31', 'xionghan1', '2019-03-12 05:38:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (133, 55, 'MONTH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 5, 0, 'xionghan1', '2019-03-12 05:38:31', 'xionghan1', '2019-03-12 05:38:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (134, 56, 'TARGET_GOV_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (135, 56, 'SOURCE_GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (136, 56, 'SOURCE_GOV_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (137, 56, 'TARGET_GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (138, 57, 'LINES_INPUT', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (139, 57, 'RESOURCE_ADDR', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (140, 57, 'RESOURCE_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (141, 57, 'RESOURCE_ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'xionghan1', '2019-03-12 05:38:32', 'xionghan1', '2019-03-12 05:38:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (142, 58, 'RATIO', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-12 05:38:33', 'xionghan1', '2019-03-12 05:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (143, 58, 'LINES_SUM', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-12 05:38:33', 'xionghan1', '2019-03-12 05:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (144, 58, 'LINES_WRITTEN', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-12 05:38:33', 'xionghan1', '2019-03-12 05:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (145, 58, 'GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'xionghan1', '2019-03-12 05:38:33', 'xionghan1', '2019-03-12 05:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (146, 58, 'GOV_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 5, 0, 'xionghan1', '2019-03-12 05:38:33', 'xionghan1', '2019-03-12 05:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (147, 58, 'MONTH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 6, 0, 'xionghan1', '2019-03-12 05:38:33', 'xionghan1', '2019-03-12 05:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (148, 59, 'TARGET_GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (149, 59, 'TARGET_GOV_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (150, 59, 'SOURCE_GOV_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (151, 59, 'SOURCE_GOV_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (152, 59, 'TARGETTABLEID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 5, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (153, 59, 'TARGETRESOURCEID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 6, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (154, 59, 'MAINTABLE_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 7, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (155, 59, 'SOURCERESOURCEID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 8, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (156, 59, 'ENDDATE', 'DATE', NULL, NULL, 0, 0, 1, '', '', 9, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (157, 59, 'STARTDATE', 'DATE', NULL, NULL, 0, 0, 1, '', '', 10, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (158, 59, 'MONTH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 11, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (159, 59, 'LINES_FILTER', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 12, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (160, 59, 'LINES_WRITTEN', 'NUMBER', '22', '0', 0, 0, 1, '', '', 13, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (161, 59, 'LINES_READ', 'NUMBER', '22', '0', 0, 0, 1, '', '', 14, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (162, 59, 'TRANSNAME', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', '', 15, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (163, 59, 'TRANSFORMATION_ID', 'NUMBER', '22', '0', 0, 0, 1, '', '', 16, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (164, 59, 'ID_BATCH', 'NUMBER', '22', '0', 0, 0, 1, '', '', 17, 0, 'xionghan1', '2019-03-12 05:38:34', 'xionghan1', '2019-03-12 05:38:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (165, 60, 'LINES_FILTER', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-12 05:38:35', 'xionghan1', '2019-03-12 05:38:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (166, 60, 'LINES_WRITTEN', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-12 05:38:35', 'xionghan1', '2019-03-12 05:38:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (167, 60, 'MONTH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-12 05:38:35', 'xionghan1', '2019-03-12 05:38:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (168, 44, 'ds_batch', 'VARCHAR', '255', NULL, 0, 0, 0, '', '数据批次', 2, 1, 'wzl1', '2019-03-12 21:40:26', 'wzl1', '2019-03-20 15:38:53', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (169, 44, 'ds_sync_time', 'DATETIME', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 1, 'wzl1', '2019-03-12 21:40:26', 'wzl1', '2019-03-20 15:38:53', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (170, 44, 'ds_sync_flag', 'VARCHAR', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 1, 'wzl1', '2019-03-12 21:40:26', 'wzl1', '2019-03-20 15:38:53', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (180, 65, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 0, 'wzl1', '2019-03-12 22:57:44', 'wzl1', '2019-03-12 22:57:44', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (181, 65, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', '部门名', 2, 0, 'wzl1', '2019-03-12 22:57:44', 'wzl1', '2019-03-12 22:57:44', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (191, 69, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-12 22:53:00', 'robin', '2019-03-12 22:53:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (192, 69, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-12 22:53:00', 'robin', '2019-03-12 22:53:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (193, 69, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-12 22:53:00', 'robin', '2019-03-12 22:53:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (194, 70, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-12 22:56:01', 'robin', '2019-03-12 22:56:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (195, 70, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-12 22:56:01', 'robin', '2019-03-12 22:56:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (196, 70, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-12 22:56:01', 'robin', '2019-03-12 22:56:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (197, 71, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-12 22:57:20', 'robin', '2019-03-12 22:57:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (198, 71, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-12 22:57:20', 'robin', '2019-03-12 22:57:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (199, 71, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-12 22:57:20', 'robin', '2019-03-12 22:57:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (200, 34, 'address', 'VARCHAR', '50', NULL, 0, 0, 0, '', '地址', 3, 0, 'wzl1', '2019-03-13 03:27:09', 'wzl1', '2019-03-13 03:27:09', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (201, 74, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-13 03:50:24', 'robin', '2019-03-13 03:50:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (202, 74, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-13 03:50:24', 'robin', '2019-03-13 03:50:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (203, 74, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-13 03:50:24', 'robin', '2019-03-13 03:50:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (204, 75, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-13 03:51:23', 'robin', '2019-03-13 03:51:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (205, 75, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-13 03:51:23', 'robin', '2019-03-13 03:51:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (206, 75, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-13 03:51:23', 'robin', '2019-03-13 03:51:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (207, 76, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-13 04:02:13', 'robin', '2019-03-13 04:02:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (208, 76, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-13 04:02:13', 'robin', '2019-03-13 04:02:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (209, 76, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-13 04:02:13', 'robin', '2019-03-13 04:02:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (210, 77, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-13 04:06:20', 'robin', '2019-03-13 04:06:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (211, 77, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-13 04:06:20', 'robin', '2019-03-13 04:06:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (212, 77, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-13 04:06:20', 'robin', '2019-03-13 04:06:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (213, 78, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-13 04:08:14', 'robin', '2019-03-13 04:08:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (214, 78, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-13 04:08:14', 'robin', '2019-03-13 04:08:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (215, 78, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-13 04:08:14', 'robin', '2019-03-13 04:08:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (216, 79, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 0, 'robin', '2019-03-13 04:09:36', 'robin', '2019-03-13 04:09:36', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (217, 79, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 0, 'robin', '2019-03-13 04:09:36', 'robin', '2019-03-13 04:09:36', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (218, 79, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 0, 'robin', '2019-03-13 04:09:36', 'robin', '2019-03-13 04:09:36', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (219, 82, 'asdasd', 'NUMBER', '5', NULL, 0, 0, 0, '', 'wqdasda', 1, 1, 'robin', '2019-03-13 04:27:58', 'robin', '2019-03-19 17:21:54', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (220, 82, 'ds_batch', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据批次', 2, 1, 'robin', '2019-03-13 04:27:58', 'robin', '2019-03-19 17:21:54', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (221, 82, 'ds_sync_time', 'DATE', NULL, NULL, 0, 0, 0, '', '数据时间', 3, 1, 'robin', '2019-03-13 04:27:58', 'robin', '2019-03-19 17:21:54', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (222, 82, 'ds_sync_flag', 'VARCHAR2', '255', NULL, 0, 0, 0, '', '数据同步标志', 4, 1, 'robin', '2019-03-13 04:27:58', 'robin', '2019-03-19 17:21:54', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (223, 87, 'D', 'integer', NULL, NULL, 0, 0, 1, NULL, 'D', 1, 0, 'new88', '2019-03-14 03:19:05', 'new88', '2019-03-14 03:19:05', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (224, 87, 'A', 'double', NULL, NULL, 1, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-14 03:19:05', 'new88', '2019-03-14 03:19:05', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (225, 88, 's', 'date', NULL, NULL, 0, 0, 1, NULL, 's', 1, 0, 'new88', '2019-03-14 03:32:51', 'new88', '2019-03-14 03:32:51', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (226, 88, 'w', 'integer', NULL, NULL, 1, 0, 1, NULL, 'w', 2, 0, 'new88', '2019-03-14 03:32:51', 'new88', '2019-03-14 03:32:51', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (227, 89, 's', 'date', NULL, NULL, 0, 0, 1, NULL, 's', 1, 0, 'new88', '2019-03-14 03:34:30', 'new88', '2019-03-14 03:34:30', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (228, 89, 'w', 'integer', NULL, NULL, 1, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-14 03:34:30', 'new88', '2019-03-14 03:34:30', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (229, 90, 'S', 'DOUBLE', '3', '2', 0, 0, 1, NULL, 'W', 1, 0, 'new88', '2019-03-14 03:39:42', 'new88', '2019-03-14 03:39:42', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (230, 91, 'S', 'BOOLEAN', NULL, NULL, 0, 0, 1, NULL, 'S', 1, 0, 'new88', '2019-03-14 03:53:19', 'new88', '2019-03-14 03:53:19', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (235, 94, 'id', 'bigint', '20', '0', 0, 0, 0, '', NULL, 1, 0, 'wzl1', '2019-03-15 11:09:29', 'wzl1', '2019-03-15 11:09:29', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (236, 94, 'name', 'varchar', '25', '0', 0, 0, 0, '', NULL, 2, 0, 'wzl1', '2019-03-15 11:09:29', 'wzl1', '2019-03-15 11:09:29', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (237, 95, 'EXECID', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (238, 95, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (239, 95, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (240, 95, 'OPERATOR', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (241, 95, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (242, 95, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (243, 95, 'BEGIN', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (244, 95, 'END', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 8, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (245, 95, 'STATUS', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 9, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (246, 95, 'READLINES', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 10, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (247, 95, 'WRITELINES', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 11, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (248, 95, 'OTHERLINES', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 12, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (249, 95, 'ID', 'varchar', '255', NULL, 1, 0, 0, '', '', 13, 1, 'xionghan1', '2019-03-15 11:56:59', 'xionghan1', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (250, 96, 'SEQ_NAME', 'varchar', '50', '0', 0, 0, 0, '', NULL, 1, 0, 'xionghan1', '2019-03-15 12:02:24', 'xionghan1', '2019-03-15 12:02:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (251, 96, 'SEQ_VALUE', 'int', '11', '0', 0, 0, 0, '', NULL, 2, 0, 'xionghan1', '2019-03-15 12:02:24', 'xionghan1', '2019-03-15 12:02:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (252, 97, 'COL_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, 'NULL ', '', 1, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (253, 97, 'COL_ID', 'VARCHAR2', NULL, NULL, 1, 0, 0, '', '', 2, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (254, 97, 'COL_SEQ', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', '', 3, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (255, 97, 'TABLE_ID', 'VARCHAR2', NULL, NULL, 1, 0, 0, '', '', 4, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (256, 97, 'DESCRIBE', 'VARCHAR2', NULL, NULL, 0, 0, 1, 'NULL ', '', 5, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (257, 97, 'ISFK', 'VARCHAR2', NULL, NULL, 0, 0, 1, 'NULL ', '', 6, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (258, 97, 'ISPK', 'VARCHAR2', NULL, NULL, 0, 0, 1, 'NULL ', '', 7, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (259, 97, 'LENGTH', 'VARCHAR2', NULL, NULL, 0, 0, 1, 'NULL ', '', 8, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (260, 97, 'TYPE', 'VARCHAR2', NULL, NULL, 0, 0, 1, 'NULL ', '', 9, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (261, 98, 'ENDDATE', 'DATE', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (262, 98, 'STARTDATE', 'DATE', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (263, 98, 'RATIO', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (264, 98, 'LINES_FILTER', 'NUMBER', '22', '0', 0, 0, 1, '', '', 4, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (265, 98, 'LINES_WRITTEN', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 5, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (266, 98, 'LINES_READ', 'NUMBER', '22', '0', 0, 0, 1, '', '', 6, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (267, 98, 'TABLE_FILTER', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 7, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (268, 98, 'TRANSNAME', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', '', 8, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (269, 98, 'FILTERVALUE', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 9, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (270, 98, 'FILTERTYPE', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 10, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (271, 98, 'FILTERROWS', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 11, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (272, 98, 'FROMTABLE_IDS', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 12, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (273, 98, 'MAINTABLE_ID', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 13, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (274, 98, 'JOBNAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 14, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (275, 98, 'CREATED_USER', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 15, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (276, 98, 'TRANSFORMATION_ID', 'NUMBER', '22', '0', 0, 0, 1, '', '', 16, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (277, 98, 'ID_BATCH', 'NUMBER', '22', '0', 0, 0, 1, '', '', 17, 0, 'xionghan1', '2019-03-15 12:04:31', 'xionghan1', '2019-03-15 12:04:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (278, 99, 's', 'varchar', NULL, NULL, 0, 0, 1, NULL, 's', 1, 0, 'new88', '2019-03-15 16:19:02', 'new88', '2019-03-15 16:19:02', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (279, 99, 'sss', 'double', NULL, NULL, 1, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-15 16:19:02', 'new88', '2019-03-15 16:19:02', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (280, 100, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (281, 100, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (282, 100, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (283, 100, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (284, 100, 'GROUP', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (285, 100, 'LASTSTATUS', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (286, 100, 'LASTEXECTIME', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (287, 100, 'UPDATETIME', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 8, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (288, 100, 'DIRECTORY', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 9, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (289, 100, 'OBJECTID', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 10, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (290, 100, 'DESCRIPTION', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 11, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (291, 100, 'CREATETIME', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 12, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (292, 100, 'ID', 'varchar', '255', NULL, 1, 0, 0, '', '', 13, 1, 'oyr', '2019-03-15 16:35:22', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (293, 101, 'ID', 'int', '8', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'oyr', '2019-03-15 16:39:12', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (294, 101, 'COL1', 'varchar', '30', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'oyr', '2019-03-15 16:39:12', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (295, 101, 'COL2', 'varchar', '30', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'oyr', '2019-03-15 16:39:12', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (296, 102, 's', 'INTEGER', '11', NULL, 1, 0, 0, '', 's', 1, 1, 'new88', '2019-03-15 17:03:21', 'new88', '2019-03-21 11:06:11', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (297, 102, 'i', 'DOUBLE', '12', '2', 0, 0, 0, '0', '数字', 2, 1, 'new88', '2019-03-15 17:34:08', 'new88', '2019-03-21 11:06:11', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (298, 103, 'sdf234', 'INTEGER', '5', NULL, 0, 0, 0, '', 'sdf', 1, 1, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-20 15:38:55', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (299, 104, 'dd234', 'INTEGER', '6', NULL, 0, 0, 0, '', 'id', 1, 0, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (300, 106, 'a', 'VARCHAR', '11', NULL, 0, 0, 0, '', 'a', 1, 1, 'new88', '2019-03-18 10:37:37', 'new88', '2019-03-19 11:07:49', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (301, 107, 'a', 'varchar', '11', '0', 0, 0, 0, '', NULL, 1, 1, 'new88', '2019-03-18 10:38:18', 'new88', '2019-03-18 10:54:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (302, 107, 'a', 'varchar', '11', '0', 0, 0, 0, '', NULL, 2, 1, 'new88', '2019-03-18 10:38:50', 'new88', '2019-03-18 10:54:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (303, 107, 'a', 'varchar', '11', '0', 0, 0, 0, '', NULL, 3, 1, 'new88', '2019-03-18 10:38:54', 'new88', '2019-03-18 11:03:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (304, 108, 'bb', 'INTEGER', '11', NULL, 0, 0, 0, '', 'bb', 1, 1, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (305, 108, 'cc', 'VARCHAR', '122', NULL, 0, 0, 0, '', 'cc', 2, 1, 'new88', '2019-03-18 10:39:53', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (306, 107, 'a', 'varchar', '11', '0', 0, 0, 0, '', NULL, 4, 0, 'new88', '2019-03-18 10:47:59', 'new88', '2019-03-18 10:47:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (307, 109, 'a', 'varchar', '11', '0', 0, 0, 0, '', NULL, 1, 0, 'new88', '2019-03-18 10:50:50', 'new88', '2019-03-18 10:50:50', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (308, 110, 'a', 'varchar', '11', '0', 0, 0, 0, '', NULL, 1, 0, 'new88', '2019-03-18 10:51:25', 'new88', '2019-03-18 10:51:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (309, 111, 'a', 'varchar', '11', '0', 0, 0, 0, '', NULL, 1, 0, 'new88', '2019-03-18 10:52:22', 'new88', '2019-03-18 10:52:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (310, 114, 's', 'int', '11', '0', 0, 0, 0, '', NULL, 1, 0, 'new88', '2019-03-18 14:42:03', 'new88', '2019-03-18 14:42:03', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (311, 114, 'i', 'double', '12', '2', 0, 0, 0, '0.00', NULL, 2, 0, 'new88', '2019-03-18 14:42:03', 'new88', '2019-03-18 14:42:03', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (312, 132, 'ID', 'NUMBER', '22', '0', 0, 0, 1, '', 'id', 1, 1, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (313, 132, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'name', 2, 1, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (314, 132, 'FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'flag', 3, 1, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (315, 132, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_batch', 4, 1, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (316, 132, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 1, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (317, 132, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 1, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (318, 133, 'ID', 'NUMBER', '22', '0', 1, 0, 0, '', '', 1, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (319, 133, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (320, 133, 'ADDRESS', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (321, 133, 'CREATE_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', '', 4, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (322, 133, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 5, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (323, 133, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', '', 6, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (324, 133, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 7, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (325, 134, 'ID', 'NUMBER', '22', '0', 0, 0, 1, '', 'id', 1, 1, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (326, 134, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'name', 2, 1, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (327, 134, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_batch', 3, 1, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (328, 134, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 4, 1, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (329, 134, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 5, 1, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (330, 134, 'A', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'a', 6, 1, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (333, 139, 'NAME', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 1, 'oyr', '2019-03-19 13:58:37', 'oyr', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (338, 142, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 1, 'wzl1', '2019-03-19 14:21:49', 'wzl1', '2019-03-19 15:57:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (339, 142, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', '用户名', 2, 1, 'wzl1', '2019-03-19 14:21:49', 'wzl1', '2019-03-19 15:57:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (340, 143, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', '主键', 1, 1, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 15:29:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (341, 143, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', '外键', 2, 1, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 15:29:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (342, 144, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'zz', 1, 1, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:35:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (343, 144, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'ddsad', 2, 1, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:35:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (344, 145, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'u_id', 1, 1, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:47:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (345, 146, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'ddd', 1, 1, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:52:45', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (346, 147, 'u_id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'u_id', 1, 1, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:57:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (347, 148, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'ttt', 1, 0, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (348, 148, 'name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'asdad', 2, 0, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (349, 148, 'class_name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'vasdiojoasd', 3, 0, 'wzl1', '2019-03-19 15:52:13', 'wzl1', '2019-03-19 15:52:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (350, 149, 'id', 'BIGINT', '20', NULL, 1, 0, 0, '', 'jaiosd', 1, 0, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (351, 149, 'grade', 'INT', '20', NULL, 0, 0, 0, '', 'assdqw', 2, 0, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (352, 149, 'username', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'asdasd', 3, 0, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (353, 149, 'class_name', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'asdqwdas', 4, 0, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (354, 152, 'a', 'VARCHAR', '25', NULL, 0, 0, 0, '', 'a', 1, 1, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (355, 152, 's', 'INTEGER', '11', NULL, 0, 0, 0, '', 's', 2, 1, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (358, 154, 'a', 'INTEGER', '11', NULL, 0, 0, 0, '', 'a', 1, 1, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (359, 154, 'b', 'VARCHAR', '255', NULL, 0, 0, 0, '', 'b', 2, 1, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (390, 161, 'name', 'NUMERIC', '7', '5', 1, 0, 0, '', 'ijisjef', 1, 1, 'new88', '2019-03-19 17:43:44', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (391, 163, 'ID', 'varchar', '50', NULL, 1, 0, 0, '', '', 1, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (392, 163, 'NAME', 'varchar', '50', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (393, 163, 'AGE', 'decimal', '50', '0', 0, 0, 1, 'NULL', '', 3, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (394, 163, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (395, 164, 'ID', 'varchar', '50', NULL, 1, 0, 0, '', '', 1, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (396, 164, 'NAME', 'varchar', '50', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (397, 164, 'AGE', 'decimal', '50', '0', 0, 0, 1, 'NULL', '', 3, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (398, 164, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'oyr', '2019-03-19 20:54:41', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (399, 165, 'dept', 'varchar', '100', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'oyr', '2019-03-19 21:00:19', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (400, 165, 'level', 'int', '2', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'oyr', '2019-03-19 21:00:19', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (401, 165, 'year', 'varchar', '8', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'oyr', '2019-03-19 21:00:19', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (402, 165, 'rating', 'double', '4', '2', 0, 0, 1, 'NULL', '', 4, 1, 'oyr', '2019-03-19 21:00:19', 'oyr', '2019-03-20 15:42:19', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (403, 166, 'id', 'int', '10', NULL, 1, 0, 0, '\'0\'', '\'ID\'', 1, 1, 'oyr', '2019-03-19 21:00:41', 'oyr', '2019-03-20 15:42:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (404, 166, 'i5', 'int', '10', NULL, 0, 0, 1, 'NULL', '\'i5\'', 2, 1, 'oyr', '2019-03-19 21:00:41', 'oyr', '2019-03-20 15:42:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (405, 166, 'model', 'int', '10', NULL, 0, 0, 1, 'NULL', '\'模型\'', 3, 1, 'oyr', '2019-03-19 21:00:41', 'oyr', '2019-03-20 15:42:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (406, 166, 'i3', 'int', '10', NULL, 0, 0, 1, 'NULL', '\'i3\'', 4, 1, 'oyr', '2019-03-19 21:00:41', 'oyr', '2019-03-20 15:42:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (407, 168, 'MATCH_META', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 1, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (408, 168, 'RECOMMEND_META', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (409, 168, 'MATCH_RESULT', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (410, 168, 'COLUMN_DESIGN_TYPE', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 4, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (411, 168, 'COLUMN_TYPE', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 5, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (412, 168, 'COLUMN_LENGTH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 6, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (413, 168, 'COLUMN_TAG', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', '', 7, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (414, 168, 'TABLE_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', '', 8, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (415, 168, 'RESOURCE_ID', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', '', 9, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (416, 168, 'COLUMN_NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 10, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (417, 169, 'RENTERID', 'varchar', '255', '0', 0, 0, 1, '', NULL, 1, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (418, 169, 'OWNER', 'varchar', '255', '0', 0, 0, 1, '', NULL, 2, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (419, 169, 'TYPE', 'varchar', '255', '0', 0, 0, 1, '', NULL, 3, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (420, 169, 'NAME', 'varchar', '255', '0', 0, 0, 1, '', NULL, 4, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (421, 169, 'GROUP', 'varchar', '255', '0', 0, 0, 1, '', NULL, 5, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (422, 169, 'LASTSTATUS', 'varchar', '255', '0', 0, 0, 1, '', NULL, 6, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (423, 169, 'LASTEXECTIME', 'datetime', '0', '0', 0, 0, 1, '', NULL, 7, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (424, 169, 'UPDATETIME', 'datetime', '0', '0', 0, 0, 1, '', NULL, 8, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (425, 169, 'DIRECTORY', 'varchar', '255', '0', 0, 0, 1, '', NULL, 9, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (426, 169, 'OBJECTID', 'varchar', '255', '0', 0, 0, 1, '', NULL, 10, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (427, 169, 'DESCRIPTION', 'varchar', '255', '0', 0, 0, 1, '', NULL, 11, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (428, 169, 'CREATETIME', 'datetime', '0', '0', 0, 0, 1, '', NULL, 12, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (429, 169, 'ID', 'varchar', '255', '0', 0, 0, 0, '', NULL, 13, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (430, 169, 'EXECID', 'varchar', '255', '0', 0, 0, 1, '', NULL, 14, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (431, 169, 'OPERATOR', 'varchar', '255', '0', 0, 0, 1, '', NULL, 15, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (432, 169, 'BEGIN', 'datetime', '0', '0', 0, 0, 1, '', NULL, 16, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (433, 169, 'END', 'datetime', '0', '0', 0, 0, 1, '', NULL, 17, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (434, 169, 'STATUS', 'varchar', '255', '0', 0, 0, 1, '', NULL, 18, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (435, 169, 'READLINES', 'bigint', '20', '0', 0, 0, 1, '', NULL, 19, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (436, 169, 'WRITELINES', 'bigint', '20', '0', 0, 0, 1, '', NULL, 20, 0, 'oyr', '2019-03-19 21:02:20', 'oyr', '2019-03-19 21:02:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (437, 170, 'account_id', 'int', '11', NULL, 0, 0, 0, '', '', 1, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (438, 170, 'account_parent', 'int', '11', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (439, 170, 'account_description', 'varchar', '30', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (440, 170, 'account_type', 'varchar', '30', NULL, 0, 0, 0, '', '', 4, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (441, 170, 'account_rollup', 'varchar', '30', NULL, 0, 0, 0, '', '', 5, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (442, 170, 'Custom_Members', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (443, 171, 'xcv234', 'NUMERIC', '5', '2', 0, 0, 0, '', '234', 1, 0, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:35:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (444, 172, 'zsadf', 'NUMERIC', '5', '5', 0, 0, 0, '', 'sdf', 1, 1, 'wzl1', '2019-03-20 09:51:03', 'wzl1', '2019-03-20 10:22:02', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (445, 173, 'aasdf234', 'CHAR', '6', NULL, 0, 0, 0, '', 'sdf', 1, 0, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (446, 174, 'asdf234', 'NUMBER', '5', '5', 0, 0, 0, '', 'sadf234', 1, 0, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (447, 175, 'asdf234', 'NUMBER', '5', '5', 0, 0, 0, '', 'sadf234', 1, 1, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 15:38:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (448, 176, 'xx234', 'NUMBER', '6', '2', 0, 0, 0, '', 'asdf234', 1, 0, 'wzl1', '2019-03-20 10:05:21', 'wzl1', '2019-03-20 10:05:21', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (449, 177, 'xcv234', 'BIGINT', '6', NULL, 0, 0, 1, NULL, 'sadf234', 1, 0, 'wzl1', '2019-03-20 11:22:16', 'wzl1', '2019-03-20 11:22:16', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (450, 178, 'xcv234', 'BIGINT', '6', NULL, 0, 0, 1, NULL, 'sadf234', 1, 0, 'wzl1', '2019-03-20 11:22:30', 'wzl1', '2019-03-20 11:22:30', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (451, 179, 'id', 'int', '11', NULL, 1, 1, 0, '', '\'主键\'', 1, 1, 'new88', '2019-03-20 13:48:17', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (452, 179, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名1\'', 2, 1, 'new88', '2019-03-20 13:48:17', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (453, 179, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名2\'', 3, 1, 'new88', '2019-03-20 13:48:17', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (454, 179, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名3\'', 4, 1, 'new88', '2019-03-20 13:48:17', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (455, 179, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名4\'', 5, 1, 'new88', '2019-03-20 13:48:17', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (456, 179, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'new88', '2019-03-20 13:48:17', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (457, 180, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (458, 180, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (459, 180, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (460, 180, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (461, 180, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (462, 181, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (463, 181, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (464, 181, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (465, 181, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (466, 181, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (467, 181, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (468, 182, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (469, 182, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (470, 182, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (471, 182, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (472, 182, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (473, 182, 'newCloum', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (474, 183, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (475, 183, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (476, 183, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (477, 183, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (478, 183, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (479, 183, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (480, 183, 'date_time', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 1, 'new88', '2019-03-20 13:53:28', 'new88', '2019-03-21 14:11:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (484, 187, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (485, 187, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (486, 187, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (487, 187, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (488, 187, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (489, 188, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (490, 188, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (491, 188, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (492, 188, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (493, 188, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (494, 188, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (495, 188, 'date_time', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 1, 'xionghan1', '2019-03-20 15:27:24', 'xionghan1', '2019-03-20 15:52:40', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (496, 189, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (497, 189, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (498, 189, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (499, 189, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (500, 189, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (501, 190, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (502, 190, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (503, 190, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (504, 190, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (505, 190, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (506, 190, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (507, 190, 'date_time', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 1, 'xionghan1', '2019-03-20 15:37:38', 'xionghan1', '2019-03-20 15:54:38', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (508, 193, 'id', 'int', '11', NULL, 1, 1, 0, '', '\'主键\'', 1, 1, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (509, 193, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名1\'', 2, 1, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (510, 193, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名2\'', 3, 1, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (511, 193, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名3\'', 4, 1, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (512, 193, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名4\'', 5, 1, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (513, 193, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'xionghan1', '2019-03-20 15:49:01', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (514, 194, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 1, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (515, 194, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (516, 194, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (517, 194, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (518, 194, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 1, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (519, 194, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (520, 194, 'date_time', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 1, 'xionghan1', '2019-03-20 15:49:02', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (521, 195, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (522, 195, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (523, 195, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (524, 195, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-20 15:52:09', 'xionghan1', '2019-03-20 16:14:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (525, 196, 'id', 'int', '11', NULL, 1, 1, 0, '', '\'主键\'', 1, 1, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 16:17:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (526, 196, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名1\'', 2, 1, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 16:17:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (527, 196, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名2\'', 3, 1, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 16:17:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (528, 196, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名3\'', 4, 1, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 16:17:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (529, 196, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'域名4\'', 5, 1, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 16:17:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (530, 196, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 1, 'xionghan1', '2019-03-20 15:59:21', 'xionghan1', '2019-03-20 16:17:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (531, 197, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 0, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (532, 197, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 0, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (533, 197, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 0, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (534, 197, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 0, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (535, 197, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 0, 'xionghan1', '2019-03-20 16:02:17', 'xionghan1', '2019-03-20 16:02:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (536, 198, 'id', 'int', '11', NULL, 1, 1, 0, '', '', 1, 0, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (537, 198, 'excelFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 0, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (538, 198, 'accessFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 3, 0, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (539, 198, 'TxtFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 4, 0, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (540, 198, 'CsvFileName', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 5, 0, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (541, 198, 'cccc', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 6, 0, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (542, 198, 'date_time', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 7, 0, 'xionghan1', '2019-03-20 16:02:18', 'xionghan1', '2019-03-20 16:02:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (543, 199, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 1, 1, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:40:37', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (544, 199, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '', 2, 1, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:40:37', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (545, 199, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '', 3, 1, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:40:37', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (546, 199, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '', 4, 1, 'xionghan1', '2019-03-20 16:12:29', 'xionghan1', '2019-03-20 16:40:37', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (547, 200, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 1, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:43:02', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (548, 200, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 1, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:43:02', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (549, 200, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 1, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:43:02', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (550, 200, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 1, 'xionghan1', '2019-03-20 16:25:26', 'xionghan1', '2019-03-20 16:43:02', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (551, 201, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 1, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:45:56', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (552, 201, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 1, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:45:56', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (553, 201, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 1, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:45:56', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (554, 201, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 1, 'xionghan1', '2019-03-20 16:28:41', 'xionghan1', '2019-03-20 16:45:56', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (555, 202, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 1, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:47:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (556, 202, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 1, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:47:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (557, 202, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 1, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:47:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (558, 202, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 1, 'xionghan1', '2019-03-20 16:30:49', 'xionghan1', '2019-03-20 16:47:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (559, 203, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 1, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:48:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (560, 203, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 1, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:48:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (561, 203, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 1, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:48:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (562, 203, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 1, 'xionghan1', '2019-03-20 16:31:54', 'xionghan1', '2019-03-20 16:48:35', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (563, 204, 'ID', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'传\'', 1, 1, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:53:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (564, 204, 'NAME', 'varchar', '255', NULL, 0, 0, 1, 'NULL', '\'人\'', 2, 1, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:53:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (565, 204, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, 'NULL', '\'他\'', 3, 1, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:53:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (566, 204, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, 'NULL', '\'我\'', 4, 1, 'xionghan1', '2019-03-20 16:35:55', 'xionghan1', '2019-03-20 16:53:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (567, 205, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'传\'', 1, 1, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:59:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (568, 205, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'人\'', 2, 1, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:59:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (569, 205, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'他\'', 3, 1, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:59:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (570, 205, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'我\'', 4, 1, 'xionghan1', '2019-03-20 16:38:28', 'xionghan1', '2019-03-20 16:59:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (572, 207, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'dasidasd', 1, 1, 'xionghan1', '2019-03-20 16:44:57', 'xionghan1', '2019-03-20 17:14:36', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (573, 161, 'asdf234', 'DECIMAL', '5', '3', 0, 0, 0, '', 'asdf234', 2, 1, 'new88', '2019-03-20 16:50:53', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (574, 207, 'oasdi', 'INT', '10', NULL, 0, 0, 0, '', 'wadas', 2, 1, 'xionghan1', '2019-03-20 16:53:13', 'xionghan1', '2019-03-20 17:14:36', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (575, 161, 'dd234234', 'TINYINT', '4', NULL, 0, 0, 0, '', 'sdfsdf', 3, 1, 'new88', '2019-03-20 16:58:38', 'new88', '2019-03-20 17:14:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (576, 208, 'ID', 'bigint', '20', NULL, 0, 0, 1, '', '啊实打实的', 1, 1, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-21 15:36:53', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (577, 208, 'NAME', 'varchar', '255', NULL, 0, 0, 1, '', '啊实打实的', 2, 1, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-21 15:36:53', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (578, 208, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '\'伟大时代\'', 3, 1, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 17:15:56', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (579, 208, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, '', '阿斯顿娃娃信息新', 4, 1, 'xionghan1', '2019-03-20 16:59:19', 'xionghan1', '2019-03-20 17:15:56', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (580, 209, 'id', 'BIGINT', '50', NULL, 1, 0, 0, '', '主键', 1, 1, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:29:03', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (581, 209, 'name', 'BIGINT', '25', NULL, 0, 0, 0, '', 'sadasd', 2, 1, 'xionghan1', '2019-03-20 17:03:36', 'xionghan1', '2019-03-20 17:29:03', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (582, 210, 'SEQ_NAME', 'varchar', '50', '0', 0, 0, 0, NULL, NULL, 1, 0, 'xionghan1', '2019-03-20 17:19:06', 'xionghan1', '2019-03-20 17:19:06', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (583, 210, 'SEQ_VALUE', 'int', '11', '0', 0, 0, 0, NULL, NULL, 2, 0, 'xionghan1', '2019-03-20 17:19:06', 'xionghan1', '2019-03-20 17:19:06', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (585, 42, 'cxza', 'INTEGER', '20', NULL, 0, 0, 0, '', 'cxza', 3, 0, 'wzl1', '2019-03-20 18:43:50', 'wzl1', '2019-03-20 18:43:50', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (586, 212, 'id', 'INTEGER', '20', NULL, 0, 0, 0, '', '啊是大', 1, 1, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 19:02:55', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (587, 212, 'name', 'VARCHAR', '20', NULL, 0, 0, 0, '', '啊是大', 2, 1, 'wzl1', '2019-03-20 18:45:22', 'wzl1', '2019-03-20 19:02:55', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (588, 213, 'id', 'BIGINT', '20', NULL, 0, 0, 0, '', 'asdasd', 1, 1, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 19:10:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (589, 213, 'asc', 'BIGINT', '25', NULL, 0, 0, 0, '', 'asd', 2, 1, 'wzl1', '2019-03-20 18:48:08', 'wzl1', '2019-03-20 19:10:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (590, 214, 'id', 'INTEGER', '20', NULL, 1, 1, 0, '', 'iansd', 1, 1, 'wzl1', '2019-03-20 18:56:36', 'wzl1', '2019-03-20 19:41:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (591, 216, 'asd', 'FLOAT', '5', '2', 0, 0, 0, '', '165', 1, 0, 'wzl1', '2019-03-21 09:50:51', 'wzl1', '2019-03-21 09:50:51', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (592, 217, 'asdv234', 'FLOAT', '5', '5', 0, 0, 0, '', 'asdf234', 1, 1, 'new88', '2019-03-21 10:01:45', 'new88', '2019-03-21 11:06:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (593, 219, 'cardID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 1, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 15:36:51', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (594, 219, 'phone', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 1, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 15:36:51', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (595, 219, 'date', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 1, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 15:36:51', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (596, 219, 'character', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 1, 'xionghan1', '2019-03-21 10:35:45', 'xionghan1', '2019-03-21 15:36:51', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (597, 220, 'a', 'INT', '11', NULL, 0, 0, 1, NULL, 'a', 1, 0, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (598, 220, 'b', 'STRING', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 0, 'new88', '2019-03-21 11:48:05', 'new88', '2019-03-21 11:48:05', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (599, 221, 's', 'integer', NULL, NULL, 1, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-21 11:52:38', 'new88', '2019-03-21 11:52:38', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (600, 221, 'b', 'varchar', NULL, NULL, 0, 0, 1, NULL, 'b', 2, 0, 'new88', '2019-03-21 11:52:38', 'new88', '2019-03-21 11:52:38', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (601, 221, 'c', 'date', NULL, NULL, 0, 0, 1, NULL, 'c', 3, 0, 'new88', '2019-03-21 11:52:38', 'new88', '2019-03-21 11:52:38', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (602, 222, 'swwwww2222', 'integer', NULL, NULL, 0, 0, 1, NULL, 's', 1, 0, 'new88', '2019-03-21 12:18:09', 'new88', '2019-03-21 12:18:09', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (603, 222, 'wwwww', 'varchar', NULL, NULL, 1, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-21 12:18:09', 'new88', '2019-03-21 12:18:09', 0, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (608, 225, 'aa', 'INTEGER', '11', NULL, 0, 0, 0, '', 'aa', 1, 0, 'new88', '2019-03-21 14:54:05', 'new88', '2019-03-21 14:54:05', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (609, 225, 'dd', 'VARCHAR', '200', NULL, 0, 0, 0, '', 'dd', 2, 0, 'new88', '2019-03-21 14:54:05', 'new88', '2019-03-21 14:54:05', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (610, 226, 'field1', 'int', '4', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-21 14:54:37', 'new88', '2019-03-21 14:54:37', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (611, 227, 'a', 'INTEGER', '11', NULL, 0, 0, 0, '', 'a', 1, 0, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (612, 227, 'b', 'LONGTEXT', NULL, NULL, 0, 0, 0, '', 'b', 2, 0, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (613, 228, 'EXECID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (614, 228, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (615, 228, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (616, 228, 'OPERATOR', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (617, 228, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (618, 228, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (619, 228, 'BEGIN', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (620, 228, 'END', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (621, 228, 'STATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (622, 228, 'READLINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (623, 228, 'WRITELINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (624, 228, 'OTHERLINES', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (625, 228, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 1, 'new88', '2019-03-21 15:02:48', 'new88', '2019-03-22 15:27:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (626, 229, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (627, 229, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (628, 229, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (629, 229, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (630, 229, 'GROUP', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (631, 229, 'LASTSTATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (632, 229, 'LASTEXECTIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (633, 229, 'UPDATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (634, 229, 'DIRECTORY', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (635, 229, 'OBJECTID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (636, 229, 'DESCRIPTION', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (637, 229, 'CREATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 12, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (638, 229, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 1, 'new88', '2019-03-21 15:05:22', 'new88', '2019-03-22 15:27:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (639, 230, 'ID', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:33:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (640, 230, 'COL1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:33:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (641, 230, 'COL2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:33:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (642, 231, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:30:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (643, 231, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:30:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (644, 231, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:30:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (645, 231, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:05:24', 'new88', '2019-03-22 15:30:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (646, 232, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-22 15:34:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (647, 232, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-22 15:34:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (648, 232, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-22 15:34:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (649, 232, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:05:25', 'new88', '2019-03-22 15:34:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (650, 233, 'SEQ_NAME', 'varchar', '50', NULL, 1, 0, 0, '', 'gfv234', 1, 1, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (651, 233, 'SEQ_VALUE', 'int', '11', NULL, 0, 0, 0, '', 'xfvb34w', 2, 1, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (652, 234, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 1, 1, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-22 15:34:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (653, 234, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 2, 1, 'new88', '2019-03-21 15:05:26', 'new88', '2019-03-22 15:34:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (654, 235, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (655, 235, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (656, 235, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (657, 235, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:24', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (658, 236, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:21', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (659, 236, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:21', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (660, 236, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:21', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (661, 236, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:21', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (662, 237, 'id', 'int', '10', NULL, 1, 0, 0, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:27', 'new88', '2019-03-22 15:34:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (663, 238, 'dept', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (664, 238, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (665, 238, 'year', 'varchar', '8', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (666, 238, 'rating', 'double', '4', '2', 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:05:28', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (667, 239, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (668, 239, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '\'级别\'', 2, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (669, 239, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (670, 239, 'salary', 'double', '10', '2', 0, 0, 1, NULL, '\'工资\'', 4, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (671, 240, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (672, 240, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '\'级别\'', 2, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (673, 240, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (674, 240, 'salary', 'double', '10', '2', 0, 0, 1, NULL, '\'工资\'', 4, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (675, 241, 'id', 'varchar', '30', NULL, 0, 0, 1, NULL, '\'ETL测试表\'', 1, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (676, 241, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (677, 241, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (678, 241, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (679, 241, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (680, 241, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (681, 242, 'id', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (682, 242, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (683, 242, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (684, 242, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (685, 242, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (686, 242, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (687, 243, 'id', 'int', '10', NULL, 1, 0, 0, '\'0\'', '\'ID\'', 1, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (688, 243, 'i5', 'int', '10', NULL, 0, 0, 1, NULL, '\'i5\'', 2, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (689, 243, 'model', 'int', '10', NULL, 0, 0, 1, NULL, '\'模型\'', 3, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (690, 243, 'i3', 'int', '10', NULL, 0, 0, 1, NULL, '\'i3\'', 4, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (691, 244, 'id', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (692, 244, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (693, 244, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (694, 244, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (695, 244, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (696, 244, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (697, 244, 'field3', 'double', '20', '4', 0, 0, 1, NULL, '', 7, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (698, 244, 'etltime', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 8, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (699, 245, 'id', 'varchar', '30', NULL, 0, 0, 1, '', 'id', 1, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:28:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (700, 245, 'oldstr', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (701, 245, 'newstr', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (702, 245, 'phone', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (703, 245, 'field1', 'double', '20', '4', 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (704, 245, 'field2', 'double', '20', '4', 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (705, 246, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', '111', 1, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:29:52', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (706, 246, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (707, 246, 'path', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (708, 246, 'type', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (709, 246, 'exists', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (710, 246, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (711, 246, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (712, 246, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (713, 246, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (714, 246, 'size', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (715, 246, 'extension', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (716, 246, 'uri', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (717, 246, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (718, 247, 'filename', 'varchar', '255', NULL, 0, 0, 1, '', 'filename', 1, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (719, 247, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, '', 'short_filename', 2, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (720, 247, 'path', 'varchar', '255', NULL, 0, 0, 1, '', 'path', 3, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (721, 247, 'type', 'varchar', '255', NULL, 0, 0, 1, '', 'type', 4, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (722, 247, 'exists', 'varchar', '255', NULL, 0, 0, 1, '', 'exists', 5, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (723, 247, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, '', 'ishidden', 6, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (724, 247, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, '', 'isreadable', 7, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (725, 247, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, '', 'iswriteable', 8, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (726, 247, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, '', 'lastmodifiedtime', 9, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (727, 247, 'size', 'varchar', '255', NULL, 0, 0, 1, '', 'size', 10, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (728, 247, 'extension', 'varchar', '255', NULL, 0, 0, 1, '', 'extension', 11, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (729, 247, 'uri', 'varchar', '255', NULL, 0, 0, 1, '', 'uri', 12, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (730, 247, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, '', 'rooturi', 13, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (731, 247, 'filename22', 'varchar', '255', NULL, 0, 0, 1, '', 'filename22', 14, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (732, 247, 'others', 'varchar', '255', NULL, 0, 0, 1, '', 'others', 15, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 19:13:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (733, 248, 'id', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 1, 1, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (734, 248, 'date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (735, 248, 'core', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (736, 248, 'db_utilization', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (737, 249, 'FSENTRY_PATH', 'text', '0', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (738, 249, 'FSENTRY_NAME', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (739, 249, 'FSENTRY_DATA', 'longblob', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (740, 249, 'FSENTRY_LASTMOD', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (741, 249, 'FSENTRY_LENGTH', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (742, 250, 'FSENTRY_PATH', 'text', '0', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (743, 250, 'FSENTRY_NAME', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (744, 250, 'FSENTRY_DATA', 'longblob', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (745, 250, 'FSENTRY_LASTMOD', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (746, 250, 'FSENTRY_LENGTH', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (747, 251, 'BINVAL_ID', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (748, 251, 'BINVAL_DATA', 'longblob', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (749, 252, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (750, 252, 'NODE_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (751, 253, 'PROP_ID', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (752, 253, 'PROP_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (753, 254, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (754, 254, 'REFS_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (755, 255, 'BINVAL_ID', 'varchar', '255', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (756, 255, 'BINVAL_DATA', 'longblob', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (757, 256, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (758, 256, 'NODE_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (759, 257, 'NODE_ID', 'char', '36', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (760, 257, 'REFS_DATA', 'mediumblob', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (761, 258, 'xcv234', 'INTEGER', '6', NULL, 0, 0, 0, '', 'sdf', 1, 0, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (762, 259, 'id', 'varchar', '500', NULL, 0, 0, 1, NULL, '\'主健\'', 1, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (763, 259, 'kettle_id', 'varchar', '200', NULL, 0, 0, 1, NULL, '\'ktr主健\'', 2, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (764, 259, 'log_step_name', 'varchar', '200', NULL, 0, 0, 1, NULL, '\'step步骤名称\'', 3, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (765, 259, 'log_name', 'varchar', '200', NULL, 0, 0, 1, NULL, '\'ktr名称\'', 4, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (766, 259, 'log_type', 'char', '2', NULL, 0, 0, 1, '\'1\'', '\'1:未查出日志;2:已查出日志\'', 5, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (767, 259, 'log_step_state', 'varchar', '50', NULL, 0, 0, 1, '\'1\'', '\'1-Failed;2-Completed;3-Completed with errors;4-Stopped;6-Running;7-Initializing\'', 6, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (768, 259, 'log_date', 'datetime', '3', NULL, 0, 0, 1, NULL, '\'日志产生时间\'', 7, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (769, 259, 'log_msg', 'varchar', '1000', NULL, 0, 0, 1, NULL, '\'日志内容\'', 8, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (770, 259, 'log_run_state', 'varchar', '50', NULL, 0, 0, 1, '\'1\'', '\'1-Failed;2-Completed;3-Completed with errors;4-Stopped;6-Running;7-Initializing\'', 9, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (771, 260, 'ID_BATCH', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (772, 260, 'SEQ_NR', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (773, 260, 'LOGDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (774, 260, 'TRANSNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (775, 260, 'STEPNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (776, 260, 'STEP_COPY', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (777, 260, 'LINES_READ', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 7, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (778, 260, 'LINES_WRITTEN', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 8, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (779, 260, 'LINES_UPDATED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 9, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (780, 260, 'LINES_INPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (781, 260, 'LINES_OUTPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (782, 260, 'LINES_REJECTED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 12, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (783, 260, 'ERRORS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 13, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (784, 260, 'INPUT_BUFFER_ROWS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 14, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (785, 260, 'OUTPUT_BUFFER_ROWS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 15, 1, 'new88', '2019-03-21 15:12:26', 'new88', '2019-03-22 15:34:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (786, 261, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 1, 1, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:40:41', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (787, 261, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'啊实打实的\'', 2, 1, 'xionghan1', '2019-03-21 15:21:58', 'xionghan1', '2019-03-21 15:40:41', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (788, 262, 'id_update', 'bigint', '20', NULL, 0, 0, 1, '', 'dasdas', 1, 0, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:26:28', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (789, 262, 'name', 'varchar', '255', NULL, 0, 0, 1, '', 'asdwwwww', 2, 0, 'xionghan1', '2019-03-21 15:25:54', 'xionghan1', '2019-03-21 15:26:28', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (790, 263, 'filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (791, 263, 'short_filename', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (792, 263, 'path', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (793, 263, 'type', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (794, 263, 'exists', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (795, 263, 'ishidden', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (796, 263, 'isreadable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (797, 263, 'iswriteable', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (798, 263, 'lastmodifiedtime', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (799, 263, 'size', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (800, 263, 'extension', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (801, 263, 'uri', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (802, 263, 'rooturi', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-21 15:44:26', 'new88', '2019-03-21 15:44:26', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (817, 233, 'asd34', 'TINYINT', '3', NULL, 0, 0, 0, '', 'sdf234', 3, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (818, 233, 'asdf234', 'NUMERIC', '4', '2', 0, 0, 0, '', 'sdfsdf', 4, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (819, 233, 'sdf234', 'SMALLINT', '3', NULL, 0, 0, 0, '', '324', 5, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (820, 233, 'wer4werwserf4', 'NUMERIC', '4', '2', 0, 0, 0, '', 'xcv', 6, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (821, 233, 'fgvbxcfvb3r4', 'SMALLINT', '2', NULL, 0, 0, 0, '', 'fvdcwe3r54', 7, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (822, 233, 'vbw3r54', 'SMALLINT', '2', NULL, 0, 0, 0, '', 'xcfvb354', 8, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (823, 233, 'rwe3r54', 'DOUBLE', '3', '2', 0, 0, 0, '', 'cgvbwe3r54', 9, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (824, 233, 'cvbw3r4', 'DECIMAL', '3', '3', 0, 0, 0, '', 'cvbwe3r4', 10, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (825, 233, 'asdf234cxvb', 'NUMERIC', '3', '2', 0, 0, 0, '', 'sadf', 11, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (826, 233, 'asdf234xx234', 'NUMERIC', '3', '2', 0, 0, 0, '', 'sv234', 12, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (827, 233, 'xcv234', 'SMALLINT', '3', NULL, 0, 0, 0, '', 'dxcv32434', 13, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (828, 233, 'xcvb324', 'FLOAT', '4', '2', 0, 0, 0, '', 'zxdv234', 14, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (829, 233, 'vf33', 'BIGINT', '1', NULL, 0, 0, 0, '', 'sdfv234', 15, 1, 'new88', '2019-03-21 17:41:37', 'new88', '2019-03-22 17:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (830, 265, 'ID_BATCH', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (831, 265, 'CHANNEL_ID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (832, 265, 'LOG_DATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (833, 265, 'TRANSNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (834, 265, 'STEPNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (835, 265, 'STEP_COPY', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (836, 265, 'LINES_READ', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (837, 265, 'LINES_WRITTEN', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (838, 265, 'LINES_UPDATED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (839, 265, 'LINES_INPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (840, 265, 'LINES_OUTPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (841, 265, 'LINES_REJECTED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (842, 265, 'ERRORS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (843, 265, 'LOG_FIELD', 'text', '0', NULL, 0, 0, 1, NULL, '', 14, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (844, 266, 'ID_BATCH', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (845, 266, 'CHANNEL_ID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (846, 266, 'TRANSNAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (847, 266, 'STATUS', 'varchar', '15', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (848, 266, 'LINES_READ', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (849, 266, 'LINES_WRITTEN', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (850, 266, 'LINES_UPDATED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (851, 266, 'LINES_INPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (852, 266, 'LINES_OUTPUT', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (853, 266, 'LINES_REJECTED', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (854, 266, 'ERRORS', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (855, 266, 'STARTDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (856, 266, 'ENDDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (857, 266, 'LOGDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 14, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (858, 266, 'DEPDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 15, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (859, 266, 'REPLAYDATE', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 16, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (860, 266, 'LOG_FIELD', 'mediumtext', '0', NULL, 0, 0, 1, NULL, '', 17, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (861, 267, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (862, 267, 'name', 'varchar', '20', NULL, 0, 0, 0, NULL, '\'job名称\'', 2, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (863, 267, 'type', 'varchar', '20', NULL, 0, 0, 1, NULL, '\'节点类型:command,hive,hadoopJava,spark\'', 3, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (864, 267, 'task_id', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'所属任务ID\'', 4, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (865, 267, 'dependency', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'依赖节点ID,多个用逗号隔开\'', 5, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (866, 267, 'gui_xloc', 'varchar', '10', NULL, 0, 0, 1, NULL, '\'图形化x坐标\'', 6, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (867, 267, 'gui_yloc', 'varchar', '10', NULL, 0, 0, 1, NULL, '\'图形化y坐标\'', 7, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (868, 267, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (869, 267, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 9, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (870, 267, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (871, 267, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 11, 0, 'new88', '2019-03-21 18:20:23', 'new88', '2019-03-21 18:20:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (873, 269, 'sdf', 'BIGINT', '20', NULL, 0, 0, 0, '', 'sdf', 1, 0, 'new88', '2019-03-21 19:36:58', 'new88', '2019-03-21 19:36:58', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (874, 271, 'id', 'NUMBER', '22', '2', 1, 0, 0, '', 'zzzxasd', 1, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (875, 271, 'name', 'VARCHAR2', NULL, NULL, 0, 0, 0, '', 'asdasdwq', 2, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (876, 271, 'cs_1', 'NUMBER', '22', '2', 0, 0, 0, '', 'asdqwasxdxas', 3, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (877, 272, 'yuyu', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (878, 273, 'aaa', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 14:52:44', 'new88', '2019-03-22 14:52:44', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (879, 274, 'asdf', 'int', '11', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (880, 275, 'fff', 'int', '11', NULL, 0, 0, 1, NULL, '\'fff\'', 1, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (881, 276, 'id', 'int', '11', NULL, 1, 1, 0, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (882, 276, 'name', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (883, 276, 'year', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (884, 276, 'area', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (885, 277, 'month', 'char', '255', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (886, 277, 'prodA', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (887, 277, 'prodB', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (888, 277, 'prodC', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (889, 277, 'prodD', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (890, 277, 'prodE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-22 15:14:46', 'new88', '2019-03-22 15:14:46', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (891, 278, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (892, 278, 'original_name', 'varchar', '50', NULL, 0, 0, 0, NULL, '\'原始文件名\'', 2, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (893, 278, 'store_schema', 'varchar', '50', NULL, 0, 0, 1, NULL, '\'存储协议：file,hdfs\'', 3, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (894, 278, 'file_path', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'存储文件名\'', 4, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (895, 278, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (896, 278, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 6, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (897, 278, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (898, 278, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 8, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (899, 279, 'id', 'bigint', '20', NULL, 1, 0, 0, NULL, '\'节点id\'', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (900, 279, 'class_name', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'main函数所在类\'', 2, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (901, 279, 'parameter', 'varchar', '500', NULL, 0, 0, 1, NULL, '\'main函数参数\'', 3, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (902, 279, 'jar_attachement_id', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'jar文件附件ID\'', 4, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (903, 279, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (904, 279, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 6, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (905, 279, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (906, 279, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 8, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (907, 280, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (908, 280, 'job_id', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'节点id\'', 2, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (909, 280, 'script', 'varchar', '1000', NULL, 0, 0, 1, NULL, '\'执行脚本\'', 3, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (910, 280, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (911, 280, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 5, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (912, 280, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (913, 280, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 7, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (914, 281, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (915, 281, 'name', 'varchar', '50', NULL, 0, 0, 0, NULL, '\'任务名称\'', 2, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (916, 281, 'description', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'任务描述\'', 3, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (917, 281, 'has_submit', 'tinyint', '1', NULL, 0, 0, 1, NULL, '\'是否已经提交\'', 4, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (918, 281, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (919, 281, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 6, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (920, 281, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (921, 281, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 8, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (922, 282, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '\'主键\'', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (923, 282, 'task_id', 'bigint', '20', NULL, 0, 0, 0, NULL, '\'任务id\'', 2, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (924, 282, 'recurring_flag', 'tinyint', '1', NULL, 0, 0, 1, NULL, '\'是否问循环任务\'', 3, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (925, 282, 'start_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '\'任务开始时间\'', 4, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (926, 282, 'interval_value', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'时间间隔\'', 5, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (927, 282, 'interval_unit', 'varchar', '10', NULL, 0, 0, 1, NULL, '\'时间间隔单位：min,h,d\'', 6, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (928, 282, 'cron_expression', 'varchar', '50', NULL, 0, 0, 1, NULL, '\'cron表达式，优先级高于时间间隔\'', 7, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (929, 282, 'creator', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (930, 282, 'create_time', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 9, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (931, 282, 'modifier', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (932, 282, 'modify_time', 'timestamp', '0', NULL, 0, 0, 0, '\'0000-00-00 00:00:00\'', '', 11, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (933, 283, 'aa', 'int', '10', NULL, 0, 0, 1, NULL, '\'12\'', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (934, 284, 'id', 'bigint', '20', NULL, 1, 1, 0, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (935, 284, 'name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (936, 284, 'sex', 'varchar', '10', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (937, 285, 'id', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (938, 285, 'name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:47', 'new88', '2019-03-22 15:14:47', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (939, 286, 'id', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (940, 286, 'name', 'varchar', '20', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (941, 287, 't1', 'int', '11', NULL, 0, 0, 1, NULL, '\'t1字段\'', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (942, 287, 't2', 'decimal', '16', '5', 0, 0, 1, NULL, '\'t2字段\'', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (943, 287, 't3', 'timestamp', '0', NULL, 0, 0, 1, NULL, '\'t3字段\'', 3, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (944, 288, 'tab1_id', 'varchar', '11', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (945, 288, 'create', 'timestamp', '3', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (946, 288, 'create2', 'datetime', '3', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (947, 289, 'cardID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (948, 289, 'phone', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (949, 289, 'date', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (950, 289, 'character', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (951, 290, 'id', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (952, 290, 'c1', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (953, 290, 'c2', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (954, 290, 'c3', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (955, 291, 'id', 'int', '8', NULL, 1, 1, 0, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (956, 291, 'name', 'text', '0', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (957, 291, 'age', 'text', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (958, 291, 'data', 'date', '0', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (959, 292, 'id', 'int', '8', NULL, 1, 1, 0, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (960, 292, 'name', 'text', '0', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (961, 292, 'age', 'text', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (962, 292, 'data', 'date', '0', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (963, 293, 'id', 'text', '0', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (964, 293, 'deptno', 'text', '0', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (965, 293, 'dname', 'text', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (966, 293, 'dd', 'text', '0', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 15:14:48', 'new88', '2019-03-22 15:14:48', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (967, 295, 'id', 'NUMBER', NULL, NULL, 1, 0, 0, '', '', 1, 1, 'new88', '2019-03-22 16:49:08', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (968, 296, 'ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 1, 'new88', '2019-03-22 16:49:10', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (969, 297, 'ID', 'NUMBER', NULL, '0', 0, 0, 1, '', '', 1, 1, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (970, 297, 'CODE', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 1, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (971, 297, 'NAME', 'BINARY_DOUBLE', NULL, NULL, 0, 0, 1, '', '', 3, 1, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (972, 297, 'ADDRESS', 'BINARY_FLOAT', NULL, NULL, 0, 0, 1, '', '', 4, 1, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (973, 298, 'T1', 'LONG', NULL, NULL, 0, 0, 1, '', '', 1, 1, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (974, 298, 'T2', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 1, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 17:39:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (975, 299, 'EXECID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (976, 299, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (977, 299, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (978, 299, 'OPERATOR', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (979, 299, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (980, 299, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (981, 299, 'BEGIN', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (982, 299, 'END', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (983, 299, 'STATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (984, 299, 'READLINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (985, 299, 'WRITELINES', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (986, 299, 'OTHERLINES', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (987, 299, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (988, 300, 'RENTERID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (989, 300, 'OWNER', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (990, 300, 'TYPE', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (991, 300, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (992, 300, 'GROUP', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (993, 300, 'LASTSTATUS', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (994, 300, 'LASTEXECTIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (995, 300, 'UPDATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (996, 300, 'DIRECTORY', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (997, 300, 'OBJECTID', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (998, 300, 'DESCRIPTION', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (999, 300, 'CREATETIME', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1000, 300, 'ID', 'varchar', '255', NULL, 1, 0, 0, NULL, '', 13, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1001, 301, 'ID', 'int', '8', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1002, 301, 'COL1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1003, 301, 'COL2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1004, 302, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1005, 302, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1006, 302, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1007, 302, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 17:08:59', 'new88', '2019-03-22 17:08:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1008, 303, 'ID', 'varchar', '50', NULL, 1, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1009, 303, 'NAME', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1010, 303, 'AGE', 'decimal', '50', '0', 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1011, 303, 'ADDRESS', 'varchar', '50', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1012, 304, 'id_update', 'bigint', '20', NULL, 0, 0, 1, NULL, '\'dasdas\'', 1, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1013, 304, 'name', 'varchar', '255', NULL, 0, 0, 1, NULL, '\'asdwwwww\'', 2, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1014, 305, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1015, 305, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1016, 305, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1017, 305, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1018, 306, 'ID', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1019, 306, 'NAME', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1020, 306, 'incrementA_BC', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1021, 306, 'incrementA_D', 'bigint', '20', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1022, 307, 'id', 'int', '10', NULL, 1, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1023, 308, 'dept', 'varchar', '100', NULL, 0, 0, 1, NULL, '', 1, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1024, 308, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1025, 308, 'year', 'varchar', '8', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1026, 308, 'rating', 'double', '4', '2', 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-22 17:09:00', 'new88', '2019-03-22 17:09:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1027, 309, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1028, 309, 'level', 'int', '2', NULL, 0, 0, 1, NULL, '\'级别\'', 2, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1029, 309, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1030, 309, 'salary', 'double', '10', '2', 0, 0, 1, NULL, '\'工资\'', 4, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1031, 309, 'ds_batch', 'DATETIME', '0', NULL, 0, 0, 1, '', 'asd', 5, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-25 14:57:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1032, 309, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1033, 309, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1034, 310, 'id', 'BIGINT', '10', NULL, 1, 1, 0, '', 'id', 1, 1, 'new88', '2019-03-22 17:29:58', 'new88', '2019-03-22 17:42:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1035, 311, 'asdf234', 'DECIMAL', '3', '2', 0, 0, 0, '', 'ssdf234', 1, 0, 'new88', '2019-03-22 17:40:10', 'new88', '2019-03-22 17:40:10', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1036, 312, 'ID', 'NUMBER', '22', '0', 0, 0, 1, '', 'id', 1, 0, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1037, 312, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'name', 2, 0, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1038, 312, 'FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'flag', 3, 0, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1039, 312, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_batch', 4, 0, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1040, 312, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 0, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1041, 312, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 0, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1042, 313, 'ID', 'NUMBER', '22', '0', 1, 0, 0, '', '', 1, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1043, 313, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1044, 313, 'ADDRESS', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1045, 313, 'CREATE_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1046, 313, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 5, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1047, 313, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', '', 6, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1048, 313, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 7, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1049, 314, 'ID', 'NUMBER', '22', '0', 0, 0, 1, '', 'id', 1, 0, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1050, 314, 'NAME', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'name', 2, 0, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1051, 314, 'DS_BATCH', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_batch', 3, 0, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1052, 314, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 4, 0, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1053, 314, 'DS_SYNC_FLAG', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 5, 0, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1054, 314, 'A', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', 'a', 6, 0, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1055, 316, 'NAME', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1056, 317, 'id', 'NUMBER', NULL, NULL, 1, 0, 0, '', '', 1, 0, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1057, 318, 'ID', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1058, 319, 'ID', 'NUMBER', NULL, '0', 0, 0, 1, '', '', 1, 0, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1059, 319, 'CODE', 'NUMBER', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1060, 319, 'NAME', 'BINARY_DOUBLE', NULL, NULL, 0, 0, 1, '', '', 3, 0, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1061, 319, 'ADDRESS', 'BINARY_FLOAT', NULL, NULL, 0, 0, 1, '', '', 4, 0, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1062, 320, 'T1', 'LONG', NULL, NULL, 0, 0, 1, '', '', 1, 0, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1063, 320, 'T2', 'VARCHAR2', NULL, NULL, 0, 0, 1, '', '', 2, 0, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1064, 321, 'a', 'INTEGER', '11', NULL, 0, 0, 0, '', 'a', 1, 0, 'new88', '2019-03-22 20:57:34', 'new88', '2019-03-22 20:57:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1065, 321, 'b', 'VARCHAR', '20', NULL, 0, 0, 0, '', 'b', 2, 0, 'new88', '2019-03-22 20:57:34', 'new88', '2019-03-22 20:57:34', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1066, 322, 'ID', 'NUMERIC', '22', '0', 0, 0, 1, '', 'id', 1, 0, 'new10', '2019-03-22 21:43:00', 'new10', '2019-03-22 21:43:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1067, 322, 'NAME', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'name', 2, 0, 'new10', '2019-03-22 21:43:00', 'new10', '2019-03-22 21:43:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1068, 322, 'DS_BATCH', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_batch', 4, 0, 'new10', '2019-03-22 21:43:00', 'new10', '2019-03-22 21:43:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1069, 322, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 0, 'new10', '2019-03-22 21:43:00', 'new10', '2019-03-22 21:43:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1070, 322, 'DS_SYNC_FLAG', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 0, 'new10', '2019-03-22 21:43:00', 'new10', '2019-03-22 21:43:00', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1071, 323, 'ID', 'NUMERIC', '22', '0', 0, 0, 1, '', 'id', 1, 0, 'new10', '2019-03-22 22:12:22', 'new10', '2019-03-22 22:12:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1072, 323, 'NAME', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'name', 2, 0, 'new10', '2019-03-22 22:12:22', 'new10', '2019-03-22 22:12:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1073, 323, 'DS_BATCH', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_batch', 4, 0, 'new10', '2019-03-22 22:12:22', 'new10', '2019-03-22 22:12:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1074, 323, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 0, 'new10', '2019-03-22 22:12:22', 'new10', '2019-03-22 22:12:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1075, 323, 'DS_SYNC_FLAG', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 0, 'new10', '2019-03-22 22:12:22', 'new10', '2019-03-22 22:12:22', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1076, 324, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 0, 'new10', '2019-03-22 22:19:49', 'new10', '2019-03-22 22:19:49', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1077, 324, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 0, 'new10', '2019-03-22 22:19:49', 'new10', '2019-03-22 22:19:49', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1078, 324, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new10', '2019-03-22 22:19:49', 'new10', '2019-03-22 22:19:49', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1079, 324, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new10', '2019-03-22 22:19:49', 'new10', '2019-03-22 22:19:49', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1080, 324, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new10', '2019-03-22 22:19:49', 'new10', '2019-03-22 22:19:49', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1081, 325, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 0, 'new10', '2019-03-22 22:53:52', 'new10', '2019-03-22 22:53:52', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1082, 325, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 0, 'new10', '2019-03-22 22:53:52', 'new10', '2019-03-22 22:53:52', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1083, 325, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new10', '2019-03-22 22:53:52', 'new10', '2019-03-22 22:53:52', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1084, 325, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new10', '2019-03-22 22:53:52', 'new10', '2019-03-22 22:53:52', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1085, 325, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new10', '2019-03-22 22:53:52', 'new10', '2019-03-22 22:53:52', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1086, 326, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 0, 'new10', '2019-03-22 22:53:59', 'new10', '2019-03-22 22:53:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1087, 326, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 0, 'new10', '2019-03-22 22:53:59', 'new10', '2019-03-22 22:53:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1088, 326, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new10', '2019-03-22 22:53:59', 'new10', '2019-03-22 22:53:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1089, 326, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new10', '2019-03-22 22:53:59', 'new10', '2019-03-22 22:53:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1090, 326, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new10', '2019-03-22 22:53:59', 'new10', '2019-03-22 22:53:59', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1091, 327, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '\'编号\'', 1, 0, 'new10', '2019-03-22 22:54:32', 'new10', '2019-03-22 22:54:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1092, 327, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '\'组\'', 3, 0, 'new10', '2019-03-22 22:54:32', 'new10', '2019-03-22 22:54:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1093, 327, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new10', '2019-03-22 22:54:32', 'new10', '2019-03-22 22:54:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1094, 327, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new10', '2019-03-22 22:54:32', 'new10', '2019-03-22 22:54:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1095, 327, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new10', '2019-03-22 22:54:32', 'new10', '2019-03-22 22:54:32', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1096, 328, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '编号', 1, 0, 'new10', '2019-03-22 22:43:01', 'new10', '2019-03-22 22:43:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1097, 328, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '组', 3, 0, 'new10', '2019-03-22 22:43:01', 'new10', '2019-03-22 22:43:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1098, 328, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new10', '2019-03-22 22:43:01', 'new10', '2019-03-22 22:43:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1099, 328, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new10', '2019-03-22 22:43:01', 'new10', '2019-03-22 22:43:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1100, 328, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new10', '2019-03-22 22:43:01', 'new10', '2019-03-22 22:43:01', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1101, 329, 'ID', 'NUMERIC', '22', '0', 0, 0, 1, '', 'id', 1, 0, 'new10', '2019-03-22 22:43:12', 'new10', '2019-03-22 22:43:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1102, 329, 'NAME', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'name', 2, 0, 'new10', '2019-03-22 22:43:12', 'new10', '2019-03-22 22:43:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1103, 329, 'DS_BATCH', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_batch', 4, 0, 'new10', '2019-03-22 22:43:12', 'new10', '2019-03-22 22:43:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1104, 329, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 0, 'new10', '2019-03-22 22:43:12', 'new10', '2019-03-22 22:43:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1105, 329, 'DS_SYNC_FLAG', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 0, 'new10', '2019-03-22 22:43:12', 'new10', '2019-03-22 22:43:12', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1106, 330, 'ID', 'NUMERIC', '22', '0', 0, 0, 1, '', 'id', 1, 0, 'new10', '2019-03-22 22:44:42', 'new10', '2019-03-22 22:44:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1107, 330, 'NAME', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'name', 2, 0, 'new10', '2019-03-22 22:44:42', 'new10', '2019-03-22 22:44:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1108, 330, 'DS_BATCH', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_batch', 4, 0, 'new10', '2019-03-22 22:44:42', 'new10', '2019-03-22 22:44:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1109, 330, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 0, 'new10', '2019-03-22 22:44:42', 'new10', '2019-03-22 22:44:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1110, 330, 'DS_SYNC_FLAG', 'VARCHAR', NULL, NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 0, 'new10', '2019-03-22 22:44:42', 'new10', '2019-03-22 22:44:42', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1111, 331, 'ID', 'NUMERIC', '22', '0', 0, 0, 1, '', 'id', 1, 0, 'new10', '2019-03-22 22:46:20', 'new10', '2019-03-22 22:46:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1112, 331, 'NAME', 'VARCHAR', '255', NULL, 0, 0, 1, '', 'name', 2, 0, 'new10', '2019-03-22 22:46:20', 'new10', '2019-03-22 22:46:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1113, 331, 'DS_BATCH', 'VARCHAR', '255', NULL, 0, 0, 1, '', 'ds_batch', 4, 0, 'new10', '2019-03-22 22:46:20', 'new10', '2019-03-22 22:46:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1114, 331, 'DS_SYNC_TIME', 'DATE', NULL, NULL, 0, 0, 1, '', 'ds_sync_time', 5, 0, 'new10', '2019-03-22 22:46:20', 'new10', '2019-03-22 22:46:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1115, 331, 'DS_SYNC_FLAG', 'VARCHAR', '255', NULL, 0, 0, 1, '', 'ds_sync_flag', 6, 0, 'new10', '2019-03-22 22:46:20', 'new10', '2019-03-22 22:46:20', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1116, 332, 'ID', 'BIGINT', '10', NULL, 0, 0, 0, '', 'ID', 1, 0, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1117, 332, 'NAME', 'VARCHAR', '255', NULL, 0, 0, 1, '', 'NAME', 2, 0, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1118, 332, 'FLAG', 'VARCHAR', '255', NULL, 0, 0, 1, '', 'FLAG', 3, 0, 'new88', '2019-03-23 11:38:18', 'new88', '2019-03-23 11:38:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1119, 334, 'dsa', 'BIGINT', '20', NULL, 1, 0, 0, '', 'wdwsad', 1, 0, 'wzl1', '2019-03-23 15:03:25', 'wzl1', '2019-03-23 15:03:25', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1120, 335, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '编号', 1, 0, 'new10', '2019-03-23 16:21:33', 'new10', '2019-03-23 16:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1121, 335, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new10', '2019-03-23 16:21:33', 'new10', '2019-03-23 16:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1122, 335, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new10', '2019-03-23 16:21:33', 'new10', '2019-03-23 16:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1123, 335, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new10', '2019-03-23 16:21:33', 'new10', '2019-03-23 16:21:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1124, 336, 'id', 'varchar', '20', NULL, 1, 0, 0, NULL, '编号', 1, 0, 'new10', '2019-03-23 16:38:33', 'new10', '2019-03-23 16:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1125, 336, 'group', 'varchar', '100', NULL, 0, 0, 1, NULL, '组', 3, 0, 'new10', '2019-03-23 16:38:33', 'new10', '2019-03-23 16:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1126, 336, 'ds_batch', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 5, 0, 'new10', '2019-03-23 16:38:33', 'new10', '2019-03-23 16:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1127, 336, 'ds_sync_time', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 6, 0, 'new10', '2019-03-23 16:38:33', 'new10', '2019-03-23 16:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1128, 336, 'ds_sync_flag', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 7, 0, 'new10', '2019-03-23 16:38:33', 'new10', '2019-03-23 16:38:33', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1129, 337, 'account_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1130, 337, 'account_parent', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1131, 337, 'account_description', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1132, 337, 'account_type', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1133, 337, 'account_rollup', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1134, 337, 'Custom_Members', 'varchar', '255', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1135, 338, 'month_of_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1136, 338, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1137, 338, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1138, 338, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1139, 338, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1140, 338, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1141, 338, 'customer_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1142, 338, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1143, 339, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1144, 339, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1145, 339, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1146, 339, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1147, 339, 'month_of_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1148, 339, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1149, 339, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1150, 339, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1151, 339, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1152, 339, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1153, 339, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1154, 340, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1155, 340, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1156, 340, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1157, 340, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1158, 340, 'time_month', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1159, 340, 'time_quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1160, 340, 'time_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1161, 340, 'store_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1162, 340, 'store_cost_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1163, 340, 'unit_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1164, 340, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1165, 341, 'gender', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1166, 341, 'marital_status', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1167, 341, 'product_family', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1168, 341, 'product_department', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1169, 341, 'product_category', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1170, 341, 'month_of_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1171, 341, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1172, 341, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1173, 341, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1174, 341, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1175, 341, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1176, 341, 'customer_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 12, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1177, 341, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 13, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1178, 342, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1179, 342, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1180, 342, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1181, 342, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1182, 342, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1183, 342, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1184, 343, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1185, 343, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1186, 343, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1187, 343, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1188, 343, 'customer_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1189, 343, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1190, 344, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1191, 344, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1192, 344, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1193, 344, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1194, 344, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1195, 344, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1196, 344, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1197, 344, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1198, 345, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1199, 345, 'city', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1200, 345, 'state_province', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1201, 345, 'country', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1202, 345, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1203, 345, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1204, 345, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1205, 345, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1206, 346, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1207, 346, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1208, 346, 'quarter', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1209, 346, 'the_year', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1210, 346, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1211, 346, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1212, 346, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1213, 346, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1214, 347, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1215, 347, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1216, 347, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1217, 347, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1218, 347, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1219, 347, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1220, 347, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1221, 348, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1222, 348, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1223, 348, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1224, 348, 'store_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1225, 348, 'store_cost_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1226, 348, 'unit_sales_sum', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1227, 348, 'fact_count', 'int', '11', NULL, 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1228, 349, 'category_id', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1229, 349, 'category_parent', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1230, 349, 'category_description', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1231, 349, 'category_rollup', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1232, 350, 'currency_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1233, 350, 'date', 'date', '0', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1234, 350, 'currency', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1235, 350, 'conversion_ratio', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1236, 351, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1237, 351, 'account_num', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1238, 351, 'lname', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1239, 351, 'fname', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1240, 351, 'mi', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1241, 351, 'address1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1242, 351, 'address2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1243, 351, 'address3', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1244, 351, 'address4', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1245, 351, 'city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1246, 351, 'state_province', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1247, 351, 'postal_code', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 12, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1248, 351, 'country', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 13, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1249, 351, 'customer_region_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 14, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1250, 351, 'phone1', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 15, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1251, 351, 'phone2', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 16, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1252, 351, 'birthdate', 'date', '0', NULL, 0, 0, 0, NULL, '', 17, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1253, 351, 'marital_status', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 18, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1254, 351, 'yearly_income', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 19, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1255, 351, 'gender', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 20, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1256, 351, 'total_children', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 21, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1257, 351, 'num_children_at_home', 'smallint', '6', NULL, 0, 0, 0, NULL, '', 22, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1258, 351, 'education', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 23, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1259, 351, 'date_accnt_opened', 'date', '0', NULL, 0, 0, 0, NULL, '', 24, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1260, 351, 'member_card', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 25, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1261, 351, 'occupation', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 26, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1262, 351, 'houseowner', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 27, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1263, 351, 'num_cars_owned', 'int', '11', NULL, 0, 0, 1, NULL, '', 28, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1264, 351, 'fullname', 'varchar', '60', NULL, 0, 0, 0, NULL, '', 29, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1265, 352, 'day', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1266, 352, 'week_day', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1267, 353, 'department_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1268, 353, 'department_description', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1269, 354, 'employee_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1270, 354, 'supervisor_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1271, 354, 'distance', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1272, 355, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1273, 355, 'account_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1274, 355, 'exp_date', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 3, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1275, 355, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1276, 355, 'category_id', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1277, 355, 'currency_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1278, 355, 'amount', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1279, 356, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1280, 356, 'time_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1281, 356, 'warehouse_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1282, 356, 'store_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1283, 356, 'units_ordered', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1284, 356, 'units_shipped', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1285, 356, 'warehouse_sales', 'decimal', '10', '4', 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1286, 356, 'warehouse_cost', 'decimal', '10', '4', 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1287, 356, 'supply_time', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1288, 356, 'store_invoice', 'decimal', '10', '4', 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1289, 357, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1290, 357, 'time_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1291, 357, 'warehouse_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1292, 357, 'store_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1293, 357, 'units_ordered', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1294, 357, 'units_shipped', 'int', '11', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1295, 357, 'warehouse_sales', 'decimal', '10', '4', 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1296, 357, 'warehouse_cost', 'decimal', '10', '4', 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1297, 357, 'supply_time', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1298, 357, 'store_invoice', 'decimal', '10', '4', 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1299, 358, 'position_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1300, 358, 'position_title', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1301, 358, 'pay_type', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1302, 358, 'min_scale', 'decimal', '10', '4', 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1303, 358, 'max_scale', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1304, 358, 'management_role', 'varchar', '30', NULL, 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1305, 359, 'product_class_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1306, 359, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1307, 359, 'brand_name', 'varchar', '60', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1308, 359, 'product_name', 'varchar', '60', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1309, 359, 'SKU', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1310, 359, 'SRP', 'decimal', '10', '4', 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1311, 359, 'gross_weight', 'double', '0', '0', 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1312, 359, 'net_weight', 'double', '0', '0', 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1313, 359, 'recyclable_package', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1314, 359, 'low_fat', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1315, 359, 'units_per_case', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1316, 359, 'cases_per_pallet', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1317, 359, 'shelf_width', 'double', '0', '0', 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1318, 359, 'shelf_height', 'double', '0', '0', 0, 0, 1, NULL, '', 14, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1319, 359, 'shelf_depth', 'double', '0', '0', 0, 0, 1, NULL, '', 15, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1320, 360, 'product_class_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1321, 360, 'product_subcategory', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1322, 360, 'product_category', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1323, 360, 'product_department', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1324, 360, 'product_family', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1325, 361, 'region_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1326, 361, 'sales_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1327, 361, 'sales_state_province', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1328, 361, 'sales_district', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1329, 361, 'sales_region', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1330, 361, 'sales_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1331, 361, 'sales_district_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1332, 362, 'id', 'int', '100', NULL, 1, 0, 0, NULL, '\'唯一标识\'', 1, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1333, 362, 'name', 'bigint', '20', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1334, 362, 'lalal', 'date', '0', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1335, 363, 'pay_date', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 1, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1336, 363, 'employee_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1337, 363, 'department_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1338, 363, 'currency_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1339, 363, 'salary_paid', 'decimal', '10', '4', 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1340, 363, 'overtime_paid', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1341, 363, 'vacation_accrued', 'double', '0', '0', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1342, 363, 'vacation_used', 'double', '0', '0', 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1343, 364, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1344, 364, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1345, 364, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1346, 364, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1347, 364, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1348, 364, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1349, 364, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1350, 364, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1351, 365, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1352, 365, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1353, 365, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1354, 365, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1355, 365, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1356, 365, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1357, 365, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1358, 365, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1359, 366, 'product_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1360, 366, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1361, 366, 'customer_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1362, 366, 'promotion_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1363, 366, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1364, 366, 'store_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1365, 366, 'store_cost', 'decimal', '10', '4', 0, 0, 0, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1366, 366, 'unit_sales', 'decimal', '10', '4', 0, 0, 0, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1367, 367, 'name', 'int', '11', NULL, 0, 0, 1, NULL, '\'sjifeji\'', 1, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1368, 368, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1369, 368, 'store_type', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1370, 368, 'region_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1371, 368, 'store_name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1372, 368, 'store_number', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1373, 368, 'store_street_address', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1374, 368, 'store_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1375, 368, 'store_state', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1376, 368, 'store_postal_code', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1377, 368, 'store_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1378, 368, 'store_manager', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1379, 368, 'store_phone', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1380, 368, 'store_fax', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1381, 368, 'first_opened_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 14, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1382, 368, 'last_remodel_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 15, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1383, 368, 'store_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 16, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1384, 368, 'grocery_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 17, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1385, 368, 'frozen_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 18, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1386, 368, 'meat_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 19, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1387, 368, 'coffee_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 20, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1388, 368, 'video_store', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 21, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1389, 368, 'salad_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 22, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1390, 368, 'prepared_food', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 23, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1391, 368, 'florist', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 24, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1392, 369, 'store_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1393, 369, 'store_type', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1394, 369, 'region_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1395, 369, 'store_name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1396, 369, 'store_number', 'int', '11', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1397, 369, 'store_street_address', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1398, 369, 'store_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1399, 369, 'store_state', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1400, 369, 'store_postal_code', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1401, 369, 'store_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1402, 369, 'store_manager', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1403, 369, 'store_phone', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1404, 369, 'store_fax', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1405, 369, 'first_opened_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 14, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1406, 369, 'last_remodel_date', 'datetime', '0', NULL, 0, 0, 1, NULL, '', 15, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1407, 369, 'store_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 16, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1408, 369, 'grocery_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 17, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1409, 369, 'frozen_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 18, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1410, 369, 'meat_sqft', 'int', '11', NULL, 0, 0, 1, NULL, '', 19, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1411, 369, 'coffee_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 20, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1412, 369, 'video_store', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 21, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1413, 369, 'salad_bar', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 22, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1414, 369, 'prepared_food', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 23, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1415, 369, 'florist', 'tinyint', '1', NULL, 0, 0, 1, NULL, '', 24, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1416, 370, 'time_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1417, 370, 'the_date', 'timestamp', '0', NULL, 0, 0, 0, 'CURRENT_TIMESTAMP', '', 2, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1418, 370, 'the_day', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1419, 370, 'the_month', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1420, 370, 'the_year', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1421, 370, 'day_of_month', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1422, 370, 'week_of_year', 'int', '11', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1423, 370, 'month_of_year', 'smallint', '6', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1424, 370, 'quarter', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1425, 370, 'fiscal_period', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1426, 371, 'warehouse_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1427, 371, 'warehouse_class_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1428, 371, 'stores_id', 'int', '11', NULL, 0, 0, 1, NULL, '', 3, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1429, 371, 'warehouse_name', 'varchar', '60', NULL, 0, 0, 1, NULL, '', 4, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1430, 371, 'wa_address1', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 5, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1431, 371, 'wa_address2', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 6, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1432, 371, 'wa_address3', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 7, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1433, 371, 'wa_address4', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 8, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1434, 371, 'warehouse_city', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 9, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1435, 371, 'warehouse_state_province', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 10, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1436, 371, 'warehouse_postal_code', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 11, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1437, 371, 'warehouse_country', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 12, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1438, 371, 'warehouse_owner_name', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 13, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1439, 371, 'warehouse_phone', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 14, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1440, 371, 'warehouse_fax', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 15, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1441, 372, 'warehouse_class_id', 'int', '11', NULL, 0, 0, 0, NULL, '', 1, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);
INSERT INTO `mc_table_column` VALUES (1442, 372, 'description', 'varchar', '30', NULL, 0, 0, 1, NULL, '', 2, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mc_table_fk_mysql
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_fk_mysql`;
CREATE TABLE `mc_table_fk_mysql`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前表字段，可能有多个,以,隔开',
  `reference_schema_id` bigint(20) NULL DEFAULT NULL COMMENT '参考的模型id，在mysql中这里表示是数据库',
  `reference_table_id` bigint(20) NULL DEFAULT NULL COMMENT '参考表id',
  `reference_column` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考列id，可能有多个，和当前表字段对应',
  `delete_trigger` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时触发的事件',
  `update_trigger` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时触发的事件',
  `location` int(10) NULL DEFAULT NULL COMMENT '位置（当一个位置标识，在每张表的索引位置都是自增，唯一的）',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:未删除 1:已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_table_fk_mysql
-- ----------------------------
INSERT INTO `mc_table_fk_mysql` VALUES (1, 'dddfs', '298', 6, 42, '56', 'RESTRICT', 'RESTRICT', 1, 103, 1, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-20 15:38:55');
INSERT INTO `mc_table_fk_mysql` VALUES (2, 'sdf', '299', 6, 42, '56', 'RESTRICT', 'RESTRICT', 1, 104, 0, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48');
INSERT INTO `mc_table_fk_mysql` VALUES (4, 'fk_user_role_test1', '341', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 143, 1, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 15:29:23');
INSERT INTO `mc_table_fk_mysql` VALUES (5, 'fk_user_role_test1', '343', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 144, 1, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:35:27');
INSERT INTO `mc_table_fk_mysql` VALUES (6, 'fk_user_role_test1', '344', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 145, 1, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:47:30');
INSERT INTO `mc_table_fk_mysql` VALUES (7, 'fk_user_role_cs1', '345', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 146, 1, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:52:45');
INSERT INTO `mc_table_fk_mysql` VALUES (8, 'fk_user_role_test1', '346', 6, 142, '338', 'RESTRICT', 'RESTRICT', 1, 147, 1, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:54:16');
INSERT INTO `mc_table_fk_mysql` VALUES (9, 'fk_cs1', '352,353', 6, 148, '348,349', 'RESTRICT', 'RESTRICT', 1, 149, 0, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31');
INSERT INTO `mc_table_fk_mysql` VALUES (10, 'a', '358', 78, 108, '304', 'RESTRICT', 'RESTRICT', 1, 154, 1, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_table_fk_mysql` VALUES (11, 'sdf', '761', 147, 227, '611', 'RESTRICT', 'RESTRICT', 1, 258, 0, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54');
INSERT INTO `mc_table_fk_mysql` VALUES (17, 'FK_1', '732', 149, 259, '763', 'RESTRICT', 'RESTRICT', 1, 247, 1, 'new88', '2019-03-21 19:18:43', 'new88', '2019-03-21 19:36:06');
INSERT INTO `mc_table_fk_mysql` VALUES (20, 'FK_1', '732', 149, 259, '763', 'RESTRICT', 'RESTRICT', 2, 247, 1, 'new88', '2019-03-21 19:32:16', 'new88', '2019-03-21 19:48:19');

-- ----------------------------
-- Table structure for mc_table_fk_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_fk_oracle`;
CREATE TABLE `mc_table_fk_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前表字段，可能有多个,以,隔开',
  `reference_schema_id` bigint(20) NULL DEFAULT NULL COMMENT '参考模式id',
  `reference_table_id` bigint(20) NULL DEFAULT NULL COMMENT '参考表id',
  `reference_restrain` bigint(20) NULL DEFAULT NULL COMMENT '参考约束',
  `reference_restrain_type` int(10) NULL DEFAULT NULL COMMENT '参考约束类型',
  `reference_column` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参考字段，字段是当选择约束时，自动录进去',
  `delete_trigger` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时触发的事件',
  `is_enabled` tinyint(1) NULL DEFAULT NULL COMMENT 'oracle 概念，是否启用，0:未启动 1:启用',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `location` int(10) NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:未删除 1:已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mc_table_idx_mysql
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_idx_mysql`;
CREATE TABLE `mc_table_idx_mysql`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前索引关联的字段，可能多个，以，隔开',
  `subdivision` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子部分，对应字段，可以有多个',
  `index_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引类型',
  `index_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引方法',
  `location` int(10) NULL DEFAULT NULL COMMENT '索引位置（当前字段的一个位置标识，每张表的索引位置都是自增，唯一的）',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:否 1:是',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_table_idx_mysql
-- ----------------------------
INSERT INTO `mc_table_idx_mysql` VALUES (7, 'index_cs1', '41', NULL, 'UNIQUE', 'BTREE', 1, 34, 0, 'wzl1', '2019-03-10 22:38:36', 'wzl1', '2019-03-10 22:38:36');
INSERT INTO `mc_table_idx_mysql` VALUES (15, 'asdswww', '57', NULL, 'NORMAL', 'BTREE', 1, 42, 0, 'wzl1', '2019-03-10 22:51:57', 'wzl1', '2019-03-10 22:51:57');
INSERT INTO `mc_table_idx_mysql` VALUES (16, 'sdf234', '298', NULL, 'NORMAL', 'BTREE', 1, 103, 1, 'wzl1', '2019-03-15 18:12:27', 'wzl1', '2019-03-20 15:38:55');
INSERT INTO `mc_table_idx_mysql` VALUES (17, 'dd234', '299', NULL, 'NORMAL', 'BTREE', 1, 104, 0, 'wzl1', '2019-03-15 18:35:48', 'wzl1', '2019-03-15 18:35:48');
INSERT INTO `mc_table_idx_mysql` VALUES (18, 'bb', '304', NULL, 'Normal', 'BTREE', 1, 108, 1, 'new88', '2019-03-18 10:40:29', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_table_idx_mysql` VALUES (20, 'u_id', '341', NULL, 'NORMAL', 'BTREE', 1, 143, 1, 'wzl1', '2019-03-19 14:24:33', 'wzl1', '2019-03-19 15:29:23');
INSERT INTO `mc_table_idx_mysql` VALUES (21, 'u_id', '343', NULL, 'NORMAL', 'BTREE', 1, 144, 1, 'wzl1', '2019-03-19 15:15:42', 'wzl1', '2019-03-19 15:35:27');
INSERT INTO `mc_table_idx_mysql` VALUES (22, 'u_id', '344', NULL, 'NORMAL', 'BTREE', 1, 145, 1, 'wzl1', '2019-03-19 15:21:39', 'wzl1', '2019-03-19 15:47:30');
INSERT INTO `mc_table_idx_mysql` VALUES (23, 'u_id', '345', NULL, 'NORMAL', 'BTREE', 1, 146, 1, 'wzl1', '2019-03-19 15:33:37', 'wzl1', '2019-03-19 15:52:45');
INSERT INTO `mc_table_idx_mysql` VALUES (24, 'u_id', '346', NULL, 'NORMAL', 'BTREE', 1, 147, 1, 'wzl1', '2019-03-19 15:38:33', 'wzl1', '2019-03-19 15:57:32');
INSERT INTO `mc_table_idx_mysql` VALUES (25, 'name_class_name', '348,349', NULL, 'UNIQUE', 'BTREE', 1, 148, 0, 'wzl1', '2019-03-19 15:53:25', 'wzl1', '2019-03-19 15:53:25');
INSERT INTO `mc_table_idx_mysql` VALUES (26, 'username_class_name', '352,353', NULL, 'NORMAL', 'BTREE', 1, 149, 0, 'wzl1', '2019-03-19 15:56:31', 'wzl1', '2019-03-19 15:56:31');
INSERT INTO `mc_table_idx_mysql` VALUES (27, 'a', '354', NULL, 'Normal', 'BTREE', 1, 152, 1, 'new88', '2019-03-19 16:14:12', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_table_idx_mysql` VALUES (29, 'a', '358', NULL, 'NORMAL', 'BTREE', 1, 154, 1, 'new88', '2019-03-19 16:18:22', 'new88', '2019-03-21 11:06:58');
INSERT INTO `mc_table_idx_mysql` VALUES (30, 'i_account_id', '437', NULL, 'UNIQUE', 'BTREE', 1, 170, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10');
INSERT INTO `mc_table_idx_mysql` VALUES (31, 'i_account_parent', '438', NULL, 'UNIQUE', 'BTREE', 2, 170, 1, 'oyr', '2019-03-19 21:02:46', 'oyr', '2019-03-21 11:10:10');
INSERT INTO `mc_table_idx_mysql` VALUES (32, 'a', '611', NULL, 'Normal', 'BTREE', 1, 227, 0, 'new88', '2019-03-21 14:56:50', 'new88', '2019-03-21 14:56:50');
INSERT INTO `mc_table_idx_mysql` VALUES (33, 'id_k', '667', NULL, 'UNIQUE', 'BTREE', 1, 239, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (34, 'id_k', '671', NULL, 'UNIQUE', 'BTREE', 1, 240, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (35, 'id', '675', NULL, 'UNIQUE', 'BTREE', 1, 241, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (36, 'newstr', '677', NULL, 'UNIQUE', 'BTREE', 2, 241, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (37, 'phone', '678', NULL, 'UNIQUE', 'BTREE', 3, 241, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (38, 'id', '681', NULL, 'UNIQUE', 'BTREE', 1, 242, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (39, 'newstr', '683', NULL, 'UNIQUE', 'BTREE', 2, 242, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (40, 'phone', '684', NULL, 'UNIQUE', 'BTREE', 3, 242, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (41, 'id', '691', NULL, 'UNIQUE', 'BTREE', 1, 244, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (42, 'newstr', '693', NULL, 'UNIQUE', 'BTREE', 2, 244, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (43, 'phone', '694', NULL, 'UNIQUE', 'BTREE', 3, 244, 1, 'new88', '2019-03-21 15:07:38', 'new88', '2019-03-22 15:34:32');
INSERT INTO `mc_table_idx_mysql` VALUES (44, 'id', '699', NULL, 'UNIQUE', 'BTREE', 1, 245, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_table_idx_mysql` VALUES (45, 'newstr', '701', NULL, 'UNIQUE', 'BTREE', 2, 245, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_table_idx_mysql` VALUES (46, 'phone', '702', NULL, 'UNIQUE', 'BTREE', 3, 245, 0, 'new88', '2019-03-21 15:07:39', 'new88', '2019-03-21 15:07:39');
INSERT INTO `mc_table_idx_mysql` VALUES (47, 'J_FS_DEFAULT_FSENTRY_IDX', '738', NULL, 'UNIQUE', 'BTREE', 1, 249, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_table_idx_mysql` VALUES (48, 'J_FS_SECURITY_FSENTRY_IDX', '743', NULL, 'UNIQUE', 'BTREE', 1, 250, 0, 'new88', '2019-03-21 15:08:58', 'new88', '2019-03-21 15:08:58');
INSERT INTO `mc_table_idx_mysql` VALUES (49, 'J_PM_DEFAULT_BINVAL_IDX', '747', NULL, 'UNIQUE', 'BTREE', 1, 251, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_table_idx_mysql` VALUES (50, 'J_PM_DEFAULT_NODE_IDX', '749', NULL, 'UNIQUE', 'BTREE', 1, 252, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_table_idx_mysql` VALUES (51, 'J_PM_DEFAULT_PROP_IDX', '751', NULL, 'UNIQUE', 'BTREE', 1, 253, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_table_idx_mysql` VALUES (52, 'J_PM_DEFAULT_REFS_IDX', '753', NULL, 'UNIQUE', 'BTREE', 1, 254, 0, 'new88', '2019-03-21 15:08:59', 'new88', '2019-03-21 15:08:59');
INSERT INTO `mc_table_idx_mysql` VALUES (53, 'J_PM_SECURITY_BINVAL_IDX', '755', NULL, 'UNIQUE', 'BTREE', 1, 255, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_table_idx_mysql` VALUES (54, 'J_PM_SECURITY_NODE_IDX', '757', NULL, 'UNIQUE', 'BTREE', 1, 256, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_table_idx_mysql` VALUES (55, 'J_PM_SECURITY_REFS_IDX', '759', NULL, 'UNIQUE', 'BTREE', 1, 257, 0, 'new88', '2019-03-21 15:09:00', 'new88', '2019-03-21 15:09:00');
INSERT INTO `mc_table_idx_mysql` VALUES (56, 'xcv234', '761', NULL, 'NORMAL', 'BTREE', 1, 258, 0, 'new88', '2019-03-21 15:10:54', 'new88', '2019-03-21 15:10:54');
INSERT INTO `mc_table_idx_mysql` VALUES (57, 'IDX_log_test_1', '844', NULL, 'UNIQUE', 'BTREE', 1, 266, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_table_idx_mysql` VALUES (58, 'IDX_log_test_2', '854,847,846', NULL, 'UNIQUE', 'BTREE', 2, 266, 0, 'new88', '2019-03-21 18:20:22', 'new88', '2019-03-21 18:20:22');
INSERT INTO `mc_table_idx_mysql` VALUES (64, 'others', '732', NULL, 'NORMAL', 'BTREE', 1, 247, 0, 'new88', '2019-03-21 19:18:43', 'new88', '2019-03-21 19:18:43');
INSERT INTO `mc_table_idx_mysql` VALUES (68, 'id_k', '1027', NULL, 'UNIQUE', 'BTREE', 1, 309, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33');
INSERT INTO `mc_table_idx_mysql` VALUES (69, 'level', '1028', NULL, 'UNIQUE', 'BTREE', 2, 309, 0, 'new88', '2019-03-22 17:12:33', 'new88', '2019-03-22 17:12:33');
INSERT INTO `mc_table_idx_mysql` VALUES (70, 'i_account_id', '1129', NULL, 'UNIQUE', 'BTREE', 1, 337, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (71, 'i_account_parent', '1130', NULL, 'UNIQUE', 'BTREE', 2, 337, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (72, 'i_sls97c14cust', '1144', NULL, 'UNIQUE', 'BTREE', 1, 339, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (73, 'i_sls97c14prod', '1143', NULL, 'UNIQUE', 'BTREE', 2, 339, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (74, 'i_sls97c14promo', '1146', NULL, 'UNIQUE', 'BTREE', 3, 339, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (75, 'i_sls97c14store', '1145', NULL, 'UNIQUE', 'BTREE', 4, 339, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (76, 'i_sls97speccust', '1156', NULL, 'UNIQUE', 'BTREE', 1, 340, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (77, 'i_sls97specprod', '1154', NULL, 'UNIQUE', 'BTREE', 2, 340, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (78, 'i_sls97specpromo', '1155', NULL, 'UNIQUE', 'BTREE', 3, 340, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (79, 'i_sls97specstore', '1157', NULL, 'UNIQUE', 'BTREE', 4, 340, 0, 'new88', '2019-03-26 10:30:13', 'new88', '2019-03-26 10:30:13');
INSERT INTO `mc_table_idx_mysql` VALUES (80, 'i_sls97gmp_gender', '1165', NULL, 'UNIQUE', 'BTREE', 1, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (81, 'i_sls97gmp_ms', '1166', NULL, 'UNIQUE', 'BTREE', 2, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (82, 'i_sls97gmp_pfam', '1167', NULL, 'UNIQUE', 'BTREE', 3, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (83, 'i_sls97gmp_pdept', '1168', NULL, 'UNIQUE', 'BTREE', 4, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (84, 'i_sls97gmp_pcat', '1169', NULL, 'UNIQUE', 'BTREE', 5, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (85, 'i_sls97gmp_tmonth', '1170', NULL, 'UNIQUE', 'BTREE', 6, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (86, 'i_sls97gmp_tquarter', '1171', NULL, 'UNIQUE', 'BTREE', 7, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (87, 'i_sls97gmp_tyear', '1172', NULL, 'UNIQUE', 'BTREE', 8, 341, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (88, 'i_sls97l05cust', '1191', NULL, 'UNIQUE', 'BTREE', 1, 344, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (89, 'i_sls97l05prod', '1190', NULL, 'UNIQUE', 'BTREE', 2, 344, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (90, 'i_sls97l05promo', '1192', NULL, 'UNIQUE', 'BTREE', 3, 344, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (91, 'i_sls97l05store', '1193', NULL, 'UNIQUE', 'BTREE', 4, 344, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (92, 'i_sls97lc100cust', '1207', NULL, 'UNIQUE', 'BTREE', 1, 346, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (93, 'i_sls97lc100prod', '1206', NULL, 'UNIQUE', 'BTREE', 2, 346, 0, 'new88', '2019-03-26 10:30:14', 'new88', '2019-03-26 10:30:14');
INSERT INTO `mc_table_idx_mysql` VALUES (94, 'i_sls97ll01cust', '1216', NULL, 'UNIQUE', 'BTREE', 1, 347, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (95, 'i_sls97ll01prod', '1214', NULL, 'UNIQUE', 'BTREE', 2, 347, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (96, 'i_sls97ll01time', '1215', NULL, 'UNIQUE', 'BTREE', 3, 347, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (97, 'i_sls97pl01cust', '1223', NULL, 'UNIQUE', 'BTREE', 1, 348, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (98, 'i_sls97pl01prod', '1221', NULL, 'UNIQUE', 'BTREE', 2, 348, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (99, 'i_sls97pl01time', '1222', NULL, 'UNIQUE', 'BTREE', 3, 348, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (100, 'i_category_id', '1228', NULL, 'UNIQUE', 'BTREE', 1, 349, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (101, 'i_category_parent', '1229', NULL, 'UNIQUE', 'BTREE', 2, 349, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (102, 'i_currency', '1232,1233', NULL, 'UNIQUE', 'BTREE', 1, 350, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (103, 'i_customer_id', '1236', NULL, 'UNIQUE', 'BTREE', 1, 351, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (104, 'i_cust_acct_num', '1237', NULL, 'UNIQUE', 'BTREE', 2, 351, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (105, 'i_customer_fname', '1239', NULL, 'UNIQUE', 'BTREE', 3, 351, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (106, 'i_customer_lname', '1238', NULL, 'UNIQUE', 'BTREE', 4, 351, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (107, 'i_cust_child_home', '1257', NULL, 'UNIQUE', 'BTREE', 5, 351, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (108, 'i_cust_postal_code', '1247', NULL, 'UNIQUE', 'BTREE', 6, 351, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (109, 'i_cust_region_id', '1249', NULL, 'UNIQUE', 'BTREE', 7, 351, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (110, 'i_department_id', '1267', NULL, 'UNIQUE', 'BTREE', 1, 353, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (111, 'i_empl_closure', '1270,1269', NULL, 'UNIQUE', 'BTREE', 1, 354, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (112, 'i_empl_closure_emp', '1269', NULL, 'UNIQUE', 'BTREE', 2, 354, 0, 'new88', '2019-03-26 10:30:15', 'new88', '2019-03-26 10:30:15');
INSERT INTO `mc_table_idx_mysql` VALUES (113, 'i_expense_store_id', '1272', NULL, 'UNIQUE', 'BTREE', 1, 355, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (114, 'i_expense_acct_id', '1273', NULL, 'UNIQUE', 'BTREE', 2, 355, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (115, 'i_expense_time_id', '1275', NULL, 'UNIQUE', 'BTREE', 3, 355, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (116, 'i_inv_97_prod_id', '1279', NULL, 'UNIQUE', 'BTREE', 1, 356, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (117, 'i_inv_97_store_id', '1282', NULL, 'UNIQUE', 'BTREE', 2, 356, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (118, 'i_inv_97_time_id', '1280', NULL, 'UNIQUE', 'BTREE', 3, 356, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (119, 'i_inv_97_wrhse_id', '1281', NULL, 'UNIQUE', 'BTREE', 4, 356, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (120, 'i_inv_98_prod_id', '1289', NULL, 'UNIQUE', 'BTREE', 1, 357, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (121, 'i_inv_98_store_id', '1292', NULL, 'UNIQUE', 'BTREE', 2, 357, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (122, 'i_inv_98_time_id', '1290', NULL, 'UNIQUE', 'BTREE', 3, 357, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (123, 'i_inv_98_wrhse_id', '1291', NULL, 'UNIQUE', 'BTREE', 4, 357, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (124, 'i_position_id', '1299', NULL, 'UNIQUE', 'BTREE', 1, 358, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (125, 'i_product_id', '1306', NULL, 'UNIQUE', 'BTREE', 1, 359, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (126, 'i_prod_brand_name', '1307', NULL, 'UNIQUE', 'BTREE', 2, 359, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (127, 'i_prod_class_id', '1305', NULL, 'UNIQUE', 'BTREE', 3, 359, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (128, 'i_product_name', '1308', NULL, 'UNIQUE', 'BTREE', 4, 359, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (129, 'i_product_sku', '1309', NULL, 'UNIQUE', 'BTREE', 5, 359, 0, 'new88', '2019-03-26 10:30:16', 'new88', '2019-03-26 10:30:16');
INSERT INTO `mc_table_idx_mysql` VALUES (130, 'i_salary_pay_date', '1335', NULL, 'UNIQUE', 'BTREE', 1, 363, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (131, 'i_salary_employee', '1336', NULL, 'UNIQUE', 'BTREE', 2, 363, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (132, 'i_sls_97_cust_id', '1345', NULL, 'UNIQUE', 'BTREE', 1, 364, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (133, 'i_sls_97_prod_id', '1343', NULL, 'UNIQUE', 'BTREE', 2, 364, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (134, 'i_sls_97_promo_id', '1346', NULL, 'UNIQUE', 'BTREE', 3, 364, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (135, 'i_sls_97_store_id', '1347', NULL, 'UNIQUE', 'BTREE', 4, 364, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (136, 'i_sls_97_time_id', '1344', NULL, 'UNIQUE', 'BTREE', 5, 364, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (137, 'i_sls_98_cust_id', '1353', NULL, 'UNIQUE', 'BTREE', 1, 365, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (138, 'i_sls_1998_prod_id', '1351', NULL, 'UNIQUE', 'BTREE', 2, 365, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (139, 'i_sls_1998_promo', '1354', NULL, 'UNIQUE', 'BTREE', 3, 365, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (140, 'i_sls_1998_store', '1355', NULL, 'UNIQUE', 'BTREE', 4, 365, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (141, 'i_sls_1998_time_id', '1352', NULL, 'UNIQUE', 'BTREE', 5, 365, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (142, 'i_sls_dec98_cust', '1361', NULL, 'UNIQUE', 'BTREE', 1, 366, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (143, 'i_sls_dec98_prod', '1359', NULL, 'UNIQUE', 'BTREE', 2, 366, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (144, 'i_sls_dec98_promo', '1362', NULL, 'UNIQUE', 'BTREE', 3, 366, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (145, 'i_sls_dec98_store', '1363', NULL, 'UNIQUE', 'BTREE', 4, 366, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (146, 'i_sls_dec98_time', '1360', NULL, 'UNIQUE', 'BTREE', 5, 366, 0, 'new88', '2019-03-26 10:30:17', 'new88', '2019-03-26 10:30:17');
INSERT INTO `mc_table_idx_mysql` VALUES (147, 'i_store_id', '1368', NULL, 'UNIQUE', 'BTREE', 1, 368, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (148, 'i_store_region_id', '1370', NULL, 'UNIQUE', 'BTREE', 2, 368, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (149, 'i_store_raggd_id', '1392', NULL, 'UNIQUE', 'BTREE', 1, 369, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (150, 'i_store_rggd_reg', '1394', NULL, 'UNIQUE', 'BTREE', 2, 369, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (151, 'i_time_id', '1416', NULL, 'UNIQUE', 'BTREE', 1, 370, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (152, 'i_time_day', '1417', NULL, 'UNIQUE', 'BTREE', 2, 370, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (153, 'i_time_year', '1420', NULL, 'UNIQUE', 'BTREE', 3, 370, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (154, 'i_time_quarter', '1424', NULL, 'UNIQUE', 'BTREE', 4, 370, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');
INSERT INTO `mc_table_idx_mysql` VALUES (155, 'i_time_month', '1423', NULL, 'UNIQUE', 'BTREE', 5, 370, 0, 'new88', '2019-03-26 10:30:18', 'new88', '2019-03-26 10:30:18');

-- ----------------------------
-- Table structure for mc_table_idx_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_idx_oracle`;
CREATE TABLE `mc_table_idx_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前索引关联的字段，可能多个，以，隔开，oracle的每个字段都还对应一个排序方式：asc，desc',
  `column_sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段对应的排序规则（对应字段）',
  `index_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '索引类型',
  `tablespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表空间',
  `schema_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模式',
  `location` int(10) NULL DEFAULT NULL COMMENT '索引位置（当前字段的一个位置标识，每张表的索引位置都是自增，唯一的）',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:否 1:是',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mc_table_pk_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_pk_oracle`;
CREATE TABLE `mc_table_pk_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键约束名',
  `sequence_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列名（oracle自增长，全局可以唯一，或者自己创建序列）',
  `sequence_status` int(10) NULL DEFAULT NULL COMMENT '序列状态，1:无主键 2:未填充 3:从新序列填充 4:从已有序列填充',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:未删除 1:已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_table_pk_oracle
-- ----------------------------
INSERT INTO `mc_table_pk_oracle` VALUES (2, 'SYS_C0011439', NULL, 2, 51, 1, 'xionghan1', '2019-03-12 05:24:24', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_pk_oracle` VALUES (3, 'SYS_C0012514', NULL, 2, 52, 1, 'xionghan1', '2019-03-12 05:24:32', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_pk_oracle` VALUES (4, 'PK_COL_INFO', NULL, 2, 97, 1, 'xionghan1', '2019-03-15 12:04:06', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_pk_oracle` VALUES (5, NULL, NULL, 1, 132, 1, 'oyr', '2019-03-19 10:50:46', 'oyr', '2019-03-22 17:39:43');
INSERT INTO `mc_table_pk_oracle` VALUES (6, 'ID_PK', NULL, 2, 133, 1, 'oyr', '2019-03-19 11:05:02', 'oyr', '2019-03-22 17:39:42');
INSERT INTO `mc_table_pk_oracle` VALUES (7, NULL, NULL, 1, 134, 1, 'oyr', '2019-03-19 11:53:59', 'oyr', '2019-03-22 17:39:42');
INSERT INTO `mc_table_pk_oracle` VALUES (8, NULL, NULL, 1, 139, 1, 'oyr', '2019-03-19 13:58:37', 'oyr', '2019-03-22 17:39:42');
INSERT INTO `mc_table_pk_oracle` VALUES (9, NULL, NULL, 1, 168, 1, 'oyr', '2019-03-19 21:01:26', 'oyr', '2019-03-20 16:03:57');
INSERT INTO `mc_table_pk_oracle` VALUES (10, 'xinjian_123124_PK', NULL, 1, 171, 0, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:44:37');
INSERT INTO `mc_table_pk_oracle` VALUES (11, 'rest_oracle_PK', NULL, 1, 172, 1, 'wzl1', '2019-03-20 09:51:03', 'wzl1', '2019-03-20 10:22:02');
INSERT INTO `mc_table_pk_oracle` VALUES (12, 'sjeifjoi_12i34joij_PK', NULL, 1, 173, 0, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07');
INSERT INTO `mc_table_pk_oracle` VALUES (13, 'asD1234_PK', NULL, 1, 174, 0, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39');
INSERT INTO `mc_table_pk_oracle` VALUES (14, 'asD1234_sadfsdf_PK', NULL, 1, 175, 1, 'wzl1', '2019-03-20 10:02:03', 'wzl1', '2019-03-20 15:38:39');
INSERT INTO `mc_table_pk_oracle` VALUES (15, 'asdf234_asfjiewjf_PK', NULL, 1, 176, 0, 'wzl1', '2019-03-20 10:05:21', 'wzl1', '2019-03-20 11:27:25');
INSERT INTO `mc_table_pk_oracle` VALUES (19, 'ORACLE_TABLE_2_PK', NULL, 2, 271, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_table_pk_oracle` VALUES (20, 'SYS_C009347', NULL, 2, 295, 1, 'new88', '2019-03-22 16:49:08', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_table_pk_oracle` VALUES (21, NULL, NULL, 1, 296, 1, 'new88', '2019-03-22 16:49:10', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_table_pk_oracle` VALUES (22, NULL, NULL, 1, 297, 1, 'new88', '2019-03-22 16:49:12', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_table_pk_oracle` VALUES (23, NULL, NULL, 1, 298, 1, 'new88', '2019-03-22 16:49:13', 'new88', '2019-03-22 17:39:42');
INSERT INTO `mc_table_pk_oracle` VALUES (24, NULL, NULL, 1, 312, 0, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23');
INSERT INTO `mc_table_pk_oracle` VALUES (25, 'ID_PK', NULL, 2, 313, 0, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');
INSERT INTO `mc_table_pk_oracle` VALUES (26, NULL, NULL, 1, 314, 0, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27');
INSERT INTO `mc_table_pk_oracle` VALUES (27, NULL, NULL, 1, 316, 0, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29');
INSERT INTO `mc_table_pk_oracle` VALUES (28, 'SYS_C009347', NULL, 2, 317, 0, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30');
INSERT INTO `mc_table_pk_oracle` VALUES (29, NULL, NULL, 1, 318, 0, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_table_pk_oracle` VALUES (30, NULL, NULL, 1, 319, 0, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_table_pk_oracle` VALUES (31, NULL, NULL, 1, 320, 0, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32');

-- ----------------------------
-- Table structure for mc_table_set_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_set_oracle`;
CREATE TABLE `mc_table_set_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tablespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表空间',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_table_set_oracle
-- ----------------------------
INSERT INTO `mc_table_set_oracle` VALUES (10, 'USERS', 171, 'wzl1', '2019-03-20 09:35:15', 'wzl1', '2019-03-20 09:44:37');
INSERT INTO `mc_table_set_oracle` VALUES (12, 'USERS', 173, 'wzl1', '2019-03-20 09:59:07', 'wzl1', '2019-03-20 09:59:07');
INSERT INTO `mc_table_set_oracle` VALUES (13, 'USERS', 174, 'wzl1', '2019-03-20 10:01:39', 'wzl1', '2019-03-20 10:01:39');
INSERT INTO `mc_table_set_oracle` VALUES (15, 'USERS', 176, 'wzl1', '2019-03-20 10:05:21', 'wzl1', '2019-03-20 11:27:25');
INSERT INTO `mc_table_set_oracle` VALUES (19, 'USERS', 271, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');
INSERT INTO `mc_table_set_oracle` VALUES (24, 'USERS', 312, 'new88', '2019-03-22 17:55:23', 'new88', '2019-03-22 17:55:23');
INSERT INTO `mc_table_set_oracle` VALUES (25, 'USERS', 313, 'new88', '2019-03-22 17:55:25', 'new88', '2019-03-22 17:55:25');
INSERT INTO `mc_table_set_oracle` VALUES (26, 'USERS', 314, 'new88', '2019-03-22 17:55:27', 'new88', '2019-03-22 17:55:27');
INSERT INTO `mc_table_set_oracle` VALUES (27, 'SYSTEM', 316, 'new88', '2019-03-22 17:55:29', 'new88', '2019-03-22 17:55:29');
INSERT INTO `mc_table_set_oracle` VALUES (28, 'zj_ns_1', 317, 'new88', '2019-03-22 17:55:30', 'new88', '2019-03-22 17:55:30');
INSERT INTO `mc_table_set_oracle` VALUES (29, 'zj_ns_1', 318, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_table_set_oracle` VALUES (30, 'USERS', 319, 'new88', '2019-03-22 17:55:31', 'new88', '2019-03-22 17:55:31');
INSERT INTO `mc_table_set_oracle` VALUES (31, 'USERS', 320, 'new88', '2019-03-22 17:55:32', 'new88', '2019-03-22 17:55:32');

-- ----------------------------
-- Table structure for mc_table_un_oracle
-- ----------------------------
DROP TABLE IF EXISTS `mc_table_un_oracle`;
CREATE TABLE `mc_table_un_oracle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一约束名',
  `column_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前表字段，可能有多个,以,隔开',
  `is_enabled` tinyint(1) NULL DEFAULT NULL COMMENT 'oracle 概念，是否启用，0:未启动 1:启用',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '表id',
  `location` int(10) NULL DEFAULT NULL COMMENT '位置（当前检查约束的一个位置标识，每张表的检查约束位置都是自增，唯一的）',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:未删除 1:已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_table_un_oracle
-- ----------------------------
INSERT INTO `mc_table_un_oracle` VALUES (1, 'name_uniq', '81', 1, 51, 1, 1, 'xionghan1', '2019-03-12 05:24:24', 'xionghan1', '2019-03-20 16:03:57');
INSERT INTO `mc_table_un_oracle` VALUES (2, 'un_cs30', '875', 1, 271, 1, 0, 'wzl1', '2019-03-22 14:36:07', 'wzl1', '2019-03-22 14:36:07');

-- ----------------------------
-- Table structure for mc_tag
-- ----------------------------
DROP TABLE IF EXISTS `mc_tag`;
CREATE TABLE `mc_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户ID',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前标签所属人id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '当前标签录入时间',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:未删除 1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_tag
-- ----------------------------
INSERT INTO `mc_tag` VALUES (7, 'tag1', 527, 'wzl1', '2019-03-10 22:38:36', 0);
INSERT INTO `mc_tag` VALUES (15, 'cs1', 527, 'wzl1', '2019-03-10 22:51:57', 0);
INSERT INTO `mc_tag` VALUES (16, 'cs2', 527, 'wzl1', '2019-03-10 22:52:35', 0);
INSERT INTO `mc_tag` VALUES (17, 'cs1A', 527, 'wzl1', '2019-03-11 05:55:45', 0);
INSERT INTO `mc_tag` VALUES (20, 'mysql表', 443, 'xionghan1', '2019-03-12 02:29:53', 0);
INSERT INTO `mc_tag` VALUES (21, '的', 527, 'wzl1', '2019-03-12 04:38:10', 0);
INSERT INTO `mc_tag` VALUES (22, 'tag2', 527, 'wzl1', '2019-03-12 04:47:59', 0);
INSERT INTO `mc_tag` VALUES (23, 'dept', 527, 'wzl1', '2019-03-12 22:57:44', 0);
INSERT INTO `mc_tag` VALUES (24, 'tag1', 443, 'xionghan1', '2019-03-15 11:56:59', 0);
INSERT INTO `mc_tag` VALUES (25, 'dd234', 443, 'xionghan1', '2019-03-15 12:04:06', 0);
INSERT INTO `mc_tag` VALUES (26, 'tag1', 528, 'new88', '2019-03-15 17:03:21', 0);
INSERT INTO `mc_tag` VALUES (27, '新标签1', 528, 'new88', '2019-03-15 17:34:08', 0);
INSERT INTO `mc_tag` VALUES (28, 'waijianlll', 527, 'wzl1', '2019-03-15 18:12:27', 0);
INSERT INTO `mc_tag` VALUES (29, 'tag2', 528, 'new88', '2019-03-18 10:39:53', 0);
INSERT INTO `mc_tag` VALUES (30, 'tag1', 456, 'oyr', '2019-03-19 10:50:46', 0);
INSERT INTO `mc_tag` VALUES (31, 'user_role', 527, 'wzl1', '2019-03-19 14:24:33', 0);
INSERT INTO `mc_tag` VALUES (32, 'user_dept', 527, 'wzl1', '2019-03-19 15:33:37', 0);
INSERT INTO `mc_tag` VALUES (33, 'user', 527, 'wzl1', '2019-03-19 15:52:13', 0);
INSERT INTO `mc_tag` VALUES (34, 'grade', 527, 'wzl1', '2019-03-19 15:56:31', 0);
INSERT INTO `mc_tag` VALUES (35, 'xcv', 456, 'oyr', '2019-03-19 21:00:41', 0);
INSERT INTO `mc_tag` VALUES (36, '调度34', 527, 'wzl1', '2019-03-20 09:51:03', 0);
INSERT INTO `mc_tag` VALUES (37, 'asdf234_asfjiewjf', 527, 'wzl1', '2019-03-20 10:05:21', 0);
INSERT INTO `mc_tag` VALUES (38, 'tag2', 443, 'xionghan1', '2019-03-20 15:37:38', 0);
INSERT INTO `mc_tag` VALUES (39, 'asas ', 443, 'xionghan1', '2019-03-20 16:25:26', 0);
INSERT INTO `mc_tag` VALUES (40, 'das', 443, 'xionghan1', '2019-03-20 16:28:41', 0);
INSERT INTO `mc_tag` VALUES (41, 'asd', 443, 'xionghan1', '2019-03-20 16:30:49', 0);
INSERT INTO `mc_tag` VALUES (42, '从法国 ', 443, 'xionghan1', '2019-03-20 16:31:54', 0);
INSERT INTO `mc_tag` VALUES (43, '阿瑟东', 443, 'xionghan1', '2019-03-20 16:38:28', 0);
INSERT INTO `mc_tag` VALUES (45, 'cssa', 443, 'xionghan1', '2019-03-20 16:44:57', 0);
INSERT INTO `mc_tag` VALUES (46, '此次', 443, 'xionghan1', '2019-03-20 16:59:19', 0);
INSERT INTO `mc_tag` VALUES (47, 'cs1', 443, 'xionghan1', '2019-03-20 17:03:36', 0);
INSERT INTO `mc_tag` VALUES (48, 'cs_22', 527, 'wzl1', '2019-03-20 18:45:22', 0);
INSERT INTO `mc_tag` VALUES (49, 'cs3', 527, 'wzl1', '2019-03-20 18:48:08', 0);
INSERT INTO `mc_tag` VALUES (50, 'cs741', 527, 'wzl1', '2019-03-20 18:56:36', 0);
INSERT INTO `mc_tag` VALUES (51, 'asddasdw', 527, 'wzl1', '2019-03-21 09:50:51', 0);
INSERT INTO `mc_tag` VALUES (52, '质量', 443, 'xionghan1', '2019-03-21 10:35:45', 0);
INSERT INTO `mc_tag` VALUES (53, 'oyr_cs1223', 527, 'wzl1', '2019-03-23 15:03:25', 0);

-- ----------------------------
-- Table structure for mc_theme
-- ----------------------------
DROP TABLE IF EXISTS `mc_theme`;
CREATE TABLE `mc_theme`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题名',
  `theme_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题代码',
  `use_count` int(10) NULL DEFAULT NULL COMMENT '当前主题使用次数',
  `renter_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0:未删除 1:已删除',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_theme
-- ----------------------------
INSERT INTO `mc_theme` VALUES (1, '主题1', '321654161', 23, 527, 0, 'wzl2', '2019-03-07 05:09:10', 'wzl2', '2019-03-23 15:15:54');
INSERT INTO `mc_theme` VALUES (2, '主题2', '147321', 14, 527, 0, 'wzl2', '2019-03-07 05:09:59', 'wzl2', '2019-03-21 11:07:23');
INSERT INTO `mc_theme` VALUES (3, 'sssss', '131231312313', 3, 528, 1, 'new88', '2019-03-12 03:49:18', 'new88', '2019-03-14 14:06:35');
INSERT INTO `mc_theme` VALUES (4, '4444', '4444', 70, 528, 0, 'new88', '2019-03-12 03:55:35', 'new88', '2019-03-26 10:46:24');
INSERT INTO `mc_theme` VALUES (5, '5555', '5555', 38, 528, 0, 'new88', '2019-03-12 03:55:48', 'new88', '2019-03-23 11:50:46');
INSERT INTO `mc_theme` VALUES (6, 'ceshi', '123', 5, 443, 0, 'xionghan1', '2019-03-15 11:27:44', 'xionghan1', '2019-03-21 15:41:33');
INSERT INTO `mc_theme` VALUES (7, 'yol132123456', '4657897946', 0, 533, 0, 'new1', '2019-03-20 15:20:42', 'new1', '2019-03-20 15:20:42');
INSERT INTO `mc_theme` VALUES (8, 'sl1231345', '79879', 0, 533, 0, 'new1', '2019-03-20 15:20:49', 'new1', '2019-03-20 15:20:49');
INSERT INTO `mc_theme` VALUES (9, 'asdfjowiejfi', '12314', 0, 528, 0, 'new88', '2019-03-21 11:07:34', 'new88', '2019-03-21 11:07:34');

-- ----------------------------
-- Table structure for mc_view_detail
-- ----------------------------
DROP TABLE IF EXISTS `mc_view_detail`;
CREATE TABLE `mc_view_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `view_sql` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视图sql',
  `arithmetic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '算法',
  `definiens` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定义者',
  `security` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全性',
  `check_option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查选项',
  `view_id` bigint(20) NULL DEFAULT NULL COMMENT '视图基本信息id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_view_detail
-- ----------------------------
INSERT INTO `mc_view_detail` VALUES (11, 'select * from dept', 'UNDEFINED', '`oyr`@`%`', 'definer', NULL, 94);
INSERT INTO `mc_view_detail` VALUES (22, 'CREATE ALGORITHM=UNDEFINED DEFINER=`wuguozhou`@`%` SQL SECURITY DEFINER VIEW `etl_view_test` AS select `ETL_FILE_REPOSITORY`.`RENTERID` AS `RENTERID`,`ETL_FILE_REPOSITORY`.`OWNER` AS `OWNER`,`ETL_FILE_REPOSITORY`.`TYPE` AS `TYPE`,`ETL_FILE_REPOSITORY`.`NAME` AS `NAME`,`ETL_FILE_REPOSITORY`.`GROUP` AS `GROUP`,`ETL_FILE_REPOSITORY`.`LASTSTATUS` AS `LASTSTATUS`,`ETL_FILE_REPOSITORY`.`LASTEXECTIME` AS `LASTEXECTIME`,`ETL_FILE_REPOSITORY`.`UPDATETIME` AS `UPDATETIME`,`ETL_FILE_REPOSITORY`.`DIRECTORY` AS `DIRECTORY`,`ETL_FILE_REPOSITORY`.`OBJECTID` AS `OBJECTID`,`ETL_FILE_REPOSITORY`.`DESCRIPTION` AS `DESCRIPTION`,`ETL_FILE_REPOSITORY`.`CREATETIME` AS `CREATETIME`,`ETL_FILE_REPOSITORY`.`ID` AS `ID`,`ETL_EXEC_RECORD_PART`.`EXECID` AS `EXECID`,`ETL_EXEC_RECORD_PART`.`OPERATOR` AS `OPERATOR`,`ETL_EXEC_RECORD_PART`.`BEGIN` AS `BEGIN`,`ETL_EXEC_RECORD_PART`.`END` AS `END`,`ETL_EXEC_RECORD_PART`.`STATUS` AS `STATUS`,`ETL_EXEC_RECORD_PART`.`READLINES` AS `READLINES`,`ETL_EXEC_RECORD_PART`.`WRITELINES` AS `WRITELINES` from (`ETL_EXEC_RECORD_PART` join `ETL_FILE_REPOSITORY`) where ((`ETL_EXEC_RECORD_PART`.`NAME` = `ETL_FILE_REPOSITORY`.`NAME`) and (`ETL_EXEC_RECORD_PART`.`OWNER` = `ETL_FILE_REPOSITORY`.`OWNER`))', 'UNDEFINED', '`wuguozhou`@`%`', 'DEFINER', NULL, 169);
INSERT INTO `mc_view_detail` VALUES (23, 'CREATE ALGORITHM=UNDEFINED DEFINER=`wuguozhou`@`%` SQL SECURITY DEFINER VIEW `single_table` AS select `SEQ_TABLE`.`SEQ_NAME` AS `SEQ_NAME`,`SEQ_TABLE`.`SEQ_VALUE` AS `SEQ_VALUE` from `SEQ_TABLE`', 'UNDEFINED', '`wuguozhou`@`%`', 'DEFINER', NULL, 210);

-- ----------------------------
-- Table structure for oyr_test
-- ----------------------------
DROP TABLE IF EXISTS `oyr_test`;
CREATE TABLE `oyr_test`  (
  `id` int(10) NULL DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
