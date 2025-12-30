alter PROCEDURE sp_insert_student_safe
    @p_first_name VARCHAR(50),
    @p_last_name  VARCHAR(50),
    @p_email      VARCHAR(100),
    @p_dob        DATE,
    @p_username   VARCHAR(50),
    @p_password   VARCHAR(100),
    @p_gender     VARCHAR(10),
    @p_course     VARCHAR(50),
    @p_student_id INT,
    @P_delete Int 
AS
BEGIN
   -- print 'start'
   IF EXISTS (SELECT 1 FROM students WHERE student_id = ISNULL(@p_student_id,0) AND @P_delete=0)
   BEGIN
   print 'updaet logic'
   update students 
    SET first_name = @p_first_name, last_name  = @p_last_name, dob        = @p_dob, username   = @p_username, password   = @p_password, gender     = @p_gender,course     = @p_course    
    where student_id=@p_student_id

     Print @p_first_name + ' Record Updated Successfully'
   END
   Else IF(@P_delete=1)
   BEGIN
   print 'delete logic'
    DElete from students where student_id=@p_student_id 
   END
   ELSE 
   BEGIN
   print 'insert logic'
    INSERT INTO students ( first_name, last_name, email, dob, username, password, gender, course)
    VALUES ( , @p_last_name, @p_email, @p_dob,  @p_username, @p_password, @p_gender, @p_course);
     Print @p_fir@p_first_namest_name + ' Record Insert Successfully'


   END
  
       select * from students   
 ---print 'END'
END;
GO

