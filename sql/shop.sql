-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-10-24 20:47:48
-- 服务器版本： 5.5.56-log
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL COMMENT 'id',
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT '商品id',
  `checked` int(11) NOT NULL COMMENT '是否选择，1-已勾选，2-未勾选',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父亲别id，0为根节点',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类别状态，1-正常，2-已废弃',
  `sort_order` int(4) DEFAULT NULL COMMENT '排序编号，同类展示顺序，数值相等则自然排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `status`, `sort_order`, `create_time`, `update_time`) VALUES
(100001, 0, '家用电器', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100002, 0, '数码3C', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100003, 0, '服装箱包', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100004, 0, '食品生鲜', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100005, 0, '酒水饮料', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100006, 100001, '冰箱', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100007, 100001, '电视', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100008, 100001, '洗衣机', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100009, 100001, '空调', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100010, 100001, '电热水器', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100011, 100002, '电脑', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100012, 100002, '手机', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100013, 100002, '平板电脑', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100014, 100002, '数码相机', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100015, 100002, '3C配件', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100016, 100003, '女装', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100017, 100003, '帽子', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100018, 100003, '旅行箱', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100019, 100003, '手提包', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100020, 100003, '保暖内衣', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100021, 100004, '零食', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100022, 100004, '生鲜', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100023, 100004, '半成品菜', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100024, 100004, '速冻食品', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100025, 100004, '进口食品', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100026, 100005, '白酒', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100027, 100005, '红酒', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100028, 100005, '饮料', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100029, 100005, '调制鸡尾酒', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100030, 100005, '进口洋酒', 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '订单id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `shipping_id` int(11) DEFAULT NULL COMMENT '订单地址',
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实际支付金额，单位元',
  `payment_type` int(4) DEFAULT NULL COMMENT '支付类型，1-在线支付',
  `postage` int(10) DEFAULT NULL COMMENT '运费，单位元',
  `status` int(10) DEFAULT NULL COMMENT '订单状态，0-已取消，10-未付款，20-已付款，40-已发货，50-交易成功，60-交易取消',
  `payment_creation_time` datetime NOT NULL COMMENT '交易创建时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL COMMENT '订单子表id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20,2) DEFAULT NULL COMMENT '生成订单商品单价',
  `quantity` int(10) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '商品总价',
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- --------------------------------------------------------

--
-- 表的结构 `pay_info`
--

CREATE TABLE `pay_info` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '订单号',
  `order_no` bigint(20) NOT NULL COMMENT '支付平台，1-支付宝，2-微信',
  `pay_platform` int(10) NOT NULL COMMENT '支付宝支付流水号',
  `platform_number` varchar(20) NOT NULL COMMENT '支付宝支付状态',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付信息表';

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id',
  `category_id` int(11) NOT NULL COMMENT '分类id，对应category表的主键',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) NOT NULL COMMENT '商品副标题',
  `main_image` varchar(500) NOT NULL COMMENT '产品主图，url相对地址',
  `sub_iamges` text NOT NULL COMMENT '图片地址，json格式，扩展用',
  `detail` text NOT NULL COMMENT '商品详情',
  `price` decimal(20,2) NOT NULL COMMENT '价格。单位元',
  `stock` int(11) NOT NULL COMMENT '库存数量',
  `status` int(6) NOT NULL DEFAULT '1' COMMENT '商品数量，1-在售，2-下架，3-删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `subtitle`, `main_image`, `sub_iamges`, `detail`, `price`, `stock`, `status`, `create_time`, `update_time`) VALUES
