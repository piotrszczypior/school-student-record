SELECT s."First name", s."Last name", a.City, a.Street, a."Post code", a."Street number", a."Flat number"
FROM Student s
JOIN Address a ON s.AddressID = a.ID;

SELECT t."First name", t."Last name", sub.Name AS Subject
FROM Teacher t
JOIN Subjects_Teachers st ON t.UsersID = st.TeacherUsersID
JOIN Subject sub ON st.SubjectsID = sub.ID;

SELECT l.Topic, l."Date", c."Room name"
FROM Lesson l
JOIN Classroom c ON l.ClassroomID = c.ID
WHERE c."Room name" = 'Sala 101';

SELECT s."First name", s."Last name", c.Name AS Class
FROM Student s
JOIN Class c ON s.ClassesID = c.ID;