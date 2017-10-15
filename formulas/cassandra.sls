include:
  - java
  - basics.python

add_cassandra_repository:
  pkgrepo.managed:
    - name: deb http://www.apache.org/dist/cassandra/debian 311x main
    - file: /etc/apt/sources.list.d/cassandra.sources.list
    - key_url: https://www.apache.org/dist/cassandra/KEYS

install_cassandra:
  pkg.installed:
    - name: cassandra
    - require:
      - pkg: install_jdk
      - pkg: install_python_pip

start_cassandra:
    service.running:
        - name: cassandra
        - require:
          - pkg: install_cassandra
