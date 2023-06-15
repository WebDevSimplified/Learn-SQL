# Solution 1
/* Assumes that bands with different ids have different names. */
SELECT DISTINCT(b.name) AS 'Band Name'
FROM albums AS a
INNER JOIN (bands AS b) ON a.band_id = b.id;


/* The following two solutions don't assume that. */

# Solution 2
SELECT name AS 'Band Name'
FROM bands
INNER JOIN (SELECT DISTINCT(band_id) AS album_band_id FROM albums) AS bands_with_albums
ON bands_with_albums.album_band_id = bands.id;


# Solution 3
SELECT name AS 'Band Name'
FROM bands
INNER JOIN (SELECT band_id FROM albums GROUP BY band_id) AS bands_with_albums
ON bands_with_albums.band_id = bands.id;
