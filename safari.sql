DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosure;

CREATE TABLE enclosure(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity int,
    closedForMaintenance BOOLEAN
);

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber int
);

CREATE TABLE animal(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age int,
    enclosure_id int REFERENCES enclosure(id)
);

CREATE TABLE assignment(
    id SERIAL PRIMARY KEY,
    employee_id int REFERENCES staff(id),
    enclosure_id int REFERENCES enclosure(id) 
);

INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('Tiger Enclosure', 5, true);
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('Monkey Enclosure', 3, false);
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('Dog Enclosure', 4, false);
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('Sloth Enclosure', 4, false);

INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 35, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Bob', 'Tiger', 45, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Coco','Monkey', 27, 2);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Scooby', 'Dog', 49, 3);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Sid', 'Sloth', 60, 4);


INSERT INTO staff (name, employeeNumber) VALUES ('Karen', 1);
INSERT INTO staff (name, employeeNumber) VALUES ('Zakaria', 2);

INSERT INTO assignment ( employee_id, enclosure_id) VALUES (1,2);
INSERT INTO assignment ( employee_id, enclosure_id) VALUES (2,1);
INSERT INTO assignment ( employee_id, enclosure_id) VALUES (1,3);
INSERT INTO assignment ( employee_id, enclosure_id) VALUES (2,4);

-- Query 1 : 
SELECT name FROM animal WHERE enclosure_id = (SELECT id FROM enclosure WHERE name = 'Dog Enclosure');
--Returns Scooby from the dog enclosure

--Query 2 : 
SELECT name FROM staff WHERE id = (SELECT employee_id FROM assignment WHERE enclosure_id = (SELECT id FROM enclosure WHERE name = 'Dog Enclosure') );
-- Returns Karen for the dog enclosure


