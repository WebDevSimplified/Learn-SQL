/* MY SUGGESTION */
SELECT bands.name AS 'Band Name'
FROM bands 
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.band_id IS NULL



/* ORIGINAL QUERIES */
/* PS: it didn't work for me :\ */
/*SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id
HAVING COUNT(albums.id) = 0;*/
