-- 1.Membuat DataBase
USE db_distribusi_mbg;
SHOW TABLES;

DESCRIBE MENU;

-- 2. Membuat Tabel Kategori
ALTER TABLE menu ADD COLUMN detail_menu JSON;

