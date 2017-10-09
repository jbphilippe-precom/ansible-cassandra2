{% for host in groups['all'] %}
{{ hostvars[host][cassandra_interface_prod]['ipv4']['address'] }}={{ hostvars[host].localisation_dc }}:RAC1
{% endfor %}

default=DEF:RAC1
