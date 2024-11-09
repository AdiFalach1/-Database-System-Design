-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: catering
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `backup_employee`
--

DROP TABLE IF EXISTS `backup_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_employee` (
  `employee_id` int NOT NULL,
  `backup_employee_id` int NOT NULL,
  PRIMARY KEY (`employee_id`,`backup_employee_id`),
  KEY `backup_employee_id` (`backup_employee_id`),
  CONSTRAINT `backup_employee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `backup_employee_ibfk_2` FOREIGN KEY (`backup_employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_employee`
--

LOCK TABLES `backup_employee` WRITE;
/*!40000 ALTER TABLE `backup_employee` DISABLE KEYS */;
INSERT INTO `backup_employee` VALUES (202,201),(203,202),(201,203),(206,204),(204,205),(205,206),(208,207),(207,208),(210,209),(209,210);
/*!40000 ALTER TABLE `backup_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (101,'tamir','yaniv',541),(102,'adi','falach',542),(103,'enav','levi',543),(104,'ariel','berko',544),(105,'lin ','samchi',545),(106,'asaf','benor',546),(107,'shaked','mizrahi',547),(108,'liora','cohen',548),(109,'david','kariv',549),(110,'daniel','paz',5410),(111,'roni','kadosh',5411),(112,'shimi','pini',5412),(113,'yossi','sharon',5413);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `menu_id` int NOT NULL,
  `dish_name` varchar(45) NOT NULL,
  PRIMARY KEY (`menu_id`,`dish_name`),
  CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (301,'green salad '),(302,'orange juice'),(303,'crabs and garlic'),(304,'cocktail'),(305,'pizza'),(305,'ravioli and cream'),(306,'asado with potatoes'),(307,'tofu with tomato sauce '),(308,'quinoa salad'),(309,'salmon'),(310,'hamburger');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `domain` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (201,'hen','zilber',561,'chef'),(202,'dani','cohen',562,'chef'),(203,'eden','benita',563,'chef'),(204,'neta','elbaz',564,'waiter'),(205,'adir','nimni',565,'waiter'),(206,'ohad','bar',566,'waiter'),(207,'ophir','gabso',567,'cleaner'),(208,'guy','zehavi',568,'cleaner'),(209,'ofek','sabag',569,'manager'),(210,'ortal','ziv',5610,'manager');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_event`
--

DROP TABLE IF EXISTS `employee_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_event` (
  `employee_id` int NOT NULL,
  `event_id` int NOT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `employee_event_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `employee_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event_` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_event`
--

LOCK TABLES `employee_event` WRITE;
/*!40000 ALTER TABLE `employee_event` DISABLE KEYS */;
INSERT INTO `employee_event` VALUES (201,601,1000),(201,604,1000),(201,607,1000),(201,610,1000),(201,613,1000),(202,602,1000),(202,605,1000),(202,608,1000),(202,611,1000),(203,603,1000),(203,606,1000),(203,609,1000),(203,612,1000),(204,601,800),(204,604,800),(204,607,800),(204,610,800),(204,613,800),(205,602,800),(205,605,800),(205,608,800),(205,611,800),(206,603,800),(206,606,800),(206,609,800),(206,612,800),(207,601,500),(207,603,500),(207,605,500),(207,607,500),(207,609,500),(207,611,500),(207,613,500),(208,602,500),(208,604,500),(208,606,500),(208,608,500),(208,610,500),(208,612,500),(209,601,1200),(209,603,1200),(209,605,1200),(209,607,1200),(209,609,1200),(209,611,1200),(209,613,1200),(210,602,1200),(210,604,1200),(210,606,1200),(210,608,1200),(210,610,1200),(210,612,1200);
/*!40000 ALTER TABLE `employee_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_`
--

DROP TABLE IF EXISTS `event_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_` (
  `event_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `order_id` (`order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `event__ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_` (`order_id`),
  CONSTRAINT `event__ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_`
--

LOCK TABLES `event_` WRITE;
/*!40000 ALTER TABLE `event_` DISABLE KEYS */;
INSERT INTO `event_` VALUES (601,410,310),(602,409,305),(603,408,303),(604,407,309),(605,406,302),(606,405,308),(607,404,305),(608,403,301),(609,402,307),(610,401,310),(611,411,301),(612,412,304),(613,413,306);
/*!40000 ALTER TABLE `event_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL,
  `menu_type` varchar(45) DEFAULT NULL,
  `kosher_type` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (301,'mixed vegan and vegetarian','mehadrin',60),(302,'drinks','mehadrin',15),(303,'seafood',NULL,110),(304,'alcoholic drinks','regular',65),(305,'dairy','regular',85),(306,'meat','regular',150),(307,'vegetarian','glat',90),(308,'vegan','glat',70),(309,'fish','mehadrin',130),(310,'fast food','regular',50);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_`
--

DROP TABLE IF EXISTS `order_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_` (
  `order_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `street_num` int DEFAULT NULL,
  `guest_number` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `menu_id` (`menu_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `order__ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `order__ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_`
--

LOCK TABLES `order_` WRITE;
/*!40000 ALTER TABLE `order_` DISABLE KEYS */;
INSERT INTO `order_` VALUES (401,'2018-05-15','tel aviv','sheva',7,50,101,310),(402,'2018-05-29','ashkelon','bugrashov',65,207,105,307),(403,'2024-10-03','rishon leztion','pinsker',39,104,107,301),(404,'2014-08-11','kiryat ono','hakfar',10,162,103,305),(405,'2005-07-27','petah tikva','yagnes',7,207,105,308),(406,'2024-12-01','jerusalem','hermon',3,118,110,302),(407,'2020-04-30','tikva','hapardes',14,325,108,309),(408,'2023-08-28','haifa','bialik',40,46,103,303),(409,'2019-01-21','ramat gan','dan laner',13,23,102,305),(410,'2019-08-24','tikva','namir',25,74,104,310),(411,'2023-05-20','ramat gan','shtulim',1,13,106,301),(412,'2010-11-05','givat shmuel','bar lev',16,42,109,304),(413,'2013-08-08','rehovot','habalonim',2,68,106,306);
/*!40000 ALTER TABLE `order_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `inventory` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (501,'tomato',46,2,9),(502,'van gogh',10,140,5),(503,'salmon fish',32,70,6),(504,'quinoa',57,24,10),(505,'tofu',71,37,9),(506,'asado',47,110,7),(507,'cream',16,21,4),(508,'mince',42,114,7),(509,'orange',73,14,1),(510,'lettuce',27,9,10),(511,'crab',51,95,6),(512,'cutlery',130,47,2),(513,'cheese',45,22,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_menu`
--

DROP TABLE IF EXISTS `product_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_menu` (
  `menu_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`menu_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `product_menu_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_menu`
--

LOCK TABLES `product_menu` WRITE;
/*!40000 ALTER TABLE `product_menu` DISABLE KEYS */;
INSERT INTO `product_menu` VALUES (301,501),(308,501),(304,502),(309,503),(307,504),(308,505),(306,506),(305,507),(306,508),(310,508),(302,509),(307,510),(303,511),(305,513);
/*!40000 ALTER TABLE `product_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seniority`
--

DROP TABLE IF EXISTS `seniority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seniority` (
  `employee_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `seniority` int DEFAULT '0',
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seniority`
--

LOCK TABLES `seniority` WRITE;
/*!40000 ALTER TABLE `seniority` DISABLE KEYS */;
INSERT INTO `seniority` VALUES (201,'hen','zilber',0,'2024-03-09 10:26:06'),(202,'dani','cohen',9,'2024-03-09 10:26:06'),(203,'eden','benita',0,'2024-03-09 10:26:06'),(204,'neta','elbaz',13,'2024-03-09 10:26:06'),(205,'adir','nimni',0,'2024-03-09 10:26:06'),(206,'ohad','bar',0,'2024-03-09 10:26:06'),(208,'aDI','SXSK',0,'2024-03-09 13:31:43');
/*!40000 ALTER TABLE `seniority` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `emp_time` BEFORE INSERT ON `seniority` FOR EACH ROW BEGIN 
    SET NEW.last_update = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `phone_num` int DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'lightdrink',521),(2,'utility',522),(3,'freshspice',523),(4,'highcheese',524),(5,'alcohol',525),(6,'betterfish',526),(7,'primemeat',527),(8,'bestchicken',528),(9,'topvegen',529),(10,'bevegetarian',5210);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_price`
--

DROP TABLE IF EXISTS `total_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_price` (
  `order_id` int DEFAULT NULL,
  `total_price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_price`
--

LOCK TABLES `total_price` WRITE;
/*!40000 ALTER TABLE `total_price` DISABLE KEYS */;
INSERT INTO `total_price` VALUES (401,2250),(402,16767),(403,5616),(404,12393),(405,13041),(406,1593),(407,38025),(408,4554),(409,1760),(410,3330),(411,702),(412,2457),(413,9180);
/*!40000 ALTER TABLE `total_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'catering'
--

--
-- Dumping routines for database 'catering'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-09 13:33:29
