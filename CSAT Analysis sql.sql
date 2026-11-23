select * from CSAT;

SELECT COUNT(*) AS Total_Calls
FROM CSAT;

-- 2.	Create line Chart for the call trends.
SELECT
    STR_TO_DATE(call_timestamp, '%m/%d/%Y') AS call_date,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY call_date
ORDER BY call_date;

-- OR
SELECT
    COALESCE(
        STR_TO_DATE(call_timestamp, '%m/%d/%Y'),
        STR_TO_DATE(call_timestamp, '%m-%d-%Y')
    ) AS call_date,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY call_date
ORDER BY call_date;

-- 3.	Create a doughnut chart for the Call channel.
SELECT
    channel,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY channel
ORDER BY total_calls DESC;

-- 4.	Create a map for the states.
SELECT
    state,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY state
ORDER BY total_calls DESC;

-- 5.	Create a column chart for the reason of calling.
SELECT
    reason,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY reason
ORDER BY total_calls DESC;

-- 6.	Create a bar chart for the response time.
SELECT
    response_time,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY response_time
ORDER BY total_calls DESC;

-- 7.	Analyze all the features and derive multiple insights.
-- CSAT score analysis
SELECT csat_score, COUNT(*) AS total_calls
FROM CSAT
GROUP BY csat_score
ORDER BY csat_score;

-- Call reason analysis
SELECT reason, COUNT(*) AS total_calls
FROM CSAT
GROUP BY reason
ORDER BY total_calls DESC;

-- Channel analysis
SELECT channel, COUNT(*) AS total_calls
FROM CSAT
GROUP BY channel
ORDER BY total_calls DESC;

-- Response-time analysis
SELECT response_time, COUNT(*) AS total_calls
FROM CSAT
GROUP BY response_time
ORDER BY total_calls DESC;

-- State-wise analysis
SELECT state, COUNT(*) AS total_calls
FROM CSAT
GROUP BY state
ORDER BY total_calls DESC;

-- Call duration analysis
SELECT
    ROUND(AVG(call_duration_in_minutes), 2) AS avg_call_duration,
    MAX(call_duration_in_minutes) AS longest_call,
    MIN(call_duration_in_minutes) AS shortest_call
FROM CSAT;

-- Daily call trends
SELECT
    COALESCE(
        STR_TO_DATE(call_timestamp, '%m/%d/%Y'),
        STR_TO_DATE(call_timestamp, '%m-%d-%Y')
    ) AS call_date,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY call_date
ORDER BY call_date;

-- City-wise call analysis
SELECT city, COUNT(*) AS total_calls
FROM CSAT
GROUP BY city
ORDER BY total_calls DESC
LIMIT 10;

-- Call volume by call center
SELECT call_center, COUNT(*) AS total_calls
FROM CSAT
GROUP BY call_center
ORDER BY total_calls DESC;

-- Average CSAT by response time
SELECT
    response_time,
    ROUND(AVG(csat_score), 2) AS avg_csat,
    COUNT(*) AS total_calls
FROM CSAT
GROUP BY response_time
ORDER BY avg_csat DESC;