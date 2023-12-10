-- Dodawanie nowego ucznia do klasy
CREATE OR REPLACE PROCEDURE add_student(
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    class_id INT
) LANGUAGE plpgsql AS $$
DECLARE
    user_id INT;
BEGIN
    -- Dodaj nowego użytkownika
    INSERT INTO "User" (Email, Login, Role, Password)
    VALUES ('newstudent@example.com', 'newstudent', 'STUDENT', 'defaultpassword')
    RETURNING ID INTO user_id;

    -- Dodaj nowego ucznia
    INSERT INTO Student ("First name", "Last name", "Date of birth", 
                        ClassesID, UsersID, AddressID)
    VALUES (first_name, last_name, date_of_birth, class_id, user_id, 1);
END;
$$;

-- Przenoszenie ucznia do innej klasy
CREATE OR REPLACE PROCEDURE move_student_to_class(
    student_id INT,
    new_class_id INT
) AS
$$
BEGIN
    UPDATE Student SET ClassesID = new_class_id WHERE UsersID = student_id;
END;
$$ LANGUAGE plpgsql;

-- Usuwanie ucznia
CREATE OR REPLACE PROCEDURE remove_student(
    student_id INT
) AS
$$
BEGIN
    DELETE FROM Student WHERE UsersID = student_id;
    DELETE FROM "User" WHERE ID = student_id;
END;
$$ LANGUAGE plpgsql;
