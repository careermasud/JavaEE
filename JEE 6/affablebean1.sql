-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 01, 2013 at 04:36 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `affablebean`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains product categories, e.g., dairy, meats, etc.' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'dairy'),
(2, 'meats'),
(3, 'bakery'),
(4, 'fruit & veg');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `city_region` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `cc_number` varchar(19) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maintains customer details' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `phone`, `address`, `city_region`, `cc_number`) VALUES
(1, 'Masudul Haque', 'mhaque@utcassociates.com', '8801723264914', '82, Mohakhali, Dhaka-1212', '1', '1212121212'),
(2, 'Masud', 'shirazaeo@yahoo.com', '3232323232232323', 'dsfdsafdsafsadf', '1', '4444444'),
(3, 'Masudul Haque', 'mhaque@utcassociates.com', '2212121323232', 'dfsadfdsfsd', '1', '1212121212');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(6,2) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_number` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_order_customer` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maintains customer order details' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`id`, `amount`, `date_created`, `confirmation_number`, `customer_id`) VALUES
(1, 7.09, '2012-09-12 21:45:36', 900390628, 1),
(2, 12.57, '2012-11-25 17:58:38', 696007327, 2),
(3, 4.59, '2012-12-06 15:34:37', 415713288, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ordered_product`
--

CREATE TABLE IF NOT EXISTS `ordered_product` (
  `customer_order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`customer_order_id`,`product_id`),
  KEY `fk_ordered_product_customer_order` (`customer_order_id`),
  KEY `fk_ordered_product_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='matches products with customer orders and records their quantity';

--
-- Dumping data for table `ordered_product`
--

INSERT INTO `ordered_product` (`customer_order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 6, 2),
(2, 7, 1),
(3, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains product details' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `last_update`, `category_id`) VALUES
(1, 'milk', 1.70, 'semi skimmed (1L)', '2012-09-12 21:31:33', 1),
(2, 'cheese', 2.39, 'mild cheddar (330g)', '2012-09-12 21:31:33', 1),
(3, 'butter', 1.09, 'unsalted (250g)', '2012-09-12 21:31:33', 1),
(4, 'free range eggs', 1.76, 'medium-sized (6 eggs)', '2012-09-12 21:31:33', 1),
(5, 'organic meat patties', 2.29, 'rolled in fresh herbs<br>2 patties (250g)', '2012-09-12 21:31:34', 2),
(6, 'parma ham', 3.49, 'matured, organic (70g)', '2012-09-12 21:31:34', 2),
(7, 'chicken leg', 2.59, 'free range (250g)', '2012-09-12 21:31:34', 2),
(8, 'sausages', 3.55, 'reduced fat, pork<br>3 sausages (350g)', '2012-09-12 21:31:34', 2),
(9, 'sunflower seed loaf', 1.89, '600g', '2012-09-12 21:31:34', 3),
(10, 'sesame seed bagel', 1.19, '4 bagels', '2012-09-12 21:31:34', 3),
(11, 'pumpkin seed bun', 1.15, '4 buns', '2012-09-12 21:31:34', 3),
(12, 'chocolate cookies', 2.39, 'contain peanuts<br>(3 cookies)', '2012-09-12 21:31:34', 3),
(13, 'corn on the cob', 1.59, '2 pieces', '2012-09-12 21:31:34', 4),
(14, 'red currants', 2.49, '150g', '2012-09-12 21:31:34', 4),
(15, 'broccoli', 1.29, '500g', '2012-09-12 21:31:34', 4),
(16, 'seedless watermelon', 1.49, '250g', '2012-09-12 21:31:36', 4);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
  `ID` bigint(20) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRSTNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LASTNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`ID`, `EMAIL`, `FIRSTNAME`, `LASTNAME`) VALUES
(2, 'sdfs', 'dfsdf', 'dsdg');

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `role` smallint(6) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `creation_date`) VALUES
(1, 'masud', '0000', 1, '2012-12-09 10:23:07');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `fk_customer_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ordered_product`
--
ALTER TABLE `ordered_product`
  ADD CONSTRAINT `fk_ordered_product_customer_order` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordered_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

  
--
-- Constraints for admin table
--
CREATE  TABLE IF NOT EXISTS `admin` (
  `id` INT NOT NULL ,
  `user_name` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `role` TINYINT NULL ,
  `first_name` VARCHAR(45) NULL ,
  `last_name` VARCHAR(45) NULL ,
  `reg_date` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) );

