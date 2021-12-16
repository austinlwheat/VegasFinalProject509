#####
# Setting environment variable. NOTE: This is not a production-safe practice.
# This is only acceptable because this is a lab.
import os
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'D:/graduate/MUSA509/VegasAirflowTutos/final-509-409489d51842.json'
#####

from pathlib import Path
from pipeline_tools import run_transform_gbq

sql_root = Path(__file__).parent

def main():
    run_transform_gbq('musa_vegas_BQ', 'staging_crimeclean_01', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'staging_crimetype_02', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'staging_crimetime_03', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'num_crime_subtype_04', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'num_crime_maintype_05', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'num_crime_year_06', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'num_crime_month_07', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'num_crime_dayofwk_08', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'num_crime_hourofday_09', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'staging_facilityclean_10', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'staging_hospitalclean_11', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'chartdata', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'crimemapdata', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'group', sql_root)
    run_transform_gbq('musa_vegas_BQ', 'listdata', sql_root)


if __name__ == '__main__':
    main()
