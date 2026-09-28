USE freelance;

-- 1. Clients
CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    company_name VARCHAR(150),
    country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 2. Freelancers
CREATE TABLE freelancers (
    freelancer_id INT PRIMARY KEY AUTO_INCREMENT,
    freelancer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    experience_years INT DEFAULT 0,
    hourly_rate DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(20) DEFAULT 'AVAILABLE',
    joined_date DATE NOT NULL,

    CHECK (experience_years >= 0),
    CHECK (hourly_rate > 0),
    CHECK (availability_status IN ('AVAILABLE','BUSY','OFFLINE'))
);


-- 3. Skills
CREATE TABLE skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL
);


-- 4. Freelancer Skills
CREATE TABLE freelancer_skills (
    freelancer_id INT,
    skill_id INT,
    skill_level VARCHAR(20) DEFAULT 'BEGINNER',

    PRIMARY KEY (freelancer_id, skill_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES freelancers(freelancer_id),

    FOREIGN KEY (skill_id)
        REFERENCES skills(skill_id),

    CHECK (skill_level IN ('BEGINNER','INTERMEDIATE','ADVANCED','EXPERT'))
);


-- 5. Projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    project_title VARCHAR(150) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    budget DECIMAL(12,2) NOT NULL,
    start_date DATE,
    deadline DATE NOT NULL,
    project_status VARCHAR(20) DEFAULT 'OPEN',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (client_id)
        REFERENCES clients(client_id),

    CHECK (budget > 0),
    CHECK (project_status IN
        ('OPEN','IN_PROGRESS','COMPLETED','CANCELLED','ON_HOLD'))
);


-- 6. Proposals
CREATE TABLE proposals (
    proposal_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    proposed_amount DECIMAL(12,2) NOT NULL,
    estimated_days INT NOT NULL,
    cover_letter TEXT,
    proposal_status VARCHAR(20) DEFAULT 'PENDING',
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES freelancers(freelancer_id),

    CHECK (proposed_amount > 0),
    CHECK (estimated_days > 0),
    CHECK (proposal_status IN
        ('PENDING','ACCEPTED','REJECTED','WITHDRAWN'))
);


-- 7. Contracts
CREATE TABLE contracts (
    contract_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    proposal_id INT NOT NULL UNIQUE,
    contract_amount DECIMAL(12,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    contract_status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES freelancers(freelancer_id),

    FOREIGN KEY (proposal_id)
        REFERENCES proposals(proposal_id),

    CHECK (contract_amount > 0),
    CHECK (end_date >= start_date),
    CHECK (contract_status IN
        ('ACTIVE','COMPLETED','CANCELLED','ON_HOLD'))
);


-- 8. Milestones
CREATE TABLE milestones (
    milestone_id INT PRIMARY KEY AUTO_INCREMENT,
    contract_id INT NOT NULL,
    milestone_name VARCHAR(150) NOT NULL,
    description TEXT,
    amount DECIMAL(12,2) NOT NULL,
    due_date DATE NOT NULL,
    milestone_status VARCHAR(20) DEFAULT 'PENDING',
    completed_at DATE,

    FOREIGN KEY (contract_id)
        REFERENCES contracts(contract_id),

    CHECK (amount > 0),
    CHECK (milestone_status IN
        ('PENDING','IN_PROGRESS','SUBMITTED','APPROVED','REJECTED'))
);


-- 9. Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    milestone_id INT NOT NULL,
    client_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    transaction_id VARCHAR(100) UNIQUE,
    payment_status VARCHAR(20) DEFAULT 'PENDING',
    payment_date DATE,

    FOREIGN KEY (milestone_id)
        REFERENCES milestones(milestone_id),

    FOREIGN KEY (client_id)
        REFERENCES clients(client_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES freelancers(freelancer_id),

    CHECK (amount > 0),
    CHECK (payment_method IN
        ('UPI','CARD','BANK_TRANSFER','WALLET')),
    CHECK (payment_status IN
        ('PENDING','SUCCESS','FAILED','REFUNDED'))
);


-- 10. Reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    client_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    rating INT NOT NULL,
    review_comment VARCHAR(500),
    review_date DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id),

    FOREIGN KEY (client_id)
        REFERENCES clients(client_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES freelancers(freelancer_id),

    CHECK (rating BETWEEN 1 AND 5)
);


-- 11. Disputes
CREATE TABLE disputes (
    dispute_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    payment_id INT,
    raised_by VARCHAR(20) NOT NULL,
    reason VARCHAR(500) NOT NULL,
    dispute_status VARCHAR(20) DEFAULT 'OPEN',
    resolution VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at DATE,

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id),

    FOREIGN KEY (payment_id)
        REFERENCES payments(payment_id),

    CHECK (raised_by IN ('CLIENT','FREELANCER')),
    CHECK (dispute_status IN
        ('OPEN','UNDER_REVIEW','RESOLVED','REJECTED'))
);