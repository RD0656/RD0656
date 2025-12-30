use [studentapractive]



/* You are building a Student Management System for a college where:
1] Admin can add a student
2] Admin can edit student details
3] Admin can delete a student
4] Admin can view all students
5] Admin can view a single student profile * */

CREATE TABLE students_master (
    student_id   INT IDENTITY(1,1) PRIMARY KEY,
    first_name   VARCHAR(50),
    last_name    VARCHAR(50),
    email        VARCHAR(100) UNIQUE,
    mobile       VARCHAR(15),
    course       VARCHAR(50),
    marks        INT,
    created_date DATETIME DEFAULT GETDATE()
);

CREATE TABLE student_audit_log (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT,
    action_type VARCHAR(10),   -- INSERT, UPDATE, DELETE
    old_data VARCHAR(MAX),
    new_data VARCHAR(MAX),
    changed_by VARCHAR(50),
    changed_date DATETIME DEFAULT GETDATE()
);


Alter PROCEDURE sp_student_master
    @Action     VARCHAR(10),   -- INSERT, UPDATE, DELETE, GETALL, GETBYID
    @UserRole   VARCHAR(10),   -- ADMIN / USER
    @UserName   VARCHAR(50),   -- Who is performing action

    @student_id INT = NULL,
    @first_name VARCHAR(50) = NULL,
    @last_name  VARCHAR(50) = NULL,
    @email      VARCHAR(100) = NULL,
    @mobile     VARCHAR(15) = NULL,
    @course     VARCHAR(50) = NULL,
    @marks      INT = NULL,

    -- ✅ Pagination Params (Used only for GETALL)
    @PageNumber INT = 1,
    @PageSize   INT = 5
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -----------------------------------
        -- ✅ ROLE VALIDATION
        -----------------------------------
        IF @Action IN ('INSERT','UPDATE','DELETE') AND @UserRole <> 'ADMIN'
        BEGIN
            RAISERROR('Only ADMIN can modify data',16,1);
            ROLLBACK;
            RETURN;
        END

        -----------------------------------
        -- ✅ INSERT
        -----------------------------------
        IF @Action = 'INSERT'
        BEGIN
            IF EXISTS (SELECT 1 FROM students_master WHERE email = @email)
            BEGIN
                RAISERROR('Email already exists',16,1);
                ROLLBACK;
                RETURN;
            END

            INSERT INTO students_master
            (first_name, last_name, email, mobile, course, marks)
            VALUES
            (@first_name, @last_name, @email, @mobile, @course, @marks);

            DECLARE @new_id INT = SCOPE_IDENTITY();

            INSERT INTO student_audit_log
            (student_id, action_type, new_data, changed_by)
            VALUES (
                @new_id, 'INSERT',
                CONCAT(@first_name,' ',@last_name,' | ',@email),
                @UserName
            );

            COMMIT;
            SELECT 'STUDENT INSERTED' AS Message;
        END

        -----------------------------------
        -- ✅ UPDATE
        -----------------------------------
        ELSE IF @Action = 'UPDATE'
        BEGIN
            DECLARE @old_data VARCHAR(MAX);

            SELECT @old_data =
                CONCAT(first_name,' ',last_name,' | ',email,' | ',course,' | ',marks)
            FROM students_master WHERE student_id = @student_id;

            UPDATE students_master
            SET first_name = @first_name,
                last_name  = @last_name,
                email      = @email,
                mobile     = @mobile,
                course     = @course,
                marks      = @marks
            WHERE student_id = @student_id;

            INSERT INTO student_audit_log
            (student_id, action_type, old_data, new_data, changed_by)
            VALUES (
                @student_id, 'UPDATE',
                @old_data,
                CONCAT(@first_name,' ',@last_name,' | ',@email),
                @UserName
            );

            COMMIT;
            SELECT 'STUDENT UPDATED' AS Message;
        END

        -----------------------------------
        -- ✅ DELETE
        -----------------------------------
        ELSE IF @Action = 'DELETE'
        BEGIN
            DECLARE @del_data VARCHAR(MAX);

            SELECT @del_data =
                CONCAT(first_name,' ',last_name,' | ',email)
            FROM students_master WHERE student_id = @student_id;

            DELETE FROM students_master
            WHERE student_id = @student_id;

            INSERT INTO student_audit_log (student_id, action_type, old_data, changed_by)
            VALUES ( @student_id, 'DELETE',  @del_data, @UserName);

            COMMIT;
            SELECT 'STUDENT DELETED' AS Message;
        END

        -----------------------------------
        -- ✅ GET ALL WITH PAGINATION
        -----------------------------------
        ELSE IF @Action = 'GETALL'
        BEGIN
            SELECT *
            FROM students_master
            ORDER BY student_id
            OFFSET (@PageNumber-1)*@PageSize ROWS
            FETCH NEXT @PageSize ROWS ONLY;

            COMMIT;
        END

        -----------------------------------
        -- ✅ GET BY ID
        -----------------------------------
        ELSE IF @Action = 'GETBYID'
        BEGIN
            SELECT * 
            FROM students_master
            WHERE student_id = @student_id;

            COMMIT;
        END

        ELSE
        BEGIN
            RAISERROR('INVALID ACTION PARAMETER',16,1);
            ROLLBACK;
        END
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 
            ERROR_NUMBER() AS ErrorNo,
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

exec sp_student_master
 @Action = 'insert',
    @UserRole  = 'ADMIN',
    @UserName  = 'RUSHABH' , -- Who is performing action

    @first_name = 'RAM',
    @last_name  ='SHARMA',
    @email     = 'ram@gmail.com',
    @mobile    = '8965985623',
    @course    = 'MATH', 
    @marks     = 95

    select * from students_master;

exec sp_student_master
 @Action = 'DELETE',
    @UserRole  = 'ADMIN',
    @UserName  = 'RUSHABH',

    @student_id=1

    select * from student_audit_log;
























