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
		1 AS pid,
		s_name AS cur_s_name,
		s_code as cur_s_code,
		end_price AS cur_s_price
	FROM
		stock_rank
	WHERE
		end_dt = DATE_ADD( SUBDATE( CURDATE( ), WEEKDAY( CURDATE( ) ) ), INTERVAL 4 DAY )
		AND rn = 1
		AND back_week = 4
	) AS t1
	JOIN (
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
		( kl.closing_price * prev_s_number ) AS cur_p_value
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
			pid = 1
			AND period = ( SELECT max( period ) FROM position_period_snapshot WHERE pid = 1 )
		) AS t
		JOIN tbl_kline AS kl ON t.prev_s_code = kl.CODE
	AND t.cur_period_time = kl.trading_date
	) AS t2 ON t1.pid = t2.pid
union all
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
		2 AS pid,
		s_name AS cur_s_name,
		s_code as cur_s_code,
		end_price AS cur_s_price
	FROM
		stock_rank
	WHERE
		end_dt = DATE_ADD( SUBDATE( CURDATE( ), WEEKDAY( CURDATE( ) ) ), INTERVAL 4 DAY )
		AND rn = 1
		AND back_week = 3
	) AS t1
	JOIN (
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
		( kl.closing_price * prev_s_number ) AS cur_p_value
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
			pid = 2
			AND period = ( SELECT max( period ) FROM position_period_snapshot WHERE pid = 2 )
		) AS t
		JOIN tbl_kline AS kl ON t.prev_s_code = kl.CODE
	AND t.cur_period_time = kl.trading_date
	) AS t2 ON t1.pid = t2.pid


union all
select
	'3 周回测 + 择时' as title,
	case when
		rate<0 then '空仓'
	else
		CONCAT('买入',s_name)
	END as 操作
FROM
(
	select s_name
	from stock_rank
	where end_dt = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
	and rn =1 and back_week=3
) as t1
join
(
	select rate
	from stock_rank
	where s_name =
		(
			select
				s_name
			from stock_rank
			where end_dt = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
					and rn =1 and back_week=3
		)
	and back_week=1

) as t2
on t1.pid=t2.pid