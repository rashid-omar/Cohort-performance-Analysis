-- 04_attendance_by_Course_progress.sql
-- Question
-- At what point in a course does attendance start to fall?
-- Courses have different lengths, so we divide each course
-- into 10 parts and compare attendance across those parts.

-- 0 = beginning, 5 = middle, 9 = end
 WITH Course_dates AS (
	
    -- find the first and the last class date for each course and cohort.
    SELECT
    e.course_id,
    e.cohort_id,
		MIN(a.session_date) AS first_date,
		MAX(a.session_date) AS last_date
   FROM enrolments e
   JOIN attendance a ON e.enrolment_id = a.enrolment_id
   GROUP BY e.course_id, e.cohort_id
   ),
   Course_progress AS (