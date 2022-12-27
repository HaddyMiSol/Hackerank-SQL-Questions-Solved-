--HACKERANK ADVANCE SELECT QUESTIONS SOLVED
--Type of Triangle
select 
  case
  when ((A+B<=C) or (B+C<=A) or (A+C<B)) then 'Not A Triangle'
  when ((A=B) and (B=C) and (A=C)) then 'Equilateral'
  when (((A=B) and (A!=C)) or ((B=C) and (B!=A)) or ((A=C) and (A!=B))) then 'Isosceles'
  when ((A!=B) and (B!=C) and (B!=A)) then 'Scalene' end as
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
--Binary Tree Nodes
--New Companies
select c.company_code, c.founder, count(distinct(sm.lead_manager_code)), count(distinct(sm.senior_manager_code)),
count(distinct(m.manager_code)), count(distinct(e.employee_code)) 
from Company c, Lead_manager lm, Senior_Manager sm, Manager m,Employee e  
where c.company_code = lm.company_code and lm.lead_manager_code = sm.lead_manager_code and sm.senior_manager_code = m.senior_manager_code and m.manager_code = e.manager_code
group by c.company_code, c.founder
order by c.company_code asc