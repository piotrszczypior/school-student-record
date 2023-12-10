CREATE TABLE "User" (
  ID       SERIAL NOT NULL,
  Email    varchar(150) NOT NULL UNIQUE,
  Login    varchar(150) NOT NULL UNIQUE,
  Role     varchar(50) NOT NULL,
  Password varchar(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Address (
  ID              SERIAL NOT NULL,
  City            varchar(50) NOT NULL,
  Street          varchar(50) NOT NULL,
  "Post code"     varchar(10) NOT NULL,
  "Street number" int4 NOT NULL,
  "Flat number"   int4 NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Administrator (
  "First name" varchar(50) NOT NULL,
  "Last name"  varchar(50) NOT NULL,
  UsersID      int4 NOT NULL,
  PRIMARY KEY (UsersID),
  CONSTRAINT FK_Administrator_User FOREIGN KEY (UsersID) REFERENCES "User" (ID)
);

CREATE TABLE Class (
  ID   SERIAL NOT NULL,
  Name varchar(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Subject (
  ID   SERIAL NOT NULL,
  Name varchar(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Classroom (
  ID          SERIAL NOT NULL,
  "Room name" varchar(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Teacher (
  "First name"      varchar(50) NOT NULL,
  "Last name"       varchar(50) NOT NULL,
  "Date of birth"   date NOT NULL,
  "Academic degree" varchar(50),
  UsersID           int4 NOT NULL,
  ClassID           int4,
  AddressID         int4 NOT NULL,
  PRIMARY KEY (UsersID),
  CONSTRAINT FK_Teacher_Class FOREIGN KEY (ClassID) REFERENCES Class (ID),
  CONSTRAINT FK_Teacher_Address FOREIGN KEY (AddressID) REFERENCES Address (ID),
  CONSTRAINT FK_Teacher_User FOREIGN KEY (UsersID) REFERENCES "User" (ID)
);

CREATE TABLE Lesson (
  ID             SERIAL NOT NULL,
  Topic          varchar(50),
  CreatedBy      int4 NOT NULL,
  "Date"         date NOT NULL,
  ClassesID      int4 NOT NULL,
  SubjectsID     int4 NOT NULL,
  ClassroomID    int4 NOT NULL,
  TeacherUsersID int4 NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT FK_Lesson_Class FOREIGN KEY (ClassesID) REFERENCES Class (ID),
  CONSTRAINT FK_Lesson_Subject FOREIGN KEY (SubjectsID) REFERENCES Subject (ID),
  CONSTRAINT FK_Lesson_Classroom FOREIGN KEY (ClassroomID) REFERENCES Classroom (ID),
  CONSTRAINT FK_Lesson_Teacher FOREIGN KEY (TeacherUsersID) REFERENCES Teacher (UsersID)
);

CREATE TABLE Student (
  "First name"    varchar(50) NOT NULL,
  "Last name"     varchar(50) NOT NULL,
  "Date of birth" date NOT NULL,
  ClassID       int4 NOT NULL,
  UsersID         int4 NOT NULL,
  AddressID       int4 NOT NULL,
  PRIMARY KEY (UsersID),
  CONSTRAINT FK_Student_Class FOREIGN KEY (ClassesID) REFERENCES Class (ID),
  CONSTRAINT FK_Student_Address FOREIGN KEY (AddressID) REFERENCES Address (ID),
  CONSTRAINT FK_Student_User FOREIGN KEY (UsersID) REFERENCES "User" (ID)
);

CREATE TABLE Attendance (
  ID             SERIAL NOT NULL,
  "Date"         date NOT NULL,
  Present        bool NOT NULL,
  CreatedBy      int4 NOT NULL,
  LessonsID      int4 NOT NULL,
  StudentUsersID int4 NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT FK_Attendance_Lesson FOREIGN KEY (LessonsID) REFERENCES Lesson (ID),
  CONSTRAINT FK_Attendance_Student FOREIGN KEY (StudentUsersID) REFERENCES Student (UsersID)
);

CREATE TABLE Grade (
  ID                     SERIAL NOT NULL,
  "Grade value"          numeric(3, 2) NOT NULL,
  SubjectsID             int4 NOT NULL,
  "Date of modification" date NOT NULL,
  CreatedBy              int4 NOT NULL,
  TeacherUsersID         int4 NOT NULL,
  StudentUsersID         int4 NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT FK_Grade_Subject FOREIGN KEY (SubjectsID) REFERENCES Subject (ID),
  CONSTRAINT FK_Grade_Student FOREIGN KEY (StudentUsersID) REFERENCES Student (UsersID),
  CONSTRAINT FK_Grade_Teacher FOREIGN KEY (TeacherUsersID) REFERENCES Teacher (UsersID)
);

CREATE TABLE Subjects_Teachers (
  SubjectsID     int4 NOT NULL,
  TeacherUsersID int4 NOT NULL,
  PRIMARY KEY (SubjectsID, TeacherUsersID),
  CONSTRAINT FK_SubjectsTeachers_Subject FOREIGN KEY (SubjectsID) REFERENCES Subject (ID),
  CONSTRAINT FK_SubjectsTeachers_Teacher FOREIGN KEY (TeacherUsersID) REFERENCES Teacher (UsersID)
);



