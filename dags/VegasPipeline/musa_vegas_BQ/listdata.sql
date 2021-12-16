with a as(select
    count(c.ObjectId) as crimecounts,
    t.GEOID
    from musa_vegas_BQ.staging_crimetime_03 as c
    join `final-509.musa_vegas_BQ.lv_cbg` as t
        on ST_contains(
             t.geometry,c.the_geometry)
        group by 2
        order by 1)

select a.crimecounts,
a.GEOID,
b.geometry
from a
join `final-509.musa_vegas_BQ.lv_cbg` as b
on a.GEOID = b.GEOID
order by crimecounts desc limit 5
