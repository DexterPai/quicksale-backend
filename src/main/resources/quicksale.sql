CREATE DATABASE  IF NOT EXISTS `quicksale` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quicksale`;
-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: quicksale
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Conciertos','Activo'),(2,'Teatro','Activo');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `age` int NOT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,20,'87654321','admin@cibertec.edu.pe','Admin','$2a$10$CpOIoeRLwH5Y6DtNl24Ia.Eb4Wk3d5M.He2NwoA5RJHTKnyodZoRa','admin','Activo'),
(2,20,'78654362','renato@cibertec.edu.pe','Renato Alvarez Torres','$2a$10$BowbwXED1zGszerUFHad/Op2D.3tzOz9BQbMUMPvjVXJ18h/qLUcO','User','Activo'),
(3,30,'87656473','maria@cibertec.edu.pe','Maria Lopez Rodriguez','$2a$10$vhzpwD8zdQtUJOOQerG9UuepnbgGSOFBrDY4qgZY25y5egVwELOQ2','User','Activo');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details_events`
--

DROP TABLE IF EXISTS `details_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details_events` (
  `id_details_events` int NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url_image_ref` varchar(255) DEFAULT NULL,
  `id_event` int DEFAULT NULL,
  PRIMARY KEY (`id_details_events`),
  UNIQUE KEY `UK_soq4vfceg3qgwvlspawngaw7l` (`id_event`),
  CONSTRAINT `FKpjx1qus01jdybcndxe8ye6pwn` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details_events`
--

LOCK TABLES `details_events` WRITE;
/*!40000 ALTER TABLE `details_events` DISABLE KEYS */;
INSERT INTO `details_events` VALUES (1,'* Apto solo para mayores de 18 años.','A.C.O vuelve a Lima este viernes 4 de julio con un show íntimo y potente en Aforo Barranco presentando su nuevo disco \"Parte del Proceso\". Una noche para vibrar con lo mejor de su discografía, conectar con su nueva música y celebrar junto a su gente.','Activo','A.C.O EN CONCIERTO - LIMA | PARTE DEL PROCESO','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Fact6846fe76005f8.jpg?alt=media&token=bf3e4f97-97c3-428d-8e1a-cabc19f3d0c4',1),(2,'* Apto para menores de 18 años en compañía de un adulto.','A Mirror es una obra que cuestiona la censura estatal, la autoría y la libertad de expresión. Es también una exploración lacerante y oscuramente cómica del arte. Ambientada en un estado totalitario en el que la censura está muy extendida, un grupo de rebeldes organiza una boda para dar a conocer al público su obra revolucionaria.','Activo','UN ESPEJO','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Funespejo.png?alt=media&token=dc81bb14-3adc-431c-8410-1dddf96303dc',2),(3,'* Apto para menores de 18 años en compañía de un adulto.','¡La comedia que conquistó Argentina llega a Perú con una dupla IMPERDIBLE! Aldo Miyashiro y Beto Ortiz, en su debut actoral, te harán reír y emocionarte con esta obra que ha cautivado a miles y ahora promete hacer historia en nuestra cartelera. ¡No te la pierdas!','Activo','Un rato con él','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Funratoconel.png?alt=media&token=de9b257f-b940-45b2-824e-bfc8106ca5ae',3),(4,'* Apto para menores de 18 años en compañía de un adulto.','Valentina, una joven estudiante que se gana la vida como modelo, salva la vida de un perro atropellado por un coche. La búsqueda de su dueño la conduce a un juez jubilado que tiene una extraña obsesión: escuchar las conversaciones telefónicas de sus vecinos. Si antes el espionaje telefónico formaba parte de su trabajo, ahora se ha convertido en un vicio. A Valentina le desagrada la conducta del hombre, pero no puede evitar ir a verlo.','Activo','TRES COLORES: ROJO','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Ftrilogiadecolores.png?alt=media&token=c8e3cad5-70d8-4317-aedc-bd7f8cf0bc05',4);
/*!40000 ALTER TABLE `details_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id_event` int NOT NULL AUTO_INCREMENT,
  `date_event` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tickets_quantity` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `unit_price` double NOT NULL,
  `id_category` int DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `FKnk6ifh9niq4ayqeldaoywoj80` (`id_category`),
  CONSTRAINT `FKnk6ifh9niq4ayqeldaoywoj80` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'2025-07-03','A.C.O presenta Parte del Proceso en Lima: rap, poesía y energía en una sola noche.','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Fact6846fe76005f8.jpg?alt=media&token=17873635-7e0f-4039-8d9e-09c038312746','Av. Almte. Miguel Grau 264, Barranco AFORO BARRANCO','Activo',500,'A.C.O EN CONCIERTO - LIMA | PARTE DEL PROCESO',100,1),(2,'2025-10-09','UN ESPEJO es una obra que revela verdades incómodas sobre la familia, el control y la identidad.','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Funespejo.png?alt=media&token=75062213-7ef0-48fa-b79d-cd3c31b0b01b','Larcomar, Mal. de la Reserva 610, Miraflores 15074','Activo',100,'UN ESPEJO',50,2),(3,'2025-07-15','Dos hombres, una conversación incómoda y muchas verdades por enfrentar. Ortiz y Miyashiro en escena.','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Funratoconel.png?alt=media&token=205f1fab-91d2-44e1-bcde-2f8e7d14e26c','Nuevo Teatro Julieta Pasaje Porta 132 Miraflores','Activo',100,'Un rato con él',30,2),(4,'2025-07-10','Tres historias, tres colores, una mirada profunda a la libertad, la igualdad y la fraternidad según Kieslowski.','https://firebasestorage.googleapis.com/v0/b/quicksale-dev.firebasestorage.app/o/images%2Ftrilogiadecolores.png?alt=media&token=6b11efd5-4556-4007-a94a-ecc854c06d4e','SALA AZUL - CENTRO CULTURAL PUCP Av. Camino Real 1075, San Isidro','Activo',200,'TRES COLORES: ROJO',80,2);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_payment`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Tarjeta de crédito/débito','Activo'),(2,'Pagoefectivo','Activo'),(3,'Yape/Plin','Activo');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id_sale` int NOT NULL AUTO_INCREMENT,
  `operation_number` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `sale_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total` double NOT NULL,
  `id_customer` int DEFAULT NULL,
  `id_event` int DEFAULT NULL,
  `id_payment` int DEFAULT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `FK3hr6y9fbobf1qsre9v41yxdft` (`id_customer`),
  KEY `FKr7rfyitdakf6hxnu7qqffu3jv` (`id_event`),
  KEY `FKnxxdounuuj3wxj6te79m0482h` (`id_payment`),
  CONSTRAINT `FK3hr6y9fbobf1qsre9v41yxdft` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `FKnxxdounuuj3wxj6te79m0482h` FOREIGN KEY (`id_payment`) REFERENCES `payment` (`id_payment`),
  CONSTRAINT `FKr7rfyitdakf6hxnu7qqffu3jv` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'00001',1,'2025-06-30','Activo',0,2,1,1),(2,'00002',1,'2025-06-30','Activo',0,2,3,1),(3,'00003',4,'2025-06-30','Activo',0,3,4,3),(4,'00004',2,'2025-06-30','Activo',0,3,2,3);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watson`
--

DROP TABLE IF EXISTS `watson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watson` (
  `id_watson` int NOT NULL AUTO_INCREMENT,
  `email_customer` varchar(255) DEFAULT NULL,
  `name_event` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id_watson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watson`
--

LOCK TABLES `watson` WRITE;
/*!40000 ALTER TABLE `watson` DISABLE KEYS */;
/*!40000 ALTER TABLE `watson` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30 13:33:02
