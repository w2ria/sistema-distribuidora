-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2024 a las 08:24:23
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
(1, 'Papas Fritas', 'Snack popular elaborado a partir de papas que han sido cortadas en rodajas finas o en tiras, y luego fritas en aceite hasta alcanzar una textura crujiente.'),
(2, 'Cereales', 'Alimentos derivados de granos como el trigo, maíz, avena, arroz y cebada, que se procesan y suelen consumirse en el desayuno. '),
(3, 'Pan', 'Elaborado principalmente a partir de harina, agua, y un agente leudante como la levadura. '),
(4, 'Galletas', 'Se caracteriza por su textura crujiente y sabor dulce.'),
(5, 'Tostadas', 'Las tostadas son rodajas finas de pan que se han tostado hasta que alcanzan una textura crujiente y un color dorado.'),
(6, 'Chupetines', 'Conocidos como paletas, son caramelos duros montados en un palo que permiten consumirlos de manera más conveniente.'),
(7, 'Bizcochos', 'Tipo de pastel o torta pequeño que se caracteriza por su textura suave y esponjosa.'),
(8, 'Snacks Salados', 'Bocadillos o aperitivos que se caracterizan por su sabor salado y a menudo crujiente.');

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
(10, 37, 'Sofía Pérez', 'DNI', '01234567', 'Av. Las Palmeras 234', '987654330', 'sofiaperez@gmail.com'),
(11, 44, 'Dante', 'DNI', '78451296', 'mi casa', '985874123', 'dantito@gmail.com'),
(12, 45, 'Fernando', 'DNI', '72689377', 'Mi house ', '987564321', 'fernando@gmail.com');

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
(10, 38, 'Fabiola Ortega', 'DNI', '01234567', 'Av. Las Palmeras 234', '987654340', 'fabiolaortega@gmail.com', 'activo'),
(12, 48, 'Martin', 'DNI', '78451296', 'Jr gaminedes', '987564321', 'Martin@gmail.com', 'activo');

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
(1, 'Lay\'s', 'Papas fritas en una variedad de sabores y estilos, conocidas por su textura crujiente.'),
(2, 'Inka chips', 'Marca peruana de snacks que se especializa en la producción de papas fritas y otros productos derivados de ingredientes locales'),
(3, 'Alicorp', 'Una marca local, con su línea de cereales Angel'),
(4, 'Nestle', 'Marca internacional con una presencia fuerte en Perú, ofreciendo cereales como Fitness, Nesquik, Chocapic, Trix, entre otros.'),
(5, 'Kellogg\'s', 'Marcas más populares a nivel mundial, con productos como Corn Flakes, Choco Krispis, Zucaritas, Froot Loops, entre otros.'),
(6, 'Bimbo', 'Ofrece productos como pan de caja, pastelería, snacks y tortillas.'),
(7, 'Union', 'Los productos de Unión incluyen panes, galletas y otros productos de repostería, conocidos por su calidad y sabor tradicional'),
(8, 'Costa', 'Conocida por la alta calidad de sus productos y su constante innovación para satisfacer los gustos de los consumidores'),
(9, 'Field', 'Amplia gama de productos de confitería y snacks');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `Monto`) VALUES
(19, 4),
(20, 4),
(21, 8.9166),
(22, 9);

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

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idPedido`, `idCliente`, `idEmpleado`, `idPago`, `tipoComprobante`, `numComprobante`, `fecha`, `total`, `idEstadoPedido`) VALUES
(1, 1, 1, 19, 'Factura', '0001-00000001', '2024-06-03', 4.00000, 1),
(2, 11, 1, 20, 'Factura', '0001-00000002', '2024-06-03', 4.00000, 1),
(3, 11, 1, 21, 'Factura', '0001-00000003', '2024-06-03', 8.91660, 1),
(4, 11, 1, 22, 'Factura', '0001-00000004', '2024-06-04', 9.00000, 1);

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
(105, 1, 1, 'Lay\'s Clasicas', 5.50000, 300, 'Clasicas Saladas ', 'PRO0001.jpg', 'activo'),
(106, 1, 1, 'Lay\'s Dill Pickle', 8.00000, 80, 'Pepinillos al eneldo', 'PRO0002.jpg', 'activo'),
(107, 1, 1, 'Lay\'s Chile Limon', 4.50000, 60, 'Picor de los chiles y el gusto potente del limon verde', 'PRO0003.jpg', 'activo'),
(108, 1, 1, 'Lay\'s Flamin Hot Dill Pickle', 9.00000, 84, 'Picor intenso de los chiles y la acidez de los pepinillos al eneldo', 'PRO0004.jpg', 'activo'),
(109, 1, 1, 'Lay\'s Flamin Hot', 8.50000, 100, 'Picante intenso de los chiles y los condimentos', 'PRO0005.jpg', 'activo'),
(110, 1, 1, 'Lay\'s  Sweet & Spicy Honey', 9.50000, 95, 'Mezcla dulce y picante para obtener la combinacion de sabores perfecta', 'PRO0006.jpg', 'activo'),
(111, 1, 1, 'Lay\'s Adobadas', 8.80000, 60, 'Condimento de Adobadas (sal, especias [con chile rojo], azucar, harina de maiz amarillo', 'PRO0007.jpg', 'activo'),
(112, 1, 1, 'Lay\'s Chesapeake Bay Crab Spice', 9.50000, 86, 'Sabor condimento para cangrejo de la bahia de Chesapeake', 'PRO0008.jpg', 'activo'),
(113, 1, 1, 'Lay\'s Honey Barbecue', 8.50000, 60, 'Dulzor de la miel y el toque picante de la salsa BBQ ', 'PRO0009.jpg', 'activo'),
(114, 1, 1, 'Lay\'s Limon', 8.50000, 150, 'Gusto potente del limon verde', 'PRO0010.jpg', 'activo'),
(115, 1, 1, 'Lay\'s Salt & Vinegar', 9.50000, 68, 'Acidez que aporta el vinagre y la sal', 'PRO0011.jpg', 'activo'),
(116, 1, 1, 'Lay\'s Cheddar ', 9.50000, 62, 'Combinacion de queso cheddar ', 'PRO0012.jpg', 'activo'),
(117, 1, 1, 'Lay\'s Sweet & Spicy Honey', 9.50000, 102, 'Mezcla dulce y picante para obtener la combinacion de sabores perfecta', 'PRO0013.jpg', 'activo'),
(118, 1, 1, 'Lay\'s Cheddar & Sour Cream', 9.50000, 200, 'Punto acido de la crema y del queso cheddar fuerte', 'PRO0014.jpg', 'activo'),
(119, 1, 1, 'Lay\'s Sour Cream & Onion', 10.00000, 200, 'Punto Acido de la crema y las cebollas ', 'PRO0015.jpg', 'activo'),
(120, 1, 1, 'Lay\'s Barbecue', 8.50000, 200, 'Dulzor picosito de la salsa BBQ', 'PRO0016.jpg', 'activo'),
(121, 1, 2, 'Inka Chips Sal de Mar', 7.00000, 100, 'Condimentado con sal de Mares ', 'PRO0017.jpg', 'activo'),
(122, 1, 2, 'Inka Chips Jalapeno', 8.50000, 125, 'Papas crujientes sabor Jalapeno', 'PRO0018.jpg', 'activo'),
(123, 1, 2, 'Inka Chips Sabor BBQ & cebolla', 9.50000, 200, 'Crujientes dulces, ahumadas y extra crujientes', 'PRO0019.jpg', 'activo'),
(124, 1, 2, 'Inka Chips Sabor Queso & Cebolla', 9.50000, 200, 'Sabor del queso parmesano maduro y de cebolla dulce', 'PRO0020.jpg', 'activo'),
(125, 1, 2, 'Inka Chips Papas Nativas', 8.50000, 150, 'Exquisito sabor, colores y textura que tienen nuestras papas nativas', 'PRO0021.jpg', 'activo'),
(127, 2, 3, 'Angel Chock', 12.00000, 88, 'Cereal de maiz inflado y recubierto con chocolate', 'PRO0022.jpg', 'activo'),
(128, 2, 3, 'Angel Copix', 8.50000, 100, 'Caracterizada por su sabor a chocolate', 'PRO0023.jpg', 'activo'),
(129, 2, 3, 'Angel Fresia Amohada', 12.00000, 125, 'Cereal que ofrece una variante con sabor a fresa. Este cereal esta hecho de granos de maiz y arroz', 'PRO0024.jpg', 'activo'),
(130, 2, 3, 'Angel Frutt', 13.00000, 120, 'Conocida por su combinacion de granos con trozos de frutas', 'PRO0025.jpg', 'activo'),
(131, 2, 3, 'Angel Meli', 15.00000, 132, 'Se distingue por su sabor a miel', 'PRO0026.jpg', 'activo'),
(132, 2, 3, 'Angel Pepe Almohada', 16.00000, 168, 'Hecho principalmente de granos de maiz y arroz', 'PRO0027.jpg', 'activo'),
(133, 2, 3, 'Angel Tito Almohada', 13.00000, 45, 'Hecho principalmente de granos de maiz y arroz, ademas de Extractos de malta (para sabor y color)', 'PRO0028.jpg', 'activo'),
(134, 2, 3, 'Angel Zuck', 14.00000, 123, 'Hecho de granos de maiz, que son procesados y recubiertos con una capa de azucar', 'PRO0029.jpg', 'activo'),
(135, 2, 3, 'Angel Estrellitas', 16.00000, 145, 'Hecho de granos de maiz y trigo, son procesados y moldeados en forma de estrellas', 'PRO0030.jpg', 'activo'),
(136, 2, 3, 'Angel Flakes', 15.00000, 42, 'Hecho de granos de maiz, que son procesados y laminados en finas hojuelas', 'PRO0031.jpg', 'activo'),
(137, 2, 4, 'Nestle Cereal Estrellitas', 13.00000, 42, 'Hecho principalmente de granos integrales', 'PRO0032.jpg', 'activo'),
(138, 2, 4, 'Nestle KitKat', 20.00000, 56, 'Combinando el placer del chocolate con la conveniencia de los cereales', 'PRO0033.jpg', 'activo'),
(139, 2, 4, 'Nestle Chocapic', 25.00000, 82, 'Conocida por su sabor a chocolate y su textura crujiente', 'PRO0034.jpg', 'activo'),
(140, 2, 4, 'Nestle Corn Flakes', 21.00000, 87, 'Conocida por sus hojuelas de maiz crujientes y su sabor clasico', 'PRO0035.jpg', 'activo'),
(141, 2, 4, 'Nestle Nesquik', 25.00000, 60, 'Combinacion de harina de maiz y trigo, junto con el cacao en polvo', 'PRO0036.jpg', 'activo'),
(142, 2, 4, 'Nestle Original Fitness', 12.00000, 74, 'Hecho principalmente de granos integrales, proporcionando una buena fuente de fibra y nutrientes esenciales', 'PRO0037.jpg', 'activo'),
(143, 2, 4, 'Nestle Trix', 22.00000, 39, 'Conocida por sus colores vibrantes y su sabor afrutado', 'PRO0038.jpg', 'activo'),
(144, 2, 5, 'Kellogg\'s Choco Krispis', 35.00000, 100, 'Conocida por su sabor a chocolate y su textura crujiente', 'PRO0039.jpg', 'activo'),
(145, 2, 5, 'Kellogg\'s Corn Flakes', 23.00000, 54, 'Famoso por sus hojuelas de maiz crujientes y su sabor clasico', 'PRO0040.jpg', 'activo'),
(146, 2, 5, 'Kellogg\'s Froot Loops', 18.00000, 95, 'Conocido por sus anillos de colores vibrantes y su sabor afrutado', 'PRO0041.jpg', 'activo'),
(147, 3, 6, 'Bimbo Pan Multigrano Cero Cero', 15.00000, 42, 'Se caracteriza por estar elaborado sin azucar y sin grasa anadida', 'PRO0042.jpg', 'activo'),
(148, 3, 6, 'Bimbo Pan Cero Cero', 13.00000, 87, 'Eleccion para quienes desean disfrutar de un pan delicioso y nutritivo', 'PRO0043.jpg', 'activo'),
(149, 3, 6, 'Bimbo Pan Blanco para Hot Dogs', 20.00000, 135, 'Se caracteriza por su suavidad y sabor, ofreciendo la base perfecta para tus hot dogs favoritos', 'PRO0044.jpg', 'activo'),
(150, 3, 6, 'Bimbo Pan de Molde Blanco', 12.50000, 124, 'Se caracteriza por su textura esponjosa y su sabor clasico, ideal para diversas preparaciones', 'PRO0045.jpg', 'activo'),
(151, 3, 6, 'Bimbo Pan Multigrano Linaza', 15.60000, 206, 'Se caracteriza por estar enriquecido con linaza, proporcionando beneficios adicionales para la salud', 'PRO0046.jpg', 'activo'),
(152, 3, 6, 'Bimbo Pan Pita Blanco', 10.00000, 231, 'Se caracteriza por su suavidad y sabor neutro, ideal para combinar con diferentes ingredientes', 'PRO0047.jpg', 'activo'),
(153, 3, 6, 'Bimbo Pan Pita Cero Cero', 11.30000, 43, 'Opcion de pan versatil, deliciosa y nutritiva', 'PRO0048.jpg', 'activo'),
(154, 3, 6, 'Bimbo Pan Pita Con Linaza', 12.50000, 89, 'Este pan pita se caracteriza por estar enriquecido con linaza, proporcionando beneficios adicionales para la salud', 'PRO0049.jpg', 'activo'),
(155, 3, 6, 'Bimbo Pan Pita Integral', 12.00000, 96, 'Se caracteriza por estar elaborado con harina integral', 'PRO0050.jpg', 'activo'),
(156, 3, 6, 'Bimbo Pan Integral', 10.50000, 98, 'Se caracteriza por estar elaborado con harina integral, proporcionando beneficios adicionales para la salud', 'PRO0051.jpg', 'activo'),
(157, 4, 8, 'Costa Choco Chips', 2.50000, 140, 'Galleta crujiente y deliciosa con el inconfundible sabor del chocolate', 'PRO0052.jpg', 'activo'),
(158, 4, 8, 'Costa Galleta Frac Chococlate', 3.50000, 43, 'Galleta crujiente por fuera y cremosa por dentro, con el inconfundible sabor del chocolate', 'PRO0053.jpg', 'activo'),
(159, 4, 8, 'Costa Galleta Frac Clasica', 4.50000, 67, 'Galletas de vainilla con un relleno cremoso de sabor a chocolate', 'PRO0054.jpg', 'activo'),
(160, 3, 7, 'Union Pan Americano Sandwich Clasico', 8.50000, 94, 'Eleccion perfecta para quienes desean disfrutar de un pan suave, delicioso y versatil', 'PRO0055.jpg', 'activo'),
(161, 3, 7, 'Union Pan Blanco Superbom Familiar', 8.50000, 56, 'Viene en un tamano familiar con rebanadas grandes, perfectas para multiples preparaciones', 'PRO0056.jpg', 'activo'),
(162, 3, 7, 'Union Pan con Granos y Semillas', 9.50000, 63, 'Contiene una mezcla de diferentes granos y semillas, como linaza, sesamo, girasol, y avena', 'PRO0057.jpg', 'activo'),
(163, 3, 7, 'Union Pan Fibra Integral', 7.50000, 85, 'Hecho con harina integral que aporta mas fibra y nutrientes en comparacion con la harina refinada', 'PRO0058.jpg', 'activo'),
(164, 3, 7, 'Union Pan Fuente', 10.60000, 76, 'Contiene una mezcla de vitaminas y minerales esenciales', 'PRO0059.jpg', 'activo'),
(165, 3, 7, 'Union Pan Integral Sandwich Clasico', 6.50000, 79, 'Hecho con harina integral que aporta mas fibra y nutrientes en comparacion con la harina refinada', 'PRO0060.jpg', 'activo'),
(166, 3, 7, 'Union Pan Multisemillas Con Avena', 8.80000, 93, 'Contiene una mezcla de semillas como linaza, sesamo, girasol, y chia', 'PRO0061.jpg', 'activo'),
(167, 3, 7, 'Union Pan Multisemillas con Miel de Abeja', 10.60000, 91, 'Se caracteriza por estar enriquecido con una variedad de semillas y miel de abeja', 'PRO0062.jpg', 'activo'),
(168, 3, 7, 'Union Pan Pita Integral con Granos Andinos', 9.50000, 83, 'Se caracteriza por estar elaborado con harina integral y enriquecido con granos andinos', 'PRO0063.jpg', 'activo'),
(169, 3, 7, 'Union Pan Pita Semillas Chia y Linaza', 9.80000, 93, 'Se caracteriza por estar enriquecido con semillas de chia y linaza', 'PRO0064.jpg', 'activo'),
(170, 4, 8, 'Costa Galleta Gretel Chococlate', 3.50000, 121, 'Galleta crujiente por fuera y cremosa por dentro, con el inconfundible sabor del chocolate', 'PRO0065.jpg', 'activo'),
(171, 4, 8, 'Costa Galletas Choco Donuts', 3.50000, 69, 'Galletas con forma de donut, que las hace atractivas y divertidas de comer', 'PRO0066.jpg', 'activo'),
(172, 4, 8, 'Costa Galletas Frac Sabor Vainilla', 6.50000, 95, 'Galletas de vainilla con un relleno cremoso de sabor a vainilla', 'PRO0067.jpg', 'activo'),
(173, 4, 8, 'Costa Galleta Agua Line', 3.50000, 96, 'Galletas delgadas y crujientes, perfectas para un consumo ligero y saludable', 'PRO0068.jpg', 'activo'),
(174, 4, 8, 'Costa Galleta Caritas', 2.50000, 83, 'Galletas con formas de caritas, rellena en chocolate', 'PRO0069.jpeg', 'activo'),
(175, 4, 8, 'Costa Galletas Donuts Blanco', 1.50000, 93, 'Combinando la forma de un donut con el delicioso sabor del chocolate blanco', 'PRO0070.jpg', 'activo'),
(176, 4, 8, 'Costa Galletas Choco Donuts Crunch', 2.50000, 97, 'Combinando la forma de un donut con el sabor intenso del chocolate y una textura crujiente adicional', 'PRO0071.jpg', 'activo'),
(177, 4, 9, 'Field Chokosoda', 2.50000, 125, 'Deliciosa combinacion de galleta soda y cobertura de chocolate', 'PRO0072.jpg', 'activo'),
(178, 4, 9, 'Field Galleta Coronita', 3.50000, 56, 'Galletas con forma de corona Y cubierta de chocolate', 'PRO0073.jpg', 'activo'),
(179, 4, 9, 'Field Galleta Cua Cua', 3.50000, 95, 'La galleta Cua Cua tradicional viene con una cobertura de chocolate con leche', 'PRO0074.jpg', 'activo'),
(180, 4, 9, 'Field Galleta Vainilla', 2.00000, 95, 'Ofrece un sabor delicioso y una textura crujiente con saborizante de vainilla', 'PRO0075.jpg', 'activo'),
(181, 4, 9, 'Field Galletas Charada', 3.50000, 92, 'Cada galleta esta cubierta con una capa de chocolate, ofreciendo una combinacion perfecta de galleta y chocolate', 'PRO0076.jpg', 'activo'),
(182, 4, 9, 'Field Galletas Cream Crakers', 2.50000, 67, 'Conocidas por su textura crujiente y su sabor ligero y salado', 'PRO0077.jpg', 'activo'),
(183, 4, 9, 'Field Galletas Dona Pepa', 3.50000, 130, 'conocidas por su distintiva capa de cobertura de chocolate y su colorida decoracion de grajeas de colores', 'PRO0078.jpg', 'activo'),
(184, 4, 9, 'Field Travesuras Animalitos', 2.50000, 68, 'Son conocidas por su variedad de formas de animales, lo que las hace especialmente atractivas', 'PRO0079.jpg', 'activo'),
(185, 4, 4, 'Nestle Galleta Choco Trio Cookies and Cream', 4.50000, 68, 'Conocidas por su deliciosa combinacion de chocolate y crema', 'PRO0080.jpg', 'activo'),
(186, 4, 4, 'Nestle Morochas Clasicas', 2.50000, 93, 'Destacan por su doble capa de galleta de chocolate unida por una capa de crema de chocolate', 'PRO0081.jpg', 'activo');

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
(10, 40, 'Pérez Export S.A.C.', 'RUC', '01234567890', 'Av. Las Palmeras 234', '987654360', 'perezexport@gmail.com'),
(11, 46, 'Pedro', 'DNI', '78451236', 'Jr gaminedes', '923457816', 'quesuenocolega@gmail.com');

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
(3, 'admin', 'admin', NULL, '2024-05-20 02:34:57'),
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
(40, 'PRO0010', 'clavestu', NULL, '2024-05-09 00:38:34'),
(44, 'Dantito', '123', '', '2024-05-19 09:00:03'),
(45, 'Fak01', '123', '', '2024-05-20 03:59:36'),
(46, 'PRO0011', NULL, NULL, '2024-05-20 04:47:54'),
(47, 'EMP_Martinez', '456', NULL, '2024-05-20 05:35:50'),
(48, 'EMP_Martinez', '123', NULL, '2024-05-20 06:49:29');

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
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `idDevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
