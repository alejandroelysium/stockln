-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para stockln
DROP DATABASE IF EXISTS `stockln`;
CREATE DATABASE IF NOT EXISTS `stockln` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `stockln`;

-- Volcando estructura para tabla stockln.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla stockln.logs: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `usuario`, `fecha`, `id_posicion`, `empresa`, `producto`, `fecha_inicial`, `fecha_final`, `utilidad_mensual`, `estanteria`, `categoria`) VALUES
	(1, 'alejandro', '2017-04-16 00:00:00', 'a-1', 'CARLOS1', 'NECTAR1', '2017-04-02 00:00:00', '2017-04-03 00:00:00', 10, 1, 'LICOR1'),
	(2, 'alejandro', '2017-04-16 13:07:40', 'b-1', 'ALEJANDRO', 'REDBULL', '2017-03-01 00:00:00', '2017-03-02 00:00:00', 10000, 1, 'LICOR');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Volcando estructura para tabla stockln.stock
DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id_posicion` varchar(3) DEFAULT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `producto` varchar(50) DEFAULT NULL,
  `fecha_inicial` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `utilidad_mensual` int(11) DEFAULT NULL,
  `estanteria` int(11) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stockln.stock: ~48 rows (aproximadamente)
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`id_posicion`, `empresa`, `producto`, `fecha_inicial`, `fecha_final`, `utilidad_mensual`, `estanteria`, `categoria`, `orden`) VALUES
	('a-1', 'CARLOS1', 'NECTAR1', '2017-04-02 00:00:00', '2017-04-03 00:00:00', 10, 1, 'LICOR1', 1),
	('a-1', 'CARLOS1', 'NECTAR1', '2017-04-02 00:00:00', '2017-04-03 00:00:00', 10, 1, 'LICOR1', 7),
	('a-3', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 13),
	('a-4', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 19),
	('a-5', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 25),
	('a-6', 'CARLOS', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 31),
	('a-7', 'ALEJANDRO', 'REDBULL', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 37),
	('a-8', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 43),
	('b-1', 'ALEJANDRO', 'REDBULL', '2017-03-01 00:00:00', '2017-03-02 00:00:00', 10000, 1, 'LICOR', 2),
	('b-2', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 8),
	('b-3', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 14),
	('b-4', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 20),
	('b-5', 'CARLOS', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 26),
	('b-6', 'ALEJANDRO', 'REDBULL', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 32),
	('b-7', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 38),
	('b-8', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 44),
	('c-1', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 3),
	('c-2', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 9),
	('c-3', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 15),
	('c-4', 'GRANTS', 'GRANTS', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 21),
	('c-5', 'GRANTS', 'GRANTS', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 27),
	('c-6', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 33),
	('c-7', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 39),
	('c-8', 'ALEJANDRO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 45),
	('d-1', 'CARLOSa', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 4),
	('d-2', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 10),
	('d-3', 'CARLOS', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 16),
	('d-4', 'GRANTS', 'GRANTS', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 22),
	('d-5', 'GRANTS', 'GRANTS', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 28),
	('d-6', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 34),
	('d-7', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 40),
	('d-8', 'EDUARD', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 46),
	('e-1', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 5),
	('e-2', 'CARLOS', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 11),
	('e-3', 'ALEJANDRO', 'REDBULL', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 17),
	('e-4', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 23),
	('e-5', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 29),
	('e-6', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 35),
	('e-7', 'CARLOS', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 41),
	('e-8', 'CARLOS', 'REDBULL', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 47),
	('f-1', 'CARLOS', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 6),
	('f-2', 'ALEJANDRO', 'REDBULL', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 12),
	('f-3', 'EDUARD', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 18),
	('f-4', 'CARLOS', 'COSTENA', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 24),
	('f-5', 'RICARDO', 'AGUARDIENTE', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 30),
	('f-6', 'CARLOS', 'NECTAR', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 36),
	('f-7', 'ALEJANDRO', 'REDBULL', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 42),
	('f-8', 'RICARDO', 'POKER', '2017-04-03 00:00:00', '2017-04-03 00:00:00', 0, 1, 'LICOR', 48);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

-- Volcando estructura para tabla stockln.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla stockln.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password`, `nombre`, `correo`, `estado`) VALUES
	(1, 'alejandro', '123456', 'Alejandro Rios', 'alejandrorios1109@gmail.com', 1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
