-- STUDENT
CREATE ROLE Student;

-- grant roles --
GRANT SELECT ON "User" TO Student;
GRANT SELECT ON Student TO Student;
GRANT SELECT ON Attendance TO Student;
GRANT SELECT ON Grade TO Student;
GRANT SELECT ON Lesson TO Student;
GRANT SELECT ON Address TO Student;
GRANT SELECT ON Teacher TO Student;
GRANT SELECT ON Class TO Student;
GRANT SELECT ON Subject TO Student;
GRANT SELECT ON Classroom TO Student;

GRANT UPDATE ON "User" TO Student;
GRANT UPDATE ON Address TO Student;

-- RLS --
ALTER TABLE "User" ENABLE ROW LEVEL SECURITY;
ALTER TABLE Student ENABLE ROW LEVEL SECURITY;
ALTER TABLE Attendance ENABLE ROW LEVEL SECURITY;
ALTER TABLE Grade ENABLE ROW LEVEL SECURITY;
ALTER TABLE Lesson ENABLE ROW LEVEL SECURITY;

ALTER TABLE Address ENABLE ROW LEVEL SECURITY;

--- polices ---
-- SELECT
CREATE POLICY select_self_user ON "User" 
FOR SELECT TO Student
USING (Login = current_user);

CREATE POLICY select_student_self ON Student FOR SELECT TO Student
USING (UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY select_student_lesson ON Lesson
FOR SELECT TO Student
USING (ClassID = (SELECT ClassID FROM Student WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

CREATE POLICY select_student_grade ON Grade FOR SELECT TO Student
USING (StudentUsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY select_student_attendace ON Attendance FOR SELECT TO Student
USING (StudentUsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY select_student_address ON Address
FOR SELECT TO Student
USING (id = (SELECT AddressID FROM Student WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

-- UPDATE
CREATE POLICY update_student ON "User" FOR UPDATE TO Student
USING (Login = current_user);

CREATE POLICY update_student_address ON Address
FOR UPDATE TO Student
USING (id = (SELECT AddressID FROM Student WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

CREATE USER anowak_student WITH PASSWORD 'pass';
GRANT Student TO anowak_student;