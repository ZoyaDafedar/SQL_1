--Create Databse for Assignmen
create database V#Assign
use V#Assign

--create Table From Depaertment
create table Department
(
Id int primary key identity,
Name varchar(50)
)
--Inserting Values
insert into Department values('IT'),('HR'),('Admin')
--Select Records
select Id,Name from Department

--Create table Employee
create table Employee
(
Id int primary key identity,
Name varchar(50),
DId int
)
--inserting Values
insert into Employee values('Ashish',1),('Ritesh',2),('Jyoti',2),
						('Archana',null),('Dheeraj',null),('Satish',2)
--Select Records 
Select Id,Name,DId from Employee

--Quetions Assignments
--1)All Employee Name Starts With 'A' ->like operator use
select Id,Name,DId from Employee where Name like 'A%'
/*  Id	Name		DId
	1	Ashish		1
	4	Archana		NULL*/

--2)All Employee Name Ends with 'h'->like operator use
Select Id,Name,DId from Employee where Name Like '%h'
/*	Id	Name	DId
	1	Ashish	1
	2	Ritesh	2
	6	Satish	2*/

--3)Department Name that does not have any employee-> use left join
Select * 
from Department D left join Employee E
on D.Id = E.DId
where E.Did is null
/* Id	Name	Id	   Name		DId
	3	Admin	NULL	NULL	NULL*/

Select D.Name as DName ,E.Name as EName 
from Department D left join Employee E
on D.Id = E.DId
where E.Did is null
/*DName	EName
  Admin	NULL*/

--4)All Employee who do not belong to any department->right join
Select *
from Department D right join Employee E
on D.Id = E.Id
where E.DId is null
/*Id	Name  Id	Name	DId
 NULL	NULL  4		Archana	NULL
 NULL	NULL  5		Dheeraj	NULL*/

Select E.Name as EName
from Department D right join Employee E
on D.Id = E.DId
where E.DId is null
/*DName	EName
  NULL	Archana
  NULL	Dheeraj*/

select * from Department
select * from Employee

--5)Compute employee count by its department name->use join ,count()
select D.Name as Department_Name,count(E.DId) as Employee_Count
from Department D right join Employee E
on D.Id = E.DId
group by D.Name
--Full Join
/*Department_Name	Employee_Count
		NULL			0
		Admin			0
		HR				3
		IT				1*/
--Left Join
/*Department_Name	Employee_Count
	Admin				0
	HR					3
	IT					1*/

select * from Department
select * from Employee

/*6)Retrive Department id & name who has more than 2 employees
		->use join ,count,group by,having*/
select D.id as DId,D.Name as DName,count(e.Did)as Employee_count
from Department D join Employee E
on D.id = E.DId
group by D.Id,D.Name
having count (e.DId)>2
/*DId	DName	Employee_count
	2	HR			3*/

select * from Department
select * from Employee

--7)find Department Id & Name who has at least 1 employee
select D.Id as DId,D.Name as DName,count(e.DId)as employee_count
from Department D join Employee E
on D.id = E.DId
group by D.Id,D.Name
having count(E.Id)>=1--count(e.DId)>=1
/*DId	DName	employee_count
	1	IT			1
	2	HR			3*/

--8) write a query for below output use function wherever required
--means koi bhi function use ker sakte 
--so null k jagah pr COALESCS
/*8.Write a query for below output use function wherever required
	Id	Name	Did	Dname
	1	Ashish	1	IT
	2	Ritesh	2	HR
	3	Jyoti	2	HR
	4	Archana	0	No Department
	5	Dheeraj	0	No Department
	6	Satish	2	HR*/

select * from Department
select * from Employee

select E.Id,E.Name as Employee_Name,
	COALESCE(D.Id,0)as DId,
	COALESCE(D.Name,'NO Department')as Department_Name
from Employee E  join Department D
on E.DId=D.Id


select E.Id,E.Name as Employee_Name,
	COALESCE(E.DId,0)as DId,
	COALESCE(D.Name,'NO Department')as Department_Name
from Employee E left join Department D
on E.DId=D.Id

select E.Id,E.Name as EName,
coalesce(E.DId,0)as DId,
coalesce(D.Name,'no dep')
from Employee E left join Department D
on E.DId = D.Id










