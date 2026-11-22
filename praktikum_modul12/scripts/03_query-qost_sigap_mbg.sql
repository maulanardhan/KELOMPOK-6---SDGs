--- 2. Database db_distribusi_mbg
----------------------------------------
-- A. Query 3 – JOIN dengan Subquery (Filter di luar Subquery)
-- Rencana 1 (Join / Full Scan Dahulu)
-- 1. SELECT (Query Utama:sql)
SELECT
    hasil.nama_sekolah,
    hasil.tanggal,
    hasil.jumlah_porsi,
    hasil.kondisi_makanan
FROM (
    SELECT
        s.nama_sekolah,
        d.tanggal,
        d.jumlah_porsi,
        d.kondisi_makanan
    FROM DISTRIBUSI d
    JOIN SEKOLAH s
        ON d.id_sekolah = s.id_sekolah
) AS hasil
WHERE hasil.tanggal = '2026-10-26';

-- 2. EXPLAIN (Memeriksa Execution Plan)
EXPLAIN
SELECT
    hasil.nama_sekolah,
    hasil.tanggal,
    hasil.jumlah_porsi,
    hasil.kondisi_makanan
FROM (
    SELECT
        s.nama_sekolah,
        d.tanggal,
        d.jumlah_porsi,
        d.kondisi_makanan
    FROM DISTRIBUSI d
    JOIN SEKOLAH s
        ON d.id_sekolah = s.id_sekolah
) AS hasil
WHERE hasil.tanggal = '2026-10-26';

-- 3. EXPLAIN ANALYZE (Memeriksa Execution Plan Analyze)
EXPLAIN ANALYZE
SELECT
    hasil.nama_sekolah,
    hasil.tanggal,
    hasil.jumlah_porsi,
    hasil.kondisi_makanan
FROM (
    SELECT
        s.nama_sekolah,
        d.tanggal,
        d.jumlah_porsi,
        d.kondisi_makanan
    FROM DISTRIBUSI d
    JOIN SEKOLAH s
        ON d.id_sekolah = s.id_sekolah
) AS hasil
WHERE hasil.tanggal = '2026-10-26';

-- B. Query 4 – JOIN dengan Subquery (Filter di dalam Subquery)
-- Rencana 2 (Seleksi / Filter Dahulu)
-- 1. SELECT (Query Utama:sql)
SELECT
    s.nama_sekolah,
    d.tanggal,
    d.jumlah_porsi,
    d.kondisi_makanan
FROM (
    SELECT *
    FROM DISTRIBUSI
    WHERE tanggal = '2026-10-26'
) AS d
JOIN SEKOLAH s
    ON d.id_sekolah = s.id_sekolah;

-- 2. EXPLAIN (Memeriksa Execution Plan)
EXPLAIN
SELECT
    s.nama_sekolah,
    d.tanggal,
    d.jumlah_porsi,
    d.kondisi_makanan
FROM (
    SELECT *
    FROM DISTRIBUSI
    WHERE tanggal = '2026-10-26'
) AS d
JOIN SEKOLAH s
    ON d.id_sekolah = s.id_sekolah;

-- 3. EXPLAIN ANALYZE (Memeriksa Execution Plan Analyze)
EXPLAIN ANALYZE
SELECT
    s.nama_sekolah,
    d.tanggal,
    d.jumlah_porsi,
    d.kondisi_makanan
FROM (
    SELECT *
    FROM DISTRIBUSI
    WHERE tanggal = '2026-10-26'
) AS d
JOIN SEKOLAH s
    ON d.id_sekolah = s.id_sekolah;

