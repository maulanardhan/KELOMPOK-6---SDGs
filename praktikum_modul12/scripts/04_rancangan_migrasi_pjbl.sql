--- Perintah DCL pada DBMS Target (SIGAP-MBG — db_distribusi_mbg)
----------------------------------------------------------------
-- Membuat User & Memberi Hak Akses:sql
CREATE USER 'report_mbg'@'localhost' 
  IDENTIFIED BY 'dbmbg123';
GRANT SELECT ON db_distribusi_mbg.distribusi 
  TO 'report_mbg'@'localhost';

-- Operasi Baca pada Objek Diizinkan:sql
SELECT * FROM db_distribusi_mbg.distribusi LIMIT 5;

-- Operasi Baca Setelah REVOKE:sql
REVOKE SELECT ON db_distribusi_mbg.* 
  FROM 'report_mbg'@'%';
FLUSH PRIVILEGES;

-- Pengujian ulang setelah dicabut:sql
SELECT * FROM db_distribusi_mbg.distribusi LIMIT 5;

-- * Operasi Hapus (DELETE) Tanpa Izin:sql
DELETE FROM db_distribusi_mbg.distribusi
WHERE id_distribusi = 1;

-- * Pemeriksaan Status Hak Akses:sql
SHOW GRANTS FOR 'report_mbg'@'%';
