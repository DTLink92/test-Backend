-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 18, 2018 at 10:52 AM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accident`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident`
--

CREATE TABLE `accident` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `date_accident` datetime DEFAULT NULL,
  `description_accident` varchar(255) DEFAULT NULL,
  `gravity_accident` varchar(255) DEFAULT NULL,
  `hour_accident` datetime DEFAULT NULL,
  `name_accidentado` varchar(255) DEFAULT NULL,
  `place_accident` varchar(255) DEFAULT NULL,
  `accident_type_id` bigint(20) NOT NULL,
  `area_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accident`
--

INSERT INTO `accident` (`id`, `created_on`, `updated_on`, `version`, `date_accident`, `description_accident`, `gravity_accident`, `hour_accident`, `name_accidentado`, `place_accident`, `accident_type_id`, `area_id`) VALUES
(76, '2018-06-18 09:51:26', NULL, 0, '1969-12-31 19:59:58', '', '', '1969-12-31 19:59:58', 'edilverto perez', 'planta baja de construccion', 67, 5),
(77, '2018-06-18 09:51:26', NULL, 0, '1969-12-31 19:59:58', '', '', '1969-12-31 19:59:58', 'edilvertoww perez', 'planta baja de construccion', 67, 6),
(78, '2018-06-18 09:51:26', NULL, 0, '1969-12-31 19:59:58', '', '', '1969-12-31 19:59:58', 'edilverto perez', 'planta baja de construccion', 67, 5),
(79, '2018-06-18 09:51:26', NULL, 0, '1969-12-31 19:59:58', 'caida de altura un metro', 'lebe', '1969-12-31 19:59:58', 'Edson Pilar', 'construccion', 74, 7),
(80, '2018-06-18 09:51:26', NULL, 0, '1969-12-31 19:59:58', 'la luces inpactaron fuerte sus ojos', 'ensegesimiento por unnos minutos', '1969-12-31 19:59:58', 'Amilcar Medrano', 'planta baja sotano', 75, 5),
(81, '2018-06-18 09:51:26', NULL, 0, '1969-12-31 19:59:58', 'exeso de esfuerzo', 'fractura de brazo', '1969-12-31 19:59:58', 'Eliceo Munes', 'casa de misitro Quistana', 71, 8),
(82, '2018-06-18 09:51:27', NULL, 0, '1969-12-31 19:59:58', 'fractura pie derecho', 'deslizamiento de andamio', '1969-12-31 19:59:58', 'Edy Crespo', ' construccion externa ', 67, 5),
(83, '2018-06-18 09:51:27', NULL, 0, '1969-12-31 19:59:58', 'caida de 4 metros', 'roptura de craneo', '1969-12-31 19:59:58', 'Juan Zalinas', 'planta alta de construccion', 67, 5),
(84, '2018-06-18 09:51:27', NULL, 0, '1969-12-31 19:59:58', 'cortadira de amquinaria', 'desprendimiento piel', '1969-12-31 19:59:58', 'Pedro Alcores', 'planta de construccion', 67, 5),
(85, '2018-06-18 09:51:27', NULL, 0, '1969-12-31 19:59:58', 'golpes de escombros', 'lebe', '1969-12-31 19:59:58', 'Roberto Paniagua', 'planta baja de construccion', 67, 5),
(86, '2018-06-18 09:51:27', NULL, 0, '1969-12-31 19:59:58', 'atropello maquinaria', 'grabe', '1969-12-31 19:59:58', 'Patrecuato Aguilar', 'planta baja ', 73, 5),
(87, '2018-06-18 09:51:27', NULL, 0, '1969-12-31 19:59:58', 'caida de escombros', 'pasable', '1969-12-31 19:59:58', 'Waldo Camacho', 'planta alta bloque B', 70, 8),
(88, '2018-06-18 09:51:28', NULL, 0, '1969-12-31 19:59:58', 'caida de altura de 2 metros', 'grabe', '1969-12-31 19:59:58', 'Roverto Cardoso', 'andamio', 67, 7),
(89, '2018-06-18 09:51:28', NULL, 0, '1969-12-31 19:59:58', 'fractura brazo', 'lebe', '1969-12-31 19:59:58', 'Acimilo perez', 'planta baja de construccion', 70, 6);

-- --------------------------------------------------------

--
-- Table structure for table `accident_cause`
--

CREATE TABLE `accident_cause` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `accident_cause_group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accident_cause`
--

