--EX01
WITH job_count AS 
(
 SELECT
 company_id,
 title,
 description,
 COUNT(job_id) AS So_luong
 FROM job_listings
 GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count
WHERE So_luong > 1

--EX02: EM LÀM CHƯA RA BÀI NÀY MỌI NGƯỜI CHỈ LẠI EM NHÉ 

--EX03
WITH call_records AS 
(
SELECT
  policy_holder_id,
  COUNT(case_id) AS call_count
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >= 3
)
SELECT COUNT(policy_holder_id) AS member_count
FROM call_records

--EX04
SELECT  page_id
FROM  pages As a
WHERE NOT EXISTS 
(
SELECT page_id
FROM page_likes AS b
WHERE a.page_id = b.page_id
Group by page_id
)

--EX05
With CTE as 
(
SELECT  
user_id	
from user_actions 
where EXTRACT(month from event_date) in (6,7) 
And Extract (year from event_date) = 2022 
GROUP BY user_id 
having count(DISTINCT EXTRACT(month from event_date)) = 2
)
SELECT 
7 AS mth, 
COUNT(*) AS monthly_active_users
FROM CTE

--EX06: GIÚP EM GIẢI BÀI NÀY NHÉ, EM VIẾT CODE BỊ LỖI Ạ

--EX07
WITH Product_OF_FY AS 
(
    SELECT product_id, 
    min(year) AS first_year
    FROM Sales
    GROUP BY product_id
)
SELECT a.product_id, b.first_year, a.quantity, a.price
FROM Sales AS a
INNER JOIN Product_OF_FY AS b 
ON a.product_id = b.product_id
AND a.year = b.first_year

--EX08
select customer_id
from Customer
group by customer_id
having count(distinct product_key) IN (select count(distinct product_key) from Product)

--EX09
SELECT employee_id 
FROM Employees
WHERE manager_id not in 
(
    select employee_id 
    from Employees
) and salary < 30000
order by employee_id

--EX10 TRÙNG BÀI 1 Ạ 

--EX11
SELECT user_name AS results 
FROM
(
SELECT B.name AS user_name, 
COUNT(*) AS counts 
FROM MovieRating AS C
INNER JOIN Users AS B
on B.user_id = C.user_id
GROUP BY C.user_id
ORDER BY counts DESC, user_name ASC LIMIT 1
) AS NUMBER1
UNION
SELECT movie_name AS results 
FROM
(
SELECT A.title AS movie_name, 
AVG(D.rating) AS rate 
FROM MovieRating AS D
INNER JOIN Movies AS A
on A.movie_id = D.movie_id
WHERE SUBSTRING(d.created_at, 1, 7) = '2020-02'
GROUP BY D.movie_id
ORDER BY rate DESC, movie_name ASC LIMIT 1
) AS NUMBER2

--EX12
SELECT id, 
COUNT(*) AS num 
FROM 
(
    SELECT 
    requester_id AS id 
    FROM RequestAccepted
    UNION ALL 
    SELECT accepter_id 
    FROM RequestAccepted
) AS friends_number
GROUP BY id
ORDER BY num DESC LIMIT 1
