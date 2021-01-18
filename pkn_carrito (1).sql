-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-01-2021 a las 16:59:12
-- Versión del servidor: 5.7.12-log
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pkn_carrito`
--
CREATE DATABASE IF NOT EXISTS `pkn_carrito` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pkn_carrito`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `ING_CARRITO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ING_CARRITO` (IN `ID_U1` INT, IN `ID_P1` INT, IN `CANTIDAD` INT)  INSERT INTO carrito (ID_U1, ID_P1, CANTIDAD) VALUES (ID_U1, ID_P1, CANTIDAD)$$

DROP PROCEDURE IF EXISTS `ING_DOMICILIO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ING_DOMICILIO` (IN `ID_U2` INT(11), IN `CALLE` VARCHAR(150), IN `N_EXT` INT(11), IN `N_INT` INT(11), IN `COLONIA` VARCHAR(50), IN `CIUDAD` VARCHAR(50), IN `CP` INT(11), IN `PAIS` VARCHAR(100))  INSERT INTO domicilio (ID_U2, CALLE, N_EXT, N_INT, COLONIA, CIUDAD, CP, PAIS) VALUES (ID_U2, CALLE, N_EXT, N_INT, COLONIA, CIUDAD, CP, PAIS)$$

DROP PROCEDURE IF EXISTS `ING_ORDEN`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ING_ORDEN` (IN `ID_U3` INT, IN `ID_PAGO1` INT, IN `ID_DO1` INT, IN `TOTAL` FLOAT)  INSERT INTO orden (ID_O, ID_U3, ID_PAGO1, ID_DO1, TOTAL) VALUES (ID_O, ID_U3, ID_PAGO1, ID_DO1, TOTAL)$$

DROP PROCEDURE IF EXISTS `ING_ORDENDETALLE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ING_ORDENDETALLE` (IN `ID_O1` INT, IN `ID_P2` INT, IN `CANTIDAD` INT, IN `PRECIO` FLOAT)  INSERT INTO ordendetalle (ID_O1, ID_P2, CANTIDAD,PRECIO) VALUES (ID_O1, ID_P2, CANTIDAD, PRECIO)$$

DROP PROCEDURE IF EXISTS `ING_PRODUCTO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ING_PRODUCTO` (IN `NOM_P` VARCHAR(50), IN `PRECIO` FLOAT, IN `DESCRIPCION` VARCHAR(300), IN `TIPO_P` CHAR(1), IN `CANTIDAD_E` INT, IN `FOTO_P` VARCHAR(200), IN `PAIS` VARCHAR(50))  INSERT INTO producto (NOM_P, PRECIO, DESCRIPCION, TIPO_P, CANTIDAD_E, FOTO_P, PAIS)VALUES (NOM_P, PRECIO, DESCRIPCION, TIPO_P, CANTIDAD_E, FOTO_P, PAIS)$$

DROP PROCEDURE IF EXISTS `ING_USUARIO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ING_USUARIO` (IN `EMAIL` VARCHAR(50), IN `CONTRASENA` VARCHAR(20), IN `NOM_U` VARCHAR(20), IN `AP_P` VARCHAR(20), IN `AP_M` VARCHAR(20), IN `SEXO` CHAR(1), IN `EDAD` INT, IN `FOTO` VARCHAR(200), IN `SOBRENOMBRE` VARCHAR(30))  INSERT INTO usuario (EMAIL, CONTRASENA, NOM_U, AP_P, AP_M, SEXO, EDAD, FOTO,SOBRENOMBRE) VALUES (EMAIL, CONTRASENA, NOM_U, AP_P, AP_M, SEXO, EDAD, FOTO,SOBRENOMBRE)$$

DROP PROCEDURE IF EXISTS `LOGIN`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGIN` (IN `EMAIL` VARCHAR(50), IN `CONTRASENA` VARCHAR(20))  SELECT ID_U, SOBRENOMBRE FROM usuario U WHERE U.EMAIL = EMAIL AND U.CONTRASENA = CONTRASENA$$

DROP PROCEDURE IF EXISTS `VER_CARRITO`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `VER_CARRITO` (IN `ID_U1` INT)  SELECT C.ID_C, P.FOTO_P, P.NOM_P, P.PRECIO, C.CANTIDAD FROM carrito C INNER JOIN producto P ON C.ID_P1 = P.ID_P WHERE C.ID_U1 = ID_U1$$

DROP PROCEDURE IF EXISTS `VER_PRODUCTOS`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `VER_PRODUCTOS` ()  SELECT * FROM PRODUCTO$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

