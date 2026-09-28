-- 03_attendance_by_month.sql
-- Question 
-- does attrndence decline as the course proress?

SELECT
	date_format(session_date,'%y-%M') AS month,
		ROUND(
			100 * SUM(status IN ('present','Late')) / COUNT(*),
            1
		)AS attendance_rate,
        COUNT(*) AS total_sessions
        FROM attendance
        WHERE status <> 'Not Recorded'
        GROUP BY month;
        
        
        
        
	
