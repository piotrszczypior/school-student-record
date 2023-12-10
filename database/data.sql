INSERT INTO "User" (Email, Login, Role, Password) VALUES
('jan.kowalski@email.pl', 'jkowalski', 'administrator', 'haslo123'),
('anna.nowak@email.pl', 'anowak', 'administrator', 'haslo321'),
('piotr.wisniewski@email.pl', 'pwisniewski', 'administrator', 'haslo456'),
('maria.dabrowska@email.pl', 'mdabrowska', 'administrator', 'haslo789'),
('wojciech.lewandowski@email.pl', 'wlewandowski', 'administrator', 'haslo101'),
('ewa.wojcik@email.pl', 'ewojcik', 'administrator', 'haslo112'),
('michal.kaminski@email.pl', 'mkaminski', 'administrator', 'haslo131'),
('katarzyna.kowalczyk@email.pl', 'kkowalczyk', 'administrator', 'haslo141'),
('tomasz.zajac@email.pl', 'tzajac', 'administrator', 'haslo151'),
('magdalena.szymanska@email.pl', 'mszymanska', 'administrator', 'haslo161'),
('adam.nowak@student.pl', 'anowak_student', 'student', 'haslo272'),
('ewelina.mazurek@student.pl', 'emazurek_student', 'student', 'haslo282'),
('piotr.adamski@student.pl', 'padamski_student', 'student', 'haslo292'),
('karolina.majewska@student.pl', 'kmajewska_student', 'student', 'haslo302'),
('tomasz.piotrowski@student.pl', 'tpiotrowski_student', 'student', 'haslo312'),
('olga.krawczyk@student.pl', 'okrawczyk_student', 'student', 'haslo322'),
('michał.wrobel@student.pl', 'mwrobel_student', 'student', 'haslo332'),
('nina.szewczyk@student.pl', 'nszewczyk_student', 'student', 'haslo342'),
('patryk.klimek@student.pl', 'pklimek_student', 'student', 'haslo352'),
('angelika.kaczmarek@student.pl', 'akaczmarek_student', 'student', 'haslo362'),
('adam.jakubowski@student.pl', 'ajakubowski', 'student', 'haslo372'),
('karolina.kowalska@teacher.pl', 'kkowalska_teacher', 'teacher', 'haslo483'),
('tomasz.kowalczyk@teacher.pl', 'tkowalczyk_teacher', 'teacher', 'haslo493'),
('marta.wisniewska@teacher.pl', 'mwisniewska_teacher', 'teacher', 'haslo503'),
('adam.lewandowski@teacher.pl', 'alewandowski_teacher', 'teacher', 'haslo513'),
('ewelina.mazurek@teacher.pl', 'emazurek_teacher', 'teacher', 'haslo523'),
('piotr.adamski@teacher.pl', 'padamski_teacher', 'teacher', 'haslo533'),
('karolina.majewska@teacher.pl', 'kmajewska_teacher', 'teacher', 'haslo543'),
('tomasz.piotrowski@teacher.pl', 'tpiotrowski_teacher', 'teacher', 'haslo553'),
('olga.krawczyk@teacher.pl', 'okrawczyk_teacher', 'teacher', 'haslo563'),
('michał.wrobel@teacher.pl', 'mwrobel_teacher', 'teacher', 'haslo573');

INSERT INTO Address (City, Street, "Post code", "Street number", "Flat number") VALUES
('Warszawa', 'Marszałkowska', '00-100', 10, 2),
('Kraków', 'Floriańska', '31-019', 15, 5),
('Gdańsk', 'Długa', '80-888', 20, 1),
('Poznań', 'Wielka', '61-100', 5, 3),
('Wrocław', 'Szkolna', '50-500', 12, 8),
('Łódź', 'Piotrkowska', '90-001', 18, 4),
('Szczecin', 'Wojska Polskiego', '70-100', 3, 7),
('Katowice', 'Słowackiego', '40-200', 7, 12),
('Kraków', 'Krakowska', '30-123', 14, 9),
('Gdynia', 'Hryniewickiego', '81-111', 22, 11),


INSERT INTO Administrator ("First name", "Last name", UsersID) VALUES
('Jan', 'Kowalski', 1),
('Anna', 'Nowak', 2),
('Piotr', 'Wiśniewski', 3),
('Maria', 'Dąbrowska', 4),
('Wojciech', 'Lewandowski', 5),
('Ewa', 'Wójcik', 6),
('Michał', 'Kamiński', 7),
('Katarzyna', 'Kowalczyk', 8),
('Tomasz', 'Zając', 9),
('Magdalena', 'Szymańska', 10);

