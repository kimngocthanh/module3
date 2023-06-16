use ss2;

select student.id, student.name, student.birthday, student.gender, student.email,student.point,student.account, class.name
from student
join class on student.class_id = class.id;

select student.id, student.name, student.birthday, student.gender, student.email,student.point,student.account, class.name
from student
left join class on student.class_id = class.id;

select * 
from student
where name like "%huynh" or name like "%hai";

select student.id, student.name, student.point
from student
where student.point >5;

select * 
from student
where name like "nguyen%";

SELECT 
    student.point, COUNT(*) AS count
FROM
    student
GROUP BY student.point;

select  student.point, 
count(*) AS count
from student
where student.point > 5
group by student.point;

select  student.point, 
count(*) AS count
from student
where student.point > 5 
group by student.point
having count(*) >=2;

select student.id, student.name, student.birthday, student.gender, student.email,student.point,student.account, class.name
from student
join class on student.class_id = class.id
where class.name = "c1121g1"
order by student.name like "%a";
