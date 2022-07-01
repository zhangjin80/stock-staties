INSERT INTO `stock`.`stock_rank` (`s_code`, `s_name`, `period`, `back_week`, `end_dt`, `prev_dt`, `end_price`,
                                  `prev_price`, `rate`, `rn`)
VALUES ('512100', '中证1000ETF', '0', 4, '2022-06-24 00:00:00', '2022-05-27 00:00:00', 10.0110, 0.9080, 0.101879, 1)
ON DUPLICATE KEY UPDATE end_dt     = VALUES(end_dt),
                        prev_dt    = VALUES(prev_dt),
                        end_price  = VALUES(end_price),
                        prev_price = VALUES(prev_price),
                        rate       = VALUES(rate),
                        rn         = VALUES(rn);

INSERT INTO `stock`.`stock_rank`
(`s_code`,
 `s_name`,
 `period`,
 `back_week`,
 `end_dt`,
 `prev_dt`,
 `end_price`,
 `prev_price`,
 `rate`,
 `rn`)
select `s_code`,
       `s_name`,
       `period`,
       `back_week`,
       `end_dt`,
       `prev_dt`,
       `end_price`,
       `prev_price`,
       `rate`,
       `rn`
from stock_rank_view;