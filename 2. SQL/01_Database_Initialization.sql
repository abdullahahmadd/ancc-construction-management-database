-- Returns the name of the current active database.
SELECT current_database();

-- Returns the name of the current active schema in the search path.
SELECT current_schema();

-- Lists all user-defined tables inside the public schema.
SELECT tablename
FROM pg_tables
WHERE schemaname = 'public';

-- Installs the extension to generate universally unique identifiers (UUIDs) if missing.
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Displays all currently installed extensions in the database.
SELECT * FROM pg_extension;

-- Adds a descriptive metadata comment to the specified database.
COMMENT ON DATABASE ancc_construction_db IS
'Al Noor Contracting Company Construction Project Management & Procurement Database developed using PostgreSQL.';

-- Retrieves the active database name, active schema name, and PostgreSQL server version info.
SELECT
    current_database(),
    current_schema(),
    version();
