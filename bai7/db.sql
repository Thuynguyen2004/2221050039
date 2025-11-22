CREATE DATABASE  IF NOT EXISTS  quan_ly_web_phim;
 USE quan_ly_xem_phim;
create DATABASE IF not EXISTS quan_ly_web_phim;

1. thể loại
    - id int primary key
    - ten_the_loai varchar(50)
CREATE TABLE IF NOT EXISTS the_loai(
    id INT PRIMARY KEY,
    ten_the_loai VARCHAR(50)
);
2. người dùng
    - id int
    - ten_dang_nhap varchar(50)
    - matKhau varchar(50)
    - ho_ten varchar(50)
    - email varchar(50)
    - sdt varchar(10)
    - vai_tro_id int 
    - ngay_sinh datetime
CREATE TABLE IF NOT EXISTS nguoi_dung(
    id INT PRIMARY KEY,
    ten_dang_nhap VARCHAR(50),
    matKhau VARCHAR(50),
    ho_ten VARCHAR(50),
    email VARCHAR(50),
    sdt VARCHAR(10),
    vai_tro_id INT,
    ngay_sinh DATETIME,
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);

3. vai_tro
    - id int
    - ten_vai_tro varchar(20)
CREATE TABLE IF NOT EXISTS vai_tro(
    id INT PRIMARY KEY,
    ten_vai_tro VARCHAR(20)
);
4. phim
    - id int primary key
    - ten_phim varchar
    - dao_dien_id int
    - nam_phat_hanh int
    - poster varchar
    - quoc_gia_id int
    - so_tap int
    - trailer varchar
    - mo_ta text
CREATE TABLE IF NOT EXISTS phim(
    id INT PRIMARY KEY,
    ten_phim VARCHAR,
    dao_dien_id INT,
    nam_phat_hanh INT,
    poster VARCHAR,
    quoc_gia_id INT,
    so_tap INT,
    trailer VARCHAR,
    mo_ta TEXT,
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);

5. phim_dien_vien
    - id int
    - phim_id int
    - dien_vien_id int
CREATE TABLE IF NOT EXISTS phim_dien_vien (
    id INT PRIMARY KEY,
    phim_id INT,
    dien_vien_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES nguoi_dung(id)
);

6. phim_the_loai
    - id int
    - phim_id int
    - the_loai_id int
CREATE TABLE IF NOT EXISTS phim_the_loai (
    id INT PRIMARY KEY,
    phim_id INT,
    the_loai_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);
7. quốc gia
    -id int
    -ten_quoc_gia varchar
CREATE TABLE IF NOT EXISTS quoc_gia(
    id INT PRIMARY KEY,
    ten_quoc_gia VARCHAR
);
5. Tập phim
    - id int
    - so_tap int
    - tieu_de varchar
    - phim_id int
    - thoiLuong float 
    - trailer varchar
CREATE TABLE IF NOT EXISTS tap_phim(
    id INT PRIMARY KEY,
    so_tap INT,
    tieu_de VARCHAR,
    phim_id INT,
    thoiLuong FLOAT,
    trailer VARCHAR,
    FOREIGN KEY (phim_id) REFERENCES phim(id)
);
- Hoàn thiện CSDL để quản lý web phim
- Viết các câu lệnh để chạy nhiều lần k bị lỗi
CREATE DATABASE IF NOT EXISTS web_phim; 
USE web_phim;
-- 1. Bảng thể loại
CREATE TABLE IF NOT EXISTS the_loai (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_the_loai VARCHAR(50) NOT NULL
);

-- 2. Bảng vai trò
CREATE TABLE IF NOT EXISTS vai_tro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_vai_tro VARCHAR(20) NOT NULL
);

-- 3. Bảng quốc gia
CREATE TABLE IF NOT EXISTS quoc_gia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_quoc_gia VARCHAR(50) NOT NULL
);

-- 4. Bảng người dùng
CREATE TABLE IF NOT EXISTS nguoi_dung (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_dang_nhap VARCHAR(50) NOT NULL,
    mat_khau VARCHAR(50) NOT NULL,
    ho_ten VARCHAR(50),
    email VARCHAR(50),
    sdt VARCHAR(10),
    vai_tro_id INT,
    ngay_sinh DATETIME,
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);

-- 5. Bảng phim
CREATE TABLE IF NOT EXISTS phim (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_phim VARCHAR(255) NOT NULL,
    dao_dien_id INT,
    nam_phat_hanh INT,
    poster VARCHAR(255),
    quoc_gia_id INT,
    so_tap INT,
    trailer VARCHAR(255),
    mo_ta TEXT,
    FOREIGN KEY (dao_dien_id) REFERENCES nguoi_dung(id),
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);

-- 6. Bảng phim - diễn viên
CREATE TABLE IF NOT EXISTS phim_dien_vien (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phim_id INT,
    dien_vien_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES nguoi_dung(id)
);

-- 7. Bảng phim - thể loại
CREATE TABLE IF NOT EXISTS phim_the_loai (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phim_id INT,
    the_loai_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);

-- 8. Bảng tập phim
CREATE TABLE IF NOT EXISTS tap_phim (
    id INT PRIMARY KEY AUTO_INCREMENT,
    so_tap INT,
    tieu_de VARCHAR(255),
    phim_id INT,
    thoi_luong FLOAT,
    trailer VARCHAR(255),
    FOREIGN KEY (phim_id) REFERENCES phim(id)
);
-- 1. the_loai
INSERT INTO the_loai (ten_the_loai) VALUES
('Hành động'),
('Tình cảm'),
('Hài'),
('Kinh dị'),
('Viễn tưởng'),
('Hoạt hình'),
('Tâm lý'),
('Hình sự'),
('Phiêu lưu'),
('Gia đình');

