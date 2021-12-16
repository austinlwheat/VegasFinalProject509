
With parcingdata as(
  SELECT *,
  parse_datetime("%m/%d/%Y %H:%M:%S", Event_Date) as Timestamp_Date
  from musa_vegas_BQ.staging_crimetype_02)

select Subtype,
Maintype,
the_geometry,
ObjectId,
Event_Date,
extract(MONTH from Timestamp_Date) AS Month,
extract(YEAR from Timestamp_Date) AS Year,
extract(HOUR from Timestamp_Date) AS Time_of_day,
extract(DAYOFWEEK from Timestamp_Date) As Day_of_week
from parcingdata
where Maintype = 'injure' AND Event_Date like '%2021%'
