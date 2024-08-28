-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2023 at 09:56 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lashtechdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add session', 4, 'add_session'),
(14, 'Can change session', 4, 'change_session'),
(15, 'Can delete session', 4, 'delete_session'),
(16, 'Can view session', 4, 'view_session'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add salon', 7, 'add_salon'),
(26, 'Can change salon', 7, 'change_salon'),
(27, 'Can delete salon', 7, 'delete_salon'),
(28, 'Can view salon', 7, 'view_salon'),
(29, 'Can add appointment', 8, 'add_appointment'),
(30, 'Can change appointment', 8, 'change_appointment'),
(31, 'Can delete appointment', 8, 'delete_appointment'),
(32, 'Can view appointment', 8, 'view_appointment');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'contenttypes', 'contenttype'),
(8, 'obj', 'appointment'),
(7, 'obj', 'salon'),
(5, 'obj', 'user'),
(4, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-10 13:30:09.501016'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-10-10 13:30:09.547890'),
(3, 'auth', '0001_initial', '2023-10-10 13:30:09.766632'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-10-10 13:30:09.807643'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-10-10 13:30:09.814639'),
(6, 'auth', '0004_alter_user_username_opts', '2023-10-10 13:30:09.819649'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-10-10 13:30:09.825632'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-10-10 13:30:09.827631'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-10-10 13:30:09.833628'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-10-10 13:30:09.840652'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-10-10 13:30:09.861481'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-10-10 13:30:09.874940'),
(13, 'auth', '0011_update_proxy_permissions', '2023-10-10 13:30:09.880738'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-10-10 13:30:09.887947'),
(15, 'obj', '0001_initial', '2023-10-10 13:30:10.142143'),
(16, 'sessions', '0001_initial', '2023-10-10 13:30:10.172366'),
(17, 'admin', '0001_initial', '2023-10-18 02:30:51.961190'),
(18, 'admin', '0002_logentry_remove_auto_add', '2023-10-18 02:30:51.968977'),
(19, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-18 02:30:51.977430'),
(20, 'obj', '0002_salon', '2023-10-18 02:30:52.003898'),
(21, 'obj', '0003_appointment', '2023-10-22 20:20:19.185451'),
(22, 'obj', '0004_remove_appointment_age', '2023-10-22 20:23:56.197152'),
(23, 'obj', '0005_remove_appointment_address', '2023-10-22 20:31:40.415515'),
(24, 'obj', '0006_remove_appointment_user', '2023-10-22 20:43:57.785097'),
(25, 'obj', '0007_appointment_user', '2023-10-22 21:09:56.056864'),
(26, 'obj', '0008_rename_user_appointment_userid', '2023-10-22 21:12:56.077394'),
(27, 'obj', '0009_appointment_file', '2023-10-24 11:18:06.093547'),
(28, 'obj', '0010_appointment_is_verified', '2023-10-24 15:23:59.461071');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('95wqr8b08h2awivsjh20lh4ylv7ihe8s', '.eJxVjEEOwiAQRe_C2hCgzBRcuvcMzTCAVA0kpV0Z765NutDtf-_9l5hoW8u09bRMcxRn4cXpdwvEj1R3EO9Ub01yq-syB7kr8qBdXltMz8vh_h0U6uVbZ8WYMoJ3Kg9MMViFg2aII6Ay2ngDWY9BkwVCDjZpMuDQZIsORgbx_gDfHDdE:1qvfxo:VnxryJO6TPPLzpqhhKcMrRFWjn1XwnakcE-zW9Djqis', '2023-11-08 15:38:32.062097');

-- --------------------------------------------------------

--
-- Table structure for table `obj_appointment`
--

CREATE TABLE `obj_appointment` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `user_time` time(6) DEFAULT NULL,
  `email_id` varchar(254) DEFAULT NULL,
  `userid_id` bigint(20) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obj_appointment`
--

INSERT INTO `obj_appointment` (`id`, `full_name`, `contact_no`, `start_date`, `user_time`, `email_id`, `userid_id`, `file`, `is_verified`) VALUES
(7, 'Joseph Joestar', 9123456789, '2023-10-26', '13:20:00.000000', 'josephjoestar@gmail.com', 7, 'images/sample_receipt.jpeg', 1),
(8, 'Jasfer Torres', 9427420435, '2023-10-26', '14:00:00.000000', 'jasfertorres58@gmail.com', 8, 'images/sample_receipt.jpeg', 1),
(9, 'Lev Hoen Heim', 9234567891, '2023-10-26', '15:30:00.000000', 'levhoenheim35@gmail.com', 9, 'images/sample_receipt_ZWKhhXv.jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `obj_salon`
--

CREATE TABLE `obj_salon` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `obj_user`
--

CREATE TABLE `obj_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obj_user`
--

INSERT INTO `obj_user` (`id`, `password`, `is_superuser`, `email`, `user_name`, `is_active`, `is_staff`, `date_joined`, `last_login`) VALUES
(1, 'pbkdf2_sha256$600000$L12ltCYxBCNNXnxMkGA7fp$PxoRpTft3pnKkoNNcFN34gpCyYZJk9iVIuGbbuChIJI=', 1, 'admin@admin.com', 'Admin', 1, 1, '2023-10-10 13:35:13.067169', '2023-10-24 13:38:28.564917'),
(2, 'pbkdf2_sha256$600000$SAJajybBmmA8Y0G2DOb7Ye$RrZfGR1UDtbkYDLaYN1o3B6x/9X83GxpGtuCM2S1smw=', 0, 'floresmathew96@gmail.com', 'Matmat69', 1, 0, '2023-10-10 13:44:51.517270', '2023-10-24 05:09:19.108630'),
(4, 'pbkdf2_sha256$600000$HKfEx9HcsT0l4QiryAYgM8$UA+y9mRotc8j/2StZCaR8ZHM1FBPbxoj1djBJGtA+d8=', 0, 'catherinepilapil@gmail.com', 'cathcath', 1, 0, '2023-10-23 07:48:09.488845', '2023-10-23 07:48:37.567104'),
(5, 'pbkdf2_sha256$600000$I0Zu2Ghd8eacz3er1DMkWm$oKI4WuFQpY+lulB8oDwlR8LOv03EB51zRCDTJcx9aI8=', 0, 'elai@gmail.com', 'jenny', 1, 0, '2023-10-23 13:25:11.182476', '2023-10-23 13:25:54.431304'),
(6, 'pbkdf2_sha256$600000$9pyNgQQGjBtQ00rKzn2vdY$rHHKr9Rts3nEKoJrjhNs/LRhgeMhhK2vauiVvqorPV0=', 0, 'kirayoshikage@gmail.com', 'kirayoshi', 1, 0, '2023-10-24 13:39:00.359438', '2023-10-24 13:39:09.368591'),
(7, 'pbkdf2_sha256$600000$cYzkYhLzJMgESzGKl0XOkt$YMHXGMI9ZImb+XqipSDsoRVXRZT7R6oFABQGxDhwpA0=', 0, 'josephjoestar@gmail.com', 'jojo', 1, 0, '2023-10-24 15:16:20.616280', '2023-10-24 15:16:44.926422'),
(8, 'pbkdf2_sha256$600000$m5c2KqtdzjxDhCV1601XXa$xNoPSJdjrFtRVGBVtJJG9O5uF1Ts4tAAMeaZzsYmgxY=', 0, 'jasfertorres58@gmail.com', 'jasferallen', 1, 0, '2023-10-24 18:11:56.947681', '2023-10-24 18:12:17.985921'),
(9, 'pbkdf2_sha256$600000$YOewZmFKc9Gs9LUs0jHdW3$T10I7xUNjDxb+Y1+faB5TostTSsQZjw1lC7vH0xSA1A=', 0, 'levhoenheim35@gmail.com', 'levhoe', 1, 0, '2023-10-25 15:37:26.535614', '2023-10-25 15:38:32.059098');

-- --------------------------------------------------------

--
-- Table structure for table `obj_user_groups`
--

CREATE TABLE `obj_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `obj_user_user_permissions`
--

CREATE TABLE `obj_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_obj_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `obj_appointment`
--
ALTER TABLE `obj_appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obj_appointment_email_id_1d6b2fe0_fk_obj_user_email` (`email_id`),
  ADD KEY `obj_appointment_userid_id_48519bd8_fk_obj_user_id` (`userid_id`);

--
-- Indexes for table `obj_salon`
--
ALTER TABLE `obj_salon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obj_user`
--
ALTER TABLE `obj_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `obj_user_groups`
--
ALTER TABLE `obj_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `obj_user_groups_user_id_group_id_20755add_uniq` (`user_id`,`group_id`),
  ADD KEY `obj_user_groups_group_id_d3a4f83c_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `obj_user_user_permissions`
--
ALTER TABLE `obj_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `obj_user_user_permissions_user_id_permission_id_6a771bfd_uniq` (`user_id`,`permission_id`),
  ADD KEY `obj_user_user_permis_permission_id_6c07cb34_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `obj_appointment`
--
ALTER TABLE `obj_appointment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `obj_salon`
--
ALTER TABLE `obj_salon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obj_user`
--
ALTER TABLE `obj_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `obj_user_groups`
--
ALTER TABLE `obj_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obj_user_user_permissions`
--
ALTER TABLE `obj_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_obj_user_id` FOREIGN KEY (`user_id`) REFERENCES `obj_user` (`id`);

--
-- Constraints for table `obj_appointment`
--
ALTER TABLE `obj_appointment`
  ADD CONSTRAINT `obj_appointment_email_id_1d6b2fe0_fk_obj_user_email` FOREIGN KEY (`email_id`) REFERENCES `obj_user` (`email`),
  ADD CONSTRAINT `obj_appointment_userid_id_48519bd8_fk_obj_user_id` FOREIGN KEY (`userid_id`) REFERENCES `obj_user` (`id`);

--
-- Constraints for table `obj_user_groups`
--
ALTER TABLE `obj_user_groups`
  ADD CONSTRAINT `obj_user_groups_group_id_d3a4f83c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `obj_user_groups_user_id_12410832_fk_obj_user_id` FOREIGN KEY (`user_id`) REFERENCES `obj_user` (`id`);

--
-- Constraints for table `obj_user_user_permissions`
--
ALTER TABLE `obj_user_user_permissions`
  ADD CONSTRAINT `obj_user_user_permis_permission_id_6c07cb34_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `obj_user_user_permissions_user_id_674f1933_fk_obj_user_id` FOREIGN KEY (`user_id`) REFERENCES `obj_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
