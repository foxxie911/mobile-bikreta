-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 12:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Xiaomi'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Motorolla'),
(5, 'Realme'),
(6, 'Asus'),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(71, 61, '127.0.0.1', -1, 1),
(154, 71, '127.0.0.1', 28, 1),
(155, 71, '127.0.0.1', 1, 1),
(156, 1, '127.0.0.1', -1, 1),
(157, 1, '127.0.0.1', 1, 1),
(158, 2, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Mobile'),
(2, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(6, 'user123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung Galaxy S24 Ultra', 980, 'Network 	Technology 	\nGSM / CDMA / HSPA / EVDO / LTE / 5G\nLaunch 	Announced 	2024, January 17\nStatus 	Available. Released 2024, January 24\nBody 	Dimensions 	162.3 x 79 x 8.6 mm (6.39 x 3.11 x 0.34 in)\nWeight 	232 g or 233 g (8.18 oz)\nBuild 	Glass front (Corning Gorilla Armor), glass back (Corning Gorilla Armor), titanium frame (grade 2)\nSIM 	Nano-SIM and eSIM/ Dual eSIM or Dual SIM (2 Nano-SIMs and eSIM, dual stand-by)\n 	IP68 dust/water resistant (up to 1.5m for 30 min)\nStylus (Bluetooth integration, accelerometer, gyro)\nDisplay 	Type 	Dynamic LTPO AMOLED 2X, 120Hz, HDR10+, 2600 nits (peak)\nSize 	6.8 inches, 113.5 cm2 (~88.5% screen-to-body ratio)\nResolution 	1440 x 3120 pixels, 19.5:9 ratio (~505 ppi density)\nProtection 	Corning Gorilla Armor\n 	Always-on display\nPlatform 	OS 	Android 14, One UI 6.1\nChipset 	Qualcomm SM8650-AC Snapdragon 8 Gen 3 (4 nm)\nCPU 	8-core (1x3.39GHz Cortex-X4 & 3x3.1GHz Cortex-A720 & 2x2.9GHz Cortex-A720 & 2x2.2GHz Cortex-A520)\nGPU 	Adreno 750 (1 GHz)\nMemory 	Card slot 	No\nInternal 	256GB 12GB RAM, 512GB 12GB RAM, 1TB 12GB RAM\n 	UFS 4.0\nMain Camera 	Quad 	200 MP, f/1.7, 24mm (wide), 1/1.3\", 0.6µm, multi-directional PDAF, Laser AF, OIS\n10 MP, f/2.4, 67mm (telephoto), 1/3.52\", 1.12µm, PDAF, OIS, 3x optical zoom\n50 MP, f/3.4, 111mm (periscope telephoto), 1/2.52\", 0.7µm, PDAF, OIS, 5x optical zoom\n12 MP, f/2.2, 13mm, 120? (ultrawide), 1/2.55\", 1.4µm, dual pixel PDAF, Super Steady video\nFeatures 	LED flash, auto-HDR, panorama\nVideo 	8K@24/30fps, 4K@30/60/120fps, 1080p@30/60/240fps, HDR10+, stereo sound rec., gyro-EIS\nSelfie camera 	Single 	12 MP, f/2.2, 26mm (wide), dual pixel PDAF\nFeatures 	Dual video call, Auto-HDR, HDR10+\nVideo 	4K@30/60fps, 1080p@30fps\nSound 	Loudspeaker 	Yes, with stereo speakers\n3.5mm jack 	No\n 	32-bit/384kHz audio\nTuned by AKG\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6e/7, tri-band, Wi-Fi Direct\nBluetooth 	5.3, A2DP, LE\nPositioning 	GPS, GLONASS, BDS, GALILEO, QZSS\nNFC 	Yes\nRadio 	No\nUSB 	USB Type-C 3.2, DisplayPort 1.2, OTG\nFeatures 	Sensors 	Fingerprint (under display, ultrasonic), accelerometer, gyro, proximity, compass, barometer\n 	Samsung DeX, Samsung Wireless DeX (desktop experience support)\nUltra Wideband (UWB) support\nBattery 	Type 	Li-Ion 5000 mAh, non-removable\nCharging 	45W wired, PD3.0, 65% in 30 min (advertised)\n15W wireless (Qi/PMA)\n4.5W reverse wireless\nMisc 	Colors 	Titanium Black, Titanium Gray, Titanium Violet, Titanium Yellow, Titanium Blue, Titanium Green, Titanium Orange\nModels 	SM-S928B, SM-S928B/DS, SM-S928U, SM-S928U1, SM-S928W, SM-S928N, SM-S9280, SM-S928E, SM-S928E/DS\nSAR 	1.26 W/kg (head)     0.62 W/kg (body)    \nSAR EU 	1.06 W/kg (head)     1.30 W/kg (body)    \nPrice 	$?1,062.00 / €?499.00 / £?925.00 / ??112,290\nTests 	Performance 	AnTuTu: 1453497 (v9), 1823822 (v10)\nGeekBench: 7076 (v6)\n3DMark Wild Life: 17931 (offscreen 1440p)\nDisplay 	Contrast ratio: Infinite (nominal)\nCamera 	Photo / Video\nLoudspeaker 	-24.6 LUFS (Very good)\nBattery (new) 	\nActive use score 13:49h', 'samsung-galaxy-s24-ultra.jpg', 'Samsung S24'),
(2, 1, 2, 'Samsung Galaxy M15', 250, 'Network 	Technology 	\nGSM / HSPA / LTE / 5G\nLaunch 	Announced 	2024, March 04\nStatus 	Available. Released 2024, March 11\nBody 	Dimensions 	160.1 x 76.8 x 9.3 mm (6.30 x 3.02 x 0.37 in)\nWeight 	217 g (7.65 oz)\nBuild 	Glass front, plastic back, plastic frame\nSIM 	Hybrid Dual SIM (Nano-SIM, dual stand-by)\nDisplay 	Type 	Super AMOLED, 90Hz\nSize 	6.6 inches, 106.9 cm2 (~87.0% screen-to-body ratio)\nResolution 	1080 x 2340 pixels, 19.5:9 ratio (~390 ppi density)\nPlatform 	OS 	Android 14, One UI 6\nChipset 	Mediatek Dimensity 6100+ (6 nm)\nCPU 	Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)\nGPU 	Mali-G57 MC2\nMemory 	Card slot 	microSDXC (uses shared SIM slot)\nInternal 	128GB 4GB RAM, 128GB 6GB RAM, 128GB 8GB RAM', 'samsung-galaxy-m15.jpg', 'Samsung M15'),
(3, 1, 2, 'Samsung Galaxy C55', 520, 'Network 	Technology 	\r\nGSM / HSPA / LTE / 5G\r\nLaunch 	Announced 	2024, April 22\r\nStatus 	Available. Released 2024, April 22\r\nBody 	Dimensions 	163.9 x 76.5 x 7.8 mm (6.45 x 3.01 x 0.31 in)\r\nWeight 	180 g (6.35 oz)\r\nBuild 	Glass front, silicone polymer (eco leather) back, plastic frame\r\nSIM 	Hybrid Dual SIM (Nano-SIM, dual stand-by)\r\nDisplay 	Type 	Super AMOLED+, 120Hz, 1000 nits (HBM)\r\nSize 	6.7 inches, 108.4 cm2 (~86.4% screen-to-body ratio)\r\nResolution 	1080 x 2400 pixels, 20:9 ratio (~393 ppi density)\r\n 	Always-on display\r\nPlatform 	OS 	Android 14, One UI 6.1\r\nChipset 	Qualcomm SM7450-AB Snapdragon 7 Gen 1 (4 nm)\r\nCPU 	Octa-core (1x2.4 GHz Cortex-A710 & 3x2.36 GHz Cortex-A710 & 4x1.8 GHz Cortex-A510)\r\nGPU 	Adreno 644\r\nMemory 	Card slot 	microSDXC (uses shared SIM slot)\r\nInternal 	256GB 8GB RAM, 256GB 12GB RAM\r\nMain Camera 	Triple 	50 MP, f/1.8, (wide), 1/1.56\", 1.0µm, PDAF, OIS\r\n8 MP, f/2.2, 123? (ultrawide)\r\n2 MP, f/2.4, (macro)\r\nFeatures 	LED flash, panorama, HDR\r\nVideo 	4K@30fps, 1080p@30/60fps, gyro-EIS, OIS\r\nSelfie camera 	Single 	50 MP, f/2.4, (wide)\r\nVideo 	4K@30fps, 1080p@30/60fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	No\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct\r\nBluetooth 	5.2, A2DP, LE\r\nPositioning 	GPS, GALILEO, GLONASS, BDS, QZSS\r\nNFC 	Yes\r\nRadio 	No\r\nUSB 	USB Type-C 2.0, OTG\r\nFeatures 	Sensors 	Fingerprint (under display, optical), accelerometer, gyro, proximity, compass\r\nBattery 	Type 	5000 mAh, non-removable\r\nCharging 	45W wired\r\nMisc 	Colors 	Black, Orange\r\nModels 	SM-C5560', 'samsung-galaxy-c55.jpg', 'Samsung C55'),
(4, 1, 2, 'Samsung Galaxy A35', 450, 'Network 	Technology 	\r\nGSM / HSPA / LTE / 5G\r\nLaunch 	Announced 	2024, March 11\r\nStatus 	Available. Released 2024, March 15\r\nBody 	Dimensions 	161.7 x 78 x 8.2 mm (6.37 x 3.07 x 0.32 in)\r\nWeight 	209 g (7.37 oz)\r\nBuild 	Glass front (Gorilla Glass Victus+), plastic frame, glass back\r\nSIM 	Nano-SIM, eSIM or Hybrid SIM (Nano-SIM, dual stand-by)\r\n 	IP67 dust/water resistant (up to 1m for 30 min)\r\nDisplay 	Type 	Super AMOLED, 120Hz, 1000 nits (HBM)\r\nSize 	6.6 inches, 106.9 cm2 (~84.8% screen-to-body ratio)\r\nResolution 	1080 x 2340 pixels, 19.5:9 ratio (~390 ppi density)\r\nProtection 	Corning Gorilla Glass Victus+\r\n 	Always-on display\r\nPlatform 	OS 	Android 14, One UI 6.1\r\nChipset 	Exynos 1380 (5 nm)\r\nCPU 	Octa-core (4x2.4 GHz Cortex-A78 & 4x2.0 GHz Cortex-A55)\r\nGPU 	Mali-G68 MP5\r\nMemory 	Card slot 	microSDXC (uses shared SIM slot)\r\nInternal 	128GB 6GB RAM, 128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM\r\nMain Camera 	Triple 	50 MP, f/1.8, (wide), 1/1.96\", PDAF, OIS\r\n8 MP, f/2.2, 123?, (ultrawide), 1/4.0\", 1.12µm\r\n5 MP, f/2.4, (macro)\r\nFeatures 	LED flash, panorama, HDR\r\nVideo 	4K@30fps, 1080p@30/60fps, gyro-EIS\r\nSelfie camera 	Single 	13 MP, f/2.2, (wide), 1/3.06\", 1.12µm\r\nVideo 	4K@30fps, 1080p@30fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	No\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct\r\nBluetooth 	5.3, A2DP, LE\r\nPositioning 	GPS, GALILEO, GLONASS, BDS, QZSS\r\nNFC 	Yes (market/region dependent)\r\nRadio 	No\r\nUSB 	USB Type-C 2.0, OTG\r\nFeatures 	Sensors 	Fingerprint (under display, optical), accelerometer, gyro, compass\r\n 	Virtual proximity sensing\r\nBattery 	Type 	Li-Ion 5000 mAh, non-removable\r\nCharging 	25W wired\r\nMisc 	Colors 	Iceblue, Lilac, Navy\r\nModels 	SM-A356E, SM-A356E/DS, SM-A356B, SM-A356B/DS\r\nSAR 	0.81 W/kg (head)    \r\nSAR EU 	0.44 W/kg (head)     0.92 W/kg (body)    \r\nPrice 	$?322.00 / €?284.00 / £?305.49 / ??26,899\r\nTests 	Performance 	AnTuTu: 522829 (v9), 603441 (v10)\r\nGeekBench: 2740 (v5), 2931 (v6)\r\n3DMark Wild life: 2751 (offscreen 1440p)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nLoudspeaker 	-26.1 LUFS (Good)\r\nBattery (new) 	\r\nActive use score 12:26h', 'samsung-galaxy-a35.jpg', 'Samsung A35'),
(5, 1, 3, 'Apple Ipad Pro 12.9 (2022)', 1490, 'Network 	Technology 	\r\nGSM / HSPA / LTE / 5G\r\nLaunch 	Announced 	2022, October 18\r\nStatus 	Available. Released 2022, October 26\r\nBody 	Dimensions 	280.6 x 214.9 x 6.4 mm (11.05 x 8.46 x 0.25 in)\r\nWeight 	682 g (Wi-Fi), 685 g (5G) (1.50 lb)\r\nBuild 	Glass front, aluminum back, aluminum frame\r\nSIM 	Nano-SIM and eSIM\r\n 	Stylus support (Bluetooth integration; magnetic)\r\nDisplay 	Type 	Liquid Retina XDR mini-LED LCD, 120Hz, HDR10, Dolby Vision, 1000 nits (typ), 1600 nits (peak)\r\nSize 	12.9 inches, 515.3 cm2 (~85.4% screen-to-body ratio)\r\nResolution 	2048 x 2732 pixels, 4:3 ratio (~265 ppi density)\r\nProtection 	Scratch-resistant glass, oleophobic coating\r\nPlatform 	OS 	iPadOS 16.1, upgradable to iPadOS 17.4\r\nChipset 	Apple M2\r\nCPU 	Octa-core\r\nGPU 	Apple GPU (10-core graphics)\r\nMemory 	Card slot 	No\r\nInternal 	128GB 8GB RAM, 256GB 8GB RAM, 512GB 8GB RAM, 1TB 16GB RAM, 2TB 16GB RAM\r\nMain Camera 	Dual 	12 MP, f/1.8, (wide), 1/3.0\", 1.22µm, dual pixel PDAF\r\n10 MP, f/2.4, 125? (ultrawide)\r\nTOF 3D LiDAR scanner (depth)\r\nFeatures 	Quad-LED dual-tone flash, HDR\r\nVideo 	4K@24/25/30/60fps, 1080p@25/30/60/120/240fps; gyro-EIS, ProRes, Cinematic mode (4K, 1080p)\r\nSelfie camera 	Single 	12 MP, f/2.4, 122? (ultrawide)\r\nFeatures 	Face detection, HDR, panorama\r\nVideo 	1080p@25/30/60fps, gyro-EIS, HDR\r\nSound 	Loudspeaker 	Yes, with stereo speakers (4 speakers)\r\n3.5mm jack 	No\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6e, dual-band, hotspot\r\nBluetooth 	5.3, A2DP, LE, EDR\r\nPositioning 	GPS, GLONASS, GALILEO, QZSS (Wi?Fi + Cellular model only)\r\nNFC 	No\r\nRadio 	No\r\nUSB 	USB Type-C 4 (Thunderbolt 4), DisplayPort, magnetic connector\r\nFeatures 	Sensors 	Face ID, accelerometer, gyro, barometer\r\nBattery 	Type 	Li-Po 10758 mAh (40.88 Wh), non-removable\r\nMisc 	Colors 	Silver, Space Gray\r\nModels 	A2764, A2437, A2766, A2436, iPad14,5, iPad14,6\r\nPrice 	About 1450 EUR', 'apple-ipad-pro-2022.jpg', 'Apple Ipad ipad ipadpro'),
(6, 1, 3, 'Apple iPhone 15', 635, 'Network 	Technology 	\r\nGSM / CDMA / HSPA / EVDO / LTE / 5G\r\nLaunch 	Announced 	2023, September 12\r\nStatus 	Available. Released 2023, September 22\r\nBody 	Dimensions 	147.6 x 71.6 x 7.8 mm (5.81 x 2.82 x 0.31 in)\r\nWeight 	171 g (6.03 oz)\r\nBuild 	Glass front (Corning-made glass), glass back (Corning-made glass), aluminum frame\r\nSIM 	Nano-SIM and eSIM - International\r\nDual eSIM with multiple numbers - USA\r\nDual SIM (Nano-SIM, dual stand-by) - China\r\n 	IP68 dust/water resistant (up to 6m for 30 min)\r\nApple Pay (Visa, MasterCard, AMEX certified)\r\nDisplay 	Type 	Super Retina XDR OLED, HDR10, Dolby Vision, 1000 nits (HBM), 2000 nits (peak)\r\nSize 	6.1 inches, 91.3 cm2 (~86.4% screen-to-body ratio)\r\nResolution 	1179 x 2556 pixels, 19.5:9 ratio (~461 ppi density)\r\nProtection 	Ceramic Shield glass\r\nPlatform 	OS 	iOS 17, upgradable to iOS 17.4\r\nChipset 	Apple A16 Bionic (4 nm)\r\nCPU 	Hexa-core (2x3.46 GHz Everest + 4x2.02 GHz Sawtooth)\r\nGPU 	Apple GPU (5-core graphics)\r\nMemory 	Card slot 	No\r\nInternal 	128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM\r\n 	NVMe\r\nMain Camera 	Dual 	48 MP, f/1.6, 26mm (wide), 1/1.56\", 1.0µm, dual pixel PDAF, sensor-shift OIS\r\n12 MP, f/2.4, 13mm, 120? (ultrawide)\r\nFeatures 	Dual-LED dual-tone flash, HDR (photo/panorama)\r\nVideo 	4K@24/25/30/60fps, 1080p@25/30/60/120/240fps, HDR, Dolby Vision HDR (up to 60fps), Cinematic mode (4K@30fps), stereo sound rec.\r\nSelfie camera 	Single 	12 MP, f/1.9, 23mm (wide), 1/3.6\", PDAF\r\nSL 3D, (depth/biometrics sensor)\r\nFeatures 	HDR, Cinematic mode (4K@30fps)\r\nVideo 	4K@24/25/30/60fps, 1080p@25/30/60/120fps, gyro-EIS\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	No\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, hotspot\r\nBluetooth 	5.3, A2DP, LE\r\nPositioning 	GPS, GLONASS, GALILEO, BDS, QZSS\r\nNFC 	Yes\r\nRadio 	No\r\nUSB 	USB Type-C 2.0, DisplayPort\r\nFeatures 	Sensors 	Face ID, accelerometer, gyro, proximity, compass, barometer\r\n 	Ultra Wideband 2 (UWB) support\r\nEmergency SOS via satellite (SMS sending/receiving)\r\nBattery 	Type 	Li-Ion 3349 mAh, non-removable\r\nCharging 	Wired, PD2.0, 50% in 30 min (advertised)\r\n15W wireless (MagSafe)\r\n15W wireless (Qi2) - requires iOS 17.2 update\r\n4.5W reverse wired\r\nMisc 	Colors 	Black, Blue, Green, Yellow, Pink\r\nModels 	A3090, A2846, A3089, A3092, iPhone15,4\r\nSAR 	1.12 W/kg (head)     1.14 W/kg (body)    \r\nSAR EU 	0.98 W/kg (head)     0.98 W/kg (body)    \r\nPrice 	$?634.81 / €?753.81 / £?607.49 / ??73,100\r\nTests 	Performance 	AnTuTu: 1354651 (v10)\r\nGeekBench: 6526 (v6)\r\nGFXBench: 60fps (ES 3.1 onscreen)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nCamera 	Photo / Video\r\nLoudspeaker 	-26.2 LUFS (Good)\r\nBattery (new) 	\r\nActive use score 13:20h\r\nBattery (old) 	\r\nEndurance rating 98h', 'apple-iphone-15.jpg', 'Apple iphone iPhone'),
(7, 1, 3, 'Apple iPhone 14', 450, 'Network 	Technology 	\r\nGSM / CDMA / HSPA / EVDO / LTE / 5G\r\nLaunch 	Announced 	2022, September 07\r\nStatus 	Available. Released 2022, September 16\r\nBody 	Dimensions 	146.7 x 71.5 x 7.8 mm (5.78 x 2.81 x 0.31 in)\r\nWeight 	172 g (6.07 oz)\r\nBuild 	Glass front (Corning-made glass), glass back (Corning-made glass), aluminum frame\r\nSIM 	Nano-SIM and eSIM - International\r\nDual eSIM with multiple numbers - USA\r\nDual SIM (Nano-SIM, dual stand-by) - China\r\n 	IP68 dust/water resistant (up to 6m for 30 min)\r\nApple Pay (Visa, MasterCard, AMEX certified)\r\nDisplay 	Type 	Super Retina XDR OLED, HDR10, Dolby Vision, 800 nits (HBM), 1200 nits (peak)\r\nSize 	6.1 inches, 90.2 cm2 (~86.0% screen-to-body ratio)\r\nResolution 	1170 x 2532 pixels, 19.5:9 ratio (~460 ppi density)\r\nProtection 	Ceramic Shield glass\r\nPlatform 	OS 	iOS 16, upgradable to iOS 17.4\r\nChipset 	Apple A15 Bionic (5 nm)\r\nCPU 	Hexa-core (2x3.23 GHz Avalanche + 4x1.82 GHz Blizzard)\r\nGPU 	Apple GPU (5-core graphics)\r\nMemory 	Card slot 	No\r\nInternal 	128GB 6GB RAM, 256GB 6GB RAM, 512GB 6GB RAM\r\n 	NVMe\r\nMain Camera 	Dual 	12 MP, f/1.5, 26mm (wide), 1/1.7\", 1.9µm, dual pixel PDAF, sensor-shift OIS\r\n12 MP, f/2.4, 13mm, 120? (ultrawide)\r\nFeatures 	Dual-LED dual-tone flash, HDR (photo/panorama)\r\nVideo 	4K@24/25/30/60fps, 1080p@25/30/60/120/240fps, HDR, Dolby Vision HDR (up to 60fps), Cinematic mode (4K@30fps), stereo sound rec.\r\nSelfie camera 	Single 	12 MP, f/1.9, 23mm (wide), 1/3.6\", PDAF\r\nSL 3D, (depth/biometrics sensor)\r\nFeatures 	HDR, Cinematic mode (4K@30fps)\r\nVideo 	4K@24/25/30/60fps, 1080p@25/30/60/120fps, gyro-EIS\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	No\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, hotspot\r\nBluetooth 	5.3, A2DP, LE\r\nPositioning 	GPS, GLONASS, GALILEO, BDS, QZSS\r\nNFC 	Yes\r\nRadio 	No\r\nUSB 	Lightning, USB 2.0\r\nFeatures 	Sensors 	Face ID, accelerometer, gyro, proximity, compass, barometer\r\n 	Ultra Wideband (UWB) support\r\nEmergency SOS via satellite (SMS sending/receiving)\r\nBattery 	Type 	Li-Ion 3279 mAh, non-removable (12.68 Wh)\r\nCharging 	Wired, PD2.0, 50% in 30 min (advertised)\r\n15W wireless (MagSafe)\r\n15W wireless (Qi2) - requires iOS 17.2 update\r\nMisc 	Colors 	Midnight, Purple, Starlight, Blue, Red, Yellow\r\nModels 	A2882, A2649, A2881, A2884, A2883, iphone14,7\r\nSAR 	1.15 W/kg (head)     1.16 W/kg (body)    \r\nSAR EU 	0.98 W/kg (head)     0.98 W/kg (body)    \r\nPrice 	$?459.99 / €?560.00 / £?478.89 / ??62,800\r\nTests 	Performance 	AnTuTu: 817125 (v9)\r\nGeekBench: 4761 (v5.1)\r\nGFXBench: 60fps (ES 3.1 onscreen)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nCamera 	Photo / Video\r\nLoudspeaker 	-25.2 LUFS (Very good)\r\nBattery (old) 	\r\nEndurance rating 90h', 'apple-iphone-14.jpg', 'apple iphone Apple iPhone'),
(8, 1, 3, 'Apple iPhone 13', 430, 'Network 	Technology 	\r\nGSM / CDMA / HSPA / EVDO / LTE / 5G\r\nLaunch 	Announced 	2021, September 14\r\nStatus 	Available. Released 2021, September 24\r\nBody 	Dimensions 	146.7 x 71.5 x 7.7 mm (5.78 x 2.81 x 0.30 in)\r\nWeight 	174 g (6.14 oz)\r\nBuild 	Glass front (Corning-made glass), glass back (Corning-made glass), aluminum frame\r\nSIM 	Nano-SIM and eSIM or Dual SIM (Nano-SIM, dual stand-by)\r\n 	IP68 dust/water resistant (up to 6m for 30 min)\r\nApple Pay (Visa, MasterCard, AMEX certified)\r\nDisplay 	Type 	Super Retina XDR OLED, HDR10, Dolby Vision, 800 nits (HBM), 1200 nits (peak)\r\nSize 	6.1 inches, 90.2 cm2 (~86.0% screen-to-body ratio)\r\nResolution 	1170 x 2532 pixels, 19.5:9 ratio (~460 ppi density)\r\nProtection 	Ceramic Shield glass\r\nPlatform 	OS 	iOS 15, upgradable to iOS 17.4\r\nChipset 	Apple A15 Bionic (5 nm)\r\nCPU 	Hexa-core (2x3.23 GHz Avalanche + 4x1.82 GHz Blizzard)\r\nGPU 	Apple GPU (4-core graphics)\r\nMemory 	Card slot 	No\r\nInternal 	128GB 4GB RAM, 256GB 4GB RAM, 512GB 4GB RAM\r\n 	NVMe\r\nMain Camera 	Dual 	12 MP, f/1.6, 26mm (wide), 1/1.9\", 1.7µm, dual pixel PDAF, sensor-shift OIS\r\n12 MP, f/2.4, 120?, 13mm (ultrawide), 1/3.4\", 1.0µm\r\nFeatures 	Dual-LED dual-tone flash, HDR (photo/panorama)\r\nVideo 	4K@24/30/60fps, 1080p@30/60/120/240fps, HDR, Dolby Vision HDR (up to 60fps), stereo sound rec.\r\nSelfie camera 	Single 	12 MP, f/2.2, 23mm (wide), 1/3.6\"\r\nSL 3D, (depth/biometrics sensor)\r\nFeatures 	HDR\r\nVideo 	4K@24/25/30/60fps, 1080p@30/60/120fps, gyro-EIS\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	No\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, hotspot\r\nBluetooth 	5.0, A2DP, LE\r\nPositioning 	GPS, GLONASS, GALILEO, BDS, QZSS\r\nNFC 	Yes\r\nRadio 	No\r\nUSB 	Lightning, USB 2.0\r\nFeatures 	Sensors 	Face ID, accelerometer, gyro, proximity, compass, barometer\r\n 	Ultra Wideband (UWB) support\r\nBattery 	Type 	Li-Ion 3240 mAh, non-removable (12.41 Wh)\r\nCharging 	Wired, PD2.0, 50% in 30 min (advertised)\r\n15W wireless (MagSafe)\r\n15W wireless (Qi2) - requires iOS 17.2 update\r\nMisc 	Colors 	Starlight, Midnight, Blue, Pink, Red, Green\r\nModels 	A2633, A2482, A2631, A2634, A2635, iphone14,5\r\nSAR 	1.18 W/kg (head)     1.19 W/kg (body)    \r\nSAR EU 	0.99 W/kg (head)     0.98 W/kg (body)    \r\nPrice 	$?350.00 / €?447.00 / £?350.00 / ??49,999\r\nTests 	Performance 	AnTuTu: 775519 (v9)\r\nGeekBench: 4645 (v5.1)\r\nGFXBench: 59fps (ES 3.1 onscreen)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nCamera 	Photo / Video\r\nLoudspeaker 	-25.5 LUFS (Very good)\r\nBattery (old) 	\r\nEndurance rating 89h', 'apple-iphone-13.jpg', 'Apple apple iPhone iphone'),
(9, 1, 1, 'Redmi Note 13 Pro', 297, 'Network 	Technology 	\r\nGSM / CDMA / HSPA / CDMA2000 / LTE / 5G\r\nLaunch 	Announced 	2023, September 21\r\nStatus 	Available. Released 2023, September 21\r\nBody 	Dimensions 	161.2 x 74.2 x 8 mm (6.35 x 2.92 x 0.31 in)\r\nWeight 	187 g (6.60 oz)\r\nBuild 	Glass front (Gorilla Glass Victus), plastic frame, glass back\r\nSIM 	Nano-SIM, eSIM or Dual SIM (Nano-SIM, dual stand-by)\r\n 	IP54, dust and splash resistant\r\nDisplay 	Type 	AMOLED, 68B colors, 120Hz, Dolby Vision, 500 nits (typ), 1200 nits (HBM), 1800 nits (peak)\r\nSize 	6.67 inches, 107.4 cm2 (~89.8% screen-to-body ratio)\r\nResolution 	1220 x 2712 pixels, 20:9 ratio (~446 ppi density)\r\nProtection 	Corning Gorilla Glass Victus\r\n 	Always-on display\r\nPlatform 	OS 	Android 13, upgradable to Android 14, HyperOS\r\nChipset 	Qualcomm SM7435-AB Snapdragon 7s Gen 2 (4 nm)\r\nCPU 	Octa-core (4x2.40 GHz Cortex-A78 & 4x1.95 GHz Cortex-A55)\r\nGPU 	Adreno 710\r\nMemory 	Card slot 	No\r\nInternal 	128GB 8GB RAM, 256GB 8GB RAM, 256GB 12GB RAM, 512GB 12GB RAM, 512GB 16GB RAM\r\n 	UFS 2.2\r\nMain Camera 	Triple 	200 MP, f/1.7, 23mm (wide), 1/1.4\", 0.56µm, multi-directional PDAF, OIS\r\n8 MP, f/2.2, 118? (ultrawide)\r\n2 MP, f/2.4, (macro)\r\nFeatures 	Dual-LED dual-tone flash, HDR, panorama\r\nVideo 	4K@30fps, 1080p@30/60/120fps, gyro-EIS\r\nSelfie camera 	Single 	16 MP, f/2.4, (wide), 1/3.06\", 1.0µm\r\nFeatures 	HDR, panorama\r\nVideo 	1080p@30/60fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	Yes\r\n 	24-bit/192kHz Hi-Res & Hi-Res wireless audio\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac, dual-band\r\nBluetooth 	5.2, A2DP, LE\r\nPositioning 	GPS, GLONASS, BDS (B1I+B1c), GALILEO, QZSS\r\nNFC 	Yes (market/region dependent)\r\nInfrared port 	Yes\r\nRadio 	Unspecified\r\nUSB 	USB Type-C 2.0, OTG\r\nFeatures 	Sensors 	Fingerprint (under display, optical), accelerometer, gyro, compass\r\n 	Virtual proximity sensing\r\nBattery 	Type 	Li-Po 5100 mAh, non-removable\r\nCharging 	67W wired, PD3.0, 50% in 17 min, 100% in 44 min (advertised)\r\nMisc 	Colors 	Midnight Black, Aurora Purple (Coral Purple), Ocean Teal, Arctic White\r\nModels 	2312DRA50C, 2312CRAD3C, 2312DRA50G, 2312DRA50I\r\nPrice 	$?297.42 / €?292.99 / £?269.00 / ??25,999\r\nTests 	Performance 	AnTuTu: 523746 (v9), 581979 (v10)\r\nGeekBench: 2695 (v5), 2751 (v6)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nCamera 	Photo / Video\r\nLoudspeaker 	-26.0 LUFS (Very good)\r\nBattery (new) 	\r\nActive use score 10:16h', 'xiaomi-redmi-note-13-pro.jpg', 'xiaomi redmi redmi note 13 pro'),
(10, 1, 1, 'Xiaomi Poco X6', 269, 'Network 	Technology 	\r\nGSM / HSPA / LTE / 5G\r\nLaunch 	Announced 	2024, January 11\r\nStatus 	Available. Released 2024, January 12\r\nBody 	Dimensions 	161.2 x 74.3 x 8 mm (6.35 x 2.93 x 0.31 in)\r\nWeight 	181 g (6.38 oz)\r\nBuild 	Glass front (Gorilla Glass Victus), plastic frame, plastic back\r\nSIM 	Dual SIM (Nano-SIM, dual stand-by)\r\n 	IP54, dust and splash resistant\r\nDisplay 	Type 	AMOLED, 68B colors, 120Hz, Dolby Vision, 500 nits (typ), 1200 nits (HBM), 1800 nits (peak)\r\nSize 	6.67 inches, 107.4 cm2 (~89.7% screen-to-body ratio)\r\nResolution 	1220 x 2712 pixels, 20:9 ratio (~446 ppi density)\r\nProtection 	Corning Gorilla Glass Victus\r\nPlatform 	OS 	Android 13, MIUI 14, planned upgrade to Android 14, HyperOS\r\nChipset 	Qualcomm SM7435-AB Snapdragon 7s Gen 2 (4 nm)\r\nCPU 	Octa-core (4x2.40 GHz Cortex-A78 & 4x1.95 GHz Cortex-A55)\r\nGPU 	Adreno 710\r\nMemory 	Card slot 	No\r\nInternal 	256GB 8GB RAM, 256GB 12GB RAM, 512GB 12GB RAM\r\n 	UFS 2.2\r\nMain Camera 	Triple 	64 MP, f/1.8, 25mm (wide), 0.7µm, PDAF, OIS\r\n8 MP, f/2.2, 118? (ultrawide), 1/4.0\", 1.12µm\r\n2 MP, f/2.4, (macro)\r\nFeatures 	LED flash, HDR, panorama\r\nVideo 	4K@30fps, 1080p@30/60fps, gyro-EIS\r\nSelfie camera 	Single 	16 MP, f/2.5, (wide)\r\nFeatures 	HDR\r\nVideo 	1080p@30/60fps\r\nSound 	Loudspeaker 	Yes, with dual speakers\r\n3.5mm jack 	Yes\r\n 	24-bit/192kHz Hi-Res & Hi-Res Wireless audio\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct\r\nBluetooth 	5.2, A2DP, LE\r\nPositioning 	GPS, GLONASS, GALILEO, BDS\r\nNFC 	Yes (market/region dependent)\r\nInfrared port 	Yes\r\nRadio 	Unspecified\r\nUSB 	USB Type-C 2.0, OTG\r\nFeatures 	Sensors 	Fingerprint (under display, optical), accelerometer, gyro, proximity, compass\r\nBattery 	Type 	5100 mAh, non-removable\r\nCharging 	67W wired, 100% in 44 min (advertised)\r\nMisc 	Colors 	Black, White, Blue\r\nModels 	23122PCD1G, 23122PCD1I\r\nPrice 	$?269.99 / €?235.90 / £?237.86 / ??17,997\r\nTests 	Performance 	AnTuTu: 533112 (v9), 605803 (v10)\r\nGeekBench: 2945 (v6)\r\n3DMark Wild Life: 3032 (offscreen 1440p)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nCamera 	Photo / Video\r\nLoudspeaker 	-26.5 LUFS (Good)\r\nBattery (new) 	\r\nActive use score 10:11h', 'xiaomi-poco-x6.jpg', 'xiaomi poco Xiaomi Poco'),
(11, 1, 4, 'Motorola Moto G64', 421, 'Network 	Technology 	\r\nGSM / HSPA / LTE / 5G\r\nLaunch 	Announced 	2024, April 11\r\nStatus 	Available. Released 2024, April 23\r\nBody 	Dimensions 	161.6 x 73.8 x 8.9 mm (6.36 x 2.91 x 0.35 in)\r\nWeight 	192 g (6.77 oz)\r\nBuild 	Glass front, plastic back, plastic frame\r\nSIM 	Hybrid Dual SIM (Nano-SIM, dual stand-by)\r\n 	Water-repellent design\r\nDisplay 	Type 	IPS LCD, 120Hz\r\nSize 	6.5 inches, 102.0 cm2 (~85.5% screen-to-body ratio)\r\nResolution 	1080 x 2400 pixels, 20:9 ratio (~405 ppi density)\r\nPlatform 	OS 	Android 14, planned upgrade to Android 15\r\nChipset 	Mediatek Dimensity 7025 (6 nm)\r\nCPU 	Octa-core (2x2.5 GHz Cortex-A78 & 6x2.0 GHz Cortex-A55)\r\nGPU 	IMG BXM-8-256\r\nMemory 	Card slot 	microSDXC (uses shared SIM slot)\r\nInternal 	128GB 8GB RAM, 256GB 12GB RAM\r\nMain Camera 	Dual 	50 MP, f/1.8 (wide), 0.61µm, PDAF, OIS\r\n8 MP, f/2.2, 118? (ultrawide), 1.12µm, AF\r\nFeatures 	LED flash, HDR, panorama\r\nVideo 	1080p@30fps\r\nSelfie camera 	Single 	16 MP, f/2.4, (wide), 1.0µm\r\nFeatures 	HDR\r\nVideo 	1080p@30fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	Yes\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac, dual-band\r\nBluetooth 	5.3, A2DP, LE\r\nPositioning 	GPS, GLONASS, GALILEO, QZSS\r\nNFC 	Yes\r\nRadio 	FM radio\r\nUSB 	USB Type-C 2.0, OTG\r\nFeatures 	Sensors 	Fingerprint (side-mounted), accelerometer, gyro, proximity, compass\r\nBattery 	Type 	6000 mAh, non-removable\r\nCharging 	30W wired, PD3.0, QC3+, 50% in 33 min (advertised)\r\nReverse wired\r\nMisc 	Colors 	Mint Green, Pearl Blue, Ice Lilac\r\nPrice 	About 170 EUR', 'motorola-moto-g64.jpg', 'moto motorola Motorola g64'),
(12, 1, 4, 'Motorola Moto G-34', 108, 'Network 	Technology 	\r\nGSM / HSPA / LTE / 5G\r\nLaunch 	Announced 	2023, December 22\r\nStatus 	Available. Released 2023, December 29\r\nBody 	Dimensions 	162.7 x 74.6 x 8 mm (6.41 x 2.94 x 0.31 in)\r\nWeight 	179 g or 181 g (6.31 oz)\r\nBuild 	Glass front, plastic back or silicone polymer (eco leather), plastic frame\r\nSIM 	Nano-SIM, eSIM or Dual SIM (Nano-SIM, dual stand-by)\r\n 	Water-repellent design\r\nDisplay 	Type 	IPS LCD, 120Hz\r\nSize 	6.5 inches, 102.0 cm2 (~84.0% screen-to-body ratio)\r\nResolution 	720 x 1600 pixels, 20:9 ratio (~270 ppi density)\r\nPlatform 	OS 	Android 13 or Android 14\r\nChipset 	Qualcomm SM6375 Snapdragon 695 5G (6 nm)\r\nCPU 	Octa-core (2x2.2 GHz Kryo 660 Gold & 6x1.7 GHz Kryo 660 Silver)\r\nGPU 	Adreno 619\r\nMemory 	Card slot 	microSDXC (uses shared SIM slot)\r\nInternal 	64GB 4GB RAM, 128GB 4GB RAM, 128GB 8GB RAM, 256GB 8GB RAM\r\nMain Camera 	Dual 	50 MP, f/1.8 (wide), 0.64µm, PDAF\r\n2 MP, f/2.4, (macro)\r\nFeatures 	LED flash, HDR, panorama\r\nVideo 	1080p@30fps\r\nSelfie camera 	Single 	16 MP, f/2.4, (wide), 1.0µm\r\nVideo 	1080p@30fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	Yes\r\n 	Snapdragon Sound\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac, dual-band\r\nBluetooth 	5.1, A2DP, LE\r\nPositioning 	GPS, GALILEO, GLONASS, BDS, QZSS\r\nNFC 	Yes (market/region dependent)\r\nRadio 	FM radio\r\nUSB 	USB Type-C 2.0\r\nFeatures 	Sensors 	Fingerprint (side-mounted), accelerometer, gyro, proximity, compass\r\nBattery 	Type 	Li-Po 5000 mAh, non-removable\r\nCharging 	18W wired\r\nMisc 	Colors 	Charcoal Black, Ice Blue, Ocean Green, Vanilla Cream\r\nModels 	XT2363-2\r\nPrice 	€?108.45', 'motorola-moto-g34.jpg', 'Motorola motorola G34 g34'),
(13, 1, 5, 'Realme Narzo 30', 220, 'Network 	Technology 	\r\nGSM / HSPA / LTE / 5G\r\nLaunch 	Announced 	2024, April 24\r\nStatus 	Available. Released 2024, April 25\r\nBody 	Dimensions 	163 x 75.5 x 8 mm (6.42 x 2.97 x 0.31 in)\r\nWeight 	188 g (6.63 oz)\r\nSIM 	Dual SIM (Nano-SIM, dual stand-by)\r\n 	IP54, dust and splash resistant\r\nDisplay 	Type 	AMOLED, 120Hz, 600 nits (HBM), 1200 nits (peak)\r\nSize 	6.67 inches, 107.4 cm2 (~87.3% screen-to-body ratio)\r\nResolution 	1080 x 2400 pixels, 20:9 ratio (~395 ppi density)\r\nPlatform 	OS 	Android 14, Realme UI 5.0\r\nChipset 	Mediatek Dimensity 7050 (6 nm)\r\nCPU 	Octa-core (2x2.6 GHz Cortex-A78 & 6x2.0 GHz Cortex-A55)\r\nGPU 	Mali-G68 MC4\r\nMemory 	Card slot 	Unspecified\r\nInternal 	128GB 6GB RAM, 128GB 8GB RAM\r\nMain Camera 	Dual 	50 MP, f/1.8, 27mm (wide), 1/2.76\", 0.64µm, PDAF\r\n2 MP, f/2.4, (depth)\r\nFeatures 	LED flash, HDR, panorama\r\nVideo 	1080p@30/60/120/480fps, 720p@960fps, gyro-EIS\r\nSelfie camera 	Single 	16 MP, f/2.5, 24mm (wide), 1/3.0\", 1.0µm\r\nVideo 	1080p@30fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	Yes\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac, dual-band\r\nBluetooth 	5.2, A2DP, LE\r\nPositioning 	GPS, GLONASS, GALILEO, BDS, QZSS\r\nNFC 	No\r\nRadio 	No\r\nUSB 	USB Type-C 2.0, OTG\r\nFeatures 	Sensors 	Fingerprint (under display, optical), accelerometer, gyro, proximity, compass\r\nBattery 	Type 	Li-Ion 5000 mAh, non-removable\r\nCharging 	45W wired, 50% in 27 min (advertised)\r\nMisc 	Colors 	Olive Green, Sky Blue\r\nPrice 	About 170 EUR', 'realme-narzo-70.jpg', 'Realme Narzo realme narzo '),
(14, 1, 6, 'Asus Rog Phone 8 Pro', 1070, 'Network 	Technology 	\r\nGSM / CDMA / HSPA / LTE / 5G\r\nLaunch 	Announced 	2024, January 08\r\nStatus 	Available. Released 2024, January 18\r\nBody 	Dimensions 	163.8 x 76.8 x 8.9 mm (6.45 x 3.02 x 0.35 in)\r\nWeight 	225 g (7.94 oz)\r\nBuild 	Glass front (Gorilla Glass Victus 2), glass back (Gorilla Glass), aluminum frame\r\nSIM 	Dual SIM (Nano-SIM, dual stand-by)\r\n 	IP68 dust/water resistant (up to 1.5m for 30 min)\r\n341 Mini-LED programmable matrix (on the back)\r\nPressure sensitive zones (Gaming triggers)\r\nDisplay 	Type 	LTPO AMOLED, 1B colors, 165Hz, HDR10, 1600 nits (HBM), 2500 nits (peak)\r\nSize 	6.78 inches, 111.0 cm2 (~88.2% screen-to-body ratio)\r\nResolution 	1080 x 2400 pixels, 20:9 ratio (~388 ppi density)\r\nProtection 	Corning Gorilla Glass Victus 2\r\n 	Always-On display\r\nPlatform 	OS 	Android 14\r\nChipset 	Qualcomm SM8650-AB Snapdragon 8 Gen 3 (4 nm)\r\nCPU 	Octa-core (1x3.3 GHz Cortex-X4 & 3x3.2 GHz Cortex-A720 & 2x3.0 GHz Cortex-A720 & 2x2.3 GHz Cortex-A520)\r\nGPU 	Adreno 750\r\nMemory 	Card slot 	No\r\nInternal 	512GB 16GB RAM, 1TB 24GB RAM\r\n 	UFS 4.0\r\nNTFS support for external storage\r\nMain Camera 	Triple 	50 MP, f/1.9, 24mm (wide), 1/1.56\", 1.0µm, PDAF, gimbal OIS\r\n32 MP, f/2.4, (telephoto), 1/3.2\", 0.7µm, PDAF, OIS, 3x optical zoom\r\n13 MP, f/2.2, 13mm, 120? (ultrawide)\r\nFeatures 	LED flash, HDR, panorama\r\nVideo 	8K@24fps, 4K@30/60fps, 1080p@30/60/120/240fps, 720p@480fps; gyro-EIS, HDR10+\r\nSelfie camera 	Single 	32 MP, f/2.5, 22mm (wide), 1/3.2\", 0.7µm\r\nFeatures 	Panorama, HDR\r\nVideo 	1080p@30fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers\r\n3.5mm jack 	Yes\r\n 	32-bit/384kHz Hi-Res & Hi-Res wireless audio\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6e/7, tri-band, Wi-Fi Direct\r\nBluetooth 	5.4, A2DP, LE, aptX HD, aptX Adaptive, aptX Lossless\r\nPositioning 	GPS (L1+L5), BDS (B1I+B1c+B2a), GALILEO (E1+E5a), QZSS (L1+L5), NavIC (L5), GLONASS\r\nNFC 	Yes\r\nRadio 	No\r\nUSB 	USB Type-C (side), DisplayPort 1.4; USB Type-C (bottom), OTG\r\nFeatures 	Sensors 	Fingerprint (under display, optical), accelerometer, gyro, proximity, compass\r\nBattery 	Type 	5500 mAh, non-removable\r\nCharging 	65W wired, PD3.0, PPS, QC5, 100% in 39 min - International\r\n30W wired, PD3.0, PPS - India\r\n15W wireless (Qi)\r\n10W reverse wired\r\nMisc 	Colors 	Phantom Black\r\nModels 	AI2401, AI2401_A\r\nPrice 	$?1,070.00 / €?1,088.90\r\nTests 	Performance 	AnTuTu: 1639368 (v9), 2167612 (v10)\r\nGeekBench: 6542 (v5), 7178 (v6)\r\nGFXBench: 163fps (offscreen 1080p)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nCamera 	Photo / Video\r\nLoudspeaker 	-26.3 LUFS (Good)\r\nBattery (new) 	\r\nActive use score 14:43h', 'asus-rog-phone-8-pro.jpg', 'Asus Rog asus rog '),
(15, 1, 6, 'Asus Rog Phone 7', 869, 'Network 	Technology 	\r\nGSM / CDMA / HSPA / LTE / 5G\r\nLaunch 	Announced 	2023, April 13\r\nStatus 	Available. Released 2023, May\r\nBody 	Dimensions 	173 x 77 x 10.3 mm (6.81 x 3.03 x 0.41 in)\r\nWeight 	239 g (8.43 oz)\r\nBuild 	Glass front (Gorilla Glass Victus), glass back (Gorilla Glass 3), aluminum frame\r\nSIM 	Dual SIM (Nano-SIM, dual stand-by)\r\n 	IP54, dust and splash resistant\r\nIlluminated RGB logo (on the back)\r\nPressure sensitive zones (Gaming triggers)\r\nDisplay 	Type 	AMOLED, 1B colors, 165Hz, HDR10+, 1000 nits (HBM), 1500 nits (peak)\r\nSize 	6.78 inches, 109.5 cm2 (~82.2% screen-to-body ratio)\r\nResolution 	1080 x 2448 pixels (~395 ppi density)\r\nProtection 	Corning Gorilla Glass Victus\r\nPlatform 	OS 	Android 13, upgradable to Android 14\r\nChipset 	Qualcomm SM8550-AB Snapdragon 8 Gen 2 (4 nm)\r\nCPU 	Octa-core (1x3.2 GHz Cortex-X3 & 2x2.8 GHz Cortex-A715 & 2x2.8 GHz Cortex-A710 & 3x2.0 GHz Cortex-A510)\r\nGPU 	Adreno 740\r\nMemory 	Card slot 	No\r\nInternal 	256GB 12GB RAM, 512GB 16GB RAM\r\n 	UFS 4.0\r\nNTFS support for external storage\r\nMain Camera 	Triple 	50 MP, f/1.9, 24mm (wide), 1/1.56\", 1.0µm, PDAF\r\n13 MP, f/2.2, 13mm, 120? (ultrawide)\r\n5 MP, f/2.0, (macro)\r\nFeatures 	LED flash, HDR, panorama\r\nVideo 	8K@24fps, 4K@30/60fps, 1080p@30/60/120/240fps, 720p@480fps; gyro-EIS, HDR10+\r\nSelfie camera 	Single 	32 MP, f/2.5, 29mm (wide), 1/3.2\", 0.7µm\r\nFeatures 	Panorama, HDR\r\nVideo 	1080p@30fps\r\nSound 	Loudspeaker 	Yes, with stereo speakers (2 amplifiers)\r\n3.5mm jack 	Yes\r\n 	32-bit/384kHz Hi-Res audio\r\nSnapdragon Sound\r\nComms 	WLAN 	Wi-Fi 802.11 a/b/g/n/ac/6e/7, tri-band, Wi-Fi Direct\r\nBluetooth 	5.3, A2DP, LE, aptX HD, aptX Adaptive, aptX Lossless\r\nPositioning 	GPS (L1+L5), GLONASS (L1), BDS (B1I+B2a+B2c), GALILEO (E1+E5a), QZSS (L1+L5), NavIC (L5)\r\nNFC 	Yes\r\nRadio 	No\r\nUSB 	USB Type-C 3.1 (side), DisplayPort 1.4; USB Type-C 2.0 (bottom), OTG, accessory connector\r\nFeatures 	Sensors 	Fingerprint (under display, optical), accelerometer, gyro, proximity, compass\r\nBattery 	Type 	Li-Po 6000 mAh, non-removable\r\nCharging 	65W wired, PD3.0, QC5, 100% in 42 min (advertised)\r\n10W reverse wired\r\nMisc 	Colors 	Phantom Black, Storm White\r\nModels 	AI2205_C\r\nPrice 	$?859.00 / €?699.13 / £?794.75\r\nTests 	Performance 	AnTuTu: 1333597 (v9)\r\nGeekBench: 5098 (v5.5), 5617 (v6)\r\nGFXBench: 108fps (ES 3.1 onscreen)\r\nDisplay 	Contrast ratio: Infinite (nominal)\r\nCamera 	Photo / Video\r\nLoudspeaker 	-26.0 LUFS (Very good)\r\nBattery (new) 	\r\nActive use score 14:51h\r\nBattery (old) 	\r\nEndurance rating 131h', 'asus-rog-phone-7.jpg', 'Asus asus rog Rog '),
(16, 2, 7, 'Cannon EOS 5D Mark IV', 2299, '\r\n\r\n    New 30.4 Megapixel full-frame CMOS sensor for versatile shooting in nearly any light, with ISO range 100–32000; expandable up to 50–102400 (equivalent ISO).\r\n    4K Motion JPEG video (DCI cinema-type 4096 x 2160) at 30p or 24p; in-camera still frame grab* of 4K 8.8-Megapixel images; multiple video options include Full HD up to 60p, and HD up to 120p.\r\n    Superb Dual Pixel CMOS AF for responsive and smooth AF during video or Live View shooting; LCD monitor has full touch-screen interface, including selection of AF area.\r\n    Excellent performance — up to 7.0 fps** continuous shooting speed with high-performance DIGIC 6+ Image Processor for improved speed and excellent image quality.\r\n    61 AF points with expanded vertical coverage with 41 cross-points, and AF possible at all 61 AF points with many lens + extender combinations effective at f/8.\r\n    150,000-pixel RGB+IR metering sensor helps provide precise exposure metering, helps detect flickering lights and allows for enhanced scene recognition and face detection capabilities. \r\n\r\n', '', 'cannon eos mark Mark EOS Cannon');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Foxxie', '911', 'foxxie911@gmail.com', '$Ak12345678', '0123456789', 'Dhaka', 'Narayangonj');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(26, 'Foxxie', 'Vai', 'foxxie911@gmail.com', '$Ak12345678', '0123456789', 'Dhaka', 'Narayangonj');

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
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
