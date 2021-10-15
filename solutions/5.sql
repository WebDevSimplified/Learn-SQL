SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id
HAVING COUNT(albums.id) = 0;

/* 
Also a valid solution:

SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.id IS NULL;
*/
