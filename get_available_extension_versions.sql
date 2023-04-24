select * from pg_catalog.pg_available_extension_versions;

-- and then we can query for specific extension like this:
select * from pg_catalog.pg_available_extension_versions where name = 'timescaledb_toolkit';
