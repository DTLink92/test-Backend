-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2018 at 01:25 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_indicator_values`
--

CREATE TABLE `evaluation_indicator_values` (
  `evaluation_id` bigint(20) NOT NULL,
  `indicator_values_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1);

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
