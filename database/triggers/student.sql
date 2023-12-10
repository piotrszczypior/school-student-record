-- grant roles --
GRANT SELECT ON "User" TO Student;
GRANT SELECT ON Student TO Student;
GRANT SELECT ON Attendance TO Student;
GRANT SELECT ON Grade TO Student;
GRANT SELECT ON Lesson TO Student;

GRANT UPDATE ON Student TO Student;
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
CREATE POLICY select_student_self ON Student FOR SELECT
USING (UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY select_student_lesson ON Lesson
FOR SELECT TO Student
USING (ClassesID IN (SELECT ClassesID FROM Student WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)))

CREATE POLICY select_student_grade ON Grade FOR SELECT
USING (StudentUsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY select_student_attendace ON Attendance FOR SELECT
USING (StudentUsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY select_student_address ON Address
FOR SELECT TO Student
USING (ID = (SELECT AddressID FROM Student WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

-- UPDATE
CREATE POLICY select_student_self ON Student FOR UPDATE
USING (UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY update_student_address ON Address
FOR UPDATE TO Student
USING (ID = (SELECT AddressID FROM Student WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));