-- 2. vai_tro
INSERT INTO vai_tro (ten_vai_tro) VALUES
('admin'),
('dao_dien'),
('dien_vien'),
('user');

-- 3. quoc_gia
INSERT INTO quoc_gia (ten_quoc_gia) VALUES
('Viet Nam'),
('My'),
('Han Quoc'),
('Nhat Ban'),
('Anh'),
('Phap'),
('Duc'),
('Trung Quoc'),
('Thai Lan'),
('An Do');

-- 4. nguoi_dung
-- id 1: admin
-- id 2-11: dao_dien
-- id 12-30: dien_vien
INSERT INTO nguoi_dung
(ten_dang_nhap, mat_khau, ho_ten, email, sdt, vai_tro_id, ngay_sinh) VALUES
('admin', 'pass_admin', 'Admin He Thong', 'admin@example.com', '0900000001', 1, '1985-01-01 00:00:00'),

('dd1', 'pass_dd1', 'Dao Dien 1', 'dd1@example.com', '0900000002', 2, '1970-01-01 00:00:00'),
('dd2', 'pass_dd2', 'Dao Dien 2', 'dd2@example.com', '0900000003', 2, '1971-02-02 00:00:00'),
('dd3', 'pass_dd3', 'Dao Dien 3', 'dd3@example.com', '0900000004', 2, '1972-03-03 00:00:00'),
('dd4', 'pass_dd4', 'Dao Dien 4', 'dd4@example.com', '0900000005', 2, '1973-04-04 00:00:00'),
('dd5', 'pass_dd5', 'Dao Dien 5', 'dd5@example.com', '0900000006', 2, '1974-05-05 00:00:00'),
('dd6', 'pass_dd6', 'Dao Dien 6', 'dd6@example.com', '0900000007', 2, '1975-06-06 00:00:00'),
('dd7', 'pass_dd7', 'Dao Dien 7', 'dd7@example.com', '0900000008', 2, '1976-07-07 00:00:00'),
('dd8', 'pass_dd8', 'Dao Dien 8', 'dd8@example.com', '0900000009', 2, '1977-08-08 00:00:00'),
('dd9', 'pass_dd9', 'Dao Dien 9', 'dd9@example.com', '0900000010', 2, '1978-09-09 00:00:00'),
('dd10', 'pass_dd10', 'Dao Dien 10', 'dd10@example.com', '0900000011', 2, '1979-10-10 00:00:00'),

('dv1', 'pass_dv1', 'Dien Vien 1', 'dv1@example.com', '0910000001', 3, '1990-01-01 00:00:00'),
('dv2', 'pass_dv2', 'Dien Vien 2', 'dv2@example.com', '0910000002', 3, '1990-02-02 00:00:00'),
('dv3', 'pass_dv3', 'Dien Vien 3', 'dv3@example.com', '0910000003', 3, '1990-03-03 00:00:00'),
('dv4', 'pass_dv4', 'Dien Vien 4', 'dv4@example.com', '0910000004', 3, '1990-04-04 00:00:00'),
('dv5', 'pass_dv5', 'Dien Vien 5', 'dv5@example.com', '0910000005', 3, '1990-05-05 00:00:00'),
('dv6', 'pass_dv6', 'Dien Vien 6', 'dv6@example.com', '0910000006', 3, '1990-06-06 00:00:00'),
('dv7', 'pass_dv7', 'Dien Vien 7', 'dv7@example.com', '0910000007', 3, '1990-07-07 00:00:00'),
('dv8', 'pass_dv8', 'Dien Vien 8', 'dv8@example.com', '0910000008', 3, '1990-08-08 00:00:00'),
('dv9', 'pass_dv9', 'Dien Vien 9', 'dv9@example.com', '0910000009', 3, '1990-09-09 00:00:00'),
('dv10', 'pass_dv10', 'Dien Vien 10', 'dv10@example.com', '0910000010', 3, '1990-10-10 00:00:00'),
('dv11', 'pass_dv11', 'Dien Vien 11', 'dv11@example.com', '0910000011', 3, '1990-11-11 00:00:00'),
('dv12', 'pass_dv12', 'Dien Vien 12', 'dv12@example.com', '0910000012', 3, '1990-12-12 00:00:00'),
('dv13', 'pass_dv13', 'Dien Vien 13', 'dv13@example.com', '0910000013', 3, '1991-01-01 00:00:00'),
('dv14', 'pass_dv14', 'Dien Vien 14', 'dv14@example.com', '0910000014', 3, '1991-02-02 00:00:00'),
('dv15', 'pass_dv15', 'Dien Vien 15', 'dv15@example.com', '0910000015', 3, '1991-03-03 00:00:00'),
('dv16', 'pass_dv16', 'Dien Vien 16', 'dv16@example.com', '0910000016', 3, '1991-04-04 00:00:00'),
('dv17', 'pass_dv17', 'Dien Vien 17', 'dv17@example.com', '0910000017', 3, '1991-05-05 00:00:00'),
('dv18', 'pass_dv18', 'Dien Vien 18', 'dv18@example.com', '0910000018', 3, '1991-06-06 00:00:00'),
('dv19', 'pass_dv19', 'Dien Vien 19', 'dv19@example.com', '0910000019', 3, '1991-07-07 00:00:00');

