----------------------------------------------------------1. TITLES----------------------------------------------------------1
--TITLES(Id,Name)
CREATE TABLE Titles(
    Title_Id NUMBER NOT NULL,
    Name VARCHAR2(30) NOT NULL,

    CONSTRAINT PK_Titles
    PRIMARY KEY (Title_Id)
);

----------------------------------------------------2. FACULTIES--------------------------------------------------------------2
--FACULTIES(Id, Name)
CREATE TABLE Faculties(
    Faculty_Id NUMBER NOT NULL,
    Name VARCHAR2(100) NOT NULL,
    
    CONSTRAINT PK_Faculties
    PRIMARY KEY (Faculty_Id)
);

----------------------------------------------------3. DEGREES--------------------------------------------------------------- 3
--DEGREES(Id, Name, SemesterNumber)
CREATE TABLE Degrees(
    Degree_Id NUMBER NOT NULL,
    Name VARCHAR2(30) NOT NULL,
    SemestersNumber NUMBER NOT NULL,
    
    CONSTRAINT PK_Degrees
    PRIMARY KEY (Degree_Id)
);

----------------------------------------------------4. STATUS--------------------------------------------------------------- 4
--STATUS(Id,Name)
CREATE TABLE Status(
    Status_Id NUMBER NOT NULL,
    Name VARCHAR2(30) NOT NULL,
  
    CONSTRAINT PK_Status
    PRIMARY KEY (Status_Id)
);

----------------------------------------------------5. TYPES---------------------------------------------------------------- 5
--TYPES(Id, Name)
CREATE TABLE Types(
    Type_Id NUMBER NOT NULL,
    Name VARCHAR2(30) NOT NULL,
  
    CONSTRAINT PK_Types
    PRIMARY KEY (Type_Id)
);

--------------------------------------------------6. SEMESTERS------------------------------------------------------------- 6
--Semesters(Id,Sem_Number,StartDate,EndDate)
CREATE TABLE Semesters(
    Semester_Id NUMBER NOT NULL,
    Semester_Number NUMBER NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,

    CONSTRAINT PK_Semesters
    PRIMARY KEY (Semester_Id)
);


----------------------------------------------------7. DEPARTMENTS---------------------------------------------------------- 7
--DEPARTMENTS(Id, Name, FacultyId)
CREATE TABLE Departments(
    Department_Id NUMBER NOT NULL,
    Name VARCHAR2(60) NOT NULL,
    Faculty_Id NUMBER NOT NULL,
    
    CONSTRAINT PK_Departments
    PRIMARY KEY (Department_Id)
);

ALTER TABLE Departments
ADD CONSTRAINT FK_Departments_Faculties FOREIGN KEY (Faculty_Id)
REFERENCES Faculties(Faculty_Id) ENABLE;


---------------------------------------------------8. MAJORS---------------------------------------------------------------- 8
--MAJORS(Major_Id,DegeeId, Name, Credits, Department_Id)
CREATE TABLE Majors(
    Major_Id NUMBER NOT NULL,
    Degree_Id NUMBER NOT NULL,
    Name VARCHAR2(50) NOT NULL,
    Credits NUMBER NOT NULL,
    Department_Id NUMBER NOT NULL,

    CONSTRAINT PK_Majors
    PRIMARY KEY (Major_Id, Degree_Id)
);

ALTER TABLE Majors
ADD CONSTRAINT FK_Majors_Degree FOREIGN KEY (Degree_Id)
REFERENCES Degrees(Degree_Id) ENABLE;

ALTER TABLE Majors
ADD CONSTRAINT FK_Majors_Departments FOREIGN KEY (Department_Id)
REFERENCES Departments(Department_Id) ENABLE;

-------------------------------------------------9 COURSES---------------------------------------------------------------- 9
--COURSES(Id,Name,Credits, Major_Id)
CREATE TABLE Courses(
    Course_Id NUMBER NOT NULL,
    Name VARCHAR2(50) NOT NULL,
    Credits NUMBER NOT NULL,
    Major_Id NUMBER NOT NULL,

    CONSTRAINT PK_Courses
    PRIMARY KEY (Course_Id)
);

ALTER TABLE Courses
ADD CONSTRAINT FK_Courses_Majors FOREIGN KEY (Major_Id)
REFERENCES Majors(Major_Id) ENABLE;


-------------------------------------------------10 PROJECT---------------------------------------------------------------- 10

--PROJECTS(Id, Name, Credits, Major_Id )
CREATE TABLE Projects(
    Project_Id NUMBER NOT NULL,
    Name VARCHAR2(50) NOT NULL,
    Credits NUMBER NOT NULL,
    Major_Id NUMBER NOT NULL,
    
    CONSTRAINT PK_Projects
    PRIMARY KEY (Project_Id)
);

--------------------------------------------------------???????????????????????????????????????????/--ERROR
ALTER TABLE Projects
ADD CONSTRAINT FK_Projects_Majors FOREIGN KEY (Major_Id)
REFERENCES Majors(Major_Id) ENABLE;


