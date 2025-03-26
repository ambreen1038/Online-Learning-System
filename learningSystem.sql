create database learningsystem;
use learningsystem;
show databases;
Create Table Administrator 
( 
 User_ID int , 
 Username varchar(20) , 
 UserPasword varchar(8)
); 

Alter Table Administrator Add Primary Key(User_ID);
Alter Table Administrator DROP Primary Key;
Alter Table Administrator Add Primary Key(User_ID);
insert into Administrator Values
(1,"Zakwan Habib","12p34"),(2,"Safwan Habib","1zx235"),(3,"Ahmad Raza","1k236"),
(4,"Hassan Raza","1237nm"),(5,"Shazain","1ty238"),(6,"Ambreen Habib","1on266"),
(7,"Zakwan","1299Ab"),(8,"Maria","1278Ab");
select * from Administrator;
Delete From Administrator Where User_ID=3;
Delete From Administrator Where User_ID=5;
Delete From Administrator Where User_ID=7;
Update Administrator SET Username="Sana Zafar" Where User_ID=3;
Update Administrator SET Username="Saba Zafar" Where User_ID=4;
Update Administrator SET Username="Arooj Fatima" Where User_ID=6;
select * from Administrator;
Delete From Administrator where User_ID=10; 
Create Table Department 
( 
 Dept_ID int, 
 Dept_Name varchar(20)
); 
ALter Table Department Add Primary Key(Dept_ID);
Alter Table Department Add Column Dept_Description varchar(100);
Alter Table Department Alter Column Dept_Description SET default Null;
Alter Table Department Change Column Dept_Description Description varchar(255);
Alter Table Department MODIFY Column Dept_ID char(2);
INSERT INTO Department VALUES('D1',"FOIT",NULL),('D2',"FOEE",NULL),('D3',"FOME",NULL),
('D4',"FOCE",NULL),('D5',"FOSS",NULL),('D6',"FOBA",NULL),('D7',"FOAB",NULL),('D8',"FOMA",NULL);
SET SQL_SAFE_UPDATES=0;
Select * FROM Department;
Delete FROM Department WHERE Dept_Name="FOSS";
Delete FROM Department WHERE Dept_ID='D3';
Delete FROM Department WHERE Dept_Name="FOAB";
UPDATE Department SET Dept_Name="FOEL" WHERE Dept_ID='D6';
UPDATE Department SET Dept_Name="FOBA" WHERE Dept_ID='D6';
UPDATE Department SET Dept_Name="FOCS" WHERE Dept_ID='D1';

Create Table Teacher 
( 
 Teacher_ID int , 
 User_ID int, 
 Dept_ID char(5), 
 Specialization varchar(20) , 
 FirstName varchar(20) , 
 LastName varchar(20)
); 
ALTER TABLE Teacher Add Primary Key(Teacher_ID);
Alter Table Teacher Add FOREIGN KEY (User_ID) references Administrator(User_ID) ;
Alter Table Teacher Add FOREIGN KEY(Dept_ID) references Department(Dept_ID) ;
ALTER TABLE Teacher Add Column JOB_TYPE varchar(50) NOT NULL Default "Visiting Lecturer";
INSERT INTO Teacher Values
(100,3,'D2','Computer Science','Nimra','Tariq'),(101,4,'D4','Google CyberSecurity','Maria','Habib'),
(102,2,'D2','Mathematics','Anum','Farooq'),(106,6,'D1','Computer Science','Ayesha','Jameel'),
(105,3,'D6','English','Nimra','Tariq'),(104,6,'D8','Business','Ammara','Farooq'),
(103,8,'D4','Computer Science','Zarish','Tariq'),(107,2,'D4','Computer Science','Taqwa','Saim');
INSERT INTO Teacher Values
(110,3,'D2','Computer Science','Nimra','Tariq'),(111,4,'D4','Google CyberSecurity','Maria','Habib'),
(112,2,'D2','Mathematics','Anum','Farooq');
INSERT INTO Teacher Values
(134,34,'D2','Computer Science','Nimra','Tariq');
Delete FROM Teacher Where Teacher_ID=111;
Delete FROM Teacher Where Teacher_ID=112;
Delete FROM Teacher Where Teacher_ID=110;

UPDATE Teacher SET Teacher_ID=99 WHERE Teacher_ID=100;
UPDATE Teacher SET Dept_ID='D1' WHERE Specialization='Computer Science';
UPDATE Teacher SET User_ID=4 WHERE Teacher_ID=101;

  Select * from Teacher;
Create Table Teacher_TeacherEmail 
( 
TeacherEmail varchar(50) , 
Teacher_ID int 
); 
ALTER TABLE Teacher_TeacherEmail Add Primary Key(TeacherEmail,Teacher_ID);
ALTER TABLE Teacher_TeacherEmail Add Foreign Key(Teacher_ID) references Teacher(Teacher_ID);