INSERT INTO `accident_cause` (`id`, `created_on`, `updated_on`, `version`, `description`, `accident_cause_group_id`) VALUES
(91, '2018-06-18 09:51:28', NULL, 0, 'falta de experiencia en el cargo', 90),
(92, '2018-06-18 09:51:29', NULL, 0, 'Deficiencia fisica para la albor', 90),
(93, '2018-06-18 09:51:29', NULL, 0, 'No Acatar Ordenes de su Superior', 90),
(94, '2018-06-18 09:51:29', NULL, 0, 'Uso inadecuado de los EPP proporcionados por la empresa', 90),
(95, '2018-06-18 09:51:30', NULL, 0, 'No Uso de los EPP proporcionados por la empresa', 90),
(96, '2018-06-18 09:51:30', NULL, 0, 'tension', 90),
(97, '2018-06-18 09:51:30', NULL, 0, 'Motivacion deficiente', 90),
(98, '2018-06-18 09:51:30', NULL, 0, 'Falta de Habilidad', 90),
(99, '2018-06-18 09:51:30', NULL, 0, 'Otras - Cual...?', 90),
(101, '2018-06-18 09:51:31', NULL, 0, 'falta o Exeso de iluminacion', 100),
(102, '2018-06-18 09:51:31', NULL, 0, 'falta o exeso de vaentilacion', 100),
(103, '2018-06-18 09:51:32', NULL, 0, 'ventilacion deficiente', 100),
(104, '2018-06-18 09:51:32', NULL, 0, 'tarea con sobrecarga (ritmo monotomia entre otros', 100),
(105, '2018-06-18 09:51:32', NULL, 0, 'Falta de comunicacion/Falta de explicacion  de la tarea asignada', 100),
(106, '2018-06-18 09:51:32', NULL, 0, 'Falta de orden y limpieza en el puesto de trabajo', 100),
(107, '2018-06-18 09:51:33', NULL, 0, 'Supervision inadecuada', 100),
(108, '2018-06-18 09:51:33', NULL, 0, 'Abuso y maltrato', 100),
(109, '2018-06-18 09:51:33', NULL, 0, 'Otras - Cual?', 100),
(111, '2018-06-18 09:51:34', NULL, 0, 'Uso de herramientas y Equipos Inadecuados', 110),
(112, '2018-06-18 09:51:35', NULL, 0, 'No asegurar el area de trabajo', 110),
(113, '2018-06-18 09:51:35', NULL, 0, 'No advertir', 110),
(114, '2018-06-18 09:51:35', NULL, 0, 'Exceso de velocidad', 110),
(115, '2018-06-18 09:51:35', NULL, 0, 'Exceso de confianza', 110),
(116, '2018-06-18 09:51:36', NULL, 0, 'Uso de equipos defectuosos', 110),
(117, '2018-06-18 09:51:36', NULL, 0, 'Ubicacion inadecuada de Equipos y herramientas', 110),
(118, '2018-06-18 09:51:36', NULL, 0, 'Levantamiento inadecuado', 110),
(119, '2018-06-18 09:51:36', NULL, 0, 'Bromas', 110),
(120, '2018-06-18 09:51:36', NULL, 0, 'Influencia de bebidas embriagantes', 110),
(121, '2018-06-18 09:51:37', NULL, 0, 'Exposicion al Ruido', 110),
(122, '2018-06-18 09:51:37', NULL, 0, 'Otras - Cual?', 110),
(124, '2018-06-18 09:51:37', NULL, 0, 'Golpeado por...', 123),
(125, '2018-06-18 09:51:38', NULL, 0, 'Atrapado en ...', 123),
(126, '2018-06-18 09:51:38', NULL, 0, 'Atrapado sobre...', 123),
(127, '2018-06-18 09:51:38', NULL, 0, 'Atrapado entre...', 123),
(128, '2018-06-18 09:51:38', NULL, 0, 'Resbalon', 123),
(129, '2018-06-18 09:51:38', NULL, 0, 'Caida a un distinto nivel', 123),
(130, '2018-06-18 09:51:38', NULL, 0, 'Sobreesfuerzo', 123),
(131, '2018-06-18 09:51:38', NULL, 0, 'Otras - Cual?', 123),
(132, '2018-06-18 09:51:38', NULL, 0, '', 123);

-- --------------------------------------------------------

--
-- Table structure for table `accident_causes`
--

CREATE TABLE `accident_causes` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `accident_id` bigint(20) DEFAULT NULL,
  `cause_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accident_cause_group`
--

CREATE TABLE `accident_cause_group` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accident_cause_group`
--

INSERT INTO `accident_cause_group` (`id`, `created_on`, `updated_on`, `version`, `title`) VALUES
(90, '2018-06-18 09:51:28', NULL, 0, 'Factores personales'),
(100, '2018-06-18 09:51:31', NULL, 0, 'Factores Relativos al Ambiente y Lugar de Trabajo'),
(110, '2018-06-18 09:51:34', NULL, 0, 'Acciones y Condiciones Subestandares'),
(123, '2018-06-18 09:51:37', NULL, 0, 'Tipo de Contacto');

-- --------------------------------------------------------

--
-- Table structure for table `accident_type`
--

CREATE TABLE `accident_type` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `code_type_accident` varchar(255) DEFAULT NULL,
  `name_type_accident` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accident_type`
--

