{% macro clean_stale_macro(schema=target.schema, project='extreme-clone-458600-v1', region='region-US', days=1, dry_run=True) %}

    {% set get_drop_commands_query %}
        select 
            'DROP' || ' table' || '`{{ project }}.' || table_schema || '.' || table_name || '`' || ';'
        from `{{ project }}`.`{{ region }}`.INFORMATION_SCHEMA.TABLE_STORAGE
        where table_schema = '{{ schema }}'
        and date(storage_last_modified_time) <= current_date - {{ days }}
    {% endset %}

    {{ log('\nGenerating cleanup queries...\n',info=True) }}
    {% set drop_queries = run_query(get_drop_commands_query).columns[0].values() %}

    {% for query in drop_queries %}
        {% if dry_run %}
            {{ log('Macro executed in dry run mode', info=True)}}
            {{ log(query, info=True) }}    
        {% else %}
            {{ log('Dropping object with command' ~ query, info=True)}}
            {% do run_query(query) %}
        {% endif %}

     {% endfor %}
{% endmacro %}