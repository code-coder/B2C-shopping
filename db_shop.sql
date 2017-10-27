
CREATE Database db_shop;
USE db_shop;
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : db_shop

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-10-27 10:51:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` varchar(30) NOT NULL,
  `balance` float DEFAULT '0',
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('11', '2258', '1234567');
INSERT INTO `account` VALUES ('201704261600000500046', '9420', '123456');
INSERT INTO `account` VALUES ('201705111625490204127', '0', '123456');
INSERT INTO `account` VALUES ('201705131835410799323', '9516', '123456');

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `subtitle` varchar(50) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`),
  CONSTRAINT `ads_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `productinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ads
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` varchar(30) NOT NULL,
  `totalPrice` float DEFAULT '0',
  `itemAmount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('11', '4403', '2');
INSERT INTO `cart` VALUES ('201704261600000500046', '500', '1');
INSERT INTO `cart` VALUES ('201705111625490204127', '0', '0');
INSERT INTO `cart` VALUES ('201705131835410799323', '250', '1');

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `amount` int(11) DEFAULT '0',
  `price` float DEFAULT '0',
  `cartId` varchar(30) DEFAULT NULL,
  `joinTime` datetime(6) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0在购物车 1已经购买 2移除购物车',
  PRIMARY KEY (`id`),
  KEY `FK_productinfo_cartitem` (`productId`),
  KEY `FK_cart_cartitem` (`cartId`),
  CONSTRAINT `FK_productinfo_cartitem` FOREIGN KEY (`productId`) REFERENCES `productinfo` (`id`),
  CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('1', '3', '1', '228', '11', '2017-05-10 21:50:52.000000', null);
INSERT INTO `cartitem` VALUES ('2', '5', '1', '4175', '11', '2017-05-10 21:56:16.000000', null);
INSERT INTO `cartitem` VALUES ('3', '1', '1', '250', '201705131835410799323', '2017-05-13 18:36:01.000000', null);
INSERT INTO `cartitem` VALUES ('4', '1', '2', '500', '201704261600000500046', '2017-05-14 11:28:27.000000', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `updateTime` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '野营/旅行', null, null);
INSERT INTO `category` VALUES ('2', '户外男装', '2017-04-17 19:21:04.000000', null);
INSERT INTO `category` VALUES ('3', '女装/童装', '2017-04-17 19:21:29.000000', null);
INSERT INTO `category` VALUES ('4', '鞋袜类', '2017-04-17 19:21:51.000000', null);
INSERT INTO `category` VALUES ('5', '登山/攀岩', '2017-04-17 19:22:10.000000', null);
INSERT INTO `category` VALUES ('6', '工具/仪器', '2017-04-17 19:22:26.000000', null);
INSERT INTO `category` VALUES ('7', '自驾/自行车', '2017-04-17 19:22:41.000000', null);
INSERT INTO `category` VALUES ('8', '滑雪/水上', '2017-04-17 19:22:57.000000', null);

