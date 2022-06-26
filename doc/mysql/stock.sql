-- ----------------------------
-- Table structure for position_period_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `position_period_snapshot`;
CREATE TABLE `position_period_snapshot` (
                                            `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                            `pid` int DEFAULT NULL COMMENT '持仓编号',
                                            `pname` varchar(255) DEFAULT NULL COMMENT '持仓名',
                                            `period` int DEFAULT NULL COMMENT '持仓周期',
                                            `cur_period_time` datetime(6) DEFAULT NULL COMMENT '持仓时间点',
                                            `initial_value` double(10,4) DEFAULT NULL COMMENT '持仓初始金额',
                                            `prev_s_code` varchar(255) DEFAULT NULL COMMENT '上期代码',
                                            `prev_s_name` varchar(255) DEFAULT NULL COMMENT '上期持仓股票名',
                                            `prev_s_cur_price` double(4,4) DEFAULT NULL COMMENT '上期持仓现期价格',
                                            `prev_s_number` int DEFAULT NULL COMMENT '上期持仓股票数量',
                                            `cur_p_value` double(10,4) DEFAULT NULL COMMENT '持仓当期价值',
                                            `cur_s_code` varchar(255) DEFAULT NULL COMMENT '持仓股票代码',
                                            `cur_s_name` varchar(255) DEFAULT NULL COMMENT '持仓股票名',
                                            `cur_s_price` double(4,4) DEFAULT NULL COMMENT '持仓股票当期价格',
                                            `cur_s_number` int DEFAULT NULL COMMENT '持仓股票数量',
                                            `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
                                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for stock_rank
-- ----------------------------
DROP TABLE IF EXISTS `stock_rank`;
CREATE TABLE `stock_rank` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `s_code` varchar(255) DEFAULT NULL COMMENT '股票代码',
                              `s_name` varchar(255) DEFAULT NULL COMMENT '股票名',
                              `period` varchar(255) DEFAULT NULL COMMENT '持仓周期',
                              `back_week` tinyint(1) DEFAULT NULL COMMENT '回测几周',
                              `end_dt` datetime DEFAULT NULL COMMENT '当期日期',
                              `prev_dt` datetime DEFAULT NULL COMMENT '上期日期',
                              `end_price` decimal(10,4) DEFAULT NULL COMMENT '当期价格',
                              `prev_price` decimal(10,4) DEFAULT NULL COMMENT '上期价格',
                              `rate` double(255,6) DEFAULT NULL COMMENT '增长率',
                              `rn` int DEFAULT NULL COMMENT '排序',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Table structure for tbl_kline
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kline`;
CREATE TABLE `tbl_kline` (
                             `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                             `code` varchar(8) DEFAULT NULL COMMENT '股票代码',
                             `name` varchar(128) DEFAULT NULL COMMENT '股票名称',
                             `trading_date` date DEFAULT NULL COMMENT '交易日期（yyyy-MM-dd）',
                             `opening_price` decimal(10,4) DEFAULT NULL COMMENT '开盘价格（单位：元）',
                             `closing_price` decimal(10,4) DEFAULT NULL COMMENT '收盘价格（单位：元）',
                             `peak_price` decimal(10,4) DEFAULT NULL COMMENT '当天最高价格（单位：元）',
                             `bottom_price` decimal(10,4) DEFAULT NULL COMMENT '当天最底价格（单位：元）',
                             `change_rate` decimal(8,4) DEFAULT NULL COMMENT '涨跌幅%',
                             `change_amount` decimal(8,4) DEFAULT NULL COMMENT '涨跌额（单位：元）',
                             `trading_volume` int DEFAULT NULL COMMENT '成交量（单位：手）',
                             `trading_amount` decimal(16,4) DEFAULT NULL COMMENT '成交额（单位：元）',
                             `amplitude_rate` decimal(8,4) DEFAULT NULL COMMENT '振幅%',
                             `turnover_rate` decimal(8,4) DEFAULT NULL COMMENT '换手率%',
                             `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                             `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `index_tbl_klines_code_date` (`code`,`trading_date`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb3 COMMENT='k线数据表';

-- ----------------------------
-- Table structure for tbl_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stock_info`;
CREATE TABLE `tbl_stock_info` (
                                  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                                  `code` varchar(8) DEFAULT NULL COMMENT '股票代码',
                                  `name` varchar(128) DEFAULT NULL COMMENT '股票名称',
                                  `market` int DEFAULT NULL COMMENT '市场（0:深证A股，1:上证A股）',
                                  `industry` varchar(128) DEFAULT NULL COMMENT '行业（多个行业中间使用逗号隔开）',
                                  `city` varchar(64) DEFAULT NULL COMMENT '城市',
                                  `open_status` int DEFAULT NULL COMMENT '股票状态（0:正常交易，1:）',
                                  `type` int DEFAULT NULL COMMENT '股票类型（0:正常，1:ST）',
                                  `listing_date` date DEFAULT NULL COMMENT '上市日期（yyyy-MM-dd）',
                                  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
                                  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `index_tbl_stock_info_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='股票信息表';

SET FOREIGN_KEY_CHECKS = 1;
