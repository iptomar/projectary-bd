-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: projectary-master
-- ------------------------------------------------------
-- Server version	5.5.55-0+deb8u1

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
-- Current Database: `projectary-master`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `projectary-master` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `projectary-master`;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `groupid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `submitedin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approvedin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`groupid`,`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Attributes Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) COLLATE utf8_bin NOT NULL,
  `schoolid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Eng Informatica',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseyear`
--

DROP TABLE IF EXISTS `courseyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseyear` (
  `course` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`course`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseyear`
--

LOCK TABLES `courseyear` WRITE;
/*!40000 ALTER TABLE `courseyear` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_desc_uindex` (`desc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupuser`
--

DROP TABLE IF EXISTS `groupuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupuser` (
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `grade` decimal(10,0) NOT NULL DEFAULT '0',
  `approvedin` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`groupid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupuser`
--

LOCK TABLES `groupuser` WRITE;
/*!40000 ALTER TABLE `groupuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approvedin` timestamp NULL DEFAULT NULL,
  `year` year(4) NOT NULL,
  `courseid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `userid` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,NULL,2017,1,'projecto de testes','descricao de testes',1,'2017-04-21 19:51:09'),(2,NULL,2017,1,'projecto de testes','descricao de testes',1,'2017-04-21 19:51:12'),(3,NULL,2017,1,'projecto de testes','descricao de testes',1,'2017-04-21 19:51:12'),(4,NULL,2017,1,'projecto de testes','descricao de testes',1,'2017-04-21 19:51:13');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectattribute`
--

DROP TABLE IF EXISTS `projectattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectattribute` (
  `projectid` int(11) NOT NULL,
  `attributeid` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`projectid`,`attributeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectattribute`
--

LOCK TABLES `projectattribute` WRITE;
/*!40000 ALTER TABLE `projectattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'ESTT');
INSERT INTO `school` VALUES (2,'ESTG');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Types Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'student'),(2,'teacher');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `photo` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'default_photo.png',
  `external_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `typeid` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phonenumber` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_external_id_uindex` (`external_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Aluno testes','default_photo.png','1234',1,'1@ipt.pt','1234567789',0,'46f94c8de14fb36680850768ff1b7f2a',0,1),(4,'Aluno testes','default_photo.png','12345',1,'2@ipt.pt','1234567789',0,'46f94c8de14fb36680850768ff1b7f2a',0,1),(5,'Aluno testes','default_photo.png','123456',1,'3@ipt.pt','1234567789',0,'46f94c8de14fb36680850768ff1b7f2a',0,1),(7,'Aluno testes','default_photo.png','12345678',1,'5@ipt.pt','1234567789',0,'46f94c8de14fb36680850768ff1b7f2a',0,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userattribute`
--

DROP TABLE IF EXISTS `userattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userattribute` (
  `userid` int(11) NOT NULL,
  `attributeid` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`userid`,`attributeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userattribute`
--

LOCK TABLES `userattribute` WRITE;
/*!40000 ALTER TABLE `userattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `userattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'projectary-master'
--
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewAdmin`(IN `newadminentity` VARCHAR(255), IN `entity` VARCHAR(255))
BEGIN
 Insert INTO admin (ID,createdin,updatedin,createdby)VALUES (newadminentity,NOW(),NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewApplication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewApplication`(IN entity VARCHAR(255))
BEGIN
  DECLARE GEUUID VARCHAR(255);
  DECLARE APPUUID VARCHAR(255);
  DECLARE EFUNCUUID VARCHAR(255);
  SELECT UUID() INTO GEUUID;
  SELECT UUID() INTO APPUUID;
  SELECT id FROM function WHERE `desc`="Student" INTO EFUNCUUID;
  INSERT INTO groupentity (id,entity,function,createdin,createdby) VALUES (GEUUID,entity,EFUNCUUID,NOW(),entity);
  INSERT INTO application VALUES (APPUUID,entity,NOW());
  INSERT INTO applicationgroup VALUES (APPUUID,GEUUID,NOW(),entity);
  SELECT APPUUID, GEUUID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewApplicationAttribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewApplicationAttribute`(IN `application` VARCHAR(255),IN `attribute` VARCHAR(255),IN `value` VARCHAR(255),IN `entity` VARCHAR(255))
BEGIN
   INSERT INTO applicationattribute VALUES (application,attribute,value,NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewAtribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewAtribute`(IN `description` VARCHAR(255),IN `datatype` VARCHAR(255))
BEGIN
   DECLARE UUID VARCHAR(255);
   SELECT UUID() INTO UUID;
   INSERT INTO attribute VALUES (UUID,description,datatype);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewFunction`(IN `description` VARCHAR(255),IN `entity` VARCHAR(255))
BEGIN
    DECLARE UUID VARCHAR(255);
    SELECT UUID() INTO UUID;
   INSERT INTO function VALUES (UUID,description,NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewProject`(IN `application` VARCHAR(255),IN `entity` VARCHAR(255))
BEGIN
    DECLARE UUID VARCHAR(255);
    SELECT UUID() INTO UUID;
    INSERT INTO project VALUES (UUID,application,entity,NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewProjectRevision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewProjectRevision`(IN `project` VARCHAR(255),IN `start` DATE,IN `end` DATE,IN `entity` VARCHAR(255))
BEGIN
    DECLARE UUID VARCHAR(255);
    SELECT UUID() INTO UUID;
    INSERT INTO projectrev VALUES (UUID,project,start,end,NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewProjectRevisionEntity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewProjectRevisionEntity`(IN `projectrev` VARCHAR(255),IN `projentity` VARCHAR(255),IN `function` VARCHAR(255),IN `entity` VARCHAR(255))
BEGIN
    DECLARE UUID VARCHAR(255);
    SELECT UUID() INTO UUID;
    INSERT INTO projectreventity VALUES (projectrev,projentity,function,NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewProjectRevisionLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewProjectRevisionLog`(IN `projectrev` VARCHAR(255),IN `textlog` LONGTEXT,IN `entity` VARCHAR(255))
BEGIN
    DECLARE UUID VARCHAR(255);
    SELECT UUID() INTO UUID;
    INSERT INTO projectrevlog VALUES (UUID,projectrev,textlog,NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewProjectRevisionLogDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewProjectRevisionLogDoc`(IN `projectrevlog` VARCHAR(255),IN `doc` LONGBLOB,IN `url` LONGTEXT,IN `entity` VARCHAR(255))
BEGIN
    DECLARE UUID VARCHAR(255);
    SELECT UUID() INTO UUID;
    INSERT INTO projectrevlogdoc VALUES (UUID,projectrevlog,doc,url,NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewSchool` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewSchool`(IN `description` VARCHAR(255))
BEGIN
    DECLARE UUID VARCHAR(255);
    SELECT UUID() INTO UUID;
    INSERT INTO school VALUES (UUID,description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewSchoolEntity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewSchoolEntity`(IN `school` VARCHAR(255),IN `entity` VARCHAR(255))
BEGIN
    INSERT INTO schoolentity VALUES (school,entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertNewUser`(IN username VARCHAR(255), IN password VARCHAR(255), IN name VARCHAR(255),
                                   IN email    VARCHAR(255), IN type INT(1), IN extid VARCHAR(255))
BEGIN
 DECLARE UUID VARCHAR(255);
    CASE
    WHEN type=1 THEN CALL InsertNewEntity(name,type,extid);SELECT id from student where studentid=extid INTO UUID;
    WHEN type=2 THEN CALL InsertNewEntity(name,type,extid);SELECT id from teacher where teacherid=extid INTO UUID;
    END CASE;

    INSERT INTO user (id,username,password,email,createdin,locked,active)VALUES(UUID,username,password,email,NOW(),0,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_InsertProjectWeb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_InsertProjectWeb`(IN `id` VARCHAR(255),IN `entity` VARCHAR(255))
BEGIN
  INSERT INTO application VALUES (ID,NOW(),entity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_IsAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_IsAdmin`(IN `entity` VARCHAR(255))
BEGIN
 DECLARE ADMIN INT(1);
    SELECT count(a.id) from admin as a where a.id=entity INTO ADMIN;
    CASE
      WHEN ADMIN <1 THEN SELECT 'false';
      WHEN ADMIN =1 THEN SELECT 'true';
      WHEN ADMIN >1 THEN SELECT 'false';
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_ListEntities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_ListEntities`(IN `type`  INT(11), IN `extid` VARCHAR(255), IN `name` VARCHAR(255), IN `id` VARCHAR(255))
BEGIN
CASE
WHEN type=1 THEN SELECT e.id,e.name,s.studentid from entity as e,student as s where ((e.id=s.id and s.studentid like CONCAT(CONCAT('%',extid),'%') and e.name like CONCAT(CONCAT('%',name),'%')) OR (e.id=s.id and e.id LIKE CONCAT(CONCAT('%',id),'%') and e.name like CONCAT(CONCAT('%',name),'%')));
WHEN type=2 THEN SELECT e.id,e.name,t.teacherid from entity as e,teacher as t where ((e.id=t.id and t.teacherid like CONCAT(CONCAT('%',extid),'%') and e.name like CONCAT(CONCAT('%',name),'%')) OR (e.id=t.id and e.id LIKE CONCAT(CONCAT('%',id),'%') and e.name like CONCAT(CONCAT('%',name),'%')));
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_ListProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_ListProjects`(IN `approved` INT(11))
BEGIN
CASE
WHEN approved=0 THEN SELECT a.id,a.submitedby,a.submitedin from application as a,project as p,applicationattribute as appattr,attribute as attr where a.id<>p.application and a.id=appattr.application and appattr.application=attr.id;
WHEN approved=1 THEN SELECT p.id,p.approvedby,p.approvedin,a.submitedby from application as a,project as p,applicationattribute as appattr,attribute as attr where a.id=p.application and a.id=appattr.application and appattr.application=attr.id;
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_LoginChallenge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_LoginChallenge`(IN username VARCHAR(255))
BEGIN
    DECLARE RESULT INT(1);
    SELECT COUNT(u.entity) FROM users AS u WHERE u.username=username INTO RESULT;
CASE
  WHEN RESULT<1 THEN SELECT '0','0';
  WHEN RESULT=1 THEN SELECT u.entity,u.password FROM users AS u WHERE u.username=username;
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_UserExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `API_UserExists`(IN type INT(1), IN username VARCHAR(255), IN extid VARCHAR(255))
BEGIN
 DECLARE UserExists INT(1);
 DECLARE EntityExists INT(1);
 DECLARE UserActive INT(1);
 DECLARE UserLocked INT(1);
 SET UserExists :=0;
 SET EntityExists :=0;
 SET UserActive :=0;
 SET UserLocked :=0;
    CASE
    WHEN type=1 THEN SELECT COUNT(id) FROM user where user.username=username INTO UserExists;SELECT COUNT(id) from student as s where s.studentid=extid INTO EntityExists;SELECT locked from user where id=any(select id from student where studentid=extid) or username=username INTO UserLocked;SELECT active from user where id=any(select id from student where studentid=extid) or username=username INTO UserActive;SELECT UserExists,EntityExists,UserLocked,UserActive;
    WHEN type=2 THEN SELECT COUNT(id) FROM user where user.username=username INTO UserExists;SELECT COUNT(id) from teacher as t where t.teacherid=extid INTO EntityExists;SELECT locked from user where id=any(select id from teacher where teacherid=extid) or username=username INTO UserLocked;SELECT active from user where id=any(select id from teacher where teacherid=extid) or username=username INTO UserActive;SELECT UserExists,EntityExists,UserLocked,UserActive;
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUserAttribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteUserAttribute`(IN userid INT,IN attributeid INT,IN value VARCHAR(255))
BEGIN
    DELETE from userattribute where userattribute.userid=@userid and userattribute.attributeid=@attributeid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertNewCourseYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNewCourseYear`(IN course INT, IN year YEAR(4),IN active BOOLEAN)
BEGIN
 Insert INTO courseyear (course,year,active)VALUES (course,year,active);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNewUser`(IN name VARCHAR(255), IN type INT, IN extid VARCHAR(255))
BEGIN
 DECLARE UUID VARCHAR(255);
CASE
WHEN type=1 THEN  SELECT UUID() INTO UUID;Insert INTO entity VALUES (UUID,name,NOW());INSERT INTO student VALUES(UUID,extid);
WHEN type=2 THEN  SELECT UUID() INTO UUID;Insert INTO entity VALUES (UUID,name,NOW());INSERT INTO teacher VALUES(UUID,extid);
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertUserAttribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `InsertUserAttribute`(IN userid INT,IN attributeid INT,IN value VARCHAR(255))
BEGIN
		INSERT INTO userattribute VALUES (userid,attributeid,value);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateUserAttribute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UpdateUserAttribute`(IN userid INT,IN attributeid INT,IN value VARCHAR(255))
BEGIN
    UPDATE userattribute set value=@value where userattribute.userid=@userid and userattribute.attributeid=@attributeid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05 20:01:24

/* Content from projectary-db-dump */
DROP PROCEDURE IF EXISTS isAdmin;
DELIMITER $$
CREATE PROCEDURE isAdmin(IN id INT, OUT isAdmin BOOLEAN)
BEGIN
	SET isAdmin = (SELECT u.isadmin FROM user u WHERE u.id = id);
END$$
DELIMITER ;


-- isteacher --
DROP PROCEDURE IF EXISTS isTeacher;
DELIMITER $$
CREATE PROCEDURE isTeacher(IN id INT, OUT isTeacher BOOLEAN)
BEGIN
	SET isTeacher = (SELECT EXISTS(SELECT * FROM user u, type t WHERE u.id = id AND u.typeid = t.id AND t.`desc` LIKE "teacher"));
END$$
DELIMITER ;


-- isStudent --
DROP PROCEDURE IF EXISTS isStudent;
DELIMITER $$
CREATE PROCEDURE isStudent(IN id INT, OUT isStudent BOOLEAN)
BEGIN
	SET isStudent = (SELECT EXISTS(SELECT * FROM user u, type t WHERE u.id = id AND u.typeid = t.id AND t.`desc` LIKE "student"));
END$$
DELIMITER ;


-- isInGroup --
DROP PROCEDURE IF EXISTS isInGroup;
DELIMITER $$
CREATE PROCEDURE isInGroup(IN userid INT, IN groupid INT, OUT isInGroup BOOLEAN)
BEGIN
	SET isInGroup = (SELECT EXISTS(SELECT * FROM groupuser gu WHERE gu.userid = userid AND gu.groupid = groupid));
END$$
DELIMITER ;


-- isInProject --
DROP PROCEDURE IF EXISTS isInProject;
DELIMITER $$
CREATE PROCEDURE isInProject(IN userid INT, OUT isInProject BOOLEAN)
BEGIN
	SET isInProject = (SELECT EXISTS(SELECT * FROM groupuser gu, application a WHERE gu.userid = userid AND gu.groupid = a.groupid AND YEAR(a.approvedin) != 0000));
END$$
DELIMITER ;


-- addToGroup --
DROP PROCEDURE IF EXISTS addToGroup;
DELIMITER $$
CREATE PROCEDURE addToGroup(IN userid INT, IN groupid INT, IN password VARCHAR(255), OUT state BOOLEAN)
BEGIN
	SET state = FALSE;
	CALL isInProject(userid, @project);
	IF (@project = FALSE) THEN
		CALL isInGroup(userid, groupid, @isInGroup);
        IF (@isInGroup = FALSE) THEN
			IF (SELECT EXISTS(SELECT * FROM `group` g WHERE g.id = groupid AND g.password = password)) THEN
				INSERT INTO groupuser(groupid, userid)
					VALUES (groupid, userid);
                    SET state = TRUE;
			END IF;
		END IF;
	END IF;
END$$
DELIMITER ;


-- insertNewGroup --
DROP PROCEDURE IF EXISTS insertNewGroup;
DELIMITER $$
CREATE PROCEDURE insertNewGroup(IN userid INT, IN description VARCHAR(255), IN password VARCHAR(255), OUT groupid INT)
BEGIN
	CALL isInProject(userid, @project);
	IF (@project=FALSE) THEN
		INSERT INTO `group`(`desc`, password)
			VALUES (description, password);
		SET groupid = (SELECT g.id FROM `group` g WHERE g.`desc` = description AND g.password = password);
		INSERT INTO groupuser (groupid, userid)
			VALUES (groupid, userid);
	END IF;
END$$
DELIMITER ;

-- insertNewApplication --
DROP PROCEDURE IF EXISTS insertNewApplication;
DELIMITER $$
CREATE PROCEDURE insertNewApplication(IN userid INT, IN groupid INT, IN projectid INT, OUT state BOOLEAN)
BEGIN
	SET state = FALSE;
	CALL isStudent(userid, @student);
	IF (@student = TRUE) THEN
		CALL isInGroup(userid, groupid, @isInGroup);
        IF (@isInGroup = TRUE) THEN
			CALL isInProject(userid, @project);
			IF (@project = FALSE) THEN
				IF (SELECT EXISTS(SELECT * FROM project p WHERE p.id = projectid AND p.approvedin IS NOT NULL)) THEN
					INSERT INTO application(groupid, projectid, submitedin)
						VALUES (groupid, projectid, NOW());
						SET state = TRUE;
				END IF;
			END IF;
		END IF;
	END IF;
END$$
DELIMITER ;

-- listCouses --
DROP PROCEDURE IF EXISTS listCouses;
DELIMITER $$
CREATE PROCEDURE listCouses (IN schoolid INT)
BEGIN
	SELECT c.`desc` as 'course' FROM course c WHERE c.schoolid = schoolid;
END$$
DELIMITER ;

-- listSchools --
DROP PROCEDURE IF EXISTS listSchools;
DELIMITER $$
CREATE PROCEDURE listSchools ()
BEGIN
	SELECT s.`desc` as 'school' FROM school s;
END$$
DELIMITER ;

-- listApplications --
DROP PROCEDURE IF EXISTS listApplications;
DELIMITER $$
CREATE PROCEDURE listApplications (IN projectid INT, IN approved INT)
BEGIN
	CASE
		WHEN approved = 0 THEN
			IF (projectid > 0) THEN
				SELECT a.groupid, a.submitedin, a.approvedin FROM application a WHERE a.projectid = projectid AND YEAR(a.approvedin) = 0000;
			ELSE
				SELECT a.groupid, a.projectid, a.submitedin, a.approvedin FROM application a WHERE YEAR(a.approvedin) = 0000;
			END IF;
		WHEN approved = 1 THEN
			IF (projectid > 0) THEN
				SELECT a.groupid, a.submitedin, a.approvedin FROM application a WHERE a.projectid = projectid AND YEAR(a.approvedin) != 0000;
			ELSE
				SELECT a.groupid, a.projectid, a.submitedin, a.approvedin FROM application a WHERE YEAR(a.approvedin) != 0000;
			END IF;
	END CASE;
END$$
DELIMITER ;

-- insertNewCourse --
DROP PROCEDURE IF EXISTS insertNewCourse;
DELIMITER $$
CREATE PROCEDURE insertNewCourse (IN schoolid INT, IN description VARCHAR(255))
BEGIN
	INSERT INTO course (schoolid, `desc`)
		VALUES (schoolid, description);
END$$
DELIMITER ;

-- insertNewType --
DROP PROCEDURE IF EXISTS insertNewType;
DELIMITER $$
CREATE PROCEDURE insertNewType (IN description VARCHAR(255))
BEGIN
	INSERT INTO type (`desc`)
		VALUES (description);
END$$
DELIMITER ;

-- insertNewProject --
DROP PROCEDURE IF EXISTS insertNewProject;
DELIMITER $$
CREATE PROCEDURE insertNewProject (IN schoolyear YEAR, IN courseid INT, IN name VARCHAR(255), IN description VARCHAR(255), IN userid INT)
BEGIN
	CALL isTeacher (userid, @teacher);
    IF (@teacher = 1) THEN
		INSERT INTO project (approvedin, year, courseid, name, description, userid, created)
			VALUES (NOW(), schoolyear, courseid, name, description, userid, NOW());
	ELSE
		INSERT INTO project (year, courseid, name, description, userid, created)
			VALUES (schoolyear, courseid, name, description, userid, NOW());
	END IF;
END$$
DELIMITER ;

-- listProjects --
DROP PROCEDURE IF EXISTS listProjects;
DELIMITER $$
CREATE PROCEDURE listProjects (IN courseid INT, IN schoolyear YEAR, IN approved INT)
BEGIN
	CASE
		WHEN approved = 0 THEN
				SELECT * FROM project p WHERE p.courseid = courseid AND p.year = schoolyear AND YEAR(p.approvedin) IS NULL;
		WHEN approved = 1 THEN
				SELECT * FROM project p WHERE p.courseid = courseid AND p.year = schoolyear AND YEAR(p.approvedin) IS NOT NULL;
	END CASE;
END$$
DELIMITER ;
