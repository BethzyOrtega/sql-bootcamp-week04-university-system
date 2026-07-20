-- Departamentos (5)
INSERT INTO departments (name, budget, founding_date) VALUES
    ('Computer Science', 5000000.00, '1998-08-15'),
    ('Mathematics',      3500000.00, '1995-01-10'),
    ('Physics',          4200000.00, '1995-01-10'),
    ('Humanities',       2000000.00, '2005-03-22'),
    ('Biology',          3800000.00, '2000-09-01');

-- Profesores (11) — id 1, 2, 6, 8, 9 son jefes de depto (manager_id NULL)
INSERT INTO professors (name, email, department_id, manager_id, salary, hire_date) VALUES
    ('Dr. Robert Mendez',   'rmendez@uni.edu',   1, NULL, 95000, '2010-08-01'),  -- 1  Jefe Computer Science
    ('Dr. Sara Lopez',      'slopez@uni.edu',    2, NULL, 92000, '2008-01-15'),  -- 2  Jefa Mathematics
    ('Dr. Michael Vega',    'mvega@uni.edu',     1,    1, 78000, '2015-03-10'),  -- 3
    ('Dr. Anna Torres',     'atorres@uni.edu',   1,    1, 76000, '2017-09-05'),  -- 4
    ('Dr. Charles Ruiz',    'cruiz@uni.edu',     2,    2, 72000, '2018-02-12'),  -- 5
    ('Dr. Elena Martinez',  'emartinez@uni.edu', 3, NULL, 88000, '2012-08-20'),  -- 6  Jefa Physics
    ('Dr. Felix Castro',    'fcastro@uni.edu',   3,    6, 70000, '2019-01-15'),  -- 7
    ('Dr. Gabrielle Perez', 'gperez@uni.edu',    4, NULL, 75000, '2014-09-01'),  -- 8  Jefa Humanities
    ('Dr. Hector Silva',    'hsilva@uni.edu',    5, NULL, 80000, '2013-08-15'),  -- 9  Jefe Biology
    ('Dr. Isabel Ramos',    'iramos@uni.edu',    5,    9, 68000, '2020-03-01'),  -- 10
    ('Dr. James Nunez',     'jnunez@uni.edu',    4,    8, 65000, '2021-09-10');  -- 11

-- Estudiantes (12)
INSERT INTO students (name, email, birth_date, enrollment_date, gpa, status) VALUES
    ('Alice Garcia',    'agarcia@uni.edu',    '2002-05-15', '2020-08-20', 8.5,  'active'),
    ('Brian Hernandez', 'bhernandez@uni.edu', '2001-11-22', '2020-08-20', 7.2,  'active'),
    ('Carol Ruiz',      'cruiz.stu@uni.edu',  '2003-03-10', '2021-08-20', 9.1,  'active'),
    ('Daniel Torres',   'dtorres@uni.edu',    '2002-07-08', '2020-08-20', 8.8,  'active'),
    ('Emma Lopez',      'elopez.stu@uni.edu', '2001-12-30', '2019-08-20', 9.5,  'graduated'),
    ('Frank Salinas',   'fsalinas@uni.edu',   '2003-04-25', '2021-08-20', 6.8,  'active'),
    ('Grace Mendez',    'gmendez@uni.edu',    '2002-09-12', '2020-08-20', 8.2,  'active'),
    ('Hugo Vega',       'hvega@uni.edu',      '2003-06-18', '2022-08-20', 7.9,  'active'),
    ('Irene Castro',    'icastro@uni.edu',    '2001-10-05', '2019-08-20', 5.5,  'withdrawn'),
    ('Jacob Nunez',     'jnunez.stu@uni.edu', '2002-08-29', '2020-08-20', 8.0,  'active'),
    ('Karla Romero',    'kromero@uni.edu',    '2003-01-17', '2022-08-20', NULL, 'active'),  -- sin GPA
    ('Lucas Aguilar',   'laguilar@uni.edu',   '2004-02-22', '2023-08-20', NULL, 'active');  -- nuevo, sin notas

-- Cursos (12) — COMP401 sin profesor asignado (professor_id NULL)
INSERT INTO courses (code, name, credits, professor_id, department_id, max_capacity, semester) VALUES
    ('COMP101', 'Introduction to Programming', 4, 1,    1, 30, '2026-1'),
    ('COMP201', 'Data Structures',             4, 3,    1, 25, '2026-1'),
    ('COMP301', 'Databases',                   4, 4,    1, 25, '2026-1'),
    ('MATH101', 'Differential Calculus',       5, 2,    2, 35, '2026-1'),
    ('MATH201', 'Linear Algebra',              4, 5,    2, 30, '2026-1'),
    ('PHYS101', 'General Physics',             4, 6,    3, 30, '2026-1'),
    ('PHYS202', 'Quantum Mechanics',           5, 7,    3, 20, '2026-1'),
    ('HUMA101', 'Contemporary Philosophy',     3, 8,    4, 40, '2026-1'),
    ('HUMA201', 'Latin American Literature',   3, 11,   4, 40, '2026-1'),
    ('BIOL101', 'Cell Biology',                4, 9,    5, 28, '2026-1'),
    ('BIOL202', 'Molecular Genetics',          5, 10,   5, 22, '2026-1'),
    ('COMP401', 'Distributed Systems',         4, NULL, 1, 20, '2026-1');  -- sin profesor asignado

-- Inscripciones (27) — N:M estudiante ↔ curso
INSERT INTO enrollments (student_id, course_id, grade, status) VALUES
    (1, 1, 9.0,  'passed'),   (1, 4, 8.5,  'passed'),   (1, 6, NULL, 'enrolled'),  -- Alice
    (2, 1, 7.0,  'passed'),   (2, 4, 6.5,  'failed'),   (2, 8, NULL, 'enrolled'),  -- Brian
    (3, 1, 9.5,  'passed'),   (3, 2, 9.0,  'passed'),   (3, 3, NULL, 'enrolled'),
    (3, 4, 9.8,  'passed'),                                                         -- Carol
    (4, 1, 8.5,  'passed'),   (4, 2, 9.0,  'passed'),   (4, 3, NULL, 'enrolled'),  -- Daniel
    (5, 1, 9.5,  'passed'),   (5, 2, 9.8,  'passed'),   (5, 3, 9.5,  'passed'),
    (5, 4, 10.0, 'passed'),                                                         -- Emma (graduada)
    (6, 4, 5.5,  'failed'),   (6, 8, 7.0,  'passed'),                               -- Frank
    (7, 6, 8.5,  'passed'),   (7, 7, NULL, 'enrolled'),                             -- Grace
    (8, 1, NULL, 'enrolled'), (8, 4, NULL, 'enrolled'),                             -- Hugo
    -- Irene (withdrawn): sin inscripciones, a propósito
    (10, 8, 7.5, 'passed'),   (10, 9, NULL, 'enrolled'),                            -- Jacob
    (11, 1, NULL, 'enrolled'), (11, 4, NULL, 'enrolled');                           -- Karla
    -- Lucas: sin inscripciones todavía (recién ingresó)
