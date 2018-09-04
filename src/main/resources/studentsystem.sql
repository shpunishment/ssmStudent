/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : studentsystem

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2018-09-04 19:41:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `courseId` int(5) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(15) DEFAULT NULL,
  `teacherId` int(5) DEFAULT NULL,
  `courseCredit` int(2) DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `teacher_id` (`teacherId`),
  CONSTRAINT `teacher_id` FOREIGN KEY (`teacherId`) REFERENCES `teachers` (`teacherId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('10001', 'Java', '10001', '5');
INSERT INTO `courses` VALUES ('10002', 'C语言', '10006', '4');
INSERT INTO `courses` VALUES ('10003', '模拟电路', '10002', '4');
INSERT INTO `courses` VALUES ('10004', 'C++语言', '10005', '3');
INSERT INTO `courses` VALUES ('10005', '高等数学', '10006', '3');
INSERT INTO `courses` VALUES ('10006', '线性代数', '10003', '4');
INSERT INTO `courses` VALUES ('10007', '英语', '10004', '3');
INSERT INTO `courses` VALUES ('10008', '数学', '10003', '3');
INSERT INTO `courses` VALUES ('10009', 'Java', '10003', '5');
INSERT INTO `courses` VALUES ('10014', 'C++', '10002', '4');

-- ----------------------------
-- Table structure for scores
-- ----------------------------
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `studentId` int(5) DEFAULT NULL,
  `courseId` int(5) DEFAULT NULL,
  `stuCouScore` int(3) DEFAULT '0',
  KEY `student_id` (`studentId`),
  KEY `course_id` (`courseId`),
  CONSTRAINT `course_id` FOREIGN KEY (`courseId`) REFERENCES `courses` (`courseId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `student_id` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scores
-- ----------------------------
INSERT INTO `scores` VALUES ('10101', '10001', '94');
INSERT INTO `scores` VALUES ('10102', '10002', '60');
INSERT INTO `scores` VALUES ('10101', '10002', '90');
INSERT INTO `scores` VALUES ('10101', '10003', '92');
INSERT INTO `scores` VALUES ('10101', '10004', '90');
INSERT INTO `scores` VALUES ('10101', '10005', '89');
INSERT INTO `scores` VALUES ('10101', '10006', '88');
INSERT INTO `scores` VALUES ('10102', '10001', '59');
INSERT INTO `scores` VALUES ('10102', '10003', '60');
INSERT INTO `scores` VALUES ('10102', '10004', '61');
INSERT INTO `scores` VALUES ('10102', '10005', '63');
INSERT INTO `scores` VALUES ('10102', '10006', '61');
INSERT INTO `scores` VALUES ('10102', '10007', '62');
INSERT INTO `scores` VALUES ('10105', '10004', '77');
INSERT INTO `scores` VALUES ('10104', '10003', '90');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `studentId` int(5) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(6) DEFAULT NULL,
  `studentGender` varchar(1) DEFAULT NULL,
  `studentClass` varchar(15) DEFAULT NULL,
  `studentMajor` varchar(15) DEFAULT NULL,
  `studentDepartment` varchar(15) DEFAULT NULL,
  `studentRewOrPun` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `class` (`studentClass`)
) ENGINE=InnoDB AUTO_INCREMENT=10124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('10101', '张三', '男', '计科1班', '计算机科学与技术', '计算机科学系', '国家奖学金');
INSERT INTO `students` VALUES ('10102', '张四', '女', '计科1班', '计算机科学与技术', '计算机科学系', null);
INSERT INTO `students` VALUES ('10103', '张五', '男', '计科1班', '计算机科学与技术', '计算机科学系', '旷课处分');
INSERT INTO `students` VALUES ('10104', '张六', '女', '计科1班', '计算机科学与技术', '计算机科学系', null);
INSERT INTO `students` VALUES ('10105', '张七', '男', '计科1班', '计算机科学与技术', '计算机科学系', '');
INSERT INTO `students` VALUES ('10106', '张八', '女', '计科1班', '计算机科学与技术', '计算机科学系', null);
INSERT INTO `students` VALUES ('10107', '李页码', '男', '计科2班', '计算机科学与技术', '计算机科学系', '');
INSERT INTO `students` VALUES ('10108', '李二', '男', '计科2班', '计算机科学与技术', '计算机科学系', null);
INSERT INTO `students` VALUES ('10109', '李三', '女', '计科2班', '计算机科学与技术', '计算机科学系', '迟到处分');
INSERT INTO `students` VALUES ('10110', '林已', '男', '电气1班', '电气工程及其自动化', '计算机科学系', null);
INSERT INTO `students` VALUES ('10111', '林而', '女', '电气1班', '电气工程及其自动化', '计算机科学系', null);
INSERT INTO `students` VALUES ('10112', '林三', '男', '电气1班', '电气工程及其自动化', '计算机科学系', null);
INSERT INTO `students` VALUES ('10113', '林死', '男', '电气1班', '电气工程及其自动化', '计算机科学系', '晚归处分');
INSERT INTO `students` VALUES ('10114', '林林', '女', '电气2班', '电气工程及其自动化', '计算机科学系', null);
INSERT INTO `students` VALUES ('10116', '林改', '女', '电气2班', '电气工程及其自动化', '计算机科学系', null);
INSERT INTO `students` VALUES ('10118', '曾加', '男', '电气2班', '电气工程及其自动化', '计算机科学系', '迟到处分');
INSERT INTO `students` VALUES ('10119', '曾二', '男', '电气2班', '电气工程及其自动化', '计算机科学系', null);
INSERT INTO `students` VALUES ('10120', '曾四', '男', '电气2班', '电气工程及其自动化', '计算机科学系', null);
INSERT INTO `students` VALUES ('10122', '更改', '女', '化工1班', '化工教育', '化工系', '系二等奖学金');
INSERT INTO `students` VALUES ('10123', '页码', '男', '化工1班', '化工教育', '化工系', '系一等奖学金');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `teacherId` int(5) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(10) DEFAULT NULL,
  `teacherJobTitle` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('10001', '王若', '讲师');
INSERT INTO `teachers` VALUES ('10002', '王已', '副教授');
INSERT INTO `teachers` VALUES ('10003', '王而', '副教授');
INSERT INTO `teachers` VALUES ('10004', '王散', '副教授');
INSERT INTO `teachers` VALUES ('10005', '曾一', '讲师');
INSERT INTO `teachers` VALUES ('10006', '曾二', '讲师');
INSERT INTO `teachers` VALUES ('10007', '更改', '副教授');
