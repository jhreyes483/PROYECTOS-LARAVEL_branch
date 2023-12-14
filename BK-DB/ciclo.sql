-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-12-2021 a las 19:33:10
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ciclo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodyentries`
--

CREATE TABLE `bodyentries` (
  `NroReg` int(11) NOT NULL,
  `FKRmtEntry` int(10) UNSIGNED NOT NULL,
  `CostUnit` decimal(28,4) NOT NULL,
  `QuanEntry` decimal(20,0) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `lote` int(11) NOT NULL,
  `FKIdProduct` int(10) UNSIGNED NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodyinvoices`
--

CREATE TABLE `bodyinvoices` (
  `NroRegi` int(11) NOT NULL,
  `FKRmtInvoice` int(10) UNSIGNED NOT NULL,
  `QuaInvoice` decimal(20,0) NOT NULL,
  `PriceUnit` decimal(28,4) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `DiscoUnit` decimal(28,4) NOT NULL,
  `ValIva` decimal(28,4) NOT NULL,
  `TotalItem` decimal(28,4) NOT NULL,
  `FKIdProduct` int(10) UNSIGNED NOT NULL,
  `FKIdWareHouse` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodyorders`
--

CREATE TABLE `bodyorders` (
  `NroRegi` int(11) NOT NULL,
  `FKRmtOrder` int(10) UNSIGNED NOT NULL,
  `QuanOrder` decimal(20,0) NOT NULL,
  `PriceUnit` decimal(28,4) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `Discount` decimal(28,4) NOT NULL,
  `ValIva` decimal(28,4) NOT NULL,
  `TotalPrice` decimal(28,4) NOT NULL,
  `FKIdProduct` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `IdCustomer` int(10) UNSIGNED NOT NULL,
  `FirstNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastNameCustomer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AddressEntry` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumberPhone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdThird` int(10) UNSIGNED NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documenttypes`
--

CREATE TABLE `documenttypes` (
  `IdTypeDoc` int(10) UNSIGNED NOT NULL,
  `NameTypeDoc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AcroTypeDoc` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documenttypes`
--

INSERT INTO `documenttypes` (`IdTypeDoc`, `NameTypeDoc`, `AcroTypeDoc`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Cedula', 'CC', 121212, NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(2, 'NIT', 'NI', 121212, NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(3, 'Tarjeta Identidad', 'TI', 121212, NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(4, 'Cedula Extranjera', 'CE', 121212, NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genders`
--

CREATE TABLE `genders` (
  `IdGender` int(10) UNSIGNED NOT NULL,
  `Name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `genders`
--

INSERT INTO `genders` (`IdGender`, `Name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Masculino', NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(2, 'Femenino', NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(3, 'No Aplica', NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headentries`
--

CREATE TABLE `headentries` (
  `RmtEntry` int(10) UNSIGNED NOT NULL,
  `CreationDate` date NOT NULL,
  `DescriptionEntry` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `TotalCost` decimal(28,4) NOT NULL,
  `FKIdProvider` int(10) UNSIGNED NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headinvoices`
--

CREATE TABLE `headinvoices` (
  `RmtInvoice` int(10) UNSIGNED NOT NULL,
  `NumberInvoice` int(11) NOT NULL,
  `DateInvoice` date NOT NULL,
  `TotalIva` decimal(28,4) NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `TotalPrice` decimal(28,4) NOT NULL,
  `FKIdCustomer` int(10) UNSIGNED NOT NULL,
  `FKIdPaymentType` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headorders`
--

CREATE TABLE `headorders` (
  `RmtOrder` int(10) UNSIGNED NOT NULL,
  `NumOrder` int(11) NOT NULL,
  `DateOrder` date NOT NULL,
  `StatusOrder` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subtotal` decimal(28,4) NOT NULL,
  `TotalIva` decimal(28,4) NOT NULL,
  `TotalPrice` decimal(28,4) NOT NULL,
  `FKIdCustomer` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logerrors`
--

CREATE TABLE `logerrors` (
  `IdLog` int(10) UNSIGNED NOT NULL,
  `TableOrigen` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LevelError` int(11) NOT NULL,
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
  `IdSerCorreo` int(10) UNSIGNED NOT NULL,
  `IpServidorCorreo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Port` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
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
(23, '2021_05_04_044944_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 121212),
(1, 'App\\Models\\User', 121215),
(2, 'App\\Models\\User', 121213),
(2, 'App\\Models\\User', 121214),
(2, 'App\\Models\\User', 121215),
(3, 'App\\Models\\User', 121213),
(3, 'App\\Models\\User', 121215);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymenttypes`
--

CREATE TABLE `paymenttypes` (
  `IdPaymentType` int(10) UNSIGNED NOT NULL,
  `NamePayment` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Ver Usuarios', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(2, 'Crear Usuarios', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(3, 'Editar Usuarios', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(4, 'Eliminar Usuarios', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(5, 'Ver Productos', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(6, 'Crear Productos', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(7, 'Editar Productos', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(8, 'Eliminar Productos', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(9, 'Ver Categorias', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(10, 'Crear Categorias', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(11, 'Editar Categorias', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(12, 'Eliminar Categorias', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(13, 'Ver Bodegas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(14, 'Crear Bodegas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(15, 'Editar Bodegas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(16, 'Eliminar Bodegas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(17, 'Ver Entradas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(18, 'Crear Entradas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(19, 'Editar Entradas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(20, 'Eliminar Entradas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(21, 'Ver Proveedores', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(22, 'Crear Proveedores', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(23, 'Editar Proveedores', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(24, 'Eliminar Proveedores', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(25, 'Ver Facturas', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(26, 'Crear Facturas', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(27, 'Editar Facturas', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(28, 'Eliminar Facturas', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(29, 'Ver Pedidos', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(30, 'Crear Pedidos', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(31, 'Editar Pedidos', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(32, 'Eliminar Pedidos', 'web', '2021-05-07 09:28:45', '2021-05-07 09:28:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productcategories`
--

CREATE TABLE `productcategories` (
  `IdTypeProduct` int(10) UNSIGNED NOT NULL,
  `ReferenceType` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NameCategory` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productcategories`
--

INSERT INTO `productcategories` (`IdTypeProduct`, `ReferenceType`, `NameCategory`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'R-45', 'Cascos Bici', 121212, NULL, '2021-05-25 04:39:45', '2021-05-25 04:39:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `IdProduct` int(10) UNSIGNED NOT NULL,
  `NameProduct` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reference` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ManIva` tinyint(1) NOT NULL DEFAULT 0,
  `PorIva` decimal(28,4) NOT NULL,
  `Price` decimal(28,4) NOT NULL,
  `StatusProduct` tinyint(1) NOT NULL DEFAULT 0,
  `Description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageProduct` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FKIdTypeProduct` int(10) UNSIGNED NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`IdProduct`, `NameProduct`, `Reference`, `ManIva`, `PorIva`, `Price`, `StatusProduct`, `Description`, `imageProduct`, `FKIdTypeProduct`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Casco XWE PRO', 'cas-xwe', 1, '19.0000', '58000.0000', 1, 'Casco para ciclismo profesional', '/storage/sistema/productos/TDOr6zbZ4VpTfpUtB37QYrK323ZgVQyuISW1ff4W.png', 1, 121212, NULL, '2021-05-25 04:42:01', '2021-05-25 04:42:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `IdProvider` int(10) UNSIGNED NOT NULL,
  `FirstNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstLastNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastNameProvider` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StatusProvider` tinyint(1) NOT NULL DEFAULT 0,
  `FKIdThird` int(10) UNSIGNED NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(2, 'Inventarios', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44'),
(3, 'Ventas', 'web', '2021-05-07 09:28:44', '2021-05-07 09:28:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
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
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 3),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AHbIlszLcGjbWIszb6JQY3AvTRISuEvTHCAL0CGc', 121214, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibVlDdExXQ3Rsb0pEeWVnOGRTUlZPd2lYZTFUc0dFS3pzYVl2azNNdSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMjEyMTQ7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ1RmhaLmhyOEhRWFJCaWhNZjdSMGEuNUNvME51TTRyRDdUdlgvUEtvNjhkVVhtMWVhZUluSyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkNUZoWi5ocjhIUVhSQmloTWY3UjBhLjVDbzBOdU00ckQ3VHZYL1BLbzY4ZFVYbTFlYWVJbksiO30=', 1621905202),
('CWUBcT91VdO8aiKTMJf4viLZzvSanuzQrOMAWzsU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUkJkVHpsTFoxaVFFVUM4V0tWZmZPYnZWVFFtR1haNGcyckpOODFURiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO319', 1622248181),
('EV49xqgENPePrZeTxXLXEzD1yzYIdZY33bw5doEF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidWQ0Z2NqTXFlWEd4d011MFI1TUhRMjJPR3JqcmZCaGJEV3paUUhiYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1621901554),
('GjwJ17Bcgj1Vf8qKAQLJI3t5UJmQYwYOSk8TA1aP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWUt6dXlubmVFbG9UV2NGTEJWN2Z4UWI0aXNyaktERDNpbTJVejFXZCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1621782447),
('ke57sXL9YhKuymX3rAyiMxEuml1YlqyKnCoX8eZf', 121212, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTXVrcEtiQnBzQTcxaExGcktmdHpoSVFpaVdsM2ZsSklKc3JqQXZYMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMjEyMTI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ5MklYVU5wa2pPMHJPUTVieU1pLlllNG9Lb0VhM1JvOWxsQy8ub2cvYXQyLnVoZVdHL2lnaSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkOTJJWFVOcGtqTzByT1E1YnlNaS5ZZTRvS29FYTNSbzlsbEMvLm9nL2F0Mi51aGVXRy9pZ2kiO30=', 1621905185),
('qDKSOgGGjMi7X1dmzVbjfz6RObYKrM6hJAkhXjr2', 121212, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMVNLZUczRXA5QUUwQ0xvM1FNak8xQWloYllGckJxM09LazdxNXBNYyI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEyMTIxMjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDkySVhVTnBrak8wck9RNWJ5TWkuWWU0b0tvRWEzUm85bGxDLy5vZy9hdDIudWhlV0cvaWdpIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQ5MklYVU5wa2pPMHJPUTVieU1pLlllNG9Lb0VhM1JvOWxsQy8ub2cvYXQyLnVoZVdHL2lnaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VycyI7fX0=', 1622247494),
('TrO3MUqEeNqMsDRPLVBy8XS6poS8Xl1FIUOt7kEb', 121212, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZFZJMnVFdU1lVWx0U2tkUzZrWUtNclNUUHA0UGdieVdJbzl4c2dNeiI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcm9sZWFzaWduLzEyMTIxMi9lZGl0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTIxMjEyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkOTJJWFVOcGtqTzByT1E1YnlNaS5ZZTRvS29FYTNSbzlsbEMvLm9nL2F0Mi51aGVXRy9pZ2kiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDkySVhVTnBrak8wck9RNWJ5TWkuWWU0b0tvRWEzUm85bGxDLy5vZy9hdDIudWhlV0cvaWdpIjt9', 1621782626);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `CanStock` decimal(20,0) NOT NULL,
  `FKIdProduct` int(10) UNSIGNED NOT NULL,
  `FKIdWareHouse` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thirds`
--

CREATE TABLE `thirds` (
  `IdThird` int(10) UNSIGNED NOT NULL,
  `NumIdentification` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FKIdTypeDoc` int(10) UNSIGNED NOT NULL,
  `FirstNameThird` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondNameThird` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastNameThird` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastNameThird` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NameComplete` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExistsCutomer` tinyint(1) NOT NULL DEFAULT 0,
  `ExistsProvider` tinyint(1) NOT NULL DEFAULT 0,
  `FKIdGender` int(10) UNSIGNED NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `IdUser` int(10) UNSIGNED NOT NULL,
  `FirstName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstLastName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondLastName` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StatusUser` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`IdUser`, `FirstName`, `SecondName`, `FirstLastName`, `SecondLastName`, `email`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `StatusUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(121212, 'ADMIN', 'ADMIN', 'ADMIN', 'ADMIN', 'admin@admin.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, 1, NULL, '2021-05-07 09:28:45', '2021-05-07 09:28:45'),
(121213, 'Juan', 'Pablo', 'Torres', NULL, 'jptorres@correo.com', '$2y$10$u4eLIMSOxcLlrGgfdlKrOeM/OoVb8WjKRi7fX65HvSWGQ1ZksWXjC', NULL, NULL, 1, NULL, '2021-05-25 04:34:22', '2021-05-25 04:34:22'),
(121214, 'Andres', 'Camilo', 'Gutierrez', 'Carmargo', 'correoempleado1@correoprueba.com', '$2y$10$5FhZ.hr8HQXRBihMf7R0a.5Co0NuM4rD7TvX/PKo68dUXm1eaeInK', NULL, NULL, 1, NULL, '2021-05-25 05:57:20', '2021-05-25 05:57:20'),
(121215, 'Javier', 'H', 'Reyes', 'Neira', 'jhreyes483@misena.edu.co', '$2y$10$iqogp5HDyDEsLw6SoWItR.zwDkuDttpq3eJ4bX0504uhZp8663YDO', NULL, NULL, 1, NULL, '2021-12-31 23:29:00', '2021-12-31 23:29:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warehouses`
--

CREATE TABLE `warehouses` (
  `IdWareHouse` int(10) UNSIGNED NOT NULL,
  `ReferenceWareHouse` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StatusWareHouse` tinyint(1) NOT NULL DEFAULT 0,
  `FKIdUserMan` int(10) UNSIGNED NOT NULL,
  `FKIdUser` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `warehouses`
--

INSERT INTO `warehouses` (`IdWareHouse`, `ReferenceWareHouse`, `StatusWareHouse`, `FKIdUserMan`, `FKIdUser`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ref-001', 1, 121213, 121212, NULL, '2021-05-25 04:42:51', '2021-05-25 04:42:51');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodyentries`
--
ALTER TABLE `bodyentries`
  ADD PRIMARY KEY (`NroReg`,`FKRmtEntry`),
  ADD KEY `bodyentries_fkrmtentry_foreign` (`FKRmtEntry`),
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
  ADD PRIMARY KEY (`FKIdProduct`,`FKIdWareHouse`),
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
  MODIFY `IdCustomer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documenttypes`
--
ALTER TABLE `documenttypes`
  MODIFY `IdTypeDoc` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `genders`
--
ALTER TABLE `genders`
  MODIFY `IdGender` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `headentries`
--
ALTER TABLE `headentries`
  MODIFY `RmtEntry` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `headinvoices`
--
ALTER TABLE `headinvoices`
  MODIFY `RmtInvoice` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `headorders`
--
ALTER TABLE `headorders`
  MODIFY `RmtOrder` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logerrors`
--
ALTER TABLE `logerrors`
  MODIFY `IdLog` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mailserver`
--
ALTER TABLE `mailserver`
  MODIFY `IdSerCorreo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `paymenttypes`
--
ALTER TABLE `paymenttypes`
  MODIFY `IdPaymentType` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productcategories`
--
ALTER TABLE `productcategories`
  MODIFY `IdTypeProduct` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `IdProduct` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `IdProvider` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `thirds`
--
ALTER TABLE `thirds`
  MODIFY `IdThird` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `IdUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121216;

--
-- AUTO_INCREMENT de la tabla `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `IdWareHouse` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodyentries`
--
ALTER TABLE `bodyentries`
  ADD CONSTRAINT `bodyentries_fkidproduct_foreign` FOREIGN KEY (`FKIdProduct`) REFERENCES `products` (`IdProduct`),
  ADD CONSTRAINT `bodyentries_fkiduser_foreign` FOREIGN KEY (`FKIdUser`) REFERENCES `users` (`IdUser`),
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
