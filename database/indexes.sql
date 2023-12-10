CREATE INDEX idx_teacher_firstname_lastname ON Teacher ("First name", "Last name");

CREATE INDEX idx_student_firstname_lastname ON Student ("First name", "Last name");
CREATE INDEX idx_student_classid ON Student (ClassID);

CREATE INDEX idx_grade_dateofmodification ON Grade ("Date of modification");

CREATE INDEX idx_lesson_date ON Lesson ("Date");
CREATE INDEX idx_lesson_teacheruserid ON Lesson (TeacherUsersID);
CREATE INDEX idx_lesson_classid_subjectsid ON Lesson (ClassID, SubjectsID);

CREATE INDEX idx_attendance_date ON Attendance ("Date");

CREATE INDEX idx_address_city ON Address (City);
CREATE INDEX idx_address_postcode ON Address ("Post code");

CREATE INDEX idx_teacher_academicdegree ON Teacher ("Academic degree");
