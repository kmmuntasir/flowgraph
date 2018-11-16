/*
Navicat MySQL Data Transfer

Source Server         : lampp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : flowgraph

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-16 23:46:24
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graph
-- ----------------------------
INSERT INTO `graph` VALUES ('1', 'Calculate Sum of first N Numbers', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-328.36769434585153 49.93570098876944\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"key\":-2, \"loc\":\"-60 190\"},\n{\"text\":\"Sum = 0, i = 1\", \"key\":-3, \"loc\":\"130 220\"},\n{\"text\":\"Input N\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"key\":-4, \"loc\":\"130 140\"},\n{\"text\":\"i <= N\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"key\":-5, \"loc\":\"130 310\"},\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"key\":-7, \"loc\":\"300 420\"},\n{\"text\":\"i = i+1\", \"key\":-8, \"loc\":\"-50 310\"},\n{\"text\":\"Sum = Sum + i\", \"key\":-9, \"loc\":\"130 450\"},\n{\"text\":\"No\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"key\":-10, \"loc\":\"210 280\"},\n{\"text\":\"Yes\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"key\":-11, \"loc\":\"100 360\"},\n{\"text\":\"Print Sum\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-12, \"loc\":\"300 310\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-60,227.4642475926599,-60,237.4642475926599,32.091376726017444,237.4642475926599,32.091376726017444,113.06429901123047,130,113.06429901123047,130,123.06429901123047]},\n{\"from\":-4, \"to\":-3, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[130.00000000000006,156.93570098876955,130.00000000000006,166.93570098876955,130.00000000000006,180,129.99999999999983,180,129.99999999999983,193.06429901123042,129.99999999999983,203.06429901123042]},\n{\"from\":-3, \"to\":-5, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[129.99999999999983,236.9357009887695,129.99999999999983,246.9357009887695,129.99999999999983,257.0321495056153,130,257.0321495056153,130,267.12859802246106,130,277.12859802246106]},\n{\"from\":-5, \"to\":-9, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[130,342.8714019775392,130,352.8714019775392,130,387.9678504943849,130,387.9678504943849,130,423.06429901123056,130,433.06429901123056]},\n{\"from\":-9, \"to\":-8, \"fromPort\":\"L\", \"toPort\":\"L\", \"points\":[69.316650390625,450.0000000000001,59.316650390625,450.0000000000001,-90.26586914062503,450.0000000000001,-90.26586914062503,379.9999999999999,-90.26586914062503,309.9999999999997,-80.26586914062503,309.9999999999997]},\n{\"from\":-8, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[-19.73413085937503,309.9999999999997,-9.734130859375028,309.9999999999997,26.205688476562486,309.9999999999997,26.205688476562486,310.0000000000001,62.1455078125,310.0000000000001,72.1455078125,310.0000000000001]},\n{\"from\":-5, \"to\":-12, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[187.8544921875,310,197.8544921875,310,216.79711151123047,310,216.79711151123047,310,235.73973083496094,310,245.73973083496094,310]},\n{\"from\":-12, \"to\":-7, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[300,326.9357009887695,300,336.9357009887695,300,356.85953722221905,300.00000000000006,356.85953722221905,300.00000000000006,376.78337345566865,300.00000000000006,386.78337345566865]}\n ]}', '13ccef41a4.jpeg', '2018-11-13 02:56:36', '');
INSERT INTO `graph` VALUES ('2', 'Calculate 2', '1', '{ \"class\": \"go.GraphLinksModel\",\r\n  \"linkFromPortIdProperty\": \"fromPort\",\r\n  \"linkToPortIdProperty\": \"toPort\",\r\n  \"modelData\": {\"position\":\"60 6\"},\r\n  \"nodeDataArray\": [ \r\n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"390 60\"},\r\n{\"text\":\"Input N\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"390 160\"},\r\n{\"text\":\"Sum = 0, i=1\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"390 230\"},\r\n{\"text\":\"i <= N\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"390 330\"},\r\n{\"text\":\"Sum = Sum+i\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-6, \"loc\":\"390 480\"},\r\n{\"text\":\"i=i+1\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-7, \"loc\":\"220 330\"},\r\n{\"text\":\"Print Sum\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-8, \"loc\":\"590 330\"},\r\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-9, \"loc\":\"590 450\"},\r\n{\"text\":\"No\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-10, \"loc\":\"470 310\"},\r\n{\"text\":\"Yes\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-11, \"loc\":\"360 380\"}\r\n ],\r\n  \"linkDataArray\": [ \r\n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,96.89508145354515,390,106.89508145354515,390,119.97969023238781,390,119.97969023238781,390,133.06429901123047,390,143.06429901123047]},\r\n{\"from\":-4, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,176.93570098876955,390,186.93570098876955,390,195,390,195,390,203.06429901123047,390,213.06429901123047]},\r\n{\"from\":-3, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,246.93570098876955,390,256.93570098876955,390,272.0321495056153,390,272.0321495056153,390,287.12859802246095,390,297.12859802246095]},\r\n{\"from\":-5, \"to\":-6, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[390,362.8714019775391,390,372.8714019775391,390,412.9678504943848,390,412.9678504943848,390,453.06429901123045,390,463.06429901123045]},\r\n{\"from\":-6, \"to\":-7, \"fromPort\":\"L\", \"toPort\":\"L\", \"points\":[334.57303619384766,480,324.57303619384766,480,184.29344940185547,480,184.29344940185547,405,184.29344940185547,330,194.29344940185547,330]},\r\n{\"from\":-7, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[245.70655059814453,330,255.70655059814453,330,289.3941535949707,330,289.3941535949707,330,323.0817565917969,330,333.0817565917969,330]},\r\n{\"from\":-5, \"to\":-8, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[446.9182434082031,330,456.9182434082031,330,496.65501403808594,330,496.65501403808594,330,536.3917846679688,330,546.3917846679688,330]},\r\n{\"from\":-8, \"to\":-9, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[590,346.9357009887695,590,356.9357009887695,590,382.095449633931,590,382.095449633931,590,407.2551982790925,590,417.2551982790925]}\r\n ]}', 'iepjakslaqpdk.jpeg', '2018-11-13 03:29:08', '');
INSERT INTO `graph` VALUES ('3', 'Hello Graph', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Input/Output\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"390 270\"},\n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"560 170\"},\n{\"text\":\"Comment\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-6, \"loc\":\"680 380\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-6, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[560,206.89508145354517,560,216.89508145354517,560,284.97969023238784,680,284.97969023238784,680,353.06429901123045,680,363.06429901123045]},\n{\"from\":-2, \"to\":-4, \"fromPort\":\"L\", \"toPort\":\"T\", \"points\":[523.1049185464549,170,513.1049185464549,170,390,170,390,206.53214950561522,390,243.06429901123047,390,253.06429901123047]}\n ]}', '4928c8eb2e.jpeg', '2018-11-14 21:19:24', '');
INSERT INTO `graph` VALUES ('5', 'Hi Graph', '2', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Input/Output\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"390 270\"},\n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"560 170\"},\n{\"text\":\"Comment\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-6, \"loc\":\"680 380\"},\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-7, \"loc\":\"510 420\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"930 200\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-6, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[560,206.89508145354517,560,216.89508145354517,560,284.97969023238784,680,284.97969023238784,680,353.06429901123045,680,363.06429901123045]},\n{\"from\":-2, \"to\":-4, \"fromPort\":\"L\", \"toPort\":\"T\", \"points\":[523.1049185464549,170,513.1049185464549,170,390,170,390,206.53214950561522,390,243.06429901123047,390,253.06429901123047]},\n{\"from\":-2, \"to\":-7, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[560,206.89508145354517,560,216.89508145354517,560,297.07513986631886,510,297.07513986631886,510,377.2551982790925,510,387.2551982790925]},\n{\"from\":-2, \"to\":-3, \"fromPort\":\"\", \"toPort\":\"L\", \"points\":[597.46424759266,170,607.46424759266,170,751.2921289843182,170,751.2921289843182,200,895.1200103759766,200,905.1200103759766,200]}\n ]}', '77ddadc29c.jpeg', '2018-11-14 21:21:46', '');
INSERT INTO `graph` VALUES ('6', 'Haha Graph', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-31 -39.89508145354512\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"460 50\"},\n{\"text\":\"Input/Output\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"250 170\"},\n{\"text\":\"Condition\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"650 170\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"650 300\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-6, \"loc\":\"930 170\"},\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-7, \"loc\":\"1000 400\"},\n{\"text\":\"Comment\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-8, \"loc\":\"600 230\"},\n{\"text\":\"Comment\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-9, \"loc\":\"790 150\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"L\", \"toPort\":\"T\", \"points\":[423.1049185464548,50,413.1049185464548,50,250,50,250,96.53214950561524,250,143.06429901123047,250,153.06429901123047]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[315.9385738372803,170,325.9385738372803,170,440.2832975387573,170,440.2832975387573,170,554.6280212402344,170,564.6280212402344,170]},\n{\"from\":-5, \"to\":-6, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[735.3719787597656,170,745.3719787597656,170,820.2459945678711,170,820.2459945678711,169.99999999999997,895.1200103759766,169.99999999999997,905.1200103759766,169.99999999999997]},\n{\"from\":-5, \"to\":-3, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[650,202.87140197753908,650,212.87140197753908,650,242.96785049438478,650,242.96785049438478,650,273.06429901123045,650,283.06429901123045]},\n{\"from\":-3, \"to\":-7, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[650,316.9357009887695,650,326.9357009887695,650,400,803.6275991395462,400,957.2551982790925,400,967.2551982790925,400]},\n{\"from\":-6, \"to\":-7, \"fromPort\":\"R\", \"toPort\":\"T\", \"points\":[954.8799896240234,169.99999999999997,964.8799896240234,169.99999999999997,1000,169.99999999999997,1000,263.62759913954625,1000,357.2551982790925,1000,367.2551982790925]}\n ]}', 'ff601a5dc6.jpeg', '2018-11-14 21:24:12', '');
INSERT INTO `graph` VALUES ('7', 'asdfasdfasdfsd', '2', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Condition\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"210 330\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"470 260\"}\n ],\n  \"linkDataArray\": []}', '0b00bdac39.jpeg', '2018-11-14 21:32:23', '');
INSERT INTO `graph` VALUES ('8', 'Hudai', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-35 43\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"470 130\"},\n{\"text\":\"Input/Output\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"430 260\"},\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-7, \"loc\":\"460 390\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"620 260\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[470,166.89508145354517,470,176.89508145354517,470,204.97969023238784,430,204.97969023238784,430,233.06429901123047,430,243.06429901123047]},\n{\"from\":-4, \"to\":-3, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[495.9385738372803,260,505.9385738372803,260,545.5292921066284,260,545.5292921066284,260,585.1200103759766,260,595.1200103759766,260]},\n{\"from\":-3, \"to\":-7, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[620,276.93570098876955,620,286.93570098876955,620,390,561.3724008604538,390,502.74480172090756,390,492.74480172090756,390]}\n ]}', '1ff3ce5f9f.jpeg', '2018-11-14 21:34:46', '');
INSERT INTO `graph` VALUES ('9', 'Another Hudai', '2', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-35 43\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"570 130\"},\n{\"text\":\"Input/Output\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"430 260\"},\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-7, \"loc\":\"460 390\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"620 260\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[533.1049185464549,130,523.1049185464549,130,430,130,430,181.53214950561522,430,233.06429901123047,430,243.06429901123047]},\n{\"from\":-4, \"to\":-3, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[495.9385738372803,260,505.9385738372803,260,545.5292921066284,260,545.5292921066284,260,585.1200103759766,260,595.1200103759766,260]},\n{\"from\":-3, \"to\":-7, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[620,276.93570098876955,620,286.93570098876955,620,390,561.3724008604538,390,502.74480172090756,390,492.74480172090756,390]}\n ]}', '6c0e114b02.jpeg', '2018-11-14 21:35:02', '');
INSERT INTO `graph` VALUES ('10', 'আজগুবি গ্রাফ', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Input/Output\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"550 270\"},\n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"550 350\"},\n{\"text\":\"Comment\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-6, \"loc\":\"720 330\"},\n{\"text\":\"Condition\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"770 270\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"770 380\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-7, \"loc\":\"660 130\"},\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-8, \"loc\":\"440 350\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-4, \"to\":-2, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[550,286.93570098876955,550,296.93570098876955,550,300.0203097676122,550,300.0203097676122,550,303.1049185464549,550,313.1049185464549]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"\", \"toPort\":\"L\", \"points\":[609.4447164535522,270,619.4447164535522,270,619.4447164535522,270,619.4447164535522,270,674.6280212402344,270,684.6280212402344,270]},\n{\"from\":-5, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[770,302.8714019775391,770,312.8714019775391,770,332.9678504943848,770,332.9678504943848,770,353.06429901123045,770,363.06429901123045]},\n{\"from\":-5, \"to\":-7, \"fromPort\":\"\", \"toPort\":\"\", \"points\":[770,237.12859802246095,770,227.12859802246095,770,192.03214950561522,660,192.03214950561522,660,156.9357009887695,660,146.9357009887695]},\n{\"from\":-7, \"to\":-8, \"fromPort\":\"L\", \"toPort\":\"T\", \"points\":[635.1200103759766,129.99999999999997,625.1200103759766,129.99999999999997,440,129.99999999999997,440,218.62759913954625,440,307.2551982790925,440,317.2551982790925]},\n{\"from\":-3, \"to\":-8, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[770,396.9357009887695,770,406.9357009887695,770,406.9357009887695,500,406.9357009887695,500,350,482.74480172090756,350,472.74480172090756,350]}\n ]}', '436fd4564b.jpeg', '2018-11-14 22:42:38', '');
INSERT INTO `graph` VALUES ('11', 'আবোল তাবোল', '1', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"340 160\"},\n{\"text\":\"Condition\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"540 230\"},\n{\"text\":\"Step\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"500 340\"},\n{\"text\":\"Stop\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-7, \"loc\":\"580 400\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"T\", \"points\":[376.8950814535451,160,386.8950814535451,160,540,160,540,173.56429901123047,540,187.12859802246095,540,197.12859802246095]},\n{\"from\":-5, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[540,262.8714019775391,540,272.8714019775391,540,292.9678504943848,500,292.9678504943848,500,313.06429901123045,500,323.06429901123045]},\n{\"from\":-3, \"to\":-7, \"fromPort\":\"\", \"toPort\":\"L\", \"points\":[500,356.9357009887695,500,366.9357009887695,500,400,516.8541086773539,400,533.7082173547079,400,543.7082173547079,400]}\n ]}', 'e7f8adf1b7.jpeg', '2018-11-14 23:37:34', '');
INSERT INTO `graph` VALUES ('12', 'New Graph', '2', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"360 230\"},\n{\"text\":\"Condition\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"580 360\"}\n ],\n  \"linkDataArray\": []}', 'ae36bebaf8.jpeg', '2018-11-15 11:09:37', '');
INSERT INTO `graph` VALUES ('13', 'hhaa', '2', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"540 230\"},\n{\"text\":\"Condition\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"540 120\"}\n ],\n  \"linkDataArray\": []}', '4d0610a8dc.jpeg', '2018-11-15 11:37:09', '');
INSERT INTO `graph` VALUES ('14', 'Hello Graph 2', '2', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-5 -5\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Input/Output\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"390 270\"},\n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"640 160\"},\n{\"text\":\"Comment\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-6, \"loc\":\"680 380\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-6, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[640.0000000000002,197.46424759266003,640.0000000000002,207.46424759266003,640.0000000000002,280.26427330194525,680,280.26427330194525,680,353.06429901123045,680,363.06429901123045]},\n{\"from\":-2, \"to\":-4, \"fromPort\":\"L\", \"toPort\":\"T\", \"points\":[602.5357524073404,160.00000000000014,592.5357524073404,160.00000000000014,390,160.00000000000014,390,201.5321495056153,390,243.06429901123047,390,253.06429901123047]}\n ]}', '47169bf6ce.jpeg', '2018-11-15 11:37:38', '');
INSERT INTO `graph` VALUES ('15', 'Calculate 22', '2', '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"modelData\": {\"position\":\"-364.9636233448982 -18.064299011230503\"},\n  \"nodeDataArray\": [ \n{\"text\":\"Start\", \"figure\":\"Circle\", \"fill\":\"#00AD5F\", \"type\":\"start\", \"key\":-2, \"loc\":\"220 60\"},\n{\"text\":\"Input N\", \"figure\":\"Parallelogram1\", \"fill\":\"orange\", \"type\":\"io\", \"key\":-4, \"loc\":\"390 160\"},\n{\"text\":\"Sum = 0, i=1\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-3, \"loc\":\"390 230\"},\n{\"text\":\"i <= N\", \"figure\":\"Diamond\", \"fill\":\"lightskyblue\", \"type\":\"condition\", \"key\":-5, \"loc\":\"390 330\"},\n{\"text\":\"Sum = Sum+i\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-6, \"loc\":\"390 480\"},\n{\"text\":\"i=i+1\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-7, \"loc\":\"220 330\"},\n{\"text\":\"Print Sum\", \"figure\":\"Rectangle\", \"fill\":\"whitesmoke\", \"type\":\"step\", \"key\":-8, \"loc\":\"590 330\"},\n{\"text\":\"End\", \"figure\":\"Circle\", \"fill\":\"#CE0620\", \"type\":\"end\", \"key\":-9, \"loc\":\"590 450\"},\n{\"text\":\"No\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-10, \"loc\":\"470 310\"},\n{\"text\":\"Yes\", \"figure\":\"Rectangle\", \"fill\":\"lightyellow\", \"type\":\"comment\", \"key\":-11, \"loc\":\"360 380\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[220.00000000000028,97.46424759265989,220.00000000000028,107.46424759265989,220.00000000000028,120.26427330194518,390,120.26427330194518,390,133.06429901123047,390,143.06429901123047]},\n{\"from\":-4, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,176.93570098876955,390,186.93570098876955,390,195,390,195,390,203.06429901123047,390,213.06429901123047]},\n{\"from\":-3, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[390,246.93570098876955,390,256.93570098876955,390,272.0321495056153,390,272.0321495056153,390,287.12859802246095,390,297.12859802246095]},\n{\"from\":-5, \"to\":-6, \"fromPort\":\"\", \"toPort\":\"T\", \"points\":[390,362.8714019775391,390,372.8714019775391,390,412.9678504943848,390,412.9678504943848,390,453.06429901123045,390,463.06429901123045]},\n{\"from\":-6, \"to\":-7, \"fromPort\":\"L\", \"toPort\":\"L\", \"points\":[334.57303619384766,480,324.57303619384766,480,184.29344940185547,480,184.29344940185547,405,184.29344940185547,330,194.29344940185547,330]},\n{\"from\":-7, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[245.70655059814453,330,255.70655059814453,330,289.3941535949707,330,289.3941535949707,330,323.0817565917969,330,333.0817565917969,330]},\n{\"from\":-5, \"to\":-8, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[446.9182434082031,330,456.9182434082031,330,496.65501403808594,330,496.65501403808594,330,536.3917846679688,330,546.3917846679688,330]},\n{\"from\":-8, \"to\":-9, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[590,346.9357009887695,590,356.9357009887695,590,382.095449633931,590,382.095449633931,590,407.2551982790925,590,417.2551982790925]}\n ]}', '6e7e9d93ab.jpeg', '2018-11-15 11:39:31', '');

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
INSERT INTO `user` VALUES ('1', 'user@mail.com', '202CB962AC59075B964B07152D234B70', 'Mr. User', null, '');
INSERT INTO `user` VALUES ('2', 'user@gmail.com', '202CB962AC59075B964B07152D234B70', 'Google User', null, '');
