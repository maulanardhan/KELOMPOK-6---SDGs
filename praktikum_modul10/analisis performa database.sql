--- 1) Pengujian Query Sebelum Index
explain 
	select 
		id_distribusi,
		id_sekolah, 
		tanggal, 
		kondisi_makanan 
from distribusi
where tanggal >= '2026-10-26'
and tanggal < '2026-11-01';

--- 2)  Membuat Index
create index idx_tanggal_distribusi
ON distribusi(tanggal);

--- 3) Periksa indeks:
SHOW INDEX FROM distribusi;

--- 4) Pengujian Query Setelah Index
explain 
	select 
		id_distribusi,
		id_sekolah, 
		tanggal, 
		kondisi_makanan 
from distribusi
where tanggal >= '2026-10-26'
and tanggal < '2026-11-01';
