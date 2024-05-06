USE bank;

SHOW Tables;
-- 1 

SELECT A2 AS district_name, A11 AS average_salary
FROM district
WHERE A11 > 10000;

-- 2

SELECT *
FROM bank.loan
WHERE status = 'B';

-- 3

SELECT *
FROM bank.card
WHERE type = 'junior'
LIMIT 10;

-- 4

SELECT amount AS debt, loan_id, account_id
FROM bank.loan
WHERE status = 'B';

-- 5

SELECT A2 AS district_name, ROUND (A4 * A10 / 100.0) AS urban_population
FROM district;


-- 6

SELECT A2 AS district_name, ROUND (A4 * A10 / 100.0) AS urban_population, A10
FROM district
WHERE A10 > 50.0;

-- 7

SELECT *
FROM bank.card
WHERE type = 'junior'
AND issued >= 980000;

-- 8

SELECT *
FROM bank.trans
WHERE operation = 'VYBER KARTOU'
ORDER BY date
LIMIT 10;

-- 9

SELECT loan_id, account_id, amount AS debt_value
FROM bank.loan
WHERE status = 'B'
AND amount > 1000
ORDER BY amount DESC;

-- 10

SELECT *
FROM trans
WHERE amount > 0
ORDER BY amount DESC
LIMIT 1;

SELECT *
FROM trans
WHERE amount > 0
ORDER BY amount ASC
LIMIT 1;