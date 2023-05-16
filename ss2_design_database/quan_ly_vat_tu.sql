create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table nha_cc (
ma_ncc int primary key auto_increment,
ten_ncc varchar(50),
dia_chi varchar(255)
);

create table don_dh(
so_dh int primary key auto_increment,
ngay_dh date,
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap date
);

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);

create table vat_tu(
ma_vat_tu int primary key auto_increment,
ten_vat_tu varchar(50)
);

create table chi_tiet_px(
dg_xuat int,
sl_xuat int,
so_px int,
ma_vat_tu int,
primary key(so_px,ma_vat_tu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_pn(
dg_nhap int,
sl_nhap int,
so_pn int,
ma_vat_tu int,
primary key(ma_vat_tu,so_pn),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_pn) references phieu_nhap(so_pn)
);

create table chi_tiet_ddh(
so_don_hang int,
ma_vat_tu int,
primary key(so_don_hang,ma_vat_tu),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_don_hang) references don_dh(so_dh)
);

create table sdt(
ma_ncc int,
sdt varchar(50) primary key,
foreign key (ma_ncc) references nha_cc(ma_ncc)
)