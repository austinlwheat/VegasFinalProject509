with staging_crimeclean01 as(
select *,
case when `LONG`='None' then null else `LONG` end as clean_long,
case when `LAT`='None' then null else `LAT` end as clean_lat
from `final-509.musa_vegas_BQ.crimedata`),

staging_crimeclean02 as (
SELECT *,
  safe_CAST(`LONG` AS numeric) AS longnew,
  safe_CAST(`LAT` AS numeric) AS latnew,
FROM staging_crimeclean01),

staging_crimeclean03 as (
Select *,
st_geogpoint(longnew,latnew) as the_geometry
FROM staging_crimeclean02
    where latnew >1)

    Select *
    except (`LAT`,`Type`,`LONG`,clean_long,clean_lat,geometry,the_geom,`Beat`,`Disposition`,`Map_X`,`Map_Y`,`New_Y`,`WARD`)
    FROM staging_crimeclean03
