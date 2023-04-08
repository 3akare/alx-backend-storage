-- List all the bands with Glam Rock as their main style
-- Because Glam Rock is the best
SELECT band_name, (IFNULL(split, '2020') - formed) AS lifespan
FROM holberton.metal_bands
WHERE FIND_IN_SET("Glam Rock", IFNULL(style, "")) > 0
ORDER BY lifespan DESC;
