-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2025 a las 01:55:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda24`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_tienda`
--

CREATE TABLE `datos_tienda` (
  `id_datos_tienda` int(5) NOT NULL,
  `nombre_tienda` varchar(35) DEFAULT NULL,
  `rfc` varchar(10) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `cod_postal` int(5) DEFAULT NULL,
  `telefono_tienda` varchar(15) DEFAULT NULL,
  `correo` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datos_tienda`
--

INSERT INTO `datos_tienda` (`id_datos_tienda`, `nombre_tienda`, `rfc`, `direccion`, `cod_postal`, `telefono_tienda`, `correo`) VALUES
(1, 'Tienda 24', 'LOCI930402', 'Av. las flores\r\nMunicipio urubamba', 56625, '5587676241', 'tienda24@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(5) NOT NULL,
  `nombre_dept` varchar(35) DEFAULT NULL,
  `descripcion_dept` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre_dept`, `descripcion_dept`) VALUES
(1, 'LIMPIEZA', 'DETERGENTES, PAPEL, ETC'),
(2, 'ABARROTES', 'CANASTA BáSICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(5) NOT NULL,
  `nombre_producto` varchar(35) DEFAULT NULL,
  `codigo_producto` int(15) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `existencias_prod` int(5) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `precio_u` decimal(5,1) DEFAULT NULL,
  `precio` decimal(5,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre_producto`, `codigo_producto`, `descripcion`, `existencias_prod`, `id_departamento`, `precio_u`, `precio`) VALUES
(1, 'PAPEL', 21212, 'PAPEL REGIO 4 ROLLOS', 2, 1, '10.1', '15.1'),
(2, 'SALSA', 23233, 'SALSA VALENTINA 500GR', 5, 2, '8.5', '12.5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(5) NOT NULL,
  `rol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `rol`) VALUES
(1, 'administrador'),
(2, 'cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(5) NOT NULL,
  `nombre_usuario` varchar(30) DEFAULT NULL,
  `apaterno` varchar(30) DEFAULT NULL,
  `amaterno` varchar(30) DEFAULT NULL,
  `fnacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(35) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `id_tipo_usuario` int(11) DEFAULT NULL,
  `id_datos_tienda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apaterno`, `amaterno`, `fnacimiento`, `telefono`, `correo`, `usuario`, `password`, `id_tipo_usuario`, `id_datos_tienda`) VALUES
(1, 'ING. JOSÉ', 'ROJAS', 'CUSI', '1999-04-02', '5533958818', 'lc.ismael@hotmail.com', 'admintd24', '12345', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(10) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `id_usuario`) VALUES
(1, '2016-01-08 07:43:58', NULL),
(2, '2016-01-08 08:08:55', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `id` int(10) NOT NULL,
  `idventa` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `precio` decimal(6,2) DEFAULT NULL,
  `subtotal` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`id`, `idventa`, `idproducto`, `cantidad`, `precio`, `subtotal`) VALUES
(1, 1, 1, 2, '15.10', '30.20'),
(2, 1, 2, 1, '12.50', '12.50'),
(3, 2, 1, 3, '15.10', '45.30'),
(4, 2, 2, 1, '12.50', '12.50');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datos_tienda`
--
ALTER TABLE `datos_tienda`
  ADD PRIMARY KEY (`id_datos_tienda`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `datos_tienda`
--
ALTER TABLE `datos_tienda`
  MODIFY `id_datos_tienda` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
