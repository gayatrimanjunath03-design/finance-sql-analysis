-- Finance SQL Analysis Project
-- File: 02_financial_analysis.sql
-- Purpose: Financial transaction analysis and business insights

-- 1. Create financial transactions table
CREATE TABLE financial_transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    category VARCHAR(50),
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2)
);

-- 2. Insert sample financial data
INSERT INTO financial_transactions
(transaction_id, transaction_date, category, transaction_type, amount)
VALUES
(1, '2026-01-05', 'Sales', 'Income', 15000),
(2, '2026-01-10', 'Marketing', 'Expense', 4000),
(3, '2026-01-15', 'Sales', 'Income', 18000),
(4, '2026-01-20', 'Operations', 'Expense', 6000),
(5, '2026-02-05', 'Sales', 'Income', 22000),
(6, '2026-02-10', 'Marketing', 'Expense', 5000),
(7, '2026-02-18', 'Sales', 'Income', 25000),
(8, '2026-02-25', 'Operations', 'Expense', 7000),
(9, '2026-03-05', 'Sales', 'Income', 28000),
(10, '2026-03-12', 'Marketing', 'Expense', 5500),
(11, '2026-03-20', 'Sales', 'Income', 30000),
(12, '2026-03-25', 'Operations', 'Expense', 7500);

-- 3. View all transactions
SELECT *
FROM financial_transactions;

-- 4. Calculate total income
SELECT
    SUM(amount) AS total_income
FROM financial_transactions
WHERE transaction_type = 'Income';

-- 5. Calculate total expenses
SELECT
    SUM(amount) AS total_expenses
FROM financial_transactions
WHERE transaction_type = 'Expense';

-- 6. Calculate net profit
SELECT
    SUM(
        CASE
            WHEN transaction_type = 'Income' THEN amount
            WHEN transaction_type = 'Expense' THEN -amount
        END
    ) AS net_profit
FROM financial_transactions;

-- 7. Income by category
SELECT
    category,
    SUM(amount) AS total_income
FROM financial_transactions
WHERE transaction_type = 'Income'
GROUP BY category
ORDER BY total_income DESC;

-- 8. Expenses by category
SELECT
    category,
    SUM(amount) AS total_expense
FROM financial_transactions
WHERE transaction_type = 'Expense'
GROUP BY category
ORDER BY total_expense DESC;

-- 9. Monthly financial performance
SELECT
    MONTH(transaction_date) AS month,
    SUM(
        CASE
            WHEN transaction_type = 'Income' THEN amount
            ELSE -amount
        END
    ) AS net_profit
FROM financial_transactions
GROUP BY MONTH(transaction_date)
ORDER BY month;

-- 10. Identify transactions above 20,000
SELECT
    transaction_id,
    transaction_date,
    category,
    amount
FROM financial_transactions
WHERE amount > 20000
ORDER BY amount DESC;
