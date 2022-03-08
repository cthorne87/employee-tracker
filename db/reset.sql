DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS department;

CREATE TABLE department (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE role (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INTEGER,
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE SET NULL
);

CREATE TABLE employee (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INTEGER,
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE SET NULL,
  manager_id INTEGER,
  CONSTRAINT fk_employee FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

INSERT INTO department (name)
VALUES
  ('Quality'),
  ('Engineering');


INSERT INTO role (title, salary, department_id)
VALUES
  ('QA Engineer', 70000, 1),
  ('QA Lead', 100000, 1),
  ('Developer', 85000, 2),
  ('Junior Developer', 85000, 2),
  ('Senior Developer', 100000, 2);


INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES
  ('Chris', 'Thorne', 5, NULL),
  ('Fiona', 'Thorne', 4, 1),
  ('Lauren', 'Thorne', 2, NULL);