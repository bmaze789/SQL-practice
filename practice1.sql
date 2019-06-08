
--
SELECT dog_guid, start_time, end_time, timestampdiff(minute,start_time, end_time) AS Duration
FROM exam_answers
LIMIT 10;

--What is the average amount of time it took customers to complete all of the tests in the exam_answers table, if you do not exclude any data (the answer will be approximately 587 minutes)?
SELECT round(avg(timestampdiff(minute,start_time, end_time)), 2)
FROM exam_answers;

--What is the average amount of time it took customers to complete the "Treat Warm-Up" test, according to the exam_answers table (about 165 minutes, if no data is excluded)?
SELECT avg(timestampdiff(minute,start_time, end_time)) AS average_time
FROM exam_answers
WHERE test_name='Treat Warm-Up';

--How many possible test names are there in the exam_answers table?
SELECT count(DISTINCT test_name)
FROM exam_answers;

--What is the minimum and maximum value in the Duration column of your query that included the data from the entire table?
SELECT max(timestampdiff(minute,start_time, end_time)) as maxmum, min(timestampdiff(minute,start_time, end_time)) as minimum
FROM exam_answers;

--How many of these negative Duration entries are there?
SELECT count(timestampdiff(minute,start_time, end_time)) 
FROM exam_answers
WHERE timestampdiff(minute,start_time, end_time) < 0;

--How would you query all the columns of all the rows that have negative durations so that you could examine whether they share any features that might give you clues about what caused the entry mistake?
SELECT  *
FROM exam_answers
WHERE (timestampdiff(minute,start_time, end_time))<0;

--What is the average amount of time it took customers to complete all of the tests in the exam_answers table when the negative durations are excluded from your calculation?
SELECT avg(timestampdiff(minute,start_time, end_time))
FROM exam_answers
WHERE timestampdiff(minute,start_time, end_time)>0;
