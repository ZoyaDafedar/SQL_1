use V#22
go
create table student 
(
RollNumber int,
Name varchar(30),
Age int,
IsConfirmed bit
)

-- inserting database
insert into student (RollNumber,Name,age,IsConfirmed) values(1,'zoyaa',20,'TRUE')

-- selecting database
select * from student

-- inserting databse
insert into student values(2,'Tamanna',20,'FALSE');
select * from student

--updating databse 
update student set IsConfirmed=0
select * from student

update student set IsConfirmed=1 where RollNumber=2
select * from student

update student set name='zoya',
RollNumber=1,
age=22
where IsConfirmed=0
select * from student

update student set IsConfirmed=1 where RollNumber=1

--deleting tables
delete from student --delete all records
delete from student where RollNumber=11
delete from student where Name='zoyaa'
select * from student

--inserting multipal recording
insert into student values
(1,'aaa',11,1),
(3,'bbb',33,0),
(4,'ccc',44,1)
select * from student

-- renaming table
execute sp_rename 'student','V#Students'
execute sp_rename 'V#Students','student'
select * from student

--droping table
drop table student

create table student 
(
RollNumber bigint,
Name varchar(30),
Age int,
IsConfirmed bit
)
--all upper command run after drop student table 
--like create,insert,update,delete,rename,drop.....

--adding a new colum
alter table student
add gender varchar(10),
Email varchar(50)
select * from student

--alter
alter table student
alter column [column_name][data_type]



insert into student(RollNumber,Name,Age,IsConfirmed,gender,phoneNo)
values(11,'aaaaa',22,0,'female',123433211)

update student set Gender='female',
phoneNo=76584930456
where RollNumber=1
select * from student

update student set Gender='female',
phoneNo='7479557777'
where RollNumber=2
select * from student

drop table student
select * from student