-- Calculate platform commission Let's assume platform commission is 10%.

DELIMITER //
CREATE FUNCTION CalculateCommission(
    p_amount DECIMAL(12,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    RETURN p_amount * 0.10;

END //
DELIMITER ;

-- Use:
SELECT
    payment_id,
    amount,
    CalculateCommission(amount) AS platform_commission
FROM payments;


-- Freelancer net earning
DELIMITER //
CREATE FUNCTION FreelancerNetAmount(
    p_amount DECIMAL(12,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN p_amount - (p_amount * 0.10);
END //
DELIMITER ;

-- use
SELECT
    payment_id,
    amount,
    FreelancerNetAmount(amount) AS freelancer_net_amount
FROM payments;