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
VALUES (1, '000300', '沪深300ETF', 1, NULL, NULL, NULL, NULL, NULL, '2020-12-18 17:17:16', '2022-06-19 16:05:06');
INSERT INTO `tbl_stock_info`
VALUES (2, '000905', '中证500ETF', 1, NULL, NULL, NULL, NULL, NULL, '2022-06-19 16:00:48', '2022-06-19 16:05:02');
INSERT INTO `tbl_stock_info`
VALUES (3, '000852', '中证1000ETF', 1, NULL, NULL, NULL, NULL, NULL, '2022-06-19 16:04:58', '2022-06-19 16:05:10');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- View structure for stock_rank_view
-- ----------------------------
DROP VIEW IF EXISTS `stock_rank_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stock_rank_view` AS select `t`.`s_code` AS `s_code`,`t`.`s_name` AS `s_name`,ifnull((`t2`.`max_period` + 1),0) AS `period`,`t`.`back_week` AS `back_week`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`rn` AS `rn` from ((select `t`.`s_name` AS `s_name`,`t`.`s_code` AS `s_code`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`back_week` AS `back_week`,row_number() OVER (ORDER BY `t`.`rate` desc )  AS `rn` from (select `t1`.`name` AS `s_name`,`t1`.`code` AS `s_code`,`t1`.`end_dt` AS `end_dt`,`t2`.`prev_dt` AS `prev_dt`,`t1`.`end_price` AS `end_price`,`t2`.`prev_price` AS `prev_price`,((`t1`.`end_price` - `t2`.`prev_price`) / `t1`.`end_price`) AS `rate`,4 AS `back_week` from ((select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `end_dt`,`tbl_kline`.`closing_price` AS `end_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select max(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 4 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t1` join (select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `prev_dt`,`tbl_kline`.`closing_price` AS `prev_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select min(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 4 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t2` on((`t1`.`name` = `t2`.`name`)))) `t` union all select `t`.`s_name` AS `s_name`,`t`.`s_code` AS `s_code`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`back_week` AS `back_week`,row_number() OVER (ORDER BY `t`.`rate` desc )  AS `rn` from (select `t1`.`name` AS `s_name`,`t1`.`code` AS `s_code`,`t1`.`end_dt` AS `end_dt`,`t2`.`prev_dt` AS `prev_dt`,`t1`.`end_price` AS `end_price`,`t2`.`prev_price` AS `prev_price`,((`t1`.`end_price` - `t2`.`prev_price`) / `t1`.`end_price`) AS `rate`,3 AS `back_week` from ((select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `end_dt`,`tbl_kline`.`closing_price` AS `end_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select max(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 3 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t1` join (select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `prev_dt`,`tbl_kline`.`closing_price` AS `prev_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select min(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 3 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t2` on((`t1`.`name` = `t2`.`name`)))) `t` union all select `t`.`s_name` AS `s_name`,`t`.`s_code` AS `s_code`,`t`.`end_dt` AS `end_dt`,`t`.`prev_dt` AS `prev_dt`,`t`.`end_price` AS `end_price`,`t`.`prev_price` AS `prev_price`,`t`.`rate` AS `rate`,`t`.`back_week` AS `back_week`,row_number() OVER (ORDER BY `t`.`rate` desc )  AS `rn` from (select `t1`.`name` AS `s_name`,`t1`.`code` AS `s_code`,`t1`.`end_dt` AS `end_dt`,`t2`.`prev_dt` AS `prev_dt`,`t1`.`end_price` AS `end_price`,`t2`.`prev_price` AS `prev_price`,((`t1`.`end_price` - `t2`.`prev_price`) / `t1`.`end_price`) AS `rate`,1 AS `back_week` from ((select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `end_dt`,`tbl_kline`.`closing_price` AS `end_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select max(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 1 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t1` join (select `tbl_kline`.`name` AS `name`,`tbl_kline`.`code` AS `code`,`tbl_kline`.`trading_date` AS `prev_dt`,`tbl_kline`.`closing_price` AS `prev_price` from `tbl_kline` where (`tbl_kline`.`trading_date` = (select min(`tbl_kline`.`trading_date`) from `tbl_kline` where ((`tbl_kline`.`trading_date` >= (((curdate() - interval weekday(curdate()) day) - interval 1 week) + interval 4 day)) and (`tbl_kline`.`trading_date` <= curdate()))))) `t2` on((`t1`.`name` = `t2`.`name`)))) `t`) `t` join (select max(`stock_rank`.`period`) AS `max_period` from `stock_rank`) `t2`);
