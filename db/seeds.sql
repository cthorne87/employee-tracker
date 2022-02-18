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