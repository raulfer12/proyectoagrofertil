-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: agrofertil
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ProductoId` int NOT NULL AUTO_INCREMENT,
  `ProductoNombre` varchar(120) NOT NULL,
  `ProductoDescripcion` varchar(1000) NOT NULL,
  `ProductoPrecioVenta` decimal(9,2) NOT NULL,
  `ProductoPrecioCompra` decimal(9,2) NOT NULL,
  `ProductoEst` char(3) NOT NULL,
  `ProductoStock` int NOT NULL,
  PRIMARY KEY (`ProductoId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'VitaCerdo Lactancia',
'Comida inicial premium para cerdo',730.00,690.00,'ACT',80),
(2,'VitaPostura Preinicio',
'Comida inicial premium para gallinas ponedoras',730.00,690.00,'ACT',90),
(3,'AliEngorde 1 Harina',
'Etapa inicial de alimento para aves de engorde',730.00,690.00,'ACT',100),
(4,'AliEngorde 2 Harina',
'Segunda etapa de alimento para aves de engorde',730.00,690.00,'ACT',100),
(5,'AliPonedora 1',
'Alimento para aves de postura',730.00,690.00,'ACT',100),
(6,'VitaEngorde Fin',
'Etapa Final de alimento para aves de engorde',730.00,690.00,'ACT',100),
(7,'VitaEngorde Inicio',
'Etapa inicial de alimento para aves de engorde',730.00,690.00,'ACT',100);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
