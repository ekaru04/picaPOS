-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 19, 2022 at 11:34 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `picaposdb`
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
('1', 'CATA', 'CAT', 'Category A', 1, '2022-10-12', '2022-10-12 09:04:44'),
('2', 'CATB', 'CB', 'Category B', 0, '2022-10-12', '2022-10-12 09:05:52');

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
('1', 'MARKETING', 1, '2022-10-12', '2022-10-12 11:40:06'),
('2', 'PRODUCTION', 1, '2022-10-12', '2022-10-12 11:41:44');

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
('100', 'TEPUNG TERIGU', 110, 100, '1', '2', 'TEPUNGS', 1, '2022-10-11', '2022-10-18 10:10:10'),
('2', 'TELUR', NULL, 100, '1', '1', 'Telur Ayam', 0, '2022-10-11', '2022-10-11 22:02:16'),
('3', 'TELUR', 100, 100, '1', '2', 'Tambah stok 100', 1, '2022-10-12', '2022-10-12 19:15:18'),
('4', 'COKLAT BATANG', 30, 50, '1', '1', 'tambah 10', 1, '2022-10-12', '2022-10-12 21:15:42'),
('5', 'GULA', 200, 100, '1', '1', 'Tambah Stok 200gram', 1, '2022-10-13', '2022-10-13 08:33:55');

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
('3', 'MILILITERS', 'ML', 'Mililiter', 0, '2022-10-12', '2022-10-12 08:36:00');

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
('1', 'PICA BAKERY HR', 'HR MUHAMMAD', '', 'jl mayjen hr muhammad', 1, '2022-10-13', '2022-10-13 14:59:53');

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
('2', 'QRIS', 'QRIS', 'SCAN QRIS', 0, '2022-10-12', '2022-10-12 14:40:48');

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
('2', 'STRIKER', 1, '2022-10-12', '2022-10-12 11:58:01');

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
('1', 'BROWN BREAD', '1', '1', 10, 10, '1', '1', 15000, 'a751db301d6c5619f5b4c61d879fa805_collage_450.jpg', 'Brown Bread Brand New', 1, '2022-10-18', '2022-10-18 10:39:57');

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
('2', 'ROTI BIASA', '1', 'a', 1, '2022-10-13', '2022-10-13 12:19:38'),
('1', 'ROTI COKLAT', '1', 'qwr', 1, '2022-10-12', '2022-10-12 21:50:51');

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
('20221013121947', '2', '5', 100, 0, '2022-10-13', '2022-10-17 13:13:40'),
('20221013121954', '2', '100', 100, 1, '2022-10-13', '2022-10-13 12:19:54'),
('20221013122003', '2', '3', 120, 1, '2022-10-13', '2022-10-13 12:20:03');

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
('SPL-221017-2', 'PT AF', 'F', '3216784609473256', 'FAHMI', 'werqg', 1, '2022-10-17', '2022-10-17 09:40:02'),
('SPL-221017-1', 'PT INDOFOOD1', 'B', '3256262', 'FAHMI', 'awf', 1, '2022-10-17', '2022-10-17 11:03:22');

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
('1', '1', 'eka04', '12345', 'eka', '1', '2', '1', 1, '2022-10-12', '2022-10-12 14:48:00'),
('2', '', 'fahmi123', '41851c2c39e9729d51870dc74e098950', '', '', '2', '2', 1, '2022-10-12', '2022-10-12 15:31:16'),
('3', '', 'dandi05', 'faa949f349bab935edc110911c0f235f', '', '', '2', '2', 1, '2022-10-12', '2022-10-12 15:52:13'),
('4', '', 'test11', 'f696282aa4cd4f614aa995190cf442fe', '', '', '2', '2', 1, '2022-10-12', '2022-10-12 15:53:03'),
('5', '', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', '', '', '2', '2', 0, '2022-10-14', '2022-10-17 14:21:40'),
('6', '', 'saf', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '', '1', '1', '1', 1, '2022-10-18', '2022-10-18 10:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `mvoucher`
--

CREATE TABLE IF NOT EXISTS `mvoucher` (
  `voucherCode` varchar(50) NOT NULL,
  `voucherName` varchar(100) DEFAULT NULL,
  `voucherType` varchar(25) DEFAULT NULL,
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

INSERT INTO `mvoucher` (`voucherCode`, `voucherName`, `voucherType`, `expDate`, `description`, `status`, `dateCreated`, `lastChanged`) VALUES
('D41D8-CD98F-00B20-4E980-0998E-CF842-7E', 'GRANDOP1', 'NEWGRAND', '2022-10-18', 'eqt', 0, '2022-10-17', '2022-10-17 18:54:19'),
('C81E7-28D9D-4C2F6-36F06-7F89C-C1486-2C', 'NEW GRANDOP', 'NEWGRAND', '2022-10-19', 'tes', 0, '2022-10-17', '2022-10-17 18:59:11'),
('3634D-444D2-8599', 'ERW', 'G', '2022-10-22', '34', 0, '2022-10-17', '2022-10-17 19:02:21');

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
('1', 'IN', '4', 10, 30, '1', 90000, '1', 1, '2022-10-19', '2022-10-19 11:34:01');

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
  `status` smallint(6) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastChanged` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabitemsaldo`
--

INSERT INTO `tabitemsaldo` (`id`, `transID`, `ingredientID`, `supplierID`, `outletID`, `amount`, `amountUsed`, `measurementID`, `itemPrice`, `totalPrice`, `status`, `dateCreated`, `lastChanged`) VALUES
('1', 'TRS-221019113401', '4', 'SPL-221017-1', '1', 10, 0, '1', 10000, 90000, 1, '2022-10-19', '2022-10-19 11:34:01');

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
('TRS-221019113401', '2022-10-19', 'SPL-221017-1', '1', '4', 10, 30, 10000, 100000, 10, 10000, '1', '1', 'Harusnya 90k', '2022-10-19', '2022-10-19 11:34:01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