(1, 100012, '【测试学习使用】4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'http://img.happymmall.com/0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', 'http://img.happymmall.com/0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg,http://img.happymmall.com/13da2172-4445-4eb5-a13f-c5d4ede8458c.jpeg,http://img.happymmall.com/58d5d4b7-58d4-4948-81b6-2bae4f79bf02.jpeg', '<div class=\"detail-con\"> <p><b>这是一个非常流弊的华为手机！！</b></p><p><img alt=\"11TB2fKK3cl0kpuFjSsziXXa.oVXa_!!1777180618.jpg\" src=\"http://img.happymmall.com/5c2d1c6d-9e09-48ce-bbdb-e833b42ff664.jpg\" width=\"790\" height=\"966\"><img alt=\"22TB2YP3AkEhnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.happymmall.com/9a10b877-818f-4a27-b6f7-62887f3fb39d.jpg\" width=\"790\" height=\"1344\"><img alt=\"33TB2Yyshk.hnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.happymmall.com/7d7fbd69-a3cb-4efe-8765-423bf8276e3e.jpg\" width=\"790\" height=\"700\"><img alt=\"TB2diyziB8kpuFjSspeXXc7IpXa_!!1777180618.jpg\" src=\"http://img.happymmall.com/1d7160d2-9dba-422f-b2a0-e92847ba6ce9.jpg\" width=\"790\" height=\"393\"><br></p> </div>', '1999.00', 7417, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 100012, '【测试学习使用】【特卖】魅族 魅蓝E2 4GB+64GB 全网通公开版 香槟金 移动联通电信4G手机 双卡双待', 'P20芯片！5.5英寸！800+1300W像素！3400mAh大电池！', 'http://img.happymmall.com/7d71fc85-1d6a-4613-b9b7-c8956d8a38d5.jpg', 'http://img.happymmall.com/7d71fc85-1d6a-4613-b9b7-c8956d8a38d5.jpg,http://img.happymmall.com/8303031b-3f51-44af-b968-36bb05d25693.jpg,http://img.happymmall.com/0ebdac09-4091-4019-9b88-968dfb2f5c46.jpg,http://img.happymmall.com/57aaa094-4b4e-4267-8c86-2464d591f99d.jpg', '<div class=\"detail-con\"> <p><b>魅族 魅蓝E2 4GB+64GB 全网通公开版 香槟金 移动联通电信4G手机 双卡双待</b><br></p><p><b><img alt=\"e2-4.jpg\" src=\"http://img.happymmall.com/aa82d221-0abe-41e5-9ff5-b6f7253595ff.jpg\" width=\"750\" height=\"834\"><br></b></p><p><b><img alt=\"e2-5.jpg\" src=\"http://img.happymmall.com/64929d16-8949-4f8c-a495-432fe15da47a.jpg\" width=\"750\" height=\"578\"><img alt=\"e2-6.jpg\" src=\"http://img.happymmall.com/0d84df9b-50e9-4017-8fc5-63bd29e850c3.jpg\" width=\"750\" height=\"960\"><img alt=\"e2-7.jpg\" src=\"http://img.happymmall.com/5250093d-4faa-4202-b5a2-92fb8b7ced72.jpg\" width=\"750\" height=\"974\"><br></b><img alt=\"e2-8.jpg\" src=\"http://img.happymmall.com/7950b425-8c85-4e71-830d-df360a283b0e.jpg\" width=\"750\" height=\"1056\"></p> </div>', '1499.00', 8595, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 100012, '【测试学习使用】iPhone 7 Plus 4G手机，双卡双待，超长待机，纯黑色', '疯狂大促，仅售5999', 'http://img.happymmall.com/f35cde2b-2f4e-4e2e-80db-a358e8bb7477.jpg', 'http://img.happymmall.com/f35cde2b-2f4e-4e2e-80db-a358e8bb7477.jpg,http://img.happymmall.com/57f09267-65d4-42f4-9da6-151bb0cec28d.jpg,http://img.happymmall.com/9fdda65b-ad1a-4ed7-a0d2-0f129201b9e4.jpg,http://img.happymmall.com/f9e9f59c-5271-441e-a40e-8b9ac9c2af57.jpg', '<div class=\"detail-con\"> <p><b>iPhone 7 Plus 4G手机，双卡双待，超长待机，纯黑色</b><br></p><p><b><img alt=\"iphone7p-5.jpg\" src=\"http://img.happymmall.com/f4ff9d54-572f-48f1-8009-9a21bfb07f48.jpg\" width=\"790\" height=\"1077\"><br></b></p><p><b><img alt=\"iphone7p-6.jpg\" src=\"http://img.happymmall.com/9a422e2f-afda-4630-bb56-142011e1ae96.jpg\" width=\"790\" height=\"1019\"><img alt=\"iphone7p-7.jpg\" src=\"http://img.happymmall.com/878442bd-6c05-46f2-992b-ba5a77181b52.jpg\" width=\"790\" height=\"740\"><br><br></b><img alt=\"iphone7p-8.jpg\" src=\"http://img.happymmall.com/7e9d7b7f-53b9-46fc-a3d4-a27b3f44f998.jpg\" width=\"790\" height=\"861\"></p> </div>', '5999.00', 9633, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 100014, '【测试学习使用】【mayi摄影】Canon/佳能 PowerShot SX620 HS高清长焦数码照相机', 'Canon/佳能', 'http://img.happymmall.com/b896ec40-e643-4924-97ff-c8456f0a9034.jpg', 'http://img.happymmall.com/b896ec40-e643-4924-97ff-c8456f0a9034.jpg,http://img.happymmall.com/2ce3bd68-8a2b-4220-91a1-3fcfe67e6112.jpg,http://img.happymmall.com/51915497-2571-44a6-823a-407b2a3a5c3d.jpg', '<div class=\"detail-con\"> <p>远能拍明月，近能拍花草虫鱼，拥有它，会发现世界如此美。<br></p><p><img alt=\"xq1.jpg\" src=\"http://img.happymmall.com/109a4189-ad65-450c-b417-fc1f4437ba41.jpg\" width=\"700\" height=\"820\"><br></p><p><img alt=\"xq2.jpg\" src=\"http://img.happymmall.com/8ecceb8a-a25b-407d-8230-6cc7c8dcbe8d.jpg\" width=\"700\" height=\"567\"><br></p> </div>', '1499.00', 9924, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 100013, '【测试学习使用】国行Apple/苹果 9.7英寸 iPad Pro WLAN 32GBwifi版轻薄平板电脑', 'iPad Pro', 'http://img.happymmall.com/6e01f79f-fbd8-462c-98ee-bc2db1596562.jpg', 'http://img.happymmall.com/6e01f79f-fbd8-462c-98ee-bc2db1596562.jpg,http://img.happymmall.com/24efb470-135a-4819-a09e-3815005e4c33.jpg,http://img.happymmall.com/3f80768d-f4ef-45d2-bf07-38f2587506d6.jpg,http://img.happymmall.com/867f2082-5bcb-404c-8922-e78e5d03d81e.jpg', '<div class=\"detail-con\"> <p><img alt=\"xq1.jpeg\" src=\"http://img.happymmall.com/edccaa5b-df2a-4308-b737-b4351a0424db.jpeg\" width=\"600\" height=\"341\"><br></p><p><img alt=\"xq2.jpeg\" src=\"http://img.happymmall.com/0ed7aec1-8843-4a05-96ce-ce6a7cf09504.jpeg\" width=\"600\" height=\"319\"><br></p> </div>', '3890.00', 55622, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 100015, '【测试学习使用】aiben C-201四级听力耳机 调频无线收音机调频耳机 办公配件', '调频无线收音机调频耳机', 'http://img.happymmall.com/2bd2abc8-1c19-483f-8dbf-e741831f73ed.jpg', 'http://img.happymmall.com/2bd2abc8-1c19-483f-8dbf-e741831f73ed.jpg,http://img.happymmall.com/c83f1d6b-85e8-40f7-9376-44647adbbe09.jpg', '<div class=\"detail-con\"> <p><b>多年品牌，值得信赖，等的就是你。</b><br></p><p><b><img alt=\"xq1.jpeg\" src=\"http://img.happymmall.com/bf9885fe-a4b7-47a4-8a51-4cf9f048dc9b.jpeg\" width=\"700\" height=\"517\"><br></b></p><p><b><img alt=\"xq2.jpeg\" src=\"http://img.happymmall.com/cc656cd6-5ad6-488d-ab6a-6ae9cd99f98c.jpeg\" width=\"700\" height=\"512\"><br></b></p> </div>', '38.00', 9959, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 100007, '【测试学习使用】Hisense/海信 LED55EC720US 55吋4K高清智能网络平板液晶电视机', '55吋4K高清', 'http://img.happymmall.com/dce7d4e1-98f2-485c-a365-e70015c780a1.jpg', 'http://img.happymmall.com/dce7d4e1-98f2-485c-a365-e70015c780a1.jpg,http://img.happymmall.com/c2ffb9ae-63d7-4710-a67c-cb846401b841.jpg,http://img.happymmall.com/32e4431f-3811-4541-91a1-99ff16d4ce0d.jpg,http://img.happymmall.com/d5d9fa59-384b-49ae-ab02-38d0b07c377d.jpg', '<div class=\"detail-con\"> <p><b>大屏的，才叫震撼，打造家庭影院，你就是奥斯卡之王。</b><br></p><p><b><img alt=\"xq1.png\" src=\"http://img.happymmall.com/0dd05cf5-772d-4488-b3d1-0840e851bf1d.png\" width=\"1572\" height=\"974\"><img alt=\"xq2.png\" src=\"http://img.happymmall.com/ab4fdc14-ecb2-4441-ab3d-92029c2fe2b3.png\" width=\"1576\" height=\"1084\"><br></b></p> </div>', '4199.00', 9836, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 100009, '【测试学习使用】Haier/海尔 KFR-33GW/10EBBAL13U1 1.5匹 空调挂机 智能操控', '安静的省电的', 'http://img.happymmall.com/b6c3ffbb-2107-4b75-9a8d-71c1373f6fbc.jpg', 'http://img.happymmall.com/b6c3ffbb-2107-4b75-9a8d-71c1373f6fbc.jpg,http://img.happymmall.com/e8f68469-8b35-4e23-9d79-98a579f5f9c3.jpg,http://img.happymmall.com/99449c21-1828-40f9-b000-a8bcfc803ac4.jpg', '<div class=\"detail-con\"> <p>制造商名称：青岛海尔空调器有限总公司</p><p>产品名称：空调器（分体挂壁式房间空调器，分体式房间空调器）</p><p>3C产品型号：见附件 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p>&nbsp;3C规格型号：见附件</p><p>产品名称：Haier/海尔 KFR-33GW/1...海尔</p><p>空调型号: KFR-33GW/10EBBAL13U1</p><p>空调类型: 壁挂式</p><p>冷暖类型: 冷暖电辅空调</p><p>功率: 1.5匹</p><p>适用面积: 13-20㎡</p><p>工作方式: 定频</p><p>能效等级: 三级<br></p><p><img alt=\"xq1.png\" src=\"http://img.happymmall.com/d79d9e51-1d97-4aef-acc3-5f9968df0d02.png\" width=\"1558\" height=\"1328\"><img alt=\"xq2.png\" src=\"http://img.happymmall.com/e7d91f88-8e3a-4bce-8318-5d27560806ea.png\" width=\"1544\" height=\"822\"><br></p> </div>', '2099.00', 9957, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 100006, '【测试学习使用】Midea/美的 BCD-535WKZM(E)冰箱双开门无霜智能家用厨卫家电', '送品牌烤箱，五一大促', 'http://img.happymmall.com/ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 'http://img.happymmall.com/ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,http://img.happymmall.com/4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,http://img.happymmall.com/36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '<div class=\"detail-con\"> <p><img alt=\"miaoshu.jpg\" src=\"http://img.happymmall.com/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg\" width=\"790\" height=\"444\"><br></p><p><img alt=\"miaoshu2.jpg\" src=\"http://img.happymmall.com/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg\" width=\"790\" height=\"1441\"><img alt=\"miaoshu3.jpg\" src=\"http://img.happymmall.com/7862594b-3063-4b52-b7d4-cea980c604e0.jpg\" width=\"790\" height=\"1442\"><img alt=\"miaoshu4.jpg\" src=\"http://img.happymmall.com/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg\" width=\"790\" height=\"1441\"><br></p> </div>', '3299.00', 9863, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 100008, '【测试学习使用】Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干大容量 洗烘一体 厨卫家电', '门店机型 德邦送货', 'http://img.happymmall.com/173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', 'http://img.happymmall.com/173335a4-5dce-4afd-9f18-a10623724c4e.jpeg,http://img.happymmall.com/42b1b8bc-27c7-4ee1-80ab-753d216a1d49.jpeg,http://img.happymmall.com/2f1b3de1-1eb1-4c18-8ca2-518934931bec.jpeg', '<div class=\"detail-con\"> <p><img alt=\"1TB2WLZrcIaK.eBjSspjXXXL.XXa_!!2114960396.jpg\" src=\"http://img.happymmall.com/ffcce953-81bd-463c-acd1-d690b263d6df.jpg\" width=\"790\" height=\"920\"><img alt=\"2TB2zhOFbZCO.eBjSZFzXXaRiVXa_!!2114960396.jpg\" src=\"http://img.happymmall.com/58a7bd25-c3e7-4248-9dba-158ef2a90e70.jpg\" width=\"790\" height=\"1052\"><img alt=\"3TB27mCtb7WM.eBjSZFhXXbdWpXa_!!2114960396.jpg\" src=\"http://img.happymmall.com/2edbe9b3-28be-4a8b-a9c3-82e40703f22f.jpg\" width=\"790\" height=\"820\"><br></p> </div>', '4299.00', 9897, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 100006, '【测试学习使用】Midea/美的 BCD-535WKZM(E)冰箱双开门无霜智能家用厨卫家电', '送品牌烤箱，五一大促', 'http://img.happymmall.com/ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 'http://img.happymmall.com/ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,http://img.happymmall.com/4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,http://img.happymmall.com/36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '<div class=\"detail-con\"> <p><img alt=\"miaoshu.jpg\" src=\"http://img.happymmall.com/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg\" width=\"790\" height=\"444\"><br></p><p><img alt=\"miaoshu2.jpg\" src=\"http://img.happymmall.com/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg\" width=\"790\" height=\"1441\"><img alt=\"miaoshu3.jpg\" src=\"http://img.happymmall.com/7862594b-3063-4b52-b7d4-cea980c604e0.jpg\" width=\"790\" height=\"1442\"><img alt=\"miaoshu4.jpg\" src=\"http://img.happymmall.com/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg\" width=\"790\" height=\"1441\"><br></p> </div>', '3299.00', 9863, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 100001, '【测试学习使用】hi插座插排插线板接线板配件小家电厨卫家电', '性能极佳的插座', 'http://img.happymmall.com/69147799-d7cd-4e7a-9a03-a4b7db4f2ae4.jpg', 'http://img.happymmall.com/69147799-d7cd-4e7a-9a03-a4b7db4f2ae4.jpg,http://img.happymmall.com/952c478b-e185-4cb5-aa41-7ce0590720ac.jpg,http://img.happymmall.com/dd7444c8-2158-4207-80fd-e9bd1e3986a3.jpg,http://img.happymmall.com/2efa2ce1-b5f7-4b4f-ba6f-3ec2aa8d4a4a.jpg', '<div class=\"detail-con\"> <p><b>多年品牌，值得信赖，等的就是你。</b><br></p><p><b><img alt=\"xq1.png\" src=\"http://img.happymmall.com/5be9b3f8-536b-45c0-ba40-fef55952f827.png\" width=\"1564\" height=\"1038\"><br></b><img alt=\"xq2.png\" src=\"http://img.happymmall.com/1a5010a7-3e9e-4670-af39-965dadde9f4d.png\" width=\"1434\" height=\"990\"></p> </div>', '9.90', 3646, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 100001, '【测试学习使用】Midea/美的 F6030-J5(HE) 速热即热式电热水器60升厨卫家电', '智能储水式电热水器', 'http://img.happymmall.com/e1e93f76-9882-4232-9bb2-a7b809f81d01.jpg', 'http://img.happymmall.com/e1e93f76-9882-4232-9bb2-a7b809f81d01.jpg,http://img.happymmall.com/a3e753d3-005e-4745-9810-78b957d8052c.jpg,http://img.happymmall.com/87a16263-38e2-40ec-9435-affca40a6e31.jpg', '<div class=\"detail-con\"> <p><img alt=\"xq1.jpg\" src=\"http://img.happymmall.com/8c4216be-b756-4715-8861-6bb636414540.jpg\" width=\"700\" height=\"712\"><br></p> </div>', '1599.00', 9973, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 100017, '【测试学习使用】男女儿童装跑男撕名牌网格遮阳帽子儿童玩具zi潮', '儿童帽\r\n儿童帽\r\n', 'http://img.happymmall.com/ea0a4ff3-45fc-4c55-ad35-03c1a6d4ff69.png', 'http://img.happymmall.com/ea0a4ff3-45fc-4c55-ad35-03c1a6d4ff69.png,http://img.happymmall.com/debad704-ac2b-40ae-b816-b3fcd6f33c52.png', '<div class=\"detail-con\"> <p><img alt=\"TB2NkTBk1tTMeFjSZFOXXaTiVXa_!!1812444812.jpg\" src=\"http://img.happymmall.com/7d07e7fd-5e72-4a6d-aa75-f512d98c3eca.jpg\" width=\"750\" height=\"562\"><br></p> </div>', '34.00', 9949, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 100018, '【测试学习使用】拉杆箱万向轮旅行箱24寸牛津布密码箱i男女布箱26寸箱包旅行箱', '旅行箱', 'http://img.happymmall.com/27117799-5074-4018-9e5f-011eaa5f694c.jpg', 'http://img.happymmall.com/27117799-5074-4018-9e5f-011eaa5f694c.jpg,http://img.happymmall.com/ac51d6ef-0d58-4968-b4c3-8d8380c2cfc3.jpg', '<div class=\"detail-con\"> <p><img alt=\"xq1.jpg\" src=\"http://img.happymmall.com/6b9e860e-ed7c-47b6-8014-eab86c8f89d2.jpg\" width=\"700\" height=\"814\"><br></p> </div>', '75.00', 9970, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 100002, '【测试学习使用】三体全套3册刘慈欣三ti包邮全集畅销书 三体1+三体2黑暗森林+三体3死神永生 图书 音像 电子书', '《三体》全3册', 'http://img.happymmall.com/20ecd487-3677-4a1c-b780-249d265b59ca.jpg', 'http://img.happymmall.com/20ecd487-3677-4a1c-b780-249d265b59ca.jpg,http://img.happymmall.com/15e6efd9-d541-44c5-8968-5ae728ac14ce.jpg,http://img.happymmall.com/70c5ec00-1e72-4d1b-89d4-5af041ea90f5.jpg', '<div class=\"detail-con\"> <p>《三体》是刘慈欣创作的系列长篇科幻小说，由《三体》、《三体Ⅱ·黑暗森林》、《三体Ⅲ·死神永生》组成，第一部于2006年5月起在《科幻世界》杂志上连载，第二部于2008年5月首次出版，第三部则于2010年11月出版。</p><p>作品讲述了地球人类文明和三体文明的信息交流、生死搏杀及两个文明在宇宙中的兴衰历程。其第一部经过刘宇昆翻译后获得了第73届雨果奖最佳长篇小说奖&nbsp;。</p><p><img alt=\"TB2mmDneYBmpuFjSZFAXXaQ0pXa_!!1738997242.jpg_430x430q90.jpg\" src=\"http://img.happymmall.com/c81872ff-c205-4edb-bebd-fac43f504015.jpg\" width=\"430\" height=\"430\"><br></p> </div>', '60.00', 5910, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 100030, '【测试学习使用】澳大利亚红酒澳洲原瓶进口黄尾袋鼠西拉红酒6支装', '进口洋酒', 'http://img.happymmall.com/8574b919-fafa-4ad2-b5e3-9954b8ebeb05.png', 'http://img.happymmall.com/8574b919-fafa-4ad2-b5e3-9954b8ebeb05.png', '<div class=\"detail-con\"> <p><img alt=\"xq.jpg\" src=\"http://img.happymmall.com/cb8e0924-16c7-4037-b3bf-0e4508617681.jpg\" width=\"790\" height=\"615\"><br></p> </div>', '268.00', 2829, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(18, 100029, '【测试学习使用】rio/锐澳330ml*6支装饮料 进口洋酒 白酒 红酒 整箱伏特加鸡尾酒', '锐澳鸡尾酒330ml*6罐组合套餐，高果汁本榨鸡尾酒系列', 'http://img.happymmall.com/755bbbaa-e053-4a2f-8396-790b8ad3b26b.jpg', 'http://img.happymmall.com/755bbbaa-e053-4a2f-8396-790b8ad3b26b.jpg,http://img.happymmall.com/c7e2770c-c424-40f9-b604-866879cc519e.jpg,http://img.happymmall.com/0cb46296-a5c8-4cdd-87b9-525c650fb745.jpg,http://img.happymmall.com/32285e69-fd17-439d-9944-c758f79e27e1.jpg', '<div class=\"detail-con\"> <p><img alt=\"Image\" src=\"https://img.alicdn.com/imgextra/i4/1761481772/TB2USNuustnpuFjSZFvXXbcTpXa-1761481772.jpg\" width=\"790\" height=\"903\"><img alt=\"Image\" src=\"https://img.alicdn.com/imgextra/i3/1761481772/TB2DsfzqYXlpuFjSszfXXcSGXXa-1761481772.jpg\" width=\"790\" height=\"1030\"><img alt=\"Image\" src=\"https://img.alicdn.com/imgextra/i3/1761481772/TB2UavBq80kpuFjSsziXXa.oVXa-1761481772.jpg\" width=\"790\" height=\"920\"><br></p> </div>', '53.00', 836, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(19, 100028, '【测试学习使用】百事可乐330ml *24瓶听装 可乐汽水碳酸饮料', '冰爽夏日', 'http://img.happymmall.com/60072b29-ecb2-46c2-82bd-a7859621c595.png', 'http://img.happymmall.com/60072b29-ecb2-46c2-82bd-a7859621c595.png', '无', '44.80', 3289, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(20, 100027, '【测试学习使用】长城优级解百纳干红红葡萄酒 750ml*6瓶整箱 国产红酒', '国产红酒', 'http://img.happymmall.com/32adfcb0-d756-41ca-929c-7ccc95480b45.png', 'http://img.happymmall.com/32adfcb0-d756-41ca-929c-7ccc95480b45.png', '无', '229.00', 11163, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(21, 100026, '【测试学习使用】湖北名酒1箱促销装', '品牌名酒 湖北名酒', 'http://img.happymmall.com/40b22aa2-9724-4767-9f7c-3dbe43a7c129.png', 'http://img.happymmall.com/40b22aa2-9724-4767-9f7c-3dbe43a7c129.png', '<div class=\"detail-con\"> <p><img alt=\"xq.jpg\" src=\"http://img.happymmall.com/ac8ec0d4-f40b-41a0-9280-dd10e5086ca7.jpg\" width=\"790\" height=\"762\"><br></p> </div>', '89.00', 10047, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(22, 100025, '【测试学习使用】德国进口欧德堡超高温灭菌3.5%全脂纯牛奶 200ml*24', '进口牛奶', 'http://img.happymmall.com/ea5d09b9-bcb7-4a2a-8cb2-744191c44fb6.png', 'http://img.happymmall.com/ea5d09b9-bcb7-4a2a-8cb2-744191c44fb6.png', '<div class=\"detail-con\"> <p><img alt=\"B28AC5EB-A5E8-4BCD-8C1A-259FE6D202BC.jpeg\" src=\"http://img.happymmall.com/1e05eb34-0b4e-4f54-96c4-8a26112ebd45.jpeg\" width=\"700\" height=\"695\"><br></p> </div>', '69.90', 5691, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(23, 100023, '【测试学习使用】绝味小龙虾1kg 麻辣/十三香口味(17-25只)', '绝味小龙虾', 'http://img.happymmall.com/dbf30c59-2178-4257-a22c-a03704c32863.png', 'http://img.happymmall.com/dbf30c59-2178-4257-a22c-a03704c32863.png,http://img.happymmall.com/c51ce142-2c87-4a8b-929c-beb2e7a767d6.jpeg', '<div class=\"detail-con\"> <p><img alt=\"xq.jpeg\" src=\"http://img.happymmall.com/ae000c4e-fde2-42a8-8c53-ecc130599374.jpeg\" width=\"700\" height=\"483\"><br></p> </div>', '200.00', 89982, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(24, 100022, '【测试学习使用】湖北熟制小龙虾1kg 麻辣/十三香口味(17-25只)', '湖北小龙虾', 'http://img.happymmall.com/6b109cd7-066f-47bc-bdfb-619e4c444da4.png', 'http://img.happymmall.com/6b109cd7-066f-47bc-bdfb-619e4c444da4.png', '<div class=\"detail-con\"> <p><img alt=\"xq.jpeg\" src=\"http://img.happymmall.com/6ab944da-df5a-4fde-86dc-b7249f3e5b9e.jpeg\" width=\"700\" height=\"483\"><br></p> </div>', '199.00', 22968, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(25, 100021, '【测试学习使用】三只松鼠 开心果225g休闲零食坚果特产无漂白2件起售', '开心果', 'http://img.happymmall.com/0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', 'http://img.happymmall.com/0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png,', '<div class=\"detail-con\"> <p><img alt=\"xq.jpeg\" src=\"http://img.happymmall.com/6dd1491a-c2a1-41b0-bafe-5c93689d8297.jpeg\" width=\"700\" height=\"468\"><br></p> </div>', '27.90', 9966, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 100011, '【测试学习使用】thinkpad旗舰本', '51大促！非常超值！', 'http://img.happymmall.com/f3182089-e21f-4560-a5ce-e600e3408a98.jpeg', 'http://img.happymmall.com/f3182089-e21f-4560-a5ce-e600e3408a98.jpeg,http://img.happymmall.com/cd747170-0631-4fca-9c63-ba533f7bf0dc.jpeg,http://img.happymmall.com/bc144c92-5df6-4243-9c44-8dadb79ef4ee.jpeg,http://img.happymmall.com/d66ce7ad-e309-447d-9211-246608881656.jpeg', '<div class=\"detail-con\"> <p><b>thinkpad旗舰本,51大促！非常超值！</b><br></p><p><b><img alt=\"miaoshu1.jpg\" src=\"http://img.happymmall.com/1a4b1d2c-2f13-4659-9535-4384b0df9e4f.jpg\" width=\"790\" height=\"1112\"><br></b></p><p><b><img alt=\"miaoshu2.jpg\" src=\"http://img.happymmall.com/995ab456-dadd-44b4-9896-c075422121f8.jpg\" width=\"790\" height=\"1246\"><br></b></p> </div>', '4288.00', 9572, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00'),
(27, 100016, '【测试学习使用】女yi新款影视三生三世十里桃花白浅上神同款cosplay服装女装', 'cosplay女装', 'http://img.happymmall.com/7a02b150-793a-4637-9098-f8ee8582bad4.png', 'http://img.happymmall.com/7a02b150-793a-4637-9098-f8ee8582bad4.png,http://img.happymmall.com/7a6bb097-cf79-4ee8-a161-74f6009f8b5a.png', '<div class=\"detail-con\"> <p><span style=\"font-size: 16px;\"><b>你是司音，你是白浅，你是我的宝贝甜蜜饯儿</b></span><br></p><p><img alt=\"xq1.jpeg\" src=\"http://img.happymmall.com/bc824a72-12ac-4928-b49d-f0cc95561f92.jpeg\" width=\"700\" height=\"438\"></p><p>你是司音，你是白浅，你是我的宝贝甜蜜饯儿<img alt=\"xq2.jpg\" src=\"http://img.happymmall.com/b2d11f9e-4260-4ae1-a7ac-61a9d16c5b6a.jpg\" width=\"700\" height=\"394\"><br><br></p> </div>', '299.00', 809, 1, '2017-10-17 00:00:00', '2017-10-17 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `receiver_name` varchar(10) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(255) NOT NULL COMMENT '收货人固话',
  `receiver_moblie` varchar(255) NOT NULL COMMENT '收货人移动电话',
  `receiver_province` varchar(255) NOT NULL COMMENT '收货人省份',
  `receiver_city` varchar(255) NOT NULL COMMENT '收货人城市',
  `receiver_district` varchar(255) NOT NULL COMMENT '收货人区',
  `receiver_address` varchar(255) NOT NULL COMMENT '收货人地址',
  `receiver_zip` varchar(255) NOT NULL COMMENT '地址的邮政编码',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货表';

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '用户表id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '找回密码答案',
  `role` int(4) NOT NULL COMMENT '角色0-管理员,1-普通用户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_info`
--
ALTER TABLE `pay_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name_unique` (`username`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- 使用表AUTO_INCREMENT `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id';
--
-- 使用表AUTO_INCREMENT `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id';
--
-- 使用表AUTO_INCREMENT `pay_info`
--
ALTER TABLE `pay_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=28;
--
-- 使用表AUTO_INCREMENT `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id';COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
