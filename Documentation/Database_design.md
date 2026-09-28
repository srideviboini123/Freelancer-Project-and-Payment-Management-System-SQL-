# Database Design

## 1. Database Overview

**Database Name:** `freelancepro`

**Database Type:** Relational Database

**Database Management System:** MySQL 8+

The FreelancePro database is designed to manage clients, freelancers, skills, projects, proposals, contracts, milestones, payments, reviews, and disputes.

The database follows normalization principles to reduce duplicate data and maintain data integrity.

---

# 2. Tables in the Database

The database contains the following tables:

1. `clients`
2. `freelancers`
3. `skills`
4. `freelancer_skills`
5. `projects`
6. `proposals`
7. `contracts`
8. `milestones`
9. `payments`
10. `reviews`
11. `disputes`

---

# 3. Table Design

## 3.1 Clients Table

**Table Name:** `clients`

### Purpose

Stores information about clients who create freelance projects.

| Column       | Data Type    | Constraint         | Description           |
| ------------ | ------------ | ------------------ | --------------------- |
| client_id    | INT          | PK, AUTO_INCREMENT | Unique client ID      |
| client_name  | VARCHAR(100) | NOT NULL           | Client name           |
| email        | VARCHAR(100) | NOT NULL, UNIQUE   | Client email          |
| phone        | VARCHAR(15)  | UNIQUE             | Client phone number   |
| company_name | VARCHAR(150) | —                  | Company name          |
| country      | VARCHAR(50)  | NOT NULL           | Client country        |
| created_at   | TIMESTAMP    | DEFAULT            | Account creation date |

---

## 3.2 Freelancers Table

**Table Name:** `freelancers`

### Purpose

Stores freelancer profile and professional information.

| Column              | Data Type     | Constraint         | Description             |
| ------------------- | ------------- | ------------------ | ----------------------- |
| freelancer_id       | INT           | PK, AUTO_INCREMENT | Unique freelancer ID    |
| freelancer_name     | VARCHAR(100)  | NOT NULL           | Freelancer name         |
| email               | VARCHAR(100)  | NOT NULL, UNIQUE   | Freelancer email        |
| phone               | VARCHAR(15)   | UNIQUE             | Phone number            |
| experience_years    | INT           | DEFAULT 0, CHECK   | Years of experience     |
| hourly_rate         | DECIMAL(10,2) | NOT NULL, CHECK    | Hourly rate             |
| availability_status | VARCHAR(20)   | DEFAULT, CHECK     | Freelancer availability |
| joined_date         | DATE          | NOT NULL           | Joining date            |

---

## 3.3 Skills Table

**Table Name:** `skills`

### Purpose

Stores skills available on the freelance platform.

| Column     | Data Type    | Constraint         | Description     |
| ---------- | ------------ | ------------------ | --------------- |
| skill_id   | INT          | PK, AUTO_INCREMENT | Unique skill ID |
| skill_name | VARCHAR(100) | NOT NULL, UNIQUE   | Skill name      |
| category   | VARCHAR(50)  | NOT NULL           | Skill category  |

---

## 3.4 Freelancer Skills Table

**Table Name:** `freelancer_skills`

### Purpose

Connects freelancers with their skills.

This is a bridge table used to implement a **many-to-many relationship** between freelancers and skills.

| Column        | Data Type   | Constraint     | Description             |
| ------------- | ----------- | -------------- | ----------------------- |
| freelancer_id | INT         | PK, FK         | Freelancer ID           |
| skill_id      | INT         | PK, FK         | Skill ID                |
| skill_level   | VARCHAR(20) | DEFAULT, CHECK | Skill proficiency level |

**Composite Primary Key:**

`(freelancer_id, skill_id)`

---

## 3.5 Projects Table

**Table Name:** `projects`

### Purpose

Stores projects created by clients.

| Column         | Data Type     | Constraint         | Description                |
| -------------- | ------------- | ------------------ | -------------------------- |
| project_id     | INT           | PK, AUTO_INCREMENT | Unique project ID          |
| client_id      | INT           | NOT NULL, FK       | Client who created project |
| project_title  | VARCHAR(150)  | NOT NULL           | Project title              |
| description    | TEXT          | —                  | Project description        |
| category       | VARCHAR(50)   | NOT NULL           | Project category           |
| budget         | DECIMAL(12,2) | NOT NULL, CHECK    | Project budget             |
| start_date     | DATE          | —                  | Project start date         |
| deadline       | DATE          | NOT NULL           | Project deadline           |
| project_status | VARCHAR(20)   | DEFAULT, CHECK     | Current project status     |
| created_at     | TIMESTAMP     | DEFAULT            | Project creation date      |

---

## 3.6 Proposals Table

**Table Name:** `proposals`

### Purpose

Stores proposals submitted by freelancers for projects.

