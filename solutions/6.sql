SELECT
  albums.name as Name,
  albums.release_year as 'Release Year',
  SUM(songs.length) as 'Duration'
FROM albums
JOIN songs on albums.id = songs.album_id
GROUP BY songs.album_id
ORDER BY Duration DESC
LIMIT 1;