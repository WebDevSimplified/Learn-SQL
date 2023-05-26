/* This is the query used to get the album id of the album added in #8 */
/*
  SELECT id FROM albums
  ORDER BY id DESC LIMIT 1;
*/

/*
DELETE FROM albums
WHERE id = 19;
*/

/* This is the query used to get the band id of the band added in #8 */
/*
  SELECT id FROM bands
  ORDER BY id DESC LIMIT 1;
*/

/*
DELETE FROM bands
WHERE id = 8;
*/

/*
No harcoding the id
*/
DELETE FROM albums
WHERE albums.band_id
IN (SELECT id FROM bands WHERE name = 'SSSPSN');

SELECT * FROM albums;

/*
Note the apparently redundant but necessary use of the SELECT * subquery
*/
DELETE FROM bands
WHERE id IN (SELECT * FROM (SELECT id FROM bands WHERE name = 'SSSPSN') AS to_delete);

SELECT * FROM bands;
