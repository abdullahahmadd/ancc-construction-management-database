-- View All Tables
SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- View Table Count
SELECT COUNT(*) AS total_tables
FROM information_schema.tables
WHERE table_schema = 'public';

-- View All Foreign Keys
SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu
ON tc.constraint_name = ccu.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
ORDER BY tc.table_name;

-- View All Primary Keys
SELECT
    tc.table_name,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
ON tc.constraint_name = kcu.constraint_name
WHERE tc.constraint_type='PRIMARY KEY'
ORDER BY tc.table_name;

-- View All Indexes
SELECT
    tablename,
    indexname
FROM pg_indexes
WHERE schemaname='public'
ORDER BY tablename;

