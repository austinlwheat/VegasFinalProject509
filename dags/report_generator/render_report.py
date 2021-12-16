#####
# Setting environment variable. NOTE: This is not a production-safe practice.
# This is only acceptable because this is a lab.
import os
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'D:/graduate/MUSA509/VegasAirflowTutos/final-509-409489d51842.json'
#####

import geopandas as gpd
import pandas as pd
from pathlib import Path
from jinja2 import Environment, FileSystemLoader

template_root = Path(__file__).parent / 'template'
output_root = Path(__file__).parent.parent / 'output'

def main():
    # Download the firestation data.
    mapdata_df = pd.read_gbq('SELECT * FROM musa_vegas_BQ.staging_facilityclean_10')
    mapdata_df.the_geometry = gpd.GeoSeries.from_wkt(mapdata_df.the_geometry)
    mapdata_gdf = gpd.GeoDataFrame(mapdata_df, geometry='the_geometry')

    # Download the crime data.
    mapdata_df1 = pd.read_gbq('SELECT * FROM musa_vegas_BQ.crimemapdata')
    mapdata_df1.the_geometry = gpd.GeoSeries.from_wkt(mapdata_df1.the_geometry)
    mapdata_gdf1 = gpd.GeoDataFrame(mapdata_df1, geometry='the_geometry')

    #mapdata_df2 = pd.read_gbq('SELECT * FROM musa_vegas_BQ.group')
    #mapdata_df2.the_geometry = gpd.GeoSeries.from_wkt(mapdata_df2.geometry)
    #mapdata_gdf2 = gpd.GeoDataFrame(mapdata_df2, geometry='geometry')


    # Download the chart data.
    chartdata_df = pd.read_gbq('SELECT * from musa_vegas_BQ.num_crime_dayofwk_08')
    chartdata01_df = pd.read_gbq('SELECT * from musa_vegas_BQ.num_crime_hourofday_09')
    chartdata02_df = pd.read_gbq('SELECT * from musa_vegas_BQ.chartdata')
    typecountsdata_df = pd.read_gbq('SELECT * from musa_vegas_BQ.num_crime_subtype_04')
    # Download the population density list data.
    listdata_df = pd.read_gbq('SELECT * from musa_vegas_BQ.listdata')

    # Render the data into the template.
    env = Environment(loader=FileSystemLoader(template_root))
    template = env.get_template('index.html')
    output = template.render(
        # TEMPLATE DATA GOES HERE...
        mapdata=mapdata_gdf.to_json(),
        mapdata1=mapdata_gdf1.to_json(),
        #mapdata2=mapdata_gdf2.to_json(),
        chartdata=chartdata_df.to_dict('list'),
        chartdata01=chartdata01_df.to_dict('list'),
        chartdata02=chartdata02_df.to_dict('list'),
        typecountsdata=typecountsdata_df.to_dict('list'),
        listdata=listdata_df.to_dict('records'),
    )

    # Save the rendered output to a file in the "output" folder.
    with open(output_root / 'index.html', mode='w') as outfile:
        outfile.write(output)

if __name__ == '__main__':
    main()
