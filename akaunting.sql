/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : akaunting

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 17/12/2017 23:20:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 7ih_accounts
-- ----------------------------
DROP TABLE IF EXISTS `7ih_accounts`;
CREATE TABLE `7ih_accounts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15, 4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accounts_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_accounts
-- ----------------------------
INSERT INTO `7ih_accounts` VALUES (1, 1, 'Tiền mặt', '1', 'USD', 0.0000, 'Tiền mặt', NULL, NULL, 1, '2017-12-16 01:38:15', '2017-12-16 08:48:27', '2017-12-16 08:48:27');
INSERT INTO `7ih_accounts` VALUES (2, 1, 'TGS', '0', 'VND', 0.0000, NULL, NULL, NULL, 1, '2017-12-16 08:50:06', '2017-12-16 08:50:06', NULL);

-- ----------------------------
-- Table structure for 7ih_bill_histories
-- ----------------------------
DROP TABLE IF EXISTS `7ih_bill_histories`;
CREATE TABLE `7ih_bill_histories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_histories_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_bill_items
-- ----------------------------
DROP TABLE IF EXISTS `7ih_bill_items`;
CREATE TABLE `7ih_bill_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(15, 4) NOT NULL,
  `total` double(15, 4) NOT NULL,
  `tax` double(15, 4) NOT NULL DEFAULT 0.0000,
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_items_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_bill_payments
-- ----------------------------
DROP TABLE IF EXISTS `7ih_bill_payments`;
CREATE TABLE `7ih_bill_payments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15, 8) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_payments_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_bill_statuses
-- ----------------------------
DROP TABLE IF EXISTS `7ih_bill_statuses`;
CREATE TABLE `7ih_bill_statuses`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_statuses_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_bill_statuses
-- ----------------------------
INSERT INTO `7ih_bill_statuses` VALUES (1, 1, 'Bản nháp', 'draft', '2017-12-16 01:38:15', '2017-12-16 01:38:15', NULL);
INSERT INTO `7ih_bill_statuses` VALUES (2, 1, 'Đã nhận', 'received', '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_bill_statuses` VALUES (3, 1, 'Một phần', 'partial', '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_bill_statuses` VALUES (4, 1, 'Đã thanh toán', 'paid', '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);

-- ----------------------------
-- Table structure for 7ih_bill_totals
-- ----------------------------
DROP TABLE IF EXISTS `7ih_bill_totals`;
CREATE TABLE `7ih_bill_totals`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_totals_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_bills
-- ----------------------------
DROP TABLE IF EXISTS `7ih_bills`;
CREATE TABLE `7ih_bills`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bill_status_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` date NOT NULL,
  `due_at` date NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15, 8) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vendor_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vendor_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bills_company_id_bill_number_deleted_at_unique`(`company_id`, `bill_number`, `deleted_at`) USING BTREE,
  INDEX `bills_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_categories