INSERT INTO `accident_type` (`id`, `created_on`, `updated_on`, `version`, `code_type_accident`, `name_type_accident`) VALUES
(67, '2018-06-18 09:51:24', NULL, 0, 'accRR', 'accidente de resbalon'),
(68, '2018-06-18 09:51:25', NULL, 0, 'accAA', 'caida de altura o andamio'),
(69, '2018-06-18 09:51:25', NULL, 0, 'accEO', 'caida de escombros y/o objetos'),
(70, '2018-06-18 09:51:25', NULL, 0, 'accEE', 'Electrocutacion'),
(71, '2018-06-18 09:51:25', NULL, 0, 'accII', 'Incendios'),
(72, '2018-06-18 09:51:25', NULL, 0, 'accEX', 'Explociones'),
(73, '2018-06-18 09:51:25', NULL, 0, 'accATR', 'Accidente de Atrapamiento'),
(74, '2018-06-18 09:51:25', NULL, 0, 'accMM', 'Accidente de Maquinaria'),
(75, '2018-06-18 09:51:26', NULL, 0, 'accVV', 'Accidente Vehicular');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `created_on`, `updated_on`, `version`, `detail`, `name`, `project_id`) VALUES
(5, '2018-06-18 09:51:15', NULL, 0, 'details1', 'Electricidad', 1),
(6, '2018-06-18 09:51:15', NULL, 0, 'details1', 'Fachado', 3),
(7, '2018-06-18 09:51:15', NULL, 0, 'details1', 'Pintura', 2),
(8, '2018-06-18 09:51:15', NULL, 0, 'details1', 'Plomeria', 4);

-- --------------------------------------------------------

--
-- Table structure for table `assign_equipment`
--

CREATE TABLE `assign_equipment` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `date_assign` datetime DEFAULT NULL,
  `date_return` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_employee` int(11) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assign_equipment`
--

INSERT INTO `assign_equipment` (`id`, `created_on`, `updated_on`, `version`, `date_assign`, `date_return`, `description`, `status_employee`, `employee_id`, `supervisor_id`) VALUES
(143, '2018-06-18 09:51:40', NULL, 0, '2015-05-15 00:00:00', '2015-06-20 00:00:00', 'Devuelto en buen estado', 1, 59, 51),
(144, '2018-06-18 09:51:40', NULL, 0, '2015-05-30 00:00:00', '2015-06-30 00:00:00', 'Herramienta devuelta con fallas', 1, 61, 53),
(145, '2018-06-18 09:51:40', NULL, 0, '2016-05-30 00:00:00', '2016-06-30 00:00:00', 'Equipo necesita mantenimiento', 1, 59, 55);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `corrective_measures`
--

CREATE TABLE `corrective_measures` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_assign_equipment`
--

CREATE TABLE `detail_assign_equipment` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `assign_equipment_id` bigint(20) NOT NULL,
  `equipment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_assign_equipment`
--

INSERT INTO `detail_assign_equipment` (`id`, `created_on`, `updated_on`, `version`, `assign_equipment_id`, `equipment_id`) VALUES
(146, '2018-06-18 09:51:40', NULL, 0, 143, 137),
(147, '2018-06-18 09:51:40', NULL, 0, 143, 141),
(148, '2018-06-18 09:51:41', NULL, 0, 144, 137),
(149, '2018-06-18 09:51:41', NULL, 0, 145, 141),
(150, '2018-06-18 09:51:41', NULL, 0, 145, 142),
(151, '2018-06-18 09:51:41', NULL, 0, 144, 141),
(152, '2018-06-18 09:51:41', NULL, 0, 145, 139);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `ci` bigint(20) DEFAULT NULL,
  `civil_state` varchar(255) DEFAULT NULL,
  `dependencies_amount` int(11) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `profile_image` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `created_on`, `updated_on`, `version`, `birthday`, `ci`, `civil_state`, `dependencies_amount`, `experience`, `first_name`, `genre`, `last_name`, `phone_number`, `profile_image`) VALUES
(30, '2018-06-18 09:51:19', NULL, 0, '3893-11-01 00:00:00', 7854956, 'Casado/a', NULL, NULL, 'evaluado', 'Otro', 'evaluado', 4896521, NULL),
(31, '2018-06-18 09:51:20', NULL, 0, '3893-11-01 00:00:00', 7854956, 'Casado/a', NULL, NULL, 'evaluador', 'Otro', 'evaluador', 4896521, NULL),
(35, '2018-06-18 09:51:20', NULL, 0, '1969-12-31 19:59:58', 7854113, 'Casado/a', 0, NULL, 'Juan', 'Masculino', 'Rojas', 4526134, NULL),
(37, '2018-06-18 09:51:21', NULL, 0, '1969-12-31 19:59:58', 7854124, 'Soltero/a', 0, NULL, 'Carla', 'Femenino', 'Rojas', 4528134, NULL),
(39, '2018-06-18 09:51:21', NULL, 0, '1969-12-31 19:59:58', 7814124, 'Soltero/a', 0, NULL, 'Gabriela', 'Femenino', 'Rocha', 4526115, NULL),
(41, '2018-06-18 09:51:21', NULL, 0, '1969-12-31 19:59:58', 7154124, 'Soltero/a', 0, NULL, 'Rodrigo', 'Masculino', 'Perez', 4526135, NULL),
(43, '2018-06-18 09:51:21', NULL, 0, '1969-12-31 19:59:58', 7859123, 'Casado/a', 0, NULL, 'Marcelo', 'Masculino', 'Rios', 4526144, NULL),
(45, '2018-06-18 09:51:22', NULL, 0, '1969-12-31 19:59:58', 7854124, 'Soltero/a', 0, NULL, 'Monica', 'Femenino', 'Peredo', 4526134, NULL),
(47, '2018-06-18 09:51:22', NULL, 0, '1969-12-31 19:59:58', 7857124, 'Soltero/a', 0, NULL, 'Fernanda', 'Femenino', 'Rocha', 4526135, NULL),
(49, '2018-06-18 09:51:22', NULL, 0, '1969-12-31 19:59:58', 7454124, 'Soltero/a', 0, NULL, 'Brian', 'Masculino', 'Montecinos', 4526145, NULL),
(51, '2018-06-18 09:51:22', NULL, 0, '1969-12-31 19:59:58', 7754123, 'Casado/a', 0, NULL, 'Leo', 'Masculino', 'Rios', 4527144, NULL),
(53, '2018-06-18 09:51:22', NULL, 0, '1969-12-31 19:59:58', 7814124, 'Soltero/a', 0, NULL, 'Micaela', 'Femenino', 'Paredes', 4426134, NULL),
(55, '2018-06-18 09:51:23', NULL, 0, '1969-12-31 19:59:58', 7854524, 'Soltero/a', 0, NULL, 'Paola', 'Femenino', 'Arnez', 5526135, NULL),
(57, '2018-06-18 09:51:23', NULL, 0, '1969-12-31 19:59:58', 7854134, 'Soltero/a', 0, NULL, 'Ricardo', 'Masculino', 'Fernandez', 4526145, NULL),
(59, '2018-06-18 09:51:23', NULL, 0, '1969-12-31 19:59:58', 7854124, 'Casado/a', 0, NULL, 'Jhon', 'Masculino', 'Stark', 4527144, NULL),
(61, '2018-06-18 09:51:23', NULL, 0, '1969-12-31 19:59:58', 7854125, 'Soltero/a', 0, NULL, 'Diana', 'Femenino', 'Claros', 4426134, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_accident`
--

