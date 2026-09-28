 # Freelancer Project & Payment Management System

## 1. Project Overview
FreelancePro is a MySQL-based database project designed to manage freelance projects, freelancers, clients, proposals, contracts, milestones, payments, reviews, and disputes.

The system provides a structured way to manage the complete freelance project lifecycle from project creation to final payment and review.

---

## 2. Objective
The main objective of FreelancePro is to create a centralized database system for managing freelance work and payment activities.

The system helps to:

- Store client and freelancer information.
- Manage freelancer skills.
- Create and manage projects.
- Store freelancer proposals.
- Manage accepted proposals and contracts.
- Track project milestones.
- Record and manage payments.
- Store client reviews and ratings.
- Manage project-related disputes.
- Generate useful reports using SQL queries.

---

## 3. Real-World Problem
In freelance platforms, a large amount of information needs to be managed, such as clients, freelancers, projects, proposals, contracts, milestones, and payments.

Managing this information manually can cause:

- Duplicate data
- Payment tracking problems
- Difficulty in finding project information
- Difficulty in tracking milestones
- Difficulty in managing disputes
- Difficulty in generating reports

FreelancePro solves these problems by storing the information in a structured relational database.

---

## 4. Proposed Solution
FreelancePro uses a normalized MySQL database to manage the complete freelance workflow.

The system connects clients, projects, freelancers, proposals, contracts, milestones, payments, reviews, and disputes through primary keys and foreign keys.

---

## 5. Main Modules

### 5.1 Client Management
Stores client information such as:

- Client name
- Email
- Phone
- Company name
- Country
- Registration date

### 5.2 Freelancer Management
Stores freelancer information such as:

- Freelancer name
- Email
- Phone
- Experience
- Hourly rate
- Availability status
- Joining date

### 5.3 Skill Management
Stores freelancer skills and skill categories.

Examples:

- Java
- MySQL
- HTML
- CSS
- Python

### 5.4 Freelancer Skill Management
Connects freelancers with their skills and stores their skill level.

Skill levels include:

- BEGINNER
- INTERMEDIATE
- ADVANCED
- EXPERT

### 5.5 Project Management
Clients can create projects with:

- Project title
- Description
- Category
- Budget
- Start date
- Deadline
- Project status

### 5.6 Proposal Management
Freelancers can submit proposals for projects.

The system stores:

- Proposed amount
- Estimated days
- Cover letter
- Proposal status
- Submission date

### 5.7 Contract Management
An accepted proposal can be associated with a contract.

The contract stores:

- Project
- Freelancer
- Proposal
- Contract amount
- Start date
- End date
- Contract status

### 5.8 Milestone Management
Projects can be divided into multiple milestones.

Each milestone contains:

- Milestone name
- Description
- Amount
- Due date
- Status
- Completion date

### 5.9 Payment Management
The payment module records payments made for milestones.

It stores:

- Payment amount
- Payment method
- Transaction ID
- Payment status
- Payment date

### 5.10 Review Management
Clients can provide ratings and comments for freelancers after project completion.

The rating is stored between 1 and 5.

### 5.11 Dispute Management
The system stores disputes raised by clients or freelancers.

It records:

- Reason
- Person who raised the dispute
- Dispute status
- Resolution
- Resolution date

---

## 6. Users / Roles

### Client
A client can:

- Create projects
- Review proposals
- Work with freelancers
- Make payments
- Provide reviews
- Raise disputes

### Freelancer
A freelancer can:

- Maintain skills
- Submit project proposals
- Work under contracts
- Complete milestones
- Receive payments
- Receive client reviews
- Raise disputes

### System / Administrator
The database system manages:

- Project records
- Proposal records
- Contracts
- Milestones
- Payments
- Reviews
- Disputes
- Reports

---

## 7. Project Workflow
The main workflow of the system is:

Client  
↓  
Create Project  
↓  
Freelancers Submit Proposals  
↓  
Client Selects Proposal  
↓  
Contract Created  
↓  
Project Divided into Milestones  
↓  
Milestones Completed  
↓  
Payment Processed  
↓  
Project Completed  
↓  
Client Gives Review

If there is a payment or project-related problem:

Project / Payment  
↓  
Dispute Raised  
↓  
Dispute Reviewed  
↓  
Dispute Resolved

---

## 8. Functional Requirements
The system should allow users to:

1. Store client details.
2. Store freelancer details.
3. Store skills.
4. Associate skills with freelancers.
5. Create projects.
6. Submit proposals.
7. Accept and reject proposals.
8. Create contracts.
9. Create and track milestones.
10. Record payments.
11. Track payment status.
12. Store reviews and ratings.
13. Manage disputes.
14. Generate project and payment reports.
15. Search and filter records using SQL queries.

---

## 9. Non-Functional Requirements

### Performance
The database should efficiently retrieve project, freelancer, and payment information.

### Data Integrity
Primary keys, foreign keys, UNIQUE constraints, NOT NULL constraints, and CHECK constraints are used to maintain valid data.

### Security
Sensitive database operations should be controlled through appropriate database permissions.

### Scalability
The database structure should support adding more clients, freelancers, projects, and transactions in the future.

### Maintainability
The database is divided into separate tables and SQL files so that it is easier to maintain and modify.

---

## 10. Technologies Used

- Database: MySQL 8+
- Query Language: SQL
- Database Design: Relational Database


