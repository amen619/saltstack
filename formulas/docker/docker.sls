include:
  - users
  - basics.python

add_docker_repository:
  pkgrepo.managed:
    - name: {{ pillar ["docker"]["repo_url"] }}
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: {{ pillar ["docker"]["key_url"] }}

install_docker_ce:
  pkg.installed:
    - name: docker-ce
    - version: {{ pillar ["docker"]["ce_version"] }}
    - require:
      - pkgrepo: add_docker_repository

# Run docker without sudo privileges
{% for user in pillar ["users"] %}
add_user_{{ user }}_to_docker_group:
  group.present:
    - name: docker
    - addusers:
      - {{ user }}
{% endfor %}

install_docker_compose:
  pip.installed:
    - name: docker-compose >= {{ pillar ["docker"]["compose_version"] }}, <= {{ pillar ["docker"]["compose_version"] }}
    - require:
      - pkg: install_docker_ce
      - pkg: install_python_pip

start_docker:
    service.running:
        - name: docker
        - watch:
            - pkg: install_docker_ce
