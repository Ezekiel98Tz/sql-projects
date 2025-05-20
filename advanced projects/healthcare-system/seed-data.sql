-- Seed Departments
INSERT INTO Departments (name, location) VALUES
('Cardiology', 'Building A - Floor 2'),
('Neurology', 'Building B - Floor 3'),
('Pediatrics', 'Building C - Floor 1');

-- Seed Doctors
INSERT INTO Doctors (first_name, last_name, specialization, department_id, email, phone) VALUES
('Alice', 'Kimaro', 'Cardiologist', 1, 'alice.kimaro@hospital.tz', '255701111222'),
('Brian', 'Mushi', 'Neurologist', 2, 'brian.mushi@hospital.tz', '255702222333'),
('Cynthia', 'Ngowi', 'Pediatrician', 3, 'cynthia.ngowi@hospital.tz', '255703333444');

-- Seed Patients
INSERT INTO Patients (first_name, last_name, dob, gender, phone, email, address) VALUES
('David', 'Massawe', '1985-07-15', 'Male', '255704444555', 'david.massawe@example.com', 'Arusha'),
('Evelyn', 'Ndalu', '1990-03-22', 'Female', '255705555666', 'evelyn.ndalu@example.com', 'Dodoma'),
('Frank', 'Mdegela', '2001-12-09', 'Male', '255706666777', 'frank.mdegela@example.com', 'Mbeya');

-- Seed Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, '2025-05-21 09:00:00', 'Completed', 'Routine checkup - chest pain.'),
(2, 2, '2025-05-22 14:00:00', 'Scheduled', 'Follow-up for migraines.'),
(3, 3, '2025-05-22 10:30:00', 'Cancelled', 'Patient cancelled due to travel.');

-- Seed Treatments
INSERT INTO Treatments (appointment_id, diagnosis, procedure_details) VALUES
(1, 'Mild coronary artery disease', 'ECG + stress test');

-- Seed Prescriptions
INSERT INTO Prescriptions (treatment_id, medication_name, dosage, frequency, duration) VALUES
(1, 'Aspirin', '75mg', 'Once daily', '30 days'),
(1, 'Atorvastatin', '20mg', 'Once daily', '30 days');

-- Seed Bills
INSERT INTO Bills (patient_id, treatment_id, amount, payment_status) VALUES
(1, 1, 120.00, 'Paid');
