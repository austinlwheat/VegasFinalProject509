from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.dummy import DummyOperator
from datetime import datetime
from pathlib import Path
from pipeline_tools import run_transform_gbq

from . import extract_crimedata
from . import extract_faciliytdata
from . import extract_hospitaldata
from . import load_crimedata
from . import load_facilitydata
from . import load_hospitaldata

with DAG(dag_id='VegasPipeline',
         schedule_interval='@daily',
         start_date=datetime(2021, 11, 29),
         catchup=False) as dag:

    # EXTRACT TASKS ~~~~

    extract_crimedata_task = PythonOperator(
        task_id='extract_crimedata',
        python_callable=extract_crimedata.main,
    )

    extract_facilitydata_task = PythonOperator(
        task_id='extract_faciliytdata',
        python_callable=extract_faciliytdata.main,
    )

    extract_hospitaldata_task = PythonOperator(
        task_id='extract_hospitaldata',
        python_callable=extract_hospitaldata.main,
    )

    # LOAD TASKS ~~~~

    load_crimedata_task = PythonOperator(
        task_id='load_crimedata',
        python_callable=load_crimedata.main,
    )

    load_facilitydata_task = PythonOperator(
        task_id='load_facilitydata',
        python_callable=load_facilitydata.main,
    )

    load_hospitaldata_task = PythonOperator(
        task_id='load_hospitaldata',
        python_callable=load_hospitaldata.main,
    )

    # TRANSFORM TASKS ~~~~

    sql_dir = Path(__file__).parent / 'sql'

    # DEPENDENCIES ~~~~

    extract_crimedata_task >> load_crimedata_task

    extract_faciliytdata >> load_facilitydata_task

    extract_hospitaldata >> load_hospitaldata_task
