-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 23, 2019 at 07:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerece1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Oppo'),
(4, 'DELL'),
(5, 'HP'),
(6,'ASUS'),
(7, 'Canon');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Mobile'),
(3, 'Laptop'),
(4, 'Ipad'),
(5, 'Smart Watch'),
(6, 'Headphones'),
(7, 'Camera');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'namnv@gmail.com'),
(5, 'thanhvq@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Nam', 'namnv@gmail.com', 'Haiduong, Vietnam, Vietnam', 'Vietnam', 'Vietnam', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1,2,1,'Iphone 11 Pro', 10000,'Iphone 11 Pro','ip11pro.jpg','iphone mobile apple'),
(2,2,1,'Iphone 12 Pro', 12000,'Iphone 12 Pro','ip12pro.jpg','iphone mobile apple'),
(3,2,1,'Iphone 13 Pro', 14000,'Iphone 13 Pro','ip13pro.jpg','iphone mobile apple'),
(4,2,1,'Iphone 14 Pro', 16000,'Iphone 14 Pro','ip14pro.jpg','iphone mobile apple'),
(5,2,1,'Iphone 11 Pro Max', 15000,'Iphone 11 Pro Max','ip11prm.jpg','iphone mobile apple'),
(6,2,1,'Iphone 12 Pro Max', 18000,'Iphone 12 Pro Max','ip12prm.jpg','iphone mobile apple'),
(7,2,1,'Iphone 13 Pro Max', 20000,'Iphone 13 Pro Max','ip13prm.jpg','iphone mobile apple'),
(8,2,1,'Iphone 14 Pro Max', 22000,'Iphone 14 Pro Max','ip14prm.jpg','iphone mobile apple'),
(9,2,2,'Samsung Galaxy S22 Ultra', 20000,'Samsung Galaxy S22 Ultra','sss22.jpg','samsung mobile'),
(10,2,2,'Samsung Galaxy A71', 12000,'Samsung Galaxy A71','ssa71.jpg','samsung mobile'),
(11,2,2,'Samsung Galaxy Note 10', 15000,'Samsung Galaxy Note 10','ssn10.jpg','samsung mobile'),
(12,2,2,'Samsung Galaxy A23 Ultra', 10000,'Samsung Galaxy A23 Ultra','ssa23.jpg','samsung mobile'),
(13,2,2,'Samsung Galaxy A51', 13000,'Samsung Galaxy A51','ssa51.jpg','samsung mobile'),
(14,2,3,'Oppo A92', 10000,'Oppo A92','oppoa92.jpg','oppo mobile'),
(15,2,3,'Oppo A93', 13000,'Oppo A93','oppoa93.jpg','oppo mobile'),
(16,2,3,'Oppo Reno 4', 15000,'Oppo Reno','oppor4.jpg','oppo mobile'),
(17,2,3,'Oppo F9', 8000,'Oppo F9','oppof9.jpg','oppo mobile'),
(18,3,1,'Macbook Pro', 30000,'Macbook Pro','macpro.jpg','macbook laptop apple'),
(19,3,1,'Macbook Air', 16000,'Macbook Air','macair.jpg','macbook laptop apple'),
(20,3,4,'Laptop DELL', 17000,'Laptop DELL','dell.jpg','laptop dell'),
(21,3,5,'Laptop HP', 14000,'Laptop HP','hp.jpg','laptop hp'),
(22,3,6,'Latop ASUS', 15000,'Latop ASUS','asus.jpg','laptop asus'),
(23,4,1,'Ipad Air', 12000,'Ipad Air','ipadair.jpg','ipad apple'),
(24,4,1,'Ipad Pro', 16000,'Ipad Pro','ipadpro.jpg','ipad apple'),
(26,4,2,'Samsung Galaxy Tab A8 (2022)', 10000,'Samsung Galaxy Tab A8 (2022)','samsung-galaxy-tab-a8.jpg','ipad samsung'),
(27,4,2,'Samsung Galaxy Tab S8 Ultra 5G', 12000,'Samsung Galaxy Tab S8 Ultra 5G','samsung-tab-s8-ultra.jpg','ipad samsung'),
(28,4,3,'OPPO Pad Air 128GB', 14000,'OPPO Pad Air 128GB','oppo-pad-air.jpeg','oppo ipad'),
(29,5,2,'Samsung Galaxy Watch5 40mm dây silicone', 16000,'Samsung Galaxy Watch5 40mm dây silicone','samsung-galaxy-watch5.jpg','smartwatch samsung'),
(30,5,1,'Apple Watch SE 2022 40mm viền nhôm dây silicone', 15000,'Apple Watch SE 2022 40mm viền nhôm dây silicone','apple-watch-se-2022.jpg','smartwatch apple'),
(31,5,2,'Samsung Galaxy Watch4 LTE Classic 46mm dây silicone', 18000,'Samsung Galaxy Watch4 LTE Classic 46mm dây silicone','samsung-galaxy-watch-4-lte.jpg','smartwatch samsung'),
(32,5,2,'Samsung Galaxy Watch4 40mm dây silicone', 20000,'Samsung Galaxy Watch4 40mm dây silicone','samsung-galaxy-watch-4.jpg','smartwatch samsung'),
(33,5,1,'Apple Watch S8 LTE 41mm viền thép dây silicone', 22000,'Apple Watch S8 LTE 41mm viền thép dây silicone','apple-watch-s8-lte-41mm.jpg','smartwatch apple'),
(34,6,2,'Tai nghe Bluetooth Chụp Tai AirPods Max Apple', 20000,'Tai nghe Bluetooth Chụp Tai AirPods Max Apple','bluetooth-airpods-max-apple-thumb3-600x600.jpeg','iphone Headphone'),
(35,6,1,'Tai nghe Có Dây Apple MMTN2', 12000,'Tai nghe Có Dây Apple MMTN2','tai-nghe-earpods-cong-lightning-apple-mmtn2-14-600x600.jpg','iphone Headphone'),
(36,6,3,'Tai nghe Bluetooth True Wireless OPPO ENCO Buds 2 ETE41', 15000,'Tai nghe Bluetooth True Wireless OPPO ENCO Buds 2 ETE41','tai-nghe-bluetooth-tws-oppo-enco-buds-2-ete41-trang-thumb1-1-600x600.jpeg','oppo Headphone'),
(37,6,2,'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds 2 Pro', 10000,'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds 2 Pro','bluetooth-true-wireless-samsung-galaxy-buds2-pro-trang-600x600.jpg','samsung Headphone'),
(38,6,3,'Tai nghe Có Dây OPPO MH320', 13000,'Tai nghe Có Dây OPPO MH320','co-day-ep-oppo-mh320-11-600x600.jpg','oppo Headphone'),
(39,7,7,'Canon R10', 10000,'Canon R10','10052800-may-anh-canon-eos-r10-kit-18-45mm-stm-1.jpg','camera canon'),
(40,7,7,'Canon 3000D', 13000,'Canon 3000D','10036326-may-anh-canon-eos-3000d-kit-ef-s-18-55mm-den-1.jpg','canon camera'),
(41,7,7,'Canon 50M', 15000,'Canon 50M','10036327-may-anh-canon-eos-m50-kit-15-45mm-den-1.jpg','canon camera')

