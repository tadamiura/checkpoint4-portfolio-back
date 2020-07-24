-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: portfolio_tada
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `about_me`
--

DROP TABLE IF EXISTS `about_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_me` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `description` text,
  `about` text,
  `email` varchar(100) DEFAULT NULL,
  `github_profil` text,
  `linkedin_profil` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_me`
--

LOCK TABLES `about_me` WRITE;
/*!40000 ALTER TABLE `about_me` DISABLE KEYS */;
INSERT INTO `about_me` VALUES (1,'Tadatoshi','Miura','Développeur web Fullstack JavaScript/ React/ Node.js','Chef de projet sport en entreprise et préparateur physique, je poursuis mon parcours en tant que développeur web dans le cadre d\'une reconversion professionnelle. \n\nL\'une de mes réussites a été la conception d\'un espace sportif et la mise en place d\'activités dans le cadre d\'un projet QVT pour l\'un des plus grands employeurs d’Île-de-France. En équipe, nous avons proposé pour la première fois une digitalisation de l\'expérience pour les collaborateurs de cette entreprise : adhésion et réservation en ligne pour la pratique sportive, utilisation d\'une application de partage d\'informations.\n\nMa compréhension de la demande client et ma capacité à échanger en équipe pour délivrer le meilleur résultat vont être complétées par de solides bases techniques et une méthodologie d\'apprentissage caractéristiques d\'un développeur web. \n','tadamiura@gmail.com','https://github.com/tadamiura','https://www.linkedin.com/in/tadatoshimiura/');
/*!40000 ALTER TABLE `about_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` text,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'https://imagizer.imageshack.com/img923/4425/MrWzae.png','PAW'),(2,'https://media-exp1.licdn.com/dms/image/C5622AQFQSHLgtQukRQ/feedshare-shrink_800/0?e=1598486400&v=beta&t=exjr_-4WRLDv2oT8EcuixedAtpbNu1KIe_8d-zMBX24','Wicked Workout'),(3,'https://imagizer.imageshack.com/img922/7540/y7I97d.png','HowToBeFat'),(4,'https://imagizer.imageshack.com/img923/2710/r0Yqhh.png','Feel Back'),(5,'https://imagizer.imageshack.com/img924/1086/M15Qoq.png','MVO formation'),(6,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','Covid Run'),(7,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','portfolio'),(8,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','portfolio'),(9,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','portfolio'),(10,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','portfolio'),(11,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','portfolio'),(12,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','portfolio'),(13,'https://imagizer.imageshack.com/img923/2791/mQuqO5.png','portfolio');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_project`
--

DROP TABLE IF EXISTS `gallery_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_project` (
  `id_gallery` int DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  KEY `fk_gallery_project_ig_gallery_idx` (`id_gallery`),
  KEY `fk_gallery_project_id_project_idx` (`id_project`),
  CONSTRAINT `fk_gallery_project_id_gallery` FOREIGN KEY (`id_gallery`) REFERENCES `gallery` (`id`),
  CONSTRAINT `fk_gallery_project_id_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_project`
--

LOCK TABLES `gallery_project` WRITE;
/*!40000 ALTER TABLE `gallery_project` DISABLE KEYS */;
INSERT INTO `gallery_project` VALUES (1,1),(2,4),(3,2),(4,3),(5,5),(6,6),(10,NULL),(10,24);
/*!40000 ALTER TABLE `gallery_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_title` varchar(80) NOT NULL,
  `project_description` text NOT NULL,
  `github_link` text,
  `app_link` text,
  `date_creation` date DEFAULT NULL,
  `duration` varchar(80) DEFAULT NULL,
  `url_name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'PAW','Pastries around the World','https://github.com/tadamiura/Projet1PAW','https://tadamiura.github.io/Projet1PAW/','2020-03-09','5 jours','paw'),(2,'HowToBeFat','Become Fat ','https://github.com/WildCodeSchool/paris-0320-project2-howToBeFat','https://how-to-be-fat.netlify.app/','2020-04-10','5 semaines','howtobefat'),(3,'Feel Back','Hackathon x Doctolib','https://github.com/tadamiura/hackathon-SoDoc-back','','2020-06-24','48 heures','feelback'),(4,'Wicked Workout','Fitness HIIT App','https://github.com/tadamiura/fitness-app','https://vibrant-spence-54f21b.netlify.app/','2020-06-25','72 hours','wickedworkout'),(5,'MVO Formation','Refonte du site de MVO Formation','https://github.com/WildCodeSchool/paris-react-2003-pjt3-mvoformation-front','','2020-06-01','12 semaines','mvoformation'),(6,'Covid Run','Hackathon : jeux en React JS','https://github.com/tadamiura/covidrun','https://github.com/tadamiura/covidrun','2020-05-18','24 heures','covidrun'),(15,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(16,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(17,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(18,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(19,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(20,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(21,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(22,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(23,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(24,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(25,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(26,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio'),(27,'Portfolio','checkpoint 4 wcs','test','test','2020-07-22','48 heures','portfolio');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack`
--

DROP TABLE IF EXISTS `stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack`
--

LOCK TABLES `stack` WRITE;
/*!40000 ALTER TABLE `stack` DISABLE KEYS */;
INSERT INTO `stack` VALUES (1,'HTML5/ CSS3 /JS'),(2,'React/CSS'),(3,'Node.js/ Express/React/CSS'),(7,'Node.js/ Express/React/CSS'),(8,'SQL/Node.js/ Express/React/CSS');
/*!40000 ALTER TABLE `stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack_project`
--

DROP TABLE IF EXISTS `stack_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stack_project` (
  `id_project` int DEFAULT NULL,
  `id_stack` int DEFAULT NULL,
  KEY `fk_stack_project_id_stack_idx` (`id_stack`),
  KEY `fk_stack_project_id_project_idx` (`id_project`),
  CONSTRAINT `fk_stack_project_id_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_stack_project_id_stack` FOREIGN KEY (`id_stack`) REFERENCES `stack` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack_project`
--

LOCK TABLES `stack_project` WRITE;
/*!40000 ALTER TABLE `stack_project` DISABLE KEYS */;
INSERT INTO `stack_project` VALUES (1,1),(2,2),(3,3),(4,2),(5,3),(6,2);
/*!40000 ALTER TABLE `stack_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-24 15:55:53
