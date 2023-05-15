create database changeERD;
use changeERD;

create table NHACC (
MaNCC int primary key auto_increment,
TenNCC varchar(50),
DiaChi varchar(255)
);

create table DONDH(
SoDH int primary key auto_increment,
NgayDH date,
MaNCC int,
foreign key (MaNCC) references NHACC(MaNCC)
);

create table PHIEUNHAP(
SoPN int primary key auto_increment,
NgayNhap date
);

create table PHIEUXUAT(
SoPX int primary key auto_increment,
NgayXuat date
);

create table VATTU(
MAVTU int primary key auto_increment,
TenVTU varchar(50)
);

create table chi_tiet_PX(
DGXuat int,
SLXuat int,
SoPX int,
MaVTU int,
primary key(SoPX,MaVTU),
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key (MaVTU) references VATTU(MaVTU)
);

create table chi_tiet_PN(
DGNhap int,
SLNhap int,
SoPN int,
MaVTU int,
primary key(MaVTU,SoPN),
foreign key (MaVTU) references VATTU(MaVTU),
foreign key (SoPN) references PHIEUNHAP(SoPN)
);

create table chi_tiet_DDH(
SoDH int,
MaVTU int,
primary key(SoDH,MaVTU),
foreign key (MaVTU) references VATTU(MaVTU),
foreign key (SoDH) references DONDH(SoDH)
);

create table SDT(
MaNCC int,
SDT varchar(50) primary key,
foreign key (MaNCC) references NHACC(MaNCC)
)