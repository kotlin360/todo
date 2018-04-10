/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : savaboon

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-10 19:38:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `td_admin`
-- ----------------------------
DROP TABLE IF EXISTS `td_admin`;
CREATE TABLE `td_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `loginnum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of td_admin
-- ----------------------------
INSERT INTO `td_admin` VALUES ('1', 'admin', '218dbb225911693af03a713581a7227f', '267', '127.0.0.1', '1523320840', 'admin', '1');
INSERT INTO `td_admin` VALUES ('9', 'tjl', '218dbb225911693af03a713581a7227f', '18', '0.0.0.0', '1477140627', '田建龙', '1');
INSERT INTO `td_admin` VALUES ('13', 'test', '218dbb225911693af03a713581a7227f', '0', '', '0', 'bfg', '1');
INSERT INTO `td_admin` VALUES ('15', 'test123', 'ebbd202c239d6fc65061ae22a13c1b69', '0', '', '0', 'dddd', '1');
INSERT INTO `td_admin` VALUES ('18', 'shichang', '218dbb225911693af03a713581a7227f', '1', '127.0.0.1', '1522122615', '市场1', '0');
INSERT INTO `td_admin` VALUES ('19', 'test1', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试', '1');
INSERT INTO `td_admin` VALUES ('20', 'test2', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试2', '0');
INSERT INTO `td_admin` VALUES ('21', 'test3', '218dbb225911693af03a713581a7227f', '0', '', '0', '11', '1');
INSERT INTO `td_admin` VALUES ('22', 'test4', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试', '1');
INSERT INTO `td_admin` VALUES ('23', 'test5', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试5', '1');
INSERT INTO `td_admin` VALUES ('24', 'test6', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试6', '1');
INSERT INTO `td_admin` VALUES ('25', 'test7', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试7', '1');
INSERT INTO `td_admin` VALUES ('26', 'test8', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试8', '1');
INSERT INTO `td_admin` VALUES ('27', 'test9', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试9', '1');
INSERT INTO `td_admin` VALUES ('29', 'test10', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试10', '1');
INSERT INTO `td_admin` VALUES ('30', 'test11', '218dbb225911693af03a713581a7227f', '0', '', '0', '测试11', '1');

-- ----------------------------
-- Table structure for `td_area`
-- ----------------------------
DROP TABLE IF EXISTS `td_area`;
CREATE TABLE `td_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=910011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_area
-- ----------------------------
INSERT INTO `td_area` VALUES ('110000', '北京市', '0', '1');
INSERT INTO `td_area` VALUES ('120000', '天津市', '0', '2');
INSERT INTO `td_area` VALUES ('130000', '河北省', '0', '3');
INSERT INTO `td_area` VALUES ('140000', '山西省', '0', '4');
INSERT INTO `td_area` VALUES ('150000', '内蒙古', '0', '5');
INSERT INTO `td_area` VALUES ('210000', '辽宁省', '0', '6');
INSERT INTO `td_area` VALUES ('220000', '吉林省', '0', '7');
INSERT INTO `td_area` VALUES ('230000', '黑龙江', '0', '8');
INSERT INTO `td_area` VALUES ('310000', '上海市', '0', '9');
INSERT INTO `td_area` VALUES ('320000', '江苏省', '0', '10');
INSERT INTO `td_area` VALUES ('330000', '浙江省', '0', '11');
INSERT INTO `td_area` VALUES ('340000', '安徽省', '0', '12');
INSERT INTO `td_area` VALUES ('350000', '福建省', '0', '13');
INSERT INTO `td_area` VALUES ('360000', '江西省', '0', '14');
INSERT INTO `td_area` VALUES ('370000', '山东省', '0', '15');
INSERT INTO `td_area` VALUES ('410000', '河南省', '0', '16');
INSERT INTO `td_area` VALUES ('420000', '湖北省', '0', '17');
INSERT INTO `td_area` VALUES ('430000', '湖南省', '0', '18');
INSERT INTO `td_area` VALUES ('440000', '广东省', '0', '19');
INSERT INTO `td_area` VALUES ('450000', '广西省', '0', '20');
INSERT INTO `td_area` VALUES ('460000', '海南省', '0', '21');
INSERT INTO `td_area` VALUES ('500000', '重庆市', '0', '22');
INSERT INTO `td_area` VALUES ('510000', '四川省', '0', '23');
INSERT INTO `td_area` VALUES ('520000', '贵州省', '0', '24');
INSERT INTO `td_area` VALUES ('530000', '云南省', '0', '25');
INSERT INTO `td_area` VALUES ('540000', '西　藏', '0', '26');
INSERT INTO `td_area` VALUES ('610000', '陕西省', '0', '27');
INSERT INTO `td_area` VALUES ('620000', '甘肃省', '0', '28');
INSERT INTO `td_area` VALUES ('630000', '青海省', '0', '29');
INSERT INTO `td_area` VALUES ('640000', '宁　夏', '0', '30');
INSERT INTO `td_area` VALUES ('650000', '新　疆', '0', '31');
INSERT INTO `td_area` VALUES ('710000', '台湾省', '0', '32');
INSERT INTO `td_area` VALUES ('810000', '香　港', '0', '33');
INSERT INTO `td_area` VALUES ('820000', '澳　门', '0', '34');
INSERT INTO `td_area` VALUES ('110100', '北京市', '110000', '1');
INSERT INTO `td_area` VALUES ('110200', '县', '110000', '2');
INSERT INTO `td_area` VALUES ('120100', '市辖区', '120000', '1');
INSERT INTO `td_area` VALUES ('120200', '县', '120000', '2');
INSERT INTO `td_area` VALUES ('130100', '石家庄市', '130000', '1');
INSERT INTO `td_area` VALUES ('130200', '唐山市', '130000', '2');
INSERT INTO `td_area` VALUES ('130300', '秦皇岛市', '130000', '3');
INSERT INTO `td_area` VALUES ('130400', '邯郸市', '130000', '4');
INSERT INTO `td_area` VALUES ('130500', '邢台市', '130000', '5');
INSERT INTO `td_area` VALUES ('130600', '保定市', '130000', '6');
INSERT INTO `td_area` VALUES ('130700', '张家口市', '130000', '7');
INSERT INTO `td_area` VALUES ('130800', '承德市', '130000', '8');
INSERT INTO `td_area` VALUES ('130900', '沧州市', '130000', '9');
INSERT INTO `td_area` VALUES ('131000', '廊坊市', '130000', '10');
INSERT INTO `td_area` VALUES ('131100', '衡水市', '130000', '11');
INSERT INTO `td_area` VALUES ('140100', '太原市', '140000', '1');
INSERT INTO `td_area` VALUES ('140200', '大同市', '140000', '2');
INSERT INTO `td_area` VALUES ('140300', '阳泉市', '140000', '3');
INSERT INTO `td_area` VALUES ('140400', '长治市', '140000', '4');
INSERT INTO `td_area` VALUES ('140500', '晋城市', '140000', '5');
INSERT INTO `td_area` VALUES ('140600', '朔州市', '140000', '6');
INSERT INTO `td_area` VALUES ('140700', '晋中市', '140000', '7');
INSERT INTO `td_area` VALUES ('140800', '运城市', '140000', '8');
INSERT INTO `td_area` VALUES ('140900', '忻州市', '140000', '9');
INSERT INTO `td_area` VALUES ('141000', '临汾市', '140000', '10');
INSERT INTO `td_area` VALUES ('141100', '吕梁市', '140000', '11');
INSERT INTO `td_area` VALUES ('150100', '呼和浩特市', '150000', '1');
INSERT INTO `td_area` VALUES ('150200', '包头市', '150000', '2');
INSERT INTO `td_area` VALUES ('150300', '乌海市', '150000', '3');
INSERT INTO `td_area` VALUES ('150400', '赤峰市', '150000', '4');
INSERT INTO `td_area` VALUES ('150500', '通辽市', '150000', '5');
INSERT INTO `td_area` VALUES ('150600', '鄂尔多斯市', '150000', '6');
INSERT INTO `td_area` VALUES ('150700', '呼伦贝尔市', '150000', '7');
INSERT INTO `td_area` VALUES ('150800', '巴彦淖尔市', '150000', '8');
INSERT INTO `td_area` VALUES ('150900', '乌兰察布市', '150000', '9');
INSERT INTO `td_area` VALUES ('152200', '兴安盟', '150000', '10');
INSERT INTO `td_area` VALUES ('152500', '锡林郭勒盟', '150000', '11');
INSERT INTO `td_area` VALUES ('152900', '阿拉善盟', '150000', '12');
INSERT INTO `td_area` VALUES ('210100', '沈阳市', '210000', '1');
INSERT INTO `td_area` VALUES ('210200', '大连市', '210000', '2');
INSERT INTO `td_area` VALUES ('210300', '鞍山市', '210000', '3');
INSERT INTO `td_area` VALUES ('210400', '抚顺市', '210000', '4');
INSERT INTO `td_area` VALUES ('210500', '本溪市', '210000', '5');
INSERT INTO `td_area` VALUES ('210600', '丹东市', '210000', '6');
INSERT INTO `td_area` VALUES ('210700', '锦州市', '210000', '7');
INSERT INTO `td_area` VALUES ('210800', '营口市', '210000', '8');
INSERT INTO `td_area` VALUES ('210900', '阜新市', '210000', '9');
INSERT INTO `td_area` VALUES ('211000', '辽阳市', '210000', '10');
INSERT INTO `td_area` VALUES ('211100', '盘锦市', '210000', '11');
INSERT INTO `td_area` VALUES ('211200', '铁岭市', '210000', '12');
INSERT INTO `td_area` VALUES ('211300', '朝阳市', '210000', '13');
INSERT INTO `td_area` VALUES ('211400', '葫芦岛市', '210000', '14');
INSERT INTO `td_area` VALUES ('220100', '长春市', '220000', '1');
INSERT INTO `td_area` VALUES ('220200', '吉林市', '220000', '2');
INSERT INTO `td_area` VALUES ('220300', '四平市', '220000', '3');
INSERT INTO `td_area` VALUES ('220400', '辽源市', '220000', '4');
INSERT INTO `td_area` VALUES ('220500', '通化市', '220000', '5');
INSERT INTO `td_area` VALUES ('220600', '白山市', '220000', '6');
INSERT INTO `td_area` VALUES ('220700', '松原市', '220000', '7');
INSERT INTO `td_area` VALUES ('220800', '白城市', '220000', '8');
INSERT INTO `td_area` VALUES ('222400', '延边朝鲜族自治州', '220000', '9');
INSERT INTO `td_area` VALUES ('230100', '哈尔滨市', '230000', '1');
INSERT INTO `td_area` VALUES ('230200', '齐齐哈尔市', '230000', '2');
INSERT INTO `td_area` VALUES ('230300', '鸡西市', '230000', '3');
INSERT INTO `td_area` VALUES ('230400', '鹤岗市', '230000', '4');
INSERT INTO `td_area` VALUES ('230500', '双鸭山市', '230000', '5');
INSERT INTO `td_area` VALUES ('230600', '大庆市', '230000', '6');
INSERT INTO `td_area` VALUES ('230700', '伊春市', '230000', '7');
INSERT INTO `td_area` VALUES ('230800', '佳木斯市', '230000', '8');
INSERT INTO `td_area` VALUES ('230900', '七台河市', '230000', '9');
INSERT INTO `td_area` VALUES ('231000', '牡丹江市', '230000', '10');
INSERT INTO `td_area` VALUES ('231100', '黑河市', '230000', '11');
INSERT INTO `td_area` VALUES ('231200', '绥化市', '230000', '12');
INSERT INTO `td_area` VALUES ('232700', '大兴安岭地区', '230000', '13');
INSERT INTO `td_area` VALUES ('310100', '市辖区', '310000', '1');
INSERT INTO `td_area` VALUES ('310200', '县', '310000', '2');
INSERT INTO `td_area` VALUES ('320100', '南京市', '320000', '1');
INSERT INTO `td_area` VALUES ('320200', '无锡市', '320000', '2');
INSERT INTO `td_area` VALUES ('320300', '徐州市', '320000', '3');
INSERT INTO `td_area` VALUES ('320400', '常州市', '320000', '4');
INSERT INTO `td_area` VALUES ('320500', '苏州市', '320000', '5');
INSERT INTO `td_area` VALUES ('320600', '南通市', '320000', '6');
INSERT INTO `td_area` VALUES ('320700', '连云港市', '320000', '7');
INSERT INTO `td_area` VALUES ('320800', '淮安市', '320000', '8');
INSERT INTO `td_area` VALUES ('320900', '盐城市', '320000', '9');
INSERT INTO `td_area` VALUES ('321000', '扬州市', '320000', '10');
INSERT INTO `td_area` VALUES ('321100', '镇江市', '320000', '11');
INSERT INTO `td_area` VALUES ('321200', '泰州市', '320000', '12');
INSERT INTO `td_area` VALUES ('321300', '宿迁市', '320000', '13');
INSERT INTO `td_area` VALUES ('330100', '杭州市', '330000', '1');
INSERT INTO `td_area` VALUES ('330200', '宁波市', '330000', '2');
INSERT INTO `td_area` VALUES ('330300', '温州市', '330000', '3');
INSERT INTO `td_area` VALUES ('330400', '嘉兴市', '330000', '4');
INSERT INTO `td_area` VALUES ('330500', '湖州市', '330000', '5');
INSERT INTO `td_area` VALUES ('330600', '绍兴市', '330000', '6');
INSERT INTO `td_area` VALUES ('330700', '金华市', '330000', '7');
INSERT INTO `td_area` VALUES ('330800', '衢州市', '330000', '8');
INSERT INTO `td_area` VALUES ('330900', '舟山市', '330000', '9');
INSERT INTO `td_area` VALUES ('331000', '台州市', '330000', '10');
INSERT INTO `td_area` VALUES ('331100', '丽水市', '330000', '11');
INSERT INTO `td_area` VALUES ('340100', '合肥市', '340000', '1');
INSERT INTO `td_area` VALUES ('340200', '芜湖市', '340000', '2');
INSERT INTO `td_area` VALUES ('340300', '蚌埠市', '340000', '3');
INSERT INTO `td_area` VALUES ('340400', '淮南市', '340000', '4');
INSERT INTO `td_area` VALUES ('340500', '马鞍山市', '340000', '5');
INSERT INTO `td_area` VALUES ('340600', '淮北市', '340000', '6');
INSERT INTO `td_area` VALUES ('340700', '铜陵市', '340000', '7');
INSERT INTO `td_area` VALUES ('340800', '安庆市', '340000', '8');
INSERT INTO `td_area` VALUES ('341000', '黄山市', '340000', '9');
INSERT INTO `td_area` VALUES ('341100', '滁州市', '340000', '10');
INSERT INTO `td_area` VALUES ('341200', '阜阳市', '340000', '11');
INSERT INTO `td_area` VALUES ('341300', '宿州市', '340000', '12');
INSERT INTO `td_area` VALUES ('341500', '六安市', '340000', '13');
INSERT INTO `td_area` VALUES ('341600', '亳州市', '340000', '14');
INSERT INTO `td_area` VALUES ('341700', '池州市', '340000', '15');
INSERT INTO `td_area` VALUES ('341800', '宣城市', '340000', '16');
INSERT INTO `td_area` VALUES ('350100', '福州市', '350000', '1');
INSERT INTO `td_area` VALUES ('350200', '厦门市', '350000', '2');
INSERT INTO `td_area` VALUES ('350300', '莆田市', '350000', '3');
INSERT INTO `td_area` VALUES ('350400', '三明市', '350000', '4');
INSERT INTO `td_area` VALUES ('350500', '泉州市', '350000', '5');
INSERT INTO `td_area` VALUES ('350600', '漳州市', '350000', '6');
INSERT INTO `td_area` VALUES ('350700', '南平市', '350000', '7');
INSERT INTO `td_area` VALUES ('350800', '龙岩市', '350000', '8');
INSERT INTO `td_area` VALUES ('350900', '宁德市', '350000', '9');
INSERT INTO `td_area` VALUES ('360100', '南昌市', '360000', '1');
INSERT INTO `td_area` VALUES ('360200', '景德镇市', '360000', '2');
INSERT INTO `td_area` VALUES ('360300', '萍乡市', '360000', '3');
INSERT INTO `td_area` VALUES ('360400', '九江市', '360000', '4');
INSERT INTO `td_area` VALUES ('360500', '新余市', '360000', '5');
INSERT INTO `td_area` VALUES ('360600', '鹰潭市', '360000', '6');
INSERT INTO `td_area` VALUES ('360700', '赣州市', '360000', '7');
INSERT INTO `td_area` VALUES ('360800', '吉安市', '360000', '8');
INSERT INTO `td_area` VALUES ('360900', '宜春市', '360000', '9');
INSERT INTO `td_area` VALUES ('361000', '抚州市', '360000', '10');
INSERT INTO `td_area` VALUES ('361100', '上饶市', '360000', '11');
INSERT INTO `td_area` VALUES ('370100', '济南市', '370000', '1');
INSERT INTO `td_area` VALUES ('370200', '青岛市', '370000', '2');
INSERT INTO `td_area` VALUES ('370300', '淄博市', '370000', '3');
INSERT INTO `td_area` VALUES ('370400', '枣庄市', '370000', '4');
INSERT INTO `td_area` VALUES ('370500', '东营市', '370000', '5');
INSERT INTO `td_area` VALUES ('370600', '烟台市', '370000', '6');
INSERT INTO `td_area` VALUES ('370700', '潍坊市', '370000', '7');
INSERT INTO `td_area` VALUES ('370800', '济宁市', '370000', '8');
INSERT INTO `td_area` VALUES ('370900', '泰安市', '370000', '9');
INSERT INTO `td_area` VALUES ('371000', '威海市', '370000', '10');
INSERT INTO `td_area` VALUES ('371100', '日照市', '370000', '11');
INSERT INTO `td_area` VALUES ('371200', '莱芜市', '370000', '12');
INSERT INTO `td_area` VALUES ('371300', '临沂市', '370000', '13');
INSERT INTO `td_area` VALUES ('371400', '德州市', '370000', '14');
INSERT INTO `td_area` VALUES ('371500', '聊城市', '370000', '15');
INSERT INTO `td_area` VALUES ('371600', '滨州市', '370000', '16');
INSERT INTO `td_area` VALUES ('371700', '菏泽市', '370000', '17');
INSERT INTO `td_area` VALUES ('410100', '郑州市', '410000', '1');
INSERT INTO `td_area` VALUES ('410200', '开封市', '410000', '2');
INSERT INTO `td_area` VALUES ('410300', '洛阳市', '410000', '3');
INSERT INTO `td_area` VALUES ('410400', '平顶山市', '410000', '4');
INSERT INTO `td_area` VALUES ('410500', '安阳市', '410000', '5');
INSERT INTO `td_area` VALUES ('410600', '鹤壁市', '410000', '6');
INSERT INTO `td_area` VALUES ('410700', '新乡市', '410000', '7');
INSERT INTO `td_area` VALUES ('410800', '焦作市', '410000', '8');
INSERT INTO `td_area` VALUES ('410900', '濮阳市', '410000', '9');
INSERT INTO `td_area` VALUES ('411000', '许昌市', '410000', '10');
INSERT INTO `td_area` VALUES ('411100', '漯河市', '410000', '11');
INSERT INTO `td_area` VALUES ('411200', '三门峡市', '410000', '12');
INSERT INTO `td_area` VALUES ('411300', '南阳市', '410000', '13');
INSERT INTO `td_area` VALUES ('411400', '商丘市', '410000', '14');
INSERT INTO `td_area` VALUES ('411500', '信阳市', '410000', '15');
INSERT INTO `td_area` VALUES ('411600', '周口市', '410000', '16');
INSERT INTO `td_area` VALUES ('411700', '驻马店市', '410000', '17');
INSERT INTO `td_area` VALUES ('420100', '武汉市', '420000', '1');
INSERT INTO `td_area` VALUES ('420200', '黄石市', '420000', '2');
INSERT INTO `td_area` VALUES ('420300', '十堰市', '420000', '3');
INSERT INTO `td_area` VALUES ('420500', '宜昌市', '420000', '4');
INSERT INTO `td_area` VALUES ('420600', '襄樊市', '420000', '5');
INSERT INTO `td_area` VALUES ('420700', '鄂州市', '420000', '6');
INSERT INTO `td_area` VALUES ('420800', '荆门市', '420000', '7');
INSERT INTO `td_area` VALUES ('420900', '孝感市', '420000', '8');
INSERT INTO `td_area` VALUES ('421000', '荆州市', '420000', '9');
INSERT INTO `td_area` VALUES ('421100', '黄冈市', '420000', '10');
INSERT INTO `td_area` VALUES ('421200', '咸宁市', '420000', '11');
INSERT INTO `td_area` VALUES ('421300', '随州市', '420000', '12');
INSERT INTO `td_area` VALUES ('422800', '恩施土家族苗族自治州', '420000', '13');
INSERT INTO `td_area` VALUES ('429000', '省直辖行政单位', '420000', '14');
INSERT INTO `td_area` VALUES ('430100', '长沙市', '430000', '1');
INSERT INTO `td_area` VALUES ('430200', '株洲市', '430000', '2');
INSERT INTO `td_area` VALUES ('430300', '湘潭市', '430000', '3');
INSERT INTO `td_area` VALUES ('430400', '衡阳市', '430000', '4');
INSERT INTO `td_area` VALUES ('430500', '邵阳市', '430000', '5');
INSERT INTO `td_area` VALUES ('430600', '岳阳市', '430000', '6');
INSERT INTO `td_area` VALUES ('430700', '常德市', '430000', '7');
INSERT INTO `td_area` VALUES ('430800', '张家界市', '430000', '8');
INSERT INTO `td_area` VALUES ('430900', '益阳市', '430000', '9');
INSERT INTO `td_area` VALUES ('431000', '郴州市', '430000', '10');
INSERT INTO `td_area` VALUES ('431100', '永州市', '430000', '11');
INSERT INTO `td_area` VALUES ('431200', '怀化市', '430000', '12');
INSERT INTO `td_area` VALUES ('431300', '娄底市', '430000', '13');
INSERT INTO `td_area` VALUES ('433100', '湘西土家族苗族自治州', '430000', '14');
INSERT INTO `td_area` VALUES ('440100', '广州市', '440000', '1');
INSERT INTO `td_area` VALUES ('440200', '韶关市', '440000', '2');
INSERT INTO `td_area` VALUES ('440300', '深圳市', '440000', '3');
INSERT INTO `td_area` VALUES ('440400', '珠海市', '440000', '4');
INSERT INTO `td_area` VALUES ('440500', '汕头市', '440000', '5');
INSERT INTO `td_area` VALUES ('440600', '佛山市', '440000', '6');
INSERT INTO `td_area` VALUES ('440700', '江门市', '440000', '7');
INSERT INTO `td_area` VALUES ('440800', '湛江市', '440000', '8');
INSERT INTO `td_area` VALUES ('440900', '茂名市', '440000', '9');
INSERT INTO `td_area` VALUES ('441200', '肇庆市', '440000', '10');
INSERT INTO `td_area` VALUES ('441300', '惠州市', '440000', '11');
INSERT INTO `td_area` VALUES ('441400', '梅州市', '440000', '12');
INSERT INTO `td_area` VALUES ('441500', '汕尾市', '440000', '13');
INSERT INTO `td_area` VALUES ('441600', '河源市', '440000', '14');
INSERT INTO `td_area` VALUES ('441700', '阳江市', '440000', '15');
INSERT INTO `td_area` VALUES ('441800', '清远市', '440000', '16');
INSERT INTO `td_area` VALUES ('441900', '东莞市', '440000', '17');
INSERT INTO `td_area` VALUES ('442000', '中山市', '440000', '18');
INSERT INTO `td_area` VALUES ('445100', '潮州市', '440000', '19');
INSERT INTO `td_area` VALUES ('445200', '揭阳市', '440000', '20');
INSERT INTO `td_area` VALUES ('445300', '云浮市', '440000', '21');
INSERT INTO `td_area` VALUES ('450100', '南宁市', '450000', '1');
INSERT INTO `td_area` VALUES ('450200', '柳州市', '450000', '2');
INSERT INTO `td_area` VALUES ('450300', '桂林市', '450000', '3');
INSERT INTO `td_area` VALUES ('450400', '梧州市', '450000', '4');
INSERT INTO `td_area` VALUES ('450500', '北海市', '450000', '5');
INSERT INTO `td_area` VALUES ('450600', '防城港市', '450000', '6');
INSERT INTO `td_area` VALUES ('450700', '钦州市', '450000', '7');
INSERT INTO `td_area` VALUES ('450800', '贵港市', '450000', '8');
INSERT INTO `td_area` VALUES ('450900', '玉林市', '450000', '9');
INSERT INTO `td_area` VALUES ('451000', '百色市', '450000', '10');
INSERT INTO `td_area` VALUES ('451100', '贺州市', '450000', '11');
INSERT INTO `td_area` VALUES ('451200', '河池市', '450000', '12');
INSERT INTO `td_area` VALUES ('451300', '来宾市', '450000', '13');
INSERT INTO `td_area` VALUES ('451400', '崇左市', '450000', '14');
INSERT INTO `td_area` VALUES ('460100', '海口市', '460000', '1');
INSERT INTO `td_area` VALUES ('460200', '三亚市', '460000', '2');
INSERT INTO `td_area` VALUES ('469000', '省直辖县级行政单位', '460000', '3');
INSERT INTO `td_area` VALUES ('500100', '市辖区', '500000', '1');
INSERT INTO `td_area` VALUES ('500200', '县', '500000', '2');
INSERT INTO `td_area` VALUES ('500300', '市', '500000', '3');
INSERT INTO `td_area` VALUES ('510100', '成都市', '510000', '1');
INSERT INTO `td_area` VALUES ('510300', '自贡市', '510000', '2');
INSERT INTO `td_area` VALUES ('510400', '攀枝花市', '510000', '3');
INSERT INTO `td_area` VALUES ('510500', '泸州市', '510000', '4');
INSERT INTO `td_area` VALUES ('510600', '德阳市', '510000', '5');
INSERT INTO `td_area` VALUES ('510700', '绵阳市', '510000', '6');
INSERT INTO `td_area` VALUES ('510800', '广元市', '510000', '7');
INSERT INTO `td_area` VALUES ('510900', '遂宁市', '510000', '8');
INSERT INTO `td_area` VALUES ('511000', '内江市', '510000', '9');
INSERT INTO `td_area` VALUES ('511100', '乐山市', '510000', '10');
INSERT INTO `td_area` VALUES ('511300', '南充市', '510000', '11');
INSERT INTO `td_area` VALUES ('511400', '眉山市', '510000', '12');
INSERT INTO `td_area` VALUES ('511500', '宜宾市', '510000', '13');
INSERT INTO `td_area` VALUES ('511600', '广安市', '510000', '14');
INSERT INTO `td_area` VALUES ('511700', '达州市', '510000', '15');
INSERT INTO `td_area` VALUES ('511800', '雅安市', '510000', '16');
INSERT INTO `td_area` VALUES ('511900', '巴中市', '510000', '17');
INSERT INTO `td_area` VALUES ('512000', '资阳市', '510000', '18');
INSERT INTO `td_area` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '19');
INSERT INTO `td_area` VALUES ('513300', '甘孜藏族自治州', '510000', '20');
INSERT INTO `td_area` VALUES ('513400', '凉山彝族自治州', '510000', '21');
INSERT INTO `td_area` VALUES ('520100', '贵阳市', '520000', '1');
INSERT INTO `td_area` VALUES ('520200', '六盘水市', '520000', '2');
INSERT INTO `td_area` VALUES ('520300', '遵义市', '520000', '3');
INSERT INTO `td_area` VALUES ('520400', '安顺市', '520000', '4');
INSERT INTO `td_area` VALUES ('522200', '铜仁地区', '520000', '5');
INSERT INTO `td_area` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '6');
INSERT INTO `td_area` VALUES ('522400', '毕节地区', '520000', '7');
INSERT INTO `td_area` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '8');
INSERT INTO `td_area` VALUES ('522700', '黔南布依族苗族自治州', '520000', '9');
INSERT INTO `td_area` VALUES ('530100', '昆明市', '530000', '1');
INSERT INTO `td_area` VALUES ('530300', '曲靖市', '530000', '2');
INSERT INTO `td_area` VALUES ('530400', '玉溪市', '530000', '3');
INSERT INTO `td_area` VALUES ('530500', '保山市', '530000', '4');
INSERT INTO `td_area` VALUES ('530600', '昭通市', '530000', '5');
INSERT INTO `td_area` VALUES ('530700', '丽江市', '530000', '6');
INSERT INTO `td_area` VALUES ('530800', '思茅市', '530000', '7');
INSERT INTO `td_area` VALUES ('530900', '临沧市', '530000', '8');
INSERT INTO `td_area` VALUES ('532300', '楚雄彝族自治州', '530000', '9');
INSERT INTO `td_area` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '10');
INSERT INTO `td_area` VALUES ('532600', '文山壮族苗族自治州', '530000', '11');
INSERT INTO `td_area` VALUES ('532800', '西双版纳傣族自治州', '530000', '12');
INSERT INTO `td_area` VALUES ('532900', '大理白族自治州', '530000', '13');
INSERT INTO `td_area` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '14');
INSERT INTO `td_area` VALUES ('533300', '怒江傈僳族自治州', '530000', '15');
INSERT INTO `td_area` VALUES ('533400', '迪庆藏族自治州', '530000', '16');
INSERT INTO `td_area` VALUES ('540100', '拉萨市', '540000', '1');
INSERT INTO `td_area` VALUES ('542100', '昌都地区', '540000', '2');
INSERT INTO `td_area` VALUES ('542200', '山南地区', '540000', '3');
INSERT INTO `td_area` VALUES ('542300', '日喀则地区', '540000', '4');
INSERT INTO `td_area` VALUES ('542400', '那曲地区', '540000', '5');
INSERT INTO `td_area` VALUES ('542500', '阿里地区', '540000', '6');
INSERT INTO `td_area` VALUES ('542600', '林芝地区', '540000', '7');
INSERT INTO `td_area` VALUES ('610100', '西安市', '610000', '1');
INSERT INTO `td_area` VALUES ('610200', '铜川市', '610000', '2');
INSERT INTO `td_area` VALUES ('610300', '宝鸡市', '610000', '3');
INSERT INTO `td_area` VALUES ('610400', '咸阳市', '610000', '4');
INSERT INTO `td_area` VALUES ('610500', '渭南市', '610000', '5');
INSERT INTO `td_area` VALUES ('610600', '延安市', '610000', '6');
INSERT INTO `td_area` VALUES ('610700', '汉中市', '610000', '7');
INSERT INTO `td_area` VALUES ('610800', '榆林市', '610000', '8');
INSERT INTO `td_area` VALUES ('610900', '安康市', '610000', '9');
INSERT INTO `td_area` VALUES ('611000', '商洛市', '610000', '10');
INSERT INTO `td_area` VALUES ('620100', '兰州市', '620000', '1');
INSERT INTO `td_area` VALUES ('620200', '嘉峪关市', '620000', '2');
INSERT INTO `td_area` VALUES ('620300', '金昌市', '620000', '3');
INSERT INTO `td_area` VALUES ('620400', '白银市', '620000', '4');
INSERT INTO `td_area` VALUES ('620500', '天水市', '620000', '5');
INSERT INTO `td_area` VALUES ('620600', '武威市', '620000', '6');
INSERT INTO `td_area` VALUES ('620700', '张掖市', '620000', '7');
INSERT INTO `td_area` VALUES ('620800', '平凉市', '620000', '8');
INSERT INTO `td_area` VALUES ('620900', '酒泉市', '620000', '9');
INSERT INTO `td_area` VALUES ('621000', '庆阳市', '620000', '10');
INSERT INTO `td_area` VALUES ('621100', '定西市', '620000', '11');
INSERT INTO `td_area` VALUES ('621200', '陇南市', '620000', '12');
INSERT INTO `td_area` VALUES ('622900', '临夏回族自治州', '620000', '13');
INSERT INTO `td_area` VALUES ('623000', '甘南藏族自治州', '620000', '14');
INSERT INTO `td_area` VALUES ('630100', '西宁市', '630000', '1');
INSERT INTO `td_area` VALUES ('632100', '海东地区', '630000', '2');
INSERT INTO `td_area` VALUES ('632200', '海北藏族自治州', '630000', '3');
INSERT INTO `td_area` VALUES ('632300', '黄南藏族自治州', '630000', '4');
INSERT INTO `td_area` VALUES ('632500', '海南藏族自治州', '630000', '5');
INSERT INTO `td_area` VALUES ('632600', '果洛藏族自治州', '630000', '6');
INSERT INTO `td_area` VALUES ('632700', '玉树藏族自治州', '630000', '7');
INSERT INTO `td_area` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '8');
INSERT INTO `td_area` VALUES ('640100', '银川市', '640000', '1');
INSERT INTO `td_area` VALUES ('640200', '石嘴山市', '640000', '2');
INSERT INTO `td_area` VALUES ('640300', '吴忠市', '640000', '3');
INSERT INTO `td_area` VALUES ('640400', '固原市', '640000', '4');
INSERT INTO `td_area` VALUES ('640500', '中卫市', '640000', '5');
INSERT INTO `td_area` VALUES ('650100', '乌鲁木齐市', '650000', '1');
INSERT INTO `td_area` VALUES ('650200', '克拉玛依市', '650000', '2');
INSERT INTO `td_area` VALUES ('652100', '吐鲁番地区', '650000', '3');
INSERT INTO `td_area` VALUES ('652200', '哈密地区', '650000', '4');
INSERT INTO `td_area` VALUES ('652300', '昌吉回族自治州', '650000', '5');
INSERT INTO `td_area` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '6');
INSERT INTO `td_area` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '7');
INSERT INTO `td_area` VALUES ('652900', '阿克苏地区', '650000', '8');
INSERT INTO `td_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '9');
INSERT INTO `td_area` VALUES ('653100', '喀什地区', '650000', '10');
INSERT INTO `td_area` VALUES ('653200', '和田地区', '650000', '11');
INSERT INTO `td_area` VALUES ('654000', '伊犁哈萨克自治州', '650000', '12');
INSERT INTO `td_area` VALUES ('654200', '塔城地区', '650000', '13');
INSERT INTO `td_area` VALUES ('654300', '阿勒泰地区', '650000', '14');
INSERT INTO `td_area` VALUES ('659000', '省直辖行政单位', '650000', '15');
INSERT INTO `td_area` VALUES ('110101', '东城区', '110100', '1');
INSERT INTO `td_area` VALUES ('110102', '西城区', '110100', '2');
INSERT INTO `td_area` VALUES ('110103', '崇文区', '110100', '3');
INSERT INTO `td_area` VALUES ('110104', '宣武区', '110100', '4');
INSERT INTO `td_area` VALUES ('110105', '朝阳区', '110100', '5');
INSERT INTO `td_area` VALUES ('110106', '丰台区', '110100', '6');
INSERT INTO `td_area` VALUES ('110107', '石景山区', '110100', '7');
INSERT INTO `td_area` VALUES ('110108', '海淀区', '110100', '8');
INSERT INTO `td_area` VALUES ('110109', '门头沟区', '110100', '9');
INSERT INTO `td_area` VALUES ('110111', '房山区', '110100', '10');
INSERT INTO `td_area` VALUES ('110112', '通州区', '110100', '11');
INSERT INTO `td_area` VALUES ('110113', '顺义区', '110100', '12');
INSERT INTO `td_area` VALUES ('110114', '昌平区', '110100', '13');
INSERT INTO `td_area` VALUES ('110115', '大兴区', '110100', '14');
INSERT INTO `td_area` VALUES ('110116', '怀柔区', '110100', '15');
INSERT INTO `td_area` VALUES ('110117', '平谷区', '110100', '16');
INSERT INTO `td_area` VALUES ('110228', '密云县', '110200', '1');
INSERT INTO `td_area` VALUES ('110229', '延庆县', '110200', '2');
INSERT INTO `td_area` VALUES ('120101', '和平区', '120100', '1');
INSERT INTO `td_area` VALUES ('120102', '河东区', '120100', '2');
INSERT INTO `td_area` VALUES ('120103', '河西区', '120100', '3');
INSERT INTO `td_area` VALUES ('120104', '南开区', '120100', '4');
INSERT INTO `td_area` VALUES ('120105', '河北区', '120100', '5');
INSERT INTO `td_area` VALUES ('120106', '红桥区', '120100', '6');
INSERT INTO `td_area` VALUES ('120107', '塘沽区', '120100', '7');
INSERT INTO `td_area` VALUES ('120108', '汉沽区', '120100', '8');
INSERT INTO `td_area` VALUES ('120109', '大港区', '120100', '9');
INSERT INTO `td_area` VALUES ('120110', '东丽区', '120100', '10');
INSERT INTO `td_area` VALUES ('120111', '西青区', '120100', '11');
INSERT INTO `td_area` VALUES ('120112', '津南区', '120100', '12');
INSERT INTO `td_area` VALUES ('120113', '北辰区', '120100', '13');
INSERT INTO `td_area` VALUES ('120114', '武清区', '120100', '14');
INSERT INTO `td_area` VALUES ('120115', '宝坻区', '120100', '15');
INSERT INTO `td_area` VALUES ('120221', '宁河县', '120200', '1');
INSERT INTO `td_area` VALUES ('120223', '静海县', '120200', '2');
INSERT INTO `td_area` VALUES ('120225', '蓟　县', '120200', '3');
INSERT INTO `td_area` VALUES ('130101', '市辖区', '130100', '1');
INSERT INTO `td_area` VALUES ('130102', '长安区', '130100', '2');
INSERT INTO `td_area` VALUES ('130103', '桥东区', '130100', '3');
INSERT INTO `td_area` VALUES ('130104', '桥西区', '130100', '4');
INSERT INTO `td_area` VALUES ('130105', '新华区', '130100', '5');
INSERT INTO `td_area` VALUES ('130107', '井陉矿区', '130100', '6');
INSERT INTO `td_area` VALUES ('130108', '裕华区', '130100', '7');
INSERT INTO `td_area` VALUES ('130121', '井陉县', '130100', '8');
INSERT INTO `td_area` VALUES ('130123', '正定县', '130100', '9');
INSERT INTO `td_area` VALUES ('130124', '栾城县', '130100', '10');
INSERT INTO `td_area` VALUES ('130125', '行唐县', '130100', '11');
INSERT INTO `td_area` VALUES ('130126', '灵寿县', '130100', '12');
INSERT INTO `td_area` VALUES ('130127', '高邑县', '130100', '13');
INSERT INTO `td_area` VALUES ('130128', '深泽县', '130100', '14');
INSERT INTO `td_area` VALUES ('130129', '赞皇县', '130100', '15');
INSERT INTO `td_area` VALUES ('130130', '无极县', '130100', '16');
INSERT INTO `td_area` VALUES ('130131', '平山县', '130100', '17');
INSERT INTO `td_area` VALUES ('130132', '元氏县', '130100', '18');
INSERT INTO `td_area` VALUES ('130133', '赵　县', '130100', '19');
INSERT INTO `td_area` VALUES ('130181', '辛集市', '130100', '20');
INSERT INTO `td_area` VALUES ('130182', '藁城市', '130100', '21');
INSERT INTO `td_area` VALUES ('130183', '晋州市', '130100', '22');
INSERT INTO `td_area` VALUES ('130184', '新乐市', '130100', '23');
INSERT INTO `td_area` VALUES ('130185', '鹿泉市', '130100', '24');
INSERT INTO `td_area` VALUES ('130201', '市辖区', '130200', '1');
INSERT INTO `td_area` VALUES ('130202', '路南区', '130200', '2');
INSERT INTO `td_area` VALUES ('130203', '路北区', '130200', '3');
INSERT INTO `td_area` VALUES ('130204', '古冶区', '130200', '4');
INSERT INTO `td_area` VALUES ('130205', '开平区', '130200', '5');
INSERT INTO `td_area` VALUES ('130207', '丰南区', '130200', '6');
INSERT INTO `td_area` VALUES ('130208', '丰润区', '130200', '7');
INSERT INTO `td_area` VALUES ('130223', '滦　县', '130200', '8');
INSERT INTO `td_area` VALUES ('130224', '滦南县', '130200', '9');
INSERT INTO `td_area` VALUES ('130225', '乐亭县', '130200', '10');
INSERT INTO `td_area` VALUES ('130227', '迁西县', '130200', '11');
INSERT INTO `td_area` VALUES ('130229', '玉田县', '130200', '12');
INSERT INTO `td_area` VALUES ('130230', '唐海县', '130200', '13');
INSERT INTO `td_area` VALUES ('130281', '遵化市', '130200', '14');
INSERT INTO `td_area` VALUES ('130283', '迁安市', '130200', '15');
INSERT INTO `td_area` VALUES ('130301', '市辖区', '130300', '1');
INSERT INTO `td_area` VALUES ('130302', '海港区', '130300', '2');
INSERT INTO `td_area` VALUES ('130303', '山海关区', '130300', '3');
INSERT INTO `td_area` VALUES ('130304', '北戴河区', '130300', '4');
INSERT INTO `td_area` VALUES ('130321', '青龙满族自治县', '130300', '5');
INSERT INTO `td_area` VALUES ('130322', '昌黎县', '130300', '6');
INSERT INTO `td_area` VALUES ('130323', '抚宁县', '130300', '7');
INSERT INTO `td_area` VALUES ('130324', '卢龙县', '130300', '8');
INSERT INTO `td_area` VALUES ('130401', '市辖区', '130400', '1');
INSERT INTO `td_area` VALUES ('130402', '邯山区', '130400', '2');
INSERT INTO `td_area` VALUES ('130403', '丛台区', '130400', '3');
INSERT INTO `td_area` VALUES ('130404', '复兴区', '130400', '4');
INSERT INTO `td_area` VALUES ('130406', '峰峰矿区', '130400', '5');
INSERT INTO `td_area` VALUES ('130421', '邯郸县', '130400', '6');
INSERT INTO `td_area` VALUES ('130423', '临漳县', '130400', '7');
INSERT INTO `td_area` VALUES ('130424', '成安县', '130400', '8');
INSERT INTO `td_area` VALUES ('130425', '大名县', '130400', '9');
INSERT INTO `td_area` VALUES ('130426', '涉　县', '130400', '10');
INSERT INTO `td_area` VALUES ('130427', '磁　县', '130400', '11');
INSERT INTO `td_area` VALUES ('130428', '肥乡县', '130400', '12');
INSERT INTO `td_area` VALUES ('130429', '永年县', '130400', '13');
INSERT INTO `td_area` VALUES ('130430', '邱　县', '130400', '14');
INSERT INTO `td_area` VALUES ('130431', '鸡泽县', '130400', '15');
INSERT INTO `td_area` VALUES ('130432', '广平县', '130400', '16');
INSERT INTO `td_area` VALUES ('130433', '馆陶县', '130400', '17');
INSERT INTO `td_area` VALUES ('130434', '魏　县', '130400', '18');
INSERT INTO `td_area` VALUES ('130435', '曲周县', '130400', '19');
INSERT INTO `td_area` VALUES ('130481', '武安市', '130400', '20');
INSERT INTO `td_area` VALUES ('130501', '市辖区', '130500', '1');
INSERT INTO `td_area` VALUES ('130502', '桥东区', '130500', '2');
INSERT INTO `td_area` VALUES ('130503', '桥西区', '130500', '3');
INSERT INTO `td_area` VALUES ('130521', '邢台县', '130500', '4');
INSERT INTO `td_area` VALUES ('130522', '临城县', '130500', '5');
INSERT INTO `td_area` VALUES ('130523', '内丘县', '130500', '6');
INSERT INTO `td_area` VALUES ('130524', '柏乡县', '130500', '7');
INSERT INTO `td_area` VALUES ('130525', '隆尧县', '130500', '8');
INSERT INTO `td_area` VALUES ('130526', '任　县', '130500', '9');
INSERT INTO `td_area` VALUES ('130527', '南和县', '130500', '10');
INSERT INTO `td_area` VALUES ('130528', '宁晋县', '130500', '11');
INSERT INTO `td_area` VALUES ('130529', '巨鹿县', '130500', '12');
INSERT INTO `td_area` VALUES ('130530', '新河县', '130500', '13');
INSERT INTO `td_area` VALUES ('130531', '广宗县', '130500', '14');
INSERT INTO `td_area` VALUES ('130532', '平乡县', '130500', '15');
INSERT INTO `td_area` VALUES ('130533', '威　县', '130500', '16');
INSERT INTO `td_area` VALUES ('130534', '清河县', '130500', '17');
INSERT INTO `td_area` VALUES ('130535', '临西县', '130500', '18');
INSERT INTO `td_area` VALUES ('130581', '南宫市', '130500', '19');
INSERT INTO `td_area` VALUES ('130582', '沙河市', '130500', '20');
INSERT INTO `td_area` VALUES ('130601', '市辖区', '130600', '1');
INSERT INTO `td_area` VALUES ('130602', '新市区', '130600', '2');
INSERT INTO `td_area` VALUES ('130603', '北市区', '130600', '3');
INSERT INTO `td_area` VALUES ('130604', '南市区', '130600', '4');
INSERT INTO `td_area` VALUES ('130621', '满城县', '130600', '5');
INSERT INTO `td_area` VALUES ('130622', '清苑县', '130600', '6');
INSERT INTO `td_area` VALUES ('130623', '涞水县', '130600', '7');
INSERT INTO `td_area` VALUES ('130624', '阜平县', '130600', '8');
INSERT INTO `td_area` VALUES ('130625', '徐水县', '130600', '9');
INSERT INTO `td_area` VALUES ('130626', '定兴县', '130600', '10');
INSERT INTO `td_area` VALUES ('130627', '唐　县', '130600', '11');
INSERT INTO `td_area` VALUES ('130628', '高阳县', '130600', '12');
INSERT INTO `td_area` VALUES ('130629', '容城县', '130600', '13');
INSERT INTO `td_area` VALUES ('130630', '涞源县', '130600', '14');
INSERT INTO `td_area` VALUES ('130631', '望都县', '130600', '15');
INSERT INTO `td_area` VALUES ('130632', '安新县', '130600', '16');
INSERT INTO `td_area` VALUES ('130633', '易　县', '130600', '17');
INSERT INTO `td_area` VALUES ('130634', '曲阳县', '130600', '18');
INSERT INTO `td_area` VALUES ('130635', '蠡　县', '130600', '19');
INSERT INTO `td_area` VALUES ('130636', '顺平县', '130600', '20');
INSERT INTO `td_area` VALUES ('130637', '博野县', '130600', '21');
INSERT INTO `td_area` VALUES ('130638', '雄　县', '130600', '22');
INSERT INTO `td_area` VALUES ('130681', '涿州市', '130600', '23');
INSERT INTO `td_area` VALUES ('130682', '定州市', '130600', '24');
INSERT INTO `td_area` VALUES ('130683', '安国市', '130600', '25');
INSERT INTO `td_area` VALUES ('130684', '高碑店市', '130600', '26');
INSERT INTO `td_area` VALUES ('130701', '市辖区', '130700', '1');
INSERT INTO `td_area` VALUES ('130702', '桥东区', '130700', '2');
INSERT INTO `td_area` VALUES ('130703', '桥西区', '130700', '3');
INSERT INTO `td_area` VALUES ('130705', '宣化区', '130700', '4');
INSERT INTO `td_area` VALUES ('130706', '下花园区', '130700', '5');
INSERT INTO `td_area` VALUES ('130721', '宣化县', '130700', '6');
INSERT INTO `td_area` VALUES ('130722', '张北县', '130700', '7');
INSERT INTO `td_area` VALUES ('130723', '康保县', '130700', '8');
INSERT INTO `td_area` VALUES ('130724', '沽源县', '130700', '9');
INSERT INTO `td_area` VALUES ('130725', '尚义县', '130700', '10');
INSERT INTO `td_area` VALUES ('130726', '蔚　县', '130700', '11');
INSERT INTO `td_area` VALUES ('130727', '阳原县', '130700', '12');
INSERT INTO `td_area` VALUES ('130728', '怀安县', '130700', '13');
INSERT INTO `td_area` VALUES ('130729', '万全县', '130700', '14');
INSERT INTO `td_area` VALUES ('130730', '怀来县', '130700', '15');
INSERT INTO `td_area` VALUES ('130731', '涿鹿县', '130700', '16');
INSERT INTO `td_area` VALUES ('130732', '赤城县', '130700', '17');
INSERT INTO `td_area` VALUES ('130733', '崇礼县', '130700', '18');
INSERT INTO `td_area` VALUES ('130801', '市辖区', '130800', '1');
INSERT INTO `td_area` VALUES ('130802', '双桥区', '130800', '2');
INSERT INTO `td_area` VALUES ('130803', '双滦区', '130800', '3');
INSERT INTO `td_area` VALUES ('130804', '鹰手营子矿区', '130800', '4');
INSERT INTO `td_area` VALUES ('130821', '承德县', '130800', '5');
INSERT INTO `td_area` VALUES ('130822', '兴隆县', '130800', '6');
INSERT INTO `td_area` VALUES ('130823', '平泉县', '130800', '7');
INSERT INTO `td_area` VALUES ('130824', '滦平县', '130800', '8');
INSERT INTO `td_area` VALUES ('130825', '隆化县', '130800', '9');
INSERT INTO `td_area` VALUES ('130826', '丰宁满族自治县', '130800', '10');
INSERT INTO `td_area` VALUES ('130827', '宽城满族自治县', '130800', '11');
INSERT INTO `td_area` VALUES ('130828', '围场满族蒙古族自治县', '130800', '12');
INSERT INTO `td_area` VALUES ('130901', '市辖区', '130900', '1');
INSERT INTO `td_area` VALUES ('130902', '新华区', '130900', '2');
INSERT INTO `td_area` VALUES ('130903', '运河区', '130900', '3');
INSERT INTO `td_area` VALUES ('130921', '沧　县', '130900', '4');
INSERT INTO `td_area` VALUES ('130922', '青　县', '130900', '5');
INSERT INTO `td_area` VALUES ('130923', '东光县', '130900', '6');
INSERT INTO `td_area` VALUES ('130924', '海兴县', '130900', '7');
INSERT INTO `td_area` VALUES ('130925', '盐山县', '130900', '8');
INSERT INTO `td_area` VALUES ('130926', '肃宁县', '130900', '9');
INSERT INTO `td_area` VALUES ('130927', '南皮县', '130900', '10');
INSERT INTO `td_area` VALUES ('130928', '吴桥县', '130900', '11');
INSERT INTO `td_area` VALUES ('130929', '献　县', '130900', '12');
INSERT INTO `td_area` VALUES ('130930', '孟村回族自治县', '130900', '13');
INSERT INTO `td_area` VALUES ('130981', '泊头市', '130900', '14');
INSERT INTO `td_area` VALUES ('130982', '任丘市', '130900', '15');
INSERT INTO `td_area` VALUES ('130983', '黄骅市', '130900', '16');
INSERT INTO `td_area` VALUES ('130984', '河间市', '130900', '17');
INSERT INTO `td_area` VALUES ('131001', '市辖区', '131000', '1');
INSERT INTO `td_area` VALUES ('131002', '安次区', '131000', '2');
INSERT INTO `td_area` VALUES ('131003', '广阳区', '131000', '3');
INSERT INTO `td_area` VALUES ('131022', '固安县', '131000', '4');
INSERT INTO `td_area` VALUES ('131023', '永清县', '131000', '5');
INSERT INTO `td_area` VALUES ('131024', '香河县', '131000', '6');
INSERT INTO `td_area` VALUES ('131025', '大城县', '131000', '7');
INSERT INTO `td_area` VALUES ('131026', '文安县', '131000', '8');
INSERT INTO `td_area` VALUES ('131028', '大厂回族自治县', '131000', '9');
INSERT INTO `td_area` VALUES ('131081', '霸州市', '131000', '10');
INSERT INTO `td_area` VALUES ('131082', '三河市', '131000', '11');
INSERT INTO `td_area` VALUES ('131101', '市辖区', '131100', '1');
INSERT INTO `td_area` VALUES ('131102', '桃城区', '131100', '2');
INSERT INTO `td_area` VALUES ('131121', '枣强县', '131100', '3');
INSERT INTO `td_area` VALUES ('131122', '武邑县', '131100', '4');
INSERT INTO `td_area` VALUES ('131123', '武强县', '131100', '5');
INSERT INTO `td_area` VALUES ('131124', '饶阳县', '131100', '6');
INSERT INTO `td_area` VALUES ('131125', '安平县', '131100', '7');
INSERT INTO `td_area` VALUES ('131126', '故城县', '131100', '8');
INSERT INTO `td_area` VALUES ('131127', '景　县', '131100', '9');
INSERT INTO `td_area` VALUES ('131128', '阜城县', '131100', '10');
INSERT INTO `td_area` VALUES ('131181', '冀州市', '131100', '11');
INSERT INTO `td_area` VALUES ('131182', '深州市', '131100', '12');
INSERT INTO `td_area` VALUES ('140101', '市辖区', '140100', '1');
INSERT INTO `td_area` VALUES ('140105', '小店区', '140100', '2');
INSERT INTO `td_area` VALUES ('140106', '迎泽区', '140100', '3');
INSERT INTO `td_area` VALUES ('140107', '杏花岭区', '140100', '4');
INSERT INTO `td_area` VALUES ('140108', '尖草坪区', '140100', '5');
INSERT INTO `td_area` VALUES ('140109', '万柏林区', '140100', '6');
INSERT INTO `td_area` VALUES ('140110', '晋源区', '140100', '7');
INSERT INTO `td_area` VALUES ('140121', '清徐县', '140100', '8');
INSERT INTO `td_area` VALUES ('140122', '阳曲县', '140100', '9');
INSERT INTO `td_area` VALUES ('140123', '娄烦县', '140100', '10');
INSERT INTO `td_area` VALUES ('140181', '古交市', '140100', '11');
INSERT INTO `td_area` VALUES ('140201', '市辖区', '140200', '1');
INSERT INTO `td_area` VALUES ('140202', '城　区', '140200', '2');
INSERT INTO `td_area` VALUES ('140203', '矿　区', '140200', '3');
INSERT INTO `td_area` VALUES ('140211', '南郊区', '140200', '4');
INSERT INTO `td_area` VALUES ('140212', '新荣区', '140200', '5');
INSERT INTO `td_area` VALUES ('140221', '阳高县', '140200', '6');
INSERT INTO `td_area` VALUES ('140222', '天镇县', '140200', '7');
INSERT INTO `td_area` VALUES ('140223', '广灵县', '140200', '8');
INSERT INTO `td_area` VALUES ('140224', '灵丘县', '140200', '9');
INSERT INTO `td_area` VALUES ('140225', '浑源县', '140200', '10');
INSERT INTO `td_area` VALUES ('140226', '左云县', '140200', '11');
INSERT INTO `td_area` VALUES ('140227', '大同县', '140200', '12');
INSERT INTO `td_area` VALUES ('140301', '市辖区', '140300', '1');
INSERT INTO `td_area` VALUES ('140302', '城　区', '140300', '2');
INSERT INTO `td_area` VALUES ('140303', '矿　区', '140300', '3');
INSERT INTO `td_area` VALUES ('140311', '郊　区', '140300', '4');
INSERT INTO `td_area` VALUES ('140321', '平定县', '140300', '5');
INSERT INTO `td_area` VALUES ('140322', '盂　县', '140300', '6');
INSERT INTO `td_area` VALUES ('140401', '市辖区', '140400', '1');
INSERT INTO `td_area` VALUES ('140402', '城　区', '140400', '2');
INSERT INTO `td_area` VALUES ('140411', '郊　区', '140400', '3');
INSERT INTO `td_area` VALUES ('140421', '长治县', '140400', '4');
INSERT INTO `td_area` VALUES ('140423', '襄垣县', '140400', '5');
INSERT INTO `td_area` VALUES ('140424', '屯留县', '140400', '6');
INSERT INTO `td_area` VALUES ('140425', '平顺县', '140400', '7');
INSERT INTO `td_area` VALUES ('140426', '黎城县', '140400', '8');
INSERT INTO `td_area` VALUES ('140427', '壶关县', '140400', '9');
INSERT INTO `td_area` VALUES ('140428', '长子县', '140400', '10');
INSERT INTO `td_area` VALUES ('140429', '武乡县', '140400', '11');
INSERT INTO `td_area` VALUES ('140430', '沁　县', '140400', '12');
INSERT INTO `td_area` VALUES ('140431', '沁源县', '140400', '13');
INSERT INTO `td_area` VALUES ('140481', '潞城市', '140400', '14');
INSERT INTO `td_area` VALUES ('140501', '市辖区', '140500', '1');
INSERT INTO `td_area` VALUES ('140502', '城　区', '140500', '2');
INSERT INTO `td_area` VALUES ('140521', '沁水县', '140500', '3');
INSERT INTO `td_area` VALUES ('140522', '阳城县', '140500', '4');
INSERT INTO `td_area` VALUES ('140524', '陵川县', '140500', '5');
INSERT INTO `td_area` VALUES ('140525', '泽州县', '140500', '6');
INSERT INTO `td_area` VALUES ('140581', '高平市', '140500', '7');
INSERT INTO `td_area` VALUES ('140601', '市辖区', '140600', '1');
INSERT INTO `td_area` VALUES ('140602', '朔城区', '140600', '2');
INSERT INTO `td_area` VALUES ('140603', '平鲁区', '140600', '3');
INSERT INTO `td_area` VALUES ('140621', '山阴县', '140600', '4');
INSERT INTO `td_area` VALUES ('140622', '应　县', '140600', '5');
INSERT INTO `td_area` VALUES ('140623', '右玉县', '140600', '6');
INSERT INTO `td_area` VALUES ('140624', '怀仁县', '140600', '7');
INSERT INTO `td_area` VALUES ('140701', '市辖区', '140700', '1');
INSERT INTO `td_area` VALUES ('140702', '榆次区', '140700', '2');
INSERT INTO `td_area` VALUES ('140721', '榆社县', '140700', '3');
INSERT INTO `td_area` VALUES ('140722', '左权县', '140700', '4');
INSERT INTO `td_area` VALUES ('140723', '和顺县', '140700', '5');
INSERT INTO `td_area` VALUES ('140724', '昔阳县', '140700', '6');
INSERT INTO `td_area` VALUES ('140725', '寿阳县', '140700', '7');
INSERT INTO `td_area` VALUES ('140726', '太谷县', '140700', '8');
INSERT INTO `td_area` VALUES ('140727', '祁　县', '140700', '9');
INSERT INTO `td_area` VALUES ('140728', '平遥县', '140700', '10');
INSERT INTO `td_area` VALUES ('140729', '灵石县', '140700', '11');
INSERT INTO `td_area` VALUES ('140781', '介休市', '140700', '12');
INSERT INTO `td_area` VALUES ('140801', '市辖区', '140800', '1');
INSERT INTO `td_area` VALUES ('140802', '盐湖区', '140800', '2');
INSERT INTO `td_area` VALUES ('140821', '临猗县', '140800', '3');
INSERT INTO `td_area` VALUES ('140822', '万荣县', '140800', '4');
INSERT INTO `td_area` VALUES ('140823', '闻喜县', '140800', '5');
INSERT INTO `td_area` VALUES ('140824', '稷山县', '140800', '6');
INSERT INTO `td_area` VALUES ('140825', '新绛县', '140800', '7');
INSERT INTO `td_area` VALUES ('140826', '绛　县', '140800', '8');
INSERT INTO `td_area` VALUES ('140827', '垣曲县', '140800', '9');
INSERT INTO `td_area` VALUES ('140828', '夏　县', '140800', '10');
INSERT INTO `td_area` VALUES ('140829', '平陆县', '140800', '11');
INSERT INTO `td_area` VALUES ('140830', '芮城县', '140800', '12');
INSERT INTO `td_area` VALUES ('140881', '永济市', '140800', '13');
INSERT INTO `td_area` VALUES ('140882', '河津市', '140800', '14');
INSERT INTO `td_area` VALUES ('140901', '市辖区', '140900', '1');
INSERT INTO `td_area` VALUES ('140902', '忻府区', '140900', '2');
INSERT INTO `td_area` VALUES ('140921', '定襄县', '140900', '3');
INSERT INTO `td_area` VALUES ('140922', '五台县', '140900', '4');
INSERT INTO `td_area` VALUES ('140923', '代　县', '140900', '5');
INSERT INTO `td_area` VALUES ('140924', '繁峙县', '140900', '6');
INSERT INTO `td_area` VALUES ('140925', '宁武县', '140900', '7');
INSERT INTO `td_area` VALUES ('140926', '静乐县', '140900', '8');
INSERT INTO `td_area` VALUES ('140927', '神池县', '140900', '9');
INSERT INTO `td_area` VALUES ('140928', '五寨县', '140900', '10');
INSERT INTO `td_area` VALUES ('140929', '岢岚县', '140900', '11');
INSERT INTO `td_area` VALUES ('140930', '河曲县', '140900', '12');
INSERT INTO `td_area` VALUES ('140931', '保德县', '140900', '13');
INSERT INTO `td_area` VALUES ('140932', '偏关县', '140900', '14');
INSERT INTO `td_area` VALUES ('140981', '原平市', '140900', '15');
INSERT INTO `td_area` VALUES ('141001', '市辖区', '141000', '1');
INSERT INTO `td_area` VALUES ('141002', '尧都区', '141000', '2');
INSERT INTO `td_area` VALUES ('141021', '曲沃县', '141000', '3');
INSERT INTO `td_area` VALUES ('141022', '翼城县', '141000', '4');
INSERT INTO `td_area` VALUES ('141023', '襄汾县', '141000', '5');
INSERT INTO `td_area` VALUES ('141024', '洪洞县', '141000', '6');
INSERT INTO `td_area` VALUES ('141025', '古　县', '141000', '7');
INSERT INTO `td_area` VALUES ('141026', '安泽县', '141000', '8');
INSERT INTO `td_area` VALUES ('141027', '浮山县', '141000', '9');
INSERT INTO `td_area` VALUES ('141028', '吉　县', '141000', '10');
INSERT INTO `td_area` VALUES ('141029', '乡宁县', '141000', '11');
INSERT INTO `td_area` VALUES ('141030', '大宁县', '141000', '12');
INSERT INTO `td_area` VALUES ('141031', '隰　县', '141000', '13');
INSERT INTO `td_area` VALUES ('141032', '永和县', '141000', '14');
INSERT INTO `td_area` VALUES ('141033', '蒲　县', '141000', '15');
INSERT INTO `td_area` VALUES ('141034', '汾西县', '141000', '16');
INSERT INTO `td_area` VALUES ('141081', '侯马市', '141000', '17');
INSERT INTO `td_area` VALUES ('141082', '霍州市', '141000', '18');
INSERT INTO `td_area` VALUES ('141101', '市辖区', '141100', '1');
INSERT INTO `td_area` VALUES ('141102', '离石区', '141100', '2');
INSERT INTO `td_area` VALUES ('141121', '文水县', '141100', '3');
INSERT INTO `td_area` VALUES ('141122', '交城县', '141100', '4');
INSERT INTO `td_area` VALUES ('141123', '兴　县', '141100', '5');
INSERT INTO `td_area` VALUES ('141124', '临　县', '141100', '6');
INSERT INTO `td_area` VALUES ('141125', '柳林县', '141100', '7');
INSERT INTO `td_area` VALUES ('141126', '石楼县', '141100', '8');
INSERT INTO `td_area` VALUES ('141127', '岚　县', '141100', '9');
INSERT INTO `td_area` VALUES ('141128', '方山县', '141100', '10');
INSERT INTO `td_area` VALUES ('141129', '中阳县', '141100', '11');
INSERT INTO `td_area` VALUES ('141130', '交口县', '141100', '12');
INSERT INTO `td_area` VALUES ('141181', '孝义市', '141100', '13');
INSERT INTO `td_area` VALUES ('141182', '汾阳市', '141100', '14');
INSERT INTO `td_area` VALUES ('150101', '市辖区', '150100', '1');
INSERT INTO `td_area` VALUES ('150102', '新城区', '150100', '2');
INSERT INTO `td_area` VALUES ('150103', '回民区', '150100', '3');
INSERT INTO `td_area` VALUES ('150104', '玉泉区', '150100', '4');
INSERT INTO `td_area` VALUES ('150105', '赛罕区', '150100', '5');
INSERT INTO `td_area` VALUES ('150121', '土默特左旗', '150100', '6');
INSERT INTO `td_area` VALUES ('150122', '托克托县', '150100', '7');
INSERT INTO `td_area` VALUES ('150123', '和林格尔县', '150100', '8');
INSERT INTO `td_area` VALUES ('150124', '清水河县', '150100', '9');
INSERT INTO `td_area` VALUES ('150125', '武川县', '150100', '10');
INSERT INTO `td_area` VALUES ('150201', '市辖区', '150200', '1');
INSERT INTO `td_area` VALUES ('150202', '东河区', '150200', '2');
INSERT INTO `td_area` VALUES ('150203', '昆都仑区', '150200', '3');
INSERT INTO `td_area` VALUES ('150204', '青山区', '150200', '4');
INSERT INTO `td_area` VALUES ('150205', '石拐区', '150200', '5');
INSERT INTO `td_area` VALUES ('150206', '白云矿区', '150200', '6');
INSERT INTO `td_area` VALUES ('150207', '九原区', '150200', '7');
INSERT INTO `td_area` VALUES ('150221', '土默特右旗', '150200', '8');
INSERT INTO `td_area` VALUES ('150222', '固阳县', '150200', '9');
INSERT INTO `td_area` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '10');
INSERT INTO `td_area` VALUES ('150301', '市辖区', '150300', '1');
INSERT INTO `td_area` VALUES ('150302', '海勃湾区', '150300', '2');
INSERT INTO `td_area` VALUES ('150303', '海南区', '150300', '3');
INSERT INTO `td_area` VALUES ('150304', '乌达区', '150300', '4');
INSERT INTO `td_area` VALUES ('150401', '市辖区', '150400', '1');
INSERT INTO `td_area` VALUES ('150402', '红山区', '150400', '2');
INSERT INTO `td_area` VALUES ('150403', '元宝山区', '150400', '3');
INSERT INTO `td_area` VALUES ('150404', '松山区', '150400', '4');
INSERT INTO `td_area` VALUES ('150421', '阿鲁科尔沁旗', '150400', '5');
INSERT INTO `td_area` VALUES ('150422', '巴林左旗', '150400', '6');
INSERT INTO `td_area` VALUES ('150423', '巴林右旗', '150400', '7');
INSERT INTO `td_area` VALUES ('150424', '林西县', '150400', '8');
INSERT INTO `td_area` VALUES ('150425', '克什克腾旗', '150400', '9');
INSERT INTO `td_area` VALUES ('150426', '翁牛特旗', '150400', '10');
INSERT INTO `td_area` VALUES ('150428', '喀喇沁旗', '150400', '11');
INSERT INTO `td_area` VALUES ('150429', '宁城县', '150400', '12');
INSERT INTO `td_area` VALUES ('150430', '敖汉旗', '150400', '13');
INSERT INTO `td_area` VALUES ('150501', '市辖区', '150500', '1');
INSERT INTO `td_area` VALUES ('150502', '科尔沁区', '150500', '2');
INSERT INTO `td_area` VALUES ('150521', '科尔沁左翼中旗', '150500', '3');
INSERT INTO `td_area` VALUES ('150522', '科尔沁左翼后旗', '150500', '4');
INSERT INTO `td_area` VALUES ('150523', '开鲁县', '150500', '5');
INSERT INTO `td_area` VALUES ('150524', '库伦旗', '150500', '6');
INSERT INTO `td_area` VALUES ('150525', '奈曼旗', '150500', '7');
INSERT INTO `td_area` VALUES ('150526', '扎鲁特旗', '150500', '8');
INSERT INTO `td_area` VALUES ('150581', '霍林郭勒市', '150500', '9');
INSERT INTO `td_area` VALUES ('150602', '东胜区', '150600', '1');
INSERT INTO `td_area` VALUES ('150621', '达拉特旗', '150600', '2');
INSERT INTO `td_area` VALUES ('150622', '准格尔旗', '150600', '3');
INSERT INTO `td_area` VALUES ('150623', '鄂托克前旗', '150600', '4');
INSERT INTO `td_area` VALUES ('150624', '鄂托克旗', '150600', '5');
INSERT INTO `td_area` VALUES ('150625', '杭锦旗', '150600', '6');
INSERT INTO `td_area` VALUES ('150626', '乌审旗', '150600', '7');
INSERT INTO `td_area` VALUES ('150627', '伊金霍洛旗', '150600', '8');
INSERT INTO `td_area` VALUES ('150701', '市辖区', '150700', '1');
INSERT INTO `td_area` VALUES ('150702', '海拉尔区', '150700', '2');
INSERT INTO `td_area` VALUES ('150721', '阿荣旗', '150700', '3');
INSERT INTO `td_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '4');
INSERT INTO `td_area` VALUES ('150723', '鄂伦春自治旗', '150700', '5');
INSERT INTO `td_area` VALUES ('150724', '鄂温克族自治旗', '150700', '6');
INSERT INTO `td_area` VALUES ('150725', '陈巴尔虎旗', '150700', '7');
INSERT INTO `td_area` VALUES ('150726', '新巴尔虎左旗', '150700', '8');
INSERT INTO `td_area` VALUES ('150727', '新巴尔虎右旗', '150700', '9');
INSERT INTO `td_area` VALUES ('150781', '满洲里市', '150700', '10');
INSERT INTO `td_area` VALUES ('150782', '牙克石市', '150700', '11');
INSERT INTO `td_area` VALUES ('150783', '扎兰屯市', '150700', '12');
INSERT INTO `td_area` VALUES ('150784', '额尔古纳市', '150700', '13');
INSERT INTO `td_area` VALUES ('150785', '根河市', '150700', '14');
INSERT INTO `td_area` VALUES ('150801', '市辖区', '150800', '1');
INSERT INTO `td_area` VALUES ('150802', '临河区', '150800', '2');
INSERT INTO `td_area` VALUES ('150821', '五原县', '150800', '3');
INSERT INTO `td_area` VALUES ('150822', '磴口县', '150800', '4');
INSERT INTO `td_area` VALUES ('150823', '乌拉特前旗', '150800', '5');
INSERT INTO `td_area` VALUES ('150824', '乌拉特中旗', '150800', '6');
INSERT INTO `td_area` VALUES ('150825', '乌拉特后旗', '150800', '7');
INSERT INTO `td_area` VALUES ('150826', '杭锦后旗', '150800', '8');
INSERT INTO `td_area` VALUES ('150901', '市辖区', '150900', '1');
INSERT INTO `td_area` VALUES ('150902', '集宁区', '150900', '2');
INSERT INTO `td_area` VALUES ('150921', '卓资县', '150900', '3');
INSERT INTO `td_area` VALUES ('150922', '化德县', '150900', '4');
INSERT INTO `td_area` VALUES ('150923', '商都县', '150900', '5');
INSERT INTO `td_area` VALUES ('150924', '兴和县', '150900', '6');
INSERT INTO `td_area` VALUES ('150925', '凉城县', '150900', '7');
INSERT INTO `td_area` VALUES ('150926', '察哈尔右翼前旗', '150900', '8');
INSERT INTO `td_area` VALUES ('150927', '察哈尔右翼中旗', '150900', '9');
INSERT INTO `td_area` VALUES ('150928', '察哈尔右翼后旗', '150900', '10');
INSERT INTO `td_area` VALUES ('150929', '四子王旗', '150900', '11');
INSERT INTO `td_area` VALUES ('150981', '丰镇市', '150900', '12');
INSERT INTO `td_area` VALUES ('152201', '乌兰浩特市', '152200', '1');
INSERT INTO `td_area` VALUES ('152202', '阿尔山市', '152200', '2');
INSERT INTO `td_area` VALUES ('152221', '科尔沁右翼前旗', '152200', '3');
INSERT INTO `td_area` VALUES ('152222', '科尔沁右翼中旗', '152200', '4');
INSERT INTO `td_area` VALUES ('152223', '扎赉特旗', '152200', '5');
INSERT INTO `td_area` VALUES ('152224', '突泉县', '152200', '6');
INSERT INTO `td_area` VALUES ('152501', '二连浩特市', '152500', '1');
INSERT INTO `td_area` VALUES ('152502', '锡林浩特市', '152500', '2');
INSERT INTO `td_area` VALUES ('152522', '阿巴嘎旗', '152500', '3');
INSERT INTO `td_area` VALUES ('152523', '苏尼特左旗', '152500', '4');
INSERT INTO `td_area` VALUES ('152524', '苏尼特右旗', '152500', '5');
INSERT INTO `td_area` VALUES ('152525', '东乌珠穆沁旗', '152500', '6');
INSERT INTO `td_area` VALUES ('152526', '西乌珠穆沁旗', '152500', '7');
INSERT INTO `td_area` VALUES ('152527', '太仆寺旗', '152500', '8');
INSERT INTO `td_area` VALUES ('152528', '镶黄旗', '152500', '9');
INSERT INTO `td_area` VALUES ('152529', '正镶白旗', '152500', '10');
INSERT INTO `td_area` VALUES ('152530', '正蓝旗', '152500', '11');
INSERT INTO `td_area` VALUES ('152531', '多伦县', '152500', '12');
INSERT INTO `td_area` VALUES ('152921', '阿拉善左旗', '152900', '1');
INSERT INTO `td_area` VALUES ('152922', '阿拉善右旗', '152900', '2');
INSERT INTO `td_area` VALUES ('152923', '额济纳旗', '152900', '3');
INSERT INTO `td_area` VALUES ('210101', '市辖区', '210100', '1');
INSERT INTO `td_area` VALUES ('210102', '和平区', '210100', '2');
INSERT INTO `td_area` VALUES ('210103', '沈河区', '210100', '3');
INSERT INTO `td_area` VALUES ('210104', '大东区', '210100', '4');
INSERT INTO `td_area` VALUES ('210105', '皇姑区', '210100', '5');
INSERT INTO `td_area` VALUES ('210106', '铁西区', '210100', '6');
INSERT INTO `td_area` VALUES ('210111', '苏家屯区', '210100', '7');
INSERT INTO `td_area` VALUES ('210112', '东陵区', '210100', '8');
INSERT INTO `td_area` VALUES ('210113', '新城子区', '210100', '9');
INSERT INTO `td_area` VALUES ('210114', '于洪区', '210100', '10');
INSERT INTO `td_area` VALUES ('210122', '辽中县', '210100', '11');
INSERT INTO `td_area` VALUES ('210123', '康平县', '210100', '12');
INSERT INTO `td_area` VALUES ('210124', '法库县', '210100', '13');
INSERT INTO `td_area` VALUES ('210181', '新民市', '210100', '14');
INSERT INTO `td_area` VALUES ('210201', '市辖区', '210200', '1');
INSERT INTO `td_area` VALUES ('210202', '中山区', '210200', '2');
INSERT INTO `td_area` VALUES ('210203', '西岗区', '210200', '3');
INSERT INTO `td_area` VALUES ('210204', '沙河口区', '210200', '4');
INSERT INTO `td_area` VALUES ('210211', '甘井子区', '210200', '5');
INSERT INTO `td_area` VALUES ('210212', '旅顺口区', '210200', '6');
INSERT INTO `td_area` VALUES ('210213', '金州区', '210200', '7');
INSERT INTO `td_area` VALUES ('210224', '长海县', '210200', '8');
INSERT INTO `td_area` VALUES ('210281', '瓦房店市', '210200', '9');
INSERT INTO `td_area` VALUES ('210282', '普兰店市', '210200', '10');
INSERT INTO `td_area` VALUES ('210283', '庄河市', '210200', '11');
INSERT INTO `td_area` VALUES ('210301', '市辖区', '210300', '1');
INSERT INTO `td_area` VALUES ('210302', '铁东区', '210300', '2');
INSERT INTO `td_area` VALUES ('210303', '铁西区', '210300', '3');
INSERT INTO `td_area` VALUES ('210304', '立山区', '210300', '4');
INSERT INTO `td_area` VALUES ('210311', '千山区', '210300', '5');
INSERT INTO `td_area` VALUES ('210321', '台安县', '210300', '6');
INSERT INTO `td_area` VALUES ('210323', '岫岩满族自治县', '210300', '7');
INSERT INTO `td_area` VALUES ('210381', '海城市', '210300', '8');
INSERT INTO `td_area` VALUES ('210401', '市辖区', '210400', '1');
INSERT INTO `td_area` VALUES ('210402', '新抚区', '210400', '2');
INSERT INTO `td_area` VALUES ('210403', '东洲区', '210400', '3');
INSERT INTO `td_area` VALUES ('210404', '望花区', '210400', '4');
INSERT INTO `td_area` VALUES ('210411', '顺城区', '210400', '5');
INSERT INTO `td_area` VALUES ('210421', '抚顺县', '210400', '6');
INSERT INTO `td_area` VALUES ('210422', '新宾满族自治县', '210400', '7');
INSERT INTO `td_area` VALUES ('210423', '清原满族自治县', '210400', '8');
INSERT INTO `td_area` VALUES ('210501', '市辖区', '210500', '1');
INSERT INTO `td_area` VALUES ('210502', '平山区', '210500', '2');
INSERT INTO `td_area` VALUES ('210503', '溪湖区', '210500', '3');
INSERT INTO `td_area` VALUES ('210504', '明山区', '210500', '4');
INSERT INTO `td_area` VALUES ('210505', '南芬区', '210500', '5');
INSERT INTO `td_area` VALUES ('210521', '本溪满族自治县', '210500', '6');
INSERT INTO `td_area` VALUES ('210522', '桓仁满族自治县', '210500', '7');
INSERT INTO `td_area` VALUES ('210601', '市辖区', '210600', '1');
INSERT INTO `td_area` VALUES ('210602', '元宝区', '210600', '2');
INSERT INTO `td_area` VALUES ('210603', '振兴区', '210600', '3');
INSERT INTO `td_area` VALUES ('210604', '振安区', '210600', '4');
INSERT INTO `td_area` VALUES ('210624', '宽甸满族自治县', '210600', '5');
INSERT INTO `td_area` VALUES ('210681', '东港市', '210600', '6');
INSERT INTO `td_area` VALUES ('210682', '凤城市', '210600', '7');
INSERT INTO `td_area` VALUES ('210701', '市辖区', '210700', '1');
INSERT INTO `td_area` VALUES ('210702', '古塔区', '210700', '2');
INSERT INTO `td_area` VALUES ('210703', '凌河区', '210700', '3');
INSERT INTO `td_area` VALUES ('210711', '太和区', '210700', '4');
INSERT INTO `td_area` VALUES ('210726', '黑山县', '210700', '5');
INSERT INTO `td_area` VALUES ('210727', '义　县', '210700', '6');
INSERT INTO `td_area` VALUES ('210781', '凌海市', '210700', '7');
INSERT INTO `td_area` VALUES ('210782', '北宁市', '210700', '8');
INSERT INTO `td_area` VALUES ('210801', '市辖区', '210800', '1');
INSERT INTO `td_area` VALUES ('210802', '站前区', '210800', '2');
INSERT INTO `td_area` VALUES ('210803', '西市区', '210800', '3');
INSERT INTO `td_area` VALUES ('210804', '鲅鱼圈区', '210800', '4');
INSERT INTO `td_area` VALUES ('210811', '老边区', '210800', '5');
INSERT INTO `td_area` VALUES ('210881', '盖州市', '210800', '6');
INSERT INTO `td_area` VALUES ('210882', '大石桥市', '210800', '7');
INSERT INTO `td_area` VALUES ('210901', '市辖区', '210900', '1');
INSERT INTO `td_area` VALUES ('210902', '海州区', '210900', '2');
INSERT INTO `td_area` VALUES ('210903', '新邱区', '210900', '3');
INSERT INTO `td_area` VALUES ('210904', '太平区', '210900', '4');
INSERT INTO `td_area` VALUES ('210905', '清河门区', '210900', '5');
INSERT INTO `td_area` VALUES ('210911', '细河区', '210900', '6');
INSERT INTO `td_area` VALUES ('210921', '阜新蒙古族自治县', '210900', '7');
INSERT INTO `td_area` VALUES ('210922', '彰武县', '210900', '8');
INSERT INTO `td_area` VALUES ('211001', '市辖区', '211000', '1');
INSERT INTO `td_area` VALUES ('211002', '白塔区', '211000', '2');
INSERT INTO `td_area` VALUES ('211003', '文圣区', '211000', '3');
INSERT INTO `td_area` VALUES ('211004', '宏伟区', '211000', '4');
INSERT INTO `td_area` VALUES ('211005', '弓长岭区', '211000', '5');
INSERT INTO `td_area` VALUES ('211011', '太子河区', '211000', '6');
INSERT INTO `td_area` VALUES ('211021', '辽阳县', '211000', '7');
INSERT INTO `td_area` VALUES ('211081', '灯塔市', '211000', '8');
INSERT INTO `td_area` VALUES ('211101', '市辖区', '211100', '1');
INSERT INTO `td_area` VALUES ('211102', '双台子区', '211100', '2');
INSERT INTO `td_area` VALUES ('211103', '兴隆台区', '211100', '3');
INSERT INTO `td_area` VALUES ('211121', '大洼县', '211100', '4');
INSERT INTO `td_area` VALUES ('211122', '盘山县', '211100', '5');
INSERT INTO `td_area` VALUES ('211201', '市辖区', '211200', '1');
INSERT INTO `td_area` VALUES ('211202', '银州区', '211200', '2');
INSERT INTO `td_area` VALUES ('211204', '清河区', '211200', '3');
INSERT INTO `td_area` VALUES ('211221', '铁岭县', '211200', '4');
INSERT INTO `td_area` VALUES ('211223', '西丰县', '211200', '5');
INSERT INTO `td_area` VALUES ('211224', '昌图县', '211200', '6');
INSERT INTO `td_area` VALUES ('211281', '调兵山市', '211200', '7');
INSERT INTO `td_area` VALUES ('211282', '开原市', '211200', '8');
INSERT INTO `td_area` VALUES ('211301', '市辖区', '211300', '1');
INSERT INTO `td_area` VALUES ('211302', '双塔区', '211300', '2');
INSERT INTO `td_area` VALUES ('211303', '龙城区', '211300', '3');
INSERT INTO `td_area` VALUES ('211321', '朝阳县', '211300', '4');
INSERT INTO `td_area` VALUES ('211322', '建平县', '211300', '5');
INSERT INTO `td_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '6');
INSERT INTO `td_area` VALUES ('211381', '北票市', '211300', '7');
INSERT INTO `td_area` VALUES ('211382', '凌源市', '211300', '8');
INSERT INTO `td_area` VALUES ('211401', '市辖区', '211400', '1');
INSERT INTO `td_area` VALUES ('211402', '连山区', '211400', '2');
INSERT INTO `td_area` VALUES ('211403', '龙港区', '211400', '3');
INSERT INTO `td_area` VALUES ('211404', '南票区', '211400', '4');
INSERT INTO `td_area` VALUES ('211421', '绥中县', '211400', '5');
INSERT INTO `td_area` VALUES ('211422', '建昌县', '211400', '6');
INSERT INTO `td_area` VALUES ('211481', '兴城市', '211400', '7');
INSERT INTO `td_area` VALUES ('220101', '市辖区', '220100', '1');
INSERT INTO `td_area` VALUES ('220102', '南关区', '220100', '2');
INSERT INTO `td_area` VALUES ('220103', '宽城区', '220100', '3');
INSERT INTO `td_area` VALUES ('220104', '朝阳区', '220100', '4');
INSERT INTO `td_area` VALUES ('220105', '二道区', '220100', '5');
INSERT INTO `td_area` VALUES ('220106', '绿园区', '220100', '6');
INSERT INTO `td_area` VALUES ('220112', '双阳区', '220100', '7');
INSERT INTO `td_area` VALUES ('220122', '农安县', '220100', '8');
INSERT INTO `td_area` VALUES ('220181', '九台市', '220100', '9');
INSERT INTO `td_area` VALUES ('220182', '榆树市', '220100', '10');
INSERT INTO `td_area` VALUES ('220183', '德惠市', '220100', '11');
INSERT INTO `td_area` VALUES ('220201', '市辖区', '220200', '1');
INSERT INTO `td_area` VALUES ('220202', '昌邑区', '220200', '2');
INSERT INTO `td_area` VALUES ('220203', '龙潭区', '220200', '3');
INSERT INTO `td_area` VALUES ('220204', '船营区', '220200', '4');
INSERT INTO `td_area` VALUES ('220211', '丰满区', '220200', '5');
INSERT INTO `td_area` VALUES ('220221', '永吉县', '220200', '6');
INSERT INTO `td_area` VALUES ('220281', '蛟河市', '220200', '7');
INSERT INTO `td_area` VALUES ('220282', '桦甸市', '220200', '8');
INSERT INTO `td_area` VALUES ('220283', '舒兰市', '220200', '9');
INSERT INTO `td_area` VALUES ('220284', '磐石市', '220200', '10');
INSERT INTO `td_area` VALUES ('220301', '市辖区', '220300', '1');
INSERT INTO `td_area` VALUES ('220302', '铁西区', '220300', '2');
INSERT INTO `td_area` VALUES ('220303', '铁东区', '220300', '3');
INSERT INTO `td_area` VALUES ('220322', '梨树县', '220300', '4');
INSERT INTO `td_area` VALUES ('220323', '伊通满族自治县', '220300', '5');
INSERT INTO `td_area` VALUES ('220381', '公主岭市', '220300', '6');
INSERT INTO `td_area` VALUES ('220382', '双辽市', '220300', '7');
INSERT INTO `td_area` VALUES ('220401', '市辖区', '220400', '1');
INSERT INTO `td_area` VALUES ('220402', '龙山区', '220400', '2');
INSERT INTO `td_area` VALUES ('220403', '西安区', '220400', '3');
INSERT INTO `td_area` VALUES ('220421', '东丰县', '220400', '4');
INSERT INTO `td_area` VALUES ('220422', '东辽县', '220400', '5');
INSERT INTO `td_area` VALUES ('220501', '市辖区', '220500', '1');
INSERT INTO `td_area` VALUES ('220502', '东昌区', '220500', '2');
INSERT INTO `td_area` VALUES ('220503', '二道江区', '220500', '3');
INSERT INTO `td_area` VALUES ('220521', '通化县', '220500', '4');
INSERT INTO `td_area` VALUES ('220523', '辉南县', '220500', '5');
INSERT INTO `td_area` VALUES ('220524', '柳河县', '220500', '6');
INSERT INTO `td_area` VALUES ('220581', '梅河口市', '220500', '7');
INSERT INTO `td_area` VALUES ('220582', '集安市', '220500', '8');
INSERT INTO `td_area` VALUES ('220601', '市辖区', '220600', '1');
INSERT INTO `td_area` VALUES ('220602', '八道江区', '220600', '2');
INSERT INTO `td_area` VALUES ('220621', '抚松县', '220600', '3');
INSERT INTO `td_area` VALUES ('220622', '靖宇县', '220600', '4');
INSERT INTO `td_area` VALUES ('220623', '长白朝鲜族自治县', '220600', '5');
INSERT INTO `td_area` VALUES ('220625', '江源县', '220600', '6');
INSERT INTO `td_area` VALUES ('220681', '临江市', '220600', '7');
INSERT INTO `td_area` VALUES ('220701', '市辖区', '220700', '1');
INSERT INTO `td_area` VALUES ('220702', '宁江区', '220700', '2');
INSERT INTO `td_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '3');
INSERT INTO `td_area` VALUES ('220722', '长岭县', '220700', '4');
INSERT INTO `td_area` VALUES ('220723', '乾安县', '220700', '5');
INSERT INTO `td_area` VALUES ('220724', '扶余县', '220700', '6');
INSERT INTO `td_area` VALUES ('220801', '市辖区', '220800', '1');
INSERT INTO `td_area` VALUES ('220802', '洮北区', '220800', '2');
INSERT INTO `td_area` VALUES ('220821', '镇赉县', '220800', '3');
INSERT INTO `td_area` VALUES ('220822', '通榆县', '220800', '4');
INSERT INTO `td_area` VALUES ('220881', '洮南市', '220800', '5');
INSERT INTO `td_area` VALUES ('220882', '大安市', '220800', '6');
INSERT INTO `td_area` VALUES ('222401', '延吉市', '222400', '1');
INSERT INTO `td_area` VALUES ('222402', '图们市', '222400', '2');
INSERT INTO `td_area` VALUES ('222403', '敦化市', '222400', '3');
INSERT INTO `td_area` VALUES ('222404', '珲春市', '222400', '4');
INSERT INTO `td_area` VALUES ('222405', '龙井市', '222400', '5');
INSERT INTO `td_area` VALUES ('222406', '和龙市', '222400', '6');
INSERT INTO `td_area` VALUES ('222424', '汪清县', '222400', '7');
INSERT INTO `td_area` VALUES ('222426', '安图县', '222400', '8');
INSERT INTO `td_area` VALUES ('230101', '市辖区', '230100', '1');
INSERT INTO `td_area` VALUES ('230102', '道里区', '230100', '2');
INSERT INTO `td_area` VALUES ('230103', '南岗区', '230100', '3');
INSERT INTO `td_area` VALUES ('230104', '道外区', '230100', '4');
INSERT INTO `td_area` VALUES ('230106', '香坊区', '230100', '5');
INSERT INTO `td_area` VALUES ('230107', '动力区', '230100', '6');
INSERT INTO `td_area` VALUES ('230108', '平房区', '230100', '7');
INSERT INTO `td_area` VALUES ('230109', '松北区', '230100', '8');
INSERT INTO `td_area` VALUES ('230111', '呼兰区', '230100', '9');
INSERT INTO `td_area` VALUES ('230123', '依兰县', '230100', '10');
INSERT INTO `td_area` VALUES ('230124', '方正县', '230100', '11');
INSERT INTO `td_area` VALUES ('230125', '宾　县', '230100', '12');
INSERT INTO `td_area` VALUES ('230126', '巴彦县', '230100', '13');
INSERT INTO `td_area` VALUES ('230127', '木兰县', '230100', '14');
INSERT INTO `td_area` VALUES ('230128', '通河县', '230100', '15');
INSERT INTO `td_area` VALUES ('230129', '延寿县', '230100', '16');
INSERT INTO `td_area` VALUES ('230181', '阿城市', '230100', '17');
INSERT INTO `td_area` VALUES ('230182', '双城市', '230100', '18');
INSERT INTO `td_area` VALUES ('230183', '尚志市', '230100', '19');
INSERT INTO `td_area` VALUES ('230184', '五常市', '230100', '20');
INSERT INTO `td_area` VALUES ('230201', '市辖区', '230200', '1');
INSERT INTO `td_area` VALUES ('230202', '龙沙区', '230200', '2');
INSERT INTO `td_area` VALUES ('230203', '建华区', '230200', '3');
INSERT INTO `td_area` VALUES ('230204', '铁锋区', '230200', '4');
INSERT INTO `td_area` VALUES ('230205', '昂昂溪区', '230200', '5');
INSERT INTO `td_area` VALUES ('230206', '富拉尔基区', '230200', '6');
INSERT INTO `td_area` VALUES ('230207', '碾子山区', '230200', '7');
INSERT INTO `td_area` VALUES ('230208', '梅里斯达斡尔族区', '230200', '8');
INSERT INTO `td_area` VALUES ('230221', '龙江县', '230200', '9');
INSERT INTO `td_area` VALUES ('230223', '依安县', '230200', '10');
INSERT INTO `td_area` VALUES ('230224', '泰来县', '230200', '11');
INSERT INTO `td_area` VALUES ('230225', '甘南县', '230200', '12');
INSERT INTO `td_area` VALUES ('230227', '富裕县', '230200', '13');
INSERT INTO `td_area` VALUES ('230229', '克山县', '230200', '14');
INSERT INTO `td_area` VALUES ('230230', '克东县', '230200', '15');
INSERT INTO `td_area` VALUES ('230231', '拜泉县', '230200', '16');
INSERT INTO `td_area` VALUES ('230281', '讷河市', '230200', '17');
INSERT INTO `td_area` VALUES ('230301', '市辖区', '230300', '1');
INSERT INTO `td_area` VALUES ('230302', '鸡冠区', '230300', '2');
INSERT INTO `td_area` VALUES ('230303', '恒山区', '230300', '3');
INSERT INTO `td_area` VALUES ('230304', '滴道区', '230300', '4');
INSERT INTO `td_area` VALUES ('230305', '梨树区', '230300', '5');
INSERT INTO `td_area` VALUES ('230306', '城子河区', '230300', '6');
INSERT INTO `td_area` VALUES ('230307', '麻山区', '230300', '7');
INSERT INTO `td_area` VALUES ('230321', '鸡东县', '230300', '8');
INSERT INTO `td_area` VALUES ('230381', '虎林市', '230300', '9');
INSERT INTO `td_area` VALUES ('230382', '密山市', '230300', '10');
INSERT INTO `td_area` VALUES ('230401', '市辖区', '230400', '1');
INSERT INTO `td_area` VALUES ('230402', '向阳区', '230400', '2');
INSERT INTO `td_area` VALUES ('230403', '工农区', '230400', '3');
INSERT INTO `td_area` VALUES ('230404', '南山区', '230400', '4');
INSERT INTO `td_area` VALUES ('230405', '兴安区', '230400', '5');
INSERT INTO `td_area` VALUES ('230406', '东山区', '230400', '6');
INSERT INTO `td_area` VALUES ('230407', '兴山区', '230400', '7');
INSERT INTO `td_area` VALUES ('230421', '萝北县', '230400', '8');
INSERT INTO `td_area` VALUES ('230422', '绥滨县', '230400', '9');
INSERT INTO `td_area` VALUES ('230501', '市辖区', '230500', '1');
INSERT INTO `td_area` VALUES ('230502', '尖山区', '230500', '2');
INSERT INTO `td_area` VALUES ('230503', '岭东区', '230500', '3');
INSERT INTO `td_area` VALUES ('230505', '四方台区', '230500', '4');
INSERT INTO `td_area` VALUES ('230506', '宝山区', '230500', '5');
INSERT INTO `td_area` VALUES ('230521', '集贤县', '230500', '6');
INSERT INTO `td_area` VALUES ('230522', '友谊县', '230500', '7');
INSERT INTO `td_area` VALUES ('230523', '宝清县', '230500', '8');
INSERT INTO `td_area` VALUES ('230524', '饶河县', '230500', '9');
INSERT INTO `td_area` VALUES ('230601', '市辖区', '230600', '1');
INSERT INTO `td_area` VALUES ('230602', '萨尔图区', '230600', '2');
INSERT INTO `td_area` VALUES ('230603', '龙凤区', '230600', '3');
INSERT INTO `td_area` VALUES ('230604', '让胡路区', '230600', '4');
INSERT INTO `td_area` VALUES ('230605', '红岗区', '230600', '5');
INSERT INTO `td_area` VALUES ('230606', '大同区', '230600', '6');
INSERT INTO `td_area` VALUES ('230621', '肇州县', '230600', '7');
INSERT INTO `td_area` VALUES ('230622', '肇源县', '230600', '8');
INSERT INTO `td_area` VALUES ('230623', '林甸县', '230600', '9');
INSERT INTO `td_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '10');
INSERT INTO `td_area` VALUES ('230701', '市辖区', '230700', '1');
INSERT INTO `td_area` VALUES ('230702', '伊春区', '230700', '2');
INSERT INTO `td_area` VALUES ('230703', '南岔区', '230700', '3');
INSERT INTO `td_area` VALUES ('230704', '友好区', '230700', '4');
INSERT INTO `td_area` VALUES ('230705', '西林区', '230700', '5');
INSERT INTO `td_area` VALUES ('230706', '翠峦区', '230700', '6');
INSERT INTO `td_area` VALUES ('230707', '新青区', '230700', '7');
INSERT INTO `td_area` VALUES ('230708', '美溪区', '230700', '8');
INSERT INTO `td_area` VALUES ('230709', '金山屯区', '230700', '9');
INSERT INTO `td_area` VALUES ('230710', '五营区', '230700', '10');
INSERT INTO `td_area` VALUES ('230711', '乌马河区', '230700', '11');
INSERT INTO `td_area` VALUES ('230712', '汤旺河区', '230700', '12');
INSERT INTO `td_area` VALUES ('230713', '带岭区', '230700', '13');
INSERT INTO `td_area` VALUES ('230714', '乌伊岭区', '230700', '14');
INSERT INTO `td_area` VALUES ('230715', '红星区', '230700', '15');
INSERT INTO `td_area` VALUES ('230716', '上甘岭区', '230700', '16');
INSERT INTO `td_area` VALUES ('230722', '嘉荫县', '230700', '17');
INSERT INTO `td_area` VALUES ('230781', '铁力市', '230700', '18');
INSERT INTO `td_area` VALUES ('230801', '市辖区', '230800', '1');
INSERT INTO `td_area` VALUES ('230802', '永红区', '230800', '2');
INSERT INTO `td_area` VALUES ('230803', '向阳区', '230800', '3');
INSERT INTO `td_area` VALUES ('230804', '前进区', '230800', '4');
INSERT INTO `td_area` VALUES ('230805', '东风区', '230800', '5');
INSERT INTO `td_area` VALUES ('230811', '郊　区', '230800', '6');
INSERT INTO `td_area` VALUES ('230822', '桦南县', '230800', '7');
INSERT INTO `td_area` VALUES ('230826', '桦川县', '230800', '8');
INSERT INTO `td_area` VALUES ('230828', '汤原县', '230800', '9');
INSERT INTO `td_area` VALUES ('230833', '抚远县', '230800', '10');
INSERT INTO `td_area` VALUES ('230881', '同江市', '230800', '11');
INSERT INTO `td_area` VALUES ('230882', '富锦市', '230800', '12');
INSERT INTO `td_area` VALUES ('230901', '市辖区', '230900', '1');
INSERT INTO `td_area` VALUES ('230902', '新兴区', '230900', '2');
INSERT INTO `td_area` VALUES ('230903', '桃山区', '230900', '3');
INSERT INTO `td_area` VALUES ('230904', '茄子河区', '230900', '4');
INSERT INTO `td_area` VALUES ('230921', '勃利县', '230900', '5');
INSERT INTO `td_area` VALUES ('231001', '市辖区', '231000', '1');
INSERT INTO `td_area` VALUES ('231002', '东安区', '231000', '2');
INSERT INTO `td_area` VALUES ('231003', '阳明区', '231000', '3');
INSERT INTO `td_area` VALUES ('231004', '爱民区', '231000', '4');
INSERT INTO `td_area` VALUES ('231005', '西安区', '231000', '5');
INSERT INTO `td_area` VALUES ('231024', '东宁县', '231000', '6');
INSERT INTO `td_area` VALUES ('231025', '林口县', '231000', '7');
INSERT INTO `td_area` VALUES ('231081', '绥芬河市', '231000', '8');
INSERT INTO `td_area` VALUES ('231083', '海林市', '231000', '9');
INSERT INTO `td_area` VALUES ('231084', '宁安市', '231000', '10');
INSERT INTO `td_area` VALUES ('231085', '穆棱市', '231000', '11');
INSERT INTO `td_area` VALUES ('231101', '市辖区', '231100', '1');
INSERT INTO `td_area` VALUES ('231102', '爱辉区', '231100', '2');
INSERT INTO `td_area` VALUES ('231121', '嫩江县', '231100', '3');
INSERT INTO `td_area` VALUES ('231123', '逊克县', '231100', '4');
INSERT INTO `td_area` VALUES ('231124', '孙吴县', '231100', '5');
INSERT INTO `td_area` VALUES ('231181', '北安市', '231100', '6');
INSERT INTO `td_area` VALUES ('231182', '五大连池市', '231100', '7');
INSERT INTO `td_area` VALUES ('231201', '市辖区', '231200', '1');
INSERT INTO `td_area` VALUES ('231202', '北林区', '231200', '2');
INSERT INTO `td_area` VALUES ('231221', '望奎县', '231200', '3');
INSERT INTO `td_area` VALUES ('231222', '兰西县', '231200', '4');
INSERT INTO `td_area` VALUES ('231223', '青冈县', '231200', '5');
INSERT INTO `td_area` VALUES ('231224', '庆安县', '231200', '6');
INSERT INTO `td_area` VALUES ('231225', '明水县', '231200', '7');
INSERT INTO `td_area` VALUES ('231226', '绥棱县', '231200', '8');
INSERT INTO `td_area` VALUES ('231281', '安达市', '231200', '9');
INSERT INTO `td_area` VALUES ('231282', '肇东市', '231200', '10');
INSERT INTO `td_area` VALUES ('231283', '海伦市', '231200', '11');
INSERT INTO `td_area` VALUES ('232721', '呼玛县', '232700', '1');
INSERT INTO `td_area` VALUES ('232722', '塔河县', '232700', '2');
INSERT INTO `td_area` VALUES ('232723', '漠河县', '232700', '3');
INSERT INTO `td_area` VALUES ('310101', '黄浦区', '310100', '1');
INSERT INTO `td_area` VALUES ('310103', '卢湾区', '310100', '2');
INSERT INTO `td_area` VALUES ('310104', '徐汇区', '310100', '3');
INSERT INTO `td_area` VALUES ('310105', '长宁区', '310100', '4');
INSERT INTO `td_area` VALUES ('310106', '静安区', '310100', '5');
INSERT INTO `td_area` VALUES ('310107', '普陀区', '310100', '6');
INSERT INTO `td_area` VALUES ('310108', '闸北区', '310100', '7');
INSERT INTO `td_area` VALUES ('310109', '虹口区', '310100', '8');
INSERT INTO `td_area` VALUES ('310110', '杨浦区', '310100', '9');
INSERT INTO `td_area` VALUES ('310112', '闵行区', '310100', '10');
INSERT INTO `td_area` VALUES ('310113', '宝山区', '310100', '11');
INSERT INTO `td_area` VALUES ('310114', '嘉定区', '310100', '12');
INSERT INTO `td_area` VALUES ('310115', '浦东新区', '310100', '13');
INSERT INTO `td_area` VALUES ('310116', '金山区', '310100', '14');
INSERT INTO `td_area` VALUES ('310117', '松江区', '310100', '15');
INSERT INTO `td_area` VALUES ('310118', '青浦区', '310100', '16');
INSERT INTO `td_area` VALUES ('310119', '南汇区', '310100', '17');
INSERT INTO `td_area` VALUES ('310120', '奉贤区', '310100', '18');
INSERT INTO `td_area` VALUES ('310230', '崇明县', '310200', '1');
INSERT INTO `td_area` VALUES ('320101', '市辖区', '320100', '1');
INSERT INTO `td_area` VALUES ('320102', '玄武区', '320100', '2');
INSERT INTO `td_area` VALUES ('320103', '白下区', '320100', '3');
INSERT INTO `td_area` VALUES ('320104', '秦淮区', '320100', '4');
INSERT INTO `td_area` VALUES ('320105', '建邺区', '320100', '5');
INSERT INTO `td_area` VALUES ('320106', '鼓楼区', '320100', '6');
INSERT INTO `td_area` VALUES ('320107', '下关区', '320100', '7');
INSERT INTO `td_area` VALUES ('320111', '浦口区', '320100', '8');
INSERT INTO `td_area` VALUES ('320113', '栖霞区', '320100', '9');
INSERT INTO `td_area` VALUES ('320114', '雨花台区', '320100', '10');
INSERT INTO `td_area` VALUES ('320115', '江宁区', '320100', '11');
INSERT INTO `td_area` VALUES ('320116', '六合区', '320100', '12');
INSERT INTO `td_area` VALUES ('320124', '溧水县', '320100', '13');
INSERT INTO `td_area` VALUES ('320125', '高淳县', '320100', '14');
INSERT INTO `td_area` VALUES ('320201', '市辖区', '320200', '1');
INSERT INTO `td_area` VALUES ('320202', '崇安区', '320200', '2');
INSERT INTO `td_area` VALUES ('320203', '南长区', '320200', '3');
INSERT INTO `td_area` VALUES ('320204', '北塘区', '320200', '4');
INSERT INTO `td_area` VALUES ('320205', '锡山区', '320200', '5');
INSERT INTO `td_area` VALUES ('320206', '惠山区', '320200', '6');
INSERT INTO `td_area` VALUES ('320211', '滨湖区', '320200', '7');
INSERT INTO `td_area` VALUES ('320281', '江阴市', '320200', '8');
INSERT INTO `td_area` VALUES ('320282', '宜兴市', '320200', '9');
INSERT INTO `td_area` VALUES ('320301', '市辖区', '320300', '1');
INSERT INTO `td_area` VALUES ('320302', '鼓楼区', '320300', '2');
INSERT INTO `td_area` VALUES ('320303', '云龙区', '320300', '3');
INSERT INTO `td_area` VALUES ('320304', '九里区', '320300', '4');
INSERT INTO `td_area` VALUES ('320305', '贾汪区', '320300', '5');
INSERT INTO `td_area` VALUES ('320311', '泉山区', '320300', '6');
INSERT INTO `td_area` VALUES ('320321', '丰　县', '320300', '7');
INSERT INTO `td_area` VALUES ('320322', '沛　县', '320300', '8');
INSERT INTO `td_area` VALUES ('320323', '铜山县', '320300', '9');
INSERT INTO `td_area` VALUES ('320324', '睢宁县', '320300', '10');
INSERT INTO `td_area` VALUES ('320381', '新沂市', '320300', '11');
INSERT INTO `td_area` VALUES ('320382', '邳州市', '320300', '12');
INSERT INTO `td_area` VALUES ('320401', '市辖区', '320400', '1');
INSERT INTO `td_area` VALUES ('320402', '天宁区', '320400', '2');
INSERT INTO `td_area` VALUES ('320404', '钟楼区', '320400', '3');
INSERT INTO `td_area` VALUES ('320405', '戚墅堰区', '320400', '4');
INSERT INTO `td_area` VALUES ('320411', '新北区', '320400', '5');
INSERT INTO `td_area` VALUES ('320412', '武进区', '320400', '6');
INSERT INTO `td_area` VALUES ('320481', '溧阳市', '320400', '7');
INSERT INTO `td_area` VALUES ('320482', '金坛市', '320400', '8');
INSERT INTO `td_area` VALUES ('320501', '市辖区', '320500', '1');
INSERT INTO `td_area` VALUES ('320502', '沧浪区', '320500', '2');
INSERT INTO `td_area` VALUES ('320503', '平江区', '320500', '3');
INSERT INTO `td_area` VALUES ('320504', '金阊区', '320500', '4');
INSERT INTO `td_area` VALUES ('320505', '虎丘区', '320500', '5');
INSERT INTO `td_area` VALUES ('320506', '吴中区', '320500', '6');
INSERT INTO `td_area` VALUES ('320507', '相城区', '320500', '7');
INSERT INTO `td_area` VALUES ('320581', '常熟市', '320500', '8');
INSERT INTO `td_area` VALUES ('320582', '张家港市', '320500', '9');
INSERT INTO `td_area` VALUES ('320583', '昆山市', '320500', '10');
INSERT INTO `td_area` VALUES ('320584', '吴江市', '320500', '11');
INSERT INTO `td_area` VALUES ('320585', '太仓市', '320500', '12');
INSERT INTO `td_area` VALUES ('320601', '市辖区', '320600', '1');
INSERT INTO `td_area` VALUES ('320602', '崇川区', '320600', '2');
INSERT INTO `td_area` VALUES ('320611', '港闸区', '320600', '3');
INSERT INTO `td_area` VALUES ('320621', '海安县', '320600', '4');
INSERT INTO `td_area` VALUES ('320623', '如东县', '320600', '5');
INSERT INTO `td_area` VALUES ('320681', '启东市', '320600', '6');
INSERT INTO `td_area` VALUES ('320682', '如皋市', '320600', '7');
INSERT INTO `td_area` VALUES ('320683', '通州市', '320600', '8');
INSERT INTO `td_area` VALUES ('320684', '海门市', '320600', '9');
INSERT INTO `td_area` VALUES ('320701', '市辖区', '320700', '1');
INSERT INTO `td_area` VALUES ('320703', '连云区', '320700', '2');
INSERT INTO `td_area` VALUES ('320705', '新浦区', '320700', '3');
INSERT INTO `td_area` VALUES ('320706', '海州区', '320700', '4');
INSERT INTO `td_area` VALUES ('320721', '赣榆县', '320700', '5');
INSERT INTO `td_area` VALUES ('320722', '东海县', '320700', '6');
INSERT INTO `td_area` VALUES ('320723', '灌云县', '320700', '7');
INSERT INTO `td_area` VALUES ('320724', '灌南县', '320700', '8');
INSERT INTO `td_area` VALUES ('320801', '市辖区', '320800', '1');
INSERT INTO `td_area` VALUES ('320802', '清河区', '320800', '2');
INSERT INTO `td_area` VALUES ('320803', '楚州区', '320800', '3');
INSERT INTO `td_area` VALUES ('320804', '淮阴区', '320800', '4');
INSERT INTO `td_area` VALUES ('320811', '清浦区', '320800', '5');
INSERT INTO `td_area` VALUES ('320826', '涟水县', '320800', '6');
INSERT INTO `td_area` VALUES ('320829', '洪泽县', '320800', '7');
INSERT INTO `td_area` VALUES ('320830', '盱眙县', '320800', '8');
INSERT INTO `td_area` VALUES ('320831', '金湖县', '320800', '9');
INSERT INTO `td_area` VALUES ('320901', '市辖区', '320900', '1');
INSERT INTO `td_area` VALUES ('320902', '亭湖区', '320900', '2');
INSERT INTO `td_area` VALUES ('320903', '盐都区', '320900', '3');
INSERT INTO `td_area` VALUES ('320921', '响水县', '320900', '4');
INSERT INTO `td_area` VALUES ('320922', '滨海县', '320900', '5');
INSERT INTO `td_area` VALUES ('320923', '阜宁县', '320900', '6');
INSERT INTO `td_area` VALUES ('320924', '射阳县', '320900', '7');
INSERT INTO `td_area` VALUES ('320925', '建湖县', '320900', '8');
INSERT INTO `td_area` VALUES ('320981', '东台市', '320900', '9');
INSERT INTO `td_area` VALUES ('320982', '大丰市', '320900', '10');
INSERT INTO `td_area` VALUES ('321001', '市辖区', '321000', '1');
INSERT INTO `td_area` VALUES ('321002', '广陵区', '321000', '2');
INSERT INTO `td_area` VALUES ('321003', '邗江区', '321000', '3');
INSERT INTO `td_area` VALUES ('321011', '郊　区', '321000', '4');
INSERT INTO `td_area` VALUES ('321023', '宝应县', '321000', '5');
INSERT INTO `td_area` VALUES ('321081', '仪征市', '321000', '6');
INSERT INTO `td_area` VALUES ('321084', '高邮市', '321000', '7');
INSERT INTO `td_area` VALUES ('321088', '江都市', '321000', '8');
INSERT INTO `td_area` VALUES ('321101', '市辖区', '321100', '1');
INSERT INTO `td_area` VALUES ('321102', '京口区', '321100', '2');
INSERT INTO `td_area` VALUES ('321111', '润州区', '321100', '3');
INSERT INTO `td_area` VALUES ('321112', '丹徒区', '321100', '4');
INSERT INTO `td_area` VALUES ('321181', '丹阳市', '321100', '5');
INSERT INTO `td_area` VALUES ('321182', '扬中市', '321100', '6');
INSERT INTO `td_area` VALUES ('321183', '句容市', '321100', '7');
INSERT INTO `td_area` VALUES ('321201', '市辖区', '321200', '1');
INSERT INTO `td_area` VALUES ('321202', '海陵区', '321200', '2');
INSERT INTO `td_area` VALUES ('321203', '高港区', '321200', '3');
INSERT INTO `td_area` VALUES ('321281', '兴化市', '321200', '4');
INSERT INTO `td_area` VALUES ('321282', '靖江市', '321200', '5');
INSERT INTO `td_area` VALUES ('321283', '泰兴市', '321200', '6');
INSERT INTO `td_area` VALUES ('321284', '姜堰市', '321200', '7');
INSERT INTO `td_area` VALUES ('321301', '市辖区', '321300', '1');
INSERT INTO `td_area` VALUES ('321302', '宿城区', '321300', '2');
INSERT INTO `td_area` VALUES ('321311', '宿豫区', '321300', '3');
INSERT INTO `td_area` VALUES ('321322', '沭阳县', '321300', '4');
INSERT INTO `td_area` VALUES ('321323', '泗阳县', '321300', '5');
INSERT INTO `td_area` VALUES ('321324', '泗洪县', '321300', '6');
INSERT INTO `td_area` VALUES ('330101', '市辖区', '330100', '1');
INSERT INTO `td_area` VALUES ('330102', '上城区', '330100', '2');
INSERT INTO `td_area` VALUES ('330103', '下城区', '330100', '3');
INSERT INTO `td_area` VALUES ('330104', '江干区', '330100', '4');
INSERT INTO `td_area` VALUES ('330105', '拱墅区', '330100', '5');
INSERT INTO `td_area` VALUES ('330106', '西湖区', '330100', '6');
INSERT INTO `td_area` VALUES ('330108', '滨江区', '330100', '7');
INSERT INTO `td_area` VALUES ('330109', '萧山区', '330100', '8');
INSERT INTO `td_area` VALUES ('330110', '余杭区', '330100', '9');
INSERT INTO `td_area` VALUES ('330122', '桐庐县', '330100', '10');
INSERT INTO `td_area` VALUES ('330127', '淳安县', '330100', '11');
INSERT INTO `td_area` VALUES ('330182', '建德市', '330100', '12');
INSERT INTO `td_area` VALUES ('330183', '富阳市', '330100', '13');
INSERT INTO `td_area` VALUES ('330185', '临安市', '330100', '14');
INSERT INTO `td_area` VALUES ('330201', '市辖区', '330200', '1');
INSERT INTO `td_area` VALUES ('330203', '海曙区', '330200', '2');
INSERT INTO `td_area` VALUES ('330204', '江东区', '330200', '3');
INSERT INTO `td_area` VALUES ('330205', '江北区', '330200', '4');
INSERT INTO `td_area` VALUES ('330206', '北仑区', '330200', '5');
INSERT INTO `td_area` VALUES ('330211', '镇海区', '330200', '6');
INSERT INTO `td_area` VALUES ('330212', '鄞州区', '330200', '7');
INSERT INTO `td_area` VALUES ('330225', '象山县', '330200', '8');
INSERT INTO `td_area` VALUES ('330226', '宁海县', '330200', '9');
INSERT INTO `td_area` VALUES ('330281', '余姚市', '330200', '10');
INSERT INTO `td_area` VALUES ('330282', '慈溪市', '330200', '11');
INSERT INTO `td_area` VALUES ('330283', '奉化市', '330200', '12');
INSERT INTO `td_area` VALUES ('330301', '市辖区', '330300', '1');
INSERT INTO `td_area` VALUES ('330302', '鹿城区', '330300', '2');
INSERT INTO `td_area` VALUES ('330303', '龙湾区', '330300', '3');
INSERT INTO `td_area` VALUES ('330304', '瓯海区', '330300', '4');
INSERT INTO `td_area` VALUES ('330322', '洞头县', '330300', '5');
INSERT INTO `td_area` VALUES ('330324', '永嘉县', '330300', '6');
INSERT INTO `td_area` VALUES ('330326', '平阳县', '330300', '7');
INSERT INTO `td_area` VALUES ('330327', '苍南县', '330300', '8');
INSERT INTO `td_area` VALUES ('330328', '文成县', '330300', '9');
INSERT INTO `td_area` VALUES ('330329', '泰顺县', '330300', '10');
INSERT INTO `td_area` VALUES ('330381', '瑞安市', '330300', '11');
INSERT INTO `td_area` VALUES ('330382', '乐清市', '330300', '12');
INSERT INTO `td_area` VALUES ('330401', '市辖区', '330400', '1');
INSERT INTO `td_area` VALUES ('330402', '秀城区', '330400', '2');
INSERT INTO `td_area` VALUES ('330411', '秀洲区', '330400', '3');
INSERT INTO `td_area` VALUES ('330421', '嘉善县', '330400', '4');
INSERT INTO `td_area` VALUES ('330424', '海盐县', '330400', '5');
INSERT INTO `td_area` VALUES ('330481', '海宁市', '330400', '6');
INSERT INTO `td_area` VALUES ('330482', '平湖市', '330400', '7');
INSERT INTO `td_area` VALUES ('330483', '桐乡市', '330400', '8');
INSERT INTO `td_area` VALUES ('330501', '市辖区', '330500', '1');
INSERT INTO `td_area` VALUES ('330502', '吴兴区', '330500', '2');
INSERT INTO `td_area` VALUES ('330503', '南浔区', '330500', '3');
INSERT INTO `td_area` VALUES ('330521', '德清县', '330500', '4');
INSERT INTO `td_area` VALUES ('330522', '长兴县', '330500', '5');
INSERT INTO `td_area` VALUES ('330523', '安吉县', '330500', '6');
INSERT INTO `td_area` VALUES ('330601', '市辖区', '330600', '1');
INSERT INTO `td_area` VALUES ('330602', '越城区', '330600', '2');
INSERT INTO `td_area` VALUES ('330621', '绍兴县', '330600', '3');
INSERT INTO `td_area` VALUES ('330624', '新昌县', '330600', '4');
INSERT INTO `td_area` VALUES ('330681', '诸暨市', '330600', '5');
INSERT INTO `td_area` VALUES ('330682', '上虞市', '330600', '6');
INSERT INTO `td_area` VALUES ('330683', '嵊州市', '330600', '7');
INSERT INTO `td_area` VALUES ('330701', '市辖区', '330700', '1');
INSERT INTO `td_area` VALUES ('330702', '婺城区', '330700', '2');
INSERT INTO `td_area` VALUES ('330703', '金东区', '330700', '3');
INSERT INTO `td_area` VALUES ('330723', '武义县', '330700', '4');
INSERT INTO `td_area` VALUES ('330726', '浦江县', '330700', '5');
INSERT INTO `td_area` VALUES ('330727', '磐安县', '330700', '6');
INSERT INTO `td_area` VALUES ('330781', '兰溪市', '330700', '7');
INSERT INTO `td_area` VALUES ('330782', '义乌市', '330700', '8');
INSERT INTO `td_area` VALUES ('330783', '东阳市', '330700', '9');
INSERT INTO `td_area` VALUES ('330784', '永康市', '330700', '10');
INSERT INTO `td_area` VALUES ('330801', '市辖区', '330800', '1');
INSERT INTO `td_area` VALUES ('330802', '柯城区', '330800', '2');
INSERT INTO `td_area` VALUES ('330803', '衢江区', '330800', '3');
INSERT INTO `td_area` VALUES ('330822', '常山县', '330800', '4');
INSERT INTO `td_area` VALUES ('330824', '开化县', '330800', '5');
INSERT INTO `td_area` VALUES ('330825', '龙游县', '330800', '6');
INSERT INTO `td_area` VALUES ('330881', '江山市', '330800', '7');
INSERT INTO `td_area` VALUES ('330901', '市辖区', '330900', '1');
INSERT INTO `td_area` VALUES ('330902', '定海区', '330900', '2');
INSERT INTO `td_area` VALUES ('330903', '普陀区', '330900', '3');
INSERT INTO `td_area` VALUES ('330921', '岱山县', '330900', '4');
INSERT INTO `td_area` VALUES ('330922', '嵊泗县', '330900', '5');
INSERT INTO `td_area` VALUES ('331001', '市辖区', '331000', '1');
INSERT INTO `td_area` VALUES ('331002', '椒江区', '331000', '2');
INSERT INTO `td_area` VALUES ('331003', '黄岩区', '331000', '3');
INSERT INTO `td_area` VALUES ('331004', '路桥区', '331000', '4');
INSERT INTO `td_area` VALUES ('331021', '玉环县', '331000', '5');
INSERT INTO `td_area` VALUES ('331022', '三门县', '331000', '6');
INSERT INTO `td_area` VALUES ('331023', '天台县', '331000', '7');
INSERT INTO `td_area` VALUES ('331024', '仙居县', '331000', '8');
INSERT INTO `td_area` VALUES ('331081', '温岭市', '331000', '9');
INSERT INTO `td_area` VALUES ('331082', '临海市', '331000', '10');
INSERT INTO `td_area` VALUES ('331101', '市辖区', '331100', '1');
INSERT INTO `td_area` VALUES ('331102', '莲都区', '331100', '2');
INSERT INTO `td_area` VALUES ('331121', '青田县', '331100', '3');
INSERT INTO `td_area` VALUES ('331122', '缙云县', '331100', '4');
INSERT INTO `td_area` VALUES ('331123', '遂昌县', '331100', '5');
INSERT INTO `td_area` VALUES ('331124', '松阳县', '331100', '6');
INSERT INTO `td_area` VALUES ('331125', '云和县', '331100', '7');
INSERT INTO `td_area` VALUES ('331126', '庆元县', '331100', '8');
INSERT INTO `td_area` VALUES ('331127', '景宁畲族自治县', '331100', '9');
INSERT INTO `td_area` VALUES ('331181', '龙泉市', '331100', '10');
INSERT INTO `td_area` VALUES ('340101', '市辖区', '340100', '1');
INSERT INTO `td_area` VALUES ('340102', '瑶海区', '340100', '2');
INSERT INTO `td_area` VALUES ('340103', '庐阳区', '340100', '3');
INSERT INTO `td_area` VALUES ('340104', '蜀山区', '340100', '4');
INSERT INTO `td_area` VALUES ('340111', '包河区', '340100', '5');
INSERT INTO `td_area` VALUES ('340121', '长丰县', '340100', '6');
INSERT INTO `td_area` VALUES ('340122', '肥东县', '340100', '7');
INSERT INTO `td_area` VALUES ('340123', '肥西县', '340100', '8');
INSERT INTO `td_area` VALUES ('340201', '市辖区', '340200', '1');
INSERT INTO `td_area` VALUES ('340202', '镜湖区', '340200', '2');
INSERT INTO `td_area` VALUES ('340203', '马塘区', '340200', '3');
INSERT INTO `td_area` VALUES ('340204', '新芜区', '340200', '4');
INSERT INTO `td_area` VALUES ('340207', '鸠江区', '340200', '5');
INSERT INTO `td_area` VALUES ('340221', '芜湖县', '340200', '6');
INSERT INTO `td_area` VALUES ('340222', '繁昌县', '340200', '7');
INSERT INTO `td_area` VALUES ('340223', '南陵县', '340200', '8');
INSERT INTO `td_area` VALUES ('340301', '市辖区', '340300', '1');
INSERT INTO `td_area` VALUES ('340302', '龙子湖区', '340300', '2');
INSERT INTO `td_area` VALUES ('340303', '蚌山区', '340300', '3');
INSERT INTO `td_area` VALUES ('340304', '禹会区', '340300', '4');
INSERT INTO `td_area` VALUES ('340311', '淮上区', '340300', '5');
INSERT INTO `td_area` VALUES ('340321', '怀远县', '340300', '6');
INSERT INTO `td_area` VALUES ('340322', '五河县', '340300', '7');
INSERT INTO `td_area` VALUES ('340323', '固镇县', '340300', '8');
INSERT INTO `td_area` VALUES ('340401', '市辖区', '340400', '1');
INSERT INTO `td_area` VALUES ('340402', '大通区', '340400', '2');
INSERT INTO `td_area` VALUES ('340403', '田家庵区', '340400', '3');
INSERT INTO `td_area` VALUES ('340404', '谢家集区', '340400', '4');
INSERT INTO `td_area` VALUES ('340405', '八公山区', '340400', '5');
INSERT INTO `td_area` VALUES ('340406', '潘集区', '340400', '6');
INSERT INTO `td_area` VALUES ('340421', '凤台县', '340400', '7');
INSERT INTO `td_area` VALUES ('340501', '市辖区', '340500', '1');
INSERT INTO `td_area` VALUES ('340502', '金家庄区', '340500', '2');
INSERT INTO `td_area` VALUES ('340503', '花山区', '340500', '3');
INSERT INTO `td_area` VALUES ('340504', '雨山区', '340500', '4');
INSERT INTO `td_area` VALUES ('340521', '当涂县', '340500', '5');
INSERT INTO `td_area` VALUES ('340601', '市辖区', '340600', '1');
INSERT INTO `td_area` VALUES ('340602', '杜集区', '340600', '2');
INSERT INTO `td_area` VALUES ('340603', '相山区', '340600', '3');
INSERT INTO `td_area` VALUES ('340604', '烈山区', '340600', '4');
INSERT INTO `td_area` VALUES ('340621', '濉溪县', '340600', '5');
INSERT INTO `td_area` VALUES ('340701', '市辖区', '340700', '1');
INSERT INTO `td_area` VALUES ('340702', '铜官山区', '340700', '2');
INSERT INTO `td_area` VALUES ('340703', '狮子山区', '340700', '3');
INSERT INTO `td_area` VALUES ('340711', '郊　区', '340700', '4');
INSERT INTO `td_area` VALUES ('340721', '铜陵县', '340700', '5');
INSERT INTO `td_area` VALUES ('340801', '市辖区', '340800', '1');
INSERT INTO `td_area` VALUES ('340802', '迎江区', '340800', '2');
INSERT INTO `td_area` VALUES ('340803', '大观区', '340800', '3');
INSERT INTO `td_area` VALUES ('340811', '郊　区', '340800', '4');
INSERT INTO `td_area` VALUES ('340822', '怀宁县', '340800', '5');
INSERT INTO `td_area` VALUES ('340823', '枞阳县', '340800', '6');
INSERT INTO `td_area` VALUES ('340824', '潜山县', '340800', '7');
INSERT INTO `td_area` VALUES ('340825', '太湖县', '340800', '8');
INSERT INTO `td_area` VALUES ('340826', '宿松县', '340800', '9');
INSERT INTO `td_area` VALUES ('340827', '望江县', '340800', '10');
INSERT INTO `td_area` VALUES ('340828', '岳西县', '340800', '11');
INSERT INTO `td_area` VALUES ('340881', '桐城市', '340800', '12');
INSERT INTO `td_area` VALUES ('341001', '市辖区', '341000', '1');
INSERT INTO `td_area` VALUES ('341002', '屯溪区', '341000', '2');
INSERT INTO `td_area` VALUES ('341003', '黄山区', '341000', '3');
INSERT INTO `td_area` VALUES ('341004', '徽州区', '341000', '4');
INSERT INTO `td_area` VALUES ('341021', '歙　县', '341000', '5');
INSERT INTO `td_area` VALUES ('341022', '休宁县', '341000', '6');
INSERT INTO `td_area` VALUES ('341023', '黟　县', '341000', '7');
INSERT INTO `td_area` VALUES ('341024', '祁门县', '341000', '8');
INSERT INTO `td_area` VALUES ('341101', '市辖区', '341100', '1');
INSERT INTO `td_area` VALUES ('341102', '琅琊区', '341100', '2');
INSERT INTO `td_area` VALUES ('341103', '南谯区', '341100', '3');
INSERT INTO `td_area` VALUES ('341122', '来安县', '341100', '4');
INSERT INTO `td_area` VALUES ('341124', '全椒县', '341100', '5');
INSERT INTO `td_area` VALUES ('341125', '定远县', '341100', '6');
INSERT INTO `td_area` VALUES ('341126', '凤阳县', '341100', '7');
INSERT INTO `td_area` VALUES ('341181', '天长市', '341100', '8');
INSERT INTO `td_area` VALUES ('341182', '明光市', '341100', '9');
INSERT INTO `td_area` VALUES ('341201', '市辖区', '341200', '1');
INSERT INTO `td_area` VALUES ('341202', '颍州区', '341200', '2');
INSERT INTO `td_area` VALUES ('341203', '颍东区', '341200', '3');
INSERT INTO `td_area` VALUES ('341204', '颍泉区', '341200', '4');
INSERT INTO `td_area` VALUES ('341221', '临泉县', '341200', '5');
INSERT INTO `td_area` VALUES ('341222', '太和县', '341200', '6');
INSERT INTO `td_area` VALUES ('341225', '阜南县', '341200', '7');
INSERT INTO `td_area` VALUES ('341226', '颍上县', '341200', '8');
INSERT INTO `td_area` VALUES ('341282', '界首市', '341200', '9');
INSERT INTO `td_area` VALUES ('341301', '市辖区', '341300', '1');
INSERT INTO `td_area` VALUES ('341302', '墉桥区', '341300', '2');
INSERT INTO `td_area` VALUES ('341321', '砀山县', '341300', '3');
INSERT INTO `td_area` VALUES ('341322', '萧　县', '341300', '4');
INSERT INTO `td_area` VALUES ('341323', '灵璧县', '341300', '5');
INSERT INTO `td_area` VALUES ('341324', '泗　县', '341300', '6');
INSERT INTO `td_area` VALUES ('341401', '庐江县', '340100', '9');
INSERT INTO `td_area` VALUES ('341402', '巢湖市', '340100', '10');
INSERT INTO `td_area` VALUES ('341422', '无为县', '340200', '9');
INSERT INTO `td_area` VALUES ('341423', '含山县', '340500', '6');
INSERT INTO `td_area` VALUES ('341424', '和　县', '340500', '7');
INSERT INTO `td_area` VALUES ('341501', '市辖区', '341500', '1');
INSERT INTO `td_area` VALUES ('341502', '金安区', '341500', '2');
INSERT INTO `td_area` VALUES ('341503', '裕安区', '341500', '3');
INSERT INTO `td_area` VALUES ('341521', '寿　县', '341500', '4');
INSERT INTO `td_area` VALUES ('341522', '霍邱县', '341500', '5');
INSERT INTO `td_area` VALUES ('341523', '舒城县', '341500', '6');
INSERT INTO `td_area` VALUES ('341524', '金寨县', '341500', '7');
INSERT INTO `td_area` VALUES ('341525', '霍山县', '341500', '8');
INSERT INTO `td_area` VALUES ('341601', '市辖区', '341600', '1');
INSERT INTO `td_area` VALUES ('341602', '谯城区', '341600', '2');
INSERT INTO `td_area` VALUES ('341621', '涡阳县', '341600', '3');
INSERT INTO `td_area` VALUES ('341622', '蒙城县', '341600', '4');
INSERT INTO `td_area` VALUES ('341623', '利辛县', '341600', '5');
INSERT INTO `td_area` VALUES ('341701', '市辖区', '341700', '1');
INSERT INTO `td_area` VALUES ('341702', '贵池区', '341700', '2');
INSERT INTO `td_area` VALUES ('341721', '东至县', '341700', '3');
INSERT INTO `td_area` VALUES ('341722', '石台县', '341700', '4');
INSERT INTO `td_area` VALUES ('341723', '青阳县', '341700', '5');
INSERT INTO `td_area` VALUES ('341801', '市辖区', '341800', '1');
INSERT INTO `td_area` VALUES ('341802', '宣州区', '341800', '2');
INSERT INTO `td_area` VALUES ('341821', '郎溪县', '341800', '3');
INSERT INTO `td_area` VALUES ('341822', '广德县', '341800', '4');
INSERT INTO `td_area` VALUES ('341823', '泾　县', '341800', '5');
INSERT INTO `td_area` VALUES ('341824', '绩溪县', '341800', '6');
INSERT INTO `td_area` VALUES ('341825', '旌德县', '341800', '7');
INSERT INTO `td_area` VALUES ('341881', '宁国市', '341800', '8');
INSERT INTO `td_area` VALUES ('350101', '市辖区', '350100', '1');
INSERT INTO `td_area` VALUES ('350102', '鼓楼区', '350100', '2');
INSERT INTO `td_area` VALUES ('350103', '台江区', '350100', '3');
INSERT INTO `td_area` VALUES ('350104', '仓山区', '350100', '4');
INSERT INTO `td_area` VALUES ('350105', '马尾区', '350100', '5');
INSERT INTO `td_area` VALUES ('350111', '晋安区', '350100', '6');
INSERT INTO `td_area` VALUES ('350121', '闽侯县', '350100', '7');
INSERT INTO `td_area` VALUES ('350122', '连江县', '350100', '8');
INSERT INTO `td_area` VALUES ('350123', '罗源县', '350100', '9');
INSERT INTO `td_area` VALUES ('350124', '闽清县', '350100', '10');
INSERT INTO `td_area` VALUES ('350125', '永泰县', '350100', '11');
INSERT INTO `td_area` VALUES ('350128', '平潭县', '350100', '12');
INSERT INTO `td_area` VALUES ('350181', '福清市', '350100', '13');
INSERT INTO `td_area` VALUES ('350182', '长乐市', '350100', '14');
INSERT INTO `td_area` VALUES ('350201', '市辖区', '350200', '1');
INSERT INTO `td_area` VALUES ('350203', '思明区', '350200', '2');
INSERT INTO `td_area` VALUES ('350205', '海沧区', '350200', '3');
INSERT INTO `td_area` VALUES ('350206', '湖里区', '350200', '4');
INSERT INTO `td_area` VALUES ('350211', '集美区', '350200', '5');
INSERT INTO `td_area` VALUES ('350212', '同安区', '350200', '6');
INSERT INTO `td_area` VALUES ('350213', '翔安区', '350200', '7');
INSERT INTO `td_area` VALUES ('350301', '市辖区', '350300', '1');
INSERT INTO `td_area` VALUES ('350302', '城厢区', '350300', '2');
INSERT INTO `td_area` VALUES ('350303', '涵江区', '350300', '3');
INSERT INTO `td_area` VALUES ('350304', '荔城区', '350300', '4');
INSERT INTO `td_area` VALUES ('350305', '秀屿区', '350300', '5');
INSERT INTO `td_area` VALUES ('350322', '仙游县', '350300', '6');
INSERT INTO `td_area` VALUES ('350401', '市辖区', '350400', '1');
INSERT INTO `td_area` VALUES ('350402', '梅列区', '350400', '2');
INSERT INTO `td_area` VALUES ('350403', '三元区', '350400', '3');
INSERT INTO `td_area` VALUES ('350421', '明溪县', '350400', '4');
INSERT INTO `td_area` VALUES ('350423', '清流县', '350400', '5');
INSERT INTO `td_area` VALUES ('350424', '宁化县', '350400', '6');
INSERT INTO `td_area` VALUES ('350425', '大田县', '350400', '7');
INSERT INTO `td_area` VALUES ('350426', '尤溪县', '350400', '8');
INSERT INTO `td_area` VALUES ('350427', '沙　县', '350400', '9');
INSERT INTO `td_area` VALUES ('350428', '将乐县', '350400', '10');
INSERT INTO `td_area` VALUES ('350429', '泰宁县', '350400', '11');
INSERT INTO `td_area` VALUES ('350430', '建宁县', '350400', '12');
INSERT INTO `td_area` VALUES ('350481', '永安市', '350400', '13');
INSERT INTO `td_area` VALUES ('350501', '市辖区', '350500', '1');
INSERT INTO `td_area` VALUES ('350502', '鲤城区', '350500', '2');
INSERT INTO `td_area` VALUES ('350503', '丰泽区', '350500', '3');
INSERT INTO `td_area` VALUES ('350504', '洛江区', '350500', '4');
INSERT INTO `td_area` VALUES ('350505', '泉港区', '350500', '5');
INSERT INTO `td_area` VALUES ('350521', '惠安县', '350500', '6');
INSERT INTO `td_area` VALUES ('350524', '安溪县', '350500', '7');
INSERT INTO `td_area` VALUES ('350525', '永春县', '350500', '8');
INSERT INTO `td_area` VALUES ('350526', '德化县', '350500', '9');
INSERT INTO `td_area` VALUES ('350527', '金门县', '350500', '10');
INSERT INTO `td_area` VALUES ('350581', '石狮市', '350500', '11');
INSERT INTO `td_area` VALUES ('350582', '晋江市', '350500', '12');
INSERT INTO `td_area` VALUES ('350583', '南安市', '350500', '13');
INSERT INTO `td_area` VALUES ('350601', '市辖区', '350600', '1');
INSERT INTO `td_area` VALUES ('350602', '芗城区', '350600', '2');
INSERT INTO `td_area` VALUES ('350603', '龙文区', '350600', '3');
INSERT INTO `td_area` VALUES ('350622', '云霄县', '350600', '4');
INSERT INTO `td_area` VALUES ('350623', '漳浦县', '350600', '5');
INSERT INTO `td_area` VALUES ('350624', '诏安县', '350600', '6');
INSERT INTO `td_area` VALUES ('350625', '长泰县', '350600', '7');
INSERT INTO `td_area` VALUES ('350626', '东山县', '350600', '8');
INSERT INTO `td_area` VALUES ('350627', '南靖县', '350600', '9');
INSERT INTO `td_area` VALUES ('350628', '平和县', '350600', '10');
INSERT INTO `td_area` VALUES ('350629', '华安县', '350600', '11');
INSERT INTO `td_area` VALUES ('350681', '龙海市', '350600', '12');
INSERT INTO `td_area` VALUES ('350701', '市辖区', '350700', '1');
INSERT INTO `td_area` VALUES ('350702', '延平区', '350700', '2');
INSERT INTO `td_area` VALUES ('350721', '顺昌县', '350700', '3');
INSERT INTO `td_area` VALUES ('350722', '浦城县', '350700', '4');
INSERT INTO `td_area` VALUES ('350723', '光泽县', '350700', '5');
INSERT INTO `td_area` VALUES ('350724', '松溪县', '350700', '6');
INSERT INTO `td_area` VALUES ('350725', '政和县', '350700', '7');
INSERT INTO `td_area` VALUES ('350781', '邵武市', '350700', '8');
INSERT INTO `td_area` VALUES ('350782', '武夷山市', '350700', '9');
INSERT INTO `td_area` VALUES ('350783', '建瓯市', '350700', '10');
INSERT INTO `td_area` VALUES ('350784', '建阳市', '350700', '11');
INSERT INTO `td_area` VALUES ('350801', '市辖区', '350800', '1');
INSERT INTO `td_area` VALUES ('350802', '新罗区', '350800', '2');
INSERT INTO `td_area` VALUES ('350821', '长汀县', '350800', '3');
INSERT INTO `td_area` VALUES ('350822', '永定县', '350800', '4');
INSERT INTO `td_area` VALUES ('350823', '上杭县', '350800', '5');
INSERT INTO `td_area` VALUES ('350824', '武平县', '350800', '6');
INSERT INTO `td_area` VALUES ('350825', '连城县', '350800', '7');
INSERT INTO `td_area` VALUES ('350881', '漳平市', '350800', '8');
INSERT INTO `td_area` VALUES ('350901', '市辖区', '350900', '1');
INSERT INTO `td_area` VALUES ('350902', '蕉城区', '350900', '2');
INSERT INTO `td_area` VALUES ('350921', '霞浦县', '350900', '3');
INSERT INTO `td_area` VALUES ('350922', '古田县', '350900', '4');
INSERT INTO `td_area` VALUES ('350923', '屏南县', '350900', '5');
INSERT INTO `td_area` VALUES ('350924', '寿宁县', '350900', '6');
INSERT INTO `td_area` VALUES ('350925', '周宁县', '350900', '7');
INSERT INTO `td_area` VALUES ('350926', '柘荣县', '350900', '8');
INSERT INTO `td_area` VALUES ('350981', '福安市', '350900', '9');
INSERT INTO `td_area` VALUES ('350982', '福鼎市', '350900', '10');
INSERT INTO `td_area` VALUES ('360101', '市辖区', '360100', '1');
INSERT INTO `td_area` VALUES ('360102', '东湖区', '360100', '2');
INSERT INTO `td_area` VALUES ('360103', '西湖区', '360100', '3');
INSERT INTO `td_area` VALUES ('360104', '青云谱区', '360100', '4');
INSERT INTO `td_area` VALUES ('360105', '湾里区', '360100', '5');
INSERT INTO `td_area` VALUES ('360111', '青山湖区', '360100', '6');
INSERT INTO `td_area` VALUES ('360121', '南昌县', '360100', '7');
INSERT INTO `td_area` VALUES ('360122', '新建县', '360100', '8');
INSERT INTO `td_area` VALUES ('360123', '安义县', '360100', '9');
INSERT INTO `td_area` VALUES ('360124', '进贤县', '360100', '10');
INSERT INTO `td_area` VALUES ('360201', '市辖区', '360200', '1');
INSERT INTO `td_area` VALUES ('360202', '昌江区', '360200', '2');
INSERT INTO `td_area` VALUES ('360203', '珠山区', '360200', '3');
INSERT INTO `td_area` VALUES ('360222', '浮梁县', '360200', '4');
INSERT INTO `td_area` VALUES ('360281', '乐平市', '360200', '5');
INSERT INTO `td_area` VALUES ('360301', '市辖区', '360300', '1');
INSERT INTO `td_area` VALUES ('360302', '安源区', '360300', '2');
INSERT INTO `td_area` VALUES ('360313', '湘东区', '360300', '3');
INSERT INTO `td_area` VALUES ('360321', '莲花县', '360300', '4');
INSERT INTO `td_area` VALUES ('360322', '上栗县', '360300', '5');
INSERT INTO `td_area` VALUES ('360323', '芦溪县', '360300', '6');
INSERT INTO `td_area` VALUES ('360401', '市辖区', '360400', '1');
INSERT INTO `td_area` VALUES ('360402', '庐山区', '360400', '2');
INSERT INTO `td_area` VALUES ('360403', '浔阳区', '360400', '3');
INSERT INTO `td_area` VALUES ('360421', '九江县', '360400', '4');
INSERT INTO `td_area` VALUES ('360423', '武宁县', '360400', '5');
INSERT INTO `td_area` VALUES ('360424', '修水县', '360400', '6');
INSERT INTO `td_area` VALUES ('360425', '永修县', '360400', '7');
INSERT INTO `td_area` VALUES ('360426', '德安县', '360400', '8');
INSERT INTO `td_area` VALUES ('360427', '星子县', '360400', '9');
INSERT INTO `td_area` VALUES ('360428', '都昌县', '360400', '10');
INSERT INTO `td_area` VALUES ('360429', '湖口县', '360400', '11');
INSERT INTO `td_area` VALUES ('360430', '彭泽县', '360400', '12');
INSERT INTO `td_area` VALUES ('360481', '瑞昌市', '360400', '13');
INSERT INTO `td_area` VALUES ('360501', '市辖区', '360500', '1');
INSERT INTO `td_area` VALUES ('360502', '渝水区', '360500', '2');
INSERT INTO `td_area` VALUES ('360521', '分宜县', '360500', '3');
INSERT INTO `td_area` VALUES ('360601', '市辖区', '360600', '1');
INSERT INTO `td_area` VALUES ('360602', '月湖区', '360600', '2');
INSERT INTO `td_area` VALUES ('360622', '余江县', '360600', '3');
INSERT INTO `td_area` VALUES ('360681', '贵溪市', '360600', '4');
INSERT INTO `td_area` VALUES ('360701', '市辖区', '360700', '1');
INSERT INTO `td_area` VALUES ('360702', '章贡区', '360700', '2');
INSERT INTO `td_area` VALUES ('360721', '赣　县', '360700', '3');
INSERT INTO `td_area` VALUES ('360722', '信丰县', '360700', '4');
INSERT INTO `td_area` VALUES ('360723', '大余县', '360700', '5');
INSERT INTO `td_area` VALUES ('360724', '上犹县', '360700', '6');
INSERT INTO `td_area` VALUES ('360725', '崇义县', '360700', '7');
INSERT INTO `td_area` VALUES ('360726', '安远县', '360700', '8');
INSERT INTO `td_area` VALUES ('360727', '龙南县', '360700', '9');
INSERT INTO `td_area` VALUES ('360728', '定南县', '360700', '10');
INSERT INTO `td_area` VALUES ('360729', '全南县', '360700', '11');
INSERT INTO `td_area` VALUES ('360730', '宁都县', '360700', '12');
INSERT INTO `td_area` VALUES ('360731', '于都县', '360700', '13');
INSERT INTO `td_area` VALUES ('360732', '兴国县', '360700', '14');
INSERT INTO `td_area` VALUES ('360733', '会昌县', '360700', '15');
INSERT INTO `td_area` VALUES ('360734', '寻乌县', '360700', '16');
INSERT INTO `td_area` VALUES ('360735', '石城县', '360700', '17');
INSERT INTO `td_area` VALUES ('360781', '瑞金市', '360700', '18');
INSERT INTO `td_area` VALUES ('360782', '南康市', '360700', '19');
INSERT INTO `td_area` VALUES ('360801', '市辖区', '360800', '1');
INSERT INTO `td_area` VALUES ('360802', '吉州区', '360800', '2');
INSERT INTO `td_area` VALUES ('360803', '青原区', '360800', '3');
INSERT INTO `td_area` VALUES ('360821', '吉安县', '360800', '4');
INSERT INTO `td_area` VALUES ('360822', '吉水县', '360800', '5');
INSERT INTO `td_area` VALUES ('360823', '峡江县', '360800', '6');
INSERT INTO `td_area` VALUES ('360824', '新干县', '360800', '7');
INSERT INTO `td_area` VALUES ('360825', '永丰县', '360800', '8');
INSERT INTO `td_area` VALUES ('360826', '泰和县', '360800', '9');
INSERT INTO `td_area` VALUES ('360827', '遂川县', '360800', '10');
INSERT INTO `td_area` VALUES ('360828', '万安县', '360800', '11');
INSERT INTO `td_area` VALUES ('360829', '安福县', '360800', '12');
INSERT INTO `td_area` VALUES ('360830', '永新县', '360800', '13');
INSERT INTO `td_area` VALUES ('360881', '井冈山市', '360800', '14');
INSERT INTO `td_area` VALUES ('360901', '市辖区', '360900', '1');
INSERT INTO `td_area` VALUES ('360902', '袁州区', '360900', '2');
INSERT INTO `td_area` VALUES ('360921', '奉新县', '360900', '3');
INSERT INTO `td_area` VALUES ('360922', '万载县', '360900', '4');
INSERT INTO `td_area` VALUES ('360923', '上高县', '360900', '5');
INSERT INTO `td_area` VALUES ('360924', '宜丰县', '360900', '6');
INSERT INTO `td_area` VALUES ('360925', '靖安县', '360900', '7');
INSERT INTO `td_area` VALUES ('360926', '铜鼓县', '360900', '8');
INSERT INTO `td_area` VALUES ('360981', '丰城市', '360900', '9');
INSERT INTO `td_area` VALUES ('360982', '樟树市', '360900', '10');
INSERT INTO `td_area` VALUES ('360983', '高安市', '360900', '11');
INSERT INTO `td_area` VALUES ('361001', '市辖区', '361000', '1');
INSERT INTO `td_area` VALUES ('361002', '临川区', '361000', '2');
INSERT INTO `td_area` VALUES ('361021', '南城县', '361000', '3');
INSERT INTO `td_area` VALUES ('361022', '黎川县', '361000', '4');
INSERT INTO `td_area` VALUES ('361023', '南丰县', '361000', '5');
INSERT INTO `td_area` VALUES ('361024', '崇仁县', '361000', '6');
INSERT INTO `td_area` VALUES ('361025', '乐安县', '361000', '7');
INSERT INTO `td_area` VALUES ('361026', '宜黄县', '361000', '8');
INSERT INTO `td_area` VALUES ('361027', '金溪县', '361000', '9');
INSERT INTO `td_area` VALUES ('361028', '资溪县', '361000', '10');
INSERT INTO `td_area` VALUES ('361029', '东乡县', '361000', '11');
INSERT INTO `td_area` VALUES ('361030', '广昌县', '361000', '12');
INSERT INTO `td_area` VALUES ('361101', '市辖区', '361100', '1');
INSERT INTO `td_area` VALUES ('361102', '信州区', '361100', '2');
INSERT INTO `td_area` VALUES ('361121', '上饶县', '361100', '3');
INSERT INTO `td_area` VALUES ('361122', '广丰县', '361100', '4');
INSERT INTO `td_area` VALUES ('361123', '玉山县', '361100', '5');
INSERT INTO `td_area` VALUES ('361124', '铅山县', '361100', '6');
INSERT INTO `td_area` VALUES ('361125', '横峰县', '361100', '7');
INSERT INTO `td_area` VALUES ('361126', '弋阳县', '361100', '8');
INSERT INTO `td_area` VALUES ('361127', '余干县', '361100', '9');
INSERT INTO `td_area` VALUES ('361128', '鄱阳县', '361100', '10');
INSERT INTO `td_area` VALUES ('361129', '万年县', '361100', '11');
INSERT INTO `td_area` VALUES ('361130', '婺源县', '361100', '12');
INSERT INTO `td_area` VALUES ('361181', '德兴市', '361100', '13');
INSERT INTO `td_area` VALUES ('370101', '市辖区', '370100', '1');
INSERT INTO `td_area` VALUES ('370102', '历下区', '370100', '2');
INSERT INTO `td_area` VALUES ('370103', '市中区', '370100', '3');
INSERT INTO `td_area` VALUES ('370104', '槐荫区', '370100', '4');
INSERT INTO `td_area` VALUES ('370105', '天桥区', '370100', '5');
INSERT INTO `td_area` VALUES ('370112', '历城区', '370100', '6');
INSERT INTO `td_area` VALUES ('370113', '长清区', '370100', '7');
INSERT INTO `td_area` VALUES ('370124', '平阴县', '370100', '8');
INSERT INTO `td_area` VALUES ('370125', '济阳县', '370100', '9');
INSERT INTO `td_area` VALUES ('370126', '商河县', '370100', '10');
INSERT INTO `td_area` VALUES ('370181', '章丘市', '370100', '11');
INSERT INTO `td_area` VALUES ('370201', '市辖区', '370200', '1');
INSERT INTO `td_area` VALUES ('370202', '市南区', '370200', '2');
INSERT INTO `td_area` VALUES ('370203', '市北区', '370200', '3');
INSERT INTO `td_area` VALUES ('370205', '四方区', '370200', '4');
INSERT INTO `td_area` VALUES ('370211', '黄岛区', '370200', '5');
INSERT INTO `td_area` VALUES ('370212', '崂山区', '370200', '6');
INSERT INTO `td_area` VALUES ('370213', '李沧区', '370200', '7');
INSERT INTO `td_area` VALUES ('370214', '城阳区', '370200', '8');
INSERT INTO `td_area` VALUES ('370281', '胶州市', '370200', '9');
INSERT INTO `td_area` VALUES ('370282', '即墨市', '370200', '10');
INSERT INTO `td_area` VALUES ('370283', '平度市', '370200', '11');
INSERT INTO `td_area` VALUES ('370284', '胶南市', '370200', '12');
INSERT INTO `td_area` VALUES ('370285', '莱西市', '370200', '13');
INSERT INTO `td_area` VALUES ('370301', '市辖区', '370300', '1');
INSERT INTO `td_area` VALUES ('370302', '淄川区', '370300', '2');
INSERT INTO `td_area` VALUES ('370303', '张店区', '370300', '3');
INSERT INTO `td_area` VALUES ('370304', '博山区', '370300', '4');
INSERT INTO `td_area` VALUES ('370305', '临淄区', '370300', '5');
INSERT INTO `td_area` VALUES ('370306', '周村区', '370300', '6');
INSERT INTO `td_area` VALUES ('370321', '桓台县', '370300', '7');
INSERT INTO `td_area` VALUES ('370322', '高青县', '370300', '8');
INSERT INTO `td_area` VALUES ('370323', '沂源县', '370300', '9');
INSERT INTO `td_area` VALUES ('370401', '市辖区', '370400', '1');
INSERT INTO `td_area` VALUES ('370402', '市中区', '370400', '2');
INSERT INTO `td_area` VALUES ('370403', '薛城区', '370400', '3');
INSERT INTO `td_area` VALUES ('370404', '峄城区', '370400', '4');
INSERT INTO `td_area` VALUES ('370405', '台儿庄区', '370400', '5');
INSERT INTO `td_area` VALUES ('370406', '山亭区', '370400', '6');
INSERT INTO `td_area` VALUES ('370481', '滕州市', '370400', '7');
INSERT INTO `td_area` VALUES ('370501', '市辖区', '370500', '1');
INSERT INTO `td_area` VALUES ('370502', '东营区', '370500', '2');
INSERT INTO `td_area` VALUES ('370503', '河口区', '370500', '3');
INSERT INTO `td_area` VALUES ('370521', '垦利县', '370500', '4');
INSERT INTO `td_area` VALUES ('370522', '利津县', '370500', '5');
INSERT INTO `td_area` VALUES ('370523', '广饶县', '370500', '6');
INSERT INTO `td_area` VALUES ('370601', '市辖区', '370600', '1');
INSERT INTO `td_area` VALUES ('370602', '芝罘区', '370600', '2');
INSERT INTO `td_area` VALUES ('370611', '福山区', '370600', '3');
INSERT INTO `td_area` VALUES ('370612', '牟平区', '370600', '4');
INSERT INTO `td_area` VALUES ('370613', '莱山区', '370600', '5');
INSERT INTO `td_area` VALUES ('370634', '长岛县', '370600', '6');
INSERT INTO `td_area` VALUES ('370681', '龙口市', '370600', '7');
INSERT INTO `td_area` VALUES ('370682', '莱阳市', '370600', '8');
INSERT INTO `td_area` VALUES ('370683', '莱州市', '370600', '9');
INSERT INTO `td_area` VALUES ('370684', '蓬莱市', '370600', '10');
INSERT INTO `td_area` VALUES ('370685', '招远市', '370600', '11');
INSERT INTO `td_area` VALUES ('370686', '栖霞市', '370600', '12');
INSERT INTO `td_area` VALUES ('370687', '海阳市', '370600', '13');
INSERT INTO `td_area` VALUES ('370701', '市辖区', '370700', '1');
INSERT INTO `td_area` VALUES ('370702', '潍城区', '370700', '2');
INSERT INTO `td_area` VALUES ('370703', '寒亭区', '370700', '3');
INSERT INTO `td_area` VALUES ('370704', '坊子区', '370700', '4');
INSERT INTO `td_area` VALUES ('370705', '奎文区', '370700', '5');
INSERT INTO `td_area` VALUES ('370724', '临朐县', '370700', '6');
INSERT INTO `td_area` VALUES ('370725', '昌乐县', '370700', '7');
INSERT INTO `td_area` VALUES ('370781', '青州市', '370700', '8');
INSERT INTO `td_area` VALUES ('370782', '诸城市', '370700', '9');
INSERT INTO `td_area` VALUES ('370783', '寿光市', '370700', '10');
INSERT INTO `td_area` VALUES ('370784', '安丘市', '370700', '11');
INSERT INTO `td_area` VALUES ('370785', '高密市', '370700', '12');
INSERT INTO `td_area` VALUES ('370786', '昌邑市', '370700', '13');
INSERT INTO `td_area` VALUES ('370801', '市辖区', '370800', '1');
INSERT INTO `td_area` VALUES ('370802', '市中区', '370800', '2');
INSERT INTO `td_area` VALUES ('370811', '任城区', '370800', '3');
INSERT INTO `td_area` VALUES ('370826', '微山县', '370800', '4');
INSERT INTO `td_area` VALUES ('370827', '鱼台县', '370800', '5');
INSERT INTO `td_area` VALUES ('370828', '金乡县', '370800', '6');
INSERT INTO `td_area` VALUES ('370829', '嘉祥县', '370800', '7');
INSERT INTO `td_area` VALUES ('370830', '汶上县', '370800', '8');
INSERT INTO `td_area` VALUES ('370831', '泗水县', '370800', '9');
INSERT INTO `td_area` VALUES ('370832', '梁山县', '370800', '10');
INSERT INTO `td_area` VALUES ('370881', '曲阜市', '370800', '11');
INSERT INTO `td_area` VALUES ('370882', '兖州市', '370800', '12');
INSERT INTO `td_area` VALUES ('370883', '邹城市', '370800', '13');
INSERT INTO `td_area` VALUES ('370901', '市辖区', '370900', '1');
INSERT INTO `td_area` VALUES ('370902', '泰山区', '370900', '2');
INSERT INTO `td_area` VALUES ('370903', '岱岳区', '370900', '3');
INSERT INTO `td_area` VALUES ('370921', '宁阳县', '370900', '4');
INSERT INTO `td_area` VALUES ('370923', '东平县', '370900', '5');
INSERT INTO `td_area` VALUES ('370982', '新泰市', '370900', '6');
INSERT INTO `td_area` VALUES ('370983', '肥城市', '370900', '7');
INSERT INTO `td_area` VALUES ('371001', '市辖区', '371000', '1');
INSERT INTO `td_area` VALUES ('371002', '环翠区', '371000', '2');
INSERT INTO `td_area` VALUES ('371081', '文登市', '371000', '3');
INSERT INTO `td_area` VALUES ('371082', '荣成市', '371000', '4');
INSERT INTO `td_area` VALUES ('371083', '乳山市', '371000', '5');
INSERT INTO `td_area` VALUES ('371101', '市辖区', '371100', '1');
INSERT INTO `td_area` VALUES ('371102', '东港区', '371100', '2');
INSERT INTO `td_area` VALUES ('371103', '岚山区', '371100', '3');
INSERT INTO `td_area` VALUES ('371121', '五莲县', '371100', '4');
INSERT INTO `td_area` VALUES ('371122', '莒　县', '371100', '5');
INSERT INTO `td_area` VALUES ('371201', '市辖区', '371200', '1');
INSERT INTO `td_area` VALUES ('371202', '莱城区', '371200', '2');
INSERT INTO `td_area` VALUES ('371203', '钢城区', '371200', '3');
INSERT INTO `td_area` VALUES ('371301', '市辖区', '371300', '1');
INSERT INTO `td_area` VALUES ('371302', '兰山区', '371300', '2');
INSERT INTO `td_area` VALUES ('371311', '罗庄区', '371300', '3');
INSERT INTO `td_area` VALUES ('371312', '河东区', '371300', '4');
INSERT INTO `td_area` VALUES ('371321', '沂南县', '371300', '5');
INSERT INTO `td_area` VALUES ('371322', '郯城县', '371300', '6');
INSERT INTO `td_area` VALUES ('371323', '沂水县', '371300', '7');
INSERT INTO `td_area` VALUES ('371324', '苍山县', '371300', '8');
INSERT INTO `td_area` VALUES ('371325', '费　县', '371300', '9');
INSERT INTO `td_area` VALUES ('371326', '平邑县', '371300', '10');
INSERT INTO `td_area` VALUES ('371327', '莒南县', '371300', '11');
INSERT INTO `td_area` VALUES ('371328', '蒙阴县', '371300', '12');
INSERT INTO `td_area` VALUES ('371329', '临沭县', '371300', '13');
INSERT INTO `td_area` VALUES ('371401', '市辖区', '371400', '1');
INSERT INTO `td_area` VALUES ('371402', '德城区', '371400', '2');
INSERT INTO `td_area` VALUES ('371421', '陵　县', '371400', '3');
INSERT INTO `td_area` VALUES ('371422', '宁津县', '371400', '4');
INSERT INTO `td_area` VALUES ('371423', '庆云县', '371400', '5');
INSERT INTO `td_area` VALUES ('371424', '临邑县', '371400', '6');
INSERT INTO `td_area` VALUES ('371425', '齐河县', '371400', '7');
INSERT INTO `td_area` VALUES ('371426', '平原县', '371400', '8');
INSERT INTO `td_area` VALUES ('371427', '夏津县', '371400', '9');
INSERT INTO `td_area` VALUES ('371428', '武城县', '371400', '10');
INSERT INTO `td_area` VALUES ('371481', '乐陵市', '371400', '11');
INSERT INTO `td_area` VALUES ('371482', '禹城市', '371400', '12');
INSERT INTO `td_area` VALUES ('371501', '市辖区', '371500', '1');
INSERT INTO `td_area` VALUES ('371502', '东昌府区', '371500', '2');
INSERT INTO `td_area` VALUES ('371521', '阳谷县', '371500', '3');
INSERT INTO `td_area` VALUES ('371522', '莘　县', '371500', '4');
INSERT INTO `td_area` VALUES ('371523', '茌平县', '371500', '5');
INSERT INTO `td_area` VALUES ('371524', '东阿县', '371500', '6');
INSERT INTO `td_area` VALUES ('371525', '冠　县', '371500', '7');
INSERT INTO `td_area` VALUES ('371526', '高唐县', '371500', '8');
INSERT INTO `td_area` VALUES ('371581', '临清市', '371500', '9');
INSERT INTO `td_area` VALUES ('371601', '市辖区', '371600', '1');
INSERT INTO `td_area` VALUES ('371602', '滨城区', '371600', '2');
INSERT INTO `td_area` VALUES ('371621', '惠民县', '371600', '3');
INSERT INTO `td_area` VALUES ('371622', '阳信县', '371600', '4');
INSERT INTO `td_area` VALUES ('371623', '无棣县', '371600', '5');
INSERT INTO `td_area` VALUES ('371624', '沾化县', '371600', '6');
INSERT INTO `td_area` VALUES ('371625', '博兴县', '371600', '7');
INSERT INTO `td_area` VALUES ('371626', '邹平县', '371600', '8');
INSERT INTO `td_area` VALUES ('371701', '市辖区', '371700', '1');
INSERT INTO `td_area` VALUES ('371702', '牡丹区', '371700', '2');
INSERT INTO `td_area` VALUES ('371721', '曹　县', '371700', '3');
INSERT INTO `td_area` VALUES ('371722', '单　县', '371700', '4');
INSERT INTO `td_area` VALUES ('371723', '成武县', '371700', '5');
INSERT INTO `td_area` VALUES ('371724', '巨野县', '371700', '6');
INSERT INTO `td_area` VALUES ('371725', '郓城县', '371700', '7');
INSERT INTO `td_area` VALUES ('371726', '鄄城县', '371700', '8');
INSERT INTO `td_area` VALUES ('371727', '定陶县', '371700', '9');
INSERT INTO `td_area` VALUES ('371728', '东明县', '371700', '10');
INSERT INTO `td_area` VALUES ('410101', '市辖区', '410100', '1');
INSERT INTO `td_area` VALUES ('410102', '中原区', '410100', '2');
INSERT INTO `td_area` VALUES ('410103', '二七区', '410100', '3');
INSERT INTO `td_area` VALUES ('410104', '管城回族区', '410100', '4');
INSERT INTO `td_area` VALUES ('410105', '金水区', '410100', '5');
INSERT INTO `td_area` VALUES ('410106', '上街区', '410100', '6');
INSERT INTO `td_area` VALUES ('410108', '邙山区', '410100', '7');
INSERT INTO `td_area` VALUES ('410122', '中牟县', '410100', '8');
INSERT INTO `td_area` VALUES ('410181', '巩义市', '410100', '9');
INSERT INTO `td_area` VALUES ('410182', '荥阳市', '410100', '10');
INSERT INTO `td_area` VALUES ('410183', '新密市', '410100', '11');
INSERT INTO `td_area` VALUES ('410184', '新郑市', '410100', '12');
INSERT INTO `td_area` VALUES ('410185', '登封市', '410100', '13');
INSERT INTO `td_area` VALUES ('410201', '市辖区', '410200', '1');
INSERT INTO `td_area` VALUES ('410202', '龙亭区', '410200', '2');
INSERT INTO `td_area` VALUES ('410203', '顺河回族区', '410200', '3');
INSERT INTO `td_area` VALUES ('410204', '鼓楼区', '410200', '4');
INSERT INTO `td_area` VALUES ('410205', '南关区', '410200', '5');
INSERT INTO `td_area` VALUES ('410211', '郊　区', '410200', '6');
INSERT INTO `td_area` VALUES ('410221', '杞　县', '410200', '7');
INSERT INTO `td_area` VALUES ('410222', '通许县', '410200', '8');
INSERT INTO `td_area` VALUES ('410223', '尉氏县', '410200', '9');
INSERT INTO `td_area` VALUES ('410224', '开封县', '410200', '10');
INSERT INTO `td_area` VALUES ('410225', '兰考县', '410200', '11');
INSERT INTO `td_area` VALUES ('410301', '市辖区', '410300', '1');
INSERT INTO `td_area` VALUES ('410302', '老城区', '410300', '2');
INSERT INTO `td_area` VALUES ('410303', '西工区', '410300', '3');
INSERT INTO `td_area` VALUES ('410304', '廛河回族区', '410300', '4');
INSERT INTO `td_area` VALUES ('410305', '涧西区', '410300', '5');
INSERT INTO `td_area` VALUES ('410306', '吉利区', '410300', '6');
INSERT INTO `td_area` VALUES ('410307', '洛龙区', '410300', '7');
INSERT INTO `td_area` VALUES ('410322', '孟津县', '410300', '8');
INSERT INTO `td_area` VALUES ('410323', '新安县', '410300', '9');
INSERT INTO `td_area` VALUES ('410324', '栾川县', '410300', '10');
INSERT INTO `td_area` VALUES ('410325', '嵩　县', '410300', '11');
INSERT INTO `td_area` VALUES ('410326', '汝阳县', '410300', '12');
INSERT INTO `td_area` VALUES ('410327', '宜阳县', '410300', '13');
INSERT INTO `td_area` VALUES ('410328', '洛宁县', '410300', '14');
INSERT INTO `td_area` VALUES ('410329', '伊川县', '410300', '15');
INSERT INTO `td_area` VALUES ('410381', '偃师市', '410300', '16');
INSERT INTO `td_area` VALUES ('410401', '市辖区', '410400', '1');
INSERT INTO `td_area` VALUES ('410402', '新华区', '410400', '2');
INSERT INTO `td_area` VALUES ('410403', '卫东区', '410400', '3');
INSERT INTO `td_area` VALUES ('410404', '石龙区', '410400', '4');
INSERT INTO `td_area` VALUES ('410411', '湛河区', '410400', '5');
INSERT INTO `td_area` VALUES ('410421', '宝丰县', '410400', '6');
INSERT INTO `td_area` VALUES ('410422', '叶　县', '410400', '7');
INSERT INTO `td_area` VALUES ('410423', '鲁山县', '410400', '8');
INSERT INTO `td_area` VALUES ('410425', '郏　县', '410400', '9');
INSERT INTO `td_area` VALUES ('410481', '舞钢市', '410400', '10');
INSERT INTO `td_area` VALUES ('410482', '汝州市', '410400', '11');
INSERT INTO `td_area` VALUES ('410501', '市辖区', '410500', '1');
INSERT INTO `td_area` VALUES ('410502', '文峰区', '410500', '2');
INSERT INTO `td_area` VALUES ('410503', '北关区', '410500', '3');
INSERT INTO `td_area` VALUES ('410505', '殷都区', '410500', '4');
INSERT INTO `td_area` VALUES ('410506', '龙安区', '410500', '5');
INSERT INTO `td_area` VALUES ('410522', '安阳县', '410500', '6');
INSERT INTO `td_area` VALUES ('410523', '汤阴县', '410500', '7');
INSERT INTO `td_area` VALUES ('410526', '滑　县', '410500', '8');
INSERT INTO `td_area` VALUES ('410527', '内黄县', '410500', '9');
INSERT INTO `td_area` VALUES ('410581', '林州市', '410500', '10');
INSERT INTO `td_area` VALUES ('410601', '市辖区', '410600', '1');
INSERT INTO `td_area` VALUES ('410602', '鹤山区', '410600', '2');
INSERT INTO `td_area` VALUES ('410603', '山城区', '410600', '3');
INSERT INTO `td_area` VALUES ('410611', '淇滨区', '410600', '4');
INSERT INTO `td_area` VALUES ('410621', '浚　县', '410600', '5');
INSERT INTO `td_area` VALUES ('410622', '淇　县', '410600', '6');
INSERT INTO `td_area` VALUES ('410701', '市辖区', '410700', '1');
INSERT INTO `td_area` VALUES ('410702', '红旗区', '410700', '2');
INSERT INTO `td_area` VALUES ('410703', '卫滨区', '410700', '3');
INSERT INTO `td_area` VALUES ('410704', '凤泉区', '410700', '4');
INSERT INTO `td_area` VALUES ('410711', '牧野区', '410700', '5');
INSERT INTO `td_area` VALUES ('410721', '新乡县', '410700', '6');
INSERT INTO `td_area` VALUES ('410724', '获嘉县', '410700', '7');
INSERT INTO `td_area` VALUES ('410725', '原阳县', '410700', '8');
INSERT INTO `td_area` VALUES ('410726', '延津县', '410700', '9');
INSERT INTO `td_area` VALUES ('410727', '封丘县', '410700', '10');
INSERT INTO `td_area` VALUES ('410728', '长垣县', '410700', '11');
INSERT INTO `td_area` VALUES ('410781', '卫辉市', '410700', '12');
INSERT INTO `td_area` VALUES ('410782', '辉县市', '410700', '13');
INSERT INTO `td_area` VALUES ('410801', '市辖区', '410800', '1');
INSERT INTO `td_area` VALUES ('410802', '解放区', '410800', '2');
INSERT INTO `td_area` VALUES ('410803', '中站区', '410800', '3');
INSERT INTO `td_area` VALUES ('410804', '马村区', '410800', '4');
INSERT INTO `td_area` VALUES ('410811', '山阳区', '410800', '5');
INSERT INTO `td_area` VALUES ('410821', '修武县', '410800', '6');
INSERT INTO `td_area` VALUES ('410822', '博爱县', '410800', '7');
INSERT INTO `td_area` VALUES ('410823', '武陟县', '410800', '8');
INSERT INTO `td_area` VALUES ('410825', '温　县', '410800', '9');
INSERT INTO `td_area` VALUES ('410881', '济源市', '410800', '10');
INSERT INTO `td_area` VALUES ('410882', '沁阳市', '410800', '11');
INSERT INTO `td_area` VALUES ('410883', '孟州市', '410800', '12');
INSERT INTO `td_area` VALUES ('410901', '市辖区', '410900', '1');
INSERT INTO `td_area` VALUES ('410902', '华龙区', '410900', '2');
INSERT INTO `td_area` VALUES ('410922', '清丰县', '410900', '3');
INSERT INTO `td_area` VALUES ('410923', '南乐县', '410900', '4');
INSERT INTO `td_area` VALUES ('410926', '范　县', '410900', '5');
INSERT INTO `td_area` VALUES ('410927', '台前县', '410900', '6');
INSERT INTO `td_area` VALUES ('410928', '濮阳县', '410900', '7');
INSERT INTO `td_area` VALUES ('411001', '市辖区', '411000', '1');
INSERT INTO `td_area` VALUES ('411002', '魏都区', '411000', '2');
INSERT INTO `td_area` VALUES ('411023', '许昌县', '411000', '3');
INSERT INTO `td_area` VALUES ('411024', '鄢陵县', '411000', '4');
INSERT INTO `td_area` VALUES ('411025', '襄城县', '411000', '5');
INSERT INTO `td_area` VALUES ('411081', '禹州市', '411000', '6');
INSERT INTO `td_area` VALUES ('411082', '长葛市', '411000', '7');
INSERT INTO `td_area` VALUES ('411101', '市辖区', '411100', '1');
INSERT INTO `td_area` VALUES ('411102', '源汇区', '411100', '2');
INSERT INTO `td_area` VALUES ('411103', '郾城区', '411100', '3');
INSERT INTO `td_area` VALUES ('411104', '召陵区', '411100', '4');
INSERT INTO `td_area` VALUES ('411121', '舞阳县', '411100', '5');
INSERT INTO `td_area` VALUES ('411122', '临颍县', '411100', '6');
INSERT INTO `td_area` VALUES ('411201', '市辖区', '411200', '1');
INSERT INTO `td_area` VALUES ('411202', '湖滨区', '411200', '2');
INSERT INTO `td_area` VALUES ('411221', '渑池县', '411200', '3');
INSERT INTO `td_area` VALUES ('411222', '陕　县', '411200', '4');
INSERT INTO `td_area` VALUES ('411224', '卢氏县', '411200', '5');
INSERT INTO `td_area` VALUES ('411281', '义马市', '411200', '6');
INSERT INTO `td_area` VALUES ('411282', '灵宝市', '411200', '7');
INSERT INTO `td_area` VALUES ('411301', '市辖区', '411300', '1');
INSERT INTO `td_area` VALUES ('411302', '宛城区', '411300', '2');
INSERT INTO `td_area` VALUES ('411303', '卧龙区', '411300', '3');
INSERT INTO `td_area` VALUES ('411321', '南召县', '411300', '4');
INSERT INTO `td_area` VALUES ('411322', '方城县', '411300', '5');
INSERT INTO `td_area` VALUES ('411323', '西峡县', '411300', '6');
INSERT INTO `td_area` VALUES ('411324', '镇平县', '411300', '7');
INSERT INTO `td_area` VALUES ('411325', '内乡县', '411300', '8');
INSERT INTO `td_area` VALUES ('411326', '淅川县', '411300', '9');
INSERT INTO `td_area` VALUES ('411327', '社旗县', '411300', '10');
INSERT INTO `td_area` VALUES ('411328', '唐河县', '411300', '11');
INSERT INTO `td_area` VALUES ('411329', '新野县', '411300', '12');
INSERT INTO `td_area` VALUES ('411330', '桐柏县', '411300', '13');
INSERT INTO `td_area` VALUES ('411381', '邓州市', '411300', '14');
INSERT INTO `td_area` VALUES ('411401', '市辖区', '411400', '1');
INSERT INTO `td_area` VALUES ('411402', '梁园区', '411400', '2');
INSERT INTO `td_area` VALUES ('411403', '睢阳区', '411400', '3');
INSERT INTO `td_area` VALUES ('411421', '民权县', '411400', '4');
INSERT INTO `td_area` VALUES ('411422', '睢　县', '411400', '5');
INSERT INTO `td_area` VALUES ('411423', '宁陵县', '411400', '6');
INSERT INTO `td_area` VALUES ('411424', '柘城县', '411400', '7');
INSERT INTO `td_area` VALUES ('411425', '虞城县', '411400', '8');
INSERT INTO `td_area` VALUES ('411426', '夏邑县', '411400', '9');
INSERT INTO `td_area` VALUES ('411481', '永城市', '411400', '10');
INSERT INTO `td_area` VALUES ('411501', '市辖区', '411500', '1');
INSERT INTO `td_area` VALUES ('411502', '师河区', '411500', '2');
INSERT INTO `td_area` VALUES ('411503', '平桥区', '411500', '3');
INSERT INTO `td_area` VALUES ('411521', '罗山县', '411500', '4');
INSERT INTO `td_area` VALUES ('411522', '光山县', '411500', '5');
INSERT INTO `td_area` VALUES ('411523', '新　县', '411500', '6');
INSERT INTO `td_area` VALUES ('411524', '商城县', '411500', '7');
INSERT INTO `td_area` VALUES ('411525', '固始县', '411500', '8');
INSERT INTO `td_area` VALUES ('411526', '潢川县', '411500', '9');
INSERT INTO `td_area` VALUES ('411527', '淮滨县', '411500', '10');
INSERT INTO `td_area` VALUES ('411528', '息　县', '411500', '11');
INSERT INTO `td_area` VALUES ('411601', '市辖区', '411600', '1');
INSERT INTO `td_area` VALUES ('411602', '川汇区', '411600', '2');
INSERT INTO `td_area` VALUES ('411621', '扶沟县', '411600', '3');
INSERT INTO `td_area` VALUES ('411622', '西华县', '411600', '4');
INSERT INTO `td_area` VALUES ('411623', '商水县', '411600', '5');
INSERT INTO `td_area` VALUES ('411624', '沈丘县', '411600', '6');
INSERT INTO `td_area` VALUES ('411625', '郸城县', '411600', '7');
INSERT INTO `td_area` VALUES ('411626', '淮阳县', '411600', '8');
INSERT INTO `td_area` VALUES ('411627', '太康县', '411600', '9');
INSERT INTO `td_area` VALUES ('411628', '鹿邑县', '411600', '10');
INSERT INTO `td_area` VALUES ('411681', '项城市', '411600', '11');
INSERT INTO `td_area` VALUES ('411701', '市辖区', '411700', '1');
INSERT INTO `td_area` VALUES ('411702', '驿城区', '411700', '2');
INSERT INTO `td_area` VALUES ('411721', '西平县', '411700', '3');
INSERT INTO `td_area` VALUES ('411722', '上蔡县', '411700', '4');
INSERT INTO `td_area` VALUES ('411723', '平舆县', '411700', '5');
INSERT INTO `td_area` VALUES ('411724', '正阳县', '411700', '6');
INSERT INTO `td_area` VALUES ('411725', '确山县', '411700', '7');
INSERT INTO `td_area` VALUES ('411726', '泌阳县', '411700', '8');
INSERT INTO `td_area` VALUES ('411727', '汝南县', '411700', '9');
INSERT INTO `td_area` VALUES ('411728', '遂平县', '411700', '10');
INSERT INTO `td_area` VALUES ('411729', '新蔡县', '411700', '11');
INSERT INTO `td_area` VALUES ('420101', '市辖区', '420100', '1');
INSERT INTO `td_area` VALUES ('420102', '江岸区', '420100', '2');
INSERT INTO `td_area` VALUES ('420103', '江汉区', '420100', '3');
INSERT INTO `td_area` VALUES ('420104', '乔口区', '420100', '4');
INSERT INTO `td_area` VALUES ('420105', '汉阳区', '420100', '5');
INSERT INTO `td_area` VALUES ('420106', '武昌区', '420100', '6');
INSERT INTO `td_area` VALUES ('420107', '青山区', '420100', '7');
INSERT INTO `td_area` VALUES ('420111', '洪山区', '420100', '8');
INSERT INTO `td_area` VALUES ('420112', '东西湖区', '420100', '9');
INSERT INTO `td_area` VALUES ('420113', '汉南区', '420100', '10');
INSERT INTO `td_area` VALUES ('420114', '蔡甸区', '420100', '11');
INSERT INTO `td_area` VALUES ('420115', '江夏区', '420100', '12');
INSERT INTO `td_area` VALUES ('420116', '黄陂区', '420100', '13');
INSERT INTO `td_area` VALUES ('420117', '新洲区', '420100', '14');
INSERT INTO `td_area` VALUES ('420201', '市辖区', '420200', '1');
INSERT INTO `td_area` VALUES ('420202', '黄石港区', '420200', '2');
INSERT INTO `td_area` VALUES ('420203', '西塞山区', '420200', '3');
INSERT INTO `td_area` VALUES ('420204', '下陆区', '420200', '4');
INSERT INTO `td_area` VALUES ('420205', '铁山区', '420200', '5');
INSERT INTO `td_area` VALUES ('420222', '阳新县', '420200', '6');
INSERT INTO `td_area` VALUES ('420281', '大冶市', '420200', '7');
INSERT INTO `td_area` VALUES ('420301', '市辖区', '420300', '1');
INSERT INTO `td_area` VALUES ('420302', '茅箭区', '420300', '2');
INSERT INTO `td_area` VALUES ('420303', '张湾区', '420300', '3');
INSERT INTO `td_area` VALUES ('420321', '郧　县', '420300', '4');
INSERT INTO `td_area` VALUES ('420322', '郧西县', '420300', '5');
INSERT INTO `td_area` VALUES ('420323', '竹山县', '420300', '6');
INSERT INTO `td_area` VALUES ('420324', '竹溪县', '420300', '7');
INSERT INTO `td_area` VALUES ('420325', '房　县', '420300', '8');
INSERT INTO `td_area` VALUES ('420381', '丹江口市', '420300', '9');
INSERT INTO `td_area` VALUES ('420501', '市辖区', '420500', '1');
INSERT INTO `td_area` VALUES ('420502', '西陵区', '420500', '2');
INSERT INTO `td_area` VALUES ('420503', '伍家岗区', '420500', '3');
INSERT INTO `td_area` VALUES ('420504', '点军区', '420500', '4');
INSERT INTO `td_area` VALUES ('420505', '猇亭区', '420500', '5');
INSERT INTO `td_area` VALUES ('420506', '夷陵区', '420500', '6');
INSERT INTO `td_area` VALUES ('420525', '远安县', '420500', '7');
INSERT INTO `td_area` VALUES ('420526', '兴山县', '420500', '8');
INSERT INTO `td_area` VALUES ('420527', '秭归县', '420500', '9');
INSERT INTO `td_area` VALUES ('420528', '长阳土家族自治县', '420500', '10');
INSERT INTO `td_area` VALUES ('420529', '五峰土家族自治县', '420500', '11');
INSERT INTO `td_area` VALUES ('420581', '宜都市', '420500', '12');
INSERT INTO `td_area` VALUES ('420582', '当阳市', '420500', '13');
INSERT INTO `td_area` VALUES ('420583', '枝江市', '420500', '14');
INSERT INTO `td_area` VALUES ('420601', '市辖区', '420600', '1');
INSERT INTO `td_area` VALUES ('420602', '襄城区', '420600', '2');
INSERT INTO `td_area` VALUES ('420606', '樊城区', '420600', '3');
INSERT INTO `td_area` VALUES ('420607', '襄阳区', '420600', '4');
INSERT INTO `td_area` VALUES ('420624', '南漳县', '420600', '5');
INSERT INTO `td_area` VALUES ('420625', '谷城县', '420600', '6');
INSERT INTO `td_area` VALUES ('420626', '保康县', '420600', '7');
INSERT INTO `td_area` VALUES ('420682', '老河口市', '420600', '8');
INSERT INTO `td_area` VALUES ('420683', '枣阳市', '420600', '9');
INSERT INTO `td_area` VALUES ('420684', '宜城市', '420600', '10');
INSERT INTO `td_area` VALUES ('420701', '市辖区', '420700', '1');
INSERT INTO `td_area` VALUES ('420702', '梁子湖区', '420700', '2');
INSERT INTO `td_area` VALUES ('420703', '华容区', '420700', '3');
INSERT INTO `td_area` VALUES ('420704', '鄂城区', '420700', '4');
INSERT INTO `td_area` VALUES ('420801', '市辖区', '420800', '1');
INSERT INTO `td_area` VALUES ('420802', '东宝区', '420800', '2');
INSERT INTO `td_area` VALUES ('420804', '掇刀区', '420800', '3');
INSERT INTO `td_area` VALUES ('420821', '京山县', '420800', '4');
INSERT INTO `td_area` VALUES ('420822', '沙洋县', '420800', '5');
INSERT INTO `td_area` VALUES ('420881', '钟祥市', '420800', '6');
INSERT INTO `td_area` VALUES ('420901', '市辖区', '420900', '1');
INSERT INTO `td_area` VALUES ('420902', '孝南区', '420900', '2');
INSERT INTO `td_area` VALUES ('420921', '孝昌县', '420900', '3');
INSERT INTO `td_area` VALUES ('420922', '大悟县', '420900', '4');
INSERT INTO `td_area` VALUES ('420923', '云梦县', '420900', '5');
INSERT INTO `td_area` VALUES ('420981', '应城市', '420900', '6');
INSERT INTO `td_area` VALUES ('420982', '安陆市', '420900', '7');
INSERT INTO `td_area` VALUES ('420984', '汉川市', '420900', '8');
INSERT INTO `td_area` VALUES ('421001', '市辖区', '421000', '1');
INSERT INTO `td_area` VALUES ('421002', '沙市区', '421000', '2');
INSERT INTO `td_area` VALUES ('421003', '荆州区', '421000', '3');
INSERT INTO `td_area` VALUES ('421022', '公安县', '421000', '4');
INSERT INTO `td_area` VALUES ('421023', '监利县', '421000', '5');
INSERT INTO `td_area` VALUES ('421024', '江陵县', '421000', '6');
INSERT INTO `td_area` VALUES ('421081', '石首市', '421000', '7');
INSERT INTO `td_area` VALUES ('421083', '洪湖市', '421000', '8');
INSERT INTO `td_area` VALUES ('421087', '松滋市', '421000', '9');
INSERT INTO `td_area` VALUES ('421101', '市辖区', '421100', '1');
INSERT INTO `td_area` VALUES ('421102', '黄州区', '421100', '2');
INSERT INTO `td_area` VALUES ('421121', '团风县', '421100', '3');
INSERT INTO `td_area` VALUES ('421122', '红安县', '421100', '4');
INSERT INTO `td_area` VALUES ('421123', '罗田县', '421100', '5');
INSERT INTO `td_area` VALUES ('421124', '英山县', '421100', '6');
INSERT INTO `td_area` VALUES ('421125', '浠水县', '421100', '7');
INSERT INTO `td_area` VALUES ('421126', '蕲春县', '421100', '8');
INSERT INTO `td_area` VALUES ('421127', '黄梅县', '421100', '9');
INSERT INTO `td_area` VALUES ('421181', '麻城市', '421100', '10');
INSERT INTO `td_area` VALUES ('421182', '武穴市', '421100', '11');
INSERT INTO `td_area` VALUES ('421201', '市辖区', '421200', '1');
INSERT INTO `td_area` VALUES ('421202', '咸安区', '421200', '2');
INSERT INTO `td_area` VALUES ('421221', '嘉鱼县', '421200', '3');
INSERT INTO `td_area` VALUES ('421222', '通城县', '421200', '4');
INSERT INTO `td_area` VALUES ('421223', '崇阳县', '421200', '5');
INSERT INTO `td_area` VALUES ('421224', '通山县', '421200', '6');
INSERT INTO `td_area` VALUES ('421281', '赤壁市', '421200', '7');
INSERT INTO `td_area` VALUES ('421301', '市辖区', '421300', '1');
INSERT INTO `td_area` VALUES ('421302', '曾都区', '421300', '2');
INSERT INTO `td_area` VALUES ('421381', '广水市', '421300', '3');
INSERT INTO `td_area` VALUES ('422801', '恩施市', '422800', '1');
INSERT INTO `td_area` VALUES ('422802', '利川市', '422800', '2');
INSERT INTO `td_area` VALUES ('422822', '建始县', '422800', '3');
INSERT INTO `td_area` VALUES ('422823', '巴东县', '422800', '4');
INSERT INTO `td_area` VALUES ('422825', '宣恩县', '422800', '5');
INSERT INTO `td_area` VALUES ('422826', '咸丰县', '422800', '6');
INSERT INTO `td_area` VALUES ('422827', '来凤县', '422800', '7');
INSERT INTO `td_area` VALUES ('422828', '鹤峰县', '422800', '8');
INSERT INTO `td_area` VALUES ('429004', '仙桃市', '429000', '1');
INSERT INTO `td_area` VALUES ('429005', '潜江市', '429000', '2');
INSERT INTO `td_area` VALUES ('429006', '天门市', '429000', '3');
INSERT INTO `td_area` VALUES ('429021', '神农架林区', '429000', '4');
INSERT INTO `td_area` VALUES ('430101', '市辖区', '430100', '1');
INSERT INTO `td_area` VALUES ('430102', '芙蓉区', '430100', '2');
INSERT INTO `td_area` VALUES ('430103', '天心区', '430100', '3');
INSERT INTO `td_area` VALUES ('430104', '岳麓区', '430100', '4');
INSERT INTO `td_area` VALUES ('430105', '开福区', '430100', '5');
INSERT INTO `td_area` VALUES ('430111', '雨花区', '430100', '6');
INSERT INTO `td_area` VALUES ('430121', '长沙县', '430100', '7');
INSERT INTO `td_area` VALUES ('430122', '望城县', '430100', '8');
INSERT INTO `td_area` VALUES ('430124', '宁乡县', '430100', '9');
INSERT INTO `td_area` VALUES ('430181', '浏阳市', '430100', '10');
INSERT INTO `td_area` VALUES ('430201', '市辖区', '430200', '1');
INSERT INTO `td_area` VALUES ('430202', '荷塘区', '430200', '2');
INSERT INTO `td_area` VALUES ('430203', '芦淞区', '430200', '3');
INSERT INTO `td_area` VALUES ('430204', '石峰区', '430200', '4');
INSERT INTO `td_area` VALUES ('430211', '天元区', '430200', '5');
INSERT INTO `td_area` VALUES ('430221', '株洲县', '430200', '6');
INSERT INTO `td_area` VALUES ('430223', '攸　县', '430200', '7');
INSERT INTO `td_area` VALUES ('430224', '茶陵县', '430200', '8');
INSERT INTO `td_area` VALUES ('430225', '炎陵县', '430200', '9');
INSERT INTO `td_area` VALUES ('430281', '醴陵市', '430200', '10');
INSERT INTO `td_area` VALUES ('430301', '市辖区', '430300', '1');
INSERT INTO `td_area` VALUES ('430302', '雨湖区', '430300', '2');
INSERT INTO `td_area` VALUES ('430304', '岳塘区', '430300', '3');
INSERT INTO `td_area` VALUES ('430321', '湘潭县', '430300', '4');
INSERT INTO `td_area` VALUES ('430381', '湘乡市', '430300', '5');
INSERT INTO `td_area` VALUES ('430382', '韶山市', '430300', '6');
INSERT INTO `td_area` VALUES ('430401', '市辖区', '430400', '1');
INSERT INTO `td_area` VALUES ('430405', '珠晖区', '430400', '2');
INSERT INTO `td_area` VALUES ('430406', '雁峰区', '430400', '3');
INSERT INTO `td_area` VALUES ('430407', '石鼓区', '430400', '4');
INSERT INTO `td_area` VALUES ('430408', '蒸湘区', '430400', '5');
INSERT INTO `td_area` VALUES ('430412', '南岳区', '430400', '6');
INSERT INTO `td_area` VALUES ('430421', '衡阳县', '430400', '7');
INSERT INTO `td_area` VALUES ('430422', '衡南县', '430400', '8');
INSERT INTO `td_area` VALUES ('430423', '衡山县', '430400', '9');
INSERT INTO `td_area` VALUES ('430424', '衡东县', '430400', '10');
INSERT INTO `td_area` VALUES ('430426', '祁东县', '430400', '11');
INSERT INTO `td_area` VALUES ('430481', '耒阳市', '430400', '12');
INSERT INTO `td_area` VALUES ('430482', '常宁市', '430400', '13');
INSERT INTO `td_area` VALUES ('430501', '市辖区', '430500', '1');
INSERT INTO `td_area` VALUES ('430502', '双清区', '430500', '2');
INSERT INTO `td_area` VALUES ('430503', '大祥区', '430500', '3');
INSERT INTO `td_area` VALUES ('430511', '北塔区', '430500', '4');
INSERT INTO `td_area` VALUES ('430521', '邵东县', '430500', '5');
INSERT INTO `td_area` VALUES ('430522', '新邵县', '430500', '6');
INSERT INTO `td_area` VALUES ('430523', '邵阳县', '430500', '7');
INSERT INTO `td_area` VALUES ('430524', '隆回县', '430500', '8');
INSERT INTO `td_area` VALUES ('430525', '洞口县', '430500', '9');
INSERT INTO `td_area` VALUES ('430527', '绥宁县', '430500', '10');
INSERT INTO `td_area` VALUES ('430528', '新宁县', '430500', '11');
INSERT INTO `td_area` VALUES ('430529', '城步苗族自治县', '430500', '12');
INSERT INTO `td_area` VALUES ('430581', '武冈市', '430500', '13');
INSERT INTO `td_area` VALUES ('430601', '市辖区', '430600', '1');
INSERT INTO `td_area` VALUES ('430602', '岳阳楼区', '430600', '2');
INSERT INTO `td_area` VALUES ('430603', '云溪区', '430600', '3');
INSERT INTO `td_area` VALUES ('430611', '君山区', '430600', '4');
INSERT INTO `td_area` VALUES ('430621', '岳阳县', '430600', '5');
INSERT INTO `td_area` VALUES ('430623', '华容县', '430600', '6');
INSERT INTO `td_area` VALUES ('430624', '湘阴县', '430600', '7');
INSERT INTO `td_area` VALUES ('430626', '平江县', '430600', '8');
INSERT INTO `td_area` VALUES ('430681', '汨罗市', '430600', '9');
INSERT INTO `td_area` VALUES ('430682', '临湘市', '430600', '10');
INSERT INTO `td_area` VALUES ('430701', '市辖区', '430700', '1');
INSERT INTO `td_area` VALUES ('430702', '武陵区', '430700', '2');
INSERT INTO `td_area` VALUES ('430703', '鼎城区', '430700', '3');
INSERT INTO `td_area` VALUES ('430721', '安乡县', '430700', '4');
INSERT INTO `td_area` VALUES ('430722', '汉寿县', '430700', '5');
INSERT INTO `td_area` VALUES ('430723', '澧　县', '430700', '6');
INSERT INTO `td_area` VALUES ('430724', '临澧县', '430700', '7');
INSERT INTO `td_area` VALUES ('430725', '桃源县', '430700', '8');
INSERT INTO `td_area` VALUES ('430726', '石门县', '430700', '9');
INSERT INTO `td_area` VALUES ('430781', '津市市', '430700', '10');
INSERT INTO `td_area` VALUES ('430801', '市辖区', '430800', '1');
INSERT INTO `td_area` VALUES ('430802', '永定区', '430800', '2');
INSERT INTO `td_area` VALUES ('430811', '武陵源区', '430800', '3');
INSERT INTO `td_area` VALUES ('430821', '慈利县', '430800', '4');
INSERT INTO `td_area` VALUES ('430822', '桑植县', '430800', '5');
INSERT INTO `td_area` VALUES ('430901', '市辖区', '430900', '1');
INSERT INTO `td_area` VALUES ('430902', '资阳区', '430900', '2');
INSERT INTO `td_area` VALUES ('430903', '赫山区', '430900', '3');
INSERT INTO `td_area` VALUES ('430921', '南　县', '430900', '4');
INSERT INTO `td_area` VALUES ('430922', '桃江县', '430900', '5');
INSERT INTO `td_area` VALUES ('430923', '安化县', '430900', '6');
INSERT INTO `td_area` VALUES ('430981', '沅江市', '430900', '7');
INSERT INTO `td_area` VALUES ('431001', '市辖区', '431000', '1');
INSERT INTO `td_area` VALUES ('431002', '北湖区', '431000', '2');
INSERT INTO `td_area` VALUES ('431003', '苏仙区', '431000', '3');
INSERT INTO `td_area` VALUES ('431021', '桂阳县', '431000', '4');
INSERT INTO `td_area` VALUES ('431022', '宜章县', '431000', '5');
INSERT INTO `td_area` VALUES ('431023', '永兴县', '431000', '6');
INSERT INTO `td_area` VALUES ('431024', '嘉禾县', '431000', '7');
INSERT INTO `td_area` VALUES ('431025', '临武县', '431000', '8');
INSERT INTO `td_area` VALUES ('431026', '汝城县', '431000', '9');
INSERT INTO `td_area` VALUES ('431027', '桂东县', '431000', '10');
INSERT INTO `td_area` VALUES ('431028', '安仁县', '431000', '11');
INSERT INTO `td_area` VALUES ('431081', '资兴市', '431000', '12');
INSERT INTO `td_area` VALUES ('431101', '市辖区', '431100', '1');
INSERT INTO `td_area` VALUES ('431102', '芝山区', '431100', '2');
INSERT INTO `td_area` VALUES ('431103', '冷水滩区', '431100', '3');
INSERT INTO `td_area` VALUES ('431121', '祁阳县', '431100', '4');
INSERT INTO `td_area` VALUES ('431122', '东安县', '431100', '5');
INSERT INTO `td_area` VALUES ('431123', '双牌县', '431100', '6');
INSERT INTO `td_area` VALUES ('431124', '道　县', '431100', '7');
INSERT INTO `td_area` VALUES ('431125', '江永县', '431100', '8');
INSERT INTO `td_area` VALUES ('431126', '宁远县', '431100', '9');
INSERT INTO `td_area` VALUES ('431127', '蓝山县', '431100', '10');
INSERT INTO `td_area` VALUES ('431128', '新田县', '431100', '11');
INSERT INTO `td_area` VALUES ('431129', '江华瑶族自治县', '431100', '12');
INSERT INTO `td_area` VALUES ('431201', '市辖区', '431200', '1');
INSERT INTO `td_area` VALUES ('431202', '鹤城区', '431200', '2');
INSERT INTO `td_area` VALUES ('431221', '中方县', '431200', '3');
INSERT INTO `td_area` VALUES ('431222', '沅陵县', '431200', '4');
INSERT INTO `td_area` VALUES ('431223', '辰溪县', '431200', '5');
INSERT INTO `td_area` VALUES ('431224', '溆浦县', '431200', '6');
INSERT INTO `td_area` VALUES ('431225', '会同县', '431200', '7');
INSERT INTO `td_area` VALUES ('431226', '麻阳苗族自治县', '431200', '8');
INSERT INTO `td_area` VALUES ('431227', '新晃侗族自治县', '431200', '9');
INSERT INTO `td_area` VALUES ('431228', '芷江侗族自治县', '431200', '10');
INSERT INTO `td_area` VALUES ('431229', '靖州苗族侗族自治县', '431200', '11');
INSERT INTO `td_area` VALUES ('431230', '通道侗族自治县', '431200', '12');
INSERT INTO `td_area` VALUES ('431281', '洪江市', '431200', '13');
INSERT INTO `td_area` VALUES ('431301', '市辖区', '431300', '1');
INSERT INTO `td_area` VALUES ('431302', '娄星区', '431300', '2');
INSERT INTO `td_area` VALUES ('431321', '双峰县', '431300', '3');
INSERT INTO `td_area` VALUES ('431322', '新化县', '431300', '4');
INSERT INTO `td_area` VALUES ('431381', '冷水江市', '431300', '5');
INSERT INTO `td_area` VALUES ('431382', '涟源市', '431300', '6');
INSERT INTO `td_area` VALUES ('433101', '吉首市', '433100', '1');
INSERT INTO `td_area` VALUES ('433122', '泸溪县', '433100', '2');
INSERT INTO `td_area` VALUES ('433123', '凤凰县', '433100', '3');
INSERT INTO `td_area` VALUES ('433124', '花垣县', '433100', '4');
INSERT INTO `td_area` VALUES ('433125', '保靖县', '433100', '5');
INSERT INTO `td_area` VALUES ('433126', '古丈县', '433100', '6');
INSERT INTO `td_area` VALUES ('433127', '永顺县', '433100', '7');
INSERT INTO `td_area` VALUES ('433130', '龙山县', '433100', '8');
INSERT INTO `td_area` VALUES ('440101', '市辖区', '440100', '1');
INSERT INTO `td_area` VALUES ('440102', '东山区', '440100', '2');
INSERT INTO `td_area` VALUES ('440103', '荔湾区', '440100', '3');
INSERT INTO `td_area` VALUES ('440104', '越秀区', '440100', '4');
INSERT INTO `td_area` VALUES ('440105', '海珠区', '440100', '5');
INSERT INTO `td_area` VALUES ('440106', '天河区', '440100', '6');
INSERT INTO `td_area` VALUES ('440107', '芳村区', '440100', '7');
INSERT INTO `td_area` VALUES ('440111', '白云区', '440100', '8');
INSERT INTO `td_area` VALUES ('440112', '黄埔区', '440100', '9');
INSERT INTO `td_area` VALUES ('440113', '番禺区', '440100', '10');
INSERT INTO `td_area` VALUES ('440114', '花都区', '440100', '11');
INSERT INTO `td_area` VALUES ('440183', '增城市', '440100', '12');
INSERT INTO `td_area` VALUES ('440184', '从化市', '440100', '13');
INSERT INTO `td_area` VALUES ('440201', '市辖区', '440200', '1');
INSERT INTO `td_area` VALUES ('440203', '武江区', '440200', '2');
INSERT INTO `td_area` VALUES ('440204', '浈江区', '440200', '3');
INSERT INTO `td_area` VALUES ('440205', '曲江区', '440200', '4');
INSERT INTO `td_area` VALUES ('440222', '始兴县', '440200', '5');
INSERT INTO `td_area` VALUES ('440224', '仁化县', '440200', '6');
INSERT INTO `td_area` VALUES ('440229', '翁源县', '440200', '7');
INSERT INTO `td_area` VALUES ('440232', '乳源瑶族自治县', '440200', '8');
INSERT INTO `td_area` VALUES ('440233', '新丰县', '440200', '9');
INSERT INTO `td_area` VALUES ('440281', '乐昌市', '440200', '10');
INSERT INTO `td_area` VALUES ('440282', '南雄市', '440200', '11');
INSERT INTO `td_area` VALUES ('440301', '市辖区', '440300', '1');
INSERT INTO `td_area` VALUES ('440303', '罗湖区', '440300', '2');
INSERT INTO `td_area` VALUES ('440304', '福田区', '440300', '3');
INSERT INTO `td_area` VALUES ('440305', '南山区', '440300', '4');
INSERT INTO `td_area` VALUES ('440306', '宝安区', '440300', '5');
INSERT INTO `td_area` VALUES ('440307', '龙岗区', '440300', '6');
INSERT INTO `td_area` VALUES ('440308', '盐田区', '440300', '7');
INSERT INTO `td_area` VALUES ('440401', '市辖区', '440400', '1');
INSERT INTO `td_area` VALUES ('440402', '香洲区', '440400', '2');
INSERT INTO `td_area` VALUES ('440403', '斗门区', '440400', '3');
INSERT INTO `td_area` VALUES ('440404', '金湾区', '440400', '4');
INSERT INTO `td_area` VALUES ('440501', '市辖区', '440500', '1');
INSERT INTO `td_area` VALUES ('440507', '龙湖区', '440500', '2');
INSERT INTO `td_area` VALUES ('440511', '金平区', '440500', '3');
INSERT INTO `td_area` VALUES ('440512', '濠江区', '440500', '4');
INSERT INTO `td_area` VALUES ('440513', '潮阳区', '440500', '5');
INSERT INTO `td_area` VALUES ('440514', '潮南区', '440500', '6');
INSERT INTO `td_area` VALUES ('440515', '澄海区', '440500', '7');
INSERT INTO `td_area` VALUES ('440523', '南澳县', '440500', '8');
INSERT INTO `td_area` VALUES ('440601', '市辖区', '440600', '1');
INSERT INTO `td_area` VALUES ('440604', '禅城区', '440600', '2');
INSERT INTO `td_area` VALUES ('440605', '南海区', '440600', '3');
INSERT INTO `td_area` VALUES ('440606', '顺德区', '440600', '4');
INSERT INTO `td_area` VALUES ('440607', '三水区', '440600', '5');
INSERT INTO `td_area` VALUES ('440608', '高明区', '440600', '6');
INSERT INTO `td_area` VALUES ('440701', '市辖区', '440700', '1');
INSERT INTO `td_area` VALUES ('440703', '蓬江区', '440700', '2');
INSERT INTO `td_area` VALUES ('440704', '江海区', '440700', '3');
INSERT INTO `td_area` VALUES ('440705', '新会区', '440700', '4');
INSERT INTO `td_area` VALUES ('440781', '台山市', '440700', '5');
INSERT INTO `td_area` VALUES ('440783', '开平市', '440700', '6');
INSERT INTO `td_area` VALUES ('440784', '鹤山市', '440700', '7');
INSERT INTO `td_area` VALUES ('440785', '恩平市', '440700', '8');
INSERT INTO `td_area` VALUES ('440801', '市辖区', '440800', '1');
INSERT INTO `td_area` VALUES ('440802', '赤坎区', '440800', '2');
INSERT INTO `td_area` VALUES ('440803', '霞山区', '440800', '3');
INSERT INTO `td_area` VALUES ('440804', '坡头区', '440800', '4');
INSERT INTO `td_area` VALUES ('440811', '麻章区', '440800', '5');
INSERT INTO `td_area` VALUES ('440823', '遂溪县', '440800', '6');
INSERT INTO `td_area` VALUES ('440825', '徐闻县', '440800', '7');
INSERT INTO `td_area` VALUES ('440881', '廉江市', '440800', '8');
INSERT INTO `td_area` VALUES ('440882', '雷州市', '440800', '9');
INSERT INTO `td_area` VALUES ('440883', '吴川市', '440800', '10');
INSERT INTO `td_area` VALUES ('440901', '市辖区', '440900', '1');
INSERT INTO `td_area` VALUES ('440902', '茂南区', '440900', '2');
INSERT INTO `td_area` VALUES ('440903', '茂港区', '440900', '3');
INSERT INTO `td_area` VALUES ('440923', '电白县', '440900', '4');
INSERT INTO `td_area` VALUES ('440981', '高州市', '440900', '5');
INSERT INTO `td_area` VALUES ('440982', '化州市', '440900', '6');
INSERT INTO `td_area` VALUES ('440983', '信宜市', '440900', '7');
INSERT INTO `td_area` VALUES ('441201', '市辖区', '441200', '1');
INSERT INTO `td_area` VALUES ('441202', '端州区', '441200', '2');
INSERT INTO `td_area` VALUES ('441203', '鼎湖区', '441200', '3');
INSERT INTO `td_area` VALUES ('441223', '广宁县', '441200', '4');
INSERT INTO `td_area` VALUES ('441224', '怀集县', '441200', '5');
INSERT INTO `td_area` VALUES ('441225', '封开县', '441200', '6');
INSERT INTO `td_area` VALUES ('441226', '德庆县', '441200', '7');
INSERT INTO `td_area` VALUES ('441283', '高要市', '441200', '8');
INSERT INTO `td_area` VALUES ('441284', '四会市', '441200', '9');
INSERT INTO `td_area` VALUES ('441301', '市辖区', '441300', '1');
INSERT INTO `td_area` VALUES ('441302', '惠城区', '441300', '2');
INSERT INTO `td_area` VALUES ('441303', '惠阳区', '441300', '3');
INSERT INTO `td_area` VALUES ('441322', '博罗县', '441300', '4');
INSERT INTO `td_area` VALUES ('441323', '惠东县', '441300', '5');
INSERT INTO `td_area` VALUES ('441324', '龙门县', '441300', '6');
INSERT INTO `td_area` VALUES ('441401', '市辖区', '441400', '1');
INSERT INTO `td_area` VALUES ('441402', '梅江区', '441400', '2');
INSERT INTO `td_area` VALUES ('441421', '梅　县', '441400', '3');
INSERT INTO `td_area` VALUES ('441422', '大埔县', '441400', '4');
INSERT INTO `td_area` VALUES ('441423', '丰顺县', '441400', '5');
INSERT INTO `td_area` VALUES ('441424', '五华县', '441400', '6');
INSERT INTO `td_area` VALUES ('441426', '平远县', '441400', '7');
INSERT INTO `td_area` VALUES ('441427', '蕉岭县', '441400', '8');
INSERT INTO `td_area` VALUES ('441481', '兴宁市', '441400', '9');
INSERT INTO `td_area` VALUES ('441501', '市辖区', '441500', '1');
INSERT INTO `td_area` VALUES ('441502', '城　区', '441500', '2');
INSERT INTO `td_area` VALUES ('441521', '海丰县', '441500', '3');
INSERT INTO `td_area` VALUES ('441523', '陆河县', '441500', '4');
INSERT INTO `td_area` VALUES ('441581', '陆丰市', '441500', '5');
INSERT INTO `td_area` VALUES ('441601', '市辖区', '441600', '1');
INSERT INTO `td_area` VALUES ('441602', '源城区', '441600', '2');
INSERT INTO `td_area` VALUES ('441621', '紫金县', '441600', '3');
INSERT INTO `td_area` VALUES ('441622', '龙川县', '441600', '4');
INSERT INTO `td_area` VALUES ('441623', '连平县', '441600', '5');
INSERT INTO `td_area` VALUES ('441624', '和平县', '441600', '6');
INSERT INTO `td_area` VALUES ('441625', '东源县', '441600', '7');
INSERT INTO `td_area` VALUES ('441701', '市辖区', '441700', '1');
INSERT INTO `td_area` VALUES ('441702', '江城区', '441700', '2');
INSERT INTO `td_area` VALUES ('441721', '阳西县', '441700', '3');
INSERT INTO `td_area` VALUES ('441723', '阳东县', '441700', '4');
INSERT INTO `td_area` VALUES ('441781', '阳春市', '441700', '5');
INSERT INTO `td_area` VALUES ('441801', '市辖区', '441800', '1');
INSERT INTO `td_area` VALUES ('441802', '清城区', '441800', '2');
INSERT INTO `td_area` VALUES ('441821', '佛冈县', '441800', '3');
INSERT INTO `td_area` VALUES ('441823', '阳山县', '441800', '4');
INSERT INTO `td_area` VALUES ('441825', '连山壮族瑶族自治县', '441800', '5');
INSERT INTO `td_area` VALUES ('441826', '连南瑶族自治县', '441800', '6');
INSERT INTO `td_area` VALUES ('441827', '清新县', '441800', '7');
INSERT INTO `td_area` VALUES ('441881', '英德市', '441800', '8');
INSERT INTO `td_area` VALUES ('441882', '连州市', '441800', '9');
INSERT INTO `td_area` VALUES ('445101', '市辖区', '445100', '1');
INSERT INTO `td_area` VALUES ('445102', '湘桥区', '445100', '2');
INSERT INTO `td_area` VALUES ('445121', '潮安县', '445100', '3');
INSERT INTO `td_area` VALUES ('445122', '饶平县', '445100', '4');
INSERT INTO `td_area` VALUES ('445201', '市辖区', '445200', '1');
INSERT INTO `td_area` VALUES ('445202', '榕城区', '445200', '2');
INSERT INTO `td_area` VALUES ('445221', '揭东县', '445200', '3');
INSERT INTO `td_area` VALUES ('445222', '揭西县', '445200', '4');
INSERT INTO `td_area` VALUES ('445224', '惠来县', '445200', '5');
INSERT INTO `td_area` VALUES ('445281', '普宁市', '445200', '6');
INSERT INTO `td_area` VALUES ('445301', '市辖区', '445300', '1');
INSERT INTO `td_area` VALUES ('445302', '云城区', '445300', '2');
INSERT INTO `td_area` VALUES ('445321', '新兴县', '445300', '3');
INSERT INTO `td_area` VALUES ('445322', '郁南县', '445300', '4');
INSERT INTO `td_area` VALUES ('445323', '云安县', '445300', '5');
INSERT INTO `td_area` VALUES ('445381', '罗定市', '445300', '6');
INSERT INTO `td_area` VALUES ('450101', '市辖区', '450100', '1');
INSERT INTO `td_area` VALUES ('450102', '兴宁区', '450100', '2');
INSERT INTO `td_area` VALUES ('450103', '青秀区', '450100', '3');
INSERT INTO `td_area` VALUES ('450105', '江南区', '450100', '4');
INSERT INTO `td_area` VALUES ('450107', '西乡塘区', '450100', '5');
INSERT INTO `td_area` VALUES ('450108', '良庆区', '450100', '6');
INSERT INTO `td_area` VALUES ('450109', '邕宁区', '450100', '7');
INSERT INTO `td_area` VALUES ('450122', '武鸣县', '450100', '8');
INSERT INTO `td_area` VALUES ('450123', '隆安县', '450100', '9');
INSERT INTO `td_area` VALUES ('450124', '马山县', '450100', '10');
INSERT INTO `td_area` VALUES ('450125', '上林县', '450100', '11');
INSERT INTO `td_area` VALUES ('450126', '宾阳县', '450100', '12');
INSERT INTO `td_area` VALUES ('450127', '横　县', '450100', '13');
INSERT INTO `td_area` VALUES ('450201', '市辖区', '450200', '1');
INSERT INTO `td_area` VALUES ('450202', '城中区', '450200', '2');
INSERT INTO `td_area` VALUES ('450203', '鱼峰区', '450200', '3');
INSERT INTO `td_area` VALUES ('450204', '柳南区', '450200', '4');
INSERT INTO `td_area` VALUES ('450205', '柳北区', '450200', '5');
INSERT INTO `td_area` VALUES ('450221', '柳江县', '450200', '6');
INSERT INTO `td_area` VALUES ('450222', '柳城县', '450200', '7');
INSERT INTO `td_area` VALUES ('450223', '鹿寨县', '450200', '8');
INSERT INTO `td_area` VALUES ('450224', '融安县', '450200', '9');
INSERT INTO `td_area` VALUES ('450225', '融水苗族自治县', '450200', '10');
INSERT INTO `td_area` VALUES ('450226', '三江侗族自治县', '450200', '11');
INSERT INTO `td_area` VALUES ('450301', '市辖区', '450300', '1');
INSERT INTO `td_area` VALUES ('450302', '秀峰区', '450300', '2');
INSERT INTO `td_area` VALUES ('450303', '叠彩区', '450300', '3');
INSERT INTO `td_area` VALUES ('450304', '象山区', '450300', '4');
INSERT INTO `td_area` VALUES ('450305', '七星区', '450300', '5');
INSERT INTO `td_area` VALUES ('450311', '雁山区', '450300', '6');
INSERT INTO `td_area` VALUES ('450321', '阳朔县', '450300', '7');
INSERT INTO `td_area` VALUES ('450322', '临桂县', '450300', '8');
INSERT INTO `td_area` VALUES ('450323', '灵川县', '450300', '9');
INSERT INTO `td_area` VALUES ('450324', '全州县', '450300', '10');
INSERT INTO `td_area` VALUES ('450325', '兴安县', '450300', '11');
INSERT INTO `td_area` VALUES ('450326', '永福县', '450300', '12');
INSERT INTO `td_area` VALUES ('450327', '灌阳县', '450300', '13');
INSERT INTO `td_area` VALUES ('450328', '龙胜各族自治县', '450300', '14');
INSERT INTO `td_area` VALUES ('450329', '资源县', '450300', '15');
INSERT INTO `td_area` VALUES ('450330', '平乐县', '450300', '16');
INSERT INTO `td_area` VALUES ('450331', '荔蒲县', '450300', '17');
INSERT INTO `td_area` VALUES ('450332', '恭城瑶族自治县', '450300', '18');
INSERT INTO `td_area` VALUES ('450401', '市辖区', '450400', '1');
INSERT INTO `td_area` VALUES ('450403', '万秀区', '450400', '2');
INSERT INTO `td_area` VALUES ('450404', '蝶山区', '450400', '3');
INSERT INTO `td_area` VALUES ('450405', '长洲区', '450400', '4');
INSERT INTO `td_area` VALUES ('450421', '苍梧县', '450400', '5');
INSERT INTO `td_area` VALUES ('450422', '藤　县', '450400', '6');
INSERT INTO `td_area` VALUES ('450423', '蒙山县', '450400', '7');
INSERT INTO `td_area` VALUES ('450481', '岑溪市', '450400', '8');
INSERT INTO `td_area` VALUES ('450501', '市辖区', '450500', '1');
INSERT INTO `td_area` VALUES ('450502', '海城区', '450500', '2');
INSERT INTO `td_area` VALUES ('450503', '银海区', '450500', '3');
INSERT INTO `td_area` VALUES ('450512', '铁山港区', '450500', '4');
INSERT INTO `td_area` VALUES ('450521', '合浦县', '450500', '5');
INSERT INTO `td_area` VALUES ('450601', '市辖区', '450600', '1');
INSERT INTO `td_area` VALUES ('450602', '港口区', '450600', '2');
INSERT INTO `td_area` VALUES ('450603', '防城区', '450600', '3');
INSERT INTO `td_area` VALUES ('450621', '上思县', '450600', '4');
INSERT INTO `td_area` VALUES ('450681', '东兴市', '450600', '5');
INSERT INTO `td_area` VALUES ('450701', '市辖区', '450700', '1');
INSERT INTO `td_area` VALUES ('450702', '钦南区', '450700', '2');
INSERT INTO `td_area` VALUES ('450703', '钦北区', '450700', '3');
INSERT INTO `td_area` VALUES ('450721', '灵山县', '450700', '4');
INSERT INTO `td_area` VALUES ('450722', '浦北县', '450700', '5');
INSERT INTO `td_area` VALUES ('450801', '市辖区', '450800', '1');
INSERT INTO `td_area` VALUES ('450802', '港北区', '450800', '2');
INSERT INTO `td_area` VALUES ('450803', '港南区', '450800', '3');
INSERT INTO `td_area` VALUES ('450804', '覃塘区', '450800', '4');
INSERT INTO `td_area` VALUES ('450821', '平南县', '450800', '5');
INSERT INTO `td_area` VALUES ('450881', '桂平市', '450800', '6');
INSERT INTO `td_area` VALUES ('450901', '市辖区', '450900', '1');
INSERT INTO `td_area` VALUES ('450902', '玉州区', '450900', '2');
INSERT INTO `td_area` VALUES ('450921', '容　县', '450900', '3');
INSERT INTO `td_area` VALUES ('450922', '陆川县', '450900', '4');
INSERT INTO `td_area` VALUES ('450923', '博白县', '450900', '5');
INSERT INTO `td_area` VALUES ('450924', '兴业县', '450900', '6');
INSERT INTO `td_area` VALUES ('450981', '北流市', '450900', '7');
INSERT INTO `td_area` VALUES ('451001', '市辖区', '451000', '1');
INSERT INTO `td_area` VALUES ('451002', '右江区', '451000', '2');
INSERT INTO `td_area` VALUES ('451021', '田阳县', '451000', '3');
INSERT INTO `td_area` VALUES ('451022', '田东县', '451000', '4');
INSERT INTO `td_area` VALUES ('451023', '平果县', '451000', '5');
INSERT INTO `td_area` VALUES ('451024', '德保县', '451000', '6');
INSERT INTO `td_area` VALUES ('451025', '靖西县', '451000', '7');
INSERT INTO `td_area` VALUES ('451026', '那坡县', '451000', '8');
INSERT INTO `td_area` VALUES ('451027', '凌云县', '451000', '9');
INSERT INTO `td_area` VALUES ('451028', '乐业县', '451000', '10');
INSERT INTO `td_area` VALUES ('451029', '田林县', '451000', '11');
INSERT INTO `td_area` VALUES ('451030', '西林县', '451000', '12');
INSERT INTO `td_area` VALUES ('451031', '隆林各族自治县', '451000', '13');
INSERT INTO `td_area` VALUES ('451101', '市辖区', '451100', '1');
INSERT INTO `td_area` VALUES ('451102', '八步区', '451100', '2');
INSERT INTO `td_area` VALUES ('451121', '昭平县', '451100', '3');
INSERT INTO `td_area` VALUES ('451122', '钟山县', '451100', '4');
INSERT INTO `td_area` VALUES ('451123', '富川瑶族自治县', '451100', '5');
INSERT INTO `td_area` VALUES ('451201', '市辖区', '451200', '1');
INSERT INTO `td_area` VALUES ('451202', '金城江区', '451200', '2');
INSERT INTO `td_area` VALUES ('451221', '南丹县', '451200', '3');
INSERT INTO `td_area` VALUES ('451222', '天峨县', '451200', '4');
INSERT INTO `td_area` VALUES ('451223', '凤山县', '451200', '5');
INSERT INTO `td_area` VALUES ('451224', '东兰县', '451200', '6');
INSERT INTO `td_area` VALUES ('451225', '罗城仫佬族自治县', '451200', '7');
INSERT INTO `td_area` VALUES ('451226', '环江毛南族自治县', '451200', '8');
INSERT INTO `td_area` VALUES ('451227', '巴马瑶族自治县', '451200', '9');
INSERT INTO `td_area` VALUES ('451228', '都安瑶族自治县', '451200', '10');
INSERT INTO `td_area` VALUES ('451229', '大化瑶族自治县', '451200', '11');
INSERT INTO `td_area` VALUES ('451281', '宜州市', '451200', '12');
INSERT INTO `td_area` VALUES ('451301', '市辖区', '451300', '1');
INSERT INTO `td_area` VALUES ('451302', '兴宾区', '451300', '2');
INSERT INTO `td_area` VALUES ('451321', '忻城县', '451300', '3');
INSERT INTO `td_area` VALUES ('451322', '象州县', '451300', '4');
INSERT INTO `td_area` VALUES ('451323', '武宣县', '451300', '5');
INSERT INTO `td_area` VALUES ('451324', '金秀瑶族自治县', '451300', '6');
INSERT INTO `td_area` VALUES ('451381', '合山市', '451300', '7');
INSERT INTO `td_area` VALUES ('451401', '市辖区', '451400', '1');
INSERT INTO `td_area` VALUES ('451402', '江洲区', '451400', '2');
INSERT INTO `td_area` VALUES ('451421', '扶绥县', '451400', '3');
INSERT INTO `td_area` VALUES ('451422', '宁明县', '451400', '4');
INSERT INTO `td_area` VALUES ('451423', '龙州县', '451400', '5');
INSERT INTO `td_area` VALUES ('451424', '大新县', '451400', '6');
INSERT INTO `td_area` VALUES ('451425', '天等县', '451400', '7');
INSERT INTO `td_area` VALUES ('451481', '凭祥市', '451400', '8');
INSERT INTO `td_area` VALUES ('460101', '市辖区', '460100', '1');
INSERT INTO `td_area` VALUES ('460105', '秀英区', '460100', '2');
INSERT INTO `td_area` VALUES ('460106', '龙华区', '460100', '3');
INSERT INTO `td_area` VALUES ('460107', '琼山区', '460100', '4');
INSERT INTO `td_area` VALUES ('460108', '美兰区', '460100', '5');
INSERT INTO `td_area` VALUES ('460201', '市辖区', '460200', '1');
INSERT INTO `td_area` VALUES ('469001', '五指山市', '469000', '1');
INSERT INTO `td_area` VALUES ('469002', '琼海市', '469000', '2');
INSERT INTO `td_area` VALUES ('469003', '儋州市', '469000', '3');
INSERT INTO `td_area` VALUES ('469005', '文昌市', '469000', '4');
INSERT INTO `td_area` VALUES ('469006', '万宁市', '469000', '5');
INSERT INTO `td_area` VALUES ('469007', '东方市', '469000', '6');
INSERT INTO `td_area` VALUES ('469025', '定安县', '469000', '7');
INSERT INTO `td_area` VALUES ('469026', '屯昌县', '469000', '8');
INSERT INTO `td_area` VALUES ('469027', '澄迈县', '469000', '9');
INSERT INTO `td_area` VALUES ('469028', '临高县', '469000', '10');
INSERT INTO `td_area` VALUES ('469030', '白沙黎族自治县', '469000', '11');
INSERT INTO `td_area` VALUES ('469031', '昌江黎族自治县', '469000', '12');
INSERT INTO `td_area` VALUES ('469033', '乐东黎族自治县', '469000', '13');
INSERT INTO `td_area` VALUES ('469034', '陵水黎族自治县', '469000', '14');
INSERT INTO `td_area` VALUES ('469035', '保亭黎族苗族自治县', '469000', '15');
INSERT INTO `td_area` VALUES ('469036', '琼中黎族苗族自治县', '469000', '16');
INSERT INTO `td_area` VALUES ('469037', '西沙群岛', '469000', '17');
INSERT INTO `td_area` VALUES ('469038', '南沙群岛', '469000', '18');
INSERT INTO `td_area` VALUES ('469039', '中沙群岛的岛礁及其海域', '469000', '19');
INSERT INTO `td_area` VALUES ('500101', '万州区', '500100', '1');
INSERT INTO `td_area` VALUES ('500102', '涪陵区', '500100', '2');
INSERT INTO `td_area` VALUES ('500103', '渝中区', '500100', '3');
INSERT INTO `td_area` VALUES ('500104', '大渡口区', '500100', '4');
INSERT INTO `td_area` VALUES ('500105', '江北区', '500100', '5');
INSERT INTO `td_area` VALUES ('500106', '沙坪坝区', '500100', '6');
INSERT INTO `td_area` VALUES ('500107', '九龙坡区', '500100', '7');
INSERT INTO `td_area` VALUES ('500108', '南岸区', '500100', '8');
INSERT INTO `td_area` VALUES ('500109', '北碚区', '500100', '9');
INSERT INTO `td_area` VALUES ('500110', '万盛区', '500100', '10');
INSERT INTO `td_area` VALUES ('500111', '双桥区', '500100', '11');
INSERT INTO `td_area` VALUES ('500112', '渝北区', '500100', '12');
INSERT INTO `td_area` VALUES ('500113', '巴南区', '500100', '13');
INSERT INTO `td_area` VALUES ('500114', '黔江区', '500100', '14');
INSERT INTO `td_area` VALUES ('500115', '长寿区', '500100', '15');
INSERT INTO `td_area` VALUES ('500222', '綦江县', '500200', '1');
INSERT INTO `td_area` VALUES ('500223', '潼南县', '500200', '2');
INSERT INTO `td_area` VALUES ('500224', '铜梁县', '500200', '3');
INSERT INTO `td_area` VALUES ('500225', '大足县', '500200', '4');
INSERT INTO `td_area` VALUES ('500226', '荣昌县', '500200', '5');
INSERT INTO `td_area` VALUES ('500227', '璧山县', '500200', '6');
INSERT INTO `td_area` VALUES ('500228', '梁平县', '500200', '7');
INSERT INTO `td_area` VALUES ('500229', '城口县', '500200', '8');
INSERT INTO `td_area` VALUES ('500230', '丰都县', '500200', '9');
INSERT INTO `td_area` VALUES ('500231', '垫江县', '500200', '10');
INSERT INTO `td_area` VALUES ('500232', '武隆县', '500200', '11');
INSERT INTO `td_area` VALUES ('500233', '忠　县', '500200', '12');
INSERT INTO `td_area` VALUES ('500234', '开　县', '500200', '13');
INSERT INTO `td_area` VALUES ('500235', '云阳县', '500200', '14');
INSERT INTO `td_area` VALUES ('500236', '奉节县', '500200', '15');
INSERT INTO `td_area` VALUES ('500237', '巫山县', '500200', '16');
INSERT INTO `td_area` VALUES ('500238', '巫溪县', '500200', '17');
INSERT INTO `td_area` VALUES ('500240', '石柱土家族自治县', '500200', '18');
INSERT INTO `td_area` VALUES ('500241', '秀山土家族苗族自治县', '500200', '19');
INSERT INTO `td_area` VALUES ('500242', '酉阳土家族苗族自治县', '500200', '20');
INSERT INTO `td_area` VALUES ('500243', '彭水苗族土家族自治县', '500200', '21');
INSERT INTO `td_area` VALUES ('500381', '江津市', '500300', '1');
INSERT INTO `td_area` VALUES ('500382', '合川市', '500300', '2');
INSERT INTO `td_area` VALUES ('500383', '永川市', '500300', '3');
INSERT INTO `td_area` VALUES ('500384', '南川市', '500300', '4');
INSERT INTO `td_area` VALUES ('510101', '市辖区', '510100', '1');
INSERT INTO `td_area` VALUES ('510104', '锦江区', '510100', '2');
INSERT INTO `td_area` VALUES ('510105', '青羊区', '510100', '3');
INSERT INTO `td_area` VALUES ('510106', '金牛区', '510100', '4');
INSERT INTO `td_area` VALUES ('510107', '武侯区', '510100', '5');
INSERT INTO `td_area` VALUES ('510108', '成华区', '510100', '6');
INSERT INTO `td_area` VALUES ('510112', '龙泉驿区', '510100', '7');
INSERT INTO `td_area` VALUES ('510113', '青白江区', '510100', '8');
INSERT INTO `td_area` VALUES ('510114', '新都区', '510100', '9');
INSERT INTO `td_area` VALUES ('510115', '温江区', '510100', '10');
INSERT INTO `td_area` VALUES ('510121', '金堂县', '510100', '11');
INSERT INTO `td_area` VALUES ('510122', '双流县', '510100', '12');
INSERT INTO `td_area` VALUES ('510124', '郫　县', '510100', '13');
INSERT INTO `td_area` VALUES ('510129', '大邑县', '510100', '14');
INSERT INTO `td_area` VALUES ('510131', '蒲江县', '510100', '15');
INSERT INTO `td_area` VALUES ('510132', '新津县', '510100', '16');
INSERT INTO `td_area` VALUES ('510181', '都江堰市', '510100', '17');
INSERT INTO `td_area` VALUES ('510182', '彭州市', '510100', '18');
INSERT INTO `td_area` VALUES ('510183', '邛崃市', '510100', '19');
INSERT INTO `td_area` VALUES ('510184', '崇州市', '510100', '20');
INSERT INTO `td_area` VALUES ('510301', '市辖区', '510300', '1');
INSERT INTO `td_area` VALUES ('510302', '自流井区', '510300', '2');
INSERT INTO `td_area` VALUES ('510303', '贡井区', '510300', '3');
INSERT INTO `td_area` VALUES ('510304', '大安区', '510300', '4');
INSERT INTO `td_area` VALUES ('510311', '沿滩区', '510300', '5');
INSERT INTO `td_area` VALUES ('510321', '荣　县', '510300', '6');
INSERT INTO `td_area` VALUES ('510322', '富顺县', '510300', '7');
INSERT INTO `td_area` VALUES ('510401', '市辖区', '510400', '1');
INSERT INTO `td_area` VALUES ('510402', '东　区', '510400', '2');
INSERT INTO `td_area` VALUES ('510403', '西　区', '510400', '3');
INSERT INTO `td_area` VALUES ('510411', '仁和区', '510400', '4');
INSERT INTO `td_area` VALUES ('510421', '米易县', '510400', '5');
INSERT INTO `td_area` VALUES ('510422', '盐边县', '510400', '6');
INSERT INTO `td_area` VALUES ('510501', '市辖区', '510500', '1');
INSERT INTO `td_area` VALUES ('510502', '江阳区', '510500', '2');
INSERT INTO `td_area` VALUES ('510503', '纳溪区', '510500', '3');
INSERT INTO `td_area` VALUES ('510504', '龙马潭区', '510500', '4');
INSERT INTO `td_area` VALUES ('510521', '泸　县', '510500', '5');
INSERT INTO `td_area` VALUES ('510522', '合江县', '510500', '6');
INSERT INTO `td_area` VALUES ('510524', '叙永县', '510500', '7');
INSERT INTO `td_area` VALUES ('510525', '古蔺县', '510500', '8');
INSERT INTO `td_area` VALUES ('510601', '市辖区', '510600', '1');
INSERT INTO `td_area` VALUES ('510603', '旌阳区', '510600', '2');
INSERT INTO `td_area` VALUES ('510623', '中江县', '510600', '3');
INSERT INTO `td_area` VALUES ('510626', '罗江县', '510600', '4');
INSERT INTO `td_area` VALUES ('510681', '广汉市', '510600', '5');
INSERT INTO `td_area` VALUES ('510682', '什邡市', '510600', '6');
INSERT INTO `td_area` VALUES ('510683', '绵竹市', '510600', '7');
INSERT INTO `td_area` VALUES ('510701', '市辖区', '510700', '1');
INSERT INTO `td_area` VALUES ('510703', '涪城区', '510700', '2');
INSERT INTO `td_area` VALUES ('510704', '游仙区', '510700', '3');
INSERT INTO `td_area` VALUES ('510722', '三台县', '510700', '4');
INSERT INTO `td_area` VALUES ('510723', '盐亭县', '510700', '5');
INSERT INTO `td_area` VALUES ('510724', '安　县', '510700', '6');
INSERT INTO `td_area` VALUES ('510725', '梓潼县', '510700', '7');
INSERT INTO `td_area` VALUES ('510726', '北川羌族自治县', '510700', '8');
INSERT INTO `td_area` VALUES ('510727', '平武县', '510700', '9');
INSERT INTO `td_area` VALUES ('510781', '江油市', '510700', '10');
INSERT INTO `td_area` VALUES ('510801', '市辖区', '510800', '1');
INSERT INTO `td_area` VALUES ('510802', '市中区', '510800', '2');
INSERT INTO `td_area` VALUES ('510811', '元坝区', '510800', '3');
INSERT INTO `td_area` VALUES ('510812', '朝天区', '510800', '4');
INSERT INTO `td_area` VALUES ('510821', '旺苍县', '510800', '5');
INSERT INTO `td_area` VALUES ('510822', '青川县', '510800', '6');
INSERT INTO `td_area` VALUES ('510823', '剑阁县', '510800', '7');
INSERT INTO `td_area` VALUES ('510824', '苍溪县', '510800', '8');
INSERT INTO `td_area` VALUES ('510901', '市辖区', '510900', '1');
INSERT INTO `td_area` VALUES ('510903', '船山区', '510900', '2');
INSERT INTO `td_area` VALUES ('510904', '安居区', '510900', '3');
INSERT INTO `td_area` VALUES ('510921', '蓬溪县', '510900', '4');
INSERT INTO `td_area` VALUES ('510922', '射洪县', '510900', '5');
INSERT INTO `td_area` VALUES ('510923', '大英县', '510900', '6');
INSERT INTO `td_area` VALUES ('511001', '市辖区', '511000', '1');
INSERT INTO `td_area` VALUES ('511002', '市中区', '511000', '2');
INSERT INTO `td_area` VALUES ('511011', '东兴区', '511000', '3');
INSERT INTO `td_area` VALUES ('511024', '威远县', '511000', '4');
INSERT INTO `td_area` VALUES ('511025', '资中县', '511000', '5');
INSERT INTO `td_area` VALUES ('511028', '隆昌县', '511000', '6');
INSERT INTO `td_area` VALUES ('511101', '市辖区', '511100', '1');
INSERT INTO `td_area` VALUES ('511102', '市中区', '511100', '2');
INSERT INTO `td_area` VALUES ('511111', '沙湾区', '511100', '3');
INSERT INTO `td_area` VALUES ('511112', '五通桥区', '511100', '4');
INSERT INTO `td_area` VALUES ('511113', '金口河区', '511100', '5');
INSERT INTO `td_area` VALUES ('511123', '犍为县', '511100', '6');
INSERT INTO `td_area` VALUES ('511124', '井研县', '511100', '7');
INSERT INTO `td_area` VALUES ('511126', '夹江县', '511100', '8');
INSERT INTO `td_area` VALUES ('511129', '沐川县', '511100', '9');
INSERT INTO `td_area` VALUES ('511132', '峨边彝族自治县', '511100', '10');
INSERT INTO `td_area` VALUES ('511133', '马边彝族自治县', '511100', '11');
INSERT INTO `td_area` VALUES ('511181', '峨眉山市', '511100', '12');
INSERT INTO `td_area` VALUES ('511301', '市辖区', '511300', '1');
INSERT INTO `td_area` VALUES ('511302', '顺庆区', '511300', '2');
INSERT INTO `td_area` VALUES ('511303', '高坪区', '511300', '3');
INSERT INTO `td_area` VALUES ('511304', '嘉陵区', '511300', '4');
INSERT INTO `td_area` VALUES ('511321', '南部县', '511300', '5');
INSERT INTO `td_area` VALUES ('511322', '营山县', '511300', '6');
INSERT INTO `td_area` VALUES ('511323', '蓬安县', '511300', '7');
INSERT INTO `td_area` VALUES ('511324', '仪陇县', '511300', '8');
INSERT INTO `td_area` VALUES ('511325', '西充县', '511300', '9');
INSERT INTO `td_area` VALUES ('511381', '阆中市', '511300', '10');
INSERT INTO `td_area` VALUES ('511401', '市辖区', '511400', '1');
INSERT INTO `td_area` VALUES ('511402', '东坡区', '511400', '2');
INSERT INTO `td_area` VALUES ('511421', '仁寿县', '511400', '3');
INSERT INTO `td_area` VALUES ('511422', '彭山县', '511400', '4');
INSERT INTO `td_area` VALUES ('511423', '洪雅县', '511400', '5');
INSERT INTO `td_area` VALUES ('511424', '丹棱县', '511400', '6');
INSERT INTO `td_area` VALUES ('511425', '青神县', '511400', '7');
INSERT INTO `td_area` VALUES ('511501', '市辖区', '511500', '1');
INSERT INTO `td_area` VALUES ('511502', '翠屏区', '511500', '2');
INSERT INTO `td_area` VALUES ('511521', '宜宾县', '511500', '3');
INSERT INTO `td_area` VALUES ('511522', '南溪县', '511500', '4');
INSERT INTO `td_area` VALUES ('511523', '江安县', '511500', '5');
INSERT INTO `td_area` VALUES ('511524', '长宁县', '511500', '6');
INSERT INTO `td_area` VALUES ('511525', '高　县', '511500', '7');
INSERT INTO `td_area` VALUES ('511526', '珙　县', '511500', '8');
INSERT INTO `td_area` VALUES ('511527', '筠连县', '511500', '9');
INSERT INTO `td_area` VALUES ('511528', '兴文县', '511500', '10');
INSERT INTO `td_area` VALUES ('511529', '屏山县', '511500', '11');
INSERT INTO `td_area` VALUES ('511601', '市辖区', '511600', '1');
INSERT INTO `td_area` VALUES ('511602', '广安区', '511600', '2');
INSERT INTO `td_area` VALUES ('511621', '岳池县', '511600', '3');
INSERT INTO `td_area` VALUES ('511622', '武胜县', '511600', '4');
INSERT INTO `td_area` VALUES ('511623', '邻水县', '511600', '5');
INSERT INTO `td_area` VALUES ('511681', '华莹市', '511600', '6');
INSERT INTO `td_area` VALUES ('511701', '市辖区', '511700', '1');
INSERT INTO `td_area` VALUES ('511702', '通川区', '511700', '2');
INSERT INTO `td_area` VALUES ('511721', '达　县', '511700', '3');
INSERT INTO `td_area` VALUES ('511722', '宣汉县', '511700', '4');
INSERT INTO `td_area` VALUES ('511723', '开江县', '511700', '5');
INSERT INTO `td_area` VALUES ('511724', '大竹县', '511700', '6');
INSERT INTO `td_area` VALUES ('511725', '渠　县', '511700', '7');
INSERT INTO `td_area` VALUES ('511781', '万源市', '511700', '8');
INSERT INTO `td_area` VALUES ('511801', '市辖区', '511800', '1');
INSERT INTO `td_area` VALUES ('511802', '雨城区', '511800', '2');
INSERT INTO `td_area` VALUES ('511821', '名山县', '511800', '3');
INSERT INTO `td_area` VALUES ('511822', '荥经县', '511800', '4');
INSERT INTO `td_area` VALUES ('511823', '汉源县', '511800', '5');
INSERT INTO `td_area` VALUES ('511824', '石棉县', '511800', '6');
INSERT INTO `td_area` VALUES ('511825', '天全县', '511800', '7');
INSERT INTO `td_area` VALUES ('511826', '芦山县', '511800', '8');
INSERT INTO `td_area` VALUES ('511827', '宝兴县', '511800', '9');
INSERT INTO `td_area` VALUES ('511901', '市辖区', '511900', '1');
INSERT INTO `td_area` VALUES ('511902', '巴州区', '511900', '2');
INSERT INTO `td_area` VALUES ('511921', '通江县', '511900', '3');
INSERT INTO `td_area` VALUES ('511922', '南江县', '511900', '4');
INSERT INTO `td_area` VALUES ('511923', '平昌县', '511900', '5');
INSERT INTO `td_area` VALUES ('512001', '市辖区', '512000', '1');
INSERT INTO `td_area` VALUES ('512002', '雁江区', '512000', '2');
INSERT INTO `td_area` VALUES ('512021', '安岳县', '512000', '3');
INSERT INTO `td_area` VALUES ('512022', '乐至县', '512000', '4');
INSERT INTO `td_area` VALUES ('512081', '简阳市', '512000', '5');
INSERT INTO `td_area` VALUES ('513221', '汶川县', '513200', '1');
INSERT INTO `td_area` VALUES ('513222', '理　县', '513200', '2');
INSERT INTO `td_area` VALUES ('513223', '茂　县', '513200', '3');
INSERT INTO `td_area` VALUES ('513224', '松潘县', '513200', '4');
INSERT INTO `td_area` VALUES ('513225', '九寨沟县', '513200', '5');
INSERT INTO `td_area` VALUES ('513226', '金川县', '513200', '6');
INSERT INTO `td_area` VALUES ('513227', '小金县', '513200', '7');
INSERT INTO `td_area` VALUES ('513228', '黑水县', '513200', '8');
INSERT INTO `td_area` VALUES ('513229', '马尔康县', '513200', '9');
INSERT INTO `td_area` VALUES ('513230', '壤塘县', '513200', '10');
INSERT INTO `td_area` VALUES ('513231', '阿坝县', '513200', '11');
INSERT INTO `td_area` VALUES ('513232', '若尔盖县', '513200', '12');
INSERT INTO `td_area` VALUES ('513233', '红原县', '513200', '13');
INSERT INTO `td_area` VALUES ('513321', '康定县', '513300', '1');
INSERT INTO `td_area` VALUES ('513322', '泸定县', '513300', '2');
INSERT INTO `td_area` VALUES ('513323', '丹巴县', '513300', '3');
INSERT INTO `td_area` VALUES ('513324', '九龙县', '513300', '4');
INSERT INTO `td_area` VALUES ('513325', '雅江县', '513300', '5');
INSERT INTO `td_area` VALUES ('513326', '道孚县', '513300', '6');
INSERT INTO `td_area` VALUES ('513327', '炉霍县', '513300', '7');
INSERT INTO `td_area` VALUES ('513328', '甘孜县', '513300', '8');
INSERT INTO `td_area` VALUES ('513329', '新龙县', '513300', '9');
INSERT INTO `td_area` VALUES ('513330', '德格县', '513300', '10');
INSERT INTO `td_area` VALUES ('513331', '白玉县', '513300', '11');
INSERT INTO `td_area` VALUES ('513332', '石渠县', '513300', '12');
INSERT INTO `td_area` VALUES ('513333', '色达县', '513300', '13');
INSERT INTO `td_area` VALUES ('513334', '理塘县', '513300', '14');
INSERT INTO `td_area` VALUES ('513335', '巴塘县', '513300', '15');
INSERT INTO `td_area` VALUES ('513336', '乡城县', '513300', '16');
INSERT INTO `td_area` VALUES ('513337', '稻城县', '513300', '17');
INSERT INTO `td_area` VALUES ('513338', '得荣县', '513300', '18');
INSERT INTO `td_area` VALUES ('513401', '西昌市', '513400', '1');
INSERT INTO `td_area` VALUES ('513422', '木里藏族自治县', '513400', '2');
INSERT INTO `td_area` VALUES ('513423', '盐源县', '513400', '3');
INSERT INTO `td_area` VALUES ('513424', '德昌县', '513400', '4');
INSERT INTO `td_area` VALUES ('513425', '会理县', '513400', '5');
INSERT INTO `td_area` VALUES ('513426', '会东县', '513400', '6');
INSERT INTO `td_area` VALUES ('513427', '宁南县', '513400', '7');
INSERT INTO `td_area` VALUES ('513428', '普格县', '513400', '8');
INSERT INTO `td_area` VALUES ('513429', '布拖县', '513400', '9');
INSERT INTO `td_area` VALUES ('513430', '金阳县', '513400', '10');
INSERT INTO `td_area` VALUES ('513431', '昭觉县', '513400', '11');
INSERT INTO `td_area` VALUES ('513432', '喜德县', '513400', '12');
INSERT INTO `td_area` VALUES ('513433', '冕宁县', '513400', '13');
INSERT INTO `td_area` VALUES ('513434', '越西县', '513400', '14');
INSERT INTO `td_area` VALUES ('513435', '甘洛县', '513400', '15');
INSERT INTO `td_area` VALUES ('513436', '美姑县', '513400', '16');
INSERT INTO `td_area` VALUES ('513437', '雷波县', '513400', '17');
INSERT INTO `td_area` VALUES ('520101', '市辖区', '520100', '1');
INSERT INTO `td_area` VALUES ('520102', '南明区', '520100', '2');
INSERT INTO `td_area` VALUES ('520103', '云岩区', '520100', '3');
INSERT INTO `td_area` VALUES ('520111', '花溪区', '520100', '4');
INSERT INTO `td_area` VALUES ('520112', '乌当区', '520100', '5');
INSERT INTO `td_area` VALUES ('520113', '白云区', '520100', '6');
INSERT INTO `td_area` VALUES ('520114', '小河区', '520100', '7');
INSERT INTO `td_area` VALUES ('520121', '开阳县', '520100', '8');
INSERT INTO `td_area` VALUES ('520122', '息烽县', '520100', '9');
INSERT INTO `td_area` VALUES ('520123', '修文县', '520100', '10');
INSERT INTO `td_area` VALUES ('520181', '清镇市', '520100', '11');
INSERT INTO `td_area` VALUES ('520201', '钟山区', '520200', '1');
INSERT INTO `td_area` VALUES ('520203', '六枝特区', '520200', '2');
INSERT INTO `td_area` VALUES ('520221', '水城县', '520200', '3');
INSERT INTO `td_area` VALUES ('520222', '盘　县', '520200', '4');
INSERT INTO `td_area` VALUES ('520301', '市辖区', '520300', '1');
INSERT INTO `td_area` VALUES ('520302', '红花岗区', '520300', '2');
INSERT INTO `td_area` VALUES ('520303', '汇川区', '520300', '3');
INSERT INTO `td_area` VALUES ('520321', '遵义县', '520300', '4');
INSERT INTO `td_area` VALUES ('520322', '桐梓县', '520300', '5');
INSERT INTO `td_area` VALUES ('520323', '绥阳县', '520300', '6');
INSERT INTO `td_area` VALUES ('520324', '正安县', '520300', '7');
INSERT INTO `td_area` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '8');
INSERT INTO `td_area` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '9');
INSERT INTO `td_area` VALUES ('520327', '凤冈县', '520300', '10');
INSERT INTO `td_area` VALUES ('520328', '湄潭县', '520300', '11');
INSERT INTO `td_area` VALUES ('520329', '余庆县', '520300', '12');
INSERT INTO `td_area` VALUES ('520330', '习水县', '520300', '13');
INSERT INTO `td_area` VALUES ('520381', '赤水市', '520300', '14');
INSERT INTO `td_area` VALUES ('520382', '仁怀市', '520300', '15');
INSERT INTO `td_area` VALUES ('520401', '市辖区', '520400', '1');
INSERT INTO `td_area` VALUES ('520402', '西秀区', '520400', '2');
INSERT INTO `td_area` VALUES ('520421', '平坝县', '520400', '3');
INSERT INTO `td_area` VALUES ('520422', '普定县', '520400', '4');
INSERT INTO `td_area` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '5');
INSERT INTO `td_area` VALUES ('520424', '关岭布依族苗族自治县', '520400', '6');
INSERT INTO `td_area` VALUES ('520425', '紫云苗族布依族自治县', '520400', '7');
INSERT INTO `td_area` VALUES ('522201', '铜仁市', '522200', '1');
INSERT INTO `td_area` VALUES ('522222', '江口县', '522200', '2');
INSERT INTO `td_area` VALUES ('522223', '玉屏侗族自治县', '522200', '3');
INSERT INTO `td_area` VALUES ('522224', '石阡县', '522200', '4');
INSERT INTO `td_area` VALUES ('522225', '思南县', '522200', '5');
INSERT INTO `td_area` VALUES ('522226', '印江土家族苗族自治县', '522200', '6');
INSERT INTO `td_area` VALUES ('522227', '德江县', '522200', '7');
INSERT INTO `td_area` VALUES ('522228', '沿河土家族自治县', '522200', '8');
INSERT INTO `td_area` VALUES ('522229', '松桃苗族自治县', '522200', '9');
INSERT INTO `td_area` VALUES ('522230', '万山特区', '522200', '10');
INSERT INTO `td_area` VALUES ('522301', '兴义市', '522300', '1');
INSERT INTO `td_area` VALUES ('522322', '兴仁县', '522300', '2');
INSERT INTO `td_area` VALUES ('522323', '普安县', '522300', '3');
INSERT INTO `td_area` VALUES ('522324', '晴隆县', '522300', '4');
INSERT INTO `td_area` VALUES ('522325', '贞丰县', '522300', '5');
INSERT INTO `td_area` VALUES ('522326', '望谟县', '522300', '6');
INSERT INTO `td_area` VALUES ('522327', '册亨县', '522300', '7');
INSERT INTO `td_area` VALUES ('522328', '安龙县', '522300', '8');
INSERT INTO `td_area` VALUES ('522401', '毕节市', '522400', '1');
INSERT INTO `td_area` VALUES ('522422', '大方县', '522400', '2');
INSERT INTO `td_area` VALUES ('522423', '黔西县', '522400', '3');
INSERT INTO `td_area` VALUES ('522424', '金沙县', '522400', '4');
INSERT INTO `td_area` VALUES ('522425', '织金县', '522400', '5');
INSERT INTO `td_area` VALUES ('522426', '纳雍县', '522400', '6');
INSERT INTO `td_area` VALUES ('522427', '威宁彝族回族苗族自治县', '522400', '7');
INSERT INTO `td_area` VALUES ('522428', '赫章县', '522400', '8');
INSERT INTO `td_area` VALUES ('522601', '凯里市', '522600', '1');
INSERT INTO `td_area` VALUES ('522622', '黄平县', '522600', '2');
INSERT INTO `td_area` VALUES ('522623', '施秉县', '522600', '3');
INSERT INTO `td_area` VALUES ('522624', '三穗县', '522600', '4');
INSERT INTO `td_area` VALUES ('522625', '镇远县', '522600', '5');
INSERT INTO `td_area` VALUES ('522626', '岑巩县', '522600', '6');
INSERT INTO `td_area` VALUES ('522627', '天柱县', '522600', '7');
INSERT INTO `td_area` VALUES ('522628', '锦屏县', '522600', '8');
INSERT INTO `td_area` VALUES ('522629', '剑河县', '522600', '9');
INSERT INTO `td_area` VALUES ('522630', '台江县', '522600', '10');
INSERT INTO `td_area` VALUES ('522631', '黎平县', '522600', '11');
INSERT INTO `td_area` VALUES ('522632', '榕江县', '522600', '12');
INSERT INTO `td_area` VALUES ('522633', '从江县', '522600', '13');
INSERT INTO `td_area` VALUES ('522634', '雷山县', '522600', '14');
INSERT INTO `td_area` VALUES ('522635', '麻江县', '522600', '15');
INSERT INTO `td_area` VALUES ('522636', '丹寨县', '522600', '16');
INSERT INTO `td_area` VALUES ('522701', '都匀市', '522700', '1');
INSERT INTO `td_area` VALUES ('522702', '福泉市', '522700', '2');
INSERT INTO `td_area` VALUES ('522722', '荔波县', '522700', '3');
INSERT INTO `td_area` VALUES ('522723', '贵定县', '522700', '4');
INSERT INTO `td_area` VALUES ('522725', '瓮安县', '522700', '5');
INSERT INTO `td_area` VALUES ('522726', '独山县', '522700', '6');
INSERT INTO `td_area` VALUES ('522727', '平塘县', '522700', '7');
INSERT INTO `td_area` VALUES ('522728', '罗甸县', '522700', '8');
INSERT INTO `td_area` VALUES ('522729', '长顺县', '522700', '9');
INSERT INTO `td_area` VALUES ('522730', '龙里县', '522700', '10');
INSERT INTO `td_area` VALUES ('522731', '惠水县', '522700', '11');
INSERT INTO `td_area` VALUES ('522732', '三都水族自治县', '522700', '12');
INSERT INTO `td_area` VALUES ('530101', '市辖区', '530100', '1');
INSERT INTO `td_area` VALUES ('530102', '五华区', '530100', '2');
INSERT INTO `td_area` VALUES ('530103', '盘龙区', '530100', '3');
INSERT INTO `td_area` VALUES ('530111', '官渡区', '530100', '4');
INSERT INTO `td_area` VALUES ('530112', '西山区', '530100', '5');
INSERT INTO `td_area` VALUES ('530113', '东川区', '530100', '6');
INSERT INTO `td_area` VALUES ('530121', '呈贡县', '530100', '7');
INSERT INTO `td_area` VALUES ('530122', '晋宁县', '530100', '8');
INSERT INTO `td_area` VALUES ('530124', '富民县', '530100', '9');
INSERT INTO `td_area` VALUES ('530125', '宜良县', '530100', '10');
INSERT INTO `td_area` VALUES ('530126', '石林彝族自治县', '530100', '11');
INSERT INTO `td_area` VALUES ('530127', '嵩明县', '530100', '12');
INSERT INTO `td_area` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '13');
INSERT INTO `td_area` VALUES ('530129', '寻甸回族彝族自治县', '530100', '14');
INSERT INTO `td_area` VALUES ('530181', '安宁市', '530100', '15');
INSERT INTO `td_area` VALUES ('530301', '市辖区', '530300', '1');
INSERT INTO `td_area` VALUES ('530302', '麒麟区', '530300', '2');
INSERT INTO `td_area` VALUES ('530321', '马龙县', '530300', '3');
INSERT INTO `td_area` VALUES ('530322', '陆良县', '530300', '4');
INSERT INTO `td_area` VALUES ('530323', '师宗县', '530300', '5');
INSERT INTO `td_area` VALUES ('530324', '罗平县', '530300', '6');
INSERT INTO `td_area` VALUES ('530325', '富源县', '530300', '7');
INSERT INTO `td_area` VALUES ('530326', '会泽县', '530300', '8');
INSERT INTO `td_area` VALUES ('530328', '沾益县', '530300', '9');
INSERT INTO `td_area` VALUES ('530381', '宣威市', '530300', '10');
INSERT INTO `td_area` VALUES ('530401', '市辖区', '530400', '1');
INSERT INTO `td_area` VALUES ('530402', '红塔区', '530400', '2');
INSERT INTO `td_area` VALUES ('530421', '江川县', '530400', '3');
INSERT INTO `td_area` VALUES ('530422', '澄江县', '530400', '4');
INSERT INTO `td_area` VALUES ('530423', '通海县', '530400', '5');
INSERT INTO `td_area` VALUES ('530424', '华宁县', '530400', '6');
INSERT INTO `td_area` VALUES ('530425', '易门县', '530400', '7');
INSERT INTO `td_area` VALUES ('530426', '峨山彝族自治县', '530400', '8');
INSERT INTO `td_area` VALUES ('530427', '新平彝族傣族自治县', '530400', '9');
INSERT INTO `td_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '10');
INSERT INTO `td_area` VALUES ('530501', '市辖区', '530500', '1');
INSERT INTO `td_area` VALUES ('530502', '隆阳区', '530500', '2');
INSERT INTO `td_area` VALUES ('530521', '施甸县', '530500', '3');
INSERT INTO `td_area` VALUES ('530522', '腾冲县', '530500', '4');
INSERT INTO `td_area` VALUES ('530523', '龙陵县', '530500', '5');
INSERT INTO `td_area` VALUES ('530524', '昌宁县', '530500', '6');
INSERT INTO `td_area` VALUES ('530601', '市辖区', '530600', '1');
INSERT INTO `td_area` VALUES ('530602', '昭阳区', '530600', '2');
INSERT INTO `td_area` VALUES ('530621', '鲁甸县', '530600', '3');
INSERT INTO `td_area` VALUES ('530622', '巧家县', '530600', '4');
INSERT INTO `td_area` VALUES ('530623', '盐津县', '530600', '5');
INSERT INTO `td_area` VALUES ('530624', '大关县', '530600', '6');
INSERT INTO `td_area` VALUES ('530625', '永善县', '530600', '7');
INSERT INTO `td_area` VALUES ('530626', '绥江县', '530600', '8');
INSERT INTO `td_area` VALUES ('530627', '镇雄县', '530600', '9');
INSERT INTO `td_area` VALUES ('530628', '彝良县', '530600', '10');
INSERT INTO `td_area` VALUES ('530629', '威信县', '530600', '11');
INSERT INTO `td_area` VALUES ('530630', '水富县', '530600', '12');
INSERT INTO `td_area` VALUES ('530701', '市辖区', '530700', '1');
INSERT INTO `td_area` VALUES ('530702', '古城区', '530700', '2');
INSERT INTO `td_area` VALUES ('530721', '玉龙纳西族自治县', '530700', '3');
INSERT INTO `td_area` VALUES ('530722', '永胜县', '530700', '4');
INSERT INTO `td_area` VALUES ('530723', '华坪县', '530700', '5');
INSERT INTO `td_area` VALUES ('530724', '宁蒗彝族自治县', '530700', '6');
INSERT INTO `td_area` VALUES ('530801', '市辖区', '530800', '1');
INSERT INTO `td_area` VALUES ('530802', '翠云区', '530800', '2');
INSERT INTO `td_area` VALUES ('530821', '普洱哈尼族彝族自治县', '530800', '3');
INSERT INTO `td_area` VALUES ('530822', '墨江哈尼族自治县', '530800', '4');
INSERT INTO `td_area` VALUES ('530823', '景东彝族自治县', '530800', '5');
INSERT INTO `td_area` VALUES ('530824', '景谷傣族彝族自治县', '530800', '6');
INSERT INTO `td_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '7');
INSERT INTO `td_area` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '8');
INSERT INTO `td_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '9');
INSERT INTO `td_area` VALUES ('530828', '澜沧拉祜族自治县', '530800', '10');
INSERT INTO `td_area` VALUES ('530829', '西盟佤族自治县', '530800', '11');
INSERT INTO `td_area` VALUES ('530901', '市辖区', '530900', '1');
INSERT INTO `td_area` VALUES ('530902', '临翔区', '530900', '2');
INSERT INTO `td_area` VALUES ('530921', '凤庆县', '530900', '3');
INSERT INTO `td_area` VALUES ('530922', '云　县', '530900', '4');
INSERT INTO `td_area` VALUES ('530923', '永德县', '530900', '5');
INSERT INTO `td_area` VALUES ('530924', '镇康县', '530900', '6');
INSERT INTO `td_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '7');
INSERT INTO `td_area` VALUES ('530926', '耿马傣族佤族自治县', '530900', '8');
INSERT INTO `td_area` VALUES ('530927', '沧源佤族自治县', '530900', '9');
INSERT INTO `td_area` VALUES ('532301', '楚雄市', '532300', '1');
INSERT INTO `td_area` VALUES ('532322', '双柏县', '532300', '2');
INSERT INTO `td_area` VALUES ('532323', '牟定县', '532300', '3');
INSERT INTO `td_area` VALUES ('532324', '南华县', '532300', '4');
INSERT INTO `td_area` VALUES ('532325', '姚安县', '532300', '5');
INSERT INTO `td_area` VALUES ('532326', '大姚县', '532300', '6');
INSERT INTO `td_area` VALUES ('532327', '永仁县', '532300', '7');
INSERT INTO `td_area` VALUES ('532328', '元谋县', '532300', '8');
INSERT INTO `td_area` VALUES ('532329', '武定县', '532300', '9');
INSERT INTO `td_area` VALUES ('532331', '禄丰县', '532300', '10');
INSERT INTO `td_area` VALUES ('532501', '个旧市', '532500', '1');
INSERT INTO `td_area` VALUES ('532502', '开远市', '532500', '2');
INSERT INTO `td_area` VALUES ('532522', '蒙自县', '532500', '3');
INSERT INTO `td_area` VALUES ('532523', '屏边苗族自治县', '532500', '4');
INSERT INTO `td_area` VALUES ('532524', '建水县', '532500', '5');
INSERT INTO `td_area` VALUES ('532525', '石屏县', '532500', '6');
INSERT INTO `td_area` VALUES ('532526', '弥勒县', '532500', '7');
INSERT INTO `td_area` VALUES ('532527', '泸西县', '532500', '8');
INSERT INTO `td_area` VALUES ('532528', '元阳县', '532500', '9');
INSERT INTO `td_area` VALUES ('532529', '红河县', '532500', '10');
INSERT INTO `td_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '11');
INSERT INTO `td_area` VALUES ('532531', '绿春县', '532500', '12');
INSERT INTO `td_area` VALUES ('532532', '河口瑶族自治县', '532500', '13');
INSERT INTO `td_area` VALUES ('532621', '文山县', '532600', '1');
INSERT INTO `td_area` VALUES ('532622', '砚山县', '532600', '2');
INSERT INTO `td_area` VALUES ('532623', '西畴县', '532600', '3');
INSERT INTO `td_area` VALUES ('532624', '麻栗坡县', '532600', '4');
INSERT INTO `td_area` VALUES ('532625', '马关县', '532600', '5');
INSERT INTO `td_area` VALUES ('532626', '丘北县', '532600', '6');
INSERT INTO `td_area` VALUES ('532627', '广南县', '532600', '7');
INSERT INTO `td_area` VALUES ('532628', '富宁县', '532600', '8');
INSERT INTO `td_area` VALUES ('532801', '景洪市', '532800', '1');
INSERT INTO `td_area` VALUES ('532822', '勐海县', '532800', '2');
INSERT INTO `td_area` VALUES ('532823', '勐腊县', '532800', '3');
INSERT INTO `td_area` VALUES ('532901', '大理市', '532900', '1');
INSERT INTO `td_area` VALUES ('532922', '漾濞彝族自治县', '532900', '2');
INSERT INTO `td_area` VALUES ('532923', '祥云县', '532900', '3');
INSERT INTO `td_area` VALUES ('532924', '宾川县', '532900', '4');
INSERT INTO `td_area` VALUES ('532925', '弥渡县', '532900', '5');
INSERT INTO `td_area` VALUES ('532926', '南涧彝族自治县', '532900', '6');
INSERT INTO `td_area` VALUES ('532927', '巍山彝族回族自治县', '532900', '7');
INSERT INTO `td_area` VALUES ('532928', '永平县', '532900', '8');
INSERT INTO `td_area` VALUES ('532929', '云龙县', '532900', '9');
INSERT INTO `td_area` VALUES ('532930', '洱源县', '532900', '10');
INSERT INTO `td_area` VALUES ('532931', '剑川县', '532900', '11');
INSERT INTO `td_area` VALUES ('532932', '鹤庆县', '532900', '12');
INSERT INTO `td_area` VALUES ('533102', '瑞丽市', '533100', '1');
INSERT INTO `td_area` VALUES ('533103', '潞西市', '533100', '2');
INSERT INTO `td_area` VALUES ('533122', '梁河县', '533100', '3');
INSERT INTO `td_area` VALUES ('533123', '盈江县', '533100', '4');
INSERT INTO `td_area` VALUES ('533124', '陇川县', '533100', '5');
INSERT INTO `td_area` VALUES ('533321', '泸水县', '533300', '1');
INSERT INTO `td_area` VALUES ('533323', '福贡县', '533300', '2');
INSERT INTO `td_area` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '3');
INSERT INTO `td_area` VALUES ('533325', '兰坪白族普米族自治县', '533300', '4');
INSERT INTO `td_area` VALUES ('533421', '香格里拉县', '533400', '1');
INSERT INTO `td_area` VALUES ('533422', '德钦县', '533400', '2');
INSERT INTO `td_area` VALUES ('533423', '维西傈僳族自治县', '533400', '3');
INSERT INTO `td_area` VALUES ('540101', '市辖区', '540100', '1');
INSERT INTO `td_area` VALUES ('540102', '城关区', '540100', '2');
INSERT INTO `td_area` VALUES ('540121', '林周县', '540100', '3');
INSERT INTO `td_area` VALUES ('540122', '当雄县', '540100', '4');
INSERT INTO `td_area` VALUES ('540123', '尼木县', '540100', '5');
INSERT INTO `td_area` VALUES ('540124', '曲水县', '540100', '6');
INSERT INTO `td_area` VALUES ('540125', '堆龙德庆县', '540100', '7');
INSERT INTO `td_area` VALUES ('540126', '达孜县', '540100', '8');
INSERT INTO `td_area` VALUES ('540127', '墨竹工卡县', '540100', '9');
INSERT INTO `td_area` VALUES ('542121', '昌都县', '542100', '1');
INSERT INTO `td_area` VALUES ('542122', '江达县', '542100', '2');
INSERT INTO `td_area` VALUES ('542123', '贡觉县', '542100', '3');
INSERT INTO `td_area` VALUES ('542124', '类乌齐县', '542100', '4');
INSERT INTO `td_area` VALUES ('542125', '丁青县', '542100', '5');
INSERT INTO `td_area` VALUES ('542126', '察雅县', '542100', '6');
INSERT INTO `td_area` VALUES ('542127', '八宿县', '542100', '7');
INSERT INTO `td_area` VALUES ('542128', '左贡县', '542100', '8');
INSERT INTO `td_area` VALUES ('542129', '芒康县', '542100', '9');
INSERT INTO `td_area` VALUES ('542132', '洛隆县', '542100', '10');
INSERT INTO `td_area` VALUES ('542133', '边坝县', '542100', '11');
INSERT INTO `td_area` VALUES ('542221', '乃东县', '542200', '1');
INSERT INTO `td_area` VALUES ('542222', '扎囊县', '542200', '2');
INSERT INTO `td_area` VALUES ('542223', '贡嘎县', '542200', '3');
INSERT INTO `td_area` VALUES ('542224', '桑日县', '542200', '4');
INSERT INTO `td_area` VALUES ('542225', '琼结县', '542200', '5');
INSERT INTO `td_area` VALUES ('542226', '曲松县', '542200', '6');
INSERT INTO `td_area` VALUES ('542227', '措美县', '542200', '7');
INSERT INTO `td_area` VALUES ('542228', '洛扎县', '542200', '8');
INSERT INTO `td_area` VALUES ('542229', '加查县', '542200', '9');
INSERT INTO `td_area` VALUES ('542231', '隆子县', '542200', '10');
INSERT INTO `td_area` VALUES ('542232', '错那县', '542200', '11');
INSERT INTO `td_area` VALUES ('542233', '浪卡子县', '542200', '12');
INSERT INTO `td_area` VALUES ('542301', '日喀则市', '542300', '1');
INSERT INTO `td_area` VALUES ('542322', '南木林县', '542300', '2');
INSERT INTO `td_area` VALUES ('542323', '江孜县', '542300', '3');
INSERT INTO `td_area` VALUES ('542324', '定日县', '542300', '4');
INSERT INTO `td_area` VALUES ('542325', '萨迦县', '542300', '5');
INSERT INTO `td_area` VALUES ('542326', '拉孜县', '542300', '6');
INSERT INTO `td_area` VALUES ('542327', '昂仁县', '542300', '7');
INSERT INTO `td_area` VALUES ('542328', '谢通门县', '542300', '8');
INSERT INTO `td_area` VALUES ('542329', '白朗县', '542300', '9');
INSERT INTO `td_area` VALUES ('542330', '仁布县', '542300', '10');
INSERT INTO `td_area` VALUES ('542331', '康马县', '542300', '11');
INSERT INTO `td_area` VALUES ('542332', '定结县', '542300', '12');
INSERT INTO `td_area` VALUES ('542333', '仲巴县', '542300', '13');
INSERT INTO `td_area` VALUES ('542334', '亚东县', '542300', '14');
INSERT INTO `td_area` VALUES ('542335', '吉隆县', '542300', '15');
INSERT INTO `td_area` VALUES ('542336', '聂拉木县', '542300', '16');
INSERT INTO `td_area` VALUES ('542337', '萨嘎县', '542300', '17');
INSERT INTO `td_area` VALUES ('542338', '岗巴县', '542300', '18');
INSERT INTO `td_area` VALUES ('542421', '那曲县', '542400', '1');
INSERT INTO `td_area` VALUES ('542422', '嘉黎县', '542400', '2');
INSERT INTO `td_area` VALUES ('542423', '比如县', '542400', '3');
INSERT INTO `td_area` VALUES ('542424', '聂荣县', '542400', '4');
INSERT INTO `td_area` VALUES ('542425', '安多县', '542400', '5');
INSERT INTO `td_area` VALUES ('542426', '申扎县', '542400', '6');
INSERT INTO `td_area` VALUES ('542427', '索　县', '542400', '7');
INSERT INTO `td_area` VALUES ('542428', '班戈县', '542400', '8');
INSERT INTO `td_area` VALUES ('542429', '巴青县', '542400', '9');
INSERT INTO `td_area` VALUES ('542430', '尼玛县', '542400', '10');
INSERT INTO `td_area` VALUES ('542521', '普兰县', '542500', '1');
INSERT INTO `td_area` VALUES ('542522', '札达县', '542500', '2');
INSERT INTO `td_area` VALUES ('542523', '噶尔县', '542500', '3');
INSERT INTO `td_area` VALUES ('542524', '日土县', '542500', '4');
INSERT INTO `td_area` VALUES ('542525', '革吉县', '542500', '5');
INSERT INTO `td_area` VALUES ('542526', '改则县', '542500', '6');
INSERT INTO `td_area` VALUES ('542527', '措勤县', '542500', '7');
INSERT INTO `td_area` VALUES ('542621', '林芝县', '542600', '1');
INSERT INTO `td_area` VALUES ('542622', '工布江达县', '542600', '2');
INSERT INTO `td_area` VALUES ('542623', '米林县', '542600', '3');
INSERT INTO `td_area` VALUES ('542624', '墨脱县', '542600', '4');
INSERT INTO `td_area` VALUES ('542625', '波密县', '542600', '5');
INSERT INTO `td_area` VALUES ('542626', '察隅县', '542600', '6');
INSERT INTO `td_area` VALUES ('542627', '朗　县', '542600', '7');
INSERT INTO `td_area` VALUES ('610101', '市辖区', '610100', '1');
INSERT INTO `td_area` VALUES ('610102', '新城区', '610100', '2');
INSERT INTO `td_area` VALUES ('610103', '碑林区', '610100', '3');
INSERT INTO `td_area` VALUES ('610104', '莲湖区', '610100', '4');
INSERT INTO `td_area` VALUES ('610111', '灞桥区', '610100', '5');
INSERT INTO `td_area` VALUES ('610112', '未央区', '610100', '6');
INSERT INTO `td_area` VALUES ('610113', '雁塔区', '610100', '7');
INSERT INTO `td_area` VALUES ('610114', '阎良区', '610100', '8');
INSERT INTO `td_area` VALUES ('610115', '临潼区', '610100', '9');
INSERT INTO `td_area` VALUES ('610116', '长安区', '610100', '10');
INSERT INTO `td_area` VALUES ('610122', '蓝田县', '610100', '11');
INSERT INTO `td_area` VALUES ('610124', '周至县', '610100', '12');
INSERT INTO `td_area` VALUES ('610125', '户　县', '610100', '13');
INSERT INTO `td_area` VALUES ('610126', '高陵县', '610100', '14');
INSERT INTO `td_area` VALUES ('610201', '市辖区', '610200', '1');
INSERT INTO `td_area` VALUES ('610202', '王益区', '610200', '2');
INSERT INTO `td_area` VALUES ('610203', '印台区', '610200', '3');
INSERT INTO `td_area` VALUES ('610204', '耀州区', '610200', '4');
INSERT INTO `td_area` VALUES ('610222', '宜君县', '610200', '5');
INSERT INTO `td_area` VALUES ('610301', '市辖区', '610300', '1');
INSERT INTO `td_area` VALUES ('610302', '渭滨区', '610300', '2');
INSERT INTO `td_area` VALUES ('610303', '金台区', '610300', '3');
INSERT INTO `td_area` VALUES ('610304', '陈仓区', '610300', '4');
INSERT INTO `td_area` VALUES ('610322', '凤翔县', '610300', '5');
INSERT INTO `td_area` VALUES ('610323', '岐山县', '610300', '6');
INSERT INTO `td_area` VALUES ('610324', '扶风县', '610300', '7');
INSERT INTO `td_area` VALUES ('610326', '眉　县', '610300', '8');
INSERT INTO `td_area` VALUES ('610327', '陇　县', '610300', '9');
INSERT INTO `td_area` VALUES ('610328', '千阳县', '610300', '10');
INSERT INTO `td_area` VALUES ('610329', '麟游县', '610300', '11');
INSERT INTO `td_area` VALUES ('610330', '凤　县', '610300', '12');
INSERT INTO `td_area` VALUES ('610331', '太白县', '610300', '13');
INSERT INTO `td_area` VALUES ('610401', '市辖区', '610400', '1');
INSERT INTO `td_area` VALUES ('610402', '秦都区', '610400', '2');
INSERT INTO `td_area` VALUES ('610403', '杨凌区', '610400', '3');
INSERT INTO `td_area` VALUES ('610404', '渭城区', '610400', '4');
INSERT INTO `td_area` VALUES ('610422', '三原县', '610400', '5');
INSERT INTO `td_area` VALUES ('610423', '泾阳县', '610400', '6');
INSERT INTO `td_area` VALUES ('610424', '乾　县', '610400', '7');
INSERT INTO `td_area` VALUES ('610425', '礼泉县', '610400', '8');
INSERT INTO `td_area` VALUES ('610426', '永寿县', '610400', '9');
INSERT INTO `td_area` VALUES ('610427', '彬　县', '610400', '10');
INSERT INTO `td_area` VALUES ('610428', '长武县', '610400', '11');
INSERT INTO `td_area` VALUES ('610429', '旬邑县', '610400', '12');
INSERT INTO `td_area` VALUES ('610430', '淳化县', '610400', '13');
INSERT INTO `td_area` VALUES ('610431', '武功县', '610400', '14');
INSERT INTO `td_area` VALUES ('610481', '兴平市', '610400', '15');
INSERT INTO `td_area` VALUES ('610501', '市辖区', '610500', '1');
INSERT INTO `td_area` VALUES ('610502', '临渭区', '610500', '2');
INSERT INTO `td_area` VALUES ('610521', '华　县', '610500', '3');
INSERT INTO `td_area` VALUES ('610522', '潼关县', '610500', '4');
INSERT INTO `td_area` VALUES ('610523', '大荔县', '610500', '5');
INSERT INTO `td_area` VALUES ('610524', '合阳县', '610500', '6');
INSERT INTO `td_area` VALUES ('610525', '澄城县', '610500', '7');
INSERT INTO `td_area` VALUES ('610526', '蒲城县', '610500', '8');
INSERT INTO `td_area` VALUES ('610527', '白水县', '610500', '9');
INSERT INTO `td_area` VALUES ('610528', '富平县', '610500', '10');
INSERT INTO `td_area` VALUES ('610581', '韩城市', '610500', '11');
INSERT INTO `td_area` VALUES ('610582', '华阴市', '610500', '12');
INSERT INTO `td_area` VALUES ('610601', '市辖区', '610600', '1');
INSERT INTO `td_area` VALUES ('610602', '宝塔区', '610600', '2');
INSERT INTO `td_area` VALUES ('610621', '延长县', '610600', '3');
INSERT INTO `td_area` VALUES ('610622', '延川县', '610600', '4');
INSERT INTO `td_area` VALUES ('610623', '子长县', '610600', '5');
INSERT INTO `td_area` VALUES ('610624', '安塞县', '610600', '6');
INSERT INTO `td_area` VALUES ('610625', '志丹县', '610600', '7');
INSERT INTO `td_area` VALUES ('610626', '吴旗县', '610600', '8');
INSERT INTO `td_area` VALUES ('610627', '甘泉县', '610600', '9');
INSERT INTO `td_area` VALUES ('610628', '富　县', '610600', '10');
INSERT INTO `td_area` VALUES ('610629', '洛川县', '610600', '11');
INSERT INTO `td_area` VALUES ('610630', '宜川县', '610600', '12');
INSERT INTO `td_area` VALUES ('610631', '黄龙县', '610600', '13');
INSERT INTO `td_area` VALUES ('610632', '黄陵县', '610600', '14');
INSERT INTO `td_area` VALUES ('610701', '市辖区', '610700', '1');
INSERT INTO `td_area` VALUES ('610702', '汉台区', '610700', '2');
INSERT INTO `td_area` VALUES ('610721', '南郑县', '610700', '3');
INSERT INTO `td_area` VALUES ('610722', '城固县', '610700', '4');
INSERT INTO `td_area` VALUES ('610723', '洋　县', '610700', '5');
INSERT INTO `td_area` VALUES ('610724', '西乡县', '610700', '6');
INSERT INTO `td_area` VALUES ('610725', '勉　县', '610700', '7');
INSERT INTO `td_area` VALUES ('610726', '宁强县', '610700', '8');
INSERT INTO `td_area` VALUES ('610727', '略阳县', '610700', '9');
INSERT INTO `td_area` VALUES ('610728', '镇巴县', '610700', '10');
INSERT INTO `td_area` VALUES ('610729', '留坝县', '610700', '11');
INSERT INTO `td_area` VALUES ('610730', '佛坪县', '610700', '12');
INSERT INTO `td_area` VALUES ('610801', '市辖区', '610800', '1');
INSERT INTO `td_area` VALUES ('610802', '榆阳区', '610800', '2');
INSERT INTO `td_area` VALUES ('610821', '神木县', '610800', '3');
INSERT INTO `td_area` VALUES ('610822', '府谷县', '610800', '4');
INSERT INTO `td_area` VALUES ('610823', '横山县', '610800', '5');
INSERT INTO `td_area` VALUES ('610824', '靖边县', '610800', '6');
INSERT INTO `td_area` VALUES ('610825', '定边县', '610800', '7');
INSERT INTO `td_area` VALUES ('610826', '绥德县', '610800', '8');
INSERT INTO `td_area` VALUES ('610827', '米脂县', '610800', '9');
INSERT INTO `td_area` VALUES ('610828', '佳　县', '610800', '10');
INSERT INTO `td_area` VALUES ('610829', '吴堡县', '610800', '11');
INSERT INTO `td_area` VALUES ('610830', '清涧县', '610800', '12');
INSERT INTO `td_area` VALUES ('610831', '子洲县', '610800', '13');
INSERT INTO `td_area` VALUES ('610901', '市辖区', '610900', '1');
INSERT INTO `td_area` VALUES ('610902', '汉滨区', '610900', '2');
INSERT INTO `td_area` VALUES ('610921', '汉阴县', '610900', '3');
INSERT INTO `td_area` VALUES ('610922', '石泉县', '610900', '4');
INSERT INTO `td_area` VALUES ('610923', '宁陕县', '610900', '5');
INSERT INTO `td_area` VALUES ('610924', '紫阳县', '610900', '6');
INSERT INTO `td_area` VALUES ('610925', '岚皋县', '610900', '7');
INSERT INTO `td_area` VALUES ('610926', '平利县', '610900', '8');
INSERT INTO `td_area` VALUES ('610927', '镇坪县', '610900', '9');
INSERT INTO `td_area` VALUES ('610928', '旬阳县', '610900', '10');
INSERT INTO `td_area` VALUES ('610929', '白河县', '610900', '11');
INSERT INTO `td_area` VALUES ('611001', '市辖区', '611000', '1');
INSERT INTO `td_area` VALUES ('611002', '商州区', '611000', '2');
INSERT INTO `td_area` VALUES ('611021', '洛南县', '611000', '3');
INSERT INTO `td_area` VALUES ('611022', '丹凤县', '611000', '4');
INSERT INTO `td_area` VALUES ('611023', '商南县', '611000', '5');
INSERT INTO `td_area` VALUES ('611024', '山阳县', '611000', '6');
INSERT INTO `td_area` VALUES ('611025', '镇安县', '611000', '7');
INSERT INTO `td_area` VALUES ('611026', '柞水县', '611000', '8');
INSERT INTO `td_area` VALUES ('620101', '市辖区', '620100', '1');
INSERT INTO `td_area` VALUES ('620102', '城关区', '620100', '2');
INSERT INTO `td_area` VALUES ('620103', '七里河区', '620100', '3');
INSERT INTO `td_area` VALUES ('620104', '西固区', '620100', '4');
INSERT INTO `td_area` VALUES ('620105', '安宁区', '620100', '5');
INSERT INTO `td_area` VALUES ('620111', '红古区', '620100', '6');
INSERT INTO `td_area` VALUES ('620121', '永登县', '620100', '7');
INSERT INTO `td_area` VALUES ('620122', '皋兰县', '620100', '8');
INSERT INTO `td_area` VALUES ('620123', '榆中县', '620100', '9');
INSERT INTO `td_area` VALUES ('620201', '市辖区', '620200', '1');
INSERT INTO `td_area` VALUES ('620301', '市辖区', '620300', '1');
INSERT INTO `td_area` VALUES ('620302', '金川区', '620300', '2');
INSERT INTO `td_area` VALUES ('620321', '永昌县', '620300', '3');
INSERT INTO `td_area` VALUES ('620401', '市辖区', '620400', '1');
INSERT INTO `td_area` VALUES ('620402', '白银区', '620400', '2');
INSERT INTO `td_area` VALUES ('620403', '平川区', '620400', '3');
INSERT INTO `td_area` VALUES ('620421', '靖远县', '620400', '4');
INSERT INTO `td_area` VALUES ('620422', '会宁县', '620400', '5');
INSERT INTO `td_area` VALUES ('620423', '景泰县', '620400', '6');
INSERT INTO `td_area` VALUES ('620501', '市辖区', '620500', '1');
INSERT INTO `td_area` VALUES ('620502', '秦城区', '620500', '2');
INSERT INTO `td_area` VALUES ('620503', '北道区', '620500', '3');
INSERT INTO `td_area` VALUES ('620521', '清水县', '620500', '4');
INSERT INTO `td_area` VALUES ('620522', '秦安县', '620500', '5');
INSERT INTO `td_area` VALUES ('620523', '甘谷县', '620500', '6');
INSERT INTO `td_area` VALUES ('620524', '武山县', '620500', '7');
INSERT INTO `td_area` VALUES ('620525', '张家川回族自治县', '620500', '8');
INSERT INTO `td_area` VALUES ('620601', '市辖区', '620600', '1');
INSERT INTO `td_area` VALUES ('620602', '凉州区', '620600', '2');
INSERT INTO `td_area` VALUES ('620621', '民勤县', '620600', '3');
INSERT INTO `td_area` VALUES ('620622', '古浪县', '620600', '4');
INSERT INTO `td_area` VALUES ('620623', '天祝藏族自治县', '620600', '5');
INSERT INTO `td_area` VALUES ('620701', '市辖区', '620700', '1');
INSERT INTO `td_area` VALUES ('620702', '甘州区', '620700', '2');
INSERT INTO `td_area` VALUES ('620721', '肃南裕固族自治县', '620700', '3');
INSERT INTO `td_area` VALUES ('620722', '民乐县', '620700', '4');
INSERT INTO `td_area` VALUES ('620723', '临泽县', '620700', '5');
INSERT INTO `td_area` VALUES ('620724', '高台县', '620700', '6');
INSERT INTO `td_area` VALUES ('620725', '山丹县', '620700', '7');
INSERT INTO `td_area` VALUES ('620801', '市辖区', '620800', '1');
INSERT INTO `td_area` VALUES ('620802', '崆峒区', '620800', '2');
INSERT INTO `td_area` VALUES ('620821', '泾川县', '620800', '3');
INSERT INTO `td_area` VALUES ('620822', '灵台县', '620800', '4');
INSERT INTO `td_area` VALUES ('620823', '崇信县', '620800', '5');
INSERT INTO `td_area` VALUES ('620824', '华亭县', '620800', '6');
INSERT INTO `td_area` VALUES ('620825', '庄浪县', '620800', '7');
INSERT INTO `td_area` VALUES ('620826', '静宁县', '620800', '8');
INSERT INTO `td_area` VALUES ('620901', '市辖区', '620900', '1');
INSERT INTO `td_area` VALUES ('620902', '肃州区', '620900', '2');
INSERT INTO `td_area` VALUES ('620921', '金塔县', '620900', '3');
INSERT INTO `td_area` VALUES ('620922', '安西县', '620900', '4');
INSERT INTO `td_area` VALUES ('620923', '肃北蒙古族自治县', '620900', '5');
INSERT INTO `td_area` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '6');
INSERT INTO `td_area` VALUES ('620981', '玉门市', '620900', '7');
INSERT INTO `td_area` VALUES ('620982', '敦煌市', '620900', '8');
INSERT INTO `td_area` VALUES ('621001', '市辖区', '621000', '1');
INSERT INTO `td_area` VALUES ('621002', '西峰区', '621000', '2');
INSERT INTO `td_area` VALUES ('621021', '庆城县', '621000', '3');
INSERT INTO `td_area` VALUES ('621022', '环　县', '621000', '4');
INSERT INTO `td_area` VALUES ('621023', '华池县', '621000', '5');
INSERT INTO `td_area` VALUES ('621024', '合水县', '621000', '6');
INSERT INTO `td_area` VALUES ('621025', '正宁县', '621000', '7');
INSERT INTO `td_area` VALUES ('621026', '宁　县', '621000', '8');
INSERT INTO `td_area` VALUES ('621027', '镇原县', '621000', '9');
INSERT INTO `td_area` VALUES ('621101', '市辖区', '621100', '1');
INSERT INTO `td_area` VALUES ('621102', '安定区', '621100', '2');
INSERT INTO `td_area` VALUES ('621121', '通渭县', '621100', '3');
INSERT INTO `td_area` VALUES ('621122', '陇西县', '621100', '4');
INSERT INTO `td_area` VALUES ('621123', '渭源县', '621100', '5');
INSERT INTO `td_area` VALUES ('621124', '临洮县', '621100', '6');
INSERT INTO `td_area` VALUES ('621125', '漳　县', '621100', '7');
INSERT INTO `td_area` VALUES ('621126', '岷　县', '621100', '8');
INSERT INTO `td_area` VALUES ('621201', '市辖区', '621200', '1');
INSERT INTO `td_area` VALUES ('621202', '武都区', '621200', '2');
INSERT INTO `td_area` VALUES ('621221', '成　县', '621200', '3');
INSERT INTO `td_area` VALUES ('621222', '文　县', '621200', '4');
INSERT INTO `td_area` VALUES ('621223', '宕昌县', '621200', '5');
INSERT INTO `td_area` VALUES ('621224', '康　县', '621200', '6');
INSERT INTO `td_area` VALUES ('621225', '西和县', '621200', '7');
INSERT INTO `td_area` VALUES ('621226', '礼　县', '621200', '8');
INSERT INTO `td_area` VALUES ('621227', '徽　县', '621200', '9');
INSERT INTO `td_area` VALUES ('621228', '两当县', '621200', '10');
INSERT INTO `td_area` VALUES ('622901', '临夏市', '622900', '1');
INSERT INTO `td_area` VALUES ('622921', '临夏县', '622900', '2');
INSERT INTO `td_area` VALUES ('622922', '康乐县', '622900', '3');
INSERT INTO `td_area` VALUES ('622923', '永靖县', '622900', '4');
INSERT INTO `td_area` VALUES ('622924', '广河县', '622900', '5');
INSERT INTO `td_area` VALUES ('622925', '和政县', '622900', '6');
INSERT INTO `td_area` VALUES ('622926', '东乡族自治县', '622900', '7');
INSERT INTO `td_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '8');
INSERT INTO `td_area` VALUES ('623001', '合作市', '623000', '1');
INSERT INTO `td_area` VALUES ('623021', '临潭县', '623000', '2');
INSERT INTO `td_area` VALUES ('623022', '卓尼县', '623000', '3');
INSERT INTO `td_area` VALUES ('623023', '舟曲县', '623000', '4');
INSERT INTO `td_area` VALUES ('623024', '迭部县', '623000', '5');
INSERT INTO `td_area` VALUES ('623025', '玛曲县', '623000', '6');
INSERT INTO `td_area` VALUES ('623026', '碌曲县', '623000', '7');
INSERT INTO `td_area` VALUES ('623027', '夏河县', '623000', '8');
INSERT INTO `td_area` VALUES ('630101', '市辖区', '630100', '1');
INSERT INTO `td_area` VALUES ('630102', '城东区', '630100', '2');
INSERT INTO `td_area` VALUES ('630103', '城中区', '630100', '3');
INSERT INTO `td_area` VALUES ('630104', '城西区', '630100', '4');
INSERT INTO `td_area` VALUES ('630105', '城北区', '630100', '5');
INSERT INTO `td_area` VALUES ('630121', '大通回族土族自治县', '630100', '6');
INSERT INTO `td_area` VALUES ('630122', '湟中县', '630100', '7');
INSERT INTO `td_area` VALUES ('630123', '湟源县', '630100', '8');
INSERT INTO `td_area` VALUES ('632121', '平安县', '632100', '1');
INSERT INTO `td_area` VALUES ('632122', '民和回族土族自治县', '632100', '2');
INSERT INTO `td_area` VALUES ('632123', '乐都县', '632100', '3');
INSERT INTO `td_area` VALUES ('632126', '互助土族自治县', '632100', '4');
INSERT INTO `td_area` VALUES ('632127', '化隆回族自治县', '632100', '5');
INSERT INTO `td_area` VALUES ('632128', '循化撒拉族自治县', '632100', '6');
INSERT INTO `td_area` VALUES ('632221', '门源回族自治县', '632200', '1');
INSERT INTO `td_area` VALUES ('632222', '祁连县', '632200', '2');
INSERT INTO `td_area` VALUES ('632223', '海晏县', '632200', '3');
INSERT INTO `td_area` VALUES ('632224', '刚察县', '632200', '4');
INSERT INTO `td_area` VALUES ('632321', '同仁县', '632300', '1');
INSERT INTO `td_area` VALUES ('632322', '尖扎县', '632300', '2');
INSERT INTO `td_area` VALUES ('632323', '泽库县', '632300', '3');
INSERT INTO `td_area` VALUES ('632324', '河南蒙古族自治县', '632300', '4');
INSERT INTO `td_area` VALUES ('632521', '共和县', '632500', '1');
INSERT INTO `td_area` VALUES ('632522', '同德县', '632500', '2');
INSERT INTO `td_area` VALUES ('632523', '贵德县', '632500', '3');
INSERT INTO `td_area` VALUES ('632524', '兴海县', '632500', '4');
INSERT INTO `td_area` VALUES ('632525', '贵南县', '632500', '5');
INSERT INTO `td_area` VALUES ('632621', '玛沁县', '632600', '1');
INSERT INTO `td_area` VALUES ('632622', '班玛县', '632600', '2');
INSERT INTO `td_area` VALUES ('632623', '甘德县', '632600', '3');
INSERT INTO `td_area` VALUES ('632624', '达日县', '632600', '4');
INSERT INTO `td_area` VALUES ('632625', '久治县', '632600', '5');
INSERT INTO `td_area` VALUES ('632626', '玛多县', '632600', '6');
INSERT INTO `td_area` VALUES ('632721', '玉树县', '632700', '1');
INSERT INTO `td_area` VALUES ('632722', '杂多县', '632700', '2');
INSERT INTO `td_area` VALUES ('632723', '称多县', '632700', '3');
INSERT INTO `td_area` VALUES ('632724', '治多县', '632700', '4');
INSERT INTO `td_area` VALUES ('632725', '囊谦县', '632700', '5');
INSERT INTO `td_area` VALUES ('632726', '曲麻莱县', '632700', '6');
INSERT INTO `td_area` VALUES ('632801', '格尔木市', '632800', '1');
INSERT INTO `td_area` VALUES ('632802', '德令哈市', '632800', '2');
INSERT INTO `td_area` VALUES ('632821', '乌兰县', '632800', '3');
INSERT INTO `td_area` VALUES ('632822', '都兰县', '632800', '4');
INSERT INTO `td_area` VALUES ('632823', '天峻县', '632800', '5');
INSERT INTO `td_area` VALUES ('640101', '市辖区', '640100', '1');
INSERT INTO `td_area` VALUES ('640104', '兴庆区', '640100', '2');
INSERT INTO `td_area` VALUES ('640105', '西夏区', '640100', '3');
INSERT INTO `td_area` VALUES ('640106', '金凤区', '640100', '4');
INSERT INTO `td_area` VALUES ('640121', '永宁县', '640100', '5');
INSERT INTO `td_area` VALUES ('640122', '贺兰县', '640100', '6');
INSERT INTO `td_area` VALUES ('640181', '灵武市', '640100', '7');
INSERT INTO `td_area` VALUES ('640201', '市辖区', '640200', '1');
INSERT INTO `td_area` VALUES ('640202', '大武口区', '640200', '2');
INSERT INTO `td_area` VALUES ('640205', '惠农区', '640200', '3');
INSERT INTO `td_area` VALUES ('640221', '平罗县', '640200', '4');
INSERT INTO `td_area` VALUES ('640301', '市辖区', '640300', '1');
INSERT INTO `td_area` VALUES ('640302', '利通区', '640300', '2');
INSERT INTO `td_area` VALUES ('640323', '盐池县', '640300', '3');
INSERT INTO `td_area` VALUES ('640324', '同心县', '640300', '4');
INSERT INTO `td_area` VALUES ('640381', '青铜峡市', '640300', '5');
INSERT INTO `td_area` VALUES ('640401', '市辖区', '640400', '1');
INSERT INTO `td_area` VALUES ('640402', '原州区', '640400', '2');
INSERT INTO `td_area` VALUES ('640422', '西吉县', '640400', '3');
INSERT INTO `td_area` VALUES ('640423', '隆德县', '640400', '4');
INSERT INTO `td_area` VALUES ('640424', '泾源县', '640400', '5');
INSERT INTO `td_area` VALUES ('640425', '彭阳县', '640400', '6');
INSERT INTO `td_area` VALUES ('640501', '市辖区', '640500', '1');
INSERT INTO `td_area` VALUES ('640502', '沙坡头区', '640500', '2');
INSERT INTO `td_area` VALUES ('640521', '中宁县', '640500', '3');
INSERT INTO `td_area` VALUES ('640522', '海原县', '640500', '4');
INSERT INTO `td_area` VALUES ('650101', '市辖区', '650100', '1');
INSERT INTO `td_area` VALUES ('650102', '天山区', '650100', '2');
INSERT INTO `td_area` VALUES ('650103', '沙依巴克区', '650100', '3');
INSERT INTO `td_area` VALUES ('650104', '新市区', '650100', '4');
INSERT INTO `td_area` VALUES ('650105', '水磨沟区', '650100', '5');
INSERT INTO `td_area` VALUES ('650106', '头屯河区', '650100', '6');
INSERT INTO `td_area` VALUES ('650107', '达坂城区', '650100', '7');
INSERT INTO `td_area` VALUES ('650108', '东山区', '650100', '8');
INSERT INTO `td_area` VALUES ('650121', '乌鲁木齐县', '650100', '9');
INSERT INTO `td_area` VALUES ('650201', '市辖区', '650200', '1');
INSERT INTO `td_area` VALUES ('650202', '独山子区', '650200', '2');
INSERT INTO `td_area` VALUES ('650203', '克拉玛依区', '650200', '3');
INSERT INTO `td_area` VALUES ('650204', '白碱滩区', '650200', '4');
INSERT INTO `td_area` VALUES ('650205', '乌尔禾区', '650200', '5');
INSERT INTO `td_area` VALUES ('652101', '吐鲁番市', '652100', '1');
INSERT INTO `td_area` VALUES ('652122', '鄯善县', '652100', '2');
INSERT INTO `td_area` VALUES ('652123', '托克逊县', '652100', '3');
INSERT INTO `td_area` VALUES ('652201', '哈密市', '652200', '1');
INSERT INTO `td_area` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '2');
INSERT INTO `td_area` VALUES ('652223', '伊吾县', '652200', '3');
INSERT INTO `td_area` VALUES ('652301', '昌吉市', '652300', '1');
INSERT INTO `td_area` VALUES ('652302', '阜康市', '652300', '2');
INSERT INTO `td_area` VALUES ('652303', '米泉市', '652300', '3');
INSERT INTO `td_area` VALUES ('652323', '呼图壁县', '652300', '4');
INSERT INTO `td_area` VALUES ('652324', '玛纳斯县', '652300', '5');
INSERT INTO `td_area` VALUES ('652325', '奇台县', '652300', '6');
INSERT INTO `td_area` VALUES ('652327', '吉木萨尔县', '652300', '7');
INSERT INTO `td_area` VALUES ('652328', '木垒哈萨克自治县', '652300', '8');
INSERT INTO `td_area` VALUES ('652701', '博乐市', '652700', '1');
INSERT INTO `td_area` VALUES ('652722', '精河县', '652700', '2');
INSERT INTO `td_area` VALUES ('652723', '温泉县', '652700', '3');
INSERT INTO `td_area` VALUES ('652801', '库尔勒市', '652800', '1');
INSERT INTO `td_area` VALUES ('652822', '轮台县', '652800', '2');
INSERT INTO `td_area` VALUES ('652823', '尉犁县', '652800', '3');
INSERT INTO `td_area` VALUES ('652824', '若羌县', '652800', '4');
INSERT INTO `td_area` VALUES ('652825', '且末县', '652800', '5');
INSERT INTO `td_area` VALUES ('652826', '焉耆回族自治县', '652800', '6');
INSERT INTO `td_area` VALUES ('652827', '和静县', '652800', '7');
INSERT INTO `td_area` VALUES ('652828', '和硕县', '652800', '8');
INSERT INTO `td_area` VALUES ('652829', '博湖县', '652800', '9');
INSERT INTO `td_area` VALUES ('652901', '阿克苏市', '652900', '1');
INSERT INTO `td_area` VALUES ('652922', '温宿县', '652900', '2');
INSERT INTO `td_area` VALUES ('652923', '库车县', '652900', '3');
INSERT INTO `td_area` VALUES ('652924', '沙雅县', '652900', '4');
INSERT INTO `td_area` VALUES ('652925', '新和县', '652900', '5');
INSERT INTO `td_area` VALUES ('652926', '拜城县', '652900', '6');
INSERT INTO `td_area` VALUES ('652927', '乌什县', '652900', '7');
INSERT INTO `td_area` VALUES ('652928', '阿瓦提县', '652900', '8');
INSERT INTO `td_area` VALUES ('652929', '柯坪县', '652900', '9');
INSERT INTO `td_area` VALUES ('653001', '阿图什市', '653000', '1');
INSERT INTO `td_area` VALUES ('653022', '阿克陶县', '653000', '2');
INSERT INTO `td_area` VALUES ('653023', '阿合奇县', '653000', '3');
INSERT INTO `td_area` VALUES ('653024', '乌恰县', '653000', '4');
INSERT INTO `td_area` VALUES ('653101', '喀什市', '653100', '1');
INSERT INTO `td_area` VALUES ('653121', '疏附县', '653100', '2');
INSERT INTO `td_area` VALUES ('653122', '疏勒县', '653100', '3');
INSERT INTO `td_area` VALUES ('653123', '英吉沙县', '653100', '4');
INSERT INTO `td_area` VALUES ('653124', '泽普县', '653100', '5');
INSERT INTO `td_area` VALUES ('653125', '莎车县', '653100', '6');
INSERT INTO `td_area` VALUES ('653126', '叶城县', '653100', '7');
INSERT INTO `td_area` VALUES ('653127', '麦盖提县', '653100', '8');
INSERT INTO `td_area` VALUES ('653128', '岳普湖县', '653100', '9');
INSERT INTO `td_area` VALUES ('653129', '伽师县', '653100', '10');
INSERT INTO `td_area` VALUES ('653130', '巴楚县', '653100', '11');
INSERT INTO `td_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '12');
INSERT INTO `td_area` VALUES ('653201', '和田市', '653200', '1');
INSERT INTO `td_area` VALUES ('653221', '和田县', '653200', '2');
INSERT INTO `td_area` VALUES ('653222', '墨玉县', '653200', '3');
INSERT INTO `td_area` VALUES ('653223', '皮山县', '653200', '4');
INSERT INTO `td_area` VALUES ('653224', '洛浦县', '653200', '5');
INSERT INTO `td_area` VALUES ('653225', '策勒县', '653200', '6');
INSERT INTO `td_area` VALUES ('653226', '于田县', '653200', '7');
INSERT INTO `td_area` VALUES ('653227', '民丰县', '653200', '8');
INSERT INTO `td_area` VALUES ('654002', '伊宁市', '654000', '1');
INSERT INTO `td_area` VALUES ('654003', '奎屯市', '654000', '2');
INSERT INTO `td_area` VALUES ('654021', '伊宁县', '654000', '3');
INSERT INTO `td_area` VALUES ('654022', '察布查尔锡伯自治县', '654000', '4');
INSERT INTO `td_area` VALUES ('654023', '霍城县', '654000', '5');
INSERT INTO `td_area` VALUES ('654024', '巩留县', '654000', '6');
INSERT INTO `td_area` VALUES ('654025', '新源县', '654000', '7');
INSERT INTO `td_area` VALUES ('654026', '昭苏县', '654000', '8');
INSERT INTO `td_area` VALUES ('654027', '特克斯县', '654000', '9');
INSERT INTO `td_area` VALUES ('654028', '尼勒克县', '654000', '10');
INSERT INTO `td_area` VALUES ('654201', '塔城市', '654200', '1');
INSERT INTO `td_area` VALUES ('654202', '乌苏市', '654200', '2');
INSERT INTO `td_area` VALUES ('654221', '额敏县', '654200', '3');
INSERT INTO `td_area` VALUES ('654223', '沙湾县', '654200', '4');
INSERT INTO `td_area` VALUES ('654224', '托里县', '654200', '5');
INSERT INTO `td_area` VALUES ('654225', '裕民县', '654200', '6');
INSERT INTO `td_area` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '7');
INSERT INTO `td_area` VALUES ('654301', '阿勒泰市', '654300', '1');
INSERT INTO `td_area` VALUES ('654321', '布尔津县', '654300', '2');
INSERT INTO `td_area` VALUES ('654322', '富蕴县', '654300', '3');
INSERT INTO `td_area` VALUES ('654323', '福海县', '654300', '4');
INSERT INTO `td_area` VALUES ('654324', '哈巴河县', '654300', '5');
INSERT INTO `td_area` VALUES ('654325', '青河县', '654300', '6');
INSERT INTO `td_area` VALUES ('654326', '吉木乃县', '654300', '7');
INSERT INTO `td_area` VALUES ('659001', '石河子市', '659000', '1');
INSERT INTO `td_area` VALUES ('659002', '阿拉尔市', '659000', '2');
INSERT INTO `td_area` VALUES ('659003', '图木舒克市', '659000', '3');
INSERT INTO `td_area` VALUES ('659004', '五家渠市', '659000', '4');
INSERT INTO `td_area` VALUES ('810001', '香港', '810000', '1');
INSERT INTO `td_area` VALUES ('810002', '中西区', '810001', '1');
INSERT INTO `td_area` VALUES ('810003', '九龙城区', '810001', '2');
INSERT INTO `td_area` VALUES ('810004', '南区', '810001', '3');
INSERT INTO `td_area` VALUES ('810005', '黄大仙区', '810001', '4');
INSERT INTO `td_area` VALUES ('810006', '油尖旺区', '810001', '5');
INSERT INTO `td_area` VALUES ('810007', '葵青区', '810001', '6');
INSERT INTO `td_area` VALUES ('810008', '西贡区', '810001', '7');
INSERT INTO `td_area` VALUES ('810009', '屯门区', '810001', '8');
INSERT INTO `td_area` VALUES ('810010', '荃湾区', '810001', '9');
INSERT INTO `td_area` VALUES ('810011', '东区', '810001', '10');
INSERT INTO `td_area` VALUES ('810012', '观塘区', '810001', '11');
INSERT INTO `td_area` VALUES ('810013', '深水步区', '810001', '12');
INSERT INTO `td_area` VALUES ('810014', '湾仔区', '810001', '13');
INSERT INTO `td_area` VALUES ('810015', '离岛区', '810001', '14');
INSERT INTO `td_area` VALUES ('810016', '北区', '810001', '15');
INSERT INTO `td_area` VALUES ('810017', '沙田区', '810001', '16');
INSERT INTO `td_area` VALUES ('810018', '大埔区', '810001', '17');
INSERT INTO `td_area` VALUES ('810019', '元朗区', '810001', '18');
INSERT INTO `td_area` VALUES ('820001', '澳门', '820000', '1');
INSERT INTO `td_area` VALUES ('820002', '澳门', '820001', '1');
INSERT INTO `td_area` VALUES ('710001', '台北市', '710000', '1');
INSERT INTO `td_area` VALUES ('710002', '台北县', '710001', '1');
INSERT INTO `td_area` VALUES ('710003', '基隆市', '710000', '2');
INSERT INTO `td_area` VALUES ('910005', '中山市', '442000', '1');
INSERT INTO `td_area` VALUES ('710004', '花莲县', '710003', '1');
INSERT INTO `td_area` VALUES ('910006', '东莞市', '441900', '1');
INSERT INTO `td_area` VALUES ('910010', '1111', '910007', '1');

-- ----------------------------
-- Table structure for `td_article`
-- ----------------------------
DROP TABLE IF EXISTS `td_article`;
CREATE TABLE `td_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章逻辑ID',
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '文章类别',
  `photo` varchar(64) DEFAULT '' COMMENT '文章图片',
  `remark` varchar(256) DEFAULT '' COMMENT '文章描述',
  `keyword` varchar(32) DEFAULT '' COMMENT '文章关键字',
  `content` text NOT NULL COMMENT '文章内容',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览量',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '文章类型',
  `is_tui` int(1) DEFAULT '0' COMMENT '是否推荐',
  `from` varchar(16) NOT NULL DEFAULT '' COMMENT '来源',
  `writer` varchar(64) NOT NULL COMMENT '作者',
  `ip` varchar(16) NOT NULL COMMENT 'IP',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `sort` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `a_title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of td_article
-- ----------------------------
INSERT INTO `td_article` VALUES ('5', 'PHP初学者必须掌握的10个知识点', '5', '20161102/faa5e3e655b45c7dbbe6aa2ccc187dc0.jpg', '这里总结了PHP初学者容易感到困惑的10个问题，供大家参考。', 'PHP', '<p style=\"text-align:center\"><img alt=\"a8d43f7egw1evreghrn9sj20rs0eon1u.jpg\" src=\"/Upload/20150905/1441435048306230.jpg\" title=\"1441435048306230.jpg\"/></p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这里总结了PHP初学者容易感到困惑的10个问题，供大家参考。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">1、页面之间无法传递变量</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">get,post,session在最新的php版本中自动全局变量是关闭的，所以要从上一页面取得提交过来得变量要使用$_GET[&#39;foo&#39;],$_POST[&#39;foo&#39;],$_SESSION[&#39;foo&#39;]来得到。当然也可以修改自动全局变量为开(php.ini改为register_globals = On);考虑到兼容性，还是强迫自己熟悉新的写法比较好。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">注：PHP中的超全局变量</strong></p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">从PHP 4.2.0 开始，register_globals 的默认值为 off，这样一来，以前的很多可以直接使用的变量，如 $PHP_SELF 或者你设定的SESSION变量都不能用 “$变量名”的形式访问了，这可能会给你带来很多不变，但却有助于安全性的提高。访问这些变量，你需要使用PHP 超全局变量，如下：</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_SERVER</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">变量由 Web 服务器设定或者直接与当前脚本的执行环境相关联。类似于旧数组 $HTTP_SERVER_VARS 数组。以前的$PHP_SELF对应$_SERVER[&#39;PHP_SELF&#39;]，你可以使用phpinfo来查看你的$_SERVER变量。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_GET</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP GET 方法提交至脚本的变量。类似于旧数组 $HTTP_GET_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_POST</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP POST 方法提交至脚本的变量。类似于旧数组 $HTTP_POST_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_COOKIE</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP Cookies 方法提交至脚本的变量。类似于旧数组 $HTTP_COOKIE_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_SESSION</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">当前注册给脚本会话的变量。类似于旧数组 $HTTP_SESSION_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">经由 HTTP POST 文件上传而提交至脚本的变量。类似于旧数组 $HTTP_POST_FILES 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_ENV</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">执行环境提交至脚本的变量。类似于旧数组 $HTTP_ENV_VARS 数组。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">对于$_FILES变量：(文件域字段为“myfile”)</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;name&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">客户端机器文件的原名称(包括路径)。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;type&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">文件的 MIME 类型，需要浏览器提供该信息的支持，例如“image/gif”。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;size&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">已上传文件的大小，单位为字节。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;tmp_name&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">文件被上传后在服务端储存的临时文件名(包括路径)。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">$_FILES[&#39;myfile&#39;][&#39;error&#39;]</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">和该文件上传相关的错误代码。[&#39;error&#39;] 是在 PHP 4.2.0 版本中增加的。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">当 php.ini 中的 register_globals 被设置为 on 时，$myfile_name 等价于 $_FILES[&#39;myfile&#39;][&#39;name&#39;]，$myfile_type 等价于 $_FILES[&#39;myfile&#39;][&#39;type&#39;]等。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">2、win32下的session不能正常工作</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">php.ini默认的session.save_path = /tmp</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这显然是linux下的配置，win32下php无法读写session文件导致session无法使用，把它改成一个绝对路径就可以了，例如session.save_path = c:windowstemp。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">3、显示错误信息</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">当php.ini的display_errors = On并且error_reporting = E_ALL时，将显示所有的错误和提示，调试的时候最好打开以便纠错，如果你用以前php写法错误信息多半是关于未定义变量的。变量在赋值以前调用会有提示，解决办法是探测或者屏蔽，例如显示$foo，可以if(isset($foo)) echo$foo 或者echo @$foo</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">4、header already sent</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这个错误通常会在你使用HEADER的时候出现，他可能是几种原因：1，你在使用HEADER前PRING或者ECHO了2.你当前文件前面有空行3.你可能INCLUDE了一个文件,该文件尾部有空行或者输出也会出现这种错误。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">5、更改php.ini后没有变化</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">重新启动web server，比如IIS，Apache等等，然后才会应用最新的设置。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">6、有时候sql语句不起作用，对数据库操作失败。最简便的调试方法，echo那句sql，看看变量的值是否能得到。</strong></p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">7、include和require的区别</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">两者没有太大的区别，如果要包含的文件不存在，include提示notice，然后继续执行下面的语句，require提示致命错误并且退出。根据测试，win32平台下它们都是先包含后执行，所以被包含文件里最好不要再有include或require语句，这样会造成目录混乱。或许*nux下情况不同，暂时还没测试。如果一个文件不想被包含多次可以使用include_once或require_once## 读取，写入文档数据：</p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">function&nbsp;r($file_name)&nbsp;{\r\n$filenum=@fopen($file_name,&quot;r&quot;);\r\n@flock($filenum,LOCK_SH);\r\n$file_data=@fread($filenum,filesize($file_name));\r\n@fclose($filenum);\r\nreturn&nbsp;$file_data;\r\n}\r\nfunction&nbsp;w($file_name,$data,$method=&quot;w&quot;){\r\n$filenum=@fopen($file_name,$method);\r\nflock($filenum,LOCK_EX);\r\n$file_data=fwrite($filenum,$data);\r\nfclose($filenum);\r\nreturn&nbsp;$file_data;\r\n}</pre><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">8、isset和empty的区别</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">两者都是测试变量用的，但是isset是测试变量是否被赋值，而empty是测试一个已经被赋值的变量是否为空。如果一个变量没被赋值就引用在php里是被允许的,但会有notice提示。如果一个变量被赋空值，$foo=”&quot;或者$foo=0或者 $foo=false,那么empty($foo)返回真，isset($foo)也返回真，就是说赋空值不会注销一个变量。要注销一个变量，可以用 unset($foo)或者$foo=NULL。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">9、mysql查询语句包含有关键字</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">php查询mysql的时候，有时候mysql表名或者列名会有关键字，这时候查询会有错误。例如表名是order,查询时候会出错，简单的办法是sql语句里表名或者列名加上`[tab键上面]来加以区别，例如select * from `order`。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">10、通过HTTP协议一次上传多个文件的方法</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">有两个思路，是同一个方法的两种实现。具体程序还需自己去设计</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">1. 在form中设置多个文件输入框，用数组命名他们的名字，如下：</strong></p><pre class=\"brush: html; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\"><br/></pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">这样，在服务器端做以下测试</strong></p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">echo&nbsp;&quot;&quot;;\r\nprint_r($_FILES);\r\necho&nbsp;&quot;&quot;;</pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">2. 在form中设置多个文件输入框，但名字不同，如下：</strong></p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\"><br/></pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">在服务器端做同样测试：</strong></p><pre class=\"brush: php; gutter: false; first-line: 1\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: \" courier=\"\" border-width:=\"\" 1px=\"\" border-style:=\"\" border-color:=\"\" background-color:=\"\" color:=\"\" letter-spacing:=\"\" text-align:=\"\" text-indent:=\"\" text-transform:=\"\" word-spacing:=\"\">echo&nbsp;&quot;&quot;;\r\nprint_r($_FILES);\r\necho&nbsp;&quot;&quot;;</pre>', '441', '1', '0', 'Win 8.1', '轮回', '124.152.7.106', '1441435103', '1478063913', '');
INSERT INTO `td_article` VALUES ('11', '编写高质量的代码，从命名入手', '1', '20161102/3e89fb987578575391cebc166603ba53.jpg', '笔者从事开发多年，有这样一种感觉，查看一些开源项目，如Spring、Apache Common等源码是一件赏心悦目的事情，究其原因，无外两点：1）代码质量非常高；2）命名特别规范（这可能跟老外的英语水平有关）。', '代码', '<p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者从事开发多年，有这样一种感觉，查看一些开源项目，如Spring、Apache Common等源码是一件赏心悦目的事情，究其原因，无外两点：1）代码质量非常高；2）命名特别规范（这可能跟老外的英语水平有关）。</p><p style=\"text-align:center\"><br/></p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">要写高质量的代码，不是一件容易的事，需要长年累月的锻炼，是一个量变到质变的过程，但要写好命名，只需要有比较好的英语语法基础和一种自我意识即可轻松达到。<strong style=\"margin: 0px; padding: 0px;\">本博文将会结合本人的开发经验，总结出若干命名规则，这些命名规则纯属个人的使用习惯，不代表是一种理想的规则，在这里列举出来，供大家交流讨论。</strong></p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">1.切忌使用没有任何意义的英语字母进行命名</h2><pre class=\"brush: java; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">&nbsp;for(int&nbsp;i=0;&nbsp;i&lt;10;&nbsp;i++)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...\r\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">这是在很多教Java基本语法的书上常见的代码片断，作为教学材料，这样写无可厚非，但作为真正的代码编写，<span class=\"wp_keywordlink\"><a href=\"http://www.codeceo.com/\" title=\"程序员\" target=\"_blank\" style=\"color: rgb(0, 136, 219); text-decoration: none; cursor: pointer;\">程序员</a></span>必须要养成良好的习惯，不要使用这种没有任何含义的命名方式，这里可以使用“index”。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">2.切忌使用拼音，甚至是拼音首字母组合</h2><pre class=\"brush: c; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">cishu&nbsp;=5;&nbsp;//&nbsp;循环的次数\r\nzzje&nbsp;=&nbsp;1000.00&nbsp;//&nbsp;转账金额</pre><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者在做代码检查的时候，无数次遇到过这样的命名，使人哭笑不得</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">3.要使用英文，而且要使用准确的英语，无论是拼写还是语法</h2><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>名词单数，必须使用单数英文，如Account、Customer。</p></li><li><p>对于数组，列表等对象集合的命名，必须使用复数，而且最好按照英文的语法基础知识使用准确的复数形式，如 List<account>accounts、Set<strategy>strategies。</strategy></account></p></li><li><p>对于boolean值的属性，很多开发人员习惯使用isXXX，如isClose（是否关闭），但这里有两点建议：1）最好不要带“is”，因为JavaBean的规范，为属性生成get/set方法的时候，会用“get/set/is”，上面的例子，生成get/set方法就会变成“getIsClose/isIsClose/getIsClose”，非常别扭；2）由于boolean值通常反映“是否”，所以准确的用法，应该是是用“形容词”，上面的例子，最终应该被改为 closed，那么get/set方法就是“getClosed/isColsed/setClosed”，非常符合英语阅读习惯。</p></li></ul><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">4.方法名的命名，需要使用“动宾结构短语”或“是动词+表语结构短语”</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者曾看到过千奇百怪的方法命名，有些使用名词，有些甚至是“名词+动词”，而且，如果宾语是一个对象集合，还是最好使用复数：</p><pre class=\"brush: java; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">createOrder(Order&nbsp;order)&nbsp;//good\r\norderCreate(Order&nbsp;order)&nbsp;//bad\r\nremoveOrders(List&nbsp;orders)&nbsp;//good\r\nremoveOrder(List&nbsp;order)&nbsp;//bad</pre><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">5.对于常见的“增删改查”方法，命名最好要谨慎：</h2><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>增加：最常见使用create和add，但最好根据英语的语义进行区分，这有助于理解，create代表创建，add代表增加。比如，要创建一个Student，用createStudent要比用addStudent好，为什么？想想如果有个类叫Clazz(班级，避开Java关键字），现在要把一个Student加入到一个Clazz，Clazz很容易就定义了一个 addStudent（Student student)的方法，那么就比较容易混淆。</p></li><li><p>修改：常见的有alter、update、modify，个人觉得modify最准确。</p></li><li><p>查询：对于获取单个对象，可以用get或load，但个人建议用get，解释请见第7点的说明，对于不分条件列举，用list，对于有条件查询，用search（最好不要用find，find在英文了强调结果，是“找到”的意思，你提供一个“查询”方法，不保证输入的条件总能“找到”结果）。</p></li><li><p>删除：常见的有delete和remove，但删除建议用delete，因为remove有“移除”的意思，参考Clazz的例子就可以理解，从班级移除一个学生，会用removeStudent。</p></li></ul><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">6.宁愿方法名冗长，也不要使用让人费解的简写</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者曾经遇到一个方法，判断“支付账户是否与收款账户相同”，结果我看到一个这样的命名：</p><pre class=\"brush: java; gutter: true\" style=\"margin: 15px auto; padding: 10px 15px; word-break: break-all; word-wrap: break-word; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: 20px; font-family: &#39;courier new&#39;; border-width: 1px 1px 1px 4px; border-style: solid; border-color: rgb(221, 221, 221); background-color: rgb(251, 251, 251); color: rgb(68, 68, 68); letter-spacing: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-position: initial initial; background-repeat: initial initial;\">checkIsOrderingAccCollAccSame(...)&nbsp;//&nbsp;很难理解，我马上把它改为：\r\nisOrderingAccountSameAsCollectionAccount(...)&nbsp;//&nbsp;虽然有点长，但非常容易阅读，而且这种情况总是出现得比较少。</pre><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">7.如果你在设计业务系统，最好不要使用技术化的术语去命名</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">笔者曾经工作的公司曾经制订这样的命名规则，接口必须要以“I”开头，数据传输对象必须以“DTO”作为后缀，数据访问对象必须以“DAO”作为后缀，领域对象必须以“DO”作为后缀，我之所以不建议这种做法，是希望设计人员从一开始就引导开发人员，要从“业务”出发考虑问题，而不要从“技术”出发。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">所以，接口不需要非得以“I”开头，只要其实现类以“Impl”结尾即可（注：笔者认为接口是与细节无关的，与技术无关，但实现类是实现相关的，用技术化术语无可口非），而数据传输对象，其实无非就是保存一个对象的信息，因此可以用“**Info”，如CustomerInfo，领域对象本身就是业务的核心，所以还是以其真实名称出现，比如Account、Customer，至于“DAO”，这一个词来源于J2ee的<span class=\"wp_keywordlink\"><a href=\"http://www.codeceo.com/article/category/develop/design-patterns\" title=\"设计模式\" target=\"_blank\" style=\"color: rgb(0, 136, 219); text-decoration: none; cursor: pointer;\">设计模式</a></span>，笔者在之前的项目使用“***Repository”命名，意味“***的仓库”，如AccountRepository.</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">关于“Repository”这个词的命名，是来源于Eric Evans的《Domain-Driven Design》一书的仓库概念，Eric Evans对Repository的概念定义是：领域对象的概念性集合，个人认为这个命名非常的贴切，它让程序员完全从技术的思维中摆脱出来，站在业务的角度思考问题。说到这里，可能有人会反驳：像Spring、Hibernate这些优秀的框架，不是都在用“I”作为接口开头，用“DAO”来命名数据访问对象吗？没错！但千万别忽略了语义的上下文，Spring、Hibernate框架都是纯技术框架，我这里所说的场景是设计业务系统。</p><h2 style=\"margin: 30px 0px 14px; padding: 0px 0px 5px; color: rgb(34, 34, 34); border-bottom-color: rgb(238, 238, 238); border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-family: &#39;microsoft yahei&#39;; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">8.成员变量不要重复类的名称</h2><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">例如，很多人喜欢在Account对象的成员变量中使用accountId，accountNumber等命名，其实没有必要，想想成员变量不会鼓孤立的存在，你引用accountId，必须是account.accountId，用account.id已经足够清晰了。</p><p style=\"margin: 0px 0px 15px; padding: 0px; color: rgb(68, 68, 68); font-family: &#39;microsoft yahei&#39;; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 25px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">“勿以善小而不为，勿以恶小而为之”、“细节决定成败”，有太多的名言告诉我们，要注重细节。一个优秀的程序员，必须要有坚实的基础，而对于命名规则这样容易掌握的基础，我们何不现行？</p><p><br/></p>', '377', '1', '0', 'Win 8.1', '轮回', '124.152.7.106', '1441598331', '1478063906', '');
INSERT INTO `td_article` VALUES ('60', '242542', '2', '20161102/d332555df14d91acd0b6944c6867fcb5.jpg', '2452', '5245', '<p>2452452</p>', '5', '1', '0', 'Win 8.1', '轮回', '0.0.0.0', '1454417258', '1478063444', '');
INSERT INTO `td_article` VALUES ('65', '我是谁', '2', '20161102/0bac4b8ee5c350b09336550c8a041877.jpg', '222', '111', '', '1', '1', '0', '', '', '', '1478068963', '1478068963', '100');

-- ----------------------------
-- Table structure for `td_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `td_article_cate`;
CREATE TABLE `td_article_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_article_cate
-- ----------------------------
INSERT INTO `td_article_cate` VALUES ('1', '学习笔记', '1', '1477140627', '1477140627', '1');
INSERT INTO `td_article_cate` VALUES ('2', '生活随笔', '2', '1477140627', '1477140627', '1');
INSERT INTO `td_article_cate` VALUES ('3', '热点分享', '3', '1477140627', '1477140627', '1');
INSERT INTO `td_article_cate` VALUES ('4', '.NET', '4', '1477140627', '1477140627', '1');
INSERT INTO `td_article_cate` VALUES ('5', 'PHP', '5', '1477140627', '1477140627', '1');
INSERT INTO `td_article_cate` VALUES ('10', '22', '22', '1477140627', '1477316141', '1');
INSERT INTO `td_article_cate` VALUES ('17', '888888', '88888', '1477314660', '1477316625', '1');

-- ----------------------------
-- Table structure for `td_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `td_auth_group`;
CREATE TABLE `td_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `rules` varchar(1000) NOT NULL DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_auth_group
-- ----------------------------
INSERT INTO `td_auth_group` VALUES ('1', '超级管理员', '1', '', '1446535750', '1446535750');
INSERT INTO `td_auth_group` VALUES ('2', '内容管理员', '1', '1,2,9,10,11,12,3,4,5,6,7,8,13,14,22,24,25,26', '1446535750', '1477322342');
INSERT INTO `td_auth_group` VALUES ('3', '系统维护员', '1', '1,2,9,10,11,12,3,4,5,6,7,8,13,14,22,24,25,26', '1446535750', '1477322335');
INSERT INTO `td_auth_group` VALUES ('4', '测试人员', '1', '', '1521863318', '1521863318');
INSERT INTO `td_auth_group` VALUES ('5', '小编', '1', '', '1521863328', '1521863328');
INSERT INTO `td_auth_group` VALUES ('6', '编辑', '1', '', '1521863379', '1521863379');
INSERT INTO `td_auth_group` VALUES ('7', '编辑1', '1', '', '1521863379', '1521863379');
INSERT INTO `td_auth_group` VALUES ('8', '小编22', '1', '', '1521863379', '1521863379');
INSERT INTO `td_auth_group` VALUES ('9', '编辑3333333', '1', '', '1521863379', '1521863379');
INSERT INTO `td_auth_group` VALUES ('10', '商品管理员', '1', '53,54,55,56,49,50,51,52,61,62,63,64', '1522917809', '1522917809');
INSERT INTO `td_auth_group` VALUES ('12', '客户管理员', '1', '47,48', '1522918880', '1522918880');

-- ----------------------------
-- Table structure for `td_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `td_auth_group_access`;
CREATE TABLE `td_auth_group_access` (
  `uid` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_auth_group_access
-- ----------------------------
INSERT INTO `td_auth_group_access` VALUES ('1', '1');
INSERT INTO `td_auth_group_access` VALUES ('1', '3');
INSERT INTO `td_auth_group_access` VALUES ('9', '5');
INSERT INTO `td_auth_group_access` VALUES ('9', '6');
INSERT INTO `td_auth_group_access` VALUES ('9', '7');
INSERT INTO `td_auth_group_access` VALUES ('9', '9');
INSERT INTO `td_auth_group_access` VALUES ('13', '3');
INSERT INTO `td_auth_group_access` VALUES ('13', '6');
INSERT INTO `td_auth_group_access` VALUES ('13', '9');
INSERT INTO `td_auth_group_access` VALUES ('14', '3');
INSERT INTO `td_auth_group_access` VALUES ('18', '2');
INSERT INTO `td_auth_group_access` VALUES ('18', '3');
INSERT INTO `td_auth_group_access` VALUES ('18', '4');
INSERT INTO `td_auth_group_access` VALUES ('19', '2');
INSERT INTO `td_auth_group_access` VALUES ('19', '4');
INSERT INTO `td_auth_group_access` VALUES ('20', '5');
INSERT INTO `td_auth_group_access` VALUES ('20', '6');
INSERT INTO `td_auth_group_access` VALUES ('20', '7');
INSERT INTO `td_auth_group_access` VALUES ('21', '2');
INSERT INTO `td_auth_group_access` VALUES ('21', '5');
INSERT INTO `td_auth_group_access` VALUES ('22', '9');
INSERT INTO `td_auth_group_access` VALUES ('23', '4');
INSERT INTO `td_auth_group_access` VALUES ('24', '4');
INSERT INTO `td_auth_group_access` VALUES ('25', '4');
INSERT INTO `td_auth_group_access` VALUES ('26', '4');
INSERT INTO `td_auth_group_access` VALUES ('27', '4');
INSERT INTO `td_auth_group_access` VALUES ('28', '2');
INSERT INTO `td_auth_group_access` VALUES ('28', '3');
INSERT INTO `td_auth_group_access` VALUES ('29', '2');
INSERT INTO `td_auth_group_access` VALUES ('29', '3');
INSERT INTO `td_auth_group_access` VALUES ('29', '4');
INSERT INTO `td_auth_group_access` VALUES ('30', '8');
INSERT INTO `td_auth_group_access` VALUES ('30', '9');

-- ----------------------------
-- Table structure for `td_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `td_auth_rule`;
CREATE TABLE `td_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '层，共三层',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态，1正常 0删除',
  `css` varchar(100) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_auth_rule
-- ----------------------------
INSERT INTO `td_auth_rule` VALUES ('1', '#', '系统管理', '1', '1', '1', 'fa fa-gear', '', '0', '1000', '1446535750', '1522050557');
INSERT INTO `td_auth_rule` VALUES ('2', 'admin/admin/index', '系统用户', '1', '2', '1', 'fa', '', '1', '0', '1446535750', '1522109912');
INSERT INTO `td_auth_rule` VALUES ('3', 'admin/role/index', '角色管理', '1', '2', '1', '', '', '1', '0', '1446535750', '0');
INSERT INTO `td_auth_rule` VALUES ('4', 'admin/menu/index', '菜单管理', '1', '2', '1', '', '', '1', '0', '1446535750', '0');
INSERT INTO `td_auth_rule` VALUES ('5', '#', '数据库管理', '1', '1', '1', 'fa fa-database', '', '0', '1010', '1446535750', '0');
INSERT INTO `td_auth_rule` VALUES ('6', 'admin/data/index', '数据库备份', '1', '2', '1', '', '', '5', '0', '1446535750', '1477639754');
INSERT INTO `td_auth_rule` VALUES ('7', 'admin/data/optimize', '优化表', '1', '3', '1', '', '', '6', '0', '0', '1477639789');
INSERT INTO `td_auth_rule` VALUES ('8', 'admin/data/repair', '修复表', '1', '3', '1', '', '', '6', '0', '0', '1477639800');
INSERT INTO `td_auth_rule` VALUES ('9', 'admin/admin/add', '用户添加', '1', '3', '1', 'fa', '', '2', '1000', '0', '1522910010');
INSERT INTO `td_auth_rule` VALUES ('10', 'admin/admin/edit', '用户编辑', '1', '3', '1', 'fa', '', '2', '1000', '0', '1522910018');
INSERT INTO `td_auth_rule` VALUES ('11', 'admin/admin/del', '用户删除', '1', '3', '1', 'fa', '', '2', '1000', '0', '1522910028');
INSERT INTO `td_auth_rule` VALUES ('12', 'admin/admin/change_state', '用户状态更改', '1', '3', '1', 'fa', '', '2', '1000', '0', '1522109973');
INSERT INTO `td_auth_rule` VALUES ('13', '#', '日志中心', '1', '1', '1', 'fa fa-tasks', '', '0', '1020', '0', '1522910057');
INSERT INTO `td_auth_rule` VALUES ('14', 'admin/log/index', '日志管理', '1', '2', '1', 'fa', '', '13', '0', '0', '1522910160');
INSERT INTO `td_auth_rule` VALUES ('39', 'admin/goods/index', '商品管理', '1', '2', '1', 'fa', '', '38', '1000', '1522198076', '1522903843');
INSERT INTO `td_auth_rule` VALUES ('38', '#', '商品中心', '1', '1', '1', 'fa fa-cubes', '', '0', '200', '1522197785', '1522903826');
INSERT INTO `td_auth_rule` VALUES ('27', 'admin/data/filelist', '数据库还原', '1', '2', '1', 'fa', '', '5', '50', '1477639870', '1522050421');
INSERT INTO `td_auth_rule` VALUES ('28', 'admin/data/revert', '还原', '1', '3', '1', '', '', '27', '50', '1477639972', '1477639972');
INSERT INTO `td_auth_rule` VALUES ('29', 'admin/data/del', '删除', '1', '3', '1', '', '', '27', '50', '1477640011', '1477640011');
INSERT INTO `td_auth_rule` VALUES ('40', 'admin/category/index', '分类管理', '1', '2', '1', 'fa', '', '38', '2000', '1522205498', '1522903852');
INSERT INTO `td_auth_rule` VALUES ('41', '#', '客户中心', '1', '1', '1', 'fa fa-user', '', '0', '1', '1522215405', '1522903625');
INSERT INTO `td_auth_rule` VALUES ('42', '#', '订单中心', '1', '1', '1', 'fa fa-calendar-plus-o', '', '0', '100', '1522215690', '1522909950');
INSERT INTO `td_auth_rule` VALUES ('43', 'admin/user/index', '客户管理', '1', '2', '1', 'fa', '', '41', '1000', '1522215745', '1522903644');
INSERT INTO `td_auth_rule` VALUES ('44', 'admin/order/index', '订单管理', '1', '2', '1', 'fa', '', '42', '1000', '1522215808', '1522903548');
INSERT INTO `td_auth_rule` VALUES ('45', 'admin/spec/index', '规格管理', '1', '2', '1', 'fa', '', '38', '3000', '1522226387', '1522226387');
INSERT INTO `td_auth_rule` VALUES ('46', 'admin/admin/setting', '参数设置', '1', '2', '1', 'fa ', '', '1', '1000', '1522739784', '1522739784');
INSERT INTO `td_auth_rule` VALUES ('47', 'admin/user/index', '客户列表', '1', '3', '1', 'fa', '', '43', '1000', '1522903667', '1522903667');
INSERT INTO `td_auth_rule` VALUES ('48', 'admin/user/change_status', '客户删除', '1', '3', '1', 'fa', '', '43', '1000', '1522903802', '1522903802');
INSERT INTO `td_auth_rule` VALUES ('49', 'admin/category/add', '分类添加', '1', '3', '1', 'fa', '', '40', '1000', '1522903986', '1522903986');
INSERT INTO `td_auth_rule` VALUES ('50', 'admin/category/edit', '分类修改', '1', '3', '1', 'fa', '', '40', '1000', '1522904025', '1522904025');
INSERT INTO `td_auth_rule` VALUES ('51', 'admin/category/del', '分类删除', '1', '3', '1', 'fa', '', '40', '1000', '1522904054', '1522904054');
INSERT INTO `td_auth_rule` VALUES ('52', 'admin/category/change_status', '分类状态修改', '1', '3', '1', 'fa', '', '40', '1000', '1522904081', '1522910390');
INSERT INTO `td_auth_rule` VALUES ('53', 'admin/goods/index', '商品列表', '1', '3', '1', 'fa', '', '39', '1000', '1522909799', '1522909799');
INSERT INTO `td_auth_rule` VALUES ('54', 'admin/goods/add', '商品添加', '1', '3', '1', 'fa', '', '39', '1000', '1522909826', '1522909826');
INSERT INTO `td_auth_rule` VALUES ('55', 'admin/goods/edit', '商品修改', '1', '3', '1', 'fa', '', '39', '1000', '1522909852', '1522909852');
INSERT INTO `td_auth_rule` VALUES ('56', 'admin/goods/change_status', '商品状态修改', '1', '3', '1', 'fa', '', '39', '1000', '1522909898', '1522909898');
INSERT INTO `td_auth_rule` VALUES ('57', 'admin/order/index', '订单列表', '1', '3', '1', 'fa', '', '44', '1000', '1522909992', '1522909992');
INSERT INTO `td_auth_rule` VALUES ('58', 'admin/log/index', '日志列表', '1', '3', '1', 'fa', '', '14', '1000', '1522910081', '1522910081');
INSERT INTO `td_auth_rule` VALUES ('59', 'admin/log/del', '日志删除', '1', '3', '1', 'fa', '', '14', '1000', '1522910184', '1522910184');
INSERT INTO `td_auth_rule` VALUES ('60', 'admin/admin/index', '用户列表', '1', '3', '1', 'fa', '', '2', '10', '1522910242', '1522910267');
INSERT INTO `td_auth_rule` VALUES ('61', 'admin/spec/index', '规格列表', '1', '3', '1', 'fa', '', '45', '1000', '1522910305', '1522910305');
INSERT INTO `td_auth_rule` VALUES ('62', 'admin/spec/add', '规格添加', '1', '3', '1', 'fa', '', '45', '1000', '1522910324', '1522910324');
INSERT INTO `td_auth_rule` VALUES ('63', 'admin/spec/edit', '规格修改', '1', '3', '1', 'fa', '', '45', '1000', '1522910348', '1522910348');
INSERT INTO `td_auth_rule` VALUES ('64', 'admin/spec/change_status', '规格状态修改', '1', '3', '1', 'fa', '', '45', '1000', '1522910371', '1522910371');
INSERT INTO `td_auth_rule` VALUES ('65', 'admin/role/index', '角色列表', '1', '3', '1', 'fa', '', '3', '1000', '1522910462', '1522910462');
INSERT INTO `td_auth_rule` VALUES ('66', 'admin/role/add', '角色添加', '1', '3', '1', 'fa', '', '3', '1000', '1522910484', '1522910484');
INSERT INTO `td_auth_rule` VALUES ('67', 'admin/role/edit', '角色编辑', '1', '3', '1', 'fa', '', '3', '1000', '1522910508', '1522910508');
INSERT INTO `td_auth_rule` VALUES ('68', 'admin/role/del', '角色删除', '1', '3', '1', 'fa', '', '3', '1000', '1522910541', '1522910541');
INSERT INTO `td_auth_rule` VALUES ('69', 'admin/role/change_status', '角色状态修改', '1', '3', '1', 'fa', '', '3', '1000', '1522910564', '1522910564');
INSERT INTO `td_auth_rule` VALUES ('70', 'admin/menu/index', '菜单列表', '1', '3', '1', 'fa', '', '4', '1000', '1522910619', '1522910619');
INSERT INTO `td_auth_rule` VALUES ('71', 'admin/menu/add', '菜单添加', '1', '3', '1', 'fa', '', '4', '1000', '1522910640', '1522910640');
INSERT INTO `td_auth_rule` VALUES ('72', 'admin/menu/edit', '菜单修改', '1', '3', '1', 'fa', '', '4', '1000', '1522910663', '1522910663');
INSERT INTO `td_auth_rule` VALUES ('73', 'admin/menu/del', '菜单删除', '1', '3', '1', 'fa', '', '4', '1000', '1522910685', '1522910685');
INSERT INTO `td_auth_rule` VALUES ('74', 'admin/menu/change_status', '菜单修改状态', '1', '3', '1', 'fa', '', '4', '1000', '1522910711', '1522910711');
INSERT INTO `td_auth_rule` VALUES ('75', 'admin/admin/setting', '参数列表', '1', '3', '1', 'fa', '', '46', '1000', '1522910778', '1522910778');
INSERT INTO `td_auth_rule` VALUES ('76', '#', '优惠券中心', '1', '1', '1', 'fa fa-newspaper-o', '', '0', '300', '1522940072', '1522940072');
INSERT INTO `td_auth_rule` VALUES ('77', 'admin/coupon/index', '优惠券管理', '1', '2', '1', 'fa', '', '76', '1000', '1522940166', '1522940201');
INSERT INTO `td_auth_rule` VALUES ('78', 'admin/coupon/index', '优惠券列表', '1', '3', '1', 'fa', '', '77', '1000', '1522940240', '1522940240');
INSERT INTO `td_auth_rule` VALUES ('79', 'admin/coupon/add', '优惠券添加', '1', '3', '1', 'fa', '', '77', '1000', '1522940268', '1522940268');
INSERT INTO `td_auth_rule` VALUES ('80', 'admin/coupon/edit', '优惠券修改', '1', '3', '1', 'fa', '', '77', '1000', '1522940294', '1522940294');
INSERT INTO `td_auth_rule` VALUES ('81', 'admin/coupon/del', '优惠券删除', '1', '3', '1', 'fa', '', '77', '1000', '1522940333', '1522940333');
INSERT INTO `td_auth_rule` VALUES ('82', 'admin/coupon/change_status', '优惠券状态修改', '1', '3', '1', 'fa', '', '77', '1000', '1522940361', '1522940361');
INSERT INTO `td_auth_rule` VALUES ('83', 'admin/menu/change_sort', '菜单排序修改', '1', '3', '1', 'fa', '', '4', '1000', '1522940403', '1522940403');

-- ----------------------------
-- Table structure for `td_config`
-- ----------------------------
DROP TABLE IF EXISTS `td_config`;
CREATE TABLE `td_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) DEFAULT NULL COMMENT '配置参数key',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数value',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of td_config
-- ----------------------------
INSERT INTO `td_config` VALUES ('7', 'config_site_name', '深邦智能小程序', '1522749391', '1522749419');
INSERT INTO `td_config` VALUES ('8', 'config_service_phone', '18612348888,18620091234', '1522749391', '1522749419');
INSERT INTO `td_config` VALUES ('9', 'config_service_qq', '123432432,43434343', '1522749391', '1522749419');
INSERT INTO `td_config` VALUES ('10', 'config_after_buy_score', '100', '1522749782', '1522834108');
INSERT INTO `td_config` VALUES ('11', 'config_freight', '25', '1522749782', '1522834108');
INSERT INTO `td_config` VALUES ('12', 'config_warnning_line', '10', '1522833444', '1522834108');
INSERT INTO `td_config` VALUES ('13', 'config_cash2score_rate', '100', '1522833914', '1522834361');
INSERT INTO `td_config` VALUES ('14', 'config_share_score', '10', '1522833914', '1522834361');
INSERT INTO `td_config` VALUES ('15', 'config_share_score_limit', '10', '1522833914', '1522834361');
INSERT INTO `td_config` VALUES ('16', 'config_share_goods_after_buy_score', '10', '1522833914', '1522834361');

-- ----------------------------
-- Table structure for `td_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `td_coupon`;
CREATE TABLE `td_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '''''' COMMENT '优惠券名称',
  `value` float(10,2) DEFAULT '0.00' COMMENT '面值',
  `money` int(11) DEFAULT '0' COMMENT '消费金额',
  `start` int(11) NOT NULL DEFAULT '0' COMMENT '有效开始时间',
  `end` int(11) NOT NULL DEFAULT '0' COMMENT '有效结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '有效状态0 无效 1有效',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_coupon
-- ----------------------------
INSERT INTO `td_coupon` VALUES ('1', '满1000减50', '500.11', '2000', '1523116800', '1525017600', '1', '0', '0');
INSERT INTO `td_coupon` VALUES ('3', '满5000减100', '100.00', '5000', '1523116800', '1527696000', '1', '1523159474', '1523159474');
INSERT INTO `td_coupon` VALUES ('4', '满10000减1000', '1000.00', '10000', '1523116800', '1530288000', '1', '1523159594', '1523159594');

-- ----------------------------
-- Table structure for `td_goods`
-- ----------------------------
DROP TABLE IF EXISTS `td_goods`;
CREATE TABLE `td_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `sn` char(20) NOT NULL DEFAULT '''''' COMMENT '商品编号',
  `title` varchar(1000) NOT NULL DEFAULT '''''' COMMENT '标题',
  `unit` varchar(10) NOT NULL DEFAULT '''''' COMMENT '单位，比方件',
  `specs` text COMMENT '规格，序列化',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商品状态0 下架删除  1上架',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `description` text COMMENT '商品描述',
  PRIMARY KEY (`id`),
  KEY `sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_goods
-- ----------------------------
INSERT INTO `td_goods` VALUES ('1', '1', 'G1804091523236683', 'OPPO R15 全面屏双摄拍照手机 6G+128G 星空紫 全网通 移动联通电信4G 双卡双待手机--无规格', '件', null, '1', '1523236812', '1523236812', '<p>OPPO R15 全面屏双摄拍照手机 6G+128G 星空紫 全网通 移动联通电信4G 双卡双待<br/>商品名称：OPPOR15<br/>商品编号：6773559<br/>商品毛重：500.00g<br/>商品产地：中国大陆<br/>系统：安卓（Android）<br/>机身厚度：薄（7mm-8.5mm）<br/>拍照特点：后置双摄像头<br/>电池容量：3000mAh-3999mAh<br/>机身颜色：紫色系<br/>热点：人脸识别，快速充电<br/>运行内存：6GB<br/>前置摄像头像素：1600万及以上<br/>游戏配置：游戏模式，VOLTE功能<br/>后置摄像头像素：2000万及以上<br/>机身内存：128GB<br/>屏幕配置：OLED屏，符合全面屏</p>');
INSERT INTO `td_goods` VALUES ('2', '4', 'G1804091523236836', 'Apple MacBook Pro 15.4英寸笔记本电脑 2017新款 - 有规格', '件', 'a:2:{i:1;a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"颜色\";s:5:\"value\";a:2:{i:2;a:4:{s:2:\"id\";i:2;s:7:\"spec_id\";i:1;s:4:\"name\";s:6:\"金色\";s:4:\"sort\";i:2;}i:3;a:4:{s:2:\"id\";i:3;s:7:\"spec_id\";i:1;s:4:\"name\";s:6:\"银色\";s:4:\"sort\";i:3;}}s:6:\"status\";i:1;}i:3;a:4:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"容量\";s:5:\"value\";a:2:{i:13;a:4:{s:2:\"id\";i:13;s:7:\"spec_id\";i:3;s:4:\"name\";s:5:\"128GB\";s:4:\"sort\";i:3;}i:14;a:4:{s:2:\"id\";i:14;s:7:\"spec_id\";i:3;s:4:\"name\";s:5:\"256GB\";s:4:\"sort\";i:4;}}s:6:\"status\";i:1;}}', '1', '1523237038', '1523237038', '<p><strong>Apple MacBook Pro 15.4英寸笔记本电脑 2017新款</strong></p><p><strong><img src=\"http://shop.dev/uploads/201804/5acac0a6975a4.jpg\"/></strong></p>');

-- ----------------------------
-- Table structure for `td_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `td_goods_category`;
CREATE TABLE `td_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序，越小越优先',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0不显示 1显示',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品类别';

-- ----------------------------
-- Records of td_goods_category
-- ----------------------------
INSERT INTO `td_goods_category` VALUES ('1', '手机数码', '1000', '1', '1522217349', '1522217349');
INSERT INTO `td_goods_category` VALUES ('2', '家用电器', '1000', '1', '1522217851', '1522217851');
INSERT INTO `td_goods_category` VALUES ('3', '运动户外', '1000', '1', '1522217864', '1522217864');
INSERT INTO `td_goods_category` VALUES ('4', '电脑办公', '1000', '1', '1522217873', '1522217873');
INSERT INTO `td_goods_category` VALUES ('5', '个护化妆', '1000', '1', '1522217888', '1522217888');
INSERT INTO `td_goods_category` VALUES ('6', '家具建材', '1000', '1', '1522217901', '1522217901');
INSERT INTO `td_goods_category` VALUES ('7', '汽车配件', '1000', '1', '1522217907', '1522217907');
INSERT INTO `td_goods_category` VALUES ('8', '家具家纺', '1000', '1', '1522217919', '1522217919');
INSERT INTO `td_goods_category` VALUES ('11', '热门商品', '1000', '0', '1522223834', '1522223834');

-- ----------------------------
-- Table structure for `td_goods_images`
-- ----------------------------
DROP TABLE IF EXISTS `td_goods_images`;
CREATE TABLE `td_goods_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `type` varchar(50) DEFAULT NULL COMMENT '类型,如''image/jpeg''',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '图片尺寸',
  `fid` varchar(50) DEFAULT NULL COMMENT 'webuploader的文件id',
  `img` varchar(100) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品轮播图';

-- ----------------------------
-- Records of td_goods_images
-- ----------------------------
INSERT INTO `td_goods_images` VALUES ('1', '1', '5aa252c9N9e4c283d.jpg', 'image/jpeg', '50414', 'WU_FILE_0', '201804/5acabf8f260bc.jpg');
INSERT INTO `td_goods_images` VALUES ('2', '1', '5aa252ceNfbd7235f.jpg', 'image/jpeg', '59605', 'WU_FILE_1', '201804/5acabf8f808c1.jpg');
INSERT INTO `td_goods_images` VALUES ('6', '2', '5a694883N7ef97f54.jpg', 'image/jpeg', '39755', 'WU_FILE_0_old', '201804/5acac0760444c.jpg');
INSERT INTO `td_goods_images` VALUES ('7', '2', '5a694884Na1e8e4f1.jpg', 'image/jpeg', '22307', 'WU_FILE_1_old', '201804/5acac076777cc.jpg');
INSERT INTO `td_goods_images` VALUES ('8', '2', '5a694961N328def85.jpg', 'image/jpeg', '35866', 'WU_FILE_2_old', '201804/5acac076cfc18.jpg');
INSERT INTO `td_goods_images` VALUES ('9', '2', '5a6aa3ccNc170ec4c.jpg', 'image/jpeg', '139741', 'WU_FILE_0', '201804/5acb02335ebb5.jpg');

-- ----------------------------
-- Table structure for `td_goods_products`
-- ----------------------------
DROP TABLE IF EXISTS `td_goods_products`;
CREATE TABLE `td_goods_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `spec_sn` varchar(20) DEFAULT NULL COMMENT '货号',
  `spec_key` varchar(255) DEFAULT NULL COMMENT '规格id链条',
  `spec_value` text COMMENT '规格序列化',
  `spec_value_string` varchar(500) DEFAULT NULL COMMENT '规格字符串',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `warning_line` int(11) DEFAULT '0' COMMENT '库存告警线',
  `style` tinyint(1) NOT NULL DEFAULT '3' COMMENT '购买方式 1积分2现金 3组合',
  `cash` float(10,2) DEFAULT '0.00' COMMENT '现金价格',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `freight` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `gift` int(11) NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `is_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架，1上架 0下架',
  PRIMARY KEY (`id`),
  KEY `GOODS_ID` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='创建或者修改存储商品规格';

-- ----------------------------
-- Records of td_goods_products
-- ----------------------------
INSERT INTO `td_goods_products` VALUES ('1', '1', 'G1804091523236683', null, null, null, '100', '10', '3', '2888.00', '288800', '0', '100', '1');
INSERT INTO `td_goods_products` VALUES ('6', '2', 'G1804091523236836_1', ';1:2;3:13;', 'a:2:{i:1;a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"颜色\";s:5:\"value\";a:2:{i:0;s:1:\"2\";i:1;s:6:\"金色\";}s:6:\"status\";i:1;}i:3;a:4:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"容量\";s:5:\"value\";a:2:{i:0;s:2:\"13\";i:1;s:5:\"128GB\";}s:6:\"status\";i:1;}}', null, '100', '10', '2', '13888.00', '1388800', '0', '100', '1');
INSERT INTO `td_goods_products` VALUES ('7', '2', 'G1804091523236836_2', ';1:2;3:14;', 'a:2:{i:1;a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"颜色\";s:5:\"value\";a:2:{i:0;s:1:\"2\";i:1;s:6:\"金色\";}s:6:\"status\";i:1;}i:3;a:4:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"容量\";s:5:\"value\";a:2:{i:0;s:2:\"14\";i:1;s:5:\"256GB\";}s:6:\"status\";i:1;}}', null, '100', '10', '2', '16888.00', '1688800', '0', '100', '1');
INSERT INTO `td_goods_products` VALUES ('8', '2', 'G1804091523236836_3', ';1:3;3:13;', 'a:2:{i:1;a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"颜色\";s:5:\"value\";a:2:{i:0;s:1:\"3\";i:1;s:6:\"银色\";}s:6:\"status\";i:1;}i:3;a:4:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"容量\";s:5:\"value\";a:2:{i:0;s:2:\"13\";i:1;s:5:\"128GB\";}s:6:\"status\";i:1;}}', null, '200', '10', '3', '12888.00', '1288800', '0', '100', '1');
INSERT INTO `td_goods_products` VALUES ('9', '2', 'G1804091523236836_4', ';1:3;3:14;', 'a:2:{i:1;a:4:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"颜色\";s:5:\"value\";a:2:{i:0;s:1:\"3\";i:1;s:6:\"银色\";}s:6:\"status\";i:1;}i:3;a:4:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"容量\";s:5:\"value\";a:2:{i:0;s:2:\"14\";i:1;s:5:\"256GB\";}s:6:\"status\";i:1;}}', null, '200', '10', '3', '15888.00', '1588800', '0', '100', '1');

-- ----------------------------
-- Table structure for `td_goods_spec`
-- ----------------------------
DROP TABLE IF EXISTS `td_goods_spec`;
CREATE TABLE `td_goods_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '规格名称(如：颜色)',
  `value` text COMMENT '规格值，序列化',
  `note` varchar(255) DEFAULT NULL COMMENT '备注（一般说明是关于什么的，如：服装）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效状态1启用 0禁用',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='规格表，与规格值goods_spec_value是一对多关系';

-- ----------------------------
-- Records of td_goods_spec
-- ----------------------------
INSERT INTO `td_goods_spec` VALUES ('1', '颜色', 'a:6:{i:0;a:2:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"白色\";}i:1;a:2:{s:2:\"id\";i:2;s:4:\"name\";s:6:\"金色\";}i:2;a:2:{s:2:\"id\";i:3;s:4:\"name\";s:6:\"银色\";}i:3;a:2:{s:2:\"id\";i:4;s:4:\"name\";s:6:\"黑色\";}i:4;a:2:{s:2:\"id\";i:5;s:4:\"name\";s:9:\"天空蓝\";}i:5;a:2:{s:2:\"id\";i:6;s:4:\"name\";s:9:\"中国红\";}}', '手机', '1', '1522507672', '1522507672');
INSERT INTO `td_goods_spec` VALUES ('2', '内存', 'a:4:{i:0;a:2:{s:2:\"id\";i:7;s:4:\"name\";s:2:\"4G\";}i:1;a:2:{s:2:\"id\";i:8;s:4:\"name\";s:2:\"6G\";}i:2;a:2:{s:2:\"id\";i:9;s:4:\"name\";s:2:\"8G\";}i:3;a:2:{s:2:\"id\";i:10;s:4:\"name\";s:3:\"12G\";}}', '手机', '1', '1522507746', '1522507746');
INSERT INTO `td_goods_spec` VALUES ('3', '容量', 'a:4:{i:0;a:2:{s:2:\"id\";i:11;s:4:\"name\";s:4:\"32GB\";}i:1;a:2:{s:2:\"id\";i:12;s:4:\"name\";s:4:\"64GB\";}i:2;a:2:{s:2:\"id\";i:13;s:4:\"name\";s:5:\"128GB\";}i:3;a:2:{s:2:\"id\";i:14;s:4:\"name\";s:5:\"256GB\";}}', '手机', '1', '1522507757', '1522507757');
INSERT INTO `td_goods_spec` VALUES ('4', '颜色', 'a:5:{i:0;a:2:{s:2:\"id\";i:15;s:4:\"name\";s:6:\"红色\";}i:1;a:2:{s:2:\"id\";i:16;s:4:\"name\";s:6:\"灰色\";}i:2;a:2:{s:2:\"id\";i:17;s:4:\"name\";s:6:\"黑色\";}i:3;a:2:{s:2:\"id\";i:18;s:4:\"name\";s:6:\"白色\";}i:4;a:2:{s:2:\"id\";i:19;s:4:\"name\";s:9:\"藏青色\";}}', '服装', '1', '1522507766', '1522507766');
INSERT INTO `td_goods_spec` VALUES ('5', '尺寸', 'a:6:{i:0;a:2:{s:2:\"id\";i:20;s:4:\"name\";s:5:\"165/M\";}i:1;a:2:{s:2:\"id\";i:21;s:4:\"name\";s:5:\"170/L\";}i:2;a:2:{s:2:\"id\";i:22;s:4:\"name\";s:6:\"175/XL\";}i:3;a:2:{s:2:\"id\";i:23;s:4:\"name\";s:7:\"180/XXL\";}i:4;a:2:{s:2:\"id\";i:24;s:4:\"name\";s:8:\"185/XXXL\";}i:5;a:2:{s:2:\"id\";i:25;s:4:\"name\";s:9:\"190/XXXXL\";}}', '服装', '1', '1522507775', '1522507775');
INSERT INTO `td_goods_spec` VALUES ('6', '性能', 'a:5:{i:0;a:2:{s:2:\"id\";i:26;s:4:\"name\";s:15:\"静音舒适型\";}i:1;a:2:{s:2:\"id\";i:27;s:4:\"name\";s:15:\"经济耐用型\";}i:2;a:2:{s:2:\"id\";i:28;s:4:\"name\";s:15:\"运动操控型\";}i:3;a:2:{s:2:\"id\";i:29;s:4:\"name\";s:13:\"SUV&越野型\";}i:4;a:2:{s:2:\"id\";i:30;s:4:\"name\";s:9:\"雪地胎\";}}', '轮胎', '1', '1522507784', '1522507784');
INSERT INTO `td_goods_spec` VALUES ('8', '花纹', 'a:6:{i:0;a:2:{s:2:\"id\";i:38;s:4:\"name\";s:4:\"SH19\";}i:1;a:2:{s:2:\"id\";i:39;s:4:\"name\";s:4:\"SR18\";}i:2;a:2:{s:2:\"id\";i:40;s:4:\"name\";s:4:\"SH16\";}i:3;a:2:{s:2:\"id\";i:41;s:4:\"name\";s:4:\"SU18\";}i:4;a:2:{s:2:\"id\";i:42;s:4:\"name\";s:4:\"SH15\";}i:5;a:2:{s:2:\"id\";i:43;s:4:\"name\";s:4:\"SV16\";}}', '轮胎', '1', '1522507802', '1522507802');
INSERT INTO `td_goods_spec` VALUES ('9', '尺码', 'a:6:{i:0;a:2:{s:2:\"id\";i:44;s:4:\"name\";s:9:\"275/45R20\";}i:1;a:2:{s:2:\"id\";i:45;s:4:\"name\";s:9:\"225/40R18\";}i:2;a:2:{s:2:\"id\";i:46;s:4:\"name\";s:9:\"265/70R17\";}i:3;a:2:{s:2:\"id\";i:47;s:4:\"name\";s:9:\"225/55R16\";}i:4;a:2:{s:2:\"id\";i:48;s:4:\"name\";s:9:\"215/70R16\";}i:5;a:2:{s:2:\"id\";i:49;s:4:\"name\";s:9:\"215/65R16\";}}', '轮胎', '1', '1522507811', '1522507811');

-- ----------------------------
-- Table structure for `td_goods_spec_value`
-- ----------------------------
DROP TABLE IF EXISTS `td_goods_spec_value`;
CREATE TABLE `td_goods_spec_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_id` int(11) NOT NULL COMMENT '商品规格id',
  `name` varchar(50) NOT NULL COMMENT '商品规格值',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序，越小越优先',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_NAME` (`spec_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='规格值表';

-- ----------------------------
-- Records of td_goods_spec_value
-- ----------------------------
INSERT INTO `td_goods_spec_value` VALUES ('1', '1', '白色', '1');
INSERT INTO `td_goods_spec_value` VALUES ('2', '1', '金色', '2');
INSERT INTO `td_goods_spec_value` VALUES ('3', '1', '银色', '3');
INSERT INTO `td_goods_spec_value` VALUES ('4', '1', '黑色', '4');
INSERT INTO `td_goods_spec_value` VALUES ('5', '1', '天空蓝', '5');
INSERT INTO `td_goods_spec_value` VALUES ('6', '1', '中国红', '6');
INSERT INTO `td_goods_spec_value` VALUES ('7', '2', '4G', '1');
INSERT INTO `td_goods_spec_value` VALUES ('8', '2', '6G', '2');
INSERT INTO `td_goods_spec_value` VALUES ('9', '2', '8G', '3');
INSERT INTO `td_goods_spec_value` VALUES ('10', '2', '12G', '4');
INSERT INTO `td_goods_spec_value` VALUES ('11', '3', '32GB', '1');
INSERT INTO `td_goods_spec_value` VALUES ('12', '3', '64GB', '2');
INSERT INTO `td_goods_spec_value` VALUES ('13', '3', '128GB', '3');
INSERT INTO `td_goods_spec_value` VALUES ('14', '3', '256GB', '4');
INSERT INTO `td_goods_spec_value` VALUES ('15', '4', '红色', '1');
INSERT INTO `td_goods_spec_value` VALUES ('16', '4', '灰色', '2');
INSERT INTO `td_goods_spec_value` VALUES ('17', '4', '黑色', '3');
INSERT INTO `td_goods_spec_value` VALUES ('18', '4', '白色', '4');
INSERT INTO `td_goods_spec_value` VALUES ('19', '4', '藏青色', '5');
INSERT INTO `td_goods_spec_value` VALUES ('20', '5', '165/M', '1');
INSERT INTO `td_goods_spec_value` VALUES ('21', '5', '170/L', '2');
INSERT INTO `td_goods_spec_value` VALUES ('22', '5', '175/XL', '3');
INSERT INTO `td_goods_spec_value` VALUES ('23', '5', '180/XXL', '4');
INSERT INTO `td_goods_spec_value` VALUES ('24', '5', '185/XXXL', '5');
INSERT INTO `td_goods_spec_value` VALUES ('25', '5', '190/XXXXL', '6');
INSERT INTO `td_goods_spec_value` VALUES ('26', '6', '静音舒适型', '1');
INSERT INTO `td_goods_spec_value` VALUES ('27', '6', '经济耐用型', '2');
INSERT INTO `td_goods_spec_value` VALUES ('28', '6', '运动操控型', '3');
INSERT INTO `td_goods_spec_value` VALUES ('29', '6', 'SUV&越野型', '4');
INSERT INTO `td_goods_spec_value` VALUES ('30', '6', '雪地胎', '5');
INSERT INTO `td_goods_spec_value` VALUES ('38', '8', 'SH19', '1');
INSERT INTO `td_goods_spec_value` VALUES ('39', '8', 'SR18', '2');
INSERT INTO `td_goods_spec_value` VALUES ('40', '8', 'SH16', '3');
INSERT INTO `td_goods_spec_value` VALUES ('41', '8', 'SU18', '4');
INSERT INTO `td_goods_spec_value` VALUES ('42', '8', 'SH15', '5');
INSERT INTO `td_goods_spec_value` VALUES ('43', '8', 'SV16', '6');
INSERT INTO `td_goods_spec_value` VALUES ('44', '9', '275/45R20', '1');
INSERT INTO `td_goods_spec_value` VALUES ('45', '9', '225/40R18', '2');
INSERT INTO `td_goods_spec_value` VALUES ('46', '9', '265/70R17', '3');
INSERT INTO `td_goods_spec_value` VALUES ('47', '9', '225/55R16', '4');
INSERT INTO `td_goods_spec_value` VALUES ('48', '9', '215/70R16', '5');
INSERT INTO `td_goods_spec_value` VALUES ('49', '9', '215/65R16', '6');

-- ----------------------------
-- Table structure for `td_log`
-- ----------------------------
DROP TABLE IF EXISTS `td_log`;
CREATE TABLE `td_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` text COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0删除 1正常',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=543 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of td_log
-- ----------------------------
INSERT INTO `td_log` VALUES ('146', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477067453', '1');
INSERT INTO `td_log` VALUES ('147', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477067743', '1');
INSERT INTO `td_log` VALUES ('148', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477067880', '0');
INSERT INTO `td_log` VALUES ('149', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068084', '1');
INSERT INTO `td_log` VALUES ('150', '1', 'admin', '用户【admin】登录失败：验证码错误', '0.0.0.0', '2', '1477068155', '1');
INSERT INTO `td_log` VALUES ('151', '1', 'admin', '用户【admin】登录失败：密码错误', '0.0.0.0', '2', '1477068161', '1');
INSERT INTO `td_log` VALUES ('152', '1', 'admin', '用户【admin】登录失败：验证码错误', '0.0.0.0', '2', '1477068166', '1');
INSERT INTO `td_log` VALUES ('153', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068172', '1');
INSERT INTO `td_log` VALUES ('154', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068497', '1');
INSERT INTO `td_log` VALUES ('155', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068668', '1');
INSERT INTO `td_log` VALUES ('156', '0', 'tjl', '用户【tjl】登录失败：密码错误', '0.0.0.0', '2', '1477068701', '1');
INSERT INTO `td_log` VALUES ('157', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068713', '1');
INSERT INTO `td_log` VALUES ('158', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068785', '1');
INSERT INTO `td_log` VALUES ('159', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068837', '1');
INSERT INTO `td_log` VALUES ('160', '9', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068859', '1');
INSERT INTO `td_log` VALUES ('161', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068896', '1');
INSERT INTO `td_log` VALUES ('162', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477068930', '1');
INSERT INTO `td_log` VALUES ('163', '1', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068945', '1');
INSERT INTO `td_log` VALUES ('164', '1', 'tjl', '用户【tjl】登录成功', '0.0.0.0', '1', '1477068967', '1');
INSERT INTO `td_log` VALUES ('165', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477069125', '1');
INSERT INTO `td_log` VALUES ('166', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1477069183', '1');
INSERT INTO `td_log` VALUES ('167', '1', 'admin', '用户【admin】登录失败：密码错误', '0.0.0.0', '2', '1477069400', '1');
INSERT INTO `td_log` VALUES ('278', '1', 'admin', '用户【admin】登录成功', '60.171.83.90', '1', '1477962056', '1');
INSERT INTO `td_log` VALUES ('279', '1', 'admin', '用户【admin】登录成功', '60.171.83.90', '1', '1477985005', '1');
INSERT INTO `td_log` VALUES ('280', '1', 'admin', '用户【admin】删除菜单成功', '60.171.83.90', '1', '1477985217', '1');
INSERT INTO `td_log` VALUES ('281', '1', 'admin', '用户【admin】登录成功', '60.171.83.90', '1', '1478054364', '1');
INSERT INTO `td_log` VALUES ('282', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521623209', '1');
INSERT INTO `td_log` VALUES ('283', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521624776', '1');
INSERT INTO `td_log` VALUES ('284', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521624819', '1');
INSERT INTO `td_log` VALUES ('285', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521698280', '1');
INSERT INTO `td_log` VALUES ('286', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521698873', '1');
INSERT INTO `td_log` VALUES ('287', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521698978', '1');
INSERT INTO `td_log` VALUES ('288', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521702412', '1');
INSERT INTO `td_log` VALUES ('289', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521721866', '1');
INSERT INTO `td_log` VALUES ('290', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521726671', '1');
INSERT INTO `td_log` VALUES ('291', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521729255', '0');
INSERT INTO `td_log` VALUES ('292', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521729577', '1');
INSERT INTO `td_log` VALUES ('293', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521765252', '1');
INSERT INTO `td_log` VALUES ('294', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521768141', '1');
INSERT INTO `td_log` VALUES ('295', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521768155', '0');
INSERT INTO `td_log` VALUES ('296', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521768349', '1');
INSERT INTO `td_log` VALUES ('297', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521772225', '0');
INSERT INTO `td_log` VALUES ('298', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521772305', '0');
INSERT INTO `td_log` VALUES ('299', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521784871', '0');
INSERT INTO `td_log` VALUES ('300', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521784939', '0');
INSERT INTO `td_log` VALUES ('301', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521784950', '0');
INSERT INTO `td_log` VALUES ('302', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521785041', '1');
INSERT INTO `td_log` VALUES ('303', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521785121', '0');
INSERT INTO `td_log` VALUES ('304', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521785273', '1');
INSERT INTO `td_log` VALUES ('305', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521811409', '1');
INSERT INTO `td_log` VALUES ('306', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521811530', '1');
INSERT INTO `td_log` VALUES ('307', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521813525', '1');
INSERT INTO `td_log` VALUES ('308', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521814670', '1');
INSERT INTO `td_log` VALUES ('309', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521814796', '1');
INSERT INTO `td_log` VALUES ('310', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521851457', '1');
INSERT INTO `td_log` VALUES ('311', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521851697', '1');
INSERT INTO `td_log` VALUES ('312', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521851879', '1');
INSERT INTO `td_log` VALUES ('313', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521854136', '1');
INSERT INTO `td_log` VALUES ('314', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521857077', '1');
INSERT INTO `td_log` VALUES ('315', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521947601', '1');
INSERT INTO `td_log` VALUES ('316', '1', '', '添加菜单成功', '127.0.0.1', '1', '1521951022', '1');
INSERT INTO `td_log` VALUES ('317', '1', '', '添加菜单成功', '127.0.0.1', '1', '1521951086', '1');
INSERT INTO `td_log` VALUES ('318', '1', '', '添加菜单成功', '127.0.0.1', '1', '1521951128', '1');
INSERT INTO `td_log` VALUES ('319', '1', '', '添加菜单成功', '127.0.0.1', '1', '1521951150', '1');
INSERT INTO `td_log` VALUES ('320', '1', '', '添加菜单成功', '127.0.0.1', '1', '1521951510', '0');
INSERT INTO `td_log` VALUES ('321', '1', 'admin', '添加菜单成功', '127.0.0.1', '1', '1521952525', '1');
INSERT INTO `td_log` VALUES ('322', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521955809', '1');
INSERT INTO `td_log` VALUES ('323', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521964265', '1');
INSERT INTO `td_log` VALUES ('324', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967134', '0');
INSERT INTO `td_log` VALUES ('325', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967160', '0');
INSERT INTO `td_log` VALUES ('326', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967192', '0');
INSERT INTO `td_log` VALUES ('327', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967203', '0');
INSERT INTO `td_log` VALUES ('328', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967208', '0');
INSERT INTO `td_log` VALUES ('329', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967303', '0');
INSERT INTO `td_log` VALUES ('330', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967305', '0');
INSERT INTO `td_log` VALUES ('331', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967307', '0');
INSERT INTO `td_log` VALUES ('332', '1', 'admin', '获取单个菜单失败', '127.0.0.1', '2', '1521967326', '0');
INSERT INTO `td_log` VALUES ('333', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1521967772', '0');
INSERT INTO `td_log` VALUES ('334', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1521967889', '0');
INSERT INTO `td_log` VALUES ('335', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521967919', '0');
INSERT INTO `td_log` VALUES ('336', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521979761', '0');
INSERT INTO `td_log` VALUES ('337', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1521980463', '0');
INSERT INTO `td_log` VALUES ('338', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1521980479', '0');
INSERT INTO `td_log` VALUES ('339', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522023342', '1');
INSERT INTO `td_log` VALUES ('340', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522023672', '1');
INSERT INTO `td_log` VALUES ('341', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522050346', '0');
INSERT INTO `td_log` VALUES ('342', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522050361', '0');
INSERT INTO `td_log` VALUES ('343', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522050421', '1');
INSERT INTO `td_log` VALUES ('344', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522050557', '1');
INSERT INTO `td_log` VALUES ('345', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522050599', '0');
INSERT INTO `td_log` VALUES ('346', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522064365', '0');
INSERT INTO `td_log` VALUES ('347', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522064585', '0');
INSERT INTO `td_log` VALUES ('348', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522070724', '0');
INSERT INTO `td_log` VALUES ('349', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522070734', '0');
INSERT INTO `td_log` VALUES ('350', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522070756', '0');
INSERT INTO `td_log` VALUES ('351', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522070859', '0');
INSERT INTO `td_log` VALUES ('352', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522070868', '0');
INSERT INTO `td_log` VALUES ('353', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522080221', '1');
INSERT INTO `td_log` VALUES ('354', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522080237', '1');
INSERT INTO `td_log` VALUES ('355', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522109488', '1');
INSERT INTO `td_log` VALUES ('356', '1', 'admin', '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522109494', '1');
INSERT INTO `td_log` VALUES ('357', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522109501', '1');
INSERT INTO `td_log` VALUES ('358', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522109533', '1');
INSERT INTO `td_log` VALUES ('359', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522109789', '1');
INSERT INTO `td_log` VALUES ('360', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522109801', '1');
INSERT INTO `td_log` VALUES ('361', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522109912', '1');
INSERT INTO `td_log` VALUES ('362', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522109929', '1');
INSERT INTO `td_log` VALUES ('363', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522109942', '1');
INSERT INTO `td_log` VALUES ('364', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522109957', '1');
INSERT INTO `td_log` VALUES ('365', '1', 'admin', '编辑菜单成功', '127.0.0.1', '1', '1522109973', '1');
INSERT INTO `td_log` VALUES ('366', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522109996', '1');
INSERT INTO `td_log` VALUES ('367', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522115241', '1');
INSERT INTO `td_log` VALUES ('368', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522118377', '1');
INSERT INTO `td_log` VALUES ('369', '18', 'shichang', '用户【shichang】登录成功', '127.0.0.1', '1', '1522122615', '1');
INSERT INTO `td_log` VALUES ('370', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1522122651', '1');
INSERT INTO `td_log` VALUES ('371', '1', null, '重置系统用户admin密码成功', '127.0.0.1', '1', '1522143356', '1');
INSERT INTO `td_log` VALUES ('372', null, null, '用户【admin】登录失败：密码错误', '127.0.0.1', '2', '1522143394', '1');
INSERT INTO `td_log` VALUES ('373', '1', null, '登录成功', '127.0.0.1', '1', '1522143422', '1');
INSERT INTO `td_log` VALUES ('374', '1', null, '重置系统用户admin密码成功', '127.0.0.1', '1', '1522143503', '1');
INSERT INTO `td_log` VALUES ('375', '1', null, '登录成功', '127.0.0.1', '1', '1522143537', '1');
INSERT INTO `td_log` VALUES ('376', '1', null, '重置系统用户bfg密码成功', '127.0.0.1', '1', '1522151551', '1');
INSERT INTO `td_log` VALUES ('377', '1', null, '启用用户田建龙33成功', '127.0.0.1', '1', '1522153014', '1');
INSERT INTO `td_log` VALUES ('378', '1', null, '禁用用户田建龙33成功', '127.0.0.1', '1', '1522153018', '1');
INSERT INTO `td_log` VALUES ('379', '1', null, '禁用用户bfg成功', '127.0.0.1', '1', '1522153022', '1');
INSERT INTO `td_log` VALUES ('380', '1', null, '禁用用户dddd成功', '127.0.0.1', '1', '1522153026', '1');
INSERT INTO `td_log` VALUES ('381', '1', null, '禁用用户市场1成功', '127.0.0.1', '1', '1522153035', '1');
INSERT INTO `td_log` VALUES ('382', '1', null, '启用用户田建龙33成功', '127.0.0.1', '1', '1522153038', '1');
INSERT INTO `td_log` VALUES ('383', '1', null, '启用用户bfg成功', '127.0.0.1', '1', '1522153043', '1');
INSERT INTO `td_log` VALUES ('384', '1', null, '启用用户dddd成功', '127.0.0.1', '1', '1522153045', '1');
INSERT INTO `td_log` VALUES ('385', '1', null, '禁用用户田建龙33成功', '127.0.0.1', '1', '1522153053', '1');
INSERT INTO `td_log` VALUES ('386', '1', null, '禁用用户bfg成功', '127.0.0.1', '1', '1522153056', '1');
INSERT INTO `td_log` VALUES ('387', '1', null, '启用用户bfg成功', '127.0.0.1', '1', '1522153059', '1');
INSERT INTO `td_log` VALUES ('388', '1', null, '重置系统用户田建龙33密码成功', '127.0.0.1', '1', '1522153064', '0');
INSERT INTO `td_log` VALUES ('389', '1', null, '登录成功', '127.0.0.1', '1', '1522162652', '1');
INSERT INTO `td_log` VALUES ('390', '1', null, '登录成功', '127.0.0.1', '1', '1522197237', '1');
INSERT INTO `td_log` VALUES ('391', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522197785', '1');
INSERT INTO `td_log` VALUES ('392', '1', null, '登录成功', '127.0.0.1', '1', '1522197929', '1');
INSERT INTO `td_log` VALUES ('393', '1', null, '登录成功', '127.0.0.1', '1', '1522198007', '1');
INSERT INTO `td_log` VALUES ('394', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522198076', '1');
INSERT INTO `td_log` VALUES ('395', '1', null, '登录成功', '127.0.0.1', '1', '1522198100', '1');
INSERT INTO `td_log` VALUES ('396', '1', null, '登录成功', '127.0.0.1', '1', '1522200603', '1');
INSERT INTO `td_log` VALUES ('397', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522205498', '1');
INSERT INTO `td_log` VALUES ('398', '1', null, '登录成功', '127.0.0.1', '1', '1522205511', '1');
INSERT INTO `td_log` VALUES ('399', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522206029', '1');
INSERT INTO `td_log` VALUES ('400', '1', null, '登录成功', '127.0.0.1', '1', '1522206044', '1');
INSERT INTO `td_log` VALUES ('401', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522208880', '1');
INSERT INTO `td_log` VALUES ('402', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522209025', '1');
INSERT INTO `td_log` VALUES ('403', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522209030', '1');
INSERT INTO `td_log` VALUES ('404', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522209036', '1');
INSERT INTO `td_log` VALUES ('405', '1', null, '登录成功', '127.0.0.1', '1', '1522209050', '1');
INSERT INTO `td_log` VALUES ('406', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522215405', '1');
INSERT INTO `td_log` VALUES ('407', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522215690', '1');
INSERT INTO `td_log` VALUES ('408', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522215718', '1');
INSERT INTO `td_log` VALUES ('409', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522215745', '1');
INSERT INTO `td_log` VALUES ('410', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522215771', '1');
INSERT INTO `td_log` VALUES ('411', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522215808', '1');
INSERT INTO `td_log` VALUES ('412', '1', null, '登录成功', '127.0.0.1', '1', '1522215827', '1');
INSERT INTO `td_log` VALUES ('413', '1', null, '禁用商品分类手机数码成功', '127.0.0.1', '1', '1522223749', '1');
INSERT INTO `td_log` VALUES ('414', '1', null, '禁用商品分类家用电器成功', '127.0.0.1', '1', '1522223755', '1');
INSERT INTO `td_log` VALUES ('415', '1', null, '禁用商品分类运动户外成功', '127.0.0.1', '1', '1522223805', '1');
INSERT INTO `td_log` VALUES ('416', '1', null, '启用商品分类家用电器成功', '127.0.0.1', '1', '1522223809', '1');
INSERT INTO `td_log` VALUES ('417', '1', null, '启用商品分类手机数码成功', '127.0.0.1', '1', '1522223812', '1');
INSERT INTO `td_log` VALUES ('418', '1', null, '启用商品分类运动户外成功', '127.0.0.1', '1', '1522223816', '1');
INSERT INTO `td_log` VALUES ('419', '1', null, '禁用商品分类热门商品成功', '127.0.0.1', '1', '1522223840', '1');
INSERT INTO `td_log` VALUES ('420', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522224048', '1');
INSERT INTO `td_log` VALUES ('421', '1', null, '登录成功', '127.0.0.1', '1', '1522224065', '1');
INSERT INTO `td_log` VALUES ('422', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522226387', '1');
INSERT INTO `td_log` VALUES ('423', '1', null, '登录成功', '127.0.0.1', '1', '1522226402', '1');
INSERT INTO `td_log` VALUES ('424', '1', null, '根据条件获取商品分类的列表和总数异常', '127.0.0.1', '2', '1522228615', '1');
INSERT INTO `td_log` VALUES ('425', '1', null, '登录成功', '127.0.0.1', '1', '1522240829', '1');
INSERT INTO `td_log` VALUES ('426', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522241639', '1');
INSERT INTO `td_log` VALUES ('427', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522241648', '1');
INSERT INTO `td_log` VALUES ('428', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522241767', '1');
INSERT INTO `td_log` VALUES ('429', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522241795', '1');
INSERT INTO `td_log` VALUES ('430', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522241951', '1');
INSERT INTO `td_log` VALUES ('431', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522241986', '1');
INSERT INTO `td_log` VALUES ('432', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522241987', '1');
INSERT INTO `td_log` VALUES ('433', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522242009', '1');
INSERT INTO `td_log` VALUES ('434', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522242022', '1');
INSERT INTO `td_log` VALUES ('435', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522242050', '1');
INSERT INTO `td_log` VALUES ('436', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522242051', '1');
INSERT INTO `td_log` VALUES ('437', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522242104', '1');
INSERT INTO `td_log` VALUES ('438', '1', null, '根据条件获取系统用户getDataByWhere', '127.0.0.1', '2', '1522242143', '1');
INSERT INTO `td_log` VALUES ('439', '1', null, '根据条件获取商品分类的列表和总数', '127.0.0.1', '2', '1522248406', '1');
INSERT INTO `td_log` VALUES ('440', '1', null, '根据条件获取商品分类的列表和总数', '127.0.0.1', '2', '1522248453', '1');
INSERT INTO `td_log` VALUES ('441', '1', null, '根据id获取商品某个商品规格', '127.0.0.1', '2', '1522250649', '1');
INSERT INTO `td_log` VALUES ('442', '1', null, '根据id获取商品某个商品规格', '127.0.0.1', '2', '1522250653', '1');
INSERT INTO `td_log` VALUES ('443', '1', null, '根据id获取商品某个商品规格', '127.0.0.1', '2', '1522250657', '1');
INSERT INTO `td_log` VALUES ('444', '1', null, '根据id获取商品某个商品规格', '127.0.0.1', '2', '1522250661', '1');
INSERT INTO `td_log` VALUES ('445', '1', null, 'unserialize(): Error at offset 0 of 37 bytes', '127.0.0.1', '2', '1522250946', '1');
INSERT INTO `td_log` VALUES ('446', '1', null, 'unserialize(): Error at offset 0 of 37 bytes', '127.0.0.1', '2', '1522250954', '1');
INSERT INTO `td_log` VALUES ('447', '1', null, 'unserialize(): Error at offset 0 of 37 bytes', '127.0.0.1', '2', '1522250955', '1');
INSERT INTO `td_log` VALUES ('448', '1', null, '登录成功', '127.0.0.1', '1', '1522283272', '1');
INSERT INTO `td_log` VALUES ('449', '1', null, '登录成功', '127.0.0.1', '1', '1522331620', '1');
INSERT INTO `td_log` VALUES ('450', '1', null, '登录成功', '127.0.0.1', '1', '1522337270', '1');
INSERT INTO `td_log` VALUES ('451', '1', null, '登录成功', '127.0.0.1', '1', '1522369752', '1');
INSERT INTO `td_log` VALUES ('452', '1', null, '登录成功', '127.0.0.1', '1', '1522410369', '1');
INSERT INTO `td_log` VALUES ('453', '1', null, '登录成功', '127.0.0.1', '1', '1522459367', '1');
INSERT INTO `td_log` VALUES ('454', '1', null, '登录成功', '127.0.0.1', '1', '1522499763', '1');
INSERT INTO `td_log` VALUES ('455', '1', null, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-黑色\' for key \'ID_NAME\'', '127.0.0.1', '2', '1522501799', '1');
INSERT INTO `td_log` VALUES ('456', '1', null, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-黑色\' for key \'ID_NAME\'', '127.0.0.1', '2', '1522501827', '1');
INSERT INTO `td_log` VALUES ('457', '1', null, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-黑色\' for key \'ID_NAME\'', '127.0.0.1', '2', '1522501831', '1');
INSERT INTO `td_log` VALUES ('458', '1', null, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-黑色\' for key \'ID_NAME\'', '127.0.0.1', '2', '1522501893', '1');
INSERT INTO `td_log` VALUES ('459', '1', null, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'7-SU18\' for key \'ID_NAME\'', '127.0.0.1', '2', '1522502202', '1');
INSERT INTO `td_log` VALUES ('460', '1', null, 'SQLSTATE[HY000]: General error: 1364 Field \'value\' doesn\'t have a default value', '127.0.0.1', '2', '1522506812', '1');
INSERT INTO `td_log` VALUES ('461', '1', null, 'SQLSTATE[HY000]: General error: 1364 Field \'value\' doesn\'t have a default value', '127.0.0.1', '2', '1522506818', '1');
INSERT INTO `td_log` VALUES ('462', '1', null, 'Array to string conversion', '127.0.0.1', '2', '1522506855', '1');
INSERT INTO `td_log` VALUES ('463', '1', null, 'SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'7-SU18\' for key \'ID_NAME\'', '127.0.0.1', '2', '1522507793', '1');
INSERT INTO `td_log` VALUES ('464', '1', null, '登录成功', '127.0.0.1', '1', '1522550338', '1');
INSERT INTO `td_log` VALUES ('465', '1', null, '登录成功', '127.0.0.1', '1', '1522581992', '1');
INSERT INTO `td_log` VALUES ('466', '1', null, '登录成功', '127.0.0.1', '1', '1522714737', '1');
INSERT INTO `td_log` VALUES ('467', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522739784', '1');
INSERT INTO `td_log` VALUES ('468', '1', null, '登录成功', '127.0.0.1', '1', '1522739802', '1');
INSERT INTO `td_log` VALUES ('469', '1', null, '登录成功', '127.0.0.1', '1', '1522759658', '1');
INSERT INTO `td_log` VALUES ('470', '1', null, '登录成功', '127.0.0.1', '1', '1522764494', '1');
INSERT INTO `td_log` VALUES ('471', '1', null, '登录成功', '127.0.0.1', '1', '1522801792', '1');
INSERT INTO `td_log` VALUES ('472', '1', null, '登录成功', '127.0.0.1', '1', '1522853790', '1');
INSERT INTO `td_log` VALUES ('473', '1', null, '登录成功', '127.0.0.1', '1', '1522902439', '1');
INSERT INTO `td_log` VALUES ('474', '1', null, '登录成功', '127.0.0.1', '1', '1522903110', '1');
INSERT INTO `td_log` VALUES ('475', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903525', '1');
INSERT INTO `td_log` VALUES ('476', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903548', '1');
INSERT INTO `td_log` VALUES ('477', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903625', '1');
INSERT INTO `td_log` VALUES ('478', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903645', '1');
INSERT INTO `td_log` VALUES ('479', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522903667', '1');
INSERT INTO `td_log` VALUES ('480', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522903802', '1');
INSERT INTO `td_log` VALUES ('481', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903826', '1');
INSERT INTO `td_log` VALUES ('482', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903842', '1');
INSERT INTO `td_log` VALUES ('483', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903843', '1');
INSERT INTO `td_log` VALUES ('484', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522903852', '1');
INSERT INTO `td_log` VALUES ('485', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522903986', '1');
INSERT INTO `td_log` VALUES ('486', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522904025', '1');
INSERT INTO `td_log` VALUES ('487', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522904054', '1');
INSERT INTO `td_log` VALUES ('488', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522904081', '1');
INSERT INTO `td_log` VALUES ('489', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522909799', '1');
INSERT INTO `td_log` VALUES ('490', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522909826', '1');
INSERT INTO `td_log` VALUES ('491', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522909852', '1');
INSERT INTO `td_log` VALUES ('492', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522909898', '1');
INSERT INTO `td_log` VALUES ('493', '1', null, '登录成功', '127.0.0.1', '1', '1522909930', '1');
INSERT INTO `td_log` VALUES ('494', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522909950', '1');
INSERT INTO `td_log` VALUES ('495', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522909992', '1');
INSERT INTO `td_log` VALUES ('496', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522910010', '1');
INSERT INTO `td_log` VALUES ('497', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522910019', '1');
INSERT INTO `td_log` VALUES ('498', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522910028', '1');
INSERT INTO `td_log` VALUES ('499', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522910058', '0');
INSERT INTO `td_log` VALUES ('500', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910081', '0');
INSERT INTO `td_log` VALUES ('501', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522910160', '1');
INSERT INTO `td_log` VALUES ('502', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910184', '1');
INSERT INTO `td_log` VALUES ('503', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910242', '1');
INSERT INTO `td_log` VALUES ('504', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522910267', '1');
INSERT INTO `td_log` VALUES ('505', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910305', '1');
INSERT INTO `td_log` VALUES ('506', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910324', '1');
INSERT INTO `td_log` VALUES ('507', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910348', '1');
INSERT INTO `td_log` VALUES ('508', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910371', '1');
INSERT INTO `td_log` VALUES ('509', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522910391', '1');
INSERT INTO `td_log` VALUES ('510', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910462', '1');
INSERT INTO `td_log` VALUES ('511', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910485', '1');
INSERT INTO `td_log` VALUES ('512', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910509', '1');
INSERT INTO `td_log` VALUES ('513', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910542', '1');
INSERT INTO `td_log` VALUES ('514', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910565', '1');
INSERT INTO `td_log` VALUES ('515', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910619', '1');
INSERT INTO `td_log` VALUES ('516', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910640', '1');
INSERT INTO `td_log` VALUES ('517', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910663', '1');
INSERT INTO `td_log` VALUES ('518', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910685', '1');
INSERT INTO `td_log` VALUES ('519', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910712', '1');
INSERT INTO `td_log` VALUES ('520', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522910778', '1');
INSERT INTO `td_log` VALUES ('521', '1', null, '登录成功', '127.0.0.1', '1', '1522920505', '1');
INSERT INTO `td_log` VALUES ('522', '1', null, '登录成功', '127.0.0.1', '1', '1522929993', '1');
INSERT INTO `td_log` VALUES ('523', '1', null, '登录成功', '127.0.0.1', '1', '1522937544', '1');
INSERT INTO `td_log` VALUES ('524', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940073', '1');
INSERT INTO `td_log` VALUES ('525', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940166', '1');
INSERT INTO `td_log` VALUES ('526', '1', null, '编辑菜单成功', '127.0.0.1', '1', '1522940201', '1');
INSERT INTO `td_log` VALUES ('527', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940240', '1');
INSERT INTO `td_log` VALUES ('528', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940268', '1');
INSERT INTO `td_log` VALUES ('529', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940294', '1');
INSERT INTO `td_log` VALUES ('530', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940333', '1');
INSERT INTO `td_log` VALUES ('531', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940361', '1');
INSERT INTO `td_log` VALUES ('532', '1', null, '添加菜单成功', '127.0.0.1', '1', '1522940403', '1');
INSERT INTO `td_log` VALUES ('533', '1', null, '登录成功', '127.0.0.1', '1', '1522940423', '1');
INSERT INTO `td_log` VALUES ('534', '1', null, '登录成功', '127.0.0.1', '1', '1522988232', '1');
INSERT INTO `td_log` VALUES ('535', '1', null, '登录成功', '127.0.0.1', '1', '1523007534', '1');
INSERT INTO `td_log` VALUES ('536', '1', null, '登录成功', '127.0.0.1', '1', '1523022622', '1');
INSERT INTO `td_log` VALUES ('537', '1', null, '登录成功', '127.0.0.1', '1', '1523023172', '1');
INSERT INTO `td_log` VALUES ('538', '1', null, '登录成功', '127.0.0.1', '1', '1523061691', '1');
INSERT INTO `td_log` VALUES ('539', '1', null, '登录成功', '127.0.0.1', '1', '1523086454', '1');
INSERT INTO `td_log` VALUES ('540', '1', null, '登录成功', '127.0.0.1', '1', '1523147673', '1');
INSERT INTO `td_log` VALUES ('541', '1', null, '登录成功', '127.0.0.1', '1', '1523233427', '1');
INSERT INTO `td_log` VALUES ('542', '1', null, '登录成功', '127.0.0.1', '1', '1523320841', '1');

-- ----------------------------
-- Table structure for `td_member`
-- ----------------------------
DROP TABLE IF EXISTS `td_member`;
CREATE TABLE `td_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL COMMENT '邮件或者手机',
  `password` char(32) DEFAULT NULL,
  `face` varchar(128) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `money` int(11) DEFAULT '0' COMMENT '账户余额',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `reg_ip` varchar(15) DEFAULT NULL COMMENT '注册IP',
  `last_time` int(11) DEFAULT NULL COMMENT '最后一次登录',
  `last_ip` varchar(15) DEFAULT NULL COMMENT '最后一次登录IP',
  `status` tinyint(1) DEFAULT NULL COMMENT '1激活  0 未激活',
  `closed` tinyint(1) DEFAULT '0',
  `mobile` varchar(11) DEFAULT NULL COMMENT '认证的手机号码',
  `token` char(32) DEFAULT '0' COMMENT '令牌',
  `session_id` varchar(20) DEFAULT NULL,
  `sex` int(10) DEFAULT NULL COMMENT '1男2女',
  `birthday` varchar(255) DEFAULT NULL,
  `open_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=212065 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of td_member
-- ----------------------------
INSERT INTO `td_member` VALUES ('212061', '1217037610', 'd41d8cd98f00b204e9800998ecf8427e', '', 'XiMi丶momo', '300', '200', '1476779394', '0.0.0.0', '1476779394', '0.0.0.0', '1', '1', '18809321956', '0', '', '2', '1997-10-17', '');
INSERT INTO `td_member` VALUES ('1', '18809321929', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476762873/1321.jpg', '醉凡尘丶Wordly', '92960', '73', '1476762875', '0.0.0.0', '1476762875', '0.0.0.0', '1', '0', '18809321929', '0', '', '1', '2016-10-17', '');
INSERT INTO `td_member` VALUES ('212039', '1217037610', 'd41d8cd98f00b204e9800998ecf8427e', '', '紫陌轩尘', '400', '434', '1476676516', '0.0.0.0', '1476676516', '0.0.0.0', '1', '1', '49494', '0', '', '1', '2021-10-13', '');
INSERT INTO `td_member` VALUES ('212044', '', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476425832/1464073670790.jpg', 'fag', '24', '424', '1476425833', '0.0.0.0', '1476425833', '0.0.0.0', '0', '1', '242', '0', '', '1', '1995-10-27', '');
INSERT INTO `td_member` VALUES ('212045', '18809321928', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476676463/1464073638442.jpg', '空谷幽兰', '53', '3636', '1476676464', '0.0.0.0', '1476676464', '0.0.0.0', '1', '0', '3636', '0', '', '2', '2016-10-13', '');
INSERT INTO `td_member` VALUES ('212049', '', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476425748/20160624012046361.jpg', '787367373', '414', '9', '1476425750', '0.0.0.0', '1476425750', '0.0.0.0', '0', '1', '73737373', '0', '', '1', '2003-10-13', '');
INSERT INTO `td_member` VALUES ('212051', '18809321929', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476692253/215358np33w7nw7u4o4536.jpg', 'XMi丶呵呵', '373373', '33', '1476692255', '0.0.0.0', '1476692255', '0.0.0.0', '1', '0', '73', '0', '', '2', '1995-10-14', '');
INSERT INTO `td_member` VALUES ('212052', '1246470984', 'd41d8cd98f00b204e9800998ecf8427e', 'uploads/face/1476692121/1464073670790.jpg', 'XY', '7383', '73737373', '1476692123', '0.0.0.0', '1476692123', '0.0.0.0', '1', '1', '7373', '0', '', '1', '2011-10-14', '');
INSERT INTO `td_member` VALUES ('212053', '18793189097', 'd41d8cd98f00b204e9800998ecf8427e', '', '25773', '7373737', '77', '1476433452', '0.0.0.0', '1476433452', '0.0.0.0', '1', '1', '7373733', '0', '', '1', '2016-10-10', '');
INSERT INTO `td_member` VALUES ('212060', '1246470984', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/face/1476694804/20090106103716418.jpg', 'XiYu', '100', '100', '1476694831', '0.0.0.0', '1476694831', '0.0.0.0', '1', '1', '18793189091', '0', '', '2', '1996-10-17', '');
INSERT INTO `td_member` VALUES ('212064', '', '', 'http://wx.qlogo.cn/mmopen/WS5af6DwbzhvoKlOnV589huTP4nBWhMAEVzVI4gdCUQF0Kpc3FVXrkibWudHhYch2hPaXI4Jrs4ibppBGlSquM4x7abIdibnHgf/0', '烟勤话少脾气好', '0', '0', '0', '', '0', '', '0', '0', '', '0', '', '0', '', 'o0n73s5lR1WClmv3ujC0XU22IRnc');

-- ----------------------------
-- Table structure for `td_money_log`
-- ----------------------------
DROP TABLE IF EXISTS `td_money_log`;
CREATE TABLE `td_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化值',
  `note` varchar(500) NOT NULL DEFAULT '0' COMMENT '变动描述',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户钱包日志表';

-- ----------------------------
-- Records of td_money_log
-- ----------------------------

-- ----------------------------
-- Table structure for `td_order`
-- ----------------------------
DROP TABLE IF EXISTS `td_order`;
CREATE TABLE `td_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` char(16) DEFAULT NULL COMMENT '订单号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态 ',
  `accept_name` varchar(50) DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收件人电话',
  `address` varchar(500) DEFAULT NULL COMMENT '收件详细地址',
  `create_time` int(11) DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` int(11) DEFAULT NULL COMMENT '订单支付时间',
  `send_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `completion_time` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `user_remark` varchar(500) DEFAULT NULL COMMENT '用户备注',
  `pay_style` tinyint(1) DEFAULT NULL COMMENT '支付方式 1积分 2现金  3组合',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费',
  `pay_score` int(11) NOT NULL DEFAULT '0' COMMENT '支付积分',
  `pay_cash` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '支付现金',
  `coupon_id` int(11) DEFAULT NULL COMMENT '支付使用的优惠券id',
  `is_invoice` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开发票 0不开 1开',
  `invoice_cate` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '发票类型1个人  2单位',
  `invoice_title` varchar(500) DEFAULT NULL COMMENT '发票抬头',
  `invoice_tax_no` varchar(50) DEFAULT NULL COMMENT '税号',
  `invoice_address` varchar(500) DEFAULT NULL COMMENT '发票单位地址',
  `invoice_phone` varchar(20) DEFAULT NULL COMMENT '发票电话',
  `invoice_bank` varchar(50) DEFAULT NULL COMMENT '发票开户行',
  `invoice_bank_card` varchar(50) DEFAULT NULL COMMENT '发票银行账户',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `order_no` (`order_no`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of td_order
-- ----------------------------
INSERT INTO `td_order` VALUES ('1', '2018040908315053', '1', '0', '1', '张三三', '18612342008', '山东省青岛市经济技术开发区西海岸香江中路100号未来大厦2单元10F', '1523260467', null, null, null, '这里是用户的下单备注', '2', '25', '0', '2888.00', null, '1', '2', '青岛开创未来科技有限公司', '123400004860905355', '安徽省滁州市会峰西路1号(会峰校区)', '0550-3510507 ', '中国工商银行滁州市醉翁亭支行', '1313062809024904784');
INSERT INTO `td_order` VALUES ('2', '2018040908315053', '1', '0', '1', '张三三', '18612342008', '山东省青岛市黄岛区香江路100号', '1523260467', null, null, null, '这里是用户的下单备注', '2', '25', '0', '2888.00', null, '1', '1', '个人', null, null, null, null, null);
INSERT INTO `td_order` VALUES ('3', '2018040908315053', '1', '0', '1', '张三三', '18612342008', '山东省青岛市黄岛区香江路100号', '1523260467', null, null, null, '这里是用户的下单备注', '2', '25', '0', '2888.00', null, '0', '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `td_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `td_order_goods`;
CREATE TABLE `td_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单号',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '购买的商品id',
  `goods_spec` varchar(500) DEFAULT NULL COMMENT '商品规格字符串',
  `goods_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of td_order_goods
-- ----------------------------
INSERT INTO `td_order_goods` VALUES ('1', '1', '1', '银色,256GB', '2');
INSERT INTO `td_order_goods` VALUES ('2', '1', '2', '金色,128GB', '3');

-- ----------------------------
-- Table structure for `td_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `td_order_log`;
CREATE TABLE `td_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `uid` varchar(50) DEFAULT NULL COMMENT '操作人',
  `note` varchar(500) DEFAULT NULL COMMENT '事件',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单日志表';

-- ----------------------------
-- Records of td_order_log
-- ----------------------------
INSERT INTO `td_order_log` VALUES ('1', '1', '1', '提交了订单，请等待系统确认', '1523236220');
INSERT INTO `td_order_log` VALUES ('2', '1', '1', '订单审核通过，等待发货', '1523325785');
INSERT INTO `td_order_log` VALUES ('3', '1', '1', '订单正在配送途中，请您准备签收', '1523325822');
INSERT INTO `td_order_log` VALUES ('4', '1', '1', '订单已签收', '1523325843');

-- ----------------------------
-- Table structure for `td_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `td_score_log`;
CREATE TABLE `td_score_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `value` int(11) NOT NULL COMMENT '值',
  `note` varchar(500) NOT NULL COMMENT '描述',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分明细表';

-- ----------------------------
-- Records of td_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for `td_user`
-- ----------------------------
DROP TABLE IF EXISTS `td_user`;
CREATE TABLE `td_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `openid` varchar(50) DEFAULT NULL,
  `passwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `tel` char(11) DEFAULT NULL COMMENT '手机号码',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '总积分',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `birthday` varchar(50) DEFAULT NULL COMMENT '出生年月',
  `station_name` varchar(100) DEFAULT NULL COMMENT '监测站名称',
  `manufactor` varchar(100) DEFAULT NULL COMMENT '设备厂家名称',
  `duty` varchar(500) DEFAULT NULL COMMENT '主要职务',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `create_ip` varchar(50) DEFAULT NULL COMMENT '注册IP',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效状态 0禁用 1正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of td_user
-- ----------------------------
INSERT INTO `td_user` VALUES ('1', 'zhangsan', '\'\'', '\'\'', '18605328888', '2018', '2000.00', '1990.06.01', '青岛城阳中心路站', '北京检测中心', '高级经理', '1522717275', '1522717332', '\'\'', '\'\'', '0');

-- ----------------------------
-- Table structure for `td_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `td_user_address`;
CREATE TABLE `td_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `accept_name` varchar(20) NOT NULL COMMENT '收件人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收件人手机',
  `province` int(11) NOT NULL COMMENT '省',
  `city` int(11) NOT NULL COMMENT '市',
  `county` int(11) NOT NULL COMMENT '区',
  `address` varchar(500) DEFAULT NULL COMMENT '收货地址',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户地址表';

-- ----------------------------
-- Records of td_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for `td_user_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `td_user_coupon`;
CREATE TABLE `td_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户领取的优惠券id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '使用状态 0未使用 1使用',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户优惠券表';

-- ----------------------------
-- Records of td_user_coupon
-- ----------------------------
