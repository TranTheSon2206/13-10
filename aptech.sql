use master
go
if EXISTS (select * from sys.databases where name='Aptech')
drop database Aptech
go
create database Aptech
go
use Aptech
create table Classes(
	ClassName char(6) ,
	Teacher varchar(30),
	TimeSlot varchar(30),
	Class int ,
	Lab int 
	);
	create unique clustered index ClusteredIndex on Classes(ClassName)
	with (Pad_index = on, FillFactor = 70, Ignore_Dup_key = on)

	create index TeacherIndex on Classes(teacher);

	drop index Classes.TeacherIndex;
	
	drop index Classes.ClusteredIndex;

	create unique clustered index ClusteredIndex1 on Classes(CName);
	with (drop_existing = on , allow_row_locks = on , allow_page_locks = On , maxdop=2);

	create index ClassLabIndex on Classes(Class,lab);

	exec sys.sp_helpindex N'Classes'