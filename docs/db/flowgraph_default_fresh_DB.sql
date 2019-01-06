/*
Navicat MySQL Data Transfer

Source Server         : lampp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : flowgraph

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-07 01:46:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `admin_phone` varchar(20) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`admin_id`,`admin_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin@mail.com', '202CB962AC59075B964B07152D234B70', 'Admin', null, '');

-- ----------------------------
-- Table structure for `graph`
-- ----------------------------
DROP TABLE IF EXISTS `graph`;
CREATE TABLE `graph` (
  `graph_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `graph_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `graph_json` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `graph_thumb` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `graph_datetime` datetime NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`graph_id`),
  KEY `graph_FK_1` (`user_id`),
  CONSTRAINT `graph_FK_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graph
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`user_id`,`user_email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user_a@gmail.com', '202CB962AC59075B964B07152D234B70', 'Mr. User A', null, '');
INSERT INTO `user` VALUES ('2', 'user_b@gmail.com', '202CB962AC59075B964B07152D234B70', 'Mr. User B', null, '');
