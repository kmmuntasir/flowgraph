/*
Navicat MySQL Data Transfer

Source Server         : lampp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : flowgraph

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-13 03:35:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(50) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_phone` varchar(20) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`admin_id`,`admin_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
  `graph_name` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `graph_json` longtext NOT NULL,
  `graph_datetime` datetime NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`graph_id`),
  KEY `graph_FK_1` (`user_id`),
  CONSTRAINT `graph_FK_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of graph
-- ----------------------------
INSERT INTO `graph` VALUES ('1', 'Calculate Sum of first N Numbers', '1', '{ \"class\": \"go.GraphLinksModel\",\r\n  \"linkFromPortIdProperty\": \"fromPort\",\r\n  \"linkToPortIdProperty\": \"toPort\",\r\n  \"modelData\": {\"position\":\"-438.3676943458516 -14.196462703545194\"},\r\n  \"nodeDataArray\": [ \r\n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"key\":-2, \"loc\":\"260 70\"},\r\n{\"text\":\"Sum = 0, i = 1\", \"key\":-3, \"loc\":\"260 240\"},\r\n{\"text\":\"Input N\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"key\":-4, \"loc\":\"260 160\"},\r\n{\"text\":\"i <= N\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"key\":-5, \"loc\":\"260 330\"},\r\n{\"text\":\"Print Sum\", \"key\":-6, \"loc\":\"420 330\"},\r\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"key\":-7, \"loc\":\"420 430\"},\r\n{\"text\":\"i = i+1\", \"key\":-8, \"loc\":\"80 330\"},\r\n{\"text\":\"Sum = Sum + i\", \"key\":-9, \"loc\":\"260 470\"},\r\n{\"text\":\"No\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"key\":-10, \"loc\":\"340 310\"},\r\n{\"text\":\"Yes\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"key\":-11, \"loc\":\"230 380\"}\r\n ],\r\n  \"linkDataArray\": [ \r\n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[260,106.89508145354515,260,116.89508145354515,260,124.97969023238781,260,124.97969023238781,260,133.06429901123047,260,143.06429901123047]},\r\n{\"from\":-4, \"to\":-3, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[260,176.93570098876955,260,186.93570098876955,260,200,260,200,260,213.06429901123047,260,223.06429901123047]},\r\n{\"from\":-3, \"to\":-5, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[260,256.93570098876955,260,266.93570098876955,260,277.0321495056153,260,277.0321495056153,260,287.12859802246095,260,297.12859802246095]},\r\n{\"from\":-5, \"to\":-6, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[316.9182434082031,330,326.9182434082031,330,346.65501403808594,330,346.65501403808594,330,366.39178466796875,330,376.39178466796875,330]},\r\n{\"from\":-6, \"to\":-7, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[420,346.9357009887695,420,356.9357009887695,420,372.095449633931,420,372.095449633931,420,387.2551982790925,420,397.2551982790925]},\r\n{\"from\":-5, \"to\":-9, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[260,362.8714019775391,260,372.8714019775391,260,407.96785049438483,259.9999999999999,407.96785049438483,259.9999999999999,443.06429901123056,259.9999999999999,453.06429901123056]},\r\n{\"from\":-9, \"to\":-8, \"fromPort\":\"L\", \"toPort\":\"L\", \"points\":[200.50106048583973,470.0000000000001,190.50106048583973,470.0000000000001,40.221473693847656,470.0000000000001,40.221473693847656,400.00000000000006,40.221473693847656,330,50.221473693847656,330]},\r\n{\"from\":-8, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[109.77852630615234,330,119.77852630615234,330,156.4301414489746,330,156.4301414489746,330,193.08175659179688,330,203.08175659179688,330]}\r\n ]}', '2018-11-13 02:56:36', '');
INSERT INTO `graph` VALUES ('2', 'Calculate 2', '1', '{ \"class\": \"go.GraphLinksModel\",\r\n  \"linkFromPortIdProperty\": \"fromPort\",\r\n  \"linkToPortIdProperty\": \"toPort\",\r\n  \"modelData\": {\"position\":\"60 6\"},\r\n  \"nodeDataArray\": [ \r\n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"390 60\"},\r\n{\"text\":\"Input N\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"390 160\"},\r\n{\"text\":\"Sum = 0, i=1\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"390 230\"},\r\n{\"text\":\"i <= N\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"390 330\"},\r\n{\"text\":\"Sum = Sum+i\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-6, \"loc\":\"390 480\"},\r\n{\"text\":\"i=i+1\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-7, \"loc\":\"220 330\"},\r\n{\"text\":\"Print Sum\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-8, \"loc\":\"590 330\"},\r\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-9, \"loc\":\"590 450\"},\r\n{\"text\":\"No\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-10, \"loc\":\"470 310\"},\r\n{\"text\":\"Yes\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-11, \"loc\":\"360 380\"}\r\n ],\r\n  \"linkDataArray\": [ \r\n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,96.89508145354515,390,106.89508145354515,390,119.97969023238781,390,119.97969023238781,390,133.06429901123047,390,143.06429901123047]},\r\n{\"from\":-4, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,176.93570098876955,390,186.93570098876955,390,195,390,195,390,203.06429901123047,390,213.06429901123047]},\r\n{\"from\":-3, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,246.93570098876955,390,256.93570098876955,390,272.0321495056153,390,272.0321495056153,390,287.12859802246095,390,297.12859802246095]},\r\n{\"from\":-5, \"to\":-6, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[390,362.8714019775391,390,372.8714019775391,390,412.9678504943848,390,412.9678504943848,390,453.06429901123045,390,463.06429901123045]},\r\n{\"from\":-6, \"to\":-7, \"fromPort\":\"L\", \"toPort\":\"L\", \"points\":[334.57303619384766,480,324.57303619384766,480,184.29344940185547,480,184.29344940185547,405,184.29344940185547,330,194.29344940185547,330]},\r\n{\"from\":-7, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[245.70655059814453,330,255.70655059814453,330,289.3941535949707,330,289.3941535949707,330,323.0817565917969,330,333.0817565917969,330]},\r\n{\"from\":-5, \"to\":-8, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[446.9182434082031,330,456.9182434082031,330,496.65501403808594,330,496.65501403808594,330,536.3917846679688,330,546.3917846679688,330]},\r\n{\"from\":-8, \"to\":-9, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[590,346.9357009887695,590,356.9357009887695,590,382.095449633931,590,382.095449633931,590,407.2551982790925,590,417.2551982790925]}\r\n ]}', '2018-11-13 03:29:08', '');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`user_id`,`user_email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user@mail.com', '202CB962AC59075B964B07152D234B70', 'Mr. User', null, '');
