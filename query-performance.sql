SELECT
  date_trunc('milliseconds', round(total_time) / 1000 * '1 second'::interval) AS total_time,
  trunc((round(total_time) / calls)::numeric, 2) AS average_time_ms,
  calls,
  query
FROM pg_stat_statements
ORDER BY calls DESC
LIMIT 50;
