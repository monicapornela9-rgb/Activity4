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