-- 5. phim (30 phim, dao_dien_id = 2..11, quoc_gia_id = 1..10)
INSERT INTO phim
(ten_phim, dao_dien_id, nam_phat_hanh, poster, quoc_gia_id, so_tap, trailer, mo_ta) VALUES
('Phim 1', 2, 2010, 'phim1.jpg', 1, 1, 'https://example.com/trailer/p1', 'Mo ta phim 1'),
('Phim 2', 3, 2011, 'phim2.jpg', 2, 1, 'https://example.com/trailer/p2', 'Mo ta phim 2'),
('Phim 3', 4, 2012, 'phim3.jpg', 3, 1, 'https://example.com/trailer/p3', 'Mo ta phim 3'),
('Phim 4', 5, 2013, 'phim4.jpg', 4, 1, 'https://example.com/trailer/p4', 'Mo ta phim 4'),
('Phim 5', 6, 2014, 'phim5.jpg', 5, 1, 'https://example.com/trailer/p5', 'Mo ta phim 5'),
('Phim 6', 7, 2015, 'phim6.jpg', 6, 1, 'https://example.com/trailer/p6', 'Mo ta phim 6'),
('Phim 7', 8, 2016, 'phim7.jpg', 7, 1, 'https://example.com/trailer/p7', 'Mo ta phim 7'),
('Phim 8', 9, 2017, 'phim8.jpg', 8, 1, 'https://example.com/trailer/p8', 'Mo ta phim 8'),
('Phim 9', 10, 2018, 'phim9.jpg', 9, 1, 'https://example.com/trailer/p9', 'Mo ta phim 9'),
('Phim 10', 11, 2019, 'phim10.jpg', 10, 1, 'https://example.com/trailer/p10', 'Mo ta phim 10'),
('Phim 11', 2, 2020, 'phim11.jpg', 1, 1, 'https://example.com/trailer/p11', 'Mo ta phim 11'),
('Phim 12', 3, 2021, 'phim12.jpg', 2, 1, 'https://example.com/trailer/p12', 'Mo ta phim 12'),
('Phim 13', 4, 2015, 'phim13.jpg', 3, 1, 'https://example.com/trailer/p13', 'Mo ta phim 13'),
('Phim 14', 5, 2016, 'phim14.jpg', 4, 1, 'https://example.com/trailer/p14', 'Mo ta phim 14'),
('Phim 15', 6, 2017, 'phim15.jpg', 5, 1, 'https://example.com/trailer/p15', 'Mo ta phim 15'),
('Phim 16', 7, 2018, 'phim16.jpg', 6, 1, 'https://example.com/trailer/p16', 'Mo ta phim 16'),
('Phim 17', 8, 2019, 'phim17.jpg', 7, 1, 'https://example.com/trailer/p17', 'Mo ta phim 17'),
('Phim 18', 9, 2020, 'phim18.jpg', 8, 1, 'https://example.com/trailer/p18', 'Mo ta phim 18'),
('Phim 19', 10, 2021, 'phim19.jpg', 9, 1, 'https://example.com/trailer/p19', 'Mo ta phim 19'),
('Phim 20', 11, 2022, 'phim20.jpg', 10, 1, 'https://example.com/trailer/p20', 'Mo ta phim 20'),
('Phim 21', 2, 2010, 'phim21.jpg', 1, 1, 'https://example.com/trailer/p21', 'Mo ta phim 21'),
('Phim 22', 3, 2011, 'phim22.jpg', 2, 1, 'https://example.com/trailer/p22', 'Mo ta phim 22'),
('Phim 23', 4, 2012, 'phim23.jpg', 3, 1, 'https://example.com/trailer/p23', 'Mo ta phim 23'),
('Phim 24', 5, 2013, 'phim24.jpg', 4, 1, 'https://example.com/trailer/p24', 'Mo ta phim 24'),
('Phim 25', 6, 2014, 'phim25.jpg', 5, 1, 'https://example.com/trailer/p25', 'Mo ta phim 25'),
('Phim 26', 7, 2015, 'phim26.jpg', 6, 1, 'https://example.com/trailer/p26', 'Mo ta phim 26'),
('Phim 27', 8, 2016, 'phim27.jpg', 7, 1, 'https://example.com/trailer/p27', 'Mo ta phim 27'),
('Phim 28', 9, 2017, 'phim28.jpg', 8, 1, 'https://example.com/trailer/p28', 'Mo ta phim 28'),
('Phim 29', 10, 2018, 'phim29.jpg', 9, 1, 'https://example.com/trailer/p29', 'Mo ta phim 29'),
('Phim 30', 11, 2019, 'phim30.jpg', 10, 1, 'https://example.com/trailer/p30', 'Mo ta phim 30');

-- 6. phim_the_loai (mỗi phim 1–2 thể loại)
INSERT INTO phim_the_loai (phim_id, the_loai_id) VALUES
(1,1),(1,2),
(2,2),(2,3),
(3,2),
(4,1),
(5,5),
(6,5),
(7,1),(7,9),
(8,7),
(9,5),
(10,2),(10,9),
(11,1),
(12,4),
(13,7),
(14,2),
(15,3),
(16,1),
(17,5),
(18,7),
(19,1),(19,5),
(20,2),
(21,1),
(22,3),
(23,7),
(24,4),
(25,2),
(26,1),
(27,5),
(28,7),
(29,1),
(30,2);

