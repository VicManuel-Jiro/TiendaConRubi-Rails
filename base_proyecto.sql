-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: dblpoo
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `consola_id` int DEFAULT NULL,
  `juego_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consola_id` (`consola_id`),
  KEY `juego_id` (`juego_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`consola_id`) REFERENCES `consolas` (`id`),
  CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`juego_id`) REFERENCES `juegos` (`id`),
  CONSTRAINT `articulos_ibfk_3` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (9,NULL,NULL,2),(10,1,NULL,NULL),(11,NULL,NULL,3);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulospedidos`
--

DROP TABLE IF EXISTS `articulospedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulospedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compra` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra` (`id_compra`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `articulospedidos_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `articulos` (`id`),
  CONSTRAINT `articulospedidos_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulospedidos`
--

LOCK TABLES `articulospedidos` WRITE;
/*!40000 ALTER TABLE `articulospedidos` DISABLE KEYS */;
INSERT INTO `articulospedidos` VALUES (4,9,5),(5,10,6),(6,11,7);
/*!40000 ALTER TABLE `articulospedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casaproductoras`
--

DROP TABLE IF EXISTS `casaproductoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casaproductoras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fundador` varchar(50) DEFAULT NULL,
  `ceo` varchar(50) DEFAULT NULL,
  `sitio` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `atencion_clientes` varchar(50) DEFAULT NULL,
  `sede` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casaproductoras`
--

LOCK TABLES `casaproductoras` WRITE;
/*!40000 ALTER TABLE `casaproductoras` DISABLE KEYS */;
INSERT INTO `casaproductoras` VALUES (1,'Konami','Kagemasa Kozuki','Kagemasa Kozuki','www.konami.com','0000000000','0000000000','Chou','@Konami'),(3,'bandai','asd','ads','www.dfg.c','2222222222','css','sdsdsd','@fdfd'),(8,'namco','luis','jose','www.dfg.com','1111111111','7131358742','usa','@namco');
/*!40000 ALTER TABLE `casaproductoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `cp` int DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Manuel','jimenez','rosas','1111111111','asdasads@dfad',1,52350,'juarez',1,'JIRV950126L64'),(2,'Daniel','zxc','zcxczx','1111111110','manuel@gmail.com',1,52430,'Zaragoza',113,'JIRV950126L60'),(4,'Luis','Perez','Rosas','1111111110','correo1@gmail.com',1,52350,'zaragoza',113,'JIRV950126L62');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consolas`
--

DROP TABLE IF EXISTS `consolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consolas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `plataforma_id` int DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `edicion` varchar(50) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `codigo_barras` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plataforma` (`plataforma_id`),
  CONSTRAINT `fk_plataforma` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consolas`
--

LOCK TABLES `consolas` WRITE;
/*!40000 ALTER TABLE `consolas` DISABLE KEYS */;
INSERT INTO `consolas` VALUES (1,'xbox 360',1,'blanco','normal',500,19,2500.00,0,'882224734820'),(2,'xbox one',1,'negro','normal',1000,3,5000.00,0,'750154568487'),(3,'play2',3,'negro','normal',1000,5,2500.00,0,'00000000001');
/*!40000 ALTER TABLE `consolas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `pais_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `estados_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Estado de Mexico','EDOMEX',1),(6,'Ciudad de Mexico','CDMX',1);
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juegos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `plataforma_id` int DEFAULT NULL,
  `consola_id` int DEFAULT NULL,
  `edicion` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `clasificacion` varchar(3) DEFAULT NULL,
  `casa_productora_id` int DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `codigo_barras` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plataforma_id` (`plataforma_id`),
  KEY `consola_id` (`consola_id`),
  KEY `casa_productora_id` (`casa_productora_id`),
  CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`),
  CONSTRAINT `juegos_ibfk_2` FOREIGN KEY (`consola_id`) REFERENCES `consolas` (`id`),
  CONSTRAINT `juegos_ibfk_3` FOREIGN KEY (`casa_productora_id`) REFERENCES `casaproductoras` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (3,'Silent Hill Downpour',1,1,'normal','terror','M+',1,10,970.00,0,'710425390123');
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Mexico','MX'),(6,'Francia','Fr');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `cp` int DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `sucursal_id` int DEFAULT NULL,
  `urgencia` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `sucursal_id` (`sucursal_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (5,1,100.00,10,52350,'zaragoza',113,1,'no'),(6,1,2500.00,10,52350,'zaragoza',113,1,'no'),(7,4,5000.00,0,52350,'zaragoza',113,3,'si');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `tipo_empresa` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `tipo_dispositivo` varchar(10) DEFAULT NULL,
  `sitio` varchar(50) DEFAULT NULL,
  `fundador` varchar(50) DEFAULT NULL,
  `sede` varchar(50) DEFAULT NULL,
  `ceo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES (1,'xbox','microsoft','privada','videojuegos','consola','www.microsoft.com','bill','washingtong','bill'),(2,'Wii','Nintendo','privada','videojuegos','consola','http://nintendo.com','Fusajiro Yamauchi','Kioto','Fusajiro Yamauchi'),(3,'android','google','privada','general','celular','http://nintendo.com','Fusajiro Yamauchi','Kioto','Fusajiro Yamauchi');
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `existencia` int DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `descuento` int DEFAULT NULL,
  `codigo_barras` varchar(14) DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'audifonos','audifonos negros sony','tecnologia','negro',9,100.00,0,'516164945254',1),(3,'lap','laptop','tecnologia','gris',5,5000.00,0,'222222222222',1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `comision` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'juan','ramirez','lopez','0000000000','asdas@gmail.com','JIRV950126L64','calle sur numero 14',10),(4,'luis','jimenez','rosas','0000000000','asdas@gmail.com','JIRV950126L63','zaragoza',10);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado_id` int DEFAULT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `no_identificador` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,1,'allende',105,'patito',105847),(3,1,'allende',113,'patito2',554882);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `estado_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'JIRV950126L64','JIRV950126HDFMSC09','Victor Manuel','Jimenez','Rosas','M','7131374982','vicmanuel2508@gmail.com','Jiro','123456*',6),(9,'JIRV950126L63','JIRV950126HDFMSC07','Rosa Isela','Hernandez','Lopez','F','0000000000','rosa@gmail.com','Rosa','Rosa123*',1),(10,'JIRV950126L62','JIRV950126HDFMSC08','Uriel','Ferra','Romero','M','1111111110','uriel@gmail.com','Uriel','Jiro123*',6),(11,'JIRV950126L68','JIRV950126HDFMSC05','Jose','Hernandez','Tellez','M','4324234423','jose@gmail.com','Lupito','Lupito1*',6),(12,'JIRV950126L69','JIRV950126HDFMSC10','Estefany','Montano','Estrada','F','1234567891','fanny@gmail.com','Fanny','Fanny12*',1),(13,'JIRV950126L60','JIRV950126HDFMSC01','sdfsfd','sfdfs','dsd','F','1111111111','ds@sdf','ddasdJ','Jiro123*',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-11 10:39:21
