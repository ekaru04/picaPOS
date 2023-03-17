-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2023 at 04:54 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `picapos`
--

-- --------------------------------------------------------

--
-- Table structure for table `mcategory`
--

CREATE TABLE IF NOT EXISTS `mcategory` (
  `categoryID` varchar(30) NOT NULL,
  `categoryName` varchar(100) DEFAULT NULL,
  `categoryCode` varchar(10) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mcategory`
--

INSERT INTO `mcategory` (`categoryID`, `categoryName`, `categoryCode`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'CAT', 'CAT', 'Category A', 0, '2022-10-12', '2022-10-24 13:39:06'),
('4', 'KUKUS', 'ks', 'kukus', 1, '2022-10-24', '2022-10-24 13:38:52'),
('2', 'CATB', 'CB', 'Category B', 0, '2022-10-12', '2022-10-12 09:05:52'),
('3', 'PANGGANG', 'pg', 'Panggang', 1, '2022-10-21', '2022-10-21 09:55:04'),
('5', 'BAKAR', 'bkr', 'Bakar', 1, '2022-11-21', '2022-11-21 09:27:00'),
('6', 'PAKET A', 'PA', '', 0, '2022-12-14', '2023-02-28 08:57:09'),
('7', 'DRINK', 'DRK', 'Drink', 1, '2022-12-27', '2022-12-27 13:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `mcustomer`
--

CREATE TABLE IF NOT EXISTS `mcustomer` (
  `customerID` varchar(30) NOT NULL,
  `customerName` varchar(100) DEFAULT NULL,
  `customerPhone` varchar(20) DEFAULT NULL,
  `customerEmail` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mcustomer`
--

INSERT INTO `mcustomer` (`customerID`, `customerName`, `customerPhone`, `customerEmail`, `status`, `dateCreated`, `lastChanged`) VALUES
('4', 'Reza', '081249862', '', 1, '2022-12-22', '2022-12-22 15:25:54'),
('3', 'Dandi', '0998096797', '', 1, '2022-12-21', '2022-12-21 10:41:53'),
('2', 'Eka', '321', '', 1, '2022-12-21', '2022-12-21 09:05:32'),
('1', 'Wildhan', '123', '', 1, '2022-12-21', '2022-12-21 09:05:13'),
('5', 'Ari', '34683216', '', 1, '2022-12-28', '2022-12-28 13:59:44'),
('6', 'FERDI', '02315723785', '', 1, '2023-02-14', '2023-02-14 14:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `mdepartment`
--

CREATE TABLE IF NOT EXISTS `mdepartment` (
  `departmentCode` varchar(3) NOT NULL DEFAULT '',
  `departmentName` varchar(30) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`departmentCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mdepartment`
--

INSERT INTO `mdepartment` (`departmentCode`, `departmentName`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'CASHIER', 1, '2022-10-12', '2022-12-07 11:04:46'),
('2', 'KITCHEN', 1, '2022-10-12', '2022-12-07 11:04:54'),
('3', 'WAREHOUSE', 1, '2022-10-21', '2022-12-07 11:05:02'),
('4', 'TESTERS', 1, '2023-01-25', '2023-01-25 11:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `mingredient`
--

CREATE TABLE IF NOT EXISTS `mingredient` (
  `ingredientID` varchar(30) NOT NULL,
  `ingredient` varchar(100) DEFAULT NULL,
  `curStock` float DEFAULT NULL,
  `minStock` float DEFAULT NULL,
  `outletID` varchar(3) NOT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`ingredientID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mingredient`
--

INSERT INTO `mingredient` (`ingredientID`, `ingredient`, `curStock`, `minStock`, `outletID`, `measurementID`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'COKLAT BATANG', 550, 0, '1', '1', 'Tambah baru', 1, '2022-10-24', '2023-03-17 14:23:56'),
('5', 'PISANG', 36, 0, '1', '2', '', 1, '2022-10-24', '2022-10-24 16:31:15'),
('4', 'TELUR', 439, 0, '1', '2', 'TELURR', 1, '2022-10-24', '2023-03-17 14:46:00'),
('2', 'TEPUNG TERIGU', 439, 0, '1', '2', 'tepung', 1, '2022-10-24', '2023-03-17 14:46:00'),
('3', 'GULA PASIR', 500, 0, '1', '2', 'Gula Pasir', 1, '2022-10-24', '2023-03-17 14:24:07'),
('6', 'ABON SAPI', 485, 10, '1', '2', 'Tambah Ingredient Abon', 1, '2022-11-21', '2023-03-17 14:46:00'),
('7', 'COKLAT BUBUK', 500, 10, '1', '2', 'KBR', 1, '2022-11-24', '2023-03-17 14:24:26'),
('8', 'KEJU', 460, 5, '1', '2', '', 1, '2022-12-02', '2023-03-17 14:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `mloyalty`
--

CREATE TABLE IF NOT EXISTS `mloyalty` (
  `loyalID` varchar(30) NOT NULL DEFAULT '',
  `requirement` float NOT NULL,
  `point` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`loyalID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mloyalty`
--

INSERT INTO `mloyalty` (`loyalID`, `requirement`, `point`, `status`, `dateCreated`, `lastChanged`) VALUES
('LYL-221221-1', 100000, 10, 1, '2022-12-21', '2023-01-25 11:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `mmeasurement`
--

CREATE TABLE IF NOT EXISTS `mmeasurement` (
  `measurementID` varchar(30) NOT NULL,
  `measurementName` varchar(100) DEFAULT NULL,
  `measurementCode` varchar(10) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`measurementID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mmeasurement`
--

INSERT INTO `mmeasurement` (`measurementID`, `measurementName`, `measurementCode`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'GRAM', 'GR', 'gram', 1, '2022-10-11', '2022-10-12 08:32:50'),
('2', 'KILOGRAMS', 'KG', 'Kilogram', 1, '2022-10-12', '2022-10-12 08:32:57'),
('3', 'BOX', 'BX', 'BOX', 1, '2022-10-24', '2022-10-24 12:27:20'),
('4', 'LUSIN', 'LSS', 'LUSIN', 1, '2022-10-21', '2022-10-24 12:28:38'),
('5', 'PIECES', 'PCS', '--', 1, '2022-11-21', '2022-11-21 11:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `mmenu`
--

CREATE TABLE IF NOT EXISTS `mmenu` (
  `menuID` varchar(10) NOT NULL DEFAULT '',
  `menuGroup` varchar(30) DEFAULT NULL,
  `menuName` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`menuID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mmenu`
--

INSERT INTO `mmenu` (`menuID`, `menuGroup`, `menuName`, `status`, `dateCreated`, `lastChanged`) VALUES
('A001', 'OPS', 'POS', 1, '2022-11-10', '2022-11-10 08:45:05'),
('A002', 'OPS', 'Order List', 1, '2022-11-10', '2022-11-10 08:45:32'),
('A003', 'OPS', 'Close Cashier', 1, '2022-11-10', '2022-11-10 08:45:47'),
('B001', 'TRX', 'Restock Ingredients', 1, '2022-11-10', '2022-11-10 08:46:11'),
('B002', 'TRX', 'Production Input', 1, '2022-11-10', '2022-11-08 08:46:26'),
('B003', 'TRX', 'In/Out Products', 1, '2022-11-10', '2022-11-10 08:46:46'),
('C001', 'MAS', 'Master Data Categories', 1, '2022-11-10', '2022-11-10 08:47:07'),
('C002', 'MAS', 'Master Data Measurement', 1, '2022-11-10', '2022-11-10 08:47:23'),
('C003', 'MAS', 'Master Data Payment Method', 1, '2022-11-10', '2022-11-10 08:53:20'),
('C004', 'MAS', 'Master Data Supplier', 1, '2022-11-10', '2022-11-10 08:53:51'),
('C005', 'MAS', 'Master Data Promo', 1, '2022-11-10', '2022-11-10 08:54:06'),
('C006', 'MAS', 'Master Data Voucher', 1, '2022-11-10', '2022-11-10 08:54:27'),
('D001', 'STK', 'Ingredients', 1, '2022-11-10', '2022-11-10 08:54:52'),
('D002', 'STK', 'Recipes', 1, '2022-11-10', '2022-11-10 08:55:05'),
('D003', 'STK', 'Products', 1, '2022-11-10', '2022-11-10 08:55:15'),
('E001', 'RPT', 'Stock Reports', 1, '2022-11-10', '2022-11-10 08:55:30'),
('E002', 'RPT', 'Production  Reports', 1, '2022-11-10', '2022-11-10 08:55:43'),
('F001', 'MGT', 'Outlet Management', 1, '2022-11-10', '2022-11-10 08:55:57'),
('F002', 'MGT', 'User Management', 1, '2022-11-10', '2022-11-10 08:56:12'),
('F003', 'MGT', 'Departements', 1, '2022-11-10', '2022-11-10 08:56:24'),
('F004', 'MGT', 'Position', 1, '2022-11-10', '2022-11-10 08:56:38'),
('E003', 'RPT', 'Transaction POS', 1, '2022-12-02', '2022-12-02 08:27:01'),
('B004', 'TRX', 'Pengeluaran', 1, '2022-12-02', '2022-12-02 15:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `moutlet`
--

CREATE TABLE IF NOT EXISTS `moutlet` (
  `outletID` varchar(3) NOT NULL DEFAULT '',
  `outletName` varchar(30) DEFAULT NULL,
  `outletArea` varchar(30) DEFAULT NULL,
  `address` text NOT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`outletID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moutlet`
--

INSERT INTO `moutlet` (`outletID`, `outletName`, `outletArea`, `address`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'PICA BAKERY HR', 'HR MUHAMMAD', 'JL MAYJEN HR MUHAMMAD', 'NEW', 1, '2022-10-13', '2022-10-21 10:06:12'),
('2', 'PICAROLL KEBRAON', 'SURABAYA', '---', '---', 1, '2022-11-21', '2022-11-21 09:25:25'),
('3', 'OUTLET BB', 'SURABAYA', '', '', 0, '2023-01-30', '2023-01-30 08:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `mpaymentmethod`
--

CREATE TABLE IF NOT EXISTS `mpaymentmethod` (
  `methodID` varchar(30) NOT NULL,
  `methodName` varchar(100) DEFAULT NULL,
  `methodType` varchar(25) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`methodID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mpaymentmethod`
--

INSERT INTO `mpaymentmethod` (`methodID`, `methodName`, `methodType`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'TRANSFER BCA', 'TRF', 'TRANFBCA', 1, '2022-10-12', '2022-10-12 14:39:21'),
('2', 'TRANSFER MANDIRI', 'MANDIRI', 'MANDIRI\r\n', 1, '2022-10-21', '2022-10-24 15:56:40'),
('3', 'CASH', 'CASH', '', 1, '2023-01-31', '2023-01-31 09:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `mposition`
--

CREATE TABLE IF NOT EXISTS `mposition` (
  `positionID` varchar(3) NOT NULL DEFAULT '',
  `positionName` varchar(30) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`positionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mposition`
--

INSERT INTO `mposition` (`positionID`, `positionName`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'GARDA DEPAN', 1, '2022-10-12', '2022-10-12 11:57:01'),
('2', 'STRIKER', 1, '2022-10-12', '2022-10-12 11:58:01'),
('3', 'MANAGER', 0, '2022-10-21', '2022-10-24 15:24:19'),
('4', 'TESTINGS', 1, '2023-01-25', '2023-01-25 11:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `mproduct`
--

CREATE TABLE IF NOT EXISTS `mproduct` (
  `productID` varchar(30) NOT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `categoryID` varchar(30) DEFAULT NULL,
  `recipeID` varchar(30) NOT NULL,
  `curStock` float DEFAULT NULL,
  `minStock` float DEFAULT NULL,
  `outletID` varchar(3) NOT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productImage` text NOT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mproduct`
--

INSERT INTO `mproduct` (`productID`, `productName`, `categoryID`, `recipeID`, `curStock`, `minStock`, `outletID`, `measurementID`, `productPrice`, `productImage`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('2', 'ROTI KEJU', '3', '2', 0, 5, '1', '5', 15000, 'roti-keju1.jpg', '', 1, '2022-12-02', '2022-12-21 09:04:57'),
('1', 'ROTI ABON SAPI', '3', '1', 18, 10, '1', '5', 5000, 'roti-abon-selembut-breadtalk.jpg', '', 1, '2022-11-21', '2023-03-17 14:46:11'),
('3', 'CHOCO MELTING', '4', '3', 7, 5, '1', '5', 8500, 'chocolatebread36a.jpg', '', 1, '2022-12-13', '2023-03-17 13:34:28'),
('4', 'TEH BOTOL', '7', '4', 0, 5, '1', '5', 5000, 'Teh_Botol_Sosro.jpg', 'Teh', 1, '2022-12-27', '2022-12-27 13:50:06'),
('5', 'KOPI', '7', '5', 6, 5, '1', '5', 5000, 'A_small_cup_of_coffee.jpg', '', 1, '2023-01-21', '2023-01-21 07:55:32');

-- --------------------------------------------------------

--
-- Table structure for table `mpromo`
--

CREATE TABLE IF NOT EXISTS `mpromo` (
  `promoID` varchar(30) NOT NULL,
  `promoName` varchar(100) DEFAULT NULL,
  `promoType` varchar(30) DEFAULT NULL,
  `promoRequirement` float DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `isDiscount` smallint(6) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `isMonday` smallint(6) DEFAULT NULL,
  `isTuesday` smallint(6) DEFAULT NULL,
  `isWednesday` smallint(6) DEFAULT NULL,
  `isThursday` smallint(6) DEFAULT NULL,
  `isFriday` smallint(6) DEFAULT NULL,
  `isSaturday` smallint(6) DEFAULT NULL,
  `isSunday` smallint(6) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mpromo`
--

INSERT INTO `mpromo` (`promoID`, `promoName`, `promoType`, `promoRequirement`, `outletID`, `isDiscount`, `discount`, `isMonday`, `isTuesday`, `isWednesday`, `isThursday`, `isFriday`, `isSaturday`, `isSunday`, `startDate`, `endDate`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'a', 'a', 0, '1', 1, 20000, 1, 1, 0, 0, 0, 0, 0, '2022-10-29', '2022-10-31', NULL, 1, '2022-10-28', '2022-10-28 14:03:23'),
('PRM--3', 'BE', 'BE', 0, '1', 1, 10000, 1, 1, 1, 1, 1, 1, 1, '2022-10-28', '2022-10-29', 'oke', 1, '2022-10-28', '2022-10-28 15:13:51'),
('2', 'TES', 'TES', 0, '1', 1, 10000, 1, 1, 1, 1, 0, 0, 0, '2022-10-28', '2022-10-31', 'tes', 1, '2022-10-28', '2022-10-28 15:14:32'),
('PRM-20221121-4', 'HRPROMO', 'DISCOUNT', 1000, '1', 1, 5, 0, 1, 1, 1, 1, 1, 0, '2022-11-21', '2022-11-30', 'Tes Diskon', 1, '2022-11-21', '2022-11-22 09:34:30'),
('PRM-20230209-5', 'ENDORSEMENT', 'ENDORSE', 0, '1', 1, 100, 1, 1, 1, 1, 1, 1, 1, '2023-02-09', '2023-02-11', '', 1, '2023-02-09', '2023-02-09 17:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `mrecipe`
--

CREATE TABLE IF NOT EXISTS `mrecipe` (
  `recipeID` varchar(30) NOT NULL,
  `recipeName` varchar(100) DEFAULT NULL,
  `categoryID` varchar(30) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`recipeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mrecipe`
--

INSERT INTO `mrecipe` (`recipeID`, `recipeName`, `categoryID`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('2', 'ROTI KEJU', '3', '', 1, '2022-12-02', '2022-12-02 08:00:37'),
('1', 'ROTI ABON', '3', 'Baru', 1, '2022-11-21', '2022-11-21 10:56:15'),
('3', 'ROTI COKLAT', '4', '', 1, '2022-12-13', '2022-12-13 08:23:26'),
('4', 'DRINK', '7', '', 1, '2022-12-27', '2022-12-27 13:48:52'),
('5', 'KOPI', '7', '', 1, '2023-01-21', '2023-01-21 07:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `mrecipedetails`
--

CREATE TABLE IF NOT EXISTS `mrecipedetails` (
  `id` varchar(30) NOT NULL,
  `recipeID` varchar(30) NOT NULL,
  `ingredientID` varchar(30) NOT NULL,
  `amount` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mrecipedetails`
--

INSERT INTO `mrecipedetails` (`id`, `recipeID`, `ingredientID`, `amount`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', '1', '100,3,4', 1, 1, '2022-10-12', '2022-10-12 21:50:51'),
('20221202080043', '2', '8', 2, 1, '2022-12-02', '2022-12-02 08:00:43'),
('20221121111532', '1', '6', 1, 1, '2022-11-21', '2022-11-21 11:15:32'),
('20221121111527', '1', '4', 1, 1, '2022-11-21', '2022-11-21 11:15:27'),
('20221121105634', '1', '2', 1, 1, '2022-11-21', '2022-11-21 10:56:34'),
('20221202080057', '2', '2', 2, 1, '2022-12-02', '2022-12-02 08:00:57'),
('20221202080102', '2', '4', 2, 1, '2022-12-02', '2022-12-02 08:01:02'),
('20221213082525', '3', '1', 1, 1, '2022-12-13', '2022-12-13 08:25:25'),
('20221213082532', '3', '7', 1, 1, '2022-12-13', '2022-12-13 08:25:32'),
('20221213082538', '3', '3', 1, 1, '2022-12-13', '2022-12-13 08:25:38'),
('20221213082600', '3', '2', 1, 1, '2022-12-13', '2022-12-13 08:26:00'),
('20221213082607', '3', '4', 1, 1, '2022-12-13', '2022-12-13 08:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `mstock`
--

CREATE TABLE IF NOT EXISTS `mstock` (
  `stockID` varchar(30) NOT NULL DEFAULT '',
  `stockName` varchar(100) DEFAULT NULL,
  `categoryStockID` varchar(30) DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `curStock` float DEFAULT NULL,
  `minStock` float DEFAULT NULL,
  `outletID` varchar(3) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`stockID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mstock`
--

INSERT INTO `mstock` (`stockID`, `stockName`, `categoryStockID`, `measurementID`, `curStock`, `minStock`, `outletID`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'SABUN', '1', '5', 9, 1, '1', '', 1, '2022-12-07', '2023-01-17 08:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `mstockcategory`
--

CREATE TABLE IF NOT EXISTS `mstockcategory` (
  `categoryStockID` varchar(30) NOT NULL DEFAULT '',
  `categoryStockName` varchar(100) DEFAULT NULL,
  `categoryStockCode` varchar(10) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryStockID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mstockcategory`
--

INSERT INTO `mstockcategory` (`categoryStockID`, `categoryStockName`, `categoryStockCode`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'A', 'A', 'A', 1, '2022-12-06', '2022-12-06 10:41:39'),
('2', 'B', 'B', 'B', 1, '2022-12-08', '2022-12-08 09:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `msupplier`
--

CREATE TABLE IF NOT EXISTS `msupplier` (
  `supplierID` varchar(30) NOT NULL,
  `supplierName` varchar(100) DEFAULT NULL,
  `address` text,
  `phoneNum` varchar(30) DEFAULT NULL,
  `pic` varchar(30) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msupplier`
--

INSERT INTO `msupplier` (`supplierID`, `supplierName`, `address`, `phoneNum`, `pic`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('SPL-221024-2', 'PT INDOMARCO', 'II', '089898989898', 'fahmi ', 'Test', 1, '2022-10-24', '2022-10-24 14:55:49'),
('SPL-221022-1', 'PT INDOFOOD1', 'B', '3256262', 'ekaru', 'B', 1, '2022-10-22', '2022-10-22 11:12:54'),
('SPL-221121-3', 'PT TESTER', '---', '-', 'fahmi ', '--', 1, '2022-11-21', '2022-11-21 09:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `muser`
--

CREATE TABLE IF NOT EXISTS `muser` (
  `userID` varchar(10) NOT NULL DEFAULT '',
  `employeeNo` varchar(30) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `outletID` varchar(3) NOT NULL,
  `departmentCode` varchar(3) DEFAULT NULL,
  `positionID` varchar(3) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `muser`
--

INSERT INTO `muser` (`userID`, `employeeNo`, `username`, `password`, `fullname`, `outletID`, `departmentCode`, `positionID`, `status`, `dateCreated`, `lastChanged`) VALUES
('3', '6', 'adit00', 'fa05ee3f6686762ec67313de7a562cad520a747a0b687b501daa1ed4fb277210', 'Adit', '1', '3', '2', 0, '2022-10-24', '2022-10-24 15:32:05'),
('2', '5', 'tes04', 'daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5', 'fahmi ', '1', '2', '2', 1, '2022-10-23', '2022-12-02 15:37:08'),
('13', '4', 'test123', 'daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5', 'ekaru', '1', '1', '1', 1, '2022-10-21', '2023-01-30 08:44:26'),
('4', '7', 'wee', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'weeeee', '2', '1', '1', 1, '2022-11-21', '2022-11-24 09:18:42'),
('5', '10', 'otheracc', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'acc', '1', '4', '4', 1, '2023-01-30', '2023-01-30 08:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `mvoucher`
--

CREATE TABLE IF NOT EXISTS `mvoucher` (
  `voucherCode` varchar(50) NOT NULL,
  `voucherName` varchar(100) DEFAULT NULL,
  `voucherType` varchar(25) DEFAULT NULL,
  `voucherRequirement` float DEFAULT NULL,
  `voucherSaldo` float DEFAULT NULL,
  `expDate` date DEFAULT NULL,
  `description` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`voucherCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mvoucher`
--

INSERT INTO `mvoucher` (`voucherCode`, `voucherName`, `voucherType`, `voucherRequirement`, `voucherSaldo`, `expDate`, `description`, `status`, `dateCreated`, `lastChanged`) VALUES
('46356-4F041-A113', 'NEWOP', 'OPENING', 10000, 50000, '2022-10-31', 'VOUCHER BARU', 0, '2022-10-24', '2022-10-24 15:38:51'),
('26356-4F3A4-BF8E', 'HOLIDAY', 'HOLIDAY', NULL, 30000, '2022-10-31', 'Libur', 0, '2022-10-24', '2022-10-24 15:40:24'),
('36361-F60F5-D251', 'NEW GRANDOP', 'OPENING', 10000, 20000, '2022-11-05', '', 0, '2022-11-02', '2022-11-02 11:46:07'),
('4637B-18D30-5E63', 'HRVOU', 'YA VOUCHER', 2000, 6000, '2022-11-24', 'Tes Voucher', 0, '2022-11-21', '2022-11-21 13:22:21'),
('563C7-9ABFD-1E5C', 'IMLEK23', 'DISKON', 10000, 7000, '2023-01-31', 'Voucher Imlek 2023', 0, '2023-01-18', '2023-01-18 14:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `systemjournal`
--

CREATE TABLE IF NOT EXISTS `systemjournal` (
  `journalID` varchar(30) NOT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `menu` varchar(30) DEFAULT NULL,
  `userID` varchar(10) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `logCreated` datetime DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `systemjournal`
--

INSERT INTO `systemjournal` (`journalID`, `activity`, `menu`, `userID`, `dateCreated`, `logCreated`, `status`) VALUES
('20230130083605', 'INSERT_OUTLET_OUTLET B', 'MASTER_OUTLET', '2', '2023-01-30', '2023-01-30 08:36:05', 'SUCCESS'),
('20230130083628', 'UPDATE_OUTLET_OUTLET BB', 'MASTER_OUTLET', '2', '2023-01-30', '2023-01-30 08:36:28', 'SUCCESS'),
('20230130083640', 'DELETE_OUTLET', 'MASTER_OUTLET', '2', '2023-01-30', '2023-01-30 08:36:40', 'SUCCESS'),
('20230130084351', 'DELETE_USER_13', 'MASTER_user', '2', '2023-01-30', '2023-01-30 08:43:51', 'SUCCESS'),
('20230130084426', 'UPDATE_USER_test123', 'MASTER_USER', '2', '2023-01-30', '2023-01-30 08:44:26', 'SUCCESS'),
('20230130085630', 'INSERT_USER_otheracc', 'MASTER_USER', '2', '2023-01-30', '2023-01-30 08:56:30', 'SUCCESS'),
('20230130152549', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:25:49', 'SUCCESS'),
('20230130152538', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:25:38', 'SUCCESS'),
('20230130152527', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:25:27', 'SUCCESS'),
('20230130151509', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:15:09', 'SUCCESS'),
('20230130151349', 'UPDATE_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:13:49', 'SUCCESS'),
('20230130151326', 'UPDATE_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:13:26', 'SUCCESS'),
('20230130151316', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:13:16', 'SUCCESS'),
('20230130151235', 'INSERT_MASTER_PRICE_ONTHESHOP', 'MASTER_PRICE', '2', '2023-01-30', '2023-01-30 15:12:35', 'SUCCESS'),
('20230130151215', 'INSERT_MASTER_PRICE_GOFOOD', 'MASTER_PRICE', '2', '2023-01-30', '2023-01-30 15:12:15', 'SUCCESS'),
('20230130151203', 'INSERT_MASTER_PRICE_SHOPEEFOOD', 'MASTER_PRICE', '2', '2023-01-30', '2023-01-30 15:12:03', 'SUCCESS'),
('20230130152608', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:26:08', 'SUCCESS'),
('20230130152618', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:26:18', 'SUCCESS'),
('20230130152628', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:26:28', 'SUCCESS'),
('20230130152640', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:26:40', 'SUCCESS'),
('20230130152653', 'INSERT_PRICE_LIST_', 'PRICE_LIST', '2', '2023-01-30', '2023-01-30 15:26:53', 'SUCCESS'),
('20230131091041', 'INSERT_PAYMENT_CASH', 'MASTER_PAYMENT', '2', '2023-01-31', '2023-01-31 09:10:41', 'SUCCESS'),
('20230131091957', 'ORDER_1_PCA/RCP/202301/0008_COMPLETE', 'ORDER_COMPLETE', '2', '2023-01-31', '2023-01-31 09:19:57', 'SUCCESS'),
('20230131094521', 'ORDER_2_PCA/RCP/202301/0009_COMPLETE', 'ORDER_COMPLETE', '2', '2023-01-31', '2023-01-31 09:45:21', 'SUCCESS'),
('20230131100328', 'ORDER_3_PCA/RCP/202301/0010_COMPLETE', 'ORDER_COMPLETE', '2', '2023-01-31', '2023-01-31 10:03:28', 'SUCCESS'),
('20230201154738', 'ORDER_1_PCA/RCP/202302/0001_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-01', '2023-02-01 15:47:38', 'SUCCESS'),
('20230202091456', 'ORDER_1_PCA/RCP/202302/0002_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-02', '2023-02-02 09:14:56', 'SUCCESS'),
('20230202091512', 'ORDER_2_PCA/RCP/202302/0003_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-02', '2023-02-02 09:15:12', 'SUCCESS'),
('20230202091538', 'ORDER_3_PCA/RCP/202302/0004_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-02', '2023-02-02 09:15:38', 'SUCCESS'),
('20230202092604', 'INSERT_CLOSE_CASHIER_PCA/CLOSE/202302/0004', 'CLOSE_CASHIER', '2', '2023-02-02', '2023-02-02 09:26:04', 'SUCCESS'),
('20230209171052', 'INSERT_PROMO_ENDORSEMENT', 'MASTER_PROMO', '2', '2023-02-09', '2023-02-09 17:10:52', 'SUCCESS'),
('20230209171124', 'ORDER_1_PCA/RCP/202302/0005_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-09', '2023-02-09 17:11:24', 'SUCCESS'),
('20230210103952', 'INSERT_CLOSE_CASHIER_PCA/CLOSE/202302/0004', 'CLOSE_CASHIER', '2', '2023-02-10', '2023-02-10 10:39:52', 'SUCCESS'),
('20230211090919', 'ORDER_1_PCA/END/202302/0006_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-11', '2023-02-11 09:09:19', 'SUCCESS'),
('20230211095826', 'ORDER_2_PCA/END/202302/0007_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-11', '2023-02-11 09:58:26', 'SUCCESS'),
('20230213090708', 'ORDER_1_PCA/END/202302/0008_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-13', '2023-02-13 09:07:08', 'SUCCESS'),
('20230213091037', 'ORDER_2_PCA/END/202302/0009_DRAFT', 'ORDER_DRAFT', '2', '2023-02-13', '2023-02-13 09:10:37', 'SUCCESS'),
('20230213092732', 'ORDER_2_PCA/END/202302/0009_DRAFT', 'ORDER_DRAFT', '2', '2023-02-13', '2023-02-13 09:27:32', 'SUCCESS'),
('20230213092959', 'ORDER_2_PCA/END/202302/0009_DRAFT', 'ORDER_DRAFT', '2', '2023-02-13', '2023-02-13 09:29:59', 'SUCCESS'),
('20230213094152', 'ORDER_3_PCA/END/202302/0010_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-13', '2023-02-13 09:41:52', 'SUCCESS'),
('20230214115805', 'ORDER_1_PCA/RCP/202302/0011_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-14', '2023-02-14 11:58:05', 'SUCCESS'),
('20230214140348', 'ORDER_2_PCA/RCP/202302/0012_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-14', '2023-02-14 14:03:48', 'SUCCESS'),
('20230214140753', 'NEW_CUSTOMER_FERDI', 'ADD_CUST_FROM_POS', '2', '2023-02-14', '2023-02-14 14:07:53', 'SUCCESS'),
('20230214140753', 'ORDER_3_PCA/RCP/202302/0013_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-14', '2023-02-14 14:07:53', 'SUCCESS'),
('20230215153406', 'ORDER_1_PCA/RCP/202302/0014_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-15', '2023-02-15 15:34:06', 'SUCCESS'),
('20230215153427', 'ORDER_1_PCA/END/202302/0015_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-15', '2023-02-15 15:34:27', 'SUCCESS'),
('20230223084129', 'ORDER___DRAFT', 'ORDER_DRAFT', '2', '2023-02-23', '2023-02-23 08:41:29', 'SUCCESS'),
('20230223100301', 'ORDER_1_PCA/RCP/202302/0016_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-23', '2023-02-23 10:03:01', 'SUCCESS'),
('20230223102032', 'ORDER___COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-23', '2023-02-23 10:20:32', 'SUCCESS'),
('20230224093516', 'PREORDER_1_PCA/RPO/202302/0003_DRAFT', 'PREORDER_DRAFT', '2', '2023-02-24', '2023-02-24 09:35:16', 'SUCCESS'),
('20230224094533', 'PREORDER_2_PCA/RPO/202302/0003_DRAFT', 'PREORDER_DRAFT', '2', '2023-02-24', '2023-02-24 09:45:33', 'SUCCESS'),
('20230224095113', 'PREORDER_2_PCA/RPO/202302/0018_DRAFT', 'PREORDER_DRAFT', '2', '2023-02-24', '2023-02-24 09:51:13', 'SUCCESS'),
('20230227100110', 'INSERT_RESTOCK_3', 'TRANSACTION_RESTOCK', '2', '2023-02-27', '2023-02-27 10:01:10', 'SUCCESS'),
('20230227150434', 'INSERT_REQUESTING_3', 'REQUEST_INGREDIENT', '2', '2023-02-27', '2023-02-27 15:04:34', 'SUCCESS'),
('20230227150454', 'INSERT_REQUESTING_3INGREDIENT(8)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-02-27', '2023-02-27 15:04:54', 'SUCCESS'),
('20230227150454', 'INSERT_REQUESTING_3INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-02-27', '2023-02-27 15:04:54', 'SUCCESS'),
('20230227150454', 'INSERT_REQUESTING_3INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-02-27', '2023-02-27 15:04:54', 'SUCCESS'),
('20230228085709', 'DELETE_CATEGORY', 'MASTER_CATEGORY', '2', '2023-02-28', '2023-02-28 08:57:09', 'SUCCESS'),
('20230228094721', 'ORDER_1_PCA/RCP/202302/0019_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-28', '2023-02-28 09:47:21', 'SUCCESS'),
('20230228094741', 'ORDER_2_PCA/RCP/202302/0020_COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-28', '2023-02-28 09:47:41', 'SUCCESS'),
('20230228094810', 'PREORDER_1_PCA/RPO/202302/0021_DRAFT', 'PREORDER_DRAFT', '2', '2023-02-28', '2023-02-28 09:48:10', 'SUCCESS'),
('20230228120307', 'ORDER___COMPLETE', 'ORDER_COMPLETE', '2', '2023-02-28', '2023-02-28 12:03:07', 'SUCCESS'),
('20230301084951', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 08:49:51', 'SUCCESS'),
('20230301085110', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 08:51:10', 'SUCCESS'),
('20230301085630', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 08:56:30', 'SUCCESS'),
('20230301090217', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:02:17', 'SUCCESS'),
('20230301090315', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:03:15', 'SUCCESS'),
('20230301090352', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:03:52', 'SUCCESS'),
('20230301090408', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:04:08', 'SUCCESS'),
('20230301090422', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:04:22', 'SUCCESS'),
('20230301090447', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:04:47', 'SUCCESS'),
('20230301090645', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:06:45', 'SUCCESS'),
('20230301090938', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:09:38', 'SUCCESS'),
('20230301090958', 'ORDER_1_PCA/RCP/202303/0002_DRAFT', 'ORDER_DRAFT', '2', '2023-03-01', '2023-03-01 09:09:58', 'SUCCESS'),
('20230303090252', 'PREORDER_1_PCA/RPO/202303/0003_DRAFT', 'PREORDER_DRAFT', '2', '2023-03-03', '2023-03-03 09:02:52', 'SUCCESS'),
('20230303090756', 'ORDER___COMPLETE', 'PRE_ORDER_COMPLETE', '2', '2023-03-03', '2023-03-03 09:07:56', 'SUCCESS'),
('20230303091104', 'PREORDER_1_PCA/RPO/202303/0003_DRAFT', 'PREORDER_DRAFT', '2', '2023-03-03', '2023-03-03 09:11:04', 'SUCCESS'),
('20230304102150', '', 'PELUNASAN_PO_COMPLETE', '2', '2023-03-04', '2023-03-04 10:21:50', 'SUCCESS'),
('20230309144630', 'INSERT_REQUESTING_PCA/REQ/202303/0004', 'REQUEST_INGREDIENT', '2', '2023-03-09', '2023-03-09 14:46:30', 'SUCCESS'),
('20230309144635', 'INSERT_REQUESTING_PCA/REQ/202303/0004INGREDIENT(6)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-09', '2023-03-09 14:46:35', 'SUCCESS'),
('20230309144635', 'INSERT_REQUESTING_PCA/REQ/202303/0004INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-09', '2023-03-09 14:46:35', 'SUCCESS'),
('20230309144635', 'INSERT_REQUESTING_PCA/REQ/202303/0004INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-09', '2023-03-09 14:46:35', 'SUCCESS'),
('20230309145503', 'UPDATE_STOCK_PRODUCT__FROM_REQUEST', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-09', '2023-03-09 14:55:03', 'SUCCESS'),
('20230309145503', 'UPDATE_REQ_HEADER_', 'APPROVAL_REQUEST', '2', '2023-03-09', '2023-03-09 14:55:03', 'SUCCESS'),
('20230309145503', 'UPDATE_REQ_DETAIL_', 'STATUS_REQUEST', '2', '2023-03-09', '2023-03-09 14:55:03', 'SUCCESS'),
('20230309145653', 'UPDATE_STOCK_PRODUCT__FROM_REQUEST', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-09', '2023-03-09 14:56:53', 'SUCCESS'),
('20230309145653', 'UPDATE_REQ_HEADER_', 'APPROVAL_REQUEST', '2', '2023-03-09', '2023-03-09 14:56:53', 'SUCCESS'),
('20230309145653', 'UPDATE_REQ_DETAIL_', 'STATUS_REQUEST', '2', '2023-03-09', '2023-03-09 14:56:53', 'SUCCESS'),
('20230310090032', 'UPDATE_STOCK_PRODUCT__FROM_REQUEST', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-10', '2023-03-10 09:00:32', 'SUCCESS'),
('20230310090032', 'UPDATE_REQ_HEADER_', 'APPROVAL_REQUEST', '2', '2023-03-10', '2023-03-10 09:00:32', 'SUCCESS'),
('20230310090032', 'UPDATE_REQ_DETAIL_', 'STATUS_REQUEST', '2', '2023-03-10', '2023-03-10 09:00:32', 'SUCCESS'),
('20230310090133', 'UPDATE_STOCK_PRODUCT_1_FROM_REQUESTPCA/REQ/202303/0004', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_STOCK_INGREDIENT_6_FROM_REQUESTPCA/REQ/202303/0004', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0004', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0004', 'HISTORY', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0004', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0004', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0004', 'HISTORY', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0004', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0004', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0004', 'HISTORY', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0004', 'APPROVAL_REQUEST', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310090133', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0004', 'STATUS_REQUEST', '2', '2023-03-10', '2023-03-10 09:01:33', 'SUCCESS'),
('20230310111850', 'INSERT_REQUESTING_PCA/REQ/202303/0005', 'REQUEST_INGREDIENT', '2', '2023-03-10', '2023-03-10 11:18:50', 'SUCCESS'),
('20230310111855', 'INSERT_REQUESTING_PCA/REQ/202303/0005INGREDIENT(1)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 11:18:55', 'SUCCESS'),
('20230310111855', 'INSERT_REQUESTING_PCA/REQ/202303/0005INGREDIENT(7)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 11:18:55', 'SUCCESS'),
('20230310111855', 'INSERT_REQUESTING_PCA/REQ/202303/0005INGREDIENT(3)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 11:18:55', 'SUCCESS'),
('20230310111855', 'INSERT_REQUESTING_PCA/REQ/202303/0005INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 11:18:55', 'SUCCESS'),
('20230310111855', 'INSERT_REQUESTING_PCA/REQ/202303/0005INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 11:18:55', 'SUCCESS'),
('20230310134506', 'INSERT_RESTOCK_4', 'TRANSACTION_RESTOCK', '2', '2023-03-10', '2023-03-10 13:45:06', 'SUCCESS'),
('20230310134549', 'INSERT_RESTOCK_5', 'TRANSACTION_RESTOCK', '2', '2023-03-10', '2023-03-10 13:45:49', 'SUCCESS'),
('20230310134639', 'UPDATE_STOCK_PRODUCT_3_FROM_REQUESTPCA/REQ/202303/0005', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_STOCK_INGREDIENT_1_FROM_REQUESTPCA/REQ/202303/0005', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0005', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_STOCK_INGREDIENT_7_FROM_REQUESTPCA/REQ/202303/0005', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0005', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_STOCK_INGREDIENT_3_FROM_REQUESTPCA/REQ/202303/0005', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0005', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0005', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0005', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0005', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0005', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0005', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0005', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0005', 'APPROVAL_REQUEST', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310134639', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0005', 'STATUS_REQUEST', '2', '2023-03-10', '2023-03-10 13:46:39', 'SUCCESS'),
('20230310135053', 'INSERT_REQUESTING_PCA/REQ/202303/0006', 'REQUEST_INGREDIENT', '2', '2023-03-10', '2023-03-10 13:50:53', 'SUCCESS'),
('20230310135059', 'INSERT_REQUESTING_PCA/REQ/202303/0006INGREDIENT(1)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 13:50:59', 'SUCCESS'),
('20230310135059', 'INSERT_REQUESTING_PCA/REQ/202303/0006INGREDIENT(7)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 13:50:59', 'SUCCESS'),
('20230310135059', 'INSERT_REQUESTING_PCA/REQ/202303/0006INGREDIENT(3)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 13:50:59', 'SUCCESS'),
('20230310135059', 'INSERT_REQUESTING_PCA/REQ/202303/0006INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 13:50:59', 'SUCCESS'),
('20230310135059', 'INSERT_REQUESTING_PCA/REQ/202303/0006INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-10', '2023-03-10 13:50:59', 'SUCCESS'),
('20230310135105', 'UPDATE_STOCK_PRODUCT_3_FROM_REQUESTPCA/REQ/202303/0006', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_STOCK_INGREDIENT_1_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0006', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_STOCK_INGREDIENT_7_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0006', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_STOCK_INGREDIENT_3_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0006', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0006', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_STOCK', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0006', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0006', 'HISTORY', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0006', 'APPROVAL_REQUEST', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230310135105', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0006', 'STATUS_REQUEST', '2', '2023-03-10', '2023-03-10 13:51:05', 'SUCCESS'),
('20230317142305', 'INSERT_REQUESTING_PCA/REQ/202303/0007', 'REQUEST_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:23:05', 'SUCCESS'),
('20230317142307', 'INSERT_REQUESTING_PCA/REQ/202303/0007INGREDIENT(6)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:23:07', 'SUCCESS'),
('20230317142307', 'INSERT_REQUESTING_PCA/REQ/202303/0007INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:23:07', 'SUCCESS'),
('20230317142307', 'INSERT_REQUESTING_PCA/REQ/202303/0007INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:23:07', 'SUCCESS'),
('20230317142323', 'UPDATE_STOCK_PRODUCT_1_FROM_REQUESTPCA/REQ/202303/0007', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-17', '2023-03-17 14:23:23', 'SUCCESS'),
('20230317142323', 'LOW_STOCK_FAILED_TO_UPDATE', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:23:23', 'FAILED'),
('20230317142323', 'LOW_STOCK_FAILED_TO_UPDATE', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:23:23', 'FAILED'),
('20230317142323', 'LOW_STOCK_FAILED_TO_UPDATE', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:23:23', 'FAILED'),
('20230317142323', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0007', 'APPROVAL_REQUEST', '2', '2023-03-17', '2023-03-17 14:23:23', 'SUCCESS'),
('20230317142323', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0007', 'STATUS_REQUEST', '2', '2023-03-17', '2023-03-17 14:23:23', 'SUCCESS'),
('20230317142356', 'UPDATE_INGREDIENT_COKLAT BATANG', 'MASTER_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:23:56', 'SUCCESS'),
('20230317142402', 'UPDATE_INGREDIENT_TEPUNG TERIGU', 'MASTER_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:24:02', 'SUCCESS'),
('20230317142407', 'UPDATE_INGREDIENT_GULA PASIR', 'MASTER_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:24:07', 'SUCCESS'),
('20230317142413', 'UPDATE_INGREDIENT_TELUR', 'MASTER_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:24:13', 'SUCCESS'),
('20230317142419', 'UPDATE_INGREDIENT_ABON SAPI', 'MASTER_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:24:19', 'SUCCESS'),
('20230317142426', 'UPDATE_INGREDIENT_COKLAT BUBUK', 'MASTER_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:24:26', 'SUCCESS'),
('20230317142559', 'UPDATE_STOCK_PRODUCT_1_FROM_REQUESTPCA/REQ/202303/0007', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_STOCK_INGREDIENT_6_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0007', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0007', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0007', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0007', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0007', 'APPROVAL_REQUEST', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142559', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0007', 'STATUS_REQUEST', '2', '2023-03-17', '2023-03-17 14:25:59', 'SUCCESS'),
('20230317142804', 'INSERT_REQUESTING_PCA/REQ/202303/0008', 'REQUEST_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:28:04', 'SUCCESS'),
('20230317142806', 'INSERT_REQUESTING_PCA/REQ/202303/0008INGREDIENT(8)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:28:06', 'SUCCESS'),
('20230317142806', 'INSERT_REQUESTING_PCA/REQ/202303/0008INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:28:06', 'SUCCESS'),
('20230317142806', 'INSERT_REQUESTING_PCA/REQ/202303/0008INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:28:06', 'SUCCESS'),
('20230317142812', 'UPDATE_STOCK_PRODUCT_2_FROM_REQUESTPCA/REQ/202303/0008', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_STOCK_INGREDIENT_8_FROM_REQUESTPCA/REQ/202303/0008', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0008', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0008', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0008', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0008', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0008', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0008', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0008', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0008', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0008', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0008', 'APPROVAL_REQUEST', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142812', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0008', 'STATUS_REQUEST', '2', '2023-03-17', '2023-03-17 14:28:12', 'SUCCESS'),
('20230317142925', 'INSERT_REQUESTING_PCA/REQ/202303/0009', 'REQUEST_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:29:25', 'SUCCESS'),
('20230317142927', 'INSERT_REQUESTING_PCA/REQ/202303/0009INGREDIENT(8)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:29:27', 'SUCCESS'),
('20230317142927', 'INSERT_REQUESTING_PCA/REQ/202303/0009INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:29:27', 'SUCCESS'),
('20230317142927', 'INSERT_REQUESTING_PCA/REQ/202303/0009INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:29:27', 'SUCCESS'),
('20230317142932', 'UPDATE_STOCK_PRODUCT_2_FROM_REQUESTPCA/REQ/202303/0009', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'LOW_STOCK_FAILED_TO_UPDATE', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:29:32', 'FAILED'),
('20230317142932', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0009', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0009', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0009', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0009', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0009', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0009', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0009', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0009', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0009', 'APPROVAL_REQUEST', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317142932', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0009', 'STATUS_REQUEST', '2', '2023-03-17', '2023-03-17 14:29:32', 'SUCCESS'),
('20230317143043', 'INSERT_REQUESTING_PCA/REQ/202303/0010', 'REQUEST_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:30:43', 'SUCCESS'),
('20230317143045', 'INSERT_REQUESTING_PCA/REQ/202303/0010INGREDIENT(8)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:30:45', 'SUCCESS'),
('20230317143045', 'INSERT_REQUESTING_PCA/REQ/202303/0010INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:30:45', 'SUCCESS'),
('20230317143045', 'INSERT_REQUESTING_PCA/REQ/202303/0010INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:30:45', 'SUCCESS'),
('20230317143049', 'UPDATE_STOCK_PRODUCT_2_FROM_REQUESTPCA/REQ/202303/0010', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_STOCK_INGREDIENT_8_FROM_REQUESTPCA/REQ/202303/0010', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0010', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0010', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0010', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0010', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0010', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0010', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0010', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0010', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0010', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0010', 'APPROVAL_REQUEST', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143049', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0010', 'STATUS_REQUEST', '2', '2023-03-17', '2023-03-17 14:30:49', 'SUCCESS'),
('20230317143236', 'INSERT_REQUESTING_PCA/REQ/202303/0011', 'REQUEST_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:32:36', 'SUCCESS'),
('20230317143238', 'INSERT_REQUESTING_PCA/REQ/202303/0011INGREDIENT(8)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:32:38', 'SUCCESS'),
('20230317143238', 'INSERT_REQUESTING_PCA/REQ/202303/0011INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:32:38', 'SUCCESS'),
('20230317143238', 'INSERT_REQUESTING_PCA/REQ/202303/0011INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:32:38', 'SUCCESS'),
('20230317143244', 'UPDATE_STOCK_PRODUCT_2_FROM_REQUESTPCA/REQ/202303/0011', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_STOCK_INGREDIENT_8_FROM_REQUESTPCA/REQ/202303/0011', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0011', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0011', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0011', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0011', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0011', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0011', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0011', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0011', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0011', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0011', 'APPROVAL_REQUEST', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317143244', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0011', 'STATUS_REQUEST', '2', '2023-03-17', '2023-03-17 14:32:44', 'SUCCESS'),
('20230317144550', 'INSERT_REQUESTING_PCA/REQ/202303/0012', 'REQUEST_INGREDIENT', '2', '2023-03-17', '2023-03-17 14:45:50', 'SUCCESS'),
('20230317144554', 'INSERT_REQUESTING_PCA/REQ/202303/0012INGREDIENT(6)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:45:54', 'SUCCESS'),
('20230317144554', 'INSERT_REQUESTING_PCA/REQ/202303/0012INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:45:54', 'SUCCESS'),
('20230317144554', 'INSERT_REQUESTING_PCA/REQ/202303/0012INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2023-03-17', '2023-03-17 14:45:54', 'SUCCESS'),
('20230317144600', 'UPDATE_STOCK_PRODUCT_1_FROM_REQUESTPCA/REQ/202303/0012', 'RESTOCK_PRODUCT_STOCK', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_STOCK_INGREDIENT_6_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0012', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_STOCK_INGREDIENT_4_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0012', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_STOCK_INGREDIENT_2_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_STOCK', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_SALDO_FROM_REQUESTPCA/REQ/202303/0012', 'AMOUNT_USED_AND_SALDO', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'INSERT_HISTORY_FROM_REQUESTPCA/REQ/202303/0012', 'HISTORY', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_REQ_HEADER_PCA/REQ/202303/0012', 'APPROVAL_REQUEST', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317144600', 'UPDATE_REQ_DETAIL_PCA/REQ/202303/0012', 'STATUS_REQUEST', '2', '2023-03-17', '2023-03-17 14:46:00', 'SUCCESS'),
('20230317161241', 'INSERT_RESTOCK_6', 'TRANSACTION_RESTOCK', '2', '2023-03-17', '2023-03-17 16:12:41', 'SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `tabbundledetail`
--

CREATE TABLE IF NOT EXISTS `tabbundledetail` (
  `id` varchar(30) DEFAULT NULL,
  `bundleID` varchar(30) DEFAULT NULL,
  `productID` varchar(30) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabbundledetail`
--

INSERT INTO `tabbundledetail` (`id`, `bundleID`, `productID`, `amount`, `status`, `dateCreated`, `lastChanged`) VALUES
('20221214134656', '1', '3', 1, 1, '2022-12-14', '2022-12-14 13:46:56'),
('20221214135357', '1', '2', 2, 1, '2022-12-14', '2022-12-14 13:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `tabbundleheader`
--

CREATE TABLE IF NOT EXISTS `tabbundleheader` (
  `bundleID` varchar(30) NOT NULL DEFAULT '',
  `bundleName` varchar(100) DEFAULT NULL,
  `categoryID` varchar(30) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `bundlePeriode` date DEFAULT NULL,
  `bundlePrice` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`bundleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabbundleheader`
--

INSERT INTO `tabbundleheader` (`bundleID`, `bundleName`, `categoryID`, `outletID`, `bundlePeriode`, `bundlePrice`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'BUNDLE A', '6', '1', '0000-00-00', 50000, 1, '2022-12-14', '2022-12-14 13:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `tabclosecashierdetail`
--

CREATE TABLE IF NOT EXISTS `tabclosecashierdetail` (
  `id` varchar(30) NOT NULL,
  `orderID` varchar(30) NOT NULL,
  `closeID` varchar(30) NOT NULL,
  `dpp` float DEFAULT NULL,
  `VAT` float DEFAULT NULL,
  `discountPrice` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `promoID` varchar(30) DEFAULT NULL,
  `paymentAmount` float DEFAULT NULL,
  `paymentMethod` varchar(30) DEFAULT NULL,
  `payerName` varchar(50) DEFAULT NULL,
  `remarks` text,
  `userID` varchar(10) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabclosecashierdetail`
--

INSERT INTO `tabclosecashierdetail` (`id`, `orderID`, `closeID`, `dpp`, `VAT`, `discountPrice`, `total`, `promoID`, `paymentAmount`, `paymentMethod`, `payerName`, `remarks`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('20230210103952', 'PCA/RCP/202302/0004', 'PCA/CLOSE/202302/0004', 27500, 0, 0, 27500, '', 7500, '3', '', '', '2', 1, '2023-02-10', '2023-02-10 10:39:52'),
('20230210103952', 'PCA/RCP/202302/0002', 'PCA/CLOSE/202302/0004', 27500, 0, 0, 27500, '', 11000, '1', 'WILDHAN', '', '2', 1, '2023-02-10', '2023-02-10 10:39:52'),
('20230210103952', 'PCA/RCP/202302/0003', 'PCA/CLOSE/202302/0004', 27500, 0, 0, 27500, '', 9000, '2', 'REZA', '', '2', 1, '2023-02-10', '2023-02-10 10:39:52'),
('20221228140140', 'PCA/RCP/202212/0061', 'PCA/CLOSE/202212/0003', 20000, 0, 0, 20000, '', 20000, '2', 'Ari', '', '2', 1, '2022-12-28', '2022-12-28 14:01:40'),
('20221122132722', 'PCA/RCP/202211/0002', 'PCA/CLOSE/202211/0002', 15000, 0, 0, 35000, '', 15000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:27:22'),
('20221122132722', 'PCA/RCP/202211/0001', 'PCA/CLOSE/202211/0002', 15000, 0, 0, 35000, 'PRM-20221121-4', 20000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:27:22'),
('20221122132118', 'PCA/RCP/202211/0002', 'PCA/CLOSE/202211/0001', 15000, 0, 0, 35000, '', 15000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:18'),
('20221122132118', 'PCA/RCP/202211/0001', 'PCA/CLOSE/202211/0001', 15000, 0, 0, 35000, 'PRM-20221121-4', 20000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:18'),
('20221122132102', 'PCA/RCP/202211/0013', 'PCA/CLOSE/202211/0001', 53750, 0, 250, 75000, 'PRM-20221121-4', 5000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0012', 'PCA/CLOSE/202211/0001', 53750, 0, 250, 75000, '', 5000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0011', 'PCA/CLOSE/202211/0001', 53750, 0, 250, 75000, 'PRM-20221121-4', 5000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0010', 'PCA/CLOSE/202211/0001', 53750, 0, 250, 75000, 'PRM-20221121-4', 5000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0009', 'PCA/CLOSE/202211/0001', 53750, 0, 250, 75000, '', 5000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0008', 'PCA/CLOSE/202211/0001', 53750, 0, 250, 75000, '', 5000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0007', 'PCA/CLOSE/202211/0001', 53750, 0, 750, 75000, 'PRM-20221121-4', 15000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0006', 'PCA/CLOSE/202211/0001', 53750, 0, 0, 75000, 'PRM-20221121-4', 5000, '1', 'wes', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0005', 'PCA/CLOSE/202211/0001', 53750, 0, 0, 75000, 'PRM-20221121-4', 10000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0004', 'PCA/CLOSE/202211/0001', 53750, 0, 0, 75000, 'PRM-20221121-4', 10000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('20221122132102', 'PCA/RCP/202211/0003', 'PCA/CLOSE/202211/0001', 53750, 0, 0, 75000, '', 5000, '1', '', '', '2', 1, '2022-11-22', '2022-11-22 13:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `tabclosecashierheader`
--

CREATE TABLE IF NOT EXISTS `tabclosecashierheader` (
  `closeID` varchar(30) NOT NULL,
  `closeDate` date DEFAULT NULL,
  `closePeriode` varchar(10) DEFAULT NULL,
  `closeShift` smallint(6) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `dpp` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `grandTotal` float DEFAULT NULL,
  `totalReceived` float DEFAULT NULL,
  `remarks` text,
  `userID` varchar(10) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`closeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabclosecashierheader`
--

INSERT INTO `tabclosecashierheader` (`closeID`, `closeDate`, `closePeriode`, `closeShift`, `outletID`, `dpp`, `vat`, `grandTotal`, `totalReceived`, `remarks`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('PCA/CLOSE/202211/0001', '2022-11-22', '2022-11', 1, '1', 53750, 0, 53750, 75000, '', '2', 1, '2022-11-22', '2022-11-22 13:21:02'),
('PCA/CLOSE/202211/0002', '2022-11-21', '2022-11', 1, '1', 15000, 0, 15000, 35000, '', '2', 1, '2022-11-22', '2022-11-22 13:27:22'),
('PCA/CLOSE/202212/0003', '2022-12-28', '2022-12', 2, '1', 20000, 0, 20000, 20000, '', '2', 1, '2022-12-28', '2022-12-28 14:01:40'),
('PCA/CLOSE/202302/0004', '2023-02-02', '2023-02', 2, '1', 27500, 0, 27500, 27500, '', '2', 1, '2023-02-10', '2023-02-10 10:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `tabitemhistory`
--

CREATE TABLE IF NOT EXISTS `tabitemhistory` (
  `id` varchar(30) NOT NULL,
  `transType` varchar(5) DEFAULT NULL,
  `ingredientID` varchar(30) NOT NULL,
  `amount` float DEFAULT NULL,
  `itemAmount` float DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `userID` varchar(30) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemhistory`
--

INSERT INTO `tabitemhistory` (`id`, `transType`, `ingredientID`, `amount`, `itemAmount`, `measurementID`, `cost`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('20230310090133', 'OUT', '', 0, 0, '', 150000, '2', 1, '2023-03-10', '2023-03-10 09:01:33'),
('20230310090133', 'OUT', '', 0, 0, '', 1.9e+007, '2', 1, '2023-03-10', '2023-03-10 09:01:33'),
('20230310090133', 'OUT', '', 0, 0, '', 0, '2', 1, '2023-03-10', '2023-03-10 09:01:33'),
('20230227100110', 'IN', '2', 20, 26, '2', 300000, '2', 1, '2023-02-27', '2023-02-27 10:01:10'),
('20221122075422', 'IN', '4', 20, 20, '2', 3.8e+007, '2', 1, '2022-11-22', '2022-11-22 07:54:22'),
('20221121140637', 'OUT', '6', 10, 20, '2', 8e+006, '2', 1, '2022-11-21', '2022-11-21 14:06:37'),
('20221121133234', 'IN', '6', 10, 30, '2', 8e+006, '2', 1, '2022-11-21', '2022-11-21 13:32:34'),
('20230310134506', 'IN', '2', 50, 50, '2', 750000, '2', 1, '2023-03-10', '2023-03-10 13:45:06'),
('20230310134549', 'IN', '4', 15, 15, '2', 375000, '2', 1, '2023-03-10', '2023-03-10 13:45:49'),
('20230310134639', 'OUT', '', 0, 0, '', 0, '2', 1, '2023-03-10', '2023-03-10 13:46:39'),
('20230310134639', 'OUT', '', 0, 0, '', 0, '2', 1, '2023-03-10', '2023-03-10 13:46:39'),
('20230310134639', 'OUT', '', 0, 0, '', 0, '2', 1, '2023-03-10', '2023-03-10 13:46:39'),
('20230310134639', 'OUT', '', 0, 0, '', 150000, '2', 1, '2023-03-10', '2023-03-10 13:46:39'),
('20230310134639', 'OUT', '', 0, 0, '', 1.9e+007, '2', 1, '2023-03-10', '2023-03-10 13:46:39'),
('20230310135105', 'OUT', '', 0, 0, '', 0, '2', 1, '2023-03-10', '2023-03-10 13:51:05'),
('20230310135105', 'OUT', '', 0, 0, '', 0, '2', 1, '2023-03-10', '2023-03-10 13:51:05'),
('20230310135105', 'OUT', '', 0, 0, '', 0, '2', 1, '2023-03-10', '2023-03-10 13:51:05'),
('20230310135105', 'OUT', '', 0, 0, '', 75000, '2', 1, '2023-03-10', '2023-03-10 13:51:05'),
('20230310135105', 'OUT', '', 0, 0, '', 125000, '2', 1, '2023-03-10', '2023-03-10 13:51:05'),
('20230317142559', 'OUT', '6', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:25:59'),
('20230317142559', 'OUT', '4', 0, 0, '2', 125000, '2', 1, '2023-03-17', '2023-03-17 14:25:59'),
('20230317142559', 'OUT', '2', 0, 0, '2', 75000, '2', 1, '2023-03-17', '2023-03-17 14:25:59'),
('20230317142812', 'OUT', '8', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:28:12'),
('20230317142812', 'OUT', '2', 0, 0, '2', 60000, '2', 1, '2023-03-17', '2023-03-17 14:28:12'),
('20230317142812', 'OUT', '4', 0, 0, '2', 100000, '2', 1, '2023-03-17', '2023-03-17 14:28:12'),
('20230317142932', 'OUT', '2', 0, 0, '2', 30000, '2', 1, '2023-03-17', '2023-03-17 14:29:32'),
('20230317142932', 'OUT', '4', 0, 0, '2', 25000, '2', 1, '2023-03-17', '2023-03-17 14:29:32'),
('20230317143049', 'OUT', '8', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:30:49'),
('20230317143049', 'OUT', '2', 0, 0, '2', 300000, '2', 1, '2023-03-17', '2023-03-17 14:30:49'),
('20230317143049', 'OUT', '4', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:30:49'),
('20230317143244', 'OUT', '8', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:32:44'),
('20230317143244', 'OUT', '2', 0, 0, '2', 210000, '2', 1, '2023-03-17', '2023-03-17 14:32:44'),
('20230317143244', 'OUT', '4', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:32:44'),
('20230317144600', 'OUT', '6', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:46:00'),
('20230317144600', 'OUT', '4', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:46:00'),
('20230317144600', 'OUT', '2', 0, 0, '2', 0, '2', 1, '2023-03-17', '2023-03-17 14:46:00'),
('20230317161241', 'IN', '1', 50, 550, '5', 450000, '2', 1, '2023-03-17', '2023-03-17 16:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `tabitemsaldo`
--

CREATE TABLE IF NOT EXISTS `tabitemsaldo` (
  `id` varchar(30) NOT NULL,
  `transID` varchar(30) NOT NULL,
  `ingredientID` varchar(30) NOT NULL,
  `supplierID` varchar(30) DEFAULT NULL,
  `outletID` varchar(3) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `amountUsed` float DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `itemPrice` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemsaldo`
--

INSERT INTO `tabitemsaldo` (`id`, `transID`, `ingredientID`, `supplierID`, `outletID`, `amount`, `amountUsed`, `measurementID`, `itemPrice`, `totalPrice`, `saldo`, `status`, `dateCreated`, `lastChanged`) VALUES
('20230227100110', 'TRX-20230227100110', '2', 'SPL-221121-3', '1', 20, 20, '2', 15000, 300000, 0, 1, '2023-02-27', '2023-02-27 10:01:10'),
('20221122075422', 'TRX-20221122075422', '4', 'SPL-221024-2', '1', 20, 20, '2', 2e+006, 3.8e+007, 0, 1, '2022-11-22', '2022-11-22 07:54:22'),
('20221121133234', 'TRX-20221121133234', '6', 'SPL-221121-3', '1', 10, 10, '2', 1e+006, 8e+006, 0, 1, '2022-11-21', '2022-11-21 13:32:34'),
('20230317161241', 'TRX-20230317161241', '1', 'SPL-221022-1', '1', 50, 0, '5', 10000, 450000, 450000, 1, '2023-03-17', '2023-03-17 16:12:41'),
('20230310134506', 'TRX-20230310134506', '2', 'SPL-221024-2', '1', 50, 50, '2', 15000, 750000, 0, 1, '2023-03-10', '2023-03-10 13:45:06'),
('20230310134549', 'TRX-20230310134549', '4', 'SPL-221022-1', '1', 15, 15, '2', 25000, 375000, 0, 1, '2023-03-10', '2023-03-10 13:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `tabitemtransaction`
--

CREATE TABLE IF NOT EXISTS `tabitemtransaction` (
  `transID` varchar(30) NOT NULL,
  `transDate` date DEFAULT NULL,
  `supplierID` varchar(30) DEFAULT NULL,
  `outletID` varchar(3) DEFAULT NULL,
  `ingredientID` varchar(30) NOT NULL,
  `amount` float DEFAULT NULL,
  `itemAmount` float DEFAULT NULL,
  `itemPrice` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `discountPrice` float DEFAULT NULL,
  `afterDiscount` float NOT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `userID` varchar(30) DEFAULT NULL,
  `remarks` text,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemtransaction`
--

INSERT INTO `tabitemtransaction` (`transID`, `transDate`, `supplierID`, `outletID`, `ingredientID`, `amount`, `itemAmount`, `itemPrice`, `totalPrice`, `discount`, `discountPrice`, `afterDiscount`, `measurementID`, `userID`, `remarks`, `dateCreated`, `lastChanged`) VALUES
('TRX-20221122075422', '2022-11-22', 'SPL-221024-2', '1', '4', 20, 20, 2e+006, 4e+007, 5, 2e+006, 0, '2', '2', '', '2022-11-22', '2022-11-22 07:54:22'),
('TRX-20221121133234', '2022-11-21', 'SPL-221121-3', '1', '6', 10, 30, 1e+006, 1e+007, 20, 2e+006, 0, '2', '2', 'Diskon', '2022-11-21', '2022-11-21 13:32:34'),
('TRX-20230227100110', '2023-02-27', 'SPL-221121-3', '1', '2', 20, 26, 15000, 300000, 0, 0, 0, '2', '2', '', '2023-02-27', '2023-02-27 10:01:10'),
('TRX-20230310134506', '2023-03-10', 'SPL-221024-2', '1', '2', 50, 50, 15000, 750000, 0, 0, 0, '2', '2', '', '2023-03-10', '2023-03-10 13:45:06'),
('TRX-20230310134549', '2023-03-10', 'SPL-221022-1', '1', '4', 15, 15, 25000, 375000, 0, 0, 0, '2', '2', '', '2023-03-10', '2023-03-10 13:45:49'),
('TRX-20230317161241', '2023-03-17', 'SPL-221022-1', '1', '1', 50, 550, 10000, 500000, 10, 50000, 0, '5', '2', 'Harusnya 450', '2023-03-17', '2023-03-17 16:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `tabloyalty`
--

CREATE TABLE IF NOT EXISTS `tabloyalty` (
  `loyaltyID` varchar(30) NOT NULL DEFAULT '',
  `customerID` varchar(30) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `loyaltyPoint` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`loyaltyID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabloyalty`
--

INSERT INTO `tabloyalty` (`loyaltyID`, `customerID`, `outletID`, `loyaltyPoint`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', '1', '1', 110, 1, '2022-12-21', '2023-03-03 09:07:56'),
('2', '2', '1', 90, 1, '2022-12-21', '2023-02-23 10:20:32'),
('3', '3', '1', 140, 1, '2022-12-21', '2023-03-04 10:21:50'),
('4', '4', '1', 50, 1, '2022-12-22', '2023-02-28 12:03:07'),
('5', '5', '1', 30, 1, '2022-12-28', '2023-01-19 14:26:17');

-- --------------------------------------------------------

--
-- Table structure for table `taborderdetail`
--

CREATE TABLE IF NOT EXISTS `taborderdetail` (
  `id` varchar(30) NOT NULL,
  `orderID` varchar(30) NOT NULL,
  `productID` varchar(30) DEFAULT NULL,
  `productAmount` int(11) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productSubtotal` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taborderdetail`
--

INSERT INTO `taborderdetail` (`id`, `orderID`, `productID`, `productAmount`, `productPrice`, `productSubtotal`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'PCA/RCP/202211/0001', '1', 2, 5000, 10000, 1, '2022-11-21', '2022-11-21 14:25:28'),
('1', 'PCA/RCP/202211/0002', '1', 1, 5000, 5000, 1, '2022-11-21', '2022-11-21 14:34:29'),
('1', 'PCA/RCP/202211/0003', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 08:55:19'),
('1', 'PCA/RCP/202211/0004', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 08:22:30'),
('1', 'PCA/RCP/202211/0005', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 08:56:11'),
('1', 'PCA/RCP/202211/0006', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 09:19:13'),
('1', 'PCA/RCP/202211/0007', '1', 3, 5000, 15000, 1, '2022-11-22', '2022-11-22 09:39:26'),
('1', 'PCA/RCP/202211/0008', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 09:41:30'),
('1', 'PCA/RCP/202211/0009', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 09:42:08'),
('1', 'PCA/RCP/202211/0010', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 09:42:33'),
('1', 'PCA/RCP/202211/0011', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 09:46:00'),
('1', 'PCA/RCP/202211/0012', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 09:55:15'),
('1', 'PCA/RCP/202211/0013', '1', 1, 5000, 5000, 1, '2022-11-22', '2022-11-22 09:57:28'),
('1', 'PCA/RCP/202211/0017', '1', 1, 5000, 5000, 9, '2022-11-22', '2022-12-03 09:56:42'),
('1', 'PCA/RCP/202212/0001', '2', 1, 15000, 15000, 1, '2022-12-03', '2022-12-03 10:02:48'),
('2', 'PCA/RCP/202212/0001', '1', 1, 5000, 5000, 1, '2022-12-03', '2022-12-03 10:02:48'),
('1', 'PCA/RCP/202212/0002', '1', 1, 5000, 5000, 1, '2022-12-05', '2022-12-05 10:16:41'),
('1', 'PCA/RCP/202212/0003', '1', 1, 5000, 5000, 1, '2022-12-05', '2022-12-05 10:20:05'),
('1', 'PCA/RCP/202212/0004', '1', 1, 5000, 5000, 1, '2022-12-05', '2022-12-05 11:27:59'),
('1', 'PCA/RCP/202212/0005', '1', 10, 5000, 50000, 1, '2022-12-09', '2022-12-09 16:27:50'),
('1', 'PCA/RCP/202212/0006', '2', 5, 15000, 75000, 1, '2022-12-09', '2022-12-09 16:30:51'),
('1', 'PCA/RCP/202212/0007', '3', 1, 8500, 8500, 1, '2022-12-13', '2022-12-13 08:43:00'),
('1', 'PCA/RCP/202212/0008', '3', 1, 8500, 8500, 1, '2022-12-13', '2022-12-13 08:53:25'),
('1', 'PCA/RCP/202212/0009', '3', 1, 8500, 8500, 1, '2022-12-13', '2022-12-13 08:54:03'),
('2', 'PCA/RCP/202212/0009', '1', 1, 5000, 5000, 1, '2022-12-13', '2022-12-13 08:54:03'),
('1', 'PCA/RCP/202212/0010', '3', 1, 8500, 8500, 1, '2022-12-13', '2022-12-13 08:54:51'),
('1', 'PCA/RCP/202212/0011', '1', 1, 5000, 5000, 1, '2022-12-19', '2022-12-19 09:54:04'),
('1', 'PCA/RCP/202212/0012', '1', 1, 5000, 5000, 1, '2022-12-19', '2022-12-19 09:55:20'),
('2', 'PCA/RCP/202212/0012', '3', 1, 8500, 8500, 1, '2022-12-19', '2022-12-19 09:55:20'),
('1', 'PCA/RCP/202212/0013', '1', 1, 5000, 5000, 1, '2022-12-19', '2022-12-19 10:20:37'),
('1', 'PCA/RCP/202212/0014', '1', 1, 5000, 5000, 1, '2022-12-19', '2022-12-19 11:00:52'),
('1', 'PCA/RCP/202212/0015', '2', 1, 15000, 15000, 1, '2022-12-19', '2022-12-19 11:01:30'),
('2', 'PCA/RCP/202212/0015', '1', 1, 5000, 5000, 1, '2022-12-19', '2022-12-19 11:01:30'),
('1', 'PCA/RCP/202212/0016', '3', 1, 8500, 8500, 9, '2022-12-19', '2022-12-19 11:23:35'),
('1', 'PCA/RCP/202212/0017', '3', 1, 8500, 8500, 1, '2022-12-19', '2022-12-19 15:35:27'),
('1', 'PCA/RCP/202212/0018', '1', 1, 5000, 5000, 1, '2022-12-19', '2022-12-19 15:36:39'),
('1', 'PCA/RCP/202212/0019', '3', 1, 8500, 8500, 1, '2022-12-19', '2022-12-19 15:37:16'),
('1', 'PCA/RCP/202212/0020', '1', 1, 5000, 5000, 1, '2022-12-19', '2022-12-19 15:37:47'),
('1', 'PCA/RCP/202212/0021', '3', 1, 8500, 8500, 9, '2022-12-19', '2022-12-21 08:59:26'),
('1', 'PCA/RCP/202212/0022', '2', 1, 15000, 15000, 1, '2022-12-19', '2022-12-19 15:40:16'),
('1', 'PCA/RCP/202212/0023', '3', 1, 8500, 8500, 1, '2022-12-19', '2022-12-19 15:48:48'),
('1', 'PCA/RCP/202212/0024', '1', 1, 5000, 5000, 1, '2022-12-20', '2022-12-20 09:01:54'),
('1', 'PCA/RCP/202212/0025', '2', 1, 15000, 15000, 1, '2022-12-20', '2022-12-20 09:11:05'),
('1', 'PCA/RCP/202212/0026', '3', 1, 8500, 8500, 1, '2022-12-20', '2022-12-20 09:34:40'),
('1', 'PCA/RCP/202212/0027', '3', 6, 8500, 51000, 1, '2022-12-20', '2022-12-20 16:22:53'),
('1', 'PCA/RCP/202212/0028', '1', 1, 5000, 5000, 1, '2022-12-20', '2022-12-20 16:29:52'),
('1', 'PCA/RCP/202212/0029', '2', 1, 15000, 15000, 1, '2022-12-20', '2022-12-20 16:30:51'),
('1', 'PCA/RCP/202212/0030', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 08:59:51'),
('1', 'PCA/RCP/202212/0031', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:02:53'),
('1', 'PCA/RCP/202212/0032', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:05:13'),
('1', 'PCA/RCP/202212/0033', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:05:32'),
('1', 'PCA/RCP/202212/0034', '2', 2, 15000, 30000, 1, '2022-12-21', '2022-12-21 09:06:02'),
('2', 'PCA/RCP/202212/0034', '3', 3, 8500, 25500, 1, '2022-12-21', '2022-12-21 09:06:02'),
('1', 'PCA/RCP/202212/0035', '2', 2, 15000, 30000, 1, '2022-12-21', '2022-12-21 09:09:30'),
('2', 'PCA/RCP/202212/0035', '1', 4, 5000, 20000, 1, '2022-12-21', '2022-12-21 09:09:30'),
('1', 'PCA/RCP/202212/0036', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:11:21'),
('1', 'PCA/RCP/202212/0037', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:16:48'),
('1', 'PCA/RCP/202212/0038', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:17:33'),
('1', 'PCA/RCP/202212/0039', '2', 5, 15000, 75000, 1, '2022-12-21', '2022-12-21 09:17:51'),
('1', 'PCA/RCP/202212/0040', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:18:50'),
('1', 'PCA/RCP/202212/0041', '2', 4, 15000, 60000, 1, '2022-12-21', '2022-12-21 09:19:51'),
('1', 'PCA/RCP/202212/0042', '2', 1, 15000, 15000, 1, '2022-12-21', '2022-12-21 10:41:53'),
('1', 'PCA/RCP/202212/0043', '2', 1, 15000, 15000, 1, '2022-12-21', '2022-12-21 10:42:15'),
('1', 'PCA/RCP/202212/0044', '2', 1, 15000, 15000, 1, '2022-12-22', '2022-12-22 10:24:51'),
('1', 'PCA/RCP/202212/0045', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:47:50'),
('1', 'PCA/RCP/202212/0046', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:47:55'),
('1', 'PCA/RCP/202212/0047', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:47:59'),
('1', 'PCA/RCP/202212/0048', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:48:03'),
('1', 'PCA/RCP/202212/0049', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:48:09'),
('1', 'PCA/RCP/202212/0050', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:48:13'),
('1', 'PCA/RCP/202212/0051', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:48:30'),
('1', 'PCA/RCP/202212/0052', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:50:20'),
('1', 'PCA/RCP/202212/0053', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:51:52'),
('1', 'PCA/RCP/202212/0054', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:51:57'),
('1', 'PCA/RCP/202212/0055', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:54:26'),
('1', 'PCA/RCP/202212/0056', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:54:21'),
('1', 'PCA/RCP/202212/0057', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 13:57:59'),
('1', 'PCA/RCP/202212/0058', '2', 1, 15000, 15000, 9, '2022-12-22', '2022-12-22 14:34:46'),
('1', 'PCA/RCP/202212/0059', '1', 1, 5000, 5000, 1, '2022-12-22', '2022-12-22 14:33:16'),
('1', 'PCA/RCP/202212/0060', '2', 2, 15000, 30000, 1, '2022-12-22', '2022-12-22 15:25:54'),
('1', 'PCA/RCP/202212/0061', '4', 1, 5000, 5000, 1, '2022-12-28', '2022-12-28 13:59:44'),
('2', 'PCA/RCP/202212/0061', '2', 1, 15000, 15000, 1, '2022-12-28', '2022-12-28 13:59:44'),
('1', 'PCA/RCP/202212/0062', '4', 1, 5000, 5000, 1, '2022-12-28', '2022-12-28 14:02:11'),
('1', 'PCA/RCP/202212/0063', '1', 1, 5000, 5000, 1, '2022-12-28', '2022-12-28 14:03:43'),
('1', 'PCA/RCP/202212/0064', '4', 1, 5000, 5000, 1, '2022-12-28', '2022-12-28 15:00:14'),
('1', 'PCA/RCP/202212/0065', '4', 1, 5000, 5000, 1, '2022-12-28', '2022-12-28 15:00:45'),
('3', 'PCA/RCP/202301/0001', '2', 1, 15000, 15000, 1, '2023-01-06', '2023-01-06 08:44:17'),
('2', 'PCA/RCP/202301/0001', '3', 1, 8500, 8500, 1, '2023-01-06', '2023-01-18 16:01:29'),
('1', 'PCA/RCP/202301/0001', '3', 10, 8500, 85000, 1, '2023-01-06', '2023-01-19 14:28:31'),
('1', 'PCA/RCP/202212/0066', '2', 1, 15000, 15000, 1, '2022-12-28', '2022-12-28 15:13:53'),
('1', 'PCA/RCP/202301/0009', '3', 1, 8500, 8500, 1, '2023-01-31', '2023-01-31 09:45:21'),
('1', 'PCA/RCP/202301/0008', '1', 1, 5000, 5000, 1, '2023-01-31', '2023-01-31 09:19:57'),
('1', 'PCA/RCP/202301/0007', '1', 1, 5000, 5000, 0, '2023-01-27', '2023-01-27 15:06:53'),
('1', 'PCA/RCP/202301/0006', '3', 1, 8500, 8500, 9, '2023-01-26', '2023-01-27 14:54:47'),
('1', 'PCA/RCP/202301/0005', '5', 1, 5000, 5000, 1, '2023-01-25', '2023-01-25 08:42:54'),
('1', 'PCA/RCP/202301/0004', '3', 2, 8500, 17000, 1, '2023-01-19', '2023-01-19 14:30:16'),
('1', 'PCA/RCP/202301/0003', '1', 3, 5000, 15000, 1, '2023-01-19', '2023-01-19 14:29:37'),
('2', 'PCA/RCP/202301/0003', '3', 3, 8500, 25500, 1, '2023-01-19', '2023-01-19 14:29:37'),
('1', 'PCA/RCP/202301/0002', '1', 2, 5000, 10000, 1, '2023-01-19', '2023-01-19 14:28:55'),
('1', 'PCA/RCP/202301/0001', '3', 10, 8500, 85000, 1, '2023-01-19', '2023-01-19 14:28:31'),
('1', 'PCA/RCP/202301/0010', '1', 1, 5000, 5000, 1, '2023-01-31', '2023-01-31 10:03:28'),
('1', 'PCA/RCP/202302/0001', '1', 1, 11000, 11000, 1, '2023-02-01', '2023-02-01 15:47:38'),
('1', 'PCA/RCP/202302/0002', '1', 1, 11000, 11000, 1, '2023-02-02', '2023-02-02 09:14:56'),
('1', 'PCA/RCP/202302/0003', '3', 1, 9000, 9000, 1, '2023-02-02', '2023-02-02 09:15:12'),
('1', 'PCA/RCP/202302/0004', '5', 1, 7500, 7500, 1, '2023-02-02', '2023-02-02 09:15:38'),
('1', 'PCA/RCP/202302/0005', '3', 1, 12000, 12000, 1, '2023-02-09', '2023-02-09 17:11:24'),
('1', 'PCA/END/202302/0006', '1', 1, 11000, 11000, 1, '2023-02-11', '2023-02-11 09:09:19'),
('1', 'PCA/END/202302/0007', '1', 1, 11000, 11000, 1, '2023-02-11', '2023-02-11 09:58:26'),
('1', 'PCA/END/202302/0008', '1', 1, 11000, 11000, 1, '2023-02-13', '2023-02-13 09:07:08'),
('1', 'PCA/END/202302/0009', '1', 1, 11000, 11000, 0, '2023-02-13', '2023-02-13 09:29:59'),
('1', 'PCA/END/202302/0010', '1', 1, 11000, 11000, 1, '2023-02-13', '2023-02-13 09:41:52'),
('1', 'PCA/RCP/202302/0011', '5', 1, 5000, 5000, 1, '2023-02-14', '2023-02-14 11:58:05'),
('1', 'PCA/RCP/202302/0012', '3', 1, 12000, 12000, 1, '2023-02-14', '2023-02-14 14:03:48'),
('1', 'PCA/RCP/202302/0013', '3', 2, 12000, 24000, 1, '2023-02-14', '2023-02-14 14:07:53'),
('2', 'PCA/RCP/202302/0013', '1', 3, 11000, 33000, 1, '2023-02-14', '2023-02-14 14:07:53'),
('1', 'PCA/RCP/202302/0014', '1', 1, 8500, 8500, 1, '2023-02-15', '2023-02-15 15:34:06'),
('1', 'PCA/END/202302/0015', '3', 2, 12000, 24000, 1, '2023-02-15', '2023-02-15 15:34:27'),
('1', 'PCA/RCP/202302/0016', '1', 1, 8500, 8500, 1, '2023-02-23', '2023-02-23 10:03:01'),
('2', 'PCA/RCP/202302/0016', '5', 1, 5000, 5000, 1, '2023-02-23', '2023-02-23 10:03:01'),
('1', 'PCA/RPO/202302/0003', '3', 5, 8500, 42500, 1, '2023-02-24', '2023-02-24 09:31:37'),
('1', 'PCA/RPO/202302/0018', '1', 5, 5000, 25000, 3, '2023-02-24', '2023-02-24 09:51:13'),
('1', 'PCA/RCP/202302/0019', '1', 1, 11000, 11000, 1, '2023-02-28', '2023-02-28 09:47:21'),
('1', 'PCA/RCP/202302/0020', '1', 1, 8500, 8500, 1, '2023-02-28', '2023-02-28 09:47:41'),
('1', 'PCA/RPO/202302/0021', '1', 2, 5000, 10000, 3, '2023-02-28', '2023-02-28 09:48:10'),
('2', 'PCA/RPO/202302/0021', '3', 2, 8500, 17000, 3, '2023-02-28', '2023-02-28 09:48:10'),
('1', 'PCA/RPO/202303/0001', '1', 1, 5000, 5000, 4, '2023-03-01', '2023-03-01 07:54:21'),
('2', 'PCA/RCP/202303/0002', '3', 1, 8500, 8500, 0, '2023-03-01', '2023-03-01 09:09:58'),
('3', 'PCA/RCP/202303/0002', '5', 1, 5000, 5000, 0, '2023-03-01', '2023-03-01 09:09:58'),
('1', 'PCA/RCP/202303/0002', '1', 1, 8500, 8500, 0, '2023-03-01', '2023-03-01 09:09:58'),
('1', 'PCA/RPO/202303/0003', '1', 5, 5000, 25000, 4, '2023-03-03', '2023-03-04 10:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `taborderheader`
--

CREATE TABLE IF NOT EXISTS `taborderheader` (
  `orderID` varchar(30) NOT NULL,
  `orderNo` int(11) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `orderPeriode` varchar(10) DEFAULT NULL,
  `orderAmount` int(11) DEFAULT NULL,
  `orderMethod` smallint(6) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `payerName` varchar(50) DEFAULT NULL,
  `payerPhone` varchar(20) DEFAULT NULL,
  `payerEmail` varchar(100) DEFAULT NULL,
  `remarks` text,
  `userID` varchar(10) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taborderheader`
--

INSERT INTO `taborderheader` (`orderID`, `orderNo`, `orderDate`, `orderPeriode`, `orderAmount`, `orderMethod`, `outletID`, `payerName`, `payerPhone`, `payerEmail`, `remarks`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('PCA/RCP/202301/0004', 4, '2023-01-19', '2023-01', 2, 0, '1', 'EKA', '321', '', '', '2', 1, '2023-01-19', '2023-01-19 14:30:16'),
('PCA/RCP/202301/0003', 3, '2023-01-19', '2023-01', 6, 0, '1', 'REZA', '081249862', '', '', '2', 1, '2023-01-19', '2023-01-19 14:29:37'),
('PCA/RCP/202301/0002', 2, '2023-01-19', '2023-01', 2, 0, '1', 'DANDI', '0998096797', '', '', '2', 1, '2023-01-19', '2023-01-19 14:28:55'),
('PCA/RCP/202301/0001', 4, '2023-01-19', '2023-01', 10, 0, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-01-19', '2023-01-19 14:28:31'),
('PCA/RCP/202301/0005', 1, '2023-01-25', '2023-01', 1, 0, '1', 'ARI', '34683216', '', '', '2', 1, '2023-01-25', '2023-01-25 08:42:54'),
('PCA/RCP/202301/0006', 1, '2023-01-26', '2023-01', 1, 0, '1', '', '', '', '', '2', 9, '2023-01-26', '2023-01-27 14:54:47'),
('PCA/RCP/202301/0007', 1, '2023-01-27', '2023-01', 1, 0, '1', 'DANDI', '0998096797', '', '', '2', 0, '2023-01-27', '2023-01-27 15:06:53'),
('PCA/RCP/202301/0008', 1, '2023-01-31', '2023-01', 1, 1, '1', 'EKA', '321', '', '', '2', 1, '2023-01-31', '2023-01-31 09:19:57'),
('PCA/RCP/202301/0009', 2, '2023-01-31', '2023-01', 1, 0, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-01-31', '2023-01-31 09:45:21'),
('PCA/RCP/202301/0010', 3, '2023-01-31', '2023-01', 1, 1, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-01-31', '2023-01-31 10:03:28'),
('PCA/RCP/202302/0001', 1, '2023-02-01', '2023-02', 1, 1, '1', 'EKA', '321', '', '', '2', 1, '2023-02-01', '2023-02-01 15:47:38'),
('PCA/RCP/202302/0002', 1, '2023-02-02', '2023-02', 1, 1, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-02-02', '2023-02-02 09:14:56'),
('PCA/RCP/202302/0003', 2, '2023-02-02', '2023-02', 1, 1, '1', 'REZA', '081249862', '', '', '2', 1, '2023-02-02', '2023-02-02 09:15:12'),
('PCA/RCP/202302/0004', 3, '2023-02-02', '2023-02', 1, 1, '1', '', '', '', '', '2', 1, '2023-02-02', '2023-02-02 09:15:38'),
('PCA/RCP/202302/0005', 1, '2023-02-09', '2023-02', 1, 1, '1', 'DANDI', '0998096797', '', '', '2', 1, '2023-02-09', '2023-02-09 17:11:24'),
('PCA/END/202302/0006', 1, '2023-02-11', '2023-02', 1, 1, '1', 'EKA', '321', '', '', '2', 1, '2023-02-11', '2023-02-11 09:09:19'),
('PCA/END/202302/0007', 2, '2023-02-11', '2023-02', 1, 2, '1', 'EKA', '321', '', '', '2', 1, '2023-02-11', '2023-02-11 09:58:26'),
('PCA/END/202302/0008', 1, '2023-02-13', '2023-02', 1, 1, '1', '', '', '', '', '2', 1, '2023-02-13', '2023-02-13 09:07:08'),
('PCA/END/202302/0009', 2, '2023-02-13', '2023-02', 1, 1, '1', '', '', '', '', '2', 0, '2023-02-13', '2023-02-13 09:29:59'),
('PCA/END/202302/0010', 3, '2023-02-13', '2023-02', 1, 1, '1', 'DANDI', '0998096797', '', '', '2', 1, '2023-02-13', '2023-02-13 09:41:52'),
('PCA/RCP/202302/0011', 1, '2023-02-14', '2023-02', 1, 1, '1', 'EKA', '321', '', '', '2', 1, '2023-02-14', '2023-02-14 11:58:05'),
('PCA/RCP/202302/0012', 2, '2023-02-14', '2023-02', 1, 2, '1', 'EKA', '321', '', '', '2', 1, '2023-02-14', '2023-02-14 14:03:48'),
('PCA/RCP/202302/0013', 3, '2023-02-14', '2023-02', 5, 2, '1', 'FERDI', '02315723785', '', '', '2', 1, '2023-02-14', '2023-02-14 14:07:53'),
('PCA/RCP/202302/0014', 1, '2023-02-15', '2023-02', 1, 1, '1', 'FERDI', '02315723785', '', '', '2', 1, '2023-02-15', '2023-02-15 15:34:06'),
('PCA/END/202302/0015', 1, '2023-02-15', '2023-02', 2, 1, '1', 'DANDI', '0998096797', '', '', '2', 1, '2023-02-15', '2023-02-15 15:34:27'),
('PCA/RCP/202302/0016', 1, '2023-02-23', '2023-02', 2, 1, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-02-23', '2023-02-23 10:03:01'),
('PCA/RPO/202302/0003', 1, '2023-02-24', '2023-02', 5, 0, '1', 'REZA', '081249862', '', '', '2', 4, '2023-02-24', '2023-02-24 09:31:37'),
('PCA/RPO/202302/0018', 2, '2023-02-24', '2023-02', 5, 0, '1', 'WILDHAN', '123', '', 'DP 12500', '2', 3, '2023-02-24', '2023-02-24 09:51:13'),
('PCA/RCP/202302/0019', 1, '2023-02-28', '2023-02', 1, 2, '1', 'DANDI', '0998096797', '', '', '2', 1, '2023-02-28', '2023-02-28 09:47:21'),
('PCA/RCP/202302/0020', 2, '2023-02-28', '2023-02', 1, 1, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-02-28', '2023-02-28 09:47:41'),
('PCA/RPO/202302/0021', 1, '2023-02-28', '2023-02', 4, 0, '1', 'REZA', '081249862', '', '', '2', 3, '2023-02-28', '2023-02-28 09:48:10'),
('PCA/RPO/202303/0001', 1, '2023-03-01', '2023-03', 1, 0, '1', 'REZA', '081249862', '', 'FP 5000', '2', 4, '2023-03-01', '2023-03-01 07:54:21'),
('PCA/RCP/202303/0002', 1, '2023-03-01', '2023-03', 3, 1, '1', 'ARI', '34683216', '', '', '2', 0, '2023-03-01', '2023-03-01 09:09:58'),
('PCA/RPO/202303/0003', 1, '2023-03-03', '2023-03', 5, 0, '1', 'DANDI', '0998096797', '', 'PELUNASAN 25000', '2', 4, '2023-03-03', '2023-03-04 10:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `taborderheaderb`
--

CREATE TABLE IF NOT EXISTS `taborderheaderb` (
  `orderID` varchar(30) NOT NULL,
  `orderNo` int(11) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `orderPeriode` varchar(10) DEFAULT NULL,
  `orderAmount` int(11) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `dpp` float DEFAULT NULL,
  `VAT` float DEFAULT NULL,
  `discountPrice` float DEFAULT NULL,
  `discountPerc` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `promoID` varchar(30) DEFAULT NULL,
  `isVoucher` smallint(6) DEFAULT NULL,
  `voucherID` varchar(50) DEFAULT NULL,
  `paymentAmount` float DEFAULT NULL,
  `paymentMethod` varchar(30) DEFAULT NULL,
  `payerName` varchar(50) DEFAULT NULL,
  `payerPhone` varchar(20) DEFAULT NULL,
  `payerEmail` varchar(100) DEFAULT NULL,
  `remarks` text,
  `userID` varchar(10) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taborderheaderb`
--

INSERT INTO `taborderheaderb` (`orderID`, `orderNo`, `orderDate`, `orderPeriode`, `orderAmount`, `outletID`, `dpp`, `VAT`, `discountPrice`, `discountPerc`, `total`, `promoID`, `isVoucher`, `voucherID`, `paymentAmount`, `paymentMethod`, `payerName`, `payerPhone`, `payerEmail`, `remarks`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('PCA/RCP/202211/0001', 1, '2022-11-21', '2022-11', 2, '1', 10000, 0, 0, NULL, 10000, 'PRM-20221121-4', 0, '', 20000, '1', '', '', '', '', '2', 1, '2022-11-21', '2022-11-21 14:25:28'),
('PCA/RCP/202211/0002', 2, '2022-11-21', '2022-11', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 15000, '1', '', '', '', '', '2', 1, '2022-11-21', '2022-11-21 14:34:29'),
('PCA/RCP/202211/0003', 1, '2022-11-22', '2022-11', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 08:55:19'),
('PCA/RCP/202211/0004', 2, '2022-11-22', '2022-11', 1, '1', 5000, 0, 0, NULL, 5000, 'PRM-20221121-4', 0, '', 10000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 08:22:30'),
('PCA/RCP/202211/0005', 3, '2022-11-22', '2022-11', 1, '1', 5000, 0, 0, NULL, 5000, 'PRM-20221121-4', 0, '', 10000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 08:56:11'),
('PCA/RCP/202211/0006', 4, '2022-11-22', '2022-11', 1, '1', 5000, 0, 0, NULL, 5000, 'PRM-20221121-4', 0, '', 5000, '1', 'wes', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:19:13'),
('PCA/RCP/202211/0007', 5, '2022-11-22', '2022-11', 3, '1', 15000, 0, 750, NULL, 14250, 'PRM-20221121-4', 0, '', 15000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:39:26'),
('PCA/RCP/202211/0008', 6, '2022-11-22', '2022-11', 1, '1', 5000, 0, 250, NULL, 250, '', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:41:30'),
('PCA/RCP/202211/0009', 7, '2022-11-22', '2022-11', 1, '1', 5000, 0, 250, NULL, 250, '', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:42:08'),
('PCA/RCP/202211/0010', 8, '2022-11-22', '2022-11', 1, '1', 5000, 0, 250, NULL, 4750, 'PRM-20221121-4', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:42:33'),
('PCA/RCP/202211/0011', 9, '2022-11-22', '2022-11', 1, '1', 5000, 0, 250, NULL, 4750, 'PRM-20221121-4', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:46:00'),
('PCA/RCP/202211/0012', 10, '2022-11-22', '2022-11', 1, '1', 5000, 0, 250, NULL, 4750, '', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:55:15'),
('PCA/RCP/202211/0013', 11, '2022-11-22', '2022-11', 1, '1', 5000, 0, 250, NULL, 4750, 'PRM-20221121-4', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-11-22', '2022-11-22 09:57:28'),
('PCA/RCP/202211/0014', 12, '2022-11-22', '2022-11', 0, '1', 0, 0, 0, NULL, 0, '', 0, '', 0, '', '', '', '', '', '2', 9, '2022-11-22', '2022-12-02 08:19:02'),
('PCA/RCP/202211/0015', 12, '2022-11-22', '2022-11', 0, '1', 0, 0, 0, NULL, 0, '', 0, '', 0, '', '', '', '', '', '2', 9, '2022-11-22', '2022-12-03 09:56:30'),
('PCA/RCP/202211/0016', 14, '2022-11-22', '2022-11', 0, '1', 0, 0, 0, NULL, 0, '', 0, '', 0, '', '', '', '', '', '2', 9, '2022-11-22', '2022-12-03 09:56:37'),
('PCA/RCP/202211/0017', 15, '2022-11-22', '2022-11', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 0, '', '', '', '', '', '2', 9, '2022-11-22', '2022-12-03 09:56:42'),
('PCA/RCP/202212/0001', 1, '2022-12-03', '2022-12', 2, '1', 20000, 0, 0, NULL, 20000, '', 0, '', 20000, '1', 'wes', 'q081775105588', 'wildhan.simdig04@gmail.com', '', '2', 1, '2022-12-03', '2022-12-03 10:02:48'),
('PCA/RCP/202212/0002', 1, '2022-12-05', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'wes', 'q081775105588', 'wildhan.simdig04@gmail.com', '', '2', 1, '2022-12-05', '2022-12-05 10:16:41'),
('PCA/RCP/202212/0003', 2, '2022-12-05', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'test', 'q081775105588', 'wildhan.simdig04@gmail.com', '', '2', 1, '2022-12-05', '2022-12-05 10:20:05'),
('PCA/RCP/202212/0004', 3, '2022-12-05', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 10000, '1', 'fa', '2353', '', '', '2', 1, '2022-12-05', '2022-12-05 11:27:59'),
('PCA/RCP/202212/0005', 1, '2022-12-09', '2022-12', 10, '1', 50000, 0, 0, NULL, 50000, '', 0, '', 50000, '1', '', '', '', '', '2', 1, '2022-12-09', '2022-12-09 16:27:50'),
('PCA/RCP/202212/0006', 2, '2022-12-09', '2022-12', 5, '1', 75000, 0, 0, NULL, 75000, '', 0, '', 75000, '1', '', '', '', '', '2', 1, '2022-12-09', '2022-12-09 16:30:51'),
('PCA/RCP/202212/0007', 1, '2022-12-13', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 15000, '1', '', '', '', '', '6', 1, '2022-12-13', '2022-12-13 08:43:00'),
('PCA/RCP/202212/0008', 2, '2022-12-13', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', '', '', '', '', '6', 1, '2022-12-13', '2022-12-13 08:53:25'),
('PCA/RCP/202212/0009', 3, '2022-12-13', '2022-12', 2, '1', 13500, 0, 0, NULL, 13500, '', 0, '', 13500, '1', 'Rendra', '081775105588', '', '', '6', 1, '2022-12-13', '2022-12-13 08:54:03'),
('PCA/RCP/202212/0010', 4, '2022-12-13', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'Dani', '08556931523', 'danikenz@gmail.com', '', '6', 1, '2022-12-13', '2022-12-13 08:54:51'),
('PCA/RCP/202212/0011', 1, '2022-12-19', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'Dani', '089714359999', 'danifir@gmail.com', '', '2', 1, '2022-12-19', '2022-12-19 09:54:04'),
('PCA/RCP/202212/0012', 2, '2022-12-19', '2022-12', 2, '1', 13500, 0, 0, NULL, 13500, '', 0, '', 13500, '1', 'Rendra', '087765771254', 'rendraaji@gmail.com', '', '2', 1, '2022-12-19', '2022-12-19 09:55:20'),
('PCA/RCP/202212/0013', 3, '2022-12-19', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'Dandi', '08098', 'dandimuh@gmail.com', '', '2', 1, '2022-12-19', '2022-12-19 10:20:37'),
('PCA/RCP/202212/0014', 4, '2022-12-19', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'A', '0123', 'a', '', '2', 1, '2022-12-19', '2022-12-19 11:00:52'),
('PCA/RCP/202212/0015', 5, '2022-12-19', '2022-12', 2, '1', 20000, 0, 0, NULL, 20000, '', 0, '', 20000, '1', '', '', '', '', '2', 1, '2022-12-19', '2022-12-19 11:01:30'),
('PCA/RCP/202212/0016', 6, '2022-12-19', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '2', '', '', '', '', '2', 9, '2022-12-19', '2022-12-19 11:23:35'),
('PCA/RCP/202212/0017', 7, '2022-12-19', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'B', '09970', 'B', '', '2', 1, '2022-12-19', '2022-12-19 15:35:27'),
('PCA/RCP/202212/0018', 8, '2022-12-19', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'B', '123', 'B', '', '2', 1, '2022-12-19', '2022-12-19 15:36:39'),
('PCA/RCP/202212/0019', 9, '2022-12-19', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'B', '123', 'B', '', '2', 1, '2022-12-19', '2022-12-19 15:37:16'),
('PCA/RCP/202212/0020', 10, '2022-12-19', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'B', '123', 'B', '', '2', 1, '2022-12-19', '2022-12-19 15:37:47'),
('PCA/RCP/202212/0021', 11, '2022-12-19', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'B', '123354262', 'b', '', '2', 9, '2022-12-19', '2022-12-21 08:59:26'),
('PCA/RCP/202212/0022', 12, '2022-12-19', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'B', '089714359999', 'B', '', '2', 1, '2022-12-19', '2022-12-19 15:40:16'),
('PCA/RCP/202212/0023', 13, '2022-12-19', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'B', '23531', 'B', '', '2', 1, '2022-12-19', '2022-12-19 15:48:48'),
('PCA/RCP/202212/0024', 1, '2022-12-20', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'A', '0123', 'a', '', '2', 1, '2022-12-20', '2022-12-20 09:01:54'),
('PCA/RCP/202212/0025', 2, '2022-12-20', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'B', '1241', 'B', '', '2', 1, '2022-12-20', '2022-12-20 09:11:05'),
('PCA/RCP/202212/0026', 3, '2022-12-20', '2022-12', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'A', 'q081775105588', 'a', '', '2', 1, '2022-12-20', '2022-12-20 09:34:40'),
('PCA/RCP/202212/0027', 4, '2022-12-20', '2022-12', 6, '1', 51000, 0, 0, NULL, 51000, '', 0, '', 51000, '1', 'B', '1241', 'B', '', '2', 1, '2022-12-20', '2022-12-20 16:22:53'),
('PCA/RCP/202212/0028', 5, '2022-12-20', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'A', '0123', 'a', '', '2', 1, '2022-12-20', '2022-12-20 16:29:52'),
('PCA/RCP/202212/0029', 6, '2022-12-20', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'C', '089714359999', 'C', '', '2', 1, '2022-12-20', '2022-12-20 16:30:51'),
('PCA/RCP/202212/0030', 1, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '1', 'Wildhan Eka', '081775105588', '', '', '2', 1, '2022-12-21', '2022-12-21 08:59:51'),
('PCA/RCP/202212/0031', 2, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '2', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:02:53'),
('PCA/RCP/202212/0032', 3, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '1', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:05:13'),
('PCA/RCP/202212/0033', 4, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '2', 'Eka', '321', '', '', '2', 1, '2022-12-21', '2022-12-21 09:05:32'),
('PCA/RCP/202212/0034', 5, '2022-12-21', '2022-12', 5, '1', 55500, 0, 0, NULL, 55500, '', 0, '', 55500, '1', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:06:02'),
('PCA/RCP/202212/0035', 6, '2022-12-21', '2022-12', 6, '1', 50000, 0, 0, NULL, 50000, '', 0, '', 50000, '2', 'Eka', '321', '', '', '2', 1, '2022-12-21', '2022-12-21 09:09:30'),
('PCA/RCP/202212/0036', 7, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '1', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:11:21'),
('PCA/RCP/202212/0037', 8, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '2', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:16:48'),
('PCA/RCP/202212/0038', 9, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '1', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:17:33'),
('PCA/RCP/202212/0039', 10, '2022-12-21', '2022-12', 5, '1', 75000, 0, 0, NULL, 75000, '', 0, '', 75000, '2', 'Eka', '321', '', '', '2', 1, '2022-12-21', '2022-12-21 09:17:51'),
('PCA/RCP/202212/0040', 11, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '2', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:18:50'),
('PCA/RCP/202212/0041', 12, '2022-12-21', '2022-12', 4, '1', 60000, 0, 0, NULL, 60000, '', 0, '', 60000, '1', 'Wildhan', '123', '', '', '2', 1, '2022-12-21', '2022-12-21 09:19:51'),
('PCA/RCP/202212/0042', 13, '2022-12-21', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'Dandi', '0998096797', '', '', '2', 1, '2022-12-21', '2022-12-21 10:41:53'),
('PCA/RCP/202212/0043', 14, '2022-12-21', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'Dandi', '0998096797', '', '', '2', 1, '2022-12-21', '2022-12-21 10:42:15'),
('PCA/RCP/202212/0044', 1, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'Wildhan', '123', '', '', '2', 1, '2022-12-22', '2022-12-22 10:24:51'),
('PCA/RCP/202212/0045', 2, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'Wildhan', '123', '', '', '2', 9, '2022-12-22', '2022-12-22 13:47:50'),
('PCA/RCP/202212/0046', 3, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'W', '1', '', '', '2', 9, '2022-12-22', '2022-12-22 13:47:55'),
('PCA/RCP/202212/0047', 4, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 0, '1', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:47:59'),
('PCA/RCP/202212/0048', 5, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'Wildhan', '123', '', '', '2', 9, '2022-12-22', '2022-12-22 13:48:03'),
('PCA/RCP/202212/0049', 6, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 0, '1', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:48:09'),
('PCA/RCP/202212/0050', 7, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:48:13'),
('PCA/RCP/202212/0051', 8, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 0, '1', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:48:30'),
('PCA/RCP/202212/0052', 9, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 0, '2', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:50:20'),
('PCA/RCP/202212/0053', 10, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 0, '2', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:51:52'),
('PCA/RCP/202212/0054', 11, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '2', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:51:57'),
('PCA/RCP/202212/0055', 12, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:54:26'),
('PCA/RCP/202212/0056', 13, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 0, '1', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:54:21'),
('PCA/RCP/202212/0057', 14, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', '', '', '', '', '2', 9, '2022-12-22', '2022-12-22 13:57:59'),
('PCA/RCP/202212/0058', 15, '2022-12-22', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '2', 'Wildhan', '123', '', '', '2', 9, '2022-12-22', '2022-12-22 14:34:46'),
('PCA/RCP/202212/0059', 16, '2022-12-22', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', '', '', '', '', '2', 1, '2022-12-22', '2022-12-22 14:33:16'),
('PCA/RCP/202212/0060', 17, '2022-12-22', '2022-12', 2, '1', 30000, 0, 0, NULL, 30000, '', 0, '', 30000, '1', '', '', '', '', '2', 1, '2022-12-22', '2022-12-22 15:25:54'),
('PCA/RCP/202212/0061', 1, '2022-12-28', '2022-12', 2, '1', 20000, 0, 0, NULL, 20000, '', 0, '', 20000, '2', 'Ari', '34683216', '', '', '2', 1, '2022-12-28', '2022-12-28 13:59:44'),
('PCA/RCP/202212/0062', 2, '2022-12-28', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'Ari', '34683216', '', '', '2', 1, '2022-12-28', '2022-12-28 14:02:11'),
('PCA/RCP/202212/0063', 3, '2022-12-28', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '2', 'Wildhan', '123', '', '', '2', 1, '2022-12-28', '2022-12-28 14:03:43'),
('PCA/RCP/202212/0064', 4, '2022-12-28', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'Ari', '34683216', '', '', '2', 1, '2022-12-28', '2022-12-28 15:00:14'),
('PCA/RCP/202212/0065', 5, '2022-12-28', '2022-12', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '2', 'Ari', '34683216', '', '', '2', 1, '2022-12-28', '2022-12-28 15:00:45'),
('PCA/RCP/202301/0002', 2, '2023-01-06', '2023-01', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'EKA', '321', '', '', '2', 1, '2023-01-06', '2023-01-06 08:49:18'),
('PCA/RCP/202212/0066', 6, '2022-12-28', '2022-12', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '1', 'Ari', '34683216', '', '', '2', 1, '2022-12-28', '2022-12-28 15:13:53'),
('PCA/RCP/202301/0001', 1, '2023-01-06', '2023-01', 3, '1', 25000, 0, 0, NULL, 25000, '', 0, '', 25000, '2', 'WILDHAN', '123', '', '', '2', 1, '2023-01-06', '2023-01-06 08:44:17'),
('PCA/RCP/202301/0003', 3, '2023-01-06', '2023-01', 1, '1', 15000, 0, 0, NULL, 15000, '', 0, '', 15000, '2', 'WILDHAN', '123', '', '', '2', 1, '2023-01-06', '2023-01-06 14:08:40'),
('PCA/RCP/202301/0004', 4, '2023-01-06', '2023-01', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-01-06', '2023-01-06 14:45:18'),
('PCA/RCP/202301/0005', 1, '2023-01-13', '2023-01', 1, '1', 5000, 0, 0, NULL, 5000, '', 0, '', 5000, '1', '', '', '', '', '2', 1, '2023-01-13', '2023-01-13 09:44:22'),
('PCA/RCP/202301/0006', 1, '2023-01-16', '2023-01', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'EKA', '321', '', '', '2', 1, '2023-01-16', '2023-01-16 08:01:08'),
('PCA/RCP/202301/0007', 2, '2023-01-16', '2023-01', 1, '1', 8500, 0, 0, NULL, 8500, '', 0, '', 8500, '1', 'REZA', '081249862', '', '', '2', 1, '2023-01-16', '2023-01-16 11:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `tabpaymentorder`
--

CREATE TABLE IF NOT EXISTS `tabpaymentorder` (
  `id` varchar(30) NOT NULL,
  `orderID` varchar(30) DEFAULT NULL,
  `orderType` varchar(30) DEFAULT NULL,
  `paymentType` varchar(30) DEFAULT NULL,
  `paymentMethod` varchar(30) DEFAULT NULL,
  `paymentAmount` float NOT NULL,
  `paymentDate` date NOT NULL,
  `dpp` float DEFAULT NULL,
  `VAT` float DEFAULT NULL,
  `discountPrice` float DEFAULT NULL,
  `discountPerc` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `promoID` varchar(30) DEFAULT NULL,
  `isVoucher` smallint(6) DEFAULT NULL,
  `voucherID` varchar(50) DEFAULT NULL,
  `remarks` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpaymentorder`
--

INSERT INTO `tabpaymentorder` (`id`, `orderID`, `orderType`, `paymentType`, `paymentMethod`, `paymentAmount`, `paymentDate`, `dpp`, `VAT`, `discountPrice`, `discountPerc`, `total`, `promoID`, `isVoucher`, `voucherID`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('20230131', 'PCA/RCP/202301/0008', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-31', '2023-03-01 09:09:58'),
('20230119', 'PCA/RCP/202301/0004', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-19', '2023-03-01 09:09:58'),
('20230119', 'PCA/RCP/202301/0002', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-19', '2023-03-01 09:09:58'),
('20230119', 'PCA/RCP/202301/0003', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-19', '2023-03-01 09:09:58'),
('20230119', 'PCA/RCP/202301/0001', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-19', '2023-03-01 09:09:58'),
('20230119', 'PCA/RCO/202301/0002', 'PRE-ORDER', 'DOWNPAYMENT', '3', 0, '2023-01-20', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-19', '2023-03-01 09:09:58'),
('20230119', 'PCA/RCO/202301/0002', 'PRE-ORDER', 'FULLPAYMENT', '3', 0, '1970-01-01', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-19', '2023-03-01 09:09:58'),
('20230120', 'PCA/RCO/202301/0003', 'PRE-ORDER', 'FULLPAYMENT', '3', 0, '2023-01-20', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-20', '2023-03-01 09:09:58'),
('20230125', 'PCA/RCP/202301/0005', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-25', '2023-03-01 09:09:58'),
('20230126', 'PCA/RCP/202301/0006', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-26', '2023-03-01 09:09:58'),
('20230127', 'PCA/RCO/202301/0004', 'PRE-ORDER', 'DOWNPAYMENT', '3', 0, '2023-01-27', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-27', '2023-03-01 09:09:58'),
('20230127', 'PCA/RCP/202301/0007', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-27', '2023-03-01 09:09:58'),
('20230131', 'PCA/RCP/202301/0009', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-31', '2023-03-01 09:09:58'),
('20230131', 'PCA/RCP/202301/0010', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-01-31', '2023-03-01 09:09:58'),
('20230201', 'PCA/RCP/202302/0001', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-01', '2023-03-01 09:09:58'),
('20230202', 'PCA/RCP/202302/0002', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-02', '2023-03-01 09:09:58'),
('20230202', 'PCA/RCP/202302/0003', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-02', '2023-03-01 09:09:58'),
('20230202', 'PCA/RCP/202302/0004', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-02', '2023-03-01 09:09:58'),
('20230209', 'PCA/RCP/202302/0005', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-09', '2023-03-01 09:09:58'),
('20230211', 'PCA/END/202302/0006', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-11', '2023-03-01 09:09:58'),
('20230211', 'PCA/END/202302/0007', 'ENDORSEMENT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-11', '2023-03-01 09:09:58'),
('20230213', 'PCA/END/202302/0008', 'ENDORSEMENT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-13', '2023-03-01 09:09:58'),
('20230213', 'PCA/END/202302/0009', 'ENDORSEMENT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-13', '2023-03-01 09:09:58'),
('20230213', 'PCA/END/202302/0010', 'ENDORSEMENT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-13', '2023-03-01 09:09:58'),
('20230214', 'PCA/RCP/202302/0011', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-14', '2023-03-01 09:09:58'),
('20230214', 'PCA/RCP/202302/0012', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-14', '2023-03-01 09:09:58'),
('20230214', 'PCA/RCP/202302/0013', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-14', '2023-03-01 09:09:58'),
('20230215', 'PCA/RCP/202302/0014', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-15', '2023-03-01 09:09:58'),
('20230215', 'PCA/END/202302/0015', 'ENDORSEMENT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-15', '2023-03-01 09:09:58'),
('20230217', 'PCA/RCO/202302/0001', 'PRE-ORDER', 'FULLPAYMENT', '3', 0, '2023-02-17', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-17', '2023-03-01 09:09:58'),
('20230223', 'PCA/RCO/202302/0002', 'PRE-ORDER', 'DOWNPAYMENT', '3', 0, '2023-02-23', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-23', '2023-03-01 09:09:58'),
('20230223', 'PCA/RCP/202302/0016', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-23', '2023-03-01 09:09:58'),
('20230223', 'PCA/RCO/202302/0002', 'PRE-ORDER', 'FULLPAYMENT', '3', 0, '1970-01-01', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-23', '2023-03-01 09:09:58'),
('20230224', 'PCA/RPO/202302/0003', 'PRE-ORDER', 'FULLPAYMENT', '3', 0, '2023-02-24', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-24', '2023-03-01 09:09:58'),
('20230224', 'PCA/RPO/202302/0018', 'PRE-ORDER', 'DOWNPAYMENT', '3', 0, '2023-02-24', 22000, 0, 0, NULL, 22000, '', 0, '', 'DP 12500', 0, '2023-02-24', '2023-03-01 09:09:58'),
('20230228', 'PCA/RCP/202302/0019', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-28', '2023-03-01 09:09:58'),
('20230228', 'PCA/RCP/202302/0020', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '0000-00-00', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-28', '2023-03-01 09:09:58'),
('20230228', 'PCA/RPO/202302/0021', 'PRE-ORDER', 'DOWNPAYMENT', '3', 0, '2023-02-28', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-02-28', '2023-03-01 09:09:58'),
('20230301', 'PCA/RPO/202303/0001', 'PRE-ORDER', 'FULLPAYMENT', '3', 0, '2023-03-01', 22000, 0, 0, NULL, 22000, '', 0, '', 'FP 5000', 0, '2023-03-01', '2023-03-01 09:09:58'),
('20230301', 'PCA/RCP/202303/0002', 'DIRECT-ORDER', 'DIRECT-PAYMENT', '3', 0, '2023-03-01', 22000, 0, 0, NULL, 22000, '', 0, '', '', 0, '2023-03-01', '2023-03-01 09:09:58'),
('20230303', 'PCA/RPO/202303/0003', 'PRE-ORDER', 'FULLPAYMENT', '3', 25000, '2023-03-03', 25000, 0, 0, NULL, 25000, '', 0, '', 'PELUNASAN 25000', 4, '2023-03-03', '2023-03-04 10:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `tabpreorderdetail`
--

CREATE TABLE IF NOT EXISTS `tabpreorderdetail` (
  `id` varchar(30) NOT NULL,
  `preorderID` varchar(30) NOT NULL,
  `productID` varchar(30) DEFAULT NULL,
  `productAmount` int(11) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productSubtotal` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpreorderdetail`
--

INSERT INTO `tabpreorderdetail` (`id`, `preorderID`, `productID`, `productAmount`, `productPrice`, `productSubtotal`, `status`, `dateCreated`, `lastChanged`) VALUES
('', 'PCA/RCO/202301/0002', '3', 2, 8500, 17000, 1, '2023-01-19', '2023-01-19 15:51:10'),
('1', 'PCA/RCO/202301/0003', '1', 5, 5000, 25000, 1, '2023-01-20', '2023-01-20 13:19:28'),
('1', 'PCA/RCO/202301/0002', '3', 2, 8500, 17000, 0, '2023-01-19', '2023-01-19 15:49:40'),
('1', 'PCA/RCO/202301/0001', '3', 1, 8500, 8500, 1, '2023-01-19', '2023-01-19 14:05:43'),
('1', 'PCA/RCO/202301/0004', '1', 5, 5000, 25000, 0, '2023-01-27', '2023-01-27 10:25:19'),
('1', 'PCA/RCO/202302/0001', '1', 1, 5000, 5000, 1, '2023-02-17', '2023-02-17 15:12:46'),
('2', 'PCA/RCO/202302/0001', '3', 1, 8500, 8500, 1, '2023-02-17', '2023-02-17 15:12:46'),
('1', 'PCA/RCO/202302/0002', '1', 2, 5000, 10000, 0, '2023-02-23', '2023-02-23 08:41:29'),
('2', 'PCA/RCO/202302/0002', '3', 2, 8500, 17000, 0, '2023-02-23', '2023-02-23 08:41:29'),
('', 'PCA/RCO/202302/0002', '3', 2, 8500, 17000, 1, '2023-02-23', '2023-02-23 10:20:32'),
('', 'PCA/RPO/202302/0021', '3', 2, 8500, 17000, 1, '2023-02-28', '2023-02-28 12:03:07');

-- --------------------------------------------------------

--
-- Table structure for table `tabpreorderheader`
--

CREATE TABLE IF NOT EXISTS `tabpreorderheader` (
  `preorderID` varchar(30) NOT NULL DEFAULT '',
  `preorderNo` int(11) DEFAULT NULL,
  `preorderDate` date DEFAULT NULL,
  `preorderPeriode` varchar(10) DEFAULT NULL,
  `preorderAmount` int(11) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `payerName` varchar(50) DEFAULT NULL,
  `payerPhone` varchar(20) DEFAULT NULL,
  `payerEmail` varchar(100) DEFAULT NULL,
  `remarks` text,
  `userID` varchar(10) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`preorderID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpreorderheader`
--

INSERT INTO `tabpreorderheader` (`preorderID`, `preorderNo`, `preorderDate`, `preorderPeriode`, `preorderAmount`, `outletID`, `payerName`, `payerPhone`, `payerEmail`, `remarks`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('PCA/RCO/202301/0001', 1, '2023-01-19', '2023-01', 1, '1', 'DANDI', '0998096797', '', 'Full Payment 8500', '2', 1, '2023-01-19', '2023-01-19 14:05:43'),
('PCA/RCO/202301/0003', 1, '2023-01-20', '2023-01', 5, '1', 'REZA', '081249862', '', '', '2', 1, '2023-01-20', '2023-01-20 13:19:28'),
('PCA/RCO/202301/0002', 2, '2023-01-19', '2023-01', 2, '1', 'WILDHAN', '123', '', '', '2', 1, '2023-01-19', '2023-01-19 15:51:10'),
('PCA/RCO/202301/0004', 1, '2023-01-27', '2023-01', 5, '1', 'WILDHAN', '123', '', '', '2', 0, '2023-01-27', '2023-01-27 10:25:19'),
('PCA/RCO/202302/0001', 1, '2023-02-17', '2023-02', 2, '1', 'FERDI', '02315723785', '', '', '2', 1, '2023-02-17', '2023-02-17 15:12:46'),
('PCA/RCO/202302/0002', 1, '2023-02-23', '2023-02', 4, '1', 'EKA', '321', '', '', '2', 1, '2023-02-23', '2023-02-23 10:20:32');

-- --------------------------------------------------------

--
-- Table structure for table `tabpricedetail`
--

CREATE TABLE IF NOT EXISTS `tabpricedetail` (
  `id` varchar(30) DEFAULT NULL,
  `priceID` varchar(30) DEFAULT NULL,
  `productID` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpricedetail`
--

INSERT INTO `tabpricedetail` (`id`, `priceID`, `productID`, `price`, `status`, `dateCreated`, `lastChanged`) VALUES
('20230130152538', '3', '4', 3500, 1, '2023-01-30', '2023-01-30 15:25:38'),
('20230130152527', '3', '3', 9000, 1, '2023-01-30', '2023-01-30 15:25:27'),
('20230130151509', '3', '1', 8500, 1, '2023-01-30', '2023-01-30 15:15:09'),
('20230130151316', '3', '2', 8000, 1, '2023-01-30', '2023-01-30 15:13:16'),
('20230130152549', '3', '5', 5000, 1, '2023-01-30', '2023-01-30 15:25:49'),
('20230130152608', '2', '2', 10000, 1, '2023-01-30', '2023-01-30 15:26:08'),
('20230130152618', '2', '1', 11000, 1, '2023-01-30', '2023-01-30 15:26:18'),
('20230130152628', '2', '3', 12000, 1, '2023-01-30', '2023-01-30 15:26:28'),
('20230130152640', '2', '4', 5000, 1, '2023-01-30', '2023-01-30 15:26:40'),
('20230130152653', '2', '5', 7500, 1, '2023-01-30', '2023-01-30 15:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `tabpriceheader`
--

CREATE TABLE IF NOT EXISTS `tabpriceheader` (
  `priceID` varchar(30) NOT NULL DEFAULT '',
  `priceName` varchar(100) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `description` text,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`priceID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpriceheader`
--

INSERT INTO `tabpriceheader` (`priceID`, `priceName`, `outletID`, `description`, `status`, `dateCreated`, `lastChanged`) VALUES
('2', 'GOFOOD', '1', 'harga gofood', 1, '2023-01-30', '2023-01-30 15:12:15'),
('1', 'SHOPEEFOOD', '1', 'Harga Shopeefood', 1, '2023-01-30', '2023-01-30 15:12:03'),
('3', 'ONTHESHOP', '1', 'harga ots', 1, '2023-01-30', '2023-01-30 15:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `tabproducthistory`
--

CREATE TABLE IF NOT EXISTS `tabproducthistory` (
  `id` varchar(30) NOT NULL,
  `transType` varchar(5) DEFAULT NULL,
  `productID` varchar(30) NOT NULL,
  `amount` float DEFAULT NULL,
  `itemAmount` float DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `userID` varchar(10) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `remarks` text,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabproducthistory`
--

INSERT INTO `tabproducthistory` (`id`, `transType`, `productID`, `amount`, `itemAmount`, `measurementID`, `userID`, `status`, `remarks`, `dateCreated`, `lastChanged`) VALUES
('20221122091913', 'OUT', '1', 1, 33, '5', '2', 1, 'PCA/RCP/202211/0006', '2022-11-22', '2022-11-22 09:19:13'),
('20221122085611', 'OUT', '1', 1, 34, '5', '2', 1, 'PCA/RCP/202211/0005', '2022-11-22', '2022-11-22 08:56:11'),
('20221122085519', 'OUT', '1', 1, 35, '5', '2', 1, 'PCA/RCP/202211/0003', '2022-11-22', '2022-11-22 08:55:19'),
('20221122082230', 'OUT', '1', 1, 36, '5', '2', 1, 'PCA/RCP/202211/0004', '2022-11-22', '2022-11-22 08:22:30'),
('20221121143429', 'OUT', '1', 1, 37, '5', '2', 1, 'PCA/RCP/202211/0002', '2022-11-21', '2022-11-21 14:34:29'),
('20221121142528', 'OUT', '1', 2, 38, '5', '2', 1, 'PCA/RCP/202211/0001', '2022-11-21', '2022-11-21 14:25:28'),
('20221122093926', 'OUT', '1', 3, 30, '5', '2', 1, 'PCA/RCP/202211/0007', '2022-11-22', '2022-11-22 09:39:26'),
('20221122094130', 'OUT', '1', 1, 29, '5', '2', 1, 'PCA/RCP/202211/0008', '2022-11-22', '2022-11-22 09:41:30'),
('20221122094208', 'OUT', '1', 1, 28, '5', '2', 1, 'PCA/RCP/202211/0009', '2022-11-22', '2022-11-22 09:42:08'),
('20221122094233', 'OUT', '1', 1, 27, '5', '2', 1, 'PCA/RCP/202211/0010', '2022-11-22', '2022-11-22 09:42:33'),
('20221122094600', 'OUT', '1', 1, 26, '5', '2', 1, 'PCA/RCP/202211/0011', '2022-11-22', '2022-11-22 09:46:00'),
('20221122095515', 'OUT', '1', 1, 25, '5', '2', 1, 'PCA/RCP/202211/0012', '2022-11-22', '2022-11-22 09:55:15'),
('20221122095728', 'OUT', '1', 1, 24, '5', '2', 1, 'PCA/RCP/202211/0013', '2022-11-22', '2022-11-22 09:57:28'),
('20221203100248', 'OUT', '2', 1, 9, '5', '2', 1, 'PCA/RCP/202212/0001', '2022-12-03', '2022-12-03 10:02:48'),
('20221203100248', 'OUT', '1', 1, 23, '5', '2', 1, 'PCA/RCP/202212/0001', '2022-12-03', '2022-12-03 10:02:48'),
('20221205101641', 'OUT', '1', 1, 22, '5', '2', 1, 'PCA/RCP/202212/0002', '2022-12-05', '2022-12-05 10:16:41'),
('20221205102005', 'OUT', '1', 1, 21, '5', '2', 1, 'PCA/RCP/202212/0003', '2022-12-05', '2022-12-05 10:20:05'),
('20221205112759', 'OUT', '1', 1, 20, '5', '2', 1, 'PCA/RCP/202212/0004', '2022-12-05', '2022-12-05 11:27:59'),
('20221209162750', 'OUT', '1', 10, 10, '5', '2', 1, 'PCA/RCP/202212/0005', '2022-12-09', '2022-12-09 16:27:50'),
('20221209163051', 'OUT', '2', 5, 4, '5', '2', 1, 'PCA/RCP/202212/0006', '2022-12-09', '2022-12-09 16:30:51'),
('20221213084300', 'OUT', '3', 1, 9, '5', '6', 1, 'PCA/RCP/202212/0007', '2022-12-13', '2022-12-13 08:43:00'),
('20221213085325', 'OUT', '3', 1, 8, '5', '6', 1, 'PCA/RCP/202212/0008', '2022-12-13', '2022-12-13 08:53:25'),
('20221213085403', 'OUT', '3', 1, 7, '5', '6', 1, 'PCA/RCP/202212/0009', '2022-12-13', '2022-12-13 08:54:03'),
('20221213085403', 'OUT', '1', 1, 9, '5', '6', 1, 'PCA/RCP/202212/0009', '2022-12-13', '2022-12-13 08:54:03'),
('20221213085451', 'OUT', '3', 1, 6, '5', '6', 1, 'PCA/RCP/202212/0010', '2022-12-13', '2022-12-13 08:54:51'),
('20221219095404', 'OUT', '1', 1, 8, '5', '2', 1, 'PCA/RCP/202212/0011', '2022-12-19', '2022-12-19 09:54:04'),
('20221219095520', 'OUT', '1', 1, 7, '5', '2', 1, 'PCA/RCP/202212/0012', '2022-12-19', '2022-12-19 09:55:20'),
('20221219095520', 'OUT', '3', 1, 5, '5', '2', 1, 'PCA/RCP/202212/0012', '2022-12-19', '2022-12-19 09:55:20'),
('20221219102037', 'OUT', '1', 1, 6, '5', '2', 1, 'PCA/RCP/202212/0013', '2022-12-19', '2022-12-19 10:20:37'),
('20221219110052', 'OUT', '1', 1, 5, '5', '2', 1, 'PCA/RCP/202212/0014', '2022-12-19', '2022-12-19 11:00:52'),
('20221219110130', 'OUT', '2', 1, 3, '5', '2', 1, 'PCA/RCP/202212/0015', '2022-12-19', '2022-12-19 11:01:30'),
('20221219110130', 'OUT', '1', 1, 4, '5', '2', 1, 'PCA/RCP/202212/0015', '2022-12-19', '2022-12-19 11:01:30'),
('20221219153527', 'OUT', '3', 1, 4, '5', '2', 1, 'PCA/RCP/202212/0017', '2022-12-19', '2022-12-19 15:35:27'),
('20221219153639', 'OUT', '1', 1, 3, '5', '2', 1, 'PCA/RCP/202212/0018', '2022-12-19', '2022-12-19 15:36:39'),
('20221219153716', 'OUT', '3', 1, 3, '5', '2', 1, 'PCA/RCP/202212/0019', '2022-12-19', '2022-12-19 15:37:16'),
('20221219153747', 'OUT', '1', 1, 2, '5', '2', 1, 'PCA/RCP/202212/0020', '2022-12-19', '2022-12-19 15:37:47'),
('20221219154016', 'OUT', '2', 1, 2, '5', '2', 1, 'PCA/RCP/202212/0022', '2022-12-19', '2022-12-19 15:40:16'),
('20221219154848', 'OUT', '3', 1, 2, '5', '2', 1, 'PCA/RCP/202212/0023', '2022-12-19', '2022-12-19 15:48:48'),
('20221220090154', 'OUT', '1', 1, 1, '5', '2', 1, 'PCA/RCP/202212/0024', '2022-12-20', '2022-12-20 09:01:54'),
('20221220091105', 'OUT', '2', 1, 1, '5', '2', 1, 'PCA/RCP/202212/0025', '2022-12-20', '2022-12-20 09:11:05'),
('20221220093440', 'OUT', '3', 1, 1, '5', '2', 1, 'PCA/RCP/202212/0026', '2022-12-20', '2022-12-20 09:34:40'),
('20221220162253', 'OUT', '3', 6, 5, '5', '2', 1, 'PCA/RCP/202212/0027', '2022-12-20', '2022-12-20 16:22:53'),
('20221220162952', 'OUT', '1', 1, 10, '5', '2', 1, 'PCA/RCP/202212/0028', '2022-12-20', '2022-12-20 16:29:52'),
('20221220163051', 'OUT', '2', 1, 10, '5', '2', 1, 'PCA/RCP/202212/0029', '2022-12-20', '2022-12-20 16:30:51'),
('20221221085951', 'OUT', '2', 4, 6, '5', '2', 1, 'PCA/RCP/202212/0030', '2022-12-21', '2022-12-21 08:59:51'),
('20221221090253', 'OUT', '2', 4, 2, '5', '2', 1, 'PCA/RCP/202212/0031', '2022-12-21', '2022-12-21 09:02:53'),
('20221221090513', 'OUT', '2', 4, 48, '5', '2', 1, 'PCA/RCP/202212/0032', '2022-12-21', '2022-12-21 09:05:13'),
('20221221090532', 'OUT', '2', 4, 44, '5', '2', 1, 'PCA/RCP/202212/0033', '2022-12-21', '2022-12-21 09:05:32'),
('20221221090602', 'OUT', '2', 2, 42, '5', '2', 1, 'PCA/RCP/202212/0034', '2022-12-21', '2022-12-21 09:06:02'),
('20221221090602', 'OUT', '3', 3, 2, '5', '2', 1, 'PCA/RCP/202212/0034', '2022-12-21', '2022-12-21 09:06:02'),
('20221221090930', 'OUT', '2', 2, 40, '5', '2', 1, 'PCA/RCP/202212/0035', '2022-12-21', '2022-12-21 09:09:30'),
('20221221090930', 'OUT', '1', 4, 6, '5', '2', 1, 'PCA/RCP/202212/0035', '2022-12-21', '2022-12-21 09:09:30'),
('20221221091121', 'OUT', '2', 4, 36, '5', '2', 1, 'PCA/RCP/202212/0036', '2022-12-21', '2022-12-21 09:11:21'),
('20221221091648', 'OUT', '2', 4, 32, '5', '2', 1, 'PCA/RCP/202212/0037', '2022-12-21', '2022-12-21 09:16:48'),
('20221221091733', 'OUT', '2', 4, 28, '5', '2', 1, 'PCA/RCP/202212/0038', '2022-12-21', '2022-12-21 09:17:33'),
('20221221091751', 'OUT', '2', 5, 23, '5', '2', 1, 'PCA/RCP/202212/0039', '2022-12-21', '2022-12-21 09:17:51'),
('20221221091850', 'OUT', '2', 4, 19, '5', '2', 1, 'PCA/RCP/202212/0040', '2022-12-21', '2022-12-21 09:18:50'),
('20221221091951', 'OUT', '2', 4, 15, '5', '2', 1, 'PCA/RCP/202212/0041', '2022-12-21', '2022-12-21 09:19:51'),
('20221221104153', 'OUT', '2', 1, 14, '5', '2', 1, 'PCA/RCP/202212/0042', '2022-12-21', '2022-12-21 10:41:53'),
('20221221104215', 'OUT', '2', 1, 13, '5', '2', 1, 'PCA/RCP/202212/0043', '2022-12-21', '2022-12-21 10:42:15'),
('20221222102451', 'OUT', '2', 1, 12, '5', '2', 1, 'PCA/RCP/202212/0044', '2022-12-22', '2022-12-22 10:24:51'),
('20221222143316', 'OUT', '1', 1, 5, '5', '2', 1, 'PCA/RCP/202212/0059', '2022-12-22', '2022-12-22 14:33:16'),
('20221222152554', 'OUT', '2', 2, 10, '5', '2', 1, 'PCA/RCP/202212/0060', '2022-12-22', '2022-12-22 15:25:54'),
('20221228135944', 'OUT', '4', 1, 9, '5', '2', 1, 'PCA/RCP/202212/0061', '2022-12-28', '2022-12-28 13:59:44'),
('20221228135944', 'OUT', '2', 1, 9, '5', '2', 1, 'PCA/RCP/202212/0061', '2022-12-28', '2022-12-28 13:59:44'),
('20221228140211', 'OUT', '4', 1, 8, '5', '2', 1, 'PCA/RCP/202212/0062', '2022-12-28', '2022-12-28 14:02:11'),
('20221228140343', 'OUT', '1', 1, 4, '5', '2', 1, 'PCA/RCP/202212/0063', '2022-12-28', '2022-12-28 14:03:43'),
('20221228150014', 'OUT', '4', 1, 7, '5', '2', 1, 'PCA/RCP/202212/0064', '2022-12-28', '2022-12-28 15:00:14'),
('20221228150045', 'OUT', '4', 1, 6, '5', '2', 1, 'PCA/RCP/202212/0065', '2022-12-28', '2022-12-28 15:00:45'),
('20221228150111', 'OUT', '2', 1, 8, '5', '2', 1, 'PCA/RCP/202212/0066', '2022-12-28', '2022-12-28 15:01:11'),
('20221228150142', 'OUT', '4', 1, 5, '5', '2', 1, 'PCA/RCP/202212/0067', '2022-12-28', '2022-12-28 15:01:42'),
('20221228150232', 'OUT', '4', 1, 4, '5', '2', 1, 'PCA/RCP/202212/0068', '2022-12-28', '2022-12-28 15:02:32'),
('20221228150943', 'OUT', '2', 1, 7, '5', '2', 1, 'PCA/RCP/202212/0069', '2022-12-28', '2022-12-28 15:09:43'),
('20221228151226', 'OUT', '2', 1, 6, '5', '2', 1, 'PCA/RCP/202212/0066', '2022-12-28', '2022-12-28 15:12:26'),
('20221228151353', 'OUT', '2', 1, 5, '5', '2', 1, 'PCA/RCP/202212/0066', '2022-12-28', '2022-12-28 15:13:53'),
('20230106084417', 'OUT', '4', 1, 3, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-06', '2023-01-06 08:44:17'),
('20230106084417', 'OUT', '1', 1, 3, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-06', '2023-01-06 08:44:17'),
('20230106084417', 'OUT', '2', 1, 4, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-06', '2023-01-06 08:44:17'),
('20230106084918', 'OUT', '2', 1, 3, '5', '2', 1, 'PCA/RCP/202301/0002', '2023-01-06', '2023-01-06 08:49:18'),
('20230106140840', 'OUT', '2', 1, 2, '5', '2', 1, 'PCA/RCP/202301/0003', '2023-01-06', '2023-01-06 14:08:40'),
('20230106144518', 'OUT', '1', 1, 2, '5', '2', 1, 'PCA/RCP/202301/0004', '2023-01-06', '2023-01-06 14:45:18'),
('20230113094422', 'OUT', '4', 1, 2, '5', '2', 1, 'PCA/RCP/202301/0005', '2023-01-13', '2023-01-13 09:44:22'),
('20230116080108', 'OUT', '3', 1, 11, '5', '2', 1, 'PCA/RCP/202301/0006', '2023-01-16', '2023-01-16 08:01:08'),
('20230116110216', 'OUT', '3', 1, 10, '5', '2', 1, 'PCA/RCP/202301/0007', '2023-01-16', '2023-01-16 11:02:16'),
('20230118091648', 'OUT', '3', 1, 9, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-18', '2023-01-18 09:16:48'),
('20230118114520', 'OUT', '3', 1, 8, '5', '2', 1, 'PCA/RCP/202301/0002', '2023-01-18', '2023-01-18 11:45:20'),
('20230118160129', 'OUT', '3', 1, 7, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-18', '2023-01-18 16:01:29'),
('20230118160129', 'OUT', '3', 1, 6, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-18', '2023-01-18 16:01:29'),
('20230118160129', 'OUT', '4', 1, 1, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-18', '2023-01-18 16:01:29'),
('20230118160313', 'OUT', '3', 1, 5, '5', '2', 1, 'PCA/RCP/202301/0002', '2023-01-18', '2023-01-18 16:03:13'),
('20230119090610', 'OUT', '3', 1, 4, '5', '2', 1, 'PCA/RCP/202301/0003', '2023-01-19', '2023-01-19 09:06:10'),
('20230119140416', 'OUT', '3', 1, 3, '5', '2', 1, '', '2023-01-19', '2023-01-19 14:04:16'),
('20230119140543', 'OUT', '3', 1, 2, '5', '2', 1, '', '2023-01-19', '2023-01-19 14:05:43'),
('20230119141301', 'OUT', '3', 1, 1, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-19', '2023-01-19 14:13:01'),
('20230119141440', 'OUT', '2', 1, 1, '5', '2', 1, 'PCA/RCP/202301/0002', '2023-01-19', '2023-01-19 14:14:40'),
('20230119141440', 'OUT', '1', 1, 1, '5', '2', 1, 'PCA/RCP/202301/0002', '2023-01-19', '2023-01-19 14:14:40'),
('20230119142054', 'OUT', '4', 1, 0, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-19', '2023-01-19 14:20:54'),
('20230119142134', 'OUT', '3', 1, 0, '5', '2', 1, 'PCA/RCP/202301/0002', '2023-01-19', '2023-01-19 14:21:34'),
('20230119142539', 'OUT', '2', 1, 0, '5', '2', 1, 'PCA/RCP/202301/0003', '2023-01-19', '2023-01-19 14:25:39'),
('20230119142831', 'OUT', '3', 10, 40, '5', '2', 1, 'PCA/RCP/202301/0001', '2023-01-19', '2023-01-19 14:28:31'),
('20230119142855', 'OUT', '1', 2, 49, '5', '2', 1, 'PCA/RCP/202301/0002', '2023-01-19', '2023-01-19 14:28:55'),
('20230119142937', 'OUT', '1', 3, 46, '5', '2', 1, 'PCA/RCP/202301/0003', '2023-01-19', '2023-01-19 14:29:37'),
('20230119142937', 'OUT', '3', 3, 37, '5', '2', 1, 'PCA/RCP/202301/0003', '2023-01-19', '2023-01-19 14:29:37'),
('20230119143016', 'OUT', '3', 2, 35, '5', '2', 1, 'PCA/RCP/202301/0004', '2023-01-19', '2023-01-19 14:30:16'),
('20230119152034', 'OUT', '3', 4, 31, '5', '2', 1, '', '2023-01-19', '2023-01-19 15:20:34'),
('20230119152317', 'OUT', '3', 4, 27, '5', '2', 1, '', '2023-01-19', '2023-01-19 15:23:17'),
('20230119155110', 'OUT', '3', 2, 25, '5', '2', 1, '', '2023-01-19', '2023-01-19 15:51:10'),
('20230120081512', 'OUT', '3', 1, 24, '5', '2', 1, '', '2023-01-20', '2023-01-20 08:15:12'),
('20230120110439', 'OUT', '3', 1, 23, '5', '2', 1, '', '2023-01-20', '2023-01-20 11:04:39'),
('20230120131928', 'OUT', '1', 5, 41, '5', '2', 1, '', '2023-01-20', '2023-01-20 13:19:28'),
('20230125084254', 'OUT', '5', 1, 9, '5', '2', 1, 'PCA/RCP/202301/0005', '2023-01-25', '2023-01-25 08:42:54'),
('20230131091957', 'OUT', '1', 1, 40, '5', '2', 1, 'PCA/RCP/202301/0008', '2023-01-31', '2023-01-31 09:19:57'),
('20230131094521', 'OUT', '3', 1, 22, '5', '2', 1, 'PCA/RCP/202301/0009', '2023-01-31', '2023-01-31 09:45:21'),
('20230131100328', 'OUT', '1', 1, 39, '5', '2', 1, 'PCA/RCP/202301/0010', '2023-01-31', '2023-01-31 10:03:28'),
('20230201154738', 'OUT', '1', 1, 38, '5', '2', 1, 'PCA/RCP/202302/0001', '2023-02-01', '2023-02-01 15:47:38'),
('20230202091456', 'OUT', '1', 1, 37, '5', '2', 1, 'PCA/RCP/202302/0002', '2023-02-02', '2023-02-02 09:14:56'),
('20230202091512', 'OUT', '3', 1, 21, '5', '2', 1, 'PCA/RCP/202302/0003', '2023-02-02', '2023-02-02 09:15:12'),
('20230202091538', 'OUT', '5', 1, 8, '5', '2', 1, 'PCA/RCP/202302/0004', '2023-02-02', '2023-02-02 09:15:38'),
('20230209171124', 'OUT', '3', 1, 20, '5', '2', 1, 'PCA/RCP/202302/0005', '2023-02-09', '2023-02-09 17:11:24'),
('20230211090919', 'OUT', '1', 1, 36, '5', '2', 1, 'PCA/END/202302/0006', '2023-02-11', '2023-02-11 09:09:19'),
('20230211095826', 'OUT', '1', 1, 35, '5', '2', 1, 'PCA/END/202302/0007', '2023-02-11', '2023-02-11 09:58:26'),
('20230213090708', 'OUT', '1', 1, 34, '5', '2', 1, 'PCA/END/202302/0008', '2023-02-13', '2023-02-13 09:07:08'),
('20230213094152', 'OUT', '1', 1, 33, '5', '2', 1, 'PCA/END/202302/0010', '2023-02-13', '2023-02-13 09:41:52'),
('20230214115805', 'OUT', '5', 1, 7, '5', '2', 1, 'PCA/RCP/202302/0011', '2023-02-14', '2023-02-14 11:58:05'),
('20230214140348', 'OUT', '3', 1, 19, '5', '2', 1, 'PCA/RCP/202302/0012', '2023-02-14', '2023-02-14 14:03:48'),
('20230214140753', 'OUT', '3', 2, 17, '5', '2', 1, 'PCA/RCP/202302/0013', '2023-02-14', '2023-02-14 14:07:53'),
('20230214140753', 'OUT', '1', 3, 30, '5', '2', 1, 'PCA/RCP/202302/0013', '2023-02-14', '2023-02-14 14:07:53'),
('20230215153406', 'OUT', '1', 1, 29, '5', '2', 1, 'PCA/RCP/202302/0014', '2023-02-15', '2023-02-15 15:34:06'),
('20230215153427', 'OUT', '3', 2, 15, '5', '2', 1, 'PCA/END/202302/0015', '2023-02-15', '2023-02-15 15:34:27'),
('20230217151246', 'OUT', '1', 1, 28, '5', '2', 1, '', '2023-02-17', '2023-02-17 15:12:46'),
('20230217151246', 'OUT', '3', 1, 14, '5', '2', 1, '', '2023-02-17', '2023-02-17 15:12:46'),
('20230223100301', 'OUT', '1', 1, 27, '5', '2', 1, 'PCA/RCP/202302/0016', '2023-02-23', '2023-02-23 10:03:01'),
('20230223100301', 'OUT', '5', 1, 6, '5', '2', 1, 'PCA/RCP/202302/0016', '2023-02-23', '2023-02-23 10:03:01'),
('20230223102032', 'OUT', '1', 2, 25, '5', '2', 1, '', '2023-02-23', '2023-02-23 10:20:32'),
('20230223102032', 'OUT', '3', 2, 12, '5', '2', 1, '', '2023-02-23', '2023-02-23 10:20:32'),
('20230224093137', 'OUT', '3', 5, 7, '5', '2', 1, '', '2023-02-24', '2023-02-24 09:31:37'),
('20230228094721', 'OUT', '1', 1, 24, '5', '2', 1, 'PCA/RCP/202302/0019', '2023-02-28', '2023-02-28 09:47:21'),
('20230228094741', 'OUT', '1', 1, 23, '5', '2', 1, 'PCA/RCP/202302/0020', '2023-02-28', '2023-02-28 09:47:41'),
('20230228120307', 'OUT', '1', 2, 21, '5', '2', 1, '', '2023-02-28', '2023-02-28 12:03:07'),
('20230228120307', 'OUT', '3', 2, 5, '5', '2', 1, '', '2023-02-28', '2023-02-28 12:03:07'),
('20230301075421', 'OUT', '1', 1, 20, '5', '2', 1, '', '2023-03-01', '2023-03-01 07:54:21'),
('20230303090756', 'OUT', '1', 2, 18, '5', '2', 1, '', '2023-03-03', '2023-03-03 09:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `tabproductstocktemp`
--

CREATE TABLE IF NOT EXISTS `tabproductstocktemp` (
  `productID` varchar(30) NOT NULL,
  `newStock` float NOT NULL,
  `outletID` varchar(3) NOT NULL,
  `dateCreated` date NOT NULL,
  `lastChanged` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabproductstocktemp`
--

INSERT INTO `tabproductstocktemp` (`productID`, `newStock`, `outletID`, `dateCreated`, `lastChanged`) VALUES
('1', 15, '1', '2023-03-10', '2023-03-10 09:01:33'),
('2', 2, '1', '2023-03-17', '2023-03-17 14:28:12'),
('3', 7, '1', '2023-03-10', '2023-03-10 13:51:05');

-- --------------------------------------------------------

--
-- Table structure for table `tabrequestdetail`
--

CREATE TABLE IF NOT EXISTS `tabrequestdetail` (
  `detailID` varchar(30) NOT NULL,
  `requestID` varchar(30) NOT NULL,
  `ingredientID` varchar(30) NOT NULL,
  `amount` float DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabrequestdetail`
--

INSERT INTO `tabrequestdetail` (`detailID`, `requestID`, `ingredientID`, `amount`, `measurementID`, `status`, `dateCreated`, `lastChanged`) VALUES
('20221202075246001', '2', '4', 2, '2', 1, '2022-12-02', '2022-12-02 07:52:46'),
('20221202075246000', '2', '6', 2, '2', 1, '2022-12-02', '2022-12-02 07:52:46'),
('20221121020315002', '1', '2', 10, '2', 2, '2022-11-21', '2022-11-21 14:03:15'),
('20221121020315001', '1', '4', 10, '2', 2, '2022-11-21', '2022-11-21 14:03:15'),
('20221121020315000', '1', '6', 10, '2', 2, '2022-11-21', '2022-11-21 14:03:15'),
('20221202075246002', '2', '2', 2, '2', 1, '2022-12-02', '2022-12-02 07:52:46'),
('20230227030454000', '3', '8', 20, '2', 1, '2023-02-27', '2023-02-27 15:04:54'),
('20230227030454001', '3', '2', 20, '2', 1, '2023-02-27', '2023-02-27 15:04:54'),
('20230227030454002', '3', '4', 20, '2', 1, '2023-02-27', '2023-02-27 15:04:54'),
('20230309024635000', 'PCA/REQ/202303/0004', '6', 10, '2', 2, '2023-03-09', '2023-03-09 14:46:35'),
('20230309024635001', 'PCA/REQ/202303/0004', '4', 10, '2', 2, '2023-03-09', '2023-03-09 14:46:35'),
('20230309024635002', 'PCA/REQ/202303/0004', '2', 10, '2', 2, '2023-03-09', '2023-03-09 14:46:35'),
('20230310111855000', 'PCA/REQ/202303/0005', '1', 10, '1', 2, '2023-03-10', '2023-03-10 11:18:55'),
('20230310111855001', 'PCA/REQ/202303/0005', '7', 10, '2', 2, '2023-03-10', '2023-03-10 11:18:55'),
('20230310111855002', 'PCA/REQ/202303/0005', '3', 10, '2', 2, '2023-03-10', '2023-03-10 11:18:55'),
('20230310111855003', 'PCA/REQ/202303/0005', '2', 10, '2', 2, '2023-03-10', '2023-03-10 11:18:55'),
('20230310111855004', 'PCA/REQ/202303/0005', '4', 10, '2', 2, '2023-03-10', '2023-03-10 11:18:55'),
('20230310015059000', 'PCA/REQ/202303/0006', '1', 5, '1', 2, '2023-03-10', '2023-03-10 13:50:59'),
('20230310015059001', 'PCA/REQ/202303/0006', '7', 5, '2', 2, '2023-03-10', '2023-03-10 13:50:59'),
('20230310015059002', 'PCA/REQ/202303/0006', '3', 5, '2', 2, '2023-03-10', '2023-03-10 13:50:59'),
('20230310015059003', 'PCA/REQ/202303/0006', '2', 5, '2', 2, '2023-03-10', '2023-03-10 13:50:59'),
('20230310015059004', 'PCA/REQ/202303/0006', '4', 5, '2', 2, '2023-03-10', '2023-03-10 13:50:59'),
('20230317022307000', 'PCA/REQ/202303/0007', '6', 5, '2', 2, '2023-03-17', '2023-03-17 14:23:07'),
('20230317022307001', 'PCA/REQ/202303/0007', '4', 5, '2', 2, '2023-03-17', '2023-03-17 14:23:07'),
('20230317022307002', 'PCA/REQ/202303/0007', '2', 5, '2', 2, '2023-03-17', '2023-03-17 14:23:07'),
('20230317022806000', 'PCA/REQ/202303/0008', '8', 4, '2', 2, '2023-03-17', '2023-03-17 14:28:06'),
('20230317022806001', 'PCA/REQ/202303/0008', '2', 4, '2', 2, '2023-03-17', '2023-03-17 14:28:06'),
('20230317022806002', 'PCA/REQ/202303/0008', '4', 4, '2', 2, '2023-03-17', '2023-03-17 14:28:06'),
('20230317022927000', 'PCA/REQ/202303/0009', '8', 2, '2', 2, '2023-03-17', '2023-03-17 14:29:27'),
('20230317022927001', 'PCA/REQ/202303/0009', '2', 2, '2', 2, '2023-03-17', '2023-03-17 14:29:27'),
('20230317022927002', 'PCA/REQ/202303/0009', '4', 2, '2', 2, '2023-03-17', '2023-03-17 14:29:27'),
('20230317023045000', 'PCA/REQ/202303/0010', '8', 20, '2', 2, '2023-03-17', '2023-03-17 14:30:45'),
('20230317023045001', 'PCA/REQ/202303/0010', '2', 20, '2', 2, '2023-03-17', '2023-03-17 14:30:45'),
('20230317023045002', 'PCA/REQ/202303/0010', '4', 20, '2', 2, '2023-03-17', '2023-03-17 14:30:45'),
('20230317023238000', 'PCA/REQ/202303/0011', '8', 20, '2', 2, '2023-03-17', '2023-03-17 14:32:38'),
('20230317023238001', 'PCA/REQ/202303/0011', '2', 20, '2', 2, '2023-03-17', '2023-03-17 14:32:38'),
('20230317023238002', 'PCA/REQ/202303/0011', '4', 20, '2', 2, '2023-03-17', '2023-03-17 14:32:38'),
('20230317024554000', 'PCA/REQ/202303/0012', '6', 10, '2', 2, '2023-03-17', '2023-03-17 14:45:54'),
('20230317024554001', 'PCA/REQ/202303/0012', '4', 10, '2', 2, '2023-03-17', '2023-03-17 14:45:54'),
('20230317024554002', 'PCA/REQ/202303/0012', '2', 10, '2', 2, '2023-03-17', '2023-03-17 14:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `tabrequestheader`
--

CREATE TABLE IF NOT EXISTS `tabrequestheader` (
  `requestID` varchar(30) NOT NULL,
  `requestDate` date DEFAULT NULL,
  `categoryID` varchar(30) DEFAULT NULL,
  `outletID` varchar(3) DEFAULT NULL,
  `productID` varchar(30) NOT NULL,
  `amount` float DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `userID` varchar(10) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `remarks` text,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  `isPending` smallint(6) DEFAULT NULL,
  `approvedBy` varchar(10) DEFAULT NULL,
  `approvedDate` date DEFAULT NULL,
  `approvedReason` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabrequestheader`
--

INSERT INTO `tabrequestheader` (`requestID`, `requestDate`, `categoryID`, `outletID`, `productID`, `amount`, `measurementID`, `userID`, `status`, `remarks`, `dateCreated`, `lastChanged`, `isPending`, `approvedBy`, `approvedDate`, `approvedReason`) VALUES
('3', '2023-02-27', '3', '1', '2', 10, '5', '2', 1, '', '2023-02-27', '2023-02-27 15:04:34', NULL, NULL, NULL, NULL),
('2', '2022-12-02', '3', '1', '1', 2, '5', '2', 1, '', '2022-12-02', '2022-12-02 07:50:00', NULL, NULL, NULL, NULL),
('1', '2022-11-21', '3', '1', '1', 10, '5', '2', 2, '10 picis', '2022-11-21', '2022-11-21 14:02:54', 0, '2', '2022-11-21', 'Mantab, gassss'),
('PCA/REQ/202303/0004', '2023-03-09', '3', '1', '1', 10, '5', '2', 2, '10 pcs', '2023-03-09', '2023-03-09 14:46:30', 0, '2', '2023-03-10', ''),
('PCA/REQ/202303/0005', '2023-03-10', '4', '1', '3', 10, '5', '2', 2, '10 picis', '2023-03-10', '2023-03-10 11:18:50', 0, '2', '2023-03-10', ''),
('PCA/REQ/202303/0006', '2023-03-10', '4', '1', '3', 5, '5', '2', 2, '', '2023-03-10', '2023-03-10 13:50:53', 0, '2', '2023-03-10', ''),
('PCA/REQ/202303/0007', '2023-03-17', '3', '1', '1', 5, '5', '2', 2, '', '2023-03-17', '2023-03-17 14:23:05', 0, '2', '2023-03-17', ''),
('PCA/REQ/202303/0008', '2023-03-17', '3', '1', '2', 2, '5', '2', 2, '', '2023-03-17', '2023-03-17 14:28:04', 0, '2', '2023-03-17', ''),
('PCA/REQ/202303/0009', '2023-03-17', '3', '1', '2', 1, '5', '2', 2, '', '2023-03-17', '2023-03-17 14:29:25', 0, '2', '2023-03-17', ''),
('PCA/REQ/202303/0010', '2023-03-17', '3', '1', '2', 10, '5', '2', 2, '', '2023-03-17', '2023-03-17 14:30:43', 0, '2', '2023-03-17', ''),
('PCA/REQ/202303/0011', '2023-03-17', '3', '1', '2', 10, '5', '2', 2, '', '2023-03-17', '2023-03-17 14:32:36', 0, '2', '2023-03-17', ''),
('PCA/REQ/202303/0012', '2023-03-17', '3', '1', '1', 10, '5', '2', 2, '', '2023-03-17', '2023-03-17 14:45:50', 0, '2', '2023-03-17', '');

-- --------------------------------------------------------

--
-- Table structure for table `tabstocktransaction`
--

CREATE TABLE IF NOT EXISTS `tabstocktransaction` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `stockID` varchar(30) DEFAULT NULL,
  `categoryStockID` varchar(30) DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `userID` varchar(30) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `stockAmount` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `photoName` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `remarks` text,
  `status` varchar(100) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `pic` varchar(100) NOT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabstocktransaction`
--

INSERT INTO `tabstocktransaction` (`id`, `stockID`, `categoryStockID`, `measurementID`, `userID`, `amount`, `stockAmount`, `price`, `photoName`, `type`, `remarks`, `status`, `outletID`, `pic`, `dateCreated`, `lastChanged`) VALUES
('1', '1', '1', '5', '2', 2, 12, 0, NULL, 'IN', '', 'SUCCESS', '1', 'Eka', '2022-12-08', '2022-12-08 13:10:04'),
('2', '1', '1', '5', '2', 2, 10, 0, NULL, 'OUT', '', 'SUCCESS', '1', 'eka', '2022-12-08', '2022-12-08 13:10:27'),
('3', '1', '1', '5', '2', 1, 11, 5000, '6.-tampilan-dari-cetak-struk.jpg', 'IN', '', 'SUCCESS', '1', 'Fahmi', '2022-12-27', '2022-12-27 14:36:10'),
('4', '1', '1', '5', '2', 1, 12, NULL, NULL, 'OUT', '', 'SUCCESS', '1', 'fahmi', '2023-01-17', '2023-01-17 08:50:21'),
('5', '1', '1', '5', '2', 3, 9, NULL, NULL, 'OUT', '', 'SUCCESS', '1', 'Eka', '2023-01-17', '2023-01-17 08:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `tabusermenu`
--

CREATE TABLE IF NOT EXISTS `tabusermenu` (
  `menuID` varchar(10) DEFAULT NULL,
  `userID` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabusermenu`
--

INSERT INTO `tabusermenu` (`menuID`, `userID`) VALUES
('F002', '2'),
('A002', '2'),
('A001', '2'),
('F004', '5'),
('F001', '2'),
('E002', '2'),
('E001', '2'),
('D003', '2'),
('D002', '2'),
('D001', '2'),
('C006', '2'),
('C005', '2'),
('C004', '2'),
('C003', '2'),
('C002', '2'),
('C001', '2'),
('B003', '2'),
('B002', '2'),
('B001', '2'),
('A003', '2'),
('F003', '2'),
('F004', '2'),
('D003', '13'),
('D002', '13'),
('D001', '13'),
('F003', '5'),
('F002', '5'),
('A001', '6'),
('A002', '6'),
('F001', '5'),
('E003', '5'),
('D002', '5'),
('D003', '5'),
('E001', '5'),
('E002', '5'),
('D001', '5'),
('C006', '5'),
('C005', '5'),
('C004', '5'),
('C003', '5'),
('C002', '5'),
('C001', '5'),
('B004', '5'),
('B003', '5'),
('B002', '5'),
('B001', '5'),
('A003', '5'),
('A002', '5'),
('D001', '4'),
('D002', '4'),
('D003', '4'),
('E003', '2'),
('B004', '2'),
('A001', '5');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
