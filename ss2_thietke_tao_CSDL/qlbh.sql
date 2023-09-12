create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
	cID int primary key,
    cName varchar(50),
	cAge varchar(50)
);
create table Orderr (
	oId int primary key,
    oDate Date,
    oTotalPrice double,
    cID int,
	foreign key (cID) references Customer(cID)
);
create table Product(
	pId int primary key,
    pName varchar(50),
    pPrice double
);
create table Oderdetail(
	oId int,
    pId int,
    odQTY varchar(20),
    primary key(oId,pId)
)


