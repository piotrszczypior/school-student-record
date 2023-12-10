CREATE ROLE Teacher;
GRANT SELECT ON Student TO Teacher;
GRANT SELECT, UPDATE ON Address TO Teacher;

ALTER TABLE Teacher ENABLE ROW LEVEL SECURITY;

CREATE POLICY select_students_taught_by_teacher ON Student
    FOR SELECT TO Teacher
    USING (usersID = (
            SELECT s.usersid FROM student s
            JOIN "class" c  ON s.classesid = c.id 
            JOIN lesson l ON l.classesid = c.id 
            WHERE l.teacherusersid  = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

CREATE POLICY select_teacher_self ON Teacher
FOR SELECT TO Teacher
USING (UserID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));
       
-- UPDATE
CREATE POLICY update_teacher_self ON Teacher
FOR UPDATE TO Teacher
USING (UserID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER));

CREATE POLICY update_teacher_address ON Address
FOR UPDATE TO Teacher
USING (ID = (SELECT AddressID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));


-- Policy to allow teachers to add grades
CREATE POLICY insert_grade_policy ON Grade
    FOR INSERT TO Teacher;

-- Policy to allow teachers to update or delete their own grades
CREATE POLICY modify_grade_policy ON Grade
    FOR ALL TO Teacher
    USING (TeacherUsersID = (SELECT UsersID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

    -- Policy to allow teachers to add lessons
CREATE POLICY insert_lesson_policy ON Lesson
    FOR INSERT TO Teacher;

-- Policy to allow teachers to update or delete their own lessons
CREATE POLICY modify_lesson_policy ON Lesson
    FOR ALL TO Teacher
    USING (TeacherUsersID = (SELECT UsersID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

-- Policy to allow teachers to add lessons
CREATE POLICY insert_lesson_policy ON Lesson
    FOR INSERT TO Teacher;

-- Policy to allow teachers to update or delete their own lessons
CREATE POLICY modify_lesson_policy ON Lesson
    FOR ALL TO Teacher
    USING (TeacherUsersID = (SELECT UsersID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

-- Policy to allow teachers to add attendance records
CREATE POLICY insert_attendance_policy ON Attendance
    FOR INSERT TO Teacher;

-- Policy to allow teachers to update or delete their own attendance records
CREATE POLICY modify_attendance_policy ON Attendance
    FOR ALL TO Teacher
    USING (TeacherUsersID = (SELECT UsersID FROM Teacher WHERE UsersID = (SELECT ID FROM "User" WHERE Login = CURRENT_USER)));

