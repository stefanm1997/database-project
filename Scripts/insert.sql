-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: tm2k21
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
INSERT INTO `adresa` VALUES (1,'Ljutice Bogdana',1),(2,'Humska ',1),(3,'Avenida de Concha Espina ',1),(4,'Avinguda Arístides Maillol',1),(5,'rue du Commandant-Guilbaud',24),(6,'Säbener Straße ',51),(7,'Rheinlanddamm',207),(8,'Anfield Road',1),(9,'Old Trafford,Sir Matt Busby Way',1),(10,'Corso Galileo Ferraris',32),(11,'Via Aldo Rossi',8);
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `agencija_za_igrace`
--

LOCK TABLES `agencija_za_igrace` WRITE;
/*!40000 ALTER TABLE `agencija_za_igrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `agencija_za_igrace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dres`
--

LOCK TABLES `dres` WRITE;
/*!40000 ALTER TABLE `dres` DISABLE KEYS */;
INSERT INTO `dres` VALUES (88,'Stojkovic',2,41),(4,'Markovic',2,47),(3,'Bagnac',2,48),(72,'Urosevic',2,49),(26,'Miljkovic',2,50),(16,'Zdjelar',2,51),(6,'Natcho',2,52),(20,'Soumah',2,53),(80,'Stevanovic',2,54),(50,'Markovic',2,55),(11,'Asano',2,56),(82,'Borjan',1,57),(5,'Degenek',1,58),(19,'Milunovic',1,59),(2,'Gajic',1,60),(23,'Rodic',1,61),(24,'Gavric',1,62),(8,'Kanga',1,63),(4,'Ivanic',1,64),(10,'Katai',1,65),(16,'Falcinelli',1,66),(11,'Falco',1,67),(1,'Courtois',6,68),(4,'Ramos',6,69),(5,'Varane',6,70),(2,'Carvajal',6,71),(12,'Marcelo',6,72),(8,'Vinicius Jr',6,73),(14,'Casemiro',6,74),(7,'Hazard',6,75),(10,'Modric',6,76),(9,'Benzema',6,77),(20,'Vinicius Jr',6,78),(25,'Rodrygo',6,79),(1,'Ter Stegen',7,80),(15,'Lenglet',7,81),(3,'Pique',7,82),(18,'Alba',7,83),(20,'Roberto',7,84),(5,'Busquets',7,85),(21,'De Jong',7,86),(8,'Pjanic',7,87),(14,'Coutinho',7,88),(10,'Messi',7,89),(7,'Griezmann',7,90),(22,'Fati',7,91),(1,'Navas',8,92),(5,'Marquinhos',8,93),(3,'Kulusevski',8,94),(24,'Florenzi',8,95),(14,'Bernat',8,96),(6,'Verratti',8,97),(21,'Herrera',8,98),(23,'Draxler',8,99),(10,'Neymar',8,100),(11,'Di Maria',8,101),(7,'Mbape',8,102),(9,'Icardi',8,103),(1,'Neuer',9,104),(27,'Alaba',9,105),(4,'Sule',9,106),(19,'Davies',9,107),(5,'Pavard',9,108),(6,'Kimmich',9,109),(18,'Goretzka',9,110),(10,'Sane',9,111),(29,'Coman',9,112),(7,'Gnabry',9,113),(25,'Muller',9,114),(9,'Lewandowski',9,115),(1,'Burki',10,116),(5,'Zagadou',10,117),(15,'Hummels',10,118),(13,'Guerreiro',10,119),(24,'Meunier',10,120),(22,'Bellingham',10,121),(23,'Can',10,122),(32,'Reyna',10,123),(19,'Brandt',10,124),(11,'Reus',10,125),(10,'Hazard',10,126),(7,'Sancho',10,127),(9,'Haaland',10,128),(1,'Allison',11,129),(4,'Van Dijk',11,130),(12,'Gomez',11,131),(26,'Robertson',11,132),(66,'Alexander-Arnold',11,133),(6,'Thiago',11,134),(3,'Fabinho',11,135),(14,'Henderson',11,136),(10,'Mane',11,137),(20,'Jota',11,138),(11,'Salah',11,139),(9,'Firmino',11,140),(1,'De Gea',12,141),(5,'Maguire',12,142),(2,'Lindelof',12,143),(29,'Wan-Bissaka',12,144),(27,'Telles',12,145),(6,'Pogba',12,146),(31,'Matic',12,147),(34,'Van De Beek',12,148),(18,'Fernandes',12,149),(10,'Rashford',12,150),(11,'Greenwood',12,151),(9,'Martial',12,152),(7,'Cavani',12,153),(1,'Szczesny',13,154),(28,'Demiral',13,155),(4,'De Ligt',13,156),(12,'Sandro',13,157),(13,'Danilo',13,158),(25,'Rabiot',13,159),(5,'Arthur',13,160),(7,'Ronaldo',13,161),(22,'Chiesa',13,162),(10,'Dybala',13,163),(9,'Morata',13,164),(44,'Kulusevski',13,165),(33,'Bernardeschi',13,166),(99,'Donnarumma',14,167),(13,'Romagnoli',14,168),(2,'Calabria',14,169),(23,'Tomori',14,170),(19,'Hernandez',14,171),(8,'Tonali',14,172),(10,'Calhanoglu',14,173),(79,'Kessie',14,174),(4,'Bennacer',14,175),(11,'Ibrahimovic',14,176),(12,'Rebic',14,177),(9,'Mandzukic',14,178),(56,'Saelemaekers',14,179),(7,'Castillejo',14,180);
/*!40000 ALTER TABLE `dres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `drzavljanstvo`
--

LOCK TABLES `drzavljanstvo` WRITE;
/*!40000 ALTER TABLE `drzavljanstvo` DISABLE KEYS */;
INSERT INTO `drzavljanstvo` VALUES (1,'Bosna i Hercegovina','BA','BIH'),(2,'Srbija ','RS','SRB'),(3,'Hrvatska','HR','HRV'),(4,'Kamerun',NULL,NULL),(5,'Izrael',NULL,NULL),(6,'Gvineja',NULL,NULL),(7,'Japan',NULL,NULL),(8,'Kanada',NULL,NULL),(9,'Australija',NULL,NULL),(10,'Gabon',NULL,NULL),(11,'Crna Gora',NULL,NULL),(12,'Italija',NULL,NULL),(13,'Spanija',NULL,NULL),(14,'Francuska',NULL,NULL),(15,'Engleska',NULL,NULL),(16,'Portugal',NULL,NULL),(17,'Brazil',NULL,NULL),(18,'Argentina',NULL,NULL),(19,'Belgija',NULL,NULL),(20,'Njemacka',NULL,NULL),(21,'Holandija',NULL,NULL),(22,'Kosta Rika',NULL,NULL),(23,'Austrija',NULL,NULL),(24,'Poljska',NULL,NULL),(25,'Svicarska',NULL,NULL),(26,'SAD',NULL,NULL),(27,'Norveska',NULL,NULL),(28,'Skotska',NULL,NULL),(29,'Egipat',NULL,NULL),(30,'Senegal',NULL,NULL),(31,'Svedska',NULL,NULL),(32,'Urugvaj',NULL,NULL),(33,'Turska',NULL,NULL),(34,'Alzir',NULL,NULL),(35,'Obala Slonovace',NULL,NULL);
/*!40000 ALTER TABLE `drzavljanstvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `igrac`
--

LOCK TABLES `igrac` WRITE;
/*!40000 ALTER TABLE `igrac` DISABLE KEYS */;
INSERT INTO `igrac` VALUES ('Golman',196,89,200000.00,'Desna',41,NULL),('Stoper',186,89,1200000.00,'Desna',47,NULL),('Stoper',187,85,1300000.00,'Desna',48,NULL),('Lijevi bek',184,75,1200000.00,'Lijeva',49,NULL),('Desni bek',184,75,400000.00,'Desna',50,NULL),('Zadnji vezni',183,80,2200000.00,'Desna',51,NULL),('Centralni vezni',177,75,2000000.00,'Desna',52,NULL),('Ofanzivni vezni',161,60,2700000.00,'Desna',53,NULL),('Lijevo krilo',177,70,8000000.00,'Desna',54,NULL),('Desno krilo',175,70,2000000.00,'Desna',55,NULL),('Lijevo krilo',173,63,2500000.00,'Desna',56,NULL),('Golman',195,87,2000000.00,'Desna',57,NULL),('Stoper',186,80,2800000.00,'Desna',58,NULL),('Stoper',195,89,1300000.00,'Desna',59,NULL),('Desni bek',178,72,2500000.00,'Desna',60,NULL),('Lijevi bek',185,80,2800000.00,'Desna',61,NULL),('Lijevio krilo',181,70,4000000.00,'Desna',62,NULL),('Ofanzivni vezni',167,65,3500000.00,'Desna',63,NULL),('Ofanzivni vezni',183,70,3000000.00,'Desna',64,NULL),('Lijevo krilo',182,80,3000000.00,'Desna',65,NULL),('Napadac',186,80,2200000.00,'Lijeva',66,NULL),('Napadac',171,65,5000000.00,'Lijeva',67,NULL),('Golman',199,95,75000000.00,'Lijeva',68,NULL),('Stoper',184,81,14000000.00,'Desna',69,NULL),('Stoper',191,85,70000000.00,'Desna',70,NULL),('Desni bek',173,67,40000000.00,'Desna',71,NULL),('Lijevi bek',174,67,10000000.00,'Lijeva',72,NULL),('Lijevo krilo',176,72,45000000.00,'Desna',73,NULL),('Centralni vezni',185,80,50000000.00,'Desna',74,NULL),('Lijevo krilo',175,70,50000000.00,'Desna',75,NULL),('Centralni vezni',172,67,10000000.00,'Desna',76,NULL),('Napadac',184,79,25000000.00,'Desna',77,NULL),('Lijevo krilo',176,72,40000000.00,'Desna',78,NULL),('Desno krilo',174,71,45000000.00,'Desna',79,NULL),('Golman',187,85,75000000.00,'Desna',80,NULL),('Stoper',186,82,40000000.00,'Lijeva',81,NULL),('Stoper',194,90,12000000.00,'Desna',82,NULL),('Lijevi bek',170,64,25000000.00,'Lijeva',83,NULL),('Desni bek',178,70,25000000.00,'Desna',84,NULL),('Zadnji vezni',189,83,10000000.00,'Desna',85,NULL),('Centralni vezni',180,76,65000000.00,'Desna',86,NULL),('Centralni vezni',178,74,40000000.00,'Desna',87,NULL),('Ofanzivni vezni',172,68,50000000.00,'Desna',88,NULL),('Desno krilo',170,68,80000000.00,'Lijeva',89,NULL),('Napadac',176,71,60000000.00,'Lijeva',90,NULL),('Lijevo krilo',178,71,80000000.00,'Desna',91,NULL),('Golman',185,84,10000000.00,'Desna',92,NULL),('Stoper',183,80,70000000.00,'Desna',93,NULL),('Desno krilo',186,81,45000000.00,'Lijeva',94,NULL),('Desni bek',173,68,15000000.00,'Desna',95,NULL),('Lijevi bek',170,65,16000000.00,'Lijeva',96,NULL),('Centralni vezni',165,60,60000000.00,'Desna',97,NULL),('Centralni vezni',182,78,15000000.00,'Desna',98,NULL),('Ofanzivni vezni',187,78,20000000.00,'Desna',99,NULL),('Lijevo krilo',175,72,128000000.00,'Desna',100,NULL),('Desno krilo',180,75,28000000.00,'Lijeva',101,NULL),('Napadac',178,75,180000000.00,'Desna',102,NULL),('Napadac',181,78,55000000.00,'Desna',103,NULL),('Golman',193,88,18000000.00,'Desna',104,NULL),('Stoper',180,75,55000000.00,'Lijeva',105,NULL),('Stoper',195,90,37000000.00,'Desna',106,NULL),('Lijevi bek',183,78,75000000.00,'Lijeva',107,NULL),('Desni bek',186,78,35000000.00,'Desna',108,NULL),('Zadnji vezni',177,72,90000000.00,'Desna',109,NULL),('Centralni vezni',189,85,70000000.00,'Desna',110,NULL),('Lijevo krilo',183,81,60000000.00,'Lijeva',111,NULL),('Lijevo krilo',180,77,55000000.00,'Desna',112,NULL),('Desno krilo',176,73,70000000.00,'Desna',113,NULL),('Desno krilo',185,80,35000000.00,'Desna',114,NULL),('Napadac',185,81,60000000.00,'Desna',115,NULL),('Golman',187,85,7000000.00,'Desna',116,NULL),('Stoper',196,85,22000000.00,'Lijeva',117,NULL),('Stoper',191,85,15000000.00,'Desna',118,NULL),('Lijevi bek',170,64,35000000.00,'Lijeva',119,NULL),('Desni bek',191,86,18000000.00,'Desna',120,NULL),('Centralni vezni',186,80,35000000.00,'Desna',121,NULL),('Zadnji vezni',186,80,26000000.00,'Desna',122,NULL),('Ofanzivni vezni',185,80,38000000.00,'Desna',123,NULL),('Ofanzivni vezni',185,78,30000000.00,'Desna',124,NULL),('Ofanzivni vezni',180,78,15000000.00,'Desna',125,NULL),('Lijevo krilo',175,70,32000000.00,'Desna',126,NULL),('Desno krilo',180,75,100000000.00,'Desna',127,NULL),('Napadac',194,79,110000000.00,'Lijeva',128,NULL),('Golman',191,89,80000000.00,'Desna',129,NULL),('Stoper',193,89,80000000.00,'Desna',130,NULL),('Stoper',188,82,40000000.00,'Desna',131,NULL),('Lijevi bek',178,74,75000000.00,'Lijeva',132,NULL),('Desni bek',180,75,110000000.00,'Desna',133,NULL),('Centralni vezni',174,70,48000000.00,'Desna',134,NULL),('Zadnji vezni',188,81,60000000.00,'Desna',135,NULL),('Centralni vezni',187,81,28000000.00,'Desna',136,NULL),('Lijevo krilo',174,69,120000000.00,'Desna',137,NULL),('Lijevo krilo',178,69,40000000.00,'Desna',138,NULL),('Desno krilo',175,72,120000000.00,'Lijeva',139,NULL),('Napadac',181,78,72000000.00,'Desna',140,NULL),('Golman',192,82,25000000.00,'Desna',141,NULL),('Stoper',194,89,40000000.00,'Desna',142,NULL),('Stoper',187,82,24000000.00,'Desna',143,NULL),('Desni bek',183,76,40000000.00,'Desna',144,NULL),('Lijevi bek',181,73,35000000.00,'Lijeva',145,NULL),('Centralni vezni',191,86,65000000.00,'Desna',146,NULL),('Zadnji vezni',194,83,12000000.00,'Lijeva',147,NULL),('Centralni vezni',184,77,40000000.00,'Desna',148,NULL),('Ofanzivni vezni',179,75,90000000.00,'Desna',149,NULL),('Lijevo krilo',185,79,80000000.00,'Desna',150,NULL),('Desno krilo',181,72,50000000.00,'Desna',151,NULL),('Napadac',181,75,55000000.00,'Desna',152,NULL),('Napadac',184,79,12000000.00,'Desna',153,NULL),('Golman',196,90,35000000.00,'Desna',154,NULL),('Stoper',190,84,30000000.00,'Desna',155,NULL),('Stoper',189,84,75000000.00,'Desna',156,NULL),('Lijevi bek',181,76,28000000.00,'Lijeva',157,NULL),('Desni bek',184,77,17000000.00,'Desna',158,NULL),('Centralni vezni',188,81,32000000.00,'Lijeva',159,NULL),('Centralni vezni',172,66,50000000.00,'Desna',160,NULL),('Lijevo krilo',187,85,60000000.00,'Desna',161,NULL),('Desno krilo',180,78,48000000.00,'Desna',162,NULL),('Napadac',177,74,70000000.00,'Lijeva',163,NULL),('Napadac',187,81,50000000.00,'Desna',164,NULL),('Desno krilo',186,81,45000000.00,'Lijeva',165,NULL),('Desno krilo',183,78,20000000.00,'Lijeva',166,NULL),('Golman',196,88,60000000.00,'Desna',167,NULL),('Stoper',185,80,36000000.00,'Lijeva',168,NULL),('Desni bek',176,72,18000000.00,'Desna',169,NULL),('Stoper',184,72,17000000.00,'Desna',170,NULL),('Lijevi bek',184,78,50000000.00,'Lijeva',171,NULL),('Zadnji vezni',181,78,32000000.00,'Desna',172,NULL),('Ofanzivni vezni',178,76,35000000.00,'Desna',173,NULL),('Centralni vezni',183,79,40000000.00,'Desna',174,NULL),('Zadnji vezni',175,71,40000000.00,'Lijeva',175,NULL),('Napadac',195,90,5000000.00,'Desna',176,NULL),('Lijevo krilo',185,81,32000000.00,'Desna',177,NULL),('Napadac',190,83,2500000.00,'Desna',178,NULL),('Desno krilo',180,73,18000000.00,'Desna',179,NULL),('Desno krilo',182,77,13000000.00,'Lijeva',180,NULL);
/*!40000 ALTER TABLE `igrac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `klub`
--

LOCK TABLES `klub` WRITE;
/*!40000 ALTER TABLE `klub` DISABLE KEYS */;
INSERT INTO `klub` VALUES (1,'Crvena Zvezda','Super liga Srbije','http://www.crvenazvezdafk.com/en','1945-03-04','Rajko Mitic',1),(2,'Partizan','Super liga Srbije','https://www.partizan.com/','1945-10-04','JNA',2),(6,'Real Madrid','LaLiga','https://www.realmadrid.com/en','1902-03-06','Santiago Bernabeu',3),(7,'Barcelona','LaLiga','https://www.fcbarcelona.com/en/','1899-11-29','Camp Nou',4),(8,'Paris Saint-Germain','Ligue 1','https://www.psg.fr/','1970-08-12','Parc des Princes',5),(9,'Bayern Munich','Bundesliga','https://fcbayern.com/us','1900-02-27','Allianz Arena',6),(10,'Borussia Dortmund','Bundesliga','https://www.bvb.de/','1909-12-19','Signal Iduna Park',7),(11,'Liverpool','Premier League','https://www.liverpoolfc.com/','1892-03-15','Anfield',8),(12,'Manchester United','Premier League','http://https//www.manutd.com/','1878-01-01','Old Trafford',9),(13,'Juventus','Seria A','https://www.juventus.com/it','1897-11-01','Allianz Stadium',10),(14,'AC Milan','Seria A','https://www.acmilan.com/it','1899-12-16','Giuseppe Meazza',11);
/*!40000 ALTER TABLE `klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menadzer`
--

LOCK TABLES `menadzer` WRITE;
/*!40000 ALTER TABLE `menadzer` DISABLE KEYS */;
/*!40000 ALTER TABLE `menadzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (41,'Vladimir','Stojkovic','1983-07-28','Loznica',2),(47,'Svetozar','Markovic','2000-03-23','Bijeljina',1),(48,'Macky','Bagnac','1995-06-07','Tobagne',4),(49,'Slobodan','Urosevic','1994-04-15','Beograd',2),(50,'Aleksandar','Miljkovic','1990-02-26','Bor',2),(51,'Sasa','Zdjelar','1995-03-20','Beograd',2),(52,'Bibras','Natcho','1988-02-18','Kfar Kama',5),(53,'Seydouba','Soumah','1991-06-11','Conakry',6),(54,'Filip','Stevanovic','2002-09-25','Arilje',2),(55,'Lazar','Markovic','1994-03-02','Cacak',2),(56,'Takuma','Asano','1994-11-10','Komono',7),(57,'Milan','Borjan','1987-10-23','Knin',8),(58,'Milos','Degenek','1994-07-12','Knin',9),(59,'Nemanja','Milunovic','1989-05-31','Cacak',2),(60,'Milan','Gajic','1996-01-28','Vukovar',2),(61,'Milan','Rodic','1991-04-02','Drvar',2),(62,'Zeljko','Gavric','1991-04-02','Ugljevik',2),(63,'Guelor','Kanga','1990-09-01','Oyem',10),(64,'Mirko','Ivanic','1993-09-13','Backi Jarak',11),(65,'Aleksandar','Katai','1991-02-06','Srbobran',2),(66,'Diego','Falcinelli','1991-06-26','Marsciano',12),(67,'Filippo','Falco','1992-02-11','Taranto',12),(68,'Thibaut','Courtois','1992-05-11','Bree',19),(69,'Sergio','Ramos','1986-03-30','Camas(Sevilla)',13),(70,'Raphael','Varane','1993-04-25','Lille',14),(71,'Daniel','Carvajal','1992-01-11','Leganes',13),(72,'Vieira Silva Junior','Marcelo','1988-05-12','Rio de Janeiro',17),(73,'Jose Paixao','Vinicius Junior','2000-07-12','Sao Goncalo',17),(74,'Carlos Henrique','Casemiro','1992-02-23','Sao Jose dos Campos',17),(75,'Eden','Hazard','1991-01-07','La Louviere',19),(76,'Luka','Modric','1985-09-09','Zadar',3),(77,'Karim','Benzema','1987-12-19','Lyon',14),(78,'Jose Paixao','Vinicius Junior','2000-07-12','Sao Goncalo',17),(79,'Silva da Goes','Rodrygo','2001-01-09','Osasco',17),(80,'Marc-Andre','ter Stegen','1992-04-30','Monchengladbach',20),(81,'Clement','Lenglet','1995-06-17','Beauvais',14),(82,'Gerard','Pique','1987-02-02','Barcelona',13),(83,'Jordi','Alba','1989-04-21','LHospitalet de Llobregat',13),(84,'Sergi','Roberto','1992-02-07','Reus',13),(85,'Sergio','Busquets','1988-07-16','sabadell',13),(86,'Frenkie','de Jong','1997-05-12','Arkel',21),(87,'Miralem','Pjanic','1990-04-02','Zvornik',1),(88,'Philippe','Coutinho','1992-06-12','Rio de Janeiro',17),(89,'Lionel','Messi','1987-06-24','Rosario',18),(90,'Antoine','Griezmann','1991-03-21','Macon',14),(91,'Ansu','Fati','2002-10-31','Bissai',13),(92,'Keylor','Navas','1986-12-15','San Idris de El General',22),(93,'Aoas Correa','Marquinhos','1994-05-14','Sao Paulo',17),(94,'Dejan','Kulusevski','2000-04-25','Stockholm',31),(95,'Allesandro','Florenzi','1991-03-11','Roma',12),(96,'Juan','Bernat','1993-03-01','Cullera',13),(97,'Marco','Verratti','1995-11-05','Pescara',12),(98,'Ander','Herrera','1989-08-14','Bilbao',13),(99,'Julian','Draxler','1993-09-20','Gladbeck',20),(100,'Santos Junior','Neymar','1991-02-05','Mogl das Cruzes',17),(101,'Angel','Di Maria','1988-02-14','Rosario',18),(102,'Kylian','Mbappe','1998-12-20','Paris',14),(103,'Mauro','Icardi','1993-02-19','Rosario',18),(104,'Manuel','Neuer','1986-03-27','Gelsenkirchen',20),(105,'David','Alaba','1992-06-24','Wien',23),(106,'Niklas','Sule','1995-09-03','Frankfurt',20),(107,'Alphonso','Davies','2000-11-02','Buduburam',8),(108,'Benjamin','Pavard','1996-03-28','Maubeuge',14),(109,'Joshua','Kimmich','1995-02-08','Rottweil',20),(110,'Leon','Goretzka','1995-02-06','Bochum',20),(111,'Leroy','Sane','1996-01-11','Essen',20),(112,'Kingsley','Coman','1996-06-13','Paris',14),(113,'Serge','Gnabry','1996-06-13','Stuttgart',20),(114,'Thomas','Muller','1989-09-13','Weilheim',20),(115,'Robert','Lewandowski','1988-08-21','Warszawa',24),(116,'Roman','Burki','1990-11-14','Munsingen',25),(117,'Dan-Axel','Zagadou','1999-06-03','Creteil',14),(118,'Mats','Hummels','1988-12-16','Bergisch Gladbach',20),(119,'Raphael','Guerreiro','1993-12-22','Le Blanc-Mesnil',16),(120,'Thomas','Meunier','1991-09-12','Sainte-Ode',19),(121,'Jude','Bellingham','2003-06-29','Stourbridge',15),(122,'Emre','Can','1994-01-12','Frankfurt am Main',20),(123,'Giovanni','Reyna','2002-11-13','Durham',26),(124,'Julian','Brandt','1996-05-02','Bremen',20),(125,'Marco','Reus','1996-05-02','Dortmund',20),(126,'Thorgan','Hazard','1993-03-29','La Louviere',19),(127,'Jadon','Sancho','2000-03-25','London',15),(128,'Erling','Haaland','2000-07-21','Leeds',27),(129,'Ramses Becker','Allison','1992-10-02','Novo Hamburgo',17),(130,'Virgil','van Dijk','1991-07-08','Breda',21),(131,'Joe','Gomez','1997-05-23','London',15),(132,'Andrew','Robertson','1994-03-11','Glasgow',28),(133,'Trent','Alexander-Arnold','1998-10-07','Liverpool',15),(134,'Alcantara','Thiago','1991-04-11','San Pietro Vernotico',13),(135,'Henrique Tavares','Fabinho','1993-10-23','Campinas',17),(136,'Jordan','Henderson','1990-06-17','Sunderland',15),(137,'Sadio','Mane','1992-04-10','Sedhiou',30),(138,'Diego ','Jota','1996-12-04','Porto',16),(139,'Mohamed','Salah','1992-06-15','Nagrig',29),(140,'Roberto','Firmino','1991-10-02','Maceio',17),(141,'David','de Gea','1990-11-07','Madrid',13),(142,'Harry','Maguire','1993-03-05','Sheffield',15),(143,'Victor','Lindelof','1994-07-17','Vasteras',31),(144,'Aaron','Wan-Bissaka','1997-11-26','London',15),(145,'Alex','Telles','1992-12-15','Caxias do Sul',17),(146,'Paul','Pogba','1993-03-15','Lagny-sur-Marne',14),(147,'Nemanja','Matic','1988-08-01','Sabac',2),(148,'Donny','van de Beek','1997-04-18','Nijkerkerveen',21),(149,'Bruno','Fernandes','1994-09-08','Maia',16),(150,'Marcus','Rashford','1997-10-31','Manchester',15),(151,'Mason','Greenwood','1997-10-31','Bradford',15),(152,'Anthony','Martial','1995-12-05','Massy',14),(153,'Edinson','Cavani','1987-02-14','Salto',32),(154,'Wojciech','Szczesny','1990-04-18','Warszawa',24),(155,'Merih','Demiral','2021-02-15','Kocaeli',33),(156,'Matthijs','de Ligt','2021-02-15','Leiderdorp',21),(157,'Alex','Sandro','1991-01-26','Catanduva',17),(158,'Alex','Danilo','1991-07-15','Bicas',17),(159,'Adrien','Rabiot','1995-04-03','Saint-Maurice',14),(160,'Henrique Ramos de Oliveira','Arthur','1996-08-12','Goiana',17),(161,'Cristiano','Ronaldo','1985-02-05','Funchal',16),(162,'Federico','Chiesa','1997-10-25','Genova',12),(163,'Paulo','Dybala','1993-11-15','Laguna Larga',18),(164,'Alvaro','Morata','1992-10-23','Madrid',13),(165,'Dejan','Kulusevski','2000-04-25','Stockholm',31),(166,'Federico','Bernardeschi','1994-02-16','Carrara',12),(167,'Gianluigi','Donnarumma','1999-02-25','	Castellammare di Stabia',12),(168,'Alessio','Romagnoli','1995-01-12','Anzio',12),(169,'Davide','Calabria','1996-12-06','Brescia',12),(170,'Fikayo','Tomori','1997-12-19','Calgary',15),(171,'Theo','Hernandez','1997-10-06','Marseille',15),(172,'Sandro','Tonali','2000-05-08','Lodi',12),(173,'Hakan','Calhanoglu','1994-02-08','Mannheim',33),(174,'Franck','Kessie','1996-12-19','Ouragahio',35),(175,'Ismael','Bennacer','1997-12-01','Arles',34),(176,'Zlatan','Ibrahimovic','1981-10-03','Malmo',31),(177,'Ante','Rebic','1993-09-21','Split',3),(178,'Mario','Mandzukic','1984-05-21','Slavonski Brod',3),(179,'Mario','Saelemaekers','1999-06-27','Berchem-Sainte-Agathe',19),(180,'Mario','Castillejo','1995-01-18','Malaga',13);
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sezona`
--

LOCK TABLES `sezona` WRITE;
/*!40000 ALTER TABLE `sezona` DISABLE KEYS */;
/*!40000 ALTER TABLE `sezona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sponzor`
--

LOCK TABLES `sponzor` WRITE;
/*!40000 ALTER TABLE `sponzor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponzor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sponzor_kluba`
--

LOCK TABLES `sponzor_kluba` WRITE;
/*!40000 ALTER TABLE `sponzor_kluba` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponzor_kluba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stadion`
--

LOCK TABLES `stadion` WRITE;
/*!40000 ALTER TABLE `stadion` DISABLE KEYS */;
INSERT INTO `stadion` VALUES ('Allianz Arena',75024,2005,6),('Allianz Stadium',41507,2011,10),('Anfield',54074,1884,8),('Camp Nou',99354,1957,4),('Giuseppe Meazza',75923,1926,11),('JNA',32710,1949,2),('Old Trafford',74879,1910,9),('Parc des Princes',49691,1897,5),('Rajko Mitic',51755,1964,1),('Santiago Bernabeu',81000,1947,3),('Signal Iduna Park',81365,1974,7);
/*!40000 ALTER TABLE `stadion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `statistika_igraca`
--

LOCK TABLES `statistika_igraca` WRITE;
/*!40000 ALTER TABLE `statistika_igraca` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistika_igraca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `statistika_trenera`
--

LOCK TABLES `statistika_trenera` WRITE;
/*!40000 ALTER TABLE `statistika_trenera` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistika_trenera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `telefon`
--

LOCK TABLES `telefon` WRITE;
/*!40000 ALTER TABLE `telefon` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (11,'2021-02-15',10000000.00,176,14,13),(12,'2021-02-15',10000000.00,176,13,14),(13,'2021-01-13',8000000.00,63,1,2),(14,'2021-01-13',8000000.00,63,2,1);
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trener`
--

LOCK TABLES `trener` WRITE;
/*!40000 ALTER TABLE `trener` DISABLE KEYS */;
/*!40000 ALTER TABLE `trener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ugovor`
--

LOCK TABLES `ugovor` WRITE;
/*!40000 ALTER TABLE `ugovor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ugovor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-16 14:01:14
