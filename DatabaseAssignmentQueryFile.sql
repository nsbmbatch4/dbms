use master

DROP DATABASE city_central
/*Creating Database*/

CREATE DATABASE city_central
use city_central

/*Creating Tables*/

--department table
CREATE TABLE department(
  department_id VARCHAR(6) NOT NULL PRIMARY KEY,
  department_name VARCHAR(100) NOT NULL,
  location VARCHAR(50) NOT NULL,
  facilities VARCHAR(400) NOT NULL,
)

--employee table
CREATE TABLE employee(
	employee_id VARCHAR(5) NOT NULL PRIMARY KEY,
	fname VARCHAR(25) NOT NULL,
	lname VARCHAR(25) NOT NULL,
	date_of_join DATE NOT NULL,
	NIC_number VARCHAR(10) NOT NULL,
	qualification VARCHAR(100) NOT NULL,
	gender CHAR(1) NOT NULL,
	address VARCHAR(400) NOT NULL,
	employee_type VARCHAR(15) NOT NULL,
	department_id VARCHAR(6) NOT NULL
)

--employee_phone table
CREATE TABLE employee_phone(
	employee_id VARCHAR(5) NOT NULL PRIMARY KEY,
	phone_number VARCHAR(10) NOT NULL
)
 
/*ALTER TABLE patient
ADD CONSTRAINT pk_patient_id PRIMARY KEY(patient_id)*/

--doctor table
CREATE TABLE doctor(
	employee_id VARCHAR(5) NOT NULL PRIMARY KEY,
	specilaized_field VARCHAR(50) NOT NULL
)

--callon_doctor table
CREATE TABLE callon_doctor(
	employee_id VARCHAR(5) NOT NULL PRIMARY KEY,
	call_on_charge money NOT NULL,
)

--regular_doctor table
CREATE TABLE regular_doctor(
	employee_id VARCHAR(5) NOT NULL PRIMARY KEY,
	basic_salary money NOT NULL
)

--room table
CREATE TABLE room(
  room_no VARCHAR(4) NOT NULL PRIMARY KEY,
  status CHAR(1) NOT NULL,
  room_type VARCHAR(10) NOT NULL,
  room_fee money NOT NULL,
  department_id VARCHAR(6) NOT NULL,
)

--patient table
CREATE TABLE patient(
  patient_id VARCHAR(6) NOT NULL PRIMARY KEY,
  fname VARCHAR(25) NOT NULL,
  lname VARCHAR(25) NOT NULL,
  register_date DATE NOT NULL,
  dob DATE NOT NULL,
  address VARCHAR(200) NOT NULL,
  gender CHAR(1) NOT NULL
)

--patient_phone table
CREATE TABLE patient_phone(
	patient_id VARCHAR(6) NOT NULL PRIMARY KEY,
	phone_number VARCHAR(10)
)

--check_up table
CREATE TABLE check_up(
	checkup_id INT NOT NULL PRIMARY KEY,
	patient_condition VARCHAR(100) NOT NULL,
	date DATE NOT NULL,
	diagnosis CHAR(100) NOT NULL,
	check_up_fee money NOT NULL,
	patient_id VARCHAR(6) NOT NULL,
	employee_id VARCHAR(5) NOT NULL
)

--patient_admission
CREATE TABLE patient_admission(
	admission_id INT NOT NULL PRIMARY KEY,
	admission_date DATE NOT NULL,
	payment_method VARCHAR(10) NOT NULL,
	advance_payment money NOT NULL,
	initial_condition VARCHAR(200) NOT NULL,
	guardian_name VARCHAR(100) NOT NULL,
	guardian_contact_no VARCHAR(10) NOT NULL,
	checkup_id INT NOT NULL,
	room_no VARCHAR(4) NOT NULL
)

--operation table
CREATE TABLE operation(
	operation_id INT NOT NULL PRIMARY KEY,
	operation_date DATE NOT NULL,
	operation_type VARCHAR(50) NOT NULL,
	caution_level VARCHAR(25) NOT NULL,
	description VARCHAR(500) NOT NULL,
	treatment_advice VARCHAR(400) NOT NULL,
	operation_fee money NOT NULL,
	admission_id INT NOT NULL,
	employee_id VARCHAR(5) NOT NULL
)

