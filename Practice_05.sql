-- EX01
SELECT DISTINCT CITY
FROM STATION 
WHERE id%2=0;

--EX02
SELECT (COUNT(CITY)- COUNT(DISTINCT CITY))
FROM STATION;

--EX04
SELECT 
ROUND(CAST(SUM (order_occurrences * item_count) / SUM(order_occurrences) AS DECIMAL),1)
FROM ITEMS_PER_ORDER

--EX05
SELECT CANDIDATE_ID
FROM CANDIDATES 
WHERE SKILL IN ('Python','Tableau', 'PostgreSQL')
GROUP BY CANDIDATE_ID
HAVING COUNT(SKILL) =3

--EX06
SELECT USER_ID,
DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between
FROM posts
WHERE post_date>='2021-01-01' AND post_date<'2022-01-01'
GROUP BY USER_ID
HAVING COUNT(post_id)>=2

--EX07
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) AS DIFFIRENCE
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY DIFFIRENCE DESC

--EX08
SELECT manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(cogs-total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss DESC

--EX09
SELECT * FROM CINEMA
WHERE id%2=1 AND description !='boring'
ORDER BY rating DESC

--EX10
SELECT teacher_id,
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher 
GROUP BY Teacher_id

--EX11
SELECT user_iD,
COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_iD

--EX12
SELECT Class
FROM Courses 
GROUP BY Class
HAVING COUNT(DISTINCT student) >=5
