create database changeERD;
use changeERD;

create table nha_cc (
MaNCC int primary key auto_increment,
TenNCC varchar(50),
DiaChi varchar(255)
);

create table don_dh(
SoDH int primary key auto_increment,
NgayDH date,
MaNCC int,
foreign key (MaNCC) references nha_cc(MaNCC)
);

create table phieu_nhap(
SoPN int primary key auto_increment,
NgayNhap date
);

create table phieu_xuat(
SoPX int primary key auto_increment,
NgayXuat date
);

create table vat_tu(
MAVTU int primary key auto_increment,
TenVTU varchar(50)
);

create table chi_tiet_PX(
DGXuat int,
SLXuat int,
SoPX int,
MaVTU int,
primary key(SoPX,MaVTU),
foreign key (SoPX) references phieu_xuat(SoPX),
foreign key (MaVTU) references vat_tu(MaVTU)
);

create table chi_tiet_PN(
DGNhap int,
SLNhap int,
SoPN int,
MaVTU int,
primary key(MaVTU,SoPN),
foreign key (MaVTU) references vat_tu(MaVTU),
foreign key (SoPN) references phieu_nhap(SoPN)
);

create table chi_tiet_DDH(
SoDH int,
MaVTU int,
primary key(SoDH,MaVTU),
foreign key (MaVTU) references vat_tu(MaVTU),
foreign key (SoDH) references don_dh(SoDH)
);

create table sdt(
MaNCC int,
SDT varchar(50) primary key,
foreign key (MaNCC) references nha_cc(MaNCC)
)