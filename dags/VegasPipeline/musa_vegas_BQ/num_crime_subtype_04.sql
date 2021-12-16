SELECT Subtype,
COUNT(ObjectId) as number
FROM musa_vegas_BQ.staging_crimetime_03
GROUP BY Subtype
order by 2 asc
