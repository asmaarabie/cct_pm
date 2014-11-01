-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 01, 2014 at 02:25 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ribom`
--

-- --------------------------------------------------------

--
-- Table structure for table `bom`
--

CREATE TABLE IF NOT EXISTS `bom` (
  `bom_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `item_desc` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `item_placement` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `fulldept` char(9) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_consumption` char(10) CHARACTER SET utf8 NOT NULL,
  `item_increase` int(11) NOT NULL DEFAULT '0',
  `pono` int(11) DEFAULT NULL,
  `countryid` char(5) NOT NULL,
  `itemno` int(11) NOT NULL,
  PRIMARY KEY (`bom_id`),
  KEY `fk_bom_ss` (`ss_id`),
  KEY `fk_bom_pono_idx` (`pono`),
  KEY `fk_bom_country_idx` (`countryid`),
  KEY `fk_bom_item_idx` (`itemno`),
  KEY `pono` (`pono`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `bom`
--

INSERT INTO `bom` (`bom_id`, `ss_id`, `item_desc`, `item_placement`, `fulldept`, `item_qty`, `item_consumption`, `item_increase`, `pono`, `countryid`, `itemno`) VALUES
(4, 1, 'الجسم', 'مثل العينة المطلوبة', 'C111  BZ1', 660, '1.23', 0, 20, '2', 4175),
(6, 1, 'الجسم', 'ON', 'C111  BZ1', 660, '12', 0, 20, '2', 4174);

-- --------------------------------------------------------

--
-- Table structure for table `bom_log`
--

CREATE TABLE IF NOT EXISTS `bom_log` (
  `bom_log_id` int(11) NOT NULL,
  `bom_id` int(11) NOT NULL,
  `action_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(10) DEFAULT NULL,
  `action_comment` text CHARACTER SET utf8,
  PRIMARY KEY (`bom_log_id`),
  KEY `bom_log_id` (`bom_log_id`),
  KEY `bom_id` (`bom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Dumping data for table `color`
--

INSERT INTO `color` (`color_id`, `color_desc_a`, `color_img`, `color_desc_e`) VALUES
('BL', 'أسود', 'black.png', 'Black'),
('OR', 'برتقالي تكساس', 'orange.png', 'Texas Orange'),
('W', 'أبيض', 'crop.png', 'White');

-- --------------------------------------------------------

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
('BL', 'L', 'E', 'S', 'S', '00', 'BLLESS00'),
('BL', 'L', 'E', 'S', 'S', '02', 'BLLESS02'),
('BL', 'L', 'E', 'S', 'S', '03', 'BLLESS03'),
('BL', 'L', 'E', 'S', 'S', '04', 'BLLESS04'),
('BL', 'L', 'T', 'S', 'S', '00', 'BLLTSS00'),
('OR', 'L', 'E', 'S', 'S', '00', 'ORLESS00'),
('OR', 'L', 'E', 'S', 'S', '01', 'ORLESS01'),
('OR', 'L', 'E', 'S', 'S', '02', 'ORLESS02'),
('OR', 'L', 'T', 'S', 'S', '00', 'ORLTSS00'),
('OR', 'L', 'T', 'S', 'S', '01', 'ORLTSS01'),
('W', 'L', 'E', 'S', 'S', '00', 'W-LESS00'),
('W', 'L', 'E', 'S', 'S', '01', 'W-LESS01'),
('W', 'L', 'E', 'S', 'S', '02', 'W-LESS02'),
('W', 'L', 'E', 'S', 'S', '03', 'W-LESS03'),
('W', 'L', 'T', 'S', 'S', '00', 'W-LTSS00');

-- --------------------------------------------------------

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
-- Dumping data for table `color_length`
--

INSERT INTO `color_length` (`color_length`, `length_desc_e`, `length_desc_a`) VALUES
('S', 'Suit Drop Small', 'تخطيط البدلة ضيق');

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

--
-- Dumping data for table `color_pattern`
--

INSERT INTO `color_pattern` (`color_pattern`, `pattern_desc_e`, `pattern_desc_a`) VALUES
('E', 'Embroidered', 'مطرز'),
('T', 'Tapestry', 'نسيج مزدان بالرسوم والصور');

-- --------------------------------------------------------

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
-- Dumping data for table `color_shadow`
--

INSERT INTO `color_shadow` (`color_shadow`, `shadow_desc_a`, `shadow_desc_e`) VALUES
('L', 'فاتح', 'Light');

-- --------------------------------------------------------

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
-- Dumping data for table `color_shape`
--

INSERT INTO `color_shape` (`color_shape`, `shape_desc_e`, `shape_desc_a`) VALUES
('S', 'Small', 'صغير');

-- --------------------------------------------------------

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
-- Table structure for table `DCS_name`
--

CREATE TABLE IF NOT EXISTS `DCS_name` (
  `dcs_id` int(11) NOT NULL AUTO_INCREMENT,
  `fulldept` char(9) NOT NULL,
  `country_id` char(5) NOT NULL,
  `dcs_name` char(40) NOT NULL,
  PRIMARY KEY (`dcs_id`),
  KEY `fk_DCS_name_country_idx` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2195 ;

--
-- Dumping data for table `DCS_name`
--

INSERT INTO `DCS_name` (`dcs_id`, `fulldept`, `country_id`, `dcs_name`) VALUES
(1, 'C111  BZ2', '2', 'MF S.BREAST BLAZER'),
(3, 'C111  BZ4', '2', '4BT S.BRST BLAZER'),
(4, 'C111  BZ5', '2', 'MIX & MATCH, CLASSIC, BLAZER'),
(5, 'C111  BZ8', '2', 'FASHION  BLAZER  M F'),
(6, 'C111  BZ9', '2', 'MF 2PC BLAZER'),
(7, 'C111  BZV', '2', 'MF D.BREAST BLAZER'),
(8, 'C111  CV1', '2', 'COVAR COAT'),
(9, 'C111  PJ0', '2', 'PAJAMA'),
(10, 'C111  PT0', '2', 'PANT'),
(11, 'C111  SH0', '2', 'SHIRT'),
(12, 'C111  SH1', '2', 'L/S SOLIDSHIRT'),
(13, 'C111  SH2', '2', 'L/S  PRINT SHIRT'),
(14, 'C111  SH3', '2', 'S/S SOLIDSHIRT'),
(15, 'C111  SH4', '2', 'S/S  PRINT SHIRT'),
(16, 'C111  SH5', '2', 'L/S SOLIDSHIRT CUFFLINKS'),
(17, 'C111  SH6', '2', 'MF L/S REG.CLASSIC SHIRT'),
(18, 'C111  SH7', '2', 'MF S/S REG.CLASSIC SHIRT'),
(19, 'C111  SH8', '2', 'MF L/S FSH.CLASSIC SHIRT'),
(20, 'C111  SH9', '2', 'MF S/S FSH.CLASSIC SHIRT'),
(21, 'C111  SU1', '2', 'MF 2PC D.BREAST SUIT'),
(22, 'C111  SU2', '2', 'MF 2PC S.BREAST SUIT'),
(23, 'C111  SU3', '2', '2BT S.BRST 1PLEAT SUIT'),
(24, 'C111  SU4', '2', '2BT S.BRST F.FRNT SUIT'),
(25, 'C111  SU5', '2', 'MF 3PC D.BREAST SUIT'),
(26, 'C111  SU6', '2', 'MF 3PC S.BREAST SUIT'),
(27, 'C111  SU8', '2', 'SUIT'),
(28, 'C111  SUV', '2', 'MF 3PC D.BREAST SUIT'),
(29, 'C111  TE0', '2', 'T-SHIRT'),
(30, 'C111  TR5', '2', 'MIX & MATCH TROUSERS'),
(31, 'C111  VS1', '2', 'MF D.BREAST VEST'),
(32, 'C111  VS2', '2', 'MF S.BREAST VEST'),
(33, 'C112  TR1', '2', 'MF 2PLEATTROUSER'),
(34, 'C112  TR2', '2', 'MF 1PLEATTROUSER'),
(35, 'C112  TR3', '2', 'MF F.FRNTTROUSER'),
(36, 'C112  TR4', '2', 'MF FASHION TROUSER'),
(37, 'C112  TR5', '2', 'MIX & MATCH TROUSERS'),
(38, 'C113  CT1', '2', 'MF S.BREAST REG COAT'),
(39, 'C113  CT2', '2', 'MF S.BREAST LNG COAT'),
(40, 'C113  CT3', '2', 'MF D.BREAST REG COAT'),
(41, 'C113  CT4', '2', 'MF D.BREAST LNG COAT'),
(42, 'C116  BG1', '2', 'MF BAG'),
(43, 'C116  BT1', '2', 'MF BELT'),
(44, 'C116  BT3', '2', 'MF Classic BELT'),
(45, 'C116  CB1', '2', 'MC TIE BAR'),
(46, 'C116  CL1', '2', 'METAL CUFFLINK'),
(47, 'C116  CV1', '2', 'COVAR COAT'),
(48, 'C116  GV2', '2', 'LEATHER GLOVE'),
(49, 'C116  HA1', '2', 'HA1'),
(50, 'C116  HK1', '2', 'MF HANDKERCHIEF'),
(51, 'C116  HN1', '2', 'Chandler'),
(52, 'C116  LR1', '2', 'LR1'),
(53, 'C116  OTH', '2', 'MF Others'),
(54, 'C116  RL1', '2', 'RUBBER LINK'),
(55, 'C116  S01', '2', 'SO1'),
(56, 'C116  SC1', '2', 'Regular length'),
(57, 'C116  SO2', '2', 'LEATHER SHOES'),
(58, 'C116  SV1', '2', 'MF SUIT COVER'),
(59, 'C116  TB1', '2', 'MC TIE BAR'),
(60, 'C116  TY1', '2', 'MF TIE'),
(61, 'C117  SO1', '2', 'MF SHOES'),
(62, 'C121  PL1', '2', 'MC BASIC LT.PULLOVER'),
(63, 'C121  PL2', '2', 'MC FASHION LT.PULLOVER'),
(64, 'C121  PL3', '2', 'MC REG HVY.PULLOVER'),
(65, 'C121  PL4', '2', 'MC FSH. HVY.PULLOVER'),
(66, 'C121  PL5', '2', 'MC BTN FRNT PULLOVER'),
(67, 'C121  PL6', '2', 'MC ZIP FRNT PULLOVER'),
(68, 'C121  PL8', '2', 'MC FIT TIGHT PULLOVER'),
(69, 'C121  SH1', '2', 'MC L/S SLD SAFARI SHIRT'),
(70, 'C121  SH2', '2', 'MC L/S Y/D & PRINT SHIRT'),
(71, 'C121  SH3', '2', 'MC S/S SLD SAFARI SHIRT'),
(72, 'C121  SH4', '2', 'MC S/S Y/D & PRINT SHIRT'),
(73, 'C121  SH5', '2', 'MC OVERSHIRT'),
(74, 'C121  SH6', '2', 'MC LS REGSHIRT'),
(75, 'C121  SH7', '2', 'MC SS REGSHIRT'),
(76, 'C121  SW1', '2', 'MC POLO SWEATSHIRT'),
(77, 'C121  SW2', '2', 'MC REG. SWEATSHIRT'),
(78, 'C121  SW3', '2', 'MC FSH SWEATSHIRT'),
(79, 'C121  SW4', '2', 'MC BTN FRNT SWEATSHIRT'),
(80, 'C121  SW5', '2', 'MC ZIP FRNT SWEATSHIRT'),
(81, 'C121  SW7', '2', 'MC FIT TIGHT SWEATSHIRT'),
(82, 'C121  SW9', '2', 'MC TRAINING TOP SWEATSHIRT'),
(83, 'C121  TE1', '2', 'MC S/S T-SHIRT'),
(84, 'C121  TE2', '2', 'MC S/S POLO T-SHIRT'),
(85, 'C121  TE3', '2', 'MC S/S FITTED T-SHIRT'),
(86, 'C121  TE4', '2', 'MC TANK TOP T-SHIRT'),
(87, 'C121  TE5', '2', 'MC L/S T-SHIRT'),
(88, 'C121  TE6', '2', 'MC L/S POLO T-SHIRT'),
(89, 'C121  TE7', '2', 'MC L/S FITTED T-SHIRT'),
(90, 'C121  TE8', '2', 'MEN TRAINING TOP'),
(91, 'C121  TE9', '2', 'MC SLEEVLESS T-SHIRT'),
(92, 'C121  VS5', '2', 'MC TRICOTE VEST'),
(93, 'C122  PT1', '2', 'MC REGULAR CHINO PANT'),
(94, 'C122  PT2', '2', 'MC PULLONPANT'),
(95, 'C122  PT3', '2', 'MC FASHION PANT'),
(96, 'C122  PT4', '2', 'MC 5 POCKET PANT'),
(97, 'C122  PT5', '2', 'MC REGULAR SEMI CLASSIC PANT'),
(98, 'C122  PT6', '2', 'MC FASHION SEMI CLASSIC PANT'),
(99, 'C122  PT9', '2', 'MC TRAINING PANT'),
(101, 'C122  SM1', '2', 'MC SWIMWEAR'),
(102, 'C122  SR1', '2', 'MC BASIC SHORT'),
(103, 'C122  SR2', '2', 'MC PULLONSHORT'),
(104, 'C122  SR3', '2', 'MC FASHION SHORT'),
(105, 'C122  SR4', '2', 'MC PERMUDA SHORT'),
(106, 'C122  SR5', '2', 'MC 5 POCKET SHORT'),
(107, 'C122  SR9', '2', 'MC TRAINING SHORT'),
(108, 'C123  HT1', '2', 'HAT'),
(109, 'C123  JK1', '2', 'MC BASIC JACKET'),
(110, 'C123  JK2', '2', 'MC FASHION JACKET'),
(111, 'C123  JK5', '2', 'MC PARKA JACKET'),
(112, 'C123  JK9', '2', 'MC LEATHER JACKET'),
(113, 'C123  SM1', '2', 'MC SMWR. 1 Piece'),
(114, 'C123  SM3', '2', 'KGC SMWR.ONE PCS.SHORT'),
(115, 'C123  TE1', '2', 'S/S T-SHIRT'),
(116, 'C123  TE9', '2', 'SLVLES T.SHIRT'),
(117, 'C123  VS3', '2', 'MC BASIC VEST'),
(118, 'C123  VS4', '2', 'MC SAFARIVEST'),
(119, 'C124  BX1', '2', 'MC REGULAR BOXER'),
(120, 'C124  BX2', '2', 'MC FITTEDBOXER'),
(121, 'C124  BX6', '2', 'MC Uware'),
(122, 'C124  SP1', '2', 'MC REGULAR SLIP'),
(123, 'C124  TE1', '2', 'MC S/S T-SHIRT'),
(124, 'C124  TE2', '2', 'MC SS POLO T-SHIRT'),
(125, 'C124  TE4', '2', 'MC TANK TOP T-SHIRT'),
(126, 'C124  TE5', '2', 'MC LS T-SHIRT'),
(127, 'C124  TE6', '2', 'MC LS POLO T-SHIRT'),
(128, 'C124  TE9', '2', 'MC NS T-SHIRT'),
(129, 'C126  BG1', '2', 'BG1'),
(130, 'C126  BSK', '2', 'BASKET'),
(131, 'C126  BT1', '2', 'MC BELT'),
(132, 'C126  BT2', '2', 'WOVEN BELT'),
(133, 'C126  BT4', '2', 'MC CasualBELT'),
(134, 'C126  BT5', '2', 'MC Jeans BELT'),
(135, 'C126  EW1', '2', 'EW1'),
(136, 'C126  FL1', '2', 'Flash Memory'),
(137, 'C126  GV1', '2', 'MEN TRICOT GLOVE'),
(138, 'C126  GV2', '2', 'MC TRICOTE GLOVE'),
(139, 'C126  HN1', '2', 'Chandler'),
(140, 'C126  HT1', '2', 'MEN HAT'),
(141, 'C126  HT2', '2', 'ITALIAN HAT'),
(142, 'C126  IC1', '2', 'MC ICE CAP'),
(143, 'C126  KC1', '2', 'KC1'),
(144, 'C126  LR1', '2', 'LR1'),
(145, 'C126  MDL', '2', 'CONCRETE MEDAL'),
(146, 'C126  MNQ', '2', 'MEN MANNEQUIN'),
(147, 'C126  OTH', '2', 'MC Others'),
(148, 'C126  PJ5', '2', 'PAJAMA TOP'),
(149, 'C126  PJ6', '2', 'PAJAMA BOTTOM'),
(150, 'C126  PJ7', '2', 'PAJAMA BOTTOM SHORT'),
(151, 'C126  PJ8', '2', 'PAJAMA 2 PIECES'),
(152, 'C126  SC1', '2', 'Regular length'),
(153, 'C126  SC2', '2', 'SOCKS'),
(154, 'C126  SC3', '2', 'ANKLE'),
(155, 'C126  SF1', '2', 'MC SCARF'),
(156, 'C126  SL1', '2', 'SL1'),
(157, 'C126  SO1', '2', 'SO1'),
(158, 'C126  WB1', '2', 'MC Wrist Band'),
(159, 'C126  WL1', '2', 'LEATHER WALLET'),
(160, 'C126  WT1', '2', 'WT1'),
(161, 'C211  SH0', '2', 'SHIRT'),
(162, 'C221  JK2', '2', 'KBC FASHION JACKET'),
(163, 'C221  PL1', '2', 'JBC BSC LT. PULLOVER'),
(164, 'C221  PL2', '2', 'JBC FASHION LT. PULLOVER'),
(165, 'C221  PL3', '2', 'JBC REG HVY. PULLOVER'),
(166, 'C221  PL4', '2', 'JBC FSH.HVY.PULLOVER'),
(167, 'C221  PL5', '2', 'JBC BTN FRNT PULLOVER'),
(168, 'C221  PL6', '2', 'JBC ZIP FRNT PULLOVER'),
(169, 'C221  PL8', '2', 'JBC FIT TIGHT PULLOVER'),
(170, 'C221  SH1', '2', 'JBC L/S SLD SAFARI SHIRT'),
(171, 'C221  SH2', '2', 'JBC L/S Y/D & PRINTSHIRT'),
(172, 'C221  SH3', '2', 'JBC S/S SLD SAFARI SHIRT'),
(173, 'C221  SH4', '2', 'JBC S/S Y/D & PRINTSHIRT'),
(174, 'C221  SH5', '2', 'JBC OVERSHIRT'),
(175, 'C221  SH7', '2', 'JBC SS REG SHIRT'),
(176, 'C221  SH8', '2', 'JBC LS FSH SHIRT'),
(177, 'C221  SW1', '2', 'JBC POLO SWEATSHIRT'),
(178, 'C221  SW2', '2', 'JBC REG. SWEATSHIRT'),
(179, 'C221  SW3', '2', 'JBC FSH SWEATSHIRT'),
(180, 'C221  SW4', '2', 'JBC BTN FRNT SWEATSHIRT'),
(181, 'C221  SW5', '2', 'JBC ZIP FRNT SWEATSHIRT'),
(182, 'C221  SW7', '2', 'JBC FIT TIGHT SWEATSHIRT'),
(183, 'C221  SW9', '2', 'JBC TRAINING TOP SWEATSHIRT'),
(184, 'C221  TE1', '2', 'JBC S/S T-SHIRT'),
(185, 'C221  TE2', '2', 'JBC S/S POLO T-SHIRT'),
(186, 'C221  TE3', '2', 'JBC S/S FITTED T-SHIRT'),
(187, 'C221  TE4', '2', 'JBC TANK TOP T-SHIRT'),
(188, 'C221  TE5', '2', 'JBC L/S T-SHIRT'),
(189, 'C221  TE6', '2', 'JBC L/S POLO T-SHIRT'),
(190, 'C221  TE7', '2', 'JBC L/S FITTED T-SHIRT'),
(191, 'C221  TE8', '2', 'JBC TRAINING TOP'),
(192, 'C221  TE9', '2', 'JBC SLEEVLESS T-SHIRT'),
(193, 'C221  VS3', '2', 'JBC BASICVEST'),
(194, 'C221  VS5', '2', 'JBC TRICOTE VEST'),
(195, 'C222  PT1', '2', 'JBC REGULAR CHINO PANT'),
(196, 'C222  PT2', '2', 'JBC PULLON PANT'),
(197, 'C222  PT3', '2', 'JBC FASHION PANT'),
(198, 'C222  PT4', '2', 'JBC 5 POCKET PANT'),
(199, 'C222  PT9', '2', 'JBC TRAINING PANT'),
(200, 'C222  SAM', '2', 'SAMPLE'),
(201, 'C222  SM1', '2', 'JBC SWIMWEAR'),
(202, 'C222  SM9', '2', 'JBC Btm'),
(203, 'C222  SR1', '2', 'JBC BASICSHORT'),
(204, 'C222  SR2', '2', 'JBC PULLON SHORT'),
(205, 'C222  SR3', '2', 'JBC FASHION SHORT'),
(206, 'C222  SR4', '2', 'JBC PERMUDA SHORT'),
(207, 'C222  SR5', '2', 'JBC 5 POCKET SHORT'),
(208, 'C222  SR9', '2', 'JBC TRAINING SHORT'),
(209, 'C222  ST1', '2', 'JBC SALOPPETTE SHORT'),
(210, 'C222  ST2', '2', 'JBC SALOPPETTE PANT'),
(211, 'C223  HT1', '2', 'HAT'),
(212, 'C223  JK1', '2', 'JBC BASICJACKET'),
(213, 'C223  JK2', '2', 'JBC FASHION JACKET'),
(214, 'C223  JK5', '2', 'JBC PARKAJACKET'),
(215, 'C223  JK6', '2', 'JBC JACKET'),
(216, 'C223  JK9', '2', 'JBC LEATHER JACKET'),
(217, 'C223  SM1', '2', 'JBC SMWR.1 Piece'),
(218, 'C223  SW7', '2', 'JBC BODY SWEATSHIRT'),
(219, 'C223  TE1', '2', 'JBC S/S T-SHIRT'),
(220, 'C223  TE9', '2', 'MC SLEEVLESS T-SHIRT'),
(221, 'C223  VS4', '2', 'JBC  SAFARI VEST'),
(222, 'C224  BX1', '2', 'JBC REGULAR BOXER'),
(223, 'C224  BX2', '2', 'JBC FITTED BOXER'),
(224, 'C224  TE1', '2', 'JBC S/S T-SHIRT'),
(225, 'C224  TE4', '2', 'JBC TANK TOP T-SHIRT'),
(226, 'C224  TE5', '2', 'JBC L/S UNDERSHIRT'),
(227, 'C224  TE9', '2', 'JBC NS T-SHIRT'),
(228, 'C226  BG1', '2', 'JGC BAG'),
(229, 'C226  BG2', '2', 'JB BAG'),
(230, 'C226  BT1', '2', 'JBC BELT'),
(231, 'C226  BT2', '2', 'JBC WOVENBELT'),
(232, 'C226  BT4', '2', 'JB CasualBELT'),
(233, 'C226  BT5', '2', 'JB Jeans BELT'),
(234, 'C226  GV1', '2', 'JBC  TRICOTE GLOVE'),
(235, 'C226  HN1', '2', 'Chandler'),
(236, 'C226  HT1', '2', 'JBC HAT'),
(237, 'C226  HT2', '2', 'ITALIAN HAT'),
(238, 'C226  IC1', '2', 'JBC ICE CAP'),
(239, 'C226  OTH', '2', 'JBC Others'),
(240, 'C226  PJ5', '2', 'PAJAMA TOP'),
(241, 'C226  PJ6', '2', 'PAJAMA BOTTOM PANNT'),
(242, 'C226  PJ7', '2', 'PAJAMA BOTTOM SHORT'),
(243, 'C226  SC1', '2', 'Regular length'),
(244, 'C226  SC2', '2', 'Medium Length'),
(245, 'C226  SC3', '2', 'ankle'),
(246, 'C226  SF1', '2', 'JBC SCARF'),
(247, 'C226  SL1', '2', 'JBC SLIPPER'),
(248, 'C226  SO1', '2', 'SHOES'),
(249, 'C227  SL1', '2', 'JBC SLIPPERS'),
(250, 'C311  JK0', '2', 'JACKET'),
(251, 'C311  PT0', '2', 'PANT'),
(252, 'C311  SH0', '2', 'SHIRT'),
(253, 'C311  SR0', '2', 'SHORT'),
(254, 'C311  ST0', '2', 'SALOPPETTE'),
(255, 'C311  SW0', '2', 'SWEATSHIRT'),
(256, 'C311  TE0', '2', 'T-SHIRT'),
(257, 'C321  C32', '2', 'KBC TRICOTE VEST'),
(258, 'C321  JK2', '2', 'KBC FASHION JACKET'),
(259, 'C321  PL1', '2', 'KBC BSC LT. PULLOVER'),
(260, 'C321  PL2', '2', 'KBC FASHION LT. PULLOVER'),
(261, 'C321  PL3', '2', 'KBC REG HVY. PULLOVER'),
(262, 'C321  PL4', '2', 'KBC FSH.HVY.PULLOVER'),
(263, 'C321  PL5', '2', 'KBC BTN FRNT PULLOVER'),
(264, 'C321  PL6', '2', 'KBC ZIP FRNT PULLOVER'),
(265, 'C321  PL8', '2', 'KBC FIT TIGHT PULLOVER'),
(266, 'C321  SH1', '2', 'KBC L/S SLD SAFARI SHIRT'),
(267, 'C321  SH2', '2', 'KBC L/S Y/D & PRINTSHIRT'),
(268, 'C321  SH3', '2', 'KBC S/S SLD SAFARI SHIRT'),
(269, 'C321  SH4', '2', 'KBC S/S Y/D & PRINTSHIRT'),
(270, 'C321  SH5', '2', 'KBC OVERSHIRT'),
(271, 'C321  SH7', '2', 'KBC SS REG SHIRT'),
(272, 'C321  SH8', '2', 'KBC LS FSH SHIRT'),
(273, 'C321  SW1', '2', 'KBC POLO SWEATSHIRT'),
(274, 'C321  SW2', '2', 'KBC REG. SWEATSHIRT'),
(275, 'C321  SW3', '2', 'KBC FSH SWEATSHIRT'),
(276, 'C321  SW4', '2', 'KBC BTN FRNT SWEATSHIRT'),
(277, 'C321  SW5', '2', 'KBC ZIP FRNT SWEATSHIRT'),
(278, 'C321  SW7', '2', 'KBC FIT TIGHT SWEATSHIRT'),
(279, 'C321  SW9', '2', 'KBC TRAINING TOP SWEATSHIRT'),
(280, 'C321  TE1', '2', 'KBC S/S T-SHIRT'),
(281, 'C321  TE2', '2', 'KBC S/S POLO T-SHIRT'),
(282, 'C321  TE3', '2', 'KBC S/S FITTED T-SHIRT'),
(283, 'C321  TE4', '2', 'KBC TANK TOP T-SHIRT'),
(284, 'C321  TE5', '2', 'KBC L/S T-SHIRT'),
(285, 'C321  TE6', '2', 'KBC L/S POLO T-SHIRT'),
(286, 'C321  TE7', '2', 'KBC L/S FITTED T-SHIRT'),
(287, 'C321  TE8', '2', 'KBC TRAINING TOP'),
(288, 'C321  TE9', '2', 'KBC SLEEVLESS T-SHIRT'),
(289, 'C321  VS3', '2', 'KBC BASICVEST'),
(290, 'C321  VS5', '2', 'KBC TRICOTE VEST'),
(291, 'C322  PT1', '2', 'KBC REGULAR CHINO PANT'),
(292, 'C322  PT2', '2', 'KBC PULLON PANT'),
(293, 'C322  PT3', '2', 'KBC FASHION PANT'),
(294, 'C322  PT4', '2', 'KBC 5 POCKET PANT'),
(295, 'C322  PT9', '2', 'KBC TRAINING PANT'),
(296, 'C322  SM1', '2', 'KBC SWIMWEAR'),
(297, 'C322  SM9', '2', 'KBC SWIMWEAR'),
(298, 'C322  SR1', '2', 'KBC BASICSHORT'),
(299, 'C322  SR2', '2', 'KBC PULLON SHORT'),
(300, 'C322  SR3', '2', 'KBC FASHION SHORT'),
(301, 'C322  SR4', '2', 'KBC PERMUDA SHORT'),
(302, 'C322  SR5', '2', 'KBC 5 POCKET SHORT'),
(303, 'C322  SR9', '2', 'KBC TRAINING SHORT'),
(304, 'C322  ST1', '2', 'KBC SALOPPETTE SHORT'),
(305, 'C322  ST2', '2', 'KBC SALOPPETTE PANT'),
(306, 'C323  HT1', '2', 'HAT'),
(307, 'C323  JK1', '2', 'KBC BASICJACKET'),
(308, 'C323  JK2', '2', 'KBC FASHION JACKET'),
(309, 'C323  JK5', '2', 'KBC PARKAJACKET'),
(310, 'C323  JK6', '2', 'KBC Jacket'),
(311, 'C323  JK9', '2', 'KBC LEATHER JACKET'),
(312, 'C323  SM1', '2', 'KBC SMWR.1 Piece'),
(313, 'C323  SW7', '2', 'KBC BODY SWEATSHIRT'),
(314, 'C323  TE1', '2', 'KBC S/S T-SHIRT'),
(315, 'C323  TE9', '2', 'MC SLEEVLESS T-SHIRT'),
(316, 'C324  BX1', '2', 'KBC REGULAR BOXER'),
(317, 'C324  BX2', '2', 'KBC  FITTED BOXER'),
(318, 'C324  TE1', '2', 'KBC S/S T-SHIRT'),
(319, 'C324  TE4', '2', 'KBC TANK TOP T-SHIRT'),
(320, 'C324  TE5', '2', 'KBC L/S T.SHIRT'),
(321, 'C324  TE9', '2', 'KBC NS T-SHIRT'),
(322, 'C325  SC5', '2', 'KBC HOME SOCKS'),
(323, 'C326  BG1', '2', 'JGC BAG'),
(324, 'C326  BG2', '2', 'JB BAG'),
(325, 'C326  BT1', '2', 'KBC BELT'),
(326, 'C326  BT2', '2', 'JBC WOVENBELT'),
(327, 'C326  BT4', '2', 'KB CasualBELT'),
(328, 'C326  BT5', '2', 'KB Jeans BELT'),
(329, 'C326  GV1', '2', 'KBC  TRICOTE GLOVE'),
(330, 'C326  HN1', '2', 'Chandler'),
(331, 'C326  HT1', '2', 'KBC HAT'),
(332, 'C326  HT2', '2', 'ITALIAN HAT'),
(333, 'C326  IC1', '2', 'KBC ICE CAP'),
(334, 'C326  MNQ', '2', 'BOYS MANNEQUIN'),
(335, 'C326  OTH', '2', 'KBC Others'),
(336, 'C326  PJ5', '2', 'PAJAMA TOP'),
(337, 'C326  PJ6', '2', 'PAJAMA BOTTOM PANNT'),
(338, 'C326  PJ7', '2', 'PAJAMA BOTTOM SHORT'),
(339, 'C326  SC1', '2', 'Regular length'),
(340, 'C326  SC2', '2', 'Medium Length'),
(341, 'C326  SC3', '2', 'SOCKS'),
(342, 'C326  SC5', '2', 'KBC SOCKS'),
(343, 'C326  SF1', '2', 'KBC SCARF'),
(344, 'C326  SL1', '2', 'KBC SLIPPER'),
(345, 'C326  SO1', '2', 'SHOSES'),
(346, 'C327  SL1', '2', 'KBC SLIPPERS'),
(347, 'C411  PT0', '2', 'Pant'),
(348, 'C411  VS0', '2', 'VEST'),
(349, 'C421  BL1', '2', 'JGC L/S BTN FRNT BLOUSE'),
(350, 'C421  BL2', '2', 'JGC S/S BTN FRNT BLOUSE'),
(351, 'C421  BL3', '2', 'JGC N/S BTN FRNT BLOUSE'),
(352, 'C421  BL4', '2', 'JGC L/S BLOUSE'),
(353, 'C421  BL5', '2', 'JGC S/S BLOUSE'),
(354, 'C421  BL6', '2', 'JGC SLEEVELESS BLOUSE'),
(355, 'C421  BL7', '2', 'JGC TANK TOP BLOUSE'),
(356, 'C421  BL9', '2', 'JGC JACKET/SET BLOUSE'),
(357, 'C421  JK2', '2', 'JGC FASHION JACKET'),
(358, 'C421  JK8', '2', 'RELATED JACKET-OVERSHIRT'),
(359, 'C421  PL1', '2', 'JGC BSC LT. PULLOVER'),
(360, 'C421  PL2', '2', 'JGC FASHION LT. PULLOVER'),
(361, 'C421  PL3', '2', 'JGC REG HVY. PULLOVER'),
(362, 'C421  PL4', '2', 'JGC FSH.HVY.PULLOVER'),
(363, 'C421  PL5', '2', 'JGC BTN FRNT PULLOVER'),
(364, 'C421  PL6', '2', 'JGC ZIP FRNT PULLOVER'),
(365, 'C421  PL7', '2', 'JGC TWIN SET LT.PULLOVER'),
(366, 'C421  PL8', '2', 'JGC FIT TIGHT PULLOVER'),
(367, 'C421  SH5', '2', 'JGC OVERSHIRT'),
(368, 'C421  SW1', '2', 'JGC POLO SWEATSHIRT'),
(369, 'C421  SW2', '2', 'JGC REG. SWEATSHIRT'),
(370, 'C421  SW3', '2', 'JGC FSH SWEATSHIRT'),
(371, 'C421  SW4', '2', 'JGC BTN FRNT SWEATSHIRT'),
(372, 'C421  SW5', '2', 'JGC ZIP FRNT SWEATSHIRT'),
(373, 'C421  SW6', '2', 'JGC TWIN SET SWEATSHIRT'),
(374, 'C421  SW7', '2', 'JGC FIT TIGHT SWEATSHIRT'),
(375, 'C421  SW9', '2', 'JGC TRAINING TOP SWEATSHIRT'),
(376, 'C421  TE1', '2', 'JGC S/S T-SHIRT'),
(377, 'C421  TE2', '2', 'JGC S/S POLO T-SHIRT'),
(378, 'C421  TE3', '2', 'JGC S/S FITTED T-SHIRT'),
(379, 'C421  TE4', '2', 'JGC TANK TOP T-SHIRT'),
(380, 'C421  TE5', '2', 'JGC L/S T-SHIRT'),
(381, 'C421  TE6', '2', 'JGC L/S POLO T-SHIRT'),
(382, 'C421  TE7', '2', 'JGC L/S FITTED T-SHIRT'),
(383, 'C421  TE8', '2', 'JGC TWIN SET T-SHIRT'),
(384, 'C421  TE9', '2', 'JGC SLEEVLESS T-SHIRT'),
(385, 'C421  VS3', '2', 'JGC REGULAR CASUAL VEST'),
(386, 'C421  VS4', '2', 'JGC  SAFARI VEST'),
(387, 'C421  VS5', '2', 'JGC TRICOTE VEST'),
(388, 'C422  DR3', '2', 'JGC  2 PICES DRESS'),
(389, 'C422  DR4', '2', 'S/S REGULAR  LNGTH DRESS'),
(390, 'C422  DR7', '2', 'JGC N/S REG DRESS'),
(391, 'C422  DR8', '2', 'NO SLV LNG DRESS'),
(392, 'C422  PT1', '2', 'JGC REGULAR CHINO PANT'),
(393, 'C422  PT2', '2', 'JGC PULLON PANT'),
(394, 'C422  PT3', '2', 'JGC FASHION PANT'),
(395, 'C422  PT4', '2', 'JGC 5 POCKET PANT'),
(396, 'C422  PT9', '2', 'JGC TRAINING PANT'),
(397, 'C422  SAM', '2', 'SAMPLE'),
(398, 'C422  SK1', '2', 'JGC REGULAR SKIRT'),
(399, 'C422  SK2', '2', 'JGC LONG SKIRT'),
(400, 'C422  SK3', '2', 'JGC SHORTSKIRT'),
(401, 'C422  SK4', '2', 'JGC SKIRT'),
(402, 'C422  SK6', '2', 'JGC REGULAR SKORT'),
(403, 'C422  SK7', '2', 'JGC LONG SKORT'),
(404, 'C422  SK8', '2', 'JGC SHORTSKORT'),
(405, 'C422  SR1', '2', 'JGC BASICSHORT'),
(406, 'C422  SR2', '2', 'JGC PULLON SHORT'),
(407, 'C422  SR3', '2', 'JGC FASHION SHORT'),
(408, 'C422  SR4', '2', 'JGC PERMUDA SHORT'),
(409, 'C422  SR5', '2', 'JGC 5 POCKET SHORT'),
(410, 'C422  SR9', '2', 'JGC TRAINING SHORT'),
(411, 'C422  ST1', '2', 'JGC SALOPPETTE SHORT'),
(412, 'C422  ST2', '2', 'JGC SALOPPETTE PANT'),
(413, 'C422  ST3', '2', 'JGC SALOPPETTE DRESS'),
(414, 'C423  CM1', '2', 'JGC CACHEMAILLOT'),
(415, 'C423  CT1', '2', 'JGC S.BREAST REG COAT'),
(416, 'C423  DR1', '2', 'JGC L/S REG DRESS'),
(417, 'C423  DR2', '2', 'JGC L/S LONG DRESS'),
(418, 'C423  DR3', '2', 'JGC L/S SHORT DRESS'),
(419, 'C423  DR4', '2', 'JGC S/S REG DRESS'),
(420, 'C423  DR5', '2', 'JGC S/S LONG DRESS'),
(421, 'C423  DR6', '2', 'JGC S/S SHORT DRESS'),
(422, 'C423  DR7', '2', 'JGC N/S REG DRESS'),
(423, 'C423  DR8', '2', 'JGC N/S LONG DRESS'),
(424, 'C423  DR9', '2', 'JGC N/S SHORT DRESS'),
(425, 'C423  HT1', '2', 'JGC HAT'),
(426, 'C423  JK1', '2', 'JGC BASICJACKET'),
(427, 'C423  JK2', '2', 'JGC FASHION JACKET'),
(428, 'C423  JK5', '2', 'JGC PARKAJACKET'),
(429, 'C423  JK9', '2', 'JGC LEATHER JACKET'),
(430, 'C423  SM1', '2', 'JGC SMWR.1 Piece'),
(431, 'C423  SM2', '2', 'JGC SMWR.2 Pieces'),
(432, 'C423  SW3', '2', 'JGC BODY SWEATSHIRT'),
(433, 'C423  SW7', '2', 'JGC BODY SWEATSHIRT'),
(434, 'C423  TE1', '2', 'JGC S/S T-SHIRT'),
(435, 'C423  TE4', '2', 'TANK TOP SEPARATE T-SHIRT'),
(436, 'C423  TE9', '2', 'KGC BASICSUSPENDER'),
(437, 'C423  VS2', '2', 'JGC S.BREAST'),
(438, 'C423  VS3', '2', 'JGC BASICVEST'),
(439, 'C424  PY1', '2', 'JGC REGULAR PANTY'),
(440, 'C424  PY2', '2', 'JGC BIKINI PANTY'),
(441, 'C424  PY9', '2', 'JGC Uware'),
(442, 'C424  TE1', '2', 'JGC S/S T-SHIRT'),
(443, 'C424  TE2', '2', 'JGC SS POLO T-SHIRT'),
(444, 'C424  TE4', '2', 'JGC TANK TOP T-SHIRT'),
(445, 'C424  TE9', '2', 'JGC SLEEVLESS T-SHIRT'),
(446, 'C426  BD1', '2', 'SQUARED BANDANA'),
(447, 'C426  BD2', '2', 'SQUARED BANDANA'),
(448, 'C426  BG1', '2', 'JGC BAG'),
(449, 'C426  BG2', '2', 'JB BAG'),
(450, 'C426  BT1', '2', 'JGC BELT'),
(451, 'C426  BT2', '2', 'JGC NO BUCKLE BELT'),
(452, 'C426  BT4', '2', 'JG CasualBELT'),
(453, 'C426  BT5', '2', 'JG Jeans BELT'),
(454, 'C426  GV1', '2', 'KIDS TRICOT GLOVE'),
(455, 'C426  HA1', '2', 'HAIR HOOP'),
(456, 'C426  HA2', '2', 'HAIR CHOUCHOU'),
(457, 'C426  HN1', '2', 'Chandler'),
(458, 'C426  HT1', '2', 'JGC HAT'),
(459, 'C426  HT3', '2', 'JGC Sun HAT'),
(460, 'C426  HT5', '2', 'JGC Sun HAT'),
(461, 'C426  IC1', '2', 'JGC ICE CAP'),
(462, 'C426  OTH', '2', 'JGC Others'),
(463, 'C426  PJ5', '2', 'PAJAMA TOP'),
(464, 'C426  PJ6', '2', 'PAJAMA BOTTOM PANNT'),
(465, 'C426  PJ7', '2', 'PAJAMA BOTTOM SHORT'),
(466, 'C426  PN1', '2', 'JGC PONCHES'),
(467, 'C426  SF1', '2', 'JGC SCARF'),
(468, 'C426  SO1', '2', 'SHOSES'),
(469, 'C426  WB1', '2', 'JGC WRISTBANDS'),
(470, 'C427  SO1', '2', 'JGC SHOES'),
(471, 'C511  BL0', '2', 'BLOUSE'),
(472, 'C511  DR0', '2', 'C511  DR0'),
(473, 'C511  JK0', '2', 'JACKET'),
(474, 'C511  PT0', '2', 'PANT'),
(475, 'C511  SK0', '2', 'SKIRT'),
(476, 'C511  SR0', '2', 'Short'),
(477, 'C511  ST0', '2', 'SALOPETTE'),
(478, 'C521  BL1', '2', 'KGC L/S BTN FRNT BLOUSE'),
(479, 'C521  BL2', '2', 'KGC S/S BTN FRNT BLOUSE'),
(480, 'C521  BL3', '2', 'KGC N/S BTN FRNT BLOUSE'),
(481, 'C521  BL4', '2', 'KGC L/S BLOUSE'),
(482, 'C521  BL5', '2', 'KGC S/S BLOUSE'),
(483, 'C521  BL6', '2', 'KGC SLEEVELESS BLOUSE'),
(484, 'C521  BL7', '2', 'KGC TANK TOP BLOUSE'),
(485, 'C521  BL9', '2', 'KGC JACKET/SET BLOUSE'),
(486, 'C521  JK8', '2', 'RELATED JACKET-OVERSHIRT'),
(487, 'C521  PL1', '2', 'KGC BSC LT. PULLOVER'),
(488, 'C521  PL2', '2', 'KGC FASHION LT. PULLOVER'),
(489, 'C521  PL3', '2', 'KGC REG HVY. PULLOVER'),
(490, 'C521  PL4', '2', 'KGC FSH.HVY.PULLOVER'),
(491, 'C521  PL5', '2', 'KGC BTN FRNT PULLOVER'),
(492, 'C521  PL6', '2', 'KGC ZIP FRNT PULLOVER'),
(493, 'C521  PL7', '2', 'KGC TWIN SET LT.PULLOVER'),
(494, 'C521  PL8', '2', 'KGC FIT TIGHT PULLOVER'),
(495, 'C521  SH5', '2', 'KGC OVERSHIRT'),
(496, 'C521  SW1', '2', 'KGC POLO SWEATSHIRT'),
(497, 'C521  SW2', '2', 'KGC REG. SWEATSHIRT'),
(498, 'C521  SW3', '2', 'KGC FSH SWEATSHIRT'),
(499, 'C521  SW4', '2', 'KGC BTN FRNT SWEATSHIRT'),
(500, 'C521  SW5', '2', 'KGC ZIP FRNT SWEATSHIRT'),
(501, 'C521  SW6', '2', 'KGC TWIN SET SWEATSHIRT'),
(502, 'C521  SW7', '2', 'KGC FIT TIGHT SWEATSHIRT'),
(503, 'C521  SW9', '2', 'KGC TRAINING TOP SWEATSHIRT'),
(504, 'C521  TE1', '2', 'KGC S/S T-SHIRT'),
(505, 'C521  TE2', '2', 'KGC S/S POLO T-SHIRT'),
(506, 'C521  TE3', '2', 'KGC S/S FITTED T-SHIRT'),
(507, 'C521  TE4', '2', 'KGC TANK TOP T-SHIRT'),
(508, 'C521  TE5', '2', 'KGC L/S T-SHIRT'),
(509, 'C521  TE6', '2', 'KGC L/S POLO T-SHIRT'),
(510, 'C521  TE7', '2', 'KGC L/S FITTED T-SHIRT'),
(511, 'C521  TE8', '2', 'KGC TWIN SET T-SHIRT'),
(512, 'C521  TE9', '2', 'KGC SLEEVLESS T-SHIRT'),
(513, 'C521  VS3', '2', 'KGC REGULAR CASUAL VEST'),
(514, 'C521  VS5', '2', 'KGC TRICOTE VEST'),
(515, 'C522  DR3', '2', 'KGC 2 PICES DRESS'),
(516, 'C522  DR7', '2', 'KGC NS REG DRESS'),
(517, 'C522  DR8', '2', 'KGC NS LNG DRESS'),
(518, 'C522  PT1', '2', 'KGC REGULAR CHINO PANT'),
(519, 'C522  PT2', '2', 'KGC PULLON PANT'),
(520, 'C522  PT3', '2', 'KGC FASHION PANT'),
(521, 'C522  PT4', '2', 'KGC 5 POCKET PANT'),
(522, 'C522  PT9', '2', 'KGC TRAINING PANT'),
(523, 'C522  SK1', '2', 'KGC REGULAR SKIRT'),
(524, 'C522  SK2', '2', 'KGC LONG SKIRT'),
(525, 'C522  SK3', '2', 'KGC SHORTSKIRT'),
(526, 'C522  SK4', '2', 'KGC Btm'),
(527, 'C522  SK6', '2', 'KGC REGULAR SKORT'),
(528, 'C522  SK7', '2', 'KGC LONG SKORT'),
(529, 'C522  SK8', '2', 'KGC SHORTSKORT'),
(530, 'C522  SR1', '2', 'KGC BASICSHORT'),
(531, 'C522  SR2', '2', 'KGC PULLON SHORT'),
(532, 'C522  SR3', '2', 'KGC FASHION SHORT'),
(533, 'C522  SR4', '2', 'KGC PERMUDA SHORT'),
(534, 'C522  SR5', '2', 'KGC 5 POCKET SHORT'),
(535, 'C522  SR9', '2', 'KGC TRAINING SHORT'),
(536, 'C522  ST1', '2', 'KGC SALOPPETTE SHORT'),
(537, 'C522  ST2', '2', 'KGC SALOPPETTE PANT'),
(538, 'C522  ST3', '2', 'KGC SALOPPETTE DRESS'),
(539, 'C522  TE3', '2', 'KGC TANK TOP T-SHIRT'),
(540, 'C523  CM1', '2', 'KGC CACHEMAILLOT'),
(541, 'C523  CT1', '2', 'KGC S.BREAST REG COAT'),
(542, 'C523  DR1', '2', 'KGC L/S REG DRESS'),
(543, 'C523  DR2', '2', 'KGC L/S LONG DRESS'),
(544, 'C523  DR3', '2', 'KGC L/S SHORT DRESS'),
(545, 'C523  DR4', '2', 'KGC S/S REG DRESS'),
(546, 'C523  DR5', '2', 'KGC S/S LONG DRESS'),
(547, 'C523  DR6', '2', 'KGC S/S SHORT DRESS'),
(548, 'C523  DR7', '2', 'KGC N/S REG DRESS'),
(549, 'C523  DR8', '2', 'KGC N/S LONG DRESS'),
(550, 'C523  DR9', '2', 'KGC N/S SHORT DRESS'),
(551, 'C523  HT1', '2', 'KGC HAT'),
(552, 'C523  JK1', '2', 'KGC BASICJACKET'),
(553, 'C523  JK2', '2', 'KGC FASHION JACKET'),
(554, 'C523  JK5', '2', 'KGC PARKAJACKET'),
(555, 'C523  JK9', '2', 'KGC LEATHER JACKET'),
(556, 'C523  PT2', '2', 'KGC FASHION PANT'),
(557, 'C523  SM1', '2', 'KGC SMWR.1 Piece'),
(558, 'C523  SM2', '2', 'KGC SMWR.2 Pieces'),
(559, 'C523  ST1', '2', 'KGC SALOPETTE SHORT'),
(560, 'C523  SW3', '2', 'KGC BODY SWEATSHIRT'),
(561, 'C523  SW7', '2', 'KGC BODY SWEATSHIRT'),
(562, 'C523  TE1', '2', 'KGC S/S T-SHIRT'),
(563, 'C523  TE4', '2', 'TANK TOP SEPARATE T-SHIRT'),
(564, 'C523  TE9', '2', 'KGC BASICSUSPENDER'),
(565, 'C523  VS2', '2', 'KGC S.BREAST'),
(566, 'C523  VS3', '2', 'KGC BASICVEST'),
(567, 'C523  VS4', '2', 'KGC  SAFARI VEST'),
(568, 'C524  PY1', '2', 'KGC REGULAR PANTY'),
(569, 'C524  PY2', '2', 'KGC BIKINI PANTY'),
(570, 'C524  PY9', '2', 'KGC Uware'),
(571, 'C524  TE1', '2', 'KGC S/S T-SHIRT'),
(572, 'C524  TE2', '2', 'KGC SS POLO T-SHIRT'),
(573, 'C524  TE4', '2', 'KGC TANK TOP T-SHIRT'),
(574, 'C524  TE9', '2', 'KGC SLEEVLESS T-SHIRT'),
(575, 'C526  BD1', '2', 'SQUARED BANDANA'),
(576, 'C526  BD2', '2', 'SQUARED BANDANA'),
(577, 'C526  BG1', '2', 'KGC BAG'),
(578, 'C526  BG2', '2', 'JB BAG'),
(579, 'C526  BT1', '2', 'KGC BELT'),
(580, 'C526  BT2', '2', 'KGC NO BUCKLE BELT'),
(581, 'C526  BT4', '2', 'KG CasualBELT'),
(582, 'C526  BT5', '2', 'KG Jeans BELT'),
(583, 'C526  GV1', '2', 'KIDS TRICOT GLOVE'),
(584, 'C526  HA1', '2', 'HAIR HOOP'),
(585, 'C526  HA2', '2', 'HAIR CHOUCHOU'),
(586, 'C526  HN1', '2', 'Chandler'),
(587, 'C526  HT1', '2', 'KGC HAT'),
(588, 'C526  HT3', '2', 'KGC HAT'),
(589, 'C526  HT5', '2', 'KGC Sun HAT'),
(590, 'C526  IC1', '2', 'KGC ICE CAP'),
(591, 'C526  MNQ', '2', 'GIRLS MANNEQUIN'),
(592, 'C526  NL1', '2', 'NL1'),
(593, 'C526  OTH', '2', 'KGC Others'),
(594, 'C526  PJ5', '2', 'PAJAMA TOP'),
(595, 'C526  PJ6', '2', 'PAJAMA BOTTOM PANNT'),
(596, 'C526  PJ7', '2', 'PAJAMA BOTTOM SHORT'),
(597, 'C526  PN1', '2', 'KGC PONCHES'),
(598, 'C526  SC1', '2', 'REGULAR LENGTH'),
(599, 'C526  SC2', '2', 'MEDIUIM LENGTH'),
(600, 'C526  SC5', '2', 'KGC HOME SOCKS'),
(601, 'C526  SC6', '2', 'WGC SOCKS'),
(602, 'C526  SF1', '2', 'KGC SCARF'),
(603, 'C526  SO1', '2', 'SHOSES'),
(604, 'C526  WT1', '2', 'WT1'),
(605, 'C527  SO1', '2', 'KGC SHOES'),
(606, 'C626  SC6', '2', 'WGC SOCKS'),
(607, 'C626  SC7', '2', 'SOCKS'),
(608, 'C711  BL0', '2', 'BLOUSE'),
(609, 'C711  PT0', '2', 'C711  PT0'),
(610, 'C711  SH0', '2', 'SHIRT'),
(611, 'C711  SK0', '2', 'SKIRT'),
(612, 'C821  JK2', '2', 'JACKET'),
(613, 'C821  PL5', '2', 'PULLOVER'),
(614, 'C821  PL6', '2', 'BBC ZIP FRNT PULLOVER'),
(615, 'C821  SH1', '2', 'SHIRT'),
(616, 'C821  SH2', '2', 'BBC L/S SHIRT'),
(617, 'C821  SH3', '2', 'BBC S/S SLD SAFARI SHIRT'),
(618, 'C821  SH4', '2', 'BBC S/S SHIRT'),
(619, 'C821  SW3', '2', 'BBC FSH SWEATSHIRT'),
(620, 'C821  TE1', '2', 'T-SHIRT'),
(621, 'C822  PT3', '2', 'BBC (FASHION PANT)'),
(622, 'C822  SR3', '2', 'BBC (FASHION SHORT)'),
(623, 'C822  ST1', '2', 'BBC (SALLOPPETTE SHORT)'),
(624, 'C822  ST2', '2', 'SALLOPPETTE'),
(625, 'C823  JK2', '2', 'BBC FSH JACKET'),
(626, 'C826  BK1', '2', 'BLANKET'),
(627, 'C921  BL1', '2', 'BLOUSE'),
(628, 'C921  BL3', '2', 'BGC (N/S BTN FRNT BLOUSE)'),
(629, 'C921  BL5', '2', 'BGC (S/S BLOUSE)'),
(630, 'C921  BL6', '2', 'BGC ( SLEEVELESS BLOUSE )'),
(631, 'C921  PL5', '2', 'PULLOVER'),
(632, 'C921  PL6', '2', 'BBC ZIP FRNT PULLOVER'),
(633, 'C921  SW3', '2', 'BGC FSH SWEATSHIRT'),
(634, 'C921  TE1', '2', 'T-SHIRT'),
(635, 'C922  PT3', '2', 'BGC (FASHION PANT)'),
(636, 'C922  SR3', '2', 'BGC (FASHION SHORT)'),
(637, 'C922  ST1', '2', 'BGC (SALOPETTE SHORT)'),
(638, 'C922  ST3', '2', 'SALOPETTE'),
(639, 'C923  DR1', '2', 'DRESS'),
(640, 'C923  DR6', '2', 'BGC S/S SHORT DRESS'),
(641, 'C923  DR7', '2', 'BGC (N/S REG DRESS)'),
(642, 'C923  JK2', '2', 'BGC FSH JACKET'),
(643, 'C926  BK1', '2', 'BLANKET'),
(644, 'CDSP  TLS', '2', 'STORES DISPLAY TOOLS'),
(645, 'CDWN  CDW', '2', 'DOWN PAYMENT'),
(646, 'CFAB  MTM', '2', 'FABRIC MADE TO MEASURE'),
(647, 'CGFT  BOX', '2', 'CGFT BOX = Gift Box'),
(648, 'CGFT  CRD', '2', 'GIFT CARD'),
(649, 'CMIX  BZ3', '2', 'MIX'),
(650, 'CMIX  SU3', '2', 'MIX'),
(651, 'CMIX  SU4', '2', 'MIX'),
(652, 'CMIX  TR2', '2', 'MIX'),
(653, 'CMIX  TR3', '2', 'MIX'),
(654, 'CMTM  CT1', '2', 'COAT'),
(655, 'CMTM  SU3', '2', 'MADE TO MEASURE'),
(656, 'CMTM  SU4', '2', 'MADE TO MEASURE'),
(657, 'CMTM  SU8', '2', 'MTM ceremonial suit'),
(658, 'CMTM  TR3', '2', 'MADE TO MEASURE'),
(659, 'CMTM  VS1', '2', 'MF D.BREAST VEST'),
(660, 'MTMM  BZ3', '2', 'M TO MSURE SNGL BRST BLZ'),
(661, 'MTMM  JK2', '2', 'MADE TO MEASURE JACKET'),
(662, 'MTMM  TR2', '2', 'M TO MSURE 1PLT TROUSER'),
(663, 'PROMOTI', '2', 'PROMOTION'),
(664, 'Q111  BZ1', '2', 'MF 2 BTN DOUBLE BREAST'),
(665, 'Q111  BZ2', '2', 'MF 3 B S.REAST BLAZER'),
(666, 'Q111  BZ3', '2', 'MF 2 B S.REAST BLAZER'),
(667, 'Q111  BZ4', '2', 'MF 4 B S.REAST BLAZER'),
(668, 'Q111  SH1', '2', 'L/S SOLIDSHIRT'),
(669, 'Q111  SH2', '2', 'L/S  PRINT SHIRT'),
(670, 'Q111  SH3', '2', 'S/S SOLIDSHIRT'),
(671, 'Q111  SH4', '2', 'S/S  PRINT SHIRT'),
(672, 'Q111  SH5', '2', 'L/S SOLIDSHIRT CUFFLINKS'),
(673, 'Q111  SH6', '2', 'L/S PRINTSHIRT CUFFLINKS'),
(674, 'Q111  SH8', '2', 'L/S CEREMONIAL SHIRT CUFFLINKS'),
(675, 'Q111  SH9', '2', 'HIGH QUALITY SHIRT'),
(676, 'Q111  SU1', '2', 'MF 2 BTN DOUBLE BREAST F.FRONT'),
(677, 'Q111  SU2', '2', 'MF 3 B S .BREAST -1PLEAT'),
(678, 'Q111  SU3', '2', 'MF 2 B S .BREAST -1PLEAT'),
(679, 'Q111  SU4', '2', 'MF 2 B S .BREAST -F.FRONT'),
(680, 'Q111  SU8', '2', 'SUIT'),
(681, 'Q112  TR2', '2', 'MF 1PLEATTROUSER'),
(682, 'Q112  TR3', '2', 'TROUSER FLAT FRONT'),
(683, 'Q113  CT2', '2', 'MF S.BREAST LNG COAT'),
(684, 'Q116  BW1', '2', 'MC BOW TIE'),
(685, 'Q116  CB1', '2', 'MC CUMMERBAND'),
(686, 'Q116  CL1', '2', 'METAL CUFFLINK'),
(687, 'Q116  SO2', '2', 'MC CLASSIC LEATHER SHOES'),
(688, 'Q116  SO8', '2', 'MC CEREMONIAL LEATHER SHOES'),
(689, 'Q116  TY1', '2', 'MC TIE'),
(690, 'Q121  PL1', '2', 'MC BASIC LT.PULLOVER'),
(691, 'Q121  VS3', '2', 'MC BASIC VEST'),
(692, 'Q123  JK1', '2', 'MC BASIC JACKET'),
(693, 'Q123  JK9', '2', 'MC LEATHER JACKET'),
(694, 'Q126  GV1', '2', 'MC LEATHER GLOVE'),
(695, 'Q126  SF1', '2', 'MC SCARF'),
(696, 'QMIX  SU3', '2', 'QMIXSU3'),
(697, 'QMIX  SU4', '2', 'QMIXSU4'),
(698, 'T111  BZ5', '2', 'MIX & MATCH CLASSICBLAZER'),
(699, 'T111  BZ8', '2', 'FASHION BLAZER M F'),
(700, 'T111  SH0', '2', 'SHIRT'),
(701, 'T111  SH1', '2', 'L/S SOLIDSHIRT'),
(702, 'T111  SH2', '2', 'L/S PRINTSHIRT'),
(703, 'T111  SH3', '2', 'S/S SOLIDSHIRT'),
(704, 'T111  SH4', '2', 'S/S PRINTSHIRT'),
(705, 'T111  SH5', '2', 'L/S SOLIDSHIRT CUFF'),
(706, 'T111  SH6', '2', 'L/S PRINTSHIRT CUFF'),
(707, 'T111  SH8', '2', 'L/S CEREMONIAL SHIRT CUFFLINKS'),
(708, 'T111  SU4', '2', '2BTN S.BREAST FLAT FRONT'),
(709, 'T111  SU8', '2', 'SUIT'),
(710, 'T111  VS0', '2', 'VEST'),
(711, 'T112  TR3', '2', 'FLAT FRONT TROUSER'),
(712, 'T112  TR5', '2', 'MIX & MATCH CLASSICTROUSER'),
(713, 'T113  CT1', '2', 'M/F S.BREAST REG COAT'),
(714, 'T116  BT1', '2', 'MC CLASSIC BELT'),
(715, 'T116  TY1', '2', 'MC TIE'),
(716, 'T121  PL4', '2', 'MC FSH. HVY. PULLOVER'),
(717, 'T121  TE1', '2', 'MC S/S  T.SHIRT'),
(718, 'T121  TE5', '2', 'MC L/S T.SHIRT'),
(719, 'T121  TE7', '2', 'MC L/S FITTED T.SHIRT'),
(720, 'T122  PT4', '2', 'MC 5 PANTPOCKET'),
(721, 'T122  PT5', '2', 'MC REGULAR SEMI CLASSIC'),
(722, 'T122  PT6', '2', 'MC FASHION SEMI CLASSIC'),
(723, 'T123  JK5', '2', 'MC PARKA JACKET'),
(724, 'T123  JK9', '2', 'MC LEATHER JACKET'),
(725, 'T126  BT1', '2', 'MC BELT'),
(726, 'T126  SF1', '2', 'MC SCARF'),
(2190, 'C111  BZ1', '2', 'MF D.BREAST BLAZER'),
(2193, 'C122  SAM', '2', 'SAMPLE'),
(2194, 'C111  BZ3', '2', '2BT S.BRST BLAZER');

-- --------------------------------------------------------

--
-- Table structure for table `DCS_size_scale`
--

CREATE TABLE IF NOT EXISTS `DCS_size_scale` (
  `DCS_size_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `size_scale` char(5) NOT NULL,
  `size_fulldept` char(9) NOT NULL,
  `size_country_id` char(5) NOT NULL DEFAULT '2',
  PRIMARY KEY (`DCS_size_id`),
  KEY `fk_DCS_size_scale_dept_idx` (`size_fulldept`),
  KEY `fk_DCS_size_scale_country_idx` (`size_country_id`),
  KEY `fk_DCS_size_scale_size_idx` (`size_scale`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `DCS_size_scale`
--

INSERT INTO `DCS_size_scale` (`DCS_size_id`, `size_scale`, `size_fulldept`, `size_country_id`) VALUES
(0000000001, '10', 'c111  BZ1', '2'),
(0000000002, '100', 'C111  BZ1', '2');

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
  `dept_name` char(40) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_name`
--

INSERT INTO `dept_name` (`dept_id`, `dept_name`) VALUES
('C11', 'Concrete Men Classics'),
('C12', 'Concrete Men Casual'),
('C21', 'Brands'),
('C22', 'Junior Boys'),
('C31', 'Brands'),
('C32', 'Kids Boys'),
('C41', 'Brands'),
('C42', 'Junior Girls'),
('C51', 'Brands'),
('C52', 'Kids Girls'),
('C62', 'Kids Girls'),
('C71', 'Brands'),
('C82', 'Baby Boys'),
('C92', 'Baby Girls'),
('Q11', 'Concept Men Classic'),
('Q12', 'Concept Men Casual'),
('T11', 'Cut Men Classic'),
('T12', 'Cut Men Casual');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` char(20) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`group_id`, `group_name`) VALUES
(5, 'Administrators');

-- --------------------------------------------------------

--
-- Table structure for table `group_operations`
--

CREATE TABLE IF NOT EXISTS `group_operations` (
  `grp_op_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `op_name` char(40) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  PRIMARY KEY (`grp_op_id`),
  KEY `fk_group_privileges_priv_idx` (`op_name`),
  KEY `fk_group_privileges_grp` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `group_operations`
--

INSERT INTO `group_operations` (`grp_op_id`, `group_id`, `op_name`, `checked`) VALUES
(10, 5, 'createStylesheet', 1),
(11, 5, 'deleteOwnStylesheet', 0),
(12, 5, 'updateOwnStylesheet', 1);

-- --------------------------------------------------------

--
-- Table structure for table `iso_header`
--

CREATE TABLE IF NOT EXISTS `iso_header` (
  `header_id` int(11) NOT NULL AUTO_INCREMENT,
  `header_code` char(15) NOT NULL,
  `version` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`header_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `iso_header`
--

INSERT INTO `iso_header` (`header_id`, `header_code`, `version`, `date`) VALUES
(1, 'CRF-11-02', 1, '2007-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `countryid` char(5) NOT NULL,
  `itemsid` bigint(20) NOT NULL,
  `desc1` char(40) NOT NULL DEFAULT '',
  `desc2` char(40) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `marker`
--

INSERT INTO `marker` (`marker_id`, `ss_id`, `width`, `length`, `utilization`, `t_size`, `ratio`, `marker_name`, `owner`) VALUES
(15, 34, 147, 162.28, 80.48, 32, '3M--9M--18M', 'T-BSH-04-147-1', 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `marker_log`
--

INSERT INTO `marker_log` (`marker_log_id`, `marker_id`, `action_time_stamp`, `action_type`, `action_comment`, `user`) VALUES
(7, 15, '2014-10-22 14:35:59', 'create', 'Creating a new marker for stylesheet GPJ/T-03', 3),
(8, 15, '2014-10-22 14:36:36', 'update', 'Changing T size', 3);

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `op_name` char(40) NOT NULL,
  `operation` char(40) NOT NULL,
  PRIMARY KEY (`op_name`),
  KEY `operation` (`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`op_name`, `operation`) VALUES
('createStylesheet', 'Create Stylesheet'),
('deleteOwnStylesheet', 'Delete Own Stylesheet'),
('updateOwnStylesheet', 'Update Own Stylesheet');

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
-- Dumping data for table `size`
--

INSERT INTO `size` (`scale_number`, `scale_size`, `scale_name`) VALUES
('10', '36,38,40,42,44,46,48,50,52', '36-52'),
('100', '42,44,46,48,50,52,54,56,58,60,62,64,66', '42-66');

-- --------------------------------------------------------

--
-- Table structure for table `ss_size_qty`
--

CREATE TABLE IF NOT EXISTS `ss_size_qty` (
  `ss_size_qty_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `size` char(10) NOT NULL,
  `size_qty` int(11) NOT NULL,
  PRIMARY KEY (`ss_size_qty_id`),
  KEY `ss_id` (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ss_size_qty`
--

INSERT INTO `ss_size_qty` (`ss_size_qty_id`, `ss_id`, `size`, `size_qty`) VALUES
(1, 26, '36', 37),
(2, 26, '38', 169),
(3, 26, '40', 169),
(4, 26, '42', 156);

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet`
--

CREATE TABLE IF NOT EXISTS `stylesheet` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
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
  KEY `owner` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `stylesheet`
--

INSERT INTO `stylesheet` (`ss_id`, `country_id`, `dept_id`, `class_id`, `subclass_id`, `season`, `year`, `pono`, `dcs_notes`, `style_code`, `stylesheet_note`, `fabric`, `scale`, `sizes`, `user_id`) VALUES
(26, '2', 'C12', '1', 'PJ0', 'S', '2015', NULL, '', 'GPJ/T-03', '', 'Cotton', '10', '111100000', 3),
(27, '2', 'C11', '1', 'BZ2', 'A', '2015', NULL, '', 'ASSUM/15', '', 'Cotton', '10', '110000000', 3),
(31, '2', 'C11', '1', 'BZ1', 'S', '2017', NULL, 'NOTHING', 'GPJ/T-03', 'كالعينة', 'Cotton', '10', '011100001', 3),
(32, '2', 'C12', '1', 'BZ1', 'S', '2016', NULL, 'NOTHING', 'GPJ/T-03', '', 'Cotton', '100', '0000000110000', 3),
(33, '2', 'C12', '1', 'BZ1', 'S', '2015', NULL, '', 'GPJ/T-03', '', 'Cotton', '10', '111100000000001110111100000', 3),
(34, '2', 'C12', '1', 'BZ1', 'A', '2016', NULL, '', 'GPJ/T-03', '', 'Cotton', '10', '111100000', 3),
(35, '2', 'C11', '1', 'BZ1', 'S', '2000', NULL, '-', 'NEWs', '-', 'Linen', '10', '110000000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_bom`
--

CREATE TABLE IF NOT EXISTS `stylesheet_bom` (
  `ss_bom_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
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
  KEY `fk_ss_bom_ss` (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `stylesheet_bom`
--

INSERT INTO `stylesheet_bom` (`ss_bom_id`, `ss_id`, `dcs_name`, `dept_id`, `class_id`, `subclass_id`, `item_color_id`, `item_desc`, `item_cons`, `item_placement`, `countryid`) VALUES
(1, 26, 'MF D.BREAST BLAZER', 'C11', '1', 'BZ1', 'ORLESS00', 'الجسم', '', 'ON', '2'),
(7, 26, 'MC SCARF', 'T12', '6', 'SF1', 'BLLTSS00', '-', NULL, NULL, '2'),
(8, 27, 'MEN TRAINING TOP', 'C12', '1', 'TE8', 'BLLTSS00', '', '', '', '2');

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
  `place` char(40) DEFAULT NULL,
  `code` char(10) DEFAULT NULL,
  `ss_color_desc` char(40) DEFAULT NULL,
  PRIMARY KEY (`ss_color_id`),
  KEY `fk_stylesheet_color_color_idx` (`color_code`),
  KEY `fk_stylesheet_color_ss` (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stylesheet_color`
--

INSERT INTO `stylesheet_color` (`ss_color_id`, `ss_id`, `color_code`, `print`, `emb`, `place`, `code`, `ss_color_desc`) VALUES
(1, 26, 'W-LESS03', 1, 1, 'IN FRONT', 'GS 11', 'AS REFERENCE');

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_images`
--

CREATE TABLE IF NOT EXISTS `stylesheet_images` (
  `ss_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `img_path` char(50) NOT NULL,
  PRIMARY KEY (`ss_img_id`),
  KEY `fk_stylesheet_images_ss` (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `stylesheet_images`
--

INSERT INTO `stylesheet_images` (`ss_img_id`, `ss_id`, `img_path`) VALUES
(21, 31, 'Screenshot from 2014-07-22 22:35:17.png'),
(22, 31, 'Screenshot from 2014-07-10 16:39:05.png'),
(23, 31, 'Screenshot from 2014-09-18 14:15:06.png'),
(24, 34, 'Screenshot from 2014-07-22 22:36:58.png'),
(25, 35, 'slide1.png');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `stylesheet_log`
--

INSERT INTO `stylesheet_log` (`ss_log_id`, `ss_id`, `action_time_stamp`, `action_type`, `action_comment`, `user`) VALUES
(4, 31, '2014-10-22 11:35:55', 'create', 'create stylesheet', 3),
(5, 31, '2014-10-22 11:42:27', 'create', 'Add an existing Color: W-LESS02', 3),
(6, 31, '2014-10-22 11:46:17', 'delete', 'Delete color W-LESS02 from this stylesheet GPJ/T-03', 3),
(7, 31, '2014-10-22 11:49:30', 'create', 'Uploaded image Screenshot from 2014-07-22 22:35:17.png for stylesheet GPJ/T-03', 3),
(8, 31, '2014-10-22 11:53:43', 'delete', 'Delete image 1922426_10152281479758967_548144733_n.jpg from this stylesheet GPJ/T-03', 3),
(9, 31, '2014-10-22 11:53:53', 'create', 'Uploaded image Screenshot from 2014-07-10 16:39:05.png for stylesheet GPJ/T-03', 3),
(10, 31, '2014-10-22 11:54:53', 'create', 'Uploaded image Screenshot from 2014-09-18 14:15:06.png for stylesheet GPJ/T-03', 3),
(11, 31, '2014-10-22 11:57:02', 'update', 'Just trying these things فوالا', 3),
(12, 31, '2014-10-22 11:57:35', 'update', 'إضافة مقاس', 3),
(13, 32, '2014-10-22 12:13:04', 'create', 'create stylesheet', 3),
(14, 33, '2014-10-22 12:19:06', 'create', 'create stylesheet', 3),
(15, 34, '2014-10-22 12:28:12', 'create', 'create stylesheet', 3),
(16, 34, '2014-10-22 12:28:18', 'create', 'Uploaded image Screenshot from 2014-07-22 22:36:58.png for stylesheet GPJ/T-03', 3),
(17, 34, '2014-10-22 14:23:43', 'create', 'Creating a new marker for stylesheet GPJ/T-03', 3),
(18, 34, '2014-10-22 14:23:56', 'delete', 'Delete the marker', 3),
(19, 26, '2014-10-22 14:26:05', 'create', 'Creating a new marker for stylesheet GPJ/T-03', 3),
(20, 34, '2014-10-22 14:35:59', 'create', 'Creating a new marker for stylesheet GPJ/T-03', 3),
(21, 26, '2014-10-22 14:47:34', 'delete', 'Deleted the marker', 3),
(22, 26, '2014-10-28 07:05:35', 'create', 'Add an existing Color: W-LESS03', 3),
(23, 27, '2014-10-28 09:26:56', 'create', 'create stylesheet bom item #8', 3),
(24, 27, '2014-10-28 09:28:03', 'update', 'update stylesheet bom item #8', 3),
(25, 35, '2014-10-28 09:29:36', 'create', 'create stylesheet', 3),
(26, 35, '2014-10-28 09:29:43', 'create', 'Uploaded image slide1.png for stylesheet NEWs', 3),
(27, 26, '2014-10-28 09:31:19', 'delete', 'delete stylesheet bom item #5', 3);

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_size`
--

CREATE TABLE IF NOT EXISTS `stylesheet_size` (
  `ss_size_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `sizes` char(40) NOT NULL,
  PRIMARY KEY (`ss_size_id`),
  KEY `fk_stylesheet_size_ss` (`ss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subclass_name`
--

CREATE TABLE IF NOT EXISTS `subclass_name` (
  `subclassid` char(3) NOT NULL,
  `subclass_name` char(40) NOT NULL,
  PRIMARY KEY (`subclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subclass_name`
--

INSERT INTO `subclass_name` (`subclassid`, `subclass_name`) VALUES
('BD1', 'BANDANA'),
('BG1', 'BAG'),
('BG2', 'BAG'),
('BK', 'BLANKET'),
('BL', 'BLOUSE'),
('BO', 'GIFT BOX'),
('BS', 'BASKET'),
('BT', 'BELT'),
('BW', 'BOW TIE'),
('BX', 'BOXER'),
('BZ', 'BLAZER'),
('C3', 'TRICOTE VEST'),
('CB', 'CUMMERBAND'),
('CD', 'DOWN PAYMENT'),
('CL', 'CUFFLINK'),
('CM', 'CACHE MAILLOT'),
('CR', 'GIFT CARD'),
('CT', 'COAT'),
('CV', 'COVAR COAT'),
('DR', 'DRESS'),
('EW', 'EW'),
('FL', 'FLASH MEMORY'),
('GV', 'GLOVE'),
('HA', ' HAIR HOOP'),
('HK', 'HANDKERCHIEF'),
('HN', 'CHANDLER'),
('HT', 'HAT'),
('IC', 'ICE CAP'),
('JK', 'JACKET'),
('KC', 'KC'),
('LR', 'LR'),
('MD', 'MEDAL'),
('MN', 'MANNEQUIN'),
('MT', 'MADE TO MEASURE'),
('NL', 'NL'),
('OT', 'OTHERS'),
('PJ0', 'PAJAMA'),
('PJ5', 'PAJAMA'),
('PL', 'PULLOVER'),
('PN', 'PONCHES'),
('PT', 'PANT'),
('PY', 'PANTY'),
('RL', 'RUBBER LINK'),
('S0', 'S0'),
('SA', 'SAMPLE'),
('SC', 'SOCKS'),
('SF', 'SCARF'),
('SH', 'SHIRT'),
('SK', 'SKIRT'),
('SL', 'SLIPPER'),
('SM', 'SWIMWEAR'),
('SO', 'SHOES'),
('SP', 'SLIP'),
('SR', 'SHORT'),
('ST', 'SALOPPETTE'),
('SU', 'SUIT'),
('SV', 'SUIT COVER'),
('SW', 'SWEATSHIRT'),
('TB', 'TIE BAR'),
('TE', ' T_SHIRT'),
('TL', 'STORES DISPLAY TOOLS'),
('TR', 'TROUSER'),
('TY1', 'Tie'),
('VS', 'VEST'),
('WB', 'WRISTBANDS'),
('WL', 'WALLET'),
('WT1', 'WT');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` char(20) NOT NULL,
  `password` char(100) NOT NULL,
  `user_group` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_users_1_idx` (`user_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `password`, `user_group`) VALUES
(1, 'admin', '$2y$10$6XHqCcpXsQKR1vyozMSyhuwHAikeMtw5.6n2aTs5zhhA/tgzpmC/O', 5),
(3, 'Asmaa', '$2y$10$Z1AZzxm6s64Rb1GmWQFVQOop37bl6DOINbQeVW5e8aarYl9hY30/C', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `fk_bom_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet_bom` (`ss_bom_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `bom_log`
--
ALTER TABLE `bom_log`
  ADD CONSTRAINT `fk_bom_log_bom` FOREIGN KEY (`bom_id`) REFERENCES `bom` (`bom_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `color_code`
--
ALTER TABLE `color_code`
  ADD CONSTRAINT `fk_color_code_color` FOREIGN KEY (`color`) REFERENCES `color` (`color_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_color_code_length` FOREIGN KEY (`length`) REFERENCES `color_length` (`color_length`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_color_code_pattern` FOREIGN KEY (`pattern`) REFERENCES `color_pattern` (`color_pattern`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_color_code_shadow` FOREIGN KEY (`shadow`) REFERENCES `color_shadow` (`color_shadow`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_color_code_shape` FOREIGN KEY (`shape`) REFERENCES `color_shape` (`color_shape`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_grp_op_op` FOREIGN KEY (`op_name`) REFERENCES `operation` (`op_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_ss_size_qty` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
-- Constraints for table `stylesheet_size`
--
ALTER TABLE `stylesheet_size`
  ADD CONSTRAINT `fk_stylesheet_size_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_users_group` FOREIGN KEY (`user_group`) REFERENCES `group` (`group_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
