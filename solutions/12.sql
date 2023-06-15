SELECT bands.name AS 'Band', songs_per_band AS 'Number of Songs'
FROM bands
INNER JOIN (
	SELECT band_id, sum(albums_songs.songs_per_album) AS songs_per_band
    FROM albums
    INNER JOIN (
		SELECT album_id, count(album_id) AS songs_per_album
        FROM songs
        GROUP BY album_id
	) AS albums_songs
    ON albums.id = albums_songs.album_id
    GROUP BY band_id
) AS bands_songs
ON bands.id = bands_songs.band_id;