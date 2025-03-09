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

--Top Competitors
select h.hacker_id,h.name from Submissions s
join Challenges c on s.challenge_id = c.challenge_id 
join Difficulty d on c.difficulty_level = d.difficulty_level
join Hackers h on h.hacker_id = s.hacker_id and s.score = d.score
                    group by h.hacker_id, h.name
HAVING Count(h.hacker_id) > 1 
ORDER  BY Count(c.challenge_id) DESC, 
          h.hacker_id


--Ollivander's Inventory
select w.id,wp.age, w.coins_needed, w.power from Wands w
join Wands_Property wp on w.code = wp.code
where wp.is_evil < 1 and w.coins_needed = (select Min(w1.coins_needed) 
    from wands w1 
    join wands_property wp1 on w1.code = wp1.code 
    where  wp.age = wp1.age and w.power = w1.power) 
order by w.power desc, wp.age desc


--Contest Leaderboard
select h.hacker_id, h.name, sum(sscore) from Hackers h
inner join (select s.hacker_id, max(score) as sscore from Submissions s group by s.hacker_id, s.challenge_id) st on h.hacker_id = st.hacker_id
group by h.hacker_id, h.name
having sum(sscore) > 0
order by sum(sscore) desc, h.hacker_id asc


--Challenges
select h.hacker_id, h.name, count(*) from Hackers h inner join Challenges c on h.hacker_id=c.hacker_id
where h.hacker_id not in 
(select t1.hacker_id
from(select hacker_id, count(*) as cnt from Challenges group by hacker_id) as t1 
inner join 
(select hacker_id, count(*) as cnt from Challenges group by hacker_id) as t2 on t1.hacker_id!=t2.hacker_id and t1.cnt=t2.cnt and t1.cnt != (select count(*) from Challenges group by hacker_id order by count(*) desc limit 1))
group by h.hacker_id, h.name
order by count(*) desc, h.hacker_id