-- ----------------------------
-- Table structure for consultation
-- ----------------------------
DROP TABLE IF EXISTS `consultation`;
CREATE TABLE `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultingTime` datetime(6) DEFAULT NULL,
  `details` text,
  `answeringTime` datetime(6) DEFAULT NULL,
  `answer` text,
  `answered` int(1) DEFAULT '0',
  `showed` int(1) DEFAULT '0',
  `customerId` varchar(30) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_customer_consultation` (`customerId`),
  KEY `FK_product_consultation` (`productId`),
  CONSTRAINT `FK_product_consultation` FOREIGN KEY (`productId`) REFERENCES `productinfo` (`id`),
  CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consultation
-- ----------------------------
INSERT INTO `consultation` VALUES ('1', '2017-05-13 18:49:43.000000', '这个挺好的', '2017-05-13 18:56:07.000000', '感谢光临！欢迎下次再来', '1', '1', '11', '1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `balance` float DEFAULT '0',
  `forbidden` int(1) DEFAULT '0',
  `accountId` varchar(21) NOT NULL,
  `cartId` varchar(21) NOT NULL,
  `headPortraitId` varchar(21) NOT NULL,
  `lastLogin` datetime(6) DEFAULT NULL,
  `registerTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `cartId` (`cartId`),
  UNIQUE KEY `cartId_2` (`cartId`),
  UNIQUE KEY `accountId` (`accountId`),
  UNIQUE KEY `headPortrait` (`headPortraitId`),
  KEY `FK_customer_cart` (`cartId`),
  KEY `FK_customer_account` (`accountId`),
  KEY `FK_customer_headPortrait` (`headPortraitId`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`headPortraitId`) REFERENCES `headportrait` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('11', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin', '男', '重庆', 'admin@sina.com', '139xxxx8888', '2258', '0', '11', '11', '11', '2017-05-13 13:18:29.000000', '2017-04-26 15:07:51.000000');
INSERT INTO `customer` VALUES ('201704261600000500046', '张豆豆来了', 'E10ADC3949BA59ABBE56E057F20F883E', '张林', '保密', '重庆', '123@qq.com', null, '9420', '0', '201704261600000500046', '201704261600000500046', '201704261600000500046', '2017-05-23 20:10:05.000000', '2017-04-26 16:00:00.000000');
INSERT INTO `customer` VALUES ('201705111625490204127', 'yanyi', 'E10ADC3949BA59ABBE56E057F20F883E', null, '保密', null, '71114@qq.com', null, '0', '0', '201705111625490204127', '201705111625490204127', '201705111625490204127', '2017-05-11 16:25:51.000000', '2017-05-11 16:25:49.000000');
INSERT INTO `customer` VALUES ('201705131835410799323', '我叫张林', 'E10ADC3949BA59ABBE56E057F20F883E', '张林', '男', '重庆', '123@qq.com', null, '9516', '0', '201705131835410799323', '201705131835410799323', '201705131835410799323', '2017-05-13 18:35:44.000000', '2017-05-13 18:35:41.000000');

-- ----------------------------
-- Table structure for headportrait
-- ----------------------------
DROP TABLE IF EXISTS `headportrait`;
CREATE TABLE `headportrait` (
  `id` varchar(30) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `updateTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of headportrait
-- ----------------------------
INSERT INTO `headportrait` VALUES ('11', '201704251932070770.jpg', '2017-05-06 16:02:04.000000');
INSERT INTO `headportrait` VALUES ('201704261600000500046', 'default.jpg', '2017-04-26 16:00:00.000000');
INSERT INTO `headportrait` VALUES ('201705111625490204127', 'default.jpg', '2017-05-11 16:25:49.000000');
INSERT INTO `headportrait` VALUES ('201705131835410799323', 'default.jpg', '2017-05-13 18:35:41.000000');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastLongin` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', 'admin', null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` varchar(30) NOT NULL,
  `totalPrice` float(12,2) DEFAULT NULL,
  `itemAmount` int(11) DEFAULT NULL,
  `createTime` datetime(6) DEFAULT NULL,
  `orderState` varchar(10) DEFAULT NULL,
  `consignee` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL,
  `customerId` varchar(30) DEFAULT NULL,
  `payTime` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`orderId`),
  KEY `FK_customer_order` (`customerId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('201703261032410896', '228.00', '1', '2017-03-26 10:32:41.000000', '已付款', '张三', '水电费是否', '52352', '12345678911', '11', '2017-04-23 21:03:38.000000');
INSERT INTO `order` VALUES ('201703271412370014', '595.00', '1', '2017-03-27 14:12:37.000000', '已付款', '赵四', '北京', '123', '123', '11', '2017-04-23 21:03:42.000000');
INSERT INTO `order` VALUES ('201703271840520919', '80.00', '1', '2017-03-27 18:40:52.000000', '未付款', '赵四', '北京', '123', '123', '11', '2017-05-06 16:34:52.000000');
INSERT INTO `order` VALUES ('201703271859140736', '228.00', '1', '2017-03-27 18:59:14.000000', '未付款', '李四', '康定路西康路', '54221', '5121215123', '11', '2017-05-06 16:35:11.000000');
INSERT INTO `order` VALUES ('201703280958290654', '4360.00', '2', '2017-03-28 09:58:29.000000', '已付款', '赵四', '北京', '123', '123', '11', '2017-04-23 21:03:52.000000');
INSERT INTO `order` VALUES ('201703281027260811', '228.00', '1', '2017-03-28 10:27:26.000000', '已付款', '张三', '水电费是否', '52352', '12345678911', '11', '2017-04-23 21:03:55.000000');
INSERT INTO `order` VALUES ('201704031710430441', '127.00', '1', '2017-04-03 17:10:43.000000', '已付款', '赵四', '北京', '123', '123', '11', '2017-04-23 21:04:37.000000');
INSERT INTO `order` VALUES ('201704051223470629', '242.00', '1', '2017-04-05 12:23:47.000000', '已付款', '李四', '康定路西康路', '54221', '5121215123', '11', '2017-04-23 21:04:40.000000');
INSERT INTO `order` VALUES ('201704051224400722', '126.00', '1', '2017-04-05 12:24:40.000000', '未付款', '李四', '康定路西康路', '54221', '5121215123', '11', '2017-05-06 16:34:56.000000');
INSERT INTO `order` VALUES ('201704051224440311', '126.00', '1', '2017-04-05 12:24:44.000000', '未付款', '李四', '康定路西康路', '54221', '5121215123', '11', '2017-05-06 16:34:57.000000');
INSERT INTO `order` VALUES ('201704212010150289', '484.00', '1', '2017-04-21 20:10:15.000000', '已付款', '李四', '康定路西康路', '54221', '5121215123', '11', '2017-04-23 21:04:47.000000');
INSERT INTO `order` VALUES ('201704222026350994', '478.00', '2', '2017-04-22 20:26:35.000000', '已付款', '李四', '康定路西康路', '54221', '5121215123', '11', '2017-04-23 21:04:50.000000');
INSERT INTO `order` VALUES ('201704231858190235', '1000.00', '4', '2017-04-23 18:58:19.000000', '已付款', '李四', '康定路西康路', '54221', '5121215123', '11', '2017-04-23 21:04:53.000000');
INSERT INTO `order` VALUES ('201705101907070281', '250.00', '1', '2017-05-10 19:07:07.000000', '已付款', '张林', '重庆市西南大学', '666666', '18883340690', '201704261600000500046', '2017-05-10 19:07:13.000000');
INSERT INTO `order` VALUES ('201705102137540798', '250.00', '1', '2017-05-10 21:37:54.000000', '已付款', '秦嘉', '重庆西南大学', '5555', '123456', '201704261600000500046', '2017-05-10 21:38:05.000000');
INSERT INTO `order` VALUES ('201705131837170398', '484.00', '2', '2017-05-13 18:37:17.000000', '已付款', '张林', '重庆市西南大学', '6666', '123456', '201705131835410799323', '2017-05-13 18:38:01.000000');
INSERT INTO `order` VALUES ('201705141129480486', '80.00', '2', '2017-05-14 11:29:48.000000', '已付款', '秦嘉', '重庆西南大学', '5555', '123456', '201704261600000500046', '2017-05-14 11:30:20.000000');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `amount` int(11) DEFAULT '0',
  `price` float DEFAULT '0',
  `orderId` varchar(30) DEFAULT NULL,
  `grade` char(10) DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`id`),
  KEY `FK_order_orderitem` (`orderId`),
  KEY `FK_product_orderitem` (`productId`),
  CONSTRAINT `FK_order_orderitem` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  CONSTRAINT `FK_product_orderitem` FOREIGN KEY (`productId`) REFERENCES `productinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '3', '1', '228', '201703261032410896', null);
INSERT INTO `orderitem` VALUES ('2', '7', '1', '595', '201703271412370014', null);
INSERT INTO `orderitem` VALUES ('3', '11', '1', '80', '201703271840520919', null);
INSERT INTO `orderitem` VALUES ('4', '3', '1', '228', '201703271859140736', null);
INSERT INTO `orderitem` VALUES ('5', '6', '1', '185', '201703280958290654', null);
INSERT INTO `orderitem` VALUES ('6', '5', '1', '4175', '201703280958290654', null);
INSERT INTO `orderitem` VALUES ('7', '3', '1', '228', '201703281027260811', null);
INSERT INTO `orderitem` VALUES ('8', '8', '1', '127', '201704031710430441', null);
INSERT INTO `orderitem` VALUES ('9', '2', '1', '242', '201704051223470629', null);
INSERT INTO `orderitem` VALUES ('10', '10', '1', '126', '201704051224400722', null);
INSERT INTO `orderitem` VALUES ('11', '10', '1', '126', '201704051224440311', null);
INSERT INTO `orderitem` VALUES ('12', '2', '2', '484', '201704212010150289', null);
INSERT INTO `orderitem` VALUES ('13', '3', '1', '228', '201704222026350994', null);
INSERT INTO `orderitem` VALUES ('14', '1', '1', '250', '201704222026350994', null);
INSERT INTO `orderitem` VALUES ('15', '1', '4', '1000', '201704231858190235', null);
INSERT INTO `orderitem` VALUES ('16', '1', '1', '250', '201705101907070281', null);
INSERT INTO `orderitem` VALUES ('17', '1', '1', '250', '201705102137540798', null);
INSERT INTO `orderitem` VALUES ('18', '2', '2', '484', '201705131837170398', null);
INSERT INTO `orderitem` VALUES ('19', '12', '2', '80', '201705141129480486', null);

-- ----------------------------
-- Table structure for productattr
-- ----------------------------
DROP TABLE IF EXISTS `productattr`;
CREATE TABLE `productattr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`),
  CONSTRAINT `productattr_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `productinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productattr
