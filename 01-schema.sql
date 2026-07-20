-- 1. Departamentos
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    budget DECIMAL(12, 2),
    founding_date DATE
);

-- 2. Profesores (con jefe — relación recursiva: SELF FK)
CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    department_id INT,
    manager_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (manager_id) REFERENCES professors(id)
);

-- 3. Estudiantes
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    birth_date DATE,
    enrollment_date DATE,
    gpa DECIMAL(4, 2),
    status ENUM('active', 'graduated', 'withdrawn') DEFAULT 'active'
);

-- 4. Cursos (cada curso impartido por un profesor, en un departamento)
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    professor_id INT,
    department_id INT NOT NULL,
    max_capacity INT DEFAULT 30,
    semester VARCHAR(10),
    FOREIGN KEY (professor_id) REFERENCES professors(id),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- 5. Inscripciones (N:M entre estudiantes y cursos — PK compuesta, como en Week 3)
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    grade DECIMAL(4, 2) CHECK (grade >= 0 AND grade <= 10),
    status ENUM('enrolled', 'passed', 'failed', 'withdrawn') DEFAULT 'enrolled',
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);
