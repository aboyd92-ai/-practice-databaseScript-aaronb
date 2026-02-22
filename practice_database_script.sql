create Database if not exists practice_database;
USE practice_database;
START TRANSACTION;

DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;

CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor VARCHAR(100)
);

CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student (first_name, last_name, email)
VALUES
('Aaron', 'Boyd', 'aaron@example.com'),
('Sarah', 'Johnson', 'sarah@example.com');

INSERT INTO Course (course_name, instructor)
VALUES
('Database Systems', 'Dr. Smith'),
('Web Development', 'Prof. Lee');

INSERT INTO Enrollment (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-02-01'),
(1, 2, '2026-02-02'),
(2, 1, '2026-02-03');

COMMIT;