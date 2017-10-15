install_curl:
  pkg.installed:
    - name: curl

install_openssh-server:
  pkg.installed:
    - name: openssh-server

install_ca-certificates:
  pkg.installed:
    - name: ca-certificates

install_postfix:
  pkg.installed:
    - name: postfix

add_gitlab_repository_1:
  pkgrepo.managed:
    - name: deb https://packages.gitlab.com/gitlab/gitlab-ee/ubuntu/ xenial main
    - file: /etc/apt/sources.list.d/gitlab_gitlab-ee.list

add_gitlab_repository_2:
  pkgrepo.managed:
    - name: deb-src https://packages.gitlab.com/gitlab/gitlab-ee/ubuntu/ xenial main
    - file: /etc/apt/sources.list.d/gitlab_gitlab-ee.list
    - require:
      - pkgrepo: add_gitlab_repository_1

install_gitlab:
  pkg.installed:
    - name: gitlab-ee
    - skip_verify: True
    - require:
      - pkgrepo: add_gitlab_repository_2

gitlab_reconfigure:
  cmd.run:
    - name: gitlab-ctl reconfigure
    - require:
      - pkg: install_gitlab
