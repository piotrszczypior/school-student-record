-- Tworzenie ról użytkowników
CREATE ROLE Administrator;
CREATE ROLE Student;
CREATE ROLE Teacher;

-- Nadanie uprawnień Administratorowi (pełne uprawnienia)
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO Administrator;

-- Uprawnienia dla Studenta
-- Możliwość wykonywania operacji SELECT na własnych danych
GRANT SELECT ON Student TO Student;
GRANT SELECT ON Grade TO Student;
GRANT SELECT ON Lesson TO Student;
GRANT SELECT ON Attendance TO Student;

-- Możliwość aktualizacji własnego profilu
GRANT UPDATE ON "User" TO Student;
GRANT UPDATE ON Address TO Student;

-- Uprawnienia dla Nauczyciela
-- Możliwość wykonywania operacji SELECT tylko na uczniach, których uczy (wymaga dalszej implementacji logiki)
GRANT SELECT ON Student TO Teacher;

-- Możliwość aktualizacji własnego profilu
GRANT UPDATE ON "User" TO Teacher;
GRANT UPDATE ON Address TO Teacher;

-- Możliwość dodawania danych i wykonywania operacji na danych wprowadzonych przez siebie
-- (wymaga dalszej implementacji logiki, która ogranicza te operacje do danych wprowadzonych przez nauczyciela)
GRANT INSERT, UPDATE, DELETE ON Grade TO Teacher;
GRANT INSERT, UPDATE, DELETE ON Lesson TO Teacher;
GRANT INSERT, UPDATE, DELETE ON Attendance TO Teacher;

-- Stworzenie użytkowników i przypisanie ich do ról
CREATE USER user_admin WITH PASSWORD 'password';
CREATE USER user_student WITH PASSWORD 'password';
CREATE USER user_teacher WITH PASSWORD 'password';

GRANT Administrator TO user_admin;
GRANT Student TO user_student;
GRANT Teacher TO user_teacher;
