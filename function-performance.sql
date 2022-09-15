SELECT
       schemaname,
       funcname,
       calls,
       date_trunc('milliseconds', round(total_time) / 1000 * '1 second'::interval) AS total_time,
       date_trunc('milliseconds', round(self_time) / 1000 * '1 second'::interval) AS self_time,
       trunc((round(total_time) / calls)::numeric, 2) AS average_time_ms,
       (self_time / total_time * 100)::numeric(20,2) AS self_time_ratio
FROM pg_stat_user_functions
ORDER BY calls DESC;