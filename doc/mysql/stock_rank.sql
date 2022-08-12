CREATE view `stock_rank_view`             AS
SELECT `t`.`s_code`                       AS `s_code`,
       `t`.`s_name`                       AS `s_name`,
       Ifnull((`t2`.`max_period` + 1), 0) AS `period`,
       `t`.`back_week`                    AS `back_week`,
       `t`.`end_dt`                       AS `end_dt`,
       `t`.`prev_dt`                      AS `prev_dt`,
       `t`.`end_price`                    AS `end_price`,
       `t`.`prev_price`                   AS `prev_price`,
       `t`.`rate`                         AS `rate`,
       `t`.`rn`                           AS `rn`
FROM   (
        (
            SELECT   `t`.`s_name`                                   AS `s_name`,
                     `t`.`s_code`                                   AS `s_code`,
                     `t`.`end_dt`                                   AS `end_dt`,
                     `t`.`prev_dt`                                  AS `prev_dt`,
                     `t`.`end_price`                                AS `end_price`,
                     `t`.`prev_price`                               AS `prev_price`,
                     `t`.`rate`                                     AS `rate`,
                     `t`.`back_week`                                AS `back_week`,
                     Row_number() over ( ORDER BY `t`.`rate` DESC ) AS `rn`
            FROM     (
                         SELECT `t1`.`name`                                                    AS `s_name`,
                                `t1`.`code`                                                    AS `s_code`,
                                `t1`.`end_dt`                                                  AS `end_dt`,
                                `t2`.`prev_dt`                                                 AS `prev_dt`,
                                `t1`.`end_price`                                               AS `end_price`,
                                `t2`.`prev_price`                                              AS `prev_price`,
                                (( `t1`.`end_price` - `t2`.`prev_price` ) / `t1`.`end_price` ) AS `rate`,
                                4                                                              AS `back_week`
                         FROM   (
                                 (
                                     SELECT `tbl_kline`.`name`          AS `name`,
                                            `tbl_kline`.`code`          AS `code`,
                                            `tbl_kline`.`trading_date`  AS `end_dt`,
                                            `tbl_kline`.`closing_price` AS `end_price`
                                     FROM   `tbl_kline`
                                     WHERE  (
                                                    `tbl_kline`.`trading_date` =
                                                    (
                                                        SELECT max(`tbl_kline`.`trading_date`)
                                                        FROM   `tbl_kline`
                                                        WHERE  ((
                                                                        `tbl_kline`.`trading_date` >= (((curdate() - INTERVAL weekday(curdate()) day) - INTERVAL 4 week) + INTERVAL 4 day))
                                                            AND    (
                                                                        `tbl_kline`.`trading_date` <= curdate()))))) `t1`
                                    JOIN
                                (
                                    SELECT `tbl_kline`.`name`          AS `name`,
                                           `tbl_kline`.`code`          AS `code`,
                                           `tbl_kline`.`trading_date`  AS `prev_dt`,
                                           `tbl_kline`.`closing_price` AS `prev_price`
                                    FROM   `tbl_kline`
                                    WHERE  (
                                                   `tbl_kline`.`trading_date` =
                                                   (
                                                       SELECT min(`tbl_kline`.`trading_date`)
                                                       FROM   `tbl_kline`
                                                       WHERE  ((
                                                                       `tbl_kline`.`trading_date` >= (((curdate() - INTERVAL weekday(curdate()) day) - INTERVAL 4 week) + INTERVAL 4 day))
                                                           AND    (
                                                                       `tbl_kline`.`trading_date` <= curdate()))))) `t2`
                                ON     ((
                                        `t1`.`name` = `t2`.`name` )))) `t`
            UNION ALL
            SELECT   `t`.`s_name`                                   AS `s_name`,
                     `t`.`s_code`                                   AS `s_code`,
                     `t`.`end_dt`                                   AS `end_dt`,
                     `t`.`prev_dt`                                  AS `prev_dt`,
                     `t`.`end_price`                                AS `end_price`,
                     `t`.`prev_price`                               AS `prev_price`,
                     `t`.`rate`                                     AS `rate`,
                     `t`.`back_week`                                AS `back_week`,
                     row_number() over ( ORDER BY `t`.`rate` DESC ) AS `rn`
            FROM     (
                         SELECT `t1`.`name`                                                    AS `s_name`,
                                `t1`.`code`                                                    AS `s_code`,
                                `t1`.`end_dt`                                                  AS `end_dt`,
                                `t2`.`prev_dt`                                                 AS `prev_dt`,
                                `t1`.`end_price`                                               AS `end_price`,
                                `t2`.`prev_price`                                              AS `prev_price`,
                                (( `t1`.`end_price` - `t2`.`prev_price` ) / `t1`.`end_price` ) AS `rate`,
                                3                                                              AS `back_week`
                         FROM   (
                                 (
                                     SELECT `tbl_kline`.`name`          AS `name`,
                                            `tbl_kline`.`code`          AS `code`,
                                            `tbl_kline`.`trading_date`  AS `end_dt`,
                                            `tbl_kline`.`closing_price` AS `end_price`
                                     FROM   `tbl_kline`
                                     WHERE  (
                                                    `tbl_kline`.`trading_date` =
                                                    (
                                                        SELECT max(`tbl_kline`.`trading_date`)
                                                        FROM   `tbl_kline`
                                                        WHERE  ((
                                                                        `tbl_kline`.`trading_date` >= (((curdate() - INTERVAL weekday(curdate()) day) - INTERVAL 3 week) + INTERVAL 4 day))
                                                            AND    (
                                                                        `tbl_kline`.`trading_date` <= curdate()))))) `t1`
                                    JOIN
                                (
                                    SELECT `tbl_kline`.`name`          AS `name`,
                                           `tbl_kline`.`code`          AS `code`,
                                           `tbl_kline`.`trading_date`  AS `prev_dt`,
                                           `tbl_kline`.`closing_price` AS `prev_price`
                                    FROM   `tbl_kline`
                                    WHERE  (
                                                   `tbl_kline`.`trading_date` =
                                                   (
                                                       SELECT min(`tbl_kline`.`trading_date`)
                                                       FROM   `tbl_kline`
                                                       WHERE  ((
                                                                       `tbl_kline`.`trading_date` >= (((curdate() - INTERVAL weekday(curdate()) day) - INTERVAL 3 week) + INTERVAL 4 day))
                                                           AND    (
                                                                       `tbl_kline`.`trading_date` <= curdate()))))) `t2`
                                ON     ((
                                        `t1`.`name` = `t2`.`name` )))) `t`
            UNION ALL
            SELECT   `t`.`s_name`                                   AS `s_name`,
                     `t`.`s_code`                                   AS `s_code`,
                     `t`.`end_dt`                                   AS `end_dt`,
                     `t`.`prev_dt`                                  AS `prev_dt`,
                     `t`.`end_price`                                AS `end_price`,
                     `t`.`prev_price`                               AS `prev_price`,
                     `t`.`rate`                                     AS `rate`,
                     `t`.`back_week`                                AS `back_week`,
                     row_number() over ( ORDER BY `t`.`rate` DESC ) AS `rn`
            FROM     (
                         SELECT `t1`.`name`                                                    AS `s_name`,
                                `t1`.`code`                                                    AS `s_code`,
                                `t1`.`end_dt`                                                  AS `end_dt`,
                                `t2`.`prev_dt`                                                 AS `prev_dt`,
                                `t1`.`end_price`                                               AS `end_price`,
                                `t2`.`prev_price`                                              AS `prev_price`,
                                (( `t1`.`end_price` - `t2`.`prev_price` ) / `t1`.`end_price` ) AS `rate`,
                                1                                                              AS `back_week`
                         FROM   (
                                 (
                                     SELECT `tbl_kline`.`name`          AS `name`,
                                            `tbl_kline`.`code`          AS `code`,
                                            `tbl_kline`.`trading_date`  AS `end_dt`,
                                            `tbl_kline`.`closing_price` AS `end_price`
                                     FROM   `tbl_kline`
                                     WHERE  (
                                                    `tbl_kline`.`trading_date` =
                                                    (
                                                        SELECT max(`tbl_kline`.`trading_date`)
                                                        FROM   `tbl_kline`
                                                        WHERE  ((
                                                                        `tbl_kline`.`trading_date` >= (((curdate() - INTERVAL weekday(curdate()) day) - INTERVAL 1 week) + INTERVAL 4 day))
                                                            AND    (
                                                                        `tbl_kline`.`trading_date` <= curdate()))))) `t1`
                                    JOIN
                                (
                                    SELECT `tbl_kline`.`name`          AS `name`,
                                           `tbl_kline`.`code`          AS `code`,
                                           `tbl_kline`.`trading_date`  AS `prev_dt`,
                                           `tbl_kline`.`closing_price` AS `prev_price`
                                    FROM   `tbl_kline`
                                    WHERE  (
                                                   `tbl_kline`.`trading_date` =
                                                   (
                                                       SELECT min(`tbl_kline`.`trading_date`)
                                                       FROM   `tbl_kline`
                                                       WHERE  ((
                                                                       `tbl_kline`.`trading_date` >= (((curdate() - INTERVAL weekday(curdate()) day) - INTERVAL 1 week) + INTERVAL 4 day))
                                                           AND    (
                                                                       `tbl_kline`.`trading_date` <= curdate()))))) `t2`
                                ON     ((
                                        `t1`.`name` = `t2`.`name` )))) `t` ) `t`
           JOIN
       (
           SELECT max(`stock_rank`.`period`) AS `max_period`
           FROM   `stock_rank`) `t2`
)



