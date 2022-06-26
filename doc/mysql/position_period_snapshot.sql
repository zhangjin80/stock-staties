SELECT
	t1.pid,
	pname,
	period,
	cur_period_time,
	initial_value,
	prev_s_code,
	prev_s_name,
	prev_s_cur_price,
	prev_s_number,
	cur_p_value,
	cur_s_code,
	cur_s_name,
	cur_s_price,
	( cur_p_value / cur_s_price ) AS cur_s_number
FROM
	(
	SELECT
		( CASE WHEN back_week = 4 THEN 1 WHEN back_week = 3 THEN 2 ELSE NULL END ) AS pid,
		s_name AS cur_s_name,
		s_code AS cur_s_code,
		end_price AS cur_s_price
	FROM
		stock_rank
	WHERE
		end_dt = DATE_ADD( SUBDATE( CURDATE( ), WEEKDAY( CURDATE( ) ) ), INTERVAL 4 DAY )
		AND rn = 1
		AND back_week IN ( 3, 4 )
	) AS t1
	right JOIN (
	SELECT
		pid,
		pname,
		period,
		cur_period_time,
		initial_value,
		prev_s_code,
		prev_s_name,
		prev_s_number,
		kl.closing_price AS prev_s_cur_price,
		ifnull(( kl.closing_price * prev_s_number ),initial_value)AS cur_p_value
	FROM
		(
		SELECT
			pid,
			pname,
			period + 1 AS period,
			DATE_ADD( SUBDATE( CURDATE( ), WEEKDAY( CURDATE( ) ) ), INTERVAL 4 DAY ) AS cur_period_time,
			initial_value,
			cur_s_code AS prev_s_code,
			cur_s_name AS prev_s_name,
			cur_s_number AS prev_s_number
		FROM
			position_period_snapshot
		WHERE
			pid IN ( 1, 2 )
			AND period = ( SELECT max( period ) FROM position_period_snapshot )
		) AS t
		left JOIN tbl_kline AS kl ON t.prev_s_code = kl.CODE
	AND t.cur_period_time = kl.trading_date
	) AS t2 ON t1.pid = t2.pid