| Column          | Data Type     | Constraint         | Description                    |
| --------------- | ------------- | ------------------ | ------------------------------ |
| proposal_id     | INT           | PK, AUTO_INCREMENT | Unique proposal ID             |
| project_id      | INT           | NOT NULL, FK       | Related project                |
| freelancer_id   | INT           | NOT NULL, FK       | Freelancer submitting proposal |
| proposed_amount | DECIMAL(12,2) | NOT NULL, CHECK    | Proposed project amount        |
| estimated_days  | INT           | NOT NULL, CHECK    | Estimated completion time      |
| cover_letter    | TEXT          | —                  | Freelancer proposal message    |
| proposal_status | VARCHAR(20)   | DEFAULT, CHECK     | Proposal status                |
| submitted_at    | TIMESTAMP     | DEFAULT            | Submission date                |

---

## 3.7 Contracts Table

**Table Name:** `contracts`

### Purpose

Stores contracts created from accepted proposals.

| Column          | Data Type     | Constraint           | Description            |
| --------------- | ------------- | -------------------- | ---------------------- |
| contract_id     | INT           | PK, AUTO_INCREMENT   | Unique contract ID     |
| project_id      | INT           | NOT NULL, FK         | Related project        |
| freelancer_id   | INT           | NOT NULL, FK         | Selected freelancer    |
| proposal_id     | INT           | NOT NULL, UNIQUE, FK | Accepted proposal      |
| contract_amount | DECIMAL(12,2) | NOT NULL, CHECK      | Contract amount        |
| start_date      | DATE          | NOT NULL             | Contract start date    |
| end_date        | DATE          | NOT NULL, CHECK      | Contract end date      |
| contract_status | VARCHAR(20)   | DEFAULT, CHECK       | Contract status        |
| created_at      | TIMESTAMP     | DEFAULT              | Contract creation date |

---

## 3.8 Milestones Table

**Table Name:** `milestones`

### Purpose

Stores individual milestones of a contract.

| Column           | Data Type     | Constraint         | Description           |
| ---------------- | ------------- | ------------------ | --------------------- |
| milestone_id     | INT           | PK, AUTO_INCREMENT | Unique milestone ID   |
| contract_id      | INT           | NOT NULL, FK       | Related contract      |
| milestone_name   | VARCHAR(150)  | NOT NULL           | Milestone name        |
| description      | TEXT          | —                  | Milestone description |
| amount           | DECIMAL(12,2) | NOT NULL, CHECK    | Milestone amount      |
| due_date         | DATE          | NOT NULL           | Milestone deadline    |
| milestone_status | VARCHAR(20)   | DEFAULT, CHECK     | Milestone status      |
| completed_at     | DATE          | —                  | Completion date       |

---

## 3.9 Payments Table

**Table Name:** `payments`

### Purpose

Stores payments made for completed or approved milestones.

| Column         | Data Type     | Constraint         | Description                  |
| -------------- | ------------- | ------------------ | ---------------------------- |
| payment_id     | INT           | PK, AUTO_INCREMENT | Unique payment ID            |
| milestone_id   | INT           | NOT NULL, FK       | Related milestone            |
| client_id      | INT           | NOT NULL, FK       | Client making payment        |
| freelancer_id  | INT           | NOT NULL, FK       | Freelancer receiving payment |
| amount         | DECIMAL(12,2) | NOT NULL, CHECK    | Payment amount               |
| payment_method | VARCHAR(30)   | NOT NULL, CHECK    | Payment method               |
| transaction_id | VARCHAR(100)  | UNIQUE             | Transaction reference        |
| payment_status | VARCHAR(20)   | DEFAULT, CHECK     | Payment status               |
| payment_date   | DATE          | —                  | Payment date                 |

---

## 3.10 Reviews Table

**Table Name:** `reviews`

### Purpose

Stores client ratings and feedback for freelancers.

| Column         | Data Type    | Constraint         | Description               |
| -------------- | ------------ | ------------------ | ------------------------- |
| review_id      | INT          | PK, AUTO_INCREMENT | Unique review ID          |
| project_id     | INT          | NOT NULL, FK       | Reviewed project          |
| client_id      | INT          | NOT NULL, FK       | Client giving review      |
| freelancer_id  | INT          | NOT NULL, FK       | Freelancer being reviewed |
| rating         | INT          | NOT NULL, CHECK    | Rating from 1 to 5        |
| review_comment | VARCHAR(500) | —                  | Review comment            |
| review_date    | DATE         | DEFAULT            | Review date               |

---

## 3.11 Disputes Table

**Table Name:** `disputes`

### Purpose

Stores disputes related to projects and payments.

| Column         | Data Type    | Constraint         | Description            |
| -------------- | ------------ | ------------------ | ---------------------- |
| dispute_id     | INT          | PK, AUTO_INCREMENT | Unique dispute ID      |
| project_id     | INT          | NOT NULL, FK       | Related project        |
| payment_id     | INT          | FK                 | Related payment        |
| raised_by      | VARCHAR(20)  | NOT NULL, CHECK    | Client or freelancer   |
| reason         | VARCHAR(500) | NOT NULL           | Reason for dispute     |
| dispute_status | VARCHAR(20)  | DEFAULT, CHECK     | Current dispute status |
| resolution     | VARCHAR(500) | —                  | Resolution details     |
| created_at     | TIMESTAMP    | DEFAULT            | Dispute creation date  |
| resolved_at    | DATE         | —                  | Resolution date        |

