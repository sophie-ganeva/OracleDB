-- Which majors are in which department
SELECT d.name AS "Department" , m.name AS "Major"
FROM Majors m
JOIN Departments d ON d.department_id = m.department_id
ORDER BY d.Name;

--how many students are in one course 
SELECT c.Name, COUNT(Student_Id)
FROM CoursesInstances ci
JOIN Courses c ON c.Course_id = ci.Course_id
GROUP BY c.Name;

--how many students are in 1st semester
SELECT COUNT(*)
FROM Students 
WHERE CurrentSemester = 1;

--course name lead by prof 
SELECT ci.CourseInstance_Id,c.Name, p.First_name || ' ' || p.Last_Name AS "Prof Name"
FROM Professors_CoursesInstances pci
JOIN Professors p ON p.Prof_id = pci.Prof_id
JOIN CoursesInstances ci ON ci.CourseInstance_Id = pci.CourseInstance_Id
JOIN Courses c ON c.Course_Id = ci.Course_Id
ORDER BY ci.CourseInstance_Id;

--course instance - exam dates - students
SELECT ci.CourseInstance_Id , e.Exam_Date, ci.Student_Id
FROM EXAMS e
JOIN CoursesInstances ci ON ci.CourseInstance_Id = e.CourseInstance_Id
WHERE e.Exam_Date IS NOT NULL;

--which courses which sudents have passed
SELECT ci.CourseInstance_Id, C.Name AS "Course", ci.Student_Id
FROM Exams e
JOIN ExamsGrades eg ON eg.Exam_Id = e.Exam_Id
JOIN CoursesInstances ci ON ci.CourseInstance_Id = e.CourseInstance_Id
JOIN Courses c ON c.Course_Id = ci.Course_Id
WHERE eg.Grade >= 3;

--which exams the sudent have failed
SELECT ci.CourseInstance_Id, C.Name AS "Course", ci.Student_Id
FROM Exams e
JOIN ExamsGrades eg ON eg.Exam_Id = e.Exam_Id
JOIN CoursesInstances ci ON ci.CourseInstance_Id = e.CourseInstance_Id
JOIN Courses c ON c.Course_Id = ci.Course_Id
WHERE eg.Grade = 2;

--Which courses the student takes with student_id = 1
SELECT  s.First_name || ' ' || s.Last_Name AS "Students Name",
    c.Name AS "Course Name"
FROM Students s
JOIN CoursesInstances ci ON ci.Student_id = s.Student_id
JOIN Courses c ON c.Course_Id = ci.Course_Id
WHERE s.Student_id = 1;

--to which projects the student is assigned to and the project due date
SELECT ci.Student_Id, p.Name, pi.DueDate
FROM CoursesInstances ci
JOIN ProjectsInstances pi ON pi.CourseInstance_Id = ci.CourseInstance_Id
JOIN Projects p ON p.Project_Id = pi.Project_Id;


--how many course instances prof with id = 7 is leading
SELECT COUNT(*)
FROM Professors_CoursesInstances
WHERE prof_id = 7;

--which exams which prof are leading
SELECT p.First_name || ' ' || p.Last_Name AS "Prof Name", pci.CourseInstance_Id, e.Exam_Id, e.Exam_Date
FROM Professors_CoursesInstances pci
JOIN Exams e ON e.CourseInstance_Id = pci.CourseInstance_Id
JOIN Professors p ON p.Prof_Id = pci.Prof_Id;

--how many assoc. prof there are in Biomed.Departments
SELECT First_name || ' ' || Last_Name AS "Prof Name", department_id
FROM Professors 
WHERE title_id = 
    ( 
        SELECT title_id
        FROM Titles
        WHERE Name = 'Assc.Prof.'
    )
ORDER BY department_id;

--how many assoc. prof there are in each Departments  -----------------------------ERROR ??????????????????????????????
SELECT p.First_name || ' ' || p.Last_Name AS "Prof_Name", COUNT(*)
FROM Professors p
JOIN Departments d ON d.department_id = p.department_id
WHERE p.title_id = 2
GROUP BY "Prof_Name";

SELECT d.Name, count(*)
FROM departments d
JOIN Professors p ON d.department_id = p.department_id;


select * from students;
select * from majors;
select * from coursesinstances;
select * from exams;
SELECT * FROM ExamsGrades;
SELECT * FROM Courses;
select * from Professors_CoursesInstances;
select * from departments;
SELECT * FROM TITLES;;