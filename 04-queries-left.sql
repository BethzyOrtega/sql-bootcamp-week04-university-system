Select c.code, c.name, COALESCE(p.name, '(unassigned)') AS professor from courses c
left join professors p on c.professor_id=p.id
order by c.code asc

select s.id, s.name, count(e.course_id) as cant_cursos  from students s
left join enrollments e on s.id = e.student_id
group by s.id, s.name
ORDER BY cant_cursos DESC, s.name;

SELECT s.name, e.course_id, e.status
FROM students s
LEFT JOIN enrollments e
    ON s.id = e.student_id AND e.status = 'passed'
ORDER BY s.name, e.course_id;

SELECT p.name, d.name AS department
FROM professors p
LEFT JOIN courses c      ON p.id = c.professor_id
INNER JOIN departments d ON p.department_id = d.id
WHERE c.id IS NULL
ORDER BY p.name;

select d.name, COUNT(DISTINCT p.id) as num_prof, COUNT(DISTINCT c.id) as cant_cursos from departments d
left join professors p on d.id = p.department_id
left join courses c on d.id = c.department_id
group by d.name;

select s.id, s.name, c.code, e.status from students s
inner join enrollments e on s.id = e.student_id
inner join courses c on e.course_id = c.id;
select * from courses;
select* from departments;

SELECT
    s.name AS student,
    c.name AS course,
    p.name AS professor
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
INNER JOIN courses c     ON e.course_id = c.id
INNER JOIN departments d ON c.department_id = d.id
LEFT JOIN professors p   ON c.professor_id = p.id
WHERE d.name = 'Computer Science'
ORDER BY s.name, c.code;
