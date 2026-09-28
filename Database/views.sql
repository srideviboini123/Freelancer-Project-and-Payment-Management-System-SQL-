-- Freelancer Earnings View
USE freelance;

CREATE VIEW freelancer_earnings AS
SELECT
    f.freelancer_id,
    f.freelancer_name,
    COALESCE(SUM(
        CASE
            WHEN p.payment_status = 'SUCCESS'
            THEN p.amount
            ELSE 0
        END
    ),0) AS total_earnings
FROM freelancers f
LEFT JOIN payments p
ON f.freelancer_id = p.freelancer_id
GROUP BY f.freelancer_id, f.freelancer_name;

-- Use:
SELECT *
FROM freelancer_earnings;

-- Project Payment View
CREATE VIEW project_payment_summary AS
SELECT
    pr.project_id,
    pr.project_title,
    pr.budget,
    COALESCE(SUM(
        CASE
            WHEN pay.payment_status = 'SUCCESS'
            THEN pay.amount
            ELSE 0
        END
    ),0) AS amount_paid
FROM projects pr
LEFT JOIN contracts c
ON pr.project_id = c.project_id
LEFT JOIN milestones m
ON c.contract_id = m.contract_id
LEFT JOIN payments pay
ON m.milestone_id = pay.milestone_id
GROUP BY pr.project_id, pr.project_title, pr.budget;