--discharge_record
CREATE TABLE discharge_record(
	discharge_id INT NOT NULL PRIMARY KEY,
	discharge_date DATE NOT NULL,
	discharge_condition VARCHAR(200) NOT NULL,
	fee money NOT NULL,
	treatment_advice VARCHAR(400) NOT NULL,
	admission_id INT NOT NULL
)

--treatment table
CREATE TABLE treatments(
	treatment_id INT NOT NULL PRIMARY KEY,
	type VARCHAR(50) NOT NULL,
	description VARCHAR(200) NOT NULL,
	fee money NOT NULL,
	checkup_id INT NOT NULL
)

--drug table
CREATE TABLE drug(
	drug_id VARCHAR(6) NOT NULL PRIMARY KEY,
	drug_name VARCHAR(50) NOT NULL,
	price money NOT NULL,
	alternative_drug VARCHAR(50) NOT NULL,
	dose_description VARCHAR(200) NOT NULL
)

--payment table
CREATE TABLE payment(
	payment_id INT NOT NULL PRIMARY KEY,
	total INT,
	description VARCHAR(200) NOT NULL,
	patient_id VARCHAR(6) NOT NULL
)

--checkup_drug table
CREATE TABLE checkup_drug(
	quantity INT NOT NULL,
	drug_id VARCHAR(6) NOT NULL,
	checkup_id INT NOT NULL,
	PRIMARY KEY (drug_id, checkup_id)
)

/*ALL TABLES WERE CREATED WITHOUR ANY ERRORS*/



--FOREIGN KEY CONSTRAINTS

ALTER TABLE employee
ADD CONSTRAINT fk_employee_department_id
FOREIGN KEY(department_id) REFERENCES department(department_id)

ALTER TABLE employee_phone
ADD CONSTRAINT fk_employeephone_employee_id
FOREIGN KEY(employee_id) REFERENCES employee(employee_id)

ALTER TABLE doctor
ADD CONSTRAINT fk_doctor_employee_id
FOREIGN KEY (employee_id) REFERENCES doctor(employee_id)

ALTER TABLE regular_doctor
ADD CONSTRAINT fk_regulardoctor_employee_id
FOREIGN KEY (employee_id) REFERENCES employee (employee_id)

ALTER TABLE callon_doctor
ADD CONSTRAINT fk_callondoctor_employee_id
FOREIGN KEY (employee_id) REFERENCES employee (employee_id)

ALTER TABLE room
ADD CONSTRAINT fk_room_department_id
FOREIGN KEY(department_id) REFERENCES department(department_id)

ALTER TABLE patient_phone
ADD CONSTRAINT fk_patientphone_patient_id
FOREIGN KEY (patient_id) REFERENCES patient(patient_id)

ALTER TABLE check_up
ADD CONSTRAINT fk_checkup_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)

ALTER TABLE check_up
ADD CONSTRAINT fk_checkup_employee_id
FOREIGN KEY(employee_id) REFERENCES employee(employee_id)

ALTER TABLE patient_admission
ADD CONSTRAINT fk_patientadmission_checkup_id
FOREIGN KEY(checkup_id) REFERENCES check_up(checkup_id)

ALTER TABLE patient_admission
ADD CONSTRAINT fk_patient_admission_room_no
FOREIGN KEY (room_no) REFERENCES room(room_no)

ALTER TABLE operation
ADD CONSTRAINT fk_operation_admission_id
FOREIGN KEY(admission_id) REFERENCES patient_admission(admission_id)


ALTER TABLE operation
ADD CONSTRAINT fk_operation_employee_id
FOREIGN KEY(employee_id) REFERENCES employee(employee_id)

ALTER TABLE discharge_record
ADD CONSTRAINT fk_dischargerecord_admission_id
FOREIGN KEY(admission_id) REFERENCES patient_admission(admission_id)

ALTER TABLE treatments
ADD CONSTRAINT fk_treatments_checkup_id
FOREIGN KEY(checkup_id) REFERENCES check_up(checkup_id)

ALTER TABLE payment
ADD CONSTRAINT fk_payment_patient_id
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)

ALTER TABLE checkup_drug
ADD CONSTRAINT fk_checkupdrug_checkup_id
FOREIGN KEY(checkup_id) REFERENCES check_up(checkup_id)

