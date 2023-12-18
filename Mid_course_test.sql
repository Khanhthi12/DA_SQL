--EX01
Select Distinct Replacement_cost
from film
Order by Replacement_cost ASC

--EX02
Select Count(replacement_cost),
Case 
    When replacement_cost < 20 then 'low'
    When replacement_cost < 25 then 'medium'
    Else 'high'
End as category
From film
Group by category 

--EX03
Select title, length, c.name
From film as a
Inner join film_category as b
On a.film_id = b.film_id
Inner join category as c
On b.category_id = c.category_id
Where c.name in ('Drama','Sports')
Order by length Desc

--EX04
Select c.name,
       Count(title) As So_luong
From film as a
Inner join film_category as b
On a.film_id = b.film_id
Inner join category as c
On b.category_id = c.category_id
Group by c.name
Order by So_luong Desc

--EX05
Select a.first_name, a.last_name,
       Count (title) as So_luong
From actor a
Inner join film_actor b
On a.actor_id = b.actor_id
Inner join film as c
On b.film_id = c.film_id
Group by a.first_name, a.last_name
Order by So_luong Desc

--EX06
Select 
Count (*) as So_luong
From address a
Left join customer b
On a.address_id = b.address_id
Where first_name is Null

--EX07
Select City,
Sum (amount) As Total
From payment As a
Inner join customer As b
On a.customer_id = b.customer_id
Inner join address As c
On c.address_id = b.address_id
Inner join city As d
On d.city_id = c.city_id
Group by city
Order by Total Desc

--EX08
Select city, country,
       Sum (amount) As Total
From payment As a
Inner join customer As b
On a.customer_id = b.customer_id
Inner join address As c
On c.address_id = b.address_id
Inner join city As d
On d.city_id = c.city_id
Inner join country e 
On e.country_id =d.country_id
Group by city, country
Order by Total Desc
