# Solution 1
/* Assumes band names are unique */
SELECT DISTINCT(bands.name) AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.band_id IS NULL;


/* No such assumption */
# Solution 2
SELECT bands.name AS 'Band Name'
FROM bands 
INNER JOIN (
	SELECT bands.id as id
	FROM bands
	LEFT JOIN albums ON bands.id = albums.band_id
	WHERE albums.band_id IS NULL
) AS bands_with_no_albums
ON bands.id = bands_with_no_albums.id;


/*
Note:
There's an issue with the given solution: https://github.com/WebDevSimplified/Learn-SQL/issues/8
The fellow who closed it must have changed the mode of SQL to something else.
But it's been suggested to use full_group_by mode for SQL to avoid "inconsistencies".
(Basically, find a different way to solve your problem
 without using columns in SELECT that were not included in your GROUP BY.)
*/