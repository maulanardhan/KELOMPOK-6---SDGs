USE db_distribusi_mbg;
SELECT s.id_sekolah,
       s.nama_sekolah,
       COUNT(d.id_distribusi) AS jumlah_distribusi,
       COALESCE(SUM(d.jumlah_porsi), 0) AS total_porsi
FROM sekolah s
LEFT JOIN distribusi d ON s.id_sekolah = d.id_sekolah
GROUP BY s.id_sekolah, s.nama_sekolah
ORDER BY s.id_sekolah;
