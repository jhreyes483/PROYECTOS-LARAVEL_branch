-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2023 a las 04:17:46
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `s_laravel_ficha`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` bigint UNSIGNED NOT NULL,
  `nom1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaNacimiento` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` blob NOT NULL,
  `password` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoDoc` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id_admin`, `nom1`, `nom2`, `ape1`, `ape2`, `estado`, `fechaNacimiento`, `genero`, `foto`, `password`, `tipoDoc`, `created_at`, `updated_at`, `url`, `email`) VALUES
(1, 'Javier Reyes', 'Sistema', 'Sena', 'ADSI', '0', '2021-02-15', '1', 0x73726665742e6a7067, '1', '1', '2021-02-18 02:04:18', '2021-02-06 18:28:55', NULL, 'jav-rn@hotmail.com'),
(2, 'Miguel', 'Miguel', 'Torres', 'Torres', '0', '2021-02-19', '0', 0x73726665742e6a7067, '2', '0', '2021-02-06 17:39:37', '2021-02-06 17:39:37', NULL, ''),
(3, 'Patricio', 'Rey', 'Pepinito', 'Torres', '0', '2021-02-19', '0', 0x2f746d702f7068707330714a3868, '2', '0', '2021-02-06 17:39:37', '2021-02-06 17:40:06', 'usuario/update/3', ''),
(4, 'Amin5', 'Admin5', 'Admin', 'Admion', '0', '2021-02-26', '0', 0x7573657256656e7461732e6a7067, '5', '0', '2021-02-06 19:45:26', '2021-02-06 19:45:26', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `id_aprendiz` bigint UNSIGNED NOT NULL,
  `nom1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaNacimiento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` blob NOT NULL,
  `tipoDoc` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_ficha` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`id_aprendiz`, `nom1`, `nom2`, `ape1`, `ape2`, `estado`, `correo`, `fechaNacimiento`, `genero`, `foto`, `tipoDoc`, `FK_ficha`, `created_at`, `updated_at`, `url`) VALUES
(1, 'Jhon', 'Roberth', 'Patiño', 'Pedroza', '1', 'jav-rn@hotmail.com', '2021-02-26', '0', 0x73726665742e6a7067, '0', 1, '2021-02-06 19:31:37', '2021-04-14 16:21:00', 'apr@endiz/update/3'),
(2, 'Michael', 'Adolfo', 'Quintanilla', 'Quesada', '1', 'usuario@outlook.com', '2021-02-26', '0', 0x433a5c78616d70705c746d705c706870464545322e746d70, '0', 3, '2021-02-06 19:31:38', '2021-02-06 19:31:38', NULL),
(3, 'Sandra', 'Milena', 'Quiroga', 'Perez', '1', 'perez-q@gmail.com', '2021-02-11', '1', 0x6d756a30312e6a7067, '0', 1, '2021-02-06 21:07:52', '2021-02-06 21:07:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE `ficha` (
  `id_ficha` bigint UNSIGNED NOT NULL,
  `No_ficha` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descrip` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FK_jornada` bigint UNSIGNED NOT NULL,
  `FK_prog` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ficha`
--

INSERT INTO `ficha` (`id_ficha`, `No_ficha`, `descrip`, `estado`, `FK_jornada`, `FK_prog`, `created_at`, `updated_at`, `url`) VALUES
(1, '18082822', 'Ficha de 31 alumnos de programacion', '1', 1, 1, '2021-02-05 07:44:43', '2021-02-05 08:02:59', NULL),
(2, '18087', 'Mecanica y electronica', '1', 2, 3, '2021-02-05 07:48:18', '2021-02-06 18:36:39', NULL),
(3, '19452', 'Redes de datos', '1', 1, 2, '2021-02-05 08:05:08', '2021-02-06 18:35:36', NULL),
(4, '1803186', 'Desarrollo de software', '0', 1, 1, '2021-02-06 17:05:49', '2021-02-06 17:05:49', NULL),
(5, '1804565', 'Administración de empresas', '0', 2, 6, '2021-02-07 14:16:12', '2021-02-07 14:16:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `id_instructor` bigint UNSIGNED NOT NULL,
  `nom1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaNacimiento` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` blob NOT NULL,
  `tipoDoc` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`id_instructor`, `nom1`, `nom2`, `ape1`, `ape2`, `estado`, `correo`, `fechaNacimiento`, `genero`, `foto`, `tipoDoc`, `created_at`, `updated_at`, `url`) VALUES
(1, 'Sandra', 'Daniela', 'torres', 'Daza', '1', 'sandra', '2021-02-24', '1', 0x757330332e6a7067, '1', '2021-02-06 17:21:35', '2021-02-06 17:21:35', NULL),
(2, 'Ana', 'Lisa', 'Torres', 'F', '1', 'tprr-rn@hotmail.com', '2021-02-21', '1', 0x6b656e64616c6c2e6a7067, '0', '2021-02-06 21:00:11', '2021-02-06 21:00:11', NULL),
(3, 'Milena', 'Daniela', 'Daza', 'Perez', '1', 'milena@hotmail.com', '2021-02-26', '1', 0x6865726d6f73612d666f746f2e6a7067, '0', '2021-02-06 21:04:04', '2021-02-06 21:04:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor_ficha`
--

CREATE TABLE `instructor_ficha` (
  `FK_instructor` bigint UNSIGNED NOT NULL,
  `FK_ficha` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `instructor_ficha`
--

INSERT INTO `instructor_ficha` (`FK_instructor`, `FK_ficha`, `created_at`, `updated_at`) VALUES
(1, 5, '2023-12-15 01:08:57', '2023-12-15 01:08:57'),
(1, 4, '2023-12-15 01:08:57', '2023-12-15 01:08:57'),
(2, 2, '2023-12-15 01:08:57', '2023-12-15 01:08:57'),
(3, 3, '2023-12-15 01:08:57', '2023-12-15 01:08:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `id` bigint UNSIGNED NOT NULL,
  `nom_jornada` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`id`, `nom_jornada`, `created_at`, `updated_at`) VALUES
(1, 'Diurna', '2021-02-03 02:42:29', '2021-02-17 02:42:29'),
(2, 'Nocturna', '2021-02-16 02:42:29', '2021-02-17 02:42:29'),
(3, 'Mixta', '2021-02-01 00:00:00', '2021-02-03 00:00:00'),
(4, 'Fines de semana', '2020-12-01 10:14:27', '2020-12-31 10:18:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_31_212839_create_instructor_table', 1),
(2, '2021_01_31_214026_create_jornada_table', 1),
(3, '2021_01_31_214430_create_admin_table', 1),
(4, '2021_01_31_221046_create_programa_table', 1),
(5, '2021_01_31_221417_create_ficha_table', 1),
(6, '2021_01_31_221705_create_instructor_ficha_table', 1),
(7, '2021_02_03_050127_create_companies_table', 1),
(8, '2021_02_04_022723_create_aprendiz_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `id_prog` bigint UNSIGNED NOT NULL,
  `nomProg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `acronimo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`id_prog`, `nomProg`, `acronimo`, `estado`, `created_at`, `updated_at`, `url`) VALUES
(1, 'Analisis y Desarrollo en Sistemas de Informacion', 'ADSI', '0', '2021-02-05 07:21:01', '2021-02-18 18:35:00', 'programa/update/1'),
(2, 'Redes', 'RDs', '1', '2021-02-05 07:22:34', '2021-02-05 07:27:13', NULL),
(3, 'Mecatronica', 'MCT', '1', '2021-02-05 07:34:10', '2021-02-06 18:33:15', NULL),
(4, 'Costureria', 'C', '1', '2021-02-05 07:34:49', '2021-02-06 18:33:51', NULL),
(5, 'ADSI', 'F', '1', '2021-02-06 19:39:36', '2021-02-06 19:39:36', NULL),
(6, 'Gestión administrativa', 'ADM', '1', '2021-02-07 14:14:11', '2021-02-07 14:14:11', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`id_aprendiz`),
  ADD KEY `aprendiz_fk_ficha_foreign` (`FK_ficha`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`id_ficha`),
  ADD KEY `ficha_fk_jornada_foreign` (`FK_jornada`),
  ADD KEY `ficha_fk_prog_foreign` (`FK_prog`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id_instructor`);

--
-- Indices de la tabla `instructor_ficha`
--
ALTER TABLE `instructor_ficha`
  ADD KEY `instructor_ficha_fk_instructor_foreign` (`FK_instructor`),
  ADD KEY `instructor_ficha_fk_ficha_foreign` (`FK_ficha`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`id_prog`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  MODIFY `id_aprendiz` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ficha`
--
ALTER TABLE `ficha`
  MODIFY `id_ficha` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id_instructor` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `id_prog` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `aprendiz_fk_ficha_foreign` FOREIGN KEY (`FK_ficha`) REFERENCES `ficha` (`id_ficha`);

--
-- Filtros para la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD CONSTRAINT `ficha_fk_jornada_foreign` FOREIGN KEY (`FK_jornada`) REFERENCES `jornada` (`id`),
  ADD CONSTRAINT `ficha_fk_prog_foreign` FOREIGN KEY (`FK_prog`) REFERENCES `programa` (`id_prog`);

--
-- Filtros para la tabla `instructor_ficha`
--
ALTER TABLE `instructor_ficha`
  ADD CONSTRAINT `instructor_ficha_fk_ficha_foreign` FOREIGN KEY (`FK_ficha`) REFERENCES `ficha` (`id_ficha`),
  ADD CONSTRAINT `instructor_ficha_fk_instructor_foreign` FOREIGN KEY (`FK_instructor`) REFERENCES `instructor` (`id_instructor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
