USE db_distribusi_mbg;
ALTER TABLE sekolah add column total_porsi int default 0;

UPDATE sekolah s
SET s.total_porsi = (
    SELECT COALESCE(SUM(d.jumlah_porsi), 0)
    FROM distribusi d
    WHERE d.id_sekolah = s.id_sekolah
)
WHERE s.id_sekolah > 0;

SELECT id_sekolah, nama_sekolah, total_porsi FROM sekolah;
