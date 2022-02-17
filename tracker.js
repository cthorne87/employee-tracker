const inquirer = require('inquirer');
const db = require('./config/connection');


const initChoices = [
    'View departments',
    'View roles',
    'View employees',
    'Add a department',
    'Add a role',
    'Add an employee',
    'Update an employee'
  ];

const trackerStart = () => {
    inquirer
    .prompt(
      {
        type: 'list',
        name: 'selection',
        message: 'Select something',
        choices: initChoices
      }
    )
    .then(({selection}) => {
        if(selection === initChoices[0]){ //View departments
          const sql = 
          `
          SELECT 
          name AS Department
          FROM department
          `
          db.query(sql, (err, departments) => {
            if(err) {
              console.log(err);
              return;
            }
            console.table(departments);
            console.log("\n");
            initWork();
          })
        } else if (selection === initChoices[1]) { //View roles
          const sql = 
          `
          SELECT
          role.title AS 'Job Title',
          role.salary AS Salary,
          department.name AS 'Department Name'
          FROM role
          LEFT JOIN department ON role.department_id = department.id;
          `
  
          db.query(sql, (err, roles) => {
            if(err) {
              console.log(err);
              return;
            }
            console.table(roles);
            console.log("\n");
            initWork();
          })
        } else if (selection === initChoices[2]){ //View employees
          const sql = 
          `
          SELECT 
          concat(emp.first_name, " ", emp.last_name) AS Name,
          concat(mang.first_name, " ", mang.last_name) AS 'Manager Name',
          role.title AS 'Job Title',
          role.salary AS 'Salary',
          department.name AS 'Department'
          FROM employee emp
          LEFT JOIN role ON emp.role_id = role.id
          LEFT JOIN department ON emp.role_id = department.id
          LEFT JOIN employee mang ON emp.manager_id = mang.id
          `
  
          db.query(sql, (err, employees) => {
            if(err) {
              console.log(err);
              return;
            }
            console.table(employees);
            console.log("\n");
            initWork();
          })
        } else if (selection === initChoices[3]){ //add new department
          addDepartment();
        } else if (selection === initChoices[4]){ //add new role
          addRole();
        } else if (selection === initChoices[5]){ //add new employee
          addEmployee();
        } else if (selection === initChoices[6]){ //update employee
          updateEmployee();
        }
      })
      .catch((error) => {
        console.log(error);
      })
  }


module.exports = trackerStart;