{{ config(
    materialized='table'
)
}}
select '{{this}}'::VARCHAR(100) as model_name , 'start' as run_type , CURRENT_TIMESTAMP as run_timestamp