with subtypetable as(
  select *,
  case when `Type_Description`=' ASLT/BATT NEG INJURY DRIVE-BY SHOOTING' then 'assault by shooting'
       when `Type_Description`=' ASSAULT/BATTERY' then 'assault'
       when `Type_Description`=' ASSAULT/BATTERY WITH A GUN' then 'assault by shooting'
       when `Type_Description`=' ASSAULT/BATTERY WITH OTHER DEADLY WEAPON' then 'assault dead'
       when `Type_Description`=' AUTO BURGLARY' then 'burglary'
       when `Type_Description`=' BURGLARY' then 'burglary'
       when `Type_Description`=' FIGHT' then 'fight'
  when `Type_Description`=' HOMICIDE' then 'homicide'
  when `Type_Description`=' INDECENT EXPOSURE' then 'other'
  when `Type_Description`=' JUVENILE DISTURBANCE' then 'disturbance'
  when `Type_Description`=' LARCENY FROM PERSON (NON ROBBERY)' then 'larceny'

  when `Type_Description`=' MALICIOUS DESTRUCT OF PROP' then 'public property'
  when `Type_Description`=' OTHER DISTURBANCE' then 'disturbance'
  when `Type_Description`=' PERSON WITH A GUN' then 'with weapon'
  when `Type_Description`=' PERSON WITH A KNIFE' then 'with weapon'
  when `Type_Description`=' PERSON WITH OTHER DEADLY WEAPON' then 'with weapon'
  when `Type_Description`=' RECOVERED STOLEN VEHICLE' then 'other'
  when `Type_Description`=' ROBBERY' then 'robbery'

  when `Type_Description`=' STOLEN MOTOR VEHICLE' then 'steal'
  when `Type_Description`='ASLT/BATT NEG INJURY DRIVE-BY SHOOTING' then 'assault by shooting'
  when `Type_Description`='ASSAULT/BATTERY' then 'assault'
  when `Type_Description`='ASSAULT/BATTERY NEGATIVE INJUR' then 'assault'
  when `Type_Description`='ASSAULT/BATTERY W/A GUN' then 'assault by shooting'

  when `Type_Description`='ASSAULT/BATTERY W/OTHER DEADLY' then 'assault dead'
  when `Type_Description`='ASSAULT/BATTERY WITH A GUN' then 'assault by shooting'
  when `Type_Description`='ASSAULT/BATTERY WITH OTHER DEADLY WEAPON' then 'assault dead'

  when `Type_Description`='AUTO BURGLARY' then 'burglary'
  when `Type_Description`='BURGLARY' then 'burglary'
  when `Type_Description`='FIGHT' then 'fight'
  when `Type_Description`='HOMICIDE' then 'homicide'

  when `Type_Description`='INDECENT EXPOSURE' then 'other'
  when `Type_Description`='JUVENILE DISTURBANCE' then 'disturbance'
  when `Type_Description`='LARCENY FROM PERSON (NON ROBBE' then 'larceny'
  when `Type_Description`='LARCENY FROM PERSON (NON ROBBERY)' then 'larceny'
  when `Type_Description`='MALICIOUS DESTRUCT OF PROP' then 'public property'
  when `Type_Description`='MALICIOUS DESTRUCTION OF PROPE' then 'public property'

  when `Type_Description`='None' then 'other'
  when `Type_Description`='OTHER DISTURBANCE' then 'disturbance'
  when `Type_Description`='PERSON WITH A GUN' then 'with weapon'
  when `Type_Description`='PERSON WITH A KNIFE' then 'with weapon'
  when `Type_Description`='PERSON WITH OTHER DEADLY WEAPON' then 'with weapon'
  when `Type_Description`='PERSON WITH/OTHER DEADLY WEAPO' then 'with weapon'

  when `Type_Description`='RECOVERED MOTOR VEHICLE' then 'other'
  when `Type_Description`='RECOVERED STOLEN VEHICLE' then 'other'
  when `Type_Description`='ROBBERY' then 'robbery'
  when `Type_Description`='STOLEN MOTOR VEHICLE' then 'steal'
       else 'other'
       end
       as Subtype
  from musa_vegas_BQ.staging_crimeclean_01)

  select *,
  case when `Subtype`='other' then 'other'
        when `Subtype`='fight' then 'injure'
        when `Subtype`='robbery' then 'property'
        when `Subtype`='burglary' then 'property'
        when `Subtype`='homicide' then 'injure'
        when `Subtype`='assult' then 'injure'
        when `Subtype`='disturbance' then 'property'

  when `Subtype`='assault dead' then 'injure'
        when `Subtype`='with weapon' then 'injure'
        when `Subtype`='steal' then 'property'
        when `Subtype`='assault by shooting' then 'injure'
        when `Subtype`='public property' then 'property'
          when `Subtype`='larceny' then 'property'

     else 'other'
     end
     as Maintype
  from subtypetable
