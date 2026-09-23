-- Finance SQL Analysis Project
-- File: 03_business_insights.sql
-- Purpose: Business insights from financial data


-- 1. Calculate total revenue

SELECT
    SUM(amount) AS total_revenue
FROM financial_transactions
WHERE transaction_type = 'Income';


-- 2. Calculate total expenses

SELECT
    SUM(amount) AS total_expenses
FROM financial_transactions
WHERE transaction_type = 'Expense';


-- 3. Calculate overall profit

SELECT
    SUM(
        CASE
            WHEN transaction_type = 'Income' THEN amount
            ELSE -amount
        END
    ) AS total_profit
FROM financial_transactions;


-- 4. Calculate profit margin

SELECT
    ROUND(
        (
            SUM(
                CASE
                    WHEN transaction_type = 'Income' THEN amount
                    ELSE -amount
                END
            )
            /
            SUM(
                CASE
                    WHEN transaction_type = 'Income' THEN amount
                    ELSE 0
                END
            )
        ) * 100,
        2
    ) AS profit_margin_percentage
FROM financial_transactions;


-- 5. Find the highest expense category

SELECT
    category,
    SUM(amount) AS total_expense
FROM financial_transactions
WHERE transaction_type = 'Expense'
GROUP BY category
ORDER BY total_expense DESC
LIMIT 1;


-- 6. Find the highest income transaction

SELECT
    transaction_id,
    transaction_date,
    category,
    amount
FROM financial_transactions
WHERE transaction_type = 'Income'
ORDER BY amount DESC
LIMIT 1;


-- 7. Monthly revenue

SELECT
    MONTH(transaction_date) AS month,
    SUM(amount) AS monthly_revenue
FROM financial_transactions
WHERE transaction_type = 'Income'
GROUP BY MONTH(transaction_date)
ORDER BY month;


-- 8. Monthly expenses

SELECT
    MONTH(transaction_date) AS month,
    SUM(amount) AS monthly_expenses
FROM financial_transactions
WHERE transaction_type = 'Expense'
GROUP BY MONTH(transaction_date)
ORDER BY month;


-- 9. Monthly profit

SELECT
    MONTH(transaction_date) AS month,
    SUM(
        CASE
            WHEN transaction_type = 'Income' THEN amount
            ELSE -amount
        END
    ) AS monthly_profit
FROM financial_transactions
GROUP BY MONTH(transaction_date)
ORDER BY month;


-- 10. Identify transactions that require attention

SELECT
    transaction_id,
    transaction_date,
    category,
    transaction_type,
    amount
FROM financial_transactions
WHERE amount >= 20000
ORDER BY amount DESC;
