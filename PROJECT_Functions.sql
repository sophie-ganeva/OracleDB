--GetStudentIdPassingCourseIntance
--how to make that for all students -> return a list 
--make it more readable or in one column MANY ROWS   ?
CREATE OR REPLACE TYPE t_table IS TABLE OF NUMBER;
CREATE OR REPLACE FUNCTION GetStudentIdPassingCI(p_course_id NUMBER)
RETURN t_table 
AS
     student_ids t_table;
BEGIN
    SELECT EG.Student_Id
    BULK COLLECT INTO student_ids
    FROM ExamsGrades EG
    JOIN Exams E ON E.Exam_Id = EG.Exam_Id
    JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
    JOIN Courses C ON C.Course_Id = CI.Course_Id
    WHERE C.Course_id = p_course_id and EG.Grade > 3 ;
RETURN student_ids;
END;

SELECT GetStudentIdPassingCI(1) FROM DUAL;


--************** second way 
CREATE TYPE student IS OBJECT
(   id NUMBER,
    first_name VARCHAR(40),
    last_name VARCHAR(40)
);
CREATE TYPE student_data IS TABLE OF student;
CREATE OR REPLACE FUNCTION GetStudentDataPassingCI(p_course_id NUMBER)  -----------------------------------------ERROR-----?
RETURN student_data
IS
     st_data student_data;
BEGIN
    SELECT EG.Student_Id, S.First_name, S.Last_name
    BULK COLLECT INTO st_data
    FROM ExamsGrades EG
    JOIN Students S ON S.Student_Id = EG.Student_Id
    JOIN Exams E ON E.Exam_Id = EG.Exam_Id
    JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
    JOIN Courses C ON C.Course_Id = CI.Course_Id
    WHERE C.Course_id = p_course_id and EG.Grade >= 3 ;
RETURN st_data;
END;

SELECT GetStudentDataPassingCI(1) FROM DUAL;

--------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION GetExamGradeByStIdCourseId(p_student_id NUMBER, p_course_id NUMBER)
RETURN NUMBER
IS
    v_exam_id NUMBER;
    v_CourseInstance_Id NUMBER;
    v_exam_grade NUMBER;
BEGIN
    SELECT EG.Exam_Id, E.CourseInstance_Id, EG.Grade
    INTO v_exam_id, v_CourseInstance_Id, v_exam_grade
    FROM ExamsGrades EG
    JOIN Exams E ON E.Exam_Id = EG.Exam_Id
    JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
    JOIN Courses C ON C.Course_Id = CI.Course_Id
    WHERE EG.Student_Id = p_student_id and C.Course_id = p_course_id;  
RETURN v_exam_grade;
END;

SELECT GetExamGradeByStudentId(1,1) FROM DUAL;

--SELECT EG.Student_Id, EG.Exam_Id, E.CourseInstance_Id, EG.Grade
--FROM ExamsGrades EG
--JOIN Exams E ON E.Exam_Id = EG.Exam_Id
--JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
--JOIN Courses C ON C.Course_Id = CI.Course_Id
--WHERE EG.STUDENT_ID = 1 ;
--
--SELECT PG.Student_Id, PG.Grade, PI.ProjectInstance_Id, PG.ProjectGrade_ID
--FROM ProjectsGrades PG
--JOIN ProjectsInstances PI ON PI.ProjectInstance_Id = PG.ProjectInstance_Id
--JOIN CoursesInstances CI ON CI.CourseInstance_Id = PI.CourseInstance_Id
--JOIN Courses C ON C.Course_Id = CI.Course_Id;
-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION GetAvgExamGradeByStudentId(p_student_id NUMBER)
RETURN NUMBER
IS
    v_avg_exam_grade FLOAT;
BEGIN
    SELECT ROUND(AVG(Grade),2)
    INTO v_avg_exam_grade
    FROM ExamsGrades 
    WHERE Student_Id = p_student_id;
RETURN v_avg_exam_grade;
END;

SELECT GetAvgExamGradeByStudentId(1) FROM DUAL;

--SELECT Exam_Id, Grade
--FROM ExamsGrades 
--WHERE STUDENT_ID = 1 ;
-----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION GetpProjGradeByStIdProjectId(p_student_id NUMBER, p_project_id NUMBER)
RETURN NUMBER
IS
    v_project_grade NUMBER;
BEGIN

    SELECT PG.Grade
    INTO v_project_grade
    FROM ProjectsGrades PG
    JOIN ProjectsInstances PI ON PI.ProjectInstance_Id = PG.ProjectInstance_Id
    JOIN Projects P ON P.Project_Id = PI.Project_Id
    WHERE P.Project_Id = p_project_id AND PG.Student_Id = p_student_id;
RETURN v_project_grade;
END;

SELECT GetpProjGradeByStIdProjectId(20,10) FROM DUAL;


-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION GetAvgProjGradeByStudentId(p_student_id NUMBER)
RETURN NUMBER
IS
    v_avg_proj_grade FLOAT;
BEGIN
    SELECT ROUND(AVG(Grade),2)
    INTO v_avg_proj_grade
    FROM ProjectsGrades 
    WHERE Student_Id = p_student_id ;
RETURN v_avg_proj_grade;
END;

SELECT GetAvgProjGradeByStudentId(1) FROM DUAL;


--SELECT ProjectInstance_Id, Grade
--FROM ProjectsGrades 
--WHERE STUDENT_ID = 1 ;

-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION GetAvgProjGradeByStudentId(p_student_id NUMBER)
RETURN NUMBER
IS
    v_avg_proj_grade FLOAT;
