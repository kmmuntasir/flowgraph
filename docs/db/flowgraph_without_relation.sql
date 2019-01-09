/*
Navicat MySQL Data Transfer

Source Server         : lampp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : habijabi

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-09 18:31:55
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
  KEY `graph_FK_1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graph
-- ----------------------------
INSERT INTO `graph` VALUES ('1', 'Larger between two numbers', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-200 -200\"},\n{\"category\":\"io\", \"text\":\"Read X, Y\", \"key\":-4, \"loc\":\"-200 -130\"},\n{\"category\":\"condition\", \"text\":\"X > Y\", \"key\":-5, \"loc\":\"-200 -40\"},\n{\"category\":\"comment\", \"text\":\"A flowchart for comparing\\ntwo numbers to find out which is larger\", \"key\":-6, \"loc\":\"-30 -180\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-200 120\"},\n{\"category\":\"io\", \"text\":\"Print X\", \"key\":-9, \"loc\":\"-400 40\"},\n{\"category\":\"io\", \"text\":\"Print Y\", \"key\":-10, \"loc\":\"-20 40\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-200,-175.23282552319904,-200,-165.23282552319904,-200,-161.19805338659953,-200,-161.19805338659953,-200,-157.16328125,-200,-147.16328125]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-200,-112.83671875000002,-200,-102.83671875000002,-200,-93.331640625,-200,-93.331640625,-200,-83.8265625,-200,-73.8265625]},\n{\"from\":-5, \"to\":-9, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-256.078125,-39.99999999999999,-266.078125,-39.99999999999999,-400,-39.99999999999999,-400,-13.581640624999995,-400,12.836718750000003,-400,22.836718750000003]},\n{\"from\":-5, \"to\":-10, \"fromPort\":\"R\", \"toPort\":\"T\", \"visible\":true, \"points\":[-143.921875,-39.99999999999999,-133.921875,-39.99999999999999,-20,-39.99999999999999,-20,-13.581640624999997,-20,12.83671875,-20,22.83671875], \"text\":\"No\"},\n{\"from\":-10, \"to\":-8, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-20,57.16328125,-20,67.16328125,-20,120,-92.91806216572607,120,-165.83612433145214,120,-175.83612433145214,120]},\n{\"from\":-9, \"to\":-8, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-400,57.163281250000004,-400,67.16328125000001,-400,120,-317.08193783427396,120,-234.1638756685479,120,-224.1638756685479,120]}\n ]}', '9c09e40c5f.jpeg', '2019-01-07 01:52:33', '');
INSERT INTO `graph` VALUES ('2', 'All numbers from 1 to N', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-150 -200\"},\n{\"category\":\"io\", \"text\":\"Input N\", \"key\":-4, \"loc\":\"-150 -80\"},\n{\"category\":\"step\", \"text\":\"k := 1\", \"key\":-3, \"loc\":\"-150 -140\"},\n{\"category\":\"condition\", \"text\":\"k <= N ?\", \"key\":-5, \"loc\":\"-150 20\"},\n{\"category\":\"step\", \"text\":\"Print k\", \"key\":-6, \"loc\":\"-10 120\"},\n{\"category\":\"step\", \"text\":\"k := k + 1\", \"key\":-7, \"loc\":\"110 120\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-340 180\"},\n{\"category\":\"comment\", \"text\":\"A flowchart for printing all the natural numbers starting from 1 to N\", \"key\":-9, \"loc\":\"40 -70\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-175.23282552319904,-150,-165.23282552319904,-150,-165.23282552319904,-150,-167.16328125,-150,-167.16328125,-150,-157.16328125]},\n{\"from\":-3, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-122.83671875000002,-150,-112.83671875000002,-150,-110.00000000000001,-150,-110.00000000000001,-150,-107.16328125000001,-150,-97.16328125000001]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-62.83671874999999,-150,-52.83671874999999,-150,-38.331640625,-149.99999999999997,-38.331640625,-149.99999999999997,-23.826562500000005,-149.99999999999997,-13.826562500000005]},\n{\"from\":-5, \"to\":-6, \"fromPort\":\"B\", \"toPort\":\"L\", \"visible\":true, \"points\":[-149.99999999999997,53.826562499999994,-149.99999999999997,63.826562499999994,-149.99999999999997,120,-101.69726562499999,120,-53.39453125,120,-43.39453125,120]},\n{\"from\":-6, \"to\":-7, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[23.39453125,120,33.39453125,120,45.32421874999998,120,45.32421874999998,119.99999999999997,57.25390624999996,119.99999999999997,67.25390624999996,119.99999999999997]},\n{\"from\":-7, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"R\", \"points\":[152.74609375,120,162.74609375,120,162.74609375,19.999999999999996,50.748046875000014,19.999999999999996,-61.24999999999997,19.999999999999996,-71.24999999999997,19.999999999999996]},\n{\"from\":-5, \"to\":-8, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-228.74999999999997,19.999999999999996,-238.74999999999997,19.999999999999996,-340,19.999999999999996,-340,82.91806216572606,-340,145.8361243314521,-340,155.8361243314521], \"text\":\"No\"}\n ]}', 'cc15d69608.jpeg', '2019-01-07 03:01:05', '');
INSERT INTO `graph` VALUES ('3', 'Sum of all numbers from 1 to N', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-150 -200\"},\n{\"category\":\"io\", \"text\":\"Input N\", \"key\":-4, \"loc\":\"-150 -80\"},\n{\"category\":\"step\", \"text\":\"k := 1, sum := 0\", \"key\":-3, \"loc\":\"-150 -140\"},\n{\"category\":\"condition\", \"text\":\"k <= N ?\", \"key\":-5, \"loc\":\"-150 20\"},\n{\"category\":\"step\", \"text\":\"sum := sum + k\", \"key\":-6, \"loc\":\"-10 120\"},\n{\"category\":\"step\", \"text\":\"k := k + 1\", \"key\":-7, \"loc\":\"160 120\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-340 180\"},\n{\"category\":\"comment\", \"text\":\"A flowchart for printing the sum of all the natural numbers starting from 1 to N\", \"key\":-9, \"loc\":\"40 -80\"},\n{\"category\":\"step\", \"text\":\"Display sum\", \"key\":-10, \"loc\":\"-340 100\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-175.23282552319904,-150,-165.23282552319904,-150,-165.23282552319904,-150,-167.16328125000004,-150,-167.16328125000004,-150,-157.16328125000004]},\n{\"from\":-3, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-122.83671875000005,-150,-112.83671875000005,-150,-110.00000000000003,-150,-110.00000000000003,-150,-107.16328125,-150,-97.16328125]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-62.83671874999999,-150,-52.83671874999999,-150,-38.331640625,-150.00000000000003,-38.331640625,-150.00000000000003,-23.826562500000005,-150.00000000000003,-13.826562500000005]},\n{\"from\":-5, \"to\":-6, \"fromPort\":\"B\", \"toPort\":\"L\", \"visible\":true, \"points\":[-150,53.8265625,-150,63.8265625,-150,120.00000000000003,-118.373046875,120.00000000000003,-86.74609375000001,120.00000000000003,-76.74609375000001,120.00000000000003]},\n{\"from\":-6, \"to\":-7, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[56.74609375,120,66.74609375,120,86.99999999999994,120,86.99999999999994,120.00000000000006,107.25390624999987,120.00000000000006,117.25390624999987,120.00000000000006]},\n{\"from\":-7, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"R\", \"points\":[202.7460937499999,120.00000000000006,212.7460937499999,120.00000000000006,212.7460937499999,20,75.74804687499994,20,-61.25,20,-71.25,20]},\n{\"from\":-5, \"to\":-10, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-228.75000000000003,19.999999999999996,-238.75000000000003,19.999999999999996,-340,19.999999999999996,-340,46.418359375,-340,72.83671875,-340,82.83671875], \"text\":\"No\"},\n{\"from\":-10, \"to\":-8, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-340,117.16328125000001,-340,127.16328125000001,-340,136.49970279072608,-340,136.49970279072608,-340,145.8361243314521,-340,155.8361243314521]}\n ]}', '174b616a2d.jpeg', '2019-01-07 03:05:18', '');
INSERT INTO `graph` VALUES ('4', 'Grading System Flowchart', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-510 -140\"},\n{\"category\":\"io\", \"text\":\"Get m\", \"key\":-4, \"loc\":\"-240 -270\"},\n{\"category\":\"condition\", \"text\":\"m < 0\", \"key\":-5, \"loc\":\"-240 -180\"},\n{\"category\":\"comment\", \"text\":\"Here, m is Mark for a specific subject\", \"key\":-6, \"loc\":\"-60 -270\"},\n{\"category\":\"condition\", \"text\":\"m < 33\", \"key\":-7, \"loc\":\"-70 -180\"},\n{\"category\":\"condition\", \"text\":\"m < 40\", \"key\":-8, \"loc\":\"110 -180\"},\n{\"category\":\"condition\", \"text\":\"m < 50\", \"key\":-9, \"loc\":\"290 -180\"},\n{\"category\":\"condition\", \"text\":\"m < 60\", \"key\":-10, \"loc\":\"360 10\"},\n{\"category\":\"condition\", \"text\":\"m < 70\", \"key\":-11, \"loc\":\"190 10\"},\n{\"category\":\"condition\", \"text\":\"m < 80\", \"key\":-12, \"loc\":\"10 10\"},\n{\"category\":\"condition\", \"text\":\"m <= 100\", \"key\":-13, \"loc\":\"-220 10\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-21, \"loc\":\"-620 -50\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Invalid Input\\\"\", \"key\":-23, \"loc\":\"-310 -90\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade F\\\"\", \"key\":-24, \"loc\":\"-70 -90\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade D\\\"\", \"key\":-25, \"loc\":\"110 -90\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade C\\\"\", \"key\":-26, \"loc\":\"290 -90\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade B\\\"\", \"key\":-27, \"loc\":\"390 100\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade A-\\\"\", \"key\":-28, \"loc\":\"190 100\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade A\\\"\", \"key\":-29, \"loc\":\"10 100\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Invalid Input\\\"\", \"key\":-30, \"loc\":\"-440 100\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade A+\\\"\", \"key\":-31, \"loc\":\"-220 100\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[-485.23282552319915,-140,-475.23282552319915,-140,-382.0363346365996,-140,-382.0363346365996,-270,-288.83984375,-270,-278.83984375,-270]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-240,-252.83671875000005,-240,-242.83671875000005,-240,-233.331640625,-240,-233.331640625,-240,-223.82656249999997,-240,-213.82656249999997]},\n{\"from\":-5, \"to\":-7, \"fromPort\":\"R\", \"toPort\":\"L\", \"visible\":true, \"points\":[-182.140625,-179.99999999999997,-172.140625,-179.99999999999997,-159.44921874999994,-179.99999999999997,-159.44921874999994,-179.99999999999997,-146.75781249999991,-179.99999999999997,-136.75781249999991,-179.99999999999997], \"text\":\"No\"},\n{\"from\":-7, \"to\":-8, \"fromPort\":\"R\", \"toPort\":\"L\", \"visible\":true, \"points\":[-3.2421874999999147,-179.99999999999997,6.757812500000085,-179.99999999999997,20.000000000000043,-179.99999999999997,20.000000000000043,-179.99999999999997,33.2421875,-179.99999999999997,43.2421875,-179.99999999999997], \"text\":\"No\"},\n{\"from\":-8, \"to\":-9, \"fromPort\":\"R\", \"toPort\":\"L\", \"visible\":true, \"points\":[176.7578125,-179.99999999999997,186.7578125,-179.99999999999997,200.00000000000006,-179.99999999999997,200.00000000000006,-179.99999999999997,213.24218750000014,-179.99999999999997,223.24218750000014,-179.99999999999997], \"text\":\"No\"},\n{\"from\":-9, \"to\":-10, \"fromPort\":\"R\", \"toPort\":\"R\", \"visible\":true, \"points\":[356.7578125000001,-179.99999999999997,366.7578125000001,-179.99999999999997,436.75781249999994,-179.99999999999997,436.75781249999994,-85,436.75781249999994,9.999999999999972,426.75781249999994,9.999999999999972], \"text\":\"No\"},\n{\"from\":-10, \"to\":-11, \"fromPort\":\"L\", \"toPort\":\"R\", \"visible\":true, \"points\":[293.24218749999994,9.999999999999972,283.24218749999994,9.999999999999972,275,9.999999999999972,275,9.999999999999972,266.7578125,9.999999999999972,256.7578125,9.999999999999972], \"text\":\"No\"},\n{\"from\":-11, \"to\":-12, \"fromPort\":\"L\", \"toPort\":\"R\", \"visible\":true, \"points\":[123.2421875,9.999999999999972,113.2421875,9.999999999999972,100.00000000000001,9.999999999999972,100.00000000000001,9.999999999999972,86.75781250000003,9.999999999999972,76.75781250000003,9.999999999999972], \"text\":\"No\"},\n{\"from\":-12, \"to\":-13, \"fromPort\":\"L\", \"toPort\":\"R\", \"visible\":true, \"points\":[-56.75781249999997,9.999999999999972,-66.75781249999997,9.999999999999972,-95.87890625000007,9.999999999999972,-95.87890625000007,9.999999999999972,-125.00000000000017,9.999999999999972,-135.00000000000017,9.999999999999972], \"text\":\"No\"},\n{\"from\":-5, \"to\":-23, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-240,-146.17343749999998,-240,-136.17343749999998,-240,-126.668359375,-310,-126.668359375,-310,-117.16328125000001,-310,-107.16328125000001]},\n{\"from\":-23, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-310,-72.83671875000002,-310,-62.83671875000002,-310,-49.999999999999986,-447.9180621657261,-49.999999999999986,-585.8361243314522,-49.999999999999986,-595.8361243314522,-49.999999999999986]},\n{\"from\":-7, \"to\":-24, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-70,-146.17343749999998,-70,-136.17343749999998,-70,-126.668359375,-70,-126.668359375,-70,-117.16328125000001,-70,-107.16328125000001]},\n{\"from\":-24, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-70,-72.83671875000002,-70,-62.83671875000002,-70,-49.999999999999986,-327.9180621657261,-49.999999999999986,-585.8361243314522,-49.999999999999986,-595.8361243314522,-49.999999999999986]},\n{\"from\":-8, \"to\":-25, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[110,-146.17343749999998,110,-136.17343749999998,110,-126.668359375,110,-126.668359375,110,-117.16328125000001,110,-107.16328125000001]},\n{\"from\":-25, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[110,-72.83671875000002,110,-62.83671875000002,110,-49.999999999999986,-237.9180621657261,-49.999999999999986,-585.8361243314522,-49.999999999999986,-595.8361243314522,-49.999999999999986]},\n{\"from\":-9, \"to\":-26, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[290,-146.17343749999998,290,-136.17343749999998,290,-126.668359375,290,-126.668359375,290,-117.16328125000001,290,-107.16328125000001]},\n{\"from\":-26, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[290,-72.83671875000002,290,-62.83671875000002,290,-49.999999999999986,-147.9180621657261,-49.999999999999986,-585.8361243314522,-49.999999999999986,-595.8361243314522,-49.999999999999986]},\n{\"from\":-10, \"to\":-27, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[360,43.8265625,360,53.8265625,360,63.33164062499999,390,63.33164062499999,390,72.83671874999999,390,82.83671874999999]},\n{\"from\":-27, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[390,117.16328124999998,390,127.16328124999998,-654.1638756685479,127.16328124999998,-654.1638756685479,38.581640625,-654.1638756685479,-49.999999999999986,-644.1638756685479,-49.999999999999986]},\n{\"from\":-11, \"to\":-28, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[190,43.8265625,190,53.8265625,190,63.33164062499999,190,63.33164062499999,190,72.83671874999999,190,82.83671874999999]},\n{\"from\":-28, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[190,117.16328124999998,190,127.16328124999998,-654.1638756685479,127.16328124999998,-654.1638756685479,38.581640625,-654.1638756685479,-49.999999999999986,-644.1638756685479,-49.999999999999986]},\n{\"from\":-12, \"to\":-29, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[10,43.8265625,10,53.8265625,10,63.33164062499999,10,63.33164062499999,10,72.83671874999999,10,82.83671874999999]},\n{\"from\":-29, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[10,117.16328124999998,10,127.16328124999998,-654.1638756685479,127.16328124999998,-654.1638756685479,38.581640625,-654.1638756685479,-49.999999999999986,-644.1638756685479,-49.999999999999986]},\n{\"from\":-13, \"to\":-31, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-220,43.8265625,-220,53.8265625,-220,63.331640625000006,-220,63.331640625000006,-220,72.83671875,-220,82.83671875]},\n{\"from\":-13, \"to\":-30, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-305,10,-315,10,-439.25,10,-439.25,41.418359374999994,-440,41.418359374999994,-440,72.83671874999999,-440,82.83671874999999], \"text\":\"No\"},\n{\"from\":-30, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-440,117.16328124999998,-440,127.16328124999998,-654.1638756685479,127.16328124999998,-654.1638756685479,38.581640625,-654.1638756685479,-49.999999999999986,-644.1638756685479,-49.999999999999986]},\n{\"from\":-31, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-220,117.16328125000001,-220,127.16328125000001,-654.1638756685479,127.16328125000001,-654.1638756685479,38.581640625000006,-654.1638756685479,-50,-644.1638756685479,-50]}\n ]}', '33c2d732b7.jpeg', '2019-01-07 03:17:40', '');
INSERT INTO `graph` VALUES ('5', 'Axis Test Graph', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-300 -100\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-7, \"loc\":\"-200 0\"},\n{\"category\":\"start\", \"text\":\"Start\", \"key\":-3, \"loc\":\"-410 40\"},\n{\"category\":\"start\", \"text\":\"Start\", \"key\":-4, \"loc\":\"-520 -200\"},\n{\"category\":\"start\", \"text\":\"Start\", \"key\":-5, \"loc\":\"-170 -180\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-6, \"loc\":\"-410 -100\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-360 -250\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-9, \"loc\":\"-80 100\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-4, \"to\":-6, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-520,-175.23282552319904,-520,-165.23282552319904,-520,-100,-482.08193783427396,-100,-444.16387566854786,-100,-434.16387566854786,-100]},\n{\"from\":-2, \"to\":-8, \"fromPort\":\"L\", \"toPort\":\"R\", \"points\":[-324.76717447680096,-100,-334.76717447680096,-100,-334.76717447680096,-175.30164940412652,-325.8361243314521,-175.30164940412652,-325.8361243314521,-249.99999999999997,-335.8361243314521,-249.99999999999997]},\n{\"from\":-5, \"to\":-7, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-170,-155.23282552319904,-170,-145.23282552319904,-170,-89.69835059587345,-200,-89.69835059587345,-200,-34.163875668547874,-200,-24.163875668547877]},\n{\"from\":-3, \"to\":-9, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-410,64.76717447680096,-410,74.76717447680096,-410,100,-262.08193783427396,100,-114.16387566854787,100,-104.16387566854787,100]}\n ]}', '6bb86d4783.jpeg', '2019-01-09 02:11:03', '');

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
