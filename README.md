DBT Snowflake.
Connect to snowflake datawarehouse and work on the sample/public datasets

This is the folder structure is the best practices followed for DBT

#### macros: 
    blocks of code that you can be reused multiple times.
#### models: 
    contains SQL queries for transforming, analysing the data
#### images: 
    lineage graph of the project(data transformations from various sources/models)
#### tests: 
    SQL queries to test the models or business requirements
#### docs: 
    documents of the project.
#### dbt_project.yml: 
    All the configuration(paths to various folders) are set in this file.
#### Link: <https://docs.getdbt.com/docs/build/projects>
