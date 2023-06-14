# My solution
SELECT albums.*
FROM albums
INNER JOIN 
(SELECT min(release_year) AS release_year FROM albums) AS oldest_album
ON albums.release_year = oldest_album.release_year;


# Given solution
SELECT *
FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;