
SELECT gender, breed_group, count(DISTINCT dog_guid) AS num
FROM dogs
WHERE breed_group IS NOT NULL
GROUP BY breed_group, gender
HAVING num>1000
ORDER BY num DESC;

--output the average number of tests completed and average mean inter-test-interval for every breed type, sorted by the average number of completed tests in descending order
SELECT breed, round(avg(total_tests_completed),3) as Avg_Completed, round(avg(median_iti_minutes),3) AS ITI_Minutes
FROM dogs
GROUP BY breed
ORDER BY Avg_Completed DESC;

--Write a query that outputs the average amount of time it took customers to complete each type of test where any individual reaction times over 6000 hours are excluded and only average reaction times that are greater than 0 seconds are included
SELECT test_name, avg(TIMESTAMPDIFF(HOUR, start_time, end_time)) AS Avg_Hours
FROM exam_answers
WHERE TIMESTAMPDIFF(HOUR, start_time, end_time)<6000
GROUP BY test_name
HAVING avg(TIMESTAMPDIFF(SECOND, start_time, end_time))>0
ORDER BY Avg_Hours desc;

--Write a query that outputs the total number of unique User_Guids in each combination of State and ZIP code (postal code) in the United States, sorted first by state name in ascending alphabetical order, and second by total number of unique User_Guids in descending order

SELECT state, zip, COUNT(DISTINCT user_guid) AS num_users
FROM users
WHERE country='US'
GROUP BY state, zip
ORDER BY state, num_users DESC;

--Write a query that outputs the total number of unique User_Guids in each combination of State and ZIP code in the United States that have at least 5 users, sorted first by state name in ascending alphabetical order, and second by total number of unique User_Guids in descending order
SELECT state, zip, COUNT(DISTINCT user_guid) AS num_users
FROM users
WHERE country='US'
GROUP BY state, zip
HAVING num_users>=5
ORDER BY state, num_users DESC;
