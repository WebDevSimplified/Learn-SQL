/*
SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id
HAVING COUNT(albums.id) = 0;
*/

/*
The given solution throws an error:
Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'record_company.bands.name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
*/
SELECT bands.name AS 'Band Name'
FROM bands 
INNER JOIN (
	SELECT bands.id as id
	FROM bands
	LEFT JOIN albums ON bands.id = albums.band_id
	WHERE albums.band_id IS NULL
) AS bands_with_no_albums
ON bands.id = bands_with_no_albums.id;
