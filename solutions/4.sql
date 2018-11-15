
/* This assummes all bands have a unique name */
SELECT DISTINCT bands.name AS 'Band Name'
FROM bands
JOIN albums ON bands.id = albums.band_id;

/* If bands do not have a unique name then use this query */
/* 
  SELECT bands.name AS 'Band Name'
  FROM bands
  JOIN albums ON bands.id = albums.band_id
  GROUP BY albums.band_id
  HAVING COUNT(albums.id) > 0;
*/