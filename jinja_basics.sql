-- Jinja is python based templating language 

-- setting and printing a simple variables
{#
{% set my_cool_string = 'wow! cool!'%}
{% set my_second_cool_string = 'wow! this is jinja!'%}
{% set my_cool_number = 100 %}

{{ my_cool_string }} {{ my_second_cool_string}} I want to write Jinja for {{ my_cool_number }} years!

-- setting lists
{% set my_animals = ['lemur', 'wolf', 'panther', 'tardigrade'] %}

{{ my_animals }}

--printing/accessing first element of the list
{{ my_animals[0]}}

--printing/accessing last element of the list
{{ my_animals[-1] }}

--printing/accessing the second element of the list
{{ my_animals[1] }}

{% for animal in my_animals %}

    My favorite animal is {{ animal }}

{% endfor %}


{% set temperature = 75 %}

{% if temperature < 65 %}
    Time for a cappuccino
{% else %}
    Time for a cold brew
{% endif %}

{%- set foods = ['carrot','hotdog','cucumber','bell pepper'] -%}

{% for food in foods -%}
    {%- if food == 'hotdog' -%}
        {% set food_type = 'snack' %}
    {%- else -%}
        {% set food_type = 'vegetable' %}
    {%- endif -%}

The humble {{ food }} is my favorite {{ food_type }}

{% endfor %}
#}

-- Dictionaries

{% set websters_dict =  {
    'word' : 'data',
    'speech_part' : 'noun',
    'definition' : 'if you know you know'
} -%}

{{ websters_dict }}
{{ websters_dict['word'] }} ({{ websters_dict['speech_part'] }}): defined as "{{ websters_dict['definition'] }}"




