-----------------------------------------------------------------------------------------------PROCEDURE Insert into FACULTIES
--FACULTIES(Id, Name)
CREATE OR REPLACE PROCEDURE InsertFaculty(
    p_Name Faculties.Name%TYPE
)
IS
    v_valid_faculty NUMBER;
BEGIN   
    SELECT COUNT(1)
    INTO v_valid_faculty
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM Faculties
        WHERE Name = p_Name
    );
    IF v_valid_faculty = 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid given parameter! The faculty already exists.');
    END IF;
    
    INSERT INTO Faculties
    VALUES (PK_Faculties_Sequence.NEXTVAL, p_Name);
END;

--Check if error occurs
EXECUTE InsertFaculty('Faculty of Electrical Engineering and Communication');
--Add new faculty
EXECUTE InsertFaculty('Faculty of Information Technology');

-------------------------------------------------------------------------------------------------PROCEDURE Insert into SEMESTERS
CREATE SEQUENCE PK_Semesters_Sequence START WITH 1 INCREMENT BY 1;

--Semesters(Id,Semester_Number,StartDate,EndDate)
CREATE OR REPLACE PROCEDURE InsertSemesters(
    p_Semester_Number Semesters.Semester_Number%TYPE,
    p_StartDate Semesters.StartDate%TYPE,
    p_EndDate Semesters.EndDate%TYPE
)
IS
BEGIN   
    IF p_StartDate > p_EndDate THEN
        RAISE_APPLICATION_ERROR(-20007, 'Invalid given parameters! The start date must be before the end date.');
    END IF;
        
    INSERT INTO Semesters
    VALUES (PK_Semesters_Sequence.NEXTVAL, p_Semester_Number, p_StartDate, p_EndDate);
END;

--InsertSemesters(Semester_Number,StartDate,EndDate)
EXECUTE InsertSemesters(1, TO_DATE('01/09/2020', 'dd/mm/yyyy'), TO_DATE('01/12/2020', 'dd/mm/yyyy'));
EXECUTE InsertSemesters(2, TO_DATE('01/02/2021', 'dd/mm/yyyy'), TO_DATE('01/06/2021', 'dd/mm/yyyy'));
EXECUTE InsertSemesters(3, TO_DATE('01/09/2020', 'dd/mm/yyyy'), TO_DATE('01/12/2020', 'dd/mm/yyyy'));
EXECUTE InsertSemesters(4, TO_DATE('01/02/2021', 'dd/mm/yyyy'), TO_DATE('01/06/2021', 'dd/mm/yyyy'));
EXECUTE InsertSemesters(5, TO_DATE('01/09/2020', 'dd/mm/yyyy'), TO_DATE('01/12/2020', 'dd/mm/yyyy'));
EXECUTE InsertSemesters(6, TO_DATE('01/02/2021', 'dd/mm/yyyy'), TO_DATE('01/06/2021', 'dd/mm/yyyy'));
EXECUTE InsertSemesters(7, TO_DATE('01/09/2020', 'dd/mm/yyyy'), TO_DATE('01/12/2020', 'dd/mm/yyyy'));
EXECUTE InsertSemesters(8, TO_DATE('01/02/2021', 'dd/mm/yyyy'), TO_DATE('01/06/2021', 'dd/mm/yyyy'));

-----------------------------------------------------------------------------------------------PROCEDURE Insert into DEPARTMENTS
CREATE OR REPLACE PROCEDURE InstertDepartment(
    p_Name Departments.Name%TYPE, 
    p_Faculty_Id Departments.Faculty_Id%TYPE
)
IS
    v_valid_department NUMBER;
    v_valid_facultyId NUMBER;
BEGIN   
    SELECT COUNT(1)
    INTO v_valid_department
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM Departments
        WHERE Name = p_Name
    );

    SELECT COUNT(*)
    INTO v_valid_facultyId
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM Faculties
        WHERE Faculty_Id = p_Faculty_Id
        );
     
    IF v_valid_department = 1 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid given parameter! The department already exists.');
    END IF;
    
    IF v_valid_facultyId = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Invalid given faculty Id! There is no such faculty.');
    END IF;
    
    INSERT INTO Departments
    VALUES (PK_Departments_Sequence.NEXTVAL, p_Name, p_Faculty_Id);
