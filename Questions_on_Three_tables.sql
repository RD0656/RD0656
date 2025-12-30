/* Fetch all employees hired after 01-JAN-2020.

Get employees whose name starts with 'A'.

List departments where the dept_name contains 'IT'.

Show all active projects where project_status = 'ONGOING'.

Retrieve employees whose phone number is NULL.

Fetch all projects belonging to department ID 10.

Get employees whose email ends with 'gmail.com'.

Find projects whose name contains the word 'Road'.

Count employees working in each department.

Count number of projects under each department.

Find how many employees were hired per year.

Show number of employees for each starting letter of emp_name.

Get dept-wise count of ONGOING vs COMPLETED projects.

List employees ordered by hire_date (newest first).

Show departments ordered alphabetically.

Display projects ordered by project_status, then project_name.

Order employees by name length.

Order projects by department name and project status.

Display employee name with their department name.

Show all employees even if no department is assigned (LEFT JOIN).

Show all departments even if no employee exists (RIGHT JOIN).

Display department & project names using JOIN.

Show employee → department → project hierarchy in a single query.

Get employees who do not have any project assigned.

List departments with total number of projects using JOIN + GROUP BY.

Replace NULL phone numbers with 'Not Provided'.

Count employees whose email is NULL.

Display projects where department name is NULL.

Use NVL / COALESCE to replace missing dept_name.

Show employees whose hire_date is NULL.

Display employee name in uppercase.

Extract year from employee hire_date.

Show email username (before @ symbol).

Calculate employee tenure in years (SYSDATE - HIRE_DATE).

Find length of project_name.

Concatenate project_id and project_name.

Count total employees.

Get minimum and maximum hire dates.

Return first 3 letters of department name.

Convert dept_name to Title Case.

Show employees with row number ordered by hire_date.

Rank employees by hire_date within each department.

Show running total of number of employees hired (ordered by hire_date).

Display each department’s total project count using SUM OVER().

Show DENSE_RANK of projects by project_status.

Fetch latest hired employee in each department (using partition).

Show percentage of projects per department.

Get cumulative project count by department ID.

Show employees who belong to a department that has more than 2 projects.

Fetch employees whose hire_date is greater than the average hire_date.

List departments that have no projects.

Retrieve projects whose department has more employees than average.

Show the employee(s) with the earliest hire_date.

Create a procedure to insert an employee record.

Procedure to get all projects for a department.

Procedure to update project status to COMPLETED.

Procedure to delete an employee by emp_id.

Procedure to return department name for a given emp_id.

Bulk insert multiple employees using a stored procedure.

Procedure to return employee count per department.

Add a new column salary to employee101.

Modify email column to varchar2(100).

Drop the phone_no column.

Add NOT NULL constraint on hire_date.

Rename project101 table to projects_new.

Create an index on emp_name.

Create a unique constraint on project_name.

Add foreign key from project → employee.

Insert a new employee (sample data).

Update project_status to 'ON HOLD' for dept_id 5.

Delete employees hired before 2015.

Insert 5 departments in one query (multi-row insert).

Update department name using subquery.

Delete a department that has no employees.

Insert an employee → set SAVEPOINT → rollback partially.

Update project status and COMMIT.

Delete all projects, then ROLLBACK.

Perform multiple inserts and commit only selected operations.