-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: mailserver
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
-- Table structure for table `virtual_aliases`
--

DROP TABLE IF EXISTS `virtual_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `virtual_aliases_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_aliases`
--

LOCK TABLES `virtual_aliases` WRITE;
/*!40000 ALTER TABLE `virtual_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_domains`
--

DROP TABLE IF EXISTS `virtual_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_domains`
--

LOCK TABLES `virtual_domains` WRITE;
/*!40000 ALTER TABLE `virtual_domains` DISABLE KEYS */;
INSERT INTO `virtual_domains` VALUES (1,'atica.org'),(2,'deinsaingenieros.com'),(3,'decomadrid.org'),(4,'miraclerdps.com'),(5,'clientesdeinsa.com'),(6,'miraclesoa.com'),(7,'miracleingenieria.com'),(8,'utopia.red'),(9,'lateingenieros.com'),(10,'smarthome.red');
/*!40000 ALTER TABLE `virtual_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_users`
--

DROP TABLE IF EXISTS `virtual_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `password` varchar(106) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `domain_id` (`domain_id`),
  CONSTRAINT `virtual_users_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_users`
--

LOCK TABLES `virtual_users` WRITE;
/*!40000 ALTER TABLE `virtual_users` DISABLE KEYS */;
INSERT INTO `virtual_users` VALUES (1,1,'$6$ce42dd7e446fe5c1$Hh/PHQ0OF44j2rZfOJY8Xpvpp7805WlFq1lv4azqF33lhTxYLRAAzQ4V.dYUogvcKbHoiBFCUxIMsnk0crWi51','aticainstalaciones@atica.org'),(2,1,'$6$53d702faa6d03d97$zMPZvqZabVzBI3Sr52K8/SqGlxba0HEUGVEsi5watA.AV.pnsj.LvlGKdgudFaWGY0UYqkwiIPso72aVl6U850','aticasoluciones@atica.org'),(3,1,'$6$1d52766af91972ec$H37bMn7E0eDi.UTpTTinQ8oBuJUpuOVThWO34g84IujC8Y51qBkPR0JZZzGtsG07y5KB9FQDPouboEuF95TP30','gemma@atica.org'),(4,1,'$6$f9fbc95b414cf90f$P/T9BD7KzvaWSWXZex.nGtXTgSzUTeLirZHwigD0ckUdlMAUht9QkOrcXjVow6IEaBxeCiKtbyv5ZR/oOtvHL.','laura@atica.org'),(5,1,'$6$dba5c89a527c607d$f4f1QTu1MdiuMNuNby.gAvqirKiFzBH.eIr2pyc5Iflr40yXh6t72eEw/gZiTyrrRplNSs6pCnVtgBwHNtUR6/','joseluis@atica.org'),(6,1,'$6$42afc080fea6c7a4$/UEX266vehCUEJIAfneAAwYQ8ZUWfgMBOjYQL/rhtEUVQcexyVvfK6fN7BsMvg0m6bk1FnacW.2.ak1bxbbYO0','fernandoalonso@atica.org'),(7,2,'$6$25edf2497bf69004$juTtjTGhWtKmiCH1THtJU0369hsN9TMy1o4YOW0xc2ap6Hp7sjZfAtSMNjAIFDvgExvSpurJhJPF0mt3kCX61.','juanantonio@deinsaingenieros.com'),(8,2,'$6$db9d6847f631a772$CTEyUCQcKyGIvQ7nROv7rdy5XY3Bd.wmsrffsjmcrQmk8fvu/SEx.qfc3mQm9/ipQMxfzGNMg7ZE2Q7GIalhy/','deinsa@deinsaingenieros.com'),(9,2,'$6$43eda083b9c0d9eb$rGBmvFZUkr48NWZtv17tD1X3qpIh5RJO9FmmyklKhpcVQU.krxztuS5dmAxH6YfG4YhUcF/p5zYxGI7gFV5I2/','fernando@deinsaingenieros.com'),(10,2,'$6$8e1ca55a03c149d8$ALZroUsNpHro75y38AByoCXbYSlCKzFg28kduiFMOfwEfjXTiPyY6GC9ItgzMI5IXMdM5JPdmqexJc6p3zoyf1','joseluis@deinsaingenieros.com'),(11,3,'$6$3d447b1a5a4cd9dd$vdmnH8W.64R21/3ZPLxoUPG4ztSfhq7IgGyJToZzq9tCc94tzS0z58rqf3DeKAYxsSHl26kDZ22/tpYwGZENi.','decomadrid@decomadrid.org'),(12,4,'$6$5c5696edda9b4bef$MbsvgWhiuN6NiNyHV4u5fIgZwgIqr36mFLOxiOaEV08qoRAe7.8w088OKOnQ99LbO4dfFxEC4ElOyBK6VsfoK0','laura@miraclerdps.com'),(13,5,'$6$26485aa1d3087360$R5OvK5YnJf65paxB7RFs.brGsEFWiNLx9PzZRSLKSOdhMXAUn2yjmJNRKk7N877b7pNoHeVgwvfcwAA.VXS2d1','clientesdeinsa@clientesdeinsa.com'),(14,6,'$6$d50b8ccd4b909d15$ee4Aa0vflK5MLuNeJ3o1AWi6630oflKjkhEWqtJIWKysVuDOibBDtvkRVhViQkgjd5SrPV3.auJSTcMeVH6Yv.','miracle@miraclesoa.com'),(15,6,'$6$cffbed0bf9e979e6$/1ZlSmgkhJ8dPl0KqHF4DNXnhQs5eU5nOqhwGd/P4Vz/lePHrpmyY02J8KgxPME8zzAu1A0ur4bPHEKNtPX9n.','fernando@miraclesoa.com'),(16,6,'$6$07286042ee22b773$4w8Z2Zx/gynvRfwtudBDo9xOw870Q7SZxpUzLDZhTm0iGLNxjHOrThhbYp4AluvUe4U67IZjFCV2OxzSwM5I/0','gemma@miraclesoa.com'),(17,6,'$6$92b8b9cfde5d57c0$/hvAvSpAQkQnS8Zp8uB6BdqXRiV6igMTxNw2V0yzJUjsWBCvOWGyunBYfR95zyL8QBpghKwQr15a6tC9xRc.Q0','joseluis@miraclesoa.com'),(18,6,'$6$113db4a0ae94fce4$UF2jo./cM/GIkm3ccut2aEWK.Fved3mkkYw/cui1DXkbT2PpFum.GM1FjYROVeXj0fukBsa3BZQ2e0YMKFRUK1','adrian@miraclesoa.com'),(19,3,'$6$fb8d1bfac7a5e361$7ccD1TYXRmdnmnSizWEAYo1omANspDAtR0evXteqSpxnAALy4jQKvAdejXU3Rw.q7R3CQbZusFD0SABqECGbX.','fernando@decomadrid.org'),(20,7,'$6$d1c767ba5eda3c14$UMv4HFKwGtjsQvvouTWRbwg89f1fE.ngdFuDkx.VQnk5nsef6ZlninPBwIHlq3xX1p.bzsXQDKVgK40evkRqm1','anna@miracleingenieria.com'),(21,8,'$6$53cf9559f2c0d92d$MTLiyDaNexa.dJX1LcxhC1OESeS/ownvIHUWlSROACXueKdNY7I/exDY0NIfmgJ7SGn4gRthokKE73lhc4NJZ/','fernando@utopia.red'),(22,8,'$6$9c0bd58054f49e9d$Q3I0uwmrADNC5GQGmSuv91MN2oy0NGOqDxTkx0Og.M076mwF1l2vwSBBiXgff0QeEls3O0w8Xq9JbOH9F..1O/','instalaciones@utopia.red'),(23,9,'$6$d81a68d29a1f4402$TV.57WfsI/hiLOlvqXmB20lgKSnhJ6RyF/PxG9cFKcdeOq95XxpKRGbhSQ3MhcLW6IcXNqR3oHx3RdljUI0Pd0','late@lateingenieros.com');
/*!40000 ALTER TABLE `virtual_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-29 12:19:09
