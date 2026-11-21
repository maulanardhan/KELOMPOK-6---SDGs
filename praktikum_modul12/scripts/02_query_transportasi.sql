--- A. Kasus Transportasi (database: transport_db)
SELECT t.trip_id, t.started_at, r.route_name
FROM trips AS t JOIN routes AS r ON r.route_id = t.route_id
WHERE t.route_id = 12 AND t.started_at >= '2026-11-01';

---B. SIGAP-MBG (database: db_distribusi_mbg)
SELECT
    s.nama_sekolah,
    d.tanggal,
    d.jumlah_porsi,
    d.kondisi_makanan
FROM DISTRIBUSI d
JOIN SEKOLAH s
    ON d.id_sekolah = s.id_sekolah
WHERE d.tanggal = '2026-10-26';
