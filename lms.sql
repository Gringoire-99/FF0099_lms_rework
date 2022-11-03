/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : lms2

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 30/10/2022 20:29:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员名',
  `admin_id` bigint NOT NULL COMMENT 'id',
  `phone_number` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '无' COMMENT '电话',
  `avatar_pic` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像图片',
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '123456789',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('侯思淼', 319073515228, '46728227889', NULL, '123456789');
INSERT INTO `admin` VALUES ('崔展鹏', 341559201665, '89435058289', NULL, '123456789');
INSERT INTO `admin` VALUES ('卢鸿涛', 391797662579, '45866102632', NULL, '123456789');
INSERT INTO `admin` VALUES ('阎擎苍', 1930101209730, '98065492567', NULL, '123456789');
INSERT INTO `admin` VALUES ('崔旭尧', 2445024087111, '21441732234', NULL, '123456789');
INSERT INTO `admin` VALUES ('董炎彬', 2820408627137, '61785499614', NULL, '123456789');
INSERT INTO `admin` VALUES ('唐熠彤', 2997845778293, '65213541230', NULL, '123456789');
INSERT INTO `admin` VALUES ('任耀杰', 4600566993566, '30131105168', NULL, '123456789');
INSERT INTO `admin` VALUES ('高潇然', 5015485432935, '20727021135', NULL, '123456789');
INSERT INTO `admin` VALUES ('田金鑫', 5221492809306, '79550632936', NULL, '123456789');
INSERT INTO `admin` VALUES ('李子默', 5262816196227, '32793371491', NULL, '123456789');
INSERT INTO `admin` VALUES ('许伟宸', 5264962544057, '54558980170', NULL, '123456789');
INSERT INTO `admin` VALUES ('莫烨霖', 5361662862975, '88985719056', NULL, '123456789');
INSERT INTO `admin` VALUES ('陈笑愚', 5438490811032, '67015412602', NULL, '123456789');
INSERT INTO `admin` VALUES ('郝思聪', 6910532567230, '72995661267', NULL, '123456789');
INSERT INTO `admin` VALUES ('宋浩', 7125329819156, '23403188139', NULL, '123456789');
INSERT INTO `admin` VALUES ('刘乐驹', 7586397874319, '86810190793', NULL, '123456789');
INSERT INTO `admin` VALUES ('董博文', 7675937405174, '64106775481', NULL, '123456789');
INSERT INTO `admin` VALUES ('戴鹤轩', 8380787912682, '81384666121', NULL, '123456789');
INSERT INTO `admin` VALUES ('严明轩', 9883906308312, '55379647433', NULL, '123456789');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` bigint NOT NULL COMMENT '书号',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除(0-未删, 1-已删)',
  `author` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未知' COMMENT '作者',
  `number` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '库存数量',
  `reading_number` bigint NULL DEFAULT 0 COMMENT '正在阅读数',
  `press` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未知' COMMENT '出版社',
  `book_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书名',
  `press_time` datetime NULL DEFAULT '2022-10-17 12:35:16' COMMENT '印刷时间',
  `stars` bigint NULL DEFAULT 0 COMMENT '收藏',
  `likes` bigint NULL DEFAULT 0 COMMENT '点赞数',
  `price` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '价格',
  `summary` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无' COMMENT '摘要',
  `cover_pic` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无封面' COMMENT '图片的url地址',
  PRIMARY KEY (`book_id`) USING BTREE,
  CONSTRAINT `book_chk_1` CHECK (`price` > 0),
  CONSTRAINT `book_chk_2` CHECK (`reading_number` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '图书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (876420648924, 0, '蔡鹏', '664', 0, 'HN出版社', '《[Zo》', '2022-10-17 12:35:16', 0, 0, 207, '无', '无封面');
INSERT INTO `book` VALUES (1038187923071, 0, '潘炎彬', '177', 0, 'jA@出版社', '《tn;=》', '2022-10-17 12:35:16', 0, 0, 780, '无', '无封面');
INSERT INTO `book` VALUES (1223346223184, 0, '孟聪健', '74', 0, 'L@H出版社', '《b<?fO》', '2022-10-17 12:35:16', 0, 0, 811, '无', '无封面');
INSERT INTO `book` VALUES (1385310779056, 0, '袁炎彬', '986', 0, 'rs出版社', '《JofMD》', '2022-10-17 12:35:16', 0, 0, 14, '无', '无封面');
INSERT INTO `book` VALUES (2233230472186, 0, '陈晓博', '40', 0, 'uE出版社', '《9ia》', '2022-10-17 12:35:16', 0, 0, 28, '无', '无封面');
INSERT INTO `book` VALUES (2465770552656, 0, '金思', '97', 0, 'HE出版社', '《4_V7i》', '2022-10-17 12:35:16', 0, 0, 94, '无', '无封面');
INSERT INTO `book` VALUES (3418539290300, 0, '严绍齐', '736', 0, 'p出版社', '《MMIjY》', '2022-10-17 12:35:16', 0, 0, 62, '无', '无封面');
INSERT INTO `book` VALUES (3841465747783, 0, '朱伟泽', '633', 0, 'g出版社', '《goa》', '2022-10-17 12:35:16', 0, 0, 22, '无', '无封面');
INSERT INTO `book` VALUES (4646761946215, 0, '邱鹏', '522', 0, 'Ag出版社', '《DjsR》', '2022-10-17 12:35:16', 0, 0, 989, '无', '无封面');
INSERT INTO `book` VALUES (4851882721455, 0, '孔志泽', '890', 0, 't;o出版社', '《tj1k》', '2022-10-17 12:35:16', 0, 0, 388, '无', '无封面');
INSERT INTO `book` VALUES (5538703856933, 0, '许炫明', '60', 0, ';r出版社', '《hO[Q》', '2022-10-17 12:35:16', 0, 0, 14, '无', '无封面');
INSERT INTO `book` VALUES (6453489639729, 0, '彭远航', '99', 0, '6[出版社', '《=abMZ》', '2022-10-17 12:35:16', 0, 0, 763, '无', '无封面');
INSERT INTO `book` VALUES (6568484619296, 0, '王嘉熙', '49', 0, 'Uhn出版社', '《2h]》', '2022-10-17 12:35:16', 0, 0, 43, '无', '无封面');
INSERT INTO `book` VALUES (6732078072241, 0, '梁子涵', '43', 0, 'nX出版社', '《mrhq》', '2022-10-17 12:35:16', 0, 0, 581, '无', '无封面');
INSERT INTO `book` VALUES (6800591041525, 0, '龚晟睿', '430', 0, 'Cq出版社', '《p2>》', '2022-10-17 12:35:16', 0, 0, 543, '无', '无封面');
INSERT INTO `book` VALUES (6814731827308, 0, '蔡俊驰', '85', 0, 'kl出版社', '《aEh8》', '2022-10-17 12:35:16', 0, 0, 298, '无', '无封面');
INSERT INTO `book` VALUES (7399465868142, 0, '段明辉', '93', 0, 'B0出版社', '《8Uq》', '2022-10-17 12:35:16', 0, 0, 145, '无', '无封面');
INSERT INTO `book` VALUES (9122671928351, 0, '高胤祥', '13', 0, '3h6出版社', '《Xl9》', '2022-10-17 12:35:16', 0, 0, 177, '无', '无封面');
INSERT INTO `book` VALUES (9153605901176, 0, '雷思源', '383', 0, 'D]出版社', '《dqf》', '2022-10-17 12:35:16', 0, 0, 52, '无', '无封面');
INSERT INTO `book` VALUES (9551457593558, 0, '孟思远', '71', 0, 'ko出版社', '《UIP》', '2022-10-17 12:35:16', 0, 0, 593, '无', '无封面');

-- ----------------------------
-- Table structure for borrow_record
-- ----------------------------
DROP TABLE IF EXISTS `borrow_record`;
CREATE TABLE `borrow_record`  (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `book_id` bigint NOT NULL COMMENT '图书id',
  `borrow_time` datetime NOT NULL COMMENT '借书时间',
  `return_time` bigint NOT NULL COMMENT '还书时间',
  PRIMARY KEY (`user_id`, `book_id`) USING BTREE,
  INDEX `book_id`(`book_id` ASC) USING BTREE,
  CONSTRAINT `borrow_record_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `borrow_record_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `borrow_record_chk_1` CHECK (`return_time` > `borrow_time`)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '借书记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_record
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '无' COMMENT '评论内容',
  `user_id` bigint NOT NULL COMMENT '评论用户id',
  `likes` bigint NULL DEFAULT 0 COMMENT '点赞数',
  `dislikes` bigint NULL DEFAULT 0 COMMENT '踩数',
  `book_id` bigint NOT NULL COMMENT '书id',
  PRIMARY KEY (`user_id`, `book_id`) USING BTREE,
  INDEX `book_id`(`book_id` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `book_id` bigint NOT NULL COMMENT '收藏书id',
  `user_id` bigint NOT NULL COMMENT '收藏人id',
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏url',
  PRIMARY KEY (`book_id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收藏夹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456789' COMMENT '密码',
  `gender` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未知' COMMENT '用户性别',
  `phone_number` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `borrow_number` int NULL DEFAULT 0 COMMENT '借阅数',
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未填写' COMMENT '邮箱',
  `avatar_pic` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `balance` decimal(10, 0) NULL DEFAULT 0 COMMENT '余额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('崔鸿涛', 17880743871, '123456789', '女', '54426531943', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('张健雄', 691799090120, '123456789', '男', '86859642139', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('梁浩', 728943100764, '123456789', '女', '75434465291', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('贾天磊', 1038515891250, '123456789', '男', '71407092730', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('孟致远', 1152393901749, '123456789', '男', '94188578036', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('孔博超', 2218201562986, '123456789', '男', '34584340385', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('邓航', 2414576989729, '123456789', '女', '33169371940', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('黄煜祺', 2626588727771, '123456789', '女', '28154025407', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('蒋立轩', 3175171457007, '123456789', '男', '28473871977', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('尹鹏煊', 3535236915067, '123456789', '女', '14146423077', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('许健柏', 4402748368719, '123456789', '男', '11406289405', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('尹果', 4779495281701, '123456789', '女', '81962105962', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('金立诚', 4944281598442, '123456789', '男', '44900851494', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('彭鑫鹏', 6279649625417, '123456789', '男', '97686523081', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('马航', 6649671878969, '123456789', '男', '24152522970', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('梁远航', 7159506877880, '123456789', '男', '85860578870', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('戴煜祺', 7330179135905, '123456789', '男', '91074096321', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('余展鹏', 7424864919009, '123456789', '男', '15679025159', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('武哲瀚', 8020743140876, '123456789', '男', '76414464583', 0, '未填写', NULL, 0);
INSERT INTO `user` VALUES ('苏思源', 8576028946099, '123456789', '女', '35507757246', 0, '未填写', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
