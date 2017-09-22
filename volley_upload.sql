/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.1.21-MariaDB : Database - volley_upload
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`volley_upload` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `volley_upload`;

/*Table structure for table `volley_upload` */

DROP TABLE IF EXISTS `volley_upload`;

CREATE TABLE `volley_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `photo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `volley_upload` */

insert  into `volley_upload`(`id`,`name`,`photo`) values (1,'cewek','http://192.1168.10.177/android/upload_image/images/yautcgquwneqm7mrm1hh.png'),(2,'dedy kuncoro','http://192.1168.10.177/android/upload_image/images/rv7dhj8tswzcpazsg4v9.png'),(3,'qr code','http://192.1168.10.177/android/upload_image/images/40h2iachwk54is2r16ak.png'),(4,'ukuran file 200 kb','http://192.1168.10.177/android/upload_image/images/tm5bpesha1d3rwvz836z.png'),(5,'ukuran','http://192.1168.10.177/android/upload_image/images/y0i77f7c74d5f53e74n0.png'),(6,'ukuran gambar 1.2 MB','http://192.1168.10.177/android/upload_image/images/fdcdj93nvgjh9bh9h86q.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