CREATE TABLE `employee_accident` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `detalle_lesion` varchar(255) DEFAULT NULL,
  `tipo_lesion` varchar(255) DEFAULT NULL,
  `zona_lesion` varchar(255) DEFAULT NULL,
  `accident_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_assign_equipment`
--

CREATE TABLE `employee_assign_equipment` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `date_assign` datetime DEFAULT NULL,
  `date_return` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `employee_eq_id` bigint(20) NOT NULL,
  `equipment_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `dateofpurchase` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_equipment` longblob,
  `manufactured` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `warranty` varchar(255) DEFAULT NULL,
  `type_equipment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `created_on`, `updated_on`, `version`, `brand`, `code`, `dateofpurchase`, `description`, `image_equipment`, `manufactured`, `name`, `status`, `warranty`, `type_equipment_id`) VALUES
(137, '2018-06-18 09:51:39', NULL, 0, 'Cat', 'MZD', '3918-06-08 00:00:00', NULL, NULL, 'Italia', 'Mezcladora', 'Active', '4 años', 133),
(138, '2018-06-18 09:51:39', NULL, 0, 'Asia', 'ASh6', '3917-05-03 00:00:00', NULL, NULL, 'China', 'Helmet safety', 'Active', '1 años', 136),
(139, '2018-06-18 09:51:39', NULL, 0, 'Trupper', 'Amdr', '3916-07-18 00:00:00', NULL, NULL, 'Francia', 'Amoladora', 'Inactive', '2 años', 135),
(140, '2018-06-18 09:51:40', NULL, 0, 'Skyl', 'Vbdr', '3915-03-18 00:00:00', NULL, NULL, 'Usa', 'Vibradora', 'Active', '3 años', 134),
(141, '2018-06-18 09:51:40', NULL, 0, 'Cat', 'NVD', '3918-06-20 00:00:00', NULL, NULL, 'Alemania', 'Niveladora', 'Inactive', '2 años', 133),
(142, '2018-06-18 09:51:40', NULL, 0, 'Bosch', 'OXN', '3917-07-10 00:00:00', NULL, NULL, 'Francia', 'Oxigeno', 'Active', '4 años', 133);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE `evaluation` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `evaluated_id` bigint(20) NOT NULL,
  `evaluator_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evaluation`
--

INSERT INTO `evaluation` (`id`, `created_on`, `updated_on`, `version`, `evaluated_id`, `evaluator_id`, `type_id`) VALUES
(34, '2018-06-18 09:51:20', NULL, 0, 30, 31, 29);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_indicator_values`
--

