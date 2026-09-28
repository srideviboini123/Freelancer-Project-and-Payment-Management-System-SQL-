-- Blueprint asks us to explain which columns should be indexed and why.

USE freelance;

CREATE INDEX idx_project_client
ON projects(client_id);

CREATE INDEX idx_project_status
ON projects(project_status);

CREATE INDEX idx_proposal_project
ON proposals(project_id);

CREATE INDEX idx_proposal_freelancer
ON proposals(freelancer_id);

CREATE INDEX idx_payment_freelancer
ON payments(freelancer_id);

CREATE INDEX idx_payment_status
ON payments(payment_status);

CREATE INDEX idx_payment_date
ON payments(payment_date);

CREATE INDEX idx_milestone_contract
ON milestones(contract_id);

CREATE INDEX idx_milestone_status
ON milestones(milestone_status);

-- Composite index
CREATE INDEX idx_project_status_deadline
ON projects(project_status, deadline);

-- Check query performance:
EXPLAIN
SELECT project_id, project_title, deadline
FROM projects
WHERE project_status = 'OPEN'
AND deadline < '2026-10-15';