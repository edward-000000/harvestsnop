-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2025 a las 00:37:04
-- Versión del servidor: 10.11.10-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u295441750_EDURIARTE`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) NOT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `account_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `initial_balance` decimal(25,4) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `opening_date` datetime DEFAULT NULL,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total_deposit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_withdraw` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_transfer_from_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_transfer_to_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `account_name`, `account_details`, `initial_balance`, `account_no`, `contact_person`, `phone_number`, `opening_date`, `url`, `total_deposit`, `total_withdraw`, `total_transfer_from_other`, `total_transfer_to_other`, `created_at`, `updated_at`) VALUES
(1, 'Cuenta predeterminada', 'Esta es una cuenta predeterminada para cualquier tienda.', 0.0000, '1234567890', 'Nombre y Apellido', '123456789', '2019-05-15 08:27:03', 'http://banco.com', 360.0000, 0.0000, 0.0000, 0.0000, '2019-01-16 13:23:03', '2019-07-02 11:56:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank_account_to_store`
--

CREATE TABLE `bank_account_to_store` (
  `ba2s` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `deposit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `withdraw` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `transfer_from_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `transfer_to_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `bank_account_to_store`
--

INSERT INTO `bank_account_to_store` (`ba2s`, `store_id`, `account_id`, `deposit`, `withdraw`, `transfer_from_other`, `transfer_to_other`, `status`, `sort_order`) VALUES
(1, 1, 1, 10.0000, 350.0000, 0.0000, 0.0000, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank_transaction_info`
--

CREATE TABLE `bank_transaction_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `transaction_type` text DEFAULT NULL,
  `is_substract` tinyint(1) NOT NULL DEFAULT 0,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `account_id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) DEFAULT NULL,
  `exp_category_id` int(10) DEFAULT NULL,
  `ref_no` varchar(100) NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `invoice_id` varchar(100) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `details` text DEFAULT NULL,
  `from_account_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `bank_transaction_info`
--

INSERT INTO `bank_transaction_info` (`info_id`, `store_id`, `transaction_type`, `is_substract`, `is_hide`, `account_id`, `source_id`, `exp_category_id`, `ref_no`, `invoice_id`, `title`, `details`, `from_account_id`, `status`, `image`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 1, 'withdraw', 0, 0, 1, NULL, 9, 'W1', 'B1', 'Debit for Product Purchase', 'Supplier name: No Supplier', NULL, 1, 'NULL', 1, '2022-01-17 07:03:14', NULL),
(4, 1, 'deposit', 0, 0, 1, 1, NULL, 'D2', '12022/00000001', 'Deposit for selling', 'Customer name: Walking Customer', NULL, 1, 'NULL', 1, '2022-01-17 07:03:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bank_transaction_price`
--

CREATE TABLE `bank_transaction_price` (
  `price_id` int(10) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `info_id` int(11) DEFAULT NULL,
  `ref_no` varchar(100) NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `bank_transaction_price`
--

INSERT INTO `bank_transaction_price` (`price_id`, `store_id`, `info_id`, `ref_no`, `amount`) VALUES
(3, 1, 3, 'W1', 350.0000),
(4, 1, 4, 'D2', 10.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boxes`
--

CREATE TABLE `boxes` (
  `box_id` int(10) UNSIGNED NOT NULL,
  `box_name` varchar(100) NOT NULL,
  `code_name` varchar(55) DEFAULT NULL,
  `box_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `boxes`
--

INSERT INTO `boxes` (`box_id`, `box_name`, `code_name`, `box_details`) VALUES
(1, 'Caja común', 'comun', 'detalles caja común aquí...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `box_to_store`
--

CREATE TABLE `box_to_store` (
  `id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `box_to_store`
--

INSERT INTO `box_to_store` (`id`, `box_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `brand_details` longtext DEFAULT NULL,
  `brand_image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `code_name`, `brand_details`, `brand_image`, `created_at`, `updated_at`) VALUES
(1, 'Sin marca', 'sin_marca', '', '', '2019-03-31 03:36:47', '2019-07-02 11:59:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand_to_store`
--

CREATE TABLE `brand_to_store` (
  `b2s_id` int(10) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `brand_to_store`
--

INSERT INTO `brand_to_store` (`b2s_id`, `brand_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0),
(2, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorys`
--

CREATE TABLE `categorys` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_slug` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `category_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `category_image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `categorys`
--

INSERT INTO `categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'Categoría Producto', 'categoria_producto', 0, 'detalle de la categoría, el texto simple se mostrará aquí', NULL, '2018-08-17 05:28:16', '2019-07-02 12:00:23'),
(2, 'Abarrotes', 'abarrotes', 0, 'Verduras', '', '2025-05-05 17:55:48', NULL),
(3, 'Frutas', 'frutas', 0, 'Frutas', '', '2025-05-05 17:56:05', NULL),
(4, 'Cereales y granos', 'cereales_y_granos', 0, 'Cereales y granos ', '', '2025-05-05 17:56:36', NULL),
(5, 'Carnes', 'carnes', 0, '', '', '2025-05-05 17:57:26', NULL),
(6, 'Bebidas', 'bebidas', 0, 'Jugos y bebidas', '', '2025-05-05 17:58:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_to_store`
--

CREATE TABLE `category_to_store` (
  `c2s_id` int(10) NOT NULL,
  `ccategory_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `category_to_store`
--

INSERT INTO `category_to_store` (`c2s_id`, `ccategory_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0),
(2, 2, 1, 1, 0),
(3, 3, 1, 1, 0),
(4, 4, 1, 1, 0),
(5, 5, 1, 1, 0),
(6, 6, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `id_department` varchar(5) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `id_department`, `name`, `code`) VALUES
(1, '05', 'MEDELLIN', '001'),
(2, '05', 'ABEJORRAL', '002'),
(3, '05', 'ABRIAQUI', '004'),
(4, '05', 'ALEJANDRIA', '021'),
(5, '05', 'AMAGA', '030'),
(6, '05', 'AMALFI', '031'),
(7, '05', 'ANDES', '034'),
(8, '05', 'ANGELOPOLIS', '036'),
(9, '05', 'ANGOSTURA', '038'),
(10, '05', 'ANORI', '040'),
(11, '05', 'ANTIOQUIA', '042'),
(12, '05', 'ANZA', '044'),
(13, '05', 'APARTADO', '045'),
(14, '05', 'ARBOLETES', '051'),
(15, '05', 'ARGELIA', '055'),
(16, '05', 'ARMENIA', '059'),
(17, '05', 'BARBOSA', '079'),
(18, '05', 'BELMIRA', '086'),
(19, '05', 'BELLO', '088'),
(20, '05', 'BETANIA', '091'),
(21, '05', 'BETULIA', '093'),
(22, '05', 'BOLIVAR', '101'),
(23, '05', 'BRICEÐO', '107'),
(24, '05', 'BURITICA', '113'),
(25, '05', 'CACERES', '120'),
(26, '05', 'CAICEDO', '125'),
(27, '05', 'CALDAS', '129'),
(28, '05', 'CAMPAMENTO', '134'),
(29, '05', 'CAÐASGORDAS', '138'),
(30, '05', 'CARACOLI', '142'),
(31, '05', 'CARAMANTA', '145'),
(32, '05', 'CAREPA', '147'),
(33, '05', 'CARMEN DE VIBORAL', '148'),
(34, '05', 'CAROLINA', '150'),
(35, '05', 'CAUCASIA', '154'),
(36, '05', 'CHIGORODO', '172'),
(37, '05', 'CISNEROS', '190'),
(38, '05', 'COCORNA', '197'),
(39, '05', 'CONCEPCION', '206'),
(40, '05', 'CONCORDIA', '209'),
(41, '05', 'COPACABANA', '212'),
(42, '05', 'DABEIBA', '234'),
(43, '05', 'DON MATIAS', '237'),
(44, '05', 'EBEJICO', '240'),
(45, '05', 'EL BAGRE', '250'),
(46, '05', 'ENTRERRIOS', '264'),
(47, '05', 'ENVIGADO', '266'),
(48, '05', 'FREDONIA', '282'),
(49, '05', 'FRONTINO', '284'),
(50, '05', 'GIRALDO', '306'),
(51, '05', 'GIRARDOTA', '308'),
(52, '05', 'GOMEZ PLATA', '310'),
(53, '05', 'GRANADA', '313'),
(54, '05', 'GUADALUPE', '315'),
(55, '05', 'GUARNE', '318'),
(56, '05', 'GUATAPE', '321'),
(57, '05', 'HELICONIA', '347'),
(58, '05', 'HISPANIA', '353'),
(59, '05', 'ITAGUI', '360'),
(60, '05', 'ITUANGO', '361'),
(61, '05', 'JARDIN', '364'),
(62, '05', 'JERICO', '368'),
(63, '05', 'LA CEJA', '376'),
(64, '05', 'LA ESTRELLA', '380'),
(65, '05', 'LA UNION', '400'),
(66, '05', 'LIBORINA', '411'),
(67, '05', 'MACEO', '425'),
(68, '05', 'MARINILLA', '440'),
(69, '05', 'MONTEBELLO', '467'),
(70, '05', 'MURINDO', '475'),
(71, '05', 'MUTATA', '480'),
(72, '05', 'NARIÐO', '483'),
(73, '05', 'NECOCLI', '490'),
(74, '05', 'NECHI', '495'),
(75, '05', 'OLAYA', '501'),
(76, '05', 'PEÐOL', '541'),
(77, '05', 'PEQUE', '543'),
(78, '05', 'PUEBLORRICO', '576'),
(79, '05', 'PUERTO BERRIO', '579'),
(80, '05', 'PTO NARE (LA MAGDALENA)', '585'),
(81, '05', 'PUERTO TRIUNFO', '591'),
(82, '05', 'REMEDIOS', '604'),
(83, '05', 'RETIRO', '607'),
(84, '05', 'RIONEGRO', '615'),
(85, '05', 'SABANALARGA', '628'),
(86, '05', 'SABANETA', '631'),
(87, '05', 'SALGAR', '642'),
(88, '05', 'SAN ANDRES', '647'),
(89, '05', 'SAN CARLOS', '649'),
(90, '05', 'SAN FRANCISCO', '652'),
(91, '05', 'SAN JERONIMO', '656'),
(92, '05', 'SAN JOSE DE LA MONTAÐA', '658'),
(93, '05', 'SAN JUAN DE URABA', '659'),
(94, '05', 'SAN LUIS', '660'),
(95, '05', 'SAN PEDRO', '664'),
(96, '05', 'SAN PEDRO DE URABA', '665'),
(97, '05', 'SAN RAFAEL', '667'),
(98, '05', 'SAN ROQUE', '670'),
(99, '05', 'SAN VICENTE', '674'),
(100, '05', 'SANTA BARBARA', '679'),
(101, '05', 'SANTA ROSA DE OSOS', '686'),
(102, '05', 'SANTO DOMINGO', '690'),
(103, '05', 'SANTUARIO', '697'),
(104, '05', 'SEGOVIA', '736'),
(105, '05', 'SONSON', '756'),
(106, '05', 'SOPETRAN', '761'),
(107, '05', 'TAMESIS', '789'),
(108, '05', 'TARAZA', '790'),
(109, '05', 'TARSO', '792'),
(110, '05', 'TITIRIBI', '809'),
(111, '05', 'TOLEDO', '819'),
(112, '05', 'TURBO', '837'),
(113, '05', 'URAMITA', '842'),
(114, '05', 'URRAO', '847'),
(115, '05', 'VALDIVIA', '854'),
(116, '05', 'VALPARAISO', '856'),
(117, '05', 'VEGACHI', '858'),
(118, '05', 'VENECIA', '861'),
(119, '05', 'VIGIA DEL FUERTE', '873'),
(120, '05', 'YALI', '885'),
(121, '05', 'YARUMAL', '887'),
(122, '05', 'YOLOMBO', '890'),
(123, '05', 'YONDO', '893'),
(124, '05', 'ZARAGOZA', '895'),
(125, '05', 'LA PINTADA', '999'),
(126, '08', 'BARRANQUILLA (Distrito)', '001'),
(127, '08', 'BARANOA', '078'),
(128, '08', 'CAMPO DE LA CRUZ', '137'),
(129, '08', 'CANDELARIA', '141'),
(130, '08', 'GALAPA', '296'),
(131, '08', 'JUAN DE ACOSTA', '372'),
(132, '08', 'LURUACO', '421'),
(133, '08', 'MALAMBO', '433'),
(134, '08', 'MANATI', '436'),
(135, '08', 'PALMAR DE VARELA', '520'),
(136, '08', 'PIOJO', '549'),
(137, '08', 'POLONUEVO', '558'),
(138, '08', 'PONEDERA', '560'),
(139, '08', 'PUERTO COLOMBIA', '573'),
(140, '08', 'REPELON', '606'),
(141, '08', 'SABANAGRANDE', '634'),
(142, '08', 'SABANALARGA', '638'),
(143, '08', 'SANTA LUCIA', '675'),
(144, '08', 'SANTO TOMAS', '685'),
(145, '08', 'SOLEDAD', '758'),
(146, '08', 'SUAN', '770'),
(147, '08', 'TUBARA', '832'),
(148, '08', 'USIACURI', '849'),
(149, '09', 'BARRANQUILLA (Distrito)', '001'),
(150, '11', 'BOGOTA D.C. - USAQUEN', '001'),
(151, '11', 'BOGOTA D.C. - CHAPINERO', '002'),
(152, '11', 'BOGOTA D.C. - SANTA FE', '003'),
(153, '11', 'BOGOTA D.C. - SAN CRISTOBAL', '004'),
(154, '11', 'BOGOTA D.C. - USME', '005'),
(155, '11', 'BOGOTA D.C. - BOSA', '007'),
(156, '11', 'BOGOTA D.C. - KENNEDY', '008'),
(157, '11', 'BOGOTA D.C. - FONTIBON', '009'),
(158, '11', 'BOGOTA D.C. - ENGATIVA', '010'),
(159, '11', 'BOGOTA D.C. - SUBA', '011'),
(160, '11', 'BOGOTA D.C. - BARRIOS UNIDOS', '012'),
(161, '11', 'BOGOTA D.C. - TEUSAQUILLO', '013'),
(162, '11', 'BOGOTA D.C. - MARTIRES', '014'),
(163, '11', 'BOGOTA D.C. - ANTONIO NARIÐO', '015'),
(164, '11', 'BOGOTA D.C. - PUENTE ARANDA', '016'),
(165, '11', 'BOGOTA D.C. - CANDELARIA', '017'),
(166, '11', 'BOGOTA D.C. - RAFAEL URIBE', '018'),
(167, '11', 'BOGOTA D.C. - CIUDAD BOLIVAR', '019'),
(168, '11', 'BOGOTA D.C.-TUNJUELITO', '006'),
(169, '11', 'BOGOTA D.C.-SUMAPAZ', '020'),
(170, '13', 'CARTAGENA (Distrito)', '001'),
(171, '13', 'ALTOS DEL ROSARIO', '030'),
(172, '13', 'ARENAL', '042'),
(173, '13', 'ARJONA', '052'),
(174, '13', 'BARRANCO DE LOBA', '074'),
(175, '13', 'CALAMAR', '140'),
(176, '13', 'CANTAGALLO', '160'),
(177, '13', 'CICUCO', '188'),
(178, '13', 'CORDOBA', '212'),
(179, '13', 'CLEMENCIA', '222'),
(180, '13', 'EL CARMEN DE BOLIVAR', '244'),
(181, '13', 'EL GUAMO', '248'),
(182, '13', 'EL PEÐON', '268'),
(183, '13', 'HATILLO DE LOBA', '300'),
(184, '13', 'MAGANGUE', '430'),
(185, '13', 'MAHATES', '433'),
(186, '13', 'MARGARITA', '440'),
(187, '13', 'MARIA LA BAJA', '442'),
(188, '13', 'MONTECRISTO', '458'),
(189, '13', 'MOMPOS', '468'),
(190, '13', 'MORALES', '473'),
(191, '13', 'PINILLOS', '549'),
(192, '13', 'REGIDOR', '580'),
(193, '13', 'RIO VIEJO', '600'),
(194, '13', 'SAN CRISTOBAL', '620'),
(195, '13', 'SAN ESTANISLAO', '647'),
(196, '13', 'SAN FERNANDO', '650'),
(197, '13', 'SAN JACINTO', '654'),
(198, '13', 'SAN JUAN NEPOMUCENO', '657'),
(199, '13', 'SAN MARTIN DE LOBA', '667'),
(200, '13', 'SAN PABLO', '670'),
(201, '13', 'SANTA CATALINA', '673'),
(202, '13', 'SANTA ROSA', '683'),
(203, '13', 'SANTA ROSA DEL SUR', '688'),
(204, '13', 'SIMITI', '744'),
(205, '13', 'SOPLAVIENTO', '760'),
(206, '13', 'TALAIGUA NUEVO', '780'),
(207, '13', 'TIQUISIO', '810'),
(208, '13', 'TURBACO', '836'),
(209, '13', 'TURBANA', '838'),
(210, '13', 'VILLANUEVA', '873'),
(211, '13', 'ZAMBRANO', '894'),
(212, '14', 'CARTAGENA (Distrito)', '001'),
(213, '15', 'TUNJA', '001'),
(214, '15', 'ALMEIDA', '022'),
(215, '15', 'AQUITANIA', '047'),
(216, '15', 'ARCABUCO', '051'),
(217, '15', 'BELEN', '087'),
(218, '15', 'BERBEO', '090'),
(219, '15', 'BETEITIVA', '092'),
(220, '15', 'BOAVITA', '097'),
(221, '15', 'BOYACA', '104'),
(222, '15', 'BRICENO', '106'),
(223, '15', 'BUENAVISTA', '109'),
(224, '15', 'BUSBANZA', '114'),
(225, '15', 'CALDAS', '131'),
(226, '15', 'CAMPOHERMOSO', '135'),
(227, '15', 'CERINZA', '162'),
(228, '15', 'CHINAVITA', '172'),
(229, '15', 'CHIQUINQUIRA', '176'),
(230, '15', 'CHISCAS', '180'),
(231, '15', 'CHITA', '183'),
(232, '15', 'CHITARAQUE', '185'),
(233, '15', 'CHIVATA', '187'),
(234, '15', 'CIENEGA', '189'),
(235, '15', 'COMBITA', '204'),
(236, '15', 'COPER', '212'),
(237, '15', 'CORRALES', '215'),
(238, '15', 'COVARACHIA', '218'),
(239, '15', 'CUBARA', '223'),
(240, '15', 'CUCAITA', '224'),
(241, '15', 'CUITIVA', '226'),
(242, '15', 'CHIQUIZA', '232'),
(243, '15', 'CHIVOR', '236'),
(244, '15', 'DUITAMA', '238'),
(245, '15', 'EL COCUY', '244'),
(246, '15', 'EL ESPINO', '248'),
(247, '15', 'FIRAVITOBA', '272'),
(248, '15', 'FLORESTA', '276'),
(249, '15', 'GACHANTIVA', '293'),
(250, '15', 'GAMEZA', '296'),
(251, '15', 'GARAGOA', '299'),
(252, '15', 'GUACAMAYAS', '317'),
(253, '15', 'GUATEQUE', '322'),
(254, '15', 'GUAYATA', '325'),
(255, '15', 'GUICAN', '332'),
(256, '15', 'IZA', '362'),
(257, '15', 'JENESANO', '367'),
(258, '15', 'JERICO', '368'),
(259, '15', 'LABRANZAGRANDE', '377'),
(260, '15', 'LA CAPILLA', '380'),
(261, '15', 'LA VICTORIA', '401'),
(262, '15', 'LA UVITA', '403'),
(263, '15', 'VILLA DE LEYVA', '407'),
(264, '15', 'MACANAL', '425'),
(265, '15', 'MARIPI', '442'),
(266, '15', 'MIRAFLORES', '455'),
(267, '15', 'MONGUA', '464'),
(268, '15', 'MONGUI', '466'),
(269, '15', 'MONIQUIRA', '469'),
(270, '15', 'MOTAVITA', '476'),
(271, '15', 'MUZO', '480'),
(272, '15', 'NOBSA', '491'),
(273, '15', 'NUEVO COLON', '494'),
(274, '15', 'OICATA', '500'),
(275, '15', 'OTANCHE', '507'),
(276, '15', 'PACHAVITA', '511'),
(277, '15', 'PAEZ', '514'),
(278, '15', 'PAIPA', '516'),
(279, '15', 'PAJARITO', '518'),
(280, '15', 'PANQUEBA', '522'),
(281, '15', 'PAUNA', '531'),
(282, '15', 'PAYA', '533'),
(283, '15', 'PAZ DE RIO', '537'),
(284, '15', 'PESCA', '542'),
(285, '15', 'PISVA', '550'),
(286, '15', 'PUERTO BOYACA', '572'),
(287, '15', 'QUIPAMA', '580'),
(288, '15', 'RAMIRIQUI', '599'),
(289, '15', 'RAQUIRA', '600'),
(290, '15', 'RONDON', '621'),
(291, '15', 'SABOYA', '632'),
(292, '15', 'SACHICA', '638'),
(293, '15', 'SAMACA', '646'),
(294, '15', 'SAN EDUARDO', '660'),
(295, '15', 'SAN JOSE DE PARE', '664'),
(296, '15', 'SAN LUIS DE GACENO', '667'),
(297, '15', 'SAN MATEO', '673'),
(298, '15', 'SAN MIGUEL DE SEMA', '676'),
(299, '15', 'SAN PABLO DE BORBUR', '681'),
(300, '15', 'SANTANA', '686'),
(301, '15', 'SANTA MARIA', '690'),
(302, '15', 'SANTA ROSA DE VITERBO', '693'),
(303, '15', 'SANTA SOFIA', '696'),
(304, '15', 'SATIVANORTE', '720'),
(305, '15', 'SATIVASUR', '723'),
(306, '15', 'SIACHOQUE', '740'),
(307, '15', 'SOATA', '753'),
(308, '15', 'SOCOTA', '755'),
(309, '15', 'SOCHA', '757'),
(310, '15', 'SOGAMOSO', '759'),
(311, '15', 'SOMONDOCO', '761'),
(312, '15', 'SORA', '762'),
(313, '15', 'SOTAQUIRA', '763'),
(314, '15', 'SORACA', '764'),
(315, '15', 'SUSACON', '774'),
(316, '15', 'SUTAMARCHAN', '776'),
(317, '15', 'SUTATENZA', '778'),
(318, '15', 'TASCO', '790'),
(319, '15', 'TENZA', '798'),
(320, '15', 'TIBANA', '804'),
(321, '15', 'TIBASOSA', '806'),
(322, '15', 'TINJACA', '808'),
(323, '15', 'TIPACOQUE', '810'),
(324, '15', 'TOCA', '814'),
(325, '15', 'TOGUI', '816'),
(326, '15', 'TOPAGA', '820'),
(327, '15', 'TOTA', '822'),
(328, '15', 'TUNUNGUA', '832'),
(329, '15', 'TURMEQUE', '835'),
(330, '15', 'TUTA', '837'),
(331, '15', 'TUTASA', '839'),
(332, '15', 'UMBITA', '842'),
(333, '15', 'VENTAQUEMADA', '861'),
(334, '15', 'VIRACACHA', '879'),
(335, '15', 'ZETAQUIRA', '897'),
(336, '17', 'MANIZALES', '001'),
(337, '17', 'AGUADAS', '013'),
(338, '17', 'ANSERMA', '042'),
(339, '17', 'ARANZAZU', '050'),
(340, '17', 'BELALCAZAR', '088'),
(341, '17', 'CHINCHINA', '174'),
(342, '17', 'FILADELFIA', '272'),
(343, '17', 'LA DORADA', '380'),
(344, '17', 'LA MERCED', '388'),
(345, '17', 'MANZANARES', '433'),
(346, '17', 'MARMATO', '442'),
(347, '17', 'MARQUETALIA', '444'),
(348, '17', 'MARULANDA', '446'),
(349, '17', 'NEIRA', '486'),
(350, '17', 'PACORA', '513'),
(351, '17', 'PALESTINA', '524'),
(352, '17', 'PENSILVANIA', '541'),
(353, '17', 'RIOSUCIO', '614'),
(354, '17', 'RISARALDA', '616'),
(355, '17', 'SALAMINA', '653'),
(356, '17', 'SAMANA', '662'),
(357, '17', 'SUPIA', '777'),
(358, '17', 'VICTORIA', '867'),
(359, '17', 'VILLAMARIA', '873'),
(360, '17', 'VITERBO', '877'),
(361, '18', 'FLORENCIA', '001'),
(362, '18', 'ALBANIA', '029'),
(363, '18', 'BELEN DE LOS ANDAQUIES', '094'),
(364, '18', 'CARTAGENA DEL CHAIRA', '150'),
(365, '18', 'CURILLO', '205'),
(366, '18', 'EL DONCELLO', '247'),
(367, '18', 'EL PAUJIL', '256'),
(368, '18', 'LA MONTAÐITA', '410'),
(369, '18', 'MILAN', '460'),
(370, '18', 'MORELIA', '479'),
(371, '18', 'PUERTO RICO', '592'),
(372, '18', 'SAN JOSE DE FRAGUA', '610'),
(373, '18', 'SAN VICENTE DEL CAGUAN', '753'),
(374, '18', 'SOLANO', '765'),
(375, '18', 'VALPARAISO', '860'),
(376, '19', 'POPAYAN', '001'),
(377, '19', 'ALMAGUER', '022'),
(378, '19', 'ARGELIA', '050'),
(379, '19', 'BALBOA', '075'),
(380, '19', 'BOLIVAR', '100'),
(381, '19', 'BUENOS AIRES', '110'),
(382, '19', 'CAJIBIO', '130'),
(383, '19', 'CALDONO', '137'),
(384, '19', 'CALOTO', '142'),
(385, '19', 'CORINTO', '212'),
(386, '19', 'EL TAMBO', '256'),
(387, '19', 'FLORENCIA', '290'),
(388, '19', 'GUAPI', '318'),
(389, '19', 'INZA', '355'),
(390, '19', 'JAMBALO', '364'),
(391, '19', 'LA SIERRA', '392'),
(392, '19', 'LA VEGA', '397'),
(393, '19', 'LOPEZ', '418'),
(394, '19', 'MERCADERES', '450'),
(395, '19', 'MIRANDA', '455'),
(396, '19', 'MORALES', '473'),
(397, '19', 'PADILLA', '513'),
(398, '19', 'PAEZ  (Belalcazar )', '517'),
(399, '19', 'PATIA  (EL BORDO)', '532'),
(400, '19', 'PIENDAMO', '548'),
(401, '19', 'PUERTO TEJADA', '573'),
(402, '19', 'PURACE ( Coconuco )', '585'),
(403, '19', 'ROSAS', '622'),
(404, '19', 'SAN SEBASTIAN', '693'),
(405, '19', 'SANTANDER DE QUILICHAO', '698'),
(406, '19', 'SANTA ROSA', '701'),
(407, '19', 'SILVIA', '743'),
(408, '19', 'SOTARA  (Paispamba )', '760'),
(409, '19', 'SUAREZ', '780'),
(410, '19', 'TIMBIO', '807'),
(411, '19', 'TIMBIQUI', '809'),
(412, '19', 'TORIBIO', '821'),
(413, '19', 'TOTORO', '824'),
(414, '20', 'VALLEDUPAR', '001'),
(415, '20', 'AGUACHICA', '011'),
(416, '20', 'AGUSTIN CODAZZI', '013'),
(417, '20', 'ASTREA', '032'),
(418, '20', 'BECERRIL', '045'),
(419, '20', 'BOSCONIA', '060'),
(420, '20', 'CHIMICHAGUA', '175'),
(421, '20', 'CHIRIGUANA', '178'),
(422, '20', 'CURUMANI', '228'),
(423, '20', 'EL COPEY', '238'),
(424, '20', 'EL PASO', '250'),
(425, '20', 'GAMARRA', '295'),
(426, '20', 'GONZALEZ', '310'),
(427, '20', 'LA GLORIA', '383'),
(428, '20', 'LA JAGUA DE IBIRICO', '400'),
(429, '20', 'MANAURE  (Balc¾n Del Cesar)', '443'),
(430, '20', 'PAILITAS', '517'),
(431, '20', 'PELAYA', '550'),
(432, '20', 'RIO DE ORO', '614'),
(433, '20', 'LA PAZ', '621'),
(434, '20', 'SAN ALBERTO', '710'),
(435, '20', 'SAN DIEGO', '750'),
(436, '20', 'SAN MARTIN', '770'),
(437, '20', 'TAMALAMEQUE', '787'),
(438, '23', 'MONTERIA', '001'),
(439, '23', 'AYAPEL', '068'),
(440, '23', 'BUENAVISTA', '079'),
(441, '23', 'CANALETE', '090'),
(442, '23', 'CERETE', '162'),
(443, '23', 'CHIMA', '168'),
(444, '23', 'CHINU', '182'),
(445, '23', 'CIENAGA DE ORO', '189'),
(446, '23', 'LORICA', '417'),
(447, '23', 'LOS CORDOBAS', '419'),
(448, '23', 'MOMIL', '464'),
(449, '23', 'MONTELIBANO', '466'),
(450, '23', 'MOÐITOS', '500'),
(451, '23', 'PLANETA RICA', '555'),
(452, '23', 'PUEBLO NUEVO', '570'),
(453, '23', 'PUERTO ESCONDIDO', '574'),
(454, '23', 'PUERTO LIBERTADOR', '580'),
(455, '23', 'PURISIMA', '586'),
(456, '23', 'SAHAGUN', '660'),
(457, '23', 'SAN ANDRES SOTAVENTO', '670'),
(458, '23', 'SAN ANTERO', '672'),
(459, '23', 'SAN BERNARDO DEL VIENTO', '675'),
(460, '23', 'SAN CARLOS', '678'),
(461, '23', 'SAN PELAYO', '686'),
(462, '23', 'TIERRALTA', '807'),
(463, '23', 'VALENCIA', '855'),
(464, '23', 'TUCHIN', '525'),
(465, '25', 'AGUA DE DIOS', '001'),
(466, '25', 'ALBAN', '019'),
(467, '25', 'ANAPOIMA', '035'),
(468, '25', 'ANOLAIMA', '040'),
(469, '25', 'ARBELAEZ', '053'),
(470, '25', 'BELTRAN', '086'),
(471, '25', 'BITUIMA', '095'),
(472, '25', 'BOJACA', '099'),
(473, '25', 'CABRERA', '120'),
(474, '25', 'CACHIPAY', '123'),
(475, '25', 'CAJICA', '126'),
(476, '25', 'CAPARRAPI', '148'),
(477, '25', 'CAQUEZA', '151'),
(478, '25', 'CARMEN DE CARUPA', '154'),
(479, '25', 'CHAGUANI', '168'),
(480, '25', 'CHIA', '175'),
(481, '25', 'CHIPAQUE', '178'),
(482, '25', 'CHOACHI', '181'),
(483, '25', 'CHOCONTA', '183'),
(484, '25', 'COGUA', '200'),
(485, '25', 'COTA', '214'),
(486, '25', 'CUCUNUBA', '224'),
(487, '25', 'EL COLEGIO', '245'),
(488, '25', 'EL PEÐON', '258'),
(489, '25', 'FACATATIVA', '269'),
(490, '25', 'FOMEQUE', '279'),
(491, '25', 'FOSCA', '281'),
(492, '25', 'FUNZA', '286'),
(493, '25', 'FUQUENE', '288'),
(494, '25', 'FUSAGASUGA', '290'),
(495, '25', 'GACHALA', '293'),
(496, '25', 'GACHANCIPA', '295'),
(497, '25', 'GACHETA', '297'),
(498, '25', 'GAMA', '299'),
(499, '25', 'GIRARDOT', '307'),
(500, '25', 'GRANADA', '312'),
(501, '25', 'GUACHETA', '317'),
(502, '25', 'GUADUAS', '320'),
(503, '25', 'GUASCA', '322'),
(504, '25', 'GUATAQUI', '324'),
(505, '25', 'GUATAVITA', '326'),
(506, '25', 'GUAYABAL DE SIQUIMA', '328'),
(507, '25', 'GUAYABETAL', '335'),
(508, '25', 'GUTIERREZ', '339'),
(509, '25', 'JERUSALEN', '368'),
(510, '25', 'JUNIN', '372'),
(511, '25', 'LA CALERA', '377'),
(512, '25', 'LA MESA', '386'),
(513, '25', 'LA PALMA', '394'),
(514, '25', 'LA PEÐA', '398'),
(515, '25', 'LA VEGA', '402'),
(516, '25', 'LENGUAZAQUE', '407'),
(517, '25', 'MACHETA', '426'),
(518, '25', 'MADRID', '430'),
(519, '25', 'MANTA', '436'),
(520, '25', 'MEDINA', '438'),
(521, '25', 'MOSQUERA', '473'),
(522, '25', 'NARIÐO', '483'),
(523, '25', 'NEMOCON', '486'),
(524, '25', 'NILO', '488'),
(525, '25', 'NIMAIMA', '489'),
(526, '25', 'NOCAIMA', '491'),
(527, '25', 'VENECIA', '506'),
(528, '25', 'PACHO', '513'),
(529, '25', 'PAIME', '518'),
(530, '25', 'PANDI', '524'),
(531, '25', 'PARATEBUENO', '530'),
(532, '25', 'PASCA', '535'),
(533, '25', 'PUERTO SALGAR', '572'),
(534, '25', 'PULI', '580'),
(535, '25', 'QUEBRADANEGRA', '592'),
(536, '25', 'QUETAME', '594'),
(537, '25', 'QUIPILE', '596'),
(538, '25', 'APULO', '599'),
(539, '25', 'RICAURTE', '612'),
(540, '25', 'S.ANTONIO TEQUENDAMA', '645'),
(541, '25', 'SAN BERNARDO', '649'),
(542, '25', 'SAN CAYETANO', '653'),
(543, '25', 'SAN FRANCISCO', '658'),
(544, '25', 'SAN JUAN DE RIO SECO', '662'),
(545, '25', 'SASAIMA', '718'),
(546, '25', 'SESQUILE', '736'),
(547, '25', 'SIBATE', '740'),
(548, '25', 'SILVANIA', '743'),
(549, '25', 'SIMIJACA', '745'),
(550, '25', 'SOACHA', '754'),
(551, '25', 'SOPO', '758'),
(552, '25', 'SUBACHOQUE', '769'),
(553, '25', 'SUESCA', '772'),
(554, '25', 'SUPATA', '777'),
(555, '25', 'SUSA', '779'),
(556, '25', 'SUTATAUSA', '781'),
(557, '25', 'TABIO', '785'),
(558, '25', 'TAUSA', '793'),
(559, '25', 'TENA', '797'),
(560, '25', 'TENJO', '799'),
(561, '25', 'TIBACUY', '805'),
(562, '25', 'TIBIRITA', '807'),
(563, '25', 'TOCAIMA', '815'),
(564, '25', 'TOCANCIPA', '817'),
(565, '25', 'TOPAIPI', '823'),
(566, '25', 'UBALA', '839'),
(567, '25', 'UBAQUE', '841'),
(568, '25', 'UBATE', '843'),
(569, '25', 'UNE', '845'),
(570, '25', 'UTICA', '851'),
(571, '25', 'VERGARA', '862'),
(572, '25', 'VIANI', '867'),
(573, '25', 'VILLAGOMEZ', '871'),
(574, '25', 'VILLAPINZON', '873'),
(575, '25', 'VILLETA', '875'),
(576, '25', 'VIOTA', '878'),
(577, '25', 'YACOPI', '885'),
(578, '25', 'ZIPACON', '898'),
(579, '25', 'ZIPAQUIRA', '899'),
(580, '27', 'QUIBDO', '001'),
(581, '27', 'ALTO BAUDO ( Pie de Pato )', '025'),
(582, '27', 'BAGADO', '073'),
(583, '27', 'BAHIA SOLANO ( Mutis )', '075'),
(584, '27', 'BAJO BAUDO ( Pizarro )', '077'),
(585, '27', 'LITORAL DE SAN JUAN (Docordo)', '082'),
(586, '27', 'BOJAYA ( Bellavista )', '099'),
(587, '27', 'CANTON DEL SAN PABLO', '135'),
(588, '27', 'CONDOTO', '205'),
(589, '27', 'EL CARMEN', '245'),
(590, '27', 'ITSMINA', '361'),
(591, '27', 'JURADO', '372'),
(592, '27', 'LLORO', '413'),
(593, '27', 'NOVITA', '491'),
(594, '27', 'NUQUI', '495'),
(595, '27', 'RIOSUCIO', '615'),
(596, '27', 'SAN JOSE DEL PALMAR', '660'),
(597, '27', 'SIPI', '745'),
(598, '27', 'TADO', '787'),
(599, '27', 'UNGUIA', '800'),
(600, '41', 'NEIVA', '001'),
(601, '41', 'AGRADO', '013'),
(602, '41', 'AIPE', '016'),
(603, '41', 'ALTAMIRA', '026'),
(604, '41', 'BARAYA', '078'),
(605, '41', 'CAMPOALEGRE', '132'),
(606, '41', 'COLOMBIA', '206'),
(607, '41', 'ELIAS', '244'),
(608, '41', 'GARZON', '298'),
(609, '41', 'GIGANTE', '306'),
(610, '41', 'GUADALUPE', '319'),
(611, '41', 'HOBO', '349'),
(612, '41', 'IQUIRA', '357'),
(613, '41', 'ISNOS', '359'),
(614, '41', 'LA ARGENTINA', '378'),
(615, '41', 'LA PLATA', '396'),
(616, '41', 'NATAGA', '483'),
(617, '41', 'OPORAPA', '503'),
(618, '41', 'PAICOL', '518'),
(619, '41', 'PALERMO', '524'),
(620, '41', 'PALESTINA', '530'),
(621, '41', 'PITAL', '548'),
(622, '41', 'PITALITO', '551'),
(623, '41', 'RIVERA', '615'),
(624, '41', 'SALADOBLANCO', '660'),
(625, '41', 'SAN AGUSTIN', '668'),
(626, '41', 'SANTA MARIA', '676'),
(627, '41', 'SUAZA', '770'),
(628, '41', 'TARQUI', '791'),
(629, '41', 'TESALIA', '797'),
(630, '41', 'TELLO', '799'),
(631, '41', 'TERUEL', '801'),
(632, '41', 'TIMANA', '807'),
(633, '41', 'VILLAVIEJA', '872'),
(634, '41', 'YAGUARA', '885'),
(635, '41', 'PALO CABILDO', '900'),
(636, '44', 'RIOHACHA', '001'),
(637, '44', 'BARRANCAS', '078'),
(638, '44', 'DIBULLA', '090'),
(639, '44', 'DISTRACCION', '098'),
(640, '44', 'EL MOLINO', '110'),
(641, '44', 'FONSECA', '279'),
(642, '44', 'HATO NUEVO', '378'),
(643, '44', 'MAICAO', '430'),
(644, '44', 'PITIÐO DEL CARMEN', '545'),
(645, '44', 'MANAURE', '560'),
(646, '44', 'SAN JUAN DEL CESAR', '650'),
(647, '44', 'URIBIA', '847'),
(648, '44', 'URUMITA', '855'),
(649, '44', 'VILLANUEVA', '874'),
(650, '47', 'SANTA MARTA', '001'),
(651, '47', 'ARACATACA', '053'),
(652, '47', 'ARIGUANI ( El DifÝcil )', '058'),
(653, '47', 'CERRO SAN ANTONIO', '161'),
(654, '47', 'CHIVOLO', '170'),
(655, '47', 'CIENAGA', '189'),
(656, '47', 'EL BANCO', '245'),
(657, '47', 'EL PIÐON', '258'),
(658, '47', 'EL RETEN', '268'),
(659, '47', 'FUNDACION', '288'),
(660, '47', 'GUAMAL', '318'),
(661, '47', 'PEDRAZA', '541'),
(662, '47', 'PIVIJAY', '551'),
(663, '47', 'PLATO', '555'),
(664, '47', 'PUEBLOVIEJO', '570'),
(665, '47', 'REMOLINO', '605'),
(666, '47', 'SALAMINA', '675'),
(667, '47', 'SAN SEBASTIAN BUENAVIST', '692'),
(668, '47', 'SAN ZENON', '703'),
(669, '47', 'SANTA ANA', '707'),
(670, '47', 'SITIONUEVO', '745'),
(671, '47', 'TENERIFE', '798'),
(672, '48', 'SANTA MARTA D.E.', '001'),
(673, '50', 'VILLAVICENCIO', '001'),
(674, '50', 'BARRANCA DE UPIA', '110'),
(675, '50', 'CABUYARO', '124'),
(676, '50', 'CASTILLA LA NUEVA', '150'),
(677, '50', 'CUBARRAL', '223'),
(678, '50', 'CUMARAL', '226'),
(679, '50', 'EL CALVARIO', '245'),
(680, '50', 'EL CASTILLO', '251'),
(681, '50', 'EL DORADO', '270'),
(682, '50', 'FUENTE DE ORO', '287'),
(683, '50', 'GRANADA', '313'),
(684, '50', 'GUAMAL', '318'),
(685, '50', 'MAPIRIPAN', '325'),
(686, '50', 'MESETAS', '330'),
(687, '50', 'LA MACARENA', '350'),
(688, '50', 'LA URIBE', '370'),
(689, '50', 'LEJANIAS', '400'),
(690, '50', 'PUERTO CONCORDIA', '450'),
(691, '50', 'PUERTO GAITAN', '568'),
(692, '50', 'PUERTO LOPEZ', '573'),
(693, '50', 'PUERTO LLERAS', '577'),
(694, '50', 'PUERTO RICO', '590'),
(695, '50', 'RESTREPO', '606'),
(696, '50', 'SAN CARLOS GUAROA', '680'),
(697, '50', 'SAN JUAN DE ARAMA', '683'),
(698, '50', 'SAN JUANITO', '686'),
(699, '50', 'SAN MARTIN', '689'),
(700, '50', 'VISTA HERMOSA', '711'),
(701, '50', 'FUENTE DE ORO', '287'),
(702, '52', 'PASTO', '001'),
(703, '52', 'ALBAN ( San JosÚ )', '019'),
(704, '52', 'ALDANA', '022'),
(705, '52', 'ANCUYA', '036'),
(706, '52', 'ARBOLEDA ( Berruecos )', '051'),
(707, '52', 'BARBACOAS', '079'),
(708, '52', 'BELEN', '083'),
(709, '52', 'BUESACO', '110'),
(710, '52', 'COLON ( GÚnova )', '203'),
(711, '52', 'CONSACA', '207'),
(712, '52', 'CONTADERO', '210'),
(713, '52', 'CORDOBA', '215'),
(714, '52', 'CUASPUD ( Carlosama )', '224'),
(715, '52', 'CUMBAL', '227'),
(716, '52', 'CUMBITARA', '233'),
(717, '52', 'CHACHAGUI', '240'),
(718, '52', 'EL CHARCO', '250'),
(719, '52', 'EL ROSARIO', '256'),
(720, '52', 'EL TABLON', '258'),
(721, '52', 'EL TAMBO', '260'),
(722, '52', 'GUACHUCAL', '317'),
(723, '52', 'GUAITARILLA', '320'),
(724, '52', 'GUALMATAN', '323'),
(725, '52', 'ILES', '352'),
(726, '52', 'IMUES', '354'),
(727, '52', 'IPIALES', '356'),
(728, '52', 'LA CRUZ', '378'),
(729, '52', 'LA LLANADA', '385'),
(730, '52', 'LA TOLA', '390'),
(731, '52', 'LA UNION', '399'),
(732, '52', 'LEIVA', '405'),
(733, '52', 'LINARES', '411'),
(734, '52', 'LOS ANDES ( Sotomayor )', '418'),
(735, '52', 'MAGUI ( Payßn )', '427'),
(736, '52', 'MALLAMA ( Piedrancha )', '435'),
(737, '52', 'MOSQUERA', '473'),
(738, '52', 'OLAYA HERRERA ( Bocas de Satinga )', '490'),
(739, '52', 'OSPINA', '506'),
(740, '52', 'FRANCISCO PIZARRO ( Salahonda )', '520'),
(741, '52', 'POLICARPA', '540'),
(742, '52', 'POTOSI', '560'),
(743, '52', 'PROVIDENCIA', '565'),
(744, '52', 'PUERRES', '573'),
(745, '52', 'PUPIALES', '585'),
(746, '52', 'RICAURTE', '612'),
(747, '52', 'ROBERTO PAYAN ( San JosÚ )', '621'),
(748, '52', 'SAMANIEGO', '678'),
(749, '52', 'SANDONA', '683'),
(750, '52', 'SAN BERNARDO', '685'),
(751, '52', 'SAN LORENZO', '687'),
(752, '52', 'SAN PABLO', '693'),
(753, '52', 'SAN PEDRO DE CARTAGO ( Cartago )', '694'),
(754, '52', 'SANTA BARBARA ( Iscuande )', '696'),
(755, '52', 'SANTACRUZ ( Guachaves )', '699'),
(756, '52', 'SAPUYES', '720'),
(757, '52', 'TAMINANGO', '786'),
(758, '52', 'TANGUA', '788'),
(759, '52', 'TUMACO', '835'),
(760, '52', 'TUQUERRES', '838'),
(761, '52', 'YACUANQUER', '885'),
(762, '54', 'CUCUTA', '001'),
(763, '54', 'ABREGO', '003'),
(764, '54', 'ARBOLEDAS', '051'),
(765, '54', 'BOCHALEMA', '099'),
(766, '54', 'BUCARASICA', '109'),
(767, '54', 'CACOTA', '125'),
(768, '54', 'CACHIRA', '128'),
(769, '54', 'CHINACOTA', '172'),
(770, '54', 'CHITAGA', '174'),
(771, '54', 'CONVENCION', '206'),
(772, '54', 'CUCUTILLA', '223'),
(773, '54', 'DURANIA', '239'),
(774, '54', 'EL CARMEN', '245'),
(775, '54', 'EL TARRA', '250'),
(776, '54', 'EL ZULIA', '261'),
(777, '54', 'GRAMALOTE', '313'),
(778, '54', 'HACARI', '344'),
(779, '54', 'HERRAN', '347'),
(780, '54', 'LABATECA', '377'),
(781, '54', 'LA ESPERANZA', '385'),
(782, '54', 'LA PLAYA', '398'),
(783, '54', 'LOS PATIOS', '405'),
(784, '54', 'LOURDES', '418'),
(785, '54', 'MUTISCUA', '480'),
(786, '54', 'OCAÐA', '498'),
(787, '54', 'PAMPLONA', '518'),
(788, '54', 'PAMPLONITA', '520'),
(789, '54', 'PUERTO SANTANDER', '553'),
(790, '54', 'RAGONVALIA', '599'),
(791, '54', 'SALAZAR', '660'),
(792, '54', 'SAN CALIXTO', '670'),
(793, '54', 'SAN CAYETANO', '673'),
(794, '54', 'SANTIAGO', '680'),
(795, '54', 'SARDINATA', '720'),
(796, '54', 'SILOS', '743'),
(797, '54', 'TEORAMA', '800'),
(798, '54', 'TIBU', '810'),
(799, '54', 'TOLEDO', '820'),
(800, '54', 'VILLA CARO', '871'),
(801, '54', 'VILLA DEL ROSARIO', '874'),
(802, '63', 'ARMENIA', '001'),
(803, '63', 'BUENAVISTA', '111'),
(804, '63', 'CALARCA', '130'),
(805, '63', 'CIRCASIA', '190'),
(806, '63', 'CORDOBA', '212'),
(807, '63', 'FILANDIA', '272'),
(808, '63', 'GENOVA', '302'),
(809, '63', 'LA TEBAIDA', '401'),
(810, '63', 'MONTENEGRO', '470'),
(811, '63', 'PIJAO', '548'),
(812, '63', 'QUIMBAYA', '594'),
(813, '63', 'SALENTO', '690'),
(814, '66', 'PEREIRA', '001'),
(815, '66', 'APIA', '045'),
(816, '66', 'BALBOA', '075'),
(817, '66', 'BELEN DE UMBRIA', '088'),
(818, '66', 'DOS QUEBRADAS', '170'),
(819, '66', 'GUATICA', '318'),
(820, '66', 'LA CELIA', '383'),
(821, '66', 'LA VIRGINIA', '400'),
(822, '66', 'MARSELLA', '440'),
(823, '66', 'MISTRATO', '456'),
(824, '66', 'PUEBLO RICO', '572'),
(825, '66', 'QUINCHIA', '594'),
(826, '66', 'SANTA ROSA DE CABAL', '682'),
(827, '66', 'SANTUARIO', '687'),
(828, '68', 'BUCARAMANGA', '001'),
(829, '68', 'AGUADA', '013'),
(830, '68', 'ARATOCA', '051'),
(831, '68', 'BARBOSA', '077'),
(832, '68', 'BARICHARA', '079'),
(833, '68', 'BARRANCABERMEJA', '081'),
(834, '68', 'BETULIA', '092'),
(835, '68', 'BOLIVAR', '101'),
(836, '68', 'CABRERA', '121'),
(837, '68', 'CALIFORNIA', '132'),
(838, '68', 'CAPITANEJO', '147'),
(839, '68', 'CARCASI', '152'),
(840, '68', 'CEPITA', '160'),
(841, '68', 'CERRITO', '162'),
(842, '68', 'CHARALA', '167'),
(843, '68', 'CHARTA', '169'),
(844, '68', 'CHIMA', '176'),
(845, '68', 'CHIPATA', '179'),
(846, '68', 'CIMITARRA', '190'),
(847, '68', 'CONCEPCION', '207'),
(848, '68', 'CONFINES', '209'),
(849, '68', 'CONTRATACION', '211'),
(850, '68', 'COROMORO', '217'),
(851, '68', 'CURITI', '229'),
(852, '68', 'EL CARMEN', '235'),
(853, '68', 'EL GUACAMAYO', '245'),
(854, '68', 'EL PEÐON', '250'),
(855, '68', 'EL PLAYON', '255'),
(856, '68', 'ENCINO', '264'),
(857, '68', 'ENCISO', '266'),
(858, '68', 'FLORIAN', '271'),
(859, '68', 'FLORIDABLANCA', '276'),
(860, '68', 'GALAN', '296'),
(861, '68', 'GAMBITA', '298'),
(862, '68', 'GIRON', '307'),
(863, '68', 'GUACA', '318'),
(864, '68', 'GUADALUPE', '320'),
(865, '68', 'GUAPOTA', '322'),
(866, '68', 'GUAVATA', '324'),
(867, '68', 'GUEPSA', '327'),
(868, '68', 'HATO', '344'),
(869, '68', 'JESUS MARIA', '368'),
(870, '68', 'JORDAN', '370'),
(871, '68', 'LA BELLEZA', '377'),
(872, '68', 'LANDAZURI', '385'),
(873, '68', 'LA PAZ', '397'),
(874, '68', 'LEBRIJA', '406'),
(875, '68', 'LOS SANTOS', '418'),
(876, '68', 'MACARAVITA', '425'),
(877, '68', 'MALAGA', '432'),
(878, '68', 'MATANZA', '444'),
(879, '68', 'MOGOTES', '464'),
(880, '68', 'MOLAGAVITA', '468'),
(881, '68', 'OCAMONTE', '498'),
(882, '68', 'OIBA', '500'),
(883, '68', 'ONZAGA', '502'),
(884, '68', 'PALMAR', '522'),
(885, '68', 'PALMAS DEL SOCORRO', '524'),
(886, '68', 'PARAMO', '533'),
(887, '68', 'PIEDECUESTA', '547'),
(888, '68', 'PINCHOTE', '549'),
(889, '68', 'PUENTE NACIONAL', '572'),
(890, '68', 'PUERTO PARRA', '573'),
(891, '68', 'PUERTO WILCHES', '575'),
(892, '68', 'RIONEGRO', '615'),
(893, '68', 'SABANA DE TORRES', '655'),
(894, '68', 'SAN ANDRES', '669'),
(895, '68', 'SAN BENITO', '673'),
(896, '68', 'SAN GIL', '679'),
(897, '68', 'SAN JOAQUIN', '682'),
(898, '68', 'SAN JOSE DE MIRANDA', '684'),
(899, '68', 'SAN MIGUEL', '686'),
(900, '68', 'SAN VICENTE DE CHUCURI', '689'),
(901, '68', 'SANTA BARBARA', '705'),
(902, '68', 'SANTA HELENA DEL OPON', '720'),
(903, '68', 'SIMACOTA', '745'),
(904, '68', 'SOCORRO', '755'),
(905, '68', 'SUAITA', '770'),
(906, '68', 'SUCRE', '773'),
(907, '68', 'SURATA', '780'),
(908, '68', 'TONA', '820'),
(909, '68', 'VALLE DE SAN JOSE', '855'),
(910, '68', 'VELEZ', '861'),
(911, '68', 'VETAS', '867'),
(912, '68', 'VILLANUEVA', '872'),
(913, '68', 'ZAPATOCA', '895'),
(914, '70', 'COVEÐAS', '381'),
(915, '70', 'SINCELEJO', '001'),
(916, '70', 'BUENAVISTA', '110'),
(917, '70', 'CAIMITO', '124'),
(918, '70', 'COLOSO', '204'),
(919, '70', 'COROZAL', '215'),
(920, '70', 'CHALAN', '230'),
(921, '70', 'GALERAS', '235'),
(922, '70', 'GUARANDA', '265'),
(923, '70', 'LA UNION', '400'),
(924, '70', 'LOS PALMITOS', '418'),
(925, '70', 'MAJAGUAL', '429'),
(926, '70', 'MORROA', '473'),
(927, '70', 'OVEJAS', '508'),
(928, '70', 'PALMITO', '523'),
(929, '70', 'SAMPUES', '670'),
(930, '70', 'SAN BENITO ABAD', '678'),
(931, '70', 'SAN JUAN DE BETULIA', '702'),
(932, '70', 'SAN MARCOS', '708'),
(933, '70', 'SAN ONOFRE', '713'),
(934, '70', 'SAN PEDRO', '717'),
(935, '70', 'SINCE', '742'),
(936, '70', 'SUCRE', '771'),
(937, '70', 'TOLU', '820'),
(938, '70', 'TOLUVIEJO', '823'),
(939, '70', 'EL ROBLE', '77'),
(940, '73', 'IBAGUE', '001'),
(941, '73', 'ALPUJARRA', '024'),
(942, '73', 'ALVARADO', '026'),
(943, '73', 'AMBALEMA', '030'),
(944, '73', 'ANZOATEGUI', '043'),
(945, '73', 'ARMERO (GUAYABAL)', '055'),
(946, '73', 'ATACO', '067'),
(947, '73', 'CAJAMARCA', '124'),
(948, '73', 'CARMEN DE APICALA', '148'),
(949, '73', 'CASABIANCA', '152'),
(950, '73', 'CHAPARRAL', '168'),
(951, '73', 'COELLO', '200'),
(952, '73', 'COYAIMA', '217'),
(953, '73', 'CUNDAY', '226'),
(954, '73', 'DOLORES', '236'),
(955, '73', 'ESPINAL', '268'),
(956, '73', 'FALAN', '270'),
(957, '73', 'FLANDES', '275'),
(958, '73', 'FRESNO', '283'),
(959, '73', 'GUAMO', '319'),
(960, '73', 'HERVEO', '347'),
(961, '73', 'HONDA', '349'),
(962, '73', 'ICONONZO', '352'),
(963, '73', 'LERIDA', '408'),
(964, '73', 'LIBANO', '411'),
(965, '73', 'MARIQUITA', '443'),
(966, '73', 'MELGAR', '449'),
(967, '73', 'MURILLO', '461'),
(968, '73', 'NATAGAIMA', '483'),
(969, '73', 'ORTEGA', '504'),
(970, '73', 'PIEDRAS', '547'),
(971, '73', 'PLANADAS', '555'),
(972, '73', 'PRADO', '563'),
(973, '73', 'PURIFICACION', '585'),
(974, '73', 'RIOBLANCO', '616'),
(975, '73', 'RONCESVALLES', '622'),
(976, '73', 'ROVIRA', '624'),
(977, '73', 'SALDAÐA', '671'),
(978, '73', 'SAN ANTONIO', '675'),
(979, '73', 'SAN LUIS', '678'),
(980, '73', 'SANTA ISABEL', '686'),
(981, '73', 'SUAREZ', '770'),
(982, '73', 'VALLE DE SAN JUAN', '854'),
(983, '73', 'VENADILLO', '861'),
(984, '73', 'VILLAHERMOSA', '870'),
(985, '73', 'VILLARRICA', '873'),
(986, '73', 'PALOCABILDO', '900'),
(987, '76', 'CALI', '001'),
(988, '76', 'ANDALUCIA', '036'),
(989, '76', 'ANSERMANUEVO', '041'),
(990, '76', 'ARGELIA', '054'),
(991, '76', 'BOLIVAR', '100'),
(992, '76', 'BUENAVENTURA', '109'),
(993, '76', 'BUGA', '111'),
(994, '76', 'BUGALAGRANDE', '113'),
(995, '76', 'CAICEDONIA', '122'),
(996, '76', 'DARIEN-CALIMA', '126'),
(997, '76', 'CANDELARIA', '130'),
(998, '76', 'CARTAGO', '147'),
(999, '76', 'DAGUA', '233'),
(1000, '76', 'EL AGUILA', '243'),
(1001, '76', 'EL CAIRO', '246'),
(1002, '76', 'EL CERRITO', '248'),
(1003, '76', 'EL DOVIO', '250'),
(1004, '76', 'FLORIDA', '275'),
(1005, '76', 'GINEBRA', '306'),
(1006, '76', 'GUACARI', '318'),
(1007, '76', 'JAMUNDI', '364'),
(1008, '76', 'LA CUMBRE', '377'),
(1009, '76', 'LA UNION', '400'),
(1010, '76', 'LA VICTORIA', '403'),
(1011, '76', 'OBANDO', '497'),
(1012, '76', 'PALMIRA', '520'),
(1013, '76', 'PRADERA', '563'),
(1014, '76', 'RESTREPO', '606'),
(1015, '76', 'RIOFRIO', '616'),
(1016, '76', 'ROLDANILLO', '622'),
(1017, '76', 'SAN PEDRO', '670'),
(1018, '76', 'SEVILLA', '736'),
(1019, '76', 'TORO', '823'),
(1020, '76', 'TRUJILLO', '828'),
(1021, '76', 'TULUA', '834'),
(1022, '76', 'ULLOA', '845'),
(1023, '76', 'VERSALLES', '863'),
(1024, '76', 'VIJES', '869'),
(1025, '76', 'YOTOCO', '890'),
(1026, '76', 'YUMBO', '892'),
(1027, '76', 'ZARZAL', '895'),
(1028, '81', 'ARAUCA', '001'),
(1029, '81', 'ARAUQUITA', '065'),
(1030, '81', 'CRAVO NORTE', '220'),
(1031, '81', 'FORTUL', '300'),
(1032, '81', 'PUERTO RONDON', '591'),
(1033, '81', 'SARAVENA', '736'),
(1034, '81', 'TAME', '794'),
(1035, '85', 'YOPAL', '001'),
(1036, '85', 'AGUAZUL', '010'),
(1037, '85', 'CHAMEZA', '015'),
(1038, '85', 'HATO COROZAL', '125'),
(1039, '85', 'LA SALINA', '136'),
(1040, '85', 'MANI', '139'),
(1041, '85', 'MONTERREY', '162'),
(1042, '85', 'NUNCHIA', '225'),
(1043, '85', 'OROCUE', '230'),
(1044, '85', 'PAZ DE ARIPORO', '250'),
(1045, '85', 'PORE', '263'),
(1046, '85', 'RECETOR', '279'),
(1047, '85', 'SABANALARGA', '300'),
(1048, '85', 'SACAMA', '315'),
(1049, '85', 'SAN LUIS DE PALENQUE', '325'),
(1050, '85', 'TAMARA', '400'),
(1051, '85', 'TAURAMENA', '410'),
(1052, '85', 'TRINIDAD', '430'),
(1053, '85', 'VILLANUEVA', '440'),
(1054, '86', 'MOCOA', '001'),
(1055, '86', 'COLON', '219'),
(1056, '86', 'ORITO', '320'),
(1057, '86', 'PUERTO ASIS', '568'),
(1058, '86', 'PUERTO CAICEDO', '569'),
(1059, '86', 'PUERTO GUZMAN', '571'),
(1060, '86', 'PUERTO LEGUIZAMO', '573'),
(1061, '86', 'SIBUNDOY', '749'),
(1062, '86', 'SAN FRANCISCO', '755'),
(1063, '86', 'SAN MIGUEL', '757'),
(1064, '86', 'SANTIAGO', '760'),
(1065, '86', 'VALLE DEL GUAMEZ-HORMIGA', '865'),
(1066, '86', 'VILLAGARZON', '885'),
(1067, '88', 'SAN ANDRES', '001'),
(1068, '88', 'PROVIDENCIA', '564'),
(1069, '91', 'LETICIA', '001'),
(1070, '91', 'EL ENCANTO', '263'),
(1071, '91', 'LA CHORRERA', '405'),
(1072, '91', 'LA PEDRERA', '407'),
(1073, '91', 'MIRITI-PARANA', '460'),
(1074, '91', 'PUERTO NARIÐO', '540'),
(1075, '91', 'PTO SANTANDER', '669'),
(1076, '91', 'TARAPACA', '798'),
(1077, '91', '', ''),
(1078, '94', 'INIRIDA', '001'),
(1079, '94', 'GUAVIARE-BARRANCO MINAS', '343'),
(1080, '94', 'SAN FELIPE', '883'),
(1081, '94', 'PUERTO COLOMBIA', '884'),
(1082, '94', 'GUADALUPE', '885'),
(1083, '94', 'CACAHUAL', '886'),
(1084, '94', 'PANA PANA', '887'),
(1085, '94', 'MORICHAL NUEVO', '888'),
(1086, '95', 'SAN JOSE DEL GUAVIARE', '001'),
(1087, '95', 'CALAMAR', '015'),
(1088, '95', 'EL RETORNO', '025'),
(1089, '95', 'MIRAFLORES', '200'),
(1090, '97', 'MITU', '001'),
(1091, '97', 'CARURU', '161'),
(1092, '97', 'PACOA', '511'),
(1093, '97', 'VILLA FATIMA', '555'),
(1094, '97', 'TARAIRA', '666'),
(1095, '97', 'PAPUNAHUA', '777'),
(1096, '97', 'ACARICUARA', '888'),
(1097, '97', 'YAVARATE', '889'),
(1098, '99', 'PUERTO CARREÐO', '001'),
(1099, '99', 'LA PRIMAVERA', '524'),
(1100, '99', 'SANTA RITA', '572'),
(1101, '99', 'SANTA ROSALIA', '624'),
(1102, '99', 'SAN JOSE DE OCUNE', '760'),
(1103, '99', 'CUMARIBO', '773'),
(1104, '99', 'EL CEJAL', '999');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` decimal(25,4) NOT NULL DEFAULT 1.0000,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `created_at`) VALUES
(1, 'Peso', 'COL', '$', '', '2', 1.0000, '2018-09-19 14:40:00'),
(2, 'Pound Sterling', 'GBP', '£', '', '2', 0.6125, '2018-09-19 14:40:00'),
(3, 'Euro', 'EUR', '€', '', '2', 0.7846, '2018-09-19 14:40:00'),
(4, 'Hong Kong Dollar', 'HKD', 'HK$', '', '2', 7.8222, '2018-09-19 12:00:00'),
(5, 'Indian Rupee', 'INR', '₹', '', '2', 64.4000, '2018-09-19 12:00:00'),
(6, 'Russian Ruble', 'RUB', '₽', '', '2', 56.4036, '2018-09-19 12:00:00'),
(7, 'Chinese Yuan', 'CNY', '¥', '', '2', 6.3451, '2018-09-19 12:00:00'),
(8, 'Australian Dollar', 'AUD', '$', '', '2', 1.2654, '2018-09-19 12:00:00'),
(9, 'Bangladeshi Taka', 'BDT', '৳', '', '2', 0.0000, '2018-09-29 05:25:00'),
(10, 'Pakistani Rupee ', 'PKR', '₨.', '', '2', 0.0000, '2018-09-29 05:31:49'),
(11, 'Croatian Kuna', 'HRK', 'kn', '', '2', 0.0000, '2018-09-29 05:33:22'),
(12, 'Malaysian Ringgit', 'MYR', 'RM', '', '2', 0.0000, '2018-09-29 05:35:15'),
(13, 'Saudi riyal', 'SAR', 'SR', '', '2', 0.0000, '2018-09-29 05:35:57'),
(14, 'Canadian Dollar', 'CAD', 'CAD $', '', '2', 0.0000, '2018-09-29 05:37:54'),
(17, 'Bitcoin', 'BTC', 'B', '', '0', 1.0000, '2020-10-21 12:12:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currency_to_store`
--

CREATE TABLE `currency_to_store` (
  `ca2s_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `currency_to_store`
--

INSERT INTO `currency_to_store` (`ca2s_id`, `currency_id`, `store_id`, `status`, `sort_order`) VALUES
(4, 4, 1, 1, 0),
(11, 11, 1, 1, 0),
(12, 12, 1, 1, 0),
(13, 13, 1, 1, 0),
(14, 14, 1, 1, 0),
(16, 8, 1, 1, 0),
(44, 1, 1, 1, 0),
(45, 2, 1, 1, 0),
(46, 3, 1, 1, 0),
(47, 9, 1, 1, 0),
(48, 7, 1, 1, 0),
(49, 6, 1, 1, 0),
(50, 5, 1, 1, 0),
(51, 10, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_mobile` varchar(14) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `customer_sex` tinyint(1) NOT NULL DEFAULT 1,
  `customer_age` int(10) UNSIGNED DEFAULT NULL,
  `gtin` varchar(100) DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_state` varchar(100) DEFAULT NULL,
  `customer_country` varchar(100) DEFAULT NULL,
  `is_giftcard` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(100) DEFAULT NULL,
  `raw_password` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_mobile`, `customer_address`, `dob`, `customer_sex`, `customer_age`, `gtin`, `customer_city`, `customer_state`, `customer_country`, `is_giftcard`, `password`, `raw_password`, `created_at`, `updated_at`) VALUES
(1, 'Consumidor Final', 'wc@itsolution24.com', '0170000000000', 'admin@mitienda.com', '1993-01-01', 1, 20, '147258', 'AN', 'AN', 'PE', 0, 'c33367701511b4f6020ec61ded352059', '654321', '2018-04-29 14:18:37', '2019-07-02 13:50:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_to_store`
--

CREATE TABLE `customer_to_store` (
  `c2s_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `balance` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `customer_to_store`
--

INSERT INTO `customer_to_store` (`c2s_id`, `customer_id`, `store_id`, `balance`, `due`, `status`, `sort_order`) VALUES
(1, 1, 1, 0.0000, 0.0000, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer_transactions`
--

CREATE TABLE `customer_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('purchase','add_balance','substract_balance','due_paid','others') NOT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `pmethod_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `returnable` enum('no','yes') NOT NULL DEFAULT 'no',
  `note` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_categorys`
--

CREATE TABLE `expense_categorys` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_slug` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sell_return` tinyint(1) NOT NULL DEFAULT 0,
  `sell_delete` tinyint(1) NOT NULL DEFAULT 0,
  `loan_delete` tinyint(1) NOT NULL DEFAULT 0,
  `loan_payment` tinyint(1) NOT NULL DEFAULT 0,
  `giftcard_sell_delete` tinyint(1) NOT NULL DEFAULT 0,
  `topup_delete` tinyint(1) NOT NULL DEFAULT 0,
  `product_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `stock_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `due_paid` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `expense_categorys`
--

INSERT INTO `expense_categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `sell_return`, `sell_delete`, `loan_delete`, `loan_payment`, `giftcard_sell_delete`, `topup_delete`, `product_purchase`, `stock_transfer`, `due_paid`, `status`, `is_hide`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Employee Salary', 'employee_salary', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:21:53', '2019-07-02 12:08:08'),
(2, 'Showroom Rent', 'showroom_rent', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:22:13', '2019-07-02 12:08:10'),
(3, 'Electricity Bill + Dish', 'electricity_bill_+_dish', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:22:29', '2019-07-02 12:08:12'),
(4, 'Advertisements', 'advertisements', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:23:16', '2019-07-02 12:08:16'),
(5, 'Bonous', 'bonous', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:23:52', '2019-07-02 12:08:18'),
(6, 'Others', 'others', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-02-16 17:24:23', '2019-07-02 12:08:19'),
(7, 'Returnable', 'returnable', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2019-03-02 05:58:46', '2019-07-02 12:08:21'),
(8, 'Sell Return', 'sell_return', 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-06 07:35:14', '2019-07-02 12:08:28'),
(9, 'Product Purchase', 'product_purchase', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, '2019-03-06 07:35:38', '2019-07-02 12:08:30'),
(10, 'Sell Delete', 'sell_delete', 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-06 09:54:14', '2019-07-02 12:08:34'),
(11, 'Loan Delete', 'loan_delete', 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-06 07:02:41', '2019-07-02 12:08:36'),
(12, 'Giftcard Topup Delete', 'giftcard_topup_delete', 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, '2019-03-07 12:54:16', '2019-07-02 12:08:38'),
(13, 'Giftcard Sell Delete', 'giftcard_sell_delete', 0, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, '2019-03-07 13:03:24', '2019-07-02 12:08:41'),
(14, 'Loan Payment', 'loan_payment', 0, '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2019-03-08 06:43:35', '2019-07-02 12:08:43'),
(15, 'Due Paid to Supplier', 'due_paid_to_supplier', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, '2019-03-08 06:43:35', '2019-07-02 12:08:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gift_card_topups`
--

CREATE TABLE `gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `card_id` varchar(20) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `holding_info`
--

CREATE TABLE `holding_info` (
  `info_id` int(10) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `order_title` varchar(255) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `invoice_note` text DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `created_by` int(10) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `holding_item`
--

CREATE TABLE `holding_item` (
  `id` int(10) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `item_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `brand_id` int(10) DEFAULT NULL,
  `sup_id` int(10) NOT NULL DEFAULT 0,
  `item_name` varchar(100) NOT NULL,
  `item_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_discount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('inclusive','exclusive') NOT NULL DEFAULT 'exclusive',
  `taxrate_id` int(10) UNSIGNED NOT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` int(10) UNSIGNED NOT NULL,
  `item_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `holding_price`
--

CREATE TABLE `holding_price` (
  `price_id` int(10) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT 0.0000,
  `discount_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable_amount` decimal(25,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `income_sources`
--

CREATE TABLE `income_sources` (
  `source_id` int(10) UNSIGNED NOT NULL,
  `source_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` enum('credit','debit') NOT NULL DEFAULT 'credit',
  `source_slug` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `source_details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `for_sell` tinyint(1) NOT NULL DEFAULT 0,
  `for_purchase_return` tinyint(1) NOT NULL DEFAULT 0,
  `for_due_collection` tinyint(1) NOT NULL DEFAULT 0,
  `for_loan` tinyint(1) NOT NULL DEFAULT 0,
  `for_giftcard_sell` tinyint(1) NOT NULL DEFAULT 0,
  `for_topup` tinyint(1) NOT NULL DEFAULT 0,
  `for_stock_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `for_purchase_delete` tinyint(1) NOT NULL DEFAULT 0,
  `for_expense_delete` tinyint(1) NOT NULL DEFAULT 0,
  `profitable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `show_in_income` enum('yes','no') NOT NULL DEFAULT 'yes',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `income_sources`
--

INSERT INTO `income_sources` (`source_id`, `source_name`, `type`, `source_slug`, `parent_id`, `source_details`, `for_sell`, `for_purchase_return`, `for_due_collection`, `for_loan`, `for_giftcard_sell`, `for_topup`, `for_stock_transfer`, `for_purchase_delete`, `for_expense_delete`, `profitable`, `show_in_income`, `status`, `is_hide`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Venta productos', 'credit', 'venta_productos', 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 1, 'yes', 'no', 1, 0, 0, '2019-03-08 04:14:39', '2019-07-02 12:11:22'),
(2, 'Purchase Return', 'credit', 'purchase_return', 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-02-27 05:17:43', '2019-04-29 01:58:31'),
(3, 'Due Collection', 'credit', 'due_collection', 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 'yes', 'no', 1, 1, 0, '2019-03-01 08:04:58', '2019-04-29 01:58:34'),
(4, 'Others', 'credit', 'others', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'yes', 'yes', 1, 1, 0, '2019-02-17 06:22:46', '2019-07-02 12:11:05'),
(5, 'Loan Taken', 'credit', 'loan_taken', 0, '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-06 06:04:54', '2019-07-02 12:11:08'),
(6, 'Giftcard Sell', 'credit', 'giftcard_sell', 0, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-07 12:53:43', '2019-07-02 12:11:11'),
(7, 'Giftcard Topup', 'credit', 'giftcard_topup', 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-07 12:53:55', '2019-07-02 12:11:14'),
(8, 'Stock Transfer', 'credit', 'stock_transfer', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 0, 'no', 'yes', 1, 1, 0, '2019-03-08 04:14:39', '2019-07-02 12:11:17'),
(9, 'Purchase Delete', 'credit', 'purchase_delete', 0, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 'no', 'yes', 1, 1, 0, '2019-03-08 04:14:39', '2019-07-02 12:11:19'),
(10, 'Expense Delete', 'credit', 'expense_delete', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 'no', 'yes', 1, 1, 0, '2019-03-08 04:14:39', '2019-07-02 12:11:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `installment_orders`
--

CREATE TABLE `installment_orders` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `purchase_invoice_id` varchar(100) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `interval_count` int(11) NOT NULL,
  `installment_count` int(11) NOT NULL,
  `interest_percentage` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `interest_amount` decimal(25,2) NOT NULL DEFAULT 0.00,
  `initial_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payment_status` enum('paid','due') NOT NULL DEFAULT 'due',
  `last_installment_date` datetime DEFAULT NULL,
  `installment_end_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `installment_payments`
--

CREATE TABLE `installment_payments` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `pmethod_id` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `capital` decimal(25,4) NOT NULL,
  `interest` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payment_status` enum('paid','due','pending','cancel') NOT NULL DEFAULT 'due'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `name`, `slug`, `code`) VALUES
(1, 'English', 'english', 'en'),
(2, 'Arabic', 'arabic', 'ar'),
(3, 'Bangla', 'bangla', 'bn'),
(4, 'Hindi', 'hindi', 'hi'),
(5, 'French', 'french', 'fr'),
(6, 'Germany', 'Germany', 'de'),
(7, 'Spanish', 'spanish', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language_translations`
--

CREATE TABLE `language_translations` (
  `id` int(10) NOT NULL,
  `lang_id` int(10) NOT NULL,
  `lang_key` varchar(100) NOT NULL,
  `key_type` enum('specific','default') NOT NULL DEFAULT 'specific',
  `lang_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `language_translations`
--

INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(1, 1, 'title_dashboard', 'specific', 'Dashboard'),
(2, 1, 'text_arabic', 'specific', 'Arabic'),
(3, 1, 'text_french', 'specific', 'French'),
(4, 1, 'text_germany', 'specific', 'Germany'),
(5, 1, 'text_spanish', 'specific', 'Spanish'),
(6, 1, 'text_pos', 'specific', 'POS'),
(7, 1, 'menu_pos', 'specific', 'POS'),
(8, 1, 'text_cashbook_report', 'specific', 'Cashbook Report'),
(9, 1, 'menu_cashbook', 'specific', 'CASHBOOK'),
(10, 1, 'text_invoice', 'specific', 'Invoice'),
(11, 1, 'menu_invoice', 'specific', 'INVOICE'),
(12, 1, 'text_user_preference', 'specific', 'User Preference'),
(13, 1, 'text_settings', 'specific', 'Settings'),
(14, 1, 'text_stock_alert', 'specific', 'Stock Alert'),
(15, 1, 'text_expired', 'specific', 'Expired'),
(16, 1, 'text_itsolution24', 'specific', 'ITsolution24'),
(17, 1, 'text_reports', 'specific', 'Reports'),
(18, 1, 'text_lockscreen', 'specific', 'Lockscreen'),
(19, 1, 'text_logout', 'specific', 'Logout'),
(20, 1, 'menu_dashboard', 'specific', 'DASHBOARD'),
(21, 1, 'menu_point_of_sell', 'specific', 'POINT OF SELL'),
(22, 1, 'menu_sell', 'specific', 'SELL'),
(23, 1, 'menu_sale_list', 'specific', 'SELL LIST'),
(24, 1, 'menu_return_list', 'specific', 'RETURN LIST'),
(25, 1, 'menu_giftcard', 'specific', 'GIFTCARD'),
(26, 1, 'menu_add_giftcard', 'specific', 'ADD GIFTCARD'),
(27, 1, 'menu_giftcard_list', 'specific', 'GIFTCARD LIST'),
(28, 1, 'menu_giftcard_topup', 'specific', 'GIFTCARD TOPUP'),
(29, 1, 'menu_quotation', 'specific', 'QUOTATION'),
(30, 1, 'menu_add_quotation', 'specific', 'ADD QUOTATION'),
(31, 1, 'menu_quotation_list', 'specific', 'QUOTATION LIST'),
(32, 1, 'menu_installment', 'specific', 'INSTALLMENT'),
(33, 1, 'menu_installment_list', 'specific', 'INSTALLMENT LIST'),
(34, 1, 'menu_payment_list', 'specific', 'PAYMENT LIST'),
(35, 1, 'menu_payment_due_today', 'specific', 'PAYMENT DUE TODAY'),
(36, 1, 'menu_payment_due_all', 'specific', 'PAYMENT DUE ALL'),
(37, 1, 'menu_payment_due_expired', 'specific', 'PAYMENT DUE EXP.'),
(38, 1, 'menu_overview_report', 'specific', 'OVERVIEW REPORT'),
(39, 1, 'menu_purchase', 'specific', 'Purchase 2'),
(40, 1, 'menu_add_purchase', 'specific', 'ADD PURCHASE'),
(41, 1, 'menu_purchase_list', 'specific', 'PURCHASE LIST'),
(42, 1, 'menu_due_invoice', 'specific', 'DUE INVOICE'),
(43, 1, 'menu_transfer', 'specific', 'STOCK TRANSFER'),
(44, 1, 'menu_add_transfer', 'specific', 'ADD TRANSFER'),
(45, 1, 'menu_transfer_list', 'specific', 'TRANSFER LIST'),
(46, 1, 'menu_product', 'specific', 'PRODUCT'),
(47, 1, 'menu_product_list', 'specific', 'PRODUCT LIST'),
(48, 1, 'menu_add_product', 'specific', 'ADD PRODUCT'),
(49, 1, 'menu_barcode_print', 'specific', 'BARCODE PRINT'),
(50, 1, 'menu_category', 'specific', 'CATEGORY LIST'),
(51, 1, 'menu_add_category', 'specific', 'ADD CATEGORY'),
(52, 1, 'menu_product_import', 'specific', 'IMPORT (.xls)'),
(53, 1, 'menu_stock_alert', 'specific', 'STOCK ALERT'),
(54, 1, 'menu_expired', 'specific', 'EXPIRED'),
(55, 1, 'menu_customer', 'specific', 'CUSTOMER'),
(56, 1, 'menu_add_customer', 'specific', 'ADD CUSTOMER'),
(57, 1, 'menu_customer_list', 'specific', 'CUSTOMER LIST'),
(58, 1, 'menu_transaction_list', 'specific', 'TRANSACTION LIST'),
(59, 1, 'menu_supplier', 'specific', 'SUPPLIER'),
(60, 1, 'menu_add_supplier', 'specific', 'ADD SUPPLIER'),
(61, 1, 'menu_supplier_list', 'specific', 'SUPPLIER LIST'),
(62, 1, 'menu_accounting', 'specific', 'ACCOUNTING'),
(63, 1, 'menu_new_deposit', 'specific', 'DEPOSIT'),
(64, 1, 'menu_new_withdraw', 'specific', 'WIDTHDRAW'),
(65, 1, 'menu_new_transfer', 'specific', 'ADD TRANSFER '),
(66, 1, 'menu_list_transfer', 'specific', 'TRANSFER LIST'),
(67, 1, 'menu_add_bank_account', 'specific', 'ADD BANK ACCOUNT'),
(68, 1, 'menu_bank_accounts', 'specific', 'BANK ACCOUNT LIST'),
(69, 1, 'menu_income_source', 'specific', 'INCOME SOURCE'),
(70, 1, 'menu_list_transactions', 'specific', 'TRANSACTION LIST'),
(71, 1, 'menu_balance_sheet', 'specific', 'BALANCE SHEET'),
(72, 1, 'menu_income_monthwise', 'specific', 'INCOME MONTHWISE'),
(73, 1, 'menu_income_and_expense', 'specific', 'INCOME VS EXPENSE'),
(74, 1, 'menu_profit_and_loss', 'specific', 'PROFIT VS LOSS'),
(75, 1, 'menu_expenditure', 'specific', 'EXPANDITURE'),
(76, 1, 'menu_create_expense', 'specific', 'ADD EXPENSE'),
(77, 1, 'menu_expense_list', 'specific', 'EXPENSE LIST'),
(78, 1, 'menu_expense_monthwise', 'specific', 'EXPENSE MONTHWISE'),
(79, 1, 'menu_summary', 'specific', 'SUMMARY'),
(80, 1, 'menu_loan_manager', 'specific', 'LOAN MANAGER'),
(81, 1, 'menu_take_loan', 'specific', 'TAKE LOAN'),
(82, 1, 'menu_loan_list', 'specific', 'LOAN LIST'),
(83, 1, 'menu_loan_summary', 'specific', 'SUMMARY'),
(84, 1, 'menu_reports', 'specific', 'REPORTS'),
(85, 1, 'menu_report_overview', 'specific', 'OVERVIEW REPORT'),
(86, 1, 'menu_report_collection', 'specific', 'COLLECTION REPORT'),
(87, 1, 'menu_report_due_collection', 'specific', 'DUE COLLECTION RPT'),
(88, 1, 'menu_report_due_paid', 'specific', 'DUE PAID RPT'),
(89, 1, 'menu_sell_report', 'specific', 'SELL REPORT'),
(90, 1, 'menu_purchase_report', 'specific', 'PURCHASE REPORT'),
(91, 1, 'menu_sell_payment_report', 'specific', 'SELL PAYMENT REPORT'),
(92, 1, 'menu_purchase_payment_report', 'specific', 'PUR. PAYMENT RPT.'),
(93, 1, 'menu_tax_report', 'specific', 'SELL TAX REPORT'),
(94, 1, 'menu_purchase_tax_report', 'specific', 'PURCHASE TAX RPT.'),
(95, 1, 'menu_tax_overview_report', 'specific', 'TAX OVERVIEW RPT.'),
(96, 1, 'menu_report_stock', 'specific', 'STOCK REPORT'),
(97, 1, 'menu_analytics', 'specific', 'ANALYTICS'),
(98, 1, 'menu_sms', 'specific', 'SMS'),
(99, 1, 'menu_send_sms', 'specific', 'SEND SMS'),
(100, 1, 'menu_sms_report', 'specific', 'SMS REPORT'),
(101, 1, 'menu_sms_setting', 'specific', 'SMS SETTING'),
(102, 1, 'menu_user', 'specific', 'USER'),
(103, 1, 'menu_add_user', 'specific', 'ADD USER'),
(104, 1, 'menu_user_list', 'specific', 'USER LIST'),
(105, 1, 'menu_add_usergroup', 'specific', 'ADD USERGROUP'),
(106, 1, 'menu_usergroup_list', 'specific', 'USERGROUP LIST'),
(107, 1, 'menu_password', 'specific', 'PASSWORD'),
(108, 1, 'menu_filemanager', 'specific', 'FILEMANAGER'),
(109, 1, 'menu_system', 'specific', 'SYSTEM'),
(110, 1, 'menu_store', 'specific', 'STORE'),
(111, 1, 'menu_create_store', 'specific', 'STORE CREATE'),
(112, 1, 'menu_store_list', 'specific', 'STORE LIST'),
(113, 1, 'menu_store_setting', 'specific', 'STORE SETTING'),
(114, 1, 'menu_receipt_template', 'specific', 'RECEIPT TEMPLATE'),
(115, 1, 'menu_user_preference', 'specific', 'USER PREFERENCE'),
(116, 1, 'menu_brand', 'specific', 'BRAND'),
(117, 1, 'menu_add_brand', 'specific', 'ADD BRAND'),
(118, 1, 'menu_brand_list', 'specific', 'BRAND LIST'),
(119, 1, 'menu_currency', 'specific', 'CURRENCY'),
(120, 1, 'menu_pmethod', 'specific', 'PAYMENT METHOD'),
(121, 1, 'menu_unit', 'specific', 'UNIT'),
(122, 1, 'menu_taxrate', 'specific', 'TAXRATE'),
(123, 1, 'menu_box', 'specific', 'BOX'),
(124, 1, 'menu_printer', 'specific', 'PRINTER'),
(125, 1, 'menu_backup_restore', 'specific', 'BACKUP/RESTORE'),
(126, 1, 'menu_store_change', 'specific', 'STORE CHANGE'),
(127, 1, 'text_dashboard', 'specific', 'Dashboard'),
(128, 1, 'text_old_dashboard', 'specific', 'Old Dashboard'),
(129, 1, 'button_pos', 'specific', 'POS'),
(130, 1, 'button_invoice', 'specific', 'Invoice'),
(131, 1, 'button_overview_report', 'specific', 'Overview Report'),
(132, 1, 'button_sell_report', 'specific', 'Sell Report'),
(133, 1, 'button_purchase_report', 'specific', 'Purchase Report'),
(134, 1, 'button_stock_alert', 'specific', 'Stock Alert'),
(135, 1, 'button_expired_alert', 'specific', 'Expired'),
(136, 1, 'button_backup_restore', 'specific', 'Backup/Restore'),
(137, 1, 'button_stores', 'specific', 'Stores'),
(138, 1, 'text_total_invoice', 'specific', 'TOTAL INVOICE'),
(139, 1, 'text_total_invoice_today', 'specific', 'TOTAL INVOICE TODAY'),
(140, 1, 'text_details', 'specific', 'Details'),
(141, 1, 'text_total_customer', 'specific', 'TOTAL CUSTOMER'),
(142, 1, 'text_total_customer_today', 'specific', 'TOTAL CUSTOMER TODAY'),
(143, 1, 'text_total_supplier', 'specific', 'TOTAL SUPPLIER'),
(144, 1, 'text_total_supplier_today', 'specific', 'TOTAL SUPPLIER TODAY'),
(145, 1, 'text_total_product', 'specific', 'TOTAL PRODUCT'),
(146, 1, 'text_total_product_today', 'specific', 'TOTAL PRODUCT TODAY'),
(147, 1, 'text_deposit_today', 'specific', 'Deposit Today'),
(148, 1, 'text_withdraw_today', 'specific', 'Widthdraw Today'),
(149, 1, 'text_total_deposit', 'specific', 'Total Deposit'),
(150, 1, 'text_total_withdraw', 'specific', 'Total Widthdraw'),
(151, 1, 'text_recent_deposit', 'specific', 'Recent Deposit'),
(152, 1, 'label_date', 'specific', 'Date'),
(153, 1, 'label_description', 'specific', 'Description'),
(154, 1, 'label_amount', 'specific', 'Amount'),
(155, 1, 'button_view_all', 'specific', 'View All'),
(156, 1, 'text_recent_withdraw', 'specific', 'Recent Withdraw'),
(157, 1, 'text_collection_report', 'specific', 'Collection Report'),
(158, 1, 'label_serial_no', 'specific', 'SL'),
(159, 1, 'label_username', 'specific', 'Username'),
(160, 1, 'label_total_inv', 'specific', 'Total Inv'),
(161, 1, 'label_net_amount', 'specific', 'Net Amount'),
(162, 1, 'label_prev_due_collection', 'specific', 'Prev. Due Col.'),
(163, 1, 'label_due_collection', 'specific', 'Due Collection'),
(164, 1, 'label_due_given', 'specific', 'Due GIven'),
(165, 1, 'label_received', 'specific', 'Received'),
(166, 1, 'text_sells_analytics', 'specific', 'Sell Analytics'),
(167, 1, 'text_version', 'specific', 'Version'),
(168, 1, 'button_today', 'specific', 'Today'),
(169, 1, 'button_last_7_days', 'specific', 'Last 7 Days'),
(170, 1, 'button_last_30_days', 'specific', 'Last 30 Days'),
(171, 1, 'button_last_365_days', 'specific', 'Last 365 Days'),
(172, 1, 'button_filter', 'specific', 'Filter'),
(173, 1, 'title_language', 'specific', 'Language'),
(174, 1, 'text_language_title', 'specific', 'Language'),
(175, 1, 'text_language_list_title', 'specific', 'Language Translate'),
(176, 1, 'label_key', 'specific', 'Key'),
(177, 1, 'label_value', 'specific', 'Value'),
(178, 1, 'label_translate', 'specific', 'Translate'),
(179, 1, 'button_translate', 'specific', 'Translate'),
(180, 1, 'title_quotation', 'specific', 'Quotation'),
(181, 1, 'text_quotation_title', 'specific', 'Quotation'),
(182, 1, 'text_add', 'specific', 'Add'),
(183, 1, 'text_new_quotation_title', 'specific', 'Add New Quotation'),
(184, 1, 'label_reference_no', 'specific', 'Ref. No.'),
(185, 1, 'label_note', 'specific', 'Notes'),
(186, 1, 'label_status', 'specific', 'Status'),
(187, 1, 'text_sent', 'specific', 'Sent'),
(188, 1, 'text_pending', 'specific', 'Pending'),
(189, 1, 'text_complete', 'specific', 'Complete'),
(190, 1, 'label_customer', 'specific', 'Customer'),
(191, 1, 'text_select', 'specific', '--- Please Select ---'),
(192, 1, 'label_supplier', 'specific', 'Supplier'),
(193, 1, 'text_all_suppliers', 'specific', 'All Supplier'),
(194, 1, 'label_add_product', 'specific', 'Add Product'),
(195, 1, 'placeholder_search_product', 'specific', 'Search Product'),
(196, 1, 'label_product', 'specific', 'Product'),
(197, 1, 'label_available', 'specific', 'Available'),
(198, 1, 'label_quantity', 'specific', 'Quantity'),
(199, 1, 'label_sell_price', 'specific', 'Sell Price'),
(200, 1, 'label_item_tax', 'specific', 'Item Tax'),
(201, 1, 'label_subtotal', 'specific', 'Subtotal'),
(202, 1, 'label_order_tax', 'specific', 'Order Tax'),
(203, 1, 'label_shipping_charge', 'specific', 'Shipping Charge'),
(204, 1, 'label_others_charge', 'specific', 'Other Charge'),
(205, 1, 'label_discount_amount', 'specific', 'Discount'),
(206, 1, 'label_payable_amount', 'specific', 'Payable Amount'),
(207, 1, 'button_save', 'specific', 'Save'),
(208, 1, 'button_reset', 'specific', 'Reset'),
(209, 1, 'text_quotation_list_title', 'specific', 'Quotation List'),
(210, 1, 'button_all', 'specific', 'All'),
(211, 1, 'button_sent', 'specific', 'Sent'),
(212, 1, 'button_pending', 'specific', 'Pending'),
(213, 1, 'button_complete', 'specific', 'Complete'),
(214, 1, 'label_biller', 'specific', 'Biller'),
(215, 1, 'label_total', 'specific', 'Total'),
(216, 1, 'label_action', 'specific', 'Action'),
(217, 1, 'text_translation_success', 'specific', 'Translation Successfull'),
(218, 1, 'title_purchase', 'specific', 'Purchase 2'),
(219, 1, 'text_purchase_title', 'specific', 'Purchase 2'),
(220, 1, 'text_new_purchase_title', 'specific', 'Add New Purchase'),
(221, 1, 'text_received', 'specific', 'Received'),
(222, 1, 'text_ordered', 'specific', 'Ordered'),
(223, 1, 'label_attachment', 'specific', 'Attachment'),
(224, 1, 'label_cost', 'specific', 'Cost'),
(225, 1, 'label_item_total', 'specific', 'Item Total'),
(226, 1, 'label_payment_method', 'specific', 'Payment Method'),
(227, 1, 'label_paid_amount', 'specific', 'Paid Amount'),
(228, 1, 'label_due_amount', 'specific', 'Due Amount'),
(229, 1, 'label_change_amount', 'specific', 'Change Amount'),
(230, 1, 'button_submit', 'specific', 'Submit'),
(231, 1, 'text_purchase_list_title', 'specific', 'Purchase List'),
(232, 1, 'button_today_invoice', 'specific', 'Today Invoice'),
(233, 1, 'button_all_invoice', 'specific', 'All Invoice'),
(234, 1, 'button_due_invoice', 'specific', 'Due Invoice'),
(235, 1, 'button_all_due_invoice', 'specific', 'All Due Invoice'),
(236, 1, 'button_paid_invoice', 'specific', 'Paid Invoice'),
(237, 1, 'button_inactive_invoice', 'specific', 'Inactive Invoice'),
(238, 1, 'label_datetime', 'specific', 'Date Time'),
(239, 1, 'label_invoice_id', 'specific', 'Invoice Id'),
(240, 1, 'label_creator', 'specific', 'Creator'),
(241, 1, 'label_invoice_paid', 'specific', 'Paid Amount'),
(242, 1, 'label_due', 'specific', 'Due'),
(243, 1, 'label_pay', 'specific', 'Pay'),
(244, 1, 'label_return', 'specific', 'Return'),
(245, 1, 'label_view', 'specific', 'View'),
(246, 1, 'label_edit', 'specific', 'Edit'),
(247, 1, 'title_language_translation', 'specific', 'Language Translate'),
(248, 1, 'title_invoice', 'specific', 'Invoice'),
(249, 1, 'text_invoice_title', 'specific', 'Invoice'),
(250, 1, 'text_invoice_sub_title', 'specific', 'Invoice List'),
(251, 1, 'label_customer_name', 'specific', 'Customer Name'),
(252, 1, 'label_invoice_amount', 'specific', 'Inv. Amount'),
(253, 1, 'label_invoice_due', 'specific', 'Invoice Due'),
(254, 1, 'title_transfer', 'specific', 'Transfer'),
(255, 1, 'text_transfer_title', 'specific', 'Transfer'),
(256, 1, 'text_add_transfer_title', 'specific', 'Add New Transfer'),
(257, 1, 'label_ref_no', 'specific', 'Ref. No.'),
(258, 1, 'label_from', 'specific', 'From'),
(259, 1, 'label_to', 'specific', 'To'),
(260, 1, 'text_stock_list', 'specific', 'Stock List'),
(261, 1, 'search', 'specific', 'Search'),
(262, 1, 'text_invoice_id', 'specific', 'Invoice Id'),
(263, 1, 'text_stock', 'specific', 'Stock'),
(264, 1, 'text_transfer_list', 'specific', 'Transfer List'),
(265, 1, 'label_item_name', 'specific', 'Item Name'),
(266, 1, 'label_transfer_qty', 'specific', 'Transfer Qty.'),
(267, 1, 'button_transfer_now', 'specific', 'Transfer Now'),
(268, 1, 'text_list_transfer_title', 'specific', 'Transfer List'),
(269, 1, 'label_from_store', 'specific', 'From Store'),
(270, 1, 'label_to_store', 'specific', 'To Store'),
(271, 1, 'label_total_item', 'specific', 'Total Item'),
(272, 1, 'label_total_quantity', 'specific', 'Total Quantity'),
(273, 1, 'text_success', 'specific', 'Successfully Created'),
(274, 1, 'title_product', 'specific', 'Product'),
(275, 1, 'text_products', 'specific', 'Products'),
(276, 1, 'text_add_new', 'specific', 'Add New Product'),
(277, 1, 'text_product', 'specific', 'Product'),
(278, 1, 'text_general', 'specific', 'General'),
(279, 1, 'text_image', 'specific', 'Image'),
(280, 1, 'label_image', 'specific', 'Image'),
(281, 1, 'label_url', 'specific', 'Url'),
(282, 1, 'label_sort_order', 'specific', 'Order'),
(283, 1, 'label_thumbnail', 'specific', 'Thumbnail'),
(284, 1, 'label_product_type', 'specific', 'Product Type'),
(285, 1, 'text_standard', 'specific', 'Standard'),
(286, 1, 'text_service', 'specific', 'Service'),
(287, 1, 'label_name', 'specific', 'Name'),
(288, 1, 'label_pcode', 'specific', 'P. Code'),
(289, 1, 'label_category', 'specific', 'Category'),
(290, 1, 'label_brand', 'specific', 'Brand'),
(291, 1, 'label_barcode_symbology', 'specific', 'Barcode Symbiology'),
(292, 1, 'label_box', 'specific', 'Box'),
(293, 1, 'label_expired_date', 'specific', 'Expired Date'),
(294, 1, 'label_unit', 'specific', 'Unit'),
(295, 1, 'label_product_cost', 'specific', 'Product Cost'),
(296, 1, 'label_product_price', 'specific', 'Product Price'),
(297, 1, 'label_product_tax', 'specific', 'Product Tax'),
(298, 1, 'label_tax_method', 'specific', 'Tax Method'),
(299, 1, 'text_inclusive', 'specific', 'Inclusive'),
(300, 1, 'text_exclusive', 'specific', 'Exclusive'),
(301, 1, 'label_store', 'specific', 'Store'),
(302, 1, 'label_alert_quantity', 'specific', 'Alert Quantity'),
(303, 1, 'text_active', 'specific', 'Active'),
(304, 1, 'text_inactive', 'specific', 'Inactive'),
(305, 1, 'text_view_all', 'specific', 'View All'),
(306, 1, 'label_all_product', 'specific', 'All Product'),
(307, 1, 'button_trash', 'specific', 'Trash'),
(308, 1, 'button_bulk', 'specific', 'Bulk Action'),
(309, 1, 'button_delete_all', 'specific', 'Delete All'),
(310, 1, 'label_stock', 'specific', 'Stock'),
(311, 1, 'label_purchase_price', 'specific', 'Purchase Price'),
(312, 1, 'label_selling_price', 'specific', 'Selling Price'),
(313, 1, 'label_purchase', 'specific', 'Purchase 2'),
(314, 1, 'label_print_barcode', 'specific', 'Print Barcode'),
(315, 1, 'button_view', 'specific', 'View'),
(316, 1, 'button_edit', 'specific', 'Edit'),
(317, 1, 'button_purchase_product', 'specific', 'Purchase Product'),
(318, 1, 'button_barcode', 'specific', 'Barcode'),
(319, 1, 'button_delete', 'specific', 'Delete'),
(320, 1, 'error_no_selected', 'specific', 'Not Selected'),
(321, 1, 'success_delete_all', 'specific', 'Successfully Deleted'),
(322, 1, 'text_language_translation_title', 'specific', 'Language Translate'),
(323, 1, 'title_user_preference', 'specific', 'User Preference'),
(324, 1, 'text_user_preference_title', 'specific', 'User Preference'),
(325, 1, 'text_language_preference_title', 'specific', 'Language Translate'),
(326, 1, 'label_select_language', 'specific', 'Select Language'),
(327, 1, 'text_english', 'specific', 'English'),
(328, 1, 'text_color_preference_title', 'specific', 'Color Preference'),
(329, 1, 'label_base_color', 'specific', 'Base color'),
(330, 1, 'text_color_black', 'specific', 'Black'),
(331, 1, 'text_color_blue', 'specific', 'Blue'),
(332, 1, 'text_color_green', 'specific', 'Green'),
(333, 1, 'text_color_red', 'specific', 'Red'),
(334, 1, 'text_color_yellow', 'specific', 'Yellow'),
(335, 1, 'text_pos_side_panel_position_title', 'specific', 'POS Side Panel Position'),
(336, 1, 'label_pos_side_panel_position', 'specific', 'Pos Side Panel Position'),
(337, 1, 'text_right', 'specific', 'Right'),
(338, 1, 'text_left', 'specific', 'Left'),
(339, 1, 'text_pos_pattern_title', 'specific', 'POS Pattern'),
(340, 1, 'label_select_pos_pattern', 'specific', 'Select POS Pattern'),
(341, 1, 'button_update', 'specific', 'Update 1'),
(342, 1, 'text_login_title', 'specific', 'Login'),
(343, 1, 'text_login', 'specific', 'Login'),
(344, 1, 'button_sign_in', 'specific', 'Sign In'),
(345, 1, 'text_forgot_password', 'specific', 'Forgot Password?'),
(346, 1, 'title_forgot_password', 'specific', 'Forgot Password'),
(347, 1, 'text_forgot_password_instruction', 'specific', 'Please type your email.  We will send you a link just follow the steps.'),
(348, 1, 'button_close', 'specific', 'Close'),
(349, 1, 'title_receipt_template', 'specific', 'Receipt Template'),
(350, 1, 'text_receipt_tempalte_title', 'specific', 'Receipt Template'),
(351, 1, 'title_pos_setting', 'specific', 'POS Settings'),
(352, 1, 'text_receipt_template', 'specific', 'Receipt Template'),
(353, 1, 'text_receipt_tempalte_sub_title', 'specific', 'Receipt Template'),
(354, 1, 'button_preview', 'specific', 'Preview'),
(355, 1, 'text_tempalte_content_title', 'specific', 'Template Content'),
(356, 1, 'text_tempalte_css_title', 'specific', 'Template CSS'),
(357, 1, 'text_template_tags', 'specific', 'Template Tags'),
(358, 1, 'text_translations', 'specific', 'Translations'),
(359, 1, 'text_bangla', 'specific', 'Bangla'),
(360, 1, 'menu_language', 'specific', 'LANGUAGE'),
(361, 1, 'button_default', 'specific', 'Default'),
(362, 1, 'text_paid', 'specific', 'Paid'),
(363, 1, 'button_return', 'specific', 'Return'),
(364, 1, 'button_view_receipt', 'specific', 'View Receipt'),
(365, 1, 'label_delete', 'default', 'Delete'),
(366, 1, 'button_dublicate_entry', 'specific', 'Dublicate Entry'),
(367, 1, 'text_delete_success', 'specific', 'Successfully Deleted'),
(368, 1, 'label_delete', 'specific', 'Delete'),
(369, 1, 'text_customer_list_title', 'specific', 'Customer List'),
(370, 1, 'text_customer_title', 'specific', 'Customer'),
(371, 1, 'text_new_customer_title', 'specific', 'Add New Customer'),
(372, 1, 'label_phone', 'specific', 'Phone'),
(373, 1, 'label_date_of_birth', 'specific', 'Date of Birth'),
(374, 1, 'label_email', 'specific', 'Email'),
(375, 1, 'label_sex', 'specific', 'Sex'),
(376, 1, 'label_male', 'specific', 'Male'),
(377, 1, 'label_female', 'specific', 'Female'),
(378, 1, 'label_others', 'specific', 'Others'),
(379, 1, 'label_age', 'specific', 'Age'),
(380, 1, 'label_address', 'specific', 'Address'),
(381, 1, 'label_city', 'specific', 'City'),
(382, 1, 'label_state', 'specific', 'State'),
(383, 1, 'label_country', 'specific', 'Country'),
(384, 1, 'label_id', 'specific', 'Id'),
(385, 1, 'label_balance', 'specific', 'Balance'),
(386, 1, 'label_sell', 'specific', 'Sell'),
(387, 1, 'button_sell', 'specific', 'Sell'),
(388, 1, 'button_view_profile', 'specific', 'View Profile'),
(389, 1, 'login_success', 'specific', 'Login Successfull'),
(390, 1, 'title_installment_payment', 'specific', 'Installment Payment'),
(391, 1, 'text_installment_payment_title', 'specific', 'Installment Payment'),
(392, 1, 'text_installment', 'specific', 'Installment'),
(393, 1, 'text_installment_payment_list_title', 'specific', 'Installment Payment List'),
(394, 1, 'text_all_payment', 'specific', 'All Payment'),
(395, 1, 'button_all_payment', 'specific', 'All Payment'),
(396, 1, 'button_todays_due_payment', 'specific', 'Todays Due Payment'),
(397, 1, 'button_all_due_payment', 'specific', 'All Due Payment'),
(398, 1, 'button_expired_due_payment', 'specific', 'Expired Due Payment'),
(399, 1, 'label_payment_date', 'specific', 'Payment Date'),
(400, 1, 'label_payable', 'specific', 'Payable'),
(401, 1, 'label_paid', 'specific', 'Paid'),
(402, 1, 'button_payment', 'specific', 'Payment'),
(403, 1, 'title_backup_restore', 'specific', 'Backup/Restore'),
(404, 1, 'text_backup_restore_title', 'specific', 'Backup/Restore'),
(405, 1, 'text_backup', 'specific', 'Backup'),
(406, 1, 'text_restore', 'specific', 'Restore'),
(407, 1, 'label_databases', 'specific', 'Databases'),
(408, 1, 'label_select_all', 'specific', 'Select All'),
(409, 1, 'label_unselect_all', 'specific', 'Unselect All'),
(410, 1, 'button_export', 'specific', 'Export'),
(411, 1, 'label_progress', 'specific', 'Progress'),
(412, 1, 'button_select_sql_file', 'specific', 'Select .sql File'),
(413, 1, 'title_printer', 'specific', 'Printer'),
(414, 1, 'text_printer_title', 'specific', 'Printer'),
(415, 1, 'text_new_printer_title', 'specific', 'Add New Printer'),
(416, 1, 'label_title', 'specific', 'Title'),
(417, 1, 'label_type', 'specific', 'Type'),
(418, 1, 'label_char_per_line', 'specific', 'Char Per Line'),
(419, 1, 'label_path', 'specific', 'Path'),
(420, 1, 'label_ip_address', 'specific', 'Ip Address'),
(421, 1, 'label_port', 'specific', 'Port'),
(422, 1, 'text_printer_list_title', 'specific', 'Printer List'),
(423, 1, 'title_box', 'specific', 'Box'),
(424, 1, 'text_box_title', 'specific', 'Box'),
(425, 1, 'text_box_box_title', 'specific', 'Box '),
(426, 1, 'label_box_name', 'specific', 'Box Name'),
(427, 1, 'label_code_name', 'specific', 'Code Name'),
(428, 1, 'label_box_details', 'specific', 'Box Details'),
(429, 1, 'text_in_active', 'specific', 'Inactive'),
(430, 1, 'text_box_list_title', 'specific', 'Box List'),
(431, 1, 'title_taxrate', 'specific', 'Taxrate'),
(432, 1, 'text_taxrate_title', 'specific', 'Taxrate'),
(433, 1, 'text_new_taxrate_title', 'specific', 'Add New Taxrate'),
(434, 1, 'label_taxrate_name', 'specific', 'Taxrate Name'),
(435, 1, 'label_taxrate', 'specific', 'Taxrate'),
(436, 1, 'text_taxrate_list_title', 'specific', 'Taxrate List'),
(437, 1, 'title_unit', 'specific', 'Unit'),
(438, 1, 'text_unit_title', 'specific', 'Unit'),
(439, 1, 'text_new_unit_title', 'specific', 'Add New Unit'),
(440, 1, 'label_unit_name', 'specific', 'Unit Name'),
(441, 1, 'label_unit_details', 'specific', 'Unit Details'),
(442, 1, 'text_unit_list_title', 'specific', 'Unit List'),
(443, 1, 'title_pmethod', 'specific', 'Payment Mehtod'),
(444, 1, 'text_pmethod_title', 'specific', 'Payment Method'),
(445, 1, 'text_new_pmethod_title', 'specific', 'Add New Payment Method'),
(446, 1, 'label_details', 'specific', 'Details'),
(447, 1, 'text_pmethod_list_title', 'specific', 'Payment Method List'),
(448, 1, 'title_currency', 'specific', 'Currency'),
(449, 1, 'text_currency_title', 'specific', 'Currency'),
(450, 1, 'text_new_currency_title', 'specific', 'Add New Currency'),
(451, 1, 'label_code', 'specific', 'Code'),
(452, 1, 'hint_code', 'specific', 'Code name here'),
(453, 1, 'label_symbol_left', 'specific', 'Symbol Left'),
(454, 1, 'hint_symbol_left', 'specific', 'It will display in Left side'),
(455, 1, 'label_symbol_right', 'specific', 'Symbol Right'),
(456, 1, 'hint_symbol_right', 'specific', 'It will display in right  side'),
(457, 1, 'label_decimal_place', 'specific', 'Decimal  Place'),
(458, 1, 'hint_decimal_place', 'specific', 'It indicates number of digit after ponts. I.E.  100.00'),
(459, 1, 'text_currency_list_title', 'specific', 'Currency List'),
(460, 1, 'text_enabled', 'specific', 'Enabled'),
(461, 1, 'button_activate', 'specific', 'Active'),
(462, 1, 'button_activated', 'specific', 'Activated'),
(463, 1, 'text_brand_list_title', 'specific', 'Brand List'),
(464, 1, 'text_brand_title', 'specific', 'Brand'),
(465, 1, 'text_new_brand_title', 'specific', 'Brand'),
(466, 1, 'label_total_product', 'specific', 'Total Product'),
(467, 1, 'title_create_store', 'specific', 'Create Store'),
(468, 1, 'text_create_store_title', 'specific', 'Create Store'),
(469, 1, 'text_stores', 'specific', 'Stores'),
(470, 1, 'text_currency', 'specific', 'Currency'),
(471, 1, 'text_payment_method', 'specific', 'Paymen Method'),
(472, 1, 'text_printer', 'specific', 'Printer'),
(473, 1, 'text_email_setting', 'specific', 'Email Setting'),
(474, 1, 'text_ftp_setting', 'specific', 'FTP Setting'),
(475, 1, 'label_mobile', 'specific', 'Mobile'),
(476, 1, 'label_zip_code', 'specific', 'Zip Code'),
(477, 1, 'label_vat_reg_no', 'specific', 'VAT Reg. No.'),
(478, 1, 'label_cashier_name', 'specific', 'Cashier Name'),
(479, 1, 'label_timezone', 'specific', 'Timezone'),
(480, 1, 'label_invoice_edit_lifespan', 'specific', 'Invoice Edit Lifespan'),
(481, 1, 'hint_invoice_edit_lifespan', 'specific', 'After this time you won\'t be able to edit invoice.'),
(482, 1, 'text_minute', 'specific', 'Minute'),
(483, 1, 'text_second', 'specific', 'Second'),
(484, 1, 'label_invoice_delete_lifespan', 'specific', 'Invoice Delete Lifespan'),
(485, 1, 'hint_invoice_delete_lifespan', 'specific', 'After this time you won\'t be able to delete invoice.'),
(486, 1, 'label_after_sell_page', 'specific', 'After Sell Page'),
(487, 1, 'hint_after_sell_page', 'specific', 'After Sell Page'),
(488, 1, 'label_pos_printing', 'specific', 'POS Printing'),
(489, 1, 'label_receipt_printer', 'specific', 'Receipt Printer'),
(490, 1, 'label_auto_print_receipt', 'specific', 'Auto Print Receipt'),
(491, 1, 'label_deposit_account', 'specific', 'Deposit Account'),
(492, 1, 'label_tax', 'specific', 'TAX'),
(493, 1, 'hint_tax', 'specific', 'Tax'),
(494, 1, 'label_stock_alert_quantity', 'specific', 'Stock Alert Quantity'),
(495, 1, 'hint_stock_alert_quantity', 'specific', 'If quantity reach this value so it will be alert as stock low alert'),
(496, 1, 'label_datatable_item_limit', 'specific', 'Datatable Item Limit'),
(497, 1, 'hint_datatable_item_limit', 'specific', 'It indicates how many row you will show in any table'),
(498, 1, 'label_invoice_footer_text', 'specific', 'Invoice Footer Text'),
(499, 1, 'hint_invoice_footer_text', 'specific', 'This will display in footer of invoice'),
(500, 1, 'label_sound_effect', 'specific', 'Sound Effect'),
(501, 1, 'label_email_from', 'specific', 'Email From'),
(502, 1, 'hint_email_from', 'specific', 'Email From'),
(503, 1, 'label_email_address', 'specific', 'Email Address'),
(504, 1, 'hint_email_address', 'specific', 'Email Addrress'),
(505, 1, 'label_email_driver', 'specific', 'Email Driver'),
(506, 1, 'hint_email_driver', 'specific', 'Email Driver'),
(507, 1, 'label_smtp_host', 'specific', 'SMTP Host'),
(508, 1, 'hint_smtp_host', 'specific', 'SMTP Host'),
(509, 1, 'label_smtp_username', 'specific', 'SMTP Username'),
(510, 1, 'hint_smtp_username', 'specific', 'SMTP Username'),
(511, 1, 'label_smtp_password', 'specific', 'SMTP Password'),
(512, 1, 'hint_smtp_password', 'specific', 'SMTP Password'),
(513, 1, 'label_smtp_port', 'specific', 'SMTP Port'),
(514, 1, 'hint_smtp_port', 'specific', 'SMTP Port'),
(515, 1, 'label_ssl_tls', 'specific', 'SSL/TLS'),
(516, 1, 'hint_ssl_tls', 'specific', 'SSL/TLS'),
(517, 1, 'label_ftp_hostname', 'specific', 'FTP Hostname'),
(518, 1, 'label_ftp_username', 'specific', 'FTP Username'),
(519, 1, 'label_ftp_password', 'specific', 'FTP Password'),
(520, 1, 'button_back', 'specific', 'Back'),
(521, 1, 'title_store', 'specific', 'Store'),
(522, 1, 'text_store_title', 'specific', 'Store'),
(523, 1, 'text_store_list_title', 'specific', 'Store List'),
(524, 1, 'label_created_at', 'specific', 'Created At'),
(525, 1, 'title_edit_store', 'specific', 'Edit Store'),
(526, 1, 'text_title', 'specific', 'Title'),
(527, 1, 'text_pos_setting', 'specific', 'POS Setting'),
(528, 1, 'label_gst_reg_no', 'specific', 'GST Reg. No.'),
(529, 1, 'label_sms_gateway', 'specific', 'SMS Gateway'),
(530, 1, 'hint_sms_gateway', 'specific', 'SMS Gateway like clickatell, 91sms'),
(531, 1, 'label_sms_alert', 'specific', 'SMS Alert'),
(532, 1, 'hint_sms_alert', 'specific', 'SMS Alert'),
(533, 1, 'text_yes', 'specific', 'Yes'),
(534, 1, 'text_no', 'specific', 'No.'),
(535, 1, 'label_auto_sms', 'specific', 'Auto SMS'),
(536, 1, 'text_sms_after_creating_invoice', 'specific', 'SMS After Create Invoice'),
(537, 1, 'label_expiration_system', 'specific', 'Expiration System'),
(538, 1, 'label_invoice_prefix', 'specific', 'Invoive Prefix'),
(539, 1, 'label_receipt_template', 'specific', 'Receipt Template'),
(540, 1, 'label_invoice_view', 'specific', 'Invoice View'),
(541, 1, 'hint_invoice_view', 'specific', 'Invoice View'),
(542, 1, 'text_tax_invoice', 'specific', 'Tax Invoice'),
(543, 1, 'text_indian_gst', 'specific', 'Indian GST'),
(544, 1, 'label_change_item_price_while_billing', 'specific', 'Change Price when Billing'),
(545, 1, 'hint_change_item_price_while_billing', 'specific', 'You will be able to edit sell price when you will create a invoice.'),
(546, 1, 'label_pos_product_display_limit', 'specific', 'POS Product Display Limit'),
(547, 1, 'hint_pos_product_display_limit', 'specific', 'Number of product that will display in POS'),
(548, 1, 'label_send_mail_path', 'specific', 'Send Mail Path'),
(549, 1, 'hint_send_mail_path', 'specific', 'Type send mail path here'),
(550, 1, 'text_logo', 'specific', 'Logo'),
(551, 1, 'label_logo_size', 'specific', 'Logo Size'),
(552, 1, 'button_upload', 'specific', 'Upload'),
(553, 1, 'text_favicon', 'specific', 'Favicon'),
(554, 1, 'label_favicon_size', 'specific', 'Favicon Size'),
(555, 1, 'title_user', 'specific', 'User'),
(556, 1, 'text_user_title', 'specific', 'User'),
(557, 1, 'text_new_user_title', 'specific', 'Add New User'),
(558, 1, 'label_password', 'specific', 'Password'),
(559, 1, 'label_password_retype', 'specific', 'Retype Password'),
(560, 1, 'label_group', 'specific', 'Group'),
(561, 1, 'hint_group', 'specific', 'Group name here'),
(562, 1, 'text_user_list_title', 'specific', 'User List'),
(563, 1, 'label_profile', 'specific', 'Profile'),
(564, 1, 'title_user_group', 'specific', 'Usergroup'),
(565, 1, 'text_group_title', 'specific', 'User Group'),
(566, 1, 'text_new_group_title', 'specific', 'Add New Usergroup'),
(567, 1, 'label_slug', 'specific', 'Slug'),
(568, 1, 'text_group_list_title', 'specific', 'User Group List'),
(569, 1, 'label_total_user', 'specific', 'Total User'),
(570, 1, 'title_password', 'specific', 'Password'),
(571, 1, 'text_password_title', 'specific', 'Password'),
(572, 1, 'text_password_box_title', 'specific', 'Password'),
(573, 1, 'label_password_user', 'specific', 'Password'),
(574, 1, 'label_password_new', 'specific', 'New Password'),
(575, 1, 'label_password_confirm', 'specific', 'Password Confirm'),
(576, 1, 'title_send_sms', 'specific', 'Send SMS'),
(577, 1, 'text_sms_title', 'specific', 'SMS'),
(578, 1, 'text_send_sms', 'specific', 'Send SMS'),
(579, 1, 'text_send_sms_title', 'specific', 'Send SMS'),
(580, 1, 'text_event_sms', 'specific', 'Event SMS'),
(581, 1, 'text_single', 'specific', 'Single'),
(582, 1, 'text_group', 'specific', 'User Group'),
(583, 1, 'label_sms_for', 'specific', 'SMS For'),
(584, 1, 'text_birthday', 'specific', 'Birthday'),
(585, 1, 'label_people_type', 'specific', 'People Type'),
(586, 1, 'text_all_customer', 'specific', 'All Customer'),
(587, 1, 'text_all_user', 'specific', 'All User'),
(588, 1, 'label_people', 'specific', 'People'),
(589, 1, 'label_message', 'specific', 'Messeage'),
(590, 1, 'button_send', 'specific', 'Send'),
(591, 1, 'label_phone_number', 'specific', 'Phone Number'),
(592, 1, 'title_sms_report', 'specific', 'SMS Report'),
(593, 1, 'text_sms_report_title', 'specific', 'SMS Report'),
(594, 1, 'text_sms_list_title', 'specific', 'SMS List'),
(595, 1, 'text_all', 'specific', 'All'),
(596, 1, 'button_delivered', 'specific', 'Delivered'),
(597, 1, 'button_failed', 'specific', 'Failed'),
(598, 1, 'label_schedule_at', 'specific', 'Schedule At'),
(599, 1, 'label_campaign_name', 'specific', 'Campaign Name'),
(600, 1, 'label_people_name', 'specific', 'People Name'),
(601, 1, 'label_mobile_number', 'specific', 'Mobile Number'),
(602, 1, 'label_process_status', 'specific', 'Process Status'),
(603, 1, 'label_response_text', 'specific', 'Response Text'),
(604, 1, 'label_delivered', 'specific', 'Delivered'),
(605, 1, 'label_resend', 'specific', 'Resend'),
(606, 1, 'title_sms_setting', 'specific', 'SMS Setting'),
(607, 1, 'text_sms_setting_title', 'specific', 'SMS Setting'),
(608, 1, 'text_sms_setting', 'specific', 'SMS Setting'),
(609, 1, 'text_clickatell', 'specific', 'clickatell'),
(610, 1, 'text_twilio', 'specific', 'twilio'),
(611, 1, 'text_msg91', 'specific', 'msg91'),
(612, 1, 'text_onnorokomsms', 'specific', 'Onnorokom SMS'),
(613, 1, 'label_api_key', 'specific', 'API Key'),
(614, 1, 'label_sender_id', 'specific', 'Sender Id'),
(615, 1, 'label_auth_key', 'specific', 'Auth Key'),
(616, 1, 'label_contact', 'specific', 'Contact'),
(617, 1, 'label_country_code', 'specific', 'Country Code'),
(618, 1, 'label_maskname', 'specific', 'Maskname'),
(619, 1, 'label_optional', 'specific', 'Optional'),
(620, 1, 'label_campaignname', 'specific', 'Campaign Name'),
(621, 1, 'title_analytics', 'specific', 'Analytics'),
(622, 1, 'text_analytics_title', 'specific', 'Analytics'),
(623, 1, 'text_report_title', 'specific', 'Report'),
(624, 1, 'text_best_customer', 'specific', 'Best Customer'),
(625, 1, 'text_purchase_amount', 'specific', 'Purchase Amount'),
(626, 1, 'text_top_product', 'specific', 'Top Product'),
(627, 1, 'title_overview', 'specific', 'Overview Report'),
(628, 1, 'text_overview_title', 'specific', 'Overview Report'),
(629, 1, 'text_sell_overview', 'specific', 'Sell Overview'),
(630, 1, 'text_purchase_overview', 'specific', 'Purchase Overview'),
(631, 1, 'text_title_sells_overview', 'specific', 'Sell Overview'),
(632, 1, 'text_invoice_amount', 'specific', 'Monto de la factura'),
(633, 1, 'button_details', 'specific', 'Details'),
(634, 1, 'text_discount_amount', 'specific', 'Discount'),
(635, 1, 'text_due_given', 'specific', 'Due Given'),
(636, 1, 'text_due_collection', 'specific', 'Due Collection'),
(637, 1, 'text_others', 'specific', 'Others'),
(638, 1, 'text_shipping_charge', 'specific', 'Shipping Charge'),
(639, 1, 'text_others_charge', 'specific', 'Others Charge'),
(640, 1, 'text_profit_or_loss', 'specific', 'Profit or Loss'),
(641, 1, 'text_order_tax', 'specific', 'Order Tax'),
(642, 1, 'text_item_tax', 'specific', 'Item Tax'),
(643, 1, 'text_total_tax', 'specific', 'Total Tax'),
(644, 1, 'text_title_purchase_overview', 'specific', 'Purchase Overview'),
(645, 1, 'text_due_taken', 'specific', 'Due Taken'),
(646, 1, 'text_due_paid', 'specific', 'Due Paid'),
(647, 1, 'text_total_paid', 'specific', 'Total Paid'),
(648, 1, 'title_collection_report', 'specific', 'Collection Report'),
(649, 1, 'text_collection_report_title', 'specific', 'Collection Report'),
(650, 1, 'title_due_collection', 'specific', 'Due Collection'),
(651, 1, 'text_due_collection_title', 'specific', 'Due Collection'),
(652, 1, 'text_due_collection_sub_title', 'specific', 'Due Collection List'),
(653, 1, 'label_pmethod_name', 'specific', 'Payment Mehtod'),
(654, 1, 'label_created_by', 'specific', 'Created By'),
(655, 1, 'title_supplier_due_paid', 'specific', 'Supplier Due Paid'),
(656, 1, 'text_supplier_due_paid_title', 'specific', 'Supplier Due Paid'),
(657, 1, 'text_supplier_due_paid_sub_title', 'specific', 'Supplier Due Paid'),
(658, 1, 'title_sell_report', 'specific', 'Sell Report'),
(659, 1, 'text_selling_report_title', 'specific', 'Selling Report'),
(660, 1, 'text_selling_report_sub_title', 'specific', 'Selling Report'),
(661, 1, 'button_itemwise', 'specific', 'Itemwise'),
(662, 1, 'button_categorywise', 'specific', 'Categorywise'),
(663, 1, 'button_supplierwise', 'specific', 'Supplierwise'),
(664, 1, 'label_product_name', 'specific', 'Product Name'),
(665, 1, 'label_selling_price_tax', 'specific', 'Selling Price Tax'),
(666, 1, 'label_profit', 'specific', 'Profit'),
(667, 1, 'title_purchase_report', 'specific', 'Purchase Report'),
(668, 1, 'text_purchase_report_title', 'specific', 'Purchase Report'),
(669, 1, 'text_purchase_report_sub_title', 'specific', 'Informe de compra'),
(670, 1, 'label_sup_name', 'specific', 'Sup Name'),
(671, 1, 'title_sell_payment_report', 'specific', 'Sell Payment Report'),
(672, 1, 'text_sell_payment_report_title', 'specific', 'Sell Payment Report'),
(673, 1, 'title_purchase_payment_report', 'specific', 'Purchase Payment Report'),
(674, 1, 'text_purchase_payment_report_title', 'specific', 'Purchase Payment Report'),
(675, 1, 'title_sell_tax_report', 'specific', 'Sell Tax Report'),
(676, 1, 'text_sell_tax_report_title', 'specific', 'Sell Tax Report '),
(677, 1, 'text_sell_amount', 'specific', 'Sell Amount'),
(678, 1, 'text_product_tax_amount', 'specific', 'Product Tax'),
(679, 1, 'text_order_tax_amount', 'specific', 'Order Tax'),
(680, 1, 'text_tax_report_sub_title', 'specific', 'Tax Report '),
(681, 1, 'label_total_amount', 'specific', 'Total Amount'),
(682, 1, 'title_purchase_tax_report', 'specific', 'Purchase Tax Report'),
(683, 1, 'text_purchase_tax_report_title', 'specific', 'Purchase Tax Report'),
(684, 1, 'text_total_tax_amount', 'specific', 'Total Tax'),
(685, 1, 'text_purchase_tax_report_sub_title', 'specific', 'Purcahse Tax Report'),
(686, 1, 'label_tax_amount', 'specific', 'Tax Amount'),
(687, 1, 'title_tax_overview_report', 'specific', 'Tax Overview Report'),
(688, 1, 'text_tax_overview_report_title', 'specific', 'Tax Overview Report'),
(689, 1, 'text_sell_tax', 'specific', 'Sell Tax'),
(690, 1, 'text_purchase_tax', 'specific', 'Purchase Tax'),
(691, 1, 'label_tax_percent', 'specific', 'Tax Percent'),
(692, 1, 'label_count', 'specific', 'Count'),
(693, 1, 'title_stock_report', 'specific', 'Stock Report'),
(694, 1, 'text_stock_report_title', 'specific', 'Stock Report'),
(695, 1, 'text_stock_report', 'specific', 'Stock Report'),
(696, 1, 'supplier_name', 'specific', 'Supplier Name'),
(697, 1, 'title_filemanager', 'specific', 'Filemanager'),
(698, 1, 'title_loan', 'specific', 'Loan'),
(699, 1, 'text_loan_title', 'specific', 'Loan'),
(700, 1, 'text_take_loan_title', 'specific', 'Take Loan'),
(701, 1, 'label_loan_from', 'specific', 'Loan From'),
(702, 1, 'label_interest', 'specific', 'Interest'),
(703, 1, 'label_loan_for', 'specific', 'Loan For'),
(704, 1, 'text_loan_list_title', 'specific', 'Loan List'),
(705, 1, 'button_paid', 'specific', 'Paid'),
(706, 1, 'button_due', 'specific', 'Due'),
(707, 1, 'button_disabled', 'specific', 'Disabled'),
(708, 1, 'label_basic_amount', 'specific', 'Basic Amount'),
(709, 1, 'title_loan_summary', 'specific', 'Loan Summary'),
(710, 1, 'text_loan_summary_title', 'specific', 'Loan Summary'),
(711, 1, 'text_summary_title', 'specific', 'Summary'),
(712, 1, 'text_total_loan', 'specific', 'Total Loan'),
(713, 1, 'text_total_due', 'specific', 'Total Due'),
(714, 1, 'text_recent_payments', 'specific', 'Recent Payments'),
(715, 1, 'title_expense', 'specific', 'Expense'),
(716, 1, 'text_expense_title', 'specific', 'Expense'),
(717, 1, 'text_new_expense_title', 'specific', 'Add New Expense'),
(718, 1, 'label_returnable', 'specific', 'Returnable?'),
(719, 1, 'label_notes', 'specific', 'Notes'),
(720, 1, 'text_expense_list_title', 'specific', 'Expense Category List'),
(721, 1, 'label_category_name', 'specific', 'Category Name'),
(722, 1, 'title_expense_category', 'specific', 'Expense Category'),
(723, 1, 'text_expense_category_title', 'specific', 'Expense Category'),
(724, 1, 'text_new_expense_category_title', 'specific', 'Add New Expense Category'),
(725, 1, 'label_category_slug', 'specific', 'Category Slug'),
(726, 1, 'label_parent', 'specific', 'Parent'),
(727, 1, 'label_category_details', 'specific', 'Category Details'),
(728, 1, 'text_category_list_title', 'specific', 'Category List'),
(729, 1, 'title_expense_monthwise', 'specific', 'Expense Monthwise'),
(730, 1, 'text_expense_monthwise_title', 'specific', 'Expense Monthwise'),
(731, 1, 'text_print', 'specific', 'Print'),
(732, 1, 'text_supplier_list_title', 'specific', 'Supplier List'),
(733, 1, 'text_supplier_title', 'specific', 'Supplier '),
(734, 1, 'text_new_supplier_title', 'specific', 'Add New Supplier'),
(735, 1, 'title_purchase_transaction', 'specific', 'Purchase Transaction'),
(736, 1, 'text_purchase_transaction_title', 'specific', 'Purchase Transaction'),
(737, 1, 'text_transaction_title', 'specific', 'Transaction'),
(738, 1, 'text_transaction_list_title', 'specific', 'Transaction List'),
(739, 1, 'label_pmethod', 'specific', 'Payment Method'),
(740, 1, 'title_sell_transaction', 'specific', 'Sell Transaction'),
(741, 1, 'text_sell_transaction_title', 'specific', 'Sell Transaction'),
(742, 1, 'text_sell_transaction_list_title', 'specific', 'Sell Transaction List'),
(743, 1, 'title_barcode', 'specific', 'Barcode'),
(744, 1, 'text_barcode_title', 'specific', 'Barcode'),
(745, 1, 'text_barcode_generate_title', 'specific', 'Barcode Generate'),
(746, 1, 'label_product_name_with_code', 'specific', 'Product Name with Code'),
(747, 1, 'text_no_product', 'specific', 'No. Proudct'),
(748, 1, 'label_page_layout', 'specific', 'Page Layout'),
(749, 1, 'label_fields', 'specific', 'Fileds'),
(750, 1, 'button_generate', 'specific', 'Generate'),
(751, 1, 'title_category', 'specific', 'Category'),
(752, 1, 'text_category_title', 'specific', 'Category'),
(753, 1, 'text_new_category_title', 'specific', 'Add New Category'),
(754, 1, 'text_product_import_alert', 'specific', 'Product Import Alert'),
(755, 1, 'title_import_product', 'specific', 'Import Product'),
(756, 1, 'text_import_title', 'specific', 'Import'),
(757, 1, 'text_download', 'specific', 'Download'),
(758, 1, 'button_download', 'specific', 'Download'),
(759, 1, 'text_select_xls_file', 'specific', 'Select .xls File'),
(760, 1, 'button_import', 'specific', 'Import'),
(761, 1, 'title_stock_alert', 'specific', 'Stock Alert'),
(762, 1, 'text_stock_alert_title', 'specific', 'Stock Alert'),
(763, 1, 'text_stock_alert_box_title', 'specific', 'Stock Alert'),
(764, 1, 'title_expired', 'specific', 'Expired'),
(765, 1, 'text_expired_title', 'specific', 'Expired'),
(766, 1, 'text_expired_box_title', 'specific', 'Expired'),
(767, 1, 'button_expired', 'specific', 'Expired'),
(768, 1, 'button_expiring_soon', 'specific', 'Comming Soon'),
(769, 1, 'text_due', 'specific', 'Due'),
(770, 1, 'title_purchase_return', 'specific', 'Purchase Return'),
(771, 1, 'text_purchase_return_title', 'specific', 'Purchase Return'),
(772, 1, 'text_return_list_title', 'specific', 'Return List'),
(773, 1, 'text_purchase_return_list_title', 'specific', 'Purchase Return List'),
(774, 1, 'title_sell_return', 'specific', 'Sell Return'),
(775, 1, 'text_sell_return_title', 'specific', 'Sell Return'),
(776, 1, 'text_sell_return_list_title', 'specific', 'Sell Return List'),
(777, 1, 'title_giftcard', 'specific', 'Giftcard'),
(778, 1, 'text_giftcard_title', 'specific', 'Giftcard'),
(779, 1, 'text_new_giftcard_title', 'specific', 'Add New Giftcard'),
(780, 1, 'label_card_no', 'specific', 'Card No.'),
(781, 1, 'label_giftcard_value', 'specific', 'GIftcard Value'),
(782, 1, 'label_expiry_date', 'specific', 'Expiry Date'),
(783, 1, 'button_create_giftcard', 'specific', 'Create GIftcard'),
(784, 1, 'text_giftcard_list_title', 'specific', 'Giftcard List'),
(785, 1, 'label_expiry', 'specific', 'Expiry'),
(786, 1, 'label_topup', 'specific', 'Topup'),
(787, 1, 'title_giftcard_topup', 'specific', 'Giftcard Topup'),
(788, 1, 'text_giftcard_topup_title', 'specific', 'Giftcard Topup'),
(789, 1, 'text_topup_title', 'specific', 'Topup'),
(790, 1, 'text_giftcard_topup_list_title', 'specific', 'Giftcard Popup List'),
(791, 1, 'title_pos', 'specific', 'POS'),
(792, 1, 'text_gift_card', 'specific', 'Giftcard'),
(793, 1, 'button_sell_gift_card', 'specific', 'Giftcard'),
(794, 1, 'text_keyboard_shortcut', 'specific', 'Keyboard Shortcut '),
(795, 1, 'text_holding_order', 'specific', 'Holding Order'),
(796, 1, 'text_search_product', 'specific', 'Search/Barcode Scan'),
(797, 1, 'button_add_product', 'specific', 'Add Product'),
(798, 1, 'button_purchase_now', 'specific', 'Purchase Now'),
(799, 1, 'label_add_to_cart', 'specific', 'Add To Cart'),
(800, 1, 'text_add_note', 'specific', 'Add Note'),
(801, 1, 'label_price', 'specific', 'Price'),
(802, 1, 'label_total_items', 'specific', 'Total Item'),
(803, 1, 'label_discount', 'specific', 'Discount'),
(804, 1, 'label_total_payable', 'specific', 'Total Payable'),
(805, 1, 'button_pay', 'specific', 'Pay Now'),
(806, 1, 'button_hold', 'specific', 'Hold'),
(807, 1, 'text_update_title', 'specific', 'Update 1'),
(808, 1, 'text_male', 'specific', 'Male'),
(809, 1, 'text_female', 'specific', 'Female'),
(810, 1, 'text_thumbnail', 'specific', 'Thumbnail'),
(811, 1, 'text_update_success', 'specific', 'Successfully Updated'),
(812, 1, 'title_user_profile', 'specific', 'User Profile'),
(813, 1, 'text_profile_title', 'specific', 'Profile'),
(814, 1, 'text_users', 'specific', 'Users'),
(815, 1, 'text_since', 'specific', 'Since'),
(816, 1, 'text_contact_information', 'specific', 'Contact Information'),
(817, 1, 'label_collection', 'specific', 'Collection'),
(818, 1, 'text_sell_report', 'specific', 'Sell Report'),
(819, 1, 'text_purchase_report', 'specific', 'Purchase Report'),
(820, 1, 'text_payment_report', 'specific', 'Payment Report'),
(821, 1, 'text_login_log', 'specific', 'Login History'),
(822, 1, 'button_collection_report', 'specific', 'Collection Report'),
(823, 1, 'button_log', 'specific', 'Log'),
(824, 1, 'text_invoice_list', 'specific', 'Invoice List'),
(825, 1, 'label_items', 'specific', 'Items'),
(826, 1, 'label_time', 'specific', 'Time'),
(827, 1, 'title_bank_transactions', 'specific', 'Bank Transactions'),
(828, 1, 'text_bank_transaction_title', 'specific', 'Bank Transaction'),
(829, 1, 'text_bank_account_title', 'specific', 'Bank Account'),
(830, 1, 'text_bank_transaction_list_title', 'specific', 'Bank Transaction List'),
(831, 1, 'button_filtering', 'specific', 'Filtering'),
(832, 1, 'text_view_all_transactions', 'specific', 'View All Transactions'),
(833, 1, 'label_account', 'specific', 'Account'),
(834, 1, 'label_credit', 'specific', 'Credit'),
(835, 1, 'label_debit', 'specific', 'Debit'),
(836, 1, 'text_unpaid', 'specific', 'Unpaid'),
(837, 1, 'title_income_source', 'specific', 'Income Source'),
(838, 1, 'text_income_source_title', 'specific', 'Income Source'),
(839, 1, 'text_new_income_source_title', 'specific', 'Add New Income Source'),
(840, 1, 'label_source_name', 'specific', 'Source Name'),
(841, 1, 'label_source_slug', 'specific', 'Source Slug'),
(842, 1, 'label_source_details', 'specific', 'Source Details'),
(843, 1, 'text_income_source_sub_title', 'specific', 'Income Source List'),
(844, 1, 'title_income_monthwise', 'specific', 'Income Monthwise'),
(845, 1, 'text_income_monthwise_title', 'specific', 'Income Monthwise'),
(846, 1, 'label_capital', 'specific', 'Capital'),
(847, 1, 'title_bank_transfer', 'specific', 'Bank Transfer'),
(848, 1, 'text_bank_transfer_title', 'specific', 'Bank Transfer'),
(849, 1, 'text_banking_title', 'specific', 'Banking'),
(850, 1, 'text_list_bank_transfer_title', 'specific', 'Bank Transfer List'),
(851, 1, 'label_from_account', 'specific', 'From Account'),
(852, 1, 'label_to_account', 'specific', 'To Account'),
(853, 1, 'title_income_and_expense', 'specific', 'Income '),
(854, 1, 'text_income_and_expense_title', 'specific', 'Income vs Expense'),
(855, 1, 'text_date', 'specific', 'Date'),
(856, 1, 'title_income', 'specific', 'Income'),
(857, 1, 'label_this_month', 'specific', 'This Month'),
(858, 1, 'label_this_year', 'specific', 'This Year'),
(859, 1, 'label_till_now', 'specific', 'Till Now'),
(860, 1, 'error_currency_title', 'specific', 'Currency Tittle is not valid'),
(861, 1, 'text_pmethod', 'specific', 'Payment Method'),
(862, 1, 'button_full_payment', 'specific', 'FULL PAYMENT'),
(863, 1, 'button_full_due', 'specific', 'FULL DUE'),
(864, 1, 'button_sell_with_installment', 'specific', 'Sell With Installment'),
(865, 1, 'text_pay_amount', 'specific', 'Pay Amount'),
(866, 1, 'placeholder_input_an_amount', 'specific', 'Input Amount'),
(867, 1, 'placeholder_note_here', 'specific', 'Note Here'),
(868, 1, 'title_installment_details', 'specific', 'Installment Details'),
(869, 1, 'label_duration', 'specific', 'Duration'),
(870, 1, 'text_days', 'specific', 'Days'),
(871, 1, 'label_interval', 'specific', 'Interval'),
(872, 1, 'label_total_installment', 'specific', 'Total Installment'),
(873, 1, 'label_interest_percentage', 'specific', 'Interest Percentage'),
(874, 1, 'label_interest_amount', 'specific', 'Interest Amount'),
(875, 1, 'text_order_details', 'specific', 'Order Details'),
(876, 1, 'error_reference_no', 'specific', 'Reference no. is not valid'),
(877, 1, 'error_date', 'specific', 'Date is not valid'),
(878, 1, 'error_total_amount', 'specific', 'Total amount is not valid'),
(879, 1, 'error_customer', 'specific', 'Customer is not valid'),
(880, 1, 'text_quotation_create_success', 'specific', 'Successfully Created'),
(881, 1, 'button_action', 'specific', 'Action'),
(882, 1, 'button_create_sell', 'specific', 'Create Sell'),
(883, 1, 'title_installment_overview', 'specific', 'Installment Overview');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(884, 1, 'text_installment_overview_title', 'specific', 'Installment Overview Report'),
(885, 1, 'text_installment_overview', 'specific', 'Installment Overview'),
(886, 1, 'text_invoice_count', 'specific', 'Invoice Count'),
(887, 1, 'text_interest_amount', 'specific', 'Interest Amount'),
(888, 1, 'text_amount_received', 'specific', 'Amount Received'),
(889, 1, 'text_amount_due', 'specific', 'Amount Due'),
(890, 1, 'text_expired_due_payment', 'specific', 'Expired Due Payment'),
(891, 1, 'text_all_due_payment', 'specific', 'All Due Payment'),
(892, 1, 'text_todays_due_payment', 'specific', 'Todays Due Payment'),
(893, 1, 'title_installment', 'specific', 'Installment'),
(894, 1, 'text_installment_title', 'specific', 'Installment'),
(895, 1, 'text_installment_sub_title', 'specific', 'Installment List'),
(896, 1, 'button_all_installment', 'specific', 'All Installment'),
(897, 1, 'button_due_installment', 'specific', 'Due Installment'),
(898, 1, 'button_paid_installment', 'specific', 'Paid Installment'),
(899, 1, 'label_total_ins', 'specific', 'Total Ins.'),
(900, 1, 'text_order_summary', 'specific', 'Order Summary'),
(901, 1, 'label_previous_due', 'specific', 'Previous Due'),
(902, 1, 'text_return_item', 'specific', 'Return Item'),
(903, 1, 'label_return_quantity', 'specific', 'Return Quantity'),
(904, 1, 'placeholder_type_any_note', 'specific', 'Type Note'),
(905, 1, 'error_quantity_exceed', 'specific', 'Quantity Exceed'),
(906, 1, 'text_return_success', 'specific', 'Return Successfull'),
(907, 1, 'label_purchase_note', 'specific', 'Purchase Note'),
(908, 1, 'text_purchase_update_success', 'specific', 'Successfully Updated'),
(909, 1, 'error_items', 'specific', 'Items is not valid'),
(910, 1, 'error_store_id', 'specific', 'Store is not valid'),
(911, 1, 'text_transfer_success', 'specific', 'Successfully Transfered'),
(912, 1, 'button_transfer_edit', 'specific', 'Transfer Edit'),
(913, 1, 'text_update_transfer_status_success', 'specific', 'Successfully Updated'),
(914, 1, 'label_transferred_to', 'specific', 'Transfered To'),
(915, 1, 'text_product_list', 'specific', 'Product List'),
(916, 1, 'error_category_name', 'specific', 'Category name is not valid'),
(917, 1, 'error_sup_name', 'specific', 'Suppllier name is not valid'),
(918, 1, 'error_supplier_email_or_mobile', 'specific', 'Supplier email or mobile is not valid'),
(919, 1, 'error_sup_address', 'specific', 'Supplier Address is not valid'),
(920, 1, 'error_unit_name', 'specific', 'Unit name is not valid'),
(921, 1, 'error_product_name', 'specific', 'Product name is not valid'),
(922, 1, 'error_sup_id', 'specific', 'Supplier is not valid'),
(923, 1, 'text_product_name', 'specific', 'Product Name'),
(924, 1, 'text_quantity', 'specific', 'Quantity'),
(925, 1, 'button_print', 'specific', 'Print'),
(926, 1, 'error_walking_customer_can_not_craete_due', 'specific', 'Walking Customer Can\'t to Create a Due'),
(927, 1, 'error_stock', 'specific', 'Stock amount is not valid'),
(928, 1, 'error_installment_count', 'specific', 'Installment count is not valid'),
(929, 1, 'title_bank_account', 'specific', 'Bank Account'),
(930, 1, 'text_new_bank_account_title', 'specific', 'Add New Bank Account'),
(931, 1, 'label_account_name', 'specific', 'Account Name'),
(932, 1, 'label_account_details', 'specific', 'Account Details'),
(933, 1, 'label_account_no', 'specific', 'Account No.'),
(934, 1, 'label_contact_person', 'specific', 'Contact Person'),
(935, 1, 'label_internal_banking_url', 'specific', 'Internal Banking Url'),
(936, 1, 'text_bank_account_list_title', 'specific', 'Bank Account List'),
(937, 1, 'label_account_description', 'specific', 'Account Description'),
(938, 1, 'title_bank_account_sheet', 'specific', 'Balance Sheet'),
(939, 1, 'text_bank_account_sheet_title', 'specific', 'Balance Sheet'),
(940, 1, 'text_bank_account_sheet_list_title', 'specific', 'Balance Sheet Details'),
(941, 1, 'label_account_id', 'specific', 'Account Id'),
(942, 1, 'label_transfer_to_other', 'specific', 'Transfer To Other'),
(943, 1, 'label_transfer_from_other', 'specific', 'Transfer From Other'),
(944, 1, 'label_deposit', 'specific', 'Deposit'),
(945, 1, 'label_withdraw', 'specific', 'Widthdraw'),
(946, 1, 'text_select_store', 'specific', 'Select Store'),
(947, 1, 'text_activate_success', 'specific', 'Successfully Activated'),
(948, 1, 'text_template_content_update_success', 'specific', 'Successfully updated'),
(949, 1, 'text_template_css_update_success', 'specific', 'Successfully updated'),
(950, 1, 'title_cashbook', 'specific', 'Cashbook'),
(951, 1, 'text_cashbook_title', 'specific', 'Cashbook'),
(952, 1, 'text_cashbook_details_title', 'specific', 'Cashbook Details'),
(953, 1, 'label_opening_balance', 'specific', 'Opening Balance'),
(954, 1, 'label_today_income', 'specific', 'Today Income'),
(955, 1, 'label_total_income', 'specific', 'Total Income'),
(956, 1, 'label_today_expense', 'specific', 'Today Expense'),
(957, 1, 'label_cash_in_hand', 'specific', 'Cash In Hand'),
(958, 1, 'label_today_closing_balance', 'specific', 'Today Closing Balance'),
(959, 1, 'text_balance_update_success', 'specific', 'Successfully Updated'),
(960, 1, 'title_profit_and_loss', 'specific', 'Profit vs Loss'),
(961, 1, 'text_profit_and_loss_title', 'specific', 'Profit vs Loss'),
(962, 1, 'text_profit_and_loss_details_title', 'specific', 'Profit vs Loss Details'),
(963, 1, 'text_loss_title', 'specific', 'Loss'),
(964, 1, 'text_profit_title', 'specific', 'Profit'),
(965, 1, 'label_total_profit', 'specific', 'Total Profit'),
(966, 1, 'label_total_loss', 'specific', 'Total Loss'),
(967, 1, 'label_net_profit', 'specific', 'Net Profit'),
(968, 1, 'label_source', 'specific', 'Source'),
(969, 1, 'label_slip_no', 'specific', 'Slip No.'),
(970, 1, 'label_by', 'specific', 'By'),
(971, 1, 'label_exp_category', 'specific', 'Expense Category'),
(972, 1, 'label_about', 'specific', 'About'),
(973, 1, 'button_withdraw_now', 'specific', 'Widthdraw Now'),
(974, 1, 'label_income_source', 'specific', 'Income Source'),
(975, 1, 'button_deposit_now', 'specific', 'Deposit Now'),
(976, 1, 'text_deposit_success', 'specific', 'Deposit Successfull'),
(977, 1, 'text_delete_title', 'specific', 'Delete'),
(978, 1, 'text_delete_instruction', 'specific', 'What should be done with data belong to the content?'),
(979, 1, 'label_insert_content_to', 'specific', 'Insert Content To'),
(980, 1, 'button_add_language', 'specific', 'Add Language'),
(981, 1, 'code', 'specific', 'code'),
(982, 1, 'error_code', 'specific', 'Code is not valid'),
(983, 1, 'text_uppdate_success', 'specific', 'Successfully Updated'),
(984, 1, 'error_name', 'specific', 'Name is not valid'),
(985, 1, 'text_hindi', 'specific', 'Hindi'),
(986, 1, 'text_create_success', 'specific', 'Successfully Created'),
(987, 1, 'text_gremany', 'specific', 'Germany'),
(988, 1, 'button_add_new_language', 'specific', 'Add New Language'),
(989, 1, 'text_fullscreen', 'specific', 'Fullscreen'),
(990, 1, 'text_sales', 'specific', 'Sells'),
(991, 1, 'text_quotations', 'specific', 'Quotations'),
(992, 1, 'text_purchases', 'specific', 'Purchases'),
(993, 1, 'text_transfers', 'specific', 'Transfers'),
(994, 1, 'text_customers', 'specific', 'Customers'),
(995, 1, 'text_suppliers', 'specific', 'Suppliers'),
(996, 1, 'label_payment_status', 'specific', 'Payment Status'),
(997, 1, 'button_add_sales', 'specific', 'Add Sell'),
(998, 1, 'button_list_sales', 'specific', 'SELL LIST'),
(999, 1, 'text_sales_amount', 'specific', 'Sell Amount'),
(1000, 1, 'text_discount_given', 'specific', 'Discount Given'),
(1001, 1, 'text_received_amount', 'specific', 'Received Amount'),
(1002, 1, 'button_add_quotations', 'specific', 'Add Quotation'),
(1003, 1, 'button_list_quotations', 'specific', 'Quotation List'),
(1004, 1, 'label_supplier_name', 'specific', 'Supplier Name'),
(1005, 1, 'button_add_purchases', 'specific', 'Add Purchase'),
(1006, 1, 'button_list_purchases', 'specific', 'Purchase List'),
(1007, 1, 'button_add_transfers', 'specific', 'Add Transfer'),
(1008, 1, 'button_list_transfers', 'specific', 'Transfer List'),
(1009, 1, 'button_add_customer', 'specific', 'Add Customer'),
(1010, 1, 'button_list_customers', 'specific', 'Customer List'),
(1011, 1, 'button_add_supplier', 'specific', 'Add Supplier'),
(1012, 1, 'button_list_suppliers', 'specific', 'Supplier List'),
(1013, 1, 'text_permission', 'specific', 'Permission'),
(1014, 1, 'text_recent_activities', 'specific', 'Recent Activities'),
(1015, 1, 'text_top_products', 'specific', 'Top Products'),
(1016, 1, 'text_top_customers', 'specific', 'Top Customers'),
(1017, 1, 'text_top_suppliers', 'specific', 'Top Suppliers'),
(1018, 1, 'text_top_brands', 'specific', 'Top Brands'),
(1019, 1, 'text_amount', 'specific', 'Amount'),
(1020, 1, 'text_purchase', 'specific', 'Purchase 2'),
(1021, 1, 'title_login_logs', 'specific', 'Login Logs'),
(1022, 1, 'title_activity_logs', 'specific', 'Activity Logs'),
(1023, 1, 'text_birthday_today', 'specific', 'Birthday Today'),
(1024, 1, 'text_birthday_coming', 'specific', 'Birthday Coming'),
(1025, 1, 'title_income_vs_expense', 'specific', 'Income vs Expense'),
(1026, 1, 'text_download_as_jpg', 'specific', 'Download as PNG'),
(1027, 1, 'error_disabled_by_default', 'specific', 'Disabled By Default'),
(1028, 1, 'button_empty_value', 'specific', 'Empty Value'),
(1029, 1, 'text_invoice_create_success', 'specific', 'Successfully Created'),
(1030, 1, 'button_send_sms', 'specific', 'Send SMS'),
(1031, 1, 'button_email', 'specific', 'Email'),
(1032, 1, 'button_back_to_pos', 'specific', 'Back to POS'),
(1033, 1, 'error_status', 'specific', 'Status is not valid'),
(1034, 1, 'error_reference_no_exist', 'specific', 'Ref. no. is not valid'),
(1035, 1, 'text_view_invoice_title', 'specific', 'View Invoice Title'),
(1036, 1, 'text_new_dashboard', 'specific', 'New Dashboard'),
(1037, 1, 'text_recent_customer_box_title', 'specific', 'Recent Customers'),
(1038, 1, 'label_customer_mobile', 'specific', 'Customer Mobile'),
(1039, 1, 'label_invoice_note', 'specific', 'Invoice Note'),
(1040, 1, 'text_sell_update_success', 'specific', 'Successfully Updated'),
(1041, 1, 'label_customer_id', 'specific', 'Customer Id'),
(1042, 1, 'label_returened_by', 'specific', 'Returned By'),
(1043, 1, 'text_return_products', 'specific', 'Return Products'),
(1044, 1, 'button_topup', 'specific', 'Topup'),
(1045, 1, 'button_topup_now', 'specific', 'Topup Now'),
(1046, 1, 'error_amount', 'specific', 'Amount is not Valid'),
(1047, 1, 'error_expiry_date', 'specific', 'Expiry Date'),
(1048, 1, 'text_topup_success', 'specific', 'Topup Successfull'),
(1049, 1, 'label_vat_number', 'specific', 'VAT Number'),
(1050, 1, 'label_unit_price', 'specific', 'Unit Price'),
(1051, 1, 'label_shipping', 'specific', 'Shipping'),
(1052, 1, 'label_stamp_and_signature', 'specific', 'Stamp and Signature'),
(1053, 1, 'title_quotation_edit', 'specific', 'Quotation Edit'),
(1054, 1, 'text_quotation_edit_title', 'specific', 'Quotation Edit'),
(1055, 1, 'text_quotation_update_success', 'specific', 'Successfully Updated'),
(1056, 1, 'error_product_not_found', 'specific', 'Product Not Found'),
(1057, 1, 'error_invoice_product_type', 'specific', 'Invoice product type is not valid'),
(1058, 1, 'label_checkout_status', 'specific', 'Checkout Status'),
(1059, 1, 'label_sub_total', 'specific', 'Sub Total'),
(1060, 1, 'text_payments', 'specific', 'Payments'),
(1061, 1, 'error_select_at_least_one_item', 'specific', 'Seleccione al menos un producto'),
(1062, 1, 'button_pay_now', 'specific', 'Pay Now'),
(1063, 1, 'text_billing_details', 'specific', 'Billing Details'),
(1064, 1, 'Print Barcode', 'specific', 'undefined'),
(1065, 1, 'error_new_category_name', 'specific', 'Please select a category'),
(1066, 1, 'error_customer_name', 'specific', 'Customer name is not valid'),
(1067, 1, 'error_expired_date_below', 'specific', 'Expired date is not valid'),
(1068, 1, 'label_insert_invoice_to', 'specific', 'Insert Invoice To'),
(1069, 1, 'error_new_customer_name', 'specific', 'Please select a customer'),
(1070, 1, 'title_customer_profile', 'specific', 'Customer Profile'),
(1071, 1, 'text_total_purchase', 'specific', 'Total Purchase'),
(1072, 1, 'label_mobile_phone', 'specific', 'Mobile Phone'),
(1073, 1, 'button_transaction_list', 'specific', 'Transaction List'),
(1074, 1, 'label_ref_invoice_Id', 'specific', 'Ref. Invoice Id'),
(1075, 1, 'error_code_name', 'specific', 'Code name is not valid'),
(1076, 1, 'title_supplier_profile', 'specific', 'Supplier Profile'),
(1077, 1, 'text_supplier_profile_title', 'specific', 'Supplier Profile'),
(1078, 1, 'text_supplier_products', 'specific', 'Supplier Products'),
(1079, 1, 'button_products', 'specific', 'Products'),
(1080, 1, 'text_balance_amount', 'specific', 'Balance Amount'),
(1081, 1, 'text_sells', 'specific', 'Sells'),
(1082, 1, 'text_chart', 'specific', 'Chart'),
(1083, 1, 'text_purchase_invoice_list', 'specific', 'Purchase Invoice List'),
(1084, 1, 'button_all_purchase', 'specific', 'All Purchase'),
(1085, 1, 'button_due_purchase', 'specific', 'Due Purchase'),
(1086, 1, 'button_paid_purchase', 'specific', 'Paid Purchase'),
(1087, 1, 'button_stock_transfer', 'specific', 'Stock Transfer'),
(1088, 1, 'text_selling_invoice_list', 'specific', 'Selling Invoice List'),
(1089, 1, 'error_account', 'specific', 'Account is not valid'),
(1090, 1, 'error_ref_no', 'specific', 'Ref. no. is not valid'),
(1091, 1, 'error_about', 'specific', 'About is not valid'),
(1092, 1, 'error_title', 'specific', 'Title is not valid'),
(1093, 1, 'text_withdraw_success', 'specific', 'successfully created'),
(1094, 1, 'error_from_account', 'specific', 'From account is not valid'),
(1095, 1, 'error_to_account', 'specific', 'To account is not valid'),
(1096, 1, 'error_same_account', 'specific', 'Receiver and sender can\'t be same'),
(1097, 1, 'error_insufficient_balance', 'specific', 'Insufficient balance'),
(1098, 1, 'error_ref_no_exist', 'specific', 'Ref. no. already exists'),
(1099, 1, 'error_account_name', 'specific', 'Account name is not valid'),
(1100, 1, 'error_account_no', 'specific', 'Account no. is not valid'),
(1101, 1, 'error_contact_person', 'specific', 'Contact person is not valid'),
(1102, 1, 'error_phone_number', 'specific', 'Phone number is not valid'),
(1103, 1, 'text_income', 'specific', 'Income'),
(1104, 1, 'text_expense', 'specific', 'Expense'),
(1105, 1, 'text_update_income_source_success', 'specific', 'Successfully updated'),
(1106, 1, 'error_new_source_name', 'specific', 'Please select a source'),
(1107, 1, 'text_delete_income_source_success', 'specific', 'Successfully deleted'),
(1108, 1, 'label_day', 'specific', 'Day'),
(1109, 1, 'error_category_id', 'specific', 'Category id is not valid'),
(1110, 1, 'button_viefw', 'specific', 'View'),
(1111, 1, 'label_summary', 'specific', 'Summary'),
(1112, 1, 'label_grand_total', 'specific', 'Grand Total'),
(1113, 1, 'label_this_week', 'specific', 'This Week'),
(1114, 1, 'error_loan_from', 'specific', 'Loan from is not valid'),
(1115, 1, 'error_loan_headline', 'specific', 'Loan headline is not valid'),
(1116, 1, 'error_loan_amount', 'specific', 'Loan amount is not valid'),
(1117, 1, 'text_take_loan_success', 'specific', 'Successfully created'),
(1118, 1, 'error_paid_amount', 'specific', 'Paid amount is not valid'),
(1119, 1, 'error_pay_amount_greater_than_due_amount', 'specific', 'Pay amount can\'t be greater than due amount'),
(1120, 1, 'text_loan_paid_success', 'specific', 'Successfully paid'),
(1121, 1, 'error_sms_text', 'specific', 'SMS text is not valid'),
(1122, 1, 'text_success_sms_sent', 'specific', 'SMS successfully sent'),
(1123, 1, 'error_user_name', 'specific', 'user name is not valid'),
(1124, 1, 'error_user_email_or_mobile', 'specific', 'Email or mobile is not valid'),
(1125, 1, 'error_user_group', 'specific', 'User Group is not valid'),
(1126, 1, 'error_user_password_match', 'specific', 'Retype password didn\'t matched'),
(1127, 1, 'error_user_password_length', 'specific', 'User password length is not valid'),
(1128, 1, 'text_income_vs_expense', 'specific', 'Income vs Expense'),
(1129, 1, 'error_mobile', 'specific', 'Mobile number is not valid'),
(1130, 1, 'error_email', 'specific', 'Email is not valid'),
(1131, 1, 'error_zip_code', 'specific', 'Zip code is not valid'),
(1132, 1, 'error_addreess', 'specific', 'Address is not valid'),
(1133, 1, 'error_preference_receipt_template', 'specific', 'Receipt template is not valid'),
(1134, 1, 'error_currency', 'specific', 'Currency is not valid'),
(1135, 1, 'error_brand_name', 'specific', 'Please select a brand name'),
(1136, 1, 'title_brand_profile', 'specific', 'Brand Profile'),
(1137, 1, 'text_brand_profile_title', 'specific', 'Brand Profile'),
(1138, 1, 'text_brands', 'specific', 'Brands'),
(1139, 1, 'text_brand_products', 'specific', 'Brand Products'),
(1140, 1, 'button_all_products', 'specific', 'All Products'),
(1141, 1, 'text_total_sell', 'specific', 'Total Sell'),
(1142, 1, 'label_brand_name', 'specific', 'Brand Name'),
(1143, 1, 'label_insert_product_to', 'specific', 'Insert Product To'),
(1144, 1, 'error_currency_code', 'specific', 'Currency code is not valid'),
(1145, 1, 'error_currency_symbol', 'specific', 'Currency symbol is not valid'),
(1146, 1, 'error_currency_decimal_place', 'specific', 'Decimal number is not valid'),
(1147, 1, 'error_pmethod_name', 'specific', 'Payment method is not valid'),
(1148, 1, 'label_invoice_to', 'specific', 'Invoice To'),
(1149, 1, 'error_delete_unit_name', 'specific', 'Please select a unit'),
(1150, 1, 'label_ip', 'specific', 'Ip'),
(1151, 1, 'error_taxrate_name', 'specific', 'Taxrate name is not valid'),
(1152, 1, 'error_taxrate', 'specific', 'Taxrate is not valid'),
(1153, 1, 'error_delete_taxrate_name', 'specific', 'Please select a taxrate'),
(1154, 1, 'error_box_name', 'specific', 'Box name is not valid'),
(1155, 1, 'error_delete_box_name', 'specific', 'Please select a box'),
(1156, 1, 'label_success', 'specific', 'Success'),
(1157, 1, 'title_customer_analysis', 'specific', 'Customer Analysis'),
(1158, 1, 'title_customer_analytics', 'specific', 'Customer Analytics'),
(1159, 1, 'error_not_found', 'specific', 'Not Found'),
(1160, 1, 'menu_sell_list', 'specific', 'SELL LIST'),
(1161, 1, 'menu_sell_log', 'specific', 'SELL LOG'),
(1162, 1, 'menu_purchase_logs', 'specific', 'PURCHASE LOG'),
(1163, 1, 'menu_receive_list', 'specific', 'RECEIVE LIST'),
(1164, 1, 'menu_statements', 'specific', 'STATEMENTS'),
(1165, 1, 'menu_data_reset', 'specific', 'DATA RESET'),
(1166, 1, 'placeholder_search_here', 'specific', 'Search Here...'),
(1167, 1, 'text_sell_list_title', 'specific', 'Sell List'),
(1168, 1, 'text_invoices', 'specific', 'Invoices'),
(1169, 1, 'placeholder_input_discount_amount', 'specific', 'Input Discount Amount'),
(1170, 1, 'label_previous_due_paid', 'specific', 'Prev. Due Paid'),
(1171, 1, 'button_add_purchase', 'specific', 'Add Purchase'),
(1172, 1, 'text_selling_tax', 'specific', 'Selling Tax'),
(1173, 1, 'text_igst', 'specific', 'IGST'),
(1174, 1, 'text_cgst', 'specific', 'CGST'),
(1175, 1, 'text_sgst', 'specific', 'SGST'),
(1176, 1, 'text_return_amount', 'specific', 'Return Amount'),
(1177, 1, 'text_sell_due_paid_success', 'specific', 'Due successfully paid'),
(1178, 1, 'text_images', 'specific', 'Images'),
(1179, 1, 'label_hsn_code', 'specific', 'HSN Code'),
(1180, 1, 'label_select', 'specific', '-- Please Select --'),
(1181, 1, 'label_sold', 'specific', 'Sold'),
(1182, 1, 'button_view_details', 'specific', 'View'),
(1183, 1, 'text_installment_details', 'specific', 'Installment Details'),
(1184, 1, 'label_initial_payment', 'specific', 'Initial Payment'),
(1185, 1, 'label_interval_count', 'specific', 'Internal Count'),
(1186, 1, 'label_installment_count', 'specific', 'Installment Count'),
(1187, 1, 'label_last_installment_date', 'specific', 'Last Installment Date'),
(1188, 1, 'label_installment_end_date', 'specific', 'Installment End Date'),
(1189, 1, 'label_sl', 'specific', 'SL'),
(1190, 1, 'text_update_installment_payment_success', 'specific', 'Installment payment successfull'),
(1191, 1, 'error_amount_exceed', 'specific', 'Amount Exceed'),
(1192, 1, 'text_expiry', 'specific', 'Expiry'),
(1193, 1, 'text_opening_balance_update_success', 'specific', 'Opening balance successfully updated'),
(1194, 1, 'title_reset_your_system', 'specific', 'Reset your system'),
(1195, 1, 'title_sell_log', 'specific', 'Sell Log'),
(1196, 1, 'text_sell_log_title', 'specific', 'Sell Log'),
(1197, 1, 'text_sell_title', 'specific', 'Sell'),
(1198, 1, 'label_gtin', 'specific', ''),
(1199, 1, 'button_add_balance', 'specific', 'Add Balance'),
(1200, 1, 'button_statement', 'specific', 'Statement'),
(1201, 1, 'text_all_invoice', 'specific', 'All Invoice'),
(1202, 1, 'label_prev_due', 'specific', 'Prev. Due'),
(1203, 1, 'error_invoice_id', 'specific', 'Invoice id is not valid'),
(1204, 1, 'title_settings', 'specific', ''),
(1205, 1, 'text_cronjob', 'specific', ''),
(1208, 1, 'button_due_invoice_list', 'specific', ''),
(1209, 1, 'text_substract_amount', 'specific', ''),
(1210, 1, 'text_balance_added', 'specific', ''),
(1211, 1, 'button_substract_balance', 'specific', ''),
(1212, 1, 'title_purchase_log', 'specific', 'Purchase log'),
(1213, 1, 'text_purchase_log_title', 'specific', 'Purchase Log'),
(1214, 1, 'title_log_in', 'specific', ''),
(1215, 1, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;font-weight:bold&quot; href=&quot;http://docs.itsolution24.com/pos/&quot;&gt;Online Documentation&lt;/a&gt;  |  &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(1216, 1, 'error_disabled_in_demo', 'specific', 'This feature is disable in error!'),
(1217, 1, 'text_order_title', 'specific', ''),
(1218, 1, 'error_purchase_price', 'specific', ''),
(1219, 1, 'text_list__transfer__title', 'specific', ''),
(1220, 1, 'text_download_sample_format_file', 'specific', ''),
(1221, 1, 'text_barcode_print', 'specific', ''),
(1222, 1, 'button_semd_email', 'specific', ''),
(1223, 1, 'button_send_email', 'specific', 'Send Email'),
(1224, 1, 'error_email_not_sent', 'specific', ''),
(1225, 1, 'text_success_email_sent', 'specific', ''),
(1226, 1, 'button_installment_payment', 'specific', ''),
(1227, 1, 'text_sell_log_list_title', 'specific', 'Sell Log Details'),
(1228, 1, 'text_purchase_log_list_title', 'specific', 'Purchase Log Details'),
(1229, 1, 'text_stock_transfer_title', 'specific', ''),
(1230, 1, 'title_receive', 'specific', 'Receive'),
(1231, 1, 'text_stock_receive_title', 'specific', 'Stock Receive'),
(1232, 1, 'text_receive_title', 'specific', 'Receive'),
(1233, 1, 'text_list__receive__title', 'specific', 'Receive Details'),
(1234, 1, 'label_what_for', 'specific', ''),
(1235, 1, 'error_out_of_stock', 'specific', ''),
(1236, 1, 'xxx', 'specific', ''),
(1237, 1, 'error_login', 'specific', ''),
(1238, 1, 'text_purchase_due_paid_success', 'specific', ''),
(1239, 1, 'text_trash', 'specific', ''),
(1240, 1, 'button_restore_all', 'specific', 'Restore All'),
(1241, 1, 'success_restore_all', 'specific', ''),
(1242, 1, 'title_customer_statement', 'specific', ''),
(1243, 1, 'text_statement_title', 'specific', ''),
(1244, 1, 'title_profit', 'specific', ''),
(1245, 1, 'error_return_quantity_exceed', 'specific', ''),
(1246, 1, 'label_transferred_from', 'specific', ''),
(1247, 1, 'label_member_since', 'specific', ''),
(1248, 1, 'text_not_found', 'specific', ''),
(1249, 1, 'label_logged_in', 'specific', ''),
(1250, 1, 'text_disabled', 'specific', ''),
(1251, 1, 'text_gtin', 'specific', ''),
(1252, 1, 'text_balance', 'specific', ''),
(1253, 1, 'error_invalid_username_password', 'specific', ''),
(1254, 1, 'error_installment_interest_percentage', 'specific', ''),
(1255, 1, 'error_installment_interest_amount', 'specific', ''),
(1256, 1, 'button_resend', 'specific', ''),
(1257, 1, 'error_sms_not_sent', 'specific', ''),
(1258, 1, 'text_sms_logs_title', 'specific', ''),
(1259, 1, 'text_sms_history_title', 'specific', ''),
(1260, 1, 'error_mobile_exist', 'specific', ''),
(1261, 1, 'text_success_sms_schedule', 'specific', ''),
(1262, 1, 'text_success_sms_added_to_schedule', 'specific', ''),
(1263, 1, 'text_mimsms', 'specific', ''),
(1264, 1, 'label_api_token', 'specific', ''),
(1265, 1, 'error_gateway', 'specific', ''),
(1266, 1, 'error_sms_not_send', 'specific', ''),
(1267, 1, 'invoice_sms_text', 'specific', 'Dear [customer_name],  Invoice ID: [invoice_id],  Payable: [payable_amount],  Paid: [paid_amount] ,  Due: [due]. Purchase at- [date_time]. Regards, [store_name],  [address]'),
(1268, 1, 'text_stock_register', 'specific', ''),
(1269, 1, 'text_urdu', 'specific', ''),
(1270, 1, 'error_default_language', 'specific', ''),
(1271, 1, 'error_active_or_sold', 'specific', ''),
(1272, 1, 'title_home', 'specific', 'Home'),
(1273, 1, 'error_supplier_name', 'specific', ''),
(1274, 1, 'error_expired_date_belowx', 'specific', ''),
(1275, 1, 'title_categories', 'specific', ''),
(1276, 1, 'title_products', 'specific', 'Products'),
(1277, 1, 'title_shop_on_sale', 'specific', ''),
(1278, 1, 'title_cart', 'specific', 'Cart'),
(1279, 1, 'title_wishlist', 'specific', ''),
(1280, 1, 'title_account', 'specific', ''),
(1281, 1, 'title_contact', 'specific', ''),
(1282, 1, 'title_contact_us', 'specific', ''),
(1283, 1, 'title_return_refund', 'specific', ''),
(1284, 1, 'title_faq', 'specific', ''),
(1285, 1, 'title_terms_condition', 'specific', ''),
(1286, 1, 'title_support', 'specific', ''),
(1287, 1, 'title_login', 'specific', ''),
(1288, 1, 'title_about', 'specific', ''),
(1289, 1, 'text_restore_completed', 'specific', 'Restored successfully completed'),
(1290, 1, 'error_receipt_printer', 'specific', 'Receipt printer is not valid'),
(1291, 1, 'title_checkout', 'specific', 'Checkout'),
(1292, 1, 'label_credit_balance', 'specific', 'Credit Balance'),
(1293, 1, 'label_giftcard_taken', 'specific', 'Gift Card taken'),
(1294, 1, 'text_are_you_sure', 'specific', 'Are you sure?'),
(1295, 1, 'text_information', 'specific', 'Information'),
(1296, 1, 'text_store_access_success', 'specific', 'Store  successfully activated'),
(1297, 1, 'title_cart_empty', 'specific', 'Cart is empty'),
(1298, 1, 'title_payment', 'specific', 'Payment'),
(1299, 1, 'error_installment_duration', 'specific', 'Installment duration is not valid'),
(1300, 1, 'error_password_mismatch', 'specific', 'Confirm password did\'t match'),
(1301, 1, 'error_email_exist', 'specific', 'Email already exists!'),
(9493, 1, 'error_invalid_purchase_code', 'specific', 'Invalid Purchase Code'),
(9494, 1, 'label_member_since', 'specific', 'Member Since'),
(9497, 1, 'error_printer_ip_address_or_port', 'specific', 'IP address or Port'),
(9498, 1, 'error_printer_path', 'specific', 'Printer Path'),
(9499, 1, 'text_barcode_print', 'specific', 'Barcode Print'),
(9500, 1, 'label_select', 'specific', 'Select'),
(9501, 1, 'label_sold', 'specific', 'Sold'),
(9504, 1, 'error_invalid_username_password', 'specific', 'Username or Password is invalid'),
(9505, 1, 'text_order_title', 'specific', 'Order'),
(9506, 1, 'placeholder_search_here', 'specific', 'Search here...'),
(9533, 1, 'text_order', 'specific', 'Order'),
(9534, 1, 'menu_order', 'specific', 'ORDER'),
(9535, 1, 'menu_hold_order', 'specific', 'Hold Order'),
(9543, 1, 'menu_stock_transfer', 'specific', 'Stock Transfer'),
(9552, 1, 'button_gift_card', 'specific', 'Gift Card'),
(9556, 1, 'title_settings', 'specific', 'Settings'),
(9559, 1, 'placeholder_input_discount_amount', 'specific', 'Discount Amount'),
(9560, 1, 'text_sell_due_paid_success', 'specific', 'Successfully Paid'),
(9561, 1, 'button_due_invoice_list', 'specific', 'Due Invoice List'),
(9562, 1, 'button_add_balance', 'specific', 'Add Balance'),
(9563, 1, 'error_pmethod_id', 'specific', 'Payment method is not valid'),
(9564, 1, 'text_balance_added', 'specific', 'Balance successfully added'),
(9565, 1, 'button_sell_product', 'specific', 'Sell Product'),
(9566, 1, 'error_pmethod_code', 'specific', 'Payment method code is not valid'),
(9567, 1, 'invoice_sms_text', 'specific', 'SMS'),
(9568, 1, 'error_installment_duration', 'specific', 'Installment duration is not valid'),
(9569, 1, 'button_view_details', 'specific', 'View Details'),
(9570, 1, 'text_installment_details', 'specific', 'Installment Details'),
(9571, 1, 'label_initial_payment', 'specific', 'Initial Payment'),
(9572, 1, 'label_interval_count', 'specific', 'Interval Count'),
(9573, 1, 'label_installment_count', 'specific', 'Installment Count'),
(9574, 1, 'label_last_installment_date', 'specific', 'Last Installment Date'),
(9575, 1, 'label_installment_end_date', 'specific', 'Intallment End Date'),
(9576, 1, 'text_all_invoice', 'specific', 'All Invoice'),
(9577, 1, 'text_all_due', 'specific', 'All Due'),
(9578, 1, 'button_purchase', 'specific', 'Purchase 2'),
(9579, 1, 'error_login_attempt', 'specific', 'Error Login Attempt'),
(9580, 1, 'error_login_attempt_exceed', 'specific', 'Login Attempt Exceed'),
(9581, 1, 'error_login_attempts_exceeded', 'specific', 'Login attempt exceeded'),
(9582, 1, 'label_logged_in', 'specific', 'Logged In'),
(9583, 1, 'error_mobile_exist', 'specific', 'Mobile number already exist.'),
(9584, 1, 'error_login', 'specific', 'Login Error.'),
(9585, 1, 'button_product_purchase', 'specific', 'Product purchase'),
(9586, 1, 'button_add_purchase', 'specific', 'Add Purchase'),
(9587, 1, 'label_change', 'specific', 'Change'),
(9588, 1, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(9589, 1, 'error_disabled_in_demo', 'specific', 'This feature disabled in demo.'),
(9590, 1, 'button_substract_balance', 'specific', 'Substract Balance'),
(9591, 1, 'error_amount_exceed', 'specific', 'Amount is exceed.'),
(9592, 1, 'text_balance_substracted', 'specific', 'Balance successfully substracted.'),
(9593, 1, 'title_customer_transaction', 'specific', 'Customer Transaction'),
(9594, 1, 'text_customer_transaction_title', 'specific', 'Customer Transaction'),
(9595, 1, 'text_customer_transaction_list_title', 'specific', 'Customer Transaction List'),
(9596, 1, 'title_supplier_transaction', 'specific', 'Supplier Transaction'),
(9597, 1, 'text_supplier_transaction_title', 'specific', 'Supplier Transaction'),
(9598, 1, 'error_card_no', 'specific', 'Card no. is not valid'),
(9599, 1, 'error_activate_permission', 'specific', 'Activate permission is not valid.'),
(9600, 1, 'error_discount_amount_exceed', 'specific', 'Discount amount exceed'),
(9601, 1, 'error_unexpected', 'specific', 'Unexpected error.'),
(9602, 1, 'text_returns', 'specific', 'Returnsdddd'),
(9603, 1, 'label_sl', 'specific', 'Sl'),
(9604, 1, 'label_sup_id', 'specific', 'Sup Id'),
(9605, 1, 'label_delete_all', 'specific', 'Delete All'),
(9606, 1, 'label_insert_store_to', 'specific', 'Insert Store To'),
(9607, 1, 'label_insert_store_content_into', 'specific', 'Insert Content To'),
(9608, 1, 'error_store_name', 'specific', 'Store name is not valid'),
(9609, 1, 'error_email_exist', 'specific', 'Email already exist'),
(9610, 1, 'error_customer_gift_card_exist', 'specific', 'Customer giftcard already exist'),
(9611, 1, 'text_expiry', 'specific', 'Expiry'),
(9612, 1, 'label_transferred_from', 'specific', 'Transfered From'),
(9613, 1, 'text_download_samdple_format_file', 'specific', 'Download Sample Format'),
(9614, 1, 'store_code 1 is not valid!', 'specific', 'Store code is not valid'),
(9615, 1, 'text_purchase_due_paid_success', 'specific', 'Successfully Paid'),
(9616, 1, 'error_invalid_balance', 'specific', 'Invalid Balance'),
(9617, 1, 'text_opening_balance_update_success', 'specific', 'Opening balance successfully updated'),
(9618, 1, 'button_installment_payment', 'specific', 'Installment Payment'),
(9619, 1, 'text_update_installment_payment_success', 'specific', 'Installment payment successfully updated'),
(9620, 1, 'error_email_address', 'specific', 'Email address is not valid'),
(9621, 1, 'email_sent_successful', 'specific', 'Email successfully sent'),
(9622, 1, 'error_id', 'specific', 'Id is not valid'),
(9625, 1, 'store_code store2 is not valid!', 'specific', ''),
(9626, 1, 'error_xls_sheet_not_found', 'specific', ''),
(9629, 1, 'text_cronjob', 'specific', ''),
(9714, 1, 'text_delete_holding_order_success', 'specific', 'Holding order successfully deleted'),
(9715, 1, 'label_reference_format', 'specific', 'Reference Format'),
(9716, 1, 'label_sales_reference_prefix', 'specific', 'Sales Prefix'),
(9717, 1, 'text_expired_listing_title', 'specific', 'Expired Listing'),
(9718, 1, 'label_item_quantity', 'specific', 'Item Quantity'),
(9719, 1, 'error_source', 'specific', 'Source is not valid'),
(9720, 1, 'label_returned_at', 'specific', 'Returned At'),
(9721, 1, 'error_print_permission', 'specific', 'You don\'t have permission in printing.'),
(9722, 1, 'text_due_incoice', 'specific', 'Due Invoice'),
(9723, 1, 'text_loan_details', 'specific', 'Loan Details'),
(9724, 1, 'label_paid_by', 'specific', 'Paid By'),
(9729, 1, 'error_order_title', 'specific', 'Order'),
(9730, 1, 'button_conform_order', 'specific', 'Order Confirmed'),
(9731, 1, 'text_order_successfully_placed', 'specific', 'Order Successfully Placed'),
(9732, 1, 'text_order_placed', 'specific', 'Order Placed'),
(9733, 1, 'title_order_placed', 'specific', 'Order successfully placed'),
(9734, 1, 'error_address', 'specific', 'Address field is required'),
(9735, 1, 'error_current_password', 'specific', 'Current Password'),
(9736, 1, 'error_new_password', 'specific', 'New Password'),
(9737, 1, 'error_current_password_not_matched', 'specific', 'Passwords not matched!'),
(9738, 1, 'text_password_update_success', 'specific', 'Password updated successfully'),
(9739, 1, 'error_full_name', 'specific', 'Full name'),
(9740, 1, 'title_register', 'specific', 'Register'),
(9741, 1, 'error_record_not_found', 'specific', 'Recored not found!'),
(9742, 1, 'text_account_created', 'specific', 'Account created successfully'),
(9743, 1, 'text_login_success', 'specific', 'Successfully Logged in'),
(9744, 1, 'title_view_order', 'specific', 'View Order'),
(9745, 1, 'title_order', 'specific', 'Order'),
(9746, 1, 'text_new_order_title', 'specific', 'New Order'),
(9747, 1, 'text_order_list_title', 'specific', 'Order List'),
(9748, 1, 'label_shipping_and_billing_address', 'specific', 'Shipping '),
(9749, 1, 'label_order_status', 'specific', 'Order Status'),
(9750, 1, 'title_order_edit', 'specific', 'Edit Order'),
(9751, 1, 'text_order_edit_title', 'specific', 'Edit Order'),
(9752, 1, 'text_order_update_success', 'specific', 'Order successfully updated'),
(9753, 1, 'label_insert_content_into', 'specific', 'Insert Content Into'),
(9754, 1, 'label_delete_the_product', 'specific', 'Delete The Product'),
(9755, 1, 'label_soft_delete_the_product', 'specific', 'Soft Delete The Product'),
(9756, 1, 'error_phone_exist', 'specific', 'Phone number already exists'),
(9757, 1, 'title_stores', 'specific', 'Stores'),
(9758, 1, 'text_email_update_success', 'specific', 'Successfully Updated'),
(9759, 1, 'text_phone_update_success', 'specific', 'Phone number updated successfully'),
(9760, 1, 'text_phone_number_update_success', 'specific', 'Phone number updated successfully'),
(9770, 1, 'label_link', 'specific', 'Link'),
(9771, 1, 'error_unit_code', 'specific', 'Unit code is not valid'),
(9772, 1, 'error_service_can_not_be_returned', 'specific', 'Service can\'t be returned'),
(9773, 1, 'error_invalid_product_type', 'specific', 'Product type is not valid'),
(9774, 1, 'error_invalid_barcode_symbology', 'specific', 'Barcode symbology is not valid'),
(9775, 1, 'store_code store1111 is not valid!', 'specific', 'Store code is not valid'),
(9776, 1, 'error_category_slug', 'specific', 'Category slug is not valid'),
(9777, 1, 'error_invalid_category_slug', 'specific', 'Category slug is not valid'),
(9778, 1, 'error_invalid_unit_code', 'specific', 'Unit code is not valid'),
(9779, 1, 'error_invalid_taxrate_code', 'specific', 'Taxrate code is not valid'),
(9780, 1, 'error_invalid_tax_method', 'specific', 'Tax method is not valid'),
(9781, 1, 'error_invalid_supplier_code', 'specific', 'Supplier code is not valid'),
(9782, 1, 'error_invalid_brand_code', 'specific', 'Brand code is not valid'),
(9783, 1, 'error_invalid_box_code', 'specific', 'Box code is not valid'),
(9784, 1, 'error_invalid_cost_price', 'specific', 'Cost price is not valid'),
(9785, 1, 'button_sell_list', 'specific', 'Sell List'),
(9786, 1, 'text_redirecting_to_dashbaord', 'specific', ''),
(9787, 7, 'title_language_translation', 'specific', 'TRADUCCION'),
(9788, 7, 'text_english', 'specific', 'Ingles'),
(9789, 7, 'text_arabic', 'specific', 'Arabe'),
(9790, 7, 'text_bangla', 'specific', 'Bangladesh'),
(9791, 7, 'text_hindi', 'specific', 'Hindi'),
(9792, 7, 'text_french', 'specific', 'Frances'),
(9793, 7, 'text_Germany', 'specific', 'Aleman'),
(9794, 7, 'text_spanish', 'specific', 'Español'),
(9795, 7, 'text_pos', 'specific', 'pos'),
(9796, 7, 'menu_pos', 'specific', 'Pos'),
(9797, 7, 'text_cashbook_report', 'specific', 'Informe de caja'),
(9798, 7, 'menu_cashbook', 'specific', 'Libro De Pago'),
(9799, 7, 'text_invoice', 'specific', 'Factura'),
(9800, 7, 'menu_invoice', 'specific', 'Factura'),
(9801, 7, 'text_user_preference', 'specific', 'Preferencia de usuario'),
(9802, 7, 'text_settings', 'specific', 'Configuraciones'),
(9803, 7, 'text_stock_alert', 'specific', 'Alerta de stock'),
(9804, 7, 'text_itsolution24', 'specific', 'Expira'),
(9805, 7, 'text_fullscreen', 'specific', 'tusolutionweb'),
(9806, 7, 'text_reports', 'specific', 'Reportes'),
(9807, 7, 'text_lockscreen', 'specific', 'Bloquear pantalla'),
(9808, 7, 'text_logout', 'specific', 'Cerrar sesion'),
(9809, 7, 'menu_dashboard', 'specific', 'Inicio'),
(9810, 7, 'menu_point_of_sell', 'specific', 'Punto De Venta'),
(9811, 7, 'menu_sell', 'specific', 'Ventas'),
(9812, 7, 'menu_sell_list', 'specific', 'Listas Ventas'),
(9813, 7, 'menu_return_list', 'specific', 'Lista Devueltos'),
(9814, 7, 'menu_sell_log', 'specific', 'Pedidos'),
(9815, 7, 'menu_giftcard', 'specific', 'Tarjeta Regalo'),
(9816, 7, 'menu_add_giftcard', 'specific', 'Agregar Tarjeta Regalo'),
(9817, 7, 'menu_giftcard_list', 'specific', 'Lista Tarjeta Regalo'),
(9818, 7, 'menu_giftcard_topup', 'specific', 'Tarjeta De Regalo'),
(9819, 7, 'menu_quotation', 'specific', 'Cotización'),
(9820, 7, 'menu_add_quotation', 'specific', 'Agregar Cotizacion'),
(9821, 7, 'menu_quotation_list', 'specific', 'Lista De Cotizaciones'),
(9822, 7, 'menu_installment', 'specific', 'Pagos'),
(9823, 7, 'menu_installment_list', 'specific', 'Lista De Cuotas'),
(9824, 7, 'menu_payment_list', 'specific', 'Lista De Pagos'),
(9825, 7, 'menu_payment_due_today', 'specific', 'Pago Debido Hoy'),
(9826, 7, 'menu_payment_due_all', 'specific', 'Pago Debido A Todos'),
(9827, 7, 'menu_payment_due_expired', 'specific', 'Pago Por Exp.'),
(9828, 7, 'menu_overview_report', 'specific', 'Informe General'),
(9829, 7, 'menu_purchase', 'specific', 'Compra'),
(9830, 7, 'menu_add_purchase', 'specific', 'Agregar Compra'),
(9831, 7, 'menu_purchase_list', 'specific', 'Lista De Compras'),
(9832, 7, 'menu_due_invoice', 'specific', 'Factura Debida'),
(9833, 7, 'menu_purchase_logs', 'specific', 'Registros Compras'),
(9834, 7, 'menu_transfer', 'specific', 'Transferir Stock'),
(9835, 7, 'menu_add_transfer', 'specific', 'Agregar Transferencia'),
(9836, 7, 'menu_transfer_list', 'specific', 'Lista De Transferencia'),
(9837, 7, 'menu_receive_list', 'specific', 'Recibir Lista'),
(9838, 7, 'menu_product', 'specific', 'Producto'),
(9839, 7, 'menu_product_list', 'specific', 'Lista De Productos'),
(9840, 7, 'menu_add_product', 'specific', 'Agregar Producto'),
(9841, 7, 'menu_barcode_print', 'specific', 'Código De Barras'),
(9842, 7, 'menu_category', 'specific', 'Lista De Categoría'),
(9843, 7, 'menu_add_category', 'specific', 'Agregar Categoría'),
(9844, 7, 'menu_product_import', 'specific', 'Importación (.Xls)'),
(9845, 7, 'menu_stock_alert', 'specific', 'Alerta De Stock'),
(9846, 7, 'menu_customer', 'specific', 'Cliente'),
(9847, 7, 'menu_add_customer', 'specific', 'Agregar Cliente'),
(9848, 7, 'menu_customer_list', 'specific', 'Lista De Clientes'),
(9849, 7, 'menu_statements', 'specific', 'Declaraciones'),
(9850, 7, 'menu_supplier', 'specific', 'Proveedor'),
(9851, 7, 'menu_add_supplier', 'specific', 'Agregar Proveedor'),
(9852, 7, 'menu_supplier_list', 'specific', 'Lista De Proveedores'),
(9853, 7, 'menu_accounting', 'specific', 'Contabilidad'),
(9854, 7, 'menu_new_deposit', 'specific', 'Depositar'),
(9855, 7, 'menu_new_withdraw', 'specific', 'Retirar'),
(9856, 7, 'menu_list_transactions', 'specific', 'Lista Transacciones'),
(9857, 7, 'menu_new_transfer', 'specific', 'Agregar Transferencia'),
(9858, 7, 'menu_list_transfer', 'specific', 'Lista De Transferencia'),
(9859, 7, 'menu_add_bank_account', 'specific', 'Agregar Cuenta Bancaria'),
(9860, 7, 'menu_bank_accounts', 'specific', 'Lista De Cuentas Bancarias'),
(9861, 7, 'menu_income_source', 'specific', 'Fuente De Ingresos'),
(9862, 7, 'menu_balance_sheet', 'specific', 'Hoja De Balance'),
(9863, 7, 'menu_income_monthwise', 'specific', 'Ingresos Meses'),
(9864, 7, 'menu_expense_monthwise', 'specific', 'Gastos Meses'),
(9865, 7, 'menu_income_and_expense', 'specific', 'Ingresos Vs Gastos'),
(9866, 7, 'menu_profit_and_loss', 'specific', 'Ganacias Vs Perdidas'),
(9867, 7, 'menu_expenditure', 'specific', 'Gasto'),
(9868, 7, 'menu_create_expense', 'specific', 'Agregar Gastos'),
(9869, 7, 'menu_expense_list', 'specific', 'Lista De Gastos'),
(9870, 7, 'menu_summary', 'specific', 'Resumen'),
(9871, 7, 'menu_loan_manager', 'specific', 'Prestamo'),
(9872, 7, 'menu_loan_list', 'specific', 'Lista De Prestamos'),
(9873, 7, 'menu_take_loan', 'specific', 'Tomar Prestamo'),
(9874, 7, 'menu_loan_summary', 'specific', 'Resumen'),
(9875, 7, 'menu_reports', 'specific', 'Reportes'),
(9876, 7, 'menu_report_overview', 'specific', 'Informe General'),
(9877, 7, 'menu_report_collection', 'specific', 'Informe Recoleccion'),
(9878, 7, 'menu_report_due_collection', 'specific', 'Informe Recoleccion Debido'),
(9879, 7, 'menu_report_due_paid', 'specific', 'Informe Pagos Debido'),
(9880, 7, 'menu_sell_report', 'specific', 'Informe De Venta'),
(9881, 7, 'menu_purchase_report', 'specific', 'Informe De Compra'),
(9882, 7, 'menu_sell_payment_report', 'specific', 'Informe Pago De Venta'),
(9883, 7, 'menu_purchase_payment_report', 'specific', 'Informe Pago De Compra'),
(9884, 7, 'menu_tax_report', 'specific', 'Informe De Impuestos'),
(9885, 7, 'menu_purchase_tax_report', 'specific', 'Informe Impuestos Sobre Compras'),
(9886, 7, 'menu_tax_overview_report', 'specific', 'Informe General De Impuestos'),
(9887, 7, 'menu_report_stock', 'specific', 'Informe De Stock'),
(9888, 7, 'menu_analytics', 'specific', 'Analitica'),
(9889, 7, 'menu_sms', 'specific', 'Sms'),
(9890, 7, 'menu_send_sms', 'specific', 'Enviar Sms'),
(9891, 7, 'menu_sms_report', 'specific', 'Informe Sms'),
(9892, 7, 'menu_sms_setting', 'specific', 'Configuración De Sms'),
(9893, 7, 'menu_user', 'specific', 'Usuario'),
(9894, 7, 'menu_add_user', 'specific', 'Agregar Usuario'),
(9895, 7, 'menu_user_list', 'specific', 'Lista Usuario'),
(9896, 7, 'menu_add_usergroup', 'specific', 'Agregar Grupo De Usuarios'),
(9897, 7, 'menu_usergroup_list', 'specific', 'Lista Grupo De Usuarios'),
(9898, 7, 'menu_password', 'specific', 'Password'),
(9899, 7, 'menu_filemanager', 'specific', 'Archivos'),
(9900, 7, 'menu_system', 'specific', 'Configuraciones'),
(9901, 7, 'menu_store', 'specific', 'Tiendas'),
(9902, 7, 'menu_create_store', 'specific', 'Crear Tienda'),
(9903, 7, 'menu_store_list', 'specific', 'Lista Tienda'),
(9904, 7, 'menu_store_setting', 'specific', 'Ajuste De La Tienda'),
(9905, 7, 'menu_receipt_template', 'specific', 'Plantilla De Recibo'),
(9906, 7, 'menu_user_preference', 'specific', 'Preferencia De Usuario'),
(9907, 7, 'menu_brand', 'specific', 'Marca'),
(9908, 7, 'menu_add_brand', 'specific', 'Agregar Marca'),
(9909, 7, 'menu_brand_list', 'specific', 'Lista Marca'),
(9910, 7, 'menu_currency', 'specific', 'Moneda'),
(9911, 7, 'menu_pmethod', 'specific', 'Metodo De Pago'),
(9912, 7, 'menu_unit', 'specific', 'Unidad'),
(9913, 7, 'menu_taxrate', 'specific', 'Tasa De Impuesto'),
(9914, 7, 'menu_box', 'specific', 'Caja'),
(9915, 7, 'menu_printer', 'specific', 'Impresora'),
(9916, 7, 'menu_language', 'specific', 'Lenguaje'),
(9917, 7, 'menu_backup_restore', 'specific', 'Copia De Seguridad'),
(9918, 7, 'menu_data_reset', 'specific', 'Resetear Datos'),
(9919, 7, 'menu_store_change', 'specific', 'Cambio De Tienda'),
(9920, 7, 'text_language_translation_title', 'specific', 'TRADUCCION LENGUAJE'),
(9921, 7, 'text_dashboard', 'specific', 'Tableros'),
(9922, 7, 'text_translations', 'specific', 'TRADUCCION'),
(9923, 7, 'button_add_new_language', 'specific', 'AGREGAR LENGUAJE'),
(9924, 7, 'button_edit', 'specific', 'EDITAR'),
(9925, 7, 'button_delete', 'specific', 'BORRAR'),
(9926, 7, 'button_default', 'specific', 'POR DEFECTO'),
(9927, 7, 'button_dublicate_entry', 'specific', 'DUPLICAR'),
(9928, 7, 'button_empty_value', 'specific', 'VACIO'),
(9929, 7, 'label_key', 'specific', 'CLAVE'),
(9930, 7, 'label_value', 'specific', 'VALOR'),
(9931, 7, 'label_translate', 'specific', 'TRADUCIR'),
(9932, 7, 'label_delete', 'specific', 'BORRAR'),
(9933, 7, 'placeholder_search_here', 'specific', 'BUSCAR AQUI'),
(9934, 7, 'text_version', 'specific', 'VERSION'),
(9935, 7, 'button_today', 'specific', 'HOY'),
(9936, 7, 'button_last_7_days', 'specific', 'ULTIMOS 7 DIAS'),
(9937, 7, 'button_last_30_days', 'specific', 'ULTIMOS 30 DIAS'),
(9938, 7, 'button_last_365_days', 'specific', 'ULTIMO AÑO'),
(9939, 7, 'button_filter', 'specific', 'FILTRAR'),
(9940, 6, 'title_language_translation', 'specific', ''),
(9941, 6, 'text_english', 'specific', ''),
(9942, 6, 'text_arabic', 'specific', ''),
(9943, 6, 'text_bangla', 'specific', ''),
(9944, 6, 'text_hindi', 'specific', ''),
(9945, 6, 'text_french', 'specific', ''),
(9946, 6, 'text_Germany', 'specific', ''),
(9947, 6, 'text_spanish', 'specific', ''),
(9948, 6, 'text_pos', 'specific', ''),
(9949, 6, 'menu_pos', 'specific', ''),
(9950, 6, 'text_cashbook_report', 'specific', ''),
(9951, 6, 'menu_cashbook', 'specific', ''),
(9952, 6, 'text_invoice', 'specific', ''),
(9953, 6, 'menu_invoice', 'specific', ''),
(9954, 6, 'text_user_preference', 'specific', ''),
(9955, 6, 'text_settings', 'specific', ''),
(9956, 6, 'text_stock_alert', 'specific', ''),
(9957, 6, 'text_itsolution24', 'specific', ''),
(9958, 6, 'text_fullscreen', 'specific', ''),
(9959, 6, 'text_reports', 'specific', ''),
(9960, 6, 'text_lockscreen', 'specific', ''),
(9961, 6, 'text_logout', 'specific', ''),
(9962, 6, 'menu_dashboard', 'specific', ''),
(9963, 6, 'menu_point_of_sell', 'specific', ''),
(9964, 6, 'menu_sell', 'specific', ''),
(9965, 6, 'menu_sell_list', 'specific', ''),
(9966, 6, 'menu_return_list', 'specific', ''),
(9967, 6, 'menu_sell_log', 'specific', ''),
(9968, 6, 'menu_giftcard', 'specific', ''),
(9969, 6, 'menu_add_giftcard', 'specific', ''),
(9970, 6, 'menu_giftcard_list', 'specific', ''),
(9971, 6, 'menu_giftcard_topup', 'specific', ''),
(9972, 6, 'menu_quotation', 'specific', ''),
(9973, 6, 'menu_add_quotation', 'specific', ''),
(9974, 6, 'menu_quotation_list', 'specific', ''),
(9975, 6, 'menu_installment', 'specific', ''),
(9976, 6, 'menu_installment_list', 'specific', ''),
(9977, 6, 'menu_payment_list', 'specific', ''),
(9978, 6, 'menu_payment_due_today', 'specific', ''),
(9979, 6, 'menu_payment_due_all', 'specific', ''),
(9980, 6, 'menu_payment_due_expired', 'specific', ''),
(9981, 6, 'menu_overview_report', 'specific', ''),
(9982, 6, 'menu_purchase', 'specific', ''),
(9983, 6, 'menu_add_purchase', 'specific', ''),
(9984, 6, 'menu_purchase_list', 'specific', ''),
(9985, 6, 'menu_due_invoice', 'specific', ''),
(9986, 6, 'menu_purchase_logs', 'specific', ''),
(9987, 6, 'menu_transfer', 'specific', ''),
(9988, 6, 'menu_add_transfer', 'specific', ''),
(9989, 6, 'menu_transfer_list', 'specific', ''),
(9990, 6, 'menu_receive_list', 'specific', ''),
(9991, 6, 'menu_product', 'specific', ''),
(9992, 6, 'menu_product_list', 'specific', ''),
(9993, 6, 'menu_add_product', 'specific', ''),
(9994, 6, 'menu_barcode_print', 'specific', ''),
(9995, 6, 'menu_category', 'specific', ''),
(9996, 6, 'menu_add_category', 'specific', ''),
(9997, 6, 'menu_product_import', 'specific', ''),
(9998, 6, 'menu_stock_alert', 'specific', ''),
(9999, 6, 'menu_customer', 'specific', ''),
(10000, 6, 'menu_add_customer', 'specific', ''),
(10001, 6, 'menu_customer_list', 'specific', ''),
(10002, 6, 'menu_statements', 'specific', ''),
(10003, 6, 'menu_supplier', 'specific', ''),
(10004, 6, 'menu_add_supplier', 'specific', ''),
(10005, 6, 'menu_supplier_list', 'specific', ''),
(10006, 6, 'menu_accounting', 'specific', ''),
(10007, 6, 'menu_new_deposit', 'specific', ''),
(10008, 6, 'menu_new_withdraw', 'specific', ''),
(10009, 6, 'menu_list_transactions', 'specific', ''),
(10010, 6, 'menu_new_transfer', 'specific', ''),
(10011, 6, 'menu_list_transfer', 'specific', ''),
(10012, 6, 'menu_add_bank_account', 'specific', ''),
(10013, 6, 'menu_bank_accounts', 'specific', ''),
(10014, 6, 'menu_income_source', 'specific', ''),
(10015, 6, 'menu_balance_sheet', 'specific', ''),
(10016, 6, 'menu_income_monthwise', 'specific', ''),
(10017, 6, 'menu_expense_monthwise', 'specific', ''),
(10018, 6, 'menu_income_and_expense', 'specific', ''),
(10019, 6, 'menu_profit_and_loss', 'specific', ''),
(10020, 6, 'menu_expenditure', 'specific', ''),
(10021, 6, 'menu_create_expense', 'specific', ''),
(10022, 6, 'menu_expense_list', 'specific', ''),
(10023, 6, 'menu_summary', 'specific', ''),
(10024, 6, 'menu_loan_manager', 'specific', ''),
(10025, 6, 'menu_loan_list', 'specific', ''),
(10026, 6, 'menu_take_loan', 'specific', ''),
(10027, 6, 'menu_loan_summary', 'specific', ''),
(10028, 6, 'menu_reports', 'specific', ''),
(10029, 6, 'menu_report_overview', 'specific', ''),
(10030, 6, 'menu_report_collection', 'specific', ''),
(10031, 6, 'menu_report_due_collection', 'specific', ''),
(10032, 6, 'menu_report_due_paid', 'specific', ''),
(10033, 6, 'menu_sell_report', 'specific', ''),
(10034, 6, 'menu_purchase_report', 'specific', ''),
(10035, 6, 'menu_sell_payment_report', 'specific', ''),
(10036, 6, 'menu_purchase_payment_report', 'specific', ''),
(10037, 6, 'menu_tax_report', 'specific', ''),
(10038, 6, 'menu_purchase_tax_report', 'specific', ''),
(10039, 6, 'menu_tax_overview_report', 'specific', ''),
(10040, 6, 'menu_report_stock', 'specific', ''),
(10041, 6, 'menu_analytics', 'specific', ''),
(10042, 6, 'menu_sms', 'specific', ''),
(10043, 6, 'menu_send_sms', 'specific', ''),
(10044, 6, 'menu_sms_report', 'specific', ''),
(10045, 6, 'menu_sms_setting', 'specific', ''),
(10046, 6, 'menu_user', 'specific', ''),
(10047, 6, 'menu_add_user', 'specific', ''),
(10048, 6, 'menu_user_list', 'specific', ''),
(10049, 6, 'menu_add_usergroup', 'specific', ''),
(10050, 6, 'menu_usergroup_list', 'specific', ''),
(10051, 6, 'menu_password', 'specific', ''),
(10052, 6, 'menu_filemanager', 'specific', ''),
(10053, 6, 'menu_system', 'specific', ''),
(10054, 6, 'menu_store', 'specific', ''),
(10055, 6, 'menu_create_store', 'specific', ''),
(10056, 6, 'menu_store_list', 'specific', ''),
(10057, 6, 'menu_store_setting', 'specific', ''),
(10058, 6, 'menu_receipt_template', 'specific', '');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(10059, 6, 'menu_user_preference', 'specific', ''),
(10060, 6, 'menu_brand', 'specific', ''),
(10061, 6, 'menu_add_brand', 'specific', ''),
(10062, 6, 'menu_brand_list', 'specific', ''),
(10063, 6, 'menu_currency', 'specific', ''),
(10064, 6, 'menu_pmethod', 'specific', ''),
(10065, 6, 'menu_unit', 'specific', ''),
(10066, 6, 'menu_taxrate', 'specific', ''),
(10067, 6, 'menu_box', 'specific', ''),
(10068, 6, 'menu_printer', 'specific', ''),
(10069, 6, 'menu_language', 'specific', ''),
(10070, 6, 'menu_backup_restore', 'specific', ''),
(10071, 6, 'menu_data_reset', 'specific', ''),
(10072, 6, 'menu_store_change', 'specific', ''),
(10073, 6, 'text_language_translation_title', 'specific', ''),
(10074, 6, 'text_dashboard', 'specific', ''),
(10075, 6, 'text_translations', 'specific', ''),
(10076, 6, 'button_add_new_language', 'specific', ''),
(10077, 6, 'button_edit', 'specific', ''),
(10078, 6, 'button_delete', 'specific', ''),
(10079, 6, 'button_default', 'specific', ''),
(10080, 6, 'button_dublicate_entry', 'specific', ''),
(10081, 6, 'button_empty_value', 'specific', ''),
(10082, 6, 'label_key', 'specific', ''),
(10083, 6, 'label_value', 'specific', ''),
(10084, 6, 'label_translate', 'specific', ''),
(10085, 6, 'label_delete', 'specific', ''),
(10086, 6, 'placeholder_search_here', 'specific', ''),
(10087, 6, 'text_version', 'specific', ''),
(10088, 6, 'button_today', 'specific', ''),
(10089, 6, 'button_last_7_days', 'specific', ''),
(10090, 6, 'button_last_30_days', 'specific', ''),
(10091, 6, 'button_last_365_days', 'specific', ''),
(10092, 6, 'button_filter', 'specific', ''),
(10093, 7, 'button_translate', 'specific', 'TRADUCIR'),
(10094, 7, 'title_dashboard', 'specific', 'TABLEROS'),
(10095, 7, 'button_pos', 'specific', 'POS'),
(10096, 7, 'button_sell_list', 'specific', 'LISTA VENTAS'),
(10097, 7, 'button_overview_report', 'specific', 'REPORTES GENERAL'),
(10098, 7, 'button_sell_report', 'specific', 'REPORTE VENTAS'),
(10099, 7, 'button_purchase_report', 'specific', 'REPORTE COMPRA'),
(10100, 7, 'button_stock_alert', 'specific', 'REPORTE ALERTA STOCK'),
(10101, 7, 'button_expired_alert', 'specific', 'REPORTE ALERTA EXPERADOS'),
(10102, 7, 'button_backup_restore', 'specific', 'RESTAURAR BACKUP'),
(10103, 7, 'button_stores', 'specific', 'TIENDAS'),
(10104, 7, 'text_total_invoice', 'specific', 'FACTURA TOTAL'),
(10105, 7, 'text_total_invoice_today', 'specific', 'FACTURA TOTAL HOY'),
(10106, 7, 'text_details', 'specific', 'DETALLES'),
(10107, 7, 'text_total_customer', 'specific', 'CLIENTE'),
(10108, 7, 'text_total_customer_today', 'specific', 'CLIENTE HOY'),
(10109, 7, 'text_total_supplier', 'specific', 'TOTAL PROVEEDORES'),
(10110, 7, 'text_total_supplier_today', 'specific', 'TOTAL PROVEEDORES HOY'),
(10111, 7, 'text_total_product', 'specific', 'TOTAL PRODUCTOS'),
(10112, 7, 'text_total_product_today', 'specific', 'TOTAL PRODUCTOS HOY'),
(10113, 7, 'text_recent_activities', 'specific', 'ACTIVIDADES RECIENTES'),
(10114, 7, 'text_sales', 'specific', 'VENTAS'),
(10115, 7, 'text_quotations', 'specific', 'CITAS'),
(10116, 7, 'text_purchases', 'specific', 'Compras'),
(10117, 7, 'text_transfers', 'specific', 'TRANSFERENCIAS'),
(10118, 7, 'text_customers', 'specific', 'CLIENTES'),
(10119, 7, 'text_suppliers', 'specific', 'PROVEEDORES'),
(10120, 7, 'label_invoice_id', 'specific', 'ID FACTURA'),
(10121, 7, 'label_created_at', 'specific', 'CREADO EL'),
(10122, 7, 'label_customer_name', 'specific', 'NOMBRE CLIENTE'),
(10123, 7, 'label_amount', 'specific', 'CANTIDAD'),
(10124, 7, 'label_payment_status', 'specific', 'ESTADO PAGO'),
(10125, 7, 'button_add_sales', 'specific', 'AGREGAR VENTAS'),
(10126, 7, 'button_list_sales', 'specific', 'LISTA VENTAS'),
(10127, 7, 'text_sales_amount', 'specific', 'CANTIDAD VENTA'),
(10128, 7, 'text_discount_given', 'specific', 'DESCUENTO'),
(10129, 7, 'text_due_given', 'specific', 'DEBIDO'),
(10130, 7, 'text_received_amount', 'specific', 'CANTIDAD RECIBIDA'),
(10131, 7, 'label_date', 'specific', 'FECHA'),
(10132, 7, 'label_reference_no', 'specific', 'NRO REFERENCIA'),
(10133, 7, 'label_customer', 'specific', 'CLIENTE'),
(10134, 7, 'label_status', 'specific', 'ESTADO'),
(10135, 7, 'button_add_quotations', 'specific', 'AGREGAR COTIZACION'),
(10136, 7, 'button_list_quotations', 'specific', 'LISTA COTIZACION'),
(10137, 7, 'label_supplier_name', 'specific', 'NOMBRE PROVEEDOR'),
(10138, 7, 'button_add_purchases', 'specific', 'AGREGAR COMPRAS'),
(10139, 7, 'button_list_purchases', 'specific', 'LISTA COMPRAS'),
(10140, 7, 'label_from', 'specific', 'DE'),
(10141, 7, 'label_to', 'specific', 'A'),
(10142, 7, 'label_quantity', 'specific', 'CANTIDAD'),
(10143, 7, 'button_add_transfers', 'specific', 'AGREGAR TRANSFERENCIA'),
(10144, 7, 'button_list_transfers', 'specific', 'LISTA TRANSFERENCIA'),
(10145, 7, 'label_phone', 'specific', 'CELULAR'),
(10146, 7, 'label_email', 'specific', 'EMAIL'),
(10147, 7, 'label_address', 'specific', 'Direccion'),
(10148, 7, 'button_add_customer', 'specific', 'CLIENTE'),
(10149, 7, 'button_list_customers', 'specific', 'CLIENTES'),
(10150, 7, 'button_add_supplier', 'specific', 'PROVEEDOR'),
(10151, 7, 'button_list_suppliers', 'specific', 'PROVEEDORES'),
(10152, 7, 'text_deposit_today', 'specific', 'DEPOSITADO HOY'),
(10153, 7, 'text_withdraw_today', 'specific', 'RETIRAR HOY'),
(10154, 7, 'text_recent_deposit', 'specific', 'DEPOSITO RECIENTE'),
(10155, 7, 'label_description', 'specific', 'DESCRIPCION'),
(10156, 7, 'button_view_all', 'specific', 'VER TODO'),
(10157, 7, 'text_recent_withdraw', 'specific', 'RETIRO RECIENTE'),
(10158, 7, 'title_income_vs_expense', 'specific', 'INGRESO VS GASTO'),
(10159, 7, 'text_download_as_jpg', 'specific', 'DESCARGAR IMAGEN'),
(10160, 7, 'label_day', 'specific', 'DIA'),
(10161, 7, 'text_income', 'specific', 'INGRESOS'),
(10162, 7, 'text_expense', 'specific', 'GASTOS'),
(10163, 7, 'text_income_vs_expense', 'specific', 'INGRESO VS GASTO'),
(10164, 2, 'title_dashboard', 'specific', ''),
(10165, 2, 'text_english', 'specific', ''),
(10166, 2, 'text_arabic', 'specific', ''),
(10167, 2, 'text_bangla', 'specific', ''),
(10168, 2, 'text_hindi', 'specific', ''),
(10169, 2, 'text_french', 'specific', ''),
(10170, 2, 'text_Germany', 'specific', ''),
(10171, 2, 'text_spanish', 'specific', ''),
(10172, 2, 'text_pos', 'specific', ''),
(10173, 2, 'menu_pos', 'specific', ''),
(10174, 2, 'text_cashbook_report', 'specific', ''),
(10175, 2, 'menu_cashbook', 'specific', ''),
(10176, 2, 'text_invoice', 'specific', ''),
(10177, 2, 'menu_invoice', 'specific', ''),
(10178, 2, 'text_user_preference', 'specific', ''),
(10179, 2, 'text_settings', 'specific', ''),
(10180, 2, 'text_stock_alert', 'specific', ''),
(10181, 2, 'text_itsolution24', 'specific', ''),
(10182, 2, 'text_fullscreen', 'specific', ''),
(10183, 2, 'text_reports', 'specific', ''),
(10184, 2, 'text_lockscreen', 'specific', ''),
(10185, 2, 'text_logout', 'specific', ''),
(10186, 2, 'menu_dashboard', 'specific', ''),
(10187, 2, 'menu_point_of_sell', 'specific', ''),
(10188, 2, 'menu_sell', 'specific', ''),
(10189, 2, 'menu_sell_list', 'specific', ''),
(10190, 2, 'menu_return_list', 'specific', ''),
(10191, 2, 'menu_sell_log', 'specific', ''),
(10192, 2, 'menu_giftcard', 'specific', ''),
(10193, 2, 'menu_add_giftcard', 'specific', ''),
(10194, 2, 'menu_giftcard_list', 'specific', ''),
(10195, 2, 'menu_giftcard_topup', 'specific', ''),
(10196, 2, 'menu_quotation', 'specific', ''),
(10197, 2, 'menu_add_quotation', 'specific', ''),
(10198, 2, 'menu_quotation_list', 'specific', ''),
(10199, 2, 'menu_installment', 'specific', ''),
(10200, 2, 'menu_installment_list', 'specific', ''),
(10201, 2, 'menu_payment_list', 'specific', ''),
(10202, 2, 'menu_payment_due_today', 'specific', ''),
(10203, 2, 'menu_payment_due_all', 'specific', ''),
(10204, 2, 'menu_payment_due_expired', 'specific', ''),
(10205, 2, 'menu_overview_report', 'specific', ''),
(10206, 2, 'menu_purchase', 'specific', ''),
(10207, 2, 'menu_add_purchase', 'specific', ''),
(10208, 2, 'menu_purchase_list', 'specific', ''),
(10209, 2, 'menu_due_invoice', 'specific', ''),
(10210, 2, 'menu_purchase_logs', 'specific', ''),
(10211, 2, 'menu_transfer', 'specific', ''),
(10212, 2, 'menu_add_transfer', 'specific', ''),
(10213, 2, 'menu_transfer_list', 'specific', ''),
(10214, 2, 'menu_receive_list', 'specific', ''),
(10215, 2, 'menu_product', 'specific', ''),
(10216, 2, 'menu_product_list', 'specific', ''),
(10217, 2, 'menu_add_product', 'specific', ''),
(10218, 2, 'menu_barcode_print', 'specific', ''),
(10219, 2, 'menu_category', 'specific', ''),
(10220, 2, 'menu_add_category', 'specific', ''),
(10221, 2, 'menu_product_import', 'specific', ''),
(10222, 2, 'menu_stock_alert', 'specific', ''),
(10223, 2, 'menu_customer', 'specific', ''),
(10224, 2, 'menu_add_customer', 'specific', ''),
(10225, 2, 'menu_customer_list', 'specific', ''),
(10226, 2, 'menu_statements', 'specific', ''),
(10227, 2, 'menu_supplier', 'specific', ''),
(10228, 2, 'menu_add_supplier', 'specific', ''),
(10229, 2, 'menu_supplier_list', 'specific', ''),
(10230, 2, 'menu_accounting', 'specific', ''),
(10231, 2, 'menu_new_deposit', 'specific', ''),
(10232, 2, 'menu_new_withdraw', 'specific', ''),
(10233, 2, 'menu_list_transactions', 'specific', ''),
(10234, 2, 'menu_new_transfer', 'specific', ''),
(10235, 2, 'menu_list_transfer', 'specific', ''),
(10236, 2, 'menu_add_bank_account', 'specific', ''),
(10237, 2, 'menu_bank_accounts', 'specific', ''),
(10238, 2, 'menu_income_source', 'specific', ''),
(10239, 2, 'menu_balance_sheet', 'specific', ''),
(10240, 2, 'menu_income_monthwise', 'specific', ''),
(10241, 2, 'menu_expense_monthwise', 'specific', ''),
(10242, 2, 'menu_income_and_expense', 'specific', ''),
(10243, 2, 'menu_profit_and_loss', 'specific', ''),
(10244, 2, 'menu_expenditure', 'specific', ''),
(10245, 2, 'menu_create_expense', 'specific', ''),
(10246, 2, 'menu_expense_list', 'specific', ''),
(10247, 2, 'menu_summary', 'specific', ''),
(10248, 2, 'menu_loan_manager', 'specific', ''),
(10249, 2, 'menu_loan_list', 'specific', ''),
(10250, 2, 'menu_take_loan', 'specific', ''),
(10251, 2, 'menu_loan_summary', 'specific', ''),
(10252, 2, 'menu_reports', 'specific', ''),
(10253, 2, 'menu_report_overview', 'specific', ''),
(10254, 2, 'menu_report_collection', 'specific', ''),
(10255, 2, 'menu_report_due_collection', 'specific', ''),
(10256, 2, 'menu_report_due_paid', 'specific', ''),
(10257, 2, 'menu_sell_report', 'specific', ''),
(10258, 2, 'menu_purchase_report', 'specific', ''),
(10259, 2, 'menu_sell_payment_report', 'specific', ''),
(10260, 2, 'menu_purchase_payment_report', 'specific', ''),
(10261, 2, 'menu_tax_report', 'specific', ''),
(10262, 2, 'menu_purchase_tax_report', 'specific', ''),
(10263, 2, 'menu_tax_overview_report', 'specific', ''),
(10264, 2, 'menu_report_stock', 'specific', ''),
(10265, 2, 'menu_analytics', 'specific', ''),
(10266, 2, 'menu_sms', 'specific', ''),
(10267, 2, 'menu_send_sms', 'specific', ''),
(10268, 2, 'menu_sms_report', 'specific', ''),
(10269, 2, 'menu_sms_setting', 'specific', ''),
(10270, 2, 'menu_user', 'specific', ''),
(10271, 2, 'menu_add_user', 'specific', ''),
(10272, 2, 'menu_user_list', 'specific', ''),
(10273, 2, 'menu_add_usergroup', 'specific', ''),
(10274, 2, 'menu_usergroup_list', 'specific', ''),
(10275, 2, 'menu_password', 'specific', ''),
(10276, 2, 'menu_filemanager', 'specific', ''),
(10277, 2, 'menu_system', 'specific', ''),
(10278, 2, 'menu_store', 'specific', ''),
(10279, 2, 'menu_create_store', 'specific', ''),
(10280, 2, 'menu_store_list', 'specific', ''),
(10281, 2, 'menu_store_setting', 'specific', ''),
(10282, 2, 'menu_receipt_template', 'specific', ''),
(10283, 2, 'menu_user_preference', 'specific', ''),
(10284, 2, 'menu_brand', 'specific', ''),
(10285, 2, 'menu_add_brand', 'specific', ''),
(10286, 2, 'menu_brand_list', 'specific', ''),
(10287, 2, 'menu_currency', 'specific', ''),
(10288, 2, 'menu_pmethod', 'specific', ''),
(10289, 2, 'menu_unit', 'specific', ''),
(10290, 2, 'menu_taxrate', 'specific', ''),
(10291, 2, 'menu_box', 'specific', ''),
(10292, 2, 'menu_printer', 'specific', ''),
(10293, 2, 'menu_language', 'specific', ''),
(10294, 2, 'menu_backup_restore', 'specific', ''),
(10295, 2, 'menu_data_reset', 'specific', ''),
(10296, 2, 'menu_store_change', 'specific', ''),
(10297, 2, 'text_dashboard', 'specific', ''),
(10298, 2, 'button_pos', 'specific', ''),
(10299, 2, 'button_sell_list', 'specific', ''),
(10300, 2, 'button_overview_report', 'specific', ''),
(10301, 2, 'button_sell_report', 'specific', ''),
(10302, 2, 'button_purchase_report', 'specific', ''),
(10303, 2, 'button_stock_alert', 'specific', ''),
(10304, 2, 'button_expired_alert', 'specific', ''),
(10305, 2, 'button_backup_restore', 'specific', ''),
(10306, 2, 'button_stores', 'specific', ''),
(10307, 2, 'text_total_invoice', 'specific', ''),
(10308, 2, 'text_total_invoice_today', 'specific', ''),
(10309, 2, 'text_details', 'specific', ''),
(10310, 2, 'text_total_customer', 'specific', ''),
(10311, 2, 'text_total_customer_today', 'specific', ''),
(10312, 2, 'text_total_supplier', 'specific', ''),
(10313, 2, 'text_total_supplier_today', 'specific', ''),
(10314, 2, 'text_total_product', 'specific', ''),
(10315, 2, 'text_total_product_today', 'specific', ''),
(10316, 2, 'text_recent_activities', 'specific', ''),
(10317, 2, 'text_sales', 'specific', ''),
(10318, 2, 'text_quotations', 'specific', ''),
(10319, 2, 'text_purchases', 'specific', ''),
(10320, 2, 'text_transfers', 'specific', ''),
(10321, 2, 'text_customers', 'specific', ''),
(10322, 2, 'text_suppliers', 'specific', ''),
(10323, 2, 'label_invoice_id', 'specific', ''),
(10324, 2, 'label_created_at', 'specific', ''),
(10325, 2, 'label_customer_name', 'specific', ''),
(10326, 2, 'label_amount', 'specific', ''),
(10327, 2, 'label_payment_status', 'specific', ''),
(10328, 2, 'button_add_sales', 'specific', ''),
(10329, 2, 'button_list_sales', 'specific', ''),
(10330, 2, 'text_sales_amount', 'specific', ''),
(10331, 2, 'text_discount_given', 'specific', ''),
(10332, 2, 'text_due_given', 'specific', ''),
(10333, 2, 'text_received_amount', 'specific', ''),
(10334, 2, 'label_date', 'specific', ''),
(10335, 2, 'label_reference_no', 'specific', ''),
(10336, 2, 'label_customer', 'specific', ''),
(10337, 2, 'label_status', 'specific', ''),
(10338, 2, 'button_add_quotations', 'specific', ''),
(10339, 2, 'button_list_quotations', 'specific', ''),
(10340, 2, 'label_supplier_name', 'specific', ''),
(10341, 2, 'button_add_purchases', 'specific', ''),
(10342, 2, 'button_list_purchases', 'specific', ''),
(10343, 2, 'label_from', 'specific', ''),
(10344, 2, 'label_to', 'specific', ''),
(10345, 2, 'label_quantity', 'specific', ''),
(10346, 2, 'button_add_transfers', 'specific', ''),
(10347, 2, 'button_list_transfers', 'specific', ''),
(10348, 2, 'label_phone', 'specific', ''),
(10349, 2, 'label_email', 'specific', ''),
(10350, 2, 'label_address', 'specific', ''),
(10351, 2, 'button_add_customer', 'specific', ''),
(10352, 2, 'button_list_customers', 'specific', ''),
(10353, 2, 'button_add_supplier', 'specific', ''),
(10354, 2, 'button_list_suppliers', 'specific', ''),
(10355, 2, 'text_deposit_today', 'specific', ''),
(10356, 2, 'text_withdraw_today', 'specific', ''),
(10357, 2, 'text_recent_deposit', 'specific', ''),
(10358, 2, 'label_description', 'specific', ''),
(10359, 2, 'button_view_all', 'specific', ''),
(10360, 2, 'text_recent_withdraw', 'specific', ''),
(10361, 2, 'title_income_vs_expense', 'specific', ''),
(10362, 2, 'text_download_as_jpg', 'specific', ''),
(10363, 2, 'label_day', 'specific', ''),
(10364, 2, 'text_income', 'specific', ''),
(10365, 2, 'text_expense', 'specific', ''),
(10366, 2, 'text_income_vs_expense', 'specific', ''),
(10367, 2, 'placeholder_search_here', 'specific', ''),
(10368, 2, 'text_version', 'specific', ''),
(10369, 2, 'button_today', 'specific', ''),
(10370, 2, 'button_last_7_days', 'specific', ''),
(10371, 2, 'button_last_30_days', 'specific', ''),
(10372, 2, 'button_last_365_days', 'specific', ''),
(10373, 2, 'button_filter', 'specific', ''),
(10374, 7, 'text_translation_success', 'specific', 'TRADUCCION EXITOSA'),
(10375, 7, 'title_pos', 'specific', 'POS'),
(10376, 7, 'text_gift_card', 'specific', 'TARJETA DE REGALO'),
(10377, 7, 'button_sell_gift_card', 'specific', 'VENTA TARJETA DE REGALO'),
(10378, 7, 'text_keyboard_shortcut', 'specific', 'ATAJOS TECLADO'),
(10379, 7, 'text_holding_order', 'specific', 'ORDEN DE ESPERA'),
(10380, 7, 'text_search_product', 'specific', 'BUSCAR PRODUCTO'),
(10381, 7, 'text_view_all', 'specific', 'VER TODOS'),
(10382, 7, 'button_add_product', 'specific', 'AGREGAR PRODUCTO'),
(10383, 7, 'button_add_purchase', 'specific', 'AGREGAR  COMPRA'),
(10384, 7, 'label_add_to_cart', 'specific', 'AGREGAR AL'),
(10385, 7, 'text_add_note', 'specific', 'AGREGAR NOTA'),
(10386, 7, 'label_due', 'specific', 'DEBIDO'),
(10387, 7, 'label_product', 'specific', 'PRODUCTO'),
(10388, 7, 'label_price', 'specific', 'PRECIO'),
(10389, 7, 'label_subtotal', 'specific', 'SUB TOTAL'),
(10390, 7, 'label_total_items', 'specific', 'TOTAL ARTICULOS'),
(10391, 7, 'label_total', 'specific', 'TOTAL'),
(10392, 7, 'label_discount', 'specific', 'DESCUENTO'),
(10393, 7, 'label_tax_amount', 'specific', 'MONTO IMPUESTO'),
(10394, 7, 'label_shipping_charge', 'specific', 'COSTO ENVIO'),
(10395, 7, 'label_others_charge', 'specific', 'OTROS COBROS'),
(10396, 7, 'label_total_payable', 'specific', 'TOTAL PAGO'),
(10397, 7, 'button_pay', 'specific', 'PAGA'),
(10398, 7, 'button_hold', 'specific', 'PEDIDOS'),
(10399, 7, 'text_general', 'specific', 'GENERAL'),
(10400, 7, 'text_images', 'specific', 'IMAGENES'),
(10401, 7, 'label_serial_no', 'specific', 'NRO SERIAL'),
(10402, 7, 'label_image', 'specific', 'IMAGEN'),
(10403, 7, 'label_url', 'specific', 'URL'),
(10404, 7, 'label_sort_order', 'specific', 'ORDEN DE CLASIFICACION'),
(10405, 7, 'label_action', 'specific', 'ACCION'),
(10406, 7, 'label_thumbnail', 'specific', 'MINIATURA'),
(10407, 7, 'label_product_type', 'specific', 'TIPO PRODUCTO'),
(10408, 7, 'text_standard', 'specific', 'STANDARD'),
(10409, 7, 'text_service', 'specific', 'SERVICIO'),
(10410, 7, 'label_name', 'specific', 'NOMBRE'),
(10411, 7, 'text_product', 'specific', 'PRODUCTO'),
(10412, 7, 'label_pcode', 'specific', 'CODIGO'),
(10413, 7, 'label_category', 'specific', 'CATEGORIA'),
(10414, 7, 'text_select', 'specific', 'SELECCIONAR'),
(10415, 7, 'label_supplier', 'specific', 'PROVEEDOR'),
(10416, 7, 'label_brand', 'specific', 'MARCA'),
(10417, 7, 'label_barcode_symbology', 'specific', 'CODIGO DE BARRA'),
(10418, 7, 'label_box', 'specific', 'CAJA'),
(10419, 7, 'label_expired_date', 'specific', 'FECHA EXPIRA'),
(10420, 7, 'label_unit', 'specific', 'UNIDAD'),
(10421, 7, 'label_product_cost', 'specific', 'COSTO PRODUCTO'),
(10422, 7, 'label_product_price', 'specific', 'PRECIO PRODUCTO'),
(10423, 7, 'label_product_tax', 'specific', 'IMPUESTO PRODUCTO'),
(10424, 7, 'label_tax_method', 'specific', 'METODO DE IMPUESTOS'),
(10425, 7, 'text_inclusive', 'specific', 'INCLUSIVO'),
(10426, 7, 'text_exclusive', 'specific', 'EXCLUSIVO'),
(10427, 7, 'label_store', 'specific', 'TIENDAS'),
(10428, 7, 'search', 'specific', 'BUSCAR'),
(10429, 7, 'label_alert_quantity', 'specific', 'CANTIDAD DE ALERTA'),
(10430, 7, 'text_active', 'specific', 'ACTIVO'),
(10431, 7, 'text_inactive', 'specific', 'INACTIVO'),
(10432, 7, 'button_save', 'specific', 'GUARDAR'),
(10433, 7, 'button_reset', 'specific', 'RESETEAR'),
(10434, 7, 'title_purchase', 'specific', 'COMPRA'),
(10435, 7, 'text_purchase_title', 'specific', 'COMPRAS'),
(10436, 7, 'text_add', 'specific', 'AGREGAR'),
(10437, 7, 'text_new_purchase_title', 'specific', 'NUEVA COMPRA'),
(10438, 7, 'label_note', 'specific', 'NOTA'),
(10439, 7, 'text_received', 'specific', 'RECIBIDA'),
(10440, 7, 'text_pending', 'specific', 'PENDIENTE'),
(10441, 7, 'text_ordered', 'specific', 'ORDENADA'),
(10442, 7, 'label_attachment', 'specific', 'ARCHIVO ADJUNTO'),
(10443, 7, 'label_add_product', 'specific', 'AGREGAR PRODUCTO'),
(10444, 7, 'placeholder_search_product', 'specific', 'BUSCAR PRODUCTO'),
(10445, 7, 'label_available', 'specific', 'DISPONIBLE'),
(10446, 7, 'label_cost', 'specific', 'COSTO'),
(10447, 7, 'label_sell_price', 'specific', 'PRECIO VENTA'),
(10448, 7, 'label_item_tax', 'specific', 'IMPUESTO ARTICULO'),
(10449, 7, 'label_item_total', 'specific', 'TOTAL ARTICULO'),
(10450, 7, 'label_order_tax', 'specific', 'ORDEN IMPUESTO'),
(10451, 7, 'label_discount_amount', 'specific', 'IMPORTE DESCUENTO'),
(10452, 7, 'label_payable_amount', 'specific', 'IMPORTE A PAGAR'),
(10453, 7, 'label_payment_method', 'specific', 'METODO DE PAGO'),
(10454, 7, 'label_paid_amount', 'specific', 'MONTO DE PAGO'),
(10455, 7, 'label_due_amount', 'specific', 'CANTIDAD DEBIDA'),
(10456, 7, 'label_change_amount', 'specific', 'CAMBIAR CANTIDAD'),
(10457, 7, 'button_submit', 'specific', 'ENVIAR'),
(10458, 7, 'text_purchase_list_title', 'specific', 'LISTA DE COMPRAS'),
(10459, 7, 'button_today_invoice', 'specific', 'FACTURA HOY'),
(10460, 7, 'button_all_invoice', 'specific', 'TODAS LAS FACTURAS'),
(10461, 7, 'button_due_invoice', 'specific', 'FACTURA DEBIDA'),
(10462, 7, 'button_all_due_invoice', 'specific', 'TODAS LAS FACTURAS DEBIDAS'),
(10463, 7, 'button_paid_invoice', 'specific', 'FACTURA PAGADA'),
(10464, 7, 'button_inactive_invoice', 'specific', 'FACTURA INACTIVA'),
(10465, 7, 'label_datetime', 'specific', 'FECHA Y HORA'),
(10466, 7, 'label_creator', 'specific', 'CREADOR'),
(10467, 7, 'label_invoice_paid', 'specific', 'FACTURA PAGADA'),
(10468, 7, 'label_pay', 'specific', 'PAGO'),
(10469, 7, 'label_return', 'specific', 'RETORNO'),
(10470, 7, 'label_view', 'specific', 'VER'),
(10471, 7, 'label_edit', 'specific', 'EDITAR'),
(10472, 7, 'label_credit_balance', 'specific', 'BALANCE CREDITO'),
(10473, 7, 'label_date_of_birth', 'specific', 'Fecha Nacimiento'),
(10474, 7, 'label_sex', 'specific', 'SEXO'),
(10475, 7, 'label_male', 'specific', 'MASCULINO'),
(10476, 7, 'label_female', 'specific', 'FEMENINO'),
(10477, 7, 'label_others', 'specific', 'OTROS'),
(10478, 7, 'label_age', 'specific', 'EDAD'),
(10479, 7, 'label_city', 'specific', 'CIUDAD'),
(10480, 7, 'label_state', 'specific', 'DEPARTAMENTO'),
(10481, 7, 'label_country', 'specific', 'PAIS'),
(10482, 7, 'text_redirecting_to_dashbaord', 'specific', 'REDIRIGIENDO A DASHBOARD'),
(10483, 7, 'title_product', 'specific', 'PRODUCTO'),
(10484, 7, 'text_products', 'specific', 'PRODUCTOS'),
(10485, 7, 'text_add_new', 'specific', 'AGREGAR NUEVO'),
(10486, 7, 'label_all_product', 'specific', 'TODOS LOS PRODUCTOS'),
(10487, 7, 'button_trash', 'specific', 'BASURA'),
(10488, 7, 'button_bulk', 'specific', 'ABULTAR'),
(10489, 7, 'button_delete_all', 'specific', 'ELIMINAR TODOS'),
(10490, 7, 'label_stock', 'specific', 'STOCK'),
(10491, 7, 'label_purchase_price', 'specific', 'PRECIO COMPRA'),
(10492, 7, 'label_selling_price', 'specific', 'PRECIO VENTA'),
(10493, 7, 'label_purchase', 'specific', 'COMPRA'),
(10494, 7, 'label_print_barcode', 'specific', 'IMPRIMIR CODIGO DE BARRA'),
(10495, 7, 'text_select_store', 'specific', 'SELECCIONE TIENDA'),
(10496, 7, 'title_user_preference', 'specific', 'PREFERENCIA DE USUARIO'),
(10497, 7, 'text_user_preference_title', 'specific', 'PREFERENCIA DE USUARIO'),
(10498, 7, 'text_language_preference_title', 'specific', 'PREFERENCIA DE IDIOMA'),
(10499, 7, 'label_select_language', 'specific', 'SELECCIONAR LENGUAJE'),
(10500, 7, 'text_color_preference_title', 'specific', 'PREFERENCIA COLOR'),
(10501, 7, 'label_base_color', 'specific', 'COLOR BASE'),
(10502, 7, 'text_color_black', 'specific', 'COLOR NEGRO'),
(10503, 7, 'text_color_blue', 'specific', 'COLOR AZUL'),
(10504, 7, 'text_color_green', 'specific', 'COLOR VERDE'),
(10505, 7, 'text_color_red', 'specific', 'COLOR ROJO'),
(10506, 7, 'text_color_yellow', 'specific', 'COLOR AMARILLO'),
(10507, 7, 'text_pos_side_panel_position_title', 'specific', 'POSICION SILDER POS'),
(10508, 7, 'label_pos_side_panel_position', 'specific', 'POSICION SILDER POS'),
(10509, 7, 'text_right', 'specific', 'DERECHA'),
(10510, 7, 'text_left', 'specific', 'IZQUIERDA'),
(10511, 7, 'text_pos_pattern_title', 'specific', 'PATRON POS'),
(10512, 7, 'label_select_pos_pattern', 'specific', 'SELECCIONE PATRON POS'),
(10513, 7, 'button_update', 'specific', 'ACTUALIZAR'),
(10514, 7, 'text_product_created', 'specific', 'CREADA'),
(10515, 7, 'button_view', 'specific', 'VER'),
(10516, 7, 'button_purchase_product', 'specific', 'COMPRA PRODUCTO'),
(10517, 7, 'button_barcode', 'specific', 'CODIGO DE BARRA'),
(10518, 7, 'label_card_no', 'specific', 'NRO TARJETA'),
(10519, 7, 'label_giftcard_value', 'specific', 'VALOR DE TARJETA DE REGALO'),
(10520, 7, 'label_balance', 'specific', 'BALANCE'),
(10521, 7, 'label_expiry_date', 'specific', 'FECHA EXPIRA'),
(10522, 7, 'button_create_giftcard', 'specific', 'CREAR TARJETA REGALO'),
(10523, 7, 'title_stock_alert', 'specific', 'ALERTA STOCK'),
(10524, 7, 'text_stock_alert_title', 'specific', 'ALERTA STOCK'),
(10525, 7, 'text_stock_alert_box_title', 'specific', 'CUADRO DE ALERTA STOCK'),
(10526, 7, 'label_id', 'specific', 'ID'),
(10527, 7, 'label_mobile', 'specific', 'CELULAR'),
(10528, 7, 'error_sell_price_must_be_greated_that_purchase_price', 'specific', 'EL PRECIO DE VENTA DEBE SER MAYOR QUE EL DE COMPRA'),
(10529, 7, 'text_success', 'specific', 'Creado con éxito'),
(10530, 7, 'text_paid', 'specific', 'Pagada'),
(10531, 7, 'button_return', 'specific', 'RETORNAR'),
(10532, 7, 'button_view_receipt', 'specific', 'VER RECIBO'),
(10533, 7, 'text_order_title', 'specific', 'PEDIDO'),
(10534, 7, 'text_order_details', 'specific', 'DETALLES ORDEN'),
(10535, 7, 'text_pmethod', 'specific', 'METODO'),
(10536, 7, 'button_full_payment', 'specific', 'PAGO COMPLETO'),
(10537, 7, 'button_full_due', 'specific', 'DEBIDO COMPLETO'),
(10538, 7, 'button_sell_with_installment', 'specific', 'VENDER PLAZOS'),
(10539, 7, 'text_pay_amount', 'specific', 'MONTO PAGO'),
(10540, 7, 'placeholder_input_an_amount', 'specific', 'INGRESE CANTIDAD'),
(10541, 7, 'placeholder_note_here', 'specific', 'NOTA AQUI'),
(10542, 7, 'title_installment_details', 'specific', 'DETALLES INSTALACION'),
(10543, 7, 'label_duration', 'specific', 'DURACION'),
(10544, 7, 'text_days', 'specific', 'DIAS'),
(10545, 7, 'label_interval', 'specific', 'INTERVALO'),
(10546, 7, 'label_total_installment', 'specific', 'TOTAL DIAS'),
(10547, 7, 'label_interest_percentage', 'specific', 'PORCENTAJE INTERES'),
(10548, 7, 'label_interest_amount', 'specific', 'MONTO INTERES'),
(10549, 7, 'label_previous_due', 'specific', 'DEBIDO ANTERIOR'),
(10550, 7, 'error_walking_customer_can_not_craete_due', 'specific', 'CLIENTE NORMAL NO PUEDE CREAR DEBIDO'),
(10551, 7, 'text_invoice_create_success', 'specific', 'FACTURA CREAR EXITO'),
(10552, 7, 'text_update_title', 'specific', 'EDITAR'),
(10553, 7, 'text_product_updated', 'specific', 'PRODUCTO ACTUALIZADO'),
(10554, 7, 'title_settings', 'specific', 'AJUSTES'),
(10555, 7, 'title_store', 'specific', 'TIENDAS'),
(10556, 7, 'text_pos_setting', 'specific', 'AJUSTES POS '),
(10557, 7, 'text_email_setting', 'specific', 'AJUSTE EMAIL'),
(10558, 7, 'text_ftp_setting', 'specific', 'CONFIGURACION FTP'),
(10559, 7, 'text_cronjob', 'specific', ''),
(10560, 7, 'label_deposit_account', 'specific', 'CUENTA DEPOSITO'),
(10561, 7, 'label_code_name', 'specific', 'NOMBRE CODIGO'),
(10562, 7, 'label_zip_code', 'specific', 'CODIGO POSTAL'),
(10563, 7, 'label_gst_reg_no', 'specific', 'REG NRO GST'),
(10564, 7, 'label_vat_reg_no', 'specific', 'REG NRO VAY'),
(10565, 7, 'label_cashier_name', 'specific', 'NOMBRE CAJERO'),
(10566, 7, 'label_timezone', 'specific', 'ZONA HORARIA'),
(10567, 7, 'label_invoice_edit_lifespan', 'specific', 'EDICION FACTURA'),
(10568, 7, 'hint_invoice_edit_lifespan', 'specific', 'VIDA UTIL EDICION FACTURA'),
(10569, 7, 'text_minute', 'specific', 'MINUTO'),
(10570, 7, 'text_second', 'specific', 'SEGUNDO'),
(10571, 7, 'label_invoice_delete_lifespan', 'specific', 'ELIMINAR FACTURA'),
(10572, 7, 'hint_invoice_delete_lifespan', 'specific', 'ELIMINAR  FACTURA'),
(10573, 7, 'label_tax', 'specific', 'IMPUESTO'),
(10574, 7, 'hint_tax', 'specific', 'IMPUESTO'),
(10575, 7, 'label_sms_gateway', 'specific', 'SMS GATEWAY'),
(10576, 7, 'hint_sms_gateway', 'specific', 'GATEWAY'),
(10577, 7, 'label_sms_alert', 'specific', 'SMS ALERTA'),
(10578, 7, 'hint_sms_alert', 'specific', 'SMS ALERTA'),
(10579, 7, 'text_yes', 'specific', 'SI'),
(10580, 7, 'text_no', 'specific', 'NO'),
(10581, 7, 'label_auto_sms', 'specific', 'AUTO SMS '),
(10582, 7, 'text_sms_after_creating_invoice', 'specific', 'SMS DESPUES DE CREAR FACTURA'),
(10583, 7, 'label_expiration_system', 'specific', 'SISTEMA DE CADUCIDAD'),
(10584, 7, 'label_datatable_item_limit', 'specific', 'LIMITE DE ELEMENTO DE TABLA DE DATOS'),
(10585, 7, 'hint_datatable_item_limit', 'specific', 'LIMITE DE ELEMENTO DE TABLA DE DATOS'),
(10586, 7, 'label_reference_format', 'specific', 'FORMATO # FACTURA'),
(10587, 7, 'label_sales_reference_prefix', 'specific', 'PREFIJO FACTURA'),
(10588, 7, 'label_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(10589, 7, 'label_pos_printing', 'specific', 'IMPRIMIR POS'),
(10590, 7, 'label_receipt_printer', 'specific', 'RECIBO IMPRESORA'),
(10591, 7, 'label_auto_print_receipt', 'specific', 'AUTO RECIBO IMPRESORA'),
(10592, 7, 'label_invoice_view', 'specific', 'VER FACTURA'),
(10593, 7, 'hint_invoice_view', 'specific', 'VER FACTURA'),
(10594, 7, 'text_tax_invoice', 'specific', 'IMPUESTO FACTURA'),
(10595, 7, 'text_indian_gst', 'specific', 'INDIA'),
(10596, 7, 'label_change_item_price_while_billing', 'specific', 'CAMBIAR PRECIO ARTICULO FACTURACION'),
(10597, 7, 'hint_change_item_price_while_billing', 'specific', 'CAMBIAR EL PRECIO DEL ARTICULO DURANTE FACTURACION'),
(10598, 7, 'label_pos_product_display_limit', 'specific', 'LIMITE VISUALIZACION PRUDUCTO POS'),
(10599, 7, 'hint_pos_product_display_limit', 'specific', 'LIMITE VISUALIZACION PRUDUCTO POS'),
(10600, 7, 'label_after_sell_page', 'specific', 'DESPUES DE LA PAGINA DE VENTA'),
(10601, 7, 'hint_after_sell_page', 'specific', 'ANTES DE LA PAGINA DE VENTA'),
(10602, 7, 'label_invoice_footer_text', 'specific', 'TEXTO DEL PIE DE PAGINA DE FACTURA'),
(10603, 7, 'hint_invoice_footer_text', 'specific', 'TEXTO DEL PIE DE PAGINA DE FACTURA'),
(10604, 7, 'label_sound_effect', 'specific', 'EFECTO SONIDO'),
(10605, 7, 'label_email_from', 'specific', 'EMAIL DE'),
(10606, 7, 'hint_email_from', 'specific', 'EMAIL DE'),
(10607, 7, 'label_email_address', 'specific', 'DIRECCION EMAIL'),
(10608, 7, 'hint_email_address', 'specific', 'DIRECCION EMAIL'),
(10609, 7, 'label_email_driver', 'specific', 'DRIVER EMAIL'),
(10610, 7, 'hint_email_driver', 'specific', 'DRIVER EMAIL'),
(10611, 7, 'label_send_mail_path', 'specific', 'ENVIAR RUTA CORREO'),
(10612, 7, 'hint_send_mail_path', 'specific', 'ENVIAR RUTA CORREO'),
(10613, 7, 'label_smtp_host', 'specific', 'HOST SMTP'),
(10614, 7, 'hint_smtp_host', 'specific', 'HOST SMTP'),
(10615, 7, 'label_smtp_username', 'specific', 'USUARIO SMTP'),
(10616, 7, 'hint_smtp_username', 'specific', 'USUARIO SMTP'),
(10617, 7, 'label_smtp_password', 'specific', 'PASSWORD SMTP'),
(10618, 7, 'hint_smtp_password', 'specific', 'PASSWORD SMTP'),
(10619, 7, 'label_smtp_port', 'specific', 'PUERTO SMTP'),
(10620, 7, 'hint_smtp_port', 'specific', 'PUERTO SMTP'),
(10621, 7, 'label_ssl_tls', 'specific', 'SSL TLS'),
(10622, 7, 'hint_ssl_tls', 'specific', 'SSL TLS'),
(10623, 7, 'label_ftp_hostname', 'specific', 'NOMRE HOST FTP'),
(10624, 7, 'label_ftp_username', 'specific', 'USUARIO FTP'),
(10625, 7, 'label_ftp_password', 'specific', 'PASSWORD FTP'),
(10626, 7, 'button_back', 'specific', 'ATRAS'),
(10627, 7, 'text_logo', 'specific', 'LOGO'),
(10628, 7, 'button_upload', 'specific', 'SUBIR'),
(10629, 7, 'text_favicon', 'specific', 'ICONO'),
(10630, 7, 'title_invoice', 'specific', 'FACTURA'),
(10631, 7, 'text_sell_list_title', 'specific', 'LISTA VENTAS'),
(10632, 7, 'text_invoices', 'specific', 'FACTURAS'),
(10633, 7, 'title_cashbook', 'specific', 'LIBRO DE PAGO'),
(10634, 7, 'text_cashbook_title', 'specific', 'LIBRO DE PAGO'),
(10635, 7, 'text_cashbook_details_title', 'specific', 'DETALLES  LIBRO DE PAGO'),
(10636, 7, 'text_print', 'specific', 'IMPRIMIR'),
(10637, 7, 'label_opening_balance', 'specific', 'SALDO APERTURA'),
(10638, 7, 'title_income', 'specific', 'INGRESOS'),
(10639, 7, 'label_title', 'specific', 'TITULO'),
(10640, 7, 'title_expense', 'specific', 'GASTOS'),
(10641, 7, 'button_details', 'specific', 'DETALLES'),
(10642, 7, 'label_today_income', 'specific', 'INGRESO HOY'),
(10643, 7, 'label_total_income', 'specific', 'INGRESOS TOTALES'),
(10644, 7, 'label_today_expense', 'specific', 'GATOS HOY'),
(10645, 7, 'label_cash_in_hand', 'specific', 'DINERO EFECTIVO'),
(10646, 7, 'label_today_closing_balance', 'specific', 'SALDO FINAL HOY'),
(10647, 7, 'text_opening_balance_update_success', 'specific', 'ACTUALIZACION DE SALDO INICIAL EXITOSA'),
(10648, 7, 'title_pmethod', 'specific', 'METODO PAGO'),
(10649, 7, 'text_pmethod_title', 'specific', 'METODOS DE PAGO'),
(10650, 7, 'text_new_pmethod_title', 'specific', 'NUEVO METODO DE PAGO'),
(10651, 7, 'label_details', 'specific', 'DETALLES'),
(10652, 7, 'text_in_active', 'specific', 'INACTIVO'),
(10653, 7, 'text_pmethod_list_title', 'specific', 'LISTA METODO PAGO'),
(10654, 7, 'title_unit', 'specific', 'UNIDAD'),
(10655, 7, 'text_unit_title', 'specific', 'UNIDAD'),
(10656, 7, 'text_new_unit_title', 'specific', 'NUEVA UNIDAD'),
(10657, 7, 'label_unit_name', 'specific', 'NOMBRE UNIDAD'),
(10658, 7, 'label_unit_details', 'specific', 'DETALLES UNIDAD'),
(10659, 7, 'text_unit_list_title', 'specific', 'LISTA UNIDAD'),
(10660, 7, 'title_filemanager', 'specific', 'ADMINISTRADOR ARCHIVOS'),
(10661, 7, 'label_product_name', 'specific', 'NOMBRE PRODUCTO'),
(10662, 7, 'title_bank_account_sheet', 'specific', 'HOJA CUENTA BANCARIA'),
(10663, 7, 'text_bank_account_sheet_title', 'specific', 'HOJA CUENTA BANCARIA'),
(10664, 7, 'text_bank_account_title', 'specific', 'CUENTAS BANCARIAS'),
(10665, 7, 'text_bank_account_sheet_list_title', 'specific', 'LISTA  HOJA CUENTA BANCARIA'),
(10666, 7, 'label_account_id', 'specific', 'ID CUENTA'),
(10667, 7, 'label_account_name', 'specific', 'NOMBRE CUENTA'),
(10668, 7, 'label_credit', 'specific', 'CREDITO'),
(10669, 7, 'label_debit', 'specific', 'DEBIDO'),
(10670, 7, 'label_transfer_to_other', 'specific', 'TRANSFERIR A OTRO'),
(10671, 7, 'label_transfer_from_other', 'specific', 'TRANSFERIR DE OTRO'),
(10672, 7, 'label_deposit', 'specific', 'DEPOSITAR'),
(10673, 7, 'label_withdraw', 'specific', 'RETIRAR'),
(10674, 7, 'text_due', 'specific', 'DEBIDA'),
(10675, 7, 'title_purchase_return', 'specific', 'DEVOLUCION DE COMPRA'),
(10676, 7, 'text_purchase_return_title', 'specific', 'DEVOLUCION DE COMPRA'),
(10677, 7, 'text_return_list_title', 'specific', 'LISTA DEVOLUCIONES'),
(10678, 7, 'text_purchase_return_list_title', 'specific', 'LISTA DEVOLUCIONES COMPRA'),
(10679, 7, 'title_purchase_log', 'specific', 'REGISTROS COMPRAS'),
(10680, 7, 'text_purchase_log_title', 'specific', 'REGISTROS COMPRAS'),
(10681, 7, 'text_purchase_log_list_title', 'specific', 'LISTA REGISTROS COMPRA'),
(10682, 7, 'label_type', 'specific', 'TIPO'),
(10683, 7, 'label_pmethod', 'specific', 'METODO PAGO'),
(10684, 7, 'label_created_by', 'specific', 'CREADO POR'),
(10685, 7, 'title_quotation', 'specific', 'COTIZACION'),
(10686, 7, 'text_quotation_title', 'specific', 'COTIZACIONES'),
(10687, 7, 'text_new_quotation_title', 'specific', 'NUEVA COTIZACION'),
(10688, 7, 'text_sent', 'specific', 'EXPEDIDA'),
(10689, 7, 'text_complete', 'specific', 'COMPLETAR'),
(10690, 7, 'text_all_suppliers', 'specific', 'PROVEEDORES'),
(10691, 7, 'text_quotation_list_title', 'specific', 'LISTA COTIZACIONES'),
(10692, 7, 'button_all', 'specific', 'TODOS'),
(10693, 7, 'button_sent', 'specific', 'EXPEDIDO'),
(10694, 7, 'button_pending', 'specific', 'PENDIENTE'),
(10695, 7, 'button_complete', 'specific', 'COMPLETO'),
(10696, 7, 'label_biller', 'specific', 'FACTURADOR'),
(10697, 7, 'title_sell_log', 'specific', 'REGISTROS VENTA'),
(10698, 7, 'text_sell_log_title', 'specific', 'REGISTRO VENTAS'),
(10699, 7, 'text_sell_title', 'specific', 'VENDER'),
(10700, 7, 'text_sell_log_list_title', 'specific', 'LISTA REGISTRO VENTAS'),
(10701, 7, 'title_giftcard_topup', 'specific', 'RECARGAR TARJETA REGALO'),
(10702, 7, 'text_giftcard_topup_title', 'specific', 'RECARGAR TARJETA REGALO'),
(10703, 7, 'text_giftcard_title', 'specific', 'TARJETA REGALO'),
(10704, 7, 'text_topup_title', 'specific', 'RECARGAS'),
(10705, 7, 'text_giftcard_topup_list_title', 'specific', 'LISTA RECARGAS'),
(10706, 7, 'error_order_title', 'specific', 'PEDIDOS'),
(10707, 7, 'title_sell_return', 'specific', 'VENTAS DEVUELTAS'),
(10708, 7, 'text_sell_return_title', 'specific', 'VENTAS DEVUELTAS'),
(10709, 7, 'text_sell_return_list_title', 'specific', 'LISTA VENTAS DEVUELTAS'),
(10710, 7, 'label_ref_invoice_Id', 'specific', 'ID FACTURA REFERENCIA'),
(10711, 7, 'label_pmethod_name', 'specific', 'NOMBRE METODO PAGO'),
(10712, 7, 'title_barcode', 'specific', 'CODIGO BARRAS'),
(10713, 7, 'text_barcode_title', 'specific', 'CODIGO BARRAS'),
(10714, 7, 'text_barcode_generate_title', 'specific', 'GENERAR CODIGO BARRAS'),
(10715, 7, 'label_product_name_with_code', 'specific', 'NOMBRE PRODUCTO CON CODIGO'),
(10716, 7, 'label_page_layout', 'specific', 'DISEÑO PAGINA'),
(10717, 7, 'label_fields', 'specific', 'CAMPOS'),
(10718, 7, 'button_generate', 'specific', 'GENERAR'),
(10719, 7, 'text_category_title', 'specific', 'CATEGORIA'),
(10720, 7, 'text_new_category_title', 'specific', 'NUEVA CATEGORIA'),
(10721, 7, 'label_category_name', 'specific', 'NOMBRE CATEGORIA'),
(10722, 7, 'label_category_slug', 'specific', 'SLUG CATEGORIA'),
(10723, 7, 'label_parent', 'specific', 'PARENTESCO'),
(10724, 7, 'label_category_details', 'specific', 'DETALLES CATEGORIA'),
(10725, 7, 'text_category_list_title', 'specific', 'LISTA CATEGORIAS'),
(10726, 7, 'label_total_item', 'specific', 'TOTAL ARTICULOS'),
(10727, 7, 'title_import_product', 'specific', 'PRODUCTO IMPORTADO'),
(10728, 7, 'text_import_title', 'specific', 'IMPORTAR PRODUCTOS'),
(10729, 7, 'text_download_sample_format_file', 'specific', 'DESCARGAR ARCHIVO FORMATO MUESTRA'),
(10730, 7, 'button_download', 'specific', 'DESCARGAR'),
(10731, 7, 'text_select_xls_file', 'specific', 'SELECCIONA ARCHIVO XLS '),
(10732, 7, 'button_import', 'specific', 'IMPORTAR'),
(10733, 7, 'title_create_store', 'specific', 'CREAR TIENDA'),
(10734, 7, 'text_create_store_title', 'specific', 'CREAR TIENDA'),
(10735, 7, 'text_stores', 'specific', 'TIENDAS'),
(10736, 7, 'text_currency', 'specific', 'MONEDA'),
(10737, 7, 'text_payment_method', 'specific', 'METODO PAGO'),
(10738, 7, 'text_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(10739, 7, 'text_printer', 'specific', 'IMPRESORA'),
(10740, 7, 'label_stock_alert_quantity', 'specific', 'ALERTA CANTIDAD STOCK'),
(10741, 7, 'hint_stock_alert_quantity', 'specific', 'ALERTA CANTIDAD STOCK'),
(10742, 7, 'text_store_title', 'specific', 'TIENDA'),
(10743, 7, 'text_store_list_title', 'specific', 'LISTA TIENDA'),
(10744, 7, 'button_activated', 'specific', 'ACTIVADA'),
(10745, 7, 'title_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(10746, 7, 'text_receipt_tempalte_title', 'specific', 'PLANTILLA RECIBOS'),
(10747, 7, 'title_pos_setting', 'specific', 'AJUSTES POS'),
(10748, 7, 'text_receipt_tempalte_sub_title', 'specific', 'SUBTITULO PLANTILLA RECIBOS'),
(10749, 7, 'button_preview', 'specific', 'VISTA PREVIA'),
(10750, 7, 'text_tempalte_content_title', 'specific', 'PLANTILLA CONTENIDO'),
(10751, 7, 'text_tempalte_css_title', 'specific', 'PLANTILLA  CSS'),
(10752, 7, 'text_template_tags', 'specific', 'PLANTILLA  ETIQUETAS'),
(10753, 7, 'text_brand_list_title', 'specific', 'LISTA MARCAS'),
(10754, 7, 'text_brand_title', 'specific', 'MARCAS'),
(10755, 7, 'text_new_brand_title', 'specific', 'NUEVA MARCAS'),
(10756, 7, 'label_total_product', 'specific', 'TOTAL PRODUCTO'),
(10757, 7, 'button_view_profile', 'specific', 'VER PERFIL'),
(10758, 7, 'title_currency', 'specific', 'MONEDA'),
(10759, 7, 'text_currency_title', 'specific', 'MONEDA'),
(10760, 7, 'text_new_currency_title', 'specific', 'NUEVA MONEDA'),
(10761, 7, 'label_code', 'specific', 'CODIGO'),
(10762, 7, 'hint_code', 'specific', 'CODIGO'),
(10763, 7, 'label_symbol_left', 'specific', 'SIMBOLO IZQUIERDO'),
(10764, 7, 'hint_symbol_left', 'specific', 'SIMBOLO IZQUIERDO'),
(10765, 7, 'label_symbol_right', 'specific', 'SIMBOLO DERECHO'),
(10766, 7, 'hint_symbol_right', 'specific', 'SIMBOLO DERECHO'),
(10767, 7, 'label_decimal_place', 'specific', 'TOTAL DECIMALES'),
(10768, 7, 'hint_decimal_place', 'specific', 'TOTAL DECIMALES'),
(10769, 7, 'text_currency_list_title', 'specific', 'LISTA MONEDAS'),
(10770, 7, 'text_enabled', 'specific', 'HABILITADA'),
(10771, 7, 'button_activate', 'specific', 'ACTIVAR'),
(10772, 7, 'title_taxrate', 'specific', 'TASA IMPUESTO'),
(10773, 7, 'text_taxrate_title', 'specific', 'TASA IMPUESTOS'),
(10774, 7, 'text_new_taxrate_title', 'specific', 'NUEVO TASA IMPUESTOS'),
(10775, 7, 'label_taxrate_name', 'specific', 'NOMBRE TASA IMPUESTO'),
(10776, 7, 'label_taxrate', 'specific', 'TASA IMPUESTO'),
(10777, 7, 'text_taxrate_list_title', 'specific', 'LISTA TASA IMPUESTO'),
(10778, 7, 'title_box', 'specific', 'CAJA'),
(10779, 7, 'text_box_title', 'specific', 'CAJA'),
(10780, 7, 'label_box_name', 'specific', 'NOMBRE CAJA'),
(10781, 7, 'label_box_details', 'specific', 'DETALLES CAJA'),
(10782, 7, 'text_box_list_title', 'specific', 'LISTA CAJAS'),
(10783, 7, 'title_printer', 'specific', 'IMPRESORA'),
(10784, 7, 'text_printer_title', 'specific', 'IMPRESORAS'),
(10785, 7, 'text_new_printer_title', 'specific', 'NUEVA IMPRESORA'),
(10786, 7, 'label_char_per_line', 'specific', 'CHAR POR LINEA'),
(10787, 7, 'label_path', 'specific', 'DIRECCION'),
(10788, 7, 'label_ip_address', 'specific', 'DIRECCION IP'),
(10789, 7, 'label_port', 'specific', 'PUERTO'),
(10790, 7, 'text_printer_list_title', 'specific', 'LISTA IMPRESORAS'),
(10791, 7, 'title_user', 'specific', 'USUARIO'),
(10792, 7, 'text_user_title', 'specific', 'USUARIOS'),
(10793, 7, 'text_new_user_title', 'specific', 'NUEVO USUARIO'),
(10794, 7, 'label_password', 'specific', 'PASSWORD'),
(10795, 7, 'label_password_retype', 'specific', 'REPETIR PASSWORD'),
(10796, 7, 'label_group', 'specific', 'GRUPO'),
(10797, 7, 'hint_group', 'specific', 'GRUPO'),
(10798, 7, 'text_user_list_title', 'specific', 'LISTA USUARIO'),
(10799, 7, 'label_profile', 'specific', 'PERFIL'),
(10800, 7, 'title_user_group', 'specific', 'GRUPO USUARIO'),
(10801, 7, 'text_group_title', 'specific', 'GRUPO'),
(10802, 7, 'text_new_group_title', 'specific', 'NUEVO GRUPO'),
(10803, 7, 'label_slug', 'specific', 'Codigo'),
(10804, 7, 'text_group_list_title', 'specific', 'LISTA GRUPO'),
(10805, 7, 'label_total_user', 'specific', 'TOTAL USUARIO'),
(10806, 7, 'title_password', 'specific', 'PASSWORD'),
(10807, 7, 'text_password_title', 'specific', 'PASSWORD'),
(10808, 7, 'text_password_box_title', 'specific', 'PASSWORD CAJA'),
(10809, 7, 'label_password_user', 'specific', 'USUARIO PASSWORD '),
(10810, 7, 'label_password_new', 'specific', 'NUEVO PASSWORD'),
(10811, 7, 'label_password_confirm', 'specific', 'CONFIRMAR PASSWORD'),
(10812, 7, 'title_send_sms', 'specific', 'ENVIAR SMS'),
(10813, 7, 'text_sms_title', 'specific', 'SMS'),
(10814, 7, 'text_send_sms', 'specific', 'ENVIAR SMS'),
(10815, 7, 'text_send_sms_title', 'specific', 'ENVIAR SMS'),
(10816, 7, 'text_single', 'specific', 'INDIVIDUAL'),
(10817, 7, 'text_group', 'specific', 'GRUPO'),
(10818, 7, 'label_phone_number', 'specific', 'NUMERO CELULAR'),
(10819, 7, 'label_message', 'specific', 'MENSAJE'),
(10820, 7, 'button_send', 'specific', 'ENVIAR'),
(10821, 7, 'label_people_type', 'specific', 'TIPO PERSONA'),
(10822, 7, 'text_all_customer', 'specific', 'TODOS LOS CLIENTES'),
(10823, 7, 'text_all_user', 'specific', 'TODOS LOS USUARIOS'),
(10824, 7, 'label_people', 'specific', 'PERSONA'),
(10825, 7, 'title_sms_report', 'specific', 'INFORME SMS'),
(10826, 7, 'text_sms_report_title', 'specific', 'REPORTE SMS'),
(10827, 7, 'text_sms_history_title', 'specific', 'HISTORIA SMS'),
(10828, 7, 'text_all', 'specific', 'TODOS'),
(10829, 7, 'button_delivered', 'specific', 'ENTREGADO'),
(10830, 7, 'button_failed', 'specific', 'HA FALLADO'),
(10831, 7, 'label_schedule_at', 'specific', 'FECHA Y HORA'),
(10832, 7, 'label_campaign_name', 'specific', 'NOMBRE CAMPAÑA'),
(10833, 7, 'label_people_name', 'specific', 'NOMBRE PERSONA'),
(10834, 7, 'label_mobile_number', 'specific', 'NUMERO CELULAR'),
(10835, 7, 'label_process_status', 'specific', 'ESTADO PROCESO'),
(10836, 7, 'label_response_text', 'specific', 'TEXTO RESPUESTA'),
(10837, 7, 'label_delivered', 'specific', 'ENTREGADA'),
(10838, 7, 'label_resend', 'specific', 'REENVIAR'),
(10839, 7, 'title_sms_setting', 'specific', 'AJUSTES SMS'),
(10840, 7, 'text_sms_setting_title', 'specific', 'AJUSTES SMS'),
(10841, 7, 'text_sms_setting', 'specific', 'AJUSTES SMS'),
(10842, 7, 'text_clickatell', 'specific', 'clickatell'),
(10843, 7, 'text_twilio', 'specific', 'twilio'),
(10844, 7, 'text_msg91', 'specific', 'msg91'),
(10845, 7, 'text_mimsms', 'specific', 'mimsms'),
(10846, 7, 'text_onnorokomsms', 'specific', 'onnorokomsms'),
(10847, 7, 'label_username', 'specific', 'USUARIO'),
(10848, 7, 'label_api_key', 'specific', 'API KEY'),
(10849, 7, 'label_sender_id', 'specific', 'ID REMITENTE'),
(10850, 7, 'label_auth_key', 'specific', 'CLAVE AUTENTIFICACION'),
(10851, 7, 'label_contact', 'specific', 'CONTACTO'),
(10852, 7, 'label_country_code', 'specific', 'CODIGO PAIS'),
(10853, 7, 'label_api_token', 'specific', 'API TOKEN'),
(10854, 7, 'label_maskname', 'specific', 'NOMBRE MASCARA'),
(10855, 7, 'label_optional', 'specific', 'OPCIONAL'),
(10856, 7, 'label_campaignname', 'specific', 'NOMBRE CAMPAÑA'),
(10857, 7, 'title_analytics', 'specific', 'ANALITICA'),
(10858, 7, 'text_analytics_title', 'specific', 'ANALITICA'),
(10859, 7, 'text_top_products', 'specific', 'MEJORES PRODUCTOS'),
(10860, 7, 'text_top_customers', 'specific', 'MEJORES CLIENTES'),
(10861, 7, 'text_top_suppliers', 'specific', 'MEJORES PROVEEDORES'),
(10862, 7, 'text_top_brands', 'specific', 'MEJORES MARCAS'),
(10863, 7, 'title_customer_analytics', 'specific', 'CLIENTE ANALITICA'),
(10864, 7, 'text_birthday_today', 'specific', 'CUMPLEAÑOS HOY'),
(10865, 7, 'text_birthday_coming', 'specific', 'FIESTA CUMPLEAÑOS'),
(10866, 7, 'label_member_since', 'specific', 'MIEMBRO DESDE'),
(10867, 7, 'text_not_found', 'specific', 'NO ENCONTRADO'),
(10868, 7, 'text_best_customer', 'specific', 'MEJOR CLIENTE'),
(10869, 7, 'text_purchase', 'specific', 'COMPRA'),
(10870, 7, 'title_login_logs', 'specific', 'REGISTROS LOGIN'),
(10871, 7, 'label_ip', 'specific', 'IP'),
(10872, 7, 'label_logged_in', 'specific', 'CONECTADO'),
(10873, 7, 'title_overview', 'specific', 'VISION GENERAL'),
(10874, 7, 'text_overview_title', 'specific', 'VISION GENERAL'),
(10875, 7, 'text_sell_overview', 'specific', 'RESUMEN VENTAS'),
(10876, 7, 'text_purchase_overview', 'specific', 'RESUMEN COMPRAS'),
(10877, 7, 'text_title_sells_overview', 'specific', 'RESUMEN VENTAS'),
(10878, 7, 'text_invoice_amount', 'specific', 'IMPORTE FACTURA'),
(10879, 7, 'text_discount_amount', 'specific', 'IMPORTE DESCUENTO'),
(10880, 7, 'text_due_collection', 'specific', 'DEBIDO COBRO'),
(10881, 7, 'text_shipping_charge', 'specific', 'COSTO ENVIO'),
(10882, 7, 'text_others_charge', 'specific', 'OTROS COBROS'),
(10883, 7, 'text_order_tax', 'specific', 'IMPUESTO ORDEN'),
(10884, 7, 'text_item_tax', 'specific', 'IMPUESTO ORDEN'),
(10885, 7, 'text_total_tax', 'specific', 'TOTAL IMPUESTO '),
(10886, 7, 'text_title_purchase_overview', 'specific', 'RESUMEN COMPRA'),
(10887, 7, 'text_purchase_amount', 'specific', 'MONTO COMPRA'),
(10888, 7, 'text_due_taken', 'specific', 'DEBIDO'),
(10889, 7, 'text_due_paid', 'specific', 'DEBIDO PAGADO'),
(10890, 7, 'text_total_paid', 'specific', 'TOTAL PAGADO'),
(10891, 7, 'text_return_amount', 'specific', 'IMPORTE DEVOLUCION'),
(10892, 7, 'title_collection_report', 'specific', 'INFORME RECOLECCION'),
(10893, 7, 'text_collection_report_title', 'specific', 'INFORME RECOLECCION'),
(10894, 7, 'text_collection_report', 'specific', 'INFORME RECOLECCION'),
(10895, 7, 'label_total_inv', 'specific', 'TOTAL INV'),
(10896, 7, 'label_net_amount', 'specific', 'IMPORTE NETO'),
(10897, 7, 'label_prev_due_collection', 'specific', 'DEBIDO COLECCION PREVIO'),
(10898, 7, 'label_due_collection', 'specific', 'DEBIDO COLECCION '),
(10899, 7, 'label_due_given', 'specific', 'DEBIDO DADO'),
(10900, 7, 'label_received', 'specific', 'RECIBIDA'),
(10901, 7, 'title_due_collection', 'specific', 'DEBIDO COLECCION'),
(10902, 7, 'text_due_collection_title', 'specific', 'DEBIDO COLECCION'),
(10903, 7, 'text_due_collection_sub_title', 'specific', 'DEBIDO COLECCION'),
(10904, 7, 'title_supplier_due_paid', 'specific', 'DEUDAS PAGADA PROVEEDOR'),
(10905, 7, 'text_supplier_due_paid_title', 'specific', 'DEUDAS PAGADA PROVEEDOR'),
(10906, 7, 'text_supplier_due_paid_sub_title', 'specific', 'DEUDAS PAGADA PROVEEDOR'),
(10907, 7, 'title_sell_report', 'specific', 'INFORME VENTA'),
(10908, 7, 'text_selling_report_title', 'specific', 'INFORME VENTA'),
(10909, 7, 'text_selling_report_sub_title', 'specific', 'INFORME VENTAS'),
(10910, 7, 'button_itemwise', 'specific', 'ARTICULO '),
(10911, 7, 'button_categorywise', 'specific', 'CATEGORIA'),
(10912, 7, 'button_supplierwise', 'specific', 'PROVEEDOR'),
(10913, 7, 'title_loan', 'specific', 'PRESTAMO'),
(10914, 7, 'text_loan_title', 'specific', 'PRESTAMO'),
(10915, 7, 'text_take_loan_title', 'specific', 'PRESTAMOS'),
(10916, 7, 'label_loan_from', 'specific', 'PRESTAMO DE'),
(10917, 7, 'label_ref_no', 'specific', 'NRO REF'),
(10918, 7, 'label_interest', 'specific', 'INTERESES'),
(10919, 7, 'label_payable', 'specific', 'VALOR'),
(10920, 7, 'label_loan_for', 'specific', 'PRESTAMO PARA'),
(10921, 7, 'text_loan_list_title', 'specific', 'LISTA PRESTAMO PARA'),
(10922, 7, 'button_paid', 'specific', 'PAGADA'),
(10923, 7, 'button_due', 'specific', 'DEBIDA'),
(10924, 7, 'label_basic_amount', 'specific', 'CANTIDAD BASICA'),
(10925, 7, 'label_paid', 'specific', 'PAGADO'),
(10926, 7, 'title_loan_summary', 'specific', 'RESUMEN PRESTAMO'),
(10927, 7, 'text_loan_summary_title', 'specific', 'RESUMEN PRESTAMO'),
(10928, 7, 'text_summary_title', 'specific', 'RESUMEN'),
(10929, 7, 'text_total_loan', 'specific', 'TOTAL PRESTAMO'),
(10930, 7, 'text_total_due', 'specific', 'TOTAL DEBIDO'),
(10931, 7, 'text_recent_payments', 'specific', 'PAGOS RECIENTES'),
(10932, 7, 'text_expense_title', 'specific', 'GASTOS'),
(10933, 7, 'text_new_expense_title', 'specific', 'NUEVO GASTOS'),
(10934, 7, 'label_what_for', 'specific', 'PARA QUE'),
(10935, 7, 'label_returnable', 'specific', 'RETORNABLE'),
(10936, 7, 'label_notes', 'specific', 'NOTAS'),
(10937, 7, 'text_expense_list_title', 'specific', 'LISTA GASTOS'),
(10938, 7, 'title_expense_category', 'specific', 'CATEGORIA GASTOS'),
(10939, 7, 'text_expense_category_title', 'specific', 'CATEGORIA GASTOS'),
(10940, 7, 'text_new_expense_category_title', 'specific', 'NUEVO CATEGORIA GASTOS'),
(10941, 7, 'title_expense_monthwise', 'specific', 'GASTO MENSUAL'),
(10942, 7, 'text_expense_monthwise_title', 'specific', 'GASTO MENSUAL'),
(10943, 7, 'label_summary', 'specific', 'RESUMEN'),
(10944, 7, 'label_grand_total', 'specific', 'GRAN TOTAL'),
(10945, 7, 'label_this_week', 'specific', 'ESTA SEMANA'),
(10946, 7, 'label_this_month', 'specific', 'ESTE MES'),
(10947, 7, 'label_this_year', 'specific', 'ESTE AÑO');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(10948, 7, 'label_income_source', 'specific', 'FUENTE INGRESOS'),
(10949, 7, 'label_account', 'specific', 'CUENTA'),
(10950, 7, 'label_about', 'specific', 'ACERCA DE'),
(10951, 7, 'label_capital', 'specific', 'CAPITAL'),
(10952, 7, 'button_deposit_now', 'specific', 'DEPOSITAR AHORA'),
(10953, 7, 'label_exp_category', 'specific', 'CATEGORIA EXP'),
(10954, 7, 'button_withdraw_now', 'specific', 'RETIRAR AHORA'),
(10955, 7, 'title_bank_transactions', 'specific', 'TRANSACCIONES BANCARIAS'),
(10956, 7, 'text_bank_transaction_title', 'specific', 'TRANSACCION BANCARIA'),
(10957, 7, 'text_bank_transaction_list_title', 'specific', 'LISTA TRANSACCION BANCARIA'),
(10958, 7, 'button_filtering', 'specific', 'FILTRACION'),
(10959, 7, 'text_view_all_transactions', 'specific', 'VER TODAS LAS TRANSACCIONES '),
(10960, 7, 'button_transfer_now', 'specific', 'TRANSFERIR AHORA'),
(10961, 7, 'title_bank_transfer', 'specific', 'TRANSFERENCIA BANCARIA'),
(10962, 7, 'text_bank_transfer_title', 'specific', 'TRANSFERENCIA BANCARIA'),
(10963, 7, 'text_banking_title', 'specific', 'BANCARIA'),
(10964, 7, 'text_list_bank_transfer_title', 'specific', 'LISTA TRANSFERENCIA BANCARIA'),
(10965, 7, 'label_from_account', 'specific', 'DE LA CUENTA'),
(10966, 7, 'label_to_account', 'specific', 'A LA CUENTA'),
(10967, 7, 'title_bank_account', 'specific', 'CUENTA BANCARIA'),
(10968, 7, 'text_new_bank_account_title', 'specific', 'NUEVA CUENTA BANCARIA'),
(10969, 7, 'label_account_details', 'specific', 'DETALLES CUENTA '),
(10970, 7, 'label_account_no', 'specific', 'NRO CUENTA'),
(10971, 7, 'label_contact_person', 'specific', 'PERSONA CONTACTO'),
(10972, 7, 'label_internal_banking_url', 'specific', 'URL BANCA INTERNA'),
(10973, 7, 'text_bank_account_list_title', 'specific', 'LISTA  CUENTA BANCARIA'),
(10974, 7, 'label_account_description', 'specific', 'DESCRIPCION CUENTA '),
(10975, 7, 'title_income_source', 'specific', 'FUENTE INGRESOS'),
(10976, 7, 'text_income_source_title', 'specific', 'FUENTE INGRESOS'),
(10977, 7, 'text_new_income_source_title', 'specific', 'NUEVA FUENTE INGRESOS'),
(10978, 7, 'label_source_name', 'specific', 'NOMBRE FUENTE'),
(10979, 7, 'label_source_slug', 'specific', 'SLUG FUENTE'),
(10980, 7, 'label_source_details', 'specific', 'DETALLES FUENTE'),
(10981, 7, 'text_income_source_sub_title', 'specific', 'SUB FUENTE INGRESOS'),
(10982, 7, 'title_income_monthwise', 'specific', 'INGRESO MENSUAL'),
(10983, 7, 'text_income_monthwise_title', 'specific', 'INGRESO MENSUAL'),
(10984, 7, 'label_profit', 'specific', 'GANANCIA'),
(10985, 7, 'title_income_and_expense', 'specific', 'INGRESOS Y GASTOS'),
(10986, 7, 'text_income_and_expense_title', 'specific', 'INGRESOS Y GASTOS'),
(10987, 7, 'text_date', 'specific', 'FECHA'),
(10988, 7, 'label_till_now', 'specific', 'HASTA AHORA'),
(10989, 7, 'title_profit_and_loss', 'specific', 'GANANCIA Y PERDIDA'),
(10990, 7, 'text_profit_and_loss_title', 'specific', 'GANANCIA Y PERDIDA'),
(10991, 7, 'text_profit_and_loss_details_title', 'specific', 'DETALLES GANANCIA Y PERDIDA'),
(10992, 7, 'text_loss_title', 'specific', 'PERDIDA'),
(10993, 7, 'text_profit_title', 'specific', 'GANANCIA '),
(10994, 7, 'title_profit', 'specific', 'GANANCIA '),
(10995, 7, 'label_total_profit', 'specific', 'TOTAL GANANCIA '),
(10996, 7, 'label_total_loss', 'specific', 'TOTAL PERDIDA'),
(10997, 7, 'label_net_profit', 'specific', 'BENEFICIO NETO'),
(10998, 7, 'text_supplier_list_title', 'specific', 'LISTA PROVEEDORES'),
(10999, 7, 'text_supplier_title', 'specific', 'PROVEEDORES'),
(11000, 7, 'text_new_supplier_title', 'specific', 'NUEVO PROVEEDOR'),
(11001, 7, 'text_customer_list_title', 'specific', 'LISTA DE CLIENTE'),
(11002, 7, 'text_customer_title', 'specific', 'CLIENTE'),
(11003, 7, 'text_new_customer_title', 'specific', 'NUEVO CLIENTE'),
(11004, 7, 'label_sell', 'specific', 'VENDER'),
(11005, 7, 'button_sell', 'specific', 'VENDER'),
(11006, 7, 'title_transfer', 'specific', 'TRANSFERIR'),
(11007, 7, 'text_stock_transfer_title', 'specific', 'TRANSFERENCIA STOCK'),
(11008, 7, 'text_transfer_title', 'specific', 'TRANSFERENCIA '),
(11009, 7, 'text_add_transfer_title', 'specific', 'AGREGAR TRANSFERENCIA'),
(11010, 7, 'text_stock_list', 'specific', 'LISTA STOCK'),
(11011, 7, 'text_invoice_id', 'specific', 'ID FACTURA'),
(11012, 7, 'text_stock', 'specific', 'STOCK'),
(11013, 7, 'text_transfer_list', 'specific', 'LISTA TRANSFERENCIA'),
(11014, 7, 'label_item_name', 'specific', 'NOMBRE ARTICULO'),
(11015, 7, 'label_transfer_qty', 'specific', 'CANTIDAD TRANSFERENCIA'),
(11016, 7, 'text_list__transfer__title', 'specific', 'LISTA  TRANSFERENCIA'),
(11017, 7, 'label_from_store', 'specific', 'DE LA TIENDA'),
(11018, 7, 'label_to_store', 'specific', 'A LA TIENDA'),
(11019, 7, 'label_total_quantity', 'specific', 'TOTAL CANTIDAD'),
(11020, 7, 'title_receive', 'specific', 'RECIBIR'),
(11021, 7, 'text_stock_receive_title', 'specific', 'RECIBIR STOCK'),
(11022, 7, 'text_receive_title', 'specific', 'RECIBIR '),
(11023, 7, 'text_list__receive__title', 'specific', 'LISTA RECIBIR'),
(11024, 7, 'title_installment', 'specific', 'ENTREGA'),
(11025, 7, 'text_installment_title', 'specific', 'ENTREGA'),
(11026, 7, 'text_installment_sub_title', 'specific', 'SUB PLAZOS'),
(11027, 7, 'button_all_installment', 'specific', 'TODA LA ENTREGA'),
(11028, 7, 'button_due_installment', 'specific', 'DEUDA ENTREGA'),
(11029, 7, 'button_paid_installment', 'specific', 'PAGO ENTREGA'),
(11030, 7, 'label_total_ins', 'specific', 'TOTAL ENTREGA'),
(11031, 7, 'title_installment_payment', 'specific', 'PAGO ENTREGA'),
(11032, 7, 'text_installment_payment_title', 'specific', 'PAGO ENTREGA'),
(11033, 7, 'text_installment', 'specific', 'ENTREGA'),
(11034, 7, 'text_installment_payment_list_title', 'specific', 'LISTA PAGO ENTREGA'),
(11035, 7, 'text_all_payment', 'specific', 'TODOS LOS PAGOS'),
(11036, 7, 'button_all_payment', 'specific', 'TODOS LOS PAGOS'),
(11037, 7, 'button_todays_due_payment', 'specific', 'PAGO VENCIDO HOY'),
(11038, 7, 'button_all_due_payment', 'specific', 'TODAS LAS DEUDAS PAGADAS'),
(11039, 7, 'button_expired_due_payment', 'specific', 'DEUDAS PAGADAS EXPERIDAS'),
(11040, 7, 'label_payment_date', 'specific', 'FECHA PAGO'),
(11041, 7, 'button_payment', 'specific', 'PAGO'),
(11042, 7, 'text_todays_due_payment', 'specific', 'PAGOS DEUDAS HOY'),
(11043, 7, 'text_all_due_payment', 'specific', 'TOTAL PAGOS DEUDAS'),
(11044, 7, 'text_expired_due_payment', 'specific', 'PAGOS DEUDAS EXPIRADOS'),
(11045, 7, 'title_installment_overview', 'specific', 'RESUMEN ENTREGA'),
(11046, 7, 'text_installment_overview_title', 'specific', 'RESUMEN ENTREGA'),
(11047, 7, 'text_installment_overview', 'specific', 'RESUMEN ENTREGA'),
(11048, 7, 'text_invoice_count', 'specific', 'CUENTA FACTURA'),
(11049, 7, 'text_sell_amount', 'specific', 'Cantidad Venta'),
(11050, 7, 'text_interest_amount', 'specific', 'CANTIDAD INTERES'),
(11051, 7, 'text_amount_received', 'specific', 'CANTIDAD  RECIBIDA'),
(11052, 7, 'text_amount_due', 'specific', 'CANTIDAD  DEUDA'),
(11053, 7, 'title_giftcard', 'specific', 'TARJETA DE REGALO'),
(11054, 7, 'text_new_giftcard_title', 'specific', 'NUEVA TARJETA DE REGALO'),
(11055, 7, 'text_giftcard_list_title', 'specific', 'LISTA TARJETA DE REGALO'),
(11056, 7, 'label_expiry', 'specific', 'EXPIRACION'),
(11057, 7, 'label_topup', 'specific', 'REPOSICION'),
(11058, 7, 'title_purchase_report', 'specific', 'INFORME COMPRA'),
(11059, 7, 'text_purchase_report_title', 'specific', 'INFORME COMPRA'),
(11060, 7, 'text_purchase_report_sub_title', 'specific', 'INFORME COMPRA'),
(11061, 7, 'title_backup_restore', 'specific', 'RESTAURAR BACKUP'),
(11062, 7, 'text_backup_restore_title', 'specific', 'RESTAURAR BACKUP'),
(11063, 7, 'text_backup', 'specific', 'BACKUP'),
(11064, 7, 'text_restore', 'specific', 'RESTAURAR '),
(11065, 7, 'label_databases', 'specific', 'BASE DE DATOS'),
(11066, 7, 'label_select_all', 'specific', 'SELECCIONAR TODO'),
(11067, 7, 'label_unselect_all', 'specific', 'DESELECCIONAR TODO'),
(11068, 7, 'button_export', 'specific', 'EXPORTAR'),
(11069, 7, 'label_progress', 'specific', 'PROGRESO'),
(11070, 7, 'button_select_sql_file', 'specific', 'SELECCIONAR ARCHIVO SQL'),
(11071, 7, 'text_male', 'specific', 'MASCULINO'),
(11072, 7, 'text_female', 'specific', 'FEMENINO'),
(11073, 7, 'title_tax_overview_report', 'specific', 'INFORME GENERAL IMPUESTO'),
(11074, 7, 'text_tax_overview_report_title', 'specific', 'INFORME GENERAL IMPUESTO'),
(11075, 7, 'text_sell_tax', 'specific', 'IMPUESTO VENTA'),
(11076, 7, 'text_purchase_tax', 'specific', 'IMPUESTO COMPRA'),
(11077, 7, 'label_tax_percent', 'specific', 'PORCENTAJE IMPUESTO '),
(11078, 7, 'label_count', 'specific', 'CONTAR'),
(11079, 7, 'text_login_title', 'specific', 'LOGIN'),
(11080, 7, 'title_user_profile', 'specific', 'Perfil del usuario'),
(11081, 7, 'text_profile_title', 'specific', 'Perfil'),
(11082, 7, 'text_users', 'specific', 'Usuarios'),
(11083, 7, 'text_since', 'specific', 'Creado el'),
(11084, 7, 'text_contact_information', 'specific', 'Información del contacto'),
(11085, 7, 'label_collection', 'specific', 'Colección'),
(11086, 7, 'text_sell_report', 'specific', 'Informe de venta'),
(11087, 7, 'text_purchase_report', 'specific', 'Informe de compra'),
(11088, 7, 'text_payment_report', 'specific', 'Informe de pago'),
(11089, 7, 'text_login_log', 'specific', 'Historial de inicio de sesión'),
(11090, 7, 'button_collection_report', 'specific', 'Informe de cobranza'),
(11091, 7, 'button_log', 'specific', 'Iniciar sesión'),
(11092, 7, 'text_invoice_list', 'specific', 'Lista de facturas'),
(11093, 7, 'label_items', 'specific', 'Artículos'),
(11094, 7, 'label_time', 'specific', 'Hora'),
(11095, 7, 'text_update_success', 'specific', 'Actualizado exitosamente'),
(11096, 7, 'text_permission', 'specific', 'Permiso'),
(11097, 7, 'text_quotation_create_success', 'specific', 'Creado con éxito'),
(11098, 7, 'button_action', 'specific', 'Acción'),
(11099, 7, 'button_create_sell', 'specific', 'Crear Vender'),
(11100, 7, 'label_sl', 'specific', 'SL'),
(11101, 7, 'label_unit_price', 'specific', 'Precio unitario'),
(11102, 7, 'label_shipping', 'specific', 'Envío'),
(11103, 7, 'label_stamp_and_signature', 'specific', 'Sello y firma'),
(11104, 7, 'text_stock_register', 'specific', 'Informe de compra'),
(11105, 7, 'text_chart', 'specific', 'Gráfico'),
(11106, 7, 'label_select', 'specific', 'Seleccione'),
(11107, 7, 'label_sold', 'specific', 'Vendido'),
(11108, 7, 'title_reset_your_system', 'specific', 'Reinicia tu sistema'),
(11109, 6, 'button_translate', 'specific', ''),
(11110, 5, 'title_language_translation', 'specific', ''),
(11111, 5, 'text_english', 'specific', ''),
(11112, 5, 'text_arabic', 'specific', ''),
(11113, 5, 'text_bangla', 'specific', ''),
(11114, 5, 'text_hindi', 'specific', ''),
(11115, 5, 'text_french', 'specific', ''),
(11116, 5, 'text_Germany', 'specific', ''),
(11117, 5, 'text_spanish', 'specific', ''),
(11118, 5, 'text_pos', 'specific', ''),
(11119, 5, 'menu_pos', 'specific', ''),
(11120, 5, 'text_cashbook_report', 'specific', ''),
(11121, 5, 'menu_cashbook', 'specific', ''),
(11122, 5, 'text_invoice', 'specific', ''),
(11123, 5, 'menu_invoice', 'specific', ''),
(11124, 5, 'text_user_preference', 'specific', ''),
(11125, 5, 'text_settings', 'specific', ''),
(11126, 5, 'text_stock_alert', 'specific', ''),
(11127, 5, 'text_fullscreen', 'specific', ''),
(11128, 5, 'text_reports', 'specific', ''),
(11129, 5, 'text_lockscreen', 'specific', ''),
(11130, 5, 'text_logout', 'specific', ''),
(11131, 5, 'menu_dashboard', 'specific', ''),
(11132, 5, 'menu_point_of_sell', 'specific', ''),
(11133, 5, 'menu_sell', 'specific', ''),
(11134, 5, 'menu_sell_list', 'specific', ''),
(11135, 5, 'menu_return_list', 'specific', ''),
(11136, 5, 'menu_sell_log', 'specific', ''),
(11137, 5, 'menu_giftcard', 'specific', ''),
(11138, 5, 'menu_add_giftcard', 'specific', ''),
(11139, 5, 'menu_giftcard_list', 'specific', ''),
(11140, 5, 'menu_giftcard_topup', 'specific', ''),
(11141, 5, 'menu_quotation', 'specific', ''),
(11142, 5, 'menu_add_quotation', 'specific', ''),
(11143, 5, 'menu_quotation_list', 'specific', ''),
(11144, 5, 'menu_installment', 'specific', ''),
(11145, 5, 'menu_installment_list', 'specific', ''),
(11146, 5, 'menu_payment_list', 'specific', ''),
(11147, 5, 'menu_payment_due_today', 'specific', ''),
(11148, 5, 'menu_payment_due_all', 'specific', ''),
(11149, 5, 'menu_payment_due_expired', 'specific', ''),
(11150, 5, 'menu_overview_report', 'specific', ''),
(11151, 5, 'menu_purchase', 'specific', ''),
(11152, 5, 'menu_add_purchase', 'specific', ''),
(11153, 5, 'menu_purchase_list', 'specific', ''),
(11154, 5, 'menu_due_invoice', 'specific', ''),
(11155, 5, 'menu_purchase_logs', 'specific', ''),
(11156, 5, 'menu_transfer', 'specific', ''),
(11157, 5, 'menu_add_transfer', 'specific', ''),
(11158, 5, 'menu_transfer_list', 'specific', ''),
(11159, 5, 'menu_receive_list', 'specific', ''),
(11160, 5, 'menu_product', 'specific', ''),
(11161, 5, 'menu_product_list', 'specific', ''),
(11162, 5, 'menu_add_product', 'specific', ''),
(11163, 5, 'menu_barcode_print', 'specific', ''),
(11164, 5, 'menu_category', 'specific', ''),
(11165, 5, 'menu_add_category', 'specific', ''),
(11166, 5, 'menu_product_import', 'specific', ''),
(11167, 5, 'menu_stock_alert', 'specific', ''),
(11168, 5, 'menu_customer', 'specific', ''),
(11169, 5, 'menu_add_customer', 'specific', ''),
(11170, 5, 'menu_customer_list', 'specific', ''),
(11171, 5, 'menu_statements', 'specific', ''),
(11172, 5, 'menu_supplier', 'specific', ''),
(11173, 5, 'menu_add_supplier', 'specific', ''),
(11174, 5, 'menu_supplier_list', 'specific', ''),
(11175, 5, 'menu_accounting', 'specific', ''),
(11176, 5, 'menu_new_deposit', 'specific', ''),
(11177, 5, 'menu_new_withdraw', 'specific', ''),
(11178, 5, 'menu_list_transactions', 'specific', ''),
(11179, 5, 'menu_new_transfer', 'specific', ''),
(11180, 5, 'menu_list_transfer', 'specific', ''),
(11181, 5, 'menu_add_bank_account', 'specific', ''),
(11182, 5, 'menu_bank_accounts', 'specific', ''),
(11183, 5, 'menu_income_source', 'specific', ''),
(11184, 5, 'menu_balance_sheet', 'specific', ''),
(11185, 5, 'menu_income_monthwise', 'specific', ''),
(11186, 5, 'menu_expense_monthwise', 'specific', ''),
(11187, 5, 'menu_income_and_expense', 'specific', ''),
(11188, 5, 'menu_profit_and_loss', 'specific', ''),
(11189, 5, 'menu_expenditure', 'specific', ''),
(11190, 5, 'menu_create_expense', 'specific', ''),
(11191, 5, 'menu_expense_list', 'specific', ''),
(11192, 5, 'menu_summary', 'specific', ''),
(11193, 5, 'menu_loan_manager', 'specific', ''),
(11194, 5, 'menu_loan_list', 'specific', ''),
(11195, 5, 'menu_take_loan', 'specific', ''),
(11196, 5, 'menu_loan_summary', 'specific', ''),
(11197, 5, 'menu_reports', 'specific', ''),
(11198, 5, 'menu_report_overview', 'specific', ''),
(11199, 5, 'menu_report_collection', 'specific', ''),
(11200, 5, 'menu_report_due_collection', 'specific', ''),
(11201, 5, 'menu_report_due_paid', 'specific', ''),
(11202, 5, 'menu_sell_report', 'specific', ''),
(11203, 5, 'menu_purchase_report', 'specific', ''),
(11204, 5, 'menu_sell_payment_report', 'specific', ''),
(11205, 5, 'menu_purchase_payment_report', 'specific', ''),
(11206, 5, 'menu_tax_report', 'specific', ''),
(11207, 5, 'menu_purchase_tax_report', 'specific', ''),
(11208, 5, 'menu_tax_overview_report', 'specific', ''),
(11209, 5, 'menu_report_stock', 'specific', ''),
(11210, 5, 'menu_analytics', 'specific', ''),
(11211, 5, 'menu_sms', 'specific', ''),
(11212, 5, 'menu_send_sms', 'specific', ''),
(11213, 5, 'menu_sms_report', 'specific', ''),
(11214, 5, 'menu_sms_setting', 'specific', ''),
(11215, 5, 'menu_user', 'specific', ''),
(11216, 5, 'menu_add_user', 'specific', ''),
(11217, 5, 'menu_user_list', 'specific', ''),
(11218, 5, 'menu_add_usergroup', 'specific', ''),
(11219, 5, 'menu_usergroup_list', 'specific', ''),
(11220, 5, 'menu_password', 'specific', ''),
(11221, 5, 'menu_filemanager', 'specific', ''),
(11222, 5, 'menu_system', 'specific', ''),
(11223, 5, 'menu_store', 'specific', ''),
(11224, 5, 'menu_create_store', 'specific', ''),
(11225, 5, 'menu_store_list', 'specific', ''),
(11226, 5, 'menu_store_setting', 'specific', ''),
(11227, 5, 'menu_receipt_template', 'specific', ''),
(11228, 5, 'menu_user_preference', 'specific', ''),
(11229, 5, 'menu_brand', 'specific', ''),
(11230, 5, 'menu_add_brand', 'specific', ''),
(11231, 5, 'menu_brand_list', 'specific', ''),
(11232, 5, 'menu_currency', 'specific', ''),
(11233, 5, 'menu_pmethod', 'specific', ''),
(11234, 5, 'menu_unit', 'specific', ''),
(11235, 5, 'menu_taxrate', 'specific', ''),
(11236, 5, 'menu_box', 'specific', ''),
(11237, 5, 'menu_printer', 'specific', ''),
(11238, 5, 'menu_language', 'specific', ''),
(11239, 5, 'menu_backup_restore', 'specific', ''),
(11240, 5, 'menu_data_reset', 'specific', ''),
(11241, 5, 'menu_store_change', 'specific', ''),
(11242, 5, 'text_language_translation_title', 'specific', ''),
(11243, 5, 'text_dashboard', 'specific', ''),
(11244, 5, 'text_translations', 'specific', ''),
(11245, 5, 'button_add_new_language', 'specific', ''),
(11246, 5, 'button_edit', 'specific', ''),
(11247, 5, 'button_delete', 'specific', ''),
(11248, 5, 'button_default', 'specific', ''),
(11249, 5, 'button_dublicate_entry', 'specific', ''),
(11250, 5, 'button_empty_value', 'specific', ''),
(11251, 5, 'label_key', 'specific', ''),
(11252, 5, 'label_value', 'specific', ''),
(11253, 5, 'label_translate', 'specific', ''),
(11254, 5, 'label_delete', 'specific', ''),
(11255, 5, 'placeholder_search_here', 'specific', ''),
(11256, 5, 'text_version', 'specific', ''),
(11257, 5, 'button_today', 'specific', ''),
(11258, 5, 'button_last_7_days', 'specific', ''),
(11259, 5, 'button_last_30_days', 'specific', ''),
(11260, 5, 'button_last_365_days', 'specific', ''),
(11261, 5, 'button_filter', 'specific', ''),
(11262, 4, 'title_language_translation', 'specific', ''),
(11263, 4, 'text_english', 'specific', ''),
(11264, 4, 'text_arabic', 'specific', ''),
(11265, 4, 'text_bangla', 'specific', ''),
(11266, 4, 'text_hindi', 'specific', ''),
(11267, 4, 'text_french', 'specific', ''),
(11268, 4, 'text_Germany', 'specific', ''),
(11269, 4, 'text_spanish', 'specific', ''),
(11270, 4, 'text_pos', 'specific', ''),
(11271, 4, 'menu_pos', 'specific', ''),
(11272, 4, 'text_cashbook_report', 'specific', ''),
(11273, 4, 'menu_cashbook', 'specific', ''),
(11274, 4, 'text_invoice', 'specific', ''),
(11275, 4, 'menu_invoice', 'specific', ''),
(11276, 4, 'text_user_preference', 'specific', ''),
(11277, 4, 'text_settings', 'specific', ''),
(11278, 4, 'text_stock_alert', 'specific', ''),
(11279, 4, 'text_fullscreen', 'specific', ''),
(11280, 4, 'text_reports', 'specific', ''),
(11281, 4, 'text_lockscreen', 'specific', ''),
(11282, 4, 'text_logout', 'specific', ''),
(11283, 4, 'menu_dashboard', 'specific', ''),
(11284, 4, 'menu_point_of_sell', 'specific', ''),
(11285, 4, 'menu_sell', 'specific', ''),
(11286, 4, 'menu_sell_list', 'specific', ''),
(11287, 4, 'menu_return_list', 'specific', ''),
(11288, 4, 'menu_sell_log', 'specific', ''),
(11289, 4, 'menu_giftcard', 'specific', ''),
(11290, 4, 'menu_add_giftcard', 'specific', ''),
(11291, 4, 'menu_giftcard_list', 'specific', ''),
(11292, 4, 'menu_giftcard_topup', 'specific', ''),
(11293, 4, 'menu_quotation', 'specific', ''),
(11294, 4, 'menu_add_quotation', 'specific', ''),
(11295, 4, 'menu_quotation_list', 'specific', ''),
(11296, 4, 'menu_installment', 'specific', ''),
(11297, 4, 'menu_installment_list', 'specific', ''),
(11298, 4, 'menu_payment_list', 'specific', ''),
(11299, 4, 'menu_payment_due_today', 'specific', ''),
(11300, 4, 'menu_payment_due_all', 'specific', ''),
(11301, 4, 'menu_payment_due_expired', 'specific', ''),
(11302, 4, 'menu_overview_report', 'specific', ''),
(11303, 4, 'menu_purchase', 'specific', ''),
(11304, 4, 'menu_add_purchase', 'specific', ''),
(11305, 4, 'menu_purchase_list', 'specific', ''),
(11306, 4, 'menu_due_invoice', 'specific', ''),
(11307, 4, 'menu_purchase_logs', 'specific', ''),
(11308, 4, 'menu_transfer', 'specific', ''),
(11309, 4, 'menu_add_transfer', 'specific', ''),
(11310, 4, 'menu_transfer_list', 'specific', ''),
(11311, 4, 'menu_receive_list', 'specific', ''),
(11312, 4, 'menu_product', 'specific', ''),
(11313, 4, 'menu_product_list', 'specific', ''),
(11314, 4, 'menu_add_product', 'specific', ''),
(11315, 4, 'menu_barcode_print', 'specific', ''),
(11316, 4, 'menu_category', 'specific', ''),
(11317, 4, 'menu_add_category', 'specific', ''),
(11318, 4, 'menu_product_import', 'specific', ''),
(11319, 4, 'menu_stock_alert', 'specific', ''),
(11320, 4, 'menu_customer', 'specific', ''),
(11321, 4, 'menu_add_customer', 'specific', ''),
(11322, 4, 'menu_customer_list', 'specific', ''),
(11323, 4, 'menu_statements', 'specific', ''),
(11324, 4, 'menu_supplier', 'specific', ''),
(11325, 4, 'menu_add_supplier', 'specific', ''),
(11326, 4, 'menu_supplier_list', 'specific', ''),
(11327, 4, 'menu_accounting', 'specific', ''),
(11328, 4, 'menu_new_deposit', 'specific', ''),
(11329, 4, 'menu_new_withdraw', 'specific', ''),
(11330, 4, 'menu_list_transactions', 'specific', ''),
(11331, 4, 'menu_new_transfer', 'specific', ''),
(11332, 4, 'menu_list_transfer', 'specific', ''),
(11333, 4, 'menu_add_bank_account', 'specific', ''),
(11334, 4, 'menu_bank_accounts', 'specific', ''),
(11335, 4, 'menu_income_source', 'specific', ''),
(11336, 4, 'menu_balance_sheet', 'specific', ''),
(11337, 4, 'menu_income_monthwise', 'specific', ''),
(11338, 4, 'menu_expense_monthwise', 'specific', ''),
(11339, 4, 'menu_income_and_expense', 'specific', ''),
(11340, 4, 'menu_profit_and_loss', 'specific', ''),
(11341, 4, 'menu_expenditure', 'specific', ''),
(11342, 4, 'menu_create_expense', 'specific', ''),
(11343, 4, 'menu_expense_list', 'specific', ''),
(11344, 4, 'menu_summary', 'specific', ''),
(11345, 4, 'menu_loan_manager', 'specific', ''),
(11346, 4, 'menu_loan_list', 'specific', ''),
(11347, 4, 'menu_take_loan', 'specific', ''),
(11348, 4, 'menu_loan_summary', 'specific', ''),
(11349, 4, 'menu_reports', 'specific', ''),
(11350, 4, 'menu_report_overview', 'specific', ''),
(11351, 4, 'menu_report_collection', 'specific', ''),
(11352, 4, 'menu_report_due_collection', 'specific', ''),
(11353, 4, 'menu_report_due_paid', 'specific', ''),
(11354, 4, 'menu_sell_report', 'specific', ''),
(11355, 4, 'menu_purchase_report', 'specific', ''),
(11356, 4, 'menu_sell_payment_report', 'specific', ''),
(11357, 4, 'menu_purchase_payment_report', 'specific', ''),
(11358, 4, 'menu_tax_report', 'specific', ''),
(11359, 4, 'menu_purchase_tax_report', 'specific', ''),
(11360, 4, 'menu_tax_overview_report', 'specific', ''),
(11361, 4, 'menu_report_stock', 'specific', ''),
(11362, 4, 'menu_analytics', 'specific', ''),
(11363, 4, 'menu_sms', 'specific', ''),
(11364, 4, 'menu_send_sms', 'specific', ''),
(11365, 4, 'menu_sms_report', 'specific', ''),
(11366, 4, 'menu_sms_setting', 'specific', ''),
(11367, 4, 'menu_user', 'specific', ''),
(11368, 4, 'menu_add_user', 'specific', ''),
(11369, 4, 'menu_user_list', 'specific', ''),
(11370, 4, 'menu_add_usergroup', 'specific', ''),
(11371, 4, 'menu_usergroup_list', 'specific', ''),
(11372, 4, 'menu_password', 'specific', ''),
(11373, 4, 'menu_filemanager', 'specific', ''),
(11374, 4, 'menu_system', 'specific', ''),
(11375, 4, 'menu_store', 'specific', ''),
(11376, 4, 'menu_create_store', 'specific', ''),
(11377, 4, 'menu_store_list', 'specific', ''),
(11378, 4, 'menu_store_setting', 'specific', ''),
(11379, 4, 'menu_receipt_template', 'specific', ''),
(11380, 4, 'menu_user_preference', 'specific', ''),
(11381, 4, 'menu_brand', 'specific', ''),
(11382, 4, 'menu_add_brand', 'specific', ''),
(11383, 4, 'menu_brand_list', 'specific', ''),
(11384, 4, 'menu_currency', 'specific', ''),
(11385, 4, 'menu_pmethod', 'specific', ''),
(11386, 4, 'menu_unit', 'specific', ''),
(11387, 4, 'menu_taxrate', 'specific', ''),
(11388, 4, 'menu_box', 'specific', ''),
(11389, 4, 'menu_printer', 'specific', ''),
(11390, 4, 'menu_language', 'specific', ''),
(11391, 4, 'menu_backup_restore', 'specific', ''),
(11392, 4, 'menu_data_reset', 'specific', ''),
(11393, 4, 'menu_store_change', 'specific', ''),
(11394, 4, 'text_language_translation_title', 'specific', ''),
(11395, 4, 'text_dashboard', 'specific', ''),
(11396, 4, 'text_translations', 'specific', ''),
(11397, 4, 'button_add_new_language', 'specific', ''),
(11398, 4, 'button_edit', 'specific', ''),
(11399, 4, 'button_delete', 'specific', ''),
(11400, 4, 'button_default', 'specific', ''),
(11401, 4, 'button_dublicate_entry', 'specific', ''),
(11402, 4, 'button_empty_value', 'specific', ''),
(11403, 4, 'label_key', 'specific', ''),
(11404, 4, 'label_value', 'specific', ''),
(11405, 4, 'label_translate', 'specific', ''),
(11406, 4, 'label_delete', 'specific', ''),
(11407, 4, 'placeholder_search_here', 'specific', ''),
(11408, 4, 'text_version', 'specific', ''),
(11409, 4, 'button_today', 'specific', ''),
(11410, 4, 'button_last_7_days', 'specific', ''),
(11411, 4, 'button_last_30_days', 'specific', ''),
(11412, 4, 'button_last_365_days', 'specific', ''),
(11413, 4, 'button_filter', 'specific', ''),
(11414, 3, 'title_language_translation', 'specific', ''),
(11415, 3, 'text_english', 'specific', ''),
(11416, 3, 'text_arabic', 'specific', ''),
(11417, 3, 'text_bangla', 'specific', ''),
(11418, 3, 'text_hindi', 'specific', ''),
(11419, 3, 'text_french', 'specific', ''),
(11420, 3, 'text_Germany', 'specific', ''),
(11421, 3, 'text_spanish', 'specific', ''),
(11422, 3, 'text_pos', 'specific', ''),
(11423, 3, 'menu_pos', 'specific', ''),
(11424, 3, 'text_cashbook_report', 'specific', ''),
(11425, 3, 'menu_cashbook', 'specific', ''),
(11426, 3, 'text_invoice', 'specific', ''),
(11427, 3, 'menu_invoice', 'specific', ''),
(11428, 3, 'text_user_preference', 'specific', ''),
(11429, 3, 'text_settings', 'specific', ''),
(11430, 3, 'text_stock_alert', 'specific', ''),
(11431, 3, 'text_fullscreen', 'specific', ''),
(11432, 3, 'text_reports', 'specific', ''),
(11433, 3, 'text_lockscreen', 'specific', ''),
(11434, 3, 'text_logout', 'specific', ''),
(11435, 3, 'menu_dashboard', 'specific', ''),
(11436, 3, 'menu_point_of_sell', 'specific', ''),
(11437, 3, 'menu_sell', 'specific', ''),
(11438, 3, 'menu_sell_list', 'specific', ''),
(11439, 3, 'menu_return_list', 'specific', ''),
(11440, 3, 'menu_sell_log', 'specific', ''),
(11441, 3, 'menu_giftcard', 'specific', ''),
(11442, 3, 'menu_add_giftcard', 'specific', ''),
(11443, 3, 'menu_giftcard_list', 'specific', ''),
(11444, 3, 'menu_giftcard_topup', 'specific', ''),
(11445, 3, 'menu_quotation', 'specific', ''),
(11446, 3, 'menu_add_quotation', 'specific', ''),
(11447, 3, 'menu_quotation_list', 'specific', ''),
(11448, 3, 'menu_installment', 'specific', ''),
(11449, 3, 'menu_installment_list', 'specific', ''),
(11450, 3, 'menu_payment_list', 'specific', ''),
(11451, 3, 'menu_payment_due_today', 'specific', ''),
(11452, 3, 'menu_payment_due_all', 'specific', ''),
(11453, 3, 'menu_payment_due_expired', 'specific', ''),
(11454, 3, 'menu_overview_report', 'specific', ''),
(11455, 3, 'menu_purchase', 'specific', ''),
(11456, 3, 'menu_add_purchase', 'specific', ''),
(11457, 3, 'menu_purchase_list', 'specific', ''),
(11458, 3, 'menu_due_invoice', 'specific', ''),
(11459, 3, 'menu_purchase_logs', 'specific', ''),
(11460, 3, 'menu_transfer', 'specific', ''),
(11461, 3, 'menu_add_transfer', 'specific', ''),
(11462, 3, 'menu_transfer_list', 'specific', ''),
(11463, 3, 'menu_receive_list', 'specific', ''),
(11464, 3, 'menu_product', 'specific', ''),
(11465, 3, 'menu_product_list', 'specific', ''),
(11466, 3, 'menu_add_product', 'specific', ''),
(11467, 3, 'menu_barcode_print', 'specific', ''),
(11468, 3, 'menu_category', 'specific', ''),
(11469, 3, 'menu_add_category', 'specific', ''),
(11470, 3, 'menu_product_import', 'specific', ''),
(11471, 3, 'menu_stock_alert', 'specific', ''),
(11472, 3, 'menu_customer', 'specific', ''),
(11473, 3, 'menu_add_customer', 'specific', ''),
(11474, 3, 'menu_customer_list', 'specific', ''),
(11475, 3, 'menu_statements', 'specific', ''),
(11476, 3, 'menu_supplier', 'specific', ''),
(11477, 3, 'menu_add_supplier', 'specific', ''),
(11478, 3, 'menu_supplier_list', 'specific', ''),
(11479, 3, 'menu_accounting', 'specific', ''),
(11480, 3, 'menu_new_deposit', 'specific', ''),
(11481, 3, 'menu_new_withdraw', 'specific', ''),
(11482, 3, 'menu_list_transactions', 'specific', ''),
(11483, 3, 'menu_new_transfer', 'specific', ''),
(11484, 3, 'menu_list_transfer', 'specific', ''),
(11485, 3, 'menu_add_bank_account', 'specific', ''),
(11486, 3, 'menu_bank_accounts', 'specific', ''),
(11487, 3, 'menu_income_source', 'specific', ''),
(11488, 3, 'menu_balance_sheet', 'specific', ''),
(11489, 3, 'menu_income_monthwise', 'specific', ''),
(11490, 3, 'menu_expense_monthwise', 'specific', ''),
(11491, 3, 'menu_income_and_expense', 'specific', ''),
(11492, 3, 'menu_profit_and_loss', 'specific', ''),
(11493, 3, 'menu_expenditure', 'specific', ''),
(11494, 3, 'menu_create_expense', 'specific', ''),
(11495, 3, 'menu_expense_list', 'specific', ''),
(11496, 3, 'menu_summary', 'specific', ''),
(11497, 3, 'menu_loan_manager', 'specific', ''),
(11498, 3, 'menu_loan_list', 'specific', ''),
(11499, 3, 'menu_take_loan', 'specific', ''),
(11500, 3, 'menu_loan_summary', 'specific', ''),
(11501, 3, 'menu_reports', 'specific', ''),
(11502, 3, 'menu_report_overview', 'specific', ''),
(11503, 3, 'menu_report_collection', 'specific', ''),
(11504, 3, 'menu_report_due_collection', 'specific', ''),
(11505, 3, 'menu_report_due_paid', 'specific', ''),
(11506, 3, 'menu_sell_report', 'specific', ''),
(11507, 3, 'menu_purchase_report', 'specific', ''),
(11508, 3, 'menu_sell_payment_report', 'specific', ''),
(11509, 3, 'menu_purchase_payment_report', 'specific', ''),
(11510, 3, 'menu_tax_report', 'specific', ''),
(11511, 3, 'menu_purchase_tax_report', 'specific', ''),
(11512, 3, 'menu_tax_overview_report', 'specific', ''),
(11513, 3, 'menu_report_stock', 'specific', ''),
(11514, 3, 'menu_analytics', 'specific', ''),
(11515, 3, 'menu_sms', 'specific', ''),
(11516, 3, 'menu_send_sms', 'specific', ''),
(11517, 3, 'menu_sms_report', 'specific', ''),
(11518, 3, 'menu_sms_setting', 'specific', ''),
(11519, 3, 'menu_user', 'specific', ''),
(11520, 3, 'menu_add_user', 'specific', ''),
(11521, 3, 'menu_user_list', 'specific', ''),
(11522, 3, 'menu_add_usergroup', 'specific', ''),
(11523, 3, 'menu_usergroup_list', 'specific', ''),
(11524, 3, 'menu_password', 'specific', ''),
(11525, 3, 'menu_filemanager', 'specific', ''),
(11526, 3, 'menu_system', 'specific', ''),
(11527, 3, 'menu_store', 'specific', ''),
(11528, 3, 'menu_create_store', 'specific', ''),
(11529, 3, 'menu_store_list', 'specific', ''),
(11530, 3, 'menu_store_setting', 'specific', ''),
(11531, 3, 'menu_receipt_template', 'specific', ''),
(11532, 3, 'menu_user_preference', 'specific', ''),
(11533, 3, 'menu_brand', 'specific', ''),
(11534, 3, 'menu_add_brand', 'specific', ''),
(11535, 3, 'menu_brand_list', 'specific', ''),
(11536, 3, 'menu_currency', 'specific', ''),
(11537, 3, 'menu_pmethod', 'specific', ''),
(11538, 3, 'menu_unit', 'specific', ''),
(11539, 3, 'menu_taxrate', 'specific', ''),
(11540, 3, 'menu_box', 'specific', ''),
(11541, 3, 'menu_printer', 'specific', ''),
(11542, 3, 'menu_language', 'specific', ''),
(11543, 3, 'menu_backup_restore', 'specific', ''),
(11544, 3, 'menu_data_reset', 'specific', ''),
(11545, 3, 'menu_store_change', 'specific', ''),
(11546, 3, 'text_language_translation_title', 'specific', ''),
(11547, 3, 'text_dashboard', 'specific', ''),
(11548, 3, 'text_translations', 'specific', ''),
(11549, 3, 'button_add_new_language', 'specific', ''),
(11550, 3, 'button_edit', 'specific', ''),
(11551, 3, 'button_delete', 'specific', ''),
(11552, 3, 'button_default', 'specific', ''),
(11553, 3, 'button_dublicate_entry', 'specific', ''),
(11554, 3, 'button_empty_value', 'specific', ''),
(11555, 3, 'label_key', 'specific', ''),
(11556, 3, 'label_value', 'specific', ''),
(11557, 3, 'label_translate', 'specific', ''),
(11558, 3, 'label_delete', 'specific', ''),
(11559, 3, 'placeholder_search_here', 'specific', ''),
(11560, 3, 'text_version', 'specific', ''),
(11561, 3, 'button_today', 'specific', ''),
(11562, 3, 'button_last_7_days', 'specific', ''),
(11563, 3, 'button_last_30_days', 'specific', ''),
(11564, 3, 'button_last_365_days', 'specific', ''),
(11565, 3, 'button_filter', 'specific', ''),
(11566, 2, 'button_translate', 'specific', ''),
(11567, 2, 'title_language_translation', 'specific', ''),
(11568, 2, 'text_language_translation_title', 'specific', ''),
(11569, 2, 'text_translations', 'specific', ''),
(11570, 2, 'button_add_new_language', 'specific', ''),
(11571, 2, 'button_edit', 'specific', ''),
(11572, 2, 'button_delete', 'specific', ''),
(11573, 2, 'button_default', 'specific', ''),
(11574, 2, 'button_dublicate_entry', 'specific', ''),
(11575, 2, 'button_empty_value', 'specific', ''),
(11576, 2, 'label_key', 'specific', ''),
(11577, 2, 'label_value', 'specific', ''),
(11578, 2, 'label_translate', 'specific', ''),
(11579, 2, 'label_delete', 'specific', ''),
(11580, 7, 'error_insufficient_balance', 'specific', 'Saldo insuficiente'),
(11581, 7, 'label_invoice_amount', 'specific', 'IMPORTE DE LA FACTURA'),
(11582, 7, 'label_customer_mobile', 'specific', 'Cliente móvil'),
(11583, 7, 'label_invoice_note', 'specific', 'Nota de factura'),
(11584, 7, 'text_invoice_title', 'specific', 'Factura'),
(11585, 7, 'button_print', 'specific', 'Imprimir'),
(11586, 7, 'button_send_email', 'specific', 'Enviar correo electrónico'),
(11587, 7, 'button_back_to_pos', 'specific', 'Volver a POS'),
(11588, 7, 'text_order_summary', 'specific', 'Resumen del pedido'),
(11589, 7, 'label_previous_due_paid', 'specific', 'Previo / vencido'),
(11590, 7, 'text_return_item', 'specific', 'Devolver objeto'),
(11591, 7, 'label_return_quantity', 'specific', 'Cantidad devuelta'),
(11592, 7, 'placeholder_type_any_note', 'specific', 'Nota'),
(11593, 7, 'error_select_at_least_one_item', 'specific', 'Seleccione al menos un producto'),
(11594, 7, 'error_select_at_least_one_item', 'specific', 'Seleccione al menos un producto'),
(11595, 7, 'text_return_success', 'specific', 'Devolucion con exito'),
(11596, 7, 'error_quantity_exceed', 'specific', 'Cantidad excedida'),
(11597, 7, 'error_unexpected', 'specific', 'Error inesperada'),
(11598, 7, 'text_sell_update_success', 'specific', 'Actualizado'),
(11599, 7, 'title_customer_profile', 'specific', 'Perfil de cliente'),
(11600, 7, 'text_total_purchase', 'specific', 'Compra total'),
(11601, 7, 'text_information', 'specific', 'Información'),
(11602, 7, 'label_mobile_phone', 'specific', 'Teléfono móvil'),
(11603, 7, 'label_giftcard_taken', 'specific', 'Tarjeta de regalo tomada'),
(11604, 7, 'button_add_balance', 'specific', 'Agregar saldo'),
(11605, 7, 'button_statement', 'specific', 'Declaración'),
(11606, 7, 'text_all_invoice', 'specific', 'Toda la factura'),
(11607, 7, 'label_prev_due', 'specific', 'Prev. Debido'),
(11608, 7, 'text_balance_added', 'specific', 'Saldo agregado exitosamente'),
(11609, 7, 'button_substract_balance', 'specific', 'Restar saldo'),
(11610, 7, 'text_balance_substracted', 'specific', 'Saldo restado correctamente.'),
(11611, 7, 'label_customer_id', 'specific', 'Identificacion'),
(11612, 7, 'label_returened_by', 'specific', 'DEVUELTO POR'),
(11613, 7, 'label_total_amount', 'specific', 'Valor total'),
(11614, 7, 'text_return_products', 'specific', 'Productos de devolución'),
(11615, 7, 'error_customer', 'specific', 'Datos invalidos'),
(11616, 7, 'button_topup', 'specific', 'Recarga'),
(11617, 7, 'text_delete_success', 'specific', 'Eliminada exitosamente'),
(11618, 7, 'error_card_no', 'specific', 'error numero trajeta'),
(11619, 7, 'error_expiry_date', 'specific', 'Falta fecha vencimiento'),
(11620, 7, 'text_expiry', 'specific', 'Expira'),
(11621, 7, 'button_topup_now', 'specific', 'Recarga ahora'),
(11622, 7, 'text_topup_success', 'specific', 'Recarga exitosa'),
(11623, 7, 'error_amount', 'specific', 'La cantidad no es válida'),
(11624, 7, 'text_topup_delete_success', 'specific', ''),
(11625, 7, 'text_expired', 'specific', 'Caducado'),
(11626, 7, 'menu_sale_list', 'specific', 'Vender Lista'),
(11627, 7, 'menu_expired', 'specific', 'Caducado'),
(11628, 7, 'menu_transaction_list', 'specific', 'Lista Transacciones'),
(11629, 7, 'text_old_dashboard', 'specific', 'Tablero antiguo'),
(11630, 7, 'button_invoice', 'specific', 'Factura'),
(11631, 7, 'text_total_deposit', 'specific', 'Total Deposit'),
(11632, 7, 'text_total_withdraw', 'specific', 'Total Widthdraw'),
(11633, 7, 'text_sells_analytics', 'specific', 'Vender análisis'),
(11634, 7, 'title_language', 'specific', 'Idioma'),
(11635, 7, 'text_language_title', 'specific', 'Idioma'),
(11636, 7, 'text_language_list_title', 'specific', 'Traductor de idiomas'),
(11637, 7, 'text_invoice_sub_title', 'specific', 'Lista de facturas'),
(11638, 7, 'label_invoice_due', 'specific', 'Factura vencida'),
(11639, 7, 'text_list_transfer_title', 'specific', 'Transfer List'),
(11640, 7, 'text_image', 'specific', 'Imagen'),
(11641, 7, 'error_no_selected', 'specific', 'No seleccionado'),
(11642, 7, 'success_delete_all', 'specific', 'Eliminado con éxito'),
(11643, 7, 'text_login', 'specific', 'Iniciar sesión'),
(11644, 7, 'button_sign_in', 'specific', 'Ingresar'),
(11645, 7, 'text_forgot_password', 'specific', '¿Se te olvidó tu contraseña?'),
(11646, 7, 'title_forgot_password', 'specific', 'Se te olvidó tu contraseña'),
(11647, 7, 'text_forgot_password_instruction', 'specific', 'Escriba su correo electrónico. Le enviaremos un enlace, solo siga los pasos.'),
(11648, 7, 'button_close', 'specific', 'Cerrar'),
(11649, 7, 'login_success', 'specific', 'Inicio de sesión exitoso'),
(11650, 7, 'text_box_box_title', 'specific', 'Caja'),
(11651, 7, 'title_edit_store', 'specific', 'Editar tienda'),
(11652, 7, 'text_title', 'specific', 'Title'),
(11653, 7, 'label_invoice_prefix', 'specific', 'Prefijo de invocación'),
(11654, 7, 'label_logo_size', 'specific', 'Tamaño del logotipo'),
(11655, 7, 'label_favicon_size', 'specific', 'Tamaño del favicon'),
(11656, 7, 'text_event_sms', 'specific', 'SMS de eventos'),
(11657, 7, 'label_sms_for', 'specific', 'SMS para'),
(11658, 7, 'text_birthday', 'specific', 'Cumpleaños'),
(11659, 7, 'text_sms_list_title', 'specific', 'Lista de SMS'),
(11660, 7, 'text_report_title', 'specific', 'Reporte'),
(11661, 7, 'text_top_product', 'specific', 'Top Product'),
(11662, 7, 'text_others', 'specific', 'Otros'),
(11663, 7, 'text_profit_or_loss', 'specific', 'Ganancia o pérdida'),
(11664, 7, 'label_selling_price_tax', 'specific', 'Impuesto sobre el precio de venta'),
(11665, 7, 'label_sup_name', 'specific', 'NOMBRE'),
(11666, 7, 'title_sell_payment_report', 'specific', 'Informe de pago de venta'),
(11667, 7, 'text_sell_payment_report_title', 'specific', 'Informe de pago de venta'),
(11668, 7, 'title_purchase_payment_report', 'specific', 'Informe de pago de compra'),
(11669, 7, 'text_purchase_payment_report_title', 'specific', 'Informe de pago de compra'),
(11670, 7, 'title_sell_tax_report', 'specific', 'Informe de impuestos de venta'),
(11671, 7, 'text_sell_tax_report_title', 'specific', 'Informe de impuestos de venta'),
(11672, 7, 'text_product_tax_amount', 'specific', 'Impuesto sobre el producto'),
(11673, 7, 'text_order_tax_amount', 'specific', 'Impuesto de pedido'),
(11674, 7, 'text_tax_report_sub_title', 'specific', 'Informe de impuestos'),
(11675, 7, 'title_purchase_tax_report', 'specific', 'Informe de impuestos sobre compras'),
(11676, 7, 'text_purchase_tax_report_title', 'specific', 'Informe de impuestos sobre compras'),
(11677, 7, 'text_total_tax_amount', 'specific', 'Total Tax'),
(11678, 7, 'text_purchase_tax_report_sub_title', 'specific', 'Informe de impuestos de compra'),
(11679, 7, 'title_stock_report', 'specific', 'Informe de stock'),
(11680, 7, 'text_stock_report_title', 'specific', 'Informe de stock'),
(11681, 7, 'text_stock_report', 'specific', 'Informe de stock'),
(11682, 7, 'supplier_name', 'specific', 'Nombre del proveedor'),
(11683, 7, 'button_disabled', 'specific', 'Discapacitado'),
(11684, 7, 'title_purchase_transaction', 'specific', 'Transacción de compra'),
(11685, 7, 'text_purchase_transaction_title', 'specific', 'Transacción de compra'),
(11686, 7, 'text_transaction_title', 'specific', 'Transaction'),
(11687, 7, 'text_transaction_list_title', 'specific', 'LISTA TRANSACCIONES'),
(11688, 7, 'title_sell_transaction', 'specific', 'Vender transacción'),
(11689, 7, 'text_sell_transaction_title', 'specific', 'Vender transacción'),
(11690, 7, 'text_sell_transaction_list_title', 'specific', 'Vender lista de transacciones'),
(11691, 7, 'text_no_product', 'specific', 'No. Proudct'),
(11692, 7, 'title_category', 'specific', 'Categoría'),
(11693, 7, 'text_product_import_alert', 'specific', 'Alerta de importación de productos'),
(11694, 7, 'text_download', 'specific', 'Descargar'),
(11695, 7, 'title_expired', 'specific', 'Caducado'),
(11696, 7, 'text_expired_title', 'specific', 'Caducado'),
(11697, 7, 'text_expired_box_title', 'specific', 'Caducado'),
(11698, 7, 'button_expired', 'specific', 'Caducado'),
(11699, 7, 'button_expiring_soon', 'specific', 'Próximamente'),
(11700, 7, 'button_purchase_now', 'specific', 'Comprar ahora'),
(11701, 7, 'text_thumbnail', 'specific', 'Thumbnail'),
(11702, 7, 'text_unpaid', 'specific', 'Pendiente'),
(11703, 7, 'error_currency_title', 'specific', 'moneda no es válido'),
(11704, 7, 'error_reference_no', 'specific', 'Numero de referencia. no es válido'),
(11705, 7, 'error_date', 'specific', 'La fecha no es válida'),
(11706, 7, 'error_total_amount', 'specific', 'Total amount is not valid'),
(11707, 7, 'label_purchase_note', 'specific', 'Nota de compra'),
(11708, 7, 'text_purchase_update_success', 'specific', 'Actualizado exitosamente'),
(11709, 7, 'error_items', 'specific', 'Los artículos no son válidos'),
(11710, 7, 'error_store_id', 'specific', 'La tienda no es válida'),
(11711, 7, 'text_transfer_success', 'specific', 'Transferido con éxito'),
(11712, 7, 'button_transfer_edit', 'specific', 'Editar Transferencia'),
(11713, 7, 'text_update_transfer_status_success', 'specific', 'Actualizado exitosamente'),
(11714, 7, 'label_transferred_to', 'specific', 'TRANSFERIDO A'),
(11715, 7, 'text_product_list', 'specific', 'Lista de productos'),
(11716, 7, 'error_category_name', 'specific', 'El nombre de la categoría no es válido'),
(11717, 7, 'error_sup_name', 'specific', 'Suppllier name is not valid'),
(11718, 7, 'error_supplier_email_or_mobile', 'specific', 'El correo electrónico o el móvil no es válido'),
(11719, 7, 'error_sup_address', 'specific', 'La dirección del proveedor no es válida'),
(11720, 7, 'error_unit_name', 'specific', 'Unit name is not valid'),
(11721, 7, 'error_product_name', 'specific', 'El nombre del producto no es válido'),
(11722, 7, 'error_sup_id', 'specific', 'El proveedor no es válido'),
(11723, 7, 'text_product_name', 'specific', 'nombre del producto'),
(11724, 7, 'text_quantity', 'specific', 'Cantidad'),
(11725, 7, 'error_stock', 'specific', 'La cantidad de stock no es válida'),
(11726, 7, 'error_installment_count', 'specific', 'El recuento de cuotas no es válido'),
(11727, 7, 'text_activate_success', 'specific', 'Activado con éxito'),
(11728, 7, 'text_template_content_update_success', 'specific', 'Actualizado exitosamente'),
(11729, 7, 'text_template_css_update_success', 'specific', 'Actualizado exitosamente'),
(11730, 7, 'text_balance_update_success', 'specific', 'Actualizado exitosamente'),
(11731, 7, 'label_source', 'specific', 'Fuente'),
(11732, 7, 'label_slip_no', 'specific', 'Deslizamiento No.'),
(11733, 7, 'label_by', 'specific', 'Por'),
(11734, 7, 'text_deposit_success', 'specific', 'Depósito exitoso'),
(11735, 7, 'text_delete_title', 'specific', 'Eliminar'),
(11736, 7, 'text_delete_instruction', 'specific', '¿Qué se debe hacer con los datos que pertenecen al contenido?'),
(11737, 7, 'label_insert_content_to', 'specific', 'Insertar contenido en'),
(11738, 7, 'button_add_language', 'specific', 'Agregar idioma'),
(11739, 7, 'code', 'specific', 'code'),
(11740, 7, 'error_code', 'specific', 'El código no es válido'),
(11741, 7, 'text_uppdate_success', 'specific', 'Actualizado exitosamente'),
(11742, 7, 'error_name', 'specific', 'El nombre no es válido'),
(11743, 7, 'text_create_success', 'specific', 'Creado con éxito'),
(11744, 7, 'text_gremany', 'specific', 'Alemania'),
(11745, 7, 'text_amount', 'specific', 'Cantidad'),
(11746, 7, 'title_activity_logs', 'specific', 'Registros de actividad'),
(11747, 7, 'error_disabled_by_default', 'specific', 'Desactivado por defecto'),
(11748, 7, 'button_send_sms', 'specific', 'Enviar SMS'),
(11749, 7, 'button_email', 'specific', 'Correo electrónico'),
(11750, 7, 'error_status', 'specific', 'El estado no es válido'),
(11751, 7, 'error_reference_no_exist', 'specific', 'Árbitro. No. no es válido'),
(11752, 7, 'text_view_invoice_title', 'specific', 'View Invoice Title'),
(11753, 7, 'text_new_dashboard', 'specific', 'Nuevo tablero'),
(11754, 7, 'text_recent_customer_box_title', 'specific', 'Clientes recientes'),
(11755, 7, 'label_vat_number', 'specific', 'VAT Number'),
(11756, 7, 'title_quotation_edit', 'specific', 'Cotización Editar'),
(11757, 7, 'text_quotation_edit_title', 'specific', 'Cotización Editar'),
(11758, 7, 'text_quotation_update_success', 'specific', 'Actualizado exitosamente'),
(11759, 7, 'error_product_not_found', 'specific', 'Producto no encontrado'),
(11760, 7, 'error_invoice_product_type', 'specific', 'El tipo de producto de la factura no es válido'),
(11761, 7, 'label_checkout_status', 'specific', 'Estado de pago'),
(11762, 7, 'label_sub_total', 'specific', 'Sub total'),
(11763, 7, 'text_payments', 'specific', 'Pagos'),
(11764, 7, 'button_pay_now', 'specific', 'Pagar ahora'),
(11765, 7, 'text_billing_details', 'specific', 'Detalles de facturación'),
(11766, 7, 'Print Barcode', 'specific', 'undefined'),
(11767, 7, 'error_new_category_name', 'specific', 'Porfavor seleccione una categoría'),
(11768, 7, 'error_customer_name', 'specific', 'El nombre del cliente no es válido'),
(11769, 7, 'error_expired_date_below', 'specific', 'La fecha de vencimiento no es válida'),
(11770, 7, 'label_insert_invoice_to', 'specific', 'Insertar factura en'),
(11771, 7, 'error_new_customer_name', 'specific', 'Por favor seleccione un cliente'),
(11772, 7, 'button_transaction_list', 'specific', 'LISTA TRANSACCIONES'),
(11773, 7, 'error_code_name', 'specific', 'El nombre del código no es válido'),
(11774, 7, 'title_supplier_profile', 'specific', 'Perfil del proveedor'),
(11775, 7, 'text_supplier_profile_title', 'specific', 'Perfil del proveedor'),
(11776, 7, 'text_supplier_products', 'specific', 'Productos de proveedores'),
(11777, 7, 'button_products', 'specific', 'Productos'),
(11778, 7, 'text_balance_amount', 'specific', 'Balance total'),
(11779, 7, 'text_sells', 'specific', 'Venta'),
(11780, 7, 'text_purchase_invoice_list', 'specific', 'Lista de facturas de compra'),
(11781, 7, 'button_all_purchase', 'specific', 'Todas las compras'),
(11782, 7, 'button_due_purchase', 'specific', 'Compra vencida'),
(11783, 7, 'button_paid_purchase', 'specific', 'Compra pagada'),
(11784, 7, 'button_stock_transfer', 'specific', 'Transferencia de acciones'),
(11785, 7, 'text_selling_invoice_list', 'specific', 'Lista de facturas de venta'),
(11786, 7, 'error_account', 'specific', 'La cuenta no es válida'),
(11787, 7, 'error_ref_no', 'specific', 'Árbitro. No. no es válido'),
(11788, 7, 'error_about', 'specific', 'Acerca de no es válido'),
(11789, 7, 'error_title', 'specific', 'no es válido'),
(11790, 7, 'text_withdraw_success', 'specific', 'Creado con éxito'),
(11791, 7, 'error_from_account', 'specific', 'De la cuenta no es válida'),
(11792, 7, 'error_to_account', 'specific', 'To account is not valid'),
(11793, 7, 'error_same_account', 'specific', 'El receptor y el remitente no pueden ser iguales'),
(11794, 7, 'error_ref_no_exist', 'specific', 'Árbitro. No. ya existe'),
(11795, 7, 'error_account_name', 'specific', 'El nombre de la cuenta no es válido'),
(11796, 7, 'error_account_no', 'specific', 'Cuenta no. no es válido'),
(11797, 7, 'error_contact_person', 'specific', 'La persona de contacto no es válida'),
(11798, 7, 'error_phone_number', 'specific', 'El número de teléfono no es válido'),
(11799, 7, 'text_update_income_source_success', 'specific', 'Actualizado exitosamente'),
(11800, 7, 'error_new_source_name', 'specific', 'Seleccione una fuente'),
(11801, 7, 'text_delete_income_source_success', 'specific', 'Eliminado con éxito'),
(11802, 7, 'error_category_id', 'specific', 'El ID de categoría no es válido'),
(11803, 7, 'button_viefw', 'specific', 'View'),
(11804, 7, 'error_loan_from', 'specific', 'El préstamo de no es válido'),
(11805, 7, 'error_loan_headline', 'specific', 'préstamo no es válido'),
(11806, 7, 'error_loan_amount', 'specific', 'El monto del préstamo no es válido'),
(11807, 7, 'text_take_loan_success', 'specific', 'Creado con éxito'),
(11808, 7, 'error_paid_amount', 'specific', 'El monto pagado no es válido'),
(11809, 7, 'error_pay_amount_greater_than_due_amount', 'specific', 'El monto a pagar no puede ser mayor que el monto adeudado'),
(11810, 7, 'text_loan_paid_success', 'specific', 'Pagado exitosamente'),
(11811, 7, 'error_sms_text', 'specific', 'Ingrese un texto valido.'),
(11812, 7, 'text_success_sms_sent', 'specific', 'Mensaje enviado con éxito'),
(11813, 7, 'error_user_name', 'specific', 'user name is not valid'),
(11814, 7, 'error_user_email_or_mobile', 'specific', 'El correo electrónico o el móvil no es válido'),
(11815, 7, 'error_user_group', 'specific', 'User Group is not valid'),
(11816, 7, 'error_user_password_match', 'specific', 'Vuelva a escribir la contraseña no coincidió'),
(11817, 7, 'error_user_password_length', 'specific', 'User password length is not valid'),
(11818, 7, 'error_mobile', 'specific', 'El número de móvil no es válido'),
(11819, 7, 'error_email', 'specific', 'El correo no es válido'),
(11820, 7, 'error_zip_code', 'specific', 'Zip code is not valid'),
(11821, 7, 'error_addreess', 'specific', 'La dirección no es válida'),
(11822, 7, 'error_preference_receipt_template', 'specific', 'La plantilla de recibo no es válida'),
(11823, 7, 'error_currency', 'specific', 'La moneda no es válida'),
(11824, 7, 'error_brand_name', 'specific', 'Seleccione un nombre de marca'),
(11825, 7, 'title_brand_profile', 'specific', 'Perfil de marca'),
(11826, 7, 'text_brand_profile_title', 'specific', 'Perfil de marca'),
(11827, 7, 'text_brands', 'specific', 'Marcas'),
(11828, 7, 'text_brand_products', 'specific', 'Productos de marca'),
(11829, 7, 'button_all_products', 'specific', 'Todos los productos'),
(11830, 7, 'text_total_sell', 'specific', 'Total Venta'),
(11831, 7, 'label_brand_name', 'specific', 'Nombre de la marca'),
(11832, 7, 'label_insert_product_to', 'specific', 'Insertar producto en'),
(11833, 7, 'error_currency_code', 'specific', 'El código de moneda no es válido'),
(11834, 7, 'error_currency_symbol', 'specific', 'El símbolo de moneda no es válido'),
(11835, 7, 'error_currency_decimal_place', 'specific', 'El número decimal no es válido'),
(11836, 7, 'error_pmethod_name', 'specific', 'El método de pago no es válido'),
(11837, 7, 'label_invoice_to', 'specific', 'Factura a'),
(11838, 7, 'error_delete_unit_name', 'specific', 'Seleccione una unidad'),
(11839, 7, 'error_taxrate_name', 'specific', 'Taxrate name is not valid'),
(11840, 7, 'error_taxrate', 'specific', 'Taxrate is not valid');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(11841, 7, 'error_delete_taxrate_name', 'specific', 'Seleccione una tasa de impuestos'),
(11842, 7, 'error_box_name', 'specific', 'El nombre de la casilla no es válido'),
(11843, 7, 'error_delete_box_name', 'specific', 'Seleccione una casilla'),
(11844, 7, 'label_success', 'specific', 'Éxito'),
(11845, 7, 'title_customer_analysis', 'specific', 'Análisis de clientes'),
(11846, 7, 'error_not_found', 'specific', 'Extraviado'),
(11847, 7, 'placeholder_input_discount_amount', 'specific', 'Importe de descuento de entrada'),
(11848, 7, 'text_selling_tax', 'specific', 'Impuesto de venta'),
(11849, 7, 'text_igst', 'specific', 'IGST'),
(11850, 7, 'text_cgst', 'specific', 'CGST'),
(11851, 7, 'text_sgst', 'specific', 'SGST'),
(11852, 7, 'text_sell_due_paid_success', 'specific', 'Vencimiento pagado correctamente'),
(11853, 7, 'label_hsn_code', 'specific', 'Código HSN'),
(11854, 7, 'button_view_details', 'specific', 'View'),
(11855, 7, 'text_installment_details', 'specific', 'Detalles de pago'),
(11856, 7, 'label_initial_payment', 'specific', 'Pago inicial'),
(11857, 7, 'label_interval_count', 'specific', 'Recuento interno'),
(11858, 7, 'label_installment_count', 'specific', 'Recuento de cuotas'),
(11859, 7, 'label_last_installment_date', 'specific', 'Última fecha de pago'),
(11860, 7, 'label_installment_end_date', 'specific', 'Fecha de finalización del plazo'),
(11861, 7, 'text_update_installment_payment_success', 'specific', 'Pago a plazos exitoso'),
(11862, 7, 'error_amount_exceed', 'specific', 'Cantidad excedida'),
(11863, 7, 'label_gtin', 'specific', 'etiqueta gtin'),
(11864, 7, 'error_invoice_id', 'specific', 'La identificación de la factura no es válida'),
(11865, 7, 'button_due_invoice_list', 'specific', 'botón lista de facturas vencidas'),
(11866, 7, 'text_substract_amount', 'specific', 'cantidad de sustracción de texto'),
(11867, 7, 'title_log_in', 'specific', 'Login'),
(11868, 7, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;font-weight:bold&quot; href=&quot;http://docs.itsolution24.com/pos/&quot;&gt;Online Documentation&lt;/a&gt;  |  &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(11869, 7, 'error_disabled_in_demo', 'specific', 'This feature is disable in error!'),
(11870, 7, 'error_purchase_price', 'specific', 'precio de compra de error'),
(11871, 7, 'text_barcode_print', 'specific', 'impresión de código de barras de texto'),
(11872, 7, 'button_semd_email', 'specific', 'botón de correo electrónico semd'),
(11873, 7, 'error_email_not_sent', 'specific', 'correo electrónico de error no enviado'),
(11874, 7, 'text_success_email_sent', 'specific', 'mensaje de texto exitoso correo electrónico enviado'),
(11875, 7, 'button_installment_payment', 'specific', 'botón de pago a plazos'),
(11876, 7, 'error_out_of_stock', 'specific', 'error agotado'),
(11877, 7, 'xxx', 'specific', 'xxx'),
(11878, 7, 'error_login', 'specific', 'error de inicio de sesión'),
(11879, 7, 'text_purchase_due_paid_success', 'specific', 'compra por mensaje de texto debido al éxito pagado'),
(11880, 7, 'text_trash', 'specific', 'basura de texto'),
(11881, 7, 'button_restore_all', 'specific', 'Restaura todo'),
(11882, 7, 'success_restore_all', 'specific', 'éxito restaurar todo'),
(11883, 7, 'title_customer_statement', 'specific', 'declaración de título del cliente'),
(11884, 7, 'text_statement_title', 'specific', 'TRANSACCIONES'),
(11885, 7, 'error_return_quantity_exceed', 'specific', 'la cantidad devuelta por error excede'),
(11886, 7, 'label_transferred_from', 'specific', 'etiqueta transferida desde'),
(11887, 7, 'text_disabled', 'specific', 'texto deshabilitado'),
(11888, 7, 'text_gtin', 'specific', 'texto gtin'),
(11889, 7, 'text_balance', 'specific', 'SALDO'),
(11890, 7, 'error_invalid_username_password', 'specific', 'error contraseña de nombre de usuario no válida'),
(11891, 7, 'error_installment_interest_percentage', 'specific', 'porcentaje de interés de la cuota de error'),
(11892, 7, 'error_installment_interest_amount', 'specific', 'cantidad de interés de la cuota de error'),
(11893, 7, 'button_resend', 'specific', 'Reenviar'),
(11894, 7, 'error_sms_not_sent', 'specific', 'sms de error no enviado'),
(11895, 7, 'text_sms_logs_title', 'specific', 'título de los registros de SMS de texto'),
(11896, 7, 'error_mobile_exist', 'specific', 'error móvil existe'),
(11897, 7, 'text_success_sms_schedule', 'specific', 'programa de SMS de éxito de texto'),
(11898, 7, 'text_success_sms_added_to_schedule', 'specific', 'SMS de texto de éxito agregado a la programación'),
(11899, 7, 'error_gateway', 'specific', 'puerta de enlace de error'),
(11900, 7, 'error_sms_not_send', 'specific', 'Error Enviando Mensaje'),
(11901, 7, 'invoice_sms_text', 'specific', 'Estimado [customer_name], ID de factura: [invoice_id], Pagadero: [monto_pagable], Pagado: [monto_pagado], Vencimiento: [vencimiento]. Compra a las [fecha_hora]. Saludos, [store_name], [address]'),
(11902, 7, 'text_urdu', 'specific', 'texto en urdu'),
(11903, 7, 'error_default_language', 'specific', 'error idioma predeterminado'),
(11904, 7, 'error_active_or_sold', 'specific', 'Ya realizo ventas de esta compra.'),
(11905, 7, 'title_home', 'specific', 'Hogar'),
(11906, 7, 'error_supplier_name', 'specific', 'No se puede eliminar'),
(11907, 7, 'error_expired_date_belowx', 'specific', 'fecha de vencimiento del error a continuaciónx'),
(11908, 7, 'title_categories', 'specific', 'categorías de títulos'),
(11909, 7, 'title_products', 'specific', 'Productos'),
(11910, 7, 'title_shop_on_sale', 'specific', 'tienda de títulos a la venta'),
(11911, 7, 'title_cart', 'specific', 'Carro'),
(11912, 7, 'title_wishlist', 'specific', 'lista de deseos de título'),
(11913, 7, 'title_account', 'specific', 'cuenta de título'),
(11914, 7, 'title_contact', 'specific', 'título de contacto'),
(11915, 7, 'title_contact_us', 'specific', 'título contáctenos'),
(11916, 7, 'title_return_refund', 'specific', 'reembolso de devolución de título'),
(11917, 7, 'title_faq', 'specific', 'preguntas frecuentes sobre el título'),
(11918, 7, 'title_terms_condition', 'specific', 'condición de los términos del título'),
(11919, 7, 'title_support', 'specific', 'soporte de título'),
(11920, 7, 'title_login', 'specific', 'título de inicio de sesión'),
(11921, 7, 'title_about', 'specific', 'título sobre'),
(11922, 7, 'text_restore_completed', 'specific', 'Restaurado completado con éxito'),
(11923, 7, 'error_receipt_printer', 'specific', 'La impresora de recibos no es válida'),
(11924, 7, 'title_checkout', 'specific', 'Revisa'),
(11925, 7, 'text_are_you_sure', 'specific', '¿Estás seguro?'),
(11926, 7, 'text_store_access_success', 'specific', 'Tienda activada correctamente'),
(11927, 7, 'title_cart_empty', 'specific', 'El carrito esta vacío'),
(11928, 7, 'title_payment', 'specific', 'Pago'),
(11929, 7, 'error_installment_duration', 'specific', 'La duración del plazo no es válida'),
(11930, 7, 'error_password_mismatch', 'specific', 'Confirme que la contraseña no coincide'),
(11931, 7, 'error_email_exist', 'specific', '¡El Email ya existe!'),
(11932, 7, 'error_invalid_purchase_code', 'specific', 'Código de compra no válido'),
(11933, 7, 'error_printer_ip_address_or_port', 'specific', 'Dirección IP o puerto'),
(11934, 7, 'error_printer_path', 'specific', 'Ruta de la impresora'),
(11935, 7, 'text_barcode_print', 'specific', 'Impresión de código de barras'),
(11936, 7, 'error_invalid_username_password', 'specific', 'El nombre de usuario o la contraseña no son válidos'),
(11937, 7, 'text_order', 'specific', 'Orden'),
(11938, 7, 'menu_order', 'specific', 'Orden'),
(11939, 7, 'menu_hold_order', 'specific', 'Mantener Orden'),
(11940, 7, 'menu_stock_transfer', 'specific', 'Transferencia De Acciones'),
(11941, 7, 'button_gift_card', 'specific', 'Tarjeta de regalo'),
(11942, 7, 'placeholder_input_discount_amount', 'specific', 'Importe de descuento'),
(11943, 7, 'text_sell_due_paid_success', 'specific', 'Pagado exitosamente'),
(11944, 7, 'button_due_invoice_list', 'specific', 'Lista de facturas vencidas'),
(11945, 7, 'error_pmethod_id', 'specific', 'El método de pago no es válido'),
(11946, 7, 'button_sell_product', 'specific', 'Vender Producto'),
(11947, 7, 'error_pmethod_code', 'specific', 'El código del método de pago no es válido'),
(11948, 7, 'invoice_sms_text', 'specific', 'SMS'),
(11949, 7, 'error_installment_duration', 'specific', 'La duración del plazo no es válida'),
(11950, 7, 'button_view_details', 'specific', 'View Details'),
(11951, 7, 'text_installment_details', 'specific', 'Detalles de pago'),
(11952, 7, 'label_initial_payment', 'specific', 'Pago inicial'),
(11953, 7, 'label_interval_count', 'specific', 'Recuento de intervalos'),
(11954, 7, 'label_installment_count', 'specific', 'Recuento de cuotas'),
(11955, 7, 'label_last_installment_date', 'specific', 'Última fecha de pago'),
(11956, 7, 'label_installment_end_date', 'specific', 'Fecha de finalización de la instalación'),
(11957, 7, 'text_all_due', 'specific', 'Todo debido'),
(11958, 7, 'button_purchase', 'specific', 'Compra'),
(11959, 7, 'error_login_attempt', 'specific', 'Error al intentar iniciar sesión'),
(11960, 7, 'error_login_attempt_exceed', 'specific', 'Intento de inicio de sesión superado'),
(11961, 7, 'error_login_attempts_exceeded', 'specific', 'Se superó el intento de inicio de sesión'),
(11962, 7, 'error_mobile_exist', 'specific', 'El número de móvil ya existe.'),
(11963, 7, 'error_login', 'specific', 'Error de inicio de sesión.'),
(11964, 7, 'button_product_purchase', 'specific', 'Compra de producto'),
(11965, 7, 'label_change', 'specific', 'Cambio'),
(11966, 7, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(11967, 7, 'error_disabled_in_demo', 'specific', 'This feature disabled in demo.'),
(11968, 7, 'error_amount_exceed', 'specific', 'Se supera la cantidad.'),
(11969, 7, 'title_customer_transaction', 'specific', 'Transacción del cliente'),
(11970, 7, 'text_customer_transaction_title', 'specific', 'Transacción del cliente'),
(11971, 7, 'text_customer_transaction_list_title', 'specific', 'Lista de transacciones del cliente'),
(11972, 7, 'title_supplier_transaction', 'specific', 'Transacción del proveedor'),
(11973, 7, 'text_supplier_transaction_title', 'specific', 'Transacción del proveedor'),
(11974, 7, 'error_activate_permission', 'specific', 'El permiso de activación no es válido.'),
(11975, 7, 'error_discount_amount_exceed', 'specific', 'La cantidad de descuento excede'),
(11976, 7, 'text_returns', 'specific', 'Devolucionesdddd'),
(11977, 7, 'label_sup_id', 'specific', 'PROVEEDOR'),
(11978, 7, 'label_delete_all', 'specific', 'Eliminar todos'),
(11979, 7, 'label_insert_store_to', 'specific', 'Insertar tienda en'),
(11980, 7, 'label_insert_store_content_into', 'specific', 'Insertar contenido en'),
(11981, 7, 'error_store_name', 'specific', 'El nombre de la tienda no es válido'),
(11982, 7, 'error_email_exist', 'specific', 'Ya existe el correo electrónico'),
(11983, 7, 'error_customer_gift_card_exist', 'specific', 'La tarjeta de regalo del cliente ya existe'),
(11984, 7, 'label_transferred_from', 'specific', 'TRANSFERIDO DESDE'),
(11985, 7, 'text_download_samdple_format_file', 'specific', 'Descargar formato de muestra'),
(11986, 7, 'store_code 1 is not valid!', 'specific', 'El código de tienda no es válido'),
(11987, 7, 'text_purchase_due_paid_success', 'specific', 'Pagado exitosamente'),
(11988, 7, 'error_invalid_balance', 'specific', 'Saldo inválido'),
(11989, 7, 'button_installment_payment', 'specific', 'Pago de instalación'),
(11990, 7, 'text_update_installment_payment_success', 'specific', 'Pago a plazos actualizado correctamente'),
(11991, 7, 'error_email_address', 'specific', 'La dirección de correo electrónico es inválida'),
(11992, 7, 'email_sent_successful', 'specific', 'Correo electrónico enviado correctamente'),
(11993, 7, 'error_id', 'specific', 'La identificación no es válida'),
(11994, 7, 'store_code store2 is not valid!', 'specific', '¡el código de tienda store2 no es válido!'),
(11995, 7, 'error_xls_sheet_not_found', 'specific', 'error hoja xls no encontrada'),
(11996, 7, 'text_delete_holding_order_success', 'specific', 'Orden de pedido eliminada correctamente'),
(11997, 7, 'text_expired_listing_title', 'specific', 'Listado caducado'),
(11998, 7, 'label_item_quantity', 'specific', 'cantidad de objetos'),
(11999, 7, 'error_source', 'specific', 'La fuente no es válida'),
(12000, 7, 'label_returned_at', 'specific', 'Devuelto en'),
(12001, 7, 'error_print_permission', 'specific', 'You don\'t have permission in printing.'),
(12002, 7, 'text_due_incoice', 'specific', 'Factura vencida'),
(12003, 7, 'text_loan_details', 'specific', 'Detalles del préstamo'),
(12004, 7, 'label_paid_by', 'specific', 'Pagado por'),
(12005, 7, 'button_conform_order', 'specific', 'orden confirmada'),
(12006, 7, 'text_order_successfully_placed', 'specific', 'Pedido realizado correctamente'),
(12007, 7, 'text_order_placed', 'specific', 'Pedido realizado'),
(12008, 7, 'title_order_placed', 'specific', 'Pedido realizado correctamente'),
(12009, 7, 'error_address', 'specific', 'El campo de dirección es obligatorio'),
(12010, 7, 'error_current_password', 'specific', 'contraseña actual'),
(12011, 7, 'error_new_password', 'specific', 'Nueva contraseña'),
(12012, 7, 'error_current_password_not_matched', 'specific', '¡Las contraseñas no coinciden!'),
(12013, 7, 'text_password_update_success', 'specific', 'Contraseña actualizada exitosamente'),
(12014, 7, 'error_full_name', 'specific', 'Nombre completo'),
(12015, 7, 'title_register', 'specific', 'Registrarse'),
(12016, 7, 'error_record_not_found', 'specific', '¡Recuperado no encontrado!'),
(12017, 7, 'text_account_created', 'specific', 'Cuenta creada con éxito'),
(12018, 7, 'text_login_success', 'specific', 'Iniciar sesión correctamente'),
(12019, 7, 'title_view_order', 'specific', 'View Order'),
(12020, 7, 'title_order', 'specific', 'Orden'),
(12021, 7, 'text_new_order_title', 'specific', 'Nuevo orden'),
(12022, 7, 'text_order_list_title', 'specific', 'Lista de orden'),
(12023, 7, 'label_shipping_and_billing_address', 'specific', 'Envío'),
(12024, 7, 'label_order_status', 'specific', 'Estado del pedido'),
(12025, 7, 'title_order_edit', 'specific', 'Editar orden'),
(12026, 7, 'text_order_edit_title', 'specific', 'Editar orden'),
(12027, 7, 'text_order_update_success', 'specific', 'Pedido actualizado correctamente'),
(12028, 7, 'label_insert_content_into', 'specific', 'Insertar contenido en'),
(12029, 7, 'label_delete_the_product', 'specific', 'Eliminar el producto'),
(12030, 7, 'label_soft_delete_the_product', 'specific', 'Eliminación suave del producto'),
(12031, 7, 'error_phone_exist', 'specific', 'El número de teléfono ya existe'),
(12032, 7, 'title_stores', 'specific', 'Historias'),
(12033, 7, 'text_email_update_success', 'specific', 'Actualizado exitosamente'),
(12034, 7, 'text_phone_update_success', 'specific', 'Número de teléfono actualizado correctamente'),
(12035, 7, 'text_phone_number_update_success', 'specific', 'Número de teléfono actualizado correctamente'),
(12036, 7, 'label_link', 'specific', 'Enlace'),
(12037, 7, 'error_unit_code', 'specific', 'El código de la unidad no es válido'),
(12038, 7, 'error_service_can_not_be_returned', 'specific', 'El servicio no se puede devolver'),
(12039, 7, 'error_invalid_product_type', 'specific', 'El tipo de producto no es válido'),
(12040, 7, 'error_invalid_barcode_symbology', 'specific', 'La simbología del código de barras no es válida'),
(12041, 7, 'store_code store1111 is not valid!', 'specific', 'El código de tienda no es válido'),
(12042, 7, 'error_category_slug', 'specific', 'La babosa de categoría no es válida'),
(12043, 7, 'error_invalid_category_slug', 'specific', 'La babosa de categoría no es válida'),
(12044, 7, 'error_invalid_unit_code', 'specific', 'El código de la unidad no es válido'),
(12045, 7, 'error_invalid_taxrate_code', 'specific', 'Taxrate code is not valid'),
(12046, 7, 'error_invalid_tax_method', 'specific', 'Tax method is not valid'),
(12047, 7, 'error_invalid_supplier_code', 'specific', 'El código del proveedor no es válido'),
(12048, 7, 'error_invalid_brand_code', 'specific', 'El código de marca no es válido'),
(12049, 7, 'error_invalid_box_code', 'specific', 'El código de la casilla no es válido'),
(12050, 7, 'error_invalid_cost_price', 'specific', 'El precio de costo no es válido'),
(12051, 7, 'error_product_item', 'specific', 'Agregue un producto al menos'),
(12052, 7, 'error_payment_method', 'specific', ''),
(12053, 7, 'store_code store1 is not valid!', 'specific', ''),
(12054, 7, 'error_customer_email_or_mobile', 'specific', 'Error de correo electrónico del cliente o móvil'),
(12055, 7, 'label_document', 'specific', 'N° IDENTIFICACION'),
(12056, 7, 'error_customer_sex', 'specific', ''),
(12057, 7, 'text_soft_delete', 'specific', NULL),
(12058, 7, 'label_delete_all_content', 'specific', NULL),
(12059, 7, 'label_document', 'specific', 'NIT/C.C'),
(12060, 7, 'error_product_exist', 'specific', NULL),
(12061, 7, 'label_consecutive', 'specific', 'CONSECUTIVO ACTUAL'),
(12062, 7, 'label_since', 'specific', 'CONSECUTIVO DESDE'),
(12063, 7, 'label_until', 'specific', 'CONSECUTIVO HASTA'),
(12064, 7, 'label_resolution', 'specific', 'RESOLUCION'),
(12065, 7, 'label_regime', 'specific', 'REGIMEN'),
(12066, 7, 'label_date_since', 'specific', 'FECHA RESOLUCION'),
(12067, 7, 'error_cashier_name', 'specific', NULL),
(12068, 7, 'error_preference_tax', 'specific', 'impuesto de preferencia'),
(12069, 7, 'label_unit_discount', 'specific', '%DESCUENTO'),
(12070, 7, 'código de tienda store1 No es válido!', 'specific', NULL),
(12071, 7, '', 'specific', NULL),
(12072, 7, 'label_document', 'specific', 'Documento'),
(12073, 2, 'text_unpaid', 'specific', NULL),
(12074, 2, 'button_view_details', 'specific', NULL),
(12075, 2, 'text_paid', 'specific', NULL),
(12076, 2, 'button_return', 'specific', NULL),
(12077, 2, 'button_view_receipt', 'specific', NULL),
(12078, 2, 'title_filemanager', 'specific', NULL),
(12079, 7, 'error_read_permission', 'specific', NULL),
(12080, 7, 'error_preference_datatable_item_limit', 'specific', 'Limite de elemtos'),
(12081, 7, 'error_invalid_gateway', 'specific', 'Error de puerta de enlace no válida'),
(12082, 7, 'text_sms_sent', 'specific', 'Mensaje enviado con éxito 2'),
(12083, 7, 'label_password_old', 'specific', NULL),
(12084, 7, 'error_product_tax', 'specific', NULL),
(12085, 7, 'error_product_price', 'specific', NULL),
(12086, 7, 'text_delete', 'specific', NULL),
(12087, 7, 'error_password', 'specific', NULL),
(12088, 7, 'error_username', 'specific', NULL),
(12089, 7, 'código de tienda Mi Tienda No es válido!', 'specific', NULL),
(12090, 7, 'error_delete_duration_expired', 'specific', NULL),
(12091, 7, 'error_invalid_file', 'specific', NULL),
(12092, 7, 'error_user_not_found', 'specific', NULL),
(12093, 7, 'error_invoice_product_price', 'specific', NULL),
(12094, 7, 'error_email_permission', 'specific', NULL),
(12095, 7, 'text_add_product', 'specific', NULL),
(12096, 2, 'title_user_preference', 'specific', NULL),
(12097, 2, 'text_user_preference_title', 'specific', NULL),
(12098, 2, 'text_language_preference_title', 'specific', NULL),
(12099, 2, 'label_select_language', 'specific', NULL),
(12100, 2, 'text_color_preference_title', 'specific', NULL),
(12101, 2, 'label_base_color', 'specific', NULL),
(12102, 2, 'text_color_black', 'specific', NULL),
(12103, 2, 'text_color_blue', 'specific', NULL),
(12104, 2, 'text_color_green', 'specific', NULL),
(12105, 2, 'text_color_red', 'specific', NULL),
(12106, 2, 'text_color_yellow', 'specific', NULL),
(12107, 2, 'text_pos_side_panel_position_title', 'specific', NULL),
(12108, 2, 'label_pos_side_panel_position', 'specific', NULL),
(12109, 2, 'text_right', 'specific', NULL),
(12110, 2, 'text_left', 'specific', NULL),
(12111, 2, 'text_pos_pattern_title', 'specific', NULL),
(12112, 2, 'label_select_pos_pattern', 'specific', NULL),
(12113, 2, 'button_update', 'specific', NULL),
(12114, 2, 'text_success', 'specific', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `loan_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `amount` decimal(25,4) UNSIGNED NOT NULL,
  `interest` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable` decimal(25,4) UNSIGNED NOT NULL,
  `paid` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `attachment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `lloan_id` int(11) UNSIGNED NOT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `paid` decimal(25,4) NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_by` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `status` enum('success','error') NOT NULL DEFAULT 'success',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `username`, `ip`, `status`, `created_at`) VALUES
(2, 1, 'admin@nacionalcode.com', '181.51.193.58', 'success', NULL),
(3, 1, 'admin@nacionalcode.com', '181.51.193.58', 'success', NULL),
(4, 1, 'admin@nacionalcode.com', '181.51.193.58', 'success', NULL),
(5, 1, 'admin@nacionalcode.com', '190.61.58.45', 'success', NULL),
(7, 1, 'admin@nacionalcode.com', '186.178.65.127', 'success', NULL),
(8, 1, 'admin@nacionalcode.com', '138.121.113.221', 'success', NULL),
(10, 1, 'admin@nacionalcode.com', '190.242.26.151', 'success', NULL),
(11, 1, 'admin@nacionalcode.com', '181.206.103.30', 'success', NULL),
(12, 1, 'admin@nacionalcode.com', '200.68.138.38', 'success', NULL),
(13, 1, 'admin@nacionalcode.com', '181.54.217.100', 'success', NULL),
(14, 1, 'admin@nacionalcode.com', '186.42.18.65', 'success', NULL),
(15, 1, 'admin@nacionalcode.com', '2800:bf0:81c1:3007:41a:5585:a30:9b18', 'success', NULL),
(16, 1, 'admin@nacionalcode.com', '186.112.109.106', 'success', NULL),
(17, 1, 'admin@nacionalcode.com', '201.108.103.36', 'success', NULL),
(18, 1, 'admin@nacionalcode.com', '2800:bf0:8042:bc:24d2:cbf4:232c:7a4a', 'success', NULL),
(19, 1, 'admin@nacionalcode.com', '190.233.5.156', 'success', NULL),
(20, 1, 'admin@nacionalcode.com', '190.63.116.110', 'success', NULL),
(21, 1, 'admin@gmail.com', '181.176.82.118', 'success', NULL),
(22, 1, 'admin@gmail.com', '181.224.201.119', 'success', NULL),
(23, 1, 'admin@gmail.com', '181.176.82.118', 'success', NULL),
(24, 1, 'admin@gmail.com', '181.176.82.118', 'success', NULL),
(25, 3, 'vendedor@gmail.com', '181.176.82.118', 'success', NULL),
(32, 3, 'vendedor@gmail.com', '181.176.82.118', 'success', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mail_sms_tag`
--

CREATE TABLE `mail_sms_tag` (
  `tag_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `tagname` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `mail_sms_tag`
--

INSERT INTO `mail_sms_tag` (`tag_id`, `type`, `tagname`, `created_at`) VALUES
(1, 'invoice', '[customer_name]', '2019-03-08 14:50:39'),
(2, 'invoice', '[payable_amount]', '2019-07-02 12:12:59'),
(3, 'invoice', '[paid_amount]', '2019-07-02 12:13:02'),
(4, 'invoice', '[due]', '2019-07-02 12:13:04'),
(5, 'invoice', '[store_name]', '2019-07-02 12:13:07'),
(6, 'invoice', '[payment_status]', '2019-07-02 12:13:09'),
(7, 'invoice', '[customer_mobile]', '2019-07-02 12:13:11'),
(8, 'invoice', '[payment_method]', '2019-07-02 12:13:13'),
(9, 'invoice', '[date_time]', '2019-07-02 12:13:15'),
(10, 'invoice', '[date]', '2019-07-02 12:13:18'),
(11, 'invoice', '[tax]', '2019-07-02 12:13:20'),
(12, 'invoice', '[discount]', '2019-07-02 12:13:21'),
(13, 'invoice', '[address]', '2019-07-02 12:13:23'),
(14, 'invoice', '[invoice_id]', '2019-07-02 12:13:28'),
(15, 'invoice', '[invoice_id]', '2019-07-02 12:13:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sell',
  `is_profit` tinyint(1) NOT NULL DEFAULT 1,
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `pmethod_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `capital` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `details` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `total_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `type`, `is_profit`, `is_hide`, `store_id`, `invoice_id`, `reference_no`, `pmethod_id`, `transaction_id`, `capital`, `amount`, `details`, `attachment`, `note`, `total_paid`, `pos_balance`, `created_by`, `created_at`) VALUES
(2, 'sell', 1, 0, 1, '12022/00000001', NULL, 1, NULL, 7.0000, 10.0000, 'a:0:{}', NULL, '', 10.0000, 0.0000, 1, '2022-01-17 07:03:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pmethods`
--

CREATE TABLE `pmethods` (
  `pmethod_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `pmethods`
--

INSERT INTO `pmethods` (`pmethod_id`, `name`, `code_name`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Efectivo', 'efectivo', 'Pago con moneda local', '2018-03-23 18:00:00', '2019-05-08 18:18:30'),
(5, 'Transferencia', 'transferencia', '', '2021-03-05 15:53:50', NULL),
(6, 'Tarjeta Debito', 'tarjeta_debito', '', '2021-03-05 15:54:28', NULL),
(7, 'Tarjeta Credito', 'tarjeta_credito', '', '2021-03-05 15:54:49', NULL),
(8, 'Cheque', 'cheque', '', '2021-03-05 15:55:14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pmethod_to_store`
--

CREATE TABLE `pmethod_to_store` (
  `p2s_id` int(11) NOT NULL,
  `ppmethod_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `pmethod_to_store`
--

INSERT INTO `pmethod_to_store` (`p2s_id`, `ppmethod_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 1, 1, 2),
(4, 4, 1, 1, 4),
(5, 3, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pos_register`
--

CREATE TABLE `pos_register` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `opening_balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `closing_balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `note` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pos_templates`
--

CREATE TABLE `pos_templates` (
  `template_id` int(10) NOT NULL,
  `template_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `template_content` longtext CHARACTER SET ucs2 COLLATE ucs2_general_ci NOT NULL,
  `template_css` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `pos_templates`
--

INSERT INTO `pos_templates` (`template_id`, `template_name`, `template_content`, `template_css`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Default', '&lt;section class=&quot;receipt-template&quot;&gt;\n\n        &lt;header class=&quot;receipt-header&quot;&gt;\n            &lt;div class=&quot;logo-area&quot;&gt;\n                &lt;img class=&quot;logo&quot; src=&quot;{{ logo_url }}&quot;&gt;\n            &lt;/div&gt;\n            &lt;h2 class=&quot;store-name&quot;&gt;{{ store_name }}&lt;/h2&gt;\n            &lt;div class=&quot;address-area&quot;&gt;\n                &lt;span class=&quot;info address&quot;&gt;{{ store_address }}&lt;/span&gt;\n                &lt;div class=&quot;block&quot;&gt;\n                    &lt;span class=&quot;info phone&quot;&gt;Mobile: {{ store_phone }}&lt;/span&gt;, &lt;span class=&quot;info email&quot;&gt;Email: {{ store_email }}&lt;/span&gt;\n                &lt;/div&gt;\n            &lt;/div&gt;\n        &lt;/header&gt;\n        \n        &lt;section class=&quot;info-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Invoice ID:&lt;/td&gt;\n                    &lt;td&gt;{{ invoice_id }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;VAT-Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ vat_reg }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Date:&lt;/td&gt;\n                    &lt;td&gt;{{ date_time }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;GST Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ gst_reg }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Customer Name:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_name }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Phone:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_phone }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Address:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_address }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;GTIN:&lt;/td&gt;\n                    &lt;td&gt;{{ gtin }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;h4 class=&quot;main-title&quot;&gt;INVOICE&lt;/h4&gt;\n        \n        {{ if items }}\n        &lt;section class=&quot;listing-area item-list&quot;&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;tr&gt;\n                        &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                        &lt;td class=&quot;w-40 text-center&quot;&gt;Name&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-center&quot;&gt;Qty&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-right&quot;&gt;Price&lt;/td&gt;\n                        &lt;td class=&quot;w-20 text-right&quot;&gt;Amount&lt;/td&gt;\n                    &lt;/tr&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ items }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ item_name }} \n                                {{ if invoice_view == indian_gst }} \n                                    &lt;small&gt;[HSN-{{ hsn_code }}]&lt;/small&gt;\n                                {{ endif }}\n                            &lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_quantity }} {{ unitName }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_price }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt;   \n                        &lt;/tr&gt;\n                    {{ /items }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area calculation-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Amt:&lt;/td&gt;\n                    &lt;td&gt;{{ subtotal }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Order Tax:&lt;/td&gt;\n                    &lt;td&gt;{{ order_tax }}&lt;/td&gt;\n                &lt;/tr&gt;\n                {{ if invoice_view == \'indian_gst\' }}\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;CGST:&lt;/td&gt;\n                    &lt;td&gt;{{ cgst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;SGST:&lt;/td&gt;\n                    &lt;td&gt;{{ sgst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;IGST:&lt;/td&gt;\n                    &lt;td&gt;{{ igst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                {{ endif }}\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Discount:&lt;/td&gt;\n                    &lt;td&gt;{{ discount_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Shipping Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ shipping_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Others Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ others_charge }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Previous Due:&lt;/td&gt;\n                    &lt;td&gt;{{ previous_due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Due:&lt;/td&gt;\n                    &lt;td&gt;{{ payable_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ paid_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Prev. Due Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ prev_due_paid }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Change:&lt;/td&gt;\n                    &lt;td&gt;{{ change }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Due:&lt;/td&gt;\n                    &lt;td&gt;{{ due }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area italic&quot;&gt;\n            &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;In Text:&lt;/b&gt; {{ amount_in_text }}&lt;/span&gt;&lt;br&gt;\n            {{ if invoice_note }}\n                &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;Note:&lt;/b&gt; {{ invoice_note }}&lt;/span&gt;\n            {{ endif }}\n        &lt;/section&gt;\n\n        {{ if return_items }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Returns&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-5 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Returned at&lt;/td&gt;\n                    &lt;td class=&quot;w-30 text-center&quot;&gt;Item Name&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Amt&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{return_items}}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_quantity }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{/return_items}}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        \n        {{ if payments }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Payments&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-50 text-center&quot;&gt;Payment Method&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Amount&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Balance&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ payments }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ name }} by {{ by }} on {{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ amount }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ pos_balance }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /payments }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n           \n        {{ if invoice_view != \'standard\' }}\n        {{ if taxes }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Tax Information&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-25&quot;&gt;Name&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Code&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Tax Amt.&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ taxes }}\n                        &lt;tr&gt;\n                            &lt;td&gt;{{ taxrate_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ code_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ qty }}&lt;/td&gt; \n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_tax }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /taxes }}\n                    {{ if invoice_view == \'indian_gst\' }}\n                        &lt;tr class=&quot;bg-gray&quot;&gt;\n                            &lt;td&gt;Order Tax: {{ order_tax }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;CGST: {{ cgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;SGST: {{ sgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;IGST: {{ igst }}&lt;/td&gt;\n                        &lt;/tr&gt;\n                     {{ endif }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        {{ endif }}\n        \n        {{ if barcode }}\n        &lt;section class=&quot;info-area barcode-area&quot;&gt;\n            {{ barcode }}\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area align-center footer-area&quot;&gt;\n            &lt;span class=&quot;block&quot;&gt;Sold product No Claim. No Change, New product One Month Warranty.&lt;/span&gt;\n            &lt;span class=&quot;block bold&quot;&gt;{{ footer_text }}&lt;/span&gt;\n        &lt;/section&gt;\n        \n &lt;/section&gt;', '/*Common CSS*/\n        .receipt-template {\n            width:302px;\n            margin:0 auto;\n        }\n        .receipt-template .text-small {\n            font-size: 10px;\n        }\n        .receipt-template .block {\n            display: block;\n        }\n        .receipt-template .inline-block {\n            display: inline-block;\n        }\n        .receipt-template .bold {\n            font-weight: 700;\n        }\n        .receipt-template .italic {\n            font-style: italic;\n        }\n        .receipt-template .align-right {\n            text-align: right;\n        }\n        .receipt-template .align-center {\n            text-align: center;\n        }\n        .receipt-template .main-title {\n            font-size: 14px;\n            font-weight: 700;\n            text-align: center;\n            margin: 10px 0 5px 0;\n            padding: 0;\n        }\n        .receipt-template .heading {\n            position: relation;\n        }\n        .receipt-template .title {\n            font-size: 16px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template .sub-title {\n            font-size: 12px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template table {\n            width: 100%;\n        }\n        .receipt-template td,\n        .receipt-template th {\n            font-size:12px;\n        }\n        .receipt-template .info-area {\n            font-size: 12px;      \n            line-height: 1.222;  \n        }\n        .receipt-template .listing-area {\n            line-height: 1.222;\n        }\n        .receipt-template .listing-area table {}\n        .receipt-template .listing-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n            font-weight: 700;\n        }\n        .receipt-template .listing-area table tbody tr {\n            border-top: 1px dashed #000;\n            border-bottom: 1px dashed #000;\n        }\n        .receipt-template .listing-area table tbody tr:last-child {\n            border-bottom: none;\n        }\n        .receipt-template .listing-area table td {\n            vertical-align: top;\n        }\n        .receipt-template .info-area table {}\n        .receipt-template .info-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n        }\n    \n /*Receipt Heading*/\n        .receipt-template .receipt-header {\n            text-align: center;\n        }\n        .receipt-template .receipt-header .logo-area {\n            width: 80px;\n            height: 80px;\n            margin: 0 auto;\n        }\n        .receipt-template .receipt-header .logo-area img.logo {\n            display: inline-block;\n            max-width: 100%;\n            max-height: 100%;\n        }\n        .receipt-template .receipt-header .address-area {\n            margin-bottom: 5px;\n            line-height: 1;\n        }\n        .receipt-template .receipt-header .info {\n            font-size: 12px;\n        }\n        .receipt-template .receipt-header .store-name {\n            font-size: 24px;\n            font-weight: 700;\n            margin: 0;\n            padding: 0;\n        }\n        \n        \n/*Invoice Info Area*/ \n    .receipt-template .invoice-info-area {}\n    \n/*Customer Customer Area*/\n    .receipt-template .customer-area {\n        margin-top:10px;\n    }\n\n/*Calculation Area*/\n    .receipt-template .calculation-area {\n        border-top: 2px solid #000;\n        font-weight: bold;\n    }\n    .receipt-template .calculation-area table td {\n        text-align: right;\n    }\n    .receipt-template .calculation-area table td:nth-child(2) {\n        border-bottom: 1px dashed #000;\n    }\n\n/*Item Listing*/\n    .receipt-template .item-list table tr {\n    }\n    \n/*Barcode Area*/\n    .receipt-template .barcode-area {\n        margin-top: 10px;\n        text-align: center;\n    }\n    .receipt-template .barcode-area img {\n        max-width: 100%;\n        display: inline-block;\n    }\n    \n/*Footer Area*/\n    .receipt-template .footer-area {\n        line-height: 1.222;\n        font-size: 10px;\n    }\n \n/*Media Query*/\n    @media print {\n        .receipt-template {\n            width: 100%;\n        }\n    }\n    @media all and (max-width: 215px) {}', '2019-05-10 12:35:05', '2019-07-01 23:06:02', 1),
(2, 'Minimal', '&lt;section class=&quot;receipt-template&quot;&gt;\n\n        &lt;header class=&quot;receipt-header&quot;&gt;\n            &lt;div class=&quot;logo-area&quot;&gt;\n                &lt;img class=&quot;logo&quot; src=&quot;{{  logo_url  }}&quot;&gt;\n            &lt;/div&gt;\n            &lt;h2 class=&quot;store-name&quot;&gt;{{ store_name }}&lt;/h2&gt;\n            &lt;div class=&quot;address-area&quot;&gt;\n                &lt;span class=&quot;info address&quot;&gt;{{ store_address }}&lt;/span&gt;\n                &lt;div class=&quot;block&quot;&gt;\n                    &lt;span class=&quot;info phone&quot;&gt;Mobile: {{ store_phone }}&lt;/span&gt;, &lt;span class=&quot;info email&quot;&gt;Email: {{ store_email }}&lt;/span&gt;\n                &lt;/div&gt;\n            &lt;/div&gt;\n        &lt;/header&gt;\n        \n        &lt;div class=&quot;heading&quot;&gt;\n            &lt;h2 class=&quot;title text-center zero-around title-lg&quot;&gt;INVOICE&lt;/h2&gt;\n        &lt;/div&gt;\n        \n        &lt;section class=&quot;info-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-10&quot;&gt;&lt;span&gt;Bill #:&lt;/td&gt;\n                    &lt;td class=&quot;w-40 text-center sinfo billno&quot;&gt;&lt;span&gt;{{ invoice_id }}&lt;/span&gt;&lt;/td&gt;\n                    &lt;td class=&quot;w-10 text-right&quot;&gt;&lt;span&gt;Date:&lt;/td&gt;\n                    &lt;td class=&quot;w-40 text-center sinfo date&quot;&gt;&lt;span&gt;{{ date_time }}&lt;/span&gt;&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-10&quot;&gt;M/S:&lt;/td&gt;\n                    &lt;td class=&quot;w-90&quot; colspan=&quot;3&quot;&gt;&lt;span class=&quot;text-lg&quot;&gt;{{ customer_name }}&lt;/span&gt;&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;listing-area item-list&quot;&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;tr&gt;\n                        &lt;td class=&quot;w-40 text-center&quot;&gt;DESC.&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-center&quot;&gt;Qty&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-right&quot;&gt;Price&lt;/td&gt;\n                        &lt;td class=&quot;w-20 text-right&quot;&gt;AMT&lt;/td&gt;\n                    &lt;/tr&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ items }}\n                        &lt;tr&gt;\n                            &lt;td&gt;{{ item_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_quantity }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_price }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt;   \n                        &lt;/tr&gt;\n                    {{ /items }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area calculation-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Subtotal:&lt;/td&gt;\n                    &lt;td&gt;{{ subtotal }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Order Tax:&lt;/td&gt;\n                    &lt;td&gt;{{ order_tax }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Discount:&lt;/td&gt;\n                    &lt;td&gt;{{ discount_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Shipping Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ shipping_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Others Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ others_charge }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Previous Due:&lt;/td&gt;\n                    &lt;td&gt;{{ previous_due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Total:&lt;/td&gt;\n                    &lt;td&gt;{{ payable_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ paid_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Due:&lt;/td&gt;\n                    &lt;td&gt;{{ due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Change:&lt;/td&gt;\n                    &lt;td&gt;{{ change }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;stylish-footer text-center&quot;&gt;\n            &lt;span&gt;Printed On: {{ printed_on }}&lt;/span&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area align-center footer-area&quot;&gt;\n            &lt;span class=&quot;block&quot;&gt;Sold product No Claim. No Change, New product One Month Warranty.&lt;/span&gt;\n            &lt;span class=&quot;block bold&quot;&gt;Thank You for Choosing Us.&lt;/span&gt;\n        &lt;/section&gt;\n        \n &lt;/section&gt;', '/*Common CSS*/\n        .receipt-template {\n            width:302px;\n            margin:0 auto;\n        }\n        .receipt-template .text-small {\n            font-size: 10px;\n        }\n        .receipt-template .block {\n            display: block;\n        }\n        .receipt-template .inline-block {\n            display: inline-block;\n        }\n        .receipt-template .bold {\n            font-weight: 700;\n        }\n        .receipt-template .italic {\n            font-style: italic;\n        }\n        .receipt-template .align-right {\n            text-align: right;\n        }\n        .receipt-template .align-center {\n            text-align: center;\n        }\n        .receipt-template .heading {\n            position: relation;\n        }\n        .receipt-template .title {\n            font-size: 16px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template .sub-title {\n            font-size: 12px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template table {\n            width: 100%;\n        }\n        .receipt-template td,\n        .receipt-template th {\n            font-size:10px;\n        }\n        .receipt-template .info-area {\n            font-size: 12px;      \n            line-height: 1.222;  \n        }\n        .receipt-template .listing-area {\n            line-height: 1.222;\n        }\n        .receipt-template .listing-area table {}\n        .receipt-template .listing-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n            font-weight: 700;\n        }\n        .receipt-template .listing-area table tbody tr {\n            border-top: 1px dashed #000;\n            border-bottom: 1px dashed #000;\n        }\n        .receipt-template .listing-area table tbody tr:last-child {\n            border-bottom: none;\n        }\n        .receipt-template .listing-area table td {\n            vertical-align: top;\n        }\n        .receipt-template .info-area table {}\n        .receipt-template .info-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n        }\n\n /*Receipt Heading*/\n        .receipt-template .receipt-header {\n            text-align: center;\n        }\n        .receipt-template .receipt-header .logo-area {\n            width: 80px;\n            height: 80px;\n            margin: 0 auto;\n        }\n        .receipt-template .receipt-header .logo-area img.logo {\n            display: inline-block;\n            max-width: 100%;\n            max-height: 100%;\n        }\n        .receipt-template .receipt-header .address-area {\n            margin-bottom: 5px;\n            line-height: 1;\n        }\n        .receipt-template .receipt-header .info {\n            font-size: 12px;\n        }\n        .receipt-template .receipt-header .store-name {\n            font-size: 28px;\n            font-weight: 700;\n            margin: 0;\n            padding: 0;\n        }\n        \n        \n/*Invoice Info Area*/ \n    .receipt-template .invoice-info-area {}\n    \n/*Customer Info Area*/\n    .receipt-template .customer-area {\n        margin-top:10px;\n    }\n\n/*Calculation Area*/\n    .receipt-template .calculation-area {\n        border-top: 2px solid #000;\n    }\n    .receipt-template .calculation-area table td {\n        text-align: right;\n    }\n    .receipt-template .calculation-area table td:nth-child(2) {\n        border-bottom: 1px dashed #000;\n    }\n\n/*Item Listing*/\n    .receipt-template .item-list table tr {\n    }\n    \n/*Barcode Area*/\n    .receipt-template .barcode-area {\n        margin-top: 10px;\n        text-align: center;\n    }\n    .receipt-template .barcode-area img {\n        max-width: 100%;\n        display: inline-block;\n    }\n    \n/*Footer Area*/\n    .receipt-template .footer-area {\n        line-height: 1.222;\n        font-size: 10px;\n    }\n \n/*Media Query*/\n    @media print {\n        .receipt-template {\n            width: 100%;\n        }\n    }\n    @media all and (max-width: 215px) {}\n    \n    \n/* Additional */\n        .receipt-template .zero-around {\n            margin:0;\n            padding: 0;\n        }\n        .receipt-template .title-lg {\n            font-size: 18px!important;\n            margin-bottom: 5px;\n         }\n         .receipt-template .text-lg {\n             font-size: 18px;\n             font-weight: 700;\n         }\n         .receipt-template .info-area td {\n             vertical-align: center;\n         }\n         .receipt-template .info-area td.sinfo {\n             padding: 1px!important;\n         }\n         .receipt-template .info-area td.sinfo span {\n             display: block;\n             font-weight: 700;\n             border: 1px solid #000;\n             padding: 2px;\n         }\n         .receipt-template .listing-area td, .receipt-template .listing-area th, .receipt-template .calculation-area table td {\n             font-size: 13px;\n             font-weight: 700;\n         }\n         .receipt-template .item-list table thead td {\n             text-align: center;\n             padding: 3px;\n             border: 2px solid #000;\n          }\n          .receipt-template .stylish-footer {\n              margin: 10px 0 5px 0;\n          }\n          .receipt-template .stylish-footer span {\n              display: inline-block;\n              font-size: 12px;\n              border-top: 1px dashed #000;\n              border-bottom: 1px dashed #000; \n          }\n', '2019-05-14 19:02:11', '2019-07-01 18:16:59', 1),
(3, 'Personalizado', '&lt;section class=&quot;receipt-template&quot;&gt;\n\n        &lt;header class=&quot;receipt-header&quot;&gt;\n            &lt;div class=&quot;logo-area&quot;&gt;\n                &lt;img class=&quot;logo&quot; src=&quot;{{ logo_url }}&quot;&gt;\n            &lt;/div&gt;\n            &lt;h2 class=&quot;store-name&quot;&gt;{{ store_name }}&lt;/h2&gt;\n            &lt;div class=&quot;address-area&quot;&gt;\n                &lt;span class=&quot;info address&quot;&gt;{{ store_address }}&lt;/span&gt;\n                &lt;div class=&quot;block&quot;&gt;\n                    &lt;span class=&quot;info phone&quot;&gt;Mobile: {{ store_phone }}&lt;/span&gt;, &lt;span class=&quot;info email&quot;&gt;Email: {{ store_email }}&lt;/span&gt;\n                &lt;/div&gt;\n            &lt;/div&gt;\n        &lt;/header&gt;\n        \n        &lt;section class=&quot;info-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Invoice ID:&lt;/td&gt;\n                    &lt;td&gt;{{ invoice_id }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;VAT-Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ vat_reg }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Date:&lt;/td&gt;\n                    &lt;td&gt;{{ date_time }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;GST Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ gst_reg }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Customer Name:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_name }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Phone:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_phone }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Address:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_address }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;GTIN:&lt;/td&gt;\n                    &lt;td&gt;{{ gtin }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;h4 class=&quot;main-title&quot;&gt;INVOICE&lt;/h4&gt;\n        \n        {{ if items }}\n        &lt;section class=&quot;listing-area item-list&quot;&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;tr&gt;\n                        &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                        &lt;td class=&quot;w-40 text-center&quot;&gt;Name&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-center&quot;&gt;Qty&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-right&quot;&gt;Price&lt;/td&gt;\n                        &lt;td class=&quot;w-20 text-right&quot;&gt;Amount&lt;/td&gt;\n                    &lt;/tr&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ items }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ item_name }} \n                                {{ if invoice_view == indian_gst }} \n                                    &lt;small&gt;[HSN-{{ hsn_code }}]&lt;/small&gt;\n                                {{ endif }}\n                            &lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_quantity }} {{ unitName }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_price }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt;   \n                        &lt;/tr&gt;\n                    {{ /items }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area calculation-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Amt:&lt;/td&gt;\n                    &lt;td&gt;{{ subtotal }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Order Tax:&lt;/td&gt;\n                    &lt;td&gt;{{ order_tax }}&lt;/td&gt;\n                &lt;/tr&gt;\n                {{ if invoice_view == \'indian_gst\' }}\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;CGST:&lt;/td&gt;\n                    &lt;td&gt;{{ cgst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;SGST:&lt;/td&gt;\n                    &lt;td&gt;{{ sgst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;IGST:&lt;/td&gt;\n                    &lt;td&gt;{{ igst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                {{ endif }}\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Discount:&lt;/td&gt;\n                    &lt;td&gt;{{ discount_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Shipping Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ shipping_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Others Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ others_charge }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Previous Due:&lt;/td&gt;\n                    &lt;td&gt;{{ previous_due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Due:&lt;/td&gt;\n                    &lt;td&gt;{{ payable_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ paid_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Prev. Due Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ prev_due_paid }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Change:&lt;/td&gt;\n                    &lt;td&gt;{{ change }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Due:&lt;/td&gt;\n                    &lt;td&gt;{{ due }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area italic&quot;&gt;\n            &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;In Text:&lt;/b&gt; {{ amount_in_text }}&lt;/span&gt;&lt;br&gt;\n            {{ if invoice_note }}\n                &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;Note:&lt;/b&gt; {{ invoice_note }}&lt;/span&gt;\n            {{ endif }}\n        &lt;/section&gt;\n\n        {{ if return_items }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Returns&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-5 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Returned at&lt;/td&gt;\n                    &lt;td class=&quot;w-30 text-center&quot;&gt;Item Name&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Amt&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{return_items}}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_quantity }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{/return_items}}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        \n        {{ if payments }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Payments&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-50 text-center&quot;&gt;Payment Method&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Amount&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Balance&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ payments }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ name }} by {{ by }} on {{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ amount }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ pos_balance }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /payments }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n           \n        {{ if invoice_view != \'standard\' }}\n        {{ if taxes }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Tax Information&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-25&quot;&gt;Name&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Code&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Tax Amt.&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ taxes }}\n                        &lt;tr&gt;\n                            &lt;td&gt;{{ taxrate_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ code_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ qty }}&lt;/td&gt; \n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_tax }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /taxes }}\n                    {{ if invoice_view == \'indian_gst\' }}\n                        &lt;tr class=&quot;bg-gray&quot;&gt;\n                            &lt;td&gt;Order Tax: {{ order_tax }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;CGST: {{ cgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;SGST: {{ sgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;IGST: {{ igst }}&lt;/td&gt;\n                        &lt;/tr&gt;\n                     {{ endif }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        {{ endif }}\n        \n        {{ if barcode }}\n        &lt;section class=&quot;info-area barcode-area&quot;&gt;\n            {{ barcode }}\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area align-center footer-area&quot;&gt;\n            &lt;span class=&quot;block&quot;&gt;Sold product No Claim. No Change, New product One Month Warranty.&lt;/span&gt;\n            &lt;span class=&quot;block bold&quot;&gt;{{ footer_text }}&lt;/span&gt;\n        &lt;/section&gt;\n        \n &lt;/section&gt;', '/*Common CSS*/\n        .receipt-template {\n            width:302px;\n            margin:0 auto;\n        }\n        .receipt-template .text-small {\n            font-size: 10px;\n        }\n        .receipt-template .block {\n            display: block;\n        }\n        .receipt-template .inline-block {\n            display: inline-block;\n        }\n        .receipt-template .bold {\n            font-weight: 700;\n        }\n        .receipt-template .italic {\n            font-style: italic;\n        }\n        .receipt-template .align-right {\n            text-align: right;\n        }\n        .receipt-template .align-center {\n            text-align: center;\n        }\n        .receipt-template .main-title {\n            font-size: 14px;\n            font-weight: 700;\n            text-align: center;\n            margin: 10px 0 5px 0;\n            padding: 0;\n        }\n        .receipt-template .heading {\n            position: relation;\n        }\n        .receipt-template .title {\n            font-size: 16px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template .sub-title {\n            font-size: 12px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template table {\n            width: 100%;\n        }\n        .receipt-template td,\n        .receipt-template th {\n            font-size:12px;\n        }\n        .receipt-template .info-area {\n            font-size: 12px;      \n            line-height: 1.222;  \n        }\n        .receipt-template .listing-area {\n            line-height: 1.222;\n        }\n        .receipt-template .listing-area table {}\n        .receipt-template .listing-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n            font-weight: 700;\n        }\n        .receipt-template .listing-area table tbody tr {\n            border-top: 1px dashed #000;\n            border-bottom: 1px dashed #000;\n        }\n        .receipt-template .listing-area table tbody tr:last-child {\n            border-bottom: none;\n        }\n        .receipt-template .listing-area table td {\n            vertical-align: top;\n        }\n        .receipt-template .info-area table {}\n        .receipt-template .info-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n        }\n    \n /*Receipt Heading*/\n        .receipt-template .receipt-header {\n            text-align: center;\n        }\n        .receipt-template .receipt-header .logo-area {\n            width: 80px;\n            height: 80px;\n            margin: 0 auto;\n        }\n        .receipt-template .receipt-header .logo-area img.logo {\n            display: inline-block;\n            max-width: 100%;\n            max-height: 100%;\n        }\n        .receipt-template .receipt-header .address-area {\n            margin-bottom: 5px;\n            line-height: 1;\n        }\n        .receipt-template .receipt-header .info {\n            font-size: 12px;\n        }\n        .receipt-template .receipt-header .store-name {\n            font-size: 24px;\n            font-weight: 700;\n            margin: 0;\n            padding: 0;\n        }\n        \n        \n/*Invoice Info Area*/ \n    .receipt-template .invoice-info-area {}\n    \n/*Customer Customer Area*/\n    .receipt-template .customer-area {\n        margin-top:10px;\n    }\n\n/*Calculation Area*/\n    .receipt-template .calculation-area {\n        border-top: 2px solid #000;\n        font-weight: bold;\n    }\n    .receipt-template .calculation-area table td {\n        text-align: right;\n    }\n    .receipt-template .calculation-area table td:nth-child(2) {\n        border-bottom: 1px dashed #000;\n    }\n\n/*Item Listing*/\n    .receipt-template .item-list table tr {\n    }\n    \n/*Barcode Area*/\n    .receipt-template .barcode-area {\n        margin-top: 10px;\n        text-align: center;\n    }\n    .receipt-template .barcode-area img {\n        max-width: 100%;\n        display: inline-block;\n    }\n    \n/*Footer Area*/\n    .receipt-template .footer-area {\n        line-height: 1.222;\n        font-size: 10px;\n    }\n \n/*Media Query*/\n    @media print {\n        .receipt-template {\n            width: 100%;\n        }\n    }\n    @media all and (max-width: 215px) {}', '2019-05-10 12:35:05', '2019-07-01 23:06:02', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pos_template_to_store`
--

CREATE TABLE `pos_template_to_store` (
  `pt2s` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `ttemplate_id` int(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `pos_template_to_store`
--

INSERT INTO `pos_template_to_store` (`pt2s`, `store_id`, `ttemplate_id`, `is_active`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `printers`
--

CREATE TABLE `printers` (
  `printer_id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) DEFAULT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `printers`
--

INSERT INTO `printers` (`printer_id`, `title`, `type`, `profile`, `char_per_line`, `created_at`) VALUES
(1, 'Impresora POS 80', 'network', '', 42, '2018-09-27 13:52:04'),
(2, 'Impresora POS 58', 'network', '', 30, '2018-09-27 13:52:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `printer_to_store`
--

CREATE TABLE `printer_to_store` (
  `p2s_id` int(10) NOT NULL,
  `pprinter_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `printer_to_store`
--

INSERT INTO `printer_to_store` (`p2s_id`, `pprinter_id`, `store_id`, `path`, `ip_address`, `port`, `status`, `sort_order`) VALUES
(1, 1, 1, '', NULL, '9100', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `p_id` int(10) UNSIGNED NOT NULL,
  `p_type` enum('standard','service') NOT NULL DEFAULT 'standard',
  `p_code` varchar(50) DEFAULT NULL,
  `hsn_code` varchar(100) DEFAULT NULL,
  `barcode_symbology` varchar(50) DEFAULT NULL,
  `p_name` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `p_image` varchar(250) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`p_id`, `p_type`, `p_code`, `hsn_code`, `barcode_symbology`, `p_name`, `category_id`, `unit_id`, `p_image`, `description`) VALUES
(2, 'standard', '44058162', NULL, 'code128', 'producto standard', 1, 1, '/thumbnails/thumb1.png', 'descripción del producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_to_store`
--

CREATE TABLE `product_to_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `purchase_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `sell_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `quantity_in_stock` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `alert_quantity` decimal(25,4) NOT NULL DEFAULT 10.0000,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) DEFAULT NULL,
  `box_id` int(10) UNSIGNED DEFAULT NULL,
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_method` varchar(55) NOT NULL DEFAULT 'inclusive',
  `preference` longtext DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `p_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `product_to_store`
--

INSERT INTO `product_to_store` (`id`, `product_id`, `store_id`, `purchase_price`, `sell_price`, `quantity_in_stock`, `alert_quantity`, `sup_id`, `brand_id`, `box_id`, `taxrate_id`, `tax_method`, `preference`, `e_date`, `p_date`, `status`, `sort_order`) VALUES
(2, 2, 1, 7.0000, 10.0000, 49.0000, 10.0000, 1, 0, 1, 2, 'inclusive', 'a:0:{}', '2023-01-17', '2022-01-17', 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_info`
--

CREATE TABLE `purchase_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inv_type` enum('purchase','transfer') NOT NULL DEFAULT 'purchase',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `sup_id` int(10) UNSIGNED DEFAULT NULL,
  `total_item` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` enum('stock','active','sold') NOT NULL DEFAULT 'stock',
  `total_sell` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `purchase_note` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `is_visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `payment_status` varchar(20) NOT NULL DEFAULT 'due',
  `checkout_status` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_status` enum('received','pending','ordered') NOT NULL DEFAULT 'received',
  `created_by` int(10) NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `purchase_info`
--

INSERT INTO `purchase_info` (`info_id`, `invoice_id`, `inv_type`, `store_id`, `sup_id`, `total_item`, `status`, `total_sell`, `purchase_note`, `attachment`, `is_visible`, `payment_status`, `checkout_status`, `shipping_status`, `created_by`, `purchase_date`, `created_at`, `updated_at`) VALUES
(2, 'B1', 'purchase', 1, 1, 1.0000, 'stock', 0.0000, '', '', 1, 'paid', 1, 'received', 1, '2022-01-17 00:00:00', '2022-01-17 07:03:14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_item`
--

CREATE TABLE `purchase_item` (
  `id` int(10) NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` int(10) NOT NULL DEFAULT 0,
  `brand_id` int(10) DEFAULT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_purchase_price` decimal(25,4) NOT NULL,
  `item_selling_price` decimal(25,4) NOT NULL,
  `item_quantity` decimal(25,4) NOT NULL,
  `total_sell` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` enum('stock','active','sold') NOT NULL DEFAULT 'stock',
  `item_total` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('exclusive','inclusive') DEFAULT 'exclusive',
  `tax` varchar(20) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `return_quantity` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `installment_quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `purchase_item`
--

INSERT INTO `purchase_item` (`id`, `invoice_id`, `store_id`, `item_id`, `category_id`, `brand_id`, `item_name`, `item_purchase_price`, `item_selling_price`, `item_quantity`, `total_sell`, `status`, `item_total`, `item_tax`, `tax_method`, `tax`, `gst`, `cgst`, `sgst`, `igst`, `return_quantity`, `installment_quantity`) VALUES
(2, 'B1', 1, 2, 1, 0, 'lito', 7.0000, 10.0000, 50.0000, 1.0000, 'active', 350.0000, 63.0000, 'inclusive', '18.0000', '18.0000', 0.0000, 0.0000, 63.0000, 0.0000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_logs`
--

CREATE TABLE `purchase_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `pmethod_id` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `store_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `purchase_logs`
--

INSERT INTO `purchase_logs` (`id`, `sup_id`, `reference_no`, `ref_invoice_id`, `type`, `pmethod_id`, `description`, `amount`, `store_id`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 1, 'CT220117100001', 'B1', 'purchase', 1, 'Paid while purchasing', 350.0000, 1, 1, '2022-01-17 07:03:14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'purchase',
  `is_hide` tinyint(1) NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `pmethod_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `total_paid` decimal(25,4) DEFAULT 0.0000,
  `balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `type`, `is_hide`, `store_id`, `invoice_id`, `reference_no`, `pmethod_id`, `transaction_id`, `details`, `attachment`, `note`, `amount`, `total_paid`, `balance`, `created_by`, `created_at`) VALUES
(2, 'purchase', 0, 1, 'B1', NULL, 1, NULL, NULL, NULL, '', 350.0000, 350.0000, 0.0000, 1, '2022-01-17 07:03:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_price`
--

CREATE TABLE `purchase_price` (
  `price_id` int(10) NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('percentage','plain') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payable_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `paid_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_amount` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `balance` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `purchase_price`
--

INSERT INTO `purchase_price` (`price_id`, `invoice_id`, `store_id`, `subtotal`, `discount_type`, `discount_amount`, `shipping_type`, `shipping_amount`, `others_charge`, `item_tax`, `order_tax`, `cgst`, `sgst`, `igst`, `payable_amount`, `paid_amount`, `due_paid`, `due`, `return_amount`, `balance`) VALUES
(2, 'B1', 1, 350.0000, 'plain', 0.0000, 'plain', 0.0000, 0.0000, 63.0000, 0.0000, 0.0000, 0.0000, 63.0000, 350.0000, 350.0000, 0.0000, 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `sup_id` int(10) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` int(10) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_amount` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_quantity` decimal(15,4) NOT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_info`
--

CREATE TABLE `quotation_info` (
  `info_id` int(10) NOT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `status` enum('sent','pending','complete','canceled') NOT NULL DEFAULT 'sent',
  `payment_status` varchar(50) DEFAULT NULL,
  `quotation_note` text DEFAULT NULL,
  `is_installment` tinyint(1) NOT NULL DEFAULT 0,
  `is_order` tinyint(1) NOT NULL DEFAULT 0,
  `total_items` int(10) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `pmethod_details` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_item`
--

CREATE TABLE `quotation_item` (
  `id` int(10) NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) DEFAULT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_discount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('exclusive','inclusive') NOT NULL DEFAULT 'exclusive',
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` decimal(25,4) NOT NULL,
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `purchase_invoice_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotation_price`
--

CREATE TABLE `quotation_price` (
  `price_id` int(10) NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT 0.0000,
  `interest_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `interest_percentage` int(10) NOT NULL DEFAULT 0,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable_amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `returns`
--

CREATE TABLE `returns` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `purchase_invoice_id` varchar(100) DEFAULT NULL,
  `customer_id` int(10) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` decimal(25,4) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_amount` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `profit` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `return_items`
--

CREATE TABLE `return_items` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `reference_no` varchar(100) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_quantity` decimal(25,4) NOT NULL,
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `selling_info`
--

CREATE TABLE `selling_info` (
  `info_id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `edit_counter` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inv_type` enum('sell') NOT NULL DEFAULT 'sell',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `ref_invoice_id` varchar(100) DEFAULT NULL,
  `ref_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invoice_note` text DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `is_installment` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pmethod_id` int(10) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `checkout_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `selling_info`
--

INSERT INTO `selling_info` (`info_id`, `invoice_id`, `edit_counter`, `inv_type`, `store_id`, `customer_id`, `customer_mobile`, `ref_invoice_id`, `ref_user_id`, `invoice_note`, `total_items`, `is_installment`, `status`, `pmethod_id`, `payment_status`, `checkout_status`, `created_by`, `created_at`, `updated_at`) VALUES
(5, '12022/00000001', 0, 'sell', 1, 1, '0170000000000', NULL, 0, '', 1, 0, 1, 1, 'paid', 1, 1, '2022-01-17 07:03:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `selling_item`
--

CREATE TABLE `selling_item` (
  `id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) DEFAULT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_discount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('inclusive','exclusive') DEFAULT 'exclusive',
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` decimal(25,4) NOT NULL,
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `purchase_invoice_id` varchar(100) DEFAULT NULL,
  `print_counter` int(10) UNSIGNED DEFAULT 0,
  `print_counter_time` datetime DEFAULT NULL,
  `printed_by` int(10) DEFAULT NULL,
  `return_quantity` decimal(25,4) DEFAULT 0.0000,
  `installment_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `selling_item`
--

INSERT INTO `selling_item` (`id`, `invoice_id`, `category_id`, `brand_id`, `sup_id`, `store_id`, `item_id`, `item_name`, `item_price`, `item_discount`, `item_tax`, `tax_method`, `taxrate_id`, `tax`, `gst`, `cgst`, `sgst`, `igst`, `item_quantity`, `item_purchase_price`, `item_total`, `purchase_invoice_id`, `print_counter`, `print_counter_time`, `printed_by`, `return_quantity`, `installment_quantity`, `created_at`) VALUES
(8, '12022/00000001', 1, 0, 1, 1, 2, 'lito', 10.0000, 0.0000, 1.8000, 'inclusive', 2, '18.0000', '18.0000', 0.9000, 0.9000, 0.0000, 1.0000, 7.0000, 10.0000, 'B1', 0, NULL, NULL, 0.0000, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `selling_price`
--

CREATE TABLE `selling_price` (
  `price_id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT 0.0000,
  `interest_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `interest_percentage` int(10) NOT NULL DEFAULT 0,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `shipping_type` enum('plain','percentage') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) DEFAULT 0.0000,
  `others_charge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable_amount` decimal(25,4) DEFAULT NULL,
  `paid_amount` decimal(25,4) NOT NULL,
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_amount` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `balance` decimal(25,4) DEFAULT 0.0000,
  `profit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `previous_due` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `prev_due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `selling_price`
--

INSERT INTO `selling_price` (`price_id`, `invoice_id`, `store_id`, `subtotal`, `discount_type`, `discount_amount`, `interest_amount`, `interest_percentage`, `item_tax`, `order_tax`, `cgst`, `sgst`, `igst`, `total_purchase_price`, `shipping_type`, `shipping_amount`, `others_charge`, `payable_amount`, `paid_amount`, `due`, `due_paid`, `return_amount`, `balance`, `profit`, `previous_due`, `prev_due_paid`) VALUES
(5, '12022/00000001', 1, 10.0000, 'plain', 0.0000, 0.0000, 0, 1.8000, 0.0000, 0.9000, 0.9000, 0.0000, 7.0000, 'plain', 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sell_logs`
--

CREATE TABLE `sell_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `pmethod_id` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `store_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `sell_logs`
--

INSERT INTO `sell_logs` (`id`, `customer_id`, `reference_no`, `ref_invoice_id`, `type`, `pmethod_id`, `description`, `amount`, `store_id`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 1, 'CT220117100001', '12022/00000001', 'sell', 1, 'Paid while selling', 10.0000, 1, 1, '2022-01-17 07:03:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) NOT NULL,
  `version` varchar(10) NOT NULL,
  `is_update_available` tinyint(1) NOT NULL DEFAULT 0,
  `update_version` varchar(100) DEFAULT NULL,
  `update_link` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `version`, `is_update_available`, `update_version`, `update_link`, `created_at`, `updated_at`) VALUES
(1, '3.3', 0, '', '', '2018-09-14 18:00:00', '2020-10-20 17:34:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shortcut_links`
--

CREATE TABLE `shortcut_links` (
  `id` int(11) NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `href` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `target` varchar(100) NOT NULL DEFAULT '_self',
  `title` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `thumbnail` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `permission_slug` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `shortcut_links`
--

INSERT INTO `shortcut_links` (`id`, `type`, `href`, `target`, `title`, `icon`, `thumbnail`, `permission_slug`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'report', '/admin/report_overview.php', '', 'Overview Report', 'fa-angle-right', '', 'read_overview_report', 1, 1, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(2, 'report', '/admin/report_collection.php', '', 'Collection Report', 'fa-angle-right', '', 'read_collection_report', 1, 2, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(3, 'report', '/admin/report_customer_due_collection.php', '', 'Due Collection Report', 'fa-angle-right', '', 'read_customer_due_collection_report', 1, 3, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(4, 'report', '/admin/report_supplier_due_paid.php', '', 'Supplier Due Paid Report', 'fa-angle-right', '', 'read_supplier_due_paid_report', 1, 4, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(5, 'report', '/admin/report_sell_itemwise.php', '', 'Sell Report', 'fa-angle-right', '', 'read_sell_report', 1, 5, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(6, 'report', '/admin/report_purchase_supplierwise.php', '', 'Purchase Report', 'fa-angle-right', '', 'read_purchase_report', 1, 6, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(7, 'report', '/admin/report_sell_payment.php', '', 'Sell Payment Report', 'fa-angle-right', '', 'read_sell_payment_report', 1, 7, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(8, 'report', '/admin/report_purchase_payment.php', '', 'Purchase Payment Report', 'fa-angle-right', '', 'read_purchase_payment_report', 1, 8, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(9, 'report', '/admin/report_sell_tax.php', '', 'Sell Tax Report', 'fa-angle-right', '', 'read_sell_tax_report', 1, 9, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(10, 'report', '/admin/report_purchase_tax.php', '', 'Purchase Tax Report', 'fa-angle-right', '', 'read_purchase_tax_report', 1, 10, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(11, 'report', '/admin/report_tax_overview.php', '', 'Tax Overview Report', 'fa-angle-right', '', 'read_tax_overview_report', 1, 11, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(12, 'report', '/admin/report_stock.php', '', 'Stock Report', 'fa-angle-right', '', 'read_stock_report', 1, 12, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(13, 'report', '/admin/bank_transactions.php', '', 'Bank Transaction', 'fa-angle-right', '', 'read_bank_transactions', 1, 13, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(14, 'report', '/admin/bank_account_sheet.php', '', 'Balance Sheet', 'fa-angle-right', '', 'read_bank_account_sheet', 1, 14, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(15, 'report', '/admin/income_monthwise.php', '', 'Income Monthwise Report', 'fa-angle-right', '', 'read_income_monthwise', 1, 15, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(16, 'report', '/admin/report_income_and_expense.php', '', 'Income vs Expense Report', 'fa-angle-right', '', 'read_income_and_expense_report', 1, 16, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(17, 'report', '/admin/report_profit_and_loss.php', '', 'Profit vs Loss Report', 'fa-angle-right', '', 'read_profit_and_loss_report', 1, 17, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(18, 'report', '/admin/report_cashbook.php', '', 'Cashbook', 'fa-angle-right', '', 'read_cashbook_report', 1, 18, '2019-02-03 12:00:00', '2019-06-30 05:59:30'),
(19, 'report', '/admin/expense_monthwise.php', '', 'Expense Monthwise Report', 'fa-angle-right', '', 'read_income_monthwise', 1, 15, '2019-02-03 12:00:00', '2019-06-30 05:59:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms_schedule`
--

CREATE TABLE `sms_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_datetime` datetime DEFAULT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `people_type` varchar(100) DEFAULT NULL,
  `people_sms_type` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `people_name` varchar(100) NOT NULL,
  `sms_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sms_type` varchar(50) NOT NULL DEFAULT 'TEXT',
  `campaign_name` varchar(100) DEFAULT NULL,
  `process_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `total_try` int(11) NOT NULL DEFAULT 0,
  `response_text` varchar(250) DEFAULT NULL,
  `delivery_status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `api_id` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  `sender_id` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `maskname` varchar(100) DEFAULT NULL,
  `campaignname` varchar(100) DEFAULT NULL,
  `unicode` varchar(20) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `sms_setting`
--

INSERT INTO `sms_setting` (`id`, `type`, `api_id`, `auth_key`, `sender_id`, `contact`, `username`, `password`, `maskname`, `campaignname`, `unicode`, `country_code`, `url`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Clickatell', NULL, '', '', '', NULL, NULL, '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '2019-07-01 18:23:32'),
(2, 'Twilio', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '2019-07-01 18:23:16'),
(3, 'Msg91', '', '', '', '', '', '', '', '', '', '', 'http://api.msg91.com/api/v2/', 1, 0, '0000-00-00 00:00:00', '2019-07-01 18:23:17'),
(4, 'Onnorokomsms', '', '', '', '', '', '', '', '', '', '', 'https://api2.onnorokomsms.com/HttpSendSms.ashx?', 1, 0, '0000-00-00 00:00:00', '2019-07-01 18:23:19'),
(5, 'Mimsms', '', '', '', '', '', '', '', '', '', '', 'https://www.mimsms.com.bd/smsAPI?', 1, 0, '0000-00-00 00:00:00', '2019-07-01 18:23:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE `stores` (
  `store_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code_name` varchar(55) DEFAULT NULL,
  `mobile` varchar(14) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `currency` varchar(100) NOT NULL DEFAULT 'USD',
  `vat_reg_no` varchar(250) DEFAULT NULL,
  `cashier_id` int(10) UNSIGNED NOT NULL,
  `address` longtext DEFAULT NULL,
  `receipt_printer` varchar(100) DEFAULT NULL,
  `cash_drawer_codes` varchar(100) DEFAULT NULL,
  `char_per_line` tinyint(4) NOT NULL DEFAULT 42,
  `remote_printing` tinyint(1) NOT NULL DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(100) DEFAULT NULL,
  `auto_print` tinyint(1) NOT NULL DEFAULT 0,
  `local_printers` tinyint(1) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `favicon` varchar(250) DEFAULT NULL,
  `preference` longtext DEFAULT NULL,
  `sound_effect` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `feedback_status` varchar(100) NOT NULL DEFAULT 'ready',
  `feedback_at` datetime DEFAULT NULL,
  `deposit_account_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `stores`
--

INSERT INTO `stores` (`store_id`, `name`, `code_name`, `mobile`, `email`, `country`, `zip_code`, `currency`, `vat_reg_no`, `cashier_id`, `address`, `receipt_printer`, `cash_drawer_codes`, `char_per_line`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `logo`, `favicon`, `preference`, `sound_effect`, `sort_order`, `feedback_status`, `feedback_at`, `deposit_account_id`, `thumbnail`, `status`, `created_at`) VALUES
(1, 'Harvestsnop', 'mi_tienda', '3504931577', 'mitienda@store.com', 'PE', '1200', 'COL', '654321', 2, 'admin@mitienda.com', '1', NULL, 42, 0, 1, '[\"1\"]', 0, 1, '1_logo.png', '1_favicon.png', 'a:32:{s:10:\"gst_reg_no\";s:0:\"\";s:8:\"timezone\";s:14:\"America/Bogota\";s:21:\"invoice_edit_lifespan\";s:4:\"1440\";s:26:\"invoice_edit_lifespan_unit\";s:6:\"minute\";s:23:\"invoice_delete_lifespan\";s:4:\"1440\";s:28:\"invoice_delete_lifespan_unit\";s:6:\"minute\";s:3:\"tax\";s:1:\"0\";s:11:\"sms_gateway\";s:10:\"Clickatell\";s:9:\"sms_alert\";s:1:\"0\";s:24:\"expiring_soon_alert_days\";s:0:\"\";s:20:\"datatable_item_limit\";s:2:\"25\";s:16:\"reference_format\";s:13:\"year_sequence\";s:22:\"sales_reference_prefix\";s:0:\"\";s:16:\"receipt_template\";s:1:\"1\";s:12:\"invoice_view\";s:8:\"standard\";s:14:\"business_state\";s:2:\"AN\";s:31:\"change_item_price_while_billing\";s:1:\"0\";s:25:\"pos_product_display_limit\";s:0:\"\";s:15:\"after_sell_page\";s:3:\"pos\";s:19:\"invoice_footer_text\";s:26:\"Thank you for choosing us!\";s:10:\"email_from\";s:13:\"Nacional Code\";s:13:\"email_address\";s:2:\"US\";s:12:\"email_driver\";s:11:\"smtp_server\";s:14:\"send_mail_path\";s:0:\"\";s:9:\"smtp_host\";s:15:\"smtp.google.com\";s:13:\"smtp_username\";s:0:\"\";s:13:\"smtp_password\";s:0:\"\";s:9:\"smtp_port\";s:3:\"465\";s:7:\"ssl_tls\";s:3:\"ssl\";s:12:\"ftp_hostname\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";}', 0, 0, 'ready', '2019-03-01 14:29:18', 1, NULL, 1, '2018-09-24 18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `code_name` varchar(55) DEFAULT NULL,
  `sup_mobile` varchar(14) DEFAULT NULL,
  `sup_email` varchar(100) DEFAULT NULL,
  `gtin` varchar(100) DEFAULT NULL,
  `sup_address` text DEFAULT NULL,
  `sup_city` varchar(100) DEFAULT NULL,
  `sup_state` varchar(55) DEFAULT NULL,
  `sup_country` varchar(100) DEFAULT NULL,
  `sup_details` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_name`, `code_name`, `sup_mobile`, `sup_email`, `gtin`, `sup_address`, `sup_city`, `sup_state`, `sup_country`, `sup_details`, `created_at`) VALUES
(1, 'Proveedor', 'proveedor', '016000000', 'proveedor@proveedor.com', '', 'calle 37', 'Medellin', 'Antioquia', 'CO', '', '2018-03-24 20:19:51'),
(2, 'Plaza sur', 'plaza_sur', '09999999', 'plazasur@gmail.com', '', 'Puno', 'Puno', 'Puno', 'PE', '', '2025-05-05 17:59:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier_to_store`
--

CREATE TABLE `supplier_to_store` (
  `s2s_id` int(10) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `supplier_to_store`
--

INSERT INTO `supplier_to_store` (`s2s_id`, `sup_id`, `store_id`, `balance`, `status`, `sort_order`) VALUES
(1, 1, 1, 0.0000, 1, 0),
(2, 2, 1, 0.0000, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxrates`
--

CREATE TABLE `taxrates` (
  `taxrate_id` int(11) NOT NULL,
  `taxrate_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `taxrate` decimal(25,4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `taxrates`
--

INSERT INTO `taxrates` (`taxrate_id`, `taxrate_name`, `code_name`, `taxrate`, `status`, `sort_order`) VALUES
(1, 'GST @0%', 'GG0', 0.0000, 1, 4),
(2, 'GST @18%', 'GGX', 18.0000, 1, 5),
(3, 'Sin Impuesto', 'no_tax', 0.0000, 1, 1),
(4, 'Tax @19%', 'VVX', 19.0000, 1, 2),
(5, 'Tax @8%', 'TTX', 8.0000, 1, 3),
(6, 'Tax@5%', 'tax@5%', 5.0000, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `ref_invoice_id` varchar(100) DEFAULT NULL,
  `from_store_id` int(11) NOT NULL,
  `to_store_id` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` decimal(25,4) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `received_by` int(11) DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `attachment` varchar(55) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfer_items`
--

CREATE TABLE `transfer_items` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `units`
--

CREATE TABLE `units` (
  `unit_id` int(10) NOT NULL,
  `unit_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `unit_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `code_name`, `unit_details`) VALUES
(1, 'Und.', 'unidades', ''),
(2, 'Kg', 'kg', 'kilo'),
(3, 'Lb', 'lb', 'Libra'),
(4, 'gm', 'gm', 'Gramo'),
(5, 'pack', 'pack', 'paquete');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit_to_store`
--

CREATE TABLE `unit_to_store` (
  `unit2s_id` int(10) UNSIGNED NOT NULL,
  `uunit_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `unit_to_store`
--

INSERT INTO `unit_to_store` (`unit2s_id`, `uunit_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'M',
  `password` varchar(100) NOT NULL,
  `raw_password` varchar(100) DEFAULT NULL,
  `pass_reset_code` varchar(32) DEFAULT NULL,
  `reset_code_time` datetime DEFAULT NULL,
  `login_try` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `preference` longtext DEFAULT NULL,
  `user_image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `group_id`, `username`, `email`, `mobile`, `dob`, `sex`, `password`, `raw_password`, `pass_reset_code`, `reset_code_time`, `login_try`, `last_login`, `ip`, `address`, `preference`, `user_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Edwa', 'admin@gmail.com', '3504931577', '1990-01-01', 'M', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', NULL, 0, '2025-05-05 16:32:10', '181.176.82.118', NULL, 'a:4:{s:8:\"language\";s:2:\"es\";s:10:\"base_color\";s:4:\"blue\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";}', '/solution24-logo.jpg', '2022-01-15 23:03:41', '2019-07-03 00:29:20'),
(2, 2, 'Cashier', 'cajero@gmail.com', '01521504597', '1990-01-01', 'M', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', NULL, 0, '2019-06-22 14:01:20', '181.51.193.58', NULL, 'a:4:{s:8:\"language\";s:7:\"english\";s:10:\"base_color\";s:5:\"green\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:31:\"abstract-attractive-backdro.jpg\";}', '', '2022-01-15 23:03:41', '2019-07-01 18:28:15'),
(3, 3, 'Abrahan', 'vendedor@gmail.com', '0113743700', '1990-01-01', 'M', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', NULL, 0, '2025-05-05 18:23:22', '181.176.82.118', NULL, 'a:4:{s:8:\"language\";s:2:\"es\";s:10:\"base_color\";s:4:\"blue\";s:14:\"pos_side_panel\";s:4:\"left\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";}', '', '2022-01-15 23:03:41', '2019-07-01 23:35:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_group`
--

CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `user_group`
--

INSERT INTO `user_group` (`group_id`, `name`, `slug`, `sort_order`, `status`, `permission`) VALUES
(1, 'Admin', 'admin', 1, 1, 'a:1:{s:6:\"access\";a:122:{s:16:\"read_sell_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:22:\"read_collection_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:35:\"read_customer_due_collection_report\";s:4:\"true\";s:29:\"read_supplier_due_paid_report\";s:4:\"true\";s:14:\"read_analytics\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:24:\"read_tax_overview_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:21:\"send_report_via_email\";s:4:\"true\";s:8:\"withdraw\";s:4:\"true\";s:7:\"deposit\";s:4:\"true\";s:8:\"transfer\";s:4:\"true\";s:17:\"read_bank_account\";s:4:\"true\";s:23:\"read_bank_account_sheet\";s:4:\"true\";s:18:\"read_bank_transfer\";s:4:\"true\";s:22:\"read_bank_transactions\";s:4:\"true\";s:19:\"create_bank_account\";s:4:\"true\";s:19:\"update_bank_account\";s:4:\"true\";s:19:\"delete_bank_account\";s:4:\"true\";s:12:\"read_expense\";s:4:\"true\";s:14:\"create_expense\";s:4:\"true\";s:14:\"update_expense\";s:4:\"true\";s:14:\"delete_expense\";s:4:\"true\";s:21:\"read_sell_transaction\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:13:\"read_giftcard\";s:4:\"true\";s:12:\"add_giftcard\";s:4:\"true\";s:15:\"update_giftcard\";s:4:\"true\";s:15:\"delete_giftcard\";s:4:\"true\";s:14:\"giftcard_topup\";s:4:\"true\";s:19:\"read_giftcard_topup\";s:4:\"true\";s:21:\"delete_giftcard_topup\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:10:\"create_box\";s:4:\"true\";s:10:\"update_box\";s:4:\"true\";s:10:\"delete_box\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:14:\"create_taxrate\";s:4:\"true\";s:14:\"update_taxrate\";s:4:\"true\";s:14:\"delete_taxrate\";s:4:\"true\";s:9:\"read_loan\";s:4:\"true\";s:17:\"read_loan_summary\";s:4:\"true\";s:9:\"take_loan\";s:4:\"true\";s:11:\"update_loan\";s:4:\"true\";s:11:\"delete_loan\";s:4:\"true\";s:8:\"loan_pay\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:14:\"read_usergroup\";s:4:\"true\";s:16:\"create_usergroup\";s:4:\"true\";s:16:\"update_usergroup\";s:4:\"true\";s:16:\"delete_usergroup\";s:4:\"true\";s:13:\"read_currency\";s:4:\"true\";s:15:\"create_currency\";s:4:\"true\";s:15:\"update_currency\";s:4:\"true\";s:15:\"change_currency\";s:4:\"true\";s:15:\"delete_currency\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:14:\"delete_printer\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:13:\"language_sync\";s:4:\"true\";s:6:\"backup\";s:4:\"true\";s:7:\"restore\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}'),
(2, 'Cashier', 'cashier', 2, 1, 'a:1:{s:6:\"access\";a:2:{s:9:\"read_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";}}'),
(3, 'Salesman', 'salesman', 3, 1, 'a:1:{s:6:\"access\";a:191:{s:22:\"read_recent_activities\";s:4:\"true\";s:32:\"read_dashboard_accounting_report\";s:4:\"true\";s:16:\"read_sell_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:22:\"read_collection_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:35:\"read_customer_due_collection_report\";s:4:\"true\";s:29:\"read_supplier_due_paid_report\";s:4:\"true\";s:14:\"read_analytics\";s:4:\"true\";s:20:\"read_purchase_report\";s:4:\"true\";s:28:\"read_purchase_payment_report\";s:4:\"true\";s:24:\"read_purchase_tax_report\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:24:\"read_tax_overview_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:21:\"send_report_via_email\";s:4:\"true\";s:8:\"withdraw\";s:4:\"true\";s:7:\"deposit\";s:4:\"true\";s:8:\"transfer\";s:4:\"true\";s:17:\"read_bank_account\";s:4:\"true\";s:23:\"read_bank_account_sheet\";s:4:\"true\";s:18:\"read_bank_transfer\";s:4:\"true\";s:22:\"read_bank_transactions\";s:4:\"true\";s:18:\"read_income_source\";s:4:\"true\";s:19:\"create_bank_account\";s:4:\"true\";s:19:\"update_bank_account\";s:4:\"true\";s:19:\"delete_bank_account\";s:4:\"true\";s:20:\"create_income_source\";s:4:\"true\";s:20:\"update_income_source\";s:4:\"true\";s:20:\"delete_income_source\";s:4:\"true\";s:21:\"read_income_monthwise\";s:4:\"true\";s:30:\"read_income_and_expense_report\";s:4:\"true\";s:27:\"read_profit_and_loss_report\";s:4:\"true\";s:20:\"read_cashbook_report\";s:4:\"true\";s:14:\"read_quotation\";s:4:\"true\";s:16:\"create_quotation\";s:4:\"true\";s:16:\"update_quotation\";s:4:\"true\";s:16:\"delete_quotation\";s:4:\"true\";s:16:\"read_installment\";s:4:\"true\";s:18:\"create_installment\";s:4:\"true\";s:18:\"update_installment\";s:4:\"true\";s:18:\"delete_installment\";s:4:\"true\";s:19:\"installment_payment\";s:4:\"true\";s:20:\"installment_overview\";s:4:\"true\";s:12:\"read_expense\";s:4:\"true\";s:14:\"create_expense\";s:4:\"true\";s:14:\"update_expense\";s:4:\"true\";s:14:\"delete_expense\";s:4:\"true\";s:21:\"read_expense_category\";s:4:\"true\";s:23:\"create_expense_category\";s:4:\"true\";s:23:\"update_expense_category\";s:4:\"true\";s:23:\"delete_expense_category\";s:4:\"true\";s:22:\"read_expense_monthwise\";s:4:\"true\";s:20:\"read_expense_summary\";s:4:\"true\";s:17:\"read_sell_invoice\";s:4:\"true\";s:14:\"read_sell_list\";s:4:\"true\";s:19:\"create_sell_invoice\";s:4:\"true\";s:24:\"update_sell_invoice_info\";s:4:\"true\";s:19:\"delete_sell_invoice\";s:4:\"true\";s:12:\"sell_payment\";s:4:\"true\";s:15:\"create_sell_due\";s:4:\"true\";s:18:\"create_sell_return\";s:4:\"true\";s:16:\"read_sell_return\";s:4:\"true\";s:18:\"update_sell_return\";s:4:\"true\";s:18:\"delete_sell_return\";s:4:\"true\";s:16:\"sms_sell_invoice\";s:4:\"true\";s:18:\"email_sell_invoice\";s:4:\"true\";s:13:\"read_sell_log\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:19:\"create_purchase_due\";s:4:\"true\";s:22:\"create_purchase_return\";s:4:\"true\";s:20:\"read_purchase_return\";s:4:\"true\";s:22:\"update_purchase_return\";s:4:\"true\";s:22:\"delete_purchase_return\";s:4:\"true\";s:17:\"read_purchase_log\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:15:\"delete_transfer\";s:4:\"true\";s:13:\"read_giftcard\";s:4:\"true\";s:12:\"add_giftcard\";s:4:\"true\";s:15:\"update_giftcard\";s:4:\"true\";s:15:\"delete_giftcard\";s:4:\"true\";s:14:\"giftcard_topup\";s:4:\"true\";s:19:\"read_giftcard_topup\";s:4:\"true\";s:21:\"delete_giftcard_topup\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:12:\"create_brand\";s:4:\"true\";s:12:\"update_brand\";s:4:\"true\";s:12:\"delete_brand\";s:4:\"true\";s:18:\"read_brand_profile\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:10:\"create_box\";s:4:\"true\";s:10:\"update_box\";s:4:\"true\";s:10:\"delete_box\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:14:\"create_taxrate\";s:4:\"true\";s:14:\"update_taxrate\";s:4:\"true\";s:14:\"delete_taxrate\";s:4:\"true\";s:9:\"read_loan\";s:4:\"true\";s:17:\"read_loan_summary\";s:4:\"true\";s:9:\"take_loan\";s:4:\"true\";s:11:\"update_loan\";s:4:\"true\";s:11:\"delete_loan\";s:4:\"true\";s:8:\"loan_pay\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:20:\"add_customer_balance\";s:4:\"true\";s:26:\"substract_customer_balance\";s:4:\"true\";s:25:\"read_customer_transaction\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:14:\"read_usergroup\";s:4:\"true\";s:16:\"create_usergroup\";s:4:\"true\";s:16:\"update_usergroup\";s:4:\"true\";s:16:\"delete_usergroup\";s:4:\"true\";s:13:\"read_currency\";s:4:\"true\";s:15:\"create_currency\";s:4:\"true\";s:15:\"update_currency\";s:4:\"true\";s:15:\"change_currency\";s:4:\"true\";s:15:\"delete_currency\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:22:\"updadte_pmethod_status\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:14:\"delete_printer\";s:4:\"true\";s:10:\"send_email\";s:4:\"true\";s:13:\"read_language\";s:4:\"true\";s:15:\"create_language\";s:4:\"true\";s:15:\"update_language\";s:4:\"true\";s:15:\"delete_language\";s:4:\"true\";s:20:\"language_translation\";s:4:\"true\";s:19:\"delete_language_key\";s:4:\"true\";s:16:\"receipt_template\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:13:\"language_sync\";s:4:\"true\";s:6:\"backup\";s:4:\"true\";s:7:\"restore\";s:4:\"true\";s:5:\"reset\";s:4:\"true\";s:19:\"show_purchase_price\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_to_store`
--

CREATE TABLE `user_to_store` (
  `u2s_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `user_to_store`
--

INSERT INTO `user_to_store` (`u2s_id`, `user_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 1, 1, 2),
(3, 3, 1, 1, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  ADD PRIMARY KEY (`ba2s`),
  ADD KEY `account_id` (`account_id`);

--
-- Indices de la tabla `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `created_at` (`created_at`);

--
-- Indices de la tabla `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indices de la tabla `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`box_id`);

--
-- Indices de la tabla `box_to_store`
--
ALTER TABLE `box_to_store`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indices de la tabla `brand_to_store`
--
ALTER TABLE `brand_to_store`
  ADD PRIMARY KEY (`b2s_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indices de la tabla `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `category_to_store`
--
ALTER TABLE `category_to_store`
  ADD PRIMARY KEY (`c2s_id`),
  ADD KEY `ccategory_id` (`ccategory_id`);

--
-- Indices de la tabla `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indices de la tabla `currency_to_store`
--
ALTER TABLE `currency_to_store`
  ADD PRIMARY KEY (`ca2s_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indices de la tabla `customer_to_store`
--
ALTER TABLE `customer_to_store`
  ADD PRIMARY KEY (`c2s_id`);

--
-- Indices de la tabla `customer_transactions`
--
ALTER TABLE `customer_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expense_categorys`
--
ALTER TABLE `expense_categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indices de la tabla `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indices de la tabla `holding_info`
--
ALTER TABLE `holding_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indices de la tabla `holding_item`
--
ALTER TABLE `holding_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `holding_price`
--
ALTER TABLE `holding_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indices de la tabla `income_sources`
--
ALTER TABLE `income_sources`
  ADD PRIMARY KEY (`source_id`);

--
-- Indices de la tabla `installment_orders`
--
ALTER TABLE `installment_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indices de la tabla `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `language_translations`
--
ALTER TABLE `language_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indices de la tabla `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lloan_id` (`lloan_id`);

--
-- Indices de la tabla `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `mail_sms_tag`
--
ALTER TABLE `mail_sms_tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `pmethods`
--
ALTER TABLE `pmethods`
  ADD PRIMARY KEY (`pmethod_id`);

--
-- Indices de la tabla `pmethod_to_store`
--
ALTER TABLE `pmethod_to_store`
  ADD PRIMARY KEY (`p2s_id`),
  ADD KEY `ppmethod_id` (`ppmethod_id`);

--
-- Indices de la tabla `pos_register`
--
ALTER TABLE `pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pos_templates`
--
ALTER TABLE `pos_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indices de la tabla `pos_template_to_store`
--
ALTER TABLE `pos_template_to_store`
  ADD PRIMARY KEY (`pt2s`),
  ADD KEY `ttemplate_id` (`ttemplate_id`);

--
-- Indices de la tabla `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`printer_id`);

--
-- Indices de la tabla `printer_to_store`
--
ALTER TABLE `printer_to_store`
  ADD PRIMARY KEY (`p2s_id`),
  ADD KEY `pprinter_id` (`pprinter_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `p_code` (`p_code`) USING BTREE;

--
-- Indices de la tabla `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `product_to_store`
--
ALTER TABLE `product_to_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `p_date` (`p_date`);

--
-- Indices de la tabla `purchase_info`
--
ALTER TABLE `purchase_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `purchase_logs`
--
ALTER TABLE `purchase_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sup_id` (`sup_id`),
  ADD KEY `reference_no` (`reference_no`),
  ADD KEY `ref_invoice_id` (`ref_invoice_id`);

--
-- Indices de la tabla `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `purchase_price`
--
ALTER TABLE `purchase_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `quotation_info`
--
ALTER TABLE `quotation_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indices de la tabla `quotation_item`
--
ALTER TABLE `quotation_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_no` (`reference_no`);

--
-- Indices de la tabla `quotation_price`
--
ALTER TABLE `quotation_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `reference_no` (`reference_no`);

--
-- Indices de la tabla `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`reference_no`),
  ADD KEY `product_id` (`item_id`);

--
-- Indices de la tabla `selling_info`
--
ALTER TABLE `selling_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `selling_item`
--
ALTER TABLE `selling_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indices de la tabla `selling_price`
--
ALTER TABLE `selling_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indices de la tabla `sell_logs`
--
ALTER TABLE `sell_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shortcut_links`
--
ALTER TABLE `shortcut_links`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sms_schedule`
--
ALTER TABLE `sms_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `people_type` (`people_type`);

--
-- Indices de la tabla `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indices de la tabla `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  ADD PRIMARY KEY (`s2s_id`),
  ADD KEY `sup_id` (`sup_id`);

--
-- Indices de la tabla `taxrates`
--
ALTER TABLE `taxrates`
  ADD PRIMARY KEY (`taxrate_id`);

--
-- Indices de la tabla `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indices de la tabla `unit_to_store`
--
ALTER TABLE `unit_to_store`
  ADD PRIMARY KEY (`unit2s_id`),
  ADD KEY `uunit_id` (`uunit_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indices de la tabla `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `user_to_store`
--
ALTER TABLE `user_to_store`
  ADD PRIMARY KEY (`u2s_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  MODIFY `ba2s` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `boxes`
--
ALTER TABLE `boxes`
  MODIFY `box_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `box_to_store`
--
ALTER TABLE `box_to_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `brand_to_store`
--
ALTER TABLE `brand_to_store`
  MODIFY `b2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorys`
--
ALTER TABLE `categorys`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `category_to_store`
--
ALTER TABLE `category_to_store`
  MODIFY `c2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `currency_to_store`
--
ALTER TABLE `currency_to_store`
  MODIFY `ca2s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `customer_to_store`
--
ALTER TABLE `customer_to_store`
  MODIFY `c2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `customer_transactions`
--
ALTER TABLE `customer_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expense_categorys`
--
ALTER TABLE `expense_categorys`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `holding_info`
--
ALTER TABLE `holding_info`
  MODIFY `info_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `holding_item`
--
ALTER TABLE `holding_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `holding_price`
--
ALTER TABLE `holding_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `income_sources`
--
ALTER TABLE `income_sources`
  MODIFY `source_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `installment_orders`
--
ALTER TABLE `installment_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `installment_payments`
--
ALTER TABLE `installment_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `language_translations`
--
ALTER TABLE `language_translations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12115;

--
-- AUTO_INCREMENT de la tabla `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `mail_sms_tag`
--
ALTER TABLE `mail_sms_tag`
  MODIFY `tag_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pmethods`
--
ALTER TABLE `pmethods`
  MODIFY `pmethod_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pmethod_to_store`
--
ALTER TABLE `pmethod_to_store`
  MODIFY `p2s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pos_register`
--
ALTER TABLE `pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pos_templates`
--
ALTER TABLE `pos_templates`
  MODIFY `template_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pos_template_to_store`
--
ALTER TABLE `pos_template_to_store`
  MODIFY `pt2s` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `printers`
--
ALTER TABLE `printers`
  MODIFY `printer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `printer_to_store`
--
ALTER TABLE `printer_to_store`
  MODIFY `p2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_to_store`
--
ALTER TABLE `product_to_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `purchase_info`
--
ALTER TABLE `purchase_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `purchase_logs`
--
ALTER TABLE `purchase_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `purchase_price`
--
ALTER TABLE `purchase_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quotation_info`
--
ALTER TABLE `quotation_info`
  MODIFY `info_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quotation_item`
--
ALTER TABLE `quotation_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `quotation_price`
--
ALTER TABLE `quotation_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `selling_info`
--
ALTER TABLE `selling_info`
  MODIFY `info_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `selling_item`
--
ALTER TABLE `selling_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `selling_price`
--
ALTER TABLE `selling_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sell_logs`
--
ALTER TABLE `sell_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `shortcut_links`
--
ALTER TABLE `shortcut_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `sms_schedule`
--
ALTER TABLE `sms_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  MODIFY `s2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `taxrates`
--
ALTER TABLE `taxrates`
  MODIFY `taxrate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transfer_items`
--
ALTER TABLE `transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unit_to_store`
--
ALTER TABLE `unit_to_store`
  MODIFY `unit2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_group`
--
ALTER TABLE `user_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_to_store`
--
ALTER TABLE `user_to_store`
  MODIFY `u2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
