install_apache:
  pkg.installed:
    - name: {{pillar["apache2"]["pkg"]}}
    - version: 2.4.18-2ubuntu3.5

run_apache:
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: install_apache
    - watch:
      - file: apache2_conf
      - file: ports_conf

apache2_conf:
  file.managed:
    - name: {{ pillar["apache2"]["apache2confpath"]}}
    - source: salt://apache2/files/apache2.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

ports_conf:
  file.managed:
    - name: {{ pillar["apache2"]["portsconfpath"]}}
    - source: salt://apache2/files/ports.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
