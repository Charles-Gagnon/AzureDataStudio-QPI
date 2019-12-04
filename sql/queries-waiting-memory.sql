SELECT TOP 10 query_id, [wait time(sec)] = CAST(wait_time_ms /1000 AS NUMERIC(8,1)),
	start_time, end_time, query_text_id, execution_type_desc
FROM qpi.db_query_wait_stats_as_of(null)
WHERE category = 'Memory'
AND wait_time_ms > 50
ORDER BY wait_time_ms DESC