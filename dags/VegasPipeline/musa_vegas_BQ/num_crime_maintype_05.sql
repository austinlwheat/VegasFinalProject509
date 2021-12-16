SELECT Maintype,
sum(ObjectId) as number
FROM musa_vegas_BQ.staging_crimetime_03
GROUP BY Maintype
order by 2 asc