CREATE TABLE `evaluation_indicator_values` (
  `evaluation_id` bigint(20) NOT NULL,
  `indicator_values_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evaluation_indicator_values`
--

INSERT INTO `evaluation_indicator_values` (`evaluation_id`, `indicator_values_id`) VALUES
(34, 32),
(34, 33);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_metric`
--

CREATE TABLE `evaluation_metric` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evaluation_metric`
--

INSERT INTO `evaluation_metric` (`id`, `created_on`, `updated_on`, `version`, `description`, `value`) VALUES
(20, '2018-06-18 09:51:18', NULL, 0, 'Excelente', 100),
(21, '2018-06-18 09:51:18', NULL, 0, 'Muy bueno', 85),
(22, '2018-06-18 09:51:18', NULL, 0, 'Bueno', 75),
(23, '2018-06-18 09:51:18', NULL, 0, 'Regular', 65),
(24, '2018-06-18 09:51:18', NULL, 0, 'Deficiente', 45);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158),
(158);

-- --------------------------------------------------------

--
-- Table structure for table `indicator_value`
--

CREATE TABLE `indicator_value` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `management_indicator_id` bigint(20) NOT NULL,
  `metric_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indicator_value`
--

INSERT INTO `indicator_value` (`id`, `created_on`, `updated_on`, `version`, `management_indicator_id`, `metric_id`) VALUES
(32, '2018-06-18 09:51:20', NULL, 0, 25, 20),
(33, '2018-06-18 09:51:20', NULL, 0, 26, 23);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `image` longblob,
  `name` varchar(255) DEFAULT NULL,
  `sub_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `management_indicator`
--

CREATE TABLE `management_indicator` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `competence` varchar(255) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `management_indicator`
--

INSERT INTO `management_indicator` (`id`, `created_on`, `updated_on`, `version`, `competence`, `criteria`) VALUES
(25, '2018-06-18 09:51:19', NULL, 0, 'Calidad y conocimiento', 'Posee conocimiento y destresas que le permitan ejercer efectivamente su puesto?'),
(26, '2018-06-18 09:51:19', NULL, 0, 'Trabajo en Equipo', 'Solicita participacion de');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `abilities` varchar(255) DEFAULT NULL,
  `is_important` bit(1) NOT NULL,
  `registration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`id`, `created_on`, `updated_on`, `version`, `description`, `abilities`, `is_important`, `registration_date`) VALUES
(9, '2018-06-18 09:51:15', NULL, 0, 'Descripcion obrero1', 'Carpintero', b'1', NULL),
(10, '2018-06-18 09:51:15', NULL, 0, 'Descripcion obrero1', 'Carpintero', b'1', NULL),
(11, '2018-06-18 09:51:16', NULL, 0, 'Descripcion obrero1', 'Carpintero', b'1', NULL),
(12, '2018-06-18 09:51:16', NULL, 0, 'Descripcion obrero1', 'Carpintero', b'1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `process` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `higher_work_position_id` bigint(20) DEFAULT NULL,
  `performance_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `created_on`, `updated_on`, `version`, `code`, `name`, `process`, `purpose`, `area_id`, `higher_work_position_id`, `performance_id`) VALUES
(13, '2018-06-18 09:51:16', NULL, 0, 'Default Gerencia', 'Default Gerencia', 'Default Gerencia', 'Responsable de la construccion para su conclucion y entrega a tiempo', 5, NULL, NULL),
(14, '2018-06-18 09:51:17', NULL, 0, 'CD-01', 'Gerente de proyecto', 'Operativo', 'Responsable de la construccion para su conclucion y entrega a tiempo', 6, 13, 9),
(15, '2018-06-18 09:51:17', NULL, 0, 'CD-02', 'Arquitecto', 'Operativo', 'Responsable de la contratacion de empleados para puesta en marcha y su respectivo seguimiento', 5, 14, 10),
(16, '2018-06-18 09:51:17', NULL, 0, 'CD-03', 'Supervisor de obra', 'misional', 'Asistir en las labores y representarlo en su ausencia, ademas del adecuado conocimiento y manejo de equipos a utilizar', 7, 15, 11),
(17, '2018-06-18 09:51:17', NULL, 0, 'CD-04', 'Maestro Albanil', 'Contruccion', 'Responsable del montaje y la contruccion en la obra', 8, 16, 12);

-- --------------------------------------------------------

--
-- Table structure for table `position_assign_employee`
--

CREATE TABLE `position_assign_employee` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `init_date` datetime DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position_assign_employee`
--

INSERT INTO `position_assign_employee` (`id`, `created_on`, `updated_on`, `version`, `description`, `finish_date`, `init_date`, `salary`, `status`, `employee_id`, `position_id`, `supervisor_id`) VALUES
(36, '2018-06-18 09:51:20', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 1000, NULL, 35, 14, NULL),
(38, '2018-06-18 09:51:21', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 1000, NULL, 37, 14, NULL),
(40, '2018-06-18 09:51:21', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 1000, NULL, 39, 14, NULL),
(42, '2018-06-18 09:51:21', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 1000, NULL, 41, 14, NULL),
(44, '2018-06-18 09:51:21', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 900, NULL, 43, 15, 35),
(46, '2018-06-18 09:51:22', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 900, NULL, 45, 15, 37),
(48, '2018-06-18 09:51:22', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 900, NULL, 47, 15, 39),
(50, '2018-06-18 09:51:22', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 900, NULL, 49, 15, 41),
(52, '2018-06-18 09:51:22', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 800, NULL, 51, 16, 43),
(54, '2018-06-18 09:51:23', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 800, NULL, 53, 16, 45),
(56, '2018-06-18 09:51:23', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 800, NULL, 55, 16, 47),
(58, '2018-06-18 09:51:23', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 800, NULL, 57, 16, 49),
(60, '2018-06-18 09:51:23', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 700, NULL, 59, 17, 57),
(62, '2018-06-18 09:51:24', NULL, 0, NULL, '1969-12-31 19:59:58', '1969-12-31 19:59:58', 800, NULL, 61, 17, 55);

-- --------------------------------------------------------

--
-- Table structure for table `position_equipment`
--

CREATE TABLE `position_equipment` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `equipment_id` bigint(20) NOT NULL,
  `position_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position_equipment`
--

INSERT INTO `position_equipment` (`id`, `created_on`, `updated_on`, `version`, `equipment_id`, `position_id`) VALUES
(153, '2018-06-18 09:51:41', NULL, 0, 137, 17),
(154, '2018-06-18 09:51:41', NULL, 0, 141, 17),
(155, '2018-06-18 09:51:42', NULL, 0, 138, 15),
(156, '2018-06-18 09:51:42', NULL, 0, 138, 14),
(157, '2018-06-18 09:51:42', NULL, 0, 142, 14);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `economic_loss` double NOT NULL,
  `estimated_date` datetime DEFAULT NULL,
  `gestion` varchar(255) DEFAULT NULL,
  `inversion` double NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `created_on`, `updated_on`, `version`, `delivery_date`, `economic_loss`, `estimated_date`, `gestion`, `inversion`, `name`) VALUES
