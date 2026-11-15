--- 1)	Pengujian COMMIT
insert into  menu (nama_menu, deskripsi, tanggal_menu) 
	values ('Nasi Goreng Telur', 'Nasi goreng dengan telur mata sapi', 	'2026-10-29');

commit;

-- periksa hasil
select*from menu where nama_menu = 'Nasi Goreng Telur';

--- 2)	Pengujian ROLLBACK
insert into menu (nama_menu, deskripsi, tanggal_menu) 
	values ('Mie Goreng Spesial', 'Mie goreng dengan tambahan sosis', 	'2026-10-30');

	rollback;

-- periksa hasil
select*from menu where nama_menu = 'Mie Goreng Spesial';