-- ----------------------------

-- ----------------------------
-- Table structure for productcategory
-- ----------------------------
DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parentid` int(11) NOT NULL,
  `updateTime` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `secondcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productcategory
-- ----------------------------
INSERT INTO `productcategory` VALUES ('1', '大型背包', '1', null);
INSERT INTO `productcategory` VALUES ('2', '中型背包', '1', null);
INSERT INTO `productcategory` VALUES ('3', '小型背包', '1', null);
INSERT INTO `productcategory` VALUES ('6', '户外商务包', '1', null);
INSERT INTO `productcategory` VALUES ('7', '高山帐篷', '2', null);
INSERT INTO `productcategory` VALUES ('8', '野营帐篷', '2', null);
INSERT INTO `productcategory` VALUES ('10', '冲锋衣', '6', '2017-05-08 16:45:53.000000');
INSERT INTO `productcategory` VALUES ('11', '冲锋衣两件套', '6', '2017-05-08 16:46:04.000000');
INSERT INTO `productcategory` VALUES ('12', '冲锋裤', '6', '2017-05-08 16:46:17.000000');
INSERT INTO `productcategory` VALUES ('13', '防风抓绒衣', '7', '2017-05-08 16:46:51.000000');
INSERT INTO `productcategory` VALUES ('14', '非防风抓绒衣', '7', '2017-05-08 16:47:00.000000');
INSERT INTO `productcategory` VALUES ('15', '抓绒马甲', '7', '2017-05-08 16:47:11.000000');
INSERT INTO `productcategory` VALUES ('16', '长袖速干衣', '8', '2017-05-08 16:47:34.000000');
INSERT INTO `productcategory` VALUES ('17', '短袖速干衣', '8', '2017-05-08 16:47:41.000000');
INSERT INTO `productcategory` VALUES ('18', '软壳衣', '9', '2017-05-08 16:47:56.000000');
INSERT INTO `productcategory` VALUES ('19', '软壳库', '9', '2017-05-08 16:48:00.000000');
INSERT INTO `productcategory` VALUES ('20', '羽绒服', '10', '2017-05-08 17:11:52.000000');
INSERT INTO `productcategory` VALUES ('21', '羽绒马甲', '10', '2017-05-08 17:12:01.000000');
INSERT INTO `productcategory` VALUES ('22', '羽绒裤', '10', '2017-05-08 17:12:08.000000');
INSERT INTO `productcategory` VALUES ('23', '棉服', '10', '2017-05-08 17:12:19.000000');
INSERT INTO `productcategory` VALUES ('24', '棉裤', '10', '2017-05-08 17:12:24.000000');
INSERT INTO `productcategory` VALUES ('25', '休闲外套', '11', '2017-05-08 17:12:51.000000');
INSERT INTO `productcategory` VALUES ('26', '衬衫', '11', '2017-05-08 17:12:58.000000');
INSERT INTO `productcategory` VALUES ('27', '卫衣', '11', '2017-05-08 17:13:04.000000');
INSERT INTO `productcategory` VALUES ('28', '毛衣', '11', '2017-05-08 17:13:08.000000');
INSERT INTO `productcategory` VALUES ('29', '单层靴', '12', '2017-05-08 17:15:20.000000');
INSERT INTO `productcategory` VALUES ('30', '双层靴', '12', '2017-05-08 17:15:27.000000');
INSERT INTO `productcategory` VALUES ('31', '中高防水登山鞋', '13', '2017-05-08 17:16:01.000000');
INSERT INTO `productcategory` VALUES ('32', '低帮防水登山鞋', '13', '2017-05-08 17:16:15.000000');
INSERT INTO `productcategory` VALUES ('33', '非防水登山鞋', '13', '2017-05-08 17:16:26.000000');
INSERT INTO `productcategory` VALUES ('34', '越野跑鞋', '14', '2017-05-08 17:20:27.000000');
INSERT INTO `productcategory` VALUES ('35', '公路跑鞋', '14', '2017-05-08 17:20:37.000000');
INSERT INTO `productcategory` VALUES ('36', '攀岩鞋', '14', '2017-05-08 17:20:42.000000');
INSERT INTO `productcategory` VALUES ('37', '滑雪鞋', '14', '2017-05-08 17:20:48.000000');
INSERT INTO `productcategory` VALUES ('38', '主锁/快挂/连接器', '15', '2017-05-08 17:22:24.000000');
INSERT INTO `productcategory` VALUES ('39', '上升器/下降保护器/制动器', '15', '2017-05-08 17:25:23.000000');
INSERT INTO `productcategory` VALUES ('40', '冰镐', '16', '2017-05-08 17:25:39.000000');
INSERT INTO `productcategory` VALUES ('41', '冰爪', '16', '2017-05-08 17:25:44.000000');
INSERT INTO `productcategory` VALUES ('42', '冰锥', '16', '2017-05-08 17:25:50.000000');
INSERT INTO `productcategory` VALUES ('43', '踏雪板', '16', '2017-05-08 17:26:20.000000');
INSERT INTO `productcategory` VALUES ('44', '头盔', '17', '2017-05-08 17:26:40.000000');
INSERT INTO `productcategory` VALUES ('45', '安全带', '17', '2017-05-08 17:26:58.000000');
INSERT INTO `productcategory` VALUES ('46', '登山杖', '18', '2017-05-08 17:27:14.000000');
INSERT INTO `productcategory` VALUES ('47', '锹锯斧镐/组合工具', '19', '2017-05-08 17:28:58.000000');
INSERT INTO `productcategory` VALUES ('48', '打火机', '19', '2017-05-08 17:29:02.000000');
INSERT INTO `productcategory` VALUES ('49', '辅配件', '19', '2017-05-08 17:29:16.000000');
INSERT INTO `productcategory` VALUES ('50', '户外表', '20', '2017-05-08 17:29:25.000000');
INSERT INTO `productcategory` VALUES ('51', 'GPS', '20', '2017-05-08 17:29:28.000000');
INSERT INTO `productcategory` VALUES ('52', '望远镜', '20', '2017-05-08 17:29:39.000000');
INSERT INTO `productcategory` VALUES ('53', '烧烤用品', '21', '2017-05-08 17:30:15.000000');
INSERT INTO `productcategory` VALUES ('54', '户外厨房', '21', '2017-05-08 17:30:25.000000');
INSERT INTO `productcategory` VALUES ('55', '折叠床', '21', '2017-05-08 17:30:34.000000');
INSERT INTO `productcategory` VALUES ('56', '儿童安全座椅', '21', '2017-05-08 17:30:44.000000');
INSERT INTO `productcategory` VALUES ('57', '自行车', '22', '2017-05-08 17:30:56.000000');
INSERT INTO `productcategory` VALUES ('58', '骑行服装', '22', '2017-05-08 17:31:08.000000');
INSERT INTO `productcategory` VALUES ('59', '骑行包', '22', '2017-05-08 17:31:16.000000');
INSERT INTO `productcategory` VALUES ('60', '滑雪板/固定器/雪仗', '23', '2017-05-08 17:32:12.000000');
INSERT INTO `productcategory` VALUES ('61', '滑雪服装', '23', '2017-05-08 17:32:19.000000');
INSERT INTO `productcategory` VALUES ('62', '滑雪镜', '23', '2017-05-08 17:32:27.000000');
INSERT INTO `productcategory` VALUES ('63', '船/冲浪板', '24', '2017-05-08 17:32:56.000000');
INSERT INTO `productcategory` VALUES ('64', '水上服装', '24', '2017-05-08 17:33:06.000000');
INSERT INTO `productcategory` VALUES ('65', '救生圈', '24', '2017-05-08 17:33:15.000000');

