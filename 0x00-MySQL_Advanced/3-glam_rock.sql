-- List all the bands with Glam Rock as their main style

SELECT band_name, (COALESCE(split, YEAR(CURRENT_DATE()) - 3) - formed) AS lifespan
FROM holberton.metal_bands
WHERE style LIKE '%Glam Rock%'
ORDER BY lifespan DESC;