INSERT INTO Teacher_TeacherEmail Values
('nimra.tariq@ucp.edu.pk',100),('Taqwa.Saim@ucp.edu.pk',107),('m235600gmail.com',100),
('anum567@gmail.com',101),('ayesha@ucp.edu.pk',102),('ayesh675@gmail.com',103),
('ammara.farooq@ucp.edu.pk',104),('ammara345@gmsil.com',105);

DELETE FROM Teacher_TeacherEmail WHERE TeacherEmail='ayesh675@gmail.com';
DELETE FROM Teacher_TeacherEmail WHERE Teacher_ID=107 AND TeacherEmail='Taqwa.Saim@ucp.edu.pk';
DELETE FROM Teacher_TeacherEmail WHERE TeacherEmail='ammara345@gmsil.com';

UPDATE Teacher_TeacherEmail SET Teacher_ID =104 WHERE TeacherEmail='m235600gmail.com';
UPDATE Teacher_TeacherEmail SET Teacher_ID =104 WHERE TeacherEmail='nimra.tariq@ucp.edu.pk';
UPDATE Teacher_TeacherEmail SET Teacher_ID =102 WHERE TeacherEmail='anum567@gmail.com';

Create Table Student 
( 
 Student_ID varchar(15), 
 Fname varchar(20) , 
 Lname varchar(20) , 
 DOB Date , 
 Gender char(1) , 
 Address varchar(30) , 
 User_ID int , 
 Primary Key(Student_ID), 
 Constraint FKK Foreign Key(User_ID) references Administrator(User_ID) 
  ON DELETE SET NULL ON UPDATE CASCADE 
); 

ALTER TABLE Student DROP FOreign Key FKK;
ALTER TABLE Student ADD FOreign Key(User_ID) references Administrator(User_ID) 
ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE Student Add COLUMN AGE int;
ALTER TABLE Student DROP COLUMN AGE;

INSERT INTO Student VALUES
('L1ABCDE123','Maria','Habib','2004-5-3','F','LAHORE',8),('L1ABCDE124','Zakwan','Habib','2002-7-3','M','Sahiwal',3),
('L1ABCDE125','Safwan','Habib','2004-5-3','M','OKARA',2),('L1ABCDE130','Shazain','Irfan','2003-10-3','M','LAHORE',4),
('L1ABCDE126','Ahmad','Raza','2004-9-2','M','LAHORE',3),('L1ABCDE127','Hassan','Raza','2004-5-3','M','LAHORE',4),
('L1ABCDE128','Ambreen','Habib','2002-10-7','F','LAHORE',6),('L1ABCDE129','Zakwan','Safwan','2004-5-3','M','LAHORE',2);
SET SQL_Safe_Updates=0;
INSERT INTO Student VALUES
('L1ABCDE111','Maria','Habib','2004-5-3','F','LAHORE',8),('L1ABCDE112','Hassan','Habib','2002-7-3','M','Sahiwal',3),
('L1ABCDE113','Safwan','Habib','2004-5-3','M','OKARA',2);
INSERT INTO Student VALUES
('L1ABCDE222','Maria','Habib','2004-5-3','F','LAHORE',8);
DELETE FROM Student WHERE Student_ID='L1ABCDE111' OR Student_ID='L1ABCDE112' OR Student_ID='L1ABCDE113';

UPDATE Student SET DOB='2002-1-2' Where Student_ID='L1ABCDE123';
UPDATE Student SET Address='Rawalpindi' Where Student_ID='L1ABCDE123';
UPDATE Student SET DOB='2001-1-2' Where Student_ID='L1ABCDE130';
select count(*) from Student Where Gender='F';

Create Table course
(  
 Course_ID int , 
 Course_Name varchar(50) , 
 Course_Description varchar(250) , 
 Duration int , 
 Credits int , 
 no_OF_Lessons int , 
 Primary Key(Course_ID) 
); 
select * From Course;
ALTER TABLE Course MODIFY Duration varchar(20) NOT NULL DEFAULT '6 months';

INSERT INTO Course Values
(2002,'English','XYZ','4 months',3,6),(2003,'DSA','XYZ','4 months',4,7),
(2004,'Flask','XYZ','2 months',3,6),(2005,'Mathematics','XYZ','4 months',3,6),
(2006,'English','XYZ','4 months',3,6),(2007,'BigData','XYZ','4 months',4,8),
(2008,'DataBase','XYZ','4 months',4,6),(2009,'MVC','XYZ','4 months',3,6);
INSERT INTO Course Values
(2010,'DataBase','XYZ','4 months',4,6),(2011,'DataBase','XYZ','4 months',4,6);
INSERT INTO Course Values
(2022,'DataBase','XYZ','4 months',4,6);

