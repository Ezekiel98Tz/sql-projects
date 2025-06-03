-- 1. List all patients with their upcoming appointments (Scheduled status)
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    a.appointment_date,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.status
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Scheduled'
ORDER BY a.appointment_date;

-- 2. Get total billing amount by patient
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    SUM(b.amount) AS total_billed,
    COUNT(b.bill_id) AS number_of_bills
FROM Patients p
LEFT JOIN Bills b ON p.patient_id = b.patient_id
GROUP BY p.patient_id
ORDER BY total_billed DESC;

-- 3. Doctors and number of appointments they have had (completed or scheduled)
SELECT
    d.doctor_id,
    d.first_name,
    d.last_name,
    COUNT(a.appointment_id) AS appointment_count
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
WHERE a.status IN ('Scheduled', 'Completed')
GROUP BY d.doctor_id
ORDER BY appointment_count DESC;

-- 4. Treatments given for a specific diagnosis (e.g., coronary artery disease)
SELECT
    t.treatment_id,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    t.diagnosis,
    t.procedure_details,
    t.treatment_date
FROM Treatments t
JOIN Appointments a ON t.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id
WHERE t.diagnosis LIKE '%coronary artery disease%'
ORDER BY t.treatment_date DESC;

-- 5. Prescription details for a given patient
SELECT
    p.first_name,
    p.last_name,
    pr.medication_name,
    pr.dosage,
    pr.frequency,
    pr.duration
FROM Prescriptions pr
JOIN Treatments t ON pr.treatment_id = t.treatment_id
JOIN Appointments a ON t.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id
WHERE p.patient_id = 1;

-- 6. Billing status summary (count of bills by status)
SELECT
    payment_status,
    COUNT(bill_id) AS number_of_bills,
    SUM(amount) AS total_amount
FROM Bills
GROUP BY payment_status;
