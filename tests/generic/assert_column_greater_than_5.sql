{%test assert_column_greater_than_5(model,column_name) %}

select 
    {{column_name}}
from {{ model}}
where {{column_name}} <=5 

{% endtest %}