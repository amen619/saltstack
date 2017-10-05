include:
  - .docker

{% for image in pillar ["images"]%}
docker_image_{{ image }}:
  docker_image.present:
    - name: {{ image }}
    - require:
        - service: start_docker
{% endfor %}
