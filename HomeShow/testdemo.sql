/*
        6Premium Data Transfer

 Source Server         : localhost3305
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3305
 Source Schema         : testdemo

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 21/12/2019 10:17:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_images
-- ----------------------------
DROP TABLE IF EXISTS `t_images`;
CREATE TABLE `t_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_images
-- ----------------------------
INSERT INTO `t_images` VALUES (1, 'img/basketball.png', 'jxjj');
INSERT INTO `t_images` VALUES (2, 'img/work/1.jpg', 'jxjj');
INSERT INTO `t_images` VALUES (3, 'img/work/6.jpg', 'jxjj');
INSERT INTO `t_images` VALUES (4, 'img/work/6.jpg', 'jxjj');
INSERT INTO `t_images` VALUES (5, 'img/work/6.jpg', 'jxjj');
INSERT INTO `t_images` VALUES (6, 'img/work/6.jpg', 'jxjj');
INSERT INTO `t_images` VALUES (7, 'img/work/6.jpg', 'jxjj');

-- ----------------------------
-- Table structure for t_profile
-- ----------------------------
DROP TABLE IF EXISTS `t_profile`;
CREATE TABLE `t_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_profile
-- ----------------------------
INSERT INTO `t_profile` VALUES (1, 'jxjj', '这是一大段从数据库取的内容');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '123456');

SET FOREIGN_KEY_CHECKS = 1;
