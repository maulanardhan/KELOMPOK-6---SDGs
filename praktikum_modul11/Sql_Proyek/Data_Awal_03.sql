-- 1.Membuat DataBase
USE db_distribusi_mbg;
SHOW TABLES;

DESCRIBE MENU;

-- 2. Membuat Tabel Kategori
ALTER TABLE menu ADD COLUMN detail_menu JSON;

-- 3. Membuat Tabel Produk
CREATE TABLE menu (
  id_menu INT AUTO_INCREMENT PRIMARY KEY,
  nama_menu VARCHAR(100) NOT NULL,
  deskripsi TEXT,
  tanggal_menu DATE,
  );

-- 4. Mengisi Data Kategori 
INSERT INTO menu (nama_menu, deskripsi, tanggal_menu) VALUES
('Nasi Ayam Sayur', 'Nasi, Ayam goreng, Tumis Sayur', '2026-10-26')
('Nasi Ikan Tahu', 'Nasi, Ikan, Tahu, Lalapan', '2026-10-27')
('Nasi Telur Bayam', 'Nasi, Telur, Sayur Bayam', '2026-10-28');

-- 5. Memeriksa Seluruh Data
SELECT * FROM menu;
