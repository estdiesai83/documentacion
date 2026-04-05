-- MySQL dump 10.11
--
-- Host: localhost    Database: verde
-- ------------------------------------------------------
-- Server version	5.0.45-community

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

DROP database IF EXISTS `verde`;
create database verde;
use verde;


--
-- Table structure for table `LVP1`
--

DROP TABLE IF EXISTS `LVP1`;
CREATE TABLE `LVP1` (
  `_idLVP1` int(11) NOT NULL auto_increment,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `tipodriver` text,
  `tipocomando` text,
  `puerto` text,
  `comando` text,
  `nemocomando` text,
  `ubicacion` text,
  `nemo_puerto` text,
  `idbuzon_puerto` text,
  `buzon_origen_puerto` text,
  `buzon_destino_puerto` text,
  `nemo_eco` text,
  `idbuzon_eco` text,
  `buzon_origen_eco` text,
  `buzon_destino_eco` text,
  `nemo_velocidad` text,
  `idbuzon_velocidad` text,
  `buzon_origen_velocidad` text,
  `buzon_destino_velocidad` text,
  `nemo_comando` text,
  `idbuzon_comando` text,
  `buzon_origen_comando` text,
  `buzon_destino_comando` text,
  `nemo_estado` text,
  `idbuzon_estado` text,
  `buzon_origen_estado` text,
  `buzon_destino_estado` text,
  `nemo_tsc1` text,
  `idbuzon_tsc1` text,
  `buzon_origen_tsc1` text,
  `buzon_destino_tsc1` text,
  `nemo_tsc2` text,
  `idbuzon_tsc2` text,
  `buzon_origen_tsc2` text,
  `buzon_destino_tsc2` text,
  `nemo_tsc3` text,
  `idbuzon_tsc3` text,
  `buzon_origen_tsc3` text,
  `buzon_destino_tsc3` text,
  `nemo_tsc4` text,
  `idbuzon_tsc4` text,
  `buzon_origen_tsc4` text,
  `buzon_destino_tsc4` text,
  `nemo_tsc5` text,
  `idbuzon_tsc5` text,
  `buzon_origen_tsc5` text,
  `buzon_destino_tsc5` text,
  `nemo_tsc6` text,
  `idbuzon_tsc6` text,
  `buzon_origen_tsc6` text,
  `buzon_destino_tsc6` text,
  `nemo_tsc7` text,
  `idbuzon_tsc7` text,
  `buzon_origen_tsc7` text,
  `buzon_destino_tsc7` text,
  `nemo_tsc8` text,
  `idbuzon_tsc8` text,
  `buzon_origen_tsc8` text,
  `buzon_destino_tsc8` text,
  `nemo_tipoborna1` text,
  `idbuzon_tipoborna1` text,
  `buzon_origen_tipoborna1` text,
  `buzon_destino_tipoborna1` text,
  `nemo_tipoborna2` text,
  `idbuzon_tipoborna2` text,
  `buzon_origen_tipoborna2` text,
  `buzon_destino_tipoborna2` text,
  `nemo_tipoborna3` text,
  `idbuzon_tipoborna3` text,
  `buzon_origen_tipoborna3` text,
  `buzon_destino_tipoborna3` text,
  `nemo_tipoborna4` text,
  `idbuzon_tipoborna4` text,
  `buzon_origen_tipoborna4` text,
  `buzon_destino_tipoborna4` text,
  `nemo_tipoborna5` text,
  `idbuzon_tipoborna5` text,
  `buzon_origen_tipoborna5` text,
  `buzon_destino_tipoborna5` text,
  `nemo_tipoborna6` text,
  `idbuzon_tipoborna6` text,
  `buzon_origen_tipoborna6` text,
  `buzon_destino_tipoborna6` text,
  `nemo_tipoborna7` text,
  `idbuzon_tipoborna7` text,
  `buzon_origen_tipoborna7` text,
  `buzon_destino_tipoborna7` text,
  `nemo_tipoborna8` text,
  `idbuzon_tipoborna8` text,
  `buzon_origen_tipoborna8` text,
  `buzon_destino_tipoborna8` text,
  `nemo_tipoborna9` text,
  `idbuzon_tipoborna9` text,
  `buzon_origen_tipoborna9` text,
  `buzon_destino_tipoborna9` text,
  `nemo_tipoborna10` text,
  `idbuzon_tipoborna10` text,
  `buzon_origen_tipoborna10` text,
  `buzon_destino_tipoborna10` text,
  `nemo_tipoborna11` text,
  `idbuzon_tipoborna11` text,
  `buzon_origen_tipoborna11` text,
  `buzon_destino_tipoborna11` text,
  `nemo_tipoborna12` text,
  `idbuzon_tipoborna12` text,
  `buzon_origen_tipoborna12` text,
  `buzon_destino_tipoborna12` text,
  `nemo_tipoborna13` text,
  `idbuzon_tipoborna13` text,
  `buzon_origen_tipoborna13` text,
  `buzon_destino_tipoborna13` text,
  `nemo_tipoborna14` text,
  `idbuzon_tipoborna14` text,
  `buzon_origen_tipoborna14` text,
  `buzon_destino_tipoborna14` text,
  `nemo_tipoborna15` text,
  `idbuzon_tipoborna15` text,
  `buzon_origen_tipoborna15` text,
  `buzon_destino_tipoborna15` text,
  `nemo_tipoborna16` text,
  `idbuzon_tipoborna16` text,
  `buzon_origen_tipoborna16` text,
  `buzon_destino_tipoborna16` text,
  `nemo_tipoborna17` text,
  `idbuzon_tipoborna17` text,
  `buzon_origen_tipoborna17` text,
  `buzon_destino_tipoborna17` text,
  `nemo_tipoborna18` text,
  `idbuzon_tipoborna18` text,
  `buzon_origen_tipoborna18` text,
  `buzon_destino_tipoborna18` text,
  `nemo_tipoborna19` text,
  `idbuzon_tipoborna19` text,
  `buzon_origen_tipoborna19` text,
  `buzon_destino_tipoborna19` text,
  `nemo_tipoborna20` text,
  `idbuzon_tipoborna20` text,
  `buzon_origen_tipoborna20` text,
  `buzon_destino_tipoborna20` text,
  `nemo_tipoborna21` text,
  `idbuzon_tipoborna21` text,
  `buzon_origen_tipoborna21` text,
  `buzon_destino_tipoborna21` text,
  `nemo_tipoborna22` text,
  `idbuzon_tipoborna22` text,
  `buzon_origen_tipoborna22` text,
  `buzon_destino_tipoborna22` text,
  `nemo_tipoborna23` text,
  `idbuzon_tipoborna23` text,
  `buzon_origen_tipoborna23` text,
  `buzon_destino_tipoborna23` text,
  `nemo_tipoborna24` text,
  `idbuzon_tipoborna24` text,
  `buzon_origen_tipoborna24` text,
  `buzon_destino_tipoborna24` text,
  `nemo_tipoborna25` text,
  `idbuzon_tipoborna25` text,
  `buzon_origen_tipoborna25` text,
  `buzon_destino_tipoborna25` text,
  `nemo_tipoborna26` text,
  `idbuzon_tipoborna26` text,
  `buzon_origen_tipoborna26` text,
  `buzon_destino_tipoborna26` text,
  `nemo_tipoborna27` text,
  `idbuzon_tipoborna27` text,
  `buzon_origen_tipoborna27` text,
  `buzon_destino_tipoborna27` text,
  `nemo_tipoborna28` text,
  `idbuzon_tipoborna28` text,
  `buzon_origen_tipoborna28` text,
  `buzon_destino_tipoborna28` text,
  `nemo_timeout` text,
  `idbuzon_timeout` text,
  `buzon_origen_timeout` text,
  `buzon_destino_timeout` text,
  `nemo_imagen` text,
  `idbuzon_imagen` text,
  `buzon_origen_imagen` text,
  `buzon_destino_imagen` text,
  `nemo_di` text,
  `idbuzon_di` text,	
  `buzon_origen_di` text,
  `buzon_destino_di` text,
  `nemo_puertoenvio` text,
  `idbuzon_puertoenvio` text,
  `buzon_origen_puertoenvio` text,
  `buzon_destino_puertoenvio` text,
  `nemo_puertoescucha` text,
  `idbuzon_puertoescucha` text,
  `buzon_origen_puertoescucha` text,
  `buzon_destino_puertoescucha` text,
  `nemo_tiempolectura` text,
  `idbuzon_tiempolectura` text,
  `buzon_origen_tiempolectura` text,
  `buzon_destino_tiempolectura` text,
  `activo` text,
  `eliminado` text,
  PRIMARY KEY  (`_idlvp1`),
  KEY `clvp1` (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LVP1`
--

LOCK TABLES `LVP1` WRITE;
/*!40000 ALTER TABLE `LVP1` DISABLE KEYS */;
/*!40000 ALTER TABLE `LVP1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LVP2`
--

DROP TABLE IF EXISTS `LVP2`;
CREATE TABLE `LVP2` (
  `_idLVP2` int(11) NOT NULL auto_increment,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `tipodriver` text,
  `tipocomando` text,
  `puerto` text,
  `comando` text,
  `nemocomando` text,
  `nemoborna` text,
  `borna` text,
  `fecha` text,
  `ubicacion` text,
  `nemotecnicotps` text,
  `condicion` text,
  `nemotecnicotprs` text,
  `nemotecnicotpi` text,
  `tps` text,
  `tpssd` text,
  `tcaso` text,
  `tprs` text,
  `tpmpc` text,
  `tpi` text,
  `tpri` text,
  `tpcm` text,
  `tpm` text,
  `tpa` text,	
  `tpis` text,
  `rojab` text,
  `nemo_operadorcondicion` text,
  `idbuzon_operadorcondicion` text,
  `buzon_origen_operadorcondicion` text,
  `buzon_destino_operadorcondicion` text,
  `nemo_valorconsigna` text,
  `idbuzon_valorconsigna` text,
  `buzon_origen_valorconsigna` text,
  `buzon_destino_valorconsigna` text,
  `nemo_valoralarma` text,
  `idbuzon_valoralarma` text,
  `buzon_origen_valoralarma` text,
  `buzon_destino_valoralarma` text,
  `nemo_temporizador` text,
  `idbuzon_temporizador` text,
  `buzon_origen_temporizador` text,
  `buzon_destino_temporizador` text,
  `eliminado` text,
  `activo` text,
  `temporizado` text,
  PRIMARY KEY  (`_idlvp2`),
  KEY `clvp2` USING BTREE (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LVP2`
--

LOCK TABLES `LVP2` WRITE;
/*!40000 ALTER TABLE `LVP2` DISABLE KEYS */;
/*!40000 ALTER TABLE `LVP2` ENABLE KEYS */;
UNLOCK TABLES;

--
DROP TABLE IF EXISTS `LVP3`;
CREATE TABLE `LVP3` (
  `_idLVP3` int(11) NOT NULL auto_increment,
  `fecha` text,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `tipodriver` text,
  `tipocomando` text,
  `puerto` text,
  `comando` text,
  `nemo_tipoborna29` text,
  `idbuzon_tipoborna29` text,
  `buzon_origen_tipoborna29` text,
  `buzon_destino_tipoborna29` text,
  `nemo_tipoborna30` text,
  `idbuzon_tipoborna30` text,
  `buzon_origen_tipoborna30` text,
  `buzon_destino_tipoborna30` text,
  `nemo_tipoborna31` text,
  `idbuzon_tipoborna31` text,
  `buzon_origen_tipoborna31` text,
  `buzon_destino_tipoborna31` text,
  `nemo_tipoborna32` text,
  `idbuzon_tipoborna32` text,
  `buzon_origen_tipoborna32` text,
  `buzon_destino_tipoborna32` text,
  `nemo_tipoborna33` text,
  `idbuzon_tipoborna33` text,
  `buzon_origen_tipoborna33` text,
  `buzon_destino_tipoborna33` text,
  `nemo_tipoborna34` text,
  `idbuzon_tipoborna34` text,
  `buzon_origen_tipoborna34` text,
  `buzon_destino_tipoborna34` text,
  `nemo_tipoborna35` text,
  `idbuzon_tipoborna35` text,
  `buzon_origen_tipoborna35` text,
  `buzon_destino_tipoborna35` text,
  `nemo_tipoborna36` text,
  `idbuzon_tipoborna36` text,
  `buzon_origen_tipoborna36` text,
  `buzon_destino_tipoborna36` text,
  `nemo_tipoborna37` text,
  `idbuzon_tipoborna37` text,
  `buzon_origen_tipoborna37` text,
  `buzon_destino_tipoborna37` text,
  `nemo_tipoborna38` text,
  `idbuzon_tipoborna38` text,
  `buzon_origen_tipoborna38` text,
  `buzon_destino_tipoborna38` text,
  `nemo_tipoborna39` text,
  `idbuzon_tipoborna39` text,
  `buzon_origen_tipoborna39` text,
  `buzon_destino_tipoborna39` text,
  `nemo_tipoborna40` text,
  `idbuzon_tipoborna40` text,
  `buzon_origen_tipoborna40` text,
  `buzon_destino_tipoborna40` text,
  `nemo_tipoborna41` text,
  `idbuzon_tipoborna41` text,
  `buzon_origen_tipoborna41` text,
  `buzon_destino_tipoborna41` text,
  `nemo_tipoborna42` text,
  `idbuzon_tipoborna42` text,
  `buzon_origen_tipoborna42` text,
  `buzon_destino_tipoborna42` text,
  `nemo_tipoborna43` text,
  `idbuzon_tipoborna43` text,
  `buzon_origen_tipoborna43` text,
  `buzon_destino_tipoborna43` text,
  `nemo_tipoborna44` text,
  `idbuzon_tipoborna44` text,
  `buzon_origen_tipoborna44` text,
  `buzon_destino_tipoborna44` text,
  `nemo_tipoborna45` text,
  `idbuzon_tipoborna45` text,
  `buzon_origen_tipoborna45` text,
  `buzon_destino_tipoborna45` text,
  `nemo_tipoborna46` text,
  `idbuzon_tipoborna46` text,
  `buzon_origen_tipoborna46` text,
  `buzon_destino_tipoborna46` text,
  `nemo_tipoborna47` text,
  `idbuzon_tipoborna47` text,
  `buzon_origen_tipoborna47` text,
  `buzon_destino_tipoborna47` text,
  `nemo_tipoborna48` text,
  `idbuzon_tipoborna48` text,
  `buzon_origen_tipoborna48` text,
  `buzon_destino_tipoborna48` text,
  `nemo_tipoborna49` text,
  `idbuzon_tipoborna49` text,
  `buzon_origen_tipoborna49` text,
  `buzon_destino_tipoborna49` text,
  `nemo_tipoborna50` text,
  `idbuzon_tipoborna50` text,
  `buzon_origen_tipoborna50` text,
  `buzon_destino_tipoborna50` text,
  `nemo_tipoborna51` text,
  `idbuzon_tipoborna51` text,
  `buzon_origen_tipoborna51` text,
  `buzon_destino_tipoborna51` text,
  `nemo_tipoborna52` text,
  `idbuzon_tipoborna52` text,
  `buzon_origen_tipoborna52` text,
  `buzon_destino_tipoborna52` text,
  `nemo_tipoborna53` text,
  `idbuzon_tipoborna53` text,
  `buzon_origen_tipoborna53` text,
  `buzon_destino_tipoborna53` text,
  `nemo_tipoborna54` text,
  `idbuzon_tipoborna54` text,
  `buzon_origen_tipoborna54` text,
  `buzon_destino_tipoborna54` text,
  `nemo_tipoborna55` text,
  `idbuzon_tipoborna55` text,
  `buzon_origen_tipoborna55` text,
  `buzon_destino_tipoborna55` text,
  `nemo_tipoborna56` text,
  `idbuzon_tipoborna56` text,
  `buzon_origen_tipoborna56` text,
  `buzon_destino_tipoborna56` text,
  `nemo_tipoborna57` text,
  `idbuzon_tipoborna57` text,
  `buzon_origen_tipoborna57` text,
  `buzon_destino_tipoborna57` text,
  `nemo_tipoborna58` text,
  `idbuzon_tipoborna58` text,
  `buzon_origen_tipoborna58` text,
  `buzon_destino_tipoborna58` text,
  `nemo_tipoborna59` text,
  `idbuzon_tipoborna59` text,
  `buzon_origen_tipoborna59` text,
  `buzon_destino_tipoborna59` text,
  `nemo_tipoborna60` text,
  `idbuzon_tipoborna60` text,
  `buzon_origen_tipoborna60` text,
  `buzon_destino_tipoborna60` text,
  `nemo_tipoborna61` text,
  `idbuzon_tipoborna61` text,
  `buzon_origen_tipoborna61` text,
  `buzon_destino_tipoborna61` text,
  `nemo_tipoborna62` text,
  `idbuzon_tipoborna62` text,
  `buzon_origen_tipoborna62` text,
  `buzon_destino_tipoborna62` text,
  `nemo_tipoborna63` text,
  `idbuzon_tipoborna63` text,
  `buzon_origen_tipoborna63` text,
  `buzon_destino_tipoborna63` text,
  `nemo_tipoborna64` text,
  `idbuzon_tipoborna64` text,
  `buzon_origen_tipoborna64` text,
  `buzon_destino_tipoborna64` text,
  `nemo_tipoborna65` text,
  `idbuzon_tipoborna65` text,
  `buzon_origen_tipoborna65` text,
  `buzon_destino_tipoborna65` text,
  `nemo_tipoborna66` text,
  `idbuzon_tipoborna66` text,
  `buzon_origen_tipoborna66` text,
  `buzon_destino_tipoborna66` text,
  `nemo_tipoborna67` text,
  `idbuzon_tipoborna67` text,
  `buzon_origen_tipoborna67` text,
  `buzon_destino_tipoborna67` text,
  `nemo_tipoborna68` text,
  `idbuzon_tipoborna68` text,
  `buzon_origen_tipoborna68` text,
  `buzon_destino_tipoborna68` text,
  `nemo_tipoborna69` text,
  `idbuzon_tipoborna69` text,
  `buzon_origen_tipoborna69` text,
  `buzon_destino_tipoborna69` text,
  `nemo_tipoborna70` text,
  `idbuzon_tipoborna70` text,
  `buzon_origen_tipoborna70` text,
  `buzon_destino_tipoborna70` text,
  `nemo_tipoborna71` text,
  `idbuzon_tipoborna71` text,
  `buzon_origen_tipoborna71` text,
  `buzon_destino_tipoborna71` text,
  `nemo_tipoborna72` text,
  `idbuzon_tipoborna72` text,
  `buzon_origen_tipoborna72` text,
  `buzon_destino_tipoborna72` text,
  `nemo_tipoborna73` text,
  `idbuzon_tipoborna73` text,
  `buzon_origen_tipoborna73` text,
  `buzon_destino_tipoborna73` text,
  `nemo_tipoborna74` text,
  `idbuzon_tipoborna74` text,
  `buzon_origen_tipoborna74` text,
  `buzon_destino_tipoborna74` text,
  `nemo_tipoborna75` text,
  `idbuzon_tipoborna75` text,
  `buzon_origen_tipoborna75` text,
  `buzon_destino_tipoborna75` text,
  `nemo_tipoborna76` text,
  `idbuzon_tipoborna76` text,
  `buzon_origen_tipoborna76` text,
  `buzon_destino_tipoborna76` text,
  `nemo_tipoborna77` text,
  `idbuzon_tipoborna77` text,
  `buzon_origen_tipoborna77` text,
  `buzon_destino_tipoborna77` text,
  `nemo_tipoborna78` text,
  `idbuzon_tipoborna78` text,
  `buzon_origen_tipoborna78` text,
  `buzon_destino_tipoborna78` text,
  `nemo_tipoborna79` text,
  `idbuzon_tipoborna79` text,
  `buzon_origen_tipoborna79` text,
  `buzon_destino_tipoborna79` text,
  `nemo_tipoborna80` text,
  `idbuzon_tipoborna80` text,
  `buzon_origen_tipoborna80` text,
  `buzon_destino_tipoborna80` text,
  `nemo_tipoborna81` text,
  `idbuzon_tipoborna81` text,
  `buzon_origen_tipoborna81` text,
  `buzon_destino_tipoborna81` text,
  `nemo_tipoborna82` text,
  `idbuzon_tipoborna82` text,
  `buzon_origen_tipoborna82` text,
  `buzon_destino_tipoborna82` text,
  `nemo_tipoborna83` text,
  `idbuzon_tipoborna83` text,
  `buzon_origen_tipoborna83` text,
  `buzon_destino_tipoborna83` text,
  `nemo_tipoborna84` text,
  `idbuzon_tipoborna84` text,
  `buzon_origen_tipoborna84` text,
  `buzon_destino_tipoborna84` text,
  `nemo_tipoborna85` text,
  `idbuzon_tipoborna85` text,
  `buzon_origen_tipoborna85` text,
  `buzon_destino_tipoborna85` text,
  `nemo_tipoborna86` text,
  `idbuzon_tipoborna86` text,
  `buzon_origen_tipoborna86` text,
  `buzon_destino_tipoborna86` text,
  `nemo_tipoborna87` text,
  `idbuzon_tipoborna87` text,
  `buzon_origen_tipoborna87` text,
  `buzon_destino_tipoborna87` text,
  `nemo_tipoborna88` text,
  `idbuzon_tipoborna88` text,
  `buzon_origen_tipoborna88` text,
  `buzon_destino_tipoborna88` text,
  `nemo_tipoborna89` text,
  `idbuzon_tipoborna89` text,
  `buzon_origen_tipoborna89` text,
  `buzon_destino_tipoborna89` text,
  `nemo_tipoborna90` text,
  `idbuzon_tipoborna90` text,
  `buzon_origen_tipoborna90` text,
  `buzon_destino_tipoborna90` text,
  `nemo_tipoborna91` text,
  `idbuzon_tipoborna91` text,
  `buzon_origen_tipoborna91` text,
  `buzon_destino_tipoborna91` text,
  `nemo_tipoborna92` text,
  `idbuzon_tipoborna92` text,
  `buzon_origen_tipoborna92` text,
  `buzon_destino_tipoborna92` text,
  `nemo_tipoborna93` text,
  `idbuzon_tipoborna93` text,
  `buzon_origen_tipoborna93` text,
  `buzon_destino_tipoborna93` text,
  `nemo_tipoborna94` text,
  `idbuzon_tipoborna94` text,
  `buzon_origen_tipoborna94` text,
  `buzon_destino_tipoborna94` text,
  `nemo_tipoborna95` text,
  `idbuzon_tipoborna95` text,
  `buzon_origen_tipoborna95` text,
  `buzon_destino_tipoborna95` text,
  `nemo_tipoborna96` text,
  `idbuzon_tipoborna96` text,
  `buzon_origen_tipoborna96` text,
  `buzon_destino_tipoborna96` text,
  `nemo_tipoborna97` text,
  `idbuzon_tipoborna97` text,
  `buzon_origen_tipoborna97` text,
  `buzon_destino_tipoborna97` text,
  `nemo_tipoborna98` text,
  `idbuzon_tipoborna98` text,
  `buzon_origen_tipoborna98` text,
  `buzon_destino_tipoborna98` text,
  `nemo_tipoborna99` text,
  `idbuzon_tipoborna99` text,
  `buzon_origen_tipoborna99` text,
  `buzon_destino_tipoborna99` text,
  `nemo_tipoborna100` text,
  `idbuzon_tipoborna100` text,
  `buzon_origen_tipoborna100` text,
  `buzon_destino_tipoborna100` text,

  `nemo_tipoborna101` text,
  `idbuzon_tipoborna101` text,
  `buzon_origen_tipoborna101` text,
  `buzon_destino_tipoborna101` text,
  `nemo_tipoborna102` text,
  `idbuzon_tipoborna102` text,
  `buzon_origen_tipoborna102` text,
  `buzon_destino_tipoborna102` text,
  `nemo_tipoborna103` text,
  `idbuzon_tipoborna103` text,
  `buzon_origen_tipoborna103` text,
  `buzon_destino_tipoborna103` text,
  `nemo_tipoborna104` text,
  `idbuzon_tipoborna104` text,
  `buzon_origen_tipoborna104` text,
  `buzon_destino_tipoborna104` text,
  `nemo_tipoborna105` text,
  `idbuzon_tipoborna105` text,
  `buzon_origen_tipoborna105` text,
  `buzon_destino_tipoborna105` text,
  `nemo_tipoborna106` text,
  `idbuzon_tipoborna106` text,
  `buzon_origen_tipoborna106` text,
  `buzon_destino_tipoborna106` text,
  `nemo_tipoborna107` text,
  `idbuzon_tipoborna107` text,
  `buzon_origen_tipoborna107` text,
  `buzon_destino_tipoborna107` text,
  `nemo_tipoborna108` text,
  `idbuzon_tipoborna108` text,
  `buzon_origen_tipoborna108` text,
  `buzon_destino_tipoborna108` text,
  `nemo_tipoborna109` text,
  `idbuzon_tipoborna109` text,
  `buzon_origen_tipoborna109` text,
  `buzon_destino_tipoborna109` text,
  `nemo_tipoborna110` text,
  `idbuzon_tipoborna110` text,
  `buzon_origen_tipoborna110` text,
  `buzon_destino_tipoborna110` text,

  `nemo_tipoborna111` text,
  `idbuzon_tipoborna111` text,
  `buzon_origen_tipoborna111` text,
  `buzon_destino_tipoborna111` text,
  `nemo_tipoborna112` text,
  `idbuzon_tipoborna112` text,
  `buzon_origen_tipoborna112` text,
  `buzon_destino_tipoborna112` text,
  `nemo_tipoborna113` text,
  `idbuzon_tipoborna113` text,
  `buzon_origen_tipoborna113` text,
  `buzon_destino_tipoborna113` text,
  `nemo_tipoborna114` text,
  `idbuzon_tipoborna114` text,
  `buzon_origen_tipoborna114` text,
  `buzon_destino_tipoborna114` text,
  `nemo_tipoborna115` text,
  `idbuzon_tipoborna115` text,
  `buzon_origen_tipoborna115` text,
  `buzon_destino_tipoborna115` text,
  `nemo_tipoborna116` text,
  `idbuzon_tipoborna116` text,
  `buzon_origen_tipoborna116` text,
  `buzon_destino_tipoborna116` text,
  `nemo_tipoborna117` text,
  `idbuzon_tipoborna117` text,
  `buzon_origen_tipoborna117` text,
  `buzon_destino_tipoborna117` text,
  `nemo_tipoborna118` text,
  `idbuzon_tipoborna118` text,
  `buzon_origen_tipoborna118` text,
  `buzon_destino_tipoborna118` text,
  `nemo_tipoborna119` text,
  `idbuzon_tipoborna119` text,
  `buzon_origen_tipoborna119` text,
  `buzon_destino_tipoborna119` text,
  `nemo_tipoborna120` text,
  `idbuzon_tipoborna120` text,
  `buzon_origen_tipoborna120` text,
  `buzon_destino_tipoborna120` text,
  `nemo_tipoborna121` text,
  `idbuzon_tipoborna121` text,
  `buzon_origen_tipoborna121` text,
  `buzon_destino_tipoborna121` text,
  `nemo_tipoborna122` text,
  `idbuzon_tipoborna122` text,
  `buzon_origen_tipoborna122` text,
  `buzon_destino_tipoborna122` text,
  `nemo_tipoborna123` text,
  `idbuzon_tipoborna123` text,
  `buzon_origen_tipoborna123` text,
  `buzon_destino_tipoborna123` text,
  `nemo_tipoborna124` text,
  `idbuzon_tipoborna124` text,
  `buzon_origen_tipoborna124` text,
  `buzon_destino_tipoborna124` text,
  `nemo_tipoborna125` text,
  `idbuzon_tipoborna125` text,
  `buzon_origen_tipoborna125` text,
  `buzon_destino_tipoborna125` text,
  `nemo_tipoborna126` text,
  `idbuzon_tipoborna126` text,
  `buzon_origen_tipoborna126` text,
  `buzon_destino_tipoborna126` text,
  `nemo_tipoborna127` text,
  `idbuzon_tipoborna127` text,
  `buzon_origen_tipoborna127` text,
  `buzon_destino_tipoborna127` text,
  `nemo_tipoborna128` text,
  `idbuzon_tipoborna128` text,
  `buzon_origen_tipoborna128` text,
  `buzon_destino_tipoborna128` text,
  `nemo_tipoborna129` text,
  `idbuzon_tipoborna129` text,
  `buzon_origen_tipoborna129` text,
  `buzon_destino_tipoborna129` text,
  `nemo_tipoborna130` text,
  `idbuzon_tipoborna130` text,
  `buzon_origen_tipoborna130` text,
  `buzon_destino_tipoborna130` text,
  `nemo_tipoborna131` text,
  `idbuzon_tipoborna131` text,
  `buzon_origen_tipoborna131` text,
  `buzon_destino_tipoborna131` text,
`nemo_tipoborna132` text,
`idbuzon_tipoborna132` text,
`buzon_origen_tipoborna132` text,
`buzon_destino_tipoborna132` text,
`nemo_tipoborna133` text,
`idbuzon_tipoborna133` text,
`buzon_origen_tipoborna133` text,
`buzon_destino_tipoborna133` text,
`nemo_tipoborna134` text,
`idbuzon_tipoborna134` text,
`buzon_origen_tipoborna134` text,
`buzon_destino_tipoborna134` text,
`nemo_tipoborna135` text,
`idbuzon_tipoborna135` text,
`buzon_origen_tipoborna135` text,
`buzon_destino_tipoborna135` text,
`nemo_tipoborna136` text,
`idbuzon_tipoborna136` text,
`buzon_origen_tipoborna136` text,
`buzon_destino_tipoborna136` text,
`nemo_tipoborna137` text,
`idbuzon_tipoborna137` text,
`buzon_origen_tipoborna137` text,
`buzon_destino_tipoborna137` text,
`nemo_tipoborna138` text,
`idbuzon_tipoborna138` text,
`buzon_origen_tipoborna138` text,
`buzon_destino_tipoborna138` text,
`nemo_tipoborna139` text,
`idbuzon_tipoborna139` text,
`buzon_origen_tipoborna139` text,
`buzon_destino_tipoborna139` text,
`nemo_tipoborna140` text,
`idbuzon_tipoborna140` text,
`buzon_origen_tipoborna140` text,
`buzon_destino_tipoborna140` text,
`nemo_tipoborna141` text,
`idbuzon_tipoborna141` text,
`buzon_origen_tipoborna141` text,
`buzon_destino_tipoborna141` text,
`nemo_tipoborna142` text,
`idbuzon_tipoborna142` text,
`buzon_origen_tipoborna142` text,
`buzon_destino_tipoborna142` text,
`nemo_tipoborna143` text,
`idbuzon_tipoborna143` text,
`buzon_origen_tipoborna143` text,
`buzon_destino_tipoborna143` text,
`nemo_tipoborna144` text,
`idbuzon_tipoborna144` text,
`buzon_origen_tipoborna144` text,
`buzon_destino_tipoborna144` text,
`nemo_tipoborna145` text,
`idbuzon_tipoborna145` text,
`buzon_origen_tipoborna145` text,
`buzon_destino_tipoborna145` text,
`nemo_tipoborna146` text,
`idbuzon_tipoborna146` text,
`buzon_origen_tipoborna146` text,
`buzon_destino_tipoborna146` text,
`nemo_tipoborna147` text,
`idbuzon_tipoborna147` text,
`buzon_origen_tipoborna147` text,
`buzon_destino_tipoborna147` text,
`nemo_tipoborna148` text,
`idbuzon_tipoborna148` text,
`buzon_origen_tipoborna148` text,
`buzon_destino_tipoborna148` text,
`nemo_tipoborna149` text,
`idbuzon_tipoborna149` text,
`buzon_origen_tipoborna149` text,
`buzon_destino_tipoborna149` text,
`nemo_tipoborna150` text,
`idbuzon_tipoborna150` text,
`buzon_origen_tipoborna150` text,
`buzon_destino_tipoborna150` text,
`nemo_tipoborna151` text,
`idbuzon_tipoborna151` text,
`buzon_origen_tipoborna151` text,
`buzon_destino_tipoborna151` text,
`nemo_tipoborna152` text,
`idbuzon_tipoborna152` text,
`buzon_origen_tipoborna152` text,
`buzon_destino_tipoborna152` text,
`nemo_tipoborna153` text,
`idbuzon_tipoborna153` text,
`buzon_origen_tipoborna153` text,
`buzon_destino_tipoborna153` text,
`nemo_tipoborna154` text,
`idbuzon_tipoborna154` text,
`buzon_origen_tipoborna154` text,
`buzon_destino_tipoborna154` text,
`nemo_tipoborna155` text,
`idbuzon_tipoborna155` text,
`buzon_origen_tipoborna155` text,
`buzon_destino_tipoborna155` text,
`nemo_tipoborna156` text,
`idbuzon_tipoborna156` text,
`buzon_origen_tipoborna156` text,
`buzon_destino_tipoborna156` text,
`nemo_tipoborna157` text,
`idbuzon_tipoborna157` text,
`buzon_origen_tipoborna157` text,
`buzon_destino_tipoborna157` text,
`nemo_tipoborna158` text,
`idbuzon_tipoborna158` text,
`buzon_origen_tipoborna158` text,
`buzon_destino_tipoborna158` text,
`nemo_tipoborna159` text,
`idbuzon_tipoborna159` text,
`buzon_origen_tipoborna159` text,
`buzon_destino_tipoborna159` text,
`nemo_tipoborna160` text,
`idbuzon_tipoborna160` text,
`buzon_origen_tipoborna160` text,
`buzon_destino_tipoborna160` text,
`nemo_tipoborna161` text,
`idbuzon_tipoborna161` text,
`buzon_origen_tipoborna161` text,
`buzon_destino_tipoborna161` text,
`nemo_tipoborna162` text,
`idbuzon_tipoborna162` text,
`buzon_origen_tipoborna162` text,
`buzon_destino_tipoborna162` text,
`nemo_tipoborna163` text,
`idbuzon_tipoborna163` text,
`buzon_origen_tipoborna163` text,
`buzon_destino_tipoborna163` text,
`nemo_tipoborna164` text,
`idbuzon_tipoborna164` text,
`buzon_origen_tipoborna164` text,
`buzon_destino_tipoborna164` text,
`nemo_tipoborna165` text,
`idbuzon_tipoborna165` text,
`buzon_origen_tipoborna165` text,
`buzon_destino_tipoborna165` text,
`nemo_tipoborna166` text,
`idbuzon_tipoborna166` text,
`buzon_origen_tipoborna166` text,
`buzon_destino_tipoborna166` text,
`nemo_tipoborna167` text,
`idbuzon_tipoborna167` text,
`buzon_origen_tipoborna167` text,
`buzon_destino_tipoborna167` text,
`nemo_tipoborna168` text,
`idbuzon_tipoborna168` text,
`buzon_origen_tipoborna168` text,
`buzon_destino_tipoborna168` text,
`nemo_tipoborna169` text,
`idbuzon_tipoborna169` text,
`buzon_origen_tipoborna169` text,
`buzon_destino_tipoborna169` text,
`nemo_tipoborna170` text,
`idbuzon_tipoborna170` text,
`buzon_origen_tipoborna170` text,
`buzon_destino_tipoborna170` text,
`nemo_tipoborna171` text,
`idbuzon_tipoborna171` text,
`buzon_origen_tipoborna171` text,
`buzon_destino_tipoborna171` text,
`nemo_tipoborna172` text,
`idbuzon_tipoborna172` text,
`buzon_origen_tipoborna172` text,
`buzon_destino_tipoborna172` text,
`nemo_tipoborna173` text,
`idbuzon_tipoborna173` text,
`buzon_origen_tipoborna173` text,
`buzon_destino_tipoborna173` text,
`nemo_tipoborna174` text,
`idbuzon_tipoborna174` text,
`buzon_origen_tipoborna174` text,
`buzon_destino_tipoborna174` text,
`nemo_tipoborna175` text,
`idbuzon_tipoborna175` text,
`buzon_origen_tipoborna175` text,
`buzon_destino_tipoborna175` text,
`nemo_tipoborna176` text,
`idbuzon_tipoborna176` text,
`buzon_origen_tipoborna176` text,
`buzon_destino_tipoborna176` text,
`nemo_tipoborna177` text,
`idbuzon_tipoborna177` text,
`buzon_origen_tipoborna177` text,
`buzon_destino_tipoborna177` text,
`nemo_tipoborna178` text,
`idbuzon_tipoborna178` text,
`buzon_origen_tipoborna178` text,
`buzon_destino_tipoborna178` text,
`nemo_tipoborna179` text,
`idbuzon_tipoborna179` text,
`buzon_origen_tipoborna179` text,
`buzon_destino_tipoborna179` text,
`nemo_tipoborna180` text,
`idbuzon_tipoborna180` text,
`buzon_origen_tipoborna180` text,
`buzon_destino_tipoborna180` text,
`nemo_tipoborna181` text,
`idbuzon_tipoborna181` text,
`buzon_origen_tipoborna181` text,
`buzon_destino_tipoborna181` text,
`nemo_tipoborna182` text,
`idbuzon_tipoborna182` text,
`buzon_origen_tipoborna182` text,
`buzon_destino_tipoborna182` text,
`nemo_tipoborna183` text,
`idbuzon_tipoborna183` text,
`buzon_origen_tipoborna183` text,
`buzon_destino_tipoborna183` text,
`nemo_tipoborna184` text,
`idbuzon_tipoborna184` text,
`buzon_origen_tipoborna184` text,
`buzon_destino_tipoborna184` text,
`nemo_tipoborna185` text,
`idbuzon_tipoborna185` text,
`buzon_origen_tipoborna185` text,
`buzon_destino_tipoborna185` text,
`nemo_tipoborna186` text,
`idbuzon_tipoborna186` text,
`buzon_origen_tipoborna186` text,
`buzon_destino_tipoborna186` text,
`nemo_tipoborna187` text,
`idbuzon_tipoborna187` text,
`buzon_origen_tipoborna187` text,
`buzon_destino_tipoborna187` text,
`nemo_tipoborna188` text,
`idbuzon_tipoborna188` text,
`buzon_origen_tipoborna188` text,
`buzon_destino_tipoborna188` text,
`nemo_tipoborna189` text,
`idbuzon_tipoborna189` text,
`buzon_origen_tipoborna189` text,
`buzon_destino_tipoborna189` text,
`nemo_tipoborna190` text,
`idbuzon_tipoborna190` text,
`buzon_origen_tipoborna190` text,
`buzon_destino_tipoborna190` text,
`nemo_tipoborna191` text,
`idbuzon_tipoborna191` text,
`buzon_origen_tipoborna191` text,
`buzon_destino_tipoborna191` text,
`nemo_tipoborna192` text,
`idbuzon_tipoborna192` text,
`buzon_origen_tipoborna192` text,
`buzon_destino_tipoborna192` text,
`nemo_tipoborna193` text,
`idbuzon_tipoborna193` text,
`buzon_origen_tipoborna193` text,
`buzon_destino_tipoborna193` text,
`nemo_tipoborna194` text,
`idbuzon_tipoborna194` text,
`buzon_origen_tipoborna194` text,
`buzon_destino_tipoborna194` text,
`nemo_tipoborna195` text,
`idbuzon_tipoborna195` text,
`buzon_origen_tipoborna195` text,
`buzon_destino_tipoborna195` text,
`nemo_tipoborna196` text,
`idbuzon_tipoborna196` text,
`buzon_origen_tipoborna196` text,
`buzon_destino_tipoborna196` text,
`nemo_tipoborna197` text,
`idbuzon_tipoborna197` text,
`buzon_origen_tipoborna197` text,
`buzon_destino_tipoborna197` text,
`nemo_tipoborna198` text,
`idbuzon_tipoborna198` text,
`buzon_origen_tipoborna198` text,
`buzon_destino_tipoborna198` text,
`nemo_tipoborna199` text,
`idbuzon_tipoborna199` text,
`buzon_origen_tipoborna199` text,
`buzon_destino_tipoborna199` text,
`nemo_tipoborna200` text,
`idbuzon_tipoborna200` text,
`buzon_origen_tipoborna200` text,
`buzon_destino_tipoborna200` text,
`nemo_tipoborna201` text,
`idbuzon_tipoborna201` text,
`buzon_origen_tipoborna201` text,
`buzon_destino_tipoborna201` text,
`nemo_tipoborna202` text,
`idbuzon_tipoborna202` text,
`buzon_origen_tipoborna202` text,
`buzon_destino_tipoborna202` text,
`nemo_tipoborna203` text,
`idbuzon_tipoborna203` text,
`buzon_origen_tipoborna203` text,
`buzon_destino_tipoborna203` text,
`nemo_tipoborna204` text,
`idbuzon_tipoborna204` text,
`buzon_origen_tipoborna204` text,
`buzon_destino_tipoborna204` text,
`nemo_tipoborna205` text,
`idbuzon_tipoborna205` text,
`buzon_origen_tipoborna205` text,
`buzon_destino_tipoborna205` text,
`nemo_tipoborna206` text,
`idbuzon_tipoborna206` text,
`buzon_origen_tipoborna206` text,
`buzon_destino_tipoborna206` text,
`nemo_tipoborna207` text,
`idbuzon_tipoborna207` text,
`buzon_origen_tipoborna207` text,
`buzon_destino_tipoborna207` text,
`nemo_tipoborna208` text,
`idbuzon_tipoborna208` text,
`buzon_origen_tipoborna208` text,
`buzon_destino_tipoborna208` text,
`nemo_tipoborna209` text,
`idbuzon_tipoborna209` text,
`buzon_origen_tipoborna209` text,
`buzon_destino_tipoborna209` text,
`nemo_tipoborna210` text,
`idbuzon_tipoborna210` text,
`buzon_origen_tipoborna210` text,
`buzon_destino_tipoborna210` text,
`nemo_tipoborna211` text,
`idbuzon_tipoborna211` text,
`buzon_origen_tipoborna211` text,
`buzon_destino_tipoborna211` text,
`nemo_tipoborna212` text,
`idbuzon_tipoborna212` text,
`buzon_origen_tipoborna212` text,
`buzon_destino_tipoborna212` text,
`nemo_tipoborna213` text,
`idbuzon_tipoborna213` text,
`buzon_origen_tipoborna213` text,
`buzon_destino_tipoborna213` text,
`nemo_tipoborna214` text,
`idbuzon_tipoborna214` text,
`buzon_origen_tipoborna214` text,
`buzon_destino_tipoborna214` text,
`nemo_tipoborna215` text,
`idbuzon_tipoborna215` text,
`buzon_origen_tipoborna215` text,
`buzon_destino_tipoborna215` text,
`nemo_tipoborna216` text,
`idbuzon_tipoborna216` text,
`buzon_origen_tipoborna216` text,
`buzon_destino_tipoborna216` text,
`nemo_tipoborna217` text,
`idbuzon_tipoborna217` text,
`buzon_origen_tipoborna217` text,
`buzon_destino_tipoborna217` text,
`nemo_tipoborna218` text,
`idbuzon_tipoborna218` text,
`buzon_origen_tipoborna218` text,
`buzon_destino_tipoborna218` text,
`nemo_tipoborna219` text,
`idbuzon_tipoborna219` text,
`buzon_origen_tipoborna219` text,
`buzon_destino_tipoborna219` text,
`nemo_tipoborna220` text,
`idbuzon_tipoborna220` text,
`buzon_origen_tipoborna220` text,
`buzon_destino_tipoborna220` text,
`nemo_tipoborna221` text,
`idbuzon_tipoborna221` text,
`buzon_origen_tipoborna221` text,
`buzon_destino_tipoborna221` text,
`nemo_tipoborna222` text,
`idbuzon_tipoborna222` text,
`buzon_origen_tipoborna222` text,
`buzon_destino_tipoborna222` text,
`nemo_tipoborna223` text,
`idbuzon_tipoborna223` text,
`buzon_origen_tipoborna223` text,
`buzon_destino_tipoborna223` text,
`nemo_tipoborna224` text,
`idbuzon_tipoborna224` text,
`buzon_origen_tipoborna224` text,
`buzon_destino_tipoborna224` text,
`nemo_tipoborna225` text,
`idbuzon_tipoborna225` text,
`buzon_origen_tipoborna225` text,
`buzon_destino_tipoborna225` text,
`nemo_tipoborna226` text,
`idbuzon_tipoborna226` text,
`buzon_origen_tipoborna226` text,
`buzon_destino_tipoborna226` text,
`nemo_tipoborna227` text,
`idbuzon_tipoborna227` text,
`buzon_origen_tipoborna227` text,
`buzon_destino_tipoborna227` text,
`nemo_tipoborna228` text,
`idbuzon_tipoborna228` text,
`buzon_origen_tipoborna228` text,
`buzon_destino_tipoborna228` text,
`nemo_tipoborna229` text,
`idbuzon_tipoborna229` text,
`buzon_origen_tipoborna229` text,
`buzon_destino_tipoborna229` text,
`nemo_tipoborna230` text,
`idbuzon_tipoborna230` text,
`buzon_origen_tipoborna230` text,
`buzon_destino_tipoborna230` text,
`nemo_tipoborna231` text,
`idbuzon_tipoborna231` text,
`buzon_origen_tipoborna231` text,
`buzon_destino_tipoborna231` text,
`nemo_tipoborna232` text,
`idbuzon_tipoborna232` text,
`buzon_origen_tipoborna232` text,
`buzon_destino_tipoborna232` text,
`nemo_tipoborna233` text,
`idbuzon_tipoborna233` text,
`buzon_origen_tipoborna233` text,
`buzon_destino_tipoborna233` text,
`nemo_tipoborna234` text,
`idbuzon_tipoborna234` text,
`buzon_origen_tipoborna234` text,
`buzon_destino_tipoborna234` text,
`nemo_tipoborna235` text,
`idbuzon_tipoborna235` text,
`buzon_origen_tipoborna235` text,
`buzon_destino_tipoborna235` text,
`nemo_tipoborna236` text,
`idbuzon_tipoborna236` text,
`buzon_origen_tipoborna236` text,
`buzon_destino_tipoborna236` text,
`nemo_tipoborna237` text,
`idbuzon_tipoborna237` text,
`buzon_origen_tipoborna237` text,
`buzon_destino_tipoborna237` text,
`nemo_tipoborna238` text,
`idbuzon_tipoborna238` text,
`buzon_origen_tipoborna238` text,
`buzon_destino_tipoborna238` text,
`nemo_tipoborna239` text,
`idbuzon_tipoborna239` text,
`buzon_origen_tipoborna239` text,
`buzon_destino_tipoborna239` text,
`nemo_tipoborna240` text,
`idbuzon_tipoborna240` text,
`buzon_origen_tipoborna240` text,
`buzon_destino_tipoborna240` text,
`nemo_tipoborna241` text,
`idbuzon_tipoborna241` text,
`buzon_origen_tipoborna241` text,
`buzon_destino_tipoborna241` text,
`nemo_tipoborna242` text,
`idbuzon_tipoborna242` text,
`buzon_origen_tipoborna242` text,
`buzon_destino_tipoborna242` text,
`nemo_tipoborna243` text,
`idbuzon_tipoborna243` text,
`buzon_origen_tipoborna243` text,
`buzon_destino_tipoborna243` text,
`nemo_tipoborna244` text,
`idbuzon_tipoborna244` text,
`buzon_origen_tipoborna244` text,
`buzon_destino_tipoborna244` text,
`nemo_tipoborna245` text,
`idbuzon_tipoborna245` text,
`buzon_origen_tipoborna245` text,
`buzon_destino_tipoborna245` text,
`nemo_tipoborna246` text,
`idbuzon_tipoborna246` text,
`buzon_origen_tipoborna246` text,
`buzon_destino_tipoborna246` text,
`nemo_tipoborna247` text,
`idbuzon_tipoborna247` text,
`buzon_origen_tipoborna247` text,
`buzon_destino_tipoborna247` text,
`nemo_tipoborna248` text,
`idbuzon_tipoborna248` text,
`buzon_origen_tipoborna248` text,
`buzon_destino_tipoborna248` text,
`nemo_tipoborna249` text,
`idbuzon_tipoborna249` text,
`buzon_origen_tipoborna249` text,
`buzon_destino_tipoborna249` text,
`nemo_tipoborna250` text,
`idbuzon_tipoborna250` text,
`buzon_origen_tipoborna250` text,
`buzon_destino_tipoborna250` text,
`nemo_tipoborna251` text,
`idbuzon_tipoborna251` text,
`buzon_origen_tipoborna251` text,
`buzon_destino_tipoborna251` text,
`nemo_tipoborna252` text,
`idbuzon_tipoborna252` text,
`buzon_origen_tipoborna252` text,
`buzon_destino_tipoborna252` text,
`nemo_tipoborna253` text,
`idbuzon_tipoborna253` text,
`buzon_origen_tipoborna253` text,
`buzon_destino_tipoborna253` text,
`nemo_tipoborna254` text,
`idbuzon_tipoborna254` text,
`buzon_origen_tipoborna254` text,
`buzon_destino_tipoborna254` text,
`nemo_tipoborna255` text,
`idbuzon_tipoborna255` text,
`buzon_origen_tipoborna255` text,
`buzon_destino_tipoborna255` text,
  `eliminado` text,
  `activo` text,
  PRIMARY KEY  (`_idlvp3`),
  KEY `clvp3` USING BTREE (`f1`(10),`f2`(10),`f3`(10),`f4`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--
--

LOCK TABLES `LVP3` WRITE;
UNLOCK TABLES;



--




--
-- Table structure for table `blanca`
--

DROP TABLE IF EXISTS `blanca`;
CREATE TABLE `blanca` (
  `_idblanca` int(11) NOT NULL auto_increment,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `fecha` text,
  `hora` text,
  `puerto` text,
  `comando` text,
  `borna` text,	
  `tpsed` text,
  `tpsea` text,
  `tpssd` text,
  `tpssa` text,
  `tpsconsigna` text,
  `lector` text,
  `activo` text,
  `eliminado` text,
  `tcaso0` text,
  `tcaso1` text,
  PRIMARY KEY  (`_idblanca`),
  KEY `ctpsed` (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10),`tpsed`(10)),
  KEY `ctpsea` (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10),`tpsea`(10)),
  KEY `ctpssd` (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10),`tpssd`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blanca`
--

LOCK TABLES `blanca` WRITE;
/*!40000 ALTER TABLE `blanca` DISABLE KEYS */;
/*!40000 ALTER TABLE `blanca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busquedaslvps`
--

DROP TABLE IF EXISTS `busquedaslvps`;
CREATE TABLE `busquedaslvps` (
  `_idbusquedaslvps` int(11) NOT NULL auto_increment,
  `tipolvp` text,
  `tipodriver` text,
  `nombrelvp` text,
  `estado` text,
  PRIMARY KEY  (`_idbusquedaslvps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `busquedaslvps`
--

LOCK TABLES `busquedaslvps` WRITE;
/*!40000 ALTER TABLE `busquedaslvps` DISABLE KEYS */;
INSERT INTO `busquedaslvps` VALUES (1,'driver','ibercomp','1','0'),(2,'driver','Clip','1','0'),(3,'condiciones',NULL,'2','0'),(4,'driver','Circontrol','1','0'),(5,'driver','Nitgenserie','1','0'),(6,'driver','Clip','3','0');
/*!40000 ALTER TABLE `busquedaslvps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicioneshilotpi`
--

DROP TABLE IF EXISTS `condicioneshilotpi`;
CREATE TABLE `condicioneshilotpi` (
  `_idcondicioneshilotpi` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `identificacionhilo` text,
  `contenedor` text,
  `tcaso` text,
  `tpi` text,
  `condicion` text,
  `tcasotpsed` text,
  `eliminado` text,
  PRIMARY KEY  (`_idcondicioneshilotpi`),
  UNIQUE KEY `ctpi` (`identificacionhilo`(10),`contenedor`(10),`tpi`(10),`condicion`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `condicioneshilotpi`
--

--
-- Table structure for table `condicioneshilotprs`
--

DROP TABLE IF EXISTS `condicioneshilotprs`;
CREATE TABLE `condicioneshilotprs` (
  `_idcondicioneshilotprs` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `contenedortps` text,
  `tprs` text,
  `condicion` text,
  `posicionespcondicion` text,
  `tcasotpsed` text,
  `eliminado` text,
  PRIMARY KEY  (`_idcondicioneshilotprs`),
  KEY `ctprs` (`contenedortps`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `condicioneshilotprs`
--

--
-- Table structure for table `fallidosgeneralsistema`
--

DROP TABLE IF EXISTS `fallidosgeneralsistema`;
CREATE TABLE `fallidosgeneralsistema` (
  `_idfallidosgeneralsistema` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `lector` text,
  `tablalector` text,
  `numerotarjeta` text,
  PRIMARY KEY  (`_idfallidosgeneralsistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fallidosgeneralsistema`
--

LOCK TABLES `fallidosgeneralsistema` WRITE;
/*!40000 ALTER TABLE `fallidosgeneralsistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `fallidosgeneralsistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fallidoslocalsistema_a`
--

DROP TABLE IF EXISTS `fallidoslocalsistema_a`;
CREATE TABLE `fallidoslocalsistema_a` (
  `_idfallidoslocalsistema_a` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `numerotarjeta` text,
  `tablalector` text,
  `lector8` text,
  `lector1` text,
  `lector6` text,
  `lector2` text,
  `lector3` text,
  `lector5` text,
  PRIMARY KEY  (`_idfallidoslocalsistema_a`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fallidoslocalsistema_a`
--

LOCK TABLES `fallidoslocalsistema_a` WRITE;
/*!40000 ALTER TABLE `fallidoslocalsistema_a` DISABLE KEYS */;
/*!40000 ALTER TABLE `fallidoslocalsistema_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiascortinillas`
--

DROP TABLE IF EXISTS `familiascortinillas`;
CREATE TABLE `familiascortinillas` (
  `cortinillas` text,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `f6` text,
  `f7` text,
  `f8` text,
  `f9` text,
  `f10` text,
  `activo` text,
  UNIQUE KEY `cfamilias` (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10),`f6`(10),`f7`(10),`f8`(10),`f9`(10),`f10`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `familiascortinillas`
--

LOCK TABLES `familiascortinillas` WRITE;
/*!40000 ALTER TABLE `familiascortinillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiascortinillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuerahorario`
--

DROP TABLE IF EXISTS `fuerahorario`;
CREATE TABLE `fuerahorario` (
  `_idfuerahorario` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `numerotarjeta` text,
  `nombre` text,
  `dni` text,
  `numerosocio` text,
  `direccion` text,
  `tarjeta` text,
  `telefonofijo` text,
  `telefonomovil` text,
  `fechanacimiento` text,
  `edad` text,
  `bonificacion` text,
  `tablalector` text,
  `lector` text,
  PRIMARY KEY  (`_idfuerahorario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fuerahorario`
--

LOCK TABLES `fuerahorario` WRITE;
/*!40000 ALTER TABLE `fuerahorario` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuerahorario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hiloscapsulatpssd`
--

DROP TABLE IF EXISTS `hiloscapsulatpssd`;
CREATE TABLE `hiloscapsulatpssd` (
  `_idhiloscapsulatpssd` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `capsula` text,
  `posicionespcapsula` text,
  `numerocapsula` text,
  `tipodriver` text,
  PRIMARY KEY  (`_idhiloscapsulatpssd`),
  KEY `ccapsula` (`capsula`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hiloscapsulatpssd`
--

--
-- Table structure for table `historicoverde`
--

DROP TABLE IF EXISTS `historicoverde`;
CREATE TABLE `historicoverde` (
  `_idhistoricoverde` int(11) NOT NULL auto_increment,
  `fecha` text,
  `idbuzon` text,
  `buzon_destino` text,
  `nombrep` text,
  `_idbusquedaslvps` text,
  `tipolvp` text,
  `tipodriver` text,
  PRIMARY KEY  (`_idhistoricoverde`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historicoverde`
--

LOCK TABLES `historicoverde` WRITE;
/*!40000 ALTER TABLE `historicoverde` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicoverde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horariosasignados`
--

DROP TABLE IF EXISTS `horariosasignados`;
CREATE TABLE `horariosasignados` (
  `_idhorariosasignados` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `tarea` text,
  `acceso` text,
  `horario` text,
  `descripcionhorario` text,
  PRIMARY KEY  (`_idhorariosasignados`),
  UNIQUE KEY `master` (`tarea`(50),`acceso`(50),`horario`(50)),
  UNIQUE KEY `pulsador` (`tarea`(50),`horario`(50))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horariosasignados`
--

--
-- Table structure for table `iniciarhiloscapsulas`
--

DROP TABLE IF EXISTS `iniciarhiloscapsulas`;
CREATE TABLE `iniciarhiloscapsulas` (
  `_idiniciarhiloscapsulas` int(11) NOT NULL auto_increment,
  `tipodriver` text,
  `posicionespcapsula` text,
  `activo` text,
  PRIMARY KEY  (`_idiniciarhiloscapsulas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iniciarhiloscapsulas`
--

--
-- Table structure for table `karnaverde`
--

DROP TABLE IF EXISTS `karnaverde`;
CREATE TABLE `karnaverde` (
  `_idkarnaverde` int(11) NOT NULL auto_increment,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `f6` text,
  `f7` text,
  `f8` text,
  `f9` text,
  `f10` text,
  `tipodriver` text,
  `tipocomando` text,
  `puerto` text,
  `comando` text,
  `nemocomando` text,
  `nemoborna` text,
  `borna` text,
  `fecha` text,
  `ubicacion` text,
  `nemotecnico` text,
  `nemotecnicotps` text,
  `condicion` text,
  `nemotecnicotprs` text,
  `nemotecnicotpi` text,
  `tps` text,
  `tprs` text,
  `tpi` text,
  `tpri` text,
  `tpcm` text,
  `tpm` text,
  `tpmpc` text,
  `tpa` text,
  `tpis` text,
  `rojab` text,
  `tcasos` text,
  `tarea` text,
  `temporizado` text,	
  `activo` text,
  `eliminado` text,
  `descripcionhorario` text,
  `ajustedesde` text,
  `ajustehasta` text,
  `ajustepuntual` text,
  PRIMARY KEY  (`_idkarnaverde`),
  KEY `ctcampo` USING BTREE (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10),`f6`(10),`f7`(10),`f8`(10),`f9`(10),`f10`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karnaverde`
--

LOCK TABLES `karnaverde` WRITE;
/*!40000 ALTER TABLE `karnaverde` DISABLE KEYS */;
/*!40000 ALTER TABLE `karnaverde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lila`
--

DROP TABLE IF EXISTS `lila`;
CREATE TABLE `lila` (
  `_idlila` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `tpmpc` text,
  `tpssd` text,
  `tcaso` text,
  `condicion` text,
  `posicionespcondicion` text,
  `valor` text,
  `valor0` text,
  `valor1` text,
  `valorx` text,
  `eliminado` text,
  `activo` text,
  PRIMARY KEY  (`_idlila`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lila`
--

LOCK TABLES `lila` WRITE;
/*!40000 ALTER TABLE `lila` DISABLE KEYS */;
/*!40000 ALTER TABLE `lila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marron`
--

DROP TABLE IF EXISTS `marron`;
CREATE TABLE `marron` (
  `_idmarron` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `f6` text,
  `f7` text,
  `f8` text,
  `f9` text,
  `f10` text,
  `idcasohorario` text,
  `tarea` text,
  `temporizado` text,
  `descripcionhorario` text,
  `fechacreacionhorario` text,
  `descripcionsubhorario` text,
  `fechacreacionsubhorario` text,
  `fechainiciosubhorario` text,
  `fechafinsubhorario` text,
  `descripcionbloque` text,
  `fechacreacionbloque` text,
  `descripcionperiodo` text,
  `fechacreacionperiodo` text,
  `fechainicioperiodo` text,
  `intervalohoradesde` text,
  `intervalohorahasta` text,
  `intervalotiempo` text,
  `horapuntual` text,
  `tipogama` text,
  `fechafindiaria` text,
  `exceptofechafijadiaria` text,
  `frecuenciacadadiaria` text,
  `fechafinsemanal` text,
  `exceptofechafijasemanal` text,
  `frecuenciacadasemanal` text,
  `diassemanasemanal` text,
  `fechafinmensualdia` text,
  `exceptofechafijamensualdia` text,
  `frecuenciacadamensualdia` text,
  `fechafinmensualsemdia` text,
  `exceptofechafijamensualsemdia` text,
  `frecuenciacadamensualsemdia` text,
  `semananummensualsemdia` text,
  `diassemanamensualsemdia` text,
  `fechafinanual` text,
  `exceptofechafijaanual` text,
  `frecuenciacadaanual` text,
  `fechasfijas` text,
  `contenedortps` text,
  `tprs` text,
  `tpmpc` text,
  `tpis` text,
  `rojab` text,
  `tpssd` text,
  `tcaso` text,
  `condicion` text,
  `valor` text,
  `activo` text,
  `eliminado` text,
  `ajustedesde` text,
  `ajustehasta` text,
  `ajustepuntual` text,	
  PRIMARY KEY  (`_idmarron`),
  UNIQUE KEY `cfamilias` (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10),`f6`(10),`f7`(10),`f8`(10),`f9`(10),`f10`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marron`
--

LOCK TABLES `marron` WRITE;
/*!40000 ALTER TABLE `marron` DISABLE KEYS */;
/*!40000 ALTER TABLE `marron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masters`
--

DROP TABLE IF EXISTS `masters`;
CREATE TABLE `masters` (
  `_idmasters` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `tdato1` text,
  `tdato2` text,
  `tdato3` text,
  `tdato4` text,
  `tdato5` text,
  `tdato6` text,
  `tdato7` text,
  `tdato8` text,
  `tdato9` text,
  `tdato10` text,
  `tdato11` text,
  `tdato12` text,
  `tdato13` text,
  `tdato14` text,
  `tdato15` text,
  `tdato16` text,
  `tdato17` text,
  `tdato18` text,
  `tdato19` text,
  `tdato20` text,
  `tdato21` text,
  `tdato22` text,
  `tdato23` text,
  `tdato24` text,
  `tdato25` text,
  `tdato26` text,
  `tdato27` text,
  `tdato28` text,
  `tdato29` text,
  `tdato30` text,
  `tdato31` text,
  `tdato32` text,
  `tdato33` text,
  `tdato34` text,
  `tdato35` text,
  `tdato36` text,
  `tdato37` text,
  `tdato38` text,
  `tdato39` text,
  `tdato40` text,
  `tdato41` text,
  `tdato42` text,
  `tdato43` text,
  `tdato44` text,
  `tdato45` text,
  `tdato46` text,
  `tdato47` text,
  `tdato48` text,
  `tdato49` text,
  `tdato50` text,
  `tdato51` text,
  `tdato52` text,
  `tdato53` text,
  `tdato54` text,
  `tdato55` text,
  `tdato56` text,
  `tdato57` text,
  `tdato58` text,
  `tdato59` text,
  `tdato60` text,
  `tdato61` text,
  `tdato62` text,
  `tdato63` text,
  `tdato64` text,
  `tdato65` text,
  `tdato66` text,
  `tdato67` text,
  `tdato68` text,
  `tdato69` text,
  `tdato70` text,
  `tdato71` text,
  `tdato72` text,
  `tdato73` text,
  `tdato74` text,
  `tdato75` text,
  `tdato76` text,
  `tdato77` text,
  `tdato78` text,
  `tdato79` text,
  `tdato80` text,
  `tdato81` text,
  `tdato82` text,
  `tdato83` text,
  `tdato84` text,
  `tdato85` text,
  `tdato86` text,
  `tdato87` text,
  `tdato88` text,
  `tdato89` text,
  `tdato90` text,
  `tdato91` text,
  `tdato92` text,
  `tdato93` text,
  `tdato94` text,
  `tdato95` text,
  `tdato96` text,
  `tdato97` text,
  `tdato98` text,
  `tdato99` text,
  `tdato100` text,
  `numeromaster` text,
  `tablamaster` text,
  `nombre` text,
  `dni` text,
  `numerosocio` text,
  `direccion` text,
  `tarjeta` text,
  `telefonofijo` text,
  `telefonomovil` text,
  `fechanacimiento` text,
  `edad` text,
  `bonificacion` text,
  `poblacion` text,
  `codigopostal` text,
  PRIMARY KEY  (`_idmasters`),
  UNIQUE KEY `cmaster` (`numeromaster`(10),`tablamaster`(10)),
  UNIQUE KEY `cfechahora` (`fecha`(10),`hora`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masters`
--

--
-- Table structure for table `pasesgeneralsistema`
--

DROP TABLE IF EXISTS `pasesgeneralsistema`;
CREATE TABLE `pasesgeneralsistema` (
  `_idpasesgeneralsistema` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `lector` text,
  `tablalector` text,
  `numerotarjeta` text,
  PRIMARY KEY  (`_idpasesgeneralsistema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasesgeneralsistema`
--

LOCK TABLES `pasesgeneralsistema` WRITE;
/*!40000 ALTER TABLE `pasesgeneralsistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasesgeneralsistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramcondicioneshilotpi`
--

DROP TABLE IF EXISTS `ramcondicioneshilotpi`;
CREATE TABLE `ramcondicioneshilotpi` (
  `_idramcondicioneshilotpi` int(11) NOT NULL auto_increment,
  `identificacionhilo` varchar(64) default NULL,
  `contenedor` varchar(64) default NULL,
  `tcaso` varchar(64) default NULL,
  `tpi` varchar(64) default NULL,
  `condicion` varchar(64) default NULL,
  `tcasotpsed` varchar(5) default NULL,
  `eliminado` varchar(30) default NULL,
  PRIMARY KEY  (`_idramcondicioneshilotpi`),
  UNIQUE KEY `ctpi` (`identificacionhilo`(10),`contenedor`(10),`tpi`(10),`condicion`(10))
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ramcondicioneshilotpi`
--

LOCK TABLES `ramcondicioneshilotpi` WRITE;
/*!40000 ALTER TABLE `ramcondicioneshilotpi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ramcondicioneshilotpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramcondicioneshilotprs`
--

DROP TABLE IF EXISTS `ramcondicioneshilotprs`;
CREATE TABLE `ramcondicioneshilotprs` (
  `_idramcondicioneshilotprs` int(11) NOT NULL auto_increment,
  `contenedortps` varchar(64) default NULL,
  `tprs` varchar(64) default NULL,
  `condicion` varchar(64) default NULL,
  `posicionespcondicion` varchar(128) default NULL,
  `tcasotpsed` varchar(5) default NULL,
  `eliminado` varchar(30) default NULL,
  PRIMARY KEY  (`_idramcondicioneshilotprs`),
  KEY `ctprs` (`contenedortps`(10))
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ramcondicioneshilotprs`
--

LOCK TABLES `ramcondicioneshilotprs` WRITE;
/*!40000 ALTER TABLE `ramcondicioneshilotprs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ramcondicioneshilotprs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramhiloscapsulatpssd`
--

DROP TABLE IF EXISTS `ramhiloscapsulatpssd`;
CREATE TABLE `ramhiloscapsulatpssd` (
  `_idramhiloscapsulatpssd` int(11) NOT NULL auto_increment,
  `capsula` varchar(64) default NULL,
  `posicionespcapsula` varchar(128) default NULL,
  `numerocapsula` varchar(64) default NULL,
  `tipodriver` varchar(16) default NULL,
  PRIMARY KEY  (`_idramhiloscapsulatpssd`),
  KEY `ccapsula` (`capsula`(10))
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ramhiloscapsulatpssd`
--

LOCK TABLES `ramhiloscapsulatpssd` WRITE;
/*!40000 ALTER TABLE `ramhiloscapsulatpssd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ramhiloscapsulatpssd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramtpsea`
--

DROP TABLE IF EXISTS `ramtpsea`;
CREATE TABLE `ramtpsea` (
  `_idramtpsea` int(11) NOT NULL auto_increment,
  `puerto` varchar(64) default NULL,
  `comando` varchar(64) default NULL,
  `borna` varchar(64) default NULL,
  `tpsea` varchar(64) default NULL,
  `activo` varchar(5) default NULL,
  `eliminado` varchar(30) default NULL,
  PRIMARY KEY  (`_idramtpsea`),
  KEY `ctpsea` (`tpsea`(10))
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ramtpsea`
--

LOCK TABLES `ramtpsea` WRITE;
/*!40000 ALTER TABLE `ramtpsea` DISABLE KEYS */;
/*!40000 ALTER TABLE `ramtpsea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramtpsed`
--

DROP TABLE IF EXISTS `ramtpsed`;
CREATE TABLE `ramtpsed` (
  `_idramtpsed` int(11) NOT NULL auto_increment,
  `puerto` varchar(64) default NULL,
  `comando` varchar(64) default NULL,
  `borna` varchar(64) default NULL,
  `tpsed` varchar(64) default NULL,
  `tcaso0` varchar(5) default NULL,
  `tcaso1` varchar(5) default NULL,
  `activo` varchar(5) default NULL,
  `eliminado` varchar(30) default NULL,
  PRIMARY KEY  (`_idramtpsed`),
  KEY `ctpsed` (`tpsed`(10))
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ramtpsed`
--

LOCK TABLES `ramtpsed` WRITE;
/*!40000 ALTER TABLE `ramtpsed` DISABLE KEYS */;
/*!40000 ALTER TABLE `ramtpsed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramtpssdasignadas`
--

DROP TABLE IF EXISTS `ramtpssdasignadas`;
CREATE TABLE `ramtpssdasignadas` (
  `_idramtpssdasignadas` int(11) NOT NULL auto_increment,
  `contenedortps` varchar(64) default NULL,
  `tprs` varchar(64) default NULL,
  `tpssd` varchar(64) default NULL,
  `tcaso` varchar(64) default NULL,
  `condicion` varchar(64) default NULL,
  `posicionespcondicion` varchar(64) default NULL,
  `tcasotpsed` varchar(5) default NULL,
  `temporizado` varchar(15) default NULL,
  `eliminado` varchar(30) default NULL,
  PRIMARY KEY  (`_idramtpssdasignadas`),
  KEY `ctprs` (`contenedortps`(10),`tprs`(10),`tpssd`(10),`tcaso`(10)),
  KEY `ctps` (`contenedortps`(10),`tpssd`(10),`tcaso`(10))
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ramtpssdasignadas`
--

LOCK TABLES `ramtpssdasignadas` WRITE;
/*!40000 ALTER TABLE `ramtpssdasignadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ramtpssdasignadas` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `amarilla`;
CREATE TABLE `amarilla` (
  `_idamarilla` int(11) NOT NULL auto_increment,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `tps` text,
  `condicion` text,
  `tpi` text,
  `tprs` text,
  `tpmpc` text,
  `tpa` text,
  `tpis` text,
  `rojab` text,
  `idcasohorario` text,
  `tarea` text,
  `descripcionhorario` text,
  `fechacreacionhorario` text,
  `descripcionsubhorario` text,
  `fechacreacionsubhorario` text,
  `fechainiciosubhorario` text,
  `fechafinsubhorario` text,
  `descripcionbloque` text,
  `fechacreacionbloque` text,
  `descripcionperiodo` text,
  `fechacreacionperiodo` text,
  `fechainicioperiodo` text,
  `intervalohoradesde` text,
  `intervalohorahasta` text,
  `intervalotiempo` text,
  `horapuntual` text,
  `tipogama` text,
  `fechafindiaria` text,
  `exceptofechafijadiaria` text,
  `frecuenciacadadiaria` text,
  `fechafinsemanal` text,
  `exceptofechafijasemanal` text,
  `frecuenciacadasemanal` text,
  `diassemanasemanal` text,
  `fechafinmensualdia` text,
  `exceptofechafijamensualdia` text,
  `frecuenciacadamensualdia` text,
  `fechafinmensualsemdia` text,
  `exceptofechafijamensualsemdia` text,
  `frecuenciacadamensualsemdia` text,
  `semananummensualsemdia` text,
  `diassemanamensualsemdia` text,
  `fechafinanual` text,
  `exceptofechafijaanual` text,
  `frecuenciacadaanual` text,
  `fechasfijas` text,
  `eliminado` text,
  `activo` text,
  `ajustedesde` text,
  `ajustehasta` text,
  `ajustepuntual` text,	
  PRIMARY KEY  (`_idamarilla`),
  UNIQUE KEY `ctpi` (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amarilla`
--

LOCK TABLES `amarilla` WRITE;
/*!40000 ALTER TABLE `amarilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `amarilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rosa`
--

DROP TABLE IF EXISTS `rosa`;
CREATE TABLE `rosa` (
  `_idrosa` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `f1` text,
  `f2` text,
  `f3` text,
  `f4` text,
  `f5` text,
  `f6` text,
  `f7` text,
  `f8` text,
  `f9` text,
  `f10` text,
  `lector` text,
  `tablalector` text,
  `activo` text,
  `eliminado` text,
  PRIMARY KEY  (`_idrosa`),
  KEY `clector` (`fecha`(10),`tablalector`(10)),
  KEY `ccircontrol` USING BTREE (`f1`(10),`f2`(10),`f3`(10),`f4`(10),`f5`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabla rosa ';

--
-- Dumping data for table `rosa`
--

LOCK TABLES `rosa` WRITE;
/*!40000 ALTER TABLE `rosa` DISABLE KEYS */;
/*!40000 ALTER TABLE `rosa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
CREATE TABLE `tarjetas` (
  `_idtarjetas` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `numerotarjeta` text,
  `tablatarjeta` text,
  PRIMARY KEY  (`_idtarjetas`),
  UNIQUE KEY `cnumerotarjeta` (`numerotarjeta`(10)),
  UNIQUE KEY `cfechahora` (`fecha`(10),`hora`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarjetas`
--

LOCK TABLES `tarjetas` WRITE;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpssdasignadas`
--

DROP TABLE IF EXISTS `tpssdasignadas`;
CREATE TABLE `tpssdasignadas` (
  `_idtpssdasignadas` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `contenedortps` text,
  `tprs` text,
  `tpssd` text,
  `tcaso` text,
  `condicion` text,
  `posicionespcondicion` text,
  `tcasotpsed` text,
  `eliminado` text,
  `temporizado` text,
  PRIMARY KEY  (`_idtpssdasignadas`),
  KEY `ctprs` (`contenedortps`(10),`tprs`(10),`tpssd`(10),`tcaso`(10)),
  KEY `ctps` (`contenedortps`(10),`tpssd`(10),`tcaso`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tpssdasignadas`
--

LOCK TABLES `tpssdasignadas` WRITE;
/*!40000 ALTER TABLE `tpssdasignadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpssdasignadas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-03-24 16:16:00

--
-- Table structure for table `hilostpa`
--

DROP TABLE IF EXISTS `hilostpa`;
CREATE TABLE `hilostpa` (
  `_idhilostpa` int(11) NOT NULL auto_increment,
  `fecha` text,
  `hora` text,
  `identificacionhilo` text,
  `tpa` text,
  `condicion` text,
  `posicionesp` text,
  `eliminado` text,
  PRIMARY KEY  (`_idhilostpa`),
  KEY `ctpa` (`tpa`(10))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hilostpa`
--

--
-- Table structure for table `ramhilostpa`
--

DROP TABLE IF EXISTS `ramhilostpa`;
CREATE TABLE `ramhilostpa` (
  `_idramhilostpa` int(11) NOT NULL auto_increment,
  `identificacionhilo` varchar(64) default NULL,
  `tpa` varchar(64) default NULL,
  `condicion` varchar(64) default NULL,
  `posicionesp` varchar(128) default NULL,
  `eliminado` varchar(30) default NULL,
  PRIMARY KEY  (`_idramhilostpa`),
  KEY `ctpa` (`tpa`(10))
) ENGINE=MEMORY AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


--11-11-2009

--
-- Table structure for table `hiloscapsulatpss`
--

DROP TABLE IF EXISTS `hiloscapsulatpss`;
CREATE TABLE `hiloscapsulatpss` (
  `_idhiloscapsulatpss` int(11) NOT NULL auto_increment,
  `fecha` text,
  `tpss` text,
  `tipodriver` text,
  `numeroborna` text,
  `posicionespcapsula` text,
  PRIMARY KEY  (`_idhiloscapsulatpss`),
  UNIQUE KEY `ccapsula` (`tpss`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hiloscapsulatpss`
--

--
-- Table structure for table `intercambiadorboton`
--

DROP TABLE IF EXISTS `intercambiadorboton`;
CREATE TABLE `intercambiadorboton` (
  `_idintercambiadorboton` int(11) NOT NULL auto_increment,
  `fecha` text,
  `nombretablatpc` text,
  `nombrefuncion` text,
  PRIMARY KEY  (`_idintercambiadorboton`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intercambiadorboton`
--

--
-- Table structure for table `tpssasignadas`
--

DROP TABLE IF EXISTS `tpssasignadas`;
CREATE TABLE `tpssasignadas` (
  `_idtpssasignadas` int(11) NOT NULL auto_increment,
  `fecha` text,
  `tpentrada` text,
  `tpsssalida` text,
  `seudoborna` text,
  PRIMARY KEY  (`_idtpssasignadas`),
  UNIQUE KEY `ctpss` (`tpentrada`(10),`tpsssalida`(10),`seudoborna`(10))  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tpssasignadas`
--