ALTER TABLE checkup_drug
ADD CONSTRAINT fk_checkupdrug_drug_id
FOREIGN KEY(drug_id) REFERENCES drug(drug_id)

/*ALL THE FORIEGN KEY CONSTRAINTS WERE COMPLETED WITHOUT ANY ERROR*/

--CHECK CONSTRAINTS

ALTER TABLE patient
ADD CONSTRAINT chk_patientid_prefix
CHECK (patient_id LIKE 'PT%')

ALTER TABLE callon_doctor
ADD CONSTRAINT chk_callon_doctorid_prefix
CHECK (employee_id LIKE 'DC%')

ALTER TABLE regular_doctor
ADD CONSTRAINT chk_regular_doctorid_prefix
CHECK (employee_id LIKE 'DR%')

ALTER TABLE room
ADD CONSTRAINT chk_room_id_prefix
CHECK (room_no LIKE 'G%' OR room_no LIKE 'P%')

ALTER TABLE department
ADD CONSTRAINT chk_dep_id_prefix
CHECK (department_id LIKE 'DEP%' )

ALTER TABLE employee
ADD CONSTRAINT chk_employee_id_prefix
CHECK (employee_id LIKE 'EM%' OR employee_id LIKE 'DC%' OR employee_id LIKE 'DR%')

/*ALL THE CHECK CONSTRAINTS WERE COMPLETED WITHOUT ANY ERROR*/


 

--INSERTING SAMPLE DATA

INSERT INTO department VALUES('DEP001','phsychology','block 1','check ups and treatments')
INSERT INTO department VALUES('DEP002','cardiology','block2','operations and treatmens')
INSERT INTO department VALUES('DEP003','neurology','block3','check ups and treatments')
INSERT INTO department VALUES('DEP004','fertility clinic','block4','check ups and operations')
INSERT INTO department VALUES('DEP005','dental clinic','block5','treatments and surgery')



INSERT INTO employee VALUES('EM001','rajitha','senarathna','02-05-2008','891653129v','diploma in nursing','M','NO12,sarawanamuttu road,colombo 10','nurse','DEP001')
INSERT INTO employee VALUES('EM002','amali','perera','03-04-2014','785641296v','diploma in pharmaceutical','F','NO35,navam mawatha,colombo 08','other','DEP002')
INSERT INTO employee VALUES('EM003','mangalika','kumarihami','09-09-2002','562314789v','higher diploma in nursing','F','NO63,buthgamuwa road,kandy','attendent','DEP003')
INSERT INTO employee VALUES('DR001','pasindu','perera','07-03-2015','944759635v','pshychology','M','NO811,thilakarathana mawatha,colombo 10','doctor','DEP001')
INSERT INTO employee VALUES('DC001','oshadi','wijesingha','09-08-2010','923614578v','neurolgy','F','NO578,suboda road,homagama','doctor','DEP003')
INSERT INTO employee VALUES('EM004','kumaran','padmanadan','11-05-2009','831245796v','technician','M','NO36,pillayan road,jaffna','other','DEP004')
INSERT INTO employee VALUES('EM005','sumana','widisingha','02-05-2001','591397846v','diploma in nursing','M','NO213,koggala road,galle','nurse','DEP005')
INSERT INTO employee VALUES('DR002','kanchana','rathnayaka','03-08-2015','967826375v','cardiology','M','NO212,grand garden,colombo 07','doctor','DEP002')
INSERT INTO employee VALUES('DC002','kameshi','ganegama','11-04-2011','764139651v','fertility','F','NO555,nihal road,colombo 12','doctor','DEP004')

INSERT INTO employee_phone VALUES('EM001','0773583258')
INSERT INTO employee_phone VALUES('EM002','0715655321')
INSERT INTO employee_phone VALUES('EM003','0789655231')
INSERT INTO employee_phone VALUES('DR001','0728936455')
INSERT INTO employee_phone VALUES('DC001','0779653865')
INSERT INTO employee_phone VALUES('EM004','0714563821')
INSERT INTO employee_phone VALUES('EM005','0764156333')
INSERT INTO employee_phone VALUES('DR002','0770294518')
INSERT INTO employee_phone VALUES('DC002','0724512378')

