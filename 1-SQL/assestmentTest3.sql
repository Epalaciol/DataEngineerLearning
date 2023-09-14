CREATE TABLE students(
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  homeroom_number integer,
  phone VARCHAR(20) UNIQUE NOT NULL,
  email VARCHAR(115) UNIQUE,
  graduation_year integer 
);

CREATE TABLE teachers(
  teacher_id SERIAL PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  homeroom_number integer,
  department VARCHAR(100), 
  phone VARCHAR(20) UNIQUE,
  email VARCHAR(115) UNIQUE
);

INSERT INTO students (first_name, last_name, homeroom_number, phone, graduation_year) VALUES('Mark', 'Watney', 5,'777-555-1234', 2035);

INSERT INTO teachers (first_name, last_name, homeroom_number, department, phone, email) VALUES('Jonas', 'Salk', 5, 'Biology', '777-555-1234', 'jsalk@school.org');

