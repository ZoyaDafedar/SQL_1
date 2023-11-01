--Assignment Question 3

/*Consider below Employee table:
Eid	Name	Mid
1	Jyoti	2
2	Vikul	4
3	Dheeraj	2
4	Ashish	5
5	Sangram	NULL*/

--Q1)Write a query to fetch beow o/p (Create a function if required):
/*EmployeeName	ManagerName
	Jyoti			Vikul
	Vikul			Ashish
	Dheeraj			Vikul
	Ashish			Sangram
	Sangram			No Manager
	Ritesh			Vikul*/

--create table first

Create table EmployeeSelfJoin
(
Eid int primary key identity,
Name varchar(50),
Mid int 
)

insert into EmployeeSelfJoin values('Jyoti',2),('vikul',4),('Dheeraj',2),
									('Ashish',5),('Sangram',NULL)
insert into EmployeeSelfJoin values('Ritsh',2)

select * from EmployeeSelfJoin

--use self join 
select E.Name as Employee_Name,
		coalesce(M.Name,'No Manager') as Manager_Name
from EmployeeSelfJoin E left join EmployeeSelfJoin M
on E.Mid = M.Eid
/*
Employee_Name	Manager_Name
	Jyoti		vikul
	vikul		Ashish
	Dheeraj		vikul
	Ashish		Sangram
	Sangram		No Manager
	Ritsh		vikul*/


