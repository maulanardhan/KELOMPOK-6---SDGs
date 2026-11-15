--- 1.	CREATE – Menambahkan Data
INSERT INTO sekolah (nama_sekolah, alamat, npsn)
VALUES ('SMPN 1 Madiun', 'Jl. Kartini No. 4', '20534165');

INSERT INTO pengguna (nama, username, password, peran, id_sekolah)
VALUES ('Rendra', 'rendra', 'rendrasandi_5', 'guru', 5);

INSERT INTO distribusi (tanggal, waktu_tiba, jumlah_porsi, kondisi_makanan, tingkat_sisa_makanan, id_sppg, id_sekolah, id_menu)
VALUES ('2026-10-29', '09:15:00', 180, 'Baik', 'Rendah', 1, 5, 1);

--- 2.	READ – Membaca Data
SELECT
	d.id_distribusi,
	d.tanggal,
	s.nama_sekolah,
	p.nama_sppg,
	m.nama_menu,
	d.jumlah_porsi,
	d.kondisi_makanan
FROM distribusi d 
INNER JOIN sekolah s on d.id_sekolah = s.id_sekolah 
INNER JOIN sppg p on d.id_sppg = p.id_sppg
INNER JOIN menu m on d.id_menu = m.id_menu;

SELECT 
    p.id_pengguna,
    p.nama AS 'Nama Pengguna',
    p.peran,
    s.nama_sekolah AS 'Sekolah Tugas'
FROM pengguna p
INNER JOIN sekolah s ON p.id_sekolah = s.id_sekolah;
	
--- 3.	UPDATE – Memperbarui Data
UPDATE distribusi
SET jumlah_porsi = 190, kondisi_makanan = "Sangat Baik"
WHERE id_distribusi = 1;

UPDATE sekolah 
SET alamat = 'Jl. Abdul Rahman Saleh No. 1A, Madiun' 
WHERE id_sekolah = 1;

--- 4.	DELETE – Menghapus Data
DELETE FROM sekolah WHERE id_sekolah = 5;

SELECT*FROM pengguna WHERE id_sekolah = 5;

SELECT*FROM distribusi WHERE id_sekolah = 5;

--- a. Menguji Integritas Referensial
-- 1 (Insert Pelanggaran FK) 
insert into  distribusi (tanggal, waktu_tiba, jumlah_porsi, kondisi_makanan, tingkat_sisa_makanan, id_sppg, id_sekolah, id_menu) 
values  ('2026-10-26', '10:00:00', 100, 'Baik', 'Rendah', 1, 99, 1);

ALTER TABLE distribusi DROP FOREIGN KEY distribusi_ibfk_2;

ALTER TABLE distribusi ADD CONSTRAINT fk_distribusi_sekolah 
   FOREIGN KEY (id_sekolah) REFERENCES sekolah(id_sekolah) ON DELETE RESTRICT;
-- GAGAL.

-- 2 (Delete Pelanggaran RESTRICT)
DELETE FROM sekolah WHERE id_sekolah = 1;
-- GAGAL.


