-- MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = 'SYSTEM';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DELIMITER ;;

DROP PROCEDURE IF EXISTS `InsertNewEntity`;;
CREATE DEFINER=`root`@`192.168.122.%` PROCEDURE `InsertNewEntity`(IN `name`      VARCHAR(255), IN `type` INT(11), IN `studentid` VARCHAR(255),
                                   IN `teacherid` VARCHAR(255))
BEGIN
 DECLARE UUID VARCHAR(255);
 SELECT UUID() INTO UUID;
 Insert INTO entity VALUES (UUID,name,NOW());
CASE
WHEN type=1 THEN INSERT INTO student VALUES(UUID,studentid);
WHEN type=2 THEN INSERT INTO teacher VALUES(UUID,teacherid);
END CASE;
END;;

DROP PROCEDURE IF EXISTS `ListEntities`;;
CREATE DEFINER=`root`@`192.168.122.%` PROCEDURE `ListEntities`(IN `type` INT(11), IN `studentid` VARCHAR(255),IN `teacheris` VARCHAR(255),IN id VARCHAR(255))
BEGIN
CASE
WHEN type=1 THEN SELECT e.id,e.name,s.studentid from entity as e,student as s where (e.id=s.id and s.studentid like CONCAT(CONCAT('%',@studentid),'%') OR (e.id=s.id and e.id LIKE CONCAT(CONCAT('%',@id),'%')));
WHEN type=2 THEN SELECT e.id,e.name,t.teacherid from entity as e,teacher as t where (e.id=t.id and t.teacherid like CONCAT(CONCAT('%',@teacherid),'%') OR (e.id=t.id and e.id LIKE CONCAT(CONCAT('%',@id),'%')));
END CASE;
END;;

DELIMITER ;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_desc_uindex` (`desc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `entity`;
CREATE TABLE `entity` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `role` varchar(255) COLLATE utf8_bin NOT NULL,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deletedin` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_role_fk` (`role`),
  KEY `admin_createdby_fk` (`createdby`),
  CONSTRAINT `admin_createdby_fk` FOREIGN KEY (`createdby`) REFERENCES `entity` (`id`),
  CONSTRAINT `admin_entity_fk` FOREIGN KEY (`id`) REFERENCES `entity` (`id`),
  CONSTRAINT `admin_role_fk` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `submitedby` varchar(255) COLLATE utf8_bin NOT NULL,
  `submitedin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `application_entity_fk` (`submitedby`),
  CONSTRAINT `application_entity_fk` FOREIGN KEY (`submitedby`) REFERENCES `entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin NOT NULL,
  `datatype` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `applicationattribute`;
CREATE TABLE `applicationattribute` (
  `application` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attribute` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`application`,`attribute`),
  KEY `applicationattribute_attribute_fk` (`attribute`),
  CONSTRAINT `applicationattribute_application_fk` FOREIGN KEY (`application`) REFERENCES `application` (`id`),
  CONSTRAINT `applicationattribute_attribute_fk` FOREIGN KEY (`attribute`) REFERENCES `attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `application` varchar(255) COLLATE utf8_bin NOT NULL,
  `approvedby` varchar(255) COLLATE utf8_bin NOT NULL,
  `approvedin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_application_uindex` (`application`),
  KEY `project_entity_fk` (`approvedby`),
  CONSTRAINT `project_application_fk` FOREIGN KEY (`application`) REFERENCES `application` (`id`),
  CONSTRAINT `project_entity_fk` FOREIGN KEY (`approvedby`) REFERENCES `entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `projectrev`;
CREATE TABLE `projectrev` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `project` varchar(255) COLLATE utf8_bin NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projectrev_proj_fk` (`project`),
  KEY `projectrev_entity_fk` (`createdby`),
  CONSTRAINT `projectrev_entity_fk` FOREIGN KEY (`createdby`) REFERENCES `entity` (`id`),
  CONSTRAINT `projectrev_proj_fk` FOREIGN KEY (`project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `projectreventity`;
CREATE TABLE `projectreventity` (
  `projectrev` varchar(255) COLLATE utf8_bin NOT NULL,
  `entity` varchar(255) COLLATE utf8_bin NOT NULL,
  `function` varchar(255) COLLATE utf8_bin NOT NULL,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`projectrev`,`entity`,`function`),
  KEY `projectreventity_function_fk` (`function`),
  KEY `projectreventity_project_index` (`projectrev`),
  KEY `projectreventity_entity2_fk` (`entity`),
  CONSTRAINT `projectreventity_entity2_fk` FOREIGN KEY (`entity`) REFERENCES `entity` (`id`),
  CONSTRAINT `projectreventity_entity_fk` FOREIGN KEY (`entity`) REFERENCES `entity` (`id`),
  CONSTRAINT `projectreventity_function_fk` FOREIGN KEY (`function`) REFERENCES `function` (`id`),
  CONSTRAINT `projectreventity_projrev_fk` FOREIGN KEY (`projectrev`) REFERENCES `projectrev` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `projectrevlog`;
CREATE TABLE `projectrevlog` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `project` varchar(255) COLLATE utf8_bin NOT NULL,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projectlogs_projrev_fk` (`project`),
  KEY `projectlogs_entity_fk` (`createdby`),
  CONSTRAINT `projectlogs_entity_fk` FOREIGN KEY (`createdby`) REFERENCES `entity` (`id`),
  CONSTRAINT `projectlogs_projrev_fk` FOREIGN KEY (`project`) REFERENCES `projectrev` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `projectrevlogdoc`;
CREATE TABLE `projectrevlogdoc` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `projectrevlog` varchar(255) COLLATE utf8_bin NOT NULL,
  `doc` longblob,
  `url` longtext COLLATE utf8_bin,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `projectrevlogdoc_prjrevlog_fk` (`projectrevlog`),
  CONSTRAINT `projectrevlogdoc_prjrevlog_fk` FOREIGN KEY (`projectrevlog`) REFERENCES `projectrevlog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `role` varchar(255) COLLATE utf8_bin NOT NULL,
  `permission` varchar(255) COLLATE utf8_bin NOT NULL,
  `select` tinyint(1) NOT NULL DEFAULT '0',
  `insert` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role`,`permission`),
  KEY `rolepermission_permisison_fk` (`permission`),
  CONSTRAINT `rolepermission_permisison_fk` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`),
  CONSTRAINT `rolepermission_role_fk` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `desc` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `schoolentity`;
CREATE TABLE `schoolentity` (
  `school` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `entity` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`school`,`entity`),
  KEY `schoolentity_entity_fk` (`entity`),
  CONSTRAINT `schoolentity_entity_fk` FOREIGN KEY (`entity`) REFERENCES `entity` (`id`),
  CONSTRAINT `schoolentity_school_fk` FOREIGN KEY (`school`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `studentid` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_studentid_uindex` (`studentid`),
  CONSTRAINT `student_id_fk` FOREIGN KEY (`id`) REFERENCES `entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `teacherid` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_teacherid_uindex` (`teacherid`),
  CONSTRAINT `teacher_fk` FOREIGN KEY (`id`) REFERENCES `entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `createdin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `locked` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `entity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_uindex` (`username`),
  KEY `users_entity_fk` (`entity`),
  CONSTRAINT `users_entity_fk` FOREIGN KEY (`entity`) REFERENCES `entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- 2017-03-10 17:13:03
