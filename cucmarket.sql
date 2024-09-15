/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : cucmarketf1

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 09/07/2024 11:10:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, 'Eulerbaby');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add user info', 7, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (20, 'Can change user info', 7, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (21, 'Can delete user info', 7, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can add goods info', 8, 'add_goodsinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can change goods info', 8, 'change_goodsinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can delete goods info', 8, 'delete_goodsinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add cart info', 9, 'add_cartinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change cart info', 9, 'change_cartinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete cart info', 9, 'delete_cartinfo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$260000$6QKkJqEmMKcWWJVQ9XJqjY$DnrLN2pXIv7oYSHYEJF+vnitS7jB6t6HUcHhNRhf1oo=', '2024-07-03 12:04:04', 1, 'admin', '', '', '', 1, 1, '2020-06-23 01:18:45');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$260000$upEWQWtIrse5dejUHetUis$V+z/e1ZZlZqZgpMu9tHb5Gr4aQ/ke0DpTWlsZH+WGFU=', '2024-07-07 05:01:17', 1, '1033220520', '', '', '151@qq.com', 1, 1, '2024-07-07 05:00:50');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$260000$0b0xaEPMKAqZCErmZJe7nZ$cWAI+XtyCkN85KcIBTyudzfZxMJHBTpRSHuTM764JkM=', '2024-07-09 00:35:22', 0, '1033220521', 'xie', '伟建', '1265721538@qq.com', 1, 1, '2024-07-07 05:03:00');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$260000$AXfdpvjwZBzoBC6kx0RacJ$oooJ5WGGhHfFRRQ/Z5releTsQB9uT+ijI0AvuSzMBPQ=', '2024-07-08 14:47:41', 0, '1033220536', 'xie', '伟建', '1265721538@qq.com', 1, 1, '2024-07-08 14:46:00');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$260000$If5bYT5VaOt7PCkDijY23z$/4nmrk7n2ZJC1J45YcF3ggYLOpqDR5VoB/CT7TMUv68=', '2024-07-09 00:40:06', 0, '12351235', '', '', '', 1, 1, '2024-07-09 00:38:00');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES (1, 3, 1);
INSERT INTO `auth_user_user_permissions` VALUES (2, 3, 2);
INSERT INTO `auth_user_user_permissions` VALUES (3, 3, 3);
INSERT INTO `auth_user_user_permissions` VALUES (4, 3, 4);
INSERT INTO `auth_user_user_permissions` VALUES (5, 3, 5);
INSERT INTO `auth_user_user_permissions` VALUES (6, 3, 6);
INSERT INTO `auth_user_user_permissions` VALUES (7, 3, 7);
INSERT INTO `auth_user_user_permissions` VALUES (8, 3, 8);
INSERT INTO `auth_user_user_permissions` VALUES (9, 3, 9);
INSERT INTO `auth_user_user_permissions` VALUES (10, 3, 10);
INSERT INTO `auth_user_user_permissions` VALUES (11, 3, 11);
INSERT INTO `auth_user_user_permissions` VALUES (12, 3, 12);
INSERT INTO `auth_user_user_permissions` VALUES (13, 3, 13);
INSERT INTO `auth_user_user_permissions` VALUES (14, 3, 14);
INSERT INTO `auth_user_user_permissions` VALUES (15, 3, 15);
INSERT INTO `auth_user_user_permissions` VALUES (16, 3, 16);
INSERT INTO `auth_user_user_permissions` VALUES (17, 3, 17);
INSERT INTO `auth_user_user_permissions` VALUES (18, 3, 18);
INSERT INTO `auth_user_user_permissions` VALUES (19, 3, 19);
INSERT INTO `auth_user_user_permissions` VALUES (20, 3, 20);
INSERT INTO `auth_user_user_permissions` VALUES (21, 3, 21);
INSERT INTO `auth_user_user_permissions` VALUES (22, 3, 22);
INSERT INTO `auth_user_user_permissions` VALUES (23, 3, 23);
INSERT INTO `auth_user_user_permissions` VALUES (24, 3, 24);
INSERT INTO `auth_user_user_permissions` VALUES (25, 3, 25);
INSERT INTO `auth_user_user_permissions` VALUES (26, 3, 26);
INSERT INTO `auth_user_user_permissions` VALUES (27, 3, 27);
INSERT INTO `auth_user_user_permissions` VALUES (28, 4, 1);
INSERT INTO `auth_user_user_permissions` VALUES (29, 4, 2);
INSERT INTO `auth_user_user_permissions` VALUES (30, 4, 3);
INSERT INTO `auth_user_user_permissions` VALUES (31, 4, 4);
INSERT INTO `auth_user_user_permissions` VALUES (32, 4, 5);
INSERT INTO `auth_user_user_permissions` VALUES (33, 4, 6);
INSERT INTO `auth_user_user_permissions` VALUES (34, 4, 7);
INSERT INTO `auth_user_user_permissions` VALUES (35, 4, 8);
INSERT INTO `auth_user_user_permissions` VALUES (36, 4, 9);
INSERT INTO `auth_user_user_permissions` VALUES (37, 4, 10);
INSERT INTO `auth_user_user_permissions` VALUES (38, 4, 11);
INSERT INTO `auth_user_user_permissions` VALUES (39, 4, 12);
INSERT INTO `auth_user_user_permissions` VALUES (40, 4, 13);
INSERT INTO `auth_user_user_permissions` VALUES (41, 4, 14);
INSERT INTO `auth_user_user_permissions` VALUES (42, 4, 15);
INSERT INTO `auth_user_user_permissions` VALUES (43, 4, 16);
INSERT INTO `auth_user_user_permissions` VALUES (44, 4, 17);
INSERT INTO `auth_user_user_permissions` VALUES (45, 4, 18);
INSERT INTO `auth_user_user_permissions` VALUES (46, 4, 19);
INSERT INTO `auth_user_user_permissions` VALUES (47, 4, 20);
INSERT INTO `auth_user_user_permissions` VALUES (48, 4, 21);
INSERT INTO `auth_user_user_permissions` VALUES (49, 4, 22);
INSERT INTO `auth_user_user_permissions` VALUES (50, 4, 23);
INSERT INTO `auth_user_user_permissions` VALUES (51, 4, 24);
INSERT INTO `auth_user_user_permissions` VALUES (52, 4, 25);
INSERT INTO `auth_user_user_permissions` VALUES (53, 4, 26);
INSERT INTO `auth_user_user_permissions` VALUES (54, 4, 27);
INSERT INTO `auth_user_user_permissions` VALUES (82, 6, 1);
INSERT INTO `auth_user_user_permissions` VALUES (83, 6, 2);
INSERT INTO `auth_user_user_permissions` VALUES (84, 6, 3);
INSERT INTO `auth_user_user_permissions` VALUES (85, 6, 4);
INSERT INTO `auth_user_user_permissions` VALUES (86, 6, 5);
INSERT INTO `auth_user_user_permissions` VALUES (87, 6, 6);
INSERT INTO `auth_user_user_permissions` VALUES (88, 6, 7);
INSERT INTO `auth_user_user_permissions` VALUES (89, 6, 8);
INSERT INTO `auth_user_user_permissions` VALUES (90, 6, 9);
INSERT INTO `auth_user_user_permissions` VALUES (91, 6, 10);
INSERT INTO `auth_user_user_permissions` VALUES (92, 6, 11);
INSERT INTO `auth_user_user_permissions` VALUES (93, 6, 12);
INSERT INTO `auth_user_user_permissions` VALUES (94, 6, 13);
INSERT INTO `auth_user_user_permissions` VALUES (95, 6, 14);
INSERT INTO `auth_user_user_permissions` VALUES (96, 6, 15);
INSERT INTO `auth_user_user_permissions` VALUES (97, 6, 16);
INSERT INTO `auth_user_user_permissions` VALUES (98, 6, 17);
INSERT INTO `auth_user_user_permissions` VALUES (99, 6, 18);
INSERT INTO `auth_user_user_permissions` VALUES (100, 6, 19);
INSERT INTO `auth_user_user_permissions` VALUES (101, 6, 20);
INSERT INTO `auth_user_user_permissions` VALUES (102, 6, 21);
INSERT INTO `auth_user_user_permissions` VALUES (103, 6, 22);
INSERT INTO `auth_user_user_permissions` VALUES (104, 6, 23);
INSERT INTO `auth_user_user_permissions` VALUES (105, 6, 24);
INSERT INTO `auth_user_user_permissions` VALUES (106, 6, 25);
INSERT INTO `auth_user_user_permissions` VALUES (107, 6, 26);
INSERT INTO `auth_user_user_permissions` VALUES (108, 6, 27);

