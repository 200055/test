-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 30, 2021 at 07:50 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prabnet`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contact_us`
--

CREATE TABLE `accounts_contact_us` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `number` varchar(10) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_contact_us`
--

INSERT INTO `accounts_contact_us` (`id`, `first_name`, `last_name`, `email`, `number`, `message`) VALUES
(1, 'Prabesh', 'Aryal', 'dukucorpvideo@gmail.com', '9840311031', 'MESSAGE');

-- --------------------------------------------------------

--
-- Table structure for table `admins_internetoutage`
--

CREATE TABLE `admins_internetoutage` (
  `id` bigint(20) NOT NULL,
  `notice_title` varchar(200) NOT NULL,
  `notice_description` longtext NOT NULL,
  `notice_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins_internetoutage`
--

INSERT INTO `admins_internetoutage` (`id`, `notice_title`, `notice_description`, `notice_date`) VALUES
(1, 'Maitidevi Internet Outage', 'Outage for 15 minutes due to heavy rainfall. Please Be Calm', '2021-09-29 13:43:01.144678'),
(2, 'Dillibazar Internet Outage', '25 minutes Internet Outage', '2021-09-30 17:24:00.638045');

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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add profile', 7, 'add_profile'),
(26, 'Can change profile', 7, 'change_profile'),
(27, 'Can delete profile', 7, 'delete_profile'),
(28, 'Can view profile', 7, 'view_profile'),
(29, 'Can add internet outage', 8, 'add_internetoutage'),
(30, 'Can change internet outage', 8, 'change_internetoutage'),
(31, 'Can delete internet outage', 8, 'delete_internetoutage'),
(32, 'Can view internet outage', 8, 'view_internetoutage'),
(33, 'Can add contact_ us', 9, 'add_contact_us'),
(34, 'Can change contact_ us', 9, 'change_contact_us'),
(35, 'Can delete contact_ us', 9, 'delete_contact_us'),
(36, 'Can view contact_ us', 9, 'view_contact_us'),
(37, 'Can add category', 10, 'add_category'),
(38, 'Can change category', 10, 'change_category'),
(39, 'Can delete category', 10, 'delete_category'),
(40, 'Can view category', 10, 'view_category'),
(41, 'Can add order plan', 11, 'add_orderplan'),
(42, 'Can change order plan', 11, 'change_orderplan'),
(43, 'Can delete order plan', 11, 'delete_orderplan'),
(44, 'Can view order plan', 11, 'view_orderplan'),
(45, 'Can add category', 12, 'add_category'),
(46, 'Can change category', 12, 'change_category'),
(47, 'Can delete category', 12, 'delete_category'),
(48, 'Can view category', 12, 'view_category'),
(49, 'Can add product', 13, 'add_product'),
(50, 'Can change product', 13, 'change_product'),
(51, 'Can delete product', 13, 'delete_product'),
(52, 'Can view product', 13, 'view_product'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order'),
(57, 'Can add cart', 15, 'add_cart'),
(58, 'Can change cart', 15, 'change_cart'),
(59, 'Can delete cart', 15, 'delete_cart'),
(60, 'Can view cart', 15, 'view_cart');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$MbWWnvhDlkVj6zBxpHCxue$lXnNyHc+L4LH41+B6euhw+twfjACGpBidDoYvMbpYSI=', '2021-09-30 17:27:24.700722', 0, 'admin', '', '', '', 1, 1, '2021-09-21 17:11:19.816071'),
(3, 'pbkdf2_sha256$260000$CnBVwEi0jg7njOMKscTVFf$lRfm4uREKTmwCOT152TbqPiHN6OZ5wq8KClxbQUe/H0=', '2021-09-30 15:28:21.889950', 0, 'test1', '', '', 'jonsnow@logicstreak.com', 0, 1, '2021-09-29 13:26:57.565566'),
(5, 'pbkdf2_sha256$260000$Mue1vSZMTfvW43AbYxTLDS$j0NoOIxOw2aMJCxHVm5sf5GiDaP0LU8ovPxivE1GA5M=', '2021-09-29 20:35:30.656962', 0, 'testreset', '', '', 'jonsnow@logicstreak.com', 0, 1, '2021-09-29 20:35:26.250104'),
(6, 'pbkdf2_sha256$260000$z1k8nCFZzX8cN4tiiyOB0w$WxgABEculpR+WA1op9mnvb0HTycikftei4rgWoCmHC8=', '2021-09-29 21:17:51.884969', 0, 'testreset1', '', '', 'jonsow@yopmail.com', 0, 1, '2021-09-29 20:47:46.602197'),
(7, 'pbkdf2_sha256$260000$9BZEWccbnfRWT3eNTWdSiT$t3DMFR8myRx6sW/nnEXLx9YU7cu6BUZoSX90n3HQgp4=', '2021-09-30 17:27:08.935862', 0, 'prab2002', '', '', 'duku.aryal@gmail.com', 1, 1, '2021-09-30 17:20:25.584868');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `user_id` int(11) NOT NULL
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
(9, 'accounts', 'contact_us'),
(1, 'admin', 'logentry'),
(8, 'admins', 'internetoutage'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'internet', 'category'),
(11, 'internet', 'orderplan'),
(6, 'sessions', 'session'),
(15, 'store', 'cart'),
(12, 'store', 'category'),
(14, 'store', 'order'),
(13, 'store', 'product'),
(7, 'users', 'profile');

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
(1, 'contenttypes', '0001_initial', '2021-09-17 18:44:00.446898'),
(2, 'auth', '0001_initial', '2021-09-17 18:44:09.403067'),
(3, 'admin', '0001_initial', '2021-09-17 18:44:11.967579'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-09-17 18:44:12.085872'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-17 18:44:12.238945'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-09-17 18:44:13.019411'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-09-17 18:44:14.376352'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-09-17 18:44:14.520998'),
(9, 'auth', '0004_alter_user_username_opts', '2021-09-17 18:44:14.563529'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-09-17 18:44:15.081388'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-09-17 18:44:15.139224'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-09-17 18:44:15.193559'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-09-17 18:44:15.305325'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-09-17 18:44:15.411800'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-09-17 18:44:15.621671'),
(16, 'auth', '0011_update_proxy_permissions', '2021-09-17 18:44:15.664637'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-09-17 18:44:15.798346'),
(18, 'sessions', '0001_initial', '2021-09-17 18:44:16.384249'),
(19, 'users', '0001_initial', '2021-09-22 14:47:49.291113'),
(20, 'accounts', '0001_initial', '2021-09-29 13:15:31.475872'),
(21, 'accounts', '0002_alter_contact_us_id', '2021-09-29 13:15:32.298105'),
(22, 'admins', '0001_initial', '2021-09-29 13:15:32.585174'),
(23, 'admins', '0002_alter_internetoutage_id', '2021-09-29 13:15:33.407164'),
(24, 'internet', '0001_initial', '2021-09-29 13:15:33.746001'),
(25, 'internet', '0002_auto_20210926_1711', '2021-09-29 13:15:34.445982'),
(26, 'internet', '0003_auto_20210926_2358', '2021-09-29 13:15:34.554012'),
(27, 'internet', '0004_orderplan', '2021-09-29 13:15:35.922974'),
(28, 'internet', '0005_auto_20210929_1900', '2021-09-29 13:15:39.586317'),
(29, 'store', '0001_initial', '2021-09-29 13:15:41.381950'),
(30, 'store', '0002_cart_order', '2021-09-29 13:15:44.819553'),
(31, 'store', '0003_auto_20210929_1900', '2021-09-29 13:15:55.827098'),
(32, 'users', '0002_delete_profile', '2021-09-29 13:15:56.365674'),
(33, 'users', '0003_profile', '2021-09-29 13:15:57.317915'),
(34, 'users', '0004_profile_plan_name', '2021-09-29 13:15:58.051324'),
(35, 'users', '0005_alter_profile_id', '2021-09-29 13:15:59.325443');

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
('i3rorztcqorhuz3o8z9bduqbsrcatpts', '.eJxVjMsOwiAQRf-FtSFQhkdduvcbyMBMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJM4mz0OL0uyXMD647oDvWW5O51XWZk9wVedAur434eTncv4OCvXxrG9CTSiY7BY59msCy4QmMB_Y0EumgnEWAgINNSo85WMrWJ1YDaEfi_QHgyDel:1mVeSD:0wUvZW8BvICbiJ3QFW-jyahUlDnA4v7ES64wXSUI1Kg', '2021-10-13 18:37:17.601885'),
('lv90l4u7w25lelcwiw4hye99gsj6b3p7', '.eJxVjEEOwiAQRe_C2pAOBQZduvcMZIBBqgaS0q6Md7dNutDte-__t_C0LsWvnWc_JXERozj9skDxyXUX6UH13mRsdZmnIPdEHrbLW0v8uh7t30GhXrY1cVDZBMAh67NWjA6dMhsayXDICpCUQUzWGsjEkHEgcJps0jpzBPH5At9fN9Q:1mVxyv:AWQ-0rF_aeEb78Ks1Zl1kS211imiI-Z7zAmsniUXZSA', '2021-10-14 15:28:21.961061'),
('mjkd886s5rdbtf5o42ufr495f73d6oi9', '.eJxVjEEOwiAQRe_C2pAOBQZduvcMZIBBqgaS0q6Md7dNutDte-__t_C0LsWvnWc_JXERozj9skDxyXUX6UH13mRsdZmnIPdEHrbLW0v8uh7t30GhXrY1cVDZBMAh67NWjA6dMhsayXDICpCUQUzWGsjEkHEgcJps0jpzBPH5At9fN9Q:1mVaqq:4XVBFzxFBN7L5sEKTvf75O6ts_91-gkKzpum-6iw6rs', '2021-10-13 14:46:28.200402'),
('oxpfqoik70xjxd9zbq6zz7mzsqzp150k', '.eJxVjMsOwiAQRf-FtSFQhkdduvcbyMBMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJM4mz0OL0uyXMD647oDvWW5O51XWZk9wVedAur434eTncv4OCvXxrG9CTSiY7BY59msCy4QmMB_Y0EumgnEWAgINNSo85WMrWJ1YDaEfi_QHgyDel:1mVp1s:HfnRp2Wed0iH-hkEFzP01_vYTkixo1Uu9Ic6WMjfbts', '2021-10-14 05:54:48.087408'),
('q7ko1qlddzwjlzwrhuway56vrir8a2mh', '.eJxVjMsOwiAQRf-FtSFQhkdduvcbyMBMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJM4mz0OL0uyXMD647oDvWW5O51XWZk9wVedAur434eTncv4OCvXxrG9CTSiY7BY59msCy4QmMB_Y0EumgnEWAgINNSo85WMrWJ1YDaEfi_QHgyDel:1mVzq8:aecmYCjbq8bGcL1QLpX8tWr3hgS7zj9Va7Vctw3NNQM', '2021-10-14 17:27:24.747427'),
('rn1hiim1ph0c06zjkj8vl375zfeo889s', '.eJxVjEEOwiAQRe_C2pAOBQZduvcMZIBBqgaS0q6Md7dNutDte-__t_C0LsWvnWc_JXERozj9skDxyXUX6UH13mRsdZmnIPdEHrbLW0v8uh7t30GhXrY1cVDZBMAh67NWjA6dMhsayXDICpCUQUzWGsjEkHEgcJps0jpzBPH5At9fN9Q:1mVuXo:Zdq4VEtEWB1lTFVYgh0rehecLNWxeNrXEXmgKyw6DJc', '2021-10-14 11:48:08.122267'),
('sq2j4xgatr25dp0eccp7647xlz9co97j', '.eJxVjEEOwiAQRe_C2pAOBQZduvcMZIBBqgaS0q6Md7dNutDte-__t_C0LsWvnWc_JXERozj9skDxyXUX6UH13mRsdZmnIPdEHrbLW0v8uh7t30GhXrY1cVDZBMAh67NWjA6dMhsayXDICpCUQUzWGsjEkHEgcJps0jpzBPH5At9fN9Q:1mVbSJ:E8hgbkukgpz0d8BvskU0rtIBLcTWD6wo3gTg0EWlKKM', '2021-10-13 15:25:11.822412'),
('yy3er6m9ocsjhhvo0sw60fmgfdhnxs5m', '.eJxVjMsOwiAQRf-FtSFQhkdduvcbyMBMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJM4mz0OL0uyXMD647oDvWW5O51XWZk9wVedAur434eTncv4OCvXxrG9CTSiY7BY59msCy4QmMB_Y0EumgnEWAgINNSo85WMrWJ1YDaEfi_QHgyDel:1mSjp6:J50KoV64rqmj80aoRm5Olq9ACIgyI5TQ2EnUS2q5D8M', '2021-10-05 17:44:52.227031');

-- --------------------------------------------------------

--
-- Table structure for table `internet_category`
--

CREATE TABLE `internet_category` (
  `id` bigint(20) NOT NULL,
  `plan_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `internet_category`