-- ----------------------------
-- Table structure for productinfo
-- ----------------------------
DROP TABLE IF EXISTS `productinfo`;
CREATE TABLE `productinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `subname` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  `baseprice` float(12,2) NOT NULL,
  `sellprice` float(12,2) NOT NULL,
  `clickcount` int(11) DEFAULT '0',
  `soldcount` int(11) DEFAULT '0',
  `sellcount` int(11) NOT NULL DEFAULT '0',
  `productcategoryId` int(11) DEFAULT NULL,
  `sellTime` datetime(6) DEFAULT NULL,
  `sellOutTime` datetime(6) DEFAULT NULL,
  `star` float(2,1) DEFAULT '0.0',
  `homeIndex` int(3) DEFAULT '0',
  `isNew` int(1) DEFAULT '0',
  `isHot` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK28A6CDEC487D8DAB` (`productcategoryId`),
  CONSTRAINT `FK28A6CDEC487D8DAB` FOREIGN KEY (`productcategoryId`) REFERENCES `productcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productinfo
-- ----------------------------
INSERT INTO `productinfo` VALUES ('1', 'OSPREY Aether苍穹 60 男款登山背包', '11', '描述555555665, 描述55555566566', '300.99', '250.00', '17498', '2', '204', '1', '2017-05-08 19:53:46.000000', null, '5.0', '999', '0', '0');
INSERT INTO `productinfo` VALUES ('2', 'ARCTERYX/始祖鸟 女款旅行背包 Altra 62 LT Backback', '副标题2', '描述2', '300.01', '242.00', '12249', '10', '1001', '1', '2017-04-12 21:14:18.000000', null, '3.0', '999', '0', '0');
INSERT INTO `productinfo` VALUES ('3', 'ARCTERYX/始祖鸟 登山滑雪背包 Alpha FL 45L 13615', '副标题3', '描述3', '256.00', '228.00', '1255', '8', '801', '1', '2017-04-12 21:09:58.000000', null, '5.0', '999', '0', '0');
INSERT INTO `productinfo` VALUES ('4', 'SAMSTRONG/杉木山装 彩蝶挎包 22L B0100', '副标题4', '描述4', '5000.00', '3115.00', '12368', '5', '50', '1', '2017-05-05 12:09:58.000000', null, '4.0', '999', '0', '0');
INSERT INTO `productinfo` VALUES ('5', 'SAMSTRONG/杉木山装 猫头鹰儿童包 B0136', '副标题5', '描述5', '5000.00', '4175.00', '4563', '10', '1000', '1', '2017-04-12 21:09:58.000000', null, '4.5', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('6', 'SAMSTRONG/杉木山装 奥克兰腰包 B0164 ', '22', '描述6', '298.00', '185.00', '17370', '3', '200', '2', '2017-05-08 16:18:30.000000', null, '5.0', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('7', 'ARCTERYX/始祖鸟 男款背包 Bora AR 63 ', '副标题7', '描述7', '698.00', '595.00', '12239', '9', '900', '1', '2017-04-12 21:09:58.000000', null, '4.5', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('8', 'KAILAS/凯乐石 变色龙(Anole)背包 14L', '副标题8', '描述8', '198.00', '127.00', '1249', '7', '700', '1', '2017-04-12 21:09:58.000000', null, '5.0', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('9', 'SEA TO SUMMIT 替换带扣-梯扣1跟螺丝', '副标题9', '描述9', '698.00', '610.00', '12365', '5', '500', '1', '2017-04-12 21:09:58.000000', null, '2.5', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('10', 'KAILAS/凯乐石 挎包', '副标题10', '描述10', '198.00', '126.00', '4562', '9', '900', '1', '2017-04-12 21:09:58.000000', null, '1.0', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('11', 'ARCTERYX/始祖鸟 女款背包 Bora AR 61 ', '副标题11', '描述11', '98.00', '80.00', '17369', '2', '200', '1', '2017-04-12 21:09:58.000000', null, '1.5', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('12', 'THE NORTH FACE(北面) 多功能旅行登山背包 MATTHES CREST', '副标题12', '描述12', '98.00', '40.00', '12239', '8', '801', '1', '2017-04-12 21:09:58.000000', null, '2.0', '1', '0', '0');
INSERT INTO `productinfo` VALUES ('13', 'ANEMAQEN(阿尼玛卿) STAR FISH-海星 天幕/凉棚 AZ1207', '副标题13', '描述13', '98.00', '30.00', '1246', '6', '600', '8', '2017-04-12 21:09:58.000000', null, '2.5', '999', '0', '0');
INSERT INTO `productinfo` VALUES ('14', 'MSR 双层四人三季帐篷-Papa Hubba NX 02758', '副标题14', '描述14', '98.00', '80.00', '12365', '5', '500', '8', '2017-04-12 21:09:58.000000', null, '5.0', '999', '0', '0');

-- ----------------------------
-- Table structure for secondcategory
-- ----------------------------
DROP TABLE IF EXISTS `secondcategory`;
CREATE TABLE `secondcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parentid` int(11) NOT NULL,
  `updateTime` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `secondcategory_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secondcategory
