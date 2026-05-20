CREATE DATABASE IF NOT EXISTS `Tasca7.2`;
USE `Tasca7.2`;


CREATE TABLE xml_employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(100),
    xml_content LONGTEXT
);


CREATE TABLE xml_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(100),
    xml_content LONGTEXT
);


CREATE TABLE xml_transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(100),
    xml_content LONGTEXT
);


INSERT INTO xml_employees (doc_name, xml_content)
VALUES ('Employees.xml', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employees.xml'));

INSERT INTO xml_accounts (doc_name, xml_content)
VALUES ('Accounts.xml', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Accounts.xml'));

INSERT INTO xml_transactions (doc_name, xml_content)
VALUES ('Transactions.xml', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Transactions.xml'));



-- P1: Nom de tots els empleats de la sucursal "Headquarters"
SELECT ExtractValue(xml_content, '//employee[assigned_branch/assigned_branch_name="Headquarters"]/first_name') AS Noms_Headquarters
FROM xml_employees 
WHERE doc_name = 'Employees.xml';

-- P2: Quants empleats hi ha a l'àrea d'Operacions ("Operations")
SELECT ExtractValue(xml_content, 'count(//employee[department/department_name="Operations"])') AS Total_Operacions
FROM xml_employees 
WHERE doc_name = 'Employees.xml';

-- P3: Noms dels empleats amb superior `emp_id="4"`
SELECT ExtractValue(xml_content, '//employee[superior_emp_id="4"]/first_name') AS Empleats_Sota_Id_4
FROM xml_employees 
WHERE doc_name = 'Employees.xml';

-- P4: Data d'inici de l'empleat amb `emp_id="7"`
SELECT ExtractValue(xml_content, '//employee[@emp_id="7"]/start_date') AS Data_Inici_Emp_7
FROM xml_employees 
WHERE doc_name = 'Employees.xml';

-- P5: Ciutats de les sucursals dels empleats amb títol "Head Teller"
SELECT ExtractValue(xml_content, '//employee[title="Head Teller"]/assigned_branch/assigned_branch_city') AS Ciutats_Head_Teller
FROM xml_employees 
WHERE doc_name = 'Employees.xml';

