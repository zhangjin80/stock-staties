SET
  @back_week := 4,
  @rownum := 0;

insert into stock_rank (
  `stock_name`, `end_date`, `before_week_date`,
  `end_price`, `before_price`, `rate`,
  `back_week`, `rn`
)
SELECT
  *,
  @rownum := @rownum + 1 AS rn
FROM
  (
    SELECT
      t1.NAME AS stock_name,
      end_date,
      before_week_date,
      end_price,
      before_price,
      (end_price - before_price) / end_price AS rate,
      @back_week AS back_week
    FROM
      (
        SELECT
          NAME,
          trading_date AS end_date,
          closing_price AS end_price
        FROM
          tbl_kline
        WHERE
          trading_date = (
            SELECT
              MAX(trading_date)
            FROM
              tbl_kline
            WHERE
              trading_date >= DATE_ADD(DATE_SUB( DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE())  DAY ), INTERVAL  @back_week  WEEK), INTERVAL 4 day)
              AND trading_date <= curdate()
          )
      ) AS t1
      JOIN (
        SELECT
          NAME,
          trading_date AS before_week_date,
          closing_price AS before_price
        FROM
          tbl_kline
        WHERE
          trading_date = (
            SELECT
              min(trading_date)
            FROM
              tbl_kline
            WHERE
              trading_date >= DATE_ADD(DATE_SUB( DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE())  DAY ), INTERVAL  @back_week  WEEK), INTERVAL 4 day)
              AND trading_date <= curdate()
          )
      ) t2 ON t1.NAME = t2.NAME
    ORDER BY
      rate DESC
  ) t