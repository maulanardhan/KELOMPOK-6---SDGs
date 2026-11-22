-- I.	IDENTIFIKASI DBMSI
--- Mengidentifikasi kelengkapan DBMS_4

--- Mengetahui versi DBMS 
SELECT VERSION();

--- Mengetahui Versi DBMS 
SELECT @@version_comment;

--- melihat storage engine
SHOW ENGINES;

--- Melihat karakteristik Server
SHOW VARIABLES LIKE 'character_set_server';

--- melihat collation 
SHOW VARIABLES LIKE 'collation_server';

--- periksa fasilitas yang ada
--- Memeriksa storage engine InnoDB
SHOW ENGINES;

--- Memeriksa dukungan fungsi JSON pada database SIGAP-MBG
SELECT
  JSON_VALID('{
    "nama_menu":"Nasi Ayam Sayur",
    "jenis":"Makanan Utama",
    "protein": 30,
    "kalori": 450
  }')AS json_valid,

JSON_EXTRACT(
  '{
    "nama_menu":"Nasi Ayam Sayur"
    "jenis":"Makanan Utama",
    "protein": 30,
    "kalori": 450
  }',
    '$.nama_menu'
  ) AS nama_menu;

  
  