END;

---------------------------------------------------------------------------------------------------PROCEDURE Insert into MAJORS
--MAJORS(Major_Id, Degee_Id, Name, Credits, Department_Id)
CREATE OR REPLACE PROCEDURE InsertMajor(
    p_Degee_Id Majors.Degree_Id%TYPE,
    p_Name Majors.Name%TYPE,
    p_Credits Majors.Credits%TYPE,
    p_Department_Id Majors.Department_Id%TYPE
)
IS
    v_valid_depId NUMBER;
    v_valid_major_name NUMBER;
    v_valid_degree NUMBER;
BEGIN   
    
    SELECT COUNT(*)
    INTO v_valid_depId
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM Departments
        WHERE Department_Id = p_Department_Id
        ) ;
     
    SELECT COUNT(1)
    INTO v_valid_degree
    FROM Dual
        WHERE EXISTS (
        SELECT 1
        FROM Degrees
        WHERE Degree_Id = p_Degee_Id );
    
    SELECT COUNT(1)
    INTO v_valid_major_name
    FROM Dual
        WHERE EXISTS (
        SELECT 1
        FROM Majors
        WHERE Name = p_Name );
     
    IF p_Degee_Id > 3 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Invalid given degree Id!');
    END IF;
    
    IF v_valid_depId = 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'Invalid given department Id! There is no such department.');
    END IF;
    
    IF v_valid_major_name = 1 THEN
        RAISE_APPLICATION_ERROR(-20012, 'Invalid given major name! This major already exists.');
    END IF;
        
    INSERT INTO Majors
    VALUES (PK_Majors_Sequence.NEXTVAL,p_Degee_Id, p_Name, p_Credits, p_Department_Id);
END;


EXECUTE InsertMajor (2, 'Robotics',100, 2);
--error - ok
EXECUTE InsertMajor (2, 'Telecommunication',100, 3);

SELECT * FROM MAJORS;
--------------------------------------------------------------------------------------------------PROCEDURE Insert into STUDENTS 
--STUDENTS(Id, FirstName,LastName, Email, Birthdate, CurrentSemester, StatusId )
CREATE OR REPLACE PROCEDURE InsertStudent(
    p_FirstName Students.First_Name%TYPE,  
    p_LastName Students.Last_Name%TYPE, 
    p_Email Students.Email%TYPE,
    p_Birthdate IN DATE,
    p_CurrentSemester Students.CurrentSemester%TYPE,
    p_Status_Id Students.Status_Id%TYPE
)
IS
    v_valid_firstName NUMBER;
    v_valid_lastName NUMBER;
    v_valid_names NUMBER;
    v_valid_email NUMBER;
    v_valid_status_id NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_valid_names
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM Students
        WHERE REGEXP_LIKE(p_FirstName, '[0-9]+') OR  REGEXP_LIKE(p_LastName, '[0-9]+')
        );

--    SELECT COUNT(*)
--    INTO v_valid_firstName
--    FROM Dual
--    WHERE EXISTS (
--        SELECT 1
--        FROM Students
--        WHERE REGEXP_LIKE(p_FirstName, '[0-9]+')
--        );
--    
--    SELECT COUNT(*)
--    INTO v_valid_lastName
--    FROM Dual
--    WHERE EXISTS (
--        SELECT 1
--        FROM Students
--        WHERE REGEXP_LIKE(p_LastName, '[0-9]+')
--        );
        
    SELECT COUNT(*)
    INTO v_valid_email
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM Students
        WHERE REGEXP_LIKE(email, '^(\S+)\.(\S+)\@(\S+)\.(\S+)$')    
        );
    
    IF v_valid_names = 1  THEN
        RAISE_APPLICATION_ERROR(-20008, 'Invalid given First or Last Name! Names do not contain digits.');
    END IF;
   
    IF v_valid_email = 0  THEN
        RAISE_APPLICATION_ERROR(-20009, 'Invalid email format!. The format is xxx.xxx@xxx.xxx');
    END IF;
    
    IF v_valid_status_id > 3  THEN
        RAISE_APPLICATION_ERROR(-20010, 'Invalid given status Id!.');
    END IF;
    
    INSERT INTO Students
    VALUES (PK_Students_Sequence.NEXTVAL, p_FirstName, p_LastName, p_Email, p_Birthdate, p_CurrentSemester, p_Status_Id);
