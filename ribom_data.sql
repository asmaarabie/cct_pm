-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2014 at 11:05 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `prodman`
--
-- DROP IF NOT EXISTS DATABASE `prodman`;
-- CREATE DATABASE `prodman`;
-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `countryid` char(5) NOT NULL,
  `fulldept` char(9) NOT NULL,
  `deptid` char(3) NOT NULL,
  `classid` char(3) DEFAULT NULL,
  `subclassid` char(3) DEFAULT NULL,
  `deptname` char(40) DEFAULT NULL,
  `classname` char(40) DEFAULT NULL,
  `subclassname` char(40) DEFAULT NULL,
  PRIMARY KEY (`countryid`,`fulldept`),
  KEY `FOREIGN` (`deptid`,`classid`,`subclassid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `countryid` char(5) NOT NULL,
  `countrydesc` char(40) NOT NULL,
  `filepath` char(255) DEFAULT NULL,
  `rpro9sbsid` char(5) NOT NULL,
  `exchangerate` decimal(12,6) NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `subclass_name`
--

CREATE TABLE IF NOT EXISTS `subclass_name` (
  `subclassid` char(3) NOT NULL,
  `countryid` char(5) NOT NULL,
  `subclass_name` char(40) NOT NULL,
  PRIMARY KEY (`subclassid`),
  KEY `countryid` (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subclass_name`
--

INSERT INTO `subclass_name` (`subclassid`, `countryid`, `subclass_name`) VALUES
('BD1', '2', 'BANDANA'),
('BD2', '2', 'BANDANA'),
('BG1', '2', 'BAG'),
('BG2', '2', 'BAG'),
('BK1', '2', 'BLANKET'),
('BL1', '2', 'BLOUSE'),
('BL2', '2', 'BLOUSE'),
('BO', '2', 'GIFT BOX'),
('BS', '2', 'BASKET'),
('BT', '2', 'BELT'),
('BW', '2', 'BOW TIE'),
('BX', '2', 'BOXER'),
('BZ', '2', 'BLAZER'),
('BZ3', '2', 'BLAZER'),
('C3', '2', 'TRICOTE VEST'),
('CB', '2', 'CUMMERBAND'),
('CD', '2', 'DOWN PAYMENT'),
('CL', '2', 'CUFFLINK'),
('CM', '2', 'CACHE MAILLOT'),
('CR', '2', 'GIFT CARD'),
('CT', '2', 'COAT'),
('CV', '2', 'COVAR COAT'),
('DR', '2', 'DRESS'),
('EW', '2', 'EW'),
('FL', '2', 'FLASH MEMORY'),
('GV', '2', 'GLOVE'),
('HA', '2', ' HAIR HOOP'),
('HK', '2', 'HANDKERCHIEF'),
('HN', '2', 'CHANDLER'),
('HT', '2', 'HAT'),
('IC', '2', 'ICE CAP'),
('JK', '2', 'JACKET'),
('KC', '2', 'KC'),
('LR', '2', 'LR'),
('MD', '2', 'MEDAL'),
('MN', '2', 'MANNEQUIN'),
('MT', '2', 'MADE TO MEASURE'),
('NL', '2', 'NL'),
('OT', '2', 'OTHERS'),
('PJ0', '2', 'PAJAMA'),
('PJ5', '2', 'PAJAMA'),
('PL', '2', 'PULLOVER'),
('PN', '2', 'PONCHES'),
('PT', '2', 'PANT'),
('PY', '2', 'PANTY'),
('RL', '2', 'RUBBER LINK'),
('S0', '2', 'S0'),
('SA', '2', 'SAMPLE'),
('SC', '2', 'SOCKS'),
('SF', '2', 'SCARF'),
('SH', '2', 'SHIRT'),
('SH6', '2', 'SHIRT'),
('SK', '2', 'SKIRT'),
('SL', '2', 'SLIPPER'),
('SM', '2', 'SWIMWEAR'),
('SO', '2', 'SHOES'),
('SP', '2', 'SLIP'),
('SR', '2', 'SHORT'),
('ST', '2', 'SALOPPETTE'),
('SU', '2', 'SUIT'),
('SV', '2', 'SUIT COVER'),
('SW', '2', 'SWEATSHIRT'),
('TB', '2', 'TIE BAR'),
('TE', '2', ' T_SHIRT'),
('TL', '2', 'STORES DISPLAY TOOLS'),
('TR', '2', 'TROUSER'),
('TY1', '2', 'Tie'),
('VS', '2', 'VEST'),
('WB', '2', 'WRISTBANDS'),
('WL', '2', 'WALLET'),
('WT1', '2', 'WT');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` char(20) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`group_id`, `group_name`) VALUES
(11, 'Administrators'),
(12, 'Stylesheet'),
(13, 'Marker');

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `op_name` char(40) NOT NULL,
  `description` char(40) NOT NULL,
  PRIMARY KEY (`op_name`),
  KEY `operation` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`op_name`, `description`) VALUES
('BOM', 'BOM'),
('ColorCode', 'ColorCode'),
('DCSName', 'DCSName'),
('Groups', 'Groups'),
('IsoHeader', 'IsoHeader'),
('Marker', 'Marker'),
('SizeScale', 'SizeScale'),
('Stylesheet', 'Stylesheet'),
('Users', 'Users');

--
-- Table structure for table `group_operations`
--

CREATE TABLE IF NOT EXISTS `group_operations` (
  `grp_op_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `responsibility` char(40) NOT NULL,
  `permissions` char(10) NOT NULL,
  PRIMARY KEY (`grp_op_id`),
  KEY `fk_group_privileges_priv_idx` (`responsibility`),
  KEY `fk_group_privileges_grp` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- Dumping data for table `group_operations`
--

INSERT INTO `group_operations` (`grp_op_id`, `group_id`, `responsibility`, `permissions`) VALUES
(66, 11, 'BOM', '1111110000'),
(67, 11, 'ColorCode', '1111110000'),
(68, 11, 'DCSName', '1111110000'),
(70, 11, 'Groups', '1111110000'),
(71, 11, 'IsoHeader', '1111110000'),
(72, 11, 'Marker', '1111110000'),
(73, 11, 'SizeScale', '1111110000'),
(74, 11, 'Stylesheet', '1111110000'),
(75, 11, 'Users', '1111110000'),
(76, 12, 'BOM', '1000000000'),
(77, 12, 'ColorCode', '0000000000'),
(78, 12, 'DCSName', '0000000000'),
(79, 12, 'Groups', '0000000000'),
(80, 12, 'IsoHeader', '0000000000'),
(81, 12, 'Marker', '1000000000'),
(82, 12, 'SizeScale', '0000000000'),
(83, 12, 'Stylesheet', '1100011000'),
(84, 12, 'Users', '0000000000'),
(85, 13, 'BOM', '1000000000'),
(86, 13, 'ColorCode', '0000000000'),
(87, 13, 'DCSName', '0000000000'),
(88, 13, 'Groups', '0000000000'),
(89, 13, 'IsoHeader', '0000000000'),
(90, 13, 'Marker', '1100011000'),
(91, 13, 'SizeScale', '0000000000'),
(92, 13, 'Stylesheet', '1000000000'),
(93, 13, 'Users', '0000000000');
--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` char(20) NOT NULL,
  `mail` char(40) NOT NULL,
  `password` char(100) NOT NULL,
  `user_group` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_users_1_idx` (`user_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `mail`, `password`, `user_group`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$LIlVJ8A.M4JBUaAB7KVeveu9q4hA39DLxKH2Ce99wEgiHFdOeMOze', 11),
(4, 'Rafiik', 'rafiik@concrete.com', '$2y$10$DKdMavxuuGNl3qgL6vaL.eiC.4rwxbcaFyi3h.XCTRVv61Mlu0niW', 13),
(5, 'stylesheet1', '', '$2y$10$L3kQKcQIzr94Yq07xDT05.nhHpoRfPGw4cn6iQyD83ddAGfX8FHsK', 12);

--
-- Table structure for table `bom`
--

CREATE TABLE IF NOT EXISTS `bom` (
  `bom_id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_id` int(11) NOT NULL,
  `ss_id` int(11) NOT NULL,
  `item_desc` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `item_placement` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `fulldept` char(9) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_consumption` char(10) CHARACTER SET utf8 NOT NULL,
  `item_increase` int(11) NOT NULL DEFAULT '0',
  `countryid` char(5) NOT NULL,
  `itemno` int(11) NOT NULL,
  PRIMARY KEY (`bom_id`),
  KEY `fk_bom_ss` (`ss_id`),
  KEY `fk_bom_country_idx` (`countryid`),
  KEY `fk_bom_item_idx` (`itemno`),
  KEY `bs_id` (`bs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Table structure for table `bomsheet`
--

CREATE TABLE IF NOT EXISTS `bomsheet` (
  `bs_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `pono` char(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`bs_id`),
  KEY `ss_id` (`ss_id`,`pono`,`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `bomsheet`
--

INSERT INTO `bomsheet` (`bs_id`, `ss_id`, `pono`, `user_id`) VALUES
(15, 34, '20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_log`
--

CREATE TABLE IF NOT EXISTS `bom_log` (
  `bom_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_id` int(11) NOT NULL,
  `action_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(10) NOT NULL,
  `action_comment` text CHARACTER SET utf8 NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`bom_log_id`),
  KEY `user` (`user`),
  KEY `bs_id` (`bs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `bom_log`
--

INSERT INTO `bom_log` (`bom_log_id`, `bs_id`, `action_time_stamp`, `action_type`, `action_comment`, `user`) VALUES
(69, 15, '2014-11-30 20:32:18', 'Create', 'Created bom sheet serial: 15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `color_id` char(2) NOT NULL,
  `color_desc_a` char(20) CHARACTER SET utf8 NOT NULL,
  `color_img` char(40) NOT NULL,
  `color_desc_e` char(40) NOT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `color_length`
--

CREATE TABLE IF NOT EXISTS `color_length` (
  `color_length` char(1) NOT NULL,
  `length_desc_e` char(20) NOT NULL,
  `length_desc_a` char(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`color_length`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color_desc_a`, `color_img`, `color_desc_e`) VALUES
('BL', 'أسود', 'black.png', 'Black'),
('OR', 'برتقالي تكساس', 'orange.png', 'Texas Orange'),
('PK', 'وردي', 'Screenshot from 2014-11-24 21:07:02.png', 'Pink'),
('RD', 'أحمر', 'takatof_logo.jpg', 'Red'),
('WT', 'أبيض', 'crop.png', 'White');

-- --------------------------------------------------------


--
-- Table structure for table `color_pattern`
--

CREATE TABLE IF NOT EXISTS `color_pattern` (
  `color_pattern` char(1) NOT NULL,
  `pattern_desc_e` char(40) NOT NULL,
  `pattern_desc_a` char(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`color_pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------------------------------

--
-- Table structure for table `color_shadow`
--

CREATE TABLE IF NOT EXISTS `color_shadow` (
  `color_shadow` char(1) NOT NULL,
  `shadow_desc_a` char(40) CHARACTER SET utf8 NOT NULL,
  `shadow_desc_e` char(40) NOT NULL,
  PRIMARY KEY (`color_shadow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `color_shape`
--

CREATE TABLE IF NOT EXISTS `color_shape` (
  `color_shape` char(1) NOT NULL,
  `shape_desc_e` char(40) NOT NULL,
  `shape_desc_a` char(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`color_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `color_code`
--

CREATE TABLE IF NOT EXISTS `color_code` (
  `color` char(2) NOT NULL,
  `shadow` char(1) NOT NULL,
  `pattern` char(1) NOT NULL,
  `length` char(1) NOT NULL,
  `shape` char(1) NOT NULL,
  `color_serial` char(2) NOT NULL DEFAULT '00',
  `color_code` char(8) NOT NULL,
  PRIMARY KEY (`color_code`),
  KEY `fk_color_code_1_idx` (`color`),
  KEY `fk_color_code_shadow_idx` (`shadow`),
  KEY `fk_color_code_pattern_idx` (`pattern`),
  KEY `fk_color_code_length_idx` (`length`),
  KEY `fk_color_code_shape_idx` (`shape`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color_code`
--

INSERT INTO `color_code` (`color`, `shadow`, `pattern`, `length`, `shape`, `color_serial`, `color_code`) VALUES
('BL', 'D', 'E', '', '', '00', 'BLDE  00'),
('BL', 'L', 'E', '', '', '00', 'BLLE  00'),
('BL', 'L', 'E', '', '', '01', 'BLLE  01'),
('OR', '', '', '', '', '00', 'OR    00'),
('OR', 'L', '', '', '', '01', 'ORL   01'),
('PK', 'D', '', '', '', '00', 'PKD   00'),
('PK', 'L', '', '', '', '00', 'PKL   00'),
('RD', '', '', '', '', '00', 'RD    00'),
('RD', 'L', 'T', '', 'S', '00', 'RDLT S00'),
('WT', '', '', '', 'S', '00', 'WT   S00');

-- --------------------------------------------------------

--
-- Dumping data for table `color_length`
--

INSERT INTO `color_length` (`color_length`, `length_desc_e`, `length_desc_a`) VALUES
('-', 'None', 'لانمطي'),
('S', 'Suit Drop Small', 'تخطيط البدلة ضيق');

-- --------------------------------------------------------

--
-- Dumping data for table `color_pattern`
--

INSERT INTO `color_pattern` (`color_pattern`, `pattern_desc_e`, `pattern_desc_a`) VALUES
('E', 'Embroidered', 'مطرز'),
('T', 'Tapestry', 'نسيج مزدان بالرسوم والصور');

-- ----
--
-- Dumping data for table `color_shadow`
--

INSERT INTO `color_shadow` (`color_shadow`, `shadow_desc_a`, `shadow_desc_e`) VALUES
('D', 'غامق', 'Dark'),
('L', 'فاتح', 'Light');

-- --------------------------------------------------------

--
-- Dumping data for table `color_shape`
--

INSERT INTO `color_shape` (`color_shape`, `shape_desc_e`, `shape_desc_a`) VALUES
('D', 'Dotted', 'منقط'),
('S', 'Small', 'صغير');

-- --------------------------------------------------------

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countryid`, `countrydesc`, `filepath`, `rpro9sbsid`, `exchangerate`) VALUES
('1', 'BOM', 'd:\\retail\\rpro', 'tino', 1.000000),
('2', 'Concrete', 'none', 'none', 0.000000);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `countryid` char(5) NOT NULL,
  `custsid` bigint(20) NOT NULL,
  `compname` char(25) DEFAULT NULL,
  `titlename` char(15) DEFAULT NULL,
  `forename` char(30) DEFAULT NULL,
  `surname` char(30) DEFAULT NULL,
  `addr1` char(40) DEFAULT NULL,
  `addr2` char(40) DEFAULT NULL,
  `addr3` char(40) DEFAULT NULL,
  `pcode` char(20) DEFAULT NULL,
  `telno1` char(30) DEFAULT NULL,
  `telno2` char(30) DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `storeid` char(5) DEFAULT NULL,
  `last_sale` datetime DEFAULT NULL,
  `latitude` decimal(12,6) DEFAULT NULL,
  `longitude` decimal(12,6) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `udf1` datetime DEFAULT NULL,
  `udf2` datetime DEFAULT NULL,
  `udf3` char(20) DEFAULT NULL,
  `udf4` char(20) DEFAULT NULL,
  `udf5` char(20) DEFAULT NULL,
  `udf6` char(20) DEFAULT NULL,
  `udf7` char(20) DEFAULT NULL,
  `udf8` char(20) DEFAULT NULL,
  `custid` int(11) DEFAULT NULL,
  `info1` char(20) DEFAULT NULL,
  `info2` char(20) DEFAULT NULL,
  `storecr` decimal(16,4) DEFAULT NULL,
  `credlim` decimal(16,4) DEFAULT NULL,
  `credusd` decimal(16,4) DEFAULT NULL,
  `mark1` char(4) DEFAULT NULL,
  `mark2` char(4) DEFAULT NULL,
  `active_flag` char(1) DEFAULT NULL,
  `aux1` char(20) DEFAULT NULL,
  `aux2` char(20) DEFAULT NULL,
  `aux3` char(20) DEFAULT NULL,
  `aux4` char(20) DEFAULT NULL,
  `aux5` char(20) DEFAULT NULL,
  `aux6` char(20) DEFAULT NULL,
  `aux7` char(20) DEFAULT NULL,
  `aux8` char(20) DEFAULT NULL,
  `aux9` char(20) DEFAULT NULL,
  `aux10` char(20) DEFAULT NULL,
  `aux11` char(20) DEFAULT NULL,
  `aux12` char(20) DEFAULT NULL,
  PRIMARY KEY (`countryid`,`custsid`),
  KEY `BOM` (`custid`),
  KEY `custid` (`custid`),
  KEY `custid_2` (`custid`),
  KEY `countryid` (`countryid`,`custsid`,`custid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`countryid`, `custsid`, `compname`, `titlename`, `forename`, `surname`, `addr1`, `addr2`, `addr3`, `pcode`, `telno1`, `telno2`, `email`, `storeid`, `last_sale`, `latitude`, `longitude`, `gender`, `udf1`, `udf2`, `udf3`, `udf4`, `udf5`, `udf6`, `udf7`, `udf8`, `custid`, `info1`, `info2`, `storecr`, `credlim`, `credusd`, `mark1`, `mark2`, `active_flag`, `aux1`, `aux2`, `aux3`, `aux4`, `aux5`, `aux6`, `aux7`, `aux8`, `aux9`, `aux10`, `aux11`, `aux12`) VALUES
('1', 5635448102379847680, 'Safinaz Osman', NULL, 'Safinaz', 'Osman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '000', '2007-10-08 00:00:00', NULL, NULL, '', NULL, NULL, '0', '0', '0', '0', '0', '0', 20, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 5635401768130052096, 'Shrif Abd El Razek', NULL, 'Shrif', 'Abd El Razek', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', '2007-10-10 00:00:00', NULL, NULL, '', NULL, NULL, '0', '0', '0', '0', '0', '0', 6, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 5634713148775727104, 'Ashraf Kamel', NULL, 'Ashraf Kamel', 'Ashraf Kamel', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', NULL, NULL, NULL, '', NULL, NULL, '0', '0', '0', '0', '0', '0', 80, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 5634669171716390912, 'Dr. Alla', NULL, 'Dr. Alla', 'Dr. Alla', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', NULL, NULL, NULL, '', NULL, NULL, '0', '0', '0', '0', '0', '0', 77, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 5126168880149954560, 'ahmed abdal elsayed', NULL, 'ahmed', 'abdala el sayed', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', '2013-01-02 00:00:00', NULL, NULL, '', NULL, NULL, '0', '2000', '1000', 'WH1', '0', '0', 74, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 4862736677581357056, 'Ali ibrahim', NULL, 'Ali', 'Ibrahim', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', '2006-12-12 00:00:00', NULL, NULL, '', NULL, NULL, '0', '2000', '1000', '0', '0', '0', 73, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 4822103077043568640, 'Gift Voucher', NULL, 'Gift Voucher', 'Gift Voucher', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', NULL, NULL, NULL, '', NULL, NULL, '0', '0', '0', '0', '0', '0', 72, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 4210123564960972800, 'Ali EmadElDeen', NULL, 'Ali', 'EmadElDeen', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', NULL, NULL, NULL, '', NULL, NULL, '0', '1000', '500', '0', '0', '0', 71, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 4210122549352202240, 'Mohamed A. Rafe3', NULL, 'Mohamed', 'A. Rafe3', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', NULL, NULL, NULL, '', NULL, NULL, '0', '1000', '500', '0', '0', '0', 70, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', ''),
('1', 4210121084969680896, 'Ibraheem Ahmed', NULL, 'Ibraheem', 'Ahmed', NULL, NULL, NULL, NULL, '1', NULL, NULL, '000', NULL, NULL, NULL, '', NULL, NULL, '0', '1000', '500', '0', '0', '0', 69, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 'Y', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE IF NOT EXISTS `size` (
  `scale_number` char(5) NOT NULL,
  `scale_size` char(40) NOT NULL,
  `scale_name` char(10) NOT NULL,
  PRIMARY KEY (`scale_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `DCS_size_scale`
--

CREATE TABLE IF NOT EXISTS `DCS_size_scale` (
  `DCS_size_id` int(10) NOT NULL AUTO_INCREMENT,
  `size_scale` char(5) NOT NULL,
  `size_fulldept` char(9) NOT NULL,
  `size_country_id` char(5) NOT NULL DEFAULT '2',
  PRIMARY KEY (`DCS_size_id`),
  KEY `fk_DCS_size_scale_dept_idx` (`size_fulldept`),
  KEY `fk_DCS_size_scale_country_idx` (`size_country_id`),
  KEY `fk_DCS_size_scale_size_idx` (`size_scale`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `DCS_size_scale`
--

INSERT INTO `DCS_size_scale` (`DCS_size_id`, `size_scale`, `size_fulldept`, `size_country_id`) VALUES
(1, '10', 'c111  BZ1', '2'),
(2, '100', 'C111  BZ1', '2'),
(3, '22', 'C111  BZ1', '2'),
(4, '10', 'C511  BL0', '2'),
(6, '10', 'AAP3  APX', '1');

-- --------------------------------------------------------

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`countryid`, `fulldept`, `deptid`, `classid`, `subclassid`, `deptname`, `classname`, `subclassname`) VALUES
('2', 'C111  BZ1', 'C11', '1', 'BZ1', 'MF D.BREAS', 'T BLAZER', NULL),
('2', 'C111  BZ2', 'C11', '1', 'BZ2', 'MF S.BREAS', 'T BLAZER', NULL),
('2', 'C111  BZ3', 'C11', '1', 'BZ3', '2BT S.BRST', ' BLAZER', NULL),
('2', 'C111  BZ4', 'C11', '1', 'BZ4', '4BT S.BRST', ' BLAZER', NULL),
('2', 'C111  BZ5', 'C11', '1', 'BZ5', 'MIX & MATC', 'H, CLASSIC', ', BLAZER'),
('2', 'C111  BZ8', 'C11', '1', 'BZ8', 'FASHION  B', 'LAZER  M F', NULL),
('2', 'C111  BZ9', 'C11', '1', 'BZ9', 'MF 2PC BLA', 'ZER', NULL),
('2', 'C111  BZV', 'C11', '1', 'BZV', 'MF D.BREAS', 'T BLAZER', NULL),
('2', 'C111  CV1', 'C11', '1', 'CV1', 'COVAR COAT', NULL, NULL),
('2', 'C111  PJ0', 'C11', '1', 'PJ0', 'PAJAMA', NULL, NULL),
('2', 'C111  PT0', 'C11', '1', 'PT0', 'PANT', NULL, NULL),
('2', 'C111  SH0', 'C11', '1', 'SH0', 'SHIRT', NULL, NULL),
('2', 'C111  SH1', 'C11', '1', 'SH1', 'L/S SOLID', 'SHIRT', NULL),
('2', 'C111  SH2', 'C11', '1', 'SH2', 'L/S  PRINT', ' SHIRT', NULL),
('2', 'C111  SH3', 'C11', '1', 'SH3', 'S/S SOLID', 'SHIRT', NULL),
('2', 'C111  SH4', 'C11', '1', 'SH4', 'S/S  PRINT', ' SHIRT', NULL),
('2', 'C111  SH5', 'C11', '1', 'SH5', 'L/S SOLID', 'SHIRT CUFF', 'LINKS'),
('2', 'C111  SH6', 'C11', '1', 'SH6', 'MF L/S REG', '.CLASSIC S', 'HIRT'),
('2', 'C111  SH7', 'C11', '1', 'SH7', 'MF S/S REG', '.CLASSIC S', 'HIRT'),
('2', 'C111  SH8', 'C11', '1', 'SH8', 'MF L/S FSH', '.CLASSIC S', 'HIRT'),
('2', 'C111  SH9', 'C11', '1', 'SH9', 'MF S/S FSH', '.CLASSIC S', 'HIRT'),
('2', 'C111  SU1', 'C11', '1', 'SU1', 'MF 2PC D.B', 'REAST SUIT', NULL),
('2', 'C111  SU2', 'C11', '1', 'SU2', 'MF 2PC S.B', 'REAST SUIT', NULL),
('2', 'C111  SU3', 'C11', '1', 'SU3', '2BT S.BRST', ' 1PLEAT SU', 'IT'),
('2', 'C111  SU4', 'C11', '1', 'SU4', '2BT S.BRST', ' F.FRNT SU', 'IT'),
('2', 'C111  SU5', 'C11', '1', 'SU5', 'MF 3PC D.B', 'REAST SUIT', NULL),
('2', 'C111  SU6', 'C11', '1', 'SU6', 'MF 3PC S.B', 'REAST SUIT', NULL),
('2', 'C111  SU8', 'C11', '1', 'SU8', 'SUIT', NULL, NULL),
('2', 'C111  SUV', 'C11', '1', 'SUV', 'MF 3PC D.B', 'REAST SUIT', NULL),
('2', 'C111  TE0', 'C11', '1', 'TE0', 'T-SHIRT', NULL, NULL),
('2', 'C111  TR5', 'C11', '1', 'TR5', 'MIX & MATC', 'H TROUSERS', NULL),
('2', 'C111  VS1', 'C11', '1', 'VS1', 'MF D.BREAS', 'T VEST', NULL),
('2', 'C111  VS2', 'C11', '1', 'VS2', 'MF S.BREAS', 'T VEST', NULL),
('2', 'C112  TR1', 'C11', '2', 'TR1', 'MF 2PLEAT', 'TROUSER', NULL),
('2', 'C112  TR2', 'C11', '2', 'TR2', 'MF 1PLEAT', 'TROUSER', NULL),
('2', 'C112  TR3', 'C11', '2', 'TR3', 'MF F.FRNT', 'TROUSER', NULL),
('2', 'C112  TR4', 'C11', '2', 'TR4', 'MF FASHION', ' TROUSER', NULL),
('2', 'C112  TR5', 'C11', '2', 'TR5', 'MIX & MATC', 'H TROUSERS', NULL),
('2', 'C113  CT1', 'C11', '3', 'CT1', 'MF S.BREAS', 'T REG COAT', NULL),
('2', 'C113  CT2', 'C11', '3', 'CT2', 'MF S.BREAS', 'T LNG COAT', NULL),
('2', 'C113  CT3', 'C11', '3', 'CT3', 'MF D.BREAS', 'T REG COAT', NULL),
('2', 'C113  CT4', 'C11', '3', 'CT4', 'MF D.BREAS', 'T LNG COAT', NULL),
('2', 'C116  BG1', 'C11', '6', 'BG1', 'MF BAG', NULL, NULL),
('2', 'C116  BT1', 'C11', '6', 'BT1', 'MF BELT', NULL, NULL),
('2', 'C116  BT3', 'C11', '6', 'BT3', 'MF Classic', ' BELT', NULL),
('2', 'C116  CB1', 'C11', '6', 'CB1', 'MC TIE BAR', NULL, NULL),
('2', 'C116  CL1', 'C11', '6', 'CL1', 'METAL CUFF', 'LINK', NULL),
('2', 'C116  CV1', 'C11', '6', 'CV1', 'COVAR COAT', NULL, NULL),
('2', 'C116  GV2', 'C11', '6', 'GV2', 'LEATHER GL', 'OVE', NULL),
('2', 'C116  HA1', 'C11', '6', 'HA1', 'HA1', NULL, NULL),
('2', 'C116  HK1', 'C11', '6', 'HK1', 'MF HANDKER', 'CHIEF', NULL),
('2', 'C116  HN1', 'C11', '6', 'HN1', 'Chandler', NULL, NULL),
('2', 'C116  LR1', 'C11', '6', 'LR1', 'LR1', NULL, NULL),
('2', 'C116  OTH', 'C11', '6', 'OTH', 'MF Others', NULL, NULL),
('2', 'C116  RL1', 'C11', '6', 'RL1', 'RUBBER LIN', 'K', NULL),
('2', 'C116  S01', 'C11', '6', 'S01', 'SO1', NULL, NULL),
('2', 'C116  SC1', 'C11', '6', 'SC1', 'Regular le', 'ngth', NULL),
('2', 'C116  SO2', 'C11', '6', 'SO2', 'LEATHER SH', 'OES', NULL),
('2', 'C116  SV1', 'C11', '6', 'SV1', 'MF SUIT CO', 'VER', NULL),
('2', 'C116  TB1', 'C11', '6', 'TB1', 'MC TIE BAR', NULL, NULL),
('2', 'C116  TY1', 'C11', '6', 'TY1', 'MF TIE', NULL, NULL),
('2', 'C117  SO1', 'C11', '7', 'SO1', 'MF SHOES', NULL, NULL),
('2', 'C121  PL1', 'C12', '1', 'PL1', 'MC BASIC L', 'T.PULLOVER', NULL),
('2', 'C121  PL2', 'C12', '1', 'PL2', 'MC FASHION', ' LT.PULLOV', 'ER'),
('2', 'C121  PL3', 'C12', '1', 'PL3', 'MC REG HVY', '.PULLOVER', NULL),
('2', 'C121  PL4', 'C12', '1', 'PL4', 'MC FSH. HV', 'Y.PULLOVER', NULL),
('2', 'C121  PL5', 'C12', '1', 'PL5', 'MC BTN FRN', 'T PULLOVER', NULL),
('2', 'C121  PL6', 'C12', '1', 'PL6', 'MC ZIP FRN', 'T PULLOVER', NULL),
('2', 'C121  PL8', 'C12', '1', 'PL8', 'MC FIT TIG', 'HT PULLOVE', 'R'),
('2', 'C121  SH1', 'C12', '1', 'SH1', 'MC L/S SLD', ' SAFARI SH', 'IRT'),
('2', 'C121  SH2', 'C12', '1', 'SH2', 'MC L/S Y/D', ' & PRINT S', 'HIRT'),
('2', 'C121  SH3', 'C12', '1', 'SH3', 'MC S/S SLD', ' SAFARI SH', 'IRT'),
('2', 'C121  SH4', 'C12', '1', 'SH4', 'MC S/S Y/D', ' & PRINT S', 'HIRT'),
('2', 'C121  SH5', 'C12', '1', 'SH5', 'MC OVERSHI', 'RT', NULL),
('2', 'C121  SH6', 'C12', '1', 'SH6', 'MC LS REG', 'SHIRT', NULL),
('2', 'C121  SH7', 'C12', '1', 'SH7', 'MC SS REG', 'SHIRT', NULL),
('2', 'C121  SW1', 'C12', '1', 'SW1', 'MC POLO SW', 'EATSHIRT', NULL),
('2', 'C121  SW2', 'C12', '1', 'SW2', 'MC REG. SW', 'EATSHIRT', NULL),
('2', 'C121  SW3', 'C12', '1', 'SW3', 'MC FSH SWE', 'ATSHIRT', NULL),
('2', 'C121  SW4', 'C12', '1', 'SW4', 'MC BTN FRN', 'T SWEATSHI', 'RT'),
('2', 'C121  SW5', 'C12', '1', 'SW5', 'MC ZIP FRN', 'T SWEATSHI', 'RT'),
('2', 'C121  SW7', 'C12', '1', 'SW7', 'MC FIT TIG', 'HT SWEATSH', 'IRT'),
('2', 'C121  SW9', 'C12', '1', 'SW9', 'MC TRAININ', 'G TOP SWEA', 'TSHIRT'),
('2', 'C121  TE1', 'C12', '1', 'TE1', 'MC S/S T-S', 'HIRT', NULL),
('2', 'C121  TE2', 'C12', '1', 'TE2', 'MC S/S POL', 'O T-SHIRT', NULL),
('2', 'C121  TE3', 'C12', '1', 'TE3', 'MC S/S FIT', 'TED T-SHIR', 'T'),
('2', 'C121  TE4', 'C12', '1', 'TE4', 'MC TANK TO', 'P T-SHIRT', NULL),
('2', 'C121  TE5', 'C12', '1', 'TE5', 'MC L/S T-S', 'HIRT', NULL),
('2', 'C121  TE6', 'C12', '1', 'TE6', 'MC L/S POL', 'O T-SHIRT', NULL),
('2', 'C121  TE7', 'C12', '1', 'TE7', 'MC L/S FIT', 'TED T-SHIR', 'T'),
('2', 'C121  TE8', 'C12', '1', 'TE8', 'MEN TRAINI', 'NG TOP', NULL),
('2', 'C121  TE9', 'C12', '1', 'TE9', 'MC SLEEVLE', 'SS T-SHIRT', NULL),
('2', 'C121  VS5', 'C12', '1', 'VS5', 'MC TRICOTE', ' VEST', NULL),
('2', 'C122  PT1', 'C12', '2', 'PT1', 'MC REGULAR', ' CHINO PAN', 'T'),
('2', 'C122  PT2', 'C12', '2', 'PT2', 'MC PULLON', 'PANT', NULL),
('2', 'C122  PT3', 'C12', '2', 'PT3', 'MC FASHION', ' PANT', NULL),
('2', 'C122  PT4', 'C12', '2', 'PT4', 'MC 5 POCKE', 'T PANT', NULL),
('2', 'C122  PT5', 'C12', '2', 'PT5', 'MC REGULAR', ' SEMI CLAS', 'SIC PANT'),
('2', 'C122  PT6', 'C12', '2', 'PT6', 'MC FASHION', ' SEMI CLAS', 'SIC PANT'),
('2', 'C122  PT9', 'C12', '2', 'PT9', 'MC TRAININ', 'G PANT', NULL),
('2', 'C122  SAM', 'C12', '2', 'SAM', 'SAMPLE', NULL, NULL),
('2', 'C122  SM1', 'C12', '2', 'SM1', 'MC SWIMWEA', 'R', NULL),
('2', 'C122  SR1', 'C12', '2', 'SR1', 'MC BASIC S', 'HORT', NULL),
('2', 'C122  SR2', 'C12', '2', 'SR2', 'MC PULLON', 'SHORT', NULL),
('2', 'C122  SR3', 'C12', '2', 'SR3', 'MC FASHION', ' SHORT', NULL),
('2', 'C122  SR4', 'C12', '2', 'SR4', 'MC PERMUDA', ' SHORT', NULL),
('2', 'C122  SR5', 'C12', '2', 'SR5', 'MC 5 POCKE', 'T SHORT', NULL),
('2', 'C122  SR9', 'C12', '2', 'SR9', 'MC TRAININ', 'G SHORT', NULL),
('2', 'C123  HT1', 'C12', '3', 'HT1', 'HAT', NULL, NULL),
('2', 'C123  JK1', 'C12', '3', 'JK1', 'MC BASIC J', 'ACKET', NULL),
('2', 'C123  JK2', 'C12', '3', 'JK2', 'MC FASHION', ' JACKET', NULL),
('2', 'C123  JK5', 'C12', '3', 'JK5', 'MC PARKA J', 'ACKET', NULL),
('2', 'C123  JK9', 'C12', '3', 'JK9', 'MC LEATHER', ' JACKET', NULL),
('2', 'C123  SM1', 'C12', '3', 'SM1', 'MC SMWR. 1', ' Piece', NULL),
('2', 'C123  SM3', 'C12', '3', 'SM3', 'KGC SMWR.', 'ONE PCS.SH', 'ORT'),
('2', 'C123  TE1', 'C12', '3', 'TE1', 'S/S T-SHIR', 'T', NULL),
('2', 'C123  TE9', 'C12', '3', 'TE9', 'SLVLES T.S', 'HIRT', NULL),
('2', 'C123  VS3', 'C12', '3', 'VS3', 'MC BASIC V', 'EST', NULL),
('2', 'C123  VS4', 'C12', '3', 'VS4', 'MC SAFARI', 'VEST', NULL),
('2', 'C124  BX1', 'C12', '4', 'BX1', 'MC REGULAR', ' BOXER', NULL),
('2', 'C124  BX2', 'C12', '4', 'BX2', 'MC FITTED', 'BOXER', NULL),
('2', 'C124  BX6', 'C12', '4', 'BX6', 'MC Uware', NULL, NULL),
('2', 'C124  SP1', 'C12', '4', 'SP1', 'MC REGULAR', ' SLIP', NULL),
('2', 'C124  TE1', 'C12', '4', 'TE1', 'MC S/S T-S', 'HIRT', NULL),
('2', 'C124  TE2', 'C12', '4', 'TE2', 'MC SS POLO', ' T-SHIRT', NULL),
('2', 'C124  TE4', 'C12', '4', 'TE4', 'MC TANK TO', 'P T-SHIRT', NULL),
('2', 'C124  TE5', 'C12', '4', 'TE5', 'MC LS T-SH', 'IRT', NULL),
('2', 'C124  TE6', 'C12', '4', 'TE6', 'MC LS POLO', ' T-SHIRT', NULL),
('2', 'C124  TE9', 'C12', '4', 'TE9', 'MC NS T-SH', 'IRT', NULL),
('2', 'C126  BG1', 'C12', '6', 'BG1', 'BG1', NULL, NULL),
('2', 'C126  BSK', 'C12', '6', 'BSK', 'BASKET', NULL, NULL),
('2', 'C126  BT1', 'C12', '6', 'BT1', 'MC BELT', NULL, NULL),
('2', 'C126  BT2', 'C12', '6', 'BT2', 'WOVEN BELT', NULL, NULL),
('2', 'C126  BT4', 'C12', '6', 'BT4', 'MC Casual', 'BELT', NULL),
('2', 'C126  BT5', 'C12', '6', 'BT5', 'MC Jeans B', 'ELT', NULL),
('2', 'C126  EW1', 'C12', '6', 'EW1', 'EW1', NULL, NULL),
('2', 'C126  FL1', 'C12', '6', 'FL1', 'Flash Memo', 'ry', NULL),
('2', 'C126  GV1', 'C12', '6', 'GV1', 'MEN TRICOT', ' GLOVE', NULL),
('2', 'C126  GV2', 'C12', '6', 'GV2', 'MC TRICOTE', ' GLOVE', NULL),
('2', 'C126  HN1', 'C12', '6', 'HN1', 'Chandler', NULL, NULL),
('2', 'C126  HT1', 'C12', '6', 'HT1', 'MEN HAT', NULL, NULL),
('2', 'C126  HT2', 'C12', '6', 'HT2', 'ITALIAN HA', 'T', NULL),
('2', 'C126  IC1', 'C12', '6', 'IC1', 'MC ICE CAP', NULL, NULL),
('2', 'C126  KC1', 'C12', '6', 'KC1', 'KC1', NULL, NULL),
('2', 'C126  LR1', 'C12', '6', 'LR1', 'LR1', NULL, NULL),
('2', 'C126  MDL', 'C12', '6', 'MDL', 'CONCRETE M', 'EDAL', NULL),
('2', 'C126  MNQ', 'C12', '6', 'MNQ', 'MEN MANNEQ', 'UIN', NULL),
('2', 'C126  OTH', 'C12', '6', 'OTH', 'MC Others', NULL, NULL),
('2', 'C126  PJ5', 'C12', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('2', 'C126  PJ6', 'C12', '6', 'PJ6', 'PAJAMA BOT', 'TOM', NULL),
('2', 'C126  PJ7', 'C12', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('2', 'C126  PJ8', 'C12', '6', 'PJ8', 'PAJAMA 2 P', 'IECES', NULL),
('2', 'C126  SC1', 'C12', '6', 'SC1', 'Regular le', 'ngth', NULL),
('2', 'C126  SC2', 'C12', '6', 'SC2', 'SOCKS', NULL, NULL),
('2', 'C126  SC3', 'C12', '6', 'SC3', 'ANKLE', NULL, NULL),
('2', 'C126  SF1', 'C12', '6', 'SF1', 'MC SCARF', NULL, NULL),
('2', 'C126  SL1', 'C12', '6', 'SL1', 'SL1', NULL, NULL),
('2', 'C126  SO1', 'C12', '6', 'SO1', 'SO1', NULL, NULL),
('2', 'C126  WB1', 'C12', '6', 'WB1', 'MC Wrist B', 'and', NULL),
('2', 'C126  WL1', 'C12', '6', 'WL1', 'LEATHER WA', 'LLET', NULL),
('2', 'C126  WT1', 'C12', '6', 'WT1', 'WT1', NULL, NULL),
('2', 'C211  SH0', 'C21', '1', 'SH0', 'SHIRT', NULL, NULL),
('2', 'C221  JK2', 'C22', '1', 'JK2', 'KBC FASHIO', 'N JACKET', NULL),
('2', 'C221  PL1', 'C22', '1', 'PL1', 'JBC BSC LT', '. PULLOVER', NULL),
('2', 'C221  PL2', 'C22', '1', 'PL2', 'JBC FASHIO', 'N LT. PULL', 'OVER'),
('2', 'C221  PL3', 'C22', '1', 'PL3', 'JBC REG HV', 'Y. PULLOVE', 'R'),
('2', 'C221  PL4', 'C22', '1', 'PL4', 'JBC FSH.HV', 'Y.PULLOVER', NULL),
('2', 'C221  PL5', 'C22', '1', 'PL5', 'JBC BTN FR', 'NT PULLOVE', 'R'),
('2', 'C221  PL6', 'C22', '1', 'PL6', 'JBC ZIP FR', 'NT PULLOVE', 'R'),
('2', 'C221  PL8', 'C22', '1', 'PL8', 'JBC FIT TI', 'GHT PULLOV', 'ER'),
('2', 'C221  SH1', 'C22', '1', 'SH1', 'JBC L/S SL', 'D SAFARI S', 'HIRT'),
('2', 'C221  SH2', 'C22', '1', 'SH2', 'JBC L/S Y/', 'D & PRINT', 'SHIRT'),
('2', 'C221  SH3', 'C22', '1', 'SH3', 'JBC S/S SL', 'D SAFARI S', 'HIRT'),
('2', 'C221  SH4', 'C22', '1', 'SH4', 'JBC S/S Y/', 'D & PRINT', 'SHIRT'),
('2', 'C221  SH5', 'C22', '1', 'SH5', 'JBC OVERSH', 'IRT', NULL),
('2', 'C221  SH7', 'C22', '1', 'SH7', 'JBC SS REG', ' SHIRT', NULL),
('2', 'C221  SH8', 'C22', '1', 'SH8', 'JBC LS FSH', ' SHIRT', NULL),
('2', 'C221  SW1', 'C22', '1', 'SW1', 'JBC POLO S', 'WEATSHIRT', NULL),
('2', 'C221  SW2', 'C22', '1', 'SW2', 'JBC REG. S', 'WEATSHIRT', NULL),
('2', 'C221  SW3', 'C22', '1', 'SW3', 'JBC FSH SW', 'EATSHIRT', NULL),
('2', 'C221  SW4', 'C22', '1', 'SW4', 'JBC BTN FR', 'NT SWEATSH', 'IRT'),
('2', 'C221  SW5', 'C22', '1', 'SW5', 'JBC ZIP FR', 'NT SWEATSH', 'IRT'),
('2', 'C221  SW7', 'C22', '1', 'SW7', 'JBC FIT TI', 'GHT SWEATS', 'HIRT'),
('2', 'C221  SW9', 'C22', '1', 'SW9', 'JBC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('2', 'C221  TE1', 'C22', '1', 'TE1', 'JBC S/S T-', 'SHIRT', NULL),
('2', 'C221  TE2', 'C22', '1', 'TE2', 'JBC S/S PO', 'LO T-SHIRT', NULL),
('2', 'C221  TE3', 'C22', '1', 'TE3', 'JBC S/S FI', 'TTED T-SHI', 'RT'),
('2', 'C221  TE4', 'C22', '1', 'TE4', 'JBC TANK T', 'OP T-SHIRT', NULL),
('2', 'C221  TE5', 'C22', '1', 'TE5', 'JBC L/S T-', 'SHIRT', NULL),
('2', 'C221  TE6', 'C22', '1', 'TE6', 'JBC L/S PO', 'LO T-SHIRT', NULL),
('2', 'C221  TE7', 'C22', '1', 'TE7', 'JBC L/S FI', 'TTED T-SHI', 'RT'),
('2', 'C221  TE8', 'C22', '1', 'TE8', 'JBC TRAINI', 'NG TOP', NULL),
('2', 'C221  TE9', 'C22', '1', 'TE9', 'JBC SLEEVL', 'ESS T-SHIR', 'T'),
('2', 'C221  VS3', 'C22', '1', 'VS3', 'JBC BASIC', 'VEST', NULL),
('2', 'C221  VS5', 'C22', '1', 'VS5', 'JBC TRICOT', 'E VEST', NULL),
('2', 'C222  PT1', 'C22', '2', 'PT1', 'JBC REGULA', 'R CHINO PA', 'NT'),
('2', 'C222  PT2', 'C22', '2', 'PT2', 'JBC PULLON', ' PANT', NULL),
('2', 'C222  PT3', 'C22', '2', 'PT3', 'JBC FASHIO', 'N PANT', NULL),
('2', 'C222  PT4', 'C22', '2', 'PT4', 'JBC 5 POCK', 'ET PANT', NULL),
('2', 'C222  PT9', 'C22', '2', 'PT9', 'JBC TRAINI', 'NG PANT', NULL),
('2', 'C222  SAM', 'C22', '2', 'SAM', 'SAMPLE', NULL, NULL),
('2', 'C222  SM1', 'C22', '2', 'SM1', 'JBC SWIMWE', 'AR', NULL),
('2', 'C222  SM9', 'C22', '2', 'SM9', 'JBC Btm', NULL, NULL),
('2', 'C222  SR1', 'C22', '2', 'SR1', 'JBC BASIC', 'SHORT', NULL),
('2', 'C222  SR2', 'C22', '2', 'SR2', 'JBC PULLON', ' SHORT', NULL),
('2', 'C222  SR3', 'C22', '2', 'SR3', 'JBC FASHIO', 'N SHORT', NULL),
('2', 'C222  SR4', 'C22', '2', 'SR4', 'JBC PERMUD', 'A SHORT', NULL),
('2', 'C222  SR5', 'C22', '2', 'SR5', 'JBC 5 POCK', 'ET SHORT', NULL),
('2', 'C222  SR9', 'C22', '2', 'SR9', 'JBC TRAINI', 'NG SHORT', NULL),
('2', 'C222  ST1', 'C22', '2', 'ST1', 'JBC SALOPP', 'ETTE SHORT', NULL),
('2', 'C222  ST2', 'C22', '2', 'ST2', 'JBC SALOPP', 'ETTE PANT', NULL),
('2', 'C223  HT1', 'C22', '3', 'HT1', 'HAT', NULL, NULL),
('2', 'C223  JK1', 'C22', '3', 'JK1', 'JBC BASIC', 'JACKET', NULL),
('2', 'C223  JK2', 'C22', '3', 'JK2', 'JBC FASHIO', 'N JACKET', NULL),
('2', 'C223  JK5', 'C22', '3', 'JK5', 'JBC PARKA', 'JACKET', NULL),
('2', 'C223  JK6', 'C22', '3', 'JK6', 'JBC JACKET', NULL, NULL),
('2', 'C223  JK9', 'C22', '3', 'JK9', 'JBC LEATHE', 'R JACKET', NULL),
('2', 'C223  SM1', 'C22', '3', 'SM1', 'JBC SMWR.', '1 Piece', NULL),
('2', 'C223  SW7', 'C22', '3', 'SW7', 'JBC BODY S', 'WEATSHIRT', NULL),
('2', 'C223  TE1', 'C22', '3', 'TE1', 'JBC S/S T-', 'SHIRT', NULL),
('2', 'C223  TE9', 'C22', '3', 'TE9', 'MC SLEEVLE', 'SS T-SHIRT', NULL),
('2', 'C223  VS4', 'C22', '3', 'VS4', 'JBC  SAFAR', 'I VEST', NULL),
('2', 'C224  BX1', 'C22', '4', 'BX1', 'JBC REGULA', 'R BOXER', NULL),
('2', 'C224  BX2', 'C22', '4', 'BX2', 'JBC FITTED', ' BOXER', NULL),
('2', 'C224  TE1', 'C22', '4', 'TE1', 'JBC S/S T-', 'SHIRT', NULL),
('2', 'C224  TE4', 'C22', '4', 'TE4', 'JBC TANK T', 'OP T-SHIRT', NULL),
('2', 'C224  TE5', 'C22', '4', 'TE5', 'JBC L/S UN', 'DERSHIRT', NULL),
('2', 'C224  TE9', 'C22', '4', 'TE9', 'JBC NS T-S', 'HIRT', NULL),
('2', 'C226  BG1', 'C22', '6', 'BG1', 'JGC BAG', NULL, NULL),
('2', 'C226  BG2', 'C22', '6', 'BG2', 'JB BAG', NULL, NULL),
('2', 'C226  BT1', 'C22', '6', 'BT1', 'JBC BELT', NULL, NULL),
('2', 'C226  BT2', 'C22', '6', 'BT2', 'JBC WOVEN', 'BELT', NULL),
('2', 'C226  BT4', 'C22', '6', 'BT4', 'JB Casual', 'BELT', NULL),
('2', 'C226  BT5', 'C22', '6', 'BT5', 'JB Jeans B', 'ELT', NULL),
('2', 'C226  GV1', 'C22', '6', 'GV1', 'JBC  TRICO', 'TE GLOVE', NULL),
('2', 'C226  HN1', 'C22', '6', 'HN1', 'Chandler', NULL, NULL),
('2', 'C226  HT1', 'C22', '6', 'HT1', 'JBC HAT', NULL, NULL),
('2', 'C226  HT2', 'C22', '6', 'HT2', 'ITALIAN HA', 'T', NULL),
('2', 'C226  IC1', 'C22', '6', 'IC1', 'JBC ICE CA', 'P', NULL),
('2', 'C226  OTH', 'C22', '6', 'OTH', 'JBC Others', NULL, NULL),
('2', 'C226  PJ5', 'C22', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('2', 'C226  PJ6', 'C22', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('2', 'C226  PJ7', 'C22', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('2', 'C226  SC1', 'C22', '6', 'SC1', 'Regular le', 'ngth', NULL),
('2', 'C226  SC2', 'C22', '6', 'SC2', 'Medium Len', 'gth', NULL),
('2', 'C226  SC3', 'C22', '6', 'SC3', 'ankle', NULL, NULL),
('2', 'C226  SF1', 'C22', '6', 'SF1', 'JBC SCARF', NULL, NULL),
('2', 'C226  SL1', 'C22', '6', 'SL1', 'JBC SLIPPE', 'R', NULL),
('2', 'C226  SO1', 'C22', '6', 'SO1', 'SHOES', NULL, NULL),
('2', 'C227  SL1', 'C22', '7', 'SL1', 'JBC SLIPPE', 'RS', NULL),
('2', 'C311  JK0', 'C31', '1', 'JK0', 'JACKET', NULL, NULL),
('2', 'C311  PT0', 'C31', '1', 'PT0', 'PANT', NULL, NULL),
('2', 'C311  SH0', 'C31', '1', 'SH0', 'SHIRT', NULL, NULL),
('2', 'C311  SR0', 'C31', '1', 'SR0', 'SHORT', NULL, NULL),
('2', 'C311  ST0', 'C31', '1', 'ST0', 'SALOPPETTE', NULL, NULL),
('2', 'C311  SW0', 'C31', '1', 'SW0', 'SWEATSHIRT', NULL, NULL),
('2', 'C311  TE0', 'C31', '1', 'TE0', 'T-SHIRT', NULL, NULL),
('2', 'C321  C32', 'C32', '1', 'C32', 'KBC TRICOT', 'E VEST', NULL),
('2', 'C321  JK2', 'C32', '1', 'JK2', 'KBC FASHIO', 'N JACKET', NULL),
('2', 'C321  PL1', 'C32', '1', 'PL1', 'KBC BSC LT', '. PULLOVER', NULL),
('2', 'C321  PL2', 'C32', '1', 'PL2', 'KBC FASHIO', 'N LT. PULL', 'OVER'),
('2', 'C321  PL3', 'C32', '1', 'PL3', 'KBC REG HV', 'Y. PULLOVE', 'R'),
('2', 'C321  PL4', 'C32', '1', 'PL4', 'KBC FSH.HV', 'Y.PULLOVER', NULL),
('2', 'C321  PL5', 'C32', '1', 'PL5', 'KBC BTN FR', 'NT PULLOVE', 'R'),
('2', 'C321  PL6', 'C32', '1', 'PL6', 'KBC ZIP FR', 'NT PULLOVE', 'R'),
('2', 'C321  PL8', 'C32', '1', 'PL8', 'KBC FIT TI', 'GHT PULLOV', 'ER'),
('2', 'C321  SH1', 'C32', '1', 'SH1', 'KBC L/S SL', 'D SAFARI S', 'HIRT'),
('2', 'C321  SH2', 'C32', '1', 'SH2', 'KBC L/S Y/', 'D & PRINT', 'SHIRT'),
('2', 'C321  SH3', 'C32', '1', 'SH3', 'KBC S/S SL', 'D SAFARI S', 'HIRT'),
('2', 'C321  SH4', 'C32', '1', 'SH4', 'KBC S/S Y/', 'D & PRINT', 'SHIRT'),
('2', 'C321  SH5', 'C32', '1', 'SH5', 'KBC OVERSH', 'IRT', NULL),
('2', 'C321  SH7', 'C32', '1', 'SH7', 'KBC SS REG', ' SHIRT', NULL),
('2', 'C321  SH8', 'C32', '1', 'SH8', 'KBC LS FSH', ' SHIRT', NULL),
('2', 'C321  SW1', 'C32', '1', 'SW1', 'KBC POLO S', 'WEATSHIRT', NULL),
('2', 'C321  SW2', 'C32', '1', 'SW2', 'KBC REG. S', 'WEATSHIRT', NULL),
('2', 'C321  SW3', 'C32', '1', 'SW3', 'KBC FSH SW', 'EATSHIRT', NULL),
('2', 'C321  SW4', 'C32', '1', 'SW4', 'KBC BTN FR', 'NT SWEATSH', 'IRT'),
('2', 'C321  SW5', 'C32', '1', 'SW5', 'KBC ZIP FR', 'NT SWEATSH', 'IRT'),
('2', 'C321  SW7', 'C32', '1', 'SW7', 'KBC FIT TI', 'GHT SWEATS', 'HIRT'),
('2', 'C321  SW9', 'C32', '1', 'SW9', 'KBC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('2', 'C321  TE1', 'C32', '1', 'TE1', 'KBC S/S T-', 'SHIRT', NULL),
('2', 'C321  TE2', 'C32', '1', 'TE2', 'KBC S/S PO', 'LO T-SHIRT', NULL),
('2', 'C321  TE3', 'C32', '1', 'TE3', 'KBC S/S FI', 'TTED T-SHI', 'RT'),
('2', 'C321  TE4', 'C32', '1', 'TE4', 'KBC TANK T', 'OP T-SHIRT', NULL),
('2', 'C321  TE5', 'C32', '1', 'TE5', 'KBC L/S T-', 'SHIRT', NULL),
('2', 'C321  TE6', 'C32', '1', 'TE6', 'KBC L/S PO', 'LO T-SHIRT', NULL),
('2', 'C321  TE7', 'C32', '1', 'TE7', 'KBC L/S FI', 'TTED T-SHI', 'RT'),
('2', 'C321  TE8', 'C32', '1', 'TE8', 'KBC TRAINI', 'NG TOP', NULL),
('2', 'C321  TE9', 'C32', '1', 'TE9', 'KBC SLEEVL', 'ESS T-SHIR', 'T'),
('2', 'C321  VS3', 'C32', '1', 'VS3', 'KBC BASIC', 'VEST', NULL),
('2', 'C321  VS5', 'C32', '1', 'VS5', 'KBC TRICOT', 'E VEST', NULL),
('2', 'C322  PT1', 'C32', '2', 'PT1', 'KBC REGULA', 'R CHINO PA', 'NT'),
('2', 'C322  PT2', 'C32', '2', 'PT2', 'KBC PULLON', ' PANT', NULL),
('2', 'C322  PT3', 'C32', '2', 'PT3', 'KBC FASHIO', 'N PANT', NULL),
('2', 'C322  PT4', 'C32', '2', 'PT4', 'KBC 5 POCK', 'ET PANT', NULL),
('2', 'C322  PT9', 'C32', '2', 'PT9', 'KBC TRAINI', 'NG PANT', NULL),
('2', 'C322  SM1', 'C32', '2', 'SM1', 'KBC SWIMWE', 'AR', NULL),
('2', 'C322  SM9', 'C32', '2', 'SM9', 'KBC SWIMWE', 'AR', NULL),
('2', 'C322  SR1', 'C32', '2', 'SR1', 'KBC BASIC', 'SHORT', NULL),
('2', 'C322  SR2', 'C32', '2', 'SR2', 'KBC PULLON', ' SHORT', NULL),
('2', 'C322  SR3', 'C32', '2', 'SR3', 'KBC FASHIO', 'N SHORT', NULL),
('2', 'C322  SR4', 'C32', '2', 'SR4', 'KBC PERMUD', 'A SHORT', NULL),
('2', 'C322  SR5', 'C32', '2', 'SR5', 'KBC 5 POCK', 'ET SHORT', NULL),
('2', 'C322  SR9', 'C32', '2', 'SR9', 'KBC TRAINI', 'NG SHORT', NULL),
('2', 'C322  ST1', 'C32', '2', 'ST1', 'KBC SALOPP', 'ETTE SHORT', NULL),
('2', 'C322  ST2', 'C32', '2', 'ST2', 'KBC SALOPP', 'ETTE PANT', NULL),
('2', 'C323  HT1', 'C32', '3', 'HT1', 'HAT', NULL, NULL),
('2', 'C323  JK1', 'C32', '3', 'JK1', 'KBC BASIC', 'JACKET', NULL),
('2', 'C323  JK2', 'C32', '3', 'JK2', 'KBC FASHIO', 'N JACKET', NULL),
('2', 'C323  JK5', 'C32', '3', 'JK5', 'KBC PARKA', 'JACKET', NULL),
('2', 'C323  JK6', 'C32', '3', 'JK6', 'KBC Jacket', NULL, NULL),
('2', 'C323  JK9', 'C32', '3', 'JK9', 'KBC LEATHE', 'R JACKET', NULL),
('2', 'C323  SM1', 'C32', '3', 'SM1', 'KBC SMWR.', '1 Piece', NULL),
('2', 'C323  SW7', 'C32', '3', 'SW7', 'KBC BODY S', 'WEATSHIRT', NULL),
('2', 'C323  TE1', 'C32', '3', 'TE1', 'KBC S/S T-', 'SHIRT', NULL),
('2', 'C323  TE9', 'C32', '3', 'TE9', 'MC SLEEVLE', 'SS T-SHIRT', NULL),
('2', 'C324  BX1', 'C32', '4', 'BX1', 'KBC REGULA', 'R BOXER', NULL),
('2', 'C324  BX2', 'C32', '4', 'BX2', 'KBC  FITTE', 'D BOXER', NULL),
('2', 'C324  TE1', 'C32', '4', 'TE1', 'KBC S/S T-', 'SHIRT', NULL),
('2', 'C324  TE4', 'C32', '4', 'TE4', 'KBC TANK T', 'OP T-SHIRT', NULL),
('2', 'C324  TE5', 'C32', '4', 'TE5', 'KBC L/S T.', 'SHIRT', NULL),
('2', 'C324  TE9', 'C32', '4', 'TE9', 'KBC NS T-S', 'HIRT', NULL),
('2', 'C325  SC5', 'C32', '5', 'SC5', 'KBC HOME S', 'OCKS', NULL),
('2', 'C326  BG1', 'C32', '6', 'BG1', 'JGC BAG', NULL, NULL),
('2', 'C326  BG2', 'C32', '6', 'BG2', 'JB BAG', NULL, NULL),
('2', 'C326  BT1', 'C32', '6', 'BT1', 'KBC BELT', NULL, NULL),
('2', 'C326  BT2', 'C32', '6', 'BT2', 'JBC WOVEN', 'BELT', NULL),
('2', 'C326  BT4', 'C32', '6', 'BT4', 'KB Casual', 'BELT', NULL),
('2', 'C326  BT5', 'C32', '6', 'BT5', 'KB Jeans B', 'ELT', NULL),
('2', 'C326  GV1', 'C32', '6', 'GV1', 'KBC  TRICO', 'TE GLOVE', NULL),
('2', 'C326  HN1', 'C32', '6', 'HN1', 'Chandler', NULL, NULL),
('2', 'C326  HT1', 'C32', '6', 'HT1', 'KBC HAT', NULL, NULL),
('2', 'C326  HT2', 'C32', '6', 'HT2', 'ITALIAN HA', 'T', NULL),
('2', 'C326  IC1', 'C32', '6', 'IC1', 'KBC ICE CA', 'P', NULL),
('2', 'C326  MNQ', 'C32', '6', 'MNQ', 'BOYS MANNE', 'QUIN', NULL),
('2', 'C326  OTH', 'C32', '6', 'OTH', 'KBC Others', NULL, NULL),
('2', 'C326  PJ5', 'C32', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('2', 'C326  PJ6', 'C32', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('2', 'C326  PJ7', 'C32', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('2', 'C326  SC1', 'C32', '6', 'SC1', 'Regular le', 'ngth', NULL),
('2', 'C326  SC2', 'C32', '6', 'SC2', 'Medium Len', 'gth', NULL),
('2', 'C326  SC3', 'C32', '6', 'SC3', 'SOCKS', NULL, NULL),
('2', 'C326  SC5', 'C32', '6', 'SC5', 'KBC SOCKS', NULL, NULL),
('2', 'C326  SF1', 'C32', '6', 'SF1', 'KBC SCARF', NULL, NULL),
('2', 'C326  SL1', 'C32', '6', 'SL1', 'KBC SLIPPE', 'R', NULL),
('2', 'C326  SO1', 'C32', '6', 'SO1', 'SHOSES', NULL, NULL),
('2', 'C327  SL1', 'C32', '7', 'SL1', 'KBC SLIPPE', 'RS', NULL),
('2', 'C411  PT0', 'C41', '1', 'PT0', 'Pant', NULL, NULL),
('2', 'C411  VS0', 'C41', '1', 'VS0', 'VEST', NULL, NULL),
('2', 'C421  BL1', 'C42', '1', 'BL1', 'JGC L/S BT', 'N FRNT BLO', 'USE'),
('2', 'C421  BL2', 'C42', '1', 'BL2', 'JGC S/S BT', 'N FRNT BLO', 'USE'),
('2', 'C421  BL3', 'C42', '1', 'BL3', 'JGC N/S BT', 'N FRNT BLO', 'USE'),
('2', 'C421  BL4', 'C42', '1', 'BL4', 'JGC L/S BL', 'OUSE', NULL),
('2', 'C421  BL5', 'C42', '1', 'BL5', 'JGC S/S BL', 'OUSE', NULL),
('2', 'C421  BL6', 'C42', '1', 'BL6', 'JGC SLEEVE', 'LESS BLOUS', 'E'),
('2', 'C421  BL7', 'C42', '1', 'BL7', 'JGC TANK T', 'OP BLOUSE', NULL),
('2', 'C421  BL9', 'C42', '1', 'BL9', 'JGC JACKET', '/SET BLOUS', 'E'),
('2', 'C421  JK2', 'C42', '1', 'JK2', 'JGC FASHIO', 'N JACKET', NULL),
('2', 'C421  JK8', 'C42', '1', 'JK8', 'RELATED JA', 'CKET-OVER', 'SHIRT'),
('2', 'C421  PL1', 'C42', '1', 'PL1', 'JGC BSC LT', '. PULLOVER', NULL),
('2', 'C421  PL2', 'C42', '1', 'PL2', 'JGC FASHIO', 'N LT. PULL', 'OVER'),
('2', 'C421  PL3', 'C42', '1', 'PL3', 'JGC REG HV', 'Y. PULLOVE', 'R'),
('2', 'C421  PL4', 'C42', '1', 'PL4', 'JGC FSH.HV', 'Y.PULLOVER', NULL),
('2', 'C421  PL5', 'C42', '1', 'PL5', 'JGC BTN FR', 'NT PULLOVE', 'R'),
('2', 'C421  PL6', 'C42', '1', 'PL6', 'JGC ZIP FR', 'NT PULLOVE', 'R'),
('2', 'C421  PL7', 'C42', '1', 'PL7', 'JGC TWIN S', 'ET LT.PULL', 'OVER'),
('2', 'C421  PL8', 'C42', '1', 'PL8', 'JGC FIT TI', 'GHT PULLOV', 'ER'),
('2', 'C421  SH5', 'C42', '1', 'SH5', 'JGC OVERSH', 'IRT', NULL),
('2', 'C421  SW1', 'C42', '1', 'SW1', 'JGC POLO S', 'WEATSHIRT', NULL),
('2', 'C421  SW2', 'C42', '1', 'SW2', 'JGC REG. S', 'WEATSHIRT', NULL),
('2', 'C421  SW3', 'C42', '1', 'SW3', 'JGC FSH SW', 'EATSHIRT', NULL),
('2', 'C421  SW4', 'C42', '1', 'SW4', 'JGC BTN FR', 'NT SWEATSH', 'IRT'),
('2', 'C421  SW5', 'C42', '1', 'SW5', 'JGC ZIP FR', 'NT SWEATSH', 'IRT'),
('2', 'C421  SW6', 'C42', '1', 'SW6', 'JGC TWIN S', 'ET SWEATSH', 'IRT'),
('2', 'C421  SW7', 'C42', '1', 'SW7', 'JGC FIT TI', 'GHT SWEATS', 'HIRT'),
('2', 'C421  SW9', 'C42', '1', 'SW9', 'JGC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('2', 'C421  TE1', 'C42', '1', 'TE1', 'JGC S/S T-', 'SHIRT', NULL),
('2', 'C421  TE2', 'C42', '1', 'TE2', 'JGC S/S PO', 'LO T-SHIRT', NULL),
('2', 'C421  TE3', 'C42', '1', 'TE3', 'JGC S/S FI', 'TTED T-SHI', 'RT'),
('2', 'C421  TE4', 'C42', '1', 'TE4', 'JGC TANK T', 'OP T-SHIRT', NULL),
('2', 'C421  TE5', 'C42', '1', 'TE5', 'JGC L/S T-', 'SHIRT', NULL),
('2', 'C421  TE6', 'C42', '1', 'TE6', 'JGC L/S PO', 'LO T-SHIRT', NULL),
('2', 'C421  TE7', 'C42', '1', 'TE7', 'JGC L/S FI', 'TTED T-SHI', 'RT'),
('2', 'C421  TE8', 'C42', '1', 'TE8', 'JGC TWIN S', 'ET T-SHIRT', NULL),
('2', 'C421  TE9', 'C42', '1', 'TE9', 'JGC SLEEVL', 'ESS T-SHIR', 'T'),
('2', 'C421  VS3', 'C42', '1', 'VS3', 'JGC REGULA', 'R CASUAL V', 'EST\r\n\r\n \r\n'),
('2', 'C421  VS4', 'C42', '1', 'VS4', 'JGC  SAFAR', 'I VEST', NULL),
('2', 'C421  VS5', 'C42', '1', 'VS5', 'JGC TRICOT', 'E VEST', NULL),
('2', 'C422  DR3', 'C42', '2', 'DR3', 'JGC  2 PIC', 'ES DRESS', NULL),
('2', 'C422  DR4', 'C42', '2', 'DR4', 'S/S REGULA', 'R  LNGTH D', 'RESS'),
('2', 'C422  DR7', 'C42', '2', 'DR7', 'JGC N/S RE', 'G DRESS', NULL),
('2', 'C422  DR8', 'C42', '2', 'DR8', 'NO SLV LNG', ' DRESS', NULL),
('2', 'C422  PT1', 'C42', '2', 'PT1', 'JGC REGULA', 'R CHINO PA', 'NT'),
('2', 'C422  PT2', 'C42', '2', 'PT2', 'JGC PULLON', ' PANT', NULL),
('2', 'C422  PT3', 'C42', '2', 'PT3', 'JGC FASHIO', 'N PANT', NULL),
('2', 'C422  PT4', 'C42', '2', 'PT4', 'JGC 5 POCK', 'ET PANT', NULL),
('2', 'C422  PT9', 'C42', '2', 'PT9', 'JGC TRAINI', 'NG PANT', NULL),
('2', 'C422  SAM', 'C42', '2', 'SAM', 'SAMPLE', NULL, NULL),
('2', 'C422  SK1', 'C42', '2', 'SK1', 'JGC REGULA', 'R SKIRT', NULL),
('2', 'C422  SK2', 'C42', '2', 'SK2', 'JGC LONG S', 'KIRT', NULL),
('2', 'C422  SK3', 'C42', '2', 'SK3', 'JGC SHORT', 'SKIRT', NULL),
('2', 'C422  SK4', 'C42', '2', 'SK4', 'JGC SKIRT', NULL, NULL),
('2', 'C422  SK6', 'C42', '2', 'SK6', 'JGC REGULA', 'R SKORT', NULL),
('2', 'C422  SK7', 'C42', '2', 'SK7', 'JGC LONG S', 'KORT', NULL),
('2', 'C422  SK8', 'C42', '2', 'SK8', 'JGC SHORT', 'SKORT', NULL),
('2', 'C422  SR1', 'C42', '2', 'SR1', 'JGC BASIC', 'SHORT', NULL),
('2', 'C422  SR2', 'C42', '2', 'SR2', 'JGC PULLON', ' SHORT', NULL),
('2', 'C422  SR3', 'C42', '2', 'SR3', 'JGC FASHIO', 'N SHORT', NULL),
('2', 'C422  SR4', 'C42', '2', 'SR4', 'JGC PERMUD', 'A SHORT', NULL),
('2', 'C422  SR5', 'C42', '2', 'SR5', 'JGC 5 POCK', 'ET SHORT', NULL),
('2', 'C422  SR9', 'C42', '2', 'SR9', 'JGC TRAINI', 'NG SHORT', NULL),
('2', 'C422  ST1', 'C42', '2', 'ST1', 'JGC SALOPP', 'ETTE SHORT', NULL),
('2', 'C422  ST2', 'C42', '2', 'ST2', 'JGC SALOPP', 'ETTE PANT', NULL),
('2', 'C422  ST3', 'C42', '2', 'ST3', 'JGC SALOPP', 'ETTE DRESS', NULL),
('2', 'C423  CM1', 'C42', '3', 'CM1', 'JGC CACHE', 'MAILLOT', NULL),
('2', 'C423  CT1', 'C42', '3', 'CT1', 'JGC S.BREA', 'ST REG COA', 'T'),
('2', 'C423  DR1', 'C42', '3', 'DR1', 'JGC L/S RE', 'G DRESS', NULL),
('2', 'C423  DR2', 'C42', '3', 'DR2', 'JGC L/S LO', 'NG DRESS', NULL),
('2', 'C423  DR3', 'C42', '3', 'DR3', 'JGC L/S SH', 'ORT DRESS', NULL),
('2', 'C423  DR4', 'C42', '3', 'DR4', 'JGC S/S RE', 'G DRESS', NULL),
('2', 'C423  DR5', 'C42', '3', 'DR5', 'JGC S/S LO', 'NG DRESS', NULL),
('2', 'C423  DR6', 'C42', '3', 'DR6', 'JGC S/S SH', 'ORT DRESS', NULL),
('2', 'C423  DR7', 'C42', '3', 'DR7', 'JGC N/S RE', 'G DRESS', NULL),
('2', 'C423  DR8', 'C42', '3', 'DR8', 'JGC N/S LO', 'NG DRESS', NULL),
('2', 'C423  DR9', 'C42', '3', 'DR9', 'JGC N/S SH', 'ORT DRESS', NULL),
('2', 'C423  HT1', 'C42', '3', 'HT1', 'JGC HAT', NULL, NULL),
('2', 'C423  JK1', 'C42', '3', 'JK1', 'JGC BASIC', 'JACKET', NULL),
('2', 'C423  JK2', 'C42', '3', 'JK2', 'JGC FASHIO', 'N JACKET', NULL),
('2', 'C423  JK5', 'C42', '3', 'JK5', 'JGC PARKA', 'JACKET', NULL),
('2', 'C423  JK9', 'C42', '3', 'JK9', 'JGC LEATHE', 'R JACKET', NULL),
('2', 'C423  SM1', 'C42', '3', 'SM1', 'JGC SMWR.', '1 Piece', NULL),
('2', 'C423  SM2', 'C42', '3', 'SM2', 'JGC SMWR.', '2 Pieces', NULL),
('2', 'C423  SW3', 'C42', '3', 'SW3', 'JGC BODY S', 'WEATSHIRT', NULL),
('2', 'C423  SW7', 'C42', '3', 'SW7', 'JGC BODY S', 'WEATSHIRT', NULL),
('2', 'C423  TE1', 'C42', '3', 'TE1', 'JGC S/S T-', 'SHIRT', NULL),
('2', 'C423  TE4', 'C42', '3', 'TE4', 'TANK TOP S', 'EPARATE T-', 'SHIRT'),
('2', 'C423  TE9', 'C42', '3', 'TE9', 'KGC BASIC', 'SUSPENDER', NULL),
('2', 'C423  VS2', 'C42', '3', 'VS2', 'JGC S.BREA', 'ST', NULL),
('2', 'C423  VS3', 'C42', '3', 'VS3', 'JGC BASIC', 'VEST', NULL),
('2', 'C424  PY1', 'C42', '4', 'PY1', 'JGC REGULA', 'R PANTY', NULL),
('2', 'C424  PY2', 'C42', '4', 'PY2', 'JGC BIKINI', ' PANTY', NULL),
('2', 'C424  PY9', 'C42', '4', 'PY9', 'JGC Uware', NULL, NULL),
('2', 'C424  TE1', 'C42', '4', 'TE1', 'JGC S/S T-', 'SHIRT', NULL),
('2', 'C424  TE2', 'C42', '4', 'TE2', 'JGC SS POL', 'O T-SHIRT', NULL),
('2', 'C424  TE4', 'C42', '4', 'TE4', 'JGC TANK T', 'OP T-SHIRT', NULL),
('2', 'C424  TE9', 'C42', '4', 'TE9', 'JGC SLEEVL', 'ESS T-SHIR', 'T'),
('2', 'C426  BD1', 'C42', '6', 'BD1', 'SQUARED BA', 'NDANA', NULL),
('2', 'C426  BD2', 'C42', '6', 'BD2', 'SQUARED BA', 'NDANA', NULL),
('2', 'C426  BG1', 'C42', '6', 'BG1', 'JGC BAG', NULL, NULL),
('2', 'C426  BG2', 'C42', '6', 'BG2', 'JB BAG', NULL, NULL),
('2', 'C426  BT1', 'C42', '6', 'BT1', 'JGC BELT', NULL, NULL),
('2', 'C426  BT2', 'C42', '6', 'BT2', 'JGC NO BUC', 'KLE BELT', NULL),
('2', 'C426  BT4', 'C42', '6', 'BT4', 'JG Casual', 'BELT', NULL),
('2', 'C426  BT5', 'C42', '6', 'BT5', 'JG Jeans B', 'ELT', NULL),
('2', 'C426  GV1', 'C42', '6', 'GV1', 'KIDS TRICO', 'T GLOVE', NULL),
('2', 'C426  HA1', 'C42', '6', 'HA1', 'HAIR HOOP', NULL, NULL),
('2', 'C426  HA2', 'C42', '6', 'HA2', 'HAIR CHOUC', 'HOU', NULL),
('2', 'C426  HN1', 'C42', '6', 'HN1', 'Chandler', NULL, NULL),
('2', 'C426  HT1', 'C42', '6', 'HT1', 'JGC HAT', NULL, NULL),
('2', 'C426  HT3', 'C42', '6', 'HT3', 'JGC Sun HA', 'T', NULL),
('2', 'C426  HT5', 'C42', '6', 'HT5', 'JGC Sun HA', 'T', NULL),
('2', 'C426  IC1', 'C42', '6', 'IC1', 'JGC ICE CA', 'P', NULL),
('2', 'C426  OTH', 'C42', '6', 'OTH', 'JGC Others', NULL, NULL),
('2', 'C426  PJ5', 'C42', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('2', 'C426  PJ6', 'C42', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('2', 'C426  PJ7', 'C42', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('2', 'C426  PN1', 'C42', '6', 'PN1', 'JGC PONCHE', 'S', NULL),
('2', 'C426  SF1', 'C42', '6', 'SF1', 'JGC SCARF', NULL, NULL),
('2', 'C426  SO1', 'C42', '6', 'SO1', 'SHOSES', NULL, NULL),
('2', 'C426  WB1', 'C42', '6', 'WB1', 'JGC WRISTB', 'ANDS', NULL),
('2', 'C427  SO1', 'C42', '7', 'SO1', 'JGC SHOES', NULL, NULL),
('2', 'C511  BL0', 'C51', '1', 'BL0', 'BLOUSE', NULL, NULL),
('2', 'C511  DR0', 'C51', '1', 'DR0', 'C511  DR0', NULL, NULL),
('2', 'C511  JK0', 'C51', '1', 'JK0', 'JACKET', NULL, NULL),
('2', 'C511  PT0', 'C51', '1', 'PT0', 'PANT', NULL, NULL),
('2', 'C511  SK0', 'C51', '1', 'SK0', 'SKIRT', NULL, NULL),
('2', 'C511  SR0', 'C51', '1', 'SR0', 'Short', NULL, NULL),
('2', 'C511  ST0', 'C51', '1', 'ST0', 'SALOPETTE', NULL, NULL),
('2', 'C521  BL1', 'C52', '1', 'BL1', 'KGC L/S BT', 'N FRNT BLO', 'USE'),
('2', 'C521  BL2', 'C52', '1', 'BL2', 'KGC S/S BT', 'N FRNT BLO', 'USE'),
('2', 'C521  BL3', 'C52', '1', 'BL3', 'KGC N/S BT', 'N FRNT BLO', 'USE'),
('2', 'C521  BL4', 'C52', '1', 'BL4', 'KGC L/S BL', 'OUSE', NULL),
('2', 'C521  BL5', 'C52', '1', 'BL5', 'KGC S/S BL', 'OUSE', NULL),
('2', 'C521  BL6', 'C52', '1', 'BL6', 'KGC SLEEVE', 'LESS BLOUS', 'E'),
('2', 'C521  BL7', 'C52', '1', 'BL7', 'KGC TANK T', 'OP BLOUSE', NULL),
('2', 'C521  BL9', 'C52', '1', 'BL9', 'KGC JACKET', '/SET BLOUS', 'E'),
('2', 'C521  JK8', 'C52', '1', 'JK8', 'RELATED JA', 'CKET-OVER', 'SHIRT'),
('2', 'C521  PL1', 'C52', '1', 'PL1', 'KGC BSC LT', '. PULLOVER', NULL),
('2', 'C521  PL2', 'C52', '1', 'PL2', 'KGC FASHIO', 'N LT. PULL', 'OVER'),
('2', 'C521  PL3', 'C52', '1', 'PL3', 'KGC REG HV', 'Y. PULLOVE', 'R'),
('2', 'C521  PL4', 'C52', '1', 'PL4', 'KGC FSH.HV', 'Y.PULLOVER', NULL),
('2', 'C521  PL5', 'C52', '1', 'PL5', 'KGC BTN FR', 'NT PULLOVE', 'R'),
('2', 'C521  PL6', 'C52', '1', 'PL6', 'KGC ZIP FR', 'NT PULLOVE', 'R'),
('2', 'C521  PL7', 'C52', '1', 'PL7', 'KGC TWIN S', 'ET LT.PULL', 'OVER'),
('2', 'C521  PL8', 'C52', '1', 'PL8', 'KGC FIT TI', 'GHT PULLOV', 'ER'),
('2', 'C521  SH5', 'C52', '1', 'SH5', 'KGC OVERSH', 'IRT', NULL),
('2', 'C521  SW1', 'C52', '1', 'SW1', 'KGC POLO S', 'WEATSHIRT', NULL),
('2', 'C521  SW2', 'C52', '1', 'SW2', 'KGC REG. S', 'WEATSHIRT', NULL),
('2', 'C521  SW3', 'C52', '1', 'SW3', 'KGC FSH SW', 'EATSHIRT', NULL),
('2', 'C521  SW4', 'C52', '1', 'SW4', 'KGC BTN FR', 'NT SWEATSH', 'IRT'),
('2', 'C521  SW5', 'C52', '1', 'SW5', 'KGC ZIP FR', 'NT SWEATSH', 'IRT'),
('2', 'C521  SW6', 'C52', '1', 'SW6', 'KGC TWIN S', 'ET SWEATSH', 'IRT'),
('2', 'C521  SW7', 'C52', '1', 'SW7', 'KGC FIT TI', 'GHT SWEATS', 'HIRT'),
('2', 'C521  SW9', 'C52', '1', 'SW9', 'KGC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('2', 'C521  TE1', 'C52', '1', 'TE1', 'KGC S/S T-', 'SHIRT', NULL),
('2', 'C521  TE2', 'C52', '1', 'TE2', 'KGC S/S PO', 'LO T-SHIRT', NULL),
('2', 'C521  TE3', 'C52', '1', 'TE3', 'KGC S/S FI', 'TTED T-SHI', 'RT'),
('2', 'C521  TE4', 'C52', '1', 'TE4', 'KGC TANK T', 'OP T-SHIRT', NULL),
('2', 'C521  TE5', 'C52', '1', 'TE5', 'KGC L/S T-', 'SHIRT', NULL),
('2', 'C521  TE6', 'C52', '1', 'TE6', 'KGC L/S PO', 'LO T-SHIRT', NULL),
('2', 'C521  TE7', 'C52', '1', 'TE7', 'KGC L/S FI', 'TTED T-SHI', 'RT'),
('2', 'C521  TE8', 'C52', '1', 'TE8', 'KGC TWIN S', 'ET T-SHIRT', NULL),
('2', 'C521  TE9', 'C52', '1', 'TE9', 'KGC SLEEVL', 'ESS T-SHIR', 'T'),
('2', 'C521  VS3', 'C52', '1', 'VS3', 'KGC REGULA', 'R CASUAL V', 'EST'),
('2', 'C521  VS5', 'C52', '1', 'VS5', 'KGC TRICOT', 'E VEST', NULL),
('2', 'C522  DR3', 'C52', '2', 'DR3', 'KGC 2 PICE', 'S DRESS', NULL),
('2', 'C522  DR7', 'C52', '2', 'DR7', 'KGC NS REG', ' DRESS', NULL),
('2', 'C522  DR8', 'C52', '2', 'DR8', 'KGC NS LNG', ' DRESS', NULL),
('2', 'C522  PT1', 'C52', '2', 'PT1', 'KGC REGULA', 'R CHINO PA', 'NT'),
('2', 'C522  PT2', 'C52', '2', 'PT2', 'KGC PULLON', ' PANT', NULL),
('2', 'C522  PT3', 'C52', '2', 'PT3', 'KGC FASHIO', 'N PANT', NULL),
('2', 'C522  PT4', 'C52', '2', 'PT4', 'KGC 5 POCK', 'ET PANT', NULL),
('2', 'C522  PT9', 'C52', '2', 'PT9', 'KGC TRAINI', 'NG PANT', NULL),
('2', 'C522  SK1', 'C52', '2', 'SK1', 'KGC REGULA', 'R SKIRT', NULL),
('2', 'C522  SK2', 'C52', '2', 'SK2', 'KGC LONG S', 'KIRT', NULL),
('2', 'C522  SK3', 'C52', '2', 'SK3', 'KGC SHORT', 'SKIRT', NULL),
('2', 'C522  SK4', 'C52', '2', 'SK4', 'KGC Btm', NULL, NULL),
('2', 'C522  SK6', 'C52', '2', 'SK6', 'KGC REGULA', 'R SKORT', NULL),
('2', 'C522  SK7', 'C52', '2', 'SK7', 'KGC LONG S', 'KORT', NULL),
('2', 'C522  SK8', 'C52', '2', 'SK8', 'KGC SHORT', 'SKORT', NULL),
('2', 'C522  SR1', 'C52', '2', 'SR1', 'KGC BASIC', 'SHORT', NULL),
('2', 'C522  SR2', 'C52', '2', 'SR2', 'KGC PULLON', ' SHORT', NULL),
('2', 'C522  SR3', 'C52', '2', 'SR3', 'KGC FASHIO', 'N SHORT', NULL),
('2', 'C522  SR4', 'C52', '2', 'SR4', 'KGC PERMUD', 'A SHORT', NULL),
('2', 'C522  SR5', 'C52', '2', 'SR5', 'KGC 5 POCK', 'ET SHORT', NULL),
('2', 'C522  SR9', 'C52', '2', 'SR9', 'KGC TRAINI', 'NG SHORT', NULL),
('2', 'C522  ST1', 'C52', '2', 'ST1', 'KGC SALOPP', 'ETTE SHORT', NULL),
('2', 'C522  ST2', 'C52', '2', 'ST2', 'KGC SALOPP', 'ETTE PANT', NULL),
('2', 'C522  ST3', 'C52', '2', 'ST3', 'KGC SALOPP', 'ETTE DRESS', NULL),
('2', 'C522  TE3', 'C52', '2', 'TE3', 'KGC TANK T', 'OP T-SHIRT', NULL),
('2', 'C523  CM1', 'C52', '3', 'CM1', 'KGC CACHE', 'MAILLOT', NULL),
('2', 'C523  CT1', 'C52', '3', 'CT1', 'KGC S.BREA', 'ST REG COA', 'T'),
('2', 'C523  DR1', 'C52', '3', 'DR1', 'KGC L/S RE', 'G DRESS', NULL),
('2', 'C523  DR2', 'C52', '3', 'DR2', 'KGC L/S LO', 'NG DRESS', NULL),
('2', 'C523  DR3', 'C52', '3', 'DR3', 'KGC L/S SH', 'ORT DRESS', NULL),
('2', 'C523  DR4', 'C52', '3', 'DR4', 'KGC S/S RE', 'G DRESS', NULL),
('2', 'C523  DR5', 'C52', '3', 'DR5', 'KGC S/S LO', 'NG DRESS', NULL),
('2', 'C523  DR6', 'C52', '3', 'DR6', 'KGC S/S SH', 'ORT DRESS', NULL),
('2', 'C523  DR7', 'C52', '3', 'DR7', 'KGC N/S RE', 'G DRESS', NULL),
('2', 'C523  DR8', 'C52', '3', 'DR8', 'KGC N/S LO', 'NG DRESS', NULL),
('2', 'C523  DR9', 'C52', '3', 'DR9', 'KGC N/S SH', 'ORT DRESS', NULL),
('2', 'C523  HT1', 'C52', '3', 'HT1', 'KGC HAT', NULL, NULL),
('2', 'C523  JK1', 'C52', '3', 'JK1', 'KGC BASIC', 'JACKET', NULL),
('2', 'C523  JK2', 'C52', '3', 'JK2', 'KGC FASHIO', 'N JACKET', NULL),
('2', 'C523  JK5', 'C52', '3', 'JK5', 'KGC PARKA', 'JACKET', NULL),
('2', 'C523  JK9', 'C52', '3', 'JK9', 'KGC LEATHE', 'R JACKET', NULL),
('2', 'C523  PT2', 'C52', '3', 'PT2', 'KGC FASHIO', 'N PANT', NULL),
('2', 'C523  SM1', 'C52', '3', 'SM1', 'KGC SMWR.', '1 Piece', NULL),
('2', 'C523  SM2', 'C52', '3', 'SM2', 'KGC SMWR.', '2 Pieces', NULL),
('2', 'C523  ST1', 'C52', '3', 'ST1', 'KGC SALOPE', 'TTE SHORT', NULL),
('2', 'C523  SW3', 'C52', '3', 'SW3', 'KGC BODY S', 'WEATSHIRT', NULL),
('2', 'C523  SW7', 'C52', '3', 'SW7', 'KGC BODY S', 'WEATSHIRT', NULL),
('2', 'C523  TE1', 'C52', '3', 'TE1', 'KGC S/S T-', 'SHIRT', NULL),
('2', 'C523  TE4', 'C52', '3', 'TE4', 'TANK TOP S', 'EPARATE T-', 'SHIRT'),
('2', 'C523  TE9', 'C52', '3', 'TE9', 'KGC BASIC', 'SUSPENDER', NULL),
('2', 'C523  VS2', 'C52', '3', 'VS2', 'KGC S.BREA', 'ST', NULL),
('2', 'C523  VS3', 'C52', '3', 'VS3', 'KGC BASIC', 'VEST', NULL),
('2', 'C523  VS4', 'C52', '3', 'VS4', 'KGC  SAFAR', 'I VEST', NULL),
('2', 'C524  PY1', 'C52', '4', 'PY1', 'KGC REGULA', 'R PANTY', NULL),
('2', 'C524  PY2', 'C52', '4', 'PY2', 'KGC BIKINI', ' PANTY', NULL),
('2', 'C524  PY9', 'C52', '4', 'PY9', 'KGC Uware', NULL, NULL),
('2', 'C524  TE1', 'C52', '4', 'TE1', 'KGC S/S T-', 'SHIRT', NULL),
('2', 'C524  TE2', 'C52', '4', 'TE2', 'KGC SS POL', 'O T-SHIRT', NULL),
('2', 'C524  TE4', 'C52', '4', 'TE4', 'KGC TANK T', 'OP T-SHIRT', NULL),
('2', 'C524  TE9', 'C52', '4', 'TE9', 'KGC SLEEVL', 'ESS T-SHIR', 'T'),
('2', 'C526  BD1', 'C52', '6', 'BD1', 'SQUARED BA', 'NDANA', NULL),
('2', 'C526  BD2', 'C52', '6', 'BD2', 'SQUARED BA', 'NDANA', NULL),
('2', 'C526  BG1', 'C52', '6', 'BG1', 'KGC BAG', NULL, NULL),
('2', 'C526  BG2', 'C52', '6', 'BG2', 'JB BAG', NULL, NULL),
('2', 'C526  BT1', 'C52', '6', 'BT1', 'KGC BELT', NULL, NULL),
('2', 'C526  BT2', 'C52', '6', 'BT2', 'KGC NO BUC', 'KLE BELT', NULL),
('2', 'C526  BT4', 'C52', '6', 'BT4', 'KG Casual', 'BELT', NULL),
('2', 'C526  BT5', 'C52', '6', 'BT5', 'KG Jeans B', 'ELT', NULL),
('2', 'C526  GV1', 'C52', '6', 'GV1', 'KIDS TRICO', 'T GLOVE', NULL),
('2', 'C526  HA1', 'C52', '6', 'HA1', 'HAIR HOOP', NULL, NULL),
('2', 'C526  HA2', 'C52', '6', 'HA2', 'HAIR CHOUC', 'HOU', NULL),
('2', 'C526  HN1', 'C52', '6', 'HN1', 'Chandler', NULL, NULL),
('2', 'C526  HT1', 'C52', '6', 'HT1', 'KGC HAT', NULL, NULL),
('2', 'C526  HT3', 'C52', '6', 'HT3', 'KGC HAT', NULL, NULL),
('2', 'C526  HT5', 'C52', '6', 'HT5', 'KGC Sun HA', 'T', NULL),
('2', 'C526  IC1', 'C52', '6', 'IC1', 'KGC ICE CA', 'P', NULL),
('2', 'C526  MNQ', 'C52', '6', 'MNQ', 'GIRLS MANN', 'EQUIN', NULL),
('2', 'C526  NL1', 'C52', '6', 'NL1', 'NL1', NULL, NULL),
('2', 'C526  OTH', 'C52', '6', 'OTH', 'KGC Others', NULL, NULL),
('2', 'C526  PJ5', 'C52', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('2', 'C526  PJ6', 'C52', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('2', 'C526  PJ7', 'C52', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('2', 'C526  PN1', 'C52', '6', 'PN1', 'KGC PONCHE', 'S', NULL),
('2', 'C526  SC1', 'C52', '6', 'SC1', 'REGULAR LE', 'NGTH', NULL),
('2', 'C526  SC2', 'C52', '6', 'SC2', 'MEDIUIM LE', 'NGTH', NULL),
('2', 'C526  SC5', 'C52', '6', 'SC5', 'KGC HOME S', 'OCKS', NULL),
('2', 'C526  SC6', 'C52', '6', 'SC6', 'WGC SOCKS', NULL, NULL),
('2', 'C526  SF1', 'C52', '6', 'SF1', 'KGC SCARF', NULL, NULL),
('2', 'C526  SO1', 'C52', '6', 'SO1', 'SHOSES', NULL, NULL),
('2', 'C526  WT1', 'C52', '6', 'WT1', 'WT1', NULL, NULL),
('2', 'C527  SO1', 'C52', '7', 'SO1', 'KGC SHOES', NULL, NULL),
('2', 'C626  SC6', 'C62', '6', 'SC6', 'WGC SOCKS', NULL, NULL),
('2', 'C626  SC7', 'C62', '6', 'SC7', 'SOCKS', NULL, NULL),
('2', 'C711  BL0', 'C71', '1', 'BL0', 'BLOUSE', NULL, NULL),
('2', 'C711  PT0', 'C71', '1', 'PT0', 'C711  PT0', NULL, NULL),
('2', 'C711  SF0', 'C71', '1', 'SF0', 'SCARF', NULL, NULL),
('2', 'C711  SH0', 'C71', '1', 'SH0', 'SHIRT', NULL, NULL),
('2', 'C711  SK0', 'C71', '1', 'SK0', 'SKIRT', NULL, NULL),
('2', 'C821  JK2', 'C82', '1', 'JK2', 'JACKET', NULL, NULL),
('2', 'C821  PL5', 'C82', '1', 'PL5', 'PULLOVER', NULL, NULL),
('2', 'C821  PL6', 'C82', '1', 'PL6', 'BBC ZIP FR', 'NT PULLOVE', 'R'),
('2', 'C821  SH1', 'C82', '1', 'SH1', 'SHIRT', NULL, NULL),
('2', 'C821  SH2', 'C82', '1', 'SH2', 'BBC L/S SH', 'IRT', NULL),
('2', 'C821  SH3', 'C82', '1', 'SH3', 'BBC S/S SL', 'D SAFARI S', 'HIRT'),
('2', 'C821  SH4', 'C82', '1', 'SH4', 'BBC S/S SH', 'IRT', NULL),
('2', 'C821  SW3', 'C82', '1', 'SW3', 'BBC FSH SW', 'EATSHIRT', NULL),
('2', 'C821  TE1', 'C82', '1', 'TE1', 'T-SHIRT', NULL, NULL),
('2', 'C822  PT3', 'C82', '2', 'PT3', 'BBC (FASHI', 'ON PANT)', NULL),
('2', 'C822  SR3', 'C82', '2', 'SR3', 'BBC (FASHI', 'ON SHORT)', NULL),
('2', 'C822  ST1', 'C82', '2', 'ST1', 'BBC (SALLO', 'PPETTE SHO', 'RT)'),
('2', 'C822  ST2', 'C82', '2', 'ST2', 'SALLOPPETT', 'E', NULL),
('2', 'C823  JK2', 'C82', '3', 'JK2', 'BBC FSH JA', 'CKET', NULL),
('2', 'C826  BK1', 'C82', '6', 'BK1', 'BLANKET', NULL, NULL),
('2', 'C921  BL1', 'C92', '1', 'BL1', 'BLOUSE', NULL, NULL),
('2', 'C921  BL3', 'C92', '1', 'BL3', 'BGC (N/S B', 'TN FRNT BL', 'OUSE)'),
('2', 'C921  BL5', 'C92', '1', 'BL5', 'BGC (S/S B', 'LOUSE)', NULL),
('2', 'C921  BL6', 'C92', '1', 'BL6', 'BGC ( SLEE', 'VELESS BLO', 'USE )'),
('2', 'C921  PL5', 'C92', '1', 'PL5', 'PULLOVER', NULL, NULL),
('2', 'C921  PL6', 'C92', '1', 'PL6', 'BBC ZIP FR', 'NT PULLOVE', 'R'),
('2', 'C921  SW3', 'C92', '1', 'SW3', 'BGC FSH SW', 'EATSHIRT', NULL),
('2', 'C921  TE1', 'C92', '1', 'TE1', 'T-SHIRT', NULL, NULL),
('2', 'C922  PT3', 'C92', '2', 'PT3', 'BGC (FASHI', 'ON PANT)', NULL),
('2', 'C922  SR3', 'C92', '2', 'SR3', 'BGC (FASHI', 'ON SHORT)', NULL),
('2', 'C922  ST1', 'C92', '2', 'ST1', 'BGC (SALOP', 'ETTE SHORT', ')'),
('2', 'C922  ST3', 'C92', '2', 'ST3', 'SALOPETTE', NULL, NULL),
('2', 'C923  DR1', 'C92', '3', 'DR1', 'DRESS', NULL, NULL),
('2', 'C923  DR6', 'C92', '3', 'DR6', 'BGC S/S SH', 'ORT DRESS', NULL),
('2', 'C923  DR7', 'C92', '3', 'DR7', 'BGC (N/S R', 'EG DRESS)', NULL),
('2', 'C923  JK2', 'C92', '3', 'JK2', 'BGC FSH JA', 'CKET', NULL),
('2', 'C926  BK1', 'C92', '6', 'BK1', 'BLANKET', NULL, NULL),
('2', 'CDSP  TLS', 'CDS', 'P', 'TLS', 'STORES DIS', 'PLAY TOOLS', NULL),
('2', 'CDWN  CDW', 'CDW', 'N', 'CDW', 'DOWN PAYME', 'NT', NULL),
('2', 'CFAB  MTM', 'CFA', 'B', 'MTM', 'FABRIC MAD', 'E TO MEASU', 'RE'),
('2', 'CGFT  BOX', 'CGF', 'T', 'BOX', 'CGFT BOX =', ' Gift Box', NULL),
('2', 'CGFT  CRD', 'CGF', 'T', 'CRD', 'GIFT CARD', NULL, NULL),
('2', 'CMIX  BZ3', 'CMI', 'X', 'BZ3', 'MIX', NULL, NULL),
('2', 'CMIX  SU3', 'CMI', 'X', 'SU3', 'MIX', NULL, NULL),
('2', 'CMIX  SU4', 'CMI', 'X', 'SU4', 'MIX', NULL, NULL),
('2', 'CMIX  TR2', 'CMI', 'X', 'TR2', 'MIX', NULL, NULL),
('2', 'CMIX  TR3', 'CMI', 'X', 'TR3', 'MIX', NULL, NULL),
('2', 'CMTM  CT1', 'CMT', 'M', 'CT1', 'COAT', NULL, NULL),
('2', 'CMTM  SU3', 'CMT', 'M', 'SU3', 'MADE TO ME', 'ASURE', NULL),
('2', 'CMTM  SU4', 'CMT', 'M', 'SU4', 'MADE TO ME', 'ASURE', NULL),
('2', 'CMTM  SU8', 'CMT', 'M', 'SU8', 'MTM ceremo', 'nial suit', NULL),
('2', 'CMTM  TR3', 'CMT', 'M', 'TR3', 'MADE TO ME', 'ASURE', NULL),
('2', 'CMTM  VS1', 'CMT', 'M', 'VS1', 'MF D.BREAS', 'T VEST', NULL),
('2', 'MTMM  BZ3', 'MTM', 'M', 'BZ3', 'M TO MSURE', ' SNGL BRST', ' BLZ'),
('2', 'MTMM  JK2', 'MTM', 'M', 'JK2', 'MADE TO ME', 'ASURE JACK', 'ET'),
('2', 'MTMM  TR2', 'MTM', 'M', 'TR2', 'M TO MSURE', ' 1PLT TROU', 'SER'),
('2', 'PROMOTI', 'PRO', 'MOT', 'I', 'PROMOTION', NULL, NULL),
('2', 'Q111  BZ1', 'Q11', '1', 'BZ1', 'MF 2 BTN D', 'OUBLE BREA', 'ST'),
('2', 'Q111  BZ2', 'Q11', '1', 'BZ2', 'MF 3 B S.R', 'EAST BLAZE', 'R'),
('2', 'Q111  BZ3', 'Q11', '1', 'BZ3', 'MF 2 B S.R', 'EAST BLAZE', 'R'),
('2', 'Q111  BZ4', 'Q11', '1', 'BZ4', 'MF 4 B S.R', 'EAST BLAZE', 'R'),
('2', 'Q111  SH1', 'Q11', '1', 'SH1', 'L/S SOLID', 'SHIRT', NULL),
('2', 'Q111  SH2', 'Q11', '1', 'SH2', 'L/S  PRINT', ' SHIRT', NULL),
('2', 'Q111  SH3', 'Q11', '1', 'SH3', 'S/S SOLID', 'SHIRT', NULL),
('2', 'Q111  SH4', 'Q11', '1', 'SH4', 'S/S  PRINT', ' SHIRT', NULL),
('2', 'Q111  SH5', 'Q11', '1', 'SH5', 'L/S SOLID', 'SHIRT CUFF', 'LINKS'),
('2', 'Q111  SH6', 'Q11', '1', 'SH6', 'L/S PRINT', 'SHIRT CUFF', 'LINKS'),
('2', 'Q111  SH8', 'Q11', '1', 'SH8', 'L/S CEREMO', 'NIAL SHIRT', ' CUFFLINKS'),
('2', 'Q111  SH9', 'Q11', '1', 'SH9', 'HIGH QUALI', 'TY SHIRT', NULL),
('2', 'Q111  SU1', 'Q11', '1', 'SU1', 'MF 2 BTN D', 'OUBLE BREA', 'ST F.FRONT'),
('2', 'Q111  SU2', 'Q11', '1', 'SU2', 'MF 3 B S .', 'BREAST -1P', 'LEAT'),
('2', 'Q111  SU3', 'Q11', '1', 'SU3', 'MF 2 B S .', 'BREAST -1P', 'LEAT'),
('2', 'Q111  SU4', 'Q11', '1', 'SU4', 'MF 2 B S .', 'BREAST -F.', 'FRONT'),
('2', 'Q111  SU8', 'Q11', '1', 'SU8', 'SUIT', NULL, NULL),
('2', 'Q112  TR2', 'Q11', '2', 'TR2', 'MF 1PLEAT', 'TROUSER', NULL),
('2', 'Q112  TR3', 'Q11', '2', 'TR3', 'TROUSER FL', 'AT FRONT', NULL),
('2', 'Q113  CT2', 'Q11', '3', 'CT2', 'MF S.BREAS', 'T LNG COAT', NULL),
('2', 'Q116  BW1', 'Q11', '6', 'BW1', 'MC BOW TIE', NULL, NULL),
('2', 'Q116  CB1', 'Q11', '6', 'CB1', 'MC CUMMER', 'BAND', NULL),
('2', 'Q116  CL1', 'Q11', '6', 'CL1', 'METAL CUFF', 'LINK', NULL),
('2', 'Q116  SO2', 'Q11', '6', 'SO2', 'MC CLASSIC', ' LEATHER S', 'HOES'),
('2', 'Q116  SO8', 'Q11', '6', 'SO8', 'MC CEREMON', 'IAL LEATHE', 'R SHOES'),
('2', 'Q116  TY1', 'Q11', '6', 'TY1', 'MC TIE', NULL, NULL),
('2', 'Q121  PL1', 'Q12', '1', 'PL1', 'MC BASIC L', 'T.PULLOVER', NULL),
('2', 'Q121  VS3', 'Q12', '1', 'VS3', 'MC BASIC V', 'EST', NULL),
('2', 'Q123  JK1', 'Q12', '3', 'JK1', 'MC BASIC J', 'ACKET', NULL),
('2', 'Q123  JK9', 'Q12', '3', 'JK9', 'MC LEATHER', ' JACKET', NULL),
('2', 'Q126  GV1', 'Q12', '6', 'GV1', 'MC LEATHER', ' GLOVE', NULL),
('2', 'Q126  SF1', 'Q12', '6', 'SF1', 'MC SCARF', NULL, NULL),
('2', 'QMIX  SU3', 'QMI', 'X', 'SU3', 'QMIXSU3', NULL, NULL),
('2', 'QMIX  SU4', 'QMI', 'X', 'SU4', 'QMIXSU4', NULL, NULL),
('2', 'T111  BZ5', 'T11', '1', 'BZ5', 'MIX & MATC', 'H CLASSIC', 'BLAZER'),
('2', 'T111  BZ8', 'T11', '1', 'BZ8', 'FASHION BL', 'AZER M F', NULL),
('2', 'T111  SH0', 'T11', '1', 'SH0', 'SHIRT', NULL, NULL),
('2', 'T111  SH1', 'T11', '1', 'SH1', 'L/S SOLID', 'SHIRT', NULL),
('2', 'T111  SH2', 'T11', '1', 'SH2', 'L/S PRINT', 'SHIRT', NULL),
('2', 'T111  SH3', 'T11', '1', 'SH3', 'S/S SOLID', 'SHIRT', NULL),
('2', 'T111  SH4', 'T11', '1', 'SH4', 'S/S PRINT', 'SHIRT', NULL),
('2', 'T111  SH5', 'T11', '1', 'SH5', 'L/S SOLID', 'SHIRT CUFF', NULL),
('2', 'T111  SH6', 'T11', '1', 'SH6', 'L/S PRINT', 'SHIRT CUFF', NULL),
('2', 'T111  SH8', 'T11', '1', 'SH8', 'L/S CEREMO', 'NIAL SHIRT', ' CUFFLINKS'),
('2', 'T111  SU4', 'T11', '1', 'SU4', '2BTN S.BRE', 'AST FLAT F', 'RONT'),
('2', 'T111  SU8', 'T11', '1', 'SU8', 'SUIT', NULL, NULL),
('2', 'T111  VS0', 'T11', '1', 'VS0', 'VEST', NULL, NULL),
('2', 'T112  TR3', 'T11', '2', 'TR3', 'FLAT FRONT', ' TROUSER', NULL),
('2', 'T112  TR5', 'T11', '2', 'TR5', 'MIX & MATC', 'H CLASSIC', 'TROUSER'),
('2', 'T113  CT1', 'T11', '3', 'CT1', 'M/F S.BREA', 'ST REG COA', 'T'),
('2', 'T116  BT1', 'T11', '6', 'BT1', 'MC CLASSIC', ' BELT', NULL),
('2', 'T116  TY1', 'T11', '6', 'TY1', 'MC TIE', NULL, NULL),
('2', 'T121  PL4', 'T12', '1', 'PL4', 'MC FSH. HV', 'Y. PULLOVE', 'R'),
('2', 'T121  TE1', 'T12', '1', 'TE1', 'MC S/S  T.', 'SHIRT', NULL),
('2', 'T121  TE5', 'T12', '1', 'TE5', 'MC L/S T.S', 'HIRT', NULL),
('2', 'T121  TE7', 'T12', '1', 'TE7', 'MC L/S FIT', 'TED T.SHIR', 'T'),
('2', 'T122  PT4', 'T12', '2', 'PT4', 'MC 5 PANT', 'POCKET', NULL),
('2', 'T122  PT5', 'T12', '2', 'PT5', 'MC REGULAR', ' SEMI CLAS', 'SIC'),
('2', 'T122  PT6', 'T12', '2', 'PT6', 'MC FASHION', ' SEMI CLAS', 'SIC'),
('2', 'T123  JK5', 'T12', '3', 'JK5', 'MC PARKA J', 'ACKET', NULL),
('2', 'T123  JK9', 'T12', '3', 'JK9', 'MC LEATHER', ' JACKET', NULL),
('2', 'T126  BT1', 'T12', '6', 'BT1', 'MC BELT', NULL, NULL),
('2', 'T126  SF1', 'T12', '6', 'SF1', 'MC SCARF', NULL, NULL),
('1', 'AAP3  APX', 'AAP', '3', 'APX', 'APLEX', 'ALL', ''),
('1', 'ABD3  EMB', 'ABD', '3', 'EMB', 'A BADGE', 'ALL', 'EMBROIDERY'),
('1', 'ABD3  PLS', 'ABD', '3', 'PLS', 'BADGE', 'ALL', 'PLASTIC'),
('1', 'ABD3  PRT', 'ABD', '3', 'PRT', 'ABADGE', 'ALL', 'PRINT'),
('1', 'ABD3  WVN', 'ABD', '3', 'WVN', 'BADGE', 'ALL', 'WOVEN'),
('1', 'ABG1  PLS', 'ABG', '1', 'PLS', 'SHIRT BAG', 'TOP', 'PLASTIC'),
('1', 'ABG2  PLS', 'ABG', '2', 'PLS', 'PLAYBAG', 'BOTTOM', 'PLASTIC'),
('1', 'ABG3  CHM', 'ABG', '3', 'CHM', 'ABG', 'ALL', 'CHAMOIS'),
('1', 'ABG3  PLS', 'ABG', '3', 'PLS', 'PLASTICBAG', 'ALL', 'PLASTIC'),
('1', 'ABK3  MTL', 'ABK', '3', 'MTL', 'BUCKLE', 'ALL', 'METAL'),
('1', 'ABL2  ELS', 'ABL', '2', 'ELS', 'BELT', 'BOTTOM', 'ELASTIC'),
('1', 'ABL2  LTH', 'ABL', '2', 'LTH', 'BELT', 'BOTTOM', 'LEATHER'),
('1', 'ABL2  POP', 'ABL', '2', 'POP', 'BELT', 'BOTTOM', 'POPLIN'),
('1', 'ABL2  WVN', 'ABL', '2', 'WVN', 'BELT', 'BOTTOM', 'WOVEN'),
('1', 'ABT1  MTL', 'ABT', '1', 'MTL', 'BUTTON', 'TOP', 'METAL'),
('1', 'ABT1  PLS', 'ABT', '1', 'PLS', 'BUTTON', 'TOP', 'PLASTIC'),
('1', 'ABT1  SHL', 'ABT', '1', 'SHL', 'BUTTOM', '1', 'SHELL'),
('1', 'ABT1  WOD', 'ABT', '1', 'WOD', 'BUTTON', 'TOP', 'WOOD'),
('1', 'ABT2  MTL', 'ABT', '2', 'MTL', 'BUTTON', 'BOTTOM', 'METAL'),
('1', 'ABT2  PLS', 'ABT', '2', 'PLS', 'BUTTON', 'BOTTOM', 'PLASTIC'),
('1', 'ABT2  WOD', 'ABT', '2', 'WOD', 'BUTTON', 'BOTTOM', 'WOOD');
INSERT INTO `departments` (`countryid`, `fulldept`, `deptid`, `classid`, `subclassid`, `deptname`, `classname`, `subclassname`) VALUES
('1', 'ABT3  MTL', 'ABT', '3', 'MTL', 'BUTTON ALL', ' METAL', ''),
('1', 'ABW3  STN', 'ABW', '3', 'STN', 'BOW', 'ALL', 'STAN'),
('1', 'ABX3  CRT', 'ABX', '3', 'CRT', 'BOX', 'ALL', 'CARTON'),
('1', 'ACD3  PLY', 'ACD', '3', 'PLY', 'CORDON', 'ALL', 'POLYESTER'),
('1', 'ACH1  CRS', 'ACH', '1', 'CRS', 'HEART', 'TOP', 'CRYSTAL'),
('1', 'ACR2  PRT', 'ACR', '2', 'PRT', 'ACAR LABLE', 'BOTTOM', 'PRINT'),
('1', 'ACR3  PRT', 'ACR', '3', 'PRT', 'CAR LABLE', 'ALL', 'PRINT'),
('1', 'ACR3  WVN', 'ACR', '3', 'WVN', 'CARLABLE', 'ALL', 'WOVEN'),
('1', 'ACS1  MIX', 'ACS', '1', 'MIX', 'ACCESSORIE', 'TOP', 'MIX'),
('1', 'ACV1  PLY', 'ACV', '1', 'PLY', 'COVER SUIT', 'TPS', 'POLYESTER'),
('1', 'ACV3  PLY', 'ACV', '3', 'PLY', 'COVER SUIT', 'ALL', 'POLYESTER'),
('1', 'AEL1  WVN', 'AEL', '1', 'WVN', 'ELASTIC', 'ALL', 'TWST'),
('1', 'AEL2  WVN', 'AEL', '2', 'WVN', 'ELASTIC', 'BOTTOM', 'HOLE'),
('1', 'AEL3  WVN', 'AEL', '3', 'WVN', 'ELASTIC', 'ALL', 'WIDE'),
('1', 'AET3  CTN', 'AET', '3', 'CTN', 'EMBROIDERY', 'ALL', 'COTTON100%'),
('1', 'AEY3  MTL', 'AEY', '3', 'MTL', 'EYELETS', 'ALL', 'METAL'),
('1', 'AFR1  IND', 'AFR', '1', 'IND', 'FUR', 'TOP', 'INDUSTRIAL'),
('1', 'AFU2  WVN', 'AFU', '2', 'WVN', 'SWFFIN', 'BOOTTOM', 'WOVEN'),
('1', 'AFU3  UWV', 'AFU', '3', 'UWV', 'FUSING', 'ALL', 'UNWOVEN'),
('1', 'AFU3  WVN', 'AFU', '3', 'WVN', 'SWFFIN', 'ALL', 'SWFFIN ALL'),
('1', 'AHN1  PLS', 'AHN', '1', 'PLS', 'HANGER', 'TOB', 'PLASTIC'),
('1', 'AHN3  PLS', 'AHN', '3', 'PLS', 'HANGER', 'ALL', 'PLASTIC'),
('1', 'AHT1  HTG', 'AHT', '1', 'HTG', 'HANG TAG', 'TOB', 'HTG'),
('1', 'AHT2  HTG', 'AHT', '2', 'HTG', 'HANG TAG', 'BUTTOM', 'HTG'),
('1', 'AHT3  HTG', 'AHT', '3', 'HTG', 'HANG TAG', 'ALL', ''),
('1', 'AJK1  LTH', 'AJK', '1', 'LTH', 'JACKRONA', 'TOP', 'LEATHER'),
('1', 'AJK2  CRT', 'AJK', '2', 'CRT', 'JACKRONA', 'BOTTOM', 'CARTONE'),
('1', 'AJK2  LTH', 'AJK', '2', 'LTH', 'JACKRONA', 'BOTTOM', 'LEATHER'),
('1', 'ALT3  NTR', 'ALT', '3', 'NTR', 'LEATHER', 'ALL', 'NATUREL'),
('1', 'AMC1  IND', 'AMC', '1', 'IND', 'MAICROFIBE', 'TOP', 'INDUSTRIAL'),
('1', 'AMK1  MTL', 'AMK', '1', 'MTL', 'MTEL LINK', 'TOP', 'MTEL'),
('1', 'AML3  PRT', 'AML', '3', 'PRT', 'MAIN LABLE', 'ALL', 'PRINT'),
('1', 'AML3  WVN', 'AML', '3', 'WVN', 'MAIN LABLE', 'ALL', 'WOVEN'),
('1', 'ANR3  MTL', 'ANR', '3', 'MTL', 'NEW RIVET', 'ALL', 'METAL'),
('1', 'APC2  LTH', 'APC', '2', 'LTH', 'PATCH', 'BOTTOM', 'LEATHER'),
('1', 'APT2  WVN', 'APT', '2', 'WVN', 'PAISTAPE', 'BOTTOM', 'WOVEN'),
('1', 'APT3  WVN', 'APT', '3', 'WVN', 'PAISTAPE', 'ALL', 'WOVEN'),
('1', 'ARC1  RBR', 'ARC', '1', 'RBR', 'RUBBERCUFF', 'TOP', 'RUBBER'),
('1', 'ARV2  MTL', 'ARV', '2', 'MTL', 'RIVET', 'BOTTOM', 'METAL'),
('1', 'ASH3  IND', 'ASH', '3', 'IND', 'CHAMOIS', 'ALL', 'INDUSTRIAL'),
('1', 'ASL3  MTL', 'ASL', '3', 'MTL', 'SEAL', 'ALL', 'METAL'),
('1', 'ASL3  PLS', 'ASL', '3', 'PLS', 'SEAL', 'ALL', 'PLASTIC'),
('1', 'ASN2  MTL', 'ASN', '2', 'MTL', 'SNAP', 'BUTTOM', 'METAL'),
('1', 'ASN3  MTL', 'ASN', '3', 'MTL', 'SANP', '', ''),
('1', 'ASZ1  TRN', 'ASZ', '1', 'TRN', 'SIZ', 'TOP', 'TRANSFER'),
('1', 'ASZ1  WVN', 'ASZ', '1', 'WVN', 'SIZ LABLE', 'TOP', 'WOVEN'),
('1', 'ASZ2  WVN', 'ASZ', '2', 'WVN', 'SIZ LABLE', 'BOTTOM', 'WOVEN'),
('1', 'ASZ3  PRT', 'ASZ', '3', 'PRT', 'SIZ LABLE', 'ALL', 'PRINT'),
('1', 'ASZ3  WVN', 'ASZ', '3', 'WVN', 'SIZ LABLE', 'ALL', 'WOVEN'),
('1', 'ATG3  MTL', 'ATG', '3', 'MTL', 'TAG', 'ALL', 'METAL'),
('1', 'ATG3  PLS', 'ATG', '3', 'PLS', 'TAG', 'ALL', 'PLASTIC'),
('1', 'ATH3  SPN', 'ATH', '3', 'SPN', 'THREAD', 'ALL', ''),
('1', 'ATI1  MTL', 'ATI', '1', 'MTL', 'TIE PIN', 'TOP', 'METAL'),
('1', 'ATL1  STN', 'ATL', '1', 'STN', 'TIE LINING', 'TOP', 'STAN'),
('1', 'ATO1  BON', 'ATO', '1', 'BON', 'TOGGLE', 'TOP', 'BONE'),
('1', 'ATP1  CTN', 'ATP', '1', 'CTN', 'TAP', 'TOP', 'COTTON100%'),
('1', 'ATP1  PLY', 'ATP', '1', 'PLY', 'TAPE', 'TOP', 'POLYESTER'),
('1', 'ATP2  PLY', 'ATP', '2', 'PLY', 'TAPE', 'BOTTOM', 'POLYESTER'),
('1', 'ATP3  PLY', 'ATP', '3', 'PLY', 'TAPE', 'ALL', 'POLYESTER'),
('1', 'AWB2  WVN', 'AWB', '2', 'WVN', 'WAIST BAND', 'BOTTOM', 'WOVEN'),
('1', 'AZP1  BON', 'AZP', '1', 'BON', 'ZIPPER', 'TOP', 'BONE'),
('1', 'AZP1  LTH', 'AZP', '1', 'LTH', 'ZIPPER PUL', 'TOP', 'LEATHER'),
('1', 'AZP1  MTL', 'AZP', '1', 'MTL', 'ZIPPER', 'TOP', 'METAL'),
('1', 'AZP1  PLS', 'AZP', '1', 'PLS', 'ZIPPER', 'TOP', 'Plastic'),
('1', 'AZP2  MGC', 'AZP', '2', 'MGC', 'ZIPPER', 'BOTTOM', 'MAGIC'),
('1', 'AZP2  MTL', 'AZP', '2', 'MTL', 'ZIPPER', 'BOTTOM', 'METAL'),
('1', 'AZP3  MGC', 'AZP', '3', 'MGC', 'ZIPPER', 'ALL', 'MAGIC'),
('1', 'AZP3  MTL', 'AZP', '3', 'MTL', 'ZIPPER', 'ALL', 'METAL'),
('1', 'AZP3  PLS', 'AZP', '3', 'PLS', 'ZIPPER', 'ALL', 'Plastic'),
('1', 'AZT2  MTL', 'AZT', '2', 'MTL', 'AZIP TAPE', 'BOTTOM', 'METAL'),
('1', 'FBF2  CTN', 'FBF', '2', 'CTN', 'BED FORD', 'BOTTOM', 'COTTON100%'),
('1', 'FCD1  CTN', 'FCD', '1', 'CTN', 'CORDUROY', 'TOP', 'COTTON100%'),
('1', 'FCD2  MIX', 'FCD', '2', 'MIX', 'CORDUROY', 'BOTTOM', 'MIX'),
('1', 'FCD3  CTN', 'FCD', '3', 'CTN', 'CORDUROY', 'ALL', 'COTTON100%'),
('1', 'FCH3  MIX', 'FCH', '3', 'MIX', 'CHAMOIS', 'ALL', 'MIX'),
('1', 'FCN2  CTN', 'FCN', '2', 'CTN', 'CANVAS', 'BOTTOM', 'COTTON'),
('1', 'FCN2  MIX', 'FCN', '2', 'MIX', 'CANVAS', 'BOTTOM', 'MIX'),
('1', 'FCN3  CTN', 'FCN', '3', 'CTN', 'CANVAS', 'ALL', 'COTTON100%'),
('1', 'FCN3  MIX', 'FCN', '3', 'MIX', 'CANVAS', 'ALL', 'MIX'),
('1', 'FDC3  CTN', 'FDC', '3', 'CTN', 'DACRON', 'ALL', 'COTTON100%'),
('1', 'FDC3  MIX', 'FDC', '3', 'MIX', 'DACRON', 'ALL', 'MIX'),
('1', 'FDN1  CTN', 'FDN', '1', 'CTN', 'DENIM', 'TOP', 'COTTON100%'),
('1', 'FDN2  CTN', 'FDN', '2', 'CTN', 'DENIM', 'BOTTOM', 'COTTON100%'),
('1', 'FDN2  MIX', 'FDN', '2', 'MIX', 'DENIM', 'BOTTOM', 'MIX'),
('1', 'FDN3  CTN', 'FDN', '3', 'CTN', 'DENIM', 'ALL', 'COTTON100%'),
('1', 'FLN1  LNN', 'FLN', '1', 'LNN', 'LINEN', 'TOP', 'LINEN100%'),
('1', 'FLN1  MIX', 'FLN', '1', 'MIX', 'LINEN', 'TOP', 'MIX'),
('1', 'FLN2  LNN', 'FLN', '2', 'LNN', 'LINEN', 'BOTTOM', 'LINEN100%'),
('1', 'FLN2  MIX', 'FLN', '2', 'MIX', 'LINEN', 'BOTTOM', 'MIX'),
('1', 'FMC3  IND', 'FMC', '3', 'IND', 'MAICRO FIB', 'ALL', 'INDUSTRIAL'),
('1', 'FOX1  CTN', 'FOX', '1', 'CTN', 'OXFORD', 'TOP', 'COTTON100%'),
('1', 'FPF1  MIX', 'FPF', '1', 'MIX', 'POLAR FACE', 'TOP', 'MIX'),
('1', 'FPK2  CTN', 'FPK', '2', 'CTN', 'POCKTING', 'BOTTOM', 'COTTON100%'),
('1', 'FPK2  MIX', 'FPK', '2', 'MIX', 'POCKTING', 'BOTTOM', 'MIX'),
('1', 'FPP1  CTN', 'FPP', '1', 'CTN', 'POPLIN', 'TOP', 'COTTON100%'),
('1', 'FPP1  MIX', 'FPP', '1', 'MIX', 'POPLIN', 'TOP', 'MIX'),
('1', 'FPP2  CTN', 'FPP', '2', 'CTN', 'POPLIN', 'BOTTOM', 'COTTON100%'),
('1', 'FPP2  MIX', 'FPP', '2', 'MIX', 'POPLIN', 'BOTTOM', 'MIX'),
('1', 'FPP3  CTN', 'FPP', '3', 'CTN', 'POPLINE', 'ALL', 'COTTON100%'),
('1', 'FPP3  MIX', 'FPP', '3', 'MIX', 'POPLINE', 'ALL', 'MIX'),
('1', 'FSS3  STR', 'FSS', '3', 'STR', 'SERMASTRIT', 'ALL', 'STRITCH'),
('1', 'FST3  PLY', 'FST', '3', 'PLY', 'STAN', 'ALL', 'PLYESTAR'),
('1', 'FTW1  CTN', 'FTW', '1', 'CTN', 'TW', 'TOP', 'COTTON100%'),
('1', 'FTW2  CTN', 'FTW', '2', 'CTN', 'TWILL', 'BOTTOM', 'COTTON100%'),
('1', 'FTW2  MIX', 'FTW', '2', 'MIX', 'TWILL', 'BOTTOM', 'MIX'),
('1', 'FTW3  CTN', 'FTW', '3', 'CTN', 'TWILL', 'ALL', 'COTTON100%'),
('1', 'FTW3  MIX', 'FTW', '3', 'MIX', 'TWILL', 'ALL', 'MIX'),
('1', 'FVL1  CTN', 'FVL', '1', 'CTN', 'VIELLA', 'TOP', 'COTTON100%'),
('1', 'FVL2  CTN', 'FVL', '2', 'CTN', 'VIELLA', 'BOTTOM', 'COTTON100%'),
('1', 'FVL3  CTN', 'FVL', '3', 'CTN', 'VIELLA', 'ALL', 'COTTON100%'),
('1', 'FVO3  CTN', 'FVO', '3', 'CTN', 'VOIL', 'ALL', 'COTTON100%'),
('1', 'FVS2  MIX', 'FVS', '2', 'MIX', 'VISCOUS', 'BOTTOM', 'MIX'),
('1', 'FWL3  HPR', 'FWL', '3', 'HPR', 'WOOL', 'ALL', 'HUNDRED'),
('1', 'FWL3  MIX', 'FWL', '3', 'MIX', 'WOOL', 'ALL', 'MIX');

-- --------------------------------------------------------

--
-- Table structure for table `dept_name`
--

CREATE TABLE IF NOT EXISTS `dept_name` (
  `dept_id` char(3) NOT NULL,
  `countryid` char(5) NOT NULL,
  `dept_name` char(40) NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `countryid` (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_name`
--

INSERT INTO `dept_name` (`dept_id`, `countryid`, `dept_name`) VALUES
('C11', '2', 'Concrete Men Classics'),
('C12', '2', 'Concrete Men Casual'),
('C21', '2', 'Brands'),
('C22', '2', 'Junior Boys'),
('C31', '2', 'Brands'),
('C32', '2', 'Kids Boys'),
('C41', '2', 'Brands'),
('C42', '2', 'Junior Girls'),
('C51', '2', 'Brands'),
('C52', '2', 'Kids Girls'),
('C62', '2', 'Kids Girls'),
('C71', '2', 'Brands'),
('C82', '2', 'Baby Boys'),
('C92', '2', 'Baby Girls'),
('Q11', '2', 'Concept Men Classic'),
('Q12', '2', 'Concept Men Casual'),
('T11', '2', 'Cut Men Classic'),
('T12', '2', 'Cut Men Casual');

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `iso_header`
--

CREATE TABLE IF NOT EXISTS `iso_header` (
  `header_id` int(11) NOT NULL AUTO_INCREMENT,
  `header_code` char(15) NOT NULL,
  `version` int(11) NOT NULL,
  `date` date NOT NULL,
  `def` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`header_id`),
  KEY `default` (`def`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `iso_header`
--

INSERT INTO `iso_header` (`header_id`, `header_code`, `version`, `date`, `def`) VALUES
(2, 'CRF-11-01', 2, '2011-11-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `countryid` char(5) NOT NULL,
  `itemsid` bigint(20) NOT NULL,
  `desc1` char(40) NOT NULL DEFAULT '',
  `desc2` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `desc3` char(40) DEFAULT NULL,
  `desc4` char(40) DEFAULT NULL,
  `itemclass` char(3) DEFAULT NULL,
  `itemsubclass` char(3) DEFAULT NULL,
  `itemsize` char(8) DEFAULT NULL,
  `itemattr` char(8) DEFAULT NULL,
  `itemupc` char(20) DEFAULT NULL,
  `itemalu` char(20) DEFAULT NULL,
  `itemdept` char(3) DEFAULT NULL,
  `fulldept` char(9) DEFAULT NULL,
  `aux1` char(20) DEFAULT NULL,
  `aux2` char(20) DEFAULT NULL,
  `aux3` char(20) DEFAULT NULL,
  `aux4` char(20) DEFAULT NULL,
  `aux5` char(20) DEFAULT NULL,
  `aux6` char(20) DEFAULT NULL,
  `aux7` char(20) DEFAULT NULL,
  `aux8` char(20) DEFAULT NULL,
  `minqty` decimal(11,3) NOT NULL,
  `maxqty` decimal(11,3) NOT NULL,
  `onhand` decimal(11,3) NOT NULL,
  `onorder` decimal(11,3) NOT NULL,
  `unitcost` decimal(16,4) NOT NULL,
  `unitprice` decimal(16,4) NOT NULL,
  `unitmgnval` decimal(16,4) NOT NULL,
  `unitmgnprc` decimal(6,2) NOT NULL,
  `extcost` decimal(16,4) NOT NULL,
  `extprice` decimal(16,4) NOT NULL,
  `extmgnval` decimal(16,4) NOT NULL,
  `extcost_curr` decimal(16,4) NOT NULL,
  `extprice_curr` decimal(16,4) NOT NULL,
  `extmgnval_curr` decimal(16,4) NOT NULL,
  `vendor` char(6) DEFAULT NULL,
  `itemno` int(11) DEFAULT NULL,
  `stylesid` bigint(20) DEFAULT NULL,
  `last_sale` datetime DEFAULT NULL,
  `first_rcvd` datetime DEFAULT NULL,
  `udf1` char(20) DEFAULT NULL,
  `udf2` char(20) DEFAULT NULL,
  `udf3` char(20) DEFAULT NULL,
  `udf4` char(20) DEFAULT NULL,
  `last_rcvd` datetime DEFAULT NULL,
  `last_markdown` datetime DEFAULT NULL,
  `disconn_date` datetime DEFAULT NULL,
  `tax_perc` decimal(6,2) DEFAULT NULL,
  `tax_value` decimal(16,4) DEFAULT NULL,
  `unitpricetax` decimal(16,4) DEFAULT NULL,
  `udfdate` datetime DEFAULT NULL,
  `firstprice` decimal(16,4) DEFAULT NULL,
  `firstpricetax` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`countryid`,`itemsid`),
  UNIQUE KEY `items_i2` (`countryid`,`itemdept`,`itemclass`,`itemsubclass`,`itemsid`),
  KEY `index3` (`itemno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`countryid`, `itemsid`, `desc1`, `desc2`, `desc3`, `desc4`, `itemclass`, `itemsubclass`, `itemsize`, `itemattr`, `itemupc`, `itemalu`, `itemdept`, `fulldept`, `aux1`, `aux2`, `aux3`, `aux4`, `aux5`, `aux6`, `aux7`, `aux8`, `minqty`, `maxqty`, `onhand`, `onorder`, `unitcost`, `unitprice`, `unitmgnval`, `unitmgnprc`, `extcost`, `extprice`, `extmgnval`, `extcost_curr`, `extprice_curr`, `extmgnval_curr`, `vendor`, `itemno`, `stylesid`, `last_sale`, `first_rcvd`, `udf1`, `udf2`, `udf3`, `udf4`, `last_rcvd`, `last_markdown`, `disconn_date`, `tax_perc`, `tax_value`, `unitpricetax`, `udfdate`, `firstprice`, `firstpricetax`) VALUES
('1', -4639954345381560000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'L', 'BLK', NULL, '12701/701/041', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4173, -4622787339299840000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639954277542890000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'M', 'BLK', NULL, '12701/701/041', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4174, -4622787340360390000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639954206877250000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'S', 'BLK', NULL, '12701/701/041', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4175, -4622787339991090000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639954137394410000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'XL', 'BLK', NULL, '12701/701/041', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4176, -4622787337239070000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639954070352660000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'XX', 'BLK', NULL, '12701/701/041', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4177, -4622787339536800000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639954002597870000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'L', 'CRCL', NULL, '12701/701/063', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4178, -4622787340384240000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639953928056700000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'M', 'CRCL', NULL, '12701/701/063', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4179, -4622787337831600000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639953853263870000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'S', 'CRCL', NULL, '12701/701/063', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4180, -4622787338330540000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639953786272450000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'XL', 'CRCL', NULL, '12701/701/063', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4181, -4622787331991740000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', -4639953710984690000, 'C124TE1-G00-90N-1001', 'Êí ÔíÑÊ ÈÇÒß 1/2 ßã', '1', 'Crew neck in pure cotton', '4', 'TE1', 'XX', 'CRCL', NULL, '12701/701/063', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '6-Delivered TO Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HAKIM', 4182, -4622787327942320000, '2013-04-11 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, '2003-08-05 00:00:00', 0.0000, 0.0000),
('1', 7973239578549030000, 'C112TR2-G00-71N-2006', 'ÈäØáæä ßáÇÓíß ÈßÓÑÉ æÇÍÏÉ', '6', NULL, '2', 'TR2', '40', 'OLV', NULL, NULL, 'C11', 'C112  TR2', '71N RG.100% WOOL', '2-Second', 'Concrete', '', '', '', 'OLIVE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 25.0000, 25.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 20861, 2495217290337850000, '2013-01-29 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 25.0000, NULL, 0.0000, 0.0000),
('1', 3571401233212110000, 'C521SW3-W05-97N-S109', 'ÓæíÊ ÔíÑÊ ÈßÑÇäíÔ Úáì ÇáÕÏÑ æÇ', '109', NULL, '1', 'SW3', '2', 'OWHT', NULL, '52476/707/021', 'C52', 'C521  SW3', '97N MELTON 100%CTN', '5-Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 7.5600, 5.0000, -2.5600, -33.86, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 21977, 3571401229722450000, '2013-01-04 00:00:00', NULL, 'Winter', '2005', '-No Entry-', '-No Entry-', NULL, '2014-09-10 00:00:00', NULL, 0.00, 0.0000, 5.0000, '2005-11-07 00:00:00', 0.0000, 0.0000),
('1', 3571400974868150000, 'C422DR7-W05-20N-S111', 'ÝÓÊÇä ßÊ ÈæÓØ ÓÇÞØ', '111', NULL, '2', 'DR7', '16', 'BLK', NULL, '58320/412/041', 'C42', 'C422  DR7', '20N RG.TWILL CTN', '5-Stock', 'Concrete', 'Leave', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 5.0000, 5.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HARERY', 22029, 3571400956723590000, '2012-10-04 00:00:00', NULL, 'Winter', '2005', '-No Entry-', '-No Entry-', NULL, '2014-09-10 00:00:00', NULL, 0.00, 0.0000, 5.0000, '2005-11-07 00:00:00', 0.0000, 0.0000),
('1', 3579590285664980000, 'C221SH2-W05-11N-S124', 'ÞãíÕ È2 ÌíÈ ÈÞáÇÈ ãä ÇáÃãÇã', '124', '0', '1', 'SH2', '16', 'OLIV 401', NULL, '36466/214/123', 'C22', 'C221  SH2', '11N RG.POPLIN CTN', '5-Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 5.0000, 5.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NAGA', 22499, 8877301629608480000, '2014-01-01 00:00:00', NULL, 'Winter', '2005', '-No Entry-', '-No Entry-', NULL, '2014-09-10 00:00:00', NULL, 0.00, 0.0000, 5.0000, '2005-11-14 00:00:00', 0.0000, 0.0000),
('1', 3579595125229090000, 'C326IC1-W05-85N-S101', 'ØÇÞíÉ', '101', NULL, '6', 'IC1', '1', 'KHKI', NULL, '38701/653/121', 'C32', 'C326  IC1', '85N HY.TRCT WL/ACR', '5-Stock', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 14.1800, 2.5000, -11.6800, -82.37, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NILE', 22682, -8901553696309770000, '2012-12-09 00:00:00', NULL, 'Winter', '2005', '-No Entry-', '-No Entry-', NULL, '2014-09-10 00:00:00', NULL, 0.00, 0.0000, 2.5000, '2005-11-14 00:00:00', 0.0000, 0.0000),
('1', 3679024153274350000, 'C526IC1-W06-85N-2102', 'BIG STRIPE', '102', NULL, '6', 'IC1', '1', 'NVY', NULL, 'CAP-06', 'C52', 'C526  IC1', '85N HY.TRCT WL/ACR', '2-Second', 'Concrete', '', '', '', 'NAVY', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 5.0000, 5.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NILE', 26728, 3679024153064640000, '2014-02-11 00:00:00', '2005-12-11 00:00:00', 'Winter', '2006', '-No Entry-', '-No Entry-', '2005-12-18 00:00:00', '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 5.0000, NULL, 0.0000, 0.0000),
('1', 3683245323897010000, 'C126SC1-G00-00N-1190', 'ÔÑÇÈ ÓÇÏÉ', '190', '0', '6', 'SC1', '46/45', 'BLK', NULL, '6222004505693', 'C12', 'C126  SC1', '000 Others', '1-First', 'Concrete', '', '', '', 'BLACK', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 21.9600, 21.9600, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'F.G.', 27048, 3683245280695680000, '2013-11-12 00:00:00', '2006-04-16 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2011-07-19 00:00:00', '2014-06-15 00:00:00', NULL, 0.00, 0.0000, 21.9600, NULL, 0.0000, 0.0000),
('1', 3705490786226270000, 'C521PL4-W06-85N-2134', 'MOK NECK W/APP&EMB @SLV', '134', NULL, '1', 'PL4', '6', 'OWHT', NULL, 'JGPO-031', 'C52', 'C521  PL4', '85N HY.TRCT WL/ACR', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 10.0000, 10.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NILE', 28228, 3705490766588540000, '2012-10-03 00:00:00', '2005-12-18 00:00:00', 'Winter', '2006', '-No Entry-', '-No Entry-', '2005-12-19 00:00:00', '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 10.0000, NULL, 0.0000, 0.0000),
('1', 3746047164049000000, 'C122PT1-S06-55N-1105', 'PANT 1 PLEAT W 2 SLANT POCKET', '105', '0', '2', 'PT1', '48', 'BRWN 801', NULL, '11651', 'C12', 'C122  PT1', '55N HY.LINEN/CTN', '6-Delivered TO Stock', 'Concrete', 'Collect End Of Seas', '', '', 'BROWN', '', 0.000, 0.000, 1.000, 0.000, 65.2200, 189.9000, 124.6800, 191.17, 65.2200, 189.9000, 124.6800, 65.2200, 189.9000, 124.6800, 'ETC', 28329, 3746047122231790000, '2008-02-22 00:00:00', '2006-03-19 00:00:00', 'summer', '2006', '-No Entry-', '-No Entry-', '2006-03-19 00:00:00', '2014-01-07 00:00:00', NULL, 0.00, 0.0000, 189.9000, '2008-03-01 00:00:00', 0.0000, 0.0000),
('1', -5335271227281870000, 'C523JK1-W06-14N-2110', 'SHORT W/2FRNT PKT', '110', NULL, '3', 'JK1', '2', 'RED  106', NULL, 'JGJK-02', 'C52', 'C523  JK1', '14N VIELLA-100%CTN', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 20.0000, 20.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HARERY', 28550, -5335216264313240000, '2012-11-30 00:00:00', NULL, 'Winter', '2006', '-No Entry-', '-No Entry-', NULL, '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 20.0000, NULL, 0.0000, 0.0000),
('1', -5335271215705590000, 'C523JK1-W06-14N-2110', 'SHORT W/2FRNT PKT', '110', NULL, '3', 'JK1', '4', 'RED  106', NULL, 'JGJK-02', 'C52', 'C523  JK1', '14N VIELLA-100%CTN', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 20.0000, 20.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HARERY', 28551, -5335216263754780000, NULL, NULL, 'Winter', '2006', '-No Entry-', '-No Entry-', NULL, '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 20.0000, NULL, 0.0000, 0.0000),
('1', -5335271209447690000, 'C523JK1-W06-14N-2110', 'SHORT W/2FRNT PKT', '110', NULL, '3', 'JK1', '6', 'RED  106', NULL, 'JGJK-02', 'C52', 'C523  JK1', '14N VIELLA-100%CTN', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 20.0000, 20.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HARERY', 28552, -5335216261654730000, NULL, NULL, 'Winter', '2006', '-No Entry-', '-No Entry-', NULL, '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 20.0000, NULL, 0.0000, 0.0000),
('1', -5335271203324000000, 'C523JK1-W06-14N-2110', 'SHORT W/2FRNT PKT', '110', NULL, '3', 'JK1', '8', 'RED  106', NULL, 'JGJK-02', 'C52', 'C523  JK1', '14N VIELLA-100%CTN', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 20.0000, 20.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HARERY', 28553, -5335216252824980000, NULL, NULL, 'Winter', '2006', '-No Entry-', '-No Entry-', NULL, '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 20.0000, NULL, 0.0000, 0.0000),
('1', -5335271195044450000, 'C523JK1-W06-14N-2110', 'SHORT W/2FRNT PKT', '110', NULL, '3', 'JK1', '10', 'RED  106', NULL, 'JGJK-02', 'C52', 'C523  JK1', '14N VIELLA-100%CTN', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 20.0000, 20.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HARERY', 28554, -5335216255621500000, NULL, NULL, 'Winter', '2006', '-No Entry-', '-No Entry-', NULL, '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 20.0000, NULL, 0.0000, 0.0000),
('1', -4472740928070580000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '48', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28933, -4470741047274430000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472740921644910000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '50', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28934, -4470741046721730000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472740911226260000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '52', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28935, -4470741048700330000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472740901831020000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '54', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28936, -4470741047099660000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472740893425630000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '56', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28938, -4470741046102970000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472740885607450000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '58', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28939, -4470741045008180000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472740878401630000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '60', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28940, -4470741045528680000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472740870046580000, 'C111SU2-S06-70N-1105', 'SUIT 3 BTN. 2 BACK OPINING', '105', '0', '1', 'SU2', '62', 'BLCK 106', NULL, NULL, 'C11', 'C111  SU2', '70N FINE 100% WOOL', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 28941, -4470741047077900000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757837096780000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '48', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29047, -4470741046746110000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757822802590000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '50', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29048, -4470741046593280000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757814892130000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '52', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29049, -4470741043333530000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757804632870000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '54', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29050, -4470741044449880000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757796110040000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '56', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29051, -4470741040708340000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757781958460000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '58', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29052, -4470741040792870000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757775625060000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '60', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29053, -4470741040793920000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757767018350000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '62', 'BIGE 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29054, -4470741040303050000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757756582920000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '48', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29063, -4470741044444490000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757744335550000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '50', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29064, -4470741041248690000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757735888220000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '52', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29065, -4470741041897870000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757725209520000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '54', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29066, -4470741042330250000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757713121540000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '56', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29067, -4470741042746330000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757705706010000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '58', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29068, -4470741041981120000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757696923140000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '60', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29069, -4470741042161110000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757684994540000, 'C111BZ2-S06-74N-1105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', '0', '1', 'BZ2', '62', 'BRWN 107', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 29070, -4470741042575770000, '2013-05-25 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', 3817075655703530000, 'C112TR2-G00-71N-S006', 'ÈäØáæä ßáÇÓíß ÈßÓÑÉ æÇÍÏÉ', '6', NULL, '2', 'TR2', '40', 'LMD', NULL, '11706/504/117', 'C11', 'C112  TR2', '71N RG.100% WOOL', '5-Stock', 'Concrete', 'Collect To Redistrub', '', '', '', '', 1.000, 0.000, 0.000, 0.000, 103.6900, 50.0000, -53.6900, -51.78, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 30047, 2495207949471840000, '2012-12-21 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 50.0000, '2006-01-16 00:00:00', 0.0000, 0.0000),
('1', 4053942197165230000, 'C111SU2-S06-52N-2118', 'SUITE 3 BTN. 2 BACK OPENING', '118', NULL, '1', 'SU2', '56', 'OWHT205', NULL, NULL, 'C11', 'C111  SU2', '52N HY.100%LINEN', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 100.0000, 100.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 34979, 4053942167511500000, '2013-03-30 00:00:00', '2006-03-19 00:00:00', 'summer', '2006', '-No Entry-', '-No Entry-', '2006-03-25 00:00:00', '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 100.0000, NULL, 0.0000, 0.0000),
('1', 4053944036409480000, 'C421BL6-S06-55N-2128', 'BLOUSE W BELT', '128', NULL, '1', 'BL6', '18', 'HPNK', NULL, 'KGBL-04', 'C42', 'C421  BL6', '55N HY.LINEN/CTN', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 5.0000, 5.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'SAMPLS', 35198, 4053943998157420000, '2012-04-11 00:00:00', '2006-03-19 00:00:00', 'summer', '2006', '-No Entry-', '-No Entry-', '2006-03-19 00:00:00', '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 5.0000, NULL, 0.0000, 0.0000),
('1', -3883939798070560000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '48', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39021, -3880561354258590000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939783247890000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '50', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39022, -3880561352250740000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939764356740000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '52', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39023, -3880561351078330000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939753300560000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '54', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39024, -3880561354070700000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939743292950000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '56', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39025, -3880561353988460000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939730861030000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '58', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39026, -3880561353892470000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939720786310000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '60', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39027, -3880561350260540000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939710552210000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '62', 'NVY', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39028, -3880561349168350000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939702851470000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '48', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39073, -3883722628199840000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', -3883939682232270000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '50', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39074, -3883722629424580000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', -3883939673575230000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '52', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39075, -3883722628107570000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', -3883939662577760000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '54', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39076, -3883722627302260000, '2014-08-10 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', -3883939650271670000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '56', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39077, -3883722630959690000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', -3883939638057860000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '58', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39078, -3883722630959690000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', -3883939626926180000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '60', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39079, -3883722629323910000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', -3883939613143690000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '62', 'BLCK 211', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39080, -3883722629432970000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', 4135336318643210000, 'C111SH6-G00-10N-2107', 'SMALL COLLAR 1 BTN @ NK', '107', NULL, '1', 'SH6', '46', 'WHT', NULL, NULL, 'C11', 'C111  SH6', '10N FINE POPLIN', '2-Second', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 25.0000, 25.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NAGA', 39243, 4135336124514040000, '2008-03-01 00:00:00', '2006-04-10 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2007-09-17 00:00:00', '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 25.0000, NULL, 0.0000, 0.0000),
('1', 4135336324045470000, 'C111SH6-G00-10N-2107', 'SMALL COLLAR 1 BTN @ NK', '107', NULL, '1', 'SH6', '48', 'WHT', NULL, NULL, 'C11', 'C111  SH6', '10N FINE POPLIN', '2-Second', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 25.0000, 25.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NAGA', 39244, 4135336124514040000, '2008-12-15 00:00:00', '2006-04-10 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2007-09-17 00:00:00', '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 25.0000, NULL, 0.0000, 0.0000),
('1', 4136198215030540000, 'C112TR3-G00-71N-2008', 'SLANT POCKETS', '8', NULL, '2', 'TR3', '42', 'GBEG', NULL, NULL, 'C11', 'C112  TR3', '71N RG.100% WOOL', '2-Second', 'Concrete', '', '', '', 'BEIGE', '', 1.000, 0.000, 0.000, 0.000, 0.0000, 25.0000, 25.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39304, -5799082879576100000, '2014-07-10 00:00:00', '2006-04-10 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2006-04-10 00:00:00', '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 25.0000, NULL, 0.0000, 0.0000),
('1', 4136198670146080000, 'C112TR3-G00-71N-2008', 'SLANT POCKETS', '8', NULL, '2', 'TR3', '40', 'CML', NULL, NULL, 'C11', 'C112  TR3', '71N RG.100% WOOL', '2-Second', 'Concrete', '', '', '', 'HAVANA', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 25.0000, 25.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39312, -5799082878981000000, '2013-02-15 00:00:00', '2006-04-10 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2006-05-23 00:00:00', '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 25.0000, NULL, 0.0000, 0.0000),
('1', 4136199280224370000, 'C112TR3-G00-71N-2008', 'SLANT POCKETS', '8', NULL, '2', 'TR3', '42', 'CRM', NULL, NULL, 'C11', 'C112  TR3', '71N RG.100% WOOL', '2-Second', 'Concrete', '', '', '', 'CREAM', '', 1.000, 0.000, 0.000, 0.000, 0.0000, 25.0000, 25.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 39321, -5799082872657430000, '2013-05-24 00:00:00', '2006-04-10 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2006-04-10 00:00:00', '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 25.0000, NULL, 0.0000, 0.0000),
('1', -4639952381440650000, 'C124TE1-G00-90N-1002', '1/PACK MOCKNECK', '2', 'Crew neck in pure co', '4', 'TE1', 'S', 'WHT', NULL, '12701/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 40269, -4622787220831290000, '2013-07-09 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4639952332585400000, 'C124TE1-G00-90N-1002', '1/PACK MOCKNECK', '2', 'Crew neck in pure co', '4', 'TE1', 'M', 'WHT', NULL, '12701/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 40270, -4622787220831290000, '2013-07-09 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4639952284879390000, 'C124TE1-G00-90N-1002', '1/PACK MOCKNECK', '2', 'Crew neck in pure co', '4', 'TE1', 'L', 'WHT', NULL, '12701/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 40271, -4622787220831290000, '2013-07-09 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4639952236972050000, 'C124TE1-G00-90N-1002', '1/PACK MOCKNECK', '2', 'Crew neck in pure co', '4', 'TE1', 'XL', 'WHT', NULL, '12701/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 40272, -4622787220831290000, '2013-07-09 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', 2495209728259390000, 'C124TE1-G00-90N-1002', '1/PACK MOCKNECK', '2', 'Crew neck in pure co', '4', 'TE1', 'XX', 'WHT', NULL, '12701/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', 'REGULAR FIT TEE', 'Solid colour', 'WHITE', 'Short sleeved', 0.000, 0.000, 0.000, 0.000, 17.4700, 55.0000, 37.5300, 214.83, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 40273, -4622787220831290000, '2013-07-09 00:00:00', '2004-03-03 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2010-03-09 00:00:00', '2013-06-17 00:00:00', NULL, 0.00, 0.0000, 55.0000, NULL, 0.0000, 0.0000),
('1', -3883939604234990000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '48', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40315, -3880561312968090000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939589412320000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '50', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40316, -3880561312517990000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939579345990000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '52', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40317, -3880561312307370000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939568860230000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '54', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40318, -3880561311977490000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939555362960000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '56', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40319, -3880561312342630000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939545758010000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '58', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40320, -3880561312396230000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939534332720000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '60', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40321, -3880561313916260000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -3883939526732640000, 'C111BZ2-S06-74N-2105', 'BLAZER 2 BTN. 2 BACK OPINING', '105', NULL, '1', 'BZ2', '62', 'INDG 103', NULL, NULL, 'C11', 'C111  BZ2', '75N RG.WOOL BLEND', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 40322, -3880561314609170000, '2013-10-29 00:00:00', NULL, 'summer', '2006', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', -4472757849906180000, 'C111BZ1-S00-000-1001', 'NHV,JJ;JKKJL', '1', '0', '1', 'BZ1', '0', 'KHKI 101', NULL, NULL, 'C11', 'C111  BZ1', '000 Others', '1-First', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ALAMAL', 40888, -4472757852867360000, '2013-05-25 00:00:00', NULL, 'summer', '0', '-No Entry-', '-No Entry-', NULL, NULL, NULL, 0.00, 0.0000, 0.0000, NULL, 0.0000, 0.0000),
('1', 4228024033456690000, 'C426BT1-G00-80N-S015', 'ÍÒÇã ÑÈÇØ ÔÑÇÔíÈ ÈÍáÞÉ ãÚÏä', '15', NULL, '6', 'BT1', '85', 'BLK', NULL, '59315/051/041', 'C42', 'C426  BT1', '80N NATURAL LTHR', '5-Stock', 'Concrete', '', '', '', 'BLACK', '', 0.000, 0.000, 0.000, 0.000, 12.6000, 10.0000, -2.6000, -20.63, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HODA2', 41893, 4228024036342370000, '2012-06-30 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 10.0000, '2006-05-01 00:00:00', 0.0000, 0.0000),
('1', 4228024048270970000, 'C426BT1-G00-80N-S015', 'ÍÒÇã ÑÈÇØ ÔÑÇÔíÈ ÈÍáÞÉ ãÚÏä', '15', NULL, '6', 'BT1', '9', 'BLK', NULL, '59315/051/041', 'C42', 'C426  BT1', '80N NATURAL LTHR', '5-Stock', 'Concrete', '', '', '', 'BLACK', '', 0.000, 0.000, 0.000, 0.000, 12.6000, 10.0000, -2.6000, -20.63, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HODA2', 41894, 4228024036342370000, '2012-07-17 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 10.0000, '2006-05-01 00:00:00', 0.0000, 0.0000),
('1', 4228024056609240000, 'C426BT1-G00-80N-S015', 'ÍÒÇã ÑÈÇØ ÔÑÇÔíÈ ÈÍáÞÉ ãÚÏä', '15', NULL, '6', 'BT1', '95', 'BLK', NULL, '59315/051/041', 'C42', 'C426  BT1', '80N NATURAL LTHR', '5-Stock', 'Concrete', '', '', '', 'BLACK', '', 0.000, 0.000, 0.000, 0.000, 12.6000, 10.0000, -2.6000, -20.63, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HODA2', 41895, 4228024036342370000, '2012-07-17 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 10.0000, '2006-05-01 00:00:00', 0.0000, 0.0000),
('1', 4228024072799260000, 'C426BT1-G00-80N-S015', 'ÍÒÇã ÑÈÇØ ÔÑÇÔíÈ ÈÍáÞÉ ãÚÏä', '15', NULL, '6', 'BT1', '85', 'BRN', NULL, '59315/051/102', 'C42', 'C426  BT1', '80N NATURAL LTHR', '5-Stock', 'Concrete', '', '', '', 'BROWN', '', 0.000, 0.000, 0.000, 0.000, 12.6000, 10.0000, -2.6000, -20.63, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HODA2', 41896, 4228024036342370000, '2012-06-30 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 10.0000, '2006-05-01 00:00:00', 0.0000, 0.0000),
('1', 4228024086002930000, 'C426BT1-G00-80N-S015', 'ÍÒÇã ÑÈÇØ ÔÑÇÔíÈ ÈÍáÞÉ ãÚÏä', '15', NULL, '6', 'BT1', '9', 'BRN', NULL, '59315/051/102', 'C42', 'C426  BT1', '80N NATURAL LTHR', '5-Stock', 'Concrete', '', '', '', 'BROWN', '', 0.000, 0.000, 0.000, 0.000, 12.6000, 10.0000, -2.6000, -20.63, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HODA2', 41897, 4228024036342370000, '2012-07-17 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 10.0000, '2006-05-01 00:00:00', 0.0000, 0.0000),
('1', 4228024099902850000, 'C426BT1-G00-80N-S015', 'ÍÒÇã ÑÈÇØ ÔÑÇÔíÈ ÈÍáÞÉ ãÚÏä', '15', NULL, '6', 'BT1', '95', 'BRN', NULL, '59315/051/102', 'C42', 'C426  BT1', '80N NATURAL LTHR', '5-Stock', 'Concrete', '', '', '', 'BROWN', '', 0.000, 0.000, 0.000, 0.000, 12.6000, 10.0000, -2.6000, -20.63, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'HODA2', 41898, 4228024036342370000, '2012-07-17 00:00:00', NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 10.0000, '2006-05-01 00:00:00', 0.0000, 0.0000),
('1', 2495209740397710000, 'C124TE1-G00-90N-1001', '2/PACK MOCKNECK', '1', 'Crew neck in pure co', '4', 'TE1', 'S', 'WHT', NULL, '10201/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 27.1500, 95.0000, 67.8500, 249.91, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 42891, 2495209737394590000, '2013-06-17 00:00:00', '2004-03-03 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2008-04-19 00:00:00', '2012-04-22 00:00:00', NULL, 0.00, 0.0000, 95.0000, NULL, 0.0000, 0.0000);
INSERT INTO `items` (`countryid`, `itemsid`, `desc1`, `desc2`, `desc3`, `desc4`, `itemclass`, `itemsubclass`, `itemsize`, `itemattr`, `itemupc`, `itemalu`, `itemdept`, `fulldept`, `aux1`, `aux2`, `aux3`, `aux4`, `aux5`, `aux6`, `aux7`, `aux8`, `minqty`, `maxqty`, `onhand`, `onorder`, `unitcost`, `unitprice`, `unitmgnval`, `unitmgnprc`, `extcost`, `extprice`, `extmgnval`, `extcost_curr`, `extprice_curr`, `extmgnval_curr`, `vendor`, `itemno`, `stylesid`, `last_sale`, `first_rcvd`, `udf1`, `udf2`, `udf3`, `udf4`, `last_rcvd`, `last_markdown`, `disconn_date`, `tax_perc`, `tax_value`, `unitpricetax`, `udfdate`, `firstprice`, `firstpricetax`) VALUES
('1', 2495209736664780000, 'C124TE1-G00-90N-1001', '2/PACK MOCKNECK', '1', 'Crew neck in pure co', '4', 'TE1', 'M', 'WHT', NULL, '10201/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 26.8100, 95.0000, 68.1900, 254.35, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 42892, 2495209737394590000, '2013-06-17 00:00:00', '2004-03-03 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2008-05-25 00:00:00', '2012-04-22 00:00:00', NULL, 0.00, 0.0000, 95.0000, NULL, 0.0000, 0.0000),
('1', 2495209738552210000, 'C124TE1-G00-90N-1001', '2/PACK MOCKNECK', '1', 'Crew neck in pure co', '4', 'TE1', 'L', 'WHT', NULL, '10201/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 25.8000, 95.0000, 69.2000, 268.22, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 42893, 2495209737394590000, '2014-09-11 00:00:00', '2004-03-03 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2008-05-25 00:00:00', '2012-04-22 00:00:00', NULL, 0.00, 0.0000, 95.0000, NULL, 0.0000, 0.0000),
('1', 2495209739273630000, 'C124TE1-G00-90N-1001', '2/PACK MOCKNECK', '1', 'Crew neck in pure co', '4', 'TE1', 'XL', 'WHT', NULL, '10201/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 25.3300, 95.0000, 69.6700, 275.05, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 42894, 2495209737394590000, '2014-03-08 00:00:00', '2004-03-03 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2008-05-25 00:00:00', '2012-04-22 00:00:00', NULL, 0.00, 0.0000, 95.0000, NULL, 0.0000, 0.0000),
('1', 2495209738208280000, 'C124TE1-G00-90N-1001', '2/PACK MOCKNECK', '1', 'Crew neck in pure co', '4', 'TE1', 'XX', 'WHT', NULL, '10201/701/011', 'C12', 'C124  TE1', '90N SINGLE JERSEY', '8-Delivered TO W\\H', 'Concrete', '', '', '', 'WHITE', '', 0.000, 0.000, 0.000, 0.000, 24.9000, 95.0000, 70.1000, 281.53, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'K.B.', 42895, 2495209737394590000, '2013-06-17 00:00:00', '2004-03-03 00:00:00', 'General', '0', '-No Entry-', '-No Entry-', '2008-05-25 00:00:00', '2012-04-22 00:00:00', NULL, 0.00, 0.0000, 95.0000, NULL, 0.0000, 0.0000),
('1', 4276916209628220000, 'C224BX1-G00-11N-2002', NULL, '2', NULL, '4', 'BX1', '10', 'BLUE 106', NULL, NULL, 'C22', 'C224  BX1', '11N RG.POPLIN CTN', '2-Second', 'Concrete', '', '', '', 'BLUE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 12.0000, 12.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NAGA', 42920, 4276916206415380000, NULL, NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 12.0000, NULL, 0.0000, 0.0000),
('1', 4276916223318430000, 'C224BX1-G00-11N-2002', NULL, '2', NULL, '4', 'BX1', '12', 'BLUE 106', NULL, NULL, 'C22', 'C224  BX1', '11N RG.POPLIN CTN', '2-Second', 'Concrete', '', '', '', 'BLUE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 12.0000, 12.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NAGA', 42921, 4276916206415380000, NULL, NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 12.0000, NULL, 0.0000, 0.0000),
('1', 4276916250413630000, 'C224BX1-G00-11N-2002', NULL, '2', NULL, '4', 'BX1', '14', 'BLUE 106', NULL, NULL, 'C22', 'C224  BX1', '11N RG.POPLIN CTN', '2-Second', 'Concrete', '', '', '', 'BLUE', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 12.0000, 12.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'NAGA', 42922, 4276916206415380000, NULL, NULL, 'General', '0', '-No Entry-', '-No Entry-', NULL, '2014-10-15 00:00:00', NULL, 0.00, 0.0000, 12.0000, NULL, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `marker`
--

CREATE TABLE IF NOT EXISTS `marker` (
  `marker_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `width` float NOT NULL,
  `length` float NOT NULL,
  `utilization` float NOT NULL,
  `t_size` float NOT NULL,
  `ratio` char(40) CHARACTER SET utf8 NOT NULL,
  `marker_name` char(40) CHARACTER SET utf8 NOT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`marker_id`),
  KEY `fk_marker_ss_idx` (`ss_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Table structure for table `marker_log`
--

CREATE TABLE IF NOT EXISTS `marker_log` (
  `marker_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `marker_id` int(11) NOT NULL,
  `action_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(10) NOT NULL,
  `action_comment` text CHARACTER SET utf8 NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`marker_log_id`),
  KEY `marker_id` (`marker_id`),
  KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`scale_number`, `scale_size`, `scale_name`) VALUES
('10', '36,38,40,42,44,46,48,50,52', '36-52'),
('100', '42,44,46,48,50,52,54,56,58,60,62,64,66', '42-66'),
('22', 'S,XS,L', 'alpha');

-- --------------------------------------------------------

--
-- Table structure for table `ss_size_qty`
--

CREATE TABLE IF NOT EXISTS `ss_size_qty` (
  `ss_size_qty_id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_id` int(11) NOT NULL,
  `size` char(10) NOT NULL,
  `size_qty` int(11) NOT NULL,
  PRIMARY KEY (`ss_size_qty_id`),
  KEY `ss_id` (`bs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `ss_size_qty`
--

INSERT INTO `ss_size_qty` (`ss_size_qty_id`, `bs_id`, `size`, `size_qty`) VALUES
(47, 15, '36', 0),
(48, 15, '38', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet`
--

CREATE TABLE IF NOT EXISTS `stylesheet` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `fulldept` char(9) NOT NULL,
  `country_id` char(5) NOT NULL,
  `dept_id` char(3) NOT NULL,
  `class_id` char(3) NOT NULL,
  `subclass_id` char(3) NOT NULL,
  `season` char(1) NOT NULL,
  `year` char(4) NOT NULL,
  `pono` char(20) DEFAULT NULL,
  `dcs_notes` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `style_code` char(40) CHARACTER SET utf8 NOT NULL,
  `stylesheet_note` text CHARACTER SET utf8,
  `fabric` char(40) NOT NULL,
  `scale` char(5) NOT NULL,
  `sizes` char(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`ss_id`),
  KEY `fk_stylesheet_country_index` (`country_id`),
  KEY `index3` (`country_id`,`season`,`year`,`style_code`,`dept_id`,`class_id`,`subclass_id`),
  KEY `scale` (`scale`),
  KEY `owner` (`user_id`),
  KEY `fulldept` (`fulldept`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `stylesheet`
--

INSERT INTO `stylesheet` (`ss_id`, `fulldept`, `country_id`, `dept_id`, `class_id`, `subclass_id`, `season`, `year`, `pono`, `dcs_notes`, `style_code`, `stylesheet_note`, `fabric`, `scale`, `sizes`, `user_id`) VALUES
(34, 'C111  BZ1', '2', 'C11', '1', 'BZ1', 'G', '2019', '20', 'no', 'GPJ/T-03', '', 'Cotton', '10', '110000000', 1),
(35, 'C111  BZ1', '2', 'C11', '1', 'BZ1', 'S', '2019', NULL, 'tt', 'ASSUM/15', '', 'Cotton', '100', '0001100000000', 5);

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_bom`
--

CREATE TABLE IF NOT EXISTS `stylesheet_bom` (
  `ss_bom_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `fulldept` char(9) NOT NULL,
  `dcs_name` char(40) NOT NULL,
  `dept_id` char(3) NOT NULL,
  `class_id` char(3) NOT NULL,
  `subclass_id` char(3) NOT NULL,
  `item_color_id` char(40) NOT NULL,
  `item_desc` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `item_cons` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `item_placement` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `countryid` char(5) NOT NULL,
  PRIMARY KEY (`ss_bom_id`),
  KEY `fk_stylesheet_bom_country_idx` (`countryid`),
  KEY `fk_stylesheet_bom_color_idx` (`item_color_id`),
  KEY `fk_ss_bom_ss` (`ss_id`),
  KEY `fulldept` (`fulldept`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `stylesheet_bom`
--

INSERT INTO `stylesheet_bom` (`ss_bom_id`, `ss_id`, `fulldept`, `dcs_name`, `dept_id`, `class_id`, `subclass_id`, `item_color_id`, `item_desc`, `item_cons`, `item_placement`, `countryid`) VALUES
(22, 34, 'AAP3  APX', 'APLEX ALL', '', '', '', 'BLDE  00', 'الجسم', '1.23', 'للجسم', '1'),
(23, 35, 'AAP3  APX', 'APLEX ALL', '', '', '', 'OR    00', 'الجسم', '1.23', 'ON', '1');

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_color`
--

CREATE TABLE IF NOT EXISTS `stylesheet_color` (
  `ss_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `color_code` char(8) NOT NULL,
  `print` tinyint(1) DEFAULT NULL,
  `emb` tinyint(1) DEFAULT NULL,
  `place` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `code` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `ss_color_desc` char(40) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ss_color_id`),
  KEY `fk_stylesheet_color_color_idx` (`color_code`),
  KEY `fk_stylesheet_color_ss` (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `stylesheet_color`
--

INSERT INTO `stylesheet_color` (`ss_color_id`, `ss_id`, `color_code`, `print`, `emb`, `place`, `code`, `ss_color_desc`) VALUES
(10, 35, 'RD    00', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_images`
--

CREATE TABLE IF NOT EXISTS `stylesheet_images` (
  `ss_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `img_path` char(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ss_img_id`),
  KEY `fk_stylesheet_images_ss` (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `stylesheet_images`
--

INSERT INTO `stylesheet_images` (`ss_img_id`, `ss_id`, `img_path`) VALUES
(27, 34, 'Screenshot from 2014-09-18 14:12:17.png'),
(28, 35, 'crop.png');

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_log`
--

CREATE TABLE IF NOT EXISTS `stylesheet_log` (
  `ss_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `action_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(10) NOT NULL,
  `action_comment` text CHARACTER SET utf8 NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`ss_log_id`),
  KEY `fk_stylesheet_log_user_idx` (`user`),
  KEY `fk_stylesheet_log_ss` (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=191 ;

--
-- Dumping data for table `stylesheet_log`
--

INSERT INTO `stylesheet_log` (`ss_log_id`, `ss_id`, `action_time_stamp`, `action_type`, `action_comment`, `user`) VALUES
(184, 34, '2014-11-30 20:15:46', 'create', 'create stylesheet', 1),
(185, 34, '2014-11-30 20:15:56', 'create', 'Uploaded image Screenshot from 2014-09-18 14:12:17.png for stylesheet GPJ/T-03', 1),
(186, 34, '2014-11-30 20:16:23', 'create', 'create stylesheet bom item #22', 1),
(187, 35, '2014-11-30 20:28:22', 'create', 'create stylesheet', 5),
(188, 35, '2014-11-30 20:28:25', 'create', 'Uploaded image crop.png for stylesheet ASSUM/15', 5),
(189, 35, '2014-11-30 20:28:51', 'create', 'create stylesheet bom item #23', 5),
(190, 35, '2014-11-30 20:29:00', 'create', 'Add an existing Color: RD    00', 5);

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `fk_bom_bs` FOREIGN KEY (`bs_id`) REFERENCES `bomsheet` (`bs_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bom_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet_bom` (`ss_bom_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `bom_log`
--
ALTER TABLE `bom_log`
  ADD CONSTRAINT `fk_bomsheet_log_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bomsheet_log` FOREIGN KEY (`bs_id`) REFERENCES `bomsheet` (`bs_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `color_code`
--
ALTER TABLE `color_code`
  ADD CONSTRAINT `fk_color_code_color` FOREIGN KEY (`color`) REFERENCES `color` (`color_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `DCS_size_scale`
--
ALTER TABLE `DCS_size_scale`
  ADD CONSTRAINT `fk_DCS_size_scale_size` FOREIGN KEY (`size_scale`) REFERENCES `size` (`scale_number`) ON DELETE CASCADE;

--
-- Constraints for table `group_operations`
--
ALTER TABLE `group_operations`
  ADD CONSTRAINT `fk_group_privileges_grp` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `group_operations_ibfk_1` FOREIGN KEY (`responsibility`) REFERENCES `operation` (`op_name`);

--
-- Constraints for table `marker`
--
ALTER TABLE `marker`
  ADD CONSTRAINT `fk_marker_owner` FOREIGN KEY (`owner`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_marker_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `marker_log`
--
ALTER TABLE `marker_log`
  ADD CONSTRAINT `fk_marker_log` FOREIGN KEY (`marker_id`) REFERENCES `marker` (`marker_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_marker_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ss_size_qty`
--
ALTER TABLE `ss_size_qty`
  ADD CONSTRAINT `fk_bomsheet_sizeqty` FOREIGN KEY (`bs_id`) REFERENCES `bomsheet` (`bs_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet`
--
ALTER TABLE `stylesheet`
  ADD CONSTRAINT `fk_ss_scale_sizes` FOREIGN KEY (`scale`) REFERENCES `size` (`scale_number`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet_bom`
--
ALTER TABLE `stylesheet_bom`
  ADD CONSTRAINT `fk_ss_bom_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stylesheet_bom_color` FOREIGN KEY (`item_color_id`) REFERENCES `color_code` (`color_code`) ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet_color`
--
ALTER TABLE `stylesheet_color`
  ADD CONSTRAINT `fk_stylesheet_color_color` FOREIGN KEY (`color_code`) REFERENCES `color_code` (`color_code`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stylesheet_color_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet_images`
--
ALTER TABLE `stylesheet_images`
  ADD CONSTRAINT `fk_stylesheet_images_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet_log`
--
ALTER TABLE `stylesheet_log`
  ADD CONSTRAINT `fk_stylesheet_log_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stylesheet_log_user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_users_group` FOREIGN KEY (`user_group`) REFERENCES `group` (`group_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
