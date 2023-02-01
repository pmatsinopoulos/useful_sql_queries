select pid,
usename,
pg_blocking_pids(pid) as blocked_by,
query as blocked_query,
now() - pg_stat_activity.query_start AS duration
from pg_stat_activity
where cardinality(pg_blocking_pids(pid)) > 0;