-- ----------------------------
INSERT INTO `secondcategory` VALUES ('1', '背包', '1', null, null);
INSERT INTO `secondcategory` VALUES ('2', '帐篷', '1', '2017-04-17 20:40:38.000000', null);
INSERT INTO `secondcategory` VALUES ('6', '冲锋衣裤', '2', '2017-05-08 16:44:40.000000', null);
INSERT INTO `secondcategory` VALUES ('7', '抓绒衣裤', '2', '2017-05-08 16:44:56.000000', null);
INSERT INTO `secondcategory` VALUES ('8', '速干衣裤', '2', '2017-05-08 16:45:07.000000', null);
INSERT INTO `secondcategory` VALUES ('9', '软壳衣裤', '2', '2017-05-08 16:45:16.000000', null);
INSERT INTO `secondcategory` VALUES ('10', '保暖服装', '2', '2017-05-08 16:45:28.000000', null);
INSERT INTO `secondcategory` VALUES ('11', '休闲服装', '2', '2017-05-08 16:45:33.000000', null);
INSERT INTO `secondcategory` VALUES ('12', '高山靴', '4', '2017-05-08 17:19:38.000000', null);
INSERT INTO `secondcategory` VALUES ('13', '登山鞋', '4', '2017-05-08 17:19:52.000000', null);
INSERT INTO `secondcategory` VALUES ('14', '专项运动鞋', '4', '2017-05-08 17:20:06.000000', null);
INSERT INTO `secondcategory` VALUES ('15', '攀登器材', '5', '2017-05-08 17:21:33.000000', null);
INSERT INTO `secondcategory` VALUES ('16', '冰雪器材', '5', '2017-05-08 17:21:40.000000', null);
INSERT INTO `secondcategory` VALUES ('17', '头盔/安全', '5', '2017-05-08 17:21:49.000000', null);
INSERT INTO `secondcategory` VALUES ('18', '登山杖', '5', '2017-05-08 17:21:59.000000', null);
INSERT INTO `secondcategory` VALUES ('19', '工具', '6', '2017-05-08 17:27:47.000000', null);
INSERT INTO `secondcategory` VALUES ('20', '仪器', '6', '2017-05-08 17:27:51.000000', null);
INSERT INTO `secondcategory` VALUES ('21', '自驾车', '7', '2017-05-08 17:30:00.000000', null);
INSERT INTO `secondcategory` VALUES ('22', '自行车', '7', '2017-05-08 17:30:05.000000', null);
INSERT INTO `secondcategory` VALUES ('23', '滑雪', '8', '2017-05-08 17:31:38.000000', null);
INSERT INTO `secondcategory` VALUES ('24', '水上运动', '8', '2017-05-08 17:31:43.000000', null);