;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Nam', 'Nguyen', 'namnv@gmail.com', '123456', '9448121558', 'Haiduong', 'Vietnam'),
(15, 'Thanh', 'Vu', 'thanhvq@gmail.com', '123456', '536487276', 'Quangninh', 'Vietnam'),
(16, 'Tu', 'Nguyen', 'tung@gmail.com', '123456', '9877654334', 'Bacninh', 'Vietnam'),
(19, 'Thanh', 'Le', 'thanhlv@gmail.com', '123456', '9871236534', 'Bacninh', 'Vietnam'),
(21, 'Duy', 'Hoang', 'duyht@gmail.com', '123456', '20255501', 'Thaibinh', 'Vietnam'),
(22, 'Trang', 'Tran', 'trangtt@gmail.com', '123456', '9877654334', 'Nghean', 'Vietnam'),
(23, 'Nhung', 'Pham', 'nhungpt@gmail.com', '123456', '9876543234', 'Hanoi', 'Vietnam'),
(24, 'Thang', 'Then', 'thangtm@gmail.com', '123456', '9535688928', 'Tuyenquang', 'Vietnam'),
(25, 'Huong', 'Nguyen', 'huongnt@gmail.com', '123456', '9535688928', 'Thaibinh', 'Vietnam');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Nam', 'Nguyen', 'namnv@gmail.com', '123456', '9448121558', 'Haiduong', 'Vietnam'),
(15, 'Thanh', 'Vu', 'thanhvq@gmail.com', '123456', '536487276', 'Quangninh', 'Vietnam'),
(16, 'Tu', 'Nguyen', 'tung@gmail.com', '123456', '9877654334', 'Bacninh', 'Vietnam'),
(19, 'Thanh', 'Le', 'thanhlv@gmail.com', '123456', '9871236534', 'Bacninh', 'Vietnam'),
(21, 'Duy', 'Hoang', 'duyht@gmail.com', '123456', '202-555-01', 'Thaibinh', 'Vietnam'),
(22, 'Trang', 'Tran', 'trangtt@gmail.com', '123456', '9877654334', 'Nghean', 'Vietnam'),
(23, 'Nhung', 'Pham', 'nhungpt@gmail.com', '123456', '9876543234', 'Hanoi', 'Vietnam'),
(24, 'Thang', 'Then', 'thangtm@gmail.com', '123456', '9535688928', 'Tuyenquang', 'Vietnam'),
(25, 'Huong', 'Nguyen', 'huongnt@gmail.com', '123456', '9535688928', 'Thaibinh', 'Vietnam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
