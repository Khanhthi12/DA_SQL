--EX01
Select 
Name
From Students
Where Marks >75
Order by Right( Name, 3), ID

--EX02
Select user_id, 
concat(upper(left(name,1)),lower(substring(name,2))) AS name
From Users 
Order by user_id

--EX03
SELECT manufacturer,
concat('$',Round(Sum(total_sales)/1000000,0),'million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer 
ORDER BY Sum(total_sales) DESC, manufacturer

--EX04
SELECT 
product_id,
EXTRACT(MONTH FROM submit_date) AS mth,
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY mth, product_id
ORDER BY mth, product_id

--EX05
SELECT
sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date)=8
AND EXTRACT(YEAR FROM sent_date)=2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2

--EX06
Select
tweet_id
from Tweets
Where length(content) >15

--EX07
Select 
activity_date as day, 
Count(distinct(user_id)) as active_users
From Activity
where activity_date between "2019-06-28" and "2019-07-27"
group by activity_date

--EX08
Select
Count (employee_id) as Number_employee
from employees
where Extract( moth from joining_date) between 1 to 7
And Extract (year from joining_date)=2022

--EX09
select  
first_name,
Position ('a' IN first_name)
from worker
where first_name = 'Amitah'

--EX10
select 
Substring(title, length(winery)+2,4)
from winemag_p2
Where country = 'Macedonia'

  


