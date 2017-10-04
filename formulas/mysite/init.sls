include:
  - apache2

mysite_site:
  file.recurse:
    - name: {{ pillar ["mysite"]["wwwpath"] }}
    - source: salt://mysite/files/mysite/
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644

mysite_conf:
  file.managed:
    - name: {{ pillar ["mysite"]["mysiteconfpath"]}}
    - source: salt://mysite/files/mysite.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: mysite_site

mysite_enable_site:
  apache_site.enabled:
    - name: mysite
    - require:
      - file: mysite_conf
    - watch_in:
      - service: run_apache
