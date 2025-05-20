-- Drop tables if they exist (for resetting the DB)
DROP TABLE IF EXISTS Prescriptions, Bills, Treatments, Appointments, Patients, Doctors, Departments;

-- Departments (e.g., Cardiology, Neurology)
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Doctors
CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    department_id INT REFERENCES Departments(department_id),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Patients
CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    address TEXT,
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Appointments
CREATE TABLE Appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    doctor_id INT REFERENCES Doctors(doctor_id),
    appointment_date TIMESTAMP,
    status VARCHAR(20) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled')),
    notes TEXT
);

-- Treatments
CREATE TABLE Treatments (
    treatment_id SERIAL PRIMARY KEY,
    appointment_id INT REFERENCES Appointments(appointment_id),
    diagnosis TEXT,
    procedure_details TEXT,
    treatment_date DATE DEFAULT CURRENT_DATE
);

-- Prescriptions
CREATE TABLE Prescriptions (
    prescription_id SERIAL PRIMARY KEY,
    treatment_id INT REFERENCES Treatments(treatment_id),
    medication_name VARCHAR(100),
    dosage VARCHAR(50),
    frequency VARCHAR(50),
    duration VARCHAR(50)
);

-- Bills
CREATE TABLE Bills (
    bill_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    treatment_id INT REFERENCES Treatments(treatment_id),
    amount DECIMAL(10, 2),
    payment_status VARCHAR(20) CHECK (payment_status IN ('Paid', 'Pending', 'Cancelled')),
    billing_date DATE DEFAULT CURRENT_DATE
);
