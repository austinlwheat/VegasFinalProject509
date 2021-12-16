select Year,
     count(Maintype='property' or null) as property,
     count(Maintype='injure' or null) as injury,
     count(Maintype) as intotal
   FROM musa_vegas_BQ.staging_crimetime_03
   GROUP BY Year
