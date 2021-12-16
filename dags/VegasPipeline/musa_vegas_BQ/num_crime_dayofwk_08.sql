select count(*) as counts,
Day_of_week
from musa_vegas_BQ.staging_crimetime_03
group by Day_of_week
order by Day_of_week asc
