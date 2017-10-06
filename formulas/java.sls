install_jdk:
  pkg.installed:
    - name: openjdk-8-jdk

set_java_home:
  file.append:
    - name: /etc/environment
    - text: JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
    - require:
      - pkg: install_jdk
