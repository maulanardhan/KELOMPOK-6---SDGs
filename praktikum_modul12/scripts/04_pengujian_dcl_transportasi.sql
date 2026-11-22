--- Perintah DCL pada DBMS Target (Transportasi — transport_db)
---------------------------------------------------------------
-- Membuat User & Memberi Hak Akses:sql
CREATE USER 'report_user'@'localhost' 
  IDENTIFIED BY 'GantiDenganPasswordKuat!';

GRANT SELECT 
  ON transport_db.trips 
  TO 'report_user'@'localhost';

SHOW GRANTS FOR 'report_user'@'localhost';

-- Operasi Baca pada Objek Diizinkan:sql
SELECT * FROM transport_db.trips LIMIT 5;

-- Operasi Baca Setelah REVOKE:sql
REVOKE SELECT 
  ON transport_db.* 
  FROM 'report_user'@'%';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'report_user'@'%';

-- Pengujian ulang setelah dicabut:sql
SELECT * FROM transport_db.trips LIMIT 5;

-- Operasi Hapus (DELETE) Tanpa Izin:sql
DELETE FROM transport_db.trips LIMIT 1;

-- Pemeriksaan Status Hak Akses:sql
SHOW GRANTS FOR 'report_user'@'%';
