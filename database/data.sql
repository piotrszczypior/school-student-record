INSERT INTO Address (City, Street, "Post code", "Street number", "Flat number") VALUES
('Warszawa', 'Marszałkowska', '00-100', 10, 2),
('Kraków', 'Floriańska', '31-019', 15, 5),
('Gdańsk', 'Długa', '80-888', 20, 1);

INSERT INTO Administrator ("First name", "Last name", UsersID) VALUES
('Jan', 'Kowalski', 1),
('Anna', 'Nowak', 2);

INSERT INTO Attendance ("Date", Present, LessonsID, StudentUsersID) VALUES
('2023-09-01', true, 1, 1),
('2023-09-02', false, 1, 2);

INSERT INTO Class (Name) VALUES
('Matematyka'),
('Język polski'),
('Historia');

INSERT INTO Classroom ("Room name") VALUES
('Sala 101'),
('Sala 102'),
('Sala 103');

INSERT INTO Grade ("Grade value", SubjectsID, "Date of modification", TeacherUsersID, StudentUsersID) VALUES
(5.0, 1, '2023-09-05', 1, 1),
(4.5, 2, '2023-09-06', 2, 2);

INSERT INTO Lesson (Topic, "Date", ClassesID, SubjectsID, ClassroomID, TeacherUsersID) VALUES
('Wprowadzenie do algebra', '2023-09-01', 1, 1, 1, 1),
('Gramatyka i ortografia', '2023-09-02', 2, 2, 2, 2);

INSERT INTO Student ("First name", "Last name", "Date of birth", ClassesID, UsersID, AddressID) VALUES
('Tomasz', 'Zieliński', '2005-04-10', 1, 3, 1),
('Magdalena', 'Szymańska', '2006-07-22', 2, 4, 2);

INSERT INTO Subject (Name) VALUES
('Matematyka'),
('Język polski'),
('Historia');

INSERT INTO Subjects_Teachers (SubjectsID, TeacherUsersID) VALUES
(1, 1),
(2, 2);

INSERT INTO Teacher ("First name", "Last name", "Date of birth", "Academic degree", UsersID, ClassID, AddressID) VALUES
('Katarzyna', 'Borowska', '1980-05-20', 'Doktor', 5, 1, 3),
('Marek', 'Nowicki', '1975-10-15', 'Magister', 6, 2, 2);

INSERT INTO "User" (Email, Login, Role, Password) VALUES
('jan.kowalski@email.pl', 'jkowalski', 'administrator', 'haslo123'),
('anna.nowak@email.pl', 'anowak', 'administrator', 'haslo321');
