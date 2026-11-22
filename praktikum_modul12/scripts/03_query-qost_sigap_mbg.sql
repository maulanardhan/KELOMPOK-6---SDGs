--- 2. Database db_distribusi_mbg
----------------------------------------
-- A. Query 3 – JOIN dengan Subquery (Filter di luar Subquery)
-- 1. SELECT
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

-- 2. EXPLAIN
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

-- 3. EXPLAIN ANALYZE
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
-- 1. SELECT
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

-- 2. EXPLAIN
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

-- 3. EXPLAIN ANALYZE
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

