-- TEACHER -- 
CREATE ROLE Teacher;

-- GRANTS
GRANT SELECT, UPDATE ON "User" To Teacher;
GRANT SELECT ON Student TO Teacher;
GRANT SELECT ON Subject TO Teacher;
GRANT SELECT ON CLASS TO Teacher;
GRANT SELECT ON Classroom TO Teacher;
GRANT SELECT, UPDATE ON Address TO Teacher;
GRANT SELECT ON Teacher TO Teacher;
GRANT ALL ON Grade TO Teacher;
GRANT ALL ON Lesson TO Teacher;
GRANT ALL ON Attendance TO Teacher;


GRANT USAGE ON SEQUENCE grade_id_seq TO Teacher;

--- RLS
ALTER TABLE Teacher ENABLE ROW LEVEL SECURITY;
ALTER TABLE Grade ENABLE ROW LEVEL SECURITY;
ALTER TABLE Lesson ENABLE ROW LEVEL SECURITY;
ALTER TABLE Attendance ENABLE ROW LEVEL SECURITY;

-- POLICIES

CREATE POLICY select_self_user_teacher ON "User" 
FOR SELECT TO Teacher
USING (Login = current_user);

CREATE POLICY select_students_taught_by_teacher ON Student
FOR SELECT TO Teacher
USING (
     Student.ClassID = (
        SELECT c.ID
        FROM Class c
        JOIN Lesson l ON l.ClassID = c.ID
        WHERE l.TeacherUsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)
    )
);

CREATE POLICY select_teacher_self ON Teacher
    FOR SELECT TO Teacher
    USING (usersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY update_teacher_self ON Teacher
    FOR UPDATE TO Teacher
    USING (UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY update_teacher_address ON Address
    FOR UPDATE TO Teacher
    USING (ID = (SELECT AddressID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

CREATE POLICY insert_grade_policy ON Grade
    FOR INSERT TO Teacher;

CREATE POLICY modify_grade_policy ON Grade
FOR ALL TO Teacher
USING (TeacherUsersID = (SELECT UsersID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

CREATE POLICY insert_lesson_policy ON Lesson
    FOR INSERT TO Teacher;

CREATE POLICY modify_lesson_policy ON Lesson
    FOR ALL TO Teacher
    USING (TeacherUsersID = (SELECT UsersID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

CREATE POLICY insert_attendance_policy ON Attendance
    FOR INSERT TO Teacher;

CREATE POLICY modify_attendance_policy ON Attendance
    FOR ALL TO Teacher
    USING (lessonsid = (SELECT id
        FROM Lesson 
        JOIN Teacher ON Lesson.TeacherUsersID = Teacher.UsersID
        WHERE Lesson.ID = Attendance.LessonsID
        AND Teacher.UsersID = (SELECT UsersID FROM "User" WHERE Login = CURRENT_USER)));


CREATE USER tkowalczyk_teacher WITH PASSWORD 'pass';
GRANT Teacher TO tkowalczyk_teacher;