(1, '2018-06-18 09:51:14', NULL, 0, NULL, 0, NULL, '2015', 0, 'Vivienda 1 '),
(2, '2018-06-18 09:51:14', NULL, 0, NULL, 0, NULL, '2016', 0, 'Edificacion 1'),
(3, '2018-06-18 09:51:14', NULL, 0, NULL, 0, NULL, '2017', 0, 'Vivienda 2'),
(4, '2018-06-18 09:51:14', NULL, 0, NULL, 0, NULL, '2018', 0, 'Edificacion 2');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_profile`
--

CREATE TABLE `recruitment_profile` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `verification` varchar(255) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recruitment_profile`
--

INSERT INTO `recruitment_profile` (`id`, `created_on`, `updated_on`, `version`, `description`, `requirement`, `verification`, `position_id`) VALUES
(18, '2018-06-18 09:51:18', NULL, 0, 'Educacion', 'tecnico de Archivo', 'Certificacion', 14),
(19, '2018-06-18 09:51:18', NULL, 0, 'Experiencia', '3 anios minimo en funciones similares', 'Certificaciones o referencias', 14);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `created_on`, `updated_on`, `version`, `role_name`) VALUES
(63, '2018-06-18 09:51:24', NULL, 0, 'Administrator'),
(64, '2018-06-18 09:51:24', NULL, 0, 'Regular User');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `type_equipment`
--

CREATE TABLE `type_equipment` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description_type_equipment` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_equipment`
--

INSERT INTO `type_equipment` (`id`, `created_on`, `updated_on`, `version`, `description_type_equipment`, `name`) VALUES
(133, '2018-06-18 09:51:39', NULL, 0, 'Maquinarias pesadas y livianas', 'Maquinaria'),
(134, '2018-06-18 09:51:39', NULL, 0, 'Heavy Machinary for Operator', 'Heavy Machinary'),
(135, '2018-06-18 09:51:39', NULL, 0, 'Light Machinary for Builders', 'Light Machinary'),
(136, '2018-06-18 09:51:39', NULL, 0, 'Equipment Safety  for Builders', 'Light Machinary');

-- --------------------------------------------------------

--
-- Table structure for table `type_evaluator`
--

CREATE TABLE `type_evaluator` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_evaluator`
--

INSERT INTO `type_evaluator` (`id`, `created_on`, `updated_on`, `version`, `description`) VALUES
(27, '2018-06-18 09:51:19', NULL, 0, 'Jefe Inmediato'),
(28, '2018-06-18 09:51:19', NULL, 0, 'Supervisor'),
(29, '2018-06-18 09:51:19', NULL, 0, 'Colega(par)');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_on`, `updated_on`, `version`, `first_name`, `last_name`, `login`, `password`, `role_id`) VALUES
(65, '2018-06-18 09:51:24', NULL, 0, 'Rodrigo', 'Perez', 'Admin', 'Admin', 63),
(66, '2018-06-18 09:51:24', NULL, 0, 'Rodrigo', 'Perez', 'user1234', 'user1234', 64);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident`
--
ALTER TABLE `accident`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2bvaa29m72m8jjc48l6gx9jbx` (`accident_type_id`),
  ADD KEY `FK8w2x16bnggrxr8vw186k84qx4` (`area_id`);

