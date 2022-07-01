-- ----------------------------
-- Table structure for position_period_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `position_period_snapshot`;
CREATE TABLE `position_period_snapshot`
(
    `id`               int NOT NULL AUTO_INCREMENT COMMENT '主键',
    `pid`              int           DEFAULT NULL COMMENT '持仓编号',
    `pname`            varchar(255)  DEFAULT NULL COMMENT '持仓名',
    `period`           int           DEFAULT NULL COMMENT '持仓周期',
    `cur_period_time`  datetime(6)   DEFAULT NULL COMMENT '持仓时间点',
    `initial_value`    double(10, 3) DEFAULT NULL COMMENT '持仓初始金额',
    `prev_s_code`      varchar(255)  DEFAULT NULL COMMENT '上期代码',
    `prev_s_name`      varchar(255)  DEFAULT NULL COMMENT '上期持仓股票名',
    `prev_s_cur_price` double(10, 3) DEFAULT NULL COMMENT '上期持仓现期价格',
    `prev_s_number`    int           DEFAULT NULL COMMENT '上期持仓股票数量',
    `cur_p_value`      double(10, 3) DEFAULT NULL COMMENT '持仓当期价值',
    `cur_p_rate`       double(10, 3) DEFAULT NULL COMMENT '持仓增长率',
    `cur_s_code`       varchar(255)  DEFAULT NULL COMMENT '持仓股票代码',
    `cur_s_name`       varchar(255)  DEFAULT NULL COMMENT '持仓股票名',
    `cur_s_price`      double(10, 3) DEFAULT NULL COMMENT '持仓股票当期价格',
    `cur_s_number`     int           DEFAULT NULL COMMENT '持仓股票数量',
    `insert_time`      datetime      DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    `update_time`      datetime      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb3;

-- ----------------------------
-- Records of position_period_snapshot
-- ----------------------------
BEGIN;
INSERT INTO `position_period_snapshot`
VALUES (1, 1, '4周回测+不择时', 0, '2022-06-24 00:00:00.000000', 10000.000, NULL, NULL, NULL, NULL, 10000.000, NULL, NULL,
        '空仓', NULL, NULL, '2022-06-26 19:14:19', '2022-06-27 20:34:24');
INSERT INTO `position_period_snapshot`
VALUES (2, 2, '3周回测+不择时', 0, '2022-06-24 15:00:00.000000', 10000.000, NULL, NULL, NULL, NULL, 10000.000, NULL, NULL,
        '空仓', NULL, NULL, '2022-06-26 19:21:43', '2022-06-27 20:34:34');
INSERT INTO `position_period_snapshot`
VALUES (3, 3, '4周回测+择时', 0, '2022-06-24 15:00:00.000000', 10000.000, NULL, NULL, NULL, NULL, 10000.000, NULL, NULL,
        '空仓', NULL, NULL, '2022-06-26 19:36:25', '2022-06-27 20:33:26');
INSERT INTO `position_period_snapshot`
VALUES (4, 4, '3周回测+择时', 0, '2022-06-24 15:00:00.000000', 10000.000, NULL, NULL, NULL, NULL, 10000.000, NULL, NULL,
        '空仓', NULL, NULL, '2022-06-26 19:38:45', '2022-06-27 20:33:28');
COMMIT;

-- ----------------------------
-- Table structure for stock_rank
-- ----------------------------
DROP TABLE IF EXISTS `stock_rank`;
CREATE TABLE `stock_rank`
(
    `id`         int                                                     NOT NULL AUTO_INCREMENT,
    `s_code`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '股票代码',
    `s_name`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '股票名',
    `period`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持仓周期',
    `back_week`  tinyint(1)                                              NULL DEFAULT NULL COMMENT '回测几周',
    `end_dt`     datetime                                                NULL DEFAULT NULL COMMENT '当期日期',
    `prev_dt`    datetime                                                NULL DEFAULT NULL COMMENT '上期日期',
    `end_price`  decimal(10, 4)                                          NULL DEFAULT NULL COMMENT '当期价格',
    `prev_price` decimal(10, 4)                                          NULL DEFAULT NULL COMMENT '上期价格',
    `rate`       double(10, 4)                                          NULL DEFAULT NULL COMMENT '增长率',
    `rn`         int                                                     NULL DEFAULT NULL COMMENT '当前排序',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_s_code_back_week_end_dt` (`s_code` ASC, `back_week` ASC, `end_dt` ASC) USING BTREE COMMENT '唯一键索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;


-- ----------------------------
-- Records of stock_rank
-- ----------------------------
BEGIN;
INSERT INTO `stock_rank`
VALUES (3, '512100', '中证1000ETF', '0', 4, '2022-06-24 00:00:00', '2022-05-27 00:00:00', 1.0110, 0.9080, 0.101879, 1);
INSERT INTO `stock_rank`
VALUES (4, '510300', '沪深300ETF', '0', 4, '2022-06-24 00:00:00', '2022-05-27 00:00:00', 4.4130, 4.0020, 0.093134, 2);
INSERT INTO `stock_rank`
VALUES (5, '510500', '中证500ETF', '0', 4, '2022-06-24 00:00:00', '2022-05-27 00:00:00', 7.2530, 6.6660, 0.080932, 3);
INSERT INTO `stock_rank`
VALUES (6, '510300', '沪深300ETF', '0', 3, '2022-06-24 00:00:00', '2022-06-06 00:00:00', 4.4130, 4.1760, 0.053705, 1);
INSERT INTO `stock_rank`
VALUES (7, '512100', '中证1000ETF', '0', 3, '2022-06-24 00:00:00', '2022-06-06 00:00:00', 1.0110, 0.9630, 0.047478, 2);
INSERT INTO `stock_rank`
VALUES (8, '510500', '中证500ETF', '0', 3, '2022-06-24 00:00:00', '2022-06-06 00:00:00', 7.2530, 6.9910, 0.036123, 3);
INSERT INTO `stock_rank`
VALUES (9, '510300', '沪深300ETF', '0', 1, '2022-06-24 00:00:00', '2022-06-17 00:00:00', 4.4130, 4.3210, 0.020848, 1);
INSERT INTO `stock_rank`
VALUES (10, '512100', '中证1000ETF', '0', 1, '2022-06-24 00:00:00', '2022-06-17 00:00:00', 1.0110, 0.9910, 0.019782, 2);
INSERT INTO `stock_rank`
VALUES (11, '510500', '中证500ETF', '0', 1, '2022-06-24 00:00:00', '2022-06-17 00:00:00', 7.2530, 7.1780, 0.010341, 3);
COMMIT;

-- ----------------------------
-- Table structure for tbl_kline
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kline`;
CREATE TABLE `tbl_kline`
(
    `id`             int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `code`           varchar(8)     DEFAULT NULL COMMENT '股票代码',
    `name`           varchar(128)   DEFAULT NULL COMMENT '股票名称',
    `trading_date`   date           DEFAULT NULL COMMENT '交易日期（yyyy-MM-dd）',
    `opening_price`  decimal(10, 4) DEFAULT NULL COMMENT '开盘价格（单位：元）',
    `closing_price`  decimal(10, 4) DEFAULT NULL COMMENT '收盘价格（单位：元）',
    `peak_price`     decimal(10, 4) DEFAULT NULL COMMENT '当天最高价格（单位：元）',
    `bottom_price`   decimal(10, 4) DEFAULT NULL COMMENT '当天最底价格（单位：元）',
    `change_rate`    decimal(8, 4)  DEFAULT NULL COMMENT '涨跌幅%',
    `change_amount`  decimal(8, 4)  DEFAULT NULL COMMENT '涨跌额（单位：元）',
    `trading_volume` int            DEFAULT NULL COMMENT '成交量（单位：手）',
    `trading_amount` decimal(16, 4) DEFAULT NULL COMMENT '成交额（单位：元）',
    `amplitude_rate` decimal(8, 4)  DEFAULT NULL COMMENT '振幅%',
    `turnover_rate`  decimal(8, 4)  DEFAULT NULL COMMENT '换手率%',
    `gmt_create`     datetime       DEFAULT CURRENT_TIMESTAMP,
    `gmt_modified`   datetime       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index_tbl_klines_code_date` (`code`, `trading_date`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 232
  DEFAULT CHARSET = utf8mb3 COMMENT ='k线数据表';

-- ----------------------------
-- Records of tbl_kline
-- ----------------------------
BEGIN;
INSERT INTO `tbl_kline`
VALUES (127, '510300', '沪深300ETF', '2022-05-06', 3.9250, 3.9030, 3.9430, 3.9000, -2.4300, -0.0970, 5206697,
        2042557056.0000, 1.0800, 4.6200, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (128, '510300', '沪深300ETF', '2022-05-09', 3.8780, 3.8710, 3.9060, 3.8500, -0.8200, -0.0320, 3187006,
        1234844480.0000, 1.4300, 2.8300, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (129, '510300', '沪深300ETF', '2022-05-10', 3.8330, 3.9160, 3.9330, 3.8080, 1.1600, 0.0450, 5474672,
        2129935216.0000, 3.2300, 4.8600, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (130, '510300', '沪深300ETF', '2022-05-11', 3.9090, 3.9710, 4.0260, 3.9090, 1.4000, 0.0550, 6290116,
        2502148832.0000, 2.9900, 5.5900, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (131, '510300', '沪深300ETF', '2022-05-12', 3.9550, 3.9510, 3.9790, 3.9330, -0.5000, -0.0200, 3071058,
        1215316560.0000, 1.1600, 2.7300, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (132, '510300', '沪深300ETF', '2022-05-13', 3.9880, 3.9820, 3.9990, 3.9520, 0.7800, 0.0310, 2799732,
        1113468048.0000, 1.1900, 2.4900, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (133, '510300', '沪深300ETF', '2022-05-16', 4.0000, 3.9510, 4.0140, 3.9400, -0.7800, -0.0310, 4425843,
        1755248944.0000, 1.8600, 3.9300, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (134, '510300', '沪深300ETF', '2022-05-17', 3.9600, 4.0000, 4.0010, 3.9490, 1.2400, 0.0490, 3008496,
        1197703808.0000, 1.3200, 2.6700, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (135, '510300', '沪深300ETF', '2022-05-18', 4.0070, 3.9860, 4.0170, 3.9600, -0.3500, -0.0140, 2640173,
        1052734336.0000, 1.4300, 2.3500, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (136, '510300', '沪深300ETF', '2022-05-19', 3.9470, 3.9950, 3.9970, 3.9360, 0.2300, 0.0090, 3249620,
        1289180784.0000, 1.5300, 2.8900, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (137, '510300', '沪深300ETF', '2022-05-20', 4.0200, 4.0790, 4.0800, 4.0100, 2.1000, 0.0840, 6004614,
        2434115744.0000, 1.7500, 5.3300, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (138, '510300', '沪深300ETF', '2022-05-23', 4.0790, 4.0470, 4.0790, 4.0210, -0.7800, -0.0320, 5120913,
        2070370272.0000, 1.4200, 4.5500, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (139, '510300', '沪深300ETF', '2022-05-24', 4.0460, 3.9650, 4.0490, 3.9600, -2.0300, -0.0820, 4156645,
        1664349504.0000, 2.2000, 3.6900, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (140, '510300', '沪深300ETF', '2022-05-25', 3.9600, 3.9820, 3.9840, 3.9480, 0.4300, 0.0170, 4576841,
        1814584624.0000, 0.9100, 4.0700, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (141, '510300', '沪深300ETF', '2022-05-26', 3.9830, 3.9920, 4.0200, 3.9320, 0.2500, 0.0100, 4816141,
        1914318704.0000, 2.2100, 4.2800, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (142, '510300', '沪深300ETF', '2022-05-27', 4.0220, 4.0020, 4.0570, 3.9850, 0.2500, 0.0100, 5532972,
        2228537584.0000, 1.8000, 4.9100, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (143, '510300', '沪深300ETF', '2022-05-30', 4.0200, 4.0250, 4.0430, 4.0070, 0.5700, 0.0230, 4505319,
        1813277776.0000, 0.9000, 4.0000, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (144, '510300', '沪深300ETF', '2022-05-31', 4.0250, 4.0890, 4.1030, 4.0160, 1.5900, 0.0640, 4522581,
        1836840912.0000, 2.1600, 4.0200, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (145, '510300', '沪深300ETF', '2022-06-01', 4.0890, 4.0830, 4.0960, 4.0600, -0.1500, -0.0060, 3774345,
        1540652768.0000, 0.8800, 3.3500, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (146, '510300', '沪深300ETF', '2022-06-02', 4.0660, 4.0940, 4.0980, 4.0580, 0.2700, 0.0110, 2901326,
        1183803264.0000, 0.9800, 2.5800, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (147, '510300', '沪深300ETF', '2022-06-06', 4.0920, 4.1760, 4.1770, 4.0650, 2.0000, 0.0820, 4238359,
        1751273376.0000, 2.7400, 3.7600, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (148, '510300', '沪深300ETF', '2022-06-07', 4.1610, 4.1820, 4.2020, 4.1550, 0.1400, 0.0060, 3808642,
        1592929728.0000, 1.1300, 3.3800, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (149, '510300', '沪深300ETF', '2022-06-08', 4.1850, 4.2240, 4.2300, 4.1650, 1.0000, 0.0420, 4272911,
        1796493328.0000, 1.5500, 3.8000, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (150, '510300', '沪深300ETF', '2022-06-09', 4.2150, 4.1900, 4.2340, 4.1730, -0.8000, -0.0340, 2916148,
        1226358656.0000, 1.4400, 2.5900, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (151, '510300', '沪深300ETF', '2022-06-10', 4.1590, 4.2480, 4.2600, 4.1580, 1.3800, 0.0580, 6480691,
        2738650048.0000, 2.4300, 5.7600, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (152, '510300', '沪深300ETF', '2022-06-13', 4.2100, 4.1960, 4.2230, 4.1700, -1.2200, -0.0520, 5799003,
        2431783712.0000, 1.2500, 5.1500, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (153, '510300', '沪深300ETF', '2022-06-14', 4.1650, 4.2360, 4.2400, 4.1150, 0.9500, 0.0400, 6249025,
        2613833376.0000, 2.9800, 5.5500, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (154, '510300', '沪深300ETF', '2022-06-15', 4.2330, 4.2850, 4.3640, 4.2330, 1.1600, 0.0490, 11218852,
        4834544896.0000, 3.0900, 9.9600, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (155, '510300', '沪深300ETF', '2022-06-16', 4.2980, 4.2580, 4.3170, 4.2490, -0.6300, -0.0270, 5075120,
        2175195328.0000, 1.5900, 4.5100, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (156, '510300', '沪深300ETF', '2022-06-17', 4.2410, 4.3210, 4.3370, 4.2350, 1.4800, 0.0630, 7156474,
        3070562896.0000, 2.4000, 6.3600, '2022-06-19 20:09:26', '2022-06-19 20:09:26');
INSERT INTO `tbl_kline`
VALUES (157, '510500', '中证500ETF', '2022-05-06', 6.2600, 6.2480, 6.3270, 6.2300, -2.2400, -0.1430, 3036722,
        1903682800.0000, 1.5200, 5.1300, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (158, '510500', '中证500ETF', '2022-05-09', 6.2270, 6.3030, 6.3250, 6.2160, 0.8800, 0.0550, 2504403,
        1575316624.0000, 1.7400, 4.2300, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (159, '510500', '中证500ETF', '2022-05-10', 6.2300, 6.4090, 6.4200, 6.1920, 1.6800, 0.1060, 1917798,
        1216140272.0000, 3.6200, 3.2400, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (160, '510500', '中证500ETF', '2022-05-11', 6.4090, 6.4520, 6.6060, 6.4010, 0.6700, 0.0430, 3697787,
        2415729824.0000, 3.2000, 6.2500, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (161, '510500', '中证500ETF', '2022-05-12', 6.4320, 6.4570, 6.5130, 6.3970, 0.0800, 0.0050, 1450568,
        936570544.0000, 1.8000, 2.4500, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (162, '510500', '中证500ETF', '2022-05-13', 6.4740, 6.5310, 6.5340, 6.4460, 1.1500, 0.0740, 1407780,
        914249488.0000, 1.3600, 2.3800, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (163, '510500', '中证500ETF', '2022-05-16', 6.5750, 6.5110, 6.5950, 6.4830, -0.3100, -0.0200, 1914540,
        1248694464.0000, 1.7100, 3.2400, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (164, '510500', '中证500ETF', '2022-05-17', 6.5130, 6.5460, 6.5480, 6.4470, 0.5400, 0.0350, 1352618,
        880119856.0000, 1.5500, 2.2900, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (165, '510500', '中证500ETF', '2022-05-18', 6.5430, 6.5240, 6.5850, 6.5070, -0.3400, -0.0220, 1607922,
        1051132352.0000, 1.1900, 2.7200, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (166, '510500', '中证500ETF', '2022-05-19', 6.4500, 6.5850, 6.5860, 6.4400, 0.9400, 0.0610, 1877983,
        1223974672.0000, 2.2400, 3.1700, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (167, '510500', '中证500ETF', '2022-05-20', 6.5960, 6.6870, 6.6930, 6.5810, 1.5500, 0.1020, 1880095,
        1247571360.0000, 1.7000, 3.1800, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (168, '510500', '中证500ETF', '2022-05-23', 6.7000, 6.7150, 6.7280, 6.6520, 0.4200, 0.0280, 1374219,
        918724336.0000, 1.1400, 2.3200, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (169, '510500', '中证500ETF', '2022-05-24', 6.7040, 6.4860, 6.7170, 6.4800, -3.4100, -0.2290, 2513978,
        1663286720.0000, 3.5300, 4.2500, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (170, '510500', '中证500ETF', '2022-05-25', 6.4800, 6.5900, 6.5910, 6.4730, 1.6000, 0.1040, 1808455,
        1181807600.0000, 1.8200, 3.0600, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (171, '510500', '中证500ETF', '2022-05-26', 6.5820, 6.6660, 6.6910, 6.5020, 1.1500, 0.0760, 1921296,
        1270608592.0000, 2.8700, 3.2500, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (172, '510500', '中证500ETF', '2022-05-27', 6.6800, 6.6660, 6.7240, 6.6040, 0.0000, 0.0000, 1333252,
        889893296.0000, 1.8000, 2.2500, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (173, '510500', '中证500ETF', '2022-05-30', 6.6800, 6.7020, 6.7040, 6.6150, 0.5400, 0.0360, 950528, 634000864.0000,
        1.3400, 1.6100, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (174, '510500', '中证500ETF', '2022-05-31', 6.6910, 6.8070, 6.8250, 6.6550, 1.5700, 0.1050, 2541741,
        1720173648.0000, 2.5400, 4.3000, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (175, '510500', '中证500ETF', '2022-06-01', 6.7950, 6.8000, 6.8280, 6.7360, -0.1000, -0.0070, 1415657,
        962082992.0000, 1.3500, 2.3900, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (176, '510500', '中证500ETF', '2022-06-02', 6.7880, 6.8820, 6.8920, 6.7620, 1.2100, 0.0820, 1507365,
        1031916640.0000, 1.9100, 2.5500, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (177, '510500', '中证500ETF', '2022-06-06', 6.8640, 6.9910, 7.0170, 6.8640, 1.5800, 0.1090, 2422504,
        1687855264.0000, 2.2200, 4.0900, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (178, '510500', '中证500ETF', '2022-06-07', 6.9890, 6.9870, 7.0090, 6.9500, -0.0600, -0.0040, 1592199,
        1111826496.0000, 0.8400, 2.6900, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (179, '510500', '中证500ETF', '2022-06-08', 6.9880, 7.0360, 7.0550, 6.9190, 0.7000, 0.0490, 1698308,
        1187593008.0000, 1.9500, 2.8700, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (180, '510500', '中证500ETF', '2022-06-09', 7.0200, 6.9510, 7.0400, 6.8820, -1.2100, -0.0850, 1508090,
        1051177648.0000, 2.2500, 2.5500, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (181, '510500', '中证500ETF', '2022-06-10', 6.9080, 7.0780, 7.0890, 6.9080, 1.8300, 0.1270, 2181456,
        1532290992.0000, 2.6000, 3.6900, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (182, '510500', '中证500ETF', '2022-06-13', 7.0390, 7.0570, 7.0850, 6.9870, -0.3000, -0.0210, 1702158,
        1198121600.0000, 1.3800, 2.8800, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (183, '510500', '中证500ETF', '2022-06-14', 7.0020, 7.1290, 7.1350, 6.8700, 1.0200, 0.0720, 2582859,
        1807912720.0000, 3.7600, 4.3600, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (184, '510500', '中证500ETF', '2022-06-15', 7.1250, 7.0990, 7.2700, 7.0900, -0.4200, -0.0300, 2147597,
        1541771504.0000, 2.5200, 3.6300, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (185, '510500', '中证500ETF', '2022-06-16', 7.1150, 7.1100, 7.1950, 7.0900, 0.1500, 0.0110, 2022533,
        1444896544.0000, 1.4800, 3.4200, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (186, '510500', '中证500ETF', '2022-06-17', 7.0790, 7.1780, 7.1950, 7.0070, 0.9600, 0.0680, 2289539,
        1631817424.0000, 2.6400, 3.8700, '2022-06-19 20:09:28', '2022-06-19 20:09:28');
INSERT INTO `tbl_kline`
VALUES (187, '512100', '中证1000ETF', '2022-05-06', 0.8320, 0.8390, 0.8460, 0.8280, -1.2900, -0.0110, 1876185,
        157099382.0000, 2.1200, 7.7300, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (188, '512100', '中证1000ETF', '2022-05-09', 0.8320, 0.8500, 0.8520, 0.8300, 1.3100, 0.0110, 1810666,
        153277591.0000, 2.6200, 7.4600, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (189, '512100', '中证1000ETF', '2022-05-10', 0.8370, 0.8640, 0.8670, 0.8350, 1.6500, 0.0140, 2298511,
        196775636.0000, 3.7600, 9.4700, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (190, '512100', '中证1000ETF', '2022-05-11', 0.8670, 0.8730, 0.8940, 0.8640, 1.0400, 0.0090, 1970927,
        173833252.0000, 3.4700, 8.1200, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (191, '512100', '中证1000ETF', '2022-05-12', 0.8650, 0.8780, 0.8850, 0.8650, 0.5700, 0.0050, 1717713,
        150641907.0000, 2.2900, 7.0800, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (192, '512100', '中证1000ETF', '2022-05-13', 0.8820, 0.8850, 0.8910, 0.8720, 0.8000, 0.0070, 2137794,
        187804341.0000, 2.1600, 8.8100, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (193, '512100', '中证1000ETF', '2022-05-16', 0.8880, 0.8870, 0.8960, 0.8800, 0.2300, 0.0020, 1547203,
        136979306.0000, 1.8100, 6.3800, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (194, '512100', '中证1000ETF', '2022-05-17', 0.8840, 0.8910, 0.8920, 0.8740, 0.4500, 0.0040, 1661488,
        146698107.0000, 2.0300, 6.8500, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (195, '512100', '中证1000ETF', '2022-05-18', 0.8910, 0.8910, 0.9000, 0.8850, 0.0000, 0.0000, 2151577,
        192271406.0000, 1.6800, 8.8700, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (196, '512100', '中证1000ETF', '2022-05-19', 0.8780, 0.9020, 0.9030, 0.8750, 1.2300, 0.0110, 1537470,
        136520160.0000, 3.1400, 6.3400, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (197, '512100', '中证1000ETF', '2022-05-20', 0.9000, 0.9100, 0.9130, 0.8970, 0.8900, 0.0080, 2067638,
        187225708.0000, 1.7700, 8.5200, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (198, '512100', '中证1000ETF', '2022-05-23', 0.9120, 0.9250, 0.9260, 0.9110, 1.6500, 0.0150, 1610781,
        147906636.0000, 1.6500, 6.6400, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (199, '512100', '中证1000ETF', '2022-05-24', 0.9200, 0.8870, 0.9240, 0.8840, -4.1100, -0.0380, 2186088,
        199144513.0000, 4.3200, 9.0100, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (200, '512100', '中证1000ETF', '2022-05-25', 0.8860, 0.9020, 0.9020, 0.8830, 1.6900, 0.0150, 2294867,
        204781265.0000, 2.1400, 9.4600, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (201, '512100', '中证1000ETF', '2022-05-26', 0.9000, 0.9100, 0.9150, 0.8870, 0.8900, 0.0080, 2499850,
        225315969.0000, 3.1000, 10.3000, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (202, '512100', '中证1000ETF', '2022-05-27', 0.9130, 0.9080, 0.9150, 0.8970, -0.2200, -0.0020, 2401286,
        218155906.0000, 1.9800, 9.8900, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (203, '512100', '中证1000ETF', '2022-05-30', 0.9050, 0.9160, 0.9170, 0.8980, 0.8800, 0.0080, 1709574,
        155258905.0000, 2.0900, 7.0400, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (204, '512100', '中证1000ETF', '2022-05-31', 0.9150, 0.9250, 0.9290, 0.9060, 0.9800, 0.0090, 2547785,
        234209777.0000, 2.5100, 10.5000, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (205, '512100', '中证1000ETF', '2022-06-01', 0.9200, 0.9290, 0.9330, 0.9180, 0.4300, 0.0040, 1577090,
        146472445.0000, 1.6200, 6.5000, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (206, '512100', '中证1000ETF', '2022-06-02', 0.9280, 0.9390, 0.9430, 0.9230, 1.0800, 0.0100, 2176874,
        203180535.0000, 2.1500, 8.9700, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (207, '512100', '中证1000ETF', '2022-06-06', 0.9360, 0.9630, 0.9660, 0.9360, 2.5600, 0.0240, 1978481,
        189190602.0000, 3.1900, 8.1500, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (208, '512100', '中证1000ETF', '2022-06-07', 0.9620, 0.9610, 0.9670, 0.9540, -0.2100, -0.0020, 1896363,
        181899421.0000, 1.3500, 7.8100, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (209, '512100', '中证1000ETF', '2022-06-08', 0.9590, 0.9640, 0.9720, 0.9440, 0.3100, 0.0030, 2163995,
        207617021.0000, 2.9100, 8.9200, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (210, '512100', '中证1000ETF', '2022-06-09', 0.9570, 0.9470, 0.9620, 0.9410, -1.7600, -0.0170, 2011356,
        191788714.0000, 2.1800, 8.2900, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (211, '512100', '中证1000ETF', '2022-06-10', 0.9410, 0.9680, 0.9690, 0.9390, 2.2200, 0.0210, 1516667,
        145443984.0000, 3.1700, 6.2500, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (212, '512100', '中证1000ETF', '2022-06-13', 0.9630, 0.9750, 0.9770, 0.9530, 0.7200, 0.0070, 1803241,
        175102935.0000, 2.4800, 7.4300, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (213, '512100', '中证1000ETF', '2022-06-14', 0.9680, 0.9750, 0.9760, 0.9410, 0.0000, 0.0000, 2481820,
        237791965.0000, 3.5900, 10.2300, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (214, '512100', '中证1000ETF', '2022-06-15', 0.9720, 0.9710, 0.9880, 0.9700, -0.4100, -0.0040, 2442639,
        239116274.0000, 1.8500, 10.0600, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (215, '512100', '中证1000ETF', '2022-06-16', 0.9700, 0.9800, 0.9880, 0.9700, 0.9300, 0.0090, 1923035,
        188417788.0000, 1.8500, 7.9200, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (216, '512100', '中证1000ETF', '2022-06-17', 0.9710, 0.9910, 0.9920, 0.9670, 1.1200, 0.0110, 2353100,
        230871429.0000, 2.5500, 9.7000, '2022-06-19 20:09:29', '2022-06-19 20:09:29');
INSERT INTO `tbl_kline`
VALUES (217, '510300', '沪深300ETF', '2022-06-20', 4.3310, 4.3420, 4.3880, 4.3080, 0.4900, 0.0210, 7324345,
        3177526640.0000, 1.8500, 6.8800, '2022-06-26 16:32:59', '2022-06-26 16:32:59');
INSERT INTO `tbl_kline`
VALUES (218, '510300', '沪深300ETF', '2022-06-21', 4.3420, 4.3400, 4.3780, 4.3050, -0.0500, -0.0020, 4224016,
        1833860944.0000, 1.6800, 3.9700, '2022-06-26 16:32:59', '2022-06-26 16:32:59');
INSERT INTO `tbl_kline`
VALUES (219, '510300', '沪深300ETF', '2022-06-22', 4.3400, 4.2900, 4.3470, 4.2820, -1.1500, -0.0500, 3619643,
        1560986304.0000, 1.5000, 3.4000, '2022-06-26 16:32:59', '2022-06-26 16:32:59');
INSERT INTO `tbl_kline`
VALUES (220, '510300', '沪深300ETF', '2022-06-23', 4.2910, 4.3650, 4.3670, 4.2840, 1.7500, 0.0750, 4056939,
        1755177552.0000, 1.9300, 3.8100, '2022-06-26 16:32:59', '2022-06-26 16:32:59');
INSERT INTO `tbl_kline`
VALUES (221, '510300', '沪深300ETF', '2022-06-24', 4.3750, 4.4130, 4.4260, 4.3630, 1.1000, 0.0480, 4148339,
        1823076992.0000, 1.4400, 3.8900, '2022-06-26 16:32:59', '2022-06-26 16:32:59');
INSERT INTO `tbl_kline`
VALUES (222, '510500', '中证500ETF', '2022-06-20', 7.1780, 7.1780, 7.2270, 7.1140, 0.0000, 0.0000, 1786922,
        1282310384.0000, 1.5700, 3.0700, '2022-06-26 16:33:00', '2022-06-26 16:33:00');
INSERT INTO `tbl_kline`
VALUES (223, '510500', '中证500ETF', '2022-06-21', 7.1710, 7.1260, 7.1970, 7.0680, -0.7200, -0.0520, 1494129,
        1066364256.0000, 1.8000, 2.5700, '2022-06-26 16:33:00', '2022-06-26 16:33:00');
INSERT INTO `tbl_kline`
VALUES (224, '510500', '中证500ETF', '2022-06-22', 7.1200, 7.0150, 7.1430, 7.0070, -1.5600, -0.1110, 1966173,
        1390781792.0000, 1.9100, 3.3800, '2022-06-26 16:33:00', '2022-06-26 16:33:00');
INSERT INTO `tbl_kline`
VALUES (225, '510500', '中证500ETF', '2022-06-23', 7.0150, 7.1700, 7.1770, 6.9890, 2.2100, 0.1550, 1981573,
        1408835456.0000, 2.6800, 3.4100, '2022-06-26 16:33:00', '2022-06-26 16:33:00');
INSERT INTO `tbl_kline`
VALUES (226, '510500', '中证500ETF', '2022-06-24', 7.1800, 7.2530, 7.2680, 7.1650, 1.1600, 0.0830, 1789113,
        1294176128.0000, 1.4400, 3.0800, '2022-06-26 16:33:00', '2022-06-26 16:33:00');
INSERT INTO `tbl_kline`
VALUES (227, '512100', '中证1000ETF', '2022-06-20', 0.9910, 1.0000, 1.0050, 0.9890, 0.9100, 0.0090, 2079638,
        207349752.0000, 1.6100, 8.9900, '2022-06-26 16:33:01', '2022-06-26 16:33:01');
INSERT INTO `tbl_kline`
VALUES (228, '512100', '中证1000ETF', '2022-06-21', 0.9990, 0.9890, 1.0010, 0.9810, -1.1000, -0.0110, 2609780,
        258883926.0000, 2.0000, 11.2800, '2022-06-26 16:33:01', '2022-06-26 16:33:01');
INSERT INTO `tbl_kline`
VALUES (229, '512100', '中证1000ETF', '2022-06-22', 0.9880, 0.9770, 0.9950, 0.9760, -1.2100, -0.0120, 2302702,
        227205628.0000, 1.9200, 9.9600, '2022-06-26 16:33:01', '2022-06-26 16:33:01');
INSERT INTO `tbl_kline`
VALUES (230, '512100', '中证1000ETF', '2022-06-23', 0.9750, 1.0000, 1.0010, 0.9710, 2.3500, 0.0230, 2180010,
        215176397.0000, 3.0700, 9.4300, '2022-06-26 16:33:01', '2022-06-26 16:33:01');
INSERT INTO `tbl_kline`
VALUES (231, '512100', '中证1000ETF', '2022-06-24', 1.0000, 1.0110, 1.0180, 1.0000, 1.1000, 0.0110, 2805090,
        283644880.0000, 1.8000, 12.1300, '2022-06-26 16:33:01', '2022-06-26 16:33:01');
COMMIT;

-- ----------------------------
-- Table structure for tbl_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stock_info`;
CREATE TABLE `tbl_stock_info`
(
    `id`           int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `code`         varchar(8)   DEFAULT NULL COMMENT '股票代码',
    `name`         varchar(128) DEFAULT NULL COMMENT '股票名称',
    `market`       int          DEFAULT NULL COMMENT '市场（0:深证A股，1:上证A股）',
    `industry`     varchar(128) DEFAULT NULL COMMENT '行业（多个行业中间使用逗号隔开）',
    `city`         varchar(64)  DEFAULT NULL COMMENT '城市',
    `open_status`  int          DEFAULT NULL COMMENT '股票状态（0:正常交易，1:）',
    `type`         int          DEFAULT NULL COMMENT '股票类型（0:正常，1:ST）',
    `listing_date` date         DEFAULT NULL COMMENT '上市日期（yyyy-MM-dd）',
    `gmt_create`   datetime     DEFAULT CURRENT_TIMESTAMP,
    `gmt_modified` datetime     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index_tbl_stock_info_code` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb3 COMMENT ='股票信息表';

-- ----------------------------
-- Records of tbl_stock_info
-- ----------------------------
BEGIN;
INSERT INTO `tbl_stock_info`
VALUES (1, '510300', '沪深300ETF', 1, NULL, NULL, NULL, NULL, NULL, '2020-12-18 17:17:16', '2022-06-19 16:05:06');
INSERT INTO `tbl_stock_info`
VALUES (2, '510500', '中证500ETF', 1, NULL, NULL, NULL, NULL, NULL, '2022-06-19 16:00:48', '2022-06-19 16:05:02');
INSERT INTO `tbl_stock_info`
VALUES (3, '512100', '中证1000ETF', 1, NULL, NULL, NULL, NULL, NULL, '2022-06-19 16:04:58', '2022-06-19 16:05:10');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- View structure for stock_rank_view
-- ----------------------------
DROP VIEW IF EXISTS `stock_rank_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stock_rank_view` AS select `t`.`s_code` AS `s_code`,`t`.`s_name` AS `s_name`,ifnull((`t2`.`max_period` + 1),0) AS `period`,`t`.`back_week` AS `back_week`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`rn` AS `rn` from ((select `t`.`s_name` AS `s_name`,`t`.`s_code` AS `s_code`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`back_week` AS `back_week`,row_number() OVER (ORDER BY `t`.`rate` desc )  AS `rn` from (select `t1`.`name` AS `s_name`,`t1`.`code` AS `s_code`,`t1`.`end_dt` AS `end_dt`,`t2`.`prev_dt` AS `prev_dt`,`t1`.`end_price` AS `end_price`,`t2`.`prev_price` AS `prev_price`,((`t1`.`end_price` - `t2`.`prev_price`) / `t1`.`end_price`) AS `rate`,4 AS `back_week` from ((select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `end_dt`,`tbl_kline`.`closing_price` AS `end_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select max(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 4 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t1` join (select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `prev_dt`,`tbl_kline`.`closing_price` AS `prev_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select min(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 4 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t2` on((`t1`.`name` = `t2`.`name`)))) `t` union all select `t`.`s_name` AS `s_name`,`t`.`s_code` AS `s_code`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`back_week` AS `back_week`,row_number() OVER (ORDER BY `t`.`rate` desc )  AS `rn` from (select `t1`.`name` AS `s_name`,`t1`.`code` AS `s_code`,`t1`.`end_dt` AS `end_dt`,`t2`.`prev_dt` AS `prev_dt`,`t1`.`end_price` AS `end_price`,`t2`.`prev_price` AS `prev_price`,((`t1`.`end_price` - `t2`.`prev_price`) / `t1`.`end_price`) AS `rate`,3 AS `back_week` from ((select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `end_dt`,`tbl_kline`.`closing_price` AS `end_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select max(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 3 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t1` join (select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `prev_dt`,`tbl_kline`.`closing_price` AS `prev_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select min(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 3 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t2` on((`t1`.`name` = `t2`.`name`)))) `t` union all select `t`.`s_name` AS `s_name`,`t`.`s_code` AS `s_code`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`back_week` AS `back_week`,row_number() OVER (ORDER BY `t`.`rate` desc )  AS `rn` from (select `t1`.`name` AS `s_name`,`t1`.`code` AS `s_code`,`t1`.`end_dt` AS `end_dt`,`t2`.`prev_dt` AS `prev_dt`,`t1`.`end_price` AS `end_price`,`t2`.`prev_price` AS `prev_price`,((`t1`.`end_price` - `t2`.`prev_price`) / `t1`.`end_price`) AS `rate`,1 AS `back_week` from ((select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `end_dt`,`tbl_kline`.`closing_price` AS `end_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select max(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 1 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t1` join (select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `prev_dt`,`tbl_kline`.`closing_price` AS `prev_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select min(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 1 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t2` on((`t1`.`name` = `t2`.`name`)))) `t`) `t` join (select max(`stock_rank`.`period`) AS `max_period` from `stock_rank`) `t2`);
