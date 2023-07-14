-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 03, 2022 lúc 11:41 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_duocpham`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2022_02_10_084543_create_products_table', 1),
(5, '2022_02_10_092126_create_order_table', 1),
(6, '2022_02_10_092211_create_order_details_table', 1),
(7, '2022_02_24_155842_create_product_category_table', 1),
(8, '2022_02_27_155058_create_products_detail_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_total` bigint(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `users_id`, `address`, `phone`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 6, 'hẻm 195 Phường Hưng Lợi - Quận Ninh Kiều - TP Cần Thơ', '0987453397', 2071000, 1, '2022-05-02 02:35:54', '2022-05-02 07:00:12'),
(2, 5, 'hẻm 43 Phường Xuân Khánh - Quận Ninh Kiều - TP Cần Thơ', '0392096955', 171000, 1, '2022-05-02 09:24:43', '2022-05-02 09:27:25'),
(3, 8, 'Xã Tân Sơn - Huyện Trà Cú - Trà Vinh', '0392096951', 490000, 1, '2022-05-02 09:26:45', '2022-05-03 02:09:32'),
(4, 9, 'Phường Hưng Lợi - Quận Ninh Kiều - TP Cần Thơ', '0392096952', 566000, 1, '2022-05-03 01:59:01', '2022-05-03 02:41:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_details_id`, `order_id`, `product_id`, `product_price`, `product_qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '100000', 19, '2022-05-02 02:35:54', '2022-05-02 02:35:54'),
(2, 1, 6, '51000', 1, '2022-05-02 02:35:54', '2022-05-02 02:35:54'),
(3, 1, 8, '120000', 1, '2022-05-02 02:35:54', '2022-05-02 02:35:54'),
(4, 2, 2, '120000', 1, '2022-05-02 09:24:43', '2022-05-02 09:24:43'),
(5, 2, 6, '51000', 1, '2022-05-02 09:24:43', '2022-05-02 09:24:43'),
(6, 3, 26, '490000', 1, '2022-05-02 09:26:45', '2022-05-02 09:26:45'),
(7, 4, 6, '51000', 3, '2022-05-03 01:59:01', '2022-05-03 01:59:01'),
(8, 4, 4, '71000', 3, '2022-05-03 01:59:01', '2022-05-03 01:59:01'),
(9, 4, 7, '200000', 1, '2022-05-03 01:59:01', '2022-05-03 01:59:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `product_desc`, `product_price`, `product_image`, `qty`, `created_at`, `updated_at`) VALUES
(1, 'Thuốc Dopolys-S Domesco Trị Suy Tĩnh Mạch Bạch Huyết (Hộp 3 Vỉ X 10 Viên)', 1, 'Dopolys-S có thành phần chính Ginkgo biloba extract 7 mg, Heptaminol hydrochlorid 150 mg, Troxerutin 150 mg để điều trị triệu chứng suy tĩnh mạch bạch huyết: Nặng chân, vọp bẻ, đau nhức, hội chứng cẳng chân rung khi nằm, điều trị những dấu hiệu chức năng có liên quan đến cơn trĩ cấp.', '120000', 'dopolys.jpg', 20, '2022-05-02 02:34:24', '2022-05-03 02:05:36'),
(2, 'Thuốc Clopidogrel 75Mg Mv Phòng Nhồi Máu Cơ Tim, Đột Quỵ', 1, 'Thuốc Clopidogrel 75 Mv dạng viên nén bao phim của Công ty TNHH US Pharma USA - Việt Nam có thành phần chính là Clopidogrel (dưới dạng Clopidogrel Bisulfat) 75mg là loại thuốc được chỉ định sử dụng để phòng ngừa cơn nhồi máu cơ tim và đột quỵ ở những người có bệnh tim (bị nhồi máu cơ tim gần đây), đột quỵ gần đây, hoặc bệnh tuần hoàn máu (bệnh mạch máu ngoại biên). Thuốc cũng được sử dụng chung với Aspirin để điều trị các cơn đau ngực gần đây hoặc cơn đau trở nặng hơn (đau tim, đau thắt ngực không ổn định), giữ cho các mạch máu giãn tốt và ngăn ngừa cục máu đông sau những can thiệp y tế nhất định (chẳng hạn như thông tim/nong mạch vành).', '120000', 'clopidogrel.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(3, 'Thuốc Cardilopin 5Mg Trị Tăng Huyết Áp (Hộp 3 Vỉ X 10 Viên)', 1, 'Cardilopin 5 do công ty Egis Pharmaceuticals PLC (Hungary) sản xuất, thành phần chính amlodipine, là thuốc dùng để điều trị tăng huyết áp; dùng đơn thuần hay phối hợp với các thuốc hạ huyết áp khác. Cardilopin 5 còn điều trị chứng đau thắt ngực ổn định và đau thắt ngực do co thắt mạch (đau thắt ngực Prinzmetal), dùng đơn thuần hay phối hợp với các thuốc chống đau thắt ngực khác.', '120000', 'cardilopin.jpg', 40, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(4, 'Hoạt Huyết Dưỡng Não Cerecaps Cải Thiện Suy Giảm Trí Nhớ, Chóng Mặt', 1, 'Thuốc Hoạt Huyết Dưỡng Não Cerecaps là dược phẩm của Công ty Cổ phần Dược Trung Ương Mediplantex, có thành phần chính cao khô hỗn hợp các dược liệu, giúp điều trị hiệu quả các trường hợp như: Suy giảm trí nhớ, đau đầu, hoa mắt chóng mặt, hay cáu gắt ở người có tuổi, thiếu máu, căng thẳng, mệt mỏi, mất tập trung, chứng tê bì, nhức mỏi chân tay (do thiểu năng tuần hoàn ngoại vi)...', '71000', 'cerecaps.jpg', 30, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(5, 'Amlodipin 5Mg Trị Tăng Huyết Áp, Đau Thắt Ngực Ổn Định', 1, 'Amlodipin 5mg của Công ty cổ phần dược phẩm Trường Thọ, thành phần chính là amlodipin. Amlodipin 5mg là thuốc điều trị tăng huyết áp, đau thắt ngực ổn định, đau thắt ngực kiểu Prinzmetal. Amlodipin 5mg được bào chế dưới dạng viên nén, đóng gói theo quy cách hộp 3 vỉ x 10 viên.', '146000', 'amlodipin.jpg', 30, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(6, 'Viên Ngậm Strepsils Throat Irritation Cough Tan Đàm, Làm Sạch Đường Thở', 1, 'Thuốc Strepsils Throat Irritation Cough là sản phẩm của Công ty Reckitt Benckiser Healthcare Manufacturing (Thailand) có chứa Ambroxol Hydrochlorid với công dụng giúp làm sạch đường thở và kiểm soát ho do phổi gây ra bởi chất nhầy dầy đặc. Viên ngậm hình tròn, màu vàng cam, có mùi cam đặc trưng.', '51000', 'strepsils.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(7, 'Thuốc Vigentin 500Mg/62.5Mg Trị Nhiễm Khuẩn Đường Hô Hấp', 1, 'Thuốc Vigentin 500mg/62.5mg là sản phẩm của Công ty Cổ phần Dược phẩm Trung ương - Pharbaco, thành phần chính amoxicillin và acid clavulanic, là thuốc dùng để điều trị trong thời gian ngắn các trường hợp nhiễm khuẩn sau: Nhiễm khuẩn đường hô hấp trên, nhiễm khuẩn đường hô hấp dưới, nhiễm khuẩn nặng đường tiết niệu - sinh dục bởi các chủng, nhiễm khuẩn da và mô mềm, nhiễm khuẩn xương và khớp, nhiễm khuẩn nha khoa, nhiễm khuẩn do nạo thai. Thuốc được bào chế dưới dạng thuốc bột pha hỗn dịch uống, bột thuốc màu trắng ngà hoặc hơi vàng, tơi xốp, không dính tay, vị ngọt, mùi thơm đặc trưng dễ chịu đóng gói trong túi giấy/nhôm/polyethylen hàn kín.', '200000', 'vigentin.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(8, 'Thuốc Fefasdin 60 Khapharco Trị Viêm Mũi Dị Ứng Theo Mùa', 1, 'Thuốc FEFASDIN 60 do Công ty Cổ phần Dược phẩm Khánh Hòa sản xuất có chứa Fexofenadin hydroclorid 60 mg với công dụng điều trị triệu chứng viêm mũi dị ứng theo mùa, mày đay mạn tính vô căn ở người lớn và trẻ em trên 6 tuổi. Viên nén bao phim màu hồng, một mặt có gạch ngang, một mặt có chữ KPC được dập trực tiếp trên mặt viên, cạnh và thành viên lành lặn.', '120000', 'fefasdin.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(9, 'Thuốc Bột Glucosamine 1500Mg Stada Sachet 30 Gói', 1, 'Thuốc bột Glucosamine là sản phẩm của Stada Arzneimittel AG - Đức có thành phần chính là Glucosamine sulfate có tác dụng giảm triệu chứng của thoái hóa khớp gối nhẹ và trung bình.', '130000', 'glucosamine.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(10, 'Thuốc Pokemine Medisun Bổ Sung Sắt ( 20 Ống X 10Ml)', 1, 'Pokemine do Công ty Cổ Phần Dược Phẩm MEDISUN có chứa Sắt nguyên tố (dưới dạng phức hợp sắt III hydroxid polymaltose) 50 mg dạng dung dịch uống 10 ml với công dụng bổ sung sắt cho bệnh nhân có nguy cơ bị thiếu máu do thiếu sắt như: Phụ nữ mang thai, phụ nữ cho con bú, người suy dinh dưỡng, người bệnh sau phẫu thuật, trẻ em thiếu máu do thiếu sắt, chậm lớn, còi cọc.', '120000', 'pokemine.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(11, 'Calcium Corbiere Extra 5Ml Sanofi Bổ Sung Canxi Cho Trẻ Em', 1, 'Dung dịch uống Calcium Corbiere Kids Extra 5ml là sản phẩm của Dược phẩm Sanofi có thành phần chính gồm Calcium Glubionate và Calcium Lactobionate dùng trong trường hợp bổ sung canxi có nhu cầu canxi cao như: Phụ nữ mang thai và cho con bú, trẻ em đang lớn,giai đoạn hồi phục, gãy xương, chứng còi xương và hỗ trợ điều trị loãng xương.', '150000', 'calcium.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(12, 'Thuốc Mydocalm 150Mg Trị Sự Tăng Trương Lực Cơ Xương', 1, 'Thuốc Mydocalm 150mg là dược phẩm của Gedeon Richter., Ltd - HUNG GA RY, có thành phần chính hoạt chất tolperison hydrochlorid 150mg. Thuốc được chỉ định điều trị sự tăng trương lực cơ xương trong các rối loạn thần kinh thực thể; tăng trương lực cơ, co thắt cơ và các co thắt kèm theo các bệnh vận động; phục hồi chức năng sau các phẫu thuật chấn thương - chỉnh hình; điều trị các bệnh nghẽn mạch cũng như những hội chứng xuất hiện trên cơ sở suy giảm sự phân bố thần kinh - mạch.', '230000', 'mydocalm.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(13, 'Viên Uống Làm Đẹp Da Perfect White Jpanwell 60 Viên', 2, 'Làn da căng mịn, hồng hào tự nhiên là chìa khóa cho nét đẹp vĩnh cửu mà mọi cô gái đều mong muốn sở hữu. Đó cũng chính là bí quyết mà những nhà làm đẹp Nhật Bản luôn theo đuổi nghiên cứu để hóa phép thần kỳ cho làn da phụ nữ, tạo nên chuẩn mực của nét đẹp hiện đại - làn da đầy sinh khí, rạng ngời không tì vết.', '1230000', 'perfect-ưhite.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(14, 'Viên Uống Hỗ Trợ Chống Oxy Hóa Glutasi Glutathione', 2, 'Glutathione ngăn chặn sự hình thành và sản sinh các hắc sắc tố melanin, nguyên nhân gây nên tình trạng sạm da, nám da. Glutathione còn giúp tăng cường sản sinh các sắc tố làm hồng trắng da, giúp mang lại cho bạn một làn da trắng hồng, giàu sức sống, tăng cường sự đàn hồi và làm mịn da, giúp trị nám da, tàn nhang, ngừa lão hóa da hiệu quả. Glutathione còn giúp phục hồi chức năng gan. Đặc biệt glutathione dùng trước khi trị xạ giúp bảo vệ tế bào khỏi sự tổn thương do bức xạ ion hóa, làm chậm tiến triển của bệnh AIDS. Nói cách khác Glutathione có thể giúp bạn giải độc cơ thể và hoạt động như một lá chắn bảo vệ.', '800000', 'glutasi-phytextra.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(15, 'Viên Uống Giảm Sạm Nám Skin Care Pigment Clear New Nordic 60 Viên', 2, 'Skin Care Pigment Clear từ Thụy Điển bổ sung chất dinh dưỡng phục vụ cho các chức năng quan trọng của da. Nuôi dưỡng làn da khỏe mạnh, trắng sáng từ bên trong, cải thiện sạm, nám, tàn nhang và hỗ trợ chống oxy hóa, giữ gìn vẻ tươi tắn của làn da.', '850000', 'skin-care.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(16, 'Đông Trùng Hạ Thảo Kotimogin (Hộp 20 vỉ x 3 viên)', 2, 'Đông trùng hạ thảo có vị ngọt, tính ôn vào hai kênh phế và thận, có tác dụng bồi bổ cơ thể cho người ốm, ích phế, bổ thận, bổ tinh tủy, cầm máu, hóa đờm, dùng chữa hư hao sinh ho, ho ra máu, liệt dương, lưng đau mỏi gối, di tinh, đau tim.', '330000', 'dong-trung-ha-thao-kotimogin.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(17, 'Viên Uống Giúp Ngủ Ngon Trùng Thảo Gold Thành Công 30 Viên', 2, 'Giấc ngủ rất quan trọng đối với cơ thể. Khi ngủ, các cơ quan sẽ được phục hồi năng lượng sau một ngày làm việc mệt mỏi, tái sinh các tế bào não và chuẩn bị ‘nhiên liệu’ cho những hoạt động tiếp theo trong ngày mới. Thiếu ngủ chính là vấn đề nghiêm trọng gây suy nhược cơ thể, căng thẳng thần kinh, đầu óc thiếu tỉnh táo, ăn uống kém và dẫn đến nhiều hệ lụy sức khỏe khác. ', '1230000', 'trung-thao.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(18, 'Viên Uống Bổ Khớp Plus Min New Phytextra 100 Viên', 2, 'Quan tâm đến xương khớp là cách để bạn có được cơ thể vững vàng, PLus Min New sẽ cùng bạn chăm sóc xương khớp khỏe mạnh và linh hoạt. PLus Min New tổng hợp các thành phần quan trọng nhất tốt cho quá trình tái tạo mô sụn khớp, nâng cao sức khỏe của hệ xương khớp và bảo vệ khớp tối ưu trong suốt quá trình vận động phục vụ cho cuộc sống của bạn.', '609000', 'phytextra.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(19, 'Viên Uống Bổ Sung Canxi Anica Phytextra Ngừa Loãng Xương, Còi Xương', 2, 'Chứa nguồn canxi, vitamin D3 và vitamin K2 dồi dào, Anica giúp tăng cường sức khỏe hệ cơ xương, hỗ trợ tăng chiều cao tối đa cho trẻ em và thanh thiếu niên, cải thiện tình trạng đau nhức xương khớp ở người cao tuổi.', '5130000', 'anica.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(20, 'Viên Uống Bổ Sung Canxi Omexxel Calk2 Excelife 30 Viên', 2, 'Omexxel Calk2 với công thức đặc biệt cung cấp các chất cần thiết cho quá trình tạo xương gồm: Calcium, Vitamin D3, Vitamin K2 và Omega 3. Đồng thời hỗ trợ giảm xơ vữa động mạch và nguy cơ mắc các bệnh tim mạch.', '330000', 'omexxel.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(21, 'Khẩu Trang Hamita N95 Medical Face Mask', 3, 'Khẩu Trang Hamita N95 Hộp 10 Cái với lớp lọc khuẩn công nghệ tĩnh điện để giữ lại các hạt mịn ô nhiễm không khí hiệu quả: Trên 95% bụi mịn 0.3 micron và trên 98% bụi mịn &lt; 2.5 micron. Đây là khẩu trang y tế chủng loại N95 được khuyến nghị sử dụng khi chỉ số chất lượng không khí trên 100 (AQI).', '65000', 'khautranghamita.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(22, 'Khẩu Trang Y Tế Cao Cấp Vĩnh Tiến Kn95', 3, 'Khẩu Trang Y Tế Cao Cấp Vĩnh Tiến Kn95 3Hmask 12C được sản xuất bằng công nghệ hiện đại, kháng khuẩn đến 99%, dễ dàng hít thở và không gây dị ứng cho người sử dụng.', '79000', 'khau-trang-y-te-cao-cap-vinh-tien-kn95.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(23, 'Khẩu Trang Y Tế Người Lớn Hamita Advanced 4D Mask (Gói 5 Cái)', 3, 'Khẩu trang y tế người lớn Hamita Advanced 4D Mask có khả năng bảo vệ chống nhiễm khuẩn đến 99.60%, thiết kế 4D thông minh ôm khít khuôn mặt, giúp bảo vệ hiệu quả khỏi khói bụi ô nhiễm, chống giọt bắn và vi khuẩn từ môi trường.', '40000', '00030973-khau-trang-y-te-nguoi-lon-hamita-advanced-4d-mask-goi-5-cai-4771-60b4_large.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(24, 'Nhiệt Kế Đầu Mềm Beurer Ft15', 3, 'Nhiệt Kế Đầu Mềm Beurer Ft15 giúp đo nhiệt độ nhanh trong khoảng 10 giây, đầu đo mềm, linh hoạt, an toàn với trẻ nhỏ. Thiết bị có các chức năng nổi bật như: Phát tín hiệu âm thanh báo kết quả đo, cảnh báo sốt, tự động tắt, không thấm nước,...', '165000', '00031819-nhiet-ke-dau-mem-beurer-ft15-5365-6114_large.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(25, 'Kem Đánh Răng Lipzo Gum Protect 95G', 4, ' Lipzo Gum Protect là sự kết hợp giữa Xylitol, tính chất muối biển, keo ong, thảo dược cây xô thơm và quả ổi, sản phẩm giúp kháng khuẩn tự nhiên, ngăn ngừa chảy máu chân răng, đặc biệt ngăn ngừa tụt nướu và phục hồi chân nướu săn chắc cho nụ cười bạn không chỉ đẹp mà còn khỏe từ bên trong.', '65000', '00029554-kem-danh-rang-lipzo-gum-protect-95g-2021-600a_large.jpg', 50, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(26, 'Nước Hồng Sâm Hongsamjin Plus 15 Gói X 70Ml', 4, 'Nước Hồng Sâm Hongsamjin Plus là sản phẩm kết hợp các thành phần cao cấp, quý hiếm như chiết xuất Hồng sâm Hàn Quốc 6 năm tuổi, Gạc Hươu, Linh Chi, Nhung Hươu, Táo đỏ và Câu Kỷ Tử mang đến giá trị dinh dưỡng tuyệt vời trong dạng túi độc đáo, hiện đại, tiện lợi. Sử dụng sản phẩm giúp bổ sung dinh dưỡng, tăng cường sức khỏe và sức đề kháng cho người dùng.', '490000', '00033432-nuoc-hong-sam-hongsamjin-plus-15-goi-x-70ml-6712-6214_large.jpg', 10, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(27, 'Viên Tinh Nghệ Mật Ong Sữa Chúa Honeyland Tốt Cho Sức Khỏe 120G', 4, 'Viên tinh nghệ mật sữa chúa là sự kết hợp hoàn hảo của sữa ong chúa tươi, mật ong và tinh nghệ Curcumin tạo ra 1 sản phẩm chất lượng có mùi vị thơm ngon, tiện lợi khi sử dụng và tốt cho sức khỏe.', '196000', '00033624-vien-tinh-nghe-mat-ong-sua-chua-honeyland-120g-2289-6233_large.jpg', 10, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(28, 'Nước Xịt Khuẩn Tay Natural Hand Sanitizer 500Ml', 4, 'Dung dịch rửa tay khô Natural Hand Sanitizer là sản phẩm giúp làm sạch và loại bỏ hầu hết vi khuẩn gây hại trên da tay mà không cần rửa lại bằng nước, giúp bảo vệ sức khỏe nhưng vẫn giữ cho tay bạn luôn mềm mại, dễ chịu. Ngoài ra, sản phẩm với hương thơm trà xanh và sả chanh dễ chịu, giúp khử mùi cho đôi tay hiệu quả', '16000', '00032957-dung-dich-rua-tay-kho-natural-hand-sanitizer-500ml-4459-61af_large.jpg', 10, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(29, 'Kem Đánh Răng Dental Sensitive Whitening - Trắng Răng Cho Răng Nhạy Cảm - 100Ml', 4, 'Kem đánh răng Dental Sensitive Whitening Formula giúp cải thiện tình trạng ê buốt, nhẹ nhàng tạo nên lớp bảo vệ tự nhiên, giúp răng ngày một chắc khỏe và trắng sáng hơn.', '99000', '00028946-kem-danh-rang-dental-sensitive-whitening-trang-rang-cho-rang-nhay-cam-100ml-7383-5fd0_large.jpg', 10, '2022-05-02 02:34:24', '2022-05-02 02:34:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_detail`
--

CREATE TABLE `products_detail` (
  `product_detail_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_detail`
--

INSERT INTO `products_detail` (`product_detail_id`, `product_id`, `category_name`, `product_desc`, `created_at`, `updated_at`) VALUES
(3, 1, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', '2022-05-03 02:07:34'),
(4, 1, 'Dạng bào chế', 'Viên nan cứng', '2022-05-02 02:34:24', NULL),
(5, 1, 'Thuốc cần kê toa', 'Không', '2022-05-02 02:34:24', NULL),
(6, 1, 'Cảnh Báo', 'Phụ nữ có thai và cho con bú', '2022-05-02 02:34:24', NULL),
(7, 2, 'Thành Phần Chính', 'Clopidogrel', '2022-05-02 02:34:24', NULL),
(8, 2, 'Quy Cách', 'Hộp 3 vỉ x 10 viên', '2022-05-02 02:34:24', NULL),
(9, 2, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(10, 2, 'Dạng bào chế', 'Viên nén', '2022-05-02 02:34:24', NULL),
(11, 2, 'Thuốc cần kê toa', 'Có (Thuốc chỉ dùng theo đơn của bác sĩ)', '2022-05-02 02:34:24', NULL),
(12, 2, 'Cảnh Báo', 'Phụ nữ có thai, Suy gan, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(14, 3, 'Quy Cách', 'Hộp 3 vỉ x 10 viên', '2022-05-02 02:34:24', NULL),
(15, 3, 'Xuất Xứ Thương Hiệu', 'Hungary', '2022-05-02 02:34:24', NULL),
(16, 3, 'Dạng bào chế', 'Viên nén', '2022-05-02 02:34:24', NULL),
(17, 3, 'Thuốc cần kê toa', 'Có (Thuốc chỉ dùng theo đơn của bác sĩ)', '2022-05-02 02:34:24', NULL),
(18, 3, 'Cảnh Báo', 'Lái tàu xe, Phụ nữ có thai', '2022-05-02 02:34:24', NULL),
(19, 4, 'Thành Phần Chính', 'Ngưu tất (Rễ), Chỉ xác, Sài Hồ, Xích thược, Sinh Địa, Xuyên khung, Hồng hoa, Cam thảo', '2022-05-02 02:34:24', NULL),
(20, 4, 'Quy Cách', 'Hộp 3 vỉ x 10 viên', '2022-05-02 02:34:24', NULL),
(21, 4, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(22, 4, 'Dạng bào chế', 'Viên nang cứng', '2022-05-02 02:34:24', NULL),
(23, 4, 'Thuốc cần kê toa', 'Không', '2022-05-02 02:34:24', NULL),
(24, 4, 'Cảnh Báo', 'Phụ nữ có thai', '2022-05-02 02:34:24', NULL),
(25, 5, 'Thành Phần Chính', 'Amlodipine', '2022-05-02 02:34:24', NULL),
(26, 5, 'Quy Cách', 'Hộp 3 vỉ x 10 viên', '2022-05-02 02:34:24', NULL),
(27, 5, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(28, 5, 'Dạng bào chế', 'Viên nang cứng', '2022-05-02 02:34:24', NULL),
(29, 5, 'Thuốc cần kê toa', 'Có (Thuốc chỉ dùng theo đơn của bác sĩ)', '2022-05-02 02:34:24', NULL),
(30, 5, 'Cảnh Báo', 'Phụ nữ có thai, Suy gan thận, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(31, 6, 'Thành Phần Chính', 'Ambroxol', '2022-05-02 02:34:24', NULL),
(32, 6, 'Quy Cách', 'Hộp 2 vỉ x 12 viên', '2022-05-02 02:34:24', NULL),
(33, 6, 'Xuất Xứ Thương Hiệu', 'Anh', '2022-05-02 02:34:24', NULL),
(34, 6, 'Dạng bào chế', 'Viên ngậm', '2022-05-02 02:34:24', NULL),
(35, 6, 'Thuốc cần kê toa', 'Không', '2022-05-02 02:34:24', NULL),
(36, 6, 'Cảnh Báo', 'Phụ nữ có thai', '2022-05-02 02:34:24', NULL),
(37, 7, 'Thành Phần Chính', 'Amoxicillin, Clavulanic acid', '2022-05-02 02:34:24', NULL),
(38, 7, 'Quy Cách', 'Hộp 12 gói', '2022-05-02 02:34:24', NULL),
(39, 7, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(40, 7, 'Dạng bào chế', 'Dạng bột', '2022-05-02 02:34:24', NULL),
(41, 7, 'Thuốc cần kê toa', ' Có (Thuốc chỉ dùng theo đơn của bác sĩ)', '2022-05-02 02:34:24', NULL),
(42, 7, 'Cảnh Báo', 'Trẻ em, Người cao tuổi', '2022-05-02 02:34:24', NULL),
(43, 8, 'Thành Phần Chính', ' Fexofenadine', '2022-05-02 02:34:24', NULL),
(44, 8, 'Quy Cách', 'Hộp 10 vỉ x 10 viên', '2022-05-02 02:34:24', NULL),
(45, 8, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(46, 8, 'Dạng bào chế', 'Viên nén bao phim', '2022-05-02 02:34:24', NULL),
(47, 8, 'Thuốc cần kê toa', 'Không', '2022-05-02 02:34:24', NULL),
(48, 8, 'Cảnh Báo', 'Trên 12 tuổi', '2022-05-02 02:34:24', NULL),
(49, 9, 'Thành Phần Chính', 'Glucosamine, Tá dược vừa đủ', '2022-05-02 02:34:24', NULL),
(50, 9, 'Quy Cách', 'Hộp 30 gói x 4 g', '2022-05-02 02:34:24', NULL),
(51, 9, 'Xuất Xứ Thương Hiệu', 'Đức', '2022-05-02 02:34:24', NULL),
(52, 9, 'Dạng bào chế', 'Dạng bột', '2022-05-02 02:34:24', NULL),
(53, 9, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(54, 9, 'Cảnh Báo', ' Người tiểu đường', '2022-05-02 02:34:24', NULL),
(55, 10, 'Thành Phần Chính', 'Sắt', '2022-05-02 02:34:24', NULL),
(56, 10, 'Quy Cách', 'Hộp 20 ống', '2022-05-02 02:34:24', NULL),
(57, 10, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(58, 10, 'Dạng bào chế', 'Dung dịch', '2022-05-02 02:34:24', NULL),
(59, 10, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(60, 10, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(61, 11, 'Thành Phần Chính', ' Calci lactat, Canxi gluconat', '2022-05-02 02:34:24', NULL),
(62, 11, 'Quy Cách', 'Hộp 3 vỉ x 10 ống x 5ml', '2022-05-02 02:34:24', NULL),
(63, 11, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(64, 11, 'Dạng bào chế', 'Dung dịch', '2022-05-02 02:34:24', NULL),
(65, 11, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(66, 11, 'Cảnh Báo', 'Trên 2 tuổi', '2022-05-02 02:34:24', NULL),
(67, 12, 'Thành Phần Chính', 'Tolperisone', '2022-05-02 02:34:24', NULL),
(68, 12, 'Quy Cách', 'Hộp 3 vỉ x 10 viên', '2022-05-02 02:34:24', NULL),
(69, 12, 'Xuất Xứ Thương Hiệu', 'Hungary', '2022-05-02 02:34:24', NULL),
(70, 12, 'Dạng bào chế', 'Viên nén bao phim', '2022-05-02 02:34:24', NULL),
(71, 12, 'Thuốc cần kê toa', 'Có (Thuốc chỉ dùng theo đơn của bác sĩ)', '2022-05-02 02:34:24', NULL),
(72, 12, 'Cảnh Báo', 'Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(73, 13, 'Thành Phần Chính', 'Collagen cá', '2022-05-02 02:34:24', '2022-05-02 18:51:40'),
(74, 13, 'Quy Cách', 'Hộp 60 viên', '2022-05-02 02:34:24', NULL),
(75, 13, 'Xuất Xứ Thương Hiệu', 'Nhật Bản', '2022-05-02 02:34:24', NULL),
(76, 13, 'Dạng bào chế', 'Viên nang cứng', '2022-05-02 02:34:24', NULL),
(77, 13, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(78, 13, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(79, 14, 'Thành Phần Chính', 'Glutathione, Collagen marin, Acid alpha lipoic', '2022-05-02 02:34:24', NULL),
(80, 14, 'Quy Cách', 'Hộp 60 viên', '2022-05-02 02:34:24', NULL),
(81, 14, 'Xuất Xứ Thương Hiệu', 'Pháp', '2022-05-02 02:34:24', NULL),
(82, 14, 'Dạng bào chế', 'Viên nang', '2022-05-02 02:34:24', NULL),
(83, 14, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(84, 14, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(85, 15, 'Thành Phần Chính', 'Chiết xuất quả lựu, Chùm ruột núi', '2022-05-02 02:34:24', NULL),
(86, 15, 'Quy Cách', 'Hộp 60 viên', '2022-05-02 02:34:24', NULL),
(87, 15, 'Xuất Xứ Thương Hiệu', 'Thụy Điển', '2022-05-02 02:34:24', NULL),
(88, 15, 'Dạng bào chế', 'Viên nén', '2022-05-02 02:34:24', NULL),
(89, 15, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(90, 15, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(91, 16, 'Thành Phần Chính', 'Nhân Sâm', '2022-05-02 02:34:24', NULL),
(92, 16, 'Quy Cách', 'Hộp 20 vỉ x 3 viên', '2022-05-02 02:34:24', NULL),
(93, 16, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(94, 16, 'Dạng bào chế', 'Viên nang mềm', '2022-05-02 02:34:24', NULL),
(95, 16, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(96, 16, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(97, 17, 'Thành Phần Chính', 'Ginkgo biloba', '2022-05-02 02:34:24', NULL),
(98, 17, 'Quy Cách', 'Hộp 30 viên', '2022-05-02 02:34:24', NULL),
(99, 17, 'Xuất Xứ Thương Hiệu', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(100, 17, 'Dạng bào chế', 'Viên nén', '2022-05-02 02:34:24', NULL),
(101, 17, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(102, 17, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(103, 18, 'Thành Phần Chính', 'Glucosamine sulphate, Calci carbonate nano', '2022-05-02 02:34:24', NULL),
(104, 18, 'Quy Cách', 'Hộp 100 viên', '2022-05-02 02:34:24', NULL),
(105, 18, 'Xuất Xứ Thương Hiệu', 'Pháp', '2022-05-02 02:34:24', NULL),
(106, 18, 'Dạng bào chế', 'Viên nén', '2022-05-02 02:34:24', NULL),
(107, 18, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(108, 18, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(109, 19, 'Thành Phần Chính', 'Calcium Carbonate', '2022-05-02 02:34:24', NULL),
(110, 19, 'Quy Cách', 'Hộp 60 viên', '2022-05-02 02:34:24', NULL),
(111, 19, 'Xuất Xứ Thương Hiệu', 'Pháp', '2022-05-02 02:34:24', NULL),
(112, 19, 'Dạng bào chế', 'Viên nang', '2022-05-02 02:34:24', NULL),
(113, 19, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(114, 19, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(115, 20, 'Thành Phần Chính', 'Calcium', '2022-05-02 02:34:24', NULL),
(116, 20, 'Quy Cách', 'Hộp 3 vỉ x 10 viên', '2022-05-02 02:34:24', NULL),
(117, 20, 'Xuất Xứ Thương Hiệu', 'Hoa Kỳ', '2022-05-02 02:34:24', NULL),
(118, 20, 'Dạng bào chế', 'Viên nang mềm', '2022-05-02 02:34:24', NULL),
(119, 20, 'Thuốc cần kê toa', ' Không', '2022-05-02 02:34:24', NULL),
(120, 20, 'Cảnh Báo', 'Trẻ em, Phụ nữ có thai, Phụ nữ cho con bú', '2022-05-02 02:34:24', NULL),
(121, 21, 'Thành Phần', 'Vải không dệt PP, Vải bông, giấy kháng khuẩn MELTBLOWN, Thanh nẹp mũi bằng nhựa, Dây đeo có tính đàn hồ', '2022-05-02 02:34:24', NULL),
(122, 21, 'Xuất Xứ', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(123, 21, 'Màu Sắc', 'Trắng', '2022-05-02 02:34:24', NULL),
(124, 21, 'Công Dụng', 'Khẩu Trang Hamita N95 được thiết kế để bảo vệ sức khỏe cộng đồng. Ngăn ngừa sự xâm nhập của vi khuẩn, bụi, khói, giọt bắn...', '2022-05-02 02:34:24', NULL),
(125, 22, 'Thành Phần', 'Vải không dệt công nghệ mới, siêu mềm mịn,Lớp màng lọc', '2022-05-02 02:34:24', NULL),
(126, 22, 'Xuất Xứ', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(127, 22, 'Màu Sắc', 'Trắng', '2022-05-02 02:34:24', NULL),
(128, 22, 'Công Dụng', 'Khẩu Trang Y Tế Cao Cấp Vĩnh Tiến Kn95 3Hmask 12C được sản xuất bằng công nghệ hiện đại, kháng khuẩn đến 99%, dễ dàng hít thở và không gây dị ứng cho người sử dụng.', '2022-05-02 02:34:24', NULL),
(129, 23, 'Thành Phần', 'Vải không dệt PP, giấy kháng khuẩn MELTBLOWN, Vải kháng khuẩn SMS', '2022-05-02 02:34:24', NULL),
(130, 23, 'Xuất Xứ', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(131, 23, 'Màu Sắc', 'Trắng', '2022-05-02 02:34:24', NULL),
(132, 23, 'Công Dụng', 'Khẩu trang y tế người lớn Hamita Advanced 4D Mask có khả năng bảo vệ chống nhiễm khuẩn đến 99.60%, thiết kế 4D thông minh ôm khít khuôn mặt, giúp bảo vệ hiệu quả khỏi khói bụi ô nhiễm, chống giọt bắn và vi khuẩn từ môi trường.', '2022-05-02 02:34:24', NULL),
(133, 24, 'Quy Cách', 'Hộp 1 Cái', '2022-05-02 02:34:24', NULL),
(134, 24, 'Xuất Xứ', 'Đức', '2022-05-02 02:34:24', NULL),
(135, 24, 'Màu Sắc', 'Trắng', '2022-05-02 02:34:24', NULL),
(136, 24, 'Công Dụng', 'Nhiệt Kế Đầu Mềm Beurer Ft15 giúp đo nhiệt độ nhanh trong khoảng 10 giây, đầu đo mềm, linh hoạt, an toàn với trẻ nhỏ. Thiết bị có các chức năng nổi bật như: Phát tín hiệu âm thanh báo kết quả đo, cảnh báo sốt, tự động tắt, không thấm nước,...', '2022-05-02 02:34:24', NULL),
(137, 25, 'Thành Phần', ' Sorbitol, Hydrated silica, Flavor, Cellulose gum, Sodium fluoride, Sodium saccharin, Troxerutin, Water Sodium Chloride, PEG-32, Xylitol Sodium Lauryl Sulfat, Psidium Guajava Fruit, Propolis Extract, Mica', '2022-05-02 02:34:24', NULL),
(138, 25, 'Quy Cách', 'tuýp 95g', '2022-05-02 02:34:24', NULL),
(139, 25, 'Xuất Xứ', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(140, 25, 'Công Dụng', 'Lipzo Gum Protect là sự kết hợp giữa Xylitol, tính chất muối biển', '2022-05-02 02:34:24', NULL),
(141, 26, 'Thành Phần', 'Hồng sâm, Nhung hươu, Táo đỏ, Câu kỷ tử, Nước cất, Fructooligosaccharides, Quế, Gừng, Linh chi', '2022-05-02 02:34:24', NULL),
(142, 26, 'Quy Cách', 'Hộp 50 Viên', '2022-05-02 02:34:24', NULL),
(143, 26, 'Xuất Xứ', 'Hàn Quốc', '2022-05-02 02:34:24', NULL),
(144, 26, 'Công Dụng', 'Nước Hồng Sâm Hongsamjin Plus là sản phẩm kết hợp các thành phần cao cấp, quý hiếm như chiết xuất Hồng sâm Hàn Quốc 6 năm tuổi, Gạc Hươu, Linh Chi, Nhung Hươu, Táo đỏ và Câu Kỷ Tử mang đến giá trị dinh dưỡng', '2022-05-02 02:34:24', NULL),
(145, 27, 'Thành Phần', ' Curcumin, Mật ong, Sữa ong chúa', '2022-05-02 02:34:24', NULL),
(146, 27, 'Nhà Sản Xuất', 'Công Ty Cổ Phần Ong Mật Tiền Giang', '2022-05-02 02:34:24', NULL),
(147, 27, 'Xuất Xứ', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(148, 27, 'Công Dụng', 'Viên tinh nghệ mật sữa chúa là sự kết hợp hoàn hảo của sữa ong chúa tươi, mật ong và tinh nghệ Curcumin tạo ra 1 sản phẩm chất lượng có mùi vị thơm ngon, tiện lợi khi sử dụng và tốt cho sức khỏe.', '2022-05-02 02:34:24', NULL),
(149, 28, 'Mùi Hương', ' Hương trà xanh, Hương Chanh, Hương sả', '2022-05-02 02:34:24', NULL),
(150, 28, 'Nhà Sản Xuất', 'Lavita', '2022-05-02 02:34:24', NULL),
(151, 28, 'Xuất Xứ', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(152, 28, 'Công Dụng', 'Dung dịch rửa tay khô Natural Hand Sanitizer là sản phẩm giúp làm sạch và loại bỏ hầu hết vi khuẩn gây hại trên da tay.', '2022-05-02 02:34:24', NULL),
(153, 29, 'Thành Phần', '  Water, Hydrated silica, Sorbitol, Glycerin, Peg-8, Flavor, Titanium dioxide, Cocamidopropyl betaine, Xanthan gum, Sodium hydroxide, Sodium', '2022-05-02 02:34:24', NULL),
(154, 29, 'Quy Cách', 'Tuýp 100ml', '2022-05-02 02:34:24', NULL),
(155, 29, 'Xuất Xứ', 'Việt Nam', '2022-05-02 02:34:24', NULL),
(156, 29, 'Công Dụng', 'Kem đánh răng Dental Sensitive Whitening Formula giúp cải thiện tình trạng ê buốt, ', '2022-05-02 02:34:24', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Thuốc', '2022-05-02 02:34:24', '2022-05-02 18:53:35'),
(2, 'Thực phẩm chức năng', '2022-05-02 02:34:24', NULL),
(3, 'Thiết Bị Y Tế', '2022-05-02 02:34:24', NULL),
(4, 'Chăm Sóc Cá Nhân', '2022-05-02 02:34:24', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$pXIHsRGhhrQGEN2Amr1AuuBeNJJ2OQLGh74X.dxrgr3aFbzweGya6', '0392096959', 1, NULL, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(2, 'Nguyễn Quỳnh Vy Vy', 'vy@gmail.com', '$2y$10$cuQTT.qJyi7S2p699DIxLuW7ehR1B2msnLXFpRGu9GTWtgyNEDQku', '0392096958', 1, NULL, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(3, 'Lâm Thanh Khang', 'Khang@gmail.com', '$2y$10$s.g581XSZxac8cC/KSmPUuEhxoNC37jIJ.GdJEfOW8rrlV1UHg5DC', '0392096957', 1, NULL, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(4, 'Nguyễn Trung Hậu', 'hậu@gmail.com', '$2y$10$2jfvP0P42dU4mBTYPPoDEOz//UseJt.nrVDVwnb4HF8k2rOBrOnnK', '0392096956', 1, NULL, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(5, 'Nguyễn Khánh Linh', 'nklinh1@gmail.com', '$2y$10$urr1dRnqAPjFhjnWrOT4zOlAV/Nso7L1g.jPQnBsFGnq/Kf.VSD7y', '0392096968', 0, NULL, '2022-05-02 02:34:24', '2022-05-02 02:34:24'),
(6, 'Huỳnh Khắc Sử', 'sub1809508@student.ctu.edu.vn', '$2y$10$GH/2DpmJhFJC5JAP9H50/.fts06fst6eEu8z/OKxw5aSJDjQas6CC', '0987453397', 0, NULL, '2022-05-02 02:35:09', '2022-05-02 02:35:09'),
(7, 'Lý Minh Tường', 'tuong@gmail.com', '$2y$10$xjrNYcTaEZ3xj/eP/Kly..zy8eDhzecgkPTK3D3siQV8lmyugoQYm', '0392096955', 1, NULL, '2022-05-02 02:39:02', '2022-05-02 02:39:02'),
(8, 'Huỳnh Phươc Vinh', 'vinh@gmail.com', '$2y$10$dVxxBPy2Z1VZ0ZDj49J2VOLi7Ldb3W/MARPglAU54xR7KmvIxVpr.', '0392096951', 0, NULL, '2022-05-02 09:25:56', '2022-05-02 09:25:56'),
(9, 'Huỳnh Ngọc Anh', 'anh@gmail.com', '$2y$10$65WRTnFhcbOgFu6giVqI2em0w30hYK4Q1S9x5subq.GrgGhiGmKfC', '0392096952', 0, NULL, '2022-05-03 01:56:23', '2022-05-03 01:56:23');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  ADD PRIMARY KEY (`product_detail_id`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `products_detail`
--
ALTER TABLE `products_detail`
  MODIFY `product_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT cho bảng `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