-- ----------------------------
-- Table structure for cart_cartinfo
-- ----------------------------
DROP TABLE IF EXISTS `cart_cartinfo`;
CREATE TABLE `cart_cartinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `picture` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `buyer_id` int NOT NULL,
  `good_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_cartinfo_buyer_id_b65eceb6_fk_user_userinfo_id`(`buyer_id` ASC) USING BTREE,
  INDEX `cart_cartinfo_589eff59`(`good_id` ASC) USING BTREE,
  CONSTRAINT `cart_cartinfo_buyer_id_b65eceb6_fk_user_userinfo_id` FOREIGN KEY (`buyer_id`) REFERENCES `user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_cartinfo_good_id_87c55252_fk_goods_goodsinfo_id` FOREIGN KEY (`good_id`) REFERENCES `goods_goodsinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_cartinfo
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2024-07-02 01:28:42', '1', 'test', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2024-07-02 01:34:40', '2', 'test', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (3, '2024-06-29 21:37:10', '3', 'test2', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (4, '2024-06-30 01:39:11', '3', 'test2', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (5, '2024-06-30 01:39:56', '4', 'test2', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2024-06-30 11:48:32', '5', '活着，为了什么', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (7, '2024-07-01 20:51:25', '6', '追风筝的人', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2024-06-30 09:09:08', '7', '索尼FDR-AX60', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2024-07-02 21:11:53', '8', 'JVC GZ-RY980', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2024-07-02 04:27:54', '9', 'GZ-RY775', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (11, '2024-06-29 00:38:02', '10', 'hefanxi', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (12, '2024-06-28 17:39:06', '11', 'NEWFOUNDN', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (13, '2024-07-01 04:40:02', '12', 'ONE ONLY', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2024-07-01 07:00:34', '13', '木梳', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (15, '2024-07-03 07:01:24', '14', '陶碗', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (16, '2024-07-01 07:02:09', '15', '迷你灯', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (17, '2024-06-30 07:07:00', '16', '永久山地车', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (18, '2024-06-29 07:07:39', '17', '桑浦山地车', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (19, '2024-06-28 07:08:52', '18', '猛犸王山地车', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (20, '2024-06-30 07:17:23', '19', '纸板材料', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2024-07-01 07:17:55', '20', '布料', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2024-07-01 07:18:21', '21', '手工纸', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2024-06-30 07:29:30', '22', '小王子', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (24, '2024-06-24 07:39:22', '23', '撒哈拉的故事', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (25, '2024-06-29 07:41:36', '24', '挪威的森林', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (26, '2024-07-01 07:42:47', '25', '月亮和六便士', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (27, '2024-07-07 05:02:35', '92', '算法1', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (28, '2024-07-07 05:02:55', '6', 'UserInfo object (6)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (29, '2024-07-07 05:03:54', '3', '1033220521', 1, '[{\"added\": {}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (30, '2024-07-07 05:04:30', '3', '1033220521', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"User permissions\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (31, '2024-07-07 07:26:18', '7', 'UserInfo object (7)', 2, '[]', 7, 3);
INSERT INTO `django_admin_log` VALUES (32, '2024-07-08 00:57:17', '52', 'CartInfo object (52)', 3, '', 9, 3);
INSERT INTO `django_admin_log` VALUES (33, '2024-07-08 14:42:44', '109', '狗头梳子5', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (34, '2024-07-08 14:43:52', '111', '121215', 3, '', 8, 3);
INSERT INTO `django_admin_log` VALUES (35, '2024-07-08 14:44:59', '5', 'UserInfo object (5)', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (36, '2024-07-08 14:45:42', '5', 'UserInfo object (5)', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (37, '2024-07-08 14:46:50', '4', '1033220536', 1, '[{\"added\": {}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (38, '2024-07-08 14:47:11', '4', '1033220536', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"User permissions\"]}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (39, '2024-07-08 14:48:30', '1', 'Eulerbaby', 1, '[{\"added\": {}}]', 2, 4);
INSERT INTO `django_admin_log` VALUES (40, '2024-07-09 00:18:01', '115', '454545', 1, '[{\"added\": {}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (41, '2024-07-09 00:18:38', '115', '454545', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (42, '2024-07-09 00:19:04', '115', '454545', 3, '', 8, 3);
INSERT INTO `django_admin_log` VALUES (43, '2024-07-09 00:19:31', '11', 'UserInfo object (11)', 1, '[{\"added\": {}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (44, '2024-07-09 00:19:49', '11', 'UserInfo object (11)', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 7, 3);
INSERT INTO `django_admin_log` VALUES (45, '2024-07-09 00:19:58', '11', 'UserInfo object (11)', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (46, '2024-07-09 00:20:45', '5', '15151515555', 1, '[{\"added\": {}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (47, '2024-07-09 00:21:03', '5', '15151515555', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (48, '2024-07-09 00:21:18', '5', '1515151555', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (50, '2024-07-09 00:36:22', '117', '12121651', 1, '[{\"added\": {}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (51, '2024-07-09 00:36:36', '117', '12121651', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 8, 3);
INSERT INTO `django_admin_log` VALUES (52, '2024-07-09 00:36:46', '117', '12121651', 2, '[]', 8, 3);
INSERT INTO `django_admin_log` VALUES (53, '2024-07-09 00:36:58', '117', '12121651', 3, '', 8, 3);
INSERT INTO `django_admin_log` VALUES (54, '2024-07-09 00:37:12', '12', 'UserInfo object (12)', 3, '', 7, 3);
INSERT INTO `django_admin_log` VALUES (55, '2024-07-09 00:38:58', '6', '12351235', 1, '[{\"added\": {}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (56, '2024-07-09 00:39:34', '6', '12351235', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]', 4, 3);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (9, 'cart', 'cartinfo');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (8, 'goods', 'goodsinfo');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'user', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-06-20 13:59:20');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-06-20 13:59:20');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-06-20 13:59:20');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-06-20 13:59:20');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (13, 'sessions', '0001_initial', '2024-06-20 13:59:21');
INSERT INTO `django_migrations` VALUES (14, 'user', '0001_initial', '2024-06-21 12:54:09');
INSERT INTO `django_migrations` VALUES (15, 'goods', '0001_initial', '2024-06-23 01:19:42');
INSERT INTO `django_migrations` VALUES (16, 'goods', '0002_auto_20200623_1005', '2024-06-23 02:05:55');
INSERT INTO `django_migrations` VALUES (17, 'goods', '0003_auto_20200623_1512', '2024-06-23 07:13:02');
INSERT INTO `django_migrations` VALUES (18, 'goods', '0004_auto_20200623_1516', '2024-06-23 07:16:41');
INSERT INTO `django_migrations` VALUES (19, 'goods', '0005_goodsinfo_userid', '2024-06-30 01:16:41');
INSERT INTO `django_migrations` VALUES (20, 'goods', '0006_auto_20200630_0917', '2024-06-30 01:18:04');
INSERT INTO `django_migrations` VALUES (21, 'cart', '0001_initial', '2024-06-30 06:44:01');
INSERT INTO `django_migrations` VALUES (22, 'cart', '0002_auto_20200630_1443', '2024-06-30 06:44:01');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_de54fa62`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('65ursjubt26xfsd63x6y8iva61ymgh45', '.eJxVjDkOwjAUBe_iGlnxnlDScwbrb8YBlEhxUiHuDpFSQPtm5r1Uhm2teWuy5JHVWRl1-t0Q6CHTDvgO023WNE_rMqLeFX3Qpq8zy_NyuH8HFVr91k5K531wBbknh6kDxxTtwGRhQAsBKEJEL4PjHhlSYWPJSAleJCZS7w8J8TlI:1sNSUi:85k7EeEUS05BE4Q3ayq5K-J7SfqDTTIZoktaG372jxs', '2024-07-13 07:27:37');
INSERT INTO `django_session` VALUES ('t8cp893c5coqauzam6kygrd7k49z86nz', 'ZmM4NThkMzIyNzVkOTI5N2FiZmI4OGNjNzI1YTQxMTQ0ZWY5MTVhYjp7InVzZXJfaWQiOjEsIm51bWJlciI6IjIwMTcxMTExMTExIiwidXNlcm5hbWUiOiJcdTY3NGVcdTU2ZGIifQ==', '2020-07-06 10:25:21');
INSERT INTO `django_session` VALUES ('t9r67iqunz98nemg2p5r89wlff7qu7xr', 'ZmM4NThkMzIyNzVkOTI5N2FiZmI4OGNjNzI1YTQxMTQ0ZWY5MTVhYjp7InVzZXJfaWQiOjEsIm51bWJlciI6IjIwMTcxMTExMTExIiwidXNlcm5hbWUiOiJcdTY3NGVcdTU2ZGIifQ==', '2020-07-14 06:54:54');
INSERT INTO `django_session` VALUES ('xttqangqxvtrlyhqi7klzvdx4wc6qlm4', '.eJxVjM0OgjAQhN-lZ0PabimUo3ffgIRsd7eCPyUBejK-u2iMiZc5zHzzPVRZZRkmVh0cVC73KIvqlNEA1mowQR0-RMa77H1fgofUl5oa0xcnmvvS6rSnd87v7IBlG4efU5n_LiJdJb8HvmA-zxXNeVumWL2R6ruu1WlmuR2_7J9gxHXc3yBJO1dDitwSxEYjMHkbmCyGaLFG8uijkwDcRsYmsbFkJNVOxDekni_onFAd:1sOyiS:7kanOGXOmI_AWQzwY3Y1N6_kIf0Pf8DNBLJ5jLKPKCQ', '2024-07-17 12:04:04');

-- ----------------------------
-- Table structure for goods_goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsinfo`;
CREATE TABLE `goods_goodsinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `picture` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_goodsinfo_3491001b`(`user_id` ASC) USING BTREE,
  CONSTRAINT `goods_goodsinfo_user_id_84b4d3d0_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_goodsinfo
-- ----------------------------
INSERT INTO `goods_goodsinfo` VALUES (6, '算法导论第四版', 'books', 'goods/books/算法导论第四版.jpg', 20.00, 0, '涓苑16楼', '二手书', 1);
INSERT INTO `goods_goodsinfo` VALUES (7, '索尼ZV-E10L', 'digital', 'goods/digital/索尼ZV-E10L.jpg', 7500.00, 0, '桃苑25楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (8, '索尼α77', 'digital', 'goods/digital/索尼α77.jpg', 3000.00, 0, '浩苑33楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (9, '索尼DSC', 'digital', 'goods/digital/索尼DSC.jpg', 2000.00, 0, '浩苑24楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (10, '真维斯短袖', 'cloth', 'goods/cloth/真维斯短袖.jpg', 15.00, 0, '澈苑73楼', '暂无', 3);
INSERT INTO `goods_goodsinfo` VALUES (11, '卡图驰-日系短袖', 'cloth', 'goods/cloth/卡图驰-日系短袖.jpg', 15.00, 0, '李苑80楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (12, '特步氢风科技6.0', 'cloth', 'goods/cloth/特步氢风科技6.0.jpg', 55.00, 0, '澈苑73楼', '暂无', 3);
INSERT INTO `goods_goodsinfo` VALUES (13, '小台灯', 'daily', 'goods/daily/小台灯.jpg', 5.00, 0, '澈苑73楼', '毕业甩卖', 3);
INSERT INTO `goods_goodsinfo` VALUES (14, '公牛插座-2插位', 'daily', 'goods/daily/公牛插座-2插位.jpg', 3.00, 0, '澈苑73楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (15, '半球电水壶', 'daily', 'goods/daily/半球电水壶.jpg', 15.00, 0, '李苑81楼', '毕业甩卖，5r', 1);
INSERT INTO `goods_goodsinfo` VALUES (16, '澳都自行车', 'traffic', 'goods/traffic/澳都自行车.jpg', 1200.00, 0, '涓苑17楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (17, '菲利普自行车', 'traffic', 'goods/traffic/菲利普自行车.jpg', 820.00, 0, '李苑17楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (18, '凤凰软尾自行车', 'traffic', 'goods/traffic/凤凰软尾自行车.jpg', 500.00, 0, '南门门口', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (19, '五谷道场酸笋肥牛5袋', 'other', 'goods/other/五谷道场酸笋肥牛5袋.jpg', 12.00, 0, '澈苑73楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (23, '挪威的森林', 'books', 'goods/books/挪威的森林.jpg', 5.00, 0, '澈苑73楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (25, '索尼α77', 'digital', 'goods/digital/索尼α77.jpg', 1450.00, 0, '星光广场', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (27, '小王子', 'books', 'goods/books/小王子.jpg', 2.00, 0, '清苑26楼', '暂无', 1);
INSERT INTO `goods_goodsinfo` VALUES (28, '活着，为了什么', 'books', 'goods/books/活着，为了什么.jpg', 48.00, 0, '澈苑73楼', '二手书', 1);
INSERT INTO `goods_goodsinfo` VALUES (108, '二手9成新衣服', 'cloth', 'goods/二手衣服黑白格子群.jpg', 56.00, 0, '江南大学澈院', '荷兰首席设计师巨作', 8);
INSERT INTO `goods_goodsinfo` VALUES (109, '狗头梳子5', 'daily', 'goods/狗头梳子.jpg', 5.00, 0, '江南大学澈院', '可爱的梳子', 8);
INSERT INTO `goods_goodsinfo` VALUES (110, '装饰品寝室', 'other', 'goods/装饰品彩色.jpg', 20.00, 0, '江南大学澈院', '1233123', 8);

-- ----------------------------
-- Table structure for user_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo`;
CREATE TABLE `user_userinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `number` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_userinfo
-- ----------------------------
INSERT INTO `user_userinfo` VALUES (1, '李四', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '20171111111');
INSERT INTO `user_userinfo` VALUES (2, '123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '3212');
INSERT INTO `user_userinfo` VALUES (3, '阿山不能摆', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1033220319');
INSERT INTO `user_userinfo` VALUES (4, '1033220421', 'daff15bf5aef78f7fc3b5f6d050fbca456ff3acc', '1033220421');
INSERT INTO `user_userinfo` VALUES (7, '1033220422', '265850c379c172010751340c0a32343f627bdd40', '1033220422');
INSERT INTO `user_userinfo` VALUES (8, '1033220440', '6d7c1adc4a3db9b6cc75224e2f379444331680e8', '1033220440');
INSERT INTO `user_userinfo` VALUES (9, '1033220524', '449f42f67bed92bc08b4819ec82a5278b786e8d1', '1033220524');
INSERT INTO `user_userinfo` VALUES (10, '12345678', '7c222fb2927d828af22f592134e8932480637c0d', '12345678');

SET FOREIGN_KEY_CHECKS = 1;
