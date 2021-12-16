  select FACILITY_NAME as station_name,
      FACILITY_ADDRESS as address,
      STATION_NUMBER,
      CAPABILITI as capability,
      TRUCK as truck_ownership,
      ST_GeogPoint(cast(LONG as FLOAT64), cast(LAT as FLOAT64)) as the_geometry
  from `final-509.musa_vegas_BQ.facilitydata`
  where CITY_CODE = 'CLV'
