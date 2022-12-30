--HACKERANK BASIC JOIN QUESTIONS SOLVED

--Population Census
select sum(c.POPULATION) from CITY c
join COUNTRY co on c.CountryCode = co.Code
where co.CONTINENT ='Asia'

--Africa Cities
select c.NAME from CITY c
join COUNTRY co on c.CountryCode = co.Code
where co.CONTINENT ='Africa'

--Average Population of Each Continent
select co.CONTINENT,round(avg(c.POPULATION),0) from CITY c
join COUNTRY co on c.CountryCode = co.Code
group by co.CONTINENT

--The Report
select case 
    when grade >7 then s.Name else NULL end as Names, g.Grade, s.Marks from Students s
join Grades g on s.Marks between g.Min_Mark and g.Max_Mark
order by g.grade desc, Names, s.Marks asc