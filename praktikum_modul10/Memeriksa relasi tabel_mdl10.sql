USE db_distribusi_mbg;\

SELECT 
  TABLE_NAME as 'Tabel Asal',
  COLUMN_NAME as 'Kolom FK',
  REFERENCED_TABLE_NAME as 'Tabel Tujuan',
  REFERENCED_COLUMN_NAME as 'Kolom PK'
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'db_distribusi_mbg'
	and REFERENCED_TABLE_NAME is not null;
  
