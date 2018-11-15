SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;