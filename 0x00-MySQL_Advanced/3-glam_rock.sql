-- List all the bands with Glam Rock as their main style

SELECT band_name, (IFNULL(split, YEAR(CURRENT_DATE())) - formed) AS lifespan
FROM holberton.metal_bands
WHERE FIND_IN_SET("Glam Rock", style)
ORDER BY lifespan DESC;
