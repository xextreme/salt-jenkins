{% if grains['os'] not in ('Windows',) %}
include:
  - python.pip
{% endif %}

python-etcd:
  pip.installed:
    - name: 'python-etcd==0.4.2'
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
{% if grains['os'] not in ('Windows',) %}
    - require:
      - cmd: pip-install 
{% endif %}

