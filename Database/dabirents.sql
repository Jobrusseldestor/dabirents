-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 05:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dabirents`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'dabiadmin@gmail.com', 'admin12345678');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` mediumint(9) NOT NULL,
  `category` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`) VALUES
(1, 'Long Gown', 1),
(2, 'Ball Gown', 1),
(3, 'Cocktail', 1),
(4, 'Americana', 1),
(5, 'Barong', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `message`, `date`) VALUES
(24, 'ron magpantay', 'ron@gmail.com', 1111111111, 'i love you', '2024-05-09 23:17:23'),
(25, 'ron magpantay', 'ron@gmail.com', 9308969528, 'sobrang ganda!', '2024-05-10 06:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `dress`
--

CREATE TABLE `dress` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `DSN` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` text NOT NULL,
  `security` int(11) NOT NULL,
  `rent` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `best_seller` int(11) DEFAULT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `price` int(3) GENERATED ALWAYS AS (coalesce(`security`,0) + coalesce(`rent`,0)) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dress`
--

INSERT INTO `dress` (`id`, `category_id`, `DSN`, `name`, `img`, `security`, `rent`, `qty`, `best_seller`, `short_desc`, `description`, `status`) VALUES
(4, 1, '1000', 'Peach Gold', 'Peachgoldbg.png', 500, 2500, 1, 1, 'A long peach gold gown.', 'A peach gold long gown is an elegant and sophisticated dress that combines the delicate color of peach with shimmering gold accents. The gown typically features a floor-length silhouette, gracefully draping along the body to create a regal and feminine look. The peach color, reminiscent of the soft hues of a ripe peach fruit, adds a touch of warmth and tenderness to the overall aesthetic.', 1),
(6, 1, '2000', 'Red Flower', 'redlonggown.png', 1000, 2500, 1, 0, 'A long red flower gown.', 'A red flower long gown is a stunning and captivating dress that combines the vibrant color of red with the timeless beauty of floral elements. The gown typically features a floor-length silhouette, exuding elegance and grace as it drapes along the body.', 1),
(7, 1, '3000', 'Royal Blue Sleeveless', 'royalblue.png', 500, 1500, 1, 1, 'A Royal Blue Sleeveless Long Gown.', 'A royal blue sleeveless long gown is a striking and sophisticated dress that embodies a sense of regal elegance. The gown features a rich and deep shade of blue reminiscent of royalty and nobility, exuding a sense of power and confidence.', 1),
(8, 1, '4000', 'Light Blue Spider', 'spiderlb.png', 1000, 2000, 1, NULL, 'A Long Light Blue Spider Gown.', 'A light blue spider long gown is an intriguing and unique dress that combines the delicate hue of light blue with a spider-inspired design. The gown features a floor-length silhouette, exuding elegance and sophistication. The light blue color of the gown creates a serene and ethereal aesthetic. It evokes a sense of tranquility and freshness, reminiscent of clear skies or calm waters. The gentle shade of blue adds a soft and enchanting touch to the overall look.', 1),
(9, 1, '5000', 'V-Design Purple', 'vdesignpurple.png', 500, 2500, 1, NULL, 'A Long V-Design Purple Gown.', 'A V-design purple long gown is a captivating and elegant dress that combines the regal color of purple with a distinctive V-shaped neckline design. The gown features a floor-length silhouette, exuding sophistication and grace.', 1),
(10, 1, '6000', 'Black Long Gown with Sleeves', 'Blacklgwthslvs.png', 700, 3000, 1, NULL, 'A Long Black with Sleeves Gown.', 'A black long gown with sleeves is a timeless and sophisticated dress that exudes elegance and grace. The gown features a sleek and classic black color, known for its versatility and ability to create an effortlessly chic look.', 1),
(11, 1, '7000', 'Royal Blue with Silver', 'Royalbluewsilver.png', 600, 2600, 3, NULL, 'A Long Royal Blue Silver Gown.', 'A royal blue with silver long gown is a stunning and captivating dress that harmonizes the rich hue of royal blue with the shimmering elegance of silver accents. The gown features a floor-length silhouette, exuding regality and sophistication. The royal blue color of the gown commands attention and evokes a sense of luxury and grandeur. It is a vibrant shade that exudes confidence, depth, and allure, making a bold statement at any formal event or special occasion.', 1),
(12, 1, '8000', 'Red with Filipiniana Sleeves', 'redwfpsleeves.png', 800, 2000, 1, 1, 'A Long Red with Filipiniana Sleeves Gown.', 'A long gown with red Filipiniana sleeves is a captivating and culturally-inspired dress that combines a floor-length silhouette with the traditional elegance of Filipiniana sleeves adorned in a vibrant shade of red. The gown typically features a fitted bodice that accentuates the curves and a defined waistline, creating an hourglass silhouette. The flowing skirt elegantly drapes down to the floor, adding a sense of grace and sophistication to the overall look.', 1),
(13, 3, '1000', 'Gray Floral', 'grayckc.png', 450, 1400, 1, NULL, 'A Dark Colored Floral Cocktail.', 'A gray floral cocktail dress is a charming and sophisticated ensemble that combines the versatility of gray with the delicate beauty of floral patterns. This dress is designed for semi-formal or cocktail events, offering a balance of elegance and playfulness. The dress typically features a shorter length, often falling just above or at the knees, giving it a youthful and lively appeal. The gray color of the dress provides a neutral canvas that allows the floral patterns to take center stage.', 1),
(14, 3, '2000', 'White Pink Avalon Inspired', 'whitepnk.png', 700, 2200, 1, NULL, 'An Avalon Inspired Cocktail.', 'A white pink Avalon-inspired cocktail dress is a dreamy and enchanting ensemble that combines the purity of white with the softness and femininity of pink, drawing inspiration from the mythical land of Avalon. This cocktail dress exudes elegance and charm, perfect for special occasions or sophisticated events.', 1),
(15, 5, '1000', 'White Raya', 'whiteraya.png', 650, 1500, 2, 0, 'A White Barong.', 'A white Raya Barong dress is a stunning and culturally-inspired ensemble that combines the elegance of a dress with the traditional elements of a Raya Barong. This dress is inspired by the traditional attire of Indonesia and is typically worn for special occasions and cultural celebrations. The dress features a white color, symbolizing purity, spirituality, and harmony. White creates a clean and timeless aesthetic, allowing the intricate details of the Raya Barong to take center stage.', 1),
(16, 5, '2000', 'Cocoon Blue', 'Cocoonblueb.png', 800, 2500, 1, 1, 'A Blue Colored Cocoon Barong.', 'A blue cocoon Barong dress is a unique and contemporary ensemble that combines the classic elements of a Barong with a modern twist. This dress draws inspiration from the traditional Filipino Barong Tagalog and infuses it with a stylish cocoon silhouette and a captivating blue color. The dress features a rich blue hue, which can range from deep navy to vibrant turquoise, evoking a sense of calmness, serenity, and sophistication. The blue color adds a refreshing and modern touch to the traditional Barong aesthetic.', 1),
(17, 2, '1000', 'Enchanting Ivory Dream', 'whitegowndr.png', 750, 2800, 1, NULL, 'A Ivory Colored Ball Gown', 'This exquisite ball gown, named \"The Enchanting Ivory Dream,\" is a true embodiment of elegance and grace. Crafted with meticulous attention to detail, it showcases a mesmerizing blend of timeless design and intricate lacework. The sweetheart neckline of this gown beautifully frames the décolletage, adding a touch of romance and femininity. The full skirt cascades gracefully from the waist, creating a whimsical and ethereal silhouette that is sure to captivate all who lay eyes on it.', 1),
(18, 2, '2000', 'The Serene Sapphire Symphony', 'tealbg.png', 900, 3000, 1, NULL, 'A Teal Colored Ball Gown', 'The Serene Sapphire Symphony ball gown is a breathtaking masterpiece that effortlessly combines timeless elegance with a touch of enchantment. This regal gown showcases a magnificent design that is sure to leave a lasting impression. The gown features a sweetheart neckline, gracefully accentuating the décolletage and adding a touch of romance to the overall look.', 1),
(19, 2, '3000', 'Midnight Stardust', 'galaxybg.png', 800, 2500, 1, NULL, 'A galaxy themed ball gown.', 'The Midnight Stardust ball gown is a captivating masterpiece that embodies the allure and mystery of a starlit night. This enchanting gown is designed to make a lasting impression, showcasing a perfect blend of elegance and celestial beauty. Featuring a sweetheart neckline, this gown gracefully highlights the décolletage, adding a touch of romance and femininity to the overall look. The intricate lace details adorning the gown create a stunning visual effect, reminiscent of stardust scattered across the night sky.', 1),
(20, 2, '4000', 'Sky Blue Enchanted', 'ballgown4.png', 750, 2500, 1, NULL, 'A Sky Colored Ball Gown', 'The sky blue enchanted ball gown is a breathtaking masterpiece that captures the essence of elegance and enchantment. Crafted with meticulous attention to detail, this gown combines ethereal beauty with a touch of whimsy. Flowing from the natural waistline, the skirt of the gown billows out in layers of diaphanous sky blue tulle. The soft, lightweight fabric moves with a graceful fluidity, evoking a sense of weightlessness and enchantment. As the wearer glides across the ballroom floor, the skirt gently sways, creating an ethereal aura that captivates all who behold it.', 1),
(21, 2, '5000', 'White Silver All Over Sequence with Scallops', 'ballgown5.png', 800, 2500, 1, NULL, 'A white silver all-over sequined ball gown with scallops.', 'This white silver all-over sequined ball gown with scallops is a true masterpiece, designed to make any wearer feel like a radiant princess. It is the epitome of glamour, combining the timeless beauty of sequins with the ethereal elegance of scalloped detailing. This gown is perfect for formal occasions, red carpet events, or any moment that calls for a truly unforgettable and enchanting ensemble.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `pin` int(11) NOT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `address2`, `pin`, `payment_method`, `total`, `payment_status`, `order_status`, `date`, `duration`) VALUES
(1, 1, 'Nayagaon Polio', 'Shimla Bypass Road', 248004, 'COD', 350, 'success', 4, '2021-11-27 16:05:35', 20),
(16, 13, 'Tanza', 'Baybay', 5000, 'COD', 250, 'success', 1, '2024-05-09 16:26:08', 15),
(17, 13, 'Tanza', 'Baybay', 5000, 'COD', 250, 'success', 4, '2024-05-09 16:27:00', 15),
(18, 13, 'nbv', 'vnnv', 455, 'COD', 210, 'success', 4, '2024-05-09 16:29:23', 11),
(19, 13, 'Tanza', '', 2, 'COD', 250, 'success', 5, '2024-05-09 17:38:30', 15),
(20, 14, 'Tanza', 'Baybay', 5000, 'COD', 25500, 'success', 4, '2024-05-09 22:19:34', 10),
(21, 14, 'Santa Barbara', 'Iloilo', 5002, 'COD', 15650, 'success', 4, '2024-05-10 06:41:48', 10),
(22, 14, 'Tanza', 'Iloilo', 2123, 'COD', 26600, 'success', 4, '2024-05-10 07:00:22', 10),
(23, 14, 'Santa Barbara', 'Baybay', 213, 'COD', 20800, 'success', 6, '2024-05-10 07:09:04', 10);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `dress_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `dress_id`, `price`, `time`) VALUES
(1, 1, 3, 350, 0),
(15, 17, 1, 250, 15),
(16, 18, 1, 210, 11),
(17, 19, 1, 250, 15),
(18, 20, 9, 25500, 10),
(19, 21, 15, 15650, 10),
(20, 22, 11, 26600, 10),
(21, 23, 12, 20800, 10);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `status_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `status_name`) VALUES
(4, 'Cancelled'),
(5, 'Delivered'),
(1, 'Pending'),
(2, 'Processing'),
(6, 'Returned'),
(3, 'Shipped');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `doj` datetime NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `doj`, `password`) VALUES
(1, 'Gaurav Singh', 'gauravnegi9634@gmail.com', 9368963477, '2021-11-23 15:36:35', '29be54a52396750258d886abc5417fda'),
(13, 'Job Destor', 'job@gmail.com', 9124443553, '2024-05-09 16:24:52', '25f9e794323b453885f5181f1b624d0b'),
(14, 'ron magpantay', 'ron@gmail.com', 1111111111, '2024-05-09 18:07:24', '529ca8050a00180790cf88b63468826a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dress`
--
ALTER TABLE `dress`
  ADD PRIMARY KEY (`id`,`DSN`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_status_name_uindex` (`status_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `dress`
--
ALTER TABLE `dress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
