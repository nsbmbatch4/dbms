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

ALTER TABLE patient
ADD CONSTRAINT pk_patient PRIMARY KEY(patient_id)



CREATE TABLE patient_contact(
patient_id int NOT NULL,
contact_number int NOT NULL
)

ALTER TABLE patient_contact
ADD CONSTRAINT pk_patient_control PRIMARY KEY(patient_id,contact_number)


CREATE TABLE regular_patient(
patient_id int NOT NULL,
date_of_visit date NOT NULL,
treatement varchar(1000) NOT NULL,
state_of_treatement varchar(500) NOT NULL,
time time NOT NULL,
diagnosis varchar(500) NOT NULL,
medicine_recommended varchar(1000) NOT NULL,
)

ALTER TABLE regular_patient
ADD CONSTRAINT pk_regular_patient PRIMARY KEY(patient_id)


CREATE TABLE operated_patients(
patient_id int NOT NULL,
date_of_operation date NOT NULL,
condition_before varchar(1000) NOT NULL,
condition_after varchar(1000) NOT NULL,
treatment_advice varchar(1000) NOT NULL,
room_number int NOT NULL
)

ALTER TABLE operated_patients
ADD CONSTRAINT pk_operated_patient PRIMARY KEY(patient_id)



CREATE TABLE employee(
employee_id int NOT NULL IDENTITY(1,1),
first_name varchar(100) NOT NULL,
last_name varchar(150) NOT NULL,
address varchar(500) NOT NULL,
qualification varchar(800) NOT NULL,
type varchar(10) NOT NULL,
department_id int NOT NULL
)

ALTER TABLE employee
ADD CONSTRAINT pk_employee PRIMARY KEY(employee_id)


CREATE TABLE employee_contact(
employee_id int NOT NULL,
contact_number int NOT NULL
)

ALTER TABLE employee_contact
ADD CONSTRAINT pk_employee_contact PRIMARY KEY(employee_id,contact_number)


CREATE TABLE doctor(
employee_id int NOT NULL,
doctor_id int NOT NULL IDENTITY(1,1)
)

ALTER TABLE doctor
ADD CONSTRAINT pk_doctor PRIMARY KEY(doctor_id)


CREATE TABLE regular_doctor(
doctor_id int NOT NULL,
predefined_salary money NOT NULL,
date_of_join date NOT NULL
)

ALTER TABLE regular_doctor
ADD CONSTRAINT pk_regular_doctor PRIMARY KEY(doctor_id)

CREATE TABLE callon_doctor(
doctor_id int NOT NULL,
payment_due date NOT NULL,
fee_per_call money NOT NULL
)

ALTER TABLE callon_doctor
ADD CONSTRAINT pk_callon_doctor PRIMARY KEY(doctor_id)


CREATE TABLE department(
department_id int NOT NULL IDENTITY(1,1),
name varchar(500) NOT NULL,
location varchar(100) NOT NULL,
facilities varchar(800) NOT NULL
)

ALTER TABLE department
ADD CONSTRAINT pk_department PRIMARY KEY(department_id)


CREATE TABLE room(
room_number int NOT NULL,
charges_per_day money NOT NULL,
status varchar(1) NOT NULL,
type varchar(1) NOT NULL,
department_id int NOT NULL
)

ALTER TABLE room
ADD CONSTRAINT pk_room PRIMARY KEY(room_number,department_id)


CREATE TABLE treatement(
record_id int NOT NULL IDENTITY(1,1),
date_of_checkup date NOT NULL,
diagnosis varchar(500) NOT NULL,
status varchar(100) NOT NULL,
treatment varchar(1000) NOT NULL,
doctor_id int NOT NULL,
patient_id int NOT NULL
)

ALTER TABLE treatement
ADD CONSTRAINT pk_treatement PRIMARY KEY(record_id)


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

ALTER TABLE admitted
ADD CONSTRAINT pk_admitted PRIMARY KEY(record_id)


CREATE TABLE discharged(
record_id int NOT NULL IDENTITY(1,1),
admit_id int NOT NULL,
treatment_invoice varchar(10) NOT NULL,
payment_made money NOT NULL,
payment_date date NOT NULL,
treatment_id int NOT NULL,
)

ALTER TABLE discharged
ADD CONSTRAINT pk_discharged PRIMARY KEY(record_id)


CREATE TABLE issued_drug(
record_id int NOT NULL IDENTITY(1,1),
drug_id int NOT NULL,
quantity int NOT NULL,
total_price money NOT NULL,
treatment_id int NOT NULL,
)

ALTER TABLE issued_drug
ADD CONSTRAINT pk_issued_drug PRIMARY KEY(record_id)

CREATE TABLE drug (
drug_id int NOT NULL IDENTITY(1,1),
name varchar(50) NOT NULL,
discription varchar(100) NOT NULL,
unit_price money NOT NULL,
)

ALTER TABLE drug
ADD CONSTRAINT pk_drug PRIMARY KEY(drug_id)

