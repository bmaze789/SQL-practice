CREATE temporary TABLE totals
select user, count(*) AS completed
FROM Tasks
WHERE (complete_date BETWEEN '2019-03-01 00:00:00' AND '2019-03-31 23:59:59') AND (status='complete')
GROUP BY user;

#joins the task and errors by the ids so I can get dates of the the errors
CREATE temporary TABLE errors_task 
SELECT t.user, count(*) as num_errors, sum(q.value) AS points
from Tasks t INNER JOIN QA_Errors q ON (t.id=q.task_ref_id)
WHERE (t.complete_date BETWEEN  '2019-03-01 00:00:00' AND '2019-03-28') AND (t.status='complete')
GROUP BY t.user;
########################################

select t.user, t.completed, concat(Format(((t.completed-e.num_errors)/t.completed)*100, 2), '%') AS '% Perfect', concat(format((e.points/t.completed),2),'%') AS 'Score Percentage'
FROM totals t INNER JOIN errors_task e ON (user)
ORDER BY t.user;

DROP TABLE errors_task;
DROP TABLE totals;
