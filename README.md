# SALT PROJECT

## Table of contents

- [Configuration](#configuration)
- [Run](#run)

## Configuration

Edit the file "/etc/salt/master" and update the following paths to where out project is stored. For example if we copy the project to our user home, the paths should be:

- File Roots: it should point to /home/user/salt/formulas (line ~600)

```yaml
file_roots:
  base:
    - /home/administrator/salt/formulas
```

- Pillar Roots: it should point to /home/user/salt/pillar (line ~780)

```yaml
pillar_roots:
  base:
    - /home/administrator/salt/pillar
```

## Run

```shell
$ sudo salt minion state.highstate
```
