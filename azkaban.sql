/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.0.85_root
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.0.0.85:3306
 Source Schema         : azkaban

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 26/03/2019 10:58:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for active_executing_flows
-- ----------------------------
DROP TABLE IF EXISTS `active_executing_flows`;
CREATE TABLE `active_executing_flows`  (
  `exec_id` int(11) NOT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`exec_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for active_sla
-- ----------------------------
DROP TABLE IF EXISTS `active_sla`;
CREATE TABLE `active_sla`  (
  `exec_id` int(11) NOT NULL,
  `job_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `check_time` bigint(20) NOT NULL,
  `rule` tinyint(4) NOT NULL,
  `enc_type` tinyint(4) NULL DEFAULT NULL,
  `options` longblob NOT NULL,
  PRIMARY KEY (`exec_id`, `job_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for execution_flows
-- ----------------------------
DROP TABLE IF EXISTS `execution_flows`;
CREATE TABLE `execution_flows`  (
  `exec_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `flow_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `submit_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `submit_time` bigint(20) NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `start_time` bigint(20) NULL DEFAULT NULL,
  `end_time` bigint(20) NULL DEFAULT NULL,
  `enc_type` tinyint(4) NULL DEFAULT NULL,
  `flow_data` longblob NULL,
  `executor_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`exec_id`) USING BTREE,
  INDEX `ex_flows_start_time`(`start_time`) USING BTREE,
  INDEX `ex_flows_end_time`(`end_time`) USING BTREE,
  INDEX `ex_flows_time_range`(`start_time`, `end_time`) USING BTREE,
  INDEX `ex_flows_flows`(`project_id`, `flow_id`) USING BTREE,
  INDEX `executor_id`(`executor_id`) USING BTREE,
  INDEX `ex_flows_staus`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of execution_flows
-- ----------------------------
INSERT INTO `execution_flows` VALUES (1, 11, 1, 'Command', 50, 'new88', 1552979189722, 1552979244985, 1552979243189, 1552979244972, 2, 0x1F8B08000000000000007553C14EE33010FD973947BB4D68499BDB2AA450A99BA2961E562B84DC78220C4E9CB5C74055F1EF6B374D5B025CA2D833F3DE9B37E31D4866E8B7E2A5407E272A84241C8DA2493C09C793CBE124007CC3C29250F5A2F15F03C90E4A26A4D5F8ABF03790C07496CF56370FE97AB9CCF2BBF99F87E53ACF67F935045061A5F4367DC4E21912D21603F867D1E21C5F50423208A0110D4A5163E688661C92DA4A1940A1EAC26A8D35B5BC8EC53C8BC621D68A44B95DD453A10D4D5B2590944C1A3C05E7EC73AC233A50B73CC616051A93552ED92C5E506BC14F258746DB28247FEF03E0C2B08D44DE9E4AA95E6F996615126AEFCD7B0FB24DF3BFA946464ABB463896CC4A821E7E8FDD21D98633C20F638986C3C97814006D1BEC7A60445835B477D36198BD5DE1D9E86E193D3ADEE3D9FC0CE12CEC5D0FBD771CBDDE1D3CA9CD4A595D3806485555B19AFF7077AEC610D3D41374110FA26FB5C69701087EC2F1BC35FF943688BB96DCE4BBC4F3BE1C3159A70E56EB34CDB2ABEC0ADEEFBDD79B4A507F71E368D085D606BDE535BE8EC7DFE9771541F70E847F08BD2271DCCAAFA4C7AE7923D9F179F879375A3D614139F3B91EC78451185D78D7FDC6CC3E1A72C8DE8F21DC1FDFB65E82073B8868311BD424F0C0F19523FF011AB34C01CF030000, 121);

-- ----------------------------
-- Table structure for execution_jobs
-- ----------------------------
DROP TABLE IF EXISTS `execution_jobs`;
CREATE TABLE `execution_jobs`  (
  `exec_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `flow_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attempt` int(11) NOT NULL,
  `start_time` bigint(20) NULL DEFAULT NULL,
  `end_time` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `input_params` longblob NULL,
  `output_params` longblob NULL,
  `attachments` longblob NULL,
  PRIMARY KEY (`exec_id`, `job_id`, `attempt`) USING BTREE,
  INDEX `exec_job`(`exec_id`, `job_id`) USING BTREE,
  INDEX `exec_id`(`exec_id`) USING BTREE,
  INDEX `ex_job_id`(`project_id`, `job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of execution_jobs
-- ----------------------------
INSERT INTO `execution_jobs` VALUES (1, 11, 1, 'Command', 'Command', 0, 1552979243702, 1552979244907, 50, 0x1F8B08000000000000008592DB52C3201086DF855B9B14723021778E8FA02F40606B6803643858A3D37717DAEA74DA546F3284FD77BF9FDDFD4213B3A03DEABE9033C172409D0EE3B8429335934BD7EC73C77AA6F3CD68F6B9F3CCFA5CC971940EB8D1224A505553B45AD2CDC06C8C1798DC1178A9E0D3E808454F4EB2F5CBC0F4DBC0E4B53A9AD902F752442121CBB54E7E12AEB811845E491F1C24371AF66D7B07F00ED649A3136519A2A40E3ED9C5CDB5003E809F0CDE29AE998213DF918214E53D84D17E488472393EC431254A7D1D0EE188A77D2F5A8C59460BD16415AEFAAC2DAB3ADB604645DF705A6EE03A357D8EC9CF462916BBB848166C4EE09B599EDF3732E7791A20887EFEA7D1175AC18E0D25755DD08692963E567F6C4B3CA9E9BC53192E33425F49DDE1A62B8A3CEEE1036E3B8CD1E1B0FA5D679406137C1CAB5B93F5F981F9D6F4E862C9E36F2E829A92BF09AC979016DBDB905AE5E729D5E1BFBDF9397568741756152863E79C0FC0773FD987C3375717E6E063030000, 0x1F8B0800000000000000AB562ACE2F2D4A4E55B2CA2BCDC9D1512A28CA2F2856B2AAAEAD050091A43BF81A000000, NULL);

-- ----------------------------
-- Table structure for execution_logs
-- ----------------------------
DROP TABLE IF EXISTS `execution_logs`;
CREATE TABLE `execution_logs`  (
  `exec_id` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attempt` int(11) NOT NULL,
  `enc_type` tinyint(4) NULL DEFAULT NULL,
  `start_byte` int(11) NOT NULL,
  `end_byte` int(11) NULL DEFAULT NULL,
  `log` longblob NULL,
  `upload_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`exec_id`, `name`, `attempt`, `start_byte`) USING BTREE,
  INDEX `ex_log_attempt`(`exec_id`, `name`, `attempt`) USING BTREE,
  INDEX `ex_log_index`(`exec_id`, `name`) USING BTREE,
  INDEX `ex_log_upload_time`(`upload_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of execution_logs
-- ----------------------------
INSERT INTO `execution_logs` VALUES (1, '', 0, 2, 0, 1214, 0x1F8B0800000000000000A593C172DA301086EF798ABD7182410686B16F8C0333ED219929C903C8D28237C19267B50E4D9FBE9212D2433998F66A693F7DBBFF5A95D3F9625ACC55096A55CDD7555140BD7F82DA779D7616BE3DEC1E610A9B10E8E8D002FE44338867A8E03D34B69D2F6747DBD899F15DA58A45A1EED45FC4C535E28FC13972C70C245B29389CFCB9BA5CEAD9BFA0914A2978430EE45D359AFCDC5B2D08DA08BD21301E90D119BCA93C999123217DCA626089A38FE7F7D958CE0EC5B489F3E21B48DF43AB19736B3DB21086D1A8BD68CE4A4925DC3AE1EC3FF93C9C8C7EB4F6EE40C7811362F3EB5537DA4187C26402086BF39AD97113627F1C9F4206DFA4D0467735341D895C46F46508E22102C78B32C6BC2D1CE81453EF7B7436BA7C9A5D2E8F856D44B469FF81B6BC46FBFEA724021D85443E93B41044CB1060FF5CD7DBEDFDF63E6E1B280868BCB3D712BE8ADFE564274021564A9ADB7FF2B2620A64E8F3DACC6073D694237A42EEC8C53FC3BBDB70B1E3E439B6688F1F2B11E70E421DE6D1E71556A941B55A15E5BA2C96CB725DDCFD068BB4236CBE040000, 1552979244982);
INSERT INTO `execution_logs` VALUES (1, 'Command', 0, 2, 0, 5836, 0x1F8B0800000000000000BD58DF73A336107EBFBF424F77336D0101B6319E616E2E89D3B9B4F93197A4ED1B2340368A413092B0EBEBF47FEFCAE0D8973A35E0F43C7EB025EDB79F56ABDDD5DABE815DC3C1B68FECE1047B13C745E7F70FE8BCC873C213F4F9E6F21619E85E11A1189FA3A7227A9E230A64868EEFF9CEC0F5B0F3CE6E07A631AE7EBB4644CCE5041917E4EB8244849BB3AC58B124D8AEDE4DD03F690C13F6DE1060EC96B6557C56B12CD1BB889B71CD448357AA10263A00333804734DF342ACD15C10AE68826685D8374B5B147BCB422255342CA8D9569ACE6634566C495125A9400C0CC9E96A3C6E2BDFFC9DA04CB61599F2251305CF295768490423514641ED5F57B767E1EDE3C3DDE34378F7E5F62EBCFCFCEB34B02A29AC34292DC71C9AAE890DD7B39AB333F45E0D60BDA4C2AAF7CD0A2E2DDB6A148645A5CA4A85DEC8F7B0EF38BEEB3A433C1AB8FE305479F913D21ADF4855298A5286436F6403BA0F5F8C47DEC81DF9B5A65FBE9C0DCFCF6F3E5D831A18B016221AC6711882ADA5EDD88E6B87E1166AF7C3DE2C188F6BA61BE966EEEFB6C6FEBD100BEDA9091370CEE06E13D4679F6DD5FDB0F92084AEC091B54D285C772A61A09E698B63A09B4251340107C92A0A6E897222177049D86C0BBB469CE41451EDF82BA652F421FCE3436BBFDF8F15CF71A197F0B7D1A61704ECE849DF42A0D08F43039011A9E294F0394DA275D0E91E1F814B88A24113A4EDB13F1AF8A700EB830B76AE7F0A1438AA0417ED797652A7233321EBC0EEB7A11A202D2A01D63901216759C6248D0BF0E660303C854CCE382480007BA760145CA501764F80A837133887B2795B0CC5720ABFF232D0D21AC5F61F1A0CC70433FD88C7138C4FD4F0B5E034F82419B1EEB5B3A7849D00B8A6446CD8F6C3A8A29C299D894FB8BD550581C48FA2648C31317C27F18C011E44C6D81D0C8D19267E1279B1EFCE685774284E4CA21489539DBBCD19CB68BFA4196A24DB6CD434983DD9D0BC54416717D0C2FD83F6469AF322A132E8239B534520A292DA842FACA127FB8042B1D38F51C6F8626B49B31259902A554E2C6B2DA324C5AE394FA2C4841A73E24151636DCBDC8FDBA4F91E946F0DF9BEF7816C483C3B490F1ABD146ABB1D5505D2644EC5C726E3EC25AEF7FABE3DEF7DCF0E7DC9E8CD9C7804BD54AFA04AAC63C71B19A32B8B7CF31432E394C68B4089AA736C3A46BC2D5EF3960ADA3F67285F9A2FCBF3AEB2DFF3D9D395DBF77820B5E59492A4284A38543E33E145739051BDC6D26B3AC2A6C94C422D971FCE6AF522432FEA8AFBDF901DD172520A9A54313D4AF57965470D6B22F85170BDA8352E5BD22387062BBA1D99867C9D23CCB645D23920A9F2D2DC3D573B45A0A7656EEA0E54F0FF34A00EEA9425118BD7B7BF996E5D78AB754983B81B8155DD5678F53CDFB89F308591971D85960D858BE9D9E3CFBAF3589215A70952A9A024A93B0600175329114B908DB1DDDA62DB520DCEAEA3C81BC5E6370DAAE126F3EF0AD0AC98B716FDB674ED2079D7981EFCAECCA86E7FCA2AD623B32ACBD688718451F31E6EDDD3B9649CC9F4DFDDE54D493A01C0FD46F3C0C75EED05F070832717BA7F3C3F9F4E2FA617EFFE01E945820FCC160000, 1552979244972);

-- ----------------------------
-- Table structure for executor_events
-- ----------------------------
DROP TABLE IF EXISTS `executor_events`;
CREATE TABLE `executor_events`  (
  `executor_id` int(11) NOT NULL,
  `event_type` tinyint(4) NOT NULL,
  `event_time` datetime(0) NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `executor_log`(`executor_id`, `event_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for executors
-- ----------------------------
DROP TABLE IF EXISTS `executors`;
CREATE TABLE `executors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `port` int(11) NOT NULL,
  `active` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `host`(`host`, `port`) USING BTREE,
  UNIQUE INDEX `executor_id`(`id`) USING BTREE,
  INDEX `executor_connection`(`host`, `port`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of executors
-- ----------------------------
INSERT INTO `executors` VALUES (121, 'ysbdh04.gdbd.com', 12321, 1);

-- ----------------------------
-- Table structure for project_events
-- ----------------------------
DROP TABLE IF EXISTS `project_events`;
CREATE TABLE `project_events`  (
  `project_id` int(11) NOT NULL,
  `event_type` tinyint(4) NOT NULL,
  `event_time` bigint(20) NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `log`(`project_id`, `event_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_events
-- ----------------------------
INSERT INTO `project_events` VALUES (1, 1, 1543817921478, 'etl64', NULL);
INSERT INTO `project_events` VALUES (1, 2, 1543817921654, 'etl64', NULL);
INSERT INTO `project_events` VALUES (2, 1, 1543817939474, 'etl64', NULL);
INSERT INTO `project_events` VALUES (2, 2, 1543817939540, 'etl64', NULL);
INSERT INTO `project_events` VALUES (3, 1, 1543818403628, 'etl63', NULL);
INSERT INTO `project_events` VALUES (3, 2, 1543818418579, 'etl63', NULL);
INSERT INTO `project_events` VALUES (4, 1, 1543818463787, 'etl63', NULL);
INSERT INTO `project_events` VALUES (5, 1, 1543818699544, 'etl63', NULL);
INSERT INTO `project_events` VALUES (5, 2, 1543818802038, 'etl63', NULL);
INSERT INTO `project_events` VALUES (6, 1, 1543818816734, 'etl63', NULL);
INSERT INTO `project_events` VALUES (6, 2, 1543818880761, 'etl63', NULL);
INSERT INTO `project_events` VALUES (7, 1, 1543818890338, 'etl63', NULL);
INSERT INTO `project_events` VALUES (7, 2, 1543819029962, 'etl63', NULL);
INSERT INTO `project_events` VALUES (8, 1, 1543819779636, 'etl63', NULL);
INSERT INTO `project_events` VALUES (8, 2, 1543819785593, 'etl63', NULL);
INSERT INTO `project_events` VALUES (9, 1, 1543819926609, 'etl63', NULL);
INSERT INTO `project_events` VALUES (9, 2, 1543819926756, 'etl63', NULL);
INSERT INTO `project_events` VALUES (10, 1, 1543820003504, 'etl64', NULL);
INSERT INTO `project_events` VALUES (10, 2, 1543820003559, 'etl64', NULL);
INSERT INTO `project_events` VALUES (11, 1, 1552979189161, 'new88', NULL);
INSERT INTO `project_events` VALUES (11, 6, 1552979189657, 'new88', 'Uploaded project files zip news121231.zip');

-- ----------------------------
-- Table structure for project_files
-- ----------------------------
DROP TABLE IF EXISTS `project_files`;
CREATE TABLE `project_files`  (
  `project_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `chunk` int(11) NOT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `file` longblob NULL,
  PRIMARY KEY (`project_id`, `version`, `chunk`) USING BTREE,
  INDEX `file_version`(`project_id`, `version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_files
-- ----------------------------
INSERT INTO `project_files` VALUES (11, 1, 0, 186, 0x504B0304140008080800CE78734E0000000000000000000000000B000000436F6D6D616E642E6A6F622BA92C48B54DCECFCD4DCC4BE1E5CACA4FD24B29CD2DD02B28CA2F482D2AC94C2DB62D292A4DE5E5822AB1CD29E6E5024100504B0708C837A8273200000038000000504B01021400140008080800CE78734EC837A82732000000380000000B0000000000000000000000000000000000436F6D6D616E642E6A6F62504B05060000000001000100390000006B0000000000);

-- ----------------------------
-- Table structure for project_flows
-- ----------------------------
DROP TABLE IF EXISTS `project_flows`;
CREATE TABLE `project_flows`  (
  `project_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `flow_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified_time` bigint(20) NOT NULL,
  `encoding_type` tinyint(4) NULL DEFAULT NULL,
  `json` blob NULL,
  PRIMARY KEY (`project_id`, `version`, `flow_id`) USING BTREE,
  INDEX `flow_index`(`project_id`, `version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_flows
-- ----------------------------
INSERT INTO `project_flows` VALUES (11, 1, 'Command', 1552979189647, 2, 0x1F8B08000000000000005D4F490EC2300CFC8BCF5545AFB9F607C00D7130898B8A9CB8CAC2A2AA7FC76D4042DCECF12C9E193C65749811CCBC343045B991CDEDE8C0745D03411C2530A719185F52B2B280E94E0C6657E9D3414AB4042614E6066E72F902D08BF7185CAB183440CF499DC9ED4BC8A3D7BBDAAF315F1A6CE2E36B5AA5F6832D6715BAEBF6838E038E5C22B5E475A8502AD6524ABFD09F6BAE9603CB43B73BC5344AD8E257491F09B34425381AB070865AEB93A8B5C96DC507E444CB1BDE9F527131010000);

-- ----------------------------
-- Table structure for project_permissions
-- ----------------------------
DROP TABLE IF EXISTS `project_permissions`;
CREATE TABLE `project_permissions`  (
  `project_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified_time` bigint(20) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissions` int(11) NOT NULL,
  `isGroup` tinyint(1) NOT NULL,
  PRIMARY KEY (`project_id`, `name`) USING BTREE,
  INDEX `permission_index`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_permissions
-- ----------------------------
INSERT INTO `project_permissions` VALUES ('1', 1543817921338, 'etl64', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('10', 1543820003471, 'etl64', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('11', 1552979189089, 'new88', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('2', 1543817939444, 'etl64', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('3', 1543818403462, 'etl63', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('4', 1543818462806, 'etl63', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('5', 1543818699481, 'etl63', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('6', 1543818816689, 'etl63', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('7', 1543818890247, 'etl63', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('8', 1543819779381, 'etl63', 134217728, 0);
INSERT INTO `project_permissions` VALUES ('9', 1543819925908, 'etl63', 134217728, 0);

-- ----------------------------
-- Table structure for project_properties
-- ----------------------------
DROP TABLE IF EXISTS `project_properties`;
CREATE TABLE `project_properties`  (
  `project_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `modified_time` bigint(20) NOT NULL,
  `encoding_type` tinyint(4) NULL DEFAULT NULL,
  `property` blob NULL,
  PRIMARY KEY (`project_id`, `version`, `name`) USING BTREE,
  INDEX `properties_index`(`project_id`, `version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_properties
-- ----------------------------
INSERT INTO `project_properties` VALUES (11, 1, 'Command.job', 1552979189653, 2, 0x1F8B0800000000000000AB56CACA4FD24B29CD2DD02B28CA2F482D2AC94C2D56B2522A292A4D55D2512AA92C4805F292F3737313F3528002309695524EB1522D00316254E83E000000);

-- ----------------------------
-- Table structure for project_versions
-- ----------------------------
DROP TABLE IF EXISTS `project_versions`;
CREATE TABLE `project_versions`  (
  `project_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `upload_time` bigint(20) NOT NULL,
  `uploader` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `md5` binary(16) NULL DEFAULT NULL,
  `num_chunks` int(11) NULL DEFAULT NULL,
  `resource_id` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`, `version`) USING BTREE,
  INDEX `version_index`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_versions
-- ----------------------------
INSERT INTO `project_versions` VALUES (11, 1, 1552979189563, 'new88', 'zip', 'news121231.zip', 0xC0CA9BFA9975A702F6100946E028035E, 1, NULL);

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `modified_time` bigint(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `last_modified_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enc_type` tinyint(4) NULL DEFAULT NULL,
  `settings_blob` longblob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`id`) USING BTREE,
  INDEX `project_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (1, 'ar', 0, 1543817921638, 1543817921102, NULL, 'etl64', 'ar', 2, 0x1F8B0800000000000000758C3B0EC2301005EFF26A1771083FDF810E2A44B18A1769A5388ED62B048A72770C82828276DECC9B91D8289211C2BC388C941801A470885C7A95C9248F5F3450B1438E72158EA7C25A39DBB0E9EA2411C13BDC58CB3B681C26CDF7C74B2B08E78F78F93D394AE26294A61AAFBBD5CE6FF7ADF74DEBD02B93F1BF7D7902A0123962B9000000);
INSERT INTO `projects` VALUES (2, 'ar', 0, 1543817939536, 1543817939344, NULL, 'etl64', 'ar', 2, 0x1F8B0800000000000000758C3B0EC2301005EFF26A17049B4F7C073AA810C52A5E244B711CEDAE1028CADD09080A0ADA99796F4261A3444688D3EC3050614490C021B1769247CB75F8A29ED40E35E56BE674529685B3F5DBB0A89C10D70E37167D0F560EA3D4FBE39529E2F9135E7E4F8EB9B01A9511B1D904BF6F76AD6F7D080E9D3019FFF3F313BA194D5BB9000000);
INSERT INTO `projects` VALUES (3, 'TaskTest_20181102', 0, 1543818418526, 1543818402799, NULL, 'etl63', '任务管理测试20181102', 2, 0x1F8B0800000000000000AB56CA4D2D494C492C4954B2AAAED551CA4BCC4D55B2520A492CCE0E492D2E89373230B43034343052D2514A492D4E2ECA2C28C9CCCF03AA78B27BF7D3AE85CFD72D7C3EA1EDD9D6EE17EBA72229CD492C2EF1CD4FC94CCB4C4D092D4E2D02AA4F2DC93133064A65A6285919EB2895A51615830D32D0512A28CAAFA804292B56B28A862A8C453524243317E89AC4DC02252B435313630B430B130323734B4B1DA5E4A2D4C492545CF2B500230C697BE0000000);
INSERT INTO `projects` VALUES (4, 'TaskTest_20181102', 1, 1543818461953, 1543818461953, NULL, 'etl63', '任务管理测试20181102', 2, 0x1F8B0800000000000000AB56CA4D2D494C492C4954B2AAAED551CA4BCC4D55B2520A492CCE0E492D2E89373230B43034343052D2514A492D4E2ECA2C28C9CCCF03AA78B27BF7D3AE85CFD72D7C3EA1EDD9D6EE17EBA72229CD492C2EF1CD4FC94CCB4C4D092D4E2D02AA4F2DC93133064A65A6285999E82895A51615830D32D0512A28CAAFA804292B56B28A862A8C453524243317E89AC4DC02252B435313630B430B1333434B53631DA5E4A2D4C492545CF2B5009265ED7CE0000000);
INSERT INTO `projects` VALUES (5, 'scheduler-test01', 0, 1543818801997, 1543818699445, NULL, 'etl63', 'scheduler-test01', 2, 0x1F8B080000000000000075CC410AC2301085E1BBCC3A4243D3D2E60EEE74252E8664C440D286CC5494D2BB1BC58DA0EBF7BD7F8544821E05C1AE9B82091381057657F24BA4B21362693428F0C4AE842C619E7E83882CFBD9874B207F642A5591C4BEAD53F0603B05372AFCBE370A7299EF8F1763B0A70F3C7F470E21D536A60C5677A61DF4D08FA33135E40AA1D0BF7D7B02B136DB88D5000000);
INSERT INTO `projects` VALUES (6, 'scheduler-test01', 0, 1543818880741, 1543818816660, NULL, 'etl63', 'scheduler-test01', 2, 0x1F8B0800000000000000758CCD0A02211080DF65CE062B5B22BE43B73A4587412712741567368A65DF3D8B2E419DBF9F053209061404B7AC0A26CC040ED85F29CC89DA468865D0A02010FB16ABC432FD1612B2EC4B889748E1C8D4BA4592CCD8510CE08C821B357EE78382DACAFDF1D218DCE9239EBF278798FB1B7305A777DBD16A6BB531A6C7BE110AFDE3EB13E16B0991D5000000);
INSERT INTO `projects` VALUES (7, 'scheduler-test01', 0, 1543819029944, 1543818890221, NULL, 'etl63', 'scheduler-test01', 2, 0x1F8B080000000000000075CCCB0AC2301085E17739EB084DEB25E61DDCE94A5C0CC98881A62D995194D277B78A1B41D7E73BFF88CC4A9194E0C7C9A0A3CCF09070E1786DB92C94452B0B83C8124A1A34F5DD6FD092E8AE8FE99C381E84CBAC58DB75334F29C26F0C6E5CE47DAF0C86D2DF1F2F26F0C70F3C7D47F629CF6DCA03BC5D2D1B679DDB56756D0D426152FEB74F4F89C698B2D5000000);
INSERT INTO `projects` VALUES (8, 'scheduler-test01', 0, 1543819785554, 1543819779036, NULL, 'etl63', 'scheduler-test01', 2, 0x1F8B080000000000000075CCCB0AC2301085E17739EB082DD15EF20EEEEC4A5C0CC98881A62D995194D277B78A1B41D7E73BFF8CC44A8194E0E6C560A0C470107FE170ED396F94458B120681C5E738691C87DFA027D1FD18E23972E884F3AA58FBCAAE530C708DC18DB3BCEF85C194C7FBE3C504EEF881A7EFC821A6B54D69822B775BDB946D5DB785AD0C7C6652FEB72F4FBA54B83AD5000000);
INSERT INTO `projects` VALUES (9, 'scheduler-test01', 0, 1543819926748, 1543819925114, NULL, 'etl63', 'scheduler-test01', 2, 0x1F8B080000000000000075CCC10AC2301084E177997384C6B662F20EDEF4241E9666C540D296EC2A4AE9BB5BC58BA0E7F9E69F9059299012FC341BF494191ED25D385C139795B26865611058BA12478D43FF1B2412DD0D219E2387837059146BDAD4CB1403BC33B87191F7BD3218CB707FBC98C01F3FF0F41DD9C7BCB4298FF0B66DEAAD756EDD5ADB18748549F9DF3E3F019A44C5A9D5000000);
INSERT INTO `projects` VALUES (10, 'ar', 0, 1543820003555, 1543820003432, NULL, 'etl64', 'ar', 2, 0x1F8B0800000000000000758CB10A02311044FF65EB14F11245F20F765A89C5725961E17209BB8B28C7FDBB51B4B0B01BE6CD9B050A19663484B4AC0E662C040950C041261D859B719DBFD5846A879AF9CA944F4AD27BB269173BE20C69E31DDC48F46DF4DCA4DE1FAF9D423A7F9697DF97231752C3D2BABD8D613F78EF430C838351088DFEF1F509A95BDE33BA000000);
INSERT INTO `projects` VALUES (11, 'news121231', 1, 1552979189649, 1552979189086, 1, 'new88', 'news121231', 2, 0x1F8B080000000000000075CCBB0EC2300C85E177F19CA10E2A24790736981083D518C91249AA38E2A2AAEF4EB92C20317FFF3913246E14A91184693690293104C87C55B46857080622EB50656C52F22F9D49DBB6443909C7BD727DBB730B49848068E0C2555FCBCEC058CBEDFEEC14C2E1531EBF5F7692581BA57159F7BDF51B8FCE776E6D60A84C8DFFF9FC00A1533C76CA000000);

-- ----------------------------
-- Table structure for properties
-- ----------------------------
DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `modified_time` bigint(20) NOT NULL,
  `value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`name`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for triggers
-- ----------------------------
DROP TABLE IF EXISTS `triggers`;
CREATE TABLE `triggers`  (
  `trigger_id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_source` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` bigint(20) NOT NULL,
  `enc_type` tinyint(4) NULL DEFAULT NULL,
  `data` longblob NULL,
  PRIMARY KEY (`trigger_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