INSERT INTO Student ("First name", "Last name", "Date of birth", ClassesID, UsersID, AddressID) VALUES
('Tomasz', 'Zieliński', '2005-04-10', 1, 11, 1),
('Magdalena', 'Szymańska', '2006-07-22', 1, 12, 2),
('Kamil', 'Wójcik', '2005-01-15', 1, 13, 3),
('Ola', 'Nowakowska', '2006-05-05', 1, 14, 4),
('Adam', 'Kowalski', '2004-11-20', 2, 15, 5),
('Monika', 'Dąbrowska', '2003-10-18', 2, 16, 6),
('Paweł', 'Jankowski', '2005-08-08', 2, 17, 7),
('Kasia', 'Zając', '2006-03-30', 3, 18, 8),
('Marcin', 'Wiśniewski', '2004-06-12', 3, 19, 9),
('Aleksandra', 'Kowalczyk', '2003-09-25', 3, 20, 10);

INSERT INTO Teacher ("First name", "Last name", "Date of birth", "Academic degree", UsersID, ClassID, AddressID) VALUES
('Katarzyna', 'Borowska', '1980-05-20', 'Doktor', 21, 1, 9),
('Marek', 'Nowicki', '1975-10-15', 'Magister', 22, 2, 8),
('Agnieszka', 'Wojciechowska', '1982-04-03', 'Doktor', 23, 3, 7),
('Piotr', 'Kowalczyk', '1978-12-08', 'Magister', 24, NULL, 6),
('Karolina', 'Sikorska', '1985-06-25', 'Doktor', 25, NULL, 5),
('Tomasz', 'Jankowski', '1977-08-01', 'Magister', 26, NULL, 4),
('Alicja', 'Zając', '1983-11-12', 'Doktor', 27, NULL, 3),
('Rafał', 'Wiśniewski', '1981-02-28', 'Magister', 28, NULL, 2),
('Kinga', 'Kowalska', '1979-07-10', 'Profesor', 29, NULL, 1),
('Grzegorz', 'Dąbrowski', '1976-09-15', 'Brak', 30, NULL, 10);


INSERT INTO Attendance ("Date", Present, LessonsID, StudentUsersID) VALUES
('2023-09-01', true, 1, 11),
('2023-09-02', false, 1, 12),
('2023-09-01', true, 2, 13),
('2023-09-02', true, 2, 14),
('2023-09-03', false, 3, 15),
('2023-09-03', true, 3, 16),
('2023-09-04', true, 4, 17),
('2023-09-04', true, 4, 18),
('2023-09-05', true, 5, 19),
('2023-09-05', false, 5, 20);

INSERT INTO Class (Name) VALUES
('Matematyka'),
('Język polski'),
('Historia'),
('Fizyka'),
('Chemia'),
('Biologia'),
('Informatyka'),
('Wychowanie fizyczne'),
('Geografia'),
('Angielski');

INSERT INTO Classroom ("Room name") VALUES
('Sala 101'),
('Sala 102'),
('Sala 103'),
('Sala 104'),
('Sala 105'),
('Sala 106'),
('Sala 107'),
('Sala 108'),
('Sala 109'),
('Sala 110');

INSERT INTO Grade ("Grade value", SubjectsID, "Date of modification", TeacherUsersID, StudentUsersID) VALUES
(5.0, 1, '2023-09-05', 21, 11),
(4.5, 2, '2023-09-06', 22, 12),
(3.0, 3, '2023-09-07', 23, 13),
(4.0, 4, '2023-09-08', 24, 14),
(5.0, 5, '2023-09-09', 25, 15),
(4.0, 6, '2023-09-10', 26, 16),
(3.5, 7, '2023-09-11', 27, 17),
(4.5, 8, '2023-09-12', 28, 18),
(4.0, 9, '2023-09-13', 29, 19),
(3.5, 10, '2023-09-14', 30, 20);

INSERT INTO Lesson (Topic, "Date", ClassesID, SubjectsID, ClassroomID, TeacherUsersID) VALUES
('Wprowadzenie do algebra', '2023-09-01', 1, 1, 1, 21),
('Gramatyka i ortografia', '2023-09-02', 2, 2, 2, 22),
('Podstawy historii Polski', '2023-09-03', 1, 3, 3, 23),
('Ruch i siły fizyczne', '2023-09-04', 1, 4, 4, 24),
('Podstawy chemii organicznej', '2023-09-05', 2, 5, 5, 25),
('Budowa komórek', '2023-09-06', 3, 6, 6, 26),
('Programowanie w Pythonie', '2023-09-07', 1, 7, 7, 27),
('Trening sportowy', '2023-09-08', 2, 8, 8, 28),
('Krajobraz i kultura geograficzna', '2023-09-09', 3, 9, 9, 29),
('Angielski dla zaawansowanych', '2023-09-10', 3, 10, 10, 30);

INSERT INTO Subject (Name) VALUES
('Matematyka'),
('Język polski'),
('Historia'),
('Fizyka'),
('Chemia'),
('Biologia'),
('Informatyka'),
('Język angielski'),
('Geografia'),
('Wychowanie fizyczne'),
('Muzyka'),
('Plastyka'),
('Technika'),
('Religia'),
('Wiedza o społeczeństwie');

INSERT INTO Subjects_Teachers (SubjectsID, TeacherUsersID) VALUES
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25),
(6, 26),
(7, 27),
(8, 28),
(9, 29),
(10, 30);


