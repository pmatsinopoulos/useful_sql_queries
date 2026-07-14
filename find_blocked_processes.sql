select
    blocked.pid as blocked_pid,
    blocked.query as blocked_query,
    now() - blocked.query_start as blocked_for,
    blocking.pid as blocking_pid,
    blocking.state as blocking_state,
    blocking.wait_event_type as blocking_wait,
    left(blocking.query, 200) as blocking_query,
    now() - blocking.xact_start as blocking_xact_age
from pg_stat_activity blocked
join pg_locks blocked_locks
  on blocked_locks.pid = blocked.pid
 and not blocked_locks.granted
join pg_locks blocking_locks
  on blocking_locks.locktype = blocked_locks.locktype
 and blocking_locks.database is not distinct from blocked_locks.database
 and blocking_locks.relation is not distinct from blocked_locks.relation
 and blocking_locks.page is not distinct from blocked_locks.page
 and blocking_locks.tuple is not distinct from blocked_locks.tuple
 and blocking_locks.virtualxid is not distinct from blocked_locks.virtualxid
 and blocking_locks.transactionid is not distinct from blocked_locks.transactionid
 and blocking_locks.classid is not distinct from blocked_locks.classid
 and blocking_locks.objid is not distinct from blocked_locks.objid
 and blocking_locks.objsubid is not distinct from blocked_locks.objsubid
 and blocking_locks.pid <> blocked_locks.pid
join pg_stat_activity blocking
  on blocking.pid = blocking_locks.pid
;
