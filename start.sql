/*
 Navicat Premium Data Transfer

 Source Server         : dktstore
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : dktshop

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 26/09/2023 10:50:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `cartId` bigint UNSIGNED NOT NULL,
  `productId` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cartId`, `productId`) USING BTREE,
  INDEX `cart_items_productid_foreign`(`productId` ASC) USING BTREE,
  CONSTRAINT `cart_items_cartid_foreign` FOREIGN KEY (`cartId`) REFERENCES `carts` (`cartId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (2, 1, 16, '2023-09-25 04:46:58', '2023-09-25 09:26:06');
INSERT INTO `cart_items` VALUES (2, 5, 10, '2023-09-25 06:26:24', '2023-09-25 09:25:49');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `cartId` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` bigint UNSIGNED NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cartId`) USING BTREE,
  UNIQUE INDEX `carts_userid_unique`(`userId` ASC) USING BTREE,
  CONSTRAINT `carts_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (2, 20, 427200000, '2023-09-24 17:02:53', '2023-09-25 09:26:06');
INSERT INTO `carts` VALUES (3, 3, 0, '2023-09-25 07:58:48', '2023-09-25 07:58:48');
INSERT INTO `carts` VALUES (4, 4, 0, '2023-09-25 08:09:46', '2023-09-25 08:09:46');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryId` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `textDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Điện Thoại', 'Là một thiết bị điện thoại thông minh có một màn hình cảm ứng với kích thước và độ phân giải cao hơn so với điện thoại truyền thống. Điện thoại thông minh được coi như một máy tính di động kết hợp với máy ảnh kỹ thuật số và thiết bị chơi game cầm tay, vì ', '2023-08-28 04:39:54', '2023-09-25 09:01:30', 1);
INSERT INTO `category` VALUES (2, 'Laptop', 'Giống PC nhưng tiện hơn :))) 10', '2023-08-28 08:56:38', '2023-09-06 02:58:44', 1);

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `customer_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `birth` datetime NOT NULL,
  `credit_card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  UNIQUE INDEX `customers_user_id_unique`(`user_id` ASC) USING BTREE,
  CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 1, '2023-08-10 06:22:40', '654564564545', '2023-08-08 06:22:40', '2023-08-08 06:22:40');
INSERT INTO `customers` VALUES (2, 3, '2023-08-10 06:26:37', '7902205166269', '2023-08-08 06:26:37', '2023-08-08 06:26:37');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `employee_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `birth` datetime NOT NULL,
  `salary` double NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`) USING BTREE,
  UNIQUE INDEX `employees_user_id_unique`(`user_id` ASC) USING BTREE,
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (14, 18, '2023-08-02 07:21:47', 10000000, 1, '2023-08-22 07:21:47', '2023-08-22 07:21:47');
INSERT INTO `employees` VALUES (16, 20, '2001-05-23 10:40:58', 11000000000, 1, '2023-08-22 07:56:13', '2023-08-28 10:40:58');
INSERT INTO `employees` VALUES (17, 21, '2023-08-01 08:31:55', 1000000, 1, '2023-08-22 07:56:43', '2023-08-22 08:31:55');
INSERT INTO `employees` VALUES (18, 22, '2023-08-02 07:57:11', 100000000, 1, '2023-08-22 07:57:11', '2023-08-22 07:57:11');
INSERT INTO `employees` VALUES (19, 23, '2023-08-08 07:58:04', 10000000, 1, '2023-08-22 07:58:04', '2023-08-22 07:58:04');
INSERT INTO `employees` VALUES (20, 24, '2023-08-03 08:32:58', 45645645645645, 1, '2023-08-22 08:32:58', '2023-08-22 08:32:58');
INSERT INTO `employees` VALUES (21, 25, '2023-08-02 10:24:17', 156156165165, 1, '2023-08-23 10:24:17', '2023-08-23 10:24:17');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (9, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (10, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (11, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (12, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (13, '2016_06_01_000001_create_oauth_auth_codes_table', 2);
INSERT INTO `migrations` VALUES (14, '2016_06_01_000002_create_oauth_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (15, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2);
INSERT INTO `migrations` VALUES (16, '2016_06_01_000004_create_oauth_clients_table', 2);
INSERT INTO `migrations` VALUES (17, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
INSERT INTO `migrations` VALUES (18, '2023_08_02_080025_create_employees_table', 3);
INSERT INTO `migrations` VALUES (19, '2014_10_12_000000_create_guest_table', 4);
INSERT INTO `migrations` VALUES (20, '2023_08_07_091945_create_employees', 5);
INSERT INTO `migrations` VALUES (21, '2023_08_07_094027_create_customers', 6);
INSERT INTO `migrations` VALUES (22, '2023_08_10_105359_change_type_role_user', 7);
INSERT INTO `migrations` VALUES (23, '2023_08_23_090535_create_room', 8);
INSERT INTO `migrations` VALUES (24, '2023_08_23_094532_add_room_name_attributes', 9);
INSERT INTO `migrations` VALUES (25, '2023_08_28_040256_create_category', 10);
INSERT INTO `migrations` VALUES (26, '2023_08_28_064917_add_visible_column_to_category_table', 11);
INSERT INTO `migrations` VALUES (28, '2023_08_29_042015_create_products', 12);
INSERT INTO `migrations` VALUES (52, '2023_09_19_090058_create_order_table', 13);
INSERT INTO `migrations` VALUES (53, '2023_09_19_095143_create_order_details_table', 13);
INSERT INTO `migrations` VALUES (54, '2023_09_21_084655_create_carts_table', 13);
INSERT INTO `migrations` VALUES (55, '2023_09_21_094317_create_cart_items_table', 13);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('0079da66eeac9e71a2f0a2b90695dfd8d2051a0b88e7196038c94dc66932d0e625e4008b9cbb6aeb', 4, 1, 'authToken', '[]', 1, '2023-08-11 06:46:24', '2023-08-11 10:28:30', '2024-08-11 06:46:24');
INSERT INTO `oauth_access_tokens` VALUES ('0085f15404b0d1234faee01dc128095fa3fdb635f9875bb82cc0416bf8d5ff3a3afd2bb644e1ca64', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:57:20', '2023-07-31 06:57:20', '2024-07-31 06:57:20');
INSERT INTO `oauth_access_tokens` VALUES ('02d65ee38c7b2b81ad2be0a53965375b8d6629768ac687baaef91103b722c3ec7e6f88c7ac12ca27', 3, 1, 'authToken', '[]', 0, '2023-07-31 08:53:28', '2023-07-31 08:53:28', '2024-07-31 08:53:28');
INSERT INTO `oauth_access_tokens` VALUES ('045412face1344b7f7b827708dcfe25c12299cc73e6dfd5cb159b68d3fa2d65917d650a5a840c4a1', 20, 1, 'authToken', '[]', 1, '2023-09-25 08:59:36', '2023-09-25 09:12:09', '2024-09-25 08:59:36');
INSERT INTO `oauth_access_tokens` VALUES ('090f72383c87dbfdf526dc8587a84e7414c87bc6424f7824051d115b4c8f440d38657642d6ca5360', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:54:54', '2023-07-31 06:54:54', '2024-07-31 06:54:54');
INSERT INTO `oauth_access_tokens` VALUES ('0bfd4711591502074d71fd1baf372448c170c2ebacb284a4bea2e78df51194e24694eae896681e96', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:06:59', '2023-07-29 15:06:59', '2024-07-29 15:06:59');
INSERT INTO `oauth_access_tokens` VALUES ('0df2e486a4f27d1fea0813f9b79f84508c4b67328a17ae1091d9802628d5112182a0f854e5b5b511', 4, 1, 'authToken', '[]', 1, '2023-08-07 06:42:21', '2023-08-07 06:42:24', '2024-08-07 06:42:21');
INSERT INTO `oauth_access_tokens` VALUES ('0f2ab328b571cf2b3e97f9a67fb8531ce63d961d12a8b94c1e0dec388aba6efd85ab46368a95b89f', 4, 1, 'authToken', '[]', 0, '2023-08-07 02:53:41', '2023-08-07 02:53:41', '2024-08-07 02:53:41');
INSERT INTO `oauth_access_tokens` VALUES ('13f30fb2111c6e7a68ecfbeb598a171b6751b5ac4d4caaaa5515f7a0a3ba6b310ae38e250df093ea', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:15:12', '2023-07-29 15:15:12', '2024-07-29 15:15:12');
INSERT INTO `oauth_access_tokens` VALUES ('1935cd4ed6fa051fe6544b00de5e91ddcaa88eb4a4b3c383f7f85c8e5a682f651d6347e82ab71019', 1, 1, 'authToken', '[]', 0, '2023-08-10 10:10:43', '2023-08-10 10:10:43', '2024-08-10 10:10:43');
INSERT INTO `oauth_access_tokens` VALUES ('1b2a3441e9878e1988925991b6db4b51fc0cfae13715654eaec7ebe7021135ff8b3d02d9f4b4306e', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:31:05', '2023-07-31 06:31:05', '2024-07-31 06:31:05');
INSERT INTO `oauth_access_tokens` VALUES ('1d25e2d588f0877b1b1541d7b6411cdf9fef36cc57ad88520ad1982d53c2be8a428979ba7323e1c3', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:10:43', '2023-07-29 15:10:43', '2024-07-29 15:10:43');
INSERT INTO `oauth_access_tokens` VALUES ('1f74ec3e304b172cab9ee15688959029f876c565478597b00be6294933022d207f687af1a94795f7', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:12:33', '2023-07-31 07:12:33', '2024-07-31 07:12:33');
INSERT INTO `oauth_access_tokens` VALUES ('2031211be5183862bc6e575c4d73739ab984330f895a4d5dc33b5202bc47ea80151f330fd07cde32', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:19:03', '2023-07-31 06:19:33', '2024-07-31 06:19:03');
INSERT INTO `oauth_access_tokens` VALUES ('20bedbe9d5d3ae9b8ab9f44080d28cc4e05867a0aebf1231a1975c21597e5b7871b61410648834cd', 3, 1, 'authToken', '[]', 1, '2023-07-31 04:01:10', '2023-07-31 04:01:13', '2024-07-31 04:01:10');
INSERT INTO `oauth_access_tokens` VALUES ('2344e0a73c40628f9bccaa2c2f6dad21f32c5e910e9be58e4899075e05b492d705b5cb81693bc9c1', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:03:04', '2023-07-29 15:03:04', '2024-07-29 15:03:04');
INSERT INTO `oauth_access_tokens` VALUES ('239eb46156443d4c4f58a756d4de1cc312f4f146be3d1ec997daa54a79c92c4e5ab1e9af50065ef6', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:16:13', '2023-07-31 07:16:13', '2024-07-31 07:16:13');
INSERT INTO `oauth_access_tokens` VALUES ('265fdab9bc37f8867e7c1881c5db46859591c30c6aab3a45adf140f8714842d39faa096569832144', 4, 1, 'authToken', '[]', 1, '2023-09-25 08:09:46', '2023-09-25 08:11:57', '2024-09-25 08:09:46');
INSERT INTO `oauth_access_tokens` VALUES ('28e208e026748ac9f6ca8ca2f1c778421187ffc79535b1b9653209b1c09409298c592ae21e7a26df', 20, 1, 'authToken', '[]', 1, '2023-09-25 08:08:42', '2023-09-25 08:09:41', '2024-09-25 08:08:42');
INSERT INTO `oauth_access_tokens` VALUES ('2b03d23306e43d9dc5fe1ffcbdab9ee913a561f8ceba1dd00ccde7a0ca5213bca93031c8fb6a7e75', 20, 1, 'authToken', '[]', 1, '2023-09-25 07:12:28', '2023-09-25 07:58:22', '2024-09-25 07:12:28');
INSERT INTO `oauth_access_tokens` VALUES ('3329d587a5785d8654b3c3457aac94933a6fb6bce9c560878e8ca9c8cace30bd191390a93682db52', 3, 1, 'authToken', '[]', 0, '2023-08-01 10:00:20', '2023-08-01 10:00:21', '2024-08-01 10:00:20');
INSERT INTO `oauth_access_tokens` VALUES ('337ec7aa88e01d147eda89c126a4ade4a7411964d190580f6082cee3d06d5b41e03b612cd0ae1b99', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:23:31', '2023-07-29 14:23:31', '2024-07-29 14:23:31');
INSERT INTO `oauth_access_tokens` VALUES ('346e3cf8f9997e9d955452449f0026dc89b52992ed804099602d5d07e1cca1508553a21aa8a7dd9a', 3, 1, 'authToken', '[]', 1, '2023-07-31 04:00:43', '2023-07-31 04:01:04', '2024-07-31 04:00:43');
INSERT INTO `oauth_access_tokens` VALUES ('34ed362e9be202c0549a3e9486aa0e2fdd3ff537c719f43299378f944be3779d30f25f8133ba9ab8', 4, 1, 'authToken', '[]', 1, '2023-08-30 02:28:41', '2023-09-21 06:31:28', '2024-08-30 02:28:41');
INSERT INTO `oauth_access_tokens` VALUES ('35813e8cc36a482c24ca7f12c33a40e77ca3b7cc13e52767d5ae2e9a844e0b47d4c593c51b7d5d64', 3, 1, 'authToken', '[]', 1, '2023-08-02 01:19:59', '2023-08-02 01:20:08', '2024-08-02 01:19:59');
INSERT INTO `oauth_access_tokens` VALUES ('363d5a08f00ead1998dc1d57ec62189c9ba9e2b56afb9f0349d23a233eabef5ec6fd21d0e66f69dc', 3, 1, 'authToken', '[]', 1, '2023-08-08 06:27:52', '2023-08-10 07:45:16', '2024-08-08 06:27:52');
INSERT INTO `oauth_access_tokens` VALUES ('36b5cd5bc5db8ca6475a48b37a5148cc21e754d2535dcb0e13908e5210ffcdbc06b9609a08dc92d0', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:13:30', '2023-07-29 15:13:30', '2024-07-29 15:13:30');
INSERT INTO `oauth_access_tokens` VALUES ('36ee94616be7d8161bdf48339fe8a1d151737d00abe88cc95a604111a3b9660c4657f67048916f10', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:23:17', '2023-07-31 07:23:17', '2024-07-31 07:23:17');
INSERT INTO `oauth_access_tokens` VALUES ('38e159dedbe36e043d6c94b52a320d2912b91745a528573e4ee1668337cd9de9a113f0e46827f8f1', 20, 1, 'authToken', '[]', 1, '2023-09-25 08:12:01', '2023-09-25 08:53:07', '2024-09-25 08:12:01');
INSERT INTO `oauth_access_tokens` VALUES ('395eaa20ca8d5a87a1d0ace771fa46719546bf686bceac4ac381867e49585a667cd7152fc6f3c139', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:09:20', '2023-07-31 07:09:20', '2024-07-31 07:09:20');
INSERT INTO `oauth_access_tokens` VALUES ('398b433776597ec67be3e0d8b961ce63a9b2a9f8167fe6f9daeb37fb8c657a47fb9e3d8b34cf7458', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:43:41', '2023-07-31 07:43:41', '2024-07-31 07:43:41');
INSERT INTO `oauth_access_tokens` VALUES ('3aa90e1c66eb898f886f03fb301db6cfcd12d91b336d6351f8d779bce08867ecf7ec0ba4196c469f', 3, 1, 'authToken', '[]', 1, '2023-07-31 03:59:03', '2023-07-31 03:59:12', '2024-07-31 03:59:03');
INSERT INTO `oauth_access_tokens` VALUES ('3bc6fe9a8bdecb07071861c14b4eb6b252adfb3ecc66fb4e7c4c8c68d68d20d2137f6674a8bf4be8', 20, 1, 'authToken', '[]', 0, '2023-09-25 09:23:46', '2023-09-25 09:23:46', '2024-09-25 09:23:46');
INSERT INTO `oauth_access_tokens` VALUES ('3e35e418d85f5c8aed3115bbf8b9c6f63b9abce5fff3f26b9a6b92271317ddac69fa53b0fffaf814', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:09:16', '2023-07-31 07:09:16', '2024-07-31 07:09:16');
INSERT INTO `oauth_access_tokens` VALUES ('3f5189713dfd8ca3acb20ce6d54bee74b823c09c0e174360c7887132118403e01b5b4577507d3d26', 20, 1, 'authToken', '[]', 1, '2023-09-21 06:33:18', '2023-09-24 17:01:29', '2024-09-21 06:33:18');
INSERT INTO `oauth_access_tokens` VALUES ('407b6e3084b289c924923ccdb9aa416913c9620ba89cbb20953c9dba618cfe1548d18bf3b8b1e97e', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:56:53', '2023-07-29 14:56:53', '2024-07-29 14:56:53');
INSERT INTO `oauth_access_tokens` VALUES ('4a023203efef9e6e38a1b80243f69421bcabe5323f766e5731515812cd4e47254b35f9b87aadd163', 20, 1, 'authToken', '[]', 1, '2023-09-24 17:02:54', '2023-09-25 07:12:20', '2024-09-24 17:02:54');
INSERT INTO `oauth_access_tokens` VALUES ('4ad58cd172def743cd0d995e16abd3e8e63c4bf08307c22671a21e43e3c75613be21440a9415f1a5', 4, 1, 'authToken', '[]', 0, '2023-08-11 08:51:01', '2023-08-11 08:51:01', '2024-08-11 08:51:01');
INSERT INTO `oauth_access_tokens` VALUES ('4be455f9a79922b292ee8bf7d76606901631e8c5cf841e4abad462e8c4d1c2d19a23177bed0a2583', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:31:28', '2023-07-29 14:31:28', '2024-07-29 14:31:28');
INSERT INTO `oauth_access_tokens` VALUES ('4c16dc0ab8fa22ac2c3c4a4ec0c801d7b9998ac83566a70917740b00bc9d5c18b2c6cf350a0cf428', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:17:29', '2023-07-31 06:18:58', '2024-07-31 06:17:29');
INSERT INTO `oauth_access_tokens` VALUES ('4c6d0ffeb48638f2bacc3d540fc1a6daa13e45d6d6ae4c8643bf7190ead1f072e55f0772f85e132a', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:09:52', '2023-07-31 07:09:52', '2024-07-31 07:09:52');
INSERT INTO `oauth_access_tokens` VALUES ('4c771168fe8c841d8554ca757ea504cebd58f78a6b1fbbd1454848cf75f7588e4f7d6aa6a9432513', 3, 1, 'authToken', '[]', 1, '2023-08-01 10:45:15', '2023-08-01 10:47:26', '2024-08-01 10:45:15');
INSERT INTO `oauth_access_tokens` VALUES ('4e4e19350b7d04c73a2d0464c15416e5d2501c2fd9f729166a0029aae7e2356d271aba4d972f3836', 4, 1, 'authToken', '[]', 0, '2023-08-10 10:47:36', '2023-08-10 10:47:36', '2024-08-10 10:47:36');
INSERT INTO `oauth_access_tokens` VALUES ('4f2e2a340411311a049406b762ebce9e3c31a216ba7adab8725559bd980802199f4b82845e9f5acb', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:29:07', '2023-07-31 06:29:13', '2024-07-31 06:29:07');
INSERT INTO `oauth_access_tokens` VALUES ('50b4ec2b71d57fb3640dd858420e21a7ad15f5935c9a0f38d0406e5b8284a91d13847edc19eecff4', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:13:17', '2023-07-29 15:13:17', '2024-07-29 15:13:17');
INSERT INTO `oauth_access_tokens` VALUES ('525352ddbaf52af4fe3f60b5ebfad441becc92f880f330ec50f6c0bbd7798676af6b964e5510fe1b', 3, 1, 'authToken', '[]', 0, '2023-07-31 03:53:35', '2023-07-31 03:53:35', '2024-07-31 03:53:35');
INSERT INTO `oauth_access_tokens` VALUES ('531f9b90ff0efd11e154d21ed01e1c38c19608aaa42f6f3dc43a6de5f522b9c61fe50325dfebfb42', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:30:10', '2023-07-31 06:30:10', '2024-07-31 06:30:10');
INSERT INTO `oauth_access_tokens` VALUES ('5559bb9d3d3f8784b7669c28d48cd2840e1736cde9537226971b7cd0ff53145bdea3223d483b85ed', 20, 1, 'authToken', '[]', 1, '2023-08-29 04:52:41', '2023-08-30 02:28:35', '2024-08-29 04:52:41');
INSERT INTO `oauth_access_tokens` VALUES ('55980d4dfc0ee7124ac12d6a85eaada9bd0aeec309bdccbf8184970001719ae6ea96c9a71aaa6cab', 4, 1, 'authToken', '[]', 1, '2023-08-14 02:44:51', '2023-08-29 04:52:34', '2024-08-14 02:44:51');
INSERT INTO `oauth_access_tokens` VALUES ('56513fffa53f684101fdbce2124b8bda0b0550a77de068b2f5999a6c7c73c63c93fc23c930e2fc19', 3, 1, 'authToken', '[]', 0, '2023-07-31 08:43:22', '2023-07-31 08:43:22', '2024-07-31 08:43:22');
INSERT INTO `oauth_access_tokens` VALUES ('57c47878db28727e5da698b7350c873f988eb72148695ccab9eff03124f1019442924bf2d5d8299c', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:08:17', '2023-07-29 15:08:17', '2024-07-29 15:08:17');
INSERT INTO `oauth_access_tokens` VALUES ('5b33b5b6ea58ca6fd683fa2ce76968da352451e4a59cad11b1ba7ec834c0958a810cfd2c60fce921', 4, 1, 'authToken', '[]', 1, '2023-08-02 07:47:40', '2023-08-02 08:28:39', '2024-08-02 07:47:40');
INSERT INTO `oauth_access_tokens` VALUES ('5d5994fd1101c810eca2aaea77958243175892b7fdce904cb3fb0b483804bba3cfa57067b4f4cb64', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:23:19', '2023-07-31 07:23:19', '2024-07-31 07:23:19');
INSERT INTO `oauth_access_tokens` VALUES ('5e2157e82a74bdf9175398821f2f9ff2d2aeb0bb8be170264e38ea13c0069b037d121d586266ffa1', 3, 1, 'authToken', '[]', 1, '2023-08-02 01:26:23', '2023-08-02 01:26:28', '2024-08-02 01:26:23');
INSERT INTO `oauth_access_tokens` VALUES ('60d0b19acd2f73b8ce76462fbe5aa119e0d0a31cacec91d759957c1f3def7a62ef3889e7dc6d99bb', 3, 1, 'authToken', '[]', 0, '2023-07-31 03:53:26', '2023-07-31 03:53:26', '2024-07-31 03:53:26');
INSERT INTO `oauth_access_tokens` VALUES ('617d8e75406e20539251272916eaa9d2f0e5e635cf070348b95f3f69b421015dea1b3d021ae13c1b', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:51:29', '2023-07-31 06:51:29', '2024-07-31 06:51:29');
INSERT INTO `oauth_access_tokens` VALUES ('643c222880fbb5c0e5e2847e8507b7374e48387e5543b996d6aa12c128f9c3601c442e49e95dcbab', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:53:36', '2023-07-29 14:53:36', '2024-07-29 14:53:36');
INSERT INTO `oauth_access_tokens` VALUES ('653141b2a8e54649e8aa1e40db5e8a3d5201cfa0e7797a3b73cacd61977e2723d986ecfd69f19a66', 3, 1, 'authToken', '[]', 1, '2023-07-31 08:53:39', '2023-07-31 08:55:05', '2024-07-31 08:53:39');
INSERT INTO `oauth_access_tokens` VALUES ('655034942c9601efad7bdd8b3b03633480a92fc86aef2b5096b37a66c7ed87255454d2bbe0675252', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:09:22', '2023-07-31 07:09:22', '2024-07-31 07:09:22');
INSERT INTO `oauth_access_tokens` VALUES ('65f7af1946f9789108d77eb02e26b847a76544b7660928748a62cf4af6a00c950fe61def7ad1b77c', 3, 1, 'authToken', '[]', 0, '2023-07-29 11:02:19', '2023-07-29 11:02:19', '2024-07-29 11:02:19');
INSERT INTO `oauth_access_tokens` VALUES ('665548d29822323ac00b02906cc981e0aeeffad2bf1f08569af0f8be1d4c771096b50ea795553949', 3, 1, 'authToken', '[]', 0, '2023-07-31 04:42:48', '2023-07-31 04:42:48', '2024-07-31 04:42:48');
INSERT INTO `oauth_access_tokens` VALUES ('6728db8edd6275e8c9d8efca4c477cbf8265fa8a0fb5a6b4bfdcb1077e654d741b1b8c5c2adfb891', 3, 1, 'authToken', '[]', 1, '2023-07-29 15:16:26', '2023-07-31 03:52:34', '2024-07-29 15:16:26');
INSERT INTO `oauth_access_tokens` VALUES ('69f8eb46122c1d7265db47eb9ac9706ad2d64ecb9b8cb18384b3c277ddc0a1691f7dc3f400ca6ae0', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:13:03', '2023-07-31 06:13:05', '2024-07-31 06:13:03');
INSERT INTO `oauth_access_tokens` VALUES ('6ab24cc92c10de2685bd97f291d8412560d0747cf12593577c551eb308e468a7d5684a794d63e5ba', 4, 1, 'authToken', '[]', 1, '2023-08-07 06:48:14', '2023-08-07 06:48:16', '2024-08-07 06:48:14');
INSERT INTO `oauth_access_tokens` VALUES ('6b778904d134ca05a401a2dae9bf28823affb7355ef235d3bbc5855f1a99d4a37e4e15c82689ada1', 4, 1, 'authToken', '[]', 1, '2023-09-25 09:14:15', '2023-09-25 09:23:41', '2024-09-25 09:14:15');
INSERT INTO `oauth_access_tokens` VALUES ('6db8d45bfb54144a53f285cc53dc1899df8013fadc90e6d82b2e71ccc6b881b158b6f56b09086c0a', 3, 1, 'authToken', '[]', 1, '2023-07-31 03:57:26', '2023-07-31 03:58:14', '2024-07-31 03:57:26');
INSERT INTO `oauth_access_tokens` VALUES ('6df203fec6d898c4dae3516b3306fcbedb47acfbb75726ccfa06cdaf550c2a8b50d20eed6ac99ccb', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:18:41', '2023-07-31 07:18:41', '2024-07-31 07:18:41');
INSERT INTO `oauth_access_tokens` VALUES ('71e11b0ed019d13863dcbc5c91586ccc631a74c28e23ba319e623ed16b2bc4ab3b305c800a31eb1c', 3, 1, 'authToken', '[]', 1, '2023-07-31 09:31:49', '2023-07-31 09:32:13', '2024-07-31 09:31:49');
INSERT INTO `oauth_access_tokens` VALUES ('71f981d0d44bc21bc27008c03db3ffb3e681e302dbf73e78a3bbe25cfaa550e624a01c902f3a899d', 4, 1, 'authToken', '[]', 1, '2023-08-02 08:31:13', '2023-08-02 08:31:15', '2024-08-02 08:31:13');
INSERT INTO `oauth_access_tokens` VALUES ('72fceb61a38e2e5b9b9a3abd4ce8388eb77804e08c56d87bf0e0ecdf25d415fa19fed141bf20240e', 3, 1, 'authToken', '[]', 0, '2023-07-31 08:13:26', '2023-07-31 08:13:26', '2024-07-31 08:13:26');
INSERT INTO `oauth_access_tokens` VALUES ('73743efd49fce18c9064084544d24a866dcb1befa260057935ad37b94ed2be2e6ae1f00dded0a2fa', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:23:19', '2023-07-31 07:23:19', '2024-07-31 07:23:19');
INSERT INTO `oauth_access_tokens` VALUES ('75106c2e45dae041866be64d25d925e6e05d1dd4b51704a3c393901fe210c867d3b6d6f58d228051', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:15:43', '2023-07-29 15:15:43', '2024-07-29 15:15:43');
INSERT INTO `oauth_access_tokens` VALUES ('76d76016235f71ccbe811a3b0f415fa7f857df7e216c57ae399bf1d44d8e4b7aa53c079475811560', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:09:21', '2023-07-31 07:09:21', '2024-07-31 07:09:21');
INSERT INTO `oauth_access_tokens` VALUES ('7730c116d98a95bd2551e14c061871204ab375d72eb54ed2f9320862bd6ce9aa55665fafb28803a6', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:19:37', '2023-07-31 06:20:11', '2024-07-31 06:19:37');
INSERT INTO `oauth_access_tokens` VALUES ('788cb152f1d77d696c5bb50178a124f49918a09e5f4af639ab667728d28707835be11e5689516b3c', 1, 1, 'authToken', '[]', 1, '2023-08-10 09:08:32', '2023-08-10 10:46:52', '2024-08-10 09:08:32');
INSERT INTO `oauth_access_tokens` VALUES ('7989d1aee013a23b8e74dd724a6342314acbf82cc49cd85e04ece7e64381cbe94790edc8c5950d33', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:42:24', '2023-07-31 06:42:27', '2024-07-31 06:42:24');
INSERT INTO `oauth_access_tokens` VALUES ('79add774942f96a1354476687aae8e174aa27f4fff9caa8549b55ba0fce58442a568d522ecd58aea', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:15:50', '2023-07-31 07:15:50', '2024-07-31 07:15:50');
INSERT INTO `oauth_access_tokens` VALUES ('7b53d4982050c9d0e9d482e5b8bb864917dc18258e36a5f1d02d6ce7326ff8d57afedd00518f504d', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:05:06', '2023-07-29 15:05:06', '2024-07-29 15:05:06');
INSERT INTO `oauth_access_tokens` VALUES ('7e1966796a548aedda8141db7f6621a04b08a753974884fe6b80f31813d2a88fd29b2946f1f868b6', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:23:18', '2023-07-31 07:23:18', '2024-07-31 07:23:18');
INSERT INTO `oauth_access_tokens` VALUES ('86fbe4a6805bde652cbb00ad6ac753bc59b9d54ebc7f5772bdc41279eb53fbe677c36989251d5d5b', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:30:19', '2023-07-29 14:30:19', '2024-07-29 14:30:19');
INSERT INTO `oauth_access_tokens` VALUES ('8877e4e4b7ae4977fe642b13a09534c3fea16bfb8b4274fc61e3b5c1392033c7c2ec1cf8cae7b28b', 3, 1, 'authToken', '[]', 1, '2023-09-25 07:58:48', '2023-09-25 08:03:20', '2024-09-25 07:58:48');
INSERT INTO `oauth_access_tokens` VALUES ('89864df58523bf7451e4af99db7d55fea24fcbf1bb4ab275096a91006e4060c2bb141cdcc750a7f1', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:01:46', '2023-07-29 15:01:46', '2024-07-29 15:01:46');
INSERT INTO `oauth_access_tokens` VALUES ('9077f4608723a6dea6da13ae1498805de90819f68044b076180f9eda7f3812e7af747c3a9fc6cbf0', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:22:09', '2023-07-29 14:22:09', '2024-07-29 14:22:09');
INSERT INTO `oauth_access_tokens` VALUES ('916bad2aaf53373a2b1f29fa3eef499e6f72ec26cdecf755591759256ce16dd583f26ba4c857da0b', 3, 1, 'authToken', '[]', 1, '2023-08-01 10:00:37', '2023-08-01 10:01:36', '2024-08-01 10:00:37');
INSERT INTO `oauth_access_tokens` VALUES ('91bcc637d0ff4c1468ea65f6cf7d3ac6938c3aed908f5ff0259c2f43d9b0af67a7d7759ea032c200', 1, 1, 'authToken', '[]', 1, '2023-08-11 06:28:19', '2023-08-11 06:28:27', '2024-08-11 06:28:19');
INSERT INTO `oauth_access_tokens` VALUES ('95ef9eff0f8f42bafcc684b7a9264a72448a9535ea81371b746433cdaf9c8e935ff33212653f1473', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:02:38', '2023-07-29 15:02:38', '2024-07-29 15:02:38');
INSERT INTO `oauth_access_tokens` VALUES ('961b5921bd96a088d062efc255e24dc745b9a2101cc48d8c47190a055871abbfd42c62a8751a69c0', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:39:06', '2023-07-31 06:39:06', '2024-07-31 06:39:06');
INSERT INTO `oauth_access_tokens` VALUES ('96244cf1cf9542f7ba2581990dfaaa0527865396570a2c9450f39ea1d29de869f3fa31af34e17632', 1, 1, 'authToken', '[]', 1, '2023-08-11 10:28:38', '2023-08-14 02:44:45', '2024-08-11 10:28:38');
INSERT INTO `oauth_access_tokens` VALUES ('963a5843d4b35e7abdd1ea78f88656032eed0c6260a63c1c3e2c16fbe18f0554b00549c48f9eebd8', 3, 1, 'authToken', '[]', 1, '2023-09-21 06:32:03', '2023-09-21 06:33:07', '2024-09-21 06:32:03');
INSERT INTO `oauth_access_tokens` VALUES ('9a0366d259fdb345dec36a0e96610026a56804e8dd4efb80721a2c52636086465149de84c313d091', 4, 1, 'authToken', '[]', 1, '2023-08-07 08:33:14', '2023-08-07 08:33:15', '2024-08-07 08:33:14');
INSERT INTO `oauth_access_tokens` VALUES ('9a74d2c4bc7c8ff2969a5c892b53d246797f4d39f68af25a19e87d1129317a23bb7168b610b6cf4e', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:23:27', '2023-07-31 07:23:27', '2024-07-31 07:23:27');
INSERT INTO `oauth_access_tokens` VALUES ('9bde261763467e1cd500cf33de1575d574cac8f9a6ffdf58ca8a1b42613bbd68e4873379d61aa71d', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:20:18', '2023-07-31 06:20:48', '2024-07-31 06:20:18');
INSERT INTO `oauth_access_tokens` VALUES ('9c4846f0fe6439fa15bfc4a56e466e57c8744cd408c1b85bac806e895d74faed29f7ec82b91fb78c', 3, 1, 'authToken', '[]', 1, '2023-07-29 11:17:42', '2023-07-29 11:36:17', '2024-07-29 11:17:42');
INSERT INTO `oauth_access_tokens` VALUES ('9ee6b6192e364da19a9ba88f1b9f4f9f1f44c2422e0fdf1c1e98700678ec84b7cdbd0fcd2ee0bf66', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:52:53', '2023-07-29 14:52:53', '2024-07-29 14:52:53');
INSERT INTO `oauth_access_tokens` VALUES ('9f32e21f25e19c4c900f5de8dbbb6d748e1a9005093ca0b9066539c58684baf8bc021f9ea53496ba', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:24:43', '2023-07-29 14:24:43', '2024-07-29 14:24:43');
INSERT INTO `oauth_access_tokens` VALUES ('9fb31daa80be6afa1cd772a07186b26c2a2c0f44281021e9ab5c1122057ad35c0d92b1137fd4ec88', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:24:35', '2023-07-31 07:24:35', '2024-07-31 07:24:35');
INSERT INTO `oauth_access_tokens` VALUES ('9fb59558b6efa39618c30a1de6f7565ffccf206fab9ddf9f20f0f093b83e0eb51a1a1e2012fc269c', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:13:09', '2023-07-31 07:13:09', '2024-07-31 07:13:09');
INSERT INTO `oauth_access_tokens` VALUES ('a03a42164ac99d2d98b8e5f1c7c0b1dd742ac1ac9147134d3dd6248eeab89862482a5f05169a337c', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:42:49', '2023-07-31 06:42:49', '2024-07-31 06:42:49');
INSERT INTO `oauth_access_tokens` VALUES ('a047a216d850d1f6d746195ce940985faac0e14d82f2abb512db436f62943409bc14a68a9c358d5e', 3, 1, 'authToken', '[]', 0, '2023-08-01 10:53:43', '2023-08-01 10:53:43', '2024-08-01 10:53:43');
INSERT INTO `oauth_access_tokens` VALUES ('a0ec47a951d8940aabf1b96c3e58c124faf14736cef4db9da7cf3af355e2b6dd4e341e019acbc61d', 3, 1, 'authToken', '[]', 0, '2023-07-29 10:59:51', '2023-07-29 10:59:51', '2024-07-29 10:59:51');
INSERT INTO `oauth_access_tokens` VALUES ('a12008212adcd1e9a21ab2bcdbf30e3b5a8e71dd24b4e93e6bb727fde608c5f7db23a1c091660821', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:06:29', '2023-07-29 15:06:29', '2024-07-29 15:06:29');
INSERT INTO `oauth_access_tokens` VALUES ('a393a2b77190946610789fdd848b056d4d196baffb251aef98095cdfed140926f5ba6a170f97f41e', 4, 1, 'authToken', '[]', 0, '2023-08-14 09:54:59', '2023-08-14 09:54:59', '2024-08-14 09:54:59');
INSERT INTO `oauth_access_tokens` VALUES ('a3a2ea0f99f38e20c10222124e4e241a7ed6b5c5dbd9bcaf76a3508d8f687ef04b52f3e28df97b53', 3, 1, 'authToken', '[]', 1, '2023-07-31 08:37:48', '2023-07-31 08:42:45', '2024-07-31 08:37:48');
INSERT INTO `oauth_access_tokens` VALUES ('a543b62007840366a5d2995d9979f65846d40035e40ad4a373a0b516413fbf9911d2a035e300f565', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:21:11', '2023-07-29 14:21:11', '2024-07-29 14:21:11');
INSERT INTO `oauth_access_tokens` VALUES ('a7068bac69d2d360f40770c236405569edc3406da82f93deab11e7c03a0ac91a186004a0cda66ceb', 3, 1, 'authToken', '[]', 0, '2023-07-31 08:42:54', '2023-07-31 08:42:55', '2024-07-31 08:42:54');
INSERT INTO `oauth_access_tokens` VALUES ('a90826e651e804f45cfed469c28907bc7e4db71ed8f4c439270f7d7a4e82655eb02ba99c20571968', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:06:49', '2023-07-29 15:06:49', '2024-07-29 15:06:49');
INSERT INTO `oauth_access_tokens` VALUES ('acba250a8d26242b0f9ce97a1054080a709c2f1f1893928aac6a5813ce3d4088e1d859dbdc913c14', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:05:54', '2023-07-29 15:05:54', '2024-07-29 15:05:54');
INSERT INTO `oauth_access_tokens` VALUES ('accb7bd00fa46b14ca83328d43d1c3e52e9f91e39801bca0bf37662a4786c1437c88ec666ea57fea', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:03:53', '2023-07-29 15:03:53', '2024-07-29 15:03:53');
INSERT INTO `oauth_access_tokens` VALUES ('afcf5ab2bebb5a95593e2543f62a7bd70db2067818ddc7e48624196ebf85a44b153cf085ddf53e4d', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:42:32', '2023-07-31 06:42:37', '2024-07-31 06:42:32');
INSERT INTO `oauth_access_tokens` VALUES ('b11e59facc88fe49c6c6fd51a0f57ce970d1e12dbce12e3b5bb5dbff865d1cbfa833524b9be44234', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:02:27', '2023-07-31 07:02:27', '2024-07-31 07:02:27');
INSERT INTO `oauth_access_tokens` VALUES ('b2ce98c1dd55920fd958572f95de4188d3b17791cbb4d0a4e150bf07c589ce957510a7ab08c70d2b', 20, 1, 'authToken', '[]', 1, '2023-09-25 08:03:25', '2023-09-25 08:08:36', '2024-09-25 08:03:25');
INSERT INTO `oauth_access_tokens` VALUES ('b2f12d00596a3e07a26932d75d692e237e19fd821bc7419a0afc464ed8b59d5be2ebb6e95d345d31', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:09:22', '2023-07-31 07:09:22', '2024-07-31 07:09:22');
INSERT INTO `oauth_access_tokens` VALUES ('b33b734da5fc43e924a7a354feaa241e63f39c1167396fffa045e2cbd7fc7a5fd3d389c48ab7caba', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:10:26', '2023-07-29 15:10:26', '2024-07-29 15:10:26');
INSERT INTO `oauth_access_tokens` VALUES ('b4f164cfb0fbcec1b87c0962968039edbf2529093c76cae65dbc5b76ed2259c130b495b83dac1cd3', 3, 1, 'authToken', '[]', 0, '2023-07-29 11:40:01', '2023-07-29 11:40:01', '2024-07-29 11:40:01');
INSERT INTO `oauth_access_tokens` VALUES ('b54c5737efcf3f6318c2fd1f47e588bde5d7606d5d15847f567a7856cdb5967579b013036443f081', 3, 1, 'authToken', '[]', 1, '2023-08-01 10:53:10', '2023-08-01 10:53:12', '2024-08-01 10:53:10');
INSERT INTO `oauth_access_tokens` VALUES ('b5cfcdfc3ab698f7966ef6bc8f37bc538479e9a90ea1d7438ac3cd7d7ce3bc28fa024a921d8a5e26', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:52:33', '2023-07-31 06:52:33', '2024-07-31 06:52:33');
INSERT INTO `oauth_access_tokens` VALUES ('b864229ab0f4cf8a0c807a5ab200e8f1ffd519fc9d8b652d553bf8e8759a6aefc7e3edddd110a073', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:38:02', '2023-07-31 07:38:02', '2024-07-31 07:38:02');
INSERT INTO `oauth_access_tokens` VALUES ('bb084f7e1b6f7458a4506655dc4f17e2e9c237d896ad743e19c72ca394fc3d74c67c77792a050d52', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:06:03', '2023-07-31 07:06:03', '2024-07-31 07:06:03');
INSERT INTO `oauth_access_tokens` VALUES ('bd6d2b89b56a2e48b67fab5dc30688def4a21256dae790b5e1f3e13dae04326a92b637dfb10f4c89', 1, 1, 'authToken', '[]', 1, '2023-08-11 06:33:13', '2023-08-11 06:46:19', '2024-08-11 06:33:13');
INSERT INTO `oauth_access_tokens` VALUES ('bec969c01560d0e22a435e675b0de3e47f7328f84141b3776aee43ff11968f31ab7edbc89d902cb8', 3, 1, 'authToken', '[]', 0, '2023-07-31 08:56:10', '2023-07-31 08:56:10', '2024-07-31 08:56:10');
INSERT INTO `oauth_access_tokens` VALUES ('bfe1951fc88f5bce03e3a9467c0896dab105aa7e243d9bdb4893ca434f215a98ff93e79a0bc85199', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:01:30', '2023-07-29 15:01:30', '2024-07-29 15:01:30');
INSERT INTO `oauth_access_tokens` VALUES ('c185e5786d2617c4ffcfb141266780082af2347c2413989b703dd576ca62bfe8499ae6be14159ed9', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:01:29', '2023-07-31 07:01:30', '2024-07-31 07:01:29');
INSERT INTO `oauth_access_tokens` VALUES ('c1b3e3ce4eb8c649c976e9d811e3851c2e6f5514387fabcfd9aff2b62684807fd041ca654a1fa603', 3, 1, 'authToken', '[]', 1, '2023-07-31 08:56:37', '2023-07-31 09:24:48', '2024-07-31 08:56:37');
INSERT INTO `oauth_access_tokens` VALUES ('c1dbf6ac4d2bf77d035d94897820150d9658a4dbc114736127aff5ee45324a2ad70b85224d0bad52', 3, 1, 'authToken', '[]', 1, '2023-08-01 10:44:03', '2023-08-01 10:44:05', '2024-08-01 10:44:03');
INSERT INTO `oauth_access_tokens` VALUES ('c253c4883c8d00cedafa6c1d238305edec3b99785621893d00dc64283c338260e14edad97226c861', 3, 1, 'authToken', '[]', 1, '2023-07-31 08:44:45', '2023-07-31 08:44:47', '2024-07-31 08:44:45');
INSERT INTO `oauth_access_tokens` VALUES ('c3d878a0cf627477b1841482cd452b3cfc12286ed1416440ef58015478566f0544511fe77e780444', 3, 1, 'authToken', '[]', 1, '2023-07-31 06:11:54', '2023-07-31 06:12:59', '2024-07-31 06:11:54');
INSERT INTO `oauth_access_tokens` VALUES ('c4e8079235b6454f1f6e60671f1532126c48ba39415e8d5bd2a6aeb64306ca7cce9b9c132d1c3d20', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:37:05', '2023-07-31 07:37:05', '2024-07-31 07:37:05');
INSERT INTO `oauth_access_tokens` VALUES ('c96337c7f1fc4a6418047945b38b85ae34403fc433f44039115a448510017f47f5b8c0784a7dcaaf', 1, 1, 'authToken', '[]', 1, '2023-08-10 07:45:44', '2023-08-10 07:48:34', '2024-08-10 07:45:44');
INSERT INTO `oauth_access_tokens` VALUES ('ca2834a8ed576ad377a5cc23399692f9908c6fcdfb88d190f6048101a49813bf0a1288bd07eb3009', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:59:43', '2023-07-31 06:59:43', '2024-07-31 06:59:43');
INSERT INTO `oauth_access_tokens` VALUES ('ce2f07eff073554b2157b1072f5f1ae02e08728d3fe8385c0c5a419a7699c9cf38154b6cb41d88c7', 3, 1, 'authToken', '[]', 1, '2023-07-31 07:25:26', '2023-07-31 07:36:52', '2024-07-31 07:25:26');
INSERT INTO `oauth_access_tokens` VALUES ('cf9b4c58831a47d2b722027e88232c803ac95410c4e5f18eb269316e2c1ce9e1c60b21a7bfe2ba7f', 3, 1, 'authToken', '[]', 1, '2023-08-01 10:47:33', '2023-08-01 10:47:38', '2024-08-01 10:47:33');
INSERT INTO `oauth_access_tokens` VALUES ('d07b6d6189455e1e671352ad3a7b0bf133575ac2bcc0bb85c9c128fbba5a366c8ab02accc1473f55', 1, 1, 'authToken', '[]', 1, '2023-08-10 08:34:23', '2023-08-10 09:08:25', '2024-08-10 08:34:23');
INSERT INTO `oauth_access_tokens` VALUES ('d36293fd88fb0080a2767927eefffa9ee7feccf3a26a545e9ca53dd0872f44c1611108789a963c5b', 4, 1, 'authToken', '[]', 1, '2023-08-07 09:26:18', '2023-08-07 09:26:19', '2024-08-07 09:26:18');
INSERT INTO `oauth_access_tokens` VALUES ('d446ebce68ab3bcc9901d811b21085173ae4f07f69bbc8c259fe03d16f58faaf2f3eb476d03b8b73', 4, 1, 'authToken', '[]', 1, '2023-08-02 08:29:05', '2023-08-02 08:30:37', '2024-08-02 08:29:05');
INSERT INTO `oauth_access_tokens` VALUES ('d52e272bc615eb56065acc218c1e153afabc7faa7ee48543c0c9e6b92a4a47d1c87570263a1ceaf2', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:30:30', '2023-07-31 06:30:30', '2024-07-31 06:30:30');
INSERT INTO `oauth_access_tokens` VALUES ('d70d029f4a80355252e0ff93095e9edfa76d1be6d09e31bb401d8162f525f5f450fe42dd7e679d48', 3, 1, 'authToken', '[]', 1, '2023-08-01 10:44:23', '2023-08-01 10:45:08', '2024-08-01 10:44:23');
INSERT INTO `oauth_access_tokens` VALUES ('d73c79e6139fd26c9b6358da6b87e1fe271429f4708f5649d09dd7a2c9e04313b8312cd2cd8abb1d', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:15:33', '2023-07-29 15:15:33', '2024-07-29 15:15:33');
INSERT INTO `oauth_access_tokens` VALUES ('d87aa6ea6a5ed9c5321068cabd80db43867ab51bf415612b5547a0b280d155aedd46dcbdda9ea2f4', 4, 1, 'authToken', '[]', 1, '2023-08-07 08:07:48', '2023-08-07 08:07:49', '2024-08-07 08:07:48');
INSERT INTO `oauth_access_tokens` VALUES ('d8c9b8d52ddbb0d2db6efc645fa53542c32d88ae0a8e53634c53664d03e2a7037b0d274c9620bcde', 3, 1, 'authToken', '[]', 0, '2023-07-31 08:45:21', '2023-07-31 08:45:21', '2024-07-31 08:45:21');
INSERT INTO `oauth_access_tokens` VALUES ('dab999e146517f93cffb899490d2e2fb53898adfd3bad00b026fcec184921261c7ec72a82f1200d6', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:23:15', '2023-07-31 07:23:15', '2024-07-31 07:23:15');
INSERT INTO `oauth_access_tokens` VALUES ('db42214f8c01781abfd09d12eb3e68300ce16e0d1ea8f24ff01603c27a9bfe0c89e871dd61f0731f', 3, 1, 'authToken', '[]', 1, '2023-07-29 11:40:37', '2023-07-29 11:40:53', '2024-07-29 11:40:37');
INSERT INTO `oauth_access_tokens` VALUES ('db458cc0a9763b0916ff517518c39aeeb3d8b2b1c190f1b3e9263458034c88e5a291a496790d1b04', 3, 1, 'authToken', '[]', 1, '2023-07-31 03:54:01', '2023-07-31 03:54:18', '2024-07-31 03:54:01');
INSERT INTO `oauth_access_tokens` VALUES ('db78d606c17455ef28b41bcc7089ca8a11715f8c5cddd221cb4f0b68bf35847dacecf66a883f426b', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:30:11', '2023-07-29 14:30:11', '2024-07-29 14:30:11');
INSERT INTO `oauth_access_tokens` VALUES ('dcb9e0d9f69c5b8c9a7a77f95d306f736078072b7f03094654334b46740530bd5f4683171f9907d2', 3, 1, 'authToken', '[]', 1, '2023-07-31 04:02:53', '2023-07-31 04:40:52', '2024-07-31 04:02:53');
INSERT INTO `oauth_access_tokens` VALUES ('de01a213cbf64ae7db0d9687fe35951e102d008a6f9d1bb20f2f475f46d6c25f3a9f2bdde2a714f7', 4, 1, 'authToken', '[]', 1, '2023-08-07 02:34:53', '2023-08-07 02:34:57', '2024-08-07 02:34:53');
INSERT INTO `oauth_access_tokens` VALUES ('de81806a3d92ca35df4fcdee4a187372ff17f2588b02a76bb2ace35023533c944dcf3885b1d02e09', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:26:05', '2023-07-31 06:26:05', '2024-07-31 06:26:05');
INSERT INTO `oauth_access_tokens` VALUES ('dfc2747667d0e742e68a9525bd2a170b892f53f3f4da12abb33ab423a1ed6cd67537996cf1aec56f', 3, 1, 'authToken', '[]', 0, '2023-07-31 04:49:40', '2023-07-31 04:49:40', '2024-07-31 04:49:40');
INSERT INTO `oauth_access_tokens` VALUES ('e0278b35d65682b4cdab56e5e92118ab656f18cc64dbc6c28157ceb86209e385f6869fe11bf62d88', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:11:36', '2023-07-31 07:11:36', '2024-07-31 07:11:36');
INSERT INTO `oauth_access_tokens` VALUES ('e14bb0a4320f632d5097609505f95d1ad69ec6063236ca090eff11faa0c736f7ccb0f3fd10434692', 4, 1, 'authToken', '[]', 1, '2023-08-11 06:28:35', '2023-08-11 06:33:01', '2024-08-11 06:28:35');
INSERT INTO `oauth_access_tokens` VALUES ('e3ac7164ee9cd79c19a1005afef7211f8e314f7295f09dc5416cf6c3612bc857b9d01847374be8a9', 3, 1, 'authToken', '[]', 0, '2023-07-29 10:51:21', '2023-07-29 10:51:21', '2024-07-29 10:51:21');
INSERT INTO `oauth_access_tokens` VALUES ('e5145cf6358b98363dcf5aabd8487a53c7f57f34f099bb0c544cd4fdcb1d59dbed77641a23fc1528', 20, 1, 'authToken', '[]', 0, '2023-09-22 07:28:44', '2023-09-22 07:28:44', '2024-09-22 07:28:44');
INSERT INTO `oauth_access_tokens` VALUES ('e7d79e06a29e8e8bc8a2aba2644b7494ddd293115b43ed869575a53329ce166e979c296d4b4a16ab', 3, 1, 'authToken', '[]', 0, '2023-07-29 14:50:57', '2023-07-29 14:50:57', '2024-07-29 14:50:57');
INSERT INTO `oauth_access_tokens` VALUES ('e9c6ac779af45d3daa12ec2d5dcc8eb57d68e82591c677a4c52a6fbe5997621a50f46774b8a1a71c', 1, 1, 'authToken', '[]', 1, '2023-08-11 06:27:30', '2023-08-11 06:28:15', '2024-08-11 06:27:30');
INSERT INTO `oauth_access_tokens` VALUES ('ee5280ad370ace3ea0ad7fb3589f38bd31b949034b7c34e982fe270a3f99a243ff8674c7326daa09', 3, 1, 'authToken', '[]', 0, '2023-07-29 11:00:07', '2023-07-29 11:00:07', '2024-07-29 11:00:07');
INSERT INTO `oauth_access_tokens` VALUES ('ee8ff0f55342d40b2f3b27c11d187a32a870a0217c6c005531cf636e04bc6ffbc8e433399f454815', 3, 1, 'authToken', '[]', 0, '2023-07-31 06:38:30', '2023-07-31 06:38:30', '2024-07-31 06:38:30');
INSERT INTO `oauth_access_tokens` VALUES ('eeca31212ce11681cd4fa869d77316718332cc1319e43e6decb172e9278d0cc0c17318b7c787039b', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:07:25', '2023-07-31 07:07:25', '2024-07-31 07:07:25');
INSERT INTO `oauth_access_tokens` VALUES ('efa3730a5ba9e0833ee43ba1aaa03006823520cf24b39852e28441b00fdffd24618003c08d6cd0f5', 3, 1, 'authToken', '[]', 1, '2023-07-31 09:24:52', '2023-07-31 09:26:38', '2024-07-31 09:24:52');
INSERT INTO `oauth_access_tokens` VALUES ('efa561c41231142adeb51c9ef918d8664a7be6dda63d8c7cd9eb3acd7d29dcb196625c5d3d054af3', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:04:29', '2023-07-29 15:04:29', '2024-07-29 15:04:29');
INSERT INTO `oauth_access_tokens` VALUES ('f0068a19d16e817f8e1ac7b1f8476434bce0dc63e0d4c0b9fa59b3e66ad2c22bd07a27efdbddb87b', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:53:55', '2023-07-31 07:53:55', '2024-07-31 07:53:55');
INSERT INTO `oauth_access_tokens` VALUES ('f4beeec42bef6b580135da6657e9006fca0aa163937649352be401ff0322dc4e6bde1c352191f2bb', 3, 1, 'authToken', '[]', 0, '2023-07-31 07:21:19', '2023-07-31 07:21:19', '2024-07-31 07:21:19');
INSERT INTO `oauth_access_tokens` VALUES ('feae75b54411f2e0f69f02e70ef9c2b48d29cf5a821903cfa418147f80e268d2a5b253d15fa9ce64', 3, 1, 'authToken', '[]', 0, '2023-07-29 15:16:00', '2023-07-29 15:16:00', '2024-07-29 15:16:00');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_auth_codes_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', '5lPEeZkKdJz3Dmzv9PghHMRLuZ9S4W1KsfA1a3zQ', NULL, 'http://localhost', 1, 0, 0, '2023-07-29 09:52:59', '2023-07-29 09:52:59');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'mPk6l8AtPIypOwfWRXSE4TidvCtMgBP7KeMg7Xu9', 'users', 'http://localhost', 0, 1, 0, '2023-07-29 09:52:59', '2023-07-29 09:52:59');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2023-07-29 09:52:59', '2023-07-29 09:52:59');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `orderId` bigint UNSIGNED NOT NULL,
  `productId` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`, `productId`) USING BTREE,
  INDEX `order_details_productid_foreign`(`productId` ASC) USING BTREE,
  CONSTRAINT `order_details_orderid_foreign` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderId` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` bigint UNSIGNED NOT NULL,
  `shippedDate` datetime NOT NULL,
  `total` double NOT NULL,
  `customerInfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `orders_userid_foreign`(`userId` ASC) USING BTREE,
  CONSTRAINT `orders_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `productId` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryId` bigint UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  INDEX `products_category`(`categoryId` ASC) USING BTREE,
  CONSTRAINT `products_categoryid_foreign` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Iphone 11', 'http://localhost:8080/images/1693888652.jpg', 1, 'iPhone 11 sở hữu hiệu năng khá mạnh mẽ, ổn định trong thời gian dài nhờ được trang bị chipset A13 Bionic. Màn hình LCD 6.1 inch sắc nét cùng chất lượng hiển thị Full HD của máy cho trải nghiệm hình ảnh mượt mà và có độ tương phản cao. Hệ thống camera hiện', 10, 100, 13000000, '2023-09-05 06:17:53', '2023-09-05 06:17:53');
INSERT INTO `products` VALUES (2, 'Laptop Asus Vivobook X1502ZA', 'http://localhost:8080/images/1693906161.png', 2, 'Asus Vivobook 15 X1502ZA-BQ126W cho bạn trải nghiệm sức mạnh hoàn toàn mới của bộ vi xử lý Intel Core i5 thế hệ thứ 12 mới nhất, màn hình sắc nét, thiết kế thanh lịch, để bạn tràn đầy hứng khởi mỗi ngày.\r\nAsus Vivobook 15 X1502ZA-BQ126W là một trong những', 2, 100, 15000000, '2023-09-05 09:29:51', '2023-09-05 09:29:51');
INSERT INTO `products` VALUES (3, 'Laptop Lenovo IdeaPad 3', 'http://localhost:8080/images/1693906858.jpg', 2, 'Lenovo IdeaPad 3 15ITL6 sở hữu cấu hình lý tưởng cho công việc với bộ vi xử lý Intel Core i5 mạnh mẽ, 16GB RAM đa nhiệm hoàn hảo và SSD dung lượng lên tới 512GB. Bạn sẽ được làm việc và giải trí một cách trực quan trên màn hình lớn 15,6 inch Full HD sắc n', 0, 0, 21000000, '2023-09-05 09:41:55', '2023-09-05 09:41:55');
INSERT INTO `products` VALUES (4, 'Iphone 11', 'http://localhost:8080/images/1693888652.jpg', 1, 'iPhone 11 sở hữu hiệu năng khá mạnh mẽ, ổn định trong thời gian dài nhờ được trang bị chipset A13 Bionic. Màn hình LCD 6.1 inch sắc nét cùng chất lượng hiển thị Full HD của máy cho trải nghiệm hình ảnh mượt mà và có độ tương phản cao. Hệ thống camera hiện', 10, 100, 20000000, '2023-09-05 10:06:01', '2023-09-05 10:06:01');
INSERT INTO `products` VALUES (5, 'Iphone 14 ProMax', 'http://localhost:8080/images/1694082838.jpg', 1, 'iPhone 14 Pro Max sở hữu thiết kế màn hình Dynamic Island ấn tượng cùng màn hình OLED 6,7 inch hỗ trợ always-on display và hiệu năng vượt trội với chip A16 Bionic.\nBên cạnh đó máy còn sở hữu nhiều nâng cấp về camera với cụm camera sau 48MP, camera trước 1', 0, 100, 24000000, '2023-09-07 10:34:41', '2023-09-07 10:34:41');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'leduong', 'customer', 'le manh duong', 'ewqjeklqw@gmail.com', NULL, '$2y$10$tgnxYBQhxaRlQcMVmfQAdeiCfmsUKwfazONjJQPv/2N8pwqnQ8I52', 'ha noi', '0984851556', NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'leduongk54a2', 'customer', 'le manh duong', 'leduongk54a2@gmail.com', NULL, '$2y$10$dTwzoEonL4jMWRcnjFzS2uqUvE8lNZrbtgmHBsDPW3Q8NC7rj3vs2', 'ha noi', '0984851556', NULL, NULL, NULL);
INSERT INTO `users` VALUES (4, 'admin', 'admin', 'admin', '', NULL, '$2y$10$tgnxYBQhxaRlQcMVmfQAdeiCfmsUKwfazONjJQPv/2N8pwqnQ8I52', '', '', NULL, NULL, NULL);
INSERT INTO `users` VALUES (18, 'nv6', 'employee', 'nguyen thi b', 'lethib@gmail.com', NULL, '$2y$10$v4Vy1PKSN0mGGHdw/ikzYub6pnWF02da1e6g6jQO0yYmltaG0rZqq', 'cau giay', '0984851556', NULL, NULL, NULL);
INSERT INTO `users` VALUES (20, 'duong.lemanh', 'employee', 'le manh duong 1', 'duong.lemanh@vti.com.vn', NULL, '$2y$10$D3uhb0wzJRXOhdZ8OUp0T.5SZAjVSk.t9NKeD/Q.hCFziW.bHXAxC', 'son la', '0984851556', NULL, NULL, '2023-08-28 10:40:58');
INSERT INTO `users` VALUES (21, 'ssadsad', 'employee', 'wqeqweqwe', 'qweqwe@gmai.com', NULL, '$2y$10$a6DU/ibWefbsKy5XqV80FetsAhUToYvC37j44PVaVV5cc.5myZ9LC', 'qweqwe', '098998948989', NULL, NULL, NULL);
INSERT INTO `users` VALUES (22, 'wqewqe', 'employee', 'qweqweqwe', 'qwewqewqe@gmail.com', NULL, '$2y$10$7FcX/3yiKWs3.KvpyQuVCe0k/gmEa7kCknJEJ4h2pqD50XyQYo4um', 'qwewqewqeqwe', '0984851556', NULL, NULL, NULL);
INSERT INTO `users` VALUES (23, 'nv3', 'employee', 'nguyen duc tuan anh', 'wqeqwe@gmail.com', NULL, '$2y$10$YYqnkPkhGxQwNAwl7PmOquGG4pXHNbAgU8P2wD5gVRAsUjpc/Y/k6', 'ha nam', '0984851556', NULL, NULL, NULL);
INSERT INTO `users` VALUES (24, 'nv4', 'employee', 'ưqewqe', 'wqewqe@gmail.com', NULL, '$2y$10$9BrBXy0jNnN7XIboOvSHjusM5N9V4ghAoBk.Ssca.11O.yUQF34tm', 'ưqeqweqwe', '0984851556', NULL, NULL, NULL);
INSERT INTO `users` VALUES (25, 'qwewqewq', 'employee', 'ewqewqe', 'jkljklklj@gmail.com', NULL, '$2y$10$Tn0ONPHNPYfcx1/Qh5TNFet3aIlWlIpukohSJRrF1d.fRuEqL83t6', 'wqewqewqe', '5646546545', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