-------------------------------------------------11 STUDENTS---------------------------------------------------------------- 11

--STUDENTS(Id, FirstName,LastName, Email, Birthdate, CurrentSemester, StatusId )
CREATE TABLE Students(
    Student_Id NUMBER NOT NULL,
    First_Name VARCHAR2(30) NOT NULL,
    Last_Name VARCHAR2(30) NOT NULL,
    Email VARCHAR2(30) NOT NULL,
    Birthdate DATE NOT NULL,
    CurrentSemester NUMBER, 
    Status_Id NUMBER NOT NULL,
    
    CONSTRAINT PK_Students
    PRIMARY KEY (Student_Id)
);

ALTER TABLE Students
ADD CONSTRAINT FK_Students_Status FOREIGN KEY (Status_Id)
REFERENCES Status(Status_Id) ENABLE;


--------------------------------------------------12 PROFESSORS------------------------------------------------------------ 12
--Professors(Prof_Id, First_Name, Last_Name , Email ,Title_Id, Department_Id)
CREATE TABLE Professors(
    Prof_Id NUMBER NOT NULL,
    First_Name VARCHAR2(30) NOT NULL,
    Last_Name VARCHAR2(30) NOT NULL,
    Email VARCHAR2(30),
    Title_Id NUMBER NOT NULL,
    Department_Id NUMBER NOT NULL,

    CONSTRAINT PK_Professors
    PRIMARY KEY (Prof_Id)
);

ALTER TABLE Professors
ADD CONSTRAINT FK_Professors_Titles FOREIGN KEY (Title_Id)
REFERENCES Titles(Title_Id) ENABLE;

ALTER TABLE Professors
ADD CONSTRAINT FK_Professors_Departments FOREIGN KEY (Department_Id)
REFERENCES Departments(Department_Id) ENABLE;

-------------------------------------------------13 COURSESINSTANCES------------------------------------------------------- 13
--COURSESINSTANCES(Id, Course_Id,Student_Id,Semester_Id)
CREATE TABLE CoursesInstances(
    CourseInstance_Id NUMBER NOT NULL,
    Course_Id NUMBER NOT NULL,
    Student_Id  NUMBER NOT NULL,
    Semester_Id NUMBER NOT NULL,

    CONSTRAINT PK_CoursesInstances
    PRIMARY KEY (CourseInstance_Id)
);
ALTER TABLE CoursesInstances
ADD CONSTRAINT FK_CoursesInstances_Courses FOREIGN KEY (Course_Id)
REFERENCES Courses(Course_Id) ENABLE;

ALTER TABLE CoursesInstances
ADD CONSTRAINT FK_CoursesInstances_Semesters FOREIGN KEY (Semester_Id)
REFERENCES Semesters(Semester_Id) ENABLE;

------------------------------------------------14. PROJECTSINSTANCES---------------------------------------------------------14
--PROJECTSINSTANCES(Id, CourseInstance_Id , ProfId, DueDate )
CREATE TABLE ProjectsInstances(
    ProjectInstance_Id NUMBER NOT NULL,
    Project_Id NUMBER NOT NULL,
    CourseInstance_Id NUMBER NOT NULL,
    Prof_Id NUMBER NOT NULL,
    DueDate DATE NOT NULL,
    
    CONSTRAINT PK_ProjectsInstances
    PRIMARY KEY (ProjectInstance_Id)
);

ALTER TABLE ProjectsInstances
ADD CONSTRAINT FK_PI_CI FOREIGN KEY (CourseInstance_Id)
REFERENCES CoursesInstances(CourseInstance_Id) ENABLE;

ALTER TABLE ProjectsInstances
ADD CONSTRAINT FK_PI_Professors FOREIGN KEY (Prof_Id)
REFERENCES Professors(Prof_Id) ENABLE;

ALTER TABLE ProjectsInstances
ADD CONSTRAINT FK_PI_Projects FOREIGN KEY (Project_Id)
REFERENCES Projects(Project_Id) ENABLE;


--------------------------------------------------15 EXAMS------------------------------------------------------------------- 15
--EXAMS(Id, CourseInstanceId, Exam_Date, ProfId)
CREATE TABLE Exams(
    Exam_Id NUMBER NOT NULL,
    CourseInstance_Id NUMBER NOT NULL,
    Exam_Date DATE,
    Prof_Id NUMBER NOT NULL,

    CONSTRAINT PK_Exams
    PRIMARY KEY (Exam_Id)
);

ALTER TABLE Exams
ADD CONSTRAINT FK_Exams_CoursesInstances FOREIGN KEY (CourseInstance_Id)
REFERENCES CoursesInstances(CourseInstance_Id) ENABLE;

ALTER TABLE Exams
ADD CONSTRAINT FK_Exams_Professors FOREIGN KEY (Prof_Id)
REFERENCES Professors(Prof_Id) ENABLE;

