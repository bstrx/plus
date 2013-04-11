-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: moodle
-- ------------------------------------------------------
-- Server version	5.1.63-0+squeeze1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mdl_assign`
--

DROP TABLE IF EXISTS `mdl_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign`
--

LOCK TABLES `mdl_assign` WRITE;
/*!40000 ALTER TABLE `mdl_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_grades`
--

DROP TABLE IF EXISTS `mdl_assign_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_mai_ix` (`mailed`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_grades`
--

LOCK TABLES `mdl_assign_grades` WRITE;
/*!40000 ALTER TABLE `mdl_assign_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_plugin_config`
--

DROP TABLE IF EXISTS `mdl_assign_plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_plugin_config`
--

LOCK TABLES `mdl_assign_plugin_config` WRITE;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_submission`
--

DROP TABLE IF EXISTS `mdl_assign_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_submission`
--

LOCK TABLES `mdl_assign_submission` WRITE;
/*!40000 ALTER TABLE `mdl_assign_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_mapping`
--

DROP TABLE IF EXISTS `mdl_assign_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_mapping`
--

LOCK TABLES `mdl_assign_user_mapping` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_comments`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_comments`
--

LOCK TABLES `mdl_assignfeedback_comments` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_file`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_file`
--

LOCK TABLES `mdl_assignfeedback_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment`
--

LOCK TABLES `mdl_assignment` WRITE;
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_submissions`
--

LOCK TABLES `mdl_assignment_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_file`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_file`
--

LOCK TABLES `mdl_assignsubmission_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_onlinetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_onlinetext`
--

LOCK TABLES `mdl_assignsubmission_onlinetext` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_autoview`
--

DROP TABLE IF EXISTS `mdl_autoview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_autoview` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `configfile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `noframe` tinyint(1) NOT NULL DEFAULT '0',
  `summary` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `storage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_auto_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines autoviews';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_autoview`
--

LOCK TABLES `mdl_autoview` WRITE;
/*!40000 ALTER TABLE `mdl_autoview` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_autoview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_autoview_keys`
--

DROP TABLE IF EXISTS `mdl_autoview_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_autoview_keys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `accesskey` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines access keys for the flash streaming server';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_autoview_keys`
--

LOCK TABLES `mdl_autoview_keys` WRITE;
/*!40000 ALTER TABLE `mdl_autoview_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_autoview_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_controllers`
--

LOCK TABLES `mdl_backup_controllers` WRITE;
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_courses`
--

LOCK TABLES `mdl_backup_courses` WRITE;
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_files_template`
--

DROP TABLE IF EXISTS `mdl_backup_files_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_files_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `info` longtext COLLATE utf8_unicode_ci,
  `newcontextid` bigint(10) DEFAULT NULL,
  `newitemid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store files along the backup process. Note this table isn';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_files_template`
--

LOCK TABLES `mdl_backup_files_template` WRITE;
/*!40000 ALTER TABLE `mdl_backup_files_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_files_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_ids_template`
--

DROP TABLE IF EXISTS `mdl_backup_ids_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_ids_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemname` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `newitemid` bigint(10) NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) DEFAULT NULL,
  `info` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all sort of ids along the backup process. Note this';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_ids_template`
--

LOCK TABLES `mdl_backup_ids_template` WRITE;
/*!40000 ALTER TABLE `mdl_backup_ids_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_ids_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_logs`
--

DROP TABLE IF EXISTS `mdl_backup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_logs`
--

LOCK TABLES `mdl_backup_logs` WRITE;
/*!40000 ALTER TABLE `mdl_backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block`
--

LOCK TABLES `mdl_block` WRITE;
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` VALUES (1,'activity_modules',2012112900,0,0,1),(2,'admin_bookmarks',2012112900,0,0,1),(3,'blog_menu',2012112900,0,0,1),(4,'blog_recent',2012112900,0,0,1),(5,'blog_tags',2012112900,0,0,1),(6,'calendar_month',2012112900,0,0,1),(7,'calendar_upcoming',2012112900,0,0,1),(8,'comments',2012112900,0,0,1),(9,'community',2012112900,0,0,1),(10,'completionstatus',2012112901,0,0,1),(11,'course_list',2012112900,0,0,1),(12,'course_overview',2012121000,0,0,1),(13,'course_summary',2012112901,0,0,1),(14,'feedback',2012112900,0,0,0),(15,'glossary_random',2012112901,0,0,1),(16,'html',2012112900,0,0,1),(17,'login',2012112900,0,0,1),(18,'mentees',2012112901,0,0,1),(19,'messages',2012112900,0,0,1),(20,'mnet_hosts',2012112900,0,0,1),(21,'myprofile',2012112900,0,0,1),(22,'navigation',2012112900,0,0,1),(23,'news_items',2012112901,0,0,1),(24,'online_users',2012112901,0,0,1),(25,'participants',2012112900,0,0,1),(26,'private_files',2012112900,0,0,1),(27,'quiz_results',2012112900,0,0,1),(28,'recent_activity',2012112900,0,0,1),(29,'rss_client',2012112900,300,1363682701,1),(30,'search_forums',2012112900,0,0,1),(31,'section_links',2012112900,0,0,1),(32,'selfcompletion',2012112901,0,0,1),(33,'settings',2012112900,0,0,1),(34,'site_main_menu',2012112900,0,0,1),(35,'social_activities',2012112900,0,0,1),(36,'tag_flickr',2012112900,0,0,1),(37,'tag_youtube',2012112900,0,0,1),(38,'tags',2012112900,0,0,1),(39,'repo_filemanager',2011101101,0,0,1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_community`
--

DROP TABLE IF EXISTS `mdl_block_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_community`
--

LOCK TABLES `mdl_block_community` WRITE;
/*!40000 ALTER TABLE `mdl_block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_instances`
--

DROP TABLE IF EXISTS `mdl_block_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_instances`
--

LOCK TABLES `mdl_block_instances` WRITE;
/*!40000 ALTER TABLE `mdl_block_instances` DISABLE KEYS */;
INSERT INTO `mdl_block_instances` VALUES (1,'site_main_menu',2,0,'site-index',NULL,'side-pre',0,''),(2,'course_summary',2,0,'site-index',NULL,'side-post',0,''),(3,'calendar_month',2,0,'site-index',NULL,'side-post',1,''),(4,'navigation',1,1,'*',NULL,'side-pre',0,''),(5,'settings',1,1,'*',NULL,'side-pre',1,''),(6,'admin_bookmarks',1,0,'admin-*',NULL,'side-pre',0,''),(7,'private_files',1,0,'my-index','2','side-post',0,''),(9,'course_overview',1,0,'my-index','2','content',0,'');
/*!40000 ALTER TABLE `mdl_block_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_positions`
--

DROP TABLE IF EXISTS `mdl_block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_positions`
--

LOCK TABLES `mdl_block_positions` WRITE;
/*!40000 ALTER TABLE `mdl_block_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_rss_client`
--

LOCK TABLES `mdl_block_rss_client` WRITE;
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_association`
--

DROP TABLE IF EXISTS `mdl_blog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_association`
--

LOCK TABLES `mdl_blog_association` WRITE;
/*!40000 ALTER TABLE `mdl_blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_external`
--

DROP TABLE IF EXISTS `mdl_blog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_external`
--

LOCK TABLES `mdl_blog_external` WRITE;
/*!40000 ALTER TABLE `mdl_blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book`
--

LOCK TABLES `mdl_book` WRITE;
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book_chapters`
--

LOCK TABLES `mdl_book_chapters` WRITE;
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_filters`
--

LOCK TABLES `mdl_cache_filters` WRITE;
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_flags`
--

LOCK TABLES `mdl_cache_flags` WRITE;
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_text`
--

DROP TABLE IF EXISTS `mdl_cache_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `formattedtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For storing temporary copies of processed texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_text`
--

LOCK TABLES `mdl_cache_text` WRITE;
/*!40000 ALTER TABLE `mdl_cache_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_capabilities`
--

LOCK TABLES `mdl_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` VALUES (1,'moodle/site:config','write',10,'moodle',62),(2,'moodle/site:readallmessages','read',10,'moodle',8),(3,'moodle/site:sendmessage','write',10,'moodle',16),(4,'moodle/site:approvecourse','write',10,'moodle',4),(5,'moodle/backup:backupcourse','write',50,'moodle',28),(6,'moodle/backup:backupsection','write',50,'moodle',28),(7,'moodle/backup:backupactivity','write',70,'moodle',28),(8,'moodle/backup:backuptargethub','write',50,'moodle',28),(9,'moodle/backup:backuptargetimport','write',50,'moodle',28),(10,'moodle/backup:downloadfile','write',50,'moodle',28),(11,'moodle/backup:configure','write',50,'moodle',28),(12,'moodle/backup:userinfo','read',50,'moodle',8),(13,'moodle/backup:anonymise','read',50,'moodle',8),(14,'moodle/restore:restorecourse','write',50,'moodle',28),(15,'moodle/restore:restoresection','write',50,'moodle',28),(16,'moodle/restore:restoreactivity','write',50,'moodle',28),(17,'moodle/restore:viewautomatedfilearea','write',50,'moodle',28),(18,'moodle/restore:restoretargethub','write',50,'moodle',28),(19,'moodle/restore:restoretargetimport','write',50,'moodle',28),(20,'moodle/restore:uploadfile','write',50,'moodle',28),(21,'moodle/restore:configure','write',50,'moodle',28),(22,'moodle/restore:rolldates','write',50,'moodle',0),(23,'moodle/restore:userinfo','write',50,'moodle',30),(24,'moodle/restore:createuser','write',10,'moodle',24),(25,'moodle/site:manageblocks','write',80,'moodle',20),(26,'moodle/site:accessallgroups','read',50,'moodle',0),(27,'moodle/site:viewfullnames','read',50,'moodle',0),(28,'moodle/site:viewuseridentity','read',50,'moodle',0),(29,'moodle/site:viewreports','read',50,'moodle',8),(30,'moodle/site:trustcontent','write',50,'moodle',4),(31,'moodle/site:uploadusers','write',10,'moodle',24),(32,'moodle/filter:manage','write',50,'moodle',0),(33,'moodle/user:create','write',10,'moodle',24),(34,'moodle/user:delete','write',10,'moodle',8),(35,'moodle/user:update','write',10,'moodle',24),(36,'moodle/user:viewdetails','read',50,'moodle',0),(37,'moodle/user:viewalldetails','read',30,'moodle',8),(38,'moodle/user:viewhiddendetails','read',50,'moodle',8),(39,'moodle/user:loginas','write',50,'moodle',30),(40,'moodle/user:managesyspages','write',10,'moodle',0),(41,'moodle/user:manageblocks','write',30,'moodle',0),(42,'moodle/user:manageownblocks','write',10,'moodle',0),(43,'moodle/user:manageownfiles','write',10,'moodle',0),(44,'moodle/my:configsyspages','write',10,'moodle',0),(45,'moodle/role:assign','write',50,'moodle',28),(46,'moodle/role:review','read',50,'moodle',8),(47,'moodle/role:override','write',50,'moodle',28),(48,'moodle/role:safeoverride','write',50,'moodle',16),(49,'moodle/role:manage','write',10,'moodle',28),(50,'moodle/role:switchroles','read',50,'moodle',12),(51,'moodle/category:manage','write',40,'moodle',4),(52,'moodle/category:viewhiddencategories','read',40,'moodle',0),(53,'moodle/cohort:manage','write',40,'moodle',0),(54,'moodle/cohort:assign','write',40,'moodle',0),(55,'moodle/cohort:view','read',50,'moodle',0),(56,'moodle/course:create','write',40,'moodle',4),(57,'moodle/course:request','write',10,'moodle',0),(58,'moodle/course:delete','write',50,'moodle',32),(59,'moodle/course:update','write',50,'moodle',4),(60,'moodle/course:view','read',50,'moodle',0),(61,'moodle/course:enrolreview','read',50,'moodle',8),(62,'moodle/course:enrolconfig','write',50,'moodle',8),(63,'moodle/course:bulkmessaging','write',50,'moodle',16),(64,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(65,'moodle/course:viewhiddencourses','read',50,'moodle',0),(66,'moodle/course:visibility','write',50,'moodle',0),(67,'moodle/course:managefiles','write',50,'moodle',4),(68,'moodle/course:ignorefilesizelimits','write',50,'moodle',0),(69,'moodle/course:manageactivities','write',70,'moodle',4),(70,'moodle/course:activityvisibility','write',70,'moodle',0),(71,'moodle/course:viewhiddenactivities','write',70,'moodle',0),(72,'moodle/course:viewparticipants','read',50,'moodle',0),(73,'moodle/course:changefullname','write',50,'moodle',4),(74,'moodle/course:changeshortname','write',50,'moodle',4),(75,'moodle/course:changeidnumber','write',50,'moodle',4),(76,'moodle/course:changecategory','write',50,'moodle',4),(77,'moodle/course:changesummary','write',50,'moodle',4),(78,'moodle/site:viewparticipants','read',10,'moodle',0),(79,'moodle/course:isincompletionreports','read',50,'moodle',0),(80,'moodle/course:viewscales','read',50,'moodle',0),(81,'moodle/course:managescales','write',50,'moodle',0),(82,'moodle/course:managegroups','write',50,'moodle',0),(83,'moodle/course:reset','write',50,'moodle',32),(84,'moodle/blog:view','read',10,'moodle',0),(85,'moodle/blog:search','read',10,'moodle',0),(86,'moodle/blog:viewdrafts','read',10,'moodle',8),(87,'moodle/blog:create','write',10,'moodle',16),(88,'moodle/blog:manageentries','write',10,'moodle',16),(89,'moodle/blog:manageexternal','write',10,'moodle',16),(90,'moodle/blog:associatecourse','write',50,'moodle',0),(91,'moodle/blog:associatemodule','write',70,'moodle',0),(92,'moodle/calendar:manageownentries','write',50,'moodle',16),(93,'moodle/calendar:managegroupentries','write',50,'moodle',16),(94,'moodle/calendar:manageentries','write',50,'moodle',16),(95,'moodle/user:editprofile','write',30,'moodle',24),(96,'moodle/user:editownprofile','write',10,'moodle',16),(97,'moodle/user:changeownpassword','write',10,'moodle',0),(98,'moodle/user:readuserposts','read',30,'moodle',0),(99,'moodle/user:readuserblogs','read',30,'moodle',0),(100,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8),(101,'moodle/user:editmessageprofile','write',30,'moodle',16),(102,'moodle/user:editownmessageprofile','write',10,'moodle',0),(103,'moodle/question:managecategory','write',50,'moodle',20),(104,'moodle/question:add','write',50,'moodle',20),(105,'moodle/question:editmine','write',50,'moodle',20),(106,'moodle/question:editall','write',50,'moodle',20),(107,'moodle/question:viewmine','read',50,'moodle',0),(108,'moodle/question:viewall','read',50,'moodle',0),(109,'moodle/question:usemine','read',50,'moodle',0),(110,'moodle/question:useall','read',50,'moodle',0),(111,'moodle/question:movemine','write',50,'moodle',0),(112,'moodle/question:moveall','write',50,'moodle',0),(113,'moodle/question:config','write',10,'moodle',2),(114,'moodle/question:flag','write',50,'moodle',0),(115,'moodle/site:doclinks','read',10,'moodle',0),(116,'moodle/course:sectionvisibility','write',50,'moodle',0),(117,'moodle/course:useremail','write',50,'moodle',0),(118,'moodle/course:viewhiddensections','write',50,'moodle',0),(119,'moodle/course:setcurrentsection','write',50,'moodle',0),(120,'moodle/site:mnetlogintoremote','read',10,'moodle',0),(121,'moodle/grade:viewall','read',50,'moodle',8),(122,'moodle/grade:view','read',50,'moodle',0),(123,'moodle/grade:viewhidden','read',50,'moodle',8),(124,'moodle/grade:import','write',50,'moodle',12),(125,'moodle/grade:export','read',50,'moodle',8),(126,'moodle/grade:manage','write',50,'moodle',12),(127,'moodle/grade:edit','write',50,'moodle',12),(128,'moodle/grade:managegradingforms','write',50,'moodle',12),(129,'moodle/grade:sharegradingforms','write',10,'moodle',4),(130,'moodle/grade:managesharedforms','write',10,'moodle',4),(131,'moodle/grade:manageoutcomes','write',50,'moodle',0),(132,'moodle/grade:manageletters','write',50,'moodle',0),(133,'moodle/grade:hide','write',50,'moodle',0),(134,'moodle/grade:lock','write',50,'moodle',0),(135,'moodle/grade:unlock','write',50,'moodle',0),(136,'moodle/my:manageblocks','write',10,'moodle',0),(137,'moodle/notes:view','read',50,'moodle',0),(138,'moodle/notes:manage','write',50,'moodle',16),(139,'moodle/tag:manage','write',10,'moodle',16),(140,'moodle/tag:create','write',10,'moodle',16),(141,'moodle/tag:edit','write',10,'moodle',16),(142,'moodle/tag:editblocks','write',10,'moodle',0),(143,'moodle/block:view','read',80,'moodle',0),(144,'moodle/block:edit','write',80,'moodle',20),(145,'moodle/portfolio:export','read',10,'moodle',0),(146,'moodle/comment:view','read',50,'moodle',0),(147,'moodle/comment:post','write',50,'moodle',24),(148,'moodle/comment:delete','write',50,'moodle',32),(149,'moodle/webservice:createtoken','write',10,'moodle',62),(150,'moodle/webservice:createmobiletoken','write',10,'moodle',24),(151,'moodle/rating:view','read',50,'moodle',0),(152,'moodle/rating:viewany','read',50,'moodle',8),(153,'moodle/rating:viewall','read',50,'moodle',8),(154,'moodle/rating:rate','write',50,'moodle',0),(155,'moodle/course:publish','write',10,'moodle',24),(156,'moodle/course:markcomplete','write',50,'moodle',0),(157,'moodle/community:add','write',10,'moodle',0),(158,'moodle/community:download','write',10,'moodle',0),(159,'mod/assign:view','read',70,'mod_assign',0),(160,'mod/assign:submit','write',70,'mod_assign',0),(161,'mod/assign:grade','write',70,'mod_assign',4),(162,'mod/assign:exportownsubmission','read',70,'mod_assign',0),(163,'mod/assign:addinstance','write',50,'mod_assign',4),(164,'mod/assignment:view','read',70,'mod_assignment',0),(165,'mod/assignment:addinstance','write',50,'mod_assignment',4),(166,'mod/assignment:submit','write',70,'mod_assignment',0),(167,'mod/assignment:grade','write',70,'mod_assignment',4),(168,'mod/assignment:exportownsubmission','read',70,'mod_assignment',0),(169,'mod/book:addinstance','write',50,'mod_book',4),(170,'mod/book:read','read',70,'mod_book',0),(171,'mod/book:viewhiddenchapters','read',70,'mod_book',0),(172,'mod/book:edit','write',70,'mod_book',4),(173,'mod/chat:addinstance','write',50,'mod_chat',4),(174,'mod/chat:chat','write',70,'mod_chat',16),(175,'mod/chat:readlog','read',70,'mod_chat',0),(176,'mod/chat:deletelog','write',70,'mod_chat',0),(177,'mod/chat:exportparticipatedsession','read',70,'mod_chat',8),(178,'mod/chat:exportsession','read',70,'mod_chat',8),(179,'mod/choice:addinstance','write',50,'mod_choice',4),(180,'mod/choice:choose','write',70,'mod_choice',0),(181,'mod/choice:readresponses','read',70,'mod_choice',0),(182,'mod/choice:deleteresponses','write',70,'mod_choice',0),(183,'mod/choice:downloadresponses','read',70,'mod_choice',0),(184,'mod/data:addinstance','write',50,'mod_data',4),(185,'mod/data:viewentry','read',70,'mod_data',0),(186,'mod/data:writeentry','write',70,'mod_data',16),(187,'mod/data:comment','write',70,'mod_data',16),(188,'mod/data:rate','write',70,'mod_data',0),(189,'mod/data:viewrating','read',70,'mod_data',0),(190,'mod/data:viewanyrating','read',70,'mod_data',8),(191,'mod/data:viewallratings','read',70,'mod_data',8),(192,'mod/data:approve','write',70,'mod_data',16),(193,'mod/data:manageentries','write',70,'mod_data',16),(194,'mod/data:managecomments','write',70,'mod_data',16),(195,'mod/data:managetemplates','write',70,'mod_data',20),(196,'mod/data:viewalluserpresets','read',70,'mod_data',0),(197,'mod/data:manageuserpresets','write',70,'mod_data',20),(198,'mod/data:exportentry','read',70,'mod_data',8),(199,'mod/data:exportownentry','read',70,'mod_data',0),(200,'mod/data:exportallentries','read',70,'mod_data',8),(201,'mod/feedback:addinstance','write',50,'mod_feedback',4),(202,'mod/feedback:view','read',70,'mod_feedback',0),(203,'mod/feedback:complete','write',70,'mod_feedback',16),(204,'mod/feedback:viewanalysepage','read',70,'mod_feedback',8),(205,'mod/feedback:deletesubmissions','write',70,'mod_feedback',0),(206,'mod/feedback:mapcourse','write',70,'mod_feedback',0),(207,'mod/feedback:edititems','write',70,'mod_feedback',20),(208,'mod/feedback:createprivatetemplate','write',70,'mod_feedback',16),(209,'mod/feedback:createpublictemplate','write',70,'mod_feedback',16),(210,'mod/feedback:deletetemplate','write',70,'mod_feedback',0),(211,'mod/feedback:viewreports','read',70,'mod_feedback',8),(212,'mod/feedback:receivemail','read',70,'mod_feedback',8),(213,'mod/folder:addinstance','write',50,'mod_folder',4),(214,'mod/folder:view','read',70,'mod_folder',0),(215,'mod/folder:managefiles','write',70,'mod_folder',16),(216,'mod/forum:addinstance','write',50,'mod_forum',4),(217,'mod/forum:viewdiscussion','read',70,'mod_forum',0),(218,'mod/forum:viewhiddentimedposts','read',70,'mod_forum',0),(219,'mod/forum:startdiscussion','write',70,'mod_forum',16),(220,'mod/forum:replypost','write',70,'mod_forum',16),(221,'mod/forum:addnews','write',70,'mod_forum',16),(222,'mod/forum:replynews','write',70,'mod_forum',16),(223,'mod/forum:viewrating','read',70,'mod_forum',0),(224,'mod/forum:viewanyrating','read',70,'mod_forum',8),(225,'mod/forum:viewallratings','read',70,'mod_forum',8),(226,'mod/forum:rate','write',70,'mod_forum',0),(227,'mod/forum:createattachment','write',70,'mod_forum',16),(228,'mod/forum:deleteownpost','read',70,'mod_forum',0),(229,'mod/forum:deleteanypost','read',70,'mod_forum',0),(230,'mod/forum:splitdiscussions','read',70,'mod_forum',0),(231,'mod/forum:movediscussions','read',70,'mod_forum',0),(232,'mod/forum:editanypost','write',70,'mod_forum',16),(233,'mod/forum:viewqandawithoutposting','read',70,'mod_forum',0),(234,'mod/forum:viewsubscribers','read',70,'mod_forum',0),(235,'mod/forum:managesubscriptions','read',70,'mod_forum',16),(236,'mod/forum:postwithoutthrottling','write',70,'mod_forum',16),(237,'mod/forum:exportdiscussion','read',70,'mod_forum',8),(238,'mod/forum:exportpost','read',70,'mod_forum',8),(239,'mod/forum:exportownpost','read',70,'mod_forum',8),(240,'mod/forum:addquestion','write',70,'mod_forum',16),(241,'mod/forum:allowforcesubscribe','read',70,'mod_forum',0),(242,'mod/glossary:addinstance','write',50,'mod_glossary',4),(243,'mod/glossary:view','read',70,'mod_glossary',0),(244,'mod/glossary:write','write',70,'mod_glossary',16),(245,'mod/glossary:manageentries','write',70,'mod_glossary',16),(246,'mod/glossary:managecategories','write',70,'mod_glossary',16),(247,'mod/glossary:comment','write',70,'mod_glossary',16),(248,'mod/glossary:managecomments','write',70,'mod_glossary',16),(249,'mod/glossary:import','write',70,'mod_glossary',16),(250,'mod/glossary:export','read',70,'mod_glossary',0),(251,'mod/glossary:approve','write',70,'mod_glossary',16),(252,'mod/glossary:rate','write',70,'mod_glossary',0),(253,'mod/glossary:viewrating','read',70,'mod_glossary',0),(254,'mod/glossary:viewanyrating','read',70,'mod_glossary',8),(255,'mod/glossary:viewallratings','read',70,'mod_glossary',8),(256,'mod/glossary:exportentry','read',70,'mod_glossary',8),(257,'mod/glossary:exportownentry','read',70,'mod_glossary',0),(258,'mod/imscp:view','read',70,'mod_imscp',0),(259,'mod/imscp:addinstance','write',50,'mod_imscp',4),(260,'mod/label:addinstance','write',50,'mod_label',4),(261,'mod/lesson:addinstance','write',50,'mod_lesson',4),(262,'mod/lesson:edit','write',70,'mod_lesson',4),(263,'mod/lesson:manage','write',70,'mod_lesson',0),(264,'mod/lti:view','read',70,'mod_lti',0),(265,'mod/lti:addinstance','write',50,'mod_lti',4),(266,'mod/lti:grade','write',70,'mod_lti',4),(267,'mod/lti:manage','write',70,'mod_lti',4),(268,'mod/lti:addcoursetool','write',50,'mod_lti',0),(269,'mod/lti:requesttooladd','write',50,'mod_lti',0),(270,'mod/page:view','read',70,'mod_page',0),(271,'mod/page:addinstance','write',50,'mod_page',4),(272,'mod/quiz:view','read',70,'mod_quiz',0),(273,'mod/quiz:addinstance','write',50,'mod_quiz',4),(274,'mod/quiz:attempt','write',70,'mod_quiz',16),(275,'mod/quiz:reviewmyattempts','read',70,'mod_quiz',0),(276,'mod/quiz:manage','write',70,'mod_quiz',16),(277,'mod/quiz:manageoverrides','write',70,'mod_quiz',0),(278,'mod/quiz:preview','write',70,'mod_quiz',0),(279,'mod/quiz:grade','write',70,'mod_quiz',16),(280,'mod/quiz:regrade','write',70,'mod_quiz',16),(281,'mod/quiz:viewreports','read',70,'mod_quiz',8),(282,'mod/quiz:deleteattempts','write',70,'mod_quiz',32),(283,'mod/quiz:ignoretimelimits','read',70,'mod_quiz',0),(284,'mod/quiz:emailconfirmsubmission','read',70,'mod_quiz',0),(285,'mod/quiz:emailnotifysubmission','read',70,'mod_quiz',0),(286,'mod/quiz:emailwarnoverdue','read',70,'mod_quiz',0),(287,'mod/resource:view','read',70,'mod_resource',0),(288,'mod/resource:addinstance','write',50,'mod_resource',4),(289,'mod/scorm:addinstance','write',50,'mod_scorm',4),(290,'mod/scorm:viewreport','read',70,'mod_scorm',0),(291,'mod/scorm:skipview','write',70,'mod_scorm',0),(292,'mod/scorm:savetrack','write',70,'mod_scorm',0),(293,'mod/scorm:viewscores','read',70,'mod_scorm',0),(294,'mod/scorm:deleteresponses','read',70,'mod_scorm',0),(295,'mod/scorm:deleteownresponses','write',70,'mod_scorm',0),(296,'mod/survey:addinstance','write',50,'mod_survey',4),(297,'mod/survey:participate','read',70,'mod_survey',0),(298,'mod/survey:readresponses','read',70,'mod_survey',0),(299,'mod/survey:download','read',70,'mod_survey',0),(300,'mod/url:view','read',70,'mod_url',0),(301,'mod/url:addinstance','write',50,'mod_url',4),(302,'mod/wiki:addinstance','write',50,'mod_wiki',4),(303,'mod/wiki:viewpage','read',70,'mod_wiki',0),(304,'mod/wiki:editpage','write',70,'mod_wiki',16),(305,'mod/wiki:createpage','write',70,'mod_wiki',16),(306,'mod/wiki:viewcomment','read',70,'mod_wiki',0),(307,'mod/wiki:editcomment','write',70,'mod_wiki',16),(308,'mod/wiki:managecomment','write',70,'mod_wiki',0),(309,'mod/wiki:managefiles','write',70,'mod_wiki',0),(310,'mod/wiki:overridelock','write',70,'mod_wiki',0),(311,'mod/wiki:managewiki','write',70,'mod_wiki',0),(312,'mod/workshop:view','read',70,'mod_workshop',0),(313,'mod/workshop:addinstance','write',50,'mod_workshop',4),(314,'mod/workshop:switchphase','write',70,'mod_workshop',0),(315,'mod/workshop:editdimensions','write',70,'mod_workshop',4),(316,'mod/workshop:submit','write',70,'mod_workshop',0),(317,'mod/workshop:peerassess','write',70,'mod_workshop',0),(318,'mod/workshop:manageexamples','write',70,'mod_workshop',0),(319,'mod/workshop:allocate','write',70,'mod_workshop',0),(320,'mod/workshop:publishsubmissions','write',70,'mod_workshop',0),(321,'mod/workshop:viewauthornames','read',70,'mod_workshop',0),(322,'mod/workshop:viewreviewernames','read',70,'mod_workshop',0),(323,'mod/workshop:viewallsubmissions','read',70,'mod_workshop',0),(324,'mod/workshop:viewpublishedsubmissions','read',70,'mod_workshop',0),(325,'mod/workshop:viewauthorpublished','read',70,'mod_workshop',0),(326,'mod/workshop:viewallassessments','read',70,'mod_workshop',0),(327,'mod/workshop:overridegrades','write',70,'mod_workshop',0),(328,'mod/workshop:ignoredeadlines','write',70,'mod_workshop',0),(329,'enrol/authorize:config','write',50,'enrol_authorize',0),(330,'enrol/authorize:manage','write',50,'enrol_authorize',0),(331,'enrol/authorize:unenrol','write',50,'enrol_authorize',0),(332,'enrol/authorize:unenrolself','write',50,'enrol_authorize',0),(333,'enrol/authorize:managepayments','write',10,'enrol_authorize',8),(334,'enrol/authorize:uploadcsv','write',10,'enrol_authorize',4),(335,'enrol/category:synchronised','write',10,'enrol_category',0),(336,'enrol/cohort:config','write',50,'enrol_cohort',0),(337,'enrol/cohort:unenrol','write',50,'enrol_cohort',0),(338,'enrol/database:unenrol','write',50,'enrol_database',0),(339,'enrol/guest:config','write',50,'enrol_guest',0),(340,'enrol/ldap:manage','write',50,'enrol_ldap',0),(341,'enrol/manual:config','write',50,'enrol_manual',0),(342,'enrol/manual:enrol','write',50,'enrol_manual',0),(343,'enrol/manual:manage','write',50,'enrol_manual',0),(344,'enrol/manual:unenrol','write',50,'enrol_manual',0),(345,'enrol/manual:unenrolself','write',50,'enrol_manual',0),(346,'enrol/meta:config','write',50,'enrol_meta',0),(347,'enrol/meta:selectaslinked','read',50,'enrol_meta',0),(348,'enrol/meta:unenrol','write',50,'enrol_meta',0),(349,'enrol/paypal:config','write',50,'enrol_paypal',0),(350,'enrol/paypal:manage','write',50,'enrol_paypal',0),(351,'enrol/paypal:unenrol','write',50,'enrol_paypal',0),(352,'enrol/paypal:unenrolself','write',50,'enrol_paypal',0),(353,'enrol/self:config','write',50,'enrol_self',0),(354,'enrol/self:manage','write',50,'enrol_self',0),(355,'enrol/self:unenrolself','write',50,'enrol_self',0),(356,'enrol/self:unenrol','write',50,'enrol_self',0),(357,'block/online_users:viewlist','read',80,'block_online_users',0),(358,'block/rss_client:manageownfeeds','write',80,'block_rss_client',0),(359,'block/rss_client:manageanyfeeds','write',80,'block_rss_client',16),(360,'report/completion:view','read',50,'report_completion',8),(361,'report/courseoverview:view','read',10,'report_courseoverview',8),(362,'report/log:view','read',50,'report_log',8),(363,'report/log:viewtoday','read',50,'report_log',8),(364,'report/loglive:view','read',50,'report_loglive',8),(365,'report/outline:view','read',50,'report_outline',8),(366,'report/participation:view','read',50,'report_participation',8),(367,'report/progress:view','read',50,'report_progress',8),(368,'report/questioninstances:view','read',10,'report_questioninstances',0),(369,'report/security:view','read',10,'report_security',2),(370,'report/stats:view','read',50,'report_stats',8),(371,'gradeexport/ods:view','read',50,'gradeexport_ods',8),(372,'gradeexport/ods:publish','read',50,'gradeexport_ods',8),(373,'gradeexport/txt:view','read',50,'gradeexport_txt',8),(374,'gradeexport/txt:publish','read',50,'gradeexport_txt',8),(375,'gradeexport/xls:view','read',50,'gradeexport_xls',8),(376,'gradeexport/xls:publish','read',50,'gradeexport_xls',8),(377,'gradeexport/xml:view','read',50,'gradeexport_xml',8),(378,'gradeexport/xml:publish','read',50,'gradeexport_xml',8),(379,'gradeimport/csv:view','write',50,'gradeimport_csv',0),(380,'gradeimport/xml:view','write',50,'gradeimport_xml',0),(381,'gradeimport/xml:publish','write',50,'gradeimport_xml',0),(382,'gradereport/grader:view','read',50,'gradereport_grader',8),(383,'gradereport/outcomes:view','read',50,'gradereport_outcomes',8),(384,'gradereport/overview:view','read',50,'gradereport_overview',8),(385,'gradereport/user:view','read',50,'gradereport_user',8),(386,'webservice/amf:use','read',50,'webservice_amf',62),(387,'webservice/rest:use','read',50,'webservice_rest',62),(388,'webservice/soap:use','read',50,'webservice_soap',62),(389,'webservice/xmlrpc:use','read',50,'webservice_xmlrpc',62),(390,'repository/alfresco:view','read',70,'repository_alfresco',0),(391,'repository/boxnet:view','read',70,'repository_boxnet',0),(392,'repository/coursefiles:view','read',70,'repository_coursefiles',0),(393,'repository/dropbox:view','read',70,'repository_dropbox',0),(394,'repository/equella:view','read',70,'repository_equella',0),(395,'repository/filesystem:view','read',70,'repository_filesystem',0),(396,'repository/flickr:view','read',70,'repository_flickr',0),(397,'repository/flickr_public:view','read',70,'repository_flickr_public',0),(398,'repository/googledocs:view','read',70,'repository_googledocs',0),(399,'repository/local:view','read',70,'repository_local',0),(400,'repository/merlot:view','read',70,'repository_merlot',0),(401,'repository/picasa:view','read',70,'repository_picasa',0),(402,'repository/recent:view','read',70,'repository_recent',0),(403,'repository/s3:view','read',70,'repository_s3',0),(404,'repository/upload:view','read',70,'repository_upload',0),(405,'repository/url:view','read',70,'repository_url',0),(406,'repository/user:view','read',70,'repository_user',0),(407,'repository/webdav:view','read',70,'repository_webdav',0),(408,'repository/wikimedia:view','read',70,'repository_wikimedia',0),(409,'repository/youtube:view','read',70,'repository_youtube',0),(410,'tool/customlang:view','read',10,'tool_customlang',2),(411,'tool/customlang:edit','write',10,'tool_customlang',6),(413,'booktool/exportimscp:export','read',70,'booktool_exportimscp',0),(414,'booktool/importhtml:import','write',70,'booktool_importhtml',4),(415,'booktool/print:print','read',70,'booktool_print',0),(416,'quiz/grading:viewstudentnames','read',70,'quiz_grading',0),(417,'quiz/grading:viewidnumber','read',70,'quiz_grading',0),(418,'quiz/statistics:view','read',70,'quiz_statistics',0),(419,'moodle/user:ignoreuserquota','write',10,'moodle',0),(420,'moodle/course:movesections','write',50,'moodle',0),(421,'moodle/tag:flag','write',10,'moodle',16),(422,'mod/assign:grantextension','write',70,'mod_assign',0),(423,'mod/assign:revealidentities','write',70,'mod_assign',0),(424,'mod/autoview:canedit','write',70,'mod_autoview',0),(425,'mod/autoview:canrecordflash','write',70,'mod_autoview',0),(426,'mod/autoview:canbroadcastflash','write',70,'mod_autoview',0),(427,'mod/autoview:canconvertdocument','write',70,'mod_autoview',0),(428,'mod/autoview:viewpresentation','read',70,'mod_autoview',0),(429,'mod/data:exportuserinfo','read',70,'mod_data',8),(430,'enrol/payanyway:config','write',50,'enrol_payanyway',0),(431,'enrol/payanyway:manage','write',50,'enrol_payanyway',0),(432,'enrol/payanyway:unenrol','write',50,'enrol_payanyway',0),(433,'enrol/payanyway:unenrolself','write',50,'enrol_payanyway',0),(434,'block/activity_modules:addinstance','write',80,'block_activity_modules',20),(435,'block/admin_bookmarks:myaddinstance','write',10,'block_admin_bookmarks',0),(436,'block/admin_bookmarks:addinstance','write',80,'block_admin_bookmarks',20),(437,'block/blog_menu:addinstance','write',80,'block_blog_menu',20),(438,'block/blog_recent:addinstance','write',80,'block_blog_recent',20),(439,'block/blog_tags:addinstance','write',80,'block_blog_tags',20),(440,'block/calendar_month:myaddinstance','write',10,'block_calendar_month',0),(441,'block/calendar_month:addinstance','write',80,'block_calendar_month',20),(442,'block/calendar_upcoming:myaddinstance','write',10,'block_calendar_upcoming',0),(443,'block/calendar_upcoming:addinstance','write',80,'block_calendar_upcoming',20),(444,'block/comments:myaddinstance','write',10,'block_comments',0),(445,'block/comments:addinstance','write',80,'block_comments',20),(446,'block/community:myaddinstance','write',10,'block_community',0),(447,'block/community:addinstance','write',80,'block_community',20),(448,'block/completionstatus:addinstance','write',80,'block_completionstatus',20),(449,'block/course_list:myaddinstance','write',10,'block_course_list',0),(450,'block/course_list:addinstance','write',80,'block_course_list',20),(451,'block/course_overview:myaddinstance','write',10,'block_course_overview',0),(452,'block/course_summary:addinstance','write',80,'block_course_summary',20),(453,'block/feedback:addinstance','write',80,'block_feedback',20),(454,'block/glossary_random:addinstance','write',80,'block_glossary_random',20),(455,'block/html:myaddinstance','write',10,'block_html',0),(456,'block/html:addinstance','write',80,'block_html',20),(457,'block/login:addinstance','write',80,'block_login',20),(458,'block/mentees:addinstance','write',80,'block_mentees',20),(459,'block/messages:myaddinstance','write',10,'block_messages',0),(460,'block/messages:addinstance','write',80,'block_messages',20),(461,'block/mnet_hosts:myaddinstance','write',10,'block_mnet_hosts',0),(462,'block/mnet_hosts:addinstance','write',80,'block_mnet_hosts',20),(463,'block/myprofile:myaddinstance','write',10,'block_myprofile',0),(464,'block/myprofile:addinstance','write',80,'block_myprofile',20),(465,'block/navigation:myaddinstance','write',10,'block_navigation',0),(466,'block/navigation:addinstance','write',80,'block_navigation',20),(467,'block/news_items:addinstance','write',80,'block_news_items',20),(468,'block/online_users:addinstance','write',80,'block_online_users',20),(469,'block/participants:addinstance','write',80,'block_participants',20),(470,'block/private_files:myaddinstance','write',10,'block_private_files',0),(471,'block/private_files:addinstance','write',80,'block_private_files',20),(472,'block/quiz_results:addinstance','write',80,'block_quiz_results',20),(473,'block/recent_activity:addinstance','write',80,'block_recent_activity',20),(474,'block/rss_client:myaddinstance','write',10,'block_rss_client',0),(475,'block/rss_client:addinstance','write',80,'block_rss_client',20),(476,'block/search_forums:addinstance','write',80,'block_search_forums',20),(477,'block/section_links:addinstance','write',80,'block_section_links',20),(478,'block/selfcompletion:addinstance','write',80,'block_selfcompletion',20),(479,'block/settings:myaddinstance','write',10,'block_settings',0),(480,'block/settings:addinstance','write',80,'block_settings',20),(481,'block/site_main_menu:addinstance','write',80,'block_site_main_menu',20),(482,'block/social_activities:addinstance','write',80,'block_social_activities',20),(483,'block/tag_flickr:addinstance','write',80,'block_tag_flickr',20),(484,'block/tag_youtube:addinstance','write',80,'block_tag_youtube',20),(485,'block/tags:myaddinstance','write',10,'block_tags',0),(486,'block/tags:addinstance','write',80,'block_tags',20),(487,'repository/coursefilearea:view','read',70,'repository_coursefilearea',0);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat`
--

LOCK TABLES `mdl_chat` WRITE;
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages_current`
--

DROP TABLE IF EXISTS `mdl_chat_messages_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages_current`
--

LOCK TABLES `mdl_chat_messages_current` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_users`
--

LOCK TABLES `mdl_chat_users` WRITE;
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice`
--

LOCK TABLES `mdl_choice` WRITE;
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_answers`
--

LOCK TABLES `mdl_choice_answers` WRITE;
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_options`
--

LOCK TABLES `mdl_choice_options` WRITE;
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort`
--

DROP TABLE IF EXISTS `mdl_cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort`
--

LOCK TABLES `mdl_cohort` WRITE;
/*!40000 ALTER TABLE `mdl_cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort_members`
--

DROP TABLE IF EXISTS `mdl_cohort_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort_members`
--

LOCK TABLES `mdl_cohort_members` WRITE;
/*!40000 ALTER TABLE `mdl_cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_comments`
--

DROP TABLE IF EXISTS `mdl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_comments`
--

LOCK TABLES `mdl_comments` WRITE;
/*!40000 ALTER TABLE `mdl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config`
--

LOCK TABLES `mdl_config` WRITE;
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` VALUES (2,'rolesactive','1'),(3,'auth','email'),(4,'auth_pop3mailbox','INBOX'),(5,'enrol_plugins_enabled','manual,guest,self,cohort'),(6,'theme','standard'),(7,'filter_multilang_converted','1'),(8,'siteidentifier','dtSiZ5O2JyFwAzo7TA4OgBOpKGN5rOSvmoodle.opensoftdev.ru'),(9,'backup_version','2008111700'),(10,'backup_release','2.0 dev'),(11,'mnet_dispatcher_mode','off'),(12,'sessiontimeout','7200'),(13,'stringfilters',''),(14,'filterall','0'),(15,'texteditors','tinymce,textarea'),(16,'mnet_localhost_id','1'),(17,'mnet_all_hosts_id','2'),(18,'siteguest','1'),(19,'siteadmins','2,3'),(20,'themerev','1363018402'),(21,'jsrev','1363018402'),(22,'licenses','unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),(23,'version','2012120301'),(24,'enableoutcomes','0'),(25,'usecomments','1'),(26,'usetags','1'),(27,'enablenotes','1'),(28,'enableportfolios','0'),(29,'enablewebservices','0'),(30,'messaging','1'),(31,'messaginghidereadnotifications','0'),(32,'messagingdeletereadnotificationsdelay','604800'),(33,'messagingallowemailoverride','0'),(34,'enablestats','0'),(35,'enablerssfeeds','0'),(36,'bloglevel','4'),(37,'enablecompletion','0'),(38,'enableavailability','0'),(39,'enableplagiarism','0'),(40,'autologinguests','0'),(41,'hiddenuserfields',''),(42,'showuseridentity','email'),(43,'enablegravatar','0'),(44,'gravatardefaulturl','mm'),(45,'enablecourserequests','0'),(46,'defaultrequestcategory','1'),(47,'courserequestnotify',''),(48,'grade_profilereport','user'),(49,'grade_aggregationposition','1'),(50,'grade_includescalesinaggregation','1'),(51,'grade_hiddenasdate','0'),(52,'gradepublishing','0'),(53,'grade_export_displaytype','1'),(54,'grade_export_decimalpoints','2'),(55,'grade_navmethod','0'),(56,'recovergradesdefault','0'),(57,'gradeexport',''),(58,'unlimitedgrades','0'),(59,'grade_hideforcedsettings','1'),(60,'grade_aggregation','11'),(61,'grade_aggregation_flag','0'),(62,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13'),(63,'grade_aggregateonlygraded','1'),(64,'grade_aggregateonlygraded_flag','2'),(65,'grade_aggregateoutcomes','0'),(66,'grade_aggregateoutcomes_flag','2'),(67,'grade_aggregatesubcats','0'),(68,'grade_aggregatesubcats_flag','2'),(69,'grade_keephigh','0'),(70,'grade_keephigh_flag','3'),(71,'grade_droplow','0'),(72,'grade_droplow_flag','2'),(73,'grade_displaytype','1'),(74,'grade_decimalpoints','2'),(75,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),(76,'grade_report_studentsperpage','100'),(77,'grade_report_quickgrading','1'),(78,'grade_report_showquickfeedback','0'),(79,'grade_report_fixedstudents','0'),(80,'grade_report_meanselection','1'),(81,'grade_report_enableajax','0'),(82,'grade_report_showcalculations','0'),(83,'grade_report_showeyecons','0'),(84,'grade_report_showaverages','1'),(85,'grade_report_showlocks','0'),(86,'grade_report_showranges','0'),(87,'grade_report_showanalysisicon','1'),(88,'grade_report_showuserimage','1'),(89,'grade_report_showactivityicons','1'),(90,'grade_report_shownumberofgrades','0'),(91,'grade_report_averagesdisplaytype','inherit'),(92,'grade_report_rangesdisplaytype','inherit'),(93,'grade_report_averagesdecimalpoints','inherit'),(94,'grade_report_rangesdecimalpoints','inherit'),(95,'grade_report_overview_showrank','0'),(96,'grade_report_overview_showtotalsifcontainhidden','0'),(97,'grade_report_user_showrank','0'),(98,'grade_report_user_showpercentage','1'),(99,'grade_report_user_showgrade','1'),(100,'grade_report_user_showfeedback','1'),(101,'grade_report_user_showrange','1'),(102,'grade_report_user_showweight','0'),(103,'grade_report_user_showaverage','0'),(104,'grade_report_user_showlettergrade','0'),(105,'grade_report_user_rangedecimals','0'),(106,'grade_report_user_showhiddenitems','1'),(107,'grade_report_user_showtotalsifcontainhidden','0'),(108,'timezone','99'),(109,'forcetimezone','99'),(110,'country','0'),(111,'defaultcity',''),(112,'geoipfile','/var/www/moodledata/geoip/GeoLiteCity.dat'),(114,'googlemapkey3',''),(115,'allcountrycodes',''),(116,'autolang','1'),(117,'lang','ru'),(118,'langmenu','1'),(119,'langlist',''),(120,'langcache','1'),(121,'langstringcache','1'),(122,'locale',''),(123,'latinexcelexport','0'),(124,'registerauth',''),(125,'authpreventaccountcreation','0'),(126,'loginpageautofocus','0'),(127,'guestloginbutton','1'),(128,'alternateloginurl',''),(129,'forgottenpasswordurl',''),(130,'auth_instructions',''),(131,'allowemailaddresses',''),(132,'denyemailaddresses',''),(133,'verifychangedemail','1'),(134,'recaptchapublickey',''),(135,'recaptchaprivatekey',''),(136,'sitedefaultlicense','allrightsreserved'),(137,'cachetext','60'),(138,'filteruploadedfiles','0'),(139,'filtermatchoneperpage','0'),(140,'filtermatchonepertext','0'),(141,'filter_multilang_force_old','0'),(142,'filter_tex_latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),(143,'filter_tex_latexbackground','#FFFFFF'),(144,'filter_tex_density','120'),(145,'filter_tex_pathlatex','/usr/bin/latex'),(146,'filter_tex_pathdvips','/usr/bin/dvips'),(147,'filter_tex_pathconvert','/usr/bin/convert'),(148,'filter_tex_convertformat','gif'),(149,'filter_censor_badwords',''),(150,'portfolio_moderate_filesize_threshold','1048576'),(151,'portfolio_high_filesize_threshold','5242880'),(152,'portfolio_moderate_db_threshold','20'),(153,'portfolio_high_db_threshold','50'),(154,'repositorycacheexpire','120'),(155,'repositoryallowexternallinks','1'),(156,'legacyfilesinnewcourses','0'),(157,'enablewsdocumentation','0'),(158,'allowbeforeblock','0'),(159,'allowedip',''),(160,'blockedip',''),(161,'protectusernames','1'),(162,'forcelogin','0'),(163,'forceloginforprofiles','1'),(164,'forceloginforprofileimage','0'),(165,'opentogoogle','0'),(166,'maxbytes','0'),(167,'userquota','104857600'),(168,'allowobjectembed','0'),(169,'enabletrusttext','0'),(170,'maxeditingtime','1800'),(171,'fullnamedisplay','language'),(172,'extendedusernamechars','0'),(173,'sitepolicy',''),(174,'sitepolicyguest',''),(175,'keeptagnamecase','1'),(176,'profilesforenrolledusersonly','1'),(177,'cronclionly','0'),(178,'cronremotepassword',''),(179,'passwordpolicy','1'),(180,'minpasswordlength','8'),(181,'minpassworddigits','1'),(182,'minpasswordlower','1'),(183,'minpasswordupper','1'),(184,'minpasswordnonalphanum','1'),(185,'maxconsecutiveidentchars','0'),(186,'groupenrolmentkeypolicy','1'),(187,'disableuserimages','0'),(188,'emailchangeconfirmation','1'),(189,'rememberusername','2'),(190,'strictformsrequired','0'),(191,'loginhttps','0'),(192,'cookiesecure','0'),(193,'cookiehttponly','0'),(194,'allowframembedding','0'),(195,'loginpasswordautocomplete','0'),(196,'displayloginfailures',''),(197,'notifyloginfailures',''),(198,'notifyloginthreshold','10'),(199,'runclamonupload','0'),(200,'pathtoclam',''),(201,'quarantinedir',''),(202,'clamfailureonupload','donothing'),(203,'themelist',''),(204,'themedesignermode','0'),(205,'allowuserthemes','0'),(206,'allowcoursethemes','0'),(207,'allowcategorythemes','0'),(208,'allowthemechangeonurl','0'),(209,'allowuserblockhiding','1'),(210,'allowblockstodock','1'),(211,'custommenuitems',''),(212,'enabledevicedetection','1'),(213,'devicedetectregex','[]'),(214,'calendar_adminseesall','0'),(215,'calendar_site_timeformat','0'),(216,'calendar_startwday','0'),(217,'calendar_weekend','65'),(218,'calendar_lookahead','21'),(219,'calendar_maxevents','10'),(220,'enablecalendarexport','1'),(221,'calendar_exportsalt','F6ud3pR0AzyVOTyqR92KzWtByk36QGZ1EVMqD59j79yAdLjKhrxuKE76F1Bf'),(222,'useblogassociations','1'),(223,'useexternalblogs','1'),(224,'externalblogcrontime','86400'),(225,'maxexternalblogsperuser','1'),(226,'blogusecomments','1'),(227,'blogshowcommentscount','1'),(228,'defaulthomepage','0'),(229,'navshowcategories','1'),(230,'navshowmycoursecategories','0'),(231,'navshowallcourses','0'),(232,'navcourselimit','20'),(233,'usesitenameforsitepages','0'),(234,'linkadmincategories','0'),(235,'navshowfrontpagemods','1'),(236,'navadduserpostslinks','1'),(237,'formatstringstriptags','1'),(238,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]'),(239,'core_media_enable_youtube','1'),(240,'core_media_enable_vimeo','0'),(241,'core_media_enable_mp3','1'),(242,'core_media_enable_flv','1'),(243,'core_media_enable_swf','1'),(244,'core_media_enable_html5audio','1'),(245,'core_media_enable_html5video','1'),(246,'core_media_enable_qt','1'),(247,'core_media_enable_wmp','1'),(248,'core_media_enable_rm','1'),(249,'docroot','http://docs.moodle.org'),(250,'doctonewwindow','0'),(251,'courselistshortnames','0'),(252,'enableajax','1'),(253,'useexternalyui','0'),(254,'yuicomboloading','1'),(255,'cachejs','1'),(256,'modchooserdefault','1'),(257,'additionalhtmlhead',''),(258,'additionalhtmltopofbody',''),(259,'additionalhtmlfooter',''),(260,'gdversion','0'),(261,'pathtodu',''),(262,'aspellpath',''),(263,'pathtodot',''),(264,'supportpage',''),(265,'dbsessions','1'),(266,'sessioncookie',''),(267,'sessioncookiepath',''),(268,'sessioncookiedomain',''),(269,'statsfirstrun','none'),(270,'statsmaxruntime','0'),(271,'statsruntimedays','31'),(272,'statsruntimestarthour','0'),(273,'statsruntimestartminute','0'),(274,'statsuserthreshold','0'),(275,'slasharguments','1'),(276,'getremoteaddrconf','0'),(277,'proxyhost',''),(278,'proxyport','0'),(279,'proxytype','HTTP'),(280,'proxyuser',''),(281,'proxypassword',''),(282,'proxybypass','localhost, 127.0.0.1'),(283,'maintenance_enabled','0'),(284,'maintenance_message',''),(285,'deleteunconfirmed','168'),(286,'deleteincompleteusers','0'),(287,'logguests','1'),(288,'loglifetime','0'),(289,'disablegradehistory','0'),(290,'gradehistorylifetime','0'),(291,'numcoursesincombo','500'),(292,'extramemorylimit','512M'),(293,'curlcache','120'),(294,'curltimeoutkbitrate','56'),(295,'updateautocheck','1'),(296,'updateminmaturity','200'),(297,'updatenotifybuilds','0'),(298,'enablesafebrowserintegration','0'),(299,'enablegroupmembersonly','0'),(300,'dndallowtextandlinks','0'),(301,'enablecssoptimiser','0'),(302,'debug','0'),(303,'debugdisplay','1'),(305,'debugsmtp','0'),(306,'perfdebug','7'),(307,'debugstringids','0'),(308,'debugvalidators','0'),(309,'debugpageinfo','0'),(310,'release','2.4.1 (Build: 20130114)'),(311,'branch','24'),(312,'notloggedinroleid','6'),(313,'guestroleid','6'),(314,'defaultuserroleid','7'),(315,'creatornewroleid','3'),(316,'restorernewroleid','3'),(317,'gradebookroles','5'),(318,'assignment_maxbytes','1048576'),(319,'assignment_itemstocount','1'),(320,'assignment_showrecentsubmissions','1'),(321,'chat_method','ajax'),(322,'chat_refresh_userlist','10'),(323,'chat_old_ping','35'),(324,'chat_refresh_room','5'),(325,'chat_normal_updatemode','jsupdate'),(326,'chat_serverhost','moodle.opensoftdev.ru'),(327,'chat_serverip','127.0.0.1'),(328,'chat_serverport','9111'),(329,'chat_servermax','100'),(330,'data_enablerssfeeds','0'),(331,'feedback_allowfullanonymous','0'),(332,'forum_displaymode','3'),(333,'forum_replytouser','1'),(334,'forum_shortpost','300'),(335,'forum_longpost','600'),(336,'forum_manydiscussions','100'),(337,'forum_maxbytes','512000'),(338,'forum_maxattachments','9'),(339,'forum_trackreadposts','1'),(340,'forum_oldpostdays','14'),(341,'forum_usermarksread','0'),(342,'forum_cleanreadtime','2'),(343,'digestmailtime','17'),(344,'forum_enablerssfeeds','0'),(345,'forum_enabletimedposts','0'),(346,'glossary_entbypage','10'),(347,'glossary_dupentries','0'),(348,'glossary_allowcomments','0'),(349,'glossary_linkbydefault','1'),(350,'glossary_defaultapproval','1'),(351,'glossary_enablerssfeeds','0'),(352,'glossary_linkentries','0'),(353,'glossary_casesensitive','0'),(354,'glossary_fullmatch','0'),(355,'lesson_slideshowwidth','640'),(356,'lesson_slideshowheight','480'),(357,'lesson_slideshowbgcolor','#FFFFFF'),(358,'lesson_mediawidth','640'),(359,'lesson_mediaheight','480'),(360,'lesson_mediaclose','0'),(361,'lesson_maxhighscores','10'),(362,'lesson_maxanswers','4'),(363,'lesson_defaultnextpage','0'),(364,'block_course_list_adminview','all'),(365,'block_course_list_hideallcourseslink','0'),(366,'block_online_users_timetosee','5'),(367,'block_rss_client_num_entries','5'),(368,'block_rss_client_timeout','30'),(369,'block_tags_showcoursetags','0'),(370,'jabberhost',''),(371,'jabberserver',''),(372,'jabberusername',''),(373,'jabberpassword',''),(374,'jabberport','5222'),(375,'smtphosts',''),(376,'smtpsecure',''),(377,'smtpuser',''),(378,'smtppass',''),(379,'smtpmaxbulk','1'),(380,'noreplyaddress','noreply@moodle.opensoftdev.ru'),(381,'sitemailcharset','0'),(382,'allowusermailcharset','0'),(383,'mailnewline','LF'),(384,'enablemobilewebservice','0'),(385,'profileroles','5,4,3'),(386,'coursecontact','3'),(387,'frontpage','1'),(388,'frontpageloggedin','1'),(389,'maxcategorydepth','0'),(390,'commentsperpage','15'),(391,'coursesperpage','20'),(392,'defaultfrontpageroleid','8'),(393,'supportname','Администратор Пользователь'),(394,'supportemail',''),(395,'digestmailtimelast','1363611601'),(396,'forum_lastreadclean','1363661102'),(397,'scorm_updatetimelast','1363636802'),(398,'fileslastcleanup','1363661102'),(399,'updatecronoffset','3936'),(400,'langrev','1363018402'),(402,'enableblogs','1');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_log`
--

DROP TABLE IF EXISTS `mdl_config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=776 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_log`
--

LOCK TABLES `mdl_config_log` WRITE;
/*!40000 ALTER TABLE `mdl_config_log` DISABLE KEYS */;
INSERT INTO `mdl_config_log` VALUES (1,0,1352713753,NULL,'enableoutcomes','0',NULL),(2,0,1352713753,NULL,'usecomments','1',NULL),(3,0,1352713753,NULL,'usetags','1',NULL),(4,0,1352713753,NULL,'enablenotes','1',NULL),(5,0,1352713753,NULL,'enableportfolios','0',NULL),(6,0,1352713753,NULL,'enablewebservices','0',NULL),(7,0,1352713753,NULL,'messaging','1',NULL),(8,0,1352713753,NULL,'messaginghidereadnotifications','0',NULL),(9,0,1352713753,NULL,'messagingdeletereadnotificationsdelay','604800',NULL),(10,0,1352713753,NULL,'messagingallowemailoverride','0',NULL),(11,0,1352713753,NULL,'enablestats','0',NULL),(12,0,1352713753,NULL,'enablerssfeeds','0',NULL),(13,0,1352713753,NULL,'bloglevel','4',NULL),(14,0,1352713753,NULL,'enablecompletion','0',NULL),(15,0,1352713753,NULL,'enableavailability','0',NULL),(16,0,1352713753,NULL,'enableplagiarism','0',NULL),(17,0,1352713753,NULL,'autologinguests','0',NULL),(18,0,1352713753,NULL,'hiddenuserfields','',NULL),(19,0,1352713753,NULL,'showuseridentity','email',NULL),(20,0,1352713753,NULL,'enablegravatar','0',NULL),(21,0,1352713753,NULL,'gravatardefaulturl','mm',NULL),(22,0,1352713753,'moodlecourse','format','weeks',NULL),(23,0,1352713753,'moodlecourse','maxsections','52',NULL),(24,0,1352713753,'moodlecourse','numsections','10',NULL),(25,0,1352713753,'moodlecourse','hiddensections','0',NULL),(26,0,1352713753,'moodlecourse','newsitems','5',NULL),(27,0,1352713753,'moodlecourse','showgrades','1',NULL),(28,0,1352713753,'moodlecourse','showreports','0',NULL),(29,0,1352713753,'moodlecourse','maxbytes','2097152',NULL),(30,0,1352713753,'moodlecourse','coursedisplay','0',NULL),(31,0,1352713753,'moodlecourse','groupmode','0',NULL),(32,0,1352713753,'moodlecourse','groupmodeforce','0',NULL),(33,0,1352713753,'moodlecourse','visible','1',NULL),(34,0,1352713753,'moodlecourse','lang','',NULL),(35,0,1352713753,'moodlecourse','enablecompletion','0',NULL),(36,0,1352713753,'moodlecourse','completionstartonenrol','0',NULL),(37,0,1352713753,NULL,'enablecourserequests','0',NULL),(38,0,1352713753,NULL,'defaultrequestcategory','1',NULL),(39,0,1352713753,NULL,'courserequestnotify','',NULL),(40,0,1352713753,'backup','loglifetime','30',NULL),(41,0,1352713753,'backup','backup_general_users','1',NULL),(42,0,1352713753,'backup','backup_general_users_locked','0',NULL),(43,0,1352713753,'backup','backup_general_anonymize','0',NULL),(44,0,1352713753,'backup','backup_general_anonymize_locked','0',NULL),(45,0,1352713753,'backup','backup_general_role_assignments','1',NULL),(46,0,1352713753,'backup','backup_general_role_assignments_locked','0',NULL),(47,0,1352713753,'backup','backup_general_activities','1',NULL),(48,0,1352713753,'backup','backup_general_activities_locked','0',NULL),(49,0,1352713753,'backup','backup_general_blocks','1',NULL),(50,0,1352713753,'backup','backup_general_blocks_locked','0',NULL),(51,0,1352713753,'backup','backup_general_filters','1',NULL),(52,0,1352713753,'backup','backup_general_filters_locked','0',NULL),(53,0,1352713753,'backup','backup_general_comments','1',NULL),(54,0,1352713753,'backup','backup_general_comments_locked','0',NULL),(55,0,1352713753,'backup','backup_general_userscompletion','1',NULL),(56,0,1352713753,'backup','backup_general_userscompletion_locked','0',NULL),(57,0,1352713753,'backup','backup_general_logs','0',NULL),(58,0,1352713753,'backup','backup_general_logs_locked','0',NULL),(59,0,1352713753,'backup','backup_general_histories','0',NULL),(60,0,1352713753,'backup','backup_general_histories_locked','0',NULL),(61,0,1352713753,'backup','backup_auto_active','0',NULL),(62,0,1352713753,'backup','backup_auto_weekdays','0000000',NULL),(63,0,1352713753,'backup','backup_auto_hour','0',NULL),(64,0,1352713753,'backup','backup_auto_minute','0',NULL),(65,0,1352713753,'backup','backup_auto_storage','0',NULL),(66,0,1352713753,'backup','backup_auto_destination','',NULL),(67,0,1352713753,'backup','backup_auto_keep','1',NULL),(68,0,1352713753,'backup','backup_shortname','0',NULL),(69,0,1352713753,'backup','backup_auto_users','1',NULL),(70,0,1352713753,'backup','backup_auto_role_assignments','1',NULL),(71,0,1352713753,'backup','backup_auto_activities','1',NULL),(72,0,1352713753,'backup','backup_auto_blocks','1',NULL),(73,0,1352713753,'backup','backup_auto_filters','1',NULL),(74,0,1352713753,'backup','backup_auto_comments','1',NULL),(75,0,1352713753,'backup','backup_auto_userscompletion','1',NULL),(76,0,1352713753,'backup','backup_auto_logs','0',NULL),(77,0,1352713753,'backup','backup_auto_histories','0',NULL),(78,0,1352713753,NULL,'grade_profilereport','user',NULL),(79,0,1352713753,NULL,'grade_aggregationposition','1',NULL),(80,0,1352713753,NULL,'grade_includescalesinaggregation','1',NULL),(81,0,1352713753,NULL,'grade_hiddenasdate','0',NULL),(82,0,1352713753,NULL,'gradepublishing','0',NULL),(83,0,1352713753,NULL,'grade_export_displaytype','1',NULL),(84,0,1352713753,NULL,'grade_export_decimalpoints','2',NULL),(85,0,1352713753,NULL,'grade_navmethod','0',NULL),(86,0,1352713753,NULL,'recovergradesdefault','0',NULL),(87,0,1352713753,NULL,'gradeexport','',NULL),(88,0,1352713753,NULL,'unlimitedgrades','0',NULL),(89,0,1352713753,NULL,'grade_hideforcedsettings','1',NULL),(90,0,1352713753,NULL,'grade_aggregation','11',NULL),(91,0,1352713753,NULL,'grade_aggregation_flag','0',NULL),(92,0,1352713753,NULL,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13',NULL),(93,0,1352713753,NULL,'grade_aggregateonlygraded','1',NULL),(94,0,1352713753,NULL,'grade_aggregateonlygraded_flag','2',NULL),(95,0,1352713753,NULL,'grade_aggregateoutcomes','0',NULL),(96,0,1352713753,NULL,'grade_aggregateoutcomes_flag','2',NULL),(97,0,1352713753,NULL,'grade_aggregatesubcats','0',NULL),(98,0,1352713753,NULL,'grade_aggregatesubcats_flag','2',NULL),(99,0,1352713753,NULL,'grade_keephigh','0',NULL),(100,0,1352713753,NULL,'grade_keephigh_flag','3',NULL),(101,0,1352713753,NULL,'grade_droplow','0',NULL),(102,0,1352713753,NULL,'grade_droplow_flag','2',NULL),(103,0,1352713753,NULL,'grade_displaytype','1',NULL),(104,0,1352713753,NULL,'grade_decimalpoints','2',NULL),(105,0,1352713753,NULL,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime',NULL),(106,0,1352713753,NULL,'grade_report_studentsperpage','100',NULL),(107,0,1352713753,NULL,'grade_report_quickgrading','1',NULL),(108,0,1352713753,NULL,'grade_report_showquickfeedback','0',NULL),(109,0,1352713753,NULL,'grade_report_fixedstudents','0',NULL),(110,0,1352713753,NULL,'grade_report_meanselection','1',NULL),(111,0,1352713753,NULL,'grade_report_enableajax','0',NULL),(112,0,1352713753,NULL,'grade_report_showcalculations','0',NULL),(113,0,1352713753,NULL,'grade_report_showeyecons','0',NULL),(114,0,1352713754,NULL,'grade_report_showaverages','1',NULL),(115,0,1352713754,NULL,'grade_report_showlocks','0',NULL),(116,0,1352713754,NULL,'grade_report_showranges','0',NULL),(117,0,1352713754,NULL,'grade_report_showanalysisicon','1',NULL),(118,0,1352713754,NULL,'grade_report_showuserimage','1',NULL),(119,0,1352713754,NULL,'grade_report_showactivityicons','1',NULL),(120,0,1352713754,NULL,'grade_report_shownumberofgrades','0',NULL),(121,0,1352713754,NULL,'grade_report_averagesdisplaytype','inherit',NULL),(122,0,1352713754,NULL,'grade_report_rangesdisplaytype','inherit',NULL),(123,0,1352713754,NULL,'grade_report_averagesdecimalpoints','inherit',NULL),(124,0,1352713754,NULL,'grade_report_rangesdecimalpoints','inherit',NULL),(125,0,1352713754,NULL,'grade_report_overview_showrank','0',NULL),(126,0,1352713754,NULL,'grade_report_overview_showtotalsifcontainhidden','0',NULL),(127,0,1352713754,NULL,'grade_report_user_showrank','0',NULL),(128,0,1352713754,NULL,'grade_report_user_showpercentage','1',NULL),(129,0,1352713754,NULL,'grade_report_user_showgrade','1',NULL),(130,0,1352713754,NULL,'grade_report_user_showfeedback','1',NULL),(131,0,1352713754,NULL,'grade_report_user_showrange','1',NULL),(132,0,1352713754,NULL,'grade_report_user_showweight','0',NULL),(133,0,1352713754,NULL,'grade_report_user_showaverage','0',NULL),(134,0,1352713754,NULL,'grade_report_user_showlettergrade','0',NULL),(135,0,1352713754,NULL,'grade_report_user_rangedecimals','0',NULL),(136,0,1352713754,NULL,'grade_report_user_showhiddenitems','1',NULL),(137,0,1352713754,NULL,'grade_report_user_showtotalsifcontainhidden','0',NULL),(138,0,1352713754,NULL,'timezone','99',NULL),(139,0,1352713754,NULL,'forcetimezone','99',NULL),(140,0,1352713754,NULL,'country','0',NULL),(141,0,1352713754,NULL,'defaultcity','',NULL),(142,0,1352713754,NULL,'geoipfile','/var/www/moodledata/geoip/GeoLiteCity.dat',NULL),(143,0,1352713754,NULL,'googlemapkey','',NULL),(144,0,1352713754,NULL,'googlemapkey3','',NULL),(145,0,1352713754,NULL,'allcountrycodes','',NULL),(146,0,1352713754,NULL,'autolang','1',NULL),(147,0,1352713754,NULL,'lang','ru',NULL),(148,0,1352713754,NULL,'langmenu','1',NULL),(149,0,1352713754,NULL,'langlist','',NULL),(150,0,1352713754,NULL,'langcache','1',NULL),(151,0,1352713754,NULL,'langstringcache','1',NULL),(152,0,1352713754,NULL,'locale','',NULL),(153,0,1352713754,NULL,'latinexcelexport','0',NULL),(154,0,1352713754,NULL,'registerauth','',NULL),(155,0,1352713754,NULL,'authpreventaccountcreation','0',NULL),(156,0,1352713754,NULL,'loginpageautofocus','0',NULL),(157,0,1352713754,NULL,'guestloginbutton','1',NULL),(158,0,1352713754,NULL,'alternateloginurl','',NULL),(159,0,1352713754,NULL,'forgottenpasswordurl','',NULL),(160,0,1352713754,NULL,'auth_instructions','',NULL),(161,0,1352713754,NULL,'allowemailaddresses','',NULL),(162,0,1352713754,NULL,'denyemailaddresses','',NULL),(163,0,1352713754,NULL,'verifychangedemail','1',NULL),(164,0,1352713754,NULL,'recaptchapublickey','',NULL),(165,0,1352713754,NULL,'recaptchaprivatekey','',NULL),(166,0,1352713754,'enrol_database','dbtype','',NULL),(167,0,1352713754,'enrol_database','dbhost','localhost',NULL),(168,0,1352713754,'enrol_database','dbuser','',NULL),(169,0,1352713754,'enrol_database','dbpass','',NULL),(170,0,1352713754,'enrol_database','dbname','',NULL),(171,0,1352713754,'enrol_database','dbencoding','utf-8',NULL),(172,0,1352713754,'enrol_database','dbsetupsql','',NULL),(173,0,1352713754,'enrol_database','dbsybasequoting','0',NULL),(174,0,1352713754,'enrol_database','debugdb','0',NULL),(175,0,1352713754,'enrol_database','localcoursefield','idnumber',NULL),(176,0,1352713754,'enrol_database','localuserfield','idnumber',NULL),(177,0,1352713754,'enrol_database','localrolefield','shortname',NULL),(178,0,1352713754,'enrol_database','localcategoryfield','id',NULL),(179,0,1352713754,'enrol_database','remoteenroltable','',NULL),(180,0,1352713754,'enrol_database','remotecoursefield','',NULL),(181,0,1352713754,'enrol_database','remoteuserfield','',NULL),(182,0,1352713754,'enrol_database','remoterolefield','',NULL),(183,0,1352713754,'enrol_database','ignorehiddencourses','0',NULL),(184,0,1352713754,'enrol_database','unenrolaction','0',NULL),(185,0,1352713754,'enrol_database','newcoursetable','',NULL),(186,0,1352713754,'enrol_database','newcoursefullname','fullname',NULL),(187,0,1352713754,'enrol_database','newcourseshortname','shortname',NULL),(188,0,1352713754,'enrol_database','newcourseidnumber','idnumber',NULL),(189,0,1352713754,'enrol_database','newcoursecategory','',NULL),(190,0,1352713754,'enrol_database','templatecourse','',NULL),(191,0,1352713754,'enrol_flatfile','location','',NULL),(192,0,1352713754,'enrol_flatfile','mailstudents','0',NULL),(193,0,1352713754,'enrol_flatfile','mailteachers','0',NULL),(194,0,1352713754,'enrol_flatfile','mailadmins','0',NULL),(195,0,1352713754,'enrol_guest','requirepassword','0',NULL),(196,0,1352713754,'enrol_guest','usepasswordpolicy','0',NULL),(197,0,1352713754,'enrol_guest','showhint','0',NULL),(198,0,1352713754,'enrol_guest','defaultenrol','1',NULL),(199,0,1352713754,'enrol_guest','status','1',NULL),(200,0,1352713754,'enrol_guest','status_adv','0',NULL),(201,0,1352713754,'enrol_imsenterprise','imsfilelocation','',NULL),(202,0,1352713754,'enrol_imsenterprise','logtolocation','',NULL),(203,0,1352713754,'enrol_imsenterprise','mailadmins','0',NULL),(204,0,1352713754,'enrol_imsenterprise','createnewusers','0',NULL),(205,0,1352713754,'enrol_imsenterprise','imsdeleteusers','0',NULL),(206,0,1352713754,'enrol_imsenterprise','fixcaseusernames','0',NULL),(207,0,1352713754,'enrol_imsenterprise','fixcasepersonalnames','0',NULL),(208,0,1352713754,'enrol_imsenterprise','imssourcedidfallback','0',NULL),(209,0,1352713754,'enrol_imsenterprise','truncatecoursecodes','0',NULL),(210,0,1352713754,'enrol_imsenterprise','createnewcourses','0',NULL),(211,0,1352713754,'enrol_imsenterprise','createnewcategories','0',NULL),(212,0,1352713754,'enrol_imsenterprise','imsunenrol','0',NULL),(213,0,1352713754,'enrol_imsenterprise','imsrestricttarget','',NULL),(214,0,1352713754,'enrol_imsenterprise','imscapitafix','0',NULL),(215,0,1352713754,'enrol_manual','defaultenrol','1',NULL),(216,0,1352713754,'enrol_manual','status','0',NULL),(217,0,1352713754,'enrol_manual','enrolperiod','0',NULL),(218,0,1352713754,'enrol_paypal','paypalbusiness','',NULL),(219,0,1352713754,'enrol_paypal','mailstudents','0',NULL),(220,0,1352713754,'enrol_paypal','mailteachers','0',NULL),(221,0,1352713754,'enrol_paypal','mailadmins','0',NULL),(222,0,1352713754,'enrol_paypal','status','1',NULL),(223,0,1352713754,'enrol_paypal','cost','0',NULL),(224,0,1352713754,'enrol_paypal','currency','USD',NULL),(225,0,1352713754,'enrol_paypal','enrolperiod','0',NULL),(226,0,1352713754,'enrol_self','requirepassword','0',NULL),(227,0,1352713754,'enrol_self','usepasswordpolicy','0',NULL),(228,0,1352713754,'enrol_self','showhint','0',NULL),(229,0,1352713754,'enrol_self','defaultenrol','1',NULL),(230,0,1352713754,'enrol_self','status','1',NULL),(231,0,1352713754,'enrol_self','groupkey','0',NULL),(232,0,1352713754,'enrol_self','enrolperiod','0',NULL),(233,0,1352713754,'enrol_self','longtimenosee','0',NULL),(234,0,1352713754,'enrol_self','maxenrolled','0',NULL),(235,0,1352713754,'enrol_self','sendcoursewelcomemessage','1',NULL),(236,0,1352713754,'editor_tinymce','spellengine','GoogleSpell',NULL),(237,0,1352713754,'editor_tinymce','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv',NULL),(238,0,1352713754,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings',NULL),(239,0,1352713754,NULL,'sitedefaultlicense','allrightsreserved',NULL),(240,0,1352713754,NULL,'cachetext','60',NULL),(241,0,1352713754,NULL,'filteruploadedfiles','0',NULL),(242,0,1352713754,NULL,'filtermatchoneperpage','0',NULL),(243,0,1352713754,NULL,'filtermatchonepertext','0',NULL),(244,0,1352713754,NULL,'filter_multilang_force_old','0',NULL),(245,0,1352713754,'filter_emoticon','formats','1,4,0',NULL),(246,0,1352713754,'filter_urltolink','formats','0',NULL),(247,0,1352713754,'filter_urltolink','embedimages','1',NULL),(248,0,1352713754,NULL,'filter_tex_latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n',NULL),(249,0,1352713754,NULL,'filter_tex_latexbackground','#FFFFFF',NULL),(250,0,1352713754,NULL,'filter_tex_density','120',NULL),(251,0,1352713754,NULL,'filter_tex_pathlatex','/usr/bin/latex',NULL),(252,0,1352713754,NULL,'filter_tex_pathdvips','/usr/bin/dvips',NULL),(253,0,1352713754,NULL,'filter_tex_pathconvert','/usr/bin/convert',NULL),(254,0,1352713754,NULL,'filter_tex_convertformat','gif',NULL),(255,0,1352713754,NULL,'filter_censor_badwords','',NULL),(256,0,1352713754,NULL,'portfolio_moderate_filesize_threshold','1048576',NULL),(257,0,1352713754,NULL,'portfolio_high_filesize_threshold','5242880',NULL),(258,0,1352713754,NULL,'portfolio_moderate_db_threshold','20',NULL),(259,0,1352713754,NULL,'portfolio_high_db_threshold','50',NULL),(260,0,1352713754,NULL,'repositorycacheexpire','120',NULL),(261,0,1352713754,NULL,'repositoryallowexternallinks','1',NULL),(262,0,1352713754,NULL,'legacyfilesinnewcourses','0',NULL),(263,0,1352713754,NULL,'enablewsdocumentation','0',NULL),(264,0,1352713754,NULL,'allowbeforeblock','0',NULL),(265,0,1352713754,NULL,'allowedip','',NULL),(266,0,1352713754,NULL,'blockedip','',NULL),(267,0,1352713754,NULL,'protectusernames','1',NULL),(268,0,1352713754,NULL,'forcelogin','0',NULL),(269,0,1352713754,NULL,'forceloginforprofiles','1',NULL),(270,0,1352713754,NULL,'forceloginforprofileimage','0',NULL),(271,0,1352713754,NULL,'opentogoogle','0',NULL),(272,0,1352713754,NULL,'maxbytes','0',NULL),(273,0,1352713754,NULL,'userquota','104857600',NULL),(274,0,1352713754,NULL,'allowobjectembed','0',NULL),(275,0,1352713754,NULL,'enabletrusttext','0',NULL),(276,0,1352713754,NULL,'maxeditingtime','1800',NULL),(277,0,1352713754,NULL,'fullnamedisplay','language',NULL),(278,0,1352713754,NULL,'extendedusernamechars','0',NULL),(279,0,1352713754,NULL,'sitepolicy','',NULL),(280,0,1352713754,NULL,'sitepolicyguest','',NULL),(281,0,1352713754,NULL,'keeptagnamecase','1',NULL),(282,0,1352713754,NULL,'profilesforenrolledusersonly','1',NULL),(283,0,1352713754,NULL,'cronclionly','0',NULL),(284,0,1352713754,NULL,'cronremotepassword','',NULL),(285,0,1352713754,NULL,'passwordpolicy','1',NULL),(286,0,1352713754,NULL,'minpasswordlength','8',NULL),(287,0,1352713754,NULL,'minpassworddigits','1',NULL),(288,0,1352713754,NULL,'minpasswordlower','1',NULL),(289,0,1352713754,NULL,'minpasswordupper','1',NULL),(290,0,1352713754,NULL,'minpasswordnonalphanum','1',NULL),(291,0,1352713754,NULL,'maxconsecutiveidentchars','0',NULL),(292,0,1352713754,NULL,'groupenrolmentkeypolicy','1',NULL),(293,0,1352713754,NULL,'disableuserimages','0',NULL),(294,0,1352713754,NULL,'emailchangeconfirmation','1',NULL),(295,0,1352713754,NULL,'rememberusername','2',NULL),(296,0,1352713754,NULL,'strictformsrequired','0',NULL),(297,0,1352713754,NULL,'loginhttps','0',NULL),(298,0,1352713754,NULL,'cookiesecure','0',NULL),(299,0,1352713754,NULL,'cookiehttponly','0',NULL),(300,0,1352713754,NULL,'allowframembedding','0',NULL),(301,0,1352713754,NULL,'loginpasswordautocomplete','0',NULL),(302,0,1352713754,NULL,'displayloginfailures','',NULL),(303,0,1352713754,NULL,'notifyloginfailures','',NULL),(304,0,1352713754,NULL,'notifyloginthreshold','10',NULL),(305,0,1352713754,NULL,'runclamonupload','0',NULL),(306,0,1352713754,NULL,'pathtoclam','',NULL),(307,0,1352713754,NULL,'quarantinedir','',NULL),(308,0,1352713754,NULL,'clamfailureonupload','donothing',NULL),(309,0,1352713754,NULL,'themelist','',NULL),(310,0,1352713754,NULL,'themedesignermode','0',NULL),(311,0,1352713754,NULL,'allowuserthemes','0',NULL),(312,0,1352713754,NULL,'allowcoursethemes','0',NULL),(313,0,1352713754,NULL,'allowcategorythemes','0',NULL),(314,0,1352713754,NULL,'allowthemechangeonurl','0',NULL),(315,0,1352713754,NULL,'allowuserblockhiding','1',NULL),(316,0,1352713754,NULL,'allowblockstodock','1',NULL),(317,0,1352713754,NULL,'custommenuitems','',NULL),(318,0,1352713754,NULL,'enabledevicedetection','1',NULL),(319,0,1352713754,NULL,'devicedetectregex','[]',NULL),(320,0,1352713754,'theme_afterburner','logo','',NULL),(321,0,1352713754,'theme_afterburner','footnote','',NULL),(322,0,1352713754,'theme_afterburner','customcss','',NULL),(323,0,1352713754,'theme_arialist','logo','',NULL),(324,0,1352713754,'theme_arialist','tagline','',NULL),(325,0,1352713754,'theme_arialist','linkcolor','#f25f0f',NULL),(326,0,1352713754,'theme_arialist','regionwidth','250',NULL),(327,0,1352713754,'theme_arialist','customcss','',NULL),(328,0,1352713754,'theme_brick','logo','',NULL),(329,0,1352713754,'theme_brick','linkcolor','#06365b',NULL),(330,0,1352713754,'theme_brick','linkhover','#5487ad',NULL),(331,0,1352713754,'theme_brick','maincolor','#8e2800',NULL),(332,0,1352713754,'theme_brick','maincolorlink','#fff0a5',NULL),(333,0,1352713754,'theme_brick','headingcolor','#5c3500',NULL),(334,0,1352713754,'theme_formal_white','fontsizereference','13',NULL),(335,0,1352713754,'theme_formal_white','noframe','0',NULL),(336,0,1352713754,'theme_formal_white','framemargin','15',NULL),(337,0,1352713754,'theme_formal_white','headercontent','1',NULL),(338,0,1352713754,'theme_formal_white','customlogourl','',NULL),(339,0,1352713754,'theme_formal_white','frontpagelogourl','',NULL),(340,0,1352713754,'theme_formal_white','headerbgc','#E3DFD4',NULL),(341,0,1352713754,'theme_formal_white','creditstomoodleorg','2',NULL),(342,0,1352713754,'theme_formal_white','blockcolumnwidth','200',NULL),(343,0,1352713754,'theme_formal_white','blockpadding','8',NULL),(344,0,1352713754,'theme_formal_white','blockcontentbgc','#F6F6F6',NULL),(345,0,1352713754,'theme_formal_white','lblockcolumnbgc','#E3DFD4',NULL),(346,0,1352713754,'theme_formal_white','rblockcolumnbgc','',NULL),(347,0,1352713754,'theme_formal_white','footnote','',NULL),(348,0,1352713754,'theme_formal_white','customcss','',NULL),(349,0,1352713754,'theme_fusion','linkcolor','#2d83d5',NULL),(350,0,1352713754,'theme_fusion','tagline','',NULL),(351,0,1352713754,'theme_fusion','footertext','',NULL),(352,0,1352713754,'theme_fusion','customcss','',NULL),(353,0,1352713754,'theme_magazine','background','',NULL),(354,0,1352713754,'theme_magazine','logo','',NULL),(355,0,1352713754,'theme_magazine','linkcolor','#32529a',NULL),(356,0,1352713754,'theme_magazine','linkhover','#4e2300',NULL),(357,0,1352713754,'theme_magazine','maincolor','#002f2f',NULL),(358,0,1352713754,'theme_magazine','maincoloraccent','#092323',NULL),(359,0,1352713754,'theme_magazine','headingcolor','#4e0000',NULL),(360,0,1352713754,'theme_magazine','blockcolor','#002f2f',NULL),(361,0,1352713754,'theme_magazine','forumback','#e6e2af',NULL),(362,0,1352713754,'theme_mymobile','colourswatch','light',NULL),(363,0,1352713754,'theme_mymobile','showmobileintro','',NULL),(364,0,1352713754,'theme_mymobile','showsitetopic','topicshow',NULL),(365,0,1352713754,'theme_mymobile','showfullsizeimages','ithumb',NULL),(366,0,1352713754,'theme_mymobile','usetableview','tabshow',NULL),(367,0,1352713754,'theme_mymobile','customcss','',NULL),(368,0,1352713754,'theme_nimble','tagline','',NULL),(369,0,1352713754,'theme_nimble','footerline','',NULL),(370,0,1352713754,'theme_nimble','backgroundcolor','#454545',NULL),(371,0,1352713754,'theme_nimble','linkcolor','#2a65b1',NULL),(372,0,1352713754,'theme_nimble','linkhover','#222222',NULL),(373,0,1352713754,'theme_nonzero','regionprewidth','200',NULL),(374,0,1352713754,'theme_nonzero','regionpostwidth','200',NULL),(375,0,1352713755,'theme_nonzero','customcss','',NULL),(376,0,1352713755,'theme_overlay','linkcolor','#428ab5',NULL),(377,0,1352713755,'theme_overlay','headercolor','#2a4c7b',NULL),(378,0,1352713755,'theme_overlay','footertext','',NULL),(379,0,1352713755,'theme_overlay','customcss','',NULL),(380,0,1352713755,'theme_sky_high','logo','',NULL),(381,0,1352713755,'theme_sky_high','regionwidth','240',NULL),(382,0,1352713755,'theme_sky_high','footnote','',NULL),(383,0,1352713755,'theme_sky_high','customcss','',NULL),(384,0,1352713755,'theme_splash','logo','',NULL),(385,0,1352713755,'theme_splash','tagline','Virtual learning center',NULL),(386,0,1352713755,'theme_splash','hide_tagline','0',NULL),(387,0,1352713755,'theme_splash','footnote','',NULL),(388,0,1352713755,'theme_splash','customcss','',NULL),(389,0,1352713755,NULL,'calendar_adminseesall','0',NULL),(390,0,1352713755,NULL,'calendar_site_timeformat','0',NULL),(391,0,1352713755,NULL,'calendar_startwday','0',NULL),(392,0,1352713755,NULL,'calendar_weekend','65',NULL),(393,0,1352713755,NULL,'calendar_lookahead','21',NULL),(394,0,1352713755,NULL,'calendar_maxevents','10',NULL),(395,0,1352713755,NULL,'enablecalendarexport','1',NULL),(396,0,1352713755,NULL,'calendar_exportsalt','E22aHRfHgdZahWeUWOoOm0VK31yJUqCaDnAeIA2vPcTdfdmC8VSGg9QMafbU',NULL),(397,0,1352713755,NULL,'useblogassociations','1',NULL),(398,0,1352713755,NULL,'useexternalblogs','1',NULL),(399,0,1352713755,NULL,'externalblogcrontime','86400',NULL),(400,0,1352713755,NULL,'maxexternalblogsperuser','1',NULL),(401,0,1352713755,NULL,'blogusecomments','1',NULL),(402,0,1352713755,NULL,'blogshowcommentscount','1',NULL),(403,0,1352713755,NULL,'defaulthomepage','0',NULL),(404,0,1352713755,NULL,'navshowcategories','1',NULL),(405,0,1352713755,NULL,'navshowmycoursecategories','0',NULL),(406,0,1352713755,NULL,'navshowallcourses','0',NULL),(407,0,1352713755,NULL,'navcourselimit','20',NULL),(408,0,1352713755,NULL,'usesitenameforsitepages','0',NULL),(409,0,1352713755,NULL,'linkadmincategories','0',NULL),(410,0,1352713755,NULL,'navshowfrontpagemods','1',NULL),(411,0,1352713755,NULL,'navadduserpostslinks','1',NULL),(412,0,1352713755,NULL,'formatstringstriptags','1',NULL),(413,0,1352713755,NULL,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]',NULL),(414,0,1352713755,NULL,'core_media_enable_youtube','1',NULL),(415,0,1352713755,NULL,'core_media_enable_vimeo','0',NULL),(416,0,1352713755,NULL,'core_media_enable_mp3','1',NULL),(417,0,1352713755,NULL,'core_media_enable_flv','1',NULL),(418,0,1352713755,NULL,'core_media_enable_swf','1',NULL),(419,0,1352713755,NULL,'core_media_enable_html5audio','1',NULL),(420,0,1352713755,NULL,'core_media_enable_html5video','1',NULL),(421,0,1352713755,NULL,'core_media_enable_qt','1',NULL),(422,0,1352713755,NULL,'core_media_enable_wmp','1',NULL),(423,0,1352713755,NULL,'core_media_enable_rm','1',NULL),(424,0,1352713755,NULL,'docroot','http://docs.moodle.org',NULL),(425,0,1352713755,NULL,'doctonewwindow','0',NULL),(426,0,1352713755,NULL,'courselistshortnames','0',NULL),(427,0,1352713755,NULL,'enableajax','1',NULL),(428,0,1352713755,NULL,'useexternalyui','0',NULL),(429,0,1352713755,NULL,'yuicomboloading','1',NULL),(430,0,1352713755,NULL,'cachejs','1',NULL),(431,0,1352713755,NULL,'modchooserdefault','1',NULL),(432,0,1352713755,NULL,'additionalhtmlhead','',NULL),(433,0,1352713755,NULL,'additionalhtmltopofbody','',NULL),(434,0,1352713755,NULL,'additionalhtmlfooter','',NULL),(435,0,1352713755,NULL,'gdversion','0',NULL),(436,0,1352713755,NULL,'pathtodu','',NULL),(437,0,1352713755,NULL,'aspellpath','',NULL),(438,0,1352713755,NULL,'pathtodot','',NULL),(439,0,1352713755,NULL,'supportpage','',NULL),(440,0,1352713755,NULL,'dbsessions','1',NULL),(441,0,1352713755,NULL,'sessioncookie','',NULL),(442,0,1352713755,NULL,'sessioncookiepath','',NULL),(443,0,1352713755,NULL,'sessioncookiedomain','',NULL),(444,0,1352713755,NULL,'statsfirstrun','none',NULL),(445,0,1352713755,NULL,'statsmaxruntime','0',NULL),(446,0,1352713755,NULL,'statsruntimedays','31',NULL),(447,0,1352713755,NULL,'statsruntimestarthour','0',NULL),(448,0,1352713755,NULL,'statsruntimestartminute','0',NULL),(449,0,1352713755,NULL,'statsuserthreshold','0',NULL),(450,0,1352713755,NULL,'slasharguments','1',NULL),(451,0,1352713755,NULL,'getremoteaddrconf','0',NULL),(452,0,1352713755,NULL,'proxyhost','',NULL),(453,0,1352713755,NULL,'proxyport','0',NULL),(454,0,1352713755,NULL,'proxytype','HTTP',NULL),(455,0,1352713755,NULL,'proxyuser','',NULL),(456,0,1352713755,NULL,'proxypassword','',NULL),(457,0,1352713755,NULL,'proxybypass','localhost, 127.0.0.1',NULL),(458,0,1352713755,NULL,'maintenance_enabled','0',NULL),(459,0,1352713755,NULL,'maintenance_message','',NULL),(460,0,1352713755,NULL,'deleteunconfirmed','168',NULL),(461,0,1352713755,NULL,'deleteincompleteusers','0',NULL),(462,0,1352713755,NULL,'logguests','1',NULL),(463,0,1352713755,NULL,'loglifetime','0',NULL),(464,0,1352713755,NULL,'disablegradehistory','0',NULL),(465,0,1352713755,NULL,'gradehistorylifetime','0',NULL),(466,0,1352713755,NULL,'numcoursesincombo','500',NULL),(467,0,1352713755,NULL,'extramemorylimit','512M',NULL),(468,0,1352713755,NULL,'curlcache','120',NULL),(469,0,1352713755,NULL,'curltimeoutkbitrate','56',NULL),(470,0,1352713755,NULL,'updateautocheck','1',NULL),(471,0,1352713755,NULL,'updateminmaturity','200',NULL),(472,0,1352713755,NULL,'updatenotifybuilds','0',NULL),(473,0,1352713755,NULL,'enablesafebrowserintegration','0',NULL),(474,0,1352713755,NULL,'enablegroupmembersonly','0',NULL),(475,0,1352713755,NULL,'dndallowtextandlinks','0',NULL),(476,0,1352713755,NULL,'enablecssoptimiser','0',NULL),(477,0,1352713755,NULL,'debug','0',NULL),(478,0,1352713755,NULL,'debugdisplay','1',NULL),(479,0,1352713755,NULL,'xmlstrictheaders','0',NULL),(480,0,1352713755,NULL,'debugsmtp','0',NULL),(481,0,1352713755,NULL,'perfdebug','7',NULL),(482,0,1352713755,NULL,'debugstringids','0',NULL),(483,0,1352713755,NULL,'debugvalidators','0',NULL),(484,0,1352713755,NULL,'debugpageinfo','0',NULL),(485,2,1352713776,NULL,'notloggedinroleid','6',NULL),(486,2,1352713776,NULL,'guestroleid','6',NULL),(487,2,1352713776,NULL,'defaultuserroleid','7',NULL),(488,2,1352713776,NULL,'creatornewroleid','3',NULL),(489,2,1352713776,NULL,'restorernewroleid','3',NULL),(490,2,1352713777,NULL,'gradebookroles','5',NULL),(491,2,1352713777,'assign','feedback_plugin_for_gradebook','assignfeedback_comments',NULL),(492,2,1352713777,'assign','showrecentsubmissions','0',NULL),(493,2,1352713777,'assign','submissionreceipts','1',NULL),(494,2,1352713777,NULL,'assignment_maxbytes','1048576',NULL),(495,2,1352713777,NULL,'assignment_itemstocount','1',NULL),(496,2,1352713777,NULL,'assignment_showrecentsubmissions','1',NULL),(497,2,1352713777,'book','requiremodintro','1',NULL),(498,2,1352713777,'book','numberingoptions','0,1,2,3',NULL),(499,2,1352713777,'book','numbering','1',NULL),(500,2,1352713777,NULL,'chat_method','ajax',NULL),(501,2,1352713777,NULL,'chat_refresh_userlist','10',NULL),(502,2,1352713777,NULL,'chat_old_ping','35',NULL),(503,2,1352713777,NULL,'chat_refresh_room','5',NULL),(504,2,1352713777,NULL,'chat_normal_updatemode','jsupdate',NULL),(505,2,1352713777,NULL,'chat_serverhost','moodle.opensoftdev.ru',NULL),(506,2,1352713777,NULL,'chat_serverip','127.0.0.1',NULL),(507,2,1352713777,NULL,'chat_serverport','9111',NULL),(508,2,1352713777,NULL,'chat_servermax','100',NULL),(509,2,1352713777,NULL,'data_enablerssfeeds','0',NULL),(510,2,1352713777,NULL,'feedback_allowfullanonymous','0',NULL),(511,2,1352713777,'folder','requiremodintro','1',NULL),(512,2,1352713777,NULL,'forum_displaymode','3',NULL),(513,2,1352713777,NULL,'forum_replytouser','1',NULL),(514,2,1352713777,NULL,'forum_shortpost','300',NULL),(515,2,1352713777,NULL,'forum_longpost','600',NULL),(516,2,1352713777,NULL,'forum_manydiscussions','100',NULL),(517,2,1352713777,NULL,'forum_maxbytes','512000',NULL),(518,2,1352713777,NULL,'forum_maxattachments','9',NULL),(519,2,1352713777,NULL,'forum_trackreadposts','1',NULL),(520,2,1352713777,NULL,'forum_oldpostdays','14',NULL),(521,2,1352713777,NULL,'forum_usermarksread','0',NULL),(522,2,1352713777,NULL,'forum_cleanreadtime','2',NULL),(523,2,1352713777,NULL,'digestmailtime','17',NULL),(524,2,1352713777,NULL,'forum_enablerssfeeds','0',NULL),(525,2,1352713777,NULL,'forum_enabletimedposts','0',NULL),(526,2,1352713777,NULL,'glossary_entbypage','10',NULL),(527,2,1352713777,NULL,'glossary_dupentries','0',NULL),(528,2,1352713777,NULL,'glossary_allowcomments','0',NULL),(529,2,1352713777,NULL,'glossary_linkbydefault','1',NULL),(530,2,1352713777,NULL,'glossary_defaultapproval','1',NULL),(531,2,1352713777,NULL,'glossary_enablerssfeeds','0',NULL),(532,2,1352713777,NULL,'glossary_linkentries','0',NULL),(533,2,1352713777,NULL,'glossary_casesensitive','0',NULL),(534,2,1352713777,NULL,'glossary_fullmatch','0',NULL),(535,2,1352713777,'imscp','requiremodintro','1',NULL),(536,2,1352713777,'imscp','keepold','1',NULL),(537,2,1352713777,'imscp','keepold_adv','0',NULL),(538,2,1352713777,NULL,'lesson_slideshowwidth','640',NULL),(539,2,1352713777,NULL,'lesson_slideshowheight','480',NULL),(540,2,1352713777,NULL,'lesson_slideshowbgcolor','#FFFFFF',NULL),(541,2,1352713777,NULL,'lesson_mediawidth','640',NULL),(542,2,1352713777,NULL,'lesson_mediaheight','480',NULL),(543,2,1352713777,NULL,'lesson_mediaclose','0',NULL),(544,2,1352713777,NULL,'lesson_maxhighscores','10',NULL),(545,2,1352713777,NULL,'lesson_maxanswers','4',NULL),(546,2,1352713777,NULL,'lesson_defaultnextpage','0',NULL),(547,2,1352713777,'page','requiremodintro','1',NULL),(548,2,1352713777,'page','displayoptions','5',NULL),(549,2,1352713777,'page','printheading','1',NULL),(550,2,1352713777,'page','printheading_adv','0',NULL),(551,2,1352713777,'page','printintro','0',NULL),(552,2,1352713777,'page','printintro_adv','0',NULL),(553,2,1352713777,'page','display','5',NULL),(554,2,1352713777,'page','display_adv','1',NULL),(555,2,1352713777,'page','popupwidth','620',NULL),(556,2,1352713777,'page','popupwidth_adv','1',NULL),(557,2,1352713777,'page','popupheight','450',NULL),(558,2,1352713777,'page','popupheight_adv','1',NULL),(559,2,1352713777,'quiz','timelimit','0',NULL),(560,2,1352713777,'quiz','timelimit_adv','0',NULL),(561,2,1352713777,'quiz','overduehandling','autoabandon',NULL),(562,2,1352713777,'quiz','overduehandling_adv','0',NULL),(563,2,1352713777,'quiz','graceperiod','86400',NULL),(564,2,1352713777,'quiz','graceperiod_adv','0',NULL),(565,2,1352713777,'quiz','graceperiodmin','60',NULL),(566,2,1352713777,'quiz','attempts','0',NULL),(567,2,1352713777,'quiz','attempts_adv','0',NULL),(568,2,1352713777,'quiz','grademethod','1',NULL),(569,2,1352713777,'quiz','grademethod_adv','0',NULL),(570,2,1352713777,'quiz','maximumgrade','10',NULL),(571,2,1352713777,'quiz','shufflequestions','0',NULL),(572,2,1352713777,'quiz','shufflequestions_adv','0',NULL),(573,2,1352713777,'quiz','questionsperpage','1',NULL),(574,2,1352713777,'quiz','questionsperpage_adv','0',NULL),(575,2,1352713777,'quiz','navmethod','free',NULL),(576,2,1352713777,'quiz','navmethod_adv','1',NULL),(577,2,1352713777,'quiz','shuffleanswers','1',NULL),(578,2,1352713777,'quiz','shuffleanswers_adv','0',NULL),(579,2,1352713777,'quiz','preferredbehaviour','deferredfeedback',NULL),(580,2,1352713777,'quiz','attemptonlast','0',NULL),(581,2,1352713777,'quiz','attemptonlast_adv','1',NULL),(582,2,1352713777,'quiz','reviewattempt','69904',NULL),(583,2,1352713777,'quiz','reviewcorrectness','69904',NULL),(584,2,1352713777,'quiz','reviewmarks','69904',NULL),(585,2,1352713777,'quiz','reviewspecificfeedback','69904',NULL),(586,2,1352713777,'quiz','reviewgeneralfeedback','69904',NULL),(587,2,1352713777,'quiz','reviewrightanswer','69904',NULL),(588,2,1352713777,'quiz','reviewoverallfeedback','4368',NULL),(589,2,1352713777,'quiz','showuserpicture','0',NULL),(590,2,1352713777,'quiz','showuserpicture_adv','0',NULL),(591,2,1352713777,'quiz','decimalpoints','2',NULL),(592,2,1352713777,'quiz','decimalpoints_adv','0',NULL),(593,2,1352713777,'quiz','questiondecimalpoints','-1',NULL),(594,2,1352713777,'quiz','questiondecimalpoints_adv','0',NULL),(595,2,1352713777,'quiz','showblocks','0',NULL),(596,2,1352713777,'quiz','showblocks_adv','1',NULL),(597,2,1352713777,'quiz','password','',NULL),(598,2,1352713777,'quiz','password_adv','0',NULL),(599,2,1352713777,'quiz','subnet','',NULL),(600,2,1352713777,'quiz','subnet_adv','0',NULL),(601,2,1352713777,'quiz','delay1','0',NULL),(602,2,1352713777,'quiz','delay1_adv','0',NULL),(603,2,1352713777,'quiz','delay2','0',NULL),(604,2,1352713777,'quiz','delay2_adv','0',NULL),(605,2,1352713777,'quiz','browsersecurity','-',NULL),(606,2,1352713777,'quiz','browsersecurity_adv','1',NULL),(607,2,1352713777,'resource','framesize','130',NULL),(608,2,1352713777,'resource','requiremodintro','1',NULL),(609,2,1352713777,'resource','displayoptions','0,1,4,5,6',NULL),(610,2,1352713777,'resource','printheading','0',NULL),(611,2,1352713777,'resource','printheading_adv','0',NULL),(612,2,1352713777,'resource','printintro','1',NULL),(613,2,1352713777,'resource','printintro_adv','0',NULL),(614,2,1352713777,'resource','display','0',NULL),(615,2,1352713777,'resource','display_adv','0',NULL),(616,2,1352713777,'resource','showsize','0',NULL),(617,2,1352713777,'resource','showsize_adv','0',NULL),(618,2,1352713777,'resource','showtype','0',NULL),(619,2,1352713777,'resource','showtype_adv','0',NULL),(620,2,1352713777,'resource','popupwidth','620',NULL),(621,2,1352713777,'resource','popupwidth_adv','1',NULL),(622,2,1352713777,'resource','popupheight','450',NULL),(623,2,1352713777,'resource','popupheight_adv','1',NULL),(624,2,1352713777,'resource','filterfiles','0',NULL),(625,2,1352713777,'resource','filterfiles_adv','1',NULL),(626,2,1352713777,'scorm','displaycoursestructure','0',NULL),(627,2,1352713777,'scorm','displaycoursestructure_adv','0',NULL),(628,2,1352713777,'scorm','popup','0',NULL),(629,2,1352713777,'scorm','popup_adv','0',NULL),(630,2,1352713777,'scorm','framewidth','100',NULL),(631,2,1352713777,'scorm','framewidth_adv','1',NULL),(632,2,1352713777,'scorm','frameheight','500',NULL),(633,2,1352713777,'scorm','frameheight_adv','1',NULL),(634,2,1352713777,'scorm','winoptgrp_adv','1',NULL),(635,2,1352713777,'scorm','resizable','0',NULL),(636,2,1352713777,'scorm','scrollbars','0',NULL),(637,2,1352713777,'scorm','directories','0',NULL),(638,2,1352713777,'scorm','location','0',NULL),(639,2,1352713777,'scorm','menubar','0',NULL),(640,2,1352713777,'scorm','toolbar','0',NULL),(641,2,1352713777,'scorm','status','0',NULL),(642,2,1352713777,'scorm','skipview','0',NULL),(643,2,1352713777,'scorm','skipview_adv','1',NULL),(644,2,1352713777,'scorm','hidebrowse','0',NULL),(645,2,1352713777,'scorm','hidebrowse_adv','1',NULL),(646,2,1352713777,'scorm','hidetoc','0',NULL),(647,2,1352713777,'scorm','hidetoc_adv','1',NULL),(648,2,1352713777,'scorm','hidenav','0',NULL),(649,2,1352713777,'scorm','hidenav_adv','0',NULL),(650,2,1352713777,'scorm','grademethod','1',NULL),(651,2,1352713777,'scorm','grademethod_adv','0',NULL),(652,2,1352713777,'scorm','maxgrade','100',NULL),(653,2,1352713777,'scorm','maxgrade_adv','0',NULL),(654,2,1352713777,'scorm','maxattempt','0',NULL),(655,2,1352713777,'scorm','maxattempt_adv','0',NULL),(656,2,1352713777,'scorm','whatgrade','0',NULL),(657,2,1352713777,'scorm','whatgrade_adv','0',NULL),(658,2,1352713777,'scorm','displayattemptstatus','1',NULL),(659,2,1352713777,'scorm','displayattemptstatus_adv','0',NULL),(660,2,1352713777,'scorm','forcecompleted','0',NULL),(661,2,1352713777,'scorm','forcecompleted_adv','1',NULL),(662,2,1352713777,'scorm','forcenewattempt','0',NULL),(663,2,1352713777,'scorm','forcenewattempt_adv','1',NULL),(664,2,1352713777,'scorm','lastattemptlock','0',NULL),(665,2,1352713777,'scorm','lastattemptlock_adv','1',NULL),(666,2,1352713777,'scorm','auto','0',NULL),(667,2,1352713777,'scorm','auto_adv','1',NULL),(668,2,1352713777,'scorm','updatefreq','0',NULL),(669,2,1352713777,'scorm','updatefreq_adv','1',NULL),(670,2,1352713777,'scorm','allowtypeexternal','0',NULL),(671,2,1352713777,'scorm','allowtypelocalsync','0',NULL),(672,2,1352713777,'scorm','allowtypeimsrepository','0',NULL),(673,2,1352713777,'scorm','allowtypeexternalaicc','0',NULL),(674,2,1352713777,'scorm','allowaicchacp','0',NULL),(675,2,1352713777,'scorm','aicchacptimeout','30',NULL),(676,2,1352713777,'scorm','aicchacpkeepsessiondata','1',NULL),(677,2,1352713777,'scorm','forcejavascript','1',NULL),(678,2,1352713777,'scorm','allowapidebug','0',NULL),(679,2,1352713777,'scorm','apidebugmask','.*',NULL),(680,2,1352713777,'url','framesize','130',NULL),(681,2,1352713777,'url','requiremodintro','1',NULL),(682,2,1352713777,'url','secretphrase','',NULL),(683,2,1352713777,'url','rolesinparams','0',NULL),(684,2,1352713777,'url','displayoptions','0,1,5,6',NULL),(685,2,1352713777,'url','printheading','0',NULL),(686,2,1352713777,'url','printheading_adv','0',NULL),(687,2,1352713777,'url','printintro','1',NULL),(688,2,1352713777,'url','printintro_adv','0',NULL),(689,2,1352713777,'url','display','0',NULL),(690,2,1352713777,'url','display_adv','0',NULL),(691,2,1352713777,'url','popupwidth','620',NULL),(692,2,1352713777,'url','popupwidth_adv','1',NULL),(693,2,1352713777,'url','popupheight','450',NULL),(694,2,1352713777,'url','popupheight_adv','1',NULL),(695,2,1352713777,'workshop','grade','80',NULL),(696,2,1352713777,'workshop','gradinggrade','20',NULL),(697,2,1352713777,'workshop','gradedecimals','0',NULL),(698,2,1352713777,'workshop','maxbytes','0',NULL),(699,2,1352713778,'workshop','strategy','accumulative',NULL),(700,2,1352713778,'workshop','examplesmode','0',NULL),(701,2,1352713778,'workshopallocation_random','numofreviews','5',NULL),(702,2,1352713778,'workshopform_numerrors','grade0','Нет',NULL),(703,2,1352713778,'workshopform_numerrors','grade1','Да',NULL),(704,2,1352713778,'workshopeval_best','comparison','5',NULL),(705,2,1352713778,'assignsubmission_file','default','1',NULL),(706,2,1352713778,'assignsubmission_file','maxbytes','1048576',NULL),(707,2,1352713778,'assignsubmission_onlinetext','default','0',NULL),(708,2,1352713778,'assignsubmission_comments','default','0',NULL),(709,2,1352713778,'assignfeedback_comments','default','0',NULL),(710,2,1352713778,'assignfeedback_file','default','0',NULL),(711,2,1352713778,NULL,'block_course_list_adminview','all',NULL),(712,2,1352713778,NULL,'block_course_list_hideallcourseslink','0',NULL),(713,2,1352713778,NULL,'block_online_users_timetosee','5',NULL),(714,2,1352713778,NULL,'block_rss_client_num_entries','5',NULL),(715,2,1352713778,NULL,'block_rss_client_timeout','30',NULL),(716,2,1352713778,'blocks/section_links','numsections1','22',NULL),(717,2,1352713778,'blocks/section_links','incby1','2',NULL),(718,2,1352713778,'blocks/section_links','numsections2','40',NULL),(719,2,1352713778,'blocks/section_links','incby2','5',NULL),(720,2,1352713778,NULL,'block_tags_showcoursetags','0',NULL),(721,2,1352713778,NULL,'jabberhost','',NULL),(722,2,1352713778,NULL,'jabberserver','',NULL),(723,2,1352713778,NULL,'jabberusername','',NULL),(724,2,1352713778,NULL,'jabberpassword','',NULL),(725,2,1352713778,NULL,'jabberport','5222',NULL),(726,2,1352713778,NULL,'smtphosts','',NULL),(727,2,1352713778,NULL,'smtpsecure','',NULL),(728,2,1352713778,NULL,'smtpuser','',NULL),(729,2,1352713778,NULL,'smtppass','',NULL),(730,2,1352713778,NULL,'smtpmaxbulk','1',NULL),(731,2,1352713778,NULL,'noreplyaddress','noreply@moodle.opensoftdev.ru',NULL),(732,2,1352713778,NULL,'sitemailcharset','0',NULL),(733,2,1352713778,NULL,'allowusermailcharset','0',NULL),(734,2,1352713778,NULL,'mailnewline','LF',NULL),(735,2,1352713778,'enrol_cohort','roleid','5',NULL),(736,2,1352713778,'enrol_cohort','unenrolaction','0',NULL),(737,2,1352713778,'enrol_database','defaultrole','5',NULL),(738,2,1352713778,'enrol_database','defaultcategory','1',NULL),(739,2,1352713778,'enrol_flatfile','map_1','manager',NULL),(740,2,1352713778,'enrol_flatfile','map_2','coursecreator',NULL),(741,2,1352713778,'enrol_flatfile','map_3','editingteacher',NULL),(742,2,1352713778,'enrol_flatfile','map_4','teacher',NULL),(743,2,1352713778,'enrol_flatfile','map_5','student',NULL),(744,2,1352713778,'enrol_flatfile','map_6','guest',NULL),(745,2,1352713778,'enrol_flatfile','map_7','user',NULL),(746,2,1352713778,'enrol_flatfile','map_8','frontpage',NULL),(747,2,1352713778,'enrol_imsenterprise','imsrolemap01','5',NULL),(748,2,1352713778,'enrol_imsenterprise','imsrolemap02','3',NULL),(749,2,1352713778,'enrol_imsenterprise','imsrolemap03','3',NULL),(750,2,1352713778,'enrol_imsenterprise','imsrolemap04','5',NULL),(751,2,1352713778,'enrol_imsenterprise','imsrolemap05','0',NULL),(752,2,1352713778,'enrol_imsenterprise','imsrolemap06','4',NULL),(753,2,1352713778,'enrol_imsenterprise','imsrolemap07','0',NULL),(754,2,1352713778,'enrol_imsenterprise','imsrolemap08','4',NULL),(755,2,1352713778,'enrol_manual','roleid','5',NULL),(756,2,1352713778,'enrol_meta','nosyncroleids','',NULL),(757,2,1352713778,'enrol_meta','syncall','1',NULL),(758,2,1352713778,'enrol_meta','unenrolaction','0',NULL),(759,2,1352713778,'enrol_mnet','roleid','5',NULL),(760,2,1352713778,'enrol_mnet','roleid_adv','1',NULL),(761,2,1352713778,'enrol_paypal','roleid','5',NULL),(762,2,1352713778,'enrol_self','roleid','5',NULL),(763,2,1352713778,NULL,'enablemobilewebservice','0',NULL),(764,2,1352713778,NULL,'profileroles','5,4,3',NULL),(765,2,1352713778,NULL,'calendar_exportsalt','HplgiT9OQV2FxtfOzYOzceyyFHmpBpFtvCqvt5hkBgI0SjqpWx05GCnfx8Vx','E22aHRfHgdZahWeUWOoOm0VK31yJUqCaDnAeIA2vPcTdfdmC8VSGg9QMafbU'),(766,2,1352713778,NULL,'coursecontact','3',NULL),(767,2,1352713778,NULL,'frontpage','1',NULL),(768,2,1352713778,NULL,'frontpageloggedin','1',NULL),(769,2,1352713778,NULL,'maxcategorydepth','0',NULL),(770,2,1352713778,NULL,'commentsperpage','15',NULL),(771,2,1352713778,NULL,'coursesperpage','20',NULL),(772,2,1352713778,NULL,'defaultfrontpageroleid','8',NULL),(773,2,1352713778,NULL,'supportname','Администратор Пользователь',NULL),(774,2,1352713778,NULL,'supportemail','',NULL),(775,2,1352713778,NULL,'calendar_exportsalt','F6ud3pR0AzyVOTyqR92KzWtByk36QGZ1EVMqD59j79yAdLjKhrxuKE76F1Bf','HplgiT9OQV2FxtfOzYOzceyyFHmpBpFtvCqvt5hkBgI0SjqpWx05GCnfx8Vx');
/*!40000 ALTER TABLE `mdl_config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=868 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_plugins`
--

LOCK TABLES `mdl_config_plugins` WRITE;
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` VALUES (1,'moodlecourse','format','weeks'),(2,'moodlecourse','maxsections','52'),(3,'moodlecourse','numsections','10'),(4,'moodlecourse','hiddensections','0'),(5,'moodlecourse','newsitems','5'),(6,'moodlecourse','showgrades','1'),(7,'moodlecourse','showreports','0'),(8,'moodlecourse','maxbytes','2097152'),(9,'moodlecourse','coursedisplay','0'),(10,'moodlecourse','groupmode','0'),(11,'moodlecourse','groupmodeforce','0'),(12,'moodlecourse','visible','1'),(13,'moodlecourse','lang',''),(14,'moodlecourse','enablecompletion','0'),(15,'moodlecourse','completionstartonenrol','0'),(16,'backup','loglifetime','30'),(17,'backup','backup_general_users','1'),(18,'backup','backup_general_users_locked','0'),(19,'backup','backup_general_anonymize','0'),(20,'backup','backup_general_anonymize_locked','0'),(21,'backup','backup_general_role_assignments','1'),(22,'backup','backup_general_role_assignments_locked','0'),(23,'backup','backup_general_activities','1'),(24,'backup','backup_general_activities_locked','0'),(25,'backup','backup_general_blocks','1'),(26,'backup','backup_general_blocks_locked','0'),(27,'backup','backup_general_filters','1'),(28,'backup','backup_general_filters_locked','0'),(29,'backup','backup_general_comments','1'),(30,'backup','backup_general_comments_locked','0'),(31,'backup','backup_general_userscompletion','1'),(32,'backup','backup_general_userscompletion_locked','0'),(33,'backup','backup_general_logs','0'),(34,'backup','backup_general_logs_locked','0'),(35,'backup','backup_general_histories','0'),(36,'backup','backup_general_histories_locked','0'),(37,'backup','backup_auto_active','0'),(38,'backup','backup_auto_weekdays','0000000'),(39,'backup','backup_auto_hour','0'),(40,'backup','backup_auto_minute','0'),(41,'backup','backup_auto_storage','0'),(42,'backup','backup_auto_destination',''),(43,'backup','backup_auto_keep','1'),(44,'backup','backup_shortname','0'),(45,'backup','backup_auto_users','1'),(46,'backup','backup_auto_role_assignments','1'),(47,'backup','backup_auto_activities','1'),(48,'backup','backup_auto_blocks','1'),(49,'backup','backup_auto_filters','1'),(50,'backup','backup_auto_comments','1'),(51,'backup','backup_auto_userscompletion','1'),(52,'backup','backup_auto_logs','0'),(53,'backup','backup_auto_histories','0'),(54,'enrol_database','dbtype',''),(55,'enrol_database','dbhost','localhost'),(56,'enrol_database','dbuser',''),(57,'enrol_database','dbpass',''),(58,'enrol_database','dbname',''),(59,'enrol_database','dbencoding','utf-8'),(60,'enrol_database','dbsetupsql',''),(61,'enrol_database','dbsybasequoting','0'),(62,'enrol_database','debugdb','0'),(63,'enrol_database','localcoursefield','idnumber'),(64,'enrol_database','localuserfield','idnumber'),(65,'enrol_database','localrolefield','shortname'),(66,'enrol_database','localcategoryfield','id'),(67,'enrol_database','remoteenroltable',''),(68,'enrol_database','remotecoursefield',''),(69,'enrol_database','remoteuserfield',''),(70,'enrol_database','remoterolefield',''),(71,'enrol_database','ignorehiddencourses','0'),(72,'enrol_database','unenrolaction','0'),(73,'enrol_database','newcoursetable',''),(74,'enrol_database','newcoursefullname','fullname'),(75,'enrol_database','newcourseshortname','shortname'),(76,'enrol_database','newcourseidnumber','idnumber'),(77,'enrol_database','newcoursecategory',''),(78,'enrol_database','templatecourse',''),(79,'enrol_flatfile','location',''),(80,'enrol_flatfile','mailstudents','0'),(81,'enrol_flatfile','mailteachers','0'),(82,'enrol_flatfile','mailadmins','0'),(83,'enrol_guest','requirepassword','0'),(84,'enrol_guest','usepasswordpolicy','0'),(85,'enrol_guest','showhint','0'),(86,'enrol_guest','defaultenrol','1'),(87,'enrol_guest','status','1'),(88,'enrol_guest','status_adv','0'),(89,'enrol_imsenterprise','imsfilelocation',''),(90,'enrol_imsenterprise','logtolocation',''),(91,'enrol_imsenterprise','mailadmins','0'),(92,'enrol_imsenterprise','createnewusers','0'),(93,'enrol_imsenterprise','imsdeleteusers','0'),(94,'enrol_imsenterprise','fixcaseusernames','0'),(95,'enrol_imsenterprise','fixcasepersonalnames','0'),(96,'enrol_imsenterprise','imssourcedidfallback','0'),(97,'enrol_imsenterprise','truncatecoursecodes','0'),(98,'enrol_imsenterprise','createnewcourses','0'),(99,'enrol_imsenterprise','createnewcategories','0'),(100,'enrol_imsenterprise','imsunenrol','0'),(101,'enrol_imsenterprise','imsrestricttarget',''),(102,'enrol_imsenterprise','imscapitafix','0'),(103,'enrol_manual','defaultenrol','1'),(104,'enrol_manual','status','0'),(105,'enrol_manual','enrolperiod','0'),(106,'enrol_paypal','paypalbusiness',''),(107,'enrol_paypal','mailstudents','0'),(108,'enrol_paypal','mailteachers','0'),(109,'enrol_paypal','mailadmins','0'),(110,'enrol_paypal','status','1'),(111,'enrol_paypal','cost','0'),(112,'enrol_paypal','currency','USD'),(113,'enrol_paypal','enrolperiod','0'),(114,'enrol_self','requirepassword','0'),(115,'enrol_self','usepasswordpolicy','0'),(116,'enrol_self','showhint','0'),(117,'enrol_self','defaultenrol','1'),(118,'enrol_self','status','1'),(119,'enrol_self','groupkey','0'),(120,'enrol_self','enrolperiod','0'),(121,'enrol_self','longtimenosee','0'),(122,'enrol_self','maxenrolled','0'),(123,'enrol_self','sendcoursewelcomemessage','1'),(126,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),(127,'filter_emoticon','formats','1,4,0'),(128,'filter_urltolink','formats','0'),(129,'filter_urltolink','embedimages','1'),(130,'theme_afterburner','logo',''),(131,'theme_afterburner','footnote',''),(132,'theme_afterburner','customcss',''),(133,'theme_arialist','logo',''),(134,'theme_arialist','tagline',''),(135,'theme_arialist','linkcolor','#f25f0f'),(136,'theme_arialist','regionwidth','250'),(137,'theme_arialist','customcss',''),(138,'theme_brick','logo',''),(139,'theme_brick','linkcolor','#06365b'),(140,'theme_brick','linkhover','#5487ad'),(141,'theme_brick','maincolor','#8e2800'),(142,'theme_brick','maincolorlink','#fff0a5'),(143,'theme_brick','headingcolor','#5c3500'),(144,'theme_formal_white','fontsizereference','13'),(145,'theme_formal_white','noframe','0'),(146,'theme_formal_white','framemargin','15'),(147,'theme_formal_white','headercontent','1'),(148,'theme_formal_white','customlogourl',''),(149,'theme_formal_white','frontpagelogourl',''),(150,'theme_formal_white','headerbgc','#E3DFD4'),(151,'theme_formal_white','creditstomoodleorg','2'),(152,'theme_formal_white','blockcolumnwidth','200'),(153,'theme_formal_white','blockpadding','8'),(154,'theme_formal_white','blockcontentbgc','#F6F6F6'),(155,'theme_formal_white','lblockcolumnbgc','#E3DFD4'),(156,'theme_formal_white','rblockcolumnbgc',''),(157,'theme_formal_white','footnote',''),(158,'theme_formal_white','customcss',''),(159,'theme_fusion','linkcolor','#2d83d5'),(160,'theme_fusion','tagline',''),(161,'theme_fusion','footertext',''),(162,'theme_fusion','customcss',''),(163,'theme_magazine','background',''),(164,'theme_magazine','logo',''),(165,'theme_magazine','linkcolor','#32529a'),(166,'theme_magazine','linkhover','#4e2300'),(167,'theme_magazine','maincolor','#002f2f'),(168,'theme_magazine','maincoloraccent','#092323'),(169,'theme_magazine','headingcolor','#4e0000'),(170,'theme_magazine','blockcolor','#002f2f'),(171,'theme_magazine','forumback','#e6e2af'),(172,'theme_mymobile','colourswatch','light'),(173,'theme_mymobile','showmobileintro',''),(174,'theme_mymobile','showsitetopic','topicshow'),(175,'theme_mymobile','showfullsizeimages','ithumb'),(176,'theme_mymobile','usetableview','tabshow'),(177,'theme_mymobile','customcss',''),(178,'theme_nimble','tagline',''),(179,'theme_nimble','footerline',''),(180,'theme_nimble','backgroundcolor','#454545'),(181,'theme_nimble','linkcolor','#2a65b1'),(182,'theme_nimble','linkhover','#222222'),(183,'theme_nonzero','regionprewidth','200'),(184,'theme_nonzero','regionpostwidth','200'),(185,'theme_nonzero','customcss',''),(186,'theme_overlay','linkcolor','#428ab5'),(187,'theme_overlay','headercolor','#2a4c7b'),(188,'theme_overlay','footertext',''),(189,'theme_overlay','customcss',''),(190,'theme_sky_high','logo',''),(191,'theme_sky_high','regionwidth','240'),(192,'theme_sky_high','footnote',''),(193,'theme_sky_high','customcss',''),(194,'theme_splash','logo',''),(195,'theme_splash','tagline','Virtual learning center'),(196,'theme_splash','hide_tagline','0'),(197,'theme_splash','footnote',''),(198,'theme_splash','customcss',''),(199,'qtype_calculated','version','2012112900'),(200,'qtype_calculatedmulti','version','2012112900'),(201,'qtype_calculatedsimple','version','2012112900'),(202,'qtype_description','version','2012112900'),(203,'qtype_essay','version','2012112900'),(204,'qtype_match','version','2012112900'),(205,'qtype_missingtype','version','2012112900'),(206,'qtype_multianswer','version','2012112900'),(207,'qtype_multichoice','version','2012112900'),(208,'qtype_numerical','version','2012112900'),(209,'qtype_random','version','2012112900'),(210,'qtype_randomsamatch','version','2012112900'),(211,'qtype_shortanswer','version','2012112900'),(212,'qtype_truefalse','version','2012112900'),(222,'auth_cas','version','2012112900'),(224,'auth_db','version','2012112900'),(226,'auth_email','version','2012112900'),(227,'auth_fc','version','2012112900'),(229,'auth_imap','version','2012112900'),(231,'auth_ldap','version','2012112900'),(233,'auth_manual','version','2012112900'),(234,'auth_mnet','version','2012112900'),(236,'auth_nntp','version','2012112900'),(238,'auth_nologin','version','2012112900'),(239,'auth_none','version','2012112900'),(240,'auth_pam','version','2012112900'),(242,'auth_pop3','version','2012112900'),(244,'auth_radius','version','2012112900'),(246,'auth_shibboleth','version','2012112900'),(248,'auth_webservice','version','2012112900'),(249,'enrol_authorize','version','2012112900'),(250,'enrol_category','version','2012112900'),(252,'enrol_cohort','version','2012112900'),(253,'enrol_database','version','2012112900'),(255,'enrol_flatfile','version','2012112900'),(256,'enrol_guest','version','2012112900'),(257,'enrol_imsenterprise','version','2012112900'),(259,'enrol_ldap','version','2012112900'),(261,'enrol_manual','version','2012112900'),(263,'enrol_meta','version','2012112900'),(265,'enrol_mnet','version','2012112900'),(266,'enrol_paypal','version','2012112900'),(267,'enrol_self','version','2012112900'),(269,'message_email','version','2012112900'),(271,'message','email_provider_enrol_authorize_authorize_enrolment_permitted','permitted'),(272,'message','message_provider_enrol_authorize_authorize_enrolment_loggedin','email'),(273,'message','message_provider_enrol_authorize_authorize_enrolment_loggedoff','email'),(274,'message','email_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(275,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedin','email'),(276,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedoff','email'),(277,'message','email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(278,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin','email'),(279,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff','email'),(280,'message','email_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(281,'message','message_provider_enrol_paypal_paypal_enrolment_loggedin','email'),(282,'message','message_provider_enrol_paypal_paypal_enrolment_loggedoff','email'),(283,'message','email_provider_mod_assign_assign_notification_permitted','permitted'),(284,'message','message_provider_mod_assign_assign_notification_loggedin','email'),(285,'message','message_provider_mod_assign_assign_notification_loggedoff','email'),(286,'message','email_provider_mod_assignment_assignment_updates_permitted','permitted'),(287,'message','message_provider_mod_assignment_assignment_updates_loggedin','email'),(288,'message','message_provider_mod_assignment_assignment_updates_loggedoff','email'),(289,'message','email_provider_mod_feedback_submission_permitted','permitted'),(290,'message','message_provider_mod_feedback_submission_loggedin','email'),(291,'message','message_provider_mod_feedback_submission_loggedoff','email'),(292,'message','email_provider_mod_feedback_message_permitted','permitted'),(293,'message','message_provider_mod_feedback_message_loggedin','email'),(294,'message','message_provider_mod_feedback_message_loggedoff','email'),(295,'message','email_provider_mod_forum_posts_permitted','permitted'),(296,'message','message_provider_mod_forum_posts_loggedin','email'),(297,'message','message_provider_mod_forum_posts_loggedoff','email'),(298,'message','email_provider_mod_lesson_graded_essay_permitted','permitted'),(299,'message','message_provider_mod_lesson_graded_essay_loggedin','email'),(300,'message','message_provider_mod_lesson_graded_essay_loggedoff','email'),(301,'message','email_provider_mod_quiz_submission_permitted','permitted'),(302,'message','message_provider_mod_quiz_submission_loggedin','email'),(303,'message','message_provider_mod_quiz_submission_loggedoff','email'),(304,'message','email_provider_mod_quiz_confirmation_permitted','permitted'),(305,'message','message_provider_mod_quiz_confirmation_loggedin','email'),(306,'message','message_provider_mod_quiz_confirmation_loggedoff','email'),(307,'message','email_provider_mod_quiz_attempt_overdue_permitted','permitted'),(308,'message','message_provider_mod_quiz_attempt_overdue_loggedin','email'),(309,'message','message_provider_mod_quiz_attempt_overdue_loggedoff','email'),(310,'message','email_provider_moodle_notices_permitted','permitted'),(311,'message','message_provider_moodle_notices_loggedin','email'),(312,'message','message_provider_moodle_notices_loggedoff','email'),(313,'message','email_provider_moodle_errors_permitted','permitted'),(314,'message','message_provider_moodle_errors_loggedin','email'),(315,'message','message_provider_moodle_errors_loggedoff','email'),(316,'message','email_provider_moodle_availableupdate_permitted','permitted'),(317,'message','message_provider_moodle_availableupdate_loggedin','email'),(318,'message','message_provider_moodle_availableupdate_loggedoff','email'),(319,'message','email_provider_moodle_instantmessage_permitted','permitted'),(320,'message','message_provider_moodle_instantmessage_loggedoff','popup,email'),(321,'message','email_provider_moodle_backup_permitted','permitted'),(322,'message','message_provider_moodle_backup_loggedin','email'),(323,'message','message_provider_moodle_backup_loggedoff','email'),(324,'message','email_provider_moodle_courserequested_permitted','permitted'),(325,'message','message_provider_moodle_courserequested_loggedin','email'),(326,'message','message_provider_moodle_courserequested_loggedoff','email'),(327,'message','email_provider_moodle_courserequestapproved_permitted','permitted'),(328,'message','message_provider_moodle_courserequestapproved_loggedin','email'),(329,'message','message_provider_moodle_courserequestapproved_loggedoff','email'),(330,'message','email_provider_moodle_courserequestrejected_permitted','permitted'),(331,'message','message_provider_moodle_courserequestrejected_loggedin','email'),(332,'message','message_provider_moodle_courserequestrejected_loggedoff','email'),(333,'message_jabber','version','2012112900'),(335,'message','jabber_provider_enrol_authorize_authorize_enrolment_permitted','permitted'),(336,'message','jabber_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(337,'message','jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(338,'message','jabber_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(339,'message','jabber_provider_mod_assign_assign_notification_permitted','permitted'),(340,'message','jabber_provider_mod_assignment_assignment_updates_permitted','permitted'),(341,'message','jabber_provider_mod_feedback_submission_permitted','permitted'),(342,'message','jabber_provider_mod_feedback_message_permitted','permitted'),(343,'message','jabber_provider_mod_forum_posts_permitted','permitted'),(344,'message','jabber_provider_mod_lesson_graded_essay_permitted','permitted'),(345,'message','jabber_provider_mod_quiz_submission_permitted','permitted'),(346,'message','jabber_provider_mod_quiz_confirmation_permitted','permitted'),(347,'message','jabber_provider_mod_quiz_attempt_overdue_permitted','permitted'),(348,'message','jabber_provider_moodle_notices_permitted','permitted'),(349,'message','jabber_provider_moodle_errors_permitted','permitted'),(350,'message','jabber_provider_moodle_availableupdate_permitted','permitted'),(351,'message','jabber_provider_moodle_instantmessage_permitted','permitted'),(352,'message','jabber_provider_moodle_backup_permitted','permitted'),(353,'message','jabber_provider_moodle_courserequested_permitted','permitted'),(354,'message','jabber_provider_moodle_courserequestapproved_permitted','permitted'),(355,'message','jabber_provider_moodle_courserequestrejected_permitted','permitted'),(356,'message_popup','version','2012112900'),(358,'message','popup_provider_enrol_authorize_authorize_enrolment_permitted','permitted'),(359,'message','popup_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(360,'message','popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(361,'message','popup_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(362,'message','popup_provider_mod_assign_assign_notification_permitted','permitted'),(363,'message','popup_provider_mod_assignment_assignment_updates_permitted','permitted'),(364,'message','popup_provider_mod_feedback_submission_permitted','permitted'),(365,'message','popup_provider_mod_feedback_message_permitted','permitted'),(366,'message','popup_provider_mod_forum_posts_permitted','permitted'),(367,'message','popup_provider_mod_lesson_graded_essay_permitted','permitted'),(368,'message','popup_provider_mod_quiz_submission_permitted','permitted'),(369,'message','popup_provider_mod_quiz_confirmation_permitted','permitted'),(370,'message','popup_provider_mod_quiz_attempt_overdue_permitted','permitted'),(371,'message','popup_provider_moodle_notices_permitted','permitted'),(372,'message','popup_provider_moodle_errors_permitted','permitted'),(373,'message','popup_provider_moodle_availableupdate_permitted','permitted'),(374,'message','popup_provider_moodle_instantmessage_permitted','permitted'),(375,'message','message_provider_moodle_instantmessage_loggedin','popup'),(376,'message','popup_provider_moodle_backup_permitted','permitted'),(377,'message','popup_provider_moodle_courserequested_permitted','permitted'),(378,'message','popup_provider_moodle_courserequestapproved_permitted','permitted'),(379,'message','popup_provider_moodle_courserequestrejected_permitted','permitted'),(381,'filter_activitynames','version','2012112900'),(383,'filter_algebra','version','2012112900'),(384,'filter_censor','version','2012112900'),(385,'filter_data','version','2012112900'),(387,'filter_emailprotect','version','2012112900'),(388,'filter_emoticon','version','2012112900'),(389,'filter_glossary','version','2012112900'),(391,'filter_mediaplugin','version','2012112900'),(393,'filter_multilang','version','2012112900'),(394,'filter_tex','version','2012112900'),(396,'filter_tidy','version','2012112900'),(397,'filter_urltolink','version','2012112900'),(398,'editor_textarea','version','2012112900'),(399,'editor_tinymce','version','2012112900'),(400,'format_scorm','version','2012112900'),(401,'format_social','version','2012112900'),(402,'format_topics','version','2012112900'),(403,'format_weeks','version','2012112900'),(404,'profilefield_checkbox','version','2012112900'),(405,'profilefield_datetime','version','2012112900'),(406,'profilefield_menu','version','2012112900'),(407,'profilefield_text','version','2012112900'),(408,'profilefield_textarea','version','2012112900'),(409,'report_backups','version','2012112900'),(410,'report_completion','version','2012112900'),(412,'report_configlog','version','2012112900'),(413,'report_courseoverview','version','2012112900'),(414,'report_log','version','2012112900'),(416,'report_loglive','version','2012112900'),(417,'report_outline','version','2012112900'),(419,'report_participation','version','2012112900'),(421,'report_progress','version','2012112900'),(423,'report_questioninstances','version','2012112900'),(424,'report_security','version','2012112900'),(425,'report_stats','version','2012112900'),(427,'gradeexport_ods','version','2012112900'),(428,'gradeexport_txt','version','2012112900'),(429,'gradeexport_xls','version','2012112900'),(430,'gradeexport_xml','version','2012112900'),(431,'gradeimport_csv','version','2012112900'),(432,'gradeimport_xml','version','2012112900'),(433,'gradereport_grader','version','2012112900'),(434,'gradereport_outcomes','version','2012112900'),(435,'gradereport_overview','version','2012112900'),(436,'gradereport_user','version','2012112900'),(437,'gradingform_guide','version','2012112900'),(438,'gradingform_rubric','version','2012112900'),(439,'mnetservice_enrol','version','2012112900'),(440,'webservice_amf','version','2012112900'),(441,'webservice_rest','version','2012112900'),(442,'webservice_soap','version','2012112900'),(443,'webservice_xmlrpc','version','2012112900'),(444,'repository_alfresco','version','2012112900'),(445,'repository_boxnet','version','2012112900'),(446,'repository_coursefiles','version','2012112900'),(447,'repository_dropbox','version','2012112900'),(448,'repository_equella','version','2012112900'),(449,'repository_filesystem','version','2012112900'),(450,'repository_flickr','version','2012112900'),(451,'repository_flickr_public','version','2012112900'),(452,'repository_googledocs','version','2012112900'),(453,'repository_local','version','2012112900'),(455,'local','enablecourseinstances','0'),(456,'local','enableuserinstances','0'),(457,'repository_merlot','version','2012112900'),(458,'repository_picasa','version','2012112900'),(459,'repository_recent','version','2012112900'),(461,'recent','enablecourseinstances','0'),(462,'recent','enableuserinstances','0'),(463,'repository_s3','version','2012112900'),(464,'repository_upload','version','2012112900'),(466,'upload','enablecourseinstances','0'),(467,'upload','enableuserinstances','0'),(468,'repository_url','version','2012112900'),(470,'url','enablecourseinstances','0'),(471,'url','enableuserinstances','0'),(472,'repository_user','version','2012112900'),(474,'user','enablecourseinstances','0'),(475,'user','enableuserinstances','0'),(476,'repository_webdav','version','2012112900'),(477,'repository_wikimedia','version','2012112900'),(479,'wikimedia','enablecourseinstances','0'),(480,'wikimedia','enableuserinstances','0'),(481,'repository_youtube','version','2012112900'),(483,'youtube','enablecourseinstances','0'),(484,'youtube','enableuserinstances','0'),(485,'portfolio_boxnet','version','2012112900'),(486,'portfolio_download','version','2012112900'),(487,'portfolio_flickr','version','2012112900'),(488,'portfolio_googledocs','version','2012112900'),(489,'portfolio_mahara','version','2012112900'),(490,'portfolio_picasa','version','2012112900'),(491,'qbehaviour_adaptive','version','2012112900'),(492,'qbehaviour_adaptivenopenalty','version','2012112900'),(493,'qbehaviour_deferredcbm','version','2012112900'),(494,'qbehaviour_deferredfeedback','version','2012112900'),(495,'qbehaviour_immediatecbm','version','2012112900'),(496,'qbehaviour_immediatefeedback','version','2012112900'),(497,'qbehaviour_informationitem','version','2012112900'),(498,'qbehaviour_interactive','version','2012112900'),(499,'qbehaviour_interactivecountback','version','2012112900'),(500,'qbehaviour_manualgraded','version','2012112900'),(501,'qbehaviour_missing','version','2012112900'),(502,'qformat_aiken','version','2012112900'),(503,'qformat_blackboard','version','2012112900'),(504,'qformat_blackboard_six','version','2012112900'),(505,'qformat_examview','version','2012112900'),(506,'qformat_gift','version','2012112900'),(507,'qformat_learnwise','version','2012112900'),(508,'qformat_missingword','version','2012112900'),(509,'qformat_multianswer','version','2012112900'),(510,'qformat_webct','version','2012112900'),(511,'qformat_xhtml','version','2012112900'),(512,'qformat_xml','version','2012112900'),(513,'tool_assignmentupgrade','version','2012112900'),(514,'tool_bloglevelupgrade','version','2012061700'),(516,'tool_capability','version','2012112900'),(517,'tool_customlang','version','2012112900'),(519,'tool_dbtransfer','version','2012112900'),(520,'tool_generator','version','2012112900'),(521,'tool_health','version','2012112900'),(522,'tool_innodb','version','2012112900'),(523,'tool_langimport','version','2012112900'),(524,'tool_multilangupgrade','version','2012112900'),(525,'tool_phpunit','version','2012112900'),(526,'tool_profiling','version','2012112900'),(527,'tool_qeupgradehelper','version','2012112900'),(529,'tool_replace','version','2012112900'),(530,'tool_spamcleaner','version','2012112900'),(531,'tool_timezoneimport','version','2012112900'),(534,'tool_unsuproles','version','2012112900'),(536,'tool_uploaduser','version','2012112900'),(537,'tool_xmldb','version','2012112900'),(538,'theme_afterburner','version','2012112900'),(539,'theme_anomaly','version','2012112900'),(540,'theme_arialist','version','2012112900'),(541,'theme_base','version','2012112900'),(542,'theme_binarius','version','2012112900'),(543,'theme_boxxie','version','2012112900'),(544,'theme_brick','version','2012112900'),(545,'theme_canvas','version','2012112900'),(546,'theme_formal_white','version','2012112900'),(548,'theme_formfactor','version','2012112900'),(549,'theme_fusion','version','2012112900'),(550,'theme_leatherbound','version','2012112900'),(551,'theme_magazine','version','2012112900'),(552,'theme_mymobile','version','2012112900'),(553,'theme_nimble','version','2012112900'),(554,'theme_nonzero','version','2012112900'),(555,'theme_overlay','version','2012112900'),(556,'theme_serenity','version','2012112900'),(557,'theme_sky_high','version','2012112900'),(558,'theme_splash','version','2012112900'),(559,'theme_standard','version','2012112900'),(560,'theme_standardold','version','2012112900'),(561,'assignsubmission_comments','version','2012112900'),(563,'assignsubmission_file','sortorder','1'),(564,'assignsubmission_comments','sortorder','2'),(565,'assignsubmission_onlinetext','sortorder','0'),(566,'assignsubmission_file','version','2012112900'),(567,'assignsubmission_onlinetext','version','2012112900'),(569,'assignfeedback_comments','version','2012112900'),(571,'assignfeedback_comments','sortorder','0'),(572,'assignfeedback_file','sortorder','1'),(573,'assignfeedback_file','version','2012112900'),(575,'assignment_offline','version','2012112900'),(576,'assignment_online','version','2012112900'),(577,'assignment_upload','version','2012112900'),(578,'assignment_uploadsingle','version','2012112900'),(579,'booktool_exportimscp','version','2012112900'),(580,'booktool_importhtml','version','2012112900'),(581,'booktool_print','version','2012112900'),(582,'datafield_checkbox','version','2012112900'),(583,'datafield_date','version','2012112900'),(584,'datafield_file','version','2012112900'),(585,'datafield_latlong','version','2012112900'),(586,'datafield_menu','version','2012112900'),(587,'datafield_multimenu','version','2012112900'),(588,'datafield_number','version','2012112900'),(589,'datafield_picture','version','2012112900'),(590,'datafield_radiobutton','version','2012112900'),(591,'datafield_text','version','2012112900'),(592,'datafield_textarea','version','2012112900'),(593,'datafield_url','version','2012112900'),(594,'datapreset_imagegallery','version','2012112900'),(595,'quiz_grading','version','2012112900'),(596,'quiz_overview','version','2012112900'),(597,'quiz_responses','version','2012112900'),(598,'quiz_statistics','version','2012112900'),(600,'quizaccess_delaybetweenattempts','version','2012112900'),(601,'quizaccess_ipaddress','version','2012112900'),(602,'quizaccess_numattempts','version','2012112900'),(603,'quizaccess_openclosedate','version','2012112900'),(604,'quizaccess_password','version','2012112900'),(605,'quizaccess_safebrowser','version','2012112900'),(606,'quizaccess_securewindow','version','2012112900'),(607,'quizaccess_timelimit','version','2012112900'),(608,'scormreport_basic','version','2012112900'),(609,'scormreport_graphs','version','2012112900'),(610,'scormreport_interactions','version','2012112900'),(611,'workshopform_accumulative','version','2012112900'),(613,'workshopform_comments','version','2012112900'),(615,'workshopform_numerrors','version','2012112900'),(617,'workshopform_rubric','version','2012112900'),(619,'workshopallocation_manual','version','2012112900'),(620,'workshopallocation_random','version','2012112900'),(621,'workshopallocation_scheduled','version','2012112900'),(622,'workshopeval_best','version','2012112900'),(623,'assign','feedback_plugin_for_gradebook','assignfeedback_comments'),(624,'assign','showrecentsubmissions','0'),(625,'assign','submissionreceipts','1'),(626,'book','requiremodintro','1'),(627,'book','numberingoptions','0,1,2,3'),(628,'book','numbering','1'),(629,'folder','requiremodintro','1'),(630,'imscp','requiremodintro','1'),(631,'imscp','keepold','1'),(632,'imscp','keepold_adv','0'),(633,'page','requiremodintro','1'),(634,'page','displayoptions','5'),(635,'page','printheading','1'),(636,'page','printheading_adv','0'),(637,'page','printintro','0'),(638,'page','printintro_adv','0'),(639,'page','display','5'),(640,'page','display_adv','1'),(641,'page','popupwidth','620'),(642,'page','popupwidth_adv','1'),(643,'page','popupheight','450'),(644,'page','popupheight_adv','1'),(645,'quiz','timelimit','0'),(646,'quiz','timelimit_adv','0'),(647,'quiz','overduehandling','autoabandon'),(648,'quiz','overduehandling_adv','0'),(649,'quiz','graceperiod','86400'),(650,'quiz','graceperiod_adv','0'),(651,'quiz','graceperiodmin','60'),(652,'quiz','attempts','0'),(653,'quiz','attempts_adv','0'),(654,'quiz','grademethod','1'),(655,'quiz','grademethod_adv','0'),(656,'quiz','maximumgrade','10'),(657,'quiz','shufflequestions','0'),(658,'quiz','shufflequestions_adv','0'),(659,'quiz','questionsperpage','1'),(660,'quiz','questionsperpage_adv','0'),(661,'quiz','navmethod','free'),(662,'quiz','navmethod_adv','1'),(663,'quiz','shuffleanswers','1'),(664,'quiz','shuffleanswers_adv','0'),(665,'quiz','preferredbehaviour','deferredfeedback'),(666,'quiz','attemptonlast','0'),(667,'quiz','attemptonlast_adv','1'),(668,'quiz','reviewattempt','69904'),(669,'quiz','reviewcorrectness','69904'),(670,'quiz','reviewmarks','69904'),(671,'quiz','reviewspecificfeedback','69904'),(672,'quiz','reviewgeneralfeedback','69904'),(673,'quiz','reviewrightanswer','69904'),(674,'quiz','reviewoverallfeedback','4368'),(675,'quiz','showuserpicture','0'),(676,'quiz','showuserpicture_adv','0'),(677,'quiz','decimalpoints','2'),(678,'quiz','decimalpoints_adv','0'),(679,'quiz','questiondecimalpoints','-1'),(680,'quiz','questiondecimalpoints_adv','0'),(681,'quiz','showblocks','0'),(682,'quiz','showblocks_adv','1'),(683,'quiz','password',''),(684,'quiz','password_adv','0'),(685,'quiz','subnet',''),(686,'quiz','subnet_adv','0'),(687,'quiz','delay1','0'),(688,'quiz','delay1_adv','0'),(689,'quiz','delay2','0'),(690,'quiz','delay2_adv','0'),(691,'quiz','browsersecurity','-'),(692,'quiz','browsersecurity_adv','1'),(693,'resource','framesize','130'),(694,'resource','requiremodintro','1'),(695,'resource','displayoptions','0,1,4,5,6'),(696,'resource','printheading','0'),(697,'resource','printheading_adv','0'),(698,'resource','printintro','1'),(699,'resource','printintro_adv','0'),(700,'resource','display','0'),(701,'resource','display_adv','0'),(702,'resource','showsize','0'),(703,'resource','showsize_adv','0'),(704,'resource','showtype','0'),(705,'resource','showtype_adv','0'),(706,'resource','popupwidth','620'),(707,'resource','popupwidth_adv','1'),(708,'resource','popupheight','450'),(709,'resource','popupheight_adv','1'),(710,'resource','filterfiles','0'),(711,'resource','filterfiles_adv','1'),(712,'scorm','displaycoursestructure','0'),(713,'scorm','displaycoursestructure_adv','0'),(714,'scorm','popup','0'),(715,'scorm','popup_adv','0'),(716,'scorm','framewidth','100'),(717,'scorm','framewidth_adv','1'),(718,'scorm','frameheight','500'),(719,'scorm','frameheight_adv','1'),(720,'scorm','winoptgrp_adv','1'),(721,'scorm','resizable','0'),(722,'scorm','scrollbars','0'),(723,'scorm','directories','0'),(724,'scorm','location','0'),(725,'scorm','menubar','0'),(726,'scorm','toolbar','0'),(727,'scorm','status','0'),(728,'scorm','skipview','0'),(729,'scorm','skipview_adv','1'),(730,'scorm','hidebrowse','0'),(731,'scorm','hidebrowse_adv','1'),(732,'scorm','hidetoc','0'),(733,'scorm','hidetoc_adv','1'),(734,'scorm','hidenav','0'),(735,'scorm','hidenav_adv','0'),(736,'scorm','grademethod','1'),(737,'scorm','grademethod_adv','0'),(738,'scorm','maxgrade','100'),(739,'scorm','maxgrade_adv','0'),(740,'scorm','maxattempt','0'),(741,'scorm','maxattempt_adv','0'),(742,'scorm','whatgrade','0'),(743,'scorm','whatgrade_adv','0'),(744,'scorm','displayattemptstatus','1'),(745,'scorm','displayattemptstatus_adv','0'),(746,'scorm','forcecompleted','0'),(747,'scorm','forcecompleted_adv','1'),(748,'scorm','forcenewattempt','0'),(749,'scorm','forcenewattempt_adv','1'),(750,'scorm','lastattemptlock','0'),(751,'scorm','lastattemptlock_adv','1'),(752,'scorm','auto','0'),(753,'scorm','auto_adv','1'),(754,'scorm','updatefreq','0'),(755,'scorm','updatefreq_adv','1'),(756,'scorm','allowtypeexternal','0'),(757,'scorm','allowtypelocalsync','0'),(758,'scorm','allowtypeimsrepository','0'),(759,'scorm','allowtypeexternalaicc','0'),(760,'scorm','allowaicchacp','0'),(761,'scorm','aicchacptimeout','30'),(762,'scorm','aicchacpkeepsessiondata','1'),(763,'scorm','forcejavascript','1'),(764,'scorm','allowapidebug','0'),(765,'scorm','apidebugmask','.*'),(766,'url','framesize','130'),(767,'url','requiremodintro','1'),(768,'url','secretphrase',''),(769,'url','rolesinparams','0'),(770,'url','displayoptions','0,1,5,6'),(771,'url','printheading','0'),(772,'url','printheading_adv','0'),(773,'url','printintro','1'),(774,'url','printintro_adv','0'),(775,'url','display','0'),(776,'url','display_adv','0'),(777,'url','popupwidth','620'),(778,'url','popupwidth_adv','1'),(779,'url','popupheight','450'),(780,'url','popupheight_adv','1'),(781,'workshop','grade','80'),(782,'workshop','gradinggrade','20'),(783,'workshop','gradedecimals','0'),(784,'workshop','maxbytes','0'),(785,'workshop','strategy','accumulative'),(786,'workshop','examplesmode','0'),(787,'workshopallocation_random','numofreviews','5'),(788,'workshopform_numerrors','grade0','Нет'),(789,'workshopform_numerrors','grade1','Да'),(790,'workshopeval_best','comparison','5'),(791,'assignsubmission_file','default','1'),(792,'assignsubmission_file','maxbytes','1048576'),(793,'assignsubmission_onlinetext','default','0'),(794,'assignsubmission_comments','default','0'),(795,'assignfeedback_comments','default','0'),(796,'assignfeedback_file','default','0'),(797,'blocks/section_links','numsections1','22'),(798,'blocks/section_links','incby1','2'),(799,'blocks/section_links','numsections2','40'),(800,'blocks/section_links','incby2','5'),(801,'enrol_cohort','roleid','5'),(802,'enrol_cohort','unenrolaction','0'),(803,'enrol_database','defaultrole','5'),(804,'enrol_database','defaultcategory','1'),(805,'enrol_flatfile','map_1','manager'),(806,'enrol_flatfile','map_2','coursecreator'),(807,'enrol_flatfile','map_3','editingteacher'),(808,'enrol_flatfile','map_4','teacher'),(809,'enrol_flatfile','map_5','student'),(810,'enrol_flatfile','map_6','guest'),(811,'enrol_flatfile','map_7','user'),(812,'enrol_flatfile','map_8','frontpage'),(813,'enrol_imsenterprise','imsrolemap01','5'),(814,'enrol_imsenterprise','imsrolemap02','3'),(815,'enrol_imsenterprise','imsrolemap03','3'),(816,'enrol_imsenterprise','imsrolemap04','5'),(817,'enrol_imsenterprise','imsrolemap05','0'),(818,'enrol_imsenterprise','imsrolemap06','4'),(819,'enrol_imsenterprise','imsrolemap07','0'),(820,'enrol_imsenterprise','imsrolemap08','4'),(821,'enrol_manual','roleid','5'),(822,'enrol_meta','nosyncroleids',''),(823,'enrol_meta','syncall','1'),(824,'enrol_meta','unenrolaction','0'),(825,'enrol_mnet','roleid','5'),(826,'enrol_mnet','roleid_adv','1'),(827,'enrol_paypal','roleid','5'),(828,'enrol_self','roleid','5'),(829,'enrol_self','lastcron','1363682701'),(830,'enrol_cohort','lastcron','1363681802'),(833,'quiz_statistics','lastcron','1363673702'),(834,'workshopallocation_scheduled','lastcron','1363682701'),(835,'core_plugin','recentfetch','1363628704'),(836,'core_plugin','recentresponse','{\"status\":\"OK\",\"provider\":\"http:\\/\\/download.moodle.org\\/api\\/1.1\\/updates.php\",\"apiver\":\"1.1\",\"timegenerated\":1363629137,\"ticket\":\"JUM5JTkxOCVGQW8lRDJxeiVFMiU5MyVEQyU4MCVFNmUlMTMlQjlKJUNBJUM5JUZCJTA3MCU5RnB4JUJFJUZGT2glRkUlMjhaJURGRiUxQiU4NSU3QiU4NyU4OUw=\",\"forbranch\":\"2.4\",\"forversion\":\"2012120301\",\"updates\":{\"core\":[{\"version\":2012120303,\"release\":\"2.4.3 (Build: 20130318)\",\"maturity\":200,\"branch\":\"2.4\",\"url\":\"http:\\/\\/download.moodle.org\",\"download\":\"http:\\/\\/download.moodle.org\\/download.php\\/direct\\/stable24\\/moodle-latest-24.zip\"},{\"version\":2013031400,\"release\":\"2.5dev (Build: 20130314)\",\"maturity\":50,\"branch\":\"2.5\",\"url\":\"http:\\/\\/download.moodle.org\",\"download\":\"http:\\/\\/download.moodle.org\\/download.php\\/direct\\/moodle\\/moodle-latest.zip\"}],\"mod_autoview\":[{\"version\":\"2012100901\",\"maturity\":200,\"url\":\"https:\\/\\/moodle.org\\/plugins\\/pluginversion.php?id=1461\",\"download\":\"https:\\/\\/moodle.org\\/plugins\\/download.php\\/1461\\/mod_autoview_moodle24_2012100901.zip\",\"downloadmd5\":\"849bf104eccffff8b418bd42a11707ab\"}],\"block_repo_filemanager\":[{\"version\":\"2013020301\",\"release\":\"2013020301\",\"maturity\":200,\"url\":\"https:\\/\\/moodle.org\\/plugins\\/pluginversion.php?id=2119\",\"download\":\"https:\\/\\/moodle.org\\/plugins\\/download.php\\/2119\\/block_repo_filemanager_moodle24_2013020301.zip\",\"downloadmd5\":\"88744ac6df60d622e43355e69efda3df\"}],\"repository_coursefilearea\":[{\"version\":\"2013020301\",\"release\":\"2013020301\",\"maturity\":200,\"url\":\"https:\\/\\/moodle.org\\/plugins\\/pluginversion.php?id=2120\",\"download\":\"https:\\/\\/moodle.org\\/plugins\\/download.php\\/2120\\/repository_coursefilearea_moodle24_2013020301.zip\",\"downloadmd5\":\"228f9f14e70bab8e50a914be56cdf2fa\"}]}}'),(837,'repository_dropbox','lastcron','1363682702'),(838,'tool_qeupgradehelper','lastcron','1363682702'),(839,'message','email_provider_enrol_manual_expiry_notification_permitted','permitted'),(840,'message','jabber_provider_enrol_manual_expiry_notification_permitted','permitted'),(841,'message','popup_provider_enrol_manual_expiry_notification_permitted','permitted'),(842,'message','message_provider_enrol_manual_expiry_notification_loggedin','email'),(843,'message','message_provider_enrol_manual_expiry_notification_loggedoff','email'),(844,'enrol_payanyway','version','2011121300'),(845,'message','email_provider_enrol_self_expiry_notification_permitted','permitted'),(846,'message','jabber_provider_enrol_self_expiry_notification_permitted','permitted'),(847,'message','popup_provider_enrol_self_expiry_notification_permitted','permitted'),(848,'message','message_provider_enrol_self_expiry_notification_loggedin','email'),(849,'message','message_provider_enrol_self_expiry_notification_loggedoff','email'),(850,'repository_coursefilearea','version','2012062802'),(851,'cachestore_file','version','2012112900'),(852,'cachestore_memcache','version','2012112900'),(853,'cachestore_memcached','version','2012112900'),(854,'cachestore_mongodb','version','2012112900'),(855,'cachestore_session','version','2012112900'),(856,'cachestore_static','version','2012112900'),(857,'assignfeedback_offline','version','2012112900'),(858,'tinymce_dragmath','version','2012112900'),(859,'tinymce_moodleemoticon','version','2012112900'),(860,'tinymce_moodleimage','version','2012112900'),(861,'tinymce_moodlemedia','version','2012112900'),(862,'tinymce_moodlenolink','version','2012112900'),(863,'tinymce_spellchecker','version','2012112900'),(865,'tinymce_spellchecker','spellengine','GoogleSpell'),(866,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),(867,'enrol_manual','lastcron','1363682701');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context`
--

LOCK TABLES `mdl_context` WRITE;
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` VALUES (1,10,0,'/1',1),(2,50,1,'/1/2',2),(3,40,1,'/1/3',2),(4,30,1,'/1/4',2),(5,30,2,'/1/5',2),(6,80,1,'/1/2/6',3),(7,80,2,'/1/2/7',3),(8,80,3,'/1/2/8',3),(9,80,4,'/1/9',2),(10,80,5,'/1/10',2),(11,80,6,'/1/11',2),(12,80,7,'/1/12',2),(14,80,9,'/1/14',2),(15,30,3,'/1/15',2);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context_temp`
--

LOCK TABLES `mdl_context_temp` WRITE;
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `sectioncache` longtext COLLATE utf8_unicode_ci,
  `modinfo` longtext COLLATE utf8_unicode_ci,
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionstartonenrol` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,0,'http://moodle.opensoftdev.ru','moodle','',NULL,0,'site',1,'a:2:{i:0;O:8:\"stdClass\":2:{s:2:\"id\";s:1:\"2\";s:4:\"name\";N;}i:1;O:8:\"stdClass\":2:{s:2:\"id\";s:1:\"1\";s:4:\"name\";N;}}','a:0:{}',3,0,0,0,0,0,1,1,0,0,0,'','',1352713751,1352713779,0,0,0,0);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Разное',NULL,NULL,0,0,10000,0,1,1,1352713751,1,'/1',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `mdl_course_completion_aggr_methd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_aggr_methd`
--

LOCK TABLES `mdl_course_completion_aggr_methd` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

DROP TABLE IF EXISTS `mdl_course_completion_crit_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_crit_compl`
--

LOCK TABLES `mdl_course_completion_crit_compl` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_criteria`
--

DROP TABLE IF EXISTS `mdl_course_completion_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_criteria`
--

LOCK TABLES `mdl_course_completion_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completions`
--

DROP TABLE IF EXISTS `mdl_course_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completions`
--

LOCK TABLES `mdl_course_completions` WRITE;
/*!40000 ALTER TABLE `mdl_course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_format_options`
--

DROP TABLE IF EXISTS `mdl_course_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_format_options`
--

LOCK TABLES `mdl_course_format_options` WRITE;
/*!40000 ALTER TABLE `mdl_course_format_options` DISABLE KEYS */;
INSERT INTO `mdl_course_format_options` VALUES (1,1,'site',0,'coursedisplay','0'),(2,1,'site',0,'numsections','1'),(3,1,'site',0,'hiddensections','0');
/*!40000 ALTER TABLE `mdl_course_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules`
--

LOCK TABLES `mdl_course_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_avail_fields`
--

DROP TABLE IF EXISTS `mdl_course_modules_avail_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_avail_fields`
--

LOCK TABLES `mdl_course_modules_avail_fields` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_avail_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_avail_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_availability`
--

DROP TABLE IF EXISTS `mdl_course_modules_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table stores conditions that affect whether a module/activit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_availability`
--

LOCK TABLES `mdl_course_modules_availability` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_completion`
--

DROP TABLE IF EXISTS `mdl_course_modules_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_completion`
--

LOCK TABLES `mdl_course_modules_completion` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_completion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_published`
--

DROP TABLE IF EXISTS `mdl_course_published`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_published`
--

LOCK TABLES `mdl_course_published` WRITE;
/*!40000 ALTER TABLE `mdl_course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_published` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_request`
--

LOCK TABLES `mdl_course_request` WRITE;
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections`
--

LOCK TABLES `mdl_course_sections` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
INSERT INTO `mdl_course_sections` VALUES (1,1,1,NULL,'',1,'',1,0,0,0,0),(2,1,0,NULL,'',1,'',1,0,0,0,0);
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections_avail_fields`
--

DROP TABLE IF EXISTS `mdl_course_sections_avail_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections_avail_fields`
--

LOCK TABLES `mdl_course_sections_avail_fields` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections_avail_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_sections_avail_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections_availability`
--

DROP TABLE IF EXISTS `mdl_course_sections_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Completion or grade conditions that affect if a section is c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections_availability`
--

LOCK TABLES `mdl_course_sections_availability` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_sections_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data`
--

LOCK TABLES `mdl_data` WRITE;
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_content`
--

LOCK TABLES `mdl_data_content` WRITE;
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_fields`
--

LOCK TABLES `mdl_data_fields` WRITE;
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_records`
--

LOCK TABLES `mdl_data_records` WRITE;
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol`
--

DROP TABLE IF EXISTS `mdl_enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol`
--

LOCK TABLES `mdl_enrol` WRITE;
/*!40000 ALTER TABLE `mdl_enrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_authorize`
--

DROP TABLE IF EXISTS `mdl_enrol_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_authorize` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) NOT NULL DEFAULT '0',
  `ccname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `transid` bigint(20) NOT NULL DEFAULT '0',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about authorize.net transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_authorize`
--

LOCK TABLES `mdl_enrol_authorize` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_authorize` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_authorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_authorize_refunds`
--

DROP TABLE IF EXISTS `mdl_enrol_authorize_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_authorize_refunds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transid` bigint(20) DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Authorize.net refunds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_authorize_refunds`
--

LOCK TABLES `mdl_enrol_authorize_refunds` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_authorize_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_authorize_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_flatfile`
--

DROP TABLE IF EXISTS `mdl_enrol_flatfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_flatfile`
--

LOCK TABLES `mdl_enrol_flatfile` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_payanyway_transactions`
--

DROP TABLE IF EXISTS `mdl_enrol_payanyway_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_payanyway_transactions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `cost` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_created` bigint(10) NOT NULL DEFAULT '0',
  `success` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PayAnyWay enrolment plugin transactions log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_payanyway_transactions`
--

LOCK TABLES `mdl_enrol_payanyway_transactions` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_payanyway_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_payanyway_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_paypal`
--

LOCK TABLES `mdl_enrol_paypal` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event`
--

LOCK TABLES `mdl_event` WRITE;
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event_subscriptions`
--

DROP TABLE IF EXISTS `mdl_event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event_subscriptions`
--

LOCK TABLES `mdl_event_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_handlers`
--

LOCK TABLES `mdl_events_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
INSERT INTO `mdl_events_handlers` VALUES (1,'portfolio_send','moodle','/lib/portfolio.php','s:22:\"portfolio_handle_event\";','cron',0,0),(2,'user_logout','mod_chat','/mod/chat/lib.php','s:16:\"chat_user_logout\";','instant',0,1),(3,'role_assigned','mod_forum','/mod/forum/lib.php','s:24:\"forum_user_role_assigned\";','instant',0,1),(4,'user_unenrolled','mod_forum','/mod/forum/lib.php','s:21:\"forum_user_unenrolled\";','instant',0,1),(5,'quiz_attempt_submitted','mod_quiz','/mod/quiz/locallib.php','s:30:\"quiz_attempt_submitted_handler\";','cron',0,1),(6,'quiz_attempt_overdue','mod_quiz','/mod/quiz/locallib.php','s:28:\"quiz_attempt_overdue_handler\";','cron',0,1),(7,'role_assigned','enrol_category','/enrol/category/locallib.php','a:2:{i:0;s:22:\"enrol_category_handler\";i:1;s:13:\"role_assigned\";}','instant',0,1),(8,'role_unassigned','enrol_category','/enrol/category/locallib.php','a:2:{i:0;s:22:\"enrol_category_handler\";i:1;s:15:\"role_unassigned\";}','instant',0,1),(9,'cohort_member_added','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:12:\"member_added\";}','instant',0,1),(10,'cohort_member_removed','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:14:\"member_removed\";}','instant',0,1),(11,'cohort_deleted','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:7:\"deleted\";}','instant',0,1),(12,'role_assigned','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:13:\"role_assigned\";}','instant',0,1),(13,'role_unassigned','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:15:\"role_unassigned\";}','instant',0,1),(14,'user_enrolled','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:13:\"user_enrolled\";}','instant',0,1),(15,'user_unenrolled','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:15:\"user_unenrolled\";}','instant',0,1),(16,'user_enrol_modified','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:19:\"user_enrol_modified\";}','instant',0,1),(17,'course_deleted','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:14:\"course_deleted\";}','instant',0,1),(18,'groups_member_added','mod_quiz','/mod/quiz/locallib.php','s:32:\"quiz_groups_member_added_handler\";','instant',0,1),(19,'groups_member_removed','mod_quiz','/mod/quiz/locallib.php','s:34:\"quiz_groups_member_removed_handler\";','instant',0,1),(20,'groups_members_removed','mod_quiz','/mod/quiz/locallib.php','s:35:\"quiz_groups_members_removed_handler\";','instant',0,1),(21,'groups_group_deleted','mod_quiz','/mod/quiz/locallib.php','s:33:\"quiz_groups_group_deleted_handler\";','instant',0,1);
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue`
--

LOCK TABLES `mdl_events_queue` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue_handlers`
--

LOCK TABLES `mdl_events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_functions`
--

DROP TABLE IF EXISTS `mdl_external_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_functions`
--

LOCK TABLES `mdl_external_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_functions` VALUES (1,'moodle_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(2,'core_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(3,'moodle_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(4,'core_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(5,'moodle_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(6,'core_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(7,'moodle_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(8,'core_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(9,'moodle_group_get_groupmembers','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(10,'core_group_get_group_members','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(11,'moodle_group_add_groupmembers','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(12,'core_group_add_group_members','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(13,'moodle_group_delete_groupmembers','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(14,'core_group_delete_group_members','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(15,'core_group_create_groupings','core_group_external','create_groupings','group/externallib.php','moodle',''),(16,'core_group_update_groupings','core_group_external','update_groupings','group/externallib.php','moodle',''),(17,'core_group_get_groupings','core_group_external','get_groupings','group/externallib.php','moodle',''),(18,'core_group_get_course_groupings','core_group_external','get_course_groupings','group/externallib.php','moodle',''),(19,'core_group_delete_groupings','core_group_external','delete_groupings','group/externallib.php','moodle',''),(20,'core_group_assign_grouping','core_group_external','assign_grouping','group/externallib.php','moodle',''),(21,'core_group_unassign_grouping','core_group_external','unassign_grouping','group/externallib.php','moodle',''),(22,'moodle_file_get_files','core_files_external','get_files','files/externallib.php','moodle',''),(23,'core_files_get_files','core_files_external','get_files','files/externallib.php','moodle',''),(24,'moodle_file_upload','core_files_external','upload','files/externallib.php','moodle',''),(25,'core_files_upload','core_files_external','upload','files/externallib.php','moodle',''),(26,'moodle_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(27,'core_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(28,'moodle_user_get_users_by_id','core_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(29,'core_user_get_users_by_id','core_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(30,'moodle_user_get_users_by_courseid','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(31,'moodle_user_get_course_participants_by_id','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(32,'core_user_get_course_user_profiles','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(33,'moodle_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(34,'core_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(35,'moodle_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(36,'core_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(37,'moodle_enrol_get_enrolled_users','moodle_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),(38,'core_enrol_get_enrolled_users','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(39,'moodle_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(40,'core_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(41,'moodle_role_assign','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(42,'core_role_assign_roles','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(43,'moodle_role_unassign','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(44,'core_role_unassign_roles','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(45,'core_course_get_contents','core_course_external','get_course_contents','course/externallib.php','moodle','moodle/course:update,moodle/course:viewhiddencourses'),(46,'moodle_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(47,'core_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(48,'moodle_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(49,'core_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(50,'core_course_delete_courses','core_course_external','delete_courses','course/externallib.php','moodle','moodle/course:delete'),(51,'core_course_duplicate_course','core_course_external','duplicate_course','course/externallib.php','moodle','moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),(52,'core_course_get_categories','core_course_external','get_categories','course/externallib.php','moodle','moodle/category:viewhiddencategories'),(53,'core_course_create_categories','core_course_external','create_categories','course/externallib.php','moodle','moodle/category:manage'),(54,'core_course_update_categories','core_course_external','update_categories','course/externallib.php','moodle','moodle/category:manage'),(55,'core_course_delete_categories','core_course_external','delete_categories','course/externallib.php','moodle','moodle/category:manage'),(56,'moodle_message_send_instantmessages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage'),(57,'core_message_send_instant_messages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage'),(58,'moodle_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(59,'core_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(60,'moodle_webservice_get_siteinfo','core_webservice_external','get_site_info','webservice/externallib.php','moodle',''),(61,'core_webservice_get_site_info','core_webservice_external','get_site_info','webservice/externallib.php','moodle',''),(62,'moodle_enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol'),(63,'enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol'),(64,'core_enrol_get_enrolled_users_with_capability','core_enrol_external','get_enrolled_users_with_capability','enrol/externallib.php','moodle',''),(65,'core_course_import_course','core_course_external','import_course','course/externallib.php','moodle','moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),(66,'core_get_string','core_external','get_string','lib/external/externallib.php','moodle',''),(67,'core_get_strings','core_external','get_strings','lib/external/externallib.php','moodle',''),(68,'core_get_component_strings','core_external','get_component_strings','lib/external/externallib.php','moodle',''),(69,'mod_assign_get_grades','mod_assign_external','get_grades','mod/assign/externallib.php','mod_assign',''),(70,'mod_assign_get_assignments','mod_assign_external','get_assignments','mod/assign/externallib.php','mod_assign','');
/*!40000 ALTER TABLE `mdl_external_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services`
--

DROP TABLE IF EXISTS `mdl_external_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services`
--

LOCK TABLES `mdl_external_services` WRITE;
/*!40000 ALTER TABLE `mdl_external_services` DISABLE KEYS */;
INSERT INTO `mdl_external_services` VALUES (1,'Moodle mobile web service',0,NULL,0,'moodle',1352713753,1352713778,'moodle_mobile_app',1);
/*!40000 ALTER TABLE `mdl_external_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_functions`
--

DROP TABLE IF EXISTS `mdl_external_services_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_functions`
--

LOCK TABLES `mdl_external_services_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_services_functions` VALUES (1,1,'moodle_enrol_get_users_courses'),(2,1,'moodle_enrol_get_enrolled_users'),(3,1,'moodle_user_get_users_by_id'),(4,1,'moodle_webservice_get_siteinfo'),(5,1,'moodle_notes_create_notes'),(6,1,'moodle_user_get_course_participants_by_id'),(7,1,'moodle_user_get_users_by_courseid'),(8,1,'moodle_message_send_instantmessages'),(9,1,'core_course_get_contents'),(10,1,'core_get_component_strings');
/*!40000 ALTER TABLE `mdl_external_services_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_users`
--

DROP TABLE IF EXISTS `mdl_external_services_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_users`
--

LOCK TABLES `mdl_external_services_users` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_services_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_tokens`
--

DROP TABLE IF EXISTS `mdl_external_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(20) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_tokens`
--

LOCK TABLES `mdl_external_tokens` WRITE;
/*!40000 ALTER TABLE `mdl_external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback`
--

DROP TABLE IF EXISTS `mdl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback`
--

LOCK TABLES `mdl_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completed`
--

DROP TABLE IF EXISTS `mdl_feedback_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completed`
--

LOCK TABLES `mdl_feedback_completed` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completedtmp`
--

DROP TABLE IF EXISTS `mdl_feedback_completedtmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completedtmp`
--

LOCK TABLES `mdl_feedback_completedtmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_item`
--

DROP TABLE IF EXISTS `mdl_feedback_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_item`
--

LOCK TABLES `mdl_feedback_item` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `mdl_feedback_sitecourse_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_sitecourse_map`
--

LOCK TABLES `mdl_feedback_sitecourse_map` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_template`
--

DROP TABLE IF EXISTS `mdl_feedback_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_template`
--

LOCK TABLES `mdl_feedback_template` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_tracking`
--

DROP TABLE IF EXISTS `mdl_feedback_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_tracking`
--

LOCK TABLES `mdl_feedback_tracking` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_value`
--

DROP TABLE IF EXISTS `mdl_feedback_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_value`
--

LOCK TABLES `mdl_feedback_value` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_valuetmp`
--

DROP TABLE IF EXISTS `mdl_feedback_valuetmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_valuetmp`
--

LOCK TABLES `mdl_feedback_valuetmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files`
--

DROP TABLE IF EXISTS `mdl_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  `referencelastsync` bigint(10) DEFAULT NULL,
  `referencelifetime` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files`
--

LOCK TABLES `mdl_files` WRITE;
/*!40000 ALTER TABLE `mdl_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files_reference`
--

DROP TABLE IF EXISTS `mdl_files_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `lifetime` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files_reference`
--

LOCK TABLES `mdl_files_reference` WRITE;
/*!40000 ALTER TABLE `mdl_files_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_active`
--

DROP TABLE IF EXISTS `mdl_filter_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_active`
--

LOCK TABLES `mdl_filter_active` WRITE;
/*!40000 ALTER TABLE `mdl_filter_active` DISABLE KEYS */;
INSERT INTO `mdl_filter_active` VALUES (1,'filter/activitynames',1,1,1),(2,'filter/mediaplugin',1,1,2),(3,'filter/data',1,-9999,3),(4,'filter/glossary',1,-9999,4),(5,'filter/emailprotect',1,-9999,5),(6,'filter/multilang',1,-9999,6),(7,'filter/emoticon',1,-9999,7),(8,'filter/tidy',1,-9999,8),(9,'filter/urltolink',1,-9999,9),(10,'filter/algebra',1,-9999,10),(11,'filter/tex',1,-9999,11),(12,'filter/censor',1,-9999,12);
/*!40000 ALTER TABLE `mdl_filter_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_config`
--

DROP TABLE IF EXISTS `mdl_filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_config`
--

LOCK TABLES `mdl_filter_config` WRITE;
/*!40000 ALTER TABLE `mdl_filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_folder`
--

DROP TABLE IF EXISTS `mdl_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_folder`
--

LOCK TABLES `mdl_folder` WRITE;
/*!40000 ALTER TABLE `mdl_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum`
--

LOCK TABLES `mdl_forum` WRITE;
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussions`
--

LOCK TABLES `mdl_forum_discussions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_posts`
--

LOCK TABLES `mdl_forum_posts` WRITE;
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_queue`
--

LOCK TABLES `mdl_forum_queue` WRITE;
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_read`
--

LOCK TABLES `mdl_forum_read` WRITE;
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_subscriptions`
--

LOCK TABLES `mdl_forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_track_prefs`
--

LOCK TABLES `mdl_forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary`
--

LOCK TABLES `mdl_glossary` WRITE;
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_alias`
--

LOCK TABLES `mdl_glossary_alias` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_categories`
--

LOCK TABLES `mdl_glossary_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries`
--

LOCK TABLES `mdl_glossary_entries` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries_categories`
--

LOCK TABLES `mdl_glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_formats`
--

LOCK TABLES `mdl_glossary_formats` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
INSERT INTO `mdl_glossary_formats` VALUES (1,'continuous','continuous',1,1,'','','',''),(2,'dictionary','dictionary',1,1,'','','',''),(3,'encyclopedia','encyclopedia',1,1,'','','',''),(4,'entrylist','entrylist',1,1,'','','',''),(5,'faq','faq',1,1,'','','',''),(6,'fullwithauthor','fullwithauthor',1,1,'','','',''),(7,'fullwithoutauthor','fullwithoutauthor',1,1,'','','','');
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories`
--

LOCK TABLES `mdl_grade_categories` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
INSERT INTO `mdl_grade_categories` VALUES (1,1,NULL,1,'/1/','?',11,0,0,1,0,0,1358942065,1358942065,0);
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories_history`
--

LOCK TABLES `mdl_grade_categories_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
INSERT INTO `mdl_grade_categories_history` VALUES (1,1,1,'system',1358942065,3,1,NULL,0,NULL,'?',11,0,0,1,0,0,0),(2,2,1,'system',1358942065,3,1,NULL,1,'/1/','?',11,0,0,1,0,0,0);
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades`
--

LOCK TABLES `mdl_grade_grades` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades_history`
--

LOCK TABLES `mdl_grade_grades_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_newitem`
--

LOCK TABLES `mdl_grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_values`
--

LOCK TABLES `mdl_grade_import_values` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items`
--

LOCK TABLES `mdl_grade_items` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
INSERT INTO `mdl_grade_items` VALUES (1,1,NULL,NULL,'course',NULL,1,NULL,NULL,NULL,NULL,1,'100.00000','0.00000',NULL,NULL,'0.00000','1.00000','0.00000','0.00000',1,0,NULL,0,0,0,0,1358942065,1358942065);
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items_history`
--

LOCK TABLES `mdl_grade_items_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
INSERT INTO `mdl_grade_items_history` VALUES (1,1,1,'system',1358942065,3,1,NULL,NULL,'course',NULL,1,NULL,NULL,NULL,NULL,1,'100.00000','0.00000',NULL,NULL,'0.00000','1.00000','0.00000','0.00000',1,0,0,0,1,0,NULL);
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_letters`
--

LOCK TABLES `mdl_grade_letters` WRITE;
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes`
--

LOCK TABLES `mdl_grade_outcomes` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_courses`
--

LOCK TABLES `mdl_grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_history`
--

LOCK TABLES `mdl_grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_settings`
--

LOCK TABLES `mdl_grade_settings` WRITE;
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_areas`
--

DROP TABLE IF EXISTS `mdl_grading_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_areas`
--

LOCK TABLES `mdl_grading_areas` WRITE;
/*!40000 ALTER TABLE `mdl_grading_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_definitions`
--

DROP TABLE IF EXISTS `mdl_grading_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_definitions`
--

LOCK TABLES `mdl_grading_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_grading_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_instances`
--

DROP TABLE IF EXISTS `mdl_grading_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_instances`
--

LOCK TABLES `mdl_grading_instances` WRITE;
/*!40000 ALTER TABLE `mdl_grading_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_comments`
--

LOCK TABLES `mdl_gradingform_guide_comments` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_criteria`
--

LOCK TABLES `mdl_gradingform_guide_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_fillings`
--

LOCK TABLES `mdl_gradingform_guide_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_criteria`
--

LOCK TABLES `mdl_gradingform_rubric_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_fillings`
--

LOCK TABLES `mdl_gradingform_rubric_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_levels`
--

LOCK TABLES `mdl_gradingform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings`
--

LOCK TABLES `mdl_groupings` WRITE;
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings_groups`
--

LOCK TABLES `mdl_groupings_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups`
--

LOCK TABLES `mdl_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
INSERT INTO `mdl_groups` VALUES (1,1,'','test','',1,'',0,0,1358935757,1358935757);
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups_members`
--

LOCK TABLES `mdl_groups_members` WRITE;
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_imscp`
--

DROP TABLE IF EXISTS `mdl_imscp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_imscp`
--

LOCK TABLES `mdl_imscp` WRITE;
/*!40000 ALTER TABLE `mdl_imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_imscp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_label`
--

LOCK TABLES `mdl_label` WRITE;
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson`
--

LOCK TABLES `mdl_lesson` WRITE;
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_answers`
--

LOCK TABLES `mdl_lesson_answers` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_attempts`
--

LOCK TABLES `mdl_lesson_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_branch`
--

LOCK TABLES `mdl_lesson_branch` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_grades`
--

LOCK TABLES `mdl_lesson_grades` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_high_scores`
--

DROP TABLE IF EXISTS `mdl_lesson_high_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='high scores for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_high_scores`
--

LOCK TABLES `mdl_lesson_high_scores` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_pages`
--

LOCK TABLES `mdl_lesson_pages` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_timer`
--

LOCK TABLES `mdl_lesson_timer` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_license`
--

DROP TABLE IF EXISTS `mdl_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_license`
--

LOCK TABLES `mdl_license` WRITE;
/*!40000 ALTER TABLE `mdl_license` DISABLE KEYS */;
INSERT INTO `mdl_license` VALUES (1,'unknown','Unknown license','',1,2010033100),(2,'allrightsreserved','All rights reserved','http://en.wikipedia.org/wiki/All_rights_reserved',1,2010033100),(3,'public','Public Domain','http://creativecommons.org/licenses/publicdomain/',1,2010033100),(4,'cc','Creative Commons','http://creativecommons.org/licenses/by/3.0/',1,2010033100),(5,'cc-nd','Creative Commons - NoDerivs','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(6,'cc-nc-nd','Creative Commons - No Commercial NoDerivs','http://creativecommons.org/licenses/by-nc-nd/3.0/',1,2010033100),(7,'cc-nc','Creative Commons - No Commercial','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(8,'cc-nc-sa','Creative Commons - No Commercial ShareAlike','http://creativecommons.org/licenses/by-nc-sa/3.0/',1,2010033100),(9,'cc-sa','Creative Commons - ShareAlike','http://creativecommons.org/licenses/by-sa/3.0/',1,2010033100);
/*!40000 ALTER TABLE `mdl_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log`
--

LOCK TABLES `mdl_log` WRITE;
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
INSERT INTO `mdl_log` VALUES (1,1352714686,2,'10.7.7.36',1,'user',0,'login','view.php?id=0&course=1','2'),(2,1352714704,2,'10.7.7.36',1,'user',0,'logout','view.php?id=2&course=1','2'),(3,1352714874,2,'10.7.0.208',1,'user',0,'login','view.php?id=0&course=1','2'),(4,1353058049,0,'10.7.0.228',1,'login',0,'error','index.php','admin'),(5,1353058186,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(6,1353058218,2,'10.7.0.228',1,'user',0,'update','view.php?id=2&course=1',''),(7,1353058223,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(8,1353058647,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(9,1353662727,2,'10.7.0.208',1,'user',0,'login','view.php?id=0&course=1','2'),(10,1353662728,2,'10.7.0.208',1,'course',0,'view','view.php?id=1','1'),(11,1353662734,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(12,1353662734,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(13,1353662750,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(14,1354635903,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(15,1355159703,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(16,1356128103,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(17,1356913803,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(18,1357909743,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(19,1357909773,2,'10.7.0.228',1,'user',0,'view all','index.php?id=1',''),(20,1357909785,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(21,1357961403,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(22,1358136003,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(23,1358582403,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(24,1358935616,0,'10.7.7.11',1,'login',0,'error','index.php','adminw'),(25,1358935626,0,'10.7.7.11',1,'login',0,'error','index.php','admin'),(26,1358935648,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(27,1358935649,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(28,1358935703,2,'10.7.0.228',1,'user',0,'view all','index.php?id=1',''),(29,1358935710,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(30,1358935725,2,'10.7.0.228',1,'user',0,'logout','view.php?id=2&course=1','2'),(31,1358935733,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(32,1358935734,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(33,1358935773,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(34,1358935774,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(35,1358935801,1,'10.7.7.11',1,'user',0,'login','view.php?id=0&course=1','1'),(36,1358935801,1,'10.7.7.11',1,'course',0,'view','view.php?id=1','1'),(37,1358935822,2,'10.7.0.228',1,'login',0,'error','index.php','admin'),(38,1358935894,2,'10.7.0.228',1,'user',0,'logout','view.php?id=2&course=1','2'),(39,1358935904,1,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','1'),(40,1358935912,2,'10.7.0.228',1,'user',0,'login','view.php?id=1&course=1','2'),(41,1358936021,2,'10.7.0.228',1,'user',0,'add','view.php?id=3&course=1',''),(42,1358936040,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(43,1358936091,1,'10.7.7.11',1,'login',0,'error','index.php','alena'),(44,1358936108,1,'10.7.7.11',1,'login',0,'error','index.php','alena'),(45,1358936120,1,'10.7.7.11',1,'login',0,'error','index.php','alena'),(46,1358936125,1,'10.7.7.11',1,'login',0,'error','index.php','alena'),(47,1358936129,1,'10.7.7.11',1,'login',0,'error','index.php','alena'),(48,1358936145,3,'10.7.7.11',1,'user',0,'login','view.php?id=1&course=1','3'),(49,1358936152,3,'10.7.7.11',1,'course',0,'view','view.php?id=1','1'),(50,1358936202,3,'10.7.7.11',1,'blog',0,'view','index.php?entryid=&tagid=&tag=','view blog entry'),(51,1358936460,3,'10.7.7.11',1,'blog',0,'view','index.php?entryid=&tagid=&tag=','view blog entry'),(52,1358936464,3,'10.7.7.11',1,'course',0,'view','view.php?id=1','1'),(53,1358936474,3,'10.7.7.11',1,'blog',0,'view','index.php?entryid=&tagid=&tag=','view blog entry'),(54,1358936505,3,'10.7.7.11',1,'forum',0,'user report','user.php?id=3','3'),(55,1358936599,3,'10.7.7.11',1,'course',0,'view','view.php?id=1','1'),(56,1358936661,3,'10.7.7.11',1,'user',0,'logout','view.php?id=3&course=1','3'),(57,1358936674,2,'10.7.7.11',1,'user',0,'login','view.php?id=0&course=1','2'),(58,1358936675,2,'10.7.7.11',1,'course',0,'view','view.php?id=1','1'),(59,1358936734,2,'10.7.7.11',1,'role',0,'override','admin/roles/override.php?contextid=15&roleid=1','Управляющий'),(60,1358936750,2,'10.7.7.11',1,'role',0,'override','admin/roles/override.php?contextid=15&roleid=2','Создатель курса'),(61,1358936810,2,'10.7.7.11',1,'user',0,'logout','view.php?id=2&course=1','2'),(62,1358936819,3,'10.7.7.11',1,'user',0,'login','view.php?id=0&course=1','3'),(63,1358936819,3,'10.7.7.11',1,'course',0,'view','view.php?id=1','1'),(64,1358941422,3,'10.7.7.11',1,'course',0,'view','view.php?id=1','1'),(65,1358941878,3,'10.7.7.11',1,'user',0,'view all','index.php?id=1',''),(66,1358941890,3,'10.7.7.11',1,'blog',0,'view','index.php?entryid=&tagid=&tag=','view blog entry'),(67,1358941892,3,'10.7.7.11',1,'user',0,'view all','index.php?id=1',''),(68,1358941901,3,'10.7.7.11',1,'notes',0,'view','index.php?course=1&user=0','view notes'),(69,1358941913,3,'10.7.7.11',1,'course',0,'report log','report/log/index.php?id=1','1'),(70,1358941927,3,'10.7.7.11',1,'course',0,'report live','report/loglive/index.php?id=1','1'),(71,1358941957,3,'10.7.7.11',1,'course',0,'report outline','report/outline/index.php?id=1','1'),(72,1358941992,3,'10.7.7.11',1,'course',0,'report participation','report/participation/index.php?id=1','1'),(73,1358942016,3,'10.7.7.11',1,'course',0,'report log','report/log/user.php?id=3&course=1&mode=today','1'),(74,1358942052,3,'10.7.7.11',1,'course',0,'report log','report/log/user.php?id=3&course=1&mode=today','1'),(75,1358942055,3,'10.7.7.11',1,'course',0,'report outline','report/outline/user.php?id=3&course=1&mode=outline','1'),(76,1358942062,3,'10.7.7.11',1,'course',0,'report outline','report/outline/user.php?id=3&course=1&mode=complete','1'),(77,1358942065,3,'10.7.7.11',1,'course',0,'user report','user.php?id=1&user=3&mode=grade','3'),(78,1358946521,3,'10.7.7.11',1,'user',0,'logout','view.php?id=3&course=1','3'),(79,1359216005,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(80,1359216005,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(81,1359539015,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(82,1359539016,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(83,1359739803,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(84,1359739803,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(85,1360438203,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(86,1360438203,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(87,1360970103,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(88,1360970103,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(89,1361582103,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(90,1361582103,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(91,1362105903,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(92,1362105903,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(93,1362717903,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(94,1362717904,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(95,1362980702,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(96,1362980702,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(97,1363018183,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(98,1363018194,0,'10.7.0.67',1,'login',0,'error','index.php','administrator'),(99,1363018210,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(100,1363018233,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(101,1363018360,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(102,1363018372,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(103,1363018381,0,'10.7.0.67',1,'library',0,'mailer','http://moodle.opensoftdev.ru/login/forgot_password.php','ERROR: Could not instantiate mail function.'),(104,1363018481,0,'10.7.0.67',1,'login',0,'error','index.php','moodle'),(105,1363018486,0,'10.7.0.67',1,'login',0,'error','index.php','moodle'),(106,1363018495,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(107,1363018503,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(108,1363018503,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(109,1363018619,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(110,1363018634,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(111,1363018643,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(112,1363018646,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(113,1363018802,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(114,1363018818,0,'10.7.0.67',1,'login',0,'error','index.php','admin'),(115,1363018832,0,'10.7.0.67',1,'login',0,'error','index.php','moodle'),(116,1363029248,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(117,1363029252,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(118,1363029258,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(119,1363029265,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(120,1363029278,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(121,1363029283,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(122,1363029306,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(123,1363029317,0,'128.73.41.253',1,'login',0,'error','index.php','guest'),(124,1363029363,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(125,1363029363,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(126,1363029367,0,'128.73.41.253',1,'login',0,'error','index.php',''),(127,1363029377,0,'128.73.41.253',1,'login',0,'error','index.php','alena'),(128,1363029381,0,'128.73.41.253',1,'login',0,'error','index.php','alena'),(129,1363029399,0,'128.73.41.253',1,'login',0,'error','index.php','alena'),(130,1363029413,0,'128.73.41.253',1,'login',0,'error','index.php','alena'),(131,1363029413,0,'128.73.41.253',1,'login',0,'error','index.php','alena'),(132,1363029421,0,'128.73.41.253',1,'login',0,'error','index.php','admin'),(133,1363029807,0,'10.7.16.11',1,'login',0,'error','index.php','guest'),(134,1363070873,2,'10.7.0.48',1,'user',0,'login','view.php?id=0&course=1','2'),(135,1363070874,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(136,1363070922,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(137,1363070923,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(138,1363071530,2,'10.7.0.228',1,'user',0,'login','view.php?id=0&course=1','2'),(139,1363071531,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(140,1363071545,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(141,1363071740,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(142,1363071757,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(143,1363071773,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(144,1363071815,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(145,1363072546,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(146,1363072551,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(147,1363072554,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(148,1363072652,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(149,1363072655,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(150,1363072734,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(151,1363072879,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(152,1363072932,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(153,1363072960,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(154,1363072967,2,'10.7.0.228',1,'course',0,'view','view.php?id=1','1'),(155,1363073555,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(156,1363152418,2,'217.118.90.210',1,'user',0,'login','view.php?id=0&course=1','2'),(157,1363152434,2,'217.118.90.210',1,'course',0,'view','view.php?id=1','1'),(158,1363366805,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(159,1363366806,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(160,1363628704,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(161,1363628704,2,'0.0.0.0',1,'library',0,'mailer','','ERROR: Could not instantiate mail function.'),(162,1363681474,2,'10.7.0.48',1,'user',0,'login','view.php?id=0&course=1','2'),(163,1363681475,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1'),(164,1363681727,2,'10.7.0.48',1,'course',0,'view','view.php?id=1','1');
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_display`
--

LOCK TABLES `mdl_log_display` WRITE;
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` VALUES (1,'course','user report','user','CONCAT(firstname, \' \', lastname)','moodle'),(2,'course','view','course','fullname','moodle'),(3,'course','view section','course_sections','name','moodle'),(4,'course','update','course','fullname','moodle'),(5,'course','enrol','course','fullname','moodle'),(6,'course','unenrol','course','fullname','moodle'),(7,'course','report log','course','fullname','moodle'),(8,'course','report live','course','fullname','moodle'),(9,'course','report outline','course','fullname','moodle'),(10,'course','report participation','course','fullname','moodle'),(11,'course','report stats','course','fullname','moodle'),(12,'message','write','user','CONCAT(firstname, \' \', lastname)','moodle'),(13,'message','read','user','CONCAT(firstname, \' \', lastname)','moodle'),(14,'message','add contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(15,'message','remove contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(16,'message','block contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(17,'message','unblock contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(18,'group','view','groups','name','moodle'),(19,'tag','update','tag','name','moodle'),(20,'tag','flag','tag','name','moodle'),(21,'user','view','user','CONCAT(firstname, \' \', lastname)','moodle'),(22,'assign','view','assign','name','mod_assign'),(23,'assign','add','assign','name','mod_assign'),(24,'assign','update','assign','name','mod_assign'),(25,'assign','view submission','assign','name','mod_assign'),(26,'assign','view feedback','assign','name','mod_assign'),(27,'assign','upload','assign','name','mod_assign'),(28,'assign','download all submissions','assign','name','mod_assign'),(29,'assign','view grading form','assign','name','mod_assign'),(30,'assign','delete mod','assign','name','mod_assign'),(31,'assign','view submission grading table','assign','name','mod_assign'),(32,'assign','view submit assignment form','assign','name','mod_assign'),(33,'assign','submit for grading','assign','name','mod_assign'),(34,'assign','submit','assign','name','mod_assign'),(35,'assign','revert submission to draft','assign','name','mod_assign'),(36,'assign','lock submission','assign','name','mod_assign'),(37,'assign','unlock submission','assign','name','mod_assign'),(38,'assign','grade submission','assign','name','mod_assign'),(39,'assign','view all','course','fullname','mod_assign'),(40,'assignment','view','assignment','name','mod_assignment'),(41,'assignment','add','assignment','name','mod_assignment'),(42,'assignment','update','assignment','name','mod_assignment'),(43,'assignment','view submission','assignment','name','mod_assignment'),(44,'assignment','upload','assignment','name','mod_assignment'),(45,'book','add','book','name','mod_book'),(46,'book','update','book','name','mod_book'),(47,'book','view','book','name','mod_book'),(48,'chat','view','chat','name','mod_chat'),(49,'chat','add','chat','name','mod_chat'),(50,'chat','update','chat','name','mod_chat'),(51,'chat','report','chat','name','mod_chat'),(52,'chat','talk','chat','name','mod_chat'),(53,'choice','view','choice','name','mod_choice'),(54,'choice','update','choice','name','mod_choice'),(55,'choice','add','choice','name','mod_choice'),(56,'choice','report','choice','name','mod_choice'),(57,'choice','choose','choice','name','mod_choice'),(58,'choice','choose again','choice','name','mod_choice'),(59,'data','view','data','name','mod_data'),(60,'data','add','data','name','mod_data'),(61,'data','update','data','name','mod_data'),(62,'data','record delete','data','name','mod_data'),(63,'data','fields add','data_fields','name','mod_data'),(64,'data','fields update','data_fields','name','mod_data'),(65,'data','templates saved','data','name','mod_data'),(66,'data','templates def','data','name','mod_data'),(67,'feedback','startcomplete','feedback','name','mod_feedback'),(68,'feedback','submit','feedback','name','mod_feedback'),(69,'feedback','delete','feedback','name','mod_feedback'),(70,'feedback','view','feedback','name','mod_feedback'),(71,'feedback','view all','course','shortname','mod_feedback'),(72,'folder','view','folder','name','mod_folder'),(73,'folder','view all','folder','name','mod_folder'),(74,'folder','update','folder','name','mod_folder'),(75,'folder','add','folder','name','mod_folder'),(76,'forum','add','forum','name','mod_forum'),(77,'forum','update','forum','name','mod_forum'),(78,'forum','add discussion','forum_discussions','name','mod_forum'),(79,'forum','add post','forum_posts','subject','mod_forum'),(80,'forum','update post','forum_posts','subject','mod_forum'),(81,'forum','user report','user','CONCAT(firstname, \' \', lastname)','mod_forum'),(82,'forum','move discussion','forum_discussions','name','mod_forum'),(83,'forum','view subscribers','forum','name','mod_forum'),(84,'forum','view discussion','forum_discussions','name','mod_forum'),(85,'forum','view forum','forum','name','mod_forum'),(86,'forum','subscribe','forum','name','mod_forum'),(87,'forum','unsubscribe','forum','name','mod_forum'),(88,'glossary','add','glossary','name','mod_glossary'),(89,'glossary','update','glossary','name','mod_glossary'),(90,'glossary','view','glossary','name','mod_glossary'),(91,'glossary','view all','glossary','name','mod_glossary'),(92,'glossary','add entry','glossary','name','mod_glossary'),(93,'glossary','update entry','glossary','name','mod_glossary'),(94,'glossary','add category','glossary','name','mod_glossary'),(95,'glossary','update category','glossary','name','mod_glossary'),(96,'glossary','delete category','glossary','name','mod_glossary'),(97,'glossary','approve entry','glossary','name','mod_glossary'),(98,'glossary','view entry','glossary_entries','concept','mod_glossary'),(99,'imscp','view','imscp','name','mod_imscp'),(100,'imscp','view all','imscp','name','mod_imscp'),(101,'imscp','update','imscp','name','mod_imscp'),(102,'imscp','add','imscp','name','mod_imscp'),(103,'label','add','label','name','mod_label'),(104,'label','update','label','name','mod_label'),(105,'lesson','start','lesson','name','mod_lesson'),(106,'lesson','end','lesson','name','mod_lesson'),(107,'lesson','view','lesson_pages','title','mod_lesson'),(108,'lti','view','lti','name','mod_lti'),(109,'lti','launch','lti','name','mod_lti'),(110,'lti','view all','lti','name','mod_lti'),(111,'page','view','page','name','mod_page'),(112,'page','view all','page','name','mod_page'),(113,'page','update','page','name','mod_page'),(114,'page','add','page','name','mod_page'),(115,'quiz','add','quiz','name','mod_quiz'),(116,'quiz','update','quiz','name','mod_quiz'),(117,'quiz','view','quiz','name','mod_quiz'),(118,'quiz','report','quiz','name','mod_quiz'),(119,'quiz','attempt','quiz','name','mod_quiz'),(120,'quiz','submit','quiz','name','mod_quiz'),(121,'quiz','review','quiz','name','mod_quiz'),(122,'quiz','editquestions','quiz','name','mod_quiz'),(123,'quiz','preview','quiz','name','mod_quiz'),(124,'quiz','start attempt','quiz','name','mod_quiz'),(125,'quiz','close attempt','quiz','name','mod_quiz'),(126,'quiz','continue attempt','quiz','name','mod_quiz'),(127,'quiz','edit override','quiz','name','mod_quiz'),(128,'quiz','delete override','quiz','name','mod_quiz'),(129,'resource','view','resource','name','mod_resource'),(130,'resource','view all','resource','name','mod_resource'),(131,'resource','update','resource','name','mod_resource'),(132,'resource','add','resource','name','mod_resource'),(133,'scorm','view','scorm','name','mod_scorm'),(134,'scorm','review','scorm','name','mod_scorm'),(135,'scorm','update','scorm','name','mod_scorm'),(136,'scorm','add','scorm','name','mod_scorm'),(137,'survey','add','survey','name','mod_survey'),(138,'survey','update','survey','name','mod_survey'),(139,'survey','download','survey','name','mod_survey'),(140,'survey','view form','survey','name','mod_survey'),(141,'survey','view graph','survey','name','mod_survey'),(142,'survey','view report','survey','name','mod_survey'),(143,'survey','submit','survey','name','mod_survey'),(144,'url','view','url','name','mod_url'),(145,'url','view all','url','name','mod_url'),(146,'url','update','url','name','mod_url'),(147,'url','add','url','name','mod_url'),(148,'workshop','add','workshop','name','mod_workshop'),(149,'workshop','update','workshop','name','mod_workshop'),(150,'workshop','view','workshop','name','mod_workshop'),(151,'workshop','view all','workshop','name','mod_workshop'),(152,'workshop','add submission','workshop_submissions','title','mod_workshop'),(153,'workshop','update submission','workshop_submissions','title','mod_workshop'),(154,'workshop','view submission','workshop_submissions','title','mod_workshop'),(155,'workshop','add assessment','workshop_submissions','title','mod_workshop'),(156,'workshop','update assessment','workshop_submissions','title','mod_workshop'),(157,'workshop','add example','workshop_submissions','title','mod_workshop'),(158,'workshop','update example','workshop_submissions','title','mod_workshop'),(159,'workshop','view example','workshop_submissions','title','mod_workshop'),(160,'workshop','add reference assessment','workshop_submissions','title','mod_workshop'),(161,'workshop','update reference assessment','workshop_submissions','title','mod_workshop'),(162,'workshop','add example assessment','workshop_submissions','title','mod_workshop'),(163,'workshop','update example assessment','workshop_submissions','title','mod_workshop'),(164,'workshop','update aggregate grades','workshop','name','mod_workshop'),(165,'workshop','update clear aggregated grades','workshop','name','mod_workshop'),(166,'workshop','update clear assessments','workshop','name','mod_workshop'),(167,'book','exportimscp','book','name','booktool_exportimscp'),(168,'book','print','book','name','booktool_print'),(169,'assign','reveal identities','assign','name','mod_assign'),(170,'assign','submission statement accepted','assign','name','mod_assign'),(171,'assign','view confirm submit assignment form','assign','name','mod_assign'),(172,'autoview','view','autoview','name','mod_autoview'),(173,'autoview','view all','autoview','name','mod_autoview'),(174,'autoview','update','autoview','name','mod_autoview'),(175,'autoview','add','autoview','name','mod_autoview'),(176,'autoview','edit','autoview','name','mod_autoview'),(177,'autoview','flash play','autoview','name','mod_autoview'),(178,'autoview','flash play and rec','autoview','name','mod_autoview'),(179,'book','add chapter','book_chapters','title','mod_book'),(180,'book','update chapter','book_chapters','title','mod_book'),(181,'book','view chapter','book_chapters','title','mod_book'),(182,'book','print chapter','book_chapters','title','booktool_print');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_queries`
--

DROP TABLE IF EXISTS `mdl_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_queries`
--

LOCK TABLES `mdl_log_queries` WRITE;
/*!40000 ALTER TABLE `mdl_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti`
--

DROP TABLE IF EXISTS `mdl_lti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti`
--

LOCK TABLES `mdl_lti` WRITE;
/*!40000 ALTER TABLE `mdl_lti` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_submission`
--

DROP TABLE IF EXISTS `mdl_lti_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_submission`
--

LOCK TABLES `mdl_lti_submission` WRITE;
/*!40000 ALTER TABLE `mdl_lti_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types`
--

DROP TABLE IF EXISTS `mdl_lti_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types`
--

LOCK TABLES `mdl_lti_types` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types_config`
--

DROP TABLE IF EXISTS `mdl_lti_types_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types_config`
--

LOCK TABLES `mdl_lti_types_config` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message`
--

LOCK TABLES `mdl_message` WRITE;
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_contacts`
--

LOCK TABLES `mdl_message_contacts` WRITE;
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_processors`
--

DROP TABLE IF EXISTS `mdl_message_processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_processors`
--

LOCK TABLES `mdl_message_processors` WRITE;
/*!40000 ALTER TABLE `mdl_message_processors` DISABLE KEYS */;
INSERT INTO `mdl_message_processors` VALUES (1,'email',1),(2,'jabber',1),(3,'popup',1);
/*!40000 ALTER TABLE `mdl_message_processors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_providers`
--

DROP TABLE IF EXISTS `mdl_message_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_providers`
--

LOCK TABLES `mdl_message_providers` WRITE;
/*!40000 ALTER TABLE `mdl_message_providers` DISABLE KEYS */;
INSERT INTO `mdl_message_providers` VALUES (1,'notices','moodle','moodle/site:config'),(2,'errors','moodle','moodle/site:config'),(3,'availableupdate','moodle','moodle/site:config'),(4,'instantmessage','moodle',NULL),(5,'backup','moodle','moodle/site:config'),(6,'courserequested','moodle','moodle/site:approvecourse'),(7,'courserequestapproved','moodle','moodle/course:request'),(8,'courserequestrejected','moodle','moodle/course:request'),(9,'assign_notification','mod_assign',NULL),(10,'assignment_updates','mod_assignment',NULL),(11,'submission','mod_feedback',NULL),(12,'message','mod_feedback',NULL),(13,'posts','mod_forum',NULL),(14,'graded_essay','mod_lesson',NULL),(15,'submission','mod_quiz','mod/quiz:emailnotifysubmission'),(16,'confirmation','mod_quiz','mod/quiz:emailconfirmsubmission'),(17,'attempt_overdue','mod_quiz','mod/quiz:emailwarnoverdue'),(18,'authorize_enrolment','enrol_authorize',NULL),(19,'flatfile_enrolment','enrol_flatfile',NULL),(20,'imsenterprise_enrolment','enrol_imsenterprise',NULL),(21,'paypal_enrolment','enrol_paypal',NULL),(22,'expiry_notification','enrol_manual',NULL),(23,'expiry_notification','enrol_self',NULL);
/*!40000 ALTER TABLE `mdl_message_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_read`
--

LOCK TABLES `mdl_message_read` WRITE;
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
INSERT INTO `mdl_message_read` VALUES (15,2,2,'Доступны обновления Moodle (http://moodle.opensoftdev.ru)','Уведомления об обновлениях\n\nДоступна более новая версия Moodle!\nMoodle 2.4.2+ (Build: 20130314) Версия 2012120302.02 (Стабильная версия)\n\nПодробнее см. на http://moodle.opensoftdev.ru/admin/index.php\nВаш сайт под управлением системы Moodle http://moodle.opensoftdev.ru настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).\n',2,'<h1>Уведомления об обновлениях</h1>\n<h2>Доступна более новая версия Moodle!</h2>\n<ul>\n<li><strong>Moodle 2.4.2+ (Build: 20130314)</strong> Версия 2012120302.02 (Стабильная версия)</li>\n</ul>\n<p>Подробнее см. на <a href=\"http://moodle.opensoftdev.ru/admin/index.php\">http://moodle.opensoftdev.ru/admin/index.php</a></p>\n<footer><p style=\"font-size:smaller; color:#333;\">Ваш сайт под управлением системы Moodle <a href=\"http://moodle.opensoftdev.ru\">http://moodle.opensoftdev.ru</a> настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).</p></footer>','Уведомления об обновлениях',1,NULL,NULL,1363366805,1363366806),(16,2,3,'Доступны обновления Moodle (http://moodle.opensoftdev.ru)','Уведомления об обновлениях\n\nДоступна более новая версия Moodle!\nMoodle 2.4.2+ (Build: 20130314) Версия 2012120302.02 (Стабильная версия)\n\nПодробнее см. на http://moodle.opensoftdev.ru/admin/index.php\nВаш сайт под управлением системы Moodle http://moodle.opensoftdev.ru настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).\n',2,'<h1>Уведомления об обновлениях</h1>\n<h2>Доступна более новая версия Moodle!</h2>\n<ul>\n<li><strong>Moodle 2.4.2+ (Build: 20130314)</strong> Версия 2012120302.02 (Стабильная версия)</li>\n</ul>\n<p>Подробнее см. на <a href=\"http://moodle.opensoftdev.ru/admin/index.php\">http://moodle.opensoftdev.ru/admin/index.php</a></p>\n<footer><p style=\"font-size:smaller; color:#333;\">Ваш сайт под управлением системы Moodle <a href=\"http://moodle.opensoftdev.ru\">http://moodle.opensoftdev.ru</a> настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).</p></footer>','Уведомления об обновлениях',1,NULL,NULL,1363366806,1363366806),(17,2,2,'Доступны обновления Moodle (http://moodle.opensoftdev.ru)','Уведомления об обновлениях\n\nДоступна более новая версия Moodle!\nMoodle 2.4.3 (Build: 20130318) Версия 2012120303 (Стабильная версия)\n\nПодробнее см. на http://moodle.opensoftdev.ru/admin/index.php\nВаш сайт под управлением системы Moodle http://moodle.opensoftdev.ru настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).\n',2,'<h1>Уведомления об обновлениях</h1>\n<h2>Доступна более новая версия Moodle!</h2>\n<ul>\n<li><strong>Moodle 2.4.3 (Build: 20130318)</strong> Версия 2012120303 (Стабильная версия)</li>\n</ul>\n<p>Подробнее см. на <a href=\"http://moodle.opensoftdev.ru/admin/index.php\">http://moodle.opensoftdev.ru/admin/index.php</a></p>\n<footer><p style=\"font-size:smaller; color:#333;\">Ваш сайт под управлением системы Moodle <a href=\"http://moodle.opensoftdev.ru\">http://moodle.opensoftdev.ru</a> настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).</p></footer>','Уведомления об обновлениях',1,NULL,NULL,1363628704,1363628704),(18,2,3,'Доступны обновления Moodle (http://moodle.opensoftdev.ru)','Уведомления об обновлениях\n\nДоступна более новая версия Moodle!\nMoodle 2.4.3 (Build: 20130318) Версия 2012120303 (Стабильная версия)\n\nПодробнее см. на http://moodle.opensoftdev.ru/admin/index.php\nВаш сайт под управлением системы Moodle http://moodle.opensoftdev.ru настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).\n',2,'<h1>Уведомления об обновлениях</h1>\n<h2>Доступна более новая версия Moodle!</h2>\n<ul>\n<li><strong>Moodle 2.4.3 (Build: 20130318)</strong> Версия 2012120303 (Стабильная версия)</li>\n</ul>\n<p>Подробнее см. на <a href=\"http://moodle.opensoftdev.ru/admin/index.php\">http://moodle.opensoftdev.ru/admin/index.php</a></p>\n<footer><p style=\"font-size:smaller; color:#333;\">Ваш сайт под управлением системы Moodle <a href=\"http://moodle.opensoftdev.ru\">http://moodle.opensoftdev.ru</a> настроен на автоматическую проверку обновлений. Вы получили это письмо, потому что являетесь администратором этого сайта. С помощью блока \"Настройки\" Вы можете отключить автоматическую проверку обновлений (Администрирование - Сервер - Уведомления об обновлениях) и настроить способ доставки этого сообщения (Настройки моего профиля - Обмен сообщениями).</p></footer>','Уведомления об обновлениях',1,NULL,NULL,1363628704,1363628704);
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_working`
--

DROP TABLE IF EXISTS `mdl_message_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_working`
--

LOCK TABLES `mdl_message_working` WRITE;
/*!40000 ALTER TABLE `mdl_message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_application`
--

LOCK TABLES `mdl_mnet_application` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` VALUES (1,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php','/auth/mnet/jump.php'),(2,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php','/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host`
--

LOCK TABLES `mdl_mnet_host` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` VALUES (1,0,'http://moodle.opensoftdev.ru','127.0.1.1','','',0,0,0,0,0,0,NULL,1),(2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,1);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host2service`
--

LOCK TABLES `mdl_mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_log`
--

LOCK TABLES `mdl_mnet_log` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

LOCK TABLES `mdl_mnet_remote_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1),(15,'send_content_intent','portfolio/mahara/lib.php/send_content_intent','portfolio','mahara',1),(16,'send_content_ready','portfolio/mahara/lib.php/send_content_ready','portfolio','mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

LOCK TABLES `mdl_mnet_remote_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15),(16,4,16);
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_rpc`
--

LOCK TABLES `mdl_mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1,'Return user data for the provided token, compare with user_agent string.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}','auth.php','auth_plugin_mnet',0),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1,'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1,'The IdP uses this function to kill child sessions on other hosts','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}','auth.php','auth_plugin_mnet',0),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1,'Receives an array of log entries from an SP and adds them to the mnet_log\ntable','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1,'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:84:\"false if user not found, empty array if no picture exists, array with data otherwise\";}}','auth.php','auth_plugin_mnet',0),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1,'Returns the theme information and logo url as strings.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}','auth.php','auth_plugin_mnet',0),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1,'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1,'Poll the IdP server to let it know that a user it has authenticated is still\nonline','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1,'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}','auth.php','auth_plugin_mnet',0),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1,'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1,'This method has never been implemented in Moodle MNet API','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1,'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:14:\"user details {\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1,'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1,'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(15,'fetch_file','portfolio/mahara/lib.php/fetch_file','portfolio','mahara',1,'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','lib.php','portfolio_plugin_mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service`
--

LOCK TABLES `mdl_mnet_service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1),(4,'pf','','1',1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

LOCK TABLES `mdl_mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_session`
--

LOCK TABLES `mdl_mnet_session` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_sso_access_control`
--

LOCK TABLES `mdl_mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_courses`
--

LOCK TABLES `mdl_mnetservice_enrol_courses` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_enrolments`
--

LOCK TABLES `mdl_mnetservice_enrol_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_modules`
--

LOCK TABLES `mdl_modules` WRITE;
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` VALUES (1,'assign',2012112900,60,0,'',1),(2,'assignment',2012112900,60,0,'',0),(3,'book',2012112900,0,0,'',1),(4,'chat',2012112900,300,1363682701,'',1),(5,'choice',2012112900,0,0,'',1),(6,'data',2012112901,0,0,'',1),(7,'feedback',2012112900,0,0,'',0),(8,'folder',2012112900,0,0,'',1),(9,'forum',2012112900,60,1363682701,'',1),(10,'glossary',2012112900,0,0,'',1),(11,'imscp',2012112900,0,0,'',1),(12,'label',2012112900,0,0,'',1),(13,'lesson',2012112900,0,0,'',1),(14,'lti',2012112900,0,0,'',1),(15,'page',2012112900,0,0,'',1),(16,'quiz',2012112900,60,1363682701,'',1),(17,'resource',2012112900,0,0,'',1),(18,'scorm',2012112900,300,1363682701,'',1),(19,'survey',2012112900,0,0,'',1),(20,'url',2012112900,0,0,'',1),(21,'wiki',2012112900,0,0,'',1),(22,'workshop',2012112900,60,1363682701,'',1),(23,'autoview',2012100901,300,1363682701,'',1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_my_pages`
--

DROP TABLE IF EXISTS `mdl_my_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_my_pages`
--

LOCK TABLES `mdl_my_pages` WRITE;
/*!40000 ALTER TABLE `mdl_my_pages` DISABLE KEYS */;
INSERT INTO `mdl_my_pages` VALUES (1,NULL,'__default',0,0),(2,NULL,'__default',1,0),(3,3,'__default',0,0);
/*!40000 ALTER TABLE `mdl_my_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_page`
--

DROP TABLE IF EXISTS `mdl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_page`
--

LOCK TABLES `mdl_page` WRITE;
/*!40000 ALTER TABLE `mdl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance`
--

LOCK TABLES `mdl_portfolio_instance` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_config`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_config`
--

LOCK TABLES `mdl_portfolio_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_user`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_user`
--

LOCK TABLES `mdl_portfolio_instance_user` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_log`
--

DROP TABLE IF EXISTS `mdl_portfolio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_log`
--

LOCK TABLES `mdl_portfolio_log` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `mdl_portfolio_mahara_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_mahara_queue`
--

LOCK TABLES `mdl_portfolio_mahara_queue` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_tempdata`
--

DROP TABLE IF EXISTS `mdl_portfolio_tempdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_tempdata`
--

LOCK TABLES `mdl_portfolio_tempdata` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_post`
--

LOCK TABLES `mdl_post` WRITE;
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_profiling`
--

DROP TABLE IF EXISTS `mdl_profiling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_profiling`
--

LOCK TABLES `mdl_profiling` WRITE;
/*!40000 ALTER TABLE `mdl_profiling` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_profiling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_essay_options`
--

DROP TABLE IF EXISTS `mdl_qtype_essay_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_essay_options`
--

LOCK TABLES `mdl_qtype_essay_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question`
--

LOCK TABLES `mdl_question` WRITE;
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_answers`
--

LOCK TABLES `mdl_question_answers` WRITE;
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_step_data`
--

DROP TABLE IF EXISTS `mdl_question_attempt_step_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

LOCK TABLES `mdl_question_attempt_step_data` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_steps`
--

DROP TABLE IF EXISTS `mdl_question_attempt_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

LOCK TABLES `mdl_question_attempt_steps` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempts`
--

LOCK TABLES `mdl_question_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated`
--

LOCK TABLES `mdl_question_calculated` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated_options`
--

DROP TABLE IF EXISTS `mdl_question_calculated_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated_options`
--

LOCK TABLES `mdl_question_calculated_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_categories`
--

LOCK TABLES `mdl_question_categories` WRITE;
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
INSERT INTO `mdl_question_categories` VALUES (1,'По умолчанию для Главная страница',2,'Категория по умолчанию для общих вопросов в контексте \"Главная страница\".',0,'moodle.opensoftdev.ru+121123092549+jXfRAb',0,999),(2,'По умолчанию для Система',1,'Категория по умолчанию для общих вопросов в контексте \"Система\".',0,'moodle.opensoftdev.ru+121123092549+dl8YaE',0,999);
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_definitions`
--

LOCK TABLES `mdl_question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_items`
--

LOCK TABLES `mdl_question_dataset_items` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_datasets`
--

LOCK TABLES `mdl_question_datasets` WRITE;
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_hints`
--

DROP TABLE IF EXISTS `mdl_question_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_hints`
--

LOCK TABLES `mdl_question_hints` WRITE;
/*!40000 ALTER TABLE `mdl_question_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_match`
--

DROP TABLE IF EXISTS `mdl_question_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_match` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `subquestions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines fixed matching questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_match`
--

LOCK TABLES `mdl_question_match` WRITE;
/*!40000 ALTER TABLE `mdl_question_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_match_sub`
--

DROP TABLE IF EXISTS `mdl_question_match_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_match_sub` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `code` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatcsub_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the subquestions that make up a matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_match_sub`
--

LOCK TABLES `mdl_question_match_sub` WRITE;
/*!40000 ALTER TABLE `mdl_question_match_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_match_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multianswer`
--

LOCK TABLES `mdl_question_multianswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multichoice`
--

DROP TABLE IF EXISTS `mdl_question_multichoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multichoice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multichoice`
--

LOCK TABLES `mdl_question_multichoice` WRITE;
/*!40000 ALTER TABLE `mdl_question_multichoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multichoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical`
--

LOCK TABLES `mdl_question_numerical` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_options`
--

DROP TABLE IF EXISTS `mdl_question_numerical_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_options`
--

LOCK TABLES `mdl_question_numerical_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_units`
--

LOCK TABLES `mdl_question_numerical_units` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_randomsamatch`
--

DROP TABLE IF EXISTS `mdl_question_randomsamatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_randomsamatch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_randomsamatch`
--

LOCK TABLES `mdl_question_randomsamatch` WRITE;
/*!40000 ALTER TABLE `mdl_question_randomsamatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_randomsamatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_sessions`
--

DROP TABLE IF EXISTS `mdl_question_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Gives ids of the newest open and newest graded states';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_sessions`
--

LOCK TABLES `mdl_question_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_question_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_shortanswer`
--

DROP TABLE IF EXISTS `mdl_question_shortanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_shortanswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesshor_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_shortanswer`
--

LOCK TABLES `mdl_question_shortanswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_shortanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_shortanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_states`
--

DROP TABLE IF EXISTS `mdl_question_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user responses to an attempt, and percentage grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_states`
--

LOCK TABLES `mdl_question_states` WRITE;
/*!40000 ALTER TABLE `mdl_question_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_truefalse`
--

LOCK TABLES `mdl_question_truefalse` WRITE;
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_usages`
--

DROP TABLE IF EXISTS `mdl_question_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_usages`
--

LOCK TABLES `mdl_question_usages` WRITE;
/*!40000 ALTER TABLE `mdl_question_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz`
--

LOCK TABLES `mdl_quiz` WRITE;
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_attempts`
--

LOCK TABLES `mdl_quiz_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_feedback`
--

LOCK TABLES `mdl_quiz_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_grades`
--

LOCK TABLES `mdl_quiz_grades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overrides`
--

DROP TABLE IF EXISTS `mdl_quiz_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overrides`
--

LOCK TABLES `mdl_quiz_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

DROP TABLE IF EXISTS `mdl_quiz_overview_regrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overview_regrades`
--

LOCK TABLES `mdl_quiz_overview_regrades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_instances`
--

DROP TABLE IF EXISTS `mdl_quiz_question_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the maximum possible grade (weight) for each question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_question_instances`
--

LOCK TABLES `mdl_quiz_question_instances` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_response_stats`
--

DROP TABLE IF EXISTS `mdl_quiz_question_response_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_question_response_stats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Quiz question responses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_question_response_stats`
--

LOCK TABLES `mdl_quiz_question_response_stats` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_response_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_response_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_question_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Default comment for the table, please edit me';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_question_statistics`
--

LOCK TABLES `mdl_quiz_question_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_reports`
--

DROP TABLE IF EXISTS `mdl_quiz_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_reports`
--

LOCK TABLES `mdl_quiz_reports` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_reports` DISABLE KEYS */;
INSERT INTO `mdl_quiz_reports` VALUES (1,'overview',10000,NULL),(2,'responses',9000,NULL),(3,'grading',6000,NULL),(4,'statistics',8000,'quiz/statistics:view');
/*!40000 ALTER TABLE `mdl_quiz_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL,
  `allattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_statistics`
--

LOCK TABLES `mdl_quiz_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_rating`
--

DROP TABLE IF EXISTS `mdl_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_rating`
--

LOCK TABLES `mdl_rating` WRITE;
/*!40000 ALTER TABLE `mdl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_registration_hubs`
--

DROP TABLE IF EXISTS `mdl_registration_hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_registration_hubs`
--

LOCK TABLES `mdl_registration_hubs` WRITE;
/*!40000 ALTER TABLE `mdl_registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_registration_hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository`
--

DROP TABLE IF EXISTS `mdl_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository`
--

LOCK TABLES `mdl_repository` WRITE;
/*!40000 ALTER TABLE `mdl_repository` DISABLE KEYS */;
INSERT INTO `mdl_repository` VALUES (1,'local',1,1),(2,'recent',1,2),(3,'upload',1,3),(4,'url',1,4),(5,'user',1,5),(6,'wikimedia',1,6),(7,'youtube',1,7);
/*!40000 ALTER TABLE `mdl_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instance_config`
--

DROP TABLE IF EXISTS `mdl_repository_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instance_config`
--

LOCK TABLES `mdl_repository_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_repository_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instances`
--

DROP TABLE IF EXISTS `mdl_repository_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instances`
--

LOCK TABLES `mdl_repository_instances` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instances` DISABLE KEYS */;
INSERT INTO `mdl_repository_instances` VALUES (1,'',1,0,1,NULL,NULL,1352713770,1352713770,0),(2,'',2,0,1,NULL,NULL,1352713770,1352713770,0),(3,'',3,0,1,NULL,NULL,1352713770,1352713770,0),(4,'',4,0,1,NULL,NULL,1352713770,1352713770,0),(5,'',5,0,1,NULL,NULL,1352713770,1352713770,0),(6,'',6,0,1,NULL,NULL,1352713770,1352713770,0),(7,'',7,0,1,NULL,NULL,1352713770,1352713770,0);
/*!40000 ALTER TABLE `mdl_repository_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource`
--

LOCK TABLES `mdl_resource` WRITE;
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource_old`
--

DROP TABLE IF EXISTS `mdl_resource_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource_old`
--

LOCK TABLES `mdl_resource_old` WRITE;
/*!40000 ALTER TABLE `mdl_resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role`
--

LOCK TABLES `mdl_role` WRITE;
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` VALUES (1,'Управляющий','manager','Управляющие имеют доступ к курсу и могут изменять его. Они, как правило, не участвуют в курсах.',1,'manager'),(2,'Создатель курса','coursecreator','Создатели курсов могут создавать новые курсы.',2,'coursecreator'),(3,'Учитель','editingteacher','Учителя могут делать в курсе всё, в том числе изменять элементы курса и оценивать студентов.',3,'editingteacher'),(4,'Ассистент (без права редактирования)','teacher','Ассистент может преподавать в курсах и выставлять оценки, но он не может изменять содержание курса.',4,'teacher'),(5,'Студент','student','Обычно студенты обладают меньшим набором прав в рамках курса.',5,'student'),(6,'Гость','guest','Обычно гости имеют минимальный набор прав и не могут нигде вводить текст.',6,'guest'),(7,'Аутентифицированный пользователь','user','Все пользователи, вошедшие в систему',7,'user'),(8,'Аутентифицированный пользователь на главной странице','frontpage','Все пользователи, вошедшие на главную страницу.',8,'frontpage');
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_assign`
--

LOCK TABLES `mdl_role_allow_assign` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,4),(7,3,5);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_override`
--

LOCK TABLES `mdl_role_allow_override` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,3,4),(10,3,5),(11,3,6);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_switch`
--

DROP TABLE IF EXISTS `mdl_role_allow_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_switch`
--

LOCK TABLES `mdl_role_allow_switch` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_switch` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_switch` VALUES (1,1,3),(2,1,4),(3,1,5),(4,1,6),(5,3,4),(6,3,5),(7,3,6),(8,4,5),(9,4,6);
/*!40000 ALTER TABLE `mdl_role_allow_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_assignments`
--

LOCK TABLES `mdl_role_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_capabilities`
--

LOCK TABLES `mdl_role_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` VALUES (1,1,1,'moodle/site:readallmessages',1,1352713751,0),(2,1,3,'moodle/site:readallmessages',1,1352713751,0),(3,1,1,'moodle/site:sendmessage',1,1352713751,0),(4,1,7,'moodle/site:sendmessage',1,1352713751,0),(5,1,1,'moodle/site:approvecourse',1,1352713751,0),(6,1,3,'moodle/backup:backupcourse',1,1352713751,0),(7,1,1,'moodle/backup:backupcourse',1,1352713751,0),(8,1,3,'moodle/backup:backupsection',1,1352713751,0),(9,1,1,'moodle/backup:backupsection',1,1352713751,0),(10,1,3,'moodle/backup:backupactivity',1,1352713751,0),(11,1,1,'moodle/backup:backupactivity',1,1352713751,0),(12,1,3,'moodle/backup:backuptargethub',1,1352713751,0),(13,1,1,'moodle/backup:backuptargethub',1,1352713751,0),(14,1,3,'moodle/backup:backuptargetimport',1,1352713751,0),(15,1,1,'moodle/backup:backuptargetimport',1,1352713751,0),(16,1,3,'moodle/backup:downloadfile',1,1352713751,0),(17,1,1,'moodle/backup:downloadfile',1,1352713751,0),(18,1,3,'moodle/backup:configure',1,1352713751,0),(19,1,1,'moodle/backup:configure',1,1352713751,0),(20,1,1,'moodle/backup:userinfo',1,1352713751,0),(21,1,1,'moodle/backup:anonymise',1,1352713751,0),(22,1,3,'moodle/restore:restorecourse',1,1352713751,0),(23,1,1,'moodle/restore:restorecourse',1,1352713751,0),(24,1,3,'moodle/restore:restoresection',1,1352713751,0),(25,1,1,'moodle/restore:restoresection',1,1352713751,0),(26,1,3,'moodle/restore:restoreactivity',1,1352713751,0),(27,1,1,'moodle/restore:restoreactivity',1,1352713751,0),(28,1,3,'moodle/restore:restoretargethub',1,1352713751,0),(29,1,1,'moodle/restore:restoretargethub',1,1352713751,0),(30,1,3,'moodle/restore:restoretargetimport',1,1352713751,0),(31,1,1,'moodle/restore:restoretargetimport',1,1352713751,0),(32,1,3,'moodle/restore:uploadfile',1,1352713751,0),(33,1,1,'moodle/restore:uploadfile',1,1352713751,0),(34,1,3,'moodle/restore:configure',1,1352713751,0),(35,1,1,'moodle/restore:configure',1,1352713751,0),(36,1,2,'moodle/restore:rolldates',1,1352713751,0),(37,1,1,'moodle/restore:rolldates',1,1352713751,0),(38,1,1,'moodle/restore:userinfo',1,1352713751,0),(39,1,1,'moodle/restore:createuser',1,1352713751,0),(40,1,3,'moodle/site:manageblocks',1,1352713751,0),(41,1,1,'moodle/site:manageblocks',1,1352713751,0),(42,1,4,'moodle/site:accessallgroups',1,1352713751,0),(43,1,3,'moodle/site:accessallgroups',1,1352713751,0),(44,1,1,'moodle/site:accessallgroups',1,1352713751,0),(45,1,4,'moodle/site:viewfullnames',1,1352713751,0),(46,1,3,'moodle/site:viewfullnames',1,1352713751,0),(47,1,1,'moodle/site:viewfullnames',1,1352713751,0),(48,1,4,'moodle/site:viewuseridentity',1,1352713751,0),(49,1,3,'moodle/site:viewuseridentity',1,1352713751,0),(50,1,1,'moodle/site:viewuseridentity',1,1352713751,0),(51,1,4,'moodle/site:viewreports',1,1352713751,0),(52,1,3,'moodle/site:viewreports',1,1352713751,0),(53,1,1,'moodle/site:viewreports',1,1352713751,0),(54,1,3,'moodle/site:trustcontent',1,1352713751,0),(55,1,1,'moodle/site:trustcontent',1,1352713751,0),(56,1,1,'moodle/site:uploadusers',1,1352713751,0),(57,1,3,'moodle/filter:manage',1,1352713751,0),(58,1,1,'moodle/filter:manage',1,1352713751,0),(59,1,1,'moodle/user:create',1,1352713751,0),(60,1,1,'moodle/user:delete',1,1352713751,0),(61,1,1,'moodle/user:update',1,1352713751,0),(62,1,6,'moodle/user:viewdetails',1,1352713751,0),(63,1,5,'moodle/user:viewdetails',1,1352713751,0),(64,1,4,'moodle/user:viewdetails',1,1352713751,0),(65,1,3,'moodle/user:viewdetails',1,1352713751,0),(66,1,1,'moodle/user:viewdetails',1,1352713751,0),(67,1,1,'moodle/user:viewalldetails',1,1352713751,0),(68,1,4,'moodle/user:viewhiddendetails',1,1352713751,0),(69,1,3,'moodle/user:viewhiddendetails',1,1352713752,0),(70,1,1,'moodle/user:viewhiddendetails',1,1352713752,0),(71,1,1,'moodle/user:loginas',1,1352713752,0),(72,1,1,'moodle/user:managesyspages',1,1352713752,0),(73,1,7,'moodle/user:manageownblocks',1,1352713752,0),(74,1,7,'moodle/user:manageownfiles',1,1352713752,0),(75,1,1,'moodle/my:configsyspages',1,1352713752,0),(76,1,3,'moodle/role:assign',1,1352713752,0),(77,1,1,'moodle/role:assign',1,1352713752,0),(78,1,4,'moodle/role:review',1,1352713752,0),(79,1,3,'moodle/role:review',1,1352713752,0),(80,1,1,'moodle/role:review',1,1352713752,0),(81,1,1,'moodle/role:override',1,1352713752,0),(82,1,3,'moodle/role:safeoverride',1,1352713752,0),(83,1,1,'moodle/role:manage',1,1352713752,0),(84,1,3,'moodle/role:switchroles',1,1352713752,0),(85,1,1,'moodle/role:switchroles',1,1352713752,0),(86,1,1,'moodle/category:manage',1,1352713752,0),(87,1,2,'moodle/category:viewhiddencategories',1,1352713752,0),(88,1,1,'moodle/category:viewhiddencategories',1,1352713752,0),(89,1,1,'moodle/cohort:manage',1,1352713752,0),(90,1,1,'moodle/cohort:assign',1,1352713752,0),(91,1,3,'moodle/cohort:view',1,1352713752,0),(92,1,1,'moodle/cohort:view',1,1352713752,0),(93,1,2,'moodle/course:create',1,1352713752,0),(94,1,1,'moodle/course:create',1,1352713752,0),(95,1,7,'moodle/course:request',1,1352713752,0),(96,1,1,'moodle/course:delete',1,1352713752,0),(97,1,3,'moodle/course:update',1,1352713752,0),(98,1,1,'moodle/course:update',1,1352713752,0),(99,1,1,'moodle/course:view',1,1352713752,0),(100,1,3,'moodle/course:enrolreview',1,1352713752,0),(101,1,1,'moodle/course:enrolreview',1,1352713752,0),(102,1,3,'moodle/course:enrolconfig',1,1352713752,0),(103,1,1,'moodle/course:enrolconfig',1,1352713752,0),(104,1,4,'moodle/course:bulkmessaging',1,1352713752,0),(105,1,3,'moodle/course:bulkmessaging',1,1352713752,0),(106,1,1,'moodle/course:bulkmessaging',1,1352713752,0),(107,1,4,'moodle/course:viewhiddenuserfields',1,1352713752,0),(108,1,3,'moodle/course:viewhiddenuserfields',1,1352713752,0),(109,1,1,'moodle/course:viewhiddenuserfields',1,1352713752,0),(110,1,2,'moodle/course:viewhiddencourses',1,1352713752,0),(111,1,4,'moodle/course:viewhiddencourses',1,1352713752,0),(112,1,3,'moodle/course:viewhiddencourses',1,1352713752,0),(113,1,1,'moodle/course:viewhiddencourses',1,1352713752,0),(114,1,3,'moodle/course:visibility',1,1352713752,0),(115,1,1,'moodle/course:visibility',1,1352713752,0),(116,1,3,'moodle/course:managefiles',1,1352713752,0),(117,1,1,'moodle/course:managefiles',1,1352713752,0),(118,1,3,'moodle/course:manageactivities',1,1352713752,0),(119,1,1,'moodle/course:manageactivities',1,1352713752,0),(120,1,3,'moodle/course:activityvisibility',1,1352713752,0),(121,1,1,'moodle/course:activityvisibility',1,1352713752,0),(122,1,4,'moodle/course:viewhiddenactivities',1,1352713752,0),(123,1,3,'moodle/course:viewhiddenactivities',1,1352713752,0),(124,1,1,'moodle/course:viewhiddenactivities',1,1352713752,0),(125,1,5,'moodle/course:viewparticipants',1,1352713752,0),(126,1,4,'moodle/course:viewparticipants',1,1352713752,0),(127,1,3,'moodle/course:viewparticipants',1,1352713752,0),(128,1,1,'moodle/course:viewparticipants',1,1352713752,0),(129,1,3,'moodle/course:changefullname',1,1352713752,0),(130,1,1,'moodle/course:changefullname',1,1352713752,0),(131,1,3,'moodle/course:changeshortname',1,1352713752,0),(132,1,1,'moodle/course:changeshortname',1,1352713752,0),(133,1,3,'moodle/course:changeidnumber',1,1352713752,0),(134,1,1,'moodle/course:changeidnumber',1,1352713752,0),(135,1,3,'moodle/course:changecategory',1,1352713752,0),(136,1,1,'moodle/course:changecategory',1,1352713752,0),(137,1,3,'moodle/course:changesummary',1,1352713752,0),(138,1,1,'moodle/course:changesummary',1,1352713752,0),(139,1,1,'moodle/site:viewparticipants',1,1352713752,0),(140,1,5,'moodle/course:isincompletionreports',1,1352713752,0),(141,1,5,'moodle/course:viewscales',1,1352713752,0),(142,1,4,'moodle/course:viewscales',1,1352713752,0),(143,1,3,'moodle/course:viewscales',1,1352713752,0),(144,1,1,'moodle/course:viewscales',1,1352713752,0),(145,1,3,'moodle/course:managescales',1,1352713752,0),(146,1,1,'moodle/course:managescales',1,1352713752,0),(147,1,3,'moodle/course:managegroups',1,1352713752,0),(148,1,1,'moodle/course:managegroups',1,1352713752,0),(149,1,3,'moodle/course:reset',1,1352713752,0),(150,1,1,'moodle/course:reset',1,1352713752,0),(151,1,6,'moodle/blog:view',1,1352713752,0),(152,1,7,'moodle/blog:view',1,1352713752,0),(153,1,5,'moodle/blog:view',1,1352713752,0),(154,1,4,'moodle/blog:view',1,1352713752,0),(155,1,3,'moodle/blog:view',1,1352713752,0),(156,1,1,'moodle/blog:view',1,1352713752,0),(157,1,6,'moodle/blog:search',1,1352713752,0),(158,1,7,'moodle/blog:search',1,1352713752,0),(159,1,5,'moodle/blog:search',1,1352713752,0),(160,1,4,'moodle/blog:search',1,1352713752,0),(161,1,3,'moodle/blog:search',1,1352713752,0),(162,1,1,'moodle/blog:search',1,1352713752,0),(163,1,1,'moodle/blog:viewdrafts',1,1352713752,0),(164,1,7,'moodle/blog:create',1,1352713752,0),(165,1,1,'moodle/blog:create',1,1352713752,0),(166,1,4,'moodle/blog:manageentries',1,1352713752,0),(167,1,3,'moodle/blog:manageentries',1,1352713752,0),(168,1,1,'moodle/blog:manageentries',1,1352713752,0),(169,1,5,'moodle/blog:manageexternal',1,1352713752,0),(170,1,7,'moodle/blog:manageexternal',1,1352713752,0),(171,1,4,'moodle/blog:manageexternal',1,1352713752,0),(172,1,3,'moodle/blog:manageexternal',1,1352713752,0),(173,1,1,'moodle/blog:manageexternal',1,1352713752,0),(174,1,5,'moodle/blog:associatecourse',1,1352713752,0),(175,1,7,'moodle/blog:associatecourse',1,1352713752,0),(176,1,4,'moodle/blog:associatecourse',1,1352713752,0),(177,1,3,'moodle/blog:associatecourse',1,1352713752,0),(178,1,1,'moodle/blog:associatecourse',1,1352713752,0),(179,1,5,'moodle/blog:associatemodule',1,1352713752,0),(180,1,7,'moodle/blog:associatemodule',1,1352713752,0),(181,1,4,'moodle/blog:associatemodule',1,1352713752,0),(182,1,3,'moodle/blog:associatemodule',1,1352713752,0),(183,1,1,'moodle/blog:associatemodule',1,1352713752,0),(184,1,7,'moodle/calendar:manageownentries',1,1352713752,0),(185,1,1,'moodle/calendar:manageownentries',1,1352713752,0),(186,1,4,'moodle/calendar:managegroupentries',1,1352713752,0),(187,1,3,'moodle/calendar:managegroupentries',1,1352713752,0),(188,1,1,'moodle/calendar:managegroupentries',1,1352713752,0),(189,1,4,'moodle/calendar:manageentries',1,1352713752,0),(190,1,3,'moodle/calendar:manageentries',1,1352713752,0),(191,1,1,'moodle/calendar:manageentries',1,1352713752,0),(192,1,1,'moodle/user:editprofile',1,1352713752,0),(193,1,6,'moodle/user:editownprofile',-1000,1352713752,0),(194,1,7,'moodle/user:editownprofile',1,1352713752,0),(195,1,1,'moodle/user:editownprofile',1,1352713752,0),(196,1,6,'moodle/user:changeownpassword',-1000,1352713752,0),(197,1,7,'moodle/user:changeownpassword',1,1352713752,0),(198,1,1,'moodle/user:changeownpassword',1,1352713752,0),(199,1,5,'moodle/user:readuserposts',1,1352713752,0),(200,1,4,'moodle/user:readuserposts',1,1352713752,0),(201,1,3,'moodle/user:readuserposts',1,1352713752,0),(202,1,1,'moodle/user:readuserposts',1,1352713752,0),(203,1,5,'moodle/user:readuserblogs',1,1352713752,0),(204,1,4,'moodle/user:readuserblogs',1,1352713752,0),(205,1,3,'moodle/user:readuserblogs',1,1352713752,0),(206,1,1,'moodle/user:readuserblogs',1,1352713752,0),(207,1,1,'moodle/user:editmessageprofile',1,1352713752,0),(208,1,6,'moodle/user:editownmessageprofile',-1000,1352713752,0),(209,1,7,'moodle/user:editownmessageprofile',1,1352713752,0),(210,1,1,'moodle/user:editownmessageprofile',1,1352713752,0),(211,1,3,'moodle/question:managecategory',1,1352713752,0),(212,1,1,'moodle/question:managecategory',1,1352713752,0),(213,1,3,'moodle/question:add',1,1352713752,0),(214,1,1,'moodle/question:add',1,1352713752,0),(215,1,3,'moodle/question:editmine',1,1352713752,0),(216,1,1,'moodle/question:editmine',1,1352713752,0),(217,1,3,'moodle/question:editall',1,1352713752,0),(218,1,1,'moodle/question:editall',1,1352713752,0),(219,1,3,'moodle/question:viewmine',1,1352713752,0),(220,1,1,'moodle/question:viewmine',1,1352713752,0),(221,1,3,'moodle/question:viewall',1,1352713752,0),(222,1,1,'moodle/question:viewall',1,1352713752,0),(223,1,3,'moodle/question:usemine',1,1352713752,0),(224,1,1,'moodle/question:usemine',1,1352713752,0),(225,1,3,'moodle/question:useall',1,1352713752,0),(226,1,1,'moodle/question:useall',1,1352713752,0),(227,1,3,'moodle/question:movemine',1,1352713752,0),(228,1,1,'moodle/question:movemine',1,1352713752,0),(229,1,3,'moodle/question:moveall',1,1352713752,0),(230,1,1,'moodle/question:moveall',1,1352713752,0),(231,1,1,'moodle/question:config',1,1352713752,0),(232,1,5,'moodle/question:flag',1,1352713752,0),(233,1,4,'moodle/question:flag',1,1352713752,0),(234,1,3,'moodle/question:flag',1,1352713752,0),(235,1,1,'moodle/question:flag',1,1352713752,0),(236,1,4,'moodle/site:doclinks',1,1352713752,0),(237,1,3,'moodle/site:doclinks',1,1352713752,0),(238,1,1,'moodle/site:doclinks',1,1352713752,0),(239,1,3,'moodle/course:sectionvisibility',1,1352713752,0),(240,1,1,'moodle/course:sectionvisibility',1,1352713752,0),(241,1,3,'moodle/course:useremail',1,1352713752,0),(242,1,1,'moodle/course:useremail',1,1352713752,0),(243,1,3,'moodle/course:viewhiddensections',1,1352713752,0),(244,1,1,'moodle/course:viewhiddensections',1,1352713752,0),(245,1,3,'moodle/course:setcurrentsection',1,1352713752,0),(246,1,1,'moodle/course:setcurrentsection',1,1352713752,0),(247,1,4,'moodle/grade:viewall',1,1352713752,0),(248,1,3,'moodle/grade:viewall',1,1352713752,0),(249,1,1,'moodle/grade:viewall',1,1352713752,0),(250,1,5,'moodle/grade:view',1,1352713752,0),(251,1,4,'moodle/grade:viewhidden',1,1352713752,0),(252,1,3,'moodle/grade:viewhidden',1,1352713752,0),(253,1,1,'moodle/grade:viewhidden',1,1352713752,0),(254,1,3,'moodle/grade:import',1,1352713752,0),(255,1,1,'moodle/grade:import',1,1352713752,0),(256,1,4,'moodle/grade:export',1,1352713752,0),(257,1,3,'moodle/grade:export',1,1352713752,0),(258,1,1,'moodle/grade:export',1,1352713752,0),(259,1,3,'moodle/grade:manage',1,1352713752,0),(260,1,1,'moodle/grade:manage',1,1352713752,0),(261,1,3,'moodle/grade:edit',1,1352713752,0),(262,1,1,'moodle/grade:edit',1,1352713752,0),(263,1,3,'moodle/grade:managegradingforms',1,1352713752,0),(264,1,1,'moodle/grade:managegradingforms',1,1352713752,0),(265,1,1,'moodle/grade:sharegradingforms',1,1352713752,0),(266,1,1,'moodle/grade:managesharedforms',1,1352713752,0),(267,1,3,'moodle/grade:manageoutcomes',1,1352713752,0),(268,1,1,'moodle/grade:manageoutcomes',1,1352713752,0),(269,1,3,'moodle/grade:manageletters',1,1352713752,0),(270,1,1,'moodle/grade:manageletters',1,1352713752,0),(271,1,3,'moodle/grade:hide',1,1352713752,0),(272,1,1,'moodle/grade:hide',1,1352713752,0),(273,1,3,'moodle/grade:lock',1,1352713752,0),(274,1,1,'moodle/grade:lock',1,1352713752,0),(275,1,3,'moodle/grade:unlock',1,1352713752,0),(276,1,1,'moodle/grade:unlock',1,1352713752,0),(277,1,7,'moodle/my:manageblocks',1,1352713752,0),(278,1,4,'moodle/notes:view',1,1352713752,0),(279,1,3,'moodle/notes:view',1,1352713752,0),(280,1,1,'moodle/notes:view',1,1352713752,0),(281,1,4,'moodle/notes:manage',1,1352713752,0),(282,1,3,'moodle/notes:manage',1,1352713752,0),(283,1,1,'moodle/notes:manage',1,1352713752,0),(284,1,4,'moodle/tag:manage',1,1352713752,0),(285,1,3,'moodle/tag:manage',1,1352713752,0),(286,1,1,'moodle/tag:manage',1,1352713752,0),(287,1,1,'moodle/tag:create',1,1352713752,0),(288,1,7,'moodle/tag:create',1,1352713752,0),(289,1,1,'moodle/tag:edit',1,1352713752,0),(290,1,7,'moodle/tag:edit',1,1352713752,0),(291,1,4,'moodle/tag:editblocks',1,1352713752,0),(292,1,3,'moodle/tag:editblocks',1,1352713752,0),(293,1,1,'moodle/tag:editblocks',1,1352713752,0),(294,1,6,'moodle/block:view',1,1352713752,0),(295,1,7,'moodle/block:view',1,1352713752,0),(296,1,5,'moodle/block:view',1,1352713752,0),(297,1,4,'moodle/block:view',1,1352713752,0),(298,1,3,'moodle/block:view',1,1352713752,0),(299,1,3,'moodle/block:edit',1,1352713752,0),(300,1,1,'moodle/block:edit',1,1352713752,0),(301,1,7,'moodle/portfolio:export',1,1352713752,0),(302,1,5,'moodle/portfolio:export',1,1352713752,0),(303,1,4,'moodle/portfolio:export',1,1352713752,0),(304,1,3,'moodle/portfolio:export',1,1352713752,0),(305,1,8,'moodle/comment:view',1,1352713752,0),(306,1,6,'moodle/comment:view',1,1352713752,0),(307,1,7,'moodle/comment:view',1,1352713752,0),(308,1,5,'moodle/comment:view',1,1352713752,0),(309,1,4,'moodle/comment:view',1,1352713752,0),(310,1,3,'moodle/comment:view',1,1352713753,0),(311,1,1,'moodle/comment:view',1,1352713753,0),(312,1,7,'moodle/comment:post',1,1352713753,0),(313,1,5,'moodle/comment:post',1,1352713753,0),(314,1,4,'moodle/comment:post',1,1352713753,0),(315,1,3,'moodle/comment:post',1,1352713753,0),(316,1,1,'moodle/comment:post',1,1352713753,0),(317,1,3,'moodle/comment:delete',1,1352713753,0),(318,1,1,'moodle/comment:delete',1,1352713753,0),(319,1,1,'moodle/webservice:createtoken',1,1352713753,0),(320,1,7,'moodle/webservice:createmobiletoken',1,1352713753,0),(321,1,7,'moodle/rating:view',1,1352713753,0),(322,1,5,'moodle/rating:view',1,1352713753,0),(323,1,4,'moodle/rating:view',1,1352713753,0),(324,1,3,'moodle/rating:view',1,1352713753,0),(325,1,1,'moodle/rating:view',1,1352713753,0),(326,1,7,'moodle/rating:viewany',1,1352713753,0),(327,1,5,'moodle/rating:viewany',1,1352713753,0),(328,1,4,'moodle/rating:viewany',1,1352713753,0),(329,1,3,'moodle/rating:viewany',1,1352713753,0),(330,1,1,'moodle/rating:viewany',1,1352713753,0),(331,1,7,'moodle/rating:viewall',1,1352713753,0),(332,1,5,'moodle/rating:viewall',1,1352713753,0),(333,1,4,'moodle/rating:viewall',1,1352713753,0),(334,1,3,'moodle/rating:viewall',1,1352713753,0),(335,1,1,'moodle/rating:viewall',1,1352713753,0),(336,1,7,'moodle/rating:rate',1,1352713753,0),(337,1,5,'moodle/rating:rate',1,1352713753,0),(338,1,4,'moodle/rating:rate',1,1352713753,0),(339,1,3,'moodle/rating:rate',1,1352713753,0),(340,1,1,'moodle/rating:rate',1,1352713753,0),(341,1,1,'moodle/course:publish',1,1352713753,0),(342,1,4,'moodle/course:markcomplete',1,1352713753,0),(343,1,3,'moodle/course:markcomplete',1,1352713753,0),(344,1,1,'moodle/course:markcomplete',1,1352713753,0),(345,1,1,'moodle/community:add',1,1352713753,0),(346,1,4,'moodle/community:add',1,1352713753,0),(347,1,3,'moodle/community:add',1,1352713753,0),(348,1,1,'moodle/community:download',1,1352713753,0),(349,1,3,'moodle/community:download',1,1352713753,0),(350,1,6,'mod/assign:view',1,1352713756,0),(351,1,5,'mod/assign:view',1,1352713756,0),(352,1,4,'mod/assign:view',1,1352713756,0),(353,1,3,'mod/assign:view',1,1352713756,0),(354,1,1,'mod/assign:view',1,1352713756,0),(355,1,5,'mod/assign:submit',1,1352713756,0),(356,1,4,'mod/assign:grade',1,1352713756,0),(357,1,3,'mod/assign:grade',1,1352713756,0),(358,1,1,'mod/assign:grade',1,1352713756,0),(359,1,4,'mod/assign:exportownsubmission',1,1352713756,0),(360,1,3,'mod/assign:exportownsubmission',1,1352713756,0),(361,1,1,'mod/assign:exportownsubmission',1,1352713756,0),(362,1,5,'mod/assign:exportownsubmission',1,1352713756,0),(363,1,3,'mod/assign:addinstance',1,1352713756,0),(364,1,1,'mod/assign:addinstance',1,1352713756,0),(365,1,6,'mod/assignment:view',1,1352713756,0),(366,1,5,'mod/assignment:view',1,1352713756,0),(367,1,4,'mod/assignment:view',1,1352713756,0),(368,1,3,'mod/assignment:view',1,1352713756,0),(369,1,1,'mod/assignment:view',1,1352713756,0),(370,1,3,'mod/assignment:addinstance',1,1352713756,0),(371,1,1,'mod/assignment:addinstance',1,1352713756,0),(372,1,5,'mod/assignment:submit',1,1352713756,0),(373,1,4,'mod/assignment:grade',1,1352713756,0),(374,1,3,'mod/assignment:grade',1,1352713756,0),(375,1,1,'mod/assignment:grade',1,1352713756,0),(376,1,4,'mod/assignment:exportownsubmission',1,1352713756,0),(377,1,3,'mod/assignment:exportownsubmission',1,1352713756,0),(378,1,1,'mod/assignment:exportownsubmission',1,1352713756,0),(379,1,5,'mod/assignment:exportownsubmission',1,1352713756,0),(380,1,3,'mod/book:addinstance',1,1352713757,0),(381,1,1,'mod/book:addinstance',1,1352713757,0),(382,1,6,'mod/book:read',1,1352713757,0),(383,1,8,'mod/book:read',1,1352713757,0),(384,1,5,'mod/book:read',1,1352713757,0),(385,1,4,'mod/book:read',1,1352713757,0),(386,1,3,'mod/book:read',1,1352713757,0),(387,1,1,'mod/book:read',1,1352713757,0),(388,1,4,'mod/book:viewhiddenchapters',1,1352713757,0),(389,1,3,'mod/book:viewhiddenchapters',1,1352713757,0),(390,1,1,'mod/book:viewhiddenchapters',1,1352713757,0),(391,1,3,'mod/book:edit',1,1352713757,0),(392,1,1,'mod/book:edit',1,1352713757,0),(393,1,3,'mod/chat:addinstance',1,1352713757,0),(394,1,1,'mod/chat:addinstance',1,1352713757,0),(395,1,5,'mod/chat:chat',1,1352713757,0),(396,1,4,'mod/chat:chat',1,1352713757,0),(397,1,3,'mod/chat:chat',1,1352713757,0),(398,1,1,'mod/chat:chat',1,1352713757,0),(399,1,5,'mod/chat:readlog',1,1352713757,0),(400,1,4,'mod/chat:readlog',1,1352713757,0),(401,1,3,'mod/chat:readlog',1,1352713757,0),(402,1,1,'mod/chat:readlog',1,1352713757,0),(403,1,4,'mod/chat:deletelog',1,1352713757,0),(404,1,3,'mod/chat:deletelog',1,1352713757,0),(405,1,1,'mod/chat:deletelog',1,1352713757,0),(406,1,4,'mod/chat:exportparticipatedsession',1,1352713757,0),(407,1,3,'mod/chat:exportparticipatedsession',1,1352713757,0),(408,1,1,'mod/chat:exportparticipatedsession',1,1352713757,0),(409,1,4,'mod/chat:exportsession',1,1352713757,0),(410,1,3,'mod/chat:exportsession',1,1352713757,0),(411,1,1,'mod/chat:exportsession',1,1352713757,0),(412,1,3,'mod/choice:addinstance',1,1352713757,0),(413,1,1,'mod/choice:addinstance',1,1352713757,0),(414,1,5,'mod/choice:choose',1,1352713757,0),(415,1,4,'mod/choice:choose',1,1352713757,0),(416,1,3,'mod/choice:choose',1,1352713757,0),(417,1,4,'mod/choice:readresponses',1,1352713757,0),(418,1,3,'mod/choice:readresponses',1,1352713757,0),(419,1,1,'mod/choice:readresponses',1,1352713757,0),(420,1,4,'mod/choice:deleteresponses',1,1352713757,0),(421,1,3,'mod/choice:deleteresponses',1,1352713757,0),(422,1,1,'mod/choice:deleteresponses',1,1352713757,0),(423,1,4,'mod/choice:downloadresponses',1,1352713757,0),(424,1,3,'mod/choice:downloadresponses',1,1352713757,0),(425,1,1,'mod/choice:downloadresponses',1,1352713757,0),(426,1,3,'mod/data:addinstance',1,1352713757,0),(427,1,1,'mod/data:addinstance',1,1352713757,0),(428,1,8,'mod/data:viewentry',1,1352713757,0),(429,1,6,'mod/data:viewentry',1,1352713757,0),(430,1,5,'mod/data:viewentry',1,1352713757,0),(431,1,4,'mod/data:viewentry',1,1352713757,0),(432,1,3,'mod/data:viewentry',1,1352713757,0),(433,1,1,'mod/data:viewentry',1,1352713757,0),(434,1,5,'mod/data:writeentry',1,1352713757,0),(435,1,4,'mod/data:writeentry',1,1352713757,0),(436,1,3,'mod/data:writeentry',1,1352713757,0),(437,1,1,'mod/data:writeentry',1,1352713757,0),(438,1,5,'mod/data:comment',1,1352713757,0),(439,1,4,'mod/data:comment',1,1352713757,0),(440,1,3,'mod/data:comment',1,1352713757,0),(441,1,1,'mod/data:comment',1,1352713757,0),(442,1,4,'mod/data:rate',1,1352713757,0),(443,1,3,'mod/data:rate',1,1352713757,0),(444,1,1,'mod/data:rate',1,1352713757,0),(445,1,4,'mod/data:viewrating',1,1352713757,0),(446,1,3,'mod/data:viewrating',1,1352713757,0),(447,1,1,'mod/data:viewrating',1,1352713757,0),(448,1,4,'mod/data:viewanyrating',1,1352713757,0),(449,1,3,'mod/data:viewanyrating',1,1352713757,0),(450,1,1,'mod/data:viewanyrating',1,1352713757,0),(451,1,4,'mod/data:viewallratings',1,1352713757,0),(452,1,3,'mod/data:viewallratings',1,1352713757,0),(453,1,1,'mod/data:viewallratings',1,1352713757,0),(454,1,4,'mod/data:approve',1,1352713757,0),(455,1,3,'mod/data:approve',1,1352713757,0),(456,1,1,'mod/data:approve',1,1352713757,0),(457,1,4,'mod/data:manageentries',1,1352713757,0),(458,1,3,'mod/data:manageentries',1,1352713757,0),(459,1,1,'mod/data:manageentries',1,1352713757,0),(460,1,4,'mod/data:managecomments',1,1352713757,0),(461,1,3,'mod/data:managecomments',1,1352713757,0),(462,1,1,'mod/data:managecomments',1,1352713757,0),(463,1,3,'mod/data:managetemplates',1,1352713757,0),(464,1,1,'mod/data:managetemplates',1,1352713757,0),(465,1,4,'mod/data:viewalluserpresets',1,1352713757,0),(466,1,3,'mod/data:viewalluserpresets',1,1352713757,0),(467,1,1,'mod/data:viewalluserpresets',1,1352713757,0),(468,1,1,'mod/data:manageuserpresets',1,1352713757,0),(469,1,1,'mod/data:exportentry',1,1352713757,0),(470,1,4,'mod/data:exportentry',1,1352713757,0),(471,1,3,'mod/data:exportentry',1,1352713757,0),(472,1,1,'mod/data:exportownentry',1,1352713758,0),(473,1,4,'mod/data:exportownentry',1,1352713758,0),(474,1,3,'mod/data:exportownentry',1,1352713758,0),(475,1,5,'mod/data:exportownentry',1,1352713758,0),(476,1,1,'mod/data:exportallentries',1,1352713758,0),(477,1,4,'mod/data:exportallentries',1,1352713758,0),(478,1,3,'mod/data:exportallentries',1,1352713758,0),(479,1,3,'mod/feedback:addinstance',1,1352713758,0),(480,1,1,'mod/feedback:addinstance',1,1352713758,0),(481,1,6,'mod/feedback:view',1,1352713758,0),(482,1,5,'mod/feedback:view',1,1352713758,0),(483,1,4,'mod/feedback:view',1,1352713758,0),(484,1,3,'mod/feedback:view',1,1352713758,0),(485,1,1,'mod/feedback:view',1,1352713758,0),(486,1,5,'mod/feedback:complete',1,1352713758,0),(487,1,5,'mod/feedback:viewanalysepage',1,1352713758,0),(488,1,3,'mod/feedback:viewanalysepage',1,1352713758,0),(489,1,1,'mod/feedback:viewanalysepage',1,1352713758,0),(490,1,3,'mod/feedback:deletesubmissions',1,1352713758,0),(491,1,1,'mod/feedback:deletesubmissions',1,1352713758,0),(492,1,1,'mod/feedback:mapcourse',1,1352713758,0),(493,1,3,'mod/feedback:edititems',1,1352713758,0),(494,1,1,'mod/feedback:edititems',1,1352713758,0),(495,1,3,'mod/feedback:createprivatetemplate',1,1352713758,0),(496,1,1,'mod/feedback:createprivatetemplate',1,1352713758,0),(497,1,3,'mod/feedback:createpublictemplate',1,1352713758,0),(498,1,1,'mod/feedback:createpublictemplate',1,1352713758,0),(499,1,3,'mod/feedback:deletetemplate',1,1352713758,0),(500,1,1,'mod/feedback:deletetemplate',1,1352713758,0),(501,1,4,'mod/feedback:viewreports',1,1352713758,0),(502,1,3,'mod/feedback:viewreports',1,1352713758,0),(503,1,1,'mod/feedback:viewreports',1,1352713758,0),(504,1,4,'mod/feedback:receivemail',1,1352713758,0),(505,1,3,'mod/feedback:receivemail',1,1352713758,0),(506,1,3,'mod/folder:addinstance',1,1352713758,0),(507,1,1,'mod/folder:addinstance',1,1352713758,0),(508,1,6,'mod/folder:view',1,1352713758,0),(509,1,7,'mod/folder:view',1,1352713758,0),(510,1,3,'mod/folder:managefiles',1,1352713758,0),(511,1,3,'mod/forum:addinstance',1,1352713758,0),(512,1,1,'mod/forum:addinstance',1,1352713758,0),(513,1,8,'mod/forum:viewdiscussion',1,1352713758,0),(514,1,6,'mod/forum:viewdiscussion',1,1352713758,0),(515,1,5,'mod/forum:viewdiscussion',1,1352713758,0),(516,1,4,'mod/forum:viewdiscussion',1,1352713758,0),(517,1,3,'mod/forum:viewdiscussion',1,1352713758,0),(518,1,1,'mod/forum:viewdiscussion',1,1352713758,0),(519,1,4,'mod/forum:viewhiddentimedposts',1,1352713758,0),(520,1,3,'mod/forum:viewhiddentimedposts',1,1352713758,0),(521,1,1,'mod/forum:viewhiddentimedposts',1,1352713758,0),(522,1,5,'mod/forum:startdiscussion',1,1352713758,0),(523,1,4,'mod/forum:startdiscussion',1,1352713758,0),(524,1,3,'mod/forum:startdiscussion',1,1352713758,0),(525,1,1,'mod/forum:startdiscussion',1,1352713758,0),(526,1,5,'mod/forum:replypost',1,1352713758,0),(527,1,4,'mod/forum:replypost',1,1352713758,0),(528,1,3,'mod/forum:replypost',1,1352713758,0),(529,1,1,'mod/forum:replypost',1,1352713758,0),(530,1,4,'mod/forum:addnews',1,1352713758,0),(531,1,3,'mod/forum:addnews',1,1352713758,0),(532,1,1,'mod/forum:addnews',1,1352713758,0),(533,1,4,'mod/forum:replynews',1,1352713758,0),(534,1,3,'mod/forum:replynews',1,1352713758,0),(535,1,1,'mod/forum:replynews',1,1352713758,0),(536,1,5,'mod/forum:viewrating',1,1352713758,0),(537,1,4,'mod/forum:viewrating',1,1352713758,0),(538,1,3,'mod/forum:viewrating',1,1352713758,0),(539,1,1,'mod/forum:viewrating',1,1352713758,0),(540,1,4,'mod/forum:viewanyrating',1,1352713758,0),(541,1,3,'mod/forum:viewanyrating',1,1352713758,0),(542,1,1,'mod/forum:viewanyrating',1,1352713758,0),(543,1,4,'mod/forum:viewallratings',1,1352713758,0),(544,1,3,'mod/forum:viewallratings',1,1352713758,0),(545,1,1,'mod/forum:viewallratings',1,1352713758,0),(546,1,4,'mod/forum:rate',1,1352713758,0),(547,1,3,'mod/forum:rate',1,1352713758,0),(548,1,1,'mod/forum:rate',1,1352713758,0),(549,1,5,'mod/forum:createattachment',1,1352713758,0),(550,1,4,'mod/forum:createattachment',1,1352713758,0),(551,1,3,'mod/forum:createattachment',1,1352713759,0),(552,1,1,'mod/forum:createattachment',1,1352713759,0),(553,1,5,'mod/forum:deleteownpost',1,1352713759,0),(554,1,4,'mod/forum:deleteownpost',1,1352713759,0),(555,1,3,'mod/forum:deleteownpost',1,1352713759,0),(556,1,1,'mod/forum:deleteownpost',1,1352713759,0),(557,1,4,'mod/forum:deleteanypost',1,1352713759,0),(558,1,3,'mod/forum:deleteanypost',1,1352713759,0),(559,1,1,'mod/forum:deleteanypost',1,1352713759,0),(560,1,4,'mod/forum:splitdiscussions',1,1352713759,0),(561,1,3,'mod/forum:splitdiscussions',1,1352713759,0),(562,1,1,'mod/forum:splitdiscussions',1,1352713759,0),(563,1,4,'mod/forum:movediscussions',1,1352713759,0),(564,1,3,'mod/forum:movediscussions',1,1352713759,0),(565,1,1,'mod/forum:movediscussions',1,1352713759,0),(566,1,4,'mod/forum:editanypost',1,1352713759,0),(567,1,3,'mod/forum:editanypost',1,1352713759,0),(568,1,1,'mod/forum:editanypost',1,1352713759,0),(569,1,4,'mod/forum:viewqandawithoutposting',1,1352713759,0),(570,1,3,'mod/forum:viewqandawithoutposting',1,1352713759,0),(571,1,1,'mod/forum:viewqandawithoutposting',1,1352713759,0),(572,1,4,'mod/forum:viewsubscribers',1,1352713759,0),(573,1,3,'mod/forum:viewsubscribers',1,1352713759,0),(574,1,1,'mod/forum:viewsubscribers',1,1352713759,0),(575,1,4,'mod/forum:managesubscriptions',1,1352713759,0),(576,1,3,'mod/forum:managesubscriptions',1,1352713759,0),(577,1,1,'mod/forum:managesubscriptions',1,1352713759,0),(578,1,4,'mod/forum:postwithoutthrottling',1,1352713759,0),(579,1,3,'mod/forum:postwithoutthrottling',1,1352713759,0),(580,1,1,'mod/forum:postwithoutthrottling',1,1352713759,0),(581,1,4,'mod/forum:exportdiscussion',1,1352713759,0),(582,1,3,'mod/forum:exportdiscussion',1,1352713759,0),(583,1,1,'mod/forum:exportdiscussion',1,1352713759,0),(584,1,4,'mod/forum:exportpost',1,1352713759,0),(585,1,3,'mod/forum:exportpost',1,1352713759,0),(586,1,1,'mod/forum:exportpost',1,1352713759,0),(587,1,4,'mod/forum:exportownpost',1,1352713759,0),(588,1,3,'mod/forum:exportownpost',1,1352713759,0),(589,1,1,'mod/forum:exportownpost',1,1352713759,0),(590,1,5,'mod/forum:exportownpost',1,1352713759,0),(591,1,4,'mod/forum:addquestion',1,1352713759,0),(592,1,3,'mod/forum:addquestion',1,1352713759,0),(593,1,1,'mod/forum:addquestion',1,1352713759,0),(594,1,5,'mod/forum:allowforcesubscribe',1,1352713759,0),(595,1,4,'mod/forum:allowforcesubscribe',1,1352713759,0),(596,1,3,'mod/forum:allowforcesubscribe',1,1352713759,0),(597,1,3,'mod/glossary:addinstance',1,1352713759,0),(598,1,1,'mod/glossary:addinstance',1,1352713759,0),(599,1,8,'mod/glossary:view',1,1352713759,0),(600,1,6,'mod/glossary:view',1,1352713759,0),(601,1,5,'mod/glossary:view',1,1352713759,0),(602,1,4,'mod/glossary:view',1,1352713759,0),(603,1,3,'mod/glossary:view',1,1352713759,0),(604,1,1,'mod/glossary:view',1,1352713759,0),(605,1,5,'mod/glossary:write',1,1352713759,0),(606,1,4,'mod/glossary:write',1,1352713759,0),(607,1,3,'mod/glossary:write',1,1352713759,0),(608,1,1,'mod/glossary:write',1,1352713759,0),(609,1,4,'mod/glossary:manageentries',1,1352713759,0),(610,1,3,'mod/glossary:manageentries',1,1352713759,0),(611,1,1,'mod/glossary:manageentries',1,1352713759,0),(612,1,4,'mod/glossary:managecategories',1,1352713759,0),(613,1,3,'mod/glossary:managecategories',1,1352713759,0),(614,1,1,'mod/glossary:managecategories',1,1352713759,0),(615,1,5,'mod/glossary:comment',1,1352713759,0),(616,1,4,'mod/glossary:comment',1,1352713759,0),(617,1,3,'mod/glossary:comment',1,1352713759,0),(618,1,1,'mod/glossary:comment',1,1352713759,0),(619,1,4,'mod/glossary:managecomments',1,1352713759,0),(620,1,3,'mod/glossary:managecomments',1,1352713759,0),(621,1,1,'mod/glossary:managecomments',1,1352713759,0),(622,1,4,'mod/glossary:import',1,1352713759,0),(623,1,3,'mod/glossary:import',1,1352713759,0),(624,1,1,'mod/glossary:import',1,1352713759,0),(625,1,4,'mod/glossary:export',1,1352713759,0),(626,1,3,'mod/glossary:export',1,1352713759,0),(627,1,1,'mod/glossary:export',1,1352713759,0),(628,1,4,'mod/glossary:approve',1,1352713759,0),(629,1,3,'mod/glossary:approve',1,1352713759,0),(630,1,1,'mod/glossary:approve',1,1352713759,0),(631,1,4,'mod/glossary:rate',1,1352713759,0),(632,1,3,'mod/glossary:rate',1,1352713759,0),(633,1,1,'mod/glossary:rate',1,1352713759,0),(634,1,4,'mod/glossary:viewrating',1,1352713759,0),(635,1,3,'mod/glossary:viewrating',1,1352713759,0),(636,1,1,'mod/glossary:viewrating',1,1352713759,0),(637,1,4,'mod/glossary:viewanyrating',1,1352713759,0),(638,1,3,'mod/glossary:viewanyrating',1,1352713759,0),(639,1,1,'mod/glossary:viewanyrating',1,1352713759,0),(640,1,4,'mod/glossary:viewallratings',1,1352713759,0),(641,1,3,'mod/glossary:viewallratings',1,1352713759,0),(642,1,1,'mod/glossary:viewallratings',1,1352713759,0),(643,1,4,'mod/glossary:exportentry',1,1352713759,0),(644,1,3,'mod/glossary:exportentry',1,1352713759,0),(645,1,1,'mod/glossary:exportentry',1,1352713759,0),(646,1,4,'mod/glossary:exportownentry',1,1352713759,0),(647,1,3,'mod/glossary:exportownentry',1,1352713759,0),(648,1,1,'mod/glossary:exportownentry',1,1352713759,0),(649,1,5,'mod/glossary:exportownentry',1,1352713759,0),(650,1,6,'mod/imscp:view',1,1352713759,0),(651,1,7,'mod/imscp:view',1,1352713759,0),(652,1,3,'mod/imscp:addinstance',1,1352713759,0),(653,1,1,'mod/imscp:addinstance',1,1352713759,0),(654,1,3,'mod/label:addinstance',1,1352713759,0),(655,1,1,'mod/label:addinstance',1,1352713759,0),(656,1,3,'mod/lesson:addinstance',1,1352713760,0),(657,1,1,'mod/lesson:addinstance',1,1352713760,0),(658,1,3,'mod/lesson:edit',1,1352713760,0),(659,1,1,'mod/lesson:edit',1,1352713760,0),(660,1,4,'mod/lesson:manage',1,1352713760,0),(661,1,3,'mod/lesson:manage',1,1352713760,0),(662,1,1,'mod/lesson:manage',1,1352713760,0),(663,1,6,'mod/lti:view',1,1352713760,0),(664,1,5,'mod/lti:view',1,1352713760,0),(665,1,4,'mod/lti:view',1,1352713760,0),(666,1,3,'mod/lti:view',1,1352713760,0),(667,1,1,'mod/lti:view',1,1352713760,0),(668,1,3,'mod/lti:addinstance',1,1352713760,0),(669,1,1,'mod/lti:addinstance',1,1352713760,0),(670,1,4,'mod/lti:grade',1,1352713760,0),(671,1,3,'mod/lti:grade',1,1352713760,0),(672,1,1,'mod/lti:grade',1,1352713760,0),(673,1,4,'mod/lti:manage',1,1352713760,0),(674,1,3,'mod/lti:manage',1,1352713760,0),(675,1,1,'mod/lti:manage',1,1352713760,0),(676,1,4,'mod/lti:addcoursetool',1,1352713760,0),(677,1,3,'mod/lti:addcoursetool',1,1352713760,0),(678,1,1,'mod/lti:addcoursetool',1,1352713760,0),(679,1,4,'mod/lti:requesttooladd',1,1352713760,0),(680,1,3,'mod/lti:requesttooladd',1,1352713760,0),(681,1,1,'mod/lti:requesttooladd',1,1352713760,0),(682,1,6,'mod/page:view',1,1352713760,0),(683,1,7,'mod/page:view',1,1352713760,0),(684,1,3,'mod/page:addinstance',1,1352713760,0),(685,1,1,'mod/page:addinstance',1,1352713760,0),(686,1,6,'mod/quiz:view',1,1352713760,0),(687,1,5,'mod/quiz:view',1,1352713760,0),(688,1,4,'mod/quiz:view',1,1352713760,0),(689,1,3,'mod/quiz:view',1,1352713760,0),(690,1,1,'mod/quiz:view',1,1352713760,0),(691,1,3,'mod/quiz:addinstance',1,1352713760,0),(692,1,1,'mod/quiz:addinstance',1,1352713760,0),(693,1,5,'mod/quiz:attempt',1,1352713760,0),(694,1,5,'mod/quiz:reviewmyattempts',1,1352713760,0),(695,1,3,'mod/quiz:manage',1,1352713760,0),(696,1,1,'mod/quiz:manage',1,1352713760,0),(697,1,3,'mod/quiz:manageoverrides',1,1352713760,0),(698,1,1,'mod/quiz:manageoverrides',1,1352713760,0),(699,1,4,'mod/quiz:preview',1,1352713760,0),(700,1,3,'mod/quiz:preview',1,1352713760,0),(701,1,1,'mod/quiz:preview',1,1352713760,0),(702,1,4,'mod/quiz:grade',1,1352713760,0),(703,1,3,'mod/quiz:grade',1,1352713760,0),(704,1,1,'mod/quiz:grade',1,1352713760,0),(705,1,4,'mod/quiz:regrade',1,1352713760,0),(706,1,3,'mod/quiz:regrade',1,1352713760,0),(707,1,1,'mod/quiz:regrade',1,1352713760,0),(708,1,4,'mod/quiz:viewreports',1,1352713760,0),(709,1,3,'mod/quiz:viewreports',1,1352713760,0),(710,1,1,'mod/quiz:viewreports',1,1352713760,0),(711,1,3,'mod/quiz:deleteattempts',1,1352713760,0),(712,1,1,'mod/quiz:deleteattempts',1,1352713760,0),(713,1,6,'mod/resource:view',1,1352713761,0),(714,1,7,'mod/resource:view',1,1352713761,0),(715,1,3,'mod/resource:addinstance',1,1352713761,0),(716,1,1,'mod/resource:addinstance',1,1352713761,0),(717,1,3,'mod/scorm:addinstance',1,1352713761,0),(718,1,1,'mod/scorm:addinstance',1,1352713761,0),(719,1,4,'mod/scorm:viewreport',1,1352713761,0),(720,1,3,'mod/scorm:viewreport',1,1352713761,0),(721,1,1,'mod/scorm:viewreport',1,1352713761,0),(722,1,5,'mod/scorm:skipview',1,1352713761,0),(723,1,5,'mod/scorm:savetrack',1,1352713761,0),(724,1,4,'mod/scorm:savetrack',1,1352713761,0),(725,1,3,'mod/scorm:savetrack',1,1352713761,0),(726,1,1,'mod/scorm:savetrack',1,1352713761,0),(727,1,5,'mod/scorm:viewscores',1,1352713761,0),(728,1,4,'mod/scorm:viewscores',1,1352713761,0),(729,1,3,'mod/scorm:viewscores',1,1352713761,0),(730,1,1,'mod/scorm:viewscores',1,1352713761,0),(731,1,4,'mod/scorm:deleteresponses',1,1352713761,0),(732,1,3,'mod/scorm:deleteresponses',1,1352713761,0),(733,1,1,'mod/scorm:deleteresponses',1,1352713761,0),(734,1,3,'mod/survey:addinstance',1,1352713761,0),(735,1,1,'mod/survey:addinstance',1,1352713761,0),(736,1,5,'mod/survey:participate',1,1352713761,0),(737,1,4,'mod/survey:participate',1,1352713761,0),(738,1,3,'mod/survey:participate',1,1352713761,0),(739,1,1,'mod/survey:participate',1,1352713761,0),(740,1,4,'mod/survey:readresponses',1,1352713761,0),(741,1,3,'mod/survey:readresponses',1,1352713761,0),(742,1,1,'mod/survey:readresponses',1,1352713761,0),(743,1,4,'mod/survey:download',1,1352713761,0),(744,1,3,'mod/survey:download',1,1352713761,0),(745,1,1,'mod/survey:download',1,1352713761,0),(746,1,6,'mod/url:view',1,1352713762,0),(747,1,7,'mod/url:view',1,1352713762,0),(748,1,3,'mod/url:addinstance',1,1352713762,0),(749,1,1,'mod/url:addinstance',1,1352713762,0),(750,1,3,'mod/wiki:addinstance',1,1352713762,0),(751,1,1,'mod/wiki:addinstance',1,1352713762,0),(752,1,6,'mod/wiki:viewpage',1,1352713762,0),(753,1,5,'mod/wiki:viewpage',1,1352713762,0),(754,1,4,'mod/wiki:viewpage',1,1352713762,0),(755,1,3,'mod/wiki:viewpage',1,1352713762,0),(756,1,1,'mod/wiki:viewpage',1,1352713762,0),(757,1,5,'mod/wiki:editpage',1,1352713762,0),(758,1,4,'mod/wiki:editpage',1,1352713762,0),(759,1,3,'mod/wiki:editpage',1,1352713762,0),(760,1,1,'mod/wiki:editpage',1,1352713762,0),(761,1,5,'mod/wiki:createpage',1,1352713762,0),(762,1,4,'mod/wiki:createpage',1,1352713762,0),(763,1,3,'mod/wiki:createpage',1,1352713762,0),(764,1,1,'mod/wiki:createpage',1,1352713762,0),(765,1,5,'mod/wiki:viewcomment',1,1352713762,0),(766,1,4,'mod/wiki:viewcomment',1,1352713762,0),(767,1,3,'mod/wiki:viewcomment',1,1352713762,0),(768,1,1,'mod/wiki:viewcomment',1,1352713762,0),(769,1,5,'mod/wiki:editcomment',1,1352713762,0),(770,1,4,'mod/wiki:editcomment',1,1352713762,0),(771,1,3,'mod/wiki:editcomment',1,1352713762,0),(772,1,1,'mod/wiki:editcomment',1,1352713762,0),(773,1,4,'mod/wiki:managecomment',1,1352713762,0),(774,1,3,'mod/wiki:managecomment',1,1352713762,0),(775,1,1,'mod/wiki:managecomment',1,1352713762,0),(776,1,4,'mod/wiki:managefiles',1,1352713762,0),(777,1,3,'mod/wiki:managefiles',1,1352713762,0),(778,1,1,'mod/wiki:managefiles',1,1352713762,0),(779,1,4,'mod/wiki:overridelock',1,1352713762,0),(780,1,3,'mod/wiki:overridelock',1,1352713762,0),(781,1,1,'mod/wiki:overridelock',1,1352713762,0),(782,1,4,'mod/wiki:managewiki',1,1352713762,0),(783,1,3,'mod/wiki:managewiki',1,1352713762,0),(784,1,1,'mod/wiki:managewiki',1,1352713762,0),(785,1,6,'mod/workshop:view',1,1352713762,0),(786,1,5,'mod/workshop:view',1,1352713762,0),(787,1,4,'mod/workshop:view',1,1352713762,0),(788,1,3,'mod/workshop:view',1,1352713762,0),(789,1,1,'mod/workshop:view',1,1352713762,0),(790,1,3,'mod/workshop:addinstance',1,1352713762,0),(791,1,1,'mod/workshop:addinstance',1,1352713762,0),(792,1,4,'mod/workshop:switchphase',1,1352713762,0),(793,1,3,'mod/workshop:switchphase',1,1352713762,0),(794,1,1,'mod/workshop:switchphase',1,1352713762,0),(795,1,3,'mod/workshop:editdimensions',1,1352713762,0),(796,1,1,'mod/workshop:editdimensions',1,1352713762,0),(797,1,5,'mod/workshop:submit',1,1352713762,0),(798,1,5,'mod/workshop:peerassess',1,1352713762,0),(799,1,4,'mod/workshop:manageexamples',1,1352713762,0),(800,1,3,'mod/workshop:manageexamples',1,1352713762,0),(801,1,1,'mod/workshop:manageexamples',1,1352713762,0),(802,1,4,'mod/workshop:allocate',1,1352713762,0),(803,1,3,'mod/workshop:allocate',1,1352713762,0),(804,1,1,'mod/workshop:allocate',1,1352713762,0),(805,1,4,'mod/workshop:publishsubmissions',1,1352713762,0),(806,1,3,'mod/workshop:publishsubmissions',1,1352713762,0),(807,1,1,'mod/workshop:publishsubmissions',1,1352713762,0),(808,1,5,'mod/workshop:viewauthornames',1,1352713763,0),(809,1,4,'mod/workshop:viewauthornames',1,1352713763,0),(810,1,3,'mod/workshop:viewauthornames',1,1352713763,0),(811,1,1,'mod/workshop:viewauthornames',1,1352713763,0),(812,1,4,'mod/workshop:viewreviewernames',1,1352713763,0),(813,1,3,'mod/workshop:viewreviewernames',1,1352713763,0),(814,1,1,'mod/workshop:viewreviewernames',1,1352713763,0),(815,1,4,'mod/workshop:viewallsubmissions',1,1352713763,0),(816,1,3,'mod/workshop:viewallsubmissions',1,1352713763,0),(817,1,1,'mod/workshop:viewallsubmissions',1,1352713763,0),(818,1,5,'mod/workshop:viewpublishedsubmissions',1,1352713763,0),(819,1,4,'mod/workshop:viewpublishedsubmissions',1,1352713763,0),(820,1,3,'mod/workshop:viewpublishedsubmissions',1,1352713763,0),(821,1,1,'mod/workshop:viewpublishedsubmissions',1,1352713763,0),(822,1,5,'mod/workshop:viewauthorpublished',1,1352713763,0),(823,1,4,'mod/workshop:viewauthorpublished',1,1352713763,0),(824,1,3,'mod/workshop:viewauthorpublished',1,1352713763,0),(825,1,1,'mod/workshop:viewauthorpublished',1,1352713763,0),(826,1,4,'mod/workshop:viewallassessments',1,1352713763,0),(827,1,3,'mod/workshop:viewallassessments',1,1352713763,0),(828,1,1,'mod/workshop:viewallassessments',1,1352713763,0),(829,1,4,'mod/workshop:overridegrades',1,1352713763,0),(830,1,3,'mod/workshop:overridegrades',1,1352713763,0),(831,1,1,'mod/workshop:overridegrades',1,1352713763,0),(832,1,4,'mod/workshop:ignoredeadlines',1,1352713763,0),(833,1,3,'mod/workshop:ignoredeadlines',1,1352713763,0),(834,1,1,'mod/workshop:ignoredeadlines',1,1352713763,0),(835,1,1,'enrol/authorize:config',1,1352713764,0),(836,1,1,'enrol/authorize:manage',1,1352713764,0),(837,1,3,'enrol/authorize:manage',1,1352713764,0),(838,1,1,'enrol/authorize:unenrol',1,1352713764,0),(839,1,1,'enrol/authorize:managepayments',1,1352713764,0),(840,1,1,'enrol/authorize:uploadcsv',1,1352713764,0),(841,1,3,'enrol/cohort:config',1,1352713764,0),(842,1,1,'enrol/cohort:config',1,1352713764,0),(843,1,1,'enrol/cohort:unenrol',1,1352713764,0),(844,1,1,'enrol/database:unenrol',1,1352713764,0),(845,1,1,'enrol/guest:config',1,1352713764,0),(846,1,3,'enrol/guest:config',1,1352713764,0),(847,1,1,'enrol/ldap:manage',1,1352713764,0),(848,1,1,'enrol/manual:config',1,1352713764,0),(849,1,1,'enrol/manual:enrol',1,1352713764,0),(850,1,3,'enrol/manual:enrol',1,1352713764,0),(851,1,1,'enrol/manual:manage',1,1352713764,0),(852,1,3,'enrol/manual:manage',1,1352713764,0),(853,1,1,'enrol/manual:unenrol',1,1352713764,0),(854,1,3,'enrol/manual:unenrol',1,1352713764,0),(855,1,1,'enrol/meta:config',1,1352713764,0),(856,1,3,'enrol/meta:config',1,1352713764,0),(857,1,1,'enrol/meta:selectaslinked',1,1352713764,0),(858,1,1,'enrol/meta:unenrol',1,1352713764,0),(859,1,1,'enrol/paypal:config',1,1352713764,0),(860,1,1,'enrol/paypal:manage',1,1352713764,0),(861,1,3,'enrol/paypal:manage',1,1352713764,0),(862,1,1,'enrol/paypal:unenrol',1,1352713764,0),(863,1,3,'enrol/self:config',1,1352713765,0),(864,1,1,'enrol/self:config',1,1352713765,0),(865,1,3,'enrol/self:manage',1,1352713765,0),(866,1,1,'enrol/self:manage',1,1352713765,0),(867,1,5,'enrol/self:unenrolself',1,1352713765,0),(868,1,3,'enrol/self:unenrol',1,1352713765,0),(869,1,1,'enrol/self:unenrol',1,1352713765,0),(870,1,7,'block/online_users:viewlist',1,1352713766,0),(871,1,6,'block/online_users:viewlist',1,1352713766,0),(872,1,5,'block/online_users:viewlist',1,1352713766,0),(873,1,4,'block/online_users:viewlist',1,1352713766,0),(874,1,3,'block/online_users:viewlist',1,1352713766,0),(875,1,1,'block/online_users:viewlist',1,1352713766,0),(876,1,4,'block/rss_client:manageownfeeds',1,1352713766,0),(877,1,3,'block/rss_client:manageownfeeds',1,1352713766,0),(878,1,1,'block/rss_client:manageownfeeds',1,1352713766,0),(879,1,1,'block/rss_client:manageanyfeeds',1,1352713766,0),(880,1,4,'report/completion:view',1,1352713767,0),(881,1,3,'report/completion:view',1,1352713767,0),(882,1,1,'report/completion:view',1,1352713767,0),(883,1,4,'report/courseoverview:view',1,1352713767,0),(884,1,3,'report/courseoverview:view',1,1352713767,0),(885,1,1,'report/courseoverview:view',1,1352713767,0),(886,1,4,'report/log:view',1,1352713767,0),(887,1,3,'report/log:view',1,1352713767,0),(888,1,1,'report/log:view',1,1352713767,0),(889,1,4,'report/log:viewtoday',1,1352713767,0),(890,1,3,'report/log:viewtoday',1,1352713767,0),(891,1,1,'report/log:viewtoday',1,1352713767,0),(892,1,4,'report/loglive:view',1,1352713768,0),(893,1,3,'report/loglive:view',1,1352713768,0),(894,1,1,'report/loglive:view',1,1352713768,0),(895,1,4,'report/outline:view',1,1352713768,0),(896,1,3,'report/outline:view',1,1352713768,0),(897,1,1,'report/outline:view',1,1352713768,0),(898,1,4,'report/participation:view',1,1352713768,0),(899,1,3,'report/participation:view',1,1352713768,0),(900,1,1,'report/participation:view',1,1352713768,0),(901,1,4,'report/progress:view',1,1352713768,0),(902,1,3,'report/progress:view',1,1352713768,0),(903,1,1,'report/progress:view',1,1352713768,0),(904,1,1,'report/security:view',1,1352713768,0),(905,1,4,'report/stats:view',1,1352713768,0),(906,1,3,'report/stats:view',1,1352713768,0),(907,1,1,'report/stats:view',1,1352713768,0),(908,1,4,'gradeexport/ods:view',1,1352713768,0),(909,1,3,'gradeexport/ods:view',1,1352713768,0),(910,1,1,'gradeexport/ods:view',1,1352713768,0),(911,1,1,'gradeexport/ods:publish',1,1352713768,0),(912,1,4,'gradeexport/txt:view',1,1352713768,0),(913,1,3,'gradeexport/txt:view',1,1352713768,0),(914,1,1,'gradeexport/txt:view',1,1352713768,0),(915,1,1,'gradeexport/txt:publish',1,1352713768,0),(916,1,4,'gradeexport/xls:view',1,1352713768,0),(917,1,3,'gradeexport/xls:view',1,1352713768,0),(918,1,1,'gradeexport/xls:view',1,1352713768,0),(919,1,1,'gradeexport/xls:publish',1,1352713768,0),(920,1,4,'gradeexport/xml:view',1,1352713768,0),(921,1,3,'gradeexport/xml:view',1,1352713768,0),(922,1,1,'gradeexport/xml:view',1,1352713768,0),(923,1,1,'gradeexport/xml:publish',1,1352713768,0),(924,1,3,'gradeimport/csv:view',1,1352713768,0),(925,1,1,'gradeimport/csv:view',1,1352713768,0),(926,1,3,'gradeimport/xml:view',1,1352713768,0),(927,1,1,'gradeimport/xml:view',1,1352713768,0),(928,1,1,'gradeimport/xml:publish',1,1352713768,0),(929,1,4,'gradereport/grader:view',1,1352713768,0),(930,1,3,'gradereport/grader:view',1,1352713768,0),(931,1,1,'gradereport/grader:view',1,1352713768,0),(932,1,4,'gradereport/outcomes:view',1,1352713768,0),(933,1,3,'gradereport/outcomes:view',1,1352713768,0),(934,1,1,'gradereport/outcomes:view',1,1352713768,0),(935,1,5,'gradereport/overview:view',1,1352713768,0),(936,1,1,'gradereport/overview:view',1,1352713768,0),(937,1,5,'gradereport/user:view',1,1352713768,0),(938,1,4,'gradereport/user:view',1,1352713768,0),(939,1,3,'gradereport/user:view',1,1352713768,0),(940,1,1,'gradereport/user:view',1,1352713768,0),(941,1,7,'repository/alfresco:view',1,1352713769,0),(942,1,7,'repository/boxnet:view',1,1352713769,0),(943,1,2,'repository/coursefiles:view',1,1352713769,0),(944,1,4,'repository/coursefiles:view',1,1352713769,0),(945,1,3,'repository/coursefiles:view',1,1352713769,0),(946,1,1,'repository/coursefiles:view',1,1352713769,0),(947,1,7,'repository/dropbox:view',1,1352713769,0),(948,1,7,'repository/equella:view',1,1352713769,0),(949,1,2,'repository/filesystem:view',1,1352713769,0),(950,1,4,'repository/filesystem:view',1,1352713769,0),(951,1,3,'repository/filesystem:view',1,1352713769,0),(952,1,1,'repository/filesystem:view',1,1352713769,0),(953,1,7,'repository/flickr:view',1,1352713769,0),(954,1,7,'repository/flickr_public:view',1,1352713769,0),(955,1,7,'repository/googledocs:view',1,1352713769,0),(956,1,2,'repository/local:view',1,1352713770,0),(957,1,4,'repository/local:view',1,1352713770,0),(958,1,3,'repository/local:view',1,1352713770,0),(959,1,1,'repository/local:view',1,1352713770,0),(960,1,7,'repository/merlot:view',1,1352713770,0),(961,1,7,'repository/picasa:view',1,1352713770,0),(962,1,7,'repository/recent:view',1,1352713770,0),(963,1,7,'repository/s3:view',1,1352713770,0),(964,1,7,'repository/upload:view',1,1352713770,0),(965,1,7,'repository/url:view',1,1352713770,0),(966,1,7,'repository/user:view',1,1352713770,0),(967,1,2,'repository/webdav:view',1,1352713770,0),(968,1,4,'repository/webdav:view',1,1352713770,0),(969,1,3,'repository/webdav:view',1,1352713770,0),(970,1,1,'repository/webdav:view',1,1352713770,0),(971,1,7,'repository/wikimedia:view',1,1352713770,0),(972,1,7,'repository/youtube:view',1,1352713770,0),(973,1,1,'tool/customlang:view',1,1352713772,0),(974,1,1,'tool/customlang:edit',1,1352713772,0),(975,1,3,'booktool/importhtml:import',1,1352713774,0),(976,1,1,'booktool/importhtml:import',1,1352713774,0),(977,1,6,'booktool/print:print',1,1352713774,0),(978,1,8,'booktool/print:print',1,1352713774,0),(979,1,5,'booktool/print:print',1,1352713774,0),(980,1,4,'booktool/print:print',1,1352713774,0),(981,1,3,'booktool/print:print',1,1352713774,0),(982,1,1,'booktool/print:print',1,1352713774,0),(983,1,4,'quiz/grading:viewstudentnames',1,1352713775,0),(984,1,3,'quiz/grading:viewstudentnames',1,1352713775,0),(985,1,1,'quiz/grading:viewstudentnames',1,1352713775,0),(986,1,4,'quiz/grading:viewidnumber',1,1352713775,0),(987,1,3,'quiz/grading:viewidnumber',1,1352713775,0),(988,1,1,'quiz/grading:viewidnumber',1,1352713775,0),(989,1,4,'quiz/statistics:view',1,1352713775,0),(990,1,3,'quiz/statistics:view',1,1352713775,0),(991,1,1,'quiz/statistics:view',1,1352713775,0),(992,1,3,'moodle/course:movesections',1,1363018091,0),(993,1,1,'moodle/course:movesections',1,1363018091,0),(994,1,1,'moodle/tag:flag',1,1363018091,0),(995,1,7,'moodle/tag:flag',1,1363018091,0),(996,1,4,'mod/assign:grantextension',1,1363018092,0),(997,1,3,'mod/assign:grantextension',1,1363018092,0),(998,1,1,'mod/assign:grantextension',1,1363018092,0),(999,1,3,'mod/assign:revealidentities',1,1363018092,0),(1000,1,1,'mod/assign:revealidentities',1,1363018092,0),(1001,1,3,'mod/autoview:canedit',1,1363018092,0),(1002,1,1,'mod/autoview:canedit',1,1363018092,0),(1003,1,3,'mod/autoview:canrecordflash',1,1363018092,0),(1004,1,1,'mod/autoview:canrecordflash',1,1363018092,0),(1005,1,3,'mod/autoview:canbroadcastflash',1,1363018092,0),(1006,1,1,'mod/autoview:canbroadcastflash',1,1363018092,0),(1007,1,3,'mod/autoview:canconvertdocument',1,1363018092,0),(1008,1,1,'mod/autoview:canconvertdocument',1,1363018092,0),(1009,1,6,'mod/autoview:viewpresentation',1,1363018092,0),(1010,1,5,'mod/autoview:viewpresentation',1,1363018092,0),(1011,1,4,'mod/autoview:viewpresentation',1,1363018092,0),(1012,1,3,'mod/autoview:viewpresentation',1,1363018092,0),(1013,1,1,'mod/autoview:viewpresentation',1,1363018092,0),(1014,1,1,'mod/data:exportuserinfo',1,1363018092,0),(1015,1,4,'mod/data:exportuserinfo',1,1363018092,0),(1016,1,3,'mod/data:exportuserinfo',1,1363018092,0),(1017,1,1,'enrol/payanyway:config',1,1363018095,0),(1018,1,1,'enrol/payanyway:manage',1,1363018095,0),(1019,1,3,'enrol/payanyway:manage',1,1363018095,0),(1020,1,1,'enrol/payanyway:unenrol',1,1363018095,0),(1021,1,3,'block/activity_modules:addinstance',1,1363018095,0),(1022,1,1,'block/activity_modules:addinstance',1,1363018095,0),(1023,1,7,'block/admin_bookmarks:myaddinstance',1,1363018095,0),(1024,1,3,'block/admin_bookmarks:addinstance',1,1363018095,0),(1025,1,1,'block/admin_bookmarks:addinstance',1,1363018095,0),(1026,1,3,'block/blog_menu:addinstance',1,1363018096,0),(1027,1,1,'block/blog_menu:addinstance',1,1363018096,0),(1028,1,3,'block/blog_recent:addinstance',1,1363018096,0),(1029,1,1,'block/blog_recent:addinstance',1,1363018096,0),(1030,1,3,'block/blog_tags:addinstance',1,1363018096,0),(1031,1,1,'block/blog_tags:addinstance',1,1363018096,0),(1032,1,7,'block/calendar_month:myaddinstance',1,1363018096,0),(1033,1,3,'block/calendar_month:addinstance',1,1363018096,0),(1034,1,1,'block/calendar_month:addinstance',1,1363018096,0),(1035,1,7,'block/calendar_upcoming:myaddinstance',1,1363018096,0),(1036,1,3,'block/calendar_upcoming:addinstance',1,1363018096,0),(1037,1,1,'block/calendar_upcoming:addinstance',1,1363018096,0),(1038,1,7,'block/comments:myaddinstance',1,1363018096,0),(1039,1,3,'block/comments:addinstance',1,1363018096,0),(1040,1,1,'block/comments:addinstance',1,1363018096,0),(1041,1,7,'block/community:myaddinstance',1,1363018096,0),(1042,1,3,'block/community:addinstance',1,1363018096,0),(1043,1,1,'block/community:addinstance',1,1363018096,0),(1044,1,3,'block/completionstatus:addinstance',1,1363018096,0),(1045,1,1,'block/completionstatus:addinstance',1,1363018096,0),(1046,1,7,'block/course_list:myaddinstance',1,1363018096,0),(1047,1,3,'block/course_list:addinstance',1,1363018096,0),(1048,1,1,'block/course_list:addinstance',1,1363018096,0),(1049,1,7,'block/course_overview:myaddinstance',1,1363018096,0),(1050,1,3,'block/course_summary:addinstance',1,1363018096,0),(1051,1,1,'block/course_summary:addinstance',1,1363018096,0),(1052,1,3,'block/feedback:addinstance',1,1363018096,0),(1053,1,1,'block/feedback:addinstance',1,1363018096,0),(1054,1,3,'block/glossary_random:addinstance',1,1363018096,0),(1055,1,1,'block/glossary_random:addinstance',1,1363018096,0),(1056,1,7,'block/html:myaddinstance',1,1363018096,0),(1057,1,3,'block/html:addinstance',1,1363018096,0),(1058,1,1,'block/html:addinstance',1,1363018096,0),(1059,1,3,'block/login:addinstance',1,1363018096,0),(1060,1,1,'block/login:addinstance',1,1363018096,0),(1061,1,3,'block/mentees:addinstance',1,1363018096,0),(1062,1,1,'block/mentees:addinstance',1,1363018096,0),(1063,1,7,'block/messages:myaddinstance',1,1363018096,0),(1064,1,3,'block/messages:addinstance',1,1363018096,0),(1065,1,1,'block/messages:addinstance',1,1363018096,0),(1066,1,7,'block/mnet_hosts:myaddinstance',1,1363018096,0),(1067,1,3,'block/mnet_hosts:addinstance',1,1363018096,0),(1068,1,1,'block/mnet_hosts:addinstance',1,1363018096,0),(1069,1,7,'block/myprofile:myaddinstance',1,1363018096,0),(1070,1,3,'block/myprofile:addinstance',1,1363018096,0),(1071,1,1,'block/myprofile:addinstance',1,1363018096,0),(1072,1,7,'block/navigation:myaddinstance',1,1363018097,0),(1073,1,3,'block/navigation:addinstance',1,1363018097,0),(1074,1,1,'block/navigation:addinstance',1,1363018097,0),(1075,1,3,'block/news_items:addinstance',1,1363018097,0),(1076,1,1,'block/news_items:addinstance',1,1363018097,0),(1077,1,3,'block/online_users:addinstance',1,1363018097,0),(1078,1,1,'block/online_users:addinstance',1,1363018097,0),(1079,1,3,'block/participants:addinstance',1,1363018097,0),(1080,1,1,'block/participants:addinstance',1,1363018097,0),(1081,1,7,'block/private_files:myaddinstance',1,1363018097,0),(1082,1,3,'block/private_files:addinstance',1,1363018097,0),(1083,1,1,'block/private_files:addinstance',1,1363018097,0),(1084,1,3,'block/quiz_results:addinstance',1,1363018097,0),(1085,1,1,'block/quiz_results:addinstance',1,1363018097,0),(1086,1,3,'block/recent_activity:addinstance',1,1363018097,0),(1087,1,1,'block/recent_activity:addinstance',1,1363018097,0),(1088,1,7,'block/rss_client:myaddinstance',1,1363018097,0),(1089,1,3,'block/rss_client:addinstance',1,1363018097,0),(1090,1,1,'block/rss_client:addinstance',1,1363018097,0),(1091,1,3,'block/search_forums:addinstance',1,1363018097,0),(1092,1,1,'block/search_forums:addinstance',1,1363018097,0),(1093,1,3,'block/section_links:addinstance',1,1363018097,0),(1094,1,1,'block/section_links:addinstance',1,1363018097,0),(1095,1,3,'block/selfcompletion:addinstance',1,1363018097,0),(1096,1,1,'block/selfcompletion:addinstance',1,1363018097,0),(1097,1,7,'block/settings:myaddinstance',1,1363018097,0),(1098,1,3,'block/settings:addinstance',1,1363018097,0),(1099,1,1,'block/settings:addinstance',1,1363018097,0),(1100,1,3,'block/site_main_menu:addinstance',1,1363018097,0),(1101,1,1,'block/site_main_menu:addinstance',1,1363018097,0),(1102,1,3,'block/social_activities:addinstance',1,1363018097,0),(1103,1,1,'block/social_activities:addinstance',1,1363018097,0),(1104,1,3,'block/tag_flickr:addinstance',1,1363018098,0),(1105,1,1,'block/tag_flickr:addinstance',1,1363018098,0),(1106,1,3,'block/tag_youtube:addinstance',1,1363018098,0),(1107,1,1,'block/tag_youtube:addinstance',1,1363018098,0),(1108,1,7,'block/tags:myaddinstance',1,1363018098,0),(1109,1,3,'block/tags:addinstance',1,1363018098,0),(1110,1,1,'block/tags:addinstance',1,1363018098,0),(1111,1,7,'repository/coursefilearea:view',1,1363018100,0);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_context_levels`
--

DROP TABLE IF EXISTS `mdl_role_context_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_context_levels`
--

LOCK TABLES `mdl_role_context_levels` WRITE;
/*!40000 ALTER TABLE `mdl_role_context_levels` DISABLE KEYS */;
INSERT INTO `mdl_role_context_levels` VALUES (1,1,10),(4,2,10),(2,1,40),(5,2,40),(3,1,50),(6,3,50),(8,4,50),(10,5,50),(7,3,70),(9,4,70),(11,5,70);
/*!40000 ALTER TABLE `mdl_role_context_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_names`
--

LOCK TABLES `mdl_role_names` WRITE;
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_sortorder`
--

LOCK TABLES `mdl_role_sortorder` WRITE;
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale`
--

LOCK TABLES `mdl_scale` WRITE;
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale_history`
--

LOCK TABLES `mdl_scale_history` WRITE;
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm`
--

LOCK TABLES `mdl_scorm` WRITE;
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_aicc_session`
--

DROP TABLE IF EXISTS `mdl_scorm_aicc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_aicc_session`
--

LOCK TABLES `mdl_scorm_aicc_session` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes`
--

LOCK TABLES `mdl_scorm_scoes` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_data`
--

LOCK TABLES `mdl_scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_track`
--

LOCK TABLES `mdl_scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_mapinfo`
--

LOCK TABLES `mdl_scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_objective`
--

LOCK TABLES `mdl_scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprule`
--

LOCK TABLES `mdl_scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprulecond`
--

LOCK TABLES `mdl_scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rulecond`
--

LOCK TABLES `mdl_scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_ruleconds`
--

LOCK TABLES `mdl_scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sessions`
--

DROP TABLE IF EXISTS `mdl_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_sessions`
--

LOCK TABLES `mdl_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_sessions` DISABLE KEYS */;
INSERT INTO `mdl_sessions` VALUES (48,0,'889u18eglr00og9qi5h11c1jd0',0,'RDZScVVUSWhZeF93SndkTUhNYk9iZVpzZklUcXl3QXhpU1d1ZFIweXFKSHZPOUhGT08xd2FiODkzYm4xTFRTOEQxYjF5Qmg0a1ltci0yNHMtN1V2WUhaRkNXa1VBTXVNZnNkUm15S1FaLWlvVndNYndhWmJudEwwUlFuTXRlUUdjSDdWczhHLUotTk1BQnJvVzBOM3lIMzY2eTlkMTl6VDRDc25XdXNYM3R4bGJyNXF3R0V0bGNBZlpFTVNCWmV5Z3hJdzV2RjRhZFJhNnQyOVcwbnVubzNIMU5oT0xYZUdqUmMtZDNwSkN4RkJHUnlGLThTZjBGOFFCNVc4ZHFBVlFvV0JRLVJkczhoVTB4Rmlndl91dXpNTkpjZzZWN1dzSk1CeVB5c0poU2JXaEh0Y2Y3Q2JQT1RlVkxNOERqcUpnLVY4WklQMTFKdWhrbGI3Z1hFSjBNVzJsSTlVZk80SUdnZ29vWE1uMmd3UHZQd1VlQkdXNHFNQVF5aW9UV3pyTmp2WjBBX1V2aHlvWWhkaF9ZSWJSaGJnckxxc2oxaXA1UkxuUmJRYTJYTjloQVFEZmt1NmtZZmxFVktWR2N3X0M3X2FjZkFEbFdnUTlFOTFYbG9hV1NWQ25LZVJHeko4V3hSNGhNazU4cF9rRGY1UVczWi1aMnFBOElxVU9sVHJwMld4WWwwUm00OXRzbkRuTEFkLVFiRzJEYXpGV3FUR2s5UG5HRkd6S2ZhbVFIWmRfYWRwQ1pLU2RHODdDaDR1Z084MzlXbWkzMHRWZ1dkTzl5enpIX3ZfWXdTVGx2YklCYkk3a2IyS1hxU2hOWkVPY3FNQWVWWHBDX19VV0dfQ2VzWHU2SVBWN2NkZEp0MVZLZ2s2NlNZUDFZRHpWN19mMVo3djZHeks3SWFaQ2Q5MWNBNWlNMEdKdDFTUEZhc1dfbDVHODNtUzcyTzhOaUlqZ0dnYzF6UlFQQlhyZnJBY0lkRjRrSWRJX1V2MHdCclFVXzEwZEN2MExUd05fN3h6d19mWDlOY0Y0ZnpDSFdWVDRGM2wxWlJ3eTlGUGFQZmd3MHJIR0RvcTBwXzFMNWR2ekJnY0lwN0R5dWQ0aW5TSG04LXp1cGdqSjlYTmt0T1dyUmYtellKeXhlNWg3aEJfSExNUlZNbGtFR3RiYXdHMWJRaWpNZllCX0ZrZmRicFVNVGJkM3BWeEdUZk1nMng3cVNzbDJ3Rk9USVhhRjZmak03QnZFVkxLcXpoVUd0SUZhQy1uUUFyVE43UGRLODFsZV96WlAyS3B3RElIZm9Gb0ljN3Btb1dVYnFHQ2MtcW5udmVqd1ZVbUMxUmk5WmFvVXhINXJhTFZLazlzWDJIWXlDd1k4b0ZjNU1KMXJSd2owaUtwbTdXSkJPYWVFX2JmS3A1WTBrdTdmdzFnbVdqV2hPN1JDdEtrSTNBdkxnYUpYa1hNR2FuV2dPT3NJQTQ2U1ozWjB2alEyUTVoeXdNcnZ4VkxVdkVSWG5xZHJuRHdmekVtSVhFSGtCZ0sxdjVDSGNONXBBM2NOUGpVeHloYlNhcF83REpTRUoza2kwZm93eFZpNnlMd2d0NGw0R0hYRTNROHBlZDRQZEtqZWtYRVNEOGNFV3B5ejIyOERKQUVPLVRSSkxtblJzSFp0OGk1UHY4SHRNbVVDSlVFZHdFQVJHcXByeWVaWjZXUkQyYXNHM3ZMNHl0ZEVsdHVqWGxXaWxmMmdIN1ZzU0tmVHY3b2hTTkwxQV9MZnc4cTlab1V2Sm91UlBzNnVWMlRmd2g0NkRhMXV6WDYxMWhHcFN2T1NQZjY5VmlOcHB2SzFPYVo2RHRkNVg1N3hoYTdqRVRDQUVUR2ozVlhmemd3b2VvOVN0NEVmeFUtSjh0eHh6eVBLSUU5ZGI5Sko0UG55cTBVZVhOMEFpaS0wZ1FKOEtJY3Q2VGJsT2pfS2lqZVB5Y0YwTHRHQWl3b3kyWklob21qcG9ORG1oWThrSHh3OXJLQ2o3aHJISjVqNi1jc09pN2lhcXRLZHhucXpaOTJodzEzT0ptVzEydUpJZ0NBMEQzeExjbm5keVpXajFuT2hDeFI2Y0FsUF9ac1Y5bVNheTBpRGVvZHItWHZ4dEJlYXE0WWg4TUxPUGJ3dWxxQjUyV0h2YjRJTVZDcndPRUN0Q0k2Mk1zVXprX3RjazVWMXYtSTlZWUNabkxrRmxYRno0NDRPamRfZXRqVkNaQy1pMmE1T1lKUXg3TTZFMmZwWTBQNXRVZ0RMTW5ybWVENzBKWUE4QTVGd3o3XzBtTXhBb0hxWW9FNHZGc1pieWVndHVDcFZBQlRTMk5GU1BEZVpQS2h2OTVyUWRMTzlpSHEtS3ozYUVOb2JhYzFqRDA1aDFYam0wdzI3SkZtVzBMak9JWi1KNVJjTngwLUhpSmxITHhYSk15SDFEeGZCaE5QeXlXOWY0M3EtMFhOVkJTa0c5eFRKellDQWQ4TVozSkRNRW4wNjdOWU5xQmF3Si1seTdvLTdPV243VGt1Y0lsQU55a180ajZEWVRWaUJ0ME5aOUNmd2JrejFIMlVLQkt0LUFydWxVUlROZUZNWngxVlJqakZfSDlGczNVU3pWTHVHODRCVlBab2lQVWtlVVZFT04ybTQ3TGZLa19VSmJaSldmeWFhTFZPV0x5dGlMdXZraEp2VVp2NnBxcF9qS3hRWG1sSTJoVnZBdEpRbzlja25HRElMUTZsQk03OExnYUdZaGh4bkZlNkRwZWx0M1p1MjdEeGpWT2drX1ZBYnJpS0VXVTlNbk1rV3Vvd3Vyb3A1NUNPamw4T1E1ck5nUVc5a3lXM3dOTW92QS4u',1363678794,1363678795,'10.7.0.234','10.7.0.234'),(49,0,'a1amp3rvhil2vt49smndoebkl2',0,'SG5BaVJQT1VmTWZJMmJnZEJ4WVlERkVpc3lDbVI1LU9zVVFPTVlESzczZHpVdGhqRHA0djVDeWdVNG1MRHNmTW5WaXMtaURFUDg0UV9RQTd3RlVpeERlTjFHSkVUdVVkWTNTMzlNczNqaFZ4UzR6bE1hSWl2b3Y5eDEzS1J1SkQ4S1ozXzNtM3VDZkpZWlphZ29HMVpLSVFuUEJPRkRUTWlkTldmbWtQdEJEa1lnTS11YWxLNGNaQ0tLWjhhUk5LRWRmWEV3cFVNVUJfejg1TldxLXdnSGpEdHNXSWJfZEhaWjZLc2pJOXltTkNDSDB1eEY5cG5FX01EaGVRbHItc1BVVnB2bFROd19SQzZiNW1UX3pnMEstaFVGUU5XQTZSZ0Z5bWdRRmtYR0RSTy1IMWExLVJxdFZtTzdSQ2lFYkZVRlNUaEVXUzRFcXlYWF85aVp5YTVKdFptSjMwa2VOd0ZwOF9GVUZSb2JCUzhjaVNERnhKaHBCVFlodjlrVVdzcURIZFktMjhKUTlTT2MzUVJKRDhLQUpCUGU5WDB6b0cyRXQyU3BTZUk5VTFhQ1JUM0RuNlpUNTlJVjFfLXJBdElab28zWEoxN2ZSZEhvZnFLbjRJc2VUdDMzQ2Y0d2JuOU9sVWk5V2Z2OVZwNWRibk1jTEtIOU5CQ2ppb242THBVQ2h5Njd6SmFlOVFYdnJPMjVRZjlXVTVWSWxsS0Nsa3IwWXFaT01VM1ktSklyVzc4UVJTNWt2TFpZbnltTkpWeUlNdFB5aFhzOG5KcTBzWDBfeUZJdEZmZXhkdUlpS0VLNEJLZkdRNEpDMzlNNDNfZFJtU2hyZ2V3TWtOazVrRG1UNFBoMmRqczlBZ3pkTlpEMjNOMmRLUUkyd3lKbTVaZWl1MUdhXzNteVlwZHpzM3VheEdBSy16TzNyeWJhQ2J3QWFhMXhvdjVua1pfQTd1OW43bnF5enZhQjBHYnZkRVRmV0pCQ2FabEp3NDRlQ2E4dkMwdkNCdUxuUnRiSkZMMExNaHFqc2Iza0k4cklVRE9KZHRsaWRfLXhHQkkweGQwYUpoVUkyLVNSN0hXMi1rV20tMmxZYTEyckF3Yk9RQ2xUb25VMWFFXzA2bUMtcENXd1pZVTEyNEtJQndsODBpdjE0RUgzX1FVTnlXcGo4c1AtY2ExdUJHQ3VtbThQVUJMejRObXRSa3NWdjhTTnF1UThWTElKRXRZWWprYnk0amxHN0oxNWVaZHVJT2ZpS0wwUWJFZm5ncVBnQWlUWThvd01JNHF3OU1BUWNMOUlYUHVUOFowNjkzSHVDR3JSdHNfaXRxREVQaVJGU0sxaEVUSDZvQjAxVE5KWk1VMVc3am1XSVh5NXBoSXZ3SzlxajFadE1kMzRRbTlRYS1VanZTbzhJWG10RUlEeEFNTGM5ZmprZGpacXZXTDlyRXNkaEEyazQ2eUJYWjdOcmpjZnhQTnJGMl9pb1BDSXJ4SGxhUW13UU5od2RDNjVKelVBa3JnWGt0ZjNQWkRYZlN4eGp3aUV2Q0JqUDgzSGM3VkJhaERIdUFKbDZ0RmstN1dfalltSl9IUkVUdG15bkJ0ZEE5M0VDZ214c3NXSGJfbVFMVzJoSDJwSXpublpaS2RIWGZHTS16UDZDQ2ZxUGd1U0gydlJMZWY0MjE3dGNwbWJONXN4VmtWRGlqTWVmWjVtYXZ6RVhhaHJmSXVGN3owWGdJdE5JbHhaUkxHVk11T05KTmVoVjBDaDRCUkl4MmZDNlg1TWY5WEpNTW1HOGg5S3Z5U3lpMUFwOTUyYUFSSEVtUHlBOWNmT3BWVmlNRlY4b2FVRVpkSEVMMUNUWWViLXBIYjFhVDRuTzJKaE1QLVZWQVB1bGh3SkZsMHFhbDYyR1ZwUEFKS3MwMzFqVDV0SjNJdEtpMjRkNVNZNFF4NWZyT1ZSRlRJV2NrMmFONG1UcGRpOXM5bF9WN1dwUjRrOExBYXlHZjMyQVFWQ3VFODJISEMzcnZLNmZGLTRPcWFZVWFydEtrWU16a0tFNFlsT3lOU21yeUJBRGRtZVVfLUM0TFJ6cjhaRHFyZVBHTTEwbzhFVVdLT0tIUXlRYUpsVU5rZ09fZkN5MmplQktBd0hEZ3V2VzQ1MXc1ay04X3ZrMVYtQS1lRHdvOWVrVl9LaFBoQVNSb2ZQNHNMclBxNzB6OVN3eFpQckIzM09mUzZiWUUzZVp6Z05zOTdSZVRxSmZFOXVrdTZlWGh3QzNCOTV6WkZncHFEejJUS2U1LVRWWDA0VGNlaDFwbzVkT2RMdTRDWEhPdm0zTThOeEJ5Wjh1VTJPeUxvaHpYYzdUTUFMTXdJdHpmemdVWG0zZ2lWMjJLQXBiaWgyZXB1QXNDVTQ3bWxpRllWQWVObHBZZnh5c3gySHBwa3ZVejNrNTc3b2RPckhUTVl4UE5na1N0dlp5eFZ4UDBtdHBHajM1SS1JZkptWHVfTExoeGRWb05hZFBLRzhZaXBWTmladzdNMkxwY2c4SDUtZkRIOFcyOHdnWmdRZ0Iwd0ZZUkR6SzJxaGEtYklKYmduMFA5eXFhTFJROEdYczJSSHNHMmVOcFh5V1BJVlpZcHR2ZWRoYkUtR3ViRHF6OUVYOHg4NmF6dUtTbkI3aXJWbmhOZHhsR25tcG1wSFFWTTM1MVFrY3VyR2ZUSmJxUlE3SXhlMHZOcGViMU9SWmJPT2R5LUlWUnc2S2ZPTlo5cWlUMXptYUllNFU4aDBSYjJteEJweHg1OTd3TVhSVU0temQtVmNCZENZekpYMUlWSVg2ajNicUZDNTlFUXZQYzJqUEdZc0FNM1RsQXJOSGRiQWtGZ01DNFRROXVMUGg3LWc0NmhlZy4=',1363681269,1363681367,'10.7.0.48','10.7.0.48'),(51,0,'4bkld3e52851m60k5pqviefeh4',2,'VkJDTk9aRlEtVWljZ252dUJwRzU4eGlsdjY1UGVJVzJQRndwY0hFbjNiZmlvTm5ZVldnUFJqS3h2bHZQaklONjJmTW90UTc0dm9GNFRnUzZLRGtpMlYxUjZmOGVIdDNqWmdZcVQ5czlPMXlFaGFBMGMycFFEMms4YzNIelY5Q0Nmb2hFb0pCMGtNTWZ1OUNoU1k0SVFMT2hrSW1iSGZVRFdEMGdCUkhoZVZTaWhoUDE5WERhZm01dXNXSVYxOGk1Yi1Ub1ZMQVl3djhfNk9BMlBseG9veHVvRmpTWmt0dHp6OERxU1JXSC1uaVJjVFM1eXltc3doOENNOU5QVS1kMzAtUld4ZV9FSDdjS1JBWlB6dVZoTFlkRXJnck5EQ1Z1UTdRaUd6RzVzWU9RemNmdE5ha3h2LWNid1NDNll0VHlwTU1pZm05R3JkTlQwVDd2ZUh5NjdvZDNfRl9IYlNCSUp0aS1rdkI4SERLdUlLN1RvRk5XdGFENnRyaUpyZS1zb1VpMHZfYjZGQ0dmOTEwX3FVby0zblRmMlZxV2Nid1FwcnFaVXhuaklSSFlBUVlXUnVHRGpXRTdkV1V1X2pDZjBiQjJVRkstUnhqTlk1QTFFaGlaSTA0dkNsWEltS1FmLTlzQkoxcTlNWU8tckplR2NwckN1T29FQ25Kekt4U0FFTUNmRndhVHV6cDZIeHNHaUFpb3k1RHdRVi1LeEFoZDhBTHRhdlQwalZnbHZSZ2dXMGhMTkVRbUd3aDNfZDNQWkxScTVlT0FZZldFVzNHXzRMZ1RPd3B2a0FvN3p3UVVtU0R3RUZyMEhoWDJFd2ZfTGhMdWg1R1owYURkblJmSWhYMjl1TjdESG9YUUh0VWlGVHFTRXZNaV8yT1Z4b2xpNWExdEFLOFBsWGlmOUQ2WEU2S1N2QVFfa0luaGFaQ0FDWG1TelUzZVpFM1plem80dVhYSTJYb21Ib2Z5X2M4Q2JNYzhlV1pUOFJ2aXpwbDVoRm9fdE83eTVUVUlld1hnd2ZXLTlCdXhiWGM5TUNIYlFEaFVxTVdxZm5qcjFlV1JxcDlRZHBTaGl0ZGFfS0RGZkRtWHY5Yi0xenRxYm1nUG4xbjBteldDVmh3aVpTc0NaMFllclEwdERkbE9pT2wzQmNaeGw2cHpBZXpzdGV0amwyWGgwMVJHTElRQzVQekJOOFk0dEk5YzZkTnVmMlZhZV96SUo1Zmk4dzRYcEtYNldYV2U5OF9NWUhza285WVRwYnpRdklGb2ItUHRPUUVCUHNhU3R1RE9PQl9DU05uakNRNEM2RWVHMWNhSVR2aExqXy1TUUVoRTQzRVIzVHVjYV9ac2FhX3F2WXcxRDJZVXhJSU9KVUQ5R3AwODZGRmh6ZjdFbWhkLTIzeE1PeTQ0MVVNU1RJNEdvbnhPdFJuaS1zXzdOQXZEd3lUeUVzNlV0YlBaMURrVEpjWmJmcV9vUGpZYzBtc3EyWFBqMDEzU1pIQnpEajBIY2JiZFR1ejBSTGk2TjMxREFyYXBHQlBMbXVZTFFURk5vdTAzY3pMWkhKbUFUVVBQNGlfUEhPMllCejh3anROVXBNSFVyWHdhZHRiWU1PNmRQUFhUSFdVVzNfZU83a3FaZ2xaREZwUU4yT2NYanpNNVNvOXFhWXFVZUxmWEdZXzBZMmdWbzhRbFozZmhUMTBnLWFpVTdJU2s2TnRDeFc1MTNOakpUWEJCbndFREZaRjVNa0VPXzZ0MTFKNmZQS01BNVdYTDQ1Tm1JZmx4Wk5lMHR1TXFuRGdNVFhHcGZXWnRmanJWbTg5SVRkaTNOamF1bERObmlOZDRrcUxwbVcyVEk5djQ5cGJTdEVYclpCVTN1MXU3UHVXSVpkYlBtRXpHN2d6SlZrTG1QcEtUTGdha0FBLV9yNHNpaDFmVXQxWmlPcDdWU3ZQQ1RKWk1BakJ3SWZHMWozdTdYSFFPV20xX2ZVcEpXMXlHQUNsYTVOSEF0VFRpR1F1OUk5RDJ0WUtuT2lnWlRKTG9ZUlkwRmx4T2E3VkNvRFRpTDlYbU5KVE9vS3dJMmVRSTJpaTVOdUdxYTNDSXVlb1VEdTVJU3RHUXRKcGZCUHo1RkFUNkhZQmh1OUFDQThlU2ZyMzdKYmpkYnVlZ21ISW4xZXYwTFozVTg1M3dpR252V1BmYWg1M3loazNoSk5wZGdhdUdhNWFmQkxYYlpTdzdrSDBpNWxPeHJGcnNSanllazFKUjFreU5vNE1Eeks1QS1DTVdGVWVaMHZWRUNXc1ZrRjBPQ0lDWXA4TWpZcDVqcU9YMXFRdDFzLVMwRnFZeDFxR0xZd1M1M2JncGpKLWRxbTRuc1J2TzhiX0hYTkRHdXlSWWFLMHZZVXNmVXVNS0EzNmtnTGc2UmVJZ2tKZ2tSZzNuYk00ejZycHdZTHVocVMycGtON0lyZzA0TUNGMm5kMjRlcFRHdk9qTFVBVmF1WmlIUXVZZmgzVmdCd3hCR0kxbEdFUTFLd2x4LUxJM1hfM1BaY3E0YXJzMjRzUS0yNlpCbklKMlZCaGNUelEyR2MwRFB3NlI0M0JoMmZydlNReWtZQzd5Ym5xNmthZGp5X0p1ajk5TmpLOUtkRU55TVY1YVYyNE1oQkZhd2dQUXNZMWZxNzRJVEl4M2RZclpBeHZ5MXRyWXNmWTVQMkpHVWJjdTZlRlBxQXJqQU5KaThRZ1RlOWpLSFpjaFUxMDJ0Nk1ocFRlOFJHbXR5aTN6VnE5Y1FKczdrdHlkV01jQ0VMRW1QRkdzRWZsaG5pUXZCd3RRQUVfc0dMZHQ4bnZoQlNtbjBOQzhMV1E4cWxINGdJMnl3Wm5QcnVUaVZ0T0t0UFhubGVoQjRRRVVST3NWajBlRE1nUG5NVVJINjlLR0szNGwyTXNXc042a2c5ZXltSnBUcXFVWmcwdkRuWlZjVXVJTVZldUxTNUJVY0ZHSF9nSkRYSU9CSTlnekZabGs2VWZqa1FHRE5sRkdhQXVBbW44TGt3MVVuY2RUU1Vxb0hXX0xqZXNBMkJZVlhGa2V2RlB1Q3lWLTBIenFhRWVPcjNtRlhUZ0hyNGFhOWhTdldEd1JXSVVoS3BJcnpYYTFQSmx6ekMxU3BPZFNhVUFVN1RFejFDdXlTTGRUdG9YOEF5NnpReHhtdmdJandhU21GbjBOdlZscjdSWm1XelR3dC1XWWI3Z1NnT1dUYWNqUTdvQ2NuaGIzZERNUVI5cDl2QTIwM0tSbmtxbHdrSGVRbzV3WWlSajJVVFZ6WTN3b0lMdUxYQXVKbWR0aTd6eWZmZXhTQTg0WXNPdThWSWxsZXJ4S0tvNndnaUZLSUV0c1VCMnJ6b01BQ1F5NGZncXU3OER5eFZUeG84SnBaVEdSNE9OakZEelZfTEdTU2J1N1RhS2Nuck9VT0dsYW5JbWtsekdfVGo2dWswUVp4VjFwNk4zX0FRWDhxT0dVSkduTzVaQ2pxaXlsSHh0VXc0Qm9scEZRR1BDNjZwWVU2b2JHN0RDV1M0eEJSNFlYckJiWWl3VHd4M0ZtVkN6NURaU1hlckNxa2kxOEZ6cGt2MUp3elB4N0ZianF2RlZlOWJIU2xGNTdMbzFoZFpTZ1RhVE10a18xdTlOUlgzUDhTaHI5dVYzUDZuX2NZUlp0aWx0UFZiMUJwaWlmVVpwRjh5bHJpYk5NeUJJd3BsX0ZXRWs0X2E3TEN6dzY0Unptc3hTa1NySFJFYi00X0lMYTJpZFk3ei1mYnJkVHNEOUxmckt3bDRvYnM1NTBVMGNOWVNPblN4N1dBVS12alhnTWZCdnhSYlA1SFBHSXZxYkRWNjJqTWxpS1owLVlHVk9UV3JmMW43UXlVbWlyS2IwUXZ3MEFHS1RzT1BrNmhkdF80dlVtalFFNFlxQ2p4MExwaHVoc3BYQl9OOTRZZ05hYXYyNW56VTIwRG1XSGlLSkF2Z1FZbDBJalNjVVRkNHlPQllLVHlxYl9PbHFzQ3BmNVpKcDc0R0VuUUkzRVNURnFiTVM5SFQ2emo0VC05blh4eU5IbzdxQ3poTFZtNmpoUWFsTDFYQjBmaW5EUVNJMnBLblIydmJtNkdyVm43RVZ0Vnp0OFJnVVd5aFlXMVVib2pjUTczQ19oemQ1RUtSZHhVZG9zOWFyekxWbUpNNDZHdDFiRVJTQUVGYi10VlZtb2FnUmFMYTMxYng3T05WTUZpcGgtZTdtR2dOYVFpSHdEbl9XRVRvZGNRVjlPUmxsUU92MkZYNTlhODZQS2Ytc0pYalFUUlVvZXlKNVZSUEZnN1NUVDl0QVY1SklfdXhPdHJvYjgxLWFMbWNEM2Z1ekJ1VnBnbElzdkt0RTJhU3NWb0FrbFZBNVJUSWZLTjc5V283NTBnZE8ycmRENkR5dndfdHVYYy0yUXlUQkI3eDdYS29PeWRnWmh0SXI0LVh5UnlqeGZ5UjE4akZzbE5iSHdHRjhXMHFzbVB5WUg0WUczNFdHaWdoRFVfTzMwUlRQUXBTQzFsWExPNU1kNGdIQ1VNdFNIekFxUHVOWGhQLU9WZ0QyQWU3by14RkVYRERkUXoyX29tODFLUjMyYmZROVlsM0hoTnd5YTBBZHdBOFRpTGxBNHhSSVpxVkVpNjFWNE1zbE1WU0Y5YXB2VS13ZDFib19rREt4RjlJZnJmUkZUVVlaMnczdW1IVlBsQVJrUGg3dDc0b3pUTEFyU1lQOFozQnV4OTJBSGJ0MWR3cVEu',1363681475,1363682045,'10.7.0.48','10.7.0.48');
/*!40000 ALTER TABLE `mdl_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_daily`
--

LOCK TABLES `mdl_stats_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_monthly`
--

LOCK TABLES `mdl_stats_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_daily`
--

LOCK TABLES `mdl_stats_user_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_monthly`
--

LOCK TABLES `mdl_stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_weekly`
--

LOCK TABLES `mdl_stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_weekly`
--

LOCK TABLES `mdl_stats_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey`
--

LOCK TABLES `mdl_survey` WRITE;
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro',0,'25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro',0,'31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro',0,'37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro',0,'65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro',0,'69,70,71,72,73');
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_analysis`
--

LOCK TABLES `mdl_survey_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_answers`
--

LOCK TABLES `mdl_survey_answers` WRITE;
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_questions`
--

LOCK TABLES `mdl_survey_questions` WRITE;
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag`
--

LOCK TABLES `mdl_tag` WRITE;
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_correlation`
--

LOCK TABLES `mdl_tag_correlation` WRITE;
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_instance`
--

LOCK TABLES `mdl_tag_instance` WRITE;
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_temp_enroled_template`
--

DROP TABLE IF EXISTS `mdl_temp_enroled_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_temp_enroled_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tempenrotemp_use_ix` (`userid`),
  KEY `mdl_tempenrotemp_cou_ix` (`courseid`),
  KEY `mdl_tempenrotemp_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_temp_enroled_template`
--

LOCK TABLES `mdl_temp_enroled_template` WRITE;
/*!40000 ALTER TABLE `mdl_temp_enroled_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_temp_enroled_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_temp_log_template`
--

DROP TABLE IF EXISTS `mdl_temp_log_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_temp_log_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_templogtemp_act_ix` (`action`),
  KEY `mdl_templogtemp_cou_ix` (`course`),
  KEY `mdl_templogtemp_use_ix` (`userid`),
  KEY `mdl_templogtemp_usecouact_ix` (`userid`,`course`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_temp_log_template`
--

LOCK TABLES `mdl_temp_log_template` WRITE;
/*!40000 ALTER TABLE `mdl_temp_log_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_temp_log_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_timezone`
--

DROP TABLE IF EXISTS `mdl_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rules for calculating local wall clock time for users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_timezone`
--

LOCK TABLES `mdl_timezone` WRITE;
/*!40000 ALTER TABLE `mdl_timezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang`
--

DROP TABLE IF EXISTS `mdl_tool_customlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang`
--

LOCK TABLES `mdl_tool_customlang` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang_components`
--

DROP TABLE IF EXISTS `mdl_tool_customlang_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang_components`
--

LOCK TABLES `mdl_tool_customlang_components` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_upgrade_log`
--

DROP TABLE IF EXISTS `mdl_upgrade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1820 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_upgrade_log`
--

LOCK TABLES `mdl_upgrade_log` WRITE;
/*!40000 ALTER TABLE `mdl_upgrade_log` DISABLE KEYS */;
INSERT INTO `mdl_upgrade_log` VALUES (1,0,'core','2012062503','2012062503','Upgrade savepoint reached',NULL,'',0,1352713753),(2,0,'core','2012062503','2012062503','Core installed',NULL,'',0,1352713755),(3,0,'qtype_calculated',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(4,0,'qtype_calculated','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713755),(5,0,'qtype_calculated','2012061700','2012061700','Plugin installed',NULL,'',0,1352713755),(6,0,'qtype_calculatedmulti',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(7,0,'qtype_calculatedmulti','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713755),(8,0,'qtype_calculatedmulti','2012061700','2012061700','Plugin installed',NULL,'',0,1352713755),(9,0,'qtype_calculatedsimple',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(10,0,'qtype_calculatedsimple','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713755),(11,0,'qtype_calculatedsimple','2012061700','2012061700','Plugin installed',NULL,'',0,1352713755),(12,0,'qtype_description',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(13,0,'qtype_description','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713755),(14,0,'qtype_description','2012061700','2012061700','Plugin installed',NULL,'',0,1352713755),(15,0,'qtype_essay',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(16,0,'qtype_essay','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713755),(17,0,'qtype_essay','2012061700','2012061700','Plugin installed',NULL,'',0,1352713755),(18,0,'qtype_match',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(19,0,'qtype_match','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713755),(20,0,'qtype_match','2012061700','2012061700','Plugin installed',NULL,'',0,1352713755),(21,0,'qtype_missingtype',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(22,0,'qtype_missingtype','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713755),(23,0,'qtype_missingtype','2012061700','2012061700','Plugin installed',NULL,'',0,1352713755),(24,0,'qtype_multianswer',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713755),(25,0,'qtype_multianswer','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713756),(26,0,'qtype_multianswer','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(27,0,'qtype_multichoice',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713756),(28,0,'qtype_multichoice','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713756),(29,0,'qtype_multichoice','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(30,0,'qtype_numerical',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713756),(31,0,'qtype_numerical','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713756),(32,0,'qtype_numerical','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(33,0,'qtype_random',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713756),(34,0,'qtype_random','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713756),(35,0,'qtype_random','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(36,0,'qtype_randomsamatch',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713756),(37,0,'qtype_randomsamatch','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713756),(38,0,'qtype_randomsamatch','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(39,0,'qtype_shortanswer',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713756),(40,0,'qtype_shortanswer','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713756),(41,0,'qtype_shortanswer','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(42,0,'qtype_truefalse',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713756),(43,0,'qtype_truefalse','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713756),(44,0,'qtype_truefalse','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(45,0,'mod_assign',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713756),(46,0,'mod_assign','2012061700','2012061700','Plugin installed',NULL,'',0,1352713756),(47,0,'mod_assignment',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713756),(48,0,'mod_assignment','2012061701','2012061701','Plugin installed',NULL,'',0,1352713756),(49,0,'mod_book',NULL,'2012061710','Starting plugin installation',NULL,'',0,1352713756),(50,0,'mod_book','2012061710','2012061710','Plugin installed',NULL,'',0,1352713757),(51,0,'mod_chat',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713757),(52,0,'mod_chat','2012061700','2012061700','Plugin installed',NULL,'',0,1352713757),(53,0,'mod_choice',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713757),(54,0,'mod_choice','2012061700','2012061700','Plugin installed',NULL,'',0,1352713757),(55,0,'mod_data',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713757),(56,0,'mod_data','2012061700','2012061700','Plugin installed',NULL,'',0,1352713758),(57,0,'mod_feedback',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713758),(58,0,'mod_feedback','2012061700','2012061700','Plugin installed',NULL,'',0,1352713758),(59,0,'mod_folder',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713758),(60,0,'mod_folder','2012061700','2012061700','Plugin installed',NULL,'',0,1352713758),(61,0,'mod_forum',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713758),(62,0,'mod_forum','2012061701','2012061701','Plugin installed',NULL,'',0,1352713759),(63,0,'mod_glossary',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713759),(64,0,'mod_glossary','2012061700','2012061700','Plugin installed',NULL,'',0,1352713759),(65,0,'mod_imscp',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713759),(66,0,'mod_imscp','2012061700','2012061700','Plugin installed',NULL,'',0,1352713759),(67,0,'mod_label',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713759),(68,0,'mod_label','2012061700','2012061700','Plugin installed',NULL,'',0,1352713759),(69,0,'mod_lesson',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713759),(70,0,'mod_lesson','2012061701','2012061701','Plugin installed',NULL,'',0,1352713760),(71,0,'mod_lti',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713760),(72,0,'mod_lti','2012061700','2012061700','Plugin installed',NULL,'',0,1352713760),(73,0,'mod_page',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713760),(74,0,'mod_page','2012061700','2012061700','Plugin installed',NULL,'',0,1352713760),(75,0,'mod_quiz',NULL,'2012061703','Starting plugin installation',NULL,'',0,1352713760),(76,0,'mod_quiz','2012061703','2012061703','Plugin installed',NULL,'',0,1352713760),(77,0,'mod_resource',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713761),(78,0,'mod_resource','2012061700','2012061700','Plugin installed',NULL,'',0,1352713761),(79,0,'mod_scorm',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713761),(80,0,'mod_scorm','2012061701','2012061701','Plugin installed',NULL,'',0,1352713761),(81,0,'mod_survey',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713761),(82,0,'mod_survey','2012061700','2012061700','Plugin installed',NULL,'',0,1352713761),(83,0,'mod_url',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713762),(84,0,'mod_url','2012061700','2012061700','Plugin installed',NULL,'',0,1352713762),(85,0,'mod_wiki',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713762),(86,0,'mod_wiki','2012061701','2012061701','Plugin installed',NULL,'',0,1352713762),(87,0,'mod_workshop',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713762),(88,0,'mod_workshop','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(89,0,'auth_cas',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(90,0,'auth_cas','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(91,0,'auth_cas','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(92,0,'auth_db',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(93,0,'auth_db','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(94,0,'auth_db','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(95,0,'auth_email',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(96,0,'auth_email','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(97,0,'auth_email','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(98,0,'auth_fc',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(99,0,'auth_fc','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(100,0,'auth_fc','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(101,0,'auth_imap',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(102,0,'auth_imap','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(103,0,'auth_imap','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(104,0,'auth_ldap',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(105,0,'auth_ldap','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(106,0,'auth_ldap','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(107,0,'auth_manual',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(108,0,'auth_manual','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(109,0,'auth_manual','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(110,0,'auth_mnet',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(111,0,'auth_mnet','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(112,0,'auth_mnet','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(113,0,'auth_nntp',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(114,0,'auth_nntp','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(115,0,'auth_nntp','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(116,0,'auth_nologin',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(117,0,'auth_nologin','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(118,0,'auth_nologin','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(119,0,'auth_none',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(120,0,'auth_none','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(121,0,'auth_none','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(122,0,'auth_pam',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(123,0,'auth_pam','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(124,0,'auth_pam','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(125,0,'auth_pop3',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(126,0,'auth_pop3','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(127,0,'auth_pop3','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(128,0,'auth_radius',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(129,0,'auth_radius','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(130,0,'auth_radius','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(131,0,'auth_shibboleth',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(132,0,'auth_shibboleth','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(133,0,'auth_shibboleth','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(134,0,'auth_webservice',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(135,0,'auth_webservice','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713763),(136,0,'auth_webservice','2012061700','2012061700','Plugin installed',NULL,'',0,1352713763),(137,0,'enrol_authorize',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713763),(138,0,'enrol_authorize','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(139,0,'enrol_authorize','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(140,0,'enrol_category',NULL,'2012081800','Starting plugin installation',NULL,'',0,1352713764),(141,0,'enrol_category','2012081800','2012081800','Upgrade savepoint reached',NULL,'',0,1352713764),(142,0,'enrol_category','2012081800','2012081800','Plugin installed',NULL,'',0,1352713764),(143,0,'enrol_cohort',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(144,0,'enrol_cohort','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(145,0,'enrol_cohort','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(146,0,'enrol_database',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(147,0,'enrol_database','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(148,0,'enrol_database','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(149,0,'enrol_flatfile',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(150,0,'enrol_flatfile','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(151,0,'enrol_flatfile','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(152,0,'enrol_guest',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(153,0,'enrol_guest','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(154,0,'enrol_guest','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(155,0,'enrol_imsenterprise',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(156,0,'enrol_imsenterprise','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(157,0,'enrol_imsenterprise','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(158,0,'enrol_ldap',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(159,0,'enrol_ldap','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(160,0,'enrol_ldap','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(161,0,'enrol_manual',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(162,0,'enrol_manual','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(163,0,'enrol_manual','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(164,0,'enrol_meta',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(165,0,'enrol_meta','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(166,0,'enrol_meta','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(167,0,'enrol_mnet',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(168,0,'enrol_mnet','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(169,0,'enrol_mnet','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(170,0,'enrol_paypal',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713764),(171,0,'enrol_paypal','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713764),(172,0,'enrol_paypal','2012061700','2012061700','Plugin installed',NULL,'',0,1352713764),(173,0,'enrol_self',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(174,0,'enrol_self','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713765),(175,0,'enrol_self','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(176,0,'message_email',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(177,0,'message_email','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713765),(178,0,'message_email','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(179,0,'message_jabber',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(180,0,'message_jabber','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713765),(181,0,'message_jabber','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(182,0,'message_popup',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(183,0,'message_popup','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713765),(184,0,'message_popup','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(185,0,'block_activity_modules',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(186,0,'block_activity_modules','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(187,0,'block_admin_bookmarks',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(188,0,'block_admin_bookmarks','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(189,0,'block_blog_menu',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(190,0,'block_blog_menu','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(191,0,'block_blog_recent',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(192,0,'block_blog_recent','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(193,0,'block_blog_tags',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(194,0,'block_blog_tags','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(195,0,'block_calendar_month',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(196,0,'block_calendar_month','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(197,0,'block_calendar_upcoming',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(198,0,'block_calendar_upcoming','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(199,0,'block_comments',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(200,0,'block_comments','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(201,0,'block_community',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(202,0,'block_community','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(203,0,'block_completionstatus',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(204,0,'block_completionstatus','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(205,0,'block_course_list',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(206,0,'block_course_list','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(207,0,'block_course_overview',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(208,0,'block_course_overview','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(209,0,'block_course_summary',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(210,0,'block_course_summary','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(211,0,'block_feedback',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(212,0,'block_feedback','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(213,0,'block_glossary_random',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(214,0,'block_glossary_random','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(215,0,'block_html',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(216,0,'block_html','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(217,0,'block_login',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713765),(218,0,'block_login','2012061700','2012061700','Plugin installed',NULL,'',0,1352713765),(219,0,'block_mentees',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(220,0,'block_mentees','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(221,0,'block_messages',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(222,0,'block_messages','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(223,0,'block_mnet_hosts',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(224,0,'block_mnet_hosts','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(225,0,'block_myprofile',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(226,0,'block_myprofile','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(227,0,'block_navigation',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(228,0,'block_navigation','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(229,0,'block_news_items',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(230,0,'block_news_items','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(231,0,'block_online_users',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(232,0,'block_online_users','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(233,0,'block_participants',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(234,0,'block_participants','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(235,0,'block_private_files',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(236,0,'block_private_files','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(237,0,'block_quiz_results',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(238,0,'block_quiz_results','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(239,0,'block_recent_activity',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(240,0,'block_recent_activity','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(241,0,'block_rss_client',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(242,0,'block_rss_client','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(243,0,'block_search_forums',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(244,0,'block_search_forums','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(245,0,'block_section_links',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(246,0,'block_section_links','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(247,0,'block_selfcompletion',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(248,0,'block_selfcompletion','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(249,0,'block_settings',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(250,0,'block_settings','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(251,0,'block_site_main_menu',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(252,0,'block_site_main_menu','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(253,0,'block_social_activities',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(254,0,'block_social_activities','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(255,0,'block_tag_flickr',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(256,0,'block_tag_flickr','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(257,0,'block_tag_youtube',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(258,0,'block_tag_youtube','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(259,0,'block_tags',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(260,0,'block_tags','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(261,0,'filter_activitynames',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(262,0,'filter_activitynames','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713766),(263,0,'filter_activitynames','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(264,0,'filter_algebra',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(265,0,'filter_algebra','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713766),(266,0,'filter_algebra','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(267,0,'filter_censor',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(268,0,'filter_censor','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713766),(269,0,'filter_censor','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(270,0,'filter_data',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(271,0,'filter_data','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713766),(272,0,'filter_data','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(273,0,'filter_emailprotect',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(274,0,'filter_emailprotect','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713766),(275,0,'filter_emailprotect','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(276,0,'filter_emoticon',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713766),(277,0,'filter_emoticon','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713766),(278,0,'filter_emoticon','2012061700','2012061700','Plugin installed',NULL,'',0,1352713766),(279,0,'filter_glossary',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713766),(280,0,'filter_glossary','2012061701','2012061701','Upgrade savepoint reached',NULL,'',0,1352713766),(281,0,'filter_glossary','2012061701','2012061701','Plugin installed',NULL,'',0,1352713766),(282,0,'filter_mediaplugin',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(283,0,'filter_mediaplugin','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(284,0,'filter_mediaplugin','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(285,0,'filter_multilang',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(286,0,'filter_multilang','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(287,0,'filter_multilang','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(288,0,'filter_tex',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(289,0,'filter_tex','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(290,0,'filter_tex','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(291,0,'filter_tidy',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(292,0,'filter_tidy','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(293,0,'filter_tidy','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(294,0,'filter_urltolink',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(295,0,'filter_urltolink','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(296,0,'filter_urltolink','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(297,0,'editor_textarea',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(298,0,'editor_textarea','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(299,0,'editor_textarea','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(300,0,'editor_tinymce',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(301,0,'editor_tinymce','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(302,0,'editor_tinymce','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(303,0,'format_scorm',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(304,0,'format_scorm','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(305,0,'format_scorm','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(306,0,'format_social',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(307,0,'format_social','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(308,0,'format_social','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(309,0,'format_topics',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(310,0,'format_topics','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(311,0,'format_topics','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(312,0,'format_weeks',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(313,0,'format_weeks','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(314,0,'format_weeks','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(315,0,'profilefield_checkbox',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(316,0,'profilefield_checkbox','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(317,0,'profilefield_checkbox','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(318,0,'profilefield_datetime',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(319,0,'profilefield_datetime','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(320,0,'profilefield_datetime','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(321,0,'profilefield_menu',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(322,0,'profilefield_menu','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(323,0,'profilefield_menu','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(324,0,'profilefield_text',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(325,0,'profilefield_text','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(326,0,'profilefield_text','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(327,0,'profilefield_textarea',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(328,0,'profilefield_textarea','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(329,0,'profilefield_textarea','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(330,0,'report_backups',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(331,0,'report_backups','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(332,0,'report_backups','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(333,0,'report_completion',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(334,0,'report_completion','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(335,0,'report_completion','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(336,0,'report_configlog',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(337,0,'report_configlog','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(338,0,'report_configlog','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(339,0,'report_courseoverview',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(340,0,'report_courseoverview','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(341,0,'report_courseoverview','2012061700','2012061700','Plugin installed',NULL,'',0,1352713767),(342,0,'report_log',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713767),(343,0,'report_log','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713767),(344,0,'report_log','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(345,0,'report_loglive',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(346,0,'report_loglive','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(347,0,'report_loglive','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(348,0,'report_outline',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(349,0,'report_outline','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(350,0,'report_outline','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(351,0,'report_participation',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(352,0,'report_participation','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(353,0,'report_participation','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(354,0,'report_progress',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(355,0,'report_progress','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(356,0,'report_progress','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(357,0,'report_questioninstances',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(358,0,'report_questioninstances','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(359,0,'report_questioninstances','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(360,0,'report_security',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(361,0,'report_security','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(362,0,'report_security','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(363,0,'report_stats',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(364,0,'report_stats','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(365,0,'report_stats','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(366,0,'gradeexport_ods',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(367,0,'gradeexport_ods','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(368,0,'gradeexport_ods','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(369,0,'gradeexport_txt',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(370,0,'gradeexport_txt','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(371,0,'gradeexport_txt','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(372,0,'gradeexport_xls',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(373,0,'gradeexport_xls','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(374,0,'gradeexport_xls','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(375,0,'gradeexport_xml',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(376,0,'gradeexport_xml','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(377,0,'gradeexport_xml','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(378,0,'gradeimport_csv',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(379,0,'gradeimport_csv','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(380,0,'gradeimport_csv','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(381,0,'gradeimport_xml',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(382,0,'gradeimport_xml','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(383,0,'gradeimport_xml','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(384,0,'gradereport_grader',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(385,0,'gradereport_grader','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(386,0,'gradereport_grader','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(387,0,'gradereport_outcomes',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(388,0,'gradereport_outcomes','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(389,0,'gradereport_outcomes','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(390,0,'gradereport_overview',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(391,0,'gradereport_overview','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(392,0,'gradereport_overview','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(393,0,'gradereport_user',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(394,0,'gradereport_user','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713768),(395,0,'gradereport_user','2012061700','2012061700','Plugin installed',NULL,'',0,1352713768),(396,0,'gradingform_guide',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713768),(397,0,'gradingform_guide','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(398,0,'gradingform_guide','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(399,0,'gradingform_rubric',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(400,0,'gradingform_rubric','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(401,0,'gradingform_rubric','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(402,0,'mnetservice_enrol',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(403,0,'mnetservice_enrol','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(404,0,'mnetservice_enrol','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(405,0,'webservice_amf',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(406,0,'webservice_amf','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(407,0,'webservice_amf','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(408,0,'webservice_rest',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(409,0,'webservice_rest','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(410,0,'webservice_rest','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(411,0,'webservice_soap',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(412,0,'webservice_soap','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(413,0,'webservice_soap','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(414,0,'webservice_xmlrpc',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(415,0,'webservice_xmlrpc','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(416,0,'webservice_xmlrpc','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(417,0,'repository_alfresco',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(418,0,'repository_alfresco','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(419,0,'repository_alfresco','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(420,0,'repository_boxnet',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(421,0,'repository_boxnet','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(422,0,'repository_boxnet','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(423,0,'repository_coursefiles',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(424,0,'repository_coursefiles','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(425,0,'repository_coursefiles','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(426,0,'repository_dropbox',NULL,'2012080702','Starting plugin installation',NULL,'',0,1352713769),(427,0,'repository_dropbox','2012080702','2012080702','Upgrade savepoint reached',NULL,'',0,1352713769),(428,0,'repository_dropbox','2012080702','2012080702','Plugin installed',NULL,'',0,1352713769),(429,0,'repository_equella',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(430,0,'repository_equella','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(431,0,'repository_equella','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(432,0,'repository_filesystem',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(433,0,'repository_filesystem','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(434,0,'repository_filesystem','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(435,0,'repository_flickr',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(436,0,'repository_flickr','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(437,0,'repository_flickr','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(438,0,'repository_flickr_public',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(439,0,'repository_flickr_public','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(440,0,'repository_flickr_public','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(441,0,'repository_googledocs',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(442,0,'repository_googledocs','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(443,0,'repository_googledocs','2012061700','2012061700','Plugin installed',NULL,'',0,1352713769),(444,0,'repository_local',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713769),(445,0,'repository_local','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713769),(446,0,'repository_local','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(447,0,'repository_merlot',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(448,0,'repository_merlot','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(449,0,'repository_merlot','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(450,0,'repository_picasa',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(451,0,'repository_picasa','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(452,0,'repository_picasa','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(453,0,'repository_recent',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(454,0,'repository_recent','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(455,0,'repository_recent','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(456,0,'repository_s3',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(457,0,'repository_s3','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(458,0,'repository_s3','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(459,0,'repository_upload',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(460,0,'repository_upload','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(461,0,'repository_upload','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(462,0,'repository_url',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(463,0,'repository_url','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(464,0,'repository_url','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(465,0,'repository_user',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(466,0,'repository_user','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(467,0,'repository_user','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(468,0,'repository_webdav',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(469,0,'repository_webdav','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(470,0,'repository_webdav','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(471,0,'repository_wikimedia',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(472,0,'repository_wikimedia','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(473,0,'repository_wikimedia','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(474,0,'repository_youtube',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(475,0,'repository_youtube','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(476,0,'repository_youtube','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(477,0,'portfolio_boxnet',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(478,0,'portfolio_boxnet','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(479,0,'portfolio_boxnet','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(480,0,'portfolio_download',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(481,0,'portfolio_download','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(482,0,'portfolio_download','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(483,0,'portfolio_flickr',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(484,0,'portfolio_flickr','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(485,0,'portfolio_flickr','2012061700','2012061700','Plugin installed',NULL,'',0,1352713770),(486,0,'portfolio_googledocs',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713770),(487,0,'portfolio_googledocs','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713770),(488,0,'portfolio_googledocs','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(489,0,'portfolio_mahara',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(490,0,'portfolio_mahara','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(491,0,'portfolio_mahara','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(492,0,'portfolio_picasa',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(493,0,'portfolio_picasa','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(494,0,'portfolio_picasa','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(495,0,'qbehaviour_adaptive',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(496,0,'qbehaviour_adaptive','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(497,0,'qbehaviour_adaptive','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(498,0,'qbehaviour_adaptivenopenalty',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(499,0,'qbehaviour_adaptivenopenalty','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(500,0,'qbehaviour_adaptivenopenalty','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(501,0,'qbehaviour_deferredcbm',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(502,0,'qbehaviour_deferredcbm','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(503,0,'qbehaviour_deferredcbm','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(504,0,'qbehaviour_deferredfeedback',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(505,0,'qbehaviour_deferredfeedback','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(506,0,'qbehaviour_deferredfeedback','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(507,0,'qbehaviour_immediatecbm',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(508,0,'qbehaviour_immediatecbm','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(509,0,'qbehaviour_immediatecbm','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(510,0,'qbehaviour_immediatefeedback',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(511,0,'qbehaviour_immediatefeedback','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(512,0,'qbehaviour_immediatefeedback','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(513,0,'qbehaviour_informationitem',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(514,0,'qbehaviour_informationitem','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(515,0,'qbehaviour_informationitem','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(516,0,'qbehaviour_interactive',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(517,0,'qbehaviour_interactive','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(518,0,'qbehaviour_interactive','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(519,0,'qbehaviour_interactivecountback',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(520,0,'qbehaviour_interactivecountback','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(521,0,'qbehaviour_interactivecountback','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(522,0,'qbehaviour_manualgraded',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(523,0,'qbehaviour_manualgraded','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(524,0,'qbehaviour_manualgraded','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(525,0,'qbehaviour_missing',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(526,0,'qbehaviour_missing','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(527,0,'qbehaviour_missing','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(528,0,'qformat_aiken',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(529,0,'qformat_aiken','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(530,0,'qformat_aiken','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(531,0,'qformat_blackboard',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713771),(532,0,'qformat_blackboard','2012061701','2012061701','Upgrade savepoint reached',NULL,'',0,1352713771),(533,0,'qformat_blackboard','2012061701','2012061701','Plugin installed',NULL,'',0,1352713771),(534,0,'qformat_blackboard_six',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713771),(535,0,'qformat_blackboard_six','2012061701','2012061701','Upgrade savepoint reached',NULL,'',0,1352713771),(536,0,'qformat_blackboard_six','2012061701','2012061701','Plugin installed',NULL,'',0,1352713771),(537,0,'qformat_examview',NULL,'2012061701','Starting plugin installation',NULL,'',0,1352713771),(538,0,'qformat_examview','2012061701','2012061701','Upgrade savepoint reached',NULL,'',0,1352713771),(539,0,'qformat_examview','2012061701','2012061701','Plugin installed',NULL,'',0,1352713771),(540,0,'qformat_gift',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(541,0,'qformat_gift','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(542,0,'qformat_gift','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(543,0,'qformat_learnwise',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(544,0,'qformat_learnwise','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(545,0,'qformat_learnwise','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(546,0,'qformat_missingword',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(547,0,'qformat_missingword','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(548,0,'qformat_missingword','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(549,0,'qformat_multianswer',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(550,0,'qformat_multianswer','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(551,0,'qformat_multianswer','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(552,0,'qformat_webct',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(553,0,'qformat_webct','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(554,0,'qformat_webct','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(555,0,'qformat_xhtml',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(556,0,'qformat_xhtml','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(557,0,'qformat_xhtml','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(558,0,'qformat_xml',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(559,0,'qformat_xml','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(560,0,'qformat_xml','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(561,0,'tool_assignmentupgrade',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(562,0,'tool_assignmentupgrade','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(563,0,'tool_assignmentupgrade','2012061700','2012061700','Plugin installed',NULL,'',0,1352713771),(564,0,'tool_bloglevelupgrade',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713771),(565,0,'tool_bloglevelupgrade','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713771),(566,0,'tool_bloglevelupgrade','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(567,0,'tool_capability',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(568,0,'tool_capability','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(569,0,'tool_capability','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(570,0,'tool_customlang',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(571,0,'tool_customlang','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(572,0,'tool_customlang','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(573,0,'tool_dbtransfer',NULL,'2012062200','Starting plugin installation',NULL,'',0,1352713772),(574,0,'tool_dbtransfer','2012062200','2012062200','Upgrade savepoint reached',NULL,'',0,1352713772),(575,0,'tool_dbtransfer','2012062200','2012062200','Plugin installed',NULL,'',0,1352713772),(576,0,'tool_generator',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(577,0,'tool_generator','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(578,0,'tool_generator','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(579,0,'tool_health',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(580,0,'tool_health','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(581,0,'tool_health','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(582,0,'tool_innodb',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(583,0,'tool_innodb','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(584,0,'tool_innodb','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(585,0,'tool_langimport',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(586,0,'tool_langimport','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(587,0,'tool_langimport','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(588,0,'tool_multilangupgrade',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(589,0,'tool_multilangupgrade','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(590,0,'tool_multilangupgrade','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(591,0,'tool_phpunit',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(592,0,'tool_phpunit','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(593,0,'tool_phpunit','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(594,0,'tool_profiling',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(595,0,'tool_profiling','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(596,0,'tool_profiling','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(597,0,'tool_qeupgradehelper',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(598,0,'tool_qeupgradehelper','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(599,0,'tool_qeupgradehelper','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(600,0,'tool_replace',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(601,0,'tool_replace','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(602,0,'tool_replace','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(603,0,'tool_spamcleaner',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(604,0,'tool_spamcleaner','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(605,0,'tool_spamcleaner','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(606,0,'tool_timezoneimport',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(607,0,'tool_timezoneimport','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(608,0,'tool_timezoneimport','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(609,0,'tool_unittest',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(610,0,'tool_unittest','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(611,0,'tool_unittest','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(612,0,'tool_unsuproles',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(613,0,'tool_unsuproles','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(614,0,'tool_unsuproles','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(615,0,'tool_uploaduser',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(616,0,'tool_uploaduser','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(617,0,'tool_uploaduser','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(618,0,'tool_xmldb',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(619,0,'tool_xmldb','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(620,0,'tool_xmldb','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(621,0,'theme_afterburner',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(622,0,'theme_afterburner','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(623,0,'theme_afterburner','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(624,0,'theme_anomaly',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(625,0,'theme_anomaly','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(626,0,'theme_anomaly','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(627,0,'theme_arialist',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(628,0,'theme_arialist','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(629,0,'theme_arialist','2012061700','2012061700','Plugin installed',NULL,'',0,1352713772),(630,0,'theme_base',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713772),(631,0,'theme_base','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713772),(632,0,'theme_base','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(633,0,'theme_binarius',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(634,0,'theme_binarius','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(635,0,'theme_binarius','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(636,0,'theme_boxxie',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(637,0,'theme_boxxie','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(638,0,'theme_boxxie','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(639,0,'theme_brick',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(640,0,'theme_brick','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(641,0,'theme_brick','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(642,0,'theme_canvas',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(643,0,'theme_canvas','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(644,0,'theme_canvas','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(645,0,'theme_formal_white',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(646,0,'theme_formal_white','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(647,0,'theme_formal_white','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(648,0,'theme_formfactor',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(649,0,'theme_formfactor','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(650,0,'theme_formfactor','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(651,0,'theme_fusion',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(652,0,'theme_fusion','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(653,0,'theme_fusion','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(654,0,'theme_leatherbound',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(655,0,'theme_leatherbound','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(656,0,'theme_leatherbound','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(657,0,'theme_magazine',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(658,0,'theme_magazine','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(659,0,'theme_magazine','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(660,0,'theme_mymobile',NULL,'2012061901','Starting plugin installation',NULL,'',0,1352713773),(661,0,'theme_mymobile','2012061901','2012061901','Upgrade savepoint reached',NULL,'',0,1352713773),(662,0,'theme_mymobile','2012061901','2012061901','Plugin installed',NULL,'',0,1352713773),(663,0,'theme_nimble',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(664,0,'theme_nimble','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(665,0,'theme_nimble','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(666,0,'theme_nonzero',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(667,0,'theme_nonzero','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(668,0,'theme_nonzero','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(669,0,'theme_overlay',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(670,0,'theme_overlay','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(671,0,'theme_overlay','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(672,0,'theme_serenity',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(673,0,'theme_serenity','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(674,0,'theme_serenity','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(675,0,'theme_sky_high',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(676,0,'theme_sky_high','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(677,0,'theme_sky_high','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(678,0,'theme_splash',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(679,0,'theme_splash','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(680,0,'theme_splash','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(681,0,'theme_standard',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(682,0,'theme_standard','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(683,0,'theme_standard','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(684,0,'theme_standardold',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(685,0,'theme_standardold','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(686,0,'theme_standardold','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(687,0,'assignsubmission_comments',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(688,0,'assignsubmission_comments','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(689,0,'assignsubmission_comments','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(690,0,'assignsubmission_file',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(691,0,'assignsubmission_file','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713773),(692,0,'assignsubmission_file','2012061700','2012061700','Plugin installed',NULL,'',0,1352713773),(693,0,'assignsubmission_onlinetext',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713773),(694,0,'assignsubmission_onlinetext','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(695,0,'assignsubmission_onlinetext','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(696,0,'assignfeedback_comments',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(697,0,'assignfeedback_comments','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(698,0,'assignfeedback_comments','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(699,0,'assignfeedback_file',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(700,0,'assignfeedback_file','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(701,0,'assignfeedback_file','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(702,0,'assignment_offline',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(703,0,'assignment_offline','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(704,0,'assignment_offline','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(705,0,'assignment_online',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(706,0,'assignment_online','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(707,0,'assignment_online','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(708,0,'assignment_upload',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(709,0,'assignment_upload','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(710,0,'assignment_upload','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(711,0,'assignment_uploadsingle',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(712,0,'assignment_uploadsingle','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(713,0,'assignment_uploadsingle','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(714,0,'booktool_exportimscp',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(715,0,'booktool_exportimscp','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(716,0,'booktool_exportimscp','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(717,0,'booktool_importhtml',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(718,0,'booktool_importhtml','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(719,0,'booktool_importhtml','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(720,0,'booktool_print',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(721,0,'booktool_print','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(722,0,'booktool_print','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(723,0,'datafield_checkbox',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(724,0,'datafield_checkbox','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(725,0,'datafield_checkbox','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(726,0,'datafield_date',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(727,0,'datafield_date','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(728,0,'datafield_date','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(729,0,'datafield_file',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(730,0,'datafield_file','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(731,0,'datafield_file','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(732,0,'datafield_latlong',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(733,0,'datafield_latlong','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(734,0,'datafield_latlong','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(735,0,'datafield_menu',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(736,0,'datafield_menu','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(737,0,'datafield_menu','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(738,0,'datafield_multimenu',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(739,0,'datafield_multimenu','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(740,0,'datafield_multimenu','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(741,0,'datafield_number',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(742,0,'datafield_number','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(743,0,'datafield_number','2012061700','2012061700','Plugin installed',NULL,'',0,1352713774),(744,0,'datafield_picture',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713774),(745,0,'datafield_picture','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713774),(746,0,'datafield_picture','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(747,0,'datafield_radiobutton',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(748,0,'datafield_radiobutton','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(749,0,'datafield_radiobutton','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(750,0,'datafield_text',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(751,0,'datafield_text','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(752,0,'datafield_text','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(753,0,'datafield_textarea',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(754,0,'datafield_textarea','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(755,0,'datafield_textarea','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(756,0,'datafield_url',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(757,0,'datafield_url','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(758,0,'datafield_url','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(759,0,'datapreset_imagegallery',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(760,0,'datapreset_imagegallery','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(761,0,'datapreset_imagegallery','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(762,0,'quiz_grading',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(763,0,'quiz_grading','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(764,0,'quiz_grading','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(765,0,'quiz_overview',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(766,0,'quiz_overview','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(767,0,'quiz_overview','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(768,0,'quiz_responses',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(769,0,'quiz_responses','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(770,0,'quiz_responses','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(771,0,'quiz_statistics',NULL,'2012061801','Starting plugin installation',NULL,'',0,1352713775),(772,0,'quiz_statistics','2012061801','2012061801','Upgrade savepoint reached',NULL,'',0,1352713775),(773,0,'quiz_statistics','2012061801','2012061801','Plugin installed',NULL,'',0,1352713775),(774,0,'quizaccess_delaybetweenattempts',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(775,0,'quizaccess_delaybetweenattempts','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(776,0,'quizaccess_delaybetweenattempts','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(777,0,'quizaccess_ipaddress',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(778,0,'quizaccess_ipaddress','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(779,0,'quizaccess_ipaddress','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(780,0,'quizaccess_numattempts',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(781,0,'quizaccess_numattempts','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(782,0,'quizaccess_numattempts','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(783,0,'quizaccess_openclosedate',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(784,0,'quizaccess_openclosedate','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(785,0,'quizaccess_openclosedate','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(786,0,'quizaccess_password',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(787,0,'quizaccess_password','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(788,0,'quizaccess_password','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(789,0,'quizaccess_safebrowser',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(790,0,'quizaccess_safebrowser','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(791,0,'quizaccess_safebrowser','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(792,0,'quizaccess_securewindow',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(793,0,'quizaccess_securewindow','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(794,0,'quizaccess_securewindow','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(795,0,'quizaccess_timelimit',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(796,0,'quizaccess_timelimit','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(797,0,'quizaccess_timelimit','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(798,0,'scormreport_basic',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(799,0,'scormreport_basic','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(800,0,'scormreport_basic','2012061700','2012061700','Plugin installed',NULL,'',0,1352713775),(801,0,'scormreport_graphs',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713775),(802,0,'scormreport_graphs','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713775),(803,0,'scormreport_graphs','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(804,0,'scormreport_interactions',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(805,0,'scormreport_interactions','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(806,0,'scormreport_interactions','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(807,0,'workshopform_accumulative',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(808,0,'workshopform_accumulative','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(809,0,'workshopform_accumulative','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(810,0,'workshopform_comments',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(811,0,'workshopform_comments','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(812,0,'workshopform_comments','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(813,0,'workshopform_numerrors',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(814,0,'workshopform_numerrors','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(815,0,'workshopform_numerrors','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(816,0,'workshopform_rubric',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(817,0,'workshopform_rubric','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(818,0,'workshopform_rubric','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(819,0,'workshopallocation_manual',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(820,0,'workshopallocation_manual','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(821,0,'workshopallocation_manual','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(822,0,'workshopallocation_random',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(823,0,'workshopallocation_random','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(824,0,'workshopallocation_random','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(825,0,'workshopallocation_scheduled',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(826,0,'workshopallocation_scheduled','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(827,0,'workshopallocation_scheduled','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(828,0,'workshopeval_best',NULL,'2012061700','Starting plugin installation',NULL,'',0,1352713776),(829,0,'workshopeval_best','2012061700','2012061700','Upgrade savepoint reached',NULL,'',0,1352713776),(830,0,'workshopeval_best','2012061700','2012061700','Plugin installed',NULL,'',0,1352713776),(831,0,'core','2012062503','2012120301','Starting core upgrade',NULL,'',0,1363018089),(832,0,'core','2012070600.04','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(833,0,'core','2012070600.05','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(834,0,'core','2012070600.06','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(835,0,'core','2012070600.07','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(836,0,'core','2012070600.08','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(837,0,'core','2012070600.09','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(838,0,'core','2012070600.1','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(839,0,'core','2012070600.11','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(840,0,'core','2012071900.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(841,0,'core','2012072400','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(842,0,'core','2012072401','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(843,0,'core','2012072600.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(844,0,'core','2012080200.02','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(845,0,'core','2012081400.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(846,0,'core','2012081600.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(847,0,'core','2012082300.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(848,0,'core','2012082300.02','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(849,0,'core','2012090500','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(850,0,'core','2012090700.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(851,0,'core','2012091700','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(852,0,'core','2012092100.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(853,0,'core','2012092600','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(854,0,'core','2012101500.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(855,0,'core','2012101800.02','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(856,0,'core','2012103001','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(857,0,'core','2012103002','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(858,0,'core','2012103003','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(859,0,'core','2012110200','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(860,0,'core','2012110201','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(861,0,'core','2012110700.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(862,0,'core','2012111200','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(863,0,'core','2012111200.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(864,0,'core','2012111601.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(865,0,'core','2012112100','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(866,0,'core','2012120300.01','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(867,0,'core','2012120300.04','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(868,0,'core','2012120301','2012120301','Upgrade savepoint reached',NULL,'',0,1363018090),(869,0,'core','2012120301','2012120301','Core upgraded',NULL,'',0,1363018091),(870,0,'qtype_calculated','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(871,0,'qtype_calculated','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(872,0,'qtype_calculated','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(873,0,'qtype_calculatedmulti','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(874,0,'qtype_calculatedmulti','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(875,0,'qtype_calculatedmulti','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(876,0,'qtype_calculatedsimple','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(877,0,'qtype_calculatedsimple','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(878,0,'qtype_calculatedsimple','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(879,0,'qtype_description','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(880,0,'qtype_description','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(881,0,'qtype_description','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(882,0,'qtype_essay','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(883,0,'qtype_essay','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(884,0,'qtype_essay','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(885,0,'qtype_match','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(886,0,'qtype_match','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(887,0,'qtype_match','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(888,0,'qtype_missingtype','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(889,0,'qtype_missingtype','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(890,0,'qtype_missingtype','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(891,0,'qtype_multianswer','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(892,0,'qtype_multianswer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(893,0,'qtype_multianswer','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(894,0,'qtype_multichoice','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(895,0,'qtype_multichoice','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(896,0,'qtype_multichoice','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(897,0,'qtype_numerical','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(898,0,'qtype_numerical','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(899,0,'qtype_numerical','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(900,0,'qtype_random','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(901,0,'qtype_random','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(902,0,'qtype_random','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(903,0,'qtype_randomsamatch','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(904,0,'qtype_randomsamatch','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(905,0,'qtype_randomsamatch','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(906,0,'qtype_shortanswer','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(907,0,'qtype_shortanswer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(908,0,'qtype_shortanswer','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(909,0,'qtype_truefalse','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(910,0,'qtype_truefalse','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(911,0,'qtype_truefalse','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018091),(912,0,'mod_assign','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018091),(913,0,'mod_assign','2012071800','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(914,0,'mod_assign','2012081600','2012112900','Upgrade savepoint reached',NULL,'',0,1363018091),(915,0,'mod_assign','2012082100','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(916,0,'mod_assign','2012082300','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(917,0,'mod_assign','2012082400','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(918,0,'mod_assign','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(919,0,'mod_assign','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018092),(920,0,'mod_assignment','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018092),(921,0,'mod_assignment','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(922,0,'mod_assignment','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018092),(923,0,'mod_autoview',NULL,'2012100901','Starting plugin installation',NULL,'',0,1363018092),(924,0,'mod_autoview','2012100901','2012100901','Plugin installed',NULL,'',0,1363018092),(925,0,'mod_book','2012061710','2012112900','Starting plugin upgrade',NULL,'',0,1363018092),(926,0,'mod_book','2012090401','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(927,0,'mod_book','2012090402','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(928,0,'mod_book','2012090403','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(929,0,'mod_book','2012090404','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(930,0,'mod_book','2012090405','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(931,0,'mod_book','2012090406','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(932,0,'mod_book','2012090407','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(933,0,'mod_book','2012090408','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(934,0,'mod_book','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(935,0,'mod_book','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018092),(936,0,'mod_chat','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018092),(937,0,'mod_chat','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(938,0,'mod_chat','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018092),(939,0,'mod_choice','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018092),(940,0,'mod_choice','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018092),(941,0,'mod_choice','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018092),(942,0,'mod_data','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018092),(943,0,'mod_data','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018092),(944,0,'mod_data','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018093),(945,0,'mod_feedback','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(946,0,'mod_feedback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(947,0,'mod_feedback','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(948,0,'mod_folder','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(949,0,'mod_folder','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(950,0,'mod_folder','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(951,0,'mod_forum','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(952,0,'mod_forum','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(953,0,'mod_forum','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(954,0,'mod_glossary','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(955,0,'mod_glossary','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(956,0,'mod_glossary','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(957,0,'mod_imscp','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(958,0,'mod_imscp','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(959,0,'mod_imscp','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(960,0,'mod_label','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(961,0,'mod_label','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(962,0,'mod_label','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(963,0,'mod_lesson','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(964,0,'mod_lesson','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(965,0,'mod_lesson','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(966,0,'mod_lti','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(967,0,'mod_lti','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(968,0,'mod_lti','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(969,0,'mod_page','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(970,0,'mod_page','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(971,0,'mod_page','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(972,0,'mod_quiz','2012061703','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(973,0,'mod_quiz','2012100801','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(974,0,'mod_quiz','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(975,0,'mod_quiz','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(976,0,'mod_resource','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(977,0,'mod_resource','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(978,0,'mod_resource','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(979,0,'mod_scorm','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(980,0,'mod_scorm','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(981,0,'mod_scorm','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(982,0,'mod_survey','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(983,0,'mod_survey','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(984,0,'mod_survey','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(985,0,'mod_url','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(986,0,'mod_url','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(987,0,'mod_url','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(988,0,'mod_wiki','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(989,0,'mod_wiki','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(990,0,'mod_wiki','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(991,0,'mod_workshop','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(992,0,'mod_workshop','2012102400','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(993,0,'mod_workshop','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(994,0,'mod_workshop','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(995,0,'auth_cas','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(996,0,'auth_cas','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(997,0,'auth_cas','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(998,0,'auth_db','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018093),(999,0,'auth_db','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018093),(1000,0,'auth_db','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018093),(1001,0,'auth_email','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1002,0,'auth_email','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1003,0,'auth_email','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1004,0,'auth_fc','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1005,0,'auth_fc','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1006,0,'auth_fc','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1007,0,'auth_imap','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1008,0,'auth_imap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1009,0,'auth_imap','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1010,0,'auth_ldap','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1011,0,'auth_ldap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1012,0,'auth_ldap','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1013,0,'auth_manual','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1014,0,'auth_manual','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1015,0,'auth_manual','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1016,0,'auth_mnet','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1017,0,'auth_mnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1018,0,'auth_mnet','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1019,0,'auth_nntp','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1020,0,'auth_nntp','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1021,0,'auth_nntp','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1022,0,'auth_nologin','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1023,0,'auth_nologin','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1024,0,'auth_nologin','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1025,0,'auth_none','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1026,0,'auth_none','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1027,0,'auth_none','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1028,0,'auth_pam','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1029,0,'auth_pam','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1030,0,'auth_pam','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1031,0,'auth_pop3','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1032,0,'auth_pop3','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1033,0,'auth_pop3','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1034,0,'auth_radius','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1035,0,'auth_radius','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1036,0,'auth_radius','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1037,0,'auth_shibboleth','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1038,0,'auth_shibboleth','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1039,0,'auth_shibboleth','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1040,0,'auth_webservice','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1041,0,'auth_webservice','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1042,0,'auth_webservice','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1043,0,'enrol_authorize','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1044,0,'enrol_authorize','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1045,0,'enrol_authorize','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1046,0,'enrol_category','2012081800','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1047,0,'enrol_category','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1048,0,'enrol_category','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1049,0,'enrol_cohort','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1050,0,'enrol_cohort','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1051,0,'enrol_cohort','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1052,0,'enrol_database','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1053,0,'enrol_database','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1054,0,'enrol_database','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1055,0,'enrol_flatfile','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1056,0,'enrol_flatfile','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1057,0,'enrol_flatfile','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018094),(1058,0,'enrol_guest','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018094),(1059,0,'enrol_guest','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018094),(1060,0,'enrol_guest','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1061,0,'enrol_imsenterprise','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1062,0,'enrol_imsenterprise','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1063,0,'enrol_imsenterprise','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1064,0,'enrol_ldap','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1065,0,'enrol_ldap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1066,0,'enrol_ldap','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1067,0,'enrol_manual','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1068,0,'enrol_manual','2012100702','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1069,0,'enrol_manual','2012101400','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1070,0,'enrol_manual','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1071,0,'enrol_manual','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1072,0,'enrol_meta','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1073,0,'enrol_meta','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1074,0,'enrol_meta','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1075,0,'enrol_mnet','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1076,0,'enrol_mnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1077,0,'enrol_mnet','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1078,0,'enrol_payanyway',NULL,'2011121300','Starting plugin installation',NULL,'',0,1363018095),(1079,0,'enrol_payanyway','2011121300','2011121300','Upgrade savepoint reached',NULL,'',0,1363018095),(1080,0,'enrol_payanyway','2011121300','2011121300','Plugin installed',NULL,'',0,1363018095),(1081,0,'enrol_paypal','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1082,0,'enrol_paypal','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1083,0,'enrol_paypal','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1084,0,'enrol_self','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1085,0,'enrol_self','2012101400','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1086,0,'enrol_self','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1087,0,'enrol_self','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1088,0,'message_email','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1089,0,'message_email','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1090,0,'message_email','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1091,0,'message_jabber','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1092,0,'message_jabber','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1093,0,'message_jabber','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1094,0,'message_popup','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1095,0,'message_popup','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1096,0,'message_popup','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1097,0,'block_activity_modules','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1098,0,'block_activity_modules','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1099,0,'block_activity_modules','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1100,0,'block_admin_bookmarks','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018095),(1101,0,'block_admin_bookmarks','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018095),(1102,0,'block_admin_bookmarks','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018095),(1103,0,'block_blog_menu','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1104,0,'block_blog_menu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1105,0,'block_blog_menu','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1106,0,'block_blog_recent','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1107,0,'block_blog_recent','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1108,0,'block_blog_recent','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1109,0,'block_blog_tags','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1110,0,'block_blog_tags','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1111,0,'block_blog_tags','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1112,0,'block_calendar_month','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1113,0,'block_calendar_month','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1114,0,'block_calendar_month','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1115,0,'block_calendar_upcoming','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1116,0,'block_calendar_upcoming','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1117,0,'block_calendar_upcoming','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1118,0,'block_comments','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1119,0,'block_comments','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1120,0,'block_comments','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1121,0,'block_community','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1122,0,'block_community','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1123,0,'block_community','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1124,0,'block_completionstatus','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018096),(1125,0,'block_completionstatus','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018096),(1126,0,'block_completionstatus','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018096),(1127,0,'block_course_list','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1128,0,'block_course_list','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1129,0,'block_course_list','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1130,0,'block_course_overview','2012061700','2012121000','Starting plugin upgrade',NULL,'',0,1363018096),(1131,0,'block_course_overview','2012121000','2012121000','Upgrade savepoint reached',NULL,'',0,1363018096),(1132,0,'block_course_overview','2012121000','2012121000','Plugin upgraded',NULL,'',0,1363018096),(1133,0,'block_course_summary','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018096),(1134,0,'block_course_summary','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018096),(1135,0,'block_course_summary','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018096),(1136,0,'block_feedback','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1137,0,'block_feedback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1138,0,'block_feedback','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1139,0,'block_glossary_random','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018096),(1140,0,'block_glossary_random','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018096),(1141,0,'block_glossary_random','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018096),(1142,0,'block_html','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1143,0,'block_html','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1144,0,'block_html','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1145,0,'block_login','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1146,0,'block_login','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1147,0,'block_login','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1148,0,'block_mentees','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018096),(1149,0,'block_mentees','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018096),(1150,0,'block_mentees','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018096),(1151,0,'block_messages','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1152,0,'block_messages','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1153,0,'block_messages','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1154,0,'block_mnet_hosts','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1155,0,'block_mnet_hosts','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1156,0,'block_mnet_hosts','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018096),(1157,0,'block_myprofile','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018096),(1158,0,'block_myprofile','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018096),(1159,0,'block_myprofile','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1160,0,'block_navigation','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1161,0,'block_navigation','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1162,0,'block_navigation','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1163,0,'block_news_items','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018097),(1164,0,'block_news_items','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018097),(1165,0,'block_news_items','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018097),(1166,0,'block_online_users','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018097),(1167,0,'block_online_users','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018097),(1168,0,'block_online_users','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018097),(1169,0,'block_participants','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1170,0,'block_participants','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1171,0,'block_participants','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1172,0,'block_private_files','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1173,0,'block_private_files','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1174,0,'block_private_files','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1175,0,'block_quiz_results','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1176,0,'block_quiz_results','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1177,0,'block_quiz_results','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1178,0,'block_recent_activity','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1179,0,'block_recent_activity','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1180,0,'block_recent_activity','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1181,0,'block_repo_filemanager',NULL,'2011101101','Starting plugin installation',NULL,'',0,1363018097),(1182,0,'block_repo_filemanager','2011101101','2011101101','Plugin installed',NULL,'',0,1363018097),(1183,0,'block_rss_client','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1184,0,'block_rss_client','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1185,0,'block_rss_client','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1186,0,'block_search_forums','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1187,0,'block_search_forums','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1188,0,'block_search_forums','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1189,0,'block_section_links','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1190,0,'block_section_links','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1191,0,'block_section_links','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1192,0,'block_selfcompletion','2012061700','2012112901','Starting plugin upgrade',NULL,'',0,1363018097),(1193,0,'block_selfcompletion','2012112901','2012112901','Upgrade savepoint reached',NULL,'',0,1363018097),(1194,0,'block_selfcompletion','2012112901','2012112901','Plugin upgraded',NULL,'',0,1363018097),(1195,0,'block_settings','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1196,0,'block_settings','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1197,0,'block_settings','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1198,0,'block_site_main_menu','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1199,0,'block_site_main_menu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1200,0,'block_site_main_menu','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018097),(1201,0,'block_social_activities','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018097),(1202,0,'block_social_activities','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018097),(1203,0,'block_social_activities','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1204,0,'block_tag_flickr','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1205,0,'block_tag_flickr','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1206,0,'block_tag_flickr','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1207,0,'block_tag_youtube','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1208,0,'block_tag_youtube','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1209,0,'block_tag_youtube','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1210,0,'block_tags','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1211,0,'block_tags','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1212,0,'block_tags','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1213,0,'filter_activitynames','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1214,0,'filter_activitynames','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1215,0,'filter_activitynames','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1216,0,'filter_algebra','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1217,0,'filter_algebra','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1218,0,'filter_algebra','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1219,0,'filter_censor','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1220,0,'filter_censor','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1221,0,'filter_censor','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1222,0,'filter_data','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1223,0,'filter_data','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1224,0,'filter_data','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1225,0,'filter_emailprotect','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1226,0,'filter_emailprotect','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1227,0,'filter_emailprotect','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1228,0,'filter_emoticon','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1229,0,'filter_emoticon','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1230,0,'filter_emoticon','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1231,0,'filter_glossary','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1232,0,'filter_glossary','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1233,0,'filter_glossary','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1234,0,'filter_mediaplugin','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1235,0,'filter_mediaplugin','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1236,0,'filter_mediaplugin','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1237,0,'filter_multilang','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1238,0,'filter_multilang','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1239,0,'filter_multilang','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1240,0,'filter_tex','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1241,0,'filter_tex','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1242,0,'filter_tex','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1243,0,'filter_tidy','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1244,0,'filter_tidy','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1245,0,'filter_tidy','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1246,0,'filter_urltolink','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1247,0,'filter_urltolink','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1248,0,'filter_urltolink','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1249,0,'editor_textarea','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1250,0,'editor_textarea','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1251,0,'editor_textarea','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1252,0,'editor_tinymce','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1253,0,'editor_tinymce','2012083100','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1254,0,'editor_tinymce','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1255,0,'editor_tinymce','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1256,0,'format_scorm','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1257,0,'format_scorm','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1258,0,'format_scorm','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018098),(1259,0,'format_social','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018098),(1260,0,'format_social','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018098),(1261,0,'format_social','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1262,0,'format_topics','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1263,0,'format_topics','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1264,0,'format_topics','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1265,0,'format_weeks','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1266,0,'format_weeks','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1267,0,'format_weeks','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1268,0,'profilefield_checkbox','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1269,0,'profilefield_checkbox','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1270,0,'profilefield_checkbox','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1271,0,'profilefield_datetime','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1272,0,'profilefield_datetime','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1273,0,'profilefield_datetime','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1274,0,'profilefield_menu','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1275,0,'profilefield_menu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1276,0,'profilefield_menu','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1277,0,'profilefield_text','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1278,0,'profilefield_text','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1279,0,'profilefield_text','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1280,0,'profilefield_textarea','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1281,0,'profilefield_textarea','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1282,0,'profilefield_textarea','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1283,0,'report_backups','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1284,0,'report_backups','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1285,0,'report_backups','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1286,0,'report_completion','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1287,0,'report_completion','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1288,0,'report_completion','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1289,0,'report_configlog','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1290,0,'report_configlog','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1291,0,'report_configlog','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1292,0,'report_courseoverview','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1293,0,'report_courseoverview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1294,0,'report_courseoverview','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1295,0,'report_log','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1296,0,'report_log','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1297,0,'report_log','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1298,0,'report_loglive','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1299,0,'report_loglive','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1300,0,'report_loglive','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1301,0,'report_outline','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1302,0,'report_outline','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1303,0,'report_outline','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1304,0,'report_participation','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1305,0,'report_participation','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1306,0,'report_participation','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1307,0,'report_progress','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1308,0,'report_progress','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1309,0,'report_progress','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1310,0,'report_questioninstances','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1311,0,'report_questioninstances','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1312,0,'report_questioninstances','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1313,0,'report_security','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1314,0,'report_security','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1315,0,'report_security','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1316,0,'report_stats','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1317,0,'report_stats','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1318,0,'report_stats','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1319,0,'gradeexport_ods','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1320,0,'gradeexport_ods','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1321,0,'gradeexport_ods','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1322,0,'gradeexport_txt','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1323,0,'gradeexport_txt','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1324,0,'gradeexport_txt','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1325,0,'gradeexport_xls','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018099),(1326,0,'gradeexport_xls','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018099),(1327,0,'gradeexport_xls','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018099),(1328,0,'gradeexport_xml','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1329,0,'gradeexport_xml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1330,0,'gradeexport_xml','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1331,0,'gradeimport_csv','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1332,0,'gradeimport_csv','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1333,0,'gradeimport_csv','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1334,0,'gradeimport_xml','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1335,0,'gradeimport_xml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1336,0,'gradeimport_xml','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1337,0,'gradereport_grader','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1338,0,'gradereport_grader','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1339,0,'gradereport_grader','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1340,0,'gradereport_outcomes','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1341,0,'gradereport_outcomes','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1342,0,'gradereport_outcomes','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1343,0,'gradereport_overview','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1344,0,'gradereport_overview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1345,0,'gradereport_overview','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1346,0,'gradereport_user','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1347,0,'gradereport_user','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1348,0,'gradereport_user','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1349,0,'gradingform_guide','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1350,0,'gradingform_guide','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1351,0,'gradingform_guide','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1352,0,'gradingform_rubric','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1353,0,'gradingform_rubric','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1354,0,'gradingform_rubric','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1355,0,'mnetservice_enrol','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1356,0,'mnetservice_enrol','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1357,0,'mnetservice_enrol','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1358,0,'webservice_amf','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1359,0,'webservice_amf','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1360,0,'webservice_amf','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1361,0,'webservice_rest','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1362,0,'webservice_rest','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1363,0,'webservice_rest','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1364,0,'webservice_soap','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1365,0,'webservice_soap','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1366,0,'webservice_soap','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1367,0,'webservice_xmlrpc','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1368,0,'webservice_xmlrpc','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1369,0,'webservice_xmlrpc','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1370,0,'repository_alfresco','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1371,0,'repository_alfresco','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1372,0,'repository_alfresco','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1373,0,'repository_boxnet','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1374,0,'repository_boxnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1375,0,'repository_boxnet','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1376,0,'repository_coursefilearea',NULL,'2012062802','Starting plugin installation',NULL,'',0,1363018100),(1377,0,'repository_coursefilearea','2012062802','2012062802','Upgrade savepoint reached',NULL,'',0,1363018100),(1378,0,'repository_coursefilearea','2012062802','2012062802','Plugin installed',NULL,'',0,1363018100),(1379,0,'repository_coursefiles','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1380,0,'repository_coursefiles','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1381,0,'repository_coursefiles','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1382,0,'repository_dropbox','2012080702','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1383,0,'repository_dropbox','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1384,0,'repository_dropbox','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1385,0,'repository_equella','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018100),(1386,0,'repository_equella','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018100),(1387,0,'repository_equella','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018100),(1388,0,'repository_filesystem','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1389,0,'repository_filesystem','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1390,0,'repository_filesystem','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1391,0,'repository_flickr','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1392,0,'repository_flickr','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1393,0,'repository_flickr','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1394,0,'repository_flickr_public','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1395,0,'repository_flickr_public','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1396,0,'repository_flickr_public','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1397,0,'repository_googledocs','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1398,0,'repository_googledocs','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1399,0,'repository_googledocs','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1400,0,'repository_local','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1401,0,'repository_local','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1402,0,'repository_local','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1403,0,'repository_merlot','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1404,0,'repository_merlot','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1405,0,'repository_merlot','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1406,0,'repository_picasa','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1407,0,'repository_picasa','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1408,0,'repository_picasa','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1409,0,'repository_recent','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1410,0,'repository_recent','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1411,0,'repository_recent','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1412,0,'repository_s3','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1413,0,'repository_s3','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1414,0,'repository_s3','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1415,0,'repository_upload','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1416,0,'repository_upload','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1417,0,'repository_upload','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1418,0,'repository_url','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1419,0,'repository_url','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1420,0,'repository_url','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1421,0,'repository_user','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1422,0,'repository_user','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1423,0,'repository_user','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1424,0,'repository_webdav','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1425,0,'repository_webdav','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1426,0,'repository_webdav','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1427,0,'repository_wikimedia','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1428,0,'repository_wikimedia','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1429,0,'repository_wikimedia','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1430,0,'repository_youtube','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1431,0,'repository_youtube','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1432,0,'repository_youtube','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1433,0,'portfolio_boxnet','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1434,0,'portfolio_boxnet','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1435,0,'portfolio_boxnet','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1436,0,'portfolio_download','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1437,0,'portfolio_download','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1438,0,'portfolio_download','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1439,0,'portfolio_flickr','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1440,0,'portfolio_flickr','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1441,0,'portfolio_flickr','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1442,0,'portfolio_googledocs','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1443,0,'portfolio_googledocs','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1444,0,'portfolio_googledocs','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018101),(1445,0,'portfolio_mahara','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018101),(1446,0,'portfolio_mahara','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018101),(1447,0,'portfolio_mahara','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1448,0,'portfolio_picasa','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1449,0,'portfolio_picasa','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1450,0,'portfolio_picasa','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1451,0,'qbehaviour_adaptive','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1452,0,'qbehaviour_adaptive','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1453,0,'qbehaviour_adaptive','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1454,0,'qbehaviour_adaptivenopenalty','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1455,0,'qbehaviour_adaptivenopenalty','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1456,0,'qbehaviour_adaptivenopenalty','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1457,0,'qbehaviour_deferredcbm','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1458,0,'qbehaviour_deferredcbm','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1459,0,'qbehaviour_deferredcbm','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1460,0,'qbehaviour_deferredfeedback','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1461,0,'qbehaviour_deferredfeedback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1462,0,'qbehaviour_deferredfeedback','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1463,0,'qbehaviour_immediatecbm','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1464,0,'qbehaviour_immediatecbm','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1465,0,'qbehaviour_immediatecbm','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1466,0,'qbehaviour_immediatefeedback','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1467,0,'qbehaviour_immediatefeedback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1468,0,'qbehaviour_immediatefeedback','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1469,0,'qbehaviour_informationitem','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1470,0,'qbehaviour_informationitem','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1471,0,'qbehaviour_informationitem','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1472,0,'qbehaviour_interactive','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1473,0,'qbehaviour_interactive','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1474,0,'qbehaviour_interactive','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1475,0,'qbehaviour_interactivecountback','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1476,0,'qbehaviour_interactivecountback','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1477,0,'qbehaviour_interactivecountback','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1478,0,'qbehaviour_manualgraded','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1479,0,'qbehaviour_manualgraded','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1480,0,'qbehaviour_manualgraded','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1481,0,'qbehaviour_missing','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1482,0,'qbehaviour_missing','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1483,0,'qbehaviour_missing','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1484,0,'qformat_aiken','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1485,0,'qformat_aiken','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1486,0,'qformat_aiken','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1487,0,'qformat_blackboard','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1488,0,'qformat_blackboard','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1489,0,'qformat_blackboard','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1490,0,'qformat_blackboard_six','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1491,0,'qformat_blackboard_six','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1492,0,'qformat_blackboard_six','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1493,0,'qformat_examview','2012061701','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1494,0,'qformat_examview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1495,0,'qformat_examview','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1496,0,'qformat_gift','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1497,0,'qformat_gift','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1498,0,'qformat_gift','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1499,0,'qformat_learnwise','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1500,0,'qformat_learnwise','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1501,0,'qformat_learnwise','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1502,0,'qformat_missingword','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1503,0,'qformat_missingword','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1504,0,'qformat_missingword','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1505,0,'qformat_multianswer','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1506,0,'qformat_multianswer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1507,0,'qformat_multianswer','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1508,0,'qformat_webct','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1509,0,'qformat_webct','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1510,0,'qformat_webct','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1511,0,'qformat_xhtml','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018102),(1512,0,'qformat_xhtml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018102),(1513,0,'qformat_xhtml','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018102),(1514,0,'qformat_xml','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1515,0,'qformat_xml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1516,0,'qformat_xml','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1517,0,'tool_assignmentupgrade','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1518,0,'tool_assignmentupgrade','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1519,0,'tool_assignmentupgrade','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1520,0,'tool_capability','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1521,0,'tool_capability','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1522,0,'tool_capability','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1523,0,'tool_customlang','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1524,0,'tool_customlang','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1525,0,'tool_customlang','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1526,0,'tool_dbtransfer','2012062200','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1527,0,'tool_dbtransfer','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1528,0,'tool_dbtransfer','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1529,0,'tool_generator','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1530,0,'tool_generator','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1531,0,'tool_generator','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1532,0,'tool_health','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1533,0,'tool_health','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1534,0,'tool_health','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1535,0,'tool_innodb','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1536,0,'tool_innodb','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1537,0,'tool_innodb','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1538,0,'tool_langimport','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1539,0,'tool_langimport','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1540,0,'tool_langimport','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1541,0,'tool_multilangupgrade','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1542,0,'tool_multilangupgrade','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1543,0,'tool_multilangupgrade','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1544,0,'tool_phpunit','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1545,0,'tool_phpunit','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1546,0,'tool_phpunit','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1547,0,'tool_profiling','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1548,0,'tool_profiling','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1549,0,'tool_profiling','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1550,0,'tool_qeupgradehelper','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1551,0,'tool_qeupgradehelper','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1552,0,'tool_qeupgradehelper','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1553,0,'tool_replace','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1554,0,'tool_replace','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1555,0,'tool_replace','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1556,0,'tool_spamcleaner','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1557,0,'tool_spamcleaner','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1558,0,'tool_spamcleaner','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1559,0,'tool_timezoneimport','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1560,0,'tool_timezoneimport','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1561,0,'tool_timezoneimport','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1562,0,'tool_unsuproles','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1563,0,'tool_unsuproles','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1564,0,'tool_unsuproles','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1565,0,'tool_uploaduser','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1566,0,'tool_uploaduser','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1567,0,'tool_uploaduser','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1568,0,'tool_xmldb','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018103),(1569,0,'tool_xmldb','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1570,0,'tool_xmldb','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018103),(1571,0,'cachestore_file',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018103),(1572,0,'cachestore_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1573,0,'cachestore_file','2012112900','2012112900','Plugin installed',NULL,'',0,1363018103),(1574,0,'cachestore_memcache',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018103),(1575,0,'cachestore_memcache','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018103),(1576,0,'cachestore_memcache','2012112900','2012112900','Plugin installed',NULL,'',0,1363018103),(1577,0,'cachestore_memcached',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018103),(1578,0,'cachestore_memcached','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1579,0,'cachestore_memcached','2012112900','2012112900','Plugin installed',NULL,'',0,1363018104),(1580,0,'cachestore_mongodb',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018104),(1581,0,'cachestore_mongodb','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1582,0,'cachestore_mongodb','2012112900','2012112900','Plugin installed',NULL,'',0,1363018104),(1583,0,'cachestore_session',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018104),(1584,0,'cachestore_session','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1585,0,'cachestore_session','2012112900','2012112900','Plugin installed',NULL,'',0,1363018104),(1586,0,'cachestore_static',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018104),(1587,0,'cachestore_static','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1588,0,'cachestore_static','2012112900','2012112900','Plugin installed',NULL,'',0,1363018104),(1589,0,'theme_afterburner','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1590,0,'theme_afterburner','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1591,0,'theme_afterburner','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1592,0,'theme_anomaly','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1593,0,'theme_anomaly','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1594,0,'theme_anomaly','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1595,0,'theme_arialist','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1596,0,'theme_arialist','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1597,0,'theme_arialist','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1598,0,'theme_base','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1599,0,'theme_base','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1600,0,'theme_base','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1601,0,'theme_binarius','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1602,0,'theme_binarius','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1603,0,'theme_binarius','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1604,0,'theme_boxxie','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1605,0,'theme_boxxie','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1606,0,'theme_boxxie','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1607,0,'theme_brick','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1608,0,'theme_brick','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1609,0,'theme_brick','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1610,0,'theme_canvas','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1611,0,'theme_canvas','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1612,0,'theme_canvas','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1613,0,'theme_formal_white','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1614,0,'theme_formal_white','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1615,0,'theme_formal_white','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1616,0,'theme_formfactor','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1617,0,'theme_formfactor','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1618,0,'theme_formfactor','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1619,0,'theme_fusion','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1620,0,'theme_fusion','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1621,0,'theme_fusion','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1622,0,'theme_leatherbound','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1623,0,'theme_leatherbound','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1624,0,'theme_leatherbound','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1625,0,'theme_magazine','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1626,0,'theme_magazine','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1627,0,'theme_magazine','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1628,0,'theme_mymobile','2012061901','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1629,0,'theme_mymobile','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1630,0,'theme_mymobile','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1631,0,'theme_nimble','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1632,0,'theme_nimble','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1633,0,'theme_nimble','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1634,0,'theme_nonzero','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1635,0,'theme_nonzero','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1636,0,'theme_nonzero','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1637,0,'theme_overlay','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018104),(1638,0,'theme_overlay','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018104),(1639,0,'theme_overlay','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018104),(1640,0,'theme_serenity','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1641,0,'theme_serenity','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1642,0,'theme_serenity','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1643,0,'theme_sky_high','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1644,0,'theme_sky_high','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1645,0,'theme_sky_high','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1646,0,'theme_splash','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1647,0,'theme_splash','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1648,0,'theme_splash','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1649,0,'theme_standard','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1650,0,'theme_standard','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1651,0,'theme_standard','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1652,0,'theme_standardold','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1653,0,'theme_standardold','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1654,0,'theme_standardold','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1655,0,'assignsubmission_comments','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1656,0,'assignsubmission_comments','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1657,0,'assignsubmission_comments','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1658,0,'assignsubmission_file','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1659,0,'assignsubmission_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1660,0,'assignsubmission_file','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1661,0,'assignsubmission_onlinetext','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1662,0,'assignsubmission_onlinetext','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1663,0,'assignsubmission_onlinetext','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1664,0,'assignfeedback_comments','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1665,0,'assignfeedback_comments','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1666,0,'assignfeedback_comments','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1667,0,'assignfeedback_file','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1668,0,'assignfeedback_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1669,0,'assignfeedback_file','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1670,0,'assignfeedback_offline',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018105),(1671,0,'assignfeedback_offline','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1672,0,'assignfeedback_offline','2012112900','2012112900','Plugin installed',NULL,'',0,1363018105),(1673,0,'assignment_offline','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1674,0,'assignment_offline','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1675,0,'assignment_offline','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1676,0,'assignment_online','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1677,0,'assignment_online','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1678,0,'assignment_online','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1679,0,'assignment_upload','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1680,0,'assignment_upload','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1681,0,'assignment_upload','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1682,0,'assignment_uploadsingle','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1683,0,'assignment_uploadsingle','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1684,0,'assignment_uploadsingle','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1685,0,'booktool_exportimscp','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1686,0,'booktool_exportimscp','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1687,0,'booktool_exportimscp','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1688,0,'booktool_importhtml','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1689,0,'booktool_importhtml','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1690,0,'booktool_importhtml','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1691,0,'booktool_print','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1692,0,'booktool_print','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1693,0,'booktool_print','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1694,0,'datafield_checkbox','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1695,0,'datafield_checkbox','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1696,0,'datafield_checkbox','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1697,0,'datafield_date','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1698,0,'datafield_date','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1699,0,'datafield_date','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1700,0,'datafield_file','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1701,0,'datafield_file','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1702,0,'datafield_file','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1703,0,'datafield_latlong','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1704,0,'datafield_latlong','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1705,0,'datafield_latlong','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018105),(1706,0,'datafield_menu','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018105),(1707,0,'datafield_menu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018105),(1708,0,'datafield_menu','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1709,0,'datafield_multimenu','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1710,0,'datafield_multimenu','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1711,0,'datafield_multimenu','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1712,0,'datafield_number','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1713,0,'datafield_number','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1714,0,'datafield_number','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1715,0,'datafield_picture','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1716,0,'datafield_picture','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1717,0,'datafield_picture','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1718,0,'datafield_radiobutton','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1719,0,'datafield_radiobutton','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1720,0,'datafield_radiobutton','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1721,0,'datafield_text','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1722,0,'datafield_text','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1723,0,'datafield_text','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1724,0,'datafield_textarea','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1725,0,'datafield_textarea','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1726,0,'datafield_textarea','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1727,0,'datafield_url','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1728,0,'datafield_url','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1729,0,'datafield_url','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1730,0,'datapreset_imagegallery','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1731,0,'datapreset_imagegallery','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1732,0,'datapreset_imagegallery','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1733,0,'quiz_grading','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1734,0,'quiz_grading','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1735,0,'quiz_grading','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1736,0,'quiz_overview','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1737,0,'quiz_overview','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1738,0,'quiz_overview','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1739,0,'quiz_responses','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1740,0,'quiz_responses','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1741,0,'quiz_responses','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1742,0,'quiz_statistics','2012061801','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1743,0,'quiz_statistics','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1744,0,'quiz_statistics','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1745,0,'quizaccess_delaybetweenattempts','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1746,0,'quizaccess_delaybetweenattempts','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1747,0,'quizaccess_delaybetweenattempts','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1748,0,'quizaccess_ipaddress','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1749,0,'quizaccess_ipaddress','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1750,0,'quizaccess_ipaddress','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1751,0,'quizaccess_numattempts','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1752,0,'quizaccess_numattempts','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1753,0,'quizaccess_numattempts','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1754,0,'quizaccess_openclosedate','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1755,0,'quizaccess_openclosedate','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1756,0,'quizaccess_openclosedate','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1757,0,'quizaccess_password','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1758,0,'quizaccess_password','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1759,0,'quizaccess_password','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1760,0,'quizaccess_safebrowser','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1761,0,'quizaccess_safebrowser','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1762,0,'quizaccess_safebrowser','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018106),(1763,0,'quizaccess_securewindow','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018106),(1764,0,'quizaccess_securewindow','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018106),(1765,0,'quizaccess_securewindow','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1766,0,'quizaccess_timelimit','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1767,0,'quizaccess_timelimit','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1768,0,'quizaccess_timelimit','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1769,0,'scormreport_basic','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1770,0,'scormreport_basic','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1771,0,'scormreport_basic','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1772,0,'scormreport_graphs','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1773,0,'scormreport_graphs','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1774,0,'scormreport_graphs','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1775,0,'scormreport_interactions','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1776,0,'scormreport_interactions','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1777,0,'scormreport_interactions','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1778,0,'workshopform_accumulative','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1779,0,'workshopform_accumulative','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1780,0,'workshopform_accumulative','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1781,0,'workshopform_comments','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1782,0,'workshopform_comments','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1783,0,'workshopform_comments','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1784,0,'workshopform_numerrors','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1785,0,'workshopform_numerrors','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1786,0,'workshopform_numerrors','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1787,0,'workshopform_rubric','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1788,0,'workshopform_rubric','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1789,0,'workshopform_rubric','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1790,0,'workshopallocation_manual','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1791,0,'workshopallocation_manual','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1792,0,'workshopallocation_manual','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1793,0,'workshopallocation_random','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1794,0,'workshopallocation_random','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1795,0,'workshopallocation_random','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1796,0,'workshopallocation_scheduled','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1797,0,'workshopallocation_scheduled','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1798,0,'workshopallocation_scheduled','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1799,0,'workshopeval_best','2012061700','2012112900','Starting plugin upgrade',NULL,'',0,1363018107),(1800,0,'workshopeval_best','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1801,0,'workshopeval_best','2012112900','2012112900','Plugin upgraded',NULL,'',0,1363018107),(1802,0,'tinymce_dragmath',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018107),(1803,0,'tinymce_dragmath','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1804,0,'tinymce_dragmath','2012112900','2012112900','Plugin installed',NULL,'',0,1363018107),(1805,0,'tinymce_moodleemoticon',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018107),(1806,0,'tinymce_moodleemoticon','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1807,0,'tinymce_moodleemoticon','2012112900','2012112900','Plugin installed',NULL,'',0,1363018107),(1808,0,'tinymce_moodleimage',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018107),(1809,0,'tinymce_moodleimage','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1810,0,'tinymce_moodleimage','2012112900','2012112900','Plugin installed',NULL,'',0,1363018107),(1811,0,'tinymce_moodlemedia',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018107),(1812,0,'tinymce_moodlemedia','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1813,0,'tinymce_moodlemedia','2012112900','2012112900','Plugin installed',NULL,'',0,1363018107),(1814,0,'tinymce_moodlenolink',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018107),(1815,0,'tinymce_moodlenolink','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1816,0,'tinymce_moodlenolink','2012112900','2012112900','Plugin installed',NULL,'',0,1363018107),(1817,0,'tinymce_spellchecker',NULL,'2012112900','Starting plugin installation',NULL,'',0,1363018107),(1818,0,'tinymce_spellchecker','2012112900','2012112900','Upgrade savepoint reached',NULL,'',0,1363018107),(1819,0,'tinymce_spellchecker','2012112900','2012112900','Plugin installed',NULL,'',0,1363018107);
/*!40000 ALTER TABLE `mdl_upgrade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_url`
--

DROP TABLE IF EXISTS `mdl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_url`
--

LOCK TABLES `mdl_url` WRITE;
/*!40000 ALTER TABLE `mdl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(70) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user`
--

LOCK TABLES `mdl_user` WRITE;
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` VALUES (1,'manual',1,0,0,0,1,'guest','b6644817188e1822322f0cdf01d418ed','','Гость',' ','root@localhost',0,'','','','','','','','','','','','','ru','','99',0,0,0,0,'','',0,'','Этот - специальный пользователь, которому разрешён доступ только на чтение к некоторым курсам.',0,1,0,2,1,1,0,0,1352713751,0,NULL),(2,'manual',1,0,0,0,1,'admin','f93fbe061b3209d3d378394df6012498','','Администратор','Пользователь','kirill.kaplin@opensoftdev.ru',0,'','','','','','','','','','','Саратов','RU','ru','','99',1352714686,1363682012,1363152419,1363681474,'10.7.0.48','HBHoyw5Qd5anoji',0,'',NULL,0,1,0,1,1,1,0,0,1353058218,0,NULL),(3,'manual',1,0,0,0,1,'alena','1fb62612c19e9c304e5ff137423754d5','','Алена','Михеева','a.miheeva@s-zl.ru',0,'','','','','','','','','','','Саратов','RU','ru','','99',1358936145,1358945994,1358936145,1358936819,'10.7.7.11','',0,'','',1,1,0,2,1,1,0,1358936021,1358936021,0,NULL);
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_enrolments`
--

DROP TABLE IF EXISTS `mdl_user_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_enrolments`
--

LOCK TABLES `mdl_user_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_user_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_category`
--

LOCK TABLES `mdl_user_info_category` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_data`
--

LOCK TABLES `mdl_user_info_data` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_field`
--

LOCK TABLES `mdl_user_info_field` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_lastaccess`
--

LOCK TABLES `mdl_user_lastaccess` WRITE;
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_preferences`
--

LOCK TABLES `mdl_user_preferences` WRITE;
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` VALUES (1,2,'email_bounce_count','1'),(2,2,'email_send_count','1'),(3,2,'docked_block_instance_4','0'),(4,2,'docked_block_instance_5','0'),(5,3,'auth_forcepasswordchange','0'),(6,3,'email_bounce_count','1'),(7,3,'email_send_count','1'),(8,2,'userselector_preserveselected','0'),(9,2,'userselector_autoselectunique','0'),(10,2,'userselector_searchanywhere','0');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_private_key`
--

LOCK TABLES `mdl_user_private_key` WRITE;
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_webdav_locks`
--

DROP TABLE IF EXISTS `mdl_webdav_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource locks for WebDAV users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_webdav_locks`
--

LOCK TABLES `mdl_webdav_locks` WRITE;
/*!40000 ALTER TABLE `mdl_webdav_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_webdav_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki`
--

LOCK TABLES `mdl_wiki` WRITE;
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_links`
--

DROP TABLE IF EXISTS `mdl_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_links`
--

LOCK TABLES `mdl_wiki_links` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_locks`
--

LOCK TABLES `mdl_wiki_locks` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_pages`
--

LOCK TABLES `mdl_wiki_pages` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_subwikis`
--

DROP TABLE IF EXISTS `mdl_wiki_subwikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_subwikis`
--

LOCK TABLES `mdl_wiki_subwikis` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_synonyms`
--

DROP TABLE IF EXISTS `mdl_wiki_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_synonyms`
--

LOCK TABLES `mdl_wiki_synonyms` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_versions`
--

DROP TABLE IF EXISTS `mdl_wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_versions`
--

LOCK TABLES `mdl_wiki_versions` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop`
--

LOCK TABLES `mdl_workshop` WRITE;
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_aggregations`
--

DROP TABLE IF EXISTS `mdl_workshop_aggregations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_aggregations`
--

LOCK TABLES `mdl_workshop_aggregations` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments`
--

LOCK TABLES `mdl_workshop_assessments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments_old`
--

LOCK TABLES `mdl_workshop_assessments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_comments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_comments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_comments_old`
--

LOCK TABLES `mdl_workshop_comments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_elements_old`
--

DROP TABLE IF EXISTS `mdl_workshop_elements_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_elements_old`
--

LOCK TABLES `mdl_workshop_elements_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades`
--

LOCK TABLES `mdl_workshop_grades` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades_old`
--

DROP TABLE IF EXISTS `mdl_workshop_grades_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades_old`
--

LOCK TABLES `mdl_workshop_grades_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_old`
--

DROP TABLE IF EXISTS `mdl_workshop_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_old`
--

LOCK TABLES `mdl_workshop_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_rubrics_old`
--

LOCK TABLES `mdl_workshop_rubrics_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_stockcomments_old`
--

LOCK TABLES `mdl_workshop_stockcomments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions`
--

LOCK TABLES `mdl_workshop_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions_old`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions_old`
--

LOCK TABLES `mdl_workshop_submissions_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

DROP TABLE IF EXISTS `mdl_workshopallocation_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopallocation_scheduled`
--

LOCK TABLES `mdl_workshopallocation_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

DROP TABLE IF EXISTS `mdl_workshopeval_best_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopeval_best_settings`
--

LOCK TABLES `mdl_workshopeval_best_settings` WRITE;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_accumulative`
--

DROP TABLE IF EXISTS `mdl_workshopform_accumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_accumulative`
--

LOCK TABLES `mdl_workshopform_accumulative` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_comments`
--

DROP TABLE IF EXISTS `mdl_workshopform_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_comments`
--

LOCK TABLES `mdl_workshopform_comments` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors`
--

LOCK TABLES `mdl_workshopform_numerrors` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors_map`
--

LOCK TABLES `mdl_workshopform_numerrors_map` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric`
--

LOCK TABLES `mdl_workshopform_rubric` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_config`
--

LOCK TABLES `mdl_workshopform_rubric_config` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_levels`
--

LOCK TABLES `mdl_workshopform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-19 12:49:06
