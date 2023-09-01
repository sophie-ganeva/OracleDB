-------------------------------------------------------------------------------------------------------------Insert into TITLES
CREATE SEQUENCE PK_Titles_Sequence START WITH 1 INCREMENT BY 1;
--TITLES(Id,Name)
INSERT INTO Titles VALUES (PK_Titles_Sequence.NEXTVAL, 'Prof.');
INSERT INTO Titles VALUES (PK_Titles_Sequence.NEXTVAL, 'Assc.Prof.');
INSERT INTO Titles VALUES (PK_Titles_Sequence.NEXTVAL, 'PhD.');

-----------------------------------------------------------------------------------------------------------Insert into FACULTIES
CREATE SEQUENCE PK_Faculties_Sequence START WITH 1 INCREMENT BY 1;
--FACULTIES(Id, Name)
INSERT INTO Faculties VALUES (PK_Faculties_Sequence.NEXTVAL, 'Faculty of Electrical Engineering and Communication');

-------------------------------------------------------------------------------------------------------------Insert into DEGREES
CREATE SEQUENCE PK_Degrees_Sequence START WITH 1 INCREMENT BY 1;
--DEGREES(Id, Name, SemesterNumber)
INSERT INTO Degrees VALUES (PK_Degrees_Sequence.NEXTVAL,'Bachelor', 8);
INSERT INTO Degrees VALUES (PK_Degrees_Sequence.NEXTVAL,'Masters', 3);
INSERT INTO Degrees VALUES (PK_Degrees_Sequence.NEXTVAL,'PhD', 6);

---------------------------------------------------------------------------------------------------------------Insert into STATUS
CREATE SEQUENCE PK_Status_Sequence START WITH 1 INCREMENT BY 1;
INSERT INTO Status VALUES (PK_Status_Sequence.NEXTVAL,'active');
INSERT INTO Status VALUES (PK_Status_Sequence.NEXTVAL,'graduated');
INSERT INTO Status VALUES (PK_Status_Sequence.NEXTVAL,'dropped out');


---------------------------------------------------------------------------------------------------------------Insert into TYPES
CREATE SEQUENCE PK_Types_Sequence START WITH 1 INCREMENT BY 1;
INSERT INTO Types VALUES (PK_Types_Sequence.NEXTVAL,'social');
INSERT INTO Types VALUES (PK_Types_Sequence.NEXTVAL,'excellent grades' );

-----------------------------------------------------------------------------------------------------------Insert into SEMESTERS
CREATE SEQUENCE PK_Semesters_Sequence START WITH 1 INCREMENT BY 1;
--INSERT BY PROCEDURE

---------------------------------------------------------------------------------------------------------Insert into DEPARTMENTS
CREATE SEQUENCE PK_Departments_Sequence START WITH 1 INCREMENT BY 1;
INSERT INTO Departments VALUES (PK_Departments_Sequence.NEXTVAL, 'Electronics and Automation ', 1);
INSERT INTO Departments VALUES (PK_Departments_Sequence.NEXTVAL, 'Biomedical engineering', 1);


---------------------------------------------------------------------------------------------------------------Insert into MAJORS
CREATE SEQUENCE PK_Majors_Sequence START WITH 1 INCREMENT BY 1;
--MAJORS(Major_Id, Degee_Id, Name, Credits, Department_Id)
INSERT INTO Majors VALUES (PK_Majors_Sequence.NEXTVAL,1, 'Automation and Measurements',160, 1);
INSERT INTO Majors VALUES (PK_Majors_Sequence.NEXTVAL,1, 'Biomedical engineering', 160, 2);
INSERT INTO Majors VALUES (PK_Majors_Sequence.NEXTVAL,1, 'Information Technology', 160, 3);

