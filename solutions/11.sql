/*
SELECT
  albums.name AS 'Album',
  albums.release_year AS 'Release Year',
  MAX(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id;
*/

SELECT albums.name AS 'Name', albums.release_year AS 'Release Year', longest_songs.duration AS 'Duration'
FROM albums
INNER JOIN (
	SELECT album_id, max(length) AS duration FROM songs
	GROUP BY album_id
) AS longest_songs
ON albums.id = longest_songs.album_id;
