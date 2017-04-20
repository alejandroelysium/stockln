# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11)
# Database: stockln
# Generation Time: 2017-04-20 21:16:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_posicion` varchar(3) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `producto` varchar(50) DEFAULT NULL,
  `fecha_inicial` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `utilidad_mensual` int(11) DEFAULT NULL,
  `estanteria` int(11) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;

INSERT INTO `logs` (`id`, `usuario`, `fecha`, `id_posicion`, `empresa`, `producto`, `fecha_inicial`, `fecha_final`, `utilidad_mensual`, `estanteria`, `categoria`)
VALUES
	(1,'alejandro','2017-04-16 00:00:00','a-1','CARLOS1','NECTAR1','2017-04-02 00:00:00','2017-04-03 00:00:00',10,1,'LICOR1'),
	(2,'alejandro','2017-04-16 13:07:40','b-1','ALEJANDRO','REDBULL','2017-03-01 00:00:00','2017-03-02 00:00:00',10000,1,'LICOR'),
	(3,'carolina','2017-04-20 12:43:08','d-1','hola','hola','2017-02-03 00:00:00','2017-04-04 00:00:00',10,1,'hola'),
	(4,'carolina','2017-04-20 12:44:53','c-4','Zuluaga & Soto','GRANT\'S','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'Whisky'),
	(5,'carolina','2017-04-20 12:46:52','c-4','Zuluaga&Soto','GRANT\'S','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'Whisky'),
	(6,'carolina','2017-04-20 12:47:48','c-4','Zuluaga&Soto','Grant\'s','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'Whisky'),
	(7,'carolina','2017-04-20 12:48:14','d-1','zuluaga y soto','grants','2017-02-03 00:00:00','2017-04-04 00:00:00',10,1,'whisky'),
	(8,'carolina','2017-04-20 12:48:58','c-4','zuluaga y soto','Grants','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'whisky'),
	(9,'carolina','2017-04-20 12:49:16','c-4','zuluaga & soto','Grants','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'whisky'),
	(10,'carolina','2017-04-20 12:56:21','d-4','zuluaga & soto','glenfidish','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'whisky');

/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id_posicion` varchar(3) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `producto` varchar(100) DEFAULT NULL,
  `fecha_inicial` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `utilidad_mensual` int(11) DEFAULT NULL,
  `estanteria` int(11) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;

INSERT INTO `stock` (`id_posicion`, `empresa`, `producto`, `fecha_inicial`, `fecha_final`, `utilidad_mensual`, `estanteria`, `categoria`, `orden`)
VALUES
	('a-1','','',NULL,NULL,NULL,1,'',1),
	('a-2','','',NULL,NULL,NULL,1,'',7),
	('a-3','','',NULL,NULL,NULL,1,'',13),
	('a-4','','',NULL,NULL,NULL,1,'',19),
	('a-5','','',NULL,NULL,NULL,1,'',25),
	('a-6','','',NULL,NULL,NULL,1,'',31),
	('a-7','','',NULL,NULL,NULL,1,'',37),
	('b-1','','',NULL,NULL,NULL,1,'',2),
	('b-2','','',NULL,NULL,NULL,1,'',8),
	('b-3','','',NULL,NULL,NULL,1,'',14),
	('b-4','','',NULL,NULL,NULL,1,'',20),
	('b-5','','',NULL,NULL,NULL,1,'',26),
	('b-6','','',NULL,NULL,NULL,1,'',32),
	('b-7','','',NULL,NULL,NULL,1,'',38),
	('c-1','','',NULL,NULL,NULL,1,'',3),
	('c-2','','',NULL,NULL,NULL,1,'',9),
	('c-3','','',NULL,NULL,NULL,1,'',15),
	('c-4','zuluaga & soto','Grants','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'whisky',21),
	('c-5','','',NULL,NULL,NULL,1,'',27),
	('c-6','','',NULL,NULL,NULL,1,'',33),
	('c-7','','',NULL,NULL,NULL,1,'',39),
	('d-1','','',NULL,NULL,NULL,1,'',4),
	('d-2','','',NULL,NULL,NULL,1,'',10),
	('d-3','','',NULL,NULL,NULL,1,'',16),
	('d-4','zuluaga & soto','glenfidish','2017-04-20 00:00:00','2018-04-19 00:00:00',300000,1,'whisky',22),
	('d-5','','',NULL,NULL,NULL,1,'',28),
	('d-6','','',NULL,NULL,NULL,1,'',34),
	('d-7','','',NULL,NULL,NULL,1,'',40),
	('e-1','','',NULL,NULL,NULL,1,'',5),
	('e-2','','',NULL,NULL,NULL,1,'',11),
	('e-3','','',NULL,NULL,NULL,1,'',17),
	('e-4','','',NULL,NULL,NULL,1,'',23),
	('e-5','','',NULL,NULL,NULL,1,'',29),
	('e-6','','',NULL,NULL,NULL,1,'',35),
	('e-7','','',NULL,NULL,NULL,1,'',41),
	('f-1','','',NULL,NULL,NULL,1,'',6),
	('f-2','','',NULL,NULL,NULL,1,'',12),
	('f-3','','',NULL,NULL,NULL,1,'',18),
	('f-4','','',NULL,NULL,NULL,1,'',24),
	('f-5','','',NULL,NULL,NULL,1,'',30),
	('f-6','','',NULL,NULL,NULL,1,'',36),
	('f-7','','',NULL,NULL,NULL,1,'',42),
	('a-1','','',NULL,NULL,NULL,2,'',1),
	('a-2','','',NULL,NULL,NULL,2,'',5),
	('a-3','','',NULL,NULL,NULL,2,'',9),
	('a-4','','',NULL,NULL,NULL,2,'',13),
	('a-5','','',NULL,NULL,NULL,2,'',17),
	('a-6','','',NULL,NULL,NULL,2,'',21),
	('a-7','','',NULL,NULL,NULL,2,'',25),
	('a-8','','',NULL,NULL,NULL,2,'',29),
	('b-1','','',NULL,NULL,NULL,2,'',2),
	('b-2','','',NULL,NULL,NULL,2,'',6),
	('b-3','','',NULL,NULL,NULL,2,'',10),
	('b-4','','',NULL,NULL,NULL,2,'',14),
	('b-5','','',NULL,NULL,NULL,2,'',18),
	('b-6','','',NULL,NULL,NULL,2,'',22),
	('b-7','','',NULL,NULL,NULL,2,'',26),
	('b-8','','',NULL,NULL,NULL,2,'',30),
	('c-1','','',NULL,NULL,NULL,2,'',3),
	('c-2','','',NULL,NULL,NULL,2,'',7),
	('c-3','','',NULL,NULL,NULL,2,'',11),
	('c-4','','',NULL,NULL,NULL,2,'',15),
	('c-5','','',NULL,NULL,NULL,2,'',19),
	('c-6','','',NULL,NULL,NULL,2,'',23),
	('c-7','','',NULL,NULL,NULL,2,'',27),
	('c-8','','',NULL,NULL,NULL,2,'',31),
	('d-1','','',NULL,NULL,NULL,2,'',4),
	('d-2','','',NULL,NULL,NULL,2,'',8),
	('d-3','','',NULL,NULL,NULL,2,'',12),
	('d-4','','',NULL,NULL,NULL,2,'',16),
	('d-5','','',NULL,NULL,NULL,2,'',20),
	('d-6','','',NULL,NULL,NULL,2,'',24),
	('d-7','','',NULL,NULL,NULL,2,'',28),
	('d-8','','',NULL,NULL,NULL,2,'',32),
	('a-1','','',NULL,NULL,NULL,3,'',1),
	('a-2','','',NULL,NULL,NULL,3,'',7),
	('a-3','','',NULL,NULL,NULL,3,'',13),
	('a-4','','',NULL,NULL,NULL,3,'',19),
	('a-5','','',NULL,NULL,NULL,3,'',25),
	('a-6','','',NULL,NULL,NULL,3,'',31),
	('b-1','','',NULL,NULL,NULL,3,'',2),
	('b-2','','',NULL,NULL,NULL,3,'',8),
	('b-3','','',NULL,NULL,NULL,3,'',14),
	('b-4','','',NULL,NULL,NULL,3,'',20),
	('b-5','','',NULL,NULL,NULL,3,'',26),
	('b-6','','',NULL,NULL,NULL,3,'',32),
	('c-1','','',NULL,NULL,NULL,3,'',3),
	('c-2','','',NULL,NULL,NULL,3,'',9),
	('c-3','','',NULL,NULL,NULL,3,'',15),
	('c-4','','',NULL,NULL,NULL,3,'',21),
	('c-5','','',NULL,NULL,NULL,3,'',27),
	('c-6','','',NULL,NULL,NULL,3,'',33),
	('d-1','','',NULL,NULL,NULL,3,'',4),
	('d-2','','',NULL,NULL,NULL,3,'',10),
	('d-3','','',NULL,NULL,NULL,3,'',16),
	('d-4','','',NULL,NULL,NULL,3,'',22),
	('d-5','','',NULL,NULL,NULL,3,'',28),
	('d-6','','',NULL,NULL,NULL,3,'',34),
	('e-1','','',NULL,NULL,NULL,3,'',5),
	('e-2','','',NULL,NULL,NULL,3,'',11),
	('e-3','','',NULL,NULL,NULL,3,'',17),
	('e-4','','',NULL,NULL,NULL,3,'',23),
	('e-5','','',NULL,NULL,NULL,3,'',29),
	('e-6','','',NULL,NULL,NULL,3,'',35),
	('f-1','','',NULL,NULL,NULL,3,'',6),
	('f-2','','',NULL,NULL,NULL,3,'',12),
	('f-3','','',NULL,NULL,NULL,3,'',18),
	('f-4','','',NULL,NULL,NULL,3,'',24),
	('f-5','','',NULL,NULL,NULL,3,'',30),
	('f-6','','',NULL,NULL,NULL,3,'',36),
	('a-1','','',NULL,NULL,NULL,4,'',1),
	('a-2','','',NULL,NULL,NULL,4,'',8),
	('a-3','','',NULL,NULL,NULL,4,'',15),
	('a-4','','',NULL,NULL,NULL,4,'',22),
	('a-5','','',NULL,NULL,NULL,4,'',29),
	('a-6','','',NULL,NULL,NULL,4,'',36),
	('a-7','','',NULL,NULL,NULL,4,'',43),
	('b-1','','',NULL,NULL,NULL,4,'',2),
	('b-2','','',NULL,NULL,NULL,4,'',9),
	('b-3','','',NULL,NULL,NULL,4,'',16),
	('b-4','','',NULL,NULL,NULL,4,'',23),
	('b-5','','',NULL,NULL,NULL,4,'',30),
	('b-6','','',NULL,NULL,NULL,4,'',37),
	('b-7','','',NULL,NULL,NULL,4,'',44),
	('c-1','','',NULL,NULL,NULL,4,'',3),
	('c-2','','',NULL,NULL,NULL,4,'',10),
	('c-3','','',NULL,NULL,NULL,4,'',17),
	('c-4','','',NULL,NULL,NULL,4,'',24),
	('c-5','','',NULL,NULL,NULL,4,'',31),
	('c-6','','',NULL,NULL,NULL,4,'',38),
	('c-7','','',NULL,NULL,NULL,4,'',45),
	('d-1','','',NULL,NULL,NULL,4,'',4),
	('d-2','','',NULL,NULL,NULL,4,'',11),
	('d-3','','',NULL,NULL,NULL,4,'',18),
	('d-4','','',NULL,NULL,NULL,4,'',25),
	('d-5','','',NULL,NULL,NULL,4,'',32),
	('d-6','','',NULL,NULL,NULL,4,'',39),
	('d-7','','',NULL,NULL,NULL,4,'',46),
	('e-1','','',NULL,NULL,NULL,4,'',5),
	('e-2','','',NULL,NULL,NULL,4,'',12),
	('e-3','','',NULL,NULL,NULL,4,'',19),
	('e-4','','',NULL,NULL,NULL,4,'',26),
	('e-5','','',NULL,NULL,NULL,4,'',33),
	('e-6','','',NULL,NULL,NULL,4,'',40),
	('e-7','','',NULL,NULL,NULL,4,'',47),
	('f-1','','',NULL,NULL,NULL,4,'',6),
	('f-2','','',NULL,NULL,NULL,4,'',13),
	('f-3','','',NULL,NULL,NULL,4,'',20),
	('f-4','','',NULL,NULL,NULL,4,'',27),
	('f-5','','',NULL,NULL,NULL,4,'',34),
	('f-6','','',NULL,NULL,NULL,4,'',41),
	('f-7','','',NULL,NULL,NULL,4,'',48),
	('g-1','','',NULL,NULL,NULL,4,'',7),
	('g-2','','',NULL,NULL,NULL,4,'',14),
	('g-3','','',NULL,NULL,NULL,4,'',21),
	('g-4','','',NULL,NULL,NULL,4,'',28),
	('g-5','','',NULL,NULL,NULL,4,'',35),
	('g-6','','',NULL,NULL,NULL,4,'',42),
	('g-7','','',NULL,NULL,NULL,4,'',49),
	('V-I','','',NULL,NULL,NULL,5,'',1),
	('V-D','','',NULL,NULL,NULL,5,'',3),
	('1','','',NULL,NULL,NULL,6,'',1),
	('2','','',NULL,NULL,NULL,6,'',6),
	('3','','',NULL,NULL,NULL,6,'',11),
	('4','','',NULL,NULL,NULL,6,'',16),
	('5','','',NULL,NULL,NULL,6,'',21),
	('W-1','','',NULL,NULL,NULL,7,'',1),
	('W-2','','',NULL,NULL,NULL,7,'',5),
	('W-3','','',NULL,NULL,NULL,7,'',9),
	('W-3','','',NULL,NULL,NULL,7,'',13),
	('V-I','','',NULL,NULL,NULL,8,'',1),
	('V-D','','',NULL,NULL,NULL,8,'',3),
	('O-E','','',NULL,NULL,NULL,9,'',1),
	('O-C','','',NULL,NULL,NULL,9,'',3);

/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`id`, `username`, `password`, `nombre`, `correo`, `estado`)
VALUES
	(1,'alejandro','123456','Alejandro Rios','alejandrorios1109@gmail.com',1),
	(2,'burrego','blaifig390','Bleik','bleik.urrego@elysium.works',1),
	(3,'marta','m12345','Martha Murillo',NULL,1),
	(4,'carolina','casillas','Carolina Monroy',NULL,1);

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