BEGIN
    SELECT ROUND(AVG(Grade),2)
    INTO v_avg_proj_grade
    FROM ProjectsGrades 
    WHERE Student_Id = p_student_id ;
RETURN v_avg_proj_grade;
END;

SELECT GetAvgProjGradeByStudentId(1) FROM dual;

-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION GetAvgGradeByStudentId(p_student_id NUMBER)
RETURN NUMBER
IS
    v_avg_proj_grade FLOAT;
    v_avg_exam_grade FLOAT;
    v_total_grade FLOAT;
BEGIN
    v_avg_proj_grade := GetAvgProjGradeByStudentId(p_student_id);
    v_avg_exam_grade := GetAvgExamGradeByStudentId(p_student_id);
    v_total_grade := ROUND(((v_avg_proj_grade + v_avg_exam_grade) / 2),2);
     DBMS_OUTPUT.PUT_LINE(v_avg_proj_grade);
     DBMS_OUTPUT.PUT_LINE(v_avg_exam_grade);
     DBMS_OUTPUT.PUT_LINE(v_total_grade);
RETURN v_total_grade;
END;

-- (5.50 + 5) / 2 = 5.25
SELECT GetAvgGradeByStudentId(1) FROM DUAL;

-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION CalculateCreditsByStudentId(p_student_id NUMBER)
RETURN NUMBER
IS
    v_total_credits FLOAT;
    v_exams_credits FLOAT;
    v_project_credits FLOAT;
BEGIN
    SELECT SUM(ROUND((PG.Grade * C.Credits) / 6))
    INTO v_project_credits
    FROM ProjectsGrades PG
    JOIN ProjectsInstances PI ON PI.ProjectInstance_Id = PG.ProjectInstance_Id
    JOIN CoursesInstances CI ON CI.CourseInstance_Id = PI.CourseInstance_Id
    JOIN Courses C ON C.Course_Id = CI.Course_Id
    WHERE PG.student_id = p_student_id;

--calculate credits for a exams by student id
    SELECT SUM(ROUND((EG.Grade * C.Credits) / 6))
    INTO v_exams_credits
    FROM ExamsGrades EG
    JOIN Exams E ON E.Exam_Id = EG.Exam_Id
    JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
    JOIN Courses C ON C.Course_Id = CI.Course_Id
    WHERE EG.student_id = p_student_id;
    
    v_total_credits := v_exams_credits + v_project_credits;
    DBMS_OUTPUT.PUT_LINE(v_exams_credits);
    DBMS_OUTPUT.PUT_LINE(v_project_credits);
    DBMS_OUTPUT.PUT_LINE(v_total_credits);   
RETURN v_total_credits;
END;

SELECT CalculateCreditsByStudentId(1) FROM DUAL;


----calculate credits for a projects by student id
----id = 1 -> (6 + 4) = 10
--SELECT PG.Student_Id, PG.Grade, C.Credits,
--       ROUND((PG.Grade * C.Credits) / 6) AS "Gained Credits Projects"
--FROM ProjectsGrades PG
--JOIN ProjectsInstances PI ON PI.ProjectInstance_Id = PG.ProjectInstance_Id
--JOIN CoursesInstances CI ON CI.CourseInstance_Id = PI.CourseInstance_Id
--JOIN Courses C ON C.Course_Id = CI.Course_Id
--where PG.student_id = 1;
--
--SELECT COUNT(*)
--FROM ProjectsGrades
--WHERE STUDENT_ID = 1;
--
----calculate credits for a exams by student id
----id = 1 -> (6 + 3) = 9
--SELECT EG.Student_Id, EG.Grade, C.Credits,
--       ROUND((EG.Grade * C.Credits) / 6) AS "Gained Credits Exams",
--FROM ExamsGrades EG
--JOIN Exams E ON E.Exam_Id = EG.Exam_Id
--JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
--JOIN Courses C ON C.Course_Id = CI.Course_Id
--where EG.student_id = 1;
--
--SELECT SUM(ROUND((EG.Grade * C.Credits) / 6))
--FROM ExamsGrades EG
--JOIN Exams E ON E.Exam_Id = EG.Exam_Id
--JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
--JOIN Courses C ON C.Course_Id = CI.Course_Id
--where EG.student_id = 1;
--
--SELECT Exam_Id, Grade ,ROUND((Grade * Credits) / 6) AS "Gained Credits Exams"
--FROM ExamsGrades 
--WHERE STUDENT_ID = 1 ;

---------------------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------------------

--------------TEST-------------
--GetStudentIdPassingCourseIntance
--how to make that for all students -> return a list   ?????????????????????????????????????????????????
    SELECT EG.Student_Id, CI.CourseInstance_Id,E.Exam_Id
    FROM ExamsGrades EG
    JOIN Exams E ON E.Exam_Id = EG.Exam_Id
    JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
    JOIN Courses C ON C.Course_Id = CI.Course_Id
    WHERE C.Course_id = 1 and EG.Grade > 3 ;


--GetStudentIdPassingCourseIntance
    SELECT EG.Student_Id
    FROM ExamsGrades EG
    JOIN Exams E ON E.Exam_Id = EG.Exam_Id
    JOIN CoursesInstances CI ON CI.CourseInstance_Id = E.CourseInstance_Id
    JOIN Courses C ON C.Course_Id = CI.Course_Id
    WHERE E.CourseInstance_Id = 1 and EG.Grade > 3 ;
    
    
SELECT * FROM ProjectsGrades;
SELECT * FROM EXAMSGRADES;
SELECT * FROM EXAMS;
SELECT * FROM COURSESINSTANCES;
SELECT * FROM COURSES;
