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
--Zero is replaced with space in order to emulate the blunder and this returns string hence why it is converted to float for subtraction purpose.
--Everything is ceiled to integer as requested in the question.

--Top Earners
select max(months * salary), count(*) from Employee
where (months * salary) =
(select max(months * salary) from Employee)

--Weather Observation Station 2
select cast((sum(lat_n)) as decimal (10,2)), cast((sum(long_w)) as decimal (10,2)) from station

--Weather Observation Station 13
select cast((sum(LAT_N)) as decimal(10,4)) from STATION
where LAT_N > 38.7880 and LAT_N < 137.2345

--Weather Observation Station 14
select cast((max(LAT_N)) as decimal(10,4)) from STATION
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
select cast((abs(min(lat_n) - max(lat_n))) + abs((min(long_w) - max(long_w))) as decimal(10,4)) from station;

--Weather Observation Station 19
select cast(sqrt(power((min(lat_n) - max(lat_n)),2) + power((min(long_w) - max(long_w)),2)) as decimal(10,4)) from station;

--Weather Observation Station 20
select cast(s.lat_n as decimal(10,4)) from station s
where
(select count(lat_n) from station where lat_n < s.lat_n) = (select count(lat_n) from station where lat_n > s.lat_n);
