-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: social
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_msgs`
--

DROP TABLE IF EXISTS `chat_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_msgs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(50) NOT NULL,
  `receiver_id` varchar(50) NOT NULL,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `chat_msgs_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chat_msgs_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_msgs`
--

LOCK TABLES `chat_msgs` WRITE;
/*!40000 ALTER TABLE `chat_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_likes`
--

DROP TABLE IF EXISTS `comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int DEFAULT NULL,
  `liked_by` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `liked_by` (`liked_by`),
  CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`liked_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likes`
--

LOCK TABLES `comment_likes` WRITE;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commented_by` varchar(50) DEFAULT NULL,
  `comment_body` text,
  `post_id` int DEFAULT NULL,
  `commented_by_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `commented_by` (`commented_by`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`commented_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (9,'13od2ovj4l8wpaofl','abhinav',165,'abhinavkumar'),(10,'13od2ovj4l8wpaofl','aur bsdk kya haal h????lauda de lassan.....eheheheehehheeh  , ,amdkkyad kda dkcdsc',165,'abhinavkumar'),(11,'13od2ovj4l8wpaofl','cscds',165,'abhinavkumar'),(12,'13od2ovj4l8wpaofl','sdvcsd',165,'abhinavkumar'),(13,'13od2ovj4l8wpaofl','Use overflow-scroll to add scrollbars to an element. Unlike overflow-auto, which only shows scrollbars if they are necessary, this utility always shows them. Note that some operating systems (like macOS) hide unnecessary scrollbars regardless of this setting.',165,'abhinavkumar'),(14,'13od2o3pol9er2vyk','vgh',101,'nisha'),(15,'13od2ovj4l8wpaofl','cds cmds c,',165,'abhinavkumar'),(16,'13od2ovj4l8wpaofl','lauda de lassan',167,'abhinavkumar'),(17,'13od2ovj4l8wpaofl','pilla do pyaza',167,'abhinavkumar'),(18,'13od2ovj4l8wpaofl',' adsd sdas',167,'abhinavkumar'),(19,'13od2ovj4l8wpaofl','fewfew',168,'abhinavkumar'),(20,'13od2ovj4l8wpaofl','vrqwerwq',166,'abhinavkumar'),(21,'13od2ovj4l8wpaofl',' evqwedwa',166,'abhinavkumar'),(22,'13od2ovj4l8wpaofl','fsd',166,'abhinavkumar'),(23,'13od2ovj4l8wpaofl',' cascsa',183,'abhinavkumar'),(24,'13od2ovj4l8wpaofl','c ascxsa',183,'abhinavkumar'),(25,'13od2ovj4l8wpaofl','cascas',184,'abhinavkumar'),(26,'13od2ovj4l8wpaofl','d sdcdswc',188,'abhinavkumar'),(27,'13od2ovj4l8wpaofl',' dcscscds',188,'abhinavkumar'),(28,'13od2ovj4l8wpaofl','d asdasdsa ds',192,'abhinavkumar'),(29,'13od2ovj4l8wpaofl','dcjsokcn',194,'abhinavkumar'),(30,'13od2ovj4l8wpaofl','csaxcxs',194,'abhinavkumar'),(31,'13od2ovj4l8wpaofl','d ac',201,'abhinavkumar');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_request`
--

DROP TABLE IF EXISTS `follow_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fol_req_by` varchar(50) DEFAULT NULL,
  `fol_req_to` varchar(50) DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `fol_req_by` (`fol_req_by`),
  KEY `fol_req_to` (`fol_req_to`),
  CONSTRAINT `follow_request_ibfk_1` FOREIGN KEY (`fol_req_by`) REFERENCES `users` (`id`),
  CONSTRAINT `follow_request_ibfk_2` FOREIGN KEY (`fol_req_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_request`
--

LOCK TABLES `follow_request` WRITE;
/*!40000 ALTER TABLE `follow_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `follower_id` varchar(50) DEFAULT NULL,
  `followee_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follower_id` (`follower_id`),
  KEY `followee_id` (`followee_id`),
  CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`followee_id`) REFERENCES `users` (`id`),
  CONSTRAINT `followers_chk_1` CHECK ((`follower_id` <> `followee_id`))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (24,'13od2ovj4l8wpaofl','13od2o3pol9er2vyk'),(26,NULL,'13od2o1e91l8r6avzz'),(27,NULL,'13od2o1e91l8r6avzz'),(37,'13od2ovj4l8wpaofl','13od2o1e91l8r6avzz'),(39,'13od2ovj4l8wpaofl','13od2o1eg9l8r6wig0'),(43,'13od2ovj4l8wpaofl','13od2o1i6l9qlvte4');
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`grp_id`),
  CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_members`
--

LOCK TABLES `group_members` WRITE;
/*!40000 ALTER TABLE `group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messages`
--

DROP TABLE IF EXISTS `group_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `grp_id` varchar(50) DEFAULT NULL,
  `sender_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grp_id` (`grp_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `group_messages_ibfk_1` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`),
  CONSTRAINT `group_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messages`
--

LOCK TABLES `group_messages` WRITE;
/*!40000 ALTER TABLE `group_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `grp_id` varchar(50) NOT NULL,
  `grp_name` varchar(50) NOT NULL,
  `grp_desc` text,
  `grp_pic` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `grp_admin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`grp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grp_id` varchar(50) DEFAULT NULL,
  `invite_to` varchar(50) DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `grp_id` (`grp_id`),
  KEY `invite_to` (`invite_to`),
  CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`),
  CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`invite_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `liked_at` datetime DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (5,186,'13od2ovj4l8wpaofl',NULL,'abhinavkumar'),(6,187,'13od2ovj4l8wpaofl',NULL,'abhinavkumar'),(13,186,'13od2ovj4l8wpaofl',NULL,'abhinavkumar'),(14,187,'13od2ovj4l8wpaofl',NULL,'abhinavkumar'),(15,187,'13od2ovj4l8wpaofl',NULL,'abhinavkumar'),(17,191,'13od2oa43l9s4scd6',NULL,'jynt'),(18,191,'13od2oa43l9s4scd6',NULL,'jynt'),(38,193,'13od2ovj4l8wpaofl',NULL,'abhinavkumar');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notify_to` varchar(50) DEFAULT NULL,
  `notify_by` varchar(50) DEFAULT NULL,
  `type` enum('commented','fol_req','invitation') DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `grp_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_to` (`notify_to`),
  KEY `notify_by` (`notify_by`),
  KEY `post_id` (`post_id`),
  KEY `grp_id` (`grp_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notify_to`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notify_by`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`grp_id`) REFERENCES `groups` (`grp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `post_content` text,
  `post_img` varchar(500) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (196,'13od2ovj4l8wpaofl','heyy babygirl','','Sat Oct 29 2022 10:51:03 GMT+0530 (India Standard Time)','abhinavkumar'),(197,'13od2ovj4l8wpaofl','lauda de lsassan','','Sat Oct 29 2022 11:10:54 GMT+0530 (India Standard Time)','abhinavkumar'),(201,'13od2o1i6l9qlvte4','heyyy','','Sat Oct 29 2022 11:29:32 GMT+0530 (India Standard Time)','khushi_agarwal'),(202,'13od2ovj4l8wpaofl','jgfgjfjgh','','Sat Oct 29 2022 11:58:37 GMT+0530 (India Standard Time)','abhinavkumar'),(203,'13od2o1i6l9qlvte4','heyyy nvcnccccfchgcgjv','','Sat Oct 29 2022 11:58:48 GMT+0530 (India Standard Time)','khushi_agarwal');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shares`
--

DROP TABLE IF EXISTS `shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `share_by` varchar(50) DEFAULT NULL,
  `share_to` varchar(50) DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `share_by` (`share_by`),
  KEY `share_to` (`share_to`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `shares_ibfk_1` FOREIGN KEY (`share_by`) REFERENCES `users` (`id`),
  CONSTRAINT `shares_ibfk_2` FOREIGN KEY (`share_to`) REFERENCES `users` (`id`),
  CONSTRAINT `shares_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shares`
--

LOCK TABLES `shares` WRITE;
/*!40000 ALTER TABLE `shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `about` text,
  `profile_pic` int DEFAULT NULL,
  `public_status` enum('public','private') DEFAULT 'public',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `profile_pic` (`profile_pic`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`profile_pic`) REFERENCES `images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('13od2o1e91l8r6avzz','abhinav99','abhinav','kumar','$2b$10$fCKo6U1uXMz4J5J4PhrEhOMlREDGo.0CAfzHDTKo7RoBBedPqU0fm','2014-08-18T15:41:54.000Z','2022-10-02 15:31:17.182','abhinav@gmail.com',NULL,NULL,'public'),('13od2o1eg9l8r6lo1u','ranu2003','khushi','agarwal','$2b$10$PgT9k1LyiI4MZJa.WtVrNOOQ8FtfqBDRmHu6uCnB8AraA7n4wRpiC','2014-08-18T15:41:54.000Z','2022-10-02 15:39:40.098','ranu@gmail.com',NULL,NULL,'public'),('13od2o1eg9l8r6paya','shashi77','shashi','singh','$2b$10$wGhLFXwz.JtTqjo9v17I5.ieXm69SF9xF1hVDu8c8776U0fxYlhri','2014-08-18T15:41:54.000Z','2022-10-02 15:42:29.746','shashi@gmail.com',NULL,NULL,'public'),('13od2o1eg9l8r6wig0','abhi','abhi','ku','$2b$10$XER14NAshaXNtxexU.dtbenG8DR7QaL2ZfzP1GuNSa6w4OjRcyU56','2014-08-18T15:41:54.000Z','2022-10-02 15:48:06.048','abhi@gmail.com',NULL,NULL,'public'),('13od2o1i6l9qlvte4','khushi_agarwal','khushi','agarwal','$2b$10$D.e9a63A8F//Gsrone0xHe1LDC4cIH.Jf8R2IeVxieDY1zOOA4fHy','2014-08-18T15:41:54.000Z','2022-10-27 10:39:23.979','k@gmail.com',NULL,NULL,'public'),('13od2o20hl9sb6fw0','user1','user1','use','$2b$10$99qxINbKMhW4uFxCTVAnseza3eSrwaySI2YrWnsycScVdm2Kwgsyi','2014-08-18T15:41:54.000Z','2022-10-28 15:15:16.271','user@gmail.com',NULL,NULL,'public'),('13od2o3pol9er2vyk','nisha','nisha','nisha','$2b$10$16DG4FwB7wZ.V4r9Njrse.rgvY54yIKoQmZYjLsDYWujB3LTOAVsm','2014-08-18T15:41:54.000Z','2022-10-19 03:31:37.867','nisha@gmail.com',NULL,NULL,'public'),('13od2oa43l9s4scd6','jynt','jayant','belwanshi','$2b$10$zb75P/FziIglveQm1m6rfOVl133nLUUIKE.oWDGdWcOFXcmgUeBMS','2014-08-18T15:41:54.000Z','2022-10-28 12:16:20.825','123456789',NULL,NULL,'public'),('13od2ovj4l8wpaofl','abhinavkumar','Abhinav','Kumar','$2b$10$CiyvsQLLNyuDzhzDoDYUe.kcfpAM6uJREbvfShYAWfZqhjDYXNUfm','2014-08-18T15:41:54.000Z','2022-10-06 12:21:50.961','abh@gmail.com',NULL,NULL,'public');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-30 23:04:25
