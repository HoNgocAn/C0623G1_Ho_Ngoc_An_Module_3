CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;
CREATE TABLE Customer(
	cId INT PRIMARY KEY NOT NULL ,
    cName VARCHAR(50) NOT NULL,
	cAge INT(50), 
    CHECK (cAge>=18 AND cAge<120),
	UNIQUE(cId)
);
CREATE TABLE Orders (
	oId INT PRIMARY KEY NOT NULL UNIQUE,
    oDate DATE DEFAULT (CURRENT_DATE),
    oTotalPrice DOUBLE CHECK (oTotalPrice>0),
    cId INT,
    FOREIGN KEY (cId) REFERENCES Customer(cId)
);
CREATE TABLE Product(
	pId INT PRIMARY KEY NOT NULL UNIQUE,
    pName VARCHAR(50) NOT NULL,
    pPrice double NOT NULL CHECK(pPrice>0)
);
CREATE TABLE Oderdetail(
	oId INT,
    pId INT,
    odQTY INT NOT NULL CHECK(odQTY>0),
    PRIMARY KEY(oId,pId),
    FOREIGN KEY(oId) REFERENCES Orders(oId),
    FOREIGN KEY(pId) REFERENCES Product(pId)
)