--

INSERT INTO `internet_category` (`id`, `plan_name`) VALUES
(1, '1 Month'),
(2, '3 Month'),
(3, '6 Month'),
(4, '12 Month');

-- --------------------------------------------------------

--
-- Table structure for table `internet_orderplan`
--

CREATE TABLE `internet_orderplan` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `number` varchar(200) NOT NULL,
  `plan_name_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `internet_orderplan`
--

INSERT INTO `internet_orderplan` (`id`, `full_name`, `email`, `address`, `number`, `plan_name_id`) VALUES
(1, 'Prabesh Aryal', 'dukucorp@gmail.com', 'Maitidevi', '9840311031', 1),
(2, 'Prabesh Aryal', 'dukucorp@gmail.com', 'Maitidevi', '9840311031', 1);

-- --------------------------------------------------------

--
-- Table structure for table `store_cart`
--

CREATE TABLE `store_cart` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_cart`
--

INSERT INTO `store_cart` (`id`, `created_date`, `product_id`, `user_id`) VALUES
(1, '2021-09-29 15:37:34.543704', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `store_category`
--

CREATE TABLE `store_category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `category_description` longtext DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `category_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_category`
--

INSERT INTO `store_category` (`id`, `category_name`, `category_description`, `created_date`, `category_image`) VALUES
(1, 'Router', 'The Basic Thing That You Need For Your Connection.', '2021-09-29 13:41:41.370733', 'static/uploads/router2.png');

-- --------------------------------------------------------

--
-- Table structure for table `store_order`
--

CREATE TABLE `store_order` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `payment_method` varchar(200) DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  `contact_address` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_order`
--

INSERT INTO `store_order` (`id`, `quantity`, `total_price`, `status`, `payment_method`, `payment_status`, `contact_no`, `contact_address`, `created_date`, `product_id`, `user_id`) VALUES
(1, 1, 699, 'Pending', 'Esewa', 0, '9840311031', 'Maitidevi', '2021-09-29 16:41:45.533044', 1, 3),
(2, 1, 699, 'Pending', 'Esewa', 0, '9840311031', 'Maitidevi', '2021-09-30 17:22:02.900165', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `store_product`
--

CREATE TABLE `store_product` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` double NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store_product`
--

INSERT INTO `store_product` (`id`, `product_name`, `product_price`, `product_image`, `created_date`, `category_id`) VALUES
(1, 'PrabNet Elevate Router', 699, 'static/uploads/router1.png', '2021-09-29 13:42:09.261999', 1),
(2, 'PrabNet Elevate Router 2', 500, 'static/uploads/router2_Chs135H.png', '2021-09-30 17:23:23.602563', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `plan_name_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `username`, `email`, `first_name`, `last_name`, `phone`, `address`, `profile_pic`, `created_date`, `user_id`, `plan_name_id`) VALUES
(1, 'test1', '', 'Prabesh', 'Aryal', '9840311031', 'Maitidevi', 'static/profile/download20210801001341.png', '2021-09-29 13:26:59.705914', 3, 1),
(2, 'testreset', '', '', '', '', '', 'static/images/default_user.png', '2021-09-29 20:35:26.814648', 5, NULL),
(3, 'testreset1', '', '', '', '', '', 'static/images/default_user.png', '2021-09-29 20:47:48.843382', 6, NULL),
(4, 'prab2002', '', 'Prabesh', 'Aryal', '9840311031', 'Maitidevi', 'static/profile/download20210801001415.png', '2021-09-30 17:20:26.259785', 7, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_contact_us`
--
ALTER TABLE `accounts_contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins_internetoutage`
--
ALTER TABLE `admins_internetoutage`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indexes for table `internet_category`
--
ALTER TABLE `internet_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internet_orderplan`
--
ALTER TABLE `internet_orderplan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internet_orderplan_plan_name_id_926c7bfd_fk` (`plan_name_id`);

--
-- Indexes for table `store_cart`
--
ALTER TABLE `store_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_cart_user_id_99e99107_fk_auth_user_id` (`user_id`),
  ADD KEY `store_cart_product_id_b219c080_fk` (`product_id`);

--
-- Indexes for table `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_order`
--
ALTER TABLE `store_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_order_user_id_ae5f7a5f_fk_auth_user_id` (`user_id`),
  ADD KEY `store_order_product_id_11796f0f_fk` (`product_id`);

--
-- Indexes for table `store_product`
--
ALTER TABLE `store_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_category_id_574bae65_fk` (`category_id`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `users_profile_plan_name_id_6109a65d_fk_internet_category_id` (`plan_name_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_contact_us`
--
ALTER TABLE `accounts_contact_us`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins_internetoutage`
--
ALTER TABLE `admins_internetoutage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `internet_category`
--
ALTER TABLE `internet_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `internet_orderplan`
--
ALTER TABLE `internet_orderplan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store_cart`
--
ALTER TABLE `store_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store_category`
--
ALTER TABLE `store_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_order`
--
ALTER TABLE `store_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store_product`
--
ALTER TABLE `store_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `internet_orderplan`
--
ALTER TABLE `internet_orderplan`
  ADD CONSTRAINT `internet_orderplan_plan_name_id_926c7bfd_fk` FOREIGN KEY (`plan_name_id`) REFERENCES `internet_category` (`id`);

--
-- Constraints for table `store_cart`
--
ALTER TABLE `store_cart`
  ADD CONSTRAINT `store_cart_product_id_b219c080_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_cart_user_id_99e99107_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_order`
--
ALTER TABLE `store_order`
  ADD CONSTRAINT `store_order_product_id_11796f0f_fk` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  ADD CONSTRAINT `store_order_user_id_ae5f7a5f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_product`
--
ALTER TABLE `store_product`
  ADD CONSTRAINT `store_product_category_id_574bae65_fk` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`);

--
-- Constraints for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD CONSTRAINT `users_profile_plan_name_id_6109a65d_fk_internet_category_id` FOREIGN KEY (`plan_name_id`) REFERENCES `internet_category` (`id`),
  ADD CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
