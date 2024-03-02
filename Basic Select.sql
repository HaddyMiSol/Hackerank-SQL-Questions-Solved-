--HACKERANK BASIC SELECT QUESTIONS SOLVED

--Revisng Select Query I
select * from CITY
where POPULATION > 100000 AND COUNTRYCODE = 'USA'

--Revisng Select Query II
select NAME from CITY
where POPULATION > 120000 AND COUNTRYCODE = 'USA'

--Select All
select * from CITY

--Select by ID
select * from CITY 
where ID = 1661

--Japanese Cities' Attributes
select * from CITY
where COUNTRYCODE = 'JPN'

--Japanese Cities' Names
select NAME from CITY
where COUNTRYCODE = 'JPN'

--Weather Observation Station 1
select CITY, STATE from STATION

--Weather Observation Station 3
select distinct(CITY) from STATION
where ID % 2 = 0

--Weather Observation Station 4
select count(CITY) - count(distinct(CITY)) from STATION

--Weather Observation Station 5
select top 1 CITY, len(CITY) from STATION order by len(CITY) asc, city asc; 
select top 1 CITY, len(CITY) from STATION order by len(CITY) desc, city asc;

--Weather Observation Station 6
select distinct(CITY) from STATION
where left(CITY, 1) in ('a', 'e', 'i', 'o', 'u')
--OR
select distinct(CITY) from STATION
where CITY like '[aeiou]%'

--Weather Observation Station 7
select distinct(CITY) from STATION
where right(CITY, 1) in ('a', 'e', 'i', 'o', 'u')
--OR
select distinct(CITY) from STATION
where CITY like '%[aeiou]'

--Weather Observation Station 8
select distinct(CITY) from STATION
where right(CITY, 1) in ('a', 'e', 'i', 'o', 'u') and
left(CITY, 1) in ('a', 'e', 'i', 'o', 'u')
--OR
SELECT DISTINCT(CITY) FROM STATION 
WHERE CITY LIKE '[AEIOU]%' AND CITY LIKE '%[AEIOU]';


--Weather Observation Station 9
select distinct(CITY) from STATION
where left(CITY, 1)not in ('a', 'e', 'i', 'o', 'u')
--OR
select distinct(CITY) from STATION
where CITY like '[^aeiou]%'


--Weather Observation Station 10
select distinct(CITY) from STATION
where right(CITY, 1)not in ('a', 'e', 'i', 'o', 'u')
--OR
select distinct(CITY) from STATION
where CITY like '%[^aeiou]'


--Weather Observation Station 11
select distinct(CITY) from STATION
where CITY like '[^aeiou]%' or CITY like '%[^aeiou]'

--Weather Observation Station 12
select distinct(CITY) from STATION
where CITY like '[^aeiou]%' and CITY like '%[^aeiou]'

--Higher Than 75 Marks
select Name from STUDENTS 
where Marks > 75
order by right(Name,3) asc, ID asc

--Employee Names
select name from Employee
order by name asc

--Employee Salaries
select name from Employee
where salary > 2000 and months < 10






