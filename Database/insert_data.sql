USE freelance;

-- MASTER DATA
-- CLIENTS
INSERT INTO clients
(client_name, email, phone, company_name, country)
VALUES
('Ravi Kumar','ravi@gmail.com','9876500001','TechWorld','India'),
('Priya Sharma','priya@gmail.com','9876500002','FoodCart','India'),
('Arjun Reddy','arjun@gmail.com','9876500003','EduTech','India'),
('Sneha Rao','sneha@gmail.com','9876500004','HealthPlus','India'),
('Vikram Singh','vikram@gmail.com','9876500005','ShopEasy','India'),
('Meena Das','meena@gmail.com','9876500006','TravelGo','India'),
('Rahul Verma','rahul@gmail.com','9876500007','FinServe','India'),
('Anjali Patel','anjali@gmail.com','9876500008','MediaHub','India'),
('Kiran Rao','kiran@gmail.com','9876500009','AutoCare','India'),
('Divya Nair','divya@gmail.com','9876500010','LearnOnline','India');


-- FREELANCERS
INSERT INTO freelancers
(freelancer_name,email,phone,experience_years,hourly_rate,
availability_status,joined_date)
VALUES
('Amit Kumar','amit@gmail.com','9000000001',3,800,'AVAILABLE','2026-01-10'),
('Neha Sharma','neha@gmail.com','9000000002',5,1200,'BUSY','2025-12-15'),
('Rahul Reddy','rahul.dev@gmail.com','9000000003',2,700,'AVAILABLE','2026-02-01'),
('Pooja Singh','pooja@gmail.com','9000000004',4,1000,'AVAILABLE','2025-11-20'),
('Suresh Rao','suresh@gmail.com','9000000005',6,1500,'BUSY','2025-10-05'),
('Kavya Nair','kavya@gmail.com','9000000006',3,900,'AVAILABLE','2026-01-25'),
('Vijay Kumar','vijay@gmail.com','9000000007',7,1800,'BUSY','2025-09-10'),
('Anu Das','anu@gmail.com','9000000008',2,600,'AVAILABLE','2026-03-05'),
('Manoj Patel','manoj@gmail.com','9000000009',5,1100,'AVAILABLE','2025-12-01'),
('Swathi Rao','swathi@gmail.com','9000000010',4,950,'OFFLINE','2025-11-01');


-- SKILLS
INSERT INTO skills (skill_name,category)
VALUES
('Java','Backend'),
('SQL','Database'),
('HTML','Frontend'),
('CSS','Frontend'),
('JavaScript','Frontend'),
('Python','Backend'),
('React','Frontend'),
('Spring Boot','Backend'),
('UI/UX','Design'),
('Testing','QA');

-- FREELANCER SKILLS
INSERT INTO freelancer_skills
VALUES
(1,1,'ADVANCED'),
(1,2,'ADVANCED'),
(2,5,'EXPERT'),
(2,7,'EXPERT'),
(3,1,'INTERMEDIATE'),
(3,2,'ADVANCED'),
(4,9,'ADVANCED'),
(4,3,'EXPERT'),
(5,8,'EXPERT'),
(5,1,'EXPERT'),
(6,2,'ADVANCED'),
(6,6,'INTERMEDIATE'),
(7,8,'EXPERT'),
(7,1,'EXPERT'),
(8,3,'INTERMEDIATE'),
(8,4,'ADVANCED'),
(9,5,'ADVANCED'),
(9,7,'ADVANCED'),
(10,10,'EXPERT'),
(10,2,'ADVANCED');

-- PROJECTS
INSERT INTO projects
(client_id,project_title,description,category,budget,
start_date,deadline,project_status)
VALUES
(1,'E-Commerce Website','Online shopping website','Web',80000,
'2026-09-01','2026-10-15','IN_PROGRESS'),

(2,'Food Delivery App','Food ordering platform','Mobile',120000,
'2026-09-05','2026-11-01','IN_PROGRESS'),

(3,'Student Management System','College management software','Software',60000,
'2026-09-10','2026-10-20','OPEN'),

(4,'Hospital Website','Healthcare website','Web',50000,
'2026-08-20','2026-09-30','IN_PROGRESS'),

(5,'Inventory Management','Inventory tracking system','Software',90000,
'2026-09-01','2026-10-30','OPEN'),

(6,'Travel Booking Website','Travel booking platform','Web',100000,
'2026-08-15','2026-10-15','IN_PROGRESS'),

(7,'Banking Dashboard','Financial dashboard','Software',150000,
'2026-09-01','2026-11-15','OPEN'),

(8,'Social Media Website','Social networking platform','Web',130000,
'2026-08-01','2026-10-01','IN_PROGRESS'),

(9,'Car Service App','Vehicle service application','Mobile',70000,
'2026-09-15','2026-11-01','OPEN'),

