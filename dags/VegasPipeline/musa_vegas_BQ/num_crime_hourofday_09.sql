select count(*) as counts,
Time_of_day
from musa_vegas_BQ.staging_crimetime_03
group by Time_of_day
order by Time_of_day asc
