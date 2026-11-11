-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 21-10-2026 a las 09:37:23
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `plantilla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `idCaja` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `montoInicial` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fechaApertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaCierre` datetime DEFAULT NULL,
  `estado` enum('ABIERTA','CERRADA') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ABIERTA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`idCaja`, `idUsuario`, `montoInicial`, `fechaApertura`, `fechaCierre`, `estado`) VALUES
(1, 1, '300.00', '2026-07-21 23:47:28', NULL, 'ABIERTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_movimientos`
--

CREATE TABLE `caja_movimientos` (
  `idCajaMovimiento` int(10) UNSIGNED NOT NULL,
  `idCaja` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `tipo` enum('VENTA','GASTO','INGRESO','AJUSTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `concepto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fechaMovimiento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `categoriaNombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `categoriaNombre`, `estado`, `created_at`) VALUES
(1, 'Abarrotes', 1, '2026-07-18 21:58:13'),
(2, 'Bebidas', 1, '2026-07-18 21:58:13'),
(3, 'Lácteos', 1, '2026-07-18 21:58:13'),
(4, 'Carnes y Embutidos', 1, '2026-07-18 21:58:13'),
(5, 'Panadería', 1, '2026-07-18 21:58:13'),
(6, 'Botanas', 1, '2026-07-18 21:58:13'),
(7, 'Dulces', 1, '2026-07-18 21:58:13'),
(8, 'Frutas y Verduras', 1, '2026-07-18 21:58:13'),
(9, 'Verduras', 1, '2026-07-18 21:58:13'),
(10, 'Frutas', 1, '2026-07-18 21:58:13'),
(11, 'Enlatados', 1, '2026-07-18 21:58:13'),
(12, 'Condimentos', 1, '2026-07-18 21:58:13'),
(13, 'Limpieza', 1, '2026-07-18 21:58:13'),
(14, 'Higiene Personal', 1, '2026-07-18 21:58:13'),
(15, 'Mascotas', 1, '2026-07-18 21:58:13'),
(16, 'Desechables', 1, '2026-07-18 21:58:13'),
(17, 'Papelería', 1, '2026-07-18 21:58:13'),
(18, 'Congelados', 1, '2026-07-18 21:58:13'),
(19, 'Harinas y Cereales', 1, '2026-07-18 21:58:13'),
(20, 'Aceites', 1, '2026-07-18 21:58:13'),
(21, 'Licores', 1, '2026-07-18 21:58:13'),
(22, 'Tabacos', 1, '2026-07-18 21:58:13'),
(23, 'Medicamentos', 1, '2026-07-18 21:58:13'),
(24, 'Otros', 1, '2026-07-18 21:58:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombreNegocio` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombreNegocio`, `direccion`, `telefono`, `correo`) VALUES
(1, 'ABARROTES', 'El Nith', '771-122-3344', 'contacto@negocio.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes_caja`
--

CREATE TABLE `cortes_caja` (
  `idCorteCaja` int(10) UNSIGNED NOT NULL,
  `idCaja` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `montoInicial` decimal(10,2) NOT NULL DEFAULT '0.00',
  `totalVentas` decimal(10,2) NOT NULL DEFAULT '0.00',
  `gastos` decimal(10,2) NOT NULL DEFAULT '0.00',
  `efectivoEsperado` decimal(10,2) NOT NULL DEFAULT '0.00',
  `efectivoReal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `diferencia` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fechaCorte` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id_devolucion` int(10) UNSIGNED NOT NULL,
  `id_venta` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `motivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(10) UNSIGNED NOT NULL,
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `codigoBarras` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `precioCompra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `precioVenta` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` decimal(10,3) NOT NULL DEFAULT '0.000',
  `stockMinimo` decimal(10,3) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `tipoVenta` enum('UNIDAD','GRANEL') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UNIDAD',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `idCategoria`, `codigoBarras`, `nombre`, `descripcion`, `precioCompra`, `precioVenta`, `stock`, `stockMinimo`, `estado`, `tipoVenta`, `fechaCreacion`) VALUES
(1, 4, '1', 'Jamon Cocido De Pavo San Antonio', 'Jamon Cocido De Pavo San Antonio', '56.20', '100.00', '1.570', '0.000', 1, 'GRANEL', '2026-07-18 22:04:21'),
(2, 3, '12222', 'Huevo San Juan Medio', 'Huevo San Juan Medio', '0.00', '18.00', '14.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(3, 5, '123', 'PAN DE DULCE', 'PAN DE DULCE', '7.00', '8.00', '1.000', '1.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(4, 18, '12388003177', 'Bold 3detergente Cariñitos De Mamá En Polvo 850g', 'Bold 3detergente Cariñitos De Mamá En Polvo 850g', '27.61', '35.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(5, 18, '14800515329', 'Clamato El Original 473ml', 'Clamato El Original 473ml', '30.00', '31.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(6, 18, '20800600347', 'Tampom Tampax Super Plus 10pz', 'Tampom Tampax Super Plus 10pz', '43.38', '52.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(7, 18, '3', 'Chicle Trident', 'Chicle Trident', '2.21', '3.00', '28.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(8, 18, '32239052017', 'JUGO DEL VALLE DURAZNO413ML', 'JUGO DEL VALLE DURAZNO413ML', '0.00', '21.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(9, 18, '34587030013', 'Sal La Fina', 'Sal La Fina', '18.08', '25.00', '4.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(10, 18, '38629002273', 'La Moderna Galleta Narantinas Las Tres Estrellas -150g', 'La Moderna Galleta Narantinas Las Tres Estrellas -150g', '11.52', '18.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(11, 18, '38629003843', 'Polvorones Tres Estrellas Sabor Nuez 210g', 'Polvorones Tres Estrellas Sabor Nuez 210g', '14.60', '18.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(12, 18, '41789001864', 'Sopa Maruchan Camaron Con Limon Y Habanero 64gr', 'Sopa Maruchan Camaron Con Limon Y Habanero 64gr', '13.17', '20.00', '9.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(13, 18, '41789001956', 'Sopa Maruchan Camaron 64gr', 'Sopa Maruchan Camaron 64gr', '13.17', '19.00', '11.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(14, 18, '41789001987', 'Sopa Maruchan Camaron Chile 64gr', 'Sopa Maruchan Camaron Chile 64gr', '13.17', '20.00', '10.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(15, 3, '456', 'Huevo San Juan', 'Huevo San Juan', '0.00', '35.00', '457.540', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(16, 18, '46200037', 'Carbonato La Casita', 'Carbonato La Casita', '0.92', '3.00', '30.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(17, 18, '46200051', 'Comino La Casita', 'Comino La Casita', '0.79', '2.50', '30.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(18, 18, '46200150', 'Oregano La Casita', 'Oregano La Casita', '0.79', '2.50', '30.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(19, 18, '5', 'Alimento Gato Minino', 'Alimento Gato Minino', '39.09', '45.00', '16.000', '0.000', 1, 'GRANEL', '2026-07-18 22:04:21'),
(20, 3, '555', 'QUESO OAXACA', 'QUESO OAXACA', '0.00', '30.00', '4.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(21, 18, '6', 'Alimento Perro Amigo Gourmet', 'Alimento Perro Amigo Gourmet', '18.77', '24.00', '13.500', '0.000', 1, 'GRANEL', '2026-07-18 22:04:21'),
(22, 18, '606110023924', 'GALON DE AGUA SKARCH 10L', 'GALON DE AGUA SKARCH 10L', '37.00', '38.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(23, 18, '614143473432', 'Canela Econimica Aliguma', 'Canela Econimica Aliguma', '4.80', '8.00', '15.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(24, 18, '661440000014', 'Azucar Zulka Morena 1kg', 'Azucar Zulka Morena 1kg', '21.39', '27.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(25, 3, '7', 'Huevo Blanco Kolibri', 'Huevo Blanco Kolibri', '21.00', '30.00', '17.540', '0.000', 1, 'GRANEL', '2026-07-18 22:04:21'),
(26, 18, '735257002452', 'Gelatina D´gari De Agua Sabor Uva 120g', 'Gelatina D´gari De Agua Sabor Uva 120g', '10.64', '12.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(27, 18, '735257002490', 'Dgari Gelatina limon', 'Dgari Gelatina limon', '10.64', '12.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(28, 18, '735257002513', 'Dgari Gelatina Fresa Agua', 'Dgari Gelatina Fresa Agua', '10.64', '12.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(29, 18, '735257002551', 'Gelatina D´gari Frutos Rojos 120g', 'Gelatina D´gari Frutos Rojos 120g', '10.64', '12.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(30, 18, '735257002599', 'Dgari Polvo Para Preparar Gelatina Con Agua Sabor Mora Silvestre 120g', 'Dgari Polvo Para Preparar Gelatina Con Agua Sabor Mora Silvestre 120g', '10.64', '12.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(31, 18, '738545010030', 'Salsa Botanera 500ml', 'Salsa Botanera 500ml', '18.31', '24.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(32, 18, '741120000005', 'Clarasol Blanqueador 1lt', 'Clarasol Blanqueador 1lt', '10.48', '15.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(33, 18, '744607002691', 'New Mix Paloma 473ml', 'New Mix Paloma 473ml', '27.94', '34.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(34, 18, '744886365050', 'Jarrito 2lt Tamarindo', 'Jarrito 2lt Tamarindo', '0.00', '26.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(35, 18, '744886375059', 'Jarrito2lt  Mandarina', 'Jarrito2lt  Mandarina', '0.00', '26.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(36, 18, '744886385058', 'Jarrito 2lt. Piña', 'Jarrito 2lt. Piña', '0.00', '26.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(37, 18, '744886395057', 'Jarrito 2lt Limon', 'Jarrito 2lt Limon', '0.00', '26.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(38, 18, '75000615', 'Cloralex El Rendidor Blanqueador De Ropa Concentrado 950ml', 'Cloralex El Rendidor Blanqueador De Ropa Concentrado 950ml', '16.60', '20.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(39, 18, '75001759', 'Boing! Bebida De Pulpa De Mango 250ml', 'Boing! Bebida De Pulpa De Mango 250ml', '8.50', '12.00', '6.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(40, 18, '75001773', 'Boing! Bebida De Pulpa De Guayaba 250ml', 'Boing! Bebida De Pulpa De Guayaba 250ml', '8.50', '12.00', '6.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(41, 18, '75001797', 'Boing! Bebida De Jugo De Manzana 250ml', 'Boing! Bebida De Jugo De Manzana 250ml', '8.50', '12.00', '7.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(42, 18, '75002343', 'Aceite 123 1L', 'Aceite 123 1L', '41.22', '44.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(43, 18, '75003104', 'Boing Bebida Con 12de Pulpa De Mango 500ml', 'Boing Bebida Con 12de Pulpa De Mango 500ml', '13.98', '17.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(44, 18, '75003135', 'Boing Bebida Con 12% De Pulpa De Guayaba 500ml', 'Boing Bebida Con 12% De Pulpa De Guayaba 500ml', '13.98', '17.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(45, 18, '75003159', 'Boin Manzana 500ml', 'Boin Manzana 500ml', '13.98', '17.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(46, 18, '7500435108256', 'Salvo Limón Lavatrastes Líquido , Remueve Grasa Difícil, 500ml', 'Salvo Limón Lavatrastes Líquido , Remueve Grasa Difícil, 500ml', '29.49', '35.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(47, 18, '7500435138680', 'Toalla Fem Naturekka Noct 8pza', 'Toalla Fem Naturekka Noct 8pza', '59.61', '69.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(48, 18, '7500435157964', 'Toalla Fem Naturella Inv 8pza', 'Toalla Fem Naturella Inv 8pza', '17.06', '21.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(49, 18, '7500478001620', 'Rancheritos Botana De Maíz Nixtamalizado Con Chile Y Especias 40g', 'Rancheritos Botana De Maíz Nixtamalizado Con Chile Y Especias 40g', '7.64', '15.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(50, 18, '7500478002009', 'Churrumais Botana De Harina De Maíz Nixtamalizado Con Chile Sabor Limón 36g', 'Churrumais Botana De Harina De Maíz Nixtamalizado Con Chile Sabor Limón 36g', '7.64', '15.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(51, 18, '7500478005512', 'Crackets Gamesa Galleta Sabor Mantequilla 135g', 'Crackets Gamesa Galleta Sabor Mantequilla 135g', '15.30', '20.00', '4.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(52, 18, '7500478010592', 'Marias Gamesa Gamesa Galleta Fortificada 177g', 'Marias Gamesa Gamesa Galleta Fortificada 177g', '14.16', '19.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(53, 3, '7500478015276', 'Ruffles Papas Fritas Queso 41.00g', 'Ruffles Papas Fritas Queso 41.00g', '7.64', '20.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(54, 18, '7500478015283', 'Sabritas Papas Fritas Original 36.00g', 'Sabritas Papas Fritas Original 36.00g', '7.64', '15.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(55, 18, '7500478018925', 'Frit-Os Botana De Maíz Nixtamalizado Con Sal Sabor Limón 38g', 'Frit-Os Botana De Maíz Nixtamalizado Con Sal Sabor Limón 38g', '7.64', '15.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(56, 18, '7500478021581', 'Gamesa Galletas Emperador Combinado 109g', 'Gamesa Galletas Emperador Combinado 109g', '14.88', '18.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(57, 18, '7500478022502', 'Emperador Gamesa Galletas Tipo Sándwich Con Relleno Piruetas Sabor Limón 115g', 'Emperador Gamesa Galletas Tipo Sándwich Con Relleno Piruetas Sabor Limón 115g', '14.64', '18.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(58, 18, '7500478022519', 'Emperador Gamesa Galletas Tipo Sandwich Con Relleno Sabor Chocolate 109g', 'Emperador Gamesa Galletas Tipo Sandwich Con Relleno Sabor Chocolate 109g', '14.39', '18.00', '5.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(59, 3, '7500478024803', 'Cheetos Botana Extruida De Sémola De Maíz Sabor Queso Y Chile 44g', 'Cheetos Botana Extruida De Sémola De Maíz Sabor Queso Y Chile 44g', '7.64', '15.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(60, 3, '7500478024810', 'Cheetos Botana Extruida De Sémola De Maíz Sabor Queso, Chile Y Limón 44g', 'Cheetos Botana Extruida De Sémola De Maíz Sabor Queso, Chile Y Limón 44g', '7.64', '15.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(61, 3, '7500478024940', 'Doritos Sabritas Botana De Maiz Nixtamalizado Nachos Con Queso Sabor Chile 54g', 'Doritos Sabritas Botana De Maiz Nixtamalizado Nachos Con Queso Sabor Chile 54g', '7.64', '20.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(62, 18, '7500478034475', 'Doritos Botana Dinamita Flamin Hot 50g', 'Doritos Botana Dinamita Flamin Hot 50g', '7.64', '15.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(63, 18, '7500478035915', 'Marias Gamesa Galleta Azucaradas 140g', 'Marias Gamesa Galleta Azucaradas 140g', '15.76', '22.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(64, 18, '7500478043804', 'Emeprador Chocolate', 'Emeprador Chocolate', '0.00', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(65, 18, '75007614', 'Coca-Cola Regular Cola Botella 600ml Pet Nr', 'Coca-Cola Regular Cola Botella 600ml Pet Nr', '18.33', '22.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(66, 18, '7500810026014', ' Tortillas DeL Hogar 15 Piezas 300g', ' Tortillas DeL Hogar 15 Piezas 300g', '16.00', '18.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(67, 5, '7500810029183', 'PAN BLANCO BIMBO GRANDE 620G', 'PAN BLANCO BIMBO GRANDE 620G', '42.00', '50.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(68, 5, '7500810029954', 'PAN BLANCO BIMBO  CHICO 360g', 'PAN BLANCO BIMBO  CHICO 360g', '23.00', '26.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(69, 18, '7500810036624', 'TORTILLINAS TIA ROSA 382.5G', 'TORTILLINAS TIA ROSA 382.5G', '20.00', '25.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(70, 18, '7500829000043', 'Arroz 7 Semillas Super Extra 900gr', 'Arroz 7 Semillas Super Extra 900gr', '15.49', '20.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(71, 18, '7500829000074', 'Frijol Negro 7 Semillas 900gr', 'Frijol Negro 7 Semillas 900gr', '18.49', '23.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(72, 18, '7500829000081', 'Frijol Pinto 7 Semillas 900gr', 'Frijol Pinto 7 Semillas 900gr', '19.19', '23.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(73, 18, '7501000612130', 'Cremax Gamesa Galletas Tipo Wafer Con Relleno Sabor Chocolate 213g', 'Cremax Gamesa Galletas Tipo Wafer Con Relleno Sabor Chocolate 213g', '24.64', '32.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(74, 18, '7501000612147', 'Cremax Gamesa Galleta Tipo Wafer Con Relleno Sabor Fresa 213g', 'Cremax Gamesa Galleta Tipo Wafer Con Relleno Sabor Fresa 213g', '24.65', '32.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(75, 18, '7501000620630', 'MINI MAMUT PIEZA', 'MINI MAMUT PIEZA', '0.00', '2.00', '12.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(76, 18, '7501000635726', 'Arcoiris Gamesa Galleta Con Merengue Sabor Fresa, Vainilla Y Coco 75g', 'Arcoiris Gamesa Galleta Con Merengue Sabor Fresa, Vainilla Y Coco 75g', '13.52', '18.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(77, 18, '7501000912803', 'Nescafé Café 100% Puro Soluble 42g', 'Nescafé Café 100% Puro Soluble 42g', '37.00', '47.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(78, 18, '7501003110305', 'Mccormick Mostaza Preparada 220g', 'Mccormick Mostaza Preparada 220g', '20.00', '23.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(79, 18, '7501003300652', 'Mayonesa McCormick 105gr', 'Mayonesa McCormick 105gr', '15.92', '20.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(80, 18, '7501003303240', 'Mayonesa McCormick 228gr', 'Mayonesa McCormick 228gr', '28.18', '34.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(81, 18, '7501005106801', 'Maizena Fresa', 'Maizena Fresa', '11.30', '15.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(82, 18, '7501005106979', 'Maizena Vainilla', 'Maizena Vainilla', '11.30', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(83, 18, '7501005107013', ' Maizena Chocolate', ' Maizena Chocolate', '11.30', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(84, 18, '7501007455730', 'Ariel Detergente En Polvo Poder Y Cuidado 500g', 'Ariel Detergente En Polvo Poder Y Cuidado 500g', '22.45', '28.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(85, 18, '7501009600213', 'Aceite Maravilla Canola 900ml', 'Aceite Maravilla Canola 900ml', '33.25', '38.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(86, 18, '7501017003068', 'Vinagre La Costeña Blanco 1050ml', 'Vinagre La Costeña Blanco 1050ml', '13.08', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(87, 18, '7501017005024', 'Chiles En Rajas Costeña 220gr', 'Chiles En Rajas Costeña 220gr', '13.90', '19.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(88, 18, '7501017005345', 'La Costeña Ensalda De Verduras 220g', 'La Costeña Ensalda De Verduras 220g', '11.41', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(89, 18, '7501017005611', 'Pure Tomate Costeña 210gr', 'Pure Tomate Costeña 210gr', '8.58', '12.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(90, 18, '7501017006014', 'Chiles En Rajas Costeña', 'Chiles En Rajas Costeña', '8.20', '12.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(91, 18, '7501018310011', 'Sopa Moderna Fideo 0 200gr', 'Sopa Moderna Fideo 0 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(92, 18, '7501018310035', 'Sopa Moderna Fideo 2 200gr', 'Sopa Moderna Fideo 2 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(93, 18, '7501018310042', 'Pasta Moderna Tallarin 1 200gr', 'Pasta Moderna Tallarin 1 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(94, 18, '7501018310103', 'Pasta Moderna Spaghetti 200gr', 'Pasta Moderna Spaghetti 200gr', '6.55', '11.00', '5.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(95, 18, '7501018310233', 'Sopa Moderna Lengua 200gr', 'Sopa Moderna Lengua 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(96, 18, '7501018310240', 'Sopa Moderna Ojito 200gr', 'Sopa Moderna Ojito 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(97, 18, '7501018310257', 'Sopa Moderna Letra 200gr', 'Sopa Moderna Letra 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(98, 18, '7501018310264', 'Sopa Moderna Municion 200gr', 'Sopa Moderna Municion 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(99, 18, '7501018310295', 'Sopa Moderna Lenteja 200gr', 'Sopa Moderna Lenteja 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(100, 18, '7501018310318', 'Sopa Moderna Estrella 200gr', 'Sopa Moderna Estrella 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(101, 18, '7501018310516', 'Sopa Moderna Codo 1 200gr', 'Sopa Moderna Codo 1 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(102, 18, '7501018310523', 'Sopa Moderna Codo 2 200gr', 'Sopa Moderna Codo 2 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(103, 18, '7501018310530', 'Sopa Moderna Codo 3 200gr', 'Sopa Moderna Codo 3 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(104, 18, '7501018310547', 'Sopa Moderna Codo 4 200gr', 'Sopa Moderna Codo 4 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(105, 18, '7501018310554', 'Sopa Caracol 1 200gr', 'Sopa Caracol 1 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(106, 18, '7501018310561', 'Sopa Moderna Caracol 2 200gr', 'Sopa Moderna Caracol 2 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(107, 18, '7501018310578', 'Sopa Moderna Caracol 3 200gr', 'Sopa Moderna Caracol 3 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(108, 18, '7501018310585', 'Sopa Moderna Engrane 200gr', 'Sopa Moderna Engrane 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(109, 18, '7501018310592', 'Pasta Moderna Tornillo Rotini 200gr', 'Pasta Moderna Tornillo Rotini 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(110, 18, '7501018310608', 'Sopa La Moderna Pluma 200gr', 'Sopa La Moderna Pluma 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(111, 18, '7501018310745', 'Sopa Moderna Almeja 200gr', 'Sopa Moderna Almeja 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(112, 18, '7501018310752', 'Sopa Moderna Moñito 200gr', 'Sopa Moderna Moñito 200gr', '6.55', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(113, 18, '7501018311353', 'Pasta Moderna Spaguetti 500gr', 'Pasta Moderna Spaguetti 500gr', '17.76', '23.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(114, 18, '7501019006623', 'Toalla Fem Saba Noct Noche 8pza', 'Toalla Fem Saba Noct Noche 8pza', '20.33', '25.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(115, 18, '7501020540666', 'Formula Láctea Nutri 1l', 'Formula Láctea Nutri 1l', '18.50', '24.00', '6.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(116, 3, '7501020550986', 'Leche Lala 100 Sin Lactosa 1L', 'Leche Lala 100 Sin Lactosa 1L', '38.41', '45.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(117, 18, '7501023318040', 'Chile Chipotle San Marcos 215gr', 'Chile Chipotle San Marcos 215gr', '27.50', '34.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(118, 18, '7501023318057', 'Chiles Chipotle San Marcos 100gr', 'Chiles Chipotle San Marcos 100gr', '14.25', '19.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(119, 18, '7501025403485', 'Pinol Original 828ml', 'Pinol Original 828ml', '22.90', '29.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(120, 18, '7501025405151', 'CLORALEX GEL 950ML', 'CLORALEX GEL 950ML', '22.40', '24.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(121, 18, '7501025445485', 'Pinol Limpiador Multiusos Repelente Con Aceite De Pino 828ml', 'Pinol Limpiador Multiusos Repelente Con Aceite De Pino 828ml', '31.08', '38.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(122, 18, '7501025450144', 'Ensueño Suavizante De Telas Max Frescura Primaveral Cont. 1lt', 'Ensueño Suavizante De Telas Max Frescura Primaveral Cont. 1lt', '20.65', '25.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(123, 18, '7501026004605', 'Roma Detergente 1kg', 'Roma Detergente 1kg', '39.75', '45.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(124, 18, '7501026004612', 'Roma Detergente Biodegradable 500g', 'Roma Detergente Biodegradable 500g', '20.00', '23.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(125, 18, '7501026005381', 'Zote Jabón Color Blanco 200g', 'Zote Jabón Color Blanco 200g', '11.79', '15.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(126, 18, '7501026005688', 'Zote Jabón Color Rosa 200g', 'Zote Jabón Color Rosa 200g', '11.79', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(127, 18, '7501030490937', 'Canelitas Marinela Galletas Con Canela 180g', 'Canelitas Marinela Galletas Con Canela 180g', '20.88', '25.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(128, 18, '7501030491057', 'Triki-Trakes Marinela Galleta Con Chispas Sabor Chocolate 170g', 'Triki-Trakes Marinela Galleta Con Chispas Sabor Chocolate 170g', '20.87', '25.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(129, 18, '7501030491071', 'Príncipe Marinela Galleta Sándwich Con Relleno Sabor Chocolate 147g', 'Príncipe Marinela Galleta Sándwich Con Relleno Sabor Chocolate 147g', '20.87', '25.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(130, 3, '7501032300104', 'Danone Yoghurt Para Beber Licuado Con Fresa, Plátano Y Cereal 435g', 'Danone Yoghurt Para Beber Licuado Con Fresa, Plátano Y Cereal 435g', '15.78', '20.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(131, 18, '7501032397609', 'Danonino 168g', 'Danonino 168g', '4.30', '10.00', '11.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(132, 18, '7501035903029', 'Suavitel Cuidado Superior Acondicionador De Telas Fresca Primavera', 'Suavitel Cuidado Superior Acondicionador De Telas Fresca Primavera', '25.00', '28.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(133, 18, '7501035910034', 'Fabuloso Fresca Lavanda 1l', 'Fabuloso Fresca Lavanda 1l', '23.58', '26.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(134, 18, '7501039122846', 'Aceite Nutrioli 800ml', 'Aceite Nutrioli 800ml', '36.88', '46.00', '5.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(135, 18, '7501039123065', 'Aceite Vegetal Ave 800ml', 'Aceite Vegetal Ave 800ml', '30.18', '36.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(136, 4, '7501040009754', 'Fud Salchichas Viena 266g', 'Fud Salchichas Viena 266g', '23.50', '30.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(137, 18, '7501045404400', 'El Dorado Atún En Agua 130g', 'El Dorado Atún En Agua 130g', '13.21', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(138, 18, '7501045404417', 'El Dorado Atún En Agua Con Aceite 130g', 'El Dorado Atún En Agua Con Aceite 130g', '13.21', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(139, 18, '7501048103010', 'Aceite Canoil 946ml', 'Aceite Canoil 946ml', '44.08', '48.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(140, 18, '7501052411804', 'Legal Cafe Soluble 50g', 'Legal Cafe Soluble 50g', '33.00', '36.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(141, 18, '7501052420165', 'Frijol La Sierra Refrito Negro Bolsa', 'Frijol La Sierra Refrito Negro Bolsa', '13.50', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(142, 18, '7501052420172', 'Frijol La Sierra Refrito Bayo Bolsa', 'Frijol La Sierra Refrito Bayo Bolsa', '13.50', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(143, 18, '7501052424033', 'Frijol La Sierra Refrito Bayo 440gr', 'Frijol La Sierra Refrito Bayo 440gr', '11.33', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(144, 18, '7501052472102', 'Salsa Catsup Clemente 340gr', 'Salsa Catsup Clemente 340gr', '15.63', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(145, 18, '7501052474069', 'Clemente Jacques Mermelada De Fresa 270g', 'Clemente Jacques Mermelada De Fresa 270g', '22.90', '29.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(146, 18, '7501052474076', 'Mermelada Clemente Fresa', 'Mermelada Clemente Fresa', '37.00', '41.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(147, 18, '7501054909644', 'Tostadas Del Barrio 300gr', 'Tostadas Del Barrio 300gr', '24.03', '29.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(148, 18, '7501055302925', 'Coca-Cola Refresco Original Reducido En Azúcar 2l', 'Coca-Cola Refresco Original Reducido En Azúcar 2l', '36.43', '44.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(149, 18, '7501055304653', 'Delaware Punch Uva 600ml', 'Delaware Punch Uva 600ml', '16.48', '20.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(150, 18, '7501055304745', 'Coca-Cola Refresco Reducido En Azúcar 3l', 'Coca-Cola Refresco Reducido En Azúcar 3l', '42.20', '50.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(151, 18, '7501055305629', 'Sprite Refresco Sabor Lima-Limón Lima-Limón 600ml', 'Sprite Refresco Sabor Lima-Limón Lima-Limón 600ml', '17.12', '20.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(152, 18, '7501055330812', 'JUGO DEL VALLE 3 LITROS', 'JUGO DEL VALLE 3 LITROS', '29.70', '40.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(153, 18, '7501055339983', 'Sidral Mundet Refresco Manzana Pet 600ml', 'Sidral Mundet Refresco Manzana Pet 600ml', '16.57', '20.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(154, 18, '7501055361540', 'Refresco Coca-Cola Original 355ml', 'Refresco Coca-Cola Original 355ml', '18.40', '22.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(155, 18, '7501055367825', 'LECHITAS SANTA CLARA VAINILLA', 'LECHITAS SANTA CLARA VAINILLA', '0.00', '9.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(156, 18, '7501055367856', 'LECHITA SANTA CLARA FRESA', 'LECHITA SANTA CLARA FRESA', '0.00', '9.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(157, 18, '7501055399635', 'LECHITA SANTA CLARA GALLETA', 'LECHITA SANTA CLARA GALLETA', '0.00', '9.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(158, 18, '7501055900039', 'ALPURA CLASICA 1L', 'ALPURA CLASICA 1L', '25.00', '29.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(159, 18, '7501055900046', 'ALPURA SEMI 1L', 'ALPURA SEMI 1L', '26.00', '30.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(160, 18, '7501055901425', 'ALPURA DESLACTOSADA 1L', 'ALPURA DESLACTOSADA 1L', '27.00', '32.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(161, 3, '7501055912391', 'Alpura Yoghurt Fresa 125g', 'Alpura Yoghurt Fresa 125g', '6.59', '10.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(162, 3, '7501055912414', 'Alpura Yoghurt Durazno 125g', 'Alpura Yoghurt Durazno 125g', '6.59', '10.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(163, 3, '7501055912438', 'Alpura Yoghurt Manzana 125g', 'Alpura Yoghurt Manzana 125g', '6.59', '10.00', '4.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(164, 3, '7501055912476', 'Alpura Yoghurt Zarzamora 125g', 'Alpura Yoghurt Zarzamora 125g', '6.59', '10.00', '4.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(165, 3, '7501055914630', 'Alpura Yoghurt Con Fresa Y Zarzamora Bebible 220g', 'Alpura Yoghurt Con Fresa Y Zarzamora Bebible 220g', '10.40', '14.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(166, 3, '7501055914807', 'Alpura Yoghurt Bebible Con Fresa Coco 220g', 'Alpura Yoghurt Bebible Con Fresa Coco 220g', '10.40', '14.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(167, 3, '7501055914814', 'Alpura Yoghurt Bebible Con Piña Coco 220g', 'Alpura Yoghurt Bebible Con Piña Coco 220g', '10.40', '14.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(168, 3, '7501055914821', 'Alpura Yoghurt Bebible Con Manzana Natural 220gr', 'Alpura Yoghurt Bebible Con Manzana Natural 220gr', '10.40', '14.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(169, 3, '7501055914838', 'Bebible Alpura Yoghurt Con Durazno Bebible 220g', 'Bebible Alpura Yoghurt Con Durazno Bebible 220g', '10.40', '14.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(170, 3, '7501055914845', 'Bebible Alpura Yoghurt Con Fresa Bebible 220g 220.00g', 'Bebible Alpura Yoghurt Con Fresa Bebible 220g 220.00g', '10.40', '14.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(171, 18, '7501055915668', 'ALPURA VAQUITA SABOR CHOCOLATE 200ML', 'ALPURA VAQUITA SABOR CHOCOLATE 200ML', '10.00', '12.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(172, 18, '7501055915682', 'ALPURA VAQUITA SABOR FRESA 200ML', 'ALPURA VAQUITA SABOR FRESA 200ML', '10.00', '12.00', '9.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(173, 3, '7501055916016', 'Alpura Crema De Leche De Vaca Acidifacada 426ml', 'Alpura Crema De Leche De Vaca Acidifacada 426ml', '34.00', '40.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(174, 18, '7501055918812', 'ALPURA VAQUITA SABOR TRIPLE CHOCOLATE 200ML', 'ALPURA VAQUITA SABOR TRIPLE CHOCOLATE 200ML', '10.00', '12.00', '6.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(175, 3, '7501055919390', 'Alpura Crema De Leche De Vaca Acidificada, Pasteurizada 190ml', 'Alpura Crema De Leche De Vaca Acidificada, Pasteurizada 190ml', '16.53', '22.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(176, 3, '7501058611062', 'Leche Evaporada Clavel', 'Leche Evaporada Clavel', '19.53', '25.00', '5.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(177, 3, '7501059211209', 'Leche La Lechera 100g', 'Leche La Lechera 100g', '10.13', '13.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(178, 18, '7501064112546', 'Modelo Especial Cerveza Clara 355ml', 'Modelo Especial Cerveza Clara 355ml', '17.71', '22.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(179, 18, '7501064191886', 'Modelo Cerveza Clara Especial 473ml', 'Modelo Cerveza Clara Especial 473ml', '21.67', '26.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(180, 18, '7501069210179', 'Harina Hot Cakes 3 Estrellas', 'Harina Hot Cakes 3 Estrellas', '20.66', '28.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(181, 18, '7501069210766', 'Harina De Arroz 3 Estrellas 250gr', 'Harina De Arroz 3 Estrellas 250gr', '13.51', '17.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(182, 18, '7501071120305', 'Squirt Refresco Toronja 3l', 'Squirt Refresco Toronja 3l', '36.99', '40.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(183, 18, '7501071305153', 'Arroz Super Extra Verde Valle 500gr', 'Arroz Super Extra Verde Valle 500gr', '18.00', '18.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(184, 18, '7501073800908', 'Peñafiel Agua Mineral  2LITROS', 'Peñafiel Agua Mineral  2LITROS', '23.00', '28.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(185, 18, '7501073830509', 'AGUA MINERAL PEÑAFIL 600ML', 'AGUA MINERAL PEÑAFIL 600ML', '0.00', '22.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(186, 18, '7501073839854', 'Peñafiel Agua MineraL Naranja 600ml', 'Peñafiel Agua MineraL Naranja 600ml', '15.00', '18.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(187, 18, '7501073839885', 'Peñafiel Agua Mineral Limón 600ml', 'Peñafiel Agua Mineral Limón 600ml', '15.00', '18.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(188, 18, '7501079702817', 'Pure De Tomate Del Fuerte 210gr', 'Pure De Tomate Del Fuerte 210gr', '7.80', '11.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(189, 18, '7501125104268', 'Electrolit Suero Rehidratante Sabor Fresa 625mm', 'Electrolit Suero Rehidratante Sabor Fresa 625mm', '20.29', '24.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(190, 18, '7501125104343', 'Electrolit Suero Rehidratante Manzana', 'Electrolit Suero Rehidratante Manzana', '20.29', '24.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(191, 18, '7501125144851', 'Suero Rehidratante Electrolit 625m', 'Suero Rehidratante Electrolit 625m', '20.29', '24.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(192, 18, '7501125174797', 'Suero Rehidratante Electrolit 625m', 'Suero Rehidratante Electrolit 625m', '20.29', '24.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(193, 3, '7501295600126', 'Leche Entera Santa Clara 1L', 'Leche Entera Santa Clara 1L', '25.90', '33.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(194, 3, '7501295600157', 'LECHE SANTA CLARA DESLACTOSADA', 'LECHE SANTA CLARA DESLACTOSADA', '29.50', '35.00', '4.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(195, 18, '7501431203297', '7503008370388', '7503008370388', '12.38', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(196, 18, '7501431204799', 'Vaso Fun Fun 8oz 50pzas', 'Vaso Fun Fun 8oz 50pzas', '20.52', '28.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(197, 18, '7501431204805', 'Vaso Térmico Fun & Fun 10oz 25pzas', 'Vaso Térmico Fun & Fun 10oz 25pzas', '11.87', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(198, 18, '7501696252627', 'Aceite El Olivo Puro 45ml', 'Aceite El Olivo Puro 45ml', '6.55', '16.00', '12.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(199, 18, '7501943424562', 'Toalla Fem Kotex Reg 10pza', 'Toalla Fem Kotex Reg 10pza', '15.94', '19.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(200, 18, '7502238610059', 'Tenedor Chico Max 50pzas', 'Tenedor Chico Max 50pzas', '12.03', '16.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(201, 18, '7503006897030', 'Red Cola 2lt', 'Red Cola 2lt', '0.00', '28.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(202, 18, '7503006897214', 'JARRITO MANZANA 2LITROS', 'JARRITO MANZANA 2LITROS', '20.00', '26.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(203, 18, '7503008370364', 'Cuchara ChIca Desechable Fun Fun 50pz', 'Cuchara ChIca Desechable Fun Fun 50pz', '10.00', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(204, 18, '7503008370371', 'Tenedor Grande Fun Fun 25pz', 'Tenedor Grande Fun Fun 25pz', '13.53', '17.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(205, 18, '7503008370388', 'Cuchara Grande Fun Fun', 'Cuchara Grande Fun Fun', '13.50', '18.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(206, 18, '7503021589101', 'Papel Aluminio Fun And Fun 5m', 'Papel Aluminio Fun And Fun 5m', '13.40', '17.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(207, 18, '7503023836142', 'Vualá  Sabor Chocolate 5.00pz', 'Vualá  Sabor Chocolate 5.00pz', '10.00', '22.00', '4.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(208, 18, '7503027158035', 'Tostadas Charras Amarillas 250g', 'Tostadas Charras Amarillas 250g', '29.26', '35.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(209, 18, '7503032676012', 'SQUIRT TORONJA 600ML', 'SQUIRT TORONJA 600ML', '0.00', '21.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(210, 18, '7503049695150', 'Agua Doña Vita 1.5L', 'Agua Doña Vita 1.5L', '5.71', '13.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(211, 18, '7506192505802', 'Consome Rico Pollo', 'Consome Rico Pollo', '3.38', '5.00', '20.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(212, 18, '7506425605330', 'Vogue Papel Higiénico 600hojas Con Aroma A Manzanilla', 'Vogue Papel Higiénico 600hojas Con Aroma A Manzanilla', '34.65', '42.00', '5.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(213, 3, '7506443105713', 'Yoghurt Para Beber Saborizado Beneg', 'Yoghurt Para Beber Saborizado Beneg', '16.29', '20.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(214, 3, '7506475104722', 'Leche La Lechera 375g', 'Leche La Lechera 375g', '26.19', '28.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(215, 18, '750852366', 'SIDRAL MUNDET MANZANA 2LITROS', 'SIDRAL MUNDET MANZANA 2LITROS', '25.00', '30.00', '0.000', '0.000', 0, 'UNIDAD', '2026-07-18 22:04:21'),
(216, 18, '7509546008202', 'Fabuloso energía Naranja 1L', 'Fabuloso energía Naranja 1L', '23.58', '26.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(217, 18, '7509546051956', 'Fabuloso Fresca Primavera AZUL 1L', 'Fabuloso Fresca Primavera AZUL 1L', '23.58', '26.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(218, 18, '7509546680118', 'Suavitel Anochecer 700ml', 'Suavitel Anochecer 700ml', '21.62', '26.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(219, 18, '7509546680132', 'Suavitel Fresca Primavera', 'Suavitel Fresca Primavera', '21.62', '26.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(220, 18, '7509546689487', 'Suavizante Suavitel Momentos Mágicos Abrazo De Amor 650ml', 'Suavizante Suavitel Momentos Mágicos Abrazo De Amor 650ml', '20.99', '26.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(221, 18, '752216051047', 'Jaguar Plato Term Pastel 6c20', 'Jaguar Plato Term Pastel 6c20', '8.12', '10.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(222, 18, '752216092163', 'Jaguar Plato Desechable Charola 18x23 #9d C/div Jaguar 20pzas', 'Jaguar Plato Desechable Charola 18x23 #9d C/div Jaguar 20pzas', '16.94', '22.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(223, 18, '752216095157', 'Vaso Jaguar #10pak C 50', 'Vaso Jaguar #10pak C 50', '28.47', '35.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(224, 18, '758104007516', 'AGUA BONABONT 500ML', 'AGUA BONABONT 500ML', '0.00', '10.00', '13.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(225, 18, '7622210529220', 'Chicle Bubbaloo', 'Chicle Bubbaloo', '1.00', '2.00', '29.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(226, 18, '7713042173283', 'Servilleta La Prueba Chica 125hojas', 'Servilleta La Prueba Chica 125hojas', '7.73', '12.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(227, 18, '7713042198729', 'Familiar Servilletas 23x24cm 400pz(s)', 'Familiar Servilletas 23x24cm 400pz(s)', '21.82', '27.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(228, 18, '793573950079', 'Red 3lt.', 'Red 3lt.', '249.00', '36.00', '6.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(229, 18, '813962512036', '7501055919390', '7501055919390', '2.83', '7.00', '10.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(230, 18, '86141002523', 'Te Limon La Pastora 20 Sobres', 'Te Limon La Pastora 20 Sobres', '0.00', '3.00', '20.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(231, 18, '8719200450615', 'Iberia Margarina Pasteurizada Sin Sal 90g', 'Iberia Margarina Pasteurizada Sin Sal 90g', '8.32', '15.00', '3.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(232, 18, '94331421313', 'Avena Granvita 400gr', 'Avena Granvita 400gr', '11.07', '14.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(233, 18, '97339000054', 'Salsa Valentina Roja 370ml', 'Salsa Valentina Roja 370ml', '14.00', '15.00', '2.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(234, 18, '987', 'PALANQUETA PIEZA', 'PALANQUETA PIEZA', '0.00', '2.00', '25.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(235, 4, '9900158010351', 'Chorizo Bolona', 'Chorizo Bolona', '106.50', '140.00', '500.900', '0.000', 1, 'GRANEL', '2026-07-18 22:04:21'),
(236, 3, '999663', 'QUESO RANCHERO', 'QUESO RANCHERO', '0.00', '36.00', '1.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(237, 18, '999999', 'TOALLA SANITARIA SUELTAS', 'TOALLA SANITARIA SUELTAS', '0.00', '5.00', '29.000', '0.000', 1, 'UNIDAD', '2026-07-18 22:04:21'),
(238, 1, '9999999999', 'PRODUCTO TEST UTF8 ÑÁÉÍÓÚ', 'TEST', '10.00', '10.00', '10.000', '1.000', 1, 'UNIDAD', '2026-07-19 10:48:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_movimientos`
--

CREATE TABLE `productos_movimientos` (
  `idMovimiento` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `tipo` enum('ALTA','ENTRADA','SALIDA','AJUSTE','VENTA','DEVOLUCION') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `stockAnterior` decimal(10,3) NOT NULL,
  `stockNuevo` decimal(10,3) NOT NULL,
  `motivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaMovimiento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos_movimientos`
--

INSERT INTO `productos_movimientos` (`idMovimiento`, `idProducto`, `idUsuario`, `tipo`, `cantidad`, `stockAnterior`, `stockNuevo`, `motivo`, `fechaMovimiento`) VALUES
(1, 148, 1, 'VENTA', '1.000', '3.000', '2.000', 'Venta POS', '2026-07-21 22:47:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreUsuarios` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '../../dist/img/user.png',
  `nivel` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fechaNac` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `contrasena`, `nombreUsuarios`, `foto`, `nivel`, `estado`, `fechaNac`, `created_at`) VALUES
(1, 'admin', 'admin123', 'ADMINISTRADOR', '../../dist/img/user.png', 1, 1, '1995-10-05', '2026-07-16 15:15:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(10) UNSIGNED NOT NULL,
  `folio` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCaja` int(10) UNSIGNED DEFAULT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `recibido` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cambio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `estado` enum('ACTIVA','CANCELADA') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVA',
  `fechaVenta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `metodoPago` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EFECTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `folio`, `idCaja`, `idUsuario`, `total`, `recibido`, `cambio`, `estado`, `fechaVenta`, `metodoPago`) VALUES
(1, 'V20260721234736', 1, 1, '44.00', '50.00', '6.00', 'ACTIVA', '2026-07-21 23:47:36', 'EFECTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle`
--

CREATE TABLE `ventas_detalle` (
  `idDetalleVenta` int(10) UNSIGNED NOT NULL,
  `idVenta` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `cantidad` decimal(10,3) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`idDetalleVenta`, `idVenta`, `idProducto`, `cantidad`, `precioUnitario`, `subtotal`) VALUES
(1, 1, 148, '1.000', '44.00', '44.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`idCaja`),
  ADD KEY `idx_cajas_usuario` (`idUsuario`),
  ADD KEY `idx_cajas_estado` (`estado`);

--
-- Indices de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD PRIMARY KEY (`idCajaMovimiento`),
  ADD KEY `idx_caja_mov_caja` (`idCaja`),
  ADD KEY `idx_caja_mov_usuario` (`idUsuario`),
  ADD KEY `idx_caja_mov_tipo` (`tipo`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `uk_categorias_nombre` (`categoriaNombre`),
  ADD KEY `idx_categorias_estado` (`estado`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cortes_caja`
--
ALTER TABLE `cortes_caja`
  ADD PRIMARY KEY (`idCorteCaja`),
  ADD KEY `idx_corte_caja` (`idCaja`),
  ADD KEY `idx_corte_usuario` (`idUsuario`),
  ADD KEY `idx_corte_fecha` (`fechaCorte`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `idx_devoluciones_venta` (`id_venta`),
  ADD KEY `idx_devoluciones_producto` (`id_producto`),
  ADD KEY `idx_devoluciones_usuario` (`idUsuario`),
  ADD KEY `idx_devoluciones_fecha` (`fecha`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `uk_productos_codigo` (`codigoBarras`),
  ADD KEY `idx_productos_categoria` (`idCategoria`),
  ADD KEY `idx_productos_nombre` (`nombre`),
  ADD KEY `idx_productos_estado` (`estado`);

--
-- Indices de la tabla `productos_movimientos`
--
ALTER TABLE `productos_movimientos`
  ADD PRIMARY KEY (`idMovimiento`),
  ADD KEY `idx_mov_producto` (`idProducto`),
  ADD KEY `idx_mov_usuario` (`idUsuario`),
  ADD KEY `idx_mov_tipo` (`tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `uk_usuarios_usuario` (`usuario`),
  ADD KEY `idx_usuarios_estado` (`estado`),
  ADD KEY `idx_usuarios_nivel` (`nivel`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD UNIQUE KEY `uk_ventas_folio` (`folio`),
  ADD KEY `idx_ventas_usuario` (`idUsuario`),
  ADD KEY `idx_ventas_caja` (`idCaja`),
  ADD KEY `idx_ventas_fecha` (`fechaVenta`);

--
-- Indices de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD PRIMARY KEY (`idDetalleVenta`),
  ADD KEY `idx_detalle_venta` (`idVenta`),
  ADD KEY `idx_detalle_producto` (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `idCaja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  MODIFY `idCajaMovimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cortes_caja`
--
ALTER TABLE `cortes_caja`
  MODIFY `idCorteCaja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id_devolucion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT de la tabla `productos_movimientos`
--
ALTER TABLE `productos_movimientos`
  MODIFY `idMovimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  MODIFY `idDetalleVenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `fk_cajas_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD CONSTRAINT `fk_caja_mov_caja` FOREIGN KEY (`idCaja`) REFERENCES `cajas` (`idCaja`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_caja_mov_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `cortes_caja`
--
ALTER TABLE `cortes_caja`
  ADD CONSTRAINT `fk_corte_caja` FOREIGN KEY (`idCaja`) REFERENCES `cajas` (`idCaja`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_corte_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `fk_devoluciones_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_devoluciones_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_devoluciones_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`idVenta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_movimientos`
--
ALTER TABLE `productos_movimientos`
  ADD CONSTRAINT `fk_mov_producto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_caja` FOREIGN KEY (`idCaja`) REFERENCES `cajas` (`idCaja`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ventas_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
