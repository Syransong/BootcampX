const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// Have complete control over queryString
const queryString = `
SELECT DISTINCT teachers.name AS teacher, cohorts.name as cohort
FROM assistance_requests
JOIN teachers on teacher_id = teachers.id
JOIN students on student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
`;

// storing the value that comes from outside
const value = [process.argv[2] || 'JUL02'];

pool
  .query(queryString, value)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    })
  }).catch(err => console.error('query error', err.stack));