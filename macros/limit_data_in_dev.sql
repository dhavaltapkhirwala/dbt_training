{% macro limit_data_in_dev(column_name,days=3) %}
{% if target.name == 'default' %}
where {{ column_name }} >= date_sub(current_date(), interval {{ days }} day)
{% endif %}
{% endmacro %}