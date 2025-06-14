{% test assert_dollars_spent_greater_than_one(model,column_name,group_by_column)%}

select 
    {{ group_by_column}},
    avg({{ column_name }}) as average_amount
from {{ model }}
group by {{ group_by_column }}
having count({{ group_by_column }}) > 1 and average_amount < 1

{% endtest %}