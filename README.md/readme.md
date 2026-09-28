# Freelancer Project & Payment Management System

## Project Overview

FreelancePro is a MySQL-based database project for managing freelance projects, clients, freelancers, proposals, contracts, milestones, payments, reviews, and disputes.

## Objective

The main objective of this project is to manage the complete freelance project and payment process using a structured relational database.

## Main Features

* Client Management
* Freelancer Management
* Skill Management
* Project Management
* Proposal Management
* Contract Management
* Milestone Tracking
* Payment Management
* Reviews and Ratings
* Dispute Management
* Reports and SQL Queries

## Database Tables

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

## Technologies Used

* MySQL 8+
* SQL
* Git / GitHub
* Markdown

## Project Structure

```text
FreelancePro/
│
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_data.sql
│   ├── 04_queries.sql
│   ├── 05_views.sql
│   ├── 06_procedures.sql
│   ├── 07_functions.sql
│   ├── 08_triggers.sql
│   └── 09_indexes.sql
│
├── documentation/
│   ├── requirements.md
│   ├── database-design.md
│   └── er-diagram.md
│
└── README.md
```

## SQL Concepts Used

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* JOINS
* Subqueries
* Aggregate Functions
* CASE
* COALESCE
* UNION
* Views
* Stored Procedures
* Functions
* Triggers
* Transactions
* Indexes
* EXPLAIN

## Database Flow

```text
CLIENT
   ↓
PROJECT
   ↓
PROPOSAL
   ↓
CONTRACT
   ↓
MILESTONE
   ↓
PAYMENT
   ↓
REVIEW
```

## How to Run

1. Open MySQL Workbench.
2. Run `01_create_database.sql`.
3. Run `02_create_tables.sql`.
4. Run `03_insert_data.sql`.
5. Run `04_queries.sql`.
6. Run the remaining SQL files as required.
7. Execute the queries and procedures to view the results.

## Future Enhancements

* User Login and Authentication
* Online Payment Gateway Integration
* Email and SMS Notifications
* Admin Dashboard
* Freelancer Portfolio Management
* Web and Mobile Application
