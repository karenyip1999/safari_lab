DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosure;

CREATE TABLE assignment(
    id SERIAL PRIMARY KEY,
    employee_id int REFERENCES staff(id),
    enclosure_id int REFERENCES enclosure(id) 
);

CREATE TABLE animal(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age int,
    enclosure_id int REFERENCES enclosure(id)
);

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber int
);

CREATE TABLE enclosure(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity int,
    closedForMaintenance BOOLEAN
);