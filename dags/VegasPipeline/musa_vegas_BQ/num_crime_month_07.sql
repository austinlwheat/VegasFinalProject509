select count(*) as counts,
Month
from musa_vegas_BQ.staging_crimetime_03

group by Month
order by Month asc
