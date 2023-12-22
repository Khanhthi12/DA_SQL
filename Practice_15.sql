--EX01
WITH cte AS
(
SELECT 
  product_id,
  extract(year from transaction_date) As round_year,
  Sum(spend) AS curr_year_spend,
  LAG(SUM(spend)) OVER(PARTITION BY product_id order by extract(year from transaction_date)) AS prev_year_spend
FROM user_transactions
Group by product_id, round_year
)
Select round_year,product_id,curr_year_spend, prev_year_spend,
       Round((curr_year_spend - prev_year_spend) / prev_year_spend*100,2) AS yoy_rate
From cte

--EX02
WITH cte AS
(
  SELECT card_name, issued_amount,
  RANK() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS ranke_
  FROM monthly_cards_issued
)
SELECT card_name, issued_amount
FROM cte
WHERE ranke_ = 1
ORDER BY issued_amount DESC

--EX03
with cte as 
(
  SELECT *, 
  rank() over(PARTITION BY user_id order by transaction_date) as rank_
  FROM transactions
)
  select user_id, spend, transaction_date
  from cte where rank_ = 3


--EX04
SELECT a.transaction_date as transaction_date,
       a.user_id as user_id,
       count(product_id) as purchase_count
       
FROM (
SELECT user_id,
       product_id,
       transaction_date,
       DENSE_RANK() OVER (partition by user_id ORDER by transaction_date DESC) as rank
       FROM user_transactions
) As a

WHERE a.rank = 1
GROUP BY a.transaction_date,a.user_id

--EX05 ( Em chạy bị lỗi nhờ anh chị sửa lại giùm em nhé)
SELECT 
  a.user_id,
  a.tweet_date, 
  ROUND(AVG(b.tweet_count),2)
FROM tweets As a
INNER JOIN tweets b ON a.user_id = b.user_id
WHERE 
  a.tweet_date >= b.tweet_date AND (a.tweet_date - b.tweet_date) < 3
GROUP BY a.user_id, b.tweet_date
ORDER BY a.user_id, a.tweet_date
  
--EX06
WITH cte AS 
(
   SELECT
  (LEAD(transaction_timestamp) 
   OVER(PARTITION BY merchant_id, credit_card_id, 
   amount ORDER BY transaction_timestamp) - transaction_timestamp) AS timestamp_a
   FROM transactions)

SELECT
  COUNT(*) AS payment_count
FROM cte
WHERE EXTRACT(MINUTE FROM timestamp_a) <= 10
      AND EXTRACT(MINUTE FROM timestamp_a) >= -10
      AND EXTRACT(HOUR FROM timestamp_a) = 0

--EX07
SELECT category, product, total 
FROM (
    SELECT category, product, 
    SUM(spend) AS total,
    RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS ranking 
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product
    ) AS ranked_spending
WHERE ranking <= 2 
ORDER BY category, ranking

--EX08
WITH cte AS 
(
  SELECT a.artist_name,
    RANK() OVER (ORDER BY COUNT(b.song_id) DESC) AS artist_rank
  FROM artists As a
  INNER JOIN songs As b ON a.artist_id = b.artist_id
  INNER JOIN global_song_rank AS c ON b.song_id = c.song_id
  WHERE c.rank <= 10
  GROUP BY a.artist_name
)
SELECT artist_name, artist_rank
FROM cte
WHERE artist_rank <= 5

