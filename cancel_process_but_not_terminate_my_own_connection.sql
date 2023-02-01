SELECT pg_cancel_backend(pid)
FROM pg_stat_activity
WHERE pid <> pg_backend_pid();

-- If first option does not work, this is a bit more forceful may affect additional queries being ran and the connection may be reset
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE pid <> pg_backend_pid();
