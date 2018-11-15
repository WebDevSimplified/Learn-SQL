/* This is the query used to get the id */
/*
  SELECT * FROM albums where release_year IS NULL;
*/

UPDATE albums
SET release_year = 1986
WHERE id = 4;