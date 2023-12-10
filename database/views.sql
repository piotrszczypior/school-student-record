-- Widok z informacjami o ocenach dla danego ucznia
CREATE VIEW StudentGrades AS
SELECT
    s."First name" AS "Student First Name",
    s."Last name" AS "Student Last Name",
    g."Grade value" AS "Grade",
    g."Date of modification" AS "Date of Modification",
    t."First name" AS "Teacher First Name",
    t."Last name" AS "Teacher Last Name"
FROM
    Grade g
JOIN Student s ON g.StudentUsersID = s.UsersID
JOIN Teacher t ON g.TeacherUsersID = t.UsersID;

-- Widok z listą obecności dla danego nauczyciela
CREATE VIEW TeacherAttendance AS
SELECT
    l."Date" AS "Lesson Date",
    l.Topic AS "Lesson Topic",
    s."First name" AS "Student First Name",
    s."Last name" AS "Student Last Name",
    a.Present
FROM
    Lesson l
JOIN Attendance a ON l.ID = a.LessonsID
JOIN Student s ON a.StudentUsersID = s.UsersID;

-- Widok z listą ocen dla danego nauczyciela
CREATE VIEW TeacherGrades AS
SELECT
    s."First name" AS "Student First Name",
    s."Last name" AS "Student Last Name",
    g."Grade value" AS "Grade",
    g."Date of modification" AS "Date of Modification",
    t."First name" AS "Teacher First Name",
    t."Last name" AS "Teacher Last Name",
    sub.Name AS "Subject"
FROM
    Grade g
JOIN Student s ON g.StudentUsersID = s.UsersID
JOIN Teacher t ON g.TeacherUsersID = t.UsersID
JOIN Subject sub ON g.SubjectsID = sub.ID;

-- Widok z listą uczniów w danej klasie
CREATE VIEW ClassStudents AS
SELECT
    s."First name" AS "Student First Name",
    s."Last name" AS "Student Last Name",
    a.City AS "City",
    a.Street AS "Street",
    a."Post code" AS "Post Code",
    a."Street number" AS "Street Number",
    a."Flat number" AS "Flat Number"
FROM
    Student s
JOIN Address a ON s.AddressID = a.ID;

-- Widok z listą lekcji dla danego ucznia (dla zalogowanego użytkownika)
CREATE OR REPLACE VIEW StudentLessons AS
SELECT
    l."Date" AS "Lesson Date",
    l.Topic AS "Lesson Topic",
    t."First name" AS "Teacher First Name",
    t."Last name" AS "Teacher Last Name",
    g."Grade value" AS "Grade"
FROM
    Lesson l
JOIN Subjects_Teachers st ON l.SubjectsID = st.SubjectsID
JOIN Teacher t ON st.TeacherUsersID = t.UsersID
LEFT JOIN Grade g ON l.ID = g.ID AND g.StudentUsersID = (
    SELECT ID
    FROM "User"
    WHERE Login = current_user
);
