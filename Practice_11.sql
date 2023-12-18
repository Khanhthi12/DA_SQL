--EX01
Select a.continent, 
Round(avg(b.Population),0) 
From city as b
Inner join country as a
on b.CountryCode = a.Code
group by a.continent

--EX02
SELECT b.email_id, a.email_id
FROM emails As a
LEFT JOIN texts As b
ON a.email_id = b.email_id AND b.signup_action = 'Confirmed'

--EX03
select age_bucket, 
ROUND((SUM(CASE 
           WHEN activity_type='send' then time_spent else 0 
           end)/SUM(time_spent))*100.0,2) as send_perc, 
ROUND((SUM(CASE 
           WHEN activity_type='open' then time_spent else 0 
           end)/sum(time_spent))*100.0,2) as open_perc
from activities as a
inner join age_breakdown as b
on a.user_id = b.user_id
where a.activity_type in ('send','open')
group by age_bucket

--EX04
SELECT 
  a.customer_id
FROM customer_contracts AS a
LEFT JOIN products as b
ON a.product_id = b.product_id
GROUP BY a.customer_id
HAVING COUNT(DISTINCT b.product_category) >= 3;

--EX05
select a.reports_to,
       b.name,
       count(a.reports_to) as reports_count,
       round(avg(a.age),0) as average_age
from employees as a
join employees as b
on a.reports_to = b.employee_id
group by a.reports_to
order by a.reports_to

--EX06
select a.product_name, 
sum(unit) as unit
from Products as a
left join Orders as b
on a.product_id = b.product_id
where b.order_date between '2020-02-01' and '2020-02-29'
group by a.product_id
having sum(unit) >= 100

--EX07
SELECT a.page_id
FROM pages as a
left join page_likes as b
on a.page_id = b.page_id 
where b.liked_date is null
order by a.page_id;
