--EX01
SELECT 
sum (Case 
     When device_type = 'laptop' Then 1 ELSE 0 
     End) As laptop_views,
sum (Case 
     When device_type In ('tablet', 'phone') Then 1 ELSE 0 
     End) As mobile_views 
FROM viewership;

--EX02
Select 
x, y, z,
Case 
    When x+y>z And x+z>y And y+z>x then 'Yes'
    Else 'No'
End triangle
From Triangle

--EX03 (Giúp em sửa và giải thích bài tập này giúp em với ạ, em làm bị lỗi nên em có tham khảo những bài khác nhưng chưa rõ lắm ạ)
SELECT
    ROUND(SUM(CASE 
              WHEN call_category IS NULL Or call_category = 'n/a' THEN 1
              ELSE 0
              END) 
          * 100.0 / COUNT(case_id), 1)
FROM callers
  
--EX04
Select Name 
From Customer
Where COALESCE(referee_id, 0) <> 2

--EX05
Select survived,
Sum (Case When pclass = 1 Then 1 Else 0 
     End) AS first_class,
Sum (CASE When pclass = 2 Then 1 Else 0 
     END) AS second_class,
Sum (CASE When pclass = 3 Then 1 Else 0 
    END) AS third_class
FROM titanic
GROUP BY survived
