CREATE DATABASE QuanLyBanHangSS3;
USE QuanLyBanHangSS3;
CREATE TABLE Customer(
	cId INT PRIMARY KEY NOT NULL ,
    cName VARCHAR(50) NOT NULL,
	cAge INT, 
    CHECK (cAge>=5 AND cAge<120),
	UNIQUE(cId)
);
CREATE TABLE Orders (
	oId INT PRIMARY KEY NOT NULL UNIQUE,
	cId INT,
    FOREIGN KEY (cId) REFERENCES Customer(cId),
    oDate DATE ,
    oTotalPrice DOUBLE
);
CREATE TABLE Product(
	pId INT PRIMARY KEY NOT NULL UNIQUE,
    pName VARCHAR(50) NOT NULL,
    pPrice double 
);
CREATE TABLE Oderdetail(
	oId INT,
    pId INT,
    odQTY INT NOT NULL CHECK(odQTY>0),
    PRIMARY KEY(oId,pId),
    FOREIGN KEY(oId) REFERENCES Orders(oId),
    FOREIGN KEY(pId) REFERENCES Product(pId)
);
INSERT INTO customer VALUES (1,"Minh Quan",10);
INSERT INTO customer VALUES (2,"Ngoc Oanh",20);
INSERT INTO customer VALUES (3,"Hong Ha",50);

INSERT INTO orders VALUES (1,1,"2006-3-21",NULL);
INSERT INTO orders VALUES (2,2,"2006-3-23",NULL);
INSERT INTO orders VALUES (3,1,"2006-3-16",NULL);

INSERT INTO product VALUES (1,"May Giat",3);
INSERT INTO product VALUES (2,"Tu Lanh",5);
INSERT INTO product VALUES (3,"Dieu Hoa",7);
INSERT INTO product VALUES (4,"Quat",1);
INSERT INTO product VALUES (5,"Bep Dien",2);

INSERT INTO Oderdetail VALUES (1,1,3);
INSERT INTO Oderdetail VALUES (1,3,7);
INSERT INTO Oderdetail VALUES (1,4,2);
INSERT INTO Oderdetail VALUES (2,1,1);
INSERT INTO Oderdetail VALUES (3,1,8);
INSERT INTO Oderdetail VALUES (2,5,4);
INSERT INTO Oderdetail VALUES (2,3,3);

SELECT O.oId, O.oDate, O.oTotalPrice
FROM ORDERS O;



