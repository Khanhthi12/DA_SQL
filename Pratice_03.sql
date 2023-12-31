--EX01
SELECT NAME
FROM CITY
WHERE CountryCode = 'USA' AND Population > 120000;

--EXO2
SELECT * 
fROM CITY
WHERE CountryCode ='JPN';

--EX03
SELECT DISTINCT CITY, STATE
FROM STATION;

--EX04
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' 
OR CITY LIKE 'U%';

--EX05
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE '%A' or CITY LIKE '%E' or CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U';

--EX06
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND CITY NOT LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%';

--EX07
SELECT NAME 
FROM EMPLOYEE 
ORDER BY NAME ASC 

--EX08
SELECT NAME
FROM EMPLOYEE
WHERE SALARY >2000 AND MONTHS <10
ORDER BY EMPLOYEE_ID; 

--EX09
SELECT product_id 
FROM PRODUCTS 
WHERE LOW_FATS = 'Y' AND RECYCLABLE = 'Y'

--EX10
SELECT NAME
FROM CUSTOMER 
WHERE REFEREE_ID IS NULL OR REFEREE_ID !=2;

--EX11
SELECT NAME, POPULATION, AREA
FROM WORLD 
WHERE AREA >= 3000000 OR POPULATION >= 25000000;

--EX12
SELECT DISTINCT AUTHOR_ID AS ID 
FROM VIEWS
WHERE AUTHOR_ID = VIEWER_ID
ORDER BY AUTHOR_id ASC;

--EX13
SELECT PART, ASSEMBLY_STEP FROM parts_assembly
WHERE FINISH_DATE IS NULL
ORDER BY ASSEMBLY_STEP ASC;

--EX14
SELECT * 
FROM LYFT_DRIVERS
WHERE YEARLY_SALARY <=30000 OR YEARLY_SALARY >=70000;

--EX15
SELECT ADVERTISING_CHANNEL 
FROM UBER_ADVERTISING
WHERE MONEY_SPENT > 100000;



