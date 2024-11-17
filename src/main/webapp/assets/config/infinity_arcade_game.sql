-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: infinity_arcade
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `gameID` varchar(50) NOT NULL,
  `gameName` varchar(255) DEFAULT NULL,
  `desc` text,
  `gameTitle` varchar(255) DEFAULT NULL,
  `devName` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `uploadedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` decimal(10,2) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES ('COD001','Call Of Duty','Welcome to the new era of Call of Duty?.\r\n\r\nCall of Duty?: Modern Warfare? II drops players into an unprecedented global conflict that features the return of the iconic Operators of Task Force 141. From small-scale, high-stakes infiltration tactical ops to highly classified missions, players will deploy alongside friends in a truly immersive experience.\r\n\r\nInfinity Ward brings fans state-of-the-art gameplay, with all-new gun handling, advanced AI system, a new Gunsmith and a suite of other gameplay and graphical innovations that elevate the franchise to new heights.\r\n\r\nModern Warfare? II launches with a globe-trotting single-player campaign, immersive Multiplayer combat, and a narrative-driven, co-op Special Ops experience.\r\n\r\nYou also get access to Call of Duty?: Warzone?, the all-new Battle Royale experience.','Modern Warfare II','Infinity Ward, Raven Software, Beenox, Treyarch, High Moon Studios, Sledgehammer Games, Activision Shanghai, Demonware, Toys for Bob','Action','Call of Duty, Modern Warfare 2, FPS, Multiplayer','uploads/single-game.jpg','2024-10-05 17:49:36','2024-10-05 22:07:21',69.99,NULL),('PUBG001','PUBG','Squad up and join the Battlegrounds for the original Battle Royale experience that only PUBG: BATTLEGROUNDS can offer.\r\n\r\nPUBG: BATTLEGROUNDS is a free-to-play game, supporting limited cross-platform play on featured platforms. Optional in-game purchases available. Please visit battlegrounds.pubg.com/ for more information.','BattleGround','KRAFTON, Inc','Shooter, Survival','PUBG, Battle Royale, Multiplayer','uploads/top-game-02.jpg','2024-10-05 18:00:28','2024-10-05 22:07:38',9.00,NULL),('WF001','Warframe','Confront warring factions throughout a sprawling interplanetary system as you follow the guidance of the mysterious Lotus and level up your Warframe, build an Arsenal of destructive firepower, and realize your true potential across massive open worlds in this thrilling, genre-defining third-person combat experience.','VeilBreaker','Digital Extremes','Action, RPG, Free To Play','Warframe, Action RPG, Free-to-play','uploads/top-game-01.jpg','2024-10-05 17:57:23','2024-10-05 17:57:23',0.00,'https://store.steampowered.com/app/230410/Warframe/');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09  0:15:18
