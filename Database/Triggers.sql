-- Automatically update project when payment succeeds
DELIMITER //
CREATE TRIGGER after_payment_success
AFTER UPDATE ON payments
FOR EACH ROW
BEGIN
    IF NEW.payment_status = 'SUCCESS'
       AND OLD.payment_status <> 'SUCCESS' THEN
        UPDATE milestones
        SET milestone_status = 'APPROVED'
        WHERE milestone_id = NEW.milestone_id;
    END IF;
END //
DELIMITER ;



