insert into sekolah (nama_sekolah, alamat, npsn)
values ('SMPN 1 Madiun', 'Jl. Kartini No. 4', '20534165');

insert into pengguna (nama, username, password, peran, id_sekolah)
values  ('Rendra', 'rendra', 'rendrasandi_5', 'guru', 5);

insert into distribusi (tanggal, waktu_tiba, jumlah_porsi, kondisi_makanan, tingkat_sisa_makanan, id_sppg, id_sekolah, id_menu)
values ('2026-10-29', '09:15:00', 180, 'Baik', 'Rendah', 1, 5, 1);
