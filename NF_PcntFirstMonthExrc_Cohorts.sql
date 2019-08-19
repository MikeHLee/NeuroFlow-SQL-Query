/*Note: This exercise proved very difficult for me, as I usually like to run each piece of code
as it's written in order to verify along the way that what I'm acutally building works the way
it is supposed to. With nothing to go off of besides what syntax should work in theory, this may
not be 100% correct. To view some of the SQL work I've done for you guys previously, please take
a look at this dashboard: https://qa.neuroflow.io:3000/dashboard/68
*/

SELECT users.user_id, users.created_at, 
exercises.questionnaire_id, exercises.user_id, exercises.exercise_completion_date, /* Get columns to work with.*/

(SELECT date_trunc('month', created_at) , count(0) /* Subquery: Count user IDs created in month...*/
FROM exercises
INNER JOIN users ON users.user_id = exercises.user_id /* ...from the two tables joined by user_id...*/
WHERE date_trunc('month', exercise_completion_date) = date_trunc('month', created_at))/* ... which have an exercise completed in same unique month that user was created.*/ 
/ /* Now, divide this by... */
(SELECT date_trunc('month', created_at) , count(0) /* The total number of user IDs in that month... */
FROM exercises
INNER JOIN users ON users.user_id = exercises.user_id) /*...counted from the same joined tables*/

GROUP BY date_trunc('month', datetime_created) 
/* group these ID's into cohorts based on the months the user was created list them starting with the most recent month, as that is the most relevant */



