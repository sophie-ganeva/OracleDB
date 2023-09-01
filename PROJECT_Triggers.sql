--Generade random number for the dimploma number
SELECT DISTINCT ROUND(DBMS_RANDOM.VALUE(1000,99999999999999)) FROM DUAL;

CREATE OR REPLACE FUNCTION GenerateRandNum
RETURN NUMBER
IS
    v_random_num NUMBER;
BEGIN
    SELECT DISTINCT ROUND(DBMS_RANDOM.VALUE(1000,99999999999999)) 
    INTO v_random_num
    FROM DUAL;
    DBMS_OUTPUT.PUT_LINE(v_random_num);
RETURN v_random_num;
END;

SELECT GenerateRandNum FROM DUAL;
------------------------------------------------------------------------------------------------------------------------
--Move students who have graduated in another table. The new table is having students name, diploma number, graduation date
SELECT * 
FROM STUDENTS
WHERE STATUS_ID = 2;

SELECT * FROM GraduatedStudents;

CREATE OR REPLACE TRIGGER BeforeDeleteOnStudentStatus2
BEFORE DELETE ON Students
FOR EACH ROW
BEGIN  
--    v_random_num NUMBER;
--    v_random_num = GenerateRandNum();
    IF :OLD.Status_Id = 2 THEN
        INSERT INTO GraduatedStudents (GradStudent_Id, First_Name, Last_Name, Diploma_Num, GradDate)
        VALUES (GraduatedStudents_Sequence.NEXTVAL, :OLD.First_Name, :OLD.Last_Name, GenerateRandNum(), SYSDATE);
    END IF;
     DBMS_OUTPUT.PUT_LINE('The student has graduated. The data is moved to GraduatedStudents table!');
END;


EXECUTE DeleteStudentById(106);

------------------------------------------------------------------------------------------------------------------------
--Move students whio have dropped down their studies in another table. The new table is having the student name and the date on which they are disqualified
SELECT * 
FROM STUDENTS
WHERE STATUS_ID = 3;

SELECT * FROM DroppedDownStudents;

CREATE OR REPLACE TRIGGER BeforeDeleteOnStudents
BEFORE DELETE ON Students
FOR EACH ROW
BEGIN  
    IF :OLD.Status_Id = 3 THEN
        INSERT INTO DroppedDownStudents (DDStudent_Id,First_Name, Last_Name, EndDate)
        VALUES (DropDownStudents_Sequence.NEXTVAL, :OLD.First_Name, :OLD.Last_Name, SYSDATE);
    END IF;
     DBMS_OUTPUT.PUT_LINE('The student has graduated. The data is moved to GraduatedStudents table!');
END;


EXECUTE DeleteStudentById(111);

