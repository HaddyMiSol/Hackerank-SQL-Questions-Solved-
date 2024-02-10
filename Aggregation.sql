--HACKERANK AGGREGATION QUESTIONS SOLVED

--Revising Aggregations - The Count Function
select count(NAME) from CITY
where POPULATION > 100000

--Revising Aggregations - The sum Function
select sum(POPULATION) from CITY
where DISTRICT = 'California'

--Revising Aggregations - Averages
select avg(POPULATION) from CITY
where DISTRICT ='California'

--Average Population
select round(avg(POPULATION),0) from CITY

--Japan Population
select sum(POPULATION) from CITY
where COUNTRYCODE= 'JPN'

--Population Density Difference
select max(POPULATION) - min(POPULATION) from CITY

--The Blunder
select cast(CEILING(avg(cast(Salary as float)) - avg(cast(replace(Salary, 0,'')as float))) as int) from EMPLOYEES

--Top Earners
select max(months * salary), count(*) from Employee
where (months * salary) =
(select max(months * salary) from Employee)

--Weather Observation Station 2
select cast((sum(lat_n)) as decimal (10,2)), cast((sum(long_w)) as decimal (10,2)) from station

--Weather Observation Station 13
select cast((sum(LAT_N)) as decimal(9,4)) from STATION
where LAT_N > 38.7880 and LAT_N < 137.2345

--Weather Observation Station 14
select cast((max(LAT_N)) as decimal(9,4)) from STATION
where LAT_N < 137.2345

--Weather Observation Station 15
select cast((long_w) as decimal (10,4)) from station
where lat_n = (select max(lat_n) from station where lat_n < 137.2345)

--Weather Observation Station 16
select cast(min(LAT_N) as decimal (10,4)) from STATION where LAT_N > 38.7780

--Weather Observation Station 17
select cast((long_w) as decimal (10,4)) from station
where lat_n = (select min(lat_n) from station where lat_n >38.7780)

--Weather Observation Station 18
select round(cast(abs(min(LAT_N) - max(LAT_N)) + abs(min(LONG_W)- max(LONG_W))as decimal(9,4)),4) from STATION

--Weather Observation Station 19
SELECT ROUND(cast(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2)+POWER(MAX(LONG_W)-MIN(LONG_W),2))as decimal(9,4)),4)
FROM STATION;

--Weather Observation Station 20
SELECT Round(s.lat_n, 4)
FROM station AS s
WHERE (SELECT Count(lat_n) FROM station WHERE lat_n < s.lat_n) = (SELECT Count(lat_n) FROM station WHERE lat_n > s.lat_n);
