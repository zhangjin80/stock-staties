select
'4 周回测 + 不择时择时' as title,
CONCAT('买入',stock_name) as 操作
from stock_rank
where end_date = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
and rn =1 and back_week=4
union all
select
'3 周回测 + 不择时择时' as title,
CONCAT('买入',stock_name) as 操作
from stock_rank
where end_date = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
and rn =1 and back_week=3

union all
select
	'4 周回测 + 择时择时' as title,
	case when
		rate<0 then '空仓'
	else
		CONCAT('买入',stock_name)
	END as 操作
FROM
(
	select stock_name
	from stock_rank
	where end_date = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
	and rn =1 and back_week=4
) as t1
join
(
	select rate
	from stock_rank
	where stock_name =
		(
			select
				stock_name
			from stock_rank
			where end_date = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
					and rn =1 and back_week=4
		)
	and back_week=1
) as t2

union all
select
	'3 周回测 + 择时择时' as title,
	case when
		rate<0 then '空仓'
	else
		CONCAT('买入',stock_name)
	END as 操作
FROM
(
	select stock_name
	from stock_rank
	where end_date = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
	and rn =1 and back_week=3
) as t1
join
(
	select rate
	from stock_rank
	where stock_name =
		(
			select
				stock_name
			from stock_rank
			where end_date = DATE_ADD(SUBDATE(CURDATE(), WEEKDAY(CURDATE())), INTERVAL  4   DAY )
					and rn =1 and back_week=3
		)
	and back_week=1

) as t2