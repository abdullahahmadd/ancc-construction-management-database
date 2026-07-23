-- Create Branches Table
CREATE TABLE branches (
    branch_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    branch_code VARCHAR(20) NOT NULL UNIQUE,

    branch_name VARCHAR(100) NOT NULL,

    city VARCHAR(100) NOT NULL,

    region VARCHAR(100) NOT NULL,

    address TEXT,

    phone VARCHAR(20),

    email VARCHAR(255) UNIQUE,

    manager_name VARCHAR(100),

    opening_date DATE,

    status VARCHAR(20) NOT NULL DEFAULT 'Active'
        CHECK (status IN ('Active', 'Inactive')),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create Index for Branch Name

CREATE INDEX idx_branches_name
ON branches(branch_name);

-- =====================================================
-- Verify Branches Table Structure
-- =====================================================

SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'branches'
ORDER BY ordinal_position;

-- =====================================================
-- View All Branch Records
-- =====================================================

SELECT * FROM branches;