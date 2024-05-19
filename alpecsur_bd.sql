-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2024 a las 06:45:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alpecsur_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipoDocumento` varchar(100) DEFAULT NULL,
  `numDocumento` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `idUsuario`, `nombre`, `tipoDocumento`, `numDocumento`, `direccion`, `telefono`, `email`, `estado`) VALUES
(1, 3, 'Daniel Paredes', 'DNI', '12345678', 'Av. Los Pinos 123', '987654341', 'danielparedes@gmail.com', 'activo'),
(2, 7, 'Fernanda Castillo', 'DNI', '23456789', 'Calle Las Flores 456', '987654342', 'fernandacastillo@outlook.com', 'activo'),
(3, 11, 'Renato Huamán', 'DNI', '34567890', 'Jr. Los Cedros 789', '987654343', 'renatohuaman@hotmail.com', 'activo'),
(4, 15, 'Carmen Díaz', 'DNI', '45678901', 'Av. Las Palmeras 234', '987654344', 'carmendiaz@gmail.com', 'activo'),
(5, 19, 'Héctor Cáceres', 'DNI', '56789012', 'Calle Los Sauces 567', '987654345', 'hectorcaceres@outlook.com', 'activo'),
(6, 23, 'Valeria Flores', 'DNI', '67890123', 'Jr. Las Orquídeas 890', '987654346', 'valeriaflores@hotmail.com', 'activo'),
(7, 27, 'Ricardo Torres', 'DNI', '78901234', 'Av. Los Pinos 123', '987654347', 'ricardotorres@gmail.com', 'activo'),
(8, 31, 'Camila Salazar', 'DNI', '89012345', 'Calle Las Flores 456', '987654348', 'camilasalazar@outlook.com', 'activo'),
(9, 35, 'Eduardo Montes', 'DNI', '90123456', 'Jr. Los Cedros 789', '987654349', 'eduardomontes@hotmail.com', 'activo'),
(10, 39, 'Patricia Ortega', 'DNI', '01234567', 'Av. Las Palmeras 234', '987654350', 'patriciaortega@gmail.com', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`, `descripcion`) VALUES
(1, 'Papas fritas', 'Rodajas de papa fritas en aceite, conocidas por su textura crujiente y una variedad de sabores.'),
(2, 'Snacks mixtos', 'Combinación de diferentes tipos de snacks, que pueden incluir papas fritas, nachos, pretzels, y más, ideales para compartir.'),
(3, 'Nachos', 'Triángulos de tortilla de maíz frita, generalmente sazonados con sabores como queso, picante o chili, y frecuentemente acompañados de dips.'),
(4, 'Tostadas', 'Rodajas de tortilla de maíz frita o tostada, perfectas para acompañar con salsas, guacamole o frijoles.'),
(5, 'Snacks de maíz', 'Variedad de snacks hechos a base de maíz, que pueden incluir bolitas, palitos, o formas onduladas, en sabores como queso y picante.'),
(6, 'Snacks de vegetales', 'Chips hechos de vegetales como camote, zanahoria o kale, ofreciendo una opción más saludable y natural.'),
(7, 'Snacks de legumbres', 'Snacks crujientes hechos de legumbres como habas o garbanzos, frecuentemente tostados y sazonados.'),
(8, 'Snacks de maní', 'Maní tostado, salado, o cubierto con diferentes sabores como picante o dulce, ofreciendo una opción nutritiva y energética.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipoDocumento` varchar(100) DEFAULT NULL,
  `numDocumento` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idUsuario`, `nombre`, `tipoDocumento`, `numDocumento`, `direccion`, `telefono`, `email`) VALUES
(1, 1, 'Juan Pérez', 'DNI', '12345678', 'Av. Los Pinos 123', '987654321', 'juanperez@gmail.com'),
(2, 5, 'María Rodríguez', 'DNI', '23456789', 'Calle Las Flores 456', '987654322', 'mariarodriguez@outlook.com'),
(3, 9, 'Luis Gonzales', 'DNI', '34567890', 'Jr. Los Cedros 789', '987654323', 'luisgonzales@hotmail.com'),
(4, 13, 'Ana Torres', 'DNI', '45678901', 'Av. Las Palmeras 234', '987654324', 'anatorres@gmail.com'),
(5, 17, 'Pedro García', 'DNI', '56789012', 'Calle Los Sauces 567', '987654325', 'pedrogarcia@outlook.com'),
(6, 21, 'Rosa López', 'DNI', '67890123', 'Jr. Las Orquídeas 890', '987654326', 'rosalopez@hotmail.com'),
(7, 25, 'Carlos Ramírez', 'DNI', '78901234', 'Av. Los Pinos 123', '987654327', 'carlosramirez@gmail.com'),
(8, 29, 'Laura Sánchez', 'DNI', '89012345', 'Calle Las Flores 456', '987654328', 'laurasanchez@outlook.com'),
(9, 33, 'Diego Martínez', 'DNI', '90123456', 'Jr. Los Cedros 789', '987654329', 'diegomartinez@hotmail.com'),
(10, 37, 'Sofía Pérez', 'DNI', '01234567', 'Av. Las Palmeras 234', '987654330', 'sofiaperez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledevolucion`
--

CREATE TABLE `detalledevolucion` (
  `idDetalleDevolucion` int(11) NOT NULL,
  `idDevolucion` int(11) DEFAULT NULL,
  `idDetalleIngreso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleingreso`
--

CREATE TABLE `detalleingreso` (
  `idDetalleIngreso` int(11) NOT NULL,
  `idIngreso` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `stockActual` int(11) DEFAULT NULL,
  `precio` decimal(10,5) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `idPedido` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipoDocumento` varchar(100) DEFAULT NULL,
  `numDocumento` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `idUsuario`, `nombre`, `tipoDocumento`, `numDocumento`, `direccion`, `telefono`, `email`, `estado`) VALUES
(1, 2, 'Jorge Chávez', 'DNI', '12345678', 'Av. Los Pinos 123', '987654331', 'jorgechavez@gmail.com', 'activo'),
(2, 6, 'Gloria Flores', 'DNI', '23456789', 'Calle Las Flores 456', '987654332', 'gloriaflores@outlook.com', 'activo'),
(3, 10, 'Miguel Herrera', 'DNI', '34567890', 'Jr. Los Cedros 789', '987654333', 'miguelherrera@hotmail.com', 'activo'),
(4, 14, 'Karina Gómez', 'DNI', '45678901', 'Av. Las Palmeras 234', '987654334', 'karinagomez@gmail.com', 'activo'),
(5, 18, 'Martín Ruiz', 'DNI', '56789012', 'Calle Los Sauces 567', '987654335', 'martinruiz@outlook.com', 'activo'),
(6, 22, 'Lucía Vargas', 'DNI', '67890123', 'Jr. Las Orquídeas 890', '987654336', 'luciavargas@hotmail.com', 'activo'),
(7, 26, 'Alejandro Castro', 'DNI', '78901234', 'Av. Los Pinos 123', '987654337', 'alejandrocastro@gmail.com', 'activo'),
(8, 30, 'Patricia León', 'DNI', '89012345', 'Calle Las Flores 456', '987654338', 'patricialeon@outlook.com', 'activo'),
(9, 34, 'Roberto Soto', 'DNI', '90123456', 'Jr. Los Cedros 789', '987654339', 'robertosoto@hotmail.com', 'activo'),
(10, 38, 'Fabiola Ortega', 'DNI', '01234567', 'Av. Las Palmeras 234', '987654340', 'fabiolaortega@gmail.com', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedido`
--

CREATE TABLE `estadopedido` (
  `idEstadoPedido` int(11) NOT NULL,
  `nombreEstado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadopedido`
--

INSERT INTO `estadopedido` (`idEstadoPedido`, `nombreEstado`) VALUES
(1, 'En Proceso'),
(2, 'En Preparación'),
(3, 'En Ruta'),
(4, 'Entregado'),
(5, 'Cancelado'),
(6, 'Pendiente de Pago'),
(7, 'Completado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idIngreso` int(11) NOT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `tipoComprobante` varchar(100) DEFAULT NULL,
  `numComprobante` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `nombre`, `descripcion`) VALUES
(1, 'Lays', 'Papas fritas en una variedad de sabores y estilos, conocidas por su textura crujiente.'),
(2, 'Piqueo Snack', 'Mezcla de diferentes snacks salados en un solo paquete, ideal para compartir.'),
(3, 'Doritos', 'Nachos de maíz en sabores intensos como queso y picante, característicos por su forma triangular.'),
(4, 'Tostitos', 'Totopos de maíz, ideales para acompañar con salsas y dips.'),
(5, 'Cheez Tris', 'Snacks de maíz con un fuerte sabor a queso, conocidos por su forma ondulada.'),
(6, 'Chizitos', 'Snacks de maíz en forma de bolitas, con un sabor distintivo a queso.'),
(7, 'Tortees', 'Tortillas de maíz con sabores clásicos y picantes, perfectas para picar.'),
(8, 'NatuChips', 'Chips de vegetales como el camote, ofreciendo una opción más saludable y natural.'),
(9, 'Cheetos', 'Snacks de maíz en una variedad de sabores como queso y picante, con una textura crujiente o esponjosa.'),
(10, 'Cuates', 'Mezcla de diferentes snacks salados y picantes, ideales para compartir.'),
(11, 'Karinto', 'Chips de plátano y otros snacks basados en productos naturales, con opciones saladas y dulces.'),
(12, 'Habas Saladas', 'Habas tostadas y saladas, una opción crujiente y saludable para picar.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `tipoComprobante` varchar(100) DEFAULT NULL,
  `numComprobante` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,5) DEFAULT NULL,
  `idEstadoPedido` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,5) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idCategoria`, `idMarca`, `nombre`, `precio`, `stock`, `descripcion`, `imagen`, `estado`) VALUES
(51, 1, 1, 'LAYS CLASICAS 36G', 1.50000, 60, 'Papas fritas clásicas, tamaño pequeño', 'PRO0001.png', 'activo'),
(52, 1, 1, 'LAYS CLASICAS 70G', 2.50000, 60, 'Papas fritas clásicas, tamaño mediano', 'PRO0002.png', 'activo'),
(53, 1, 1, 'LAYS CLASICAS 150G', 6.50000, 60, 'Papas fritas clásicas, tamaño grande', 'PRO0003.png', 'activo'),
(54, 1, 1, 'LAYS ARTESANA SAL MARINA 135G', 6.50000, 60, 'Papas fritas estilo artesanal con sal marina, tamaño mediano', 'PRO0004.png', 'activo'),
(55, 1, 1, 'LAYS AL HILO 40G', 1.50000, 60, 'Papas fritas cortadas en hilos, tamaño pequeño', 'PRO0005.jpg', 'activo'),
(56, 1, 1, 'LAYS AL HILO 155G', 4.50000, 60, 'Papas fritas cortadas en hilos, tamaño grande', 'PRO0006.jpeg', 'activo'),
(57, 1, 1, 'LAYS POLLO A LA BRASA 34G', 1.50000, 60, 'Papas fritas sabor pollo a la brasa, tamaño pequeño', 'PRO0007.png', 'activo'),
(58, 2, 2, 'PIQUEO SNACK 55G', 1.66670, 60, 'Mezcla de snacks, tamaño pequeño', 'PRO0008.png', 'activo'),
(59, 2, 2, 'PIQUEO SNACK 105G', 2.91670, 60, 'Mezcla de snacks, tamaño mediano', 'PRO0009.png', 'activo'),
(60, 2, 2, 'PIQUEO SNACK 225G', 7.00000, 60, 'Mezcla de snacks, tamaño grande', 'PRO0010.png', 'activo'),
(61, 3, 3, 'DORITOS QUESO ATREVIDO 45G', 1.66670, 60, 'Nachos sabor queso atrevido, tamaño pequeño', 'PRO0011.png', 'activo'),
(62, 3, 3, 'DORITOS QUESO ATREVIDO 90G', 2.91670, 60, 'Nachos sabor queso atrevido, tamaño mediano', 'PRO0012.png', 'activo'),
(63, 3, 3, 'DORITOS FUEGO 45G', 1.66670, 60, 'Nachos sabor picante fuego, tamaño pequeño', 'PRO0013.jpg', 'activo'),
(64, 3, 3, 'DORITOS FUEGO 90G', 2.91670, 60, 'Nachos sabor picante fuego, tamaño mediano', 'PRO0014.jpg', 'activo'),
(65, 3, 3, 'DORITOS FLAMIN HOT 43G', 1.66670, 60, 'Nachos sabor Flamin Hot, tamaño pequeño', 'PRO0015.jpeg', 'activo'),
(66, 3, 3, 'DORITOS  210G', 7.00000, 60, 'Nachos sabor original, tamaño grande', 'PRO0016.jpeg', 'activo'),
(67, 4, 4, 'TOSTITOS 200 G', 7.00000, 60, 'Totopos de maíz, tamaño grande', 'PRO0017.png', 'activo'),
(68, 1, 1, 'LAYS ONDAS CLASICA 34G', 1.50000, 60, 'Papas fritas onduladas, tamaño pequeño', 'PRO0018.jpg', 'activo'),
(69, 1, 1, 'LAYS ONDAS PICANTE 34G', 1.50000, 60, 'Papas fritas onduladas sabor picante, tamaño pequeño', 'PRO0019.png', 'activo'),
(70, 1, 1, 'LAYS ONDAS PICANTE 140G', 6.50000, 60, 'Papas fritas onduladas sabor picante, tamaño grande', 'PRO0020.png', 'activo'),
(71, 5, 5, 'CHEESE TRIS QUESO 39G', 1.08330, 60, 'Snacks de maíz sabor queso, tamaño pequeño', 'PRO0021.png', 'activo'),
(72, 5, 5, 'CHEESE TRIS QUESO 105G', 2.50000, 60, 'Snacks de maíz sabor queso, tamaño mediano', 'PRO0022.jpg', 'activo'),
(73, 5, 6, 'CHIZITOS QUESO 35G', 0.83330, 60, 'Snacks de maíz sabor queso, tamaño pequeño', 'PRO0023.png', 'activo'),
(74, 5, 6, 'CHIZITOS QUESO 190G', 5.00000, 60, 'Snacks de maíz sabor queso, tamaño grande', 'PRO0024.png', 'activo'),
(75, 4, 7, 'TORTEES CLASICO 71G', 1.66670, 60, 'Tortillas de maíz sabor clásico, tamaño mediano', 'PRO0025.png', 'activo'),
(76, 4, 7, 'TORTEES CLASICO 138G', 2.91670, 60, 'Tortillas de maíz sabor clásico, tamaño grande', 'PRO0026.jpg', 'activo'),
(77, 4, 7, 'TORTEES PICANTE 71G', 1.66670, 60, 'Tortillas de maíz sabor picante, tamaño mediano', 'PRO0027.png', 'activo'),
(78, 4, 7, 'TORTEES PICANTE 138G', 2.91670, 60, 'Tortillas de maíz sabor picante, tamaño grande', 'PRO0028.png', 'activo'),
(79, 6, 8, 'NATUCHIPS CAMOTE 36G', 1.50000, 60, 'Chips de camote, tamaño pequeño', 'PRO0029.jpg', 'activo'),
(80, 6, 8, 'CHEETOS MEGA QUESO 34G', 1.08330, 60, 'Snacks de maíz sabor mega queso, tamaño pequeño', 'PRO0030.png', 'activo'),
(81, 5, 9, 'CHEETOS MEGA QUESO 90G', 2.50000, 60, 'Snacks de maíz sabor mega queso, tamaño mediano', 'PRO0032.png', 'activo'),
(82, 5, 9, 'CHEETOS PICANTE 90G', 2.50000, 60, 'Snacks de maíz sabor picante, tamaño mediano', 'PRO0033.png', 'activo'),
(83, 5, 9, 'CHEETOS MEGA QUESO 200G', 6.00000, 60, 'Snacks de maíz sabor mega queso, tamaño grande', 'PRO0034.png', 'activo'),
(84, 5, 9, 'CHEETOS PICANTE 180G', 6.00000, 60, 'Snacks de maíz sabor picante, tamaño grande', 'PRO0035.png', 'activo'),
(85, 5, 9, 'CHEETOS BOLIQUESO 30G', 1.08330, 60, 'Bolitas de maíz sabor queso, tamaño pequeño', 'PRO0036.png', 'activo'),
(86, 5, 9, 'CHEETOS HORNEADOS FLAMIN HOT 36G', 1.25000, 60, 'Snacks de maíz horneados sabor Flamin Hot, tamaño pequeño', 'PRO0037.png', 'activo'),
(87, 5, 10, 'CUATES SALADO 50G', 0.83330, 60, 'Mezcla de snacks salados, tamaño pequeño', 'PRO0038.png', 'activo'),
(88, 5, 10, 'CUATES PICANTE 50G', 0.83330, 60, 'Mezcla de snacks picantes, tamaño pequeño', 'PRO0039.png', 'activo'),
(89, 5, 10, 'CUATES RANCHERITOS DE 50G', 0.83330, 60, 'Mezcla de snacks tipo ranchero, tamaño pequeño', 'PRO0040.jpg', 'activo'),
(90, 5, 10, 'CUATES TWIST 45G', 0.83330, 60, 'Mezcla de snacks en forma de twist, tamaño pequeño', 'PRO0041.png', 'activo'),
(91, 5, 11, 'KARINTO CHIFLES 34G', 1.08330, 60, 'Chips de plátano, tamaño pequeño', 'PRO0042.png', 'activo'),
(92, 5, 11, 'KARINTO CHIFLES 150G', 4.50000, 60, 'Chips de plátano, tamaño grande', 'PRO0043.png', 'activo'),
(93, 7, 12, 'HABAS SALADAS 35G', 1.66670, 60, 'Habas saladas, tamaño pequeño', 'PRO0044.png', 'activo'),
(94, 8, 11, 'MANI ENGALLETADO PICANTE 35G', 1.25000, 60, 'Maní cubierto sabor picante, tamaño pequeño', 'PRO0045.png', 'activo'),
(95, 8, 11, 'MANI ENGALLETADO PICANTE 100G', 3.00000, 60, 'Maní cubierto sabor picante, tamaño mediano', 'PRO0046.png', 'activo'),
(96, 8, 11, 'MANI ENGALLETADO SALADO 35G', 1.25000, 60, 'Maní cubierto sabor salado, tamaño pequeño', 'PRO0047.png', 'activo'),
(97, 8, 11, 'MANI ENGALLETADO SALADO 100G', 3.00000, 60, 'Maní cubierto sabor salado, tamaño mediano', 'PRO0048.png', 'activo'),
(98, 8, 11, 'MANI CLASICO 35G', 1.25000, 60, 'Maní clásico, tamaño pequeño', 'PRO0049.jpg', 'activo'),
(99, 8, 11, 'MANI CLASICO 100G', 3.00000, 60, 'Maní clásico, tamaño mediano', 'PRO0050.png', 'activo'),
(100, 1, 1, 'LAYS FLAMIN HOT 34G', 1.50000, 60, 'Papas fritas sabor Flamin Hot, tamaño pequeño', 'PRO0051.jpg', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `tipoDocumento` varchar(100) DEFAULT NULL,
  `numDocumento` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `idUsuario`, `nombre`, `tipoDocumento`, `numDocumento`, `direccion`, `telefono`, `email`) VALUES
(1, 4, 'Juan Pérez S.A.C.', 'RUC', '12345678901', 'Av. Los Pinos 123', '987654351', 'juanperezsa@gmail.com'),
(2, 8, 'Inversiones Rodríguez E.I.R.L.', 'RUC', '23456789012', 'Calle Las Flores 456', '987654352', 'inversionesrodriguez@gmail.com'),
(3, 12, 'Gonzales Importaciones S.A.C.', 'RUC', '34567890123', 'Jr. Los Cedros 789', '987654353', 'gonzalesimportaciones@hotmail.com'),
(4, 16, 'Distribuidora Torres E.I.R.L.', 'RUC', '45678901234', 'Av. Las Palmeras 234', '987654354', 'distribuidoratorres@gmail.com'),
(5, 20, 'Comercial García S.A.C.', 'RUC', '56789012345', 'Calle Los Sauces 567', '987654355', 'comercialgarcia@hotmail.com'),
(6, 24, 'López Exportaciones E.I.R.L.', 'RUC', '67890123456', 'Jr. Las Orquídeas 890', '987654356', 'lopezexportaciones@gmail.com'),
(7, 28, 'Ramírez Trading S.A.C.', 'RUC', '78901234567', 'Av. Los Pinos 123', '987654357', 'ramireztrading@outlook.com'),
(8, 32, 'Sánchez Distribuciones E.I.R.L.', 'RUC', '89012345678', 'Calle Las Flores 456', '987654358', 'sanchezdistribuciones@gmail.com'),
(9, 36, 'Martínez Comercializadora S.A.C.', 'RUC', '90123456789', 'Jr. Los Cedros 789', '987654359', 'martinezcomercializadora@hotmail.com'),
(10, 40, 'Pérez Export S.A.C.', 'RUC', '01234567890', 'Av. Las Palmeras 234', '987654360', 'perezexport@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expiracion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `usuario`, `clave`, `token`, `expiracion`) VALUES
(1, 'CLI0001', 'clave123', NULL, '0000-00-00 00:00:00'),
(2, 'EMP0001', 'clave456', NULL, '2024-05-09 00:38:34'),
(3, 'ADM0001', 'clave789', NULL, '2024-05-09 00:38:34'),
(4, 'PRO0001', 'claveabc', NULL, '2024-05-09 00:38:34'),
(5, 'CLI0002', 'clavedef', NULL, '2024-05-09 00:38:34'),
(6, 'EMP0002', 'claveghi', NULL, '2024-05-09 00:38:34'),
(7, 'ADM0002', 'clavejkl', NULL, '2024-05-09 00:38:34'),
(8, 'PRO0002', 'clavemno', NULL, '2024-05-09 00:38:34'),
(9, 'CLI0003', 'clavepqr', NULL, '2024-05-09 00:38:34'),
(10, 'EMP0003', 'clavestu', NULL, '2024-05-09 00:38:34'),
(11, 'ADM0003', 'clave123', NULL, '2024-05-09 00:38:34'),
(12, 'PRO0003', 'clave456', NULL, '2024-05-09 00:38:34'),
(13, 'CLI0004', 'clave789', NULL, '2024-05-09 00:38:34'),
(14, 'EMP0004', 'claveabc', NULL, '2024-05-09 00:38:34'),
(15, 'ADM0004', 'clavedef', NULL, '2024-05-09 00:38:34'),
(16, 'PRO0004', 'claveghi', NULL, '2024-05-09 00:38:34'),
(17, 'CLI0005', 'clavejkl', NULL, '2024-05-09 00:38:34'),
(18, 'EMP0005', 'clavemno', NULL, '2024-05-09 00:38:34'),
(19, 'ADM0005', 'clavepqr', NULL, '2024-05-09 00:38:34'),
(20, 'PRO0005', 'clavestu', NULL, '2024-05-09 00:38:34'),
(21, 'CLI0006', 'clave123', NULL, '2024-05-09 00:38:34'),
(22, 'EMP0006', 'clave456', NULL, '2024-05-09 00:38:34'),
(23, 'ADM0006', 'clave789', NULL, '2024-05-09 00:38:34'),
(24, 'PRO0006', 'claveabc', NULL, '2024-05-09 00:38:34'),
(25, 'CLI0007', 'clavedef', NULL, '2024-05-09 00:38:34'),
(26, 'EMP0007', 'claveghi', NULL, '2024-05-09 00:38:34'),
(27, 'ADM0007', 'clavejkl', NULL, '2024-05-09 00:38:34'),
(28, 'PRO0007', 'clavemno', NULL, '2024-05-09 00:38:34'),
(29, 'CLI0008', 'clavepqr', NULL, '2024-05-09 00:38:34'),
(30, 'EMP0008', 'clavestu', NULL, '2024-05-09 00:38:34'),
(31, 'ADM0008', 'clave123', NULL, '2024-05-09 00:38:34'),
(32, 'PRO0008', 'clave456', NULL, '2024-05-09 00:38:34'),
(33, 'CLI0009', 'clave789', NULL, '2024-05-09 00:38:34'),
(34, 'EMP0009', 'claveabc', NULL, '2024-05-09 00:38:34'),
(35, 'ADM0009', 'clavedef', NULL, '2024-05-09 00:38:34'),
(36, 'PRO0009', 'claveghi', NULL, '2024-05-09 00:38:34'),
(37, 'CLI0010', 'clavejkl', NULL, '2024-05-09 00:38:34'),
(38, 'EMP0010', 'clavemno', NULL, '2024-05-09 00:38:34'),
(39, 'ADM0010', 'clavepqr', NULL, '2024-05-09 00:38:34'),
(40, 'PRO0010', 'clavestu', NULL, '2024-05-09 00:38:34');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `detalledevolucion`
--
ALTER TABLE `detalledevolucion`
  ADD PRIMARY KEY (`idDetalleDevolucion`),
  ADD KEY `idDevolucion` (`idDevolucion`),
  ADD KEY `idDetalleIngreso` (`idDetalleIngreso`);

--
-- Indices de la tabla `detalleingreso`
--
ALTER TABLE `detalleingreso`
  ADD PRIMARY KEY (`idDetalleIngreso`),
  ADD KEY `idIngreso` (`idIngreso`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  ADD PRIMARY KEY (`idEstadoPedido`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idIngreso`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idEstadoPedido` (`idEstadoPedido`),
  ADD KEY `pedido_ibfk_3` (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalledevolucion`
--
ALTER TABLE `detalledevolucion`
  MODIFY `idDetalleDevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleingreso`
--
ALTER TABLE `detalleingreso`
  MODIFY `idDetalleIngreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `idDevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  MODIFY `idEstadoPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idIngreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `detalledevolucion`
--
ALTER TABLE `detalledevolucion`
  ADD CONSTRAINT `detalledevolucion_ibfk_1` FOREIGN KEY (`idDevolucion`) REFERENCES `devolucion` (`idDevolucion`),
  ADD CONSTRAINT `detalledevolucion_ibfk_2` FOREIGN KEY (`idDetalleIngreso`) REFERENCES `detalleingreso` (`idDetalleIngreso`);

--
-- Filtros para la tabla `detalleingreso`
--
ALTER TABLE `detalleingreso`
  ADD CONSTRAINT `detalleingreso_ibfk_1` FOREIGN KEY (`idIngreso`) REFERENCES `ingreso` (`idIngreso`),
  ADD CONSTRAINT `detalleingreso_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`),
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`idEstadoPedido`) REFERENCES `estadopedido` (`idEstadoPedido`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
