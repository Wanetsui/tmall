# Host: localhost  (Version: 5.5.5-10.1.30-MariaDB)
# Date: 2018-02-25 21:06:11
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `recommend` int(11) NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "category"
#


#
# Structure for table "config"
#

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `rate` int(11) NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "config"
#

INSERT INTO `config` VALUES (1,'website_name','网站名称','小小商城',100,NULL),(2,'index_description','首页描述','小小商城是我的一个非常小巧轻便的商城系统',50,NULL),(3,'index_keyword','首页关键词','小小商城,商超系统',25,NULL),(4,'index_title','首页标题','小小商城——基于Java的商城项目实践',12,NULL),(5,'path_product_img','产品图片存放目录','pictures/product/',6,NULL),(6,'path_category_img','分类图片存放目录','pictures/category/',5,NULL);

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `subTitle` varchar(255) NOT NULL DEFAULT '',
  `originalPrice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `nowPrice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `stock` int(11) unsigned NOT NULL DEFAULT '0',
  `imgid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `commentCount` int(11) unsigned NOT NULL DEFAULT '0',
  `saleCount` int(11) unsigned NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`),
  KEY `fk_product_product_image` (`imgid`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "product"
#


#
# Structure for table "product_image"
#

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_image` (`pid`),
  CONSTRAINT `fk_product_image` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "product_image"
#


#
# Structure for table "property"
#

DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`cid`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "property"
#


#
# Structure for table "property_value"
#

DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_value_property` (`ptid`),
  KEY `fk_property_value_product` (`pid`),
  CONSTRAINT `fk_property_value_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "property_value"
#


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `group_` varchar(255) NOT NULL DEFAULT 'user',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'admin','3acf16259def65456fc2a68ab5e10d96','superAdmin',NULL);

#
# Structure for table "order_"
#

DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `orderCode` varchar(255) NOT NULL DEFAULT '',
  `sum` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `totalNumber` int(11) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT '',
  `post` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `userMessage` varchar(255) DEFAULT '',
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `deliverDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "order_"
#


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `content` text,
  `createDate` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_product` (`pid`),
  KEY `fk_comment_user` (`uid`),
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#


#
# Structure for table "orderitem"
#

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `cmid` int(11) DEFAULT NULL,
  `number` int(11) unsigned NOT NULL DEFAULT '0',
  `sum` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_product` (`pid`),
  KEY `fk_orderitem_order` (`oid`),
  KEY `fk_orderitem_comment` (`cmid`),
  CONSTRAINT `fk_orderitem_comment` FOREIGN KEY (`cmid`) REFERENCES `comment` (`id`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "orderitem"
#


#
# Structure for table "cartitem"
#

DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `sum` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartitem_product` (`pid`),
  KEY `fk_cartitem_user` (`uid`),
  CONSTRAINT `fk_cartitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cartitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cartitem"
#

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `recommend` int(11) NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `subTitle` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `stock` int(11) unsigned NOT NULL DEFAULT '0',
  `imgid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `saleCount` int(11) unsigned NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_type` (`cid`),
  KEY `fk_service_service_image` (`imgid`),
  CONSTRAINT `fk_service_type` FOREIGN KEY (`cid`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `service_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_image` (`pid`),
  CONSTRAINT `fk_service_image` FOREIGN KEY (`pid`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `details_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `orderCode` varchar(255) NOT NULL DEFAULT '',
  `sum` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `totalNumber` int(11) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `userMessage` varchar(255) DEFAULT '',
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `deliverDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_details_user` (`uid`),
  CONSTRAINT `fk_details_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `detailsitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `number` int(11) unsigned NOT NULL DEFAULT '0',
  `sum` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detailsitem_service` (`pid`),
  KEY `fk_detailsitem_details_` (`oid`), 
  CONSTRAINT `fk_detailsitem_details_` FOREIGN KEY (`oid`) REFERENCES `details_` (`id`),
  CONSTRAINT `fk_detailsitem_service` FOREIGN KEY (`pid`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `sum` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_advance_service` (`pid`),
  KEY `fk_advance_user` (`uid`),
  CONSTRAINT `fk_advance_service` FOREIGN KEY (`pid`) REFERENCES `service` (`id`),
  CONSTRAINT `fk_advance_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `propertyService` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyService_type` (`cid`),
  CONSTRAINT `fk_propertyService_type` FOREIGN KEY (`cid`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `propertyService_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyService_value_propertyService` (`ptid`),
  KEY `fk_propertyService_value_service` (`pid`),
  CONSTRAINT `fk_propertyService_value_service` FOREIGN KEY (`pid`) REFERENCES `service` (`id`),
  CONSTRAINT `fk_propertyService_value_propertyService` FOREIGN KEY (`ptid`) REFERENCES `propertyService` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;