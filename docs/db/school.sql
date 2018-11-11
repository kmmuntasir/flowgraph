/*
Navicat MySQL Data Transfer

Source Server         : lampp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : school

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-06 00:22:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `access`
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `access_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `access_add_date` datetime NOT NULL,
  `access_added_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `FK_access_1` (`admin_id`),
  KEY `FK_access_2` (`module_id`),
  KEY `FK_access_3` (`access_added_by`),
  CONSTRAINT `FK_access_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_access_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_access_3` FOREIGN KEY (`access_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES ('1', '2', '1', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('2', '2', '2', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('3', '2', '3', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('4', '2', '4', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('5', '2', '5', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('6', '2', '6', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('7', '2', '7', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('8', '2', '8', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('10', '2', '9', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('11', '2', '10', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('12', '2', '11', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('13', '2', '12', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('14', '2', '13', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('15', '2', '14', '2018-11-04 18:54:08', '1');
INSERT INTO `access` VALUES ('16', '2', '15', '2018-11-04 18:54:08', '1');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `admin_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_role_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `admin_add_date` datetime DEFAULT NULL,
  `admin_added_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`admin_id`,`admin_user`),
  KEY `admin_id` (`admin_id`),
  KEY `FK_admin_1` (`admin_role_id`),
  KEY `FK_admin_2` (`status_id`),
  KEY `FK_admin_3` (`admin_added_by`),
  CONSTRAINT `FK_admin_1` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_role` (`admin_role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_admin_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_admin_3` FOREIGN KEY (`admin_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '$uperadmin', '202CB962AC59075B964B07152D234B70', null, 'Super Admin', 'Address', 'Email', '0987654321', '1', '1', '2018-10-25 18:05:13', '1');
INSERT INTO `admin` VALUES ('2', 'admin', '202CB962AC59075B964B07152D234B70', null, 'Admin', 'Address', 'Email', '21654981815', '2', '1', '2018-10-25 18:05:13', '1');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `admin_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_role_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`admin_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1', 'Superadmin');
INSERT INTO `admin_role` VALUES ('2', 'Administrator');
INSERT INTO `admin_role` VALUES ('3', 'Academic Admin');
INSERT INTO `admin_role` VALUES ('4', 'Accountant');

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `bill_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `bill_amount` double NOT NULL,
  `bill_discount` double DEFAULT NULL,
  `bill_fee_month` date DEFAULT NULL,
  `bill_type_id` int(10) unsigned NOT NULL,
  `bill_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_generate_date` datetime NOT NULL,
  `bill_paid_date` datetime DEFAULT NULL,
  `bill_added_by` int(10) unsigned DEFAULT NULL,
  `bill_received_by` int(10) unsigned DEFAULT NULL,
  `bill_status_id` int(10) unsigned NOT NULL,
  `bill_to_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_to_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_receipt_sent` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`bill_id`),
  KEY `FK_bill_1` (`bill_status_id`),
  KEY `FK_bill_2` (`bill_type_id`),
  KEY `FK_bill_3` (`bill_added_by`),
  KEY `FK_bill_4` (`bill_received_by`),
  KEY `FK_bill_5` (`student_id`),
  CONSTRAINT `FK_bill_1` FOREIGN KEY (`bill_status_id`) REFERENCES `bill_status` (`bill_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bill_2` FOREIGN KEY (`bill_type_id`) REFERENCES `bill_type` (`bill_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bill_3` FOREIGN KEY (`bill_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bill_4` FOREIGN KEY (`bill_received_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bill_5` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bill
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_status`
-- ----------------------------
DROP TABLE IF EXISTS `bill_status`;
CREATE TABLE `bill_status` (
  `bill_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bill_status_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`bill_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bill_status
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_type`
-- ----------------------------
DROP TABLE IF EXISTS `bill_type`;
CREATE TABLE `bill_type` (
  `bill_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bill_type_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `bill_type_add_date` datetime NOT NULL,
  `bill_type_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`bill_type_id`),
  KEY `FK_bill_type_1` (`bill_type_added_by`),
  CONSTRAINT `FK_bill_type_1` FOREIGN KEY (`bill_type_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of bill_type
-- ----------------------------

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_batch` year(4) NOT NULL,
  `class_session` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dept_id` int(10) unsigned NOT NULL,
  `class_add_date` datetime NOT NULL,
  `class_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`class_id`,`class_title`),
  KEY `FK_class_1` (`class_added_by`),
  KEY `class_id` (`class_id`),
  KEY `FK_class_2` (`dept_id`),
  CONSTRAINT `FK_class_1` FOREIGN KEY (`class_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_class_2` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', 'CSE 22th', '2015', '2014-2015', '1', '2018-11-04 18:54:08', '1', '');
INSERT INTO `class` VALUES ('2', 'CSE 17th', '2010', '2009-2010', '1', '2018-11-04 18:54:08', '1', '');
INSERT INTO `class` VALUES ('3', 'ECE 6th', '2011', '2010-2011', '2', '2018-11-04 18:54:08', '1', '');

-- ----------------------------
-- Table structure for `class_course`
-- ----------------------------
DROP TABLE IF EXISTS `class_course`;
CREATE TABLE `class_course` (
  `class_course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `class_course_credit_count` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Will be set to 0 (false) if the course is non-credital to the students of a specific class/dept.',
  `class_course_add_date` datetime NOT NULL,
  `class_course_added_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`class_course_id`),
  KEY `FK_class_course_1` (`class_course_added_by`),
  KEY `FK_class_course_2` (`class_id`),
  KEY `FK_class_course_3` (`course_id`),
  CONSTRAINT `FK_class_course_1` FOREIGN KEY (`class_course_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_class_course_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_class_course_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of class_course
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_credit` decimal(3,2) DEFAULT '0.00',
  `course_add_date` datetime NOT NULL,
  `course_added_by` int(10) unsigned NOT NULL,
  `course_syllabus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PDF file upload',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`course_id`),
  KEY `FK_course_1` (`course_added_by`),
  CONSTRAINT `FK_course_1` FOREIGN KEY (`course_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Fundamental Computer', 'CSE-111', '3.00', '2018-11-04 18:54:08', '1', null, '');
INSERT INTO `course` VALUES ('2', 'Programming Language', 'CSE-112', '3.00', '2018-11-04 18:54:08', '1', null, '');
INSERT INTO `course` VALUES ('3', 'English', 'GED-116', '3.00', '2018-11-04 18:54:08', '1', null, '');

-- ----------------------------
-- Table structure for `cst`
-- ----------------------------
DROP TABLE IF EXISTS `cst`;
CREATE TABLE `cst` (
  `cst_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'cst = course_section_teacher',
  `course_id` int(10) unsigned NOT NULL,
  `section_id` int(10) unsigned NOT NULL,
  `teacher_id` int(10) unsigned NOT NULL,
  `cst_add_date` datetime NOT NULL,
  `cst_added_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cst_id`),
  KEY `FK_cst_1` (`cst_added_by`),
  KEY `FK_cst_2` (`teacher_id`),
  KEY `FK_cst_3` (`section_id`),
  KEY `FK_cst_4` (`course_id`),
  CONSTRAINT `FK_cst_1` FOREIGN KEY (`cst_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cst_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cst_3` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cst_4` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cst
-- ----------------------------
INSERT INTO `cst` VALUES ('1', '1', '1', '1', '2018-11-04 18:54:08', '1');
INSERT INTO `cst` VALUES ('3', '1', '2', '1', '2018-11-04 18:54:08', '1');
INSERT INTO `cst` VALUES ('4', '2', '2', '1', '2018-11-04 18:54:08', '1');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_id` int(10) unsigned NOT NULL,
  `dept_add_date` datetime NOT NULL,
  `dept_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`dept_id`),
  KEY `FK_dept_1` (`dept_added_by`),
  KEY `FK_dept_2` (`faculty_id`),
  CONSTRAINT `FK_dept_1` FOREIGN KEY (`dept_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dept_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', 'Department of Computer Science  and Engineering', '1', '2018-11-04 18:54:08', '1', '');
INSERT INTO `dept` VALUES ('2', 'Department of Electronics and Communication Engineering', '1', '2018-11-04 18:54:08', '1', '');
INSERT INTO `dept` VALUES ('3', 'Department of Business Administration', '2', '2018-11-04 18:54:08', '1', '');

-- ----------------------------
-- Table structure for `edesignation`
-- ----------------------------
DROP TABLE IF EXISTS `edesignation`;
CREATE TABLE `edesignation` (
  `edesignation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `edesignation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `edesignation_add_date` datetime NOT NULL,
  `edesignation_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`edesignation_id`),
  KEY `FK_tdesignation_1` (`edesignation_added_by`),
  CONSTRAINT `edesignation_ibfk_1` FOREIGN KEY (`edesignation_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of edesignation
-- ----------------------------
INSERT INTO `edesignation` VALUES ('1', 'Cleaner', '2018-10-25 18:05:59', '1', '');
INSERT INTO `edesignation` VALUES ('2', 'Security Guard', '2018-10-25 18:06:24', '1', '');
INSERT INTO `edesignation` VALUES ('3', 'Cook', '2018-10-25 18:05:59', '1', '');
INSERT INTO `edesignation` VALUES ('4', 'Peon', '2018-10-25 18:05:59', '1', '');
INSERT INTO `edesignation` VALUES ('5', 'Office Assistant', '2018-10-25 18:05:59', '1', '');
INSERT INTO `edesignation` VALUES ('6', 'Admission Officer', '2018-10-25 18:05:59', '1', '');
INSERT INTO `edesignation` VALUES ('7', 'Librarian', '2018-10-25 18:05:59', '1', '');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `employee_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_blood_group` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_contact_1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `employee_contact_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_dob` date NOT NULL,
  `edesignation_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `employee_add_date` datetime NOT NULL,
  `employee_added_by` int(10) unsigned NOT NULL,
  `employee_rfid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `FK_employee_1` (`edesignation_id`),
  KEY `FK_employee_2` (`status_id`),
  CONSTRAINT `FK_employee_1` FOREIGN KEY (`edesignation_id`) REFERENCES `edesignation` (`edesignation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_employee_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'bashar', '123', null, 'Bashar Mia', 'Dhaka', 'B(+ve)', '39320020202', null, 'bashar@mia.com', '2018-11-04', '5', '1', '2018-11-04 18:54:08', '1', null);
INSERT INTO `employee` VALUES ('2', 'yakub', '123', null, 'Yakub Mia', 'Dhaka', 'A(+ve)', '3939303039', null, 'yakub@mia.com', '2018-11-04', '2', '1', '2018-11-04 18:54:08', '1', null);

-- ----------------------------
-- Table structure for `employee_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `employee_attendance`;
CREATE TABLE `employee_attendance` (
  `e_att_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `e_att_time` datetime NOT NULL,
  PRIMARY KEY (`e_att_id`),
  KEY `FK_employee_attendance_1` (`employee_id`),
  CONSTRAINT `FK_employee_attendance_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of employee_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `exam_type_id` int(11) unsigned NOT NULL,
  `exam_datetime` datetime DEFAULT NULL,
  `exam_duration` smallint(6) DEFAULT NULL COMMENT 'Value will be stored in minutes',
  `exam_fullmark` double DEFAULT NULL,
  `exam_venue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cst_id` int(11) unsigned NOT NULL,
  `exam_result` longtext COLLATE utf8_unicode_ci,
  `exam_add_date` datetime NOT NULL,
  `exam_added_by_teacher` int(11) DEFAULT NULL,
  `exam_added_by_admin` int(11) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`exam_id`),
  KEY `FK_exam_1` (`cst_id`),
  KEY `FK_exam_2` (`exam_type_id`),
  CONSTRAINT `FK_exam_1` FOREIGN KEY (`cst_id`) REFERENCES `cst` (`cst_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_exam_2` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_type` (`exam_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of exam
-- ----------------------------

-- ----------------------------
-- Table structure for `exam_type`
-- ----------------------------
DROP TABLE IF EXISTS `exam_type`;
CREATE TABLE `exam_type` (
  `exam_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exam_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `exam_type_add_date` datetime NOT NULL,
  `exam_type_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`exam_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of exam_type
-- ----------------------------

-- ----------------------------
-- Table structure for `expense`
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense` (
  `expense_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expense_amount` double NOT NULL,
  `expense_type_id` int(10) unsigned NOT NULL,
  `expense_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense_add_date` datetime NOT NULL,
  `expense_added_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `FK_expense_1` (`expense_type_id`),
  KEY `FK_expense_2` (`expense_added_by`),
  CONSTRAINT `FK_expense_1` FOREIGN KEY (`expense_type_id`) REFERENCES `expense_type` (`expense_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_expense_2` FOREIGN KEY (`expense_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of expense
-- ----------------------------
INSERT INTO `expense` VALUES ('1', '120', '1', 'Guest Snacks', '2018-11-03 00:44:26', '1');

-- ----------------------------
-- Table structure for `expense_type`
-- ----------------------------
DROP TABLE IF EXISTS `expense_type`;
CREATE TABLE `expense_type` (
  `expense_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expense_type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `expense_type_add_date` datetime NOT NULL,
  `expense_type_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`expense_type_id`),
  KEY `FK_expense_type` (`expense_type_added_by`),
  CONSTRAINT `FK_expense_type` FOREIGN KEY (`expense_type_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of expense_type
-- ----------------------------
INSERT INTO `expense_type` VALUES ('1', 'Other', '2018-11-03 00:42:56', '1', '');
INSERT INTO `expense_type` VALUES ('3', 'Office Appliances', '2018-11-03 00:43:38', '1', '');

-- ----------------------------
-- Table structure for `faculty`
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_add_date` datetime NOT NULL,
  `faculty_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`faculty_id`),
  KEY `FK_faculty_1` (`faculty_added_by`),
  CONSTRAINT `FK_faculty_1` FOREIGN KEY (`faculty_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES ('1', 'Faculty of Engineering', '2018-11-04 18:54:08', '1', '');
INSERT INTO `faculty` VALUES ('2', 'Faculty of Business', '2018-11-04 18:54:08', '1', '');

-- ----------------------------
-- Table structure for `income`
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `income_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `income_method_id` int(10) unsigned NOT NULL,
  `income_created_by` int(10) unsigned DEFAULT NULL,
  `student_id` int(10) unsigned DEFAULT NULL,
  `bill_id` int(10) unsigned DEFAULT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `income_datetime` datetime NOT NULL,
  `income_amount` double NOT NULL,
  `income_gateway_trx_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `income_gateway_amount` double DEFAULT NULL,
  `income_gateway_percentage` double DEFAULT NULL,
  `income_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`income_id`),
  KEY `FK_income_1` (`income_created_by`),
  KEY `FK_income_2` (`income_method_id`),
  KEY `FK_income_3` (`student_id`),
  KEY `FK_income_4` (`bill_id`),
  CONSTRAINT `FK_income_1` FOREIGN KEY (`income_created_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_income_2` FOREIGN KEY (`income_method_id`) REFERENCES `income_method` (`income_method_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_income_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_income_4` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of income
-- ----------------------------

-- ----------------------------
-- Table structure for `income_method`
-- ----------------------------
DROP TABLE IF EXISTS `income_method`;
CREATE TABLE `income_method` (
  `income_method_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `income_method_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`income_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of income_method
-- ----------------------------

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_category_id` int(10) unsigned NOT NULL,
  `item_sale_price` double NOT NULL,
  `item_quantity` int(11) NOT NULL DEFAULT '0',
  `item_add_date` datetime NOT NULL,
  `item_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`item_id`),
  KEY `FK_item_1` (`item_category_id`),
  KEY `FK_item_2` (`item_added_by`),
  CONSTRAINT `FK_item_1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`item_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_item_2` FOREIGN KEY (`item_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', 'Olympic Pen', '2', '5', '10', '2018-11-04 18:54:08', '1', '');
INSERT INTO `item` VALUES ('2', '2B Pencil', '2', '5', '45', '2018-11-04 18:54:08', '1', '');
INSERT INTO `item` VALUES ('3', 'ScrewDriver', '1', '40', '3', '2018-11-04 18:54:08', '1', '');

-- ----------------------------
-- Table structure for `item_category`
-- ----------------------------
DROP TABLE IF EXISTS `item_category`;
CREATE TABLE `item_category` (
  `item_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item_category_add_date` datetime NOT NULL,
  `item_category_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`item_category_id`,`item_category_name`),
  KEY `item_category_id` (`item_category_id`),
  KEY `FK_item_category_1` (`item_category_added_by`),
  CONSTRAINT `FK_item_category_1` FOREIGN KEY (`item_category_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of item_category
-- ----------------------------
INSERT INTO `item_category` VALUES ('1', 'Other', '2018-11-04 18:54:08', '1', '');
INSERT INTO `item_category` VALUES ('2', 'Stationary', '2018-11-04 18:54:08', '1', '');

-- ----------------------------
-- Table structure for `lecture`
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture` (
  `lecture_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lecture_topic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lecture_date` date NOT NULL,
  `lecture_attendance` longtext COLLATE utf8_unicode_ci NOT NULL,
  `cst_id` int(10) unsigned NOT NULL,
  `lecture_add_date` datetime NOT NULL,
  `lecture_added_by` int(10) unsigned NOT NULL COMMENT 'Only teachers can add lectures+attendance',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`lecture_id`),
  KEY `FK_lecture_1` (`lecture_added_by`),
  KEY `FK_lecture_2` (`cst_id`),
  CONSTRAINT `FK_lecture_1` FOREIGN KEY (`lecture_added_by`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_lecture_2` FOREIGN KEY (`cst_id`) REFERENCES `cst` (`cst_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lecture
-- ----------------------------

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `module_controller` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `module_icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_parent` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `FK_module_1` (`module_parent`),
  CONSTRAINT `FK_module_1` FOREIGN KEY (`module_parent`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', 'Academic', 'academic', 'school', null);
INSERT INTO `module` VALUES ('2', 'Student', 'student', 'user-graduate', null);
INSERT INTO `module` VALUES ('3', 'Guardian', 'guardian', 'user-shield', null);
INSERT INTO `module` VALUES ('4', 'Teacher', 'teacher', 'user-tie', null);
INSERT INTO `module` VALUES ('5', 'Employee', 'employee', 'people-carry', null);
INSERT INTO `module` VALUES ('6', 'Accounting', 'accounting', 'file-invoice-dollar', null);
INSERT INTO `module` VALUES ('7', 'Inventory', 'inventory', 'archive', null);
INSERT INTO `module` VALUES ('8', 'Settings', 'settings', 'wrench', null);
INSERT INTO `module` VALUES ('9', 'Faculty', 'academic/faculty', 'wrench', '1');
INSERT INTO `module` VALUES ('10', 'Department', 'academic/department', 'wrench', '1');
INSERT INTO `module` VALUES ('11', 'Classes', 'academic/classes', 'wrench', '1');
INSERT INTO `module` VALUES ('12', 'Section', 'academic/section', 'wrench', '1');
INSERT INTO `module` VALUES ('13', 'Exam', 'academic/exam', 'wrench', '1');
INSERT INTO `module` VALUES ('14', 'Result', 'academic/result', 'wrench', '1');
INSERT INTO `module` VALUES ('15', 'Noticeboard', 'academic/noticeboard', 'wrench', '1');
INSERT INTO `module` VALUES ('16', 'Income', 'accounting/income', 'wrench', '6');
INSERT INTO `module` VALUES ('17', 'Expense', 'accounting/expense', 'wrench', '6');
INSERT INTO `module` VALUES ('18', 'Report', 'accounting/report', 'wrench', '6');

-- ----------------------------
-- Table structure for `purchase`
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `purchase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `purchase_quantity` int(11) NOT NULL DEFAULT '1',
  `purchase_datetime` datetime NOT NULL,
  `purchase_amount` double NOT NULL,
  `purchase_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`purchase_id`),
  KEY `FK_purchase_1` (`item_id`),
  KEY `FK_purchase_2` (`purchase_added_by`),
  CONSTRAINT `FK_purchase_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_purchase_2` FOREIGN KEY (`purchase_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchase
-- ----------------------------

-- ----------------------------
-- Table structure for `sale`
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sale_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `sale_quantity` int(11) NOT NULL DEFAULT '1',
  `sale_datetime` datetime NOT NULL,
  `sale_amount` double NOT NULL,
  `sale_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`sale_id`),
  KEY `FK_sale_1` (`item_id`),
  KEY `FK_sale_2` (`sale_added_by`),
  CONSTRAINT `FK_sale_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sale_2` FOREIGN KEY (`sale_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale
-- ----------------------------

-- ----------------------------
-- Table structure for `section`
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `section_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `section_add_date` datetime NOT NULL,
  `section_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`section_id`),
  KEY `FK_section_1` (`section_added_by`),
  KEY `FK_section_2` (`class_id`),
  CONSTRAINT `FK_section_1` FOREIGN KEY (`section_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_section_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', 'CSE-22nd-A', '1', '2018-11-04 18:54:08', '1', '');
INSERT INTO `section` VALUES ('2', 'CSE-17th-A', '2', '2018-11-04 18:54:08', '1', '');
INSERT INTO `section` VALUES ('3', 'ECE-6th-A', '3', '2018-11-04 18:54:08', '1', '');

-- ----------------------------
-- Table structure for `section_student`
-- ----------------------------
DROP TABLE IF EXISTS `section_student`;
CREATE TABLE `section_student` (
  `section_student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `section_student_add_date` datetime NOT NULL,
  `section_student_added_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`section_student_id`),
  KEY `FK_section_student_1` (`section_id`),
  KEY `FK_section_student_2` (`student_id`),
  KEY `FK_section_student_3` (`section_student_added_by`),
  CONSTRAINT `FK_section_student_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_section_student_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_section_student_3` FOREIGN KEY (`section_student_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of section_student
-- ----------------------------

-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'Active');
INSERT INTO `status` VALUES ('2', 'Deactive');
INSERT INTO `status` VALUES ('3', 'Deleted');
INSERT INTO `status` VALUES ('4', 'Retired');
INSERT INTO `status` VALUES ('5', 'Suspended');
INSERT INTO `status` VALUES ('6', 'Deceased');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `student_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_pass_guardian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_gender` tinyint(1) DEFAULT NULL,
  `student_blood_group` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_religion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_dob` date NOT NULL,
  `student_father` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_mother` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_guardian` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_contact_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_contact_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_status_id` int(10) unsigned NOT NULL,
  `section_id` int(11) unsigned DEFAULT NULL,
  `student_rfid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_add_date` datetime NOT NULL,
  `student_added_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`student_id`,`student_user`),
  KEY `FK_student_1` (`student_status_id`),
  KEY `FK_student_2` (`student_added_by`),
  KEY `student_id` (`student_id`),
  KEY `FK_student_3` (`section_id`),
  CONSTRAINT `FK_student_1` FOREIGN KEY (`student_status_id`) REFERENCES `student_status` (`student_status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_student_2` FOREIGN KEY (`student_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_student_3` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'CSE_1057', '123', '123', null, 'Munna', 'Dhaka', '1', 'B(+ve)', 'Islam', '1992-12-05', 'Dr. M. M. Nabi', 'Mamataz Begum', 'Muktadir Alam', '01516180603', null, 'kmmuntasir@gmail.com', '1', '2', null, '2018-11-04 18:54:08', '1');

-- ----------------------------
-- Table structure for `student_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `student_attendance`;
CREATE TABLE `student_attendance` (
  `st_att_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `st_att_time` datetime NOT NULL,
  PRIMARY KEY (`st_att_id`),
  KEY `FK_student_attendance_1` (`student_id`),
  CONSTRAINT `FK_student_attendance_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for `student_status`
-- ----------------------------
DROP TABLE IF EXISTS `student_status`;
CREATE TABLE `student_status` (
  `student_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_status_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`student_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student_status
-- ----------------------------
INSERT INTO `student_status` VALUES ('1', 'Active');
INSERT INTO `student_status` VALUES ('2', 'Deactive');
INSERT INTO `student_status` VALUES ('3', 'Deleted');

-- ----------------------------
-- Table structure for `tdesignation`
-- ----------------------------
DROP TABLE IF EXISTS `tdesignation`;
CREATE TABLE `tdesignation` (
  `tdesignation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tdesignation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tdesignation_add_date` datetime NOT NULL,
  `tdesignation_added_by` int(10) unsigned NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`tdesignation_id`),
  KEY `FK_tdesignation_1` (`tdesignation_added_by`),
  CONSTRAINT `FK_tdesignation_1` FOREIGN KEY (`tdesignation_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tdesignation
-- ----------------------------
INSERT INTO `tdesignation` VALUES ('1', 'Teaching Assistant', '2018-10-25 18:05:59', '1', '');
INSERT INTO `tdesignation` VALUES ('2', 'Faculty Member', '2018-10-25 18:06:24', '1', '');
INSERT INTO `tdesignation` VALUES ('3', 'Lecturer', '2018-10-25 18:05:59', '1', '');
INSERT INTO `tdesignation` VALUES ('4', 'Assistant Professor', '2018-10-25 18:05:59', '1', '');
INSERT INTO `tdesignation` VALUES ('5', 'Associate Professor', '2018-10-25 18:05:59', '1', '');
INSERT INTO `tdesignation` VALUES ('6', 'Professsor', '2018-10-25 18:05:59', '1', '');
INSERT INTO `tdesignation` VALUES ('7', 'Emeritus Professor', '2018-10-25 18:05:59', '1', '');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tdesignation_id` int(10) unsigned NOT NULL,
  `teacher_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_dob` datetime NOT NULL,
  `teacher_gender` tinyint(1) DEFAULT NULL,
  `teacher_blood_group` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_details` text COLLATE utf8_unicode_ci,
  `teacher_contact_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_contact_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) unsigned DEFAULT NULL,
  `dept_id` int(10) unsigned DEFAULT NULL,
  `teacher_added_by` int(11) unsigned NOT NULL,
  `teacher_add_date` datetime NOT NULL,
  `teacher_join_date` date NOT NULL,
  `teacher_last_working_date` date DEFAULT NULL,
  `teacher_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_rfid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`teacher_id`,`teacher_user`),
  KEY `FK_teacher_1` (`status_id`),
  KEY `FK_teacher_2` (`tdesignation_id`),
  KEY `FK_teacher_3` (`teacher_added_by`),
  KEY `teacher_id` (`teacher_id`),
  KEY `FK_teacher_4` (`dept_id`),
  CONSTRAINT `FK_teacher_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_teacher_2` FOREIGN KEY (`tdesignation_id`) REFERENCES `tdesignation` (`tdesignation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_teacher_3` FOREIGN KEY (`teacher_added_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_teacher_4` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'ditee', '123', null, 'Ditee Yasmeen', '4', 'Dhaka', 'ditee@yasmeen.com', '1985-01-01 00:00:00', '0', 'B(+ve)', 'Assistant Professor', '01234558690', null, '1', '1', '1', '2018-11-04 18:54:08', '2011-01-04', null, null, null);
INSERT INTO `teacher` VALUES ('3', 'maruf', '123', null, 'Saleh Mohammad Maruf', '4', 'Dhaka', 'saleh@maruf.com', '1983-01-01 00:00:00', '1', 'O(+ve)', 'Assistant Professor', '09938282992', null, '1', '1', '1', '2018-11-04 18:54:08', '2015-01-01', null, null, null);

-- ----------------------------
-- Table structure for `teacher_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_attendance`;
CREATE TABLE `teacher_attendance` (
  `t_att_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) unsigned NOT NULL,
  `t_att_time` datetime NOT NULL,
  PRIMARY KEY (`t_att_id`),
  KEY `FK_teacher_attendance_1` (`teacher_id`),
  CONSTRAINT `FK_teacher_attendance_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teacher_attendance
-- ----------------------------
