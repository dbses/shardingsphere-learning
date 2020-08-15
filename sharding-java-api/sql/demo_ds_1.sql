/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : demo_ds_1

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 15/08/2020 12:44:01
*/
CREATE DATABASE IF NOT EXISTS `demo_ds_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_order0
-- ----------------------------
DROP TABLE IF EXISTS `t_order0`;
CREATE TABLE `t_order0`  (
  `id` int(5) NOT NULL COMMENT '订单编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order0
-- ----------------------------
INSERT INTO `t_order0` VALUES (2, '宝安沙发', 'demo_ds_1.t_order0');

-- ----------------------------
-- Table structure for t_order1
-- ----------------------------
DROP TABLE IF EXISTS `t_order1`;
CREATE TABLE `t_order1`  (
  `id` int(5) NOT NULL COMMENT '订单编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order1
-- ----------------------------
INSERT INTO `t_order1` VALUES (1, '宝安家具', 'demo_ds_1.t_order1');
INSERT INTO `t_order1` VALUES (3, '南山办公用品', 'demo_ds_1.t_order1');

-- ----------------------------
-- Table structure for t_order_item0
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item0`;
CREATE TABLE `t_order_item0`  (
  `id` int(5) NOT NULL COMMENT '主键',
  `order_id` int(5) DEFAULT NULL COMMENT '订单编号',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_item0
-- ----------------------------
INSERT INTO `t_order_item0` VALUES (1, 1, '油烟机', 'demo_ds_1.t_order_item0');
INSERT INTO `t_order_item0` VALUES (2, 1, '锅', 'demo_ds_1.t_order_item0');
INSERT INTO `t_order_item0` VALUES (3, 3, '笔', 'demo_ds_1.t_order_item0');
INSERT INTO `t_order_item0` VALUES (4, 3, '电脑', 'demo_ds_1.t_order_item0');

-- ----------------------------
-- Table structure for t_order_item1
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item1`;
CREATE TABLE `t_order_item1`  (
  `id` int(5) NOT NULL COMMENT '主键',
  `order_id` int(5) DEFAULT NULL COMMENT '订单编号',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_item1
-- ----------------------------
INSERT INTO `t_order_item1` VALUES (1, 1, '油烟机', 'demo_ds_1.t_order_item1');
INSERT INTO `t_order_item1` VALUES (2, 1, '锅', 'demo_ds_1.t_order_item1');
INSERT INTO `t_order_item1` VALUES (3, 3, '笔', 'demo_ds_1.t_order_item1');
INSERT INTO `t_order_item1` VALUES (4, 3, '电脑', 'demo_ds_1.t_order_item1');

SET FOREIGN_KEY_CHECKS = 1;
