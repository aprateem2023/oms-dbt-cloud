{% macro log_start_time() %}
-- Pre-hook macro to log the model's start time in the audit table
ALTER SESSION SET TIMEZONE = 'UTC';
ALTER SESSION SET QUERY_TAG = 'oms_dbt';
INSERT INTO {{ source('audit','model_runs') }} (model_name, run_type, run_timestamp) VALUES ('{{ this }}', 'start', CURRENT_TIMESTAMP)
{% endmacro %}


{% macro log_end_time() %}
-- Post-hook macro to log the model's end time in the audit table
INSERT INTO {{ source('audit','model_runs') }} (model_name, run_type, run_timestamp) VALUES ('{{ this }}', 'end', CURRENT_TIMESTAMP)
{% endmacro %}