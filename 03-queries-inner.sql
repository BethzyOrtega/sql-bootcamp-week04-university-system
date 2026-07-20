select p.name, d.name from professors p
join departments d on p.department_id = d.id

select c.code, c.name as curso, p.name as profesor , d.name as departamento from courses c
inner join professors p on c.professor_id = p.id
inner join departments d on c.department_id = d.id

SELECT s.name AS student, e.grade, e.status
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
INNER JOIN courses c     ON e.course_id = c.id
WHERE c.code = 'MATH101'
  AND e.grade IS NOT NULL
ORDER BY e.grade DESC;

SELECT s.name AS student, e.grade, e.status
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
INNER JOIN courses c     ON e.course_id = c.id
WHERE c.code = 'MATH101'
  AND e.grade IS NOT NULL
ORDER BY e.grade DESC;
