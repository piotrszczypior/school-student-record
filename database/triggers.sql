-- Automatyczne obliczanie średniej oceny ucznia
CREATE OR REPLACE FUNCTION calculate_avg_grade()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO StudentAverageGrade ("StudentUsersID", "Average grade")
    VALUES (NEW.StudentUsersID, NEW."Grade value")
    ON CONFLICT ("StudentUsersID") DO UPDATE
    SET "Average grade" = EXCLUDED."Average grade";

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER avg_grade_trigger
AFTER INSERT
ON Grade
FOR EACH ROW
EXECUTE FUNCTION calculate_avg_grade();

-- Aktualizacja daty modyfikacji przy zmianie oceny
CREATE OR REPLACE FUNCTION update_grade_modification_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW."Date of modification" = CURRENT_DATE;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_date_trigger
BEFORE UPDATE
ON Grade
FOR EACH ROW
EXECUTE FUNCTION update_grade_modification_date();

-- Sprawdzanie poprawności oceny
CREATE OR REPLACE FUNCTION check_grade_validity()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW."Grade value" < 2.0 OR NEW."Grade value" > 5.0 THEN
        RAISE EXCEPTION 'Invalid grade value. Grade must be between 2.0 and 5.0';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_grade_trigger
BEFORE INSERT OR UPDATE
ON Grade
FOR EACH ROW
EXECUTE FUNCTION check_grade_validity();

-- Automatyczne ustawianie obecności
CREATE OR REPLACE FUNCTION set_attendance_default()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Attendance ("Date", Present, LessonsID, StudentUsersID)
    SELECT NEW."Date", FALSE, NEW.ID, s.UsersID
    FROM Student s WHERE s.ClassID = NEW.ClassID;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_attendance_trigger
AFTER INSERT
ON Lesson
FOR EACH ROW
EXECUTE FUNCTION set_attendance_default();
