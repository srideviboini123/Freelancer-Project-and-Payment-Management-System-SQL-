-- Get freelancer details
DELIMITER //
CREATE PROCEDURE GetFreelancerDetails(
    IN p_freelancer_id INT
)
BEGIN
    SELECT
        freelancer_id,
        freelancer_name,
        email,
        experience_years,
        hourly_rate,
        availability_status
    FROM freelancers
    WHERE freelancer_id = p_freelancer_id;
END //
DELIMITER ;

-- Execute:
CALL GetFreelancerDetails(1);

-- Get project payments
DELIMITER //
CREATE PROCEDURE GetProjectPayments(
    IN p_project_id INT
)
BEGIN
    SELECT
        pr.project_title,
        pay.payment_id,
        pay.amount,
        pay.payment_status,
        pay.payment_date
    FROM projects pr
    JOIN contracts c
    ON pr.project_id = c.project_id
    JOIN milestones m
    ON c.contract_id = m.contract_id
    JOIN payments pay
    ON m.milestone_id = pay.milestone_id
    WHERE pr.project_id = p_project_id;
END //
DELIMITER ;

-- Execute:
CALL GetProjectPayments(1);
