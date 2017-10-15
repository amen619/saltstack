include:
  - basics.buildessential
  - basics.make

download_latest_redis_stable_version:
  archive.extracted:
    - name: /opt/
    # - source: salt://redis/files/redis-4.0.2.tar.gz
    - source: http://download.redis.io/releases/redis-4.0.2.tar.gz
    - skip_verify: True
    - user: administrator
    - group: administrator
    - require:
      - pkg: instal_build_essentials
      - pkg: install_make

execute_make:
  cmd.run:
    - name: make
    - cwd: /opt/redis-4.0.2/
    - unless: ls /opt/redis-4.0.2/src/ | grep redis-server
    - unless: ls /opt/redis-4.0.2/src/ | grep redis-cli

execute_make_install:
  cmd.run:
    - name: make install
    - cwd: /opt/redis-4.0.2/
    - unless: ls /usr/local/bin/ | grep redis-server
    - unless: ls /usr/local/bin/ | grep redis-cli
