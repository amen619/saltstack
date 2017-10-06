my_orchestrate:
  salt.state:
    - tgt: 'os:Ubuntu'
    - tgt_type: grain
    - sls:
      - timezone
      - users
