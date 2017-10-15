base:
  '*':
    - timezone
  'os:Ubuntu':
    - match: grain
    - apache2
    - docker
    - java
    - mysite
    - redis
    - users
