{% macro grant_select(project='extreme-clone-458600-v1' ,schema=target.schema, user='dhavaltapkhirwala@gmail.com') %}

    {% set query %}
        grant `roles/bigquery.dataViewer` on schema `{{ project }}`.{{ schema }} to 'user:{{ user }}';

    {% endset %}
    {{ log('Granting select on tables and views in schema' ~ project ~'.'~schema ~ 'to user' ~ user, info=True) }}
    {% do run_query(query) %}
    {{ log('Privilieges granted', info=True)}}

{% endmacro %}