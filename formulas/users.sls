{% for user in pillar ["users"] %}
add_{{ user }}:
  user.present:
    - name: {{ user }}
    - password: mEouWYZktX8uM #password
{% endfor %}

{% for user in pillar ["users"]%}
sshkeys_{{ user }}:
  ssh_auth.present:
    - user: {{ user }}
    - name: {{ pillar ["my_ssh_key_name"]}}
{% endfor %}
