--- Representasi konsep objek menggunakan tabel.
-- (1) Membuat tabel objek menu

CREATE TABLE menu_objek (
    id_objek INT AUTO_INCREMENT PRIMARY KEY,
    nama_menu VARCHAR(150) NOT NULL,
    jenis_menu VARCHAR(50) NOT NULL,
    detail_menu JSON
) ENGINE=InnoDB;

-- (2) Mengisi data objek

INSERT INTO menu_objek
(nama_menu, jenis_menu, detail_menu)
VALUES
(
    'Nasi Ayam Sayur',
    'MenuUtama',
    '{"kalori":450,"protein":30,"komposisi":["Nasi","Ayam","Sayur"]}'
),
(
    'Nasi Ikan Tahu',
    'MenuProtein',
    '{"kalori":420,"protein":28,"sumber_protein":["Ikan","Tahu"]}'
),
(
    'Nasi Sayur Tempe',
    'MenuVegetarian',
    '{"kalori":380,"protein":18,"komposisi":["Nasi","Sayur","Tempe"]}'
);

-- (3) Mengambil data berdasarkan jenis objek

SELECT * FROM menu_objek
WHERE jenis_menu = 'MenuUtama';

SELECT * FROM menu_objek
WHERE jenis_menu = 'MenuProtein';

-- (4) Menggabungkan Data Objek dan Relasional
USE db_distribusi_mbg;

SELECT
    m.id_menu,
    m.nama_menu,
    d.*,
    mo.jenis_menu,
    JSON_EXTRACT(
        mo.detail_menu,
        '$.protein'
    ) AS kandungan_protein
FROM menu m
JOIN distribusi d
    ON m.id_menu = d.id_menu
LEFT JOIN menu_objek mo
    ON m.nama_menu = mo.nama_menu;
