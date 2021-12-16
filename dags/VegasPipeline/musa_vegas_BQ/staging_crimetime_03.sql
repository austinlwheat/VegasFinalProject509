With parcingdata as(
SELECT * except(Event_Date),
parse_datetime("%m/%d/%Y %H:%M:%S", Event_Date) as Event_Date
from musa_vegas_BQ.staging_crimetype_02)

select Subtype,
Maintype,
the_geometry,
Event_Date,
ObjectId,
extract(MONTH from Event_Date) AS Month,
extract(YEAR from Event_Date) AS Year,
extract(HOUR from Event_Date) AS Time_of_day,
extract(DAYOFWEEK from Event_Date) As Day_of_week
from parcingdata