-------------------------------------------------16 EXAMS_GRADES------------------------------------------------------------- 16
--EXAMSGRADES(Id, Student_Id, ExamId, Grade)
CREATE TABLE ExamsGrades(
    ExamGrade_Id NUMBER NOT NULL,
    Student_Id NUMBER NOT NULL,
    Exam_Id NUMBER NOT NULL,
    Grade NUMBER,
    --Gained_Credits FLOAT,
    
    CONSTRAINT PK_ExamsGrades
    PRIMARY KEY (ExamGrade_Id)
);

ALTER TABLE ExamsGrades
ADD CONSTRAINT FK_ExamsGrades_Students FOREIGN KEY (Student_Id)
REFERENCES Students(Student_Id) ENABLE;

ALTER TABLE ExamsGrades
ADD CONSTRAINT FK_ExamsGrades_Exams FOREIGN KEY (Exam_Id)
REFERENCES Exams(Exam_Id) ENABLE;


-----------------------------------------------17. PROJECTSGRADES------------------------------------------------------------17
--PROJECTSGRADES(Id, Student_Id, ProjInstanceId, Grade)
CREATE TABLE ProjectsGrades(
    ProjectGrade_Id NUMBER NOT NULL,
    Student_Id NUMBER NOT NULL,
    ProjectInstance_Id NUMBER NOT NULL,
    Grade NUMBER,
    --Gained_Credits FLOAT NOT NULL,
    
    CONSTRAINT PK_ProjectsGrades
    PRIMARY KEY (ProjectGrade_Id)
);
ALTER TABLE ProjectsGrades
ADD CONSTRAINT FK_ExamsGrades_Students FOREIGN KEY (Student_Id)
REFERENCES Students(Student_Id) ENABLE;

ALTER TABLE ProjectsGrades
ADD CONSTRAINT FK_PG_PI FOREIGN KEY (ProjectInstance_Id)
REFERENCES ProjectsInstances(ProjectInstance_Id) ENABLE;

----------------------------------------------- 18 SCHOLARSHIPS-------------------------------------------------------------- 18
--SCHOLARSHIP(Id, TypeId, PayDate, Amount)   
CREATE TABLE Scholarships(
    
    Scholarship_Id NUMBER NOT NULL,
    Type_Id NUMBER NOT NULL,
    PayDate DATE,
    Amount FLOAT,
  
    CONSTRAINT PK_Scholarship
    PRIMARY KEY (Scholarship_Id)
);

ALTER TABLE Scholarships
ADD CONSTRAINT FK_Scholarships_Types FOREIGN KEY (Type_Id)
REFERENCES Types(Type_Id) ENABLE;

----------------------------------------------- 19 SCHOLARSHIPS_STUDENTS---------------------------------------------------- 19
--TYPES(StudentId, ScholarshipId, Type)
CREATE TABLE Scholarships_Students(
    Student_Id NUMBER NOT NULL,
    Scholarship_Id NUMBER NOT NULL,

    CONSTRAINT PK_Scholarships_Students
    PRIMARY KEY (Student_Id,Scholarship_Id)
);

ALTER TABLE Scholarships_Students
ADD CONSTRAINT FK_SchStud_Students FOREIGN KEY (Student_Id)
REFERENCES Students(Student_Id) ENABLE;

ALTER TABLE Scholarships_Students
ADD CONSTRAINT FK_SchStud_Schol FOREIGN KEY (Scholarship_Id)
REFERENCES Scholarships(Scholarship_Id) ENABLE;

-------------------------------------------------20 PROFESSORS_COURSESINSTANCES----------------------------------------------20
--Professors/CoursesInstances((Prof_Id,CourseInstance_Id)) 
CREATE TABLE Professors_CoursesInstances(
    Prof_Id NUMBER NOT NULL,
    CourseInstance_Id NUMBER NOT NULL,
    
    CONSTRAINT PK_Departments_Degrees
    PRIMARY KEY (Prof_Id,CourseInstance_Id)
);

ALTER TABLE Professors_CoursesInstances
ADD CONSTRAINT FK_PCI_Professors FOREIGN KEY (Prof_Id)
REFERENCES Professors(Prof_Id) ENABLE;

ALTER TABLE Professors_CoursesInstances
ADD CONSTRAINT FK_PCI_CI FOREIGN KEY (CourseInstance_Id)
REFERENCES CoursesInstances(CourseInstance_Id) ENABLE;

-------------------------------------------------20 GRADUATED_STUDENTS----------------------------------------------20

CREATE TABLE GraduatedStudents(
    GradStudent_Id NUMBER NOT NULL,
    First_Name VARCHAR2(40) NOT NULL,
    Last_Name VARCHAR2(40) NOT NULL,
    Diploma_Num NUMBER,
    GradDate DATE,
    
    CONSTRAINT PK_GradStudents
    PRIMARY KEY (GradStudent_Id)
);


CREATE TABLE DroppedDownStudents(
    DDStudent_Id NUMBER NOT NULL,
    First_Name VARCHAR2(40) NOT NULL,
    Last_Name VARCHAR2(40) NOT NULL,
    EndDate DATE,
    
    CONSTRAINT PK_DDStudents
    PRIMARY KEY (DDStudent_Id)
);

