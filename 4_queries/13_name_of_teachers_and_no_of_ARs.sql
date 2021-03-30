SELECT teachers.name AS teacher, cohorts.name as cohort, COUNT(*) AS total_assistances
FROM assistance_requests
JOIN teachers on teacher_id = teachers.id
JOIN students on student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;

-- tutorial solution:
-- SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
-- FROM teachers
-- JOIN assistance_requests ON teacher_id = teachers.id
-- JOIN students ON student_id = students.id
-- JOIN cohorts ON cohort_id = cohorts.id
-- WHERE cohorts.name = 'JUL02'
-- GROUP BY teachers.name, cohorts.name
-- ORDER BY teacher;
