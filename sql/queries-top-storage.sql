-- Returns queries that used more than 0.5 MB of storage IO:
SELECT  query_id, [read(MB)] = physical_io_reads_kb/1024,
        count_executions,
        text,
        [Duration(sec)] = CAST(duration_s AS NUMERIC(8,1)), [CPU(sec)] = CAST(cpu_time_ms AS NUMERIC(8,1))/1000
FROM qpi.db_query_exec_stats_history
WHERE physical_io_reads_kb > 512
order by physical_io_reads_kb desc

-- Tip:
-- Use the following query to find the queries by id:
-- select * from qpi.db_queries where query_id = 38