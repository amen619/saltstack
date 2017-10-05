docker:
  repo_url: deb [arch={{ grains["osarch"] }}] https://download.docker.com/linux/ubuntu {{ grains ["oscodename"]}} stable
  key_url: https://download.docker.com/linux/ubuntu/gpg
  ce_version: 17.07.0~ce-0~ubuntu
  compose_version: 1.16.1
