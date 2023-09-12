create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
	cId int primary key,
    cName varchar(50),
	cAge varchar(50)
);
create table Orders (
	oId int primary key,
    oDate Date,
    oTotalPrice double,
    cId int,
	foreign key (cId) references Customer(cId)
);
create table Product(
	pId int primary key,
    pName varchar(50),
    pPrice double
);
create table Oderdetail(
	oId int,
    pId int,
    odQTY int,
    primary key(oId,pId)
)


