-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 12, 2023 lúc 08:38 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project1`
--
CREATE DATABASE IF NOT EXISTS `project1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project1`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `cate_id` int(11) NOT NULL,
  `cate_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`cate_id`, `cate_name`) VALUES
(1, 'Manga'),
(2, 'Truyện trinh thám'),
(3, 'Truyện tình cảm'),
(4, 'Câu truyện cuộc sống');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_custommer`
--

DROP TABLE IF EXISTS `tbl_custommer`;
CREATE TABLE `tbl_custommer` (
  `cus_id` int(11) NOT NULL,
  `cus_username` varchar(255) NOT NULL,
  `cus_pass` varchar(255) NOT NULL,
  `cus_address` varchar(255) NOT NULL,
  `cus_phone` varchar(60) NOT NULL,
  `cus_message` varchar(6000) DEFAULT NULL,
  `cus_fullname` varchar(255) DEFAULT NULL,
  `cus_method` varchar(255) DEFAULT NULL,
  `cus_street` varchar(255) DEFAULT NULL,
  `cus_city` varchar(255) DEFAULT NULL,
  `cus_country` varchar(255) DEFAULT NULL,
  `cus_pin_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_custommer`
--

INSERT INTO `tbl_custommer` (`cus_id`, `cus_username`, `cus_pass`, `cus_address`, `cus_phone`, `cus_message`, `cus_fullname`, `cus_method`, `cus_street`, `cus_city`, `cus_country`, `cus_pin_code`) VALUES
(1, 'vinhmoi', '07612f53659762db21ae0cf1e6e2d794', 'daothanhvinh2004@gmail.com', '0982660369', 'ád', 'Đào Thành Vinh', 'Tiền mặt', 'CT6, Trần Điền', 'Hà Nội', 'Việt Nam', '117117'),
(2, 'vinh', '07612f53659762db21ae0cf1e6e2d794', 'dttd6024@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_orders`
--

