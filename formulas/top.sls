base:
  '*':
    - timezone
  'os:Ubuntu':
    - match: grain
    - apache2
    - basics
    - cassandra
    - docker
    # - gitlab
    - java
    - mysite
    - redis
    - users
