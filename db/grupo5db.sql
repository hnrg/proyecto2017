-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 01-10-2017 a las 23:00:52
-- Versión del servidor: 5.7.19
-- Versión de PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `grupo5db`
--
CREATE DATABASE IF NOT EXISTS `grupo5db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `grupo5db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controles_de_salud`
--
-- Creación: 01-10-2017 a las 23:00:34
--

DROP TABLE IF EXISTS `controles_de_salud`;
CREATE TABLE `controles_de_salud` (
  `id` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `peso` int(11) NOT NULL,
  `vacunas_completas` tinyint(1) NOT NULL,
  `maduracion_acorde` tinyint(1) NOT NULL,
  `ex_fisico_normal` tinyint(1) NOT NULL,
  `ex_fisico_observaciones` varchar(255) NOT NULL,
  `pc` int(11) DEFAULT NULL,
  `ppc` int(11) DEFAULT NULL,
  `talla` int(11) DEFAULT NULL,
  `alimentacion` varchar(255) NOT NULL,
  `observaciones_generales` varchar(255) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_demograficos`
--
-- Creación: 01-10-2017 a las 23:00:34
--

DROP TABLE IF EXISTS `datos_demograficos`;
CREATE TABLE `datos_demograficos` (
  `id` int(11) NOT NULL,
  `heladera` tinyint(1) NOT NULL DEFAULT '0',
  `electricidad` tinyint(1) NOT NULL DEFAULT '0',
  `mascota` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Para vos Ulises',
  `tipo_vivienda_id` int(11) NOT NULL,
  `tipo_calefaccion_id` int(11) NOT NULL,
  `tipo_agua_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras_sociales`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `obras_sociales`;
CREATE TABLE `obras_sociales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `domicilio` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `fecha_nac` date NOT NULL,
  `genero` tinytext NOT NULL,
  `datos_demograficos_id` int(11) NOT NULL,
  `obra_social_id` int(11) NOT NULL,
  `tipo_doc_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_tiene_permisos`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `rol_tiene_permisos`;
CREATE TABLE `rol_tiene_permisos` (
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documento`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `tipos_documento`;
CREATE TABLE `tipos_documento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_agua`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `tipo_agua`;
CREATE TABLE `tipo_agua` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_calefaccion`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `tipo_calefaccion`;
CREATE TABLE `tipo_calefaccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vivienda`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `tipo_vivienda`;
CREATE TABLE `tipo_vivienda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 01-10-2017 a las 23:00:35
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tiene_roles`
--
-- Creación: 01-10-2017 a las 23:00:36
--

DROP TABLE IF EXISTS `usuario_tiene_roles`;
CREATE TABLE `usuario_tiene_roles` (
  `usuario_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `controles_de_salud`
--
ALTER TABLE `controles_de_salud`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `paciente_id` (`paciente_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `datos_demograficos`
--
ALTER TABLE `datos_demograficos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo_vivienda_id` (`tipo_vivienda_id`),
  ADD UNIQUE KEY `tipo_calefaccion_id` (`tipo_calefaccion_id`),
  ADD UNIQUE KEY `tipo_agua_id` (`tipo_agua_id`);

--
-- Indices de la tabla `obras_sociales`
--
ALTER TABLE `obras_sociales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `datos_demograficos_id` (`datos_demograficos_id`),
  ADD UNIQUE KEY `obra_social_id` (`obra_social_id`),
  ADD UNIQUE KEY `tipo_doc_id` (`tipo_doc_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol_tiene_permisos`
--
ALTER TABLE `rol_tiene_permisos`
  ADD UNIQUE KEY `rol_id` (`rol_id`),
  ADD UNIQUE KEY `permiso_id` (`permiso_id`);

--
-- Indices de la tabla `tipos_documento`
--
ALTER TABLE `tipos_documento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tipo_agua`
--
ALTER TABLE `tipo_agua`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_calefaccion`
--
ALTER TABLE `tipo_calefaccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `usuario_tiene_roles`
--
ALTER TABLE `usuario_tiene_roles`
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD UNIQUE KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `controles_de_salud`
--
ALTER TABLE `controles_de_salud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_demograficos`
--
ALTER TABLE `datos_demograficos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `obras_sociales`
--
ALTER TABLE `obras_sociales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_documento`
--
ALTER TABLE `tipos_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_agua`
--
ALTER TABLE `tipo_agua`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_calefaccion`
--
ALTER TABLE `tipo_calefaccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `obras_sociales`
--
ALTER TABLE `obras_sociales`
  ADD CONSTRAINT `obras_sociales_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pacientes` (`obra_social_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `controles_de_salud` (`paciente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`datos_demograficos_id`) REFERENCES `datos_demograficos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id`) REFERENCES `rol_tiene_permisos` (`rol_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol_tiene_permisos`
--
ALTER TABLE `rol_tiene_permisos`
  ADD CONSTRAINT `rol_tiene_permisos_ibfk_1` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipos_documento`
--
ALTER TABLE `tipos_documento`
  ADD CONSTRAINT `tipos_documento_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pacientes` (`tipo_doc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_agua`
--
ALTER TABLE `tipo_agua`
  ADD CONSTRAINT `tipo_agua_ibfk_1` FOREIGN KEY (`id`) REFERENCES `datos_demograficos` (`tipo_agua_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_calefaccion`
--
ALTER TABLE `tipo_calefaccion`
  ADD CONSTRAINT `tipo_calefaccion_ibfk_1` FOREIGN KEY (`id`) REFERENCES `datos_demograficos` (`tipo_calefaccion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_vivienda`
--
ALTER TABLE `tipo_vivienda`
  ADD CONSTRAINT `tipo_vivienda_ibfk_1` FOREIGN KEY (`id`) REFERENCES `datos_demograficos` (`tipo_vivienda_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id`) REFERENCES `controles_de_salud` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_tiene_roles`
--
ALTER TABLE `usuario_tiene_roles`
  ADD CONSTRAINT `usuario_tiene_roles_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_tiene_roles_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
