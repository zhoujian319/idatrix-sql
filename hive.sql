/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.83_root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.0.0.83:3306
 Source Schema         : hive

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 27/03/2019 09:35:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aux_table
-- ----------------------------
DROP TABLE IF EXISTS `aux_table`;
CREATE TABLE `aux_table`  (
  `MT_KEY1` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `MT_KEY2` bigint(20) NOT NULL,
  `MT_COMMENT` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MT_KEY1`, `MT_KEY2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bucketing_cols
-- ----------------------------
DROP TABLE IF EXISTS `bucketing_cols`;
CREATE TABLE `bucketing_cols`  (
  `SD_ID` bigint(20) NOT NULL,
  `BUCKET_COL_NAME` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`, `INTEGER_IDX`) USING BTREE,
  INDEX `BUCKETING_COLS_N49`(`SD_ID`) USING BTREE,
  CONSTRAINT `BUCKETING_COLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cds
-- ----------------------------
DROP TABLE IF EXISTS `cds`;
CREATE TABLE `cds`  (
  `CD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CD_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cds
-- ----------------------------
INSERT INTO `cds` VALUES (1);
INSERT INTO `cds` VALUES (2);
INSERT INTO `cds` VALUES (6);
INSERT INTO `cds` VALUES (7);
INSERT INTO `cds` VALUES (8);
INSERT INTO `cds` VALUES (9);
INSERT INTO `cds` VALUES (10);
INSERT INTO `cds` VALUES (11);
INSERT INTO `cds` VALUES (12);
INSERT INTO `cds` VALUES (13);
INSERT INTO `cds` VALUES (14);
INSERT INTO `cds` VALUES (15);
INSERT INTO `cds` VALUES (16);
INSERT INTO `cds` VALUES (17);
INSERT INTO `cds` VALUES (18);
INSERT INTO `cds` VALUES (19);
INSERT INTO `cds` VALUES (20);
INSERT INTO `cds` VALUES (21);
INSERT INTO `cds` VALUES (22);
INSERT INTO `cds` VALUES (23);
INSERT INTO `cds` VALUES (24);
INSERT INTO `cds` VALUES (25);
INSERT INTO `cds` VALUES (26);
INSERT INTO `cds` VALUES (27);
INSERT INTO `cds` VALUES (28);
INSERT INTO `cds` VALUES (29);
INSERT INTO `cds` VALUES (30);
INSERT INTO `cds` VALUES (31);
INSERT INTO `cds` VALUES (32);

-- ----------------------------
-- Table structure for columns_v2
-- ----------------------------
DROP TABLE IF EXISTS `columns_v2`;
CREATE TABLE `columns_v2`  (
  `CD_ID` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `COLUMN_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TYPE_NAME` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`CD_ID`, `COLUMN_NAME`) USING BTREE,
  INDEX `COLUMNS_V2_N49`(`CD_ID`) USING BTREE,
  CONSTRAINT `COLUMNS_V2_FK1` FOREIGN KEY (`CD_ID`) REFERENCES `cds` (`CD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of columns_v2
-- ----------------------------
INSERT INTO `columns_v2` VALUES (1, 'id', 'id', 'int', 0);
INSERT INTO `columns_v2` VALUES (1, 'name', 'name', 'string', 1);
INSERT INTO `columns_v2` VALUES (2, 'id', 'id', 'int', 0);
INSERT INTO `columns_v2` VALUES (6, '??', 'id', 'int', 0);
INSERT INTO `columns_v2` VALUES (6, '??', 'name', 'string', 1);
INSERT INTO `columns_v2` VALUES (7, '234', 'sdf234', 'smallint', 0);
INSERT INTO `columns_v2` VALUES (8, 'sdf234', 'sdf234', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (9, 'sdf234', 'sdf234', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (10, 'sdf234', 'sdf234', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (11, 'sdf234', 'sdf234', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (12, '234', 'test', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (13, '234', 'id', 'smallint', 0);
INSERT INTO `columns_v2` VALUES (14, 'sdf234', 'sd24', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (15, '234', 'sdf234', 'int', 0);
INSERT INTO `columns_v2` VALUES (16, 'K123123', 'kk', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (17, 'KK ', 'king', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (18, 'KK', 'robin', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (19, 'KK', 'robin', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (20, 'KK', 'robin', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (21, 'KK ', 'hvie', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (22, 'KK ', 'hvie', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (23, 'KK ', 'hvie', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (24, 'KK ', 'hvie', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (25, 'FF', 'ff', 'tinyint', 0);
INSERT INTO `columns_v2` VALUES (26, 'sdfsdf', 'dd234', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (27, 'dfdf', 'dfdf', 'float', 0);
INSERT INTO `columns_v2` VALUES (28, 'xdf', 'dd234', 'boolean', 0);
INSERT INTO `columns_v2` VALUES (29, 'W', 's', 'double', 0);
INSERT INTO `columns_v2` VALUES (30, 'S', 's', 'boolean', 0);
INSERT INTO `columns_v2` VALUES (31, 'sadf234', 'xcv234', 'bigint', 0);
INSERT INTO `columns_v2` VALUES (32, 'a', 'a', 'int', 0);
INSERT INTO `columns_v2` VALUES (32, 'b', 'b', 'string', 1);

-- ----------------------------
-- Table structure for compaction_queue
-- ----------------------------
DROP TABLE IF EXISTS `compaction_queue`;
CREATE TABLE `compaction_queue`  (
  `CQ_ID` bigint(20) NOT NULL,
  `CQ_DATABASE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CQ_TABLE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CQ_PARTITION` varchar(767) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CQ_STATE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CQ_TYPE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CQ_TBLPROPERTIES` varchar(2048) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CQ_WORKER_ID` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CQ_START` bigint(20) NULL DEFAULT NULL,
  `CQ_RUN_AS` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CQ_HIGHEST_TXN_ID` bigint(20) NULL DEFAULT NULL,
  `CQ_META_INFO` varbinary(2048) NULL DEFAULT NULL,
  `CQ_HADOOP_JOB_ID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CQ_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for completed_compactions
-- ----------------------------
DROP TABLE IF EXISTS `completed_compactions`;
CREATE TABLE `completed_compactions`  (
  `CC_ID` bigint(20) NOT NULL,
  `CC_DATABASE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CC_TABLE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CC_PARTITION` varchar(767) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CC_STATE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CC_TYPE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CC_TBLPROPERTIES` varchar(2048) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CC_WORKER_ID` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CC_START` bigint(20) NULL DEFAULT NULL,
  `CC_END` bigint(20) NULL DEFAULT NULL,
  `CC_RUN_AS` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CC_HIGHEST_TXN_ID` bigint(20) NULL DEFAULT NULL,
  `CC_META_INFO` varbinary(2048) NULL DEFAULT NULL,
  `CC_HADOOP_JOB_ID` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for completed_txn_components
-- ----------------------------
DROP TABLE IF EXISTS `completed_txn_components`;
CREATE TABLE `completed_txn_components`  (
  `CTC_TXNID` bigint(20) NOT NULL,
  `CTC_DATABASE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CTC_TABLE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `CTC_PARTITION` varchar(767) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for database_params
-- ----------------------------
DROP TABLE IF EXISTS `database_params`;
CREATE TABLE `database_params`  (
  `DB_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(180) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`DB_ID`, `PARAM_KEY`) USING BTREE,
  INDEX `DATABASE_PARAMS_N49`(`DB_ID`) USING BTREE,
  CONSTRAINT `DATABASE_PARAMS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `dbs` (`DB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_privs
-- ----------------------------
DROP TABLE IF EXISTS `db_privs`;
CREATE TABLE `db_privs`  (
  `DB_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) NULL DEFAULT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `DB_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`DB_GRANT_ID`) USING BTREE,
  UNIQUE INDEX `DBPRIVILEGEINDEX`(`DB_ID`, `PRINCIPAL_NAME`, `PRINCIPAL_TYPE`, `DB_PRIV`, `GRANTOR`, `GRANTOR_TYPE`) USING BTREE,
  INDEX `DB_PRIVS_N49`(`DB_ID`) USING BTREE,
  CONSTRAINT `DB_PRIVS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `dbs` (`DB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dbs
-- ----------------------------
DROP TABLE IF EXISTS `dbs`;
CREATE TABLE `dbs`  (
  `DB_ID` bigint(20) NOT NULL,
  `DESC` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `DB_LOCATION_URI` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `OWNER_TYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`DB_ID`) USING BTREE,
  UNIQUE INDEX `UNIQUE_DATABASE`(`NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dbs
-- ----------------------------
INSERT INTO `dbs` VALUES (1, 'Default Hive database', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse', 'default', 'public', 'ROLE');
INSERT INTO `dbs` VALUES (2, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive888.db', 'hive888', NULL, 'USER');
INSERT INTO `dbs` VALUES (3, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hbase_create1.db', 'test_hbase_create1', NULL, 'USER');
INSERT INTO `dbs` VALUES (6, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/zj1229.db', 'zj1229', NULL, 'USER');
INSERT INTO `dbs` VALUES (7, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create1.db', 'test_hive_create1', NULL, 'USER');
INSERT INTO `dbs` VALUES (8, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db', 'test_hive_create', NULL, 'USER');
INSERT INTO `dbs` VALUES (9, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/alisa1.db', 'alisa1', NULL, 'USER');
INSERT INTO `dbs` VALUES (10, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive1.db', 'hive1', NULL, 'USER');
INSERT INTO `dbs` VALUES (11, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive2.db', 'hive2', NULL, 'USER');
INSERT INTO `dbs` VALUES (12, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive.db', 'hive', NULL, 'USER');
INSERT INTO `dbs` VALUES (13, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive_inst1.db', 'hive_inst1', NULL, 'USER');
INSERT INTO `dbs` VALUES (14, '', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive_inst2.db', 'hive_inst2', NULL, 'USER');

-- ----------------------------
-- Table structure for delegation_tokens
-- ----------------------------
DROP TABLE IF EXISTS `delegation_tokens`;
CREATE TABLE `delegation_tokens`  (
  `TOKEN_IDENT` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TOKEN` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`TOKEN_IDENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for func_ru
-- ----------------------------
DROP TABLE IF EXISTS `func_ru`;
CREATE TABLE `func_ru`  (
  `FUNC_ID` bigint(20) NOT NULL,
  `RESOURCE_TYPE` int(11) NOT NULL,
  `RESOURCE_URI` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`FUNC_ID`, `INTEGER_IDX`) USING BTREE,
  CONSTRAINT `FUNC_RU_FK1` FOREIGN KEY (`FUNC_ID`) REFERENCES `funcs` (`FUNC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for funcs
-- ----------------------------
DROP TABLE IF EXISTS `funcs`;
CREATE TABLE `funcs`  (
  `FUNC_ID` bigint(20) NOT NULL,
  `CLASS_NAME` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) NULL DEFAULT NULL,
  `FUNC_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `FUNC_TYPE` int(11) NOT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `OWNER_TYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`FUNC_ID`) USING BTREE,
  UNIQUE INDEX `UNIQUEFUNCTION`(`FUNC_NAME`, `DB_ID`) USING BTREE,
  INDEX `FUNCS_N49`(`DB_ID`) USING BTREE,
  CONSTRAINT `FUNCS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `dbs` (`DB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for global_privs
-- ----------------------------
DROP TABLE IF EXISTS `global_privs`;
CREATE TABLE `global_privs`  (
  `USER_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `USER_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`USER_GRANT_ID`) USING BTREE,
  UNIQUE INDEX `GLOBALPRIVILEGEINDEX`(`PRINCIPAL_NAME`, `PRINCIPAL_TYPE`, `USER_PRIV`, `GRANTOR`, `GRANTOR_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of global_privs
-- ----------------------------
INSERT INTO `global_privs` VALUES (1, 1545709751, 1, 'admin', 'ROLE', 'admin', 'ROLE', 'All');

-- ----------------------------
-- Table structure for hive_locks
-- ----------------------------
DROP TABLE IF EXISTS `hive_locks`;
CREATE TABLE `hive_locks`  (
  `HL_LOCK_EXT_ID` bigint(20) NOT NULL,
  `HL_LOCK_INT_ID` bigint(20) NOT NULL,
  `HL_TXNID` bigint(20) NULL DEFAULT NULL,
  `HL_DB` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HL_TABLE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HL_PARTITION` varchar(767) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HL_LOCK_STATE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HL_LOCK_TYPE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HL_LAST_HEARTBEAT` bigint(20) NOT NULL,
  `HL_ACQUIRED_AT` bigint(20) NULL DEFAULT NULL,
  `HL_USER` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HL_HOST` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `HL_HEARTBEAT_COUNT` int(11) NULL DEFAULT NULL,
  `HL_AGENT_INFO` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HL_BLOCKEDBY_EXT_ID` bigint(20) NULL DEFAULT NULL,
  `HL_BLOCKEDBY_INT_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`HL_LOCK_EXT_ID`, `HL_LOCK_INT_ID`) USING BTREE,
  INDEX `HIVE_LOCK_TXNID_INDEX`(`HL_TXNID`) USING BTREE,
  INDEX `HL_TXNID_IDX`(`HL_TXNID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for idxs
-- ----------------------------
DROP TABLE IF EXISTS `idxs`;
CREATE TABLE `idxs`  (
  `INDEX_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DEFERRED_REBUILD` bit(1) NOT NULL,
  `INDEX_HANDLER_CLASS` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `INDEX_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `INDEX_TBL_ID` bigint(20) NULL DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `ORIG_TBL_ID` bigint(20) NULL DEFAULT NULL,
  `SD_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`) USING BTREE,
  UNIQUE INDEX `UNIQUEINDEX`(`INDEX_NAME`, `ORIG_TBL_ID`) USING BTREE,
  INDEX `IDXS_N51`(`SD_ID`) USING BTREE,
  INDEX `IDXS_N50`(`INDEX_TBL_ID`) USING BTREE,
  INDEX `IDXS_N49`(`ORIG_TBL_ID`) USING BTREE,
  CONSTRAINT `IDXS_FK1` FOREIGN KEY (`ORIG_TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXS_FK2` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `IDXS_FK3` FOREIGN KEY (`INDEX_TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for index_params
-- ----------------------------
DROP TABLE IF EXISTS `index_params`;
CREATE TABLE `index_params`  (
  `INDEX_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`, `PARAM_KEY`) USING BTREE,
  INDEX `INDEX_PARAMS_N49`(`INDEX_ID`) USING BTREE,
  CONSTRAINT `INDEX_PARAMS_FK1` FOREIGN KEY (`INDEX_ID`) REFERENCES `idxs` (`INDEX_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for key_constraints
-- ----------------------------
DROP TABLE IF EXISTS `key_constraints`;
CREATE TABLE `key_constraints`  (
  `CHILD_CD_ID` bigint(20) NULL DEFAULT NULL,
  `CHILD_INTEGER_IDX` int(11) NULL DEFAULT NULL,
  `CHILD_TBL_ID` bigint(20) NULL DEFAULT NULL,
  `PARENT_CD_ID` bigint(20) NOT NULL,
  `PARENT_INTEGER_IDX` int(11) NOT NULL,
  `PARENT_TBL_ID` bigint(20) NOT NULL,
  `POSITION` bigint(20) NOT NULL,
  `CONSTRAINT_NAME` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CONSTRAINT_TYPE` smallint(6) NOT NULL,
  `UPDATE_RULE` smallint(6) NULL DEFAULT NULL,
  `DELETE_RULE` smallint(6) NULL DEFAULT NULL,
  `ENABLE_VALIDATE_RELY` smallint(6) NOT NULL,
  PRIMARY KEY (`CONSTRAINT_NAME`, `POSITION`) USING BTREE,
  INDEX `CONSTRAINTS_PARENT_TABLE_ID_INDEX`(`PARENT_TBL_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for master_keys
-- ----------------------------
DROP TABLE IF EXISTS `master_keys`;
CREATE TABLE `master_keys`  (
  `KEY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MASTER_KEY` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`KEY_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for next_compaction_queue_id
-- ----------------------------
DROP TABLE IF EXISTS `next_compaction_queue_id`;
CREATE TABLE `next_compaction_queue_id`  (
  `NCQ_NEXT` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of next_compaction_queue_id
-- ----------------------------
INSERT INTO `next_compaction_queue_id` VALUES (1);

-- ----------------------------
-- Table structure for next_lock_id
-- ----------------------------
DROP TABLE IF EXISTS `next_lock_id`;
CREATE TABLE `next_lock_id`  (
  `NL_NEXT` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of next_lock_id
-- ----------------------------
INSERT INTO `next_lock_id` VALUES (1);

-- ----------------------------
-- Table structure for next_txn_id
-- ----------------------------
DROP TABLE IF EXISTS `next_txn_id`;
CREATE TABLE `next_txn_id`  (
  `NTXN_NEXT` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of next_txn_id
-- ----------------------------
INSERT INTO `next_txn_id` VALUES (1);

-- ----------------------------
-- Table structure for notification_log
-- ----------------------------
DROP TABLE IF EXISTS `notification_log`;
CREATE TABLE `notification_log`  (
  `NL_ID` bigint(20) NOT NULL,
  `EVENT_ID` bigint(20) NOT NULL,
  `EVENT_TIME` int(11) NOT NULL,
  `EVENT_TYPE` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TBL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `MESSAGE` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`NL_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notification_sequence
-- ----------------------------
DROP TABLE IF EXISTS `notification_sequence`;
CREATE TABLE `notification_sequence`  (
  `NNI_ID` bigint(20) NOT NULL,
  `NEXT_EVENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`NNI_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nucleus_tables
-- ----------------------------
DROP TABLE IF EXISTS `nucleus_tables`;
CREATE TABLE `nucleus_tables`  (
  `CLASS_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TYPE` varchar(4) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `OWNER` varchar(2) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `VERSION` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTERFACE_NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`CLASS_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for part_col_privs
-- ----------------------------
DROP TABLE IF EXISTS `part_col_privs`;
CREATE TABLE `part_col_privs`  (
  `PART_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(1000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PART_ID` bigint(20) NULL DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PART_COL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`PART_COLUMN_GRANT_ID`) USING BTREE,
  INDEX `PART_COL_PRIVS_N49`(`PART_ID`) USING BTREE,
  INDEX `PARTITIONCOLUMNPRIVILEGEINDEX`(`PART_ID`, `COLUMN_NAME`, `PRINCIPAL_NAME`, `PRINCIPAL_TYPE`, `PART_COL_PRIV`, `GRANTOR`, `GRANTOR_TYPE`) USING BTREE,
  CONSTRAINT `PART_COL_PRIVS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `partitions` (`PART_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for part_col_stats
-- ----------------------------
DROP TABLE IF EXISTS `part_col_stats`;
CREATE TABLE `part_col_stats`  (
  `CS_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARTITION_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_NAME` varchar(1000) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PART_ID` bigint(20) NOT NULL,
  `LONG_LOW_VALUE` bigint(20) NULL DEFAULT NULL,
  `LONG_HIGH_VALUE` bigint(20) NULL DEFAULT NULL,
  `DOUBLE_HIGH_VALUE` double(53, 4) NULL DEFAULT NULL,
  `DOUBLE_LOW_VALUE` double(53, 4) NULL DEFAULT NULL,
  `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `NUM_NULLS` bigint(20) NOT NULL,
  `NUM_DISTINCTS` bigint(20) NULL DEFAULT NULL,
  `AVG_COL_LEN` double(53, 4) NULL DEFAULT NULL,
  `MAX_COL_LEN` bigint(20) NULL DEFAULT NULL,
  `NUM_TRUES` bigint(20) NULL DEFAULT NULL,
  `NUM_FALSES` bigint(20) NULL DEFAULT NULL,
  `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`) USING BTREE,
  INDEX `PART_COL_STATS_FK`(`PART_ID`) USING BTREE,
  INDEX `PCS_STATS_IDX`(`DB_NAME`, `TABLE_NAME`, `COLUMN_NAME`, `PARTITION_NAME`) USING BTREE,
  CONSTRAINT `PART_COL_STATS_FK` FOREIGN KEY (`PART_ID`) REFERENCES `partitions` (`PART_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for part_privs
-- ----------------------------
DROP TABLE IF EXISTS `part_privs`;
CREATE TABLE `part_privs`  (
  `PART_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PART_ID` bigint(20) NULL DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PART_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`PART_GRANT_ID`) USING BTREE,
  INDEX `PARTPRIVILEGEINDEX`(`PART_ID`, `PRINCIPAL_NAME`, `PRINCIPAL_TYPE`, `PART_PRIV`, `GRANTOR`, `GRANTOR_TYPE`) USING BTREE,
  INDEX `PART_PRIVS_N49`(`PART_ID`) USING BTREE,
  CONSTRAINT `PART_PRIVS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `partitions` (`PART_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for partition_events
-- ----------------------------
DROP TABLE IF EXISTS `partition_events`;
CREATE TABLE `partition_events`  (
  `PART_NAME_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `EVENT_TIME` bigint(20) NOT NULL,
  `EVENT_TYPE` int(11) NOT NULL,
  `PARTITION_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TBL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`PART_NAME_ID`) USING BTREE,
  INDEX `PARTITIONEVENTINDEX`(`PARTITION_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for partition_key_vals
-- ----------------------------
DROP TABLE IF EXISTS `partition_key_vals`;
CREATE TABLE `partition_key_vals`  (
  `PART_ID` bigint(20) NOT NULL,
  `PART_KEY_VAL` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`PART_ID`, `INTEGER_IDX`) USING BTREE,
  INDEX `PARTITION_KEY_VALS_N49`(`PART_ID`) USING BTREE,
  CONSTRAINT `PARTITION_KEY_VALS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `partitions` (`PART_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for partition_keys
-- ----------------------------
DROP TABLE IF EXISTS `partition_keys`;
CREATE TABLE `partition_keys`  (
  `TBL_ID` bigint(20) NOT NULL,
  `PKEY_COMMENT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PKEY_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PKEY_TYPE` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TBL_ID`, `PKEY_NAME`) USING BTREE,
  INDEX `PARTITION_KEYS_N49`(`TBL_ID`) USING BTREE,
  CONSTRAINT `PARTITION_KEYS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partition_keys
-- ----------------------------
INSERT INTO `partition_keys` VALUES (2, NULL, 'name', 'string', 0);
INSERT INTO `partition_keys` VALUES (6, NULL, 'area', 'string', 1);
INSERT INTO `partition_keys` VALUES (6, NULL, 'year', 'string', 0);

-- ----------------------------
-- Table structure for partition_params
-- ----------------------------
DROP TABLE IF EXISTS `partition_params`;
CREATE TABLE `partition_params`  (
  `PART_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`PART_ID`, `PARAM_KEY`) USING BTREE,
  INDEX `PARTITION_PARAMS_N49`(`PART_ID`) USING BTREE,
  CONSTRAINT `PARTITION_PARAMS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `partitions` (`PART_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for partitions
-- ----------------------------
DROP TABLE IF EXISTS `partitions`;
CREATE TABLE `partitions`  (
  `PART_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `PART_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `SD_ID` bigint(20) NULL DEFAULT NULL,
  `TBL_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`PART_ID`) USING BTREE,
  UNIQUE INDEX `UNIQUEPARTITION`(`PART_NAME`, `TBL_ID`) USING BTREE,
  INDEX `PARTITIONS_N49`(`TBL_ID`) USING BTREE,
  INDEX `PARTITIONS_N50`(`SD_ID`) USING BTREE,
  CONSTRAINT `PARTITIONS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `PARTITIONS_FK2` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_map
-- ----------------------------
DROP TABLE IF EXISTS `role_map`;
CREATE TABLE `role_map`  (
  `ROLE_GRANT_ID` bigint(20) NOT NULL,
  `ADD_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `ROLE_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_GRANT_ID`) USING BTREE,
  UNIQUE INDEX `USERROLEMAPINDEX`(`PRINCIPAL_NAME`, `ROLE_ID`, `GRANTOR`, `GRANTOR_TYPE`) USING BTREE,
  INDEX `ROLE_MAP_N49`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `ROLE_MAP_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `ROLE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `ROLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE,
  UNIQUE INDEX `ROLEENTITYINDEX`(`ROLE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 1545709751, 'admin', 'admin');
INSERT INTO `roles` VALUES (2, 1545709751, 'public', 'public');

-- ----------------------------
-- Table structure for sd_params
-- ----------------------------
DROP TABLE IF EXISTS `sd_params`;
CREATE TABLE `sd_params`  (
  `SD_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`SD_ID`, `PARAM_KEY`) USING BTREE,
  INDEX `SD_PARAMS_N49`(`SD_ID`) USING BTREE,
  CONSTRAINT `SD_PARAMS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sds
-- ----------------------------
DROP TABLE IF EXISTS `sds`;
CREATE TABLE `sds`  (
  `SD_ID` bigint(20) NOT NULL,
  `CD_ID` bigint(20) NULL DEFAULT NULL,
  `INPUT_FORMAT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `IS_COMPRESSED` bit(1) NOT NULL,
  `IS_STOREDASSUBDIRECTORIES` bit(1) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `NUM_BUCKETS` int(11) NOT NULL,
  `OUTPUT_FORMAT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `SERDE_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`SD_ID`) USING BTREE,
  INDEX `SDS_N49`(`SERDE_ID`) USING BTREE,
  INDEX `SDS_N50`(`CD_ID`) USING BTREE,
  CONSTRAINT `SDS_FK1` FOREIGN KEY (`SERDE_ID`) REFERENCES `serdes` (`SERDE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SDS_FK2` FOREIGN KEY (`CD_ID`) REFERENCES `cds` (`CD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sds
-- ----------------------------
INSERT INTO `sds` VALUES (1, 1, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive888.db/hive8888db1', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 1);
INSERT INTO `sds` VALUES (2, 2, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive888.db/hive88db2', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 2);
INSERT INTO `sds` VALUES (6, 6, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/zj1229.db/tb_2', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 6);
INSERT INTO `sds` VALUES (7, 7, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/test_1', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 7);
INSERT INTO `sds` VALUES (8, 8, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/test_001', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 8);
INSERT INTO `sds` VALUES (9, 9, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/test_001_09', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 9);
INSERT INTO `sds` VALUES (10, 10, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/test002349', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 10);
INSERT INTO `sds` VALUES (11, 11, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/testwejfiji', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 11);
INSERT INTO `sds` VALUES (12, 12, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/datainiiji', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 12);
INSERT INTO `sds` VALUES (13, 13, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/english', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 13);
INSERT INTO `sds` VALUES (14, 14, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/steceh', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 14);
INSERT INTO `sds` VALUES (15, 15, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/new_en', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 15);
INSERT INTO `sds` VALUES (16, 16, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/hive_robin', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 16);
INSERT INTO `sds` VALUES (17, 17, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/robin_king', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 17);
INSERT INTO `sds` VALUES (18, 18, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/hive_1302', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 18);
INSERT INTO `sds` VALUES (19, 19, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/hive_1303', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 19);
INSERT INTO `sds` VALUES (20, 20, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/hive_1304', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 20);
INSERT INTO `sds` VALUES (21, 21, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/robin_hive_3001', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 21);
INSERT INTO `sds` VALUES (22, 22, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/robin_hive_3002', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 22);
INSERT INTO `sds` VALUES (23, 23, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/robin_hive_3003', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 23);
INSERT INTO `sds` VALUES (24, 24, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/robin_hive_3004', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 24);
INSERT INTO `sds` VALUES (25, 25, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/robin_hive3090', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 25);
INSERT INTO `sds` VALUES (26, 26, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/combine', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 26);
INSERT INTO `sds` VALUES (27, 27, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/zhognwenming', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 27);
INSERT INTO `sds` VALUES (28, 28, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/xinjain2999', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 28);
INSERT INTO `sds` VALUES (29, 29, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive1.db/hive123', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 29);
INSERT INTO `sds` VALUES (30, 30, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive1.db/hive22', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 30);
INSERT INTO `sds` VALUES (31, 31, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/test_hive_create.db/english_123', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 31);
INSERT INTO `sds` VALUES (32, 32, 'org.apache.hadoop.mapred.TextInputFormat', b'0', b'0', 'hdfs://ysbdh03.gdbd.com:8020/apps/hive/warehouse/hive_inst1.db/hive111', -1, 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat', 32);

-- ----------------------------
-- Table structure for sequence_table
-- ----------------------------
DROP TABLE IF EXISTS `sequence_table`;
CREATE TABLE `sequence_table`  (
  `SEQUENCE_NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `NEXT_VAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SEQUENCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence_table
-- ----------------------------
INSERT INTO `sequence_table` VALUES ('org.apache.hadoop.hive.metastore.model.MColumnDescriptor', 36);
INSERT INTO `sequence_table` VALUES ('org.apache.hadoop.hive.metastore.model.MDatabase', 16);
INSERT INTO `sequence_table` VALUES ('org.apache.hadoop.hive.metastore.model.MGlobalPrivilege', 6);
INSERT INTO `sequence_table` VALUES ('org.apache.hadoop.hive.metastore.model.MRole', 6);
INSERT INTO `sequence_table` VALUES ('org.apache.hadoop.hive.metastore.model.MSerDeInfo', 36);
INSERT INTO `sequence_table` VALUES ('org.apache.hadoop.hive.metastore.model.MStorageDescriptor', 36);
INSERT INTO `sequence_table` VALUES ('org.apache.hadoop.hive.metastore.model.MTable', 36);

-- ----------------------------
-- Table structure for serde_params
-- ----------------------------
DROP TABLE IF EXISTS `serde_params`;
CREATE TABLE `serde_params`  (
  `SERDE_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`, `PARAM_KEY`) USING BTREE,
  INDEX `SERDE_PARAMS_N49`(`SERDE_ID`) USING BTREE,
  CONSTRAINT `SERDE_PARAMS_FK1` FOREIGN KEY (`SERDE_ID`) REFERENCES `serdes` (`SERDE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of serde_params
-- ----------------------------
INSERT INTO `serde_params` VALUES (1, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (1, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (1, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (2, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (2, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (2, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (6, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (6, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (6, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (7, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (7, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (7, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (8, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (8, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (8, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (9, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (9, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (9, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (10, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (10, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (10, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (11, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (11, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (11, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (12, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (12, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (12, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (13, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (13, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (13, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (14, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (14, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (14, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (15, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (15, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (15, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (16, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (16, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (16, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (17, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (17, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (17, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (18, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (18, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (18, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (19, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (19, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (19, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (20, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (20, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (20, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (21, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (21, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (21, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (22, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (22, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (22, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (23, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (23, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (23, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (24, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (24, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (24, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (25, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (25, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (25, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (26, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (26, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (26, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (27, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (27, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (27, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (28, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (28, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (28, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (29, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (29, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (29, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (30, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (30, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (30, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (31, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (31, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (31, 'serialization.format', '	');
INSERT INTO `serde_params` VALUES (32, 'field.delim', '	');
INSERT INTO `serde_params` VALUES (32, 'line.delim', '\n');
INSERT INTO `serde_params` VALUES (32, 'serialization.format', '	');

-- ----------------------------
-- Table structure for serdes
-- ----------------------------
DROP TABLE IF EXISTS `serdes`;
CREATE TABLE `serdes`  (
  `SERDE_ID` bigint(20) NOT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `SLIB` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of serdes
-- ----------------------------
INSERT INTO `serdes` VALUES (1, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (2, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (6, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (7, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (8, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (9, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (10, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (11, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (12, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (13, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (14, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (15, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (16, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (17, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (18, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (19, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (20, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (21, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (22, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (23, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (24, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (25, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (26, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (27, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (28, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (29, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (30, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (31, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');
INSERT INTO `serdes` VALUES (32, NULL, 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe');

-- ----------------------------
-- Table structure for skewed_col_names
-- ----------------------------
DROP TABLE IF EXISTS `skewed_col_names`;
CREATE TABLE `skewed_col_names`  (
  `SD_ID` bigint(20) NOT NULL,
  `SKEWED_COL_NAME` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`, `INTEGER_IDX`) USING BTREE,
  INDEX `SKEWED_COL_NAMES_N49`(`SD_ID`) USING BTREE,
  CONSTRAINT `SKEWED_COL_NAMES_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skewed_col_value_loc_map
-- ----------------------------
DROP TABLE IF EXISTS `skewed_col_value_loc_map`;
CREATE TABLE `skewed_col_value_loc_map`  (
  `SD_ID` bigint(20) NOT NULL,
  `STRING_LIST_ID_KID` bigint(20) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`SD_ID`, `STRING_LIST_ID_KID`) USING BTREE,
  INDEX `SKEWED_COL_VALUE_LOC_MAP_N49`(`STRING_LIST_ID_KID`) USING BTREE,
  INDEX `SKEWED_COL_VALUE_LOC_MAP_N50`(`SD_ID`) USING BTREE,
  CONSTRAINT `SKEWED_COL_VALUE_LOC_MAP_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SKEWED_COL_VALUE_LOC_MAP_FK2` FOREIGN KEY (`STRING_LIST_ID_KID`) REFERENCES `skewed_string_list` (`STRING_LIST_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skewed_string_list
-- ----------------------------
DROP TABLE IF EXISTS `skewed_string_list`;
CREATE TABLE `skewed_string_list`  (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skewed_string_list_values
-- ----------------------------
DROP TABLE IF EXISTS `skewed_string_list_values`;
CREATE TABLE `skewed_string_list_values`  (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  `STRING_LIST_VALUE` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`, `INTEGER_IDX`) USING BTREE,
  INDEX `SKEWED_STRING_LIST_VALUES_N49`(`STRING_LIST_ID`) USING BTREE,
  CONSTRAINT `SKEWED_STRING_LIST_VALUES_FK1` FOREIGN KEY (`STRING_LIST_ID`) REFERENCES `skewed_string_list` (`STRING_LIST_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for skewed_values
-- ----------------------------
DROP TABLE IF EXISTS `skewed_values`;
CREATE TABLE `skewed_values`  (
  `SD_ID_OID` bigint(20) NOT NULL,
  `STRING_LIST_ID_EID` bigint(20) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID_OID`, `INTEGER_IDX`) USING BTREE,
  INDEX `SKEWED_VALUES_N50`(`SD_ID_OID`) USING BTREE,
  INDEX `SKEWED_VALUES_N49`(`STRING_LIST_ID_EID`) USING BTREE,
  CONSTRAINT `SKEWED_VALUES_FK1` FOREIGN KEY (`SD_ID_OID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `SKEWED_VALUES_FK2` FOREIGN KEY (`STRING_LIST_ID_EID`) REFERENCES `skewed_string_list` (`STRING_LIST_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sort_cols
-- ----------------------------
DROP TABLE IF EXISTS `sort_cols`;
CREATE TABLE `sort_cols`  (
  `SD_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(1000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `ORDER` int(11) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`, `INTEGER_IDX`) USING BTREE,
  INDEX `SORT_COLS_N49`(`SD_ID`) USING BTREE,
  CONSTRAINT `SORT_COLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tab_col_stats
-- ----------------------------
DROP TABLE IF EXISTS `tab_col_stats`;
CREATE TABLE `tab_col_stats`  (
  `CS_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_NAME` varchar(1000) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TBL_ID` bigint(20) NOT NULL,
  `LONG_LOW_VALUE` bigint(20) NULL DEFAULT NULL,
  `LONG_HIGH_VALUE` bigint(20) NULL DEFAULT NULL,
  `DOUBLE_HIGH_VALUE` double(53, 4) NULL DEFAULT NULL,
  `DOUBLE_LOW_VALUE` double(53, 4) NULL DEFAULT NULL,
  `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `NUM_NULLS` bigint(20) NOT NULL,
  `NUM_DISTINCTS` bigint(20) NULL DEFAULT NULL,
  `AVG_COL_LEN` double(53, 4) NULL DEFAULT NULL,
  `MAX_COL_LEN` bigint(20) NULL DEFAULT NULL,
  `NUM_TRUES` bigint(20) NULL DEFAULT NULL,
  `NUM_FALSES` bigint(20) NULL DEFAULT NULL,
  `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`) USING BTREE,
  INDEX `TAB_COL_STATS_FK`(`TBL_ID`) USING BTREE,
  CONSTRAINT `TAB_COL_STATS_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for table_params
-- ----------------------------
DROP TABLE IF EXISTS `table_params`;
CREATE TABLE `table_params`  (
  `TBL_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`TBL_ID`, `PARAM_KEY`) USING BTREE,
  INDEX `TABLE_PARAMS_N49`(`TBL_ID`) USING BTREE,
  CONSTRAINT `TABLE_PARAMS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table_params
-- ----------------------------
INSERT INTO `table_params` VALUES (1, 'comment', 'hive888');
INSERT INTO `table_params` VALUES (1, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (1, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"id\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"comment\":\"id\"}},{\"name\":\"name\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"comment\":\"name\"}}]}');
INSERT INTO `table_params` VALUES (1, 'transient_lastDdlTime', '1545876901');
INSERT INTO `table_params` VALUES (2, 'comment', 'hive888');
INSERT INTO `table_params` VALUES (2, 'spark.sql.sources.schema.numPartCols', '1');
INSERT INTO `table_params` VALUES (2, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (2, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"id\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"comment\":\"id\"}},{\"name\":\"name\",\"type\":\"string\",\"nullable\":true,\"metadata\":{}}]}');
INSERT INTO `table_params` VALUES (2, 'spark.sql.sources.schema.partCol.0', 'name');
INSERT INTO `table_params` VALUES (2, 'transient_lastDdlTime', '1545876937');
INSERT INTO `table_params` VALUES (6, 'comment', 'hive????');
INSERT INTO `table_params` VALUES (6, 'spark.sql.sources.schema.numPartCols', '2');
INSERT INTO `table_params` VALUES (6, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (6, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"id\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"comment\":\"??\"}},{\"name\":\"name\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"comment\":\"??\"}},{\"name\":\"year\",\"type\":\"string\",\"nullable\":true,\"metadata\":{}},{\"name\":\"area\",\"type\":\"string\",\"nullable\":true,\"metadata\":{}}]}');
INSERT INTO `table_params` VALUES (6, 'spark.sql.sources.schema.partCol.0', 'year');
INSERT INTO `table_params` VALUES (6, 'spark.sql.sources.schema.partCol.1', 'area');
INSERT INTO `table_params` VALUES (6, 'transient_lastDdlTime', '1550023964');
INSERT INTO `table_params` VALUES (7, 'comment', 'd');
INSERT INTO `table_params` VALUES (7, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (7, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"sdf234\",\"type\":\"short\",\"nullable\":true,\"metadata\":{\"comment\":\"234\"}}]}');
INSERT INTO `table_params` VALUES (7, 'transient_lastDdlTime', '1552044728');
INSERT INTO `table_params` VALUES (8, 'comment', '???');
INSERT INTO `table_params` VALUES (8, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (8, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"sdf234\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"sdf234\"}}]}');
INSERT INTO `table_params` VALUES (8, 'transient_lastDdlTime', '1552045366');
INSERT INTO `table_params` VALUES (9, 'comment', '???');
INSERT INTO `table_params` VALUES (9, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (9, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"sdf234\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"sdf234\"}}]}');
INSERT INTO `table_params` VALUES (9, 'transient_lastDdlTime', '1552045894');
INSERT INTO `table_params` VALUES (10, 'comment', '???');
INSERT INTO `table_params` VALUES (10, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (10, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"sdf234\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"sdf234\"}}]}');
INSERT INTO `table_params` VALUES (10, 'transient_lastDdlTime', '1552046221');
INSERT INTO `table_params` VALUES (11, 'comment', '???');
INSERT INTO `table_params` VALUES (11, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (11, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"sdf234\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"sdf234\"}}]}');
INSERT INTO `table_params` VALUES (11, 'transient_lastDdlTime', '1552046367');
INSERT INTO `table_params` VALUES (12, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (12, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"test\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"234\"}}]}');
INSERT INTO `table_params` VALUES (12, 'transient_lastDdlTime', '1552046492');
INSERT INTO `table_params` VALUES (13, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (13, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"id\",\"type\":\"short\",\"nullable\":true,\"metadata\":{\"comment\":\"234\"}}]}');
INSERT INTO `table_params` VALUES (13, 'transient_lastDdlTime', '1552046548');
INSERT INTO `table_params` VALUES (14, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (14, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"sd24\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"sdf234\"}}]}');
INSERT INTO `table_params` VALUES (14, 'transient_lastDdlTime', '1552046600');
INSERT INTO `table_params` VALUES (15, 'comment', 'd');
INSERT INTO `table_params` VALUES (15, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (15, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"sdf234\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"comment\":\"234\"}}]}');
INSERT INTO `table_params` VALUES (15, 'transient_lastDdlTime', '1552046701');
INSERT INTO `table_params` VALUES (16, 'comment', 'hive???');
INSERT INTO `table_params` VALUES (16, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (16, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"kk\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"K123123\"}}]}');
INSERT INTO `table_params` VALUES (16, 'transient_lastDdlTime', '1552107719');
INSERT INTO `table_params` VALUES (17, 'comment', 'Hive????');
INSERT INTO `table_params` VALUES (17, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (17, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"king\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK \"}}]}');
INSERT INTO `table_params` VALUES (17, 'transient_lastDdlTime', '1552108120');
INSERT INTO `table_params` VALUES (18, 'comment', 'HIVE??01');
INSERT INTO `table_params` VALUES (18, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (18, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"robin\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK\"}}]}');
INSERT INTO `table_params` VALUES (18, 'transient_lastDdlTime', '1552108445');
INSERT INTO `table_params` VALUES (19, 'comment', 'HIVE??01');
INSERT INTO `table_params` VALUES (19, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (19, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"robin\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK\"}}]}');
INSERT INTO `table_params` VALUES (19, 'transient_lastDdlTime', '1552108692');
INSERT INTO `table_params` VALUES (20, 'comment', 'HIVE??01');
INSERT INTO `table_params` VALUES (20, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (20, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"robin\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK\"}}]}');
INSERT INTO `table_params` VALUES (20, 'transient_lastDdlTime', '1552108982');
INSERT INTO `table_params` VALUES (21, 'comment', '???HIVE');
INSERT INTO `table_params` VALUES (21, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (21, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"hvie\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK \"}}]}');
INSERT INTO `table_params` VALUES (21, 'transient_lastDdlTime', '1552109597');
INSERT INTO `table_params` VALUES (22, 'comment', '???HIVE');
INSERT INTO `table_params` VALUES (22, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (22, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"hvie\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK \"}}]}');
INSERT INTO `table_params` VALUES (22, 'transient_lastDdlTime', '1552109716');
INSERT INTO `table_params` VALUES (23, 'comment', '???HIVE');
INSERT INTO `table_params` VALUES (23, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (23, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"hvie\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK \"}}]}');
INSERT INTO `table_params` VALUES (23, 'transient_lastDdlTime', '1552109904');
INSERT INTO `table_params` VALUES (24, 'comment', '???HIVE');
INSERT INTO `table_params` VALUES (24, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (24, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"hvie\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"KK \"}}]}');
INSERT INTO `table_params` VALUES (24, 'transient_lastDdlTime', '1552110007');
INSERT INTO `table_params` VALUES (25, 'comment', 'hive?????');
INSERT INTO `table_params` VALUES (25, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (25, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"FF\",\"type\":\"byte\",\"nullable\":true,\"metadata\":{\"comment\":\"FF\"}}]}');
INSERT INTO `table_params` VALUES (25, 'transient_lastDdlTime', '1552110661');
INSERT INTO `table_params` VALUES (26, 'comment', '??34');
INSERT INTO `table_params` VALUES (26, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (26, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"dd234\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"sdfsdf\"}}]}');
INSERT INTO `table_params` VALUES (26, 'transient_lastDdlTime', '1552112253');
INSERT INTO `table_params` VALUES (27, 'comment', 'd');
INSERT INTO `table_params` VALUES (27, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (27, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"dfdf\",\"type\":\"float\",\"nullable\":true,\"metadata\":{\"comment\":\"dfdf\"}}]}');
INSERT INTO `table_params` VALUES (27, 'transient_lastDdlTime', '1552115545');
INSERT INTO `table_params` VALUES (28, 'comment', 'wef');
INSERT INTO `table_params` VALUES (28, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (28, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"dd234\",\"type\":\"boolean\",\"nullable\":true,\"metadata\":{\"comment\":\"xdf\"}}]}');
INSERT INTO `table_params` VALUES (28, 'transient_lastDdlTime', '1552115600');
INSERT INTO `table_params` VALUES (29, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (29, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"S\",\"type\":\"double\",\"nullable\":true,\"metadata\":{\"comment\":\"W\"}}]}');
INSERT INTO `table_params` VALUES (29, 'transient_lastDdlTime', '1552552781');
INSERT INTO `table_params` VALUES (30, 'comment', 'D');
INSERT INTO `table_params` VALUES (30, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (30, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"S\",\"type\":\"boolean\",\"nullable\":true,\"metadata\":{\"comment\":\"S\"}}]}');
INSERT INTO `table_params` VALUES (30, 'transient_lastDdlTime', '1552553598');
INSERT INTO `table_params` VALUES (31, 'comment', 'sdf ');
INSERT INTO `table_params` VALUES (31, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (31, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"xcv234\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"comment\":\"sadf234\"}}]}');
INSERT INTO `table_params` VALUES (31, 'transient_lastDdlTime', '1553053067');
INSERT INTO `table_params` VALUES (32, 'comment', 'ssss');
INSERT INTO `table_params` VALUES (32, 'spark.sql.sources.schema.numParts', '1');
INSERT INTO `table_params` VALUES (32, 'spark.sql.sources.schema.part.0', '{\"type\":\"struct\",\"fields\":[{\"name\":\"a\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"comment\":\"a\"}},{\"name\":\"b\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"comment\":\"b\"}}]}');
INSERT INTO `table_params` VALUES (32, 'transient_lastDdlTime', '1553141023');

-- ----------------------------
-- Table structure for tbl_col_privs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_col_privs`;
CREATE TABLE `tbl_col_privs`  (
  `TBL_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(1000) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TBL_COL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TBL_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`TBL_COLUMN_GRANT_ID`) USING BTREE,
  INDEX `TABLECOLUMNPRIVILEGEINDEX`(`TBL_ID`, `COLUMN_NAME`, `PRINCIPAL_NAME`, `PRINCIPAL_TYPE`, `TBL_COL_PRIV`, `GRANTOR`, `GRANTOR_TYPE`) USING BTREE,
  INDEX `TBL_COL_PRIVS_N49`(`TBL_ID`) USING BTREE,
  CONSTRAINT `TBL_COL_PRIVS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_privs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_privs`;
CREATE TABLE `tbl_privs`  (
  `TBL_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TBL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TBL_ID` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`TBL_GRANT_ID`) USING BTREE,
  INDEX `TBL_PRIVS_N49`(`TBL_ID`) USING BTREE,
  INDEX `TABLEPRIVILEGEINDEX`(`TBL_ID`, `PRINCIPAL_NAME`, `PRINCIPAL_TYPE`, `TBL_PRIV`, `GRANTOR`, `GRANTOR_TYPE`) USING BTREE,
  CONSTRAINT `TBL_PRIVS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `tbls` (`TBL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbls
-- ----------------------------
DROP TABLE IF EXISTS `tbls`;
CREATE TABLE `tbls`  (
  `TBL_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) NULL DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `OWNER` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `RETENTION` int(11) NOT NULL,
  `SD_ID` bigint(20) NULL DEFAULT NULL,
  `TBL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TBL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `VIEW_EXPANDED_TEXT` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `VIEW_ORIGINAL_TEXT` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`TBL_ID`) USING BTREE,
  UNIQUE INDEX `UNIQUETABLE`(`TBL_NAME`, `DB_ID`) USING BTREE,
  INDEX `TBLS_N50`(`SD_ID`) USING BTREE,
  INDEX `TBLS_N49`(`DB_ID`) USING BTREE,
  CONSTRAINT `TBLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `sds` (`SD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `TBLS_FK2` FOREIGN KEY (`DB_ID`) REFERENCES `dbs` (`DB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbls
-- ----------------------------
INSERT INTO `tbls` VALUES (1, 1545876901, 2, 0, 'hive', 0, 1, 'hive8888db1', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (2, 1545876937, 2, 0, 'hive', 0, 2, 'hive88db2', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (6, 1550023964, 6, 0, 'hive', 0, 6, 'tb_2', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (7, 1552044728, 8, 0, 'hive', 0, 7, 'test_1', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (8, 1552045366, 8, 0, 'hive', 0, 8, 'test_001', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (9, 1552045894, 8, 0, 'hive', 0, 9, 'test_001_09', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (10, 1552046221, 8, 0, 'hive', 0, 10, 'test002349', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (11, 1552046367, 8, 0, 'hive', 0, 11, 'testwejfiji', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (12, 1552046492, 8, 0, 'hive', 0, 12, 'datainiiji', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (13, 1552046548, 8, 0, 'hive', 0, 13, 'english', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (14, 1552046600, 8, 0, 'hive', 0, 14, 'steceh', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (15, 1552046701, 8, 0, 'hive', 0, 15, 'new_en', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (16, 1552107719, 8, 0, 'hive', 0, 16, 'hive_robin', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (17, 1552108120, 8, 0, 'hive', 0, 17, 'robin_king', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (18, 1552108445, 8, 0, 'hive', 0, 18, 'hive_1302', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (19, 1552108692, 8, 0, 'hive', 0, 19, 'hive_1303', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (20, 1552108982, 8, 0, 'hive', 0, 20, 'hive_1304', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (21, 1552109597, 8, 0, 'hive', 0, 21, 'robin_hive_3001', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (22, 1552109716, 8, 0, 'hive', 0, 22, 'robin_hive_3002', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (23, 1552109904, 8, 0, 'hive', 0, 23, 'robin_hive_3003', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (24, 1552110007, 8, 0, 'hive', 0, 24, 'robin_hive_3004', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (25, 1552110661, 8, 0, 'hive', 0, 25, 'robin_hive3090', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (26, 1552112253, 8, 0, 'hive', 0, 26, 'combine', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (27, 1552115545, 8, 0, 'hive', 0, 27, 'zhognwenming', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (28, 1552115600, 8, 0, 'hive', 0, 28, 'xinjain2999', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (29, 1552552781, 10, 0, 'hive', 0, 29, 'hive123', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (30, 1552553598, 10, 0, 'hive', 0, 30, 'hive22', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (31, 1553053067, 8, 0, 'hive', 0, 31, 'english_123', 'MANAGED_TABLE', NULL, NULL);
INSERT INTO `tbls` VALUES (32, 1553141023, 13, 0, 'hive', 0, 32, 'hive111', 'MANAGED_TABLE', NULL, NULL);

-- ----------------------------
-- Table structure for txn_components
-- ----------------------------
DROP TABLE IF EXISTS `txn_components`;
CREATE TABLE `txn_components`  (
  `TC_TXNID` bigint(20) NOT NULL,
  `TC_DATABASE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TC_TABLE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TC_PARTITION` varchar(767) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TC_OPERATION_TYPE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `TC_TXNID`(`TC_TXNID`) USING BTREE,
  CONSTRAINT `txn_components_ibfk_1` FOREIGN KEY (`TC_TXNID`) REFERENCES `txns` (`TXN_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for txns
-- ----------------------------
DROP TABLE IF EXISTS `txns`;
CREATE TABLE `txns`  (
  `TXN_ID` bigint(20) NOT NULL,
  `TXN_STATE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TXN_STARTED` bigint(20) NOT NULL,
  `TXN_LAST_HEARTBEAT` bigint(20) NOT NULL,
  `TXN_USER` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TXN_HOST` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TXN_AGENT_INFO` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TXN_META_INFO` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `TXN_HEARTBEAT_COUNT` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`TXN_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for type_fields
-- ----------------------------
DROP TABLE IF EXISTS `type_fields`;
CREATE TABLE `type_fields`  (
  `TYPE_NAME` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `FIELD_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `FIELD_TYPE` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TYPE_NAME`, `FIELD_NAME`) USING BTREE,
  INDEX `TYPE_FIELDS_N49`(`TYPE_NAME`) USING BTREE,
  CONSTRAINT `TYPE_FIELDS_FK1` FOREIGN KEY (`TYPE_NAME`) REFERENCES `types` (`TYPES_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `TYPES_ID` bigint(20) NOT NULL,
  `TYPE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TYPE1` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `TYPE2` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`TYPES_ID`) USING BTREE,
  UNIQUE INDEX `UNIQUE_TYPE`(`TYPE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version`  (
  `VER_ID` bigint(20) NOT NULL,
  `SCHEMA_VERSION` varchar(127) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `VERSION_COMMENT` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`VER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES (1, '2.1.0', 'Hive release version 2.1.0');

-- ----------------------------
-- Table structure for write_set
-- ----------------------------
DROP TABLE IF EXISTS `write_set`;
CREATE TABLE `write_set`  (
  `WS_DATABASE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `WS_TABLE` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `WS_PARTITION` varchar(767) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `WS_TXNID` bigint(20) NOT NULL,
  `WS_COMMIT_ID` bigint(20) NOT NULL,
  `WS_OPERATION_TYPE` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
