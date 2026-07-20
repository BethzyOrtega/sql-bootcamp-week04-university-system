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

