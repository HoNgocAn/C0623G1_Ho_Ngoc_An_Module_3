create database demo;
use demo;
create table student(
 studentId int primary key,
 studentName varchar(200),
 studentAge int,
 studentCountry varchar(50)
);
create table class(
 classId int primary key,
 className varchar(200)
);
create table teacher(
 teacherId int primary key,
 teacherName varchar(200),
 teacherAge int,
 teacherCountry varchar(50)
);


