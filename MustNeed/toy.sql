/*
SQLyog  v12.2.6 (64 bit)
MySQL - 8.0.11 : Database - apply_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apply_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `apply_project`;

/*Table structure for table `adjudicator` */

DROP TABLE IF EXISTS `adjudicator`;

CREATE TABLE `adjudicator` (
  `adjudicator_id` varchar(20) NOT NULL COMMENT '评审员号',
  `adjudicator_password` varchar(20) NOT NULL DEFAULT '123456' COMMENT '评审员密码',
  `adjudicator_name` varchar(20) NOT NULL COMMENT '评审员姓名',
  PRIMARY KEY (`adjudicator_id`),
  KEY `adju_name_index` (`adjudicator_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adjudicator` */

insert  into `adjudicator`(`adjudicator_id`,`adjudicator_password`,`adjudicator_name`) values 
('001','654321','老王'),
('002','654321','评审员小张'),
('003','654321','评审员高育良'),
('111','654321','wu'),
('ADJU-001','123456','评审员张三'),
('adju4','654321','评审员张伟'),
('NUC-ADJU-001','654321','评审员志华'),
('NUC_adju_Number+005','123456','$$@');

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `admin_id` varchar(20) NOT NULL COMMENT '管理员号',
  `admin_password` varchar(20) NOT NULL COMMENT '管理员密码',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员姓名',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `administrator` */

insert  into `administrator`(`admin_id`,`admin_password`,`admin_name`) values 
('001','123456','管理员吴彦祖'),
('002','123456','管理员志华华哥'),
('003','654321','管理员沙瑞金'),
('007','123456','管理员詹姆斯邦德'),
('5S6DSSS','songyu3421606','管理员A'),
('ADMIN-001','123456','老王'),
('NUC-ADMIN-001','123456','管理员志华');

/*Table structure for table `apply` */

DROP TABLE IF EXISTS `apply`;

CREATE TABLE `apply` (
  `student_id` varchar(20) NOT NULL COMMENT '学生号',
  `project_id` varchar(20) NOT NULL COMMENT '项目号',
  `teacher_id` varchar(20) NOT NULL COMMENT '教师号',
  `student_name` varchar(20) NOT NULL COMMENT '学生名',
  `project_name` varchar(20) NOT NULL COMMENT '项目名',
  `teacher_name` varchar(20) NOT NULL COMMENT '教师名',
  `project_content` varchar(2000) NOT NULL COMMENT '申报内容',
  `project_progress` varchar(20) NOT NULL DEFAULT '待辅导' COMMENT '申报进度',
  `project_teach` varchar(2000) NOT NULL DEFAULT '未指导' COMMENT '指导内容',
  `pass_status` varchar(20) NOT NULL DEFAULT '未通过' COMMENT '通过状态',
  `project_total_score` varchar(20) NOT NULL DEFAULT '0' COMMENT '评审总分',
  `has_scored_adju_number` varchar(20) NOT NULL DEFAULT '0' COMMENT '已经打分的评审员数',
  `adju_number` varchar(20) NOT NULL DEFAULT '0' COMMENT '评审员数',
  PRIMARY KEY (`student_id`,`project_id`,`teacher_id`),
  KEY `teacher_name` (`teacher_name`),
  KEY `project_id` (`project_id`),
  KEY `student_name` (`student_name`),
  KEY `project_name` (`project_name`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`teacher_name`) REFERENCES `teacher` (`teacher_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_5` FOREIGN KEY (`student_name`) REFERENCES `student` (`student_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_6` FOREIGN KEY (`project_name`) REFERENCES `project` (`project_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `apply` */

insert  into `apply`(`student_id`,`project_id`,`teacher_id`,`student_name`,`project_name`,`teacher_name`,`project_content`,`project_progress`,`project_teach`,`pass_status`,`project_total_score`,`has_scored_adju_number`,`adju_number`) values 
('001','01','001','黄永琦','端茶倒水','李波','我一定会好好端茶倒水的！','已辅导，并通过，已评分','很好，有进步，相信你','通过','61.0','2','2'),
('002','02','001','吴志华','捏腰捶腿','李波','本来呢，端茶倒水是我一直以来善于做的事情。然而如今，每个人都是需要开辟新的技能的。如今，我学会了如何用小锤锤敲你的胸口，这还是从国哥那里学过来的呢。一般人我不告诉他~嘻嘻','已辅导，并通过，待评分','志华 国哥昨天来找我 说你没有申报端茶倒水，反而选择开发了高新项目捏腰捶腿。\r\n首先我要说的是，你这种精神是值得鼓励的。可是\r\n你他妈有国哥的锤子吗！','通过','16.4375','4','1'),
('008','XiangMu5','aaa34566','詹姆斯邦德','故事会','王老师','山上有个庙','已辅导，并通过，已评分','这个故事很不错，给予通过','通过','34.3','2','2'),
('009','004','003','国哥2号','国哥大战孙悟空','辅导教师李达康','深入学习三个代表重要思想','已辅导，并通过，已评分','国哥2号，你很厉害，建议通过。','通过','57.583332','3','3'),
('1514011320','XiangMu5','aaa34566','吴老狗','故事会','王老师','从前有座山','已辅导，并通过，已评分','你的故事也很好','通过','72.25','2','2'),
('NUC-STUDENT-001','PROJECT-001','NUC-TEACHER-001','学生志华','志华大狗','老师志华','从前有座山，山上有只狗。这只狗就吴二狗。','已辅导，并通过，已评分','你的故事感人肺腑 予以通过','通过','72.55','2','3'),
('STUDENT-001','PROJECT-002','TEACHER-001','小张','讲故事','教师小王','从前有座山 山上有个庙','已辅导，并通过，待评分','你的故事很好','通过','60.0','1','2');

/*Table structure for table `judge` */

DROP TABLE IF EXISTS `judge`;

CREATE TABLE `judge` (
  `student_id` varchar(20) NOT NULL COMMENT '学生号',
  `project_id` varchar(20) NOT NULL COMMENT '项目号',
  `adju_id` varchar(20) NOT NULL DEFAULT 'NULL' COMMENT '评审员号',
  `project_score` varchar(20) DEFAULT 'NULL' COMMENT '评审分',
  `is_judged` varchar(20) NOT NULL DEFAULT '未评分' COMMENT '评分标记',
  KEY `project_id` (`project_id`),
  KEY `adju_id` (`adju_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `judge_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `judge_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `judge_ibfk_3` FOREIGN KEY (`adju_id`) REFERENCES `adjudicator` (`adjudicator_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `judge` */

insert  into `judge`(`student_id`,`project_id`,`adju_id`,`project_score`,`is_judged`) values 
('001','01','001','65.5','已评分'),
('001','01','002','56.5','已评分'),
('002','02','001','65.75','已评分'),
('009','004','003','99.8','已评分'),
('009','004','002','89.5','已评分'),
('009','004','001','56.4','已评分'),
('008','XiangMu5','adju4','55.8','已评分'),
('1514011320','XiangMu5','002','55.7','已评分'),
('1514011320','XiangMu5','001','88.8','已评分'),
('008','XiangMu5','002','12.8','已评分'),
('NUC-STUDENT-001','PROJECT-001','NUC-ADJU-001','55.7','已评分'),
('NUC-STUDENT-001','PROJECT-001','001','89.4','已评分'),
('NUC-STUDENT-001','PROJECT-001','002','NULL','未评分'),
('STUDENT-001','PROJECT-002','ADJU-001','NULL','未评分'),
('STUDENT-001','PROJECT-002','001','60','已评分');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `project_id` varchar(20) NOT NULL COMMENT '项目号',
  `project_name` varchar(20) NOT NULL COMMENT '项目名',
  `project_info` varchar(2000) NOT NULL COMMENT '项目介绍',
  `teacher_id` varchar(20) DEFAULT NULL COMMENT '辅导教师号',
  PRIMARY KEY (`project_id`),
  KEY `project_name_index` (`project_name`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `project` */

insert  into `project`(`project_id`,`project_name`,`project_info`,`teacher_id`) values 
('004','国哥大战孙悟空','注意！该项目仅刘科国和国哥2号可以通过！\r\n国哥，家喻户晓，无人不知，是特别厉害的583社长。\r\n在他的领导下，宿舍成员认真学习政治经济文化知识，积极参加社会实践，实际践行吃苦耐劳的中华民族传统精神。在刘科国的带领下，每个人认真贯彻落实社会主义核心价值观，深入学习三个代表重要思想。\r\n申请这个项目的国哥同志，相信你们已经有了成为社会主义下一代接班人的准备，请放心申报。党和人民会根据你的表现公平更正的为你打出一个满意的分数。\r\n','003'),
('01','端茶倒水','专门为其他人端茶倒水的重要工作','001'),
('02','捏腰捶腿','专门为其他人捏腰捶腿的重要工作','001'),
('03','考试开车','你懂得，高难度项目，谨慎报名。','002'),
('PROJECT-001','志华大狗','请讲一个志华大狗的故事','NUC-TEACHER-001'),
('PROJECT-002','讲故事','讲一个故事','TEACHER-001'),
('XiangMu5','故事会','讲一则故事','aaa34566');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` varchar(20) NOT NULL COMMENT '学生号',
  `student_password` varchar(20) NOT NULL DEFAULT '123456' COMMENT '学生密码',
  `student_name` varchar(20) NOT NULL COMMENT '学生姓名',
  `student_sex` varchar(20) DEFAULT '未知' COMMENT '性别',
  `student_class` varchar(20) DEFAULT '未知' COMMENT '学生班级',
  `student_phonenumber` varchar(20) DEFAULT '未知' COMMENT '学生手机号',
  PRIMARY KEY (`student_id`),
  KEY `student_name_index` (`student_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`student_id`,`student_password`,`student_name`,`student_sex`,`student_class`,`student_phonenumber`) values 
('001','654321','黄永琦','男','15140A01','13834638990'),
('002','654321','吴志华','女','15140A01','13834638438'),
('003','123456','老王','未知','未知','未知'),
('004','123456','张三','未知','未知','未知'),
('006','123456','王五','未知','未知','未知'),
('007','123456','老哥稳','未知','未知','未知'),
('008','654321','詹姆斯邦德','女','15140A01','13834638995'),
('009','654321','国哥2号','男','15140A01','13834546545'),
('1514011318','123456','大黄','未知','未知','未知'),
('1514011320','654321','吴老狗','男','15140A01','13834638990'),
('NUC-STUDENT-001','654321','学生志华','女','15140A01','13834638990'),
('STUDENT-001','654321','小张','女','15140A02','13565698845'),
('STUDENT-002','123456','刘科国','未知','未知','未知');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacher_id` varchar(20) NOT NULL COMMENT '教师号',
  `teacher_password` varchar(20) NOT NULL DEFAULT '123456' COMMENT '教师密码',
  `teacher_name` varchar(20) NOT NULL COMMENT '教师名',
  PRIMARY KEY (`teacher_id`),
  KEY `teacher_name` (`teacher_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`teacher_id`,`teacher_password`,`teacher_name`) values 
('001','654321','李波'),
('002','654321','少年张三丰'),
('003','654321','辅导教师李达康'),
('aaa34566','654321','王老师'),
('NUC-TEACHER-001','654321','老师志华'),
('NUC_TEACHER_005','123456','老王'),
('TEACHER-001','654321','教师小王');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
