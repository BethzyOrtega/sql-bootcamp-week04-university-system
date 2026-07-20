SELECT
    p.name AS professor,
    COALESCE(m.name, 'No manager') AS manager
FROM professors p
LEFT JOIN professors m ON p.manager_id = m.id
ORDER BY p.name;

SELECT
    p.name AS professor,
    p.salary AS professor_salary,
    m.name AS manager,
    m.salary AS manager_salary
FROM professors p
INNER JOIN professors m ON p.manager_id = m.id
WHERE p.salary > m.salary;

SELECT
    p1.name AS professor_a,
    p2.name AS professor_b,
    d.name AS department
FROM professors p1
INNER JOIN professors p2
    ON p1.department_id = p2.department_id
   AND p1.id < p2.id
INNER JOIN departments d ON p1.department_id = d.id
ORDER BY d.name, p1.name, p2.name;