INSERT INTO Majors VALUES (PK_Majors_Sequence.NEXTVAL,2, 'Microelectronics',100, 1);
INSERT INTO Majors VALUES (PK_Majors_Sequence.NEXTVAL,2, 'Biomedical engineering', 100, 2);
INSERT INTO Majors VALUES (PK_Majors_Sequence.NEXTVAL,2, 'Microelectronics',100, 1);
INSERT INTO Majors VALUES (PK_Majors_Sequence.NEXTVAL,2, 'Computer Graphics', 100, 3);

---------------------------------------------------------------------------------------------------------------Insert into COURSES
--CREATE SEQUENCE PK_Courses_Sequence START WITH 1 INCREMENT BY 1;
--FROM EXCEL

---------------------------------------------------------------------------------------------------------------Insert into PROJECTS
--FROM EXCEL

----------------------------------------------------------------------------------------------------------Insert into STUDENTS 
CREATE SEQUENCE PK_Students_Sequence START WITH 1 INCREMENT BY 1;
--FROM EXCEL

----------------------------------------------------------------------------------------------------------Insert into PROFESSORS
--CREATE SEQUENCE PK_Professors_Sequence START WITH 1 INCREMENT BY 1;
--FROM EXCEL


----------------------------------------------------------------------------------------------------Insert into COURSESINSTANCES 
CREATE SEQUENCE PK_CoursesInstances_Sequence START WITH 1 INCREMENT BY 1;
--COURSESINSTANCES(Id, Course_Id,Student_Id,Semester_Id)
--course 1 for the first semester
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,1,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,2,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,3,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,4,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,5,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,6,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,7,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,8,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,9,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,1,10,1);

--course 2 for the first semester
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,1,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,2,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,3,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,4,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,5,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,6,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,7,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,8,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,9,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,10,1);

INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,8,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,9,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,2,10,4);
--course 3 for the first semester
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,1,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,2,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,3,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,4,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,5,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,6,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,7,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,8,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,9,1);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,3,10,1);

--course 3 for the second semester
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,11,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,12,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,13,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,14,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,15,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,16,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,17,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,18,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,19,2);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,30,20,2);
--course 1 for the 8th semester
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,21,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,22,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,23,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,24,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,25,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,26,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,27,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,28,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,29,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,70,30,3);
--course 2 for the 8th semester
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,21,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,22,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,23,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,24,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,25,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,26,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,27,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,28,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,29,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,71,30,3);
--course 3 for the 8th semester
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,21,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,22,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,23,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,24,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,25,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,26,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,27,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,28,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,29,3);
INSERT INTO CoursesInstances VALUES (PK_CoursesInstances_Sequence.NEXTVAL,72,30,3);


--------------------------------------------------------------------------------------------------Insert into PROJECTS_INSTANCES
CREATE SEQUENCE PK_ProjectsInstances_Sequence START WITH 1  INCREMENT BY 1;

--PROJECTSINSTANCES(Id, Project_Id, CourseInstance_Id , ProfId, DueDate )
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,1,1,1,to_date('04/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,3,2,2,to_date('05/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,5,3,11,to_date('05/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,7,8,5,to_date('06/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,10,10,8,to_date('08/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,11,20,20,to_date('10/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,14,25,3,to_date('15/12/2020', 'dd/mm/yyyy'));

INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,15,50,1,to_date('17/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,4,62,48,to_date('15/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,18,33,31,to_date('18/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,6,45,to_date('20/12/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,21,58,to_date('08/01/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,14,7,21,to_date('10/01/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,7,20,13,to_date('15/01/2020', 'dd/mm/yyyy'));
INSERT INTO ProjectsInstances VALUES (PK_ProjectsInstances_Sequence.NEXTVAL,6,20,13,to_date('15/01/2020', 'dd/mm/yyyy'));

--------------------------------------------------------------------------------------------------------------Insert into EXAMS
CREATE SEQUENCE PK_Exams_Sequence START WITH 1  INCREMENT BY 1;

--EXAMS(Id, CourseInstanceId, Exam_Date, ProfId)
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,1,to_date('04/12/2020', 'dd/mm/yyyy'),1);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,2,to_date('05/12/2020', 'dd/mm/yyyy'),2);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,30,to_date('04/12/2020', 'dd/mm/yyyy'),11);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,70,to_date('05/12/2020', 'dd/mm/yyyy'),22);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,5,to_date('04/12/2020', 'dd/mm/yyyy'),13);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,6,to_date('05/12/2020', 'dd/mm/yyyy'),25);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,11,to_date('04/12/2020', 'dd/mm/yyyy'),16);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,28,to_date('05/12/2020', 'dd/mm/yyyy'),42);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,17,to_date('04/12/2020', 'dd/mm/yyyy'),31);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,25,to_date('05/12/2020', 'dd/mm/yyyy'),42);
INSERT INTO Exams VALUES (PK_Exams_Sequence.NEXTVAL,22,NULL,44);