END;
-------------------------------------------------------???????????????????????????????????????????????????????????????????????????
--InsertStudent(FirstName,LastName, Email, Birthdate, CurrentSemester, StatusId )
EXECUTE InsertStudent('Ivanko', 'Peekroov', 'Ivan.Petrovo.ui.com', TO_DATE('01/apr/1990', 'dd-mon-yyyy'),6,1);  --error e-mail  ???
EXECUTE InsertStudent('Ivan564', 'Petrov', 'Ivan.Petrov@ola.com', TO_DATE('01/04/1990', 'dd/mm/yyyy'),5,1);   --error name      ???
EXECUTE InsertStudent('Iva','Di678trov', 'Petova', 'Ivan.etrov.*com', TO_DATE('03/04/1990', 'dd/mm/yyyy'),1,1); --error name    ???


--------------------------------------------------------------------------------------------------PROCEDURE Delete from STUDENTS
CREATE OR REPLACE PROCEDURE DeleteStudentById(
    p_student_id Students.Student_Id%TYPE
)
IS
    v_valid_student NUMBER;
BEGIN
    SELECT COUNT(1)
    INTO v_valid_student
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM Students
        WHERE Student_Id = p_student_id
    );
    
    IF v_valid_student = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid given parameter! Student Id is not found.');
    END IF;

    DELETE
    FROM Scholarships_Students
    WHERE Student_Id = p_student_id;
    
    DELETE 
    FROM ExamsGrades
    WHERE Student_Id = p_student_id;
    
    DELETE 
    FROM ProjectsGrades
    WHERE Student_Id = p_student_id;
    
    DELETE 
    FROM CoursesInstances
    WHERE Student_Id = p_student_id;
    
    DELETE 
    FROM Students
    WHERE Student_Id = p_student_id;
    
END;

------------------------------------------------------------------------------------------PROCEDURE Insert into COURSESINSTANCES ??????????
--COURSESINSTANCES(Id, Course_Id,Student_Id,Semester_Id)
CREATE OR REPLACE PROCEDURE InsertCourseInstance(
    p_CourseId CoursesInstances.Course_Id%TYPE, 
    p_StudentId CoursesInstances.Student_Id%TYPE, 
    p_SemesterId CoursesInstances.Semester_Id%TYPE 
)
IS
    v_ifExamIsPassed NUMBER;
    v_grade NUMBER;
    v_validCourse NUMBER;
    v_courseId NUMBER;
    v_valid_student NUMBER;
    v_student_id NUMBER;
BEGIN
    v_courseId := NULL;
    v_student_id := NULL;
    
    SELECT c.Course_Id, eg.Student_Id, eg.Grade
    INTO v_student_id, v_courseId, v_grade
    FROM CoursesInstances ci
    JOIN Courses c ON c.Course_Id = ci.Course_Id
    JOIN Exams e ON e.CourseInstance_Id = ci.CourseInstance_Id
    JOIN ExamsGrades eg ON eg.Exam_Id = e.Exam_Id;
    
    IF v_ifExamIsPassed >= 3 THEN
        v_ifExamIsPassed := 1;
    END IF;
    
    IF v_student_id IS NOT NULL THEN
        v_valid_student := 1;
    END IF;
        
    IF v_courseId IS NOT NULL THEN
        v_validCourse := 1;
    END IF;
    
    IF v_ifExamIsPassed = 1 AND v_valid_student != 0 AND v_validCourse != 0 THEN
        RAISE_APPLICATION_ERROR(-20013, 'Invalid given parameterS! The student had passed this course.');
    END IF;
        
    INSERT INTO CoursesInstances
    VALUES (PK_CoursesInstances_Sequence.NEXTVAL, p_CourseId, p_StudentId, p_SemesterId);