Delete FROM Course Where Course_ID=2010 OR Course_ID=2011 OR Course_ID=2009;
UPDATE Course SET Credits=6 Where Course_ID=2008;
UPDATE Course SET no_OF_Lessons=6 Where Course_ID=2007;
UPDATE Course SET Course_Name='OOP' Where Course_Name='Flask';

Create Table Enrolled 
( 
Student_ID varchar(15), 
Course_ID int , 
Enrollment_Date Date, 
Primary Key(Student_ID,Course_ID), 
Constraint fkS Foreign Key(Student_ID) references Student(Student_ID), 
Constraint fkC Foreign Key(Course_ID) references Course(Course_ID) 
);
 
INSERT INTO Enrolled VALUES 
('L1ABCDE123',2002,'2022-2-4'),('L1ABCDE123',2007,'2022-2-4'),('L1ABCDE124',2008,'2023-2-5'),
('L1ABCDE123',2008,'2022-2-4'),('L1ABCDE124',2003,'2022-2-4'),('L1ABCDE130',2002,'2022-2-4'),
('L1ABCDE127',2002,'2022-2-4'),('L1ABCDE124',2005,'2022-11-4');
INSERT INTO Enrolled VALUES 
('L1ABCDE222',2022,'2022-2-4');
DELETE FROM Enrolled WHere Course_ID=2002 AND Student_ID='L1ABCDE123';
DELETE FROM Enrolled WHere Course_ID=2002 AND Student_ID='L1ABCDE127';
DELETE FROM Enrolled WHere Course_ID=2008 AND Student_ID='L1ABCDE124';

/*Get a list of courses that a specific user is enrolled in.*/
SELECT c.Course_Name FROM (course c INNER JOIN Enrolled E ON c.Course_ID=E.Course_ID) INNER JOIN
Student s ON E.Student_ID=s.Student_ID Where s.Student_ID='L1ABCDE123' ;

/*Determine the number of Students enrolled in each course.*/
SELECT c.Course_Name,count(E.Student_ID) AS StudentsEnrolled
FROM Student s INNER JOIN Enrolled E ON E.Student_ID=s.Student_ID INNER JOIN Course c ON
 c.Course_ID=E.Course_ID GROUP by c.Course_Name;

Create Table Teacher_Course 
(  
Teacher_ID int, 
Course_ID int , 
Primary Key(Teacher_ID,Course_ID), 
Constraint fkT Foreign Key(Teacher_ID) references Teacher(Teacher_ID), 
Constraint fkTC Foreign Key(Course_ID) references Course(Course_ID) 
); 
INSERT INTO Teacher_Course Values
(100,2002),(101,2003),(102,2004),(103,2005),(104,2006),(105,2007),(106,2008),(107,2009);
INSERT INTO Teacher_Course Values
(134,2022);
DELETE FROM Teacher_Course WHERE Teacher_ID=105 AND Course_ID=2007;
DELETE FROM Teacher_Course WHERE Teacher_ID=107 AND Course_ID=2009;
DELETE FROM Teacher_Course WHERE Teacher_ID=103 AND Course_ID=2005;

UPDATE Teacher_Course SET Teacher_ID=106 Where Course_ID=2002;
UPDATE Teacher_Course SET Teacher_ID=104 Where Course_ID=2008;
UPDATE Teacher_Course SET Course_ID=2002 Where Teacher_ID=100;

Create Table Student_SContactNumber 
( 
SContactNumber varchar(11) , 
Student_ID varchar(15)
); 
Alter Table Student_SContactNumber Add Primary Key(Student_ID,SContactNumber);
Alter Table Student_SContactNumber Add Foreign Key(Student_ID) references Student(Student_ID) ;

INSERT INTO Student_SContactNumber VALUES
('03023050700','L1ABCDE123'),('03000000001','L1ABCDE124'),('0340000000','L1ABCDE125'),
('03003400000','L1ABCDE126'),('0302300000','L1ABCDE127'),('03023051100','L1ABCDE128'),
('03022250700','L1ABCDE129'),('03022050760','L1ABCDE127');

DELETE FROM Student_SContactNumber WHERE Student_ID='L1ABCDE126';
DELETE FROM Student_SContactNumber WHERE SContactNumber='0340000000';
DELETE FROM Student_SContactNumber WHERE Student_ID='L1ABCDE123';

UPDATE Student_SContactNumber SET Student_ID='L1ABCDE129' WHERE SContactNumber='03022050760';
UPDATE Student_SContactNumber SET Student_ID='L1ABCDE126' WHERE SContactNumber='03023051100';
UPDATE Student_SContactNumber SET Student_ID='L1ABCDE127' WHERE SContactNumber='03022250700';

