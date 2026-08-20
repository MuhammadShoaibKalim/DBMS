# SQL Master Guide: Comprehensive Syntax, Architecture & Practical Reference

> **Author**: Senior Database Engineer (15+ Years Industry Experience)  
> **Scope**: ANSI SQL standard with specific implementation notes for PostgreSQL, MySQL/MariaDB, MS SQL Server, and Oracle.  
> **Format**: Structured reference with Interactive Collapsible Toggle Sections, Precise Syntax, Real-World Examples, Execution Order, and Performance Best Practices.  
> **Note**: Zero emojis. Clear technical formatting and text badges used throughout.

---

## Interactive Table of Contents

- [SECTION 01: SQL Fundamentals, Classification & Execution Order](#section-01-sql-fundamentals-classification--execution-order)
- [SECTION 02: DDL (Data Definition Language) - Schema Design & Constraints](#section-02-ddl-data-definition-language---schema-design--constraints)
- [SECTION 03: DML (Data Manipulation Language) - CRUD Operations](#section-03-dml-data-manipulation-language---crud-operations)
- [SECTION 04: DQL (Data Query Language) - Filtering, Sorting & Operators](#section-04-dql-data-query-language---filtering-sorting--operators)
- [SECTION 05: Aggregations, Grouping & Conditional Logic](#section-05-aggregations-grouping--conditional-logic)
- [SECTION 06: Joins Masterclass (Relational Data Combining)](#section-06-joins-masterclass-relational-data-combining)
- [SECTION 07: Set Operations (UNION, INTERSECT, EXCEPT)](#section-07-set-operations-union-intersect-except)
- [SECTION 08: Subqueries & Common Table Expressions (CTEs)](#section-08-subqueries--common-table-expressions-ctes)
- [SECTION 09: Advanced Analytics & Window Functions](#section-09-advanced-analytics--window-functions)
- [SECTION 10: Database Objects - Views, Materialized Views & Indexes](#section-10-database-objects---views-materialized-views--indexes)
- [SECTION 11: Programmability - Stored Procedures, Functions & Triggers](#section-11-programmability---stored-procedures-functions--triggers)
- [SECTION 12: Transactions, Concurrency & Locking (TCL)](#section-12-transactions-concurrency--locking-tcl)
- [SECTION 13: Query Performance Optimization & Anti-Patterns](#section-13-query-performance-optimization--anti-patterns)

---

<details open>
<summary><h2>[SECTION 01] SQL Fundamentals, Classification & Execution Order</h2></summary>

### 1. SQL Sublanguage Classifications

| Sublanguage | Full Name | Primary Purpose | Key Commands |
| :--- | :--- | :--- | :--- |
| **DDL** | Data Definition Language | Define, alter, and manage database structures/schema | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME` |
| **DML** | Data Manipulation Language | Modify, insert, and remove actual data rows | `INSERT`, `UPDATE`, `DELETE`, `MERGE` |
| **DQL** | Data Query Language | Retrieve and query data from tables | `SELECT` |
| **DCL** | Data Control Language | Manage permissions and access privileges | `GRANT`, `REVOKE` |
| **TCL** | Transaction Control Language | Manage transaction boundaries and concurrency | `BEGIN / START`, `COMMIT`, `ROLLBACK`, `SAVEPOINT` |

---

### 2. Logical Query Processing Order (How SQL Actually Executes)
SQL is declarative: you write queries in lexical syntax, but the database engine executes clauses in a strict logical order:

```
[Written Query Syntax Order]                     [Logical Engine Execution Order]
1. SELECT                                        1. FROM & JOINs (Row source collection)
2. FROM & JOIN                                   2. ON (Join filter evaluation)
3. WHERE                                         3. WHERE (Row-level filtering)
4. GROUP BY                                      4. GROUP BY (Grouping row sets)
5. HAVING                                        5. HAVING (Group-level filtering)
6. WINDOW functions                              6. SELECT (Expression evaluation & projections)
7. ORDER BY                                      7. DISTINCT (Duplicate elimination)
8. LIMIT / OFFSET                                8. ORDER BY (Sorting output rows)
                                                 9. LIMIT / OFFSET / TOP (Pagination)
```

> **Key Rule**: Because `WHERE` (Step 3) executes before `SELECT` (Step 6), you **cannot** use column aliases defined in `SELECT` inside the `WHERE` clause.

---

### 3. Common SQL Data Types

| Category | Standard Data Types | Description & Best Practice |
| :--- | :--- | :--- |
| **Integer Numbers** | `SMALLINT` (2B), `INT / INTEGER` (4B), `BIGINT` (8B) | Use `BIGINT` for auto-incrementing primary keys in high-growth tables. |
| **Exact Decimals** | `NUMERIC(precision, scale)`, `DECIMAL(p, s)` | Mandatory for financial amounts, currency, and scientific precision. |
| **Approximate Numbers** | `FLOAT`, `DOUBLE PRECISION`, `REAL` | Fast mathematical computations; avoid for currency due to rounding errors. |
| **Fixed Strings** | `CHAR(n)` | Fixed-length (pads with spaces). Ideal for fixed codes (e.g., country code `CHAR(2)`). |
| **Variable Strings** | `VARCHAR(n)`, `TEXT` | Variable-length strings up to specified maximum length. |
| **Date & Time** | `DATE`, `TIME`, `TIMESTAMP`, `TIMESTAMPTZ` | Always prefer `TIMESTAMPTZ` (timestamp with timezone) for universal UTC storage. |
| **Boolean** | `BOOLEAN` (`TRUE`, `FALSE`, `UNKNOWN / NULL`) | SQL uses 3-valued logic (3VL). |
| **Semi-Structured** | `JSON`, `JSONB`, `XML` | `JSONB` stores decomposed binary JSON with indexable keys (PostgreSQL). |

</details>

---

<details>
<summary><h2>[SECTION 02] DDL (Data Definition Language) - Schema Design & Constraints</h2></summary>

<details>
<summary><b>[DDL-1] Table Creation with Production Constraints</b></summary>

```sql
-- Create Department Table
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    budget NUMERIC(14, 2) NOT NULL CHECK (budget > 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create Employee Table with Foreign Key & Check Constraints
CREATE TABLE employees (
    emp_id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    salary NUMERIC(12, 2) NOT NULL CHECK (salary >= 30000.00),
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE,
    dept_id INT NOT NULL,
    manager_id BIGINT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' 
        CHECK (status IN ('ACTIVE', 'ON_LEAVE', 'TERMINATED')),
    
    -- Foreign Key Constraints
    CONSTRAINT fk_emp_department 
        FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_emp_manager 
        FOREIGN KEY (manager_id) 
        REFERENCES employees(emp_id) 
        ON DELETE SET NULL
);
```

#### Foreign Key Referential Actions:
- **`ON DELETE RESTRICT / NO ACTION`**: Prevents parent row deletion if child rows reference it (Default safe behavior).
- **`ON DELETE CASCADE`**: Automatically deletes all child rows when the parent row is deleted.
- **`ON DELETE SET NULL`**: Sets the foreign key column in child rows to `NULL` when the parent row is deleted.
- **`ON DELETE SET DEFAULT`**: Sets the foreign key in child rows to its defined default value.

</details>

<details>
<summary><b>[DDL-2] Altering Existing Tables (`ALTER TABLE`)</b></summary>

```sql
-- 1. Add a new column
ALTER TABLE employees ADD COLUMN phone_number VARCHAR(20) NULL;

-- 2. Drop a column
ALTER TABLE employees DROP COLUMN phone_number;

-- 3. Modify column data type and nullability
ALTER TABLE employees ALTER COLUMN first_name TYPE VARCHAR(100);
ALTER TABLE employees ALTER COLUMN phone_number SET NOT NULL;

-- 4. Add a new constraint
ALTER TABLE employees ADD CONSTRAINT chk_emp_salary_max CHECK (salary <= 1000000);

-- 5. Drop a constraint
ALTER TABLE employees DROP CONSTRAINT chk_emp_salary_max;

-- 6. Rename a column
ALTER TABLE employees RENAME COLUMN status TO employment_status;

-- 7. Rename a table
ALTER TABLE departments RENAME TO company_departments;
```

</details>

<details>
<summary><b>[DDL-3] Dropping vs. Truncating Tables</b></summary>

```sql
-- TRUNCATE: Deletes all rows rapidly by deallocating storage pages. Keeps table schema intact.
TRUNCATE TABLE employees RESTART IDENTITY CASCADE;

-- DROP: Permanently destroys table structure, indexes, constraints, and all data rows.
DROP TABLE IF EXISTS employees CASCADE;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 03] DML (Data Manipulation Language) - CRUD Operations</h2></summary>

<details>
<summary><b>[DML-1] Inserting Records (`INSERT`)</b></summary>

```sql
-- Single-row Insert
INSERT INTO departments (dept_name, budget)
VALUES ('Engineering', 5000000.00);

-- Multi-row Bulk Insert
INSERT INTO employees (first_name, last_name, email, salary, dept_id)
VALUES 
    ('Alice', 'Smith', 'alice@company.com', 95000.00, 1),
    ('Bob', 'Jones', 'bob@company.com', 85000.00, 1),
    ('Charlie', 'Brown', 'charlie@company.com', 72000.00, 1);

-- Insert From Query (Table Copy)
INSERT INTO archived_employees (emp_id, full_name, termination_date)
SELECT emp_id, CONCAT(first_name, ' ', last_name), CURRENT_DATE
FROM employees
WHERE status = 'TERMINATED';
```

</details>

<details>
<summary><b>[DML-2] Updating Records (`UPDATE`)</b></summary>

```sql
-- Basic Update with WHERE condition
UPDATE employees
SET salary = salary * 1.10,
    status = 'ACTIVE'
WHERE dept_id = 1 AND salary < 80000;

-- Conditional Update with CASE statement
UPDATE employees
SET salary = CASE 
    WHEN dept_id = 1 THEN salary * 1.08  -- 8% raise for Engineering
    WHEN dept_id = 2 THEN salary * 1.05  -- 5% raise for Sales
    ELSE salary * 1.03                   -- 3% raise for others
END;

-- Update with JOIN (PostgreSQL syntax)
UPDATE employees e
SET salary = e.salary + 5000
FROM departments d
WHERE e.dept_id = d.dept_id AND d.dept_name = 'Engineering';
```

</details>

<details>
<summary><b>[DML-3] Deleting Records (`DELETE`)</b></summary>

```sql
-- Delete with specific WHERE filter
DELETE FROM employees
WHERE status = 'TERMINATED' AND hire_date < '2020-01-01';

-- Delete using Subquery
DELETE FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE is_active = FALSE);
```

</details>

<details>
<summary><b>[DML-4] Upsert / Merge Operations (`ON CONFLICT` / `ON DUPLICATE KEY`)</b></summary>

```sql
-- PostgreSQL Upsert (INSERT ... ON CONFLICT DO UPDATE)
INSERT INTO product_inventory (product_id, quantity, last_updated)
VALUES (101, 50, CURRENT_TIMESTAMP)
ON CONFLICT (product_id) 
DO UPDATE SET 
    quantity = product_inventory.quantity + EXCLUDED.quantity,
    last_updated = EXCLUDED.last_updated;

-- MySQL Upsert (INSERT ... ON DUPLICATE KEY UPDATE)
INSERT INTO product_inventory (product_id, quantity)
VALUES (101, 50)
ON DUPLICATE KEY UPDATE 
    quantity = quantity + VALUES(quantity);
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 04] DQL (Data Query Language) - Filtering, Sorting & Operators</h2></summary>

<details>
<summary><b>[DQL-1] Basic Selection & Aliases</b></summary>

```sql
-- Projecting specific columns with aliases
SELECT 
    emp_id AS employee_identifier,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    salary * 12 AS annual_compensation
FROM employees;

-- Unique distinct values
SELECT DISTINCT dept_id, status
FROM employees;
```

</details>

<details>
<summary><b>[DQL-2] Logical Operators: `AND`, `OR`, `NOT`, `BETWEEN`, `IN`</b></summary>

```sql
-- AND: All conditions must evaluate to TRUE
SELECT first_name, salary, dept_id
FROM employees
WHERE dept_id = 1 AND salary >= 80000;

-- OR: At least one condition must evaluate to TRUE
SELECT first_name, status
FROM employees
WHERE status = 'ON_LEAVE' OR status = 'TERMINATED';

-- NOT: Negates condition
SELECT first_name, status
FROM employees
WHERE NOT (status = 'TERMINATED');

-- BETWEEN: Inclusive range check (salary >= 60000 AND salary <= 90000)
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 60000 AND 90000;

-- IN: Matches any value in a defined list or subquery
SELECT first_name, dept_id
FROM employees
WHERE dept_id IN (1, 3, 5);

-- NOT IN: Matches values outside the list
SELECT first_name, dept_id
FROM employees
WHERE dept_id NOT IN (2, 4);
```

</details>

<details>
<summary><b>[DQL-3] Pattern Matching: `LIKE`, `ILIKE`, Wildcards</b></summary>

| Wildcard | Meaning | Example Pattern | Matches |
| :--- | :--- | :--- | :--- |
| `%` | Zero, one, or multiple characters | `'J%'` | `John`, `Jane`, `J` |
| `_` | Exactly one single character | `'J_ne'` | `Jane`, `June` |
| `%...%` | Substring match anywhere | `'%tech%'` | `Fintech`, `Biotechnology` |

```sql
-- Find emails ending with company domain
SELECT email FROM employees WHERE email LIKE '%@company.com';

-- Case-insensitive pattern matching (PostgreSQL)
SELECT first_name FROM employees WHERE first_name ILIKE 'john%';

-- Escape character when searching for literal '%' or '_'
SELECT project_name FROM projects WHERE project_name LIKE '%\%%' ESCAPE '\';
```

</details>

<details>
<summary><b>[DQL-4] Handling NULLs: `IS NULL`, `IS NOT NULL`, `COALESCE`, `NULLIF`</b></summary>

> **Crucial Rule**: In SQL, `NULL = NULL` evaluates to `UNKNOWN`, not `TRUE`. You **must** use `IS NULL` or `IS NOT NULL`.

```sql
-- Find employees without an assigned manager
SELECT first_name FROM employees WHERE manager_id IS NULL;

-- Find employees with an assigned manager
SELECT first_name FROM employees WHERE manager_id IS NOT NULL;

-- COALESCE: Returns the first non-null argument in list
SELECT 
    first_name,
    COALESCE(phone_number, 'No Phone Provided') AS contact_phone,
    COALESCE(bonus, commission, 0) AS total_variable_pay
FROM employees;

-- NULLIF: Returns NULL if both arguments are equal (prevents division by zero)
SELECT 
    dept_id,
    total_revenue / NULLIF(total_units, 0) AS revenue_per_unit
FROM sales_summary;
```

</details>

<details>
<summary><b>[DQL-5] Sorting & Pagination (`ORDER BY`, `LIMIT`, `OFFSET`)</b></summary>

```sql
-- Sorting by multiple columns with explicit direction
SELECT first_name, last_name, salary, hire_date
FROM employees
ORDER BY salary DESC, hire_date ASC;

-- Handling NULL sorting positions
SELECT first_name, manager_id
FROM employees
ORDER BY manager_id ASC NULLS LAST;

-- Pagination: Top 10 highest earners
SELECT emp_id, first_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 10 OFFSET 0;

-- Standard ANSI SQL Pagination (OFFSET ... FETCH NEXT)
SELECT emp_id, first_name, salary
FROM employees
ORDER BY salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 05] Aggregations, Grouping & Conditional Logic</h2></summary>

<details>
<summary><b>[AGG-1] Aggregate Functions</b></summary>

```sql
SELECT 
    COUNT(*) AS total_employees,                   -- Counts all rows including NULLs
    COUNT(manager_id) AS employees_with_manager,  -- Counts only non-NULL values
    COUNT(DISTINCT dept_id) AS active_dept_count,  -- Unique department count
    SUM(salary) AS total_payroll,
    AVG(salary) AS average_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary
FROM employees;
```

</details>

<details>
<summary><b>[AGG-2] `GROUP BY` Clause & Rules</b></summary>

> **Rule of GROUP BY**: Every non-aggregated column in the `SELECT` list **must** appear in the `GROUP BY` clause.

```sql
-- Department-wise Salary Breakdown
SELECT 
    dept_id,
    status,
    COUNT(*) AS employee_count,
    AVG(salary) AS avg_dept_salary,
    SUM(salary) AS total_dept_cost
FROM employees
GROUP BY dept_id, status;
```

</details>

<details>
<summary><b>[AGG-3] `HAVING` vs. `WHERE`</b></summary>

| Clause | Filter Level | Can Use Aggregate Functions? | Execution Step |
| :--- | :--- | :--- | :--- |
| **`WHERE`** | Individual table rows before grouping | **No** | Step 3 (Pre-grouping) |
| **`HAVING`** | Summarized aggregated groups | **Yes** (`HAVING AVG(salary) > 50000`) | Step 5 (Post-grouping) |

```sql
-- Filter rows with WHERE, then filter aggregated groups with HAVING
SELECT 
    dept_id,
    COUNT(*) AS emp_count,
    AVG(salary) AS avg_salary
FROM employees
WHERE status = 'ACTIVE'                -- Step 1: Filter individual active rows
GROUP BY dept_id
HAVING COUNT(*) >= 5 AND AVG(salary) > 75000; -- Step 2: Filter departments meeting criteria
```

</details>

<details>
<summary><b>[AGG-4] Conditional Expressions (`CASE WHEN`)</b></summary>

```sql
-- Classify employee compensation bands
SELECT 
    first_name,
    salary,
    CASE 
        WHEN salary >= 100000 THEN 'Executive Tier'
        WHEN salary >= 70000 THEN 'Senior Tier'
        WHEN salary >= 50000 THEN 'Mid-Level Tier'
        ELSE 'Junior Tier'
    END AS compensation_tier
FROM employees;

-- Pivot query using conditional aggregation (Count active/terminated per dept)
SELECT 
    dept_id,
    COUNT(CASE WHEN status = 'ACTIVE' THEN 1 END) AS active_count,
    COUNT(CASE WHEN status = 'ON_LEAVE' THEN 1 END) AS leave_count,
    COUNT(CASE WHEN status = 'TERMINATED' THEN 1 END) AS terminated_count
FROM employees
GROUP BY dept_id;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 06] Joins Masterclass (Relational Data Combining)</h2></summary>

<details>
<summary><b>[JOIN-1] Visual Join Architecture Overview</b></summary>

```
  [INNER JOIN]           [LEFT JOIN]            [RIGHT JOIN]           [FULL OUTER]
   Matching only        All Left + Match       All Right + Match       All Both Sides
     +---+---+              +---+---+              +---+---+              +---+---+
     |   |XXX|   |          |XXX|XXX|   |          |   |XXX|XXX|          |XXX|XXX|XXX|
     +---+---+              +---+---+              +---+---+              +---+---+
      TableA TableB          TableA TableB          TableA TableB          TableA TableB
```

</details>

<details>
<summary><b>[JOIN-2] Practical Join Query Syntax</b></summary>

```sql
-- 1. INNER JOIN: Returns rows with matching keys in both tables
SELECT e.first_name, e.salary, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- 2. LEFT JOIN (Left Outer): Returns all left rows, plus matching right rows (or NULL)
SELECT e.first_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- 3. Find Orphan Rows (Anti-Join Pattern: Left rows with no right match)
SELECT e.emp_id, e.first_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- 4. RIGHT JOIN: Returns all right rows, plus matching left rows
SELECT e.first_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- 5. FULL OUTER JOIN: Returns all rows from both tables, filling NULLs where no match
SELECT e.first_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.dept_id = d.dept_id;

-- 6. SELF JOIN: Joining a table to itself (e.g., Employee -> Manager relationship)
SELECT 
    emp.first_name AS employee_name,
    mgr.first_name AS manager_name
FROM employees emp
LEFT JOIN employees mgr ON emp.manager_id = mgr.emp_id;

-- 7. CROSS JOIN: Cartesian Product (Every row in Table A combined with every row in Table B)
SELECT d.dept_name, s.shift_name
FROM departments d
CROSS JOIN work_shifts s;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 07] Set Operations (UNION, INTERSECT, EXCEPT)</h2></summary>

<details>
<summary><b>[SET-1] Rules for Set Operations</b></summary>

1. Both `SELECT` statements must return the **exact same number of columns**.
2. Corresponding columns must have **compatible data types**.
3. Column names in the final result set are taken from the **first** `SELECT` query.

```sql
-- UNION: Combines result sets and removes duplicate rows (Performs expensive Sort/Unique)
SELECT city FROM customers
UNION
SELECT city FROM suppliers;

-- UNION ALL: Combines result sets keeping all duplicates (Ultra-fast, no sort overhead)
SELECT city FROM customers
UNION ALL
SELECT city FROM suppliers;

-- INTERSECT: Returns only rows that exist in BOTH queries
SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers;

-- EXCEPT / MINUS: Returns rows from first query that DO NOT exist in second query
SELECT city FROM customers
EXCEPT
SELECT city FROM suppliers;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 08] Subqueries & Common Table Expressions (CTEs)</h2></summary>

<details>
<summary><b>[SUBQ-1] Scalar & Multi-Row Subqueries</b></summary>

```sql
-- 1. Scalar Subquery in WHERE: Find employees earning above company average
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Multi-Row Subquery with IN
SELECT first_name, dept_id
FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE budget > 1000000);

-- 3. Multi-Row with ANY / ALL
-- ALL: Salary higher than EVERY employee in Department 2
SELECT first_name, salary
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE dept_id = 2);

-- 4. Correlated Subquery: Evaluated once per each outer row
-- Find employees earning more than the average of THEIR specific department
SELECT e.first_name, e.salary, e.dept_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(sub.salary) 
    FROM employees sub 
    WHERE sub.dept_id = e.dept_id
);

-- 5. EXISTS / NOT EXISTS (High-performance existence check)
SELECT d.dept_name
FROM departments d
WHERE EXISTS (
    SELECT 1 
    FROM employees e 
    WHERE e.dept_id = d.dept_id AND e.salary > 100000
);
```

</details>

<details>
<summary><b>[CTE-1] Common Table Expressions (`WITH` Clause)</b></summary>

```sql
-- Standard CTE: Improve readability and modularity over nested subqueries
WITH DepartmentPayroll AS (
    SELECT 
        dept_id,
        COUNT(*) AS total_staff,
        SUM(salary) AS total_payroll,
        AVG(salary) AS avg_payroll
    FROM employees
    GROUP BY dept_id
),
HighBudgetDepts AS (
    SELECT dept_id, dept_name 
    FROM departments 
    WHERE budget >= 1000000
)
SELECT 
    h.dept_name,
    p.total_staff,
    p.total_payroll
FROM HighBudgetDepts h
INNER JOIN DepartmentPayroll p ON h.dept_id = p.dept_id;

-- Recursive CTE: Generate Organizational Hierarchy Tree
WITH RECURSIVE OrgChart AS (
    -- Anchor member: Top-level CEO (no manager)
    SELECT emp_id, first_name, manager_id, 1 AS org_level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive member: Find direct reports of current level
    SELECT e.emp_id, e.first_name, e.manager_id, o.org_level + 1
    FROM employees e
    INNER JOIN OrgChart o ON e.manager_id = o.emp_id
)
SELECT * FROM OrgChart ORDER BY org_level, manager_id;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 09] Advanced Analytics & Window Functions</h2></summary>

<details>
<summary><b>[WINDOW-1] Window Function Mechanics & Syntax</b></summary>

Syntax: `FUNCTION() OVER (PARTITION BY col1 ORDER BY col2 [ROWS/RANGE frame])`

```sql
-- 1. Ranking Functions: ROW_NUMBER vs RANK vs DENSE_RANK
SELECT 
    emp_id,
    dept_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS row_num,
    RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS standard_rank,
    DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dense_rank
FROM employees;

/*
DENSE_RANK vs RANK Example:
Salaries: 100k, 100k, 80k
- ROW_NUMBER: 1, 2, 3
- RANK:       1, 1, 3  (Gaps after ties)
- DENSE_RANK: 1, 1, 2  (No gaps after ties)
*/

-- 2. Value Offset Functions: LAG and LEAD (Previous / Next row lookups)
SELECT 
    emp_id,
    hire_date,
    salary,
    LAG(salary, 1) OVER (ORDER BY hire_date) AS prev_hired_salary,
    LEAD(salary, 1) OVER (ORDER BY hire_date) AS next_hired_salary,
    salary - LAG(salary, 1) OVER (ORDER BY hire_date) AS salary_diff_from_previous
FROM employees;

-- 3. Running Totals & Moving Window Averages
SELECT 
    emp_id,
    dept_id,
    hire_date,
    salary,
    -- Running total within department
    SUM(salary) OVER (
        PARTITION BY dept_id 
        ORDER BY hire_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_dept_total,
    -- 3-Row Moving Average (Previous row, current row, next row)
    AVG(salary) OVER (
        ORDER BY hire_date 
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS three_row_moving_avg
FROM employees;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 10] Database Objects - Views, Materialized Views & Indexes</h2></summary>

<details>
<summary><b>[VIEW-1] Views & Materialized Views</b></summary>

```sql
-- Standard View: Virtual table (Saved SQL query executed at runtime)
CREATE VIEW v_active_engineering_staff AS
SELECT e.emp_id, e.first_name, e.last_name, e.salary, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
WHERE e.status = 'ACTIVE' AND d.dept_name = 'Engineering';

-- Querying the View
SELECT * FROM v_active_engineering_staff WHERE salary > 80000;

-- Materialized View: Physically stores the pre-computed query output on disk (PostgreSQL)
CREATE MATERIALIZED VIEW mv_monthly_dept_expenses AS
SELECT 
    dept_id,
    COUNT(*) AS total_staff,
    SUM(salary) AS total_payroll,
    CURRENT_DATE AS snapshot_date
FROM employees
GROUP BY dept_id;

-- Refreshing the Materialized View
REFRESH MATERIALIZED VIEW CONCURRENTLY mv_monthly_dept_expenses;
```

</details>

<details>
<summary><b>[INDEX-1] Index Types & Strategy</b></summary>

```sql
-- 1. Standard B-Tree Index on foreign key / lookup column
CREATE INDEX idx_employees_dept_id ON employees(dept_id);

-- 2. Composite Multi-Column Index (Column ordering matters: Equality first, range last)
CREATE INDEX idx_emp_dept_status_salary ON employees(dept_id, status, salary);

-- 3. Unique Index
CREATE UNIQUE INDEX idx_employees_email_lower ON employees(LOWER(email));

-- 4. Partial / Filtered Index (Postgres / SQL Server: Indexes only rows matching condition)
CREATE INDEX idx_emp_active_salary ON employees(salary) WHERE status = 'ACTIVE';

-- 5. Covering Index (Includes unindexed columns in leaf nodes to avoid bookmark lookups)
CREATE INDEX idx_emp_dept_include ON employees(dept_id) INCLUDE (first_name, salary);
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 11] Programmability - Stored Procedures, Functions & Triggers</h2></summary>

<details>
<summary><b>[PROC-1] Stored Procedures & Functions</b></summary>

```sql
-- PostgreSQL Stored Procedure (Supports Transaction COMMIT/ROLLBACK inside)
CREATE OR REPLACE PROCEDURE transfer_department_budget(
    sender_dept_id INT,
    receiver_dept_id INT,
    transfer_amount NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check sender balance
    IF (SELECT budget FROM departments WHERE dept_id = sender_dept_id) < transfer_amount THEN
        RAISE EXCEPTION 'Insufficient department budget for transfer';
    END IF;

    -- Debit sender
    UPDATE departments 
    SET budget = budget - transfer_amount 
    WHERE dept_id = sender_dept_id;

    -- Credit receiver
    UPDATE departments 
    SET budget = budget + transfer_amount 
    WHERE dept_id = receiver_dept_id;

    COMMIT;
END;
$$;

-- Calling the Procedure
CALL transfer_department_budget(1, 2, 50000.00);

-- User-Defined Scalar Function (UDF: Computes annual tax estimate)
CREATE OR REPLACE FUNCTION calculate_estimated_tax(annual_salary NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
DETERMINISTIC
AS $$
BEGIN
    RETURN annual_salary * 0.25;
END;
$$;

-- Using the function in standard queries
SELECT first_name, salary, calculate_estimated_tax(salary) AS estimated_tax
FROM employees;
```

</details>

<details>
<summary><b>[TRIGGER-1] Database Triggers (Audit Logging)</b></summary>

```sql
-- Create Audit Table
CREATE TABLE employee_audit_log (
    audit_id SERIAL PRIMARY KEY,
    emp_id BIGINT NOT NULL,
    old_salary NUMERIC(12, 2),
    new_salary NUMERIC(12, 2),
    changed_by VARCHAR(100) DEFAULT CURRENT_USER,
    changed_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Trigger Function
CREATE OR REPLACE FUNCTION log_salary_change()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO employee_audit_log (emp_id, old_salary, new_salary)
        VALUES (OLD.emp_id, OLD.salary, NEW.salary);
    END IF;
    RETURN NEW;
END;
$$;

-- Binding Trigger to Table
CREATE TRIGGER trg_salary_audit
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_salary_change();
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 12] Transactions, Concurrency & Locking (TCL)</h2></summary>

<details>
<summary><b>[TCL-1] Transaction Control & Explicit Locking</b></summary>

```sql
-- ACID Transaction Block
BEGIN TRANSACTION;

-- Pessimistic Lock: SELECT FOR UPDATE locks selected rows against concurrent writes
SELECT balance 
FROM bank_accounts 
WHERE account_id = 450 
FOR UPDATE;

UPDATE bank_accounts 
SET balance = balance - 1000.00 
WHERE account_id = 450;

UPDATE bank_accounts 
SET balance = balance + 1000.00 
WHERE account_id = 890;

-- Commit changes permanently to disk WAL
COMMIT;

-- Rollback on error example
BEGIN TRANSACTION;
UPDATE inventory SET stock = stock - 10 WHERE item_id = 99;
-- If error occurs:
ROLLBACK;
```

</details>

</details>

---

<details>
<summary><h2>[SECTION 13] Query Performance Optimization & Anti-Patterns</h2></summary>

<details>
<summary><b>[PERF-1] Top 10 Production SQL Anti-Patterns & Solutions</b></summary>

| Anti-Pattern | Why It Degrades Performance | Optimal Production Solution |
| :--- | :--- | :--- |
| **`SELECT *`** | Fetches unnecessary wide columns, wastes RAM/network, breaks index-only scans. | Explicitly name only needed columns: `SELECT id, name`. |
| **Function on Index** (`WHERE YEAR(created_at) = 2024`) | Invalidates B-Tree index; forces full table scan on every row. | Use SARGable range: `WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01'`. |
| **Leading Wildcard** (`WHERE name LIKE '%smith'`) | B-Tree index cannot seek backwards; triggers full sequential scan. | Use Full-Text Search (tsvector / Lucene) or Reverse B-Tree index. |
| **`NOT IN (Subquery)` with NULLs** | If the subquery returns even a single `NULL`, the entire condition returns empty set. | Replace with `NOT EXISTS (SELECT 1 ...)` or `LEFT JOIN ... WHERE right.id IS NULL`. |
| **`UNION` instead of `UNION ALL`** | Forces database engine to sort all output rows to remove duplicates. | Use `UNION ALL` unless duplicate suppression is strictly required. |
| **Implicit Type Conversion** (`WHERE varchar_col = 123`) | Database casts indexed string column to int for every row, invalidating index. | Match literal type: `WHERE varchar_col = '123'`. |
| **N+1 Query Loop in ORM** | Fires thousands of individual queries inside an application loop. | Use SQL `JOIN` or eager loading batch queries (`WHERE id IN (...)`). |
| **Missing Foreign Key Indexes** | Causes child table full scans on `ON DELETE CASCADE` or joins. | Always create secondary B-Tree indexes on all foreign key columns. |
| **Unindexed `ORDER BY` with `LIMIT`** | Database sorts millions of rows in memory/temp disk before returning 10. | Create an index covering both the filter and sort columns. |
| **Over-indexing Tables** | Slows down every `INSERT`, `UPDATE`, and `DELETE` operation. | Regularly monitor and remove unused/duplicate indexes. |

</details>

</details>

---

## Summary & Master Takeaways for SQL Engineers

1. **Understand Logical Execution Order**: Always remember that `FROM/WHERE` runs before `SELECT` and `ORDER BY`.
2. **Write SARGable Queries**: Avoid wrapping indexed columns in functions or calculations in the `WHERE` clause.
3. **Use the Right Tool for the Job**: Use CTEs for clarity, Window Functions for running calculations, and Materialized Views for heavy analytical summaries.
4. **Always Profile with `EXPLAIN ANALYZE`**: Verify index utilization, buffer reads, and join algorithms before deploying queries to production.
