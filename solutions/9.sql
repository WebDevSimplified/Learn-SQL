DELETE FROM albums
WHERE albums.band_id
IN (SELECT id FROM bands WHERE name = 'SSSPSN');

SELECT * FROM albums;


DELETE FROM bands
WHERE id IN (SELECT * FROM (SELECT id FROM bands WHERE name = 'SSSPSN') AS to_delete);

SELECT * FROM bands;