-- ----------------------------
-- Table structure for shoppingaddress
-- ----------------------------
DROP TABLE IF EXISTS `shoppingaddress`;
CREATE TABLE `shoppingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consignee` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `mobile` varchar(11) NOT NULL,
  `isDefault` int(1) DEFAULT '0',
  `customerId` varchar(30) DEFAULT NULL,
  `updateTime` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_customer_shoppingAddress` (`customerId`),
  CONSTRAINT `shoppingaddress_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingaddress
-- ----------------------------
INSERT INTO `shoppingaddress` VALUES ('1', '张三', '水电费是否', '1556', '12345678911', '0', '11', null);
INSERT INTO `shoppingaddress` VALUES ('6', '王二', '山东', '123452', '123452', '0', '11', null);
INSERT INTO `shoppingaddress` VALUES ('7', '赵四', '北京', '1236', '1234572', '1', '11', null);
INSERT INTO `shoppingaddress` VALUES ('14', '张林', '重庆市西南大学', '666666', '18883340690', '0', '201704261600000500046', null);
INSERT INTO `shoppingaddress` VALUES ('15', '秦嘉', '重庆西南大学', '5555', '123456', '0', '201704261600000500046', null);
INSERT INTO `shoppingaddress` VALUES ('16', '张林', '重庆市西南大学', '6666', '123456', '1', '201705131835410799323', null);
INSERT INTO `shoppingaddress` VALUES ('17', '张林', '123', '123', '123', '0', '201704261600000500046', null);
INSERT INTO `shoppingaddress` VALUES ('18', '测试', '123', '123', '123', '0', '201704261600000500046', null);
INSERT INTO `shoppingaddress` VALUES ('19', '是', '123', '123', '132', '1', '201704261600000500046', null);

