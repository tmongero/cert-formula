# This is the main state file for deploying certificates

{% from "cert/map.jinja" import map with context %}

# Install required packages
cert_packages:
  pkg.installed:
    - pkgs:
{% for pkg in map.pkgs %}
      - {{ pkg }}
{% endfor %}

# Deploy certificates
# Place all files in a files_roots/cert, e.g. /srv/salt/files/cert/

{% for name, data in salt['pillar.get']('cert:certlist', {}).items() %}

  {% set deploy_key = data.get('key', True) %}
  {% set cert_file = data.get('cert_file', '{0}.pem'.format(name)) %}
  {% set key_file = data.get('key_file', '{0}.key.pem'.format(name)) %}


{{ map.cert_dir }}/{{ name }}.pem:
  file.managed:
    - source: salt://cert/{{ cert_file }}

  {% if deploy_key == True %}
{{ map.key_dir }}/{{ name }}.key.pem:
  file.managed:
    - source: salt://cert/{{ key_file }}
  {% endif %}

{% endfor %}
