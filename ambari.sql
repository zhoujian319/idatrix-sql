/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.83_root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.0.0.83:3306
 Source Schema         : ambari

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 29/03/2019 17:39:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminpermission
-- ----------------------------
DROP TABLE IF EXISTS `adminpermission`;
CREATE TABLE `adminpermission`  (
  `permission_id` bigint(20) NOT NULL,
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_type_id` int(11) NOT NULL,
  `permission_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `principal_id` bigint(20) NOT NULL,
  `sort_order` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `UQ_perm_name_resource_type_id`(`permission_name`, `resource_type_id`) USING BTREE,
  INDEX `FK_permission_resource_type_id`(`resource_type_id`) USING BTREE,
  INDEX `FK_permission_principal_id`(`principal_id`) USING BTREE,
  CONSTRAINT `FK_permission_principal_id` FOREIGN KEY (`principal_id`) REFERENCES `adminprincipal` (`principal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_permission_resource_type_id` FOREIGN KEY (`resource_type_id`) REFERENCES `adminresourcetype` (`resource_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adminprincipal
-- ----------------------------
DROP TABLE IF EXISTS `adminprincipal`;
CREATE TABLE `adminprincipal`  (
  `principal_id` bigint(20) NOT NULL,
  `principal_type_id` int(11) NOT NULL,
  PRIMARY KEY (`principal_id`) USING BTREE,
  INDEX `FK_principal_principal_type_id`(`principal_type_id`) USING BTREE,
  CONSTRAINT `FK_principal_principal_type_id` FOREIGN KEY (`principal_type_id`) REFERENCES `adminprincipaltype` (`principal_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adminprincipaltype
-- ----------------------------
DROP TABLE IF EXISTS `adminprincipaltype`;
CREATE TABLE `adminprincipaltype`  (
  `principal_type_id` int(11) NOT NULL,
  `principal_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`principal_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adminprivilege
-- ----------------------------
DROP TABLE IF EXISTS `adminprivilege`;
CREATE TABLE `adminprivilege`  (
  `privilege_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  `principal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`privilege_id`) USING BTREE,
  INDEX `FK_privilege_permission_id`(`permission_id`) USING BTREE,
  INDEX `FK_privilege_principal_id`(`principal_id`) USING BTREE,
  INDEX `FK_privilege_resource_id`(`resource_id`) USING BTREE,
  CONSTRAINT `FK_privilege_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `adminpermission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_privilege_principal_id` FOREIGN KEY (`principal_id`) REFERENCES `adminprincipal` (`principal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_privilege_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `adminresource` (`resource_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adminresource
-- ----------------------------
DROP TABLE IF EXISTS `adminresource`;
CREATE TABLE `adminresource`  (
  `resource_id` bigint(20) NOT NULL,
  `resource_type_id` int(11) NOT NULL,
  PRIMARY KEY (`resource_id`) USING BTREE,
  INDEX `FK_resource_resource_type_id`(`resource_type_id`) USING BTREE,
  CONSTRAINT `FK_resource_resource_type_id` FOREIGN KEY (`resource_type_id`) REFERENCES `adminresourcetype` (`resource_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adminresourcetype
-- ----------------------------
DROP TABLE IF EXISTS `adminresourcetype`;
CREATE TABLE `adminresourcetype`  (
  `resource_type_id` int(11) NOT NULL,
  `resource_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`resource_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_current
-- ----------------------------
DROP TABLE IF EXISTS `alert_current`;
CREATE TABLE `alert_current`  (
  `alert_id` bigint(20) NOT NULL,
  `definition_id` bigint(20) NOT NULL,
  `history_id` bigint(20) NOT NULL,
  `maintenance_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `original_timestamp` bigint(20) NOT NULL,
  `latest_timestamp` bigint(20) NOT NULL,
  `latest_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `occurrences` bigint(20) NOT NULL DEFAULT 1,
  `firmness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'HARD',
  PRIMARY KEY (`alert_id`) USING BTREE,
  UNIQUE INDEX `history_id`(`history_id`) USING BTREE,
  INDEX `definition_id`(`definition_id`) USING BTREE,
  CONSTRAINT `alert_current_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `alert_definition` (`definition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `alert_current_ibfk_2` FOREIGN KEY (`history_id`) REFERENCES `alert_history` (`alert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_definition
-- ----------------------------
DROP TABLE IF EXISTS `alert_definition`;
CREATE TABLE `alert_definition`  (
  `definition_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `definition_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `component_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ANY',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `help_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `schedule_interval` int(11) NOT NULL,
  `source_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alert_source` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hash` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ignore_host` smallint(6) NOT NULL DEFAULT 0,
  `repeat_tolerance` int(11) NOT NULL DEFAULT 1,
  `repeat_tolerance_enabled` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`definition_id`) USING BTREE,
  UNIQUE INDEX `uni_alert_def_name`(`cluster_id`, `definition_name`) USING BTREE,
  CONSTRAINT `alert_definition_ibfk_1` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_group
-- ----------------------------
DROP TABLE IF EXISTS `alert_group`;
CREATE TABLE `alert_group`  (
  `group_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `uni_alert_group_name`(`cluster_id`, `group_name`) USING BTREE,
  INDEX `idx_alert_group_name`(`group_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_group_target
-- ----------------------------
DROP TABLE IF EXISTS `alert_group_target`;
CREATE TABLE `alert_group_target`  (
  `group_id` bigint(20) NOT NULL,
  `target_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`, `target_id`) USING BTREE,
  INDEX `target_id`(`target_id`) USING BTREE,
  CONSTRAINT `alert_group_target_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `alert_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `alert_group_target_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `alert_target` (`target_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_grouping
-- ----------------------------
DROP TABLE IF EXISTS `alert_grouping`;
CREATE TABLE `alert_grouping`  (
  `definition_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`, `definition_id`) USING BTREE,
  INDEX `definition_id`(`definition_id`) USING BTREE,
  CONSTRAINT `alert_grouping_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `alert_definition` (`definition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `alert_grouping_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `alert_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_history
-- ----------------------------
DROP TABLE IF EXISTS `alert_history`;
CREATE TABLE `alert_history`  (
  `alert_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `alert_definition_id` bigint(20) NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `component_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alert_instance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alert_timestamp` bigint(20) NOT NULL,
  `alert_label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alert_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alert_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`alert_id`) USING BTREE,
  INDEX `cluster_id`(`cluster_id`) USING BTREE,
  INDEX `idx_alert_history_def_id`(`alert_definition_id`) USING BTREE,
  INDEX `idx_alert_history_service`(`service_name`) USING BTREE,
  INDEX `idx_alert_history_host`(`host_name`) USING BTREE,
  INDEX `idx_alert_history_time`(`alert_timestamp`) USING BTREE,
  INDEX `idx_alert_history_state`(`alert_state`) USING BTREE,
  CONSTRAINT `alert_history_ibfk_1` FOREIGN KEY (`alert_definition_id`) REFERENCES `alert_definition` (`definition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `alert_history_ibfk_2` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_notice
-- ----------------------------
DROP TABLE IF EXISTS `alert_notice`;
CREATE TABLE `alert_notice`  (
  `notification_id` bigint(20) NOT NULL,
  `target_id` bigint(20) NOT NULL,
  `history_id` bigint(20) NOT NULL,
  `notify_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`notification_id`) USING BTREE,
  UNIQUE INDEX `uuid`(`uuid`) USING BTREE,
  INDEX `target_id`(`target_id`) USING BTREE,
  INDEX `history_id`(`history_id`) USING BTREE,
  INDEX `idx_alert_notice_state`(`notify_state`) USING BTREE,
  CONSTRAINT `alert_notice_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `alert_target` (`target_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `alert_notice_ibfk_2` FOREIGN KEY (`history_id`) REFERENCES `alert_history` (`alert_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_target
-- ----------------------------
DROP TABLE IF EXISTS `alert_target`;
CREATE TABLE `alert_target`  (
  `target_id` bigint(20) NOT NULL,
  `target_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notification_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `properties` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_global` smallint(6) NOT NULL DEFAULT 0,
  `is_enabled` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`target_id`) USING BTREE,
  UNIQUE INDEX `target_name`(`target_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alert_target_states
-- ----------------------------
DROP TABLE IF EXISTS `alert_target_states`;
CREATE TABLE `alert_target_states`  (
  `target_id` bigint(20) NOT NULL,
  `alert_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `target_id`(`target_id`) USING BTREE,
  CONSTRAINT `alert_target_states_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `alert_target` (`target_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ambari_operation_history
-- ----------------------------
DROP TABLE IF EXISTS `ambari_operation_history`;
CREATE TABLE `ambari_operation_history`  (
  `id` bigint(20) NOT NULL,
  `from_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `end_time` bigint(20) NULL DEFAULT NULL,
  `operation_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ambari_sequences
-- ----------------------------
DROP TABLE IF EXISTS `ambari_sequences`;
CREATE TABLE `ambari_sequences`  (
  `sequence_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sequence_value` decimal(38, 0) NOT NULL,
  PRIMARY KEY (`sequence_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for artifact
-- ----------------------------
DROP TABLE IF EXISTS `artifact`;
CREATE TABLE `artifact`  (
  `artifact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `foreign_keys` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `artifact_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`artifact_name`, `foreign_keys`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blueprint
-- ----------------------------
DROP TABLE IF EXISTS `blueprint`;
CREATE TABLE `blueprint`  (
  `blueprint_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stack_id` bigint(20) NOT NULL,
  `security_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NONE',
  `security_descriptor_reference` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`blueprint_name`) USING BTREE,
  INDEX `FK_blueprint_stack_id`(`stack_id`) USING BTREE,
  CONSTRAINT `FK_blueprint_stack_id` FOREIGN KEY (`stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blueprint_configuration
-- ----------------------------
DROP TABLE IF EXISTS `blueprint_configuration`;
CREATE TABLE `blueprint_configuration`  (
  `blueprint_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_attributes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`blueprint_name`, `type_name`) USING BTREE,
  CONSTRAINT `FK_cfg_blueprint_name` FOREIGN KEY (`blueprint_name`) REFERENCES `blueprint` (`blueprint_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blueprint_setting
-- ----------------------------
DROP TABLE IF EXISTS `blueprint_setting`;
CREATE TABLE `blueprint_setting`  (
  `id` bigint(20) NOT NULL,
  `blueprint_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setting_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setting_data` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_blueprint_setting_name`(`blueprint_name`, `setting_name`) USING BTREE,
  CONSTRAINT `FK_blueprint_setting_name` FOREIGN KEY (`blueprint_name`) REFERENCES `blueprint` (`blueprint_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_version
-- ----------------------------
DROP TABLE IF EXISTS `cluster_version`;
CREATE TABLE `cluster_version`  (
  `id` bigint(20) NOT NULL,
  `repo_version_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `end_time` bigint(20) NULL DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_cluster_version_cluster_id`(`cluster_id`) USING BTREE,
  INDEX `FK_cluster_version_repovers_id`(`repo_version_id`) USING BTREE,
  CONSTRAINT `FK_cluster_version_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_cluster_version_repovers_id` FOREIGN KEY (`repo_version_id`) REFERENCES `repo_version` (`repo_version_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusterconfig
-- ----------------------------
DROP TABLE IF EXISTS `clusterconfig`;
CREATE TABLE `clusterconfig`  (
  `config_id` bigint(20) NOT NULL,
  `version_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` bigint(20) NOT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `stack_id` bigint(20) NOT NULL,
  `config_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_attributes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `UQ_config_type_tag`(`cluster_id`, `type_name`, `version_tag`) USING BTREE,
  UNIQUE INDEX `UQ_config_type_version`(`cluster_id`, `type_name`, `version`) USING BTREE,
  INDEX `FK_clusterconfig_stack_id`(`stack_id`) USING BTREE,
  CONSTRAINT `FK_clusterconfig_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_clusterconfig_stack_id` FOREIGN KEY (`stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusterconfigmapping
-- ----------------------------
DROP TABLE IF EXISTS `clusterconfigmapping`;
CREATE TABLE `clusterconfigmapping`  (
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_timestamp` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `version_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_db',
  PRIMARY KEY (`type_name`, `create_timestamp`, `cluster_id`) USING BTREE,
  INDEX `clusterconfigmappingcluster_id`(`cluster_id`) USING BTREE,
  CONSTRAINT `clusterconfigmappingcluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusterhostmapping
-- ----------------------------
DROP TABLE IF EXISTS `clusterhostmapping`;
CREATE TABLE `clusterhostmapping`  (
  `cluster_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cluster_id`, `host_id`) USING BTREE,
  INDEX `FK_clusterhostmapping_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `FK_clhostmapping_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_clusterhostmapping_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusters
-- ----------------------------
DROP TABLE IF EXISTS `clusters`;
CREATE TABLE `clusters`  (
  `cluster_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  `upgrade_id` bigint(20) NULL DEFAULT NULL,
  `cluster_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provisioning_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'INIT',
  `security_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NONE',
  `desired_cluster_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desired_stack_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cluster_id`) USING BTREE,
  UNIQUE INDEX `cluster_name`(`cluster_name`) USING BTREE,
  INDEX `FK_clusters_desired_stack_id`(`desired_stack_id`) USING BTREE,
  INDEX `FK_clusters_resource_id`(`resource_id`) USING BTREE,
  INDEX `FK_clusters_upgrade_id`(`upgrade_id`) USING BTREE,
  CONSTRAINT `FK_clusters_desired_stack_id` FOREIGN KEY (`desired_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_clusters_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `adminresource` (`resource_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_clusters_upgrade_id` FOREIGN KEY (`upgrade_id`) REFERENCES `upgrade` (`upgrade_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusterservices
-- ----------------------------
DROP TABLE IF EXISTS `clusterservices`;
CREATE TABLE `clusterservices`  (
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `service_enabled` int(11) NOT NULL,
  PRIMARY KEY (`service_name`, `cluster_id`) USING BTREE,
  INDEX `FK_clusterservices_cluster_id`(`cluster_id`) USING BTREE,
  CONSTRAINT `FK_clusterservices_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clusterstate
-- ----------------------------
DROP TABLE IF EXISTS `clusterstate`;
CREATE TABLE `clusterstate`  (
  `cluster_id` bigint(20) NOT NULL,
  `current_cluster_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `current_stack_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cluster_id`) USING BTREE,
  INDEX `FK_cs_current_stack_id`(`current_stack_id`) USING BTREE,
  CONSTRAINT `FK_clusterstate_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_cs_current_stack_id` FOREIGN KEY (`current_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for confgroupclusterconfigmapping
-- ----------------------------
DROP TABLE IF EXISTS `confgroupclusterconfigmapping`;
CREATE TABLE `confgroupclusterconfigmapping`  (
  `config_group_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `config_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '_db',
  `create_timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`config_group_id`, `cluster_id`, `config_type`) USING BTREE,
  INDEX `FK_confg`(`cluster_id`, `config_type`, `version_tag`) USING BTREE,
  CONSTRAINT `FK_cgccm_gid` FOREIGN KEY (`config_group_id`) REFERENCES `configgroup` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_confg` FOREIGN KEY (`cluster_id`, `config_type`, `version_tag`) REFERENCES `clusterconfig` (`cluster_id`, `type_name`, `version_tag`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for configgroup
-- ----------------------------
DROP TABLE IF EXISTS `configgroup`;
CREATE TABLE `configgroup`  (
  `group_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_timestamp` bigint(20) NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  INDEX `FK_configgroup_cluster_id`(`cluster_id`) USING BTREE,
  CONSTRAINT `FK_configgroup_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for configgrouphostmapping
-- ----------------------------
DROP TABLE IF EXISTS `configgrouphostmapping`;
CREATE TABLE `configgrouphostmapping`  (
  `config_group_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  PRIMARY KEY (`config_group_id`, `host_id`) USING BTREE,
  INDEX `FK_cghm_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `FK_cghm_cgid` FOREIGN KEY (`config_group_id`) REFERENCES `configgroup` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_cghm_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for execution_command
-- ----------------------------
DROP TABLE IF EXISTS `execution_command`;
CREATE TABLE `execution_command`  (
  `task_id` bigint(20) NOT NULL,
  `command` longblob NULL,
  PRIMARY KEY (`task_id`) USING BTREE,
  CONSTRAINT `FK_execution_command_task_id` FOREIGN KEY (`task_id`) REFERENCES `host_role_command` (`task_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for extension
-- ----------------------------
DROP TABLE IF EXISTS `extension`;
CREATE TABLE `extension`  (
  `extension_id` bigint(20) NOT NULL,
  `extension_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extension_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`extension_id`) USING BTREE,
  UNIQUE INDEX `UQ_extension`(`extension_name`, `extension_version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for extensionlink
-- ----------------------------
DROP TABLE IF EXISTS `extensionlink`;
CREATE TABLE `extensionlink`  (
  `link_id` bigint(20) NOT NULL,
  `stack_id` bigint(20) NOT NULL,
  `extension_id` bigint(20) NOT NULL,
  PRIMARY KEY (`link_id`) USING BTREE,
  UNIQUE INDEX `UQ_extension_link`(`stack_id`, `extension_id`) USING BTREE,
  INDEX `FK_extensionlink_extension_id`(`extension_id`) USING BTREE,
  CONSTRAINT `FK_extensionlink_extension_id` FOREIGN KEY (`extension_id`) REFERENCES `extension` (`extension_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_extensionlink_stack_id` FOREIGN KEY (`stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `group_id` int(11) NOT NULL,
  `principal_id` bigint(20) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ldap_group` int(11) NOT NULL DEFAULT 0,
  `group_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'LOCAL',
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `UNQ_groups_0`(`group_name`, `ldap_group`) USING BTREE,
  INDEX `FK_groups_principal_id`(`principal_id`) USING BTREE,
  CONSTRAINT `FK_groups_principal_id` FOREIGN KEY (`principal_id`) REFERENCES `adminprincipal` (`principal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for host_role_command
-- ----------------------------
DROP TABLE IF EXISTS `host_role_command`;
CREATE TABLE `host_role_command`  (
  `task_id` bigint(20) NOT NULL,
  `attempt_count` smallint(6) NOT NULL,
  `retry_allowed` smallint(6) NOT NULL DEFAULT 0,
  `event` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exitcode` int(11) NOT NULL,
  `host_id` bigint(20) NULL DEFAULT NULL,
  `last_attempt_time` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_command` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `original_start_time` bigint(20) NOT NULL,
  `end_time` bigint(20) NULL DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auto_skip_on_failure` smallint(6) NOT NULL DEFAULT 0,
  `std_error` longblob NULL,
  `std_out` longblob NULL,
  `output_log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `error_log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `structured_out` longblob NULL,
  `command_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_command_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`task_id`) USING BTREE,
  INDEX `FK_host_role_command_host_id`(`host_id`) USING BTREE,
  INDEX `FK_host_role_command_stage_id`(`stage_id`, `request_id`) USING BTREE,
  INDEX `idx_hrc_request_id`(`request_id`) USING BTREE,
  INDEX `idx_hrc_status_role`(`status`, `role`) USING BTREE,
  CONSTRAINT `FK_host_role_command_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_host_role_command_stage_id` FOREIGN KEY (`stage_id`, `request_id`) REFERENCES `stage` (`stage_id`, `request_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for host_version
-- ----------------------------
DROP TABLE IF EXISTS `host_version`;
CREATE TABLE `host_version`  (
  `id` bigint(20) NOT NULL,
  `repo_version_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_host_repo`(`repo_version_id`, `host_id`) USING BTREE,
  INDEX `FK_host_version_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `FK_host_version_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_host_version_repovers_id` FOREIGN KEY (`repo_version_id`) REFERENCES `repo_version` (`repo_version_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostcomponentdesiredstate
-- ----------------------------
DROP TABLE IF EXISTS `hostcomponentdesiredstate`;
CREATE TABLE `hostcomponentdesiredstate`  (
  `id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `component_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desired_stack_id` bigint(20) NOT NULL,
  `desired_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_id` bigint(20) NOT NULL,
  `service_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maintenance_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ACTIVE',
  `security_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UNSECURED',
  `restart_required` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_hcdesiredstate_name`(`component_name`, `service_name`, `host_id`, `cluster_id`) USING BTREE,
  INDEX `FK_hcdesiredstate_host_id`(`host_id`) USING BTREE,
  INDEX `FK_hcds_desired_stack_id`(`desired_stack_id`) USING BTREE,
  INDEX `hstcmpnntdesiredstatecmpnntnme`(`component_name`, `service_name`, `cluster_id`) USING BTREE,
  CONSTRAINT `FK_hcdesiredstate_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_hcds_desired_stack_id` FOREIGN KEY (`desired_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hstcmpnntdesiredstatecmpnntnme` FOREIGN KEY (`component_name`, `service_name`, `cluster_id`) REFERENCES `servicecomponentdesiredstate` (`component_name`, `service_name`, `cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostcomponentstate
-- ----------------------------
DROP TABLE IF EXISTS `hostcomponentstate`;
CREATE TABLE `hostcomponentstate`  (
  `id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `component_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UNKNOWN',
  `current_stack_id` bigint(20) NOT NULL,
  `current_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_id` bigint(20) NOT NULL,
  `service_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upgrade_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NONE',
  `security_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UNSECURED',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_hcs_current_stack_id`(`current_stack_id`) USING BTREE,
  INDEX `hstcomponentstatecomponentname`(`component_name`, `service_name`, `cluster_id`) USING BTREE,
  INDEX `idx_host_component_state`(`host_id`, `component_name`, `service_name`, `cluster_id`) USING BTREE,
  CONSTRAINT `FK_hcs_current_stack_id` FOREIGN KEY (`current_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_hostcomponentstate_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hstcomponentstatecomponentname` FOREIGN KEY (`component_name`, `service_name`, `cluster_id`) REFERENCES `servicecomponentdesiredstate` (`component_name`, `service_name`, `cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostconfigmapping
-- ----------------------------
DROP TABLE IF EXISTS `hostconfigmapping`;
CREATE TABLE `hostconfigmapping`  (
  `create_timestamp` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `selected` int(11) NOT NULL DEFAULT 0,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_db',
  PRIMARY KEY (`create_timestamp`, `host_id`, `cluster_id`, `type_name`) USING BTREE,
  INDEX `FK_hostconfmapping_cluster_id`(`cluster_id`) USING BTREE,
  INDEX `FK_hostconfmapping_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `FK_hostconfmapping_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_hostconfmapping_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostgroup
-- ----------------------------
DROP TABLE IF EXISTS `hostgroup`;
CREATE TABLE `hostgroup`  (
  `blueprint_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cardinality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`blueprint_name`, `name`) USING BTREE,
  CONSTRAINT `FK_hg_blueprint_name` FOREIGN KEY (`blueprint_name`) REFERENCES `blueprint` (`blueprint_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostgroup_component
-- ----------------------------
DROP TABLE IF EXISTS `hostgroup_component`;
CREATE TABLE `hostgroup_component`  (
  `blueprint_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hostgroup_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provision_action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`blueprint_name`, `hostgroup_name`, `name`) USING BTREE,
  CONSTRAINT `FK_hgc_blueprint_name` FOREIGN KEY (`blueprint_name`, `hostgroup_name`) REFERENCES `hostgroup` (`blueprint_name`, `name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostgroup_configuration
-- ----------------------------
DROP TABLE IF EXISTS `hostgroup_configuration`;
CREATE TABLE `hostgroup_configuration`  (
  `blueprint_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hostgroup_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_attributes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`blueprint_name`, `hostgroup_name`, `type_name`) USING BTREE,
  CONSTRAINT `FK_hg_cfg_bp_hg_name` FOREIGN KEY (`blueprint_name`, `hostgroup_name`) REFERENCES `hostgroup` (`blueprint_name`, `name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hosts
-- ----------------------------
DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts`  (
  `host_id` bigint(20) NOT NULL,
  `host_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cpu_count` int(11) NOT NULL,
  `cpu_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `discovery_status` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_attributes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ipv4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ipv6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_registration_time` bigint(20) NOT NULL,
  `os_arch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `os_info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `os_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ph_cpu_count` int(11) NULL DEFAULT NULL,
  `public_host_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rack_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_mem` bigint(20) NOT NULL,
  PRIMARY KEY (`host_id`) USING BTREE,
  UNIQUE INDEX `UQ_hosts_host_name`(`host_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hoststate
-- ----------------------------
DROP TABLE IF EXISTS `hoststate`;
CREATE TABLE `hoststate`  (
  `agent_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `available_mem` bigint(20) NOT NULL,
  `current_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `health_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_id` bigint(20) NOT NULL,
  `time_in_state` bigint(20) NOT NULL,
  `maintenance_state` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`host_id`) USING BTREE,
  CONSTRAINT `FK_hoststate_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kerberos_descriptor
-- ----------------------------
DROP TABLE IF EXISTS `kerberos_descriptor`;
CREATE TABLE `kerberos_descriptor`  (
  `kerberos_descriptor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kerberos_descriptor` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`kerberos_descriptor_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kerberos_principal
-- ----------------------------
DROP TABLE IF EXISTS `kerberos_principal`;
CREATE TABLE `kerberos_principal`  (
  `principal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_service` smallint(6) NOT NULL DEFAULT 1,
  `cached_keytab_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`principal_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kerberos_principal_host
-- ----------------------------
DROP TABLE IF EXISTS `kerberos_principal_host`;
CREATE TABLE `kerberos_principal_host`  (
  `principal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_id` bigint(20) NOT NULL,
  PRIMARY KEY (`principal_name`, `host_id`) USING BTREE,
  INDEX `FK_krb_pr_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `FK_krb_pr_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_krb_pr_host_principalname` FOREIGN KEY (`principal_name`) REFERENCES `kerberos_principal` (`principal_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for key_value_store
-- ----------------------------
DROP TABLE IF EXISTS `key_value_store`;
CREATE TABLE `key_value_store`  (
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `member_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE INDEX `UNQ_members_0`(`group_id`, `user_id`) USING BTREE,
  INDEX `FK_members_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `FK_members_group_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_members_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for metainfo
-- ----------------------------
DROP TABLE IF EXISTS `metainfo`;
CREATE TABLE `metainfo`  (
  `metainfo_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `metainfo_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`metainfo_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_roleauthorization
-- ----------------------------
DROP TABLE IF EXISTS `permission_roleauthorization`;
CREATE TABLE `permission_roleauthorization`  (
  `permission_id` bigint(20) NOT NULL,
  `authorization_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`permission_id`, `authorization_id`) USING BTREE,
  INDEX `FK_permission_roleauth_aid`(`authorization_id`) USING BTREE,
  CONSTRAINT `FK_permission_roleauth_aid` FOREIGN KEY (`authorization_id`) REFERENCES `roleauthorization` (`authorization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_permission_roleauth_pid` FOREIGN KEY (`permission_id`) REFERENCES `adminpermission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `idx_qrtz_ft_trig_inst_name`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `idx_qrtz_ft_inst_job_req_rcvry`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `idx_qrtz_ft_j_g`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_ft_jg`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_ft_t_g`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `idx_qrtz_ft_tg`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_j_req_recovery`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `idx_qrtz_j_grp`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `idx_qrtz_t_j`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_t_jg`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `idx_qrtz_t_c`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `idx_qrtz_t_g`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `idx_qrtz_t_state`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_n_state`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_n_g_state`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_next_fire_time`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `idx_qrtz_t_nft_st`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `idx_qrtz_t_nft_misfire`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `idx_qrtz_t_nft_st_misfire`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `idx_qrtz_t_nft_st_misfire_grp`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for remoteambaricluster
-- ----------------------------
DROP TABLE IF EXISTS `remoteambaricluster`;
CREATE TABLE `remoteambaricluster`  (
  `cluster_id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cluster_id`) USING BTREE,
  UNIQUE INDEX `UQ_remote_ambari_cluster`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for remoteambariclusterservice
-- ----------------------------
DROP TABLE IF EXISTS `remoteambariclusterservice`;
CREATE TABLE `remoteambariclusterservice`  (
  `id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_remote_ambari_cluster_id`(`cluster_id`) USING BTREE,
  CONSTRAINT `FK_remote_ambari_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `remoteambaricluster` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for repo_version
-- ----------------------------
DROP TABLE IF EXISTS `repo_version`;
CREATE TABLE `repo_version`  (
  `repo_version_id` bigint(20) NOT NULL,
  `stack_id` bigint(20) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repositories` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repo_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'STANDARD',
  `version_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_xml` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `version_xsd` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`repo_version_id`) USING BTREE,
  UNIQUE INDEX `UQ_repo_version_display_name`(`display_name`) USING BTREE,
  UNIQUE INDEX `UQ_repo_version_stack_id`(`stack_id`, `version`) USING BTREE,
  CONSTRAINT `FK_repoversion_stack_id` FOREIGN KEY (`stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for request
-- ----------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE `request`  (
  `request_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  `request_schedule_id` bigint(20) NULL DEFAULT NULL,
  `command_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NOT NULL,
  `end_time` bigint(20) NOT NULL,
  `exclusive_execution` tinyint(1) NOT NULL DEFAULT 0,
  `inputs` longblob NULL,
  `request_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` bigint(20) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`request_id`) USING BTREE,
  INDEX `FK_request_schedule_id`(`request_schedule_id`) USING BTREE,
  CONSTRAINT `FK_request_schedule_id` FOREIGN KEY (`request_schedule_id`) REFERENCES `requestschedule` (`schedule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for requestoperationlevel
-- ----------------------------
DROP TABLE IF EXISTS `requestoperationlevel`;
CREATE TABLE `requestoperationlevel`  (
  `operation_level_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `level_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_component_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`operation_level_id`) USING BTREE,
  INDEX `FK_req_op_level_req_id`(`request_id`) USING BTREE,
  CONSTRAINT `FK_req_op_level_req_id` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for requestresourcefilter
-- ----------------------------
DROP TABLE IF EXISTS `requestresourcefilter`;
CREATE TABLE `requestresourcefilter`  (
  `filter_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hosts` longblob NULL,
  PRIMARY KEY (`filter_id`) USING BTREE,
  INDEX `FK_reqresfilter_req_id`(`request_id`) USING BTREE,
  CONSTRAINT `FK_reqresfilter_req_id` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for requestschedule
-- ----------------------------
DROP TABLE IF EXISTS `requestschedule`;
CREATE TABLE `requestschedule`  (
  `schedule_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch_separation_seconds` smallint(6) NULL DEFAULT NULL,
  `batch_toleration_limit` smallint(6) NULL DEFAULT NULL,
  `authenticated_user_id` int(11) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_timestamp` bigint(20) NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_timestamp` bigint(20) NULL DEFAULT NULL,
  `minutes` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hours` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `days_of_month` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `month` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `day_of_week` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yearToSchedule` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_execution_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for requestschedulebatchrequest
-- ----------------------------
DROP TABLE IF EXISTS `requestschedulebatchrequest`;
CREATE TABLE `requestschedulebatchrequest`  (
  `schedule_id` bigint(20) NOT NULL,
  `batch_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NULL DEFAULT NULL,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_uri` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_body` longblob NULL,
  `request_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_code` smallint(6) NULL DEFAULT NULL,
  `return_message` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`, `batch_id`) USING BTREE,
  CONSTRAINT `FK_rsbatchrequest_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `requestschedule` (`schedule_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_success_criteria
-- ----------------------------
DROP TABLE IF EXISTS `role_success_criteria`;
CREATE TABLE `role_success_criteria`  (
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  `success_factor` double NOT NULL,
  PRIMARY KEY (`role`, `request_id`, `stage_id`) USING BTREE,
  INDEX `role_success_criteria_stage_id`(`stage_id`, `request_id`) USING BTREE,
  INDEX `idx_rsc_request_id`(`request_id`) USING BTREE,
  CONSTRAINT `role_success_criteria_stage_id` FOREIGN KEY (`stage_id`, `request_id`) REFERENCES `stage` (`stage_id`, `request_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roleauthorization
-- ----------------------------
DROP TABLE IF EXISTS `roleauthorization`;
CREATE TABLE `roleauthorization`  (
  `authorization_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`authorization_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servicecomponent_history
-- ----------------------------
DROP TABLE IF EXISTS `servicecomponent_history`;
CREATE TABLE `servicecomponent_history`  (
  `id` bigint(20) NOT NULL,
  `component_id` bigint(20) NOT NULL,
  `upgrade_id` bigint(20) NOT NULL,
  `from_stack_id` bigint(20) NOT NULL,
  `to_stack_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sc_history_component_id`(`component_id`) USING BTREE,
  INDEX `FK_sc_history_upgrade_id`(`upgrade_id`) USING BTREE,
  INDEX `FK_sc_history_from_stack_id`(`from_stack_id`) USING BTREE,
  INDEX `FK_sc_history_to_stack_id`(`to_stack_id`) USING BTREE,
  CONSTRAINT `FK_sc_history_component_id` FOREIGN KEY (`component_id`) REFERENCES `servicecomponentdesiredstate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sc_history_from_stack_id` FOREIGN KEY (`from_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sc_history_to_stack_id` FOREIGN KEY (`to_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sc_history_upgrade_id` FOREIGN KEY (`upgrade_id`) REFERENCES `upgrade` (`upgrade_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servicecomponent_version
-- ----------------------------
DROP TABLE IF EXISTS `servicecomponent_version`;
CREATE TABLE `servicecomponent_version`  (
  `id` bigint(20) NOT NULL,
  `component_id` bigint(20) NOT NULL,
  `repo_version_id` bigint(20) NOT NULL,
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_scv_component_id`(`component_id`) USING BTREE,
  INDEX `FK_scv_repo_version_id`(`repo_version_id`) USING BTREE,
  CONSTRAINT `FK_scv_component_id` FOREIGN KEY (`component_id`) REFERENCES `servicecomponentdesiredstate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_scv_repo_version_id` FOREIGN KEY (`repo_version_id`) REFERENCES `repo_version` (`repo_version_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servicecomponentdesiredstate
-- ----------------------------
DROP TABLE IF EXISTS `servicecomponentdesiredstate`;
CREATE TABLE `servicecomponentdesiredstate`  (
  `id` bigint(20) NOT NULL,
  `component_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `desired_stack_id` bigint(20) NOT NULL,
  `desired_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UNKNOWN',
  `desired_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recovery_enabled` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UQ_scdesiredstate_name`(`component_name`, `service_name`, `cluster_id`) USING BTREE,
  INDEX `FK_scds_desired_stack_id`(`desired_stack_id`) USING BTREE,
  INDEX `srvccmponentdesiredstatesrvcnm`(`service_name`, `cluster_id`) USING BTREE,
  CONSTRAINT `FK_scds_desired_stack_id` FOREIGN KEY (`desired_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `srvccmponentdesiredstatesrvcnm` FOREIGN KEY (`service_name`, `cluster_id`) REFERENCES `clusterservices` (`service_name`, `cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serviceconfig
-- ----------------------------
DROP TABLE IF EXISTS `serviceconfig`;
CREATE TABLE `serviceconfig`  (
  `service_config_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` bigint(20) NOT NULL,
  `create_timestamp` bigint(20) NOT NULL,
  `stack_id` bigint(20) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_db',
  `group_id` bigint(20) NULL DEFAULT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`service_config_id`) USING BTREE,
  UNIQUE INDEX `UQ_scv_service_version`(`cluster_id`, `service_name`, `version`) USING BTREE,
  INDEX `FK_serviceconfig_stack_id`(`stack_id`) USING BTREE,
  CONSTRAINT `FK_serviceconfig_stack_id` FOREIGN KEY (`stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serviceconfighosts
-- ----------------------------
DROP TABLE IF EXISTS `serviceconfighosts`;
CREATE TABLE `serviceconfighosts`  (
  `service_config_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NOT NULL,
  PRIMARY KEY (`service_config_id`, `host_id`) USING BTREE,
  INDEX `FK_scvhosts_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `FK_scvhosts_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_scvhosts_scv` FOREIGN KEY (`service_config_id`) REFERENCES `serviceconfig` (`service_config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serviceconfigmapping
-- ----------------------------
DROP TABLE IF EXISTS `serviceconfigmapping`;
CREATE TABLE `serviceconfigmapping`  (
  `service_config_id` bigint(20) NOT NULL,
  `config_id` bigint(20) NOT NULL,
  PRIMARY KEY (`service_config_id`, `config_id`) USING BTREE,
  INDEX `FK_scvm_config`(`config_id`) USING BTREE,
  CONSTRAINT `FK_scvm_config` FOREIGN KEY (`config_id`) REFERENCES `clusterconfig` (`config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_scvm_scv` FOREIGN KEY (`service_config_id`) REFERENCES `serviceconfig` (`service_config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servicedesiredstate
-- ----------------------------
DROP TABLE IF EXISTS `servicedesiredstate`;
CREATE TABLE `servicedesiredstate`  (
  `cluster_id` bigint(20) NOT NULL,
  `desired_host_role_mapping` int(11) NOT NULL,
  `desired_stack_id` bigint(20) NOT NULL,
  `desired_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `maintenance_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ACTIVE',
  `security_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UNSECURED',
  `credential_store_enabled` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cluster_id`, `service_name`) USING BTREE,
  INDEX `FK_sds_desired_stack_id`(`desired_stack_id`) USING BTREE,
  INDEX `servicedesiredstateservicename`(`service_name`, `cluster_id`) USING BTREE,
  CONSTRAINT `FK_sds_desired_stack_id` FOREIGN KEY (`desired_stack_id`) REFERENCES `stack` (`stack_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `servicedesiredstateservicename` FOREIGN KEY (`service_name`, `cluster_id`) REFERENCES `clusterservices` (`service_name`, `cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setting_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_db',
  `update_timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stack
-- ----------------------------
DROP TABLE IF EXISTS `stack`;
CREATE TABLE `stack`  (
  `stack_id` bigint(20) NOT NULL,
  `stack_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stack_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`stack_id`) USING BTREE,
  UNIQUE INDEX `UQ_stack`(`stack_name`, `stack_version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stage
-- ----------------------------
DROP TABLE IF EXISTS `stage`;
CREATE TABLE `stage`  (
  `stage_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  `skippable` smallint(6) NOT NULL DEFAULT 0,
  `supports_auto_skip_failure` smallint(6) NOT NULL DEFAULT 0,
  `log_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `request_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_host_info` longblob NULL,
  `command_params` longblob NULL,
  `host_params` longblob NULL,
  `command_execution_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'STAGE',
  PRIMARY KEY (`stage_id`, `request_id`) USING BTREE,
  INDEX `idx_stage_request_id`(`request_id`) USING BTREE,
  CONSTRAINT `FK_stage_request_id` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topology_host_info
-- ----------------------------
DROP TABLE IF EXISTS `topology_host_info`;
CREATE TABLE `topology_host_info`  (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `fqdn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `host_id` bigint(20) NULL DEFAULT NULL,
  `host_count` int(11) NULL DEFAULT NULL,
  `predicate` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rack_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_hostinfo_group_id`(`group_id`) USING BTREE,
  INDEX `FK_hostinfo_host_id`(`host_id`) USING BTREE,
  CONSTRAINT `FK_hostinfo_group_id` FOREIGN KEY (`group_id`) REFERENCES `topology_hostgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_hostinfo_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topology_host_request
-- ----------------------------
DROP TABLE IF EXISTS `topology_host_request`;
CREATE TABLE `topology_host_request`  (
  `id` bigint(20) NOT NULL,
  `logical_request_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  `host_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_hostreq_group_id`(`group_id`) USING BTREE,
  INDEX `FK_hostreq_logicalreq_id`(`logical_request_id`) USING BTREE,
  CONSTRAINT `FK_hostreq_group_id` FOREIGN KEY (`group_id`) REFERENCES `topology_hostgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_hostreq_logicalreq_id` FOREIGN KEY (`logical_request_id`) REFERENCES `topology_logical_request` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topology_host_task
-- ----------------------------
DROP TABLE IF EXISTS `topology_host_task`;
CREATE TABLE `topology_host_task`  (
  `id` bigint(20) NOT NULL,
  `host_request_id` bigint(20) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_hosttask_req_id`(`host_request_id`) USING BTREE,
  CONSTRAINT `FK_hosttask_req_id` FOREIGN KEY (`host_request_id`) REFERENCES `topology_host_request` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topology_hostgroup
-- ----------------------------
DROP TABLE IF EXISTS `topology_hostgroup`;
CREATE TABLE `topology_hostgroup`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_properties` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `group_attributes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `request_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_hostgroup_req_id`(`request_id`) USING BTREE,
  CONSTRAINT `FK_hostgroup_req_id` FOREIGN KEY (`request_id`) REFERENCES `topology_request` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topology_logical_request
-- ----------------------------
DROP TABLE IF EXISTS `topology_logical_request`;
CREATE TABLE `topology_logical_request`  (
  `id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_logicalreq_req_id`(`request_id`) USING BTREE,
  CONSTRAINT `FK_logicalreq_req_id` FOREIGN KEY (`request_id`) REFERENCES `topology_request` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topology_logical_task
-- ----------------------------
DROP TABLE IF EXISTS `topology_logical_task`;
CREATE TABLE `topology_logical_task`  (
  `id` bigint(20) NOT NULL,
  `host_task_id` bigint(20) NOT NULL,
  `physical_task_id` bigint(20) NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ltask_hosttask_id`(`host_task_id`) USING BTREE,
  INDEX `FK_ltask_hrc_id`(`physical_task_id`) USING BTREE,
  CONSTRAINT `FK_ltask_hosttask_id` FOREIGN KEY (`host_task_id`) REFERENCES `topology_host_task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ltask_hrc_id` FOREIGN KEY (`physical_task_id`) REFERENCES `host_role_command` (`task_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for topology_request
-- ----------------------------
DROP TABLE IF EXISTS `topology_request`;
CREATE TABLE `topology_request`  (
  `id` bigint(20) NOT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `bp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_properties` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cluster_attributes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provision_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_topology_request_cluster_id`(`cluster_id`) USING BTREE,
  CONSTRAINT `FK_topology_request_cluster_id` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upgrade
-- ----------------------------
DROP TABLE IF EXISTS `upgrade`;
CREATE TABLE `upgrade`  (
  `upgrade_id` bigint(20) NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `from_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `to_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `direction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UPGRADE',
  `upgrade_package` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upgrade_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `skip_failures` tinyint(1) NOT NULL DEFAULT 0,
  `skip_sc_failures` tinyint(1) NOT NULL DEFAULT 0,
  `downgrade_allowed` tinyint(1) NOT NULL DEFAULT 1,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`upgrade_id`) USING BTREE,
  INDEX `cluster_id`(`cluster_id`) USING BTREE,
  INDEX `request_id`(`request_id`) USING BTREE,
  CONSTRAINT `upgrade_ibfk_1` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `upgrade_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upgrade_group
-- ----------------------------
DROP TABLE IF EXISTS `upgrade_group`;
CREATE TABLE `upgrade_group`  (
  `upgrade_group_id` bigint(20) NOT NULL,
  `upgrade_id` bigint(20) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `group_title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`upgrade_group_id`) USING BTREE,
  INDEX `upgrade_id`(`upgrade_id`) USING BTREE,
  CONSTRAINT `upgrade_group_ibfk_1` FOREIGN KEY (`upgrade_id`) REFERENCES `upgrade` (`upgrade_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for upgrade_item
-- ----------------------------
DROP TABLE IF EXISTS `upgrade_item`;
CREATE TABLE `upgrade_item`  (
  `upgrade_item_id` bigint(20) NOT NULL,
  `upgrade_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NONE',
  `hosts` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tasks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `item_text` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`upgrade_item_id`) USING BTREE,
  INDEX `upgrade_group_id`(`upgrade_group_id`) USING BTREE,
  CONSTRAINT `upgrade_item_ibfk_1` FOREIGN KEY (`upgrade_group_id`) REFERENCES `upgrade_group` (`upgrade_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL,
  `principal_id` bigint(20) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `ldap_user` int(11) NOT NULL DEFAULT 0,
  `user_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'LOCAL',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `active_widget_layouts` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UNQ_users_0`(`user_name`, `user_type`) USING BTREE,
  INDEX `FK_users_principal_id`(`principal_id`) USING BTREE,
  CONSTRAINT `FK_users_principal_id` FOREIGN KEY (`principal_id`) REFERENCES `adminprincipal` (`principal_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewentity
-- ----------------------------
DROP TABLE IF EXISTS `viewentity`;
CREATE TABLE `viewentity`  (
  `id` bigint(20) NOT NULL,
  `view_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_instance_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_property` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_viewentity_view_name`(`view_name`, `view_instance_name`) USING BTREE,
  CONSTRAINT `FK_viewentity_view_name` FOREIGN KEY (`view_name`, `view_instance_name`) REFERENCES `viewinstance` (`view_name`, `name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewinstance
-- ----------------------------
DROP TABLE IF EXISTS `viewinstance`;
CREATE TABLE `viewinstance`  (
  `view_instance_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  `view_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon64` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `xml_driven` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alter_names` tinyint(1) NOT NULL DEFAULT 1,
  `cluster_handle` bigint(20) NULL DEFAULT NULL,
  `cluster_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'LOCAL_AMBARI',
  `short_url` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`view_instance_id`) USING BTREE,
  UNIQUE INDEX `UQ_viewinstance_name`(`view_name`, `name`) USING BTREE,
  UNIQUE INDEX `UQ_viewinstance_name_id`(`view_instance_id`, `view_name`, `name`) USING BTREE,
  INDEX `FK_instance_url_id`(`short_url`) USING BTREE,
  INDEX `FK_viewinstance_resource_id`(`resource_id`) USING BTREE,
  CONSTRAINT `FK_instance_url_id` FOREIGN KEY (`short_url`) REFERENCES `viewurl` (`url_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_viewinst_view_name` FOREIGN KEY (`view_name`) REFERENCES `viewmain` (`view_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_viewinstance_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `adminresource` (`resource_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewinstancedata
-- ----------------------------
DROP TABLE IF EXISTS `viewinstancedata`;
CREATE TABLE `viewinstancedata`  (
  `view_instance_id` bigint(20) NOT NULL,
  `view_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_instance_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`view_instance_id`, `name`, `user_name`) USING BTREE,
  INDEX `FK_viewinstdata_view_name`(`view_instance_id`, `view_name`, `view_instance_name`) USING BTREE,
  CONSTRAINT `FK_viewinstdata_view_name` FOREIGN KEY (`view_instance_id`, `view_name`, `view_instance_name`) REFERENCES `viewinstance` (`view_instance_id`, `view_name`, `name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewinstanceproperty
-- ----------------------------
DROP TABLE IF EXISTS `viewinstanceproperty`;
CREATE TABLE `viewinstanceproperty`  (
  `view_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_instance_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`view_name`, `view_instance_name`, `name`) USING BTREE,
  CONSTRAINT `FK_viewinstprop_view_name` FOREIGN KEY (`view_name`, `view_instance_name`) REFERENCES `viewinstance` (`view_name`, `name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewmain
-- ----------------------------
DROP TABLE IF EXISTS `viewmain`;
CREATE TABLE `viewmain`  (
  `view_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `build` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_type_id` int(11) NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon64` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `archive` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mask` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `system_view` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`view_name`) USING BTREE,
  INDEX `FK_view_resource_type_id`(`resource_type_id`) USING BTREE,
  CONSTRAINT `FK_view_resource_type_id` FOREIGN KEY (`resource_type_id`) REFERENCES `adminresourcetype` (`resource_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewparameter
-- ----------------------------
DROP TABLE IF EXISTS `viewparameter`;
CREATE TABLE `viewparameter`  (
  `view_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `placeholder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_config` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `masked` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`view_name`, `name`) USING BTREE,
  CONSTRAINT `FK_viewparam_view_name` FOREIGN KEY (`view_name`) REFERENCES `viewmain` (`view_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewresource
-- ----------------------------
DROP TABLE IF EXISTS `viewresource`;
CREATE TABLE `viewresource`  (
  `view_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `plural_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_property` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subResource_names` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`view_name`, `name`) USING BTREE,
  CONSTRAINT `FK_viewres_view_name` FOREIGN KEY (`view_name`) REFERENCES `viewmain` (`view_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for viewurl
-- ----------------------------
DROP TABLE IF EXISTS `viewurl`;
CREATE TABLE `viewurl`  (
  `url_id` bigint(20) NOT NULL,
  `url_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`url_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for widget
-- ----------------------------
DROP TABLE IF EXISTS `widget`;
CREATE TABLE `widget`  (
  `id` bigint(20) NOT NULL,
  `widget_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `metrics` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time_created` bigint(20) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_section_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `widget_values` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `properties` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cluster_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for widget_layout
-- ----------------------------
DROP TABLE IF EXISTS `widget_layout`;
CREATE TABLE `widget_layout`  (
  `id` bigint(20) NOT NULL,
  `layout_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `section_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for widget_layout_user_widget
-- ----------------------------
DROP TABLE IF EXISTS `widget_layout_user_widget`;
CREATE TABLE `widget_layout_user_widget`  (
  `widget_layout_id` bigint(20) NOT NULL,
  `widget_id` bigint(20) NOT NULL,
  `widget_order` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`widget_layout_id`, `widget_id`) USING BTREE,
  INDEX `FK_widget_id`(`widget_id`) USING BTREE,
  CONSTRAINT `FK_widget_id` FOREIGN KEY (`widget_id`) REFERENCES `widget` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_widget_layout_id` FOREIGN KEY (`widget_layout_id`) REFERENCES `widget_layout` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
