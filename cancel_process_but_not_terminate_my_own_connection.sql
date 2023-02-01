SELECT pg_cancel_backend(pid)
FROM pg_stat_activity
WHERE pid <> pg_backend_pid();