-- 7. phim_dien_vien (mỗi phim 2 diễn viên: dùng id 12..30)
INSERT INTO phim_dien_vien (phim_id, dien_vien_id) VALUES
(1,12),(1,13),
(2,13),(2,14),
(3,14),(3,15),
(4,15),(4,16),
(5,16),(5,17),
(6,17),(6,18),
(7,18),(7,19),
(8,19),(8,20),
(9,20),(9,21),
(10,21),(10,22),
(11,22),(11,23),
(12,23),(12,24),
(13,24),(13,25),
(14,25),(14,26),
(15,26),(15,27),
(16,27),(16,28),
(17,28),(17,29),
(18,29),(18,30),
(19,12),(19,13),
(20,14),(20,15),
(21,16),(21,17),
(22,18),(22,19),
(23,20),(23,21),
(24,22),(24,23),
(25,24),(25,25),
(26,26),(26,27),
(27,28),(27,29),
(28,30),(28,12),
(29,13),(29,14),
(30,15),(30,16);

-- 8. tap_phim (5 phim đầu, mỗi phim 3 tập = 15 rows)
INSERT INTO tap_phim (so_tap, tieu_de, phim_id, thoi_luong, trailer) VALUES
(1,'Phim 1 - Tap 1',1,90,'https://example.com/trailer/p1_t1'),
(2,'Phim 1 - Tap 2',1,92,'https://example.com/trailer/p1_t2'),
(3,'Phim 1 - Tap 3',1,88,'https://example.com/trailer/p1_t3'),

(1,'Phim 2 - Tap 1',2,45,'https://example.com/trailer/p2_t1'),
(2,'Phim 2 - Tap 2',2,47,'https://example.com/trailer/p2_t2'),
(3,'Phim 2 - Tap 3',2,44,'https://example.com/trailer/p2_t3'),

(1,'Phim 3 - Tap 1',3,50,'https://example.com/trailer/p3_t1'),
(2,'Phim 3 - Tap 2',3,51,'https://example.com/trailer/p3_t2'),
(3,'Phim 3 - Tap 3',3,49,'https://example.com/trailer/p3_t3'),

(1,'Phim 4 - Tap 1',4,40,'https://example.com/trailer/p4_t1'),
(2,'Phim 4 - Tap 2',4,42,'https://example.com/trailer/p4_t2'),
(3,'Phim 4 - Tap 3',4,41,'https://example.com/trailer/p4_t3'),

(1,'Phim 5 - Tap 1',5,60,'https://example.com/trailer/p5_t1'),
(2,'Phim 5 - Tap 2',5,62,'https://example.com/trailer/p5_t2'),
(3,'Phim 5 - Tap 3',5,59,'https://example.com/trailer/p5_t3');

SELECT p.ten_phim, qg.ten_quoc_gia, nd.ho_ten as ten_dao_dien, dv.ho_ten as ten_dien_vien FROM phim p 
join quoc_gia qg on p.quoc_gia_id = qg.id
join nguoi_dung nd on p.dao_dien_id = nd.id
JOIN phim_dien_vien pdv ON p.id = pdv.phim_id       
JOIN nguoi_dung dv ON pdv.dien_vien_id = dv.id   
where p.id = 10





                 

