SELECT
    c.code,
    c.name AS course,
    COUNT(e.student_id) AS total_enrolled
FROM courses c
INNER JOIN enrollments e ON c.id = e.course_id
WHERE e.status <> 'withdrawn'
GROUP BY c.id, c.code, c.name
ORDER BY total_enrolled DESC
LIMIT 3;

SELECT
    s.name AS student,
    COUNT(DISTINCT c.department_id) AS num_departments
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
INNER JOIN courses c     ON e.course_id = c.id
GROUP BY s.id, s.name
HAVING COUNT(DISTINCT c.department_id) >= 2
ORDER BY num_departments DESC;

SELECT
    d.name AS department,
    COUNT(DISTINCT p.id) AS num_professors,
    COUNT(DISTINCT c.id) AS num_courses,
    COUNT(DISTINCT e.student_id) AS unique_students
FROM departments d
LEFT JOIN professors p  ON d.id = p.department_id
LEFT JOIN courses c     ON d.id = c.department_id
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY d.id, d.name
ORDER BY num_professors DESC;
