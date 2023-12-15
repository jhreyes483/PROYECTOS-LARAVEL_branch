-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2023 a las 04:16:14
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
-- Base de datos: `s_laravel_ciclosoft`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `lsp_get_permissions` (IN `p_offset` INT, IN `p_limit` INT)   BEGIN

	SET @count = (
    SELECT count(id) 
    FROM permissions
    );

	SELECT
    *,
    @count count
    FROM permissions
    LIMIT  p_offset, p_limit;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lsp_get_users` (IN `p_offset` INT, IN `p_limit` INT, IN `p_search` LONGTEXT)   BEGIN

	DECLARE v_offset INTEGER DEFAULT  IF (p_search <> "", 0, p_offset);


	SET @count = (
    SELECT count(id) 
    FROM users
    );

	SELECT
    *,
    @count count
    FROM users
    WHERE TRUE
	AND IF (p_search <> "", name COLLATE utf8mb4_unicode_ci LIKE CONCAT('%', p_search, '%'), TRUE)
	LIMIT   v_offset, p_limit;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodyentries`
--

CREATE TABLE `bodyentries` (
  `NroReg` int NOT NULL,
  `FKRmtEntry` int UNSIGNED NOT NULL,
  `CostUnit` decimal(28,4) NOT NULL,
  `QuanEntry` decimal(20,0) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `FKIdWareHouse` int UNSIGNED NOT NULL,
  `FKIdProduct` int UNSIGNED NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodyinvoices`
--

CREATE TABLE `bodyinvoices` (
  `NroRegi` int NOT NULL,
  `FKRmtInvoice` int UNSIGNED NOT NULL,
  `QuaInvoice` decimal(20,0) NOT NULL,
  `PriceUnit` decimal(28,4) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `DiscoUnit` decimal(28,4) NOT NULL,
  `ValIva` decimal(28,4) NOT NULL,
  `TotalItem` decimal(28,4) NOT NULL,
  `FKIdProduct` int UNSIGNED NOT NULL,
  `FKIdWareHouse` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodyorders`
--

CREATE TABLE `bodyorders` (
  `NroRegi` int NOT NULL,
  `FKRmtOrder` int UNSIGNED NOT NULL,
  `QuanOrder` decimal(20,0) NOT NULL,
  `PriceUnit` decimal(28,4) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `Discount` decimal(28,4) NOT NULL,
  `ValIva` decimal(28,4) NOT NULL,
  `TotalPrice` decimal(28,4) NOT NULL,
  `FKIdProduct` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `IdCustomer` int UNSIGNED NOT NULL,
  `FirstNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AddressEntry` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberPhone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdThird` int UNSIGNED NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documenttypes`
--

CREATE TABLE `documenttypes` (
  `IdTypeDoc` int UNSIGNED NOT NULL,
  `NameTypeDoc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AcroTypeDoc` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documenttypes`
--

INSERT INTO `documenttypes` (`IdTypeDoc`, `NameTypeDoc`, `AcroTypeDoc`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Cedula', 'CC', 121212, NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(2, 'NIT', 'NI', 121212, NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(3, 'Tarjeta Identidad', 'TI', 121212, NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(4, 'Cedula Extranjera', 'CE', 121212, NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genders`
--

CREATE TABLE `genders` (
  `IdGender` int UNSIGNED NOT NULL,
  `Name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `genders`
--

INSERT INTO `genders` (`IdGender`, `Name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Masculino', NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(2, 'Femenino', NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(3, 'No Aplica', NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headentries`
--

CREATE TABLE `headentries` (
  `RmtEntry` int UNSIGNED NOT NULL,
  `CreationDate` date NOT NULL,
  `DescriptionEntry` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `CostIVA` decimal(28,4) NOT NULL,
  `TotalCost` decimal(28,4) NOT NULL,
  `FKIdProvider` int UNSIGNED NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headinvoices`
--

CREATE TABLE `headinvoices` (
  `RmtInvoice` int UNSIGNED NOT NULL,
  `NumberInvoice` int NOT NULL,
  `DateInvoice` date NOT NULL,
  `TotalIva` decimal(28,4) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `TotalPrice` decimal(28,4) NOT NULL,
  `FKIdCustomer` int UNSIGNED NOT NULL,
  `FKIdPaymentType` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headorders`
--

CREATE TABLE `headorders` (
  `RmtOrder` int UNSIGNED NOT NULL,
  `NumOrder` int NOT NULL,
  `DateOrder` date NOT NULL,
  `StatusOrder` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `TotalIva` decimal(28,4) NOT NULL,
  `TotalPrice` decimal(28,4) NOT NULL,
  `FKIdCustomer` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logerrors`
--

CREATE TABLE `logerrors` (
  `IdLog` int UNSIGNED NOT NULL,
  `TableOrigen` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LevelError` int NOT NULL,
  `Description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mailserver`
--

CREATE TABLE `mailserver` (
  `IdSerCorreo` int UNSIGNED NOT NULL,
  `IpServidorCorreo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Port` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2020_12_16_020548_users', 1),
(3, '2020_12_16_020614_payment_types', 1),
(4, '2020_12_16_020634_document_types', 1),
(5, '2020_12_16_020652_ware_houses', 1),
(6, '2020_12_16_020709_product_categories', 1),
(7, '2020_12_16_020722_products', 1),
(8, '2020_12_16_020737_genders', 1),
(9, '2020_12_16_020754_thirds', 1),
(10, '2020_12_16_020810_stock', 1),
(11, '2020_12_16_020931_mail_server', 1),
(12, '2020_12_16_020945_log_errors', 1),
(13, '2020_12_16_021012_customers', 1),
(14, '2020_12_16_021025_providers', 1),
(15, '2020_12_16_021043_head_entries', 1),
(16, '2020_12_16_021057_body_entries', 1),
(17, '2020_12_16_021109_head_orders', 1),
(18, '2020_12_16_021120_body_orders', 1),
(19, '2020_12_16_021131_head_invoices', 1),
(20, '2020_12_16_021143_body_invoices', 1),
(21, '2020_12_17_200000_add_two_factor_columns_to_users_table', 1),
(22, '2021_01_11_220331_create_sessions_table', 1),
(23, '2021_05_04_044944_create_permission_tables', 1),
(24, '2014_10_12_100000_create_password_resets_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 121212);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymenttypes`
--

CREATE TABLE `paymenttypes` (
  `IdPaymentType` int UNSIGNED NOT NULL,
  `NamePayment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Ver Usuarios', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(2, 'Crear Usuarios', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(3, 'Editar Usuarios', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(4, 'Eliminar Usuarios', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(5, 'Ver Productos', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(6, 'Crear Productos', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(7, 'Editar Productos', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(8, 'Eliminar Productos', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(9, 'Ver Categorias', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(10, 'Crear Categorias', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(11, 'Editar Categorias', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(12, 'Eliminar Categorias', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(13, 'Ver Bodegas', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(14, 'Crear Bodegas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(15, 'Editar Bodegas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(16, 'Eliminar Bodegas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(17, 'Ver Entradas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(18, 'Crear Entradas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(19, 'Editar Entradas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(20, 'Eliminar Entradas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(21, 'Ver Proveedores', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(22, 'Crear Proveedores', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(23, 'Editar Proveedores', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(24, 'Eliminar Proveedores', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(25, 'Ver Facturas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(26, 'Crear Facturas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(27, 'Editar Facturas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(28, 'Eliminar Facturas', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(29, 'Ver Pedidos', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(30, 'Crear Pedidos', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(31, 'Editar Pedidos', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01'),
(32, 'Eliminar Pedidos', 'web', '2023-12-14 21:55:01', '2023-12-14 21:55:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productcategories`
--

CREATE TABLE `productcategories` (
  `IdTypeProduct` int UNSIGNED NOT NULL,
  `ReferenceType` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NameCategory` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productcategories`
--

INSERT INTO `productcategories` (`IdTypeProduct`, `ReferenceType`, `NameCategory`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 'Electrodomesticos', 121212, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `IdProduct` int UNSIGNED NOT NULL,
  `NameProduct` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reference` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ManIva` tinyint(1) NOT NULL DEFAULT '0',
  `PorIva` decimal(28,4) NOT NULL,
  `Price` decimal(28,4) NOT NULL,
  `StatusProduct` tinyint(1) NOT NULL DEFAULT '0',
  `Description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageProduct` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FKIdTypeProduct` int UNSIGNED NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`IdProduct`, `NameProduct`, `Reference`, `ManIva`, `PorIva`, `Price`, `StatusProduct`, `Description`, `imageProduct`, `FKIdTypeProduct`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Terlevisor', 'Test', 0, '0.0000', '500000.0000', 1, 'Tele LG', NULL, 1, 121212, NULL, NULL, '2023-12-15 04:42:51'),
(3, 'planta', 'American Audo', 0, '0.0000', '1000000.0000', 1, 'Planta american audio de 600 wats rms', '/storage/sistema/productos/buxmEJgcUXhEL6T2gBnaCX2BFykIKoDR5uK4v9Vu.jpg', 1, 121212, NULL, '2023-12-15 04:44:45', '2023-12-15 04:44:45'),
(4, 'Cabinas', 'Geminy GT1503', 0, '0.0000', '500000.0000', 1, 'Cabina marca geminy de 300 wats rms', '/storage/sistema/productos/ViHaKjFkBATrjVNoE40iiW1WYIvjIWyezuRU98XE.jpg', 1, 121212, NULL, '2023-12-15 04:46:42', '2023-12-15 04:46:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `IdProvider` int UNSIGNED NOT NULL,
  `FirstNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstLastNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StatusProvider` tinyint(1) NOT NULL DEFAULT '0',
  `FKIdThird` int UNSIGNED NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`IdProvider`, `FirstNameProvider`, `SecondNameProvider`, `FirstLastNameProvider`, `SecondLastNameProvider`, `StatusProvider`, `FKIdThird`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pedro', 'Miguel', 'Daza', 'Reyes', 1, 1, 121212, NULL, '2023-12-14 21:59:07', '2023-12-14 21:59:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(2, 'Inventarios', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(3, 'Ventas', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00'),
(4, 'Cliente', 'web', '2023-12-14 21:55:00', '2023-12-14 21:55:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `IdStock` int UNSIGNED NOT NULL,
  `CanStock` decimal(20,0) NOT NULL,
  `FKIdProduct` int UNSIGNED NOT NULL,
  `FKIdWareHouse` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thirds`
--

CREATE TABLE `thirds` (
  `IdThird` int UNSIGNED NOT NULL,
  `NumIdentification` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdTypeDoc` int UNSIGNED NOT NULL,
  `FirstNameThird` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondNameThird` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastNameThird` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastNameThird` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NameComplete` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExistsCutomer` tinyint(1) NOT NULL DEFAULT '0',
  `ExistsProvider` tinyint(1) NOT NULL DEFAULT '0',
  `FKIdGender` int UNSIGNED NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `thirds`
--

INSERT INTO `thirds` (`IdThird`, `NumIdentification`, `FKIdTypeDoc`, `FirstNameThird`, `SecondNameThird`, `LastNameThird`, `SecondLastNameThird`, `NameComplete`, `ExistsCutomer`, `ExistsProvider`, `FKIdGender`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1030333', 1, 'Pedro', 'Miguel', 'Daza', 'Reyes', 'Ciclo 001', 0, 1, 1, 121212, NULL, '2023-12-14 21:59:07', '2023-12-14 21:59:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `IdUser` int UNSIGNED NOT NULL,
  `FirstName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstLastName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `StatusUser` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`IdUser`, `FirstName`, `SecondName`, `FirstLastName`, `SecondLastName`, `email`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `StatusUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(121212, 'ADMIN', 'ADMIN', 'ADMIN', 'ADMIN', 'jav-rn@hotmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 1, NULL, '2023-12-14 21:55:01', '2023-12-14 21:55:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warehouses`
--

CREATE TABLE `warehouses` (
  `IdWareHouse` int UNSIGNED NOT NULL,
  `ReferenceWareHouse` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StatusWareHouse` tinyint(1) NOT NULL DEFAULT '0',
  `FKIdUserMan` int UNSIGNED NOT NULL,
  `FKIdUser` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodyentries`
--
ALTER TABLE `bodyentries`
  ADD PRIMARY KEY (`NroReg`,`FKRmtEntry`),
  ADD KEY `bodyentries_fkrmtentry_foreign` (`FKRmtEntry`),
  ADD KEY `bodyentries_fkidwarehouse_foreign` (`FKIdWareHouse`),
  ADD KEY `bodyentries_fkidproduct_foreign` (`FKIdProduct`),
  ADD KEY `bodyentries_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `bodyinvoices`
--
ALTER TABLE `bodyinvoices`
  ADD PRIMARY KEY (`NroRegi`,`FKRmtInvoice`),
  ADD KEY `bodyinvoices_fkrmtinvoice_foreign` (`FKRmtInvoice`),
  ADD KEY `bodyinvoices_fkidproduct_foreign` (`FKIdProduct`),
  ADD KEY `bodyinvoices_fkidwarehouse_foreign` (`FKIdWareHouse`);

--
-- Indices de la tabla `bodyorders`
--
ALTER TABLE `bodyorders`
  ADD PRIMARY KEY (`NroRegi`,`FKRmtOrder`),
  ADD KEY `bodyorders_fkrmtorder_foreign` (`FKRmtOrder`),
  ADD KEY `bodyorders_fkidproduct_foreign` (`FKIdProduct`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`IdCustomer`),
  ADD KEY `customers_fkidthird_foreign` (`FKIdThird`),
  ADD KEY `customers_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `documenttypes`
--
ALTER TABLE `documenttypes`
  ADD PRIMARY KEY (`IdTypeDoc`),
  ADD KEY `documenttypes_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`IdGender`);

--
-- Indices de la tabla `headentries`
--
ALTER TABLE `headentries`
  ADD PRIMARY KEY (`RmtEntry`),
  ADD KEY `headentries_fkidprovider_foreign` (`FKIdProvider`),
  ADD KEY `headentries_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `headinvoices`
--
ALTER TABLE `headinvoices`
  ADD PRIMARY KEY (`RmtInvoice`),
  ADD KEY `headinvoices_fkidcustomer_foreign` (`FKIdCustomer`),
  ADD KEY `headinvoices_fkidpaymenttype_foreign` (`FKIdPaymentType`);

--
-- Indices de la tabla `headorders`
--
ALTER TABLE `headorders`
  ADD PRIMARY KEY (`RmtOrder`),
  ADD KEY `headorders_fkidcustomer_foreign` (`FKIdCustomer`);

--
-- Indices de la tabla `logerrors`
--
ALTER TABLE `logerrors`
  ADD PRIMARY KEY (`IdLog`);

--
-- Indices de la tabla `mailserver`
--
ALTER TABLE `mailserver`
  ADD PRIMARY KEY (`IdSerCorreo`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `paymenttypes`
--
ALTER TABLE `paymenttypes`
  ADD PRIMARY KEY (`IdPaymentType`),
  ADD KEY `paymenttypes_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productcategories`
--
ALTER TABLE `productcategories`
  ADD PRIMARY KEY (`IdTypeProduct`),
  ADD KEY `productcategories_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`IdProduct`),
  ADD KEY `products_fkidtypeproduct_foreign` (`FKIdTypeProduct`),
  ADD KEY `products_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`IdProvider`),
  ADD KEY `providers_fkidthird_foreign` (`FKIdThird`),
  ADD KEY `providers_fkiduser_foreign` (`FKIdUser`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`IdStock`),
  ADD KEY `stock_fkidproduct_foreign` (`FKIdProduct`),
  ADD KEY `stock_fkidwarehouse_foreign` (`FKIdWareHouse`);

--
-- Indices de la tabla `thirds`
--
ALTER TABLE `thirds`
  ADD PRIMARY KEY (`IdThird`),
  ADD KEY `thirds_fkidtypedoc_foreign` (`FKIdTypeDoc`),
  ADD KEY `thirds_fkidgender_foreign` (`FKIdGender`),
  ADD KEY `thirds_fkiduser_foreign` (`FKIdUser`),
  ADD KEY `thirds_numidentification_fkidtypedoc_index` (`NumIdentification`,`FKIdTypeDoc`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IdUser`);

--
-- Indices de la tabla `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`IdWareHouse`),
  ADD KEY `warehouses_fkiduserman_foreign` (`FKIdUserMan`),
  ADD KEY `warehouses_fkiduser_foreign` (`FKIdUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `IdCustomer` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documenttypes`
--
ALTER TABLE `documenttypes`
  MODIFY `IdTypeDoc` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `genders`
--
ALTER TABLE `genders`
  MODIFY `IdGender` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `headentries`
--
ALTER TABLE `headentries`
  MODIFY `RmtEntry` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `headinvoices`
--
ALTER TABLE `headinvoices`
  MODIFY `RmtInvoice` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `headorders`
--
ALTER TABLE `headorders`
  MODIFY `RmtOrder` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logerrors`
--
ALTER TABLE `logerrors`
  MODIFY `IdLog` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mailserver`
--
ALTER TABLE `mailserver`
  MODIFY `IdSerCorreo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `paymenttypes`
--
ALTER TABLE `paymenttypes`
  MODIFY `IdPaymentType` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productcategories`
--
ALTER TABLE `productcategories`
  MODIFY `IdTypeProduct` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `IdProduct` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `IdProvider` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `IdStock` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `thirds`
--
ALTER TABLE `thirds`
  MODIFY `IdThird` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `IdUser` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121213;

--
-- AUTO_INCREMENT de la tabla `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `IdWareHouse` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodyentries`
--
ALTER TABLE `bodyentries`
  ADD CONSTRAINT `bodyentries_fkidproduct_foreign` FOREIGN KEY (`FKIdProduct`) REFERENCES `products` (`IdProduct`),
  ADD CONSTRAINT `bodyentries_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`),
  ADD CONSTRAINT `bodyentries_fkidwarehouse_foreign` FOREIGN KEY (`FKIdWareHouse`) REFERENCES `warehouses` (`IdWareHouse`),
  ADD CONSTRAINT `bodyentries_fkrmtentry_foreign` FOREIGN KEY (`FKRmtEntry`) REFERENCES `headentries` (`RmtEntry`);

--
-- Filtros para la tabla `bodyinvoices`
--
ALTER TABLE `bodyinvoices`
  ADD CONSTRAINT `bodyinvoices_fkidproduct_foreign` FOREIGN KEY (`FKIdProduct`) REFERENCES `products` (`IdProduct`),
  ADD CONSTRAINT `bodyinvoices_fkidwarehouse_foreign` FOREIGN KEY (`FKIdWareHouse`) REFERENCES `warehouses` (`IdWareHouse`),
  ADD CONSTRAINT `bodyinvoices_fkrmtinvoice_foreign` FOREIGN KEY (`FKRmtInvoice`) REFERENCES `headinvoices` (`RmtInvoice`);

--
-- Filtros para la tabla `bodyorders`
--
ALTER TABLE `bodyorders`
  ADD CONSTRAINT `bodyorders_fkidproduct_foreign` FOREIGN KEY (`FKIdProduct`) REFERENCES `products` (`IdProduct`),
  ADD CONSTRAINT `bodyorders_fkrmtorder_foreign` FOREIGN KEY (`FKRmtOrder`) REFERENCES `headorders` (`RmtOrder`);

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_fkidthird_foreign` FOREIGN KEY (`FKIdThird`) REFERENCES `thirds` (`IdThird`),
  ADD CONSTRAINT `customers_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `documenttypes`
--
ALTER TABLE `documenttypes`
  ADD CONSTRAINT `documenttypes_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `headentries`
--
ALTER TABLE `headentries`
  ADD CONSTRAINT `headentries_fkidprovider_foreign` FOREIGN KEY (`FKIdProvider`) REFERENCES `providers` (`IdProvider`),
  ADD CONSTRAINT `headentries_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `headinvoices`
--
ALTER TABLE `headinvoices`
  ADD CONSTRAINT `headinvoices_fkidcustomer_foreign` FOREIGN KEY (`FKIdCustomer`) REFERENCES `customers` (`IdCustomer`),
  ADD CONSTRAINT `headinvoices_fkidpaymenttype_foreign` FOREIGN KEY (`FKIdPaymentType`) REFERENCES `paymenttypes` (`IdPaymentType`);

--
-- Filtros para la tabla `headorders`
--
ALTER TABLE `headorders`
  ADD CONSTRAINT `headorders_fkidcustomer_foreign` FOREIGN KEY (`FKIdCustomer`) REFERENCES `customers` (`IdCustomer`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `paymenttypes`
--
ALTER TABLE `paymenttypes`
  ADD CONSTRAINT `paymenttypes_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `productcategories`
--
ALTER TABLE `productcategories`
  ADD CONSTRAINT `productcategories_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_fkidtypeproduct_foreign` FOREIGN KEY (`FKIdTypeProduct`) REFERENCES `productcategories` (`IdTypeProduct`),
  ADD CONSTRAINT `products_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_fkidthird_foreign` FOREIGN KEY (`FKIdThird`) REFERENCES `thirds` (`IdThird`),
  ADD CONSTRAINT `providers_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_fkidproduct_foreign` FOREIGN KEY (`FKIdProduct`) REFERENCES `products` (`IdProduct`),
  ADD CONSTRAINT `stock_fkidwarehouse_foreign` FOREIGN KEY (`FKIdWareHouse`) REFERENCES `warehouses` (`IdWareHouse`);

--
-- Filtros para la tabla `thirds`
--
ALTER TABLE `thirds`
  ADD CONSTRAINT `thirds_fkidgender_foreign` FOREIGN KEY (`FKIdGender`) REFERENCES `genders` (`IdGender`),
  ADD CONSTRAINT `thirds_fkidtypedoc_foreign` FOREIGN KEY (`FKIdTypeDoc`) REFERENCES `documenttypes` (`IdTypeDoc`),
  ADD CONSTRAINT `thirds_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`);

--
-- Filtros para la tabla `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`),
  ADD CONSTRAINT `warehouses_fkiduserman_foreign` FOREIGN KEY (`FKIdUserMan`) REFERENCES `users` (`IdUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
