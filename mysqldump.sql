-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: Sales
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
-- Current Database: `Sales`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Sales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Sales`;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `StartDate` date NOT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE KEY `UQ_CustomerName` (`FirstName`,`LastName`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (27,'John','Customer','44 Overwatch','678-555-1234','2012-01-01'),(28,'Frank','Customer','989 Peachtree St','432-555-1234','2020-03-01'),(29,'Jill','Customer','1 North Main St','567-555-1234','2010-06-23');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `DiscountId` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `BeginDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `DiscountPct` decimal(5,4) NOT NULL,
  PRIMARY KEY (`DiscountId`),
  KEY `FK_Discount_Product_idx` (`ProductId`),
  CONSTRAINT `FK_Discount_Product` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES (36,53,'2022-01-01',NULL,0.2698),(37,52,'2022-01-01',NULL,0.4387),(38,54,'2022-01-01',NULL,0.3840),(39,56,'2022-01-01',NULL,0.1039),(40,50,'2022-01-01',NULL,0.3674),(41,55,'2022-01-01',NULL,0.0255),(42,51,'2022-01-01',NULL,0.0251);
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductId` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `Manufacturer` varchar(45) NOT NULL,
  `Style` varchar(45) NOT NULL,
  `PurchasePrice` decimal(10,2) NOT NULL,
  `QuantityNbr` int NOT NULL,
  `CommissionPct` decimal(5,4) NOT NULL,
  PRIMARY KEY (`ProductId`),
  UNIQUE KEY `ProductName_UNIQUE` (`ProductName`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (50,'Premier 5','Polygon','Mountain',749.00,12,0.1019),(51,'Xtrada 6','Polygon','Mountain',899.00,10,0.1982),(52,'Cascade 4','Polygon','Mountain',599.00,8,0.0855),(53,'Bolinas Ridge 1','Marin','Mountain',599.00,9,0.0327),(54,'Eldridge','Marin','Mountain',749.00,3,0.1069),(55,'Presidio 1','Marin','Road',639.00,3,0.0363),(56,'Path 3','Polygon','Road',749.00,6,0.0611);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `SaleId` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `SalespersonId` int NOT NULL,
  `CustomerId` int NOT NULL,
  `SalesDate` date NOT NULL,
  PRIMARY KEY (`SaleId`),
  KEY `FK_Sales_Product_idx` (`ProductId`),
  KEY `FK_Sales_Salesperson_idx` (`SalespersonId`),
  KEY `FK_Sales_Customer_idx` (`CustomerId`),
  CONSTRAINT `FK_Sales_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `FK_Sales_Product` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ProductId`),
  CONSTRAINT `FK_Sales_Salesperson` FOREIGN KEY (`SalespersonId`) REFERENCES `Salesperson` (`SalespersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (333,53,24,29,'2021-09-01'),(334,53,23,29,'2021-08-27'),(335,53,22,29,'2022-08-10'),(336,53,24,28,'2022-06-06'),(337,53,23,28,'2021-09-02'),(338,53,22,28,'2022-05-30'),(339,53,24,27,'2022-05-23'),(340,53,23,27,'2022-01-27'),(341,53,22,27,'2022-07-19'),(342,52,24,29,'2021-11-09'),(343,52,23,29,'2021-12-28'),(344,52,22,29,'2021-09-26'),(345,52,24,28,'2022-01-19'),(346,52,23,28,'2022-05-25'),(347,52,22,28,'2022-03-08'),(348,52,24,27,'2022-01-25'),(349,52,23,27,'2022-02-21'),(350,52,22,27,'2021-11-09'),(351,54,24,29,'2022-03-15'),(352,54,23,29,'2021-10-18'),(353,54,22,29,'2021-09-20'),(354,54,24,28,'2022-07-22'),(355,54,23,28,'2021-12-20'),(356,54,22,28,'2022-07-13'),(357,54,24,27,'2022-02-03'),(358,54,23,27,'2022-03-22'),(359,54,22,27,'2022-03-06'),(360,56,24,29,'2022-07-28'),(361,56,23,29,'2021-09-04'),(362,56,22,29,'2022-01-05'),(363,56,24,28,'2022-05-19'),(364,56,23,28,'2022-03-21'),(365,56,22,28,'2022-04-17'),(366,56,24,27,'2022-03-01'),(367,56,23,27,'2022-04-14'),(368,56,22,27,'2022-04-12'),(369,50,24,29,'2021-11-23'),(370,50,23,29,'2021-12-27'),(371,50,22,29,'2022-08-09'),(372,50,24,28,'2022-05-29'),(373,50,23,28,'2022-07-29'),(374,50,22,28,'2021-12-31'),(375,50,24,27,'2022-08-16'),(376,50,23,27,'2022-06-20'),(377,50,22,27,'2021-10-25'),(378,55,24,29,'2022-01-09'),(379,55,23,29,'2022-01-09'),(380,55,22,29,'2022-05-24'),(381,55,24,28,'2022-03-31'),(382,55,23,28,'2022-05-27'),(383,55,22,28,'2022-08-14'),(384,55,24,27,'2022-03-25'),(385,55,23,27,'2022-08-24'),(386,55,22,27,'2021-11-21'),(387,51,24,29,'2021-11-08'),(388,51,23,29,'2021-12-13'),(389,51,22,29,'2022-07-14'),(390,51,24,28,'2022-03-02'),(391,51,23,28,'2022-08-01'),(392,51,22,28,'2021-10-04'),(393,51,24,27,'2022-05-24'),(394,51,23,27,'2022-01-16'),(395,51,22,27,'2022-05-18');
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salesperson`
--

DROP TABLE IF EXISTS `Salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Salesperson` (
  `SalespersonId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `TerminationDate` date DEFAULT NULL,
  `ManagerName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SalespersonId`),
  UNIQUE KEY `UQ_SalespersonName` (`FirstName`,`LastName`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salesperson`
--

LOCK TABLES `Salesperson` WRITE;
/*!40000 ALTER TABLE `Salesperson` DISABLE KEYS */;
INSERT INTO `Salesperson` VALUES (22,'John','Salesperson','123 Sample Ln','678-555-1234','2013-01-01','2021-01-01','Frank Stevens'),(23,'Jane','Salesperson','45 Street St','678-555-6789','2015-05-01',NULL,'Frank Stevens'),(24,'Brad','Salesperson','67 Star Cir','404-555-1234','2012-03-12',NULL,'Richard Lin');
/*!40000 ALTER TABLE `Salesperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Sales'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `GetCustomerList`()
BEGIN
	SELECT	CustomerId,
			FirstName,
            LastName,
            concat(FirstName, ' ', LastName) AS FullName,
            Address,
            PhoneNumber,
            StartDate
	FROM	Customer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductFilter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `GetProductFilter`()
BEGIN

	SELECT	ProductId,
			CONCAT(ProductName, ' (Qty Available: ', QuantityNbr, ')') AS FilterText
    FROM	Product
    WHERE	QuantityNbr > 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `GetProductsList`()
BEGIN
	SELECT	p.ProductId,
			p.ProductName,
            p.Manufacturer,
            p.Style,
            p.PurchasePrice,
            CONVERT(p.PurchasePrice * (1-ifnull(d.DiscountPct, 0)), DECIMAL(12, 2)) AS SalePrice,
            p.QuantityNbr,
            p.CommissionPct
    FROM	Product p
    LEFT JOIN Discount d ON d.ProductId = p.ProductId
							AND now() BETWEEN d.BeginDate AND ifnull(d.EndDate, now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetQuarterlySalesReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `GetQuarterlySalesReport`()
BEGIN

	WITH cteSales AS (
		SELECT	s.SalespersonId,
				YEAR(s.SalesDate) AS SalesYear,
				QUARTER(s.SalesDate) AS SalesQuarter,
				COUNT(*) AS TotalSalesCount,
				SUM(CONVERT(p.PurchasePrice * (1-ifnull(d.DiscountPct, 0)), DECIMAL(12, 2))) AS TotalSalesPrice,
				SUM(CONVERT((p.PurchasePrice * (1-ifnull(d.DiscountPct, 0))) * p.CommissionPct, DECIMAL(12, 2))) AS TotalSalesCommission
		FROM	Sales s
		JOIN	Product p ON p.ProductId = s.ProductId
		LEFT JOIN Discount d ON d.ProductId = s.ProductId
								AND s.SalesDate BETWEEN d.BeginDate AND ifnull(d.EndDate, now())
		GROUP BY s.SalespersonId,
				YEAR(s.SalesDate),
				QUARTER(s.SalesDate)
	)
	SELECT	s.SalespersonId,
			CONCAT(sp.FirstName, ' ' , sp.LastName) AS SalespersonFullname,
			CONCAT('Q', s.SalesQuarter, ' ', s.SalesYear) AS SalesQuarterYear,
			s.TotalSalesCount,
			s.TotalSalesPrice,
			s.TotalSalesCommission
	FROM	cteSales s
	JOIN	Salesperson sp ON sp.SalespersonId = s.SalespersonId
	ORDER BY s.SalesYear DESC,
			s.SalesQuarter DESC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSalesList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `GetSalesList`()
BEGIN

	SELECT	s.SalesDate,
			concat(sp.FirstName, ' ' , sp.LastName) AS SalespersonFullname,
			concat(c.FirstName, ' ' , c.LastName) AS CustomerFullname,
			p.ProductName,
            p.PurchasePrice,
            CONVERT(p.PurchasePrice * (1-ifnull(d.DiscountPct, 0)), DECIMAL(12, 2)) AS FinalPrice,
            CONVERT((p.PurchasePrice * (1-ifnull(d.DiscountPct, 0))) * p.CommissionPct, DECIMAL(12, 2)) AS FinalCommission
    FROM	Sales s
	JOIN	Product p ON p.ProductId = s.ProductId
    JOIN	Salesperson sp ON sp.SalespersonId = s.SalespersonId
    JOIN	Customer c ON c.CustomerId = s.CustomerId
    LEFT JOIN Discount d ON d.ProductId = s.ProductId
							AND s.SalesDate BETWEEN d.BeginDate AND ifnull(d.EndDate, now())
	ORDER BY s.SalesDate DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSalespersonList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `GetSalespersonList`()
BEGIN
	SELECT	SalespersonId,
			FirstName,
            LastName,
            concat(FirstName, ' ', LastName) AS FullName,
            Address,
            PhoneNumber,
            StartDate,
            TerminationDate,
            ManagerName
	FROM	Salesperson;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSalesReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `GetSalesReport`()
BEGIN

	SELECT	s.SalesDate,
			concat(sp.FirstName, ' ' , sp.LastName) AS SalespersonFullname,
			concat(c.FirstName, ' ' , c.LastName) AS CustomerFullname,
			p.ProductName,
            p.PurchasePrice,
            CONVERT(p.PurchasePrice * (1-ifnull(d.DiscountPct, 0)), DECIMAL(12, 2)) AS FinalPrice,
            CONVERT((p.PurchasePrice * (1-ifnull(d.DiscountPct, 0))) * p.CommissionPct, DECIMAL(12, 2)) AS FinalCommission
    FROM	Sales s
	JOIN	Product p ON p.ProductId = s.ProductId
    JOIN	Salesperson sp ON sp.SalespersonId = s.SalespersonId
    JOIN	Customer c ON c.CustomerId = s.CustomerId
    LEFT JOIN Discount d ON d.ProductId = s.ProductId
							AND s.SalesDate BETWEEN d.BeginDate AND ifnull(d.EndDate, now());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertSale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `InsertSale`(
	inProductId INT,
    inSalespersonId INT,
    inCustomerId INT,
    inSalesDate DATE
)
BEGIN
	
    IF (SELECT QuantityNbr FROM Product WHERE ProductId = inProductId) > 0
    THEN
    
		INSERT INTO Sales (ProductId, SalespersonId, CustomerId, SalesDate)
		VALUES (inProductId, inSalespersonId, inCustomerId, inSalesDate);
       
		UPDATE	Product
		SET		QuantityNbr = QuantityNbr - 1
		WHERE	ProductId = inProductId;
       
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResetSampleData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `ResetSampleData`()
BEGIN

	DELETE FROM Sales.Discount;
	DELETE FROM Sales.Sales;
	DELETE FROM Sales.Product;
	DELETE FROM Sales.Salesperson;
    DELETE FROM Sales.Customer;

	INSERT INTO `Sales`.`Product`
	(`ProductName`,`Manufacturer`,`Style`,`PurchasePrice`,`QuantityNbr`,`CommissionPct`)
	SELECT 'Premier 5', 'Polygon', 'Mountain', 749, 12, RAND() * 0.2
	UNION ALL
	SELECT 'Xtrada 6', 'Polygon', 'Mountain', 899, 10, RAND() * 0.2
	UNION ALL
	SELECT 'Cascade 4', 'Polygon', 'Mountain', 599, 8, RAND() * 0.2
	UNION ALL
	SELECT 'Bolinas Ridge 1', 'Marin', 'Mountain', 599, 9, RAND() * 0.2
	UNION ALL
	SELECT 'Eldridge', 'Marin', 'Mountain', 749, 3, RAND() * 0.2
	UNION ALL
	SELECT 'Presidio 1', 'Marin', 'Road', 639, 3, RAND() * 0.2
	UNION ALL
	SELECT 'Path 3', 'Polygon', 'Road', 749, 6, RAND() * 0.2;


	INSERT INTO `Sales`.`Salesperson`
	(`FirstName`,`LastName`,`Address`,`PhoneNumber`,`StartDate`,`TerminationDate`,`ManagerName`)
	SELECT 'John' , 'Salesperson', '123 Sample Ln', '678-555-1234','2013-1-1','2021-1-1','Frank Stevens'
	UNION ALL
	SELECT 'Jane' , 'Salesperson', '45 Street St', '678-555-6789','2015-5-1',NULL,'Frank Stevens'
	UNION ALL
	SELECT 'Brad' , 'Salesperson', '67 Star Cir', '404-555-1234','2012-3-12',NULL,'Richard Lin';


	INSERT INTO `Sales`.`Customer`
	(`FirstName`,`LastName`,`Address`,`PhoneNumber`,`StartDate`)
	SELECT 'John' , 'Customer', '44 Overwatch','678-555-1234','2012-1-1'
	UNION ALL
	SELECT 'Frank' , 'Customer', '989 Peachtree St','432-555-1234','2020-3-1'
	UNION ALL
	SELECT 'Jill' , 'Customer', '1 North Main St','567-555-1234','2010-6-23';


	INSERT INTO `Sales`.`Sales` (`ProductId`, `SalespersonId`, `CustomerId`, `SalesDate`)
	SELECT	p.ProductId,
			s.SalespersonId,
			c.CustomerId,
			DATE_SUB(NOW(), INTERVAL ROUND(RAND()*365) DAY) as a
	FROM	Product p
	CROSS JOIN Salesperson s
	CROSS JOIN Customer c;
    
    INSERT INTO `Sales`.`Discount`
	(`ProductId`, `BeginDate`, `DiscountPct`)
	SELECT	ProductId, '2022-1-1', rand() * 0.5
    FROM	Product;    
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpsertCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bike`@`%` PROCEDURE `UpsertCustomer`(
	inCustomerId INT,
	inFirstName VARCHAR(45),
    inLastName VARCHAR(45),
    inAddress VARCHAR(45),
    inPhoneNumber VARCHAR(45),
    inStartDate DATE
)
BEGIN

	IF EXISTS (SELECT 1 FROM Customer
		WHERE FirstName = inFirstName
				AND LastName = inLastName
                AND CustomerId <> inCustomerId)
	THEN
		SELECT	0 AS ResultStatus ,
				'Customer already exists' AS ResultMessage;
	ELSEIF inCustomerId = 0 THEN
		INSERT INTO Customer (FirstName, LastName, Address, PhoneNumber, StartDate)
        VALUES (inFirstName, inLastName, inAddress, inPhoneNumber, inStartDate);
        
		SELECT	1 AS ResultStatus ,
				'Success' AS ResultMessage;
	ELSE
		UPDATE	Customer
        SET		FirstName = inFirstName,
				LastName = inLastName,
                Address = inAddress,
                PhoneNumber = inPhoneNumber,
                StartDate = inStartDate
		WHERE	CustomerId = inCustomerId;
        
		SELECT	1 AS ResultStatus ,
				'Success' AS ResultMessage;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-26  1:15:33