CREATE DATABASE IF NOT EXISTS quan_ly_web_phim; 
USE quan_ly_web_phim;
CREATE TABLE IF NOT EXISTS the_loai(
	id INT PRIMARY KEY,
    ten_the_loai varchar(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS vai_tro(
    id INT PRIMARY KEY,
    ten_vai_tro varchar(20)
);
CREATE TABLE IF NOT EXISTS users(
	id INT PRIMARY KEY,
    ten_dang_nhap varchar(50),
    mat_khau varchar(50),
    ho_ten varchar(50),
    email varchar(50),
    so_dien_thoai varchar(10),
    ngay_sinh datetime,
    quyen_quan_tri int,
    loai_tai_khoan varchar(20),
    FOREIGN KEY (quyen_quan_tri) REFERENCES vai_tro(id)
);
CREATE TABLE IF NOT EXISTS quoc_gia(
	id INT PRIMARY key,
    ten_quoc_gia varchar(100)
);
CREATE TABLE IF NOT EXISTS phim(
	id INT PRIMARY KEY,
    ten_phim varchar(100),
    dao_dien_id int,
    the_loai_id int,
    quoc_gia_id int,
    tuoi int,
    nam_phat_hanh int,
    poster varchar(255),
    so_tap int,
    trailer varchar(255),
    mo_ta text,
    FOREIGN KEY (dao_dien_id) REFERENCES users(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id),
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);
CREATE TABLE IF NOT EXISTS phim_dien_vien(
	id INT PRIMARY KEY,
    phim_id int,
    dien_vien_id int,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES users(id)
);
CREATE TABLE IF NOT EXISTS phim_the_loai(
	id INT PRIMARY key,
    phim_id int,
    the_loai_id int,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);
CREATE TABLE IF NOT EXISTS tap_phim(
	id INT PRIMARY key,
    id_phim int,
    so_tap int,
    tieu_de varchar(50),
    thoi_luong float,
    trailer varchar(255),
    FOREIGN KEY (id_phim) REFERENCES phim(id)
);
INSERT IGNORE INTO the_loai (id, ten_the_loai) VALUES
(1, 'Phim bộ'), (2, 'Phim chiếu rạp'), (3, 'Hành động'),(4, 'Tình cảm'),(5, 'Kinh dị'),
(6, 'Phiêu lưu'),(7, 'Hoạt hình'),(8, 'Hài'),(9, 'Viễn tưởng'),(10,'Chiến tranh'),
(11,'Học đường'),(12,'Lãng mạn'),(13,'Khoa học'),(14,'Gia đình'),(15,'Thần thoại'),(16,'Tâm lý'), 
(17,'Cổ trang'),(18,'Siêu anh hùng'),(19,'Tội phạm'),(20,'Hình sự'),(21,'Kịch'),(22,'Xuyên không'),
(23,'Đời sống'),(24,'Drama'),(25,'Phép thuật'),(26,'Zombie'),(27,'Thiếu nhi'),(28,'Game'),
(29,'Trinh thám'),(30,'Võ thuật');
INSERT IGNORE INTO vai_tro (id, ten_vai_tro) VALUES (1,'Admin'), (2,'User'), (3,'Đạo diễn'), (4,'Diễn viên');
INSERT IGNORE INTO users (id, ten_dang_nhap, mat_khau, ho_ten, email, so_dien_thoai, ngay_sinh, quyen_quan_tri, loai_tai_khoan) VALUES
(1,'haanh','lha123','Lê Hạ Anh','anhleha@gmail.com','0987655555','1995-08-31',4,'Diễn viên'),
(2,'hoangdo','13111997','Đỗ Nhật Hoàng','hoangdo@gmail.com','0987654444','1997-11-13',4,'Diễn viên'),
(3,'dinhtu','tukhang1911','Nguyễn Đình Khang','dinhkhang@gmail.com','0968857823','2000-10-1',4,'Diễn viên'),
(4,'dthaihuyen','huyen03091980','Đặng Thái Huyền','dangthaihuyen@gmail.com','0965837667','1980-09-03',3,'Đạo diễn'),
(5,'emma1990','15041990','Emma Watson','emmawatson@gmail.com','0987665544','1990-04-15',4,'Diễn Viên'),
(6,'dandan','123456789','Dan Stevens','stevens@gmail.com','0966823339','1982-10-10',4,'Diễn viên'),
(7,'billcondon','billbill2017','Bill Condon','billcondon10@gmail.com','0982138610','1955-10-22',3,'Đạo diễn'),
(8,'bichbui2004','2221050590','Bùi Ngọc Bích','buingocbich@gmail.com','0842184299','2004-01-10',1,'admin'),
(9,'thuy037','2221050037','Nguyễn Thị Thúy','thuy037@gmail.com','0822246912','2003-06-26',1,'admin'),
(10,'thuy039','2221050039','Nguyễn Thị Thúy','thuy039@gmail.com','0928367513','2004-12-11',1,'admin'),
(11,'lthanhmy','21092005','Lâm Thanh Mỹ','my2005@gmail.com','0920056664','2005-09-21',4,'Diễn viên'),
(12,'rima','rima123','Thanh Vy','rima15@gmail.com',NULL,'1995-03-08',4,'Diễn viên'),
(13,'diemdiem','diem123','Thúy Diễm','diem16@gmail.com',NULL,NULL,4,'Diễn viên'),
(14,'huutan1983','18101983','Trần Hữu Tấn','huutan1983@gmail.com',NULL,'1983-10-18',3,'Đạo diễn'),
(15,'trucanhne','tructruc98','Trúc Anh','trucanh1998@gmail.com',NULL,'1998-09-23',4,'Diễn Viên'),
(16,'nguyenthao','thao123','Huỳnh Thới Ngọc Thảo','nthao1994@gmail.com',NULL,NULL,4,'Diễn viên'),
(17,'phuonglan','05031983','Nguyễn Lan Phương','phuonglannguyen@gmail.com',NULL,'1983-03-05',4,'Diễn viên'),
(18,'phanhdao','phanh123','Đào Phương Anh',NULL,NULL,'1992-04-30',4,'Diễn viên'),
(19,'tranthanhtown','tranthanhhari','Huỳnh Trấn Thành',Null,Null,'1987-02-05',3,'Đạo diễn'),
(20,'nana33','nanana33','Cổ Lực Na Trát','natrat33@gmail.com',NULL,'1992-05-02',4,'Diễn Viên'),
(21,'maihuong24','huongphanmai','Phan Mai Hương','huonghuong24@gmail.com','0924036377','1992-01-04',2,'user'),
(22,'myle','23071999','Trần Thị Mỹ Lệ','tranle5@gmail.com','0958273666','1999-07-23',2,'user'),
(23,'uyenan26','an123','Huỳnh Uyển Ân','an26@gmail.com',NULL,'1999-02-15',4,'Diễn viên'),
(24,'baongoc','lambaongoc23@','Lâm Bảo Ngọc','baongoc23@gmail.com','0933028727','2001-01-28',2,'user'),
(25,'hoangoanh06','27092006','Nguyễn Lê Hoàng Oanh','Oanh06@gmail.com','0937268228','2006-09-27',2,'user'),
(26,'trangtit','123456789','Đòn Thị Quỳnh Trang','trangdoan@gmail.com','0929387382','2004-09-14',2,'user'),
(27,'lannhinguyen','987654321','Nguyễn Lan Nhi','nlnhi04@gmail.com','0922872003','2004-04-20',2,'user'),
(28,'qthang123','123@123','Trần Quyết Thắng','quyetthang123@gmail.com','0911111111','2000-01-01',2,'user'),
(29,'mhduy','duy123','Mai Hồng Duy','maihongduy@gmail.com','0911111112','2000-02-01',2,'user'),
(30,'truongdang','084321','Đặng Quang Trường','truong21@gmail.com','0911111113','2000-03-01',2,'user');

INSERT IGNORE INTO quoc_gia(id, ten_quoc_gia) VALUES
(1,'Việt Nam'), (2,'Trung Quốc'), (3,'Hàn Quốc'), (4,'Lào'), (5,'Nhật Bản'), (6,'Đài Loan'), (7,'HongKong'), (8,'Philippin'), (9,'Thái Lan'), 
(10,'Mexico'), (11,'Anh'), (12,'Mỹ'), (13,'Malaysia'), (14,'Canada'), (15,'Brazil'), (16,'Cuba'), (17,'Ấn Độ'), (18,'Peru'), (19,'Đan Mạch'), (20,'Myanmar'), (21,'Panama'), (22,'Ý'), (23,'Pháp'), (24,'Úc'), (25,'Đức'), (26,'Tây Ban Nha'), (27,'Ai Cập'), (28,'New Zealand'), (29,'Thụy Sĩ'), (30,'Singapore');
INSERT IGNORE INTO phim (id, ten_phim, dao_dien_id, the_loai_id, quoc_gia_id, tuoi, nam_phat_hanh, poster, so_tap, trailer, mo_ta)
VALUES
(1,'Mưa đỏ',4,10,1,16,2024,'640x396-muado.jpg',1,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF','Mưa đỏ là một bộ phim điện ảnh Việt Nam thuộc thể loại lịch sử – chiến tranh – chính kịch ra mắt năm 2025 do Đặng Thái Huyền làm đạo diễn, được chuyển thể từ tiểu thuyết cùng tên của nhà văn Chu Lai và đồng thời lấy cảm hứng từ sự kiện 81 ngày đêm chiến đấu để bảo vệ Thành cổ Quảng Trị năm 1972.'),
(2,'Thám tử lừng danh Conan',NULL,7,5,10,2024,'conanposter.jpg',1,'https://www.youtube.com/embed/C4pG3GbhQZw?si=AxYaCIxzFuW1jkDm','Thám tử lừng danh Conan: Ngôi sao 5 cánh 1 triệu đô là phim điện ảnh thứ 27 của series, xoay quanh cuộc đối đầu giữa Conan và Kaito Kid liên quan đến một thanh kiếm cổ của Toshizō Hijikata. Phim có sự xuất hiện của các nhân vật như Heiji Hattori và Toyama Kazuha, với nhiều pha hành động gay cấn và yếu tố lãng mạn, hài hước. '),
(3,'Người đẹp và quái vật',7,12,12,16,2022,'nguoidep_quaivat_poster.png',1,'https://www.youtube.com/embed/o6k1ChY8kDg?si=egpgKrR3uFIf507d','Người đẹp và Quái vật" (2017) kể về câu chuyện của Belle (Emma Watson) - một cô gái thông minh bị Quái vật (Dan Stevens) giam cầm trong lâu đài. Để hóa giải lời nguyền, Quái vật cần nhận được tình yêu đích thực trước khi cánh hoa hồng cuối cùng rơi xuống. Bộ phim còn có dàn diễn viên tài năng, âm nhạc hấp dẫn và công nghệ kỹ xảo tiên tiến.'),
(4,'Bỗng dưng trúng số',NULL,8,3,16,2022,'bongdungtrungso_poster.jpg',10,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ',NULL),
(5,'Kungfu Panda',NULL,7,2,12,2024,'pandaposter.jpg',1,'https://www.youtube.com/embed/habnAmcXrvc?si=1e8JDy2lso2QmVJb','Kung Fu Panda 4 là phần tiếp theo của loạt phim hoạt hình nổi tiếng, kể về hành trình của Po khi anh chuẩn bị trở thành Thủ lĩnh tinh thần của Thung lũng Bình Yên. Po phải tìm và huấn luyện một Chiến binh Rồng mới, đồng thời đối mặt với kẻ thù mới là mụ phù thủy Tắc Kè Bông (The Chameleon), kẻ có thể triệu hồi lại tất cả những kẻ thù cũ của Po. '),
(6,'Toy Story',NULL,7,12,16,2022,'toy.jpg',1,'https://www.youtube.com/embed/wmiIUN-7qhE?si=FA-0dvv9Gh_trLgP','Toy Story 4 là bộ phim hoạt hình của Pixar, ra mắt năm 2019, là phần tiếp theo của Toy Story 3. Bộ phim xoay quanh cuộc hành trình của Woody khi cậu cùng những người bạn đồ chơi mới là Forky, một món đồ chơi tự chế từ bộ đồ ăn, đi tìm chủ nhân mới của mình là Bonnie. Trên đường đi, Woody gặp lại tình cũ Bo Peep, người đã trở nên mạnh mẽ và độc lập sau nhiều năm lưu lạc. '),
(7,'Findet Nemo',NULL,7,12,12,2022,'nemo.jpg',1,'https://www.youtube.com/embed/86eaAc2Buvg?si=VMDo2i0ph20C8NNG','Hành trình đầy mạo hiểm của chú cá hề cha tên Marlin đi khắp đại dương để tìm lại con trai mình là Nemo, một chú cá hề nhỏ bị bắt đi khỏi rạn san hô. Đồng hành cùng Marlin trong cuộc tìm kiếm là cô cá Dory.'),
(8,'Ultraman Arc',NULL,18,5,12,2022,'ultra.webp',10,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A',NULL),
(9,'Hiệp sĩ mặt nạ: Gia đình siêu phàm',NULL,18,5,12,2023,'hiepsimatna.jpg',10,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A',NULL),
(10,'Hiệp sĩ mặt nạ: Bộ tam tội lỗi',NULL,18,5,12,2022,'hiepsimatna.jpg',10,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A',NULL),
(11,'Cám',14,5,1,16,2024,'cam.jpg',1,'https://www.youtube.com/embed/_8qUFEmPQbc?si=k_Gd6II2SIy31W6D','Lấy bối cảnh đầu thế kỷ 19, vào cuối thời nhà Lê - đầu nhà Nguyễn, phim xoay quanh câu chuyện hai chị em cùng cha khác mẹ Cám và Tấm. Từ bé, Cám sinh ra với ngoại hình dị dạng, bị xem là nỗi ô nhục của dòng họ.'),
(12,'Mắt Biếc',NULL,12,1,16,2019,'matbiec.jpg',1,'https://www.youtube.com/embed/ITlQ0oU7tDA?si=y0u_KJ9aJJupq1hb','"Mắt Biếc" là tiểu thuyết của nhà văn Nguyễn Nhật Ánh, kể về mối tình đơn phương của Ngạn dành cho Hà Lan, một cô gái có đôi mắt đẹp và ước mơ rời quê hương. Câu chuyện mở đầu từ tuổi thơ ở làng Đo Đo, Quảng Nam, sau đó đi qua những biến cố và sự xa cách khi cả hai ra thành phố, đan xen những xúc cảm về tình yêu, nỗi buồn và tình quê hương.'),
(13,'Tết ở làng địa ngục',NULL,5,1,16,2023,'tetolangdianguc.jpg',12,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH','"Tết ở làng địa ngục" là một phim truyền hình kinh dị cổ trang của Việt Nam, dựa trên tiểu thuyết cùng tên của nhà văn Thảo Trang. Phim xoay quanh những vụ án mạng kỳ dị tại một ngôi làng hẻo lánh, nơi sinh sống của hậu duệ một băng cướp khét tiếng, và những điềm báo về nghiệp báo từ tổ tiên.'),
(14,'Kẻ ăn hồn',NULL,5,1,16,2023,'keanhon.jpg',1,'https://www.youtube.com/embed/xWh0g4rKGjI?si=KFERjCjPMZ7oFmGW','Được chuyển thể từ tiểu thuyết cùng tên của nhà văn Thảo Trang. Phim xoay quanh câu chuyện về nhiều cái chết bí ẩn tại một ngôi làng nơi tồn tại thứ cổ thuật tà ác, với sự kiện chính là việc "5 mạng sống đổi lấy bình Rượu Sọ Người".'),
(15,'Mai',19,12,1,16,2023,'mai.jpg',1,'https://www.youtube.com/embed/EX6clvId19s?si=sDjvodTLY9sb0ZdO','Phim kể về cuộc đời của Mai, một người phụ nữ xinh đẹp nhưng phải đối mặt với nhiều khó khăn và định kiến xã hội vì nghề nghiệp. Cuộc sống của cô thay đổi khi gặp Dương, một chàng trai đào hoa, và cả hai đã cùng nhau tìm thấy những khoảnh khắc hạnh phúc.'),
(16,'Walle',NULL,7,5,10,2022,'walle.jpg',1,'https://www.youtube.com/embed/_kslEYbMr1g?si=8HKaMm-t_7ctP7mY',NULL),
(17,'Kẻ trộm mặt trăng: Minions',NULL,7,12,16,2022,'minion.jpg',10,'https://www.youtube.com/embed/1EHAxur2a2E?si=5M-iBzpYIdyO5ISA',NULL),
(18,'Phó Sơn Hải',NULL,17,2,16,2024,'phosonhai.jpg',15,'https://www.youtube.com/embed/km9F4c7hCjs?si=0JmyvbvWsnDc4ato',NULL),
(19,'Tử Dạ Quy',NULL,17,2,16,2024,'tudaquy.jpg',12,'https://www.youtube.com/embed/ygjm1DVpzjk?si=dKXLfwbhZp3wMC4w',NULL),
(20,'Hiến Ngư',NULL,17,2,16,2024,'hienngu.jpg',10,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF',NULL),
(21,'Ngày mưa đưa em đến',1,1,9,16,2024,'ngaymuaduaemden.jpg',20,'https://www.youtube.com/embed/DOXkQUw64hs?si=_ymLTrp2mTEITeLd',NULL),
(22,'Dữ Tấn Trường An',NULL,17,2,16,2024,'truongan.jpg',18,'https://www.youtube.com/embed/Y7yxVonwoPw?si=IZNf-QTCCSv1krGJ',NULL),
(23,'Quỷ Ăn Tạng',NULL,5,1,16,2024,NULL,1,NULL,NULL),
(24,'Công chúa bạch tuyết',NULL,15,12,16,2024,NULL,1,NULL,NULL),
(25,'Lọ lem',NULL,15,12,16,2024,NULL,1,NULL,NULL),
(26,'Về nhà đi con',NULL,14,1,16,2020,NULL,35,NULL,'Mo ta phim 1'),
(27,'Tử chiến trên không',NULL,3,1,16,2025,NULL,1,NULL,'Mo ta phim 1'),
(28,'Doraemon',NULL,1,5,10,2015,NUll,60,NULL,'Mo ta phim 1'),
(29,'Shin: Cậu bé bút chì',NULL,1,5,10,2015,NUll,60,NULL,'Mo ta phim 1'),
(30,'Home Alone',NULL,24,12,11,2008,NULL,2,NULL,'Mo ta phim 1');
INSERT IGNORE INTO phim_the_loai(id, phim_id, the_loai_id) VALUES
(1,1,2),(2,1,3),(3,1,10),(4,2,2),(5,2,7),(6,2,28),(7,3,2),(8,3,4),(9,3,12),(10,3,24),(11,4,4),(12,4,8),(13,5,7),(14,5,2),(15,6,7),(16,8,3),(17,8,18),
(18,8,27),(19,9,18),(20,9,27),(21,10,18),(22,10,27),(23,11,5),(24,11,17),(25,12,4),(26,12,12),(27,12,11),(28,13,2),(29,13,5),(30,13,17),(31,14,5),
(32,14,17),(33,15,4),(34,15,23),(35,15,14),(36,16,11),(37,17,11),(38,18,1),(39,18,23),(40,18,21),(41,19,1),(42,19,12),(43,20,4),(44,20,1),
(45,20,12),(46,21,4),(47,21,12),(48,21,1),(49,22,1),(50,22,12),(51,22,23);
INSERT IGNORE INTO phim_dien_vien (id, phim_id, dien_vien_id) VALUES
(1,1,1),(2,1,2),(3,1,3),(4,3,5),(5,3,6),(6,11,11),(7,11,12),(8,11,13),(9,12,15),(10,12,18),(11,13,16),(12,13,17),(13,14,16),(14,14,17),
(15,15,18),(16,15,2),(17,18,20),(18,19,20),(19,20,20),(20,22,20),(21,16,5),(22,17,6),(23,21,18),(24,20,17),(25,1,18),(26,21,6),(27,21,5);
INSERT IGNORE INTO tap_phim (id, id_phim, so_tap, tieu_de, thoi_luong, trailer)
VALUES
(1,1,1,'Full',105,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF'),
(2,2,1,'Full',95,'https://www.youtube.com/embed/C4pG3GbhQZw?si=AxYaCIxzFuW1jkDm'),
(3,3,1,'Full',90,'https://www.youtube.com/embed/o6k1ChY8kDg?si=egpgKrR3uFIf507d'),
(4,8,10,'Tập 1',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(5,8,10,'Tập 2',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(6,8,10,'Tập 3',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(7,8,10,'Tập 4',50,'https://www.youtube.com/embed/opqlStgO498?si=ghYZe-vptxh7B27A'),
(8,4,10,'Tập 1',45,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ'),
(9,4,10,'Tập 2',45,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ'),
(10,4,10,'Tập 3',45,'https://www.youtube.com/embed/D3KbO3QF-lg?si=F8L9BZr9z-y3xlaZ'),
(11,5,1,'Full',120,'https://www.youtube.com/embed/habnAmcXrvc?si=1e8JDy2lso2QmVJb'),
(12,6,1,'Full',100,'https://www.youtube.com/embed/wmiIUN-7qhE?si=FA-0dvv9Gh_trLgP'),
(13,7,1,'Full',90,'https://www.youtube.com/embed/86eaAc2Buvg?si=VMDo2i0ph20C8NNG'),
(14,11,1,'Full',100,'https://www.youtube.com/embed/_8qUFEmPQbc?si=k_Gd6II2SIy31W6D'),
(15,12,3,'Full',90,'https://www.youtube.com/embed/ITlQ0oU7tDA?si=y0u_KJ9aJJupq1hb'),
(16,13,12,'Tập 1',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(17,13,12,'Tập 2',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(18,13,12,'Tập 3',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(19,13,12,'Tập 4',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(20,13,12,'Tập 5',50,'https://www.youtube.com/embed/y1KGO8jdwVw?si=ZiN97UbrPlWhgtAH'),
(21,14,1,'Full',85,'https://www.youtube.com/embed/xWh0g4rKGjI?si=KFERjCjPMZ7oFmGW'),
(22,15,1,'Full',105,'https://www.youtube.com/embed/EX6clvId19s?si=sDjvodTLY9sb0ZdO'),
(23,16,1,'Full',95,'https://www.youtube.com/embed/_kslEYbMr1g?si=8HKaMm-t_7ctP7mY'),
(24,17,10,'Tập 2',50,'https://www.youtube.com/embed/1EHAxur2a2E?si=5M-iBzpYIdyO5ISA'),
(25,18,15,'Tập 3',60,'https://www.youtube.com/embed/km9F4c7hCjs?si=0JmyvbvWsnDc4ato'),
(26,19,12,'Tập 1',50,'https://www.youtube.com/embed/ygjm1DVpzjk?si=dKXLfwbhZp3wMC4w'),
(27,20,10,'Tập 1',50,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF'),
(28,20,10,'Tập 2',50,'https://www.youtube.com/embed/NKs7JSlqiAY?si=BUUr3Vu4DwReEdrF'),
(29,21,20,'Tập 1',50,'https://www.youtube.com/embed/DOXkQUw64hs?si=_ymLTrp2mTEITeLd'),
(30,21,20,'Tập 2',50,'https://www.youtube.com/embed/DOXkQUw64hs?si=_ymLTrp2mTEITeLd');
