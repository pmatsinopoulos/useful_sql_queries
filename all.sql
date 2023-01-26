-- POSTGRES
-----------
-- Running for more than 5 minutes.
SELECT
  pid,
  now() - pg_stat_activity.query_start AS duration,
  query,
  state
FROM pg_stat_activity
WHERE (now() - pg_stat_activity.query_start) > interval '5 minutes';
-----------------------------------------------------------------------
-- Get the size of a table on disk
SELECT pg_size_pretty(pg_total_relation_size('"<schema>"."<table>"'));
-----------------------------------------------------------------------
