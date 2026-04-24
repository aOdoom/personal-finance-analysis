--sum up total amount with any date in January and group amount by category
SELECT category, SUM(amount) AS total_amount
FROM dummy_expenses 
WHERE date LIKE '1/%/2026'
GROUP BY category;

--select all data from table where the amount exceeds 100 from both Auto and Education categories
SELECT *
FROM dummy_expenses
WHERE amount > 100
AND category IN ('Auto', 'Education');

---find total sum foor each category
SELECT SUM(amount) AS total_sum, category
FROM dummy_expenses
GROUP BY category
ORDER BY total_sum DESC;

--- number of rows
SELECT COUNT(*) FROM dummy_payoff_schedule;

---verifying both loans and strategies are present
SELECT loan_id, strategy, COUNT(*)
FROM dummy_payoff_schedule
GROUP BY loan_id, strategy;

---find sum of interest for each strategy loan
SELECT loan_id, strategy, SUM(interest) AS total_interest
FROM dummy_payoff_schedule
GROUP BY loan_id, strategy;

---- find total months to pay off under each strategy and loan
SELECT loan_id, strategy, MAX(month_num) AS total_months
FROM dummy_payoff_schedule
GROUP BY loan_id, strategy;

----find total interest saved under each loan
SELECT loan_id, strategy, SUM(interest) AS total_interest
FROM dummy_payoff_schedule
GROUP BY loan_id, strategy;

-- create interest summary view
CREATE VIEW interest_summary AS
SELECT loan_id, strategy, SUM(interest) AS total_interest
FROM dummy_payoff_schedule
GROUP BY loan_id, strategy;

-- use interest summary view to calculate and subtract interest for each strategy 
CREATE VIEW interest_saved AS
SELECT m.loan_id,
       m.total_interest - a.total_interest AS interest_saved
FROM interest_summary m
JOIN interest_summary a 
  ON m.loan_id = a.loan_id
WHERE m.strategy = 'minimum' 
  AND a.strategy = 'avalanche';

-- sum up results
SELECT SUM(interest_saved) AS total_sum
FROM  interest_saved;