DROP TABLE IF EXISTS `carrito`;
CREATE TABLE `carrito` (
  `ID_C` int(11) NOT NULL,
  `ID_U1` int(11) NOT NULL,
  `ID_P1` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `TOT_C` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`ID_C`, `ID_U1`, `ID_P1`, `CANTIDAD`, `TOT_C`) VALUES
(5, 1, 1, 1, 0),
(6, 2, 2, 2, 0),
(7, 1, 3, 1, NULL),
(8, 2, 82, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
CREATE TABLE `domicilio` (
  `ID_DO` int(11) NOT NULL,
  `ID_U2` int(11) NOT NULL,
  `CALLE` varchar(150) NOT NULL,
  `N_EXT` int(11) NOT NULL,
  `N_INT` int(11) NOT NULL,
  `COLONIA` varchar(50) NOT NULL,
  `CIUDAD` varchar(50) NOT NULL,
  `CP` int(11) NOT NULL,
  `PAIS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`ID_DO`, `ID_U2`, `CALLE`, `N_EXT`, `N_INT`, `COLONIA`, `CIUDAD`, `CP`, `PAIS`) VALUES
(1, 1, 'FRANSISCO JAVIER MINA', 11, 27, 'NUEVA ARAGON', 'CDMX', 55260, 'MEXICO'),
(2, 1, 'AV.ACERO', 25, 2, 'MÉXICO PREHISPANICO', 'MÉXICO', 55890, 'MÉXICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE `orden` (
  `ID_O` int(11) NOT NULL,
  `ID_U3` int(11) NOT NULL,
  `ID_PAGO1` int(11) NOT NULL,
  `ID_DO1` int(11) NOT NULL,
  `TOTAL` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`ID_O`, `ID_U3`, `ID_PAGO1`, `ID_DO1`, `TOTAL`) VALUES
(1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordendetalle`
--

DROP TABLE IF EXISTS `ordendetalle`;
CREATE TABLE `ordendetalle` (
  `ID_OD` int(11) NOT NULL,
  `ID_O1` int(11) NOT NULL,
  `ID_P2` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIO` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ordendetalle`
--

INSERT INTO `ordendetalle` (`ID_OD`, `ID_O1`, `ID_P2`, `CANTIDAD`, `PRECIO`) VALUES
(1, 1, 1, 2, 120.98),
(2, 1, 1, 4, 25.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `ID_P` int(11) NOT NULL,
  `NOM_P` varchar(50) NOT NULL,
  `PRECIO` float NOT NULL,
  `DESCRIPCION` varchar(300) DEFAULT NULL,
  `TIPO_P` char(1) DEFAULT NULL,
  `CANTIDAD_E` int(11) DEFAULT NULL,
  `FOTO_P` varchar(200) DEFAULT NULL,
  `PAIS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_P`, `NOM_P`, `PRECIO`, `DESCRIPCION`, `TIPO_P`, `CANTIDAD_E`, `FOTO_P`, `PAIS`) VALUES
(1, 'Florero Artesanal', 50, 'Florero artesanal de origen Méxicano en dos diferentes colores.\nMaterial:\n  *Porcelana.\n  *Yeso\nMedidas:\n  *Altura ---->  35 cm\n  *Ancho --->  15 cm', 'A', 100, 'assets/Image/Productos/1-Mx.jpeg', 'México'),
(2, 'Platos Artesanales', 30, 'Platos Artesanales hechos de porcelana realizados por manos mexicanas.\nElaborados con técnicas y materiales 100% mexicanos.', 'A', 24, 'assets/Image/Productos/2-Mx.jpeg', 'México'),
(3, 'Calaveras ', 200, 'Calavera de porcelana o yeso decoradas con ropa tradicional para decoración de día de muertos.', 'A', 50, 'assets/Image/Productos/3-Mx.jpeg', 'México'),
(4, 'Muñequitas mexicanas', 50, 'Pequeñas muñequitas de trapo con estilo mexicano representadas de una vestimenta muy regional y tradicional.', 'A', 100, 'assets/Image/Productos/4-Mx.jpeg', 'México'),
(5, 'Alebrije', 1000, 'Figura típica mexicana o mas conocida como "Alebrijes".\nMaterial de yeso o incluso hasta de periódico pintados de colores diversos y con figuras completamente diferentes.', 'A', 30, 'assets/Image/Productos/5-Mx.jpeg', 'México'),
(6, 'Juguetes', 40, 'Típicos juguetes mexicanos hechos de madera con colores básicos yen diferentes tamaños.\nTrompo --> Con punta de metal.\nYoyo ------> Hecho de madera con un hilo grueso.\nBalero --->  Accesorio de madera con hilo resistente.             ', 'A', 200, 'assets/Image/Productos/6-Mx.jpeg', 'México'),
(7, 'Chaqueta de cuero', 100, 'Prenda Regional del Estado de México, para ser exactos del estado de tamaulipas.\r\n\r\nChaqueta echa de cuero con colores típicos de la region.\r\nSolo tallas M y G.', 'A', 100, 'assets/Image/Productos/7-Mx.jpeg', 'México'),
(8, 'Jarrón', 500, 'Jarrón Artesanal hecho a mano en el Estado de México.\r\n\r\nArtesania elaborada con barro y finamentre tratada con una decoración sutil.', 'A', 18, 'assets/Image/Productos/8-Mx.jpeg', 'México'),
(9, 'Calaveras (cráneos)', 150, 'Cráneos echo de yeso con un diseño unico de mexico asemejante a los alebrijes.  Común mente ocupados para las festividades de dia de muertos como son las ofrendas o altares.', 'A', 58, 'assets/Image/Productos/9-Mx.jpeg', 'México'),
(10, 'Guitarras', 800, 'Instrumento artesanal echo con acabados típicos de diferentes regiones o diferentes estilos.', 'A', 60, 'assets/Image/Productos/10-Mx.jpeg', 'México'),
(11, 'Atrapa sueños', 300, 'Utensilio creado con madera e hilo haciendo un enredado llamativo con capacidad de atraer los sueños malignos o pesadillas.', 'A', 3, 'assets/Image/Productos/1-EU.jpeg', 'E.E.U.U'),
(12, 'Esferas navideñas', 70, 'Esferas navideñas echas con papel mache e hilo galvanizado, con un diseño estadounidense.', 'A', 60, 'assets/Image/Productos/2-EU.jpg', 'E.E.U.U'),
(13, 'Tarro Cervecero', 150, 'Tarro para cualquier tipo de cerveza. ', 'A', 100, 'assets/Image/Productos/3-EU.jpg', 'E.E.U.U'),
(14, 'Tenis hechos a mano', 2000, 'Articulo derivado de un conjunto de técnicas manuales confeccionando un par de hermosos tenis.\nsolo tallas 24 y  25', 'A', 3, 'assets/Image/Productos/4-EU.jpg', 'E.E.U.U'),
(15, 'Marco de New York', 800, 'Marco decorativo de la ciudad de New York echo de madera.', 'A', 2, 'assets/Image/Productos/5-EU.jpg', 'E.E.U.U'),
(16, 'Almohada', 200, 'Almohada de tela y relleno de algodón para decoración de cama, o sala.', 'A', 10, 'assets/Image/Productos/6-EU.jpg', 'E.E.U.U'),
(17, 'Colchoneta para alfileres', 20, 'Colchoneta para alfileres con forma de corazón y colores de la bandera de Estados Unidos.', 'A', 60, 'assets/Image/Productos/7-eu.jpg', 'E.E.U.U'),
(18, 'Calzados', 800, 'Gran variedad de calzados echo de piel y telas agradables con el contacto de la piel.', 'A', 20, 'assets/Image/Productos/8-EU.jpeg', 'E.E.U.U'),
(19, 'Manopla', 50, 'Manopla de cocina tejida a crochet con diseño de hongos.', 'A', 19, 'assets/Image/Productos/9-EU.jpg', 'E.E.U.U'),
(20, 'Pintura', 1500, 'Pintura artesanal basado en las alas de las mariposas color azul y gris dando una hermosa flor.', 'A', 1, 'assets/Image/Productos/10-EU.jpg', 'E.E.U.U'),
(21, 'Estatuilla de elefante', 1200, 'Estatua de porcelana representante de deidad de elefante.', 'A', 10, 'assets/Image/Productos/1-CH.jpeg', 'China'),
(22, 'Dragón Ancestral', 3000, 'Dragón Artesanal de cemento ligero para festejos del año del dragón', 'A', 2, 'assets/Image/Productos/2-CH.jpeg', 'China'),
(23, 'Jarrón', 300000, 'Restauración de jarrón de porcela de aproximadamente de tiempos de la era Mei.', 'A', 2, 'assets/Image/Productos/3-CH.jpeg', 'China'),
(24, 'Cordero', 1500, 'Figura artesanal de yeso en forma de cordero para festividades.', 'A', 2, 'assets/Image/Productos/4-CH.jpeg', 'China'),
(25, 'Sombrillas', 199, 'Sombrillas ceremoniales o de decoración echas de papel mache o tela.', 'A', 500, 'assets/Image/Productos/5-CH.jpeg', 'China'),
(26, 'Humero', 600, 'Vasilla de hierro para inciensos ceremoniales.', 'A', 10, 'assets/Image/Productos/6-CH.jpeg', 'China'),
(27, 'Abanicos', 159.99, 'Abanicos decorativos de un material de papel o tela en colores festivos de año nuevo chino.', 'A', 1000, 'assets/Image/Productos/7-CH.jpeg', 'China'),
(28, 'Jarra decorativa', 20000, 'Jarra decorativa echa de barro con acabados color azul y blanco basado en una replica exacta de la dinastía xion mei', 'A', 2, 'assets/Image/Productos/8-CH.jpeg', 'China'),
(29, 'Pintura Decorativa', 398.99, 'Pintura decorativa hecha en tela yute y pinturas naturales echas con pigmentos  específicos para elaborar esta obra de arte.', 'A', 2, 'assets/Image/Productos/9-CH.jpeg', 'China'),
(30, 'Jarrón de dragón', 2300, 'Jarrón  en forma de dragón con índole de decoración. ', 'A', 3, 'assets/Image/Productos/3-j.jpeg', 'China'),
(31, 'Vasos de madera', 1500, 'Juego de 5 vasos hecho de madera para celebraciones.\nProducto de cocina normalmente ocupado en la vida diaria o en celebraciones.', 'A', 9, 'assets/Image/Productos/1-j.jpeg', 'Japon'),
(32, 'Geisha - Muñecas', 500, 'Pequeñas muñequitas de porcelana representando la tan característica apariencia de las sirvientas japonesas tradicionales(Geishas).', 'A', 5, 'assets/Image/Productos/2-j.jpeg', 'Japon'),
(33, 'Figura de Buda', 150, 'Figura de material de yeso de dios buda. ', 'A', 5, 'assets/Image/Productos/10-CH.jpeg', 'Japon'),
(34, 'Mascaras japonesas', 200, 'Mascaras normalmente hechas con papel o cerámica usadas para festividades japonesas.\nTenemos mascaras  Oni, Kitsune, Hyottoko y Okame.\nContamos con diferentes modelos y tamaños.\n!!! Favor de preguntar por modelos ¡¡¡', 'A', 30, 'assets/Image/Productos/4-j.jpeg', 'Japon'),
(35, 'Aretes', 200, 'Hermosos aretes en forma de flor de loto elaborados con hilo de hierro galvanizado color oro.\nSon ligeros y muy elegantes, casi para cualquier ocasión.', 'A', 7, 'assets/Image/Productos/5-j.jpeg', 'Japon'),
(36, 'Bonitas cabezas japonesas de papel-Maché', 100, 'Cabezas japonesas de papel-Maché con diseño de los años 80 en diferentes tamaños y colores.\nCabezas decorativas para festivales.', 'A', 50, 'assets/Image/Productos/6-j.jpeg', 'Japon'),
(37, 'Abanico', 30, 'Abanico Japonés elaborado con telas y papeles para casi cualquier ocasión o simple decoración.', 'A', 30, 'assets/Image/Productos/7-j.jpeg', 'Japon'),
(38, 'Carteras y estuches', 180.99, 'Estuches y carteras hechos de materiales reciclados.\nDiferentes  tamaños para diversos gustos.', 'A', 200, 'assets/Image/Productos/8-j.jpeg', 'Japon'),
(39, 'Figura TOTORO', 500, 'Figura "totoro" de la película mi "vecino totoro" tallada en madera a escala.', 'A', 2, 'assets/Image/Productos/9-j.jpeg', 'Japon'),
(40, 'Papiroflexia Japonés', 50, 'Papiroflexia estilo japonés con forma de  muñeca con un vestido "Kimono"', 'A', 65, 'assets/Image/Productos/10-j.jpeg', 'Japon'),
(41, 'Palacios de colección', 10000, 'Palacios de porcelana finamente refinados a escala de la plaza roja.\nArtículos de edición especial, siendo así elementos de colección.', 'A', 1, 'assets/Image/Productos/1-RS.jpeg', 'Rusia'),
(42, 'Muñecas matrioska', 1000, 'Muñequitas Matrioska.\nContiene hasta 8 muñecas una adentro de la otra.', 'A', 5, 'assets/Image/Productos/3-RS.jpeg', 'Rusia'),
(43, 'Valalaika', 300, 'Instrumento Ruso parecido a la  (instrumento de cuerdas)', 'A', 28, 'assets/Image/Productos/4-RS.jpeg', 'Rusia'),
(44, 'Copa Artesanal', 259.99, 'Copa con acabados de gemas y color estilo oro.', 'A', 2, 'assets/Image/Productos/5-RS.jpeg', 'Rusia'),
(45, 'Vodka', 26000, 'Bebida alcohólica tradicional de Rusia.\nArticulo preservado en una botella transparente.\n!!!! Preguntar dudas si son necesarias ¡¡¡¡', 'A', 2, 'assets/Image/Productos/6-RS.jpg', 'Rusia'),
(46, 'Gorro Ushanka', 600, 'Gorro Ushanka, gorro típico de Rusia por su ambiente  nevado.\nArticulo echo a mano.\nDiversos tamaños favor de mandar mensaje para mas información.', 'A', 20, 'assets/Image/Productos/7-RS.jpg', 'Rusia'),
(47, 'Los Válenki', 250, 'Los válenki son botas regionales de Rusia para el ambiente en el que se encuentras.\nArtículos tejidos a mano.\nTenemos tallas desde ch, M, G.', 'A', 50, 'assets/Image/Productos/8-RS.jpg', 'Rusia'),
(48, 'Collares Hermosos', 360, 'Collar, Aretes, y pulsera  de este tipo de piedras.\nPerfectas como regalo especial a ese ser querido.', 'A', 5, 'assets/Image/Productos/9-RS.jpg', 'Rusia'),
(49, 'Tela Artesanal de algodón', 100, 'Tela hecha de hilo de algodón en diversos tonos de colores clásicos.\nPara mas información mandar mensajes...', 'A', 6, 'assets/Image/Productos/10.2-j.jpg', 'Rusia'),
(50, 'Conjunto de vasijas y cucharas', 689.99, 'Vasijas y cucharas echas de barro y técnicas Rusas para la elaboración y tratado de dichas artesanías.', 'A', 11, 'assets/Image/Productos/2-RS.jpeg', 'Rusia'),
(51, 'Mini Piñatas', 15, 'Pequeñas piñatas con una figura similar a la de caballos echas de papel mache, sirven como decoración.', 'M', 25, 'assets/Image/Productos/1MA-mx.jpeg', 'México'),
(52, 'Latas decorativas ', 10, 'Latas de aluminio reciclado con diseños estampados (básicos y en papel ecológico) que pueden tener diversos usos como maseta o porta lápices.', 'M', 30, 'assets/Image/Productos/2MA-mx.jpeg', 'México'),
(53, 'Cactus Decorativos', 15.95, 'Pequeños cactus con diseños lindos ', 'M', 45, 'assets/Image/Productos/3MA-mx.jpeg', 'México'),
(54, 'Tamborin', 15.99, 'Pequeño tamborín de juguete para entretener a los niños.', 'M', 25, 'assets/Image/Productos/4MA-mx.jpeg', 'México'),
(55, 'Serpientes juguetonas', 10, 'Serpientes de juguetes echas con materiales reciclados para decorar o simplemente divertirse con los niños. Son muy divertidas y fáciles de hacer', 'M', 30, 'assets/Image/Productos/5MA-mx.jpeg', 'México'),
(56, 'Persianas Calavera', 30, 'Persianas decorativas para cortineros y ventanas con un tema de día de muertos, esta echo de materiales amigables con el medio ambiente y de fácil limpieza.', 'M', 6, 'assets/Image/Productos/6MA-mx.jpeg', 'México'),
(57, 'Esqueleto divertido', 13.5, 'Divertido esqueleto echo con isotopos (cotonetes) en posición divertida, sirve como decoración o un cuadro divertido para la festividad de día de muertos.', 'M', 2, 'assets/Image/Productos/7MA-mx.jpeg', 'México'),
(58, 'Payaso', 30, 'Payaso dibujado y decorado de materiales amigables con el medio ambiente, normalmente ocupado para llamar la atención de los niños o simplemente diversión.', 'M', 3, 'assets/Image/Productos/8MA-mx.jpeg', 'México'),
(59, 'Animalitos', 70, 'Dibujos de animales decorado con piedras de mar u otros elementos llamativos para crear estas imágenes dentro de marcos (pueden ser animales específicos o variados.)', 'M', 2, 'assets/Image/Productos/9MA-mx.png', 'México'),
(60, 'Cuerpo Espin', 25, 'Pequeños muñecos Cuerpo Espín  elaborados con diversos materiales divertidos para coleccionar o mantener alegre la habitación', 'M', 17, 'assets/Image/Productos/10MA-mx.jpeg', 'México'),
(61, 'Totem', 26.99, 'Pequeños tótems de aprox. 1.5 mts hechos de cajas de cartón con bonitos diseños y animales', 'M', 4, 'assets/Image/Productos/1MA-eu.jpeg', 'E.E.U.U'),
(62, 'Mascara de Leon', 30, 'Divertida mascara de león echa con materiales sencillos de encontrar la idea es divertida y fantástica.', 'M', 5, 'assets/Image/Productos/2MA-eu.jpeg', 'E.E.U.U'),
(63, 'cajadrilo', 10.99, 'Divertida idea para entretener a los niños. \nUn cocodrilo echo de cajas de huevo.', 'M', 5, 'assets/Image/Productos/3MA-eu.jpeg', 'E.E.U.U'),
(64, 'kit de investigador', 15, 'Pequeño set de investigador ( observador) echo de cartón', 'M', 1, 'assets/Image/Productos/4MA-eu.jpeg', 'E.E.U.U'),
(65, 'Penacho', 10, 'Penacho al estilo indio, con divertidos  y llamativos colores.', 'M', 2, 'assets/Image/Productos/5MA-eu.jpeg', 'E.E.U.U'),
(66, 'ropa india', 25, 'Camisas  personalizadas de ropa india.', 'M', 10, 'assets/Image/Productos/6MA-eu.jpeg', 'E.E.U.U'),
(67, 'Lupas', 5, 'Lupas echas a mano con materiales reciclables. un bonito y divertido gesto para que los niños se entretengan viendo el mundo de diversos colores.', 'M', 30, 'assets/Image/Productos/7MA-eu.jpeg', 'E.E.U.U'),
(68, 'Brújula', 15, 'Brújulas echas con imagen se forma sencillas para tomarse como diversión y enseñarle a los niños la orientación.', 'M', 20, 'assets/Image/Productos/8MA-eu.jpeg', 'E.E.U.U'),
(69, 'Vasos payaso', 5, 'Vasos decorados de payasos perfectos para una fiesta.', 'M', 50, 'assets/Image/Productos/9MA-eu.jpeg', 'E.E.U.U'),
(70, 'Elefantitos tejidos', 30, 'Lindos elefantitos tejidos o cosidos con terciopelo o fieltro', 'M', 50, 'assets/Image/Productos/10MA-eu.jpeg', 'E.E.U.U'),
(71, 'Ranas saltarinas', 10, 'Variedad de ranitas saltarinas elaboradas con papel y la tan famosa técnica de origami. ', 'M', 70, 'assets/Image/Productos/1MA-ch.jpg', 'China'),
(72, 'Patron de dragon', 50, 'Lindo patrón para calcar en cualquier tela y recortar. Normalmente sirve para hacer con relleno de algún material y listo !!! un lindo dragón de peluche.', 'M', 70, 'assets/Image/Productos/2MA-ch.jpeg', 'China'),
(73, 'Separadores de hojas', 35.5, 'Lindos separadores de hojas con temática de  cactus, están hechos de pasta francesa para una mayor durabilidad', 'M', 22, 'assets/Image/Productos/3MA-ch.jpeg', 'China'),
(74, 'Dragon decorativo', 25, 'Divertido dragón echo con rollos de papel (cartón), divertido para decorar en fiestas los salones de clases de las primarias.', 'M', 3, 'assets/Image/Productos/4MA-ch.jpeg', 'China'),
(75, 'Campanas de viento', 26.99, 'Hermosas campanillas de viento listas para poner en frente de tu ventana o puerta.', 'M', 30, 'assets/Image/Productos/5MA-ch.jpeg', 'China'),
(76, 'Broche dama', 25, 'Hermosos broches de damas elegantes hechos de fieltro y tela.\nHay diversos modelos.', 'M', 60, 'assets/Image/Productos/6MA-ch.jpeg', 'China'),
(77, 'Kimono-origami', 7, 'Hermoso detalle ceremonial sirve como decorativo para algún tipo de tarjeta u otro elemento.', 'M', 19, 'assets/Image/Productos/7MA-ch.jpeg', 'China'),
(78, 'Tarjetas', 15, 'Divertidas tarjetas con forma de maletas, listas para enviar tus mejores palaras en busca de sus respuestas con aquella persona que tanto quieres.', 'M', 64, 'assets/Image/Productos/8MA-ch.jpeg', 'China'),
(79, 'Maleta - Caja', 120, 'Caja grande echa para servir como cosmetiquera, echa de cartón grueso y diseño de maleta, un detalle bonito para acomodar todos tus cosméticos y productos de belleza.', 'M', 5, 'assets/Image/Productos/9MA-ch.jpeg', 'China'),
(80, 'Lamparas decorativas', 14, 'Adornos hermosos para festivales y festejos de ocasión. Presentación linda y colores ceremoniales.', 'M', 80, 'assets/Image/Productos/10MA-ch.jpeg', 'China'),
(81, 'Rosas', 60, 'Ramos de rosas echas de papel mache. Cuentan con detalles lindos.', 'M', 100, 'assets/Image/Productos/1MA-jp.jpeg', 'Japon'),
(82, 'Esferas TEMARI', 80, 'Juguete tradicional, esfera temari cuenta con diversos patrones y colores tanto ceremoniales como ocasionales aunque también temeos personalizadas..', 'M', 5, 'assets/Image/Productos/2MA-jp.jpeg', 'Japon'),
(83, 'Sobres', 6, 'Divertidos sobres decorados con diversas temáticas y/o personajes hechos de papiroflexia u origami.', 'M', 61, 'assets/Image/Productos/3MA-jp.jpeg', 'Japon'),
(84, 'Esfera de pétalos', 60, 'Hermosas esferas de pétalos de papel normal o diversos materiales pueden hacer la diferencia entre lo ordinario a lo espectacular en tu cuarto.', 'M', 10, 'assets/Image/Productos/4MA-jp.jpeg', 'Japon'),
(85, 'Masetas de papel', 15, 'Llamativas masetas con cactus diversos, un detalle hermoso y colorido para la oficina o área de trabajo.', 'M', 78, 'assets/Image/Productos/5MA-jp.jpeg', 'Japon'),
(86, 'Muñecas', 200, 'Hermosas muñecas de trapo o incluso tejidas con diseños  detallistas.', 'M', 5, 'assets/Image/Productos/6MA-jp.jpeg', 'Japon'),
(87, 'Bordados naturales', 300, 'Bordados con colores y formas de la naturaleza como árboles, flores y algunos animales, plasmados en telas diversas.', 'M', 20, 'assets/Image/Productos/7MA-jp.jpeg', 'Japon'),
(88, 'Bonsáis ', 350.99, 'Variedad de pequeños árboles bonsáis con una gran visión en colores y formas.', 'M', 27, 'assets/Image/Productos/8MA-jp.jpeg', 'Japon'),
(89, 'Carpas de cartón', 10, 'Divertido set de carpas para pescar con una caña.', 'M', 5, 'assets/Image/Productos/9MA-jp.jpeg', 'Japon'),
(90, 'Encuadernación básica', 25.5, 'Encuadernación básica a hojas de diversos tamaños', 'M', 36, 'assets/Image/Productos/10MA-jp.jpeg', 'Japon'),
(91, 'Muñequitas - Foamy', 99, 'Diversidad de muñequitos y animales hechos con Foamy ', 'M', 76, 'assets/Image/Productos/1MA-rs.jpeg', 'Rusia'),
(92, 'Frascos decorativos', 30, 'Hermosos frascos de vidrio decorados con diferentes formas y figuras listos para contener tus dulces o especies favoritas.', 'M', 70, 'assets/Image/Productos/2MA-rs.jpeg', 'Rusia'),
(93, 'Ángeles de cerámica', 300, 'Bonito detalle de un ángel hecho con materiales de cerámica o pasta francesa, cuenta con detalles maravillosos y lindas palabras dedicadas a la persona que desees,', 'M', 18, 'assets/Image/Productos/3MA-rs.jpeg', 'Rusia'),
(94, 'Letras filigrana', 250, 'Impresionante iniciales o palabras decoradas con la técnica de filigrana producto de una imaginación innovadora.', 'M', 30, 'assets/Image/Productos/4MA-rs.jpeg', 'Rusia'),
(95, 'Cajitas de madera ', 230, 'Cajas de madera delgada, un detalle increíble para apantallar a esa persona especial con el regalos de tu preferencia en su interior.', 'M', 60, 'assets/Image/Productos/5MA-rs.jpeg', 'Rusia'),
(96, 'Peluches Pez', 25.59, 'Divertidos peluches con forma de peces perfectos para adornar las camas.', 'M', 69, 'assets/Image/Productos/6MA-rs.jpeg', 'Rusia'),
(97, 'Marco de reciclados', 28, 'Lindos cuadros con imágenes o paisajes elaborados con materiales reciclados.', 'M', 6, 'assets/Image/Productos/7MA-rs.jpeg', 'Rusia'),
(98, 'Ratones para agujas. ', 25, 'Divertidos peluches con forma de ratones listos para almacenas o pinchar con tus agujas para tejer ', 'M', 29, 'assets/Image/Productos/8MA-rs.jpeg', 'Rusia'),
(99, 'Bolsos innovadores', 40, 'Bolsos básicos o bolsas con materiales completamente renovables y ecológicos claro que con un diseño amigable y funcional.', 'M', 50, 'assets/Image/Productos/9MA-rs.jpeg', 'Rusia'),
(100, 'Collares Matrioskas', 75, 'Collares lindos y graciosos con una muñequita típica de Rusia llamada Matrioska', 'M', 100, 'assets/Image/Productos/10MA-rs.jpeg', 'Rusia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpago`
--

DROP TABLE IF EXISTS `tpago`;
CREATE TABLE `tpago` (
  `ID_PAGO` int(11) NOT NULL,
  `NOM_PAGO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tpago`
--

INSERT INTO `tpago` (`ID_PAGO`, `NOM_PAGO`) VALUES
(1, 'T-CREDITO'),
(2, 'T-DEBITO'),
(3, 'TRANSFERENCIA_B'),
(4, 'EFECTIVO'),
(5, 'PAYPAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID_U` int(11) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `CONTRASENA` varchar(20) NOT NULL,
  `NOM_U` varchar(20) NOT NULL,
  `AP_P` varchar(20) NOT NULL,
  `AP_M` varchar(20) NOT NULL,
  `SEXO` char(1) NOT NULL,
  `EDAD` int(11) NOT NULL,
  `FOTO` varchar(200) NOT NULL,
  `SOBRENOMBRE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_U`, `EMAIL`, `CONTRASENA`, `NOM_U`, `AP_P`, `AP_M`, `SEXO`, `EDAD`, `FOTO`, `SOBRENOMBRE`) VALUES
(1, 'RIC_PS@HOTMAIL.COM', '123456789', 'RIC', 'PE', 'SALD', 'H', 21, 'FOTO1', 'RICKO'),
(2, 'RICO@HOTMAIL.COM', '017616331', 'ROSA', 'SALDIVAR', 'LOPEZ', 'M', 45, 'FOTO1', 'MAMA'),
(3, 'prueba1', '123', 'prueba', 'prueba', 'prueba,', 'H', 22, 'assets/Image/Usuarios/', 'prueba1'),
(4, 'prueba2', '258', 'prueba', 'prueba', 'prueba,', 'H', 22, 'assets/Image/Usuarios/2MA-eu.jpeg', 'prueba2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`ID_C`),
  ADD KEY `FK_US` (`ID_U1`),
  ADD KEY `FK_P` (`ID_P1`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`ID_DO`),
  ADD KEY `FK_USU` (`ID_U2`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`ID_O`),
  ADD KEY `FK_U3` (`ID_U3`),
  ADD KEY `FT_PAG1` (`ID_PAGO1`),
  ADD KEY `FK_DO` (`ID_DO1`);

--
-- Indices de la tabla `ordendetalle`
--
ALTER TABLE `ordendetalle`
  ADD PRIMARY KEY (`ID_OD`),
  ADD KEY `FK_O1` (`ID_O1`),
  ADD KEY `FK_P2` (`ID_P2`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_P`);

--
-- Indices de la tabla `tpago`
--
ALTER TABLE `tpago`
  ADD PRIMARY KEY (`ID_PAGO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_U`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `ID_C` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `ID_DO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `ID_O` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ordendetalle`
--
ALTER TABLE `ordendetalle`
  MODIFY `ID_OD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_P` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_U` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FK_P` FOREIGN KEY (`ID_P1`) REFERENCES `producto` (`ID_P`),
  ADD CONSTRAINT `FK_US` FOREIGN KEY (`ID_U1`) REFERENCES `usuario` (`ID_U`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `FK_USU` FOREIGN KEY (`ID_U2`) REFERENCES `usuario` (`ID_U`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `FK_DO` FOREIGN KEY (`ID_DO1`) REFERENCES `domicilio` (`ID_DO`),
  ADD CONSTRAINT `FK_U3` FOREIGN KEY (`ID_U3`) REFERENCES `usuario` (`ID_U`),
  ADD CONSTRAINT `FT_PAG1` FOREIGN KEY (`ID_PAGO1`) REFERENCES `tpago` (`ID_PAGO`);

--
-- Filtros para la tabla `ordendetalle`
--
ALTER TABLE `ordendetalle`
  ADD CONSTRAINT `FK_O1` FOREIGN KEY (`ID_O1`) REFERENCES `orden` (`ID_O`),
  ADD CONSTRAINT `FK_P2` FOREIGN KEY (`ID_P2`) REFERENCES `producto` (`ID_P`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
