SELECT albums.name AS 'Name', albums.release_year AS 'Release Year', longest_album.Duration
FROM (
	SELECT album_id, sum(length) AS 'Duration'
    FROM songs
    GROUP BY album_id
    ORDER BY Duration DESC
    LIMIT 1
) AS longest_album
INNER JOIN albums ON longest_album.album_id = albums.id;