-- Task 2

use Hospital;

 -- Creating task2.sql content with INSERT, UPDATE, DELETE, and NULL handling

-- Insert into Departments
INSERT INTO Departments (name, description) VALUES
('Cardiology', 'Heart-related care'),
('Orthopedics', 'Bone and joint care'),
('Pediatrics', 'Children healthcare');


-- Insert into Doctors
INSERT INTO Doctors (first_name, last_name, email, phone, department_id, specialization) VALUES
('Amit', 'Sharma', 'amit.sharma@hospital.com', '9876543210', 1, 'Cardiologist'),
('Sneha', 'Verma', 'sneha.verma@hospital.com', NULL, 2, 'Orthopedic Surgeon');



-- Insert into Patients
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone, email, address) VALUES
('Ravi', 'Kumar', '1988-05-12', 'Male', '9123456780', 'ravi.kumar@example.com', '123 Lane, City'),
('Maya', 'Sharma', '1995-07-08', 'Female', '9876541230', NULL, '456 Street, City');




-- Insert into Rooms (using default values)
INSERT INTO Rooms (room_number, cost_per_day) VALUES
('101', 5000),
('102', 4500);


-- Insert into Admissions (discharged_on is NULL)
INSERT INTO Admissions (patient_id, room_id, admitted_on, reason) VALUES
(1, 1, '2025-08-01 09:30:00', 'Chest Pain'),
(2, 2, '2025-08-02 11:00:00', 'Fracture');


-- Insert into Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_datetime, reason) VALUES
(1, 1, '2025-08-03 14:00:00', 'Follow-up'),
(2, 2, '2025-08-04 10:00:00', 'Initial Consultation');


-- Insert into Medications
INSERT INTO Medications (name, description, unit) VALUES
('Paracetamol', 'Pain reliever', 'Tablet'),
('Amoxicillin', 'Antibiotic', 'Capsule');



-- Insert into Prescriptions and Items
INSERT INTO Prescriptions (patient_id, doctor_id) VALUES
(1, 1);


INSERT INTO Prescription_Items (prescription_id, medication_id, dosage, duration, instructions) VALUES
(1, 1, '1 tablet twice a day', '5 days', 'After meals');



-- Insert into Bills (using NULL in appointment_id)
INSERT INTO Bills (patient_id, admission_id, appointment_id, total_amount, payment_method) VALUES
(1, 1, NULL, 12000.00, 'Card');




-- Demonstrate UPDATE usage
UPDATE Rooms SET is_available = False WHERE room_id = 1;
UPDATE Admissions SET discharged_on = '2025-08-05 10:00:00' where admission_id = 1;
UPDATE Admissions SET discharged_on = '2025-08-06 10:30:00' WHERE admission_id = 2;
UPDATE Appointments SET status = 'Completed' where appointment_datetime < NOW();



-- Demonstrate DELETE usage
DELETE FROM Appointments WHERE status = 'Cancelled';


-- (Commented out) Example of NOT NULL violation
-- This would cause error due to missing NOT NULL fields
INSERT INTO Doctors (last_name, email) VALUES ('Patel', 'no_first_name@example.com');


-- INSERT with specific columns only
INSERT INTO Patients (first_name, last_name) VALUES ('Karan', 'Joshi');


-- Use of IS NULL
SELECT * FROM Patients WHERE email IS NULL;


-- Example rollback (commented out)
START TRANSACTION;
DELETE FROM Bills WHERE bill_id = 1;
ROLLBACK;
