INSERT INTO `stock`.`stock_rank`(`s_code`, `s_name`, `period`, `back_week`, `end_dt`, `prev_dt`, `end_price`, `prev_price`, `rate`,`rn`)
SELECT
s_code,
	s_name,
	0 AS period,
	back_week,
	end_dt,
	prev_dt,
	end_price,
	prev_price,
	rate,
	rn
FROM
	(
	SELECT
		s_name,
		s_code,
		end_dt,
		prev_dt,
		end_price,
		prev_price,
		rate,
		back_week,
		row_number ( ) over ( ORDER BY rate DESC ) AS rn
	FROM
		(
		SELECT
			t1.NAME AS s_name,
			t1.CODE AS s_code,
			end_dt,
			prev_dt,
			end_price,
			prev_price,
			( end_price - prev_price ) / end_price AS rate,
			4 AS back_week
		FROM
			(
			SELECT NAME
				,
				CODE,
				trading_date AS end_dt,
				closing_price AS end_price
			FROM
				tbl_kline
			WHERE
				trading_date = (
				SELECT
					MAX( trading_date )
				FROM
					tbl_kline
				WHERE
					trading_date >= DATE_ADD( DATE_SUB( DATE_SUB( CURDATE( ), INTERVAL WEEKDAY( CURDATE( ) ) DAY ), INTERVAL 4 WEEK ), INTERVAL 4 DAY )
					AND trading_date <= curdate( )
				)
			) AS t1
			JOIN (
			SELECT NAME
				,
				CODE,
				trading_date AS prev_dt,
				closing_price AS prev_price
			FROM
				tbl_kline
			WHERE
				trading_date = (
				SELECT
					min( trading_date )
				FROM
					tbl_kline
				WHERE
					trading_date >= DATE_ADD( DATE_SUB( DATE_SUB( CURDATE( ), INTERVAL WEEKDAY( CURDATE( ) ) DAY ), INTERVAL 4 WEEK ), INTERVAL 4 DAY )
					AND trading_date <= curdate( )
				)
			) t2 ON t1.NAME = t2.NAME
		) t
	UNION ALL
	SELECT
		s_name,
		s_code,
		end_dt,
		prev_dt,
		end_price,
		prev_price,
		rate,
		back_week,
		row_number ( ) over ( ORDER BY rate DESC ) AS rn
	FROM
		(
		SELECT
			t1.NAME AS s_name,
			t1.CODE AS s_code,
			end_dt,
			prev_dt,
			end_price,
			prev_price,
			( end_price - prev_price ) / end_price AS rate,
			3 AS back_week
		FROM
			(
			SELECT NAME
				,
				CODE,
				trading_date AS end_dt,
				closing_price AS end_price
			FROM
				tbl_kline
			WHERE
				trading_date = (
				SELECT
					MAX( trading_date )
				FROM
					tbl_kline
				WHERE
					trading_date >= DATE_ADD( DATE_SUB( DATE_SUB( CURDATE( ), INTERVAL WEEKDAY( CURDATE( ) ) DAY ), INTERVAL 3 WEEK ), INTERVAL 4 DAY )
					AND trading_date <= curdate( )
				)
			) AS t1
			JOIN (
			SELECT NAME
				,
				CODE,
				trading_date AS prev_dt,
				closing_price AS prev_price
			FROM
				tbl_kline
			WHERE
				trading_date = (
				SELECT
					min( trading_date )
				FROM
					tbl_kline
				WHERE
					trading_date >= DATE_ADD( DATE_SUB( DATE_SUB( CURDATE( ), INTERVAL WEEKDAY( CURDATE( ) ) DAY ), INTERVAL 3 WEEK ), INTERVAL 4 DAY )
					AND trading_date <= curdate( )
				)
			) t2 ON t1.NAME = t2.NAME
		) t
	UNION ALL
	SELECT
		s_name,
		s_code,
		end_dt,
		prev_dt,
		end_price,
		prev_price,
		rate,
		back_week,
		row_number ( ) over ( ORDER BY rate DESC ) AS rn
	FROM
		(
		SELECT
			t1.NAME AS s_name,
			t1.CODE AS s_code,
			end_dt,
			prev_dt,
			end_price,
			prev_price,
			( end_price - prev_price ) / end_price AS rate,
			1 AS back_week
		FROM
			(
			SELECT NAME
				,
				CODE,
				trading_date AS end_dt,
				closing_price AS end_price
			FROM
				tbl_kline
			WHERE
				trading_date = (
				SELECT
					MAX( trading_date )
				FROM
					tbl_kline
				WHERE
					trading_date >= DATE_ADD( DATE_SUB( DATE_SUB( CURDATE( ), INTERVAL WEEKDAY( CURDATE( ) ) DAY ), INTERVAL 1 WEEK ), INTERVAL 4 DAY )
					AND trading_date <= curdate( )
				)
			) AS t1
			JOIN (
			SELECT NAME
				,
				CODE,
				trading_date AS prev_dt,
				closing_price AS prev_price
			FROM
				tbl_kline
			WHERE
				trading_date = (
				SELECT
					min( trading_date )
				FROM
					tbl_kline
				WHERE
					trading_date >= DATE_ADD( DATE_SUB( DATE_SUB( CURDATE( ), INTERVAL WEEKDAY( CURDATE( ) ) DAY ), INTERVAL 1 WEEK ), INTERVAL 4 DAY )
					AND trading_date <= curdate( )
				)
			) t2 ON t1.NAME = t2.NAME
		) t
	) t