END;

--InsertCourseInstance(Course_Id,Student_Id,Semester_Id)
--must be accepted, the student had failed the course  ??????????????????????????????????
EXECUTE InsertCourseInstance(1,15,4);
--must be invalid because this student have passed the exam  ?????????????????????
EXECUTE InsertCourseInstance(3,8,2);

SELECT * FROM CoursesInstances
WHERE STUDENT_ID = 1;

SELECT ci.CourseInstance_Id,c.Course_Id, eg.Student_Id, eg.Grade
FROM CoursesInstances ci
JOIN Courses c ON c.Course_Id = ci.Course_Id
JOIN Exams e ON e.CourseInstance_Id = ci.CourseInstance_Id
JOIN ExamsGrades eg ON eg.Exam_Id = e.Exam_Id;
----------------------------------------------------------------------------------------------PROCEDURE Insert into EXAMSGRADES - OK
--EXAMSGRADES(Id, Student_Id, ExamId, Grade)
CREATE OR REPLACE PROCEDURE InsertExamGrade(
    p_Student_Id ExamsGrades.Student_Id%TYPE, 
    p_ExamId ExamsGrades.Exam_Id%TYPE, 
    p_Grade ExamsGrades.Grade%TYPE 
)
IS
    v_valid_studentForExam NUMBER;
    v_student_ifPassExam NUMBER;
BEGIN  
    SELECT COUNT(1)
    INTO v_valid_studentForExam
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM ExamsGrades
        WHERE Student_Id = p_Student_Id
        );
    SELECT Grade
    INTO v_student_ifPassExam
    FROM ExamsGrades
    WHERE Student_Id = p_Student_Id;
    
    IF v_student_ifPassExam > 2  AND v_valid_studentForExam = 1 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Invalid given student Id and exam Id!. The student have already passed the exam.');
    END IF;
    
    INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,p_Student_Id,p_ExamId,p_Grade);
END;

EXECUTE InsertExamGrade(1,3,4);
EXECUTE InsertExamGrade(20,1,4);
EXECUTE InsertExamGrade(31,1,4);
--error
EXECUTE InsertExamGrade(5,5,4);

--    SELECT *
--    FROM ExamsGrades
--    WHERE Student_Id = 5; 
--    
--    5,5,2 -> error

    SELECT COUNT(1)
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM ExamsGrades
        WHERE Student_Id = 5);
        
----------------------------------------------------------------------------------------------PROCEDURE Insert into PROJECTGRADES - ok
--EXAMSGRADES(Id, Student_Id, ExamId, Grade)
CREATE OR REPLACE PROCEDURE InsertProjectGrade(
    p_Student_Id ProjectsGrades.Student_Id%TYPE, 
    p_ProjectInstance_Id ProjectsGrades.ProjectInstance_Id%TYPE, 
    p_Grade ProjectsGrades.Grade%TYPE 
)
IS
    v_valid_studentForProj NUMBER;
    v_student_ifPassProj NUMBER;
BEGIN  
    SELECT COUNT(1)
    INTO v_valid_studentForProj
    FROM Dual
    WHERE EXISTS (
        SELECT 1
        FROM ExamsGrades
        WHERE Student_Id = p_Student_Id
        );
    SELECT Grade
    INTO v_student_ifPassProj
    FROM ExamsGrades
    WHERE Student_Id = p_Student_Id;
    
    IF v_student_ifPassProj >= 3  AND v_valid_studentForProj = 1 THEN
        RAISE_APPLICATION_ERROR(-20012, 'Invalid given student Id and project Id!. The student have already passed the project.');
    END IF;
    INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,p_Student_Id, p_ProjectInstance_Id, p_Grade);
END;
--cann not insert 2nd time same project instance for the same student if his grade > 3  - ok
EXECUTE InsertProjectGrade(2,2,4);
EXECUTE InsertProjectGrade(20,1,4);
EXECUTE InsertProjectGrade(31,1,4);

--DELETE 
--FROM ProjectsGrades
--WHERE ProjectGrade_iD = 35
--
--SELECT * FROM ProjectsGrades

