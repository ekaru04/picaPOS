-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2022 at 11:47 AM
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
('6', 'PAKET A', 'PA', '', 1, '2022-12-14', '2022-12-14 09:40:13');

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
('1', 'Wildhan', '123', '', 1, '2022-12-21', '2022-12-21 09:05:13');

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
('3', 'WAREHOUSE', 1, '2022-10-21', '2022-12-07 11:05:02');

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
('1', 'COKLAT BATANG', 10, 0, '1', '1', 'Tambah baru', 1, '2022-10-24', '2022-10-24 12:15:37'),
('5', 'PISANG', 36, 0, '1', '2', '', 1, '2022-10-24', '2022-10-24 16:31:15'),
('4', 'TELUR', 20, 0, '1', '2', 'TELURR', 1, '2022-10-24', '2022-10-24 16:31:15'),
('2', 'TEPUNG TERIGU', 6, 0, '1', '2', 'tepung', 1, '2022-10-24', '2022-10-24 16:31:15'),
('3', 'GULA PASIR', 50, 0, '1', '2', 'Gula Pasir', 1, '2022-10-24', '2022-10-24 12:16:23'),
('6', 'ABON SAPI', 20, 10, '1', '2', 'Tambah Ingredient Abon', 1, '2022-11-21', '2022-11-21 14:06:37'),
('7', 'COKLAT BUBUK', 20, 10, '2', '2', 'KBR', 1, '2022-11-24', '2022-11-24 09:02:32'),
('8', 'KEJU', 10, 5, '1', '2', '', 1, '2022-12-02', '2022-12-02 07:59:34');

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
('LYL-221221-1', 5000, 10, 1, '2022-12-21', '2022-12-21 14:58:48');

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
('2', 'PICAROLL KEBRAON', 'SURABAYA', '---', '---', 1, '2022-11-21', '2022-11-21 09:25:25');

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
('2', 'TRANSFER MANDIRI', 'MANDIRI', 'MANDIRI\r\n', 1, '2022-10-21', '2022-10-24 15:56:40');

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
('4', 'TESTINGS', 1, '2022-11-21', '2022-11-21 10:55:28');

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
('2', 'ROTI KEJU', '3', '2', 10, 5, '1', '5', 15000, 'roti-keju1.jpg', '', 1, '2022-12-02', '2022-12-21 09:04:57'),
('1', 'ROTI ABON SAPI', '3', '1', 5, 10, '1', '5', 5000, 'roti-abon-selembut-breadtalk.jpg', '', 1, '2022-11-21', '2022-12-20 09:47:31'),
('3', 'CHOCO MELTING', '4', '3', 2, 5, '1', '5', 8500, 'chocolatebread36a.jpg', '', 1, '2022-12-13', '2022-12-20 09:47:46');

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
('PRM-20221121-4', 'HRPROMO', 'DISCOUNT', 1000, '1', 1, 5, 0, 1, 1, 1, 1, 1, 0, '2022-11-21', '2022-11-30', 'Tes Diskon', 1, '2022-11-21', '2022-11-22 09:34:30');

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
('4', 'TES', '5', '', 1, '2022-12-14', '2022-12-14 13:02:22');

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
('20221213082607', '3', '4', 1, 1, '2022-12-13', '2022-12-13 08:26:07'),
('20221214130227', '4', '6', 1, 1, '2022-12-14', '2022-12-14 13:02:27');

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
('1', 'SABUN', '1', '5', 10, 1, '1', '', 1, '2022-12-07', '2022-12-08 13:10:27');

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
('13', '4', 'test123', 'daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5', 'ekaru', '1', '1', '1', 1, '2022-10-21', '2022-11-21 14:38:14'),
('4', '7', 'wee', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'weeeee', '2', '1', '1', 1, '2022-11-21', '2022-11-24 09:18:42'),
('6', '8', 'tes05', 'daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5', 'Akun Testing', '1', '1', '1', 1, '2022-11-23', '2022-12-13 08:29:23');

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
('4637B-18D30-5E63', 'HRVOU', 'YA VOUCHER', 2000, 6000, '2022-11-24', 'Tes Voucher', 0, '2022-11-21', '2022-11-21 13:22:21');

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
('20221122094048', 'ORDER_6_PCA/RCP/202211/0008_DRAFT', 'ORDER_DRAFT', '2', '2022-11-22', '2022-11-22 09:40:48', 'SUCCESS'),
('20221122093926', 'ORDER_5_PCA/RCP/202211/0007_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:39:26', 'SUCCESS'),
('20221122093430', 'UPDATE_PROMO_HRPROMO', 'MASTER_PROMO', '2', '2022-11-22', '2022-11-22 09:34:30', 'SUCCESS'),
('20221122091913', 'ORDER_4_PCA/RCP/202211/0006_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:19:13', 'SUCCESS'),
('20221122085611', 'ORDER_3_PCA/RCP/202211/0005_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 08:56:11', 'SUCCESS'),
('20221122085519', 'ORDER_1_PCA/RCP/202211/0003_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 08:55:19', 'SUCCESS'),
('20221122082230', 'ORDER_2_PCA/RCP/202211/0004_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 08:22:30', 'SUCCESS'),
('20221122081926', 'UPDATE_PROMO_HRPROMO', 'MASTER_PROMO', '2', '2022-11-22', '2022-11-22 08:19:26', 'SUCCESS'),
('20221122080523', 'ORDER_1_PCA/RCP/202211/0003_DRAFT', 'ORDER_DRAFT', '2', '2022-11-22', '2022-11-22 08:05:23', 'SUCCESS'),
('20221122075422', 'INSERT_RESTOCK_2', 'TRANSACTION_RESTOCK', '2', '2022-11-22', '2022-11-22 07:54:22', 'SUCCESS'),
('20221121143814', 'UPDATE_USER_test123', 'MASTER_USER', '2', '2022-11-21', '2022-11-21 14:38:14', 'SUCCESS'),
('20221121143429', 'ORDER_2_PCA/RCP/202211/0002_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-21', '2022-11-21 14:34:29', 'SUCCESS'),
('20221121143416', 'ORDER_2_PCA/RCP/202211/0002_DRAFT', 'ORDER_DRAFT', '2', '2022-11-21', '2022-11-21 14:34:16', 'SUCCESS'),
('20221121142528', 'ORDER_1_PCA/RCP/202211/0001_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-21', '2022-11-21 14:25:28', 'SUCCESS'),
('20221121142242', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'RESTOCK_PRODUCT', '2', '2022-11-21', '2022-11-21 14:22:42', 'SUCCESS'),
('20221121141010', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'RESTOCK_PRODUCT', '2', '2022-11-21', '2022-11-21 14:10:10', 'SUCCESS'),
('20221121140846', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'RESTOCK_PRODUCT', '2', '2022-11-21', '2022-11-21 14:08:46', 'SUCCESS'),
('20221121140637', 'UPDATE_REQ_DETAIL_1', 'STATUS_REQUEST', '2', '2022-11-21', '2022-11-21 14:06:37', 'SUCCESS'),
('20221121140637', 'UPDATE_REQ_HEADER_1', 'APPROVAL_REQUEST', '2', '2022-11-21', '2022-11-21 14:06:37', 'SUCCESS'),
('20221121140637', 'INSERT_HISTORY_FROM_REQUEST1', 'HISTORY', '2', '2022-11-21', '2022-11-21 14:06:37', 'SUCCESS'),
('20221121140637', 'UPDATE_SALDO_FROM_REQUEST1', 'AMOUNT_USED_AND_SALDO', '2', '2022-11-21', '2022-11-21 14:06:37', 'SUCCESS'),
('20221121140637', 'UPDATE_STOCK_INGREDIENT_6_FROM_REQUEST1', 'AMOUNT_STOCK', '2', '2022-11-21', '2022-11-21 14:06:37', 'SUCCESS'),
('20221121140637', 'LOW_STOCK_FAILED_TO_UPDATE', 'AMOUNT_STOCK', '2', '2022-11-21', '2022-11-21 14:06:37', 'FAILED'),
('20221121140637', 'LOW_STOCK_FAILED_TO_UPDATE', 'AMOUNT_STOCK', '2', '2022-11-21', '2022-11-21 14:06:37', 'FAILED'),
('20221121140637', 'UPDATE_STOCK_PRODUCT_1_FROM_REQUEST1', 'TRANSACTION_RESTOCK', '2', '2022-11-21', '2022-11-21 14:06:37', 'SUCCESS'),
('20221121140315', 'INSERT_REQUESTING_1INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2022-11-21', '2022-11-21 14:03:15', 'SUCCESS'),
('20221121140315', 'INSERT_REQUESTING_1INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2022-11-21', '2022-11-21 14:03:15', 'SUCCESS'),
('20221121140315', 'INSERT_REQUESTING_1INGREDIENT(6)', 'REQUEST_DETAIL_INGREDIENT', '', '2022-11-21', '2022-11-21 14:03:15', 'SUCCESS'),
('20221121140254', 'INSERT_REQUESTING_1', 'REQUEST_INGREDIENT', '2', '2022-11-21', '2022-11-21 14:02:54', 'SUCCESS'),
('20221121133234', 'INSERT_RESTOCK_1', 'TRANSACTION_RESTOCK', '2', '2022-11-21', '2022-11-21 13:32:34', 'SUCCESS'),
('20221121132221', 'UPDATE_VOUCHER_HRVOU', 'MASTER_POSITION', '2', '2022-11-21', '2022-11-21 13:22:21', 'SUCCESS'),
('20221121132107', 'INSERT_VOUCHER_HRVOU', 'MASTER_VOUCHER', '2', '2022-11-21', '2022-11-21 13:21:07', 'SUCCESS'),
('20221121131700', 'UPDATE_PROMO_HRPROMO', 'MASTER_PROMO', '2', '2022-11-21', '2022-11-21 13:17:00', 'SUCCESS'),
('20221121131637', 'UPDATE_PROMO_HRPROMO', 'MASTER_PROMO', '2', '2022-11-21', '2022-11-21 13:16:37', 'SUCCESS'),
('20221121131618', 'INSERT_PROMO_HRPROMO', 'MASTER_PROMO', '2', '2022-11-21', '2022-11-21 13:16:18', 'SUCCESS'),
('20221121105024', 'DELETE_DEPARTMENT_5', 'MASTER_MEASUREMENT', '2', '2022-11-21', '2022-11-21 10:50:24', 'SUCCESS'),
('20221121105519', 'INSERT_POSITION_TESTING', 'MASTER_POSITION', '2', '2022-11-21', '2022-11-21 10:55:19', 'SUCCESS'),
('20221121105528', 'UPDATE_POSITION_TESTINGS', 'MASTER_POSITION', '2', '2022-11-21', '2022-11-21 10:55:28', 'SUCCESS'),
('20221121105615', 'INSERT_RECIPE_ROTI ABON', 'MASTER_RECIPE', '2', '2022-11-21', '2022-11-21 10:56:15', 'SUCCESS'),
('20221121105634', 'INSERT_RECIPE_INGREDIENT_2(1)', 'DETAIL_RECIPE', '2', '2022-11-21', '2022-11-21 10:56:34', 'SUCCESS'),
('20221121105651', 'INSERT_RECIPE_INGREDIENT_4(1)', 'DETAIL_RECIPE', '2', '2022-11-21', '2022-11-21 10:56:51', 'SUCCESS'),
('20221121105837', 'INSERT_RECIPE_INGREDIENT_4(1)', 'DETAIL_RECIPE', '2', '2022-11-21', '2022-11-21 10:58:37', 'SUCCESS'),
('20221121110744', 'INSERT_RECIPE_INGREDIENT_4(1)', 'DETAIL_RECIPE', '2', '2022-11-21', '2022-11-21 11:07:44', 'SUCCESS'),
('20221121111527', 'INSERT_RECIPE_INGREDIENT_4(1)', 'DETAIL_RECIPE', '2', '2022-11-21', '2022-11-21 11:15:27', 'SUCCESS'),
('20221121103606', 'INSERT_USER_wee', 'MASTER_USER', '2', '2022-11-21', '2022-11-21 10:36:06', 'SUCCESS'),
('20221121103635', 'UPDATE_USER_wee', 'MASTER_USER', '2', '2022-11-21', '2022-11-21 10:36:35', 'SUCCESS'),
('20221121104553', 'UPDATE_USER_wee', 'MASTER_USER', '2', '2022-11-21', '2022-11-21 10:45:53', 'SUCCESS'),
('20221121104614', 'UPDATE_USER_wee', 'MASTER_USER', '2', '2022-11-21', '2022-11-21 10:46:14', 'SUCCESS'),
('20221121105011', 'INSERT_DEPARTMENT_TESTER', 'MASTER_DEPARTMENT', '2', '2022-11-21', '2022-11-21 10:50:11', 'SUCCESS'),
('20221121105019', 'UPDATE_DEPARTMENT_TESTERS', 'MASTER_DEPARTMENT', '2', '2022-11-21', '2022-11-21 10:50:19', 'SUCCESS'),
('20221121114815', 'UPDATE_PRODUCT_ROTI ABON SAPI', 'MASTER_PRODUCT', '2', '2022-11-21', '2022-11-21 11:48:15', 'SUCCESS'),
('20221121114806', 'UPDATE_USER_tes04', 'MASTER_USER', '2', '2022-11-21', '2022-11-21 11:48:06', 'SUCCESS'),
('20221121114722', 'UPDATE_USER_tes04', 'MASTER_USER', '2', '2022-11-21', '2022-11-21 11:47:22', 'SUCCESS'),
('20221121112820', 'UPDATE_PRODUCT_ROTI ABON SAPI', 'MASTER_PRODUCT', '2', '2022-11-21', '2022-11-21 11:28:20', 'SUCCESS'),
('20221121093505', 'DELETE_PAYMENT_3', 'MASTER_PAYMENT', '2', '2022-11-21', '2022-11-21 09:35:05', 'SUCCESS'),
('20221121093757', 'INSERT_SUPPLIER_PT TESTER', 'MASTER_SUPPLIER', '2', '2022-11-21', '2022-11-21 09:37:57', 'SUCCESS'),
('20221121093903', 'UPDATE_SUPPLIER_PT TESTER', 'MASTER_SUPPLIER', '2', '2022-11-21', '2022-11-21 09:39:03', 'SUCCESS'),
('20221121093908', 'DELETE_SUPPLIER', 'MASTER_SUPPLIER', '2', '2022-11-21', '2022-11-21 09:39:08', 'SUCCESS'),
('20221121112638', 'UPDATE_PRODUCT_ROTI ABON SAPI', 'MASTER_PRODUCT', '2', '2022-11-21', '2022-11-21 11:26:38', 'SUCCESS'),
('20221121112505', 'UPDATE_PRODUCT_ROTI ABON SAPI', 'MASTER_PRODUCT', '2', '2022-11-21', '2022-11-21 11:25:05', 'SUCCESS'),
('20221121112428', 'UPDATE_PRODUCT_ROTI ABON SAPI', 'MASTER_PRODUCT', '2', '2022-11-21', '2022-11-21 11:24:28', 'SUCCESS'),
('20221121112356', 'UPDATE_PRODUCT_ROTI ABON SAPI', 'MASTER_PRODUCT', '2', '2022-11-21', '2022-11-21 11:23:56', 'SUCCESS'),
('20221121112251', 'INSERT_PRODUCT_ROTI ABON SAPI', 'MASTER_PRODUCT', '2', '2022-11-21', '2022-11-21 11:22:51', 'SUCCESS'),
('20221121111532', 'INSERT_RECIPE_INGREDIENT_6(1)', 'DETAIL_RECIPE', '2', '2022-11-21', '2022-11-21 11:15:32', 'SUCCESS'),
('20221121093500', 'UPDATE_PAYMENT_CREDIT CARDS', 'MASTER_PAYMENT', '2', '2022-11-21', '2022-11-21 09:35:00', 'SUCCESS'),
('20221121093440', 'INSERT_PAYMENT_CREDIT CARD', 'MASTER_PAYMENT', '2', '2022-11-21', '2022-11-21 09:34:40', 'SUCCESS'),
('20221121093337', 'DELETE_MEASUREMENT', 'MASTER_MEASUREMENT', '2', '2022-11-21', '2022-11-21 09:33:37', 'SUCCESS'),
('20221121093333', 'UPDATE_MEASUREMENT_CELCIUSSSSS', 'MASTER_MEASUREMENT', '2', '2022-11-21', '2022-11-21 09:33:33', 'SUCCESS'),
('20221121093327', 'INSERT_MEASUREMENT_CELCIUS', 'MASTER_MEASUREMENT', '2', '2022-11-21', '2022-11-21 09:33:27', 'SUCCESS'),
('20221121092700', 'DELETE_CATEGORY', 'MASTER_CATEGORY', '2', '2022-11-21', '2022-11-21 09:27:00', 'SUCCESS'),
('20221121092655', 'UPDATE_CATEGORY_BAKAR', 'MASTER_CATEGORY', '2', '2022-11-21', '2022-11-21 09:26:55', 'SUCCESS'),
('20221121092632', 'INSERT_CATEGORY_BAKAR', 'MASTER_CATEGORY', '2', '2022-11-21', '2022-11-21 09:26:32', 'SUCCESS'),
('20221121092525', 'DELETE_OUTLET', 'MASTER_OUTLET', '2', '2022-11-21', '2022-11-21 09:25:25', 'SUCCESS'),
('20221121092442', 'DELETE_OUTLET', 'MASTER_OUTLET', '2', '2022-11-21', '2022-11-21 09:24:42', 'SUCCESS'),
('20221121092437', 'UPDATE_OUTLET_PICAROLL KEBRAON', 'MASTER_OUTLET', '2', '2022-11-21', '2022-11-21 09:24:37', 'SUCCESS'),
('20221121092255', 'INSERT_OUTLET_PICAROLL KEBRAON', 'MASTER_OUTLET', '2', '2022-11-21', '2022-11-21 09:22:55', 'SUCCESS'),
('20221121091313', 'UPDATE_INGREDIENT_ABON SAPI', 'MASTER_INGREDIENT', '2', '2022-11-21', '2022-11-21 09:13:13', 'SUCCESS'),
('20221121091254', 'INSERT_INGREDIENT_ABON SAPI', 'MASTER_INGREDIENT', '2', '2022-11-21', '2022-11-21 09:12:54', 'SUCCESS'),
('20221122094130', 'ORDER_6_PCA/RCP/202211/0008_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:41:30', 'SUCCESS'),
('20221122094151', 'ORDER_7_PCA/RCP/202211/0009_DRAFT', 'ORDER_DRAFT', '2', '2022-11-22', '2022-11-22 09:41:51', 'SUCCESS'),
('20221122094208', 'ORDER_7_PCA/RCP/202211/0009_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:42:08', 'SUCCESS'),
('20221122094233', 'ORDER_8_PCA/RCP/202211/0010_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:42:33', 'SUCCESS'),
('20221122094527', 'ORDER_9_PCA/RCP/202211/0011_DRAFT', 'ORDER_DRAFT', '2', '2022-11-22', '2022-11-22 09:45:27', 'SUCCESS'),
('20221122094600', 'ORDER_9_PCA/RCP/202211/0011_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:46:00', 'SUCCESS'),
('20221122094658', 'ORDER_10_PCA/RCP/202211/0012_DRAFT', 'ORDER_DRAFT', '2', '2022-11-22', '2022-11-22 09:46:58', 'SUCCESS'),
('20221122095515', 'ORDER_10_PCA/RCP/202211/0012_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:55:15', 'SUCCESS'),
('20221122095702', 'ORDER_11_PCA/RCP/202211/0013_DRAFT', 'ORDER_DRAFT', '2', '2022-11-22', '2022-11-22 09:57:02', 'SUCCESS'),
('20221122095728', 'ORDER_11_PCA/RCP/202211/0013_COMPLETE', 'ORDER_COMPLETE', '2', '2022-11-22', '2022-11-22 09:57:28', 'SUCCESS'),
('20221122100005', 'ORDER_15_PCA/RCP/202211/0017_DRAFT', 'ORDER_DRAFT', '2', '2022-11-22', '2022-11-22 10:00:05', 'SUCCESS'),
('20221122132722', 'INSERT_CLOSE_CASHIER_PCA/CLOSE/202211/0002', 'CLOSE_CASHIER', '2', '2022-11-22', '2022-11-22 13:27:22', 'SUCCESS'),
('20221123093217', 'INSERT_USER_wefr', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:32:17', 'SUCCESS'),
('20221123093354', 'INSERT_USER_wefr', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:33:54', 'SUCCESS'),
('20221123093519', 'INSERT_USER_wefr', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:35:19', 'SUCCESS'),
('20221123093627', 'INSERT_USER_wefr', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:36:27', 'SUCCESS'),
('20221123093932', 'INSERT_USER_wefr', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:39:32', 'SUCCESS'),
('20221123093948', 'INSERT_USER_wefr', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:39:48', 'SUCCESS'),
('20221123094032', 'UPDATE_USER_tjretyue', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:40:32', 'SUCCESS'),
('20221123094059', 'UPDATE_USER_etqreq', 'MASTER_USER', '2', '2022-11-23', '2022-11-23 09:40:59', 'SUCCESS'),
('20221124090232', 'INSERT_INGREDIENT_COKLAT BATANG', 'MASTER_INGREDIENT', '2', '2022-11-24', '2022-11-24 09:02:32', 'SUCCESS'),
('20221124091842', 'UPDATE_USER_wee', 'MASTER_USER', '2', '2022-11-24', '2022-11-24 09:18:42', 'SUCCESS'),
('20221202075000', 'INSERT_REQUESTING_2', 'REQUEST_INGREDIENT', '2', '2022-12-02', '2022-12-02 07:50:00', 'SUCCESS'),
('20221202075246', 'INSERT_REQUESTING_2INGREDIENT(6)', 'REQUEST_DETAIL_INGREDIENT', '', '2022-12-02', '2022-12-02 07:52:46', 'SUCCESS'),
('20221202075246', 'INSERT_REQUESTING_2INGREDIENT(4)', 'REQUEST_DETAIL_INGREDIENT', '', '2022-12-02', '2022-12-02 07:52:46', 'SUCCESS'),
('20221202075246', 'INSERT_REQUESTING_2INGREDIENT(2)', 'REQUEST_DETAIL_INGREDIENT', '', '2022-12-02', '2022-12-02 07:52:46', 'SUCCESS'),
('20221202075934', 'INSERT_INGREDIENT_KEJU', 'MASTER_INGREDIENT', '2', '2022-12-02', '2022-12-02 07:59:34', 'SUCCESS'),
('20221202080037', 'INSERT_RECIPE_ROTI KEJU', 'MASTER_RECIPE', '2', '2022-12-02', '2022-12-02 08:00:37', 'SUCCESS'),
('20221202080043', 'INSERT_RECIPE_INGREDIENT_8(2)', 'DETAIL_RECIPE', '2', '2022-12-02', '2022-12-02 08:00:43', 'SUCCESS'),
('20221202080057', 'INSERT_RECIPE_INGREDIENT_2(2)', 'DETAIL_RECIPE', '2', '2022-12-02', '2022-12-02 08:00:57', 'SUCCESS'),
('20221202080102', 'INSERT_RECIPE_INGREDIENT_4(2)', 'DETAIL_RECIPE', '2', '2022-12-02', '2022-12-02 08:01:02', 'SUCCESS'),
('20221202080159', 'INSERT_PRODUCT_ROTI KEJU', 'MASTER_PRODUCT', '2', '2022-12-02', '2022-12-02 08:01:59', 'SUCCESS'),
('20221202081902', 'ORDER_12_PCA/RCP/202211/0014_DELETED', 'ORDER_DELETE', '2', '2022-12-02', '2022-12-02 08:19:02', 'SUCCESS'),
('20221202082915', 'UPDATE_USER_tes04', 'MASTER_USER', '2', '2022-12-02', '2022-12-02 08:29:15', 'SUCCESS'),
('20221202083033', 'UPDATE_USER_tes04', 'MASTER_USER', '2', '2022-12-02', '2022-12-02 08:30:33', 'SUCCESS'),
('20221202153708', 'UPDATE_USER_tes04', 'MASTER_USER', '2', '2022-12-02', '2022-12-02 15:37:08', 'SUCCESS'),
('20221203095630', 'ORDER_12_PCA/RCP/202211/0015_DELETED', 'ORDER_DELETE', '2', '2022-12-03', '2022-12-03 09:56:30', 'SUCCESS'),
('20221203095637', 'ORDER_14_PCA/RCP/202211/0016_DELETED', 'ORDER_DELETE', '2', '2022-12-03', '2022-12-03 09:56:37', 'SUCCESS'),
('20221203095642', 'ORDER_15_PCA/RCP/202211/0017_DELETED', 'ORDER_DELETE', '2', '2022-12-03', '2022-12-03 09:56:42', 'SUCCESS'),
('20221203100248', 'ORDER_1_PCA/RCP/202212/0001_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-03', '2022-12-03 10:02:48', 'SUCCESS'),
('20221205101641', 'ORDER_1_PCA/RCP/202212/0002_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-05', '2022-12-05 10:16:41', 'SUCCESS'),
('20221205102005', 'ORDER_2_PCA/RCP/202212/0003_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-05', '2022-12-05 10:20:05', 'SUCCESS'),
('20221205112759', 'NEW_CUSTOMER_fa', 'ADD_CUST_FROM_POS', '2', '2022-12-05', '2022-12-05 11:27:59', 'SUCCESS'),
('20221205112759', 'ORDER_3_PCA/RCP/202212/0004_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-05', '2022-12-05 11:27:59', 'SUCCESS'),
('20221206104139', 'INSERT_CATEGORY_A', 'MASTER_CATEGORY_STOCK', '2', '2022-12-06', '2022-12-06 10:41:39', 'SUCCESS'),
('20221207110446', 'UPDATE_DEPARTMENT_CASHIER', 'MASTER_DEPARTMENT', '2', '2022-12-07', '2022-12-07 11:04:46', 'SUCCESS'),
('20221207110454', 'UPDATE_DEPARTMENT_KITCHEN', 'MASTER_DEPARTMENT', '2', '2022-12-07', '2022-12-07 11:04:54', 'SUCCESS'),
('20221207110502', 'UPDATE_DEPARTMENT_WAREHOUSE', 'MASTER_DEPARTMENT', '2', '2022-12-07', '2022-12-07 11:05:02', 'SUCCESS'),
('20221207111414', 'INSERT_ITEM_SABUN', 'MASTER_STOCK', '2', '2022-12-07', '2022-12-07 11:14:14', 'SUCCESS'),
('20221207111709', 'INSERT_ITEM_SABUN', 'MASTER_STOCK', '2', '2022-12-07', '2022-12-07 11:17:09', 'SUCCESS'),
('20221208093620', 'INSERT_CATEGORY_B', 'MASTER_CATEGORY_STOCK', '2', '2022-12-08', '2022-12-08 09:36:20', 'SUCCESS'),
('20221208114405', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'IN/OUT_ITEM', '2', '2022-12-08', '2022-12-08 11:44:05', 'SUCCESS'),
('20221208114442', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'IN/OUT_ITEM', '2', '2022-12-08', '2022-12-08 11:44:42', 'SUCCESS'),
('20221208114721', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'IN/OUT_ITEM', '2', '2022-12-08', '2022-12-08 11:47:21', 'SUCCESS'),
('20221208114831', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'IN/OUT_ITEM', '2', '2022-12-08', '2022-12-08 11:48:31', 'SUCCESS'),
('20221208120042', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'IN/OUT_ITEM', '2', '2022-12-08', '2022-12-08 12:00:42', 'SUCCESS'),
('20221208131004', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'IN/OUT_ITEM', '2', '2022-12-08', '2022-12-08 13:10:04', 'SUCCESS'),
('20221208131027', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'IN/OUT_ITEM', '2', '2022-12-08', '2022-12-08 13:10:27', 'SUCCESS'),
('20221209162750', 'NEW_CUSTOMER_', 'ADD_CUST_FROM_POS', '2', '2022-12-09', '2022-12-09 16:27:50', 'SUCCESS'),
('20221209162750', 'ORDER_1_PCA/RCP/202212/0005_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-09', '2022-12-09 16:27:50', 'SUCCESS'),
('20221209163051', 'NEW_CUSTOMER_', 'ADD_CUST_FROM_POS', '2', '2022-12-09', '2022-12-09 16:30:51', 'SUCCESS'),
('20221209163051', 'ORDER_2_PCA/RCP/202212/0006_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-09', '2022-12-09 16:30:51', 'SUCCESS'),
('20221213082326', 'INSERT_RECIPE_ROTI COKLAT', 'MASTER_RECIPE', '2', '2022-12-13', '2022-12-13 08:23:26', 'SUCCESS'),
('20221213082525', 'INSERT_RECIPE_INGREDIENT_1(3)', 'DETAIL_RECIPE', '2', '2022-12-13', '2022-12-13 08:25:25', 'SUCCESS'),
('20221213082532', 'INSERT_RECIPE_INGREDIENT_7(3)', 'DETAIL_RECIPE', '2', '2022-12-13', '2022-12-13 08:25:32', 'SUCCESS'),
('20221213082538', 'INSERT_RECIPE_INGREDIENT_3(3)', 'DETAIL_RECIPE', '2', '2022-12-13', '2022-12-13 08:25:38', 'SUCCESS'),
('20221213082600', 'INSERT_RECIPE_INGREDIENT_2(3)', 'DETAIL_RECIPE', '2', '2022-12-13', '2022-12-13 08:26:00', 'SUCCESS'),
('20221213082607', 'INSERT_RECIPE_INGREDIENT_4(3)', 'DETAIL_RECIPE', '2', '2022-12-13', '2022-12-13 08:26:07', 'SUCCESS'),
('20221213082737', 'INSERT_PRODUCT_CHOCO MELTING', 'MASTER_PRODUCT', '2', '2022-12-13', '2022-12-13 08:27:37', 'SUCCESS'),
('20221213082847', 'UPDATE_USER_tes05', 'MASTER_USER', '2', '2022-12-13', '2022-12-13 08:28:47', 'SUCCESS'),
('20221213082923', 'UPDATE_USER_tes05', 'MASTER_USER', '2', '2022-12-13', '2022-12-13 08:29:23', 'SUCCESS'),
('20221213084300', 'NEW_CUSTOMER_', 'ADD_CUST_FROM_POS', '6', '2022-12-13', '2022-12-13 08:43:00', 'SUCCESS'),
('20221213084300', 'ORDER_1_PCA/RCP/202212/0007_COMPLETE', 'ORDER_COMPLETE', '6', '2022-12-13', '2022-12-13 08:43:00', 'SUCCESS'),
('20221213085325', 'ORDER_2_PCA/RCP/202212/0008_COMPLETE', 'ORDER_COMPLETE', '6', '2022-12-13', '2022-12-13 08:53:25', 'SUCCESS'),
('20221213085403', 'ORDER_3_PCA/RCP/202212/0009_COMPLETE', 'ORDER_COMPLETE', '6', '2022-12-13', '2022-12-13 08:54:03', 'SUCCESS'),
('20221213085451', 'NEW_CUSTOMER_Dani', 'ADD_CUST_FROM_POS', '6', '2022-12-13', '2022-12-13 08:54:51', 'SUCCESS'),
('20221213085451', 'ORDER_4_PCA/RCP/202212/0010_COMPLETE', 'ORDER_COMPLETE', '6', '2022-12-13', '2022-12-13 08:54:51', 'SUCCESS'),
('20221214094013', 'INSERT_CATEGORY_PAKET A', 'MASTER_CATEGORY', '2', '2022-12-14', '2022-12-14 09:40:13', 'SUCCESS'),
('20221214094031', 'INSERT_RECIPE_BUNDLE A', 'MASTER_BUNDLE', '2', '2022-12-14', '2022-12-14 09:40:31', 'SUCCESS'),
('20221214130207', 'INSERT_RECIPE_BUNDLE A', 'MASTER_BUNDLE', '2', '2022-12-14', '2022-12-14 13:02:07', 'SUCCESS'),
('20221214130222', 'INSERT_RECIPE_TES', 'MASTER_RECIPE', '2', '2022-12-14', '2022-12-14 13:02:22', 'SUCCESS'),
('20221214130227', 'INSERT_RECIPE_INGREDIENT_6(4)', 'DETAIL_RECIPE', '2', '2022-12-14', '2022-12-14 13:02:27', 'SUCCESS'),
('20221214132454', 'INSERT_RECIPE_BUNDLE A', 'MASTER_BUNDLE', '2', '2022-12-14', '2022-12-14 13:24:54', 'SUCCESS'),
('20221214132555', 'INSERT_RECIPE_BUNDLE A', 'MASTER_BUNDLE', '2', '2022-12-14', '2022-12-14 13:25:55', 'SUCCESS'),
('20221214132854', 'INSERT_RECIPE_BUNDLE A', 'MASTER_BUNDLE', '2', '2022-12-14', '2022-12-14 13:28:54', 'SUCCESS'),
('20221214133012', 'INSERT_RECIPE_BUNDLE A', 'MASTER_BUNDLE', '2', '2022-12-14', '2022-12-14 13:30:12', 'SUCCESS'),
('20221214133145', 'INSERT_RECIPE_BUNDLE A', 'MASTER_BUNDLE', '2', '2022-12-14', '2022-12-14 13:31:45', 'SUCCESS'),
('20221214134656', 'INSERT_RECIPE_INGREDIENT_3(1)', 'DETAIL_PRODUCT', '2', '2022-12-14', '2022-12-14 13:46:56', 'SUCCESS'),
('20221214135357', 'INSERT_RECIPE_INGREDIENT_2(1)', 'DETAIL_PRODUCT', '2', '2022-12-14', '2022-12-14 13:53:57', 'SUCCESS'),
('20221219095331', 'ORDER_1_PCA/RCP/202212/0011_DRAFT', 'ORDER_DRAFT', '2', '2022-12-19', '2022-12-19 09:53:31', 'SUCCESS'),
('20221219095404', 'ORDER_1_PCA/RCP/202212/0011_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 09:54:04', 'SUCCESS'),
('20221219095520', 'NEW_CUSTOMER_Rendra', 'ADD_CUST_FROM_POS', '2', '2022-12-19', '2022-12-19 09:55:20', 'SUCCESS'),
('20221219095520', 'ORDER_2_PCA/RCP/202212/0012_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 09:55:20', 'SUCCESS'),
('20221219102008', 'ORDER_3_PCA/RCP/202212/0013_DRAFT', 'ORDER_DRAFT', '2', '2022-12-19', '2022-12-19 10:20:07', 'SUCCESS'),
('20221219102037', 'NEW_CUSTOMER_Dandi', 'ADD_CUST_FROM_POS', '2', '2022-12-19', '2022-12-19 10:20:37', 'SUCCESS'),
('20221219102037', 'ORDER_3_PCA/RCP/202212/0013_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 10:20:37', 'SUCCESS'),
('20221219110052', 'NEW_CUSTOMER_A', 'ADD_CUST_FROM_POS', '2', '2022-12-19', '2022-12-19 11:00:52', 'SUCCESS'),
('20221219110052', 'ORDER_4_PCA/RCP/202212/0014_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 11:00:52', 'SUCCESS'),
('20221219110110', 'ORDER_5_PCA/RCP/202212/0015_DRAFT', 'ORDER_DRAFT', '2', '2022-12-19', '2022-12-19 11:01:10', 'SUCCESS'),
('20221219110130', 'NEW_CUSTOMER_B', 'ADD_CUST_FROM_POS', '2', '2022-12-19', '2022-12-19 11:01:30', 'SUCCESS'),
('20221219110130', 'ORDER_5_PCA/RCP/202212/0015_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 11:01:30', 'SUCCESS'),
('20221219112324', 'ORDER_6_PCA/RCP/202212/0016_DRAFT', 'ORDER_DRAFT', '2', '2022-12-19', '2022-12-19 11:23:24', 'SUCCESS'),
('20221219112335', 'ORDER_6_PCA/RCP/202212/0016_DELETED', 'ORDER_DELETE', '2', '2022-12-19', '2022-12-19 11:23:35', 'SUCCESS'),
('20221219153527', 'ORDER_7_PCA/RCP/202212/0017_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 15:35:27', 'SUCCESS'),
('20221219153639', 'ORDER_8_PCA/RCP/202212/0018_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 15:36:39', 'SUCCESS'),
('20221219153716', 'ORDER_9_PCA/RCP/202212/0019_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 15:37:16', 'SUCCESS'),
('20221219153747', 'ORDER_10_PCA/RCP/202212/0020_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 15:37:47', 'SUCCESS'),
('20221219153838', 'ORDER_11_PCA/RCP/202212/0021_DRAFT', 'ORDER_DRAFT', '2', '2022-12-19', '2022-12-19 15:38:38', 'SUCCESS'),
('20221219154016', 'ORDER_12_PCA/RCP/202212/0022_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 15:40:16', 'SUCCESS'),
('20221219154848', 'NEW_CUSTOMER_B', 'ADD_CUST_FROM_POS', '2', '2022-12-19', '2022-12-19 15:48:48', 'SUCCESS'),
('20221219154848', 'ORDER_13_PCA/RCP/202212/0023_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-19', '2022-12-19 15:48:48', 'SUCCESS'),
('20221220090154', 'NEW_CUSTOMER_A', 'ADD_CUST_FROM_POS', '2', '2022-12-20', '2022-12-20 09:01:54', 'SUCCESS'),
('20221220090154', 'ORDER_1_PCA/RCP/202212/0024_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-20', '2022-12-20 09:01:54', 'SUCCESS'),
('20221220091105', 'NEW_CUSTOMER_B', 'ADD_CUST_FROM_POS', '2', '2022-12-20', '2022-12-20 09:11:05', 'SUCCESS'),
('20221220091105', 'ORDER_2_PCA/RCP/202212/0025_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-20', '2022-12-20 09:11:05', 'SUCCESS'),
('20221220093440', 'ORDER_3_PCA/RCP/202212/0026_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-20', '2022-12-20 09:34:40', 'SUCCESS'),
('20221220094731', 'RESTOCK_PRODUCT_1_ON_OUTLET_1', 'RESTOCK_PRODUCT', '2', '2022-12-20', '2022-12-20 09:47:31', 'SUCCESS'),
('20221220094746', 'RESTOCK_PRODUCT_3_ON_OUTLET_1', 'RESTOCK_PRODUCT', '2', '2022-12-20', '2022-12-20 09:47:46', 'SUCCESS'),
('20221220094800', 'RESTOCK_PRODUCT_2_ON_OUTLET_1', 'RESTOCK_PRODUCT', '2', '2022-12-20', '2022-12-20 09:48:00', 'SUCCESS'),
('20221220162253', 'ORDER_4_PCA/RCP/202212/0027_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-20', '2022-12-20 16:22:53', 'SUCCESS'),
('20221220162952', 'ORDER_5_PCA/RCP/202212/0028_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-20', '2022-12-20 16:29:52', 'SUCCESS'),
('20221220163051', 'NEW_CUSTOMER_C', 'ADD_CUST_FROM_POS', '2', '2022-12-20', '2022-12-20 16:30:51', 'SUCCESS'),
('20221220163051', 'ORDER_6_PCA/RCP/202212/0029_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-20', '2022-12-20 16:30:51', 'SUCCESS'),
('20221221085926', 'ORDER_11_PCA/RCP/202212/0021_DELETED', 'ORDER_DELETE', '2', '2022-12-21', '2022-12-21 08:59:26', 'SUCCESS'),
('20221221085951', 'NEW_CUSTOMER_Wildhan Eka', 'ADD_CUST_FROM_POS', '2', '2022-12-21', '2022-12-21 08:59:51', 'SUCCESS'),
('20221221085951', 'ORDER_1_PCA/RCP/202212/0030_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 08:59:51', 'SUCCESS'),
('20221221090253', 'NEW_CUSTOMER_Wildhan', 'ADD_CUST_FROM_POS', '2', '2022-12-21', '2022-12-21 09:02:53', 'SUCCESS'),
('20221221090253', 'ORDER_2_PCA/RCP/202212/0031_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:02:53', 'SUCCESS'),
('20221221090457', 'RESTOCK_PRODUCT_2_ON_OUTLET_1', 'RESTOCK_PRODUCT', '2', '2022-12-21', '2022-12-21 09:04:57', 'SUCCESS'),
('20221221090513', 'NEW_CUSTOMER_Wildhan', 'ADD_CUST_FROM_POS', '2', '2022-12-21', '2022-12-21 09:05:13', 'SUCCESS'),
('20221221090513', 'ORDER_3_PCA/RCP/202212/0032_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:05:13', 'SUCCESS'),
('20221221090532', 'NEW_CUSTOMER_Eka', 'ADD_CUST_FROM_POS', '2', '2022-12-21', '2022-12-21 09:05:32', 'SUCCESS'),
('20221221090532', 'ORDER_4_PCA/RCP/202212/0033_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:05:32', 'SUCCESS'),
('20221221090602', 'ORDER_5_PCA/RCP/202212/0034_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:06:02', 'SUCCESS'),
('20221221090930', 'ORDER_6_PCA/RCP/202212/0035_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:09:30', 'SUCCESS'),
('20221221091121', 'ORDER_7_PCA/RCP/202212/0036_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:11:21', 'SUCCESS'),
('20221221091648', 'ORDER_8_PCA/RCP/202212/0037_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:16:48', 'SUCCESS'),
('20221221091733', 'ORDER_9_PCA/RCP/202212/0038_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:17:33', 'SUCCESS'),
('20221221091751', 'ORDER_10_PCA/RCP/202212/0039_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:17:51', 'SUCCESS'),
('20221221091850', 'ORDER_11_PCA/RCP/202212/0040_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:18:50', 'SUCCESS'),
('20221221091951', 'ORDER_12_PCA/RCP/202212/0041_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 09:19:51', 'SUCCESS'),
('20221221104153', 'NEW_CUSTOMER_Dandi', 'ADD_CUST_FROM_POS', '2', '2022-12-21', '2022-12-21 10:41:53', 'SUCCESS'),
('20221221104153', 'ORDER_13_PCA/RCP/202212/0042_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 10:41:53', 'SUCCESS'),
('20221221104215', 'ORDER_14_PCA/RCP/202212/0043_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-21', '2022-12-21 10:42:15', 'SUCCESS'),
('20221221145848', 'INSERT_LOYALTY_LYL-221221-1', 'MASTER_LOYALTY', '2', '2022-12-21', '2022-12-21 14:58:48', 'SUCCESS'),
('20221222102451', 'ORDER_1_PCA/RCP/202212/0044_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-22', '2022-12-22 10:24:51', 'SUCCESS'),
('20221222133421', 'ORDER_2_PCA/RCP/202212/0045_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:34:21', 'SUCCESS'),
('20221222133645', 'ORDER_3_PCA/RCP/202212/0046_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:36:45', 'SUCCESS'),
('20221222133740', 'ORDER_4_PCA/RCP/202212/0047_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:37:40', 'SUCCESS'),
('20221222134007', 'ORDER_5_PCA/RCP/202212/0048_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:40:07', 'SUCCESS'),
('20221222134125', 'ORDER_6_PCA/RCP/202212/0049_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:41:25', 'SUCCESS'),
('20221222134718', 'ORDER_7_PCA/RCP/202212/0050_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:47:18', 'SUCCESS'),
('20221222134750', 'ORDER_2_PCA/RCP/202212/0045_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:47:50', 'SUCCESS'),
('20221222134755', 'ORDER_3_PCA/RCP/202212/0046_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:47:55', 'SUCCESS'),
('20221222134759', 'ORDER_4_PCA/RCP/202212/0047_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:47:59', 'SUCCESS'),
('20221222134803', 'ORDER_5_PCA/RCP/202212/0048_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:48:03', 'SUCCESS'),
('20221222134809', 'ORDER_6_PCA/RCP/202212/0049_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:48:09', 'SUCCESS'),
('20221222134813', 'ORDER_7_PCA/RCP/202212/0050_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:48:13', 'SUCCESS'),
('20221222134822', 'ORDER_8_PCA/RCP/202212/0051_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:48:22', 'SUCCESS'),
('20221222134830', 'ORDER_8_PCA/RCP/202212/0051_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:48:30', 'SUCCESS'),
('20221222135013', 'ORDER_9_PCA/RCP/202212/0052_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:50:13', 'SUCCESS'),
('20221222135020', 'ORDER_9_PCA/RCP/202212/0052_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:50:20', 'SUCCESS'),
('20221222135044', 'ORDER_10_PCA/RCP/202212/0053_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:50:44', 'SUCCESS'),
('20221222135122', 'ORDER_11_PCA/RCP/202212/0054_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:51:22', 'SUCCESS'),
('20221222135152', 'ORDER_10_PCA/RCP/202212/0053_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:51:52', 'SUCCESS'),
('20221222135157', 'ORDER_11_PCA/RCP/202212/0054_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:51:57', 'SUCCESS'),
('20221222135335', 'ORDER_12_PCA/RCP/202212/0055_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:53:35', 'SUCCESS'),
('20221222135413', 'ORDER_13_PCA/RCP/202212/0056_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:54:13', 'SUCCESS'),
('20221222135421', 'ORDER_13_PCA/RCP/202212/0056_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:54:21', 'SUCCESS'),
('20221222135426', 'ORDER_12_PCA/RCP/202212/0055_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:54:26', 'SUCCESS'),
('20221222135744', 'ORDER_14_PCA/RCP/202212/0057_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:57:44', 'SUCCESS'),
('20221222135759', 'ORDER_14_PCA/RCP/202212/0057_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 13:57:59', 'SUCCESS'),
('20221222135811', 'ORDER_15_PCA/RCP/202212/0058_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 13:58:11', 'SUCCESS'),
('20221222142852', 'ORDER_16_PCA/RCP/202212/0059_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 14:28:52', 'SUCCESS'),
('20221222143316', 'NEW_CUSTOMER_Reza', 'ADD_CUST_FROM_POS', '2', '2022-12-22', '2022-12-22 14:33:16', 'SUCCESS'),
('20221222143316', 'ORDER_16_PCA/RCP/202212/0059_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-22', '2022-12-22 14:33:16', 'SUCCESS'),
('20221222143446', 'ORDER_15_PCA/RCP/202212/0058_DELETED', 'ORDER_DELETE', '2', '2022-12-22', '2022-12-22 14:34:46', 'SUCCESS'),
('20221222152519', 'ORDER_17_PCA/RCP/202212/0060_DRAFT', 'ORDER_DRAFT', '2', '2022-12-22', '2022-12-22 15:25:19', 'SUCCESS'),
('20221222152554', 'NEW_CUSTOMER_Reza', 'ADD_CUST_FROM_POS', '2', '2022-12-22', '2022-12-22 15:25:54', 'SUCCESS'),
('20221222152554', 'ORDER_17_PCA/RCP/202212/0060_COMPLETE', 'ORDER_COMPLETE', '2', '2022-12-22', '2022-12-22 15:25:54', 'SUCCESS');

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
('PCA/CLOSE/202211/0002', '2022-11-21', '2022-11', 1, '1', 15000, 0, 15000, 35000, '', '2', 1, '2022-11-22', '2022-11-22 13:27:22');

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
('20221122075422', 'IN', '4', 20, 20, '2', 3.8e+007, '2', 1, '2022-11-22', '2022-11-22 07:54:22'),
('20221121140637', 'OUT', '6', 10, 20, '2', 8e+006, '2', 1, '2022-11-21', '2022-11-21 14:06:37'),
('20221121133234', 'IN', '6', 10, 30, '2', 8e+006, '2', 1, '2022-11-21', '2022-11-21 13:32:34');

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
('20221122075422', 'TRX-20221122075422', '4', 'SPL-221024-2', '1', 20, 0, '2', 2e+006, 3.8e+007, 3.8e+007, 1, '2022-11-22', '2022-11-22 07:54:22'),
('20221121133234', 'TRX-20221121133234', '6', 'SPL-221121-3', '1', 10, 10, '2', 1e+006, 8e+006, 0, 1, '2022-11-21', '2022-11-21 13:32:34');

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
  `measurementID` varchar(30) DEFAULT NULL,
  `userID` varchar(30) DEFAULT NULL,
  `remarks` text,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemtransaction`
--

INSERT INTO `tabitemtransaction` (`transID`, `transDate`, `supplierID`, `outletID`, `ingredientID`, `amount`, `itemAmount`, `itemPrice`, `totalPrice`, `discount`, `discountPrice`, `measurementID`, `userID`, `remarks`, `dateCreated`, `lastChanged`) VALUES
('TRX-20221122075422', '2022-11-22', 'SPL-221024-2', '1', '4', 20, 20, 2e+006, 4e+007, 5, 2e+006, '2', '2', '', '2022-11-22', '2022-11-22 07:54:22'),
('TRX-20221121133234', '2022-11-21', 'SPL-221121-3', '1', '6', 10, 30, 1e+006, 1e+007, 20, 2e+006, '2', '2', 'Diskon', '2022-11-21', '2022-11-21 13:32:34');

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
('1', '1', '1', 30, 1, '2022-12-21', '2022-12-22 10:24:51'),
('2', '2', '1', 10, 1, '2022-12-21', '2022-12-21 09:05:32'),
('3', '3', '1', 20, 1, '2022-12-21', '2022-12-21 10:42:15'),
('4', '4', '1', 10, 1, '2022-12-22', '2022-12-22 15:25:54');

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
('1', 'PCA/RCP/202212/0060', '2', 2, 15000, 30000, 1, '2022-12-22', '2022-12-22 15:25:54');

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
-- Dumping data for table `taborderheader`
--

INSERT INTO `taborderheader` (`orderID`, `orderNo`, `orderDate`, `orderPeriode`, `orderAmount`, `outletID`, `dpp`, `VAT`, `discountPrice`, `discountPerc`, `total`, `promoID`, `isVoucher`, `voucherID`, `paymentAmount`, `paymentMethod`, `payerName`, `payerPhone`, `payerEmail`, `remarks`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
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
('PCA/RCP/202212/0060', 17, '2022-12-22', '2022-12', 2, '1', 30000, 0, 0, NULL, 30000, '', 0, '', 30000, '1', '', '', '', '', '2', 1, '2022-12-22', '2022-12-22 15:25:54');

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
('20221222152554', 'OUT', '2', 2, 10, '5', '2', 1, 'PCA/RCP/202212/0060', '2022-12-22', '2022-12-22 15:25:54');

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
('20221202075246002', '2', '2', 2, '2', 1, '2022-12-02', '2022-12-02 07:52:46');

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
('2', '2022-12-02', '3', '1', '1', 2, '5', '2', 1, '', '2022-12-02', '2022-12-02 07:50:00', NULL, NULL, NULL, NULL),
('1', '2022-11-21', '3', '1', '1', 10, '5', '2', 2, '10 picis', '2022-11-21', '2022-11-21 14:02:54', 0, '2', '2022-11-21', 'Mantab, gassss');

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

INSERT INTO `tabstocktransaction` (`id`, `stockID`, `categoryStockID`, `measurementID`, `userID`, `amount`, `stockAmount`, `type`, `remarks`, `status`, `outletID`, `pic`, `dateCreated`, `lastChanged`) VALUES
('1', '1', '1', '5', '2', 2, 12, 'IN', '', 'SUCCESS', '1', 'Eka', '2022-12-08', '2022-12-08 13:10:04'),
('2', '1', '1', '5', '2', 2, 10, 'OUT', '', 'SUCCESS', '1', 'eka', '2022-12-08', '2022-12-08 13:10:27');

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
('B003', '5'),
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
('A001', '6'),
('A002', '6'),
('B001', '5'),
('B002', '5'),
('D001', '4'),
('D002', '4'),
('D003', '4'),
('E003', '2'),
('B004', '2');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