INSERT INTO doctor VALUES('DR001','psychology')
INSERT INTO doctor VALUES('DC001','neurology')
INSERT INTO doctor VALUES('DC002','fertility')
INSERT INTO doctor VALUES('DR002','cardiology')

INSERT INTO callon_doctor VALUES('DC001','1000')
INSERT INTO callon_doctor VALUES('DC002','2500')

INSERT INTO regular_doctor VALUES('DR001','60000')
INSERT INTO regular_doctor VALUES('DR002','100000')

INSERT INTO room VALUES('P001','Y','private','500','DEP001')
INSERT INTO room VALUES('P002','N','private','500','DEP002')
INSERT INTO room VALUES('P003','Y','private','500','DEP003')
INSERT INTO room VALUES('P004','Y','private','500','DEP004')
INSERT INTO room VALUES('P005','N','private','500','DEP005')
INSERT INTO room VALUES('G001','Y','general','100','DEP001')
INSERT INTO room VALUES('G002','N','general','100','DEP002')
INSERT INTO room VALUES('G003','N','general','100','DEP003')
INSERT INTO room VALUES('G004','Y','general','100','DEP004')
INSERT INTO room VALUES('G005','N','general','100','DEP005')


INSERT INTO patient VALUES('PT0001','lasitha','tharanga','02-01-2016','05-06-1994','NO45,udara road,anuradhapura','M')
INSERT INTO patient VALUES('PT0002','ishara','oshajith','06-08-2012','11-03-1993','NO63,mahawa road,mahawa','M')
INSERT INTO patient VALUES('PT0003','devaki','nayanahari','08-10-2009','01-01-1990','NO789,wedamulla road,wattala','F')
INSERT INTO patient VALUES('PT0004','kausha','thathsarani','02-03-2014','02-09-1994','NO777,walasmulla road,matara','F')
INSERT INTO patient VALUES('PT0005','kamesh','ganegama','03-03-2003','06-08-1997','NO478,udugamuwa road,kotte','M')

INSERT INTO patient_phone VALUES('PT0001','0778569412')
INSERT INTO patient_phone VALUES('PT0002','0721568496')
INSERT INTO patient_phone VALUES('PT0003','0718965243')
INSERT INTO patient_phone VALUES('PT0004','0789531249')
INSERT INTO patient_phone VALUES('PT0005','0112560139')

INSERT INTO check_up VALUES('1','normal','02-02-2016','mental depression','500','PT0001','DR001')
INSERT INTO check_up VALUES('2','bad','03-02-2016','High Cholestarol','500','PT0002','DR002')
INSERT INTO check_up VALUES('3','bad','03-02-2016','nurve damage in arm','500','PT0003','DC001')
INSERT INTO check_up VALUES('4','normal','03-02-2016','baby scan','500','PT0004','DC002')
INSERT INTO check_up VALUES('5','bad','04-02-2016','high blood pressure and cholestarol','500','PT0005','DR002')

INSERT INTO patient_admission VALUES('1','08-02-2016','cash','25000','weak','liyanage','0778945163','2','P002')
INSERT INTO patient_admission VALUES('2','08-03-2016','creditcard','25000','weak','chanuka','0729645789','5','P005')
INSERT INTO patient_admission VALUES('3','08-04-2016','insuarance','15000','weak','kanthi','0785693125','3','G002')

INSERT INTO operation VALUES('1','08-05-2016','cardiactric surgery','high','clearing the blocked blood vain in the heart','diet control','20000','1','DR002')
INSERT INTO operation VALUES('2','08-06-2016','cardiactric surgery','high','clearing the blocked blood vain in the heart','diet control','20000','2','DR002')
INSERT INTO operation VALUES('3','08-07-2016','neurologic surgery','medium','repairing damaged nurves','physio theropy','15000','3','DC001')

INSERT INTO discharge_record VALUES('1','08-21-2016','good','','diet control and excercise','1')
INSERT INTO discharge_record VALUES('2','08-25-2016','good','','diet control and excercise','2')
INSERT INTO discharge_record VALUES('3','08-29-2016','good','','physio theropy','3')

