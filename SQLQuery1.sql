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


CREATE TABLE treatement(
record_id int NOT NULL IDENTITY(1,1),
date_of_checkup date NOT NULL,
diagnosis varchar(500) NOT NULL,
status varchar(100) NOT NULL,
treatment varchar(1000) NOT NULL,
doctor_id int NOT NULL,
patient_id int NOT NULL
)

CREATE TABLE admitted(
record_id int NOT NULL IDENTITY(1,1),
patient_id varchar NOT NULL,
department_id int NOT NULL,
treatment_id int NOT NULL,
room_id int NOT NULL,
date date NOT NULL,
advance_payment money NOT NULL,
payment_method varchar(15) NOT NULL,
time time NOT NULL,
)


CREATE TABLE discharged(
record_id int NOT NULL IDENTITY(1,1),
admit_id int NOT NULL,
treatment_invoice varchar(10) NOT NULL,
payment_made money NOT NULL,
payment_date date NOT NULL,
treatment_id int NOT NULL,
)

CREATE TABLE issued_drug(
record_id int NOT NULL IDENTITY(1,1),
drug_id int NOT NULL,
quantity int NOT NULL,
total_price money NOT NULL,
treatment_id int NOT NULL,
)

CREATE TABLE drug (
drug_id int NOT NULL IDENTITY(1,1),
name varchar(50) NOT NULL,
discription varchar(100) NOT NULL,
unit_price money NOT NULL,

)

