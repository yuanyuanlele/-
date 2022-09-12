/*
Navicat MySQL Data Transfer

Source Server         : DistanceMysql
Source Server Version : 50718
Source Host           : 140.143.181.108:10028
Source Database       : campusrecruitdb

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-12-18 16:35:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `userid` bigint(20) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('19980208', '18812345678', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'babycoder@163.com');

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `applicationId` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT NULL,
  `recentTime` datetime DEFAULT NULL,
  `resumeId` int(11) NOT NULL,
  `positionId` int(11) NOT NULL,
  `hrId` int(11) DEFAULT NULL,
  PRIMARY KEY (`applicationId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('1', '1', '2020-12-16 22:37:14', '1', '1', '1');
INSERT INTO `application` VALUES ('2', '1', '2020-12-16 22:37:17', '2', '5', '2');
INSERT INTO `application` VALUES ('3', '1', '2020-12-16 22:37:20', '2', '11', '2');
INSERT INTO `application` VALUES ('4', '1', '2020-12-16 22:36:38', '2', '15', '3');
INSERT INTO `application` VALUES ('5', '1', '2020-12-10 22:37:23', '6', '11', '5');
INSERT INTO `application` VALUES ('6', '1', '2020-12-15 22:37:26', '5', '3', '3');
INSERT INTO `application` VALUES ('7', '1', '2020-12-03 22:37:31', '6', '18', '1');
INSERT INTO `application` VALUES ('8', '1', '2020-12-11 22:37:36', '4', '5', '1');
INSERT INTO `application` VALUES ('9', '1', '2020-12-13 22:37:39', '4', '13', '6');
INSERT INTO `application` VALUES ('12', '0', '2017-11-17 11:32:47', '24', '14', '6');
INSERT INTO `application` VALUES ('13', '1', '2017-11-17 20:36:09', '25', '15', '6');
INSERT INTO `application` VALUES ('14', '0', '2020-02-07 15:52:08', '26', '2', '6');
INSERT INTO `application` VALUES ('15', '2', '2020-02-07 17:43:19', '26', '2', '6');
INSERT INTO `application` VALUES ('16', '0', '2020-02-07 22:18:50', '26', '2', '6');
INSERT INTO `application` VALUES ('17', '0', '2020-02-07 22:47:21', '26', '5', '6');
INSERT INTO `application` VALUES ('18', '1', '2020-02-08 12:34:34', '26', '5', '6');
INSERT INTO `application` VALUES ('22', '0', '2020-04-08 18:10:15', '25', '41', '6');
INSERT INTO `application` VALUES ('23', '0', '2020-12-17 10:31:50', '25', '42', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Java', 'Java开发');
INSERT INTO `category` VALUES ('2', 'C++', 'C++开发');
INSERT INTO `category` VALUES ('3', 'PHP', 'PHP开发');
INSERT INTO `category` VALUES ('4', '.NET', '.NET开发');
INSERT INTO `category` VALUES ('5', 'Python', 'Python开发');
INSERT INTO `category` VALUES ('6', '数据挖掘', '数据挖掘');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `content` longtext,
  `releaseTime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `positionId` int(11) NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '3', 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计', '2017-11-14 22:47:42', '1', '5');
INSERT INTO `comment` VALUES ('2', '2', 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念', '2017-11-14 22:47:42', '1', '17');
INSERT INTO `comment` VALUES ('3', '1', 'Python是纯粹的自由软件， 源代码和解释器CPython遵循 GPL(GNU General Public License)协议', '2017-11-14 22:47:42', '2', '11');
INSERT INTO `comment` VALUES ('4', '3', 'C++不仅拥有计算机高效运行的实用性特征，同时还致力于提高大规模程序的编程质量与程序设计语言的问题描述能力', '2017-11-14 22:47:42', '3', '18');
INSERT INTO `comment` VALUES ('5', '3', '这是一些关于Java工程师的评论，这个职位需要丰富的阅历的和工作经验', '2017-11-14 22:47:42', '5', '2');
INSERT INTO `comment` VALUES ('6', '2', '又要写测试评论，写点啥呢？布吉岛', '2017-11-14 22:47:42', '6', '8');
INSERT INTO `comment` VALUES ('7', '3', '数据挖掘一般是指从大量的数据中通过算法搜索隐藏于其中信息的过程', '2017-11-14 22:47:42', '6', '14');
INSERT INTO `comment` VALUES ('8', '3', 'Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点', '2017-11-14 22:47:42', '6', '17');
INSERT INTO `comment` VALUES ('9', '2', 'Python 已经成为最受欢迎的程序设计语言之一', '2017-11-14 22:47:42', '1', '10');
INSERT INTO `comment` VALUES ('10', '3', '<p>.NET是 Microsoft XML Web services 平台</p>', '2017-11-14 22:47:42', '2', '9');
INSERT INTO `comment` VALUES ('19', '3', 'IndexRecruit大透明弱弱地评论一句~', '2017-11-16 22:37:26', '7', '13');
INSERT INTO `comment` VALUES ('21', '3', '学习数据挖掘小白应该从哪个方面入手？萌新小白求教~', '2017-11-17 11:32:32', '24', '14');
INSERT INTO `comment` VALUES ('23', '3', '<p><span><u><b>XML Web services 允许应用程序通过 Internet 进行通讯和共享数据，而不管所采用的是哪种操作系统、设备或编程语言</b></u></span></p>', '2017-11-17 21:45:42', '25', '9');
INSERT INTO `comment` VALUES ('24', '3', '<i>阿里今年双十一赚大发了。。。</i>', '2017-11-17 21:56:58', '25', '1');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(100) DEFAULT NULL,
  `companyLogo` int(11) DEFAULT NULL,
  `description` longtext,
  `state` int(11) DEFAULT NULL,
  `companyCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '阿里巴巴', '1', '阿里巴巴网络技术有限公司（简称：阿里巴巴集团）是以曾担任英语教师的马云为首的18人于1999年在浙江杭州创立', '1', 'AL85685');
INSERT INTO `company` VALUES ('2', '滴滴出行', '2', '滴滴出行是涵盖出租车、专车、 快车、顺风车、代驾及 大巴等多项业务在内的一站式出行平台，2015年9月9日由“滴滴打车”更名而来', '1', 'DD36526');
INSERT INTO `company` VALUES ('3', '搜狐媒体', '3', '搜狐公司是中国领先的互联网品牌，是中国最主要的新闻提供商，搜狐的网络资产给众多用户在信息、娱乐以及交流方面提供了广泛的选择', '1', 'SH74524');
INSERT INTO `company` VALUES ('4', '京东', '4', '京东致力于成为一家为社会创造最大价值的公司。经过13年砥砺前行，京东在商业领域一次又一次突破创新，取得了跨越式发展', '1', 'JD86635');
INSERT INTO `company` VALUES ('5', '网易', '5', '网易公司（NASDAQ: NTES）是中国的互联网公司，利用互联网技术，加强人与人之间信息的交流和共享，实现“网聚人的力量”', '1', 'WY53265');
INSERT INTO `company` VALUES ('6', '爱奇艺', '6', '自成立伊始，爱奇艺坚持“悦享品质”的公司理念，以“用户体验”为生命，专注为用户提供清晰、流畅、界面友好的观映体验', '1', 'AQ86532');
INSERT INTO `company` VALUES ('7', '重庆工程学院', '7', '好学校啊', '1', '123456');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(50) DEFAULT NULL,
  `description` longtext,
  `companyId` int(11) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', '1');
INSERT INTO `department` VALUES ('2', '行政部', '负责行政事务和办公事务', '1');
INSERT INTO `department` VALUES ('3', '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', '1');
INSERT INTO `department` VALUES ('4', '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', '2');
INSERT INTO `department` VALUES ('5', '行政部', '负责行政事务和办公事务', '2');
INSERT INTO `department` VALUES ('6', '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', '2');
INSERT INTO `department` VALUES ('7', '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', '3');
INSERT INTO `department` VALUES ('8', '行政部', '负责行政事务和办公事务', '3');
INSERT INTO `department` VALUES ('9', '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', '3');
INSERT INTO `department` VALUES ('10', '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', '4');
INSERT INTO `department` VALUES ('11', '行政部', '负责行政事务和办公事务', '4');
INSERT INTO `department` VALUES ('12', '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', '4');
INSERT INTO `department` VALUES ('13', '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', '5');
INSERT INTO `department` VALUES ('14', '行政部', '负责行政事务和办公事务', '5');
INSERT INTO `department` VALUES ('15', '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', '5');
INSERT INTO `department` VALUES ('16', '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', '6');
INSERT INTO `department` VALUES ('17', '行政部', '负责行政事务和办公事务', '6');
INSERT INTO `department` VALUES ('18', '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', '6');

-- ----------------------------
-- Table structure for favor
-- ----------------------------
DROP TABLE IF EXISTS `favor`;
CREATE TABLE `favor` (
  `favorId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `positionId` int(11) NOT NULL,
  PRIMARY KEY (`favorId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favor
-- ----------------------------
INSERT INTO `favor` VALUES ('1', '1', '16');
INSERT INTO `favor` VALUES ('2', '1', '2');
INSERT INTO `favor` VALUES ('3', '1', '8');
INSERT INTO `favor` VALUES ('4', '2', '2');
INSERT INTO `favor` VALUES ('5', '2', '15');
INSERT INTO `favor` VALUES ('6', '2', '3');
INSERT INTO `favor` VALUES ('7', '2', '5');
INSERT INTO `favor` VALUES ('8', '3', '1');
INSERT INTO `favor` VALUES ('9', '4', '6');
INSERT INTO `favor` VALUES ('10', '4', '8');
INSERT INTO `favor` VALUES ('11', '4', '8');
INSERT INTO `favor` VALUES ('12', '6', '10');
INSERT INTO `favor` VALUES ('13', '6', '11');
INSERT INTO `favor` VALUES ('14', '6', '18');
INSERT INTO `favor` VALUES ('17', '24', '2');
INSERT INTO `favor` VALUES ('18', '25', '37');
INSERT INTO `favor` VALUES ('19', '25', '41');

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr` (
  `hrId` int(11) NOT NULL AUTO_INCREMENT,
  `hrMobile` varchar(11) NOT NULL,
  `hrPassword` varchar(500) NOT NULL,
  `hrName` varchar(50) DEFAULT NULL,
  `hrEmail` varchar(50) DEFAULT NULL,
  `description` longtext,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`hrId`),
  UNIQUE KEY `mobile_UNIQUE` (`hrMobile`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES ('1', '15786586352', '4QrcOUm6Wau+VuBX8g+IPg==', '董一鸣', 'dongyiming@163.com', '行政部HR', '2');
INSERT INTO `hr` VALUES ('2', '13685653625', '4QrcOUm6Wau+VuBX8g+IPg==', '张帆', 'zhangfan@163.com', '行政部HR', '5');
INSERT INTO `hr` VALUES ('3', '18596475235', '4QrcOUm6Wau+VuBX8g+IPg==', '李正斌', 'libin@163.com', '行政部HR', '8');
INSERT INTO `hr` VALUES ('4', '16785253625', '4QrcOUm6Wau+VuBX8g+IPg==', '王语意', 'wangyuyi@163.com', '行政部HR', '11');
INSERT INTO `hr` VALUES ('5', '17865253625', '4QrcOUm6Wau+VuBX8g+IPg==', '李星泽', 'lixingze@163.com', '行政部HR', '14');
INSERT INTO `hr` VALUES ('6', '13958726395', '4QrcOUm6Wau+VuBX8g+IPg==', '程瑜', 'chengyu@163.com', '行政部HR', '17');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `addDate` datetime DEFAULT NULL,
  `addUser` varchar(255) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('2', '干货文章', '留学生海归专属高薪职位', '2020年注定是不安宁的一年，在新冠疫情长时间席卷全球的情况之下，中国在抗击新冠疫情、经济发展等方面的速度和魄力让全球人民刮目相看。与此同时，部分海外国家对移民政策的缩紧、对国际留学生签证的限制，也掀起了新一轮的归国浪潮。\r\n\r\n 在刚刚过去的半年时间中，许多刚毕业、甚至在海外工作了几年的留学生们，都毅然选择返回祖国的怀抱。与此同时，身为海归留学生需要面对的现实问题是——回国的留学生越来越多，意味着稀缺性大大减少。当下，海归留学生在求职的道路上面临着不少的问题和阻碍。\r\n\r\n何以见得？BOSS直聘研究院抽取了5.1万毕业于2018年且具有完整海外学历教育背景的人才样本，在出版的《2019海归人才就业趋势报告》中对青年留学生群体的就业情况进行了观察。其中，本科学历人才占比36.2%，硕士及以上学历人才占比63.8%。 \r\n\r\n 根据求职者被企业主动关注、沟通、收藏等行为数据，BOSS直聘建立模型对海归人才就业竞争力进行量化。竞争力在90分位以上的海归，简历受雇主关注度达到均值的5倍以上；而竞争力处于30分位以下的海归，其综合竞争力尚不及国内普通高校均值。反映出国内雇主对海归人才的筛选辨识能力也在逐渐增强，没有真才实学，空有一张海外高校文凭已经难以为留学生的求职带来实质性帮助。\r\n\r\n 该数据显示，2019年应届留学生回国从事最多的前三职位分别为市场营销、外语教师和会计。数据分析师则成为留学生选择最多的技术类职位，占比连续三年保持增长。除此之外，与大数据相关的算法类岗位需求量大，搜索算法和图像算法工程师增速超过40%。Python热度虽出现小幅下滑，但依然排在增幅榜前十位。\r\n\r\n 那么对于海归留学生而言，除了上述热门职位之外，哪些职位又是出圈的“高薪铁饭碗”呢？BOSS直聘为留学生和海归们总结了八大海归专属高薪职位！\r\n\r\n1. 算法工程师\r\n\r\n简单来说，算法工程师就是做算法的优化，利用机器学习的方法来实现数据挖掘和人工智能。算法工程师薪资高是业内普遍承认的，年薪普遍在30万到40万不等，高者可以拿到60万。最重要的是，算法工程师对工作年限的要求也相对宽松。如今，中国各大互联网大厂可谓是发展的风生水起，因此，算法工程师今后的职业道路也十分开阔、岗位需求量多、可发展空间极大。', '2020-12-18 11:25:35', '13958726395', '/upload/newsIcon/2020-12-18-14-35-39402985-2.png');
INSERT INTO `news` VALUES ('3', '数据报告', '拿不到年终奖就跳槽？80后或成最硬核职场人 | 2018年终奖调查', '江西一集团堆了一座5亿现金墙，为公司1万员工发放人均5万元的年终奖；\r\n\r\n浙江温州一家汽车部件公司，奖励100名优秀员工一人一台价值11万元新车。\r\n\r\n有种奖，叫做别人的年终奖。西湖的水，我的泪！\r\n\r\n辛辛苦苦搬砖一年，就盼着年终奖这块大饼，今年你吃到没？\r\n\r\n前不久，BOSS直聘与《疯狂的外星人》特别策划发起了“2018年终奖大调查”，收到1367位职场人的反馈，经过对样本的分析，最终得出这份《疯狂的年终奖——2018职场人年终奖调查报告》，也得到一些有意思的发现——\r\n\r\n年终奖-长图-外星人版-切图版_02.jpg\r\n1、年终奖，我的最爱\r\n\r\n61%职场人表示公司会发放年终奖\r\n\r\n年终奖-长图-外星人版-切图版_03.jpg\r\n\r\n调查显示，虽然仅有12.3%的职场人已收到年终奖，但还有48.5%的人表示公司会发年终奖，只是还没发。至于那些明确不会发年终奖的14.5%人群，我只好劝你们想开点，年会晚宴上偷偷给自己加几个鸡腿吧！\r\n\r\n\r\n2、早发钱回家好过年\r\n\r\n近8成公司会在春节假期前发放年终奖\r\n\r\n年终奖-长图-外星人版-切图版_04.jpg\r\n\r\n从数据我们可以看出，79%的公司会在春节假期前发放年终奖，好让员工开开心心领到奖回家过大年，但也剩下21%的公司年后才会发，看来老板们深谙某些员工拿了年终奖就准备溜号的套路啊！\r\n\r\n不过老板们可能也没这么想，他们也许是为你存钱呢！过年兜里没钱，看你还怎么挥霍？\r\n\r\n\r\n3、多少无所谓，有奖就行\r\n\r\n超6成职场人仅有1个月的年终奖，不到3%的人能领到6个月及以上年终奖', '2020-12-18 13:58:11', '13958726395', '/upload/newsIcon/2020-12-18-14-35-33520639-1.jpg');
INSERT INTO `news` VALUES ('4', '公司动态', '关于BOSS直聘首席吐槽官·直直的一切', '简介\r\n\r\n直直是BOSS直聘的吉祥物，在BOSS直聘担任首席吐槽官的一职，于2016年诞生，是品牌的拟人化体现。\r\n\r\n爱生活、爱吐槽、爱公益、爱创作，致力于给职场人带走烦恼、带来快乐。\r\n\r\nBOSS直聘希望通过表情包、小说、漫画、音乐、视频等多元化的内容，将直直形象立体化，让直直成为BOSS直聘与用户连接的纽带。\r\n\r\n中文名 直直\r\n\r\n身    份 BOSS直聘首席吐槽官\r\n\r\n生    日 2014年7月13日\r\n\r\n性    别 男\r\n\r\n性    格 呆萌、毒舌、正义、热心\r\n\r\n星    座 巨蟹座\r\n\r\n喜欢的食物 芝士\r\n\r\n\r\n名字由来\r\n\r\n直直的名字，一是取自BOSS直聘中“直”的意思；\r\n\r\n二是代表这直接沟通、直聘求职的含义；\r\n\r\n三是表现出直直性格直爽的性格，有话直说，有梗直喷，符合首席吐槽官的形象。\r\n\r\n\r\n设计理念\r\n\r\n\r\n\r\n直直为幼童形象，与BOSS直聘平台同岁，一同成长。\r\n\r\n头顶两只牛角，象征着牛人与boss之间沟通的桥梁；\r\n\r\n左角戴有黑色耳钉，封印了直直穿越时空的超能力，代表着严格的审核机制；\r\n\r\n通体雪白，象征平台一直致力于创建纯净、公开的求职招聘环境。\r\n\r\n性格设定\r\n\r\n直直性格呆萌憨直，既有小朋友的童心好奇心，又有职场人的对生活的感悟。\r\n\r\n在遇到职场难题时，会出谋划策，耐心进行科普研究；看到职场不公现象时，会直言快语犀利吐槽。\r\n\r\n公益事业\r\n\r\n\r\n\r\n巡护员守护计划\r\n\r\n2020年7月13日，直直在六周岁生日晚会上宣布向可可西里自然保护区捐赠巡护车，旨在保障巡护员打击盗猎、盗采等违法行为时的人身安全。据了解，此次捐赠属BOSS直聘“巡护员守护计划”项目一期，已捐赠车辆金额共计36.812W。\r\n\r\n公益动画\r\n\r\n\r\n直直致力于关注职场动态，尤其是招聘骗局。由于诈骗案例层出不穷，直直用动画的方式，还原按诈骗场景，分析诈骗套路，为求职的朋友们提供宣传防骗知识。相关内容有：揭露常见招聘诈骗的rap短动画《擦亮你的眼睛》\r\n\r\n\r\n\r\n活动\r\n\r\n生日会\r\n\r\n\r\n从2017年起，每年7月13日，直直都会举行盛大的生日派对。\r\n\r\n\r\n三周岁\r\n\r\n2017年7月13日，直直三周岁·嘉年华生日趴盛大举行，活动全面整合了线上线下的传播资源，运用多种创新社会营销手法，打破了渠道和地域的限制，发起了百家蓝V微博互动庆生、病毒H5、预热病毒视频等线上活动，同时全国七个城市进行线下联动，于2018年1月BOSS直聘首席吐槽官直直凭借“直直三周岁嘉年华”整合营销方案荣获金牛角—整合营销奖。\r\n\r\n\r\n四周岁\r\n\r\n2018年7月13日，「直直四周岁嘉年华·放肆狂欢夜」在北京举行，面向全球发放三百张邀请函。现场开设了「职场诊断所」、「职场狼人杀」、「抖音尬舞区」、「直直博物馆」等场景，还邀请了32个足球宝贝与32只哈士奇，为直直庆生。\r\n\r\n\r\n五周岁\r\n\r\n\r\n2019年7月13日，「直直五周岁水上嘉年华·成年人，无所畏」在水立方盛大举办。全球的1500余位企业界高管、HR、直直粉丝和一线网红齐聚水立方嬉水乐园，不仅有水上蹦迪、千人造浪等水上项目，还有「无所畏夜市」提供按摩解乏、换装拍照、美食美酒等相关岸上活动。\r\n\r\n\r\n六周岁\r\n\r\n\r\n2020年7月13日，「直直6岁生日会&职人换了嘉年华·六重宇宙」线上生日趴在全网进行直播。直播请到知名脱口秀演员张博洋，进行主持与脱口秀表演，穿插\r\n\r\n\r\n', '2020-12-18 14:36:07', '13958726395', '/upload/newsIcon/2020-12-18-14-36-0777811-3.png');
INSERT INTO `news` VALUES ('5', '面试黑话：面试官向你传达的不能说的秘密 ', '在面试中，除了注意自己一言一行，我们还能关注面试官的回应，既可以提前大概判断自己的面试结果，也能从他们的话语中获取有用的信息。尤其对于久居海外的留学生们，回国求职一定有很多你不懂的面试官黑话，向你传达 ', '在面试中，除了注意自己一言一行，我们还能关注面试官的回应，既可以提前大概判断自己的面试结果，也能从他们的话语中获取有用的信息。尤其对于久居海外的留学生们，回国求职一定有很多你不懂的面试官黑话，向你传达某种不能说的秘密。今天我们就来盘点一下那些面试黑话。\r\n\r\n这篇科普攻略约2700字，共有两个Part，阅读全文需6-8分钟，有用又有趣。\r\n\r\nc79ea333d35c1bc657680c6340bfa27f.png\r\n\r\n PART1. 从面试官的潜台词中推测通过机率 \r\n\r\n我们总希望从面试官的反应提前预估自己是否能通过面试，而不是回家煎熬地傻等。虽然没有百分百的准确率，但下面这些“征兆”能一定程度上说明状况：\r\n\r\n1.“回去等消息，如果一周内你还没有收到通知，你可以考虑其它工作。”\r\n\r\n潜台词：对不起，你没有通过面试。\r\n\r\n通常业务面结束后面试官对你说这句话，90%情况是没有满足面试官的要求，面试官也是人，不好意思当面给你泼冷水，制造尴尬。不要傻傻的等了，抓紧时间看其它工作机会，除非你对自己面试中的发挥有绝对的自信。\r\n\r\n同理“本周还有几个面试者，面完了会给你消息”基本也是类似的结局。也有可能作为“备胎”，在没有合适人选的情况下再来找你。\r\n\r\nBoss在遇到真正满意的求职者时，担心被别的公司截胡，会尽快跟公司人事沟通去安排后续面试，一般会与你约定比较临近的时间，比如当天就进行后续面试，或1-3天内通知。 \r\n\r\n2.“我给你讲一下我们现在的基本情况…”。\r\n\r\n潜台词：我们很好，欢迎加入我们。\r\n\r\n面试快结束的时候，面试官主动向你详细地介绍公司、部门现状，希望通过有竞争力的工作内容、和谐的部门关系、公司的优势甚至是好的福利来吸引你加入他们。\r\n\r\n主动介绍现在情况，也是希望让满意的求职者能更早地认清未来的工作情况，避免出现求职者入职前后期望差距较大造成的心理落差，待不了多久就离职，反而耽误双方的时间。\r\n\r\n3.花大量的时间回答你的问题，面试超时。\r\n\r\n潜台词：我对你很上心。\r\n\r\n通常面试最后面试官都会给你反问的时间，面试官若对你比较满意，就愿意花时间深入地解答你的问题，甚至会确认你对答案是否认同或与你讨论这个问题。\r\n\r\n反之，若面试官不满意你之前的表现，尽管给了你提问的机会，但三两句话回答草草了事，毕竟没人愿意在没结果的事上浪费时间。\r\n\r\n4.“接下来你是否还有其他的面试安排？”\r\n\r\n潜台词：看看有没有公司和我抢人/能不能压低薪资?\r\n\r\n当面试官特别对你感兴趣时，通常会担心有别的雇主挖走你，所以会问你后续的面试及时间安排。 \r\n\r\n如果有相关行业其他公司的面试邀请，坦率的讲出来没有关系，可以提升一定的竞争力，让面试官认为你很抢手，并且更愿意尽快与你敲定后续面试或发放offer的时间。但不要说很多其它行业公司的面试安排，这样会显的你求职的目标性很弱，没有想好要去哪个行业，即便录用你，你也可能因琐事辞职。\r\n\r\n如果没有其他的面试安排或到手的offer，也不要心虚，可以讲：贵公司是我求职的第一目标，我非常喜欢贵司的产品/企业文化，所以我第一时间申请贵公司的职位，目前还没有投其他公司。表达决心和态度也是面试中很好的加分项，但不排除有些面试官发现你没有“退路”，因此在谈薪资时压价。\r\n\r\neafc7384032cff31a80028d09b85d459.png\r\n\r\n PART.2 从面试官的潜台词中识别“渣公司” \r\n\r\n薪酬福利是多数求职者在考虑一个工作时最主要的考虑因素，也是企业招揽人才的核心竞争力。当求职者提问：公司有什么福利？不少公司的招聘者就用“巧妙”的回答套路他们。\r\n\r\n（以下案例经过改编，如有雷同，请招聘者反思）\r\n\r\n1.“我们有薪资+五险一金+带薪休假+职位晋升”\r\n\r\n潜台词: 什么福利都没有哦。\r\n\r\n以上面试官提到这些“福利”是绝大多数合规企业都会提供的内容。薪资和职位晋升不必多说，五险一金和带薪休假是国家规定企业必需提供的，都是有法可循的，所以拿这些当做福利来讲显然是偷梁换柱的行为。\r\n\r\n2.“我们有免费的三餐。”\r\n\r\n潜台词：早晚都得在公司加班。\r\n\r\n免费三餐听起来还是很诱人，但很多包三餐的公司都需要加班。仔细想想朝9晚5或朝10晚6的工作好像并不需要包三餐（有钱任性的和部分国企除外），所以包三餐算不算“福利”还是要根据实际情况掂量掂量。\r\n\r\n3.“我们有住房补贴，和交通补贴。”\r\n\r\n潜台词：不会告诉你需要“干满3年”“加班至11点”才能享有。\r\n\r\n有补贴不代表就一定能享受到补贴。发放住房补贴的公司，规定也各不相同，有的需要你入职满1/2/3…年才发，有的需要你租房地点离公司小于1km/2km（当然也是方便加班啦~）。\r\n\r\n很多公司需加班至晚9点、10点甚至11点后，才能享受交通补贴/免费打车等福利，最好提前问清楚。\r\n\r\n2bfaa87e26c54a7e58efa87786fe602c.png\r\n\r\n4.“我们是弹性工作制。”\r\n\r\n潜台词：没加班费，工作做完才能走。/上班不弹，下班往后弹。\r\n\r\n早上能睡懒觉是很多上班族的梦想，弹性工作制给大家带来了希望。可实际情况真的都是“早来早走，晚来晚走”吗？\r\n\r\n当然不是。不少上班族反应所谓的弹性工作制并没有实现，反而变成了上班时间长、加班时间更长。放着加班都干不完的工作，按时打卡下班就变成了奢望。', '2020-12-18 14:36:40', '13958726395', '/upload/newsIcon/2020-12-18-14-36-40353734-4.png');
INSERT INTO `news` VALUES ('6', '远程面试前做哪些准备工作才能顺利拿到Offer ', '疫情当下，目前有招聘需求的公司几乎都选择了“无接触式招聘”——所有招聘流程都在线上完成。而远程面试——视频/电话面试是其中最重要的环节。对很多还没有回国留学生来', '疫情当下，目前有招聘需求的公司几乎都选择了“无接触式招聘”——所有招聘流程都在线上完成。而远程面试——视频/电话面试是其中最重要的环节。对很多还没有回国留学生来讲，大批公司采用远程面试是一个比较好的机会，不用再纠结是否要飞回国面试，极大的节省了开支且提升了求职效率。远程面试和线下面试要注意的问题并不相同，但也没有很多同学想的那么复杂，做好应对策略，把握好“特殊时期”的求职机会。约克学长专门整理了这篇文章，向大家讲解“远程面试那些事儿”，包括面试前的准备工作和面试过程中的注意事项。\r\n\r\n远程面试要做哪些准备？远程面试的典型形式分为视频面试和电话面试。当你和面试官的接触方式变了，面试技巧也会和面对面接触的场景有些不同。学会利用这种场景变化，可以提高你的面试获胜率。\r\n\r\n1. 营造一个专业的面试环境\r\n\r\n面试应该是一个专业的、私密的环境，所以一定要找个安静的地方。避免面试沟通时出现其他的打扰情况。如家里有宠物的、小孩等，尽可能做一些避免打扰的准备或提前告知面试官。如果你是视频面试，那还要注意一下周围的光线不能过暗，能够看得清脸。得体的面试着装。在家面试不等于展示你在家的样子。最好着装正式，带淡妆，像互联网行业对穿着要求比较随意，你可以T恤、衬衫自然一些。\r\n\r\n2. 学会利用设备来帮助自己\r\n\r\n线上面试的体验有很多不可控的因素，比如电脑没声啊、面试很卡啊，虽然都是些小事儿，但是发生多了也挺影响面试体验的。在面试前，你需要提前控制变量因素，这也反应了你的职场素养高低，是否有规划管理的意识、能妥帖的做好安排。提前安装并测试面试软件、设备音画质量。最好使用耳机。保障交流传达的准确性。在旁边准备一台电脑。可以放上你的电子版简历，准备好的问题以及对应答案list，起到辅助回答的作用。也可以准备纸质版（不要总是去看准备的材料）。手机静音，电脑避免其它软件弹窗\r\n\r\n3. 遇到突击面试，注意以下这些点：\r\n\r\n学会记录自己投递的公司和岗位。避免接起电话时都不清楚是哪家公司，JD是什么。电话礼仪很重要。平时大大咧咧惯了，没有打过商务电话的同学，求职期间特别要养成一些基本的礼貌用语习惯，避免踩雷。主动选择面试时间。有一些同学一打电话发现是面试官就很紧张，装作说我没空之类，会显得非常不礼貌。就算你当下没有做好准备，也可以先告诉面试官“很抱歉现在不是很方便，是否可以约一个更适合的时间。比如今天下午2点，是否方便呢？”，主动去向面试官约时间，通常面试官都能表示理解。\r\n\r\n面试过程中的注意事项？\r\n\r\n1. 不可取少的远程面试礼仪\r\n\r\n远程面试的情绪传达是比较弱的，不如面对面沟通那么直接、强烈。这一端你的情绪要足够饱满、去带动面试官，从而留下一个好印象。\r\n\r\n保持微笑，表达重视：即使是电话面试，你在这边的微笑，也是能从语言中听出来的。换位思考，考虑对方的感受和体验：比如问一问是否声音清晰，切忌打断他人，最好是听清楚问题后，再回答。激昂的情绪：避免让面试官觉得你很麻木，问一句回一句，特别是在电话面试时，因为面试官看不到你的表情，只能从语气来判断你的状态。眼神交流：有些同学视频面试时不知道该往哪里看，或者总是去看自己准备的答题材料，眼神飘忽不定，这可能是重要的减分项。最好根据不同的设备提前找准自己在视频通话时的眼神落点，起到像面对面Eye contact一样的作用。学会表达感谢：面试结束的时候可以说“非常感谢您提供面试机会”\r\n\r\n2. 视频面试答题技巧：\r\n\r\n远程面试，少了很多诸如面对面的感觉、临场状态、肢体语言等影响条件，面试官更容易把考察精力集中在求职者的回答上。这就要求求职者必须注意两大问题：理解面试官问题的意图和有逻辑、有条理的回答问题。理解面试官的问题：抛开专业问题不谈，常见的面试问题都有会考察的点，回答问题之前弄明白问题的意图非常重要。不要急于回答面试官提出的问题，给自己3-5s中的停顿思考面试官提问的意图。 举例面试官问：“你未来的职业规划是什么？”是为了考察求职者的兴趣是否与岗位匹配，是否具有稳定性…因此就可以对应的进行回答。 再比如面试官问：“你为什么能胜任这个岗位”是想看你对这次机会是否足够重视，是否对岗位做了足够的了解，是否有特别的能力能承担相应的工作… \r\n\r\n如何有条理、有逻辑的回答面试问题：\r\n\r\n建议多使用STAR法则回答问题，既能让你组织答案有迹可循，也能让面试官听起来非常“舒服”。STAR法则，即Situation(情景)、Task(任务)、Action(行动)和Result(结果)。作为求职者，熟练使用STAR法则回答面试官的问题则会为你的答案加分不少。  拿面试常见问题举个例：讲讲你实习经历中的成功经历/讲一件你最成功的事， 先要一句话讲清楚你要讲什么事，（例：我举一个我进入某公司实习的第二个月，就定下双倍完成销售考核业绩的目标，且最终超额完成的故事）然后用STAR法则将故事完整的叙述下来。Situation & Task： 我在某公司实习时，每个实习生都有月销售目标。由于我被推举为实习生组长，我在第二个月时给自己定下了两倍于其他实习生的考核业绩的目标，希望发挥带头作用。Action：一开始我有点为自己定了如此高的目标后悔，因为从来没有实习生能完成这样的成绩。后来我明白不能坐以待毙，除了积极阅读像《阿里铁军》这样的书籍，去网上搜集并学习相关的销售技巧，还积极去找老员工取经，通过专门请教、日常闲聊等方式学习他们的销售经验，并自己改进了一套前期电话联系、中期微信巩固、后期线下达成的销售方法，效果非常明显。Result：最终依靠这个方法超额完成了两倍考核业绩的目标，受到了很多前辈的认可。我的方法论也被领导在部门周会上推广。这件事使我明白其实我有非常大的潜力，要勇于突破，不能安于现状。\r\n\r\n以上就是约克学长为大家梳理的远程/视频面试的攻略。虽然远程面试比起线下面试可控性没有那么强，且大家接触的机会少，但只要掌握好上述远程面试的这些技巧，相信面试可以在这个特殊时期能够“弯道超车”！', '2020-12-18 14:37:15', '13958726395', '/upload/newsIcon/2020-12-18-14-37-14468513-5.jpg');
INSERT INTO `news` VALUES ('7', '面试官故意刁难？解析压力面试的判断依据及应对策略', '面试经验丰富的同学应该都遇到过下列类似问题：“说说你的缺点吧？”，“你认为你比别的应聘者优秀在哪里？”，“你之前面了几个公司？为什么别人不要你呢？”，“你如何评价自', '面试经验丰富的同学应该都遇到过下列类似问题：“说说你的缺点吧？”，“你认为你比别的应聘者优秀在哪里？”，“你之前面了几个公司？为什么别人不要你呢？”，“你如何评价自己的今天面试表现？”……当遇到这样的题目，觉得怎么回答都不合适，说实话怕直接被刷，撒谎更是没有那种技能，心里不禁想到：你是不是故意刁难我，现在的面试官怎么都这样？非要把人面的不爽才可以吗？\r\n\r\n如果你碰到上面说到的这些情况，很可能是碰上了“压力面试”。\r\n\r\n其实，压力面由来已久，并且长期被结构面试采用，是面试官用来验证求职者“经验真实性”、“抗压能力”、“临场反应能力”的特殊形式。此种面试形式，几乎多数单面都会碰到，概率高，难度大，但也并非没有应对的办法。\r\n\r\n\r\n识破压力面试：常见的压力面试有哪些问法？\r\n\r\n1. 频繁追问细节，直至你答不出来为止…\r\n\r\n候选人在描述之前经历时提到了一些成就，面试官可能会问：具体说说你？如候选人说我曾写出了多篇爆款文案，面试官可能追问：有多少篇文章？获得了多少转发、点赞、评论？吸引了多少粉丝？带来了多少最终转化？等等问题。 \r\n\r\n2. 对你的成果进行否定，看似故意找茬\r\n\r\n如候选人跨行业应聘一家公司，面试官可说：你以前工作（实习）的都是xx行业，你在xx行业的工作经验对我们不适用啊，你觉得你能胜任现在工作吗？又或者表情严肃说：以你目前的经验，我认为胜任这个岗位有难度，你怎么认为？\r\n\r\n3. 直接指出候选人简历或者面试中的不足\r\n\r\n比如候选人自我评价善于沟通，逻辑能力强，面试官可说：通过刚才的面试，我发现你组织语言的能力一般般，几次说话都磕磕巴巴，并没有很好的沟通能力？又或者说：通过沟通，我发现你的逻辑不是很清楚，讲的有点混乱。\r\n\r\n4. 利用抽象问题或限制时间来制造压力\r\n\r\n“你认为自己表现的很好，可上司给你的考评一般，你会怎么做？”，“20秒内分别用3个词形容你的优点和缺点。”，“1分钟总结一下你今天的面试表现。”\r\n\r\n笔者曾经遇到过一些候选人，一到了压力面的环节，立刻情绪就绷不住了，思维也开始混乱，稍微遇到不清楚或者没考虑到的地方，直接大面积崩盘，明明是自己做过的事情，却显得不真实。在各大论坛面经分享中，也经常能看到有人分享经历：面试官故意针对我！面试官人很坏，故意刁难人…\r\n\r\n而事情真实的逻辑是这样的：\r\n\r\n1. 压力面仅是面试的方式的一种。面试官与你无冤无仇，既然已经通过了简历筛选将你叫来面试，自然是候选人简历里信息满足了公司的用人标准，那何必要故意刁难你浪费彼此的时间呢？想通这个道理，是放下心里压力的第一步。要相信所有问题都不会有超出常理的部分，更不会故意问你完全答不上或不着边际的问题。\r\n\r\n2. 只要是跟你经历相关的，就一定有解。如果一时没有思路，大可以说“是否我可以回忆一下，时间有些久了，可能有些细节记得不是特别清楚，我简单梳理一下思路”，首先让自己平静下来做一个思考，反而会显得你认真对待，而不是在慌乱中随意敷衍一个答案。\r\n\r\n3. 另外，就算遇到打压式的情景和问题，比如你是不是因为表现不好才没有在上家公司转正呢？一定要注意，不要抗拒、也不要逃避问题、抖机灵是会直接被刷掉的。同时注意表情管理，不要一瞬间就开始甩脸色，愁眉紧锁等。\r\n\r\n如何回击压力面试？\r\n\r\n情景一：面对轰炸式压力面，最重要的，就是把经历吃透。\r\n\r\n其实面试官都懂实习的含金量和水分，大多数实习都不可能是直接接触最核心的工作，但明明没有那么厉害，却把简历写的很高大上，那就是压力面的活靶子，不杠你杠谁呢？如果要面对盘根问底的回答，那你一定要把核心经历中的数字、规模、结果，具体做过的事项，进行一个深度的复盘和思考，不仅仅是记录下来做了什么就可以，而是能够将：如何做到的？怎么才能做得更好？总结出了什么可以复用的方法？这三个问题解答了，那这段经历，才算是扎实下来，怎么问都不害怕。\r\n\r\n情景二：让我们盘点一下最容易爆雷的三个题型\r\n\r\n1）缺点类型题目\r\n\r\n雷区：太实诚，想到什么说什么。以及，职场上不可原谅的缺点，就算有，也要立刻改，不能在这儿说。对于自己的缺点要撒谎吗？\r\n\r\n答案是否定的，因为每个人都有自己的劣势，但有一些劣势，是可以被职场接受，提供容错、提升的空间的，而有一些，却是触碰底线的。只要是不触碰底线的缺点，最好如实告知，也让面试官知道如果聘用你，会需要在什么地方注意与你合作时可能遇到的问题，如果他能接受，那么你们的合作就会比较顺畅。置于那些拖延、情绪、规则意识等问题，请自行改正，不要再出现在职场中。关于缺点类问题的具体解答思路，可以参考《面试官问你有什么缺点，机智的求职者都这样回答...》\r\n\r\n2）为何没转正留用？\r\n\r\n雷区：把自己的问题暴露或Diss上家公司。建议思路：从职业发展的匹配度来讲，但如果确实是因为没有headcount，也可以理解，可以如实告知。职业发展的话，可以通过企业的管理风格、文化、包括岗位的上升空间、通道等方式进行阐述。', '2020-12-18 14:38:01', '13958726395', '/upload/newsIcon/2020-12-18-14-38-01104651-6.png');
INSERT INTO `news` VALUES ('8', '外企面试技巧与8大高频问题解题思路 ', '外企可以说是留学生们最感兴趣的企业类型之一了，每年有大量的留学生进入或者尝试进入外企工作。选择去外企工作的主要原因，除了期待外企的工作环境、氛围，还有就是能', '\r\n\r\n外企可以说是留学生们最感兴趣的企业类型之一了，每年有大量的留学生进入或者尝试进入外企工作。选择去外企工作的主要原因，除了期待外企的工作环境、氛围，还有就是能发挥留学的语言优势。虽然很多留学生英语都讲的很溜，但面试毕竟不是一个完全靠临场发挥就能应对的事情，突然抛出的问题加上英语作答，老司机也可能翻车。小编梳理了应聘外企Entry-level岗位时8个常见的面试问题，并整理了回答范例和解题思路。准备去面试外企的同学们可以转发收藏，在面试前充分学习。\r\n\r\nQuestion1: Tell me about yourself\r\n\r\n【解题思路】外企面试官的思维和习惯与国内面试官有很显著的差异，所以不要照搬中文面试常用的那套自我介绍公式去讲，会显得过于平淡缺乏个性，且很难引起面试官的注意。比较好的方法是能提到一些与职业相关的兴趣爱好。\r\n\r\n【回答范例】The past few years, I’ve gotten really into geocaching. I love the challenge of finding caches and spending time outdoors with friends. I like using my problem-solving skills to find the ones that are really well-hidden. Learning how people hide things, and where people are likely to look, has helped me tremendously in my design work. It’s all about learning to see things through someone else’s eyes.\r\n\r\n【范例解析】这个回答通过介绍自己的经历和兴趣爱好，向面试官展示了从经历中学习的能力、团队协作能力、和敢于冒险拼搏的精神，这些品质对工作能起到重要的影响。\r\n\r\n【特别注意】1) 不要讲的太粗略，也不要过于详细。讲太少会显得放不开，而讲的太多则会太啰嗦，面试官不想了解关于你的每一件事。2) 不要提及一些关于政治、宗教等可能具有争议性的问题见解，因为面试官的看法可能会与你有较大分歧。3) 提及的兴趣爱好要尽可能与求职岗位有相关性。否则面试官会觉得你爱好众多会影响工作时间。4) 避免提到一些个人隐私信息，家庭、孩子、合作伙伴等等。\r\n\r\nQuestion2: Why do you want to change jobs\r\n\r\n【解题思路】面试官想了解你换工作的原因，并且想确定你不是因为表现不好、同事/上下级关系有问题等原因被迫离开上家公司的。当回答这个问题时重点是让面试官得到一个正面的原因，打消他们怀疑你是否因为糟糕的现状才选择跳槽的疑虑。如果你是被炒而换工作，那更需要提前准备这个问题，尝试把它转化成正面的原因。\r\n\r\n【回答范例】I was lucky enough to land a job at a startup right out of school, which means that I wore many hats right from my first day in the office. Now I’m looking forward to taking my graphic design skills into a senior role.\r\n\r\n【范例解析】求职者先是积极的介绍了自己在一个富有挑战的环境中得到了历练。然后强调了自己换工作的目的是在专业领域更进一步，表达了面试官想要的技能和态度。\r\n\r\n【特别注意】1）将换工作描述为一种职业生涯提升的路径，同时不要诋毁现在的工作。你也可以做好准备，表达清楚这份新工作更加符合自己的长期职业规划。2）可以将一些目前现有的工作的优点。这样既能表达你只是在一个好工作的基础上寻找更好的工作，又能让面试官明白你不是因为陷入窘境而跳槽。3）如果目前的工作状况不好，可以尝试用一些外部原因解释为什么换工作。比如新工作离家更近，通勤更方便等等。\r\n\r\nQuestion3: Tell me something not on your resume\r\n\r\n【解题思路】外企的面试官更偏向与使用一些open-ended question来考察面试者的应变能力、性格和隐藏能力，而不是全部根据简历提问，这能更好地确认求职者是不是契合岗位和公司。求职者可以通过讲一个简历上没写或隐性的优点、为什么申请这份工作、讲一个有与职业相关的兴趣爱好等来应对。\r\n\r\n【回答范例】You can see from my resume that my sales team exceeded its annual goal by 15%. One of the keys to that success was my willingness to go out on more sales calls with staff to help close deals with major clients. It meant more late evenings catching up on my administrative tasks, but it was well worth it.\r\n\r\n【范例解析】这个回答将简历中提到的点进行了展开补充，既讲的是简历上没有的内容，又提到了比较积极的工作品格。\r\n\r\n【特别注意】1）尽管是简历上没有的内容，依然要围绕申请的岗位进行回答，不要扯太远。2）真实地表述自己的性格、品格。当你回答自己的隐藏能力/性格时切忌编造，面试官阅人无数，不真实的表述相当于给自己挖坑，容易在追问下露出破绽，适得其反。3）不要讲负面内容，也不要太多废话。此类开放问题比较突兀，在回答前可以先组织语言，不要说我准备讲xxx，直奔主题简练的表达即可。\r\n\r\nQuestion4: How do you handle your failure\r\n\r\n【解题思路】每个工作中都有可能遇到失败或瓶颈，面试官都想知道求职者面对失败的反应。回答这个问题，你不需要过分详细的解释你是如何解决工作中遇到的问题，而是要表述你在困境中的思考和后续如何去做，同时体现出你不怕挑战的态度。也可以先交代一个你需要承担失败的场景，然后从中吸取的教训和如何确保之后避免相似的问题。\r\n\r\n【回答范例】I look to my professional colleagues in similar jobs and co-workers at my organization for suggestions on how to improve. I am aggressive about taking workshops, training seminars, and online tutorials to upgrade my skills.\r\n\r\n【范例解析】这个回答反应了求职者直面不足，积极向他人寻求帮助的态度。同时也表达了自己如何计划去进行提升，避免同样的错误。如果能在前边描述一个失败的具体案例就更好了。\r\n\r\n【特别注意】1）准备一个失败的案例，并讲述如何吸取教训，如何避免同样的失败。外企面试官喜欢根据你的案例进行深挖，所以一定要准备充分。这个案例最好不要离现在很近，否则面试官可能会将此和未来的工作联系起来。2）一定要讲从中吸取的经验和后续如何做，最好能将结果量化。比如“在我深入研究并做了更细致的预算后，为公司在后续活动上节约了15%的经费。”3）不要耍小聪明，把成功包装成失败。不要试图耍小聪明去讲“本来可以做的更好，但我只做了合格”的案例，面试官会很反感这种行为。\r\n\r\nQuestion5: Describe your typical work week/Describe a typical day in your job \r\n\r\n【解题思路】这是外企面试常见的一个问题。求职者回答这个问题可以向面试官展示自己以往的工作经验是否与应聘岗位相关，以及个人工作习惯和特质是否与公司吻合。如果求职者在应聘一家“996”公司时候描述了“955”公司的工作习惯，这就会显得不够契合。准备这个问题要在面试前提前了解新公司员工的工作状况，并思考自己当前工作与新工作的联系。\r\n\r\n【回答范例】During a typical work week, one of my biggest tasks is checking in on my staff and assessing progress on various projects. I like to meet first thing on Mondays to discuss our priorities for the week, then meet again in the middle of the week to check progress, and once at the end of the week to discuss goal setting for the next week. I meet with smaller groups of my staff in the middle of the week to troubleshoot any issues. I also attend a weekly meeting where I present my department’s progress to the executive board. On Fridays, I make sure all tasks are completed and I\'ve sent all the necessary communications via email and in person. Finally, I create a list of priorities for next week. \r\n\r\n【范例解析】求职者简洁、清晰地描述了一周的工作内容，时间点交代的很清楚，表现了他是一个做事计划性强，有条理的人。如果能在介绍时加入一些具体的案例细节会更有说服力。\r\n\r\n【特别注意】1）介绍时要结构清晰。最好是通过时间线把各项工作串联起来，切忌想到什么说什么。2）思考原工作与应聘工作的异同点，尽可能多说与现有工作有联系的内容，少讲没有关系的工作内容。\r\n\r\nQuestion6: Why did you choose your major?\r\n\r\n【解题思路】这个问题主要针对那些应聘实习或初级岗位的求职者。回答这个问题没有绝对对错之分，真实合理即可。但需要注意的是，回答这道问题也是展示你专业技能及兴趣爱好和应聘岗位契合的机会。在准备这道题时，可以先把自己在学校学的重要知识和技能列出来，与应聘岗位进行匹配，把可以匹配到的点在准备的答案中重点突出。 \r\n\r\n【回答范例】I chose to be a nutritionist because I have always felt that poor eating habits came from poor knowledge. I wanted to help people get healthy by teaching them about food, not telling them what they can and cannot eat. As an exercise science/nutrition major, I became an expert on getting and staying healthy, and I cannot wait to work with clients. I\'m looking forward to putting my excellent interpersonal skills and communication abilities to work, in addition to all that I\'ve learned from my courses.\r\n\r\n【范例解析】这个求职者的回答将所学专业与应聘岗位联系了起来。既表达了他对专业的热爱，也突显了他的主要能力。\r\n\r\n【特别注意】1）把所学专业、对专业的热爱与应聘岗位联系起来。2）表达出对所学专业的热情。每个招聘者都希望能招到对工作充满热情、主动性强的求职者。\r\n\r\nQuestion7: What is your greatest weakness\r\n\r\n【解题思路】面试官问突然问：说说你的缺点，给求职者施加一种压力，通常是为了看看求职者如何化解这个问题、是否能正确地审视自己，最重要的还是看求职者能否能胜任这个岗位。回答这个问题，你可以准备一些并不影响应聘岗位工作的技能缺陷或能力劣势，同时表明自己正在采取哪些措施进行改进和提升。\r\n\r\n【回答范例】Organization hasn’t always been my strongest point. I’ve always been inclined to prioritize tasks that directly impact the bottom line, and maintaining a pristine desk or an organized inbox didn’t seem to truly move the needle in terms of my output. Over time, I’ve learned that keeping a clean workspace—both physically, and digitally—does support my ability to focus and enhance the efficiency of my workflow. I’ve implemented a time management system that enables me to stay organized without encroaching on my other responsibilities.\r\n\r\n【范例解析】候选人先是明确了一个缺陷，然后交代了自己通过什么样的工作来解决这一缺陷。巧妙地化解了面试官设置的障碍，并把在回答中展示了自己处理问题问题的能力。\r\n\r\n【特别注意】1）不要编造。编造的回答很可能不符合你给面试官的印象，且面试官可能会根据你的答案继续深挖，很容易露馅，没必要在这里冒险。2）不要耍小聪明，把好的点当做坏的点讲。比如有人说自己的弱点是过分认真、钻牛角尖，这在面试官看来是非常幼稚的小把戏。3）不要讲的太多或说自己没有缺点。讲的太多可能影响面试官对你的看法，说自己没有缺点就过分自大了。\r\n\r\nQuesiton8: Do you work well with other people\r\n\r\n【解题思路】面试官想知道你是否能在工作中很好地与他人协作，毕竟糟糕的人际关系处理和团队协作能力会对整个团队带来的巨大的负面影响。求职者应不仅仅只是表达自己乐于与他人合作，更应举出一些与他人协作的经历体现自己在这方面的能力。\r\n\r\n【回答范例】Working on a number of team projects has allowed me to develop my ability to communicate clearly with others, and mediate conflicts between team members. For example, on a recent project, two of my teammates were having trouble reaching an agreement about how to approach an element of the project. I listened to each of their concerns and got everyone to sit down and come up with a solution that would satisfy everyone. Because of my ability to listen to others and mediate conflict, we were able to finish our project ahead of schedule, and even received commendation from our employer for the high quality of our work.\r\n\r\n【范例解析】该候选人的回答给出了一个清楚的案例展示自己沟通和化解分歧等团队协作能力，举例讲让回答非常有信服力。\r\n\r\n【特别注意】1)    团队协作、人际处理可能涉及到的一些能力：激励、帮助他人的能力；化解矛盾、冲突，引导大家达成一致的能力；倾听能力；分工协作的统筹能力；说话艺术等…2)    不要讲负面内容。比如提到因为自己态度问题和别人发生争执，后来化解了，这样可能给面试官带来担忧。\r\n\r\n以上就是小编为大家总结的8个应聘外企岗位时常见的面试问题，外企与国内企业的面试问题同种有异，侧重点和回答思路略有不同，在面试准备时不能完全按照中文面试的思路去做。祝大家早日拿到offer！\r\n', '2020-12-18 14:38:32', '13958726395', '/upload/newsIcon/2020-12-18-14-38-31775726-7.png');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addDate` datetime DEFAULT NULL,
  `hrId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '关于2020-04-02号java开发工程师面时结果通知', '录取的人员名单如下：陈霞、吴鹏、刘飞', '2020-04-02 19:38:02', '3');
INSERT INTO `notice` VALUES ('3', 'Test132', '123465789110', '2020-04-02 20:16:39', '3');
INSERT INTO `notice` VALUES ('4', 'Test', '123456', '2020-12-16 14:23:40', '6');
INSERT INTO `notice` VALUES ('5', '急需java后端技术一名', 'Test', '2020-12-17 10:30:04', '6');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `positionId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `requirement` longtext,
  `quantity` int(11) DEFAULT NULL,
  `workCity` varchar(50) DEFAULT NULL,
  `salaryUp` int(11) DEFAULT NULL,
  `salaryDown` int(11) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `validDate` date DEFAULT NULL,
  `statePub` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT '0',
  `categoryId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `hrIdPub` int(11) NOT NULL,
  PRIMARY KEY (`positionId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES ('37', '123', '123', '123', '123', '13', '123', '2020-04-03', '2020-04-03', '1', '6', '1', '7', '3');
INSERT INTO `positions` VALUES ('38', '招人', '都可以', '12', '重庆', '10000', '5000', '2020-04-03', '2020-04-03', '1', '4', '1', '1', '1');
INSERT INTO `positions` VALUES ('39', '人工智能研发工程师', '5年以上工作经验', '5', '上海', '50000', '10000', '2020-04-03', '2020-04-03', '1', '8', '5', '7', '3');
INSERT INTO `positions` VALUES ('40', 'python大数据研发工程师', '5年以上工作经验', '5', '武汉', '50000', '10000', '2020-04-08', null, '0', '2', '5', '7', '3');
INSERT INTO `positions` VALUES ('41', 'java爬虫工程师', '3年以上工作经验', '5', '上海', '30000', '7000', '2020-04-08', '2020-04-08', '1', '13', '1', '7', '3');
INSERT INTO `positions` VALUES ('42', '大数据分析师', '5年以上工作经验', '5', '北京', '1000000', '20000', '2020-04-09', '2020-04-09', '1', '1', '6', '7', '3');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `resumeId` int(11) NOT NULL AUTO_INCREMENT,
  `ability` longtext,
  `internship` longtext,
  `workExperience` longtext,
  `certificate` longtext,
  `jobDesire` longtext,
  `userId` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resumeId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES ('1', null, null, null, null, null, '1', '0');
INSERT INTO `resume` VALUES ('2', null, null, null, null, null, '2', '0');
INSERT INTO `resume` VALUES ('3', null, null, null, null, null, '3', '0');
INSERT INTO `resume` VALUES ('4', null, null, null, null, null, '4', '0');
INSERT INTO `resume` VALUES ('5', null, null, null, null, null, '5', '0');
INSERT INTO `resume` VALUES ('6', null, null, null, null, null, '6', '0');
INSERT INTO `resume` VALUES ('7', null, null, null, null, null, '7', '0');
INSERT INTO `resume` VALUES ('8', null, null, null, null, null, '8', '2');
INSERT INTO `resume` VALUES ('9', null, null, null, null, null, '9', '0');
INSERT INTO `resume` VALUES ('10', null, null, null, null, null, '10', '0');
INSERT INTO `resume` VALUES ('11', null, null, null, null, null, '11', '0');
INSERT INTO `resume` VALUES ('12', null, null, null, null, null, '12', '0');
INSERT INTO `resume` VALUES ('13', null, null, null, null, null, '13', '0');
INSERT INTO `resume` VALUES ('14', null, null, null, null, null, '14', '0');
INSERT INTO `resume` VALUES ('21', null, null, null, null, null, '21', '0');
INSERT INTO `resume` VALUES ('25', '专业能力么。。。也就能悄悄代码', '还没毕业，也没啥实习经历~', '无实际工作经历~', '拿过几次奖学金吧', '有一份别太累稳定的工作就好。。。', '25', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `password` varchar(500) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `eduDegree` varchar(50) DEFAULT NULL,
  `graduation` varchar(100) DEFAULT NULL,
  `graYear` int(11) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `dirDesire` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `user_id_UNIQUE` (`userId`),
  UNIQUE KEY `user_mobile_UNIQUE` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13754258565', '4QrcOUm6Wau+VuBX8g+IPg==', '夏高兴', '0', null, '云淡天高', 'xiagaoxin@163.com', '北京市', '北京市', '硕士', '中南财经政法大学', null, null, '3');
INSERT INTO `user` VALUES ('2', '16873315255', '4QrcOUm6Wau+VuBX8g+IPg==', '沈茂德', '0', null, '冷酷的云', 'shenmaode@163.com', '北京市', '北京市', '本科', '湖南师范大学', null, null, '3');
INSERT INTO `user` VALUES ('3', '16535356412', '4QrcOUm6Wau+VuBX8g+IPg==', '杜文瑞', '0', null, '我心寂寞', 'duwenrui@163.com', '上海市', '上海市', '本科', '东北财经大学', null, null, '1');
INSERT INTO `user` VALUES ('4', '15785658371', '4QrcOUm6Wau+VuBX8g+IPg==', '彭友卉', '0', null, '尘封记忆', 'pengyouhui@163.com', '上海市', '上海市', '本科', '西南大学', null, null, '2');
INSERT INTO `user` VALUES ('5', '16735259632', '4QrcOUm6Wau+VuBX8g+IPg==', '崔谷槐', '0', null, '飘雪无垠', 'cuiguhuai@163.com', '上海市', '上海市', '本科', '苏州大学', null, null, '2');
INSERT INTO `user` VALUES ('6', '17898763255', '4QrcOUm6Wau+VuBX8g+IPg==', '魏茂材', '0', null, '风过无痕', 'weimaocai@163.com', '广东省', '广州市', '本科', '西北大学', null, null, '6');
INSERT INTO `user` VALUES ('7', '17563522636', '4QrcOUm6Wau+VuBX8g+IPg==', '侯成文', '0', '1997', '星月相随', 'huochengwen', '湖北省', '武汉市', '硕士', '上海财经大学', '2019', '国际金融', '3');
INSERT INTO `user` VALUES ('8', '18936258863', '4QrcOUm6Wau+VuBX8g+IPg==', '邵夜云', '1', null, '低调沉默者', 'shaoyeyun@163.com', '北京市', '北京市', '本科', '江苏大学', null, null, '2');
INSERT INTO `user` VALUES ('9', '13752533625', '4QrcOUm6Wau+VuBX8g+IPg==', '方彭湃', '1', null, '梦醒童话', 'fangpengpai@163.com', '天津市', '天津市', '硕士', '西南政法大学', null, null, '4');
INSERT INTO `user` VALUES ('10', '15763968252', '4QrcOUm6Wau+VuBX8g+IPg==', '熊新觉', '1', null, '咖啡的味道', 'xiongxinjue@163.com', '广东省', '广州市', '本科', '重庆医科大学', null, null, '3');
INSERT INTO `user` VALUES ('11', '13685259986', '4QrcOUm6Wau+VuBX8g+IPg==', '肖又香', '1', null, '悬世尘埃', 'xiaoyouxiang@163.com', '浙江省', '杭州市', '大专', '福建师范大学', null, null, '2');
INSERT INTO `user` VALUES ('12', '15788875236', '4QrcOUm6Wau+VuBX8g+IPg==', '严经纶', '0', null, '冰封夕阳', 'yanjinlun@163.com', '浙江省', '杭州市', '本科', '广州中医药大学', null, null, '6');
INSERT INTO `user` VALUES ('13', '18766635865', '4QrcOUm6Wau+VuBX8g+IPg==', '邓和豫', '1', null, '隐水酣龙', 'dengheyu@163.com', '浙江省', '杭州市', '本科', '哈尔滨工程大学', null, null, '1');
INSERT INTO `user` VALUES ('14', '15623527861', '4QrcOUm6Wau+VuBX8g+IPg==', '邓雪风', '0', null, '一顿小皮锤', 'dengxuefeng@163.com', '江苏省', '南京市', '本科', '暨南大学', null, null, '4');
INSERT INTO `user` VALUES ('17', '15726928003', '4QrcOUm6Wau+VuBX8g+IPg==', '龟龟', '0', null, '龟龟', 'guigui@163.com', '广东省', '中山市', '本科', '华东理工大学', null, null, '0');
INSERT INTO `user` VALUES ('21', '13957336750', '4QrcOUm6Wau+VuBX8g+IPg==', '木木', '0', null, '木木', 'mumu@163.com', '湖北省', '武汉市', '本科', '天津科技大学', null, null, '0');
INSERT INTO `user` VALUES ('24', '17863954768', '4QrcOUm6Wau+VuBX8g+IPg==', '轩', '0', '1997', '轩', 'xuan@163.com', '山东省', '青岛市', '本科', '青岛科技大学', '2019', '软件工程', '2');
INSERT INTO `user` VALUES ('25', '17812345687', '4QrcOUm6Wau+VuBX8g+IPg==', '青柠', '0', '1997', '青柠', 'babycoder@foxmail.com', '浙江省', '杭州市', '本科', '青岛科技大学', '2019', '软件', '1');
INSERT INTO `user` VALUES ('26', '123456789', '4QrcOUm6Wau+VuBX8g+IPg==', null, '0', '0', '梁康毅', null, null, null, null, null, '0', null, '0');