INSERT INTO treatments VALUES('1','medicine course','use medicine and do meditation','','1')
INSERT INTO treatments VALUES('2','medicine course','use medicine and do excercise','','2')
INSERT INTO treatments VALUES('3','medicine course','use medicine and do meditation','','3')
INSERT INTO treatments VALUES('4','medicine course','use medicine ','','4')
INSERT INTO treatments VALUES('5','medicine course','use medicine and do excercise','','5')

INSERT INTO drug VALUES('DRU001','paracetamol',2,'disprine','according to doctors prescription')
INSERT INTO drug VALUES('DRU002','methfomine',15,'glycomatt','according to doctors prescription')
INSERT INTO drug VALUES('DRU003','diagin',5,'milk of magnizium','according to doctors prescription')
INSERT INTO drug VALUES('DRU004','amoxilin',10,'augmantine','according to doctors prescription')
INSERT INTO drug VALUES('DRU005','piriton',5,' Chlorphenamine','according to doctors prescription')

INSERT INTO payment VALUES('1','','all payments done','PT0001')
INSERT INTO payment VALUES('2','','all payments done','PT0002')
INSERT INTO payment VALUES('3','','all payments done','PT0003')
INSERT INTO payment VALUES('4','','all payments done','PT0004')
INSERT INTO payment VALUES('5','','all payments done','PT0005')

INSERT INTO checkup_drug VALUES('15','DRU001','1')
INSERT INTO checkup_drug VALUES('10','DRU002','2')
INSERT INTO checkup_drug VALUES('8','DRU003','3')
INSERT INTO checkup_drug VALUES('12','DRU004','4')
INSERT INTO checkup_drug VALUES('20','DRU001','5')


/*Views*/

--doctor

CREATE VIEW vw_regular_doctor
AS
SELECT emp.employee_id AS EmployeeID, emp.fname AS FirstName, emp.lname AS LastName, doc.specilaized_field AS Field,regdoc.basic_salary AS Salary, empph.phone_number AS PhoneNumber
FROM employee AS emp JOIN doctor AS doc ON emp.employee_id=doc.employee_id JOIN regular_doctor AS regdoc 
ON emp.employee_id=regdoc.employee_id JOIN employee_phone AS empph ON emp.employee_id=empph.employee_id
Go
select * from vw_regular_doctor


CREATE VIEW vw_callon_doctor
AS
SELECT emp.employee_id AS EmployeeID, emp.fname AS FirstName, emp.lname AS LastName, doc.specilaized_field AS Field,calldoc.call_on_charge AS ChargePerCall ,empph.phone_number AS PhoneNumber
FROM employee AS emp JOIN doctor AS doc ON emp.employee_id=doc.employee_id JOIN callon_doctor AS calldoc ON emp.employee_id=calldoc.employee_id JOIN employee_phone AS empph ON emp.employee_id=empph.employee_id
GO
select * from vw_callon_doctor


--nurse

CREATE VIEW vw_nurse
AS
SELECT emp.employee_id AS EmployeeID,emp.fname AS FirstName,emp.lname AS LastName,ephone.phone_number AS PhoneNumber
From employee AS emp JOIN employee_phone As ephone
ON emp.employee_id=ephone.employee_id AND emp.employee_type='nurse'
GO
select * from vw_nurse


--attendant

CREATE VIEW vw_attendent
AS
SELECT emp.employee_id AS EmployeeID,emp.fname AS FirstName,emp.lname AS LastName,ephone.phone_number AS PhoneNumber
From employee AS emp JOIN employee_phone As ephone
ON emp.employee_id=ephone.employee_id AND emp.employee_type='attendent'
GO
select * from vw_attendent


--other_staff

CREATE VIEW vw_other_staff
AS
SELECT emp.employee_id AS EmployeeID,emp.fname AS FirstName,emp.lname AS LastName,ephone.phone_number AS PhoneNumber
From employee AS emp JOIN employee_phone As ephone
ON emp.employee_id=ephone.employee_id AND emp.employee_type='other'
GO
select * from vw_other_staff