INSERT INTO `stock`.`stock_rank`(`s_code`, `s_name`, `period`, `back_week`, `end_dt`, `prev_dt`, `end_price`,
                                 `prev_price`, `rate`, `rn`)
SELECT s_code,
       s_name,
       0 AS period,
       back_week,
       end_dt,
       prev_dt,
       end_price,
       prev_price,
       rate,
       rn
FROM (
         SELECT s_name,
                s_code,
                end_dt,
                prev_dt,
                end_price,
                prev_price,
                rate,
                back_week,
                row_number() over ( ORDER BY rate DESC ) AS rn
         FROM (
                  SELECT t1.NAME                              AS s_name,
                         t1.CODE                              AS s_code,
                         end_dt,
                         prev_dt,
                         end_price,
                         prev_price,
                         (end_price - prev_price) / end_price AS rate,
                         4                                    AS back_week
                  FROM (
                           SELECT NAME
                                   ,
                                  CODE,
                                  trading_date  AS end_dt,
                                  closing_price AS end_price
                           FROM tbl_kline
                           WHERE trading_date = (
                               SELECT MAX(trading_date)
                               FROM tbl_kline
                               WHERE trading_date >= DATE_ADD(
                                       DATE_SUB(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 4 WEEK),
                                       INTERVAL 4 DAY)
                                 AND trading_date <= curdate()
                           )
                       ) AS t1
                           JOIN (
                      SELECT NAME
                              ,
                             CODE,
                             trading_date  AS prev_dt,
                             closing_price AS prev_price
                      FROM tbl_kline
                      WHERE trading_date = (
                          SELECT min(trading_date)
                          FROM tbl_kline
                          WHERE trading_date >= DATE_ADD(
                                  DATE_SUB(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 4 WEEK),
                                  INTERVAL 4 DAY)
                            AND trading_date <= curdate()
                      )
                  ) t2 ON t1.NAME = t2.NAME
              ) t
         UNION ALL
         SELECT s_name,
                s_code,
                end_dt,
                prev_dt,
                end_price,
                prev_price,
                rate,
                back_week,
                row_number() over ( ORDER BY rate DESC ) AS rn
         FROM (
                  SELECT t1.NAME                              AS s_name,
                         t1.CODE                              AS s_code,
                         end_dt,
                         prev_dt,
                         end_price,
                         prev_price,
                         (end_price - prev_price) / end_price AS rate,
                         3                                    AS back_week
                  FROM (
                           SELECT NAME
                                   ,
                                  CODE,
                                  trading_date  AS end_dt,
                                  closing_price AS end_price
                           FROM tbl_kline
                           WHERE trading_date = (
                               SELECT MAX(trading_date)
                               FROM tbl_kline
                               WHERE trading_date >= DATE_ADD(
                                       DATE_SUB(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 3 WEEK),
                                       INTERVAL 4 DAY)
                                 AND trading_date <= curdate()
                           )
                       ) AS t1
                           JOIN (
                      SELECT NAME
                              ,
                             CODE,
                             trading_date  AS prev_dt,
                             closing_price AS prev_price
                      FROM tbl_kline
                      WHERE trading_date = (
                          SELECT min(trading_date)
                          FROM tbl_kline
                          WHERE trading_date >= DATE_ADD(
                                  DATE_SUB(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 3 WEEK),
                                  INTERVAL 4 DAY)
                            AND trading_date <= curdate()
                      )
                  ) t2 ON t1.NAME = t2.NAME
              ) t
         UNION ALL
         SELECT s_name,
                s_code,
                end_dt,
                prev_dt,
                end_price,
                prev_price,
                rate,
                back_week,
                row_number() over ( ORDER BY rate DESC ) AS rn
         FROM (
                  SELECT t1.NAME                              AS s_name,
                         t1.CODE                              AS s_code,
                         end_dt,
                         prev_dt,
                         end_price,
                         prev_price,
                         (end_price - prev_price) / end_price AS rate,
                         1                                    AS back_week
                  FROM (
                           SELECT NAME
                                   ,
                                  CODE,
                                  trading_date  AS end_dt,
                                  closing_price AS end_price
                           FROM tbl_kline
                           WHERE trading_date = (
                               SELECT MAX(trading_date)
                               FROM tbl_kline
                               WHERE trading_date >= DATE_ADD(
                                       DATE_SUB(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 1 WEEK),
                                       INTERVAL 4 DAY)
                                 AND trading_date <= curdate()
                           )
                       ) AS t1
                           JOIN (
                      SELECT NAME
                              ,
                             CODE,
                             trading_date  AS prev_dt,
                             closing_price AS prev_price
                      FROM tbl_kline
                      WHERE trading_date = (
                          SELECT min(trading_date)
                          FROM tbl_kline
                          WHERE trading_date >= DATE_ADD(
                                  DATE_SUB(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 1 WEEK),
                                  INTERVAL 4 DAY)
                            AND trading_date <= curdate()
                      )
                  ) t2 ON t1.NAME = t2.NAME
              ) t
     ) t