DROP TABLE IF EXISTS `tbl_orders`;
CREATE TABLE `tbl_orders` (
  `ord_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `prd_price` int(11) NOT NULL,
  `prd_quantity` int(11) NOT NULL,
  `prd_image` varchar(6000) NOT NULL,
  `cart_satus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_orders`
--

INSERT INTO `tbl_orders` (`ord_id`, `customer_id`, `staff_id`, `prd_name`, `prd_price`, `prd_quantity`, `prd_image`, `cart_satus`) VALUES
(72, 1, 2, 'Detective conan vol 100', 100000, 1, '100---db_a84b9c5d7d2e47d09bfc246d7b94ea30_master.jpg', 'ordered'),
(73, 1, 2, 'harry protter 7 bộ', 100000, 2, 'harry-post-ter.jpg', 'ordered'),
(75, 1, 2, 'Yêu trên từng ngón tay', 150000, 1, 'img2.jpg', 'ordered'),
(76, 2, 2, 'Detective conan vol 100', 100000, 1, '100---db_a84b9c5d7d2e47d09bfc246d7b94ea30_master.jpg', 'ordered'),
(78, 1, 2, 'Detective conan vol 100', 100000, 1, '100---db_a84b9c5d7d2e47d09bfc246d7b94ea30_master.jpg', 'ordered');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_detail`
--

DROP TABLE IF EXISTS `tbl_order_detail`;
CREATE TABLE `tbl_order_detail` (
  `ordd_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(255) NOT NULL,
  `cus_number` int(11) NOT NULL,
  `cus_email` varchar(255) NOT NULL,
  `cus_method` varchar(255) NOT NULL,
  `cus_address` varchar(255) NOT NULL,
  `total_products` varchar(255) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `prd_quantity` int(255) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`ordd_id`, `cus_id`, `cus_name`, `cus_number`, `cus_email`, `cus_method`, `cus_address`, `total_products`, `prd_id`, `prd_name`, `prd_quantity`, `total_price`, `placed_on`, `payment_status`) VALUES
(72, 1, 'Đào Thành Vinh', 982660369, 'daothanhvinh2004@gmail.com', 'Tiền mặt', 'flat no. , CT6, Trần Điền, Hà Nội, Việt Nam - 117117', 'Detective conan vol 100 (1) ', 1, 'Detective conan vol 100', 1, 100000, '07-Aug-2023 15:32:39', 'đang chờ xác nhận'),
(73, 1, 'Đào Thành Vinh', 982660369, 'daothanhvinh2004@gmail.com', 'Tiền mặt', 'flat no. , CT6, Trần Điền, Hà Nội, Việt Nam - 117117', 'harry protter 7 bộ (2) ', 2, 'harry protter 7 bộ', 2, 200000, '07-Aug-2023 15:32:39', 'đang chờ xác nhận'),
(75, 1, 'Đào Thành Vinh', 982660369, 'daothanhvinh2004@gmail.com', 'Tiền mặt', 'flat no. , CT6, Trần Điền, Hà Nội, Việt Nam - 117117', 'Yêu trên từng ngón tay (1) ', 3, 'Yêu trên từng ngón tay', 1, 150000, '07-Aug-2023 15:33:18', 'đang chờ xác nhận'),
(76, 2, 'Đào Thành Vinh', 982660369, 'dttd6024@gmail.com', 'Tiền mặt', 'flat no. , CT6, Trần Điền, Hà Nội, Việt Nam - 117117', 'Detective conan vol 100 (1) ', 1, 'Detective conan vol 100', 1, 100000, '08-Aug-2023 22:07:39', 'đang chờ xác nhận'),
(78, 1, 'Đào Thành Vinh', 982660369, 'daothanhvinh2004@gmail.com', 'Tiền mặt', 'CT6, Trần Điền, Hà Nội, Việt Nam - 117117', 'Detective conan vol 100 (1) ', 1, 'Detective conan vol 100', 1, 100000, '12-Aug-2023 00:09:02', 'đang chờ xác nhận');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `prd_id` int(11) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `prd_price` decimal(8,0) NOT NULL,
  `prd_quantity` int(11) NOT NULL,
  `prd_image` varchar(255) DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `prd_description` varchar(6000) DEFAULT NULL,
  `pubc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`prd_id`, `prd_name`, `prd_price`, `prd_quantity`, `prd_image`, `cate_id`, `prd_description`, `pubc_id`) VALUES
(1, 'Detective conan vol 100', '100000', 98, '100---db_a84b9c5d7d2e47d09bfc246d7b94ea30_master.jpg', 2, '<p>conan tập 100</p>\r\n', 1),
(2, 'harry protter 7 bộ', '100000', 99, 'harry-post-ter.jpg', 2, '', 2),
(3, 'Yêu trên từng ngón tay', '150000', 199, 'img2.jpg', 3, '<p>của</p>\r\n', 1),
(4, 'Vì em gặp anh', '120000', 1230, 'img3.jpg', 3, '', 6),
(5, 'Từ bến sông nhùng', '1500000', 100, 'img4.jpg', 4, '<p>của: Phạm Quốc To&agrave;n</p>\r\n', 6),
(123, '5 Centimet trên giây', '100000', 100, 'img5.jpg', 3, '<p>Của Shinkai Makoto</p>\r\n', 1),
(127, 'Nói nhiều, làm ít', '100000', 100, 'img8.jpg', 4, '', 6),
(1211, 'Người phụ nữ đằng sau ống kính', '130000', 100, 'img7.jpg', 3, '', 1),
(1212, 'Liên hoa yêu cốt', '100000', 100, 'img6.jpg', 4, '', 8),
(1213, 'Đắc nhân tâm', '100000', 100, 'dac-nhan-tam-116541.jpg', 4, '<p>Dale Carnegie</p>\r\n', 3),
(1214, 'Black Jack', '100000', 100, 'blackjack.jpg', 1, '<p><strong>TEZUKA OSAMU</strong></p>\r\n', 3),
(1215, 'Spy x Family', '100000', 100, 'spy-x-family-tap-4.jpg', 1, '<p>Tatsuya ENDO</p>\r\n', 1),
(1216, 'doremon', '100000', 100, 'doremon.jpg', 1, '<p>Fujiko F Fujio</p>\r\n', 1),
(1217, 'ALICE in borderland', '100000', 100, 'aliceinborderlands.jpg', 1, '<p>Haro ASO</p>\r\n', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_pubc`
--

DROP TABLE IF EXISTS `tbl_pubc`;
CREATE TABLE `tbl_pubc` (
  `pubc_id` int(11) NOT NULL,
  `pubc_name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_pubc`
--

INSERT INTO `tbl_pubc` (`pubc_id`, `pubc_name`) VALUES
(1, 'Nhà Xuất Bản Kim Đồng'),
(2, 'Nhà Xuất Bản giáo dục việt nam'),
(3, 'Nhà xuất bản trẻ'),
(6, 'Nhà xuất bản văn hóa văn nghệ'),
(7, 'Nhà xuất bản văn hóa'),
(8, 'Nhà xuất bản thời đại');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `fulname` varchar(255) DEFAULT NULL,
  `user_level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `username`, `user_pass`, `fulname`, `user_level`) VALUES
(1, 'Trường Giang', 'c4ca4238a0b923820dcc509a6f75849b', 'Truongjeng', 1),
(2, 'vinhdao', 'c4ca4238a0b923820dcc509a6f75849b', 'daothanhvinh', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Chỉ mục cho bảng `tbl_custommer`
--
ALTER TABLE `tbl_custommer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Chỉ mục cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`ord_id`),
  ADD KEY `'customer_id'` (`customer_id`),
  ADD KEY `'staff_id'` (`staff_id`);

--
-- Chỉ mục cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`ordd_id`),
  ADD KEY `'prd_id'` (`prd_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`prd_id`),
  ADD KEY `'cate_id'` (`cate_id`),
  ADD KEY `'pubc_id'` (`pubc_id`);

--
-- Chỉ mục cho bảng `tbl_pubc`
--
ALTER TABLE `tbl_pubc`
  ADD PRIMARY KEY (`pubc_id`);

--
-- Chỉ mục cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tbl_custommer`
--
ALTER TABLE `tbl_custommer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `ord_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `ordd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `prd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1218;

--
-- AUTO_INCREMENT cho bảng `tbl_pubc`
--
ALTER TABLE `tbl_pubc`
  MODIFY `pubc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `'customer_id'` FOREIGN KEY (`customer_id`) REFERENCES `tbl_custommer` (`cus_id`),
  ADD CONSTRAINT `'staff_id'` FOREIGN KEY (`staff_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Các ràng buộc cho bảng `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `'ordd_id'` FOREIGN KEY (`ordd_id`) REFERENCES `tbl_orders` (`ord_id`),
  ADD CONSTRAINT `'prd_id'` FOREIGN KEY (`prd_id`) REFERENCES `tbl_product` (`prd_id`);

--
-- Các ràng buộc cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `'cate_id'` FOREIGN KEY (`cate_id`) REFERENCES `tbl_category` (`cate_id`),
  ADD CONSTRAINT `'pubc_id'` FOREIGN KEY (`pubc_id`) REFERENCES `tbl_pubc` (`pubc_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
