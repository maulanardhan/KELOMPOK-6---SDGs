--- 5. Mengisi Data Produk menggunakan JSON
-- Informasi yang disimpan meliputi kandungan gizi, komposisi, dan alergen.
-- Menu pertama
UPDATE menu
SET detail_menu = '{
    "jenis": "Makanan Utama",
    "kandungan_gizi": {
        "kalori": "450 kkal",
        "protein": "25 gram",
        "karbohidrat": "60 gram",
        "lemak": "12 gram"
    },
 "komposisi": [
        "Nasi",
        "Ayam",
        "Sayur",
        "Buah"
    ],
    "alergen": [
        "Tidak diketahui"
    ]
}'
WHERE nama_menu = 'Nasi Ayam Sayur';

-- Menu kedua
UPDATE menu
SET detail_menu = '{
    "jenis": "Makanan Utama",
    "kandungan_gizi": {
        "kalori": "420 kkal",
        "protein": "22 gram",
        "karbohidrat": "55 gram",
        "lemak": "10 gram"
    },
    "komposisi": [
        "Nasi",
        "Ikan",
        "Tahu",
        "Sayuran"
    ],
    "alergen": [
        "Ikan",
        "Kedelai"
    ]
}'
WHERE nama_menu = 'Nasi Ikan Tahu';

-- Menu ketiga
UPDATE menu
SET detail_menu = '{
    "jenis": "Makanan Utama",
    "kandungan_gizi": {
        "kalori": "400 kkal",
        "protein": "18 gram",
        "karbohidrat": "58 gram",
        "lemak": "9 gram"
    },
    "komposisi": [
        "Nasi",
        "Telur",
        "Bayam",
        "Buah"
    ],
    "alergen": [
        "Telur"
    ]
}'
WHERE nama_menu = 'Nasi Telur Bayam';

----------------------------------------------
--- 6. Membaca data JSON
-- Menampilkan seluruh informasi menu
SELECT
    id_menu,
    nama_menu,
    tanggal_menu,
    detail_menu
FROM menu;

-- Mengambil jenis menu
SELECT
    nama_menu,
    JSON_EXTRACT(
        detail_menu,
        '$.jenis'
    ) AS jenis_menu
FROM menu;

-- Mengambil informasi kalori
SELECT
    nama_menu,
    JSON_EXTRACT(
        detail_menu,
        '$.kandungan_gizi.kalori'
    ) AS kalori
FROM menu;

-- Mengambil informasi protein
SELECT
    nama_menu,
    JSON_EXTRACT(
        detail_menu,
        '$.kandungan_gizi.protein'
    ) AS protein
FROM menu;

-- Mengambil daftar komposisi
SELECT
    nama_menu,
    JSON_EXTRACT(
        detail_menu,
        '$.komposisi'
    ) AS komposisi
FROM menu;

-------------------------------------------------
--- 7. Mengubah atribut JSON
-- Informasi protein pada menu Nasi Ayam Sayur diperbarui menjadi 30 gram.
UPDATE menu
SET detail_menu = JSON_SET(
    detail_menu,
    '$.kandungan_gizi.protein',
    '30 gram'
)
WHERE nama_menu = 'Nasi Ayam Sayur';

-- Memeriksa hasil perubahan
SELECT
    nama_menu,
    JSON_EXTRACT(
        detail_menu,
        '$.kandungan_gizi.protein'
    ) AS protein
FROM menu
WHERE nama_menu = 'Nasi Ayam Sayur';

-------------------------------------------------
--- 8. Menambahkan Atribut JSON
-- Menambahkan informasi kategori makanan.
UPDATE menu
SET detail_menu = JSON_SET(
    detail_menu,
    '$.kategori',
    'Menu Bergizi'
)
WHERE nama_menu = 'Nasi Ayam Sayur';

-- Memeriksa hasil penambahan
SELECT
    nama_menu,
    detail_menu
FROM menu
WHERE nama_menu = 'Nasi Ayam Sayur';

-------------------------------------------------
--- 9. Menghapus Atribut JSON
-- menghapus atribut kategori yang sebelumnya ditambahkan.
UPDATE menu
SET detail_menu = JSON_REMOVE(
    detail_menu,
    '$.kategori'
)
WHERE nama_menu = 'Nasi Ayam Sayur';

-- Memeriksa hasil penghapusan
SELECT
    nama_menu,
    detail_menu
FROM menu;

-------------------------------------------------
--- 10. Pencarian Berdasarkan Atribut JSON
-- Mencari menu dengan protein 30 gram
SELECT
    nama_menu,
    detail_menu
FROM menu
WHERE JSON_UNQUOTE(
    JSON_EXTRACT(
        detail_menu,
        '$.kandungan_gizi.protein'
    )
) = '30 gram';

-- Mencari menu yang memiliki alergen telur
SELECT
    nama_menu,
    detail_menu
FROM menu
WHERE JSON_CONTAINS(
    detail_menu,
    '"Telur"',
    '$.alergen'
);

-- Menghitung jumlah komposisi setiap menu
SELECT
    nama_menu,
    JSON_LENGTH(
        JSON_EXTRACT(detail_menu, '$.komposisi')
    ) AS jumlah_komposisi
FROM menu;

-------------------------------------------------
--- 11. Menguji Fungsi JSON lainnya
-- Membuat objek JSON informasi menu
SELECT JSON_OBJECT(
    'nama_menu', 'Nasi Ayam Sayur',
    'kalori', '450 kkal',
    'protein', '25 gram'
) AS informasi_menu;

-- Membuat array JSON komposisi makanan
SELECT JSON_ARRAY(
    'Nasi',
    'Ayam',
    'Sayur',
    'Buah'
) AS komposisi_makanan;

-- Memeriksa validitas JSON
SELECT JSON_VALID(
    '{"nama_menu":"Nasi Ayam Sayur","kalori":"450 kkal"}'
) AS json_valid;
