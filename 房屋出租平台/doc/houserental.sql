/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : houserental

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 08/04/2024 10:48:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agentinfo
-- ----------------------------
DROP TABLE IF EXISTS `agentinfo`;
CREATE TABLE `agentinfo`  (
  `agentId` int(20) NOT NULL AUTO_INCREMENT,
  `agentNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单位编码',
  `agentName` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '单位名称（房东）',
  `agentIcon` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '系统标志',
  `contact` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '联系方式',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '地址',
  `registerTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `state` int(11) NULL DEFAULT 1 COMMENT '用户状态(1有效，0无效)',
  `managerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `aboutUs` varchar(3000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '关于我们',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`agentId`) USING BTREE,
  UNIQUE INDEX `unq_agentNo`(`agentNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '合作伙伴（房东）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agentinfo
-- ----------------------------
INSERT INTO `agentinfo` VALUES (1, 'ht', '宏图软件', 'http://localhost:8888/parkPic/agent/d349b1c6-1c46-4b1f-be57-614db9d6b2d3.png', '赖国荣', '15374363882', '江西赣州', '2021-01-18 16:24:50', 1, '赖国荣', '宏图软件', ' ');
INSERT INTO `agentinfo` VALUES (2, 'gr', '国荣科技物业公司', 'http://localhost:8888/parkPic/agent/a19b06ad-c8be-4a4e-9185-b98000d6d5c4.jpg', '赖国荣', '15374363882', '江西赣州文明大道', '2021-01-18 17:22:02', 1, 'admin', '专业物业管理', '专业物业管理');
INSERT INTO `agentinfo` VALUES (3, 'aa', '万能物业', 'http://localhost:8888/parkPic/agent/32c87f13-842b-4dd7-9deb-9146f2e0d67e.jpg', '张师傅', '139999999999', '赣州', '2021-01-26 20:39:39', 1, 'admin', '', '');
INSERT INTO `agentinfo` VALUES (7, 'hk', 'adf', '', 'sfa', 'sfsf', '', '2021-02-06 16:40:36', 1, 'admin', '', '');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community`  (
  `communityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `communityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '小区名称',
  `seq` bigint(20) NULL DEFAULT NULL COMMENT '序号',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `createrTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lng` float(11, 6) NULL DEFAULT NULL COMMENT '经度',
  `lat` float(11, 6) NULL DEFAULT NULL COMMENT '维度',
  `remark` varchar(3000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '周边实施',
  `agentId` int(11) NULL DEFAULT NULL COMMENT '房东ID',
  PRIMARY KEY (`communityId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '小区信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES (2, '技师学院', 20, 'admin', '2021-01-19 11:00:02', 114.947037, 25.804974, NULL, NULL);
INSERT INTO `community` VALUES (3, '全球通大厦', 30, 'admin', '2021-01-19 20:24:26', 114.954796, 25.842293, NULL, NULL);
INSERT INTO `community` VALUES (9, '海亮天城', 90, 'admin', '2021-02-06 16:48:16', 114.932251, 25.807720, NULL, NULL);
INSERT INTO `community` VALUES (11, '恒大帝景', 110, 'admin', '2022-04-02 15:24:13', 114.923988, 25.827690, NULL, NULL);
INSERT INTO `community` VALUES (12, '瑞心家园', 120, 'admin', '2022-04-11 16:03:56', 114.949860, 25.820665, NULL, NULL);
INSERT INTO `community` VALUES (13, '中祥.玖珑湾', 130, 'admin', '2022-04-11 16:04:28', 114.940804, 25.809673, NULL, NULL);
INSERT INTO `community` VALUES (14, '中航云府', 140, 'admin', '2022-04-11 16:07:19', 114.918365, 25.829576, NULL, NULL);
INSERT INTO `community` VALUES (15, '公园一号', 150, 'admin', '2022-04-11 16:07:58', 114.934792, 25.819195, NULL, NULL);
INSERT INTO `community` VALUES (16, '黄金时代', 160, 'lgr', '2022-04-12 09:14:47', 114.937592, 25.838869, NULL, NULL);

-- ----------------------------
-- Table structure for complain
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain`  (
  `complainId` int(11) NOT NULL AUTO_INCREMENT,
  `houseId` int(11) NULL DEFAULT NULL COMMENT '投诉房号',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '投诉标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '投诉内容',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '投诉人',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `createTime` date NULL DEFAULT NULL COMMENT '投诉时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态(1未处理，2处理中，3结案)',
  `dealPerson` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '协调人员',
  `dealResult` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '处理结果',
  `dealTime` date NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`complainId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '投诉信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complain
-- ----------------------------
INSERT INTO `complain` VALUES (9, NULL, '门前垃圾太多', '门前垃圾太多，长时间未处理\n', '李四', NULL, '2023-07-01', 3, '张阿姨', '已清理垃圾，并打扫干净。\n', '2023-07-01');
INSERT INTO `complain` VALUES (11, NULL, '噪声扰民', '3栋805装修太吵，影响孩子信息', '小丽', NULL, '2023-07-02', 3, '丽丽', '与业主沟通协调，要求其休息时间不能装修。\n', '2023-07-02');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `contractId` int(11) NOT NULL AUTO_INCREMENT,
  `houseId` int(11) NULL DEFAULT NULL COMMENT '房号',
  `personId` int(11) NULL DEFAULT NULL COMMENT '租户号',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '合同图片地址',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `seq` int(11) NULL DEFAULT NULL COMMENT '顺序号',
  PRIMARY KEY (`contractId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '租赁合同图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for finance
-- ----------------------------
DROP TABLE IF EXISTS `finance`;
CREATE TABLE `finance`  (
  `financeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paidMonth` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款月份',
  `houseId` int(11) NULL DEFAULT NULL COMMENT '房屋ID（关联house表）',
  `rentMoney` float(11, 2) NULL DEFAULT NULL COMMENT '租金',
  `depositMoney` float(11, 2) NULL DEFAULT NULL COMMENT '押金',
  `houseMoney` float(11, 2) NULL DEFAULT NULL COMMENT '物业费',
  `eletricMoney` float(11, 2) NULL DEFAULT NULL COMMENT '电费',
  `waterMoney` float(11, 2) NULL DEFAULT NULL COMMENT '水费',
  `gasMoney` float(11, 2) NULL DEFAULT NULL COMMENT '煤气费',
  `otherMoney` float(11, 2) NULL DEFAULT NULL COMMENT '其他费用',
  `totalMoney` float(11, 2) NULL DEFAULT NULL COMMENT '费用总计',
  `waterNo` float(11, 2) NULL DEFAULT NULL COMMENT '水表吨数',
  `eletricNo` float(11, 2) NULL DEFAULT NULL COMMENT '电表度数',
  `gasNo` float(11, 2) NULL DEFAULT NULL COMMENT '煤气表立方数',
  `state` int(11) NULL DEFAULT NULL COMMENT '收款状态（1未收费，2已收费，3退费）',
  `paidType` int(11) NULL DEFAULT NULL COMMENT '付款方式（0未知,1微信，2支付宝，3银行转账，4现金，5其他）',
  `paidDate` date NULL DEFAULT NULL COMMENT '付款日期',
  `operTime` timestamp(0) NULL DEFAULT NULL COMMENT '操作时间',
  `operator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`financeId`) USING BTREE,
  UNIQUE INDEX `idx_month`(`paidMonth`, `houseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收款明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance
-- ----------------------------
INSERT INTO `finance` VALUES (1, '202306', 1, 82.00, NULL, 40.00, 10.00, 15.00, NULL, NULL, 147.00, NULL, NULL, NULL, 2, 1, '2023-06-28', '2023-06-28 11:23:26', '管理员', '微信缴费');
INSERT INTO `finance` VALUES (2, '202306', 2, 80.00, NULL, 40.00, 0.00, 0.00, NULL, NULL, 120.00, NULL, NULL, NULL, 2, 4, '2023-06-07', '2023-06-28 11:25:15', '管理员', '现金缴费');
INSERT INTO `finance` VALUES (6, '202306', 4, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 2, 4, '2023-06-07', '2023-06-28 11:25:15', '管理员', '现金缴费');
INSERT INTO `finance` VALUES (7, '202306', 5, 500.00, NULL, 60.00, 0.00, 0.00, NULL, NULL, 560.00, NULL, NULL, NULL, 2, 3, '2023-06-28', '2023-06-28 11:25:32', '管理员', '银行转账');
INSERT INTO `finance` VALUES (8, '202306', 6, 360.00, NULL, 240.00, 0.00, 0.00, NULL, NULL, 600.00, NULL, NULL, NULL, 2, 3, '2023-06-28', '2023-06-28 11:25:32', '管理员', '银行转账');
INSERT INTO `finance` VALUES (9, '202306', 7, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:40:18', '管理员', '');
INSERT INTO `finance` VALUES (10, '202306', 8, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:40:18', '管理员', '');
INSERT INTO `finance` VALUES (11, '202306', 9, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:40:18', '管理员', '');
INSERT INTO `finance` VALUES (12, '202306', 10, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (13, '202306', 11, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:40:55', '管理员', '');
INSERT INTO `finance` VALUES (14, '202306', 12, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (15, '202306', 13, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:40:55', '管理员', '');
INSERT INTO `finance` VALUES (16, '202306', 14, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:40:55', '管理员', '');
INSERT INTO `finance` VALUES (17, '202306', 15, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:41:12', '管理员', '');
INSERT INTO `finance` VALUES (18, '202306', 16, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (19, '202306', 17, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:41:12', '管理员', '');
INSERT INTO `finance` VALUES (20, '202306', 18, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 09:41:12', '管理员', '');
INSERT INTO `finance` VALUES (21, '202307', 1, 82.00, NULL, 40.00, 10.00, 15.00, NULL, NULL, 147.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (22, '202307', 2, 80.00, NULL, 40.00, 0.00, 0.00, NULL, NULL, 120.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (23, '202307', 4, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (24, '202307', 5, 500.00, NULL, 60.00, 0.00, 0.00, NULL, NULL, 560.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (25, '202307', 6, 360.00, NULL, 240.00, 0.00, 0.00, NULL, NULL, 600.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (26, '202307', 7, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (27, '202307', 8, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (28, '202307', 9, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (29, '202307', 10, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (30, '202307', 11, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (31, '202307', 12, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (32, '202307', 13, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (33, '202307', 14, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (34, '202307', 15, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (35, '202307', 16, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (36, '202307', 17, 90.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 90.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (37, '202307', 18, 200.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 295.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (38, '202306', 19, 300.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 300.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (39, '202306', 20, 266.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 361.00, NULL, NULL, NULL, 2, 2, '2023-07-02', '2023-07-02 10:59:24', '管理员', '');
INSERT INTO `finance` VALUES (40, '202306', 21, 184.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 184.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (41, '202306', 22, 276.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 371.00, NULL, NULL, NULL, 2, 2, '2023-07-02', '2023-07-02 10:59:24', '管理员', '');
INSERT INTO `finance` VALUES (42, '202306', 23, 300.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 300.00, NULL, NULL, NULL, 2, 3, '2023-07-02', '2023-07-02 10:59:44', '管理员', '');
INSERT INTO `finance` VALUES (43, '202306', 24, 266.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 361.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (44, '202306', 25, 184.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 184.00, NULL, NULL, NULL, 2, 3, '2023-07-02', '2023-07-02 10:59:44', '管理员', '');
INSERT INTO `finance` VALUES (45, '202306', 26, 276.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 371.00, NULL, NULL, NULL, 2, 3, '2023-07-02', '2023-07-02 10:59:44', '管理员', '');
INSERT INTO `finance` VALUES (46, '202306', 27, 300.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 300.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 10:58:59', '管理员', '');
INSERT INTO `finance` VALUES (47, '202306', 28, 266.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 361.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 10:58:59', '管理员', '');
INSERT INTO `finance` VALUES (48, '202306', 29, 184.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 184.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 10:58:59', '管理员', '');
INSERT INTO `finance` VALUES (49, '202306', 30, 276.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 371.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (50, '202307', 19, 300.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 300.00, NULL, NULL, NULL, 2, 2, '2023-07-02', '2023-07-02 10:59:24', '管理员', '');
INSERT INTO `finance` VALUES (51, '202307', 20, 266.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 361.00, NULL, NULL, NULL, 2, 2, '2023-07-02', '2023-07-02 10:59:24', '管理员', '');
INSERT INTO `finance` VALUES (52, '202307', 21, 184.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 184.00, NULL, NULL, NULL, 2, 2, '2023-07-02', '2023-07-02 10:59:24', '管理员', '');
INSERT INTO `finance` VALUES (53, '202307', 22, 276.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 371.00, NULL, NULL, NULL, 2, 2, '2023-07-02', '2023-07-02 10:59:24', '管理员', '');
INSERT INTO `finance` VALUES (54, '202307', 23, 300.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 300.00, NULL, NULL, NULL, 2, 3, '2023-07-02', '2023-07-02 10:59:44', '管理员', '');
INSERT INTO `finance` VALUES (55, '202307', 24, 266.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 361.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (56, '202307', 25, 184.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 184.00, NULL, NULL, NULL, 2, 3, '2023-07-02', '2023-07-02 10:59:44', '管理员', '');
INSERT INTO `finance` VALUES (57, '202307', 26, 276.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 371.00, NULL, NULL, NULL, 2, 3, '2023-07-02', '2023-07-02 10:59:44', '管理员', '');
INSERT INTO `finance` VALUES (58, '202307', 27, 300.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 300.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 10:58:59', '管理员', '');
INSERT INTO `finance` VALUES (59, '202307', 28, 266.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 361.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 10:58:59', '管理员', '');
INSERT INTO `finance` VALUES (60, '202307', 29, 184.00, NULL, 0.00, 0.00, 0.00, NULL, NULL, 184.00, NULL, NULL, NULL, 1, 0, NULL, NULL, '', '');
INSERT INTO `finance` VALUES (61, '202307', 30, 276.00, NULL, 60.00, 20.00, 15.00, NULL, NULL, 371.00, NULL, NULL, NULL, 2, 1, '2023-07-02', '2023-07-02 10:58:59', '管理员', '');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `houseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '房屋ID',
  `communityId` bigint(20) NULL DEFAULT NULL COMMENT '小区id(关联communityId表)',
  `termName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属楼栋',
  `houseName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房号',
  `struct` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户型',
  `inner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '装修情况',
  `area` float(11, 2) NULL DEFAULT NULL COMMENT '房屋面积',
  `lentMoney` float(11, 2) NULL DEFAULT NULL COMMENT '房屋租金',
  `deposit` float(11, 2) NULL DEFAULT NULL COMMENT '押金',
  `houseMoney` float(11, 2) NULL DEFAULT NULL COMMENT '物业费',
  `waterMoney` float(11, 2) NULL DEFAULT NULL COMMENT '水费/吨',
  `electricMoney` float(11, 2) NULL DEFAULT NULL COMMENT '电费/度',
  `gasMoney` float(11, 2) NULL DEFAULT NULL COMMENT '煤气/立方',
  `otherMoney` float(11, 2) NULL DEFAULT NULL COMMENT '其他费用',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态（0空闲，1预订，2已出租，3欠费，4维修）',
  `expireDate` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`houseId`) USING BTREE,
  UNIQUE INDEX `unq_houseNo`(`communityId`, `termName`, `houseName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, 2, '2栋', '506', NULL, NULL, 142.00, NULL, NULL, 82.00, 10.00, 15.00, NULL, NULL, NULL, NULL, 'VIP客户');
INSERT INTO `house` VALUES (2, 2, '2栋', '505', NULL, NULL, 142.00, NULL, NULL, 80.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (4, 3, '1栋', '101', NULL, NULL, 111.00, NULL, NULL, 90.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (5, 3, '1栋', '102', NULL, NULL, 121.00, NULL, NULL, 500.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (6, 9, '1栋', '0901', NULL, NULL, 180.00, NULL, NULL, 360.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (7, 13, '1栋', '101', NULL, NULL, 111.00, NULL, NULL, 90.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (8, 13, '1栋', '201', NULL, NULL, 123.00, NULL, NULL, 200.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (9, 13, '2栋', '101', NULL, NULL, 111.00, NULL, NULL, 90.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (10, 13, '2栋', '201', NULL, NULL, 123.00, NULL, NULL, 200.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (11, 14, '1栋', '801', NULL, NULL, 111.00, NULL, NULL, 90.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (12, 14, '1栋', '601', NULL, NULL, 123.00, NULL, NULL, 200.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (13, 14, '2栋', '503', NULL, NULL, 111.00, NULL, NULL, 90.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (14, 14, '2栋', '602', NULL, NULL, 123.00, NULL, NULL, 200.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (15, 15, '1栋', '801', NULL, NULL, 111.00, NULL, NULL, 90.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (16, 15, '1栋', '601', NULL, NULL, 123.00, NULL, NULL, 200.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (17, 15, '2栋', '503', NULL, NULL, 111.00, NULL, NULL, 90.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (18, 15, '2栋', '602', NULL, NULL, 123.00, NULL, NULL, 200.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (19, 11, '1栋', '302', NULL, NULL, 150.00, NULL, NULL, 300.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (20, 11, '1栋', '303', NULL, NULL, 133.00, NULL, NULL, 266.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (21, 11, '2栋', '401', NULL, NULL, 142.00, NULL, NULL, 184.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (22, 11, '2栋', '402', NULL, NULL, 138.00, NULL, NULL, 276.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (23, 12, '1栋', '302', NULL, NULL, 150.00, NULL, NULL, 300.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (24, 12, '1栋', '303', NULL, NULL, 133.00, NULL, NULL, 266.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (25, 12, '2栋', '401', NULL, NULL, 142.00, NULL, NULL, 184.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (26, 12, '2栋', '402', NULL, NULL, 138.00, NULL, NULL, 276.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (27, 16, '1栋', '302', NULL, NULL, 150.00, NULL, NULL, 300.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (28, 16, '1栋', '303', NULL, NULL, 133.00, NULL, NULL, 266.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (29, 16, '2栋', '401', NULL, NULL, 142.00, NULL, NULL, 184.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '');
INSERT INTO `house` VALUES (30, 16, '2栋', '402', NULL, NULL, 138.00, NULL, NULL, 276.00, 20.00, 15.00, NULL, NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for housedevice
-- ----------------------------
DROP TABLE IF EXISTS `housedevice`;
CREATE TABLE `housedevice`  (
  `deviceId` int(255) NOT NULL AUTO_INCREMENT,
  `deviceName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '设备名称',
  `cnt` int(11) NULL DEFAULT NULL COMMENT '数量',
  `price` float(11, 2) NULL DEFAULT NULL COMMENT '单价',
  `houseId` int(11) NULL DEFAULT NULL COMMENT '房号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`deviceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房间设备实施表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for housepics
-- ----------------------------
DROP TABLE IF EXISTS `housepics`;
CREATE TABLE `housepics`  (
  `picId` int(11) NOT NULL AUTO_INCREMENT,
  `picTitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图片URL',
  `houseId` int(11) NULL DEFAULT NULL COMMENT 'houseId',
  `seq` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`picId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '房间图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for maintenance
-- ----------------------------
DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE `maintenance`  (
  `mainId` int(11) NOT NULL AUTO_INCREMENT,
  `houseId` int(11) NULL DEFAULT NULL COMMENT '维修房号',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '报修内容',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '申请人',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `createTime` date NULL DEFAULT NULL COMMENT '申请时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '处理进度(1未处理，2处理中，3完成)',
  `dealMoney` float(11, 2) NULL DEFAULT NULL COMMENT '维修费用',
  `dealPerson` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '维修人员',
  `dealResult` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '处理结果',
  `dealTime` date NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`mainId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '维修申报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of maintenance
-- ----------------------------
INSERT INTO `maintenance` VALUES (9, NULL, '2栋电梯报警', '小张', NULL, '2021-12-29', 2, 0.00, '', '正在联系电梯公司\n', NULL);
INSERT INTO `maintenance` VALUES (11, NULL, '1栋楼道照明灯不亮', '小张', NULL, '2023-06-08', 3, 10.00, '李师傅', '灯泡烧毁，已更换灯泡。', '2023-06-08');

-- ----------------------------
-- Table structure for personinfo
-- ----------------------------
DROP TABLE IF EXISTS `personinfo`;
CREATE TABLE `personinfo`  (
  `personId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '租户姓名',
  `houseId` int(11) NULL DEFAULT NULL COMMENT '房间ID（租住的房间号）',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '男' COMMENT '性别(男/女)',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `cardNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '身份证号',
  `cardPic1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '身份证正面图片',
  `cardPic2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '身份证反面图片',
  `faceUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '人脸图片',
  `state` int(11) NULL DEFAULT 1 COMMENT '类别(1：未验证，2：已验证)',
  `createrTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `openId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '微信openId',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`personId`) USING BTREE,
  UNIQUE INDEX `uni_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '租户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personinfo
-- ----------------------------
INSERT INTO `personinfo` VALUES (91, '赖国荣', NULL, '男', '15374363882', NULL, NULL, NULL, 'http://localhost:8888/villegePic/face/4642020619626536744.png', 2, '2022-04-02 15:24:25', NULL, '');
INSERT INTO `personinfo` VALUES (93, '赖金宝', NULL, '男', '13888888888', NULL, NULL, NULL, 'http://localhost:8888/villegePic/face/4642060965497567176.png', 2, '2022-04-02 15:24:25', NULL, '');
INSERT INTO `personinfo` VALUES (96, '王老五', NULL, '男', '15374363883', NULL, NULL, NULL, 'http://localhost:8888/villegePic/face/5285634334948126526.png', 2, '2022-04-02 15:24:25', NULL, '');
INSERT INTO `personinfo` VALUES (97, '黄蓉', NULL, '女', '15374363884', NULL, NULL, NULL, '', 1, '2022-04-02 15:24:25', NULL, '');
INSERT INTO `personinfo` VALUES (98, '杨过', NULL, '男', '15374363885', NULL, NULL, NULL, '', 1, '2022-04-02 15:24:25', NULL, '');
INSERT INTO `personinfo` VALUES (100, '王大宝', NULL, '男', '13838383838', NULL, NULL, NULL, '', 1, '2022-04-12 08:55:06', NULL, '');
INSERT INTO `personinfo` VALUES (101, '王小妮', NULL, '女', '13979797979', NULL, NULL, NULL, '', 1, '2022-04-12 08:57:33', NULL, '学生');
INSERT INTO `personinfo` VALUES (102, '蕾蕾', NULL, '女', '13383838383', NULL, NULL, NULL, '', 1, '2022-04-12 09:02:41', NULL, '');
INSERT INTO `personinfo` VALUES (103, '花花', NULL, '女', '13913913913', NULL, NULL, NULL, '', 1, '2022-04-12 09:03:25', NULL, '');
INSERT INTO `personinfo` VALUES (104, '小猫', NULL, '女', '13679832106', NULL, NULL, NULL, '', 1, '2022-04-12 09:05:43', NULL, '');
INSERT INTO `personinfo` VALUES (105, '魏大国', NULL, '男', '13131313131', NULL, NULL, NULL, '', 1, '2022-04-12 09:06:58', NULL, '');
INSERT INTO `personinfo` VALUES (106, '钟祥', NULL, '男', '13576543218', NULL, NULL, NULL, '', 1, '2022-04-12 09:07:47', NULL, '');

-- ----------------------------
-- Table structure for rentinfo
-- ----------------------------
DROP TABLE IF EXISTS `rentinfo`;
CREATE TABLE `rentinfo`  (
  `rentInfoId` int(11) NOT NULL AUTO_INCREMENT,
  `personId` int(11) NULL DEFAULT NULL COMMENT '租户',
  `houseId` int(11) NULL DEFAULT NULL COMMENT '房号',
  `rentMoney` float(11, 2) NULL DEFAULT NULL COMMENT '租金/月',
  `deposit` float(11, 2) NULL DEFAULT NULL COMMENT '押金',
  `eletricNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电表初始值',
  `waterNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '水表初始值',
  `gasNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '煤气表初始值',
  `state` int(11) NULL DEFAULT NULL COMMENT '1正常租赁，2转租，3换房，4已退租',
  `startDate` datetime(0) NULL DEFAULT NULL COMMENT '入住时间',
  `endDate` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`rentInfoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '租赁信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `settingId` int(11) NOT NULL AUTO_INCREMENT,
  `eletricFee` float(11, 2) NULL DEFAULT NULL COMMENT '电费/度',
  `waterFee` float(11, 2) NULL DEFAULT NULL COMMENT '水费/吨',
  `gasFee` float(11, 2) NULL DEFAULT NULL COMMENT '煤气/立方',
  `serviceFee` float(11, 2) NULL DEFAULT NULL COMMENT '物业费/平方',
  PRIMARY KEY (`settingId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '费用设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `time` int(11) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1131,\"parentId\":0,\"name\":\"维修管理\",\"path\":\"maintenance\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":7,\"hidden\":\"false\",\"component\":\"\"}', 87, '127.0.0.1', NULL, '2023-06-30 15:36:15');
INSERT INTO `sys_log` VALUES (2, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1132,\"parentId\":1131,\"name\":\"维修管理\",\"path\":\"maintenance\",\"menuType\":2,\"perms\":\"sys:maintenance:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"sys/maintenance\"}', 4, '127.0.0.1', NULL, '2023-06-30 15:37:07');
INSERT INTO `sys_log` VALUES (3, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1133,\"parentId\":1132,\"name\":\"新增\",\"path\":\"\",\"menuType\":3,\"perms\":\"sys:maintenance:add\",\"icon\":\"\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-06-30 15:37:52');
INSERT INTO `sys_log` VALUES (4, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1134,\"parentId\":1132,\"name\":\"处理\",\"path\":\"\",\"menuType\":3,\"perms\":\"sys:maintenance:info\",\"icon\":\"\",\"isFrame\":0,\"status\":0,\"sort\":2,\"hidden\":\"false\",\"component\":\"\"}', 9, '127.0.0.1', NULL, '2023-06-30 15:38:12');
INSERT INTO `sys_log` VALUES (5, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1135,\"parentId\":1132,\"name\":\"删除\",\"path\":\"\",\"menuType\":3,\"perms\":\"sys:maintenance:del\",\"icon\":\"\",\"isFrame\":0,\"status\":0,\"sort\":3,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-06-30 15:38:28');
INSERT INTO `sys_log` VALUES (6, 'admin', '编辑角色', 'com.villege.modules.controller.sys.SysRoleController.edit()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"type\":1,\"remark\":\"具有所有权限的操作\",\"menuIdList\":[1030,100,1004,1001,1002,1003,1112,1113,1120,1119,1094,1037,1041,1042,1043,1108,1109,1110,1111,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1104,1036,1038,1039,1040,1118,1091,1114,1115,1116,1107,1117,1131,1132,1133,1134,1135,102,1009,1010,1011,1012,101,1005,1006,1007,1008,106,1025,1026,1]}', 280, '127.0.0.1', NULL, '2023-06-30 15:38:41');
INSERT INTO `sys_log` VALUES (7, 'admin', '删除维修', 'com.villege.modules.controller.sys.MaintenanceController.del()', '[10]', 4, '127.0.0.1', NULL, '2023-06-30 15:42:24');
INSERT INTO `sys_log` VALUES (8, 'admin', '删除维修', 'com.villege.modules.controller.sys.MaintenanceController.del()', '[8]', 3, '127.0.0.1', NULL, '2023-06-30 15:42:33');
INSERT INTO `sys_log` VALUES (9, 'admin', '添加维修', 'com.villege.modules.controller.sys.MaintenanceController.add()', '{\"mainId\":11,\"content\":\"1栋楼道照明灯不亮\",\"creator\":\"小张\",\"createTime\":\"Jun 8, 2023 12:00:00 AM\",\"state\":1,\"dealMoney\":0.0,\"dealPerson\":\"\",\"dealResult\":\"\"}', 10, '127.0.0.1', NULL, '2023-06-30 15:47:48');
INSERT INTO `sys_log` VALUES (10, 'admin', '编辑维修', 'com.villege.modules.controller.sys.MaintenanceController.edit()', '{\"mainId\":11,\"content\":\"1栋楼道照明灯不亮\",\"creator\":\"小张\",\"createTime\":\"Jun 8, 2023 12:00:00 AM\",\"state\":3,\"dealMoney\":10.0,\"dealPerson\":\"李师傅\",\"dealResult\":\"灯泡烧毁，已更换灯泡。\",\"dealTime\":\"Jun 8, 2023 12:00:00 AM\"}', 11, '127.0.0.1', NULL, '2023-06-30 15:49:26');
INSERT INTO `sys_log` VALUES (11, 'admin', '删除维修', 'com.villege.modules.controller.sys.MaintenanceController.del()', '[7]', 4, '127.0.0.1', NULL, '2023-06-30 15:49:40');
INSERT INTO `sys_log` VALUES (12, 'admin', '编辑维修', 'com.villege.modules.controller.sys.MaintenanceController.edit()', '{\"mainId\":9,\"content\":\"2栋电梯报警\",\"creator\":\"小张\",\"createTime\":\"Dec 29, 2021 12:00:00 AM\",\"state\":2,\"dealMoney\":0.0,\"dealPerson\":\"\",\"dealResult\":\"正在类型电梯公司\\n\"}', 5, '127.0.0.1', NULL, '2023-06-30 15:51:11');
INSERT INTO `sys_log` VALUES (13, 'admin', '编辑维修', 'com.villege.modules.controller.sys.MaintenanceController.edit()', '{\"mainId\":9,\"content\":\"2栋电梯报警\",\"creator\":\"小张\",\"createTime\":\"Dec 29, 2021 12:00:00 AM\",\"state\":2,\"dealMoney\":0.0,\"dealPerson\":\"\",\"dealResult\":\"正在联系电梯公司\\n\"}', 21, '127.0.0.1', NULL, '2023-06-30 17:50:14');
INSERT INTO `sys_log` VALUES (14, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1136,\"parentId\":0,\"name\":\"投诉管理\",\"path\":\"complain\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":7,\"hidden\":\"false\",\"component\":\"\"}', 87, '127.0.0.1', NULL, '2023-07-01 16:57:13');
INSERT INTO `sys_log` VALUES (15, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1137,\"parentId\":1136,\"name\":\"投诉管理\",\"path\":\"complain\",\"menuType\":2,\"perms\":\"sys:complain:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"sys/complain/index\"}', 4, '127.0.0.1', NULL, '2023-07-01 16:57:57');
INSERT INTO `sys_log` VALUES (16, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1138,\"parentId\":1137,\"name\":\"新增\",\"path\":\"\",\"menuType\":3,\"perms\":\"sys:complain:add\",\"icon\":\"\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-07-01 16:58:24');
INSERT INTO `sys_log` VALUES (17, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1139,\"parentId\":1137,\"name\":\"处理\",\"path\":\"\",\"menuType\":3,\"perms\":\"sys:complain:info\",\"icon\":\"\",\"isFrame\":0,\"status\":0,\"sort\":2,\"hidden\":\"false\",\"component\":\"\"}', 6, '127.0.0.1', NULL, '2023-07-01 16:58:42');
INSERT INTO `sys_log` VALUES (18, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1140,\"parentId\":1137,\"name\":\"删除\",\"path\":\"\",\"menuType\":3,\"perms\":\"sys:complain:del\",\"icon\":\"\",\"isFrame\":0,\"status\":0,\"sort\":3,\"hidden\":\"false\",\"component\":\"\"}', 4, '127.0.0.1', NULL, '2023-07-01 16:58:58');
INSERT INTO `sys_log` VALUES (19, 'admin', '编辑角色', 'com.villege.modules.controller.sys.SysRoleController.edit()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"type\":1,\"remark\":\"具有所有权限的操作\",\"menuIdList\":[1030,100,1004,1001,1002,1003,1112,1113,1120,1119,1094,1037,1041,1042,1043,1108,1109,1110,1111,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1104,1036,1038,1039,1040,1118,1091,1114,1115,1116,1107,1117,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,102,1009,1010,1011,1012,101,1005,1006,1007,1008,106,1025,1026,1]}', 361, '127.0.0.1', NULL, '2023-07-01 16:59:15');
INSERT INTO `sys_log` VALUES (20, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1120,\"parentId\":0,\"name\":\"小区地图\",\"path\":\"mapmgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"\"}', 18, '127.0.0.1', NULL, '2023-07-01 17:00:04');
INSERT INTO `sys_log` VALUES (21, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1094,\"parentId\":0,\"name\":\"小区管理\",\"path\":\"community\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"\"}', 4, '127.0.0.1', NULL, '2023-07-01 17:00:19');
INSERT INTO `sys_log` VALUES (22, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1121,\"parentId\":0,\"name\":\"房屋管理\",\"path\":\"house\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":2,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-07-01 17:00:38');
INSERT INTO `sys_log` VALUES (23, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1120,\"parentId\":0,\"name\":\"小区地图\",\"path\":\"mapmgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":2,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-07-01 17:00:54');
INSERT INTO `sys_log` VALUES (24, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1121,\"parentId\":0,\"name\":\"房屋管理\",\"path\":\"house\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":3,\"hidden\":\"false\",\"component\":\"\"}', 7, '127.0.0.1', NULL, '2023-07-01 17:01:06');
INSERT INTO `sys_log` VALUES (25, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1131,\"parentId\":0,\"name\":\"维修管理\",\"path\":\"maintenance\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":8,\"hidden\":\"false\",\"component\":\"\"}', 7, '127.0.0.1', NULL, '2023-07-01 17:01:50');
INSERT INTO `sys_log` VALUES (26, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1136,\"parentId\":0,\"name\":\"投诉管理\",\"path\":\"complain\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":9,\"hidden\":\"false\",\"component\":\"\"}', 4, '127.0.0.1', NULL, '2023-07-01 17:02:04');
INSERT INTO `sys_log` VALUES (27, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1030,\"parentId\":0,\"name\":\"账户管理\",\"path\":\"agentmgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":10,\"hidden\":\"false\",\"component\":\"\"}', 6, '127.0.0.1', NULL, '2023-07-01 17:02:22');
INSERT INTO `sys_log` VALUES (28, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1,\"parentId\":0,\"name\":\"系统管理\",\"path\":\"sys\",\"menuType\":1,\"perms\":\"\",\"icon\":\"cog\",\"isFrame\":0,\"status\":0,\"sort\":18,\"hidden\":\"false\",\"component\":\"\"}', 10, '127.0.0.1', NULL, '2023-07-01 17:03:04');
INSERT INTO `sys_log` VALUES (29, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1030,\"parentId\":0,\"name\":\"账户管理\",\"path\":\"agentmgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":11,\"hidden\":\"false\",\"component\":\"\"}', 4, '127.0.0.1', NULL, '2023-07-01 17:03:52');
INSERT INTO `sys_log` VALUES (30, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1136,\"parentId\":0,\"name\":\"投诉管理\",\"path\":\"complain\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":10,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-07-01 17:03:57');
INSERT INTO `sys_log` VALUES (31, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1131,\"parentId\":0,\"name\":\"维修管理\",\"path\":\"maintenance\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":9,\"hidden\":\"false\",\"component\":\"\"}', 6, '127.0.0.1', NULL, '2023-07-01 17:04:02');
INSERT INTO `sys_log` VALUES (32, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1107,\"parentId\":0,\"name\":\"出入记录\",\"path\":\"inMgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":8,\"hidden\":\"false\",\"component\":\"\"}', 7, '127.0.0.1', NULL, '2023-07-01 17:04:09');
INSERT INTO `sys_log` VALUES (33, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1118,\"parentId\":0,\"name\":\"访客登记\",\"path\":\"manualMgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":8,\"hidden\":\"false\",\"component\":\"\"}', 21, '127.0.0.1', NULL, '2023-07-01 17:04:18');
INSERT INTO `sys_log` VALUES (34, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1107,\"parentId\":0,\"name\":\"出入记录\",\"path\":\"inMgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":7,\"hidden\":\"false\",\"component\":\"\"}', 4, '127.0.0.1', NULL, '2023-07-01 17:04:25');
INSERT INTO `sys_log` VALUES (35, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1104,\"parentId\":0,\"name\":\"居民管理\",\"path\":\"personmgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"address-card\",\"isFrame\":0,\"status\":0,\"sort\":6,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-07-01 17:04:32');
INSERT INTO `sys_log` VALUES (36, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1127,\"parentId\":0,\"name\":\"物业缴费\",\"path\":\"finance\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":5,\"hidden\":\"false\",\"component\":\"\"}', 5, '127.0.0.1', NULL, '2023-07-01 17:04:39');
INSERT INTO `sys_log` VALUES (37, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1121,\"parentId\":0,\"name\":\"房屋管理\",\"path\":\"house\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":4,\"hidden\":\"false\",\"component\":\"\"}', 4, '127.0.0.1', NULL, '2023-07-01 17:04:44');
INSERT INTO `sys_log` VALUES (38, 'admin', '删除维修', 'com.villege.modules.controller.sys.ComplainController.del()', '[null]', 8, '127.0.0.1', NULL, '2023-07-01 17:05:05');
INSERT INTO `sys_log` VALUES (39, 'admin', '删除维修', 'com.villege.modules.controller.sys.ComplainController.del()', '[null]', 3, '127.0.0.1', NULL, '2023-07-01 17:05:09');
INSERT INTO `sys_log` VALUES (40, 'admin', '删除维修', 'com.villege.modules.controller.sys.ComplainController.del()', '[null,null]', 2, '127.0.0.1', NULL, '2023-07-01 17:05:57');
INSERT INTO `sys_log` VALUES (41, 'admin', '删除维修', 'com.villege.modules.controller.sys.ComplainController.del()', '[10,7]', 4, '127.0.0.1', NULL, '2023-07-01 17:06:04');
INSERT INTO `sys_log` VALUES (42, 'admin', '删除维修', 'com.villege.modules.controller.sys.ComplainController.del()', '[8]', 7, '127.0.0.1', NULL, '2023-07-01 17:12:04');
INSERT INTO `sys_log` VALUES (43, 'admin', '编辑维修', 'com.villege.modules.controller.sys.ComplainController.edit()', '{\"complainId\":9,\"title\":\"门前垃圾太多\",\"content\":\"门前垃圾太多，长时间未处理\\n\",\"creator\":\"李四\",\"createTime\":\"Jul 1, 2023 12:00:00 AM\",\"state\":1,\"dealPerson\":\"\",\"dealResult\":\"\"}', 10, '127.0.0.1', NULL, '2023-07-01 17:12:35');
INSERT INTO `sys_log` VALUES (44, 'admin', '编辑维修', 'com.villege.modules.controller.sys.ComplainController.edit()', '{\"complainId\":9,\"title\":\"门前垃圾太多\",\"content\":\"门前垃圾太多，长时间未处理\\n\",\"creator\":\"李四\",\"createTime\":\"Jul 1, 2023 12:00:00 AM\",\"state\":3,\"dealPerson\":\"张阿姨\",\"dealResult\":\"已清理垃圾，并打扫干净。\\n\",\"dealTime\":\"Jul 1, 2023 12:00:00 AM\"}', 5, '127.0.0.1', NULL, '2023-07-01 17:15:03');
INSERT INTO `sys_log` VALUES (45, 'admin', '添加维修', 'com.villege.modules.controller.sys.ComplainController.add()', '{\"complainId\":11,\"title\":\"噪声扰民\",\"content\":\"3栋805装修太吵，影响孩子信息\",\"creator\":\"小丽\",\"createTime\":\"Jul 2, 2023 12:00:00 AM\",\"state\":1,\"dealPerson\":\"\",\"dealResult\":\"\"}', 9, '127.0.0.1', NULL, '2023-07-01 17:16:23');
INSERT INTO `sys_log` VALUES (46, 'admin', '编辑维修', 'com.villege.modules.controller.sys.ComplainController.edit()', '{\"complainId\":11,\"title\":\"噪声扰民\",\"content\":\"3栋805装修太吵，影响孩子信息\",\"creator\":\"小丽\",\"createTime\":\"Jul 2, 2023 12:00:00 AM\",\"state\":3,\"dealPerson\":\"丽丽\",\"dealResult\":\"与业主沟通协调，要求其休息时间不能装修。\\n\",\"dealTime\":\"Jul 2, 2023 12:00:00 AM\"}', 5, '127.0.0.1', NULL, '2023-07-01 17:17:16');
INSERT INTO `sys_log` VALUES (47, 'admin', '编辑缴费', 'com.villege.modules.controller.sys.FinanceController.edit()', '[{\"financeId\":9,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":10,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":11,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0}]', 25, '127.0.0.1', NULL, '2023-07-02 09:40:18');
INSERT INTO `sys_log` VALUES (48, 'admin', '编辑缴费', 'com.villege.modules.controller.sys.FinanceController.edit()', '[{\"financeId\":13,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":15,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":16,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0}]', 24, '127.0.0.1', NULL, '2023-07-02 09:40:55');
INSERT INTO `sys_log` VALUES (49, 'admin', '编辑缴费', 'com.villege.modules.controller.sys.FinanceController.edit()', '[{\"financeId\":17,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":19,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":20,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0}]', 21, '127.0.0.1', NULL, '2023-07-02 09:41:13');
INSERT INTO `sys_log` VALUES (50, 'admin', '编辑缴费', 'com.villege.modules.controller.sys.FinanceController.edit()', '[{\"financeId\":46,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":58,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":47,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":59,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":48,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":61,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":1,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0}]', 33, '127.0.0.1', NULL, '2023-07-02 10:58:59');
INSERT INTO `sys_log` VALUES (51, 'admin', '编辑缴费', 'com.villege.modules.controller.sys.FinanceController.edit()', '[{\"financeId\":50,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":2,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":39,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":2,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":51,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":2,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":52,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":2,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":41,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":2,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":53,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":2,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0}]', 30, '127.0.0.1', NULL, '2023-07-02 10:59:25');
INSERT INTO `sys_log` VALUES (52, 'admin', '编辑缴费', 'com.villege.modules.controller.sys.FinanceController.edit()', '[{\"financeId\":42,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":3,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":54,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":3,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":44,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":3,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":56,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":3,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":45,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":3,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0},{\"financeId\":57,\"houseId\":0,\"houseMoney\":0.0,\"carMoney\":0.0,\"liftMoney\":0.0,\"wasteMoney\":0.0,\"totalMoney\":0.0,\"state\":0,\"paidType\":3,\"paidDate\":\"Jul 2, 2023 12:00:00 AM\",\"operator\":\"管理员\",\"remark\":\"\",\"area\":0.0}]', 28, '127.0.0.1', NULL, '2023-07-02 10:59:44');
INSERT INTO `sys_log` VALUES (53, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1127,\"parentId\":0,\"name\":\"收费管理\",\"path\":\"finance\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":5,\"hidden\":\"false\",\"component\":\"\"}', 81, '127.0.0.1', NULL, '2023-07-02 17:17:17');
INSERT INTO `sys_log` VALUES (54, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1112,\"parentId\":0,\"name\":\"门禁管理\",\"path\":\"inOutMgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":3,\"hidden\":\"false\",\"component\":\"\"}', 3, '127.0.0.1', NULL, '2023-07-02 17:19:56');
INSERT INTO `sys_log` VALUES (55, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1091,\"parentId\":1112,\"name\":\"访客登记\",\"path\":\"manual\",\"menuType\":2,\"perms\":\"sys:manual:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":8,\"hidden\":\"false\",\"component\":\"sys/manual/index\"}', 6, '127.0.0.1', NULL, '2023-07-02 17:20:21');
INSERT INTO `sys_log` VALUES (56, 'admin', '删除菜单', 'com.villege.modules.controller.sys.SysMenuController.del()', '[1118]', 10, '127.0.0.1', NULL, '2023-07-02 17:20:31');
INSERT INTO `sys_log` VALUES (57, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1137,\"parentId\":1136,\"name\":\"业主投诉\",\"path\":\"complain\",\"menuType\":2,\"perms\":\"sys:complain:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"sys/complain/index\"}', 4, '127.0.0.1', NULL, '2023-07-02 17:21:54');
INSERT INTO `sys_log` VALUES (58, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1030,\"parentId\":0,\"name\":\"账户管理\",\"path\":\"agentmgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":12,\"hidden\":\"false\",\"component\":\"\"}', 32, '127.0.0.1', NULL, '2023-07-03 15:59:41');
INSERT INTO `sys_log` VALUES (59, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1141,\"parentId\":0,\"name\":\"系统报表\",\"path\":\"report\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":12,\"hidden\":\"false\",\"component\":\"\"}', 21, '127.0.0.1', NULL, '2023-07-03 16:00:16');
INSERT INTO `sys_log` VALUES (60, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1142,\"parentId\":1141,\"name\":\"物业明细报表\",\"path\":\"reportm\",\"menuType\":2,\"perms\":\"sys:finance:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"sys/reportm/index\"}', 7, '127.0.0.1', NULL, '2023-07-03 16:01:50');
INSERT INTO `sys_log` VALUES (61, 'admin', '编辑角色', 'com.villege.modules.controller.sys.SysRoleController.edit()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"type\":1,\"remark\":\"具有所有权限的操作\",\"menuIdList\":[1094,1037,1041,1042,1043,1108,1109,1110,1111,1120,1119,1112,1113,1091,1114,1115,1116,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1104,1036,1038,1039,1040,1107,1117,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1030,100,1004,1001,1002,1003,1141,1142,102,1009,1010,1011,1012,101,1005,1006,1007,1008,106,1025,1026,1]}', 244, '127.0.0.1', NULL, '2023-07-03 16:02:01');
INSERT INTO `sys_log` VALUES (62, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1030,\"parentId\":0,\"name\":\"账户管理\",\"path\":\"agentmgr\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":12,\"hidden\":\"false\",\"component\":\"\"}', 3, '127.0.0.1', NULL, '2023-07-03 16:02:52');
INSERT INTO `sys_log` VALUES (63, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1141,\"parentId\":0,\"name\":\"系统报表\",\"path\":\"report\",\"menuType\":1,\"perms\":\"\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":11,\"hidden\":\"false\",\"component\":\"\"}', 4, '127.0.0.1', NULL, '2023-07-03 16:02:56');
INSERT INTO `sys_log` VALUES (64, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1142,\"parentId\":1141,\"name\":\"物业明细报表\",\"path\":\"reportm\",\"menuType\":2,\"perms\":\"sys:finance:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"sys/reportm/index\"}', 4, '127.0.0.1', NULL, '2023-07-03 16:05:22');
INSERT INTO `sys_log` VALUES (65, 'admin', '添加菜单', 'com.villege.modules.controller.sys.SysMenuController.add()', '{\"id\":1143,\"parentId\":1141,\"name\":\"物业费统计表\",\"path\":\"reports\",\"menuType\":2,\"perms\":\"sys:finance:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":2,\"hidden\":\"false\",\"component\":\"sys/reports/index\"}', 90, '127.0.0.1', NULL, '2023-07-04 11:51:24');
INSERT INTO `sys_log` VALUES (66, 'admin', '编辑菜单', 'com.villege.modules.controller.sys.SysMenuController.edit()', '{\"id\":1142,\"parentId\":1141,\"name\":\"物业费明细表\",\"path\":\"reportm\",\"menuType\":2,\"perms\":\"sys:finance:list\",\"icon\":\"user\",\"isFrame\":0,\"status\":0,\"sort\":1,\"hidden\":\"false\",\"component\":\"sys/reportm/index\"}', 23, '127.0.0.1', NULL, '2023-07-04 11:51:47');
INSERT INTO `sys_log` VALUES (67, 'admin', '编辑角色', 'com.villege.modules.controller.sys.SysRoleController.edit()', '{\"roleId\":1,\"roleName\":\"超级管理员\",\"type\":1,\"remark\":\"具有所有权限的操作\",\"menuIdList\":[1094,1037,1041,1042,1043,1108,1109,1110,1111,1120,1119,1112,1113,1091,1114,1115,1116,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1104,1036,1038,1039,1040,1107,1117,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1030,100,1004,1001,1002,1003,102,1009,1010,1011,1012,101,1005,1006,1007,1008,106,1025,1026,1]}', 278, '127.0.0.1', NULL, '2023-07-04 11:52:06');
INSERT INTO `sys_log` VALUES (68, 'admin', '添加人员', 'com.villege.modules.controller.sys.PersonInfoController.add()', '{\"personId\":117,\"communityId\":11,\"termName\":\"8栋\",\"houseNo\":\"802\",\"userName\":\"赖国荣\",\"sex\":\"男\",\"mobile\":\"15374363882\",\"faceUrl\":\"\",\"personType\":\"常住居民\",\"state\":1,\"creater\":\"admin\",\"createrTime\":\"Jul 4, 2023 4:02:22 PM\",\"remark\":\"\"}', 28, '127.0.0.1', NULL, '2023-07-04 16:02:23');
INSERT INTO `sys_log` VALUES (69, 'admin', '添加人员进出信息', 'com.villege.modules.controller.sys.InOutRecordController.add()', '{\"inOutRecordId\":13,\"communityId\":11,\"personId\":117,\"inTime\":\"Jul 4, 2023 4:03:28 PM\",\"inPic\":\"http://localhost:8888/villegePic/face/2049212b-c38d-4032-82f8-9dadbdd3f399.png\",\"extName\":\"png\",\"fileBase64\":\"\"}', 2296, '127.0.0.1', NULL, '2023-07-04 16:03:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `component` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `menu_type` tinyint(1) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权 多个用逗号分隔，如：user:list,user:create)',
  `is_frame` tinyint(1) NULL DEFAULT NULL COMMENT '是否为外链（0不是  1是）',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除 0未删除   1已删除',
  `hidden` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隐藏菜单（0不隐藏 1隐藏）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'sys', '', 1, 0, '', 0, 'cog', 8, 0, 'false');
INSERT INTO `sys_menu` VALUES (100, 1030, '管理员管理', 'user', 'sys/user/index', 2, 0, 'sys:user:list', 0, 'user', 3, 0, 'false');
INSERT INTO `sys_menu` VALUES (101, 1, '角色管理', 'role', 'sys/role/index', 2, 0, 'sys:role:list', 0, 'users', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (102, 1, '菜单管理', 'menu', 'sys/menu/index', 2, 0, 'sys:menu:list', 0, 'icon-menu', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (106, 1, '日志管理', 'log', 'sys/log/index', 2, 0, 'sys:log:list', 0, 'bug', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (115, 1030, '合作单位管理', 'agent', 'sys/agent/index', 2, 0, 'sys:agent:list', 0, 'user', 5, 0, 'false');
INSERT INTO `sys_menu` VALUES (1001, 100, '添加用户', '', NULL, 3, 0, 'sys:user:add', 0, NULL, 15, 0, 'false');
INSERT INTO `sys_menu` VALUES (1002, 100, '编辑用户', '', NULL, 3, 0, 'sys:user:edit', 0, NULL, 16, 0, 'false');
INSERT INTO `sys_menu` VALUES (1003, 100, '删除用户', '', NULL, 3, 0, 'sys:user:del', 0, NULL, 17, 0, 'false');
INSERT INTO `sys_menu` VALUES (1004, 100, '用户信息', '', NULL, 3, 0, 'sys:user:info', 0, '', 8, 0, 'false');
INSERT INTO `sys_menu` VALUES (1005, 101, '添加角色', NULL, NULL, 3, 0, 'sys:role:add', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1006, 101, '编辑角色', NULL, NULL, 3, 0, 'sys:role:edit', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1007, 101, '删除角色', NULL, NULL, 3, 0, 'sys:role:del', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1008, 101, '角色信息', NULL, NULL, 3, 0, 'sys:role:info', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1009, 102, '添加菜单', NULL, NULL, 3, 0, 'sys:menu:add', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1010, 102, '编辑菜单', NULL, NULL, 3, 0, 'sys:menu:edit', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1011, 102, '删除菜单', NULL, NULL, 3, 0, 'sys:menu:del', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1012, 102, '菜单信息', NULL, NULL, 3, 0, 'sys:menu:info', 0, NULL, 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1025, 106, '日志列表', '', NULL, 3, 0, 'sys:log:list', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1026, 106, '删除日志', '', '', 3, 0, 'sys:log:del', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1027, 115, '添加', '', '', 3, 0, 'sys:agent:add', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1028, 115, '编辑', '', '', 3, 0, 'sys:agent:info', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1029, 115, '删除', '', '', 3, 0, 'sys:agent:del', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1030, 0, '账户管理', 'agentmgr', '', 1, 0, '', 0, 'user', 2, 0, 'false');
INSERT INTO `sys_menu` VALUES (1031, 1106, '缴费记录', 'pay', 'sys/pay/index', 2, 0, 'sys:pay:list', 0, 'user', 6, 0, 'false');
INSERT INTO `sys_menu` VALUES (1032, 1031, '新增', '', 'sys/agent/index', 3, 0, 'sys:pay:add', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1033, 1031, '编辑', '', 'sys/agent/index', 3, 0, 'sys:pay:info', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1034, 1031, '删除', '', 'sys/agent/index', 3, 0, 'sys:pay:del', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1036, 1104, '车辆管理', 'car', 'sys/car/index', 2, 0, 'sys:car:list', 0, 'user', 2, 0, 'false');
INSERT INTO `sys_menu` VALUES (1037, 1094, '停车场管理', 'group', 'sys/group/index', 2, 0, 'sys:park:list', 0, 'user', 1, 0, 'false');
INSERT INTO `sys_menu` VALUES (1038, 1036, '新增', '', '', 3, 0, 'sys:car:add', 0, '', 1, 0, 'false');
INSERT INTO `sys_menu` VALUES (1039, 1036, '编辑', '', '', 3, 0, 'sys:car:info', 0, '', 2, 0, 'false');
INSERT INTO `sys_menu` VALUES (1040, 1036, '删除', '', '', 3, 0, 'sys:car:del', 0, '', 3, 0, 'false');
INSERT INTO `sys_menu` VALUES (1041, 1037, '新增', '', '', 3, 0, 'sys:park:add', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1042, 1037, '编辑', '', '', 3, 0, 'sys:park:info', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1043, 1037, '删除', '', '', 3, 0, 'sys:park:del', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1059, 1057, '添加', '', '', 3, 0, 'sys:content:add', 0, '', 2, 0, 'false');
INSERT INTO `sys_menu` VALUES (1060, 1057, '编辑', '', '', 3, 0, 'sys:content:info', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1061, 1057, '删除', '', '', 3, 0, 'sys:content:del', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1072, 1071, '新增', '', 'sys/library/index', 3, 0, 'sys:exampolicy:add', 0, '', 1, 0, 'false');
INSERT INTO `sys_menu` VALUES (1073, 1071, '编辑', '', 'sys/library/index', 3, 0, 'sys:exampolicy:info', 0, '', 2, 0, 'false');
INSERT INTO `sys_menu` VALUES (1074, 1071, '删除', '', 'sys/library/index', 3, 0, 'sys:exampolicy:del', 0, '', 3, 0, 'false');
INSERT INTO `sys_menu` VALUES (1076, 1075, '添加', '', '', 3, 0, 'sys:exampolicydetail:add', 0, '', 1, 0, 'true');
INSERT INTO `sys_menu` VALUES (1077, 1075, '编辑', '', '', 3, 0, 'sys:exampolicydetail:info', 0, '', 2, 0, 'true');
INSERT INTO `sys_menu` VALUES (1078, 1075, '删除', '', '', 3, 0, 'sys:exampolicydetail:del', 0, '', 3, 0, 'true');
INSERT INTO `sys_menu` VALUES (1091, 1107, '停车记录', 'consume', 'sys/consume/index', 2, 0, 'sys:consume:list', 0, 'user', 8, 0, 'false');
INSERT INTO `sys_menu` VALUES (1094, 0, '停车场管理', 'park', '', 1, 0, '', 0, 'user', 4, 0, 'false');
INSERT INTO `sys_menu` VALUES (1096, 1, '系统设置', 'server', 'sys/liveServer/index', 2, 0, 'sys:server:list', 0, 'user', 10, 0, 'true');
INSERT INTO `sys_menu` VALUES (1097, 1096, '编辑', '', '', 3, 0, 'sys:server:list', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1099, 1098, '新增', '', '', 3, 0, 'sys:desc:add', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1100, 1098, '编辑', '', '', 3, 0, 'sys:desc:info', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1101, 1098, '删除', '', '', 3, 0, 'sys:desc:del', 0, '', 10, 0, 'false');
INSERT INTO `sys_menu` VALUES (1103, 1105, '单位信息', 'myInfo', 'sys/agent/myInfo', 2, 0, 'sys:agent:myInfo', 0, 'user', 5, 0, 'false');
INSERT INTO `sys_menu` VALUES (1104, 0, '车辆管理', 'carmgr', '', 1, 0, '', 0, 'address-card', 5, 0, 'false');
INSERT INTO `sys_menu` VALUES (1105, 0, '我的信息', 'myInfo', '', 1, 0, '', 0, 'icon-shouye', 1, 0, 'false');
INSERT INTO `sys_menu` VALUES (1106, 0, '财务管理', 'finance', '', 1, 0, '', 0, 'icon-editor', 6, 0, 'false');
INSERT INTO `sys_menu` VALUES (1107, 0, '停车记录', 'stop', '', 1, 0, '', 0, 'user', 7, 0, 'false');
INSERT INTO `sys_menu` VALUES (1108, 1094, '摄像头管理', 'camera', 'sys/camera/index', 2, 0, 'sys:camera:list', 0, 'icon-jiesuo', 2, 0, 'true');
INSERT INTO `sys_menu` VALUES (1109, 1108, '新增', '', 'sys/group/index', 3, 0, 'sys:camera:add', 0, '', 1, 0, 'false');
INSERT INTO `sys_menu` VALUES (1110, 1108, '编辑', '', 'sys/group/index', 3, 0, 'sys:camera:info', 0, '', 2, 0, 'false');
INSERT INTO `sys_menu` VALUES (1111, 1108, '删除', '', 'sys/group/index', 3, 0, 'sys:camera:del', 0, '', 3, 0, 'false');
INSERT INTO `sys_menu` VALUES (1112, 0, '车牌识别', 'watch', '', 1, 0, '', 0, 'user', 3, 0, 'false');
INSERT INTO `sys_menu` VALUES (1113, 1112, '车牌识别', 'ocr', 'sys/ocr/index', 2, 0, 'sys:consume:add', 0, 'user', 1, 0, 'false');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `type` int(100) NULL DEFAULT NULL COMMENT '角色类型（1超级用户，2房东用户，3普通用户）',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除 0未删除 1已删除',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '具有所有权限的操作', '2017-11-21 11:42:11', 0);
INSERT INTO `sys_role` VALUES (7, 'test', 2, 'test', '2020-12-01 19:15:29', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 115);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1008);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1025);
INSERT INTO `sys_role_menu` VALUES (1, 1026);
INSERT INTO `sys_role_menu` VALUES (1, 1027);
INSERT INTO `sys_role_menu` VALUES (1, 1028);
INSERT INTO `sys_role_menu` VALUES (1, 1029);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1031);
INSERT INTO `sys_role_menu` VALUES (1, 1032);
INSERT INTO `sys_role_menu` VALUES (1, 1033);
INSERT INTO `sys_role_menu` VALUES (1, 1034);
INSERT INTO `sys_role_menu` VALUES (1, 1036);
INSERT INTO `sys_role_menu` VALUES (1, 1037);
INSERT INTO `sys_role_menu` VALUES (1, 1038);
INSERT INTO `sys_role_menu` VALUES (1, 1039);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1041);
INSERT INTO `sys_role_menu` VALUES (1, 1042);
INSERT INTO `sys_role_menu` VALUES (1, 1043);
INSERT INTO `sys_role_menu` VALUES (1, 1091);
INSERT INTO `sys_role_menu` VALUES (1, 1094);
INSERT INTO `sys_role_menu` VALUES (1, 1103);
INSERT INTO `sys_role_menu` VALUES (1, 1104);
INSERT INTO `sys_role_menu` VALUES (1, 1105);
INSERT INTO `sys_role_menu` VALUES (1, 1106);
INSERT INTO `sys_role_menu` VALUES (1, 1107);
INSERT INTO `sys_role_menu` VALUES (1, 1108);
INSERT INTO `sys_role_menu` VALUES (1, 1109);
INSERT INTO `sys_role_menu` VALUES (1, 1110);
INSERT INTO `sys_role_menu` VALUES (1, 1111);
INSERT INTO `sys_role_menu` VALUES (1, 1112);
INSERT INTO `sys_role_menu` VALUES (1, 1113);
INSERT INTO `sys_role_menu` VALUES (7, 100);
INSERT INTO `sys_role_menu` VALUES (7, 1001);
INSERT INTO `sys_role_menu` VALUES (7, 1002);
INSERT INTO `sys_role_menu` VALUES (7, 1003);
INSERT INTO `sys_role_menu` VALUES (7, 1004);
INSERT INTO `sys_role_menu` VALUES (7, 1030);
INSERT INTO `sys_role_menu` VALUES (7, 1031);
INSERT INTO `sys_role_menu` VALUES (7, 1032);
INSERT INTO `sys_role_menu` VALUES (7, 1033);
INSERT INTO `sys_role_menu` VALUES (7, 1034);
INSERT INTO `sys_role_menu` VALUES (7, 1036);
INSERT INTO `sys_role_menu` VALUES (7, 1037);
INSERT INTO `sys_role_menu` VALUES (7, 1038);
INSERT INTO `sys_role_menu` VALUES (7, 1039);
INSERT INTO `sys_role_menu` VALUES (7, 1040);
INSERT INTO `sys_role_menu` VALUES (7, 1041);
INSERT INTO `sys_role_menu` VALUES (7, 1042);
INSERT INTO `sys_role_menu` VALUES (7, 1043);
INSERT INTO `sys_role_menu` VALUES (7, 1091);
INSERT INTO `sys_role_menu` VALUES (7, 1094);
INSERT INTO `sys_role_menu` VALUES (7, 1103);
INSERT INTO `sys_role_menu` VALUES (7, 1104);
INSERT INTO `sys_role_menu` VALUES (7, 1105);
INSERT INTO `sys_role_menu` VALUES (7, 1106);
INSERT INTO `sys_role_menu` VALUES (7, 1107);
INSERT INTO `sys_role_menu` VALUES (7, 1112);
INSERT INTO `sys_role_menu` VALUES (7, 1113);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_type` int(11) NOT NULL COMMENT '管理员类别',
  `agent_id` int(11) NULL DEFAULT NULL COMMENT '单位ID(房东ID)',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态  0正常   1禁用',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 1, '管理员', '', '15679711120', 1);
INSERT INTO `sys_user` VALUES (16, 'lgr', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 2, 2, 'lgr', '', '15374363882', 1);
INSERT INTO `sys_user` VALUES (20, 'test', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 2, 1, '张三', '', '13888888888', 1);
INSERT INTO `sys_user` VALUES (21, 'aa_admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 2, 3, '张师傅', '张师傅', '133333333333', 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (15, 1);
INSERT INTO `sys_user_role` VALUES (16, 7);
INSERT INTO `sys_user_role` VALUES (17, 1);
INSERT INTO `sys_user_role` VALUES (18, 1);
INSERT INTO `sys_user_role` VALUES (20, 7);
INSERT INTO `sys_user_role` VALUES (21, 7);

SET FOREIGN_KEY_CHECKS = 1;