(10,'Online Learning Platform','Learning management system','Education',110000,
'2026-08-10','2026-10-10','IN_PROGRESS');

-- PROPOSALS
INSERT INTO proposals
(project_id,freelancer_id,proposed_amount,estimated_days,
cover_letter,proposal_status)
VALUES
(1,1,75000,35,'I can develop this using Java and SQL.','ACCEPTED'),
(1,3,70000,40,'I have experience in Java development.','REJECTED'),
(2,2,115000,50,'I can build the complete application.','ACCEPTED'),
(3,3,55000,30,'I can develop the student management system.','ACCEPTED'),
(4,4,48000,25,'I specialize in responsive websites.','ACCEPTED'),
(5,5,85000,40,'I have experience in Spring Boot.','PENDING'),
(6,6,90000,45,'I can build the booking system.','ACCEPTED'),
(7,7,140000,60,'I have banking application experience.','PENDING'),
(8,2,125000,55,'I can build React applications.','ACCEPTED'),
(9,8,65000,35,'I can build a mobile-friendly solution.','PENDING'),
(10,9,100000,50,'I can build the learning platform.','ACCEPTED');

-- CONTRACTS
INSERT INTO contracts
(project_id,freelancer_id,proposal_id,contract_amount,
start_date,end_date,contract_status)
VALUES
(1,1,1,75000,'2026-09-01','2026-10-15','ACTIVE'),
(2,2,3,115000,'2026-09-05','2026-11-01','ACTIVE'),
(3,3,4,55000,'2026-09-10','2026-10-20','ACTIVE'),
(4,4,5,48000,'2026-08-20','2026-09-30','ACTIVE'),
(6,6,7,90000,'2026-08-15','2026-10-15','ACTIVE'),
(8,2,9,125000,'2026-08-01','2026-10-01','ACTIVE'),
(10,9,11,100000,'2026-08-10','2026-10-10','ACTIVE');

-- MILESTONES
INSERT INTO milestones
(contract_id,milestone_name,description,amount,due_date,milestone_status)
VALUES
(1,'UI Development','Design and frontend',20000,'2026-09-15','APPROVED'),
(1,'Backend Development','Develop backend APIs',30000,'2026-10-01','IN_PROGRESS'),
(1,'Testing','Testing and bug fixing',25000,'2026-10-15','PENDING'),

(2,'UI Design','Food app UI',30000,'2026-09-25','APPROVED'),
(2,'Backend','Food ordering backend',50000,'2026-10-15','IN_PROGRESS'),
(2,'Testing','Application testing',35000,'2026-11-01','PENDING'),

(3,'Database','Design database',15000,'2026-09-20','APPROVED'),
(3,'Application','Develop application',25000,'2026-10-05','IN_PROGRESS'),
(3,'Testing','Testing',15000,'2026-10-20','PENDING'),

(4,'Design','Website design',18000,'2026-09-01','APPROVED'),
(4,'Development','Website development',30000,'2026-09-25','IN_PROGRESS'),

(5,'Booking Module','Booking functionality',40000,'2026-09-20','APPROVED'),
(5,'Payment Module','Payment integration',30000,'2026-10-01','IN_PROGRESS'),
(5,'Testing','Final testing',20000,'2026-10-15','PENDING');

-- PAYMENTS
INSERT INTO payments
(milestone_id,client_id,freelancer_id,amount,
payment_method,transaction_id,payment_status,payment_date)
VALUES
(1,1,1,20000,'UPI','TXN1001','SUCCESS','2026-09-15'),
(4,2,2,30000,'CARD','TXN1002','SUCCESS','2026-09-25'),
(7,3,3,15000,'BANK_TRANSFER','TXN1003','SUCCESS','2026-09-20'),
(10,4,4,18000,'UPI','TXN1004','SUCCESS','2026-09-01'),
(12,6,6,40000,'CARD','TXN1005','SUCCESS','2026-09-20'),
(2,1,1,30000,'UPI','TXN1006','PENDING',NULL);

-- REVIEWS
INSERT INTO reviews
(project_id,client_id,freelancer_id,rating,review_comment)
VALUES
(1,1,1,5,'Excellent work and good communication.'),
(2,2,2,4,'Very good application development.'),
(3,3,3,5,'Completed the work professionally.'),
(4,4,4,4,'Good website design.'),
(6,6,6,5,'Very satisfied with the work.');

-- DISPUTES
INSERT INTO disputes
(project_id,payment_id,raised_by,reason,dispute_status)
VALUES
(1,6,'CLIENT','Backend milestone delayed','OPEN'),
(2,2,'FREELANCER','Payment verification issue','UNDER_REVIEW');

select * from clients;
select * from contracts;
select * from disputes;
select * from freelancer_skills;
select * from freelancers;
select * from milestones;
select * from payments;
select * from projects;
select * from proposals;
select * from reviews;
select * from skills;