-- ----------------------------
DROP TABLE IF EXISTS `7ih_categories`;
CREATE TABLE `7ih_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_categories
-- ----------------------------
INSERT INTO `7ih_categories` VALUES (1, 1, 'Chuyển khoản ', 'other', '#605ca8', 1, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_categories` VALUES (2, 1, 'Tiền gửi', 'income', '#f39c12', 1, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_categories` VALUES (3, 1, 'Bán hàng', 'income', '#6da252', 1, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_categories` VALUES (4, 1, 'Chưa phân loại', 'expense', '#d2d6de', 1, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_categories` VALUES (5, 1, 'Tổng quan', 'item', '#00c0ef', 1, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);

-- ----------------------------
-- Table structure for 7ih_companies
-- ----------------------------
DROP TABLE IF EXISTS `7ih_companies`;
CREATE TABLE `7ih_companies`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_companies
-- ----------------------------
INSERT INTO `7ih_companies` VALUES (1, 'TGS.vn', 1, '2017-12-16 01:38:15', '2017-12-16 07:43:00', NULL);

-- ----------------------------
-- Table structure for 7ih_currencies
-- ----------------------------
DROP TABLE IF EXISTS `7ih_currencies`;
CREATE TABLE `7ih_currencies`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15, 8) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `precision` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `thousands_separator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `currencies_company_id_code_deleted_at_unique`(`company_id`, `code`, `deleted_at`) USING BTREE,
  INDEX `currencies_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_currencies
-- ----------------------------
INSERT INTO `7ih_currencies` VALUES (1, 1, 'Đô-la Mỹ', 'USD', 1.00000000, 0, '2017-12-16 01:38:16', '2017-12-16 08:49:19', NULL, '2', '$', 1, '.', ',');
INSERT INTO `7ih_currencies` VALUES (2, 1, 'Euro', 'EUR', 1.25000000, 0, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL, '2', '€', 1, ',', '.');
INSERT INTO `7ih_currencies` VALUES (3, 1, 'Bảng Anh', 'GBP', 1.60000000, 0, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL, '2', '£', 1, '.', ',');
INSERT INTO `7ih_currencies` VALUES (4, 1, 'Lia Thổ Nhĩ Kỳ', 'TRY', 0.80000000, 0, '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL, '2', '₺', 1, ',', '.');
INSERT INTO `7ih_currencies` VALUES (5, 1, 'Việt nam đồng', 'VND', 1.00000000, 1, '2017-12-16 02:58:58', '2017-12-16 02:58:58', NULL, '0', '₫', 0, ',', '.');

-- ----------------------------
-- Table structure for 7ih_customers
-- ----------------------------
DROP TABLE IF EXISTS `7ih_customers`;
CREATE TABLE `7ih_customers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `customers_company_id_email_deleted_at_unique`(`company_id`, `email`, `deleted_at`) USING BTREE,
  INDEX `customers_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_customers
-- ----------------------------
INSERT INTO `7ih_customers` VALUES (1, 1, NULL, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, 'VND', 1, '2017-12-17 02:40:54', '2017-12-17 02:40:54', NULL);

-- ----------------------------
-- Table structure for 7ih_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `7ih_failed_jobs`;
CREATE TABLE `7ih_failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_invoice_histories
-- ----------------------------
DROP TABLE IF EXISTS `7ih_invoice_histories`;
CREATE TABLE `7ih_invoice_histories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_histories_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_invoice_histories
-- ----------------------------
INSERT INTO `7ih_invoice_histories` VALUES (1, 1, 10, 'draft', 0, 'INV-00010 đã được thêm!', '2017-12-17 15:01:48', '2017-12-17 15:01:48', NULL);

-- ----------------------------
-- Table structure for 7ih_invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `7ih_invoice_items`;
CREATE TABLE `7ih_invoice_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT NULL,
  `invoice_id` int(11) NULL DEFAULT NULL,
  `item_id` int(11) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `price` double(15, 4) NULL DEFAULT NULL,
  `total` double(15, 4) NULL DEFAULT NULL,
  `tax` double(15, 4) NULL DEFAULT 0.0000,
  `tax_id` int(11) NULL DEFAULT NULL,
  `size` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size_id` int(11) NULL DEFAULT NULL,
  `number_shirt` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_items_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_invoice_items
-- ----------------------------
INSERT INTO `7ih_invoice_items` VALUES (1, 1, 10, NULL, NULL, NULL, 0, 0.0000, 0.0000, 0.0000, 0, 'm', 5, NULL, '2017-12-17 15:01:48', '2017-12-17 15:01:48', NULL);

-- ----------------------------
-- Table structure for 7ih_invoice_payments
-- ----------------------------
DROP TABLE IF EXISTS `7ih_invoice_payments`;
CREATE TABLE `7ih_invoice_payments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15, 8) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_payments_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_invoice_statuses
-- ----------------------------
DROP TABLE IF EXISTS `7ih_invoice_statuses`;
CREATE TABLE `7ih_invoice_statuses`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_statuses_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_invoice_statuses
-- ----------------------------
INSERT INTO `7ih_invoice_statuses` VALUES (1, 1, 'Bản nháp', 'draft', '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_invoice_statuses` VALUES (2, 1, 'Đã gửi', 'sent', '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_invoice_statuses` VALUES (3, 1, 'Đã xem', 'viewed', '2017-12-16 01:38:16', '2017-12-16 01:38:16', NULL);
INSERT INTO `7ih_invoice_statuses` VALUES (4, 1, 'Đã duyệt', 'approved', '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);
INSERT INTO `7ih_invoice_statuses` VALUES (5, 1, 'Một phần', 'partial', '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);
INSERT INTO `7ih_invoice_statuses` VALUES (6, 1, 'Đã thanh toán', 'paid', '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);

-- ----------------------------
-- Table structure for 7ih_invoice_totals
-- ----------------------------
DROP TABLE IF EXISTS `7ih_invoice_totals`;
CREATE TABLE `7ih_invoice_totals`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_totals_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_invoice_totals
-- ----------------------------
INSERT INTO `7ih_invoice_totals` VALUES (1, 1, 10, 'sub_total', 'invoices.sub_total', 0.0000, 1, '2017-12-17 15:01:48', '2017-12-17 15:01:48', NULL);
INSERT INTO `7ih_invoice_totals` VALUES (2, 1, 10, 'total', 'invoices.total', 0.0000, 2, '2017-12-17 15:01:48', '2017-12-17 15:01:48', NULL);

-- ----------------------------
-- Table structure for 7ih_invoices
-- ----------------------------
DROP TABLE IF EXISTS `7ih_invoices`;
CREATE TABLE `7ih_invoices`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invoice_status_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` date NOT NULL,
  `due_at` date NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15, 8) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `loai_vai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kieu_dang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mau_sac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mat_truoc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mat_sau` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `co` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lai_ao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `invoices_company_id_invoice_number_deleted_at_unique`(`company_id`, `invoice_number`, `deleted_at`) USING BTREE,
  INDEX `invoices_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_invoices
-- ----------------------------
INSERT INTO `7ih_invoices` VALUES (1, 1, 'INV-00001', NULL, 'draft', '2017-12-17', '2017-12-27', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'invoices/01simple.xlsx', '2017-12-17 14:39:54', '2017-12-17 14:51:30', '2017-12-17 14:51:30');
INSERT INTO `7ih_invoices` VALUES (2, 1, 'INV-00002', NULL, 'draft', '2017-12-17', '2017-12-19', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'invoices/01simple.xlsx', '2017-12-17 14:52:28', '2017-12-17 14:52:28', NULL);
INSERT INTO `7ih_invoices` VALUES (3, 1, 'INV-00003', NULL, 'draft', '2017-12-17', '2017-12-19', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-17 14:54:43', '2017-12-17 14:54:43', NULL);
INSERT INTO `7ih_invoices` VALUES (4, 1, 'INV-00004', NULL, 'draft', '2017-12-17', '2017-12-19', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-17 14:55:26', '2017-12-17 14:55:26', NULL);
INSERT INTO `7ih_invoices` VALUES (5, 1, 'INV-00005', NULL, 'draft', '2017-12-17', '2017-12-19', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-17 14:56:23', '2017-12-17 14:56:23', NULL);
INSERT INTO `7ih_invoices` VALUES (6, 1, 'INV-00006', NULL, 'draft', '2017-12-17', '2017-12-19', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-17 14:57:07', '2017-12-17 14:57:07', NULL);
INSERT INTO `7ih_invoices` VALUES (7, 1, 'INV-00007', NULL, 'draft', '2017-12-17', '2017-12-21', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'invoices/01simple.xlsx', '2017-12-17 14:58:51', '2017-12-17 14:58:51', NULL);
INSERT INTO `7ih_invoices` VALUES (8, 1, 'INV-00008', NULL, 'draft', '2017-12-17', '2017-12-21', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-17 14:59:37', '2017-12-17 14:59:37', NULL);
INSERT INTO `7ih_invoices` VALUES (9, 1, 'INV-00009', NULL, 'draft', '2017-12-17', '2017-12-21', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-17 15:00:08', '2017-12-17 15:00:08', NULL);
INSERT INTO `7ih_invoices` VALUES (10, 1, 'INV-00010', NULL, 'draft', '2017-12-17', '2017-12-21', 0.0000, 'VND', 1.00000000, 1, 'Sieu', 'sieu@vn.com', NULL, '0969352404', 'Ha Noi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-12-17 15:01:48', '2017-12-17 15:01:48', NULL);

-- ----------------------------
-- Table structure for 7ih_items
-- ----------------------------
DROP TABLE IF EXISTS `7ih_items`;
CREATE TABLE `7ih_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sale_price` double(15, 4) NOT NULL,
  `purchase_price` double(15, 4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `tax_id` int(11) NULL DEFAULT NULL,
  `picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `items_company_id_sku_deleted_at_unique`(`company_id`, `sku`, `deleted_at`) USING BTREE,
  INDEX `items_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_jobs
-- ----------------------------
DROP TABLE IF EXISTS `7ih_jobs`;
CREATE TABLE `7ih_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_reserved_at_index`(`queue`, `reserved_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_migrations
-- ----------------------------
DROP TABLE IF EXISTS `7ih_migrations`;
CREATE TABLE `7ih_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_migrations
-- ----------------------------
INSERT INTO `7ih_migrations` VALUES (1, '2017_09_01_000000_create_accounts_table', 1);
INSERT INTO `7ih_migrations` VALUES (2, '2017_09_01_000000_create_bills_table', 1);
INSERT INTO `7ih_migrations` VALUES (3, '2017_09_01_000000_create_categories_table', 1);
INSERT INTO `7ih_migrations` VALUES (4, '2017_09_01_000000_create_companies_table', 1);
INSERT INTO `7ih_migrations` VALUES (5, '2017_09_01_000000_create_currencies_table', 1);
INSERT INTO `7ih_migrations` VALUES (6, '2017_09_01_000000_create_customers_table', 1);
INSERT INTO `7ih_migrations` VALUES (7, '2017_09_01_000000_create_invoices_table', 1);
INSERT INTO `7ih_migrations` VALUES (8, '2017_09_01_000000_create_items_table', 1);
INSERT INTO `7ih_migrations` VALUES (9, '2017_09_01_000000_create_jobs_table', 1);
INSERT INTO `7ih_migrations` VALUES (10, '2017_09_01_000000_create_modules_table', 1);
INSERT INTO `7ih_migrations` VALUES (11, '2017_09_01_000000_create_notifications_table', 1);
INSERT INTO `7ih_migrations` VALUES (12, '2017_09_01_000000_create_password_resets_table', 1);
INSERT INTO `7ih_migrations` VALUES (13, '2017_09_01_000000_create_payments_table', 1);
INSERT INTO `7ih_migrations` VALUES (14, '2017_09_01_000000_create_revenues_table', 1);
INSERT INTO `7ih_migrations` VALUES (15, '2017_09_01_000000_create_roles_table', 1);
INSERT INTO `7ih_migrations` VALUES (16, '2017_09_01_000000_create_sessions_table', 1);
INSERT INTO `7ih_migrations` VALUES (17, '2017_09_01_000000_create_settings_table', 1);
INSERT INTO `7ih_migrations` VALUES (18, '2017_09_01_000000_create_taxes_table', 1);
INSERT INTO `7ih_migrations` VALUES (19, '2017_09_01_000000_create_transfers_table', 1);
INSERT INTO `7ih_migrations` VALUES (20, '2017_09_01_000000_create_users_table', 1);
INSERT INTO `7ih_migrations` VALUES (21, '2017_09_01_000000_create_vendors_table', 1);
INSERT INTO `7ih_migrations` VALUES (22, '2017_09_19_delete_offline_file', 1);
INSERT INTO `7ih_migrations` VALUES (23, '2017_10_11_000000_create_bill_totals_table', 1);
INSERT INTO `7ih_migrations` VALUES (24, '2017_10_11_000000_create_invoice_totals_table', 1);
INSERT INTO `7ih_migrations` VALUES (25, '2017_11_16_000000_create_failed_jobs_table', 1);
INSERT INTO `7ih_migrations` VALUES (26, '2017_12_09_000000_add_currency_columns', 1);
INSERT INTO `7ih_migrations` VALUES (27, '2020_01_01_000000_add_locale_column', 1);

-- ----------------------------
-- Table structure for 7ih_module_histories
-- ----------------------------
DROP TABLE IF EXISTS `7ih_module_histories`;
CREATE TABLE `7ih_module_histories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module_histories_company_id_module_id_index`(`company_id`, `module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_module_histories
-- ----------------------------
INSERT INTO `7ih_module_histories` VALUES (1, 1, 1, 'payment-gateways', '1.0.0', 'OfflinePayment đã được cài đặt', '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);
INSERT INTO `7ih_module_histories` VALUES (2, 1, 2, 'payment-gateways', '1.0.0', 'PaypalStandard đã được cài đặt', '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);

-- ----------------------------
-- Table structure for 7ih_modules
-- ----------------------------
DROP TABLE IF EXISTS `7ih_modules`;
CREATE TABLE `7ih_modules`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `modules_company_id_alias_deleted_at_unique`(`company_id`, `alias`, `deleted_at`) USING BTREE,
  INDEX `modules_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_modules
-- ----------------------------
INSERT INTO `7ih_modules` VALUES (1, 1, 'offlinepayment', 0, '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);
INSERT INTO `7ih_modules` VALUES (2, 1, 'paypalstandard', 0, '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);

-- ----------------------------
-- Table structure for 7ih_notifications
-- ----------------------------
DROP TABLE IF EXISTS `7ih_notifications`;
CREATE TABLE `7ih_notifications`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_notifiable_id_notifiable_type_index`(`notifiable_id`, `notifiable_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `7ih_password_resets`;
CREATE TABLE `7ih_password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_payments
-- ----------------------------
DROP TABLE IF EXISTS `7ih_payments`;
CREATE TABLE `7ih_payments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15, 8) NOT NULL,
  `vendor_id` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `payments_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_permissions
-- ----------------------------
DROP TABLE IF EXISTS `7ih_permissions`;
CREATE TABLE `7ih_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_permissions
-- ----------------------------
INSERT INTO `7ih_permissions` VALUES (1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2017-12-16 01:36:55', '2017-12-16 01:36:55');
INSERT INTO `7ih_permissions` VALUES (2, 'read-api', 'Read Api', 'Read Api', '2017-12-16 01:36:55', '2017-12-16 01:36:55');
INSERT INTO `7ih_permissions` VALUES (3, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2017-12-16 01:36:55', '2017-12-16 01:36:55');
INSERT INTO `7ih_permissions` VALUES (4, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2017-12-16 01:36:55', '2017-12-16 01:36:55');
INSERT INTO `7ih_permissions` VALUES (5, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2017-12-16 01:36:55', '2017-12-16 01:36:55');
INSERT INTO `7ih_permissions` VALUES (6, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2017-12-16 01:36:55', '2017-12-16 01:36:55');
INSERT INTO `7ih_permissions` VALUES (7, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (8, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (9, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (10, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (11, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (12, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (13, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (14, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (15, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (16, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (17, 'create-companies-companies', 'Create Companies Companies', 'Create Companies Companies', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (18, 'read-companies-companies', 'Read Companies Companies', 'Read Companies Companies', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (19, 'update-companies-companies', 'Update Companies Companies', 'Update Companies Companies', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (20, 'delete-companies-companies', 'Delete Companies Companies', 'Delete Companies Companies', '2017-12-16 01:36:56', '2017-12-16 01:36:56');
INSERT INTO `7ih_permissions` VALUES (21, 'create-common-import', 'Create Common Import', 'Create Common Import', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (22, 'create-items-items', 'Create Items Items', 'Create Items Items', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (23, 'read-items-items', 'Read Items Items', 'Read Items Items', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (24, 'update-items-items', 'Update Items Items', 'Update Items Items', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (25, 'delete-items-items', 'Delete Items Items', 'Delete Items Items', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (26, 'create-incomes-invoices', 'Create Incomes Invoices', 'Create Incomes Invoices', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (27, 'read-incomes-invoices', 'Read Incomes Invoices', 'Read Incomes Invoices', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (28, 'update-incomes-invoices', 'Update Incomes Invoices', 'Update Incomes Invoices', '2017-12-16 01:36:57', '2017-12-16 01:36:57');
INSERT INTO `7ih_permissions` VALUES (29, 'delete-incomes-invoices', 'Delete Incomes Invoices', 'Delete Incomes Invoices', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (30, 'create-incomes-revenues', 'Create Incomes Revenues', 'Create Incomes Revenues', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (31, 'read-incomes-revenues', 'Read Incomes Revenues', 'Read Incomes Revenues', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (32, 'update-incomes-revenues', 'Update Incomes Revenues', 'Update Incomes Revenues', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (33, 'delete-incomes-revenues', 'Delete Incomes Revenues', 'Delete Incomes Revenues', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (34, 'create-incomes-customers', 'Create Incomes Customers', 'Create Incomes Customers', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (35, 'read-incomes-customers', 'Read Incomes Customers', 'Read Incomes Customers', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (36, 'update-incomes-customers', 'Update Incomes Customers', 'Update Incomes Customers', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (37, 'delete-incomes-customers', 'Delete Incomes Customers', 'Delete Incomes Customers', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (38, 'create-expenses-bills', 'Create Expenses Bills', 'Create Expenses Bills', '2017-12-16 01:36:58', '2017-12-16 01:36:58');
INSERT INTO `7ih_permissions` VALUES (39, 'read-expenses-bills', 'Read Expenses Bills', 'Read Expenses Bills', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (40, 'update-expenses-bills', 'Update Expenses Bills', 'Update Expenses Bills', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (41, 'delete-expenses-bills', 'Delete Expenses Bills', 'Delete Expenses Bills', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (42, 'create-expenses-payments', 'Create Expenses Payments', 'Create Expenses Payments', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (43, 'read-expenses-payments', 'Read Expenses Payments', 'Read Expenses Payments', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (44, 'update-expenses-payments', 'Update Expenses Payments', 'Update Expenses Payments', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (45, 'delete-expenses-payments', 'Delete Expenses Payments', 'Delete Expenses Payments', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (46, 'create-expenses-vendors', 'Create Expenses Vendors', 'Create Expenses Vendors', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (47, 'read-expenses-vendors', 'Read Expenses Vendors', 'Read Expenses Vendors', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (48, 'update-expenses-vendors', 'Update Expenses Vendors', 'Update Expenses Vendors', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (49, 'delete-expenses-vendors', 'Delete Expenses Vendors', 'Delete Expenses Vendors', '2017-12-16 01:36:59', '2017-12-16 01:36:59');
INSERT INTO `7ih_permissions` VALUES (50, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (51, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (52, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (53, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (54, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (55, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (56, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (57, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2017-12-16 01:37:00', '2017-12-16 01:37:00');
INSERT INTO `7ih_permissions` VALUES (58, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (59, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (60, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (61, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (62, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (63, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (64, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (65, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (66, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (67, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (68, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (69, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2017-12-16 01:37:01', '2017-12-16 01:37:01');
INSERT INTO `7ih_permissions` VALUES (70, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (71, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (72, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (73, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (74, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (75, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (76, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (77, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (78, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (79, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2017-12-16 01:37:02', '2017-12-16 01:37:02');
INSERT INTO `7ih_permissions` VALUES (80, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (81, 'create-modules-token', 'Create Modules Token', 'Create Modules Token', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (82, 'update-modules-token', 'Update Modules Token', 'Update Modules Token', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (83, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (84, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (85, 'read-notifications', 'Hệ thống - Xem thông báo', 'Xem thông báo', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (86, 'update-notifications', 'Update Notifications', 'Update Notifications', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (87, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2017-12-16 01:37:03', '2017-12-16 01:37:03');
INSERT INTO `7ih_permissions` VALUES (88, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2017-12-16 01:37:04', '2017-12-16 01:37:04');
INSERT INTO `7ih_permissions` VALUES (89, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2017-12-16 01:37:04', '2017-12-16 01:37:04');
INSERT INTO `7ih_permissions` VALUES (90, 'read-customer-panel', 'Khách hàng - Bảng điều khiển', 'Xem bảng điều khiển dành cho khách hàng', '2017-12-16 01:37:08', '2017-12-16 01:37:08');
INSERT INTO `7ih_permissions` VALUES (91, 'read-customers-invoices', 'Khách hàng - Xem đơn hàng', 'Khách hàng có thể xem các đơn hàng của mình', '2017-12-16 01:37:08', '2017-12-16 01:37:08');
INSERT INTO `7ih_permissions` VALUES (92, 'update-customers-invoices', 'Khách hàng - Cập nhật hóa đơn', 'Khách hàng có thể cập nhật hóa đơn của mình', '2017-12-16 01:37:08', '2017-12-16 01:37:08');
INSERT INTO `7ih_permissions` VALUES (93, 'read-customers-payments', 'Khách hàng - Xem đơn hàng', 'Khách hàng có quyền xem đơn hàng của mình', '2017-12-16 01:37:08', '2017-12-16 01:37:08');
INSERT INTO `7ih_permissions` VALUES (94, 'update-customers-payments', 'Khách hàng - Cập nhật thông tin thanh toán', 'Khách hàng có thể cập nhật thông tin thanh toán', '2017-12-16 01:37:08', '2017-12-16 01:37:08');
INSERT INTO `7ih_permissions` VALUES (95, 'read-customers-transactions', 'Khách hàng - Xem giao dịch', 'Khách hàng có thể xem lịch sử giao dịch của mình', '2017-12-16 01:37:08', '2017-12-16 01:37:08');
INSERT INTO `7ih_permissions` VALUES (96, 'read-customers-profile', 'Khách hàng - Xem hồ sơ', 'Khách hàng có thể xem hồ sơ của mình', '2017-12-16 01:37:08', '2017-12-16 01:37:08');
INSERT INTO `7ih_permissions` VALUES (97, 'update-customers-profile', 'Khách hàng - Cập nhật hồ sơ', 'Khách hàng có thể cập nhật hộ sơ của mình', '2017-12-16 01:37:08', '2017-12-16 01:37:08');

-- ----------------------------
-- Table structure for 7ih_revenues
-- ----------------------------
DROP TABLE IF EXISTS `7ih_revenues`;
CREATE TABLE `7ih_revenues`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15, 4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15, 8) NOT NULL,
  `customer_id` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `revenues_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `7ih_role_permissions`;
CREATE TABLE `7ih_role_permissions`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `role_permissions_permission_id_foreign`(`permission_id`) USING BTREE,
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `7ih_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `7ih_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_role_permissions
-- ----------------------------
INSERT INTO `7ih_role_permissions` VALUES (1, 1);
INSERT INTO `7ih_role_permissions` VALUES (2, 1);
INSERT INTO `7ih_role_permissions` VALUES (1, 2);
INSERT INTO `7ih_role_permissions` VALUES (1, 3);
INSERT INTO `7ih_role_permissions` VALUES (1, 4);
INSERT INTO `7ih_role_permissions` VALUES (1, 5);
INSERT INTO `7ih_role_permissions` VALUES (1, 6);
INSERT INTO `7ih_role_permissions` VALUES (1, 7);
INSERT INTO `7ih_role_permissions` VALUES (1, 8);
INSERT INTO `7ih_role_permissions` VALUES (1, 9);
INSERT INTO `7ih_role_permissions` VALUES (1, 10);
INSERT INTO `7ih_role_permissions` VALUES (1, 11);
INSERT INTO `7ih_role_permissions` VALUES (1, 12);
INSERT INTO `7ih_role_permissions` VALUES (1, 13);
INSERT INTO `7ih_role_permissions` VALUES (1, 14);
INSERT INTO `7ih_role_permissions` VALUES (1, 15);
INSERT INTO `7ih_role_permissions` VALUES (2, 15);
INSERT INTO `7ih_role_permissions` VALUES (1, 16);
INSERT INTO `7ih_role_permissions` VALUES (2, 16);
INSERT INTO `7ih_role_permissions` VALUES (1, 17);
INSERT INTO `7ih_role_permissions` VALUES (2, 17);
INSERT INTO `7ih_role_permissions` VALUES (1, 18);
INSERT INTO `7ih_role_permissions` VALUES (2, 18);
INSERT INTO `7ih_role_permissions` VALUES (1, 19);
INSERT INTO `7ih_role_permissions` VALUES (2, 19);
INSERT INTO `7ih_role_permissions` VALUES (1, 20);
INSERT INTO `7ih_role_permissions` VALUES (2, 20);
INSERT INTO `7ih_role_permissions` VALUES (1, 21);
INSERT INTO `7ih_role_permissions` VALUES (2, 21);
INSERT INTO `7ih_role_permissions` VALUES (1, 22);
INSERT INTO `7ih_role_permissions` VALUES (2, 22);
INSERT INTO `7ih_role_permissions` VALUES (1, 23);
INSERT INTO `7ih_role_permissions` VALUES (2, 23);
INSERT INTO `7ih_role_permissions` VALUES (1, 24);
INSERT INTO `7ih_role_permissions` VALUES (2, 24);
INSERT INTO `7ih_role_permissions` VALUES (1, 25);
INSERT INTO `7ih_role_permissions` VALUES (2, 25);
INSERT INTO `7ih_role_permissions` VALUES (1, 26);
INSERT INTO `7ih_role_permissions` VALUES (2, 26);
INSERT INTO `7ih_role_permissions` VALUES (1, 27);
INSERT INTO `7ih_role_permissions` VALUES (2, 27);
INSERT INTO `7ih_role_permissions` VALUES (1, 28);
INSERT INTO `7ih_role_permissions` VALUES (2, 28);
INSERT INTO `7ih_role_permissions` VALUES (1, 29);
INSERT INTO `7ih_role_permissions` VALUES (2, 29);
INSERT INTO `7ih_role_permissions` VALUES (1, 30);
INSERT INTO `7ih_role_permissions` VALUES (2, 30);
INSERT INTO `7ih_role_permissions` VALUES (1, 31);
INSERT INTO `7ih_role_permissions` VALUES (2, 31);
INSERT INTO `7ih_role_permissions` VALUES (1, 32);
INSERT INTO `7ih_role_permissions` VALUES (2, 32);
INSERT INTO `7ih_role_permissions` VALUES (1, 33);
INSERT INTO `7ih_role_permissions` VALUES (2, 33);
INSERT INTO `7ih_role_permissions` VALUES (1, 34);
INSERT INTO `7ih_role_permissions` VALUES (2, 34);
INSERT INTO `7ih_role_permissions` VALUES (1, 35);
INSERT INTO `7ih_role_permissions` VALUES (2, 35);
INSERT INTO `7ih_role_permissions` VALUES (1, 36);
INSERT INTO `7ih_role_permissions` VALUES (2, 36);
INSERT INTO `7ih_role_permissions` VALUES (1, 37);
INSERT INTO `7ih_role_permissions` VALUES (2, 37);
INSERT INTO `7ih_role_permissions` VALUES (1, 38);
INSERT INTO `7ih_role_permissions` VALUES (2, 38);
INSERT INTO `7ih_role_permissions` VALUES (1, 39);
INSERT INTO `7ih_role_permissions` VALUES (2, 39);
INSERT INTO `7ih_role_permissions` VALUES (1, 40);
INSERT INTO `7ih_role_permissions` VALUES (2, 40);
INSERT INTO `7ih_role_permissions` VALUES (1, 41);
INSERT INTO `7ih_role_permissions` VALUES (2, 41);
INSERT INTO `7ih_role_permissions` VALUES (1, 42);
INSERT INTO `7ih_role_permissions` VALUES (2, 42);
INSERT INTO `7ih_role_permissions` VALUES (1, 43);
INSERT INTO `7ih_role_permissions` VALUES (2, 43);
INSERT INTO `7ih_role_permissions` VALUES (1, 44);
INSERT INTO `7ih_role_permissions` VALUES (2, 44);
INSERT INTO `7ih_role_permissions` VALUES (1, 45);
INSERT INTO `7ih_role_permissions` VALUES (2, 45);
INSERT INTO `7ih_role_permissions` VALUES (1, 46);
INSERT INTO `7ih_role_permissions` VALUES (2, 46);
INSERT INTO `7ih_role_permissions` VALUES (1, 47);
INSERT INTO `7ih_role_permissions` VALUES (2, 47);
INSERT INTO `7ih_role_permissions` VALUES (1, 48);
INSERT INTO `7ih_role_permissions` VALUES (2, 48);
INSERT INTO `7ih_role_permissions` VALUES (1, 49);
INSERT INTO `7ih_role_permissions` VALUES (2, 49);
INSERT INTO `7ih_role_permissions` VALUES (1, 50);
INSERT INTO `7ih_role_permissions` VALUES (2, 50);
INSERT INTO `7ih_role_permissions` VALUES (1, 51);
INSERT INTO `7ih_role_permissions` VALUES (2, 51);
INSERT INTO `7ih_role_permissions` VALUES (1, 52);
INSERT INTO `7ih_role_permissions` VALUES (2, 52);
INSERT INTO `7ih_role_permissions` VALUES (1, 53);
INSERT INTO `7ih_role_permissions` VALUES (2, 53);
INSERT INTO `7ih_role_permissions` VALUES (1, 54);
INSERT INTO `7ih_role_permissions` VALUES (2, 54);
INSERT INTO `7ih_role_permissions` VALUES (1, 55);
INSERT INTO `7ih_role_permissions` VALUES (2, 55);
INSERT INTO `7ih_role_permissions` VALUES (1, 56);
INSERT INTO `7ih_role_permissions` VALUES (2, 56);
INSERT INTO `7ih_role_permissions` VALUES (1, 57);
INSERT INTO `7ih_role_permissions` VALUES (2, 57);
INSERT INTO `7ih_role_permissions` VALUES (1, 58);
INSERT INTO `7ih_role_permissions` VALUES (2, 58);
INSERT INTO `7ih_role_permissions` VALUES (1, 59);
INSERT INTO `7ih_role_permissions` VALUES (2, 59);
INSERT INTO `7ih_role_permissions` VALUES (1, 60);
INSERT INTO `7ih_role_permissions` VALUES (2, 60);
INSERT INTO `7ih_role_permissions` VALUES (1, 61);
INSERT INTO `7ih_role_permissions` VALUES (2, 61);
INSERT INTO `7ih_role_permissions` VALUES (1, 62);
INSERT INTO `7ih_role_permissions` VALUES (2, 62);
INSERT INTO `7ih_role_permissions` VALUES (1, 63);
INSERT INTO `7ih_role_permissions` VALUES (2, 63);
INSERT INTO `7ih_role_permissions` VALUES (1, 64);
INSERT INTO `7ih_role_permissions` VALUES (2, 64);
INSERT INTO `7ih_role_permissions` VALUES (1, 65);
INSERT INTO `7ih_role_permissions` VALUES (2, 65);
INSERT INTO `7ih_role_permissions` VALUES (1, 66);
INSERT INTO `7ih_role_permissions` VALUES (2, 66);
INSERT INTO `7ih_role_permissions` VALUES (1, 67);
INSERT INTO `7ih_role_permissions` VALUES (2, 67);
INSERT INTO `7ih_role_permissions` VALUES (1, 68);
INSERT INTO `7ih_role_permissions` VALUES (2, 68);
INSERT INTO `7ih_role_permissions` VALUES (1, 69);
INSERT INTO `7ih_role_permissions` VALUES (2, 69);
INSERT INTO `7ih_role_permissions` VALUES (1, 70);
INSERT INTO `7ih_role_permissions` VALUES (2, 70);
INSERT INTO `7ih_role_permissions` VALUES (1, 71);
INSERT INTO `7ih_role_permissions` VALUES (2, 71);
INSERT INTO `7ih_role_permissions` VALUES (1, 72);
INSERT INTO `7ih_role_permissions` VALUES (2, 72);
INSERT INTO `7ih_role_permissions` VALUES (1, 73);
INSERT INTO `7ih_role_permissions` VALUES (2, 73);
INSERT INTO `7ih_role_permissions` VALUES (1, 74);
INSERT INTO `7ih_role_permissions` VALUES (2, 74);
INSERT INTO `7ih_role_permissions` VALUES (1, 75);
INSERT INTO `7ih_role_permissions` VALUES (1, 76);
INSERT INTO `7ih_role_permissions` VALUES (1, 77);
INSERT INTO `7ih_role_permissions` VALUES (1, 78);
INSERT INTO `7ih_role_permissions` VALUES (1, 79);
INSERT INTO `7ih_role_permissions` VALUES (1, 80);
INSERT INTO `7ih_role_permissions` VALUES (1, 81);
INSERT INTO `7ih_role_permissions` VALUES (1, 82);
INSERT INTO `7ih_role_permissions` VALUES (1, 83);
INSERT INTO `7ih_role_permissions` VALUES (2, 83);
INSERT INTO `7ih_role_permissions` VALUES (1, 84);
INSERT INTO `7ih_role_permissions` VALUES (2, 84);
INSERT INTO `7ih_role_permissions` VALUES (1, 85);
INSERT INTO `7ih_role_permissions` VALUES (2, 85);
INSERT INTO `7ih_role_permissions` VALUES (4, 85);
INSERT INTO `7ih_role_permissions` VALUES (5, 85);
INSERT INTO `7ih_role_permissions` VALUES (6, 85);
INSERT INTO `7ih_role_permissions` VALUES (7, 85);
INSERT INTO `7ih_role_permissions` VALUES (1, 86);
INSERT INTO `7ih_role_permissions` VALUES (2, 86);
INSERT INTO `7ih_role_permissions` VALUES (1, 87);
INSERT INTO `7ih_role_permissions` VALUES (2, 87);
INSERT INTO `7ih_role_permissions` VALUES (1, 88);
INSERT INTO `7ih_role_permissions` VALUES (2, 88);
INSERT INTO `7ih_role_permissions` VALUES (1, 89);
INSERT INTO `7ih_role_permissions` VALUES (2, 89);
INSERT INTO `7ih_role_permissions` VALUES (3, 90);
INSERT INTO `7ih_role_permissions` VALUES (3, 91);
INSERT INTO `7ih_role_permissions` VALUES (3, 92);
INSERT INTO `7ih_role_permissions` VALUES (3, 93);
INSERT INTO `7ih_role_permissions` VALUES (3, 94);
INSERT INTO `7ih_role_permissions` VALUES (3, 95);
INSERT INTO `7ih_role_permissions` VALUES (3, 96);
INSERT INTO `7ih_role_permissions` VALUES (3, 97);

-- ----------------------------
-- Table structure for 7ih_roles
-- ----------------------------
DROP TABLE IF EXISTS `7ih_roles`;
CREATE TABLE `7ih_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_roles
-- ----------------------------
INSERT INTO `7ih_roles` VALUES (1, 'admin', 'Admin', 'Admin', '2017-12-16 01:36:55', '2017-12-16 01:36:55');
INSERT INTO `7ih_roles` VALUES (2, 'manager', 'Quản lý', 'Quản lý hệ thống', '2017-12-16 01:37:04', '2017-12-16 07:55:47');
INSERT INTO `7ih_roles` VALUES (3, 'customer', 'Khách hàng', 'Quyền dành cho khách hàng', '2017-12-16 01:37:08', '2017-12-16 08:02:56');
INSERT INTO `7ih_roles` VALUES (4, 'sales', 'Kinh doanh', NULL, '2017-12-16 07:55:23', '2017-12-16 07:55:23');
INSERT INTO `7ih_roles` VALUES (5, 'designer', 'Thiết kế', NULL, '2017-12-16 08:32:22', '2017-12-16 08:32:22');
INSERT INTO `7ih_roles` VALUES (6, 'printer', 'In ấn', NULL, '2017-12-16 08:33:14', '2017-12-16 08:33:14');
INSERT INTO `7ih_roles` VALUES (7, 'shipper', 'Shipper', NULL, '2017-12-16 08:33:44', '2017-12-16 08:33:44');

-- ----------------------------
-- Table structure for 7ih_sessions
-- ----------------------------
DROP TABLE IF EXISTS `7ih_sessions`;
CREATE TABLE `7ih_sessions`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE INDEX `sessions_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_settings
-- ----------------------------
DROP TABLE IF EXISTS `7ih_settings`;
CREATE TABLE `7ih_settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_company_id_key_unique`(`company_id`, `key`) USING BTREE,
  INDEX `settings_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_settings
-- ----------------------------
INSERT INTO `7ih_settings` VALUES (1, 1, 'general.default_account', '2');
INSERT INTO `7ih_settings` VALUES (2, 1, 'general.date_format', 'd m Y');
INSERT INTO `7ih_settings` VALUES (3, 1, 'general.date_separator', 'slash');
INSERT INTO `7ih_settings` VALUES (4, 1, 'general.timezone', 'Asia/Ho_Chi_Minh');
INSERT INTO `7ih_settings` VALUES (5, 1, 'general.invoice_number_prefix', 'INV-');
INSERT INTO `7ih_settings` VALUES (6, 1, 'general.invoice_number_digit', '5');
INSERT INTO `7ih_settings` VALUES (7, 1, 'general.invoice_number_next', '11');
INSERT INTO `7ih_settings` VALUES (8, 1, 'general.default_payment_method', 'offlinepayment.cash.1');
INSERT INTO `7ih_settings` VALUES (9, 1, 'general.email_protocol', 'mail');
INSERT INTO `7ih_settings` VALUES (10, 1, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs');
INSERT INTO `7ih_settings` VALUES (11, 1, 'general.send_invoice_reminder', '0');
INSERT INTO `7ih_settings` VALUES (12, 1, 'general.schedule_invoice_days', '1,3,5,10');
INSERT INTO `7ih_settings` VALUES (13, 1, 'general.send_bill_reminder', '0');
INSERT INTO `7ih_settings` VALUES (14, 1, 'general.schedule_bill_days', '10,5,3,1');
INSERT INTO `7ih_settings` VALUES (15, 1, 'general.schedule_time', '09:00');
INSERT INTO `7ih_settings` VALUES (16, 1, 'general.admin_theme', 'skin-green-light');
INSERT INTO `7ih_settings` VALUES (17, 1, 'general.list_limit', '25');
INSERT INTO `7ih_settings` VALUES (18, 1, 'general.use_gravatar', '0');
INSERT INTO `7ih_settings` VALUES (19, 1, 'general.session_handler', 'file');
INSERT INTO `7ih_settings` VALUES (20, 1, 'general.session_lifetime', '18000');
INSERT INTO `7ih_settings` VALUES (21, 1, 'general.file_size', '100');
INSERT INTO `7ih_settings` VALUES (22, 1, 'general.file_types', 'pdf,jpeg,jpg,png,zip,rar,7z,xlsx,docs,xls,doc');
INSERT INTO `7ih_settings` VALUES (23, 1, 'general.company_name', 'TGS');
INSERT INTO `7ih_settings` VALUES (24, 1, 'general.company_email', 'admin@admin.com');
INSERT INTO `7ih_settings` VALUES (25, 1, 'general.default_currency', 'VND');
INSERT INTO `7ih_settings` VALUES (26, 1, 'general.default_locale', 'vi-VN');
INSERT INTO `7ih_settings` VALUES (27, 1, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Thanh to\\u00e1n tr\\u1ef1c ti\\u1ebfp\",\"order\":\"1\",\"description\":null,\"customer\":\"0\"},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Chuy\\u1ec3n kho\\u1ea3n\",\"order\":\"2\",\"description\":null,\"customer\":\"0\"}]');
INSERT INTO `7ih_settings` VALUES (30, 1, 'general.company_logo', 'settings/tgslive-profile_image-eb77b442e5f77a39-300x300.png');
INSERT INTO `7ih_settings` VALUES (34, 1, 'general.default_tax', '2');
INSERT INTO `7ih_settings` VALUES (41, 1, 'general.default_size', '1');

-- ----------------------------
-- Table structure for 7ih_sizes
-- ----------------------------
DROP TABLE IF EXISTS `7ih_sizes`;
CREATE TABLE `7ih_sizes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `taxes_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_sizes
-- ----------------------------
INSERT INTO `7ih_sizes` VALUES (4, 1, 'S', 's', 1, '2017-11-08 00:00:00', '2017-11-08 00:00:00', NULL);
INSERT INTO `7ih_sizes` VALUES (5, 1, 'M', 'm', 1, '2017-11-08 00:00:00', '2017-11-08 00:00:00', NULL);
INSERT INTO `7ih_sizes` VALUES (6, 1, 'L', 'l', 1, '2017-11-08 00:00:00', '2017-11-08 00:00:00', NULL);
INSERT INTO `7ih_sizes` VALUES (7, 1, 'XL', 'xl', 1, '2017-11-08 00:00:00', '2017-11-08 00:00:00', NULL);
INSERT INTO `7ih_sizes` VALUES (8, 1, 'XXL', 'xxl', 1, '2017-11-08 00:00:00', '2017-11-08 00:00:00', NULL);
INSERT INTO `7ih_sizes` VALUES (9, 1, 'XXXL', 'xxxl', 1, '2017-11-08 00:00:00', '2017-11-08 00:00:00', NULL);

-- ----------------------------
-- Table structure for 7ih_taxes
-- ----------------------------
DROP TABLE IF EXISTS `7ih_taxes`;
CREATE TABLE `7ih_taxes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15, 4) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `taxes_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_taxes
-- ----------------------------
INSERT INTO `7ih_taxes` VALUES (1, 1, 'Miễn thuế', 0.0000, 1, '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);
INSERT INTO `7ih_taxes` VALUES (2, 1, 'Thuế', 5.0000, 1, '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);
INSERT INTO `7ih_taxes` VALUES (3, 1, 'Thuế bán hàng', 15.0000, 1, '2017-12-16 01:38:17', '2017-12-16 01:38:17', NULL);

-- ----------------------------
-- Table structure for 7ih_transfers
-- ----------------------------
DROP TABLE IF EXISTS `7ih_transfers`;
CREATE TABLE `7ih_transfers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transfers_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_user_companies
-- ----------------------------
DROP TABLE IF EXISTS `7ih_user_companies`;
CREATE TABLE `7ih_user_companies`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `company_id`, `user_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_user_companies
-- ----------------------------
INSERT INTO `7ih_user_companies` VALUES (1, 1, 'users');
INSERT INTO `7ih_user_companies` VALUES (2, 1, 'users');
INSERT INTO `7ih_user_companies` VALUES (3, 1, 'users');
INSERT INTO `7ih_user_companies` VALUES (4, 1, 'users');
INSERT INTO `7ih_user_companies` VALUES (5, 1, 'users');

-- ----------------------------
-- Table structure for 7ih_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `7ih_user_permissions`;
CREATE TABLE `7ih_user_permissions`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `permission_id`, `user_type`) USING BTREE,
  INDEX `user_permissions_permission_id_foreign`(`permission_id`) USING BTREE,
  CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `7ih_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 7ih_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `7ih_user_roles`;
CREATE TABLE `7ih_user_roles`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`, `user_type`) USING BTREE,
  INDEX `user_roles_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `7ih_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_user_roles
-- ----------------------------
INSERT INTO `7ih_user_roles` VALUES (1, 1, 'users');
INSERT INTO `7ih_user_roles` VALUES (2, 4, 'users');
INSERT INTO `7ih_user_roles` VALUES (3, 5, 'users');
INSERT INTO `7ih_user_roles` VALUES (4, 6, 'users');
INSERT INTO `7ih_user_roles` VALUES (5, 7, 'users');

-- ----------------------------
-- Table structure for 7ih_users
-- ----------------------------
DROP TABLE IF EXISTS `7ih_users`;
CREATE TABLE `7ih_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_logged_in_at` timestamp(0) NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vi-VN',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_deleted_at_unique`(`email`, `deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 7ih_users
-- ----------------------------
INSERT INTO `7ih_users` VALUES (1, 'TGS', 'admin@admin.com', '$2y$10$j0E8.nyTwbioP0Cw5kJAPeyYrrBYSoGYFRifGMgIQ9R2s2nKnxGAW', 'N62xOkPNsVYhnIjInxFOOoRdnaBwq2W0eL2qrLoYz18HEOZvpMs50w9MsnKC', 'users/h0BNQmNymvBoo5Q7uxmNjDXOXXJJQMhILVGm9878.png', '2017-12-16 08:19:46', 1, '2017-12-16 01:38:18', '2017-12-16 08:28:01', NULL, 'vi-VN');
INSERT INTO `7ih_users` VALUES (2, 'Kinh doanh', 'kd@admin.com', '$2y$10$Eqx.t05Y6LbWCjUV3w7T6eCoEsVGTqXm1tAeqZ4o5e3KDNf5azotW', NULL, NULL, NULL, 1, '2017-12-16 08:30:11', '2017-12-16 08:35:39', NULL, 'vi-VN');
INSERT INTO `7ih_users` VALUES (3, 'Thiết kế', 'tk@admin.com', '$2y$10$puctYXlZR/ioNuiuJFvhhuN60/h4AiCbORiBzE2FiJ76K0SXd74vu', NULL, NULL, NULL, 1, '2017-12-16 08:34:24', '2017-12-16 08:35:53', NULL, 'vi-VN');
INSERT INTO `7ih_users` VALUES (4, 'In ấn', 'pt@admin.com', '$2y$10$8Z6BvGCGD1ZQDGjrEzXVyuUgdHFu/nUEiE2Euu2Rhy8rPc60ed9yG', NULL, NULL, NULL, 1, '2017-12-16 08:34:57', '2017-12-16 08:34:57', NULL, 'vi-VN');
INSERT INTO `7ih_users` VALUES (5, 'Shipper', 'sp@admin.com', '$2y$10$BQvxVpxD0c/mz./9dXLEz.jfaxaagEyJW83gMNWMR0Iw79aTqPWIa', NULL, NULL, NULL, 1, '2017-12-16 08:35:22', '2017-12-16 08:35:22', NULL, 'vi-VN');

-- ----------------------------
-- Table structure for 7ih_vendors
-- ----------------------------
DROP TABLE IF EXISTS `7ih_vendors`;
CREATE TABLE `7ih_vendors`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `vendors_company_id_email_deleted_at_unique`(`company_id`, `email`, `deleted_at`) USING BTREE,
  INDEX `vendors_company_id_index`(`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
