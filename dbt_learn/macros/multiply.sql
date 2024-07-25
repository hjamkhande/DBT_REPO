{% macro multiply(in_value, in_multiply_val) %}

    {{in_value}}* {{in_multiply_val}} as o_return_val
{{ log("first macro ", info=true)}}
{% set a = 1 %}
{% set b = 2 %}
{% set c = a+b %}
{% set content -%}
 a = {{a}} , b = {{b}} , c={{c}}
 {%- endset %}
 {{ log (content, info=true)}}

{% if b > a %}
{{ log(  b|string   + ' is bigger', info= true) }}
{% else %}
{{  log(    a|string + ' is bigger', info= true) }}
{% endif %}

{% set mylist =["abc","pqr","xyz"] %}
{% for val in mylist %}
{{ log( 'current values is ' + val|string , info= true) }}
{% endfor %}

{% set mydict={1:"abc",2:"pqr",3:"xyz"} %}
{% for k,v in mydict.items() %}
{{ log( " for key "  + k|string + " value is " +v , info= true) }}
{% endfor %}


{% endmacro %}
