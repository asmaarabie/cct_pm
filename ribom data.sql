-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2014 at 11:04 AM
-- Server version: 5.5.38-0ubuntu0.14.04.1
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
  `item_desc` char(40) DEFAULT NULL,
  `item_placement` char(40) DEFAULT NULL,
  `bom_dcs_code` char(10) NOT NULL,
  `item_qty` int(11) NOT NULL,
  `item_consumption` char(10) NOT NULL,
  `item_increase` int(11) NOT NULL DEFAULT '0',
  `pono` int(11) NOT NULL,
  `countryid` char(5) NOT NULL,
  `itemno` int(11) NOT NULL,
  PRIMARY KEY (`bom_id`,`ss_id`,`pono`,`countryid`),
  KEY `fk_bom_ss` (`ss_id`),
  KEY `fk_bom_pono_idx` (`pono`),
  KEY `fk_bom_country_idx` (`countryid`),
  KEY `fk_bom_item_idx` (`itemno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bom_log`
--

CREATE TABLE IF NOT EXISTS `bom_log` (
  `bom_id` int(11) NOT NULL,
  `action_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(10) DEFAULT NULL,
  `action_comment` text,
  PRIMARY KEY (`bom_id`,`action_time_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bom_size_qty`
--

CREATE TABLE IF NOT EXISTS `bom_size_qty` (
  `bom_id` int(11) NOT NULL,
  `size` char(10) NOT NULL,
  `size_qty` int(11) NOT NULL,
  PRIMARY KEY (`bom_id`,`size`,`size_qty`)
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
('OR', 'برتقالي تكساس', 'orange.png', 'Texas Orange');

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

-- --------------------------------------------------------

--
-- Table structure for table `color_length`
--

CREATE TABLE IF NOT EXISTS `color_length` (
  `color_length` char(1) NOT NULL,
  `length_desc_e` char(20) NOT NULL,
  `length_desc_a` char(20) NOT NULL,
  PRIMARY KEY (`color_length`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color_pattern`
--

CREATE TABLE IF NOT EXISTS `color_pattern` (
  `color_pattern` char(1) NOT NULL,
  `pattern_desc_e` char(20) NOT NULL,
  `pattern_desc_a` char(20) NOT NULL,
  PRIMARY KEY (`color_pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color_shadow`
--

CREATE TABLE IF NOT EXISTS `color_shadow` (
  `color_shadow` char(1) NOT NULL,
  `shadow_desc_a` char(20) NOT NULL,
  `shadow_desc_e` char(20) NOT NULL,
  PRIMARY KEY (`color_shadow`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color_shape`
--

CREATE TABLE IF NOT EXISTS `color_shape` (
  `color_shape` char(1) NOT NULL,
  `shape_desc_e` char(20) NOT NULL,
  `shape_desc_a` char(20) NOT NULL,
  PRIMARY KEY (`color_shape`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  KEY `BOM` (`custid`)
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
  `dept_id` char(3) NOT NULL,
  `class_id` char(3) NOT NULL,
  `subclass_id` char(3) NOT NULL,
  `size_scale` char(5) NOT NULL,
  PRIMARY KEY (`dept_id`,`class_id`,`subclass_id`),
  KEY `fk_DCS_size_scale_scale_idx` (`size_scale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('1', 'C111  BZ1', 'C11', '1', 'BZ1', 'MF D.BREAS', 'T BLAZER', NULL),
('1', 'C111  BZ2', 'C11', '1', 'BZ2', 'MF S.BREAS', 'T BLAZER', NULL),
('1', 'C111  BZ3', 'C11', '1', 'BZ3', '2BT S.BRST', ' BLAZER', NULL),
('1', 'C111  BZ4', 'C11', '1', 'BZ4', '4BT S.BRST', ' BLAZER', NULL),
('1', 'C111  BZ5', 'C11', '1', 'BZ5', 'MIX & MATC', 'H, CLASSIC', ', BLAZER'),
('1', 'C111  BZ8', 'C11', '1', 'BZ8', 'FASHION  B', 'LAZER  M F', NULL),
('1', 'C111  BZ9', 'C11', '1', 'BZ9', 'MF 2PC BLA', 'ZER', NULL),
('1', 'C111  BZV', 'C11', '1', 'BZV', 'MF D.BREAS', 'T BLAZER', NULL),
('1', 'C111  CV1', 'C11', '1', 'CV1', 'COVAR COAT', NULL, NULL),
('1', 'C111  PJ0', 'C11', '1', 'PJ0', 'PAJAMA', NULL, NULL),
('1', 'C111  PT0', 'C11', '1', 'PT0', 'PANT', NULL, NULL),
('1', 'C111  SH0', 'C11', '1', 'SH0', 'SHIRT', NULL, NULL),
('1', 'C111  SH1', 'C11', '1', 'SH1', 'L/S SOLID', 'SHIRT', NULL),
('1', 'C111  SH2', 'C11', '1', 'SH2', 'L/S  PRINT', ' SHIRT', NULL),
('1', 'C111  SH3', 'C11', '1', 'SH3', 'S/S SOLID', 'SHIRT', NULL),
('1', 'C111  SH4', 'C11', '1', 'SH4', 'S/S  PRINT', ' SHIRT', NULL),
('1', 'C111  SH5', 'C11', '1', 'SH5', 'L/S SOLID', 'SHIRT CUFF', 'LINKS'),
('1', 'C111  SH6', 'C11', '1', 'SH6', 'MF L/S REG', '.CLASSIC S', 'HIRT'),
('1', 'C111  SH7', 'C11', '1', 'SH7', 'MF S/S REG', '.CLASSIC S', 'HIRT'),
('1', 'C111  SH8', 'C11', '1', 'SH8', 'MF L/S FSH', '.CLASSIC S', 'HIRT'),
('1', 'C111  SH9', 'C11', '1', 'SH9', 'MF S/S FSH', '.CLASSIC S', 'HIRT'),
('1', 'C111  SU1', 'C11', '1', 'SU1', 'MF 2PC D.B', 'REAST SUIT', NULL),
('1', 'C111  SU2', 'C11', '1', 'SU2', 'MF 2PC S.B', 'REAST SUIT', NULL),
('1', 'C111  SU3', 'C11', '1', 'SU3', '2BT S.BRST', ' 1PLEAT SU', 'IT'),
('1', 'C111  SU4', 'C11', '1', 'SU4', '2BT S.BRST', ' F.FRNT SU', 'IT'),
('1', 'C111  SU5', 'C11', '1', 'SU5', 'MF 3PC D.B', 'REAST SUIT', NULL),
('1', 'C111  SU6', 'C11', '1', 'SU6', 'MF 3PC S.B', 'REAST SUIT', NULL),
('1', 'C111  SU8', 'C11', '1', 'SU8', 'SUIT', NULL, NULL),
('1', 'C111  SUV', 'C11', '1', 'SUV', 'MF 3PC D.B', 'REAST SUIT', NULL),
('1', 'C111  TE0', 'C11', '1', 'TE0', 'T-SHIRT', NULL, NULL),
('1', 'C111  TR5', 'C11', '1', 'TR5', 'MIX & MATC', 'H TROUSERS', NULL),
('1', 'C111  VS1', 'C11', '1', 'VS1', 'MF D.BREAS', 'T VEST', NULL),
('1', 'C111  VS2', 'C11', '1', 'VS2', 'MF S.BREAS', 'T VEST', NULL),
('1', 'C112  TR1', 'C11', '2', 'TR1', 'MF 2PLEAT', 'TROUSER', NULL),
('1', 'C112  TR2', 'C11', '2', 'TR2', 'MF 1PLEAT', 'TROUSER', NULL),
('1', 'C112  TR3', 'C11', '2', 'TR3', 'MF F.FRNT', 'TROUSER', NULL),
('1', 'C112  TR4', 'C11', '2', 'TR4', 'MF FASHION', ' TROUSER', NULL),
('1', 'C112  TR5', 'C11', '2', 'TR5', 'MIX & MATC', 'H TROUSERS', NULL),
('1', 'C113  CT1', 'C11', '3', 'CT1', 'MF S.BREAS', 'T REG COAT', NULL),
('1', 'C113  CT2', 'C11', '3', 'CT2', 'MF S.BREAS', 'T LNG COAT', NULL),
('1', 'C113  CT3', 'C11', '3', 'CT3', 'MF D.BREAS', 'T REG COAT', NULL),
('1', 'C113  CT4', 'C11', '3', 'CT4', 'MF D.BREAS', 'T LNG COAT', NULL),
('1', 'C116  BG1', 'C11', '6', 'BG1', 'MF BAG', NULL, NULL),
('1', 'C116  BT1', 'C11', '6', 'BT1', 'MF BELT', NULL, NULL),
('1', 'C116  BT3', 'C11', '6', 'BT3', 'MF Classic', ' BELT', NULL),
('1', 'C116  CB1', 'C11', '6', 'CB1', 'MC TIE BAR', NULL, NULL),
('1', 'C116  CL1', 'C11', '6', 'CL1', 'METAL CUFF', 'LINK', NULL),
('1', 'C116  CV1', 'C11', '6', 'CV1', 'COVAR COAT', NULL, NULL),
('1', 'C116  GV2', 'C11', '6', 'GV2', 'LEATHER GL', 'OVE', NULL),
('1', 'C116  HA1', 'C11', '6', 'HA1', 'HA1', NULL, NULL),
('1', 'C116  HK1', 'C11', '6', 'HK1', 'MF HANDKER', 'CHIEF', NULL),
('1', 'C116  HN1', 'C11', '6', 'HN1', 'Chandler', NULL, NULL),
('1', 'C116  LR1', 'C11', '6', 'LR1', 'LR1', NULL, NULL),
('1', 'C116  OTH', 'C11', '6', 'OTH', 'MF Others', NULL, NULL),
('1', 'C116  RL1', 'C11', '6', 'RL1', 'RUBBER LIN', 'K', NULL),
('1', 'C116  S01', 'C11', '6', 'S01', 'SO1', NULL, NULL),
('1', 'C116  SC1', 'C11', '6', 'SC1', 'Regular le', 'ngth', NULL),
('1', 'C116  SO2', 'C11', '6', 'SO2', 'LEATHER SH', 'OES', NULL),
('1', 'C116  SV1', 'C11', '6', 'SV1', 'MF SUIT CO', 'VER', NULL),
('1', 'C116  TB1', 'C11', '6', 'TB1', 'MC TIE BAR', NULL, NULL),
('1', 'C116  TY1', 'C11', '6', 'TY1', 'MF TIE', NULL, NULL),
('1', 'C117  SO1', 'C11', '7', 'SO1', 'MF SHOES', NULL, NULL),
('1', 'C121  PL1', 'C12', '1', 'PL1', 'MC BASIC L', 'T.PULLOVER', NULL),
('1', 'C121  PL2', 'C12', '1', 'PL2', 'MC FASHION', ' LT.PULLOV', 'ER'),
('1', 'C121  PL3', 'C12', '1', 'PL3', 'MC REG HVY', '.PULLOVER', NULL),
('1', 'C121  PL4', 'C12', '1', 'PL4', 'MC FSH. HV', 'Y.PULLOVER', NULL),
('1', 'C121  PL5', 'C12', '1', 'PL5', 'MC BTN FRN', 'T PULLOVER', NULL),
('1', 'C121  PL6', 'C12', '1', 'PL6', 'MC ZIP FRN', 'T PULLOVER', NULL),
('1', 'C121  PL8', 'C12', '1', 'PL8', 'MC FIT TIG', 'HT PULLOVE', 'R'),
('1', 'C121  SH1', 'C12', '1', 'SH1', 'MC L/S SLD', ' SAFARI SH', 'IRT'),
('1', 'C121  SH2', 'C12', '1', 'SH2', 'MC L/S Y/D', ' & PRINT S', 'HIRT'),
('1', 'C121  SH3', 'C12', '1', 'SH3', 'MC S/S SLD', ' SAFARI SH', 'IRT'),
('1', 'C121  SH4', 'C12', '1', 'SH4', 'MC S/S Y/D', ' & PRINT S', 'HIRT'),
('1', 'C121  SH5', 'C12', '1', 'SH5', 'MC OVERSHI', 'RT', NULL),
('1', 'C121  SH6', 'C12', '1', 'SH6', 'MC LS REG', 'SHIRT', NULL),
('1', 'C121  SH7', 'C12', '1', 'SH7', 'MC SS REG', 'SHIRT', NULL),
('1', 'C121  SW1', 'C12', '1', 'SW1', 'MC POLO SW', 'EATSHIRT', NULL),
('1', 'C121  SW2', 'C12', '1', 'SW2', 'MC REG. SW', 'EATSHIRT', NULL),
('1', 'C121  SW3', 'C12', '1', 'SW3', 'MC FSH SWE', 'ATSHIRT', NULL),
('1', 'C121  SW4', 'C12', '1', 'SW4', 'MC BTN FRN', 'T SWEATSHI', 'RT'),
('1', 'C121  SW5', 'C12', '1', 'SW5', 'MC ZIP FRN', 'T SWEATSHI', 'RT'),
('1', 'C121  SW7', 'C12', '1', 'SW7', 'MC FIT TIG', 'HT SWEATSH', 'IRT'),
('1', 'C121  SW9', 'C12', '1', 'SW9', 'MC TRAININ', 'G TOP SWEA', 'TSHIRT'),
('1', 'C121  TE1', 'C12', '1', 'TE1', 'MC S/S T-S', 'HIRT', NULL),
('1', 'C121  TE2', 'C12', '1', 'TE2', 'MC S/S POL', 'O T-SHIRT', NULL),
('1', 'C121  TE3', 'C12', '1', 'TE3', 'MC S/S FIT', 'TED T-SHIR', 'T'),
('1', 'C121  TE4', 'C12', '1', 'TE4', 'MC TANK TO', 'P T-SHIRT', NULL),
('1', 'C121  TE5', 'C12', '1', 'TE5', 'MC L/S T-S', 'HIRT', NULL),
('1', 'C121  TE6', 'C12', '1', 'TE6', 'MC L/S POL', 'O T-SHIRT', NULL),
('1', 'C121  TE7', 'C12', '1', 'TE7', 'MC L/S FIT', 'TED T-SHIR', 'T'),
('1', 'C121  TE8', 'C12', '1', 'TE8', 'MEN TRAINI', 'NG TOP', NULL),
('1', 'C121  TE9', 'C12', '1', 'TE9', 'MC SLEEVLE', 'SS T-SHIRT', NULL),
('1', 'C121  VS5', 'C12', '1', 'VS5', 'MC TRICOTE', ' VEST', NULL),
('1', 'C122  PT1', 'C12', '2', 'PT1', 'MC REGULAR', ' CHINO PAN', 'T'),
('1', 'C122  PT2', 'C12', '2', 'PT2', 'MC PULLON', 'PANT', NULL),
('1', 'C122  PT3', 'C12', '2', 'PT3', 'MC FASHION', ' PANT', NULL),
('1', 'C122  PT4', 'C12', '2', 'PT4', 'MC 5 POCKE', 'T PANT', NULL),
('1', 'C122  PT5', 'C12', '2', 'PT5', 'MC REGULAR', ' SEMI CLAS', 'SIC PANT'),
('1', 'C122  PT6', 'C12', '2', 'PT6', 'MC FASHION', ' SEMI CLAS', 'SIC PANT'),
('1', 'C122  PT9', 'C12', '2', 'PT9', 'MC TRAININ', 'G PANT', NULL),
('1', 'C122  SAM', 'C12', '2', 'SAM', 'SAMPLE', NULL, NULL),
('1', 'C122  SM1', 'C12', '2', 'SM1', 'MC SWIMWEA', 'R', NULL),
('1', 'C122  SR1', 'C12', '2', 'SR1', 'MC BASIC S', 'HORT', NULL),
('1', 'C122  SR2', 'C12', '2', 'SR2', 'MC PULLON', 'SHORT', NULL),
('1', 'C122  SR3', 'C12', '2', 'SR3', 'MC FASHION', ' SHORT', NULL),
('1', 'C122  SR4', 'C12', '2', 'SR4', 'MC PERMUDA', ' SHORT', NULL),
('1', 'C122  SR5', 'C12', '2', 'SR5', 'MC 5 POCKE', 'T SHORT', NULL),
('1', 'C122  SR9', 'C12', '2', 'SR9', 'MC TRAININ', 'G SHORT', NULL),
('1', 'C123  HT1', 'C12', '3', 'HT1', 'HAT', NULL, NULL),
('1', 'C123  JK1', 'C12', '3', 'JK1', 'MC BASIC J', 'ACKET', NULL),
('1', 'C123  JK2', 'C12', '3', 'JK2', 'MC FASHION', ' JACKET', NULL),
('1', 'C123  JK5', 'C12', '3', 'JK5', 'MC PARKA J', 'ACKET', NULL),
('1', 'C123  JK9', 'C12', '3', 'JK9', 'MC LEATHER', ' JACKET', NULL),
('1', 'C123  SM1', 'C12', '3', 'SM1', 'MC SMWR. 1', ' Piece', NULL),
('1', 'C123  SM3', 'C12', '3', 'SM3', 'KGC SMWR.', 'ONE PCS.SH', 'ORT'),
('1', 'C123  TE1', 'C12', '3', 'TE1', 'S/S T-SHIR', 'T', NULL),
('1', 'C123  TE9', 'C12', '3', 'TE9', 'SLVLES T.S', 'HIRT', NULL),
('1', 'C123  VS3', 'C12', '3', 'VS3', 'MC BASIC V', 'EST', NULL),
('1', 'C123  VS4', 'C12', '3', 'VS4', 'MC SAFARI', 'VEST', NULL),
('1', 'C124  BX1', 'C12', '4', 'BX1', 'MC REGULAR', ' BOXER', NULL),
('1', 'C124  BX2', 'C12', '4', 'BX2', 'MC FITTED', 'BOXER', NULL),
('1', 'C124  BX6', 'C12', '4', 'BX6', 'MC Uware', NULL, NULL),
('1', 'C124  SP1', 'C12', '4', 'SP1', 'MC REGULAR', ' SLIP', NULL),
('1', 'C124  TE1', 'C12', '4', 'TE1', 'MC S/S T-S', 'HIRT', NULL),
('1', 'C124  TE2', 'C12', '4', 'TE2', 'MC SS POLO', ' T-SHIRT', NULL),
('1', 'C124  TE4', 'C12', '4', 'TE4', 'MC TANK TO', 'P T-SHIRT', NULL),
('1', 'C124  TE5', 'C12', '4', 'TE5', 'MC LS T-SH', 'IRT', NULL),
('1', 'C124  TE6', 'C12', '4', 'TE6', 'MC LS POLO', ' T-SHIRT', NULL),
('1', 'C124  TE9', 'C12', '4', 'TE9', 'MC NS T-SH', 'IRT', NULL),
('1', 'C126  BG1', 'C12', '6', 'BG1', 'BG1', NULL, NULL),
('1', 'C126  BSK', 'C12', '6', 'BSK', 'BASKET', NULL, NULL),
('1', 'C126  BT1', 'C12', '6', 'BT1', 'MC BELT', NULL, NULL),
('1', 'C126  BT2', 'C12', '6', 'BT2', 'WOVEN BELT', NULL, NULL),
('1', 'C126  BT4', 'C12', '6', 'BT4', 'MC Casual', 'BELT', NULL),
('1', 'C126  BT5', 'C12', '6', 'BT5', 'MC Jeans B', 'ELT', NULL),
('1', 'C126  EW1', 'C12', '6', 'EW1', 'EW1', NULL, NULL),
('1', 'C126  FL1', 'C12', '6', 'FL1', 'Flash Memo', 'ry', NULL),
('1', 'C126  GV1', 'C12', '6', 'GV1', 'MEN TRICOT', ' GLOVE', NULL),
('1', 'C126  GV2', 'C12', '6', 'GV2', 'MC TRICOTE', ' GLOVE', NULL),
('1', 'C126  HN1', 'C12', '6', 'HN1', 'Chandler', NULL, NULL),
('1', 'C126  HT1', 'C12', '6', 'HT1', 'MEN HAT', NULL, NULL),
('1', 'C126  HT2', 'C12', '6', 'HT2', 'ITALIAN HA', 'T', NULL),
('1', 'C126  IC1', 'C12', '6', 'IC1', 'MC ICE CAP', NULL, NULL),
('1', 'C126  KC1', 'C12', '6', 'KC1', 'KC1', NULL, NULL),
('1', 'C126  LR1', 'C12', '6', 'LR1', 'LR1', NULL, NULL),
('1', 'C126  MDL', 'C12', '6', 'MDL', 'CONCRETE M', 'EDAL', NULL),
('1', 'C126  MNQ', 'C12', '6', 'MNQ', 'MEN MANNEQ', 'UIN', NULL),
('1', 'C126  OTH', 'C12', '6', 'OTH', 'MC Others', NULL, NULL),
('1', 'C126  PJ5', 'C12', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('1', 'C126  PJ6', 'C12', '6', 'PJ6', 'PAJAMA BOT', 'TOM', NULL),
('1', 'C126  PJ7', 'C12', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('1', 'C126  PJ8', 'C12', '6', 'PJ8', 'PAJAMA 2 P', 'IECES', NULL),
('1', 'C126  SC1', 'C12', '6', 'SC1', 'Regular le', 'ngth', NULL),
('1', 'C126  SC2', 'C12', '6', 'SC2', 'SOCKS', NULL, NULL),
('1', 'C126  SC3', 'C12', '6', 'SC3', 'ANKLE', NULL, NULL),
('1', 'C126  SF1', 'C12', '6', 'SF1', 'MC SCARF', NULL, NULL),
('1', 'C126  SL1', 'C12', '6', 'SL1', 'SL1', NULL, NULL),
('1', 'C126  SO1', 'C12', '6', 'SO1', 'SO1', NULL, NULL),
('1', 'C126  WB1', 'C12', '6', 'WB1', 'MC Wrist B', 'and', NULL),
('1', 'C126  WL1', 'C12', '6', 'WL1', 'LEATHER WA', 'LLET', NULL),
('1', 'C126  WT1', 'C12', '6', 'WT1', 'WT1', NULL, NULL),
('1', 'C211  SH0', 'C21', '1', 'SH0', 'SHIRT', NULL, NULL),
('1', 'C221  JK2', 'C22', '1', 'JK2', 'KBC FASHIO', 'N JACKET', NULL),
('1', 'C221  PL1', 'C22', '1', 'PL1', 'JBC BSC LT', '. PULLOVER', NULL),
('1', 'C221  PL2', 'C22', '1', 'PL2', 'JBC FASHIO', 'N LT. PULL', 'OVER'),
('1', 'C221  PL3', 'C22', '1', 'PL3', 'JBC REG HV', 'Y. PULLOVE', 'R'),
('1', 'C221  PL4', 'C22', '1', 'PL4', 'JBC FSH.HV', 'Y.PULLOVER', NULL),
('1', 'C221  PL5', 'C22', '1', 'PL5', 'JBC BTN FR', 'NT PULLOVE', 'R'),
('1', 'C221  PL6', 'C22', '1', 'PL6', 'JBC ZIP FR', 'NT PULLOVE', 'R'),
('1', 'C221  PL8', 'C22', '1', 'PL8', 'JBC FIT TI', 'GHT PULLOV', 'ER'),
('1', 'C221  SH1', 'C22', '1', 'SH1', 'JBC L/S SL', 'D SAFARI S', 'HIRT'),
('1', 'C221  SH2', 'C22', '1', 'SH2', 'JBC L/S Y/', 'D & PRINT', 'SHIRT'),
('1', 'C221  SH3', 'C22', '1', 'SH3', 'JBC S/S SL', 'D SAFARI S', 'HIRT'),
('1', 'C221  SH4', 'C22', '1', 'SH4', 'JBC S/S Y/', 'D & PRINT', 'SHIRT'),
('1', 'C221  SH5', 'C22', '1', 'SH5', 'JBC OVERSH', 'IRT', NULL),
('1', 'C221  SH7', 'C22', '1', 'SH7', 'JBC SS REG', ' SHIRT', NULL),
('1', 'C221  SH8', 'C22', '1', 'SH8', 'JBC LS FSH', ' SHIRT', NULL),
('1', 'C221  SW1', 'C22', '1', 'SW1', 'JBC POLO S', 'WEATSHIRT', NULL),
('1', 'C221  SW2', 'C22', '1', 'SW2', 'JBC REG. S', 'WEATSHIRT', NULL),
('1', 'C221  SW3', 'C22', '1', 'SW3', 'JBC FSH SW', 'EATSHIRT', NULL),
('1', 'C221  SW4', 'C22', '1', 'SW4', 'JBC BTN FR', 'NT SWEATSH', 'IRT'),
('1', 'C221  SW5', 'C22', '1', 'SW5', 'JBC ZIP FR', 'NT SWEATSH', 'IRT'),
('1', 'C221  SW7', 'C22', '1', 'SW7', 'JBC FIT TI', 'GHT SWEATS', 'HIRT'),
('1', 'C221  SW9', 'C22', '1', 'SW9', 'JBC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('1', 'C221  TE1', 'C22', '1', 'TE1', 'JBC S/S T-', 'SHIRT', NULL),
('1', 'C221  TE2', 'C22', '1', 'TE2', 'JBC S/S PO', 'LO T-SHIRT', NULL),
('1', 'C221  TE3', 'C22', '1', 'TE3', 'JBC S/S FI', 'TTED T-SHI', 'RT'),
('1', 'C221  TE4', 'C22', '1', 'TE4', 'JBC TANK T', 'OP T-SHIRT', NULL),
('1', 'C221  TE5', 'C22', '1', 'TE5', 'JBC L/S T-', 'SHIRT', NULL),
('1', 'C221  TE6', 'C22', '1', 'TE6', 'JBC L/S PO', 'LO T-SHIRT', NULL),
('1', 'C221  TE7', 'C22', '1', 'TE7', 'JBC L/S FI', 'TTED T-SHI', 'RT'),
('1', 'C221  TE8', 'C22', '1', 'TE8', 'JBC TRAINI', 'NG TOP', NULL),
('1', 'C221  TE9', 'C22', '1', 'TE9', 'JBC SLEEVL', 'ESS T-SHIR', 'T'),
('1', 'C221  VS3', 'C22', '1', 'VS3', 'JBC BASIC', 'VEST', NULL),
('1', 'C221  VS5', 'C22', '1', 'VS5', 'JBC TRICOT', 'E VEST', NULL),
('1', 'C222  PT1', 'C22', '2', 'PT1', 'JBC REGULA', 'R CHINO PA', 'NT'),
('1', 'C222  PT2', 'C22', '2', 'PT2', 'JBC PULLON', ' PANT', NULL),
('1', 'C222  PT3', 'C22', '2', 'PT3', 'JBC FASHIO', 'N PANT', NULL),
('1', 'C222  PT4', 'C22', '2', 'PT4', 'JBC 5 POCK', 'ET PANT', NULL),
('1', 'C222  PT9', 'C22', '2', 'PT9', 'JBC TRAINI', 'NG PANT', NULL),
('1', 'C222  SAM', 'C22', '2', 'SAM', 'SAMPLE', NULL, NULL),
('1', 'C222  SM1', 'C22', '2', 'SM1', 'JBC SWIMWE', 'AR', NULL),
('1', 'C222  SM9', 'C22', '2', 'SM9', 'JBC Btm', NULL, NULL),
('1', 'C222  SR1', 'C22', '2', 'SR1', 'JBC BASIC', 'SHORT', NULL),
('1', 'C222  SR2', 'C22', '2', 'SR2', 'JBC PULLON', ' SHORT', NULL),
('1', 'C222  SR3', 'C22', '2', 'SR3', 'JBC FASHIO', 'N SHORT', NULL),
('1', 'C222  SR4', 'C22', '2', 'SR4', 'JBC PERMUD', 'A SHORT', NULL),
('1', 'C222  SR5', 'C22', '2', 'SR5', 'JBC 5 POCK', 'ET SHORT', NULL),
('1', 'C222  SR9', 'C22', '2', 'SR9', 'JBC TRAINI', 'NG SHORT', NULL),
('1', 'C222  ST1', 'C22', '2', 'ST1', 'JBC SALOPP', 'ETTE SHORT', NULL),
('1', 'C222  ST2', 'C22', '2', 'ST2', 'JBC SALOPP', 'ETTE PANT', NULL),
('1', 'C223  HT1', 'C22', '3', 'HT1', 'HAT', NULL, NULL),
('1', 'C223  JK1', 'C22', '3', 'JK1', 'JBC BASIC', 'JACKET', NULL),
('1', 'C223  JK2', 'C22', '3', 'JK2', 'JBC FASHIO', 'N JACKET', NULL),
('1', 'C223  JK5', 'C22', '3', 'JK5', 'JBC PARKA', 'JACKET', NULL),
('1', 'C223  JK6', 'C22', '3', 'JK6', 'JBC JACKET', NULL, NULL),
('1', 'C223  JK9', 'C22', '3', 'JK9', 'JBC LEATHE', 'R JACKET', NULL),
('1', 'C223  SM1', 'C22', '3', 'SM1', 'JBC SMWR.', '1 Piece', NULL),
('1', 'C223  SW7', 'C22', '3', 'SW7', 'JBC BODY S', 'WEATSHIRT', NULL),
('1', 'C223  TE1', 'C22', '3', 'TE1', 'JBC S/S T-', 'SHIRT', NULL),
('1', 'C223  TE9', 'C22', '3', 'TE9', 'MC SLEEVLE', 'SS T-SHIRT', NULL),
('1', 'C223  VS4', 'C22', '3', 'VS4', 'JBC  SAFAR', 'I VEST', NULL),
('1', 'C224  BX1', 'C22', '4', 'BX1', 'JBC REGULA', 'R BOXER', NULL),
('1', 'C224  BX2', 'C22', '4', 'BX2', 'JBC FITTED', ' BOXER', NULL),
('1', 'C224  TE1', 'C22', '4', 'TE1', 'JBC S/S T-', 'SHIRT', NULL),
('1', 'C224  TE4', 'C22', '4', 'TE4', 'JBC TANK T', 'OP T-SHIRT', NULL),
('1', 'C224  TE5', 'C22', '4', 'TE5', 'JBC L/S UN', 'DERSHIRT', NULL),
('1', 'C224  TE9', 'C22', '4', 'TE9', 'JBC NS T-S', 'HIRT', NULL),
('1', 'C226  BG1', 'C22', '6', 'BG1', 'JGC BAG', NULL, NULL),
('1', 'C226  BG2', 'C22', '6', 'BG2', 'JB BAG', NULL, NULL),
('1', 'C226  BT1', 'C22', '6', 'BT1', 'JBC BELT', NULL, NULL),
('1', 'C226  BT2', 'C22', '6', 'BT2', 'JBC WOVEN', 'BELT', NULL),
('1', 'C226  BT4', 'C22', '6', 'BT4', 'JB Casual', 'BELT', NULL),
('1', 'C226  BT5', 'C22', '6', 'BT5', 'JB Jeans B', 'ELT', NULL),
('1', 'C226  GV1', 'C22', '6', 'GV1', 'JBC  TRICO', 'TE GLOVE', NULL),
('1', 'C226  HN1', 'C22', '6', 'HN1', 'Chandler', NULL, NULL),
('1', 'C226  HT1', 'C22', '6', 'HT1', 'JBC HAT', NULL, NULL),
('1', 'C226  HT2', 'C22', '6', 'HT2', 'ITALIAN HA', 'T', NULL),
('1', 'C226  IC1', 'C22', '6', 'IC1', 'JBC ICE CA', 'P', NULL),
('1', 'C226  OTH', 'C22', '6', 'OTH', 'JBC Others', NULL, NULL),
('1', 'C226  PJ5', 'C22', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('1', 'C226  PJ6', 'C22', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('1', 'C226  PJ7', 'C22', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('1', 'C226  SC1', 'C22', '6', 'SC1', 'Regular le', 'ngth', NULL),
('1', 'C226  SC2', 'C22', '6', 'SC2', 'Medium Len', 'gth', NULL),
('1', 'C226  SC3', 'C22', '6', 'SC3', 'ankle', NULL, NULL),
('1', 'C226  SF1', 'C22', '6', 'SF1', 'JBC SCARF', NULL, NULL),
('1', 'C226  SL1', 'C22', '6', 'SL1', 'JBC SLIPPE', 'R', NULL),
('1', 'C226  SO1', 'C22', '6', 'SO1', 'SHOES', NULL, NULL),
('1', 'C227  SL1', 'C22', '7', 'SL1', 'JBC SLIPPE', 'RS', NULL),
('1', 'C311  JK0', 'C31', '1', 'JK0', 'JACKET', NULL, NULL),
('1', 'C311  PT0', 'C31', '1', 'PT0', 'PANT', NULL, NULL),
('1', 'C311  SH0', 'C31', '1', 'SH0', 'SHIRT', NULL, NULL),
('1', 'C311  SR0', 'C31', '1', 'SR0', 'SHORT', NULL, NULL),
('1', 'C311  ST0', 'C31', '1', 'ST0', 'SALOPPETTE', NULL, NULL),
('1', 'C311  SW0', 'C31', '1', 'SW0', 'SWEATSHIRT', NULL, NULL),
('1', 'C311  TE0', 'C31', '1', 'TE0', 'T-SHIRT', NULL, NULL),
('1', 'C321  C32', 'C32', '1', 'C32', 'KBC TRICOT', 'E VEST', NULL),
('1', 'C321  JK2', 'C32', '1', 'JK2', 'KBC FASHIO', 'N JACKET', NULL),
('1', 'C321  PL1', 'C32', '1', 'PL1', 'KBC BSC LT', '. PULLOVER', NULL),
('1', 'C321  PL2', 'C32', '1', 'PL2', 'KBC FASHIO', 'N LT. PULL', 'OVER'),
('1', 'C321  PL3', 'C32', '1', 'PL3', 'KBC REG HV', 'Y. PULLOVE', 'R'),
('1', 'C321  PL4', 'C32', '1', 'PL4', 'KBC FSH.HV', 'Y.PULLOVER', NULL),
('1', 'C321  PL5', 'C32', '1', 'PL5', 'KBC BTN FR', 'NT PULLOVE', 'R'),
('1', 'C321  PL6', 'C32', '1', 'PL6', 'KBC ZIP FR', 'NT PULLOVE', 'R'),
('1', 'C321  PL8', 'C32', '1', 'PL8', 'KBC FIT TI', 'GHT PULLOV', 'ER'),
('1', 'C321  SH1', 'C32', '1', 'SH1', 'KBC L/S SL', 'D SAFARI S', 'HIRT'),
('1', 'C321  SH2', 'C32', '1', 'SH2', 'KBC L/S Y/', 'D & PRINT', 'SHIRT'),
('1', 'C321  SH3', 'C32', '1', 'SH3', 'KBC S/S SL', 'D SAFARI S', 'HIRT'),
('1', 'C321  SH4', 'C32', '1', 'SH4', 'KBC S/S Y/', 'D & PRINT', 'SHIRT'),
('1', 'C321  SH5', 'C32', '1', 'SH5', 'KBC OVERSH', 'IRT', NULL),
('1', 'C321  SH7', 'C32', '1', 'SH7', 'KBC SS REG', ' SHIRT', NULL),
('1', 'C321  SH8', 'C32', '1', 'SH8', 'KBC LS FSH', ' SHIRT', NULL),
('1', 'C321  SW1', 'C32', '1', 'SW1', 'KBC POLO S', 'WEATSHIRT', NULL),
('1', 'C321  SW2', 'C32', '1', 'SW2', 'KBC REG. S', 'WEATSHIRT', NULL),
('1', 'C321  SW3', 'C32', '1', 'SW3', 'KBC FSH SW', 'EATSHIRT', NULL),
('1', 'C321  SW4', 'C32', '1', 'SW4', 'KBC BTN FR', 'NT SWEATSH', 'IRT'),
('1', 'C321  SW5', 'C32', '1', 'SW5', 'KBC ZIP FR', 'NT SWEATSH', 'IRT'),
('1', 'C321  SW7', 'C32', '1', 'SW7', 'KBC FIT TI', 'GHT SWEATS', 'HIRT'),
('1', 'C321  SW9', 'C32', '1', 'SW9', 'KBC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('1', 'C321  TE1', 'C32', '1', 'TE1', 'KBC S/S T-', 'SHIRT', NULL),
('1', 'C321  TE2', 'C32', '1', 'TE2', 'KBC S/S PO', 'LO T-SHIRT', NULL),
('1', 'C321  TE3', 'C32', '1', 'TE3', 'KBC S/S FI', 'TTED T-SHI', 'RT'),
('1', 'C321  TE4', 'C32', '1', 'TE4', 'KBC TANK T', 'OP T-SHIRT', NULL),
('1', 'C321  TE5', 'C32', '1', 'TE5', 'KBC L/S T-', 'SHIRT', NULL),
('1', 'C321  TE6', 'C32', '1', 'TE6', 'KBC L/S PO', 'LO T-SHIRT', NULL),
('1', 'C321  TE7', 'C32', '1', 'TE7', 'KBC L/S FI', 'TTED T-SHI', 'RT'),
('1', 'C321  TE8', 'C32', '1', 'TE8', 'KBC TRAINI', 'NG TOP', NULL),
('1', 'C321  TE9', 'C32', '1', 'TE9', 'KBC SLEEVL', 'ESS T-SHIR', 'T'),
('1', 'C321  VS3', 'C32', '1', 'VS3', 'KBC BASIC', 'VEST', NULL),
('1', 'C321  VS5', 'C32', '1', 'VS5', 'KBC TRICOT', 'E VEST', NULL),
('1', 'C322  PT1', 'C32', '2', 'PT1', 'KBC REGULA', 'R CHINO PA', 'NT'),
('1', 'C322  PT2', 'C32', '2', 'PT2', 'KBC PULLON', ' PANT', NULL),
('1', 'C322  PT3', 'C32', '2', 'PT3', 'KBC FASHIO', 'N PANT', NULL),
('1', 'C322  PT4', 'C32', '2', 'PT4', 'KBC 5 POCK', 'ET PANT', NULL),
('1', 'C322  PT9', 'C32', '2', 'PT9', 'KBC TRAINI', 'NG PANT', NULL),
('1', 'C322  SM1', 'C32', '2', 'SM1', 'KBC SWIMWE', 'AR', NULL),
('1', 'C322  SM9', 'C32', '2', 'SM9', 'KBC SWIMWE', 'AR', NULL),
('1', 'C322  SR1', 'C32', '2', 'SR1', 'KBC BASIC', 'SHORT', NULL),
('1', 'C322  SR2', 'C32', '2', 'SR2', 'KBC PULLON', ' SHORT', NULL),
('1', 'C322  SR3', 'C32', '2', 'SR3', 'KBC FASHIO', 'N SHORT', NULL),
('1', 'C322  SR4', 'C32', '2', 'SR4', 'KBC PERMUD', 'A SHORT', NULL),
('1', 'C322  SR5', 'C32', '2', 'SR5', 'KBC 5 POCK', 'ET SHORT', NULL),
('1', 'C322  SR9', 'C32', '2', 'SR9', 'KBC TRAINI', 'NG SHORT', NULL),
('1', 'C322  ST1', 'C32', '2', 'ST1', 'KBC SALOPP', 'ETTE SHORT', NULL),
('1', 'C322  ST2', 'C32', '2', 'ST2', 'KBC SALOPP', 'ETTE PANT', NULL),
('1', 'C323  HT1', 'C32', '3', 'HT1', 'HAT', NULL, NULL),
('1', 'C323  JK1', 'C32', '3', 'JK1', 'KBC BASIC', 'JACKET', NULL),
('1', 'C323  JK2', 'C32', '3', 'JK2', 'KBC FASHIO', 'N JACKET', NULL),
('1', 'C323  JK5', 'C32', '3', 'JK5', 'KBC PARKA', 'JACKET', NULL),
('1', 'C323  JK6', 'C32', '3', 'JK6', 'KBC Jacket', NULL, NULL),
('1', 'C323  JK9', 'C32', '3', 'JK9', 'KBC LEATHE', 'R JACKET', NULL),
('1', 'C323  SM1', 'C32', '3', 'SM1', 'KBC SMWR.', '1 Piece', NULL),
('1', 'C323  SW7', 'C32', '3', 'SW7', 'KBC BODY S', 'WEATSHIRT', NULL),
('1', 'C323  TE1', 'C32', '3', 'TE1', 'KBC S/S T-', 'SHIRT', NULL),
('1', 'C323  TE9', 'C32', '3', 'TE9', 'MC SLEEVLE', 'SS T-SHIRT', NULL),
('1', 'C324  BX1', 'C32', '4', 'BX1', 'KBC REGULA', 'R BOXER', NULL),
('1', 'C324  BX2', 'C32', '4', 'BX2', 'KBC  FITTE', 'D BOXER', NULL),
('1', 'C324  TE1', 'C32', '4', 'TE1', 'KBC S/S T-', 'SHIRT', NULL),
('1', 'C324  TE4', 'C32', '4', 'TE4', 'KBC TANK T', 'OP T-SHIRT', NULL),
('1', 'C324  TE5', 'C32', '4', 'TE5', 'KBC L/S T.', 'SHIRT', NULL),
('1', 'C324  TE9', 'C32', '4', 'TE9', 'KBC NS T-S', 'HIRT', NULL),
('1', 'C325  SC5', 'C32', '5', 'SC5', 'KBC HOME S', 'OCKS', NULL),
('1', 'C326  BG1', 'C32', '6', 'BG1', 'JGC BAG', NULL, NULL),
('1', 'C326  BG2', 'C32', '6', 'BG2', 'JB BAG', NULL, NULL),
('1', 'C326  BT1', 'C32', '6', 'BT1', 'KBC BELT', NULL, NULL),
('1', 'C326  BT2', 'C32', '6', 'BT2', 'JBC WOVEN', 'BELT', NULL),
('1', 'C326  BT4', 'C32', '6', 'BT4', 'KB Casual', 'BELT', NULL),
('1', 'C326  BT5', 'C32', '6', 'BT5', 'KB Jeans B', 'ELT', NULL),
('1', 'C326  GV1', 'C32', '6', 'GV1', 'KBC  TRICO', 'TE GLOVE', NULL),
('1', 'C326  HN1', 'C32', '6', 'HN1', 'Chandler', NULL, NULL),
('1', 'C326  HT1', 'C32', '6', 'HT1', 'KBC HAT', NULL, NULL),
('1', 'C326  HT2', 'C32', '6', 'HT2', 'ITALIAN HA', 'T', NULL),
('1', 'C326  IC1', 'C32', '6', 'IC1', 'KBC ICE CA', 'P', NULL),
('1', 'C326  MNQ', 'C32', '6', 'MNQ', 'BOYS MANNE', 'QUIN', NULL),
('1', 'C326  OTH', 'C32', '6', 'OTH', 'KBC Others', NULL, NULL),
('1', 'C326  PJ5', 'C32', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('1', 'C326  PJ6', 'C32', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('1', 'C326  PJ7', 'C32', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('1', 'C326  SC1', 'C32', '6', 'SC1', 'Regular le', 'ngth', NULL),
('1', 'C326  SC2', 'C32', '6', 'SC2', 'Medium Len', 'gth', NULL),
('1', 'C326  SC3', 'C32', '6', 'SC3', 'SOCKS', NULL, NULL),
('1', 'C326  SC5', 'C32', '6', 'SC5', 'KBC SOCKS', NULL, NULL),
('1', 'C326  SF1', 'C32', '6', 'SF1', 'KBC SCARF', NULL, NULL),
('1', 'C326  SL1', 'C32', '6', 'SL1', 'KBC SLIPPE', 'R', NULL),
('1', 'C326  SO1', 'C32', '6', 'SO1', 'SHOSES', NULL, NULL),
('1', 'C327  SL1', 'C32', '7', 'SL1', 'KBC SLIPPE', 'RS', NULL),
('1', 'C411  PT0', 'C41', '1', 'PT0', 'Pant', NULL, NULL),
('1', 'C411  VS0', 'C41', '1', 'VS0', 'VEST', NULL, NULL),
('1', 'C421  BL1', 'C42', '1', 'BL1', 'JGC L/S BT', 'N FRNT BLO', 'USE'),
('1', 'C421  BL2', 'C42', '1', 'BL2', 'JGC S/S BT', 'N FRNT BLO', 'USE'),
('1', 'C421  BL3', 'C42', '1', 'BL3', 'JGC N/S BT', 'N FRNT BLO', 'USE'),
('1', 'C421  BL4', 'C42', '1', 'BL4', 'JGC L/S BL', 'OUSE', NULL),
('1', 'C421  BL5', 'C42', '1', 'BL5', 'JGC S/S BL', 'OUSE', NULL),
('1', 'C421  BL6', 'C42', '1', 'BL6', 'JGC SLEEVE', 'LESS BLOUS', 'E'),
('1', 'C421  BL7', 'C42', '1', 'BL7', 'JGC TANK T', 'OP BLOUSE', NULL),
('1', 'C421  BL9', 'C42', '1', 'BL9', 'JGC JACKET', '/SET BLOUS', 'E'),
('1', 'C421  JK2', 'C42', '1', 'JK2', 'JGC FASHIO', 'N JACKET', NULL),
('1', 'C421  JK8', 'C42', '1', 'JK8', 'RELATED JA', 'CKET-OVER', 'SHIRT'),
('1', 'C421  PL1', 'C42', '1', 'PL1', 'JGC BSC LT', '. PULLOVER', NULL),
('1', 'C421  PL2', 'C42', '1', 'PL2', 'JGC FASHIO', 'N LT. PULL', 'OVER'),
('1', 'C421  PL3', 'C42', '1', 'PL3', 'JGC REG HV', 'Y. PULLOVE', 'R'),
('1', 'C421  PL4', 'C42', '1', 'PL4', 'JGC FSH.HV', 'Y.PULLOVER', NULL),
('1', 'C421  PL5', 'C42', '1', 'PL5', 'JGC BTN FR', 'NT PULLOVE', 'R'),
('1', 'C421  PL6', 'C42', '1', 'PL6', 'JGC ZIP FR', 'NT PULLOVE', 'R'),
('1', 'C421  PL7', 'C42', '1', 'PL7', 'JGC TWIN S', 'ET LT.PULL', 'OVER'),
('1', 'C421  PL8', 'C42', '1', 'PL8', 'JGC FIT TI', 'GHT PULLOV', 'ER'),
('1', 'C421  SH5', 'C42', '1', 'SH5', 'JGC OVERSH', 'IRT', NULL),
('1', 'C421  SW1', 'C42', '1', 'SW1', 'JGC POLO S', 'WEATSHIRT', NULL),
('1', 'C421  SW2', 'C42', '1', 'SW2', 'JGC REG. S', 'WEATSHIRT', NULL),
('1', 'C421  SW3', 'C42', '1', 'SW3', 'JGC FSH SW', 'EATSHIRT', NULL),
('1', 'C421  SW4', 'C42', '1', 'SW4', 'JGC BTN FR', 'NT SWEATSH', 'IRT'),
('1', 'C421  SW5', 'C42', '1', 'SW5', 'JGC ZIP FR', 'NT SWEATSH', 'IRT'),
('1', 'C421  SW6', 'C42', '1', 'SW6', 'JGC TWIN S', 'ET SWEATSH', 'IRT'),
('1', 'C421  SW7', 'C42', '1', 'SW7', 'JGC FIT TI', 'GHT SWEATS', 'HIRT'),
('1', 'C421  SW9', 'C42', '1', 'SW9', 'JGC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('1', 'C421  TE1', 'C42', '1', 'TE1', 'JGC S/S T-', 'SHIRT', NULL),
('1', 'C421  TE2', 'C42', '1', 'TE2', 'JGC S/S PO', 'LO T-SHIRT', NULL),
('1', 'C421  TE3', 'C42', '1', 'TE3', 'JGC S/S FI', 'TTED T-SHI', 'RT'),
('1', 'C421  TE4', 'C42', '1', 'TE4', 'JGC TANK T', 'OP T-SHIRT', NULL),
('1', 'C421  TE5', 'C42', '1', 'TE5', 'JGC L/S T-', 'SHIRT', NULL),
('1', 'C421  TE6', 'C42', '1', 'TE6', 'JGC L/S PO', 'LO T-SHIRT', NULL),
('1', 'C421  TE7', 'C42', '1', 'TE7', 'JGC L/S FI', 'TTED T-SHI', 'RT'),
('1', 'C421  TE8', 'C42', '1', 'TE8', 'JGC TWIN S', 'ET T-SHIRT', NULL),
('1', 'C421  TE9', 'C42', '1', 'TE9', 'JGC SLEEVL', 'ESS T-SHIR', 'T'),
('1', 'C421  VS3', 'C42', '1', 'VS3', 'JGC REGULA', 'R CASUAL V', 'EST\r\n\r\n \r\n'),
('1', 'C421  VS4', 'C42', '1', 'VS4', 'JGC  SAFAR', 'I VEST', NULL),
('1', 'C421  VS5', 'C42', '1', 'VS5', 'JGC TRICOT', 'E VEST', NULL),
('1', 'C422  DR3', 'C42', '2', 'DR3', 'JGC  2 PIC', 'ES DRESS', NULL),
('1', 'C422  DR4', 'C42', '2', 'DR4', 'S/S REGULA', 'R  LNGTH D', 'RESS'),
('1', 'C422  DR7', 'C42', '2', 'DR7', 'JGC N/S RE', 'G DRESS', NULL),
('1', 'C422  DR8', 'C42', '2', 'DR8', 'NO SLV LNG', ' DRESS', NULL),
('1', 'C422  PT1', 'C42', '2', 'PT1', 'JGC REGULA', 'R CHINO PA', 'NT'),
('1', 'C422  PT2', 'C42', '2', 'PT2', 'JGC PULLON', ' PANT', NULL),
('1', 'C422  PT3', 'C42', '2', 'PT3', 'JGC FASHIO', 'N PANT', NULL),
('1', 'C422  PT4', 'C42', '2', 'PT4', 'JGC 5 POCK', 'ET PANT', NULL),
('1', 'C422  PT9', 'C42', '2', 'PT9', 'JGC TRAINI', 'NG PANT', NULL),
('1', 'C422  SAM', 'C42', '2', 'SAM', 'SAMPLE', NULL, NULL),
('1', 'C422  SK1', 'C42', '2', 'SK1', 'JGC REGULA', 'R SKIRT', NULL),
('1', 'C422  SK2', 'C42', '2', 'SK2', 'JGC LONG S', 'KIRT', NULL),
('1', 'C422  SK3', 'C42', '2', 'SK3', 'JGC SHORT', 'SKIRT', NULL),
('1', 'C422  SK4', 'C42', '2', 'SK4', 'JGC SKIRT', NULL, NULL),
('1', 'C422  SK6', 'C42', '2', 'SK6', 'JGC REGULA', 'R SKORT', NULL),
('1', 'C422  SK7', 'C42', '2', 'SK7', 'JGC LONG S', 'KORT', NULL),
('1', 'C422  SK8', 'C42', '2', 'SK8', 'JGC SHORT', 'SKORT', NULL),
('1', 'C422  SR1', 'C42', '2', 'SR1', 'JGC BASIC', 'SHORT', NULL),
('1', 'C422  SR2', 'C42', '2', 'SR2', 'JGC PULLON', ' SHORT', NULL),
('1', 'C422  SR3', 'C42', '2', 'SR3', 'JGC FASHIO', 'N SHORT', NULL),
('1', 'C422  SR4', 'C42', '2', 'SR4', 'JGC PERMUD', 'A SHORT', NULL),
('1', 'C422  SR5', 'C42', '2', 'SR5', 'JGC 5 POCK', 'ET SHORT', NULL),
('1', 'C422  SR9', 'C42', '2', 'SR9', 'JGC TRAINI', 'NG SHORT', NULL),
('1', 'C422  ST1', 'C42', '2', 'ST1', 'JGC SALOPP', 'ETTE SHORT', NULL),
('1', 'C422  ST2', 'C42', '2', 'ST2', 'JGC SALOPP', 'ETTE PANT', NULL),
('1', 'C422  ST3', 'C42', '2', 'ST3', 'JGC SALOPP', 'ETTE DRESS', NULL),
('1', 'C423  CM1', 'C42', '3', 'CM1', 'JGC CACHE', 'MAILLOT', NULL),
('1', 'C423  CT1', 'C42', '3', 'CT1', 'JGC S.BREA', 'ST REG COA', 'T'),
('1', 'C423  DR1', 'C42', '3', 'DR1', 'JGC L/S RE', 'G DRESS', NULL),
('1', 'C423  DR2', 'C42', '3', 'DR2', 'JGC L/S LO', 'NG DRESS', NULL),
('1', 'C423  DR3', 'C42', '3', 'DR3', 'JGC L/S SH', 'ORT DRESS', NULL),
('1', 'C423  DR4', 'C42', '3', 'DR4', 'JGC S/S RE', 'G DRESS', NULL),
('1', 'C423  DR5', 'C42', '3', 'DR5', 'JGC S/S LO', 'NG DRESS', NULL),
('1', 'C423  DR6', 'C42', '3', 'DR6', 'JGC S/S SH', 'ORT DRESS', NULL),
('1', 'C423  DR7', 'C42', '3', 'DR7', 'JGC N/S RE', 'G DRESS', NULL),
('1', 'C423  DR8', 'C42', '3', 'DR8', 'JGC N/S LO', 'NG DRESS', NULL),
('1', 'C423  DR9', 'C42', '3', 'DR9', 'JGC N/S SH', 'ORT DRESS', NULL),
('1', 'C423  HT1', 'C42', '3', 'HT1', 'JGC HAT', NULL, NULL),
('1', 'C423  JK1', 'C42', '3', 'JK1', 'JGC BASIC', 'JACKET', NULL),
('1', 'C423  JK2', 'C42', '3', 'JK2', 'JGC FASHIO', 'N JACKET', NULL),
('1', 'C423  JK5', 'C42', '3', 'JK5', 'JGC PARKA', 'JACKET', NULL),
('1', 'C423  JK9', 'C42', '3', 'JK9', 'JGC LEATHE', 'R JACKET', NULL),
('1', 'C423  SM1', 'C42', '3', 'SM1', 'JGC SMWR.', '1 Piece', NULL),
('1', 'C423  SM2', 'C42', '3', 'SM2', 'JGC SMWR.', '2 Pieces', NULL),
('1', 'C423  SW3', 'C42', '3', 'SW3', 'JGC BODY S', 'WEATSHIRT', NULL),
('1', 'C423  SW7', 'C42', '3', 'SW7', 'JGC BODY S', 'WEATSHIRT', NULL),
('1', 'C423  TE1', 'C42', '3', 'TE1', 'JGC S/S T-', 'SHIRT', NULL),
('1', 'C423  TE4', 'C42', '3', 'TE4', 'TANK TOP S', 'EPARATE T-', 'SHIRT'),
('1', 'C423  TE9', 'C42', '3', 'TE9', 'KGC BASIC', 'SUSPENDER', NULL),
('1', 'C423  VS2', 'C42', '3', 'VS2', 'JGC S.BREA', 'ST', NULL),
('1', 'C423  VS3', 'C42', '3', 'VS3', 'JGC BASIC', 'VEST', NULL),
('1', 'C424  PY1', 'C42', '4', 'PY1', 'JGC REGULA', 'R PANTY', NULL),
('1', 'C424  PY2', 'C42', '4', 'PY2', 'JGC BIKINI', ' PANTY', NULL),
('1', 'C424  PY9', 'C42', '4', 'PY9', 'JGC Uware', NULL, NULL),
('1', 'C424  TE1', 'C42', '4', 'TE1', 'JGC S/S T-', 'SHIRT', NULL),
('1', 'C424  TE2', 'C42', '4', 'TE2', 'JGC SS POL', 'O T-SHIRT', NULL),
('1', 'C424  TE4', 'C42', '4', 'TE4', 'JGC TANK T', 'OP T-SHIRT', NULL),
('1', 'C424  TE9', 'C42', '4', 'TE9', 'JGC SLEEVL', 'ESS T-SHIR', 'T'),
('1', 'C426  BD1', 'C42', '6', 'BD1', 'SQUARED BA', 'NDANA', NULL),
('1', 'C426  BD2', 'C42', '6', 'BD2', 'SQUARED BA', 'NDANA', NULL),
('1', 'C426  BG1', 'C42', '6', 'BG1', 'JGC BAG', NULL, NULL),
('1', 'C426  BG2', 'C42', '6', 'BG2', 'JB BAG', NULL, NULL),
('1', 'C426  BT1', 'C42', '6', 'BT1', 'JGC BELT', NULL, NULL),
('1', 'C426  BT2', 'C42', '6', 'BT2', 'JGC NO BUC', 'KLE BELT', NULL),
('1', 'C426  BT4', 'C42', '6', 'BT4', 'JG Casual', 'BELT', NULL),
('1', 'C426  BT5', 'C42', '6', 'BT5', 'JG Jeans B', 'ELT', NULL),
('1', 'C426  GV1', 'C42', '6', 'GV1', 'KIDS TRICO', 'T GLOVE', NULL),
('1', 'C426  HA1', 'C42', '6', 'HA1', 'HAIR HOOP', NULL, NULL),
('1', 'C426  HA2', 'C42', '6', 'HA2', 'HAIR CHOUC', 'HOU', NULL),
('1', 'C426  HN1', 'C42', '6', 'HN1', 'Chandler', NULL, NULL),
('1', 'C426  HT1', 'C42', '6', 'HT1', 'JGC HAT', NULL, NULL),
('1', 'C426  HT3', 'C42', '6', 'HT3', 'JGC Sun HA', 'T', NULL),
('1', 'C426  HT5', 'C42', '6', 'HT5', 'JGC Sun HA', 'T', NULL),
('1', 'C426  IC1', 'C42', '6', 'IC1', 'JGC ICE CA', 'P', NULL),
('1', 'C426  OTH', 'C42', '6', 'OTH', 'JGC Others', NULL, NULL),
('1', 'C426  PJ5', 'C42', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('1', 'C426  PJ6', 'C42', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('1', 'C426  PJ7', 'C42', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('1', 'C426  PN1', 'C42', '6', 'PN1', 'JGC PONCHE', 'S', NULL),
('1', 'C426  SF1', 'C42', '6', 'SF1', 'JGC SCARF', NULL, NULL),
('1', 'C426  SO1', 'C42', '6', 'SO1', 'SHOSES', NULL, NULL),
('1', 'C426  WB1', 'C42', '6', 'WB1', 'JGC WRISTB', 'ANDS', NULL),
('1', 'C427  SO1', 'C42', '7', 'SO1', 'JGC SHOES', NULL, NULL),
('1', 'C511  BL0', 'C51', '1', 'BL0', 'BLOUSE', NULL, NULL),
('1', 'C511  DR0', 'C51', '1', 'DR0', 'C511  DR0', NULL, NULL),
('1', 'C511  JK0', 'C51', '1', 'JK0', 'JACKET', NULL, NULL),
('1', 'C511  PT0', 'C51', '1', 'PT0', 'PANT', NULL, NULL),
('1', 'C511  SK0', 'C51', '1', 'SK0', 'SKIRT', NULL, NULL),
('1', 'C511  SR0', 'C51', '1', 'SR0', 'Short', NULL, NULL),
('1', 'C511  ST0', 'C51', '1', 'ST0', 'SALOPETTE', NULL, NULL),
('1', 'C521  BL1', 'C52', '1', 'BL1', 'KGC L/S BT', 'N FRNT BLO', 'USE'),
('1', 'C521  BL2', 'C52', '1', 'BL2', 'KGC S/S BT', 'N FRNT BLO', 'USE'),
('1', 'C521  BL3', 'C52', '1', 'BL3', 'KGC N/S BT', 'N FRNT BLO', 'USE'),
('1', 'C521  BL4', 'C52', '1', 'BL4', 'KGC L/S BL', 'OUSE', NULL),
('1', 'C521  BL5', 'C52', '1', 'BL5', 'KGC S/S BL', 'OUSE', NULL),
('1', 'C521  BL6', 'C52', '1', 'BL6', 'KGC SLEEVE', 'LESS BLOUS', 'E'),
('1', 'C521  BL7', 'C52', '1', 'BL7', 'KGC TANK T', 'OP BLOUSE', NULL),
('1', 'C521  BL9', 'C52', '1', 'BL9', 'KGC JACKET', '/SET BLOUS', 'E'),
('1', 'C521  JK8', 'C52', '1', 'JK8', 'RELATED JA', 'CKET-OVER', 'SHIRT'),
('1', 'C521  PL1', 'C52', '1', 'PL1', 'KGC BSC LT', '. PULLOVER', NULL),
('1', 'C521  PL2', 'C52', '1', 'PL2', 'KGC FASHIO', 'N LT. PULL', 'OVER'),
('1', 'C521  PL3', 'C52', '1', 'PL3', 'KGC REG HV', 'Y. PULLOVE', 'R'),
('1', 'C521  PL4', 'C52', '1', 'PL4', 'KGC FSH.HV', 'Y.PULLOVER', NULL),
('1', 'C521  PL5', 'C52', '1', 'PL5', 'KGC BTN FR', 'NT PULLOVE', 'R'),
('1', 'C521  PL6', 'C52', '1', 'PL6', 'KGC ZIP FR', 'NT PULLOVE', 'R'),
('1', 'C521  PL7', 'C52', '1', 'PL7', 'KGC TWIN S', 'ET LT.PULL', 'OVER'),
('1', 'C521  PL8', 'C52', '1', 'PL8', 'KGC FIT TI', 'GHT PULLOV', 'ER'),
('1', 'C521  SH5', 'C52', '1', 'SH5', 'KGC OVERSH', 'IRT', NULL),
('1', 'C521  SW1', 'C52', '1', 'SW1', 'KGC POLO S', 'WEATSHIRT', NULL),
('1', 'C521  SW2', 'C52', '1', 'SW2', 'KGC REG. S', 'WEATSHIRT', NULL),
('1', 'C521  SW3', 'C52', '1', 'SW3', 'KGC FSH SW', 'EATSHIRT', NULL),
('1', 'C521  SW4', 'C52', '1', 'SW4', 'KGC BTN FR', 'NT SWEATSH', 'IRT'),
('1', 'C521  SW5', 'C52', '1', 'SW5', 'KGC ZIP FR', 'NT SWEATSH', 'IRT'),
('1', 'C521  SW6', 'C52', '1', 'SW6', 'KGC TWIN S', 'ET SWEATSH', 'IRT'),
('1', 'C521  SW7', 'C52', '1', 'SW7', 'KGC FIT TI', 'GHT SWEATS', 'HIRT'),
('1', 'C521  SW9', 'C52', '1', 'SW9', 'KGC TRAINI', 'NG TOP SWE', 'ATSHIRT'),
('1', 'C521  TE1', 'C52', '1', 'TE1', 'KGC S/S T-', 'SHIRT', NULL),
('1', 'C521  TE2', 'C52', '1', 'TE2', 'KGC S/S PO', 'LO T-SHIRT', NULL),
('1', 'C521  TE3', 'C52', '1', 'TE3', 'KGC S/S FI', 'TTED T-SHI', 'RT'),
('1', 'C521  TE4', 'C52', '1', 'TE4', 'KGC TANK T', 'OP T-SHIRT', NULL),
('1', 'C521  TE5', 'C52', '1', 'TE5', 'KGC L/S T-', 'SHIRT', NULL),
('1', 'C521  TE6', 'C52', '1', 'TE6', 'KGC L/S PO', 'LO T-SHIRT', NULL),
('1', 'C521  TE7', 'C52', '1', 'TE7', 'KGC L/S FI', 'TTED T-SHI', 'RT'),
('1', 'C521  TE8', 'C52', '1', 'TE8', 'KGC TWIN S', 'ET T-SHIRT', NULL),
('1', 'C521  TE9', 'C52', '1', 'TE9', 'KGC SLEEVL', 'ESS T-SHIR', 'T'),
('1', 'C521  VS3', 'C52', '1', 'VS3', 'KGC REGULA', 'R CASUAL V', 'EST'),
('1', 'C521  VS5', 'C52', '1', 'VS5', 'KGC TRICOT', 'E VEST', NULL),
('1', 'C522  DR3', 'C52', '2', 'DR3', 'KGC 2 PICE', 'S DRESS', NULL),
('1', 'C522  DR7', 'C52', '2', 'DR7', 'KGC NS REG', ' DRESS', NULL),
('1', 'C522  DR8', 'C52', '2', 'DR8', 'KGC NS LNG', ' DRESS', NULL),
('1', 'C522  PT1', 'C52', '2', 'PT1', 'KGC REGULA', 'R CHINO PA', 'NT'),
('1', 'C522  PT2', 'C52', '2', 'PT2', 'KGC PULLON', ' PANT', NULL),
('1', 'C522  PT3', 'C52', '2', 'PT3', 'KGC FASHIO', 'N PANT', NULL),
('1', 'C522  PT4', 'C52', '2', 'PT4', 'KGC 5 POCK', 'ET PANT', NULL),
('1', 'C522  PT9', 'C52', '2', 'PT9', 'KGC TRAINI', 'NG PANT', NULL),
('1', 'C522  SK1', 'C52', '2', 'SK1', 'KGC REGULA', 'R SKIRT', NULL),
('1', 'C522  SK2', 'C52', '2', 'SK2', 'KGC LONG S', 'KIRT', NULL),
('1', 'C522  SK3', 'C52', '2', 'SK3', 'KGC SHORT', 'SKIRT', NULL),
('1', 'C522  SK4', 'C52', '2', 'SK4', 'KGC Btm', NULL, NULL),
('1', 'C522  SK6', 'C52', '2', 'SK6', 'KGC REGULA', 'R SKORT', NULL),
('1', 'C522  SK7', 'C52', '2', 'SK7', 'KGC LONG S', 'KORT', NULL),
('1', 'C522  SK8', 'C52', '2', 'SK8', 'KGC SHORT', 'SKORT', NULL),
('1', 'C522  SR1', 'C52', '2', 'SR1', 'KGC BASIC', 'SHORT', NULL),
('1', 'C522  SR2', 'C52', '2', 'SR2', 'KGC PULLON', ' SHORT', NULL),
('1', 'C522  SR3', 'C52', '2', 'SR3', 'KGC FASHIO', 'N SHORT', NULL),
('1', 'C522  SR4', 'C52', '2', 'SR4', 'KGC PERMUD', 'A SHORT', NULL),
('1', 'C522  SR5', 'C52', '2', 'SR5', 'KGC 5 POCK', 'ET SHORT', NULL),
('1', 'C522  SR9', 'C52', '2', 'SR9', 'KGC TRAINI', 'NG SHORT', NULL),
('1', 'C522  ST1', 'C52', '2', 'ST1', 'KGC SALOPP', 'ETTE SHORT', NULL),
('1', 'C522  ST2', 'C52', '2', 'ST2', 'KGC SALOPP', 'ETTE PANT', NULL),
('1', 'C522  ST3', 'C52', '2', 'ST3', 'KGC SALOPP', 'ETTE DRESS', NULL),
('1', 'C522  TE3', 'C52', '2', 'TE3', 'KGC TANK T', 'OP T-SHIRT', NULL),
('1', 'C523  CM1', 'C52', '3', 'CM1', 'KGC CACHE', 'MAILLOT', NULL),
('1', 'C523  CT1', 'C52', '3', 'CT1', 'KGC S.BREA', 'ST REG COA', 'T'),
('1', 'C523  DR1', 'C52', '3', 'DR1', 'KGC L/S RE', 'G DRESS', NULL),
('1', 'C523  DR2', 'C52', '3', 'DR2', 'KGC L/S LO', 'NG DRESS', NULL),
('1', 'C523  DR3', 'C52', '3', 'DR3', 'KGC L/S SH', 'ORT DRESS', NULL),
('1', 'C523  DR4', 'C52', '3', 'DR4', 'KGC S/S RE', 'G DRESS', NULL),
('1', 'C523  DR5', 'C52', '3', 'DR5', 'KGC S/S LO', 'NG DRESS', NULL),
('1', 'C523  DR6', 'C52', '3', 'DR6', 'KGC S/S SH', 'ORT DRESS', NULL),
('1', 'C523  DR7', 'C52', '3', 'DR7', 'KGC N/S RE', 'G DRESS', NULL),
('1', 'C523  DR8', 'C52', '3', 'DR8', 'KGC N/S LO', 'NG DRESS', NULL),
('1', 'C523  DR9', 'C52', '3', 'DR9', 'KGC N/S SH', 'ORT DRESS', NULL),
('1', 'C523  HT1', 'C52', '3', 'HT1', 'KGC HAT', NULL, NULL),
('1', 'C523  JK1', 'C52', '3', 'JK1', 'KGC BASIC', 'JACKET', NULL),
('1', 'C523  JK2', 'C52', '3', 'JK2', 'KGC FASHIO', 'N JACKET', NULL),
('1', 'C523  JK5', 'C52', '3', 'JK5', 'KGC PARKA', 'JACKET', NULL),
('1', 'C523  JK9', 'C52', '3', 'JK9', 'KGC LEATHE', 'R JACKET', NULL),
('1', 'C523  PT2', 'C52', '3', 'PT2', 'KGC FASHIO', 'N PANT', NULL),
('1', 'C523  SM1', 'C52', '3', 'SM1', 'KGC SMWR.', '1 Piece', NULL),
('1', 'C523  SM2', 'C52', '3', 'SM2', 'KGC SMWR.', '2 Pieces', NULL),
('1', 'C523  ST1', 'C52', '3', 'ST1', 'KGC SALOPE', 'TTE SHORT', NULL),
('1', 'C523  SW3', 'C52', '3', 'SW3', 'KGC BODY S', 'WEATSHIRT', NULL),
('1', 'C523  SW7', 'C52', '3', 'SW7', 'KGC BODY S', 'WEATSHIRT', NULL),
('1', 'C523  TE1', 'C52', '3', 'TE1', 'KGC S/S T-', 'SHIRT', NULL),
('1', 'C523  TE4', 'C52', '3', 'TE4', 'TANK TOP S', 'EPARATE T-', 'SHIRT'),
('1', 'C523  TE9', 'C52', '3', 'TE9', 'KGC BASIC', 'SUSPENDER', NULL),
('1', 'C523  VS2', 'C52', '3', 'VS2', 'KGC S.BREA', 'ST', NULL),
('1', 'C523  VS3', 'C52', '3', 'VS3', 'KGC BASIC', 'VEST', NULL),
('1', 'C523  VS4', 'C52', '3', 'VS4', 'KGC  SAFAR', 'I VEST', NULL),
('1', 'C524  PY1', 'C52', '4', 'PY1', 'KGC REGULA', 'R PANTY', NULL),
('1', 'C524  PY2', 'C52', '4', 'PY2', 'KGC BIKINI', ' PANTY', NULL),
('1', 'C524  PY9', 'C52', '4', 'PY9', 'KGC Uware', NULL, NULL),
('1', 'C524  TE1', 'C52', '4', 'TE1', 'KGC S/S T-', 'SHIRT', NULL),
('1', 'C524  TE2', 'C52', '4', 'TE2', 'KGC SS POL', 'O T-SHIRT', NULL),
('1', 'C524  TE4', 'C52', '4', 'TE4', 'KGC TANK T', 'OP T-SHIRT', NULL),
('1', 'C524  TE9', 'C52', '4', 'TE9', 'KGC SLEEVL', 'ESS T-SHIR', 'T'),
('1', 'C526  BD1', 'C52', '6', 'BD1', 'SQUARED BA', 'NDANA', NULL),
('1', 'C526  BD2', 'C52', '6', 'BD2', 'SQUARED BA', 'NDANA', NULL),
('1', 'C526  BG1', 'C52', '6', 'BG1', 'KGC BAG', NULL, NULL),
('1', 'C526  BG2', 'C52', '6', 'BG2', 'JB BAG', NULL, NULL),
('1', 'C526  BT1', 'C52', '6', 'BT1', 'KGC BELT', NULL, NULL),
('1', 'C526  BT2', 'C52', '6', 'BT2', 'KGC NO BUC', 'KLE BELT', NULL),
('1', 'C526  BT4', 'C52', '6', 'BT4', 'KG Casual', 'BELT', NULL),
('1', 'C526  BT5', 'C52', '6', 'BT5', 'KG Jeans B', 'ELT', NULL),
('1', 'C526  GV1', 'C52', '6', 'GV1', 'KIDS TRICO', 'T GLOVE', NULL),
('1', 'C526  HA1', 'C52', '6', 'HA1', 'HAIR HOOP', NULL, NULL),
('1', 'C526  HA2', 'C52', '6', 'HA2', 'HAIR CHOUC', 'HOU', NULL),
('1', 'C526  HN1', 'C52', '6', 'HN1', 'Chandler', NULL, NULL),
('1', 'C526  HT1', 'C52', '6', 'HT1', 'KGC HAT', NULL, NULL),
('1', 'C526  HT3', 'C52', '6', 'HT3', 'KGC HAT', NULL, NULL),
('1', 'C526  HT5', 'C52', '6', 'HT5', 'KGC Sun HA', 'T', NULL),
('1', 'C526  IC1', 'C52', '6', 'IC1', 'KGC ICE CA', 'P', NULL),
('1', 'C526  MNQ', 'C52', '6', 'MNQ', 'GIRLS MANN', 'EQUIN', NULL),
('1', 'C526  NL1', 'C52', '6', 'NL1', 'NL1', NULL, NULL),
('1', 'C526  OTH', 'C52', '6', 'OTH', 'KGC Others', NULL, NULL),
('1', 'C526  PJ5', 'C52', '6', 'PJ5', 'PAJAMA TOP', NULL, NULL),
('1', 'C526  PJ6', 'C52', '6', 'PJ6', 'PAJAMA BOT', 'TOM PANNT', NULL),
('1', 'C526  PJ7', 'C52', '6', 'PJ7', 'PAJAMA BOT', 'TOM SHORT', NULL),
('1', 'C526  PN1', 'C52', '6', 'PN1', 'KGC PONCHE', 'S', NULL),
('1', 'C526  SC1', 'C52', '6', 'SC1', 'REGULAR LE', 'NGTH', NULL),
('1', 'C526  SC2', 'C52', '6', 'SC2', 'MEDIUIM LE', 'NGTH', NULL),
('1', 'C526  SC5', 'C52', '6', 'SC5', 'KGC HOME S', 'OCKS', NULL),
('1', 'C526  SC6', 'C52', '6', 'SC6', 'WGC SOCKS', NULL, NULL),
('1', 'C526  SF1', 'C52', '6', 'SF1', 'KGC SCARF', NULL, NULL),
('1', 'C526  SO1', 'C52', '6', 'SO1', 'SHOSES', NULL, NULL),
('1', 'C526  WT1', 'C52', '6', 'WT1', 'WT1', NULL, NULL),
('1', 'C527  SO1', 'C52', '7', 'SO1', 'KGC SHOES', NULL, NULL),
('1', 'C626  SC6', 'C62', '6', 'SC6', 'WGC SOCKS', NULL, NULL),
('1', 'C626  SC7', 'C62', '6', 'SC7', 'SOCKS', NULL, NULL),
('1', 'C711  BL0', 'C71', '1', 'BL0', 'BLOUSE', NULL, NULL),
('1', 'C711  PT0', 'C71', '1', 'PT0', 'C711  PT0', NULL, NULL),
('1', 'C711  SF0', 'C71', '1', 'SF0', 'SCARF', NULL, NULL),
('1', 'C711  SH0', 'C71', '1', 'SH0', 'SHIRT', NULL, NULL),
('1', 'C711  SK0', 'C71', '1', 'SK0', 'SKIRT', NULL, NULL),
('1', 'C821  JK2', 'C82', '1', 'JK2', 'JACKET', NULL, NULL),
('1', 'C821  PL5', 'C82', '1', 'PL5', 'PULLOVER', NULL, NULL),
('1', 'C821  PL6', 'C82', '1', 'PL6', 'BBC ZIP FR', 'NT PULLOVE', 'R'),
('1', 'C821  SH1', 'C82', '1', 'SH1', 'SHIRT', NULL, NULL),
('1', 'C821  SH2', 'C82', '1', 'SH2', 'BBC L/S SH', 'IRT', NULL),
('1', 'C821  SH3', 'C82', '1', 'SH3', 'BBC S/S SL', 'D SAFARI S', 'HIRT'),
('1', 'C821  SH4', 'C82', '1', 'SH4', 'BBC S/S SH', 'IRT', NULL),
('1', 'C821  SW3', 'C82', '1', 'SW3', 'BBC FSH SW', 'EATSHIRT', NULL),
('1', 'C821  TE1', 'C82', '1', 'TE1', 'T-SHIRT', NULL, NULL),
('1', 'C822  PT3', 'C82', '2', 'PT3', 'BBC (FASHI', 'ON PANT)', NULL),
('1', 'C822  SR3', 'C82', '2', 'SR3', 'BBC (FASHI', 'ON SHORT)', NULL),
('1', 'C822  ST1', 'C82', '2', 'ST1', 'BBC (SALLO', 'PPETTE SHO', 'RT)'),
('1', 'C822  ST2', 'C82', '2', 'ST2', 'SALLOPPETT', 'E', NULL),
('1', 'C823  JK2', 'C82', '3', 'JK2', 'BBC FSH JA', 'CKET', NULL),
('1', 'C826  BK1', 'C82', '6', 'BK1', 'BLANKET', NULL, NULL),
('1', 'C921  BL1', 'C92', '1', 'BL1', 'BLOUSE', NULL, NULL),
('1', 'C921  BL3', 'C92', '1', 'BL3', 'BGC (N/S B', 'TN FRNT BL', 'OUSE)'),
('1', 'C921  BL5', 'C92', '1', 'BL5', 'BGC (S/S B', 'LOUSE)', NULL),
('1', 'C921  BL6', 'C92', '1', 'BL6', 'BGC ( SLEE', 'VELESS BLO', 'USE )'),
('1', 'C921  PL5', 'C92', '1', 'PL5', 'PULLOVER', NULL, NULL),
('1', 'C921  PL6', 'C92', '1', 'PL6', 'BBC ZIP FR', 'NT PULLOVE', 'R'),
('1', 'C921  SW3', 'C92', '1', 'SW3', 'BGC FSH SW', 'EATSHIRT', NULL),
('1', 'C921  TE1', 'C92', '1', 'TE1', 'T-SHIRT', NULL, NULL),
('1', 'C922  PT3', 'C92', '2', 'PT3', 'BGC (FASHI', 'ON PANT)', NULL),
('1', 'C922  SR3', 'C92', '2', 'SR3', 'BGC (FASHI', 'ON SHORT)', NULL),
('1', 'C922  ST1', 'C92', '2', 'ST1', 'BGC (SALOP', 'ETTE SHORT', ')'),
('1', 'C922  ST3', 'C92', '2', 'ST3', 'SALOPETTE', NULL, NULL),
('1', 'C923  DR1', 'C92', '3', 'DR1', 'DRESS', NULL, NULL),
('1', 'C923  DR6', 'C92', '3', 'DR6', 'BGC S/S SH', 'ORT DRESS', NULL),
('1', 'C923  DR7', 'C92', '3', 'DR7', 'BGC (N/S R', 'EG DRESS)', NULL),
('1', 'C923  JK2', 'C92', '3', 'JK2', 'BGC FSH JA', 'CKET', NULL),
('1', 'C926  BK1', 'C92', '6', 'BK1', 'BLANKET', NULL, NULL),
('1', 'CDSP  TLS', 'CDS', 'P', 'TLS', 'STORES DIS', 'PLAY TOOLS', NULL),
('1', 'CDWN  CDW', 'CDW', 'N', 'CDW', 'DOWN PAYME', 'NT', NULL),
('1', 'CFAB  MTM', 'CFA', 'B', 'MTM', 'FABRIC MAD', 'E TO MEASU', 'RE'),
('1', 'CGFT  BOX', 'CGF', 'T', 'BOX', 'CGFT BOX =', ' Gift Box', NULL),
('1', 'CGFT  CRD', 'CGF', 'T', 'CRD', 'GIFT CARD', NULL, NULL),
('1', 'CMIX  BZ3', 'CMI', 'X', 'BZ3', 'MIX', NULL, NULL),
('1', 'CMIX  SU3', 'CMI', 'X', 'SU3', 'MIX', NULL, NULL),
('1', 'CMIX  SU4', 'CMI', 'X', 'SU4', 'MIX', NULL, NULL),
('1', 'CMIX  TR2', 'CMI', 'X', 'TR2', 'MIX', NULL, NULL),
('1', 'CMIX  TR3', 'CMI', 'X', 'TR3', 'MIX', NULL, NULL),
('1', 'CMTM  CT1', 'CMT', 'M', 'CT1', 'COAT', NULL, NULL),
('1', 'CMTM  SU3', 'CMT', 'M', 'SU3', 'MADE TO ME', 'ASURE', NULL),
('1', 'CMTM  SU4', 'CMT', 'M', 'SU4', 'MADE TO ME', 'ASURE', NULL),
('1', 'CMTM  SU8', 'CMT', 'M', 'SU8', 'MTM ceremo', 'nial suit', NULL),
('1', 'CMTM  TR3', 'CMT', 'M', 'TR3', 'MADE TO ME', 'ASURE', NULL),
('1', 'CMTM  VS1', 'CMT', 'M', 'VS1', 'MF D.BREAS', 'T VEST', NULL),
('1', 'MTMM  BZ3', 'MTM', 'M', 'BZ3', 'M TO MSURE', ' SNGL BRST', ' BLZ'),
('1', 'MTMM  JK2', 'MTM', 'M', 'JK2', 'MADE TO ME', 'ASURE JACK', 'ET'),
('1', 'MTMM  TR2', 'MTM', 'M', 'TR2', 'M TO MSURE', ' 1PLT TROU', 'SER'),
('1', 'PROMOTI', 'PRO', 'MOT', 'I', 'PROMOTION', NULL, NULL),
('1', 'Q111  BZ1', 'Q11', '1', 'BZ1', 'MF 2 BTN D', 'OUBLE BREA', 'ST'),
('1', 'Q111  BZ2', 'Q11', '1', 'BZ2', 'MF 3 B S.R', 'EAST BLAZE', 'R'),
('1', 'Q111  BZ3', 'Q11', '1', 'BZ3', 'MF 2 B S.R', 'EAST BLAZE', 'R'),
('1', 'Q111  BZ4', 'Q11', '1', 'BZ4', 'MF 4 B S.R', 'EAST BLAZE', 'R'),
('1', 'Q111  SH1', 'Q11', '1', 'SH1', 'L/S SOLID', 'SHIRT', NULL),
('1', 'Q111  SH2', 'Q11', '1', 'SH2', 'L/S  PRINT', ' SHIRT', NULL),
('1', 'Q111  SH3', 'Q11', '1', 'SH3', 'S/S SOLID', 'SHIRT', NULL),
('1', 'Q111  SH4', 'Q11', '1', 'SH4', 'S/S  PRINT', ' SHIRT', NULL),
('1', 'Q111  SH5', 'Q11', '1', 'SH5', 'L/S SOLID', 'SHIRT CUFF', 'LINKS'),
('1', 'Q111  SH6', 'Q11', '1', 'SH6', 'L/S PRINT', 'SHIRT CUFF', 'LINKS'),
('1', 'Q111  SH8', 'Q11', '1', 'SH8', 'L/S CEREMO', 'NIAL SHIRT', ' CUFFLINKS'),
('1', 'Q111  SH9', 'Q11', '1', 'SH9', 'HIGH QUALI', 'TY SHIRT', NULL),
('1', 'Q111  SU1', 'Q11', '1', 'SU1', 'MF 2 BTN D', 'OUBLE BREA', 'ST F.FRONT'),
('1', 'Q111  SU2', 'Q11', '1', 'SU2', 'MF 3 B S .', 'BREAST -1P', 'LEAT'),
('1', 'Q111  SU3', 'Q11', '1', 'SU3', 'MF 2 B S .', 'BREAST -1P', 'LEAT'),
('1', 'Q111  SU4', 'Q11', '1', 'SU4', 'MF 2 B S .', 'BREAST -F.', 'FRONT'),
('1', 'Q111  SU8', 'Q11', '1', 'SU8', 'SUIT', NULL, NULL),
('1', 'Q112  TR2', 'Q11', '2', 'TR2', 'MF 1PLEAT', 'TROUSER', NULL),
('1', 'Q112  TR3', 'Q11', '2', 'TR3', 'TROUSER FL', 'AT FRONT', NULL),
('1', 'Q113  CT2', 'Q11', '3', 'CT2', 'MF S.BREAS', 'T LNG COAT', NULL),
('1', 'Q116  BW1', 'Q11', '6', 'BW1', 'MC BOW TIE', NULL, NULL),
('1', 'Q116  CB1', 'Q11', '6', 'CB1', 'MC CUMMER', 'BAND', NULL),
('1', 'Q116  CL1', 'Q11', '6', 'CL1', 'METAL CUFF', 'LINK', NULL),
('1', 'Q116  SO2', 'Q11', '6', 'SO2', 'MC CLASSIC', ' LEATHER S', 'HOES'),
('1', 'Q116  SO8', 'Q11', '6', 'SO8', 'MC CEREMON', 'IAL LEATHE', 'R SHOES'),
('1', 'Q116  TY1', 'Q11', '6', 'TY1', 'MC TIE', NULL, NULL),
('1', 'Q121  PL1', 'Q12', '1', 'PL1', 'MC BASIC L', 'T.PULLOVER', NULL),
('1', 'Q121  VS3', 'Q12', '1', 'VS3', 'MC BASIC V', 'EST', NULL),
('1', 'Q123  JK1', 'Q12', '3', 'JK1', 'MC BASIC J', 'ACKET', NULL),
('1', 'Q123  JK9', 'Q12', '3', 'JK9', 'MC LEATHER', ' JACKET', NULL),
('1', 'Q126  GV1', 'Q12', '6', 'GV1', 'MC LEATHER', ' GLOVE', NULL),
('1', 'Q126  SF1', 'Q12', '6', 'SF1', 'MC SCARF', NULL, NULL),
('1', 'QMIX  SU3', 'QMI', 'X', 'SU3', 'QMIXSU3', NULL, NULL),
('1', 'QMIX  SU4', 'QMI', 'X', 'SU4', 'QMIXSU4', NULL, NULL),
('1', 'T111  BZ5', 'T11', '1', 'BZ5', 'MIX & MATC', 'H CLASSIC', 'BLAZER'),
('1', 'T111  BZ8', 'T11', '1', 'BZ8', 'FASHION BL', 'AZER M F', NULL),
('1', 'T111  SH0', 'T11', '1', 'SH0', 'SHIRT', NULL, NULL),
('1', 'T111  SH1', 'T11', '1', 'SH1', 'L/S SOLID', 'SHIRT', NULL),
('1', 'T111  SH2', 'T11', '1', 'SH2', 'L/S PRINT', 'SHIRT', NULL),
('1', 'T111  SH3', 'T11', '1', 'SH3', 'S/S SOLID', 'SHIRT', NULL),
('1', 'T111  SH4', 'T11', '1', 'SH4', 'S/S PRINT', 'SHIRT', NULL),
('1', 'T111  SH5', 'T11', '1', 'SH5', 'L/S SOLID', 'SHIRT CUFF', NULL),
('1', 'T111  SH6', 'T11', '1', 'SH6', 'L/S PRINT', 'SHIRT CUFF', NULL),
('1', 'T111  SH8', 'T11', '1', 'SH8', 'L/S CEREMO', 'NIAL SHIRT', ' CUFFLINKS'),
('1', 'T111  SU4', 'T11', '1', 'SU4', '2BTN S.BRE', 'AST FLAT F', 'RONT'),
('1', 'T111  SU8', 'T11', '1', 'SU8', 'SUIT', NULL, NULL),
('1', 'T111  VS0', 'T11', '1', 'VS0', 'VEST', NULL, NULL),
('1', 'T112  TR3', 'T11', '2', 'TR3', 'FLAT FRONT', ' TROUSER', NULL),
('1', 'T112  TR5', 'T11', '2', 'TR5', 'MIX & MATC', 'H CLASSIC', 'TROUSER'),
('1', 'T113  CT1', 'T11', '3', 'CT1', 'M/F S.BREA', 'ST REG COA', 'T'),
('1', 'T116  BT1', 'T11', '6', 'BT1', 'MC CLASSIC', ' BELT', NULL),
('1', 'T116  TY1', 'T11', '6', 'TY1', 'MC TIE', NULL, NULL),
('1', 'T121  PL4', 'T12', '1', 'PL4', 'MC FSH. HV', 'Y. PULLOVE', 'R'),
('1', 'T121  TE1', 'T12', '1', 'TE1', 'MC S/S  T.', 'SHIRT', NULL),
('1', 'T121  TE5', 'T12', '1', 'TE5', 'MC L/S T.S', 'HIRT', NULL),
('1', 'T121  TE7', 'T12', '1', 'TE7', 'MC L/S FIT', 'TED T.SHIR', 'T'),
('1', 'T122  PT4', 'T12', '2', 'PT4', 'MC 5 PANT', 'POCKET', NULL),
('1', 'T122  PT5', 'T12', '2', 'PT5', 'MC REGULAR', ' SEMI CLAS', 'SIC'),
('1', 'T122  PT6', 'T12', '2', 'PT6', 'MC FASHION', ' SEMI CLAS', 'SIC'),
('1', 'T123  JK5', 'T12', '3', 'JK5', 'MC PARKA J', 'ACKET', NULL),
('1', 'T123  JK9', 'T12', '3', 'JK9', 'MC LEATHER', ' JACKET', NULL),
('1', 'T126  BT1', 'T12', '6', 'BT1', 'MC BELT', NULL, NULL),
('1', 'T126  SF1', 'T12', '6', 'SF1', 'MC SCARF', NULL, NULL);

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
  PRIMARY KEY (`desc1`),
  UNIQUE KEY `items_i2` (`countryid`,`itemdept`,`itemclass`,`itemsubclass`,`itemsid`),
  KEY `index3` (`itemno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`countryid`, `itemsid`, `desc1`, `desc2`, `desc3`, `desc4`, `itemclass`, `itemsubclass`, `itemsize`, `itemattr`, `itemupc`, `itemalu`, `itemdept`, `fulldept`, `aux1`, `aux2`, `aux3`, `aux4`, `aux5`, `aux6`, `aux7`, `aux8`, `minqty`, `maxqty`, `onhand`, `onorder`, `unitcost`, `unitprice`, `unitmgnval`, `unitmgnprc`, `extcost`, `extprice`, `extmgnval`, `extcost_curr`, `extprice_curr`, `extmgnval_curr`, `vendor`, `itemno`, `stylesid`, `last_sale`, `first_rcvd`, `udf1`, `udf2`, `udf3`, `udf4`, `last_rcvd`, `last_markdown`, `disconn_date`, `tax_perc`, `tax_value`, `unitpricetax`, `udfdate`, `firstprice`, `firstpricetax`) VALUES
('1', 9207792775204962544, 'C121PL3-W09-85N-2135', 'CREW NECK / FULLY FASHION', '135', '0', '1', 'PL3', 'L', 'RNGH', NULL, 'MNPL - 701', 'C12', 'C121  PL3', '85N HY.TRCT WL/ACR', '2-Second', 'Concrete', '', '', '', '', '', 0.000, 0.000, 0.000, 0.000, 0.0000, 75.0000, 75.0000, 0.00, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'TRISTA', 241002, 9207792714983145712, '2011-03-12 00:00:00', NULL, 'Winter', '2009', '-No Entry-', '-No Entry-', NULL, '2014-04-08 00:00:00', NULL, 0.00, 0.0000, 75.0000, NULL, 0.0000, 0.0000),
('1', 9186704661212561648, 'C421SW2-W10-000-S001', 'ÚíäÇÊ ÇäÊÇÌ ãæÓã ÔÊæì 2010', '001', NULL, '1', 'SW2', '0', 'MIX', NULL, 'ÚíäÇÊ ÇäÊÇÌ', 'C42', 'C421  SW2', '000 Others', '5-Stock', 'Concrete', '', '', '', 'MIX', '', 1.000, 0.000, 1.000, 0.000, 19.6400, 25.0000, 5.3600, 27.29, 19.6400, 25.0000, 5.3600, 19.6400, 25.0000, 5.3600, 'CONCRT', 240908, 9186704661690712304, '2014-06-28 00:00:00', '2009-12-15 00:00:00', 'Winter', '2010', '-No Entry-', '-No Entry-', '2009-12-15 00:00:00', '2014-09-10 00:00:00', NULL, 0.00, 0.0000, 25.0000, NULL, 0.0000, 0.0000),
('1', 9185548084896071920, 'C112TR3-G00-71N-S107', 'TROUSER FLAT FRONT SLANT PCKT', '107', NULL, '2', 'TR3', '54', 'LBEG', NULL, NULL, 'C11', 'C112  TR3', '71N RG.100% WOOL', '5-Stock', 'Concrete', '', '', '', 'LIGHT BEIGE', '', 0.000, 0.000, 0.000, 0.000, 106.7000, 100.0000, -6.7000, -6.28, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 'ETC', 240886, 8221416704522060016, '2013-02-15 00:00:00', NULL, 'General', '0000', '-No Entry-', '-No Entry-', NULL, '2014-08-07 00:00:00', NULL, 0.00, 0.0000, 100.0000, '2009-12-07 00:00:00', 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `marker`
--

CREATE TABLE IF NOT EXISTS `marker` (
  `marker_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `width` char(10) NOT NULL,
  `length` char(10) NOT NULL,
  `utilization` char(10) NOT NULL,
  `t_size` char(10) NOT NULL,
  `ratio` char(10) NOT NULL,
  `marker_name` char(10) NOT NULL,
  PRIMARY KEY (`marker_id`,`ss_id`),
  KEY `fk_marker_ss_idx` (`ss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `marker_log`
--

CREATE TABLE IF NOT EXISTS `marker_log` (
  `marker_id` int(11) NOT NULL,
  `action_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(10) DEFAULT NULL,
  `action_comment` text,
  PRIMARY KEY (`marker_id`,`action_time_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE IF NOT EXISTS `privileges` (
  `priv_id` int(11) NOT NULL AUTO_INCREMENT,
  `priv_name` char(40) DEFAULT NULL,
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE IF NOT EXISTS `size` (
  `scale_number` char(5) NOT NULL,
  `scale_size` char(5) NOT NULL,
  `scale_name` char(10) NOT NULL,
  PRIMARY KEY (`scale_number`,`scale_size`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `brand_dept_name` char(40) NOT NULL,
  `category_subc_name` char(40) NOT NULL,
  `dcs_notes` char(40) DEFAULT NULL,
  `style_code` char(40) NOT NULL,
  `stylesheet_note` text,
  `fabric` char(40) NOT NULL,
  PRIMARY KEY (`ss_id`,`style_code`,`country_id`,`season`,`year`),
  KEY `fk_stylesheet_country_index` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_bom`
--

CREATE TABLE IF NOT EXISTS `stylesheet_bom` (
  `ss_id` int(11) NOT NULL,
  `dcs_name` char(40) NOT NULL,
  `dept_id` char(3) DEFAULT NULL,
  `class_id` char(3) DEFAULT NULL,
  `subclass_id` char(3) DEFAULT NULL,
  `item_color_id` char(40) DEFAULT NULL,
  `item_desc` char(40) DEFAULT NULL,
  `item_cons` char(20) DEFAULT NULL,
  `item_placement` char(40) DEFAULT NULL,
  `countryid` char(5) DEFAULT NULL,
  PRIMARY KEY (`ss_id`),
  KEY `fk_stylesheet_bom_dept_idx` (`dept_id`,`class_id`,`subclass_id`),
  KEY `fk_stylesheet_bom_country_idx` (`countryid`),
  KEY `fk_stylesheet_bom_color_idx` (`item_color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_color`
--

CREATE TABLE IF NOT EXISTS `stylesheet_color` (
  `ss_id` int(11) NOT NULL,
  `color_code` char(2) NOT NULL,
  `print_emb` char(40) DEFAULT NULL,
  `place` char(40) DEFAULT NULL,
  `code` char(10) DEFAULT NULL,
  `desc` char(40) DEFAULT NULL,
  PRIMARY KEY (`ss_id`,`color_code`),
  KEY `fk_stylesheet_color_color_idx` (`color_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_images`
--

CREATE TABLE IF NOT EXISTS `stylesheet_images` (
  `ss_id` int(11) NOT NULL,
  `img_path` char(50) NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_log`
--

CREATE TABLE IF NOT EXISTS `stylesheet_log` (
  `stylesheet_id` int(11) NOT NULL,
  `action_time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_type` char(10) NOT NULL,
  `action_comment` text NOT NULL,
  PRIMARY KEY (`stylesheet_id`,`action_time_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stylesheet_size`
--

CREATE TABLE IF NOT EXISTS `stylesheet_size` (
  `ss_id` int(11) NOT NULL,
  `scale` char(10) NOT NULL,
  PRIMARY KEY (`ss_id`,`scale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('PJ', 'PAJAMA'),
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
  `password` char(20) NOT NULL,
  `user_group` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_users_1_idx` (`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` char(20) NOT NULL,
  `group_privilege` int(11) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `fk_user_group_1_idx` (`group_privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `fk_bom_country` FOREIGN KEY (`countryid`) REFERENCES `countries` (`countryid`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bom_item` FOREIGN KEY (`itemno`) REFERENCES `items` (`itemno`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bom_pono` FOREIGN KEY (`pono`) REFERENCES `customers` (`custid`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bom_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `bom_log`
--
ALTER TABLE `bom_log`
  ADD CONSTRAINT `fk_bom_log_bom` FOREIGN KEY (`bom_id`) REFERENCES `bom` (`bom_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `bom_size_qty`
--
ALTER TABLE `bom_size_qty`
  ADD CONSTRAINT `fk_bom_size_qty_bom` FOREIGN KEY (`bom_id`) REFERENCES `bom` (`bom_id`) ON UPDATE NO ACTION;

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
-- Constraints for table `DCS_name`
--
ALTER TABLE `DCS_name`
  ADD CONSTRAINT `fk_DCS_name_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`countryid`) ON UPDATE NO ACTION;

--
-- Constraints for table `DCS_size_scale`
--
ALTER TABLE `DCS_size_scale`
  ADD CONSTRAINT `fk_DCS_size_scale_dcs` FOREIGN KEY (`dept_id`, `class_id`, `subclass_id`) REFERENCES `departments` (`deptid`, `classid`, `classid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DCS_size_scale_scale` FOREIGN KEY (`size_scale`) REFERENCES `size` (`scale_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `marker`
--
ALTER TABLE `marker`
  ADD CONSTRAINT `fk_marker_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `marker_log`
--
ALTER TABLE `marker_log`
  ADD CONSTRAINT `fk_marker_log_marker` FOREIGN KEY (`marker_id`) REFERENCES `marker` (`marker_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet`
--
ALTER TABLE `stylesheet`
  ADD CONSTRAINT `fk_stylesheet_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`countryid`) ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet_bom`
--
ALTER TABLE `stylesheet_bom`
  ADD CONSTRAINT `fk_ss_bom_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stylesheet_bom_color` FOREIGN KEY (`item_color_id`) REFERENCES `color_code` (`color_code`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stylesheet_bom_country` FOREIGN KEY (`countryid`) REFERENCES `countries` (`countryid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stylesheet_bom_dept` FOREIGN KEY (`dept_id`, `class_id`, `subclass_id`) REFERENCES `departments` (`deptid`, `classid`, `subclassid`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_stylesheet_log_ss` FOREIGN KEY (`stylesheet_id`) REFERENCES `stylesheet` (`ss_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stylesheet_size`
--
ALTER TABLE `stylesheet_size`
  ADD CONSTRAINT `fk_stylesheet_size_ss` FOREIGN KEY (`ss_id`) REFERENCES `stylesheet` (`ss_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_users_group` FOREIGN KEY (`user_group`) REFERENCES `user_group` (`group_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `fk_group_priv` FOREIGN KEY (`group_privilege`) REFERENCES `privileges` (`priv_id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;