--------------------------------------------------------------------------------------------------------Insert into EXAMS_GRADES
CREATE SEQUENCE PK_ExamsGrades_Sequence START WITH 1  INCREMENT BY 1;

--EXAMSGRADES(Id, Student_Id, ExamId, Grade)
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,1,1,6);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,2,2,5);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,3,3,4);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,30,1,3);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,15,2,2);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,17,3,5);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,4,4,4);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,5,5,6);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,6,6,2);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,31,4,3);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,16,5,6);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,19,6,5);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,7,7,6);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,8,8,4);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,9,9,5);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,10,10,5);
INSERT INTO ExamsGrades VALUES (PK_ExamsGrades_Sequence.NEXTVAL,11,11,6);

--------------------------------------------------------------------------------------------------------Insert into PROJECTSGRADES
--PROJECTSGRADES(Id, ProjInstanceId, Grade)
CREATE SEQUENCE PK_ProjectsGrades_Sequence START WITH 1  INCREMENT BY 1;

INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,1,1,4);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,2,2,5);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,3,3,4);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,30,1,3);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,15,2,2);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,17,3,2);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,4,4,4);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,5,5,4);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,6,6,5);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,31,4,2);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,16,5,6);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,19,6,6);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,7,7,6);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,8,8,4);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,9,9,5);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,10,10,3);
INSERT INTO ProjectsGrades VALUES (PK_ProjectsGrades_Sequence.NEXTVAL,11,11,2);

--------------------------------------------------------------------------------------------------------Insert into SCHOLARSHIP
--SCHOLARSHIP(Id, TypeId, PayDate, Amount)   
CREATE SEQUENCE PK_Scholarships_Sequence START WITH 1 INCREMENT BY 1;
INSERT INTO Scholarships VALUES (PK_Scholarships_Sequence.NEXTVAL,1,to_date('15/01/2020', 'dd/mm/yyyy'), 300);
INSERT INTO Scholarships VALUES (PK_Scholarships_Sequence.NEXTVAL,2,to_date('17/01/2020', 'dd/mm/yyyy'), 600.50);
INSERT INTO Scholarships VALUES (PK_Scholarships_Sequence.NEXTVAL,1,to_date('20/07/2020', 'dd/mm/yyyy'), 300);
INSERT INTO Scholarships VALUES (PK_Scholarships_Sequence.NEXTVAL,2,to_date('20/07/2020', 'dd/mm/yyyy'), 600.50);

--------------------------------------------------------------------------------------------------------Insert into SCHOLARSHIP
--SCHOLARSHIPS_STUDENTS(StudentId, ScholarshipId)
CREATE SEQUENCE PK_SchStud_Sequence START WITH 1 INCREMENT BY 1;

--USE TRIGER

----------------------------------------------------------------------------------------------------PROFESSORS_COURSESINSTANCES
--FROM EXCEL

CREATE SEQUENCE GraduatedStudents_Sequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE DropDownStudents_Sequence START WITH 1 INCREMENT BY 1;
