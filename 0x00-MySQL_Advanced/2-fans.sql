-- Ranks Country Origins of Bands Ordered by the number of (non-unique) fans
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER by nb_fans DESC