--
-- Indexes for table `accident_cause`
--
ALTER TABLE `accident_cause`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3tdoi9fkgstn7nauhjbv62gwq` (`accident_cause_group_id`);

--
-- Indexes for table `accident_causes`
--
ALTER TABLE `accident_causes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqfjef63hnn0d00xfrmsg84tec` (`accident_id`),
  ADD KEY `FK334lp45hg3d1lfrvy64w6glsx` (`cause_id`);

--
-- Indexes for table `accident_cause_group`
--
ALTER TABLE `accident_cause_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accident_type`
--
ALTER TABLE `accident_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpowgqvwn135l8sfhiol7y4m8` (`project_id`);

--
-- Indexes for table `assign_equipment`
--
ALTER TABLE `assign_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbdijurvhgkrxqp8w9ftlmr15o` (`employee_id`),
  ADD KEY `FK233hrjj38sk4fov3gj71p3q0f` (`supervisor_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corrective_measures`
--
ALTER TABLE `corrective_measures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmx6g57mh63ggkpdj01e4gxxjf` (`area_id`),
  ADD KEY `FK9t9d8ibvn22vpy3gjt5jcr7sa` (`supervisor_id`);

--
-- Indexes for table `detail_assign_equipment`
--
ALTER TABLE `detail_assign_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK72s6ap8s7lth4aschvuk0qxjp` (`assign_equipment_id`),
  ADD KEY `FKfqcj3ll426enyqhftjisnlf9m` (`equipment_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_accident`
--
ALTER TABLE `employee_accident`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5bhocfwfq1rxio9pcfuotu6f3` (`accident_id`),
  ADD KEY `FK9oeef32qy30x515wc6eflbv4e` (`employee_id`);

