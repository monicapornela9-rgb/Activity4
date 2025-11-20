-- SQL file
CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices(
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount NUMERIC(10,2),
    paymentdate TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATE,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Monica', 'Pornela', 'Bugtong na Pulo', '09637958369', 'monicapornela09@gmail.com'),
(2, 'Lawrence', 'Mindanao', 'Quezon', '09917528407', 'lawrencem@gmail.com'),
(3, 'Anne', 'Porta', 'Pagbilao', '09637958876', 'anneporta09@gmail.com'),
(4, 'Gee-Anne', 'Lescano', 'Sico', '09123458369', 'geeanne05@gmail.com'),
(5, 'Baeverly', 'Eroles', 'San Jose', '09123456789', 'beveroles99@gmail.com'),
(6, 'JhonRay', 'Tennorio', 'Lipa City', '09987654321', 'jhonray123@gmail.com'),
(7, 'Camille', 'Hernandez', 'Pinagkawitan', '09453672821', 'camilleher12@gmail.com'),
(8, 'Rona', 'Silva', 'Tambo', '09453672987', 'ronsilva@gmail.com'),
(9, 'Angel', 'Dinglasan', 'Sampaguita', '09123472821', 'angeldinglasan78@gmail.com'),
(10, 'Cathrine', 'Balmes', 'Antipolo', '09453676785', 'cathrineblams2@gmail.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Snoop', 'Dog', 'Labrador', '2020-05-10', 'Male', 'Yellow', 1),
(2, 'Orange', 'Cat', 'Persian', '2021-03-12', 'Male', 'White', 2),
(3, 'Luna', 'Dog', 'Beagle', '2019-11-20', 'Female', 'Brown', 3),
(4, 'Cotton', 'Cat', 'Siamese', '2022-01-15', 'Female', 'Cream', 4),
(5, 'Thor', 'Dog', 'Bulldog', '2018-06-08', 'Male', 'Brindle', 5),
(6, 'Luca', 'Cat', 'Ragdoll', '2023-02-14', 'Female', 'White', 6),
(7, 'Whitey', 'Dog', 'German Shepherd', '2020-12-25', 'Male', 'Black & Tan', 7),
(8, 'Blacky', 'Dog', 'Poodle', '2019-04-30', 'Female', 'White', 8),
(9, 'Oreo', 'Cat', 'British Shorthair', '2021-09-01', 'Male', 'Gray', 9 ),
(10, 'Nibbles', 'Cat', 'Russian Blue', '2023-07-07', 'Male', 'Golden', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2025-02-01', 'Vaccination'),
(2, 3, '2025-02-03', 'General health assessment'),
(3, 2, '2025-02-05', 'Deworming'),
(4, 5, '2025-02-06', 'Vaccination'),
(5, 4, '2025-02-08', 'Dental cleaning'),
(6, 7, '2025-02-10', 'Follow-up check-up'),
(7, 9, '2025-02-12', 'Grooming'),
(8, 8, '2025-02-15', 'Eye irritation check'),
(9, 6, '2025-02-18', 'Weight loss evaluation'),
(10, 10, '2025-02-20', 'Regular check-up');

INSERT INTO doctors (doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '09876543210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '09551234567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '09112223333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '09998887777', 'sofia@example.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '09135557777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Ophthalmology Specialist', '09332221111', 'carmen@example.com'),
(7, 'Dr.Rafael', 'Mendoza', 'Exotic Animals Specialist', '09082223344', 'rafael@example.com'),
(8, 'Dr.Julia', 'Navarro', 'Diagnostic Specialist', '09175556677', 'julia@example.com'),
(9, 'Dr.Marco', 'Villanueva', 'Rehabilitation Specialist', '09208881234', 'marco@example.com'),
(10, 'Dr.Elena', 'Cabrera', 'Emergency Care Specialist', '09453337788', 'elena@example.com');

INSERT INTO invoices (invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM invoices 
WHERE appointid = (
    SELECT appointid 
    FROM appointments 
    WHERE animalid = (
        SELECT animalid 
        FROM animals 
        WHERE name = 'Blacky'
    )
);

DELETE FROM appointments 
WHERE animalid = (
    SELECT animalid 
    FROM animals 
    WHERE name = 'Blacky'
);