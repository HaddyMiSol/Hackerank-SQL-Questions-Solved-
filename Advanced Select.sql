--HACKERANK ADVANCE SELECT QUESTIONS SOLVED
--Type of Triangle
select 
  case
  when ((A+B<=C) or (B+C<=A) or (A+C<B)) then 'Not A Triangle'
  when ((A=B) and (B=C) and (A=C)) then 'Equilateral'
  when (((A=B) and (A!=C)) or ((B=C) and (B!=A)) or ((C=A) and (C!=B))) then 'Isosceles'
  when ((A!=B) and (B!=C) and (C!=A)) then 'Scalene' end as
  Triangle_Type
from TRIANGLES


--The PADS
select concat(Name , '(' , left(Occupation,1) , ')') from OCCUPATIONS
order by Name asc
select concat('There are a total of' , ' ' , cast(occupation_count as char) , ' ',lower(occupation) , 's' , '.')
from
(select count(*) as occupation_count,occupation from OCCUPATIONS
group by occupation)a
order by occupation_count,occupation 
  


--Occupations
select Doctor, Professor, Singer, Actor from
(select nm, 
    max(case when Occupation = 'Doctor' then name end) Doctor, --max() to select the first non-NULL value within each group created by the GROUP BY clause
    max(case when Occupation = 'Professor' then name end) Professor,
    max(case when Occupation = 'Singer' then name end) Singer,
    max(case when Occupation = 'Actor' then name end) Actor
 from (
 select name, Occupation, row_number() over (partition by occupation order by name asc) nm from OCCUPATIONS) nl
 group by nm)n
 
 
--Binary Tree Nodes
select N,
    case 
    when P is NULL then 'Root'
    when N in (select P from BST) then 'Inner'
    else 'Leaf' end as nt 
    from BST
    order by N
    
    
--New Companies
select c.company_code, c.founder, count(distinct(sm.lead_manager_code)), count(distinct(sm.senior_manager_code)),
count(distinct(m.manager_code)), count(distinct(e.employee_code)) 
from Company c, Lead_manager lm, Senior_Manager sm, Manager m,Employee e  
where c.company_code = lm.company_code and lm.lead_manager_code = sm.lead_manager_code and sm.senior_manager_code = m.senior_manager_code and m.manager_code = e.manager_code
group by c.company_code, c.founder
order by c.company_code asc

--OR

select c.company_code, c.founder, count(distinct(l.lead_manager_code)), count(distinct(s.senior_manager_code)), count(distinct(m.manager_code)), count(distinct(e.employee_code)) from company c 
inner join lead_manager l on c.company_code = l.company_code
inner join senior_manager s on l.lead_manager_code = s.lead_manager_code
inner join manager m on s.senior_manager_code = m.senior_manager_code
inner join employee e on m.manager_code = e.manager_code
group by c.company_code, c.founder
order by c.company_code asc

--OR (Since company_code is a primary key in all the tables)

select c.company_code, c.founder, count(distinct(l.lead_manager_code)), count(distinct(s.senior_manager_code)), count(distinct(m.manager_code)), count(distinct(e.employee_code)) from company c 
inner join lead_manager l on c.company_code = l.company_code
inner join senior_manager s on l.company_code = s.company_code
inner join manager m on s.company_code = m.company_code
inner join employee e on m.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code asc
