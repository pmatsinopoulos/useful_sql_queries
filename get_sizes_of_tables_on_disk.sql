SELECT c.relname AS "Table",
       pg_catalog.pg_size_pretty(pg_catalog.pg_relation_size(c.oid)) AS "Size"
FROM pg_catalog.pg_class c
JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind = 'r'           -- 'r' means ordinary table
  AND n.nspname = 'public'
ORDER BY pg_catalog.pg_relation_size(c.oid) DESC;
