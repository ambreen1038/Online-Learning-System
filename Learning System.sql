-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: learningsystem
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `UserPasword` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (2,'Safwan Habib','1zx235'),(3,'Sana Zafar','1k236'),(4,'Saba Zafar','1237nm'),(6,'Arooj Fatima','1on266'),(8,'Maria','1278Ab');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment` (
  `Assessment_ID` int(11) NOT NULL,
  `TypeA` varchar(20) DEFAULT NULL,
  `DeadLine` date DEFAULT NULL,
  `Course_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Assessment_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (20,'Project','2024-02-28',2002),(22,'ASSIGNMENT','2024-04-28',2004),(23,'CP','2024-02-28',2002),(26,'Project','2024-04-30',2004),(27,'GRADED LAB','2024-03-16',2007);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_ID` int(11) NOT NULL,
  `Course_Name` varchar(50) DEFAULT NULL,
  `Course_Description` varchar(250) DEFAULT NULL,
  `Duration` varchar(20) NOT NULL DEFAULT '6 months',
  `Credits` int(11) DEFAULT NULL,
  `no_OF_Lessons` int(11) DEFAULT NULL,
  PRIMARY KEY (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (2002,'English','XYZ','4 months',3,6),(2003,'DSA','XYZ','4 months',4,7),(2004,'OOP','XYZ','2 months',3,6),(2005,'Mathematics','XYZ','4 months',3,6),(2006,'English','XYZ','4 months',3,6),(2007,'BigData','XYZ','4 months',4,6),(2008,'DataBase','XYZ','4 months',6,6);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dept_ID` char(2) NOT NULL,
  `Dept_Name` varchar(20) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('D1','FOCS',NULL),('D2','FOEE',NULL),('D4','FOCE',NULL),('D6','FOBA',NULL),('D8','FOMA',NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled`
--

DROP TABLE IF EXISTS `enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled` (
  `Student_ID` varchar(15) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Enrollment_Date` date DEFAULT NULL,
  PRIMARY KEY (`Student_ID`,`Course_ID`),
  KEY `fkC` (`Course_ID`),
  CONSTRAINT `fkC` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`),
  CONSTRAINT `fkS` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled`
--

LOCK TABLES `enrolled` WRITE;
/*!40000 ALTER TABLE `enrolled` DISABLE KEYS */;
INSERT INTO `enrolled` VALUES ('L1ABCDE123',2007,'2022-02-04'),('L1ABCDE123',2008,'2022-02-04'),('L1ABCDE124',2003,'2022-02-04'),('L1ABCDE124',2005,'2022-11-04'),('L1ABCDE130',2002,'2022-02-04');
/*!40000 ALTER TABLE `enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `marks` int(11) DEFAULT NULL,
  `Assessment_ID` int(11) DEFAULT NULL,
  KEY `Assessment_ID` (`Assessment_ID`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`Assessment_ID`) REFERENCES `assessment` (`Assessment_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (40,22),(40,22),(20,23),(24,NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_ID` varchar(15) NOT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `administrator` (`User_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('L1ABCDE123','Maria','Habib','2002-01-02','F','Rawalpindi',8),('L1ABCDE124','Zakwan','Habib','2002-07-03','M','Sahiwal',3),('L1ABCDE125','Safwan','Habib','2004-05-03','M','OKARA',2),('L1ABCDE126','Ahmad','Raza','2004-09-02','M','LAHORE',3),('L1ABCDE127','Hassan','Raza','2004-05-03','M','LAHORE',4),('L1ABCDE128','Ambreen','Habib','2002-10-07','F','LAHORE',6),('L1ABCDE129','Zakwan','Safwan','2004-05-03','M','LAHORE',2),('L1ABCDE130','Shazain','Irfan','2001-01-02','M','LAHORE',4);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_scontactnumber`
--

DROP TABLE IF EXISTS `student_scontactnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_scontactnumber` (
  `SContactNumber` varchar(11) NOT NULL,
  `Student_ID` varchar(15) NOT NULL,
  PRIMARY KEY (`Student_ID`,`SContactNumber`),
  CONSTRAINT `student_scontactnumber_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_scontactnumber`
--

LOCK TABLES `student_scontactnumber` WRITE;
/*!40000 ALTER TABLE `student_scontactnumber` DISABLE KEYS */;
INSERT INTO `student_scontactnumber` VALUES ('03000000001','L1ABCDE124'),('03023051100','L1ABCDE126'),('03022250700','L1ABCDE127'),('0302300000','L1ABCDE127'),('03022050760','L1ABCDE129');
/*!40000 ALTER TABLE `student_scontactnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `Teacher_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Dept_ID` char(5) DEFAULT NULL,
  `Specialization` varchar(20) DEFAULT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Teacher_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Dept_ID` (`Dept_ID`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `administrator` (`User_ID`),
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`),
  CONSTRAINT `teacher_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `administrator` (`User_ID`),
  CONSTRAINT `teacher_ibfk_4` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`),
  CONSTRAINT `teacher_ibfk_5` FOREIGN KEY (`User_ID`) REFERENCES `administrator` (`User_ID`),
  CONSTRAINT `teacher_ibfk_6` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (99,3,'D1','Computer Science','Nimra','Tariq'),(101,4,'D4','Google CyberSecurity','Maria','Habib'),(102,2,'D2','Mathematics','Anum','Farooq'),(103,8,'D1','Computer Science','Zarish','Tariq'),(104,6,'D8','Business','Ammara','Farooq'),(105,3,'D6','English','Nimra','Tariq'),(106,6,'D1','Computer Science','Ayesha','Jameel'),(107,2,'D1','Computer Science','Taqwa','Saim');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_course`
--

DROP TABLE IF EXISTS `teacher_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_course` (
  `Teacher_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  PRIMARY KEY (`Teacher_ID`,`Course_ID`),
  KEY `fkTC` (`Course_ID`),
  CONSTRAINT `fkT` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`),
  CONSTRAINT `fkTC` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_course`
--

LOCK TABLES `teacher_course` WRITE;
/*!40000 ALTER TABLE `teacher_course` DISABLE KEYS */;
INSERT INTO `teacher_course` VALUES (101,2003),(102,2004),(104,2006),(104,2008),(106,2002);
/*!40000 ALTER TABLE `teacher_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teacheremail`
--

DROP TABLE IF EXISTS `teacher_teacheremail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_teacheremail` (
  `TeacherEmail` varchar(50) NOT NULL,
  `Teacher_ID` int(11) NOT NULL,
  PRIMARY KEY (`TeacherEmail`,`Teacher_ID`),
  KEY `Teacher_ID` (`Teacher_ID`),
  CONSTRAINT `teacher_teacheremail_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teacheremail`
--

LOCK TABLES `teacher_teacheremail` WRITE;
/*!40000 ALTER TABLE `teacher_teacheremail` DISABLE KEYS */;
INSERT INTO `teacher_teacheremail` VALUES ('ammara.farooq@ucp.edu.pk',104),('anum567@gmail.com',102),('ayesha@ucp.edu.pk',102),('m235600gmail.com',104),('nimra.tariq@ucp.edu.pk',104);
/*!40000 ALTER TABLE `teacher_teacheremail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-18 23:49:45
