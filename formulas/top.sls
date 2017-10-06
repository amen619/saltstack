base:
  '*':
    - timezone
  'os:Ubuntu':
    - match: grain
    - java
    - docker
    - mysite
    - apache2
    - users