--
-- Indexes for table `employee_assign_equipment`
--
ALTER TABLE `employee_assign_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjs3vau96lcu3ppn0j97womimo` (`employee_eq_id`),
  ADD KEY `FKiybxj1x5mw4eyjj4kjnvnxi1d` (`equipment_id`),
  ADD KEY `FK6sjqqyeb1k0grea250unm2dmb` (`supervisor_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp9mafovemei881jr5g7m7ofbv` (`type_equipment_id`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_jaix0577f0btjv2nc4vuoemhh` (`evaluated_id`),
  ADD UNIQUE KEY `UK_q5fphj34y6w2emug2cd1337s2` (`evaluator_id`),
  ADD UNIQUE KEY `UK_js6g4obefunhkecc17wheds25` (`type_id`);

--
-- Indexes for table `evaluation_indicator_values`
--
ALTER TABLE `evaluation_indicator_values`
  ADD UNIQUE KEY `UK_n3p0ii14bfj9d0ghfk2bt3bm2` (`indicator_values_id`),
  ADD KEY `FK4nd1y3q5pe0k1xxgtyyywfny2` (`evaluation_id`);

--
-- Indexes for table `evaluation_metric`
--
ALTER TABLE `evaluation_metric`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicator_value`
--
ALTER TABLE `indicator_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_fd6qtvpw6tri1hq5rs3peihl3` (`management_indicator_id`),
  ADD UNIQUE KEY `UK_ppm86twti8ranb534oc9j85tw` (`metric_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKo33ug6nywet8hkt5mnen9016t` (`sub_category_id`);

--
-- Indexes for table `management_indicator`
--
ALTER TABLE `management_indicator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKo4iswioco28jggcvwjewxrgcf` (`area_id`),
  ADD KEY `FKghh56aiuad3alrsb3idb9xxi1` (`higher_work_position_id`),
  ADD KEY `FKd1vgbpwrlo78uttv7axi0dyha` (`performance_id`);

--
-- Indexes for table `position_assign_employee`
--
ALTER TABLE `position_assign_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl3g0tj0w5fhf34fe8doh30axx` (`employee_id`),
  ADD KEY `FKejcvskj7xhmb3ii6kr4uqukqr` (`position_id`),
  ADD KEY `FKii64lsr60id3bd2a6169w5y27` (`supervisor_id`);

--
-- Indexes for table `position_equipment`
--
ALTER TABLE `position_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4218d7p6bj3ms73hcewsgmx1c` (`equipment_id`),
  ADD KEY `FKld7acs3ivkvf8kv7e9wmodokl` (`position_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitment_profile`
--
ALTER TABLE `recruitment_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2dihnvnfq72s1c8rta7gtxov9` (`position_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_gua6bdolxg704ggnoeq1qr7er` (`category_id`);

--
-- Indexes for table `type_equipment`
--
ALTER TABLE `type_equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_evaluator`
--
ALTER TABLE `type_evaluator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accident`
--
ALTER TABLE `accident`
  ADD CONSTRAINT `FK2bvaa29m72m8jjc48l6gx9jbx` FOREIGN KEY (`accident_type_id`) REFERENCES `accident_type` (`id`),
  ADD CONSTRAINT `FK8w2x16bnggrxr8vw186k84qx4` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`);

--
-- Constraints for table `accident_cause`
--
ALTER TABLE `accident_cause`
  ADD CONSTRAINT `FK3tdoi9fkgstn7nauhjbv62gwq` FOREIGN KEY (`accident_cause_group_id`) REFERENCES `accident_cause_group` (`id`);

--
-- Constraints for table `accident_causes`
--
ALTER TABLE `accident_causes`
  ADD CONSTRAINT `FK334lp45hg3d1lfrvy64w6glsx` FOREIGN KEY (`cause_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKqfjef63hnn0d00xfrmsg84tec` FOREIGN KEY (`accident_id`) REFERENCES `accident` (`id`);

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `FKpowgqvwn135l8sfhiol7y4m8` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Constraints for table `assign_equipment`
--
ALTER TABLE `assign_equipment`
  ADD CONSTRAINT `FK233hrjj38sk4fov3gj71p3q0f` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKbdijurvhgkrxqp8w9ftlmr15o` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `corrective_measures`
--
ALTER TABLE `corrective_measures`
  ADD CONSTRAINT `FK9t9d8ibvn22vpy3gjt5jcr7sa` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKmx6g57mh63ggkpdj01e4gxxjf` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`);

--
-- Constraints for table `detail_assign_equipment`
--
ALTER TABLE `detail_assign_equipment`
  ADD CONSTRAINT `FK72s6ap8s7lth4aschvuk0qxjp` FOREIGN KEY (`assign_equipment_id`) REFERENCES `assign_equipment` (`id`),
  ADD CONSTRAINT `FKfqcj3ll426enyqhftjisnlf9m` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

--
-- Constraints for table `employee_accident`
--
ALTER TABLE `employee_accident`
  ADD CONSTRAINT `FK5bhocfwfq1rxio9pcfuotu6f3` FOREIGN KEY (`accident_id`) REFERENCES `accident` (`id`),
  ADD CONSTRAINT `FK9oeef32qy30x515wc6eflbv4e` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `employee_assign_equipment`
--
ALTER TABLE `employee_assign_equipment`
  ADD CONSTRAINT `FK6sjqqyeb1k0grea250unm2dmb` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKiybxj1x5mw4eyjj4kjnvnxi1d` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `FKjs3vau96lcu3ppn0j97womimo` FOREIGN KEY (`employee_eq_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `FKp9mafovemei881jr5g7m7ofbv` FOREIGN KEY (`type_equipment_id`) REFERENCES `type_equipment` (`id`);

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK9y5yhy9spfcvpjjyah7b0q37y` FOREIGN KEY (`type_id`) REFERENCES `type_evaluator` (`id`),
  ADD CONSTRAINT `FKa4c0gchro6msae6a5sgxktxns` FOREIGN KEY (`evaluated_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKmlwdxxwsw4x00bcxgrm2uajon` FOREIGN KEY (`evaluator_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `evaluation_indicator_values`
--
ALTER TABLE `evaluation_indicator_values`
  ADD CONSTRAINT `FK4nd1y3q5pe0k1xxgtyyywfny2` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluation` (`id`),
  ADD CONSTRAINT `FKpv9tkolnnxt9wnkp4l0cloxb5` FOREIGN KEY (`indicator_values_id`) REFERENCES `indicator_value` (`id`);

--
-- Constraints for table `indicator_value`
--
ALTER TABLE `indicator_value`
  ADD CONSTRAINT `FKagqjfu3uct4ja0jv4qlhply3d` FOREIGN KEY (`management_indicator_id`) REFERENCES `management_indicator` (`id`),
  ADD CONSTRAINT `FKblf2tiidey886ra1q55synrij` FOREIGN KEY (`metric_id`) REFERENCES `evaluation_metric` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FKo33ug6nywet8hkt5mnen9016t` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`);

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `FKd1vgbpwrlo78uttv7axi0dyha` FOREIGN KEY (`performance_id`) REFERENCES `performance` (`id`),
  ADD CONSTRAINT `FKghh56aiuad3alrsb3idb9xxi1` FOREIGN KEY (`higher_work_position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `FKo4iswioco28jggcvwjewxrgcf` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`);

--
-- Constraints for table `position_assign_employee`
--
ALTER TABLE `position_assign_employee`
  ADD CONSTRAINT `FKejcvskj7xhmb3ii6kr4uqukqr` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `FKii64lsr60id3bd2a6169w5y27` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKl3g0tj0w5fhf34fe8doh30axx` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `position_equipment`
--
ALTER TABLE `position_equipment`
  ADD CONSTRAINT `FK4218d7p6bj3ms73hcewsgmx1c` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `FKld7acs3ivkvf8kv7e9wmodokl` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`);

--
-- Constraints for table `recruitment_profile`
--
ALTER TABLE `recruitment_profile`
  ADD CONSTRAINT `FK2dihnvnfq72s1c8rta7gtxov9` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`);

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `FKl65dyy5me2ypoyj8ou1hnt64e` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
