/* This is the query used to get the id */
/*
  SELECT * FROM albums where release_year IS NULL;
*/

/*
UPDATE albums
SET release_year = 1986
WHERE id = 4;
*/

/* 
The above solution doesn't seem practical
if you have many different ids whose release_year IS NULL
*/

UPDATE albums,
	(SELECT id FROM albums WHERE release_year IS NULL) AS not_yet_released
SET albums.release_year = 1986
WHERE albums.id = not_yet_released.id;
