-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2024 at 01:50 PM
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
('CF0006', 'KUE KERING', 'kk', '', 1, '2024-03-06', '2024-03-06 14:19:11'),
('CF0005', 'SNACK', 'snk', '', 1, '2024-03-06', '2024-03-06 14:18:58'),
('CF0004', 'MINUMAN', 'mnm', '', 1, '2024-03-06', '2024-03-06 14:18:50'),
('CF0003', 'MAKANAN', 'mkn', '', 1, '2024-03-06', '2024-03-06 14:18:43'),
('CF0002', 'ROTI', 'rt', '', 1, '2024-03-06', '2024-03-06 14:18:35'),
('CF0001', 'PICNIC ROLL', 'pr', '', 1, '2024-03-06', '2024-03-06 14:18:28');

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
('1', 'WILDHAN EKA', '00000', '', 1, '2024-03-06', '2024-03-06 15:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `mdepartment`
--

CREATE TABLE IF NOT EXISTS `mdepartment` (
  `departmentCode` varchar(30) NOT NULL,
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
('DRT0001', 'CASHIERS', 1, '2024-03-05', '2024-03-05 14:31:37'),
('DRT0002', 'KITCHEN', 1, '2024-03-05', '2024-03-05 14:31:46'),
('DRT0003', 'WAREHOUSE', 1, '2024-03-05', '2024-03-05 14:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `mingredient`
--

CREATE TABLE IF NOT EXISTS `mingredient` (
  `ingredientID` varchar(30) NOT NULL,
  `ingredient` varchar(100) DEFAULT NULL,
  `curStock` float DEFAULT NULL,
  `minStock` float DEFAULT NULL,
  `outletID` varchar(30) NOT NULL,
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
('IGR0001', 'TELUR', 50, 5, 'OTL0001', 'MSR0004', '', 1, '2024-03-05', '2024-03-12 10:58:56'),
('IGR0002', 'TEPUNG', 1500, 1000, 'OTL0001', 'MSR0005', '', 1, '2024-03-05', '2024-03-12 10:58:56');

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
('LYL-240304-1', 100000, 1, 1, '2024-03-04', '2024-03-04 16:24:24');

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
('MSR0004', 'PIECE', 'PCS', '', 1, '2024-03-05', '2024-03-05 14:36:39'),
('MSR0003', 'PACK', 'PCK', '', 1, '2024-03-05', '2024-03-05 14:36:31'),
('MSR0002', 'KILOGRAM', 'KG', '', 1, '2024-03-05', '2024-03-05 14:36:10'),
('MSR0001', 'LITER', 'L', 'tes', 1, '2024-03-05', '2024-03-05 14:36:03'),
('MSR0005', 'GRAM', 'GR', '', 1, '2024-03-05', '2024-03-05 14:52:10');

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
('B004', 'TRX', 'Pengeluaran', 1, '2022-12-02', '2022-12-02 15:36:47'),
('GST1', NULL, NULL, 1, '2023-03-28', '2023-03-28 10:46:50');

-- --------------------------------------------------------

--
-- Table structure for table `moutlet`
--

CREATE TABLE IF NOT EXISTS `moutlet` (
  `outletID` varchar(30) NOT NULL,
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
('OTL0001', 'NGAGEL', 'NGAGEL', '-', '', 1, '2024-03-05', '2024-03-05 14:40:18');

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
('PYM0003', 'BRI', 'BRI', '', 1, '2024-03-05', '2024-03-05 14:55:07'),
('PYM0002', 'BCA', 'BCA', '', 1, '2024-03-05', '2024-03-05 14:55:00'),
('PYM0001', 'CASH', 'CASH', '', 1, '2024-03-05', '2024-03-05 14:54:47'),
('PYM0004', 'CC', 'CC', '', 1, '2024-03-05', '2024-03-05 14:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `mposition`
--

CREATE TABLE IF NOT EXISTS `mposition` (
  `positionID` varchar(30) NOT NULL,
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
('PTS0001', 'TES11', 1, '2024-03-05', '2024-03-05 15:24:49'),
('PTS0002', 'CREATE', 1, '2024-03-05', '2024-03-05 15:24:41');

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
  `outletID` varchar(30) NOT NULL,
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
('PRD0001', 'BEEF ROLL COUPLE', 'CF0001', 'REC0001', 11, 1, 'OTL0001', 'MSR0004', 0, 'download.png', '', 1, '2024-03-06', '2024-03-06 15:15:09'),
('PRD0002', 'PIZZA BREAD', 'CF0002', 'REC0012', 4, 1, 'OTL0001', 'MSR0004', 0, 'download.png', '', 1, '2024-03-06', '2024-03-06 20:38:13');

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
('PRM-20230613-2', 'HRPROMO', 'DISCOUNT', 1000, '1', 1, 50, 0, 0, 0, 0, 0, 0, 0, '2023-06-13', '2023-06-13', '', 1, '2023-06-13', '2023-06-13 15:18:40');

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
('REC0029', 'FRANKFURTER SAUSAGE EXTRA FRIES', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:49:58'),
('REC0028', 'NASI TELUR PONTIANAK', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:49:47'),
('REC0027', 'SALMON TERIYAKI RICE', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:49:36'),
('REC0026', 'CRISPY TOFU', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:49:24'),
('REC0025', 'SPAGHETTI BOLOGNESE', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:49:11'),
('REC0024', 'NASI GILA', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:48:57'),
('REC0023', 'TUNA RICA RICA', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:37:48'),
('REC0022', 'CHOCO CHEESE', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:33:36'),
('REC0021', 'CHEESECAKE BROWNIES', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:33:22'),
('REC0020', 'SMOKED BEEF & CHEESE BREAD', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:33:12'),
('REC0019', 'CHOCO PEANUT', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:33:00'),
('REC0018', 'LAPIS SURABAYA PANDAN SLICE', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:32:50'),
('REC0017', 'COFFEE BREAD', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:32:37'),
('REC0016', 'MOONCAKE TRADISIONAL', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:32:24'),
('REC0015', 'LAPIS SURABAYA KISMIS SLICE', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:32:11'),
('REC0014', 'TUNA BREAD', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:31:58'),
('REC0013', 'LAPIS SURABAYA CHOCO SLICE', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:31:45'),
('REC0012', 'PIZZA BREAD', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:31:33'),
('REC0011', 'LAPIS SURABAYA KISMIS', 'CF0002', '', 1, '2024-03-06', '2024-03-06 14:29:09'),
('REC0010', 'FAMILY BOX SALMON', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:22:20'),
('REC0009', 'FAMILY BOX BEEF', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:22:09'),
('REC0008', 'FAM CCB BOX GOLD', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:21:56'),
('REC0007', 'FAMILY BOX CCB', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:21:40'),
('REC0006', 'CCB TART BOX GOLD', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:21:29'),
('REC0005', 'CCB TART', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:21:17'),
('REC0004', 'CCB ROLL COUPLE', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:21:03'),
('REC0003', 'BEEF TART BOX GOLD', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:20:51'),
('REC0002', 'BEEF TART', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:20:37'),
('REC0001', 'BEEF ROLL COUPLE', 'CF0001', '', 1, '2024-03-06', '2024-03-06 14:20:24'),
('REC0030', 'SPAGHETTI AGLIO OLIO', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:50:08'),
('REC0031', 'NASI GORENG HONGKONG', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:50:19'),
('REC0032', 'SALMON MENTAI RICE', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:50:32'),
('REC0033', 'CRISPY CHICKEN RICE', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:50:55'),
('REC0034', 'CRISPY KATSU NOODLE', 'CF0003', '', 1, '2024-03-06', '2024-03-06 14:51:06');

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
('20240306202454', 'REC0012', 'IGR0002', 500, 1, '2024-03-06', '2024-03-06 20:24:54'),
('20240306202446', 'REC0012', 'IGR0001', 1, 1, '2024-03-06', '2024-03-06 20:24:46');

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
  `outletID` varchar(30) DEFAULT NULL,
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
('ITM0002', 'SABUN', 'SCG0001', 'MSR0004', 2, 1, 'OTL0001', '', 1, '2024-03-13', '2024-03-13 08:22:50'),
('ITM0001', 'TISU', 'SCG0002', 'MSR0004', 6, 0, 'OTL0001', '', 1, '2024-03-13', '2024-03-13 08:22:37');

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
('SCG0002', 'TOKO', 'tk', '', 1, '2024-03-05', '2024-03-05 15:58:13'),
('SCG0001', 'DAPUR', 'ktc', '', 1, '2024-03-05', '2024-03-05 15:58:07');

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
('SPL-230613-1', 'PT TESTER', '--', '--', 'fahmi ', '', 1, '2023-06-13', '2023-06-13 08:14:55');

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
  `outletID` varchar(30) NOT NULL,
  `departmentCode` varchar(30) DEFAULT NULL,
  `positionID` varchar(30) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `muser`
--

INSERT INTO `muser` (`userID`, `employeeNo`, `username`, `password`, `fullname`, `outletID`, `departmentCode`, `positionID`, `status`, `dateCreated`, `lastChanged`) VALUES
('USR0001', '1', 'tes04', 'daaad6e5604e8e17bd9f108d91e26afe6281dac8fda0091040a7a6d7bd9b43b5', 'backdoor', 'OTL0001', 'DRT0001', 'PTS0001', 1, '2022-10-23', '2024-03-05 18:46:52'),
('USR0002', '2', 'user', '831c237928e6212bedaa4451a514ace3174562f6761f6a157a2fe5082b36e2fb', 'user', 'OTL0001', 'DRT0001', 'PTS0001', 1, '2024-03-01', '2024-03-01 08:15:39'),
('USR0003', '3', 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'administrator', 'OTL0001', 'DRT0003', 'PTS0002', 1, '2024-03-06', '2024-03-06 09:25:44');

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
('20240306141508', 'INSERT_MASTER_PRICE_ON STORE', 'MASTER_PRICE', 'USR0003', '2024-03-06', '2024-03-06 14:15:08', 'SUCCESS'),
('20240306141634', 'INSERT_MASTER_PRICE_ON STORE', 'MASTER_PRICE', 'USR0003', '2024-03-06', '2024-03-06 14:16:34', 'SUCCESS'),
('20240306141727', 'INSERT_MASTER_PRICE_ON STORE', 'MASTER_PRICE', 'USR0003', '2024-03-06', '2024-03-06 14:17:27', 'SUCCESS'),
('20240306141828', 'INSERT_CATEGORY_PICNIC ROLL', 'MASTER_CATEGORY', 'USR0003', '2024-03-06', '2024-03-06 14:18:28', 'SUCCESS'),
('20240306141835', 'INSERT_CATEGORY_ROTI', 'MASTER_CATEGORY', 'USR0003', '2024-03-06', '2024-03-06 14:18:35', 'SUCCESS'),
('20240306141843', 'INSERT_CATEGORY_MAKANAN', 'MASTER_CATEGORY', 'USR0003', '2024-03-06', '2024-03-06 14:18:43', 'SUCCESS'),
('20240306141850', 'INSERT_CATEGORY_MINUMAN', 'MASTER_CATEGORY', 'USR0003', '2024-03-06', '2024-03-06 14:18:50', 'SUCCESS'),
('20240306141858', 'INSERT_CATEGORY_SNACK', 'MASTER_CATEGORY', 'USR0003', '2024-03-06', '2024-03-06 14:18:58', 'SUCCESS'),
('20240306141911', 'INSERT_CATEGORY_KUE KERING', 'MASTER_CATEGORY', 'USR0003', '2024-03-06', '2024-03-06 14:19:11', 'SUCCESS'),
('20240306142024', 'INSERT_RECIPE_BEEF ROLL COUPLE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:20:24', 'SUCCESS'),
('20240306142037', 'INSERT_RECIPE_BEEF TART', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:20:37', 'SUCCESS'),
('20240306142051', 'INSERT_RECIPE_BEEF TART BOX GOLD', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:20:51', 'SUCCESS'),
('20240306142103', 'INSERT_RECIPE_CCB ROLL COUPLE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:21:03', 'SUCCESS'),
('20240306142117', 'INSERT_RECIPE_CCB TART', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:21:17', 'SUCCESS'),
('20240306142129', 'INSERT_RECIPE_CCB TART BOX GOLD', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:21:29', 'SUCCESS'),
('20240306142140', 'INSERT_RECIPE_FAMILY BOX CCB', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:21:40', 'SUCCESS'),
('20240306142156', 'INSERT_RECIPE_FAM CCB BOX GOLD', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:21:56', 'SUCCESS'),
('20240306142209', 'INSERT_RECIPE_FAMILY BOX BEEF', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:22:09', 'SUCCESS'),
('20240306142220', 'INSERT_RECIPE_FAMILY BOX SALMON', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:22:20', 'SUCCESS'),
('20240306142909', 'INSERT_RECIPE_LAPIS SURABAYA KISMIS', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:29:09', 'SUCCESS'),
('20240306143133', 'INSERT_RECIPE_PIZZA BREAD', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:31:33', 'SUCCESS'),
('20240306143145', 'INSERT_RECIPE_LAPIS SURABAYA CHOCO SLICE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:31:45', 'SUCCESS'),
('20240306143158', 'INSERT_RECIPE_TUNA BREAD', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:31:58', 'SUCCESS'),
('20240306143211', 'INSERT_RECIPE_LAPIS SURABAYA KISMIS SLICE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:32:11', 'SUCCESS'),
('20240306143224', 'INSERT_RECIPE_MOONCAKE TRADISIONAL', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:32:24', 'SUCCESS'),
('20240306143237', 'INSERT_RECIPE_COFFEE BREAD', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:32:37', 'SUCCESS'),
('20240306143250', 'INSERT_RECIPE_LAPIS SURABAYA PANDAN SLICE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:32:50', 'SUCCESS'),
('20240306143300', 'INSERT_RECIPE_CHOCO PEANUT', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:33:00', 'SUCCESS'),
('20240306143312', 'INSERT_RECIPE_SMOKED BEEF & CHEESE BREAD', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:33:12', 'SUCCESS'),
('20240306143322', 'INSERT_RECIPE_CHEESECAKE BROWNIES', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:33:22', 'SUCCESS'),
('20240306143336', 'INSERT_RECIPE_CHOCO CHEESE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:33:36', 'SUCCESS'),
('20240306143354', 'INSERT_RECIPE_TUNA RICA RICA', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:33:54', 'SUCCESS'),
('20240306144725', 'INSERT_RECIPE_NASI GILA', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:47:25', 'SUCCESS'),
('20240306144911', 'INSERT_RECIPE_SPAGHETTI BOLOGNESE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:49:11', 'SUCCESS'),
('20240306144924', 'INSERT_RECIPE_CRISPY TOFU', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:49:24', 'SUCCESS'),
('20240306144936', 'INSERT_RECIPE_SALMON TERIYAKI RICE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:49:36', 'SUCCESS'),
('20240306144947', 'INSERT_RECIPE_NASI TELUR PONTIANAK', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:49:47', 'SUCCESS'),
('20240306144958', 'INSERT_RECIPE_FRANKFURTER SAUSAGE EXTRA FRIES', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:49:58', 'SUCCESS'),
('20240306145008', 'INSERT_RECIPE_SPAGHETTI AGLIO OLIO', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:50:08', 'SUCCESS'),
('20240306145019', 'INSERT_RECIPE_NASI GORENG HONGKONG', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:50:19', 'SUCCESS'),
('20240306145032', 'INSERT_RECIPE_SALMON MENTAI RICE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:50:32', 'SUCCESS'),
('20240306145045', 'INSERT_RECIPE_CRISPY CHICKEN RICE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:50:45', 'SUCCESS'),
('20240306145106', 'INSERT_RECIPE_CRISPY KATSU NOODLE', 'MASTER_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 14:51:06', 'SUCCESS'),
('20240306151535', 'INSERT_PRICE_LIST_', 'PRICE_LIST', 'USR0003', '2024-03-06', '2024-03-06 15:15:35', 'SUCCESS'),
('20240306151509', 'INSERT_PRODUCT_BEEF ROLL COUPLE', 'MASTER_PRODUCT', 'USR0003', '2024-03-06', '2024-03-06 15:15:09', 'SUCCESS'),
('20240306151624', 'INSERT_PRODUCT_PIZZA BREAD', 'MASTER_PRODUCT', 'USR0003', '2024-03-06', '2024-03-06 15:16:24', 'SUCCESS'),
('20240306151641', 'INSERT_PRICE_LIST_', 'PRICE_LIST', 'USR0003', '2024-03-06', '2024-03-06 15:16:41', 'SUCCESS'),
('20240306151723', 'NEW_CUSTOMER_WILDHAN EKA', 'ADD_CUST_FROM_POS', 'USR0003', '2024-03-06', '2024-03-06 15:17:23', 'SUCCESS'),
('20240306151723', 'ORDER_1_PCA/RCP/202403/0001_COMPLETE', 'ORDER_COMPLETE', 'USR0003', '2024-03-06', '2024-03-06 15:17:23', 'SUCCESS'),
('20240306202446', 'INSERT_RECIPE_INGREDIENT_IGR0001(REC0012)', 'DETAIL_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 20:24:46', 'SUCCESS'),
('20240306202454', 'INSERT_RECIPE_INGREDIENT_IGR0002(REC0012)', 'DETAIL_RECIPE', 'USR0003', '2024-03-06', '2024-03-06 20:24:54', 'SUCCESS'),
('20240306202517', 'INSERT_REQUESTING_PCA/REQ/202403/0002', 'REQUEST_INGREDIENT', 'USR0003', '2024-03-06', '2024-03-06 20:25:17', 'SUCCESS'),
('20240306202520', 'INSERT_REQUESTING_PCA/REQ/202403/0002INGREDIENT(IGR0002)', 'REQUEST_DETAIL_INGREDIENT', '', '2024-03-06', '2024-03-06 20:25:20', 'SUCCESS'),
('20240306202520', 'INSERT_REQUESTING_PCA/REQ/202403/0002INGREDIENT(IGR0001)', 'REQUEST_DETAIL_INGREDIENT', '', '2024-03-06', '2024-03-06 20:25:20', 'SUCCESS'),
('20240306202620', 'UPDATE_STOCK_INGREDIENT_IGR0002_FROM_REQUESTPCA/REQ/202403/0002', 'AMOUNT_STOCK', 'USR0003', '2024-03-06', '2024-03-06 20:26:20', 'SUCCESS'),
('20240306202621', 'UPDATE_STOCK_INGREDIENT_IGR0001_FROM_REQUESTPCA/REQ/202403/0002', 'AMOUNT_STOCK', 'USR0003', '2024-03-06', '2024-03-06 20:26:21', 'SUCCESS'),
('20240306204235', 'ORDER_2_PCA/RCP/202403/0002_COMPLETE', 'ORDER_COMPLETE', 'USR0003', '2024-03-06', '2024-03-06 20:42:35', 'SUCCESS'),
('20240306204322', 'ORDER_3_PCA/RCP/202403/0003_COMPLETE', 'ORDER_COMPLETE', 'USR0003', '2024-03-06', '2024-03-06 20:43:22', 'SUCCESS'),
('20240306204356', 'INSERT_CLOSE_CASHIER_PCA/CLOSE/202403/0001', 'CLOSE_CASHIER', 'USR0003', '2024-03-06', '2024-03-06 20:43:56', 'SUCCESS'),
('20240307102311', 'INSERT_RESTOCK_1', 'TRANSACTION_RESTOCK', 'USR0001', '2024-03-07', '2024-03-07 10:23:11', 'SUCCESS'),
('20240310175917', 'INSERT_RESTOCK_2', 'TRANSACTION_RESTOCK', 'USR0003', '2024-03-10', '2024-03-10 17:59:17', 'SUCCESS'),
('20240310180539', 'INSERT_RESTOCK_1', 'TRANSACTION_RESTOCK', 'USR0003', '2024-03-10', '2024-03-10 18:05:39', 'SUCCESS'),
('20240310180600', 'INSERT_RESTOCK_2', 'TRANSACTION_RESTOCK', 'USR0003', '2024-03-10', '2024-03-10 18:06:00', 'SUCCESS'),
('20240310181458', 'INSERT_RESTOCK_1', 'TRANSACTION_RESTOCK', 'USR0003', '2024-03-10', '2024-03-10 18:14:58', 'SUCCESS'),
('20240310181516', 'INSERT_RESTOCK_2', 'TRANSACTION_RESTOCK', 'USR0003', '2024-03-10', '2024-03-10 18:15:16', 'SUCCESS'),
('20240311132557', 'INSERT_ITEM_TISU', 'MASTER_STOCK', 'USR0003', '2024-03-11', '2024-03-11 13:25:57', 'SUCCESS'),
('20240311132702', 'INSERT_ITEM_SABUN', 'MASTER_STOCK', 'USR0003', '2024-03-11', '2024-03-11 13:27:02', 'SUCCESS'),
('20240311134843', 'RESTOCK_PRODUCT_TISU_ON_OUTLET_OTL0001', 'IN/OUT_ITEM', 'USR0003', '2024-03-11', '2024-03-11 13:48:43', 'SUCCESS'),
('20240312105742', 'INSERT_REQUESTING_PCA/REQ/202403/0001', 'REQUEST_INGREDIENT', 'USR0003', '2024-03-12', '2024-03-12 10:57:42', 'SUCCESS'),
('20240312105758', 'INSERT_REQUESTING_PCA/REQ/202403/0001INGREDIENT(IGR0002)', 'REQUEST_DETAIL_INGREDIENT', '', '2024-03-12', '2024-03-12 10:57:58', 'SUCCESS'),
('20240312105758', 'INSERT_REQUESTING_PCA/REQ/202403/0001INGREDIENT(IGR0001)', 'REQUEST_DETAIL_INGREDIENT', '', '2024-03-12', '2024-03-12 10:57:58', 'SUCCESS'),
('20240312105856', 'UPDATE_STOCK_INGREDIENT_IGR0001_FROM_REQUESTPCA/REQ/202403/0001', 'AMOUNT_STOCK', 'USR0003', '2024-03-12', '2024-03-12 10:58:56', 'SUCCESS'),
('20240312105856', 'UPDATE_STOCK_INGREDIENT_IGR0002_FROM_REQUESTPCA/REQ/202403/0001', 'AMOUNT_STOCK', 'USR0003', '2024-03-12', '2024-03-12 10:58:56', 'SUCCESS'),
('20240313082237', 'INSERT_ITEM_TISU', 'MASTER_STOCK', 'USR0003', '2024-03-13', '2024-03-13 08:22:37', 'SUCCESS'),
('20240313082250', 'INSERT_ITEM_SABUN', 'MASTER_STOCK', 'USR0003', '2024-03-13', '2024-03-13 08:22:50', 'SUCCESS'),
('20240315132030', 'ORDER_1_PCA/RCP/202403/0004_COMPLETE', 'ORDER_COMPLETE', 'USR0003', '2024-03-15', '2024-03-15 13:20:30', 'SUCCESS'),
('20240315132202', 'ORDER_2_PCA/RCP/202403/0005_COMPLETE', 'ORDER_COMPLETE', 'USR0003', '2024-03-15', '2024-03-15 13:22:02', 'SUCCESS'),
('20240317141905', 'ORDER_1_PCA/RCP/202403/0006_COMPLETE', 'ORDER_COMPLETE', 'USR0003', '2024-03-17', '2024-03-17 14:19:05', 'SUCCESS'),
('20240318124140', 'INSERT_RESTOCK_1', 'TRANSACTION_RESTOCK', 'USR0003', '2024-03-18', '2024-03-18 12:41:40', 'SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `taballtransaction`
--

CREATE TABLE IF NOT EXISTS `taballtransaction` (
  `transID` varchar(30) NOT NULL,
  `transDate` date NOT NULL,
  `supplierID` varchar(30) NOT NULL,
  `outletID` varchar(30) NOT NULL,
  `stuffID` varchar(30) NOT NULL,
  `measurementID` varchar(30) NOT NULL,
  `amountBuy` float NOT NULL,
  `currentStock` float NOT NULL,
  `totalPrice` float NOT NULL,
  `discount` float DEFAULT NULL,
  `discountPrice` float DEFAULT NULL,
  `userID` varchar(30) NOT NULL,
  `remarks` text,
  `dateCreated` datetime NOT NULL,
  `lastChanged` datetime NOT NULL,
  PRIMARY KEY (`transID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taballtransaction`
--


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
('20230613171430', '1', '1', 2, 1, '2023-06-13', '2023-06-13 17:14:30');

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
('1', 'SAMPLE BUNDLE A', '5', '1', '0000-00-00', 150000, 1, '2023-06-13', '2023-06-13 17:14:30');

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
('20240306204356', 'PCA/RCP/202403/0003', 'PCA/CLOSE/202403/0001', 230000, 7500, 0, 237500, '', 237500, 'PYM0002', '', '', 'USR0003', 1, '2024-03-06', '2024-03-06 20:43:56'),
('20240306204356', 'PCA/RCP/202403/0002', 'PCA/CLOSE/202403/0001', 10000, 1500, 0, 11500, '', 11500, 'PYM0001', '', '', 'USR0003', 1, '2024-03-06', '2024-03-06 20:43:56'),
('20240306204356', 'PCA/RCP/202403/0001', 'PCA/CLOSE/202403/0001', 50000, 7500, 0, 57500, '', 57500, 'PYM0001', 'WILDHAN EKA', '', 'USR0003', 1, '2024-03-06', '2024-03-06 20:43:56');

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
('PCA/CLOSE/202403/0001', '2024-03-06', '2024-03', 1, 'OTL0001', 290000, 16500, 306500, 306500, '', 'USR0003', 1, '2024-03-06', '2024-03-06 20:43:56');

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
  `dateCreated` datetime DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemhistory`
--

INSERT INTO `tabitemhistory` (`id`, `transType`, `ingredientID`, `amount`, `itemAmount`, `measurementID`, `cost`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('20240312105856', 'OUT', 'IGR0002', 2500, 1500, 'MSR0005', 0, 'USR0003', 1, '2024-03-12 00:00:00', '2024-03-12 10:58:56'),
('20240318124140', 'IN', 'IGR0001', 2, 50, 'MSR0004', 4000, 'USR0003', 1, '2024-03-18 12:41:40', '2024-03-18 12:41:40'),
('20240312105856', 'OUT', 'IGR0001', 5, 48, 'MSR0004', 0, 'USR0003', 1, '2024-03-12 00:00:00', '2024-03-12 10:58:56');

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
  `dateCreated` datetime DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemsaldo`
--

INSERT INTO `tabitemsaldo` (`id`, `transID`, `ingredientID`, `supplierID`, `outletID`, `amount`, `amountUsed`, `measurementID`, `itemPrice`, `totalPrice`, `saldo`, `status`, `dateCreated`, `lastChanged`) VALUES
('20240318124140', 'TRX-20240318124140', 'IGR0001', 'SPL-230613-1', 'OTL', 2, 0, 'MSR0004', 2000, 4000, 4000, 1, '2024-03-18 12:41:40', '2024-03-18 12:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `tabitemtransaction`
--

CREATE TABLE IF NOT EXISTS `tabitemtransaction` (
  `transID` varchar(30) NOT NULL,
  `transDate` date DEFAULT NULL,
  `supplierID` varchar(30) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
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
  `dateCreated` datetime DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemtransaction`
--

INSERT INTO `tabitemtransaction` (`transID`, `transDate`, `supplierID`, `outletID`, `ingredientID`, `amount`, `itemAmount`, `itemPrice`, `totalPrice`, `discount`, `discountPrice`, `afterDiscount`, `measurementID`, `userID`, `remarks`, `dateCreated`, `lastChanged`) VALUES
('TRX-20240318124140', '2024-03-18', 'SPL-230613-1', 'OTL0001', 'IGR0001', 2, 50, 2000, 4000, 0, 0, 4000, 'MSR0004', 'USR0003', '', '2024-03-18 12:41:40', '2024-03-18 12:41:40');

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
('', '2', 'OTL0001', 1, 1, '2024-03-06', '2024-03-06 20:43:22'),
('LYL-240304-1', '1', 'OTL0001', 0, 1, '2024-03-06', '2024-03-06 15:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `tabopencashier`
--

CREATE TABLE IF NOT EXISTS `tabopencashier` (
  `openID` varchar(30) NOT NULL,
  `openDate` date NOT NULL,
  `openPeriode` varchar(30) NOT NULL,
  `outletID` varchar(30) NOT NULL,
  `nominalOpen` float NOT NULL,
  PRIMARY KEY (`openID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabopencashier`
--


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
  `servCharge5` float DEFAULT NULL,
  `pb1` float DEFAULT NULL,
  `productSubtotal` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taborderdetail`
--

INSERT INTO `taborderdetail` (`id`, `orderID`, `productID`, `productAmount`, `productPrice`, `servCharge5`, `pb1`, `productSubtotal`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'PCA/RCP/202403/0001', 'PRD0002', 5, 10000, 2500, 5000, 50000, 1, '2024-03-06', '2024-03-06 15:17:23'),
('1', 'PCA/RCP/202403/0002', 'PRD0002', 1, 10000, 500, 1000, 10000, 1, '2024-03-06', '2024-03-06 20:42:35'),
('1', 'PCA/RCP/202403/0003', 'PRD0001', 1, 180000, 0, 0, 180000, 1, '2024-03-06', '2024-03-06 20:43:22'),
('2', 'PCA/RCP/202403/0003', 'PRD0002', 5, 10000, 2500, 5000, 50000, 1, '2024-03-06', '2024-03-06 20:43:22'),
('1', 'PCA/RCP/202403/0004', 'PRD0001', 1, 180000, 0, 0, 180000, 1, '2024-03-15', '2024-03-15 13:20:30'),
('1', 'PCA/RCP/202403/0005', 'PRD0001', 1, 180000, 0, 0, 180000, 1, '2024-03-15', '2024-03-15 13:22:02'),
('1', 'PCA/RCP/202403/0006', 'PRD0001', 1, 180000, 0, 0, 180000, 1, '2024-03-17', '2024-03-17 14:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `taborderheader`
--

CREATE TABLE IF NOT EXISTS `taborderheader` (
  `orderID` varchar(30) NOT NULL,
  `priceID` varchar(30) NOT NULL,
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

INSERT INTO `taborderheader` (`orderID`, `priceID`, `orderNo`, `orderDate`, `orderPeriode`, `orderAmount`, `orderMethod`, `outletID`, `payerName`, `payerPhone`, `payerEmail`, `remarks`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('PCA/RCP/202403/0001', 'PRC0001', 1, '2024-03-06', '2024-03', 5, 1, 'OTL0001', 'WILDHAN EKA', '00000', '', '', 'USR0003', 1, '2024-03-06', '2024-03-06 15:17:23'),
('PCA/RCP/202403/0002', 'PRC0001', 2, '2024-03-06', '2024-03', 1, 1, 'OTL0001', '', '', '', '', 'USR0003', 1, '2024-03-06', '2024-03-06 20:42:35'),
('PCA/RCP/202403/0003', 'PRC0001', 3, '2024-03-06', '2024-03', 6, 1, 'OTL0001', '', '', '', '', 'USR0003', 1, '2024-03-06', '2024-03-06 20:43:22'),
('PCA/RCP/202403/0004', 'PRC0001', 1, '2024-03-15', '2024-03', 1, 1, 'OTL0001', '', '', '', '', 'USR0003', 1, '2024-03-15', '2024-03-15 13:20:30'),
('PCA/RCP/202403/0005', 'PRC0001', 2, '2024-03-15', '2024-03', 1, 1, 'OTL0001', '', '', '', '', 'USR0003', 1, '2024-03-15', '2024-03-15 13:22:02'),
('PCA/RCP/202403/0006', 'PRC0001', 1, '2024-03-17', '2024-03', 1, 1, 'OTL0001', '', '', '', '', 'USR0003', 1, '2024-03-17', '2024-03-17 14:19:05');

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
  `orderMethod` varchar(30) DEFAULT NULL,
  `paymentType` varchar(30) DEFAULT NULL,
  `paymentMethod` varchar(30) DEFAULT NULL,
  `paymentAmount` float NOT NULL,
  `paymentDate` date NOT NULL,
  `paymentDateFP` date NOT NULL,
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

INSERT INTO `tabpaymentorder` (`id`, `orderID`, `orderMethod`, `paymentType`, `paymentMethod`, `paymentAmount`, `paymentDate`, `paymentDateFP`, `dpp`, `VAT`, `discountPrice`, `discountPerc`, `total`, `promoID`, `isVoucher`, `voucherID`, `remarks`, `status`, `dateCreated`, `lastChanged`) VALUES
('20240306', 'PCA/RCP/202403/0003', '1', 'null', 'PYM0002', 2.375e+009, '0000-00-00', '0000-00-00', 230000, 7500, 0, NULL, 237500, '', 0, '', '', 1, '2024-03-06', '2024-03-06 20:43:22'),
('20240306', 'PCA/RCP/202403/0002', '1', 'null', 'PYM0001', 11500, '0000-00-00', '0000-00-00', 10000, 1500, 0, NULL, 11500, '', 0, '', '', 1, '2024-03-06', '2024-03-06 20:42:35'),
('20240306', 'PCA/RCP/202403/0001', '1', 'null', 'PYM0001', 57500, '0000-00-00', '0000-00-00', 50000, 7500, 0, NULL, 57500, '', 0, '', '', 1, '2024-03-06', '2024-03-06 15:17:23'),
('20240315', 'PCA/RCP/202403/0004', '1', 'null', 'PYM0001', 180000, '0000-00-00', '0000-00-00', 180000, 0, 0, NULL, 180000, '', 0, '', '', 1, '2024-03-15', '2024-03-15 13:20:30'),
('20240315', 'PCA/RCP/202403/0005', '1', 'null', 'PYM0002', 180000, '0000-00-00', '0000-00-00', 180000, 0, 0, NULL, 180000, '', 0, '', '', 1, '2024-03-15', '2024-03-15 13:22:02'),
('20240317', 'PCA/RCP/202403/0006', '1', 'null', 'PYM0001', 180000, '0000-00-00', '0000-00-00', 180000, 0, 0, NULL, 180000, '', 0, '', '', 1, '2024-03-17', '2024-03-17 14:19:05');

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


-- --------------------------------------------------------

--
-- Table structure for table `tabpricedetail`
--

CREATE TABLE IF NOT EXISTS `tabpricedetail` (
  `id` varchar(30) DEFAULT NULL,
  `priceID` varchar(30) DEFAULT NULL,
  `productID` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `servCharge5` float DEFAULT NULL,
  `pb1` float DEFAULT NULL,
  `afterTax` float DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabpricedetail`
--

INSERT INTO `tabpricedetail` (`id`, `priceID`, `productID`, `price`, `servCharge5`, `pb1`, `afterTax`, `status`, `dateCreated`, `lastChanged`) VALUES
('20240226214401', '3', '12', 10000, 500, 1000, 11500, 1, '2024-02-26', '2024-02-26 21:44:01'),
('20240226214330', '3', '2', 180000, 0, 0, 180000, 1, '2024-02-26', '2024-02-26 21:43:30'),
('20240302090153', '3', '11', 10000, 500, 1000, 11500, 1, '2024-03-02', '2024-03-02 09:01:53'),
('20240306151535', 'PRC0001', 'PRD0001', 180000, 0, 0, 180000, 1, '2024-03-06', '2024-03-06 15:15:35'),
('20240306151641', 'PRC0001', 'PRD0002', 10000, 500, 1000, 11500, 1, '2024-03-06', '2024-03-06 15:16:41');

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
('PRC0001', 'ON STORE', 'OTL0001', '', 1, '2024-03-06', '2024-03-06 14:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `tabproducthistory`
--

CREATE TABLE IF NOT EXISTS `tabproducthistory` (
  `id` varchar(30) NOT NULL,
  `transType` varchar(5) DEFAULT NULL,
  `productID` varchar(30) NOT NULL,
  `amount` float DEFAULT NULL,
  `amountLeft` float DEFAULT NULL,
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

INSERT INTO `tabproducthistory` (`id`, `transType`, `productID`, `amount`, `amountLeft`, `measurementID`, `userID`, `status`, `remarks`, `dateCreated`, `lastChanged`) VALUES
('20240306204322', 'OUT', 'PRD0001', 1, 14, 'MSR0004', 'USR0003', 1, 'PCA/RCP/202403/0003', '2024-03-06', '2024-03-06 20:43:22'),
('20240306204235', 'OUT', 'PRD0002', 1, 9, 'MSR0004', 'USR0003', 1, 'PCA/RCP/202403/0002', '2024-03-06', '2024-03-06 20:42:35'),
('20240306204322', 'OUT', 'PRD0002', 5, 4, 'MSR0004', 'USR0003', 1, 'PCA/RCP/202403/0003', '2024-03-06', '2024-03-06 20:43:22'),
('20240312105856', 'IN', 'PRD0002', 4, 9, 'MSR0004', 'USR0003', 0, '', '2024-03-12', '2024-03-12 10:58:56'),
('20240315132030', 'OUT', 'PRD0001', 1, 13, 'MSR0004', 'USR0003', 1, 'PCA/RCP/202403/0004', '2024-03-15', '2024-03-15 13:20:30'),
('20240315132202', 'OUT', 'PRD0001', 1, 12, 'MSR0004', 'USR0003', 1, 'PCA/RCP/202403/0005', '2024-03-15', '2024-03-15 13:22:02'),
('20240317141905', 'OUT', 'PRD0001', 1, 11, 'MSR0004', 'USR0003', 1, 'PCA/RCP/202403/0006', '2024-03-17', '2024-03-17 14:19:05');

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
('20240312105758001', 'PCA/REQ/202403/0001', 'IGR0001', 5, 'MSR0004', 2, '2024-03-12', '2024-03-12 10:57:58'),
('20240312105758000', 'PCA/REQ/202403/0001', 'IGR0002', 2500, 'MSR0005', 2, '2024-03-12', '2024-03-12 10:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `tabrequestheader`
--

CREATE TABLE IF NOT EXISTS `tabrequestheader` (
  `requestID` varchar(30) NOT NULL,
  `requestDate` date DEFAULT NULL,
  `categoryID` varchar(30) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
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
('PCA/REQ/202403/0001', '2024-03-12', 'CF0002', 'OTL0001', 'PRD0002', 5, 'MSR0004', 'USR0003', 2, '', '2024-03-12', '2024-03-12 10:57:42', 0, 'USR0003', '2024-03-12', '');

-- --------------------------------------------------------

--
-- Table structure for table `tabstockhistory`
--

CREATE TABLE IF NOT EXISTS `tabstockhistory` (
  `id` varchar(30) NOT NULL,
  `transStockType` varchar(30) NOT NULL,
  `stockID` varchar(30) NOT NULL,
  `amount` float NOT NULL,
  `currentStockAmount` float NOT NULL,
  `measurementID` varchar(30) NOT NULL,
  `cost` float NOT NULL,
  `userID` varchar(30) NOT NULL,
  `status` smallint(6) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastChanged` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabstockhistory`
--

INSERT INTO `tabstockhistory` (`id`, `transStockType`, `stockID`, `amount`, `currentStockAmount`, `measurementID`, `cost`, `userID`, `status`, `dateCreated`, `lastChanged`) VALUES
('20240313110306', 'IN/RESTOCK', 'ITM0001', 2, 6, 'MSR0004', 12000, 'USR0003', 1, '2024-03-13 11:03:06', '2024-03-13 11:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `tabstocktransaction`
--

CREATE TABLE IF NOT EXISTS `tabstocktransaction` (
  `transItemID` varchar(30) NOT NULL,
  `transItemDate` date NOT NULL,
  `supplierID` varchar(30) NOT NULL,
  `stockID` varchar(30) DEFAULT NULL,
  `measurementID` varchar(30) DEFAULT NULL,
  `userID` varchar(30) DEFAULT NULL,
  `amountBuy` float DEFAULT NULL,
  `stockAmount` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `discountPrice` float DEFAULT NULL,
  `afterDiscount` float NOT NULL,
  `remarks` text,
  `status` varchar(100) DEFAULT NULL,
  `outletID` varchar(30) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`transItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabstocktransaction`
--

INSERT INTO `tabstocktransaction` (`transItemID`, `transItemDate`, `supplierID`, `stockID`, `measurementID`, `userID`, `amountBuy`, `stockAmount`, `totalPrice`, `discount`, `discountPrice`, `afterDiscount`, `remarks`, `status`, `outletID`, `dateCreated`, `lastChanged`) VALUES
('TRXI-20240313110306', '2024-03-13', 'SPL-230613-1', 'ITM0001', 'MSR0004', 'USR0003', 2, 6, 12000, 0, 0, 12000, '', NULL, 'OTL0001', '2024-03-13 00:00:00', '2024-03-13 11:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `tabtempstock`
--

CREATE TABLE IF NOT EXISTS `tabtempstock` (
  `productID` varchar(30) NOT NULL,
  `tempStock` float NOT NULL,
  `dateCreated` date NOT NULL,
  `lastChanged` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabtempstock`
--

INSERT INTO `tabtempstock` (`productID`, `tempStock`, `dateCreated`, `lastChanged`) VALUES
('PRD0002', 5, '2024-03-12', '2024-03-12 10:58:56'),
('PRD0002', 95, '2024-03-06', '2024-03-06 20:26:21');

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
('F002', 'USR0001'),
('A002', 'USR0001'),
('A001', 'USR0001'),
('F001', 'USR0001'),
('E002', 'USR0001'),
('E001', 'USR0001'),
('D003', 'USR0001'),
('D002', 'USR0001'),
('D001', 'USR0001'),
('C006', 'USR0001'),
('C005', 'USR0001'),
('C004', 'USR0001'),
('C003', 'USR0001'),
('C002', 'USR0001'),
('C001', 'USR0001'),
('B003', 'USR0001'),
('B002', 'USR0001'),
('B001', 'USR0001'),
('A003', 'USR0001'),
('F003', 'USR0001'),
('F004', 'USR0001'),
('E003', 'USR0001'),
('B004', 'USR0001'),
('A001', 'USR0002'),
('A002', 'USR0002'),
('A003', 'USR0002'),
('F004', 'USR0003'),
('F003', 'USR0003'),
('F002', 'USR0003'),
('F001', 'USR0003'),
('E003', 'USR0003'),
('E002', 'USR0003'),
('E001', 'USR0003'),
('D003', 'USR0003'),
('D002', 'USR0003'),
('D001', 'USR0003'),
('C006', 'USR0003'),
('C005', 'USR0003'),
('C004', 'USR0003'),
('C003', 'USR0003'),
('C002', 'USR0003'),
('C001', 'USR0003'),
('B004', 'USR0003'),
('B003', 'USR0003'),
('B002', 'USR0003'),
('B001', 'USR0003'),
('A003', 'USR0003'),
('A002', 'USR0003'),
('A001', 'USR0003');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
