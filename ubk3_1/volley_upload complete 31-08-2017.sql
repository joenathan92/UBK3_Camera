CREATE DATABASE  IF NOT EXISTS `volley_upload` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `volley_upload`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: volley_upload
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `volley_upload`
--

DROP TABLE IF EXISTS `volley_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volley_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nik` varchar(10) DEFAULT NULL,
  `photo` text,
  `description` varchar(500) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volley_upload`
--

LOCK TABLES `volley_upload` WRITE;
/*!40000 ALTER TABLE `volley_upload` DISABLE KEYS */;
INSERT INTO `volley_upload` VALUES (33,'123','http://192.168.113.110/android/upload_image/images/nw6hr85ind33en6v341f.png','asd',NULL),(34,'123','http://192.168.113.110/android/upload_image/images/81xx3hpds04y9a3hb3az.png','asd',NULL),(35,'123','http://192.168.113.110/android/upload_image/images/9tjk6d30ivy9wwejyp9q.png','asd',NULL),(36,'123','http://192.168.113.110/android/upload_image/images/q9fbtfwvpk6srbe2xhjd.png','dsasdasdasdasda',NULL),(37,'1234','http://192.168.113.110/android/upload_image/images/sc03jzbpu25dgc5yy0bv.png','dsasdasdasdasda',NULL),(38,'12346','http://192.168.113.110/android/upload_image/images/qviiuhe63sd6frjkemi7.png','dsasdasdasdasda',NULL),(39,'12346','http://192.168.113.110/android/upload_image/images/2ypvczix7jr10dsnq6q5.png','dsasdasdasdasda',NULL),(40,'123467777','http://192.168.113.110/android/upload_image/images/tbvgquk0meiqjt3gzk4r.png','66',NULL),(41,'1234567','http://192.168.113.110/android/upload_image/images/6nifhjfbxp40wp6qzfx6.png','66sssssssssssssssssssssssssssssss',NULL),(42,'1234567','http://192.168.113.110/android/upload_image/images/0wtfy3m6yk4fyzqhdenq.png','66sssssssssssssssssssssssssssssss',NULL),(43,'1234567','http://192.168.113.110/android/upload_image/images/124phcv7iqhdmachrmnv.png','66ssssssssssssssssssssssddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsssssssss',NULL),(44,'1234','http://192.168.113.110/android/upload_image/images/33uex3g4wrya77jxnj1e.png','pemandangan',NULL),(45,'123','http://192.168.113.110/android/upload_image/images/in8p94ify7ifuer76wyv.png','sss',NULL),(46,'123','http://192.168.113.110/android/upload_image/images/6c2b911i4qnvaeu3b2k6.png','8888',NULL),(47,'123','http://192.168.113.110/android/upload_image/images/gsf351czg9f2z9yymcss.png','desi',NULL),(48,'2222','http://192.168.113.110/android/upload_image/images/vgnvawf6knhh4gb803dw.png','qweqwe',NULL),(49,'12321321','http://192.168.113.110/android/upload_image/images/4upt2szjkdi5kfjbmcij.png','sdasdasdas',NULL),(50,'1234','http://192.168.113.110/android/upload_image/images/ahcpr57y9e2bwewyzcrq.png','ewerer',NULL),(51,'1gfgfgfg','http://192.168.113.110/android/upload_image/images/287ny636ad9drfiupdp6.png','ewerer',NULL),(52,'uyuy','http://192.168.113.110/android/upload_image/images/139usb81bggb75iihm36.png','uyuy','2017-08-31 02:21:34'),(53,'124','http://192.168.113.110/android/upload_image/images/bswyg50f4rvbscn9xgjc.png','sffvb','2017-08-31 02:26:02'),(54,'124','http://192.168.113.110/android/upload_image/images/51kexmagexe4jjuijsez.png','sffvb','2017-08-31 02:26:05'),(55,'124','http://192.168.113.110/android/upload_image/images/22tg67an0nr4cccxp4an.png','hh','2017-08-31 02:29:49'),(56,'124','http://192.168.113.110/android/upload_image/images/t0bwa8iz2bj4wh0pug8x.png','hh','2017-08-31 02:30:36'),(57,'4','http://192.168.113.110/android/upload_image/images/54eybpa40cy20wdbmaav.png','4','2017-08-31 02:52:50'),(58,'teys','http://192.168.113.110/android/upload_image/images/jxwx6mn8dq7qisjqe9hp.png','xxccffc','2017-08-31 02:56:00'),(59,'teys','http://192.168.113.110/android/upload_image/images/t7ddqg7cbumzepqu1xkr.png','xxccffc','2017-08-31 02:56:18'),(60,'4','http://192.168.113.110/android/upload_image/images/2wkcv641ug89muqgkxfj.png','4','2017-08-31 03:15:13'),(61,'4','http://192.168.113.110/android/upload_image/images/rbs7x2esc1xcyr0k7sm1.png','4','2017-08-31 03:15:17'),(62,'iiii','http://192.168.113.110/android/upload_image/images/v1r0kyyiuyhzha0jdr3x.png','999999','2017-08-31 03:27:16'),(63,'iiii','http://192.168.113.110/android/upload_image/images/jciq6c7xs5vzjtyjadwu.png','999999','2017-08-31 03:27:32'),(64,'u','http://192.168.113.110/android/upload_image/images/5hajkyukz4jvnzqgrczz.png','u','2017-08-31 03:36:20'),(65,'p','http://192.168.113.110/android/upload_image/images/qzizymx0rcfgrt982zts.png','p','2017-08-31 03:37:45'),(66,'0','http://192.168.113.110/android/upload_image/images/zik5ma6s28h5h73rxyek.png','p','2017-08-31 03:38:43');
/*!40000 ALTER TABLE `volley_upload` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-31 11:18:32
