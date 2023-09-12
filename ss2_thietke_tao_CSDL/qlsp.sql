create database QuanLySanPham;
use QuanLySanPham;

create table phieuxuat(
soPX int primary key,
ngayxuat date
);
create table phieunhap(
soPN int primary key,
ngaynhap date
);
create table vattu(
maVTU int primary key,
tenVTU varchar(100)
);
create table chitietPX (
maVTU int,
soPX int,
primary key(maVTU,soPX),
foreign key(maVTU) references vattu(maVTU),
foreign key(soPX) references phieuxuat(soPX),
dgXuat varchar(100),
slXuat int
);
create table chitietPN (
maVTU int,
soPN int,
primary key(maVTU,soPN),
foreign key(maVTU) references vattu(maVTU),
foreign key(soPN) references phieunhap(soPN),
dgNhap varchar(100),
slNhap int
);
create table nhaCC(
maNCC int primary key,
tenNCC varchar(100),
diachiNCC varchar(100)
);
create table donDH(
soDH int primary key,
ngayDH date,
maNCC int,
foreign key (maNCC) references nhacc(maNCC)
);
create table chitietDonDH(
maVTU int,
soDH int,
primary key (maVTU, soDH),
foreign key (maVTU) references vattu(maVTU),
foreign key (soDH) references dondh(soDH)
);
create table sdt(
soDT varchar(20),
maNCC int,
primary key(soDT,maNCC),
foreign key (maNCC) references nhaCC(maNCC)
);

