  select count(*) as counts,
  Year
  from musa_vegas_BQ.staging_crimetime_03
  group by Year
  order by Year asc
