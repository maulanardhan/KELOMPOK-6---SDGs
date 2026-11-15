DROP DATABASE IF EXISTS db_distribusi_mbg;
CREATE DATABASE db_distribusi_mbg;
USE db_distribusi_mbg;

CREATE TABLE sekolah (
    id_sekolah INT AUTO_INCREMENT PRIMARY KEY,
    nama_sekolah VARCHAR(100) NOT NULL,
    alamat TEXT,
    npsn VARCHAR(50)
);

CREATE TABLE pengguna (
    id_pengguna INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    peran VARCHAR(50),
    id_sekolah INT NOT NULL,
    FOREIGN KEY (id_sekolah) REFERENCES sekolah(id_sekolah) ON DELETE CASCADE
);

CREATE TABLE sppg (
    id_sppg INT AUTO_INCREMENT PRIMARY KEY,
    nama_sppg VARCHAR(100) NOT NULL,
    divisi VARCHAR(50),
    wilayah VARCHAR(100)
);

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nama_menu VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    tanggal_menu DATE
);

CREATE TABLE distribusi (
    id_distribusi INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE NOT NULL,
    waktu_tiba TIME,
    jumlah_porsi INT,
    kondisi_makanan VARCHAR(100),
    tingkat_sisa_makanan VARCHAR(50),
    id_sppg INT NOT NULL,
    id_sekolah INT NOT NULL,
    id_menu INT NOT NULL,
    FOREIGN KEY (id_sppg) REFERENCES sppg(id_sppg) ON DELETE CASCADE,
    FOREIGN KEY (id_sekolah) REFERENCES sekolah(id_sekolah) ON DELETE CASCADE,
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE
);

CREATE TABLE umpan_balik (
    id_umpan_balik INT AUTO_INCREMENT PRIMARY KEY,
    jenis VARCHAR(50),
    isi TEXT NOT NULL,
    tingkat_kepuasan VARCHAR(50),
    tanggal DATE NOT NULL,
    id_pengguna INT NOT NULL,
    FOREIGN KEY (id_pengguna) REFERENCES pengguna(id_pengguna) ON DELETE CASCADE
);

INSERT INTO sekolah (nama_sekolah, alamat, npsn) VALUES
('SDN 02 Mojorejo Taman',  'Jl. Abdul Rahman Saleh No. 1', '20534262'),
('SDN 01 Taman',  'Jl. Kemiri No. 1', '20534131'),
('SMPN 4 Madiun',  'Jl. Abdul Rahman Saleh No. 3', '20534168'),
('SMAN 1 Madiun','Jl. Mastrip No.19', '20534125');  
 
INSERT INTO pengguna (nama, username, password, peran, id_sekolah) VALUES
('Titiek',  'titiek',  'titiekwati_1', 'guru', 1),
('Budi',  'Budi',  'budipangestu_2', 'guru', 2),
('Yuni',  'yuni',  'yunisanti_3', 'admin', 3),
('Tri',  'tri',  'tribudi_4', 'guru', 4);
 
INSERT INTO sppg (nama_sppg, divisi, wilayah) VALUES
('SPPG Mojorejo', 'Distribusi', 'Kel. Mojorejo'),
('SPPG Kota Madiun Taman Demangan', 'Distribusi', 'Kel. Demangan');
 
INSERT INTO menu (nama_menu, deskripsi, tanggal_menu) VALUES
('Nasi Ayam Sayur', 'Nasi, ayam goreng, tumis sayur', '2026-10-26'),
('Nasi Ikan Tahu',  'Nasi, ikan, tahu, lalapan', '2026-10-27'),
('Nasi Telur Bayam','Nasi, telur, sayur bayam', '2026-10-28');
 
INSERT INTO distribusi
(tanggal, waktu_tiba, jumlah_porsi, kondisi_makanan, tingkat_sisa_makanan, id_sppg, id_sekolah, id_menu) VALUES
('2026-10-26','09:30:00',200,'Baik','Rendah',1,1,1),
('2026-10-27','09:45:00',210,'Baik','Sedang',1,1,2),
('2026-10-28','10:00:00',205,'Baik','Rendah',1,1,3),
('2026-10-26','10:10:00',150,'Baik','Rendah',2,2,1),
('2026-10-27','10:20:00',155,'Cukup','Tinggi',2,2,2),
('2026-10-28','10:05:00',150,'Baik','Sedang',2,2,3),
('2026-10-26','11:00:00',300,'Baik','Rendah',1,3,1),
('2026-10-27','11:15:00',310,'Baik','Rendah',1,3,2);
 
INSERT INTO umpan_balik (jenis, isi, tingkat_kepuasan, tanggal, id_pengguna) VALUES
('Saran', 'Porsi sayur ditambah', 'Puas', '2026-10-26', 1),
('Keluhan','Makanan agak dingin', 'Kurang puas', '2026-10-27', 2),
('Pujian', 'Menu variatif dan enak', 'Sangat puas', '2026-10-28', 3);