Create Table Assessment 
( 
Assessment_ID int , 
TypeA varchar(20) , 
DeadLine Date , 
Course_ID int  
);
Alter Table Assessment Add PRIMARY KEY(Assessment_ID);
Alter Table Assessment Add Foreign Key(Course_ID) references Course(Course_ID) 
ON DELETE SET NULL ON UPDATE CASCADE;

INSERT INTO Assessment VALUES
(20,'Project','2024-2-28',2002),(21,'QUIZ','2024-1-28',2003),(22,'ASSIGNMENT','2024-4-28',2004),
(23,'CP','2024-2-28',2002),(24,'Presentation','2024-2-28',2005),(25,'LAB WORK','2024-2-22',2007),
(26,'Project','2024-4-30',2004),(27,'GRADED LAB','2024-5-21',2005);

SELECT * From Assessment;
DELETE FROM Assessment Where Assessment_ID=24;
DELETE FROM Assessment Where Course_ID=2003;
DELETE FROM Assessment Where TypeA='LAB WORK';

UPDATE Assessment SET DeadLine='2024-3-16' WHERE TypeA='ASSIGNMNET';
UPDATE Assessment SET Course_ID=2007 WHERE TypeA='GRADED LAB';
UPDATE Assessment SET DeadLine='2024-3-16' WHERE Assessment_ID=27;

select A.TypeA,avg(marks) AS AverageMarks from Assessment A LEFT JOIN Grade g
ON A.Assessment_ID=g.Assessment_ID group by A.TypeA
UNION
select A.TypeA,avg(marks) AS AverageMarks from Assessment A RIGHT JOIN Grade g
ON A.Assessment_ID=g.Assessment_ID group by A.TypeA;

Create Table Grade 
( 
Score int , 
Assessment_ID int 
); 
Alter Table Grade Add FOREIGN KEY(Assessment_ID) references Assessment(Assessment_ID) 
ON DELETE SET NULL ON UPDATE CASCADE;
Alter Table Grade CHANGE column Score marks int;

INSERT INTO Grade VALUES
(45,20),(16,21),(40,22),(15,23),(45,24),(45,25),(23,20),(56,26);

DELETE FROM Grade Where Assessment_ID=25;
DELETE FROM Grade Where Assessment_ID=20;
DELETE FROM Grade Where Assessment_ID=26;

UPDATE Grade SET marks=20 Where Assessment_ID=23;
UPDATE Grade SET Assessment_ID=22 Where Assessment_ID=21;
UPDATE Grade SET marks=24 Where marks=45;

/*Find the courses with a duration smaller than all courses with an ID greater than 2005.*/
SELECT Course_Name
FROM Course
WHERE Duration < ALL (SELECT Duration FROM Course WHERE Course_ID > 2005);

SELECT Course_Name
FROM Course
WHERE Duration > ALL (SELECT Duration FROM Course WHERE credits=3);

/*Retrieve the assessments with a deadline greater than any assessment with the type 'LAB WORK'.*/
SELECT *
FROM Assessment
WHERE DeadLine > ANY (SELECT DeadLine FROM Assessment WHERE TypeA = 'Project');

/*Find the assessments with a deadline smaller than any assessment with the type 'Project'.*/
SELECT *
FROM Assessment
WHERE DeadLine < ANY (SELECT DeadLine FROM Assessment WHERE TypeA = 'Project');

SELECT Fname From Student Where Fname Like 'A%';

SELECT *
FROM Administrator
WHERE Username = 'Zakwan' OR Username = 'Maria';

SELECT *
FROM Administrator
WHERE Username NOT LIKE '%Ab%';

SELECT *
FROM Administrator
WHERE Username IN ('Zakwan', 'Maria');

SELECT s.Fname,ss.SContactNumber
FROM Student s INNER JOIN Student_SContactNumber ss ON s.Student_ID=ss.Student_ID; 

select * from Grade;
SELECT Assessment_ID,min(marks) FROM Grade;
SELECT Assessment_ID,avg(marks) FROM Grade Group by Assessment_ID;
SELECT Assessment_ID,max(marks) FROM Grade Group by Assessment_ID;
SELECT marks FROM Grade WHERE marks BETWEEN 20 AND 25;
SELECT marks FROM Grade WHERE Assessment_ID IS NULL;
SELECT marks FROM Grade WHERE marks IS NOT NULL;
select * from Student;
select * from Teacher;
select * from Course;
Select * from enrolled;
SElect * from Teacher_Course ;
SElect * from Teacher_Course ;

SELECT S.Fname,S.Lname,T.FirstName,T.LastName,C.Course_Name
From Student S Inner Join enrolled e ON S.Student_ID=e.Student_ID INNER JOIN  Course C 
ON e.Course_ID=C.Course_ID INNER JOIN Teacher_Course TC ON TC.Course_ID=C.Course_ID INNER JOIn
Teacher T ON TC.Teacher_ID=T.Teacher_ID ;


