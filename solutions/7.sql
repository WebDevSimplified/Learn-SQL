UPDATE albums,
	(SELECT id FROM albums WHERE release_year IS NULL) AS not_yet_released
SET albums.release_year = 1986
WHERE albums.id = not_yet_released.id;