--SQL Project Planning
select Start_Date, min(End_Date) m from 
(select start_date from Projects
where start_date not in (select end_date from Projects)) s,
(select end_date from Projects 
 where end_date not in (select start_date from Projects)) e
 where start_date < end_date
 group by start_date
 order by (min(End_Date) - start_date), start_date


--Placements
select s.Name from Students s
join Friends f on s.ID = f.ID
join Packages p on f.ID = p.ID
join Packages fp on f.Friend_ID = fp.ID
where fp.Salary > p.Salary
order by fp.Salary


--Symmetric Pairs
select X, Y from Functions f
where exists (select * from functions f1
      where f1.Y = f.X and 
            f1.X = f.Y and
            f1.X > f.X)
      and (X != Y )
union
select X,Y from Functions f where X = Y
and(
(select count(*) from Functions 
 where X = f.X and Y = f.X) > 1)
order by X asc

--Interviews
select ct.contest_id, ct.hacker_id, ct.name, sum(total_submissions), 
        sum(total_accepted_submissions), 
        sum(total_views), sum(total_unique_views) from Contests ct
join Colleges cl on ct.contest_id = cl.contest_id
join Challenges ch on cl.college_id = ch.college_id
left join
(select challenge_id, sum(total_views) as total_views, sum(total_unique_views) as total_unique_views
from view_stats group by challenge_id) vs on ch.challenge_id = vs.challenge_id 
left join
(select challenge_id, sum(total_submissions) as total_submissions, sum(total_accepted_submissions) as total_accepted_submissions from submission_stats group by challenge_id) ss on ch.challenge_id = ss.challenge_id
    group by ct.contest_id, ct.hacker_id, ct.name
        having sum(total_submissions)!=0 or 
                sum(total_accepted_submissions)!=0 or
                sum(total_views)!=0 or
                sum(total_unique_views)!=0
            order by contest_id;

--Distance Traveled (Question is from Interview Question.com)
select name, IFNULL(sum(distance),0) as distance_traveled 
from users
left join rides on users.id = rides.passenger_user_id
group by name
order by SUM(distance) DESC, name ASC


--15 Days of Learning SQL
