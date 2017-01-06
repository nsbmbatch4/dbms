CREATE DATABASE citycentral

CREATE TABLE patient(
patient_id int NOT NULL IDENTITY(1,1),
first_name varchar(100) NOT NULL,
last_name varchar(150) NOT NULL,
gender varchar(6) NOT NULL,
address varchar(500) NOT NULL,
dob date NOT NULL,
entry_date date NOT NULL,
department_id int NOT NULL,
doctor_id int NOT NULL)



CREATE TABLE patient_contact(
patient_id int NOT NULL,
contact_number int NOT NULL
)


CREATE TABLE regular_patient(
patient_id int NOT NULL,
date_of_visit date NOT NULL,
treatement varchar(1000) NOT NULL,
state_of_treatement varchar(500) NOT NULL,
time time NOT NULL,
diagnosis varchar(500) NOT NULL,
medicine_recommended varchar(1000) NOT NULL,
)


CREATE TABLE operated_patients(
patient_id int NOT NULL,
date_of_operation date NOT NULL,
condition_before varchar(1000) NOT NULL,
condition_after varchar(1000) NOT NULL,
treatment_advice varchar(1000) NOT NULL,
room_number int NOT NULL
)



CREATE TABLE employee(
employee_id int NOT NULL IDENTITY(1,1),
first_name varchar(100) NOT NULL,
last_name varchar(150) NOT NULL,
address varchar(500) NOT NULL,
qualification varchar(800) NOT NULL,
type varchar(10) NOT NULL,
department_id int NOT NULL
)


CREATE TABLE employee_contact(
employee_id int NOT NULL,
contact_number int NOT NULL
)


CREATE TABLE doctor(
employee_id int NOT NULL,
doctor_id int NOT NULL IDENTITY(1,1)
)


CREATE TABLE regular_doctor(
doctor_id int NOT NULL,
predefined_salary money NOT NULL,
date_of_join date NOT NULL
)


CREATE TABLE callon_doctor(
doctor_id int NOT NULL,
payment_due date NOT NULL,
fee_per_call money NOT NULL
)


CREATE TABLE department(
department_id int NOT NULL IDENTITY(1,1),
name varchar(500) NOT NULL,
location varchar(100) NOT NULL,
facilities varchar(800) NOT NULL
)


CREATE TABLE room(
room_number int NOT NULL,
charges_per_day money NOT NULL,
status varchar(1) NOT NULL,
type varchar(1) NOT NULL,
department_id int NOT NULL
)