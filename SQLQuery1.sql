use Education;
select * from subject--1
select * from institute--2
select DISTINCT stipendia from student--3
select DISTINCT course from student--4


select family,name,last_name,birthday from student ORDER BY family--5.1
select family,name,last_name,birthday from student ORDER BY name--5.2
select family,name,last_name,birthday from student ORDER BY last_name--5.3
select family,name,last_name,birthday from student ORDER BY birthday--5.4

select family,course,birthday from student ORDER BY course ASC--6.1
select family,course,birthday from student ORDER BY birthday DESC--6.2
select lect_id, family,name, last_name from lecturer--7
select * from student WHERE stipendia>0 ORDER BY family--8
select * from student WHERE course=1 ORDER BY family ASC--9
select * from student WHERE course>1 and course<4--10



select * from student WHERE NOT course=1 and NOT course=3--11.1
select * from student WHERE  course!=1 and course!=3--11.2
select DISTINCT subj_name,subj_id,mark from exam, subject  WHERE mark=5--12
select DISTINCT subj_name, hour, mark FROM subject, exam, knowledge, nagruzka WHERE (subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND nagruzka.nagr_id = exam.nagr_id) AND mark = 2

select DISTINCT town_name ,family,mark,subj_name 
from town,student,subject,parents,exam, knowledge,nagruzka
where (student.student_id=parents.parent_id and town.town_id=parents.town_id)
and town_name='Березовский'
and student.student_id=exam.student_id
and mark>2
and exam.nagr_id=nagruzka.nagr_id
and nagruzka.kvant_id=knowledge.kvant_id
and knowledge.subj_id=subject.subj_id
and subject.subj_id=5                           



select DISTINCT family,mark,subj_name from student
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
where mark>2
ORDER BY subj_name asc

select DISTINCT family,mark,subj_name from student
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
where mark>2
ORDER BY mark desc

select DISTINCT family,mark,subj_name from student
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
where mark>2
ORDER BY family asc                              


select DISTINCT family,mark,subj_name from student 
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
where mark=2 and subject.subj_id=1
ORDER BY family asc 

select DISTINCT family,town_name from student                 
join medalist on student.student_id=medalist.student_id
join parents on student.student_id=parents.student_id
join town on parents.town_id=town.town_id
join medali on medalist.medal_id=medali.medal_id
where name_medal='золотая'
ORDER BY family asc

select DISTINCT family,mark,subj_name,exam_date from student  
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
where mark=2 


select DISTINCT family,mark,subj_name,exam_date from student     
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
where mark=2 and (exam_date='2019.05.24' or exam_date='2019.06.13')

select DISTINCT student.family,mark,subj_name,exam_date, lecturer.family from student   
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
join lecturer on lecturer.lect_id=nagruzka.lect_id
where mark=5

select DISTINCT student.family,mark,subj_name, lecturer.family,inst_name,knowledge.hour from student --21
join exam on exam.student_id=student.student_id
join nagruzka on exam.nagr_id=nagruzka.nagr_id
join knowledge on knowledge.kvant_id=nagruzka.kvant_id
join subject on subject.subj_id=knowledge.subj_id
join lecturer on lecturer.lect_id=nagruzka.lect_id
join institute on institute.inst_id=lecturer.inst_id
where mark=2 and knowledge.hour>100

SELECT sin(90);
SELECT FLOOR(77.55);
SELECT CEILING(233.46);
SELECT CEILING(-46.43);
SELECT EXP(3);
SELECT SQRT(49);
SELECT ROUND(745.693893, 0);
SELECT ROUND(365.693893, 3);
SELECT LOG(45);
SELECT LOG10(100);

select family+' '+name from student
select family, CHARINDEX('ов',family)  from student
select LEFT(family,3) from student
select REPLACE(family,'а','о') from student
select LTRIM ('  '+family) from student
select RTRIM (family+'  ') from student
select family+SPACE(5)+name from student
select SUBSTRING(family,1,5) from student

select CONCAT(family,LEFT(name,1),LEFT(last_name,1)) from student --3.1.1
where LEFT(family,1) = 'С'
select family + SPACE(1) + LEFT(name,1) + SPACE(1) + LEFT(last_name,1) from student --3.1.2
where LEFT(family,1) = 'С'
select family + ' ' + LEFT(name,1) + '.' + LEFT(last_name,1) from student --3.1.3
where LEFT(family,1) = 'С'
select subject.subj_name, CHARINDEX('с',subj_name) from subject --3.2
select SPACE(LEN(last_name))+lecturer.last_name+SPACE(LEN(last_name)) from lecturer --3.3
select REPLACE(subj_name, 'ик',' Седунова') from subject --3.4
select subj_name, CHARINDEX('у',subj_name)from subject --3.5


select exam_date,DATEADD(YEAR,5,exam_date) from exam
select exam_date,DATENAME(day,exam_date),DATENAME(month,exam_date), DATENAME(WEEKDAY,exam_date) from exam  --4


select DATEDIFF(year,'1996-05-03','1996-07-15') as YearDiff, DATEDIFF(MONTH,'1996-05-03','1996-07-15') as MonthDiff, DATEDIFF(DAY,'1996-05-03','1996-07-15') as DayDiff --5

select POWER(5,5) --6
select POWER(stipendia,course) from student where stipendia > 0
select POWER(mark,5) from exam
