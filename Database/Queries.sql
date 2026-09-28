-- Display all freelancers
SELECT freelancer_id, freelancer_name, hourly_rate
FROM freelancers;

-- Available freelancers
SELECT freelancer_name, experience_years
FROM freelancers
WHERE availability_status = 'AVAILABLE';

-- Freelancers with rate between ₹800 and ₹1200
SELECT freelancer_name, hourly_rate
FROM freelancers
WHERE hourly_rate BETWEEN 800 AND 1200;

-- Freelancers whose name starts with A
SELECT freelancer_name
FROM freelancers
WHERE freelancer_name LIKE 'A%';

-- Different project categories
SELECT DISTINCT category
FROM projects;

-- Highest budget projects
SELECT project_title, budget
FROM projects
ORDER BY budget DESC;

-- Top 5 highest budget projects
SELECT project_title, budget
FROM projects
ORDER BY budget DESC
LIMIT 5;

-- Projects after first 5 records
SELECT project_id, project_title
FROM projects
LIMIT 5 OFFSET 5;

-- Projects that are not cancelled
SELECT project_title, project_status
FROM projects
WHERE project_status NOT IN ('CANCELLED');

-- Payments that are pending
SELECT payment_id, amount, payment_status
FROM payments
WHERE payment_status = 'PENDING';

-- Aggregate Queries
-- Total project budget
SELECT SUM(budget) AS total_project_budget
FROM projects;

-- Average freelancer hourly rate
SELECT AVG(hourly_rate) AS average_hourly_rate
FROM freelancers;

-- Maximum project budget
SELECT MAX(budget) AS highest_budget
FROM projects;

-- Minimum project budget
SELECT MIN(budget) AS lowest_budget
FROM projects;

-- Number of projects
SELECT COUNT(*) AS total_projects
FROM projects;

-- JOIN Queries
-- Projects with client names
SELECT
    p.project_title,
    c.client_name,
    p.budget
FROM projects p
INNER JOIN clients c
ON p.client_id = c.client_id;

-- Freelancer proposals
SELECT
    f.freelancer_name,
    p.project_title,
    pr.proposed_amount,
    pr.proposal_status
FROM proposals pr
INNER JOIN freelancers f
ON pr.freelancer_id = f.freelancer_id
INNER JOIN projects p
ON pr.project_id = p.project_id;

-- Contracts with freelancer and project
SELECT
    c.contract_id,
    p.project_title,
    f.freelancer_name,
    c.contract_amount
FROM contracts c
INNER JOIN projects p
ON c.project_id = p.project_id
INNER JOIN freelancers f
ON c.freelancer_id = f.freelancer_id;

-- Milestones with project names
SELECT
    p.project_title,
    m.milestone_name,
    m.amount,
    m.milestone_status
FROM milestones m
JOIN contracts c
ON m.contract_id = c.contract_id
JOIN projects p
ON c.project_id = p.project_id;

-- Payment details
SELECT
    p.project_title,
    f.freelancer_name,
    pay.amount,
    pay.payment_status
FROM payments pay
JOIN freelancers f
ON pay.freelancer_id = f.freelancer_id
JOIN milestones m
ON pay.milestone_id = m.milestone_id
JOIN contracts c
ON m.contract_id = c.contract_id
JOIN projects p
ON c.project_id = p.project_id;

-- GROUP BY / HAVING
-- Number of projects for each client
SELECT
    c.client_name,
    COUNT(p.project_id) AS total_projects
FROM clients c
LEFT JOIN projects p
ON c.client_id = p.client_id
GROUP BY c.client_id, c.client_name;

-- Clients having more than one project
SELECT
    c.client_name,
    COUNT(p.project_id) AS total_projects
FROM clients c
JOIN projects p
ON c.client_id = p.client_id
GROUP BY c.client_id, c.client_name
HAVING COUNT(p.project_id) > 1;

-- Total payments received by each freelancer
SELECT
    f.freelancer_name,
    SUM(pay.amount) AS total_earnings
FROM freelancers f
JOIN payments pay
ON f.freelancer_id = pay.freelancer_id
WHERE pay.payment_status = 'SUCCESS'
GROUP BY f.freelancer_id, f.freelancer_name;

-- Subqueries
-- Projects having budget greater than average budget
SELECT project_title, budget
FROM projects
WHERE budget > (
    SELECT AVG(budget)
    FROM projects
);

-- Freelancer earning the highest payment
SELECT freelancer_name
FROM freelancers
WHERE freelancer_id = (
    SELECT freelancer_id
    FROM payments
    WHERE amount = (
        SELECT MAX(amount)
        FROM payments
    )
    LIMIT 1
);

-- Second highest project budget
SELECT MAX(budget) AS second_highest_budget
FROM projects
WHERE budget < (
    SELECT MAX(budget)
    FROM projects
);

-- EXISTS / NOT EXISTS
-- Freelancers who submitted proposals
SELECT freelancer_name
FROM freelancers f
WHERE EXISTS (
    SELECT 1
    FROM proposals p
    WHERE p.freelancer_id = f.freelancer_id
);

-- Freelancers who never submitted proposals
SELECT freelancer_name
FROM freelancers f
WHERE NOT EXISTS (
    SELECT 1
    FROM proposals p
    WHERE p.freelancer_id = f.freelancer_id
);

-- COALESCE
-- Categorize projects based on budget
SELECT
    project_title,
    budget,
    CASE
        WHEN budget >= 100000 THEN 'HIGH BUDGET'
        WHEN budget >= 70000 THEN 'MEDIUM BUDGET'
        ELSE 'LOW BUDGET'
    END AS budget_category
FROM projects;

-- Show payment status when NULL
SELECT
    payment_id,
    amount,
    COALESCE(payment_status, 'NOT PAID') AS status
FROM payments;

-- UNION
-- Names from clients and freelancers
SELECT client_name AS person_name
FROM clients
UNION
SELECT freelancer_name
FROM freelancers;

-- UNION ALL
-- Include duplicate names also
SELECT client_name AS person_name
FROM clients
UNION ALL
SELECT freelancer_name
FROM freelancers;

-- Correlated Subquery
-- Freelancers earning above their average payment
SELECT
    f.freelancer_name,
    pay.amount
FROM freelancers f
JOIN payments pay
ON f.freelancer_id = pay.freelancer_id
WHERE pay.amount > (
    SELECT AVG(p2.amount)
    FROM payments p2
    WHERE p2.freelancer_id = f.freelancer_id
);

-- 33