/*TRIGGER*/
--room status update trigger
CREATE TRIGGER tg_discharge_record_roomstat
ON discharge_record
AFTER INSERT
	AS
		DECLARE @status CHAR(1)
		SET @status='Y'

		DECLARE @discharge_id INT
		SELECT @discharge_id = i.discharge_id FROM inserted i

		DECLARE @add_id INT
		SELECT @add_id = pa.admission_id FROM patient_admission pa JOIN discharge_record dr ON pa.admission_id=dr.admission_id

		DECLARE @room_no VARCHAR(4)
		SELECT @room_no = room_no FROM patient_admission WHERE admission_id =@add_id

		UPDATE room
		SET status = @status WHERE room.room_no = @room_no
		PRINT('Room'+@room_no+' is now free.')
	

--discharge_check_in_operations
CREATE TRIGGER tg_check_discharge_for_operations
ON operation
AFTER INSERT

	AS
	DECLARE @opadrec_id INT
	SELECT @opadrec_id = i.admission_id FROM inserted i
	IF EXISTS (SELECT d.admission_id FROM discharge_record d WHERE @opadrec_id = d.admission_id)
		BEGIN
			PRINT('The Patient Already Discharged')
			ROLLBACK
		END
	

--emp_id_prfix_check trigger
CREATE TRIGGER emp_id_prefix_check
ON employee
FOR INSERT
AS 
BEGIN

	DECLARE @emptype varchar(10)
	DECLARE @empid varchar(5)
	SELECT @emptype=employee_type,@empid=employee_id FROM employee
	
	IF @emptype='doctor'
	BEGIN
		IF @empid NOT LIKE 'DR%'
		BEGIN
			PRINT 'wrong index format'
		END
		
		ELSE IF @empid NOT LIKE 'DC%'
		BEGIN
			PRINT 'wrong index format'
		END	
	END
	ELSE
	BEGIN
		IF @empid NOT LIKE 'EM%'
		BEGIN
			PRINT 'wrong index format'
		END
	END
END




/*Procedure*/
--payment procedure
CREATE PROCEDURE proc_payment_total_generate @pt_id VARCHAR(6),@ch_date DATE
AS
	DECLARE @checkupfee money
	DECLARE @roomcharge money
	DECLARE @totalroomcharge money
	DECLARE @drugfee money
	DECLARE @treatmentfee money
	DECLARE @operationfee money
	DECLARE @advancedp money
	DECLARE @total money
	DECLARE @due money
	DECLARE @days INT

	SELECT @checkupfee = check_up_fee FROM check_up WHERE patient_id = @pt_id AND date = @ch_date

	SELECT @advancedp =  advance_payment from patient_admission
	join check_up on check_up.checkup_id=patient_admission.checkup_id
	where check_up.patient_id=@pt_id

	SELECT @roomcharge = room_fee from room join patient_admission on room.room_no=patient_admission.room_no join check_up on 
	patient_admission.checkup_id = check_up.checkup_id join patient on check_up.patient_id = patient.patient_id AND patient.patient_id = @pt_id
 
	SELECT @days = DATEDIFF((DAY),(SELECT discharge_date FROM discharge_record join patient_admission on discharge_record.admission_id = patient_admission.admission_id join check_up ON patient_admission.checkup_id = check_up.checkup_id join patient on check_up.patient_id = patient.patient_id AND patient.patient_id = @pt_id),
	(SELECT admission_date FROM patient_admission join check_up ON patient_admission.checkup_id = check_up.checkup_id join patient on check_up.patient_id = patient.patient_id AND patient.patient_id = @pt_id))

	SELECT @treatmentfee = fee from treatments join check_up ON treatments.checkup_id = check_up.checkup_id join patient ON check_up.patient_id=patient.patient_id AND patient.patient_id = @pt_id

	SELECT @drugfee = (drug.price*checkup_drug.quantity) FROM drug join checkup_drug ON drug.drug_id = checkup_drug.drug_id join check_up ON checkup_drug.checkup_id = check_up.checkup_id join patient on check_up.patient_id = patient.patient_id AND patient.patient_id = @pt_id

	SELECT @totalroomcharge = @days*@roomcharge

	SET @total = @checkupfee+@roomcharge+@treatmentfee+@drugfee+@totalroomcharge
	SET @due = @total-@advancedp

	UPDATE payment
	SET total= @total WHERE patient_id = @pt_-d

	PRINT('Total Bill Generated.')


EXEC proc_payment_total_generate 'PT0003','03-02-2016'

select * from payment
