-- List all the bands with Glam Rock as their main style
-- Because Glam is the best
SELECT band_name, (IFNULL(split, YEAR(CURRENT_DATE())) - formed) AS lifespan
FROM metal_bands
WHERE FIND_IN_SET('Glam rock', IFNULL(style, "")) > 0
ORDER BY lifespan DESC;
