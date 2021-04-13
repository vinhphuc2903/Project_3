
--danh muc mon
create table DanhMucMon
(
	IDDanhMucMon char(10) primary key,
	TenDanhMuc nvarchar(50),
)
--thuc don cua quan
create table Mon
(
	IDMon char(10) primary key,
	TenMon nvarchar(50),
	DonGia float,
	HinhAnh image,
	IDDanhMucMon char(10) foreign key (IDDanhMucMon) references DanhMucMon,
)
-- tai khoan
create table TaiKhoan
(
	IDTaiKhoan char(10) primary key,
	UserName char(20),
	PassWord char(20) not null default 0 ,
)
--chuc vu
create table ChucVu
(
	IDChucVu char(10) primary key,
	TenChucVu nvarchar(50),
)
-- the hien thong tin nhan vien 
create table NhanVien
(
	IDNhanVien char(10) primary key,
	HoTen nvarchar(50) not null,
	DanToc nvarchar(30) not null,
	GioiTinh nvarchar(10) not null,
	SoDienThoai char(12) not null,
	QueQuan char(30) not null,
	NgaySinh char(12) not null,
	TrinhDoHocVan nvarchar(30),
	[IDChucVu] char(10) foreign key (IDChucVu) references ChucVu,
	[IDTaiKhoan] char(10) foreign key ([IDTaiKhoan]) references TaiKhoan,
)


--Quan ly ban va tinh trang ban
create table Ban
(
	IDBan char(10) primary key,
	TinhTrangBan nvarchar(12) not null default 'Trống',
)


--chi tiet ban 
create table ChiTietHoaDon
(
	IDChiTietHoaDon char(10) primary key,
	[IDMon] char(10) foreign key ([IDMon]) references Mon,
	NgayGioThanhToan datetime,
	SoLuong int,
)
--hoa don
create table HoaDon
(
	IDHoaDon char(10) primary key,
	GiamGia float,
	TenKhachHang nvarchar(50),
	IDBan char(10) foreign key (IDBan) references Ban,
	IDChiTietHoaDon char(10) foreign key (IDChiTietHoaDon) references ChiTietHoaDon,
	IDNhanVien char(10) foreign key (IDNhanVien) references NhanVien,
	
)