---

# 4. Primary Keys

Primary keys uniquely identify records in each table.

| Table             | Primary Key              |
| ----------------- | ------------------------ |
| clients           | client_id                |
| freelancers       | freelancer_id            |
| skills            | skill_id                 |
| freelancer_skills | freelancer_id + skill_id |
| projects          | project_id               |
| proposals         | proposal_id              |
| contracts         | contract_id              |
| milestones        | milestone_id             |
| payments          | payment_id               |
| reviews           | review_id                |
| disputes          | dispute_id               |

---

# 5. Foreign Keys

Foreign keys establish relationships between tables.

| Table             | Foreign Key   | References                 |
| ----------------- | ------------- | -------------------------- |
| freelancer_skills | freelancer_id | freelancers(freelancer_id) |
| freelancer_skills | skill_id      | skills(skill_id)           |
| projects          | client_id     | clients(client_id)         |
| proposals         | project_id    | projects(project_id)       |
| proposals         | freelancer_id | freelancers(freelancer_id) |
| contracts         | project_id    | projects(project_id)       |
| contracts         | freelancer_id | freelancers(freelancer_id) |
| contracts         | proposal_id   | proposals(proposal_id)     |
| milestones        | contract_id   | contracts(contract_id)     |
| payments          | milestone_id  | milestones(milestone_id)   |
| payments          | client_id     | clients(client_id)         |
| payments          | freelancer_id | freelancers(freelancer_id) |
| reviews           | project_id    | projects(project_id)       |
| reviews           | client_id     | clients(client_id)         |
| reviews           | freelancer_id | freelancers(freelancer_id) |
| disputes          | project_id    | projects(project_id)       |
| disputes          | payment_id    | payments(payment_id)       |

---

# 6. Relationships

## Client → Projects

One client can create many projects.

**Relationship:** 1 : Many

```text
clients 1 ─────────── M projects
```

## Freelancer → Skills

One freelancer can have many skills, and one skill can belong to many freelancers.

**Relationship:** Many : Many

This relationship is implemented using `freelancer_skills`.

```text
freelancers M ─── freelancer_skills ─── M skills
```

## Project → Proposals

One project can receive many proposals.

**Relationship:** 1 : Many

```text
projects 1 ─────────── M proposals
```

## Freelancer → Proposals

One freelancer can submit many proposals.

**Relationship:** 1 : Many

```text
freelancers 1 ─────────── M proposals
```

## Project → Contract

A project can have a contract.

The contract is created from an accepted proposal.

## Contract → Milestones

One contract can contain many milestones.

**Relationship:** 1 : Many

```text
contracts 1 ─────────── M milestones
```

## Milestone → Payments

A milestone can have payment records.

```text
milestones 1 ─────────── M payments
```

## Project → Reviews

A project can have reviews.

```text
projects 1 ─────────── M reviews
```

## Project → Disputes

A project can have multiple disputes.

```text
projects 1 ─────────── M disputes
```

---

# 7. Data Integrity

The database uses the following constraints:

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* DEFAULT
* CHECK

These constraints help maintain accurate and consistent data.

---

# 8. Naming Conventions

The project follows simple and consistent naming conventions:

* Table names use lowercase letters.
* Column names use `snake_case`.
* Primary key names use the table name followed by `_id`.
* Foreign key names match the referenced primary key.
* Status columns use meaningful values such as `ACTIVE`, `COMPLETED`, `PENDING`, and `SUCCESS`.

---

# 9. Normalization

The database is designed using normalization principles.

### First Normal Form (1NF)

Each column contains atomic values and repeating groups are avoided.

### Second Normal Form (2NF)

Tables are designed so that non-key attributes depend on the complete primary key.

### Third Normal Form (3NF)

Non-key attributes depend on the primary key and unnecessary transitive dependencies are avoided.

The `freelancer_skills` bridge table is used to properly manage the many-to-many relationship between freelancers and skills.

---

# 10. Database Flow

The main database flow is:

```text
CLIENT
   |
   v
PROJECT
   |
   v
PROPOSAL
   |
   v
CONTRACT
   |
   v
MILESTONE
   |
   v
PAYMENT
   |
   v
REVIEW
```

Additional relationship:

```text
FREELANCER
     |
     +------ FREELANCER_SKILLS ------ SKILLS
     |
     +------ PROPOSALS
     |
     +------ CONTRACTS
     |
     +------ PAYMENTS
     |
     +------ REVIEWS
```

Dispute relationship:

```text
PROJECT
   |
   +------ DISPUTES
              |
              v
           PAYMENT
```
