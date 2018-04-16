/*
Navicat MySQL Data Transfer

Source Server         : 120.25.192.56
Source Server Version : 50637
Source Host           : 120.25.192.56:3306
Source Database       : single_pro_db_v2

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-04-16 23:28:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sp_basic_city
-- ----------------------------
DROP TABLE IF EXISTS `sp_basic_city`;
CREATE TABLE `sp_basic_city` (
  `id` char(36) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '城市名称',
  `pinyin` varchar(200) NOT NULL COMMENT '拼音',
  `jianpin` varchar(50) NOT NULL COMMENT '简拼',
  `pcode` char(6) NOT NULL COMMENT '父级编码',
  `code` char(6) NOT NULL COMMENT '城市编码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市基础数据';

-- ----------------------------
-- Records of sp_basic_city
-- ----------------------------
INSERT INTO `sp_basic_city` VALUES ('0014c1d4981e4916848e21f526b36f39', '云县', 'yunxian', 'yx', '530900', '530922', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('003f5dea3ac14ec496ebd95c30be1f74', '富锦市', 'fujinshi', 'fjs', '230800', '230882', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0050fe1b7d034282b0586fc720322e41', '岱山县', 'daishanxian', 'dsx', '330900', '330921', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0057758beb8047c8923ede57a0669d1b', '鼓楼区', 'gulouqu', 'glq', '320300', '320302', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('00588d645ed74ae88563c04362bf68d3', '虎林市', 'hulinshi', 'hls', '230300', '230381', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('006ce336b4a348daac5d3ec4fca5e2d5', '石河子市', 'shihezishi', 'shzs', '659000', '659001', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('00c1f5103b994c79b2ae00beb0ed4819', '新干县', 'xinganxian', 'xgx', '360800', '360824', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('00c7d0d903994a4bbce0ee00dc7654fc', '长宁区', 'changningqu', 'cnq', '310100', '310105', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('00e60f5df3194dfbbc8fb8fb43e80ce2', '新都区', 'xindouqu', 'xdq', '510100', '510114', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('00e80a7c64a04e78bd09600d7a2cad54', '红河哈尼族彝族自治州', 'honghehanizuyizuzizhizhou', 'hhhnzyzzzz', '530000', '532500', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('011b36a4b1794b6d9e6cd36643a3f189', '南岔区', 'nanchaqu', 'ncq', '230700', '230703', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('011f33ae1dfe4b4da4a310c06887c806', '始兴县', 'shixingxian', 'sxx', '440200', '440222', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('01406900099b4653bc1ae101fa6cdcde', '乐昌市', 'lechangshi', 'lcs', '440200', '440281', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('014b52951d2a43d0a6900a7a5ed04c9f', '彰武县', 'zhangwuxian', 'zwx', '210900', '210922', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('015029af0a58409bbaada800938a04b9', '福鼎市', 'fudingshi', 'fds', '350900', '350982', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('01516451e857499bb7d0f7f16151d833', '鸡泽县', 'jizexian', 'jzx', '130400', '130431', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('017028f3785d4610a38d3821d750470e', '谯城区', 'qiaochengqu', 'qcq', '341600', '341602', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('01b27413871249f5becd78a7899504a0', '道里区', 'daoliqu', 'dlq', '230100', '230102', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('01ba297d819942809203d98fe2a88ebd', '丰都县', 'fengdouxian', 'fdx', '500200', '500230', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('01e4358d71194fa48a1536e240388720', '桂林市', 'guilinshi', 'gls', '450000', '450300', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('01e7baf3ec734f23ae089c9223122ea2', '沈河区', 'shenhequ', 'shq', '210100', '210103', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0203f234a27d4609adf3670346ab7ed7', '大厂回族自治县', 'dachanghuizuzizhixian', 'dchzzzx', '131000', '131028', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('023071c8c98f421fb117a335806a416f', '海淀区', 'haidianqu', 'hdq', '110100', '110108', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0231e4e5e0634b5d848062dd106eb8a7', '秀山土家族苗族自治县', 'xiushantujiazumiaozuzizhixian', 'xstjzmzzzx', '500200', '500241', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('023c8015e0f54981bc65ae6c44769f9f', '四子王旗', 'siziwangqi', 'szwq', '150900', '150929', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0242dd2ad49f465ea709fdc7c2d7227a', '邹平县', 'zoupingxian', 'zpx', '371600', '371626', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('026e33e6d4374316afbf3e18a1d43ffd', '永州市', 'yongzhoushi', 'yzs', '430000', '431100', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02760e91f2f842f4ac0c1e2e3732e8f5', '龙华区', 'longhuaqu', 'lhq', '460100', '460106', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('027a06224a1448f9ac568aab40b08592', '许昌市', 'xuchangshi', 'xcs', '410000', '411000', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0283ceb9ecc34820b8a8b3058dc2efd4', '皇姑区', 'huangguqu', 'hgq', '210100', '210105', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('029210e88e554208bf62cd7f8debe727', '通川区', 'tongchuanqu', 'tcq', '511700', '511702', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02bc2d03121a475e8f7910a9585252ad', '新丰县', 'xinfengxian', 'xfx', '440200', '440233', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02cdc18bca4e4b81b65da23f1483a17e', '金塔县', 'jintaxian', 'jtx', '620900', '620921', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02df1c67251a478d85bd8d37f6f9c849', '蛟河市', 'jiaoheshi', 'jhs', '220200', '220281', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02f107b7dd9f4256ad7a02b37389aa1e', '大丰市', 'dafengshi', 'dfs', '320900', '320982', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02f6460126a548ba9ccd5c75bfe989d7', '西安区', 'xianqu', 'xaq', '220400', '220403', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02fa943bc8814cc3bb794fcffe24f96d', '石柱土家族自治县', 'shizhutujiazuzizhixian', 'sztjzzzx', '500200', '500240', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('02fb77fee71c499ba7ace8c32313fb6b', '麻城市', 'machengshi', 'mcs', '421100', '421181', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0307cbe741c04482bddf5a0273d3ddce', '耒阳市', 'leiyangshi', 'lys', '430400', '430481', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03099cb7336b4603a295e4aba7d7e986', '奉节县', 'fengjiexian', 'fjx', '500200', '500236', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('031dfe8f5e284d4ab61de0d4b95af5ae', '市辖区', 'shixiaqu', 'sxq', '530900', '530901', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03267ec71a974861a0f3dbd024e542d9', '南康市', 'nankangshi', 'nks', '360700', '360782', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('033c176094154bb9b90078943b4f4620', '梅列区', 'meiliequ', 'mlq', '350400', '350402', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('036c85f50c31447b912bef01f57d77eb', '恩施市', 'enshishi', 'ess', '422800', '422801', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03792502ffbe4cf7bd38653475103031', '武冈市', 'wugangshi', 'wgs', '430500', '430581', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('038165efc4d047b1a772e3397d421608', '峡江县', 'xiajiangxian', 'xjx', '360800', '360823', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('038d8d734ced41708894bbd684344206', '北安市', 'beianshi', 'bas', '231100', '231181', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0397afc9bc254a10b96ec5a69e48871e', '凤山县', 'fengshanxian', 'fsx', '451200', '451223', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('039ed1824cfb4bf6a341cb8854496946', '宝兴县', 'baoxingxian', 'bxx', '511800', '511827', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03a21edbf1774f1585bdf097dd35b98a', '栾城县', 'luanchengxian', 'lcx', '130100', '130124', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03a4d738a17e4d97a2aa68b04ee7c7fa', '沧源佤族自治县', 'cangyuanwazuzizhixian', 'cywzzzx', '530900', '530927', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03ad1d09f0e442a5bdcb0f8604b8192b', '扬中市', 'yangzhongshi', 'yzs', '321100', '321182', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03b7d6d285b44eeebde3f85d7cd2fb39', '松溪县', 'songxixian', 'sxx', '350700', '350724', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03d46cacc53449a0b84a1aeb7e3d810f', '滨海新区', 'binhaixinqu', 'bhxq', '120100', '120116', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03d7a3eb7ce74e818e983856e476d710', '沾益县', 'zhanyixian', 'zyx', '530300', '530328', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('03edaeffef3d4fffa96d33361ffbf15b', '江都市', 'jiangdushi', 'jds', '321000', '321088', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('041d257519e342e8af291d9951f745ce', '永寿县', 'yongshouxian', 'ysx', '610400', '610426', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04273b6328cb4f59bff1b232537fefc0', '白朗县', 'bailangxian', 'blx', '542300', '542329', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04309ee8582741db9c45c8219da82b83', '西城区', 'xichengqu', 'xcq', '110100', '110102', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0445cadba5a941139afd77b2ac9bb8dc', '雁山区', 'yanshanqu', 'ysq', '450300', '450311', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04693f8da32c432eb9f49f3c601f223e', '汉阴县', 'hanyinxian', 'hyx', '610900', '610921', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('048a94c0f63d45debc976a98890f9880', '市辖区', 'shixiaqu', 'sxq', '620700', '620701', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('048f0e4393f64223a6e0353d456008b2', '修水县', 'xiushuixian', 'xsx', '360400', '360424', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04ab352f7e204e28bb3ee6f09c7bfaa6', '达拉特旗', 'dalateqi', 'dltq', '150600', '150621', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04b04fff5b524e2b9e2061a7012ba1ea', '滨湖区', 'binhuqu', 'bhq', '320200', '320211', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04d0c39d286145ac97defd81db45b0f6', '石峰区', 'shifengqu', 'sfq', '430200', '430204', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04eb5ea82880438da0fe775b666025b6', '佛坪县', 'fopingxian', 'fpx', '610700', '610730', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04f717ed5ec24d2283392f863bfa4126', '湟中县', 'huangzhongxian', 'hzx', '630100', '630122', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('04ff946b36c142888e9d9a514bb734fb', '余杭区', 'yuhangqu', 'yhq', '330100', '330110', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('051742812dc14c88bdc8e7df1201452a', '宁县', 'ningxian', 'nx', '621000', '621026', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05241bdaa9e54f94a4873af8d92fe497', '湖里区', 'huliqu', 'hlq', '350200', '350206', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05242d7df82a401faea413f13f202ef4', '宁国市', 'ningguoshi', 'ngs', '341800', '341881', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05348cd8f91048cd9e114986fa10f3d4', '翠屏区', 'cuipingqu', 'cpq', '511500', '511502', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('053a57f766524c97a5ccb15fd12ecba0', '市辖区', 'shixiaqu', 'sxq', '211300', '211301', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('055b024ab5f244db879c328ca2c508d2', '西宁市', 'xiningshi', 'xns', '630000', '630100', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('056e04535ee64731bb32dcbb032006b7', '鞍山市', 'anshanshi', 'ass', '210000', '210300', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0588abe9ae224e23b654133a064e46ee', '改则县', 'gaizexian', 'gzx', '542500', '542526', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05960aee448c4318b5751358e38a4101', '东兴区', 'dongxingqu', 'dxq', '511000', '511011', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0597a2bf9aea40009245daef294bb9ac', '衡东县', 'hengdongxian', 'hdx', '430400', '430424', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05adebaa42ae42618b5902789dc1b9ad', '武强县', 'wuqiangxian', 'wqx', '131100', '131123', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05bc9cfeff564422b7f1647111ce4506', '恒山区', 'hengshanqu', 'hsq', '230300', '230303', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05cbabca5ef9491096f959057c6d7852', '芒市', 'mangshi', 'ms', '533100', '533103', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05d71d464b0e4e70aff36d611bd6eba5', '茅箭区', 'maojianqu', 'mjq', '420300', '420302', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05f56ee4074a4a18b0073942463ddaa6', '鄂州市', 'ezhoushi', 'ezs', '420000', '420700', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05fc2db4361446f88020617d1ca981db', '荔湾区', 'liwanqu', 'lwq', '440100', '440103', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05fea63da8814d3ab22c6d92ca89ea2e', '崆峒区', 'kongtongqu', 'ktq', '620800', '620802', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('05ffd0dc3dec422c9995755347b4b7aa', '灵宝市', 'lingbaoshi', 'lbs', '411200', '411282', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0603333320134c09b50e5ab4ce5f6622', '陈巴尔虎旗', 'chenbaerhuqi', 'cbehq', '150700', '150725', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('061af816403646e288bafe3c870b20a3', '铁西区', 'tiexiqu', 'txq', '220300', '220302', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('062b88605e4f4087b12f82ecacd2d4b2', '宜黄县', 'yihuangxian', 'yhx', '361000', '361026', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('062d452e7dbc4eecbf6661814ecbad32', '郏县', 'jiaxian', 'jx', '410400', '410425', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('062f05e293f941419f7bf20de4c0b37c', '辰溪县', 'chenxixian', 'cxx', '431200', '431223', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('064b2f1645bc442eadf1ca605d582ee2', '长乐市', 'changleshi', 'cls', '350100', '350182', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('06504019a98f4387a9590da8b5654715', '登封市', 'dengfengshi', 'dfs', '410100', '410185', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0678d57e19b94e34bc844ee82a83f60f', '石狮市', 'shishishi', 'sss', '350500', '350581', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0688d8b8f128414a921facfa931f6c3c', '石屏县', 'shipingxian', 'spx', '532500', '532525', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('068ba36f0e0f4e45af78923f4ba77305', '莱州市', 'laizhoushi', 'lzs', '370600', '370683', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0699837e0cb149b0949508b34513b68a', '市辖区', 'shixiaqu', 'sxq', '370600', '370601', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('069ecca13dec41cc8e17514f82c65199', '马尔康县', 'maerkangxian', 'mekx', '513200', '513229', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('06b0edc831a74bce8205b0f03f68496d', '塔什库尔干塔吉克自治县', 'tashenkuergantajikezizhixian', 'tskegtjkzzx', '653100', '653131', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('06b7e36702a047229ce6c68e1eb05649', '突泉县', 'tuquanxian', 'tqx', '152200', '152224', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('06b95e078acb444682718f23fe54d380', '巢湖市', 'chaohushi', 'chs', '340000', '341400', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('06ce2a31946f48b98c572400068befcc', '道县', 'daoxian', 'dx', '431100', '431124', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('06e339e6ff63474fb78537151bedaf99', '兴宾区', 'xingbinqu', 'xbq', '451300', '451302', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0750a89231c6436696751abce8695ec4', '让胡路区', 'ranghuluqu', 'rhlq', '230600', '230604', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07667c09d1e84885ae77b4bb204ee552', '方山县', 'fangshanxian', 'fsx', '141100', '141128', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0781b963337b4a8da726db5aea9f4614', '钦州市', 'qinzhoushi', 'qzs', '450000', '450700', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0798459813394ad19408af2ee7cc86f3', '玉树藏族自治州', 'yushucangzuzizhizhou', 'ysczzzz', '630000', '632700', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07abeaccbad04e988a5b7d76ece984c2', '烟台市', 'yantaishi', 'yts', '370000', '370600', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07b1abed59164bbb8bc287a5a1952598', '滦平县', 'luanpingxian', 'lpx', '130800', '130824', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07bd3fea67ce4f66b956d98548c24e4f', '陕西省', 'shanxisheng', 'sxs', '1', '610000', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07c68aeb2d9c419e8c1b69ffbecce21f', '船营区', 'chuanyingqu', 'cyq', '220200', '220204', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07d4e2fcdb23446c9d7c09c0fd10af2a', '市辖区', 'shixiaqu', 'sxq', '220100', '220101', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07d6c8837e3d45749212fcb4cdb8fbe0', '龙州县', 'longzhouxian', 'lzx', '451400', '451423', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('07d7b15f2c4f4186a180e2f6d26b01cd', '郑州市', 'zhengzhoushi', 'zzs', '410000', '410100', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('080d7a2db63f44f2a5049699887798e8', '宁夏回族自治区', 'ningxiahuizuzizhiqu', 'nxhzzzq', '1', '640000', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('080dd59dbbe94f709bffbed60d388a95', '南票区', 'nanpiaoqu', 'npq', '211400', '211404', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('08133d383d4b45bdb754270bda1d395c', '新建县', 'xinjianxian', 'xjx', '360100', '360122', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0835142672a748dcb2c7bfaaf94d9a0d', '尼勒克县', 'nilekexian', 'nlkx', '654000', '654028', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('08381d475c2743e49bcbdbd07fdbc9c0', '张掖市', 'zhangyeshi', 'zys', '620000', '620700', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('083eb192ef6b494fbcded4c49a11bbcd', '市辖区', 'shixiaqu', 'sxq', '140600', '140601', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('084a33b531b5442988a7b6272897a28a', '北票市', 'beipiaoshi', 'bps', '211300', '211381', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('084dc40329414040aa5cc20ea7000bcb', '罗庄区', 'luozhuangqu', 'lzq', '371300', '371311', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('087b384e9c9945f5a7de519ffa5211fa', '荣县', 'rongxian', 'rx', '510300', '510321', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('089a331ed3584a1fa75b46bb015f4e91', '福建省', 'fujiansheng', 'fjs', '1', '350000', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('08a25edac97f4dbaa48f1f9826014c16', '达坂城区', 'dabanchengqu', 'dbcq', '650100', '650107', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('08b2cf36d0234676ba53c5ec2df9e620', '海城市', 'haichengshi', 'hcs', '210300', '210381', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('08d309ec52de44b495b3b4c1b60d9504', '文安县', 'wenanxian', 'wax', '131000', '131026', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('08f53bdf357e452b913156c8209ce7dc', '陕县', 'shanxian', 'sx', '411200', '411222', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('091608c3d5344105a1e5315a628af6ce', '长岛县', 'changdaoxian', 'cdx', '370600', '370634', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('093700b7b3a84d6e880c5f42340e6af1', '山阴县', 'shanyinxian', 'syx', '140600', '140621', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0950a8a9142a462e9a169147ccea5829', '三元区', 'sanyuanqu', 'syq', '350400', '350403', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('097d75c4f6bd428dae7894f1c3505d28', '市辖区', 'shixiaqu', 'sxq', '430500', '430501', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('099071eb72d346488aa714f97a73e766', '焉耆回族自治县', 'yanqihuizuzizhixian', 'yqhzzzx', '652800', '652826', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('099b85ab9b93482da17a0a25c06ae7dc', '凤台县', 'fengtaixian', 'ftx', '340400', '340421', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('099dbf08aa80427c80d86a42bc602e10', '天心区', 'tianxinqu', 'txq', '430100', '430103', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('099fbcc4b3cc437e8a4f35c393163ba4', '市辖区', 'shixiaqu', 'sxq', '451400', '451401', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('09c9b31567be4b02a52a654262d4589d', '和平区', 'hepingqu', 'hpq', '210100', '210102', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('09ff25c6dc3d444f8d9485af001d3d0b', '鄂伦春自治旗', 'elunchunzizhiqi', 'elczzq', '150700', '150723', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0a094edcc2a3416085ec211957216fd4', '绩溪县', 'jixixian', 'jxx', '341800', '341824', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0a12668901154886aacbef3eab447541', '余江县', 'yujiangxian', 'yjx', '360600', '360622', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0a16f2bd4764459baf2a1576bcaff13c', '长宁县', 'changningxian', 'cnx', '511500', '511524', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0a21837c33624a9695f431f6f4e59ceb', '东丰县', 'dongfengxian', 'dfx', '220400', '220421', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0a24a8f0280c45c2a33169e9fddf8378', '娄星区', 'louxingqu', 'lxq', '431300', '431302', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0a4d8f0f4cf54e12b762b980e69ffce5', '灯塔市', 'dengtashi', 'dts', '211000', '211081', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0a885f922cda4277b967300d9883cf91', '市辖区', 'shixiaqu', 'sxq', '621000', '621001', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0aaff9a764d24a37aabf7de95b95798d', '蚌埠市', 'bengbushi', 'bbs', '340000', '340300', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ab1e39412b847818fb856b3806d02d0', '市辖区', 'shixiaqu', 'sxq', '440100', '440101', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0acb0670b46345f5bb307242aaca8d44', '崇信县', 'chongxinxian', 'cxx', '620800', '620823', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ace1f6a850c4728ba75d2a34bd126c8', '潞城市', 'luchengshi', 'lcs', '140400', '140481', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ad5ea77d47649adaacb9775b23bd955', '鼎城区', 'dingchengqu', 'dcq', '430700', '430703', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ad813115a714697b27dabf2e72cc193', '仪征市', 'yizhengshi', 'yzs', '321000', '321081', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ae8b29ecf3d431bb8e91084432b2f9d', '前进区', 'qianjinqu', 'qjq', '230800', '230804', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0b1837631e3843808a213d9cb334768e', '灵川县', 'lingchuanxian', 'lcx', '450300', '450323', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0b2f8bcb11f04a429d65b2ffaa093d4a', '钢城区', 'gangchengqu', 'gcq', '371200', '371203', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0b36f3f3065e4a908ac228dcd73fe8b9', '裕安区', 'yuanqu', 'yaq', '341500', '341503', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0b473ad61a0040fa882a5f5caf151a3c', '嘉峪关市', 'jiayuguanshi', 'jygs', '620000', '620200', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0b48b77768f54fc0a756e7b553afc195', '龙口市', 'longkoushi', 'lks', '370600', '370681', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0b7d3c69817f43489768235d18c0984f', '宁都县', 'ningdouxian', 'ndx', '360700', '360730', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ba7638611a64d5c8700ea55276b650b', '东平县', 'dongpingxian', 'dpx', '370900', '370923', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bb4593af7fd460db6cbd1da0655012e', '沾化县', 'zhanhuaxian', 'zhx', '371600', '371624', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bb62b15df884ee28d164b80849bbd18', '固阳县', 'guyangxian', 'gyx', '150200', '150222', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bb83c0117d649eda2b6f509b16c5ade', '洛扎县', 'luozaxian', 'lzx', '542200', '542228', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bd000f1df9d4bd5be10645138885876', '市辖区', 'shixiaqu', 'sxq', '420700', '420701', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bd4105f7c1c4b5e961c1865510290c2', '二连浩特市', 'erlianhaoteshi', 'elhts', '152500', '152501', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0be35f3a15de4dc2a1f0517a09be722f', '河源市', 'heyuanshi', 'hys', '440000', '441600', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bf1a9deccd3492d992f5fa53e547426', '林口县', 'linkouxian', 'lkx', '231000', '231025', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bf9adef20e344d59c397713d2989c40', '汉阳区', 'hanyangqu', 'hyq', '420100', '420105', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0bffb70193924dc3bad2c424d09f5632', '万源市', 'wanyuanshi', 'wys', '511700', '511781', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c03d3154b1e43af8f33bfda566fac37', '大城县', 'daichengxian', 'dcx', '131000', '131025', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c0bff284ee84edd862eabaf8dfa8b0f', '吉州区', 'jizhouqu', 'jzq', '360800', '360802', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c1acc463c6a4e07ad092c6a16e91764', '象山区', 'xiangshanqu', 'xsq', '450300', '450304', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c2382569fd74a77b3a37b79166e6140', '仁化县', 'renhuaxian', 'rhx', '440200', '440224', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c3b6526a63949bcb1d998731cd1d2e8', '峨山彝族自治县', 'eshanyizuzizhixian', 'esyzzzx', '530400', '530426', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c411cecd94a496ca61629fa61b26b42', '喜德县', 'xidexian', 'xdx', '513400', '513432', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c5522491c374c98a1b12299fcd1fbec', '维西傈僳族自治县', 'weixilisuzuzizhixian', 'wxlszzzx', '533400', '533423', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c7de2fcb97f4475ba27c9efc8893f45', '青原区', 'qingyuanqu', 'qyq', '360800', '360803', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c7ef86300a54176b7eaa289e9bea780', '常熟市', 'changshushi', 'css', '320500', '320581', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c8475a945fe4650890d251a324fa5ed', '阜南县', 'funanxian', 'fnx', '341200', '341225', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c86990d2e36438cb7cbb0814366be5a', '琼山区', 'qiongshanqu', 'qsq', '460100', '460107', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c90935f3aad4588a76438888d907af5', '昭阳区', 'zhaoyangqu', 'zyq', '530600', '530602', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c9109f487344b3ea3db1b7575122a01', '涡阳县', 'woyangxian', 'wyx', '341600', '341621', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c964181585e4646959741a1a4cb95d1', '井研县', 'jingyanxian', 'jyx', '511100', '511124', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c97227aa76c45e7a3729e19224eb28d', '德化县', 'dehuaxian', 'dhx', '350500', '350526', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c97f3cff66b4f5093ad291399843d59', '昂仁县', 'angrenxian', 'arx', '542300', '542327', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0c980732205a40cba39490e63bb5768f', '芝罘区', 'zhifuqu', 'zfq', '370600', '370602', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0cb2d50ba2f14b0ea63ee797bdc3dbe8', '衡水市', 'hengshuishi', 'hss', '130000', '131100', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0cb7b30a58324e3b80c13b0e7aaecfa0', '毕节地区', 'bijiediqu', 'bjdq', '520000', '522400', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0cc686a67f1e4c809ef60912160c8a4c', '汇川区', 'huichuanqu', 'hcq', '520300', '520303', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0cd6a67551ee4c27b2ae64fe6cf5dda8', '沧州市', 'cangzhoushi', 'czs', '130000', '130900', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0cf6914d47bb4c9b9a6d2f2a1722d61a', '南郑县', 'nanzhengxian', 'nzx', '610700', '610721', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d112c30c2004c7ea33a134101fe7e72', '瑶海区', 'yaohaiqu', 'yhq', '340100', '340102', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d15b7bf566f47b3bbb4c5ce34f24832', '石城县', 'shichengxian', 'scx', '360700', '360735', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d16021ad0134a5ea62c4bd58f614a1a', '合作市', 'hezuoshi', 'hzs', '623000', '623001', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d1e904434b6418180c1f48b3e81deaf', '牡丹江市', 'mudanjiangshi', 'mdjs', '230000', '231000', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d281522e9bb477eae009072c8cb6506', '泗水县', 'sishuixian', 'ssx', '370800', '370831', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d2bc6d5e0d9483db89137563d9395db', '土默特右旗', 'tumoteyouqi', 'tmtyq', '150200', '150221', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d30f61317954aa989b45f1671f847ab', '驿城区', 'yichengqu', 'ycq', '411700', '411702', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d3e2e350f8e46b280705ee801f13eb7', '大埔县', 'dabuxian', 'dbx', '441400', '441422', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d49afd519934daf92fb0d9fd4d75980', '市辖区', 'shixiaqu', 'sxq', '230100', '230101', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d4a609b77534967818847ccb4a66ddc', '广东省', 'guangdongsheng', 'gds', '1', '440000', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d6a499169f34ccb84c53b6552d467df', '玛曲县', 'maquxian', 'mqx', '623000', '623025', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d6fdea8b88249b3bd6ac88b465e9507', '市辖区', 'shixiaqu', 'sxq', '370700', '370701', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d780eb694f04fbba0bad1f6285594e2', '厦门市', 'xiamenshi', 'xms', '350000', '350200', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0d978a997a494458aa18118c7500835c', '剑阁县', 'jiangexian', 'jgx', '510800', '510823', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0dc617d122ba4ee384f9ddc665e5b45b', '长武县', 'changwuxian', 'cwx', '610400', '610428', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ddefbf3bd644560a69eb06c6f533d75', '遵义市', 'zunyishi', 'zys', '520000', '520300', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0dea94623c014610bb1d4aed7a6f1eac', '市辖区', 'shixiaqu', 'sxq', '340400', '340401', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0df487f99f094c7782b19fa035f18bfc', '安平县', 'anpingxian', 'apx', '131100', '131125', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0dfb3a9dd5d74fd8929b0dadde8bc234', '金乡县', 'jinxiangxian', 'jxx', '370800', '370828', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e1a81c4dfe9403f96a659d60e0b5811', '陆良县', 'luliangxian', 'llx', '530300', '530322', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e212619b1f4476095a0fd9babd6de9d', '龙凤区', 'longfengqu', 'lfq', '230600', '230603', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e350c6daa0949ada3e6f4f319e8ded4', '肥西县', 'feixixian', 'fxx', '340100', '340123', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e5456cc143241ecb6a1d3f03915cf3f', '江宁区', 'jiangningqu', 'jnq', '320100', '320115', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e5d1fd24d70495b8eff157e3f3ecbeb', '陵水黎族自治县', 'lingshuilizuzizhixian', 'lslzzzx', '469000', '469028', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e75e979acd249bda788dffe4e22dff7', '镇安县', 'zhenanxian', 'zax', '611000', '611025', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e8c0dfca19a4970b05915d7d6419895', '青山湖区', 'qingshanhuqu', 'qshq', '360100', '360111', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0e91e9d23bdf4b88bce6676fc663cda5', '霍州市', 'huozhoushi', 'hzs', '141000', '141082', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ea5953c556e4b09aa7b5b18ed437502', '博兴县', 'boxingxian', 'bxx', '371600', '371625', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0eaab9d68dfb41d48442f56501f98d3f', '市辖区', 'shixiaqu', 'sxq', '440900', '440901', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0ee77a840e904fcbaf04152788d7af35', '张湾区', 'zhangwanqu', 'zwq', '420300', '420303', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0f26403b6f7e4421a250cb9ac039f137', '剑川县', 'jianchuanxian', 'jcx', '532900', '532931', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0f366544d50d4da6a6a143050fc500b7', '阳曲县', 'yangquxian', 'yqx', '140100', '140122', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0f43fc4db71e404dab506448542a081b', '雅江县', 'yajiangxian', 'yjx', '513300', '513325', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0f55a60b18a3461493065161bff4d80b', '五营区', 'wuyingqu', 'wyq', '230700', '230710', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0f65ce0344bc4267881f3fccc3ee04b5', '阳山县', 'yangshanxian', 'ysx', '441800', '441823', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0f7befa6636a4eca95890738ff7a9974', '赣县', 'ganxian', 'gx', '360700', '360721', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0fac4d15e02740e8bcc6f5dcbf537f96', '石拐区', 'shiguaiqu', 'sgq', '150200', '150205', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0fba36f431304d90a1a341ff3b80806c', '兴义市', 'xingyishi', 'xys', '522300', '522301', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0fc2400ff1964314816f85b1493c78e6', '温县', 'wenxian', 'wx', '410800', '410825', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0fc28ca6da78402ea9a6e8fd6d23d7ee', '汉滨区', 'hanbinqu', 'hbq', '610900', '610902', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0fd8cc3849b04b5d92ed7811b86410f4', '蔚县', 'yuxian', 'yx', '130700', '130726', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('0fe1ea62ba1d4b268915ab8161ea8bc7', '定海区', 'dinghaiqu', 'dhq', '330900', '330902', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1004d706ad8e413592957770eef82c2a', '印台区', 'yintaiqu', 'ytq', '610200', '610203', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('10125c893d4942eca14f251239952286', '农安县', 'nonganxian', 'nax', '220100', '220122', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('101395ba933a42088ca8d7232b965462', '临渭区', 'linweiqu', 'lwq', '610500', '610502', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('101d88d6a7db4fa78ee83f87046b2933', '西平县', 'xipingxian', 'xpx', '411700', '411721', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1030c51fbc6b4bb28bcb2e17c0bae9d8', '庄河市', 'zhuangheshi', 'zhs', '210200', '210283', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('10405cf39333445d8b05d8f4a0752e9f', '林芝县', 'linzhixian', 'lzx', '542600', '542621', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('10607315466249e784663f42d171b1fa', '牟平区', 'moupingqu', 'mpq', '370600', '370612', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1083385c752c4ad5a258e63e69d91340', '陇县', 'longxian', 'lx', '610300', '610327', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('10d10a3b28cd400a9dea6f6ce6ab83a8', '虹口区', 'hongkouqu', 'hkq', '310100', '310109', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('10e4148e206842fcb4ee2feb5f4895f5', '浙江省', 'zhejiangsheng', 'zjs', '1', '330000', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('10ebe6a986ad46c0bcd3fe73e0a9a416', '化隆回族自治县', 'hualonghuizuzizhixian', 'hlhzzzx', '632100', '632127', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('111687c3e0c04c3a86de12d3a80e5e96', '德州市', 'dezhoushi', 'dzs', '370000', '371400', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('111be9bfd66d496d802b87603102b382', '五莲县', 'wulianxian', 'wlx', '371100', '371121', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1123a46503994c98a6e8427acc2a2727', '大竹县', 'dazhuxian', 'dzx', '511700', '511724', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('112a923741364ef7b25061164601b6f4', '市辖区', 'shixiaqu', 'sxq', '460100', '460101', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('115a46a04c094be8a66e6c1d88f0d4cb', '那坡县', 'napoxian', 'npx', '451000', '451026', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('115b0026ad4b4927bf7d1db7c1123d19', '宁陵县', 'ninglingxian', 'nlx', '411400', '411423', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('116a046fe123499fbec090771fc72259', '灵丘县', 'lingqiuxian', 'lqx', '140200', '140224', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('116b4474c3c241c3b6a69a0687150e93', '玉山县', 'yushanxian', 'ysx', '361100', '361123', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('11813d9c03ef47d7b7c57f7600104638', '天峻县', 'tianjunxian', 'tjx', '632800', '632823', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1193812e9843425d9cd8d2d4b1373638', '西峡县', 'xixiaxian', 'xxx', '411300', '411323', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('119f95978c244fb3a1f1f4df7bc81581', '当阳市', 'dangyangshi', 'dys', '420500', '420582', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('11b3ea2263694479871c310e04fd0cbb', '广陵区', 'guanglingqu', 'glq', '321000', '321002', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('11b9328085f54aa6bf062cc8f5f60d09', '昌平区', 'changpingqu', 'cpq', '110100', '110114', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('11dcb08de8bf44ccb7adc58e5e59e55b', '港北区', 'gangbeiqu', 'gbq', '450800', '450802', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('11e7d19bb13041249159fe09896c409b', '广德县', 'guangdexian', 'gdx', '341800', '341822', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('120329fb171c4a49b56c1724830c84d3', '铁岭市', 'tielingshi', 'tls', '210000', '211200', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('12332323edb449debff36e10571c97a6', '通城县', 'tongchengxian', 'tcx', '421200', '421222', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('123b8fbd4a874d45a52f9079e9ac42a6', '梅江区', 'meijiangqu', 'mjq', '441400', '441402', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1249642c70304093a7363d364c8ddf9c', '竹溪县', 'zhuxixian', 'zxx', '420300', '420324', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('124e47b2b3d844d6b565a3a42e71f1f8', '东山县', 'dongshanxian', 'dsx', '350600', '350626', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('125e7befd82b44f8b9a30c9e092919c9', '路桥区', 'luqiaoqu', 'lqq', '331000', '331004', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1265c426749340e0a3c08f9693306739', '宝安区', 'baoanqu', 'baq', '440300', '440306', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1277cecc9537427da1277a9c5147f36b', '格尔木市', 'geermushi', 'gems', '632800', '632801', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1286afc3e85a4630b9a6efc5ce13d315', '金水区', 'jinshuiqu', 'jsq', '410100', '410105', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('128a72d5576c44dd8d308157b5ad3131', '华坪县', 'huapingxian', 'hpx', '530700', '530723', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('12923256f9ad4164ae2b32379ba356bd', '满城县', 'manchengxian', 'mcx', '130600', '130621', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1299b2d3c97d4bd09c769475448294f9', '珠晖区', 'zhuhuiqu', 'zhq', '430400', '430405', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('12a2904d3e1d40669d0df430df564898', '省直辖县级行政区划', 'shengzhixiaxianjixingzhengquhua', 'szxxjxzqh', '460000', '469000', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('12ab17951ebb4103b29f91e8a1d79973', '襄城县', 'xiangchengxian', 'xcx', '411000', '411025', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('12b7eea5446d42159d18c9aab7a80368', '黔南布依族苗族自治州', 'qiannanbuyizumiaozuzizhizhou', 'qnbyzmzzzz', '520000', '522700', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('12c27b500fd44ca1b8ec7425e0c3ce48', '陵川县', 'lingchuanxian', 'lcx', '140500', '140524', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('12c6b8fd06074870931faeb9a944eeaa', '隆化县', 'longhuaxian', 'lhx', '130800', '130825', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1319de4173a6432b92553c3a6cf16d22', '南岳区', 'nanyuequ', 'nyq', '430400', '430412', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('134143786ba249168ae34d4e207e0fff', '泰兴市', 'taixingshi', 'txs', '321200', '321283', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('135a94aef29d401aae4c04a7a337ac2f', '梁河县', 'lianghexian', 'lhx', '533100', '533122', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('137430e14ea7444d84107ed82995ea07', '市辖区', 'shixiaqu', 'sxq', '411600', '411601', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1382023a3da54e27a8357777d01756e5', '遂溪县', 'suixixian', 'sxx', '440800', '440823', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('139e9e3601934864bfae16eaa52191b2', '海州区', 'haizhouqu', 'hzq', '210900', '210902', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13a1b7541bf3428c9251a39755f630ad', '磁县', 'cixian', 'cx', '130400', '130427', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13a3dc8fa5b0483c9a03df4c434d9bd7', '修文县', 'xiuwenxian', 'xwx', '520100', '520123', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13a60862c3a94eafb81ac945f0079d74', '盐山县', 'yanshanxian', 'ysx', '130900', '130925', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13a863d677174421ad75bfb5234b2c1a', '文县', 'wenxian', 'wx', '621200', '621222', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13b6eb52537b4ab0a60e0066aaec95da', '市辖区', 'shixiaqu', 'sxq', '610800', '610801', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13d23d0b3c1b4c4586072cc2eb2587af', '雷州市', 'leizhoushi', 'lzs', '440800', '440882', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13db9a02242f4abc95779e647bc6b866', '临县', 'linxian', 'lx', '141100', '141124', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13e81f32e6fa48579225abe61f152179', '夏县', 'xiaxian', 'xx', '140800', '140828', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13e854a9fcb048cf80ee2495ce021dfb', '普格县', 'pugexian', 'pgx', '513400', '513428', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13f76bcbf9b9459b8cba5d308f3a420b', '志丹县', 'zhidanxian', 'zdx', '610600', '610625', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('13f9172a35be42b6965b4599403a3b93', '老河口市', 'laohekoushi', 'lhks', '420600', '420682', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('14221d25aa7f480480a9464651c7bd84', '市辖区', 'shixiaqu', 'sxq', '231100', '231101', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('143b8dc8c7f9490689071fdb1eb5b4fc', '盈江县', 'yingjiangxian', 'yjx', '533100', '533123', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('143ca2a5cbd4476599f34fdd950ffe5b', '自贡市', 'zigongshi', 'zgs', '510000', '510300', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('145391806bf34d3783777304a583c799', '贵州省', 'guizhousheng', 'gzs', '1', '520000', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('147187a5c8184750b2af4674997ca0c4', '深圳市', 'shenzhenshi', 'szs', '440000', '440300', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('14b148405a7547fc8b9c624efe64efaf', '河东区', 'hedongqu', 'hdq', '120100', '120102', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('14d10d9c0ce64647b81dcd50f3387f3b', '通榆县', 'tongyuxian', 'tyx', '220800', '220822', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('14d75ed0248f49c28b109abfe81b6865', '沭阳县', 'shuyangxian', 'syx', '321300', '321322', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('14e6a5b3910d418ca14ecfe855aad0c8', '临沂市', 'linyishi', 'lys', '370000', '371300', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('14fe5d12a5e64c168695afd139e908fb', '都安瑶族自治县', 'douanyaozuzizhixian', 'dayzzzx', '451200', '451228', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('150c37460fde4f8d96b4815395f4048e', '仙桃市', 'xiantaoshi', 'xts', '429000', '429004', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1510536a3b9541f68e88920f8f7d0c27', '商洛市', 'shangluoshi', 'sls', '610000', '611000', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15302284895040a2b0781da54bdac90f', '梁园区', 'liangyuanqu', 'lyq', '411400', '411402', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15327e13026b4441bb8078859abe8493', '门头沟区', 'mentougouqu', 'mtgq', '110100', '110109', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('153d739a27394219aba72878aa130980', '金凤区', 'jinfengqu', 'jfq', '640100', '640106', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1551ba2992284a87a43ec2f6bd219b94', '曲周县', 'quzhouxian', 'qzx', '130400', '130435', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('155319f9be274427a779d0e6a24946c3', '西盟佤族自治县', 'ximengwazuzizhixian', 'xmwzzzx', '530800', '530829', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('156b90232d424512825f61910bc4cadd', '来安县', 'laianxian', 'lax', '341100', '341122', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('157c0209b6364fad8128b87fe472f570', '皋兰县', 'gaolanxian', 'glx', '620100', '620122', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('158b53851cf84076871d18cf8af214e2', '宜城市', 'yichengshi', 'ycs', '420600', '420684', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('158c66389ccc4cb3b55ac3377a61047f', '莱阳市', 'laiyangshi', 'lys', '370600', '370682', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1592c7aad6c84109ad4e07c123140b5f', '晋宁县', 'jinningxian', 'jnx', '530100', '530122', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1595e2df761d40e8a18b92576a4fd3d2', '新城区', 'xinchengqu', 'xcq', '150100', '150102', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15b5d4aa198d4468a15d82ef5998c64f', '市辖区', 'shixiaqu', 'sxq', '330800', '330801', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15c94f42e8674e70af60b4f9d36de692', '市辖区', 'shixiaqu', 'sxq', '640300', '640301', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15dcb727c6284bd49485a4371d87f4e6', '清河县', 'qinghexian', 'qhx', '130500', '130534', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15e91039b1e44496a48b53c13a0548e8', '市辖区', 'shixiaqu', 'sxq', '510800', '510801', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15e9e311ea49426abfb4bbb61fb69808', '景泰县', 'jingtaixian', 'jtx', '620400', '620423', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('15ef2729d59b4e3ba8afcdb75eb7dcec', '富拉尔基区', 'fulaerjiqu', 'flejq', '230200', '230206', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1606539496424cc4bcc9e882a457bcb6', '威海市', 'weihaishi', 'whs', '370000', '371000', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('161a3578007643aeb4771989ba510dae', '祁连县', 'qilianxian', 'qlx', '632200', '632222', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('164545b9361b444da87d4ab30e5f87c0', '寻乌县', 'xunwuxian', 'xwx', '360700', '360734', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16643b14707644369c3c4a308f2f7281', '威信县', 'weixinxian', 'wxx', '530600', '530629', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('166fc0b9ed9a4d7eb6cedd86d059327d', '神木县', 'shenmuxian', 'smx', '610800', '610821', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('168addda0bcc435c9ebf31b8c50a5522', '万盛区', 'wanshengqu', 'wsq', '500100', '500110', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('168c9376cbe940c7b77d95c6f437e05c', '星子县', 'xingzixian', 'xzx', '360400', '360427', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16a973e457b7442982cd3a7e1ab8d33b', '市辖区', 'shixiaqu', 'sxq', '130400', '130401', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16b16aebdb934d4b8ccd0cbe78e91b35', '云霄县', 'yunxiaoxian', 'yxx', '350600', '350622', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16b235cf261e4b0db85d5f8c0d512c1d', '南溪县', 'nanxixian', 'nxx', '511500', '511522', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16b463fa70724245bcaa7283a6c93488', '奎屯市', 'kuitunshi', 'kts', '654000', '654003', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16c5ecb3cb83478f9c8e758471eb87d0', '福清市', 'fuqingshi', 'fqs', '350100', '350181', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16db33c5048941cd947c0acb055ec1a3', '向阳区', 'xiangyangqu', 'xyq', '230800', '230803', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('16f700d8b6c34cd9967bca96a12b4a9d', '市辖区', 'shixiaqu', 'sxq', '440800', '440801', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1706edf8215340b69b1728acfbd149de', '市辖区', 'shixiaqu', 'sxq', '350100', '350101', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17283502609945798a78d5ea5fbc3362', '乐陵市', 'lelingshi', 'lls', '371400', '371481', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17323e94ff934370bbd78fa4a1eacb2e', '南市区', 'nanshiqu', 'nsq', '130600', '130604', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('173ea9fcc94e4c5d8807e113742fd43f', '泾源县', 'jingyuanxian', 'jyx', '640400', '640424', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17542fbcfc9e4dc9bf7bf166a7ae9f33', '市辖区', 'shixiaqu', 'sxq', '321300', '321301', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('177947f9ed1648da9e34731ec0446e36', '噶尔县', 'gaerxian', 'gex', '542500', '542523', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('177fb68c438c4df4a73d6ee30250bc92', '市辖区', 'shixiaqu', 'sxq', '341200', '341201', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17874c2a2d724fb6b072d33797bc899b', '市辖区', 'shixiaqu', 'sxq', '130500', '130501', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('178b841246664cf39ccc237ff70fc315', '洛宁县', 'luoningxian', 'lnx', '410300', '410328', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1792bcbf30a94459aa0d51a896e1535a', '林芝地区', 'linzhidiqu', 'lzdq', '540000', '542600', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1794039a31cf432399a30b3931ee6d3b', '西华县', 'xihuaxian', 'xhx', '411600', '411622', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17a06e93075a4fcdb74129a1ac4d5785', '定日县', 'dingrixian', 'drx', '542300', '542324', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17b3b0017610432c95f9c85ddc7083cb', '金堂县', 'jintangxian', 'jtx', '510100', '510121', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17bb691a60b948059ddcbf801e488c60', '永定县', 'yongdingxian', 'ydx', '350800', '350822', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17c49954dbf04657b33d3be3a35974bc', '疏勒县', 'shulexian', 'slx', '653100', '653122', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17ccf67b4e1e40d6b07937238fafc9ec', '丹徒区', 'dantuqu', 'dtq', '321100', '321112', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17d8cb860e9449749dbb1683f6467188', '宝山区', 'baoshanqu', 'bsq', '230500', '230506', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17f18d8a76f94efa9731264876aa4c30', '阿图什市', 'atushenshi', 'atss', '653000', '653001', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('17f38e2f283c48bb899f27ed466c4990', '红旗区', 'hongqiqu', 'hqq', '410700', '410702', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('184f051ec9ea4a8590f69add7f029363', '荥阳市', 'xingyangshi', 'xys', '410100', '410182', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1855b1bc17f74a6b85c59eb8e28c436d', '饶平县', 'raopingxian', 'rpx', '445100', '445122', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1869d916cd944ed3b24872998ca3601a', '相城区', 'xiangchengqu', 'xcq', '320500', '320507', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('186a30a5ae094200ac08361abbd44ae1', '开江县', 'kaijiangxian', 'kjx', '511700', '511723', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('187811a2834e45e08b33699b8902c098', '市辖区', 'shixiaqu', 'sxq', '350700', '350701', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('187ba1f160a0409cb964d9c0b91b38a7', '麟游县', 'linyouxian', 'lyx', '610300', '610329', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('187d25047f4b47cc83e2baa232519dde', '炉霍县', 'luhuoxian', 'lhx', '513300', '513327', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1881a94af4664a7fb79abb10785640ac', '贵阳市', 'guiyangshi', 'gys', '520000', '520100', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('189214f2518d401cbbd0e43234c6064f', '岑溪市', 'cenxishi', 'cxs', '450400', '450481', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('18a6b44655ce47b3b9defc5b52150142', '武陟县', 'wuzhixian', 'wzx', '410800', '410823', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('18bdc53cccae494a8e68bde7483e6e4e', '宁城县', 'ningchengxian', 'ncx', '150400', '150429', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('18dd56b51ddb4381bae359cb70324a57', '柳北区', 'liubeiqu', 'lbq', '450200', '450205', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('18f6065c513c474c8502d59c95f07faa', '青川县', 'qingchuanxian', 'qcx', '510800', '510822', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('18fe6448495242ec921db59d02eea88a', '易门县', 'yimenxian', 'ymx', '530400', '530425', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19157d7cc9834de2af9e117e17dd3864', '武川县', 'wuchuanxian', 'wcx', '150100', '150125', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('192d6e0354eb4f9eb17130c05105501f', '新华区', 'xinhuaqu', 'xhq', '130100', '130105', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1936e22224b344028056bcba7c128636', '阿克苏地区', 'akesudiqu', 'aksdq', '650000', '652900', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('193922673f3e4cb4bf230550a289f9bf', '洞头县', 'dongtouxian', 'dtx', '330300', '330322', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1956c297a8974d6bb4a13ebc281a9bde', '湾里区', 'wanliqu', 'wlq', '360100', '360105', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('195745e82f014aefa0274132697657f7', '威县', 'weixian', 'wx', '130500', '130533', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19795c44a1ea46fe90548905f03a7585', '连云区', 'lianyunqu', 'lyq', '320700', '320703', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19946d1fee1c47d8aeaaf62219de2458', '古县', 'guxian', 'gx', '141000', '141025', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('199d669c1e364c28a88648006af44eda', '南安市', 'nananshi', 'nas', '350500', '350583', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19b5a77c0cdb40c59d462767735961d1', '永登县', 'yongdengxian', 'ydx', '620100', '620121', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19bf05511219448ba7dc3561ce539ffb', '蓬溪县', 'pengxixian', 'pxx', '510900', '510921', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19c21c874ba5478883d37c68ded96fdf', '深州市', 'shenzhoushi', 'szs', '131100', '131182', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19c9af874f3b4554a6099ba9bd46b245', '内江市', 'neijiangshi', 'njs', '510000', '511000', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19ea79509ab04dc1a29fbd2c669a5cd6', '井陉县', 'jingxingxian', 'jxx', '130100', '130121', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19eb61fdffa94827abac999058dc15cd', '宜宾市', 'yibinshi', 'ybs', '510000', '511500', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('19fda06a5a0a4d0eb58ad940cf54511f', '白山市', 'baishanshi', 'bss', '220000', '220600', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a03de87957143ccb28e417c745386db', '洮北区', 'taobeiqu', 'tbq', '220800', '220802', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a055f518c4d4eac82a4e81af801e02d', '宿松县', 'susongxian', 'ssx', '340800', '340826', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a2acdca199f4bc7b6e04d98f0405ee5', '襄汾县', 'xiangfenxian', 'xfx', '141000', '141023', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a569d0337224004918097d0f494ef9d', '双牌县', 'shuangpaixian', 'spx', '431100', '431123', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a583b62160a4822a838d24904653f34', '永宁县', 'yongningxian', 'ynx', '640100', '640121', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a60dbc8cb284527b6a719dd9ad2a2a5', '昌图县', 'changtuxian', 'ctx', '211200', '211224', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a628e3549c34235858be5c9ef075e92', '上栗县', 'shanglixian', 'slx', '360300', '360322', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a68181fbece4e78a88c8f86f0213c0e', '华蓥市', 'huayingshi', 'hys', '511600', '511681', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a6c092187874d78ba1b9ed6b1fb1f83', '禄劝彝族苗族自治县', 'luquanyizumiaozuzizhixian', 'lqyzmzzzx', '530100', '530128', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a7d373ffc994560b3bf6e927edfc4f4', '浦城县', 'puchengxian', 'pcx', '350700', '350722', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1a89dafe1d584489a0da76f07bd637ce', '衢江区', 'qujiangqu', 'qjq', '330800', '330803', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1aa7f3323ee940fa8af7d5ad0341e15b', '市辖区', 'shixiaqu', 'sxq', '371500', '371501', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1aacbd6d45f344c8bd1982abf26a3f16', '绿春县', 'lvchunxian', 'lcx', '532500', '532531', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ab0724bdbfd47318745cf766fbd6d1b', '临潭县', 'lintanxian', 'ltx', '623000', '623021', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ab2091a72e442f7b9223b002b7e1e0e', '漠河县', 'mohexian', 'mhx', '232700', '232723', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1abc4a35c5bb47b4be3f38b477863784', '鲁山县', 'lushanxian', 'lsx', '410400', '410423', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1abed1bf6dbd4bfaaec9080c7ca4ebb7', '庆云县', 'qingyunxian', 'qyx', '371400', '371423', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b096420cb494841b480b71aa9096a06', '历下区', 'lixiaqu', 'lxq', '370100', '370102', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b23d8317f114be8bdba39996550fd04', '秦安县', 'qinanxian', 'qax', '620500', '620522', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b39f2371d434bb5bf27cfa933d4d35b', '灵台县', 'lingtaixian', 'ltx', '620800', '620822', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b4b6edba7a64f0eb200aab5e2b23f9d', '平坝县', 'pingbaxian', 'pbx', '520400', '520421', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b4cda3de0cf441f8351bc4057eb5706', '敦煌市', 'dunhuangshi', 'dhs', '620900', '620982', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b4f2f09e8424d8a91e5fde27571e199', '麻江县', 'majiangxian', 'mjx', '522600', '522635', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b57e3d9e6834b2cae2afda166f9b599', '工布江达县', 'gongbujiangdaxian', 'gbjdx', '542600', '542622', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1b8941a477c04bca91d5632e2f7da153', '江源区', 'jiangyuanqu', 'jyq', '220600', '220605', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1bb13a56205e461fb49eb3b8ab5816fe', '江华瑶族自治县', 'jianghuayaozuzizhixian', 'jhyzzzx', '431100', '431129', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1bb338c896954e9a8a1c2844882117ac', '勐海县', 'menghaixian', 'mhx', '532800', '532822', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1bb67d90191240e3b7fb48b48d2006b1', '大兴区', 'daxingqu', 'dxq', '110100', '110115', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1be9df93460745098a53b00e7578c400', '南郊区', 'nanjiaoqu', 'njq', '140200', '140211', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1bfc935d8924419b930604df1dd661b9', '卢龙县', 'lulongxian', 'llx', '130300', '130324', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c12691711014bf79b7758dd72e16a5b', '市辖区', 'shixiaqu', 'sxq', '610300', '610301', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c25a2d6b4734c57b3b6d97452cfcc08', '洛龙区', 'luolongqu', 'llq', '410300', '410311', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c2c782670294944900d1f84044df6b5', '四川省', 'sichuansheng', 'scs', '1', '510000', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c314a652b2f4748855b14ca4d0814c0', '巧家县', 'qiaojiaxian', 'qjx', '530600', '530622', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c35d76c2aae46bd82fa8c15481557f8', '湛河区', 'zhanhequ', 'zhq', '410400', '410411', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c35e62272484112bd5d23d3c14a472a', '东营区', 'dongyingqu', 'dyq', '370500', '370502', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c6fea7b8d1f44aa879e41c5496d718b', '兴隆县', 'xinglongxian', 'xlx', '130800', '130822', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c73dd7dd82748e28dc121940e7396ae', '朝阳区', 'chaoyangqu', 'cyq', '220100', '220104', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c75ed0351164a49bfb67af446cd67bb', '临桂县', 'linguixian', 'lgx', '450300', '450322', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1c79948dd7c247569c4aea1f2fd04fb5', '凭祥市', 'pingxiangshi', 'pxs', '451400', '451481', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1cacb8f536d54e1e9e1e25e20c8ccdc7', '市辖区', 'shixiaqu', 'sxq', '321100', '321101', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1cae0488e3cd415d9c1a101890f0699c', '全椒县', 'quanjiaoxian', 'qjx', '341100', '341124', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1cb0d191ff2b4afe987f129b720404a3', '东陵区', 'donglingqu', 'dlq', '210100', '210112', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1cb3769fb18a434d8a30e68d9127a727', '通许县', 'tongxuxian', 'txx', '410200', '410222', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1cc2b1c8e1cd411bada396441fd3491b', '崇阳县', 'chongyangxian', 'cyx', '421200', '421223', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ccc41ca0bf44ff0a971e094793ec5b0', '山亭区', 'shantingqu', 'stq', '370400', '370406', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1cedd13ba52e435f9f095d7c9ca74b0e', '连江县', 'lianjiangxian', 'ljx', '350100', '350122', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1cfab2373fb94977b29c743fa7c8434f', '涞水县', 'laishuixian', 'lsx', '130600', '130623', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1d52067dedf046c0aac776a7326d336a', '市辖区', 'shixiaqu', 'sxq', '610500', '610501', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1d80e82e62554882b70c0e6b0eb60306', '凉山彝族自治州', 'liangshanyizuzizhizhou', 'lsyzzzz', '510000', '513400', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1d860c19540f410ba5ec169754ea83ea', '蠡县', 'lixian', 'lx', '130600', '130635', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1d9fe4cacbac4bfc9dc7086fad000767', '海北藏族自治州', 'haibeicangzuzizhizhou', 'hbczzzz', '630000', '632200', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1da3b818a7744340a0a3d83796d7e6e6', '黟县', 'yixian', 'yx', '341000', '341023', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1da963a4b0454088827c003a3fe174c9', '市辖区', 'shixiaqu', 'sxq', '220400', '220401', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ddda00783904be083fa38b23832ebab', '吴桥县', 'wuqiaoxian', 'wqx', '130900', '130928', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1e2a995e74544724a73dade16a9020f7', '拜城县', 'baichengxian', 'bcx', '652900', '652926', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1e346a7c70ec4d299d718d2503c49259', '市辖区', 'shixiaqu', 'sxq', '141100', '141101', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1e3eb8866f10475bbee701288044eeb4', '伊春区', 'yichunqu', 'ycq', '230700', '230702', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1e53053f8b774fd38ec04a5aa8555385', '惠来县', 'huilaixian', 'hlx', '445200', '445224', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1e7b4e6c1a594542bac90c7076a5f479', '北戴河区', 'beidaihequ', 'bdhq', '130300', '130304', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ea785a8358045c9a39751c00557a248', '沁阳市', 'qinyangshi', 'qys', '410800', '410882', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1eb2bb022ab548a38aef5390ec2b2087', '安义县', 'anyixian', 'ayx', '360100', '360123', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ebcac391f5a426884b112bb4ba65802', '市辖区', 'shixiaqu', 'sxq', '370900', '370901', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ec3b4071b8b4b579219a720f8006836', '洛隆县', 'luolongxian', 'llx', '542100', '542132', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ee9bd368700447ca40fafe0b96ff1e3', '根河市', 'genheshi', 'ghs', '150700', '150785', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ef124348acd44f4bae84d90181cd025', '休宁县', 'xiuningxian', 'xnx', '341000', '341022', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1ef465dc7e9949c5b17432e82444e2c8', '墨江哈尼族自治县', 'mojianghanizuzizhixian', 'mjhnzzzx', '530800', '530822', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f08a2d56ee443028c80c80ffb152f33', '富平县', 'fupingxian', 'fpx', '610500', '610528', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f188809c20d48b98a27dbbeefe905e8', '潜江市', 'qianjiangshi', 'qjs', '429000', '429005', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f2b5c4c7aea4e51b0a5548e661aa075', '乌拉特中旗', 'wulatezhongqi', 'wltzq', '150800', '150824', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f2f018f50774bb892c9b611b476c98c', '马边彝族自治县', 'mabianyizuzizhixian', 'mbyzzzx', '511100', '511133', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f433887e2d646a19f74de69b2784fa6', '市辖区', 'shixiaqu', 'sxq', '341500', '341501', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f52a9deb1b143b496147fc1fac0d21c', '新县', 'xinxian', 'xx', '411500', '411523', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f54b1fa2f2a40dcabf5f93e69039da5', '任丘市', 'renqiushi', 'rqs', '130900', '130982', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f739e51737646ec8ea5e765184523ab', '郎溪县', 'langxixian', 'lxx', '341800', '341821', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1f9af1a51a2e40da90c3c8105c12a473', '重庆市', 'chongqingshi', 'cqs', '1', '500000', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('1fde68ffad2f4c97b9f320d3f7c37ab6', '临清市', 'linqingshi', 'lqs', '371500', '371581', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('201b71f751124272bd314dcf4f0f6b08', '顺庆区', 'shunqingqu', 'sqq', '511300', '511302', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('203a9dea8c0c40a0a9882c92f97fd7dd', '都昌县', 'douchangxian', 'dcx', '360400', '360428', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('204cc3356e78458dbfe03a4b8e06a4d4', '全州县', 'quanzhouxian', 'qzx', '450300', '450324', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2052376c67e949a5bbb885de1510a247', '双台子区', 'shuangtaiziqu', 'stzq', '211100', '211102', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2055dacb6dd245df8386761c723322c4', '周口市', 'zhoukoushi', 'zks', '410000', '411600', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('20648e8158f341cea108e4320dbb2fc7', '富裕县', 'fuyuxian', 'fyx', '230200', '230227', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('206803b0b95b47ccadc0d51d9f09d599', '曲麻莱县', 'qumalaixian', 'qmlx', '632700', '632726', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2089f88cce0e409e9c6b8d6a042aa7c6', '尼木县', 'nimuxian', 'nmx', '540100', '540123', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('209650a1660e40ba91e79527ffbc4ed8', '正定县', 'zhengdingxian', 'zdx', '130100', '130123', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('20967a14c33047aa963c0510b5104ae1', '桦南县', 'huananxian', 'hnx', '230800', '230822', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('20dcdd14ba41404c9cf2470cb6957d6c', '资源县', 'ziyuanxian', 'zyx', '450300', '450329', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('211a10c1afbb4700a8770d35214fffbc', '白城市', 'baichengshi', 'bcs', '220000', '220800', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('211b2ce9454446649a8b34649eb30f36', '石鼓区', 'shiguqu', 'sgq', '430400', '430407', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('21267d90a13f405eb3d017e5d96ff0af', '桃山区', 'taoshanqu', 'tsq', '230900', '230903', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2126e4a1e2a74db88b174f4925b57d02', '市南区', 'shinanqu', 'snq', '370200', '370202', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2128fc6e574e4c7eaa610f8537c5c5b7', '六枝特区', 'liuzhitequ', 'lztq', '520200', '520203', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('213a180874af44b9b0a8be9e5cf89dac', '长洲区', 'changzhouqu', 'czq', '450400', '450405', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2149e2f9afd2477ba336cb06967a5d2c', '连南瑶族自治县', 'liannanyaozuzizhixian', 'lnyzzzx', '441800', '441826', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('21528ad5456f4e8baa2feed0fe59de80', '中站区', 'zhongzhanqu', 'zzq', '410800', '410803', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('21610a2df9094eb4a5467e586198eb1a', '芦山县', 'lushanxian', 'lsx', '511800', '511826', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('217c4b27e9ab48a6ab2e748fc07a0d29', '德阳市', 'deyangshi', 'dys', '510000', '510600', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('217f3df297d9413b91d9539f473c7de8', '岷县', 'minxian', 'mx', '621100', '621126', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('218d46127bac4008bc1471d117691970', '晋安区', 'jinanqu', 'jaq', '350100', '350111', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('219b2fe986984eb08d10ce9ff602a100', '防城港市', 'fangchenggangshi', 'fcgs', '450000', '450600', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('21b04f050b3c41f3a8c1c726cd2cceb1', '海口市', 'haikoushi', 'hks', '460000', '460100', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('21b573c400ea4c4289409e178dd8e514', '开县', 'kaixian', 'kx', '500200', '500234', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('21cc5bc7efe04de6b9f173da9ab1c9b5', '盐城市', 'yanchengshi', 'ycs', '320000', '320900', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('21e4083ce64945e4b5ce087480c13241', '广水市', 'guangshuishi', 'gss', '421300', '421381', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2206ace26bea472c9f2c1421d9a12541', '芙蓉区', 'furongqu', 'frq', '430100', '430102', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('221dcfddb94f4bccb2688563eaa1f8d7', '江安县', 'jianganxian', 'jax', '511500', '511523', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('22238767854a4de397eee9590523410c', '高港区', 'gaogangqu', 'ggq', '321200', '321203', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('222bc26d95e74185a9a2f1701da2e1eb', '喀喇沁左翼蒙古族自治县', 'kalaqinzuoyimengguzuzizhixian', 'klqzymgzzzx', '211300', '211324', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2258902b1d404e8ebd7e4ee0e1d2213f', '谢家集区', 'xiejiajiqu', 'xjjq', '340400', '340404', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2282269d1efb462b9776d3405baa0e84', '隆林各族自治县', 'longlingezuzizhixian', 'llgzzzx', '451000', '451031', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('22a0b0a497ea44c181b64e091e08baf2', '邓州市', 'dengzhoushi', 'dzs', '411300', '411381', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('22b482c5535b4330908d710adc4782ec', '阿里地区', 'alidiqu', 'aldq', '540000', '542500', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('22b9037957a04f6dbf527f2f9a144cbb', '盘锦市', 'panjinshi', 'pjs', '210000', '211100', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('22d2289647874c5db9c687f6c5e4efd3', '阜平县', 'fupingxian', 'fpx', '130600', '130624', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('22f705f9874941619037e6bb20cb0c77', '太湖县', 'taihuxian', 'thx', '340800', '340825', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('22ffa816cc6f43f6841162ba2620e93b', '峰峰矿区', 'fengfengkuangqu', 'ffkq', '130400', '130406', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('230b4383d90240eaacd2c4e9c0123e26', '崇明县', 'chongmingxian', 'cmx', '310200', '310230', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('231ec845b8b648929cab68f3c7d80ef1', '永兴县', 'yongxingxian', 'yxx', '431000', '431023', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('232ed7ad3b3e48f2abbb89986ec3a44b', '太仓市', 'taicangshi', 'tcs', '320500', '320585', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2330229e4a664db1a8f3a76c9c5dd484', '市辖区', 'shixiaqu', 'sxq', '410600', '410601', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('233ae906df104ebea85ee72ccf41d334', '扶沟县', 'fugouxian', 'fgx', '411600', '411621', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('235a9f8da8614cfc9c95a465490afe92', '简阳市', 'jianyangshi', 'jys', '512000', '512081', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('23aea3f1432144f58d84ffee4c9542c1', '武安市', 'wuanshi', 'was', '130400', '130481', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('23d9546d39c84fc09d55149a04904f4c', '通渭县', 'tongweixian', 'twx', '621100', '621121', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('23e6004be866489d8c5003689f1b138f', '南通市', 'nantongshi', 'nts', '320000', '320600', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('23e9c59ef9f2453cb2d36f4896405703', '市辖区', 'shixiaqu', 'sxq', '211400', '211401', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('23f5a450580b44eb873711595021abf7', '市辖区', 'shixiaqu', 'sxq', '421300', '421301', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24208888f078406fb48cca096b4dfddf', '灵璧县', 'lingbixian', 'lbx', '341300', '341323', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('242e58f399fb443f9a4c7fb5473e4d90', '东明县', 'dongmingxian', 'dmx', '371700', '371728', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('244d58d0fd1d450588c68cbce4238d0b', '白沙黎族自治县', 'baishalizuzizhixian', 'bslzzzx', '469000', '469025', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('244f1a35840a4dd8ad0c8fe04d53efc6', '琅琊区', 'langyaqu', 'lyq', '341100', '341102', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('247429ae4be2458e86e094d7971cdbd4', '上城区', 'shangchengqu', 'scq', '330100', '330102', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('247ab164f42040b783b1275107c3aae0', '铅山县', 'qianshanxian', 'qsx', '361100', '361124', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24a419a7a6444c488385bc316558cd97', '信州区', 'xinzhouqu', 'xzq', '361100', '361102', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24adedc08428456fb0134f7f1ad2d5b9', '义县', 'yixian', 'yx', '210700', '210727', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24b0b734431b44da94faa8c3a447d053', '榆树市', 'yushushi', 'yss', '220100', '220182', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24b43e472ff146938e4cb18dbcc956f7', '前郭尔罗斯蒙古族自治县', 'qianguoerluosimengguzuzizhixian', 'qgelsmgzzzx', '220700', '220721', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24c715dd1af54c6ab0be1643a4a5a695', '永昌县', 'yongchangxian', 'ycx', '620300', '620321', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24de97f99f8345a3a3c08ee20f62ed05', '莫力达瓦达斡尔族自治旗', 'molidawadawoerzuzizhiqi', 'mldwdwezzzq', '150700', '150722', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24df2ea4f7684a699800a2efd730e43a', '顺义区', 'shunyiqu', 'syq', '110100', '110113', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24e8eb363b1e46658b54c7e8b2376967', '大武口区', 'dawukouqu', 'dwkq', '640200', '640202', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24f4109d06884670aa7e883f3eb1dec3', '舒兰市', 'shulanshi', 'sls', '220200', '220283', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('24f4d9681bc04fb19f007f156af9bd5d', '玉屏侗族自治县', 'yupingdongzuzizhixian', 'ypdzzzx', '522200', '522223', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('251994e3023c4451ba55856179a1b286', '永新县', 'yongxinxian', 'yxx', '360800', '360830', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('251b928c8455459fb3468f0d56202cca', '名山县', 'mingshanxian', 'msx', '511800', '511821', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2532294d709940a589843d324e45bd71', '五家渠市', 'wujiaqushi', 'wjqs', '659000', '659004', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('25408f2123504caea8925abd818c70c8', '澄海区', 'chenghaiqu', 'chq', '440500', '440515', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('255c563caa0f485ba6e736bf6a7c16b8', '南浔区', 'nanxunqu', 'nxq', '330500', '330503', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('257568b7ef5b4ce085e0a03fbfbc0695', '贡觉县', 'gongjuexian', 'gjx', '542100', '542123', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('257f8e7f6e3b4f8c81000667c0640e6f', '上饶县', 'shangraoxian', 'srx', '361100', '361121', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('25808342699a4f99a6113a23b8e5c267', '武进区', 'wujinqu', 'wjq', '320400', '320412', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('25a47f15966e4085bf573758c0a0b2fe', '察哈尔右翼前旗', 'chahaeryouyiqianqi', 'cheyyqq', '150900', '150926', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('25d387e74aea44ae810b4a497c5f551b', '市辖区', 'shixiaqu', 'sxq', '210500', '210501', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('25e14f86c4944693b82c097a226e4a4a', '头屯河区', 'toutunhequ', 'tthq', '650100', '650106', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('25e81497816a4834a9b8004f8316135e', '新宁县', 'xinningxian', 'xnx', '430500', '430528', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26055e6a47cc423c83e09d8e8831d44e', '岢岚县', 'kelanxian', 'klx', '140900', '140929', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('260aa7f2162b448487621df177f3830d', '甘肃省', 'gansusheng', 'gss', '1', '620000', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('260c14623ee54dd89052fe8397fe3e89', '萨迦县', 'sajiaxian', 'sjx', '542300', '542325', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('260c64c8e5594c019ca750e90ec77b49', '赞皇县', 'zanhuangxian', 'zhx', '130100', '130129', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('260f4f2247034447ad235f576df8160d', '洛川县', 'luochuanxian', 'lcx', '610600', '610629', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26105878cfbc4a8892ad42b9e765c32e', '金山屯区', 'jinshantunqu', 'jstq', '230700', '230709', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('261532adf02c49949a195d1235e8fa82', '潮安县', 'chaoanxian', 'cax', '445100', '445121', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2643b9d1fe304cc0a09b8cd72c2b21c8', '市辖区', 'shixiaqu', 'sxq', '410300', '410301', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26642e9d98174ceb85e42f128f18fd17', '市辖区', 'shixiaqu', 'sxq', '451100', '451101', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2681da4077e64dbb83a723bca0bdfda8', '市辖区', 'shixiaqu', 'sxq', '610900', '610901', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26878167aba64bd788802a4de4b1c9f7', '兴宁区', 'xingningqu', 'xnq', '450100', '450102', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('268c39ee3306450da9b2030fa1d48230', '陆丰市', 'lufengshi', 'lfs', '441500', '441581', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('268ebaf6b40d4af4943313699d5e67ed', '襄垣县', 'xiangyuanxian', 'xyx', '140400', '140423', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('269a4da208614e0e9509e4fbd703112f', '市辖区', 'shixiaqu', 'sxq', '511000', '511001', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26ca7260c0a045d6aeaf8e9516110a11', '揭东县', 'jiedongxian', 'jdx', '445200', '445221', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26d689d5b0504a988dec1758c366a54d', '红原县', 'hongyuanxian', 'hyx', '513200', '513233', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26d946c5929b47868ee1b80c3e85bc68', '高碑店市', 'gaobeidianshi', 'gbds', '130600', '130684', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26e24c1de5534e9c8c1af11c0638bd0c', '市辖区', 'shixiaqu', 'sxq', '211200', '211201', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('26e8562560794e24840067cc683a3477', '葫芦岛市', 'huludaoshi', 'hlds', '210000', '211400', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27050d4a573840afb5ec54085ac3976f', '巴中市', 'bazhongshi', 'bzs', '510000', '511900', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('270c512ee1cd45498e20df23b62a56cc', '五华区', 'wuhuaqu', 'whq', '530100', '530102', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2712b4edee1b4b0b9cfe224cf959b311', '江永县', 'jiangyongxian', 'jyx', '431100', '431125', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('272406c4ad5846dba15dccee72aae406', '莒南县', 'junanxian', 'jnx', '371300', '371327', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2739e2a8e18444cbbf0e5d4525d4789d', '寿光市', 'shouguangshi', 'sgs', '370700', '370783', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27631720cde74644a5d479dd8171a4d9', '江油市', 'jiangyoushi', 'jys', '510700', '510781', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27783c553b714941986e476769c459e7', '市辖区', 'shixiaqu', 'sxq', '445200', '445201', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('277a4446471947db831d69bfbe136607', '罗田县', 'luotianxian', 'ltx', '421100', '421123', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27a6897e84be4c79b17b2ee63887250d', '甘谷县', 'ganguxian', 'ggx', '620500', '620523', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27c75ec9c96c429d9939afd722aa439f', '胶南市', 'jiaonanshi', 'jns', '370200', '370284', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27c87eea93964997a7746918f0b9f880', '天峨县', 'tianexian', 'tex', '451200', '451222', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27d960a122c24ec59051548761479f33', '兴隆台区', 'xinglongtaiqu', 'xltq', '211100', '211103', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27e1a70cc71648c2b1c9043771412034', '西工区', 'xigongqu', 'xgq', '410300', '410303', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('27e68ea494e047638df3a34f92d7cce6', '德惠市', 'dehuishi', 'dhs', '220100', '220183', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2801eec39ff34dcc8d9911cd9ae0ae7d', '万山特区', 'wanshantequ', 'wstq', '522200', '522230', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('28138c92846940acb0b94ea44f179357', '鹿寨县', 'luzhaixian', 'lzx', '450200', '450223', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('28313f5576de4d41baeb2be65ca6026b', '大邑县', 'dayixian', 'dyx', '510100', '510129', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('284fb809596c4bc3a6d38784443d195f', '秀洲区', 'xiuzhouqu', 'xzq', '330400', '330411', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('28637a2ddeea4cd6b31bd65e46238731', '当涂县', 'dangtuxian', 'dtx', '340500', '340521', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('286cfd1c3f964451935911cae1a97897', '龙岩市', 'longyanshi', 'lys', '350000', '350800', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('28ceab72cd024beca9145aff82fd406b', '新抚区', 'xinfuqu', 'xfq', '210400', '210402', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('28dc04bf67de417f8d073a2ce426368e', '赤壁市', 'chibishi', 'cbs', '421200', '421281', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('28ea12c0ebe841f7b25a4c3353f8ec79', '市辖区', 'shixiaqu', 'sxq', '230900', '230901', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2904e2c509134f05a1bac46ef2f9d33a', '市辖区', 'shixiaqu', 'sxq', '220800', '220801', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('291c0f0e778544c89e393c369af483d5', '琼结县', 'qiongjiexian', 'qjx', '542200', '542225', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29228f65b0134aae83a6eea118b9a83e', '沙依巴克区', 'shayibakequ', 'sybkq', '650100', '650103', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29896ce5f8b044cc9756c0f3c64f2427', '良庆区', 'liangqingqu', 'lqq', '450100', '450108', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2994fc118049459ea6b7a98016edca34', '五台县', 'wutaixian', 'wtx', '140900', '140922', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29975dfb5a3a42a5bd6c896e4359bd9b', '江山市', 'jiangshanshi', 'jss', '330800', '330881', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29997d39ec8f466e8e070ab2b09ea02a', '如东县', 'rudongxian', 'rdx', '320600', '320623', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('299ea4c9912445e883c4af449004b03a', '保山市', 'baoshanshi', 'bss', '530000', '530500', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29a3b61f5b2c4533bd99ebb278fcd930', '应县', 'yingxian', 'yx', '140600', '140622', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29a61918233d43a19f71d5690f59ef56', '肥城市', 'feichengshi', 'fcs', '370900', '370983', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29afdbba185e46cb84a8153d08560cfb', '钟楼区', 'zhonglouqu', 'zlq', '320400', '320404', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29cc0e06a2544bb680a4c32a8ca57f18', '侯马市', 'houmashi', 'hms', '141000', '141081', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29ccb797173d43049086bbed136cb3d9', '武乡县', 'wuxiangxian', 'wxx', '140400', '140429', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29e7d3672bae4ffbab16ffdbcc3c5dcb', '杏花岭区', 'xinghualingqu', 'xhlq', '140100', '140107', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29edad7bbee04ba880b775493ffe573c', '丰满区', 'fengmanqu', 'fmq', '220200', '220211', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('29fefa07fe7f40deaec9d22bba61231b', '盐津县', 'yanjinxian', 'yjx', '530600', '530623', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a053fa615134ba99d53370135045dd3', '长汀县', 'changtingxian', 'ctx', '350800', '350821', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a112a2f94b44067998cf1c687af7eee', '南宁市', 'nanningshi', 'nns', '450000', '450100', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a147ff1878d4feba46c9dded530acc6', '平顶山市', 'pingdingshanshi', 'pdss', '410000', '410400', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a31ae6507db4ba4ae80f219800245ef', '富川瑶族自治县', 'fuchuanyaozuzizhixian', 'fcyzzzx', '451100', '451123', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a3aaf2c171b4a13b01e1dfa75871161', '杨浦区', 'yangpuqu', 'ypq', '310100', '310110', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a535826ea804bce94c69247b9725934', '古蔺县', 'gulinxian', 'glx', '510500', '510525', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a708c7c88ec4450854d5bf040a55fcc', '陇西县', 'longxixian', 'lxx', '621100', '621122', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a72d7a7e02b4d179b1d42caffcd2712', '新邵县', 'xinshaoxian', 'xsx', '430500', '430522', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a742dd27e49409ba37d2172caf18e5c', '靖边县', 'jingbianxian', 'jbx', '610800', '610824', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a76237098674d20a9f6cda9716ede20', '腾冲县', 'tengchongxian', 'tcx', '530500', '530522', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a8018af5fd049a9800ca45419d7d657', '邱县', 'qiuxian', 'qx', '130400', '130430', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a820ef25a434f46a9af3e55985b865a', '市辖区', 'shixiaqu', 'sxq', '341400', '341401', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a887b5da83d4801b6886eef112a6ef4', '洪山区', 'hongshanqu', 'hsq', '420100', '420111', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2a9929b33b404d74ae778e689873005d', '金坛市', 'jintanshi', 'jts', '320400', '320482', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2aabb56f602d43bf965dca324040fb50', '平谷区', 'pingguqu', 'pgq', '110100', '110117', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ad921fec9b04b9e936a0c856e424277', '杂多县', 'zaduoxian', 'zdx', '632700', '632722', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ae2b976876b4a26b6e895ccebeb7001', '淇滨区', 'qibinqu', 'qbq', '410600', '410611', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2af9340912a0460386a1da5bffe61a39', '铁西区', 'tiexiqu', 'txq', '210100', '210106', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b1445b558714d7697c9a805630f36d6', '淮南市', 'huainanshi', 'hns', '340000', '340400', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b1af02ac3ed4886bf3773e6aa4acede', '抚顺市', 'fushunshi', 'fss', '210000', '210400', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b25803b799042058deef75f62e21aef', '孝义市', 'xiaoyishi', 'xys', '141100', '141181', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b38f1523d23432598fb781dcb9689b9', '回民区', 'huiminqu', 'hmq', '150100', '150103', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b71bab534e54aa38c4d345635828a3f', '汤旺河区', 'tangwanghequ', 'twhq', '230700', '230712', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b79cb17e37b454b87861f6b37930037', '市辖区', 'shixiaqu', 'sxq', '640100', '640101', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b8432c6c8f14c3a96f84279ccd699fe', '英吉沙县', 'yingjishaxian', 'yjsx', '653100', '653123', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2b8962722a2e46bbb67a2c2b2bd20e53', '囊谦县', 'nangqianxian', 'nqx', '632700', '632725', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2bc84c843c1a445497c2ee0a0a7dbe99', '夏津县', 'xiajinxian', 'xjx', '371400', '371427', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2bd8db44dd2c407885c26be6d1e7ce26', '怒江傈僳族自治州', 'nujianglisuzuzizhizhou', 'njlszzzz', '530000', '533300', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2be5b95fbbb64f05bb6a4880571ba6dc', '宿豫区', 'suyuqu', 'syq', '321300', '321311', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c0b400414c34e11b5af36dd9cee1de2', '市辖区', 'shixiaqu', 'sxq', '130300', '130301', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c0d51c07e9b43c799e67d3d4dced248', '潢川县', 'huangchuanxian', 'hcx', '411500', '411526', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c15c2bcfb7f49dfbe4667dfa45c3a5a', '浦江县', 'pujiangxian', 'pjx', '330700', '330726', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c24b1427f6d41d1bed39b5ae7d7c8b2', '固始县', 'gushixian', 'gsx', '411500', '411525', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c24c50dc97f4813bc66adee22358101', '五华县', 'wuhuaxian', 'whx', '441400', '441424', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c55d5931a0541baaf548bf0fdac61ea', '汤原县', 'tangyuanxian', 'tyx', '230800', '230828', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c686ff5a037484ba2acdc5a999f1e9e', '锦江区', 'jinjiangqu', 'jjq', '510100', '510104', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2c77b3c9b5ef4c51b9a3b5d28948d1a0', '康乐县', 'kanglexian', 'klx', '622900', '622922', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ca1b78d9a884b4994d413040c6d9f03', '宾县', 'binxian', 'bx', '230100', '230125', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2cc1d6fc0d7b4a01a7b683d497da98bf', '鸡冠区', 'jiguanqu', 'jgq', '230300', '230302', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2cce63ed8e824d59bedb4ddc0bd8171a', '芦溪县', 'luxixian', 'lxx', '360300', '360323', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2cd057a9e9064783b678351a38a25195', '黄山市', 'huangshanshi', 'hss', '340000', '341000', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ce3ee7e4d2d4471b97244f2766ce2ff', '桐梓县', 'tongzixian', 'tzx', '520300', '520322', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2cebdecf3eae429ebb4d6c91a05ce635', '吉木乃县', 'jimunaixian', 'jmnx', '654300', '654326', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2d2812f551f9474b946b77130289386d', '嵩明县', 'songmingxian', 'smx', '530100', '530127', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2d2df9b76f314ef896f79c7695727e65', '雁塔区', 'yantaqu', 'ytq', '610100', '610113', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2d5dd4404a334896a47b3c2799ad018f', '伊川县', 'yichuanxian', 'ycx', '410300', '410329', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2d781ff8797a49558e59b22c65c2a871', '沁水县', 'qinshuixian', 'qsx', '140500', '140521', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2d89a026d571402e8d9f4a94fa986a2f', '老城区', 'laochengqu', 'lcq', '410300', '410302', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2d8bc4025add4b9bbeb05bdba771145a', '铜川市', 'tongchuanshi', 'tcs', '610000', '610200', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2d96d2b8cfb94cc1a91bc5f7565831e9', '昌江区', 'changjiangqu', 'cjq', '360200', '360202', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2da47afedac7420f903c11a256f7113d', '酒泉市', 'jiuquanshi', 'jqs', '620000', '620900', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2db5da9d204c48fca8a88372e1bcceb3', '浚县', 'junxian', 'jx', '410600', '410621', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2dccef0d5d4647adbacce60d8a317442', '雅安市', 'yaanshi', 'yas', '510000', '511800', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2dd6a6b54a29483dbe7f6452fcbbf30c', '宁江区', 'ningjiangqu', 'njq', '220700', '220702', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2dddafcda0e443ed8ca3590f45095307', '乌尔禾区', 'wuerhequ', 'wehq', '650200', '650205', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2e449269218e4f4189a2f631113ad884', '宛城区', 'wanchengqu', 'wcq', '411300', '411302', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2e488857e3ad4caead5a28352ed16f1e', '乃东县', 'naidongxian', 'ndx', '542200', '542221', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2e75469dd34e43ef8acef8992ad35173', '怀安县', 'huaianxian', 'hax', '130700', '130728', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2e81f61256a2495e9bceeaaf2e9de1ca', '城固县', 'chengguxian', 'cgx', '610700', '610722', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2e9c17bbc84d4841aab29034fc4cadfb', '安宁市', 'anningshi', 'ans', '530100', '530181', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ea296683200481d8378bb199f0faa6c', '二七区', 'erqiqu', 'eqq', '410100', '410103', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2eb09faf21a3419e881e5ddfa24e7833', '鸡西市', 'jixishi', 'jxs', '230000', '230300', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ec224c7b51f4a55952c627949d5d7b4', '隆昌县', 'longchangxian', 'lcx', '511000', '511028', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ec41284e86a4b6ca0c26a50d31cdec5', '滁州市', 'chuzhoushi', 'czs', '340000', '341100', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2ee5560a1d8d4e6aa740a1b369eff66e', '市辖区', 'shixiaqu', 'sxq', '320500', '320501', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f2314586a2e498aabbcb1e40ed3965b', '德江县', 'dejiangxian', 'djx', '522200', '522227', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f275c47da524440941447f785803e55', '金门县', 'jinmenxian', 'jmx', '350500', '350527', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f3df47b9fe649a9ad96d78149b45db3', '新巴尔虎右旗', 'xinbaerhuyouqi', 'xbehyq', '150700', '150727', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f57804619654f11a7a89c008ef78538', '湘潭县', 'xiangtanxian', 'xtx', '430300', '430321', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f5d43bf5f684104b963137abcd40cf0', '祁阳县', 'qiyangxian', 'qyx', '431100', '431121', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f65e6df0b7341109a9601dd32ebdb79', '市辖区', 'shixiaqu', 'sxq', '441200', '441201', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f674228143a49afb5a6ece75296a9dd', '楚雄市', 'chuxiongshi', 'cxs', '532300', '532301', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f7208f5c5c946c9a3ab70eb514874d8', '民勤县', 'minqinxian', 'mqx', '620600', '620621', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f91576f0da944eab6dbe52fe39e8080', '布尔津县', 'buerjinxian', 'bejx', '654300', '654321', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2f9692ef15ed4fc384fce08065c432c0', '酉阳土家族苗族自治县', 'youyangtujiazumiaozuzizhixian', 'yytjzmzzzx', '500200', '500242', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2facac4716b24b31abc4e6c93c5a4fd6', '海港区', 'haigangqu', 'hgq', '130300', '130302', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2fb6bc29425c4aeeba5121942427252f', '金川区', 'jinchuanqu', 'jcq', '620300', '620302', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2fc27b983b354293930a336e41520d8c', '莱山区', 'laishanqu', 'lsq', '370600', '370613', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2fd07ea3b7764b6fbb3287c32513ea0c', '九台市', 'jiutaishi', 'jts', '220100', '220181', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('2fd53c1860644611897cbce2fbcee0ac', '卓尼县', 'zhuonixian', 'znx', '623000', '623022', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('301c04da211343d6878e9c8b0fe74f95', '淮阴区', 'huaiyinqu', 'hyq', '320800', '320804', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3045fb650148448aa536d51fc3604666', '宁武县', 'ningwuxian', 'nwx', '140900', '140925', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('305920db291440c3b5b22c1bac9c4138', '金口河区', 'jinkouhequ', 'jkhq', '511100', '511113', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('305cce6907fd4eb098eae4b8f9d90eb7', '梧州市', 'wuzhoushi', 'wzs', '450000', '450400', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('305dff96709644788400fde97d3e6244', '垣曲县', 'yuanquxian', 'yqx', '140800', '140827', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3065ad0f14aa44a7af221cb60bf83e88', '北塔区', 'beitaqu', 'btq', '430500', '430511', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3072a1f3c18145ab8be9c01d9cd01688', '铁岭县', 'tielingxian', 'tlx', '211200', '211221', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3074de71c97e4f498054e6212d635700', '保定市', 'baodingshi', 'bds', '130000', '130600', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('30838468aa6e43ffb6db07857094d3e7', '岑巩县', 'cengongxian', 'cgx', '522600', '522626', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('30951dea1cae4ad7b031f35a718cedda', '平湖市', 'pinghushi', 'phs', '330400', '330482', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3096fdb2131c4f4980ec0d3f3b833708', '鲤城区', 'lichengqu', 'lcq', '350500', '350502', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('309e57c70e7944e8ad1c46c84692f59d', '正宁县', 'zhengningxian', 'znx', '621000', '621025', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('30aa9626fc27494181debfda9ddf3cf1', '市辖区', 'shixiaqu', 'sxq', '371300', '371301', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('30c068acbc0a4fe29c13e66bb6efa8c8', '原平市', 'yuanpingshi', 'yps', '140900', '140981', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('30c94e3a04634278919216c07ac00e2d', '蒸湘区', 'zhengxiangqu', 'zxq', '430400', '430408', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('30da66be701b457bbe7dd3ff800666e2', '开化县', 'kaihuaxian', 'khx', '330800', '330824', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('30e8d2b965b947f1b6d0be096705630e', '信宜市', 'xinyishi', 'xys', '440900', '440983', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3100173b312d4743b54bfca24d3a33cf', '浦口区', 'pukouqu', 'pkq', '320100', '320111', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('311dfd28933843889bbc2f8b7e3e830e', '大安区', 'daanqu', 'daq', '510300', '510304', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('315836a2db46492da3acc58d18537776', '崂山区', 'laoshanqu', 'lsq', '370200', '370212', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('316c873d1b604784969e6bcbcb239088', '皮山县', 'pishanxian', 'psx', '653200', '653223', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('31a84e147e4b4767890c17ee93351b04', '新郑市', 'xinzhengshi', 'xzs', '410100', '410184', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('31af6a72e71f493080f148cf80b85e5d', '清镇市', 'qingzhenshi', 'qzs', '520100', '520181', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('31cbdffe628f4a09b076d3a52a1feb85', '永修县', 'yongxiuxian', 'yxx', '360400', '360425', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('31d99cb8d66b400a984f433475e6355c', '市辖区', 'shixiaqu', 'sxq', '230600', '230601', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('31e2db49fd52459595a373467928010c', '元阳县', 'yuanyangxian', 'yyx', '532500', '532528', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('323a104df8b941399b7b88a77c5e0ba3', '甘德县', 'gandexian', 'gdx', '632600', '632623', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('324553a0340645cf9e240368835ea7fd', '多伦县', 'duolunxian', 'dlx', '152500', '152531', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3274aced14354b9d82fba617480ad4ba', '万年县', 'wannianxian', 'wnx', '361100', '361129', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32911677084b41bab555c13bbad9954c', '市辖区', 'shixiaqu', 'sxq', '120000', '120100', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3294648a68834556b3372de7e35506ec', '延庆县', 'yanqingxian', 'yqx', '110200', '110229', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('329796ed64734d3faa05208232b11952', '港闸区', 'gangzhaqu', 'gzq', '320600', '320611', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32a29001903143db81afca7b9277be01', '龙湖区', 'longhuqu', 'lhq', '440500', '440507', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32b2b1d7fe1043c9b3560e84aa1c963b', '崇川区', 'chongchuanqu', 'ccq', '320600', '320602', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32b49debdc044b86abcbfa87abc67ee9', '市辖区', 'shixiaqu', 'sxq', '610100', '610101', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32b71414269148c2b8e5121d3135c2ea', '泽州县', 'zezhouxian', 'zzx', '140500', '140525', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32be4e04770046a08e03d1416b35d7bc', '思南县', 'sinanxian', 'snx', '522200', '522225', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32d6a16239424fb09601cae3002240f3', '湟源县', 'huangyuanxian', 'hyx', '630100', '630123', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('32f11d369b4f42e1956de87ae3348043', '巴马瑶族自治县', 'bamayaozuzizhixian', 'bmyzzzx', '451200', '451227', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('331c53f1577d479a92b85d1d4ef3910f', '合阳县', 'heyangxian', 'hyx', '610500', '610524', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('332aaaccf7ee4c2eb3772526bb9f8984', '市辖区', 'shixiaqu', 'sxq', '150700', '150701', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('333c38b806a24a828581262fe85b4259', '奉贤区', 'fengxianqu', 'fxq', '310100', '310120', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('333d9dae0108428db299212b0e9f1de0', '市辖区', 'shixiaqu', 'sxq', '610400', '610401', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('334d65cf068d43a7b22dbf5afc746610', '北市区', 'beishiqu', 'bsq', '130600', '130603', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3357ae9d7d914cdc9ada9d318fbcc3fc', '定陶县', 'dingtaoxian', 'dtx', '371700', '371727', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('335978a05ecb422397a6b735f59d2d43', '北碚区', 'beibeiqu', 'bbq', '500100', '500109', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('33869532d26747e5aae22ee8b40be8b0', '抚远县', 'fuyuanxian', 'fyx', '230800', '230833', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('33932c8642194930b419eaaabdf0919f', '会同县', 'huitongxian', 'htx', '431200', '431225', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('339e126211c04ad787becf5cb367e118', '颍州区', 'yingzhouqu', 'yzq', '341200', '341202', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('33a6f9d34ec743ff8388fb3cb33e2fc5', '尖山区', 'jianshanqu', 'jsq', '230500', '230502', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('33b310cc5284492d8760e126577c3519', '咸宁市', 'xianningshi', 'xns', '420000', '421200', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('33c73c368a6c48b48d2744f2696ab92e', '宜良县', 'yiliangxian', 'ylx', '530100', '530125', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('33ece18de0ca43a9a16f852ac51e4ce4', '浮梁县', 'fuliangxian', 'flx', '360200', '360222', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('33f073e6f7de4b04ade9e363aede2bdd', '德宏傣族景颇族自治州', 'dehongdaizujingpozuzizhizhou', 'dhdzjpzzzz', '530000', '533100', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3401a8c4564f4c849adacb9f57002887', '资兴市', 'zixingshi', 'zxs', '431000', '431081', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3410e9618ca04a7d9e95ae56ffbea410', '宣威市', 'xuanweishi', 'xws', '530300', '530381', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('341e35a5d2f24aff9708ce2651466081', '永清县', 'yongqingxian', 'yqx', '131000', '131023', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('341e47af93ab41cb99450c56f9b38ac6', '萧山区', 'xiaoshanqu', 'xsq', '330100', '330109', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34279ed24d884bb1a28f96c675cdc560', '市辖区', 'shixiaqu', 'sxq', '140700', '140701', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3438765c86da403fae89e97d50bb686d', '江城区', 'jiangchengqu', 'jcq', '441700', '441702', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3445dd1585574cdd9b8d5a0010a6c00f', '泉州市', 'quanzhoushi', 'qzs', '350000', '350500', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('344d8e6bbeb345a68b8a5caf69c16d87', '芜湖市', 'wuhushi', 'whs', '340200', '340200', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34610f2fb58c408c9c4b349e15f94623', '巩留县', 'gongliuxian', 'glx', '654000', '654024', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3471cf950baf429f8ff3ba20b8d3dfec', '平安县', 'pinganxian', 'pax', '632100', '632121', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34764084565848e99767ecb7738792c1', '坊子区', 'fangziqu', 'fzq', '370700', '370704', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34b9968ef56f4387a4e2667363f62159', '自治区直辖县级行政区划', 'zizhiquzhixiaxianjixingzhengquhua', 'zzqzxxjxzqh', '650000', '659000', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34bf70c5e95b48c78a252e44f2a4d9de', '海晏县', 'haiyanxian', 'hyx', '632200', '632223', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34c9a45034d94119a87394d3e3d2bb6d', '龙泉市', 'longquanshi', 'lqs', '331100', '331181', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34e2b9054d2d4c279ae2c6b93675e8de', '市中区', 'shizhongqu', 'szq', '370800', '370802', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('34eed94eebff4f6a85685413cfe5b568', '旬邑县', 'xunyixian', 'xyx', '610400', '610429', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3514133cc4ec4d87914fce6e24558294', '韶关市', 'shaoguanshi', 'sgs', '440000', '440200', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3521f220c66946ae9b1e62450a7c1381', '秀峰区', 'xiufengqu', 'xfq', '450300', '450302', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35239174ddef451daea4fb120f296bcb', '丹阳市', 'danyangshi', 'dys', '321100', '321181', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('354ac1f2a0134f9d8c74e036617d9a3b', '西山区', 'xishanqu', 'xsq', '530100', '530112', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('354cb7f189cc4e249537c8f63078f690', '市辖区', 'shixiaqu', 'sxq', '360800', '360801', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('356286dd01a948c3ac719c492ad4e908', '东安县', 'donganxian', 'dax', '431100', '431122', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('356b88fbe7c340c6ad5642bde1a424b0', '岚皋县', 'langaoxian', 'lgx', '610900', '610925', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('357485f942aa4935ba4a12ea814ed31a', '射洪县', 'shehongxian', 'shx', '510900', '510922', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('358d3bc9dd644fbb9a69a34c48b40e1a', '汤阴县', 'tangyinxian', 'tyx', '410500', '410523', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35941ad9d3e84bdaa05d96a6a5c3f075', '庐山区', 'lushanqu', 'lsq', '360400', '360402', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('359d955c914a4c8aba69d014d68880d4', '安丘市', 'anqiushi', 'aqs', '370700', '370784', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35af4e13f75e491b93720c4058fe9fa8', '忻州市', 'xinzhoushi', 'xzs', '140000', '140900', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35b5d7895cfc43fab5e1d36d77d110d0', '珠山区', 'zhushanqu', 'zsq', '360200', '360203', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35b8990924ce424584e5258aabc4b962', '阿巴嘎旗', 'abagaqi', 'abgq', '152500', '152522', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35bd4c7800e24f0bbb0adb7af0db1924', '措勤县', 'cuoqinxian', 'cqx', '542500', '542527', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35c364ce7e814fe8b5fc3b76d74ccb1b', '朔州市', 'shuozhoushi', 'szs', '140000', '140600', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35e73a2bba134b09aed28964fca1672d', '米林县', 'milinxian', 'mlx', '542600', '542623', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('35ed99ea24b44efe9c0c67615aca741b', '福泉市', 'fuquanshi', 'fqs', '522700', '522702', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('362a1115e9b646a59f263b880f022e1b', '鹤岗市', 'hegangshi', 'hgs', '230000', '230400', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('363a97c112f2429eaab4e951421ff3f5', '普兰店市', 'pulandianshi', 'plds', '210200', '210282', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('364e7d77e80e4c7099baecd96c874bbd', '长兴县', 'changxingxian', 'cxx', '330500', '330522', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('36581558fb144925af7c753de7a039f6', '大英县', 'dayingxian', 'dyx', '510900', '510923', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3683432f4ba748f592db2a4cc0e3f40b', '铜陵县', 'tonglingxian', 'tlx', '340700', '340721', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('36a0642ca371492192c4ca07b24b1cfd', '东源县', 'dongyuanxian', 'dyx', '441600', '441625', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('36a7a9d2a1014671abe7ab6fd5609004', '苏尼特左旗', 'sunitezuoqi', 'sntzq', '152500', '152523', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('36ac9b2c92504e75bd3a89dd27d22299', '河曲县', 'hequxian', 'hqx', '140900', '140930', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('36b37f1bb16648fe8ab3066761cf750e', '察布查尔锡伯自治县', 'chabuchaerxibozizhixian', 'cbcexbzzx', '654000', '654022', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('36f8a8a150934264825824d064a9097b', '扶风县', 'fufengxian', 'ffx', '610300', '610324', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('36fc9220ce094b128380cba917bbecb5', '绥中县', 'suizhongxian', 'szx', '211400', '211421', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('370fd482321f4a3bad776fe1f2554382', '北川羌族自治县', 'beichuanqiangzuzizhixian', 'bcqzzzx', '510700', '510726', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3744e6968d104442979ae0be55e72793', '榕江县', 'rongjiangxian', 'rjx', '522600', '522632', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('376abe451dd04ec99e4f7b9aa1347afe', '河北省', 'hebeisheng', 'hbs', '1', '130000', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37889c16e08645eb8c401729bef554ee', '安陆市', 'anlushi', 'als', '420900', '420982', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('379ccb7ca91b4cb3a296c3b8282a5ae2', '集贤县', 'jixianxian', 'jxx', '230500', '230521', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37b93c2100b8414eb29fb5f418f928f3', '博湖县', 'bohuxian', 'bhx', '652800', '652829', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37ba4773e6a34535b5187b4083d3ef54', '尚义县', 'shangyixian', 'syx', '130700', '130725', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37bdf518ee184f29bcdda5345f811c71', '渭城区', 'weichengqu', 'wcq', '610400', '610404', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37c90cdae1b24ef1a8e05cb69cb8f44c', '石家庄市', 'shijiazhuangshi', 'sjzs', '130000', '130100', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37cf967938884aa1a2f941c24d384a73', '金川县', 'jinchuanxian', 'jcx', '513200', '513226', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37d0d0bb78fb4a4590d2124de444ade6', '青州市', 'qingzhoushi', 'qzs', '370700', '370781', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('37e91dec2a334668b5ca1379b44670b8', '市辖区', 'shixiaqu', 'sxq', '451300', '451301', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('380e0d0d29814955ad08955398349c48', '长子县', 'changzixian', 'czx', '140400', '140428', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38115f892c8e40bdbe9a46b5f5e39561', '凤阳县', 'fengyangxian', 'fyx', '341100', '341126', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3814023589ff465f8354a9b125d9da45', '铁西区', 'tiexiqu', 'txq', '210300', '210303', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3839475df78f4c92907aed20f8fe80b3', '张家川回族自治县', 'zhangjiachuanhuizuzizhixian', 'zjchzzzx', '620500', '620525', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38433a18a28243b4a7c625288e7d0f5c', '五峰土家族自治县', 'wufengtujiazuzizhixian', 'wftjzzzx', '420500', '420529', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('385abf225aa2433b8ad34e9c122c1230', '振安区', 'zhenanqu', 'zaq', '210600', '210604', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('388a4bdcf5bd4ced8bf745d004fb6bc5', '平泉县', 'pingquanxian', 'pqx', '130800', '130823', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('388d8dc6da5e4e4e9e3349bcf7fa1353', '明光市', 'mingguangshi', 'mgs', '341100', '341182', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38908658819e4ef3bd0bc576de3b65cb', '市中区', 'shizhongqu', 'szq', '510800', '511002', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38ac11c693c2479f98682d149dd93d2c', '建邺区', 'jianyequ', 'jyq', '320100', '320105', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38b282a8450e4a8bb525b2d0f021920a', '苍溪县', 'cangxixian', 'cxx', '510800', '510824', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38c71127c9754c73b2006af2a242a185', '天门市', 'tianmenshi', 'tms', '429000', '429006', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38d52d5da1404b6eadc43d502b49b2e7', '乡城县', 'xiangchengxian', 'xcx', '513300', '513336', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38ed50236a274464bc9c7caeea107499', '甘孜县', 'ganzixian', 'gzx', '513300', '513328', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38f06c68f2a64982927c10364c81ce33', '市辖区', 'shixiaqu', 'sxq', '441800', '441801', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38fa26718a824ed481e713dc7bb95a0d', '正阳县', 'zhengyangxian', 'zyx', '411700', '411724', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('38fe34997c5947f994abf2a92a162ed0', '顺昌县', 'shunchangxian', 'scx', '350700', '350721', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('391354b9ab97429484587b0e30f3b811', '法库县', 'fakuxian', 'fkx', '210100', '210124', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39160be31cdc4e99b37646382e5884aa', '鄂托克前旗', 'etuokeqianqi', 'etkqq', '150600', '150623', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3916243f8c27459297542f0f06524ca5', '蕉城区', 'jiaochengqu', 'jcq', '350900', '350902', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3944f0de9c9a4cbb838c2057dda5ca07', '西湖区', 'xihuqu', 'xhq', '330100', '330106', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39490c228c35426d9b8d91334a013129', '兴海县', 'xinghaixian', 'xhx', '632500', '632524', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39614bd3812a449db615731b949d5c29', '黄岩区', 'huangyanqu', 'hyq', '331000', '331003', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39720af693e943548c1ac5e2d7d76eff', '吴中区', 'wuzhongqu', 'wzq', '320500', '320506', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('397c94bc745a4395a7286e89762b9ea4', '峨眉山市', 'emeishanshi', 'emss', '511100', '511181', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('399efc1d5521482d8e2a60c760d29e24', '仲巴县', 'zhongbaxian', 'zbx', '542300', '542333', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39bc55041e2b4349808e3bb26999abb6', '兴平市', 'xingpingshi', 'xps', '610400', '610481', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39bf245ad17d4960a9baf08241b58bbe', '宜州市', 'yizhoushi', 'yzs', '451200', '451281', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39cbed9164d4427587fc865ae473dd81', '阳朔县', 'yangshuoxian', 'ysx', '450300', '450321', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39d9b83ce7194b8d94add62ed4e6ae5d', '下花园区', 'xiahuayuanqu', 'xhyq', '130700', '130706', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('39f1f98c10934008b182da19a596d3be', '青神县', 'qingshenxian', 'qsx', '511400', '511425', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a1beb5b05274263b6bf493f96acfd92', '永春县', 'yongchunxian', 'ycx', '350500', '350525', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a3fc89207a04922aef41548af09293d', '溧阳市', 'liyangshi', 'lys', '320400', '320481', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a4408ed70844a0db2536348357454ce', '确山县', 'queshanxian', 'qsx', '411700', '411725', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a445317c0864909ac8ff2358b074ffd', '市辖区', 'shixiaqu', 'sxq', '511800', '511801', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a6537725bc645ff9ec4d62a9bbb7b37', '亚东县', 'yadongxian', 'ydx', '542300', '542334', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a670233ec4845739bb184a7664ce074', '宣汉县', 'xuanhanxian', 'xhx', '511700', '511722', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a8003c071d6442db13d0cf732e7f00d', '武义县', 'wuyixian', 'wyx', '330700', '330723', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3a9aa246098f4d8b9bcaa3770f77222b', '泸溪县', 'luxixian', 'lxx', '433100', '433122', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3aaf98437b1445ac9f2188551a1c0f1d', '凯里市', 'kailishi', 'kls', '522600', '522601', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ab67141473e487084029ebf065a5c0c', '北镇市', 'beizhenshi', 'bzs', '210700', '210782', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ac7c016779140af88133594591de01e', '永和县', 'yonghexian', 'yhx', '141000', '141032', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ad22e8cf8064f36a4a379b72e96d971', '阳东县', 'yangdongxian', 'ydx', '441700', '441723', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ae99912442542a3813c02bebee337f2', '东湖区', 'donghuqu', 'dhq', '360100', '360102', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b051bb3e5a6482f94e97f18e60b63da', '平果县', 'pingguoxian', 'pgx', '451000', '451023', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b2bba01b8204c43ae678908c83a6998', '阳原县', 'yangyuanxian', 'yyx', '130700', '130727', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b2ceb4cf5834b6da72faa61bb1df676', '安溪县', 'anxixian', 'axx', '350500', '350524', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b391dcbaa5a41afa52939f98a15adcf', '西湖区', 'xihuqu', 'xhq', '360100', '360103', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b59683b4f79451387eacb7a4204de37', '东港区', 'donggangqu', 'dgq', '371100', '371102', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b630ac095b8404e8fb7d7629b944996', '城区', 'chengqu', 'cq', '140200', '140202', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b788f8e49c447bd9fd0d699f4164204', '峄城区', 'yichengqu', 'ycq', '370400', '370404', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b91fd02e42642ccbdceb65fd337dd34', '桥东区', 'qiaodongqu', 'qdq', '130500', '130502', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3b9c8439bdfc4b13b8e2b9ce6df1b2ff', '平桥区', 'pingqiaoqu', 'pqq', '411500', '411503', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ba1e7d62fee4ee29d4e6d1ae9f58877', '穆棱市', 'mulengshi', 'mls', '231000', '231085', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ba2f0d5ee0640dab64ee78da982f31a', '朝阳县', 'chaoyangxian', 'cyx', '211300', '211321', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3bc674db3c7e4a768a56dd77e6979f26', '西塞山区', 'xisaishanqu', 'xssq', '420200', '420203', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3bd5ceff3d70417ab9b0285c98ca5604', '蒲城县', 'puchengxian', 'pcx', '610500', '610526', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3bdd4dbd46d14b9e9b447d27ec6e3757', '宽甸满族自治县', 'kuandianmanzuzizhixian', 'kdmzzzx', '210600', '210624', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3bf13f77d73c41ebb5b8b2c88b1285b6', '吉利区', 'jiliqu', 'jlq', '410300', '410306', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3bf9fda417a2458084465a89668fefae', '长清区', 'changqingqu', 'cqq', '370100', '370113', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3c3f59b7552640dca167303089829c86', '三河市', 'sanheshi', 'shs', '131000', '131082', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3c602a49fec6482aa621fa4a2f02cdc3', '吉林市', 'jilinshi', 'jls', '220000', '220200', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3c6766701d684413a0cecbefc87dc287', '连平县', 'lianpingxian', 'lpx', '441600', '441623', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3c7c8cc221fe4e19ac76e0a09c3e4c9e', '罗甸县', 'luodianxian', 'ldx', '522700', '522728', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3c7d152f80c14558b64d85481ff3dc83', '高阳县', 'gaoyangxian', 'gyx', '130600', '130628', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3c97ca62a5fd4625a0a456effaa44ba6', '湖州市', 'huzhoushi', 'hzs', '330000', '330500', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3c9c60427e8648f7965c8348c163d97e', '桑日县', 'sangrixian', 'srx', '542200', '542224', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ca5ddd5a7064b91bfc8d9bb2db5909e', '新北区', 'xinbeiqu', 'xbq', '320400', '320411', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3cc4162433884a59a1167af7f73f9903', '武侯区', 'wuhouqu', 'whq', '510100', '510107', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ccb1bc995e742a3983289056e6b43b5', '桐柏县', 'tongbaixian', 'tbx', '411300', '411330', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3cce29713f4c4e669a13db99940ace68', '镇沅彝族哈尼族拉祜族自治县', 'zhenyuanyizuhanizulahuzuzizhixian', 'zyyzhnzlhzzzx', '530800', '530825', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3cd4530a880c473e885f8d09be3079e8', '从化市', 'conghuashi', 'chs', '440100', '440184', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3cd783411e7e4b7db9aaa24105325238', '建昌县', 'jianchangxian', 'jcx', '211400', '211422', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3cd9e995f47040678961bdf2d840f4b4', '桂阳县', 'guiyangxian', 'gyx', '431000', '431021', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ce73773ef404ed7a913e5dcdbc1c981', '安化县', 'anhuaxian', 'ahx', '430900', '430923', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3cee0376a92e4954aa7805e1b8fe62d3', '揭西县', 'jiexixian', 'jxx', '445200', '445222', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3cf626400a8b4022af1c6df875de1c4b', '乐平市', 'lepingshi', 'lps', '360200', '360281', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d14477be3b34a1a986f4206f004a698', '潼关县', 'tongguanxian', 'tgx', '610500', '610522', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d1d990df49740c58a3f743fd3fc9c9f', '市辖区', 'shixiaqu', 'sxq', '511100', '511101', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d1ea45d6ad7437d8c4046e0bfa0b0aa', '水磨沟区', 'shuimogouqu', 'smgq', '650100', '650105', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d223ca77e214830a522b8d82106f860', '中沙群岛的岛礁及其海域', 'zhongshaqundaodedaojiaojiqihaiyu', 'zsqdddjjqhy', '469000', '469033', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d370d87ed284d00a57dd546f147ce90', '阿鲁科尔沁旗', 'alukeerqinqi', 'alkeqq', '150400', '150421', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d6dabc81a934e54aea6197b70687506', '南谯区', 'nanqiaoqu', 'nqq', '341100', '341103', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d715da77e0746a19c47bc5483cba8d0', '孙吴县', 'sunwuxian', 'swx', '231100', '231124', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3d887dbefc29459c86387423cc301ec2', '伍家岗区', 'wujiagangqu', 'wjgq', '420500', '420503', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3da9fa096ea349a98ce1cedf09568952', '琼中黎族苗族自治县', 'qiongzhonglizumiaozuzizhixian', 'qzlzmzzzx', '469000', '469030', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3dc4e65dfcaf4de7a03739e2f24f61d5', '香坊区', 'xiangfangqu', 'xfq', '230100', '230110', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3dd6157e3b714aae86d31dde66187ad7', '谢通门县', 'xietongmenxian', 'xtmx', '542300', '542328', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3df42a5525ef4d01a98ddf125c48cfa9', '张家界市', 'zhangjiajieshi', 'zjjs', '430000', '430800', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3df6e9a2774342bdbf6b0b970abe3b7a', '塔城市', 'tachengshi', 'tcs', '654200', '654201', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e070c0b27734796a4fecd78f2764b5b', '市辖区', 'shixiaqu', 'sxq', '620900', '620901', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e1f675d44484c3e9a8956d6ad9ff127', '宁强县', 'ningqiangxian', 'nqx', '610700', '610726', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e1fd28b9a864768833d718a55b7c104', '辽源市', 'liaoyuanshi', 'lys', '220000', '220400', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e4754e6d0cf4b79ab71285f18205b88', '市辖区', 'shixiaqu', 'sxq', '330700', '330701', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e4f5d42af3c4e4e85480d5b5a089d4b', '东城区', 'dongchengqu', 'dcq', '110100', '110101', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e6c2286cef447579e3bff57ff2b770c', '沈丘县', 'shenqiuxian', 'sqx', '411600', '411624', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e7928c1e39f4919868f9154118528b8', '五原县', 'wuyuanxian', 'wyx', '150800', '150821', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3e9e5877c539477b96d2ff025ee499b9', '市辖区', 'shixiaqu', 'sxq', '210400', '210401', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3eaf273b47e1478585c1ef95691ab810', '临河区', 'linhequ', 'lhq', '150800', '150802', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ebd88acba14450daa7fc6c43e9ebd54', '光山县', 'guangshanxian', 'gsx', '411500', '411522', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ec5ba5e5e784d918d72b6b221a456ef', '新巴尔虎左旗', 'xinbaerhuzuoqi', 'xbehzq', '150700', '150726', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ece5e08a103442693b34bf5236ccbff', '双流县', 'shuangliuxian', 'slx', '510100', '510122', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ece9897f6cb438284ce27b3f00986f3', '弓长岭区', 'gongchanglingqu', 'gclq', '211000', '211005', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3ed50b76b6a94b1896e3cc7e85a4887f', '古冶区', 'guyequ', 'gyq', '130200', '130204', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f05e42dac33444cbc047e7d6d18897c', '古塔区', 'gutaqu', 'gtq', '210700', '210702', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f108c1401d546adb763ddcc8ec9c6b8', '莆田市', 'putianshi', 'pts', '350000', '350300', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f1275fd71224ec7b0e90a46b29af06d', '梅里斯达斡尔族区', 'meilisidawoerzuqu', 'mlsdwezq', '230200', '230208', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f2d3c448a6748d2b2d3740965ea2fa8', '献县', 'xianxian', 'xx', '130900', '130929', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f4b16043e7a4615bfd19907ed2abb61', '沈阳市', 'shenyangshi', 'sys', '210000', '210100', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f4ef510449547e6a149a83ea1a2cb0a', '安吉县', 'anjixian', 'ajx', '330500', '330523', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f58ce33c4c44826997139e6506d21e9', '普兰县', 'pulanxian', 'plx', '542500', '542521', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f5c3ee2f439418bacdcf078264a1ac8', '杜集区', 'dujiqu', 'djq', '340600', '340602', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f634d45c7b34f86b893015f1c36e919', '绥滨县', 'suibinxian', 'sbx', '230400', '230422', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f66b7c32b444e2985699f791948a1a5', '阳谷县', 'yangguxian', 'ygx', '371500', '371521', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3f722b590b5f4c33890fe8aaec488cd1', '新野县', 'xinyexian', 'xyx', '411300', '411329', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3fa4744bd6314a39a9660ebb1369f0f9', '永城市', 'yongchengshi', 'ycs', '411400', '411481', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3fcbbe8387a44e77940dbee48cc8654f', '高明区', 'gaomingqu', 'gmq', '440600', '440608', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3fd51565ead04c83bf82794847d9661d', '长白朝鲜族自治县', 'changbaichaoxianzuzizhixian', 'cbcxzzzx', '220600', '220623', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('3fe24890d8c449349d88efb4cc120b86', '那曲县', 'naquxian', 'nqx', '542400', '542421', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('401eeebbea794f92bc20d190eb909336', '普宁市', 'puningshi', 'pns', '445200', '445281', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4027ee9a253c485fa5c381faded94b4d', '榆林市', 'yulinshi', 'yls', '610000', '610800', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('40384ea94e20471980b7862254d14795', '襄城区', 'xiangchengqu', 'xcq', '420600', '420602', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4051319482a1414d8a651eb3b1b77fb9', '林甸县', 'lindianxian', 'ldx', '230600', '230623', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4054d7d6deb6463a9c1cdcf886be5198', '永吉县', 'yongjixian', 'yjx', '220200', '220221', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('405ef716772d4dd39cebe60673f2f45c', '七星区', 'qixingqu', 'qxq', '450300', '450305', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('40674bacf82148a4978c4af46ae965c5', '津南区', 'jinnanqu', 'jnq', '120100', '120112', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4074f58f163e4169a28dd063b750d408', '红桥区', 'hongqiaoqu', 'hqq', '120100', '120106', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4090a9dbef7443928b698b4c0ceaacc0', '顺平县', 'shunpingxian', 'spx', '130600', '130636', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('409288c0b73d4f4e8663b1a0b211b2f5', '新晃侗族自治县', 'xinhuangdongzuzizhixian', 'xhdzzzx', '431200', '431227', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('40a32675a644466982cecc91348b3156', '岳阳县', 'yueyangxian', 'yyx', '430600', '430621', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('40e4c561f9cf419d9830113c8676c541', '晋州市', 'jinzhoushi', 'jzs', '130100', '130183', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('40f45e508946404bb783a39333809116', '靖江市', 'jingjiangshi', 'jjs', '321200', '321282', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4114146f2600416e849006c0852f498c', '海勃湾区', 'haibowanqu', 'hbwq', '150300', '150302', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('412b5e97f73d4c65acb220054cb04287', '大悟县', 'dawuxian', 'dwx', '420900', '420922', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('413e0f362a824092929b8c90fb5a0d39', '固原市', 'guyuanshi', 'gys', '640000', '640400', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4150d4c71e324e4ba85c242cdf40445a', '青山区', 'qingshanqu', 'qsq', '420100', '420107', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('415afe88f74e406a97a7b4234f2f7760', '封开县', 'fengkaixian', 'fkx', '441200', '441225', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4164de4a7df64b0c80fd5d4d26f4b0b1', '阿合奇县', 'aheqixian', 'ahqx', '653000', '653023', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('416611b71bf34704b7595c9c1d8d2fde', '毕节市', 'bijieshi', 'bjs', '522400', '522401', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('41675c0f3a5140de963fcacb6b745051', '稷山县', 'jishanxian', 'jsx', '140800', '140824', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('416bace9e28041d5a6632d466d3ea17a', '珙县', 'gongxian', 'gx', '511500', '511526', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('418bba97f8f148a28fdf3a97bb8fcce9', '建宁县', 'jianningxian', 'jnx', '350400', '350430', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('41af9f4c82cb4c4492cf376a593c5143', '肃宁县', 'suningxian', 'snx', '130900', '130926', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('41c24a413be54e0f8ee982e59e551e3c', '乐东黎族自治县', 'ledonglizuzizhixian', 'ldlzzzx', '469000', '469027', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('41f71f592ec14fce9c6a7b1721d13ba4', '通化市', 'tonghuashi', 'ths', '220000', '220500', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4201894837354c4ba817f0dc32af8ef4', '木垒哈萨克自治县', 'muleihasakezizhixian', 'mlhskzzx', '652300', '652328', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('425093f495d04202b03ba6430f95460f', '市辖区', 'shixiaqu', 'sxq', '360100', '360101', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4265d1b2c1da4e458d012d38f3cc9c20', '市辖区', 'shixiaqu', 'sxq', '530100', '530101', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42664a377afb4bd3a3d1f040096dad1a', '延川县', 'yanchuanxian', 'ycx', '610600', '610622', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('429eee19966d4009935cb65f465a49d6', '新青区', 'xinqingqu', 'xqq', '230700', '230707', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42adf30a859f42cca543a4c244f868a3', '市辖区', 'shixiaqu', 'sxq', '410700', '410701', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42ae3ec4e603436eabcdaecc23a733cb', '府谷县', 'fuguxian', 'fgx', '610800', '610822', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42b0e57ae0c44ddc8803cd094a793ecb', '淅川县', 'xichuanxian', 'xcx', '411300', '411326', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42ba96cf175f4f9a92849ee6474124e0', '吐鲁番市', 'tulufanshi', 'tlfs', '652100', '652101', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42cd9f38066f4486bfbe52eebfc2950c', '乌鲁木齐县', 'wulumuqixian', 'wlmqx', '650100', '650121', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42d7523120724b9fa9ae71102a6834ef', '曲江区', 'qujiangqu', 'qjq', '440200', '440205', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42e70e3f5fc848d5aa26d87f90bbb1ee', '乌审旗', 'wushenqi', 'wsq', '150600', '150626', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('42ed891eba2245c3a58f16ba33a2af97', '昂昂溪区', 'angangxiqu', 'aaxq', '230200', '230205', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('430695d0da494435906e6058658a0e83', '常州市', 'changzhoushi', 'czs', '320000', '320400', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4310d55cbd604f22ae858aa1494b5f1f', '理县', 'lixian', 'lx', '513200', '513222', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('431ad9d74f0246f1b52bc449cbda8193', '丰南区', 'fengnanqu', 'fnq', '130200', '130207', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('432f7fe34eab49368d623c0e431fb4e6', '漳浦县', 'zhangpuxian', 'zpx', '350600', '350623', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4334828e554b4f6abd6e56102778a608', '巴林右旗', 'balinyouqi', 'blyq', '150400', '150423', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('434f578fba924776b8f79895a49317df', '杭锦旗', 'hangjinqi', 'hjq', '150600', '150625', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('435509d6128e481b9ca6e1447b46fa3b', '馆陶县', 'guantaoxian', 'gtx', '130400', '130433', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('435d79592edc43828eb82355c7157b28', '市辖区', 'shixiaqu', 'sxq', '130100', '130101', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('435fa95cd27a47edb2dd4684b18146a1', '桐城市', 'tongchengshi', 'tcs', '340800', '340881', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4362f9f343ab4cecb6abc0180771ea5c', '霍邱县', 'huoqiuxian', 'hqx', '341500', '341522', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43665e5fbb9648feb8e7d1dba3749ea6', '河东区', 'hedongqu', 'hdq', '371300', '371301', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('436b756170fb487bb56617074d6317e2', '河口区', 'hekouqu', 'hkq', '370500', '370503', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43715b4b0a104352892c4ac8e68c6582', '泾阳县', 'jingyangxian', 'jyx', '610400', '610423', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43723e7c6ccb40aabfd657f4e1149d47', '宜都市', 'yidushi', 'yds', '420500', '420581', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4372f4beb3e84c8ba2e5cc03557808e3', '市辖区', 'shixiaqu', 'sxq', '130200', '130201', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43758870879644eab2b81b8532f4b619', '新蔡县', 'xincaixian', 'xcx', '411700', '411729', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43818127361649029b1da4f115ef10bd', '虎丘区', 'huqiuqu', 'hqq', '320500', '320505', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('439450cee62d4270b6c3d9ee6917b4ab', '巴州区', 'bazhouqu', 'bzq', '511900', '511902', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43a1b71a70ee4592861e95606fdf2028', '周宁县', 'zhouningxian', 'znx', '350900', '350925', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43b780fee0074575af39f2058971ed44', '泸定县', 'ludingxian', 'ldx', '513300', '513322', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43dbf1918ef44be9867837cddd139f52', '阜城县', 'fuchengxian', 'fcx', '131100', '131128', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43dc06a9c18b48e08468ef6522c16266', '博爱县', 'boaixian', 'bax', '410800', '410822', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43e09409071f43c8b952a9540652cd54', '华安县', 'huaanxian', 'hax', '350600', '350629', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('43f025e25bd344daaec2d9168e323cfd', '虞城县', 'yuchengxian', 'ycx', '411400', '411425', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4408bfbce11d4e53a45dfebf416d134f', '道真仡佬族苗族自治县', 'daozhenyilaozumiaozuzizhixian', 'dzylzmzzzx', '520300', '520325', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('443603cec69349848b91d56ab6752729', '平鲁区', 'pingluqu', 'plq', '140600', '140603', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4451515de36d4289b753e642485f1695', '城东区', 'chengdongqu', 'cdq', '630100', '630102', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4467628aaa9240c88cef6fe2d955e78d', '石楼县', 'shilouxian', 'slx', '141100', '141126', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('447652792a14406daca84d4c61ccb966', '市辖区', 'shixiaqu', 'sxq', '520100', '520101', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('447836b3b57d4e78a41b0d8f264ac236', '包河区', 'baohequ', 'bhq', '340100', '340111', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4480105337954649b94f95110fa0967f', '赤水市', 'chishuishi', 'css', '520300', '520381', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('44c0c22da34e426f87fad64711142181', '祥云县', 'xiangyunxian', 'xyx', '532900', '532923', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('44ebd3ea07384435b384889817e32771', '沙洋县', 'shayangxian', 'syx', '420800', '420822', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45027b43fb2245aca305a1fede1abac2', '市辖区', 'shixiaqu', 'sxq', '150200', '150201', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4513e2570d4a4a8bbf4347794035eb7b', '遂宁市', 'suiningshi', 'sns', '510000', '510900', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('451689e811f44e97bc9702bd0379ffea', '甘南藏族自治州', 'gannancangzuzizhizhou', 'gnczzzz', '620000', '623000', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('451cf2c9f2f54422b5a728bb7681b8f3', '梁子湖区', 'liangzihuqu', 'lzhq', '420700', '420702', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('452450221dcc4c759bdedc6b3999053c', '相山区', 'xiangshanqu', 'xsq', '340600', '340603', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4542417cf98d4b149b52470f9adc5552', '调兵山市', 'tiaobingshanshi', 'tbss', '211200', '211281', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45663f566bb743759ffba28138a1f012', '铜仁市', 'tongrenshi', 'trs', '522200', '522201', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45694ee236fd4b8795e5d0e3e6b7839e', '灌云县', 'guanyunxian', 'gyx', '320700', '320723', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('457554c129de408a9f6a197225873da0', '城口县', 'chengkouxian', 'ckx', '500200', '500229', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('457843d2db37481da12e00df2d3ae158', '嫩江县', 'nenjiangxian', 'njx', '231100', '231121', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4589199ff88d406ab7e8f207c353b2d5', '三明市', 'sanmingshi', 'sms', '350000', '350400', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('458ef43d0353489f80d5c382f987934f', '双清区', 'shuangqingqu', 'sqq', '430500', '430502', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45a2d86a51334a2c8a67a3ae09b7ee57', '邳州市', 'pizhoushi', 'pzs', '320300', '320382', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45c1580677414ce7ad7d88a4ce984e4c', '城区', 'chengqu', 'cq', '140400', '140402', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45d5d52717c444d5853a70ea21469f67', '福山区', 'fushanqu', 'fsq', '370600', '370611', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45db50f7a1154d108a6a671197dd4b5a', '德城区', 'dechengqu', 'dcq', '371400', '371402', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45dd170bbb1f47079e6d5ff65a7cc1dc', '婺城区', 'wuchengqu', 'wcq', '330700', '330702', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45f5a857bdba4ad89b55e3ef1b548501', '清新县', 'qingxinxian', 'qxx', '441800', '441827', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('45fba681137d41d7a92c5cfda8849545', '紫金县', 'zijinxian', 'zjx', '441600', '441621', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('46012ac485fc4c03a5d279e254beb46a', '南平市', 'nanpingshi', 'nps', '350000', '350700', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4631662f829c477f89a8e0398b79a2bf', '潼南县', 'tongnanxian', 'tnx', '500200', '500223', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('463999ac2f6b4c64861c06c3c080b378', '呼图壁县', 'hutubixian', 'htbx', '652300', '652323', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4639d9bc49544e46a5269f44c76a89b3', '贺兰县', 'helanxian', 'hlx', '640100', '640122', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('463eed1f92b84fd1badf7445c51d3dcc', '市辖区', 'shixiaqu', 'sxq', '320300', '320301', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('464431e661d04859b63dbc91bcb0b867', '嘉荫县', 'jiayinxian', 'jyx', '230700', '230722', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4650615b0ba646aba70a4cf35ec9deaa', '博白县', 'bobaixian', 'bbx', '450900', '450923', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4665c2c31a7d433983f16b6dbbd39ee8', '清流县', 'qingliuxian', 'qlx', '350400', '350423', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4674d0e0bc584ac9868a85316c373ac2', '西陵区', 'xilingqu', 'xlq', '420500', '420502', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('46784a7b6b254ae184a887f10cf53045', '凤城市', 'fengchengshi', 'fcs', '210600', '210682', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('468b251c81224eb4a1039684da3fc4ac', '南木林县', 'nanmulinxian', 'nmlx', '542300', '542322', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('469015a0b76b46b3aab58adebea9c40b', '喀什市', 'kashenshi', 'kss', '653100', '653101', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('469c2d1a74cb4e189acf18e28067f658', '若羌县', 'ruoqiangxian', 'rqx', '652800', '652824', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('469d18e8dc2d4aeb8cc602be6619ff31', '安国市', 'anguoshi', 'ags', '130600', '130683', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('46b392b2061b4142845762a2ab150a14', '花溪区', 'huaxiqu', 'hxq', '520100', '520111', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('46bd37f09b5345f9bf5daece5747bf5b', '龙湾区', 'longwanqu', 'lwq', '330300', '330303', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('46d281863470420c83dbdd2ce2f1fa6e', '新津县', 'xinjinxian', 'xjx', '510100', '510132', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('471e5fef80164fd2aad65420d19c0d69', '土默特左旗', 'tumotezuoqi', 'tmtzq', '150100', '150121', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('472694b9da964d579ade3f8fce9c3b40', '老边区', 'laobianqu', 'lbq', '210800', '210811', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47288717b13a4d7da0be2372822df5f5', '宝应县', 'baoyingxian', 'byx', '321000', '321023', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('472e5460d7d84fc9ae3e459198ca2faa', '东营市', 'dongyingshi', 'dys', '370000', '370500', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4766af0228f2455b8cd402136028a717', '托克托县', 'tuoketuoxian', 'tktx', '150100', '150122', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('477245863b5a4d64a52a94ade3d5d776', '纳雍县', 'nayongxian', 'nyx', '522400', '522426', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47791d7b24864ad3aa538df2f055894f', '九江市', 'jiujiangshi', 'jjs', '360000', '360400', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('477d7ad20f11484a9693d8c2725bb50a', '万州区', 'wanzhouqu', 'wzq', '500100', '500101', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4796bb392dab41c1a35bc548d8bc96a1', '历城区', 'lichengqu', 'lcq', '370100', '370112', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47a142c15fcb4b79af00ffeb1722b505', '市辖区', 'shixiaqu', 'sxq', '441600', '441601', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47b83e3c1c564e739218979322048427', '博山区', 'boshanqu', 'bsq', '370300', '370304', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47c1a289f6e44cdfa752f1c31f9b2d8b', '密云县', 'miyunxian', 'myx', '110200', '110228', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47ce4f6ff1214aeebb64f4899ad0eac0', '西安市', 'xianshi', 'xas', '610000', '610100', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47cff96700084f5c9436f5aa9211f126', '县', 'xian', 'x', '110000', '110200', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47e1de5d1bd7419a9cf56dbf758bca32', '扎兰屯市', 'zalantunshi', 'zlts', '150700', '150783', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47e7dd2a0ac54131b4c1ca3be052f2ba', '安居区', 'anjuqu', 'ajq', '510900', '510904', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47ec410688c449fdb50eed892e25b370', '市辖区', 'shixiaqu', 'sxq', '610200', '610201', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('47f281a8f56247e5a3eec6a38b754652', '兴文县', 'xingwenxian', 'xwx', '511500', '511528', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('481482d18f93423e9d353acc063ebb79', '耿马傣族佤族自治县', 'gengmadaizuwazuzizhixian', 'gmdzwzzzx', '530900', '530926', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('481708ce350e4101a203694fd3d8999b', '内黄县', 'neihuangxian', 'nhx', '410500', '410527', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4818ed3c3d2c4bb6afbf37b8e9226f94', '嘉祥县', 'jiaxiangxian', 'jxx', '370800', '370829', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4844f335309f4e29ba309ee7d0f8831f', '泉港区', 'quangangqu', 'qgq', '350500', '350505', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('486419458ae343af83bdbec2224f451d', '神农架林区', 'shennongjialinqu', 'snjlq', '429000', '429021', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('48685ae967624233ba94eea33c8aaa59', '河西区', 'hexiqu', 'hxq', '120100', '120103', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('487a57cc811e4b00a93250546986d9c9', '安远县', 'anyuanxian', 'ayx', '360700', '360726', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4884dedfca254796b6e57c350fd6a018', '万载县', 'wanzaixian', 'wzx', '360900', '360922', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('48bcc9847e07425eafda90e3cf830e6b', '碌曲县', 'luquxian', 'lqx', '623000', '623026', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('48c5cd5ade2240948770fca24cb661ee', '石棉县', 'shimianxian', 'smx', '511800', '511824', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('48db115eb96142abaabdf4aaf00c103e', '左权县', 'zuoquanxian', 'zqx', '140700', '140722', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('48e7e8861439496c8923939c9fc8730e', '康定县', 'kangdingxian', 'kdx', '513300', '513321', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('48f347b13e544d27b81e82a76aa535a1', '新昌县', 'xinchangxian', 'xcx', '330600', '330624', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('48fb4a6087b145c7aa93a62460934237', '咸丰县', 'xianfengxian', 'xfx', '422800', '422826', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('49146a8fe4a9445db88d09cfdcef6e58', '矿区', 'kuangqu', 'kq', '140200', '140203', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('49498829e8a74369a8defa7868814621', '宝塔区', 'baotaqu', 'btq', '610600', '610602', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('498f73db2c2d474baefd5482549d5bcf', '鄂城区', 'echengqu', 'ecq', '420700', '420704', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('49ab3fa500124f7f828bc475068c105b', '清河门区', 'qinghemenqu', 'qhmq', '210900', '210905', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('49e63bf117104299b520cc90d8341c47', '东昌区', 'dongchangqu', 'dcq', '220500', '220502', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('49e6a5d89e8f461f8960b36f59d68e5c', '市辖区', 'shixiaqu', 'sxq', '320400', '320401', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('49fa64c0b59947c2bdd1efd74fcc5be8', '安岳县', 'anyuexian', 'ayx', '512000', '512021', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a020374b33c47b09c35d71a70ad36ac', '夷陵区', 'yilingqu', 'ylq', '420500', '420506', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a1377fd2d97422bae31fab518f82e6b', '高州市', 'gaozhoushi', 'gzs', '440900', '440981', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a1eeafbb100410b934237e67693b28b', '抚宁县', 'funingxian', 'fnx', '130300', '130323', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a1fb2da3f4248fca5e5f726784dff29', '罗定市', 'luodingshi', 'lds', '445300', '445381', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a2ebc6617354a1e8f6b23bb83c87c27', '市辖区', 'shixiaqu', 'sxq', '321200', '321201', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a450c63119c4f099b8bb6ee78c4238b', '郊区', 'jiaoqu', 'jq', '140400', '140411', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a4a26d80f7c4ca7b4bb2536f8692c8e', '龙陵县', 'longlingxian', 'llx', '530500', '530523', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a53a10f70ca41af8eeedb8fdd4049f9', '江津区', 'jiangjinqu', 'jjq', '500100', '500116', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a5dbcaacc8543bbaee9257ab142b4de', '乌达区', 'wudaqu', 'wdq', '150300', '150304', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a6ae880e8dd4ef1a1d39a94ae0245ec', '市辖区', 'shixiaqu', 'sxq', '230400', '230401', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a894e60ff104ba9ba0192b9c26c5374', '魏县', 'weixian', 'wx', '130400', '130434', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a8fe7ff201147e2b6c49039f31708f8', '蒙山县', 'mengshanxian', 'msx', '450400', '450423', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4a9b58a368bf426aa8b8bea3227af8b9', '卫东区', 'weidongqu', 'wdq', '410400', '410403', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ab8e524ef1e4a888ac7f977ee8d77db', '椒江区', 'jiaojiangqu', 'jjq', '331000', '331002', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4af2700cde9b45dba890e71ee0212fde', '冷水江市', 'lengshuijiangshi', 'lsjs', '431300', '431381', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b035a510a014dd59fa21c7b6e36a569', '平房区', 'pingfangqu', 'pfq', '230100', '230108', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b157e3fda224c738a5405a4e88f524b', '横峰县', 'hengfengxian', 'hfx', '361100', '361125', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b3417f6f0fe49099980115bf6ecd52d', '右江区', 'youjiangqu', 'yjq', '451000', '451002', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b39365bc3cb445693d712f678e38b0c', '青浦区', 'qingpuqu', 'qpq', '310100', '310118', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b3eaf6b34c640bfaa007c934c314943', '六安市', 'luanshi', 'las', '340000', '341500', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b48ed6925a94517ba01dce1c6ab4938', '新田县', 'xintianxian', 'xtx', '431100', '431128', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b858d155d594a11abd77d4114fa176b', '丹棱县', 'danlengxian', 'dlx', '511400', '511424', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4b9d7a0897a740e581956f3e54230504', '市辖区', 'shixiaqu', 'sxq', '140500', '140501', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4c053fc452e944688e518b04651ce747', '连城县', 'lianchengxian', 'lcx', '350800', '350825', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4c15c2aadaeb417db614b79ce710b25f', '白下区', 'baixiaqu', 'bxq', '320100', '320103', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4c44ff5bd7df4beca49fb7b13fa17a19', '顺河回族区', 'shunhehuizuqu', 'shhzq', '410200', '410203', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4c59d80446eb4cac9f6db88ef3efe3cf', '乳源瑶族自治县', 'ruyuanyaozuzizhixian', 'ryyzzzx', '440200', '440232', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4c6ab4c359db4084bc069fb883ed0def', '遂川县', 'suichuanxian', 'scx', '360800', '360827', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4c6ccf97ae9741c3ab54bdb3fb142f2e', '市辖区', 'shixiaqu', 'sxq', '340300', '340301', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4cb2199c5fff494f82cf1c082110d878', '栾川县', 'luanchuanxian', 'lcx', '410300', '410324', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4cd560a6288444d9a313097057eab107', '卢湾区', 'luwanqu', 'lwq', '310100', '310103', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ce1c7a3622e425388b58bcec9058933', '市辖区', 'shixiaqu', 'sxq', '140400', '140401', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ce250c8c5ee4d848f94a3ffefc7d82d', '大荔县', 'dalixian', 'dlx', '610500', '610523', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ceeb0a561c04e2390e02eb041e5ff79', '城区', 'chengqu', 'cq', '140300', '140302', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4d05fbade536483cac103cf239abe4c9', '秦州区', 'qinzhouqu', 'qzq', '620500', '620502', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4d09b68593ed4dab944a49bd526985a0', '天柱县', 'tianzhuxian', 'tzx', '522600', '522627', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4d155779709a42b68f2930b540035de6', '雨花区', 'yuhuaqu', 'yhq', '430100', '430111', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4d1dd477bf9c4741925331efea77f557', '三水区', 'sanshuiqu', 'ssq', '440600', '440607', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4d3603ff1de945f0bf7159499d39dc64', '市辖区', 'shixiaqu', 'sxq', '510700', '510701', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4d8be914a9654dd389bf23224764c87b', '施甸县', 'shidianxian', 'sdx', '530500', '530521', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4db2d20555af41b6832171603847e8c1', '白云区', 'baiyunqu', 'byq', '440100', '440111', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4dc00485312b405d9b9efa6b5d45cb05', '新河县', 'xinhexian', 'xhx', '130500', '130530', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4dc2e1993f9f47c2acac27d967b2ab8b', '托里县', 'tuolixian', 'tlx', '654200', '654224', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4dcc61d11f184b71a5b5ae257b15f634', '市辖区', 'shixiaqu', 'sxq', '421100', '421101', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4dd0b179c2eb4d29b8d33b5242783179', '浈江区', 'zhenjiangqu', 'zjq', '440200', '440204', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4dd28c46d571458f866a6c1d18119716', '定远县', 'dingyuanxian', 'dyx', '341100', '341125', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ddb795ccb934571afd727bc6968d641', '绵阳市', 'mianyangshi', 'mys', '510000', '510700', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ddd1d8a8f564c988f3911707065ea5d', '诸暨市', 'zhujishi', 'zjs', '330600', '330681', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e013add3f2a485e82974ce5089557c5', '市辖区', 'shixiaqu', 'sxq', '511300', '511301', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e15c6fe28e24105be6fb36619d10094', '玛纳斯县', 'manasixian', 'mnsx', '652300', '652324', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e18b0d2ff424851b3db12853951fb1b', '枝江市', 'zhijiangshi', 'zjs', '420500', '420583', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e2c26949d1a4833a30dfdc2bc72e871', '青白江区', 'qingbaijiangqu', 'qbjq', '510100', '510113', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e454484ba6e45c7b230131baffe7142', '市辖区', 'shixiaqu', 'sxq', '430900', '430901', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e5216316fd74ef286b179df0f8ea4f9', '金平苗族瑶族傣族自治县', 'jinpingmiaozuyaozudaizuzizhixian', 'jpmzyzdzzzx', '532500', '532530', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e55832c324e4b49bf1890efbdc893b3', '东港市', 'donggangshi', 'dgs', '210600', '210681', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e5611ca699643ff8cfd51db97016669', '睢阳区', 'huiyangqu', 'hyq', '411400', '411403', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e604022a0ce4453b943c6dc3dbb52b3', '兴和县', 'xinghexian', 'xhx', '150900', '150924', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e62ff4abe9241b5973627f564cf4f44', '万柏林区', 'wanbolinqu', 'wblq', '140100', '140109', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e721c95804e409da3048ae8f56d3cd6', '永丰县', 'yongfengxian', 'yfx', '360800', '360825', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e7f6977d91842778ff1f35220963add', '瑞丽市', 'ruilishi', 'rls', '533100', '533102', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4e9ede641bdf4e52b24c0b7b85111d62', '市辖区', 'shixiaqu', 'sxq', '445300', '445301', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4eab830e84d14855a156a2fcdb14c2eb', '香河县', 'xianghexian', 'xhx', '131000', '131024', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4eae9e384c694322bf6d9e2c13ebced8', '市辖区', 'shixiaqu', 'sxq', '231000', '231001', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4eb8c80d10284a06ad9c516829bdad08', '青龙满族自治县', 'qinglongmanzuzizhixian', 'qlmzzzx', '130300', '130321', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ebabfdbc9ec429389c95c6040a7e08a', '罗山县', 'luoshanxian', 'lsx', '411500', '411521', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ec5bc4e06cc413a9e6b639bddaa3602', '周至县', 'zhouzhixian', 'zzx', '610100', '610124', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ecb19df8e664b0a89451ab1b742db23', '鼓楼区', 'gulouqu', 'glq', '320100', '320106', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f0c2cd07f84428e82ce940b199a789a', '西安区', 'xianqu', 'xaq', '231000', '231005', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f23e4359be2409a84041e2827a351f6', '溧水县', 'lishuixian', 'lsx', '320100', '320124', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f3c0b27360a47e78e39336be532125c', '宁德市', 'ningdeshi', 'nds', '350000', '350900', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f47c22bc8b746d5a9a5153fba9aff95', '金平区', 'jinpingqu', 'jpq', '440500', '440511', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f614fad8ba24963ad56ad3e1b60e4d9', '宁波市', 'ningboshi', 'nbs', '330000', '330200', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f6f1da0d612486e84a5fe93cd27d056', '上街区', 'shangjiequ', 'sjq', '410100', '410106', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f700a455516447bb5bdb06dae73bfdf', '师宗县', 'shizongxian', 'szx', '530300', '530323', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f75d53ce8aa48198f38be509f6b642f', '日喀则市', 'rikazeshi', 'rkzs', '542300', '542301', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f882d41bab1476289b3fc6851e82fbe', '南涧彝族自治县', 'nanjianyizuzizhixian', 'njyzzzx', '532900', '532926', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4f95491e20534dad827b0cc6cfa2afaa', '忠县', 'zhongxian', 'zx', '500200', '500233', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4fa04ada7e274ea6b8b4e18f63b2435d', '南山区', 'nanshanqu', 'nsq', '440300', '440305', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4fa69d81a32f4137946b42f5d4a78b3f', '兴化市', 'xinghuashi', 'xhs', '321200', '321281', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4fbedd18ce9b42b1bd0828dd30813329', '松岭区', 'songlingqu', 'slq', '232700', '232702', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4fc2b7849b7249489cebe4db1f537e61', '市辖区', 'shixiaqu', 'sxq', '420100', '420101', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4fd43f5a5f9a4e0c8b339a2c95dbd1d9', '保康县', 'baokangxian', 'bkx', '420600', '420626', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4fdd8003926b4d94a6a868131cdcfef9', '楚州区', 'chuzhouqu', 'czq', '320800', '320803', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4fe7e834760c499c9097359908bf3047', '市辖区', 'shixiaqu', 'sxq', '530700', '530701', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('4ffe0efe8b4c44a4920496eb64599254', '广汉市', 'guanghanshi', 'ghs', '510600', '510681', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50104eaa34e14f72ae4cb299b9abc1b4', '保德县', 'baodexian', 'bdx', '140900', '140931', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50359dff5ffb43c8a5279031c48b6f79', '天祝藏族自治县', 'tianzhucangzuzizhixian', 'tzczzzx', '620600', '620623', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('504b4833617f4d6f8e2a9b574aecd94a', '巴里坤哈萨克自治县', 'balikunhasakezizhixian', 'blkhskzzx', '652200', '652222', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('504b4abc20df47d997b0142e7836f433', '青县', 'qingxian', 'qx', '130900', '130922', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50532bddd8a349d8bb70148201d39d17', '江川县', 'jiangchuanxian', 'jcx', '530400', '530421', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('506701fd65594dae8ea8ab62bf1dd2ef', '松山区', 'songshanqu', 'ssq', '150400', '150404', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('506a0854d8024689a3a13d8afdd9283f', '市辖区', 'shixiaqu', 'sxq', '411300', '411301', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5096a1d299ff4a6aa833d86bc285917d', '佳县', 'jiaxian', 'jx', '610800', '610828', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50a8fc0c49cd4d7883d563254888aefb', '绵竹市', 'mianzhushi', 'mzs', '510600', '510683', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50b24b18ed7143629a1ddd3b89bd91bd', '武邑县', 'wuyixian', 'wyx', '131100', '131122', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50bad084c58c4ad9b84e593a057bcf2b', '长岭县', 'changlingxian', 'clx', '220700', '220722', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50c592ec09ac4b2083a15443a19fe112', '临朐县', 'linquxian', 'lqx', '370700', '370724', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50dd926b4d564525a6f9fbf2cecbb7ea', '宁化县', 'ninghuaxian', 'nhx', '350400', '350424', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50e7b75b5a54497b9fc12dbee3dc4d55', '古浪县', 'gulangxian', 'glx', '620600', '620622', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('50f6e60e6f6a43efa7437079d7d80a96', '射阳县', 'sheyangxian', 'syx', '320900', '320924', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5141f1496e5d41328bd18a15a68bc748', '香格里拉县', 'xianggelilaxian', 'xgllx', '533400', '533421', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5153b91a1e3f4244813637cfe1a3a3d5', '歙县', 'shexian', 'sx', '341000', '341021', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('515e0fdb452d4f4d9c32b1b85711b4b1', '綦江县', 'qijiangxian', 'qjx', '500200', '500222', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('517e158e72054f3e9361d271c5300f30', '牙克石市', 'yakeshishi', 'ykss', '150700', '150782', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('51884c34d3504bb9a49e197c6cb26db8', '景谷傣族彝族自治县', 'jinggudaizuyizuzizhixian', 'jgdzyzzzx', '530800', '530824', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('518e0be9cd8b471caba5372d09930010', '黑山县', 'heishanxian', 'hsx', '210700', '210726', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('51c339b51324401088f3fd1f7f26842e', '临沭县', 'linshuxian', 'lsx', '371300', '371329', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('51c4a15ab55643d0bc7b507b61494b80', '大新县', 'daxinxian', 'dxx', '451400', '451424', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('51c500418b3343f4bd989ad0b998f19e', '定边县', 'dingbianxian', 'dbx', '610800', '610825', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('51c71ff6b28244989a1c5ba637a4a4bd', '市辖区', 'shixiaqu', 'sxq', '150500', '150501', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('51eb59db91094af0b8650cf639f82e23', '渠县', 'quxian', 'qx', '511700', '511725', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('51ff06a5594a48e49af2fa9a6c23c430', '南阳市', 'nanyangshi', 'nys', '410000', '411300', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('521907cad8ab44a598f8a388822bd8c8', '吴江市', 'wujiangshi', 'wjs', '320500', '320584', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('523829a64855454b8b20a0387e056308', '苏家屯区', 'sujiatunqu', 'sjtq', '210100', '210111', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('526c7d5b98824e978c9de5acc8cc2809', '大理白族自治州', 'dalibaizuzizhizhou', 'dlbzzzz', '530000', '532900', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('526e1ccc3c894781a0c844e9f8fd0327', '安福县', 'anfuxian', 'afx', '360800', '360829', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('528e0db86eab4c1785ee5fa1b64a5f84', '灵寿县', 'lingshouxian', 'lsx', '130100', '130126', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('529262aadca34201be3a2ac7b5aca787', '台江区', 'taijiangqu', 'tjq', '350100', '350103', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5295154c271942b7b4c8325da6095535', '海南省', 'hainansheng', 'hns', '1', '460000', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('52a8354252204a68a0cc52a0d341e3e4', '沙河口区', 'shahekouqu', 'shkq', '210200', '210204', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('52abc1b44b084aa58fa5d678697be5be', '中山区', 'zhongshanqu', 'zsq', '210200', '210202', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('52b0f31a3c5341e1ad7de39a8df60ab4', '岳西县', 'yuexixian', 'yxx', '340800', '340828', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('52b489eb65c747669605fce663572601', '察隅县', 'chayuxian', 'cyx', '542600', '542626', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('52b92d51608b47b08428755cebe4e09e', '忻府区', 'xinfuqu', 'xfq', '140900', '140902', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('52e177e62c3e4df8a4889318d5b88735', '文登市', 'wendengshi', 'wds', '371000', '371081', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('52fdb1a965724652a2b2e32ea0eb06ae', '大同市', 'datongshi', 'dts', '140000', '140200', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('530820fd72024436a5cdb2ff7831ae6f', '塔城地区', 'tachengdiqu', 'tcdq', '650000', '654200', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5322f8bcfb7f457690f3fccad15a6e03', '讷河市', 'neheshi', 'nhs', '230200', '230281', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('532d655f52cf426dab3872b6d77ed8cc', '沙河市', 'shaheshi', 'shs', '130500', '130582', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('534342944d044045973b1d6e1762ae4a', '涪城区', 'fuchengqu', 'fcq', '510700', '510703', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('534509e141ef4ab9a047c64dc9565509', '治多县', 'zhiduoxian', 'zdx', '632700', '632724', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('539645b3ad3f41aa9b4061905b7a603d', '浪卡子县', 'langqiazixian', 'lqzx', '542200', '542233', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('53a1000f0307467997377fb459586c1c', '开阳县', 'kaiyangxian', 'kyx', '520100', '520121', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('53a194e851a44231a9cc36c34323314f', '路北区', 'lubeiqu', 'lbq', '130200', '130203', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('53a22243ad534192ac5570757694f05c', '巫溪县', 'wuxixian', 'wxx', '500200', '500238', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('53a8b33857c649299d4b2d6366c2197c', '滕州市', 'tengzhoushi', 'tzs', '370400', '370481', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('53b661c6fd614042b451c7c6a0c78fbf', '卫辉市', 'weihuishi', 'whs', '410700', '410781', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('53c2dfe4aa4f4823be2ac973bf1783f3', '卧龙区', 'wolongqu', 'wlq', '411300', '411303', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('53e634c4ced34b66b7f59fa02a95cbbb', '市辖区', 'shixiaqu', 'sxq', '611000', '611001', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('544a6fec4c114eb2b6e0b25da71b303b', '凌河区', 'linghequ', 'lhq', '210700', '210703', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5462815fe7024317a3aeeae824990b9b', '泗县', 'sixian', 'sx', '341300', '341324', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('546c74cf23384d23ba859afb7878a8bb', '巍山彝族回族自治县', 'weishanyizuhuizuzizhixian', 'wsyzhzzzx', '532900', '532927', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('54726913b775434aa14fd216ee6cdca4', '高安市', 'gaoanshi', 'gas', '360900', '360983', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('547f13aaa960465f86fd7619deb3f37c', '莱芜市', 'laiwushi', 'lws', '370000', '371200', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('549477b0d14447c2a2e8510dc648cd1a', '雷山县', 'leishanxian', 'lsx', '522600', '522634', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('54c61090bd474063b10ce000b9ec69d2', '市辖区', 'shixiaqu', 'sxq', '610700', '610701', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('54de5c4c2a724cdabe8c2b4c9ba7d4a4', '曲水县', 'qushuixian', 'qsx', '540100', '540124', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('54eb94e3f2f74c5a94aa1d8c50d686b2', '通江县', 'tongjiangxian', 'tjx', '511900', '511921', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('54f311dcdc5540a694738b801e130ec6', '遂昌县', 'suichangxian', 'scx', '331100', '331123', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('552f10300e5f411ba2c6941d7a36d51f', '市辖区', 'shixiaqu', 'sxq', '320200', '320201', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('553389f2c1af4d078fd0d37f060b806d', '巴楚县', 'bachuxian', 'bcx', '653100', '653130', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('55372a947bc244b581d1cf68b72044f4', '左贡县', 'zuogongxian', 'zgx', '542100', '542128', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('553c5e7406dc49228c72a3a6234461a2', '无锡市', 'wuxishi', 'wxs', '320000', '320200', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('554ca6d8fc1545c1b07c4820b5bf7eff', '平南县', 'pingnanxian', 'pnx', '450800', '450821', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('557410f3442b4ee19f905b658479431b', '东阿县', 'dongexian', 'dex', '371500', '371524', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5581b5bd56004d489d8caa0eabcf6ace', '牧野区', 'muyequ', 'myq', '410700', '410711', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('558af4a55049484f9e179ad0a371b283', '商河县', 'shanghexian', 'shx', '370100', '370126', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('559bd5b027f049d68286fbf08b36cbf1', '略阳县', 'lveyangxian', 'lyx', '610700', '610727', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('55af355fb80340598fdeeb23180936d0', '瓮安县', 'wenganxian', 'wax', '522700', '522725', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('55bc1f0f8ea54ea1a86a6957d4fe0948', '元谋县', 'yuanmouxian', 'ymx', '532300', '532328', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('55c79d0e3865402daa0491045fe91cbb', '白河县', 'baihexian', 'bhx', '610900', '610929', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('55d79a1cf4e84771ba0810b85f065084', '吴堡县', 'wubuxian', 'wbx', '610800', '610829', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('55ff5b2a42e14fe1971b64d2cfd55b7d', '市辖区', 'shixiaqu', 'sxq', '511700', '511701', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56567aa2f81b420d83990a45ed06fd9e', '越城区', 'yuechengqu', 'ycq', '330600', '330602', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('566d59c3d2294d24bb47cf60eb977b1d', '铁山港区', 'tieshangangqu', 'tsgq', '450500', '450512', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56717b12f480427ab949b04f0848a3c9', '无棣县', 'wudixian', 'wdx', '371600', '371623', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56784480201946eb8807aa2ddb0df0b8', '依安县', 'yianxian', 'yax', '230200', '230223', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5685c3794a2246a88bbde4cbd27f91f0', '市辖区', 'shixiaqu', 'sxq', '130700', '130701', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('569ddd38e6374a85b9236e4e2031f799', '黎平县', 'lipingxian', 'lpx', '522600', '522631', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56adbc8d56584e66bf19af03bea16b10', '米易县', 'miyixian', 'myx', '510400', '510421', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56b73b72d60e48e6968d8f4184d70db3', '延寿县', 'yanshouxian', 'ysx', '230100', '230129', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56bbf112729945139fe003d712953305', '召陵区', 'zhaolingqu', 'zlq', '411100', '411104', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56c8305efef34f21afa9a6097fb0bf12', '宾川县', 'binchuanxian', 'bcx', '532900', '532924', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('56f70aefe248485bbba3b6c18cc6623a', '荆州区', 'jingzhouqu', 'jzq', '421000', '421003', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5705a358be2d45f2a6adcc019ed0ccec', '县', 'xian', 'x', '500000', '500200', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('571f23ad0d604152ad1622578730ae31', '永善县', 'yongshanxian', 'ysx', '530600', '530625', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5738c33f43214d3aaaae6c091654d786', '南宫市', 'nangongshi', 'ngs', '130500', '130581', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5739376ab0ea47fcadd30783c5a77435', '临猗县', 'linyixian', 'lyx', '140800', '140821', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5758313a17934d91a09538eed7752350', '兰州市', 'lanzhoushi', 'lzs', '620000', '620100', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('575aeff4732f45598d551d4d8be76b07', '理塘县', 'litangxian', 'ltx', '513300', '513334', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5762d954df88436db761be27326a6401', '申扎县', 'shenzaxian', 'szx', '542400', '542426', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5768b8cdb4db44b4bd6f3f24980fd771', '奎文区', 'kuiwenqu', 'kwq', '370700', '370705', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5769b09d260a4548920c12270e0c6a95', '长丰县', 'changfengxian', 'cfx', '340100', '340121', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57819a75a02d462d9bae5342ee7d896f', '翁牛特旗', 'wengniuteqi', 'wntq', '150400', '150426', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('578a80c68b4d439cb25a05a76635a300', '潍坊市', 'weifangshi', 'wfs', '370000', '370700', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57a50caed39c4226aca3442f467feb84', '宜章县', 'yizhangxian', 'yzx', '431000', '431022', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57ac248a78e0495e97c60d8ddf8405e9', '徐汇区', 'xuhuiqu', 'xhq', '310100', '310104', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57b1e721ae0646cd88b593b6960cbfdf', '江海区', 'jianghaiqu', 'jhq', '440700', '440704', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57b2ff75a0444b7eab875ee8184a649a', '岗巴县', 'gangbaxian', 'gbx', '542300', '542338', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57bcf1b0d0ed41839e0aea192ba6b173', '盖州市', 'gaizhoushi', 'gzs', '210800', '210881', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57cbdcd47d71457c87d03e7d74564374', '市辖区', 'shixiaqu', 'sxq', '150800', '150801', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57cc3ca1aa184f658cbd3c1fd81f8a8c', '南昌市', 'nanchangshi', 'ncs', '360000', '360100', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57e6e58f483a4383aa870482e6019710', '狮子山区', 'shizishanqu', 'szsq', '340700', '340703', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('57ea231334bd40a1bf0360aba89a7a30', '海拉尔区', 'hailaerqu', 'hleq', '150700', '150702', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5800e974707e4c6cb4a1ff68f707fd87', '海南区', 'hainanqu', 'hnq', '150300', '150303', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('581af7eb4d274ac6b379132233b09eae', '芒康县', 'mangkangxian', 'mkx', '542100', '542129', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5822da58e2e24b08943fc9e1f0dedf63', '波密县', 'bomixian', 'bmx', '542600', '542625', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5833fb79adfe4dad8533652780500dc1', '市辖区', 'shixiaqu', 'sxq', '431000', '431001', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58467751909b4bc58896507ea21a6417', '罗平县', 'luopingxian', 'lpx', '530300', '530324', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('586a8abd17c64869a68c8a63b8e75cea', '竹山县', 'zhushanxian', 'zsx', '420300', '420323', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('586c3aa3fe09450a94d1edd3453160fd', '双柏县', 'shuangbaixian', 'sbx', '532300', '532322', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5888cced1d744c90adae8f728efa2032', '白碱滩区', 'baijiantanqu', 'bjtq', '650200', '650204', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58abc258e6ab4d6483b399f9af959a3e', '大石桥市', 'dashiqiaoshi', 'dsqs', '210800', '210882', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58b24ab3717843e0b5e05698272694ee', '佛冈县', 'fogangxian', 'fgx', '441800', '441821', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58c482da58d64192a73eea4a2baf11dc', '雄县', 'xiongxian', 'xx', '130600', '130638', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58c5517e0e5a46f182a036a2005f5274', '周村区', 'zhoucunqu', 'zcq', '370300', '370306', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58d9b97952784988a358c5571bf05c01', '上杭县', 'shanghangxian', 'shx', '350800', '350823', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58da544af3ed490d8099ce9fb14d43e6', '市辖区', 'shixiaqu', 'sxq', '360600', '360601', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58de8e39b20249ada11630cb9f6dc936', '长春市', 'changchunshi', 'ccs', '220000', '220100', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58e130a9e34549569c678609b08a42e9', '海城区', 'haichengqu', 'hcq', '450500', '450502', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58ed771ea681414a98d661b90b7d7902', '无极县', 'wujixian', 'wjx', '130100', '130130', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('58f8cdcb48a24b3dbe6d2646446803e6', '嘉陵区', 'jialingqu', 'jlq', '511300', '511304', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5902f7824a4d451f8c68ef7a94d5cb1d', '文峰区', 'wenfengqu', 'wfq', '410500', '410502', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5915eb70e2314fbf8b48b010f6c3afb0', '市辖区', 'shixiaqu', 'sxq', '140800', '140801', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5918150835fa4ae990336c2ef5e987f9', '滨海县', 'binhaixian', 'bhx', '320900', '320922', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('592f1428b43d4e4782eda2ad6960db93', '天河区', 'tianhequ', 'thq', '440100', '440106', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('595f554a1b4a44b3838b65689717e788', '金山区', 'jinshanqu', 'jsq', '310100', '310116', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('596f360fb09a4bd091d9738ad7b19f37', '市辖区', 'shixiaqu', 'sxq', '510900', '510901', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59701543f3014dc99fa877444b13e5d3', '阜新市', 'fuxinshi', 'fxs', '210000', '210900', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59767e940e284e70bc6d3c128a2cf8df', '临澧县', 'linlixian', 'llx', '430700', '430724', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('597b4836a7764ba0a850de063765183b', '久治县', 'jiuzhixian', 'jzx', '632600', '632625', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59826329df4d42aaa8c8e5a7d3539046', '宽城满族自治县', 'kuanchengmanzuzizhixian', 'kcmzzzx', '130800', '130827', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('598d2286e4ed40e0b32f1716581ce520', '阿瓦提县', 'awatixian', 'awtx', '652900', '652928', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59b001ec4d614a47a525c209dda8431f', '市辖区', 'shixiaqu', 'sxq', '331000', '331001', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59c13c0fc2c643759f34242c4b81f914', '新余市', 'xinyushi', 'xys', '360000', '360500', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59db309219cf46c19ba1d556b54fb19c', '江岸区', 'jianganqu', 'jaq', '420100', '420102', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59e4f3ac732248ca930efe60adc271dd', '云岩区', 'yunyanqu', 'yyq', '520100', '520103', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('59ff67b323c94f4a89a5d924b08f0fd5', '定西市', 'dingxishi', 'dxs', '620000', '621100', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a02c6360a374df895b3b401973001f7', '西和县', 'xihexian', 'xhx', '621200', '621225', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a1b2e46ee3f4fdaa21eaad3fe773b1f', '南雄市', 'nanxiongshi', 'nxs', '440200', '440282', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a1bad02c74a4963a1d46001cc9f2e2c', '景县', 'jingxian', 'jx', '131100', '131127', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a2868ed55f74c84a56f575e85ddcc5e', '巴彦淖尔市', 'bayannaoershi', 'bynes', '150000', '150800', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a2c2a51c9e942b28bfa845b932c6d82', '仪陇县', 'yilongxian', 'ylx', '511300', '511324', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a36459cfed54cd281e4929385b85a61', '余姚市', 'yuyaoshi', 'yys', '330200', '330281', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a780e7a10764a8ab7710fffcf4cf13c', '临湘市', 'linxiangshi', 'lxs', '430600', '430682', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a7b9154c6f7448aa78aee43739fc78f', '颍泉区', 'yingquanqu', 'yqq', '341200', '341204', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a7ce0d2b2e44d49afd4fc3d5b1d21d3', '江阳区', 'jiangyangqu', 'jyq', '510500', '510502', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a8511f01d854b01aaeb4a76f32801dd', '南山区', 'nanshanqu', 'nsq', '230400', '230404', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5a9992b2657846f2820f08b110f6127e', '望城县', 'wangchengxian', 'wcx', '430100', '430122', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5aa5e36baa404d43bfffd11efd5cef64', '龙文区', 'longwenqu', 'lwq', '350600', '350603', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5aae967e28e2466496a15724d158df3c', '岳麓区', 'yueluqu', 'ylq', '430100', '430104', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5abd4d865df5483c99a66ca1b03cc0a8', '容城县', 'rongchengxian', 'rcx', '130600', '130629', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ac84d4e637d470c9828f557ec9093e7', '秦皇岛市', 'qinhuangdaoshi', 'qhds', '130000', '130300', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b00cccc9b6f4ea7b6eea520a78db5ea', '磐石市', 'panshishi', 'pss', '220200', '220284', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b00f10d0b8b40ba994dec36a968f928', '平川区', 'pingchuanqu', 'pcq', '620400', '620403', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b0263e0daa2474398ef15f5df1b7ecb', '冀州市', 'jizhoushi', 'jzs', '131100', '131181', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b09a4ffe0434bc3b69a81cbaaf10459', '武鸣县', 'wumingxian', 'wmx', '450100', '450122', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b44c9153386491793c1cac30e30bdcd', '高密市', 'gaomishi', 'gms', '370700', '370785', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b49b56ae7b94476a7f82fc46ab5b289', '白银区', 'baiyinqu', 'byq', '620400', '620402', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b54e1c65f62465382323c5a13644050', '鹤庆县', 'heqingxian', 'hqx', '532900', '532932', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b79f78de29e4f56adb7a89290b60c4f', '颍上县', 'yingshangxian', 'ysx', '341200', '341226', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b801451bdeb4c038cd57f734fbd25d3', '零陵区', 'linglingqu', 'llq', '431100', '431102', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b9096228ce140c7884b335e8493e3fe', '喀喇沁旗', 'kalaqinqi', 'klqq', '150400', '150428', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5b9c62e04c104e4090a2d8871b781fda', '肥东县', 'feidongxian', 'fdx', '340100', '340122', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5bac38a15b6e4ec18a2c7c5369e38b60', '都匀市', 'douyunshi', 'dys', '522700', '522701', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5baf0cee2326456999c7d924604ddc56', '吴起县', 'wuqixian', 'wqx', '610600', '610626', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5bc03b67949d476cab4539c894964233', '桑植县', 'sangzhixian', 'szx', '430800', '430822', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5bca769e352a4fc4b857856a0e51850f', '怀宁县', 'huainingxian', 'hnx', '340800', '340822', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5bd05864a7314907852a7fccbc8f6124', '八步区', 'babuqu', 'bbq', '451100', '451102', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5bdb4ae799ea4b07ba66d368b16559ca', '绍兴市', 'shaoxingshi', 'sxs', '330000', '330600', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5bdecd5822124b4895e91b7f5ca03bbd', '科尔沁左翼中旗', 'keerqinzuoyizhongqi', 'keqzyzq', '150500', '150521', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5bfea322f4c447a59734d95d7dc0f6bf', '淮滨县', 'huaibinxian', 'hbx', '411500', '411527', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c0322c68c5d4cbd97451174b8ca2b6b', '文圣区', 'wenshengqu', 'wsq', '211000', '211003', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c08df3fd6c4412aa266769a85d93b70', '兴庆区', 'xingqingqu', 'xqq', '640100', '640104', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c118286ee044f4caa874a9d71ef0526', '隆阳区', 'longyangqu', 'lyq', '530500', '530502', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c1f4a31f4b74f4ebe0bf95d99c104dc', '滑县', 'huaxian', 'hx', '410500', '410526', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c41bfba15e246d19b4e81fd8469b59f', '赤坎区', 'chikanqu', 'ckq', '440800', '440802', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c4a232a5e0f4f5f9d06c5c973f732b9', '含山县', 'hanshanxian', 'hsx', '341400', '341423', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c61ecfad29a43eea5627563ea9ac60c', '郊区', 'jiaoqu', 'jq', '230800', '230811', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c6d5eebbdb04fc1a779ccae90348865', '市辖区', 'shixiaqu', 'sxq', '330500', '330501', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5c984adb50414f2380c20ba3e034377d', '贵池区', 'guichiqu', 'gcq', '341700', '341702', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5cad6525698d4c039bfc30a805b5beeb', '山城区', 'shanchengqu', 'scq', '410600', '410603', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ce0de4a12f64d1a8e9594e9aba34af9', '奇台县', 'qitaixian', 'qtx', '652300', '652325', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5cf40088d9984f5b874d4e0867f32068', '潮南区', 'chaonanqu', 'cnq', '440500', '440514', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5d00779d569f42258a21fe42d23ccb5a', '子长县', 'zichangxian', 'zcx', '610600', '610623', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5d04d83f8e464fcca8a76d694818db56', '冠县', 'guanxian', 'gx', '371500', '371525', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5d179e6c6d354f288a24681169a8f928', '崇安区', 'chonganqu', 'caq', '320200', '320202', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5d27076fece44bf8a15d8ae253832041', '静宁县', 'jingningxian', 'jnx', '620800', '620826', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5d2ca88e84a74db58153b9a5b6320ed9', '西乡塘区', 'xixiangtangqu', 'xxtq', '450100', '450107', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5d31a46b4cee4ab6a6565e88e123877f', '河南蒙古族自治县', 'henanmengguzuzizhixian', 'hnmgzzzx', '632300', '632324', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5d892cc26e09424fa96fb6233d21585e', '孝南区', 'xiaonanqu', 'xnq', '420900', '420902', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5dac756d871b4218a0fa889b229795cf', '嵊州市', 'shengzhoushi', 'szs', '330600', '330683', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5dbae94346b345d59d7c549c00e690b6', '辉南县', 'huinanxian', 'hnx', '220500', '220523', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5dbd5a0c3cdb4b649d350b5de6c1b203', '市辖区', 'shixiaqu', 'sxq', '370200', '370201', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5dc342ac67aa442d89110bc63deeb054', '锦屏县', 'jinpingxian', 'jpx', '522600', '522628', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5de4fcf2ce5f47d4a9c40080a42e674e', '隆子县', 'longzixian', 'lzx', '542200', '542231', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5df63f068abe45d68098ef5b8d29e231', '兴安盟', 'xinganmeng', 'xam', '150000', '152200', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e008522d84447b7a0e776452b5ea691', '蓟县', 'jixian', 'jx', '120200', '120225', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e0488ce797148779634837deca908c4', '苍南县', 'cangnanxian', 'cnx', '330300', '330327', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e071f3ca9794238b3baad54e84e6122', '太谷县', 'taiguxian', 'tgx', '140700', '140726', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e24bd68a20f41c6b7e5bcf02ac93bff', '宣恩县', 'xuanenxian', 'xex', '422800', '422825', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e4443c8cae14dbe89d2e13b320dad7a', '龙山区', 'longshanqu', 'lsq', '220400', '220402', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e60a6d56f424c9488751a030b2d6838', '满洲里市', 'manzhoulishi', 'mzls', '150700', '150781', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e6a225a61444524b7c16f1903d6d500', '鄱阳县', 'poyangxian', 'pyx', '361100', '361128', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e6c0627e12142368d7bbbf150022d76', '石门县', 'shimenxian', 'smx', '430700', '430726', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e798193b10f473997c9a8fed845ea05', '藁城市', 'gaochengshi', 'gcs', '130100', '130182', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e833a8f89174a0a9ca7f832e9b50f14', '玉龙纳西族自治县', 'yulongnaxizuzizhixian', 'ylnxzzzx', '530700', '530721', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e83a0ef2abf4c01bcb0c95481f318a0', '河南省', 'henansheng', 'hns', '1', '410000', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5e95bc5d54ff4f759e32ba9852824ba5', '曲靖市', 'qujingshi', 'qjs', '530000', '530300', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ea7ca827fe54e53af9928db39e1e2fc', '彝良县', 'yiliangxian', 'ylx', '530600', '530628', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ea95a45f23843e4903d5a698b81f71c', '吉隆县', 'jilongxian', 'jlx', '542300', '542335', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5eaa71e60f7742918639d9d9a975154e', '城区', 'chengqu', 'cq', '441500', '441502', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ecd92211fcb4eba9519ac2beb45b417', '广南县', 'guangnanxian', 'gnx', '532600', '532627', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ed7822f40ce4e4a860179e0a5e8b8fb', '阿拉善右旗', 'alashanyouqi', 'alsyq', '152900', '152922', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ee17001a20241628b8beed750301e10', '西青区', 'xiqingqu', 'xqq', '120100', '120111', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f14a5ef63794aa6afbbf2525b7dc8fe', '兰西县', 'lanxixian', 'lxx', '231200', '231222', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f14bb6b333d4bf2a698e1522a659c6d', '晋城市', 'jinchengshi', 'jcs', '140000', '140500', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f1afb9c00d945029044dc0dd649385d', '海兴县', 'haixingxian', 'hxx', '130900', '130924', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f2a54b746d54ce4bfa62534caf30294', '禄丰县', 'lufengxian', 'lfx', '532300', '532331', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f591a00e05b41a58b846fbf53a19a1f', '殷都区', 'yindouqu', 'ydq', '410500', '410505', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f5e03bd0bdf496d8d57c3480f505204', '岳池县', 'yuechixian', 'ycx', '511600', '511621', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f62482dc8944a65a9d4a6054a60f5e7', '凉州区', 'liangzhouqu', 'lzq', '620600', '620602', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f6e77ef6e22497ab50d858b5bc7b0b6', '顺城区', 'shunchengqu', 'scq', '210400', '210411', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f8135f338004da98b77e66a560e5c25', '江北区', 'jiangbeiqu', 'jbq', '500100', '500105', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f95e89617c94e9a8ab447b66238a052', '彬县', 'binxian', 'bx', '610400', '610427', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5f9f3bd9444f443585ce514fb5296db7', '莘县', 'shenxian', 'sx', '371500', '371522', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fa54eab02844ff88eb1c6c410502091', '沂水县', 'yishuixian', 'ysx', '371300', '371323', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fa5999c99a848879a0a5aa57d4d063c', '灞桥区', 'baqiaoqu', 'bqq', '610100', '610111', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fa78759f6ad4ccb920f538c437abe8d', '日喀则地区', 'rikazediqu', 'rkzdq', '540000', '542300', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fab72c986d047c5bc8208f298004f91', '连州市', 'lianzhoushi', 'lzs', '441800', '441882', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fb7d4fc4eeb4f3eb25ccf81975ca011', '振兴区', 'zhenxingqu', 'zxq', '210600', '210603', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fb8b96a731b410caf17b9ac44b6c94a', '昌吉回族自治州', 'changjihuizuzizhizhou', 'cjhzzzz', '650000', '652300', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fcf545875144c87880d2d4661c364f9', '通海县', 'tonghaixian', 'thx', '530400', '530423', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fd1c28cfc2a479e82456470308ea6bd', '邵阳市', 'shaoyangshi', 'sys', '430000', '430500', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5fe434f95ae942039941cd55602a731d', '宜阳县', 'yiyangxian', 'yyx', '410300', '410327', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ff0a51f00594896a9c6e48aff3f32ef', '呼中区', 'huzhongqu', 'hzq', '232700', '232704', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('5ff7610fb59d493a81be2be4ada2a729', '华龙区', 'hualongqu', 'hlq', '410900', '410902', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('60047b4e86764b889e3276102aa822e2', '喀什地区', 'kashendiqu', 'ksdq', '650000', '653100', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('600fbd41e8b24ea3986f32a020ad0055', '秦淮区', 'qinhuaiqu', 'qhq', '320100', '320104', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('60168df0c5ee4f169fb04f8c59169420', '碑林区', 'beilinqu', 'blq', '610100', '610103', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6022fc78cad241e2ae0156e350393036', '铁东区', 'tiedongqu', 'tdq', '220300', '220303', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6038081386a142ef9831d237014a861b', '安源区', 'anyuanqu', 'ayq', '360300', '360302', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('604cb0a7c7b043a08901bb1700330e04', '哈密市', 'hamishi', 'hms', '652200', '652201', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('605ad5a4939a4235bd487e7262946bf6', '大渡口区', 'dadukouqu', 'ddkq', '500100', '500104', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('605e8b14ddb348e99725acc1092fd153', '威远县', 'weiyuanxian', 'wyx', '511000', '511024', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6082b1a37c4342fda45525fb622e5c7b', '市辖区', 'shixiaqu', 'sxq', '130600', '130601', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6085d0366bc84a9db12fb61f8396e9b4', '潍城区', 'weichengqu', 'wcq', '370700', '370702', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('608b29a09f8449c8976b4c501ff70bdc', '湘潭市', 'xiangtanshi', 'xts', '430000', '430300', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('60ac58c5cb304ae4ba0a277a44da4298', '彭阳县', 'pengyangxian', 'pyx', '640400', '640425', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('60b7a0093f354912af73033933c79fd8', '印江土家族苗族自治县', 'yinjiangtujiazumiaozuzizhixian', 'yjtjzmzzzx', '522200', '522226', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('60bf0cecfd67495aa6c3d81a857e0c63', '靖州苗族侗族自治县', 'jingzhoumiaozudongzuzizhixian', 'jzmzdzzzx', '431200', '431229', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6134762329574297bd0b7af28ad71803', '武胜县', 'wushengxian', 'wsx', '511600', '511622', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('613f2c1f46584d2892d733063c37e2e5', '米脂县', 'mizhixian', 'mzx', '610800', '610827', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('614c3ee06bc944049b551f3be1d83b8e', '通州区', 'tongzhouqu', 'tzq', '110100', '110112', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6166be31a39444b3b1dc6c8ea99d192f', '石林彝族自治县', 'shilinyizuzizhixian', 'slyzzzx', '530100', '530126', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6187bb49b259457a8c85957b5f3fae7e', '中江县', 'zhongjiangxian', 'zjx', '510600', '510623', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6194c3541108425f8077a58e93603e25', '合川区', 'hechuanqu', 'hcq', '500100', '500117', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61967fa07a8e48448e87e0b3d2f64e62', '和县', 'hexian', 'hx', '341400', '341424', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61a1d63991d44deeb760933f38838c32', '闵行区', 'minxingqu', 'mxq', '310100', '310112', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61b1d1c646f34dfdac16f13396850612', '盐湖区', 'yanhuqu', 'yhq', '140800', '140802', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61b9eda21c4e4c8cb9af661e435a3543', '砚山县', 'yanshanxian', 'ysx', '532600', '532622', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61bee51b87b74db58d65ab256b9c1303', '望奎县', 'wangkuixian', 'wkx', '231200', '231221', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61dc0ce4bd8546439a6c0a668916a212', '津市市', 'jinshishi', 'jss', '430700', '430781', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61e42d348be24b2d8c0a6470f46fe416', '扎囊县', 'zanangxian', 'znx', '542200', '542222', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('61fb1b82ffd44baba04a066a53b43c8e', '三台县', 'santaixian', 'stx', '510700', '510722', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6233ab524fc043ed9d94f474f5fa4ece', '黄石市', 'huangshishi', 'hss', '420000', '420200', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('62415a057569442da1a17c5991a860df', '吐鲁番地区', 'tulufandiqu', 'tlfdq', '650000', '652100', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('624332c4aa5e46ceba95fae6efa8052b', '越西县', 'yuexixian', 'yxx', '513400', '513434', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('624d36ea7b3941d9a152da2dfd52d992', '平山县', 'pingshanxian', 'psx', '130100', '130131', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('625ac5e0630b43ffbcc34b2083c221d1', '站前区', 'zhanqianqu', 'zqq', '210800', '210802', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6274de7a9bb849ebafacc3f1d63e502b', '同仁县', 'tongrenxian', 'trx', '632300', '632321', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('628be0dcccc347c991138aae32fedeb0', '西秀区', 'xixiuqu', 'xxq', '520400', '520402', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('629fb48abe2648a4bb7cdda1cd1c4f65', '大洼县', 'dawaxian', 'dwx', '211100', '211121', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('62cf32b35e5744e4949de3ce5becdc9a', '宣城市', 'xuanchengshi', 'xcs', '340000', '341800', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('62ed64d9082c42718eb9dc062c92d2ee', '宝鸡市', 'baojishi', 'bjs', '610000', '610300', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6304dbb1a36542b7850c81dd25a5bb25', '新市区', 'xinshiqu', 'xsq', '130600', '130600', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('631b17a26adc4eb99ac762e27902b8d7', '蒙阴县', 'mengyinxian', 'myx', '371300', '371328', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('637d1879fc454a6b99a8f55fd6e28858', '水城县', 'shuichengxian', 'scx', '520200', '520221', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('639143c5397a4bad96c3ce59dd99f9fe', '和田地区', 'hetiandiqu', 'htdq', '650000', '653200', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63b8a325bffb44a8969acbd488eb39a0', '城阳区', 'chengyangqu', 'cyq', '370200', '370214', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63cd3940a5764a21bc5624e7583498e9', '福安市', 'fuanshi', 'fas', '350900', '350981', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63d79d810ad6449eb8de66682dd676c7', '甘泉县', 'ganquanxian', 'gqx', '610600', '610627', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63df5de656ab4c048915427f90d842cc', '乌恰县', 'wuqiaxian', 'wqx', '653000', '653024', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63ea96383e174310a6d1815af387f043', '永定区', 'yongdingqu', 'ydq', '430800', '430802', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63f87f4e68a547e282a7a0bc5cec89fc', '阿勒泰地区', 'aletaidiqu', 'altdq', '650000', '654300', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63fbca997ef1462aac08ad376d50ee56', '平和县', 'pinghexian', 'phx', '350600', '350628', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('63ffc537bfcd40f49b2aea59339b94d3', '白水县', 'baishuixian', 'bsx', '610500', '610527', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('64074f7f01f34476af8acbbdd02e8b09', '新荣区', 'xinrongqu', 'xrq', '140200', '140212', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6411a08902af4c04ba32706c823bfa98', '淮北市', 'huaibeishi', 'hbs', '340000', '340600', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('642593f6d2d1469d811014a5036a4768', '桦甸市', 'huadianshi', 'hds', '220200', '220282', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('643ff6a9fba84b57810de156bb3514e7', '镇江市', 'zhenjiangshi', 'zjs', '320000', '321100', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('64686b77edcd43d3b505db23430957b2', '衡阳县', 'hengyangxian', 'hyx', '430400', '430421', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('64802eb4a026437ebf61a0aff1f3526e', '黄梅县', 'huangmeixian', 'hmx', '421100', '421127', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('649853ad4776414bb409c673c14e422f', '太子河区', 'taizihequ', 'tzhq', '211000', '211011', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('64a69d7380e5455dbfaa628d2e44e607', '长治市', 'changzhishi', 'czs', '140000', '140400', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('64a91cbdcb0a4f08af3d2def75b5d8c3', '柳城县', 'liuchengxian', 'lcx', '450200', '450222', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('64aa9835e782491db47bc13bfdf26854', '齐河县', 'qihexian', 'qhx', '371400', '371425', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('64d20bf1d6f54714aa7ed5549aa9f28d', '平遥县', 'pingyaoxian', 'pyx', '140700', '140728', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6524cfd762ec43669bdb3ed51a16b9ec', '未央区', 'weiyangqu', 'wyq', '610100', '610112', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6546df368d4a4532a2a3e277de4be3c5', '交口县', 'jiaokouxian', 'jkx', '141100', '141130', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('656cf97da5804abb99463dd9a51378b2', '刚察县', 'gangchaxian', 'gcx', '632200', '632224', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('65701a39055f40d5a58e42e2adf23724', '丽江市', 'lijiangshi', 'ljs', '530000', '530700', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6593a7941f9d47978f09554cfa53d01d', '礼县', 'lixian', 'lx', '621200', '621226', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('659e2a22e2424193b683728b19a59909', '双桥区', 'shuangqiaoqu', 'sqq', '500100', '500111', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('65b77a042625495a95693149883845b4', '富顺县', 'fushunxian', 'fsx', '510300', '510322', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('65c01e0f442b41e79606f0770c343852', '贡山独龙族怒族自治县', 'gongshandulongzunuzuzizhixian', 'gsdlznzzzx', '533300', '533324', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('65cb240469d14eff8f6fc4aa7a40c32a', '市辖区', 'shixiaqu', 'sxq', '460200', '460201', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('65d26c5832af485ea70738fefa239f7d', '盂县', 'yuxian', 'yx', '140300', '140322', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('65e26f0533be45afb4866695469d1528', '庆阳市', 'qingyangshi', 'qys', '620000', '621000', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('65ff2b1c594e486988bba9ca5999662c', '和顺县', 'heshunxian', 'hsx', '140700', '140723', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6604df9d36f24fd997d6ecb1540ef253', '库尔勒市', 'kuerleshi', 'kels', '652800', '652801', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('661930a0b81a4565a8c505e762ecf030', '孟津县', 'mengjinxian', 'mjx', '410300', '410322', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('662fc7939a4d4f4883dc5a31f1d8dbb8', '乐至县', 'lezhixian', 'lzx', '512000', '512022', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('663e72218d554328912fd430846b8101', '金华市', 'jinhuashi', 'jhs', '330000', '330700', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6643f231913b438e85cbfa1bdcf0cbf5', '衡阳市', 'hengyangshi', 'hys', '430000', '430400', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('669c8ec3d41e4dd88c395024c730905a', '宁洱哈尼族彝族自治县', 'ningerhanizuyizuzizhixian', 'nehnzyzzzx', '530800', '530821', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('669db760705b49e2997389c5bd90612d', '市辖区', 'shixiaqu', 'sxq', '421200', '421201', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('66b060f10e914578bf9090d07abb5686', '永德县', 'yongdexian', 'ydx', '530900', '530923', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('66b70a1a906d4d4b93729f6b5b6a0bf4', '江西省', 'jiangxisheng', 'jxs', '1', '360000', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('66bdebf80b514414b385385f95adcc5e', '东川区', 'dongchuanqu', 'dcq', '530100', '530113', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('66ca87aee9bb48dc917446629693ae58', '焦作市', 'jiaozuoshi', 'jzs', '410000', '410800', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('66da3c5169984fba9ede7cc2fb5d799f', '西市区', 'xishiqu', 'xsq', '210800', '210803', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('66e4a36b85b74724bd8a66afaf821f9e', '南江县', 'nanjiangxian', 'njx', '511900', '511922', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('66ea923b4e264aff85da1716b949a746', '市辖区', 'shixiaqu', 'sxq', '510600', '510601', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('670aa5828037430b9d73aeeafe583a8c', '得荣县', 'derongxian', 'drx', '513300', '513338', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6711fb6fcc264de6ba83ee7782cb973a', '新平彝族傣族自治县', 'xinpingyizudaizuzizhixian', 'xpyzdzzzx', '530400', '530427', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('671eb48720e046088acd54c576224fbc', '岳阳楼区', 'yueyanglouqu', 'yylq', '430600', '430602', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6723d7edc2c6435691035902ceeae29e', '武夷山市', 'wuyishanshi', 'wyss', '350700', '350782', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6741ad5ed43a441997c116b8910c607c', '陇川县', 'longchuanxian', 'lcx', '533100', '533124', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('675b285a122241298daa19e7bf24f368', '武穴市', 'wuxueshi', 'wxs', '421100', '421182', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('67764759b4284a2883ef707dbcbfb348', '会东县', 'huidongxian', 'hdx', '513400', '513426', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('677f33d2bfd8437083586eefbb22145e', '张店区', 'zhangdianqu', 'zdq', '370300', '370303', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('679d377a15cc496dbc3ed3a45ac0417c', '太白县', 'taibaixian', 'tbx', '610300', '610331', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('67c7ad7214b24e959257fc8aaa770819', '济南市', 'jinanshi', 'jns', '370000', '370100', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('67da13429664475da9f9355c13990151', '市辖区', 'shixiaqu', 'sxq', '341100', '341101', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('67f1c38d827f4f6bbeed84dce4d3afe5', '龙马潭区', 'longmatanqu', 'lmtq', '510500', '510504', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('67f46eee81f9432bba9018498971c4d8', '华容区', 'huarongqu', 'hrq', '420700', '420703', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('681dcfbde23842369827f5c5e28abc5b', '德庆县', 'deqingxian', 'dqx', '441200', '441226', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68220e9db45747e8adad10d89a996353', '太仆寺旗', 'taipusiqi', 'tpsq', '152500', '152527', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6831ebaace5c4b4a808a77b014dcc08d', '广西壮族自治区', 'guangxizhuangzuzizhiqu', 'gxzzzzq', '1', '450000', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68362edcbbd94c439856ef297e74be85', '即墨市', 'jimoshi', 'jms', '370200', '370282', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68374511a6c546da8f8fd12638d8ea04', '大观区', 'daguanqu', 'dgq', '340800', '340803', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('684720b5981e43cbacf61137b151fa55', '武宣县', 'wuxuanxian', 'wxx', '451300', '451323', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('684e7af2f9d940458a3cf5c0443be556', '淳化县', 'chunhuaxian', 'chx', '610400', '610430', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('685de9127c55461790ef8fd186bf4fac', '市辖区', 'shixiaqu', 'sxq', '330600', '330601', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6862adddbf054e299a2d3b7348e53015', '涿州市', 'zhuozhoushi', 'zzs', '130600', '130681', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6877ad0d069c4be1936d07f21bd1f331', '乾县', 'qianxian', 'qx', '610400', '610424', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68881e02a24745f6bf2ef01b9b5b30ca', '肇源县', 'zhaoyuanxian', 'zyx', '230600', '230622', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6891d5e4dd764e1e837b717df87196c2', '延边朝鲜族自治州', 'yanbianchaoxianzuzizhizhou', 'ybcxzzzz', '220000', '222400', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68d8be98999643a5ac9afde535b2087c', '太康县', 'taikangxian', 'tkx', '411600', '411627', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68ec9efd51c84d8292641e0dbf29cc4e', '日照市', 'rizhaoshi', 'rzs', '370000', '371100', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68fa61992ce54694a0ed14addda9a201', '遵化市', 'zunhuashi', 'zhs', '130200', '130281', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('68fc616b99a54e81a71b2985265fa40e', '罗江县', 'luojiangxian', 'ljx', '510600', '510626', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6916e361d94d4baea7b762d3b14d2ecc', '昆明市', 'kunmingshi', 'kms', '530000', '530100', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('69277041afcf490bb7cf8af84db6740e', '临沧市', 'lincangshi', 'lcs', '530000', '530900', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('692b1302e1344c618134381d53a14bf2', '南芬区', 'nanfenqu', 'nfq', '210500', '210505', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('693236f208034541a731bd2a9f04c438', '宝丰县', 'baofengxian', 'bfx', '410400', '410421', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6950e372d7e540c6a28154f259fb15e1', '阳明区', 'yangmingqu', 'ymq', '231000', '231003', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6954b7f26fcc4bd9bcb723f3c2bdbac6', '阜新蒙古族自治县', 'fuxinmengguzuzizhixian', 'fxmgzzzx', '210900', '210921', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('69597032f235425098b727c7e73771ae', '顺德区', 'shundequ', 'sdq', '440600', '440606', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('695f9d80791b49879cccdf76f90c6b54', '武陵源区', 'wulingyuanqu', 'wlyq', '430800', '430811', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('696233d164fe425f93f66cb7a9205d1f', '庆元县', 'qingyuanxian', 'qyx', '331100', '331126', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6965819653a247a883155342053cc943', '樊城区', 'fanchengqu', 'fcq', '420600', '420606', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6973f3ce72984c30957e37d119702238', '郊区', 'jiaoqu', 'jq', '140300', '140311', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('697b09b91a104cf2ae7fba733ec32334', '柯城区', 'kechengqu', 'kcq', '330800', '330802', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('699789e9d63041e5aad113f0512dd30e', '壤塘县', 'rangtangxian', 'rtx', '513200', '513230', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('69f9a1adca9e4a07ab18e6da8d293189', '玄武区', 'xuanwuqu', 'xwq', '320100', '320102', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a0734c3607b43fa9d70ae3fce7f92df', '丰宁满族自治县', 'fengningmanzuzizhixian', 'fnmzzzx', '130800', '130826', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a18f4811bfe41208b527282de37d8bc', '武威市', 'wuweishi', 'wws', '620000', '620600', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a34d143f28044748ad44e9f993a26cc', '商丘市', 'shangqiushi', 'sqs', '410000', '411400', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a5001aee12446f19f552174376a60cc', '繁峙县', 'fanzhixian', 'fzx', '140900', '140924', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a51e46693ea44c9bd78fda548bec86e', '双峰县', 'shuangfengxian', 'sfx', '431300', '431321', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a55172f92b6496eac83818230f10619', '阿勒泰市', 'aletaishi', 'alts', '654300', '654301', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a5624bd0c304339a26bc0e8b367a75f', '普陀区', 'putuoqu', 'ptq', '330900', '330903', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a5a798f51d744ddb79449123231e64a', '固安县', 'guanxian', 'gax', '131000', '131022', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a71fd72f9914204bc7ff523ce9a575d', '平潭县', 'pingtanxian', 'ptx', '350100', '350128', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6a7dbb5553984e29addcef46c0b6ef50', '铜陵市', 'tonglingshi', 'tls', '340000', '340700', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6aa37448a6894c7ea017490a71974a05', '鹤峰县', 'hefengxian', 'hfx', '422800', '422828', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ab6ce9eac9f4071a182dbaae753bea3', '市辖区', 'shixiaqu', 'sxq', '341300', '341301', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ac348169b624094be5650b38cfbb3a0', '惠民县', 'huiminxian', 'hmx', '371600', '371621', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6acb7c66e1b44329ae54a8e0c6ace53a', '万秀区', 'wanxiuqu', 'wxq', '450400', '450403', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ae07a77ea834818ad981a9c1954ffe6', '北京市', 'beijingshi', 'bjs', '1', '110000', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6b2815b82c784c7d8a03e19d4fa15bce', '汝州市', 'ruzhoushi', 'rzs', '410400', '410482', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6b57265b87304d0287f17ac6bf680cf1', '平舆县', 'pingyuxian', 'pyx', '411700', '411723', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6b62898b5e43411a9390c005e55799f9', '金秀瑶族自治县', 'jinxiuyaozuzizhixian', 'jxyzzzx', '451300', '451324', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6b8fd807308146de9d46ff5b1589ddec', '钟山区', 'zhongshanqu', 'zsq', '520200', '520201', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6bc721bb77a34c549f2af7bbc96d60c7', '市辖区', 'shixiaqu', 'sxq', '440600', '440601', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6bcdbc857bcc4344961a2910e3dcd142', '青云谱区', 'qingyunpuqu', 'qypq', '360100', '360104', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6be494f5e26b4616b2c80a3b42c9bdf5', '川汇区', 'chuanhuiqu', 'chq', '411600', '411602', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6be61f43d6864ab199f99eb050595189', '南丰县', 'nanfengxian', 'nfx', '361000', '361023', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6bea3d2488bd481f95b688e931d87468', '晋源区', 'jinyuanqu', 'jyq', '140100', '140110', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6bec59d7f349454fa279d85bbcb5c6ff', '东丽区', 'dongliqu', 'dlq', '120100', '120110', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6c13e67352304264b924d84a0dbe7379', '堆龙德庆县', 'duilongdeqingxian', 'dldqx', '540100', '540125', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6c227b17e4a14297b4b5d5bd955319ab', '江夏区', 'jiangxiaqu', 'jxq', '420100', '420115', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6c38d9f5cf704ba7b88c7587fa44917c', '崇义县', 'chongyixian', 'cyx', '360700', '360725', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6c5dbf911a7a4ecab4c45b57858b3883', '东阳市', 'dongyangshi', 'dys', '330700', '330783', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6c95082c5c644319843426984dab4630', '长沙市', 'changshashi', 'css', '430000', '430100', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ca28bd22cad40efba951fb7191afbd3', '交城县', 'jiaochengxian', 'jcx', '141100', '141122', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ca6624a98524ed7b72e8df84b941ba4', '类乌齐县', 'leiwuqixian', 'lwqx', '542100', '542124', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6cb0b3473c234b9e8891fc647f5e7d2e', '南召县', 'nanzhaoxian', 'nzx', '411300', '411321', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6cb1351320464af2af44716d94c29b49', '斗门区', 'doumenqu', 'dmq', '440400', '440403', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6cb735e81ece493694af4b94e9066cad', '炎陵县', 'yanlingxian', 'ylx', '430200', '430225', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6cd714d442e04aa2bc6c8e8c13389a3c', '溪湖区', 'xihuqu', 'xhq', '210500', '210503', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ce107f55d7e413fbdd93eb0ee2c6745', '余庆县', 'yuqingxian', 'yqx', '520300', '520329', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ce317514f9845e59adfa7f739334501', '泗阳县', 'siyangxian', 'syx', '321300', '321323', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d0747a1a02045c7a5fd53326db10fc5', '息烽县', 'xifengxian', 'xfx', '520100', '520122', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d09b6ac829944b286f3706a9875c52f', '蓬莱市', 'penglaishi', 'pls', '370600', '370684', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d25ede75b8642b3b7e2d9f9cae5d128', '霍城县', 'huochengxian', 'hcx', '654000', '654023', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d3928d3cc92483486f5ee04f356d7f8', '大庆市', 'daqingshi', 'dqs', '230000', '230600', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d68af6629aa493fa4483b4de2cc7421', '句容市', 'jurongshi', 'jrs', '321100', '321183', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d792b05a3d44721ae78995b24f271ca', '民权县', 'minquanxian', 'mqx', '411400', '411421', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d797ab4f8504d13a66d4918d3f36efd', '陈仓区', 'chencangqu', 'ccq', '610300', '610304', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d79a67e391b4a24b8302490ae110584', '嘉鱼县', 'jiayuxian', 'jyx', '421200', '421221', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6d9c4090b0cf4300b3ba2d0ff3403bfe', '市辖区', 'shixiaqu', 'sxq', '410500', '410501', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6db655f30aab4da194739e0d7c28c6ed', '林西县', 'linxixian', 'lxx', '150400', '150424', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6dc37b03ed1640d581f04efc973776d8', '新市区', 'xinshiqu', 'xsq', '650100', '650104', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6de1b2a0e3ac48cabba5352e99cb79e4', '金阳县', 'jinyangxian', 'jyx', '513400', '513430', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e04a3c756e84294b2830615fd952559', '市辖区', 'shixiaqu', 'sxq', '511400', '511401', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e0c3d1d32454e988a43459d56bac9c2', '大冶市', 'dayeshi', 'dys', '420200', '420281', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e0d5cbbaede4547a7a0678c2d1e0f00', '内蒙古自治区', 'neimengguzizhiqu', 'nmgzzq', '1', '150000', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e12da9c52fe4812a9111fdb7b3f4282', '松潘县', 'songpanxian', 'spx', '513200', '513224', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e182051171046e4a4f405dfe7971b8c', '高平市', 'gaopingshi', 'gps', '140500', '140581', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e1f8fb40d0a4c7096a235f01918ba9d', '泽普县', 'zepuxian', 'zpx', '653100', '653124', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e4fec6f188c4f0f908aa743fec3384f', '鄯善县', 'shanshanxian', 'ssx', '652100', '652122', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e56543792f141218377b91748bd3ac3', '市辖区', 'shixiaqu', 'sxq', '450200', '450201', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e58d9ef79cc4a92a337ebf0bb8f1420', '康平县', 'kangpingxian', 'kpx', '210100', '210123', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e86723745e44c3298bf84e8b163a766', '瀍河回族区', 'chanhehuizuqu', 'chhzq', '410300', '410304', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6e87d63f5a114317bcca3931fd921cc9', '安定区', 'andingqu', 'adq', '621100', '621102', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ea47f6f13ad48ff99f9e336643c58d6', '都江堰市', 'doujiangyanshi', 'djys', '510100', '510181', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ea5f9b50bbc404689941cad314c2941', '昭通市', 'zhaotongshi', 'zts', '530000', '530600', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6ebd5c5595df40d3ad4938b348a4bc4b', '襄阳区', 'xiangyangqu', 'xyq', '420600', '420607', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6eda3959f2b548cead13675da037b9c9', '深泽县', 'shenzexian', 'szx', '130100', '130128', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f17dab1abde437b8debd3cfb4206e50', '革吉县', 'gejixian', 'gjx', '542500', '542525', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f386b6569b641da8f3d54fb9b819961', '樟树市', 'zhangshushi', 'zss', '360900', '360982', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f4f36d4464f419c98d7b55a593b2e67', '牡丹区', 'mudanqu', 'mdq', '371700', '371702', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f5b81e340d54e43952f939769250647', '市辖区', 'shixiaqu', 'sxq', '340700', '340701', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f75dee8306b4eb88227147abe9a115d', '市辖区', 'shixiaqu', 'sxq', '420900', '420901', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f79f9b13fb849e697ded5d9aea927d2', '莎车县', 'suochexian', 'scx', '653100', '653125', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f8d5bb302de40b3ac67ef0a366d0bdd', '市辖区', 'shixiaqu', 'sxq', '370500', '370501', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6f9cdf004eb042fdaa60f6e561a6cc09', '昭苏县', 'zhaosuxian', 'zsx', '654000', '654026', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6fb95bdcdb154550a41e71a3b1412c4a', '沧县', 'cangxian', 'cx', '130900', '130921', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('6fbbb78c946a49009bbfe27e21f114e6', '金明区', 'jinmingqu', 'jmq', '410200', '410211', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('700b515101d841159d7aac176f80db20', '蕲春县', 'qichunxian', 'qcx', '421100', '421126', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70193c4240ee480f997835e41f3bea98', '爱民区', 'aiminqu', 'amq', '231000', '231004', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('701a1bdeb0a14134a3ddeba24dc2f161', '叶县', 'yexian', 'yx', '410400', '410422', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7029528144cc4eb895bf4dfc733a4895', '市辖区', 'shixiaqu', 'sxq', '440200', '440201', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7063de5e3de94363b2646159df498318', '克山县', 'keshanxian', 'ksx', '230200', '230229', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('706526c1fff845cbb83bd4fef0044ee5', '民和回族土族自治县', 'minhehuizutuzuzizhixian', 'mhhztzzzx', '632100', '632122', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('709748d0b68e4649b59344ec74583f1e', '环江毛南族自治县', 'huanjiangmaonanzuzizhixian', 'hjmnzzzx', '451200', '451226', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('709b73f87bc142c4bd9a52808149fade', '于洪区', 'yuhongqu', 'yhq', '210100', '210114', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('709cd3c4aea14e6e894297ec837c3b49', '榆次区', 'yuciqu', 'ycq', '140700', '140702', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70a3d902e0384b68b33906cd38a9e1a9', '长治县', 'changzhixian', 'czx', '140400', '140421', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70bb23a2d92f43da85c21891cfd3795d', '武宁县', 'wuningxian', 'wnx', '360400', '360423', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70c6c0d425c144ec8270cc80003626c2', '淮安市', 'huaianshi', 'has', '320000', '320800', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70ccb2a92f7341b98805984a587a68ee', '双鸭山市', 'shuangyashanshi', 'syss', '230000', '230500', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70d07379785f46d7a217555787bd8457', '三门县', 'sanmenxian', 'smx', '331000', '331022', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70d3f3b2be77436f81070fa2c2501d07', '绿园区', 'lvyuanqu', 'lyq', '220100', '220106', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70e8c1eab8a24c3e826320a63c877797', '八公山区', 'bagongshanqu', 'bgsq', '340400', '340405', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70f04e3b860c47c0aa6a533f5e49941f', '泰来县', 'tailaixian', 'tlx', '230200', '230224', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('70f87853030147b181bec3d10765cca5', '市辖区', 'shixiaqu', 'sxq', '540100', '540101', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7100c6852a324a2caff5b76a741be87e', '汕头市', 'shantoushi', 'sts', '440000', '440500', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('711f646445b44122bc7904879cefce8a', '石台县', 'shitaixian', 'stx', '341700', '341722', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7141f3c6c16b448faa8ce8ebc9f68afd', '东昌府区', 'dongchangfuqu', 'dcfq', '371500', '371502', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7148043e96c2462a9925fc093f50e642', '巴青县', 'baqingxian', 'bqx', '542400', '542429', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('714b3ece51fe47068ceded136b2cba64', '青冈县', 'qinggangxian', 'qgx', '231200', '231223', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7151b296835a4be3a798bbc1529ba5f0', '遵义县', 'zunyixian', 'zyx', '520300', '520321', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('715e0ff430464548a6e7345985fe0754', '攸县', 'youxian', 'yx', '430200', '430223', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('718360615ee044ff81af9aff555e4759', '新乡县', 'xinxiangxian', 'xxx', '410700', '410721', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7183f2f0a98b448faa82325a75a3ab46', '仁怀市', 'renhuaishi', 'rhs', '520300', '520382', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('71860f89822f4f70bf97d3bbdf39b7c3', '济宁市', 'jiningshi', 'jns', '370000', '370800', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7195047ba4614652aa66778f2b681c28', '市辖区', 'shixiaqu', 'sxq', '371600', '371601', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('71bf6dae638a40228436903f7a5fdc80', '尚志市', 'shangzhishi', 'szs', '230100', '230183', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('71dbb8294e7e4e12834b4a536dcdde65', '怀仁县', 'huairenxian', 'hrx', '140600', '140624', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('71e056c6c4b24f4f9ea404dd324f5c13', '荣成市', 'rongchengshi', 'rcs', '371000', '371082', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('71f0dd2598bf4cbf94ad228bb6938221', '吉县', 'jixian', 'jx', '141000', '141028', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7203a9428f194f748236838ef30c1991', '罗源县', 'luoyuanxian', 'lyx', '350100', '350123', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72074488c4364332b85bc829916436dd', '秀英区', 'xiuyingqu', 'xyq', '460100', '460105', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7207ba2a562a4b1ab468f1a13c4cf3ed', '安新县', 'anxinxian', 'axx', '130600', '130632', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('720c409c2c5d42a7859497dac4d89870', '清苑县', 'qingyuanxian', 'qyx', '130600', '130622', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7213cc0922e14379a77b305be120cebc', '港口区', 'gangkouqu', 'gkq', '450600', '450602', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7220ce3abc554dccbd37fdee262bf9ed', '金州区', 'jinzhouqu', 'jzq', '210200', '210213', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('723c6ba8d36c4ca2aa472cce54ff8a2e', '紫阳县', 'ziyangxian', 'zyx', '610900', '610924', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('724adec4187444109ea347cdd31a5d54', '宝山区', 'baoshanqu', 'bsq', '310100', '310113', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('724c65963095488c948b6779ada50791', '龙游县', 'longyouxian', 'lyx', '330800', '330825', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72a70211842a47a1a5db77c0cb2ecd80', '上饶市', 'shangraoshi', 'srs', '360000', '361100', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72c0295c02ef4725b8b65ca1aa5e4cb5', '洛南县', 'luonanxian', 'lnx', '611000', '611021', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72c7342dc86c4eb4b7d14d85bfe27db3', '中卫市', 'zhongweishi', 'zws', '640000', '640500', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72d2d20e30654141bedd9ad4efda8ff7', '宁晋县', 'ningjinxian', 'njx', '130500', '130528', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72e46220c07b4e7681083d8f6f05ae17', '柳江县', 'liujiangxian', 'ljx', '450200', '450221', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72e623b204084c96937b429e06db68b1', '东莞市', 'dongguanshi', 'dgs', '440000', '441900', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('72f0adca59a548acafa2e0dc4b2c683d', '吴兴区', 'wuxingqu', 'wxq', '330500', '330502', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7302d2157ad14a56911c75ccb6ffb79f', '矿区', 'kuangqu', 'kq', '140300', '140303', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('73154f7c47134b5bb89545e9a54d656e', '民乐县', 'minlexian', 'mlx', '620700', '620722', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('73410fc3042e437fa11a57b981539f0e', '汉寿县', 'hanshouxian', 'hsx', '430700', '430722', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('734c75287de64ae6abb95b7e93ee1ddf', '荆门市', 'jingmenshi', 'jms', '420000', '420800', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('734e5d3151c544caae11d405785b6ef2', '黄陵县', 'huanglingxian', 'hlx', '610600', '610632', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('734f396d723d446fa0fbec9a31912a27', '古丈县', 'guzhangxian', 'gzx', '433100', '433126', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7364189308324a8cbbd08cde4d7e601c', '定南县', 'dingnanxian', 'dnx', '360700', '360728', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('73735b086b3f4bae9f6aa0e31735ae14', '黑水县', 'heishuixian', 'hsx', '513200', '513228', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('737be1d8b41f4032a90466314b0d689f', '连山区', 'lianshanqu', 'lsq', '211400', '211402', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('737c310043b5432ba4e1a669372adaa3', '荷塘区', 'hetangqu', 'htq', '430200', '430202', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('73816c39c827472b9c3d62999ddcb587', '平塘县', 'pingtangxian', 'ptx', '522700', '522727', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('739564f673a241488ce517842532f72f', '龙城区', 'longchengqu', 'lcq', '211300', '211303', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('739a19c7290b43028d6d2cb4641fa12f', '韶山市', 'shaoshanshi', 'sss', '430300', '430382', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('73e301579ea648b3b274697b479508bf', '宁安市', 'ninganshi', 'nas', '231000', '231084', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7406e56ff57a44f98b51b0b75eed7ffe', '田东县', 'tiandongxian', 'tdx', '451000', '451022', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('740abf4b6c4447e6994f948bf91ef008', '赣州市', 'ganzhoushi', 'gzs', '360000', '360700', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7423bfe0a7364f348f2a9ff36c3e577c', '南乐县', 'nanlexian', 'nlx', '410900', '410923', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('742d2cdce4454ffda75cf021e8ddc3a5', '崇礼县', 'chonglixian', 'clx', '130700', '130733', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('743639e392204f7383a3efef56c49ecb', '朔城区', 'shuochengqu', 'scq', '140600', '140602', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74368876736949a08b7e4cf1316436ce', '邕宁区', 'yongningqu', 'ynq', '450100', '450109', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7437f8a9b39c406db600b0d78b766e5e', '山阳县', 'shanyangxian', 'syx', '611000', '611024', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('744ac50670f94b06908b3c101232d45c', '轮台县', 'luntaixian', 'ltx', '652800', '652822', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7458cd2303d542db812729cb92c81b65', '市辖区', 'shixiaqu', 'sxq', '140300', '140301', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7467ca27dfbe4d75b3e5f8058194a24d', '普安县', 'puanxian', 'pax', '522300', '522323', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('746b0203b2c84ee3add2fa5a4d78dc88', '花山区', 'huashanqu', 'hsq', '340500', '340503', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('747a3e3ab27b48f89197118c94f32fcb', '小店区', 'xiaodianqu', 'xdq', '140100', '140105', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7494e8a88df14c99a04e8e98519639f3', '昌邑区', 'changyiqu', 'cyq', '220200', '220202', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74a002a617944132af0ceb2350cbac9e', '汉中市', 'hanzhongshi', 'hzs', '610000', '610700', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74a6b97f7c464e9bbb67376eb14d5988', '市辖区', 'shixiaqu', 'sxq', '341600', '341601', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74af713ee6b44aeabdc53d243fba6dfd', '将乐县', 'jianglexian', 'jlx', '350400', '350428', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74b5d11ac1ed4fc3b84436306e9dd3f6', '市辖区', 'shixiaqu', 'sxq', '430600', '430601', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74b742b7ba784ce7ab90a7a29ebce18d', '尧都区', 'yaodouqu', 'ydq', '141000', '141002', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74c40b37a3cd430f9d360dad9f38cde8', '巴音郭楞蒙古自治州', 'bayinguolengmengguzizhizhou', 'byglmgzzz', '650000', '652800', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('74e01f9d17a4460985973096e1276c46', '景宁畲族自治县', 'jingningshezuzizhixian', 'jnszzzx', '331100', '331127', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('751ee40437ec43ecbabf38711999d001', '金昌市', 'jinchangshi', 'jcs', '620000', '620300', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('75253a65577f41cea5072d105c8d8af1', '平乡县', 'pingxiangxian', 'pxx', '130500', '130532', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7546268dfc064ce88d9b9071f871a0a8', '马山县', 'mashanxian', 'msx', '450100', '450124', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('759ae5a9dc0e40a0b7af156ca3ddcc78', '花垣县', 'huayuanxian', 'hyx', '433100', '433124', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('75a177874acc4c07891fd7b5fa85cb92', '防城区', 'fangchengqu', 'fcq', '450600', '450603', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('75beb8ba687448e89eec1b02555eb99e', '盐源县', 'yanyuanxian', 'yyx', '513400', '513423', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('75c59b88c3c24f3dbccc42ecfa2ad609', '市辖区', 'shixiaqu', 'sxq', '410200', '410201', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('75cb57c657bf449e9dca8945235df60c', '马关县', 'maguanxian', 'mgx', '532600', '532625', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7602db3029de473b8c8eed0cd77bf621', '临川区', 'linchuanqu', 'lcq', '361000', '361002', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7617c546c6f64c039f75629b88c07f90', '市辖区', 'shixiaqu', 'sxq', '620400', '620401', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('763cad51d1c4456d814c5243753d310a', '清水县', 'qingshuixian', 'qsx', '620500', '620521', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('764512fdfeb24df1b605572c373dcc8c', '贞丰县', 'zhenfengxian', 'zfx', '522300', '522325', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('764f3ad161964d28af7591f827c93fba', '化德县', 'huadexian', 'hdx', '150900', '150922', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7657e6b491c6460f82523ce6d24a7ef0', '隆尧县', 'longyaoxian', 'lyx', '130500', '130525', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('768028b601aa48a19deaa22311819b23', '徐闻县', 'xuwenxian', 'xwx', '440800', '440825', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('768aa7a2039a465799aec82e99ffac83', '八道江区', 'badaojiangqu', 'bdjq', '220600', '220602', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('76df7bb47dad45d6b39f773134075d03', '静安区', 'jinganqu', 'jaq', '310100', '310106', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7706c3262b344d88a8149f953f59f7b7', '凤凰县', 'fenghuangxian', 'fhx', '433100', '433123', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('773119bdbb754688b777e469a43e2f1f', '房县', 'fangxian', 'fx', '420300', '420325', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('77316c4662e54914838a710cd4734764', '什邡市', 'shenfangshi', 'sfs', '510600', '510682', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('77392b7fb6914afd9075f4b908513761', '梅县', 'meixian', 'mx', '441400', '441421', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('776804ee185440eeadc910dcff496d92', '稻城县', 'daochengxian', 'dcx', '513300', '513337', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('776db1ec6fb74b54995cab0a1ae49471', '积石山保安族东乡族撒拉族自治县', 'jishishanbaoanzudongxiangzusalazuzizhixian', 'jssbazdxzslzzzx', '622900', '622927', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('778170a88fac40558d325420d6afdce4', '杭州市', 'hangzhoushi', 'hzs', '330000', '330100', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('77b4991a201e49b0b81539894d6506cd', '元宝区', 'yuanbaoqu', 'ybq', '210600', '210602', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('77c8105269b546d6b9ded7b8b098c725', '越秀区', 'yuexiuqu', 'yxq', '440100', '440104', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('77d3cdbfc21d4557b7cdddb2025fe219', '朝阳市', 'chaoyangshi', 'cys', '210000', '211300', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('77db98db24b44200ad433b19979f0d76', '泰安市', 'taianshi', 'tas', '370000', '370900', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('77fa34216933468fae9a880a81bd8c52', '蓬安县', 'penganxian', 'pax', '511300', '511323', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('780c751d57914fe181e80653be19ddb1', '平邑县', 'pingyixian', 'pyx', '371300', '371326', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('78187bd8ccd0455a95a3d8f961a28e1e', '任县', 'renxian', 'rx', '130500', '130526', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('784adf838a63464682501ca64fa9341b', '武定县', 'wudingxian', 'wdx', '532300', '532329', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('785bb682d89b4529a470791839a3e693', '临江市', 'linjiangshi', 'ljs', '220600', '220681', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7889bea8d6964971b94db3541d770b93', '泸水县', 'lushuixian', 'lsx', '533300', '533321', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('789244d73c254e0d862858f1516fb6bb', '鄂尔多斯市', 'eerduosishi', 'eedss', '150000', '150600', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('78b518b6946843b198003d8dfcb5ed07', '洪雅县', 'hongyaxian', 'hyx', '511400', '511423', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('78db1d53d8464e91be45d2a7ded79825', '红安县', 'honganxian', 'hax', '421100', '421122', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('791528ae6d354c2eb974839204cfa65f', '蕉岭县', 'jiaolingxian', 'jlx', '441400', '441427', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7937ff0b2ed14eb091685f10193cf234', '源城区', 'yuanchengqu', 'ycq', '441600', '441602', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7938d1f8d8384f12a0f3fa1a25718287', '李沧区', 'licangqu', 'lcq', '370200', '370213', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79641c66733a4a29aa7fdfaefedf5f4c', '宜君县', 'yijunxian', 'yjx', '610200', '610222', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7973f2a594b944208bd68bd756911121', '黎城县', 'lichengxian', 'lcx', '140400', '140426', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('799f82655b644b33838488011a3ea06c', '兖州市', 'yanzhoushi', 'yzs', '370800', '370882', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79b46b676dfe4b9cb1e61c052799e668', '大通区', 'datongqu', 'dtq', '340400', '340402', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79b475b967eb4f6ca1cbba8864ba76fc', '双塔区', 'shuangtaqu', 'stq', '211300', '211302', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79c87673ff3f440188efbd7c80194740', '兴县', 'xingxian', 'xx', '141100', '141123', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79ca417e2a38419bb160b90a8d4ae985', '铜山区', 'tongshanqu', 'tsq', '320300', '320312', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79efca348bb046d39b12ec5b93423d17', '长垣县', 'changyuanxian', 'cyx', '410700', '410728', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79f2bca860664673b21efc7c52c891e1', '宜兴市', 'yixingshi', 'yxs', '320200', '320282', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('79f8be7a7a9a42999ef97e23d1687c0b', '濉溪县', 'suixixian', 'sxx', '340600', '340621', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7a205251ae4548f6aa9f21326b736f04', '孟村回族自治县', 'mengcunhuizuzizhixian', 'mchzzzx', '130900', '130930', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7a456042224049eb8a8f3297b84fff6f', '市辖区', 'shixiaqu', 'sxq', '211100', '211101', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7a52f98f4c6d4fb8adc951c66965346d', '南靖县', 'nanjingxian', 'njx', '350600', '350627', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7a63e5c333c14bfbbeb61aa9dda3efdf', '金牛区', 'jinniuqu', 'jnq', '510100', '510106', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ad445385b5c429ea6390ef79c2deb7f', '张家口市', 'zhangjiakoushi', 'zjks', '130000', '130700', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ae6f08aa4934d5593f832d5d013a491', '黄山区', 'huangshanqu', 'hsq', '341000', '341003', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7b0d2ee0af394352b0782c6a1a194d6f', '利州区', 'lizhouqu', 'lzq', '510800', '510802', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7b0e9ac9c5904b7b9debf17a5716fe7d', '随县', 'suixian', 'sx', '421300', '421321', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7b3a3577806e4172934f49cdaad27bc2', '渑池县', 'mianchixian', 'mcx', '411200', '411221', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7b3c3e502c6c4261b5465ae11120f799', '雨山区', 'yushanqu', 'ysq', '340500', '340504', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7b55f5d889d94d3db1e6451585edabba', '市辖区', 'shixiaqu', 'sxq', '630100', '630101', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7b61fa8639d84344a30f2655a18adbc6', '市辖区', 'shixiaqu', 'sxq', '150300', '150301', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7b6687db9b2648b292eb369267efb9a9', '阳泉市', 'yangquanshi', 'yqs', '140000', '140300', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ba1af45f469409a941fa19fc31533a7', '和硕县', 'heshuoxian', 'hsx', '652800', '652828', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7bc81a8fa94943598334d54af3fe7d38', '惠城区', 'huichengqu', 'hcq', '441300', '441302', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7bd1ad4c81054c63a92903c7cf2e2406', '密山市', 'mishanshi', 'mss', '230300', '230382', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7bf117ada7db455fae7ca83a32e4a32d', '琼海市', 'qionghaishi', 'qhs', '469000', '469002', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7bf3bd980c63431a82a0c02abb1517a3', '察哈尔右翼后旗', 'chahaeryouyihouqi', 'cheyyhq', '150900', '150928', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c06c231fe554e8d9e0f76183aff6f4f', '松阳县', 'songyangxian', 'syx', '331100', '331124', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c0cc21a053b49468f212edbf5460547', '浏阳市', 'liuyangshi', 'lys', '430100', '430181', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c18d59876494ac882b4c47bce06bbae', '平度市', 'pingdushi', 'pds', '370200', '370283', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c34abd28c0b406a8768e8d7bb45bec6', '夹江县', 'jiajiangxian', 'jjx', '511100', '511126', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c4fe7293ac948be8ec0fb9b3c4098ad', '郁南县', 'yunanxian', 'ynx', '445300', '445322', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c5a146a216b4423b6f31b45137dc618', '姚安县', 'yaoanxian', 'yax', '532300', '532325', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c8b6ef22bbb4825ba732afee00b779a', '岚县', 'lanxian', 'lx', '141100', '141127', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7c9af370a50e4f349c017978891ba2a2', '高邮市', 'gaoyoushi', 'gys', '321000', '321084', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d31962dda814815b975841e2ed9eb00', '墨脱县', 'motuoxian', 'mtx', '542600', '542624', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d3b0a8356424ab29de16ed776b6bd2b', '益阳市', 'yiyangshi', 'yys', '430000', '430900', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d3f7393149a4bb78af73f8fb9438d95', '获嘉县', 'huojiaxian', 'hjx', '410700', '410724', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d5bdd7f5a2b4632abf9484946bacaa3', '淄川区', 'zichuanqu', 'zcq', '370300', '370302', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d69b2c98a954a44a62fb8f3334981ca', '饶河县', 'raohexian', 'rhx', '230500', '230524', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d6fdf8d81bf41b5b4065f5a3b59208f', '东台市', 'dongtaishi', 'dts', '320900', '320981', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d7d9f812eb54b539f1e908b824c1bc3', '北湖区', 'beihuqu', 'bhq', '431000', '431002', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7d942b975ce24425a2a8a9fd8b2d1153', '汉南区', 'hannanqu', 'hnq', '420100', '420113', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7dabbfd47a1c409bb37a8ae325356974', '阿城区', 'achengqu', 'acq', '230100', '230112', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7dad5d9183be4b91be89be81fa6bffc8', '解放区', 'jiefangqu', 'jfq', '410800', '410802', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7daebc65dada456291aa5ff593581adb', '新民市', 'xinminshi', 'xms', '210100', '210181', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7dc66165c65241b4b0ac729ef8018d17', '渝北区', 'yubeiqu', 'ybq', '500100', '500112', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7dcb484349384f038a6ee3dbd0e611a6', '武都区', 'wudouqu', 'wdq', '621200', '621202', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7dd4f10f63934699a525f5e3dba4e686', '杨陵区', 'yanglingqu', 'ylq', '610400', '610403', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7df6db3d9dcb42b8bf0816bc5daf5b2b', '右玉县', 'youyuxian', 'yyx', '140600', '140623', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7e02b8d374224cdcb32c32f64ef3f5e9', '北林区', 'beilinqu', 'blq', '231200', '231202', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7e2c1de34bb44c8fb32179d28a729234', '寿县', 'shouxian', 'sx', '341500', '341521', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7e427786577b447f8e7d894ff007cd4e', '霸州市', 'bazhoushi', 'bzs', '131000', '131081', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7e498c243d4546959efa4fab57659fb4', '新罗区', 'xinluoqu', 'xlq', '350800', '350802', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7e8c6fbf6faf46d684b3b40fdfa2e24f', '辉县市', 'huixianshi', 'hxs', '410700', '410782', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7eabcebc2290477295935be38255ceb0', '和平区', 'hepingqu', 'hpq', '120100', '120101', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ebdfc7f98b74621a67898eaac48573e', '拉萨市', 'lasashi', 'lss', '540000', '540100', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ec23032a60344e9992461cb0117028a', '泗洪县', 'sihongxian', 'shx', '321300', '321324', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ed1502d89174a05a119820e99789f49', '靖远县', 'jingyuanxian', 'jyx', '620400', '620421', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ed83a2196524954beef68bc201a93a0', '吕梁市', 'lvliangshi', 'lls', '140000', '141100', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7eeceb93528c46bca186e08fe6bf7734', '清远市', 'qingyuanshi', 'qys', '440000', '441800', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7efbce6e281b49a9abe43e4f12c424b7', '桥西区', 'qiaoxiqu', 'qxq', '130500', '130503', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f116e1cd11240b8b02a07791da349cb', '靖宇县', 'jingyuxian', 'jyx', '220600', '220622', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f12641ef43f4ca7881cb2b7f06f9625', '荔波县', 'liboxian', 'lbx', '522700', '522722', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f2894754a3f4b199b4f658655c615d8', '市辖区', 'shixiaqu', 'sxq', '320100', '320101', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f353c30475b4f35a5143ca7185f6f34', '江门市', 'jiangmenshi', 'jms', '440000', '440700', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f45ba68ab4b4bab92ecda5a9fc4376c', '达日县', 'darixian', 'drx', '632600', '632624', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f4ba5c300c14346ba05cf9557addf2f', '兴山县', 'xingshanxian', 'xsx', '420500', '420526', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f5d881e03cb46108e590c349be440cb', '太和区', 'taihequ', 'thq', '210700', '210711', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f6a05c38d154e968b8e808da2e01300', '海陵区', 'hailingqu', 'hlq', '321200', '321202', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f77efbde9da43f88d2cf6c9d0917afc', '蔡甸区', 'caidianqu', 'cdq', '420100', '420114', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7f873453de534708be7c183b916abee0', '市辖区', 'shixiaqu', 'sxq', '360700', '360701', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7fa2ade19af646f880bc496d40f0d043', '秦都区', 'qindouqu', 'qdq', '610400', '610402', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7fb2dd409d7d4e3eb319e2ce0e70ce4c', '同心县', 'tongxinxian', 'txx', '640300', '640324', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7fc67d16af6747dca8faefdff53b16a3', '肃北蒙古族自治县', 'subeimengguzuzizhixian', 'sbmgzzzx', '620900', '620923', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7fe5426df148458c8167f3a45f2aeebb', '市辖区', 'shixiaqu', 'sxq', '621200', '621201', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7fedefdf059d425892fdb96717efbb94', '陆河县', 'luhexian', 'lhx', '441500', '441523', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('7ff86cff2cfe4bbe914e09417f204f42', '兴业县', 'xingyexian', 'xyx', '450900', '450924', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8003bedd5c3747c1aa08df235c25f32a', '户县', 'huxian', 'hx', '610100', '610125', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8003e544f263403f99716abade44b059', '河北区', 'hebeiqu', 'hbq', '120100', '120105', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('800507995f3f486593fd8572574d0519', '贾汪区', 'jiawangqu', 'jwq', '320300', '320305', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('802370f0c76b42f891d839cc39122a8d', '岱岳区', 'daiyuequ', 'dyq', '370900', '370911', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8026d28090e640268b849deeee7a1dd7', '延吉市', 'yanjishi', 'yjs', '222400', '222401', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('802884dd6363401a9c3a9e4fc1b5038c', '施秉县', 'shibingxian', 'sbx', '522600', '522623', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8041349127ef45828e072077bd9e461d', '吴忠市', 'wuzhongshi', 'wzs', '640000', '640300', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('804fdaee05b44159bef5d5578e2a6cc3', '大安市', 'daanshi', 'das', '220800', '220882', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8075e5bcfa8648e3af77284261289dc6', '墨竹工卡县', 'mozhugongkaxian', 'mzgkx', '540100', '540127', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('807de713b21146aaa1394bbc817d37a0', '枣阳市', 'zaoyangshi', 'zys', '420600', '420683', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('807f781c65644a7cbd875ed50b62b1a6', '邵东县', 'shaodongxian', 'sdx', '430500', '430521', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('80f5992384ab42619b2ef637c7a4c796', '洪泽县', 'hongzexian', 'hzx', '320800', '320829', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('80ff720d42ff424eb12427ed57977595', '海门市', 'haimenshi', 'hms', '320600', '320684', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8104e4270b144fc59f93979fedec122c', '南明区', 'nanmingqu', 'nmq', '520100', '520102', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('810a1a7deb9f420982f530bc91ee1cfd', '赫山区', 'heshanqu', 'hsq', '430900', '430903', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('812af34ad3cb470f89a64698f638cd4a', '隆德县', 'longdexian', 'ldx', '640400', '640423', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('815b94f32dd24691b19435fe09b37e9a', '荔城区', 'lichengqu', 'lcq', '350300', '350304', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8162cc82b0dd4e2aa4eafc0a2c39546b', '隰县', 'xixian', 'xx', '141000', '141031', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('81ae6bb4e4b74854b33d1fc77f903657', '市辖区', 'shixiaqu', 'sxq', '110000', '110100', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('81af606fc5b94404bf85ef2811e000ea', '天镇县', 'tianzhenxian', 'tzx', '140200', '140222', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('81b61ec7a07746b3bb560b6dd8f642ca', '滨江区', 'binjiangqu', 'bjq', '330100', '330108', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('81c8f37b2c1b4ba2b4d77492319ac5bf', '闻喜县', 'wenxixian', 'wxx', '140800', '140823', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('81d03bdb7f934362852a6804e6e42648', '霞山区', 'xiashanqu', 'xsq', '440800', '440803', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('81d784aadc7b4ba494d8a5dbc768ef1d', '柳南区', 'liunanqu', 'lnq', '450200', '450204', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('81fed778d3aa4ee79d0da053ace203be', '雁峰区', 'yanfengqu', 'yfq', '430400', '430406', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('82058e39fde74e68859ce443c2bbdc7a', '宁河县', 'ninghexian', 'nhx', '120200', '120221', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8221ab3b4e144d548965912a39dba365', '天元区', 'tianyuanqu', 'tyq', '430200', '430211', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8226dc1509bd4459b1c453793a489221', '文山壮族苗族自治州', 'wenshanzhuangzumiaozuzizhizhou', 'wszzmzzzz', '530000', '532600', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8259b202035b4e0e8ff7cf3a4264a468', '广州市', 'guangzhoushi', 'gzs', '440000', '440100', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('825bef7ccf294fa7a5c5c01665edcd32', '商州区', 'shangzhouqu', 'szq', '611000', '611002', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('827147e925294950b19ef432091d41ae', '阿拉善盟', 'alashanmeng', 'alsm', '150000', '152900', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('82754880312c4e91850b6dd1c280007a', '梨树县', 'lishuxian', 'lsx', '220300', '220322', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('827858096704472dbbe40f6baafbe480', '凤翔县', 'fengxiangxian', 'fxx', '610300', '610322', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('827decd07a18438ea5f6aeb21d4e0072', '戚墅堰区', 'qishuyanqu', 'qsyq', '320400', '320405', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8289960cc4ba4e539185598ed79fcc5c', '海阳市', 'haiyangshi', 'hys', '370600', '370687', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('82a124b02a0f4307b5c45fd8ee798d43', '丹凤县', 'danfengxian', 'dfx', '611000', '611022', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('82b6966351e34abcb5abb65ca894da2e', '清城区', 'qingchengqu', 'qcq', '441800', '441802', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('82df55ccbcee4258a660f47d3a5f0d74', '市辖区', 'shixiaqu', 'sxq', '341000', '341001', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('82e70a92a0cf4b0ab4f2eb96ecdc6a40', '市辖区', 'shixiaqu', 'sxq', '360300', '360301', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('82f16d89987b4b97b3f661e5dd17daa8', '余干县', 'yuganxian', 'ygx', '361100', '361127', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('83346944a046400a9af2cc3c13ad6d06', '建湖县', 'jianhuxian', 'jhx', '320900', '320925', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('834b8f748679400da816b6d02956fd74', '高青县', 'gaoqingxian', 'gqx', '370300', '370322', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('835765aacd3a4a0cafd8f3ce017e04e3', '福州市', 'fuzhoushi', 'fzs', '350000', '350100', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('83b7a57bfaac4b9f9f32a72e7721310e', '盐亭县', 'yantingxian', 'ytx', '510700', '510723', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('83c36abcaac44ed48a30f01211f3cced', '市辖区', 'shixiaqu', 'sxq', '150100', '150101', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('83d022d799984a478a006d091b2d9d3b', '宜川县', 'yichuanxian', 'ycx', '610600', '610630', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('83e854ff7efd483da2c07bb82b2fc6ae', '青羊区', 'qingyangqu', 'qyq', '510100', '510105', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('83f5e84ec40a4890bd536ffc86839415', '章丘市', 'zhangqiushi', 'zqs', '370100', '370181', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('83fcdbea723f491ebaecaea10cb7533a', '榕城区', 'rongchengqu', 'rcq', '445200', '445202', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('840b0f2a5b824aada30a6846bb5647a1', '麦积区', 'maijiqu', 'mjq', '620500', '620503', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('841e99df4277455ea32145e55553f61d', '市辖区', 'shixiaqu', 'sxq', '441300', '441301', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('842d526c58d94e85993d7db10f85f6a8', '曲阳县', 'quyangxian', 'qyx', '130600', '130634', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('843309f4cc7c4b8aaaf74cf7f243459a', '苏仙区', 'suxianqu', 'sxq', '431000', '431003', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('844c8c027e9e458ca40bc1d4e6eb249c', '甘洛县', 'ganluoxian', 'glx', '513400', '513435', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('84566e0a4d3d4ad4ba4057d338ab1c48', '邹城市', 'zouchengshi', 'zcs', '370800', '370883', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('848b6cfb89244cbcb41a2b04d900652f', '瓯海区', 'ouhaiqu', 'ohq', '330300', '330304', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('84a80b9bf8d748fb9d48ed97aad86352', '嵊泗县', 'shengsixian', 'ssx', '330900', '330922', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('84d8f84bc3234c519fce8c429ba7cecc', '丹巴县', 'danbaxian', 'dbx', '513300', '513323', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('84ea364f2a0041e3a9dab490a6d06d30', '咸阳市', 'xianyangshi', 'xys', '610000', '610400', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('850a2f7faa224de8b7da348d9e12cfe1', '市辖区', 'shixiaqu', 'sxq', '341700', '341701', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8513766614024330b8947a88eeb456af', '清徐县', 'qingxuxian', 'qxx', '140100', '140121', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8532ea1ebaaa4fd3926ec68bc4cbd056', '城子河区', 'chengzihequ', 'czhq', '230300', '230306', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('854b39cba94d41938816f24f37bfac33', '清浦区', 'qingpuqu', 'qpq', '320800', '320811', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8551732a62394acc96a782a181b8f03b', '个旧市', 'gejiushi', 'gjs', '532500', '532501', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8553dbedb0684938baef607dd52ea8aa', '蓝田县', 'lantianxian', 'ltx', '610100', '610122', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('855d5a8cd9f1428986194681a173f00f', '德安县', 'deanxian', 'dax', '360400', '360426', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('856f74355e5b48fdb4b9648edbe896f7', '巴林左旗', 'balinzuoqi', 'blzq', '150400', '150422', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('85788e0057934357ad823ba1fbc4c082', '马村区', 'macunqu', 'mcq', '410800', '410804', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('858b5d2a337144c48a5ccd3ecaa52a9d', '自流井区', 'ziliujingqu', 'zljq', '510300', '510302', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('858ee04e0b1e494896740660fca4d213', '平昌县', 'pingchangxian', 'pcx', '511900', '511923', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8591fd0add6c431da9bfbd6f2b8e8f99', '沙县', 'shaxian', 'sx', '350400', '350427', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('85a54825ae4948dba808feced824d9d3', '建水县', 'jianshuixian', 'jsx', '532500', '532524', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('85a6ac0131ea4f9b890dfbb64622ed7e', '株洲县', 'zhuzhouxian', 'zzx', '430200', '430221', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('85c48b85c7494438b7a678306ece38e5', '龙潭区', 'longtanqu', 'ltq', '220200', '220203', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('85dc2b7807de4f1cb2c0ad3caf2683e6', '通河县', 'tonghexian', 'thx', '230100', '230128', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8622d92cf94548d39fc7fb0e33e16b45', '光泽县', 'guangzexian', 'gzx', '350700', '350723', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('863773d8f534449082493cbcd78a2463', '市辖区', 'shixiaqu', 'sxq', '210200', '210201', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('865d4663c9a242858cdb2dcd3643e6e7', '西沙群岛', 'xishaqundao', 'xsqd', '469000', '469031', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('866f4915f1434a029ccacc6816d581cc', '阆中市', 'langzhongshi', 'lzs', '511300', '511381', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8685b49db0c244cf9b2c8cf221cff4e7', '汝城县', 'ruchengxian', 'rcx', '431000', '431026', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('869a22bb6bdf4711aa397caf8168c0ea', '界首市', 'jieshoushi', 'jss', '341200', '341282', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86a1855d46cd487f91700eea8111b013', '会宁县', 'huiningxian', 'hnx', '620400', '620422', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86a6d234261848c9bcfb031159bf1977', '怀远县', 'huaiyuanxian', 'hyx', '340300', '340321', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86a8323f25c5461c88be31419954cea0', '柘城县', 'zhechengxian', 'zcx', '411400', '411424', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86b434fa6fc5423682ee8d21ba613ff3', '林州市', 'linzhoushi', 'lzs', '410500', '410581', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86b99ca85e1c42d3b9d65d6444c56335', '隆安县', 'longanxian', 'lax', '450100', '450123', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86c8c9f36c53416eb47cb2cc406f8436', '化州市', 'huazhoushi', 'hzs', '440900', '440982', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86ca1e6ff31644f7947666bda7d83dc4', '市辖区', 'shixiaqu', 'sxq', '440500', '440501', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86e1ac51936f4a05ad2125dd3419c141', '静海县', 'jinghaixian', 'jhx', '120200', '120223', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86e4e2e347be43faaccc9a1d929e1730', '和田县', 'hetianxian', 'htx', '653200', '653221', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('86f8908dc7e540229fa4e44f07021aab', '临高县', 'lingaoxian', 'lgx', '469000', '469024', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('871827fc7bcb4008a5af0dc17b18cfe6', '定结县', 'dingjiexian', 'djx', '542300', '542332', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('871ac026884545d382ffdab544d91813', '河口瑶族自治县', 'hekouyaozuzizhixian', 'hkyzzzx', '532500', '532532', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('871fba52bdc5459db6bde7f3add16b7a', '仓山区', 'cangshanqu', 'csq', '350100', '350104', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8749df286ed04db8ae87ae72b308b113', '惠水县', 'huishuixian', 'hsx', '522700', '522731', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('87500115331849dcafeecb9e4f49ecea', '镇原县', 'zhenyuanxian', 'zyx', '621000', '621027', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8758503d9fa545a9974f85a202f0c0c1', '市辖区', 'shixiaqu', 'sxq', '340800', '340801', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('875ac3a3cc79406c812fe67e8da2eecf', '市辖区', 'shixiaqu', 'sxq', '330300', '330301', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8766dfb832d04562a32613ba82b7f24d', '芦淞区', 'lusongqu', 'lsq', '430200', '430203', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('876904ca6d9a49d58e80b60fc7d54dbd', '利通区', 'litongqu', 'ltq', '640300', '640302', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('87978914a95546a78a6d6a25b80a541d', '市辖区', 'shixiaqu', 'sxq', '510500', '510501', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('87b29869d2dc4e8c8faaf9b5923b9c5e', '五寨县', 'wuzhaixian', 'wzx', '140900', '140928', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('87df6b968f4c49eabfcb29b4ef2e2ca2', '新绛县', 'xinjiangxian', 'xjx', '140800', '140825', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('87e449412d7e45aba1597bc6ed7e4898', '环县', 'huanxian', 'hx', '621000', '621022', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('881869f2e1a34f828f079ff23a5825f8', '剑河县', 'jianhexian', 'jhx', '522600', '522629', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('882900c30daf47f39a7e6cdd894147a5', '三原县', 'sanyuanxian', 'syx', '610400', '610422', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('882b425fd1ff46c1ac482d3eac257eb2', '加查县', 'jiachaxian', 'jcx', '542200', '542229', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('883fe5bde7314676b12643aec72a72c5', '泰和县', 'taihexian', 'thx', '360800', '360826', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8849dfc0a1b64d8b90e218b38435f88c', '迎泽区', 'yingzequ', 'yzq', '140100', '140106', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('885a72cf6e2c42e9838a3ca210a37214', '林周县', 'linzhouxian', 'lzx', '540100', '540121', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('886b2a86efdb4e0fb12adfda68dea6d4', '大理市', 'dalishi', 'dls', '532900', '532901', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('888b49eb28c843aabcf9074ab0f57b34', '长葛市', 'changgeshi', 'cgs', '411000', '411082', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8893af7103a5419da5dfeadada935866', '通州区', 'tongzhouqu', 'tzq', '320600', '320612', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('889a6be146e54c5f88aa5df19aeb008b', '辽宁省', 'liaoningsheng', 'lns', '1', '210000', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('88b2e1b223c94da1b60dc452b4db7539', '太原市', 'taiyuanshi', 'tys', '140000', '140100', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('88d5fe4daff640ac8ce3a21a99f29ec0', '宁明县', 'ningmingxian', 'nmx', '451400', '451422', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('88eef70f6320420ab73074786891a669', '通山县', 'tongshanxian', 'tsx', '421200', '421224', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('88ef8a2bcda64ce09271c352adbc1058', '南部县', 'nanbuxian', 'nbx', '511300', '511321', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('88fb442b8e12405db8bd0da352a9a122', '南岸区', 'nananqu', 'naq', '500100', '500108', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('890f3b590ec14c25a7e5cd55761b2cd9', '石龙区', 'shilongqu', 'slq', '410400', '410404', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89450ae332114581863b1e1758087b99', '叠彩区', 'diecaiqu', 'dcq', '450300', '450303', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('894fc5ad672a4e25a8e5762d2ff42a83', '昆都仑区', 'kundoulunqu', 'kdlq', '150200', '150203', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89556d96961a4830966ccb5b5093dc77', '鹤山区', 'heshanqu', 'hsq', '410600', '410602', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89723405f5354956b3d7123f804526e0', '丰城市', 'fengchengshi', 'fcs', '360900', '360981', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('898d593187ae489390418995800ab149', '监利县', 'jianlixian', 'jlx', '421000', '421023', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89afee76224847c291a824607f80cecf', '易县', 'yixian', 'yx', '130600', '130633', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89b7f5bc381f4016ad7d9870efd67e7e', '桥西区', 'qiaoxiqu', 'qxq', '130700', '130703', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89bc3822340b404795216f971d672712', '东至县', 'dongzhixian', 'dzx', '341700', '341721', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89ca79ac75b2459081ae98065ebfa043', '平定县', 'pingdingxian', 'pdx', '140300', '140321', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89cd22462b9e40a09982e41ca52edb62', '八宿县', 'basuxian', 'bsx', '542100', '542127', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89d50c5e68b34c929b21c73b445bb3f2', '伊通满族自治县', 'yitongmanzuzizhixian', 'ytmzzzx', '220300', '220323', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('89eb5364acff48a388d22c458bce3115', '市辖区', 'shixiaqu', 'sxq', '640200', '640201', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a39b6c5a5f24cb5b9c65dc5ec0a7d64', '沂源县', 'yiyuanxian', 'yyx', '370300', '370323', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a468a1830124b55a8ae92d4aa11fe28', '中山市', 'zhongshanshi', 'zss', '440000', '442000', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a74f7d0592c4d39aafe98096884d2ac', '市辖区', 'shixiaqu', 'sxq', '310000', '310100', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a85054a39e1494ca1f325149803a2da', '淄博市', 'ziboshi', 'zbs', '370000', '370300', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a852056d571430fa436ad3775e4aa77', '泰顺县', 'taishunxian', 'tsx', '330300', '330329', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a887c3a48ff41dda1aab39bbd05941c', '屏南县', 'pingnanxian', 'pnx', '350900', '350923', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a8a6cdf61a2418ab88fbfdbede02ee2', '郓城县', 'yunchengxian', 'ycx', '371700', '371725', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8a9a511d84ef48d8b62dc35135924e6c', '启东市', 'qidongshi', 'qds', '320600', '320681', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ad526e4c4cc4d5b9725873c2d671222', '吉木萨尔县', 'jimusaerxian', 'jmsex', '652300', '652327', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ae9f079d24241e691106a1ccd7cbe98', '市辖区', 'shixiaqu', 'sxq', '650200', '650201', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8af6ae76f991416d8c8d5f5a0c35012b', '邻水县', 'linshuixian', 'lsx', '511600', '511623', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8b12810cc719417a89f3d89a62ad1342', '安达市', 'andashi', 'ads', '231200', '231281', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8b3425e81a1548bdba3ec7a99ed5276c', '大宁县', 'daningxian', 'dnx', '141000', '141030', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8b4f8d1bb0634a07938d5bf3ead61a35', '靖安县', 'jinganxian', 'jax', '360900', '360925', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8b6158c0e03e45539265d864fbe35ba8', '麻阳苗族自治县', 'mayangmiaozuzizhixian', 'mymzzzx', '431200', '431226', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8b63ec6b0b73452d8cceb1e5b1b17497', '西林县', 'xilinxian', 'xlx', '451000', '451030', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8b9109d5a84c4f6d87af9e03c402e66b', '海南藏族自治州', 'hainancangzuzizhizhou', 'hnczzzz', '630000', '632500', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8b9833c0a1c3490fb93c9bc3a723c0af', '溆浦县', 'xupuxian', 'xpx', '431200', '431224', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8bba187a7eca436e9eeb87b192d9901f', '大田县', 'datianxian', 'dtx', '350400', '350425', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8bdcd8b0829f43c1b1540f9265d7413a', '共和县', 'gonghexian', 'ghx', '632500', '632521', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8bdde0ff5071488a85e027165b1f5f06', '金湾区', 'jinwanqu', 'jwq', '440400', '440404', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8bfad831590443e7ba28ee9f6a6cde9f', '龙亭区', 'longtingqu', 'ltq', '410200', '410202', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c0004d8a5254d9daf091e4f72252940', '习水县', 'xishuixian', 'xsx', '520300', '520330', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c0660d31e034a7ba65665e5681b9da9', '古交市', 'gujiaoshi', 'gjs', '140100', '140181', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c07b274244244f9bb0f6fda667fadea', '茂南区', 'maonanqu', 'mnq', '440900', '440902', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c1852121fb44acc943facaf34cfe708', '额尔古纳市', 'eergunashi', 'eegns', '150700', '150784', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c3574e37e484b8e80fcb6eb269bde3b', '安仁县', 'anrenxian', 'arx', '431000', '431028', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c40c4fcbb0542eb8bf712aff227f6b8', '新浦区', 'xinpuqu', 'xpq', '320700', '320705', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c5273a3c4814316a3c356e867853375', '三都水族自治县', 'sandoushuizuzizhixian', 'sdszzzx', '522700', '522732', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c76a59d2f2241c9bddc2802018ccfff', '市辖区', 'shixiaqu', 'sxq', '360900', '360901', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c81c2cb8a1d4bbb86f1e4ffc7a5874e', '六合区', 'liuhequ', 'lhq', '320100', '320116', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c90575ff32f4957a58054192b02cb98', '郯城县', 'tanchengxian', 'tcx', '371300', '371322', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8c99d4af3f4d494abcf1f00823ff8c37', '郧西县', 'yunxixian', 'yxx', '420300', '420322', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8cada94541b34ce084316c076e7c23c0', '南海区', 'nanhaiqu', 'nhq', '440600', '440605', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8cc3273f06df4c2d9ded171b218a0aba', '沙坡头区', 'shapotouqu', 'sptq', '640500', '640502', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8cc6b3d750c74fa89f6605c0dd31a5ba', '下城区', 'xiachengqu', 'xcq', '330100', '330103', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ccc8ba26b074ccbbe69da1225bec06b', '大东区', 'dadongqu', 'ddq', '210100', '210104', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8cce6aec37054b058063da3911bb2f93', '杜尔伯特蒙古族自治县', 'duerbotemengguzuzizhixian', 'debtmgzzzx', '230600', '230624', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ce6bbe988b14c9bafc49f03186de6f6', '霍林郭勒市', 'huolinguoleshi', 'hlgls', '150500', '150581', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8cee7968a3e64ed5be57b8fa94a3dbac', '黄陂区', 'huangbeiqu', 'hbq', '420100', '420116', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8cf48c3d04d04d9c9f63946bbef94180', '居巢区', 'juchaoqu', 'jcq', '341400', '341402', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d07591310b74bcf8f798dce737462bc', '德清县', 'deqingxian', 'dqx', '330500', '330521', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d0a1e4494214ca4822d68681c5bb01a', '富宁县', 'funingxian', 'fnx', '532600', '532628', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d1c011f67ba4d07b6aa886b1baac02d', '东兰县', 'donglanxian', 'dlx', '451200', '451224', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d31ea5977f54258a00766f32d3cfd6f', '晴隆县', 'qinglongxian', 'qlx', '522300', '522324', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d36ad0c9e384b8fa48dd9522e3bda9e', '于田县', 'yutianxian', 'ytx', '653200', '653226', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d44deea9ecd47d08f5cb56cf432aa02', '青阳县', 'qingyangxian', 'qyx', '341700', '341723', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d4cbb15270043d196e7e8dd4d1a5f89', '正安县', 'zhenganxian', 'zax', '520300', '520324', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d5b1886396942cdab9274355e35d43c', '市辖区', 'shixiaqu', 'sxq', '511500', '511501', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d6151d75bdf4a3683de835bdc2d5b89', '昌江黎族自治县', 'changjianglizuzizhixian', 'cjlzzzx', '469000', '469026', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8d6664fb495b4cdd8eb655087a280c44', '细河区', 'xihequ', 'xhq', '210900', '210911', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8dafc9373684498bb8d8e2216d7fceb3', '班戈县', 'bangexian', 'bgx', '542400', '542428', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8dcf1b8149274c35a4d8f316573d3eef', '迁西县', 'qianxixian', 'qxx', '130200', '130227', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8dd0d01d15f7495eb7dda1acfb27685f', '唐县', 'tangxian', 'tx', '130600', '130627', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e0fe9ec60b24ceab2f5701171da6b26', '唐山市', 'tangshanshi', 'tss', '130000', '130200', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e101d5f14b241968d63af2166a07673', '涟水县', 'lianshuixian', 'lsx', '320800', '320826', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e1cee711e614c44ba6534ba0b45f696', '海曙区', 'haishuqu', 'hsq', '330200', '330203', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e2173d91e05413d97a826a087b45983', '常山县', 'changshanxian', 'csx', '330800', '330822', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e2abd4bec9a419cb7c4011ffa80f5a9', '黄州区', 'huangzhouqu', 'hzq', '421100', '421102', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e513bf96c2a4160aa2ed5628b162d51', '郧县', 'yunxian', 'yx', '420300', '420321', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e52ddc9f2b7416bb09ca04efa85c940', '县', 'xian', 'x', '120000', '120200', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e7ea6c1d08d4b28a904fb48b9618665', '呼兰区', 'hulanqu', 'hlq', '230100', '230111', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e8b9a7a9a8f4d70a600be698c254ea9', '洛江区', 'luojiangqu', 'ljq', '350500', '350504', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8e98780b9a534b49a3bd2aaf3ad86c0d', '铜鼓县', 'tongguxian', 'tgx', '360900', '360926', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ed4216da71e497e92cb30209c3c4fbd', '娄烦县', 'loufanxian', 'lfx', '140100', '140123', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ed87fd4c5374f4997569500ca064140', '巴塘县', 'batangxian', 'btx', '513300', '513335', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ee2446e59fb4efca3f37829393a9048', '南华县', 'nanhuaxian', 'nhx', '532300', '532324', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ee404ce1ed3443b85ba55528695b653', '沙坪坝区', 'shapingbaqu', 'spbq', '500100', '500106', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ef4a64865034cbda6b65709cf8bb062', '饶阳县', 'raoyangxian', 'ryx', '131100', '131124', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8effca76a27646ac8f93daf849792b11', '小金县', 'xiaojinxian', 'xjx', '513200', '513227', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8f0ff700afbb40a7ab6ed572887296b9', '札达县', 'zhadaxian', 'zdx', '542500', '542522', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8f471bb1e4ae4712ab9ffd61cca7cd1e', '屏山县', 'pingshanxian', 'psx', '511500', '511529', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8f5446d0ca354fe797636a7c1af08442', '屯昌县', 'tunchangxian', 'tcx', '469000', '469022', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8f8135eff14b4e32bee54c0eb2ac69c9', '灵山县', 'lingshanxian', 'lsx', '450700', '450721', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8f8a0f0976d64e788ee025a8ff3ce878', '翼城县', 'yichengxian', 'ycx', '141000', '141022', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8f8d1ef26be74581a330a2a67eeb6ab8', '田阳县', 'tianyangxian', 'tyx', '451000', '451021', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8faf28e4384244c5bbc4bbf0335b5a73', '乐亭县', 'letingxian', 'ltx', '130200', '130225', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8fc5e89ed52d40babf463d6de820c3dd', '东坡区', 'dongpoqu', 'dpq', '511400', '511402', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8fe534eabcbf46bfb5006c17281ba470', '平桂管理区', 'pingguiguanliqu', 'pgglq', '451100', '451119', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('8ff54c73a9d8420caa0eb6a3c7503dac', '湄潭县', 'meitanxian', 'mtx', '520300', '520328', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('907b0a4355874355be055e6c4a4eeb4f', '三江侗族自治县', 'sanjiangdongzuzizhixian', 'sjdzzzx', '450200', '450226', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('908ba9cfe45f435d991dfc952e1a873b', '砀山县', 'dangshanxian', 'dsx', '341300', '341321', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9090c3f89ec24720870088fe5fb005fb', '新兴区', 'xinxingqu', 'xxq', '230900', '230902', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('90aacc15791941c2b09a1bd0f524ae6a', '呈贡县', 'chenggongxian', 'cgx', '530100', '530121', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('90bd0281d6084df281f96003a58b638b', '两当县', 'liangdangxian', 'ldx', '621200', '621228', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('90df7f7bca044c76bdac27b331f6403e', '浉河区', 'shihequ', 'shq', '411500', '411502', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('90faaf58695740d0aaa94382c4682fef', '济阳县', 'jiyangxian', 'jyx', '370100', '370125', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('910ce4dd98eb495db4802e6fa58e641f', '南沙群岛', 'nanshaqundao', 'nsqd', '469000', '469032', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('912a0a6b2bbe4d1b8c4c20aa45c4d909', '昭平县', 'zhaopingxian', 'zpx', '451100', '451121', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91357728bf3842d297c857b61132742c', '裕华区', 'yuhuaqu', 'yhq', '130100', '130108', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('913cc8ef660e491daf487d96ee1ad3fc', '乐都县', 'ledouxian', 'ldx', '632100', '632123', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9142e51cf9814ed89c9b91f718c03ba3', '咸安区', 'xiananqu', 'xaq', '421200', '421202', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9167d9cb4c4f4f3e9a266585b8ab0f88', '台山市', 'taishanshi', 'tss', '440700', '440781', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('917f966fcffd4be2b781839d5633a804', '兰坪白族普米族自治县', 'lanpingbaizupumizuzizhixian', 'lpbzpmzzzx', '533300', '533325', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91836597e1744b498f4e1c0df9b1462e', '宜宾县', 'yibinxian', 'ybx', '511500', '511521', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91855f16023f4433b125fb8a818f3827', '市辖区', 'shixiaqu', 'sxq', '450900', '450901', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91b02089f9b64fc69c74870fec49fe48', '润州区', 'runzhouqu', 'rzq', '321100', '321111', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91c241bdbe824336912964a0c1b718f5', '阳西县', 'yangxixian', 'yxx', '441700', '441721', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91d2d9760d6c43eba09b388e3c0d003d', '额敏县', 'eminxian', 'emx', '654200', '654221', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91e96710e4de417399809b8bd0122739', '盐田区', 'yantianqu', 'ytq', '440300', '440308', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('91edd3dd87c2419f91691a239d277338', '茂名市', 'maomingshi', 'mms', '440000', '440900', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('92006fd0b7b84790b2c8182596c427a1', '仙游县', 'xianyouxian', 'xyx', '350300', '350322', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9214af4c3d244599810a934f48d0fce5', '市辖区', 'shixiaqu', 'sxq', '131000', '131001', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9236629aa5724418bc707d17dca0057d', '临夏县', 'linxiaxian', 'lxx', '622900', '622921', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('927594ce2a9c49f0bd09e7bea5d31aca', '环翠区', 'huancuiqu', 'hcq', '371000', '371002', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9277431285a64b669f9e2f76f297b16a', '市辖区', 'shixiaqu', 'sxq', '230500', '230501', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9280026cd62c44a1a64989965ecdffef', '洋县', 'yangxian', 'yx', '610700', '610723', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('928de4312ceb4593a9e61655e26b6143', '道外区', 'daowaiqu', 'dwq', '230100', '230104', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('92a1890155c34c029f3650fb65ef4713', '市辖区', 'shixiaqu', 'sxq', '361100', '361101', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('92c2cf2961114a128e57ca4ec304dfc3', '市辖区', 'shixiaqu', 'sxq', '430800', '430801', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9301118941ff4c98a27b21df7ed3b5b3', '宝清县', 'baoqingxian', 'bqx', '230500', '230523', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('93132b1a70e34deeb1d3446c24bc7e69', '巴彦县', 'bayanxian', 'byx', '230100', '230126', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9313a6cc6bfe4121805bc0ec0c1787f9', '钟山县', 'zhongshanxian', 'zsx', '451100', '451122', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9324a3871fd14858bc001c4eaf901262', '宜昌市', 'yichangshi', 'ycs', '420000', '420500', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('93368dea5bd54a46924d476026cc4f8a', '江干区', 'jiangganqu', 'jgq', '330100', '330104', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('933b5dd7a72d47bba5faa9a4e19df359', '高淳县', 'gaochunxian', 'gcx', '320100', '320125', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('935f0c2a878e445c9629d4d1b7ad54fe', '安图县', 'antuxian', 'atx', '222400', '222426', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9364991b99bb4e97b273386398f075e1', '宜丰县', 'yifengxian', 'yfx', '360900', '360924', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('937859e5f35d4b6b9c0a376f4bf7ca46', '端州区', 'duanzhouqu', 'dzq', '441200', '441202', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9386a0af1fd84dd981b668fb106f618a', '东安区', 'donganqu', 'daq', '231000', '231002', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('938be511ea1e425db5052c747fa8f908', '姜堰市', 'jiangyanshi', 'jys', '321200', '321284', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9399919282e64da281afc62ceea037e2', '凉城县', 'liangchengxian', 'lcx', '150900', '150925', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('93ef3c80ed7349e78eb7dc2be73cb0ca', '望江县', 'wangjiangxian', 'wjx', '340800', '340827', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('93fb6a2bae4a46c4a31f7c37f675d1f9', '上林县', 'shanglinxian', 'slx', '450100', '450125', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94174231ec27416592614ea8dc028827', '博尔塔拉蒙古自治州', 'boertalamengguzizhizhou', 'betlmgzzz', '650000', '652700', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9432d707ab9b45588c64d3a3f0cff265', '五通桥区', 'wutongqiaoqu', 'wtqq', '511100', '511112', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94383a05412a4d59a0d4b08a5e32edcc', '维扬区', 'weiyangqu', 'wyq', '321000', '321011', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9445feebbe2e4d49ab212fdd7fec9e39', '清原满族自治县', 'qingyuanmanzuzizhixian', 'qymzzzx', '210400', '210423', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9452c17cff524957881c4485dbd4318a', '禅城区', 'chanchengqu', 'ccq', '440600', '440604', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('945450714ac0491793f244d9050fc189', '抚松县', 'fusongxian', 'fsx', '220600', '220621', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('945e23c31d9140ea9ad5262a6adee03f', '岐山县', 'qishanxian', 'qsx', '610300', '610323', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9461e756db3c4e0e87716fd7c01523a0', '西丰县', 'xifengxian', 'xfx', '211200', '211223', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9467455c0ebb4aaebfc2a14d02648e9f', '南湖区', 'nanhuqu', 'nhq', '330400', '330402', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94710829b4c34fd89c81823dfe3df348', '且末县', 'qiemoxian', 'qmx', '652800', '652825', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('947377b7ca5d4305925cc30829c27044', '九江县', 'jiujiangxian', 'jjx', '360400', '360421', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('947d5f3c9b6843a9ac074f42bc2887b8', '庆安县', 'qinganxian', 'qax', '231200', '231224', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94854264938c4760a258b76a695b1f65', '闽侯县', 'minhouxian', 'mhx', '350100', '350121', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('949028452753401ab674dc2d26e1532a', '方城县', 'fangchengxian', 'fcx', '411300', '411322', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('949adfa2241040e6bd62c9dcecd3d979', '黔东南苗族侗族自治州', 'qiandongnanmiaozudongzuzizhizhou', 'qdnmzdzzzz', '520000', '522600', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94a3ba5d126a40009300c0c56ec0e69a', '合肥市', 'hefeishi', 'hfs', '340000', '340100', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94b0c9e06288406eb8cda4dd50c4008f', '港南区', 'gangnanqu', 'gnq', '450800', '450803', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94d39ebad2d742189a4bf0a0b817ea68', '璧山县', 'bishanxian', 'bsx', '500200', '500227', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('94d8ab3b279a4f7e8efc319893c0dfeb', '长顺县', 'changshunxian', 'csx', '522700', '522729', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9500a767d4f8438cbee4830cc0b546ca', '滦县', 'luanxian', 'lx', '130200', '130223', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95014907b95045a08e344b7ff8bbe0a5', '平武县', 'pingwuxian', 'pwx', '510700', '510727', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('950ace08830f4c6fa6d3b90205ea4759', '韩城市', 'hanchengshi', 'hcs', '610500', '610581', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95156c36461c4f1bb2dc26359bb92da6', '扶绥县', 'fusuixian', 'fsx', '451400', '451421', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9525d88e801f4641aa57059c413aa789', '哈尔滨市', 'haerbinshi', 'hebs', '230000', '230100', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95323f2838254608b0bcd443ad41b0e4', '洞口县', 'dongkouxian', 'dkx', '430500', '430525', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('953664426a0844ad97e8a8cbd941f605', '广河县', 'guanghexian', 'ghx', '622900', '622924', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95480d4012a3489794d530c628276fec', '汉台区', 'hantaiqu', 'htq', '610700', '610702', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('957beb3acecc4667a6bc4b2dacd28e00', '莲花县', 'lianhuaxian', 'lhx', '360300', '360321', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95bc1ed9c62b404790058abfac0b7896', '北仑区', 'beilunqu', 'blq', '330200', '330206', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95d418a692d84750aee7f23af55a46a7', '市辖区', 'shixiaqu', 'sxq', '530300', '530301', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95dcc1df56af4f2b9d55d4b9a3ae2c67', '广宁县', 'guangningxian', 'gnx', '441200', '441223', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95e56306323b4956834c2764511287f6', '海原县', 'haiyuanxian', 'hyx', '640500', '640522', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('95fad7c68bdf4e148d811225a2d66113', '栖霞市', 'qixiashi', 'qxs', '370600', '370686', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9609270638324285a343e750560528b7', '信丰县', 'xinfengxian', 'xfx', '360700', '360722', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9629179576904c0a8cdc7a504bfa0f79', '丰台区', 'fengtaiqu', 'ftq', '110100', '110106', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('964c668207e549e4b8c582279d686dc0', '平顺县', 'pingshunxian', 'psx', '140400', '140425', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9653230282a040cab832ee47e748066f', '六盘水市', 'liupanshuishi', 'lpss', '520000', '520200', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('965c8d94edde4571ae8864005dcb6240', '博野县', 'boyexian', 'byx', '130600', '130637', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('966186ea6ee14415be0b7af7a7ebf3ca', '市北区', 'shibeiqu', 'sbq', '370200', '370203', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9680926e12c44d3aa48e83725ec3d1be', '洪湖市', 'honghushi', 'hhs', '421000', '421083', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('96985bedd9184a49878a2acc1c6288d2', '兴仁县', 'xingrenxian', 'xrx', '522300', '522322', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('969948c3b01848f3a25e8dc2ca61c3ed', '洪洞县', 'hongdongxian', 'hdx', '141000', '141024', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('969d5e8ddb184afb9230c428f42542ea', '班玛县', 'banmaxian', 'bmx', '632600', '632622', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('969d6efa66764693b6a39a3a57ea136d', '大连市', 'dalianshi', 'dls', '210000', '210200', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('96c077fdcfb349c29c0f8c11212c49a8', '北关区', 'beiguanqu', 'bgq', '410500', '410503', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('96c24173f2824847921066305451f236', '准格尔旗', 'zhungeerqi', 'zgeq', '150600', '150622', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('96c7874dae7942a0a3db0e8e55d626b4', '运河区', 'yunhequ', 'yhq', '130900', '130903', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('96d5871a562447d29c59834d99a87d80', '苏州市', 'suzhoushi', 'szs', '320000', '320500', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('96dc4e0dc34847f2938a81718537dd2e', '烈山区', 'lieshanqu', 'lsq', '340600', '340604', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('96e297b7ec494e37bdcded2b64753577', '图木舒克市', 'tumushukeshi', 'tmsks', '659000', '659003', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9706cc734c60413da983ad5086971f05', '市辖区', 'shixiaqu', 'sxq', '350300', '350301', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97083686d545499fa69e4db755c78fc4', '清河区', 'qinghequ', 'qhq', '211200', '211204', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('971abff1d7a14d2391f78c85d848d1b9', '石渠县', 'shiquxian', 'sqx', '513300', '513332', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('973cdc5201d5485ba6360609861086ea', '蒙城县', 'mengchengxian', 'mcx', '341600', '341622', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('975619f84b6b4f599ced4ca0f20d4611', '筠连县', 'yunlianxian', 'ylx', '511500', '511527', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97652d05e89443bdb9cdec1eee4ad8c9', '渭南市', 'weinanshi', 'wns', '610000', '610500', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('976b9a88c383408c8c2de74fea9ccfca', '榆社县', 'yushexian', 'ysx', '140700', '140721', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('977e1bb23a8c404583e0d88f148b598f', '彭水苗族土家族自治县', 'pengshuimiaozutujiazuzizhixian', 'psmztjzzzx', '500200', '500243', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('978f59c6231b42ceb5139b47de898e4a', '玉州区', 'yuzhouqu', 'yzq', '450900', '450902', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97b0e12a24964e58a4f848bd0323c1d8', '魏都区', 'weidouqu', 'wdq', '411000', '411002', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97b3f0110a5347708ca420c7b92eace9', '钟祥市', 'zhongxiangshi', 'zxs', '420800', '420881', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97b90c6b68d84c47bdb7c6abdda9851e', '芮城县', 'ruichengxian', 'rcx', '140800', '140830', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97c7e6ad546042528ad2cf7fbba4f566', '拜泉县', 'baiquanxian', 'bqx', '230200', '230231', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97cce736001e4299b1618ab76f937623', '景德镇市', 'jingdezhenshi', 'jdzs', '360000', '360200', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97dae1e702bd443ca727d1dc364be48a', '萝岗区', 'luogangqu', 'lgq', '440100', '440116', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('97fc1fec4dbb436d86097798b37b788c', '奉新县', 'fengxinxian', 'fxx', '360900', '360921', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('981c25ee78484d5cbc3ee80223d35c09', '五河县', 'wuhexian', 'whx', '340300', '340322', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('98475e3be9e242729bf060edfc790268', '集美区', 'jimeiqu', 'jmq', '350200', '350211', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9847a2933d6c49f59dd08bb6199e3b52', '徐州市', 'xuzhoushi', 'xzs', '320000', '320300', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9867dfb5ffc4464ba44819bd501521d3', '进贤县', 'jinxianxian', 'jxx', '360100', '360124', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('986c642c17684f27a1c98dc35f60204c', '埇桥区', 'yongqiaoqu', 'yqq', '341300', '341302', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('987f29b490214a40b61ab79f3d8d1814', '增城市', 'zengchengshi', 'zcs', '440100', '440183', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9880480b07014b43a8cd8a58ccaef50b', '松滋市', 'songzishi', 'szs', '421000', '421087', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('990ebc14b8044e3cb84bde6d1a08f396', '大余县', 'dayuxian', 'dyx', '360700', '360723', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9913c765ec014b89acd8b59a62fee374', '壶关县', 'huguanxian', 'hgx', '140400', '140427', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99207464c1f945f9b5b4606ff9b3db93', '龙门县', 'longmenxian', 'lmx', '441300', '441324', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99286971c68f4191bc7b92d585cf8831', '月湖区', 'yuehuqu', 'yhq', '360600', '360602', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('992e1a111dd14a37b5a8bd5993049d44', '黄龙县', 'huanglongxian', 'hlx', '610600', '610631', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('993ad5238da44f159116d84975cecce3', '庐阳区', 'luyangqu', 'lyq', '340100', '340103', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99585d9747ee4d6faa63be91eaee455a', '双阳区', 'shuangyangqu', 'syq', '220100', '220112', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('995e2c6ce93c4fdf9af4d6317ce4f56d', '濮阳县', 'puyangxian', 'pyx', '410900', '410928', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99632d940fa04b2a8bb562ce3afd3828', '高陵县', 'gaolingxian', 'glx', '610100', '610126', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9974d3f621c040cbb78bbcb0629b848e', '迭部县', 'diebuxian', 'dbx', '623000', '623024', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9977d3ec840142059beed2c4eb0eac55', '东乌珠穆沁旗', 'dongwuzhumuqinqi', 'dwzmqq', '152500', '152525', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('998f6bf869724403aac496434f6f689e', '榆阳区', 'yuyangqu', 'yyq', '610800', '610802', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('999ea83a41934370a80b5759d8a2ccbe', '商南县', 'shangnanxian', 'snx', '611000', '611023', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99a75b6de59f4926bd50b1d94afe73ac', '章贡区', 'zhanggongqu', 'zgq', '360700', '360702', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99d069b2b01d4f29be2fd331270d3acc', '市辖区', 'shixiaqu', 'sxq', '620200', '620201', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99e13a9da49547868d1673bef215f201', '沁县', 'qinxian', 'qx', '140400', '140430', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('99e200e0cd3a41d5b8b5a6021b49c5c0', '扬州市', 'yangzhoushi', 'yzs', '320000', '321000', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a0ad0e8f2034c05b980ce8548cf8b25', '友好区', 'youhaoqu', 'yhq', '230700', '230704', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a0e9684acc8435eb2b9b82f4804d93f', '龙山县', 'longshanxian', 'lsx', '433100', '433130', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a1302e232dd4686b268720d8b8a8ef0', '大姚县', 'dayaoxian', 'dyx', '532300', '532326', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a244d3ce5154a8d9f1c8a4829825b1c', '临安市', 'linanshi', 'las', '330100', '330185', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a5e92985c2c4c6faa1770ac97ac7734', '市辖区', 'shixiaqu', 'sxq', '421000', '421001', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a7340ee304d4288a544342bd22a713a', '江孜县', 'jiangzixian', 'jzx', '542300', '542323', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a7b090ecbfc436ebb787864905464bb', '瓜州县', 'guazhouxian', 'gzx', '620900', '620922', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a7ed7edf07e421f89dee340e864c767', '澄城县', 'chengchengxian', 'ccx', '610500', '610525', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a8608456a1c4c95a15459dcaa4e0d6b', '金寨县', 'jinzhaixian', 'jzx', '341500', '341524', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a8905742ae2489395fd823829bfc907', '成安县', 'chenganxian', 'cax', '130400', '130424', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a8eef0b7cab40e187d9abbc212c75c2', '海宁市', 'hainingshi', 'hns', '330400', '330481', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9a960766c8894af0af0d189990938dca', '漯河市', 'luoheshi', 'lhs', '410000', '411100', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ab15178001a48ada41d88dedf68b0c3', '松桃苗族自治县', 'songtaomiaozuzizhixian', 'stmzzzx', '522200', '522229', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ad06ba859e74211bfe8c2f64e6d1e89', '中方县', 'zhongfangxian', 'zfx', '431200', '431221', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ad8e36d4f3544beb1b133fc1915f06a', '商都县', 'shangdouxian', 'sdx', '150900', '150923', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ae88276b57b43eda805865449afe865', '柳河县', 'liuhexian', 'lhx', '220500', '220524', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9b0c75137b6b4200b8181f943886aa68', '孝昌县', 'xiaochangxian', 'xcx', '420900', '420921', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9b54a31fe23148bd84663a8a874e1b93', '金溪县', 'jinxixian', 'jxx', '361000', '361027', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9b6474841b1646f18cc58267ecc4e41e', '阳春市', 'yangchunshi', 'ycs', '441700', '441781', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9b9721eb6baf4726af99bc99e492bead', '利川市', 'lichuanshi', 'lcs', '422800', '422802', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ba733b9ee6a4369a0128e404a9da930', '汨罗市', 'miluoshi', 'mls', '430600', '430681', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9be98be69e8a42609b9a4b5cee90005c', '磐安县', 'pananxian', 'pax', '330700', '330727', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9c2fd54529144e6f8b1f2b1afb3827b5', '尖扎县', 'jianzaxian', 'jzx', '632300', '632322', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9c65fdc7757d4d8a8e31c80bcca98af6', '雨湖区', 'yuhuqu', 'yhq', '430300', '430302', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9c6822c2ee164176aa252c8d9aca48c2', '公主岭市', 'gongzhulingshi', 'gzls', '220300', '220381', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9c75084c19bd432ba8e09a2506783d11', '察雅县', 'chayaxian', 'cyx', '542100', '542126', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9c9b1e419d56467ea6bdb7316218cac8', '云安县', 'yunanxian', 'yax', '445300', '445323', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9c9c88d8a0c445abbdbb7cba0d870203', '市辖区', 'shixiaqu', 'sxq', '341800', '341801', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9cab8273f0bb467ba2331a26c4659982', '呼伦贝尔市', 'hulunbeiershi', 'hlbes', '150000', '150700', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9cad6df766b14a1d9716787f2e219ebf', '永仁县', 'yongrenxian', 'yrx', '532300', '532327', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9cc8e44b55ba42b881339d6679559b98', '沅江市', 'yuanjiangshi', 'yjs', '430900', '430981', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9cee9843c2f34c468a1a003f55880377', '锡林浩特市', 'xilinhaoteshi', 'xlhts', '152500', '152502', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9cf3bd65d30d4f3c810ad4b8c8d424fc', '偏关县', 'pianguanxian', 'pgx', '140900', '140932', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9cf8b658e020416d9ad293cf28d1933d', '天津市', 'tianjinshi', 'tjs', '1', '120000', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9cff1f6b537a436aba9dbc415b51df2a', '铜仁地区', 'tongrendiqu', 'trdq', '520000', '522200', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d01b3d0145a41cab1556c2553505078', '元江哈尼族彝族傣族自治县', 'yuanjianghanizuyizudaizuzizhixian', 'yjhnzyzdzzzx', '530400', '530428', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d1804f9085d4fa18cb00c6036467379', '文昌市', 'wenchangshi', 'wcs', '469000', '469005', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d1bc741df7a48c89dd5f2d74cd462bf', '诏安县', 'zhaoanxian', 'zax', '350600', '350624', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d2fb138ce41421e94711bbe6c27cbf7', '吉首市', 'jishoushi', 'jss', '433100', '433101', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d39ce0d3ca24ed38b9f9295a7c16d1e', '阳信县', 'yangxinxian', 'yxx', '371600', '371622', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d3b1dfc38de418eb31a82f235e21e91', '浦北县', 'pubeixian', 'pbx', '450700', '450722', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d4eedef496b421ca11d1c89fd4f8506', '银州区', 'yinzhouqu', 'yzq', '211200', '211202', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d6e86f45b8d45838ef0cd3b036e03f3', '武江区', 'wujiangqu', 'wjq', '440200', '440203', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d6fac09bc2940518c44e9a83a3f357a', '阿克塞哈萨克族自治县', 'akesaihasakezuzizhixian', 'akshskzzzx', '620900', '620924', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d7b9e17c8cf4aa4874dc23ee167375d', '柏乡县', 'baixiangxian', 'bxx', '130500', '130524', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d88a4e152ae438fb00f6d8165b092a7', '萧县', 'xiaoxian', 'xx', '341300', '341322', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d93c4be91bf434ca35a55f10f1bdb7a', '城关区', 'chengguanqu', 'cgq', '540100', '540102', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9d9ac2b2e9fe4b0a8511aeba8f86f4a3', '梨树区', 'lishuqu', 'lsq', '230300', '230305', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9dae14a13ddc406e83e78b13894c89be', '江东区', 'jiangdongqu', 'jdq', '330200', '330204', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9db4f4f9bbe9486e9329970c24a09d4a', '嘉定区', 'jiadingqu', 'jdq', '310100', '310114', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9dc72249b6414918868d90f1139b8cf2', '达尔罕茂明安联合旗', 'daerhanmaominganlianheqi', 'dehmmalhq', '150200', '150223', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9dd44a88f19e47959778eeca49f6cf1f', '广灵县', 'guanglingxian', 'glx', '140200', '140223', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9dd5fe2f325f4eac998e91666a2567c6', '东乡族自治县', 'dongxiangzuzizhixian', 'dxzzzx', '622900', '622926', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9dd9520c9bb14b4c98c77893e112dedb', '蜀山区', 'shushanqu', 'ssq', '340100', '340104', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ddb64c8bbd747a3afcb4430c25cd871', '赫章县', 'hezhangxian', 'hzx', '522400', '522428', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9e116fcf1a244b538bb0b8fe93ec6ab1', '桦川县', 'huachuanxian', 'hcx', '230800', '230826', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9e249472d5134dda9e363d1e52d60802', '松原市', 'songyuanshi', 'sys', '220000', '220700', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9e6ef315fc5548c884cc51d368757706', '市辖区', 'shixiaqu', 'sxq', '411400', '411401', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9e79f2efa533459faeb1da198ddaf84a', '文成县', 'wenchengxian', 'wcx', '330300', '330328', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9e925abd310a4f0a8505de6709efd1c5', '宁远县', 'ningyuanxian', 'nyx', '431100', '431126', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9e932380cc1540fa94d10c9b68dd94d0', '市辖区', 'shixiaqu', 'sxq', '500000', '500100', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9eb40e6d43684ce1b8d3adf8d495a3c9', '色达县', 'sedaxian', 'sdx', '513300', '513333', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ebe9b4bc36542ff99f150d0a92928e3', '阳江市', 'yangjiangshi', 'yjs', '440000', '441700', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9ed04528aa7f459a884abe59fdd0bc0f', '乌兰察布市', 'wulanchabushi', 'wlcbs', '150000', '150900', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9f5bcf02d4bc48098c55db068e27b76e', '卢氏县', 'lushixian', 'lsx', '411200', '411224', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9f5dd16b34c5473cac98fabf858bb8c5', '广昌县', 'guangchangxian', 'gcx', '361000', '361030', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9f73686e0b984db0bae5ccb49db29ccc', '罗湖区', 'luohuqu', 'lhq', '440300', '440303', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9f773772a7564780aa4c1578c0fd0767', '南关区', 'nanguanqu', 'ngq', '220100', '220102', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9f8298e006694e048319f60189f181bd', '边坝县', 'bianbaxian', 'bbx', '542100', '542133', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9f83ffb79e034006ba9ee2b1693817c3', '应城市', 'yingchengshi', 'ycs', '420900', '420981', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9f966e33c0044f20acbf506de8c1be5c', '香洲区', 'xiangzhouqu', 'xzq', '440400', '440402', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fa3612ef0e346f8a478038126b14b03', '云龙县', 'yunlongxian', 'ylx', '532900', '532929', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fb374a4fc324ce3a7ba507c8cbebd2b', '和政县', 'hezhengxian', 'hzx', '622900', '622925', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fbe108290da4766a66aa0c7e427e76a', '番禺区', 'fanyuqu', 'fyq', '440100', '440113', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fc90e3988654647aa2e88b0cb7a325e', '中宁县', 'zhongningxian', 'znx', '640500', '640521', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fd9d06738b14aeeb835da9ed4610721', '定安县', 'dinganxian', 'dax', '469000', '469021', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fdb4f9e5787494b9fa70dde11b5c10f', '铜梁县', 'tongliangxian', 'tlx', '500200', '500224', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fe01a8fcead4a83aed52e49b4a0c3e1', '市辖区', 'shixiaqu', 'sxq', '220700', '220701', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fe06045c3004b3cad609794440ff69d', '兰山区', 'lanshanqu', 'lsq', '371300', '371302', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('9fef7a88bb56490d969cdb8068a769f9', '来凤县', 'laifengxian', 'lfx', '422800', '422827', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a02ea17b9ebe460a8e52c477caba81c5', '梁平县', 'liangpingxian', 'lpx', '500200', '500228', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a02fc6b67344461385889165004ca7f2', '廉江市', 'lianjiangshi', 'ljs', '440800', '440881', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a04b79e48be24916a1b2825ecdffa45f', '市辖区', 'shixiaqu', 'sxq', '410900', '410901', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a059da47d1dd4ed0ad842c60cc816622', '东河区', 'donghequ', 'dhq', '150200', '150202', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a061cbcb26a44053bc7d324824d80097', '正镶白旗', 'zhengxiangbaiqi', 'zxbq', '152500', '152529', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a07c46017ada4e33bb87263866660819', '龙胜各族自治县', 'longshenggezuzizhixian', 'lsgzzzx', '450300', '450328', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0bfa49370e64ba4ba6507cbed39a4e5', '张北县', 'zhangbeixian', 'zbx', '130700', '130722', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0d012c12c424dcd99e33f36bf975a45', '克孜勒苏柯尔克孜自治州', 'kezilesukeerkezizizhizhou', 'kzlskekzzzz', '650000', '653000', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0d5746d17a24363900b019e677aef2f', '赵县', 'zhaoxian', 'zx', '130100', '130133', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0d907ab75fa44d989acba1d6f40cc59', '涉县', 'shexian', 'sx', '130400', '130426', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0dd28c71ce645c69dae65858dcc3ef3', '水富县', 'shuifuxian', 'sfx', '530600', '530630', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0ee27f7e07041cc97c1e46513dce27c', '京口区', 'jingkouqu', 'jkq', '321100', '321102', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0f049bd80344e52964cd9169377b70a', '乐清市', 'leqingshi', 'lqs', '330300', '330382', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a0f3c611acae416881e80dbf7b9e6818', '衢州市', 'quzhoushi', 'qzs', '330000', '330800', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a121684df232457ea3b467a342eafaf5', '桃城区', 'taochengqu', 'tcq', '131100', '131102', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a1498d1997ee43bf9c7d01870a31b389', '市辖区', 'shixiaqu', 'sxq', '450600', '450601', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a18fae3d8b2c4cc78427e2cf9a6b8590', '天等县', 'tiandengxian', 'tdx', '451400', '451425', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a19ddcacaa614b16884474a9bdbb8be7', '五大连池市', 'wudalianchishi', 'wdlcs', '231100', '231182', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a19fe2493e2d4c2c883793ab4d7ab35e', '漾濞彝族自治县', 'yangbiyizuzizhixian', 'ybyzzzx', '532900', '532922', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a1c796baef3b4805be6312c051ee2fb1', '枣强县', 'zaoqiangxian', 'zqx', '131100', '131121', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a1c8221ba255402abc5f47f7e587f6b9', '龙港区', 'longgangqu', 'lgq', '211400', '211403', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a1e9219b4c3c408e867f5b5892281353', '庐江县', 'lujiangxian', 'ljx', '341400', '341421', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a1ec5b58d9bc48a2a94adbc42b614b7a', '利辛县', 'lixinxian', 'lxx', '341600', '341623', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a1f28605eb754cee849af848f39b2da1', '市辖区', 'shixiaqu', 'sxq', '530600', '530601', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a217f9c64ac84b019d1134dc568b0781', '麦盖提县', 'maigaitixian', 'mgtx', '653100', '653127', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a23ed80507024abeb5f2a3b6c523bf96', '玉林市', 'yulinshi', 'yls', '450000', '450900', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a25386ede0f74a3d8c429b217308b55d', '天全县', 'tianquanxian', 'tqx', '511800', '511825', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a259b148ca354a9faeefde58fd25392c', '丰泽区', 'fengzequ', 'fzq', '350500', '350503', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a25d0ae7561047b1833f1236e4467726', '怀来县', 'huailaixian', 'hlx', '130700', '130730', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2600dc1f59647e5ba7a8e73a85eb7e1', '丹江口市', 'danjiangkoushi', 'djks', '420300', '420381', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2692ed1eec24c119c5edb43c6dbbdc6', '会昌县', 'huichangxian', 'hcx', '360700', '360733', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2b32509fff04883a930df962b2e4a2a', '沂南县', 'yinanxian', 'ynx', '371300', '371321', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2b9df1e87be422ca9455f5aa1a7ebcf', '温岭市', 'wenlingshi', 'wls', '331000', '331081', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2cba7164eea4abe87a755aecbdae684', '思茅区', 'simaoqu', 'smq', '530800', '530802', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2d1b712356d4417af222dc41bb3f11a', '鼓楼区', 'gulouqu', 'glq', '350100', '350102', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2dc98ffac804b76bc0f8a26a2b0bca9', '澜沧拉祜族自治县', 'lancanglahuzuzizhixian', 'lclhzzzx', '530800', '530828', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a2e8a816fd954494b3cadbedc6c95f13', '平远县', 'pingyuanxian', 'pyx', '441400', '441426', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a3078233d10c4cc498a980ce30232c7a', '芷江侗族自治县', 'zhijiangdongzuzizhixian', 'zjdzzzx', '431200', '431228', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a30a06870c83409b975188178cb3d700', '宁海县', 'ninghaixian', 'nhx', '330200', '330226', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a323c09e26d14b71ab223562058d5246', '索县', 'suoxian', 'sx', '542400', '542427', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a332434425484b70916e1729d0d8bf4d', '带岭区', 'dailingqu', 'dlq', '230700', '230713', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a3469f5a45724f108e2aa3769607dfb1', '和布克赛尔蒙古自治县', 'hebukesaiermengguzizhixian', 'hbksemgzzx', '654200', '654226', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a347a0b6b6a3454fb650a1bb44a9e846', '保靖县', 'baojingxian', 'bjx', '433100', '433125', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a350bbfe20ee4fdebee3d2054360c8d8', '伽师县', 'jiashixian', 'jsx', '653100', '653129', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a36103b26ff448cf980a4a2a448825ab', '驻马店市', 'zhumadianshi', 'zmds', '410000', '411700', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a365876eded84662b98e27e40f5633ec', '鲅鱼圈区', 'bayuquanqu', 'byqq', '210800', '210804', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a385a0b5ceed4c6e925308f4969038cb', '市辖区', 'shixiaqu', 'sxq', '231200', '231201', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a3b806156b58454cacfb489cbbbeeb91', '闽清县', 'minqingxian', 'mqx', '350100', '350124', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a3bd94e876674c928fbd715e8828e004', '甘南县', 'gannanxian', 'gnx', '230200', '230225', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a3c72b5ad3284fdaa96bf284bc0372b5', '北辰区', 'beichenqu', 'bcq', '120100', '120113', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a3d1e7c66fe64bdbb39a07ce02d31073', '莲都区', 'liandouqu', 'ldq', '331100', '331102', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a3e029b6f1eb48d0a39bcbdd30c71b4f', '绥德县', 'suidexian', 'sdx', '610800', '610826', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a405acdd14714333bf8917bf3cf8728f', '新疆维吾尔自治区', 'xinjiangweiwuerzizhiqu', 'xjwwezzq', '1', '650000', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a40ed6fc2c804439a0b0602dcb927557', '亳州市', 'bozhoushi', 'bzs', '340000', '341600', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a413fef48adc414895057756f1e6a13e', '乌海市', 'wuhaishi', 'whs', '150000', '150300', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a42e9ccb55f24ee997a7d40cfc927423', '楚雄彝族自治州', 'chuxiongyizuzizhizhou', 'cxyzzzz', '530000', '532300', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a431ee77d8b7428dbee7f5072ffa99f2', '东乡县', 'dongxiangxian', 'dxx', '361000', '361029', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a45905c025da40e58b0cb67ac6a9ed05', '特克斯县', 'tekesixian', 'tksx', '654000', '654027', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a46afd7f497f481b930c51830e651d17', '清水河县', 'qingshuihexian', 'qshx', '150100', '150124', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a46dac6420944b5ba15e527a1b9e0cd0', '紫云苗族布依族自治县', 'ziyunmiaozubuyizuzizhixian', 'zymzbyzzzx', '520400', '520425', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a46ddc8bce4541459577054aea668102', '同安区', 'tonganqu', 'taq', '350200', '350212', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a47ca87dcf704b4aab86713000cd1744', '齐齐哈尔市', 'qiqihaershi', 'qqhes', '230000', '230200', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a496bf0e2d704b999886541a27858967', '汝南县', 'runanxian', 'rnx', '411700', '411727', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a4cbd7688e4d4db0a9c6a9d0e2a0143c', '代县', 'daixian', 'dx', '140900', '140923', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a4d5ebe0590f4103beb638ddbb3adf30', '上甘岭区', 'shangganlingqu', 'sglq', '230700', '230716', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a4ec133b7b6f473b8120345c710a26e2', '安顺市', 'anshunshi', 'ass', '520000', '520400', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a554276ca2214aa4b47c061abd968103', '睢宁县', 'huiningxian', 'hnx', '320300', '320324', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a55ee59498844d02885d1db527b3753c', '辽中县', 'liaozhongxian', 'lzx', '210100', '210122', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a560ae4a7faa4cfaa7b49f99e0ea153d', '巩义市', 'gongyishi', 'gys', '410100', '410181', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a568b2e971d04aa8b1de5665993b9a67', '平罗县', 'pingluoxian', 'plx', '640200', '640221', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a5747dd8d75d47aaa82f24e22cb51504', '市辖区', 'shixiaqu', 'sxq', '450700', '450701', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a5a6d468ddc24111a7f1e3757202bfb6', '金家庄区', 'jinjiazhuangqu', 'jjzq', '340500', '340502', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a5bd914a31b746a989fe8d2eb4d2a505', '礼泉县', 'liquanxian', 'lqx', '610400', '610425', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a5dd863c933c4a36b22f0b9ff588516f', '盐池县', 'yanchixian', 'ycx', '640300', '640323', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6078d047e5e4986aa652a37daec6b85', '青秀区', 'qingxiuqu', 'qxq', '450100', '450103', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a60c4ceb025c43e49c712d2f7fd9027a', '市辖区', 'shixiaqu', 'sxq', '620500', '620501', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a60d2ca3a2f7401fb57fd4feb9b0bb80', '延安市', 'yananshi', 'yas', '610000', '610600', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6150d1a858546fda2e654db41aaa10b', '阿坝藏族羌族自治州', 'abacangzuqiangzuzizhizhou', 'abczqzzzz', '510000', '513200', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a61f8bb7ae5a47358a44e8a64ad13960', '市辖区', 'shixiaqu', 'sxq', '350600', '350601', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a622224ef2d345a79bd4aaf9650a7f33', '普定县', 'pudingxian', 'pdx', '520400', '520422', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a62b433bed8a48beab9978e5a00df428', '山东省', 'shandongsheng', 'sds', '1', '370000', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a630a3c62de24ed29d745345a6ac3d64', '定兴县', 'dingxingxian', 'dxx', '130600', '130626', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a63bfd0530a8426189f83fa341282306', '博乐市', 'boleshi', 'bls', '652700', '652701', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6402547088c4c6d94cf2a9e0d37104d', '若尔盖县', 'ruoergaixian', 'regx', '513200', '513232', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a662311b69b74a4b87710afa0f92147e', '富县', 'fuxian', 'fx', '610600', '610628', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a676311e4d644fbdbf0d1f607e40fd4d', '英德市', 'yingdeshi', 'yds', '441800', '441881', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a68821c0f1e54459b0fcd2f14b3b5786', '桂东县', 'guidongxian', 'gdx', '431000', '431027', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6917fa22e5f48f690baf14808f2da61', '江达县', 'jiangdaxian', 'jdx', '542100', '542122', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a69623bd909f4653bfbc64f99cf9d6d6', '舟曲县', 'zhouquxian', 'zqx', '623000', '623023', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6a0ff52ee5148c2a41a37ffd3256660', '槐荫区', 'huaiyinqu', 'hyq', '370100', '370104', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6a21f18c07e4051b6d89048b77d2ebb', '崇州市', 'chongzhoushi', 'czs', '510100', '510184', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6b741c9cb20418c9be9ba41862a0c53', '织金县', 'zhijinxian', 'zjx', '522400', '522425', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6df1b66b6d5436784d71a8e0760c24c', '荣昌县', 'rongchangxian', 'rcx', '500200', '500226', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6df87af5eaa41ba85afba54e3667610', '景东彝族自治县', 'jingdongyizuzizhixian', 'jdyzzzx', '530800', '530823', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6e5749d80774880b86e865755824868', '惠山区', 'huishanqu', 'hsq', '320200', '320206', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a6f4935a0286432b896e2b5fb6777813', '嘉禾县', 'jiahexian', 'jhx', '431000', '431024', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a706d7ac51f84b20b164b3df5d419660', '四方台区', 'sifangtaiqu', 'sftq', '230500', '230505', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a710b12a5b984f928d666f2b3996a994', '富阳市', 'fuyangshi', 'fys', '330100', '330183', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a72826b1398d465fb18c5471a1f372f4', '眉县', 'meixian', 'mx', '610300', '610326', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a7562ca2d23240ed85f088abd16d30a0', '乌伊岭区', 'wuyilingqu', 'wylq', '230700', '230714', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a75a54c86f0c49e2bb25a899e85a0c95', '袁州区', 'yuanzhouqu', 'yzq', '360900', '360902', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a76b4a325f874fefa205a7b32804b4f7', '汾西县', 'fenxixian', 'fxx', '141000', '141034', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a775fbe509964aea8da6d8e6dcf84265', '丹东市', 'dandongshi', 'dds', '210000', '210600', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a77ab6060b4847098d6ec5348fbbec0d', '唐海县', 'tanghaixian', 'thx', '130200', '130230', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a77c45517b51402498585a5452b32685', '伊春市', 'yichunshi', 'ycs', '230000', '230700', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a78dae581d2d408da927a4c9422df342', '元宝山区', 'yuanbaoshanqu', 'ybsq', '150400', '150403', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a79706d2cfcc4eba9f909f156e82dd83', '安次区', 'anciqu', 'acq', '131000', '131002', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a79a4c09b4d145ecab4991c626d80139', '迎江区', 'yingjiangqu', 'yjq', '340800', '340802', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a7aac3e16c1e4af6900c7962668a5927', '安阳县', 'anyangxian', 'ayx', '410500', '410522', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a7bdbbb92bc14d9682fb9f22012e2435', '市辖区', 'shixiaqu', 'sxq', '530800', '530801', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a7d17cd673b6430b80df26ed2dd1709c', '九原区', 'jiuyuanqu', 'jyq', '150200', '150207', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a7dcf12583144465b9d457e5500915a0', '临夏市', 'linxiashi', 'lxs', '622900', '622901', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a7f46a8fd4754a239ec05b178f5bd9e5', '井冈山市', 'jinggangshanshi', 'jgss', '360800', '360881', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a7f5d13548354b2f93456e3442f6f465', '乡宁县', 'xiangningxian', 'xnx', '141000', '141029', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a8396d4564f940e2ae157f0c615e0416', '政和县', 'zhenghexian', 'zhx', '350700', '350725', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a84988e5c2994a9cb4fa35187e80a8f2', '开鲁县', 'kailuxian', 'klx', '150500', '150523', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a850533b399348b8963b7bb17f061b8e', '新华区', 'xinhuaqu', 'xhq', '410400', '410402', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a85f715c90d3401a99f3958e436c5421', '灵武市', 'lingwushi', 'lws', '640100', '640181', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a866f4ed41b149a4a09aaa30de43c208', '沙湾区', 'shawanqu', 'swq', '511100', '511111', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a87e28a5ee7543ffa56106aefe7cf076', '田家庵区', 'tianjiaanqu', 'tjaq', '340400', '340403', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a88b514689ae499d889a381a79ed5f0c', '明水县', 'mingshuixian', 'msx', '231200', '231225', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a89aa37dd5a64f22950e9f7b49b0371c', '市辖区', 'shixiaqu', 'sxq', '330400', '330401', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a8b00b61a61d48ad801aa856b6cf36cf', '洱源县', 'eryuanxian', 'eyx', '532900', '532930', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a8bdf8200ef3447faf77db5714066697', '旺苍县', 'wangcangxian', 'wcx', '510800', '510821', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a8c3032449644937ac024f15f314cfc5', '舞阳县', 'wuyangxian', 'wyx', '411100', '411121', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a8e366ac39104139b0bc744f8c87960e', '禹会区', 'yuhuiqu', 'yhq', '340300', '340304', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a912b25b64b3490aad961773461da546', '通道侗族自治县', 'tongdaodongzuzizhixian', 'tddzzzx', '431200', '431230', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a913f521d6f7434fae47455bed1ad9fa', '锡林郭勒盟', 'xilinguolemeng', 'xlglm', '150000', '152500', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a92bbb641ddb4af1b5a47bb23ec5cc2b', '西岗区', 'xigangqu', 'xgq', '210200', '210203', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a92da79d3c5f4a5d8f5b6411d8a73e93', '曾都区', 'cengdouqu', 'cdq', '421300', '421303', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a97a6d6255744fb8806809d50f9caf68', '鄞州区', 'yinzhouqu', 'yzq', '330200', '330212', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a996d8689bbb47eb81776b04a0cfd7b8', '无为县', 'wuweixian', 'wwx', '341400', '341422', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a997d3f952f84fa38adcb9fa48769ad7', '临淄区', 'linziqu', 'lzq', '370300', '370305', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a9ab778949bb47a6abb17398a4fcef84', '瓦房店市', 'wafangdianshi', 'wfds', '210200', '210281', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a9b124d8c1b74a05b17c52314f89ac45', '义乌市', 'yiwushi', 'yws', '330700', '330782', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a9b7f94327334f4ebe8c195f21420d20', '徐水县', 'xushuixian', 'xsx', '130600', '130625', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a9d81defe7984459b0f578bcaf1e751b', '正蓝旗', 'zhenglanqi', 'zlq', '152500', '152530', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a9e8daba82cd4ebdb8df53d8231c9ee7', '东风区', 'dongfengqu', 'dfq', '230800', '230805', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('a9f8e20349974a46aaa8879420d9e184', '市辖区', 'shixiaqu', 'sxq', '621100', '621101', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aa0195d135224d239485e94b3bf86b83', '高县', 'gaoxian', 'gx', '511500', '511525', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aa08b9daea2e41a8a01917dffa05d05b', '昌邑市', 'changyishi', 'cys', '370700', '370786', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aa09ab4575fd44be8b683c45ac5a7441', '福贡县', 'fugongxian', 'fgx', '533300', '533323', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aa6e7062bc9049888b488c37e8cf202d', '富源县', 'fuyuanxian', 'fyx', '530300', '530325', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aa9985a67a794a04b4c1d26a30417393', '市辖区', 'shixiaqu', 'sxq', '431200', '431201', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aaaacdd8e7a745f19c00c3ea0dde1450', '商水县', 'shangshuixian', 'ssx', '411600', '411623', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aac0c875f39041d9a863eda9a778e2ca', '上思县', 'shangsixian', 'ssx', '450600', '450621', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aad7c1665f954d49b0371bf93cbc912c', '东山区', 'dongshanqu', 'dsq', '230400', '230406', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aaf034b89f7942a6b6728798d29e6f27', '开原市', 'kaiyuanshi', 'kys', '211200', '211282', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aaf270b7a8254392958eaf98f884a1cc', '郾城区', 'yanchengqu', 'ycq', '411100', '411103', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab18f0ad1caa4ea99a73b53862b90b10', '同江市', 'tongjiangshi', 'tjs', '230800', '230881', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab1dc37fc3754702bd99c18bc361dac8', '新泰市', 'xintaishi', 'xts', '370900', '370982', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab28d3ed155d43f7a6657bdafac17f8b', '丰润区', 'fengrunqu', 'frq', '130200', '130208', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab4a0b58ad51450995e1b1aa90c356b9', '安多县', 'anduoxian', 'adx', '542400', '542425', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab4cdcc47f1e4ed79365d975d600fed7', '庆城县', 'qingchengxian', 'qcx', '621000', '621021', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab543095c24f41f2a9680e5eb054de9a', '上高县', 'shanggaoxian', 'sgx', '360900', '360923', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab5b4c9ba96042aaa16f1b5b1fc9c7e8', '高要市', 'gaoyaoshi', 'gys', '441200', '441283', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab668551bbba40498e55546f4e46fe64', '朝阳区', 'chaoyangqu', 'cyq', '110100', '110105', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab6b038a873542a5b72895d2ab69b60c', '湘桥区', 'xiangqiaoqu', 'xqq', '445100', '445102', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab7a169515e34b64a78a1a4c4c3c2f47', '中原区', 'zhongyuanqu', 'zyq', '410100', '410102', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab7b4010747f42339658ef8dc4ef9b22', '邢台市', 'xingtaishi', 'xts', '130000', '130500', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ab80c8b61f33437c8f0325a607f7e148', '大名县', 'damingxian', 'dmx', '130400', '130425', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('abebd2f0003c49e2898e819fcb69b1b6', '子洲县', 'zizhouxian', 'zzx', '610800', '610831', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('abf052ee75c34da8ac79868cc9cb5355', '市中区', 'shizhongqu', 'szq', '370400', '370402', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('abfd899d587e4f9c8baa1e23c8df1375', '平利县', 'pinglixian', 'plx', '610900', '610926', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ac20b9274376405dbf7064d7ae76b628', '颍东区', 'yingdongqu', 'ydq', '341200', '341203', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ac233c054a284a6fa8d08dcd4b5f0ec9', '横县', 'hengxian', 'hx', '450100', '450127', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ac8aa9ac9d3f4998abccb8fb7a57c48c', '莱城区', 'laichengqu', 'lcq', '371200', '371202', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ac8b4661550e42f39edf79c306d261ee', '岳阳市', 'yueyangshi', 'yys', '430000', '430600', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ac9e88706d7e468aa21aa381a3e0a738', '黄岛区', 'huangdaoqu', 'hdq', '370200', '370211', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aca2d0469fdd427f9a25473ee806027d', '巴南区', 'bananqu', 'bnq', '500100', '500113', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('acb19d66360545efaabed7221d178fd1', '库伦旗', 'kulunqi', 'klq', '150500', '150524', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('acf11d7371c94ceebc588a397c950ad4', '伊金霍洛旗', 'yijinhuoluoqi', 'yjhlq', '150600', '150627', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ad011c6fa3b04960a51ffef4171b7183', '青岛市', 'qingdaoshi', 'qds', '370000', '370200', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ad059aa870e5452691fc8e3288c9857d', '嘉兴市', 'jiaxingshi', 'jxs', '330000', '330400', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ad07d9dc310249b596c261e0f568f39d', '凤冈县', 'fenggangxian', 'fgx', '520300', '520327', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ad2bc9dca7734d4981b7c7ca409f5ce2', '建始县', 'jianshixian', 'jsx', '422800', '422822', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ad53e3d971624305985a8222e8e0f35f', '芗城区', 'xiangchengqu', 'xcq', '350600', '350602', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ad83bed21079428383fb28baa5ac2529', '温州市', 'wenzhoushi', 'wzs', '330000', '330300', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ad93c08a2dea4c83a6758d0ab1a75e62', '怀柔区', 'huairouqu', 'hrq', '110100', '110116', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ada35607928e4eaab3e9039e6b7afed7', '昌吉市', 'changjishi', 'cjs', '652300', '652301', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('adb20174c5aa4f8cbe14408acb5af08e', '东辽县', 'dongliaoxian', 'dlx', '220400', '220422', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('add096ad37b24e2db45c3aec59c5a091', '市辖区', 'shixiaqu', 'sxq', '650100', '650101', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('add3e319517c429fb7e35a1e59b7c2cd', '萨嘎县', 'sagaxian', 'sgx', '542300', '542337', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('add81c757d454b2598ec6e1d1ef38c06', '昌都县', 'changdouxian', 'cdx', '542100', '542121', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ade4c61ef0e64cce8d8fff0e6d10e399', '云梦县', 'yunmengxian', 'ymx', '420900', '420923', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ade6a8fb6ca9434b9d07a6c823756104', '镇海区', 'zhenhaiqu', 'zhq', '330200', '330211', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae02c1e8f7c94e77b9fcdb948c0c381f', '铁力市', 'tielishi', 'tls', '230700', '230781', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae18fc2e87b1490f87f304b93999e964', '西林区', 'xilinqu', 'xlq', '230700', '230705', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae3cac4c7fd04c858e670f1ff24ee887', '怀化市', 'huaihuashi', 'hhs', '430000', '431200', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae4dc77d7dfa4c388ff9d81982327b19', '河间市', 'hejianshi', 'hjs', '130900', '130984', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae50b6a9e34b4e93b2ffbee7eef7b32f', '市辖区', 'shixiaqu', 'sxq', '330200', '330201', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae5184a4920f49c9b43937c19976d77c', '市辖区', 'shixiaqu', 'sxq', '220200', '220201', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae59c4b69aef4873a4242c6a7eee1c54', '雷波县', 'leiboxian', 'lbx', '513400', '513437', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae617afcb6d24f2784190f69083424f8', '扶余县', 'fuyuxian', 'fyx', '220700', '220724', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae6cc59e83324a5f83a5ef5278bf1bf4', '仁布县', 'renbuxian', 'rbx', '542300', '542330', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae85f407d75a487989aee5185063e468', '红星区', 'hongxingqu', 'hxq', '230700', '230715', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae90d7e47b0a47f7bb7a3c109f9c5843', '渭源县', 'weiyuanxian', 'wyx', '621100', '621123', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ae9a57c5d687403b86ff6a74f21010f4', '那曲地区', 'naqudiqu', 'nqdq', '540000', '542400', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aea8baeb407741f9acac5d6d64dcbc7a', '东胜区', 'dongshengqu', 'dsq', '150600', '150602', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aec9ae8bd76643209b5424c7635e0667', '西固区', 'xiguqu', 'xgq', '620100', '620104', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aecaa6248f8245f280f1dd90e0babd41', '湖口县', 'hukouxian', 'hkx', '360400', '360429', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('aee33aaf57ed4b589898d32cbcb7590b', '市辖区', 'shixiaqu', 'sxq', '441500', '441501', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('af149bc7b52e47a7a61ac73a4d905ef2', '北海市', 'beihaishi', 'bhs', '450000', '450500', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('af16746eb89f488698e039b94766a315', '黑龙江省', 'heilongjiangsheng', 'hljs', '1', '230000', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('af28f6ff14134dc7a21844666b636155', '封丘县', 'fengqiuxian', 'fqx', '410700', '410727', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('af449ca619ca4325a8838e944120c9a1', '新林区', 'xinlinqu', 'xlq', '232700', '232703', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('af6167a490e940a0ae8a858ec19d0b5b', '泌阳县', 'biyangxian', 'byx', '411700', '411726', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('af61b42132eb47d2a10eddcaf14894c0', '寿阳县', 'shouyangxian', 'syx', '140700', '140725', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('af75a6c7afea4c2bbd46b2b21216cbb9', '市辖区', 'shixiaqu', 'sxq', '411000', '411001', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('afb6ce7a318a43da81d5bf0092b2946d', '萨尔图区', 'saertuqu', 'setq', '230600', '230602', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('afc325d6921248ef9ab08e28814fe005', '桓台县', 'huantaixian', 'htx', '370300', '370321', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('afc748a26bad4a4eb4359fe1e7cb2e33', '爱辉区', 'aihuiqu', 'ahq', '231100', '231102', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('afd7397f6ca44962b59f840b868fca16', '市辖区', 'shixiaqu', 'sxq', '610600', '610601', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('afe8af4c2c7f4ed39e28d2c6285850a4', '曲松县', 'qusongxian', 'qsx', '542200', '542226', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b035060692e44f818b0bda18ffe82003', '汶上县', 'wenshangxian', 'wsx', '370800', '370830', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b05a6969e05040d8a5c7033d05c9e1e5', '康马县', 'kangmaxian', 'kmx', '542300', '542331', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b09c08892ee54b0fbec209ab9de6cab1', '四方区', 'sifangqu', 'sfq', '370200', '370205', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b0a869e05ced4c9aa073e4e414db1723', '浮山县', 'fushanxian', 'fsx', '141000', '141027', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b0b757fb7581497e942b4600a76ca372', '肥乡县', 'feixiangxian', 'fxx', '130400', '130428', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b0be784b4b514e5f828c2775d995ee33', '栖霞区', 'qixiaqu', 'qxq', '320100', '320113', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b0c8b8bcf459420d8b4acbaf1f33b805', '市辖区', 'shixiaqu', 'sxq', '371100', '371101', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b0ef3fbd1b5f47d2be5fdd239d2826bb', '武昌区', 'wuchangqu', 'wcq', '420100', '420106', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b0f54b157e7946b7ae69b0fe4d26cf17', '双辽市', 'shuangliaoshi', 'sls', '220300', '220382', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1009908e0ee4264a5f016836d67e3a3', '济源市', 'jiyuanshi', 'jys', '410800', '419001', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1088dd32605485f9b1885695d4d1923', '荆州市', 'jingzhoushi', 'jzs', '420000', '421000', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b117820f65294e7b8b7e2e9581f5125d', '高坪区', 'gaopingqu', 'gpq', '511300', '511303', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b11c9da064f24689be4c4376ab287ddd', '绥棱县', 'suilengxian', 'slx', '231200', '231226', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1304a1082b94cedad9d75961c30c1b7', '原阳县', 'yuanyangxian', 'yyx', '410700', '410725', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1406106a52249ea84cba5559275a5aa', '新龙县', 'xinlongxian', 'xlx', '513300', '513329', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b14c9ff0908e4df484225f08ef19c713', '萍乡市', 'pingxiangshi', 'pxs', '360000', '360300', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b156ffcf311d4e4397dfd95e1b87fd8e', '涪陵区', 'fulingqu', 'flq', '500100', '500102', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1664a9e04284114a41b1cef64a79823', '行唐县', 'xingtangxian', 'xtx', '130100', '130125', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b16fc7ee74ec4c928ae022d361ef1a0a', '冕宁县', 'mianningxian', 'mnx', '513400', '513433', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b17a39278a444e29ab75142c3ff7be58', '濮阳市', 'puyangshi', 'pys', '410000', '410900', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b18622749fdb40b2a4b728a0bac97ee4', '东西湖区', 'dongxihuqu', 'dxhq', '420100', '420112', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1889fb3a30548a6882bedba39768c2b', '康县', 'kangxian', 'kx', '621200', '621224', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b194cd39b2664dab8a7c11f75b240e4c', '市辖区', 'shixiaqu', 'sxq', '512000', '512001', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1aa5d7defae47cc89281a1c82716d48', '泰宁县', 'tainingxian', 'tnx', '350400', '350429', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1aa8c11219040dda1417bcd9976150f', '杭锦后旗', 'hangjinhouqi', 'hjhq', '150800', '150826', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1cbeea213884acd96c2564c3dd9f168', '本溪满族自治县', 'benximanzuzizhixian', 'bxmzzzx', '210500', '210521', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1da1000fdb249d785434816a6a46d43', '单县', 'danxian', 'dx', '371700', '371722', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1df25b3813c4d9fa4243e0d9daa40a1', '澧县', 'lixian', 'lx', '430700', '430723', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b1e73f6978114d248229c3ad7bd234ee', '云溪区', 'yunxiqu', 'yxq', '430600', '430603', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b237acbfdfbc42e089ceaf565f221b40', '徽州区', 'huizhouqu', 'hzq', '341000', '341004', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b254f05e2ae048649ceaa29ffe7bb6e0', '山西省', 'shanxisheng', 'sxs', '1', '140000', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b26c1891462f402780655a1983f8b973', '市辖区', 'shixiaqu', 'sxq', '210300', '210301', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b2741e6aa7d24e39b957630b670c7a35', '曹县', 'caoxian', 'cx', '371700', '371721', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b275956cb49246d988382adce84f932a', '市辖区', 'shixiaqu', 'sxq', '640500', '640501', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b27c0e57890b45dc92816827688b53fb', '云南省', 'yunnansheng', 'yns', '1', '530000', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b2a84be38d8043b59ac650a4de5c72a0', '市辖区', 'shixiaqu', 'sxq', '441700', '441701', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b2ce1b09cc93454ebbf8cada75c5afe7', '硚口区', 'qiaokouqu', 'qkq', '420100', '420104', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b2d35fabc5d44893a3facbeab69e67a0', '慈溪市', 'cixishi', 'cxs', '330200', '330282', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b2deb5a7efce40fe9e33e9d91e6dbbd4', '新华区', 'xinhuaqu', 'xhq', '130900', '130902', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b2e9e4f1007c4d45ae79b18c4e60b17b', '红花岗区', 'honghuagangqu', 'hhgq', '520300', '520302', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b2ebe45d8c0b451b948b75e50870e847', '市辖区', 'shixiaqu', 'sxq', '441400', '441401', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b30b5fbfd25c43bdb97f99c7f7c60134', '牟定县', 'moudingxian', 'mdx', '532300', '532323', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b30c43cd1f0a486c8263c22eb1f7bf05', '市辖区', 'shixiaqu', 'sxq', '320800', '320801', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b31fc8ca93a14c3ba5df90457f403d94', '彭泽县', 'pengzexian', 'pzx', '360400', '360430', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b33c6463cd4741388e0a97430ea18c26', '汝阳县', 'ruyangxian', 'ryx', '410300', '410326', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b347bb7f293949018f1f003f84812c3a', '市辖区', 'shixiaqu', 'sxq', '430700', '430701', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b34a213eff5e49639578b2faaee8b889', '如皋市', 'rugaoshi', 'rgs', '320600', '320682', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b362344d5b31486f92fe61768e7e0c64', '象山县', 'xiangshanxian', 'xsx', '330200', '330225', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b374075f3db2417b926f35d273921ec8', '营口市', 'yingkoushi', 'yks', '210000', '210800', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b3ccd10ac227425abc58849f1ddace32', '常德市', 'changdeshi', 'cds', '430000', '430700', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b3ce012dc6364eb69ef2c5472fe74414', '象州县', 'xiangzhouxian', 'xzx', '451300', '451322', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b3d6f38bb3574ad39bdeae411276c046', '西藏自治区', 'xicangzizhiqu', 'xczzq', '1', '540000', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b3dd86525cad4b7bb2dc9eb029a2df0a', '鸡东县', 'jidongxian', 'jdx', '230300', '230321', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b3ffc8f1314b4f80978a8fd76b1bde7c', '伊宁市', 'yiningshi', 'yns', '654000', '654002', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b40f8711a3a741deab15b4a4b1659d96', '台州市', 'taizhoushi', 'tzs', '330000', '331000', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b431b51c4f2b4bbf9d67f1df1bcfb7af', '莱西市', 'laixishi', 'lxs', '370200', '370285', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4359a95ffff48b5a66d81e6d311f33b', '石首市', 'shishoushi', 'sss', '421000', '421081', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4474d05f8604be1a45a742ee42425ac', '沧浪区', 'canglangqu', 'clq', '320500', '320502', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b44dc3d0c057467b884224f9a5e0c5ee', '开远市', 'kaiyuanshi', 'kys', '532500', '532502', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b47122281f4349f1b9c98a7e4ded9b39', '丁青县', 'dingqingxian', 'dqx', '542100', '542125', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4ad0fcea9c645aba98f376d082e1892', '贺州市', 'hezhoushi', 'hzs', '450000', '451100', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4adbf3ebcce45209e2ee382059fdabb', '阿尔山市', 'aershanshi', 'aess', '152200', '152202', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4c98b8164764d8ebbceacd2ca44e7c5', '瑞安市', 'ruianshi', 'ras', '330300', '330381', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4cdf82c4e494428b068b3f8e0188849', '元氏县', 'yuanshixian', 'ysx', '130100', '130132', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4eeefe5abe849cb8fbe1e70eca85ba2', '向阳区', 'xiangyangqu', 'xyq', '230400', '230402', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b4fe0c8a21bf4ea183247aa416053c35', '叶城县', 'yechengxian', 'ycx', '653100', '653126', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b507401548fd49b2a0c3a2b60d721dd4', '朝天区', 'chaotianqu', 'ctq', '510800', '510812', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b521bb8494dc4f138688e852846c8dd1', '南长区', 'nanchangqu', 'ncq', '320200', '320203', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b52ef9235c9f496398d28b2ebc57fa5e', '市辖区', 'shixiaqu', 'sxq', '420200', '420201', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5443386f7fa4d4488df99bf9cf86a3f', '市辖区', 'shixiaqu', 'sxq', '445100', '445101', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b54642fdd53f4de3b22832520650a6c4', '沐川县', 'muchuanxian', 'mcx', '511100', '511129', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b550ec87eeb64e47b756212450e50500', '鹤山市', 'heshanshi', 'hss', '440700', '440784', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b566b934715e4c0384f4b8d27cee0aca', '玉田县', 'yutianxian', 'ytx', '130200', '130229', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5804dcebbec4b4c9cfce4f406512ad2', '木里藏族自治县', 'mulicangzuzizhixian', 'mlczzzx', '513400', '513422', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5857c2bc7364aa28ae7b0894719cc86', '乌当区', 'wudangqu', 'wdq', '520100', '520112', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b58f4e1d6ce747618e7e7e21b0e3da67', '马鞍山市', 'maanshanshi', 'mass', '340000', '340500', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5bdee88bc0a408a9d4170e813c15182', '双城市', 'shuangchengshi', 'scs', '230100', '230182', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5c21e5583334630b7cb29bb1dcd4072', '成华区', 'chenghuaqu', 'chq', '510100', '510108', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5dbd94f338c43f5a264a81150c686f2', '墨玉县', 'moyuxian', 'myx', '653200', '653222', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5e0500c1e7b411cadf359989c83cfc8', '丘北县', 'qiubeixian', 'qbx', '532600', '532626', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5e2550e401846afaacf27cd158c6f66', '万全县', 'wanquanxian', 'wqx', '130700', '130729', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5eb5342d0e04139824857aeca41e0dc', '市辖区', 'shixiaqu', 'sxq', '130800', '130801', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b5fed21d60b044feafc418e87226f6ed', '长沙县', 'changshaxian', 'csx', '430100', '430121', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b60e243811324c04b3c33bca925ccf18', '潘集区', 'panjiqu', 'pjq', '340400', '340406', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b60f2cba5c1f46e1921eba754d3d3f10', '成都市', 'chengdushi', 'cds', '510000', '510100', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b6144c9d67b14a4bba2b64aeb8d016c3', '望谟县', 'wangmoxian', 'wmx', '522300', '522326', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b61eec0a2d9f4dfdab0118c578d8a5a0', '措美县', 'cuomeixian', 'cmx', '542200', '542227', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b62cb644afdb410fbd2818958adcf386', '临洮县', 'lintaoxian', 'ltx', '621100', '621124', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b62debe73be44c2d893fb10a2c5d6166', '山海关区', 'shanhaiguanqu', 'shgq', '130300', '130303', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b6380b8fc58a4a67957c76ac0b9d225a', '阜康市', 'fukangshi', 'fks', '652300', '652302', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b63853deba454f4eb709a9d9cd94a1ce', '市辖区', 'shixiaqu', 'sxq', '431300', '431301', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b63f9d1322cb4001b9cb2d91b1482677', '贵港市', 'guigangshi', 'ggs', '450000', '450800', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b642a33dacc2401db736b70bfea4aa02', '永顺县', 'yongshunxian', 'ysx', '433100', '433127', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b659e218a7f649a5b80b01b28ad7919b', '市辖区', 'shixiaqu', 'sxq', '430300', '430301', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b65cb813b7e94918b926e2a93b83fb86', '新宾满族自治县', 'xinbinmanzuzizhixian', 'xbmzzzx', '210400', '210422', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b67aa5e6cbf94987b8da684ea52b7149', '西畴县', 'xichouxian', 'xcx', '532600', '532623', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b683d3fbb57343be8bcdae3f87655803', '集宁区', 'jiningqu', 'jnq', '150900', '150902', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b6c234fb4aa84c1c8b74880b173ca4fb', '方正县', 'fangzhengxian', 'fzx', '230100', '230124', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b6d2d4216314408b9166ca3e72e1f432', '梁山县', 'liangshanxian', 'lsx', '370800', '370832', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b6ffaddd286c438aa2cc2f870b98ee8d', '南昌县', 'nanchangxian', 'ncx', '360100', '360121', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7271036a99c4ce9a105d94ba489043e', '朗县', 'langxian', 'lx', '542600', '542627', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b75ad33326a34c31be562018abe47fda', '广宗县', 'guangzongxian', 'gzx', '130500', '130531', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b75e0d2840d94f3dadbf69bc7c2d9c1e', '霍山县', 'huoshanxian', 'hsx', '341500', '341525', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b775a5d4b90f4f5795d3d76e9906cf46', '大方县', 'dafangxian', 'dfx', '522400', '522422', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7a879fd5dfd4d25b521bd70373a84e7', '盘县', 'panxian', 'px', '520200', '520222', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7ab0943b86e4a15a34f4bee92ab9285', '鄢陵县', 'yanlingxian', 'ylx', '411000', '411024', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7b37c9d4f974aa783d68ab788208e91', '呼和浩特市', 'huhehaoteshi', 'hhhts', '150000', '150100', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7c3c6a782e1430bac0759d19ae0f0a3', '福海县', 'fuhaixian', 'fhx', '654300', '654323', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7d863326f8e48f9b888983e82a1b886', '平阳县', 'pingyangxian', 'pyx', '330300', '330326', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7d8ffa9e81947e8927018d4acea4f6f', '蓬江区', 'pengjiangqu', 'pjq', '440700', '440703', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7de914ba4e341938feb48e98528f3b8', '市辖区', 'shixiaqu', 'sxq', '230700', '230701', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b7eabab31cd1498e943cbda79301462b', '蝶山区', 'dieshanqu', 'dsq', '450400', '450404', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b84f0b115d894b0190530c250a91d40e', '德保县', 'debaoxian', 'dbx', '451000', '451024', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b85218d5d96c41e4a79f7e9cbf3b74be', '珲春市', 'hunchunshi', 'hcs', '222400', '222404', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b870c44f4eb64eea97b31428268ef8c9', '平江区', 'pingjiangqu', 'pjq', '320500', '320503', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b87368fa8477496d9f234312ad3efe83', '涿鹿县', 'zhuoluxian', 'zlx', '130700', '130731', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b88ef81d656d47e19b90cd542bcdfa7d', '市辖区', 'shixiaqu', 'sxq', '230200', '230201', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b8a2ec6b520b4795b2b55dcd3bfab386', '疏附县', 'shufuxian', 'sfx', '653100', '653121', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b8be6d20f2d9455eb1e47717ce4651d2', '望都县', 'wangdouxian', 'wdx', '130600', '130631', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b8dace46ce5042359b9c80fd440189ef', '武汉市', 'wuhanshi', 'whs', '420000', '420100', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b8fda2c2582848f7a0a7ed72c0e44e9a', '市辖区', 'shixiaqu', 'sxq', '420300', '420301', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9353242754a45bf9cebad08c45d2259', '市辖区', 'shixiaqu', 'sxq', '340500', '340501', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b94e0fae5c8944c4b6bdc983be42d628', '东宝区', 'dongbaoqu', 'dbq', '420800', '420802', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b952a2a93b43445fa2bfc4584c82c818', '凌源市', 'lingyuanshi', 'lys', '211300', '211382', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b957843c677545db99329f1038fffe9a', '和田市', 'hetianshi', 'hts', '653200', '653201', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b96c5bb114734398adb1153302ccf681', '渝中区', 'yuzhongqu', 'yzq', '500100', '500103', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b96c68d6dd994f9e8d1c3fbfdd4a9679', '阿拉善左旗', 'alashanzuoqi', 'alszq', '152900', '152921', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9727172427f4f78973c6634cf29dc49', '市辖区', 'shixiaqu', 'sxq', '150400', '150401', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b97b83c250ac438c831051e02127ffa7', '镇赉县', 'zhenlaixian', 'zlx', '220800', '220821', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9aa74014e354e50a700ee23aa204339', '来宾市', 'laibinshi', 'lbs', '450000', '451300', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9abd0c7794b4dbabccfb7bf0bd55c3c', '田林县', 'tianlinxian', 'tlx', '451000', '451029', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9b73b75424e44d7af4986b2a85067b8', '科尔沁区', 'keerqinqu', 'keqq', '150500', '150502', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9b7f8052ba143ea89c574b1e0af776a', '苏尼特右旗', 'suniteyouqi', 'sntyq', '152500', '152524', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9dd87b9680d44f7832f8c804a89b413', '城西区', 'chengxiqu', 'cxq', '630100', '630104', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9f4956d65b344389319e6e4afdc1355', '扎鲁特旗', 'zaluteqi', 'zltq', '150500', '150526', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('b9f89ac82eeb401c8e15fbc98e74a778', '荥经县', 'xingjingxian', 'xjx', '511800', '511822', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba09429a372544c994eceea1442f8af4', '南澳县', 'nanaoxian', 'nax', '440500', '440523', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba203a0db84a4bfc8c1d7f5269e703b1', '邛崃市', 'qionglaishi', 'qls', '510100', '510183', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba2b65216c184bb8ad5415ec609d0cbf', '市辖区', 'shixiaqu', 'sxq', '140200', '140201', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba2bd2292c4940e58db55b57e40fee82', '市辖区', 'shixiaqu', 'sxq', '350800', '350801', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba2e02f2cb9c45fbbe8c67c87057c0f2', '四平市', 'sipingshi', 'sps', '220000', '220300', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba47e245ac1444e6bd0e519b6a58ad16', '平原县', 'pingyuanxian', 'pyx', '371400', '371426', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba4d0e4f97e045c68a7a7f4466784e62', '绥化市', 'suihuashi', 'shs', '230000', '231200', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba7ad45ef9404cb6a69e0f5216386916', '邯郸市', 'handanshi', 'hds', '130000', '130400', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba821a10b2804e498a659f3654050fa0', '青田县', 'qingtianxian', 'qtx', '331100', '331121', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba8da6ddfc49471793485a6f2e1c9952', '江城哈尼族彝族自治县', 'jiangchenghanizuyizuzizhixian', 'jchnzyzzzx', '530800', '530826', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ba9e7f0b2b4648fcaccb6e6959ffdd66', '十堰市', 'shiyanshi', 'sys', '420000', '420300', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('baaf5945df7545ea9575e79bc336c5d0', '威宁彝族回族苗族自治县', 'weiningyizuhuizumiaozuzizhixian', 'wnyzhzmzzzx', '522400', '522427', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('badb410a0b6c4c35b674c2dd38784fcf', '克什克腾旗', 'keshenketengqi', 'ksktq', '150400', '150425', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('baebe995099d487abb29ce49ae667913', '卫滨区', 'weibinqu', 'wbq', '410700', '410703', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('baf75575e9a9451ea1029c8a21e1a128', '运城市', 'yunchengshi', 'ycs', '140000', '140800', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('baf9b0f454a044798b573f9330219094', '兴山区', 'xingshanqu', 'xsq', '230400', '230407', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bafce3b990674118a0ac6dc034b0e05c', '龙岗区', 'longgangqu', 'lgq', '440300', '440307', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bafe96857d8644378a9056be46c9159b', '临夏回族自治州', 'linxiahuizuzizhizhou', 'lxhzzzz', '620000', '622900', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb09d76c609e4666bd8a08207096da55', '丹寨县', 'danzhaixian', 'dzx', '522600', '522636', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb20f8c778414c818c72252deee63e7a', '孟州市', 'mengzhoushi', 'mzs', '410800', '410883', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb2109e1ab0f4548ae60af88325d95dd', '成武县', 'chengwuxian', 'cwx', '371700', '371723', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb32dfd1acaf4daebdf9ceac236a635b', '云浮市', 'yunfushi', 'yfs', '440000', '445300', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb434fa5146b42078091172c2c75f4ef', '市辖区', 'shixiaqu', 'sxq', '450100', '450101', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb4352f2d2f942889ce1276b341fcc01', '临泽县', 'linzexian', 'lzx', '620700', '620723', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb71109e71a845fd92518829a8060d29', '长海县', 'changhaixian', 'chx', '210200', '210224', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bb8ad0986a974587b181001f6d0cf674', '寿宁县', 'shouningxian', 'snx', '350900', '350924', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bba141e558f94045a8dae0f6ab0071aa', '市辖区', 'shixiaqu', 'sxq', '370300', '370301', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbac38a85f704b6b9185a3c974478454', '漳平市', 'zhangpingshi', 'zps', '350800', '350881', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbafbd27520c4c908a9541b370db7c00', '富民县', 'fuminxian', 'fmx', '530100', '530124', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbbf59a480f840c19845dd3e32e7d534', '河津市', 'hejinshi', 'hjs', '140800', '140882', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbc0b05ba7524103add65477325762ea', '望花区', 'wanghuaqu', 'whq', '210400', '210404', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbdd43dc5bac4811920b8c90623db3c0', '桐庐县', 'tongluxian', 'tlx', '330100', '330122', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbe7f31e4fd94144a33401a055fd3e60', '永福县', 'yongfuxian', 'yfx', '450300', '450326', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbeddce1bde94da4b5e4ccaca8ca1231', '临汾市', 'linfenshi', 'lfs', '140000', '141000', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bbfdfcd15155402db194d945c78b1c51', '红山区', 'hongshanqu', 'hsq', '150400', '150402', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bc06e985a3984e91b3045d1f69f00e12', '市辖区', 'shixiaqu', 'sxq', '320700', '320701', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bc12ec6a2992460485d9c3d83b223ae0', '江南区', 'jiangnanqu', 'jnq', '450100', '450105', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bc193f6284d54e45bf4a7b8270841d84', '黔西南布依族苗族自治州', 'qianxinanbuyizumiaozuzizhizhou', 'qxnbyzmzzzz', '520000', '522300', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bc7995294bd044efae8315358ca1e556', '银海区', 'yinhaiqu', 'yhq', '450500', '450503', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bc7b2918a78740b588ebc2e61918a4b0', '临潼区', 'lintongqu', 'ltq', '610100', '610115', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bc9cc0a5f3744e408804c6cd478da4c0', '黄冈市', 'huanggangshi', 'hgs', '420000', '421100', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bc9dec981ad940c08605f6ebd02afb2d', '贵南县', 'guinanxian', 'gnx', '632500', '632525', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bcae444e835246399186aef1f7ca9cd5', '册亨县', 'cehengxian', 'chx', '522300', '522327', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bcef6468981c43b0a160d479c8fb34f5', '伊吾县', 'yiwuxian', 'ywx', '652200', '652223', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bd1217b27ef64feb92709b33db904e86', '鼎湖区', 'dinghuqu', 'dhq', '441200', '441203', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bd25e637257c44348da782616c0352dd', '大同县', 'datongxian', 'dtx', '140200', '140227', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bd2f04842ebb4dcf9f6b4b5ab36e56fb', '云龙区', 'yunlongqu', 'ylq', '320300', '320303', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bd63855d16b5406997227b8d7d7adfc8', '江北区', 'jiangbeiqu', 'jbq', '330200', '330205', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bd69ebd4f4694f659822a808121dc392', '市辖区', 'shixiaqu', 'sxq', '321000', '321001', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bd7cace9f2964b8e8272f48195bd50e3', '嵩县', 'songxian', 'sx', '410300', '410325', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bda8c642407e46aa9b26b85354a87b02', '德昌县', 'dechangxian', 'dcx', '513400', '513424', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bde24485a02e47099342f484a8a6370a', '泸州市', 'luzhoushi', 'lzs', '510000', '510500', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be0f195b7b3648c08897d104053a25b5', '二道区', 'erdaoqu', 'edq', '220100', '220105', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be20dafb414746c69e2c6a90eda66307', '玉环县', 'yuhuanxian', 'yhx', '331000', '331021', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be33a1e3a8a048a8bb121d514b9411a1', '安阳市', 'anyangshi', 'ays', '410000', '410500', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be39b763146044689b027ef782689f3c', '湘阴县', 'xiangyinxian', 'xyx', '430600', '430624', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be4ab9dc5b92409e9b24f8aaf7965083', '博罗县', 'boluoxian', 'blx', '441300', '441322', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be559404d2ee40faa3ce4a71b22a626b', '市辖区', 'shixiaqu', 'sxq', '230800', '230801', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be62d1c018bb4835ba144bd60e6314cb', '镇远县', 'zhenyuanxian', 'zyx', '522600', '522625', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be68ede75b234fe2b0a96e6b7c6e8362', '涧西区', 'jianxiqu', 'jxq', '410300', '410305', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be87494dc1084a43ac304367a8a693bd', '策勒县', 'celexian', 'clx', '653200', '653225', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be8ed26f8e514e959aa88b92b5e2e8b8', '大化瑶族自治县', 'dahuayaozuzizhixian', 'dhyzzzx', '451200', '451229', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('be9cc0ce2b944b86b9f6feb368d34d80', '市辖区', 'shixiaqu', 'sxq', '510100', '510101', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bea650e4e896408898823af6f5020e77', '市辖区', 'shixiaqu', 'sxq', '210600', '210601', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bea8ae14985d4dfa95169eb166bb6bc6', '南城县', 'nanchengxian', 'ncx', '361000', '361021', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('beaab4e2a13048eaacbe0e6555a158b0', '衡山县', 'hengshanxian', 'hsx', '430400', '430423', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bec281d81f964a91a9918420248a7452', '乌拉特后旗', 'wulatehouqi', 'wlthq', '150800', '150825', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('becc3c55253844979430da514eca391b', '城关区', 'chengguanqu', 'cgq', '620100', '620102', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bee0b93920364c1186826f38800e5ffc', '华县', 'huaxian', 'hx', '610500', '610521', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bee77ca1adb64711ae78503addca7d5f', '阳高县', 'yanggaoxian', 'ygx', '140200', '140221', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('befda90090b840a4afffaf8c87325543', '游仙区', 'youxianqu', 'yxq', '510700', '510704', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bf003b1e0bd54de19856404a1748f56a', '临颍县', 'linyingxian', 'lyx', '411100', '411122', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bf6498526a6f463c82846c47728941c5', '泰州市', 'taizhoushi', 'tzs', '320000', '321200', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bf8b21a753aa4b2aa5408c7cbbc52367', '雁江区', 'yanjiangqu', 'yjq', '512000', '512002', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bf8fcdda757148ddaf3ba5f3801c1374', '市辖区', 'shixiaqu', 'sxq', '371400', '371401', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bfa958e7e4d74003955419effd9fb7c6', '同德县', 'tongdexian', 'tdx', '632500', '632522', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bfdadd3244014263a8c718abbc279e0d', '循化撒拉族自治县', 'xunhuasalazuzizhixian', 'xhslzzzx', '632100', '632128', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bfe6833c99da4b2da5752905353dc58d', '龙安区', 'longanqu', 'laq', '410500', '410506', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('bff775d004064c7291ad42a72eba923f', '山南地区', 'shannandiqu', 'sndq', '540000', '542200', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c02619ec024f43f6a2fc061f5886c441', '千山区', 'qianshanqu', 'qsq', '210300', '210311', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0379435fa584dc49d5f623e550a1ba4', '茂港区', 'maogangqu', 'mgq', '440900', '440903', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c03cb7fca7b04d3cbcd9afd80780a595', '千阳县', 'qianyangxian', 'qyx', '610300', '610328', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c042bdc83033435dabd6a7be3c838cbb', '滦南县', 'luannanxian', 'lnx', '130200', '130224', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c04db748199642b1abc04363349a0c60', '株洲市', 'zhuzhoushi', 'zzs', '430000', '430200', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0667637bec64a36bc4403f19017817d', '下关区', 'xiaguanqu', 'xgq', '320100', '320107', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c070a3b0c54b4c35872b55db56e40fd3', '合山市', 'heshanshi', 'hss', '451300', '451381', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c090d2d1364f41e185a3dc06e272ef50', '新源县', 'xinyuanxian', 'xyx', '654000', '654025', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0a868054445490d8755b41fd7de1472', '镇坪县', 'zhenpingxian', 'zpx', '610900', '610927', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0af825f103e4385a80c8d9e27454aa4', '称多县', 'chengduoxian', 'cdx', '632700', '632723', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0b963ef667c4efb8731b26abde6bc31', '美溪区', 'meixiqu', 'mxq', '230700', '230708', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0ca16ef14224e64aebdeb7fe81fe579', '武山县', 'wushanxian', 'wsx', '620500', '620524', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0cf73ca1d8a4c54bb82a0bfd5b7e3d9', '惠济区', 'huijiqu', 'hjq', '410100', '410108', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0cfda33aa6444338b49892137c85e91', '沽源县', 'guyuanxian', 'gyx', '130700', '130724', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0f7ac10ddbb4ca0980061a4b32d34ac', '沙湾县', 'shawanxian', 'swx', '654200', '654223', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c0fcd101912344d6a2df69632c9ee6cc', '涵江区', 'hanjiangqu', 'hjq', '350300', '350303', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c113071c0a03455e833f698a1c67dc4c', '仙居县', 'xianjuxian', 'xjx', '331000', '331024', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c115192178774ca3896e9db5bbc73849', '濠江区', 'haojiangqu', 'hjq', '440500', '440512', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c129b37eabcf4e3884e3dff9463f90f1', '市辖区', 'shixiaqu', 'sxq', '520400', '520401', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c13660052f694e3391e50e763b38e181', '市辖区', 'shixiaqu', 'sxq', '430400', '430401', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c15dc84ff320431eaf7fbca2a6f65a43', '三门峡市', 'sanmenxiashi', 'smxs', '410000', '411200', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c164359d7bcc46adb740c05c588097ac', '建德市', 'jiandeshi', 'jds', '330100', '330182', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c175582c4c3b4977b78173fbcb214d16', '松北区', 'songbeiqu', 'sbq', '230100', '230109', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c19bc85ab0214fa18c2fefb4c88d19fb', '承德县', 'chengdexian', 'cdx', '130800', '130821', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c1a69c62ec6b4e14a5afaf2e6f12f247', '太和县', 'taihexian', 'thx', '341200', '341222', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c1d0e8fbc8e846aaa9f87bf82db82323', '大关县', 'daguanxian', 'dgx', '530600', '530624', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c21239e03cc4475b8e63ef2f3fa21f59', '沅陵县', 'yuanlingxian', 'ylx', '431200', '431222', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c23e20639d3d4821a40c245779a70a0f', '洪江市', 'hongjiangshi', 'hjs', '431200', '431281', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c24492ec1c0a424a8f9fa94569b97935', '肇东市', 'zhaodongshi', 'zds', '231200', '231282', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c260ad856c7c45d18df8746b06cb49dd', '科尔沁右翼前旗', 'keerqinyouyiqianqi', 'keqyyqq', '152200', '152221', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c265aafbc0cf4e75aefead747a3c5ce4', '叙永县', 'xuyongxian', 'xyx', '510500', '510524', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2a758fc706640e6b5978d2ae0237899', '苍梧县', 'cangwuxian', 'cwx', '450400', '450421', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2af5367cdff47e5bafde2fd104d08a5', '鱼峰区', 'yufengqu', 'yfq', '450200', '450203', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2b0efee5c764061af569469a26e8e85', '范县', 'fanxian', 'fx', '410900', '410926', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2d75d114f2843d99319908988fcb368', '曲沃县', 'quwoxian', 'qwx', '141000', '141021', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2da57f0b3f94fcda095c9f544c973fc', '镇康县', 'zhenkangxian', 'zkx', '530900', '530924', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2e13c83de3e41fcb68f07263570a8d1', '五指山市', 'wuzhishanshi', 'wzss', '469000', '469001', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2e4c3ecf3924b848221234d49821938', '天宁区', 'tianningqu', 'tnq', '320400', '320402', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c2e5f910f6ab46a982e03844344c304d', '盘山县', 'panshanxian', 'psx', '211100', '211122', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c32a66a9f2ae4b1fbcb1a3a68bc899eb', '华池县', 'huachixian', 'hcx', '621000', '621023', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c33edff586e24f6788d2a619b9c2da5a', '北流市', 'beiliushi', 'bls', '450900', '450981', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3421a5f1a484b2e9a28100a7de8f408', '白银市', 'baiyinshi', 'bys', '620000', '620400', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c34a892d0b6d43788d26e51994e0189e', '市辖区', 'shixiaqu', 'sxq', '410800', '410801', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c353165a0cfb47b3bfd40d033d701e5b', '河池市', 'hechishi', 'hcs', '450000', '451200', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c378268c935e4c94a1f736d3d45c8387', '岚山区', 'lanshanqu', 'lsq', '371100', '371103', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3783e9a8bd04e669eb738d2d4f4aee3', '湖南省', 'hunansheng', 'hns', '1', '430000', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c382a4de9a924a86b43b5b92eb23aeb7', '荔蒲县', 'lipuxian', 'lpx', '450300', '450331', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3849412929343df8b94f377fe43764b', '资阳区', 'ziyangqu', 'zyq', '430900', '430902', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c393d9b0578b4f05b8ac4d4725a3b6c6', '花都区', 'huadouqu', 'hdq', '440100', '440114', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c39df726f7c14db4966faba004440088', '鹤城区', 'hechengqu', 'hcq', '431200', '431202', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3a0afea572148658e558595fadf47ba', '丰县', 'fengxian', 'fx', '320300', '320321', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3a6cc8d6f794081bb0639fac49a2ab9', '临海市', 'linhaishi', 'lhs', '331000', '331082', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3aee85748904af79f6cc20e319b8323', '汉源县', 'hanyuanxian', 'hyx', '511800', '511823', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3bc84f5e5c14bba9af9b5fb819a8c90', '全南县', 'quannanxian', 'qnx', '360700', '360729', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3be2e9d1d0c47279f3d521f33897590', '玉门市', 'yumenshi', 'yms', '620900', '620981', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3e31f508c8844aca9bf76b3d2dee892', '辽阳市', 'liaoyangshi', 'lys', '210000', '211000', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c3fce324822d4ac6b846665965e242c8', '祁门县', 'qimenxian', 'qmx', '341000', '341024', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c409ff440db84c1286d0ecf5d2a15f24', '鹿泉市', 'luquanshi', 'lqs', '130100', '130185', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c41ed9b256234a9b887cadf9f6191b71', '永康市', 'yongkangshi', 'yks', '330700', '330784', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c425be88892841a5b5defecb31083f61', '夏河县', 'xiahexian', 'xhx', '623000', '623027', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c429e243e97e4a7987af0046f320f9ad', '科尔沁右翼中旗', 'keerqinyouyizhongqi', 'keqyyzq', '152200', '152222', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4305990fdf548d39af4d3523bf5dfc8', '兴城市', 'xingchengshi', 'xcs', '211400', '211481', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c437f55b6a63407692f4df12717d828b', '察哈尔右翼中旗', 'chahaeryouyizhongqi', 'cheyyzq', '150900', '150927', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c43a1aaa0d4c4394b94d5fb5c4597ff3', '敖汉旗', 'aohanqi', 'ahq', '150400', '150430', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c43d8bf924e34cf18c68c2b8edf1cc0b', '屯留县', 'tunliuxian', 'tlx', '140400', '140424', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4712554f6134cb8a94fbad7d14781cc', '霞浦县', 'xiapuxian', 'xpx', '350900', '350921', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4805009873b47349c341399ae5a6865', '陆川县', 'luchuanxian', 'lcx', '450900', '450922', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c48cc2f1fbfe41768fc8d3c1962960ec', '覃塘区', 'tantangqu', 'ttq', '450800', '450804', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4921041b4804f11af241696e551882a', '左云县', 'zuoyunxian', 'zyx', '140200', '140226', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4b3055db65c438ca46106c71e055b14', '宁南县', 'ningnanxian', 'nnx', '513400', '513427', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4e00af295334e50850153e0ce92ac56', '建华区', 'jianhuaqu', 'jhq', '230200', '230203', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4e0ee33edb641c5a3a663a5639c3aa3', '榆中县', 'yuzhongxian', 'yzx', '620100', '620123', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4e6f88b04c14315845e56475a4cc8ab', '万安县', 'wananxian', 'wax', '360800', '360828', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4ed639563914fb99f1b55bcbba2051a', '惠州市', 'huizhoushi', 'hzs', '440000', '441300', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c4f296c6dd7144d584f33800362267fc', '集安市', 'jianshi', 'jas', '220500', '220582', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c51660a55c594d1488001ccfd504a2ae', '吉安市', 'jianshi', 'jas', '360000', '360800', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c52ab132e95a4fde97a605915f9702f1', '抚州市', 'fuzhoushi', 'fzs', '360000', '361000', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c531eedbbb24477eadcd5e228567acd6', '雨花台区', 'yuhuataiqu', 'yhtq', '320100', '320114', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c54351ea228c4121981885dcb03afae3', '临城县', 'linchengxian', 'lcx', '130500', '130522', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5496acd1da54fbca77758b2ac4571d0', '澄江县', 'chengjiangxian', 'cjx', '530400', '530422', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5640751df9e4ca39b49fcd912bf7621', '临西县', 'linxixian', 'lxx', '130500', '130535', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5809638e45f44309e0ca089148036ed', '永嘉县', 'yongjiaxian', 'yjx', '330300', '330324', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5b9fa965bde456384b3dd1cac21d606', '市辖区', 'shixiaqu', 'sxq', '640400', '640401', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5bf80e5303a4071a4f2ed7ba2c72e12', '台儿庄区', 'taierzhuangqu', 'tezq', '370400', '370405', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5eac5313a154311b804b684ad74ab30', '张家港市', 'zhangjiagangshi', 'zjgs', '320500', '320582', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5f1d3cb54d04aa5bec3bd6850fb9831', '安乡县', 'anxiangxian', 'axx', '430700', '430721', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c5f7e9527c0240df9056d8a5dd2efa91', '盱眙县', 'xuyixian', 'xyx', '320800', '320830', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6100082254b49e2b160c47f6c101784', '勉县', 'mianxian', 'mx', '610700', '610725', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c61a0e6210374f6ab5b3726667f16f7a', '阜宁县', 'funingxian', 'fnx', '320900', '320923', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c632d76c964b45f3aaf5fac9aef64941', '市辖区', 'shixiaqu', 'sxq', '370400', '370401', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6379c6521744c37bed8292c75141873', '天水市', 'tianshuishi', 'tss', '620000', '620500', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c63ae0590d82461e9318b97256f4a3e2', '新兴县', 'xinxingxian', 'xxx', '445300', '445321', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6466f9857a54ac9b5007c70ec6cda3a', '邯郸县', 'handanxian', 'hdx', '130400', '130421', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c65eca9b301e4f29b05eb45620391aa4', '赛罕区', 'saihanqu', 'shq', '150100', '150105', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c668d5d993fa40589a0016859a90fd87', '新沂市', 'xinyishi', 'xys', '320300', '320381', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c674bfc8077d45a7a55494740e4b156f', '白云区', 'baiyunqu', 'byq', '520100', '520113', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c67e149561224ec4a149d30388edb2ab', '市辖区', 'shixiaqu', 'sxq', '451000', '451001', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c68e3f31654e4ec187d20bc5916cac3f', '泉山区', 'quanshanqu', 'qsq', '320300', '320311', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c68ff7368018476485c55adca889b7c8', '克拉玛依区', 'kelamayiqu', 'klmyq', '650200', '650203', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6979a92045a487d82eb91c45c2bc735', '沁源县', 'qinyuanxian', 'qyx', '140400', '140431', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6a11d79e8b74465a34587ae72cb0d5a', '岳普湖县', 'yuepuhuxian', 'yphx', '653100', '653128', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6a7d549bdff4977a4d5cc285f2bc140', '灌阳县', 'guanyangxian', 'gyx', '450300', '450327', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6d1dcc64c564b0eaa6b8a625d13c0fd', '鄂托克旗', 'etuokeqi', 'etkq', '150600', '150624', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6d636a7c03a443cac4feccaee040c11', '华阴市', 'huayinshi', 'hys', '610500', '610582', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6d7258787594ba79c6ef457b397136d', '梓潼县', 'zitongxian', 'ztx', '510700', '510725', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6e0ec81f3d3448795b077a76a54df67', '市辖区', 'shixiaqu', 'sxq', '141000', '141001', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6eb6dfc371541f591bf880909afcd44', '市辖区', 'shixiaqu', 'sxq', '371000', '371001', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c6fb36a3ffe741d8842341c45cf308bf', '勃利县', 'bolixian', 'blx', '230900', '230921', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c75caaf0c1314853891bb7c6ac4b9d35', '潮州市', 'chaozhoushi', 'czs', '440000', '445100', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c77c472dac42423fbeb3b0d6022f93dd', '会泽县', 'huizexian', 'hzx', '530300', '530326', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7967938e7cf47729d0af1863148ee5b', '云阳县', 'yunyangxian', 'yyx', '500200', '500235', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7a095d688c84e8db976370210472d5a', '高台县', 'gaotaixian', 'gtx', '620700', '620724', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7a92651ca22437d8dba8963e90a2865', '海州区', 'haizhouqu', 'hzq', '320700', '320706', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7b044e9c1da4365a6568c327538ea6f', '东海县', 'donghaixian', 'dhx', '320700', '320722', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7b7c8c3b7034f4aa160814efb1bd71d', '澄迈县', 'chengmaixian', 'cmx', '469000', '469023', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7b8f4c50eb24eab9489c02498e8006b', '额济纳旗', 'ejinaqi', 'ejnq', '152900', '152923', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7cc13efd8164cbd851b8e4b984abd16', '柯坪县', 'kepingxian', 'kpx', '652900', '652929', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7d6db57feff4af593ff5a4339f6633f', '太平区', 'taipingqu', 'tpq', '210900', '210904', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7e94bc6a2744a8fa2118beae8ef878b', '招远市', 'zhaoyuanshi', 'zys', '370600', '370685', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7f871002722445392fc354e9a61079e', '安塞县', 'ansaixian', 'asx', '610600', '610624', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7f927dd992943aeb535d3477b13a515', '马龙县', 'malongxian', 'mlx', '530300', '530321', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c7fb1e1e35fe4e74b1628a4b3a9a6227', '孝感市', 'xiaoganshi', 'xgs', '420000', '420900', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c802a11c6e8c46b6bb329b142a3acbc6', '镇平县', 'zhenpingxian', 'zpx', '411300', '411324', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c806afa0deb34b8c951045b0ec492a15', '贵定县', 'guidingxian', 'gdx', '522700', '522723', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c8097d2ee21c42878df105152186a781', '昌都地区', 'changdoudiqu', 'cddq', '540000', '542100', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c8102339e8c7437eab69e025cb4de2b7', '克东县', 'kedongxian', 'kdx', '230200', '230230', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c817f2051a624142a896d90c1d537100', '中国', 'zhongguo', 'zg', '', '1', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c8299d4d624f441ead93bf6bc5d88b3c', '市辖区', 'shixiaqu', 'sxq', '320600', '320601', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c82c76c1cd084e86904ca400fae2e407', '通辽市', 'tongliaoshi', 'tls', '150000', '150500', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c83f0f452b224402996261a3bfe48c7f', '新和县', 'xinhexian', 'xhx', '652900', '652925', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c84d3f61a3f44678a44709e2b085693b', '泸县', 'luxian', 'lx', '510500', '510521', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c8521ca3fc944418b85528b27652903e', '开封县', 'kaifengxian', 'kfx', '410200', '410224', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c85299f0e6314ebc8bc88d21604a96cb', '广安区', 'guanganqu', 'gaq', '511600', '511602', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c877de6951d048b3929da01606d9c488', '长泰县', 'changtaixian', 'ctx', '350600', '350625', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c8a3a24f3d2e4b30bb0f41fb3e2241bf', '沿滩区', 'yantanqu', 'ytq', '510300', '510311', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c8f7dd0e5dd74a1fa892879fd6db413b', '阎良区', 'yanliangqu', 'ylq', '610100', '610114', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c90aa285d0bc46a9a5cc6414e8046d15', '惠东县', 'huidongxian', 'hdx', '441300', '441323', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c90fd2496a294c11869b30b579d1685b', '永济市', 'yongjishi', 'yjs', '140800', '140881', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c912ce5474b34eaaa38951625aecceef', '市辖区', 'shixiaqu', 'sxq', '450300', '450301', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c91f8fbb0f6e472cadbf645c10cdfeee', '柞水县', 'zhashuixian', 'zsx', '611000', '611026', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c928c3e8e11e4c938d109d1216217389', '阿荣旗', 'arongqi', 'arq', '150700', '150721', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c937c55f75714dfeb1cd32d5bddd5e46', '奈曼旗', 'naimanqi', 'nmq', '150500', '150525', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c94335cad2094e0abeca67544f8f4a25', '抚顺县', 'fushunxian', 'fsx', '210400', '210421', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9479792c35d4cd894388509751aa159', '华亭县', 'huatingxian', 'htx', '620800', '620824', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9498983737c4adcb4d421585d5f5633', '兰溪市', 'lanxishi', 'lxs', '330700', '330781', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c95d14c74c6b4f8583b0ae53fd937acc', '漳州市', 'zhangzhoushi', 'zzs', '350000', '350600', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9669f02f0e44ec688e37788b766b477', '陵县', 'lingxian', 'lx', '371400', '371421', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9880c5a33d748afac183e1ad6064550', '兴安县', 'xinganxian', 'xax', '450300', '450325', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c990690847424e8ebe70b7a3c6d94d11', '市辖区', 'shixiaqu', 'sxq', '211000', '211001', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9b97a0e495741039955bdc929a1073d', '武城县', 'wuchengxian', 'wcx', '371400', '371428', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9ceee7600e5481ab5e1aa64475cd70d', '市辖区', 'shixiaqu', 'sxq', '350200', '350201', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9dfdcecaa974c8eb2b68559878b6874', '丛台区', 'congtaiqu', 'ctq', '130400', '130403', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9e16e2d5f734cc4883c16a3a3a909a8', '洮南市', 'taonanshi', 'tns', '220800', '220881', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9eeb658dc5a4af29d3afdc93f1e22db', '九龙坡区', 'jiulongpoqu', 'jlpq', '500100', '500107', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('c9f2712127ef4794abf855d3b5bff996', '柘荣县', 'zherongxian', 'zrx', '350900', '350926', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca038470f7454194bc5e79d4db5acb5f', '渭滨区', 'weibinqu', 'wbq', '610300', '610302', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca0b6fd82203467090952a11eaf45ace', '明溪县', 'mingxixian', 'mxx', '350400', '350421', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca0e99052fdf44d982686cf15def1c66', '西乡县', 'xixiangxian', 'xxx', '610700', '610724', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca3b99ba184f4b55a49405c87644922b', '岳塘区', 'yuetangqu', 'ytq', '430300', '430304', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca50a9a74fa2498891c8c31570a148cd', '金东区', 'jindongqu', 'jdq', '330700', '330703', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca6b94bedc3b4f56b3871033c04c9fbc', '邵阳县', 'shaoyangxian', 'syx', '430500', '430523', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca8b3b5b333043849670db9745b94394', '枣庄市', 'zaozhuangshi', 'zzs', '370000', '370400', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca93f187b38f4d65aac043a5504e80d7', '绛县', 'jiangxian', 'jx', '140800', '140826', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca99d806696d4ebdae4d4bf062c6d5e8', '罗城仫佬族自治县', 'luochengmulaozuzizhixian', 'lcmlzzzx', '451200', '451225', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca9d560f88574095b34547c40a4c54da', '麻章区', 'mazhangqu', 'mzq', '440800', '440811', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ca9f0505868546bba417ad6a84711659', '九寨沟县', 'jiuzhaigouxian', 'jzgx', '513200', '513225', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('caaa39be597a4cb1969550b504be3db3', '武陵区', 'wulingqu', 'wlq', '430700', '430702', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cab1efc033804e2cba74dabd7db7e29e', '普陀区', 'putuoqu', 'ptq', '310100', '310107', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cac3e0086f684ae183ba1e75d53dc86d', '平陆县', 'pingluxian', 'plx', '140800', '140829', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('caca8a6124614d9fb8f959eee9ee3223', '省直辖县级行政区划', 'shengzhixiaxianjixingzhengquhua', 'szxxjxzqh', '420000', '429000', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cace5ffa07fb4f58950b3cdd15fe36a6', '沿河土家族自治县', 'yanhetujiazuzizhixian', 'yhtjzzzx', '522200', '522228', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cafd671786c4449d913fd50ce7bed531', '乌什县', 'wushenxian', 'wsx', '652900', '652927', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cafd6762096d4f93b8c475672e86f208', '呼玛县', 'humaxian', 'hmx', '232700', '232721', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb02ee82cd3c4f28a912f5f2f99aa991', '拱墅区', 'gongshuqu', 'gsq', '330100', '330105', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb06167e5c804defa53c7a67fab26e69', '新密市', 'xinmishi', 'xms', '410100', '410183', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb19bd1ac2174c558babec1a8bacd660', '雨城区', 'yuchengqu', 'ycq', '511800', '511802', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb2cdc6933204ddd97075ad078fc34dd', '石泉县', 'shiquanxian', 'sqx', '610900', '610922', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb2dbdb80ce549e6a2c062913c69b403', '市辖区', 'shixiaqu', 'sxq', '350900', '350901', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb5326de29874d6684110b5b338f5432', '淮阳县', 'huaiyangxian', 'hyx', '411600', '411626', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb695fc6cf9f478eb1c4cd4cd3618af7', '永安市', 'yonganshi', 'yas', '350400', '350481', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb8cab016d7d4bdfa9b49e43b8f45e5e', '江苏省', 'jiangsusheng', 'jss', '1', '320000', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cb91a9a313444c138e975134fbba91a5', '信阳市', 'xinyangshi', 'xys', '410000', '411500', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cba02bc98b5f494ab84ad100b3479728', '郫县', 'pixian', 'px', '510100', '510124', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cbb9e60a54ca45049dd014f2d50c3e2d', '工农区', 'gongnongqu', 'gnq', '230400', '230403', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cbc8179e3e5b46e28ca070a78a6c8168', '市辖区', 'shixiaqu', 'sxq', '210700', '210701', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cbc8a70abf364201a7cf0575bffc073a', '延长县', 'yanchangxian', 'ycx', '610600', '610621', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cbde52a6bde04c8188fa649e17c04698', '湘西土家族苗族自治州', 'xiangxitujiazumiaozuzizhizhou', 'xxtjzmzzzz', '430000', '433100', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc0c4487808649769ec95c75d2d57a5e', '菏泽市', 'hezeshi', 'hzs', '370000', '371700', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc0d3ec012c5440caab59ee787793e4c', '宣州区', 'xuanzhouqu', 'xzq', '341800', '341802', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc10cb9910aa49b8878d036abd6e98eb', '莲湖区', 'lianhuqu', 'lhq', '610100', '610104', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc38e7ea916a444ea45a5734256a9740', '黎川县', 'lichuanxian', 'lcx', '361000', '361022', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc41fe7295044ee0a9716b9e62350384', '仁寿县', 'renshouxian', 'rsx', '511400', '511421', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc47c09f8f9d4a68bd61365daf824a26', '市辖区', 'shixiaqu', 'sxq', '440700', '440701', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc570de4831c45e1bc17df754d7b0fb0', '惠阳区', 'huiyangqu', 'hyq', '441300', '441303', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc5b4aaa98324ed484663a211a9e976e', '锡山区', 'xishanqu', 'xsq', '320200', '320205', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc67546c17b94609b1cde052f29cfcd3', '美姑县', 'meiguxian', 'mgx', '513400', '513436', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc877df0fdfe4660807c1d852546519d', '江汉区', 'jianghanqu', 'jhq', '420100', '420103', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc90b6dc480d455e87fced07890639cb', '务川仡佬族苗族自治县', 'wuchuanyilaozumiaozuzizhixian', 'wcylzmzzzx', '520300', '520326', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cc92be35bcf8478081c8c612dc1639e2', '华宁县', 'huaningxian', 'hnx', '530400', '530424', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cca50d26fc714333ba8d8e68b4afd978', '蒲江县', 'pujiangxian', 'pjx', '510100', '510131', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ccdc2177316f43a49d569c932f40542c', '镇宁布依族苗族自治县', 'zhenningbuyizumiaozuzizhixian', 'znbyzmzzzx', '520400', '520423', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd074f7c4a364e2f90b03a8dab40ff80', '科尔沁左翼后旗', 'keerqinzuoyihouqi', 'keqzyhq', '150500', '150522', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd0ce62151ee432791bc38bb553c9905', '市辖区', 'shixiaqu', 'sxq', '530400', '530401', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd1fb08599f54d02906db221a5426a3b', '临泉县', 'linquanxian', 'lqx', '341200', '341221', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd2670c158164ebbaa2439f9d67dd66a', '新邱区', 'xinqiuqu', 'xqq', '210900', '210903', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd2c88de7de44f48996091a2cadef2e8', '南开区', 'nankaiqu', 'nkq', '120100', '120104', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd33af3b1cb64e0fb8a44ca1ac8223d0', '黄浦区', 'huangpuqu', 'hpq', '310100', '310101', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd470cbe54804336ac4f14ab2af0be6d', '宁阳县', 'ningyangxian', 'nyx', '370900', '370921', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd4c1fc48dab41beb142f26fd125a64c', '富蕴县', 'fuyunxian', 'fyx', '654300', '654322', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd6867e772ca49969e271fab527e3334', '关岭布依族苗族自治县', 'guanlingbuyizumiaozuzizhixian', 'glbyzmzzzx', '520400', '520424', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd86cdf6d1c1462f8b5fc65abb8fca83', '麒麟区', 'qilinqu', 'qlq', '530300', '530302', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd88a36546f04fde9d69056dc2210d66', '电白县', 'dianbaixian', 'dbx', '440900', '440923', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cd8f6c6e26cc43c4956be4a85f599568', '龙井市', 'longjingshi', 'ljs', '222400', '222405', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdba41cefa12489b829732f7a1845f21', '恭城瑶族自治县', 'gongchengyaozuzizhixian', 'gcyzzzx', '450300', '450332', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdbb88e30d174130b248568cf408257f', '凤泉区', 'fengquanqu', 'fqq', '410700', '410704', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdc1a8d5d0dd428ab631917c1bab1f7e', '旬阳县', 'xunyangxian', 'xyx', '610900', '610928', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdc40d0e31cd487ca7f735a27ba756ed', '大足县', 'dazuxian', 'dzx', '500200', '500225', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdc6eee3f2964c1491717f9b37a32734', '临漳县', 'linzhangxian', 'lzx', '130400', '130423', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdce90dfcca642e78d07fb0875a2ed11', '垫江县', 'dianjiangxian', 'djx', '500200', '500231', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdd19d89d4664f7bb760cecaa69575a6', '岭东区', 'lingdongqu', 'ldq', '230500', '230503', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cdea584aa34144ea8c9d4ee06ca0e63a', '裕民县', 'yuminxian', 'ymx', '654200', '654225', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce0079a13706424180b10348ebe15708', '市辖区', 'shixiaqu', 'sxq', '210900', '210901', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce0e3902cdca4b65b0eedb5f13d110c6', '红寺堡区', 'hongsibaoqu', 'hsbq', '640300', '640303', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce208f84687c40edbe8a5fed8a6287ea', '巴东县', 'badongxian', 'bdx', '422800', '422823', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce410e8b61ed4e46b4b42da850827312', '德钦县', 'deqinxian', 'dqx', '533400', '533422', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce552092120b4c4fa44268c29d9720f5', '上蔡县', 'shangcaixian', 'scx', '411700', '411722', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce6df6a5a8ac4d5cb491460ce1ae917b', '掇刀区', 'duodaoqu', 'ddq', '420800', '420804', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce6f5136ff86493d915ef444294deff5', '市辖区', 'shixiaqu', 'sxq', '420800', '420801', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce70f06ba5f8489f9964b8e32f95ac7e', '唐河县', 'tanghexian', 'thx', '411300', '411328', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce779dfc4ec94864ab7a7b80d2c96e63', '丰镇市', 'fengzhenshi', 'fzs', '150900', '150981', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce81b274a0ce4c4eb6c8dbd91326fd92', '市辖区', 'shixiaqu', 'sxq', '320900', '320901', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ce9a206ec4c94f848e03e4a9d9659cb8', '奉化市', 'fenghuashi', 'fhs', '330200', '330283', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cea1d7dac8544643a2f6013ec0ac2703', '龙子湖区', 'longzihuqu', 'lzhq', '340300', '340302', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cea73303ac7a4762a421a892e5baad41', '湛江市', 'zhanjiangshi', 'zjs', '440000', '440800', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ced1b2f6ac1a45b3b3b3d52021bf7480', '市辖区', 'shixiaqu', 'sxq', '220600', '220601', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ced9901d7ecb43f29ad0cfcd96b18cd6', '建平县', 'jianpingxian', 'jpx', '211300', '211322', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cee9ceb8118749248960ece5ea29fa43', '温江区', 'wenjiangqu', 'wjq', '510100', '510115', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cefffc11eef2491bb662b47eb1a35119', '鹤壁市', 'hebishi', 'hbs', '410000', '410600', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf120187d6ff4d23bcc3626c7599cabd', '海珠区', 'haizhuqu', 'hzq', '440100', '440105', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf19f221f5fb4ae28c5022a2eb9c99b7', '合江县', 'hejiangxian', 'hjx', '510500', '510522', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf1f4e9e1019412fbb105258bf274784', '乌兰县', 'wulanxian', 'wlx', '632800', '632821', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf31d8dbe4a54c52a74e8cb95de4b528', '泽库县', 'zekuxian', 'zkx', '632300', '632323', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf33dc9caa4640c98c968779c8693286', '万宁市', 'wanningshi', 'wns', '469000', '469006', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf36f1e37fcf4b8b942bc8a9681b9b91', '珠海市', 'zhuhaishi', 'zhs', '440000', '440400', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf37e236f4c14d1897146a65fe5cec1d', '长阳土家族自治县', 'changyangtujiazuzizhixian', 'cytjzzzx', '420500', '420528', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf44e67ba59d416cbb6cd1f57776ce3f', '嘉善县', 'jiashanxian', 'jsx', '330400', '330421', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf460d47ece44886914a4991f89435c1', '平山区', 'pingshanqu', 'psq', '210500', '210502', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf5af3f551b54a57a8d4fb2e2476056b', '古田县', 'gutianxian', 'gtx', '350900', '350922', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf7ec96159394cf7a9d4d0d9e01b03af', '山阳区', 'shanyangqu', 'syq', '410800', '410811', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf9a518e5d7d4e0a97d1273efc9e5202', '碾子山区', 'nianzishanqu', 'nzsq', '230200', '230207', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cf9f9c284f744619b7036d7af042b9d6', '镇雄县', 'zhenxiongxian', 'zxx', '530600', '530627', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cfa258642dfb4dee82def3ee5ed9547c', '铁东区', 'tiedongqu', 'tdq', '210300', '210302', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cfb35f33cbe94efa9aaec420c6f8e812', '上犹县', 'shangyouxian', 'syx', '360700', '360724', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cfbdc13c974a4221b18d131ca46fcf37', '静乐县', 'jinglexian', 'jlx', '140900', '140926', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cfbe0c6285ca4e4ca1eb2d7338c979dc', '东宁县', 'dongningxian', 'dnx', '231000', '231024', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cfd4c4abfe95455ea222be93ac6cbea1', '永平县', 'yongpingxian', 'ypx', '532900', '532928', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cfddf489e04445b0aa1c99c6297222cc', '峨边彝族自治县', 'ebianyizuzizhixian', 'ebyzzzx', '511100', '511132', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('cff896a3caeb4f43aff39c3e87786e70', '娄底市', 'loudishi', 'lds', '430000', '431300', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d00c0547fd594a6599e2acdc5b7bdc77', '德格县', 'degexian', 'dgx', '513300', '513330', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d01abddc0e33401982093d88da06bc21', '县', 'xian', 'x', '310000', '310200', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d01c04d121bb4f42adb773d0e9ddceda', '合浦县', 'hepuxian', 'hpx', '450500', '450521', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d02413384feb4ffe95c9c84f2670ca21', '旌阳区', 'jingyangqu', 'jyq', '510600', '510603', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d030924a8a984eceb6fd33854e66b2ee', '都兰县', 'doulanxian', 'dlx', '632800', '632822', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d033f18a4f474f319a1ccf60e33b1561', '尼玛县', 'nimaxian', 'nmx', '542400', '542430', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d04dfd649b3244feae7485c6bfd48e88', '尉氏县', 'weishixian', 'wsx', '410200', '410223', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d057780fde2941d986eb3f149fca83c9', '古城区', 'guchengqu', 'gcq', '530700', '530702', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d05c92a80d58461c9cf4416b0e27b177', '渝水区', 'yushuiqu', 'ysq', '360500', '360502', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0a2b4054749412085f9a7b719c0e7d8', '市辖区', 'shixiaqu', 'sxq', '360500', '360501', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0a5f8f5329e48308445db3069d1771c', '安泽县', 'anzexian', 'azx', '141000', '141026', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0aa75bf09ef4142922e6b76cccaa662', '舞钢市', 'wugangshi', 'wgs', '410400', '410481', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0ac82f822ed40cc82a0638d55b44387', '伊犁哈萨克自治州', 'yilihasakezizhizhou', 'ylhskzzz', '650000', '654000', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0af3222d8204c91bfe8e0ccecf720c2', '舒城县', 'shuchengxian', 'scx', '341500', '341523', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0bee8d14f8e4e5bbb62759498c9c176', '广安市', 'guanganshi', 'gas', '510000', '511600', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0c2bdd09c4a409ba61a64dbce3c6a7c', '当雄县', 'dangxiongxian', 'dxx', '540100', '540122', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0ca6be5d9b54bbeade5fb1d2bb2ecb6', '泰山区', 'taishanqu', 'tsq', '370900', '370902', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0f5a3ff854a43f3a595c7e5a47d46d6', '泾川县', 'jingchuanxian', 'jcx', '620800', '620821', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0f6b7d7e3184382a7d86196e27876a4', '团风县', 'tuanfengxian', 'tfx', '421100', '421121', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d0f92440c39b4eebabb258d53842dc10', '围场满族蒙古族自治县', 'weichangmanzumengguzuzizhixian', 'wcmzmgzzzx', '130800', '130828', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d1147d0ba93c44509c1da2ea3a4cdbf3', '冷水滩区', 'lengshuitanqu', 'lstq', '431100', '431103', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d11c42f48f7f4553935342c32109e0b9', '市辖区', 'shixiaqu', 'sxq', '350500', '350501', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d13cff8354dc46e2ab37f21eb4651fa1', '建瓯市', 'jianoushi', 'jos', '350700', '350783', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d162d325f4ac4781ad40972d94afd1ea', '平凉市', 'pingliangshi', 'pls', '620000', '620800', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d172745994844c21a0e53b71080d3f8a', '遂平县', 'suipingxian', 'spx', '411700', '411728', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d17813a21bce4bdca3920a30638e4279', '市辖区', 'shixiaqu', 'sxq', '361000', '361001', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d17a8477f71941108b024f3df42a004c', '银川市', 'yinchuanshi', 'ycs', '640000', '640100', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d18e9c107bd245d197cdcc59109bf9c1', '岫岩满族自治县', 'xiuyanmanzuzizhixian', 'xymzzzx', '210300', '210323', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d18f752bd60b4e47bdd67db259292c07', '绥江县', 'suijiangxian', 'sjx', '530600', '530626', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d19d6c8d23064059ad70eb5dbb34d0ab', '和静县', 'hejingxian', 'hjx', '652800', '652827', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d1b1add4a7bd45dd9bcb790ba5e4604e', '宁陕县', 'ningshanxian', 'nsx', '610900', '610923', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d1bf46bfcd52456bbe585da062b55ece', '城北区', 'chengbeiqu', 'cbq', '630100', '630105', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d1c9d4125e9649139658955f173ee267', '双江拉祜族佤族布朗族傣族自治县', 'shuangjianglahuzuwazubulangzudaizuzizhixian', 'sjlhzwzblzdzzzx', '530900', '530925', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d2671ea0847b47a59770e3c9401f6ed3', '管城回族区', 'guanchenghuizuqu', 'gchzq', '410100', '410104', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d267dc5700c14c148c5755f6fc33db9c', '坡头区', 'potouqu', 'ptq', '440800', '440804', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d288bf2ab252460e93590d1e48e139d5', '市辖区', 'shixiaqu', 'sxq', '430100', '430101', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d28ced2d04a047d9b64d9945624383de', '聂拉木县', 'nielamuxian', 'nlmx', '542300', '542336', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d296518fcf10426a947e4911a439a2f9', '平江县', 'pingjiangxian', 'pjx', '430600', '430626', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d29b31b0cc3d4a60b24ceb053a52429f', '延津县', 'yanjinxian', 'yjx', '410700', '410726', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d2a95b3f86f74ef1b24ca1491c5b1015', '市辖区', 'shixiaqu', 'sxq', '220300', '220301', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d2bb8b14b8644d628c30dbd8b648b2d0', '市辖区', 'shixiaqu', 'sxq', '131100', '131101', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d2c7f2079aba41b88ae748b4df80531a', '广阳区', 'guangyangqu', 'gyq', '131000', '131003', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d2ddd2a126ad492d82e5321486553ea7', '瑞金市', 'ruijinshi', 'rjs', '360700', '360781', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d2e3d5ec4aa541fea4ae81a7d8fdd034', '新安县', 'xinanxian', 'xax', '410300', '410323', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d2f65234974044e6893d3394e62fb658', '敦化市', 'dunhuashi', 'dhs', '222400', '222403', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d31ced4c05534ea6ae282821d4e7055d', '安县', 'anxian', 'ax', '510700', '510724', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d3299bd58708410394d830372b020c27', '七台河市', 'qitaiheshi', 'qths', '230000', '230900', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d3823d8cc04d44bb934f986a2f2e4d93', '永川区', 'yongchuanqu', 'ycq', '500100', '500118', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d3831ffa2645445c89da1a59015266c2', '徽县', 'huixian', 'hx', '621200', '621227', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d3a496b7516d44d38eaefa9df41867ba', '黄平县', 'huangpingxian', 'hpx', '522600', '522622', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d3de451722244e8f9e9241788fa3bd37', '市辖区', 'shixiaqu', 'sxq', '371200', '371201', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d3ec0f03bd574111b2b58a5909f25940', '双桥区', 'shuangqiaoqu', 'sqq', '130800', '130802', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d3f7c99ef1e34137ba50c58ba88aba22', '永年县', 'yongnianxian', 'ynx', '130400', '130429', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d408f36c7ff74622a9fc7bd7ea47a727', '元坝区', 'yuanbaqu', 'ybq', '510800', '510811', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d423508f96b54cd59e9d95c91f8ab89f', '哈巴河县', 'habahexian', 'hbhx', '654300', '654324', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d4556258895c4b01bdf71b29a908bbea', '玉泉区', 'yuquanqu', 'yqq', '150100', '150104', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d45904827a414a51b560a713ffc89443', '肃南裕固族自治县', 'sunanyuguzuzizhixian', 'snygzzzx', '620700', '620721', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d469493e4522454a984ad49000ae540d', '市辖区', 'shixiaqu', 'sxq', '220500', '220501', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d469e98848f24578bc14100cb5b84d8a', '玉溪市', 'yuxishi', 'yxs', '530000', '530400', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d46c2b7193b746b7aeb773975774ea3b', '偃师市', 'yanshishi', 'yss', '410300', '410381', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d47536dc16084cfd828fcf1c27845b01', '卓资县', 'zhuozixian', 'zzx', '150900', '150921', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d4a6ac72430e430c9edb6aec009ae18a', '文水县', 'wenshuixian', 'wsx', '141100', '141121', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d4a74b41d21f448f824775dd63f6600c', '独山子区', 'dushanziqu', 'dszq', '650200', '650202', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d4b7718f3f2449a0b86eff48fbc15911', '鼓楼区', 'gulouqu', 'glq', '410200', '410204', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d4d52ee9dc264efc97642304462a9765', '禹城市', 'yuchengshi', 'ycs', '371400', '371482', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d4d76f301fe141808a02f4596a248053', '市辖区', 'shixiaqu', 'sxq', '350400', '350401', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d4e5744ebd914969bfe2f62bc959ba6a', '四会市', 'sihuishi', 'shs', '441200', '441284', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5023e22b8c142c49f201455f8d3f24a', '市辖区', 'shixiaqu', 'sxq', '420600', '420601', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d505e59456ea4265b475ff8693fb5c51', '长安区', 'changanqu', 'caq', '130100', '130102', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d508b6c8ed0241c68c7ad0b61df62403', '市辖区', 'shixiaqu', 'sxq', '450500', '450501', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d50f7845c091448bb88b67a9b33dfc14', '友谊县', 'youyixian', 'yyx', '230500', '230522', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5142711d96e437d92fe10eab1a42b1a', '中牟县', 'zhongmuxian', 'zmx', '410100', '410122', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d519c840a5d04759a87becdf57bb4f31', '乳山市', 'rushanshi', 'rss', '371000', '371083', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5268591292b4da4a19959c7e6bdda96', '福田区', 'futianqu', 'ftq', '440300', '440304', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d529a9961dd5474f95f4910e18ed018d', '市中区', 'shizhongqu', 'szq', '511000', '511002', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5347fcee1e0491ebf975430a0dd2f83', '英山县', 'yingshanxian', 'ysx', '421100', '421124', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d53d99ac80314751b10513553c1736bb', '吉安县', 'jianxian', 'jax', '360800', '360821', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d544e6d775904a2da2e6d1d664620b1b', '勐腊县', 'menglaxian', 'mlx', '532800', '532823', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d560aac7bd054bb5b96c37938c3486ae', '市辖区', 'shixiaqu', 'sxq', '340100', '340101', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5639b50c365478194be9dfb2dd8bc19', '乐业县', 'leyexian', 'lyx', '451000', '451028', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5781e13323d4711943abe4c2ac1c0fe', '阿坝县', 'abaxian', 'abx', '513200', '513231', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5a00f91f8a54d4486790525e99736e4', '盘龙区', 'panlongqu', 'plq', '530100', '530103', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5a8cfa6f62a4b468b1f07f8059d8c99', '新城区', 'xinchengqu', 'xcq', '610100', '610102', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5aa7303fd1c4b7181ba96bd0dc7ed6d', '市辖区', 'shixiaqu', 'sxq', '411500', '411501', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5c3bd6f2979403fbd673b1bde56bd85', '滨城区', 'binchengqu', 'bcq', '371600', '371602', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5d2464fb6704314b243b1c3c1360cc6', '宝坻区', 'baodiqu', 'bdq', '120100', '120115', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5d9a7ccaa5b449e8019f65a864fc528', '泊头市', 'botoushi', 'bts', '130900', '130981', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5d9bdba2f2045d187b68e470109b09c', '南沙区', 'nanshaqu', 'nsq', '440100', '440115', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5e474d62adb48869767beef18da1725', '塔河县', 'tahexian', 'thx', '232700', '232722', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d5f2b50e85d14943a731393a9e06921a', '龙海市', 'longhaishi', 'lhs', '350600', '350681', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d603ed0570f34867baa365ac948ff614', '晋江市', 'jinjiangshi', 'jjs', '350500', '350582', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d6101c7348f048a69af1287b316d26ec', '翔安区', 'xianganqu', 'xaq', '350200', '350213', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d61f5d4d4ecf49688ba3e56a92087550', '大通回族土族自治县', 'datonghuizutuzuzizhixian', 'dthztzzzx', '630100', '630121', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d6206b49c16943dfb9a16653ba54dee7', '铜官山区', 'tongguanshanqu', 'tgsq', '340700', '340702', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d63901c5afc1440abe7d107c8b0affde', '辽阳县', 'liaoyangxian', 'lyx', '211000', '211021', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d63d7b45ddf34b4998783bb0a289e681', '市辖区', 'shixiaqu', 'sxq', '440400', '440401', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d6759d07aab94b0aab16e1919e55464f', '宁乡县', 'ningxiangxian', 'nxx', '430100', '430124', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d6cbaf4fbfef406cbfba22f9b7260040', '宿城区', 'suchengqu', 'scq', '321300', '321302', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d6e93df3907d4d5f895a7b4e9862d386', '恩施土家族苗族自治州', 'enshitujiazumiaozuzizhizhou', 'estjzmzzzz', '420000', '422800', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d6edeebdea11495981c70d3102599d59', '佛山市', 'foshanshi', 'fss', '440000', '440600', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d70103eba1044cf398d1d059ea376469', '钦北区', 'qinbeiqu', 'qbq', '450700', '450703', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d70a6c9933fa4b6f8def1d312ab7ad17', '三穗县', 'sansuixian', 'ssx', '522600', '522624', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d736c4aa89bf49dbac3e6bef32b5dd0a', '阿克苏市', 'akesushi', 'akss', '652900', '652901', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d75bffdb17464e6c9a817dd798bbeca5', '阿拉尔市', 'alaershi', 'ales', '659000', '659002', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d76b8016c3a444829f5d3d7a83751423', '孟连傣族拉祜族佤族自治县', 'mengliandaizulahuzuwazuzizhixian', 'mldzlhzwzzzx', '530800', '530827', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d785ad6cdc89470f8594919912829cc4', '图们市', 'tumenshi', 'tms', '222400', '222402', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d797eeda352148b586f229c977a767a2', '宁津县', 'ningjinxian', 'njx', '371400', '371422', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d7d74dbe48de41e1953368de7c753f43', '保亭黎族苗族自治县', 'baotinglizumiaozuzizhixian', 'btlzmzzzx', '469000', '469029', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d7d7b451ef68445f8b4ea6556f072530', '金沙县', 'jinshaxian', 'jsx', '522400', '522424', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d7f2637ec78942d6aa0548b12457c3e9', '定州市', 'dingzhoushi', 'dzs', '130600', '130682', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d7fc19ce1da84048a460aa90c26f88ac', '邯山区', 'hanshanqu', 'hsq', '130400', '130402', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d7fcaeadcf684d6daea1cb2768b138bb', '桓仁满族自治县', 'huanrenmanzuzizhixian', 'hrmzzzx', '210500', '210522', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8057c8bbe284e43a9b8d6bd2fe6b56a', '郊区', 'jiaoqu', 'jq', '340700', '340711', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8103a04487c43b49757ddbcd94e996e', '石景山区', 'shijingshanqu', 'sjsq', '110100', '110107', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d818beeaac9b4d0e8c6a38284beded61', '瑞昌市', 'ruichangshi', 'rcs', '360400', '360481', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d848649b63284b46969bb3c1be5f5c91', '海伦市', 'hailunshi', 'hls', '231200', '231283', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d84ee27b40a34e2eaf4fb69bb7225166', '清涧县', 'qingjianxian', 'qjx', '610800', '610830', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d873e0ca604c417087de3f6edc8593ec', '尖草坪区', 'jiancaopingqu', 'jcpq', '140100', '140108', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d87686fcfc054edd8a0662537d0772de', '包头市', 'baotoushi', 'bts', '150000', '150200', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d87e3532d4c14e95af95deaffdfd8f2a', '翠峦区', 'cuiluanqu', 'clq', '230700', '230706', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d87ef1dff85542a9aa71d5df7c83ff36', '赣榆县', 'ganyuxian', 'gyx', '320700', '320721', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d88112f86871418289173b6d6f4051a6', '弥勒县', 'milexian', 'mlx', '532500', '532526', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d89747fc083840a684f0712a8b6a92a1', '曲阜市', 'qufushi', 'qfs', '370800', '370881', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8a21b52d46f435796deb3c171df251a', '临邑县', 'linyixian', 'lyx', '371400', '371424', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8a4c148e0374bdea746ef5589262bf4', '浔阳区', 'xunyangqu', 'xyq', '360400', '360403', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8bcbe120e7c4972918021c3b7bd8038', '新会区', 'xinhuiqu', 'xhq', '440700', '440705', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8cf5a770b3d4e2d92153f42a91930a1', '立山区', 'lishanqu', 'lsq', '210300', '210304', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8d2862a697c458c9e4c6e301b50b393', '市辖区', 'shixiaqu', 'sxq', '450400', '450401', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8e328b22c714eb4ba4da4346a0d6ae0', '复兴区', 'fuxingqu', 'fxq', '130400', '130404', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8e8d5932b7646b887976f0135f4c49c', '宿迁市', 'suqianshi', 'sqs', '320000', '321300', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8ea1a5a5d93404e99639179518632ce', '固镇县', 'guzhenxian', 'gzx', '340300', '340323', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d8f3d510993e497fb31b58e77b6ecb5f', '东兴市', 'dongxingshi', 'dxs', '450600', '450681', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d911804330764446bbb3e42c82c12870', '连云港市', 'lianyungangshi', 'lygs', '320000', '320700', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d914f6849eee436592a5bd9c7d7d9570', '分宜县', 'fenyixian', 'fyx', '360500', '360521', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d9187dd3af284dc0acd00f88502bad74', '故城县', 'guchengxian', 'gcx', '131100', '131126', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d93a3a6df426426e9363471ba18d9341', '市辖区', 'shixiaqu', 'sxq', '411100', '411101', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d93fab62cdd94b8194e09dfececd2e73', '泾县', 'jingxian', 'jx', '341800', '341823', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d9b07954f3e84d72b46f41bf80640472', '海沧区', 'haicangqu', 'hcq', '350200', '350205', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d9c4024df81e47f198e3b7509fc7291a', '婺源县', 'wuyuanxian', 'wyx', '361100', '361130', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d9e3705bfd3b418e9c089d904b7f73d5', '内乡县', 'neixiangxian', 'nxx', '411300', '411325', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d9e8ab8a79a643daa679f95b73d11b95', '达州市', 'dazhoushi', 'dzs', '510000', '511700', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('d9f34f42f3a842e2809814d73d7f3d43', '赤峰市', 'chifengshi', 'cfs', '150000', '150400', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da0cd25e8da24b40aacbce0617b8d516', '任城区', 'renchengqu', 'rcq', '370800', '370811', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da1e2dfd9d3242adb6f49c9ab094d94b', '丽水市', 'lishuishi', 'lss', '330000', '331100', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da21098201a946ddaf99843310b9e13f', '邗江区', 'hanjiangqu', 'hjq', '321000', '321003', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da53361db2a843f4a63271530e0cfc90', '猇亭区', 'xiaotingqu', 'xtq', '420500', '420505', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da5c047f3f9f4942bdebc849eddb2418', '黄南藏族自治州', 'huangnancangzuzizhizhou', 'hnczzzz', '630000', '632300', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da75f442013d49de84a7d674ebf5dc28', '汾阳市', 'fenyangshi', 'fys', '141100', '141182', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da7f29f56776427ba81446cce13615d6', '高邑县', 'gaoyixian', 'gyx', '130100', '130127', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('da9b9fd26cdc48bdb3622f9247ce0350', '上虞市', 'shangyushi', 'sys', '330600', '330682', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('daad3545bdba4b2b9c962d6a7cd47e43', '西双版纳傣族自治州', 'xishuangbannadaizuzizhizhou', 'xsbndzzzz', '530000', '532800', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dab9e09a94c74eb5b612ab8367b4a71b', '连山壮族瑶族自治县', 'lianshanzhuangzuyaozuzizhixian', 'lszzyzzzx', '441800', '441825', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('daba05f5bb98438183a3b2aa0cde8bf5', '金安区', 'jinanqu', 'jaq', '341500', '341502', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dae0a2d7ed8040e996b565c56009e9f3', '海林市', 'hailinshi', 'hls', '231000', '231083', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('daf662b43eaf46d2bf5122b3a34d24fe', '屏边苗族自治县', 'pingbianmiaozuzizhixian', 'pbmzzzx', '532500', '532523', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db00cc8f242545c4af8d918641cbd0cd', '市辖区', 'shixiaqu', 'sxq', '410100', '410101', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db04a87256024b449fc6de6396045da2', '绥阳县', 'suiyangxian', 'syx', '520300', '520323', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db213a51d13a40f3a30de2bafda7f12e', '建阳市', 'jianyangshi', 'jys', '350700', '350784', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db2eb74b677d4c5f91361256750c5cae', '布拖县', 'butuoxian', 'btx', '513400', '513429', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db2ef112766f4526aa48107115f30e2b', '市辖区', 'shixiaqu', 'sxq', '370800', '370801', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db39a95522f34dc9a1a1dfaabbd8b893', '秀屿区', 'xiuyuqu', 'xyq', '350300', '350305', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db4a708399f24004afe52f66052a8bb0', '汶川县', 'wenchuanxian', 'wcx', '513200', '513221', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db5067582db54543a906659d5e197810', '恩平市', 'enpingshi', 'eps', '440700', '440785', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db51fdcd02dc40ba908f7be33d374ae3', '于都县', 'yudouxian', 'ydx', '360700', '360731', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db527831cfe94d04a54d77718a86e9ae', '阿克陶县', 'aketaoxian', 'aktx', '653000', '653022', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db96d1d6408949a4bef3c3ef21950129', '乾安县', 'qiananxian', 'qax', '220700', '220723', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('db9d3e8253e4481cb614c37f75d78e7c', '市辖区', 'shixiaqu', 'sxq', '150900', '150901', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dbb41e60ed9046e9b8587349c1da9382', '秭归县', 'ziguixian', 'zgx', '420500', '420527', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dbc416d32138410dbcccbe57e13e4a72', '旅顺口区', 'lvshunkouqu', 'lskq', '210200', '210212', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dbcafb02d0854b6cb0c83c3964077bf4', '吉林省', 'jilinsheng', 'jls', '1', '220000', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dbe7c039ab3a4a62b13979c4155852ac', '通化县', 'tonghuaxian', 'thx', '220500', '220521', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc289f692f91414e9691c232a2593724', '蚌山区', 'bangshanqu', 'bsq', '340300', '340303', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc327ae25bdf41fc8e2ed04e38492756', '长寿区', 'changshouqu', 'csq', '500100', '500115', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc37b321b6e34e8c8d8c02ef4bf1e89d', '蓝山县', 'lanshanxian', 'lsx', '431100', '431127', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc466618a6564760992160fb006b2e15', '禹王台区', 'yuwangtaiqu', 'ywtq', '410200', '410205', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc48925ed05745879a1ef331d849d6c8', '托克逊县', 'tuokexunxian', 'tkxx', '652100', '652123', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc6a5c011308420d9127351471146e10', '双滦区', 'shuangluanqu', 'slq', '130800', '130803', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc6f81c14dc5457a883a8b877062fcd0', '西昌市', 'xichangshi', 'xcs', '513400', '513401', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc8a46f8a1254c3394f9bade27948e7a', '互助土族自治县', 'huzhutuzuzizhixian', 'hztzzzx', '632100', '632126', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc8fac153133497dabd610235312a7f3', '市辖区', 'shixiaqu', 'sxq', '430200', '430201', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc928ac4d15344b580a0eb9ceedfb55f', '大兴安岭地区', 'daxinganlingdiqu', 'dxaldq', '230000', '232700', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dc9f22f25286482e98d336d84009353f', '小河区', 'xiaohequ', 'xhq', '520100', '520114', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dcb5d7eccc574b29b2b293920befe4b6', '市中区', 'shizhongqu', 'szq', '511100', '511102', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dcbd823ac2cf4658976eea9a425490f9', '薛城区', 'xuechengqu', 'xcq', '370400', '370403', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dcd2568ece32470392aaf88ce65596bc', '精河县', 'jinghexian', 'jhx', '652700', '652722', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dce69d6c0f604450879df602f5ee65c4', '康保县', 'kangbaoxian', 'kbx', '130700', '130723', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dce98ad23ecc44a2ac76b1f6b53bbdfc', '西充县', 'xichongxian', 'xcx', '511300', '511325', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dd22226fa8704376a470014ee7360549', '和龙市', 'helongshi', 'hls', '222400', '222406', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dd2816b149344d0f84f83967f80d1c33', '安庆市', 'anqingshi', 'aqs', '340000', '340800', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dd4da39082e7463f9ddc2c076cd4bc4e', '利津县', 'lijinxian', 'ljx', '370500', '370522', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dd6f4bcf457c49cf948e49ae10de2f00', '垦利县', 'kenlixian', 'klx', '370500', '370521', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dd8d7e1e77614762ba65237980ae1ea8', '崇仁县', 'chongrenxian', 'crx', '361000', '361024', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ddab563160934e788cad9803214d678a', '揭阳市', 'jieyangshi', 'jys', '440000', '445200', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ddc280ec1f85469d81961f043139bfa2', '城区', 'chengqu', 'cq', '140500', '140502', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ddc8ed682fc64c458673411d6d876aeb', '克拉玛依市', 'kelamayishi', 'klmys', '650000', '650200', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ddfa40cfb631426cac17b22f28c99ce8', '华容县', 'huarongxian', 'hrx', '430600', '430623', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de0cb51a103249f3811d057d23ebba38', '浑源县', 'hunyuanxian', 'hyx', '140200', '140225', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de1bc7f04df9426689c58c40740e001b', '南和县', 'nanhexian', 'nhx', '130500', '130527', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de572c5de9044a129b387d47924136e5', '鲁甸县', 'ludianxian', 'ldx', '530600', '530621', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de5891ab265a46feab4ce2e842ade23a', '许昌县', 'xuchangxian', 'xcx', '411000', '411023', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de667dd56b9b4d399a255e0ce1f6037c', '木兰县', 'mulanxian', 'mlx', '230100', '230127', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de6a08cc97b740028193e0591a093ed5', '门源回族自治县', 'menyuanhuizuzizhixian', 'myhzzzx', '632200', '632221', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de7ca9f9a25843629f2aad10ae0a2a7a', '衡南县', 'hengnanxian', 'hnx', '430400', '430422', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de897c7559524c148f1ed110a21efd15', '市辖区', 'shixiaqu', 'sxq', '210800', '210801', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('de9ccf67071548538fce9b4b5e8e3577', '藤县', 'tengxian', 'tx', '450400', '450422', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('deaa132d3f4d45d9b3ff5483368ac020', '涟源市', 'lianyuanshi', 'lys', '431300', '431382', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('def29ad3dd6c475d9ad8cf92b263b6f5', '明山区', 'mingshanqu', 'msq', '210500', '210504', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('defce51ecff44d648f404ea216965dc6', '陇南市', 'longnanshi', 'lns', '620000', '621200', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df09dc9424e045128997a2f5b50ff3df', '西吉县', 'xijixian', 'xjx', '640400', '640422', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df190660b1cb4b1ca97088a5377e1a1c', '广平县', 'guangpingxian', 'gpx', '130400', '130432', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df2cf16ba4a148dfbf0140ff32f62705', '承德市', 'chengdeshi', 'cds', '130000', '130800', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df35773e1d2f4de2ad2505a2214e73f2', '山丹县', 'shandanxian', 'sdx', '620700', '620725', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df35caa2a3b64d60858f7f4383fdacc6', '新洲区', 'xinzhouqu', 'xzq', '420100', '420117', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df5bf1db89a143e9bc25be01acf01e9a', '费县', 'feixian', 'fx', '371300', '371325', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df67aafb3b60439abfefaf04c48f66bf', '苍山县', 'cangshanxian', 'csx', '371300', '371324', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df7ad4f82c4445b7bbdc2c726e279066', '上海市', 'shanghaishi', 'shs', '1', '310000', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df9a7ff968bb4ab885a979d63a0f9fec', '郸城县', 'danchengxian', 'dcx', '411600', '411625', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('df9f693b30214f5e9a693e07d2e8d726', '郴州市', 'chenzhoushi', 'czs', '430000', '431000', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfa4c1ac500f4f52b88f7d7a2aef79cd', '船山区', 'chuanshanqu', 'csq', '510900', '510903', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfa6568eefe1406a93c1304a06b3f2cc', '仁和区', 'renhequ', 'rhq', '510400', '510411', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfb28596880b471384ef4ae6334f8f27', '伊宁县', 'yiningxian', 'ynx', '654000', '654021', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfb6d2b8f0a849898c624ff1451b2424', '本溪市', 'benxishi', 'bxs', '210000', '210500', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfc7201fbead4f82ba4ccc005db6648e', '达县', 'daxian', 'dx', '511700', '511721', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfcef99f628546bbb0861e4acf329d9a', '井陉矿区', 'jingxingkuangqu', 'jxkq', '130100', '130107', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfec498ee03948c2ae60a5c63c96d436', '惠农区', 'huinongqu', 'hnq', '640200', '640205', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dff83bef0d154e7594e56c199b704bbc', '白玉县', 'baiyuxian', 'byx', '513300', '513331', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('dfff4db13fb5422db64d605b6e3085f9', '宏伟区', 'hongweiqu', 'hwq', '211000', '211004', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e025d9e544f741ebb704597c7ede3816', '点军区', 'dianjunqu', 'djq', '420500', '420504', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e074d0f0688b4d6dba6c0266cb40dfc8', '南县', 'nanxian', 'nx', '430900', '430921', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e07a6530f09a467995e485f991fc0672', '市辖区', 'shixiaqu', 'sxq', '510400', '510401', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e08a22758b944e628f8d3639a2c579b4', '广元市', 'guangyuanshi', 'gys', '510000', '510800', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e08f6ba34e1349dfab2991e96f808745', '路南区', 'lunanqu', 'lnq', '130200', '130202', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e0c18338b86945fea59ab4c1cf1838c6', '大祥区', 'daxiangqu', 'dxq', '430500', '430503', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e0cad8d9112440a497dd692ae9042f7b', '沙市区', 'shashiqu', 'ssq', '421000', '421002', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e0d4b4f1429f46eab1f7eb4b9809355d', '果洛藏族自治州', 'guoluocangzuzizhizhou', 'glczzzz', '630000', '632600', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e0e74eb03f7949f78d41170129b8a9c6', '青河县', 'qinghexian', 'qhx', '654300', '654325', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e0ec7f23d29d439aa7a8b2f33e3ea228', '茌平县', 'chipingxian', 'cpx', '371500', '371523', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e0ed7a403c654df7adeef34ac29b6fe7', '宣化县', 'xuanhuaxian', 'xhx', '130700', '130721', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1104525b8944543b139be76fe911c22', '新乐市', 'xinleshi', 'xls', '130100', '130184', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1236bbf159f4302baaeef0db44af9df', '合水县', 'heshuixian', 'hsx', '621000', '621024', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e12b5c1251114e97a1bc6f0e97650886', '从江县', 'congjiangxian', 'cjx', '522600', '522633', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e13471f5941643dbb45bf091fdfba5e7', '湖滨区', 'hubinqu', 'hbq', '411200', '411202', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e13778c4d84344d59b5d61846d2c4678', '大同区', 'datongqu', 'dtq', '230600', '230606', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e187df7bf8da4a1e80017903009ebbc3', '王益区', 'wangyiqu', 'wyq', '610200', '610202', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e18bce623c1448be94f580a67c5b24de', '凌云县', 'lingyunxian', 'lyx', '451000', '451027', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e193e97fbffb49a89be17be6dd8dd367', '阜阳市', 'fuyangshi', 'fys', '340000', '341200', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e194849e8fc34b528dddae2d9681ca46', '七里河区', 'qilihequ', 'qlhq', '620100', '620103', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1b73524d13547e9bc8a3343f2ffe011', '巨野县', 'juyexian', 'jyx', '371700', '371724', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1d1da0b66a64bc8adb38e2e1e46b165', '崇左市', 'chongzuoshi', 'czs', '450000', '451400', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1e49d5145e84895ae359e659d569c68', '市辖区', 'shixiaqu', 'sxq', '360400', '360401', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1e5a72d71534e1bbee33a1bb44548c6', '三亚市', 'sanyashi', 'sys', '460000', '460200', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1ea9cc7681c44f59599a88d1474e15f', '攀枝花市', 'panzhihuashi', 'pzhs', '510000', '510400', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e1efc57057f140a9aea60fc612098ef3', '惠安县', 'huianxian', 'hax', '350500', '350521', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e20cfb31e6ee4e67a301618dea2462c9', '兴安区', 'xinganqu', 'xaq', '230400', '230405', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e2175800bcec466f802626cf524c427c', '扎赉特旗', 'zalaiteqi', 'zltq', '152200', '152223', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e242555fa3bd4bd8b3d0f09a08db4c69', '红岗区', 'honggangqu', 'hgq', '230600', '230605', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e25ff960f3b644429695eeed04cde614', '怀集县', 'huaijixian', 'hjx', '441200', '441224', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e282879daa144370a54dbdd057d980db', '永泰县', 'yongtaixian', 'ytx', '350100', '350125', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e28bab487fb74bb29819a4af2a450bc5', '泸西县', 'luxixian', 'lxx', '532500', '532527', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e2bbc2ec442f4597b669df5e285f9e98', '新乡市', 'xinxiangshi', 'xxs', '410000', '410700', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e2bee0f9ed924e95b5ff9aa52d887192', '市辖区', 'shixiaqu', 'sxq', '620600', '620601', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e2c819c8561245da93b2cbcd60d17bb8', '湖北省', 'hubeisheng', 'hbs', '1', '420000', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e2cf42113992410c99245002697d14ee', '广丰县', 'guangfengxian', 'gfx', '361100', '361122', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e315755bea534c28ba996948bfd47340', '晋中市', 'jinzhongshi', 'jzs', '140000', '140700', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e3165b6129034ecfbc7652a23d057f48', '阳城县', 'yangchengxian', 'ycx', '140500', '140522', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e31a0b47cb0d460e84e08c6d05908ffd', '米东区', 'midongqu', 'mdq', '650100', '650109', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e324b526033d4052a8ce662aa2a262dc', '城中区', 'chengzhongqu', 'czq', '450200', '450202', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e324b963bf8a42c5906187120d2fede9', '下陆区', 'xialuqu', 'xlq', '420200', '420204', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e35b25e546c44d92a5d00c0c1be48d7a', '亭湖区', 'tinghuqu', 'thq', '320900', '320902', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e3d8fe59ad9443aca42dd9e4dcb94cf5', '市辖区', 'shixiaqu', 'sxq', '411700', '411701', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e3da630a90f54a36a4f55988d67661ee', '鱼台县', 'yutaixian', 'ytx', '370800', '370827', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e3e05fb45cf14d42a610e352bd567d58', '日土县', 'rituxian', 'rtx', '542500', '542524', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e3ec41a9d2c14e4f8d085444882da1f4', '安龙县', 'anlongxian', 'alx', '522300', '522328', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e3f54abc3949427ba8457220ced67c22', '盐都区', 'yandouqu', 'ydq', '320900', '320903', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e409e2a0438d4654926976a68377d104', '贡嘎县', 'gonggaxian', 'ggx', '542200', '542223', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e40ecf61171b4528a21c9d9cfc3bed65', '哈密地区', 'hamidiqu', 'hmdq', '650000', '652200', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e41420bd81a144d6a6ba105aee2515f7', '拉孜县', 'lazixian', 'lzx', '542300', '542326', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e4219d7dff8d4b168c1349a6ef7d3ce1', '辛集市', 'xinjishi', 'xjs', '130100', '130181', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e469d1ecabda4d989482d181c6ac664d', '绥芬河市', 'suifenheshi', 'sfhs', '231000', '231081', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e46db16ae8b34d3d8cac5aff5b564a0b', '九龙县', 'jiulongxian', 'jlx', '513300', '513324', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e4867538343d43bdbaed2f9010cf280f', '桃源县', 'taoyuanxian', 'tyx', '430700', '430725', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e496d22fc2ab47e3977520d8d9c47069', '南皮县', 'nanpixian', 'npx', '130900', '130927', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e4ab1f8e46e145e9a935af8f77017cb0', '灵石县', 'lingshixian', 'lsx', '140700', '140729', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e4c92788c188419ea045b93591378636', '离石区', 'lishiqu', 'lsq', '141100', '141102', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e4d34d3df32a4c4c89d031629e26f4e5', '民丰县', 'minfengxian', 'mfx', '653200', '653227', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e4f464ac1492429e934a8746fe0020b3', '西夏区', 'xixiaqu', 'xxq', '640100', '640105', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e4f4fd43d6ee4ffda050743cab2d456b', '资阳市', 'ziyangshi', 'zys', '510000', '512000', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e52f26e8a5084ffca0036aecf2adb3a8', '和林格尔县', 'helingeerxian', 'hlgex', '150100', '150123', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e541dfaf3d7d4f5497bad821f4e46c1e', '玉树县', 'yushuxian', 'ysx', '632700', '632721', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e54b8716987b487db44e0d503fbe1a4e', '资中县', 'zizhongxian', 'zzx', '511000', '511025', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e55e6024aee94ee78b371fad95adf2d9', '隆回县', 'longhuixian', 'lhx', '430500', '430524', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e56d9a7e26084c509ad7e72605873f79', '屯溪区', 'tunxiqu', 'txq', '341000', '341002', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e592607ff6ce4003b0428f8d62fdf5bd', '兰考县', 'lankaoxian', 'lkx', '410200', '410225', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e59c05d72a224515bd460cb83f2c13c4', '源汇区', 'yuanhuiqu', 'yhq', '411100', '411102', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e59e980674f64f4fa37795128e97968f', '涞源县', 'laiyuanxian', 'lyx', '130600', '130630', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e59fbef6f7104498bed2dab915d95d42', '市辖区', 'shixiaqu', 'sxq', '420500', '420501', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e5b272453b644af4856c0de195057658', '芜湖市', 'wuhushi', 'whs', '340000', '340200', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e5e19ebfe92d43f193ba9df7b345aaa6', '昌乐县', 'changlexian', 'clx', '370700', '370725', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e5f4710dead14ab4bc20540c77670554', '锦州市', 'jinzhoushi', 'jzs', '210000', '210700', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e60b99ba09a6480d8f72006cd4b0272d', '潮阳区', 'chaoyangqu', 'cyq', '440500', '440513', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e61ffea9126849df9291752feb74b065', '昌黎县', 'changlixian', 'clx', '130300', '130322', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e63777c4a40b4805ae92c77ef3142d37', '胶州市', 'jiaozhoushi', 'jzs', '370200', '370281', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e641000e2f834e90bd1eb8b95da8ce81', '市辖区', 'shixiaqu', 'sxq', '210100', '210101', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e64d7c97cc494673b7af2f36d4b12815', '兴国县', 'xingguoxian', 'xgx', '360700', '360732', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e689ddacf64b4c6d8017f452ad540d9a', '吉水县', 'jishuixian', 'jsx', '360800', '360822', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e6bcb85970fb48d1bf2fdb7ff20fd739', '市辖区', 'shixiaqu', 'sxq', '370100', '370101', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e6c412ce96b94c969ae5aba165c80daf', '天桥区', 'tianqiaoqu', 'tqq', '370100', '370105', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e6d746ee7b574142b8c3738a8a66bfe5', '麻栗坡县', 'malipoxian', 'mlpx', '532600', '532624', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e6d8e50a1a7f41b3829140a2feda7d2b', '市辖区', 'shixiaqu', 'sxq', '330900', '330901', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e6e341b3821e4ae9a3c6105cac6b7a8e', '黄骅市', 'huanghuashi', 'hhs', '130900', '130983', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e6e8d54faaf143abbf7c2c5f622b4520', '宕昌县', 'dangchangxian', 'dcx', '621200', '621223', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e714057fa20742ebbb12fcb61a62dc82', '定襄县', 'dingxiangxian', 'dxx', '140900', '140921', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e71c5917defd4fafb70ffe8bf853a1cf', '石阡县', 'shiqianxian', 'sqx', '522200', '522224', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e724c6c3b5eb48b486753968dca634b8', '清河区', 'qinghequ', 'qhq', '320800', '320802', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e72d764195ed47068e3cc2c1ee91698d', '贵溪市', 'guixishi', 'gxs', '360600', '360681', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7499546413c47a9aae873f90187a527', '彭山县', 'pengshanxian', 'psx', '511400', '511422', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e76b56308fb74060aeae4954c455223b', '项城市', 'xiangchengshi', 'xcs', '411600', '411681', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7715e547f714421b01a7e23e8786c7b', '景洪市', 'jinghongshi', 'jhs', '532800', '532801', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7862ab1d9b14a8a88aa74557008cb74', '南川区', 'nanchuanqu', 'ncq', '500100', '500119', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e79657a469114c9c83894268ccd2f50b', '枞阳县', 'zongyangxian', 'zyx', '340800', '340823', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e79d1a7ac75e4bc98b7c2dad066e96e8', '二道江区', 'erdaojiangqu', 'edjq', '220500', '220503', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7b48b75b3a849a485f81c7fa513ed96', '金阊区', 'jinchangqu', 'jcq', '320500', '320504', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7b6197113094b679e1c13e23c26d4e3', '容县', 'rongxian', 'rx', '450900', '450921', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7bba93f9e9b462bba65f5de832b05d3', '眉山市', 'meishanshi', 'mss', '510000', '511400', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7c5c3d08df04006bc21f7f3ce725dc4', '淇县', 'qixian', 'qx', '410600', '410622', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e7e78dc69d6047b6a954855aa09c42f1', '白塔区', 'baitaqu', 'btq', '211000', '211002', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e802368eff834d70aabe4499accc89c1', '加格达奇区', 'jiagedaqiqu', 'jgdqq', '232700', '232701', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e8357420f14441c5bd0172ece4035367', '铁锋区', 'tiefengqu', 'tfq', '230200', '230204', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e86b4c8bc7af449eabf0549f793d59b6', '市辖区', 'shixiaqu', 'sxq', '450800', '450801', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e87533b013c844efbce231c6b34e85a2', '义马市', 'yimashi', 'yms', '411200', '411281', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e889a43825a145efbc24b38dfe02c53c', '平乐县', 'pinglexian', 'plx', '450300', '450330', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e899c00b886c45b9af89101c5c7d9b2b', '武隆县', 'wulongxian', 'wlx', '500200', '500232', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e8b4ed1bfada4287b99313d149d93f7f', '城厢区', 'chengxiangqu', 'cxq', '350300', '350302', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e8cfd9b6bf0b47768f78a0536f0535be', '滴道区', 'didaoqu', 'ddq', '230300', '230304', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e8d1beb0fbd04ea8aee90c6862e621db', '乌马河区', 'wumahequ', 'wmhq', '230700', '230711', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e8d906b2027b4f1b8d597838bbfbaafa', '沈北新区', 'shenbeixinqu', 'sbxq', '210100', '210113', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e8e13a5b70664b95aebac665efedeaaf', '金湖县', 'jinhuxian', 'jhx', '320800', '320831', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9035d4a67e049af9329e261a840f33b', '市中区', 'shizhongqu', 'szq', '370100', '370101', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e90a8783940845fa9d932b1e4f683469', '市辖区', 'shixiaqu', 'sxq', '140100', '140101', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e90dc4a86a1c43689940066d8cab077c', '蒲县', 'puxian', 'px', '141000', '141033', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9189fcd28254339956c481ed9a1b08f', '盐边县', 'yanbianxian', 'ybx', '510400', '510422', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e91d5db43f6d4149a4d0a5f5d96b4297', '金台区', 'jintaiqu', 'jtq', '610300', '610303', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e931a69451bf4b08921978b076081664', '海安县', 'haianxian', 'hax', '320600', '320621', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9365e89974d4b0f8c5df5bb673a734f', '犍为县', 'jianweixian', 'jwx', '511100', '511123', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e94c922e8a7b43f19247088fc1b06472', '南漳县', 'nanzhangxian', 'nzx', '420600', '420624', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9adbf6cdbf94321912b0b0eae021ff8', '南岗区', 'nangangqu', 'ngq', '230100', '230103', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9b0d4ddd56149b9898cde28fe8020b1', '乌拉特前旗', 'wulateqianqi', 'wltqq', '150800', '150823', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9c1ec4b094843b1bc5196947297de09', '市辖区', 'shixiaqu', 'sxq', '520300', '520301', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9ca4377221444959bf8d1424cd3b5f3', '温宿县', 'wensuxian', 'wsx', '652900', '652922', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('e9e9a34781c2413ab840d3ba4b548e18', '乐山市', 'leshanshi', 'lss', '510000', '511100', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea1a8050bd3e46f9a50fd346afffe12e', '和平县', 'hepingxian', 'hpx', '441600', '441624', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea2ae6983f464f10a18cea75c631f7bc', '桃江县', 'taojiangxian', 'tjx', '430900', '430922', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea322582fffe45c190f337ecaad94e95', '磴口县', 'dengkouxian', 'dkx', '150800', '150822', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea32a0387e1747c68f06b9f1d0a828af', '宾阳县', 'binyangxian', 'byx', '450100', '450126', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea64409f43624ea398b95d49944cbbc0', '桥东区', 'qiaodongqu', 'qdq', '130700', '130702', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea6aa6cdc17847cc8f9f7afcb45b4acc', '柳林县', 'liulinxian', 'llx', '141100', '141125', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea6e3bffb0f0461687ffba3859a65ea5', '蒙自市', 'mengzishi', 'mzs', '532500', '532503', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ea9b199a970f4148a7c8b517c6a5c2be', '新化县', 'xinhuaxian', 'xhx', '431300', '431322', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eab05c8c74a3419ea3ba074034689701', '翁源县', 'wengyuanxian', 'wyx', '440200', '440229', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eab19a878ae84c6484779bf8f1755370', '延平区', 'yanpingqu', 'ypq', '350700', '350702', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eaef32ca90234a73b8c68f26f2ea9260', '梅河口市', 'meihekoushi', 'mhks', '220500', '220581', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eaf180e85f844c048f7aa7d679db2df6', '东洲区', 'dongzhouqu', 'dzq', '210400', '210403', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb0bb893faa64ae8a494b837d8566e39', '凤县', 'fengxian', 'fx', '610300', '610330', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb1e7c629a0b415b846797bbd024dd02', '东区', 'dongqu', 'dq', '510400', '510402', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb3c0148a4b14e52a205a2e0036c822b', '市辖区', 'shixiaqu', 'sxq', '511900', '511901', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb6b8f914b724d4bb72d9c05ebda1fd7', '慈利县', 'cilixian', 'clx', '430800', '430821', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb76bf22fbfa4831a9bbf22e4a1b7505', '甘孜藏族自治州', 'ganzicangzuzizhizhou', 'gzczzzz', '510000', '513300', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb86724d096f4673be5808d4becfab3a', '市辖区', 'shixiaqu', 'sxq', '340600', '340601', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb89ce363f8d4e89a517796bd2126bfe', '南充市', 'nanchongshi', 'ncs', '510000', '511300', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eb93b79ae4ad4bada52c6c9307e70969', '茂县', 'maoxian', 'mx', '513200', '513223', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebaaf00a203a4e99a35c0bae29f78b25', '市辖区', 'shixiaqu', 'sxq', '451200', '451201', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebad3d0ff5334e5b810aadbc01da6fb4', '社旗县', 'sheqixian', 'sqx', '411300', '411327', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebb56cc901784a3488bb02d550c3ef32', '南京市', 'nanjingshi', 'njs', '320000', '320100', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebb9a2e2b9494b2a9463d2792b666f3c', '玛沁县', 'maqinxian', 'mqx', '632600', '632621', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebbe6a2ce98f435bbc2994896f8330d6', '肇庆市', 'zhaoqingshi', 'zqs', '440000', '441200', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebc14b5b352b48908890317145999ef9', '浦东新区', 'pudongxinqu', 'pdxq', '310100', '310115', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebc547aefc304ff6a5b16b2cd3c2cb61', '昆山市', 'kunshanshi', 'kss', '320500', '320583', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ebcecd75a72544bb845209102022be63', '凌海市', 'linghaishi', 'lhs', '210700', '210781', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ec1f8c89d8534bb98d8343bd213da9ec', '共青城市', 'gongqingchengshi', 'gqcs', '360400', '360482', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ec2ac54be880419390760ac71095ba65', '尉犁县', 'yulixian', 'ylx', '652800', '652823', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ec313482a06b4fe58b816ee5d1f1b733', '弋阳县', 'yiyangxian', 'yyx', '361100', '361126', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ec6918dd88d2412fa28ff53e26351124', '开封市', 'kaifengshi', 'kfs', '410000', '410200', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ec9f72b6a875422691ab05af430b50d6', '市辖区', 'shixiaqu', 'sxq', '511600', '511601', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ecac91a17d4e4e15b65efd3d35f63006', '天长市', 'tianchangshi', 'tcs', '341100', '341181', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ecb4ac709d86436e81eb4b7bf96a1041', '城中区', 'chengzhongqu', 'czq', '630100', '630103', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ecc2e96580524e7aad3846fcc04006c8', '响水县', 'xiangshuixian', 'xsx', '320900', '320921', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ecc49a9b859a4a799cfbccd177936314', '鄂温克族自治旗', 'ewenkezuzizhiqi', 'ewkzzzq', '150700', '150724', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ed1887dc6f0b4aa5be3e555a5c329ab4', '房山区', 'fangshanqu', 'fsq', '110100', '110111', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ed6c39081a81439da835a92fa85d89ae', '武平县', 'wupingxian', 'wpx', '350800', '350824', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ed7c66dbb5534580b66a263bc807239b', '公安县', 'gonganxian', 'gax', '421000', '421022', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ed7ecf28ed7f477d985b003de507ea85', '玛多县', 'maduoxian', 'mdx', '632600', '632626', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ed906a32551b49108f79d26bfed45d39', '龙沙区', 'longshaqu', 'lsq', '230200', '230202', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('edb746da2ed24ac893caa496694431b8', '江口县', 'jiangkouxian', 'jkx', '522200', '522222', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('edc67d4467b74d539b0bc33a6304af81', '潜山县', 'qianshanxian', 'qsx', '340800', '340824', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('edca2b11a08645cc98d3dcadea11d263', '石嘴山市', 'shizuishanshi', 'szss', '640000', '640200', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('edd3c10873b842e8a18da733ffdd2bc7', '市辖区', 'shixiaqu', 'sxq', '410400', '410401', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ede0be6a34594a6591e1b38bad6a0884', '龙南县', 'longnanxian', 'lnx', '360700', '360727', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('edece1837bb94ba08feaf27781d19b85', '内丘县', 'neiqiuxian', 'nqx', '130500', '130523', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee19569f0b854131a7fc4c874289fd61', '寒亭区', 'hantingqu', 'htq', '370700', '370703', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee1c7f686a1a4b6eaf94a318df5df409', '市辖区', 'shixiaqu', 'sxq', '620100', '620101', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee2c415fd89d429b80bc0c219433315b', '东光县', 'dongguangxian', 'dgx', '130900', '130923', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee3b7eb3c1ab4d7ea551c12f04da9aeb', '杞县', 'qixian', 'qx', '410200', '410221', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee41b8f2423b4ce9b840606d6a52b657', '平阴县', 'pingyinxian', 'pyx', '370100', '370124', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee495505c5914b14bf86a9caefc503c4', '独山县', 'dushanxian', 'dsx', '522700', '522726', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee4d6ba9f74d47c1b7f309243a4600c3', '西区', 'xiqu', 'xq', '510400', '510403', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee5aad5d99c04f47a8713ee8c839387a', '沛县', 'peixian', 'px', '320300', '320322', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee64ba21985c4166994f645ff3b6d78e', '忻城县', 'xinchengxian', 'xcx', '451300', '451321', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee6894551df34d17bc0effec10980a59', '灌南县', 'guannanxian', 'gnx', '320700', '320724', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee70f9dccfbe4e17bb7b90f63e2c6330', '海东地区', 'haidongdiqu', 'hddq', '630000', '632100', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee722e56c73040d88136a85acc74fdb1', '淳安县', 'chunanxian', 'cax', '330100', '330127', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee7d932d64a44533864fa17974307b97', '宜秀区', 'yixiuqu', 'yxq', '340800', '340811', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ee9f9cff4bc24d44a1af6d411bf5bef5', '马尾区', 'maweiqu', 'mwq', '350100', '350105', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eeaf1a9b977948c2ba91888035cc902d', '清丰县', 'qingfengxian', 'qfx', '410900', '410922', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eec2291f7bce45898cb055359711c2f0', '桐乡市', 'tongxiangshi', 'txs', '330400', '330483', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eec2d49fc8454c9584a20da2e06a7b97', '市辖区', 'shixiaqu', 'sxq', '530500', '530501', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eecaa9e6834442e49c5e308ee8b7eca5', '会理县', 'huilixian', 'hlx', '513400', '513425', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eecb0bcc45124d589e321d3ec195f145', '黔西县', 'qianxixian', 'qxx', '522400', '522423', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eef1762a8e1648cc922799796e7a6b96', '靖西县', 'jingxixian', 'jxx', '451000', '451025', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ef5411a10ff849fd94f058e5b64a5bac', '佳木斯市', 'jiamusishi', 'jmss', '230000', '230800', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ef664c61af62472ea950e2d5b535be21', '云城区', 'yunchengqu', 'ycq', '445300', '445302', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ef8e3c8ce8d842d2adda949774bee869', '镶黄旗', 'xianghuangqi', 'xhq', '152500', '152528', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ef9cb59ee35c49dfb0017f37d3078fc4', '池州市', 'chizhoushi', 'czs', '340000', '341700', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('eff8e368c1ab45f39aa367a1cd11e4bc', '海丰县', 'haifengxian', 'hfx', '441500', '441521', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f0298cbd4dd34a1185a99b1184e98ef9', '睢县', 'huixian', 'hx', '411400', '411422', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f04407b78a384b0fb49d199e6181683e', '汉川市', 'hanchuanshi', 'hcs', '420900', '420984', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f04e4c5f95c64357aeb30b93a3637d66', '远安县', 'yuananxian', 'yax', '420500', '420525', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f055920c634c463aaf50047d6fc9d797', '夏邑县', 'xiayixian', 'xyx', '411400', '411426', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f096517471b445808a0393c5e7d37e33', '道孚县', 'daofuxian', 'dfx', '513300', '513326', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f09b81fa3d50480b8c25be9014313029', '萝北县', 'luobeixian', 'lbx', '230400', '230421', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f0a6ac12d552425eb4020d3c0d43240d', '昭觉县', 'zhaojuexian', 'zjx', '513400', '513431', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f0aa17516e2d49d49ec5bc8f8fd9ce9c', '邵武市', 'shaowushi', 'sws', '350700', '350781', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f0cd1dd662044b6cbc844295dd9a67ed', '贵德县', 'guidexian', 'gdx', '632500', '632523', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f0cf12e8dfa14042827545d299c462e4', '绍兴县', 'shaoxingxian', 'sxx', '330600', '330621', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f0fc9987d5694f9e99510c13bafeaf19', '江阴市', 'jiangyinshi', 'jys', '320200', '320281', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f108d4d16a8c4e02a227cceac216942b', '成县', 'chengxian', 'cx', '621200', '621221', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f108f62eda1b483eb09e0a53fd5b6e31', '弥渡县', 'miduxian', 'mdx', '532900', '532925', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1213c2a76c74afc974eebf0a54c42f9', '广饶县', 'guangraoxian', 'grx', '370500', '370523', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1622fb4f87c46be90f7af238396510a', '临翔区', 'linxiangqu', 'lxq', '530900', '530902', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1776689dbec419b86cba1bb7532cd7c', '谷城县', 'guchengxian', 'gcx', '420600', '420625', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1795aec56be4438b5abeb0cc81794bd', '西峰区', 'xifengqu', 'xfq', '621000', '621002', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f17ef402f82341e3888d1d354b0be794', '铁山区', 'tieshanqu', 'tsq', '420200', '420205', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f18658528f7446a9a6deeb68ac1f4bd5', '贡井区', 'gongjingqu', 'gjq', '510300', '510303', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f18aeb83021441fab4ffb6aaf5f73877', '北塘区', 'beitangqu', 'btq', '320200', '320204', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f19be7500799470d8c8b6b0cb5265d35', '商城县', 'shangchengxian', 'scx', '411500', '411524', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1a306650fb0416293fe007c7dbc548e', '市辖区', 'shixiaqu', 'sxq', '130900', '130901', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1af9402f4024f3abf64e8e4d3bf5be0', '安康市', 'ankangshi', 'aks', '610000', '610900', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1ca361e4c174988b6321dc2d4d7d7ed', '儋州市', 'danzhoushi', 'dzs', '469000', '469003', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1cdaffda48d47e787c9b52f8a2c8e6b', '息县', 'xixian', 'xx', '411500', '411528', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1d1ea44634b47f0acd43e69f12bc3d3', '舟山市', 'zhoushanshi', 'zss', '330000', '330900', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f1f85f7e91e241619d43f9531d5ecb12', '旌德县', 'jingdexian', 'jdx', '341800', '341825', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f20403f7441f4e3488d9b06bde567a8e', '湘东区', 'xiangdongqu', 'xdq', '360300', '360313', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f218ca7924ec489c8e393bc3385105d9', '南丹县', 'nandanxian', 'ndx', '451200', '451221', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f22c5b48f1f3441b90b6767f2261de68', '诸城市', 'zhuchengshi', 'zcs', '370700', '370782', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f234334b2efa45afb0e026cb09f7d00c', '市辖区', 'shixiaqu', 'sxq', '360200', '360201', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f2416f11adf64d9cbeffbeca04785e76', '昔阳县', 'xiyangxian', 'xyx', '140700', '140724', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f250deccf1294cffb633b55d577313a3', '横山县', 'hengshanxian', 'hsx', '610800', '610823', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f26cafcd432d4b0ebb4a9282c69096db', '肇州县', 'zhaozhouxian', 'zzx', '230600', '230621', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f291a54ea3a24dafa28b43707eccee4d', '开福区', 'kaifuqu', 'kfq', '430100', '430105', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f29436a009f24b6883129b619b8517e0', '比如县', 'biruxian', 'brx', '542400', '542423', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f29f22efb81040108e80ff62da8baba2', '五常市', 'wuchangshi', 'wcs', '230100', '230184', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f2e8b70b4ffe4e9fa3ddd9267b004818', '原州区', 'yuanzhouqu', 'yzq', '640400', '640402', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f2ec0da39e2746799e772e207250df4d', '莒县', 'juxian', 'jx', '371100', '371122', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f308c682b8d847b299671c49a47ca18f', '阳新县', 'yangxinxian', 'yxx', '420200', '420222', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f314185a304342e88cc04ca6ee10402a', '聂荣县', 'nierongxian', 'nrx', '542400', '542424', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3169916baef465b8698a649427f53ef', '宽城区', 'kuanchengqu', 'kcq', '220100', '220103', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3339d48de9b42fd8251be6a1adc180f', '青铜峡市', 'qingtongxiashi', 'qtxs', '640300', '640381', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3450c28a12047e4951fd17d294cc430', '普洱市', 'puershi', 'pes', '530000', '530800', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3472e3b2ffe4d909cbd9d5379bd9c6a', '安宁区', 'anningqu', 'anq', '620100', '620105', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3960eb4fa7e4531a5d9d6a6025fee39', '青海省', 'qinghaisheng', 'qhs', '1', '630000', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3b444b238e142378665d07841a72cad', '京山县', 'jingshanxian', 'jsx', '420800', '420821', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3bc834130a0489baba7cf156fadee5f', '龙泉驿区', 'longquanyiqu', 'lqyq', '510100', '510112', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3bf7032feb44c5bb4ffaccbd241bf3f', '百色市', 'baiseshi', 'bss', '450000', '451000', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3dfbb0c03804d61af8a21e9a98d1dc2', '错那县', 'cuonaxian', 'cnx', '542200', '542232', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f3e695af98d24507a2f469fc16744438', '武功县', 'wugongxian', 'wgx', '610400', '610431', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f4270704644a437e9fe49ad75bd27585', '永胜县', 'yongshengxian', 'ysx', '530700', '530722', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f45da83e6ee549ef9aec670230fd8207', '鄄城县', 'juanchengxian', 'jcx', '371700', '371726', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f46303928c174e05b0ddf4b82fb7830c', '温泉县', 'wenquanxian', 'wqx', '652700', '652723', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f46702012405430096f908b9adf7efe3', '市辖区', 'shixiaqu', 'sxq', '230300', '230301', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f467218a731c449792dd17641fd519fb', '梅州市', 'meizhoushi', 'mzs', '440000', '441400', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f46aaffd9dde42868cce080ac12015aa', '开平市', 'kaipingshi', 'kps', '440700', '440783', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f485709a191744aba2b9eec5001b5ae0', '鹿邑县', 'luyixian', 'lyx', '411600', '411628', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f492f6fc7fb54132b8acd305afc1a897', '逊克县', 'xunkexian', 'xkx', '231100', '231123', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f497f4a616e34855a1f7daf5d3accbc2', '鹿城区', 'luchengqu', 'lcq', '330300', '330302', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f4a14071fcd64b26a2352fbbd4610657', '甘州区', 'ganzhouqu', 'gzq', '620700', '620702', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f4de03062c114d5abaff95978982c4f2', '城步苗族自治县', 'chengbumiaozuzizhixian', 'cbmzzzx', '430500', '430529', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f4ea841fdadb45cfbf41d550b2007022', '天台县', 'tiantaixian', 'ttx', '331000', '331023', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f559f20297ef4c71aaf5353d47c6ff7d', '松江区', 'songjiangqu', 'sjq', '310100', '310117', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f567454051df48349caa89b8fd98cf7a', '桥西区', 'qiaoxiqu', 'qxq', '130100', '130104', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5836e48f1ec4e72b18d3aef394584a1', '乌苏市', 'wusushi', 'wss', '654200', '654202', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5874f7b2e07436f86cf18a0617813fd', '常宁市', 'changningshi', 'cns', '430400', '430482', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f59ca79abc5042f9888059915d5615f3', '万荣县', 'wanrongxian', 'wrx', '140800', '140822', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5ace199d8474004aef91c6c48fba645', '美兰区', 'meilanqu', 'mlq', '460100', '460108', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5bf9a6196f94bf188be7369ddb18a57', '麻山区', 'mashanqu', 'msq', '230300', '230307', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5d42df88438488bb31e4b84f0cbf02e', '官渡区', 'guanduqu', 'gdq', '530100', '530111', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5ebe49ebf7d44e99276a30a0f6cb7eb', '汕尾市', 'shanweishi', 'sws', '440000', '441500', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5ec207f74e9401aa75160661c33dd81', '淮上区', 'huaishangqu', 'hsq', '340300', '340311', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5ec30936f4f488ba0a5b4098ca29e7c', '宁蒗彝族自治县', 'ninglangyizuzizhixian', 'nlyzzzx', '530700', '530724', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f5f0766cfd0b4659b2bdf41df296d850', '资溪县', 'zixixian', 'zxx', '361000', '361028', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f60233d1e1474770b7243f33dbdeb635', '廊坊市', 'langfangshi', 'lfs', '130000', '131000', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f660bfd6f98843448cc9078cd4df2606', '永靖县', 'yongjingxian', 'yjx', '622900', '622923', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f66115154e0541d692a9685f7e568b7d', '湘乡市', 'xiangxiangshi', 'xxs', '430300', '430381', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f6747dc4966c4af6aeebe731349f6feb', '安徽省', 'anhuisheng', 'ahs', '1', '340000', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f67a96628e8d4df580ef7f47f4b46cb2', '市辖区', 'shixiaqu', 'sxq', '330100', '330101', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f68593e10ed348108fd0c7e348917a40', '云和县', 'yunhexian', 'yhx', '331100', '331125', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f68d3eea454f4a7a84b0f84926ab1a4e', '青山区', 'qingshanqu', 'qsq', '150200', '150204', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f69d409777a54ffc903f64e88829ac63', '漳县', 'zhangxian', 'zx', '621100', '621125', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f6af2d926db248f18285d9159e3b5b44', '闸北区', 'zhabeiqu', 'zbq', '310100', '310108', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f6b0933ac1c84e119b087807843b0255', '思明区', 'simingqu', 'smq', '350200', '350203', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f6ce45546f8d4dc7a98a7b94118ddaf5', '融水苗族自治县', 'rongshuimiaozuzizhixian', 'rsmzzzx', '450200', '450225', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f6f65659e6204de19143d1442e927474', '台前县', 'taiqianxian', 'tqx', '410900', '410927', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f72649d66fc24dbb9dd7b27b1a578461', '绥宁县', 'suiningxian', 'snx', '430500', '430527', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f72bba6e8010464bb73f26b363caa0c8', '微山县', 'weishanxian', 'wsx', '370800', '370826', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7339528e7b546ac92472db16658ae60', '台安县', 'taianxian', 'tax', '210300', '210321', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f75d827d6c4c4427a70bd712e08d2b43', '长安区', 'changanqu', 'caq', '610100', '610116', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f76c60414ca44cb683d5f60e87730c19', '红古区', 'hongguqu', 'hgq', '620100', '620111', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7c9eaf5e7c141aab932a994902a68d6', '肃州区', 'suzhouqu', 'szq', '620900', '620902', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7dfaaf998274d83ba4ae878eb30a80d', '彭州市', 'pengzhoushi', 'pzs', '510100', '510182', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7e7e2c3c4b54b14b4f983f40be4a369', '祁县', 'qixian', 'qx', '140700', '140727', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7ef93ed81594c11acd8ae35f5d3fb22', '库车县', 'kuchexian', 'kcx', '652900', '652923', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7f0e3de5f164000b28e0907d1cfd76f', '天山区', 'tianshanqu', 'tsq', '650100', '650102', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7f44fec1b174a918652d5ba0f8c2d64', '市辖区', 'shixiaqu', 'sxq', '620300', '620301', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f7fb7fb95fcc4ae8a123e0d7b6cc0e54', '茶陵县', 'chalingxian', 'clx', '430200', '430224', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f80472b32d514e7092552f68a1371775', '白云鄂博矿区', 'baiyunebokuangqu', 'byebkq', '150200', '150206', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f82a62d885ff45168df54d55b3d68f2a', '随州市', 'suizhoushi', 'szs', '420000', '421300', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f86754e306e343ab9bad3386237e9f29', '黔江区', 'qianjiangqu', 'qjq', '500100', '500114', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f88a4b87a53a4b8787d5b1fc08bc02d9', '神池县', 'shenchixian', 'scx', '140900', '140927', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f8af3eb190444213b7f6447e5fd6293a', '黄石港区', 'huangshigangqu', 'hsgq', '420200', '420202', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f8ce4202f7f84ceaace0fe03b9409478', '缙云县', 'jinyunxian', 'jyx', '331100', '331122', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f8f290c13f1b4b6ebac530c39901a9e0', '江洲区', 'jiangzhouqu', 'jzq', '451400', '451402', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f8f41fd328e54d0caf43d7c62fb3bc63', '宣化区', 'xuanhuaqu', 'xhq', '130700', '130705', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9026cb178fd4f9a84c91246ab19703c', '巨鹿县', 'juluxian', 'jlx', '130500', '130529', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f932581ee76b48a9aee146fb93a67013', '鹰手营子矿区', 'yingshouyingzikuangqu', 'ysyzkq', '130800', '130804', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f94b0598e81f4d56acf4bdb2689f55af', '留坝县', 'liubaxian', 'lbx', '610700', '610729', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f957ac8ac94647308b20da66596247be', '龙江县', 'longjiangxian', 'ljx', '230200', '230221', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9664e12d39440fc8c11529909dc97c3', '柳州市', 'liuzhoushi', 'lzs', '450000', '450200', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f96aff9d47b24d1eb23ab8dc8261699f', '海西蒙古族藏族自治州', 'haiximengguzucangzuzizhizhou', 'hxmgzczzzz', '630000', '632800', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f96f6e94fa1a43f887054573104c1e72', '浠水县', 'xishuixian', 'xsx', '421100', '421125', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9b2fa1cb28f4a5586158df365fab761', '临武县', 'linwuxian', 'lwx', '431000', '431025', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9bace94968b4b98827bcd35d1ec5047', '黄埔区', 'huangpuqu', 'hpq', '440100', '440112', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9bcfe71f68a496a9408e0b1f6e5d5e4', '乌兰浩特市', 'wulanhaoteshi', 'wlhts', '152200', '152201', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9ccb4f186b740658fdf9cead62666ae', '禹州市', 'yuzhoushi', 'yzs', '411000', '411081', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9cf4c4aea634908a6cfd08e967d6fd8', '汪清县', 'wangqingxian', 'wqx', '222400', '222424', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9de3b6507a84849941426382f70c914', '德令哈市', 'delinghashi', 'dlhs', '632800', '632802', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9e6a15487ef4a0d846867194586af8c', '红河县', 'honghexian', 'hhx', '532500', '532529', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('f9eda56f81854f43a74f6044337ebf74', '中阳县', 'zhongyangxian', 'zyx', '141100', '141129', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa0ade1342c94fe39c6c03630bc6ea7d', '邢台县', 'xingtaixian', 'xtx', '130500', '130521', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa1c04a76c974a9f8ec6d43d0a270b9d', '东方市', 'dongfangshi', 'dfs', '469000', '469007', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa2ad857fee549cdab8922a8091fc33e', '武清区', 'wuqingqu', 'wqq', '120100', '120114', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa4633a1e5b2414fba6e85a50adf622f', '兴宁市', 'xingningshi', 'xns', '441400', '441481', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa4efeb5994e475daa1d00d2fcb6c533', '丰顺县', 'fengshunxian', 'fsx', '441400', '441423', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa5416288a4a43c787c3a3f83ae16353', '江陵县', 'jianglingxian', 'jlx', '421000', '421024', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa5c5e8c718043b0896ff723e3dfcf64', '桥东区', 'qiaodongqu', 'qdq', '130100', '130103', '2018-03-30 18:06:48', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa6d9f4cac754bb88b76fd6238277fcc', '钦南区', 'qinnanqu', 'qnq', '450700', '450702', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa725fed7ebf4b06a299b94cfa7f11e0', '茄子河区', 'qiezihequ', 'qzhq', '230900', '230904', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fa76421d94f44696834bb4a4931e8866', '宿州市', 'suzhoushi', 'szs', '340000', '341300', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fab429a0f553468dadac1d3aae910976', '海盐县', 'haiyanxian', 'hyx', '330400', '330424', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fadc5922d7214fe99b15f25f6fa3e176', '介休市', 'jiexiushi', 'jxs', '140700', '140781', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb13e2e4a0c04069a5f931268bd51926', '襄樊市', 'xiangfanshi', 'xfs', '420000', '420600', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb14fe253189437b86d891385762b310', '龙里县', 'longlixian', 'llx', '522700', '522730', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb302ea682a54ddcb4f076e550933e7b', '达孜县', 'dazixian', 'dzx', '540100', '540126', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb32c61604bc4a0dbc1dd04123f50c0a', '市辖区', 'shixiaqu', 'sxq', '510300', '510301', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb34d4e2a35344308945e604f531c345', '巫山县', 'wushanxian', 'wsx', '500200', '500237', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb362ee486a04c3785ee1ea060f1e5b0', '西乌珠穆沁旗', 'xiwuzhumuqinqi', 'xwzmqq', '152500', '152526', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb3eee4aedde49a78de547daf4dcf66f', '德兴市', 'dexingshi', 'dxs', '361100', '361181', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb41580f57eb40a79128b5ef94bd5983', '乐安县', 'leanxian', 'lax', '361000', '361025', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb851d6cb4e1490a8f3e539b662592c9', '依兰县', 'yilanxian', 'ylx', '230100', '230123', '2018-03-30 18:06:52', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fb866cc2608246a58d45919c9935820e', '寻甸回族彝族自治县', 'xundianhuizuyizuzizhixian', 'xdhzyzzzx', '530100', '530129', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fba9aa09ad1648b3b5d1d0e2bb17f526', '红塔区', 'hongtaqu', 'htq', '530400', '530402', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fbbc18b37ecb4a8a8edd99b46dffe812', '开平区', 'kaipingqu', 'kpq', '130200', '130205', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fbd1c19812fc4d76951ab1ec353316e3', '醴陵市', 'lilingshi', 'lls', '430200', '430281', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fc3fe182557b454280073de5876f5fe0', '市辖区', 'shixiaqu', 'sxq', '411200', '411201', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fc62e8a6375f4f82acbad733362b2fb1', '高唐县', 'gaotangxian', 'gtx', '371500', '371526', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fc7ef9dd535e44b9a9ae25fcea4f42ec', '台江县', 'taijiangxian', 'tjx', '522600', '522630', '2018-03-30 18:07:01', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fc82ffb1cac6464bb7cfb2694a086709', '乌鲁木齐市', 'wulumuqishi', 'wlmqs', '650000', '650100', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fc8f2db1581d4f2c8b8effd8612fc08c', '营山县', 'yingshanxian', 'ysx', '511300', '511322', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fcda4e12b68241c5991c248d063786a1', '镇巴县', 'zhenbaxian', 'zbx', '610700', '610728', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fcf4b8598af642c19876503c4645bda1', '文山县', 'wenshanxian', 'wsx', '532600', '532621', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fcfbad3e391a461681763c70c1f2650a', '市辖区', 'shixiaqu', 'sxq', '140900', '140901', '2018-03-30 18:06:50', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fd1f61f1d5964d78a5a00ba2edae1b2f', '嘉黎县', 'jialixian', 'jlx', '542400', '542422', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fd5e4870629640aabb6007b5d9a81725', '纳溪区', 'naxiqu', 'nxq', '510500', '510503', '2018-03-30 18:07:00', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fd73b5397b6d48b6bc0054ad99264c27', '金城江区', 'jinchengjiangqu', 'jcjq', '451200', '451202', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fd8208ade2b344ee8354cc1c06452267', '迁安市', 'qiananshi', 'qas', '130200', '130283', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fd8e2e642f1c45b489686e6d02b826b9', '尤溪县', 'youxixian', 'yxx', '350400', '350426', '2018-03-30 18:06:55', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fd8f6e990dac43979657b9690262ac30', '修武县', 'xiuwuxian', 'xwx', '410800', '410821', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fda0d7d72b7044f690f6ae1910ce71c6', '甘井子区', 'ganjingziqu', 'gjzq', '210200', '210211', '2018-03-30 18:06:51', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fda7a02e1bd8422b90a16e70638d6e1a', '迪庆藏族自治州', 'diqingcangzuzizhizhou', 'dqczzzz', '530000', '533400', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fdcd2c0a130045a798d00814dd17cc00', '融安县', 'ronganxian', 'rax', '450200', '450224', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fdd59678816e4ee3872cb77f9fd18161', '黑河市', 'heiheshi', 'hhs', '230000', '231100', '2018-03-30 18:06:53', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fdefc1e0a2f74a64a895f1852b7b29bd', '洛浦县', 'luopuxian', 'lpx', '653200', '653224', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fe364194fa6841248b6dfa4183eed414', '滨州市', 'binzhoushi', 'bzs', '370000', '371600', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fe59052df3bc464b9646dbbf3d540f13', '鹰潭市', 'yingtanshi', 'yts', '360000', '360600', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fe62db7bf61b4a29a85eec903eebccb0', '吴川市', 'wuchuanshi', 'wcs', '440800', '440883', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fe77a16f68e743c0bccb850b2dffa959', '庄浪县', 'zhuanglangxian', 'zlx', '620800', '620825', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fe97d2342fdf4d299e3e6a6d05d57010', '市辖区', 'shixiaqu', 'sxq', '620800', '620801', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fe99c5115851459d878c289c6fe09ea0', '沙雅县', 'shayaxian', 'syx', '652900', '652924', '2018-03-30 18:07:04', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fe9a29b1050b440d9676e45d262c21cd', '昌宁县', 'changningxian', 'cnx', '530500', '530524', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('feb517465b4d4a3d9b8d009841b50d6d', '市辖区', 'shixiaqu', 'sxq', '440300', '440301', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fec19b540e994336bbfe1f284a4547de', '祁东县', 'qidongxian', 'qdx', '430400', '430426', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('fecfc03f858a4953a330f63e15f13243', '市辖区', 'shixiaqu', 'sxq', '431100', '431101', '2018-03-30 18:06:58', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ff0231aef70e4eff91de3637915330bb', '聊城市', 'liaochengshi', 'lcs', '370000', '371500', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ff0946ad7e994c298946f89b7acc6cc1', '龙川县', 'longchuanxian', 'lcx', '441600', '441622', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ff0d3d258af14fe2b7f9ff24c62a0c0b', '凤庆县', 'fengqingxian', 'fqx', '530900', '530921', '2018-03-30 18:07:02', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ff24626a36a9440282ba6e89873e24b8', '宜春市', 'yichunshi', 'ycs', '360000', '360900', '2018-03-30 18:06:56', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ff4683b6dc7f4a4e947fd10741cd0282', '洛阳市', 'luoyangshi', 'lys', '410000', '410300', '2018-03-30 18:06:57', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ff7ee87dd77a4f82abd82cf5e557de7f', '桂平市', 'guipingshi', 'gps', '450800', '450881', '2018-03-30 18:06:59', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ff9e3fab66dc4f86a84681d4423e5fae', '赤城县', 'chichengxian', 'ccx', '130700', '130732', '2018-03-30 18:06:49', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ffa16594d0534934a87c03dca7cfe859', '市辖区', 'shixiaqu', 'sxq', '331100', '331101', '2018-03-30 18:06:54', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ffa26b2ecb7b47799f5ec9540324363a', '耀州区', 'yaozhouqu', 'yzq', '610200', '610204', '2018-03-30 18:07:03', '2018-04-14 22:18:12');
INSERT INTO `sp_basic_city` VALUES ('ffc8588dd5404d0ca4aef5501271ff75', '君山区', 'junshanqu', 'jsq', '430600', '430611', '2018-03-30 18:06:58', '2018-04-14 22:18:12');

-- ----------------------------
-- Table structure for sp_basic_cost
-- ----------------------------
DROP TABLE IF EXISTS `sp_basic_cost`;
CREATE TABLE `sp_basic_cost` (
  `id` char(32) NOT NULL COMMENT '主键',
  `city_code` varchar(50) NOT NULL COMMENT '城市编码',
  `city_name` varchar(50) NOT NULL COMMENT '城市名称',
  `basic_cost` decimal(10,2) NOT NULL COMMENT '基础劳务费',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础劳务费';

-- ----------------------------
-- Records of sp_basic_cost
-- ----------------------------
INSERT INTO `sp_basic_cost` VALUES ('3020dc190d234e5cb89507bc7a80f4dd', '411426', '夏邑县', '98.00', '2018-03-31 14:10:10', '2018-03-31 14:10:10');
INSERT INTO `sp_basic_cost` VALUES ('d86a4e1d2b2949738c2ee3253822db46', '110000', '北京市', '20.00', '2018-03-31 13:38:00', '2018-03-31 14:08:01');

-- ----------------------------
-- Table structure for sp_bond_record
-- ----------------------------
DROP TABLE IF EXISTS `sp_bond_record`;
CREATE TABLE `sp_bond_record` (
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL COMMENT '工人ID',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `redeem` char(1) NOT NULL COMMENT '是否赎回（Y:已赎回，N:未赎回）',
  `create_time` datetime NOT NULL COMMENT '缴纳时间',
  `redeem_time` datetime DEFAULT NULL COMMENT '赎回时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人保证金缴纳记录表';

-- ----------------------------
-- Records of sp_bond_record
-- ----------------------------

-- ----------------------------
-- Table structure for sp_company
-- ----------------------------
DROP TABLE IF EXISTS `sp_company`;
CREATE TABLE `sp_company` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(80) NOT NULL COMMENT '公司名称',
  `pinyin` varchar(200) NOT NULL COMMENT '名称拼音',
  `short_name` varchar(10) NOT NULL COMMENT '名称简称',
  `group_id` char(32) NOT NULL COMMENT '所属集团（上级公司）',
  `mechanism_type` varchar(50) NOT NULL COMMENT '机构类型',
  `business_regist_no` varchar(50) NOT NULL COMMENT '工商注册号',
  `organization_code` varchar(50) NOT NULL COMMENT '组织机构代码',
  `tax_no` varchar(50) NOT NULL COMMENT '纳税人识别号',
  `provincial` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `county` varchar(20) NOT NULL COMMENT '区县',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `contacts` varchar(50) NOT NULL COMMENT '联系人',
  `contact_tel` varchar(30) NOT NULL COMMENT '联系电话',
  `remarks` varchar(200) NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司、企业基础信息表';

-- ----------------------------
-- Records of sp_company
-- ----------------------------
INSERT INTO `sp_company` VALUES ('5060262265fc42809a19bb97cbcf7165', '测试', 'ceshi', '测试', '87da6e544a7c471db856bb1c4f855477', 'JGLX_QY', '123', '123', '123', '110000', '110100', '110101', '12', '11', '121', '1212', '2018-04-12 22:17:11', '2018-04-14 22:19:03');
INSERT INTO `sp_company` VALUES ('87da6e544a7c471db856bb1c4f855477', '趣施工', 'qushigong', '趣施工', '', 'JGLX_QY', '123456', '123456', '123456', '110000', '110100', '110101', '北京', '司仲夏', '18518436862', '', '2018-04-06 09:30:36', '2018-04-14 22:19:03');

-- ----------------------------
-- Table structure for sp_dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `sp_dictionary_item`;
CREATE TABLE `sp_dictionary_item` (
  `id` char(32) NOT NULL COMMENT '字典ID',
  `type_id` char(32) NOT NULL COMMENT '字典类型ID',
  `name` varchar(30) NOT NULL COMMENT '字典名称',
  `code` varchar(50) NOT NULL COMMENT '字典编码',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型项';

-- ----------------------------
-- Records of sp_dictionary_item
-- ----------------------------
INSERT INTO `sp_dictionary_item` VALUES ('0320462ff87f4e7fa5d80ada75af3d5b', '2ae8a34c0c8a45f5a46289049825d49f', '件', 'CPDW_JIAN', 'Y', '2018-04-04 18:43:50', '2018-04-04 18:43:50');
INSERT INTO `sp_dictionary_item` VALUES ('14d82cfc65e04608800641e31ce54c3a', '2d19ce4543674f979b6cf86df6c613ce', '政府', 'JGLX_ZF', 'Y', '2018-03-31 16:42:00', '2018-04-02 17:05:33');
INSERT INTO `sp_dictionary_item` VALUES ('2558d78dcfe84cfe838fd91df5f53b56', '2ae8a34c0c8a45f5a46289049825d49f', '只', 'CPDW_ZHI', 'Y', '2018-04-04 18:43:07', '2018-04-04 18:43:07');
INSERT INTO `sp_dictionary_item` VALUES ('440a37b811ae4117aa83dfa9bcba1823', 'dd2893846add4ffdb6867ac442021a0a', '强电资质', 'CPZZ_QDZZ', 'Y', '2018-04-06 14:07:03', '2018-04-06 14:07:03');
INSERT INTO `sp_dictionary_item` VALUES ('455a8afd7b0e45509dc5b9a8be7bdff7', '96b4c5efd3b942b089722a9816bd3484', ' 水利水电', 'HY_SLSD', 'Y', '2018-04-01 19:37:55', '2018-04-02 17:05:38');
INSERT INTO `sp_dictionary_item` VALUES ('46d7c814c63d461ea0ec4827df6ab59c', '96b4c5efd3b942b089722a9816bd3484', '建筑建材', 'HY_JZJC', 'Y', '2018-03-31 16:55:49', '2018-04-02 17:07:36');
INSERT INTO `sp_dictionary_item` VALUES ('56348c2d95ce4f71ac1e3b06245cb6d2', '2ae8a34c0c8a45f5a46289049825d49f', '个', 'CPDW_GE', 'Y', '2018-04-04 18:41:50', '2018-04-04 18:41:50');
INSERT INTO `sp_dictionary_item` VALUES ('62de58403a044a7c8d3c4ec576bc40ea', '20f3daf9e0324816a4df05a4bc88f593', '房建', 'XMLX_FJ', 'Y', '2018-04-07 23:01:31', '2018-04-07 23:01:31');
INSERT INTO `sp_dictionary_item` VALUES ('709b84b19d044f758b48baf36cdff956', '2ae8a34c0c8a45f5a46289049825d49f', '辆', 'CPDW_LIANG', 'Y', '2018-04-04 18:43:28', '2018-04-04 18:43:28');
INSERT INTO `sp_dictionary_item` VALUES ('7d66c716161a42d1b6d29a4c39ddf618', '96b4c5efd3b942b089722a9816bd3484', '信息产业', 'HY_XXCY', 'Y', '2018-04-01 19:34:44', '2018-04-02 17:07:39');
INSERT INTO `sp_dictionary_item` VALUES ('7eb9d44cc38a4a15ae150bc6cb39bc15', '2ae8a34c0c8a45f5a46289049825d49f', '包', 'CPDW_BAO', 'Y', '2018-04-04 18:43:17', '2018-04-04 18:43:17');
INSERT INTO `sp_dictionary_item` VALUES ('9b2039c54fbd4a5b8526080af3dea98f', '2d19ce4543674f979b6cf86df6c613ce', '企业', 'JGLX_QY', 'Y', '2018-03-31 16:41:14', '2018-04-02 17:05:30');
INSERT INTO `sp_dictionary_item` VALUES ('a62cd5e93f3648b88be47f1b2c15b1c2', 'dd2893846add4ffdb6867ac442021a0a', '弱点资质', 'CPZZ_RDZZ', 'Y', '2018-04-06 14:06:49', '2018-04-06 14:06:49');
INSERT INTO `sp_dictionary_item` VALUES ('b384a9764f594a11afa9f1952ce7c29b', '2ae8a34c0c8a45f5a46289049825d49f', '块', 'CPDW_KUAI', 'Y', '2018-04-04 18:43:39', '2018-04-04 18:43:39');
INSERT INTO `sp_dictionary_item` VALUES ('bd2010d6960f445c80d00ed216a31665', 'dd2893846add4ffdb6867ac442021a0a', '无资质', 'CPZZ_EMPTY', 'Y', '2018-04-06 14:50:33', '2018-04-06 14:50:33');
INSERT INTO `sp_dictionary_item` VALUES ('be1ac346427c4a61a00fe90c03b80ab8', '2ae8a34c0c8a45f5a46289049825d49f', '台', 'CPDW_TAI', 'Y', '2018-04-04 18:41:39', '2018-04-04 18:41:39');
INSERT INTO `sp_dictionary_item` VALUES ('c3e2456eacca4a7393625d21d09ad900', '2ae8a34c0c8a45f5a46289049825d49f', '盒', 'CPDW_HE', 'Y', '2018-04-04 18:44:12', '2018-04-04 18:44:12');
INSERT INTO `sp_dictionary_item` VALUES ('e099ac8f76f5451b8f57e169ac18c4e6', '20f3daf9e0324816a4df05a4bc88f593', '桥梁', 'XMLX_QL', 'Y', '2018-04-07 23:01:02', '2018-04-07 23:01:02');
INSERT INTO `sp_dictionary_item` VALUES ('f838fd491761472b9f876a82ccdd13d6', '20f3daf9e0324816a4df05a4bc88f593', '基建', 'XMLX_JJ', 'Y', '2018-04-07 23:01:18', '2018-04-07 23:01:18');
INSERT INTO `sp_dictionary_item` VALUES ('fb4ba256ecd04667b80299b4c350e777', '2ae8a34c0c8a45f5a46289049825d49f', '套', 'CPDW_TAO', 'Y', '2018-04-04 18:42:55', '2018-04-04 18:42:55');

-- ----------------------------
-- Table structure for sp_dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `sp_dictionary_type`;
CREATE TABLE `sp_dictionary_type` (
  `id` char(32) NOT NULL COMMENT '字典ID',
  `name` varchar(30) NOT NULL COMMENT '字典名称',
  `code` varchar(50) NOT NULL COMMENT '字典编码',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of sp_dictionary_type
-- ----------------------------
INSERT INTO `sp_dictionary_type` VALUES ('20f3daf9e0324816a4df05a4bc88f593', '项目类型', 'XMLX', 'Y', '2018-04-07 23:00:31', '2018-04-07 23:00:31');
INSERT INTO `sp_dictionary_type` VALUES ('2ae8a34c0c8a45f5a46289049825d49f', '产品单位', 'CPDW', 'Y', '2018-04-04 18:41:24', '2018-04-04 18:41:24');
INSERT INTO `sp_dictionary_type` VALUES ('2d19ce4543674f979b6cf86df6c613ce', '机构类型', 'JGLX', 'Y', '2018-03-31 15:26:16', '2018-03-31 16:52:34');
INSERT INTO `sp_dictionary_type` VALUES ('96b4c5efd3b942b089722a9816bd3484', '行业', 'HY', 'Y', '2018-03-31 16:00:45', '2018-04-01 19:33:28');
INSERT INTO `sp_dictionary_type` VALUES ('dd2893846add4ffdb6867ac442021a0a', '产品资质', 'CPZZ', 'Y', '2018-04-06 14:04:15', '2018-04-06 14:04:15');

-- ----------------------------
-- Table structure for sp_job
-- ----------------------------
DROP TABLE IF EXISTS `sp_job`;
CREATE TABLE `sp_job` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `name` varchar(50) NOT NULL COMMENT '任务（作业）名称',
  `group` char(32) NOT NULL COMMENT '所在组',
  `cron` varchar(50) NOT NULL COMMENT '定时任务时间表达式',
  `clazz_name` varchar(100) NOT NULL COMMENT '作业类',
  `is_concurrent` tinyint(1) NOT NULL COMMENT '是否允许并发执行同一个任务',
  `is_startup_execution` tinyint(1) NOT NULL COMMENT '是否项目启动时自执行',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of sp_job
-- ----------------------------
INSERT INTO `sp_job` VALUES ('1f0aa9ae4e064dfca71d5788e2538621', 'DEMO', 'Z_GROUP_1', '*/10 * * * * ?', 'com.single.pro.quartz.job.BaseJob', '0', '0', '每10秒执行一次。', '2018-03-07 15:57:46', '2018-04-14 22:20:22');

-- ----------------------------
-- Table structure for sp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_login_log`;
CREATE TABLE `sp_login_log` (
  `id` char(32) NOT NULL COMMENT '主键',
  `login_name` varchar(50) NOT NULL COMMENT '登陆名称',
  `client_ip` varchar(64) NOT NULL COMMENT '客户端IP',
  `user_agent` varchar(200) NOT NULL COMMENT '用户标识',
  `login_status` char(1) NOT NULL COMMENT '登陆状态（Y:登陆成功，N:登陆失败）',
  `login_result` varchar(100) NOT NULL COMMENT '登陆结果信息',
  `user_id` char(32) NOT NULL COMMENT '登陆成功后的用户ID',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户登陆记录表';

-- ----------------------------
-- Records of sp_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sp_mp_banner
-- ----------------------------
DROP TABLE IF EXISTS `sp_mp_banner`;
CREATE TABLE `sp_mp_banner` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称描述',
  `pic_url` varchar(200) NOT NULL COMMENT '图标地址',
  `sort_weight` int(11) NOT NULL COMMENT '排序权重',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小程序banner模块';

-- ----------------------------
-- Records of sp_mp_banner
-- ----------------------------
INSERT INTO `sp_mp_banner` VALUES ('acd1c576c8de4901a4ef85403a5c3efa', '2', '2018/03/14/80C34C1FB6064E4CB54F869FD426DFB6.png', '2', '1', '2018-03-24 20:40:38', '2018-03-24 20:44:46');

-- ----------------------------
-- Table structure for sp_mp_channel
-- ----------------------------
DROP TABLE IF EXISTS `sp_mp_channel`;
CREATE TABLE `sp_mp_channel` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `icon_url` varchar(200) NOT NULL COMMENT '图标地址',
  `sort_weight` int(11) NOT NULL COMMENT '排序权重',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小程序channel模块';

-- ----------------------------
-- Records of sp_mp_channel
-- ----------------------------
INSERT INTO `sp_mp_channel` VALUES ('02362eeb786949d6ba1eeca3b6a3a58e', '2', '2', '2', '1', '2018-03-24 20:52:23', '2018-03-24 20:52:31');

-- ----------------------------
-- Table structure for sp_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_operation_log`;
CREATE TABLE `sp_operation_log` (
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL COMMENT '操作用户ID',
  `operate_type` char(1) NOT NULL COMMENT '操作类型（C:创建，U：更新，D：删除）',
  `obj_name` varchar(50) NOT NULL COMMENT '操作对象名称',
  `operate_content` varchar(200) NOT NULL COMMENT '操作内容',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户操作记录表（记录关键数据）';

-- ----------------------------
-- Records of sp_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_order`;
CREATE TABLE `sp_order` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目ID',
  `project_name` varchar(50) NOT NULL COMMENT '项目名称',
  `work_id` char(32) NOT NULL COMMENT '项目批次ID',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `customer_id` char(32) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(20) NOT NULL COMMENT '下单客户名称',
  `worker_id` char(32) NOT NULL COMMENT '劳务工人ID',
  `worker_name` varchar(20) NOT NULL COMMENT '接单工人名称',
  `worker_head_pic` varchar(100) NOT NULL COMMENT '接单工人头像',
  `worker_age` int(11) NOT NULL COMMENT '接单工人年龄',
  `product_id` char(32) NOT NULL COMMENT '产品关联ID',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `product_kind` varchar(50) NOT NULL COMMENT '产品种类',
  `product_type` varchar(50) NOT NULL COMMENT '产品类别',
  `product_model` varchar(50) NOT NULL COMMENT '产品型号',
  `product_company` varchar(80) NOT NULL COMMENT '产品公司',
  `product_pic` varchar(100) NOT NULL COMMENT '产品图片',
  `product_num` varchar(20) NOT NULL COMMENT '产品数量及描述',
  `detail_list_url` varchar(100) NOT NULL COMMENT '清单文件链接',
  `expect_time` varchar(30) NOT NULL COMMENT '预计施工开始时间',
  `expect_days` int(11) NOT NULL COMMENT '预计施工天数',
  `order_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `deposit_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '托管金额',
  `paid_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `ser_survey_choice` char(1) NOT NULL COMMENT '勘测服务选择（Y:选择，N:未选择）',
  `ser_survey_status` char(1) NOT NULL COMMENT '勘测服务进展状态（Y:已完成，D:进行中，N:未开始）',
  `ser_check_choice` char(1) NOT NULL COMMENT '验货服务选择（Y:选择，N:未选择）',
  `ser_check_status` char(1) NOT NULL COMMENT '验货服务进展状态（Y:已完成，D:进行中，N:未开始）',
  `ser_construct_choice` char(1) NOT NULL COMMENT '施工服务选择（Y:选择，N:未选择）',
  `ser_construct_status` char(1) NOT NULL COMMENT '施工服务进展状态（Y:已完成，D:进行中，N:未开始）',
  `ser_train_choice` char(1) NOT NULL COMMENT '培训服务选择（Y:选择，N:未选择）',
  `ser_train_status` char(1) NOT NULL COMMENT '培训服务进展状态（Y:已完成，D:进行中，N:未开始）',
  `ser_accept_choice` char(1) NOT NULL COMMENT '验收服务选择（Y:选择，N:未选择）',
  `ser_accept_status` char(1) NOT NULL COMMENT '验收服务进展状态（Y:已完成，D:进行中，N:未开始）',
  `release_status` char(1) NOT NULL COMMENT '下单发布状态（Y:已发布，N:暂存），一旦发布，状态不可修改',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `build_status` char(1) NOT NULL COMMENT '施工状态（Y:已完工，R:进行中，D:待施工）',
  `order_status` char(1) NOT NULL COMMENT '订单状态（Y:已完成，D:已接单，N:已取消，W:待工人确认，P:待平台确认）',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of sp_order
-- ----------------------------
INSERT INTO `sp_order` VALUES ('3e4c28483d9d429db4120b0e6bcafa41', '', '112', 'b5a0d2e68e8f4629b66199be4945d250', 'D201801001011', 'd2b1e69a8a6045c1938f76d659b59a57', '', 'f6a33378b3cb48208912cffa6b5ff081', '', '', '0', '8124932afe6441f5adc8801eb3691088', '112', '1', '1', '1', '', '', '', '', '2018-04-12 23:18:22', '1', '1.00', '1.00', '0.00', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2018-04-16 23:07:28', 'R', 'Y', '1', '2018-04-12 23:18:41', '2018-04-16 23:08:16');

-- ----------------------------
-- Table structure for sp_order_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_evaluate`;
CREATE TABLE `sp_order_evaluate` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_id` char(32) NOT NULL COMMENT '评价订单',
  `to_user_id` char(32) NOT NULL COMMENT '被评价人',
  `ser_attitude_score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '服务态度评分',
  `ser_efficiency_score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '施工效率评分',
  `ser_quality_score` decimal(2,1) NOT NULL DEFAULT '0.0' COMMENT '施工质量评分',
  `ser_comment` varchar(200) NOT NULL COMMENT '服务评论文本',
  `from_user_id` char(32) NOT NULL COMMENT '评价人',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单评价记录';

-- ----------------------------
-- Records of sp_order_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_invoice`;
CREATE TABLE `sp_order_invoice` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `company_name` varchar(80) NOT NULL COMMENT '公司名称',
  `company_tax_no` varchar(50) NOT NULL COMMENT '纳税人识别号',
  `invoice_cost` decimal(10,2) NOT NULL COMMENT '发票金额',
  `email` varchar(100) NOT NULL COMMENT '电子邮箱',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `status` char(1) NOT NULL COMMENT '发票状态（Y:已完成）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单发票';

-- ----------------------------
-- Records of sp_order_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order_pay
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_pay`;
CREATE TABLE `sp_order_pay` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_id` char(32) NOT NULL COMMENT '订单ID',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `money` int(10) NOT NULL COMMENT '订单金额（单位：分）',
  `pay_serial_num` varchar(80) NOT NULL COMMENT '支付流水号',
  `status` char(1) NOT NULL COMMENT '支付状态（Y:支付完成，N:支付失败）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_operation_time` datetime NOT NULL COMMENT '最后操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单支付';

-- ----------------------------
-- Records of sp_order_pay
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order_schedule
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_schedule`;
CREATE TABLE `sp_order_schedule` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_id` char(32) NOT NULL COMMENT '订单编号',
  `worker_id` char(32) NOT NULL COMMENT '劳务工人ID',
  `stage` varchar(50) NOT NULL COMMENT '施工阶段,字典',
  `days` int(11) NOT NULL COMMENT '施工天数',
  `worker_status` char(1) NOT NULL COMMENT '工作状态（Y:已完成，D:进行中）',
  `work_content` varchar(200) NOT NULL COMMENT '工作内容说明，工人',
  `ack_status` char(1) NOT NULL COMMENT '确认状态（Y:已确认，N:已驳回，D:待确认）',
  `ack_time` datetime DEFAULT NULL COMMENT '确认时间',
  `comment` varchar(200) NOT NULL COMMENT '评语，客户',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单进度表';

-- ----------------------------
-- Records of sp_order_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for sp_order_schedule_pic
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_schedule_pic`;
CREATE TABLE `sp_order_schedule_pic` (
  `id` char(32) NOT NULL COMMENT '主键',
  `schedule_id` char(32) NOT NULL COMMENT '订单进度ID',
  `image_url` varchar(200) NOT NULL COMMENT '图片访问路径',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单进度表图片资源';

-- ----------------------------
-- Records of sp_order_schedule_pic
-- ----------------------------

-- ----------------------------
-- Table structure for sp_partner_worker
-- ----------------------------
DROP TABLE IF EXISTS `sp_partner_worker`;
CREATE TABLE `sp_partner_worker` (
  `id` char(32) NOT NULL COMMENT '主键',
  `partner_id` char(32) NOT NULL COMMENT '城市合伙人',
  `worker_id` char(32) NOT NULL COMMENT '劳务工人',
  `link_time` datetime NOT NULL COMMENT '关联时间',
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `worker_id` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市合伙人和工人关联信息表';

-- ----------------------------
-- Records of sp_partner_worker
-- ----------------------------

-- ----------------------------
-- Table structure for sp_platform_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_platform_order`;
CREATE TABLE `sp_platform_order` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_id` char(32) NOT NULL COMMENT '订单ID',
  `order_source` char(1) NOT NULL COMMENT '订单来源类型（C:客户\\系统转平台，W:劳务工人转平台）',
  `source_id` char(32) NOT NULL COMMENT '来源关联ID',
  `order_status` char(1) NOT NULL COMMENT '订单状态（Y:已转接至工人，N:已取消，D:待处理）',
  `destination_id` char(32) NOT NULL COMMENT '目标工人ID',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `operator_id` char(255) NOT NULL COMMENT '系统用户,操作人ID',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转至平台订单';

-- ----------------------------
-- Records of sp_platform_order
-- ----------------------------

-- ----------------------------
-- Table structure for sp_product
-- ----------------------------
DROP TABLE IF EXISTS `sp_product`;
CREATE TABLE `sp_product` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL,
  `kind_id` char(32) NOT NULL COMMENT '所属设备种类',
  `type_id` char(32) NOT NULL COMMENT '产品类别',
  `company_id` char(32) NOT NULL COMMENT '所属公司',
  `model` varchar(50) NOT NULL COMMENT '产品型号',
  `describe` text NOT NULL COMMENT '产品描述',
  `constituent` text NOT NULL COMMENT '产品组成',
  `survey_items` text NOT NULL COMMENT '勘测事项',
  `install_debug` text NOT NULL COMMENT '安装调试',
  `device_maintain` text NOT NULL COMMENT '设备维护',
  `common_problem` text NOT NULL COMMENT '常见问题',
  `doc_url` varchar(200) NOT NULL COMMENT '文档访问链接',
  `manual_url` varchar(200) NOT NULL COMMENT '操作手册访问链接',
  `apply_user_id` char(32) NOT NULL COMMENT '申请人ID',
  `show_status` char(1) NOT NULL COMMENT '上下架（展示）状态（Y:上架，N:下架，D:待发布）',
  `contacts` varchar(50) NOT NULL COMMENT '产品联系人',
  `contact_tel` varchar(30) NOT NULL COMMENT '联系电话',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of sp_product
-- ----------------------------
INSERT INTO `sp_product` VALUES ('02f6470ef2344f78a8c2d628955ba604', 'aaa', '3ab73688cac2499391e1b501aeab03e3', 'f97b56a4deae4efaa6d17081b386fb6b', '87da6e544a7c471db856bb1c4f855477', 'aaaa', 'aa', 'aaa', 'aa', 'aaa', 'aaa', 'aaa', '/2018/04/11/cuaYkEoRZm4xk1ffCju.doc', '/2018/04/11/xjlF7WAjBoOIY2PnMZj.doc', '3e8657b0e9b84023a3c16af91e13e620', 'D', '1212112121', '18518436862', '2018-04-11 21:34:51', '2018-04-14 22:24:12');
INSERT INTO `sp_product` VALUES ('5506277d22a44c8b9e3903c4cf9a7311', '测试产品', '3ab73688cac2499391e1b501aeab03e3', 'f97b56a4deae4efaa6d17081b386fb6b', '87da6e544a7c471db856bb1c4f855477', 'Model-0291', '描述', '组成', '事项', '安装', '维护', '问题', '/2018/04/06/vIt4CKrfmB4nrzxPZgE.doc', '/2018/04/06/Sogxa3CUwugQVLq5dKK.txt', '3e8657b0e9b84023a3c16af91e13e620', 'N', '司仲夏', '18518436861', '2018-04-06 11:38:03', '2018-04-14 22:24:12');
INSERT INTO `sp_product` VALUES ('8124932afe6441f5adc8801eb3691088', '产品名称', '3ab73688cac2499391e1b501aeab03e3', '96adb22a2ca3498086df3224bf857751', '87da6e544a7c471db856bb1c4f855477', '111', '11', '11', '111', '111', '111', '11', '/2018/04/06/dVcNP4Eqp54s7HxmXIm.docx', '/2018/04/06/ywnLXJQo0JtsNairRRz.doc', '3e8657b0e9b84023a3c16af91e13e620', 'N', '司仲夏', '18518436862', '2018-04-06 15:09:27', '2018-04-14 22:24:12');

-- ----------------------------
-- Table structure for sp_product_clue
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_clue`;
CREATE TABLE `sp_product_clue` (
  `id` char(32) NOT NULL COMMENT '主键',
  `product_name` varchar(80) NOT NULL COMMENT '产品名称',
  `company` varchar(100) NOT NULL COMMENT '所属公司',
  `contacts` varchar(50) NOT NULL COMMENT '联系人',
  `contact_tel` varchar(30) NOT NULL COMMENT '联系电话',
  `summary` varchar(500) NOT NULL COMMENT '概述',
  `file_name` varchar(100) NOT NULL COMMENT '产品资料名称',
  `file_url` varchar(200) NOT NULL COMMENT '产品资料地址',
  `user_id` char(32) NOT NULL COMMENT '申请人、关联用户',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `handle_status` char(1) NOT NULL COMMENT '处理状态（Y:已处理，N:无效数据，D:待处理）',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品（申请）线索记录表';

-- ----------------------------
-- Records of sp_product_clue
-- ----------------------------
INSERT INTO `sp_product_clue` VALUES ('1', '测试', '仲夏科技', '司仲夏', '18518436862', '无', '1', 'http://www.file.url', '1', '2018-04-02 22:08:32', 'N', '2018-04-06 22:30:44');
INSERT INTO `sp_product_clue` VALUES ('c7c89ae14f004cfba062b86d0df3ebb0', '测试线索', 'goyo', '赵通', '12345678900', '概述概述', '', '', '', '2018-04-08 22:43:48', 'D', '2018-04-08 22:43:48');

-- ----------------------------
-- Table structure for sp_product_image
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_image`;
CREATE TABLE `sp_product_image` (
  `id` char(32) NOT NULL COMMENT '主键',
  `product_id` char(32) NOT NULL COMMENT '产品ID',
  `path` varchar(200) NOT NULL COMMENT '图片路径',
  `is_cover` char(1) NOT NULL COMMENT '封面（Y:是，N:否）',
  `status` char(1) NOT NULL COMMENT '状态（Y:可用, N:移除）',
  `create_time` datetime NOT NULL COMMENT '上传创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品图片表';

-- ----------------------------
-- Records of sp_product_image
-- ----------------------------
INSERT INTO `sp_product_image` VALUES ('3c6a57bebed642899a71d8611edd97cd', '5506277d22a44c8b9e3903c4cf9a7311', '/2018/04/06/DYgo4rDOoECgTPFEUuB.jpg', 'Y', 'Y', '2018-04-06 21:17:28', '2018-04-06 21:17:28');
INSERT INTO `sp_product_image` VALUES ('48e8ff99e33741cca53868b6325410b8', '8124932afe6441f5adc8801eb3691088', '/2018/04/06/Xiu797E5D5LsBHq3nxo.jpg', 'N', 'Y', '2018-04-06 20:46:50', '2018-04-06 21:16:14');
INSERT INTO `sp_product_image` VALUES ('7ccec6044e284264b83110dfff8641dd', '02f6470ef2344f78a8c2d628955ba604', '/2018/04/11/ivclvNtmxUKCIAfuPM2.png', 'Y', 'Y', '2018-04-11 21:35:07', '2018-04-11 21:35:07');
INSERT INTO `sp_product_image` VALUES ('9723ae47cfdb45f3b0b33ec47beac753', '8124932afe6441f5adc8801eb3691088', '/2018/04/06/7C2eHBNpSrZeIv2c9S2.png', 'Y', 'Y', '2018-04-06 20:44:46', '2018-04-06 21:16:14');
INSERT INTO `sp_product_image` VALUES ('cc1471eef7f74614a17f0e526577ebaf', '8124932afe6441f5adc8801eb3691088', '/2018/04/06/gz8RWAnis4Qs9Yy5FBi.png', 'N', 'N', '2018-04-06 20:46:31', '2018-04-06 21:12:29');
INSERT INTO `sp_product_image` VALUES ('cddf699a2059410e888f15549acca454', '8124932afe6441f5adc8801eb3691088', '/2018/04/06/Up6JWaAmYMRj7WJWt7e.png', 'N', 'Y', '2018-04-06 20:46:23', '2018-04-06 20:46:31');

-- ----------------------------
-- Table structure for sp_product_kind
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_kind`;
CREATE TABLE `sp_product_kind` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `pic_url` varchar(200) NOT NULL COMMENT '图标',
  `summary` text NOT NULL COMMENT '概述',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品种类，例：人员管理，起重设备，监控';

-- ----------------------------
-- Records of sp_product_kind
-- ----------------------------
INSERT INTO `sp_product_kind` VALUES ('3ab73688cac2499391e1b501aeab03e3', '人员管理', '/2018/04/04/flHkvKUOyPtlfJYneSR.jpg', '人员管理', 'Y', '2018-04-04 19:37:54', '2018-04-07 20:27:19');
INSERT INTO `sp_product_kind` VALUES ('59d42c44bb564424acc7dc677e731cf3', '无1', '/2018/04/06/jGYPNnl6H9pyrKIycbX.png', '无1', 'Y', '2018-04-06 10:01:39', '2018-04-16 20:41:52');
INSERT INTO `sp_product_kind` VALUES ('690ec12d89ba48ad91feb85d2b3b1e48', '测试', '/2018/04/04/uSoHlOqklumXHKGknT4.jpg', '测试', 'Y', '2018-04-04 16:09:53', '2018-04-06 10:43:28');

-- ----------------------------
-- Table structure for sp_product_qualification
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_qualification`;
CREATE TABLE `sp_product_qualification` (
  `id` char(32) NOT NULL COMMENT '主键',
  `type_id` char(32) NOT NULL COMMENT '产品类别关联ID',
  `qualification` varchar(50) NOT NULL COMMENT '关联资质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品资质关联';

-- ----------------------------
-- Records of sp_product_qualification
-- ----------------------------
INSERT INTO `sp_product_qualification` VALUES ('236e9d682e9e46cc92d19b13e01faeea', 'f97b56a4deae4efaa6d17081b386fb6b', 'CPZZ_QDZZ');
INSERT INTO `sp_product_qualification` VALUES ('586884b577d04d84920da292037aef5c', '96adb22a2ca3498086df3224bf857751', 'CPZZ_RDZZ');
INSERT INTO `sp_product_qualification` VALUES ('e896f955de2d431981436b7e39ace88e', 'f97b56a4deae4efaa6d17081b386fb6b', 'CPZZ_RDZZ');

-- ----------------------------
-- Table structure for sp_product_type
-- ----------------------------
DROP TABLE IF EXISTS `sp_product_type`;
CREATE TABLE `sp_product_type` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `kind_id` char(32) NOT NULL COMMENT '产品种类',
  `pic_url` varchar(200) NOT NULL COMMENT '产品图片',
  `summary` text NOT NULL COMMENT '概述',
  `sgsq_condition` text NOT NULL COMMENT '施工申请条件',
  `ser_survey` varchar(255) NOT NULL COMMENT '勘测',
  `ser_check` varchar(255) NOT NULL COMMENT '验货',
  `ser_construct` varchar(255) NOT NULL COMMENT '施工',
  `ser_train` varchar(255) NOT NULL COMMENT '培训',
  `ser_accept` varchar(255) NOT NULL COMMENT '验收',
  `unit` varchar(10) NOT NULL COMMENT '数量单位',
  `difficulty` decimal(2,1) NOT NULL COMMENT '施工难度',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类型，例：人脸识别，塔吊';

-- ----------------------------
-- Records of sp_product_type
-- ----------------------------
INSERT INTO `sp_product_type` VALUES ('96adb22a2ca3498086df3224bf857751', '劳务实名制', '3ab73688cac2499391e1b501aeab03e3', '/2018/04/04/i4DrkxjJTApGfuPKOQq.jpg', '描述', '施工申请条件', '勘测', '验货', '施工', '培训', '验收', 'CPDW_HE', '3.0', 'Y', '2018-04-04 19:39:42', '2018-04-07 20:28:11');
INSERT INTO `sp_product_type` VALUES ('f97b56a4deae4efaa6d17081b386fb6b', '测试1', '3ab73688cac2499391e1b501aeab03e3', '/2018/04/04/PtQO2snBniOUbcLWUEz.jpg', '描述1', '施工条件1', '勘测1', '验货1', '施工1', '培训1', '验收1', 'CPDW_HE', '5.0', 'Y', '2018-04-04 19:15:22', '2018-04-04 19:39:53');

-- ----------------------------
-- Table structure for sp_project
-- ----------------------------
DROP TABLE IF EXISTS `sp_project`;
CREATE TABLE `sp_project` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '项目名称',
  `pinyin` varchar(200) NOT NULL COMMENT '拼音',
  `type` varchar(50) NOT NULL COMMENT '项目类别',
  `provincial` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `county` varchar(20) NOT NULL COMMENT '区县',
  `address` varchar(200) NOT NULL COMMENT '详细地址',
  `longitude` varchar(26) NOT NULL COMMENT '经度',
  `latitude` varchar(26) NOT NULL COMMENT '纬度',
  `covered_area` varchar(20) NOT NULL COMMENT '建筑面积',
  `worker_num` int(11) NOT NULL COMMENT '劳务人数',
  `company_id` char(32) NOT NULL COMMENT '所属组织公司',
  `branch_company_id` char(32) NOT NULL COMMENT '分公司',
  `contacts` varchar(50) NOT NULL COMMENT '联系人',
  `contact_tel` varchar(30) NOT NULL COMMENT '联系电话',
  `status` char(1) NOT NULL COMMENT '项目状态',
  `remarks` text NOT NULL COMMENT '备注',
  `create_user_id` char(32) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='施工项目表';

-- ----------------------------
-- Records of sp_project
-- ----------------------------
INSERT INTO `sp_project` VALUES ('d656d55e1b3f4640b5cf56d1642b9a6f', '112', '112', 'XMLX_JJ', '210000', '210700', '210711', '12121', '116.397428', '39.90923', '', '0', '87da6e544a7c471db856bb1c4f855477', '', '12', '1212', 'Y', '', '3e8657b0e9b84023a3c16af91e13e620', '2018-04-12 10:51:45', '2018-04-14 22:28:58');
INSERT INTO `sp_project` VALUES ('de92d008ba9e4118930fca22335a128c', '121', '121', 'XMLX_QL', '110000', '110100', '110101', '121', '116.397428', '39.90923', '', '0', '87da6e544a7c471db856bb1c4f855477', '', '123', '12333', 'N', '', '3e8657b0e9b84023a3c16af91e13e620', '2018-04-12 22:24:55', '2018-04-15 16:00:32');

-- ----------------------------
-- Table structure for sp_project_draw
-- ----------------------------
DROP TABLE IF EXISTS `sp_project_draw`;
CREATE TABLE `sp_project_draw` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目关联ID',
  `drawing_url` varchar(200) NOT NULL COMMENT '图纸地址',
  `upload_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目图纸';

-- ----------------------------
-- Records of sp_project_draw
-- ----------------------------
INSERT INTO `sp_project_draw` VALUES ('4e1edb413ae14f5ba19fca569fb2093a', 'de92d008ba9e4118930fca22335a128c', '/2018/04/16/c7o71a5OpSrijOL4XP9.zip', '2018-04-16 20:15:12');
INSERT INTO `sp_project_draw` VALUES ('953958824322479299cef144198c189d', 'de92d008ba9e4118930fca22335a128c', '/2018/04/16/3l4R3QBTKnf1znUbg6v.jpg', '2018-04-16 20:13:25');

-- ----------------------------
-- Table structure for sp_project_work
-- ----------------------------
DROP TABLE IF EXISTS `sp_project_work`;
CREATE TABLE `sp_project_work` (
  `id` char(32) NOT NULL COMMENT '主键',
  `project_id` char(32) NOT NULL COMMENT '项目关联ID',
  `work_no` varchar(20) NOT NULL COMMENT '操作流水号',
  `work_name` varchar(50) NOT NULL COMMENT '项目批次名称',
  `project_type` varchar(50) NOT NULL COMMENT '项目类别',
  `provincial` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `county` varchar(20) NOT NULL COMMENT '区县',
  `address` varchar(200) NOT NULL COMMENT '详细地址',
  `longitude` varchar(26) NOT NULL COMMENT '经度',
  `latitude` varchar(26) NOT NULL COMMENT '纬度',
  `city_unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '人天单价（当前时间）',
  `company_id` char(32) NOT NULL COMMENT '施工单位ID',
  `company_name` varchar(80) NOT NULL COMMENT '施工公司名称',
  `product_num` int(10) NOT NULL DEFAULT '0' COMMENT '产品种类数',
  `worker_num` int(10) NOT NULL DEFAULT '0' COMMENT '工人数量',
  `deposit_cost_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '托管金额汇总',
  `paid_cost_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已支付金额汇总',
  `unpaid_cost_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '未支付金额汇总',
  `unconfirmed_num` int(10) NOT NULL DEFAULT '0' COMMENT '未确认数量',
  `confirmed_num` int(10) NOT NULL DEFAULT '0' COMMENT '已确认数量',
  `uncomplete_num` int(10) NOT NULL DEFAULT '0' COMMENT '未完成数量',
  `complete_num` int(10) NOT NULL DEFAULT '0' COMMENT '已完成数量',
  `arrearage_num` int(10) NOT NULL DEFAULT '0' COMMENT '未付款的订单',
  `work_description` varchar(200) NOT NULL COMMENT '工作项目描述',
  `customer_id` char(255) NOT NULL COMMENT '操作人客户id，关联user表id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_no` (`work_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目任务（批次）';

-- ----------------------------
-- Records of sp_project_work
-- ----------------------------
INSERT INTO `sp_project_work` VALUES ('b5a0d2e68e8f4629b66199be4945d250', 'd656d55e1b3f4640b5cf56d1642b9a6f', 'WorkNo_112', '测试', 'XMLX_JJ', '210000', '210700', '210711', '12121', '116.397428', '39.90923', '400.00', '87da6e544a7c471db856bb1c4f855477', '趣施工', '2', '2', '12120.00', '12120.00', '0.00', '1', '1', '1', '0', '0', '描述', '21c8de2477374851a5f320b7df67d83e', '2018-04-15 12:53:33', '2018-04-16 10:06:50');

-- ----------------------------
-- Table structure for sp_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `code` varchar(80) NOT NULL COMMENT '角色编码',
  `is_system` char(1) NOT NULL COMMENT '状态（Y:系统角色，N:自定义角色）',
  `status` char(1) NOT NULL COMMENT '状态（Y:启用，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sp_role
-- ----------------------------
INSERT INTO `sp_role` VALUES ('b3207d8f6d134f80b3976584a06816c0', '管理员', 'admin', 'Y', 'Y', '2017-12-27 11:28:51', '2017-12-27 11:28:53');
INSERT INTO `sp_role` VALUES ('b4e3a62b31ef4699a0d13774acb39e72', '业务员', 'yewuyuan', 'N', 'Y', '2018-03-07 10:22:49', '2018-03-14 16:33:49');

-- ----------------------------
-- Table structure for sp_role_app
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_app`;
CREATE TABLE `sp_role_app` (
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `app_id` char(32) NOT NULL COMMENT '系统应用关联',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  KEY `app_id` (`app_id`),
  CONSTRAINT `sp_role_app_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `sp_system_app` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色系统应用授权';

-- ----------------------------
-- Records of sp_role_app
-- ----------------------------
INSERT INTO `sp_role_app` VALUES ('b3207d8f6d134f80b3976584a06816c0', '0069e3f00f684e6284756d0d7bb0c743', '2018-03-07 14:27:58');
INSERT INTO `sp_role_app` VALUES ('b3207d8f6d134f80b3976584a06816c0', '53ba97935d824733856e4f3655883039', '2018-03-07 14:27:58');
INSERT INTO `sp_role_app` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'f5683d5afb22403bac8b7cb83ce04689', '2018-03-07 15:10:17');

-- ----------------------------
-- Table structure for sp_role_authword
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_authword`;
CREATE TABLE `sp_role_authword` (
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `authword` varchar(80) NOT NULL COMMENT '权限关联',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`,`authword`),
  KEY `authword` (`authword`),
  CONSTRAINT `sp_role_authword_ibfk_1` FOREIGN KEY (`authword`) REFERENCES `sp_system_authword` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限字授权';

-- ----------------------------
-- Records of sp_role_authword
-- ----------------------------
INSERT INTO `sp_role_authword` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'authword:edit', '2018-03-14 16:55:04');
INSERT INTO `sp_role_authword` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'authword:run', '2018-03-14 16:55:04');
INSERT INTO `sp_role_authword` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'authword:start', '2018-03-14 16:55:04');
INSERT INTO `sp_role_authword` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'authword:stop', '2018-03-14 16:55:04');

-- ----------------------------
-- Table structure for sp_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_menu`;
CREATE TABLE `sp_role_menu` (
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `menu_id` char(32) NOT NULL COMMENT '菜单关联',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `sp_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sp_system_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色系统菜单授权';

-- ----------------------------
-- Records of sp_role_menu
-- ----------------------------
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '01fc3b9b6d4e40468bda6f8f39c2c59b', '2018-04-06 15:36:20');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '0939ca703e20483c998ae72ffee94ff8', '2018-03-31 15:14:19');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '0d255344a93349f8a0649ff8b2245899', '2018-04-02 21:55:00');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '11ed187b6a254ff485fa8a97a13d8c67', '2018-03-14 15:53:08');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '1591cacecd964ed7b39fbd9836eb6773', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '1907f6a394fe479484bc741a4b2e8824', '2018-04-02 21:54:50');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '1af2bd180c514cf3b0217dc6958c14d4', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '2f3ff011daef4f57b3ea0135284388a4', '2018-04-07 20:45:13');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '332711f151f848559a2421eceddbe4a8', '2018-03-14 15:31:21');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '3d858b78f4d94e62a208f9db57f72672', '2018-03-31 21:50:26');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '3ead7806d81448509a6103d0b485d51d', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '42d0c74564274ca081096ffb895b3caa', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '516cc0f2a2814c40b716bc8e15f6e7f2', '2018-03-31 21:50:26');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '57e5cb7728614328a07d96c407f1ca96', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '588325bea4ee45bfbb26d26c4602571f', '2018-04-11 20:25:41');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '61f16f2fad494fb69e8b49a0f55a913e', '2018-03-31 14:32:42');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '6874b4550c04488da3d1fc4acaf9a217', '2018-03-30 16:36:02');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '6e749c60ff1b4a8f80496ae367af3fc8', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', '80bf1cab24f74b67a2c04141fc9d7e3d', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'a68d10b6cbf54600b079a34ba173b90e', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'a73ee83f7c1042c7aff9dfa231ec3e6d', '2018-03-31 14:32:42');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'a90c7d9e86b54d9b927e3dccd84813ac', '2018-04-02 21:54:50');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'ab81884d878444bc8449efa6aec7a2e1', '2018-04-06 15:36:21');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'b3cfafacb12f4a298983651794eca98d', '2018-03-07 15:10:17');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'b50f8e998faa40e2841ac4d563a5ba87', '2018-04-07 20:45:13');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'bef8b286b85c40c3ba0829a01416e100', '2018-04-02 21:54:50');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'c05923b4168e446984956a7056facaf7', '2018-03-23 16:41:43');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'c5ad6f30dcc243959a529f67a1d56e78', '2018-03-31 21:50:26');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'cf97195e8c214c3986dcbb8a17d86c29', '2018-04-02 21:54:50');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'de47a7717b774dcd9c8aebdf4124651b', '2018-03-07 14:27:58');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'df23fc6d09dc4d729c733358c46a8eb8', '2018-03-30 22:53:33');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'e26663b00591407f8f441a18aca3e96a', '2018-03-07 15:09:51');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'f7506595d98441f884efee63bf004c58', '2018-03-31 21:50:26');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'f8aedd4107be4820bed3ba9cabcd5f84', '2018-03-14 15:53:08');
INSERT INTO `sp_role_menu` VALUES ('b3207d8f6d134f80b3976584a06816c0', 'f8fea0db4a644234a23959a95e1b062f', '2018-04-11 22:15:51');

-- ----------------------------
-- Table structure for sp_system
-- ----------------------------
DROP TABLE IF EXISTS `sp_system`;
CREATE TABLE `sp_system` (
  `id` char(32) NOT NULL COMMENT '主键',
  `title` varchar(32) NOT NULL COMMENT '网站标题',
  `subtitle` varchar(80) NOT NULL COMMENT '副标题',
  `website` varchar(200) NOT NULL COMMENT '网站主页',
  `logo_url` varchar(200) NOT NULL COMMENT '网站Logo地址',
  `copyright` varchar(120) NOT NULL COMMENT '版权信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统基本信息';

-- ----------------------------
-- Records of sp_system
-- ----------------------------
INSERT INTO `sp_system` VALUES ('cc5172b4918546328542ceab45163e44', '后台管理系统', '后台管理系统', 'http://www.team-union.com/index', '/2018/04/11/fSJ9cfF9pJEKur2vujn.jpg', '版权所有 © 2017-2018 豫ICP备15021339号-1');

-- ----------------------------
-- Table structure for sp_system_app
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_app`;
CREATE TABLE `sp_system_app` (
  `id` char(32) NOT NULL COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `icon` varchar(50) NOT NULL COMMENT '图标',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统应用';

-- ----------------------------
-- Records of sp_system_app
-- ----------------------------
INSERT INTO `sp_system_app` VALUES ('0069e3f00f684e6284756d0d7bb0c743', '业务菜单', 'fa fa-sitemap', '10');
INSERT INTO `sp_system_app` VALUES ('53ba97935d824733856e4f3655883039', '用户权限', 'fa fa-users', '20');
INSERT INTO `sp_system_app` VALUES ('f5683d5afb22403bac8b7cb83ce04689', '系统管理', 'fa fa-server', '30');

-- ----------------------------
-- Table structure for sp_system_authword
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_authword`;
CREATE TABLE `sp_system_authword` (
  `id` char(32) NOT NULL COMMENT '主键',
  `menu_id` char(32) NOT NULL COMMENT '对应菜单',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(80) NOT NULL COMMENT '编码',
  `desc` varchar(100) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限字';

-- ----------------------------
-- Records of sp_system_authword
-- ----------------------------
INSERT INTO `sp_system_authword` VALUES ('326a684e128a48ada902260d2d8946d2', 'e26663b00591407f8f441a18aca3e96a', '立即执行', 'authword:run', '&#40;单次&#41;立即执行任务');
INSERT INTO `sp_system_authword` VALUES ('3d8a097ce274432d9343cff371729160', 'e26663b00591407f8f441a18aca3e96a', '启动任务', 'authword:start', '启动任务');
INSERT INTO `sp_system_authword` VALUES ('40cdfadd18fc4542a7f283f5348db46a', 'e26663b00591407f8f441a18aca3e96a', '暂停任务', 'authword:stop', '暂停任务');
INSERT INTO `sp_system_authword` VALUES ('b7f0e586086b4a7e9c85e5742cdd6513', 'e26663b00591407f8f441a18aca3e96a', '修改权限字', 'authword:edit', '修改权限字');

-- ----------------------------
-- Table structure for sp_system_file
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_file`;
CREATE TABLE `sp_system_file` (
  `id` char(32) NOT NULL COMMENT '主键',
  `original_name` varchar(100) NOT NULL COMMENT '文件原始名称',
  `path` varchar(100) NOT NULL COMMENT '文件访问路径',
  `type` varchar(30) NOT NULL COMMENT '文件类型',
  `size` bigint(20) NOT NULL COMMENT '文件大小',
  `desc` varchar(255) NOT NULL COMMENT '文件描述',
  `upload_user_id` char(32) NOT NULL,
  `upload_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统文件（内部上传）';

-- ----------------------------
-- Records of sp_system_file
-- ----------------------------
INSERT INTO `sp_system_file` VALUES ('18c4fc403bf740b3acac641199ddb68f', '1491036176303.jpg', '/2018/04/10/bv6N4E2ujuHzgR80EUj.jpg', 'image/jpeg (.jpg)', '236631', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('1daa03d25e7c4def91aa9769a596578c', 'Preview.png', '/2018/04/06/jGYPNnl6H9pyrKIycbX.png', 'image/png (.png)', '547456', 'ProductKind', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('20a1738aa33e47cc9dd6113aa1e3e782', '127.0.0.1_82_index.do.png', '/2018/04/06/J20QGZYK9ldvJ95rZ2G.png', 'image/png (.png)', '14317', 'ProductKind', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('2244cfe209884ccf8aaab58d6f865100', '20180119210924.png', '/2018/04/11/ivclvNtmxUKCIAfuPM2.png', 'image/png (.png)', '112369', 'ProductPic', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('227395787b024d4dbec5fc676456d886', 'user_photo.jpg', '/2018/04/06/SonxWpC3ISH3CzhQ3nf.jpg', 'image/jpeg (.jpg)', '12108', 'SystemLogo', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('2ee46877dfe041c39b715899bf448d37', 'Picture_09_Village.jpg', '/2018/04/04/uSoHlOqklumXHKGknT4.jpg', 'image/jpeg (.jpg)', '981064', 'ProductKind', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('2febb0c906c84c6d8586d5d06e803b5f', '9、设备管理.JPG', '/2018/04/10/rVhXimqXrDFpxwztKW9.jpg', 'image/jpeg (.jpg)', '194559', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('3119fb9aa66d496cabf1eb1e79467ae1', '万科北戴河终调.docx', '/2018/04/06/dVcNP4Eqp54s7HxmXIm.docx', '(.docx)', '29443', 'ProductDoc', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('3edc6218daa54b74b7cf3bc1e7cb40ba', 'Picture_06_Snow.jpg', '/2018/04/06/Xiu797E5D5LsBHq3nxo.jpg', 'image/jpeg (.jpg)', '668436', 'ProductPic', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('410deb0881ba43aa9f95874f3977352f', '组态画面-运行.JPG', '/2018/04/10/iEhfAGp0LAZzri0fi9D.jpg', 'image/jpeg (.jpg)', '116585', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('44819864f9b34d1cbc0d5b10960210ed', 'boncake可能遇到的技术问题.doc', '/2018/04/11/xjlF7WAjBoOIY2PnMZj.doc', '(.doc)', '10240', 'ProductOperationManual', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('44e3d5d528964d7fa40ea050038404a0', '组态画面-报警.JPG', '/2018/04/10/9KNMuI2Ve0dO1n0gfyk.jpg', 'image/jpeg (.jpg)', '83467', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('49b99f5441ba40ad8dd9c47c1784d2ef', '组态画面-运行.JPG', '/2018/04/10/gFVBRiI0zX3cia6v1uq.jpg', 'image/jpeg (.jpg)', '116585', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('5503b99c17ea4201a3f7ff47b1996036', 'Picture_05_Stream.jpg', '/2018/04/04/i4DrkxjJTApGfuPKOQq.jpg', 'image/jpeg (.jpg)', '803134', 'ProductType', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('6c469761eeb843d6ad63bfaea6e7d699', '日志字段名称.txt', '/2018/04/06/Sogxa3CUwugQVLq5dKK.txt', 'text/plain (.txt)', '4208', 'ProductOperationManual', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('6c6f6d225af342b49a4caed5cc1b0b38', 'Picture_04_Crest.jpg', '/2018/04/04/flHkvKUOyPtlfJYneSR.jpg', 'image/jpeg (.jpg)', '544960', 'ProductKind', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('6de8356cf4c741fcb9e2e76d31effc34', 'Picture_24_Feather.jpg', '/2018/04/16/3l4R3QBTKnf1znUbg6v.jpg', 'image/jpeg (.jpg)', '396901', 'ProjectDrawing', '3e8657b0e9b84023a3c16af91e13e620', '2018-04-16 20:13:23');
INSERT INTO `sp_system_file` VALUES ('710e6f7199114b40a47a64bfb4eecbf7', '26174938f5bbf914869655.jpg', '/2018/04/12/p2rchyemsrFVVNvJZnf.jpg', 'image/jpeg (.jpg)', '147665', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('742145191cb44a03b44ac3265d521864', '小程序.zip', '/2018/04/16/c7o71a5OpSrijOL4XP9.zip', '(.zip)', '1050243', 'ProjectDrawing', '3e8657b0e9b84023a3c16af91e13e620', '2018-04-16 20:15:07');
INSERT INTO `sp_system_file` VALUES ('783e87ef27ef47b59e153082eb926818', '11、用户权限管理.JPG', '/2018/04/10/r27jlyiGEMXqY2Ss2Gm.jpg', 'image/jpeg (.jpg)', '110650', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('7959ec1ae02c48238c87318629d42b8b', '11、用户权限管理.JPG', '/2018/04/10/cAShY2gdjyHdieIOeiL.jpg', 'image/jpeg (.jpg)', '110650', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('7e5ecb0ef5cb447289eac101d349ab90', '自动客服接口-V.1.2.doc', '/2018/04/06/udQifqnKrOXfQ3EG3NV.doc', '(.doc)', '95744', 'ProductDoc', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('85304ce6add240ae89f17ed3030f3b4c', 'Picture_24_Feather.jpg', '/2018/04/04/sVPr3RGwbAwH0u7bodO.jpg', 'image/jpeg (.jpg)', '396901', 'SystemLogo', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('885b1c7d73c44bd1874f6e13ca9c50ab', '4、项目地图.JPG', '/2018/04/11/koGQfxn5rF2xpHLDN05.jpg', 'image/jpeg (.jpg)', '124329', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('91eac0d5943c45af848061464284f197', 'Preview.png', '/2018/04/06/VUNB4Ig2QArAu06Vu7M.png', 'image/png (.png)', '547456', 'ProductKind', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('987dd670dfd748d197b978389e104591', 'IMG_20170306_100433.jpg', '/2018/04/10/c0qQ7EvnGJJlXI17BkW.jpg', 'image/jpeg (.jpg)', '2308260', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('9d4f90e5608c4f5ca95996307c695dbc', 'icon_collect.png', '/2018/04/06/Up6JWaAmYMRj7WJWt7e.png', 'image/png (.png)', '1236', 'ProductPic', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('a5b0e691df7c47ccb637e9c758c097b3', '面团房产话术模版.doc', '/2018/04/06/ywnLXJQo0JtsNairRRz.doc', '(.doc)', '73478', 'ProductOperationManual', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('b0ae28d5a1cd4ec385c8ea36197cdbbf', 'boncake可能遇到的技术问题.doc', '/2018/04/11/cuaYkEoRZm4xk1ffCju.doc', '(.doc)', '10240', 'ProductDoc', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('bca50411219e4e68ba520f6f9e09c073', '自动客服接口-V.1.2.doc', '/2018/04/06/vIt4CKrfmB4nrzxPZgE.doc', '(.doc)', '95744', 'ProductDoc', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('c4cff22da17749fda3ec75a4ecd2c004', 'Picture_12_Building.jpg', '/2018/04/06/DYgo4rDOoECgTPFEUuB.jpg', 'image/jpeg (.jpg)', '500021', 'ProductPic', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('c9009411f25e411caa1bb160a5868c85', '1、登录页面-支持多用户.JPG', '/2018/04/11/fSJ9cfF9pJEKur2vujn.jpg', 'image/jpeg (.jpg)', '208908', 'SystemLogo', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('cad9bc4135b242c3bb5b7e102ab14845', 'ic_menu_shoping_nor.png', '/2018/04/06/7C2eHBNpSrZeIv2c9S2.png', 'image/png (.png)', '1394', 'ProductPic', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('d0142f2cf57e4cc287d64c1e7470d508', '组态画面-报警.JPG', '/2018/04/10/znd1FzQA17Mf08iqY4P.jpg', 'image/jpeg (.jpg)', '83467', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('d8cccf9832124040a5a7beebc53ba4f4', 'Picture_06_Snow.jpg', '/2018/04/04/PtQO2snBniOUbcLWUEz.jpg', 'image/jpeg (.jpg)', '668436', 'ProductType', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('df14e3cc3c7c4f66ade739906c9ab5e8', '20180119210924.png', '/2018/04/11/3zKtqBumtnQRH8itoLc.png', 'image/png (.png)', '112369', 'ProjectDrawing', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');
INSERT INTO `sp_system_file` VALUES ('fb1dda1546a646fcbe6b78b623cd4bee', 'icon_collect_checked.png', '/2018/04/06/gz8RWAnis4Qs9Yy5FBi.png', 'image/png (.png)', '1579', 'ProductPic', '3E8657B0E9B84023A3C16AF91E13E620', '2018-04-14 22:33:26');

-- ----------------------------
-- Table structure for sp_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_menu`;
CREATE TABLE `sp_system_menu` (
  `id` char(32) NOT NULL COMMENT '主键',
  `pid` char(32) NOT NULL COMMENT '父级ID',
  `app_id` char(32) NOT NULL COMMENT '应用ID',
  `sort_no` int(11) NOT NULL COMMENT '排序编号',
  `text` varchar(32) NOT NULL COMMENT '标题名称',
  `icon` varchar(48) NOT NULL COMMENT '图标',
  `url` varchar(80) NOT NULL COMMENT '站内链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Records of sp_system_menu
-- ----------------------------
INSERT INTO `sp_system_menu` VALUES ('01fc3b9b6d4e40468bda6f8f39c2c59b', '0', '0069e3f00f684e6284756d0d7bb0c743', '12', '业务申请', 'fa fa-suitcase', '');
INSERT INTO `sp_system_menu` VALUES ('0939ca703e20483c998ae72ffee94ff8', 'b3cfafacb12f4a298983651794eca98d', 'f5683d5afb22403bac8b7cb83ce04689', '20', '系统字典', 'fa fa-asterisk', 'dictionary/index');
INSERT INTO `sp_system_menu` VALUES ('0d255344a93349f8a0649ff8b2245899', 'cf97195e8c214c3986dcbb8a17d86c29', '0069e3f00f684e6284756d0d7bb0c743', '5', '厂家产品', 'fa fa-gg-circle', 'product/index');
INSERT INTO `sp_system_menu` VALUES ('11ed187b6a254ff485fa8a97a13d8c67', 'f8aedd4107be4820bed3ba9cabcd5f84', '53ba97935d824733856e4f3655883039', '10', '系统用户', 'fa fa-gg-circle', 'user/index');
INSERT INTO `sp_system_menu` VALUES ('1591cacecd964ed7b39fbd9836eb6773', 'b3cfafacb12f4a298983651794eca98d', 'f5683d5afb22403bac8b7cb83ce04689', '30', '系统权限字', 'fa fa-caret-right', 'system/authword');
INSERT INTO `sp_system_menu` VALUES ('1907f6a394fe479484bc741a4b2e8824', 'cf97195e8c214c3986dcbb8a17d86c29', '0069e3f00f684e6284756d0d7bb0c743', '20', '产品种类', 'fa fa-gg-circle', 'product/kind/index');
INSERT INTO `sp_system_menu` VALUES ('1af2bd180c514cf3b0217dc6958c14d4', '0', '0069e3f00f684e6284756d0d7bb0c743', '40', '小程序', 'fa fa-gg-circle', '');
INSERT INTO `sp_system_menu` VALUES ('2f3ff011daef4f57b3ea0135284388a4', '0', '0069e3f00f684e6284756d0d7bb0c743', '5', '项目管理', 'fa fa-bank', '');
INSERT INTO `sp_system_menu` VALUES ('332711f151f848559a2421eceddbe4a8', 'de47a7717b774dcd9c8aebdf4124651b', 'f5683d5afb22403bac8b7cb83ce04689', '10', '文件资源', 'fa fa-caret-right', 'systemFile/index');
INSERT INTO `sp_system_menu` VALUES ('3d858b78f4d94e62a208f9db57f72672', 'c5ad6f30dcc243959a529f67a1d56e78', '0069e3f00f684e6284756d0d7bb0c743', '20', '客户', 'fa fa-users', 'user/customer/index');
INSERT INTO `sp_system_menu` VALUES ('3ead7806d81448509a6103d0b485d51d', '6e749c60ff1b4a8f80496ae367af3fc8', '53ba97935d824733856e4f3655883039', '20', '角色授权', 'fa fa-caret-right', 'role/auth');
INSERT INTO `sp_system_menu` VALUES ('42d0c74564274ca081096ffb895b3caa', '1af2bd180c514cf3b0217dc6958c14d4', '0069e3f00f684e6284756d0d7bb0c743', '10', '横幅轮播', 'fa fa-gg-circle', 'mp/banner/index');
INSERT INTO `sp_system_menu` VALUES ('516cc0f2a2814c40b716bc8e15f6e7f2', 'c5ad6f30dcc243959a529f67a1d56e78', '0069e3f00f684e6284756d0d7bb0c743', '10', '城市合伙人', 'fa fa-users', 'user/partner/index');
INSERT INTO `sp_system_menu` VALUES ('57e5cb7728614328a07d96c407f1ca96', '6e749c60ff1b4a8f80496ae367af3fc8', '53ba97935d824733856e4f3655883039', '10', '角色管理', 'fa fa-caret-right', 'role/index');
INSERT INTO `sp_system_menu` VALUES ('588325bea4ee45bfbb26d26c4602571f', '2f3ff011daef4f57b3ea0135284388a4', '0069e3f00f684e6284756d0d7bb0c743', '14', '系统订单', 'fa fa-anchor', 'project/order/index');
INSERT INTO `sp_system_menu` VALUES ('61f16f2fad494fb69e8b49a0f55a913e', 'a73ee83f7c1042c7aff9dfa231ec3e6d', '0069e3f00f684e6284756d0d7bb0c743', '10', '公司企业', 'fa fa-asterisk', 'company/index');
INSERT INTO `sp_system_menu` VALUES ('6874b4550c04488da3d1fc4acaf9a217', 'de47a7717b774dcd9c8aebdf4124651b', 'f5683d5afb22403bac8b7cb83ce04689', '20', '基础城市信息', 'fa fa-anchor', 'basic/city/index');
INSERT INTO `sp_system_menu` VALUES ('6e749c60ff1b4a8f80496ae367af3fc8', '0', '53ba97935d824733856e4f3655883039', '20', '用户权限', 'fa fa-lock', '');
INSERT INTO `sp_system_menu` VALUES ('80bf1cab24f74b67a2c04141fc9d7e3d', 'b3cfafacb12f4a298983651794eca98d', 'f5683d5afb22403bac8b7cb83ce04689', '10', '基本配置', 'fa fa-caret-right', 'system/config');
INSERT INTO `sp_system_menu` VALUES ('a68d10b6cbf54600b079a34ba173b90e', 'b3cfafacb12f4a298983651794eca98d', 'f5683d5afb22403bac8b7cb83ce04689', '40', '系统应用菜单', 'fa fa-caret-right', 'system/menu');
INSERT INTO `sp_system_menu` VALUES ('a73ee83f7c1042c7aff9dfa231ec3e6d', '0', '0069e3f00f684e6284756d0d7bb0c743', '35', '企业管理', 'fa fa-bank', '');
INSERT INTO `sp_system_menu` VALUES ('a90c7d9e86b54d9b927e3dccd84813ac', 'cf97195e8c214c3986dcbb8a17d86c29', '0069e3f00f684e6284756d0d7bb0c743', '30', '产品类型', 'fa fa-gg-circle', 'product/type/index');
INSERT INTO `sp_system_menu` VALUES ('ab81884d878444bc8449efa6aec7a2e1', '01fc3b9b6d4e40468bda6f8f39c2c59b', '0069e3f00f684e6284756d0d7bb0c743', '10', '工人资质申请', 'fa fa-anchor', 'worker/aptitude/index');
INSERT INTO `sp_system_menu` VALUES ('b3cfafacb12f4a298983651794eca98d', '0', 'f5683d5afb22403bac8b7cb83ce04689', '10', '系统管理', 'fa fa-server', '');
INSERT INTO `sp_system_menu` VALUES ('b50f8e998faa40e2841ac4d563a5ba87', '2f3ff011daef4f57b3ea0135284388a4', '0069e3f00f684e6284756d0d7bb0c743', '10', '项目管理', 'fa fa-bank', 'project/manage/index');
INSERT INTO `sp_system_menu` VALUES ('bef8b286b85c40c3ba0829a01416e100', 'cf97195e8c214c3986dcbb8a17d86c29', '0069e3f00f684e6284756d0d7bb0c743', '10', '产品线索', 'fa fa-gg-circle', 'product/clue/index');
INSERT INTO `sp_system_menu` VALUES ('c05923b4168e446984956a7056facaf7', '1af2bd180c514cf3b0217dc6958c14d4', '0069e3f00f684e6284756d0d7bb0c743', '20', 'Channel', 'fa fa-gg-circle', 'mp/channel/index');
INSERT INTO `sp_system_menu` VALUES ('c5ad6f30dcc243959a529f67a1d56e78', '0', '0069e3f00f684e6284756d0d7bb0c743', '20', '用户管理', 'fa fa-user', '');
INSERT INTO `sp_system_menu` VALUES ('cf97195e8c214c3986dcbb8a17d86c29', '0', '0069e3f00f684e6284756d0d7bb0c743', '30', '产品管理', 'fa fa-arrows', '');
INSERT INTO `sp_system_menu` VALUES ('de47a7717b774dcd9c8aebdf4124651b', '0', 'f5683d5afb22403bac8b7cb83ce04689', '20', '系统资源', 'fa fa-server', '');
INSERT INTO `sp_system_menu` VALUES ('df23fc6d09dc4d729c733358c46a8eb8', 'de47a7717b774dcd9c8aebdf4124651b', 'f5683d5afb22403bac8b7cb83ce04689', '30', '城市基础服务费', 'fa fa-asterisk', 'basic/cost/index');
INSERT INTO `sp_system_menu` VALUES ('e26663b00591407f8f441a18aca3e96a', 'b3cfafacb12f4a298983651794eca98d', 'f5683d5afb22403bac8b7cb83ce04689', '50', '定时任务', 'fa fa-caret-right', 'timedTask/index');
INSERT INTO `sp_system_menu` VALUES ('f7506595d98441f884efee63bf004c58', 'c5ad6f30dcc243959a529f67a1d56e78', '0069e3f00f684e6284756d0d7bb0c743', '30', '劳务工人', 'fa fa-users', 'user/worker/index');
INSERT INTO `sp_system_menu` VALUES ('f8aedd4107be4820bed3ba9cabcd5f84', '0', '53ba97935d824733856e4f3655883039', '10', '用户管理', 'fa fa-user', '');
INSERT INTO `sp_system_menu` VALUES ('f8fea0db4a644234a23959a95e1b062f', '2f3ff011daef4f57b3ea0135284388a4', '0069e3f00f684e6284756d0d7bb0c743', '12', '新增项目', 'fa fa-bank', 'project/manage/create');

-- ----------------------------
-- Table structure for sp_system_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_user`;
CREATE TABLE `sp_system_user` (
  `id` char(32) NOT NULL COMMENT '主键',
  `nick_name` varchar(32) NOT NULL COMMENT '用户名称',
  `login_name` varchar(32) NOT NULL COMMENT '登录名称（唯一）',
  `phone_no` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(128) NOT NULL COMMENT '登录密码',
  `info` varchar(200) NOT NULL COMMENT '备注',
  `status` varchar(5) NOT NULL COMMENT '状态（Y:正常，L:锁定，N:禁用）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sp_system_user
-- ----------------------------
INSERT INTO `sp_system_user` VALUES ('3e8657b0e9b84023a3c16af91e13e620', '司仲夏', 'sizhongxia', '18518436862', '2410042aea633697cff3e2e19a7dd726', '管理员', 'Y', '2017-12-27 11:29:22', '2018-03-30 16:36:17', '2018-04-16 19:33:17');
INSERT INTO `sp_system_user` VALUES ('73d829e6bbac4486a171c95dda609fdf', 'ss', 'ss', '18518436863', '2410042aea633697cff3e2e19a7dd726', '无', 'N', '2018-03-30 12:14:59', '2018-03-30 16:31:55', '2018-03-30 12:14:59');
INSERT INTO `sp_system_user` VALUES ('dd97288f1c5347629d15b84221892d9f', '1', '1', '1', '2410042aea633697cff3e2e19a7dd726', '1', 'N', '2018-03-14 16:31:22', '2018-03-29 20:24:42', '2018-03-14 16:43:41');

-- ----------------------------
-- Table structure for sp_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_system_user_role`;
CREATE TABLE `sp_system_user_role` (
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `role_id` char(32) NOT NULL COMMENT '角色ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联授权';

-- ----------------------------
-- Records of sp_system_user_role
-- ----------------------------
INSERT INTO `sp_system_user_role` VALUES ('3e8657b0e9b84023a3c16af91e13e620', 'b3207d8f6d134f80b3976584a06816c0', '2018-03-30 13:01:34');
INSERT INTO `sp_system_user_role` VALUES ('3e8657b0e9b84023a3c16af91e13e620', 'b4e3a62b31ef4699a0d13774acb39e72', '2018-03-30 13:01:34');
INSERT INTO `sp_system_user_role` VALUES ('73d829e6bbac4486a171c95dda609fdf', 'b4e3a62b31ef4699a0d13774acb39e72', '2018-03-30 13:06:44');
INSERT INTO `sp_system_user_role` VALUES ('dd97288f1c5347629d15b84221892d9f', 'b4e3a62b31ef4699a0d13774acb39e72', '2018-03-30 16:31:30');

-- ----------------------------
-- Table structure for sp_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_user`;
CREATE TABLE `sp_user` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_name` varchar(20) NOT NULL,
  `head_pic_url` varchar(200) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `gender` int(11) NOT NULL COMMENT '性别（1:男，0:女）',
  `age` int(11) NOT NULL COMMENT '年龄',
  `province` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `county` varchar(20) NOT NULL COMMENT '区县',
  `address_detail` varchar(200) NOT NULL COMMENT '详细地址',
  `account_status` char(1) NOT NULL COMMENT '账号状态（Y:正常，N:禁用）',
  `user_type` char(1) NOT NULL COMMENT '用户类别（P:城市合伙人，W:劳务工人，C:客户）',
  `regist_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `delete_flag` char(1) NOT NULL COMMENT '账号状态（Y:已移除，N:未移除）',
  `delete_time` datetime NOT NULL COMMENT '移除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基础信息表';

-- ----------------------------
-- Records of sp_user
-- ----------------------------
INSERT INTO `sp_user` VALUES ('21c8de2477374851a5f320b7df67d83e', '司仲夏1', '', '18518436863', '', '1', '26', '410000', '411400', '411426', '车站镇李合楼村', 'Y', 'P', '2018-04-01 14:12:58', '2018-04-14 22:17:36', 'N', '2018-04-01 14:12:58');
INSERT INTO `sp_user` VALUES ('2e32085c5e8a4b629546a84547b97e01', '12', '', '1', '', '1', '0', '450000', '450200', '', '', 'Y', 'P', '2018-04-10 17:06:52', '2018-04-10 17:06:52', 'N', '2018-04-10 17:06:52');
INSERT INTO `sp_user` VALUES ('30fb9f90b8c744b7bf65d2ce1d49c13e', 'sss', '', '18518436862', '', '1', '0', '', '', '', '', 'Y', 'C', '2018-04-01 19:53:06', '2018-04-14 22:17:36', 'N', '2018-04-01 19:53:06');
INSERT INTO `sp_user` VALUES ('5b0c97f9e157483e86e76b316f0be02f', '赵通', '', '1234567890', '', '1', '0', '', '', '', '', 'A', 'C', '2018-04-07 21:20:04', '2018-04-07 21:20:04', 'N', '2018-04-07 21:20:04');
INSERT INTO `sp_user` VALUES ('67a130a5073b4516838d19fa87c863c4', '12', '', 'q', '', '1', '0', '360000', '360700', '', '', 'Y', 'P', '2018-04-10 17:12:42', '2018-04-10 17:12:42', 'N', '2018-04-10 17:12:42');
INSERT INTO `sp_user` VALUES ('68da8a1b0126413b9d19512bb4e522fe', 'as', '', '12345', '', '1', '0', '340000', '610900', '', '', 'Y', 'P', '2018-04-10 21:49:38', '2018-04-10 21:49:38', 'N', '2018-04-10 21:49:38');
INSERT INTO `sp_user` VALUES ('7613898d90994c279744da176b34c5f2', '司仲夏更改姓名试试', '添加个头像', '16518436864', '', '1', '26', '110000', '110100', '110101', '北京朝阳兴隆家园', 'Y', 'C', '2018-04-01 19:54:05', '2018-04-14 22:17:36', 'N', '2018-04-01 19:54:05');
INSERT INTO `sp_user` VALUES ('850c87045dea4519853393fc2c1b5585', '合伙', '', '1234567899', '', '1', '0', '', '', '', '', 'Y', 'P', '2018-04-09 23:08:21', '2018-04-09 23:08:21', 'N', '2018-04-09 23:08:21');
INSERT INTO `sp_user` VALUES ('b1a2b1b2134a41bea9c400f7dec0a830', '司仲夏', '', '18518436811', '', '0', '22', '110000', '110200', '110229', '城市', 'Y', 'W', '2018-04-02 21:13:45', '2018-04-14 22:17:36', 'N', '2018-04-02 21:13:45');
INSERT INTO `sp_user` VALUES ('c0d9ed1d112d498394e476f463b31005', 'asffff', '', '12345', '', '1', '0', '360000', '360700', '', '', 'Y', 'P', '2018-04-10 21:49:54', '2018-04-10 21:49:54', 'N', '2018-04-10 21:49:54');
INSERT INTO `sp_user` VALUES ('d2b1e69a8a6045c1938f76d659b59a57', '赵通', '', '1234567890', '', '1', '0', '', '', '', '', 'A', 'C', '2018-04-07 21:20:04', '2018-04-07 21:20:04', 'N', '2018-04-07 21:20:04');
INSERT INTO `sp_user` VALUES ('f3702867854d46b3a3f1e241522af003', 'aa', '', 'aa', '', '1', '0', '', '', '', '', 'Y', 'C', '2018-04-01 19:31:20', '2018-04-14 22:17:36', 'N', '2018-04-01 19:31:20');
INSERT INTO `sp_user` VALUES ('f6a33378b3cb48208912cffa6b5ff081', '1234', '', '1234', '', '1', '0', '510000', '511300', '', '', 'Y', 'P', '2018-04-10 21:45:58', '2018-04-10 21:45:58', 'N', '2018-04-10 21:45:58');

-- ----------------------------
-- Table structure for sp_user_customer
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_customer`;
CREATE TABLE `sp_user_customer` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `company_id` char(32) NOT NULL COMMENT '关联平台公司基础库',
  `industry` varchar(50) NOT NULL COMMENT '行业',
  `grade_level` decimal(2,1) NOT NULL DEFAULT '3.5' COMMENT '用户评分',
  `bond_status` char(1) NOT NULL COMMENT '信誉保证金状态（Y:已缴纳，N:未缴纳）',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Records of sp_user_customer
-- ----------------------------
INSERT INTO `sp_user_customer` VALUES ('3cdae02806384f4b8a711d1ac6f4bad0', '7613898d90994c279744da176b34c5f2', '87da6e544a7c471db856bb1c4f855477', 'HY_XXCY', '3.0', 'N', '2018-04-01 19:54:05', '2018-04-14 22:37:00');
INSERT INTO `sp_user_customer` VALUES ('89c8ffa26d5948b09f80d9472d779aa5', 'd2b1e69a8a6045c1938f76d659b59a57', '87da6e544a7c471db856bb1c4f855477', '', '5.0', 'N', '2018-04-07 21:20:05', '2018-04-14 22:35:59');
INSERT INTO `sp_user_customer` VALUES ('a4de6e3510164e5cb5989460736ed8d2', '5b0c97f9e157483e86e76b316f0be02f', '87da6e544a7c471db856bb1c4f855477', '', '5.0', 'N', '2018-04-07 21:20:04', '2018-04-14 22:35:59');

-- ----------------------------
-- Table structure for sp_user_identity_card
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_identity_card`;
CREATE TABLE `sp_user_identity_card` (
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `identity_card` varchar(30) NOT NULL COMMENT '身份证号',
  `identity_card_front_pic` varchar(200) NOT NULL COMMENT '身份证正面图片',
  `identity_card_back_pic` varchar(200) NOT NULL COMMENT '身份证背面图片',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `audit_state` char(1) NOT NULL COMMENT '审核状态（Y:审核通过，N:审核未通过，D:审核中，W:未认证）',
  `audit_time` datetime NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户身份证信息表';

-- ----------------------------
-- Records of sp_user_identity_card
-- ----------------------------

-- ----------------------------
-- Table structure for sp_user_partner
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_partner`;
CREATE TABLE `sp_user_partner` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `is_platform` char(1) NOT NULL COMMENT '是否是平台默认城市合伙人（Y:是，N:不是）',
  `apply_reason` varchar(200) NOT NULL COMMENT '申请理由',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `apply_status` char(1) NOT NULL COMMENT '账号状态（Y:已通过，N:未通过，D:申请中）',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市合伙人';

-- ----------------------------
-- Records of sp_user_partner
-- ----------------------------
INSERT INTO `sp_user_partner` VALUES ('021693b8065649d49e97697817176524', '2e32085c5e8a4b629546a84547b97e01', 'N', '111', '2018-04-10 17:06:52', 'D', '2018-04-10 17:06:52', '2018-04-10 17:06:52');
INSERT INTO `sp_user_partner` VALUES ('0676006b5568405690657fa8d07837fd', '67a130a5073b4516838d19fa87c863c4', 'N', '1234', '2018-04-10 17:12:42', 'D', '2018-04-10 17:12:42', '2018-04-10 17:12:42');
INSERT INTO `sp_user_partner` VALUES ('2d4bf609fddf4986b1b2208b4f614011', '68da8a1b0126413b9d19512bb4e522fe', 'N', 'qw', '2018-04-10 21:49:39', 'D', '2018-04-10 21:49:39', '2018-04-10 21:49:39');
INSERT INTO `sp_user_partner` VALUES ('45b99ae6182a4a3cb688c23d2fda29fa', 'c0d9ed1d112d498394e476f463b31005', 'N', 'qw', '2018-04-10 21:49:55', 'D', '2018-04-10 21:49:55', '2018-04-10 21:49:55');
INSERT INTO `sp_user_partner` VALUES ('6c1f63c01d5a4cab940a4ffab688e1b7', 'f6a33378b3cb48208912cffa6b5ff081', 'N', 'asd', '2018-04-10 21:45:58', 'D', '2018-04-10 21:45:58', '2018-04-10 21:45:58');
INSERT INTO `sp_user_partner` VALUES ('baaabd8a5f4a448088a84b9abf593d2e', '21c8de2477374851a5f320b7df67d83e', 'Y', '1234', '2018-04-01 14:12:58', 'D', '2018-04-01 14:12:58', '2018-04-14 22:36:48');
INSERT INTO `sp_user_partner` VALUES ('dcc15c7a22c74bda8be6abc4cca3f5e6', '850c87045dea4519853393fc2c1b5585', 'N', '试试', '2018-04-09 23:09:00', 'D', '2018-04-09 23:09:00', '2018-04-09 23:09:00');

-- ----------------------------
-- Table structure for sp_user_worker
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_worker`;
CREATE TABLE `sp_user_worker` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `worker_no` int(11) NOT NULL COMMENT '工号ID',
  `worker_type` varchar(50) NOT NULL COMMENT '工种（字典）',
  `grade_level` decimal(2,1) NOT NULL DEFAULT '3.5' COMMENT '用户评分',
  `bond_status` char(1) NOT NULL COMMENT '施工保证金缴纳状态（Y:已缴纳，N:未缴纳）',
  `balance` decimal(10,2) NOT NULL COMMENT '余额',
  `remarks` varchar(500) NOT NULL COMMENT '描述',
  `last_order_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后接单时间',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人';

-- ----------------------------
-- Records of sp_user_worker
-- ----------------------------
INSERT INTO `sp_user_worker` VALUES ('98610eae96534f879ffef44511f991f8', 'b1a2b1b2134a41bea9c400f7dec0a830', '294151', '', '3.0', 'N', '0.00', '无', '2018-04-14 22:37:36', '2018-04-02 21:13:45', '2018-04-14 22:37:36');

-- ----------------------------
-- Table structure for sp_user_wxoauth
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_wxoauth`;
CREATE TABLE `sp_user_wxoauth` (
  `id` char(32) NOT NULL COMMENT '主键ID',
  `user_id` char(32) NOT NULL COMMENT '用户ID',
  `open_id` varchar(50) NOT NULL COMMENT '微信OPENID',
  `nick_name` varchar(50) NOT NULL COMMENT '微信昵称',
  `avatar_url` varchar(200) NOT NULL COMMENT '头像',
  `gender` int(11) NOT NULL COMMENT '性别',
  `city` varchar(50) NOT NULL COMMENT '所在城市',
  `country` varchar(50) NOT NULL COMMENT '国家',
  `status` char(1) NOT NULL COMMENT '状态（Y:正常，N:取消绑定）',
  `create_time` datetime NOT NULL COMMENT '关联时间',
  `unbind_time` datetime NOT NULL COMMENT '取消绑定时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户oAuth验证登录';

-- ----------------------------
-- Records of sp_user_wxoauth
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_aptitude
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_aptitude`;
CREATE TABLE `sp_worker_aptitude` (
  `id` char(32) NOT NULL,
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `product_id` char(32) NOT NULL COMMENT '学习产品关联ID',
  `model` varchar(50) NOT NULL COMMENT '产品型号',
  `apply_info` varchar(200) NOT NULL COMMENT '申请说明',
  `apply_status` char(1) NOT NULL COMMENT '申请状态（Y:申请通过，N:申请驳回，D:待处理）',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `worker_id` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人资质申请';

-- ----------------------------
-- Records of sp_worker_aptitude
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_balance_log`;
CREATE TABLE `sp_worker_balance_log` (
  `id` char(32) NOT NULL COMMENT '主键',
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `order_no` varchar(40) NOT NULL COMMENT '订单编号',
  `bef_balance` decimal(10,2) NOT NULL COMMENT '之前余额',
  `change_money` decimal(10,2) NOT NULL COMMENT '变更金额',
  `aft_balance` decimal(10,2) NOT NULL COMMENT '之后余额',
  `status` char(1) NOT NULL COMMENT '变更状态（Y:已入账，N:已取消，D:未入账）',
  `remarks` varchar(200) NOT NULL COMMENT '提现备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `handle_time` datetime NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `worker_id` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人余额变更表';

-- ----------------------------
-- Records of sp_worker_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_cash_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_cash_log`;
CREATE TABLE `sp_worker_cash_log` (
  `id` char(32) NOT NULL COMMENT '主键',
  `cash_cost` decimal(10,2) NOT NULL COMMENT '提现金额',
  `serial_number` varchar(80) NOT NULL COMMENT '提现流水号',
  `cash_status` char(1) NOT NULL COMMENT '提现状态（Y:已到账，D:进行中，N:已撤销）',
  `cash_remarks` varchar(200) NOT NULL COMMENT '提现备注',
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `handle_time` datetime NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人提现记录表';

-- ----------------------------
-- Records of sp_worker_cash_log
-- ----------------------------

-- ----------------------------
-- Table structure for sp_worker_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_worker_order`;
CREATE TABLE `sp_worker_order` (
  `id` char(32) NOT NULL COMMENT '主键',
  `order_id` char(32) NOT NULL COMMENT '项目产品关联ID',
  `worker_id` char(32) NOT NULL COMMENT '工人ID',
  `order_source` char(1) NOT NULL COMMENT '订单来源类型（C:系统派单，W:劳务工人转接，P:平台转接，U:个人接单）',
  `source_id` char(32) NOT NULL COMMENT '来源关联ID',
  `reference_cost` decimal(10,2) NOT NULL COMMENT '参考人天费用',
  `order_status` char(1) NOT NULL COMMENT '订单状态（Y:已接收，P:已取消（转平台），W:已取消（转工人），D:待处理）',
  `destination_id` char(32) NOT NULL COMMENT '目标工人ID',
  `remarks` varchar(200) NOT NULL COMMENT '备注说明',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `worker_id` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='劳务工人项目关联订单';

-- ----------------------------
-- Records of sp_worker_order
-- ----------------------------