-- ----------------------------
-- Table structure for tradingitem
-- ----------------------------
DROP TABLE IF EXISTS `tradingitem`;
CREATE TABLE `tradingitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` float DEFAULT NULL,
  `tradingTime` datetime DEFAULT NULL,
  `tradingDetails` varchar(50) DEFAULT NULL,
  `accountId` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_account_tradingitem` (`accountId`),
  CONSTRAINT `tradingitem_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tradingitem
-- ----------------------------
INSERT INTO `tradingitem` VALUES ('1', '10000', '2017-03-26 10:34:06', '充值', '11', null, null);
INSERT INTO `tradingitem` VALUES ('2', '-228', '2017-03-26 10:34:43', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('3', '-595', '2017-03-27 14:12:47', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('4', '-4360', '2017-03-28 09:58:53', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('5', '-228', '2017-03-28 10:27:33', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('6', '-127', '2017-04-03 17:46:31', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('7', '-242', '2017-04-05 12:23:53', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('8', '-484', '2017-04-21 20:10:28', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('9', '-478', '2017-04-22 20:27:08', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('10', '-1000', '2017-04-23 18:58:29', '购买商品', '11', null, null);
INSERT INTO `tradingitem` VALUES ('11', '10000', '2017-05-06 16:27:25', '充值', '201704261600000500046', null, null);
INSERT INTO `tradingitem` VALUES ('12', '-250', '2017-05-10 19:07:13', '购买商品', '201704261600000500046', null, null);
INSERT INTO `tradingitem` VALUES ('13', '-250', '2017-05-10 21:38:05', '购买商品', '201704261600000500046', null, null);
INSERT INTO `tradingitem` VALUES ('14', '10000', '2017-05-13 18:37:38', '充值', '201705131835410799323', null, null);
INSERT INTO `tradingitem` VALUES ('15', '-484', '2017-05-13 18:38:01', '购买商品', '201705131835410799323', null, null);
INSERT INTO `tradingitem` VALUES ('16', '-80', '2017-05-14 11:30:20', '购买商品', '201704261600000500046', null, null);

-- ----------------------------
-- Table structure for uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `uploadTime` datetime(6) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `iscover` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`),
  CONSTRAINT `uploadfile_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `productinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadfile
-- ----------------------------
INSERT INTO `uploadfile` VALUES ('1', 'packsack1.jpg', '2017-05-06 16:01:45.000000', '1', null, '1');
INSERT INTO `uploadfile` VALUES ('2', 'packsack2.jpg', '2017-05-06 16:01:42.000000', '2', null, '1');
INSERT INTO `uploadfile` VALUES ('3', 'packsack3.jpg', '2017-05-06 16:01:37.000000', '3', null, '1');
INSERT INTO `uploadfile` VALUES ('4', 'packsack4.jpg', '2017-05-06 16:01:34.000000', '4', null, '1');
INSERT INTO `uploadfile` VALUES ('5', 'packsack5.jpg', '2017-05-06 16:01:32.000000', '5', null, '1');
INSERT INTO `uploadfile` VALUES ('6', 'packsack6.jpg', '2017-05-06 16:01:28.000000', '6', null, '1');
INSERT INTO `uploadfile` VALUES ('7', 'packsack7.jpg', '2017-05-06 16:01:26.000000', '7', null, '1');
INSERT INTO `uploadfile` VALUES ('8', 'packsack8.jpg', '2017-05-06 16:01:22.000000', '8', null, '1');
INSERT INTO `uploadfile` VALUES ('9', 'packsack9.jpg', '2017-05-06 16:01:19.000000', '9', null, '1');
INSERT INTO `uploadfile` VALUES ('10', 'packsack10.jpg', '2017-05-06 16:01:15.000000', '10', null, '1');
INSERT INTO `uploadfile` VALUES ('11', 'packsack11.jpg', '2017-05-06 16:01:12.000000', '11', null, '1');
INSERT INTO `uploadfile` VALUES ('12', 'packsack12.jpg', '2017-05-06 16:01:09.000000', '12', null, '1');
INSERT INTO `uploadfile` VALUES ('13', 'tent1.jpg', '2017-05-06 16:01:06.000000', '13', null, '1');
INSERT INTO `uploadfile` VALUES ('14', 'tent2.jpg', '2017-05-06 16:01:02.000000', '14', null, '1');
INSERT INTO `uploadfile` VALUES ('15', 'packsack2.jpg', '2017-04-23 14:59:39.000000', '1', null, '0');
INSERT INTO `uploadfile` VALUES ('16', 'packsack3.jpg', '2017-04-23 14:59:51.000000', '1', null, '0');
INSERT INTO `uploadfile` VALUES ('17', 'packsack4.jpg', '2017-04-23 15:00:16.000000', '1', null, '0');
SET FOREIGN_KEY_CHECKS=1;
